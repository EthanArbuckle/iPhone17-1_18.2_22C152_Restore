@interface GameOverlayUIRemoteAlertSceneDelegate
- (UIWindow)window;
- (_TtC13GameOverlayUI37GameOverlayUIRemoteAlertSceneDelegate)init;
- (void)remoteAlertScene:(id)a3 handleButtonActions:(id)a4;
- (void)remoteAlertSceneDidInvalidateForRemoteAlertServiceInvalidation:(id)a3;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation GameOverlayUIRemoteAlertSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC13GameOverlayUI37GameOverlayUIRemoteAlertSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13GameOverlayUI37GameOverlayUIRemoteAlertSceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13GameOverlayUI37GameOverlayUIRemoteAlertSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1000E3534(v8);
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000E5450();
}

- (void)sceneWillResignActive:(id)a3
{
}

- (void)sceneWillEnterForeground:(id)a3
{
}

- (void)sceneDidEnterBackground:(id)a3
{
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000E5618();
}

- (void)remoteAlertSceneDidInvalidateForRemoteAlertServiceInvalidation:(id)a3
{
}

- (void)remoteAlertScene:(id)a3 handleButtonActions:(id)a4
{
  sub_100069708(0, &qword_1001454A8);
  sub_1000E1CD8();
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a3;
  v7 = self;
  sub_1000E5714();

  swift_bridgeObjectRelease();
}

- (_TtC13GameOverlayUI37GameOverlayUIRemoteAlertSceneDelegate)init
{
  return (_TtC13GameOverlayUI37GameOverlayUIRemoteAlertSceneDelegate *)sub_1000DFC34((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC13GameOverlayUI37GameOverlayUIRemoteAlertSceneDelegate_window);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13GameOverlayUI37GameOverlayUIRemoteAlertSceneDelegate_window));
}

@end