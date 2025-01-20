@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC24AMSEngagementViewService11AppDelegate)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (void)application:(id)a3 didDiscardSceneSessions:(id)a4;
@end

@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey();
    sub_100002E10(&qword_10001E2B0, (void (*)(uint64_t))type metadata accessor for LaunchOptionsKey);
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_bridgeObjectRelease();
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = sub_100002560((int)v11, v9);

  return v12;
}

- (void)application:(id)a3 didDiscardSceneSessions:(id)a4
{
  sub_100002894();
  sub_100002E10(&qword_10001E2A8, (void (*)(uint64_t))sub_100002894);
  static Set._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRelease();
}

- (_TtC24AMSEngagementViewService11AppDelegate)init
{
  return (_TtC24AMSEngagementViewService11AppDelegate *)sub_1000026D4();
}

@end