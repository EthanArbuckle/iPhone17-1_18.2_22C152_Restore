@interface CKBrowserFullscreenRevealPresentationController
- (BOOL)_shouldGrabPresentersView;
- (BOOL)isDismissing;
- (BOOL)isPresenting;
- (BOOL)shouldRemovePresentersView;
- (CGRect)frameOfPresentedViewInContainerView;
- (CGRect)presentingSnapshotFrame;
- (CKBrowserFullscreenRevealDimmingView)dimmingView;
- (CKBrowserFullscreenRevealPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (UIStatusBar)statusBar;
- (UIStatusBarWindow)statusBarWindow;
- (UIView)presentingSnapshotView;
- (id)_viewsToApplyCornerRadius;
- (id)_viewsToApplyTransform;
- (id)dismissHandler;
- (unint64_t)statusBarResizeMask;
- (void)_cleanupPresentation;
- (void)_configureViewsForDismissedState;
- (void)_configureViewsForPresentedState;
- (void)_prepareViewHierarchyForPresentation;
- (void)_willChangeStatusBarFrame:(id)a3;
- (void)containerViewDidLayoutSubviews;
- (void)containerViewWillLayoutSubviews;
- (void)dealloc;
- (void)dimmingViewTapped:(id)a3;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
- (void)setDimmingView:(id)a3;
- (void)setDismissHandler:(id)a3;
- (void)setDismissing:(BOOL)a3;
- (void)setPresenting:(BOOL)a3;
- (void)setPresentingSnapshotFrame:(CGRect)a3;
- (void)setPresentingSnapshotView:(id)a3;
- (void)setStatusBar:(id)a3;
- (void)setStatusBarResizeMask:(unint64_t)a3;
- (void)setStatusBarWindow:(id)a3;
@end

@implementation CKBrowserFullscreenRevealPresentationController

- (CKBrowserFullscreenRevealPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)CKBrowserFullscreenRevealPresentationController;
  v4 = [(CKBrowserFullscreenRevealPresentationController *)&v15 initWithPresentedViewController:a3 presentingViewController:a4];
  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v4 action:sel_dimmingViewTapped_];
    v6 = [(CKBrowserFullscreenRevealPresentationController *)v4 dimmingView];
    [v6 addGestureRecognizer:v5];

    v7 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v8 = [v7 statusBar];
    statusBar = v4->_statusBar;
    v4->_statusBar = (UIStatusBar *)v8;

    v10 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v11 = [v10 statusBarWindow];
    statusBarWindow = v4->_statusBarWindow;
    v4->_statusBarWindow = (UIStatusBarWindow *)v11;

    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v4 selector:sel__willChangeStatusBarFrame_ name:*MEMORY[0x1E4F43700] object:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKBrowserFullscreenRevealPresentationController;
  [(CKBrowserFullscreenRevealPresentationController *)&v4 dealloc];
}

- (BOOL)shouldRemovePresentersView
{
  return 0;
}

- (BOOL)_shouldGrabPresentersView
{
  return 1;
}

- (void)presentationTransitionWillBegin
{
  [(CKBrowserFullscreenRevealPresentationController *)self setPresenting:1];
  v6.receiver = self;
  v6.super_class = (Class)CKBrowserFullscreenRevealPresentationController;
  [(CKBrowserFullscreenRevealPresentationController *)&v6 presentationTransitionWillBegin];
  [(CKBrowserFullscreenRevealPresentationController *)self _prepareViewHierarchyForPresentation];
  v3 = [(CKBrowserFullscreenRevealPresentationController *)self presentedViewController];
  objc_super v4 = [v3 transitionCoordinator];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__CKBrowserFullscreenRevealPresentationController_presentationTransitionWillBegin__block_invoke;
  v5[3] = &unk_1E5621550;
  v5[4] = self;
  [v4 animateAlongsideTransition:v5 completion:0];
}

