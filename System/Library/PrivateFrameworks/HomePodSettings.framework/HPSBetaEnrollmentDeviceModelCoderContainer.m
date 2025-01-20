@interface HPSBetaEnrollmentDeviceModelCoderContainer
+ (BOOL)supportsSecureCoding;
- (HPSBetaEnrollmentDeviceModelCoderContainer)init;
- (HPSBetaEnrollmentDeviceModelCoderContainer)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HPSBetaEnrollmentDeviceModelCoderContainer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HPSBetaEnrollmentDeviceModelCoderContainer)init
{
  return (HPSBetaEnrollmentDeviceModelCoderContainer *)sub_23D1A5C0C();
}

- (HPSBetaEnrollmentDeviceModelCoderContainer)initWithCoder:(id)a3
{
  return (HPSBetaEnrollmentDeviceModelCoderContainer *)sub_23D1A5C84(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23D1A5DFC(v4);
}

@end