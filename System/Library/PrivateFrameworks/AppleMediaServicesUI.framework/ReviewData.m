@interface ReviewData
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC20AppleMediaServicesUI10ReviewData)init;
- (_TtC20AppleMediaServicesUI10ReviewData)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ReviewData

+ (BOOL)supportsSecureCoding
{
  return static ReviewData.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21C2941BC(v4);
}

- (_TtC20AppleMediaServicesUI10ReviewData)initWithCoder:(id)a3
{
  return (_TtC20AppleMediaServicesUI10ReviewData *)ReviewData.init(coder:)(a3);
}

- (_TtC20AppleMediaServicesUI10ReviewData)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end