@interface CKSendMenuPopoverPresentationController
- (BOOL)isPresenting;
- (BOOL)shouldPresentInFullscreen;
- (CGPoint)_anchorViewCenterInContainer;
- (CGRect)frameOfPresentedViewInContainerView;
- (CKPopoverViewLayout)popoverLayout;
- (CKPopoverViewLayoutMetrics)layoutMetricsCommunicatedToDelegate;
- (CKSendMenuPopoverPresentationConfiguration)configuration;
- (CKSendMenuPopoverPresentationController)initWithConfiguration:(id)a3 popoverViewController:(id)a4 presentingViewController:(id)a5;
- (CKSendMenuPopoverPresentationControllerAnchorItem)anchorItem;
- (CKSendMenuPopoverPresentationControllerDelegate)delegate;
- (CKSendMenuPopoverPresentationDimmingView)dimmingView;
- (UITapGestureRecognizer)dismissGestureRecognizer;
- (UIViewController)appCardContentViewController;
- (UIViewController)sendMenuViewController;
- (id)newPopoverLayoutMetrics;
- (id)presentedView;
- (int64_t)presentationState;
- (unint64_t)appCardPresentationStyle;
- (void)_appCardContentViewControllerPresentationTransitionWillBegin;
- (void)_didComputePopoverLayoutMetrics:(id)a3;
- (void)_sendMenuViewControllerPresentationTransitionWillBegin;
- (void)anchorViewDidMove;
- (void)containerViewWillLayoutSubviews;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)presentCardWithContentViewController:(id)a3 style:(unint64_t)a4 completion:(id)a5;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
- (void)sendMenuPopoverPresentationDimmingViewDidReceiveTap:(id)a3;
- (void)setAnchorItem:(id)a3;
- (void)setAppCardContentViewController:(id)a3;
- (void)setAppCardPresentationStyle:(unint64_t)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDimmingView:(id)a3;
- (void)setDismissGestureRecognizer:(id)a3;
- (void)setLayoutMetricsCommunicatedToDelegate:(id)a3;
- (void)setPopoverLayout:(id)a3;
- (void)setPresentationState:(int64_t)a3;
- (void)setSendMenuViewController:(id)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CKSendMenuPopoverPresentationController

- (CKSendMenuPopoverPresentationController)initWithConfiguration:(id)a3 popoverViewController:(id)a4 presentingViewController:(id)a5
{
  id v9 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKSendMenuPopoverPresentationController;
  v10 = [(CKSendMenuPopoverPresentationController *)&v21 initWithPresentedViewController:a4 presentingViewController:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_configuration, a3);
    v12 = +[CKUIBehavior sharedBehaviors];
    v13 = (void *)[v12 newSendMenuPopoverLayoutConfiguration];

    v14 = [[CKPopoverViewLayout alloc] initWithConfiguration:v13];
    popoverLayout = v11->_popoverLayout;
    v11->_popoverLayout = v14;

    v11->_presentationState = 0;
    layoutMetricsCommunicatedToDelegate = v11->_layoutMetricsCommunicatedToDelegate;
    v11->_layoutMetricsCommunicatedToDelegate = 0;

    v17 = [(CKSendMenuPopoverPresentationController *)v11 traitOverrides];
    v18 = self;
    [v17 setNSIntegerValue:3 forTrait:v18];

    v19 = [(CKSendMenuPopoverPresentationController *)v11 traitOverrides];
    [v19 setHorizontalSizeClass:1];
  }
  return v11;
}

- (BOOL)isPresenting
{
  int64_t presentationState = self->_presentationState;
  return presentationState == 2 || presentationState == 4;
}

- (CKSendMenuPopoverPresentationControllerAnchorItem)anchorItem
{
  return [(CKSendMenuPopoverPresentationConfiguration *)self->_configuration anchorItem];
}

- (void)setAnchorItem:(id)a3
{
}

- (UIViewController)sendMenuViewController
{
  return [(CKSendMenuPopoverPresentationConfiguration *)self->_configuration sendMenuViewController];
}

