@interface BetaEnrollment.StateUpdatedResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_TtCO15HomePodSettings14BetaEnrollment20StateUpdatedResponse)init;
- (_TtCO15HomePodSettings14BetaEnrollment20StateUpdatedResponse)initWithCoder:(id)a3;
@end

@implementation BetaEnrollment.StateUpdatedResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtCO15HomePodSettings14BetaEnrollment20StateUpdatedResponse)init
{
  return (_TtCO15HomePodSettings14BetaEnrollment20StateUpdatedResponse *)BetaEnrollment.StateUpdatedResponse.init()();
}

- (_TtCO15HomePodSettings14BetaEnrollment20StateUpdatedResponse)initWithCoder:(id)a3
{
  return (_TtCO15HomePodSettings14BetaEnrollment20StateUpdatedResponse *)sub_23D184290(a3);
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
  char v6 = BetaEnrollment.StateUpdatedResponse.isEqual(_:)((uint64_t)v8);

  sub_23D16FA88((uint64_t)v8);
  return v6 & 1;
}

@end