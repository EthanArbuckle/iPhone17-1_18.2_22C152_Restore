@interface AVMobileChromelessContentTabsViewController
- (AVMobileChromelessContentTabsViewController)init;
- (AVMobileChromelessContentTabsViewControllerDelegate)delegate;
- (AVMobileContentTab)upcomingContentTab;
- (NSArray)customInfoViewControllers;
- (UIViewController)selectedCustomInfoViewController;
- (UIViewController)upcomingCustomInfoViewController;
- (int64_t)currentContentTabIndex;
- (unint64_t)transitionState;
- (void)_activeContentTab;
- (void)_detachViewControllerIfNeeded:(uint64_t)a1;
- (void)_didChangeContentTabTo:(id)a3;
- (void)_invalidateContentViewScrollViewAnimator;
- (void)_setActiveCustomInfoViewControllerForContentTab:(uint64_t)a1;
- (void)_setSelectedCustomInfoViewControllerForContentTab:(uint64_t)a3 withChangingReason:;
- (void)_updateContentTabsPresentationWithTransitioningState:(void *)a3 from:(void *)a4 to:;
- (void)contentTabsView:(id)a3 didChangeContentTab:(id)a4 withReason:(unint64_t)a5;
- (void)invalidateContentTabsSelection;
- (void)loadView;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)selectInitialCustomInfoViewController;
- (void)setCurrentContentTabIndex:(int64_t)a3;
- (void)setCustomInfoViewControllers:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTransitionState:(unint64_t)a3;
- (void)setUpcomingContentTab:(id)a3;
- (void)updateSelectedCustomInfoViewController;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation AVMobileChromelessContentTabsViewController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_upcomingContentTab, 0);
  objc_storeStrong((id *)&self->_customInfoViewControllers, 0);
  objc_storeStrong((id *)&self->_contentViewScrollViewAnimator, 0);
  objc_storeStrong((id *)&self->_replacingCustomInfoViewController, 0);
  objc_storeStrong((id *)&self->_upcomingCustomInfoViewController, 0);
  objc_storeStrong((id *)&self->_activeCustomInfoViewController, 0);
  objc_storeStrong((id *)&self->_selectedCustomInfoViewController, 0);
  objc_storeStrong((id *)&self->_styleSheet, 0);

  objc_storeStrong((id *)&self->_view, 0);
}

- (void)setDelegate:(id)a3
{
}

- (AVMobileChromelessContentTabsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVMobileChromelessContentTabsViewControllerDelegate *)WeakRetained;
}

- (int64_t)currentContentTabIndex
{
  return self->_currentContentTabIndex;
}

- (unint64_t)transitionState
{
  return self->_transitionState;
}

- (AVMobileContentTab)upcomingContentTab
{
  return self->_upcomingContentTab;
}

