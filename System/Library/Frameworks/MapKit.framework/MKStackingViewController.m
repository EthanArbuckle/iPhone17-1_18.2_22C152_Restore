@interface MKStackingViewController
- (BOOL)_isSafeToPerformLayout;
- (BOOL)isScrollEnabled;
- (BOOL)isViewVisbile:(id)a3 percentageTreshold:(double)a4;
- (MKStackingViewControllerDelegate)stackingDelegate;
- (NSArray)viewControllers;
- (UIScrollView)scrollView;
- (double)_fittingHeightForView:(id)a3;
- (double)_titleHeight;
- (double)currentHeight;
- (double)stackView:(id)a3 distanceBetweenUpperView:(id)a4 andLowerView:(id)a5;
- (void)_addPreferredHeightConstraintForViewControllerIfNeeded:(id)a3;
- (void)_callViewControllersLayoutDelegateIfNeeded;
- (void)_removePreferredHeightConstraintFromViewController:(id)a3;
- (void)_sendScrollnotification;
- (void)_setOverlayViewFrame;
- (void)_setPreferredHeight:(double)a3 forViewController:(id)a4;
- (void)_setScrollEnabled:(BOOL)a3 forcedUpdate:(BOOL)a4;
- (void)_setUpEnteringViewController:(id)a3;
- (void)_updateFixedHeightAwareControllers;
- (void)_updateStackViewSubviewsAndChildVCsEntering:(id)a3 exiting:(id)a4;
- (void)_updateViewControllerVisibilityAfterPositionChange;
- (void)dealloc;
- (void)loadView;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)removeOverlayViewAnimated:(BOOL)a3;
- (void)scrollToTopAnimated:(BOOL)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setOverlayView:(id)a3 withOriginY:(double)a4;
- (void)setScrollEnabled:(BOOL)a3;
- (void)setStackingDelegate:(id)a3;
- (void)setViewControllers:(id)a3;
- (void)setWidthConstraintConstant:(double)a3;
- (void)stackViewNeedsLayout:(id)a3;
- (void)updateViewConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation MKStackingViewController

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(UIScrollView *)self->_scrollView setDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)MKStackingViewController;
  [(MKStackingViewController *)&v4 dealloc];
}

- (void)loadView
{
  v3 = objc_alloc_init(_MKStackView);
  stackView = self->_stackView;
  self->_stackView = v3;

  [(_MKStackView *)self->_stackView setStackDelegate:self];
  [(_MKStackView *)self->_stackView setStackAnimationDelegate:self];
  [(_MKStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(_MKStackView *)self->_stackView setPreservesSuperviewLayoutMargins:1];
  [(_MKStackView *)self->_stackView setBottomConstraintShouldBeGreaterThanOrEqual:1];
  v5 = [[_MKStackingContentView alloc] initWithViewController:self];
  contentView = self->_contentView;
  self->_contentView = v5;

  [(_MKStackingContentView *)self->_contentView setPreservesSuperviewLayoutMargins:1];
  v7 = self->_contentView;

  [(MKStackingViewController *)self setView:v7];
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)MKStackingViewController;
  [(MKStackingViewController *)&v14 viewDidLoad];
  v3 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E4F42DB0]);
  scrollView = self->_scrollView;
  self->_scrollView = v3;

  [(UIScrollView *)self->_scrollView setAlwaysBounceVertical:1];
  [(UIScrollView *)self->_scrollView setDelegate:self];
  [(UIScrollView *)self->_scrollView setPreservesSuperviewLayoutMargins:1];
  [(MKStackingViewController *)self _setScrollEnabled:!self->_isScrollDisabled forcedUpdate:1];
  v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  minimallyVisibleViews = self->_minimallyVisibleViews;
  self->_minimallyVisibleViews = v5;

  v7 = [(_MKStackView *)self->_stackView widthAnchor];
  [(_MKStackingContentView *)self->_contentView frame];
  double Width = CGRectGetWidth(v15);
  double v9 = 260.0;
  if (Width >= 260.0)
  {
    [(_MKStackingContentView *)self->_contentView frame];
    double v9 = CGRectGetWidth(v16);
  }
  v10 = [v7 constraintEqualToConstant:v9];
  widthConstraint = self->_widthConstraint;
  self->_widthConstraint = v10;

  v12 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
  viewsToViewControllers = self->_viewsToViewControllers;
  self->_viewsToViewControllers = v12;
}

