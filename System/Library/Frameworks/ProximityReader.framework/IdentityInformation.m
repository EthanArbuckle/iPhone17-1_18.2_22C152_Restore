@interface IdentityInformation
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC15ProximityReader19IdentityInformation)init;
- (_TtC15ProximityReader19IdentityInformation)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IdentityInformation

- (_TtC15ProximityReader19IdentityInformation)init
{
  result = (_TtC15ProximityReader19IdentityInformation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22880BB6C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15ProximityReader19IdentityInformation_portraitData), *(void *)&self->portraitData[OBJC_IVAR____TtC15ProximityReader19IdentityInformation_portraitData]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

+ (BOOL)supportsSecureCoding
{
  return byte_268268320;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_268268320 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  IdentityInformation.encode(with:)((NSCoder)v4);
}

- (_TtC15ProximityReader19IdentityInformation)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader19IdentityInformation *)IdentityInformation.init(coder:)(a3);
}

@end