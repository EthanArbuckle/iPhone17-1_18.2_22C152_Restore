@interface WindowSceneDelegate
- (UIWindow)window;
- (_TtC18ActivityProgressUI19WindowSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation WindowSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC18ActivityProgressUI19WindowSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18ActivityProgressUI19WindowSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18ActivityProgressUI19WindowSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10003342C(v8);
}

- (void)sceneDidDisconnect:(id)a3
{
}

- (void)sceneDidBecomeActive:(id)a3
{
}

- (void)sceneWillResignActive:(id)a3
{
}

- (void)sceneWillEnterForeground:(id)a3
{
}

- (void)sceneDidEnterBackground:(id)a3
{
}

- (_TtC18ActivityProgressUI19WindowSceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18ActivityProgressUI19WindowSceneDelegate_window) = 0;
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC18ActivityProgressUI19WindowSceneDelegate_testAppView) = 1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for WindowSceneDelegate();
  return [(WindowSceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
}

@end