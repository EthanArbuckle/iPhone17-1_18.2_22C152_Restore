@interface DNDFMDevice
- (BOOL)isThisDevice;
- (NSString)deviceName;
- (_TtC18DoNotDisturbServer11DNDFMDevice)init;
@end

@implementation DNDFMDevice

- (NSString)deviceName
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D3118198();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)isThisDevice
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC18DoNotDisturbServer11DNDFMDevice_isThisDevice);
}

- (_TtC18DoNotDisturbServer11DNDFMDevice)init
{
  result = (_TtC18DoNotDisturbServer11DNDFMDevice *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end