- (BOOL)_isSafeToPerformLayout
{
  int v3 = [(MKStackingViewController *)self isViewLoaded];
  if (v3)
  {
    objc_super v4 = [(MKStackingViewController *)self view];
    v5 = [v4 window];

    LOBYTE(v3) = v5
              || (stackViewWidthConstraint = self->_stackViewWidthConstraint) != 0
              && [(NSLayoutConstraint *)stackViewWidthConstraint isActive];
  }
  return v3;
}

- (double)_titleHeight
{
  return 0.0;
}

- (void)setScrollEnabled:(BOOL)a3
{
}

- (void)_setScrollEnabled:(BOOL)a3 forcedUpdate:(BOOL)a4
{
  BOOL v4 = a3;
  v25[4] = *MEMORY[0x1E4F143B8];
  if (a4 || self->_isScrollDisabled == a3)
  {
    self->_isScrollDisabled = !a3;
    [(MKStackingViewController *)self _updateFixedHeightAwareControllers];
    if (self->_stackView)
    {
      contentView = self->_contentView;
      if (contentView)
      {
        if (v4)
        {
          [(_MKStackingContentView *)contentView setBottomView:self->_scrollView];
          [(UIScrollView *)self->_scrollView addSubview:self->_stackView];
          v20 = (void *)MEMORY[0x1E4F28DC8];
          stackView = self->_stackView;
          v8 = self->_scrollView;
          v24 = [(_MKStackView *)stackView topAnchor];
          v23 = [(UIScrollView *)v8 topAnchor];
          v22 = [v24 constraintEqualToAnchor:v23];
          v25[0] = v22;
          v21 = [(_MKStackView *)self->_stackView leftAnchor];
          double v9 = [(UIScrollView *)v8 leftAnchor];
          v10 = [v21 constraintEqualToAnchor:v9];
          v25[1] = v10;
          v11 = [(UIScrollView *)v8 bottomAnchor];
          v12 = [(_MKStackView *)self->_stackView bottomAnchor];
          v13 = [v11 constraintEqualToAnchor:v12];
          v25[2] = v13;
          objc_super v14 = [(UIScrollView *)v8 rightAnchor];
          CGRect v15 = [(_MKStackView *)self->_stackView rightAnchor];
          CGRect v16 = [v14 constraintEqualToAnchor:v15];
          v25[3] = v16;
          v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
          [v20 activateConstraints:v17];
        }
        else
        {
          [(UIScrollView *)self->_scrollView removeFromSuperview];
          v18 = self->_stackView;
          v19 = self->_contentView;
          [(_MKStackingContentView *)v19 setBottomView:v18];
        }
      }
    }
  }
}

- (BOOL)isScrollEnabled
{
  return !self->_isScrollDisabled;
}

