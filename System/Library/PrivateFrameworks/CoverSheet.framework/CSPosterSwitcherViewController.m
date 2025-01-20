@interface CSPosterSwitcherViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)canHostAnApp;
- (BOOL)handleEvent:(id)a3;
- (BOOL)handledInitialTransition;
- (BOOL)handlesRotationIndependentOfCoverSheet;
- (BOOL)hasCommittedInContentReadyState;
- (BOOL)hasEverAppeared;
- (BOOL)hasTransferredInitialTouches;
- (BOOL)hostedAppShouldDeactivateAfterDisappearance;
- (BOOL)hostedAppShouldHideHomeGrabberView;
- (BOOL)hostedAppShouldInvalidateUponDeactivation;
- (BOOL)hostedAppShouldReactivateUponDestruction;
- (BOOL)isCoverSheetComplicationRowHidden;
- (BOOL)isCoverSheetWallpaperFloatingLayerInlined;
- (BOOL)isHostingAnApp;
- (BOOL)sceneHandle:(id)a3 didReceiveAction:(id)a4;
- (BSUIVibrancyConfiguration)vibrancyConfiguration;
- (CGRect)leadingTopButtonFrame;
- (CGRect)trailingTopButtonFrame;
- (CSPosterSwitcherViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CSTraitAwareAppHostConfiguring)appHostConfiguring;
- (CSTraitsAwareOrientedAppHosting)traitsAwareViewController;
- (NSArray)activatingTouches;
- (NSString)hostedAppBundleIdentifier;
- (PRUISSwitcherSceneClientSettingsDiffInspector)sceneClientSettingsDiffInspector;
- (SBApplicationHosting)applicationHoster;
- (UIView)coverSheetBackgroundView;
- (UIView)coverSheetFloatingView;
- (UIView)coverSheetWallpaperView;
- (UIView)scaleView;
- (UIWindow)targetWindow;
- (id)_sceneIfExists;
- (id)hostedAppSceneHandle;
- (id)hostedAppSceneHandles;
- (id)invalidationHandler;
- (unint64_t)_effectiveSceneClientLayoutMode;
- (unint64_t)clientSwitcherLayoutMode;
- (unint64_t)fullscreenTransitionAnimationCount;
- (void)_applicationHosterDidInvalidate;
- (void)_dismissEntirely;
- (void)_dismissTier:(BOOL)a3;
- (void)_evaluateInitialTouchTransferActuation;
- (void)_evaluateInitialTransitionActivation;
- (void)_sendDismissEntirelyActionToScene;
- (void)_transitionScene:(id)a3 toLayoutMode:(unint64_t)a4 animated:(BOOL)a5;
- (void)_updateAppearanceWithClientLayoutMode:(unint64_t)a3 previousLayoutMode:(unint64_t)a4 transitionContext:(id)a5;
- (void)_updateAppearanceWithoutAnimation;
- (void)_updateComplicationRowHiddenForSceneSettings:(id)a3;
- (void)_updateFloatingLayerInlinedForSceneSettings:(id)a3;
- (void)_updateLiveContentViewSpecificationForSceneSettings:(id)a3;
- (void)_updateLiveFloatingViewSpecificationForSceneSettings:(id)a3;
- (void)_updateLockVibrancyConfigurationForSceneSettings:(id)a3;
- (void)_updateOverlayViewSpecificationForSceneSettings:(id)a3;
- (void)_updateTopButtonLayoutForSceneSettings:(id)a3;
- (void)addGrabberView:(id)a3;
- (void)aggregateAppearance:(id)a3;
- (void)aggregateBehavior:(id)a3;
- (void)appendToHostedAppSceneSettings:(id)a3;
- (void)dismissForHomeButton;
- (void)handleBottomEdgeGestureEnded:(id)a3;
- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3;
- (void)loadView;
- (void)sceneHandle:(id)a3 didCreateScene:(id)a4;
- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4;
- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5;
- (void)sceneHandle:(id)a3 didUpdateContentState:(int64_t)a4;
- (void)setActivatingTouches:(id)a3;
- (void)setAppHostConfiguring:(id)a3;
- (void)setClientSwitcherLayoutMode:(unint64_t)a3;
- (void)setCoverSheetBackgroundView:(id)a3;
- (void)setCoverSheetComplicationRowHidden:(BOOL)a3;
- (void)setCoverSheetFloatingView:(id)a3;
- (void)setCoverSheetWallpaperFloatingLayerInlined:(BOOL)a3;
- (void)setCoverSheetWallpaperView:(id)a3;
- (void)setFullscreenTransitionAnimationCount:(unint64_t)a3;
- (void)setHandledInitialTransition:(BOOL)a3;
- (void)setHasCommittedInContentReadyState:(BOOL)a3;
- (void)setHasEverAppeared:(BOOL)a3;
- (void)setHasTransferredInitialTouches:(BOOL)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLeadingTopButtonFrame:(CGRect)a3 trailingTopButtonFrame:(CGRect)a4;
- (void)setTargetWindow:(id)a3;
- (void)setTraitsAwareViewController:(id)a3;
- (void)setVibrancyConfiguration:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CSPosterSwitcherViewController

- (CSPosterSwitcherViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CSPosterSwitcherViewController;
  v4 = [(CSCoverSheetViewControllerBase *)&v9 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    v4->_clientSwitcherLayoutMode = 0;
    uint64_t v6 = [MEMORY[0x1E4F92480] diffInspectorForObservingDiffContext];
    sceneClientSettingsDiffInspector = v5->_sceneClientSettingsDiffInspector;
    v5->_sceneClientSettingsDiffInspector = (PRUISSwitcherSceneClientSettingsDiffInspector *)v6;
  }
  return v5;
}

