@interface SceneDelegate
- (_TtC24AuthenticationServicesUI13SceneDelegate)init;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
@end

@implementation SceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1000062A4(v8, v10);
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  sub_100007568(0, &qword_100011D10);
  sub_100007450(&qword_100011D18, &qword_100011D10);
  uint64_t v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a4;
  v12 = (__objc2_prot **)a5;
  id v13 = a6;
  v14 = self;
  sub_100006540(v10, v12);

  swift_bridgeObjectRelease();
  v15.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v15.super.isa;
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  sub_100007568(0, &qword_100011CF8);
  sub_100007450(&qword_100011D00, &qword_100011CF8);
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  id v8 = self;
  sub_100007184(v6);

  swift_bridgeObjectRelease();
}

- (_TtC24AuthenticationServicesUI13SceneDelegate)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC24AuthenticationServicesUI13SceneDelegate_windows) = (Class)&_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC24AuthenticationServicesUI13SceneDelegate_rootViewController) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SceneDelegate();
  return [(SceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_super v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC24AuthenticationServicesUI13SceneDelegate_rootViewController);
}

@end