- (void)setSendMenuViewController:(id)a3
{
}

- (UIViewController)appCardContentViewController
{
  return [(CKSendMenuPopoverPresentationConfiguration *)self->_configuration appCardContentViewController];
}

- (void)setAppCardContentViewController:(id)a3
{
}

- (unint64_t)appCardPresentationStyle
{
  return [(CKSendMenuPopoverPresentationConfiguration *)self->_configuration appCardPresentationStyle];
}

- (void)setAppCardPresentationStyle:(unint64_t)a3
{
}

- (void)setDelegate:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKSendMenuPopoverPresentationController;
  [(CKSendMenuPopoverPresentationController *)&v3 setDelegate:a3];
}

- (CKSendMenuPopoverPresentationControllerDelegate)delegate
{
  v4.receiver = self;
  v4.super_class = (Class)CKSendMenuPopoverPresentationController;
  v2 = [(CKSendMenuPopoverPresentationController *)&v4 delegate];

  return (CKSendMenuPopoverPresentationControllerDelegate *)v2;
}

- (void)_didComputePopoverLayoutMetrics:(id)a3
{
  id v36 = a3;
  objc_super v4 = [(CKSendMenuPopoverPresentationController *)self delegate];

  if (v4)
  {
    layoutMetricsCommunicatedToDelegate = self->_layoutMetricsCommunicatedToDelegate;
    if (!layoutMetricsCommunicatedToDelegate) {
      goto LABEL_7;
    }
    [(CKPopoverViewLayoutMetrics *)layoutMetricsCommunicatedToDelegate frame];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    [v36 frame];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v35 = v9;
    v38.origin.x = v7;
    v38.origin.y = v9;
    v38.size.width = v11;
    v38.size.height = v13;
    double Width = CGRectGetWidth(v38);
    v39.origin.x = v15;
    v39.origin.y = v17;
    v39.size.width = v19;
    v39.size.height = v21;
    double v23 = CGRectGetWidth(v39);
    if (!CKFloatApproximatelyEqualToFloatWithTolerance(Width, v23, 0.00000999999975)) {
      goto LABEL_7;
    }
    v40.origin.y = v35;
    v40.origin.x = v7;
    v40.size.width = v11;
    v40.size.height = v13;
    double Height = CGRectGetHeight(v40);
    v41.origin.x = v15;
    v41.origin.y = v17;
    v41.size.width = v19;
    v41.size.height = v21;
    double v25 = CGRectGetHeight(v41);
    if (!CKFloatApproximatelyEqualToFloatWithTolerance(Height, v25, 0.00000999999975)) {
      goto LABEL_7;
    }
    v42.origin.y = v35;
    v42.origin.x = v7;
    v42.size.width = v11;
    v42.size.height = v13;
    double MinX = CGRectGetMinX(v42);
    v43.origin.x = v15;
    v43.origin.y = v17;
    v43.size.width = v19;
    v43.size.height = v21;
    double v27 = CGRectGetMinX(v43);
    if (!CKFloatApproximatelyEqualToFloatWithTolerance(MinX, v27, 0.00000999999975)) {
      goto LABEL_7;
    }
    v44.origin.y = v35;
    v44.origin.x = v7;
    v44.size.width = v11;
    v44.size.height = v13;
    double MinY = CGRectGetMinY(v44);
    v45.origin.x = v15;
    v45.origin.y = v17;
    v45.size.width = v19;
    v45.size.height = v21;
    double v29 = CGRectGetMinY(v45);
    if (!CKFloatApproximatelyEqualToFloatWithTolerance(MinY, v29, 0.00000999999975))
    {
LABEL_7:
      v30 = self->_layoutMetricsCommunicatedToDelegate;
      v31 = (CKPopoverViewLayoutMetrics *)v36;
      v32 = self->_layoutMetricsCommunicatedToDelegate;
      self->_layoutMetricsCommunicatedToDelegate = v31;
      v33 = v30;

      v34 = [(CKSendMenuPopoverPresentationController *)self delegate];
      [v34 sendMenuPresentationController:self didChangePopoverLayoutMetrics:v33];
    }
  }
}

