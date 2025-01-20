@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (_TtC7Sidecar11AppDelegate)init;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillTerminate:(id)a3;
- (void)sidecarServicePresenterServiceExtensionReady:(id)a3;
- (void)sidecarServicePresenterStartServiceExtension:(id)a3 completion:(id)a4;
- (void)sidecarServicePresenterTerminate;
@end

@implementation AppDelegate

- (_TtC7Sidecar11AppDelegate)init
{
  return (_TtC7Sidecar11AppDelegate *)sub_1000040C0();
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_1000067A0(&qword_100026838, type metadata accessor for LaunchOptionsKey);
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  sub_100004334();

  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_1000067A0(&qword_100026838, type metadata accessor for LaunchOptionsKey);
    uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v7 = a3;
  v8 = self;
  sub_100004438((uint64_t)v8, v4);

  swift_bridgeObjectRelease();
  return 1;
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100004910();
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000049D4();
}

- (void)applicationWillTerminate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100004A90();
}

- (void)sidecarServicePresenterStartServiceExtension:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  v10 = self;
  sub_100004C18(v6, v8, (uint64_t)sub_100006584, v9);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)sidecarServicePresenterServiceExtensionReady:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  sub_100005554((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)sidecarServicePresenterTerminate
{
  v2 = self;
  sub_100005948();
}

@end