@interface _AXBannerHostViewController
- (BOOL)_canShowWhileLocked;
- (unint64_t)supportedInterfaceOrientations;
- (void)loadView;
@end

@implementation _AXBannerHostViewController

- (void)loadView
{
  v3 = +[UIScreen mainScreen];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  id v9 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, v5, v7);
  v8 = +[UIColor clearColor];
  [v9 setBackgroundColor:v8];

  [(_AXBannerHostViewController *)self setView:v9];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

@end