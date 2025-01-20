@interface TirePressureSceneDelegate
- (_TtC12TirePressure25TirePressureSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)selectButtonPressedWithType:(unint64_t)a3;
@end

@implementation TirePressureSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10001171C(v8, v9);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100010DF0(v4);
}

- (_TtC12TirePressure25TirePressureSceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC12TirePressure25TirePressureSceneDelegate_clusterWindowManager) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TirePressureSceneDelegate();
  return [(TirePressureSceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12TirePressure25TirePressureSceneDelegate_clusterWindowManager));
}

- (void)selectButtonPressedWithType:(unint64_t)a3
{
}

@end