- (NSArray)customInfoViewControllers
{
  return self->_customInfoViewControllers;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v26 = a3;
  -[AVMobileChromelessContentTabsViewController _invalidateContentViewScrollViewAnimator]((uint64_t)self);
  [(AVMobileChromelessContentTabsView *)self->_view setNeedsLayout];
  [v26 frame];
  double v5 = v4;
  [v26 contentOffset];
  unint64_t v7 = (unint64_t)(v6 / v5);
  if ([(AVMobileChromelessContentTabsView *)self->_view effectiveUserInterfaceLayoutDirection] == 1)
  {
    v8 = [(AVMobileChromelessContentTabsView *)self->_view contentTabs];
    unint64_t v7 = [v8 count] + ~v7;
  }
  v9 = [(AVMobileChromelessContentTabsView *)self->_view contentTabs];
  uint64_t v10 = [v9 count];

  v11 = [v26 panGestureRecognizer];
  v12 = [v11 view];

  v13 = [v26 panGestureRecognizer];
  [v13 locationInView:v12];
  uint64_t v15 = v14;
  unint64_t v16 = v14 - 1;
  unint64_t v17 = ((v14 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53;

  if (v15 >= 0 && v17 <= 0x3FE || v16 <= 0xFFFFFFFFFFFFELL)
  {
    if (v7 >= v10 - 1) {
      unint64_t v20 = v10 - 1;
    }
    else {
      unint64_t v20 = v7;
    }
    [(AVMobileChromelessContentTabsViewController *)self setCurrentContentTabIndex:v20];
    [(AVMobileChromelessContentTabsViewController *)self setTransitionState:0];
    [(AVMobileChromelessContentTabsViewController *)self setUpcomingContentTab:0];
    -[AVMobileChromelessContentTabsViewController _activeContentTab]((id *)&self->super.super.super.isa);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (self->_upcomingCustomInfoViewController)
    {
      v23 = [v21 viewController];
      upcomingCustomInfoViewController = self->_upcomingCustomInfoViewController;

      if (v23 != upcomingCustomInfoViewController)
      {
        -[AVMobileChromelessContentTabsViewController _detachViewControllerIfNeeded:]((uint64_t)self, self->_upcomingCustomInfoViewController);
        v25 = self->_upcomingCustomInfoViewController;
        self->_upcomingCustomInfoViewController = 0;

        [(AVMobileChromelessContentTabsViewController *)self setUpcomingContentTab:0];
      }
    }
  }
}

- (void)_invalidateContentViewScrollViewAnimator
{
  if (a1)
  {
    v2 = *(void **)(a1 + 1024);
    if (v2)
    {
      [v2 stopAnimation:1];
      [*(id *)(a1 + 1024) finishAnimationAtPosition:2];
      v3 = *(void **)(a1 + 1024);
      *(void *)(a1 + 1024) = 0;

      double v4 = *(void **)(a1 + 1016);
      -[AVMobileChromelessContentTabsViewController _detachViewControllerIfNeeded:](a1, v4);
    }
  }
}

- (void)_activeContentTab
{
  v1 = a1;
  if (a1)
  {
    v2 = [a1[122] contentTabs];
    if (![v2 count] || v1[134] == -1)
    {
      v1 = 0;
    }
    else
    {
      v1 = objc_msgSend(v2, "objectAtIndex:");
    }
  }

  return v1;
}

- (void)_detachViewControllerIfNeeded:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && v3)
  {
    id v5 = v3;
    [v3 willMoveToParentViewController:0];
    double v4 = [v5 view];
    [v4 removeFromSuperview];

    [v5 removeFromParentViewController];
    [v5 didMoveToParentViewController:0];

    id v3 = 0;
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v28 = a3;
  if ([v28 isTracking]) {
    -[AVMobileChromelessContentTabsViewController _invalidateContentViewScrollViewAnimator]((uint64_t)self);
  }
  double v4 = self->_upcomingContentTab;
  id v5 = [(AVMobileChromelessContentTabsView *)self->_view contentTabs];
  if ([v28 isTracking] && objc_msgSend(v28, "isDragging"))
  {
    uint64_t v6 = [(AVMobileChromelessContentTabsView *)self->_view effectiveUserInterfaceLayoutDirection];
    unint64_t v7 = [v28 panGestureRecognizer];
    [v7 translationInView:v28];
    double v9 = v8;

    if (v9 <= 0.0)
    {
      if (v6 == 1)
      {
        int64_t currentContentTabIndex = self->_currentContentTabIndex;
        if (currentContentTabIndex <= 1) {
          int64_t currentContentTabIndex = 1;
        }
        int64_t v12 = currentContentTabIndex - 1;
      }
      else
      {
        uint64_t v16 = [v5 count];
        int64_t v17 = self->_currentContentTabIndex;
        if (v16 - 1 >= (unint64_t)(v17 + 1)) {
          int64_t v12 = v17 + 1;
        }
        else {
          int64_t v12 = v16 - 1;
        }
      }
      uint64_t v6 = 2;
    }
    else if (v6 == 1)
    {
      uint64_t v10 = [v5 count];
      int64_t v11 = self->_currentContentTabIndex;
      if (v10 - 1 >= (unint64_t)(v11 + 1)) {
        int64_t v12 = v11 + 1;
      }
      else {
        int64_t v12 = v10 - 1;
      }
    }
    else
    {
      int64_t v15 = self->_currentContentTabIndex;
      if (v15 <= 1) {
        int64_t v15 = 1;
      }
      int64_t v12 = v15 - 1;
      uint64_t v6 = 1;
    }
    v13 = [v5 objectAtIndex:v12];

    v18 = [v28 panGestureRecognizer];
    v19 = [v18 view];

    unint64_t v20 = [v28 panGestureRecognizer];
    [v20 locationInView:v19];
    uint64_t v22 = v21;
    unint64_t v23 = v21 - 1;
    unint64_t v24 = ((v21 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53;

    if (v22 >= 0 && v24 <= 0x3FE || v23 <= 0xFFFFFFFFFFFFELL)
    {
      v27 = -[AVMobileChromelessContentTabsViewController _activeContentTab]((id *)&self->super.super.super.isa);

      if (v27 != v13) {
        [(AVMobileChromelessContentTabsViewController *)self setUpcomingContentTab:v13];
      }
      [(AVMobileChromelessContentTabsViewController *)self setTransitionState:v6];
    }
  }
  else
  {
    v13 = v4;
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  if (([v4 isDecelerating] & 1) == 0) {
    [(AVMobileChromelessContentTabsView *)self->_view setNeedsLayout];
  }
  if ([v4 isTracking]) {
    -[AVMobileChromelessContentTabsViewController _invalidateContentViewScrollViewAnimator]((uint64_t)self);
  }
  [(AVMobileChromelessContentTabsViewController *)self setTransitionState:0];
}

- (void)_didChangeContentTabTo:(id)a3
{
  if (a3)
  {
    view = self->_view;
    id v5 = a3;
    uint64_t v6 = [(AVMobileChromelessContentTabsView *)view contentTabs];
    uint64_t v7 = [v6 indexOfObject:v5];

    int64_t initialContentTabIndex = v7;
  }
  else
  {
    int64_t initialContentTabIndex = self->_initialContentTabIndex;
    uint64_t v7 = -1;
  }
  self->_int64_t initialContentTabIndex = initialContentTabIndex;

  [(AVMobileChromelessContentTabsViewController *)self setCurrentContentTabIndex:v7];
}

- (void)contentTabsView:(id)a3 didChangeContentTab:(id)a4 withReason:(unint64_t)a5
{
  id v26 = a3;
  id v8 = a4;
  double v9 = v8;
  self->_selectionChangedReason = a5;
  if (a5 == 2)
  {
    [(AVMobileChromelessContentTabsViewController *)self _didChangeContentTabTo:v8];
  }
  else
  {
    if (a5 == 1) {
      goto LABEL_15;
    }
    if (a5) {
      goto LABEL_20;
    }
    if (v8)
    {
      id v10 = v8;
      contentViewScrollViewAnimator = self->_contentViewScrollViewAnimator;
      double v12 = 1.0;
      if (contentViewScrollViewAnimator
        && [(UIViewPropertyAnimator *)contentViewScrollViewAnimator isRunning]
        && [(UIViewPropertyAnimator *)self->_contentViewScrollViewAnimator isInterruptible])
      {
        [(UIViewPropertyAnimator *)self->_contentViewScrollViewAnimator fractionComplete];
        double v12 = v13;
        [(UIViewPropertyAnimator *)self->_contentViewScrollViewAnimator stopAnimation:1];
        [(UIViewPropertyAnimator *)self->_contentViewScrollViewAnimator finishAnimationAtPosition:2];
        uint64_t v14 = self->_contentViewScrollViewAnimator;
        self->_contentViewScrollViewAnimator = 0;

        -[AVMobileChromelessContentTabsViewController _detachViewControllerIfNeeded:]((uint64_t)self, self->_replacingCustomInfoViewController);
      }
      int64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1C58]), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 250.0, 30.0, 0.0, 0.0);
      objc_initWeak(&location, self);
      id v16 = objc_alloc(MEMORY[0x1E4FB1ED8]);
      double v17 = 0.3;
      if (v12 <= 1.0) {
        double v17 = v12 * 0.3;
      }
      v18 = (UIViewPropertyAnimator *)objc_msgSend(v16, "initWithDuration:timingParameters:", v15, v17, v26);
      v19 = self->_contentViewScrollViewAnimator;
      self->_contentViewScrollViewAnimator = v18;

      unint64_t v20 = self->_contentViewScrollViewAnimator;
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v34 = 3221225472;
      v35 = __97__AVMobileChromelessContentTabsViewController__performHorizontalTransitionAnimationToContentTab___block_invoke;
      v36 = &unk_1E5FC4180;
      objc_copyWeak(v38, &location);
      id v21 = v10;
      id v37 = v21;
      [(UIViewPropertyAnimator *)v20 addAnimations:&block];
      uint64_t v22 = self->_contentViewScrollViewAnimator;
      id from = (id)MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      v29 = __97__AVMobileChromelessContentTabsViewController__performHorizontalTransitionAnimationToContentTab___block_invoke_2;
      v30 = &unk_1E5FC3998;
      objc_copyWeak(&v31, &location);
      [(UIViewPropertyAnimator *)v22 addCompletion:&from];
      [(UIViewPropertyAnimator *)self->_contentViewScrollViewAnimator startAnimation];
      objc_destroyWeak(&v31);

      objc_destroyWeak(v38);
      objc_destroyWeak(&location);
    }
    else
    {
      -[AVMobileChromelessContentTabsViewController _detachViewControllerIfNeeded:]((uint64_t)self, self->_replacingCustomInfoViewController);
    }
  }
  a5 = 0;
LABEL_15:
  unint64_t v23 = [(AVMobileChromelessContentTabsView *)self->_view selectedContentTab];
  unint64_t v24 = [v23 viewController];
  v25 = v24;
  if (v24 && ([v24 isViewLoaded] & 1) == 0)
  {
    objc_initWeak(&from, self);
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v34 = 3221225472;
    v35 = __105__AVMobileChromelessContentTabsViewController__updateSelectedCustomInfoViewControllerWithChangingReason___block_invoke;
    v36 = &unk_1E5FC1F28;
    objc_copyWeak(v38, &from);
    id v37 = v25;
    v38[1] = (id)a5;
    dispatch_async(MEMORY[0x1E4F14428], &block);

    objc_destroyWeak(v38);
    objc_destroyWeak(&from);
  }
  else
  {
    -[AVMobileChromelessContentTabsViewController _setSelectedCustomInfoViewControllerForContentTab:withChangingReason:]((id *)&self->super.super.super.isa, v23, a5);
  }

LABEL_20:
}

void __105__AVMobileChromelessContentTabsViewController__updateSelectedCustomInfoViewControllerWithChangingReason___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained;
    id v3 = [WeakRetained[122] selectedContentTab];
    id v4 = [v3 viewController];
    id v5 = v4;
    if (v4 == *(void **)(a1 + 32))
    {
      [v4 loadViewIfNeeded];
      -[AVMobileChromelessContentTabsViewController _setSelectedCustomInfoViewControllerForContentTab:withChangingReason:](v6, v3, *(void *)(a1 + 48));
    }

    id WeakRetained = v6;
  }
}

