@interface SceneDelegate
- (UIWindow)window;
- (_TtC16HealthENLauncher13SceneDelegate)init;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setWindow:(id)a3;
@end

@implementation SceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC16HealthENLauncher13SceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16HealthENLauncher13SceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16HealthENLauncher13SceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10001C630((uint64_t)v8, v10);
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10001079C(v7);
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  sub_10001D5A8(0, &qword_10002A0D8);
  sub_10001D544(&qword_10002A0E0, &qword_10002A0D8);
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a3;
  id v7 = self;
  sub_10001CA4C();

  swift_bridgeObjectRelease();
}

- (_TtC16HealthENLauncher13SceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16HealthENLauncher13SceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SceneDelegate();
  return [(SceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
}

@end