@interface CKSendMenuPopoverViewController
- (CKSendMenuPopoverViewController)init;
- (CKSendMenuPopoverViewControllerDelegate)delegate;
- (UIViewController)appContainerViewController;
- (UIViewController)sendMenuViewController;
- (id)animationForDismissingWithFinalBounds:(CGRect)a3 finalCenter:(CGPoint)a4 finalAlpha:(double)a5;
- (id)animationForPresentingInitialViewControllerWithFinalBounds:(CGRect)a3 finalCenter:(CGPoint)a4;
- (id)animationForTransitioningToAppContainerViewControllerWithFinalBounds:(CGRect)a3 finalCenter:(CGPoint)a4;
- (void)anchorViewDidMove;
- (void)loadView;
- (void)setAppContainerViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSendMenuViewController:(id)a3;
@end

@implementation CKSendMenuPopoverViewController

- (CKSendMenuPopoverViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKSendMenuPopoverViewController;
  v2 = [(CKSendMenuPopoverViewController *)&v6 initWithNibName:0 bundle:0];
  v3 = v2;
  if (v2)
  {
    appContainerViewController = v2->_appContainerViewController;
    v2->_appContainerViewController = 0;
  }
  return v3;
}

- (void)loadView
{
  v3 = objc_alloc_init(CKSendMenuPresentationPopoverView);
  [(CKSendMenuPopoverViewController *)self setView:v3];
}

- (UIViewController)sendMenuViewController
{
  return self->_sendMenuViewController;
}

- (void)setSendMenuViewController:(id)a3
{
  v5 = (UIViewController *)a3;
  p_sendMenuViewController = &self->_sendMenuViewController;
  sendMenuViewController = self->_sendMenuViewController;
  v11 = v5;
  if (sendMenuViewController != v5)
  {
    if (sendMenuViewController)
    {
      [(UIViewController *)sendMenuViewController willMoveToParentViewController:0];
      v8 = [(UIViewController *)*p_sendMenuViewController view];
      [v8 removeFromSuperview];

      [(UIViewController *)*p_sendMenuViewController removeFromParentViewController];
    }
    objc_storeStrong((id *)&self->_sendMenuViewController, a3);
    if (*p_sendMenuViewController)
    {
      -[CKSendMenuPopoverViewController addChildViewController:](self, "addChildViewController:");
      v9 = [(UIViewController *)*p_sendMenuViewController view];
      v10 = [(CKSendMenuPopoverViewController *)self popoverView];
      [v10 setSendMenuView:v9];

      [(UIViewController *)*p_sendMenuViewController didMoveToParentViewController:self];
    }
  }
}

- (void)setAppContainerViewController:(id)a3
{
  v5 = (UIViewController *)a3;
  p_appContainerViewController = &self->_appContainerViewController;
  appContainerViewController = self->_appContainerViewController;
  v12 = v5;
  if (appContainerViewController != v5)
  {
    if (appContainerViewController)
    {
      [(UIViewController *)appContainerViewController willMoveToParentViewController:0];
      v8 = [(UIViewController *)*p_appContainerViewController view];
      [v8 removeFromSuperview];

      [(UIViewController *)*p_appContainerViewController removeFromParentViewController];
    }
    objc_storeStrong((id *)&self->_appContainerViewController, a3);
    if (*p_appContainerViewController)
    {
      -[CKSendMenuPopoverViewController addChildViewController:](self, "addChildViewController:");
      v9 = [(UIViewController *)*p_appContainerViewController view];
      v10 = [(CKSendMenuPopoverViewController *)self popoverView];
      [v10 setAppView:v9];

      [(UIViewController *)*p_appContainerViewController didMoveToParentViewController:self];
      v11 = [(CKSendMenuPopoverViewController *)self delegate];
      [v11 appCardDidAppearInSendMenuPopoverViewController:self];
    }
  }
}

- (UIViewController)appContainerViewController
{
  return self->_appContainerViewController;
}

- (void)anchorViewDidMove
{
  id v2 = [(CKSendMenuPopoverViewController *)self presentationController];
  [v2 anchorViewDidMove];
}

- (id)animationForPresentingInitialViewControllerWithFinalBounds:(CGRect)a3 finalCenter:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double height = a3.size.height;
  double width = a3.size.width;
  double v8 = a3.origin.y;
  double v9 = a3.origin.x;
  v10 = [(CKSendMenuPopoverViewController *)self popoverView];
  v11 = objc_msgSend(v10, "animationForPresentingInitialViewWithFinalBounds:finalCenter:", v9, v8, width, height, x, y);

  return v11;
}

- (id)animationForDismissingWithFinalBounds:(CGRect)a3 finalCenter:(CGPoint)a4 finalAlpha:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  double height = a3.size.height;
  double width = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  v12 = [(CKSendMenuPopoverViewController *)self popoverView];
  v13 = objc_msgSend(v12, "animationForDismissingWithFinalBounds:finalCenter:finalAlpha:", v11, v10, width, height, x, y, a5);

  return v13;
}

- (id)animationForTransitioningToAppContainerViewControllerWithFinalBounds:(CGRect)a3 finalCenter:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double height = a3.size.height;
  double width = a3.size.width;
  double v8 = a3.origin.y;
  double v9 = a3.origin.x;
  double v10 = [(CKSendMenuPopoverViewController *)self popoverView];
  double v11 = objc_msgSend(v10, "animationForTransitioningToAppViewWithFinalBounds:finalCenter:", v9, v8, width, height, x, y);

  return v11;
}

- (CKSendMenuPopoverViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKSendMenuPopoverViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appContainerViewController, 0);

  objc_storeStrong((id *)&self->_sendMenuViewController, 0);
}

@end