@interface SessionSceneDelegate
- (UIWindow)window;
- (_TtC18ActivityProgressUI20SessionSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation SessionSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC18ActivityProgressUI20SessionSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18ActivityProgressUI20SessionSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18ActivityProgressUI20SessionSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100007034(v8, v9);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000080DC(v4, "SessionSceneDelegate: sceneDidDisconnect with role: %s, activity identifier: %s");
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100007D08(v4);
}

- (void)sceneWillResignActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000080DC(v4, "SessionSceneDelegate: sceneWillResignActive with role: %s, activity identifier: %s");
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000080DC(v4, "SessionSceneDelegate: sceneWillEnterForeground with role: %s, activity identifier: %s");
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000080DC(v4, "SessionSceneDelegate: sceneDidEnterBackground with role: %s, activity identifier: %s");
}

- (_TtC18ActivityProgressUI20SessionSceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18ActivityProgressUI20SessionSceneDelegate_window) = 0;
  uint64_t v3 = OBJC_IVAR____TtC18ActivityProgressUI20SessionSceneDelegate_systemApertureElementProvidersByID;
  id v4 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)sub_100003F44((uint64_t)&_swiftEmptyArrayStorage);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for SessionSceneDelegate();
  return [(SessionSceneDelegate *)&v6 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end