@interface COMTAlarmCreateResult
+ (BOOL)supportsSecureCoding;
- (COMTAlarmCreateResult)initWithActionIdentifier:(id)a3;
- (COMTAlarmCreateResult)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation COMTAlarmCreateResult

- (COMTAlarmCreateResult)initWithActionIdentifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)COMTAlarmCreateResult;
  return [(COMTResult *)&v4 initWithActionIdentifier:a3];
}

- (COMTAlarmCreateResult)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)COMTAlarmCreateResult;
  return [(COMTResult *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)COMTAlarmCreateResult;
  [(COMTResult *)&v3 encodeWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end