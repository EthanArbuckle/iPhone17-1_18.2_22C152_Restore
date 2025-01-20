@interface AFCreateAlarmResponse
+ (BOOL)supportsSecureCoding;
- (AFCreateAlarmResponse)initWithCoder:(id)a3;
- (NSString)alarmIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setAlarmIdentifier:(id)a3;
@end

@implementation AFCreateAlarmResponse

- (void).cxx_destruct
{
}

- (void)setAlarmIdentifier:(id)a3
{
}

- (NSString)alarmIdentifier
{
  return self->_alarmIdentifier;
}

- (AFCreateAlarmResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFCreateAlarmResponse;
  v5 = [(AFSiriResponse *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AlarmIdentifier"];
    alarmIdentifier = v5->_alarmIdentifier;
    v5->_alarmIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AFCreateAlarmResponse;
  id v4 = a3;
  [(AFSiriResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_alarmIdentifier, @"AlarmIdentifier", v5.receiver, v5.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end