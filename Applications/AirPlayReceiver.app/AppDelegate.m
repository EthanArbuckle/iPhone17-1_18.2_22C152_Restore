@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC15AirPlayReceiver11AppDelegate)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
@end

@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_10000A544();
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  char v8 = sub_10000A378();

  swift_bridgeObjectRelease();
  return v8 & 1;
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

- (_TtC15AirPlayReceiver11AppDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppDelegate();
  return [(AppDelegate *)&v3 init];
}

@end