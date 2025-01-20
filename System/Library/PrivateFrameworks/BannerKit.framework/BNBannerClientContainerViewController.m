@interface BNBannerClientContainerViewController
- (BNBannerClientContainerDelegate)delegate;
- (BNBannerClientContainerViewController)initWithScene:(id)a3 presentable:(id)a4 context:(id)a5;
- (BNPresentable)presentable;
- (BNPresentableContext)presentableContext;
- (BOOL)_canShowWhileLocked;
- (BOOL)isDeferringFocus;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (NSString)description;
- (UIScene)scene;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
- (id)keyWindowForScreen:(id)a3;
- (void)_acquireDeferringRuleIfNecessary;
- (void)_handlePanGestureProxyAction:(id)a3;
- (void)_handleRejectionAction:(id)a3;
- (void)_invalidateDeferringRule;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)_setPreferredContentSize:(CGSize)a3 shouldFence:(BOOL)a4;
- (void)_setPresentableBannerAppearState:(int)a3 reason:(id)a4;
- (void)_setPresentableUserInteractionInProgress:(BOOL)a3;
- (void)_setPresentableViewControllerAppearState:(int)a3;
- (void)bs_traitCollectionDidChange:(id)a3 forManagedTraitEnvironment:(id)a4;
- (void)dealloc;
- (void)performCoordinatedUpdate:(id)a3 updateResponseHandler:(id)a4;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHostNeedsUpdate;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation BNBannerClientContainerViewController

- (BNBannerClientContainerViewController)initWithScene:(id)a3 presentable:(id)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"BNBannerClientContainerViewController.m", 62, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"BNBannerClientContainerViewController.m", 63, @"Invalid parameter not satisfying: %@", @"presentable" object file lineNumber description];

LABEL_3:
  v24.receiver = self;
  v24.super_class = (Class)BNBannerClientContainerViewController;
  v12 = [(BNBannerClientContainerViewController *)&v24 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_scene, v9);
    objc_storeStrong((id *)&v13->_presentable, a4);
    objc_storeStrong((id *)&v13->_presentableContext, a5);
    v14 = [(BNPresentable *)v13->_presentable viewController];
    if (!v14)
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2, v13, @"BNBannerClientContainerViewController.m", 69, @"Presentable '%@' did not provide a view controller", v10 object file lineNumber description];
    }
    [(BNBannerClientContainerViewController *)v13 addChildViewController:v14];
    [v14 didMoveToParentViewController:v13];
    id WeakRetained = objc_loadWeakRetained((id *)&v13->_scene);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __75__BNBannerClientContainerViewController_initWithScene_presentable_context___block_invoke;
    v21[3] = &unk_1E63B9AC8;
    id v16 = v14;
    id v22 = v16;
    id v23 = v10;
    [WeakRetained _updateUIClientSettingsWithBlock:v21];

    if (objc_opt_respondsToSelector()) {
      [(BNPresentable *)v13->_presentable setPresentableContext:v13];
    }
    [(BNPresentableContext *)v13->_presentableContext setHostNeedsUpdate];
  }
  return v13;
}

