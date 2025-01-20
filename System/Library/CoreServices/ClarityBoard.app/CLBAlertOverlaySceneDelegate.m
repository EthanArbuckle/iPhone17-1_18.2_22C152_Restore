@interface CLBAlertOverlaySceneDelegate
- (CLBAlertOverlaySceneDelegate)init;
- (UIWindow)window;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setWindow:(id)a3;
@end

@implementation CLBAlertOverlaySceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___CLBAlertOverlaySceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CLBAlertOverlaySceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CLBAlertOverlaySceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  self;
  v9 = (void *)swift_dynamicCastObjCClass();
  if (v9) {
    id v10 = a3;
  }
  v11 = self;
  id v12 = objc_allocWithZone((Class)CLBAlertPresenter);
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v16 = self;
  id v17 = [v12 initWithWindowScene:v9];

  [v11 startWithAlertPresenter:v17];
}

- (CLBAlertOverlaySceneDelegate)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CLBAlertOverlaySceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AlertOverlaySceneDelegate();
  return [(CLBAlertOverlaySceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
}

@end