- (void)_setSelectedCustomInfoViewControllerForContentTab:(uint64_t)a3 withChangingReason:
{
  id v5 = a2;
  if (a1)
  {
    id v11 = v5;
    id v6 = [v5 viewController];
    if (a1[124] != v6)
    {
      objc_storeStrong(a1 + 124, v6);
      -[AVMobileChromelessContentTabsViewController _setActiveCustomInfoViewControllerForContentTab:]((uint64_t)a1, v11);
      uint64_t v7 = [a1 delegate];
      char v8 = objc_opt_respondsToSelector();

      if (v8)
      {
        double v9 = [a1 delegate];
        id v10 = [v11 viewController];
        [v9 contentTabsViewController:a1 didChangeSelectedCustomInfoViewController:v10 withReason:a3];
      }
    }

    id v5 = v11;
  }
}

- (void)_setActiveCustomInfoViewControllerForContentTab:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v16 = v3;
    id v4 = [v3 viewController];
    id v5 = v4;
    if (*(void **)(a1 + 1000) != v4)
    {
      id v6 = [v4 view];
      if (v5 && ([v5 isViewLoaded] & 1) == 0) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Error: Internal inconsistency. The activeCustomInfoViewController's view has not been loaded yet."];
      }
      uint64_t v7 = [v5 parentViewController];
      if (v7)
      {
        char v8 = *(void **)(a1 + 1008);

        if (v5 != v8) {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"A customInfoViewController already has a parent view controller: %@", v5 format];
        }
      }
      double v9 = [v6 superview];
      if (v9)
      {
        id v10 = *(void **)(a1 + 1008);

        if (v5 != v10) {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"A customInfoViewController's view already has a superview: %@", v5 format];
        }
      }
      id v11 = *(void **)(a1 + 1000);
      if (v11 && !*(void *)(a1 + 1024)) {
        -[AVMobileChromelessContentTabsViewController _detachViewControllerIfNeeded:](a1, v11);
      }
      else {
        objc_storeStrong((id *)(a1 + 1016), v11);
      }
      objc_storeStrong((id *)(a1 + 1000), v5);
      double v12 = *(void **)(a1 + 1008);
      double v13 = *(void **)(a1 + 1000);
      if (v12 && v12 == v13)
      {
        *(void *)(a1 + 1008) = 0;
      }
      else if (v13)
      {
        [v13 willMoveToParentViewController:a1];
        [(id)a1 addChildViewController:*(void *)(a1 + 1000)];
        [*(id *)(a1 + 1000) didMoveToParentViewController:a1];
      }
      uint64_t v14 = [(id)a1 transitionState];
      int64_t v15 = [*(id *)(a1 + 976) selectedContentTab];
      -[AVMobileChromelessContentTabsViewController _updateContentTabsPresentationWithTransitioningState:from:to:](a1, v14, v15, v16);
    }
    id v3 = v16;
  }
}

