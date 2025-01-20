@interface RemoteAlertSceneDelegate
- (UIWindow)window;
- (_TtC16SharingUIService24RemoteAlertSceneDelegate)init;
- (void)remoteAlertScene:(id)a3 handleButtonActions:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation RemoteAlertSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC16SharingUIService24RemoteAlertSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16SharingUIService24RemoteAlertSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16SharingUIService24RemoteAlertSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100015CE0(v8);
}

- (void)sceneDidDisconnect:(id)a3
{
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100016970();
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

- (_TtC16SharingUIService24RemoteAlertSceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16SharingUIService24RemoteAlertSceneDelegate_window) = 0;
  id v3 = (char *)self + OBJC_IVAR____TtC16SharingUIService24RemoteAlertSceneDelegate_presentationRequest;
  uint64_t v4 = type metadata accessor for SFRemoteAlertPresentationRequest();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for RemoteAlertSceneDelegate();
  return [(RemoteAlertSceneDelegate *)&v6 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC16SharingUIService24RemoteAlertSceneDelegate_window));
  id v3 = (char *)self + OBJC_IVAR____TtC16SharingUIService24RemoteAlertSceneDelegate_presentationRequest;

  sub_1000173C0((uint64_t)v3);
}

- (void)remoteAlertScene:(id)a3 handleButtonActions:(id)a4
{
  sub_100015C48();
  sub_100015C88();
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  id v8 = self;
  sub_100016C6C(v7, v6);

  swift_bridgeObjectRelease();
}

@end