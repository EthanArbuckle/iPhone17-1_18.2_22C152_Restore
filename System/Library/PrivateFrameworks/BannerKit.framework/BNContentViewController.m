@interface BNContentViewController
+ (id)_retargetableBannerTransitionAnimatorForAnimator:(id)a3;
+ (void)initialize;
- (BNConsidering)authority;
- (BNContentViewController)initWithAuthority:(id)a3;
- (BNPosting)poster;
- (BNPresentingDelegate)delegate;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isDraggingDismissalEnabledForPresentable:(id)a3;
- (BOOL)_isDraggingEnabledForPresentable:(id)a3;
- (BOOL)_isDraggingInteractionEnabledForPresentable:(id)a3;
- (BOOL)_isLocalDraggingEnabledForPresentable:(id)a3;
- (BOOL)_isPresentableNotice:(id)a3;
- (BOOL)_isTouchOutsideDismissalEnabledForPresentable:(id)a3;
- (BOOL)_resetActiveBannerTransitionAnimator:(id)a3;
- (BOOL)_resetActiveBannerTransitionContextIfComplete:(id)a3;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)resignFirstResponder;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)shouldAutorotate;
- (BOOL)shouldFenceAnimationsForPresentable:(id)a3;
- (BOOL)shouldNewTierBeAddedToTopForPresentable:(id)a3 withPresentable:(id)a4;
- (BOOL)shouldOverlapPresentable:(id)a3 withPresentable:(id)a4;
- (CGPoint)_locationOfScrollEvent:(id)a3 inContainerViewForGesture:(id)a4;
- (CGPoint)_locationOfTouch:(id)a3 inContainerViewForGesture:(id)a4;
- (CGPoint)_translationInContainerViewForGesture:(id)a3;
- (CGPoint)_velocityInContainerViewForGesture:(id)a3;
- (CGPoint)gestureRecognizerProxy:(id)a3 locationForTouch:(id)a4 inCoordinateSpace:(id)a5;
- (CGPoint)gestureRecognizerProxy:(id)a3 translationInCoordinateSpace:(id)a4;
- (CGPoint)gestureRecognizerProxy:(id)a3 velocityInCoordinateSpace:(id)a4;
- (CGPoint)gestureRecognizerProxy:(id)a3 visualTranslationInCoordinateSpace:(id)a4;
- (CGRect)_dismissedFrameForViewController:(id)a3 withContainerBounds:(CGRect)a4;
- (CGRect)_dismissedFrameWithPaddingForViewController:(id)a3 withContainerBounds:(CGRect)a4;
- (CGRect)_dismissedFrameWithPaddingForViewController:(id)a3 withContainerBounds:(CGRect)a4 targetTransform:(CGAffineTransform *)a5;
- (CGRect)_insetFrame:(CGRect)a3 forViewController:(id)a4;
- (CGRect)_outsetFrame:(CGRect)a3 forViewController:(id)a4;
- (CGRect)_presentedFrame:(BOOL)a3 forViewController:(id)a4 withContainerBounds:(CGRect)a5 overshoot:(BOOL)a6 targetTransform:(CGAffineTransform *)a7;
- (CGRect)_presentedFrameForPresentable:(id)a3 withContainerBounds:(CGRect)a4;
- (CGRect)_presentedFrameForViewController:(id)a3 withContainerBounds:(CGRect)a4;
- (CGRect)_presentedFrameForViewController:(id)a3 withContainerBounds:(CGRect)a4 targetTransform:(CGAffineTransform *)a5;
- (CGRect)_presentedFrameForViewController:(id)a3 withContentFrame:(CGRect)a4 afterContentWithFrame:(CGRect)a5;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (NSArray)allPresentables;
- (NSArray)presentedPresentables;
- (NSArray)topPresentables;
- (id)_dismissPresentablesWithIdentification:(id)a3 reason:(id)a4 animated:(BOOL)a5 userInfo:(id)a6;
- (id)_layoutManager;
- (id)_newBannerTransitionContextForMorphFromViewController:(id)a3 toViewController:(id)a4 animated:(BOOL)a5;
- (id)_newBannerTransitionContextForPresenting:(BOOL)a3 viewController:(id)a4 animated:(BOOL)a5;
- (id)_presentableForGestureInView:(id)a3;
- (id)_presentableForScrollEvent:(id)a3;
- (id)_presentableForTouch:(id)a3;
- (id)_presentablesWithIdentification:(id)a3 requiringUniqueMatch:(BOOL)a4;
- (id)_topPresentable;
- (id)dismissPresentablesWithIdentification:(id)a3 reason:(id)a4 animated:(BOOL)a5 userInfo:(id)a6;
- (id)dismissPresentablesWithIdentification:(id)a3 reason:(id)a4 userInfo:(id)a5;
- (id)sizeTransitionAnimationSettingsForPresentable:(id)a3;
- (id)userInterfaceStyleTransitionAnimationSettingsForPresentable:(id)a3 forTransitionToStyle:(int64_t)a4;
- (int64_t)_effectTierForPresentable:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_addPresentable:(id)a3 withTransitioningDelegate:(id)a4 incrementingTier:(BOOL)a5 addTierToTop:(BOOL)a6;
- (void)_dismissPresentable:(id)a3 withReason:(id)a4 animated:(BOOL)a5 userInfo:(id)a6;
- (void)_gestureRecognizerFailed:(id)a3;
- (void)_handlePan:(id)a3;
- (void)_insertPresentable:(id)a3 beneathPresentable:(id)a4 withTransitioningDelegate:(id)a5;
- (void)_insertPresentable:(id)a3 beneathPresentable:(id)a4 withTransitioningDelegate:(id)a5 incrementingTier:(BOOL)a6 addTierToTop:(BOOL)a7;
- (void)_morphFromPresentable:(id)a3 toPresentable:(id)a4 withOptions:(unint64_t)a5 userInfo:(id)a6 stateChange:(BOOL)a7;
- (void)_postLayoutChangeForVisibleNotifications;
- (void)_removePresentable:(id)a3;
- (void)_resetPresentableForActiveGesture:(id)a3;
- (void)_updateFrameForChildContentContainer:(id)a3 minimumTopInsetUpdate:(BOOL)a4;
- (void)bannerContentOutsetsDidInvalidateForPresentableViewController:(id)a3;
- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4;
- (void)loadView;
- (void)morphFromPresentable:(id)a3 toPresentable:(id)a4 withOptions:(unint64_t)a5 userInfo:(id)a6 stateChange:(BOOL)a7;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)preferredMinimumTopInsetDidInvalidate;
- (void)presentPresentable:(id)a3 withOptions:(unint64_t)a4 userInfo:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setPoster:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BNContentViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    BNRegisterBannerKitLogging();
  }
}

- (NSArray)topPresentables
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  unint64_t v3 = 0;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  while (v3 < [(BNTieredArray *)self->_presentables tierCount])
  {
    v4 = [(BNTieredArray *)self->_presentables tierAtIndex:v3];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__BNContentViewController_topPresentables__block_invoke;
    v7[3] = &unk_1E63B9C08;
    v7[4] = self;
    v7[5] = &v8;
    [v4 enumerateObjectsWithOptions:2 usingBlock:v7];

    ++v3;
  }
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

void __42__BNContentViewController_topPresentables__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ((objc_msgSend(*(id *)(*(void *)(a1 + 32) + 992), "containsObject:") & 1) == 0) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) insertObject:v6 atIndex:0];
  }
  if (([*(id *)(a1 + 32) _isPresentableNotice:v6] & 1) == 0) {
    *a4 = 1;
  }
}

- (NSArray)presentedPresentables
{
  unint64_t v3 = [(BNTieredArray *)self->_presentables allObjects];
  v4 = (void *)[v3 mutableCopy];

  id v5 = [(NSMutableSet *)self->_dismissingPresentables allObjects];
  [v4 removeObjectsInArray:v5];

  return (NSArray *)v4;
}

- (NSArray)allPresentables
{
  return [(BNTieredArray *)self->_presentables allObjects];
}