- (double)_fittingHeightForView:(id)a3
{
  id v3 = a3;
  double v4 = 0.0;
  if ([v3 conformsToProtocol:&unk_1ED98BA88])
  {
    objc_msgSend(v3, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v4 = v5;
  }

  return v4;
}

- (double)currentHeight
{
  [(_MKStackView *)self->_stackView frame];
  return v2;
}

- (void)setWidthConstraintConstant:(double)a3
{
  double v5 = [(MKStackingViewController *)self view];

  if (v5)
  {
    v6 = self->_stackView;
    stackViewWidthConstraint = self->_stackViewWidthConstraint;
    CGRect v15 = v6;
    if (stackViewWidthConstraint)
    {
      [(NSLayoutConstraint *)stackViewWidthConstraint setConstant:a3];
    }
    else
    {
      v8 = [(_MKStackView *)v6 widthAnchor];
      double v9 = [v8 constraintEqualToConstant:a3];
      v10 = self->_stackViewWidthConstraint;
      self->_stackViewWidthConstraint = v9;
    }
    [(NSLayoutConstraint *)self->_widthConstraint setConstant:a3];
    [(NSLayoutConstraint *)self->_stackViewWidthConstraint setActive:1];
    v11 = [(_MKStackingContentView *)self->_contentView bottomConstraint];
    uint64_t v12 = [v11 isActive];

    v13 = [(_MKStackingContentView *)self->_contentView bottomConstraint];
    [v13 setActive:0];

    [(UIView *)v15 _mapkit_setNeedsLayout];
    [(UIView *)v15 _mapkit_layoutIfNeeded];
    objc_super v14 = [(_MKStackingContentView *)self->_contentView bottomConstraint];
    [v14 setActive:v12];
  }
}

- (void)_updateFixedHeightAwareControllers
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = self->_viewControllers;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "conformsToProtocol:", &unk_1ED9A77A8, (void)v10))
        {
          id v9 = v8;
          objc_msgSend(v9, "setResizableViewsDisabled:", -[MKStackingViewController isScrollEnabled](self, "isScrollEnabled") ^ 1);
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)setViewControllers:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_viewControllers = (id *)&self->_viewControllers;
  if (([v5 isEqualToArray:self->_viewControllers] & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1E4F1CBF0];
    if (v5) {
      id v8 = v5;
    }
    else {
      id v8 = (id)MEMORY[0x1E4F1CBF0];
    }
    id v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
    if (*p_viewControllers) {
      id v10 = *p_viewControllers;
    }
    else {
      id v10 = v7;
    }
    long long v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
    long long v12 = (void *)[v9 mutableCopy];
    [v12 minusSet:v11];
    long long v13 = (void *)[v11 mutableCopy];
    [v13 minusSet:v9];
    objc_storeStrong((id *)&self->_viewControllers, a3);
    [(MKStackingViewController *)self _updateFixedHeightAwareControllers];
    if ([(MKStackingViewController *)self _isSafeToPerformLayout])
    {
      [(MKStackingViewController *)self _updateStackViewSubviewsAndChildVCsEntering:v12 exiting:v13];
    }
    else
    {
      self->_needsToPerformLayout = [*p_viewControllers count] != 0;
      [(_MKStackView *)self->_stackView setStackedSubviews:MEMORY[0x1E4F1CBF0]];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v21 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            objc_msgSend(v19, "willMoveToParentViewController:", 0, (void)v20);
            [v19 removeFromParentViewController];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v16);
      }
    }
  }
}

- (void)setStackingDelegate:(id)a3
{
  p_stackingDelegate = &self->_stackingDelegate;
  id v6 = a3;
  id v5 = objc_storeWeak((id *)p_stackingDelegate, v6);
  LOBYTE(p_stackingDelegate) = objc_opt_respondsToSelector();

  self->_mayWantSpearators = p_stackingDelegate & 1;
}

- (void)stackViewNeedsLayout:(id)a3
{
  id v4 = [(MKStackingViewController *)self view];
  id v3 = [v4 superview];
  objc_msgSend(v3, "_mapkit_layoutIfNeeded");
}