uint64_t __82__CKBrowserFullscreenRevealPresentationController_presentationTransitionWillBegin__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureViewsForPresentedState];
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  BOOL v3 = a3;
  [(CKBrowserFullscreenRevealPresentationController *)self setPresenting:0];
  v5.receiver = self;
  v5.super_class = (Class)CKBrowserFullscreenRevealPresentationController;
  [(CKBrowserFullscreenRevealPresentationController *)&v5 presentationTransitionDidEnd:v3];
  if (!v3) {
    [(CKBrowserFullscreenRevealPresentationController *)self _cleanupPresentation];
  }
}

- (void)dismissalTransitionWillBegin
{
  [(CKBrowserFullscreenRevealPresentationController *)self setDismissing:1];
  v26.receiver = self;
  v26.super_class = (Class)CKBrowserFullscreenRevealPresentationController;
  [(CKBrowserFullscreenRevealPresentationController *)&v26 dismissalTransitionWillBegin];
  [(CKBrowserFullscreenRevealPresentationController *)self presentingSnapshotFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  uint64_t v11 = [(CKBrowserFullscreenRevealPresentationController *)self presentingViewController];
  v12 = [v11 view];
  [v12 frame];
  v28.origin.x = v13;
  v28.origin.y = v14;
  v28.size.width = v15;
  v28.size.height = v16;
  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  BOOL v17 = CGRectEqualToRect(v27, v28);

  if (!v17)
  {
    v18 = [(CKBrowserFullscreenRevealPresentationController *)self containerView];
    v19 = [(CKBrowserFullscreenRevealPresentationController *)self presentingViewController];
    v20 = [v19 view];
    v21 = [(CKBrowserFullscreenRevealPresentationController *)self presentingSnapshotView];
    [v18 insertSubview:v20 belowSubview:v21];

    v22 = [(CKBrowserFullscreenRevealPresentationController *)self presentingSnapshotView];
    [v22 removeFromSuperview];
  }
  v23 = [(CKBrowserFullscreenRevealPresentationController *)self presentedViewController];
  v24 = [v23 transitionCoordinator];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __79__CKBrowserFullscreenRevealPresentationController_dismissalTransitionWillBegin__block_invoke;
  v25[3] = &unk_1E5621550;
  v25[4] = self;
  [v24 animateAlongsideTransition:v25 completion:0];
}

uint64_t __79__CKBrowserFullscreenRevealPresentationController_dismissalTransitionWillBegin__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureViewsForDismissedState];
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  BOOL v3 = a3;
  [(CKBrowserFullscreenRevealPresentationController *)self setDismissing:0];
  v31.receiver = self;
  v31.super_class = (Class)CKBrowserFullscreenRevealPresentationController;
  [(CKBrowserFullscreenRevealPresentationController *)&v31 dismissalTransitionDidEnd:v3];
  if (v3)
  {
    [(CKBrowserFullscreenRevealPresentationController *)self _cleanupPresentation];
  }
  else
  {
    [(CKBrowserFullscreenRevealPresentationController *)self presentingSnapshotFrame];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v13 = [(CKBrowserFullscreenRevealPresentationController *)self presentingViewController];
    CGFloat v14 = [v13 view];
    [v14 frame];
    v33.origin.x = v15;
    v33.origin.y = v16;
    v33.size.width = v17;
    v33.size.height = v18;
    v32.origin.x = v6;
    v32.origin.y = v8;
    v32.size.width = v10;
    v32.size.height = v12;
    BOOL v19 = CGRectEqualToRect(v32, v33);

    if (!v19)
    {
      v20 = [(CKBrowserFullscreenRevealPresentationController *)self presentingViewController];
      v21 = [v20 view];
      v22 = [v21 snapshotViewAfterScreenUpdates:0];
      [(CKBrowserFullscreenRevealPresentationController *)self setPresentingSnapshotView:v22];

      v23 = [(CKBrowserFullscreenRevealPresentationController *)self presentingViewController];
      v24 = [v23 view];
      [v24 frame];
      -[CKBrowserFullscreenRevealPresentationController setPresentingSnapshotFrame:](self, "setPresentingSnapshotFrame:");

      v25 = [(CKBrowserFullscreenRevealPresentationController *)self containerView];
      objc_super v26 = [(CKBrowserFullscreenRevealPresentationController *)self presentingSnapshotView];
      CGRect v27 = [(CKBrowserFullscreenRevealPresentationController *)self presentingViewController];
      CGRect v28 = [v27 view];
      [v25 insertSubview:v26 aboveSubview:v28];

      v29 = [(CKBrowserFullscreenRevealPresentationController *)self presentingViewController];
      v30 = [v29 view];
      [v30 removeFromSuperview];
    }
    [(CKBrowserFullscreenRevealPresentationController *)self _configureViewsForPresentedState];
  }
}