- (BOOL)canBecomeFirstResponder
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(BNContentViewController *)self topPresentables];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = UIViewControllerFromPresentable(*(void **)(*((void *)&v9 + 1) + 8 * i));
        char v7 = [v6 canBecomeFirstResponder];

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)becomeFirstResponder
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(BNContentViewController *)self topPresentables];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = UIViewControllerFromPresentable(*(void **)(*((void *)&v9 + 1) + 8 * i));
        char v7 = [v6 becomeFirstResponder];

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)resignFirstResponder
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(BNContentViewController *)self topPresentables];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = UIViewControllerFromPresentable(*(void **)(*((void *)&v9 + 1) + 8 * i));
        char v7 = [v6 resignFirstResponder];

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)loadView
{
  uint64_t v3 = [BNContentViewControllerView alloc];
  id v5 = [MEMORY[0x1E4F42D90] mainScreen];
  [v5 bounds];
  uint64_t v4 = -[BNContentViewControllerView initWithFrame:](v3, "initWithFrame:");
  [(BNContentViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)BNContentViewController;
  [(BNContentViewController *)&v8 viewDidLoad];
  uint64_t v3 = [(BNContentViewController *)self view];
  [v3 setAutoresizesSubviews:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();
  if (v5)
  {
    id v6 = [WeakRetained panGestureRecognizerForPresenter:self];
  }
  else
  {
    id v6 = 0;
  }
  p_panGesture = &self->_panGesture;
  objc_storeStrong((id *)&self->_panGesture, v6);
  if (v5) {

  }
  [(UIPanGestureRecognizer *)*p_panGesture addTarget:self action:sel__handlePan_];
  [(UIPanGestureRecognizer *)*p_panGesture setDelegate:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)BNContentViewController;
  -[BNContentViewController viewWillAppear:](&v15, sel_viewWillAppear_);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  char v5 = self->_presentables;
  uint64_t v6 = [(BNTieredArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = UIViewControllerFromPresentable(*(void **)(*((void *)&v11 + 1) + 8 * v9));
        objc_msgSend(v10, "bs_beginAppearanceTransition:animated:", 1, v3, (void)v11);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(BNTieredArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)BNContentViewController;
  [(BNContentViewController *)&v14 viewDidAppear:a3];
  [(UIPanGestureRecognizer *)self->_panGesture setEnabled:1];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = self->_presentables;
  uint64_t v5 = [(BNTieredArray *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = UIViewControllerFromPresentable(*(void **)(*((void *)&v10 + 1) + 8 * v8));
        objc_msgSend(v9, "bs_endAppearanceTransition", (void)v10);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(BNTieredArray *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)BNContentViewController;
  -[BNContentViewController viewWillDisappear:](&v15, sel_viewWillDisappear_);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_presentables;
  uint64_t v6 = [(BNTieredArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = UIViewControllerFromPresentable(*(void **)(*((void *)&v11 + 1) + 8 * v9));
        objc_msgSend(v10, "bs_beginAppearanceTransition:animated:", 0, v3, (void)v11);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(BNTieredArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)BNContentViewController;
  [(BNContentViewController *)&v14 viewDidDisappear:a3];
  [(UIPanGestureRecognizer *)self->_panGesture setEnabled:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = self->_presentables;
  uint64_t v5 = [(BNTieredArray *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = UIViewControllerFromPresentable(*(void **)(*((void *)&v10 + 1) + 8 * v8));
        objc_msgSend(v9, "bs_endAppearanceTransition", (void)v10);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(BNTieredArray *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (BOOL)shouldAutorotate
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(BNContentViewController *)self topPresentables];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = UIViewControllerFromPresentable(*(void **)(*((void *)&v11 + 1) + 8 * i));
        int v8 = [v7 shouldAutorotate];

        if (!v8)
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(BNContentViewController *)self _topPresentable];
  uint64_t v3 = UIViewControllerFromPresentable(v2);
  uint64_t v4 = [v3 supportedInterfaceOrientations];
  if (v4) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = 30;
  }

  return v5;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4
{
  if (a3) {
    a3->var6 = 0;
  }
}

- (void)bannerContentOutsetsDidInvalidateForPresentableViewController:(id)a3
{
  uint64_t v4 = UIViewControllerFromPresentable(a3);
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v4 = [(BNContentViewController *)self _updateFrameForChildContentContainer:v4 minimumTopInsetUpdate:0];
    uint64_t v5 = v6;
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BNContentViewController;
  id v4 = a3;
  [(BNContentViewController *)&v5 preferredContentSizeDidChangeForChildContentContainer:v4];
  -[BNContentViewController _updateFrameForChildContentContainer:minimumTopInsetUpdate:](self, "_updateFrameForChildContentContainer:minimumTopInsetUpdate:", v4, 0, v5.receiver, v5.super_class);
}

- (void)_updateFrameForChildContentContainer:(id)a3 minimumTopInsetUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  uint64_t v7 = [(BNContentViewController *)self allPresentables];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v71 objects:v77 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v72;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v72 != v9) {
        objc_enumerationMutation(v7);
      }
      long long v11 = *(void **)(*((void *)&v71 + 1) + 8 * v10);
      UIViewControllerFromPresentable(v11);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v13 = v12 == v6;

      if (v13) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v7 countByEnumeratingWithState:&v71 objects:v77 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v14 = v11;

    if (!v14) {
      goto LABEL_43;
    }
    objc_super v15 = (void *)BNLogPresenting;
    if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = v15;
      uint64_t v17 = BNEffectivePresentableDescription(v14);
      *(_DWORD *)buf = 138543362;
      id v76 = v17;
      _os_log_impl(&dword_1BEC04000, v16, OS_LOG_TYPE_DEFAULT, "Preferred content size did change for presentable: %{public}@", buf, 0xCu);
    }
    UIViewControllerFromPresentable(v14);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    id v19 = [(BNContentViewController *)self transitionCoordinator];
    if (v19 || v18 != v6) {
      goto LABEL_40;
    }
    if (!objc_msgSend(v6, "bs_isAppearingOrAppeared"))
    {
LABEL_41:

      goto LABEL_42;
    }
    v20 = BNLogPresenting;
    if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v76 = v6;
      _os_log_impl(&dword_1BEC04000, v20, OS_LOG_TYPE_DEFAULT, "Animating preferred content size change of child container: %{public}@", buf, 0xCu);
    }
    v21 = [(BNContentViewController *)self view];
    [v21 bounds];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;

    if (objc_msgSend(v6, "bs_isAppearingOrAppeared")) {
      -[BNContentViewController _presentedFrameForPresentable:withContainerBounds:](self, "_presentedFrameForPresentable:withContainerBounds:", v14, v23, v25, v27, v29);
    }
    else {
      -[BNContentViewController _dismissedFrameWithPaddingForViewController:withContainerBounds:](self, "_dismissedFrameWithPaddingForViewController:withContainerBounds:", v6, v23, v25, v27, v29);
    }
    v34 = v30;
    v35 = v31;
    double v36 = v32;
    double v37 = v33;
    if (v4)
    {
      v38 = [v6 view];
    }
    else
    {
      char v39 = objc_msgSend(v6, "bn_shouldAnimateViewTransitionToSize:", v32, v33);
      v40 = [v6 view];
      v38 = v40;
      if ((v39 & 1) == 0)
      {
        [v40 _removeAllRetargetableAnimations:1];
        int v41 = 0;
        goto LABEL_26;
      }
    }
    int v41 = 1;
LABEL_26:
    [v38 frame];
    double v43 = v42;
    double v45 = v44;
    double v47 = v46;
    double v49 = v48;
    v50 = [(BNContentViewController *)self view];
    v51 = +[BNTransitionContext transitionContextForTransitionOfViewController:fromFrame:toFrame:inContainerView:](BNTransitionContext, "transitionContextForTransitionOfViewController:fromFrame:toFrame:inContainerView:", v6, v50, v43, v45, v47, v49, *(double *)&v34, *(double *)&v35, v36, v37);

    if (v41) {
      uint64_t v52 = [(BNContentViewController *)self bs_isAppearingOrAppeared];
    }
    else {
      uint64_t v52 = 0;
    }
    [v51 setAnimated:v52];
    v65 = [v6 transitioningDelegate];
    if (v41)
    {
      if (v4)
      {
        v53 = [BNBannerAnimator alloc];
        v54 = +[BNBannerAnimator defaultResizeAnimationSettings];
        v55 = [(BNBannerAnimator *)v53 initWithAnimationSettings:v54];
      }
      else
      {
        if (objc_opt_respondsToSelector())
        {
          v56 = [v65 animationControllerForResizingController:v6 userInfo:0];
        }
        else
        {
          v56 = objc_alloc_init(BNBannerAnimator);
        }
        v55 = v56;
      }
    }
    else
    {
      v55 = 0;
    }
    objc_initWeak((id *)buf, self);
    v57 = [v51 transitionCoordinator];
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __86__BNContentViewController__updateFrameForChildContentContainer_minimumTopInsetUpdate___block_invoke;
    v66[3] = &unk_1E63B9C30;
    location = v70;
    objc_copyWeak(v70, (id *)buf);
    v58 = v55;
    v67 = v58;
    id v19 = v38;
    id v68 = v19;
    v70[1] = v34;
    v70[2] = v35;
    v70[3] = *(id *)&v36;
    v70[4] = *(id *)&v37;
    id v59 = v14;
    id v69 = v59;
    [v57 animateAlongsideTransition:v66 completion:0];

    v60 = [v51 transitionCoordinator];
    objc_msgSend(v6, "viewWillTransitionToSize:withTransitionCoordinator:", v60, v36, v37);

    [v19 _removeAllRetargetableAnimations:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      v62 = objc_msgSend(v51, "transitionCoordinator", v70);
      objc_msgSend(WeakRetained, "presenter:presentable:willTransitionToSize:withTransitionCoordinator:", self, v59, v62, v36, v37);
    }
    objc_msgSend(v51, "performTransitionWithAnimator:", v58, location);

    objc_destroyWeak(locationa);
    objc_destroyWeak((id *)buf);

LABEL_40:
    goto LABEL_41;
  }
LABEL_9:
  id v14 = v7;
LABEL_42:

LABEL_43:
}

void __86__BNContentViewController__updateFrameForChildContentContainer_minimumTopInsetUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (*(void *)(a1 + 32))
  {
    if (!WeakRetained) {
      goto LABEL_7;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
    [v4 _postLayoutChangeForVisibleNotifications];
    id WeakRetained = v4;
    if (!v4) {
      goto LABEL_7;
    }
  }
  if (*(void *)(a1 + 48) == *((void *)WeakRetained + 127))
  {
    long long v3 = *(_OWORD *)(a1 + 80);
    *((_OWORD *)WeakRetained + 64) = *(_OWORD *)(a1 + 64);
    *((_OWORD *)WeakRetained + 65) = v3;
  }
LABEL_7:
  [*(id *)(a1 + 40) layoutIfNeeded];
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  objc_super v5 = [(BNContentViewController *)self _layoutManager];
  BSRectWithSize();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id v14 = [(BNContentViewController *)self view];
  objc_super v15 = [v14 window];

  if (objc_msgSend(v15, "_bn_isRotating")) {
    uint64_t v16 = [v15 _toWindowOrientation];
  }
  else {
    uint64_t v16 = [v15 interfaceOrientation];
  }
  uint64_t v17 = v16;
  id v18 = [v15 screen];
  objc_msgSend(v5, "useableContainerFrameInContainerBounds:onScreen:interfaceOrientation:", v18, v17, v7, v9, v11, v13);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  double v27 = [(BNContentViewController *)self traitCollection];
  [v27 displayScale];
  objc_msgSend(v5, "presentedFrameForContentWithPreferredSize:inUseableContainerFrame:containerBounds:scale:", v24, v26, v20, v22, v24, v26, *(void *)&v7, *(void *)&v9, *(void *)&v11, *(void *)&v13, v28);
  double v30 = v29;
  double v32 = v31;

  double v33 = v30;
  double v34 = v32;
  result.height = v34;
  result.width = v33;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  double v8 = (void *)BNLogPresenting;
  if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = v8;
    double v10 = (objc_class *)objc_opt_class();
    double v11 = NSStringFromClass(v10);
    v36.double width = width;
    v36.double height = height;
    double v12 = NSStringFromCGSize(v36);
    *(_DWORD *)buf = 138543618;
    double v32 = v11;
    __int16 v33 = 2114;
    double v34 = v12;
    _os_log_impl(&dword_1BEC04000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ view will transition to size: %{public}@", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(WeakRetained, "presenter:willTransitionToSize:withTransitionCoordinator:", self, v7, width, height);
  }
  id v14 = self->_activeBannerTransitionContext;
  uint64_t v15 = [(BNTransitionContext *)v14 transitionCoordinator];
  uint64_t v16 = (void *)v15;
  if (v15) {
    uint64_t v17 = (void *)v15;
  }
  else {
    uint64_t v17 = v7;
  }
  id v18 = v17;

  double v19 = [(id)objc_opt_class() _retargetableBannerTransitionAnimatorForAnimator:self->_activeBannerTransitionAnimator];
  v30.receiver = self;
  v30.super_class = (Class)BNContentViewController;
  -[BNContentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v30, sel_viewWillTransitionToSize_withTransitionCoordinator_, v18, width, height);
  objc_initWeak((id *)buf, self);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __78__BNContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v27[3] = &unk_1E63B9C58;
  v29[1] = *(id *)&width;
  v29[2] = *(id *)&height;
  objc_copyWeak(v29, (id *)buf);
  id v20 = v7;
  id v28 = v20;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __78__BNContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_45;
  v23[3] = &unk_1E63B9C80;
  objc_copyWeak(&v26, (id *)buf);
  double v21 = v14;
  double v24 = v21;
  id v22 = v19;
  id v25 = v22;
  [v18 animateAlongsideTransition:v27 completion:v23];
  [v22 retargetTransition:self->_activeBannerTransitionContext];

  objc_destroyWeak(&v26);
  objc_destroyWeak(v29);
  objc_destroyWeak((id *)buf);
}

void __78__BNContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)BNLogPresenting;
  if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
  {
    CGFloat v5 = *(double *)(a1 + 48);
    CGFloat v6 = *(double *)(a1 + 56);
    id v7 = v4;
    v48.double width = v5;
    v48.double height = v6;
    double v8 = NSStringFromCGSize(v48);
    *(_DWORD *)buf = 138543362;
    double v46 = v8;
    _os_log_impl(&dword_1BEC04000, v7, OS_LOG_TYPE_DEFAULT, "Animating layout of top presentables for transition to size: %{public}@", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v37 = v3;
    BSRectWithSize();
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v18 = [WeakRetained topPresentables];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v41 != v21) {
            objc_enumerationMutation(v18);
          }
          double v23 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          double v24 = UIViewControllerFromPresentable(v23);
          int v25 = objc_msgSend(v24, "bs_isAppearingOrAppeared");
          id v26 = *(void **)(a1 + 32);
          if (v25)
          {
            if (v26) {
              [v26 targetTransform];
            }
            else {
              memset(v39, 0, sizeof(v39));
            }
            objc_msgSend(WeakRetained, "_presentedFrameForViewController:withContainerBounds:targetTransform:", v24, v39, v11, v13, v15, v17);
          }
          else
          {
            if (v26) {
              [v26 targetTransform];
            }
            else {
              memset(v38, 0, sizeof(v38));
            }
            objc_msgSend(WeakRetained, "_dismissedFrameWithPaddingForViewController:withContainerBounds:targetTransform:", v24, v38, v11, v13, v15, v17);
          }
          double v31 = v27;
          double v32 = v28;
          double v33 = v29;
          double v34 = v30;
          uint64_t v35 = [v24 view];
          objc_msgSend(v35, "setFrame:", v31, v32, v33, v34);

          CGSize v36 = [WeakRetained view];
          [v36 setNeedsLayout];
          [v36 layoutIfNeeded];
          if (v23 == (void *)WeakRetained[127])
          {
            *((double *)WeakRetained + 128) = v31;
            *((double *)WeakRetained + 129) = v32;
            *((double *)WeakRetained + 130) = v33;
            *((double *)WeakRetained + 131) = v34;
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v20);
    }

    [WeakRetained _postLayoutChangeForVisibleNotifications];
    id v3 = v37;
  }
}

uint64_t __78__BNContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_45(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    CGFloat v5 = WeakRetained;
    id WeakRetained = (id)[WeakRetained _resetActiveBannerTransitionContextIfComplete:*(void *)(a1 + 32)];
    id v3 = v5;
    if (WeakRetained)
    {
      id WeakRetained = (id)[v5 _resetActiveBannerTransitionAnimator:*(void *)(a1 + 40)];
      id v3 = v5;
    }
  }
  return MEMORY[0x1F41817F8](WeakRetained, v3);
}

- (BNContentViewController)initWithAuthority:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BNContentViewController;
  CGFloat v6 = [(BNContentViewController *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_authority, a3);
  }

  return v7;
}