- (void)loadView
{
  v8.receiver = self;
  v8.super_class = (Class)CSPosterSwitcherViewController;
  [(CSCoverSheetViewControllerBase *)&v8 loadView];
  id v3 = objc_alloc(MEMORY[0x1E4F42FF0]);
  v4 = [(CSPosterSwitcherViewController *)self view];
  [v4 bounds];
  v5 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  scaleView = self->_scaleView;
  self->_scaleView = v5;

  [(UIView *)self->_scaleView setAutoresizingMask:18];
  v7 = [(CSPosterSwitcherViewController *)self view];
  [v7 addSubview:self->_scaleView];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSPosterSwitcherViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewWillAppear:a3];
  [(CSPosterSwitcherViewController *)self setHasEverAppeared:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CSPosterSwitcherViewController;
  [(CSCoverSheetViewControllerBase *)&v6 viewDidAppear:a3];
  objc_super v4 = [(SBApplicationHosting *)self->_applicationHoster hostedAppSceneHandle];
  [v4 addObserver:self];
  [v4 addActionConsumer:self];
  if (__sb__runningInSpringBoard())
  {
    [v4 setContentPrefersToDisableClipping:SBFEffectiveDeviceClass() == 2];
  }
  else
  {
    v5 = [MEMORY[0x1E4F42948] currentDevice];
    objc_msgSend(v4, "setContentPrefersToDisableClipping:", objc_msgSend(v5, "userInterfaceIdiom") == 1);
  }
  [(CSPosterSwitcherViewController *)self _evaluateInitialTransitionActivation];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSPosterSwitcherViewController;
  [(CSCoverSheetViewControllerBase *)&v5 viewDidDisappear:a3];
  objc_super v4 = [(SBApplicationHosting *)self->_applicationHoster hostedAppSceneHandle];
  [v4 removeObserver:self];
  [v4 removeActionConsumer:self];
  [v4 setContentPrefersToDisableClipping:0];
}

- (BOOL)_canShowWhileLocked
{
  return 0;
}

- (void)setAppHostConfiguring:(id)a3
{
  objc_super v6 = (CSTraitAwareAppHostConfiguring *)a3;
  p_appHostConfiguring = &self->_appHostConfiguring;
  appHostConfiguring = self->_appHostConfiguring;
  if (appHostConfiguring == v6)
  {
LABEL_10:

    return;
  }
  if (appHostConfiguring) {
    [(CSPosterSwitcherViewController *)self bs_removeChildViewController:self->_applicationHoster];
  }
  objc_storeStrong((id *)&self->_appHostConfiguring, a3);
  [(SBApplicationHosting *)self->_applicationHoster setInvalidationHandler:0];
  objc_super v9 = [(CSTraitAwareAppHostConfiguring *)*p_appHostConfiguring applicationHosterForTraitsHostContextProvider:self];
  applicationHoster = self->_applicationHoster;
  self->_applicationHoster = v9;

  if (!self->_applicationHoster)
  {
LABEL_7:
    [(CSPosterSwitcherViewController *)self loadViewIfNeeded];
    v12 = *p_appHostConfiguring;
    v13 = self->_applicationHoster;
    v14 = [(CSPosterSwitcherViewController *)self view];
    v15 = [v14 window];
    targetWindow = v15;
    if (!v15) {
      targetWindow = self->_targetWindow;
    }
    v17 = [(CSTraitAwareAppHostConfiguring *)v12 traitsAwareViewControllerForApplicationHoster:v13 targetWindow:targetWindow];
    traitsAwareViewController = self->_traitsAwareViewController;
    self->_traitsAwareViewController = v17;

    v19 = self->_traitsAwareViewController;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __56__CSPosterSwitcherViewController_setAppHostConfiguring___block_invoke_2;
    v21[3] = &unk_1E6AD8820;
    v21[4] = self;
    [(CSPosterSwitcherViewController *)self bs_addChildViewController:v19 animated:0 transitionBlock:v21];
    goto LABEL_10;
  }
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    v11 = self->_applicationHoster;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __56__CSPosterSwitcherViewController_setAppHostConfiguring___block_invoke;
    v22[3] = &unk_1E6AD92C8;
    objc_copyWeak(&v23, &location);
    [(SBApplicationHosting *)v11 setInvalidationHandler:v22];
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
    goto LABEL_7;
  }
  v20 = [NSString stringWithFormat:@"We need an application hoster that supports an invalidation handler"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    [(CSPosterSwitcherViewController *)a2 setAppHostConfiguring:(uint64_t)v20];
  }
  [v20 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

void __56__CSPosterSwitcherViewController_setAppHostConfiguring___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _applicationHosterDidInvalidate];
}

void __56__CSPosterSwitcherViewController_setAppHostConfiguring___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 1160);
  objc_super v4 = a2;
  id v6 = [v3 view];
  objc_super v5 = [*(id *)(a1 + 32) view];
  [v5 bounds];
  objc_msgSend(v6, "setFrame:");

  [*(id *)(*(void *)(a1 + 32) + 1136) addSubview:v6];
  v4[2](v4);
}

- (void)setCoverSheetBackgroundView:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetBackgroundView);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_coverSheetBackgroundView, v4);
    id v6 = [(CSPosterSwitcherViewController *)self _sceneIfExists];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __62__CSPosterSwitcherViewController_setCoverSheetBackgroundView___block_invoke;
    v7[3] = &unk_1E6ADA0B0;
    v7[4] = self;
    [v6 updateSettingsWithBlock:v7];
  }
}

uint64_t __62__CSPosterSwitcherViewController_setCoverSheetBackgroundView___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateOverlayViewSpecificationForSceneSettings:a2];
}

- (void)setCoverSheetWallpaperView:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetWallpaperView);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_coverSheetWallpaperView, v4);
    id v6 = [(CSPosterSwitcherViewController *)self _sceneIfExists];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__CSPosterSwitcherViewController_setCoverSheetWallpaperView___block_invoke;
    v7[3] = &unk_1E6ADA0B0;
    v7[4] = self;
    [v6 updateSettingsWithBlock:v7];
  }
}

uint64_t __61__CSPosterSwitcherViewController_setCoverSheetWallpaperView___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateLiveContentViewSpecificationForSceneSettings:a2];
}