void __75__BNBannerClientContainerViewController_initWithScene_presentable_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v11 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v11;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  [*(id *)(a1 + 32) bannerContentOutsets];
  objc_msgSend(v6, "setBannerContentOutsets:");
  objc_msgSend(v6, "setClippingEnabled:", objc_msgSend(*(id *)(a1 + 32), "isClippingEnabled"));
  if (objc_opt_respondsToSelector()) {
    uint64_t v7 = [*(id *)(a1 + 40) isDraggingDismissalEnabled];
  }
  else {
    uint64_t v7 = 1;
  }
  [v6 setDraggingDismissalEnabled:v7];
  if (objc_opt_respondsToSelector()) {
    uint64_t v8 = [*(id *)(a1 + 40) isDraggingInteractionEnabled];
  }
  else {
    uint64_t v8 = 0;
  }
  [v6 setDraggingInteractionEnabled:v8];
  if (objc_opt_respondsToSelector()) {
    uint64_t v9 = [*(id *)(a1 + 40) isTouchOutsideDismissalEnabled];
  }
  else {
    uint64_t v9 = 0;
  }
  [v6 setTouchOutsideDismissalEnabled:v9];
  [v6 setPanGestureProxySupported:objc_opt_respondsToSelector() & 1];
  if (objc_opt_respondsToSelector())
  {
    id v10 = [*(id *)(a1 + 40) preferredBackgroundActivitiesToSuppress];
    [v6 setPreferredBackgroundActivitiesToSuppress:v10];
  }
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_deferringRule invalidate];
  deferringRule = self->_deferringRule;
  self->_deferringRule = 0;

  [(BNCoordinatedSceneUpdateAction *)self->_sceneUpdateAction invalidate];
  sceneUpdateAction = self->_sceneUpdateAction;
  self->_sceneUpdateAction = 0;

  v5.receiver = self;
  v5.super_class = (Class)BNBannerClientContainerViewController;
  [(BNBannerClientContainerViewController *)&v5 dealloc];
}

- (BOOL)isDeferringFocus
{
  return self->_deferringRule != 0;
}

- (id)keyWindowForScreen:(id)a3
{
  id v4 = a3;
  if ([(BNBannerClientContainerViewController *)self isDeferringFocus])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
    id v6 = [WeakRetained _FBSScene];

    uint64_t v7 = [v6 settings];
    uint64_t v8 = [v7 displayIdentity];
    uint64_t v9 = [v4 displayIdentity];
    int v10 = [v8 isEqual:v9];

    if (v10)
    {
      id v11 = [(BNBannerClientContainerViewController *)self view];
      v12 = [v11 window];
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)setHostNeedsUpdate
{
  v2 = self;
  [(BNPresentableContext *)self->_presentableContext setHostNeedsUpdate];
  id v3 = v2->_presentable;
  v2 = (BNBannerClientContainerViewController *)((char *)v2 + 1000);
  id WeakRetained = objc_loadWeakRetained((id *)&v2->super.super.super.isa);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__BNBannerClientContainerViewController_setHostNeedsUpdate__block_invoke;
  v10[3] = &unk_1E63B9AF0;
  objc_super v5 = v3;
  id v11 = v5;
  [WeakRetained _updateUIClientSettingsWithBlock:v10];

  id v6 = objc_loadWeakRetained((id *)&v2->super.super.super.isa);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__BNBannerClientContainerViewController_setHostNeedsUpdate__block_invoke_2;
  v8[3] = &unk_1E63B9B18;
  uint64_t v9 = v5;
  uint64_t v7 = v5;
  [v6 _updateUIClientSettingsWithUITransitionBlock:v8];
}

void __59__BNBannerClientContainerViewController_setHostNeedsUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v8 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v5 = v8;
    }
    else {
      objc_super v5 = 0;
    }
  }
  else
  {
    objc_super v5 = 0;
  }
  id v6 = v5;

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v6, "setDraggingDismissalEnabled:", objc_msgSend(*(id *)(a1 + 32), "isDraggingDismissalEnabled"));
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v6, "setDraggingInteractionEnabled:", objc_msgSend(*(id *)(a1 + 32), "isDraggingInteractionEnabled"));
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v6, "setTouchOutsideDismissalEnabled:", objc_msgSend(*(id *)(a1 + 32), "isTouchOutsideDismissalEnabled"));
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [*(id *)(a1 + 32) preferredBackgroundActivitiesToSuppress];
    [v6 setPreferredBackgroundActivitiesToSuppress:v7];
  }
}