- (void)presentPresentable:(id)a3 withOptions:(unint64_t)a4 userInfo:(id)a5
{
  char v6 = a4;
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v69 = a5;
  objc_super v9 = (void *)BNLogPresenting;
  if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = v9;
    double v11 = BNEffectivePresentableDescription(v8);
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_1BEC04000, v10, OS_LOG_TYPE_DEFAULT, "Asked to present presentable: %{public}@", (uint8_t *)&buf, 0xCu);
  }
  if (v8 && ([(NSMutableSet *)self->_presentingPresentables containsObject:v8] & 1) == 0)
  {
    double v12 = (void *)BNLogPresenting;
    if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
    {
      double v13 = v12;
      double v14 = BNEffectivePresentableDescription(v8);
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_1BEC04000, v13, OS_LOG_TYPE_DEFAULT, "Presenting presentable %{public}@", (uint8_t *)&buf, 0xCu);
    }
    presentingPresentables = self->_presentingPresentables;
    if (!presentingPresentables)
    {
      double v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      double v17 = self->_presentingPresentables;
      self->_presentingPresentables = v16;

      presentingPresentables = self->_presentingPresentables;
    }
    [(NSMutableSet *)presentingPresentables addObject:v8];
    [(NSMutableSet *)self->_dismissingPresentables removeObject:v8];
    v65 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v97 = 0x3032000000;
    v98 = __Block_byref_object_copy__0;
    v99 = __Block_byref_object_dispose__0;
    id v100 = 0;
    if (v6)
    {
      id v18 = [v8 requesterIdentifier];
      uint64_t v19 = [(BNTieredArray *)self->_presentables allObjects];
      uint64_t v20 = (void *)MEMORY[0x1E4F28F60];
      v90[0] = MEMORY[0x1E4F143A8];
      v90[1] = 3221225472;
      v90[2] = __67__BNContentViewController_presentPresentable_withOptions_userInfo___block_invoke;
      v90[3] = &unk_1E63B9CA8;
      id v91 = v8;
      id v21 = v18;
      id v92 = v21;
      v93 = self;
      id v22 = [v20 predicateWithBlock:v90];
      v65 = [v19 filteredArrayUsingPredicate:v22];

      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      double v24 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v23;
    }
    int v25 = UIViewControllerFromPresentable(v8);
    id v68 = [v25 transitioningDelegate];
    if (!v68)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector())
      {
        id v68 = [WeakRetained defaultTransitioningDelegateForPresenter:self];
      }
      else
      {
        id v68 = objc_alloc_init(BNDefaultBannerTransitioningDelegate);
      }
      [v25 setTransitioningDelegate:v68];
    }
    double v27 = [(BNContentViewController *)self _presentablesWithIdentification:v8 requiringUniqueMatch:1];
    uint64_t v28 = [v27 count];

    if (!v28)
    {
      double v29 = [(BNContentViewController *)self _topPresentable];
      BOOL v30 = [(BNContentViewController *)self shouldOverlapPresentable:v29 withPresentable:v8];
      BOOL v31 = [(BNContentViewController *)self shouldNewTierBeAddedToTopForPresentable:v29 withPresentable:v8];
      if (v30
        && ![(BNContentViewController *)self _isPresentableNotice:v8]
        && [(BNContentViewController *)self _isPresentableNotice:v29])
      {
        [(BNContentViewController *)self _insertPresentable:v8 beneathPresentable:v29 withTransitioningDelegate:v68];
        int v32 = 1;
      }
      else
      {
        [(BNContentViewController *)self _addPresentable:v8 withTransitioningDelegate:v68 incrementingTier:!v30 addTierToTop:v31];
        int v32 = 0;
      }
      [(BNContentViewController *)self addChildViewController:v25];
      [v25 didMoveToParentViewController:self];
      double v33 = [v25 view];
      double v34 = [(BNContentViewController *)self view];
      uint64_t v35 = v34;
      if (v32)
      {
        CGSize v36 = UIViewControllerFromPresentable(v29);
        id v37 = [v36 view];
        [v35 insertSubview:v33 belowSubview:v37];
      }
      else
      {
        [v34 addSubview:v33];
      }
    }
    uint64_t v38 = [(BNContentViewController *)self bs_isAppearingOrAppeared];
    id v39 = [(BNContentViewController *)self _newBannerTransitionContextForPresenting:1 viewController:v25 animated:v38];
    objc_storeStrong((id *)&self->_activeBannerTransitionContext, v39);
    if (!v28) {
      goto LABEL_30;
    }
    long long v40 = UIViewControllerFromPresentable(v8);
    long long v41 = [(BNTransitionContext *)self->_activeBannerTransitionContext viewControllerForKey:*MEMORY[0x1E4F43EB0]];
    int v42 = BSEqualObjects();

    if (!v42) {
      goto LABEL_30;
    }
    long long v43 = [(id)objc_opt_class() _retargetableBannerTransitionAnimatorForAnimator:self->_activeBannerTransitionAnimator];
    id v44 = v43;
    if (v43)
    {
      char v45 = 0;
      double v46 = v44;
    }
    else
    {
LABEL_30:
      if (objc_opt_respondsToSelector()) {
        [(BNDefaultBannerTransitioningDelegate *)v68 animationControllerForPresentedController:v25 presentingController:self sourceController:self userInfo:v69];
      }
      else {
      double v46 = [(BNDefaultBannerTransitioningDelegate *)v68 animationControllerForPresentedController:v25 presentingController:self sourceController:self];
      }
      objc_storeStrong((id *)&self->_activeBannerTransitionAnimator, v46);
      id v44 = 0;
      char v45 = 1;
    }
    v64 = v44;
    v67 = [v39 transitionCoordinator];
    objc_initWeak(&location, self);
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __67__BNContentViewController_presentPresentable_withOptions_userInfo___block_invoke_2;
    v80[3] = &unk_1E63B9CD0;
    objc_copyWeak(&v87, &location);
    id v47 = v8;
    id v81 = v47;
    id v48 = v25;
    id v82 = v48;
    char v88 = v38;
    id v49 = v39;
    id v83 = v49;
    id v61 = v65;
    id v84 = v61;
    id v50 = v69;
    id v85 = v50;
    p_long long buf = &buf;
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __67__BNContentViewController_presentPresentable_withOptions_userInfo___block_invoke_58;
    v74[3] = &unk_1E63B9CF8;
    objc_copyWeak(&v79, &location);
    id v66 = v49;
    id v75 = v66;
    id v63 = v46;
    id v76 = v63;
    id v51 = v47;
    id v77 = v51;
    id v62 = v48;
    id v78 = v62;
    [v67 animateAlongsideTransition:v80 completion:v74];
    id v52 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v52, "presenter:willPresentPresentable:withTransitionCoordinator:userInfo:", self, v51, v67, v50, v61);
    }
    if (v45)
    {
      [v66 performTransitionWithAnimator:v63];
    }
    else
    {
      v53 = (id)BNLogPresenting;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
      {
        v54 = BNEffectivePresentableDescription(v51);
        -[BNContentViewController presentPresentable:withOptions:userInfo:](v54, v95, v53);
      }

      [v64 retargetTransition:v66];
    }
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v55 = *(id *)(*((void *)&buf + 1) + 40);
    uint64_t v56 = [v55 countByEnumeratingWithState:&v70 objects:v94 count:16];
    if (v56)
    {
      uint64_t v57 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v56; ++i)
        {
          if (*(void *)v71 != v57) {
            objc_enumerationMutation(v55);
          }
          uint64_t v59 = *(void *)(*((void *)&v70 + 1) + 8 * i);
          id v60 = objc_loadWeakRetained(&location);
          [v60 _dismissPresentable:v59 withReason:@"BNBannerRevocationReasonReplaceExisting" animated:1 userInfo:v50];
        }
        uint64_t v56 = [v55 countByEnumeratingWithState:&v70 objects:v94 count:16];
      }
      while (v56);
    }

    objc_destroyWeak(&v79);
    objc_destroyWeak(&v87);
    objc_destroyWeak(&location);

    _Block_object_dispose(&buf, 8);
  }
}

uint64_t __67__BNContentViewController_presentPresentable_withOptions_userInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (BNIsPresentableIdentifiedByIdentification(v3, *(void **)(a1 + 32), 1))
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = [v3 requesterIdentifier];
    if ([v5 isEqualToString:*(void *)(a1 + 40)]) {
      uint64_t v4 = [*(id *)(a1 + 48) shouldOverlapPresentable:v3 withPresentable:*(void *)(a1 + 32)];
    }
    else {
      uint64_t v4 = 0;
    }
  }
  return v4;
}

void __67__BNContentViewController_presentPresentable_withOptions_userInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    id v3 = (void *)BNLogPresenting;
    if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void **)(a1 + 32);
      id v5 = v3;
      char v6 = BNEffectivePresentableDescription(v4);
      *(_DWORD *)long long buf = 138543362;
      v64 = v6;
      _os_log_impl(&dword_1BEC04000, v5, OS_LOG_TYPE_DEFAULT, "Presentable will appear as banner: %{public}@", buf, 0xCu);
    }
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 32) presentableWillAppearAsBanner:*(void *)(a1 + 32)];
    }
    [*(id *)(a1 + 40) beginAppearanceTransition:1 animated:*(unsigned __int8 *)(a1 + 88)];
    [*(id *)(a1 + 48) finalFrameForViewController:*(void *)(a1 + 40)];
    objc_msgSend(WeakRetained, "_insetFrame:forViewController:", *(void *)(a1 + 40));
    obuint64_t j = v8;
    double v51 = v7;
    double v47 = v10;
    double v48 = v9;
    uint64_t v11 = 976;
    if ((unint64_t)[WeakRetained[122] tierCount] >= 2)
    {
      double v45 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v46 = *MEMORY[0x1E4F1DB28];
      double v43 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      double v44 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      unint64_t v12 = 1;
      do
      {
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        double v13 = [WeakRetained[122] tierAtIndex:v12];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v57 objects:v62 count:16];
        CGFloat height = v43;
        CGFloat width = v44;
        CGFloat y = v45;
        CGFloat x = v46;
        if (v14)
        {
          uint64_t v19 = v14;
          uint64_t v20 = *(void *)v58;
          CGFloat height = v43;
          CGFloat width = v44;
          CGFloat y = v45;
          CGFloat x = v46;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v58 != v20) {
                objc_enumerationMutation(v13);
              }
              id v22 = UIViewControllerFromPresentable(*(void **)(*((void *)&v57 + 1) + 8 * i));
              id v23 = [v22 view];
              [v23 frame];
              objc_msgSend(WeakRetained, "_insetFrame:forViewController:", v22);
              double v25 = v24;
              double v27 = v26;
              double v29 = v28;
              double v31 = v30;
              v66.origin.CGFloat x = x;
              v66.origin.CGFloat y = y;
              v66.size.CGFloat width = width;
              v66.size.CGFloat height = height;
              v68.origin.CGFloat x = v25;
              v68.origin.CGFloat y = v27;
              v68.size.CGFloat width = v29;
              v68.size.CGFloat height = v31;
              CGRect v67 = CGRectUnion(v66, v68);
              CGFloat x = v67.origin.x;
              CGFloat y = v67.origin.y;
              CGFloat width = v67.size.width;
              CGFloat height = v67.size.height;
              objc_msgSend(WeakRetained, "_presentedFrameForViewController:withContentFrame:afterContentWithFrame:", v22, v25, v27, v29, v31, v51, obj, v48, v47);
              objc_msgSend(v23, "setFrame:");
            }
            uint64_t v19 = [v13 countByEnumeratingWithState:&v57 objects:v62 count:16];
          }
          while (v19);
        }

        ++v12;
        obuint64_t j = y;
        double v51 = x;
        double v47 = height;
        double v48 = width;
      }
      while (v12 < [WeakRetained[122] tierCount]);
    }
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v32 = a1;
    id obja = *(id *)(a1 + 56);
    uint64_t v33 = [obja countByEnumeratingWithState:&v53 objects:v61 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v52 = *(void *)v54;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v54 != v52) {
            objc_enumerationMutation(obja);
          }
          uint64_t v36 = *(void *)(*((void *)&v53 + 1) + 8 * j);
          id v37 = [*(id *)((char *)WeakRetained + v11) indexPathForObject:v36];
          uint64_t v38 = [v37 tier];
          uint64_t v39 = v11;
          [*(id *)((char *)WeakRetained + v11) indexPathForObject:*(void *)(v32 + 32)];
          long long v41 = v40 = v32;
          uint64_t v42 = [v41 tier];

          if (v38 == v42) {
            [*(id *)(*(void *)(*(void *)(v40 + 72) + 8) + 40) addObject:v36];
          }
          else {
            [WeakRetained _dismissPresentable:v36 withReason:@"BNBannerRevocationReasonReplaceExisting" animated:1 userInfo:*(void *)(v40 + 64)];
          }
          uint64_t v32 = v40;
          uint64_t v11 = v39;
        }
        uint64_t v34 = [obja countByEnumeratingWithState:&v53 objects:v61 count:16];
      }
      while (v34);
    }

    [WeakRetained _postLayoutChangeForVisibleNotifications];
  }
}

void __67__BNContentViewController_presentPresentable_withOptions_userInfo___block_invoke_58(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained _resetActiveBannerTransitionContextIfComplete:*(void *)(a1 + 32)])objc_msgSend(v3, "_resetActiveBannerTransitionAnimator:", *(void *)(a1 + 40)); {
    uint64_t v4 = (id *)(a1 + 48);
    }
    if ([v3[124] containsObject:*(void *)(a1 + 48)])
    {
      id v5 = (void *)BNLogPresenting;
      if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEBUG)) {
        __67__BNContentViewController_presentPresentable_withOptions_userInfo___block_invoke_58_cold_1((uint64_t)v4, v5);
      }
    }
    else
    {
      [*(id *)(a1 + 56) endAppearanceTransition];
      char v6 = (void *)BNLogPresenting;
      if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = *v4;
        double v8 = v6;
        double v9 = BNEffectivePresentableDescription(v7);
        int v10 = 138543362;
        uint64_t v11 = v9;
        _os_log_impl(&dword_1BEC04000, v8, OS_LOG_TYPE_DEFAULT, "Presentable did appear as banner: %{public}@", (uint8_t *)&v10, 0xCu);
      }
      if (objc_opt_respondsToSelector()) {
        [*v4 presentableDidAppearAsBanner:*v4];
      }
    }
    [v3[123] removeObject:*v4];
  }
}

- (id)dismissPresentablesWithIdentification:(id)a3 reason:(id)a4 userInfo:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)BNLogPresenting;
  if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    double v13 = BNPresentableIdentificationDescription(v8);
    int v16 = 138543618;
    double v17 = v13;
    __int16 v18 = 2114;
    id v19 = v9;
    _os_log_impl(&dword_1BEC04000, v12, OS_LOG_TYPE_DEFAULT, "Asked to dismiss presentables with identification %{public}@ with reason '%{public}@'", (uint8_t *)&v16, 0x16u);
  }
  uint64_t v14 = [(BNContentViewController *)self _dismissPresentablesWithIdentification:v8 reason:v9 animated:[(BNContentViewController *)self bs_isAppearingOrAppeared] userInfo:v10];

  return v14;
}