- (void)setCoverSheetFloatingView:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetFloatingView);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_coverSheetFloatingView, v4);
    id v6 = [(CSPosterSwitcherViewController *)self _sceneIfExists];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__CSPosterSwitcherViewController_setCoverSheetFloatingView___block_invoke;
    v7[3] = &unk_1E6ADA0B0;
    v7[4] = self;
    [v6 updateSettingsWithBlock:v7];
  }
}

uint64_t __60__CSPosterSwitcherViewController_setCoverSheetFloatingView___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateLiveFloatingViewSpecificationForSceneSettings:a2];
}

- (void)setCoverSheetWallpaperFloatingLayerInlined:(BOOL)a3
{
  if (self->_coverSheetWallpaperFloatingLayerInlined != a3)
  {
    self->_coverSheetWallpaperFloatingLayerInlined = a3;
    id v4 = [(CSPosterSwitcherViewController *)self _sceneIfExists];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __77__CSPosterSwitcherViewController_setCoverSheetWallpaperFloatingLayerInlined___block_invoke;
    v5[3] = &unk_1E6ADA0B0;
    v5[4] = self;
    [v4 updateSettingsWithBlock:v5];
  }
}

uint64_t __77__CSPosterSwitcherViewController_setCoverSheetWallpaperFloatingLayerInlined___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateFloatingLayerInlinedForSceneSettings:a2];
}

- (void)setCoverSheetComplicationRowHidden:(BOOL)a3
{
  if (self->_coverSheetComplicationRowHidden != a3)
  {
    self->_coverSheetComplicationRowHidden = a3;
    id v4 = [(CSPosterSwitcherViewController *)self _sceneIfExists];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __69__CSPosterSwitcherViewController_setCoverSheetComplicationRowHidden___block_invoke;
    v5[3] = &unk_1E6ADA0B0;
    v5[4] = self;
    [v4 updateSettingsWithBlock:v5];
  }
}

uint64_t __69__CSPosterSwitcherViewController_setCoverSheetComplicationRowHidden___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateComplicationRowHiddenForSceneSettings:a2];
}

- (void)setVibrancyConfiguration:(id)a3
{
  id v4 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_super v5 = (BSUIVibrancyConfiguration *)[v4 copy];
    vibrancyConfiguration = self->_vibrancyConfiguration;
    self->_vibrancyConfiguration = v5;

    v7 = [(CSPosterSwitcherViewController *)self _sceneIfExists];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__CSPosterSwitcherViewController_setVibrancyConfiguration___block_invoke;
    v8[3] = &unk_1E6ADA0B0;
    v8[4] = self;
    [v7 updateSettingsWithBlock:v8];
  }
}

uint64_t __59__CSPosterSwitcherViewController_setVibrancyConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateLockVibrancyConfigurationForSceneSettings:a2];
}

- (void)setLeadingTopButtonFrame:(CGRect)a3 trailingTopButtonFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  p_leadingTopButtonFrame = &self->_leadingTopButtonFrame;
  if (!CGRectEqualToRect(a3, self->_leadingTopButtonFrame)
    || (v16.origin.CGFloat x = x,
        v16.origin.CGFloat y = y,
        v16.size.CGFloat width = width,
        v16.size.CGFloat height = height,
        !CGRectEqualToRect(v16, self->_trailingTopButtonFrame)))
  {
    p_leadingTopButtonFrame->origin.CGFloat x = v11;
    p_leadingTopButtonFrame->origin.CGFloat y = v10;
    p_leadingTopButtonFrame->size.CGFloat width = v9;
    p_leadingTopButtonFrame->size.CGFloat height = v8;
    self->_trailingTopButtonFrame.origin.CGFloat x = x;
    self->_trailingTopButtonFrame.origin.CGFloat y = y;
    self->_trailingTopButtonFrame.size.CGFloat width = width;
    self->_trailingTopButtonFrame.size.CGFloat height = height;
    v14 = [(CSPosterSwitcherViewController *)self _sceneIfExists];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __82__CSPosterSwitcherViewController_setLeadingTopButtonFrame_trailingTopButtonFrame___block_invoke;
    v15[3] = &unk_1E6ADA0B0;
    v15[4] = self;
    [v14 updateSettingsWithBlock:v15];
  }
}

uint64_t __82__CSPosterSwitcherViewController_setLeadingTopButtonFrame_trailingTopButtonFrame___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateTopButtonLayoutForSceneSettings:a2];
}

- (void)aggregateBehavior:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSPosterSwitcherViewController;
  id v3 = a3;
  [(CSCoverSheetViewControllerBase *)&v4 aggregateBehavior:v3];
  objc_msgSend(v3, "setIdleTimerDuration:", 12, v4.receiver, v4.super_class);
  [v3 setIdleTimerMode:1];
  [v3 setIdleWarnMode:2];
  [v3 setNotificationBehavior:2];
  [v3 addRestrictedCapabilities:4096];
}