uint64_t __59__BNBannerClientContainerViewController_setHostNeedsUpdate__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  id v8 = [v6 viewController];
  uint64_t v9 = [v8 bannerSizeTransitionAnimationSettings];
  [v7 setAnimationSettings:v9];

  uint64_t v10 = objc_opt_class();
  id v11 = v5;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  id v13 = v12;

  [v8 bannerContentOutsets];
  objc_msgSend(v13, "setBannerContentOutsets:");

  return 1;
}

- (void)viewDidLoad
{
  v22.receiver = self;
  v22.super_class = (Class)BNBannerClientContainerViewController;
  [(BNBannerClientContainerViewController *)&v22 viewDidLoad];
  id v3 = [(BNBannerClientContainerViewController *)self view];
  [v3 setAutoresizesSubviews:1];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(BNPresentable *)self->_presentable viewController];
  [v12 bannerContentOutsets];
  double v14 = v5 + v13;
  double v16 = v7 + v15;
  double v18 = v9 - (v13 + v17);
  double v20 = v11 - (v15 + v19);
  v21 = [v12 view];
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);
  [v3 addSubview:v21];
}

- (void)viewWillLayoutSubviews
{
  id v3 = [(BNBannerClientContainerViewController *)self view];
  [v3 bounds];

  id v13 = [(BNPresentable *)self->_presentable viewController];
  [v13 bannerContentOutsets];
  UIRectInset();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [v13 view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p", objc_opt_class(), self];
  presentable = self->_presentable;
  if (presentable)
  {
    double v5 = BNPresentableDescription(presentable, 0);
    [v3 appendFormat:@"; presentable: %@", v5];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  double v7 = [WeakRetained _sceneIdentifier];

  if ([v7 length]) {
    [v3 appendFormat:@"; sceneID: %@", v7];
  }
  [v3 appendString:@">"];

  return (NSString *)v3;
}

- (void)_setPreferredContentSize:(CGSize)a3 shouldFence:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  [(BNBannerClientContainerViewController *)self preferredContentSize];
  double v9 = v8;
  double v11 = v10;
  v18.receiver = self;
  v18.super_class = (Class)BNBannerClientContainerViewController;
  -[BNBannerClientContainerViewController setPreferredContentSize:](&v18, sel_setPreferredContentSize_, width, height);
  if (v9 != width || v11 != height)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __78__BNBannerClientContainerViewController__setPreferredContentSize_shouldFence___block_invoke;
    v16[3] = &unk_1E63B9B40;
    v16[4] = self;
    *(double *)&v16[5] = width;
    *(double *)&v16[6] = height;
    BOOL v17 = a4;
    [WeakRetained _updateUIClientSettingsWithUITransitionBlock:v16];
    if (self->_sceneUpdateAction)
    {
      double v14 = [WeakRetained _FBSScene];
      double v15 = [MEMORY[0x1E4F1CAD0] setWithObject:self->_sceneUpdateAction];
      [v14 sendActions:v15];
    }
  }
}

uint64_t __78__BNBannerClientContainerViewController__setPreferredContentSize_shouldFence___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  double v6 = *(void **)(*(void *)(a1 + 32) + 1008);
  id v7 = a3;
  double v8 = [v6 viewController];
  double v9 = [v8 bannerSizeTransitionAnimationSettings];
  [v7 setAnimationSettings:v9];

  uint64_t v10 = objc_opt_class();
  id v11 = v5;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  id v13 = v12;

  objc_msgSend(v13, "setPreferredContentSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  uint64_t v14 = *(unsigned __int8 *)(a1 + 56);

  return v14;
}

