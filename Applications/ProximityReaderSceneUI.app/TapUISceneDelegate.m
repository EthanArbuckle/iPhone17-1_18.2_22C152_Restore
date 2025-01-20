@interface TapUISceneDelegate
- (UIWindow)window;
- (_TtC22ProximityReaderSceneUI18TapUISceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation TapUISceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC22ProximityReaderSceneUI18TapUISceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC22ProximityReaderSceneUI18TapUISceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC22ProximityReaderSceneUI18TapUISceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10000C4D8(v8);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000D678();
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

- (_TtC22ProximityReaderSceneUI18TapUISceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC22ProximityReaderSceneUI18TapUISceneDelegate_window) = 0;
  uint64_t v3 = OBJC_IVAR____TtC22ProximityReaderSceneUI18TapUISceneDelegate_actionHandler;
  id v4 = objc_allocWithZone((Class)type metadata accessor for TapUISceneActionHandler());
  v5 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)[v4 init];

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for TapUISceneDelegate();
  return [(TapUISceneDelegate *)&v7 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22ProximityReaderSceneUI18TapUISceneDelegate_window));
  uint64_t v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC22ProximityReaderSceneUI18TapUISceneDelegate_actionHandler);
}

@end