@interface AMSUIPrivacyPresentationController
- (AMSUIPrivacyPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (BOOL)shouldRemovePresentersView;
- (CGRect)_frameForTransitionViewInPresentationSuperview:(id)a3;
- (UIView)dimmingView;
- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4;
- (int64_t)adaptivePresentationStyle;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (void)_prepareDimmingViewIfNecessary;
- (void)containerViewDidLayoutSubviews;
- (void)containerViewWillLayoutSubviews;
- (void)presentationTransitionWillBegin;
- (void)setDimmingView:(id)a3;
@end

@implementation AMSUIPrivacyPresentationController

- (AMSUIPrivacyPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AMSUIPrivacyPresentationController;
  v4 = [(AMSUIPrivacyPresentationController *)&v7 initWithPresentedViewController:a3 presentingViewController:a4];
  v5 = v4;
  if (v4) {
    [(AMSUIPrivacyPresentationController *)v4 setDelegate:v4];
  }
  return v5;
}

- (int64_t)adaptivePresentationStyle
{
  return 4;
}

- (void)containerViewWillLayoutSubviews
{
  [(AMSUIPrivacyPresentationController *)self _prepareDimmingViewIfNecessary];
  v3 = [(AMSUIPrivacyPresentationController *)self presentedViewController];
  id v21 = [v3 view];

  [v21 _setContinuousCornerRadius:16.0];
  v4 = [(AMSUIPrivacyPresentationController *)self containerView];
  [v4 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  v13 = [(AMSUIPrivacyPresentationController *)self presentedViewController];
  [v13 preferredContentSize];
  double v15 = v14;
  double v17 = v16;

  v23.origin.x = v6;
  v23.origin.y = v8;
  v23.size.width = v10;
  v23.size.height = v12;
  double v18 = CGRectGetWidth(v23) + -40.0;
  if (v18 < v15) {
    double v15 = v18;
  }
  v24.origin.x = v6;
  v24.origin.y = v8;
  v24.size.width = v10;
  v24.size.height = v12;
  double v19 = CGRectGetHeight(v24) + -40.0;
  if (v19 < v17) {
    double v17 = v19;
  }
  v25.origin.x = v6;
  v25.origin.y = v8;
  v25.size.width = v10;
  v25.size.height = v12;
  CGFloat v20 = CGRectGetMidX(v25) - v15 * 0.5;
  v26.origin.x = v6;
  v26.origin.y = v8;
  v26.size.width = v10;
  v26.size.height = v12;
  objc_msgSend(v21, "setFrame:", v20, CGRectGetMidY(v26) - v17 * 0.5, v15, v17);
}

- (void)containerViewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)AMSUIPrivacyPresentationController;
  [(AMSUIPrivacyPresentationController *)&v14 containerViewDidLayoutSubviews];
  v3 = [(AMSUIPrivacyPresentationController *)self dimmingView];

  if (v3)
  {
    v4 = [(AMSUIPrivacyPresentationController *)self containerView];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v13 = [(AMSUIPrivacyPresentationController *)self dimmingView];
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);
  }
}

- (BOOL)shouldRemovePresentersView
{
  return 0;
}

- (CGRect)_frameForTransitionViewInPresentationSuperview:(id)a3
{
  [a3 bounds];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_prepareDimmingViewIfNecessary
{
  id v10 = [(AMSUIPrivacyPresentationController *)self presentedViewController];
  double v3 = [(AMSUIPrivacyPresentationController *)self dimmingView];

  double v4 = v10;
  if (!v3 && v10)
  {
    double v5 = [(AMSUIPrivacyPresentationController *)self containerView];
    double v6 = [(AMSUIPrivacyPresentationController *)self dimmingView];
    [v6 removeFromSuperview];

    id v7 = objc_alloc(MEMORY[0x263F82E00]);
    double v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    double v9 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.4];
    [v8 setBackgroundColor:v9];

    [(AMSUIPrivacyPresentationController *)self setDimmingView:v8];
    [v5 insertSubview:v8 atIndex:0];
    [v5 sendSubviewToBack:v8];

    double v4 = v10;
  }
}

- (void)presentationTransitionWillBegin
{
  id v4 = [(AMSUIPrivacyPresentationController *)self containerView];
  double v3 = [(AMSUIPrivacyPresentationController *)self presentedView];
  [v4 addSubview:v3];

  [(AMSUIPrivacyPresentationController *)self _prepareDimmingViewIfNecessary];
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  return 0;
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end