- (void)presentationTransitionWillBegin
{
  objc_super v3 = [(CKSendMenuPopoverPresentationController *)self popoverView];
  [v3 setLayoutSubviewsEnabled:1];

  v28.receiver = self;
  v28.super_class = (Class)CKSendMenuPopoverPresentationController;
  [(CKSendMenuPopoverPresentationController *)&v28 presentationTransitionWillBegin];
  objc_super v4 = [(CKSendMenuPopoverPresentationController *)self sendMenuViewController];

  if (v4) {
    [(CKSendMenuPopoverPresentationController *)self _sendMenuViewControllerPresentationTransitionWillBegin];
  }
  else {
    [(CKSendMenuPopoverPresentationController *)self _appCardContentViewControllerPresentationTransitionWillBegin];
  }
  v5 = [(CKSendMenuPopoverPresentationController *)self anchorItem];
  double v6 = [v5 anchorView];
  [v6 setAlpha:0.0];

  CGFloat v7 = [(CKSendMenuPopoverPresentationController *)self containerView];
  double v8 = [(CKSendMenuPopoverPresentationController *)self anchorItem];
  CGFloat v9 = [v8 anchorView];

  [v9 bounds];
  objc_msgSend(v7, "convertRect:fromView:", v9);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v18 = [(CKSendMenuPopoverPresentationController *)self presentedViewController];
  CGFloat v19 = [(CKSendMenuPopoverPresentationController *)self popoverView];
  objc_msgSend(v19, "setFrame:", v11, v13, v15, v17);

  double v20 = objc_alloc_init(CKSendMenuPopoverPresentationDimmingView);
  dimmingView = self->_dimmingView;
  self->_dimmingView = v20;

  [(CKSendMenuPopoverPresentationDimmingView *)self->_dimmingView setDelegate:self];
  [v7 addSubview:self->_dimmingView];
  [v7 bounds];
  -[CKSendMenuPopoverPresentationDimmingView setFrame:](self->_dimmingView, "setFrame:");
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__CKSendMenuPopoverPresentationController_presentationTransitionWillBegin__block_invoke;
  aBlock[3] = &unk_1E5620C40;
  aBlock[4] = self;
  v22 = (void (**)(void))_Block_copy(aBlock);
  double v23 = [v18 transitionCoordinator];

  if (v23)
  {
    v24 = [v18 transitionCoordinator];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __74__CKSendMenuPopoverPresentationController_presentationTransitionWillBegin__block_invoke_2;
    v25[3] = &unk_1E5625048;
    v26 = v22;
    [v24 animateAlongsideTransition:v25 completion:0];
  }
  else
  {
    v22[2](v22);
  }
}

void __74__CKSendMenuPopoverPresentationController_presentationTransitionWillBegin__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) dimmingView];
  [v1 setActive:1];
}

uint64_t __74__CKSendMenuPopoverPresentationController_presentationTransitionWillBegin__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_appCardContentViewControllerPresentationTransitionWillBegin
{
  objc_super v3 = [(CKSendMenuPopoverPresentationController *)self popoverLayout];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __103__CKSendMenuPopoverPresentationController__appCardContentViewControllerPresentationTransitionWillBegin__block_invoke;
  v29[3] = &unk_1E5620C40;
  v29[4] = self;
  [v3 updateProperties:v29];

  popoverLayout = self->_popoverLayout;
  v5 = [(CKSendMenuPopoverPresentationController *)self containerView];
  id v6 = [(CKPopoverViewLayout *)popoverLayout newLayoutMetricsWithCoordinateSpace:v5];

  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  double v11 = [(CKSendMenuPopoverPresentationController *)self presentedViewController];
  objc_msgSend(v11, "setPreferredContentSize:", v8, v10);

  [v6 frame];
  double v13 = v12;
  double v15 = v14;
  [v6 frame];
  double v17 = v16;
  double v19 = v18;
  double v20 = [(CKSendMenuPopoverPresentationController *)self appCardContentViewController];
  objc_msgSend(v20, "setPreferredContentSize:", v17, v19);

  CGFloat v21 = [(CKSendMenuPopoverPresentationController *)self appCardContentViewController];
  v22 = [v21 view];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:1];

  double v23 = [(CKSendMenuPopoverPresentationController *)self appCardContentViewController];
  v24 = [v23 view];
  [v24 setAutoresizingMask:0];

  double v25 = [(CKSendMenuPopoverPresentationController *)self appCardContentViewController];
  v26 = [v25 view];
  objc_msgSend(v26, "setFrame:", 0.0, 0.0, v13, v15);

  double v27 = [(CKSendMenuPopoverPresentationController *)self popoverViewController];
  objc_super v28 = [v27 view];
  objc_msgSend(v28, "setFrame:", 0.0, 0.0, v13, v15);

  self->_int64_t presentationState = 4;
}

