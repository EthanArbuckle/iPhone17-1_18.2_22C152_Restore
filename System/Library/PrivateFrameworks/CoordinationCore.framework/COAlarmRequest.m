@interface COAlarmRequest
+ (BOOL)supportsSecureCoding;
- (COAlarmRequest)initWithAlarm:(id)a3;
- (COAlarmRequest)initWithCoder:(id)a3;
- (MTAlarm)alarm;
- (void)encodeWithCoder:(id)a3;
@end

@implementation COAlarmRequest

- (COAlarmRequest)initWithAlarm:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COAlarmRequest;
  v5 = [(COMeshCommand *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    alarm = v5->_alarm;
    v5->_alarm = (MTAlarm *)v6;
  }
  return v5;
}

- (COAlarmRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COAlarmRequest;
  v5 = [(COMeshCommand *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alarm"];
    alarm = v5->_alarm;
    v5->_alarm = (MTAlarm *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)COAlarmRequest;
  id v4 = a3;
  [(COMeshCommand *)&v6 encodeWithCoder:v4];
  v5 = [(COAlarmRequest *)self alarm];
  [v4 encodeObject:v5 forKey:@"alarm"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MTAlarm)alarm
{
  return self->_alarm;
}

- (void).cxx_destruct
{
}

@end