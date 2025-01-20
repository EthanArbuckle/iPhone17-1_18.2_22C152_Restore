@interface ASUIDevice
- (NSString)description;
- (_TtC16AccessorySetupUI10ASUIDevice)init;
@end

@implementation ASUIDevice

- (NSString)description
{
  v2 = self;
  sub_10002DC78();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC16AccessorySetupUI10ASUIDevice)init
{
  result = (_TtC16AccessorySetupUI10ASUIDevice *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  NSString v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_image);
}

@end