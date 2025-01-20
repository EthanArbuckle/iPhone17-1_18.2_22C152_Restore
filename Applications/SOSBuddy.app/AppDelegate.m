@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC8SOSBuddy11AppDelegate)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (void)application:(id)a3 didDiscardSceneSessions:(id)a4;
- (void)applicationWillTerminate:(id)a3;
@end

@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_1000298AC((unint64_t *)&unk_100380440, type metadata accessor for LaunchOptionsKey);
    uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v7 = a3;
  v8 = self;
  char v9 = sub_100028A98(v4);

  swift_bridgeObjectRelease();
  return v9 & 1;
}

- (void)applicationWillTerminate:(id)a3
{
  uint64_t v4 = qword_10037DD80;
  id v5 = a3;
  v10 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_10000FD84(v6, (uint64_t)qword_1003A9958);
  id v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    char v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "AppDelegate applicationWillTerminate()", v9, 2u);
    swift_slowDealloc();
  }

  sub_100198CC8();
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = sub_100029408(v9, v10);

  return v12;
}

- (void)application:(id)a3 didDiscardSceneSessions:(id)a4
{
  uint64_t v5 = qword_10037DD80;
  id v11 = a3;
  uint64_t v6 = self;
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  sub_10000FD84(v7, (uint64_t)qword_1003A9958);
  id v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    id v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "AppDelegate didDiscardSceneSessions()", v10, 2u);
    swift_slowDealloc();
  }
}

- (_TtC8SOSBuddy11AppDelegate)init
{
  v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8SOSBuddy11AppDelegate_delegate);
  type metadata accessor for ProdAppDelegate();
  uint64_t v4 = swift_allocObject();
  type metadata accessor for SOSBuddyEnvironment();
  swift_allocObject();
  uint64_t v5 = self;
  *(void *)(v4 + 16) = sub_1001ADB14();
  uint64_t *v3 = v4;
  v3[1] = (uint64_t)&off_10034F370;

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for AppDelegate();
  return [(AppDelegate *)&v7 init];
}

- (void).cxx_destruct
{
}

@end