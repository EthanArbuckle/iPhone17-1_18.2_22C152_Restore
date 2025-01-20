@interface ClosuresSceneDelegate
- (_TtC8Closures21ClosuresSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
@end

@implementation ClosuresSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100004460(v8, v9);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100003E10(v4);
}

- (_TtC8Closures21ClosuresSceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Closures21ClosuresSceneDelegate_windowManager) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClosuresSceneDelegate();
  return [(ClosuresSceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
}

@end