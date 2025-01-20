@interface AMSUIToastPresentationController
- (AMSUIToastPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (AMSUITouchForwardingView)touchForwardingView;
- (BOOL)isShowing;
- (CGRect)frameOfPresentedViewInContainerView;
- (CGRect)lastFrameOfPresentedViewInContainerView;
- (NSArray)passthroughViews;
- (NSTimer)dismissalTimer;
- (UIPanGestureRecognizer)panRecognizer;
- (UITabBarController)relativeTabBarController;
- (_UIHyperInteractor)interactor;
- (_UIHyperrectangle)interactiveRegion;
- (double)_bottomMargin;
- (double)_yOffset;
- (double)dismissDelayTimeInterval;
- (int64_t)presentationStyle;
- (void)_didPanPresentedView:(id)a3;
- (void)_dismissToast;
- (void)_hyperInteractorApplyPresentationPoint:(id)a3;
- (void)_setupPanGestureRecognizer;
- (void)_setupPassthroughView;
- (void)_startDismissTimer;
- (void)containerViewWillLayoutSubviews;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
- (void)setDismissDelayTimeInterval:(double)a3;
- (void)setDismissalTimer:(id)a3;
- (void)setLastFrameOfPresentedViewInContainerView:(CGRect)a3;
- (void)setPanRecognizer:(id)a3;
- (void)setPassthroughViews:(id)a3;
- (void)setRelativeTabBarController:(id)a3;
- (void)setShowing:(BOOL)a3;
- (void)setTouchForwardingView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AMSUIToastPresentationController

- (AMSUIToastPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)AMSUIToastPresentationController;
  v4 = [(AMSUIToastPresentationController *)&v15 initWithPresentedViewController:a3 presentingViewController:a4];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x263F82FC8]) initWithDimensions:1];
    v6 = (void *)*((void *)v4 + 49);
    *((void *)v4 + 49) = v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x263F82FB0]) initWithDimensions:1];
    v8 = (void *)*((void *)v4 + 48);
    *((void *)v4 + 48) = v7;

    [*((id *)v4 + 48) _setRegion:*((void *)v4 + 49)];
    [*((id *)v4 + 48) _setDelegate:v4];
    v4[352] = 1;
    v9 = [AMSUITouchForwardingView alloc];
    v10 = (_OWORD *)MEMORY[0x263F001A8];
    uint64_t v11 = -[AMSUITouchForwardingView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    v12 = (void *)*((void *)v4 + 52);
    *((void *)v4 + 52) = v11;

    long long v13 = v10[1];
    *(_OWORD *)(v4 + 424) = *v10;
    *(_OWORD *)(v4 + 440) = v13;
    *((void *)v4 + 46) = 0x4014000000000000;
  }
  return (AMSUIToastPresentationController *)v4;
}

