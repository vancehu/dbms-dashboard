CREATE TABLE zipcode(zipcode CHAR(5) NOT NULL, city CHAR(20) NOT NULL, state CHAR(2) NOT NULL, PRIMARY KEY(zipcode));
CREATE TABLE customer(cid INTEGER(8) Zerofill AUTO_INCREMENT, cname CHAR(20) NOT NULL, zipcode CHAR(5) NOT NULL, street CHAR(40) NOT NULL, PRIMARY KEY(cid), FOREIGN KEY(zipcode) REFERENCES zipcode(zipcode));
CREATE TABLE business_category(b_cid INTEGER(8) Zerofill AUTO_INCREMENT, b_cname CHAR(40) NOT NULL, PRIMARY KEY(b_cid));
CREATE TABLE business_customer(cid INTEGER(8) Zerofill NOT NULL, annual_income REAL NOT NULL, b_cid INTEGER(8) Zerofill NOT NULL, PRIMARY KEY(cid), FOREIGN KEY(cid) REFERENCES customer(cid) ON DELETE CASCADE, FOREIGN KEY(b_cid) REFERENCES business_category(b_cid));
CREATE TABLE home_customer(cid INTEGER(8) Zerofill NOT NULL, is_married TINYINT(1) NOT NULL, gender TINYINT(1) NOT NULL, age INTEGER(3) NOT NULL, salary REAL NOT NULL, PRIMARY KEY(cid), FOREIGN KEY(cid) REFERENCES customer(cid) ON DELETE CASCADE);
CREATE TABLE product_category(p_cid INTEGER(8) Zerofill AUTO_INCREMENT, p_cname CHAR(40) NOT NULL, PRIMARY KEY(p_cid));
CREATE TABLE product(pid INTEGER(8) Zerofill AUTO_INCREMENT, pname CHAR(20) NOT NULL, price REAL NOT NULL, p_cid INTEGER(8) Zerofill, quantity INTEGER(8) NOT NULL, PRIMARY KEY(pid), FOREIGN KEY(p_cid) REFERENCES product_category(p_cid));
CREATE TABLE region(rid INTEGER(8) Zerofill AUTO_INCREMENT, rname CHAR(40) NOT NULL, PRIMARY KEY(rid));
CREATE TABLE store(sid INTEGER(8) Zerofill AUTO_INCREMENT, zipcode CHAR(5) NOT NULL, street CHAR(40) NOT NULL, rid INTEGER(8) Zerofill NOT NULL, PRIMARY KEY(sid), FOREIGN KEY(rid) REFERENCES region(rid), FOREIGN KEY(zipcode) REFERENCES zipcode(zipcode));
CREATE TABLE job_title(jid INTEGER(8) Zerofill AUTO_INCREMENT, title CHAR(40) NOT NULL, PRIMARY KEY(jid));
CREATE TABLE employee(eid INTEGER(8) Zerofill AUTO_INCREMENT, ename CHAR(20) NOT NULL, salary REAL NOT NULL, jid INTEGER(8) Zerofill NOT NULL, email CHAR(30) NOT NULL, zipcode CHAR(5) NOT NULL, street CHAR(40) NOT NULL, sid INTEGER(8) Zerofill NOT NULL, PRIMARY KEY(eid), FOREIGN KEY(jid) REFERENCES job_title(jid), FOREIGN KEY (sid) REFERENCES store(sid), FOREIGN KEY(zipcode)REFERENCES zipcode(zipcode));
CREATE TABLE transact_add(order_id INTEGER(8) Zerofill AUTO_INCREMENT, order_time TIMESTAMP, quantity INTEGER(8) NOT NULL, pid INTEGER(8) Zerofill NOT NULL, eid INTEGER(8) Zerofill NOT NULL, PRIMARY KEY(order_id), FOREIGN KEY(eid) REFERENCES employee(eid), FOREIGN KEY (pid) REFERENCES product(pid));
CREATE TABLE transact_sell(order_id INTEGER(8) Zerofill AUTO_INCREMENT, order_time TIMESTAMP, quantity INTEGER(8) NOT NULL, cid INTEGER(8) Zerofill NOT NULL, pid INTEGER(8) Zerofill NOT NULL, eid INTEGER(8) Zerofill NOT NULL, PRIMARY KEY(order_id), FOREIGN KEY(cid)REFERENCES customer(cid), FOREIGN KEY (pid) REFERENCES product(pid), FOREIGN KEY(eid) REFERENCES employee(eid));
CREATE TABLE store_manager(eid INTEGER(8) Zerofill NOT NULL, sid INTEGER(8) Zerofill NOT NULL, PRIMARY KEY(sid), FOREIGN KEY(eid)REFERENCES employee(eid), FOREIGN KEY(sid)REFERENCES store(sid));
CREATE TABLE region_manager(eid INTEGER(8) Zerofill, rid INTEGER(8) Zerofill NOT NULL, PRIMARY KEY(rid), FOREIGN KEY(eid)REFERENCES employee(eid), FOREIGN KEY(rid)REFERENCES region(rid));