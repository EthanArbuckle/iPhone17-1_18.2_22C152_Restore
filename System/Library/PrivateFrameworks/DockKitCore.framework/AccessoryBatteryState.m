@interface AccessoryBatteryState
+ (BOOL)supportsSecureCoding;
- (_TtC11DockKitCore21AccessoryBatteryState)init;
- (_TtC11DockKitCore21AccessoryBatteryState)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AccessoryBatteryState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  AccessoryBatteryState.encode(with:)((NSCoder)v4);
}

- (_TtC11DockKitCore21AccessoryBatteryState)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC11DockKitCore21AccessoryBatteryState *)sub_24CE3E9F8();

  return v4;
}

- (_TtC11DockKitCore21AccessoryBatteryState)init
{
  result = (_TtC11DockKitCore21AccessoryBatteryState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end