- (void)aggregateAppearance:(id)a3
{
  v100[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v97.receiver = self;
  v97.super_class = (Class)CSPosterSwitcherViewController;
  [(CSCoverSheetViewControllerBase *)&v97 aggregateAppearance:v4];
  objc_super v5 = +[CSComponent proudLock];
  v100[0] = v5;
  id v6 = +[CSComponent quickActions];
  v100[1] = v6;
  v7 = +[CSComponent footerStatusLabel];
  v100[2] = v7;
  CGFloat v8 = +[CSComponent pageContent];
  v100[3] = v8;
  CGFloat v9 = +[CSComponent content];
  v100[4] = v9;
  CGFloat v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v100 count:5];

  unint64_t v11 = [(CSPosterSwitcherViewController *)self clientSwitcherLayoutMode];
  v12 = SBLogDashBoard();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[CSPosterSwitcherViewController aggregateAppearance:](v11 != 0, v12, v13, v14, v15, v16, v17, v18);
  }

  v78 = self;
  v19 = [(CSPosterSwitcherViewController *)self _sceneIfExists];
  v20 = [v19 clientSettings];

  objc_msgSend(v20, "prui_primaryPosterScale");
  double v22 = v21;
  v79 = v20;
  objc_msgSend(v20, "prui_primaryPosterOffset");
  if (v22 <= 0.0 || v11 == 0) {
    double v26 = 1.0;
  }
  else {
    double v26 = v22;
  }
  double v27 = *MEMORY[0x1E4F1DAD8];
  double v28 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (v11) {
    double v29 = v23;
  }
  else {
    double v29 = *MEMORY[0x1E4F1DAD8];
  }
  long long v95 = 0u;
  long long v96 = 0u;
  if (v11) {
    double v30 = v24;
  }
  else {
    double v30 = v28;
  }
  long long v94 = 0uLL;
  CSComponentTransitionInputsMake(0, (uint64_t)&v94, 0.001, v29, v30, v26, 0.0);
  v90[0] = MEMORY[0x1E4F143A8];
  v90[1] = 3221225472;
  long long v91 = v94;
  v90[2] = __54__CSPosterSwitcherViewController_aggregateAppearance___block_invoke;
  v90[3] = &__block_descriptor_88_e21__16__0__CSComponent_8l;
  v90[4] = 24;
  long long v92 = v95;
  long long v93 = v96;
  v31 = objc_msgSend(v10, "bs_map:", v90);

  v32 = +[CSComponent statusBar];
  v99[0] = v32;
  v33 = +[CSComponent controlCenterGrabber];
  v99[1] = v33;
  v34 = +[CSComponent footerCallToActionLabel];
  v99[2] = v34;
  v35 = +[CSComponent pageControl];
  v99[3] = v35;
  v36 = +[CSComponent whitePoint];
  v99[4] = v36;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:5];
  v38 = [v31 arrayByAddingObjectsFromArray:v37];

  if (v11)
  {
    uint64_t v39 = objc_msgSend(v38, "bs_map:", &__block_literal_global_13);

    v38 = (void *)v39;
  }
  v40 = objc_opt_new();
  v41 = [v40 suppressTeachableMomentsAnimation:1];
  v42 = [v41 priority:40];
  v43 = [v42 hidden:v11 != 0];

  v44 = [v43 transitionModifiers:24];
  long long v87 = v94;
  long long v88 = v95;
  long long v89 = v96;
  v45 = [v44 transitionInputs:&v87];

  v46 = [v38 arrayByAddingObject:v45];

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v47 = v46;
  uint64_t v48 = [v47 countByEnumeratingWithState:&v83 objects:v98 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v84;
    do
    {
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v84 != v50) {
          objc_enumerationMutation(v47);
        }
        [v4 addComponent:*(void *)(*((void *)&v83 + 1) + 8 * i)];
      }
      uint64_t v49 = [v47 countByEnumeratingWithState:&v83 objects:v98 count:16];
    }
    while (v49);
  }

  v52 = [(CSPosterSwitcherViewController *)v78 hostedAppSceneHandle];
  int v53 = [v52 isContentReady];

  if (v53)
  {
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() != 2) {
        goto LABEL_30;
      }
    }
    else
    {
      v54 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v55 = [v54 userInterfaceIdiom];

      if (v55 != 1) {
        goto LABEL_30;
      }
    }
    v56 = +[CSComponent complicationSidebar];
    v57 = [v56 priority:40];
    v58 = [v57 hidden:1];
    [v4 addComponent:v58];

    v59 = +[CSComponent fullBleedContent];
    v60 = [v59 priority:40];
    v61 = [v60 flag:1];
    [v4 addComponent:v61];
  }
LABEL_30:
  unint64_t fullscreenTransitionAnimationCount = v78->_fullscreenTransitionAnimationCount;
  if (fullscreenTransitionAnimationCount) {
    BOOL v63 = 1;
  }
  else {
    BOOL v63 = v11 == 0;
  }
  if (v63)
  {
    long long v88 = 0u;
    long long v89 = 0u;
    long long v87 = 0u;
    CSComponentTransitionInputsMake(1, (uint64_t)&v87, 0.0, v27, v28, 0.0, 0.0);
    v64 = +[CSComponent modalContent];
    v65 = [v64 priority:40];
    v66 = [v65 transitionModifiers:64];
    long long v80 = v87;
    long long v81 = v88;
    long long v82 = v89;
    v67 = [v66 transitionInputs:&v80];
    [v4 addComponent:v67];

    v68 = +[CSComponent backgroundContent];
    v69 = [v68 priority:40];
    v70 = [v69 transitionModifiers:64];
    long long v80 = v87;
    long long v81 = v88;
    long long v82 = v89;
    v71 = [v70 transitionInputs:&v80];
    [v4 addComponent:v71];
  }
  v72 = objc_opt_new();
  v73 = [v72 priority:40];
  v74 = [v73 hidden:0];

  [v74 setLevel:1];
  if (fullscreenTransitionAnimationCount | v11)
  {
    v75 = objc_opt_new();
    v76 = [v75 shouldMatchMove:0];
    v77 = [v76 priority:40];

    [v77 setLevel:1];
    if (v11)
    {
      [v77 setShouldRenderForPosterSwitcher:1];
      [v74 setShouldMatchBackgroundStyle:0];
    }
    [v4 addComponent:v77];
  }
  [v4 addComponent:v74];
}

id __54__CSPosterSwitcherViewController_aggregateAppearance___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 transitionModifiers:*(void *)(a1 + 32)];
  long long v4 = *(_OWORD *)(a1 + 56);
  v7[0] = *(_OWORD *)(a1 + 40);
  v7[1] = v4;
  v7[2] = *(_OWORD *)(a1 + 72);
  objc_super v5 = [v3 transitionInputs:v7];

  return v5;
}

