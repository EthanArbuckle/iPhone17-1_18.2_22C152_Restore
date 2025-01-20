@interface UIViewController
- (MapsTheme)theme;
- (UIViewController)topMostPresentedViewController;
- (void)_maps_presentSimpleAlertWithTitle:(id)a3 message:(id)a4 dismissalActionTitle:(id)a5;
- (void)_maps_presentSimpleAlertWithTitle:(id)a3 message:(id)a4 dismissalActionTitle:(id)a5 dismissalHandler:(id)a6;
- (void)_maps_topMostPresentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation UIViewController

- (MapsTheme)theme
{
  v3 = [(UIViewController *)self traitCollection];
  id v4 = [v3 userInterfaceStyle];

  if (v4)
  {
    v5 = [(UIViewController *)self traitCollection];
    BOOL v6 = [v5 userInterfaceStyle] != (char *)&dword_0 + 1;

    v7 = +[MapsTheme sharedTheme];
    [v7 setMapsThemeStyle:v6];
  }

  return (MapsTheme *)+[MapsTheme sharedTheme];
}

- (UIViewController)topMostPresentedViewController
{
  v2 = self;
  v3 = [(UIViewController *)v2 presentedViewController];

  if (v3)
  {
    do
    {
      id v4 = [(UIViewController *)v2 presentedViewController];

      v5 = [(UIViewController *)v4 presentedViewController];

      v2 = v4;
    }
    while (v5);
  }
  else
  {
    id v4 = v2;
  }

  return v4;
}

- (void)_maps_presentSimpleAlertWithTitle:(id)a3 message:(id)a4 dismissalActionTitle:(id)a5 dismissalHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v14 = +[UIAlertController alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  v12 = [v14 view];
  [v12 setAccessibilityIdentifier:@"SimpleAlert"];

  v13 = +[UIAlertAction actionWithTitle:v11 style:0 handler:v10];

  [v13 setAccessibilityIdentifier:@"AlertAction"];
  [v14 addAction:v13];
  [(UIViewController *)self _maps_topMostPresentViewController:v14 animated:1 completion:0];
}

- (void)_maps_presentSimpleAlertWithTitle:(id)a3 message:(id)a4 dismissalActionTitle:(id)a5
{
}

- (void)_maps_topMostPresentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(UIViewController *)self topMostPresentedViewController];
  [v10 presentViewController:v9 animated:v5 completion:v8];
}

@end