- (void)containerViewWillLayoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)AMSUIToastPresentationController;
  [(AMSUIToastPresentationController *)&v12 containerViewWillLayoutSubviews];
  -[AMSUIToastPresentationController setLastFrameOfPresentedViewInContainerView:](self, "setLastFrameOfPresentedViewInContainerView:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(AMSUIToastPresentationController *)self frameOfPresentedViewInContainerView];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(AMSUIToastPresentationController *)self presentedView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (void)dismissalTransitionWillBegin
{
  v4.receiver = self;
  v4.super_class = (Class)AMSUIToastPresentationController;
  [(AMSUIToastPresentationController *)&v4 dismissalTransitionWillBegin];
  double v3 = [(AMSUIToastPresentationController *)self dismissalTimer];
  [v3 invalidate];

  [(AMSUIToastPresentationController *)self setDismissalTimer:0];
}

- (int64_t)presentationStyle
{
  return 6;
}

- (CGRect)frameOfPresentedViewInContainerView
{
  double v3 = [(AMSUIToastPresentationController *)self presentedView];
  objc_super v4 = [(AMSUIToastPresentationController *)self containerView];
  double v5 = v4;
  if (!v4 || !v3)
  {

    goto LABEL_8;
  }
  double v6 = [(AMSUIToastPresentationController *)self presentingViewController];

  if (!v6)
  {
LABEL_8:
    double v13 = *MEMORY[0x263F001A8];
    double v14 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v15 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v16 = *(double *)(MEMORY[0x263F001A8] + 24);
    goto LABEL_9;
  }
  [(AMSUIToastPresentationController *)self lastFrameOfPresentedViewInContainerView];
  if (!CGRectEqualToRect(v50, *MEMORY[0x263F001A8]))
  {
    [(AMSUIToastPresentationController *)self lastFrameOfPresentedViewInContainerView];
    double v13 = v21;
    double v14 = v22;
    double v15 = v23;
    double v16 = v24;
    goto LABEL_10;
  }
  double v7 = [(AMSUIToastPresentationController *)self presentedViewController];
  [v7 preferredContentSize];
  double v9 = v8;

  if (v9 == 0.0)
  {
    double v10 = [(AMSUIToastPresentationController *)self containerView];
    [v10 frame];
    double v12 = v25 + -24.0;
  }
  else
  {
    double v10 = [(AMSUIToastPresentationController *)self presentedViewController];
    [v10 preferredContentSize];
    double v12 = v11;
  }

  double v15 = fmin(v12, 556.0);
  v26 = [(AMSUIToastPresentationController *)self containerView];
  [v26 frame];
  double v16 = v27;

  if ([v3 _wantsAutolayout]) {
    objc_msgSend(v3, "systemLayoutSizeFittingSize:", v15, v16);
  }
  else {
    objc_msgSend(v3, "sizeThatFits:", v15, v16);
  }
  if (v28 < v16) {
    double v16 = v28;
  }
  v29 = [(AMSUIToastPresentationController *)self containerView];
  [v29 frame];
  double v13 = (v30 - v15) * 0.5;

  v31 = [(AMSUIToastPresentationController *)self containerView];
  [v31 frame];
  double v33 = v32 - v16;
  [(AMSUIToastPresentationController *)self _bottomMargin];
  double v35 = v33 - v34;

  [(AMSUIToastPresentationController *)self _yOffset];
  double v37 = v35 - v36;
  v38 = [(AMSUIToastPresentationController *)self containerView];
  [v38 frame];
  double v40 = v39;
  [(AMSUIToastPresentationController *)self _bottomMargin];
  double v42 = v16 * 0.5 + v41 + v40;

  v43 = [(AMSUIToastPresentationController *)self interactiveRegion];
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __71__AMSUIToastPresentationController_frameOfPresentedViewInContainerView__block_invoke;
  v49[3] = &__block_descriptor_40_e9_v16__0_d8l;
  *(double *)&v49[4] = v37;
  [v43 _mutateMinimumPoint:v49];

  v44 = [(AMSUIToastPresentationController *)self interactiveRegion];
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __71__AMSUIToastPresentationController_frameOfPresentedViewInContainerView__block_invoke_2;
  v48[3] = &__block_descriptor_40_e9_v16__0_d8l;
  *(double *)&v48[4] = v42;
  [v44 _mutateMaximumPoint:v48];

  v45 = [(AMSUIToastPresentationController *)self interactor];
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __71__AMSUIToastPresentationController_frameOfPresentedViewInContainerView__block_invoke_3;
  v47[3] = &unk_2643E4678;
  v47[4] = self;
  *(double *)&v47[5] = v37;
  *(double *)&v47[6] = v42;
  [v45 _mutateUnconstrainedPoint:v47];

  v46 = [(AMSUIToastPresentationController *)self interactor];
  double v14 = *(double *)[v46 _presentationPoint];

LABEL_9:
  -[AMSUIToastPresentationController setLastFrameOfPresentedViewInContainerView:](self, "setLastFrameOfPresentedViewInContainerView:", v13, v14, v15, v16);
LABEL_10:

  double v17 = v13;
  double v18 = v14;
  double v19 = v15;
  double v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

double __71__AMSUIToastPresentationController_frameOfPresentedViewInContainerView__block_invoke(uint64_t a1, double *a2)
{
  double result = *(double *)(a1 + 32);
  *a2 = result;
  return result;
}

double __71__AMSUIToastPresentationController_frameOfPresentedViewInContainerView__block_invoke_2(uint64_t a1, double *a2)
{
  double result = *(double *)(a1 + 32);
  *a2 = result;
  return result;
}

double __71__AMSUIToastPresentationController_frameOfPresentedViewInContainerView__block_invoke_3(uint64_t a1, double *a2)
{
  int v4 = [*(id *)(a1 + 32) isShowing];
  uint64_t v5 = 48;
  if (v4) {
    uint64_t v5 = 40;
  }
  double result = *(double *)(a1 + v5);
  *a2 = result;
  return result;
}

- (void)presentationTransitionWillBegin
{
  v3.receiver = self;
  v3.super_class = (Class)AMSUIToastPresentationController;
  [(AMSUIToastPresentationController *)&v3 presentationTransitionWillBegin];
  [(AMSUIToastPresentationController *)self _setupPassthroughView];
  [(AMSUIToastPresentationController *)self _setupPanGestureRecognizer];
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AMSUIToastPresentationController;
  -[AMSUIToastPresentationController presentationTransitionDidEnd:](&v5, sel_presentationTransitionDidEnd_);
  if (v3) {
    [(AMSUIToastPresentationController *)self _startDismissTimer];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)AMSUIToastPresentationController;
  id v4 = a3;
  [(AMSUIToastPresentationController *)&v15 traitCollectionDidChange:v4];
  objc_super v5 = [(AMSUIToastPresentationController *)self traitCollection];
  double v6 = [v5 preferredContentSizeCategory];
  double v7 = [v4 preferredContentSizeCategory];

  double v8 = [(AMSUIToastPresentationController *)self traitCollection];
  uint64_t v9 = [v8 horizontalSizeClass];
  uint64_t v10 = [v4 horizontalSizeClass];

  double v11 = [(AMSUIToastPresentationController *)self traitCollection];
  uint64_t v12 = [v11 verticalSizeClass];
  uint64_t v13 = [v4 verticalSizeClass];

  if (v12 != v13 || v9 != v10 || v6 != v7)
  {
    double v14 = [(AMSUIToastPresentationController *)self containerView];
    [v14 setNeedsLayout];
  }
}

- (void)_hyperInteractorApplyPresentationPoint:(id)a3
{
  id v4 = [(AMSUIToastPresentationController *)self containerView];
  [v4 setNeedsLayout];

  id v5 = [(AMSUIToastPresentationController *)self containerView];
  [v5 layoutIfNeeded];
}

- (void)_setupPassthroughView
{
  v20[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [(AMSUIToastPresentationController *)self containerView];

  if (v3)
  {
    id v4 = [(AMSUIToastPresentationController *)self containerView];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    uint64_t v13 = [(AMSUIToastPresentationController *)self touchForwardingView];
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

    double v14 = [(AMSUIToastPresentationController *)self containerView];
    objc_super v15 = [(AMSUIToastPresentationController *)self touchForwardingView];
    [v14 insertSubview:v15 atIndex:0];

    double v16 = [(AMSUIToastPresentationController *)self passthroughViews];

    if (!v16)
    {
      double v17 = [(AMSUIToastPresentationController *)self presentingViewController];
      double v18 = [v17 view];
      v20[0] = v18;
      double v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
      [(AMSUIToastPresentationController *)self setPassthroughViews:v19];
    }
  }
}

- (void)_startDismissTimer
{
  [(AMSUIToastPresentationController *)self dismissDelayTimeInterval];
  if (v3 > 0.0)
  {
    id v4 = [(AMSUIToastPresentationController *)self dismissalTimer];
    [v4 invalidate];

    double v5 = (void *)MEMORY[0x263EFFA20];
    [(AMSUIToastPresentationController *)self dismissDelayTimeInterval];
    objc_msgSend(v5, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__dismissTimerFired_, 0, 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(AMSUIToastPresentationController *)self setDismissalTimer:v6];
  }
}

- (void)_setupPanGestureRecognizer
{
  double v3 = [(AMSUIToastPresentationController *)self presentedView];

  if (v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F82A00]) initWithTarget:self action:sel__didPanPresentedView_];
    [(AMSUIToastPresentationController *)self setPanRecognizer:v4];

    id v6 = [(AMSUIToastPresentationController *)self presentedView];
    double v5 = [(AMSUIToastPresentationController *)self panRecognizer];
    [v6 addGestureRecognizer:v5];
  }
}