void __103__CKSendMenuPopoverPresentationController__appCardContentViewControllerPresentationTransitionWillBegin__block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) appCardPresentationStyle];
  if (v2 > 2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_18F81C778[v2];
  }
  objc_super v4 = [*(id *)(a1 + 32) popoverLayout];
  [v4 setState:v3];

  [*(id *)(a1 + 32) _anchorViewCenterInContainer];
  double v6 = v5;
  double v8 = v7;
  double v9 = [*(id *)(a1 + 32) popoverLayout];
  objc_msgSend(v9, "setAnchorCenter:", v6, v8);

  double v10 = [*(id *)(a1 + 32) anchorItem];
  [v10 anchorRect];
  double v12 = v11;
  double v14 = v13;
  double v15 = [*(id *)(a1 + 32) popoverLayout];
  objc_msgSend(v15, "setAnchorSize:", v12, v14);

  id v21 = [*(id *)(a1 + 32) containerView];
  [v21 bounds];
  double v17 = v16;
  double v19 = v18;
  double v20 = [*(id *)(a1 + 32) popoverLayout];
  objc_msgSend(v20, "setContainerSize:", v17, v19);
}

- (void)_sendMenuViewControllerPresentationTransitionWillBegin
{
  uint64_t v3 = [(CKSendMenuPopoverPresentationController *)self configuration];
  objc_super v4 = [v3 sendMenuViewController];
  [v4 preferredContentSize];
  double v6 = v5;
  double v8 = v7;
  double v9 = [(CKSendMenuPopoverPresentationController *)self presentedViewController];
  objc_msgSend(v9, "setPreferredContentSize:", v6, v8);

  self->_int64_t presentationState = 1;
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CKSendMenuPopoverPresentationController *)self popoverView];
  [v5 setLayoutSubviewsEnabled:1];

  v7.receiver = self;
  v7.super_class = (Class)CKSendMenuPopoverPresentationController;
  [(CKSendMenuPopoverPresentationController *)&v7 presentationTransitionDidEnd:v3];
  if (v3)
  {
    self->_int64_t presentationState = 2;
  }
  else
  {
    self->_int64_t presentationState = 0;
    [(CKSendMenuPopoverPresentationDimmingView *)self->_dimmingView removeFromSuperview];
    dimmingView = self->_dimmingView;
    self->_dimmingView = 0;
  }
}

- (void)dismissalTransitionWillBegin
{
  BOOL v3 = [(CKSendMenuPopoverPresentationController *)self popoverView];
  [v3 setLayoutSubviewsEnabled:0];

  v11.receiver = self;
  v11.super_class = (Class)CKSendMenuPopoverPresentationController;
  [(CKSendMenuPopoverPresentationController *)&v11 dismissalTransitionWillBegin];
  self->_int64_t presentationState = 3;
  objc_super v4 = [(CKSendMenuPopoverPresentationController *)self presentedViewController];
  double v5 = [v4 transitionCoordinator];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__CKSendMenuPopoverPresentationController_dismissalTransitionWillBegin__block_invoke;
  aBlock[3] = &unk_1E5620C40;
  aBlock[4] = self;
  double v6 = (void (**)(void))_Block_copy(aBlock);
  objc_super v7 = [(CKSendMenuPopoverPresentationController *)self delegate];
  [v7 sendMenuPresentationControllerWillDismiss:self];

  if (v5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __71__CKSendMenuPopoverPresentationController_dismissalTransitionWillBegin__block_invoke_2;
    v8[3] = &unk_1E5625048;
    double v9 = v6;
    [v5 animateAlongsideTransition:v8 completion:0];
  }
  else
  {
    v6[2](v6);
  }
}

