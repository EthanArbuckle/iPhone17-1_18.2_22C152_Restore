@interface HPSBetaEnrollmentStateChangeResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HPSBetaEnrollmentStateChangeResponse)init;
- (HPSBetaEnrollmentStateChangeResponse)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HPSBetaEnrollmentStateChangeResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HPSBetaEnrollmentStateChangeResponse)initWithCoder:(id)a3
{
  return (HPSBetaEnrollmentStateChangeResponse *)sub_23D183360(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  BetaEnrollment.StateChangeResponse.encode(with:)((NSCoder)v4);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_23D2458B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = BetaEnrollment.StateChangeResponse.isEqual(_:)((uint64_t)v8);

  sub_23D16FA88((uint64_t)v8);
  return v6;
}

- (HPSBetaEnrollmentStateChangeResponse)init
{
}

- (void).cxx_destruct
{
}

@end