- (void)_updateContentTabsPresentationWithTransitioningState:(void *)a3 from:(void *)a4 to:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    id v9 = v7;
    id v10 = v8;
    uint64_t v11 = *(void *)(a1 + 1032);
    double v12 = _AVLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v18 = "-[AVMobileChromelessContentTabsViewController _updateContentTabsPresentationWithTransitioningState:from:to:]";
      __int16 v19 = 2112;
      id v20 = v9;
      __int16 v21 = 2112;
      id v22 = v10;
      __int16 v23 = 2048;
      uint64_t v24 = a2;
      _os_log_impl(&dword_1B05B7000, v12, OS_LOG_TYPE_DEFAULT, "%s Transitioning content tabs from: %@ --> to: %@, with transitioning state: %ld", buf, 0x2Au);
    }

    double v13 = *(void **)(a1 + 976);
    id v14 = v9;
    v16[0] = v14;
    id v15 = v10;
    v16[1] = v15;
    v16[2] = a2;
    v16[3] = v11;
    if (v13)
    {
      [v13 setTransitionState:v16];
    }
    else
    {
    }
  }
}

void __97__AVMobileChromelessContentTabsViewController__performHorizontalTransitionAnimationToContentTab___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didChangeContentTabTo:*(void *)(a1 + 32)];
}