- (void)setPreferredContentSize:(CGSize)a3
{
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BNBannerClientContainerViewController;
  [(BNBannerClientContainerViewController *)&v28 preferredContentSizeDidChangeForChildContentContainer:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  double v6 = [WeakRetained _FBSScene];
  id v7 = [v6 settings];
  uint64_t v8 = objc_opt_class();
  id v9 = v7;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = v10;

  [v11 presentationSize];
  double v13 = v12;
  double v15 = v14;
  [v11 containerSize];
  double v17 = v16;
  double v19 = v18;

  uint64_t v20 = objc_opt_class();
  id v21 = v4;
  if (v20)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v22 = v21;
    }
    else {
      objc_super v22 = 0;
    }
  }
  else
  {
    objc_super v22 = 0;
  }
  id v23 = v22;

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v23, "preferredContentSizeWithPresentationSize:containerSize:", v13, v15, v17, v19);
  }
  else {
    [v21 preferredContentSize];
  }
  double v26 = v24;
  double v27 = v25;

  -[BNBannerClientContainerViewController setPreferredContentSize:](self, "setPreferredContentSize:", v26, v27);
}

- (void)bs_traitCollectionDidChange:(id)a3 forManagedTraitEnvironment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v46.receiver = self;
  v46.super_class = (Class)BNBannerClientContainerViewController;
  [(BNBannerClientContainerViewController *)&v46 bs_traitCollectionDidChange:v6 forManagedTraitEnvironment:v7];
  [v6 displayScale];
  double v9 = v8;
  uint64_t v10 = [(BNBannerClientContainerViewController *)self traitCollection];
  [v10 displayScale];
  double v12 = v11;

  if (v9 != v12)
  {
    double v13 = [(BNPresentable *)self->_presentable viewController];
    [v13 bannerContentOutsets];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
    id v23 = [WeakRetained _effectiveUIClientSettings];
    uint64_t v24 = objc_opt_class();
    id v25 = v23;
    if (v24)
    {
      if (objc_opt_isKindOfClass()) {
        double v26 = v25;
      }
      else {
        double v26 = 0;
      }
    }
    else
    {
      double v26 = 0;
    }
    id v27 = v26;

    [v27 bannerContentOutsets];
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;

    if (v17 != v31 || v15 != v29 || v21 != v35 || v19 != v33)
    {
      id v39 = objc_loadWeakRetained((id *)&self->_scene);
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __96__BNBannerClientContainerViewController_bs_traitCollectionDidChange_forManagedTraitEnvironment___block_invoke;
      v45[3] = &__block_descriptor_64_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
      *(double *)&v45[4] = v15;
      *(double *)&v45[5] = v17;
      *(double *)&v45[6] = v19;
      *(double *)&v45[7] = v21;
      [v39 _updateUIClientSettingsWithBlock:v45];
    }
  }
  v40 = [v6 preferredContentSizeCategory];
  v41 = [(BNBannerClientContainerViewController *)self traitCollection];
  v42 = [v41 preferredContentSizeCategory];
  if (([v40 isEqualToString:v42] & 1) != 0 || (objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_23;
  }
  v43 = [(BNBannerClientContainerViewController *)self view];
  int v44 = [v7 isDescendantOfView:v43];

  if (v44)
  {
    v40 = [(BNPresentable *)self->_presentable viewController];
    [(BNBannerClientContainerViewController *)self preferredContentSizeDidChangeForChildContentContainer:v40];
LABEL_23:
  }
}