id __54__CSPosterSwitcherViewController_aggregateAppearance___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 priority:40];
  id v3 = [v2 hidden:1];

  return v3;
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  if ([v4 type] == 9) {
    [(CSPosterSwitcherViewController *)self _sendDismissEntirelyActionToScene];
  }
  v13.receiver = self;
  v13.super_class = (Class)CSPosterSwitcherViewController;
  if (![(CSCoverSheetViewControllerBase *)&v13 handleEvent:v4]
    || ([v4 isConsumable] & 1) == 0)
  {
    uint64_t v6 = [v4 type];
    if (v6 == 13)
    {
      CGFloat v9 = [v4 value];
      char v10 = [v9 BOOLValue];

      if ((v10 & 1) == 0)
      {
        v7 = SBLogDashBoard();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v12 = 0;
          CGFloat v8 = "Dismissing Poster Switcher due to authentication change.";
          goto LABEL_13;
        }
LABEL_14:

        [(CSPosterSwitcherViewController *)self _dismissEntirely];
      }
    }
    else if (v6 == 25)
    {
      v7 = SBLogDashBoard();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        CGFloat v8 = "Dismissing Poster Switcher due to screen-off.";
LABEL_13:
        _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, v8, v12, 2u);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
    char v5 = 0;
    goto LABEL_16;
  }
  char v5 = [v4 isConsumable];
LABEL_16:

  return v5;
}

- (void)addGrabberView:(id)a3
{
  id v5 = a3;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    id v4 = [(CSPosterSwitcherViewController *)self view];
    [v4 bounds];
    objc_msgSend(v5, "setFrame:");

    [v5 setAutoresizingMask:18];
    [v5 setAlpha:0.0];
    [(UIView *)self->_scaleView addSubview:v5];
  }
}

- (void)handleBottomEdgeGestureEnded:(id)a3
{
}

- (void)dismissForHomeButton
{
  id v3 = SBLogDashBoard();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_DEFAULT, "Dismissing Poster Switcher due to home button press.", v4, 2u);
  }

  [(CSPosterSwitcherViewController *)self _dismissTier:1];
}

- (BOOL)handlesRotationIndependentOfCoverSheet
{
  return 0;
}

- (BOOL)canHostAnApp
{
  return [(SBApplicationHosting *)self->_applicationHoster canHostAnApp];
}

- (BOOL)isHostingAnApp
{
  return [(SBApplicationHosting *)self->_applicationHoster isHostingAnApp];
}

- (id)hostedAppSceneHandle
{
  return (id)[(SBApplicationHosting *)self->_applicationHoster hostedAppSceneHandle];
}

- (id)hostedAppSceneHandles
{
  return (id)[(SBApplicationHosting *)self->_applicationHoster hostedAppSceneHandles];
}

- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3
{
}

- (void)_applicationHosterDidInvalidate
{
  v2 = [(CSPosterSwitcherViewController *)self invalidationHandler];
  if (v2)
  {
    id v3 = v2;
    v2[2]();
    v2 = v3;
  }
}

- (NSString)hostedAppBundleIdentifier
{
  return (NSString *)@"com.apple.PosterBoard";
}

- (BOOL)hostedAppShouldHideHomeGrabberView
{
  return 1;
}

- (void)appendToHostedAppSceneSettings:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "prui_setPreferredSwitcherLayoutMode:", 0);
  [(CSPosterSwitcherViewController *)self _updateOverlayViewSpecificationForSceneSettings:v4];
  [(CSPosterSwitcherViewController *)self _updateLiveContentViewSpecificationForSceneSettings:v4];
  [(CSPosterSwitcherViewController *)self _updateLiveFloatingViewSpecificationForSceneSettings:v4];
  [(CSPosterSwitcherViewController *)self _updateFloatingLayerInlinedForSceneSettings:v4];
  [(CSPosterSwitcherViewController *)self _updateComplicationRowHiddenForSceneSettings:v4];
  [(CSPosterSwitcherViewController *)self _updateTopButtonLayoutForSceneSettings:v4];
  [(CSPosterSwitcherViewController *)self _updateLockVibrancyConfigurationForSceneSettings:v4];
}

- (BOOL)hostedAppShouldDeactivateAfterDisappearance
{
  return 1;
}

- (BOOL)hostedAppShouldInvalidateUponDeactivation
{
  return 1;
}

- (BOOL)hostedAppShouldReactivateUponDestruction
{
  return 0;
}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  traitsAwareViewController = self->_traitsAwareViewController;
  id v7 = a3;
  id v8 = [(CSTraitsAwareOrientedAppHosting *)traitsAwareViewController hostedSceneHandle];

  if (a4
    && v8 == v7
    && [(CSPosterSwitcherViewController *)self bs_isAppearingOrAppeared])
  {
    CGFloat v9 = self->_traitsAwareViewController;
    [(CSTraitsAwareOrientedAppHosting *)v9 sceneDidAttach];
  }
}

- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4
{
  id v6 = a3;
  [(CSPosterSwitcherViewController *)self _dismissEntirely];
  id v7 = [(CSTraitsAwareOrientedAppHosting *)self->_traitsAwareViewController hostedSceneHandle];

  if (a4 && v7 == v6)
  {
    traitsAwareViewController = self->_traitsAwareViewController;
    [(CSTraitsAwareOrientedAppHosting *)traitsAwareViewController sceneWasDestroyed];
  }
}

- (void)sceneHandle:(id)a3 didUpdateContentState:(int64_t)a4
{
  id v5 = a3;
  [(CSPosterSwitcherViewController *)self _evaluateInitialTransitionActivation];
  if ([v5 isContentReady])
  {
    id v6 = (void *)MEMORY[0x1E4F39CF8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__CSPosterSwitcherViewController_sceneHandle_didUpdateContentState___block_invoke;
    _OWORD v7[3] = &unk_1E6AD88C0;
    v7[4] = self;
    id v8 = v5;
    objc_msgSend(v6, "bs_performAfterSynchronizedCommit:", v7);
  }
  else
  {
    [(CSPosterSwitcherViewController *)self setHasCommittedInContentReadyState:0];
  }
}

uint64_t __68__CSPosterSwitcherViewController_sceneHandle_didUpdateContentState___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHasCommittedInContentReadyState:", objc_msgSend(*(id *)(a1 + 40), "isContentReady"));
  v2 = *(void **)(a1 + 32);

  return [v2 _evaluateInitialTouchTransferActuation];
}

- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  char v10 = [a3 scene];
  unint64_t v11 = [v10 clientSettings];
  uint64_t v12 = objc_msgSend(v11, "prui_switcherLayoutMode");

  char v21 = 0;
  objc_super v13 = [(CSPosterSwitcherViewController *)self sceneClientSettingsDiffInspector];
  [v13 inspectDiff:v9 withContext:&v21];

  char v14 = v21;
  if ((v21 & 2) != 0) {
    [(CSPosterSwitcherViewController *)self _evaluateInitialTouchTransferActuation];
  }
  unint64_t v15 = [(CSPosterSwitcherViewController *)self clientSwitcherLayoutMode];
  if (v14)
  {
    unint64_t v16 = v15;
    if (v12 != v15)
    {
      uint64_t v17 = SBLogDashBoard();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[CSPosterSwitcherViewController sceneHandle:didUpdateClientSettingsWithDiff:transitionContext:]();
      }

      if (v16) {
        BOOL v18 = v12 == 0;
      }
      else {
        BOOL v18 = 1;
      }
      int v19 = v18;
      if (v16 && !v12) {
        [(CSPosterSwitcherViewController *)self _updateAppearanceWithoutAnimation];
      }
      [(CSPosterSwitcherViewController *)self setClientSwitcherLayoutMode:v12];
      if (v19)
      {
        id v20 = v8;
        _UISceneSettingsDiffActionPerformChangesWithTransitionContext();
      }
    }
  }
}

uint64_t __96__CSPosterSwitcherViewController_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAppearanceWithClientLayoutMode:*(void *)(a1 + 48) previousLayoutMode:*(void *)(a1 + 56) transitionContext:*(void *)(a1 + 40)];
}

- (BOOL)sceneHandle:(id)a3 didReceiveAction:(id)a4
{
  return 0;
}

- (id)_sceneIfExists
{
  v2 = [(CSPosterSwitcherViewController *)self hostedAppSceneHandle];
  id v3 = [v2 sceneIfExists];

  return v3;
}

- (void)_evaluateInitialTransitionActivation
{
  if (![(CSPosterSwitcherViewController *)self handledInitialTransition]
    && [(CSPosterSwitcherViewController *)self _appearState] == 2)
  {
    id v6 = [(CSPosterSwitcherViewController *)self hostedAppSceneHandle];
    id v3 = [v6 sceneIfExists];
    if (v3 && [v6 isContentReady])
    {
      [(CSPosterSwitcherViewController *)self setHandledInitialTransition:1];
      id v4 = [v3 clientSettings];
      -[CSPosterSwitcherViewController setClientSwitcherLayoutMode:](self, "setClientSwitcherLayoutMode:", objc_msgSend(v4, "prui_switcherLayoutMode"));

      if (CSFeatureEnabled(1)) {
        uint64_t v5 = 2;
      }
      else {
        uint64_t v5 = 1;
      }
      [(CSPosterSwitcherViewController *)self _transitionScene:v3 toLayoutMode:v5 animated:1];
      [(CSPosterSwitcherViewController *)self _updateAppearanceWithoutAnimation];
    }
  }
}

- (void)_evaluateInitialTouchTransferActuation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  OUTLINED_FUNCTION_0_4();
  uint64_t v10 = a2;
  __int16 v11 = v8;
  uint64_t v12 = @"CSPosterSwitcherViewController.m";
  __int16 v13 = 1024;
  int v14 = 559;
  __int16 v15 = v8;
  uint64_t v16 = a3;
  _os_log_error_impl(&dword_1D839D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v9, 0x3Au);
}

uint64_t __72__CSPosterSwitcherViewController__evaluateInitialTouchTransferActuation__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 _touchIdentifier];

  return [v2 numberWithUnsignedInt:v3];
}

- (void)_transitionScene:(id)a3 toLayoutMode:(unint64_t)a4 animated:(BOOL)a5
{
  id v7 = a3;
  __int16 v8 = SBLogDashBoard();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CSPosterSwitcherViewController _transitionScene:toLayoutMode:animated:]();
  }

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__CSPosterSwitcherViewController__transitionScene_toLayoutMode_animated___block_invoke;
  v10[3] = &unk_1E6ADA160;
  BOOL v13 = a5;
  id v11 = v7;
  unint64_t v12 = a4;
  id v9 = v7;
  [v9 updateSettingsWithTransitionBlock:v10];
}

id __73__CSPosterSwitcherViewController__transitionScene_toLayoutMode_animated___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "prui_setPreferredSwitcherLayoutMode:", *(void *)(a1 + 40));
  if (*(unsigned char *)(a1 + 48) && [*(id *)(a1 + 32) isActive])
  {
    uint64_t v3 = [MEMORY[0x1E4F42790] transitionContext];
    id v4 = MEMORY[0x1D94868D0]();
    [v3 setAnimationSettings:v4];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)_updateOverlayViewSpecificationForSceneSettings:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSPosterSwitcherViewController *)self coverSheetBackgroundView];
  id v7 = [v5 layer];

  if (v7)
  {
    objc_msgSend(v4, "prui_setLockPosterOverlayLayerRenderID:", CALayerGetRenderId());
    id v6 = [v7 context];
    objc_msgSend(v4, "prui_setLockPosterOverlayLayerContextID:", objc_msgSend(v6, "contextId"));

    id v4 = v6;
  }
  else
  {
    objc_msgSend(v4, "prui_setLockPosterOverlayLayerRenderID:", 0);
    objc_msgSend(v4, "prui_setLockPosterOverlayLayerContextID:", 0);
  }
}

