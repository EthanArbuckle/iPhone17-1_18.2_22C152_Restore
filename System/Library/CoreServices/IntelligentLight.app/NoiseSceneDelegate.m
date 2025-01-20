@interface NoiseSceneDelegate
- (UIWindow)window;
- (_TtC16IntelligentLight18NoiseSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation NoiseSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC16IntelligentLight18NoiseSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16IntelligentLight18NoiseSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16IntelligentLight18NoiseSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (_TtC16IntelligentLight18NoiseSceneDelegate)init
{
  return (_TtC16IntelligentLight18NoiseSceneDelegate *)sub_10000C8BC();
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10000CC40(v8, v9);
}

- (void)sceneDidDisconnect:(id)a3
{
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
                     + OBJC_IVAR____TtC16IntelligentLight18NoiseSceneDelegate_moduleManager));

  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16IntelligentLight18NoiseSceneDelegate_contentView);
}

@end