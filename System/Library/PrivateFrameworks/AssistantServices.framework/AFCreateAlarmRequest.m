@interface AFCreateAlarmRequest
+ (BOOL)supportsSecureCoding;
- (AFCreateAlarmRequest)initWithCoder:(id)a3;
- (STAlarm)alarm;
- (id)createResponse;
- (void)encodeWithCoder:(id)a3;
- (void)setAlarm:(id)a3;
@end

@implementation AFCreateAlarmRequest

- (void).cxx_destruct
{
}

- (void)setAlarm:(id)a3
{
}

- (STAlarm)alarm
{
  return self->_alarm;
}

- (AFCreateAlarmRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFCreateAlarmRequest;
  v5 = [(AFSiriRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Alarm"];
    alarm = v5->_alarm;
    v5->_alarm = (STAlarm *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AFCreateAlarmRequest;
  id v4 = a3;
  [(AFSiriRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_alarm, @"Alarm", v5.receiver, v5.super_class);
}

- (id)createResponse
{
  id v2 = [(AFSiriResponse *)[AFCreateAlarmResponse alloc] _initWithRequest:self];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end