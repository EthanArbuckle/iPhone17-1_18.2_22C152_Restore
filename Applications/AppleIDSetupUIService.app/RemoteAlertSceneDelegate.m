@interface RemoteAlertSceneDelegate
- (UIWindow)window;
- (_TtC21AppleIDSetupUIService24RemoteAlertSceneDelegate)init;
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
                                                             + OBJC_IVAR____TtC21AppleIDSetupUIService24RemoteAlertSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC21AppleIDSetupUIService24RemoteAlertSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC21AppleIDSetupUIService24RemoteAlertSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10000A2B8(v8);
}

- (void)sceneDidDisconnect:(id)a3
{
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000AC7C();
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

- (_TtC21AppleIDSetupUIService24RemoteAlertSceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC21AppleIDSetupUIService24RemoteAlertSceneDelegate_window) = 0;
  type metadata accessor for PresentationRequest();
  swift_storeEnumTagMultiPayload();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RemoteAlertSceneDelegate();
  return [(RemoteAlertSceneDelegate *)&v4 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC21AppleIDSetupUIService24RemoteAlertSceneDelegate_window));
  id v3 = (char *)self + OBJC_IVAR____TtC21AppleIDSetupUIService24RemoteAlertSceneDelegate_presentationRequest;

  sub_1000049C8((uint64_t)v3);
}

@end