- (void)containerViewWillLayoutSubviews
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)CKBrowserFullscreenRevealPresentationController;
  [(CKBrowserFullscreenRevealPresentationController *)&v28 containerViewWillLayoutSubviews];
  if (![(CKBrowserFullscreenRevealPresentationController *)self isDismissing]
    && ![(CKBrowserFullscreenRevealPresentationController *)self isPresenting])
  {
    [(CKBrowserFullscreenRevealPresentationController *)self frameOfPresentedViewInContainerView];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v11 = [(CKBrowserFullscreenRevealPresentationController *)self presentedViewController];
    CGFloat v12 = [v11 view];
    objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    CGFloat v13 = [(CKBrowserFullscreenRevealPresentationController *)self _viewsToApplyTransform];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v25;
      long long v21 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      long long v22 = *MEMORY[0x1E4F1DAB8];
      long long v20 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          CGFloat v18 = *(void **)(*((void *)&v24 + 1) + 8 * v17);
          v23[0] = v22;
          v23[1] = v21;
          v23[2] = v20;
          objc_msgSend(v18, "setTransform:", v23, v20, v21, v22);
          BOOL v19 = [(CKBrowserFullscreenRevealPresentationController *)self containerView];
          [v19 bounds];
          objc_msgSend(v18, "setFrame:");

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v15);
    }
  }
}

