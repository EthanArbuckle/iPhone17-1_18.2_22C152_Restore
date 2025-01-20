@interface RemoteAlertSceneDelegate
- (UIWindow)window;
- (_TtC10CoreAuthUI24RemoteAlertSceneDelegate)init;
- (void)remoteAlertScene:(id)a3 handleButtonActions:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation RemoteAlertSceneDelegate

- (UIWindow)window
{
  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10CoreAuthUI24RemoteAlertSceneDelegate_window);
  swift_beginAccess();
  return (UIWindow *)*v2;
}

- (void)setWindow:(id)a3
{
  v4 = (void **)((char *)&self->super.super.isa + OBJC_IVAR____TtC10CoreAuthUI24RemoteAlertSceneDelegate_window);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10002C4EC(v8);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10002BA08(v4);
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.isa) + 0x70);
  v5 = (_TtC10CoreAuthUI24RemoteAlertSceneDelegate *)a3;
  v12 = self;
  uint64_t v6 = v4();
  if (v6)
  {
    v7 = (_TtC10CoreAuthUI24RemoteAlertSceneDelegate *)v6;
    self;
    uint64_t v8 = swift_dynamicCastObjCClass();
    if (v8)
    {
      id v9 = (void *)v8;
      v5 = v5;
      id v10 = sub_10002BCCC(v9);
      v11 = (_TtC10CoreAuthUI24RemoteAlertSceneDelegate *)[objc_allocWithZone((Class)LACUIScenePresentationRequest) initWithUserInterfaceRequest:v10];

      (*(void (**)(_TtC10CoreAuthUI24RemoteAlertSceneDelegate *))((swift_isaMask & (uint64_t)v7->super.super.isa)
                                                                           + 0x50))(v11);

      v12 = v5;
      v7 = v11;
    }

    v5 = v12;
    v12 = v7;
  }
}

- (void)remoteAlertScene:(id)a3 handleButtonActions:(id)a4
{
  sub_10002B40C(0, &qword_10009CDC8);
  sub_10002C6B0();
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  v7 = self;
  sub_10002BFF8(v6);
  if ((v8 & 1) != 0
    && (id v9 = (void *)(*(uint64_t (**)(void))((swift_isaMask & (uint64_t)v7->super.super.isa) + 0x70))()) != 0)
  {
    id v10 = v9;
    [v9 handleSceneButton:0];

    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
}

- (_TtC10CoreAuthUI24RemoteAlertSceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10CoreAuthUI24RemoteAlertSceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RemoteAlertSceneDelegate();
  return [(RemoteAlertSceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
}

@end