- (id)dismissPresentablesWithIdentification:(id)a3 reason:(id)a4 animated:(BOOL)a5 userInfo:(id)a6
{
  BOOL v7 = a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  double v13 = (void *)BNLogPresenting;
  if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = v13;
    double v15 = BNPresentableIdentificationDescription(v10);
    int v16 = NSStringFromBOOL();
    int v25 = 138543874;
    double v26 = v15;
    __int16 v27 = 2114;
    id v28 = v11;
    __int16 v29 = 2114;
    double v30 = v16;
    _os_log_impl(&dword_1BEC04000, v14, OS_LOG_TYPE_DEFAULT, "Asked to dismiss presentables with identification %{public}@ with reason '%{public}@' (animated=%{public}@)", (uint8_t *)&v25, 0x20u);
  }
  if (!v7) {
    goto LABEL_8;
  }
  if ([(BNContentViewController *)self bs_isAppearingOrAppeared])
  {
    uint64_t v17 = 1;
    goto LABEL_9;
  }
  __int16 v18 = (void *)BNLogPresenting;
  BOOL v19 = os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT);
  uint64_t v17 = 0;
  if (v19)
  {
    uint64_t v20 = v18;
    id v21 = NSStringFromBOOL();
    id v22 = BNPresentableIdentificationDescription(v10);
    int v25 = 138543618;
    double v26 = v21;
    __int16 v27 = 2114;
    id v28 = v22;
    _os_log_impl(&dword_1BEC04000, v20, OS_LOG_TYPE_DEFAULT, "Overriding 'animated=%{public}@' for presentables with identification %{public}@ due to appearance state", (uint8_t *)&v25, 0x16u);

LABEL_8:
    uint64_t v17 = 0;
  }
LABEL_9:
  id v23 = [(BNContentViewController *)self _dismissPresentablesWithIdentification:v10 reason:v11 animated:v17 userInfo:v12];

  return v23;
}

- (void)morphFromPresentable:(id)a3 toPresentable:(id)a4 withOptions:(unint64_t)a5 userInfo:(id)a6 stateChange:(BOOL)a7
{
  BOOL v7 = a7;
  id v18 = a3;
  id v12 = a4;
  id v13 = a6;
  uint64_t v14 = UIViewControllerFromPresentable(v18);
  if (v18
    && (char v15 = [(NSMutableSet *)self->_dismissingPresentables containsObject:v18], v12)
    && (v15 & 1) == 0
    && ([(NSMutableSet *)self->_presentingPresentables containsObject:v12] & 1) == 0
    && ([(BNContentViewController *)self childViewControllers],
        int v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = [v16 containsObject:v14],
        v16,
        v17))
  {
    [(BNContentViewController *)self _morphFromPresentable:v18 toPresentable:v12 withOptions:a5 userInfo:v13 stateChange:v7];
  }
  else
  {
    [(BNContentViewController *)self presentPresentable:v12 withOptions:a5 userInfo:v13];
  }
}

- (void)_morphFromPresentable:(id)a3 toPresentable:(id)a4 withOptions:(unint64_t)a5 userInfo:(id)a6 stateChange:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v51 = a6;
  id v13 = (void *)BNLogPresenting;
  if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = v13;
    char v15 = BNEffectivePresentableDescription(v11);
    int v16 = BNEffectivePresentableDescription(v12);
    *(_DWORD *)long long buf = 138543618;
    CGRect v67 = v15;
    __int16 v68 = 2114;
    id v69 = v16;
    _os_log_impl(&dword_1BEC04000, v14, OS_LOG_TYPE_DEFAULT, "Asked to morph from presentable: %{public}@ to presentable  %{public}@", buf, 0x16u);
  }
  if (!self->_presentingPresentables)
  {
    int v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    presentingPresentables = self->_presentingPresentables;
    self->_presentingPresentables = v17;
  }
  dismissingPresentables = self->_dismissingPresentables;
  if (!dismissingPresentables)
  {
    uint64_t v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v21 = self->_dismissingPresentables;
    self->_dismissingPresentables = v20;

    dismissingPresentables = self->_dismissingPresentables;
  }
  [(NSMutableSet *)dismissingPresentables addObject:v11];
  [(NSMutableSet *)self->_presentingPresentables removeObject:v11];
  [(NSMutableSet *)self->_presentingPresentables addObject:v12];
  [(NSMutableSet *)self->_dismissingPresentables removeObject:v12];
  id v22 = UIViewControllerFromPresentable(v11);
  id v23 = UIViewControllerFromPresentable(v12);
  double v24 = [v23 transitioningDelegate];
  if (objc_opt_respondsToSelector())
  {
    int v25 = v24;
    goto LABEL_15;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v27 = [WeakRetained defaultTransitioningDelegateForPresenter:self];

    char v28 = objc_opt_respondsToSelector();
    __int16 v29 = (void *)v27;
    if (v28) {
      goto LABEL_14;
    }
  }
  else
  {
    __int16 v29 = v24;
  }
  double v30 = v29;
  uint64_t v31 = objc_alloc_init(BNDefaultBannerTransitioningDelegate);

  __int16 v29 = v31;
LABEL_14:
  uint64_t v32 = v29;
  objc_msgSend(v23, "setTransitioningDelegate:");

  int v25 = v32;
LABEL_15:
  id v49 = v25;
  -[BNContentViewController _addPresentable:withTransitioningDelegate:incrementingTier:addTierToTop:](self, "_addPresentable:withTransitioningDelegate:incrementingTier:addTierToTop:", v12);
  [(BNContentViewController *)self bs_addChildViewController:v23];
  id v33 = [(BNContentViewController *)self _newBannerTransitionContextForMorphFromViewController:v22 toViewController:v23 animated:1];
  objc_storeStrong((id *)&self->_activeBannerTransitionContext, v33);
  uint64_t v34 = [v49 animationControllerMorphFromPresentedController:v22 presentingController:v23 sourceController:self userInfo:v51 stateChange:v7];
  objc_storeStrong((id *)&self->_activeBannerTransitionAnimator, v34);
  id v50 = [v33 transitionCoordinator];
  objc_initWeak((id *)buf, self);
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __96__BNContentViewController__morphFromPresentable_toPresentable_withOptions_userInfo_stateChange___block_invoke;
  v60[3] = &unk_1E63B9CF8;
  id location = &v65;
  objc_copyWeak(&v65, (id *)buf);
  id v35 = v12;
  id v61 = v35;
  id v36 = v11;
  id v62 = v36;
  id v37 = v22;
  id v63 = v37;
  id v38 = v23;
  id v64 = v38;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __96__BNContentViewController__morphFromPresentable_toPresentable_withOptions_userInfo_stateChange___block_invoke_70;
  v52[3] = &unk_1E63B9D20;
  objc_copyWeak(&v59, (id *)buf);
  id v39 = v33;
  id v53 = v39;
  id v40 = v34;
  id v54 = v40;
  id v41 = v35;
  id v55 = v41;
  id v42 = v38;
  id v56 = v42;
  id v43 = v36;
  id v57 = v43;
  id v44 = v37;
  id v58 = v44;
  [v50 animateAlongsideTransition:v60 completion:v52];
  id v45 = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v45, "presenter:willPresentPresentable:withTransitionCoordinator:userInfo:", self, v41, v50, v51, &v65);
  }
  if (objc_opt_respondsToSelector())
  {
    double v46 = [v39 transitionCoordinator];
    [v45 presenter:self willDismissPresentable:v43 withTransitionCoordinator:v46 userInfo:v51];
  }
  objc_msgSend(v39, "performTransitionWithAnimator:", v40, location);

  objc_destroyWeak(&v59);
  objc_destroyWeak(locationa);
  objc_destroyWeak((id *)buf);
}

void __96__BNContentViewController__morphFromPresentable_toPresentable_withOptions_userInfo_stateChange___block_invoke(id *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  if (WeakRetained)
  {
    id v3 = (void *)BNLogPresenting;
    if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = a1[4];
      id v5 = v3;
      char v6 = BNEffectivePresentableDescription(v4);
      int v11 = 138543362;
      id v12 = v6;
      _os_log_impl(&dword_1BEC04000, v5, OS_LOG_TYPE_DEFAULT, "Presentable will appear as banner: %{public}@", (uint8_t *)&v11, 0xCu);
    }
    if (objc_opt_respondsToSelector()) {
      [a1[4] presentableWillAppearAsBanner:a1[4]];
    }
    BOOL v7 = (void *)BNLogPresenting;
    if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = a1[5];
      id v9 = v7;
      id v10 = BNEffectivePresentableDescription(v8);
      int v11 = 138543362;
      id v12 = v10;
      _os_log_impl(&dword_1BEC04000, v9, OS_LOG_TYPE_DEFAULT, "Presentable will disappear as banner: %{public}@", (uint8_t *)&v11, 0xCu);
    }
    if (objc_opt_respondsToSelector()) {
      [a1[5] presentableWillDisappearAsBanner:a1[5] withReason:@"swap"];
    }
    [a1[6] beginAppearanceTransition:0 animated:1];
    [a1[7] beginAppearanceTransition:1 animated:1];
    [WeakRetained _postLayoutChangeForVisibleNotifications];
  }
}

void __96__BNContentViewController__morphFromPresentable_toPresentable_withOptions_userInfo_stateChange___block_invoke_70(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 80));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained _resetActiveBannerTransitionContextIfComplete:*(void *)(a1 + 32)])objc_msgSend(v3, "_resetActiveBannerTransitionAnimator:", *(void *)(a1 + 40)); {
    id v4 = (id *)(a1 + 48);
    }
    if ([v3[124] containsObject:*(void *)(a1 + 48)])
    {
      id v5 = (void *)BNLogPresenting;
      if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEBUG)) {
        __67__BNContentViewController_presentPresentable_withOptions_userInfo___block_invoke_58_cold_1(a1 + 48, v5);
      }
    }
    else
    {
      [*(id *)(a1 + 56) endAppearanceTransition];
      char v6 = (void *)BNLogPresenting;
      if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = *v4;
        id v8 = v6;
        id v9 = BNEffectivePresentableDescription(v7);
        int v16 = 138543362;
        int v17 = v9;
        _os_log_impl(&dword_1BEC04000, v8, OS_LOG_TYPE_DEFAULT, "Presentable did appear as banner: %{public}@", (uint8_t *)&v16, 0xCu);
      }
      if (objc_opt_respondsToSelector()) {
        [*v4 presentableDidAppearAsBanner:*v4];
      }
    }
    [v3[123] removeObject:*(void *)(a1 + 48)];
    id v10 = (id *)(a1 + 64);
    if ([v3[123] containsObject:*(void *)(a1 + 64)])
    {
      int v11 = (void *)BNLogPresenting;
      if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEBUG)) {
        __96__BNContentViewController__morphFromPresentable_toPresentable_withOptions_userInfo_stateChange___block_invoke_70_cold_1((uint64_t)v10, v11);
      }
    }
    else
    {
      [*(id *)(a1 + 72) endAppearanceTransition];
      id v12 = (void *)BNLogPresenting;
      if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = *v10;
        uint64_t v14 = v12;
        char v15 = BNEffectivePresentableDescription(v13);
        int v16 = 138543362;
        int v17 = v15;
        _os_log_impl(&dword_1BEC04000, v14, OS_LOG_TYPE_DEFAULT, "Presentable did disappear as banner: %{public}@", (uint8_t *)&v16, 0xCu);
      }
      if (objc_opt_respondsToSelector()) {
        [*v10 presentableDidDisappearAsBanner:*v10 withReason:@"BNBannerRevocationReasonMorph"];
      }
      objc_msgSend(v3, "bs_removeChildViewController:", *(void *)(a1 + 72));
      [v3 _removePresentable:*(void *)(a1 + 64)];
      [v3 _resetPresentableForActiveGesture:*(void *)(a1 + 64)];
    }
    [v3[124] removeObject:*v10];
  }
}

- (void)preferredMinimumTopInsetDidInvalidate
{
  id v3 = [(BNContentViewController *)self _topPresentable];
  UIViewControllerFromPresentable(v3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    id v4 = [(BNContentViewController *)self transitionCoordinator];
    if ([v4 isAnimated])
    {
    }
    else
    {
      id v5 = [(BNContentViewController *)self view];
      char v6 = [v5 window];
      char v7 = objc_msgSend(v6, "_bn_isRotating");

      if ((v7 & 1) == 0) {
        [(BNContentViewController *)self _updateFrameForChildContentContainer:v8 minimumTopInsetUpdate:1];
      }
    }
  }
}