void __97__AVMobileChromelessContentTabsViewController__performHorizontalTransitionAnimationToContentTab___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    -[AVMobileChromelessContentTabsViewController _detachViewControllerIfNeeded:]((uint64_t)WeakRetained, WeakRetained[127]);
    v2 = v3[128];
    v3[128] = 0;

    id WeakRetained = v3;
  }
}

- (void)setCurrentContentTabIndex:(int64_t)a3
{
  if (self->_currentContentTabIndex != a3)
  {
    self->_int64_t currentContentTabIndex = a3;
    -[AVMobileChromelessContentTabsViewController _activeContentTab]((id *)&self->super.super.super.isa);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    -[AVMobileChromelessContentTabsViewController _setActiveCustomInfoViewControllerForContentTab:]((uint64_t)self, v4);
  }
}

- (void)setTransitionState:(unint64_t)a3
{
  if (self->_transitionState != a3)
  {
    self->_transitionState = a3;
    -[AVMobileChromelessContentTabsViewController _activeContentTab]((id *)&self->super.super.super.isa);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [(AVMobileChromelessContentTabsViewController *)self upcomingContentTab];
    -[AVMobileChromelessContentTabsViewController _updateContentTabsPresentationWithTransitioningState:from:to:]((uint64_t)self, a3, v6, v5);
  }
}

