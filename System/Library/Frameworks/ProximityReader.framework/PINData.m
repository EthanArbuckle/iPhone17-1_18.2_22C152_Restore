@interface PINData
+ (BOOL)supportsSecureCoding;
- (_TtC15ProximityReader7PINData)init;
- (_TtC15ProximityReader7PINData)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PINData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  PINData.encode(with:)((NSCoder)v4);
}

- (_TtC15ProximityReader7PINData)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader7PINData *)PINData.init(coder:)(a3);
}

- (_TtC15ProximityReader7PINData)init
{
  result = (_TtC15ProximityReader7PINData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end