@interface ActivitySceneDelegate
- (UIWindow)window;
- (_TtC21ScreenContinuityShell21ActivitySceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setWindow:(id)a3;
@end

@implementation ActivitySceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC21ScreenContinuityShell21ActivitySceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21ScreenContinuityShell21ActivitySceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21ScreenContinuityShell21ActivitySceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10000CE30(v8, v9);
}

- (_TtC21ScreenContinuityShell21ActivitySceneDelegate)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21ScreenContinuityShell21ActivitySceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ActivitySceneDelegate();
  return [(ActivitySceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
}

@end