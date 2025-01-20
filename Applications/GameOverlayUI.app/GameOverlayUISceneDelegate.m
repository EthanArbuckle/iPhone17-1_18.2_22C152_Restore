@interface GameOverlayUISceneDelegate
- (UIWindow)window;
- (_TtC13GameOverlayUI26GameOverlayUISceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setWindow:(id)a3;
@end

@implementation GameOverlayUISceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC13GameOverlayUI26GameOverlayUISceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13GameOverlayUI26GameOverlayUISceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13GameOverlayUI26GameOverlayUISceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1000E1D40(v9);
}

- (_TtC13GameOverlayUI26GameOverlayUISceneDelegate)init
{
  return (_TtC13GameOverlayUI26GameOverlayUISceneDelegate *)sub_1000DFC34((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC13GameOverlayUI26GameOverlayUISceneDelegate_window);
}

- (void).cxx_destruct
{
}

@end