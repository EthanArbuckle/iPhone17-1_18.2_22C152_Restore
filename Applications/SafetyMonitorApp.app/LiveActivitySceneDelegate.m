@interface LiveActivitySceneDelegate
- (UIWindow)window;
- (_TtC16SafetyMonitorApp25LiveActivitySceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation LiveActivitySceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC16SafetyMonitorApp25LiveActivitySceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SafetyMonitorApp25LiveActivitySceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SafetyMonitorApp25LiveActivitySceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10000E0E4(v8);
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000EC90("%@,sceneDidBecomeActive,requesting resize");
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000EC90("%@,sceneWillEnterForeground,requesting resize");
}

- (_TtC16SafetyMonitorApp25LiveActivitySceneDelegate)init
{
  return (_TtC16SafetyMonitorApp25LiveActivitySceneDelegate *)sub_10000D8B8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SafetyMonitorApp25LiveActivitySceneDelegate____lazy_storage___systemApertureElementProvider));

  swift_bridgeObjectRelease();
}

@end