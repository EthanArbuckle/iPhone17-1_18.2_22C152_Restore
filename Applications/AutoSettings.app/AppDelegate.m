@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC12AutoSettings11AppDelegate)init;
@end

@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_10000E9B0();
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  CAFSignpostEmit_Launched();
  v8 = (objc_class *)[objc_allocWithZone((Class)type metadata accessor for SettingsCarManager()) init];
  v9 = *(Class *)((char *)&v7->super.super.isa + OBJC_IVAR____TtC12AutoSettings11AppDelegate_settingsCarManager);
  *(Class *)((char *)&v7->super.super.isa + OBJC_IVAR____TtC12AutoSettings11AppDelegate_settingsCarManager) = v8;

  swift_bridgeObjectRelease();
  return 1;
}

- (_TtC12AutoSettings11AppDelegate)init
{
  return (_TtC12AutoSettings11AppDelegate *)sub_10000E444();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC12AutoSettings11AppDelegate__carWindow;
  uint64_t v4 = sub_10000761C(&qword_10002C450);
  id v6 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v6)((void *)(v4 - 8), v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC12AutoSettings11AppDelegate__clusterWindow;

  v6(v5, v4);
}

@end