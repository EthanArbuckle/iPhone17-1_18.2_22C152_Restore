@interface RemoteAlertSceneDelegate
- (_TtC16AccessorySetupUI24RemoteAlertSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
@end

@implementation RemoteAlertSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10002BA44(v8, v9);
}

- (void)sceneDidBecomeActive:(id)a3
{
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16AccessorySetupUI24RemoteAlertSceneDelegate_window);
  if (v3)
  {
    v5 = (_TtC16AccessorySetupUI24RemoteAlertSceneDelegate *)a3;
    v6 = self;
    v7 = (_TtC16AccessorySetupUI24RemoteAlertSceneDelegate *)[v3 rootViewController];
    if (v7)
    {
      id v8 = v7;
      type metadata accessor for ASUIRootViewController();
      if (swift_dynamicCastClass()) {
        sub_100004F7C();
      }

      v5 = v6;
    }
    else
    {
      id v8 = v6;
    }
  }
}

- (_TtC16AccessorySetupUI24RemoteAlertSceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16AccessorySetupUI24RemoteAlertSceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RemoteAlertSceneDelegate();
  return [(RemoteAlertSceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI24RemoteAlertSceneDelegate_window));
}

@end