- (void)_didPanPresentedView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AMSUIToastPresentationController *)self presentedView];
  if (v5)
  {
    id v6 = (void *)v5;
    double v7 = [(AMSUIToastPresentationController *)self containerView];

    if (v7)
    {
      double v8 = [(AMSUIToastPresentationController *)self dismissalTimer];
      [v8 invalidate];

      uint64_t v9 = [v4 state];
      if ((unint64_t)(v9 - 3) < 2)
      {
        double v20 = [(AMSUIToastPresentationController *)self containerView];
        [v4 translationInView:v20];
        double v22 = v21;

        double v23 = [(AMSUIToastPresentationController *)self containerView];
        [v4 velocityInView:v23];
        double v25 = v24;

        if (v25 < 400.0 && v22 <= 20.0 && [(AMSUIToastPresentationController *)self isShowing])
        {
          v26 = [(AMSUIToastPresentationController *)self interactor];
          double v27 = *(double *)[v26 _projectedPoint];
          double v28 = [(AMSUIToastPresentationController *)self containerView];
          [v28 bounds];
          [(AMSUIToastPresentationController *)self setShowing:v27 < CGRectGetMaxX(v33)];

          v29 = [(AMSUIToastPresentationController *)self interactor];
          [v29 _interactionEnded];

          double v30 = [(AMSUIToastPresentationController *)self containerView];
          objc_msgSend(v4, "setTranslation:inView:", v30, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));

          [(AMSUIToastPresentationController *)self _startDismissTimer];
        }
        else
        {
          [(AMSUIToastPresentationController *)self _dismissToast];
        }
      }
      else
      {
        if (v9 == 2)
        {
LABEL_7:
          double v12 = [(AMSUIToastPresentationController *)self containerView];
          [v4 translationInView:v12];
          uint64_t v14 = v13;

          uint64_t v32 = v14;
          objc_super v15 = [(AMSUIToastPresentationController *)self containerView];
          [v4 velocityInView:v15];
          uint64_t v17 = v16;

          double v18 = [(AMSUIToastPresentationController *)self containerView];
          [v18 setNeedsLayout];

          double v19 = [(AMSUIToastPresentationController *)self interactor];
          [v19 _interactionChangedCopyingTranslation:&v32 velocity:&v31];

          goto LABEL_13;
        }
        if (v9 == 1)
        {
          double v10 = [(AMSUIToastPresentationController *)self containerView];
          [v10 setNeedsLayout];

          double v11 = [(AMSUIToastPresentationController *)self interactor];
          [v11 _interactionBegan];

          goto LABEL_7;
        }
      }
    }
  }
