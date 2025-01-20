@interface COAlarmDeleteEvent
+ (BOOL)supportsSecureCoding;
- (COAlarmDeleteEvent)initWithCoder:(id)a3;
- (COAlarmDeleteEvent)initWithIdentifier:(id)a3 date:(id)a4;
- (NSDate)date;
- (NSUUID)identifier;
- (int64_t)compare:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation COAlarmDeleteEvent

- (COAlarmDeleteEvent)initWithIdentifier:(id)a3 date:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)COAlarmDeleteEvent;
  v9 = [(COAlarmDeleteEvent *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_date, a4);
  }

  return v10;
}

- (COAlarmDeleteEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)COAlarmDeleteEvent;
  v5 = [(COAlarmDeleteEvent *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(COAlarmDeleteEvent *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  id v6 = [(COAlarmDeleteEvent *)self date];
  [v4 encodeObject:v6 forKey:@"date"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [(COAlarmDeleteEvent *)self date];
  id v6 = [v4 date];

  int64_t v7 = [v5 compare:v6];
  return v7;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end