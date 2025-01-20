@interface RemoteAlertSceneDelegate
- (_TtC13MediaRemoteUI24RemoteAlertSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
@end

@implementation RemoteAlertSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10001448C(v8, (uint64_t)v9, (uint64_t)v10);
}

- (void)sceneDidDisconnect:(id)a3
{
}

- (void)sceneWillEnterForeground:(id)a3
{
}

- (void)sceneDidEnterBackground:(id)a3
{
}

- (void)sceneDidBecomeActive:(id)a3
{
}

- (void)sceneWillResignActive:(id)a3
{
}

- (_TtC13MediaRemoteUI24RemoteAlertSceneDelegate)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI24RemoteAlertSceneDelegate_underlyingSceneDelegate) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RemoteAlertSceneDelegate();
  return [(RemoteAlertSceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
}

@end