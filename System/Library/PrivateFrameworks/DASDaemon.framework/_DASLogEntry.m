@interface _DASLogEntry
+ (id)logEntryForDate:(id)a3 category:(id)a4 message:(id)a5;
- (NSDate)date;
- (NSString)category;
- (NSString)message;
- (id)description;
- (void)setCategory:(id)a3;
- (void)setDate:(id)a3;
- (void)setMessage:(id)a3;
@end

@implementation _DASLogEntry

+ (id)logEntryForDate:(id)a3 category:(id)a4 message:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)objc_opt_class());
  [v10 setDate:v9];

  [v10 setCategory:v8];
  [v10 setMessage:v7];

  return v10;
}

- (id)description
{
  v3 = defaultFormatter();
  v4 = NSString;
  v5 = [v3 stringFromDate:self->_date];
  v6 = [v4 stringWithFormat:@"%@ %@: %@", v5, self->_category, self->_message];

  return v6;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end