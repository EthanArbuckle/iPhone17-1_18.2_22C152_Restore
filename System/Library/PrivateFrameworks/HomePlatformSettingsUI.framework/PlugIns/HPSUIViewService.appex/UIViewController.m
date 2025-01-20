@interface UIViewController
- (void)wrapWithSubViewController:(id)a3;
@end

@implementation UIViewController

- (void)wrapWithSubViewController:(id)a3
{
  id v4 = a3;
  v5 = self;
  UIViewController.wrap(subViewController:)((UIViewController)v4);
}

@end