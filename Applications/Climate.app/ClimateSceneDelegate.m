@interface ClimateSceneDelegate
- (UIWindow)window;
- (_TtC7Climate20ClimateSceneDelegate)init;
- (void)scene:(id)a3 didUpdateSettings:(id)a4;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation ClimateSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1000A61AC(v8, v9);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000A4748(v4);
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000A4E94(1);
}

- (void)sceneWillResignActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000A4E94(0);
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000A6CD4();
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000A6EA4();
}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1000A7128(v6, v7);
}

- (_TtC7Climate20ClimateSceneDelegate)init
{
  return (_TtC7Climate20ClimateSceneDelegate *)sub_1000A549C();
}

- (void).cxx_destruct
{
  sub_100010840(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_type), *(void *)&self->window[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_type], self->type[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_type]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_statusBarStyleAssertion);
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  sub_100007310(0, &qword_1000E7C50);
  sub_1000A7F90(&qword_1000E7C58, &qword_1000E7C50);
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a3;
  id v7 = self;
  sub_1000A748C();

  swift_bridgeObjectRelease();
}

@end