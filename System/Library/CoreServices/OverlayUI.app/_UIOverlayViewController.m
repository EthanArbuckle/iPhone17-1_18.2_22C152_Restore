@interface _UIOverlayViewController
- (BOOL)_canShowWhileLocked;
- (UIWindow)window;
- (UIWindowScene)windowScene;
@end

@implementation _UIOverlayViewController

- (UIWindow)window
{
  v2 = [(_UIOverlayViewController *)self view];
  v3 = [v2 window];

  return (UIWindow *)v3;
}

- (UIWindowScene)windowScene
{
  v2 = [(_UIOverlayViewController *)self window];
  v3 = [v2 windowScene];

  return (UIWindowScene *)v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end