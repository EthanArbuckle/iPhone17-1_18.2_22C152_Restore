@interface ProximityCardSceneDelegate
- (UIWindow)window;
- (_TtC13MediaRemoteUI26ProximityCardSceneDelegate)init;
- (void)proxCardFlowDidDismiss;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation ProximityCardSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC13MediaRemoteUI26ProximityCardSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI26ProximityCardSceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI26ProximityCardSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100014E2C(v8);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI26ProximityCardSceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI26ProximityCardSceneDelegate_window) = 0;
  id v5 = a3;
  v6 = self;

  id v7 = *(Class *)((char *)&v6->super.isa
                + OBJC_IVAR____TtC13MediaRemoteUI26ProximityCardSceneDelegate_navigationController);
  *(Class *)((char *)&v6->super.isa + OBJC_IVAR____TtC13MediaRemoteUI26ProximityCardSceneDelegate_navigationController) = 0;
}

- (void)proxCardFlowDidDismiss
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI26ProximityCardSceneDelegate_window);
  if (v2)
  {
    id v3 = self;
    id v4 = (_TtC13MediaRemoteUI26ProximityCardSceneDelegate *)[v2 windowScene];
    if (v4)
    {
      id v7 = v4;
      self;
      id v5 = (void *)swift_dynamicCastObjCClass();
      if (v5) {
        [v5 invalidate];
      }

      v6 = v7;
    }
    else
    {
      v6 = v3;
    }
  }
}

- (_TtC13MediaRemoteUI26ProximityCardSceneDelegate)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI26ProximityCardSceneDelegate_window) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI26ProximityCardSceneDelegate_navigationController) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ProximityCardSceneDelegate();
  return [(ProximityCardSceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
  objc_super v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13MediaRemoteUI26ProximityCardSceneDelegate_navigationController);
}

@end