- (id)sizeTransitionAnimationSettingsForPresentable:(id)a3
{
  id v3 = a3;
  id v4 = UIViewControllerFromPresentable(v3);
  id v5 = [v4 transitioningDelegate];

  if (objc_opt_respondsToSelector())
  {
    char v6 = [v5 sizeTransitionAnimationSettingsForPresentable:v3];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)userInterfaceStyleTransitionAnimationSettingsForPresentable:(id)a3 forTransitionToStyle:(int64_t)a4
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v8 = [WeakRetained userInterfaceStyleTransitionAnimationSettingsForPresentable:v6 forTransitionToStyle:a4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)shouldFenceAnimationsForPresentable:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v6 = [WeakRetained shouldFenceAnimationsForPresentable:v4];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = [(BNContentViewController *)self _presentableForTouch:a4];
  if (v5)
  {
    objc_storeStrong((id *)&self->_presentableForActiveGesture, v5);
    char v6 = [(BNContentViewController *)self view];
    char v7 = UIViewControllerFromPresentable(self->_presentableForActiveGesture);
    id v8 = [v7 view];
    [v6 bringSubviewToFront:v8];

    id v9 = (void *)BNLogPresenting;
    if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
    {
      presentableForActiveGesture = self->_presentableForActiveGesture;
      int v11 = v9;
      id v12 = BNEffectivePresentableDescription(presentableForActiveGesture);
      *(_DWORD *)long long buf = 138543362;
      char v28 = v12;
      _os_log_impl(&dword_1BEC04000, v11, OS_LOG_TYPE_DEFAULT, "Updated presentable for active gesture: %{public}@ ", buf, 0xCu);
    }
  }
  id v13 = self->_presentableForActiveGesture;
  if (!v13)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v14 = [(BNContentViewController *)self topPresentables];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          if ([(BNContentViewController *)self _isTouchOutsideDismissalEnabledForPresentable:v19])
          {
            [(BNContentViewController *)self _dismissPresentable:v19 withReason:@"BNBannerRevocationReasonTouchOutsideDismissal" animated:1 userInfo:0];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v16);
    }

    id v13 = self->_presentableForActiveGesture;
  }
  BOOL v20 = v13 != 0;

  return v20;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([v5 type] == 10)
  {
    char v6 = [(BNContentViewController *)self _presentableForScrollEvent:v5];
    if (v6)
    {
      p_presentableForActiveGesture = (void **)&self->_presentableForActiveGesture;
      objc_storeStrong((id *)&self->_presentableForActiveGesture, v6);
      id v8 = [(BNContentViewController *)self view];
      id v9 = UIViewControllerFromPresentable(*p_presentableForActiveGesture);
      id v10 = [v9 view];
      [v8 bringSubviewToFront:v10];

      int v11 = (void *)BNLogPresenting;
      if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = *p_presentableForActiveGesture;
        id v13 = v11;
        uint64_t v14 = BNEffectivePresentableDescription(v12);
        int v16 = 138543362;
        uint64_t v17 = v14;
        _os_log_impl(&dword_1BEC04000, v13, OS_LOG_TYPE_DEFAULT, "Updated presentable on scroll event for active gesture: %{public}@ ", (uint8_t *)&v16, 0xCu);
      }
    }
  }
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  presentableForActiveGesture = self->_presentableForActiveGesture;
  if (presentableForActiveGesture) {
    char v6 = [(NSMutableSet *)self->_dismissingPresentables containsObject:self->_presentableForActiveGesture];
  }
  else {
    char v6 = 0;
  }
  if (presentableForActiveGesture) {
    char v7 = v6 ^ 1;
  }
  else {
    char v7 = 0;
  }
  id v8 = (void *)BNLogPresenting;
  if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = NSStringFromBOOL();
    int v11 = NSStringFromBOOL();
    id v12 = NSStringFromBOOL();
    int v14 = 138543874;
    uint64_t v15 = v10;
    __int16 v16 = 2114;
    uint64_t v17 = v11;
    __int16 v18 = 2114;
    uint64_t v19 = v12;
    _os_log_impl(&dword_1BEC04000, v9, OS_LOG_TYPE_DEFAULT, "Banner gesture should begin: %{public}@ (presentableForActiveGestureExists=%{public}@, presentableForActiveGestureIsDismissing=%{public}@", (uint8_t *)&v14, 0x20u);
  }
  return v7;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  if ([(BNContentViewController *)self _isLocalDraggingEnabledForPresentable:self->_presentableForActiveGesture])
  {
    presentableForActiveGesture = self->_presentableForActiveGesture;
    [(BNContentViewController *)self _resetPresentableForActiveGesture:presentableForActiveGesture];
  }
}

- (CGPoint)gestureRecognizerProxy:(id)a3 locationForTouch:(id)a4 inCoordinateSpace:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(BNContentViewController *)self view];
  [(BNContentViewController *)self _locationOfTouch:v8 inContainerViewForGesture:self->_panGesture];
  double v11 = v10;
  double v13 = v12;

  objc_msgSend(v9, "convertPoint:toCoordinateSpace:", v7, v11, v13);
  double v15 = v14;
  double v17 = v16;

  double v18 = v15;
  double v19 = v17;
  result.CGFloat y = v19;
  result.CGFloat x = v18;
  return result;
}

- (CGPoint)gestureRecognizerProxy:(id)a3 velocityInCoordinateSpace:(id)a4
{
  id v5 = a4;
  char v6 = [(BNContentViewController *)self view];
  [(BNContentViewController *)self _velocityInContainerViewForGesture:self->_panGesture];
  objc_msgSend(v6, "convertPoint:toCoordinateSpace:", v5);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.CGFloat y = v12;
  result.CGFloat x = v11;
  return result;
}

- (CGPoint)gestureRecognizerProxy:(id)a3 translationInCoordinateSpace:(id)a4
{
  id v5 = a4;
  char v6 = [(BNContentViewController *)self view];
  [(BNContentViewController *)self _translationInContainerViewForGesture:self->_panGesture];
  objc_msgSend(v6, "convertPoint:toCoordinateSpace:", v5);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.CGFloat y = v12;
  result.CGFloat x = v11;
  return result;
}

- (CGPoint)gestureRecognizerProxy:(id)a3 visualTranslationInCoordinateSpace:(id)a4
{
  id v5 = a4;
  char v6 = [(BNContentViewController *)self view];
  [(BNContentViewController *)self _translationInContainerViewForGesture:self->_panGesture];
  _RubberBandedTranslationInContainerView(v6);
  objc_msgSend(v6, "convertPoint:toCoordinateSpace:", v5);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.CGFloat y = v12;
  result.CGFloat x = v11;
  return result;
}

+ (id)_retargetableBannerTransitionAnimatorForAnimator:(id)a3
{
  id v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v3 isRetargetable])
  {
    if (objc_opt_respondsToSelector()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)_layoutManager
{
  layoutManager = self->_layoutManager;
  if (!layoutManager)
  {
    id v4 = objc_alloc_init(BNBannerLayoutManager);
    id v5 = self->_layoutManager;
    self->_layoutManager = (BNLayoutManaging *)v4;

    layoutManager = self->_layoutManager;
  }
  return layoutManager;
}

- (BOOL)shouldOverlapPresentable:(id)a3 withPresentable:(id)a4
{
  authoritCGFloat y = self->_authority;
  return !authority
      || [(BNConsidering *)authority shouldOverlapPresentable:a3 withPresentable:a4] == 1;
}

- (BOOL)shouldNewTierBeAddedToTopForPresentable:(id)a3 withPresentable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (objc_opt_respondsToSelector() & 1) == 0
    || [(BNConsidering *)self->_authority shouldNewTierBeAddedToTopForPresentable:v6 withPresentable:v7] == 1;

  return v8;
}

- (BOOL)_isPresentableNotice:(id)a3
{
  id v3 = a3;
  BOOL v4 = (objc_opt_respondsToSelector() & 1) != 0 && [v3 presentableBehavior] == 1;

  return v4;
}

- (CGRect)_insetFrame:(CGRect)a3 forViewController:(id)a4
{
  [a4 bannerContentOutsets];
  UIRectInset();
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (CGRect)_outsetFrame:(CGRect)a3 forViewController:(id)a4
{
  [a4 bannerContentOutsets];
  UIRectInset();
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (CGRect)_presentedFrame:(BOOL)a3 forViewController:(id)a4 withContainerBounds:(CGRect)a5 overshoot:(BOOL)a6 targetTransform:(CGAffineTransform *)a7
{
  BOOL v8 = a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  BOOL v13 = a3;
  id v15 = a4;
  double v16 = [(BNContentViewController *)self view];
  double v17 = [v16 window];

  long long v18 = *(_OWORD *)&a7->c;
  *(_OWORD *)&v96.a = *(_OWORD *)&a7->a;
  *(_OWORD *)&v96.c = v18;
  *(_OWORD *)&v96.tdouble x = *(_OWORD *)&a7->tx;
  if (CGAffineTransformIsIdentity(&v96)) {
    uint64_t v19 = [v17 interfaceOrientation];
  }
  else {
    uint64_t v19 = [v17 _toWindowOrientation];
  }
  uint64_t v20 = v19;
  id v21 = [(BNContentViewController *)self _layoutManager];
  long long v22 = [v17 screen];
  objc_msgSend(v21, "useableContainerFrameInContainerBounds:onScreen:interfaceOrientation:", v22, v20, x, y, width, height);
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  CGFloat v30 = v29;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  CGFloat v93 = width;
  if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v15 preferredContentSize];
    double v90 = height;
    double v33 = v32;
    v97.origin.double x = v24;
    v97.origin.double y = v26;
    v97.size.double width = v28;
    v97.size.double height = v30;
    double v34 = v30;
    double v35 = x;
    double v36 = y;
    CGFloat v37 = CGRectGetHeight(v97) - v33;
    [WeakRetained presenterMinimumPreferredTopEdgeInset:self];
    double v39 = v38;
    v98.origin.double x = v24;
    v98.origin.double y = v26;
    v98.size.double width = v28;
    v98.size.double height = v34;
    CGFloat MinY = CGRectGetMinY(v98);
    double v41 = fmax(v37 - MinY, 0.0);
    double v42 = v39 - MinY;
    double v43 = v90;
    double v44 = v93;
    double v45 = fmax(v42, 0.0);
    if (v45 >= v41) {
      double v45 = v41;
    }
    double v94 = v24 + 0.0;
    double v95 = v26 + v45;
    double v46 = v34 - v45;
  }
  else
  {
    double v47 = y;
    double v44 = width;
    double v43 = height;
    double v46 = v30;
    double v35 = x;
    double v36 = v47;
    double v94 = v24;
    double v95 = v26;
  }
  double v48 = [v17 traitCollection];
  [v48 displayScale];
  uint64_t v50 = v49;

  double v92 = v35;
  objc_msgSend(v21, "presentedFrameForContentWithPreferredSize:inUseableContainerFrame:containerBounds:scale:", v28, v46, v94, v95, v28, v46, *(void *)&v35, *(void *)&v36, *(void *)&v44, *(void *)&v43, v50);
  objc_msgSend(v15, "preferredContentSizeWithPresentationSize:containerSize:", v51, v52, v44, v43);
  double v55 = v43;
  double v56 = v53;
  double v57 = v54;
  if (v13)
  {
    double v58 = v55;
    double v91 = v55;
    id v59 = [(BNContentViewController *)self layoutManager];
    objc_msgSend(v59, "presentedFrameForContentWithPreferredSize:inUseableContainerFrame:containerBounds:scale:", v56, v57, v94, v95, v28, v46, *(void *)&v92, *(void *)&v36, *(void *)&v44, *(void *)&v58, v50);
    double v60 = v92;
    double v62 = v61;
    double v64 = v63;
    double v66 = v65;
    double v68 = v67;
    CGFloat v69 = v91;
  }
  else
  {
    double v88 = v53;
    double v89 = v54;
    CGFloat v69 = v55;
    id v59 = [(BNContentViewController *)self _layoutManager];
    objc_msgSend(v59, "dismissedFrameForContentWithPreferredSize:inUseableContainerFrame:containerBounds:overshoot:scale:", v8, v88, v89, v94, v95, v28, v46, *(void *)&v92, *(void *)&v36, *(void *)&v44, *(void *)&v69, v50);
    double v60 = v92;
    double v62 = v70;
    double v64 = v71;
    double v66 = v72;
    double v68 = v73;
  }
  CGFloat v74 = v36;
  CGFloat v75 = v60;

  v99.origin.double x = v62;
  v99.origin.double y = v64;
  v99.size.double width = v66;
  v99.size.double height = v68;
  v101.origin.double x = v75;
  v101.origin.double y = v74;
  v101.size.double width = v93;
  v101.size.double height = v69;
  if (!CGRectEqualToRect(v99, v101)) {
    -[BNContentViewController _outsetFrame:forViewController:](self, "_outsetFrame:forViewController:", v15, v62, v64, v66, v68);
  }
  UIRectIntegralWithScale();
  double v77 = v76;
  double v79 = v78;
  double v81 = v80;
  double v83 = v82;

  double v84 = v77;
  double v85 = v79;
  double v86 = v81;
  double v87 = v83;
  result.size.double height = v87;
  result.size.double width = v86;
  result.origin.double y = v85;
  result.origin.double x = v84;
  return result;
}

