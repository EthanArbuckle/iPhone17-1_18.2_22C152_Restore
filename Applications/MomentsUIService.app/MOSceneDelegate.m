@interface MOSceneDelegate
- (_TtC16MomentsUIService15MOSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
@end

@implementation MOSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  MOSceneDelegate.scene(_:willConnectTo:options:)((UIScene)v8, (UISceneSession)v9, (UISceneConnectionOptions)v10);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  MOSceneDelegate.sceneDidDisconnect(_:)((UIScene)v4);
}

- (_TtC16MomentsUIService15MOSceneDelegate)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16MomentsUIService15MOSceneDelegate_window) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(MOSceneDelegate *)&v5 init];
}

- (void).cxx_destruct
{
}

@end