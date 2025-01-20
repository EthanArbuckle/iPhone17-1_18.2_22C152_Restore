@interface StoreAndForwardStatusInternal
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC15ProximityReader29StoreAndForwardStatusInternal)init;
- (_TtC15ProximityReader29StoreAndForwardStatusInternal)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation StoreAndForwardStatusInternal

+ (BOOL)supportsSecureCoding
{
  return byte_26826A5C0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_26826A5C0 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  StoreAndForwardStatusInternal.encode(with:)((NSCoder)v4);
}

- (_TtC15ProximityReader29StoreAndForwardStatusInternal)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader29StoreAndForwardStatusInternal *)StoreAndForwardStatusInternal.init(coder:)(a3);
}

- (_TtC15ProximityReader29StoreAndForwardStatusInternal)init
{
  result = (_TtC15ProximityReader29StoreAndForwardStatusInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC15ProximityReader29StoreAndForwardStatusInternal_expiry;
  uint64_t v4 = sub_2289152F0();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end