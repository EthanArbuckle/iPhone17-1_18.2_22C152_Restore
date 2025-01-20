@interface ReviewLockupDetails
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC20AppleMediaServicesUI19ReviewLockupDetails)init;
- (_TtC20AppleMediaServicesUI19ReviewLockupDetails)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ReviewLockupDetails

+ (BOOL)supportsSecureCoding
{
  return static ReviewLockupDetails.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21C2A200C(v4);
}

- (_TtC20AppleMediaServicesUI19ReviewLockupDetails)initWithCoder:(id)a3
{
  return (_TtC20AppleMediaServicesUI19ReviewLockupDetails *)ReviewLockupDetails.init(coder:)(a3);
}

- (_TtC20AppleMediaServicesUI19ReviewLockupDetails)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end