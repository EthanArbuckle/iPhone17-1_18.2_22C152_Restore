@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC5Media11AppDelegate)init;
- (void)carManager:(id)a3 didUpdateCurrentCar:(id)a4;
- (void)scene:(id)a3 didUpdateSettings:(id)a4;
@end

@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_10007F304();
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  uint64_t v6 = qword_1000AC6C0;
  id v7 = a3;
  v8 = self;
  if (v6 != -1) {
    swift_once();
  }
  sub_100006DB8(0, 0);
  if (qword_1000AC748 != -1) {
    swift_once();
  }
  [(id)qword_1000B1C58 registerObserver:v8];

  swift_bridgeObjectRelease();
  return 1;
}

- (void)carManager:(id)a3 didUpdateCurrentCar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10007ED00(a4);
}

- (_TtC5Media11AppDelegate)init
{
  return (_TtC5Media11AppDelegate *)sub_10007E484();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC5Media11AppDelegate__carWindow;
  uint64_t v4 = sub_10000463C(&qword_1000AF490);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC5Media11AppDelegate__clusterWindow, v4);
  v5((char *)self + OBJC_IVAR____TtC5Media11AppDelegate__passengerWindow, v4);
  id v6 = (char *)self + OBJC_IVAR____TtC5Media11AppDelegate__isClusterMapsAndMedia;
  uint64_t v7 = sub_10000463C((uint64_t *)&unk_1000AD750);
  v8 = *(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);

  v8(v6, v7);
}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10007F10C(v6);
}

@end