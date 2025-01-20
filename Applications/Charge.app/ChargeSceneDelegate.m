@interface ChargeSceneDelegate
- (_TtC6Charge19ChargeSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
@end

@implementation ChargeSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10000ADBC(v8, v9);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000AB54(v4);
}

- (_TtC6Charge19ChargeSceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6Charge19ChargeSceneDelegate_consoleWindowManager) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6Charge19ChargeSceneDelegate_clusterWindowManager) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ChargeSceneDelegate();
  return [(ChargeSceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
  objc_super v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6Charge19ChargeSceneDelegate_clusterWindowManager);
}

@end