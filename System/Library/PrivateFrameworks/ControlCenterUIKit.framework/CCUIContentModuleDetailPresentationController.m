@interface CCUIContentModuleDetailPresentationController
- (BOOL)_shouldRespectDefinesPresentationContext;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)shouldPresentInFullscreen;
- (CCUIContentModuleDetailPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4 anchoringViewController:(id)a5;
- (double)_preferredExpandedContentHeightForViewController:(id)a3;
- (double)_preferredExpandedContentWidthForViewController:(id)a3;
- (void)_handleBackgroundTap:(id)a3;
- (void)containerViewWillLayoutSubviews;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)presentationTransitionWillBegin;
@end

@implementation CCUIContentModuleDetailPresentationController

- (CCUIContentModuleDetailPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4 anchoringViewController:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CCUIContentModuleDetailPresentationController;
  v10 = [(CCUIContentModuleDetailPresentationController *)&v13 initWithPresentedViewController:a3 presentingViewController:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_anchoringViewController, a5);
  }

  return v11;
}

- (void)containerViewWillLayoutSubviews
{
  v41.receiver = self;
  v41.super_class = (Class)CCUIContentModuleDetailPresentationController;
  [(CCUIContentModuleDetailPresentationController *)&v41 containerViewWillLayoutSubviews];
  v3 = [(UIViewController *)self->_anchoringViewController view];
  v4 = [(CCUIContentModuleDetailPresentationController *)self containerView];
  if (v3
    && ([MEMORY[0x1E4FB16C8] currentDevice],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 userInterfaceIdiom],
        v5,
        v6))
  {
    v7 = [(UIViewController *)self->_anchoringViewController bs_presentationContextDefiningViewController];
    v8 = [v7 view];

    [v3 bounds];
    objc_msgSend(v3, "convertRect:toView:", v8);
    CGFloat x = v42.origin.x;
    CGFloat y = v42.origin.y;
    CGFloat width = v42.size.width;
    CGFloat height = v42.size.height;
    CGRectGetMidX(v42);
    v43.origin.CGFloat x = x;
    v43.origin.CGFloat y = y;
    v43.size.CGFloat width = width;
    v43.size.CGFloat height = height;
    CGRectGetMidY(v43);
  }
  else
  {
    [v4 center];
  }
  objc_super v13 = [(CCUIContentModuleDetailPresentationController *)self presentedViewController];
  [(CCUIContentModuleDetailPresentationController *)self _preferredExpandedContentWidthForViewController:v13];
  [(CCUIContentModuleDetailPresentationController *)self _preferredExpandedContentHeightForViewController:v13];
  UIRectCenteredAboutPoint();
  double v15 = v14;
  CGFloat v17 = v16;
  double v19 = v18;
  double v21 = v20;
  [v4 bounds];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v30 = CCUIExpandedModuleEdgeInsets();
  CGFloat v32 = v23 + v31;
  CGFloat v33 = v25 + v30;
  CGFloat v35 = v27 - (v31 + v34);
  CGFloat v37 = v29 - (v30 + v36);
  v44.origin.CGFloat x = v15;
  v44.origin.CGFloat y = v17;
  v44.size.CGFloat width = v19;
  v44.size.CGFloat height = v21;
  double MinY = CGRectGetMinY(v44);
  v45.origin.CGFloat x = v32;
  v45.origin.CGFloat y = v33;
  v45.size.CGFloat width = v35;
  v45.size.CGFloat height = v37;
  double v39 = CGRectGetMinY(v45);
  if (MinY < v39) {
    double MinY = v39;
  }
  v40 = [(CCUIContentModuleDetailPresentationController *)self presentedView];
  objc_msgSend(v40, "setFrame:", v15, MinY, v19, v21);
  [v4 addSubview:v40];
}

- (void)presentationTransitionWillBegin
{
  v5.receiver = self;
  v5.super_class = (Class)CCUIContentModuleDetailPresentationController;
  [(CCUIContentModuleDetailPresentationController *)&v5 presentationTransitionWillBegin];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleBackgroundTap_];
  [v3 setDelegate:self];
  v4 = [(CCUIContentModuleDetailPresentationController *)self containerView];
  [v4 addGestureRecognizer:v3];
}

- (BOOL)shouldPresentInFullscreen
{
  return 0;
}

- (BOOL)_shouldRespectDefinesPresentationContext
{
  return 1;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CCUIContentModuleDetailPresentationController;
  [(CCUIContentModuleDetailPresentationController *)&v9 preferredContentSizeDidChangeForChildContentContainer:a3];
  v4 = [(CCUIContentModuleDetailPresentationController *)self containerView];
  [v4 setNeedsLayout];
  objc_super v5 = (void *)MEMORY[0x1E4FB1EB0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __103__CCUIContentModuleDetailPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke;
  v7[3] = &unk_1E6AD41E8;
  id v8 = v4;
  id v6 = v4;
  [v5 animateWithDuration:v7 animations:0.3];
}

uint64_t __103__CCUIContentModuleDetailPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(CCUIContentModuleDetailPresentationController *)self presentedViewController];
  v7 = [(id)v6 view];
  [v5 locationInView:v7];
  double v9 = v8;
  double v11 = v10;

  v12 = [(CCUIContentModuleDetailPresentationController *)self presentedViewController];
  objc_super v13 = [v12 view];
  LOBYTE(v6) = objc_msgSend(v13, "pointInside:withEvent:", 0, v9, v11);

  return v6 ^ 1;
}

- (void)_handleBackgroundTap:(id)a3
{
  id v3 = [(CCUIContentModuleDetailPresentationController *)self presentedViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (double)_preferredExpandedContentWidthForViewController:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    [v3 preferredExpandedContentWidth];
  }
  else {
    double v4 = CCUIDefaultExpandedContentModuleWidth();
  }
  double v5 = v4;

  return v5;
}

- (double)_preferredExpandedContentHeightForViewController:(id)a3
{
  id v3 = a3;
  double v4 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v3 preferredExpandedContentHeight];
    double v4 = v5;
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end