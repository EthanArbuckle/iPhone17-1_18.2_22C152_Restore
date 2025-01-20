@interface USBDevice
- (_TtC9AUASDCore9USBDevice)initWithBoxUID:(id)a3 withPlugin:(id)a4;
@end

@implementation USBDevice

- (_TtC9AUASDCore9USBDevice)initWithBoxUID:(id)a3 withPlugin:(id)a4
{
  id v4 = a4;
  result = (_TtC9AUASDCore9USBDevice *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1000541C0(*(void *)&self->ASDBox_opaque[OBJC_IVAR____TtC9AUASDCore9USBDevice_hrlConfig], *(void *)&self->speed[OBJC_IVAR____TtC9AUASDCore9USBDevice_hrlConfig]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v3 = *(void **)&self->ASDBox_opaque[OBJC_IVAR____TtC9AUASDCore9USBDevice_timeCorrelater];
}

@end