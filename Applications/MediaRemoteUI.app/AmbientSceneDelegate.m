@interface AmbientSceneDelegate
- (UIWindow)window;
- (_TtC13MediaRemoteUI20AmbientSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation AmbientSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100011F7C(v8);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100012734();
}

- (void)sceneWillEnterForeground:(id)a3
{
}

- (void)sceneDidEnterBackground:(id)a3
{
}

- (_TtC13MediaRemoteUI20AmbientSceneDelegate)init
{
  return (_TtC13MediaRemoteUI20AmbientSceneDelegate *)sub_100011D90();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_lockscreenCoordinator));
  id v3 = (char *)self + OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_isBackdropActiveCancellable;

  sub_10001015C((uint64_t)v3);
}

@end