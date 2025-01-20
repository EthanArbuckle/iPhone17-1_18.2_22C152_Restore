@interface SessionSceneDelegate
- (UIWindow)window;
- (_TtC9AirDropUI20SessionSceneDelegate)init;
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
                                                             + OBJC_IVAR____TtC9AirDropUI20SessionSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9AirDropUI20SessionSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9AirDropUI20SessionSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100026FD8(v8, v9);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100028498(v4);
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10002898C(v4, "SessionSceneDelegate: sceneDidBecomeActive with role: %s");
}

- (void)sceneWillResignActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10002898C(v4, "SessionSceneDelegate: sceneWillResignActive with role: %s");
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10002898C(v4, "SessionSceneDelegate: sceneWillEnterForeground with role: %s");
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10002898C(v4, "SessionSceneDelegate: sceneDidEnterBackground with role: %s");
}

- (_TtC9AirDropUI20SessionSceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9AirDropUI20SessionSceneDelegate_window) = 0;
  uint64_t v3 = OBJC_IVAR____TtC9AirDropUI20SessionSceneDelegate_systemApertureElementProvidersByID;
  id v4 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)sub_1000A3464((uint64_t)&_swiftEmptyArrayStorage);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for SessionSceneDelegate();
  return [(SessionSceneDelegate *)&v6 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end