- (void)_updateStackViewSubviewsAndChildVCsEntering:(id)a3 exiting:(id)a4
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  self->_needsToPerformLayout = 0;
  if ([v6 count] || objc_msgSend(v7, "count"))
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_needToCallViewControllerLayoutDelegate = 1;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v57 = v6;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v82 objects:v92 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v83;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v83 != v12) {
            objc_enumerationMutation(v9);
          }
          [(MKStackingViewController *)self addChildViewController:*(void *)(*((void *)&v82 + 1) + 8 * i)];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v82 objects:v92 count:16];
      }
      while (v11);
    }
    v55 = v9;
    v56 = v7;

    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v14 = [(MKStackingViewController *)self viewControllers];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v78 objects:v91 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v79;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v79 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v78 + 1) + 8 * j);
          stackView = self->_stackView;
          long long v21 = [v19 view];
          [(_MKStackView *)stackView addSubview:v21];

          viewsToViewControllers = self->_viewsToViewControllers;
          long long v23 = [v19 view];
          [(NSMapTable *)viewsToViewControllers setObject:v19 forKey:v23];

          v24 = [v19 view];
          [v8 addObject:v24];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v78 objects:v91 count:16];
      }
      while (v16);
    }

    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v7 = v56;
    id v25 = v56;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v74 objects:v90 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v75;
      do
      {
        for (uint64_t k = 0; k != v27; ++k)
        {
          if (*(void *)v75 != v28) {
            objc_enumerationMutation(v25);
          }
          [*(id *)(*((void *)&v74 + 1) + 8 * k) willMoveToParentViewController:0];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v74 objects:v90 count:16];
      }
      while (v27);
    }

    overlayView = self->_overlayView;
    if (overlayView)
    {
      [(UIView *)overlayView alpha];
      if (v31 != 0.0)
      {
        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        id v32 = v8;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v70 objects:v89 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          char v35 = 0;
          uint64_t v36 = *(void *)v71;
          do
          {
            for (uint64_t m = 0; m != v34; ++m)
            {
              if (*(void *)v71 != v36) {
                objc_enumerationMutation(v32);
              }
              [*(id *)(*((void *)&v70 + 1) + 8 * m) setHidden:v35 & 1];
              char v35 = 1;
            }
            uint64_t v34 = [v32 countByEnumeratingWithState:&v70 objects:v89 count:16];
          }
          while (v34);
        }
      }
    }
    self->_isSettingStackedViews = 1;
    [(_MKStackView *)self->_stackView setStackedSubviews:v8];
    self->_isSettingStackedViews = 0;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v38 = v55;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v66 objects:v88 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v67;
      do
      {
        for (uint64_t n = 0; n != v40; ++n)
        {
          if (*(void *)v67 != v41) {
            objc_enumerationMutation(v38);
          }
          [(MKStackingViewController *)self _setUpEnteringViewController:*(void *)(*((void *)&v66 + 1) + 8 * n)];
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v66 objects:v88 count:16];
      }
      while (v40);
    }

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v43 = v25;
    uint64_t v44 = [v43 countByEnumeratingWithState:&v62 objects:v87 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v63;
      do
      {
        for (iuint64_t i = 0; ii != v45; ++ii)
        {
          if (*(void *)v63 != v46) {
            objc_enumerationMutation(v43);
          }
          v48 = *(void **)(*((void *)&v62 + 1) + 8 * ii);
          [(MKStackingViewController *)self _tearDownExitingViewController:v48];
          [v48 removeFromParentViewController];
        }
        uint64_t v45 = [v43 countByEnumeratingWithState:&v62 objects:v87 count:16];
      }
      while (v45);
    }

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v49 = [(MKStackingViewController *)self viewControllers];
    uint64_t v50 = [v49 countByEnumeratingWithState:&v58 objects:v86 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v59;
      do
      {
        for (juint64_t j = 0; jj != v51; ++jj)
        {
          if (*(void *)v59 != v52) {
            objc_enumerationMutation(v49);
          }
          [*(id *)(*((void *)&v58 + 1) + 8 * jj) didMoveToParentViewController:self];
        }
        uint64_t v51 = [v49 countByEnumeratingWithState:&v58 objects:v86 count:16];
      }
      while (v51);
    }

    if ([v38 count] || objc_msgSend(v43, "count"))
    {
      v54 = [(MKStackingViewController *)self view];
      objc_msgSend(v54, "_mapkit_setNeedsLayout");
    }
    id v6 = v57;
  }
}