LABEL_13:
}

- (NSArray)passthroughViews
{
  v2 = [(AMSUIToastPresentationController *)self touchForwardingView];
  double v3 = [v2 passthroughViews];

  return (NSArray *)v3;
}

- (void)setPassthroughViews:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIToastPresentationController *)self touchForwardingView];
  [v5 setPassthroughViews:v4];
}

- (void)setShowing:(BOOL)a3
{
  if (self->_showing != a3)
  {
    id v3 = [(AMSUIToastPresentationController *)self containerView];
    [v3 setNeedsLayout];
  }
}

- (double)_yOffset
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = [(AMSUIToastPresentationController *)self relativeTabBarController];
  if (!v3)
  {
    id v4 = [(AMSUIToastPresentationController *)self presentingViewController];
    objc_opt_class();
    id v3 = (objc_opt_isKindOfClass() & 1) != 0 ? v4 : 0;

    if (!v3)
    {
      id v5 = [(AMSUIToastPresentationController *)self presentingViewController];
      id v3 = [v5 tabBarController];
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [(AMSUIToastPresentationController *)self presentingViewController];
  double v7 = [v6 childViewControllers];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        if (v3)
        {

          goto LABEL_23;
        }
        id v12 = *(id *)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v3 = v12;
        }
        else {
          id v3 = 0;
        }

        if (!v3)
        {
          id v3 = [v12 tabBarController];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  if (v3)
  {
LABEL_23:
    objc_super v15 = [v3 tabBar];
    [v15 frame];
    double v14 = v16;
  }
  else
  {
    id v3 = [(AMSUIToastPresentationController *)self containerView];
    [v3 safeAreaInsets];
    double v14 = v13;
  }

  return v14;
}

- (void)_dismissToast
{
  id v3 = [(AMSUIToastPresentationController *)self presentedViewController];
  id v4 = [v3 presentingViewController];

  if (v4)
  {
    id v5 = [(AMSUIToastPresentationController *)self presentedViewController];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __49__AMSUIToastPresentationController__dismissToast__block_invoke;
    v6[3] = &unk_2643E3118;
    v6[4] = self;
    [v5 dismissViewControllerAnimated:1 completion:v6];
  }
}

void __49__AMSUIToastPresentationController__dismissToast__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v1;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    v2 = [v5 delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      id v4 = [v5 delegate];
      [v4 messageViewControllerDidDismiss:v5];
    }
  }
}

