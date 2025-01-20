@interface SettingsCarManager
- (_TtC12AutoSettings18SettingsCarManager)init;
- (void)accessoryDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
- (void)carDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
- (void)carDidUpdateAccessories:(id)a3;
- (void)carManager:(id)a3 didRemove:(id)a4;
- (void)carManager:(id)a3 didUpdateCurrentCar:(id)a4;
- (void)dismissSettingsModal;
- (void)historicalNotificationService:(id)a3 didUpdateTimestamp:(id)a4;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)sessionDidConnect:(id)a3;
@end

@implementation SettingsCarManager

- (_TtC12AutoSettings18SettingsCarManager)init
{
  sub_10000F8C8();
  return result;
}

- (void)dismissSettingsModal
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_rootViewController);
  if (v2) {
    [v2 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)carDidUpdateAccessories:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100011D98(v4);
}

- (void)carDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_100014080(v5);
}

- (void)carManager:(id)a3 didUpdateCurrentCar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100013D00(a4);
}

- (void)carManager:(id)a3 didRemove:(id)a4
{
  sub_1000076B0(0, &qword_10002C7E8);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  v8 = self;
  sub_100014200(v6);

  swift_bridgeObjectRelease();
}

- (void)accessoryDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v5 = a3;
  unint64_t v6 = self;
  sub_100012158(v5);
}

- (void)sessionDidConnect:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1000142E8();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();

  v3 = (char *)self + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_lastBackgroundTime;
  uint64_t v4 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

- (void)historicalNotificationService:(id)a3 didUpdateTimestamp:(id)a4
{
  uint64_t v4 = sub_10000761C((uint64_t *)&unk_10002BF80);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000076B0(0, &qword_10002CB10);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  uint64_t v5 = OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_fireRenderedAndFinalizedSignposts;
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_fireRenderedAndFinalizedSignposts) == 1)
  {
    uint64_t v8 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_cafCarManager);
    v9 = (_TtC12AutoSettings18SettingsCarManager *)a3;
    v10 = (_TtC12AutoSettings18SettingsCarManager *)a4;
    v13 = self;
    v11 = (_TtC12AutoSettings18SettingsCarManager *)[v8 currentCar];
    if (v11)
    {
      v12 = v11;
      *((unsigned char *)&self->super.isa + v5) = 0;
      CAFSignpostEmit_Rendered();
      CAFSignpostEmit_Finalized();

      v9 = v10;
      v10 = v13;
      v13 = v12;
    }
  }
}

@end