- (void)setUpcomingContentTab:(id)a3
{
  id v5 = (AVMobileContentTab *)a3;
  if (self->_upcomingContentTab != v5)
  {
    id v16 = v5;
    objc_storeStrong((id *)&self->_upcomingContentTab, a3);
    id v6 = self->_upcomingContentTab;
    id v7 = [(AVMobileContentTab *)v6 viewController];
    id v8 = v7;
    if (self->_upcomingCustomInfoViewController != v7)
    {
      id v9 = [(UIViewController *)v7 view];
      if (v8 && ![(UIViewController *)v8 isViewLoaded]) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Error: Internal inconsistency. The upcomingCustomInfoViewController's view has not been loaded yet."];
      }
      id v10 = [(UIViewController *)v8 parentViewController];

      if (v10) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"A customInfoViewController already has a parent view controller: %@", v8 format];
      }
      uint64_t v11 = [v9 superview];

      if (v11) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"A customInfoViewController's view already has a superview: %@", v8 format];
      }
      upcomingCustomInfoViewController = self->_upcomingCustomInfoViewController;
      if (upcomingCustomInfoViewController) {
        -[AVMobileChromelessContentTabsViewController _detachViewControllerIfNeeded:]((uint64_t)self, upcomingCustomInfoViewController);
      }
      objc_storeStrong((id *)&self->_upcomingCustomInfoViewController, v8);
      double v13 = self->_upcomingCustomInfoViewController;
      if (v13)
      {
        [(UIViewController *)v13 willMoveToParentViewController:self];
        [(AVMobileChromelessContentTabsViewController *)self addChildViewController:self->_upcomingCustomInfoViewController];
        [(UIViewController *)self->_upcomingCustomInfoViewController didMoveToParentViewController:self];
      }
      uint64_t v14 = [(AVMobileChromelessContentTabsViewController *)self transitionState];
      id v15 = -[AVMobileChromelessContentTabsViewController _activeContentTab]((id *)&self->super.super.super.isa);
      -[AVMobileChromelessContentTabsViewController _updateContentTabsPresentationWithTransitioningState:from:to:]((uint64_t)self, v14, v15, v6);
    }
    id v5 = v16;
  }
}

- (UIViewController)upcomingCustomInfoViewController
{
  return self->_upcomingCustomInfoViewController;
}

