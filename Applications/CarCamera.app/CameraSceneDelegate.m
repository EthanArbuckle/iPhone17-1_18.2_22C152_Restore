@interface CameraSceneDelegate
- (_TtC9CarCamera19CameraSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
@end

@implementation CameraSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10000AD90(v8, v9);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000AA8C(v4);
}

- (_TtC9CarCamera19CameraSceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9CarCamera19CameraSceneDelegate_consoleWindowManager) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9CarCamera19CameraSceneDelegate_clusterWindowManager) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CameraSceneDelegate();
  return [(CameraSceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC9CarCamera19CameraSceneDelegate_consoleWindowManager));
  objc_super v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9CarCamera19CameraSceneDelegate_clusterWindowManager);
}

@end