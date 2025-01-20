@interface _UIColorPickerUIServiceSceneDelegate
- (UIWindow)window;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setWindow:(id)a3;
@end

@implementation _UIColorPickerUIServiceSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6 = a3;
  v7 = [[_UIColorPickerUIServiceSecureWindow alloc] initWithWindowScene:v6];

  [(_UIColorPickerUIServiceSceneDelegate *)self setWindow:v7];
  v10 = objc_alloc_init(_UIColorPickerUIServiceViewController);
  v8 = [(_UIColorPickerUIServiceSceneDelegate *)self window];
  [v8 setRootViewController:v10];

  v9 = [(_UIColorPickerUIServiceSceneDelegate *)self window];
  [v9 makeKeyAndVisible];
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end