- (void)selectInitialCustomInfoViewController
{
  if (!self) {
    goto LABEL_7;
  }
  unint64_t initialContentTabIndex = self->_initialContentTabIndex;
  id v4 = [(AVMobileChromelessContentTabsView *)self->_view contentTabs];
  uint64_t v5 = [v4 count];

  id v6 = [(AVMobileChromelessContentTabsView *)self->_view contentTabs];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    if (initialContentTabIndex >= v5 - 1) {
      unint64_t v8 = v5 - 1;
    }
    else {
      unint64_t v8 = initialContentTabIndex;
    }
    id v9 = [(AVMobileChromelessContentTabsView *)self->_view contentTabs];
    id v10 = [v9 objectAtIndex:v8];
  }
  else
  {
LABEL_7:
    id v10 = 0;
  }
  -[AVMobileChromelessContentTabsViewController _setSelectedCustomInfoViewControllerForContentTab:withChangingReason:]((id *)&self->super.super.super.isa, v10, 0);
}

- (UIViewController)selectedCustomInfoViewController
{
  return self->_selectedCustomInfoViewController;
}

- (void)invalidateContentTabsSelection
{
  -[AVMobileChromelessContentTabsViewController _invalidateContentViewScrollViewAnimator]((uint64_t)self);
  [(AVMobileChromelessContentTabsView *)self->_view resetSelection];
  -[AVMobileChromelessContentTabsViewController _detachViewControllerIfNeeded:]((uint64_t)self, self->_activeCustomInfoViewController);
  upcomingCustomInfoViewController = self->_upcomingCustomInfoViewController;

  -[AVMobileChromelessContentTabsViewController _detachViewControllerIfNeeded:]((uint64_t)self, upcomingCustomInfoViewController);
}

- (void)updateSelectedCustomInfoViewController
{
  id v3 = [(AVMobileChromelessContentTabsView *)self->_view selectedContentTab];
  -[AVMobileChromelessContentTabsViewController _setActiveCustomInfoViewControllerForContentTab:]((uint64_t)self, v3);
}

- (void)setCustomInfoViewControllers:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_customInfoViewControllers != a3)
  {
    id v4 = (NSArray *)[a3 copy];
    customInfoViewControllers = self->_customInfoViewControllers;
    self->_customInfoViewControllers = v4;

    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_customInfoViewControllers, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    obj = self->_customInfoViewControllers;
    uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          double v13 = [NSString stringWithFormat:@"%@%@%ld", @"com.apple.avkit.AVPlayerViewController.content-tab-button", @"-", v9 + i];
          uint64_t v14 = [[AVMobileContentTab alloc] initWithCustomInfoViewController:v12 accessibilityIdentifier:v13];
          [v6 addObject:v14];
        }
        v9 += i;
        uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    [(AVMobileChromelessContentTabsView *)self->_view setContentTabs:v6];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AVMobileChromelessContentTabsViewController;
  -[AVMobileChromelessContentTabsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __98__AVMobileChromelessContentTabsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E5FC3900;
  objc_copyWeak(&v9, &location);
  [v7 animateAlongsideTransition:v8 completion:0];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __98__AVMobileChromelessContentTabsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [WeakRetained[122] resetSelection];
    [WeakRetained[122] setNeedsLayout];
  }
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)AVMobileChromelessContentTabsViewController;
  [(AVMobileChromelessContentTabsViewController *)&v5 loadView];
  id v3 = [[AVMobileChromelessContentTabsView alloc] initWithStyleSheet:self->_styleSheet];
  [(AVMobileChromelessContentTabsView *)v3 setOverrideUserInterfaceStyle:2];
  [(AVMobileChromelessContentTabsView *)v3 setDelegate:self];
  [(AVMobileChromelessContentTabsView *)v3 setContentViewDelegate:self];
  [(AVMobileChromelessContentTabsViewController *)self setView:v3];
  view = self->_view;
  self->_view = v3;
}

- (AVMobileChromelessContentTabsViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)AVMobileChromelessContentTabsViewController;
  v2 = [(AVMobileChromelessContentTabsViewController *)&v8 init];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
    id v4 = [v3 traitCollection];

    objc_super v5 = [[AVMobileChromelessControlsStyleSheet alloc] initWithTraitCollection:v4];
    styleSheet = v2->_styleSheet;
    v2->_styleSheet = v5;

    v2->_unint64_t initialContentTabIndex = 0;
  }
  return v2;
}

@end