void __96__BNBannerClientContainerViewController_bs_traitCollectionDidChange_forManagedTraitEnvironment___block_invoke(double *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v7 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v7;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  objc_msgSend(v6, "setBannerContentOutsets:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v11 = a6;
  id v12 = a7;
  double v13 = [a4 settings];
  uint64_t v14 = objc_opt_class();
  id v15 = v13;
  if (v14)
  {
    if (objc_opt_isKindOfClass()) {
      double v16 = v15;
    }
    else {
      double v16 = 0;
    }
  }
  else
  {
    double v16 = 0;
  }
  id v17 = v16;

  if (v17)
  {
    uint64_t v18 = objc_opt_class();
    id v19 = v11;
    if (v18)
    {
      if (objc_opt_isKindOfClass()) {
        double v20 = v19;
      }
      else {
        double v20 = 0;
      }
    }
    else
    {
      double v20 = 0;
    }
    id v21 = v20;

    uint64_t v22 = [v21 userInterfaceStyle];
    if (v22 != [v17 userInterfaceStyle])
    {
      uint64_t v23 = objc_opt_class();
      id v24 = v12;
      if (v23)
      {
        if (objc_opt_isKindOfClass()) {
          id v25 = v24;
        }
        else {
          id v25 = 0;
        }
      }
      else
      {
        id v25 = 0;
      }
      id v26 = v25;

      if (v26)
      {
        id v27 = [v26 animationFence];
        if (v27) {
          [MEMORY[0x1E4F42D58] _synchronizeDrawingWithFence:v27];
        }
        double v28 = [v26 bannerAnimationSettings];
        if (v28)
        {
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __151__BNBannerClientContainerViewController__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke;
          v33[3] = &unk_1E63B9B88;
          v33[4] = self;
          [MEMORY[0x1E4F4F898] animateWithSettings:v28 actions:v33];
        }
      }
    }
    -[BNBannerClientContainerViewController _setPresentableViewControllerAppearState:](self, "_setPresentableViewControllerAppearState:", [v17 viewControllerAppearState]);
    int v29 = [v21 bannerAppearState];
    if (v29 != [v17 bannerAppearState])
    {
      uint64_t v30 = [v17 bannerAppearState];
      double v31 = [v17 revocationReason];
      [(BNBannerClientContainerViewController *)self _setPresentableBannerAppearState:v30 reason:v31];
    }
    int v32 = [v21 isUserInteractionInProgress];
    if (v32 != [v17 isUserInteractionInProgress]) {
      -[BNBannerClientContainerViewController _setPresentableUserInteractionInProgress:](self, "_setPresentableUserInteractionInProgress:", [v17 isUserInteractionInProgress]);
    }
  }
}

void __151__BNBannerClientContainerViewController__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

- (void)_handlePanGestureProxyAction:(id)a3
{
  id v10 = a3;
  if (!v10)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"BNBannerClientContainerViewController.m", 290, @"Invalid parameter not satisfying: %@", @"panGestureProxyAction" object file lineNumber description];
  }
  if (!self->_panGestureProxy && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v5 = objc_alloc_init(_BNPanGestureServiceProxy);
    panGestureProxy = self->_panGestureProxy;
    self->_panGestureProxy = v5;

    [(BNPresentable *)self->_presentable draggingDidBeginWithGestureProxy:self->_panGestureProxy];
  }
  id v7 = [(BNBannerClientContainerViewController *)self view];
  double v8 = [v7 window];
  [v10 setServiceSideWindow:v8];

  [(_BNPanGestureServiceProxy *)self->_panGestureProxy _setActivePanGestureProxyAction:v10];
  [(_BNPanGestureServiceProxy *)self->_panGestureProxy sendAction];
}