- (CGRect)_dismissedFrameForViewController:(id)a3 withContainerBounds:(CGRect)a4
{
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v9[0] = *MEMORY[0x1E4F1DAB8];
  v9[1] = v4;
  v9[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  -[BNContentViewController _presentedFrame:forViewController:withContainerBounds:overshoot:targetTransform:](self, "_presentedFrame:forViewController:withContainerBounds:overshoot:targetTransform:", 0, a3, 0, v9, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (CGRect)_dismissedFrameWithPaddingForViewController:(id)a3 withContainerBounds:(CGRect)a4 targetTransform:(CGAffineTransform *)a5
{
  long long v5 = *(_OWORD *)&a5->c;
  v10[0] = *(_OWORD *)&a5->a;
  v10[1] = v5;
  v10[2] = *(_OWORD *)&a5->tx;
  -[BNContentViewController _presentedFrame:forViewController:withContainerBounds:overshoot:targetTransform:](self, "_presentedFrame:forViewController:withContainerBounds:overshoot:targetTransform:", 0, a3, 1, v10, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (CGRect)_dismissedFrameWithPaddingForViewController:(id)a3 withContainerBounds:(CGRect)a4
{
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v9[0] = *MEMORY[0x1E4F1DAB8];
  v9[1] = v4;
  v9[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  -[BNContentViewController _dismissedFrameWithPaddingForViewController:withContainerBounds:targetTransform:](self, "_dismissedFrameWithPaddingForViewController:withContainerBounds:targetTransform:", a3, v9, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (CGRect)_presentedFrameForViewController:(id)a3 withContainerBounds:(CGRect)a4 targetTransform:(CGAffineTransform *)a5
{
  long long v5 = *(_OWORD *)&a5->c;
  v10[0] = *(_OWORD *)&a5->a;
  v10[1] = v5;
  v10[2] = *(_OWORD *)&a5->tx;
  -[BNContentViewController _presentedFrame:forViewController:withContainerBounds:overshoot:targetTransform:](self, "_presentedFrame:forViewController:withContainerBounds:overshoot:targetTransform:", 1, a3, 0, v10, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (CGRect)_presentedFrameForViewController:(id)a3 withContainerBounds:(CGRect)a4
{
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v9[0] = *MEMORY[0x1E4F1DAB8];
  v9[1] = v4;
  v9[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  -[BNContentViewController _presentedFrameForViewController:withContainerBounds:targetTransform:](self, "_presentedFrameForViewController:withContainerBounds:targetTransform:", a3, v9, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (int64_t)_effectTierForPresentable:(id)a3
{
  long long v4 = [(BNTieredArray *)self->_presentables indexPathForObject:a3];
  int64_t v5 = [v4 tier];

  if ((unint64_t)(v5 - 1) <= 0x7FFFFFFFFFFFFFFDLL)
  {
    unint64_t v6 = v5 + 1;
    do
    {
      double v7 = (void *)MEMORY[0x1E4F1CAD0];
      double v8 = [(BNTieredArray *)self->_presentables tierAtIndex:v6 - 2];
      double v9 = [v7 setWithArray:v8];
      int v10 = [v9 isSubsetOfSet:self->_dismissingPresentables];

      if (v10) {
        int64_t v5 = v6 - 2;
      }
      --v6;
    }
    while (v6 > 1);
  }
  return v5;
}

- (CGRect)_presentedFrameForPresentable:(id)a3 withContainerBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  int v10 = UIViewControllerFromPresentable(v9);
  double v70 = width;
  double v71 = height;
  -[BNContentViewController _presentedFrameForViewController:withContainerBounds:](self, "_presentedFrameForViewController:withContainerBounds:", v10, x, y, width, height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  uint64_t v19 = [(BNContentViewController *)self view];
  [v19 bounds];
  double v21 = v20;
  double v23 = v22;

  if (v21 != v16 || v23 != v18)
  {
    uint64_t v25 = [(BNContentViewController *)self _effectTierForPresentable:v9];
    uint64_t v26 = v25 - 1;
    if (v25 >= 1)
    {
      -[BNContentViewController _insetFrame:forViewController:](self, "_insetFrame:forViewController:", v10, v12, v14, v16, v18);
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      double v35 = [(BNTieredArray *)self->_presentables topObjectInTier:v26];
      -[BNContentViewController _presentedFrameForPresentable:withContainerBounds:](self, "_presentedFrameForPresentable:withContainerBounds:", v35, x, y, v70, v71);
      double v37 = v36;
      double v39 = v38;
      double v41 = v40;
      double v43 = v42;
      double v44 = UIViewControllerFromPresentable(v35);
      -[BNContentViewController _insetFrame:forViewController:](self, "_insetFrame:forViewController:", v44, v37, v39, v41, v43);
      double v46 = v45;
      double v48 = v47;
      double v50 = v49;
      double v52 = v51;

      double v53 = [(BNContentViewController *)self layoutManager];
      objc_msgSend(v53, "presentedFrameForContentWithFrame:afterContentWithFrame:", v28, v30, v32, v34, v46, v48, v50, v52);
      double v55 = v54;
      double v57 = v56;
      double v59 = v58;
      double v61 = v60;

      -[BNContentViewController _outsetFrame:forViewController:](self, "_outsetFrame:forViewController:", v10, v55, v57, v59, v61);
      double v12 = v62;
      double v14 = v63;
      double v16 = v64;
      double v18 = v65;
    }
  }

  double v66 = v12;
  double v67 = v14;
  double v68 = v16;
  double v69 = v18;
  result.size.double height = v69;
  result.size.double width = v68;
  result.origin.double y = v67;
  result.origin.double x = v66;
  return result;
}

- (CGRect)_presentedFrameForViewController:(id)a3 withContentFrame:(CGRect)a4 afterContentWithFrame:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v9 = a4.size.height;
  double v10 = a4.size.width;
  double v11 = a4.origin.y;
  double v12 = a4.origin.x;
  id v14 = a3;
  double v15 = [(BNContentViewController *)self _layoutManager];
  objc_msgSend(v15, "presentedFrameForContentWithFrame:afterContentWithFrame:", v12, v11, v10, v9, x, y, width, height);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  -[BNContentViewController _outsetFrame:forViewController:](self, "_outsetFrame:forViewController:", v14, v17, v19, v21, v23);
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  double v32 = v25;
  double v33 = v27;
  double v34 = v29;
  double v35 = v31;
  result.size.double height = v35;
  result.size.double width = v34;
  result.origin.double y = v33;
  result.origin.double x = v32;
  return result;
}

- (id)_newBannerTransitionContextForPresenting:(BOOL)a3 viewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v8 = a4;
  double v9 = v8;
  if (v6) {
    id v10 = 0;
  }
  else {
    id v10 = v8;
  }
  if (v6) {
    id v11 = v8;
  }
  else {
    id v11 = 0;
  }
  double v12 = [(BNContentViewController *)self view];
  double v13 = +[BNTransitionContext transitionContextForTransitionFromViewController:v10 toViewController:v11 inContainerView:v12];

  [v13 setAnimated:v5];
  id v14 = [(BNContentViewController *)self view];
  [v14 bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  if (v6)
  {
    -[BNContentViewController _dismissedFrameForViewController:withContainerBounds:](self, "_dismissedFrameForViewController:withContainerBounds:", v9, v16, v18, v20, v22);
    objc_msgSend(v13, "setToStartFrame:");
    -[BNContentViewController _presentedFrameForViewController:withContainerBounds:](self, "_presentedFrameForViewController:withContainerBounds:", v9, v16, v18, v20, v22);
    objc_msgSend(v13, "setToEndFrame:");
  }
  else
  {
    -[BNContentViewController _presentedFrameForViewController:withContainerBounds:](self, "_presentedFrameForViewController:withContainerBounds:", v9, v16, v18, v20, v22);
    objc_msgSend(v13, "setFromStartFrame:");
    -[BNContentViewController _dismissedFrameWithPaddingForViewController:withContainerBounds:](self, "_dismissedFrameWithPaddingForViewController:withContainerBounds:", v9, v16, v18, v20, v22);
    objc_msgSend(v13, "setFromEndFrame:");
  }

  return v13;
}

- (id)_newBannerTransitionContextForMorphFromViewController:(id)a3 toViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(BNContentViewController *)self view];
  id v11 = +[BNTransitionContext transitionContextForTransitionFromViewController:v9 toViewController:v8 inContainerView:v10];

  [v11 setAnimated:v5];
  double v12 = [(BNContentViewController *)self view];
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  -[BNContentViewController _presentedFrameForViewController:withContainerBounds:](self, "_presentedFrameForViewController:withContainerBounds:", v9, v14, v16, v18, v20);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  -[BNContentViewController _presentedFrameForViewController:withContainerBounds:](self, "_presentedFrameForViewController:withContainerBounds:", v8, v14, v16, v18, v20);
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;

  objc_msgSend(v11, "setToStartFrame:", v22, v24, v26, v28);
  objc_msgSend(v11, "setToEndFrame:", v30, v32, v34, v36);
  objc_msgSend(v11, "setFromStartFrame:", v22, v24, v26, v28);
  objc_msgSend(v11, "setFromEndFrame:", v30, v32, v34, v36);
  [v11 setRevocationReason:@"BNBannerRevocationReasonMorph"];
  return v11;
}

- (BOOL)_resetActiveBannerTransitionAnimator:(id)a3
{
  long long v4 = (UIViewControllerAnimatedTransitioning *)a3;
  BOOL v5 = v4;
  activeBannerTransitionAnimator = self->_activeBannerTransitionAnimator;
  if (activeBannerTransitionAnimator == v4)
  {
    self->_activeBannerTransitionAnimator = 0;
  }
  return activeBannerTransitionAnimator == v5;
}

- (BOOL)_resetActiveBannerTransitionContextIfComplete:(id)a3
{
  if (self->_activeBannerTransitionContext == a3)
  {
    int v3 = [a3 isComplete];
    if (v3)
    {
      activeBannerTransitionContext = self->_activeBannerTransitionContext;
      self->_activeBannerTransitionContext = 0;

      LOBYTE(v3) = 1;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)_insertPresentable:(id)a3 beneathPresentable:(id)a4 withTransitioningDelegate:(id)a5 incrementingTier:(BOOL)a6 addTierToTop:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v21 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v21)
  {
    if (!self->_presentables)
    {
      double v14 = objc_alloc_init(BNTieredArray);
      presentables = self->_presentables;
      self->_presentables = v14;
    }
    if (v13)
    {
      transitioningDelegates = self->_transitioningDelegates;
      if (!transitioningDelegates)
      {
        double v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
        double v18 = self->_transitioningDelegates;
        self->_transitioningDelegates = v17;

        transitioningDelegates = self->_transitioningDelegates;
      }
      [(NSMutableSet *)transitioningDelegates addObject:v13];
    }
    if (![(BNTieredArray *)self->_presentables count])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained presenterRequestsVisibility:self];
    }
    double v20 = self->_presentables;
    if (v12) {
      [(BNTieredArray *)v20 insertObject:v21 beneathObject:v12];
    }
    else {
      [(BNTieredArray *)v20 addObject:v21 incrementingTier:v8 addTierToTop:v7];
    }
  }
}

- (void)_addPresentable:(id)a3 withTransitioningDelegate:(id)a4 incrementingTier:(BOOL)a5 addTierToTop:(BOOL)a6
{
}

- (void)_insertPresentable:(id)a3 beneathPresentable:(id)a4 withTransitioningDelegate:(id)a5
{
}

- (void)_removePresentable:(id)a3
{
  if (a3)
  {
    presentables = self->_presentables;
    id v5 = a3;
    [(BNTieredArray *)presentables removeObject:v5];
    BOOL v6 = UIViewControllerFromPresentable(v5);

    id v8 = [v6 transitioningDelegate];

    if (v8) {
      [(NSMutableSet *)self->_transitioningDelegates removeObject:v8];
    }
    if (![(BNTieredArray *)self->_presentables count])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained presenterRelinquishesVisibility:self];
    }
  }
}

- (void)_dismissPresentable:(id)a3 withReason:(id)a4 animated:(BOOL)a5 userInfo:(id)a6
{
  BOOL v7 = a5;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v10 && ([(NSMutableSet *)self->_dismissingPresentables containsObject:v10] & 1) == 0)
  {
    double v49 = UIViewControllerFromPresentable(v10);
    id v13 = [(BNContentViewController *)self childViewControllers];
    int v14 = [v13 containsObject:v49];

    if (v14)
    {
      double v15 = (void *)BNLogPresenting;
      if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
      {
        double v16 = v15;
        double v17 = BNEffectivePresentableDescription(v10);
        double v18 = @"without";
        *(_DWORD *)long long buf = 138543874;
        double v66 = v17;
        __int16 v67 = 2114;
        if (v7) {
          double v18 = @"with";
        }
        id v68 = v11;
        __int16 v69 = 2114;
        double v70 = v18;
        _os_log_impl(&dword_1BEC04000, v16, OS_LOG_TYPE_DEFAULT, "Dismissing presentable %{public}@ with reason '%{public}@' %{public}@ animation ", buf, 0x20u);
      }
      dismissingPresentables = self->_dismissingPresentables;
      if (!dismissingPresentables)
      {
        double v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
        id v21 = self->_dismissingPresentables;
        self->_dismissingPresentables = v20;

        dismissingPresentables = self->_dismissingPresentables;
      }
      [(NSMutableSet *)dismissingPresentables addObject:v10];
      [(NSMutableSet *)self->_presentingPresentables removeObject:v10];
      double v22 = [(BNContentViewController *)self _presentablesWithIdentification:v10 requiringUniqueMatch:1];
      BOOL v23 = [v22 count] == 0;

      id v24 = [(BNContentViewController *)self _newBannerTransitionContextForPresenting:0 viewController:v49 animated:v7];
      objc_storeStrong((id *)&self->_activeBannerTransitionContext, v24);
      [v24 setRevocationReason:v11];
      if (v23) {
        goto LABEL_14;
      }
      double v25 = UIViewControllerFromPresentable(v10);
      double v26 = [(BNTransitionContext *)self->_activeBannerTransitionContext viewControllerForKey:*MEMORY[0x1E4F43EC0]];
      int v27 = BSEqualObjects();

      if (!v27) {
        goto LABEL_14;
      }
      double v28 = [(id)objc_opt_class() _retargetableBannerTransitionAnimatorForAnimator:self->_activeBannerTransitionAnimator];
      id v29 = v28;
      if (v28)
      {
        char v45 = 0;
        double v46 = v29;
        obuint64_t j = v29;
      }
      else
      {
LABEL_14:
        double v30 = [v49 transitioningDelegate];
        if (objc_opt_respondsToSelector())
        {
          if ([v11 isEqualToString:@"BNBannerRevocationReasonReplaceExisting"])
          {
            if (v12) {
              id v31 = (id)[v12 mutableCopy];
            }
            else {
              id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            }
            id v32 = v31;
            [v31 setObject:&unk_1F19C7450 forKey:@"BNBannerTransitionAnimationStyle"];
          }
          else
          {
            id v32 = v12;
          }
          obuint64_t j = [v30 animationControllerForDismissedController:v49 userInfo:v32];
          objc_storeStrong((id *)&self->_activeBannerTransitionAnimator, obj);
        }
        else
        {
          obuint64_t j = [v30 animationControllerForDismissedController:v49];
          id v32 = v12;
          objc_storeStrong((id *)&self->_activeBannerTransitionAnimator, obj);
        }

        double v46 = 0;
        char v45 = 1;
        id v12 = v32;
      }
      double v48 = [v24 transitionCoordinator];
      objc_initWeak(&location, self);
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __76__BNContentViewController__dismissPresentable_withReason_animated_userInfo___block_invoke;
      v57[3] = &unk_1E63B9D48;
      id v33 = v10;
      id v58 = v33;
      id v34 = v11;
      id v59 = v34;
      id v35 = v49;
      id v60 = v35;
      BOOL v63 = v7;
      double v43 = &v62;
      objc_copyWeak(&v62, &location);
      double v61 = self;
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __76__BNContentViewController__dismissPresentable_withReason_animated_userInfo___block_invoke_104;
      v50[3] = &unk_1E63B9D70;
      double v44 = &v56;
      objc_copyWeak(&v56, &location);
      id v36 = v24;
      id v51 = v36;
      id v37 = obj;
      id v52 = v37;
      id v38 = v33;
      id v53 = v38;
      id v54 = v35;
      id v55 = v34;
      [v48 animateAlongsideTransition:v57 completion:v50];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector())
      {
        double v40 = objc_msgSend(v36, "transitionCoordinator", &v62, &v56);
        [WeakRetained presenter:self willDismissPresentable:v38 withTransitionCoordinator:v40 userInfo:v12];
      }
      if (v45)
      {
        [v36 performTransitionWithAnimator:v37];
      }
      else
      {
        double v41 = (id)BNLogPresenting;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          double v42 = BNEffectivePresentableDescription(v38);
          -[BNContentViewController _dismissPresentable:withReason:animated:userInfo:](v42, buf, v41);
        }

        [v46 retargetTransition:v36];
      }

      objc_destroyWeak(v44);
      objc_destroyWeak(v43);

      objc_destroyWeak(&location);
    }
  }
}

void __76__BNContentViewController__dismissPresentable_withReason_animated_userInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v45 = a2;
  int v3 = (void *)BNLogPresenting;
  if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
  {
    long long v4 = *(void **)(a1 + 32);
    id v5 = v3;
    BOOL v6 = BNEffectivePresentableDescription(v4);
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = v6;
    _os_log_impl(&dword_1BEC04000, v5, OS_LOG_TYPE_DEFAULT, "Presentable will disappear as banner: %{public}@", buf, 0xCu);
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(*(id *)(a1 + 32), "presentableWillDisappearAsBanner:withReason:", *(void *)(a1 + 32), *(void *)(a1 + 40), v45);
  }
  objc_msgSend(*(id *)(a1 + 48), "beginAppearanceTransition:animated:", 0, *(unsigned __int8 *)(a1 + 72), v45);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  id v8 = [WeakRetained[122] indexPathForObject:*(void *)(a1 + 32)];
  unint64_t v9 = [v8 tier];

  id v10 = [*(id *)(a1 + 56) view];
  [v10 bounds];
  double v53 = v12;
  double v54 = v11;
  double v51 = v14;
  double v52 = v13;

  if (v9 < [WeakRetained[122] tierCount])
  {
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v49 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v50 = *MEMORY[0x1E4F1DB28];
    CGFloat x = *MEMORY[0x1E4F1DB28];
    CGFloat y = v49;
    double v47 = height;
    double v48 = width;
    for (unint64_t i = v9; i < [WeakRetained[122] tierCount]; ++i)
    {
      CGFloat v55 = height;
      CGFloat v56 = width;
      CGFloat v57 = y;
      CGFloat v58 = x;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      double v20 = [WeakRetained[122] tierAtIndex:i];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v61 objects:v68 count:16];
      CGFloat height = v47;
      CGFloat width = v48;
      CGFloat y = v49;
      CGFloat x = v50;
      if (!v21) {
        goto LABEL_23;
      }
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v62;
      CGFloat height = v47;
      CGFloat width = v48;
      CGFloat y = v49;
      CGFloat x = v50;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v62 != v23) {
            objc_enumerationMutation(v20);
          }
          double v25 = *(void **)(*((void *)&v61 + 1) + 8 * j);
          if (v25 != *(void **)(a1 + 32))
          {
            double v26 = UIViewControllerFromPresentable(v25);
            if (objc_msgSend(v26, "bs_isAppearingOrAppeared"))
            {
              CGFloat v59 = width;
              CGFloat v60 = height;
              int v27 = [v26 view];
              [v27 frame];
              double v29 = v28;
              double v31 = v30;
              double v33 = v32;
              double v35 = v34;
              v70.origin.CGFloat x = v58;
              v70.origin.CGFloat y = v57;
              v70.size.CGFloat width = v56;
              v70.size.CGFloat height = v55;
              if (CGRectIsEmpty(v70))
              {
                if (i != v9)
                {
                  long long v36 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
                  *(_OWORD *)long long buf = *MEMORY[0x1E4F1DAB8];
                  long long v66 = v36;
                  long long v67 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
                  objc_msgSend(WeakRetained, "_presentedFrame:forViewController:withContainerBounds:overshoot:targetTransform:", 1, v26, 0, buf, v54, v53, v52, v51);
                  goto LABEL_18;
                }
              }
              else
              {
                objc_msgSend(WeakRetained, "_insetFrame:forViewController:", v26, v29, v31, v33, v35);
                objc_msgSend(WeakRetained, "_presentedFrameForViewController:withContentFrame:afterContentWithFrame:", v26);
LABEL_18:
                double v29 = v37;
                double v31 = v38;
                double v33 = v39;
                double v35 = v40;
              }
              objc_msgSend(v27, "setFrame:", v29, v31, v33, v35);
              objc_msgSend(WeakRetained, "_insetFrame:forViewController:", v26, v29, v31, v33, v35);
              v73.origin.CGFloat x = v41;
              v73.origin.CGFloat y = v42;
              v73.size.CGFloat width = v43;
              v73.size.CGFloat height = v44;
              v71.origin.CGFloat x = x;
              v71.origin.CGFloat y = y;
              v71.size.CGFloat width = v59;
              v71.size.CGFloat height = v60;
              CGRect v72 = CGRectUnion(v71, v73);
              CGFloat x = v72.origin.x;
              CGFloat y = v72.origin.y;
              CGFloat width = v72.size.width;
              CGFloat height = v72.size.height;
            }
            continue;
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v61 objects:v68 count:16];
      }
      while (v22);
LABEL_23:
    }
  }
  [WeakRetained _postLayoutChangeForVisibleNotifications];
}