- (void)containerViewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)CKBrowserFullscreenRevealPresentationController;
  [(CKBrowserFullscreenRevealPresentationController *)&v13 containerViewDidLayoutSubviews];
  if (![(CKBrowserFullscreenRevealPresentationController *)self isDismissing]
    && ![(CKBrowserFullscreenRevealPresentationController *)self isPresenting])
  {
    [(CKBrowserFullscreenRevealPresentationController *)self _configureViewsForPresentedState];
  }
  double v3 = [MEMORY[0x1E4F42738] sharedApplication];
  [v3 statusBarFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  CGFloat v12 = [(CKBrowserFullscreenRevealPresentationController *)self statusBar];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (CGRect)frameOfPresentedViewInContainerView
{
  v2 = [(CKBrowserFullscreenRevealPresentationController *)self containerView];
  [v2 bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  double v11 = [MEMORY[0x1E4F42738] sharedApplication];
  [v11 statusBarFrame];
  double v13 = v12;

  if (v13 >= 20.0) {
    double v14 = v13;
  }
  else {
    double v14 = 20.0;
  }
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  CGFloat Width = CGRectGetWidth(v20);
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  double v16 = CGRectGetHeight(v21) - v14 + -8.0;
  double v17 = 0.0;
  double v18 = v14 + 8.0;
  double v19 = Width;
  result.size.height = v16;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)dimmingViewTapped:(id)a3
{
  CGFloat v4 = [(CKBrowserFullscreenRevealPresentationController *)self dismissHandler];

  if (v4)
  {
    double v5 = [(CKBrowserFullscreenRevealPresentationController *)self dismissHandler];
    ((void (**)(void, CKBrowserFullscreenRevealPresentationController *))v5)[2](v5, self);

    [(CKBrowserFullscreenRevealPresentationController *)self setDismissHandler:0];
  }
  else
  {
    id v6 = [(CKBrowserFullscreenRevealPresentationController *)self presentedViewController];
    [v6 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_willChangeStatusBarFrame:(id)a3
{
  id v3 = [(CKBrowserFullscreenRevealPresentationController *)self containerView];
  [v3 setNeedsLayout];
}

- (CKBrowserFullscreenRevealDimmingView)dimmingView
{
  dimmingView = self->_dimmingView;
  if (!dimmingView)
  {
    CGFloat v4 = [CKBrowserFullscreenRevealDimmingView alloc];
    double v5 = -[CKBrowserFullscreenRevealDimmingView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v6 = self->_dimmingView;
    self->_dimmingView = v5;

    double v7 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.200000003];
    [(CKBrowserFullscreenRevealDimmingView *)self->_dimmingView setBackgroundColor:v7];

    [(CKBrowserFullscreenRevealDimmingView *)self->_dimmingView setAlpha:0.0];
    [(CKBrowserFullscreenRevealDimmingView *)self->_dimmingView setAutoresizingMask:18];
    dimmingView = self->_dimmingView;
  }

  return dimmingView;
}

- (id)_viewsToApplyTransform
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  CGFloat v4 = [(CKBrowserFullscreenRevealPresentationController *)self presentingSnapshotView];
  [v3 addObject:v4];

  double v5 = [(CKBrowserFullscreenRevealPresentationController *)self presentingViewController];
  id v6 = [v5 view];
  [v3 addObject:v6];

  double v7 = (void *)[v3 copy];

  return v7;
}

- (id)_viewsToApplyCornerRadius
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  CGFloat v4 = [(CKBrowserFullscreenRevealPresentationController *)self presentingSnapshotView];
  [v3 addObject:v4];

  double v5 = [(CKBrowserFullscreenRevealPresentationController *)self presentedViewController];
  id v6 = [v5 view];
  [v3 addObject:v6];

  double v7 = (void *)[v3 copy];

  return v7;
}

- (void)_configureViewsForPresentedState
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = [(CKBrowserFullscreenRevealPresentationController *)self containerView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  double v12 = [(CKBrowserFullscreenRevealPresentationController *)self dimmingView];
  [v12 setAlpha:1.0];

  double v13 = [MEMORY[0x1E4F42738] sharedApplication];
  [v13 statusBarFrame];
  double v15 = v14;

  v56.origin.x = v5;
  v56.origin.y = v7;
  v56.size.width = v9;
  v56.size.height = v11;
  double Height = CGRectGetHeight(v56);
  double v17 = 7.0;
  if (v15 >= 20.0) {
    double v17 = v15 + -13.0;
  }
  memset(&v52.c, 0, 32);
  if (Height < 1024.0) {
    double v18 = v17;
  }
  else {
    double v18 = 0.0;
  }
  *(_OWORD *)&v52.a = 0uLL;
  v57.origin.x = v5;
  v57.origin.y = v7;
  v57.size.width = v9;
  v57.size.height = v11;
  CGFloat v19 = CGRectGetHeight(v57);
  CGAffineTransformMakeTranslation(&v52, 0.0, floor(v18 * (667.0 / v19)));
  memset(&v51, 0, sizeof(v51));
  CGAffineTransformMakeScale(&v51, 0.959999979, 0.959999979);
  CGAffineTransform t1 = v52;
  memset(&v50, 0, sizeof(v50));
  CGAffineTransform t2 = v51;
  CGAffineTransformConcat(&v50, &t1, &t2);
  CGRect v20 = [(CKBrowserFullscreenRevealPresentationController *)self statusBar];
  CGRect v21 = [v20 superview];
  long long v22 = [(CKBrowserFullscreenRevealPresentationController *)self statusBarWindow];

  if (v21 != v22)
  {
    [MEMORY[0x1E4F43058] _synchronizeDrawing];
    v23 = [(CKBrowserFullscreenRevealPresentationController *)self statusBarWindow];
    long long v24 = [(CKBrowserFullscreenRevealPresentationController *)self statusBar];
    [v23 addSubview:v24];
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v25 = [(CKBrowserFullscreenRevealPresentationController *)self _viewsToApplyTransform];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v45 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        CGAffineTransform v43 = v50;
        [v30 setTransform:&v43];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v44 objects:v54 count:16];
    }
    while (v27);
  }

  objc_super v31 = [MEMORY[0x1E4F42738] sharedApplication];
  [v31 _setBackgroundStyle:5];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  CGRect v32 = [(CKBrowserFullscreenRevealPresentationController *)self _viewsToApplyCornerRadius];
  uint64_t v33 = [v32 countByEnumeratingWithState:&v39 objects:v53 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v40 != v35) {
          objc_enumerationMutation(v32);
        }
        v37 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        v38 = [v37 layer];
        [v38 setMaskedCorners:3];

        [v37 _setContinuousCornerRadius:8.0];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v39 objects:v53 count:16];
    }
    while (v34);
  }
}