- (void)_handleRejectionAction:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"BNBannerClientContainerViewController.m", 302, @"Invalid parameter not satisfying: %@", @"rejectionAction" object file lineNumber description];
  }
  id v6 = [v5 rejectionReason];
  id v7 = (void *)BNLogHostingService;
  if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
  {
    presentable = self->_presentable;
    double v9 = v7;
    id v10 = BNEffectivePresentableDescription(presentable);
    *(_DWORD *)buf = 138543618;
    double v13 = v10;
    __int16 v14 = 2114;
    id v15 = v6;
    _os_log_impl(&dword_1BEC04000, v9, OS_LOG_TYPE_DEFAULT, "Service presentable will NOT appear as banner: %{public}@ (%{public}@)", buf, 0x16u);
  }
  if (objc_opt_respondsToSelector()) {
    [(BNPresentable *)self->_presentable presentableWillNotAppearAsBanner:self->_presentable withReason:v6];
  }
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  double v8 = (void *)[v7 mutableCopy];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        __int16 v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v15 = objc_opt_class();
        id v16 = v14;
        if (v15)
        {
          if (objc_opt_isKindOfClass()) {
            uint64_t v15 = (uint64_t)v16;
          }
          else {
            uint64_t v15 = 0;
          }
        }

        if (v15)
        {
          uint64_t v17 = objc_opt_class();
          id v18 = v16;
          if (v17)
          {
            if (objc_opt_isKindOfClass()) {
              id v19 = v18;
            }
            else {
              id v19 = 0;
            }
          }
          else
          {
            id v19 = 0;
          }
          id v25 = v19;

          [(BNBannerClientContainerViewController *)self _handlePanGestureProxyAction:v25];
LABEL_28:

          continue;
        }
        uint64_t v20 = objc_opt_class();
        id v21 = v16;
        if (v20)
        {
          if (objc_opt_isKindOfClass()) {
            uint64_t v20 = (uint64_t)v21;
          }
          else {
            uint64_t v20 = 0;
          }
        }

        if (v20)
        {
          uint64_t v22 = objc_opt_class();
          id v23 = v21;
          if (v22)
          {
            if (objc_opt_isKindOfClass()) {
              id v24 = v23;
            }
            else {
              id v24 = 0;
            }
          }
          else
          {
            id v24 = 0;
          }
          id v25 = v24;

          -[BNBannerClientContainerViewController _handleRejectionAction:](self, "_handleRejectionAction:", v25, (void)v27);
          goto LABEL_28;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v11);
  }

  return v8;
}

- (void)performCoordinatedUpdate:(id)a3 updateResponseHandler:(id)a4
{
  id v6 = (void (**)(void))a3;
  id v7 = a4;
  if (self->_sceneUpdateAction)
  {
    double v8 = BNLogHostingService;
    if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_ERROR)) {
      -[BNBannerClientContainerViewController performCoordinatedUpdate:updateResponseHandler:](v8);
    }
    [(BNCoordinatedSceneUpdateAction *)self->_sceneUpdateAction invalidate];
  }
  objc_initWeak(&location, self);
  id v9 = (void *)MEMORY[0x1E4F4F670];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __88__BNBannerClientContainerViewController_performCoordinatedUpdate_updateResponseHandler___block_invoke;
  v17[3] = &unk_1E63B9BB0;
  id v10 = v7;
  id v18 = v10;
  objc_copyWeak(&v19, &location);
  uint64_t v11 = [v9 responderWithHandler:v17];
  uint64_t v12 = [[BNCoordinatedSceneUpdateAction alloc] initWithInfo:0 responder:v11];
  sceneUpdateAction = self->_sceneUpdateAction;
  self->_sceneUpdateAction = v12;

  __int16 v14 = self->_sceneUpdateAction;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __88__BNBannerClientContainerViewController_performCoordinatedUpdate_updateResponseHandler___block_invoke_77;
  v15[3] = &unk_1E63B9860;
  objc_copyWeak(&v16, &location);
  [(BNCoordinatedSceneUpdateAction *)v14 setNullificationHandler:v15];
  if (v6) {
    v6[2](v6);
  }
  objc_destroyWeak(&v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __88__BNBannerClientContainerViewController_performCoordinatedUpdate_updateResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = BNLogHostingService;
  if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1BEC04000, v4, OS_LOG_TYPE_DEFAULT, "Received acknowledgement of hosted scene update", v9, 2u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    double v8 = (void *)*((void *)WeakRetained + 124);
    *((void *)WeakRetained + 124) = 0;
  }
}

void __88__BNBannerClientContainerViewController_performCoordinatedUpdate_updateResponseHandler___block_invoke_77(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = BNLogHostingService;
  if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1BEC04000, v2, OS_LOG_TYPE_DEFAULT, "Pending scene update action nullified", v4, 2u);
  }
  if (WeakRetained)
  {
    id v3 = (void *)WeakRetained[124];
    WeakRetained[124] = 0;
  }
}