- (double)_bottomMargin
{
  v2 = [(AMSUIToastPresentationController *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceIdiom];

  double result = 16.0;
  if (v3 == 1) {
    return 20.0;
  }
  return result;
}

- (double)dismissDelayTimeInterval
{
  return self->_dismissDelayTimeInterval;
}

- (void)setDismissDelayTimeInterval:(double)a3
{
  self->_dismissDelayTimeInterval = a3;
}

- (UITabBarController)relativeTabBarController
{
  return self->_relativeTabBarController;
}

- (void)setRelativeTabBarController:(id)a3
{
}

- (_UIHyperInteractor)interactor
{
  return self->_interactor;
}

- (_UIHyperrectangle)interactiveRegion
{
  return self->_interactiveRegion;
}

- (NSTimer)dismissalTimer
{
  return self->_dismissalTimer;
}

- (void)setDismissalTimer:(id)a3
{
}

- (UIPanGestureRecognizer)panRecognizer
{
  return self->_panRecognizer;
}

- (void)setPanRecognizer:(id)a3
{
}

- (BOOL)isShowing
{
  return self->_showing;
}

- (CGRect)lastFrameOfPresentedViewInContainerView
{
  double x = self->_lastFrameOfPresentedViewInContainerView.origin.x;
  double y = self->_lastFrameOfPresentedViewInContainerView.origin.y;
  double width = self->_lastFrameOfPresentedViewInContainerView.size.width;
  double height = self->_lastFrameOfPresentedViewInContainerView.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLastFrameOfPresentedViewInContainerView:(CGRect)a3
{
  self->_lastFrameOfPresentedViewInContainerView = a3;
}

- (AMSUITouchForwardingView)touchForwardingView
{
  return self->_touchForwardingView;
}

- (void)setTouchForwardingView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchForwardingView, 0);
  objc_storeStrong((id *)&self->_panRecognizer, 0);
  objc_storeStrong((id *)&self->_dismissalTimer, 0);
  objc_storeStrong((id *)&self->_interactiveRegion, 0);
  objc_storeStrong((id *)&self->_interactor, 0);
  objc_storeStrong((id *)&self->_relativeTabBarController, 0);
  objc_storeStrong((id *)&self->_passthroughViews, 0);
}

@end