void __71__CKSendMenuPopoverPresentationController_dismissalTransitionWillBegin__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) dimmingView];
  [v1 setActive:0];
}

uint64_t __71__CKSendMenuPopoverPresentationController_dismissalTransitionWillBegin__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  BOOL v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKSendMenuPopoverPresentationController;
  -[CKSendMenuPopoverPresentationController dismissalTransitionDidEnd:](&v12, sel_dismissalTransitionDidEnd_);
  if (v3)
  {
    self->_int64_t presentationState = 0;
    [(CKSendMenuPopoverPresentationDimmingView *)self->_dimmingView removeFromSuperview];
    dimmingView = self->_dimmingView;
    self->_dimmingView = 0;
  }
  double v6 = [(CKSendMenuPopoverPresentationController *)self anchorItem];
  objc_super v7 = [v6 anchorView];
  [v7 setAlpha:1.0];

  double v8 = [(CKSendMenuPopoverPresentationController *)self popoverView];
  double v9 = [v8 sendMenuView];
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v11[0] = *MEMORY[0x1E4F1DAB8];
  v11[1] = v10;
  v11[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v9 setTransform:v11];
}

- (id)presentedView
{
  v4.receiver = self;
  v4.super_class = (Class)CKSendMenuPopoverPresentationController;
  unint64_t v2 = [(CKSendMenuPopoverPresentationController *)&v4 presentedView];

  return v2;
}

- (void)containerViewWillLayoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)CKSendMenuPopoverPresentationController;
  [(CKSendMenuPopoverPresentationController *)&v17 containerViewWillLayoutSubviews];
  BOOL v3 = [(CKSendMenuPopoverPresentationController *)self anchorItem];
  BOOL v4 = [(CKSendMenuPopoverPresentationController *)self isPresenting];
  [(CKSendMenuPopoverPresentationController *)self frameOfPresentedViewInContainerView];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(CKSendMenuPopoverPresentationController *)self popoverView];
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  if (v4)
  {
    double v14 = [(CKSendMenuPopoverPresentationController *)self popoverView];
    [v14 setNeedsLayout];

    double v15 = [(CKSendMenuPopoverPresentationController *)self popoverView];
    [v15 layoutIfNeeded];
  }
  double v16 = [(CKSendMenuPopoverPresentationController *)self containerView];
  [v16 bounds];
  -[CKSendMenuPopoverPresentationDimmingView setFrame:](self->_dimmingView, "setFrame:");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CKSendMenuPopoverPresentationController;
  id v7 = a4;
  -[CKSendMenuPopoverPresentationController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__CKSendMenuPopoverPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E5621550;
  void v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
}

void __94__CKSendMenuPopoverPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) containerView];
  [v1 setNeedsLayout];
}

- (CGRect)frameOfPresentedViewInContainerView
{
  BOOL v3 = [(CKSendMenuPopoverPresentationController *)self anchorItem];
  popoverLayout = self->_popoverLayout;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  double v23 = __78__CKSendMenuPopoverPresentationController_frameOfPresentedViewInContainerView__block_invoke;
  v24 = &unk_1E5620AF8;
  double v25 = self;
  id v26 = v3;
  id v5 = v3;
  [(CKPopoverViewLayout *)popoverLayout updateProperties:&v21];
  double v6 = self->_popoverLayout;
  id v7 = [(CKSendMenuPopoverPresentationController *)self containerView];
  id v8 = [(CKPopoverViewLayout *)v6 newLayoutMetricsWithCoordinateSpace:v7];

  [(CKSendMenuPopoverPresentationController *)self _didComputePopoverLayoutMetrics:v8];
  [v8 frame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

void __78__CKSendMenuPopoverPresentationController_frameOfPresentedViewInContainerView__block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) presentedViewController];
  [v2 preferredContentSize];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 352), "setPreferredContentSize:");

  [*(id *)(a1 + 32) _anchorViewCenterInContainer];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 352), "setAnchorCenter:");
  [*(id *)(a1 + 40) anchorRect];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 352), "setAnchorSize:", v3, v4);
  id v7 = [*(id *)(a1 + 32) containerView];
  [v7 bounds];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 352), "setContainerSize:", v5, v6);
}

