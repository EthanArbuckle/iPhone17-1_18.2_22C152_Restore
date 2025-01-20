@interface GeneralSettingsPointerDeviceManager
- (_TtC22GeneralSettingsIntents35GeneralSettingsPointerDeviceManager)init;
- (void)mousePointerDevicesDidConnect:(id)a3;
- (void)mousePointerDevicesDidDisconnect:(id)a3;
@end

@implementation GeneralSettingsPointerDeviceManager

- (_TtC22GeneralSettingsIntents35GeneralSettingsPointerDeviceManager)init
{
  return (_TtC22GeneralSettingsIntents35GeneralSettingsPointerDeviceManager *)sub_10000B454();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)mousePointerDevicesDidConnect:(id)a3
{
  sub_10000B1E8(0, &qword_10001CA20);
  sub_100009DE8();
  sub_100011BA0();
  v4 = self;
  sub_10000B600();

  swift_bridgeObjectRelease();
}

- (void)mousePointerDevicesDidDisconnect:(id)a3
{
  sub_10000B1E8(0, &qword_10001CA20);
  sub_100009DE8();
  uint64_t v4 = sub_100011BA0();
  swift_beginAccess();
  v5 = self;
  sub_10000CACC(v4);
  swift_endAccess();

  swift_bridgeObjectRelease();
}

@end