@interface AppDelegate
- (_TtC9AirDropUI11AppDelegate)init;
- (void)application:(id)a3 didDiscardSceneSessions:(id)a4;
- (void)applicationDidFinishLaunching:(id)a3;
- (void)willEnterForeground;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000D6610(v4);
}

- (void)willEnterForeground
{
  v2 = self;
  v3 = *(void (**)(uint64_t))(**(void **)NameDropIdentity.shared.unsafeMutableAddressor() + 128);
  uint64_t v4 = swift_retain();
  v3(v4);

  swift_release();
}

- (void)application:(id)a3 didDiscardSceneSessions:(id)a4
{
  sub_1000D6BAC();
  sub_1000D6BEC();
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  v8 = self;
  sub_1000D6C44(v6);

  swift_bridgeObjectRelease();
}

- (_TtC9AirDropUI11AppDelegate)init
{
  uint64_t v3 = OBJC_IVAR____TtC9AirDropUI11AppDelegate_sessionsController;
  uint64_t v4 = qword_10017F610;
  v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = (void *)qword_10018CE80;
  *(Class *)((char *)&self->super.isa + v3) = (Class)qword_10018CE80;
  uint64_t v7 = OBJC_IVAR____TtC9AirDropUI11AppDelegate_proximityHandoffUIServer;
  uint64_t v8 = qword_10017F630;
  id v9 = v6;
  if (v8 != -1) {
    swift_once();
  }
  v10 = (void *)qword_10018CED0;
  *(Class *)((char *)&v5->super.isa + v7) = (Class)qword_10018CED0;
  id v11 = v10;

  v13.receiver = v5;
  v13.super_class = (Class)type metadata accessor for AppDelegate();
  return [(AppDelegate *)&v13 init];
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9AirDropUI11AppDelegate_proximityHandoffUIServer);
}

@end