- (BOOL)shouldPresentInFullscreen
{
  return 1;
}

- (void)sendMenuPopoverPresentationDimmingViewDidReceiveTap:(id)a3
{
  id v4 = [(CKSendMenuPopoverPresentationController *)self delegate];
  [v4 sendMenuPresentationControllerWantsToBeDismissed:self];
}

- (void)presentCardWithContentViewController:(id)a3 style:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v10 = [(CKSendMenuPopoverPresentationController *)self popoverView];
  [v10 setLayoutSubviewsEnabled:0];

  self->_int64_t presentationState = 4;
  double v11 = [(CKSendMenuPopoverPresentationController *)self presentedViewController];
  double v12 = [(CKSendMenuPopoverPresentationController *)self popoverLayout];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __97__CKSendMenuPopoverPresentationController_presentCardWithContentViewController_style_completion___block_invoke;
  v40[3] = &unk_1E5622950;
  v40[4] = self;
  v40[5] = a4;
  [v12 updateProperties:v40];

  popoverLayout = self->_popoverLayout;
  double v14 = [(CKSendMenuPopoverPresentationController *)self containerView];
  id v15 = [(CKPopoverViewLayout *)popoverLayout newLayoutMetricsWithCoordinateSpace:v14];

  [(CKSendMenuPopoverPresentationController *)self _didComputePopoverLayoutMetrics:v15];
  [v15 frame];
  CGFloat x = v41.origin.x;
  CGFloat y = v41.origin.y;
  double width = v41.size.width;
  double height = v41.size.height;
  double MinX = CGRectGetMinX(v41);
  v42.origin.CGFloat x = x;
  v42.origin.CGFloat y = y;
  v42.size.double width = width;
  v42.size.double height = height;
  double v21 = MinX + CGRectGetWidth(v42) * 0.5;
  v43.origin.CGFloat x = x;
  v43.origin.CGFloat y = y;
  v43.size.double width = width;
  v43.size.double height = height;
  double MinY = CGRectGetMinY(v43);
  v44.origin.CGFloat x = x;
  v44.origin.CGFloat y = y;
  v44.size.double width = width;
  v44.size.double height = height;
  CGFloat v23 = CGRectGetHeight(v44);
  v24 = (void *)MEMORY[0x1E4F42FF0];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __97__CKSendMenuPopoverPresentationController_presentCardWithContentViewController_style_completion___block_invoke_2;
  v32[3] = &unk_1E5625070;
  double v25 = MinY + v23 * 0.5;
  id v33 = v11;
  id v34 = v8;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  double v38 = width;
  double v39 = height;
  CGFloat v35 = self;
  id v26 = v8;
  id v27 = v11;
  [v24 performWithoutAnimation:v32];
  objc_super v28 = objc_msgSend(v27, "animationForTransitioningToAppContainerViewControllerWithFinalBounds:finalCenter:", 0.0, 0.0, width, height, v21, v25);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __97__CKSendMenuPopoverPresentationController_presentCardWithContentViewController_style_completion___block_invoke_3;
  v30[3] = &unk_1E5622330;
  v30[4] = self;
  id v31 = v9;
  id v29 = v9;
  [v28 setCompletion:v30];
  [v28 startAnimation];
}

void __97__CKSendMenuPopoverPresentationController_presentCardWithContentViewController_style_completion___block_invoke(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 40);
  if (v1 > 2) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = qword_18F81C778[v1];
  }
  id v3 = [*(id *)(a1 + 32) popoverLayout];
  [v3 setState:v2];
}