- (void)_callViewControllersLayoutDelegateIfNeeded
{
  if (self->_needToCallViewControllerLayoutDelegate)
  {
    self->_needToCallViewControllerLayoutDelegate = 0;
    id v3 = [(MKStackingViewController *)self stackingDelegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = [(MKStackingViewController *)self stackingDelegate];
      [v5 stackingViewControllerDidLayoutViewControllers:self];
    }
  }
}

- (double)stackView:(id)a3 distanceBetweenUpperView:(id)a4 andLowerView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = 0.0;
  if (self->_mayWantSpearators)
  {
    uint64_t v12 = [(NSMapTable *)self->_viewsToViewControllers objectForKey:v9];
    uint64_t v13 = [(NSMapTable *)self->_viewsToViewControllers objectForKey:v10];
    if (v12 | v13)
    {
      id v14 = (void *)v13;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_stackingDelegate);
      [WeakRetained stackingViewController:self heightForSeparatorBetweenUpperViewController:v12 andLowerViewController:v14];
      double v11 = v16;
    }
  }

  return v11;
}

- (void)_setUpEnteringViewController:(id)a3
{
  id v7 = a3;
  if ([v7 isViewLoaded])
  {
    char v4 = [v7 view];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;

    [v6 setScrollEnabled:0];
  }
  [(MKStackingViewController *)self _addPreferredHeightConstraintForViewControllerIfNeeded:v7];
}

- (void)setOverlayView:(id)a3 withOriginY:(double)a4
{
  id v7 = (UIView *)a3;
  p_overlayView = &self->_overlayView;
  overlayView = self->_overlayView;
  if (overlayView != v7)
  {
    uint64_t v12 = v7;
    [(UIView *)overlayView removeFromSuperview];
    objc_storeStrong((id *)&self->_overlayView, a3);
    [(UIView *)*p_overlayView setTranslatesAutoresizingMaskIntoConstraints:0];
    self->_overlayViewOriginY = a4;
    int v10 = [(MKStackingViewController *)self isViewLoaded];
    id v7 = v12;
    if (v10)
    {
      if (*p_overlayView)
      {
        [(MKStackingViewController *)self _setOverlayViewFrame];
        double v11 = [(MKStackingViewController *)self view];
        objc_msgSend(v11, "_mapkit_setNeedsUpdateConstraints");

        id v7 = v12;
      }
    }
  }
}

- (void)removeOverlayViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(_MKStackView *)self->_stackView stackedSubviews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (v3)
        {
          if ([*(id *)(*((void *)&v16 + 1) + 8 * i) isHidden]) {
            double v11 = 0.0;
          }
          else {
            double v11 = 1.0;
          }
          [v10 setAlpha:v11];
        }
        [v10 setHidden:0];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__MKStackingViewController_removeOverlayViewAnimated___block_invoke;
  v15[3] = &unk_1E54B86F0;
  v15[4] = self;
  uint64_t v12 = MEMORY[0x18C139AE0](v15);
  uint64_t v13 = (void *)v12;
  if (v3)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__MKStackingViewController_removeOverlayViewAnimated___block_invoke_2;
    v14[3] = &unk_1E54B8188;
    v14[4] = self;
    objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_animateWithDuration:animations:completion:", v14, v12, 0.25);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, 1);
  }
}

void __54__MKStackingViewController_removeOverlayViewAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1080) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 1080);
  *(void *)(v2 + 1080) = 0;
}

