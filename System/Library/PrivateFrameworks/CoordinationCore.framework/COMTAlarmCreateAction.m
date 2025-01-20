@interface COMTAlarmCreateAction
+ (BOOL)supportsSecureCoding;
- (COMTAlarmCreateAction)initWithAlarm:(id)a3;
- (COMTAlarmCreateAction)initWithCoder:(id)a3;
- (MTAlarm)alarm;
- (void)encodeWithCoder:(id)a3;
@end

@implementation COMTAlarmCreateAction

- (COMTAlarmCreateAction)initWithAlarm:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COMTAlarmCreateAction;
  v5 = [(COMTAction *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    alarm = v5->_alarm;
    v5->_alarm = (MTAlarm *)v6;
  }
  return v5;
}

- (COMTAlarmCreateAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)COMTAlarmCreateAction;
  v5 = [(COMTAction *)&v11 initWithCoder:v4];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CA"];
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = [(COMTAlarmCreateAction *)v6 copy];
    alarm = v5->_alarm;
    v5->_alarm = (MTAlarm *)v8;

LABEL_4:
    v7 = v5;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)COMTAlarmCreateAction;
  id v4 = a3;
  [(COMTAction *)&v6 encodeWithCoder:v4];
  v5 = [(COMTAlarmCreateAction *)self alarm];
  [v4 encodeObject:v5 forKey:@"CA"];
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