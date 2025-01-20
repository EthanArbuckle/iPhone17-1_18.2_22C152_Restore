@interface LightSceneDelegate
- (UIWindow)window;
- (_TtC16IntelligentLight18LightSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation LightSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC16IntelligentLight18LightSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16IntelligentLight18LightSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16IntelligentLight18LightSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (_TtC16IntelligentLight18LightSceneDelegate)init
{
  return (_TtC16IntelligentLight18LightSceneDelegate *)sub_10000884C();
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100008988(v8, v9, v10);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100008EA8(v4);
}

- (void)sceneWillEnterForeground:(id)a3
{
}

- (void)sceneDidEnterBackground:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC16IntelligentLight18LightSceneDelegate_moduleManager));

  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16IntelligentLight18LightSceneDelegate_contentView);
}

@end