void __54__MKStackingViewController_removeOverlayViewAnimated___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 1080) setAlpha:0.0];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 976), "stackedSubviews", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) setAlpha:1.0];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_setOverlayViewFrame
{
  uint64_t v3 = [(MKStackingViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  double overlayViewOriginY = self->_overlayViewOriginY;
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  double Width = CGRectGetWidth(v18);
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  CGFloat Height = CGRectGetHeight(v19);
  overlayView = self->_overlayView;
  double v16 = Height - self->_overlayViewOriginY;

  -[UIView setFrame:](overlayView, "setFrame:", 0.0, overlayViewOriginY, Width, v16);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKStackingViewController;
  [(MKStackingViewController *)&v9 preferredContentSizeDidChangeForChildContentContainer:v4];
  if (!self->_isSettingStackedViews)
  {
    id v5 = v4;
    if (![v5 conformsToProtocol:&unk_1EDA434F8])
    {
LABEL_6:

      goto LABEL_7;
    }
    int v6 = [v5 requiresPreferredContentSizeInStackingView];

    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = v5;
        [v7 preferredContentSize];
        [(MKStackingViewController *)self _setPreferredHeight:v7 forViewController:v8];
        goto LABEL_6;
      }
    }
  }
LABEL_7:
}

- (void)_setPreferredHeight:(double)a3 forViewController:(id)a4
{
  int v6 = [(NSMapTable *)self->_viewControllersToPreferredHeightConstraints objectForKey:a4];
  [v6 constant];
  if (v7 != a3)
  {
    double v8 = [MEMORY[0x1E4F42FF0] _currentAnimationAttributes];
    if (v8)
    {
      objc_super v9 = (void *)MEMORY[0x1E4F42FF0];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __66__MKStackingViewController__setPreferredHeight_forViewController___block_invoke;
      v10[3] = &unk_1E54B9150;
      double v13 = a3;
      id v11 = v6;
      uint64_t v12 = self;
      [v9 _animateWithAttributes:v8 animations:v10 completion:0];
    }
    else
    {
      [v6 setConstant:a3];
    }
  }
}

void __66__MKStackingViewController__setPreferredHeight_forViewController___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setConstant:*(double *)(a1 + 48)];
  id v2 = [*(id *)(a1 + 40) view];
  [v2 layoutIfNeeded];
}

- (void)_addPreferredHeightConstraintForViewControllerIfNeeded:(id)a3
{
  id v9 = a3;
  if ([v9 conformsToProtocol:&unk_1EDA434F8]
    && [v9 requiresPreferredContentSizeInStackingView]
    && [v9 isViewLoaded])
  {
    id v4 = [(NSMapTable *)self->_viewControllersToPreferredHeightConstraints objectForKey:v9];
    if (!v4)
    {
      if (!self->_viewControllersToPreferredHeightConstraints)
      {
        id v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
        viewControllersToPreferredHeightConstraints = self->_viewControllersToPreferredHeightConstraints;
        self->_viewControllersToPreferredHeightConstraints = v5;
      }
      double v7 = [v9 view];
      double v8 = [v7 heightAnchor];
      id v4 = [v8 constraintEqualToConstant:0.0];

      [v4 setActive:1];
      [(NSMapTable *)self->_viewControllersToPreferredHeightConstraints setObject:v4 forKey:v9];
    }
  }
}

- (void)_removePreferredHeightConstraintFromViewController:(id)a3
{
  id v6 = a3;
  id v4 = -[NSMapTable objectForKey:](self->_viewControllersToPreferredHeightConstraints, "objectForKey:");
  if (v4)
  {
    [(NSMapTable *)self->_viewControllersToPreferredHeightConstraints removeObjectForKey:v6];
    id v5 = [v6 view];
    [v5 removeConstraint:v4];
  }
}