- (void)_updateLiveContentViewSpecificationForSceneSettings:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSPosterSwitcherViewController *)self coverSheetWallpaperView];
  id v7 = [v5 layer];

  if (v7)
  {
    objc_msgSend(v4, "prui_setLockPosterLiveContentLayerRenderID:", CALayerGetRenderId());
    id v6 = [v7 context];
    objc_msgSend(v4, "prui_setLockPosterLiveContentLayerContextID:", objc_msgSend(v6, "contextId"));

    id v4 = v6;
  }
  else
  {
    objc_msgSend(v4, "prui_setLockPosterLiveContentLayerRenderID:", 0);
    objc_msgSend(v4, "prui_setLockPosterLiveContentLayerContextID:", 0);
  }
}

- (void)_updateLiveFloatingViewSpecificationForSceneSettings:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSPosterSwitcherViewController *)self coverSheetFloatingView];
  id v7 = [v5 layer];

  if (v7)
  {
    objc_msgSend(v4, "prui_setLockPosterLiveFloatingLayerRenderID:", CALayerGetRenderId());
    id v6 = [v7 context];
    objc_msgSend(v4, "prui_setLockPosterLiveFloatingLayerContextID:", objc_msgSend(v6, "contextId"));

    id v4 = v6;
  }
  else
  {
    objc_msgSend(v4, "prui_setLockPosterLiveFloatingLayerRenderID:", 0);
    objc_msgSend(v4, "prui_setLockPosterLiveFloatingLayerContextID:", 0);
  }
}

- (void)_updateFloatingLayerInlinedForSceneSettings:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "prui_setLockPosterFloatingLayerInlined:", -[CSPosterSwitcherViewController isCoverSheetWallpaperFloatingLayerInlined](self, "isCoverSheetWallpaperFloatingLayerInlined"));
}

- (void)_updateComplicationRowHiddenForSceneSettings:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "prui_setLockPosterComplicationRowHidden:", -[CSPosterSwitcherViewController isCoverSheetComplicationRowHidden](self, "isCoverSheetComplicationRowHidden"));
}

- (void)_updateTopButtonLayoutForSceneSettings:(id)a3
{
  id v20 = a3;
  [(CSPosterSwitcherViewController *)self leadingTopButtonFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(CSPosterSwitcherViewController *)self trailingTopButtonFrame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  objc_msgSend(v20, "prui_setLeadingTopButtonFrame:", v5, v7, v9, v11);
  objc_msgSend(v20, "prui_setTrailingTopButtonFrame:", v13, v15, v17, v19);
}

- (void)_updateLockVibrancyConfigurationForSceneSettings:(id)a3
{
  id v4 = a3;
  id v5 = [(CSPosterSwitcherViewController *)self vibrancyConfiguration];
  objc_msgSend(v4, "prui_setLockVibrancyConfiguration:", v5);
}

- (void)_updateAppearanceWithClientLayoutMode:(unint64_t)a3 previousLayoutMode:(unint64_t)a4 transitionContext:(id)a5
{
  id v8 = a5;
  if (a3) {
    BOOL v9 = a4 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  char v10 = v9;
  if (v9) {
    ++self->_fullscreenTransitionAnimationCount;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __109__CSPosterSwitcherViewController__updateAppearanceWithClientLayoutMode_previousLayoutMode_transitionContext___block_invoke;
  v14[3] = &unk_1E6ADA188;
  id v15 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __109__CSPosterSwitcherViewController__updateAppearanceWithClientLayoutMode_previousLayoutMode_transitionContext___block_invoke_2;
  v12[3] = &unk_1E6ADA018;
  char v13 = v10;
  v12[4] = self;
  id v11 = v8;
  [(CSCoverSheetViewControllerBase *)self updateAppearance:v14 completion:v12];
}

id __109__CSPosterSwitcherViewController__updateAppearanceWithClientLayoutMode_previousLayoutMode_transitionContext___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    [v1 animationSettings];
  }
  else {
  v2 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.0];
  }

  return v2;
}

uint64_t __109__CSPosterSwitcherViewController__updateAppearanceWithClientLayoutMode_previousLayoutMode_transitionContext___block_invoke_2(uint64_t result)
{
  if (*(unsigned char *)(result + 40))
  {
    uint64_t v1 = result;
    uint64_t v2 = [*(id *)(result + 32) _effectiveSceneClientLayoutMode];
    uint64_t v3 = *(void **)(v1 + 32);
    if (v2)
    {
      --v3[139];
      result = *(void *)(v1 + 32);
      if (!*(void *)(result + 1112))
      {
        uint64_t v4 = *(void *)(v1 + 32);
        return [(id)result updateAppearanceForController:v4];
      }
    }
    else
    {
      return [v3 _dismissEntirely];
    }
  }
  return result;
}

- (void)_updateAppearanceWithoutAnimation
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __67__CSPosterSwitcherViewController__updateAppearanceWithoutAnimation__block_invoke;
  v2[3] = &unk_1E6AD87F8;
  v2[4] = self;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v2];
}

uint64_t __67__CSPosterSwitcherViewController__updateAppearanceWithoutAnimation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateAppearance:&__block_literal_global_49];
}

uint64_t __67__CSPosterSwitcherViewController__updateAppearanceWithoutAnimation__block_invoke_2()
{
  return [MEMORY[0x1E4F4F680] settingsWithDuration:0.0];
}

- (unint64_t)_effectiveSceneClientLayoutMode
{
  uint64_t v2 = [(CSPosterSwitcherViewController *)self _sceneIfExists];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 clientSettings];
    unint64_t v5 = objc_msgSend(v4, "prui_switcherLayoutMode");
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)_dismissTier:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [(CSPosterSwitcherViewController *)self _sceneIfExists];
  if ([v8 contentState] == 2)
  {
    unint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
    double v6 = [MEMORY[0x1E4F92470] actionWithAnimation:v3];
    double v7 = [v5 setWithObject:v6];
    [v8 sendActions:v7];
  }
  else
  {
    [(CSPosterSwitcherViewController *)self _dismissEntirely];
  }
}

- (void)_sendDismissEntirelyActionToScene
{
  id v5 = [(CSPosterSwitcherViewController *)self _sceneIfExists];
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  BOOL v3 = [MEMORY[0x1E4F92468] actionActivatingCurrentPoster:0];
  uint64_t v4 = [v2 setWithObject:v3];
  [v5 sendActions:v4];
}