- (void)_setPresentableViewControllerAppearState:(int)a3
{
  id v4 = [(BNPresentable *)self->_presentable viewController];
  if ([v4 _appearState] != a3)
  {
    if ((a3 | 2) == 3) {
      [v4 beginAppearanceTransition:a3 == 1 animated:1];
    }
    else {
      [v4 endAppearanceTransition];
    }
  }
}

- (void)_acquireDeferringRuleIfNecessary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [WeakRetained bannerClientContainerShouldDeferFocus:self])
  {
    if (self->_deferringRule)
    {
      double v33 = [MEMORY[0x1E4F28B00] currentHandler];
      if (objc_opt_respondsToSelector())
      {
        double v34 = [(BSInvalidatable *)self->_deferringRule reason];
        [v33 handleFailureInMethod:a2, self, @"BNBannerClientContainerViewController.m", 369, @"How do we already have a deferring rule (reason: %@)?", v34 object file lineNumber description];
      }
      else
      {
        [v33 handleFailureInMethod:a2, self, @"BNBannerClientContainerViewController.m", 369, @"How do we already have a deferring rule (reason: %@)?", @"[none]" object file lineNumber description];
      }
    }
    id v4 = objc_alloc_init(MEMORY[0x1E4F4F358]);
    id v5 = objc_loadWeakRetained((id *)&self->_scene);
    id v6 = [v5 _FBSScene];

    id v7 = (void *)MEMORY[0x1E4F4F2D0];
    double v35 = v6;
    double v8 = [v6 settings];
    id v9 = [v8 displayConfiguration];
    id v10 = [v9 hardwareIdentifier];
    uint64_t v11 = [v7 displayWithHardwareIdentifier:v10];
    [v4 setDisplay:v11];

    uint64_t v12 = (void *)MEMORY[0x1E4F4F290];
    double v13 = [v6 identityToken];
    __int16 v14 = [v13 stringRepresentation];
    uint64_t v15 = [v12 tokenForString:v14];
    [v4 setToken:v15];

    id v16 = objc_alloc_init(MEMORY[0x1E4F4F368]);
    uint64_t v17 = [(BNBannerClientContainerViewController *)self view];
    id v18 = [v17 window];

    uint64_t v19 = [v18 _contextId];
    uint64_t v20 = [MEMORY[0x1E4F4F290] tokenForIdentifierOfCAContext:v19];
    [v16 setToken:v20];

    [v16 setPid:getpid()];
    id v21 = [MEMORY[0x1E4F4F2A0] sharedInstance];
    uint64_t v22 = NSString;
    id v23 = (objc_class *)objc_opt_class();
    id v24 = NSStringFromClass(v23);
    id v25 = [(BNPresentable *)self->_presentable requesterIdentifier];
    id v26 = [(BNPresentable *)self->_presentable requestIdentifier];
    long long v27 = [v22 stringWithFormat:@"%@.%@.%@-%x", v24, v25, v26, v19];
    long long v28 = [v21 deferEventsMatchingPredicate:v4 toTarget:v16 withReason:v27];
    deferringRule = self->_deferringRule;
    self->_deferringRule = v28;

    long long v30 = [v18 windowScene];
    double v31 = [v30 focusSystem];
    id v32 = (id)[v31 focusedItem];
  }
}

- (void)_invalidateDeferringRule
{
  [(BSInvalidatable *)self->_deferringRule invalidate];
  deferringRule = self->_deferringRule;
  self->_deferringRule = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained bannerClientContainerStoppedDeferringFocus:self];
  }
}

