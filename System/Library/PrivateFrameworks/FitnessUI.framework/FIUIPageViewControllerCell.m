@interface FIUIPageViewControllerCell
- (UIViewController)viewController;
- (void)setViewController:(id)a3;
@end

@implementation FIUIPageViewControllerCell

- (void)setViewController:(id)a3
{
  v5 = (UIViewController *)a3;
  p_viewController = &self->_viewController;
  if (*p_viewController != v5)
  {
    v9 = v5;
    v7 = *p_viewController;
    [(UIViewController *)v7 willMoveToParentViewController:0];
    v8 = [(UIViewController *)v7 view];
    [v8 removeFromSuperview];

    [(UIViewController *)v7 removeFromParentViewController];
    objc_storeStrong((id *)p_viewController, a3);

    v5 = v9;
  }
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void).cxx_destruct
{
}

@end