- (void)updateViewConstraints
{
  v23[1] = *MEMORY[0x1E4F143B8];
  if (!self->_contentViewConstraintsAdded)
  {
    self->_contentViewConstraintsAdded = 1;
    uint64_t v3 = (void *)MEMORY[0x1E4F28DC8];
    v23[0] = self->_widthConstraint;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    [v3 activateConstraints:v4];
  }
  overlayView = self->_overlayView;
  if (overlayView)
  {
    id v6 = [(UIView *)overlayView superview];
    double v7 = [(MKStackingViewController *)self view];

    if (v6 != v7)
    {
      double v8 = [(MKStackingViewController *)self view];
      [v8 addSubview:self->_overlayView];

      [(MKStackingViewController *)self _setOverlayViewFrame];
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = [(MKStackingViewController *)self viewControllers];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(id *)(*((void *)&v18 + 1) + 8 * v13);
        if ([v14 conformsToProtocol:&unk_1EDA434F8])
        {
          int v15 = [v14 requiresPreferredContentSizeInStackingView];

          if (v15 && [v14 isViewLoaded])
          {
            [v14 preferredContentSize];
            [(MKStackingViewController *)self _setPreferredHeight:v14 forViewController:v16];
          }
        }
        else
        {
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  v17.receiver = self;
  v17.super_class = (Class)MKStackingViewController;
  [(MKStackingViewController *)&v17 updateViewConstraints];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MKStackingViewController;
  [(MKStackingViewController *)&v7 viewDidAppear:a3];
  if (self->_needsToPerformLayout && [(MKStackingViewController *)self _isSafeToPerformLayout])
  {
    id v4 = (void *)MEMORY[0x1E4F1CAD0];
    id v5 = [(MKStackingViewController *)self viewControllers];
    id v6 = [v4 setWithArray:v5];
    [(MKStackingViewController *)self _updateStackViewSubviewsAndChildVCsEntering:v6 exiting:0];
  }
  [(MKStackingViewController *)self _updateViewControllerVisibilityAfterPositionChange];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MKStackingViewController;
  [(MKStackingViewController *)&v3 viewWillAppear:a3];
}

- (void)viewWillLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)MKStackingViewController;
  [(MKStackingViewController *)&v8 viewWillLayoutSubviews];
  ++self->_countOfCurrentLayoutInvocations;
  [(_MKStackingContentView *)self->_contentView frame];
  double Width = CGRectGetWidth(v9);
  double v4 = 260.0;
  if (Width >= 260.0)
  {
    [(_MKStackingContentView *)self->_contentView frame];
    double v4 = CGRectGetWidth(v10);
  }
  [(NSLayoutConstraint *)self->_widthConstraint setConstant:v4];
  if (self->_needsToPerformLayout)
  {
    if ([(MKStackingViewController *)self _isSafeToPerformLayout])
    {
      id v5 = (void *)MEMORY[0x1E4F1CAD0];
      id v6 = [(MKStackingViewController *)self viewControllers];
      objc_super v7 = [v5 setWithArray:v6];
      [(MKStackingViewController *)self _updateStackViewSubviewsAndChildVCsEntering:v7 exiting:0];
    }
  }
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)MKStackingViewController;
  [(MKStackingViewController *)&v5 viewDidLayoutSubviews];
  unint64_t v3 = self->_countOfCurrentLayoutInvocations - 1;
  self->_countOfCurrentLayoutInvocations = v3;
  if (self->_overlayView) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4) {
    [(MKStackingViewController *)self _setOverlayViewFrame];
  }
  [(MKStackingViewController *)self _callViewControllersLayoutDelegateIfNeeded];
  [(MKStackingViewController *)self _sendScrollnotification];
}

- (void)scrollViewDidScroll:(id)a3
{
  [(MKStackingViewController *)self _didScroll];

  [(MKStackingViewController *)self _sendScrollnotification];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  [(MKStackingViewController *)self _updateViewControllerVisibilityAfterPositionChange];
  BOOL v4 = [(MKStackingViewController *)self stackingDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(MKStackingViewController *)self stackingDelegate];
    [v6 stackingViewControllerWillBeginScroll:self];
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6 = a3;
  if (!a4)
  {
    id v10 = v6;
    objc_super v7 = [(MKStackingViewController *)self stackingDelegate];
    char v8 = objc_opt_respondsToSelector();

    id v6 = v10;
    if (v8)
    {
      CGRect v9 = [(MKStackingViewController *)self stackingDelegate];
      [v9 stackingViewControllerDidEndScroll:self];

      id v6 = v10;
    }
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  BOOL v4 = [(MKStackingViewController *)self stackingDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(MKStackingViewController *)self stackingDelegate];
    [v6 stackingViewControllerDidEndScroll:self];
  }
}