- (void)_setPresentableBannerAppearState:(int)a3 reason:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  switch(a3)
  {
    case 0:
      id v7 = (void *)BNLogHostingService;
      if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
      {
        presentable = self->_presentable;
        id v9 = v7;
        id v10 = BNEffectivePresentableDescription(presentable);
        int v23 = 138543618;
        id v24 = v10;
        __int16 v25 = 2114;
        id v26 = v6;
        _os_log_impl(&dword_1BEC04000, v9, OS_LOG_TYPE_DEFAULT, "Service presentable did disappear as banner: %{public}@ (%{public}@)", (uint8_t *)&v23, 0x16u);
      }
      if (objc_opt_respondsToSelector()) {
        [(BNPresentable *)self->_presentable presentableDidDisappearAsBanner:self->_presentable withReason:v6];
      }
      break;
    case 1:
      [(BNBannerClientContainerViewController *)self _acquireDeferringRuleIfNecessary];
      uint64_t v11 = (void *)BNLogHostingService;
      if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = self->_presentable;
        double v13 = v11;
        __int16 v14 = BNEffectivePresentableDescription(v12);
        int v23 = 138543362;
        id v24 = v14;
        _os_log_impl(&dword_1BEC04000, v13, OS_LOG_TYPE_DEFAULT, "Service presentable will appear as banner: %{public}@", (uint8_t *)&v23, 0xCu);
      }
      if (objc_opt_respondsToSelector()) {
        [(BNPresentable *)self->_presentable presentableWillAppearAsBanner:self->_presentable];
      }
      break;
    case 2:
      uint64_t v15 = (void *)BNLogHostingService;
      if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = self->_presentable;
        uint64_t v17 = v15;
        id v18 = BNEffectivePresentableDescription(v16);
        int v23 = 138543362;
        id v24 = v18;
        _os_log_impl(&dword_1BEC04000, v17, OS_LOG_TYPE_DEFAULT, "Service presentable did appear as banner: %{public}@", (uint8_t *)&v23, 0xCu);
      }
      if (objc_opt_respondsToSelector()) {
        [(BNPresentable *)self->_presentable presentableDidAppearAsBanner:self->_presentable];
      }
      break;
    case 3:
      [(BNBannerClientContainerViewController *)self _invalidateDeferringRule];
      uint64_t v19 = (void *)BNLogHostingService;
      if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = self->_presentable;
        id v21 = v19;
        uint64_t v22 = BNEffectivePresentableDescription(v20);
        int v23 = 138543618;
        id v24 = v22;
        __int16 v25 = 2114;
        id v26 = v6;
        _os_log_impl(&dword_1BEC04000, v21, OS_LOG_TYPE_DEFAULT, "Service presentable will disappear as banner: %{public}@ (%{public}@)", (uint8_t *)&v23, 0x16u);
      }
      if (objc_opt_respondsToSelector()) {
        [(BNPresentable *)self->_presentable presentableWillDisappearAsBanner:self->_presentable withReason:v6];
      }
      break;
    default:
      break;
  }
}

- (void)_setPresentableUserInteractionInProgress:(BOOL)a3
{
  if (a3)
  {
    if (objc_opt_respondsToSelector())
    {
      presentable = self->_presentable;
      [(BNPresentable *)presentable userInteractionWillBeginForBannerForPresentable:presentable];
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    id v5 = self->_presentable;
    [(BNPresentable *)v5 userInteractionDidEndForBannerForPresentable:v5];
  }
}

- (UIScene)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIScene *)WeakRetained;
}

- (BNPresentable)presentable
{
  return self->_presentable;
}

- (BNPresentableContext)presentableContext
{
  return self->_presentableContext;
}

- (BNBannerClientContainerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BNBannerClientContainerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_presentableContext, 0);
  objc_storeStrong((id *)&self->_presentable, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_sceneUpdateAction, 0);
  objc_storeStrong((id *)&self->_panGestureProxy, 0);
  objc_storeStrong((id *)&self->_deferringRule, 0);
}

- (void)performCoordinatedUpdate:(os_log_t)log updateResponseHandler:.cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1BEC04000, log, OS_LOG_TYPE_ERROR, "Found unexpected pending scene update action, invalidating it and creating anew", v1, 2u);
}

@end