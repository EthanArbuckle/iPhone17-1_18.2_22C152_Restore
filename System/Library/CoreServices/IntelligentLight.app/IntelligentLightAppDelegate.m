@interface IntelligentLightAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC16IntelligentLight27IntelligentLightAppDelegate)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (void)application:(id)a3 didDiscardSceneSessions:(id)a4;
@end

@implementation IntelligentLightAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_1000049BC(&qword_10001A440, type metadata accessor for LaunchOptionsKey);
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = objc_allocWithZone((Class)type metadata accessor for ModuleManager());
  id v7 = a3;
  v8 = self;
  v9 = (objc_class *)[v6 init];
  v10 = *(Class *)((char *)&v8->super.super.isa
                 + OBJC_IVAR____TtC16IntelligentLight27IntelligentLightAppDelegate_moduleManager);
  *(Class *)((char *)&v8->super.super.isa + OBJC_IVAR____TtC16IntelligentLight27IntelligentLightAppDelegate_moduleManager) = v9;

  swift_bridgeObjectRelease();
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = sub_1000045F4(v9);

  return v12;
}

- (void)application:(id)a3 didDiscardSceneSessions:(id)a4
{
  sub_100004574();
  sub_1000049BC((unint64_t *)&unk_10001A530, (void (*)(uint64_t))sub_100004574);
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  id v8 = self;
  sub_100003F90(v6);

  swift_bridgeObjectRelease();
}

- (_TtC16IntelligentLight27IntelligentLightAppDelegate)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC16IntelligentLight27IntelligentLightAppDelegate_moduleManager) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16IntelligentLight27IntelligentLightAppDelegate_context) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16IntelligentLight27IntelligentLightAppDelegate_metalLayer) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IntelligentLightAppDelegate();
  return [(IntelligentLightAppDelegate *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC16IntelligentLight27IntelligentLightAppDelegate_moduleManager));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC16IntelligentLight27IntelligentLightAppDelegate_context));
  objc_super v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC16IntelligentLight27IntelligentLightAppDelegate_metalLayer);
}

@end