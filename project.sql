use project;
/*==============================================
First, use SELECT * from both tables and use your knowledge of queries and aggregate functions to get to know the data: 
==============================================*/
-- select * from users;
-- select * from progress;

/*==============================================
 What are the Top 25 schools (.edu domains)? 
 ==============================================*/
-- select email_domain from users 
-- where email_domain like "%.edu%" 
-- order by email_domain
-- limit 25;

/*==============================================
How users many .edu learners are located in New York? 
==============================================*/
-- select count(*) 
-- from users 
-- where email_domain like "%.edu%" 
-- and city='New York';

/*============================================== 
The mobile_app column contains either mobile-user or NULL. How many of these Codecademy learners are using the mobile app? 
==============================================*/
 -- select count(*) 
--  from users 
--  where mobile_app = "mobile-user" ; 
/*============================================== 
The data type of the sign_up_at column is DATETIME. It is for storing a date/time value in the database.

Notice that the values are formatted like:

2015-01-01 18:33:52

So the format is:

YYYY-MM-DD HH:MM:SS

SQLite comes with a strftime() function - a very powerful function that allows you to return a formatted date.

It takes two arguments:

strftime(format, column)

Let’s test this function out:
SELECT sign_up_at,
   strftime('%S', sign_up_at)
FROM users
GROUP BY 1
LIMIT 20;

Now, using this function, query for the sign up counts for each hour.

Open in the hints for more info.
==============================================
*/
--  SELECT sign_up_at,
--    strftime('%S', sign_up_at)
-- FROM users
-- GROUP BY 1
-- LIMIT 20;

-- SELECT strftime('%Y-%m-%d %H:00:00', sign_up_at) AS hour, COUNT(*) AS sign_up_count
-- FROM users
-- GROUP BY hour
-- ORDER BY hour;
-- SELECT strftime('%Y-%m-%d %H:00:00', sign_up_at) AS signup_hour,
--        COUNT(*) AS signups_count
-- FROM users
-- GROUP BY strftime('%Y-%m-%d %H', sign_up_at)
-- ORDER BY signup_hour;

/*==============================================
Join the two tables using JOIN and then see what you can dig out of the data!

Do different schools (.edu domains) prefer different courses?
==============================================*/
-- select * 
-- from users 
-- join progress 
-- on users.user_id = progress.user_id 
-- where email_domain like "%.edu%";

/*==============================================
What courses are the New Yorkers students taking?
==============================================*/
-- select * from users 
-- join progress 
-- on users.user_id = progress.user_id 
-- where city="New York";

/*==============================================
What courses are the Chicago students taking?
==============================================*/
-- select * from users 
-- join progress 
-- on users.user_id = progress.user_id 
-- where city="Chicago";