void __76__BNContentViewController__dismissPresentable_withReason_animated_userInfo___block_invoke_104(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  int v3 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained _resetActiveBannerTransitionContextIfComplete:*(void *)(a1 + 32)])objc_msgSend(v3, "_resetActiveBannerTransitionAnimator:", *(void *)(a1 + 40)); {
    long long v4 = (void *)(a1 + 48);
    }
    if ([v3[123] containsObject:*(void *)(a1 + 48)])
    {
      id v5 = (void *)BNLogPresenting;
      if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEBUG)) {
        __96__BNContentViewController__morphFromPresentable_toPresentable_withOptions_userInfo_stateChange___block_invoke_70_cold_1((uint64_t)v4, v5);
      }
    }
    else
    {
      [*(id *)(a1 + 56) endAppearanceTransition];
      BOOL v6 = (void *)BNLogPresenting;
      if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v7 = (void *)*v4;
        id v8 = v6;
        unint64_t v9 = BNEffectivePresentableDescription(v7);
        int v11 = 138543362;
        double v12 = v9;
        _os_log_impl(&dword_1BEC04000, v8, OS_LOG_TYPE_DEFAULT, "Presentable did disappear as banner: %{public}@", (uint8_t *)&v11, 0xCu);
      }
      if (objc_opt_respondsToSelector()) {
        [*(id *)(a1 + 48) presentableDidDisappearAsBanner:*(void *)(a1 + 48) withReason:*(void *)(a1 + 64)];
      }
      id v10 = [*(id *)(a1 + 56) view];
      [v10 removeFromSuperview];

      [*(id *)(a1 + 56) willMoveToParentViewController:0];
      [*(id *)(a1 + 56) removeFromParentViewController];
      [v3 _removePresentable:*(void *)(a1 + 48)];
      [v3 _resetPresentableForActiveGesture:*(void *)(a1 + 48)];
    }
    [v3[124] removeObject:*v4];
  }
}

- (id)_presentablesWithIdentification:(id)a3 requiringUniqueMatch:(BOOL)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v7 = self->_presentables;
  uint64_t v8 = [(BNTieredArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (BNIsPresentableIdentifiedByIdentification(v13, v6, a4))
        {
          if (!v10) {
            id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          objc_msgSend(v10, "addObject:", v13, (void)v15);
        }
      }
      uint64_t v9 = [(BNTieredArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_dismissPresentablesWithIdentification:(id)a3 reason:(id)a4 animated:(BOOL)a5 userInfo:(id)a6
{
  BOOL v7 = a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  double v12 = [(BNContentViewController *)self _presentablesWithIdentification:a3 requiringUniqueMatch:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        [(BNContentViewController *)self _dismissPresentable:*(void *)(*((void *)&v18 + 1) + 8 * i) withReason:v10 animated:v7 userInfo:v11];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }

  return v12;
}

- (BOOL)_isDraggingDismissalEnabledForPresentable:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 isDraggingDismissalEnabled];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)_isDraggingInteractionEnabledForPresentable:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 isDraggingInteractionEnabled];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)_isDraggingEnabledForPresentable:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BNContentViewController *)self _isDraggingDismissalEnabledForPresentable:v4]|| [(BNContentViewController *)self _isDraggingInteractionEnabledForPresentable:v4];

  return v5;
}

- (BOOL)_isLocalDraggingEnabledForPresentable:(id)a3
{
  if (self->_presentableForActiveGesture != a3) {
    return 1;
  }
  p_presentedFrameForPresentableForActiveGesture = &self->_presentedFrameForPresentableForActiveGesture;
  BOOL v5 = [(BNContentViewController *)self view];
  [v5 bounds];
  BOOL v3 = p_presentedFrameForPresentableForActiveGesture->size.height != v7
    || p_presentedFrameForPresentableForActiveGesture->size.width != v6;

  return v3;
}

- (BOOL)_isTouchOutsideDismissalEnabledForPresentable:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 isTouchOutsideDismissalEnabled];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (CGPoint)_locationOfTouch:(id)a3 inContainerViewForGesture:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v9 = [(BNContentViewController *)self view];
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained presenter:self gestureRecognizer:v7 locationForTouch:v6 inView:v9];
  }
  else
  {
    if (v6) {
      double v12 = v6;
    }
    else {
      double v12 = v7;
    }
    [v12 locationInView:v9];
  }
  double v13 = v10;
  double v14 = v11;

  double v15 = v13;
  double v16 = v14;
  result.CGFloat y = v16;
  result.CGFloat x = v15;
  return result;
}

- (CGPoint)_locationOfScrollEvent:(id)a3 inContainerViewForGesture:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v9 = [(BNContentViewController *)self view];
  if (objc_opt_respondsToSelector()) {
    [WeakRetained presenter:self gestureRecognizer:v6 locationForEvent:v7 inView:v9];
  }
  else {
    [v7 locationInView:v9];
  }
  double v12 = v10;
  double v13 = v11;

  double v14 = v12;
  double v15 = v13;
  result.CGFloat y = v15;
  result.CGFloat x = v14;
  return result;
}

- (id)_topPresentable
{
  return [(BNTieredArray *)self->_presentables topObject];
}

- (id)_presentableForGestureInView:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v5 = [(BNContentViewController *)self topPresentables];
  id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        double v10 = UIViewControllerFromPresentable(v9);
        double v11 = [v10 view];
        int v12 = [v4 isDescendantOfView:v11];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_presentableForTouch:(id)a3
{
  [(BNContentViewController *)self _locationOfTouch:a3 inContainerViewForGesture:self->_panGesture];
  double v5 = v4;
  double v7 = v6;
  uint64_t v8 = [(BNContentViewController *)self view];
  uint64_t v9 = objc_msgSend(v8, "hitTest:withEvent:", 0, v5, v7);

  double v10 = [(BNContentViewController *)self _presentableForGestureInView:v9];

  return v10;
}

- (id)_presentableForScrollEvent:(id)a3
{
  panGesture = self->_panGesture;
  id v5 = a3;
  [(BNContentViewController *)self _locationOfScrollEvent:v5 inContainerViewForGesture:panGesture];
  double v7 = v6;
  double v9 = v8;
  double v10 = [(BNContentViewController *)self view];
  double v11 = objc_msgSend(v10, "hitTest:withEvent:", v5, v7, v9);

  int v12 = [(BNContentViewController *)self _presentableForGestureInView:v11];

  return v12;
}

- (void)_resetPresentableForActiveGesture:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v4 = (BNPresentable *)a3;
  id v5 = v4;
  presentableForActiveGesture = self->_presentableForActiveGesture;
  if (presentableForActiveGesture) {
    BOOL v7 = presentableForActiveGesture == v4;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    double v8 = (void *)BNLogPresenting;
    if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = v8;
      double v10 = BNEffectivePresentableDescription(v5);
      int v14 = 138543362;
      long long v15 = v10;
      _os_log_impl(&dword_1BEC04000, v9, OS_LOG_TYPE_DEFAULT, "Resetting presentable for active gesture: %{public}@ ", (uint8_t *)&v14, 0xCu);
    }
    [(UIPanGestureRecognizer *)self->_panGesture setEnabled:0];
    [(UIPanGestureRecognizer *)self->_panGesture setEnabled:1];
    double v11 = self->_presentableForActiveGesture;
    self->_presentableForActiveGesture = 0;

    CGSize v12 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    self->_presentedFrameForPresentableForActiveGesture.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    self->_presentedFrameForPresentableForActiveGesture.size = v12;
    panGestureProxyForActivePresentable = self->_panGestureProxyForActivePresentable;
    self->_panGestureProxyForActivePresentable = 0;
  }
}

