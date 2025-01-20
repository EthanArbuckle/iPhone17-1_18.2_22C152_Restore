@interface HPSBetaEnrollmentIdentifyRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HPSBetaEnrollmentIdentifyRequest)init;
- (HPSBetaEnrollmentIdentifyRequest)initWithCoder:(id)a3;
@end

@implementation HPSBetaEnrollmentIdentifyRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HPSBetaEnrollmentIdentifyRequest)init
{
  return (HPSBetaEnrollmentIdentifyRequest *)BetaEnrollment.IdentifyRequest.init()();
}

- (HPSBetaEnrollmentIdentifyRequest)initWithCoder:(id)a3
{
  return (HPSBetaEnrollmentIdentifyRequest *)BetaEnrollment.IdentifyRequest.init(coder:)(a3);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_23D2458B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = BetaEnrollment.IdentifyRequest.isEqual(_:)((uint64_t)v8);

  sub_23D16FA88((uint64_t)v8);
  return v6 & 1;
}

@end