- (void)_dismissEntirely
{
  [(CSPosterSwitcherViewController *)self _sendDismissEntirelyActionToScene];
  if ([(CSPosterSwitcherViewController *)self hasEverAppeared])
  {
    id v3 = +[CSAction actionWithType:1];
    [(CSCoverSheetViewControllerBase *)self sendAction:v3];
  }
  else
  {
    [(CSPosterSwitcherViewController *)self _applicationHosterDidInvalidate];
  }
}

- (CSTraitAwareAppHostConfiguring)appHostConfiguring
{
  return self->_appHostConfiguring;
}

- (NSArray)activatingTouches
{
  return self->_activatingTouches;
}

- (void)setActivatingTouches:(id)a3
{
}

- (UIView)coverSheetBackgroundView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetBackgroundView);

  return (UIView *)WeakRetained;
}

- (UIView)coverSheetWallpaperView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetWallpaperView);

  return (UIView *)WeakRetained;
}

- (UIView)coverSheetFloatingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetFloatingView);

  return (UIView *)WeakRetained;
}

- (BOOL)isCoverSheetWallpaperFloatingLayerInlined
{
  return self->_coverSheetWallpaperFloatingLayerInlined;
}

- (BOOL)isCoverSheetComplicationRowHidden
{
  return self->_coverSheetComplicationRowHidden;
}

- (UIWindow)targetWindow
{
  return self->_targetWindow;
}

- (void)setTargetWindow:(id)a3
{
}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  return self->_vibrancyConfiguration;
}

- (CGRect)leadingTopButtonFrame
{
  double x = self->_leadingTopButtonFrame.origin.x;
  double y = self->_leadingTopButtonFrame.origin.y;
  double width = self->_leadingTopButtonFrame.size.width;
  double height = self->_leadingTopButtonFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)trailingTopButtonFrame
{
  double x = self->_trailingTopButtonFrame.origin.x;
  double y = self->_trailingTopButtonFrame.origin.y;
  double width = self->_trailingTopButtonFrame.size.width;
  double height = self->_trailingTopButtonFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)handledInitialTransition
{
  return self->_handledInitialTransition;
}

- (void)setHandledInitialTransition:(BOOL)a3
{
  self->_handledInitialTransition = a3;
}

- (BOOL)hasTransferredInitialTouches
{
  return self->_hasTransferredInitialTouches;
}

- (void)setHasTransferredInitialTouches:(BOOL)a3
{
  self->_hasTransferredInitialTouches = a3;
}

- (BOOL)hasCommittedInContentReadyState
{
  return self->_hasCommittedInContentReadyState;
}

- (void)setHasCommittedInContentReadyState:(BOOL)a3
{
  self->_hasCommittedInContentReadyState = a3;
}

- (BOOL)hasEverAppeared
{
  return self->_hasEverAppeared;
}

- (void)setHasEverAppeared:(BOOL)a3
{
  self->_hasEverAppeared = a3;
}

- (unint64_t)fullscreenTransitionAnimationCount
{
  return self->_fullscreenTransitionAnimationCount;
}

- (void)setFullscreenTransitionAnimationCount:(unint64_t)a3
{
  self->_unint64_t fullscreenTransitionAnimationCount = a3;
}

- (unint64_t)clientSwitcherLayoutMode
{
  return self->_clientSwitcherLayoutMode;
}

- (void)setClientSwitcherLayoutMode:(unint64_t)a3
{
  self->_clientSwitcherLayoutMode = a3;
}

- (PRUISSwitcherSceneClientSettingsDiffInspector)sceneClientSettingsDiffInspector
{
  return self->_sceneClientSettingsDiffInspector;
}

- (UIView)scaleView
{
  return self->_scaleView;
}

- (SBApplicationHosting)applicationHoster
{
  return self->_applicationHoster;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (CSTraitsAwareOrientedAppHosting)traitsAwareViewController
{
  return self->_traitsAwareViewController;
}

- (void)setTraitsAwareViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitsAwareViewController, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_applicationHoster, 0);
  objc_storeStrong((id *)&self->_scaleView, 0);
  objc_storeStrong((id *)&self->_sceneClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_vibrancyConfiguration, 0);
  objc_storeStrong((id *)&self->_targetWindow, 0);
  objc_destroyWeak((id *)&self->_coverSheetFloatingView);
  objc_destroyWeak((id *)&self->_coverSheetWallpaperView);
  objc_destroyWeak((id *)&self->_coverSheetBackgroundView);
  objc_storeStrong((id *)&self->_activatingTouches, 0);

  objc_storeStrong((id *)&self->_appHostConfiguring, 0);
}

- (void)setAppHostConfiguring:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  double v6 = (objc_class *)objc_opt_class();
  double v7 = NSStringFromClass(v6);
  OUTLINED_FUNCTION_0_4();
  uint64_t v10 = a2;
  __int16 v11 = v8;
  double v12 = @"CSPosterSwitcherViewController.m";
  __int16 v13 = 1024;
  int v14 = 117;
  __int16 v15 = v8;
  uint64_t v16 = a3;
  _os_log_error_impl(&dword_1D839D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v9, 0x3Au);
}

- (void)aggregateAppearance:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sceneHandle:didUpdateClientSettingsWithDiff:transitionContext:.cold.1()
{
  v0 = NSStringFromPRUISwitcherLayoutMode();
  OUTLINED_FUNCTION_0_3(&dword_1D839D000, v1, v2, "Poster Switcher reflecting client layout mode update to: %@", v3, v4, v5, v6, 2u);
}

- (void)_transitionScene:toLayoutMode:animated:.cold.1()
{
  v0 = NSStringFromPRUISwitcherLayoutMode();
  OUTLINED_FUNCTION_0_3(&dword_1D839D000, v1, v2, "Poster Switcher is updating preferred layout mode to: %@", v3, v4, v5, v6, 2u);
}

@end