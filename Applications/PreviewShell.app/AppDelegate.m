@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC12PreviewShell11AppDelegate)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
@end

@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_10003A16C((unint64_t *)&unk_1000708A0, type metadata accessor for LaunchOptionsKey);
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  uint64_t v6 = qword_10006EC98;
  id v7 = a3;
  v8 = self;
  if (v6 != -1) {
    swift_once();
  }
  type metadata accessor for PreviewShellService();
  sub_10003A16C(&qword_100070898, (void (*)(uint64_t))type metadata accessor for PreviewShellService);
  PreviewShellServiceProtocol.activateServers()();

  swift_bridgeObjectRelease();
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = sub_100039EE8(v9);

  return v12;
}

- (_TtC12PreviewShell11AppDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppDelegate();
  return [(AppDelegate *)&v3 init];
}

@end