- (void)_configureViewsForDismissedState
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = [(CKBrowserFullscreenRevealPresentationController *)self dimmingView];
  [v3 setAlpha:0.0];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  double v4 = [(CKBrowserFullscreenRevealPresentationController *)self _viewsToApplyTransform];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v30;
    long long v22 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v23 = *MEMORY[0x1E4F1DAB8];
    long long v21 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v4);
        }
        CGFloat v9 = *(void **)(*((void *)&v29 + 1) + 8 * v8);
        v28[0] = v23;
        v28[1] = v22;
        v28[2] = v21;
        objc_msgSend(v9, "setTransform:", v28, v21, v22, v23);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v6);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  double v10 = [(CKBrowserFullscreenRevealPresentationController *)self _viewsToApplyCornerRadius];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * v14++) _setContinuousCornerRadius:0.0];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  double v15 = [(CKBrowserFullscreenRevealPresentationController *)self statusBar];
  double v16 = [v15 superview];
  double v17 = [(CKBrowserFullscreenRevealPresentationController *)self statusBarWindow];

  if (v16 != v17)
  {
    [MEMORY[0x1E4F43058] _synchronizeDrawing];
    double v18 = [(CKBrowserFullscreenRevealPresentationController *)self statusBarWindow];
    CGFloat v19 = [(CKBrowserFullscreenRevealPresentationController *)self statusBar];
    [v18 addSubview:v19];
  }
  CGRect v20 = [MEMORY[0x1E4F42738] sharedApplication];
  [v20 _setBackgroundStyle:0];
}