- (CGPoint)_translationInContainerViewForGesture:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v7 = objc_opt_respondsToSelector();
  double v8 = [(BNContentViewController *)self view];
  if (v7) {
    [WeakRetained presenter:self gestureRecognizer:v5 translationInView:v8];
  }
  else {
    [v5 translationInView:v8];
  }
  double v11 = v9;
  double v12 = v10;

  double v13 = v11;
  double v14 = v12;
  result.CGFloat y = v14;
  result.CGFloat x = v13;
  return result;
}

- (CGPoint)_velocityInContainerViewForGesture:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v7 = objc_opt_respondsToSelector();
  double v8 = [(BNContentViewController *)self view];
  if (v7) {
    [WeakRetained presenter:self gestureRecognizer:v5 velocityInView:v8];
  }
  else {
    [v5 velocityInView:v8];
  }
  double v11 = v9;
  double v12 = v10;

  double v13 = v11;
  double v14 = v12;
  result.CGFloat y = v14;
  result.CGFloat x = v13;
  return result;
}

- (void)_handlePan:(id)a3
{
  id v5 = a3;
  switch([v5 state])
  {
    case 1:
      presentableForActiveGesture = self->_presentableForActiveGesture;
      if (!presentableForActiveGesture)
      {
        CGFloat v44 = [MEMORY[0x1E4F28B00] currentHandler];
        [v44 handleFailureInMethod:a2, self, @"BNContentViewController.m", 1134, @"Pan gesture began, but there's no presentable associated with the gesture." object file lineNumber description];

        presentableForActiveGesture = self->_presentableForActiveGesture;
      }
      char v7 = [(BNContentViewController *)self view];
      [v7 bounds];
      -[BNContentViewController _presentedFrameForPresentable:withContainerBounds:](self, "_presentedFrameForPresentable:withContainerBounds:", presentableForActiveGesture);
      self->_presentedFrameForPresentableForActiveGesture.origin.CGFloat x = v8;
      self->_presentedFrameForPresentableForActiveGesture.origin.double y = v9;
      self->_presentedFrameForPresentableForActiveGesture.size.CGFloat width = v10;
      self->_presentedFrameForPresentableForActiveGesture.size.CGFloat height = v11;

      if (objc_opt_respondsToSelector()) {
        [(BNPresentable *)self->_presentableForActiveGesture userInteractionWillBeginForBannerForPresentable:self->_presentableForActiveGesture];
      }
      if ([(BNContentViewController *)self _isDraggingEnabledForPresentable:self->_presentableForActiveGesture]&& (objc_opt_respondsToSelector() & 1) != 0)
      {
        double v12 = [BNPanGestureLocalProxy alloc];
        panGesture = self->_panGesture;
        double v14 = [(BNContentViewController *)self view];
        long long v15 = [(BNPanGestureLocalProxy *)v12 initWithPanGestureRecognizer:panGesture containerView:v14];
        panGestureProxyForActivePresentable = self->_panGestureProxyForActivePresentable;
        self->_panGestureProxyForActivePresentable = v15;

        [(BNPanGestureProxyPrivate *)self->_panGestureProxyForActivePresentable setDelegate:self];
        [(BNPresentable *)self->_presentableForActiveGesture draggingDidBeginWithGestureProxy:self->_panGestureProxyForActivePresentable];
        [(BNPanGestureProxyPrivate *)self->_panGestureProxyForActivePresentable sendAction];
      }
      break;
    case 2:
      if ([(BNContentViewController *)self _isLocalDraggingEnabledForPresentable:self->_presentableForActiveGesture])
      {
        CGFloat x = self->_presentedFrameForPresentableForActiveGesture.origin.x;
        double y = self->_presentedFrameForPresentableForActiveGesture.origin.y;
        CGPoint size = (CGPoint)self->_presentedFrameForPresentableForActiveGesture.size;
        id v19 = [(BNContentViewController *)self view];
        [(BNContentViewController *)self _translationInContainerViewForGesture:v5];
        double v21 = v20;
        if (v20 < 0.0
          && [(BNContentViewController *)self _isDraggingDismissalEnabledForPresentable:self->_presentableForActiveGesture]|| v21 >= 0.0&& [(BNContentViewController *)self _isDraggingInteractionEnabledForPresentable:self->_presentableForActiveGesture])
        {
          _RubberBandedTranslationInContainerView(v19);
          double v23 = y + v22;
          id v24 = UIViewControllerFromPresentable(self->_presentableForActiveGesture);
          double v25 = [v24 view];

          v55[0] = MEMORY[0x1E4F143A8];
          v55[1] = 3221225472;
          v55[2] = __38__BNContentViewController__handlePan___block_invoke;
          v55[3] = &unk_1E63B9D98;
          CGFloat v58 = x;
          double v59 = v23;
          CGPoint v60 = size;
          id v56 = v25;
          CGFloat v57 = self;
          id v26 = v25;
          +[BNBannerTransitionAnimator animateInteractive:1 animations:v55 completion:0];
        }
        goto LABEL_28;
      }
      break;
    case 3:
      p_presentableForActiveGesture = &self->_presentableForActiveGesture;
      if (![(BNContentViewController *)self _isLocalDraggingEnabledForPresentable:self->_presentableForActiveGesture])goto LABEL_24; {
      [(BNContentViewController *)self _translationInContainerViewForGesture:v5];
      }
      double v29 = v28;
      if (![(BNContentViewController *)self _isDraggingDismissalEnabledForPresentable:*p_presentableForActiveGesture])goto LABEL_24; {
      if (CGRectGetHeight(self->_presentedFrameForPresentableForActiveGesture) * 0.5 >= -v29)
      }
      {
        double v30 = [(BNContentViewController *)self view];
        [v5 velocityInView:v30];
        double v32 = v31;

        if (v32 >= -100.0) {
          goto LABEL_24;
        }
      }
      if (objc_opt_respondsToSelector()) {
        [(BNPresentable *)*p_presentableForActiveGesture userInteractionDidEndForBannerForPresentable:*p_presentableForActiveGesture];
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_poster);
      if (WeakRetained)
      {
        char v34 = objc_opt_respondsToSelector();
        double v35 = +[BNPresentableIdentification uniqueIdentificationForPresentable:*p_presentableForActiveGesture];
        if (v34)
        {
          uint64_t v54 = 0;
          long long v36 = (id *)&v54;
          uint64_t v37 = [WeakRetained revokePresentablesWithIdentification:v35 reason:@"BNBannerRevocationReasonDragDismissal" options:0 animated:1 userInfo:0 error:&v54];
        }
        else
        {
          uint64_t v53 = 0;
          long long v36 = (id *)&v53;
          uint64_t v37 = [WeakRetained revokePresentablesWithIdentification:v35 reason:@"BNBannerRevocationReasonDragDismissal" options:0 userInfo:0 error:&v53];
        }
        CGFloat v41 = (void *)v37;
        id v42 = *v36;

        if (!v41)
        {
          CGFloat v43 = (void *)BNLogPresenting;
          if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_ERROR)) {
            [(BNContentViewController *)(void **)p_presentableForActiveGesture _handlePan:(uint64_t)v42];
          }
        }
      }
      else
      {
        [(BNContentViewController *)self _dismissPresentable:*p_presentableForActiveGesture withReason:@"BNBannerRevocationReasonDragDismissal" animated:1 userInfo:0];
      }

      break;
    case 4:
LABEL_24:
      if (objc_opt_respondsToSelector()) {
        [(BNPresentable *)self->_presentableForActiveGesture userInteractionDidEndForBannerForPresentable:self->_presentableForActiveGesture];
      }
      if ([(BNContentViewController *)self _isLocalDraggingEnabledForPresentable:self->_presentableForActiveGesture])
      {
        double v38 = UIViewControllerFromPresentable(self->_presentableForActiveGesture);
        double v39 = [v38 view];

        CGSize v40 = self->_presentedFrameForPresentableForActiveGesture.size;
        CGPoint size = self->_presentedFrameForPresentableForActiveGesture.origin;
        CGSize v52 = v40;
        objc_initWeak(&location, self);
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __38__BNContentViewController__handlePan___block_invoke_138;
        v45[3] = &unk_1E63B9DC0;
        id v19 = v39;
        id v46 = v19;
        CGPoint v48 = size;
        CGSize v49 = v52;
        objc_copyWeak(&v47, &location);
        +[BNBannerTransitionAnimator animateInteractive:0 animations:v45 completion:0];
        [(BNPanGestureProxyPrivate *)self->_panGestureProxyForActivePresentable sendAction];
        [(BNContentViewController *)self _resetPresentableForActiveGesture:self->_presentableForActiveGesture];
        objc_destroyWeak(&v47);

        objc_destroyWeak(&location);
LABEL_28:
      }
      break;
    default:
      break;
  }
}

uint64_t __38__BNContentViewController__handlePan___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v2 = *(void **)(a1 + 40);
  return [v2 _postLayoutChangeForVisibleNotifications];
}

void __38__BNContentViewController__handlePan___block_invoke_138(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _postLayoutChangeForVisibleNotifications];
}

- (void)_postLayoutChangeForVisibleNotifications
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v4 = [(BNContentViewController *)self viewIfLoaded];
  id v5 = [v4 window];

  double v32 = v5;
  double v31 = [v5 screen];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  double v6 = [(BNTieredArray *)self->_presentables allObjects];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v6);
        }
        CGFloat v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        double v12 = UIViewControllerFromPresentable(v11);
        if ([v12 isViewLoaded])
        {
          double v13 = [v12 view];
          double v14 = [v13 superview];
          [v13 frame];
          -[BNContentViewController _insetFrame:forViewController:](self, "_insetFrame:forViewController:", v12);
          objc_msgSend(v14, "convertRect:toView:", 0);
          double v16 = v15;
          double v18 = v17;
          double v20 = v19;
          double v22 = v21;

          objc_msgSend(v32, "convertRect:toWindow:", 0, v16, v18, v20, v22);
          v33[0] = v23;
          v33[1] = v24;
          v33[2] = v25;
          v33[3] = v26;
          int v27 = [MEMORY[0x1E4F29238] valueWithBytes:v33 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
          double v28 = +[BNPresentableIdentification genericIdentificationForPresentable:v11];
          [v3 setObject:v27 forKey:v28];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v8);
  }

  double v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
  double v38 = @"BNPresentableIdentificationsToFrames";
  id v39 = v3;
  double v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  [v29 postNotificationName:@"BNPresentableLayoutDidChange" object:v31 userInfo:v30];
}

- (BNConsidering)authority
{
  return self->_authority;
}

- (BNPosting)poster
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_poster);
  return (BNPosting *)WeakRetained;
}

- (void)setPoster:(id)a3
{
}

- (BNPresentingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BNPresentingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_poster);
  objc_storeStrong((id *)&self->_authority, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_activeBannerTransitionAnimator, 0);
  objc_storeStrong((id *)&self->_activeBannerTransitionContext, 0);
  objc_storeStrong((id *)&self->_panGestureProxyForActivePresentable, 0);
  objc_storeStrong((id *)&self->_presentableForActiveGesture, 0);
  objc_storeStrong((id *)&self->_panGesture, 0);
  objc_storeStrong((id *)&self->_transitioningDelegates, 0);
  objc_storeStrong((id *)&self->_dismissingPresentables, 0);
  objc_storeStrong((id *)&self->_presentingPresentables, 0);
  objc_storeStrong((id *)&self->_presentables, 0);
}

- (void)presentPresentable:(void *)a1 withOptions:(uint8_t *)buf userInfo:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1BEC04000, log, OS_LOG_TYPE_DEBUG, "Retargeting animation of presentable for presentation: %{public}@", buf, 0xCu);
}

void __67__BNContentViewController_presentPresentable_withOptions_userInfo___block_invoke_58_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_2_1(a1, a2);
  id v3 = (void *)OUTLINED_FUNCTION_3_0();
  double v4 = BNEffectivePresentableDescription(v3);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1BEC04000, v5, v6, "Presentable _would_ appear as banner, but appears to be dismissing: %{public}@", v7, v8, v9, v10, v11);
}

void __96__BNContentViewController__morphFromPresentable_toPresentable_withOptions_userInfo_stateChange___block_invoke_70_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_2_1(a1, a2);
  id v3 = (void *)OUTLINED_FUNCTION_3_0();
  double v4 = BNEffectivePresentableDescription(v3);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1BEC04000, v5, v6, "Presentable _would_ disappear as banner, but appears to be presenting: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_dismissPresentable:(os_log_t)log withReason:animated:userInfo:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1BEC04000, log, OS_LOG_TYPE_DEBUG, "Retargeting animation of presentable for dismissal: %{public}@", buf, 0xCu);
}

- (void)_handlePan:(uint64_t)a3 .cold.1(void **a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v4 = *a1;
  uint64_t v5 = a2;
  uint64_t v6 = BNEffectivePresentableDescription(v4);
  OUTLINED_FUNCTION_2();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  _os_log_error_impl(&dword_1BEC04000, v5, OS_LOG_TYPE_ERROR, "Encountered error attempting to revoke presentable for active gesture '%{public}@': %{public}@", v7, 0x16u);
}

@end