@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC10ClockAngel11AppDelegate)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
@end

@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_10004FAF8();
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v6 = self;
  id v7 = a3;
  v8 = self;
  NSString v9 = String._bridgeToObjectiveC()();
  [v6 logInfo:v9];

  swift_bridgeObjectRelease();
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = [v9 role];
  id v13 = objc_allocWithZone((Class)UISceneConfiguration);
  NSString v14 = String._bridgeToObjectiveC()();
  id v15 = [v13 initWithName:v14 sessionRole:v12];

  return v15;
}

- (_TtC10ClockAngel11AppDelegate)init
{
  uint64_t v2 = OBJC_IVAR____TtC10ClockAngel11AppDelegate_connectionHandler;
  uint64_t v3 = qword_1000C2C98;
  v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  v5 = (void *)qword_1000CAE28;
  *(Class *)((char *)&v4->super.super.isa + v2) = (Class)qword_1000CAE28;
  id v6 = v5;

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for AppDelegate();
  return [(AppDelegate *)&v8 init];
}

- (void).cxx_destruct
{
}

@end