- (void)_prepareViewHierarchyForPresentation
{
  id v3 = [(CKBrowserFullscreenRevealPresentationController *)self presentingViewController];
  double v4 = [v3 view];
  uint64_t v5 = [v4 snapshotViewAfterScreenUpdates:0];
  [(CKBrowserFullscreenRevealPresentationController *)self setPresentingSnapshotView:v5];

  uint64_t v6 = [(CKBrowserFullscreenRevealPresentationController *)self presentingViewController];
  uint64_t v7 = [v6 view];
  [v7 frame];
  -[CKBrowserFullscreenRevealPresentationController setPresentingSnapshotFrame:](self, "setPresentingSnapshotFrame:");

  uint64_t v8 = [(CKBrowserFullscreenRevealPresentationController *)self containerView];
  CGFloat v9 = [(CKBrowserFullscreenRevealPresentationController *)self presentingSnapshotView];
  double v10 = [(CKBrowserFullscreenRevealPresentationController *)self presentingViewController];
  uint64_t v11 = [v10 view];
  [v8 insertSubview:v9 aboveSubview:v11];

  uint64_t v12 = [(CKBrowserFullscreenRevealPresentationController *)self presentingViewController];
  uint64_t v13 = [v12 view];
  [v13 removeFromSuperview];

  uint64_t v14 = [(CKBrowserFullscreenRevealPresentationController *)self containerView];
  double v15 = [(CKBrowserFullscreenRevealPresentationController *)self dimmingView];
  double v16 = [(CKBrowserFullscreenRevealPresentationController *)self presentingSnapshotView];
  [v14 insertSubview:v15 aboveSubview:v16];

  double v17 = [(CKBrowserFullscreenRevealPresentationController *)self containerView];
  [v17 bounds];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  long long v26 = [(CKBrowserFullscreenRevealPresentationController *)self dimmingView];
  objc_msgSend(v26, "setFrame:", v19, v21, v23, v25);

  long long v27 = [(CKBrowserFullscreenRevealPresentationController *)self presentedViewController];
  uint64_t v28 = [v27 view];
  [v28 setClipsToBounds:1];

  long long v29 = [(CKBrowserFullscreenRevealPresentationController *)self presentingSnapshotView];
  [v29 setClipsToBounds:1];

  long long v30 = [(CKBrowserFullscreenRevealPresentationController *)self statusBar];
  -[CKBrowserFullscreenRevealPresentationController setStatusBarResizeMask:](self, "setStatusBarResizeMask:", [v30 autoresizingMask]);

  id v31 = [(CKBrowserFullscreenRevealPresentationController *)self statusBar];
  [v31 setAutoresizingMask:0];
}

- (void)_cleanupPresentation
{
  [(CKBrowserFullscreenRevealPresentationController *)self _configureViewsForDismissedState];
  id v3 = [(CKBrowserFullscreenRevealPresentationController *)self dimmingView];
  [v3 removeFromSuperview];

  double v4 = [(CKBrowserFullscreenRevealPresentationController *)self containerView];
  uint64_t v5 = [(CKBrowserFullscreenRevealPresentationController *)self presentingViewController];
  uint64_t v6 = [v5 view];
  uint64_t v7 = [(CKBrowserFullscreenRevealPresentationController *)self presentingSnapshotView];
  [v4 insertSubview:v6 belowSubview:v7];

  uint64_t v8 = [(CKBrowserFullscreenRevealPresentationController *)self presentingSnapshotView];
  [v8 removeFromSuperview];

  unint64_t v9 = [(CKBrowserFullscreenRevealPresentationController *)self statusBarResizeMask];
  id v10 = [(CKBrowserFullscreenRevealPresentationController *)self statusBar];
  [v10 setAutoresizingMask:v9];
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
}

- (void)setDimmingView:(id)a3
{
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (BOOL)isDismissing
{
  return self->_dismissing;
}

- (void)setDismissing:(BOOL)a3
{
  self->_dismissing = a3;
}

- (UIStatusBar)statusBar
{
  return self->_statusBar;
}

- (void)setStatusBar:(id)a3
{
}

- (UIStatusBarWindow)statusBarWindow
{
  return self->_statusBarWindow;
}

- (void)setStatusBarWindow:(id)a3
{
}

- (unint64_t)statusBarResizeMask
{
  return self->_statusBarResizeMask;
}

- (void)setStatusBarResizeMask:(unint64_t)a3
{
  self->_statusBarResizeMask = a3;
}

- (UIView)presentingSnapshotView
{
  return self->_presentingSnapshotView;
}

- (void)setPresentingSnapshotView:(id)a3
{
}

- (CGRect)presentingSnapshotFrame
{
  double x = self->_presentingSnapshotFrame.origin.x;
  double y = self->_presentingSnapshotFrame.origin.y;
  double width = self->_presentingSnapshotFrame.size.width;
  double height = self->_presentingSnapshotFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPresentingSnapshotFrame:(CGRect)a3
{
  self->_presentingSnapshotFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingSnapshotView, 0);
  objc_storeStrong((id *)&self->_statusBarWindow, 0);
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);

  objc_storeStrong(&self->_dismissHandler, 0);
}

@end