void __97__CKSendMenuPopoverPresentationController_presentCardWithContentViewController_style_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAppContainerViewController:*(void *)(a1 + 40)];
  double v2 = *(double *)(a1 + 56);
  double v3 = *(double *)(a1 + 64);
  double v4 = *(double *)(a1 + 72);
  double v5 = *(double *)(a1 + 80);
  double v6 = [*(id *)(a1 + 40) view];
  objc_msgSend(v6, "setBounds:", v2, v3, v4, v5);

  id v7 = [*(id *)(a1 + 48) popoverView];
  id v8 = [v7 sendMenuView];
  [v8 center];
  double v10 = v9;
  double v12 = v11;
  double v13 = [*(id *)(a1 + 40) view];
  objc_msgSend(v13, "setCenter:", v10, v12);

  double v14 = [*(id *)(a1 + 40) view];
  [v14 setNeedsLayout];

  id v15 = [*(id *)(a1 + 40) view];
  [v15 layoutIfNeeded];

  id v16 = [*(id *)(a1 + 40) view];
  [v16 setAlpha:0.0];
}

uint64_t __97__CKSendMenuPopoverPresentationController_presentCardWithContentViewController_style_completion___block_invoke_3(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) popoverView];
  [v2 setLayoutSubviewsEnabled:1];

  double v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (void)anchorViewDidMove
{
  popoverLayout = self->_popoverLayout;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__CKSendMenuPopoverPresentationController_anchorViewDidMove__block_invoke;
  v5[3] = &unk_1E5620C40;
  v5[4] = self;
  [(CKPopoverViewLayout *)popoverLayout updateProperties:v5];
  double v4 = [(CKSendMenuPopoverPresentationController *)self containerView];
  [v4 setNeedsLayout];
}

uint64_t __60__CKSendMenuPopoverPresentationController_anchorViewDidMove__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _anchorViewCenterInContainer];
  double v2 = *(void **)(*(void *)(a1 + 32) + 352);

  return objc_msgSend(v2, "setAnchorCenter:");
}

- (CGPoint)_anchorViewCenterInContainer
{
  double v3 = [(CKSendMenuPopoverPresentationController *)self anchorItem];
  double v4 = [(CKSendMenuPopoverPresentationController *)self containerView];
  double v5 = [v3 anchorView];
  [v5 center];
  double v7 = v6;
  double v9 = v8;
  double v10 = [v3 anchorView];
  double v11 = [v10 superview];
  objc_msgSend(v4, "convertPoint:fromView:", v11, v7, v9);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.CGFloat y = v17;
  result.CGFloat x = v16;
  return result;
}

- (id)newPopoverLayoutMetrics
{
  popoverLayout = self->_popoverLayout;
  double v3 = [(CKSendMenuPopoverPresentationController *)self containerView];
  id v4 = [(CKPopoverViewLayout *)popoverLayout newLayoutMetricsWithCoordinateSpace:v3];

  return v4;
}

- (CKPopoverViewLayout)popoverLayout
{
  return self->_popoverLayout;
}

- (void)setPopoverLayout:(id)a3
{
}

- (CKSendMenuPopoverPresentationDimmingView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
}

- (UITapGestureRecognizer)dismissGestureRecognizer
{
  return self->_dismissGestureRecognizer;
}

- (void)setDismissGestureRecognizer:(id)a3
{
}

- (CKSendMenuPopoverPresentationConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (int64_t)presentationState
{
  return self->_presentationState;
}

- (void)setPresentationState:(int64_t)a3
{
  self->_int64_t presentationState = a3;
}

- (CKPopoverViewLayoutMetrics)layoutMetricsCommunicatedToDelegate
{
  return self->_layoutMetricsCommunicatedToDelegate;
}

- (void)setLayoutMetricsCommunicatedToDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutMetricsCommunicatedToDelegate, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_dismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);

  objc_storeStrong((id *)&self->_popoverLayout, 0);
}

@end