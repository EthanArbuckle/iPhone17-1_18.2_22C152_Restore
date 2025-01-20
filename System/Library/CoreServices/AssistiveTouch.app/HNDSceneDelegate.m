@interface HNDSceneDelegate
- (HNDSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
@end

@implementation HNDSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1000F0AB8(v8);
}

- (void)sceneDidDisconnect:(id)a3
{
  v5 = self;
  id v6 = a3;
  v7 = self;
  id v8 = [v5 sharedManager];
  if (v8)
  {
    id v9 = v8;
    [v8 sceneDidDisconnect:v6];
  }
  else
  {
    __break(1u);
  }
}

- (HNDSceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HNDSceneDelegate_window) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HNDSceneDelegate_ignoredWindow) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SceneDelegate();
  return [(HNDSceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
  objc_super v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HNDSceneDelegate_ignoredWindow);
}

@end