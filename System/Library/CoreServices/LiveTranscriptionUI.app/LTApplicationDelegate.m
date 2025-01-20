@interface LTApplicationDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (UIWindow)window;
- (_TtC19LiveTranscriptionUI21LTApplicationDelegate)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (void)applicationWillTerminate:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation LTApplicationDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC19LiveTranscriptionUI21LTApplicationDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC19LiveTranscriptionUI21LTApplicationDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC19LiveTranscriptionUI21LTApplicationDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (_TtC19LiveTranscriptionUI21LTApplicationDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC19LiveTranscriptionUI21LTApplicationDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LTApplicationDelegate();
  return [(LTApplicationDelegate *)&v3 init];
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_10002711C();
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  static os_log_type_t.debug.getter();
  if (qword_10006AD90 != -1) {
    swift_once();
  }
  os_log(_:dso:log:_:_:)();

  swift_bridgeObjectRelease();
  return 1;
}

- (void)applicationWillTerminate:(id)a3
{
  id v4 = a3;
  v5 = self;
  static os_log_type_t.debug.getter();
  if (qword_10006AD90 != -1) {
    swift_once();
  }
  os_log(_:dso:log:_:_:)();
  if (qword_10006AE28 != -1) {
    swift_once();
  }
  AXLTCaptionsProvider.stopTranscribing()();
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

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC19LiveTranscriptionUI21LTApplicationDelegate_window));
}

@end