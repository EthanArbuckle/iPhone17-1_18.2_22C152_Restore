@interface TripSceneDelegate
- (_TtC4Trip17TripSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)selectButtonPressedWithType:(unint64_t)a3;
@end

@implementation TripSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100024270(v8, v9);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100023D30(v4);
}

- (_TtC4Trip17TripSceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC4Trip17TripSceneDelegate_consoleWindowManager) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC4Trip17TripSceneDelegate_clusterWindowManager) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TripSceneDelegate();
  return [(TripSceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
  objc_super v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC4Trip17TripSceneDelegate_clusterWindowManager);
}

- (void)selectButtonPressedWithType:(unint64_t)a3
{
}

@end