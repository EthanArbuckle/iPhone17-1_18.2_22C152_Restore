@interface CLBStatusBarSceneDelegate
- (BOOL)handleEvent:(id)a3;
- (CLBStatusBarSceneDelegate)init;
- (UIWindow)window;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setWindow:(id)a3;
@end

@implementation CLBStatusBarSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___CLBStatusBarSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CLBStatusBarSceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CLBStatusBarSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1000AECFC();
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1000ABF7C(v4);

  return self & 1;
}

- (CLBStatusBarSceneDelegate)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CLBStatusBarSceneDelegate_window) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CLBStatusBarSceneDelegate_viewController) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StatusBarSceneDelegate();
  return [(CLBStatusBarSceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
  objc_super v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CLBStatusBarSceneDelegate_viewController);
}

@end