- (void)scrollToTopAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = *MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(UIScrollView *)self->_scrollView adjustedContentInset];
  double v8 = v5 - v7;
  [(UIScrollView *)self->_scrollView adjustedContentInset];
  scrollView = self->_scrollView;

  -[UIScrollView setContentOffset:animated:](scrollView, "setContentOffset:animated:", v3, v8, v6 - v9);
}

- (void)_sendScrollnotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"MKStackingScrollNotification" object:self->_scrollView];
}

- (void)_updateViewControllerVisibilityAfterPositionChange
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = [(MKStackingViewController *)self stackingDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = [(MKStackingViewController *)self stackingDelegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      obuint64_t j = [(MKStackingViewController *)self viewControllers];
      uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v23 != v9) {
              objc_enumerationMutation(obj);
            }
            uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            uint64_t v12 = [(MKStackingViewController *)self stackingDelegate];
            [v12 stackingViewController:self minimumVisibleSurfacePercentForAnalyticsSelection:v11];
            double v14 = v13;

            int v15 = [v11 view];
            int v16 = [(MKStackingViewController *)self isViewVisbile:v15 percentageTreshold:v14];

            minimallyVisibleViews = self->_minimallyVisibleViews;
            long long v18 = [v11 view];
            LODWORD(minimallyVisibleViews) = [(NSHashTable *)minimallyVisibleViews containsObject:v18];

            if (v16 != minimallyVisibleViews)
            {
              long long v19 = self->_minimallyVisibleViews;
              long long v20 = [v11 view];
              if (v16)
              {
                [(NSHashTable *)v19 addObject:v20];

                long long v20 = [(MKStackingViewController *)self stackingDelegate];
                [v20 stackingViewController:self didShowMinimumVisibleSurfacePercentForAnalyticsSelection:v11];
              }
              else
              {
                [(NSHashTable *)v19 removeObject:v20];
              }
            }
          }
          uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v8);
      }
    }
  }
}

- (BOOL)isViewVisbile:(id)a3 percentageTreshold:(double)a4
{
  id v6 = a3;
  [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR___MKStackingViewController__scrollView[self->_isScrollDisabled]) frame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  contentView = self->_contentView;
  [v6 bounds];
  -[_MKStackingContentView convertRect:fromView:](contentView, "convertRect:fromView:", v6);
  v28.origin.x = v16;
  v28.origin.y = v17;
  v28.size.width = v18;
  v28.size.double height = v19;
  v26.origin.x = v8;
  v26.origin.y = v10;
  v26.size.width = v12;
  v26.size.double height = v14;
  CGRect v27 = CGRectIntersection(v26, v28);
  double height = v27.size.height;
  BOOL IsNull = CGRectIsNull(v27);
  double v22 = 0.0;
  if (!IsNull)
  {
    objc_msgSend(v6, "bounds", 0.0);
    double v22 = height / v23;
  }
  BOOL v24 = v22 >= a4;

  return v24;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (NSArray)viewControllers
{
  return self->_viewControllers;
}

- (MKStackingViewControllerDelegate)stackingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stackingDelegate);

  return (MKStackingViewControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stackingDelegate);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_minimallyVisibleViews, 0);
  objc_storeStrong((id *)&self->_titleViewConstraints, 0);
  objc_storeStrong((id *)&self->_viewsToViewControllers, 0);
  objc_storeStrong((id *)&self->_viewControllersToPreferredHeightConstraints, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_stackViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_contentView, 0);

  objc_storeStrong((id *)&self->_stackView, 0);
}

@end