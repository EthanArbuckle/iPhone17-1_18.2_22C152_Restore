@interface VASMerchantInternal
+ (BOOL)supportsSecureCoding;
- (_TtC15ProximityReader19VASMerchantInternal)init;
- (_TtC15ProximityReader19VASMerchantInternal)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VASMerchantInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  VASMerchantInternal.encode(with:)((NSCoder)v4);
}

- (_TtC15ProximityReader19VASMerchantInternal)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader19VASMerchantInternal *)VASMerchantInternal.init(coder:)(a3);
}

- (_TtC15ProximityReader19VASMerchantInternal)init
{
  result = (_TtC15ProximityReader19VASMerchantInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end