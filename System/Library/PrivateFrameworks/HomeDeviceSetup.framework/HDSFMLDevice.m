@interface HDSFMLDevice
- (BOOL)isThisDevice;
- (NSString)deviceName;
- (_TtC15HomeDeviceSetup12HDSFMLDevice)init;
@end

@implementation HDSFMLDevice

- (NSString)deviceName
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_23EBBB2B0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)isThisDevice
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC15HomeDeviceSetup12HDSFMLDevice_isThisDevice);
}

- (_TtC15HomeDeviceSetup12HDSFMLDevice)init
{
  result = (_TtC15HomeDeviceSetup12HDSFMLDevice *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end