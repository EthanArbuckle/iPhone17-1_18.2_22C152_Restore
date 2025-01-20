@interface PINConfiguration
+ (BOOL)supportsSecureCoding;
- (_TtC15ProximityReader16PINConfiguration)init;
- (_TtC15ProximityReader16PINConfiguration)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PINConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  PINConfiguration.encode(with:)((NSCoder)v4);
}

- (_TtC15ProximityReader16PINConfiguration)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader16PINConfiguration *)PINConfiguration.init(coder:)(a3);
}

- (_TtC15ProximityReader16PINConfiguration)init
{
  result = (_TtC15ProximityReader16PINConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
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