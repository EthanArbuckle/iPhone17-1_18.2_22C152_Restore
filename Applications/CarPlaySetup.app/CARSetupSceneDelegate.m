@interface CARSetupSceneDelegate
- (UIWindow)window;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setWindow:(id)a3;
@end

@implementation CARSetupSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v9 = a3;
  v6 = [(CARSetupSceneDelegate *)self window];

  if (!v6)
  {
    id v7 = [objc_alloc((Class)UIWindow) initWithWindowScene:v9];
    [(CARSetupSceneDelegate *)self setWindow:v7];

    v8 = [(CARSetupSceneDelegate *)self window];
    [v8 makeKeyAndVisible];
  }
}

- (UIWindow)window
{
  return self->window;
}

- (void)setWindow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end