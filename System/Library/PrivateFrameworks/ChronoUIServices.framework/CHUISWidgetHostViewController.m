@interface CHUISWidgetHostViewController
+ (NSArray)viewControllers;
+ (id)_compatibilityMetrics;
- (BLSHBacklightSceneHostEnvironment)backlightHostEnvironment;
- (BOOL)_canLiveSnapshot;
- (BOOL)_canShowWhileLocked;
- (BOOL)_hasScene;
- (BOOL)_isAppearingOrAppeared;
- (BOOL)_isPersistedSnapshotContentVisible;
- (BOOL)_isVibrancyEffectEnabled;
- (BOOL)_shouldBeEffectivelyLocked;
- (BOOL)areAnimationsPaused;
- (BOOL)canAppearInSecureEnvironment;
- (BOOL)containsInteractiveControls;
- (BOOL)disableViewTransitionAnimations;
- (BOOL)drawSystemBackgroundMaterialIfNecessary;
- (BOOL)isContentPaused;
- (BOOL)isInteractionDisabled;
- (BOOL)metricsDefineSize;
- (BOOL)prefersUnredactedContentInLowLuminanceEnvironment;
- (BOOL)shouldShareTouchesWithHost;
- (BOOL)shouldVisibleEntrySnapshot;
- (BOOL)showsWidgetLabel;
- (BOOL)supportsLowLuminance;
- (BOOL)usesSystemBackgroundMaterial;
- (BOOL)wantsBaseContentTouchEvents;
- (BSUIVibrancyConfiguration)vibrancyConfiguration;
- (CGRect)visibleBounds;
- (CHSInlineTextParameters)inlineTextParameters;
- (CHSScreenshotManager)_screenshotManager;
- (CHSWidget)widget;
- (CHSWidgetMetrics)metrics;
- (CHSWidgetRenderScheme)renderScheme;
- (CHSWidgetTintParameters)tintParameters;
- (CHUISWidgetHostViewController)initWithWidget:(id)a3 metrics:(id)a4 widgetConfigurationIdentifier:(id)a5;
- (CHUISWidgetHostViewController)initWithWidget:(id)a3 metrics:(id)a4 widgetConfigurationIdentifier:(id)a5 extensionProvider:(id)a6 sceneWorkspace:(id)a7 screenshotManager:(id)a8 preferences:(id)a9 keybag:(id)a10;
- (CHUISWidgetHostViewControllerDelegate)delegate;
- (CHUISWidgetSceneClientSettings)clientSettings;
- (CHUISWidgetVisibilitySettings)_visibilitySettings;
- (FBScene)_scene;
- (NSString)widgetConfigurationIdentifier;
- (UIScenePresenter)_scenePresenter;
- (UIView)_liveSceneSnapshotView;
- (UIView)_liveSceneView;
- (UIView)_staticCAARSnapshotView;
- (UIView)_staticImageSnapshotView;
- (UIView)_staticSnapshotContainerView;
- (UIView)snapshotView;
- (double)_currentDisplayScale;
- (double)_detachedSceneTimerInterval;
- (double)_effectiveCornerRadius;
- (double)_effectiveViewCornerRadius;
- (id)_cachedSceneLogDigest;
- (id)_containerView;
- (id)_effectiveBackgroundColor;
- (id)_liveSnapshotView;
- (id)_logDigest;
- (id)_newPersistedSnapshotView;
- (id)_persistedSnapshotContext;
- (id)_persistedWidgetSnapshotViewContainer;
- (id)_snapshotImageFromURL:(id)a3;
- (id)_snapshotViewIgnoringVibrancyEffect:(BOOL)a3;
- (id)_stateDumpDescription;
- (id)additionalSnapshotPresentationContext;
- (id)cancelTouchesForCurrentEventInHostedContent;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)handleActions:(id)a3;
- (id)sceneSpecification;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)userInfo;
- (int)_actualBackgroundViewMode;
- (int)_expectedBackgroundViewMode;
- (unint64_t)_inSecureEnvironmentTriState;
- (unint64_t)backgroundViewPolicy;
- (unint64_t)clipBehavior;
- (unint64_t)colorScheme;
- (unint64_t)contentType;
- (unint64_t)presentationMode;
- (unint64_t)visibility;
- (unint64_t)widgetPriority;
- (void)__evaluateDetachedSceneTimerForReason:(id)a3;
- (void)_applyLiveSnapshotContentsFromSnapshot:(id)a3;
- (void)_applySecurityPolicyToLayer:(id)a3;
- (void)_applySecurityPolicyToLayer:(id)a3 allowsPrivacySensitiveContent:(BOOL)a4;
- (void)_clearTouchDeliveryPolicies;
- (void)_createWidgetSnapshotViews;
- (void)_ensureAndEvaluateSnapshotView;
- (void)_evaluateEffectiveInSecureEnvironmentForReason:(id)a3;
- (void)_evaluateEffectivePresentationMode;
- (void)_executeSceneContentReadyOperations;
- (void)_hideSnapshotViewsAnimated:(BOOL)a3;
- (void)_hideSnapshotViewsAnimated:(BOOL)a3 forceCompleteTeardown:(BOOL)a4;
- (void)_implicitSetRenderScheme:(id)a3;
- (void)_invalidateDetachedSceneTimerForReason:(id)a3;
- (void)_invalidateDetachedSceneTimerForReason:(id)a3 ignoreLogging:(BOOL)a4;
- (void)_modifyVisibilitySettings:(id)a3;
- (void)_newPersistedSnapshotView;
- (void)_resetLogDigests;
- (void)_scheduleEvaluationOfDetachedSceneTimerForReason:(id)a3;
- (void)_setBackgroundViewMode:(int)a3;
- (void)_setCanAppearInSecureEnvironment:(BOOL)a3 force:(BOOL)a4;
- (void)_setDetachedSceneTimerInterval:(double)a3;
- (void)_setEffectivePresentationMode:(unint64_t)a3;
- (void)_setEffectivePresentationMode:(unint64_t)a3 forceExistingRebuild:(BOOL)a4;
- (void)_setInSecureEnvironment:(unint64_t)a3 forReason:(id)a4;
- (void)_setScene:(id)a3;
- (void)_setScenePresenter:(id)a3;
- (void)_setScreenshotManager:(id)a3;
- (void)_setVisibilitySettings:(id)a3;
- (void)_tearDownScene;
- (void)_updateBackgroundMaterialAndColor;
- (void)_updateDescriptorIfNecessary;
- (void)_updatePersistedSnapshotContent;
- (void)_updatePersistedSnapshotContentIfNecessary;
- (void)_updateSceneToForeground:(BOOL)a3;
- (void)_updateSnapshotDebugLabelText:(id)a3;
- (void)_updateTouchDeliveryPolicies;
- (void)_updateVibrancyEffectView;
- (void)_updateViewsCornerRadius;
- (void)cancelTouchesForCurrentEventInHostedContent;
- (void)dealloc;
- (void)ensureContentWithTimeout:(double)a3 completion:(id)a4;
- (void)extensionsDidChangeForExtensionProvider:(id)a3;
- (void)invalidate;
- (void)keybagStateDidChange:(id)a3;
- (void)loadView;
- (void)log:(id)a3;
- (void)logDebug:(id)a3;
- (void)modifySceneSettings:(id)a3;
- (void)prewarmContent;
- (void)requestLaunch;
- (void)scene:(id)a3 didReceiveActions:(id)a4;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneContentStateDidChange:(id)a3;
- (void)sceneDidDeactivate:(id)a3 withError:(id)a4;
- (void)sceneDidUpdateClientSettingsWithDiff:(id)a3 oldClientSettings:(id)a4 newClientSettings:(id)a5 transitionContext:(id)a6;
- (void)setAnimationsPaused:(BOOL)a3;
- (void)setBackgroundViewPolicy:(unint64_t)a3;
- (void)setCanAppearInSecureEnvironment:(BOOL)a3;
- (void)setClipBehavior:(unint64_t)a3;
- (void)setColorScheme:(unint64_t)a3;
- (void)setContentPaused:(BOOL)a3;
- (void)setContentType:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableViewTransitionAnimations:(BOOL)a3;
- (void)setDrawSystemBackgroundMaterialIfNecessary:(BOOL)a3;
- (void)setInlineTextParameters:(id)a3;
- (void)setInteractionDisabled:(BOOL)a3;
- (void)setMetricsDefineSize:(BOOL)a3;
- (void)setPrefersUnredactedContentInLowLuminanceEnvironment:(BOOL)a3;
- (void)setPresentationMode:(unint64_t)a3;
- (void)setRenderScheme:(id)a3;
- (void)setShouldShareTouchesWithHost:(BOOL)a3;
- (void)setShowsWidgetLabel:(BOOL)a3;
- (void)setSupportsLowLuminance:(BOOL)a3;
- (void)setTintParameters:(id)a3;
- (void)setTintParameters:(id)a3 fencingAnimations:(BOOL)a4;
- (void)setUserInfo:(id)a3;
- (void)setUsesOpaqueContent:(BOOL)a3;
- (void)setVibrancyConfiguration:(id)a3;
- (void)setVisibility:(unint64_t)a3;
- (void)setVisibleBounds:(CGRect)a3;
- (void)setVisibleEntryShouldSnapshot:(BOOL)a3;
- (void)setWantsBaseContentTouchEvents:(BOOL)a3;
- (void)setWidget:(id)a3;
- (void)setWidgetPriority:(unint64_t)a3;
- (void)snapshotContentWithTimeout:(double)a3 queue:(id)a4 completion:(id)a5;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CHUISWidgetHostViewController

- (CHUISWidgetHostViewController)initWithWidget:(id)a3 metrics:(id)a4 widgetConfigurationIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (CHUISSharedExtensionProvider___once != -1) {
    dispatch_once(&CHUISSharedExtensionProvider___once, &__block_literal_global_880);
  }
  id v11 = (id)CHUISSharedExtensionProvider___instance;
  v12 = CHUISSceneWorkspace();
  v13 = [MEMORY[0x1E4F58D90] sharedManager];
  v14 = +[CHUISPreferences sharedInstance];
  v15 = +[CHUISKeybag sharedInstance];
  v16 = [(CHUISWidgetHostViewController *)self initWithWidget:v8 metrics:v9 widgetConfigurationIdentifier:v10 extensionProvider:v11 sceneWorkspace:v12 screenshotManager:v13 preferences:v14 keybag:v15];

  return v16;
}

- (CHUISWidgetHostViewController)initWithWidget:(id)a3 metrics:(id)a4 widgetConfigurationIdentifier:(id)a5 extensionProvider:(id)a6 sceneWorkspace:(id)a7 screenshotManager:(id)a8 preferences:(id)a9 keybag:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v42 = a5;
  id v41 = a6;
  id v40 = a7;
  id v39 = a8;
  id v38 = a9;
  id v37 = a10;
  v45.receiver = self;
  v45.super_class = (Class)CHUISWidgetHostViewController;
  v18 = [(CHUISWidgetHostViewController *)&v45 initWithNibName:0 bundle:0];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_sceneWorkspace, a7);
    objc_storeStrong((id *)&v19->_preferences, a9);
    uint64_t v20 = [v16 copy];
    widget = v19->_widget;
    v19->_widget = (CHSWidget *)v20;

    uint64_t v22 = [v17 copy];
    metrics = v19->_metrics;
    v19->_metrics = (CHSWidgetMetrics *)v22;

    objc_storeStrong((id *)&v19->_widgetConfigurationIdentifier, a5);
    v19->_contentType = 0;
    v19->_colorScheme = 0;
    v19->_requestedPresentationMode = 1;
    v19->_visibleEntryShouldSnapshot = 1;
    v19->_animationsPaused = 0;
    v19->_contentPaused = 0;
    v24 = CHUISLogViewController();
    v19->_signpostID = os_signpost_id_generate(v24);

    objc_storeStrong((id *)&v19->_screenshotManager, a8);
    v19->_drawSystemBackgroundMaterialIfNecessary = 1;
    objc_storeStrong((id *)&v19->_extensionProvider, a6);
    v19->_detachedSceneTimerInterval = 30.0;
    uint64_t v25 = [MEMORY[0x1E4F1CA48] array];
    detachedSceneTimerEvaluationReasons = v19->_detachedSceneTimerEvaluationReasons;
    v19->_detachedSceneTimerEvaluationReasons = (NSMutableArray *)v25;

    objc_storeStrong((id *)&v19->_keybag, a10);
    v19->_inSecureEnvironmentTriState = 0;
    tintParameters = v19->_tintParameters;
    v19->_tintParameters = 0;

    v19->_metricsDefineSize = 1;
    v19->_widgetPriority = 0;
    v19->_prefersUnredactedContentInLowLuminanceEnvironment = 0;
    [v16 family];
    v19->_clipBehavior = CHSWidgetFamilyIsAccessory();
    [v16 family];
    uint64_t v28 = [objc_alloc(MEMORY[0x1E4F58EE0]) initWithRenderingMode:0 backgroundViewPolicy:CHSWidgetFamilyIsAccessory()];
    renderScheme = v19->_renderScheme;
    v19->_renderScheme = (CHSWidgetRenderScheme *)v28;

    [(CHUISWidgetHostViewController *)v19 _resetLogDigests];
    objc_initWeak(&location, v19);
    id v30 = MEMORY[0x1E4F14428];
    v31 = objc_msgSend(NSString, "stringWithFormat:", @"CHUISWidgetHostViewController - %p", v19);
    objc_copyWeak(&v43, &location);
    uint64_t v32 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureAssertion = v19->_stateCaptureAssertion;
    v19->_stateCaptureAssertion = (BSInvalidatable *)v32;

    v34 = CHUISLogViewController();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      -[CHUISWidgetHostViewController initWithWidget:metrics:widgetConfigurationIdentifier:extensionProvider:sceneWorkspace:screenshotManager:preferences:keybag:]();
    }

    [(CHUISWidgetHostViewController *)v19 _updateDescriptorIfNecessary];
    [(CHUISWidgetHostViewController *)v19 _evaluateEffectivePresentationMode];
    [(CHUISWidgetHostViewController *)v19 _updateBackgroundMaterialAndColor];
    [(CHUISWidgetHostViewController *)v19 _setCanAppearInSecureEnvironment:v19->_canAppearInSecureEnvironment force:1];
    [(CHSWidgetExtensionProvider *)v19->_extensionProvider registerObserver:v19];
    v35 = +[_CHUISWidgetHostViewControllerCollection sharedInstance];
    [v35 noteCreated:v19];

    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
  }

  return v19;
}

id __156__CHUISWidgetHostViewController_initWithWidget_metrics_widgetConfigurationIdentifier_extensionProvider_sceneWorkspace_screenshotManager_preferences_keybag___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _stateDumpDescription];

  return v2;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_1BC3F1000, v0, v1, "[%p-%{public}@] Destroyed.", v2, v3, v4, v5, v6);
}

+ (NSArray)viewControllers
{
  uint64_t v2 = +[_CHUISWidgetHostViewControllerCollection sharedInstance];
  uint64_t v3 = [v2 viewControllers];

  return (NSArray *)v3;
}

- (void)prewarmContent
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1BC3F1000, v0, v1, "Unable to prewarm content on an invalidated widget view controller.", v2, v3, v4, v5, v6);
}

- (void)requestLaunch
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1BC3F1000, v0, v1, "Unable to select an invalidated widget view controller.", v2, v3, v4, v5, v6);
}

- (id)userInfo
{
  BSDispatchQueueAssertMain();
  id userInfo = self->_userInfo;

  return userInfo;
}

- (void)setUserInfo:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id userInfo = self->_userInfo;
  self->_id userInfo = v4;
}

- (CHSWidget)widget
{
  BSDispatchQueueAssertMain();
  widget = self->_widget;

  return widget;
}

- (void)setWidget:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  if (self->_invalidated)
  {
    uint64_t v5 = CHUISLogViewController();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[CHUISWidgetHostViewController setWidget:]();
    }
  }
  else
  {
    uint64_t v5 = [(CHUISWidgetHostViewController *)self widget];
    uint8_t v6 = (CHSWidget *)[v4 copy];
    widget = self->_widget;
    self->_widget = v6;

    [(CHUISWidgetHostViewController *)self _resetLogDigests];
    id v8 = CHUISLogViewController();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      cachedSceneLogDigest = self->_cachedSceneLogDigest;
      *(_DWORD *)buf = 134218242;
      v19 = self;
      __int16 v20 = 2114;
      v21 = cachedSceneLogDigest;
      _os_log_impl(&dword_1BC3F1000, v8, OS_LOG_TYPE_DEFAULT, "[%p] New widget set: %{public}@", buf, 0x16u);
    }

    [(CHUISWidgetHostViewController *)self _updateDescriptorIfNecessary];
    if ([v5 matchesPersonality:v4]
      && (uint64_t v10 = -[NSObject family](v5, "family"), v10 == [v4 family]))
    {
      if (self->_scene)
      {
        id v11 = CHUISLogViewController();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          scene = self->_scene;
          v13 = self->_widget;
          *(_DWORD *)buf = 134218498;
          v19 = self;
          __int16 v20 = 2048;
          v21 = scene;
          __int16 v22 = 2114;
          v23 = v13;
          _os_log_impl(&dword_1BC3F1000, v11, OS_LOG_TYPE_DEFAULT, "[%p] Updating scene settings on scene (%p) with new widget: %{public}@", buf, 0x20u);
        }

        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __43__CHUISWidgetHostViewController_setWidget___block_invoke;
        v16[3] = &unk_1E62AF620;
        id v17 = v4;
        [(CHUISWidgetHostViewController *)self modifySceneSettings:v16];
      }
    }
    else
    {
      v14 = CHUISLogViewController();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v19 = self;
        _os_log_impl(&dword_1BC3F1000, v14, OS_LOG_TYPE_DEFAULT, "[%p] Tearing down scene for new widget set, and re-activating", buf, 0xCu);
      }

      unint64_t effectivePresentationMode = self->_effectivePresentationMode;
      [(CHUISWidgetHostViewController *)self _tearDownScene];
      [(CHUISWidgetHostViewController *)self _setEffectivePresentationMode:0];
      [(CHUISWidgetHostViewController *)self _setEffectivePresentationMode:effectivePresentationMode];
    }
  }
}

uint64_t __43__CHUISWidgetHostViewController_setWidget___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

- (unint64_t)presentationMode
{
  return self->_requestedPresentationMode;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  if (self->_contentType != a3)
  {
    self->_contentType = a3;
    uint64_t v5 = CHUISLogViewController();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      cachedSceneLogDigest = self->_cachedSceneLogDigest;
      v7 = @"preview";
      if (!a3) {
        v7 = @"timeline";
      }
      id v8 = v7;
      *(_DWORD *)buf = 134218498;
      id v11 = self;
      __int16 v12 = 2114;
      v13 = cachedSceneLogDigest;
      __int16 v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_1BC3F1000, v5, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Content type changed to %{public}@", buf, 0x20u);
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__CHUISWidgetHostViewController_setContentType___block_invoke;
    v9[3] = &__block_descriptor_40_e78___UIApplicationSceneTransitionContext_16__0__CHUISMutableWidgetSceneSettings_8l;
    v9[4] = a3;
    [(CHUISWidgetHostViewController *)self modifySceneSettings:v9];
  }
}

uint64_t __48__CHUISWidgetHostViewController_setContentType___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

- (unint64_t)colorScheme
{
  return self->_colorScheme;
}

- (void)setColorScheme:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  if (self->_colorScheme != a3)
  {
    self->_colorScheme = a3;
    materialView = self->_materialView;
    uint8_t v6 = [(CHUISWidgetHostViewController *)self _effectiveBackgroundColor];
    [(UIVisualEffectView *)materialView setBackgroundColor:v6];

    v7 = CHUISLogViewController();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      cachedSceneLogDigest = self->_cachedSceneLogDigest;
      id v9 = NSStringFromCHSColorScheme();
      *(_DWORD *)buf = 134218498;
      __int16 v12 = self;
      __int16 v13 = 2114;
      __int16 v14 = cachedSceneLogDigest;
      __int16 v15 = 2114;
      uint64_t v16 = v9;
      _os_log_impl(&dword_1BC3F1000, v7, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Color scheme changed to %{public}@", buf, 0x20u);
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__CHUISWidgetHostViewController_setColorScheme___block_invoke;
    v10[3] = &__block_descriptor_40_e78___UIApplicationSceneTransitionContext_16__0__CHUISMutableWidgetSceneSettings_8l;
    v10[4] = a3;
    [(CHUISWidgetHostViewController *)self modifySceneSettings:v10];
  }
}

uint64_t __48__CHUISWidgetHostViewController_setColorScheme___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

- (BOOL)canAppearInSecureEnvironment
{
  return self->_canAppearInSecureEnvironment;
}

- (void)setCanAppearInSecureEnvironment:(BOOL)a3
{
}

- (BOOL)prefersUnredactedContentInLowLuminanceEnvironment
{
  return self->_prefersUnredactedContentInLowLuminanceEnvironment;
}

- (void)setPrefersUnredactedContentInLowLuminanceEnvironment:(BOOL)a3
{
  BSDispatchQueueAssertMain();
  if ((BSEqualBools() & 1) == 0)
  {
    self->_prefersUnredactedContentInLowLuminanceEnvironment = a3;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __86__CHUISWidgetHostViewController_setPrefersUnredactedContentInLowLuminanceEnvironment___block_invoke;
    v5[3] = &__block_descriptor_33_e78___UIApplicationSceneTransitionContext_16__0__CHUISMutableWidgetSceneSettings_8l;
    BOOL v6 = a3;
    [(CHUISWidgetHostViewController *)self modifySceneSettings:v5];
  }
}

uint64_t __86__CHUISWidgetHostViewController_setPrefersUnredactedContentInLowLuminanceEnvironment___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

- (BOOL)supportsLowLuminance
{
  return self->_supportsLowLuminance;
}

- (void)setSupportsLowLuminance:(BOOL)a3
{
  BSDispatchQueueAssertMain();
  if ((BSEqualBools() & 1) == 0)
  {
    self->_supportsLowLuminance = a3;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __57__CHUISWidgetHostViewController_setSupportsLowLuminance___block_invoke;
    v5[3] = &__block_descriptor_33_e78___UIApplicationSceneTransitionContext_16__0__CHUISMutableWidgetSceneSettings_8l;
    BOOL v6 = a3;
    [(CHUISWidgetHostViewController *)self modifySceneSettings:v5];
  }
}

uint64_t __57__CHUISWidgetHostViewController_setSupportsLowLuminance___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

- (void)setPresentationMode:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  if (self->_invalidated)
  {
    id v9 = CHUISLogViewController();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[CHUISWidgetHostViewController setPresentationMode:]();
    }
  }
  else if (self->_requestedPresentationMode != a3)
  {
    self->_requestedPresentationMode = a3;
    uint64_t v5 = CHUISLogViewController();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      cachedSceneLogDigest = self->_cachedSceneLogDigest;
      unint64_t v7 = self->_requestedPresentationMode - 1;
      if (v7 > 2) {
        id v8 = @"none";
      }
      else {
        id v8 = off_1E62AFBF8[v7];
      }
      int v10 = 134218498;
      id v11 = self;
      __int16 v12 = 2114;
      __int16 v13 = cachedSceneLogDigest;
      __int16 v14 = 2114;
      __int16 v15 = v8;
      _os_log_impl(&dword_1BC3F1000, v5, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Requested mode changed to %{public}@.", (uint8_t *)&v10, 0x20u);
    }

    [(CHUISWidgetHostViewController *)self _evaluateEffectivePresentationMode];
  }
}

- (unint64_t)visibility
{
  BSDispatchQueueAssertMain();
  unint64_t result = (unint64_t)self->_visibilitySettings;
  if (result)
  {
    if ([(id)result isSettled]) {
      return 2;
    }
    else {
      return 1;
    }
  }
  return result;
}

- (void)setVisibility:(unint64_t)a3
{
  BSDispatchQueueAssertMain();
  if (self->_invalidated)
  {
    uint64_t v5 = CHUISLogViewController();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[CHUISWidgetHostViewController setVisibility:]();
    }
  }
  else if (a3 - 1 >= 2)
  {
    if (!a3)
    {
      [(CHUISWidgetHostViewController *)self _setVisibilitySettings:0];
    }
  }
  else if (self->_visibilitySettings)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__CHUISWidgetHostViewController_setVisibility___block_invoke;
    v7[3] = &__block_descriptor_33_e46_v16__0__CHUISMutableWidgetVisibilitySettings_8l;
    BOOL v8 = a3 == 2;
    [(CHUISWidgetHostViewController *)self _modifyVisibilitySettings:v7];
  }
  else
  {
    BOOL v6 = objc_alloc_init(CHUISMutableWidgetVisibilitySettings);
    [(CHUISMutableWidgetVisibilitySettings *)v6 setSettled:a3 == 2];
    -[CHUISMutableWidgetVisibilitySettings setVisibleBounds:](v6, "setVisibleBounds:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    [(CHUISWidgetHostViewController *)self _setVisibilitySettings:v6];
  }
}

uint64_t __47__CHUISWidgetHostViewController_setVisibility___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSettled:*(unsigned __int8 *)(a1 + 32)];
}

- (CGRect)visibleBounds
{
  BSDispatchQueueAssertMain();
  visibilitySettings = self->_visibilitySettings;
  if (visibilitySettings)
  {
    [(CHUISWidgetVisibilitySettings *)visibilitySettings visibleBounds];
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DB20];
    double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)setVisibleBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  BSDispatchQueueAssertMain();
  if (self->_invalidated)
  {
    BOOL v8 = CHUISLogViewController();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[CHUISWidgetHostViewController setVisibleBounds:]();
    }
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50__CHUISWidgetHostViewController_setVisibleBounds___block_invoke;
    v9[3] = &__block_descriptor_64_e46_v16__0__CHUISMutableWidgetVisibilitySettings_8l;
    *(CGFloat *)&v9[4] = x;
    *(CGFloat *)&void v9[5] = y;
    *(CGFloat *)&v9[6] = width;
    *(CGFloat *)&v9[7] = height;
    [(CHUISWidgetHostViewController *)self _modifyVisibilitySettings:v9];
  }
}

uint64_t __50__CHUISWidgetHostViewController_setVisibleBounds___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setVisibleBounds:", a1[4], a1[5], a1[6], a1[7]);
}

- (BOOL)areAnimationsPaused
{
  return self->_animationsPaused;
}

- (void)setAnimationsPaused:(BOOL)a3
{
  BOOL v3 = a3;
  BSDispatchQueueAssertMain();
  if (self->_invalidated)
  {
    double v6 = CHUISLogViewController();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[CHUISWidgetHostViewController setAnimationsPaused:]();
    }
  }
  else if (self->_animationsPaused != v3)
  {
    self->_animationsPaused = v3;
    if (self->_scene)
    {
      double v5 = CHUISLogViewController();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        -[CHUISWidgetHostViewController setAnimationsPaused:]();
      }

      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __53__CHUISWidgetHostViewController_setAnimationsPaused___block_invoke;
      v7[3] = &__block_descriptor_33_e78___UIApplicationSceneTransitionContext_16__0__CHUISMutableWidgetSceneSettings_8l;
      BOOL v8 = v3;
      [(CHUISWidgetHostViewController *)self modifySceneSettings:v7];
    }
  }
}

uint64_t __53__CHUISWidgetHostViewController_setAnimationsPaused___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

- (BOOL)isContentPaused
{
  return self->_contentPaused;
}

- (void)setContentPaused:(BOOL)a3
{
  BOOL v3 = a3;
  BSDispatchQueueAssertMain();
  if (self->_invalidated)
  {
    double v6 = CHUISLogViewController();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[CHUISWidgetHostViewController setContentPaused:]();
    }
  }
  else if (self->_contentPaused != v3)
  {
    self->_contentPaused = v3;
    if (self->_scene)
    {
      double v5 = CHUISLogViewController();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        -[CHUISWidgetHostViewController setContentPaused:]();
      }

      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __50__CHUISWidgetHostViewController_setContentPaused___block_invoke;
      v7[3] = &__block_descriptor_33_e78___UIApplicationSceneTransitionContext_16__0__CHUISMutableWidgetSceneSettings_8l;
      BOOL v8 = v3;
      [(CHUISWidgetHostViewController *)self modifySceneSettings:v7];
    }
  }
}

uint64_t __50__CHUISWidgetHostViewController_setContentPaused___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

- (CHSWidgetTintParameters)tintParameters
{
  BSDispatchQueueAssertMain();
  tintParameters = self->_tintParameters;

  return tintParameters;
}

- (void)setTintParameters:(id)a3
{
}

- (void)setTintParameters:(id)a3 fencingAnimations:(BOOL)a4
{
  id v6 = a3;
  BSDispatchQueueAssertMain();
  if (self->_invalidated)
  {
    __int16 v14 = CHUISLogViewController();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[CHUISWidgetHostViewController setTintParameters:fencingAnimations:]();
    }
  }
  else if ((BSEqualObjects() & 1) == 0)
  {
    double v7 = (CHSWidgetTintParameters *)[v6 copy];
    tintParameters = self->_tintParameters;
    self->_tintParameters = v7;

    if (!self->_didSetRenderSchemeExplicitly)
    {
      id v9 = (void *)[(CHSWidgetRenderScheme *)self->_renderScheme mutableCopy];
      int v10 = self->_tintParameters;
      if (v10) {
        uint64_t v11 = [(CHSWidgetTintParameters *)v10 effectiveRenderingMode];
      }
      else {
        uint64_t v11 = 0;
      }
      [v9 setRenderingMode:v11];
      [(CHUISWidgetHostViewController *)self _implicitSetRenderScheme:v9];
    }
    if (self->_scene)
    {
      __int16 v12 = CHUISLogViewController();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[CHUISWidgetHostViewController setTintParameters:fencingAnimations:]();
      }

      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __69__CHUISWidgetHostViewController_setTintParameters_fencingAnimations___block_invoke;
      v15[3] = &unk_1E62AF7D8;
      v15[4] = self;
      BOOL v16 = a4;
      [(CHUISWidgetHostViewController *)self modifySceneSettings:v15];
    }
    else
    {
      __int16 v13 = CHUISLogViewController();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[CHUISWidgetHostViewController setTintParameters:fencingAnimations:]();
      }
    }
    [(CHUISWidgetHostViewController *)self _updateVibrancyEffectView];
    [(CHUISWidgetHostViewController *)self _updatePersistedSnapshotContentIfNecessary];
  }
}

id __69__CHUISWidgetHostViewController_setTintParameters_fencingAnimations___block_invoke(uint64_t a1, void *a2)
{
  [a2 setTintParameters:*(void *)(*(void *)(a1 + 32) + 1344)];
  if (*(unsigned char *)(a1 + 40))
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4FB1458]);
    double v4 = [MEMORY[0x1E4FB1B70] _synchronizedDrawingFence];
    [v3 setAnimationFence:v4];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)setVibrancyConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_vibrancyConfiguration, a3);

  [(CHUISWidgetHostViewController *)self _updateVibrancyEffectView];
}

- (CHSInlineTextParameters)inlineTextParameters
{
  BSDispatchQueueAssertMain();
  id v3 = (void *)[(CHSInlineTextParameters *)self->_inlineTextParameters copy];

  return (CHSInlineTextParameters *)v3;
}

- (void)setInlineTextParameters:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  if (self->_invalidated)
  {
    BOOL v8 = CHUISLogViewController();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[CHUISWidgetHostViewController setInlineTextParameters:]();
    }
  }
  else if ((BSEqualObjects() & 1) == 0)
  {
    double v5 = (CHSInlineTextParameters *)[v4 copy];
    inlineTextParameters = self->_inlineTextParameters;
    self->_inlineTextParameters = v5;

    if (self->_scene)
    {
      double v7 = CHUISLogViewController();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[CHUISWidgetHostViewController setInlineTextParameters:]();
      }

      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __57__CHUISWidgetHostViewController_setInlineTextParameters___block_invoke;
      v9[3] = &unk_1E62AF620;
      v9[4] = self;
      [(CHUISWidgetHostViewController *)self modifySceneSettings:v9];
    }
  }
}

uint64_t __57__CHUISWidgetHostViewController_setInlineTextParameters___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

- (BOOL)showsWidgetLabel
{
  return self->_showsWidgetLabel;
}

- (void)setShowsWidgetLabel:(BOOL)a3
{
  BSDispatchQueueAssertMain();
  if ((BSEqualBools() & 1) == 0)
  {
    self->_showsWidgetLabel = a3;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __53__CHUISWidgetHostViewController_setShowsWidgetLabel___block_invoke;
    v5[3] = &unk_1E62AF620;
    void v5[4] = self;
    [(CHUISWidgetHostViewController *)self modifySceneSettings:v5];
  }
}

uint64_t __53__CHUISWidgetHostViewController_setShowsWidgetLabel___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

- (BOOL)isInteractionDisabled
{
  return self->_interactionDisabled;
}

- (void)setInteractionDisabled:(BOOL)a3
{
  BSDispatchQueueAssertMain();
  if ((BSEqualBools() & 1) == 0)
  {
    self->_interactionDisabled = a3;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__CHUISWidgetHostViewController_setInteractionDisabled___block_invoke;
    v5[3] = &unk_1E62AF620;
    void v5[4] = self;
    [(CHUISWidgetHostViewController *)self modifySceneSettings:v5];
  }
}

uint64_t __56__CHUISWidgetHostViewController_setInteractionDisabled___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

- (BOOL)shouldVisibleEntrySnapshot
{
  return self->_visibleEntryShouldSnapshot;
}

- (void)setVisibleEntryShouldSnapshot:(BOOL)a3
{
  BOOL v3 = a3;
  BSDispatchQueueAssertMain();
  if (self->_invalidated)
  {
    id v6 = CHUISLogViewController();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[CHUISWidgetHostViewController setVisibleEntryShouldSnapshot:]();
    }
  }
  else if (self->_visibleEntryShouldSnapshot != v3)
  {
    self->_visibleEntryShouldSnapshot = v3;
    if (self->_scene)
    {
      double v5 = CHUISLogViewController();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        -[CHUISWidgetHostViewController setVisibleEntryShouldSnapshot:]();
      }

      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __63__CHUISWidgetHostViewController_setVisibleEntryShouldSnapshot___block_invoke;
      v7[3] = &unk_1E62AF620;
      void v7[4] = self;
      [(CHUISWidgetHostViewController *)self modifySceneSettings:v7];
    }
  }
}

uint64_t __63__CHUISWidgetHostViewController_setVisibleEntryShouldSnapshot___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

- (void)setShouldShareTouchesWithHost:(BOOL)a3
{
  BOOL v3 = a3;
  BSDispatchQueueAssertMain();
  if (!self->_invalidated || !v3)
  {
    if (self->_shouldShareTouchesWithHost != v3)
    {
      self->_shouldShareTouchesWithHost = v3;
      if (v3)
      {
        [(CHUISWidgetHostViewController *)self _updateTouchDeliveryPolicies];
      }
      else
      {
        [(CHUISWidgetHostViewController *)self _clearTouchDeliveryPolicies];
      }
    }
  }
  else
  {
    id v6 = CHUISLogViewController();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[CHUISWidgetHostViewController setShouldShareTouchesWithHost:]();
    }
  }
}

- (id)cancelTouchesForCurrentEventInHostedContent
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    id v30 = self;
    objc_initWeak(&location, self);
    uint64_t v38 = MEMORY[0x1E4F143A8];
    uint64_t v39 = 3221225472;
    id v40 = __76__CHUISWidgetHostViewController_cancelTouchesForCurrentEventInHostedContent__block_invoke;
    id v41 = &unk_1E62AF800;
    v27 = &v42;
    objc_copyWeak(&v42, &location);
    BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler();
    v33 = (CHUISWidgetHostCancelTouchesAssertion *)objc_claimAutoreleasedReturnValue();
    BOOL v3 = [(CHUISWidgetHostViewController *)self view];
    v29 = [v3 _window];

    id v4 = (id *)MEMORY[0x1E4FB2608];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v5 = [*v4 _touchesEventForWindow:v29];
      id v6 = (void *)v5;
      if (v33 && v5)
      {
        uint64_t v28 = (void *)v5;
        double v7 = 0.0;
        if (objc_opt_respondsToSelector())
        {
          [v6 _initialTouchTimestampForWindow:v29];
          double v7 = v8;
        }
        id v9 = [(FBScene *)v30->_scene layerManager];
        v26 = [v9 layers];

        id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        obj = v26;
        uint64_t v10 = [obj countByEnumeratingWithState:&v34 objects:v52 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v35 != v11) {
                objc_enumerationMutation(obj);
              }
              uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * i), "contextID", v26, v27, v28);
              __int16 v14 = (CHUISWidgetHostCancelTouchesAssertion *)objc_alloc_init(MEMORY[0x1E4F4F3E8]);
              __int16 v15 = [MEMORY[0x1E4F4F3E0] policyCancelingTouchesDeliveredToContextId:v13 withInitialTouchTimestamp:v7];
              BOOL v16 = [(CHUISWidgetHostCancelTouchesAssertion *)v14 endpoint];
              [v15 setAssertionEndpoint:v16];

              [(CHUISWidgetHostCancelTouchesAssertion *)v33 ipc_addPolicy:v15];
              uint64_t v17 = CHUISLogViewControllerTouch();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                cachedSceneLogDigest = v30->_cachedSceneLogDigest;
                *(_DWORD *)buf = 134219010;
                objc_super v45 = v30;
                __int16 v46 = 2114;
                v47 = cachedSceneLogDigest;
                __int16 v48 = 2114;
                v49 = v14;
                __int16 v50 = 1024;
                *(_DWORD *)v51 = v13;
                *(_WORD *)&v51[4] = 2114;
                *(void *)&v51[6] = v15;
                _os_log_impl(&dword_1BC3F1000, v17, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Acquired cancel touches assertion: %{public}@ (context id: %i, policy: %{public}@)", buf, 0x30u);
              }

              [v32 addObject:v14];
            }
            uint64_t v10 = [obj countByEnumeratingWithState:&v34 objects:v52 count:16];
          }
          while (v10);
        }

        v19 = [[CHUISWidgetHostCancelTouchesAssertion alloc] initWithAssertions:v32];
        __int16 v20 = CHUISLogViewControllerTouch();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = v30->_cachedSceneLogDigest;
          *(_DWORD *)buf = 134218498;
          objc_super v45 = v30;
          __int16 v46 = 2114;
          v47 = v21;
          __int16 v48 = 2114;
          v49 = v19;
          _os_log_impl(&dword_1BC3F1000, v20, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Made cancel touches group assertion: %{public}@", buf, 0x20u);
        }

        __int16 v22 = obj;
LABEL_23:

        objc_destroyWeak(v27);
        objc_destroyWeak(&location);
        goto LABEL_24;
      }
    }
    else
    {
      id v6 = 0;
    }
    uint64_t v28 = v6;
    __int16 v22 = CHUISLogViewControllerTouch();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v30->_cachedSceneLogDigest;
      *(_DWORD *)buf = 134218754;
      objc_super v45 = v30;
      __int16 v46 = 2114;
      v47 = v23;
      __int16 v48 = 2112;
      v49 = v33;
      __int16 v50 = 2114;
      *(void *)v51 = v6;
      _os_log_impl(&dword_1BC3F1000, v22, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Did not make cancel touches group assertion because of server: %@, or touchesEvent: %{public}@", buf, 0x2Au);
    }
    v19 = 0;
    goto LABEL_23;
  }
  uint64_t v25 = CHUISLogViewController();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
    -[CHUISWidgetHostViewController cancelTouchesForCurrentEventInHostedContent]();
  }

  v19 = 0;
LABEL_24:

  return v19;
}

void __76__CHUISWidgetHostViewController_cancelTouchesForCurrentEventInHostedContent__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = CHUISLogViewControllerTouch();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = WeakRetained[139];
      int v7 = 134218498;
      double v8 = WeakRetained;
      __int16 v9 = 2114;
      uint64_t v10 = v6;
      __int16 v11 = 2114;
      id v12 = v3;
      _os_log_impl(&dword_1BC3F1000, v5, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Sending cancellation touch delivery policy failed with error: %{public}@", (uint8_t *)&v7, 0x20u);
    }
  }
}

- (BOOL)drawSystemBackgroundMaterialIfNecessary
{
  return self->_drawSystemBackgroundMaterialIfNecessary;
}

- (void)setDrawSystemBackgroundMaterialIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  BSDispatchQueueAssertMain();
  if (self->_invalidated)
  {
    uint64_t v5 = CHUISLogViewController();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[CHUISWidgetHostViewController setDrawSystemBackgroundMaterialIfNecessary:]();
    }
  }
  else if (self->_drawSystemBackgroundMaterialIfNecessary != v3)
  {
    self->_drawSystemBackgroundMaterialIfNecessarCGFloat y = v3;
    [(CHUISWidgetHostViewController *)self _updateBackgroundMaterialAndColor];
  }
}

- (BOOL)usesSystemBackgroundMaterial
{
  BSDispatchQueueAssertMain();
  int v3 = [(CHSWidgetDescriptor *)self->_descriptor wantsMaterialBackgroundForFamily:[(CHSWidget *)self->_widget family]];
  if (v3) {
    LOBYTE(v3) = [(CHSWidgetRenderScheme *)self->_renderScheme backgroundViewPolicy] == 0;
  }
  return v3;
}

- (UIView)snapshotView
{
  return (UIView *)[(CHUISWidgetHostViewController *)self _snapshotViewIgnoringVibrancyEffect:0];
}

- (id)_snapshotViewIgnoringVibrancyEffect:(BOOL)a3
{
  BSDispatchQueueAssertMain();
  if (self->_invalidated)
  {
    v19 = CHUISLogViewController();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[CHUISWidgetHostViewController _snapshotViewIgnoringVibrancyEffect:]();
    }

    __int16 v11 = 0;
  }
  else
  {
    uint64_t v5 = self->_scene;
    uint64_t v6 = v5;
    if (v5 && [(FBScene *)v5 contentState] == 2 && CHUISHasGlobalCaptureEntitlement())
    {
      id v7 = (id)[(UIScenePresenter *)self->_scenePresenter newSnapshotPresentationView];
    }
    else
    {
      id v7 = [(CHUISWidgetHostViewController *)self _newPersistedSnapshotView];
      if (v7)
      {
        double v8 = [(CHUISWidgetHostViewController *)self view];
        [v8 bounds];
        objc_msgSend(v7, "setFrame:");

        id v9 = v7;
      }
    }
    [(CHUISWidgetHostViewController *)self _effectiveViewCornerRadius];
    objc_msgSend(v7, "_setContinuousCornerRadius:");
    [v7 setClipsToBounds:0];
    id v10 = v7;
    __int16 v11 = v10;
    if ([(CHUISWidgetHostViewController *)self _isVibrancyEffectEnabled])
    {
      __int16 v11 = v10;
      if (!a3)
      {
        id v12 = objc_alloc(MEMORY[0x1E4F4F8F0]);
        uint64_t v13 = [(CHUISWidgetHostViewController *)self view];
        [v13 bounds];
        __int16 v11 = objc_msgSend(v12, "initWithFrame:");

        __int16 v14 = [(CHUISWidgetHostViewController *)self vibrancyConfiguration];
        __int16 v15 = (void *)[v14 copyWithGroupName:0];
        [v11 setConfiguration:v15];

        [v10 setAutoresizingMask:18];
        BOOL v16 = [v11 contentView];
        [v16 addSubview:v10];
      }
    }
    uint64_t v17 = [v11 layer];
    [(CHUISWidgetHostViewController *)self _applySecurityPolicyToLayer:v17];
  }

  return v11;
}

- (CHSWidgetRenderScheme)renderScheme
{
  BSDispatchQueueAssertMain();
  renderScheme = self->_renderScheme;

  return renderScheme;
}

- (void)setRenderScheme:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  self->_didSetRenderSchemeExplicitlCGFloat y = 1;
  [(CHUISWidgetHostViewController *)self _implicitSetRenderScheme:v4];
}

- (void)_implicitSetRenderScheme:(id)a3
{
  id v4 = a3;
  p_renderScheme = &self->_renderScheme;
  if (([(CHSWidgetRenderScheme *)self->_renderScheme isEqual:v4] & 1) == 0)
  {
    BOOL v6 = [(CHUISWidgetHostViewController *)self usesSystemBackgroundMaterial];
    uint64_t v7 = [v4 copy];
    double v8 = *p_renderScheme;
    *p_renderScheme = (CHSWidgetRenderScheme *)v7;

    id v9 = CHUISLogViewController();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[CHUISWidgetHostViewController _implicitSetRenderScheme:]();
    }

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __58__CHUISWidgetHostViewController__implicitSetRenderScheme___block_invoke;
    v13[3] = &unk_1E62AF620;
    v13[4] = self;
    [(CHUISWidgetHostViewController *)self modifySceneSettings:v13];
    if (v6 != [(CHUISWidgetHostViewController *)self usesSystemBackgroundMaterial])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v11 = objc_opt_respondsToSelector();

      if (v11)
      {
        id v12 = objc_loadWeakRetained((id *)&self->_delegate);
        [v12 widgetHostViewControllerUsesSystemBackgroundMaterialDidChange:self];
      }
    }
  }
}

uint64_t __58__CHUISWidgetHostViewController__implicitSetRenderScheme___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

- (unint64_t)backgroundViewPolicy
{
  BSDispatchQueueAssertMain();
  renderScheme = self->_renderScheme;

  return [(CHSWidgetRenderScheme *)renderScheme backgroundViewPolicy];
}

- (void)setBackgroundViewPolicy:(unint64_t)a3
{
  BSDispatchQueueAssertMain();
  if ([(CHUISWidgetHostViewController *)self backgroundViewPolicy] != a3)
  {
    id v5 = (id)[(CHSWidgetRenderScheme *)self->_renderScheme mutableCopy];
    [v5 setBackgroundViewPolicy:a3];
    [(CHUISWidgetHostViewController *)self _implicitSetRenderScheme:v5];
  }
}

- (void)setUsesOpaqueContent:(BOOL)a3
{
}

- (BOOL)containsInteractiveControls
{
  uint64_t v2 = [(CHUISWidgetHostViewController *)self clientSettings];
  char v3 = [v2 containsInteractiveControls];

  return v3;
}

- (void)setWantsBaseContentTouchEvents:(BOOL)a3
{
  if (self->_wantsBaseContentTouchEvents != a3)
  {
    self->_wantsBaseContentTouchEvents = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __64__CHUISWidgetHostViewController_setWantsBaseContentTouchEvents___block_invoke;
    v3[3] = &unk_1E62AF620;
    v3[4] = self;
    [(CHUISWidgetHostViewController *)self modifySceneSettings:v3];
  }
}

uint64_t __64__CHUISWidgetHostViewController_setWantsBaseContentTouchEvents___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 0;
}

- (double)_currentDisplayScale
{
  BSDispatchQueueAssertMain();
  char v3 = [(CHUISWidgetHostViewController *)self traitCollection];
  [v3 displayScale];
  double v5 = v4;

  return v5;
}

- (void)loadView
{
  char v3 = [CHUISWidgetHostViewControllerView alloc];
  double v4 = -[CHUISWidgetHostViewControllerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(CHUISWidgetHostViewControllerView *)v4 setParentController:self];
  [(CHUISWidgetHostViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  BSDispatchQueueAssertMain();
  v11.receiver = self;
  v11.super_class = (Class)CHUISWidgetHostViewController;
  [(CHUISWidgetHostViewController *)&v11 viewDidLoad];
  char v3 = [(CHUISWidgetHostViewController *)self view];
  double v4 = [(CHUISWidgetHostViewController *)self metrics];
  if (self->_metricsDefineSize)
  {
    [(CHUISWidgetHostViewController *)self _currentDisplayScale];
    objc_msgSend(v4, "_effectiveSizePixelAlignedForDisplayScale:");
    BSRectWithSize();
    objc_msgSend(v3, "setFrame:");
  }
  double v5 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceLevel:1];
  [v3 _setLocalOverrideTraitCollection:v5];

  [v3 setClipsToBounds:0];
  [v3 setBackgroundColor:0];
  if (_os_feature_enabled_impl())
  {
    id v6 = objc_alloc(MEMORY[0x1E4F4F8F0]);
    uint64_t v7 = [(CHUISWidgetHostViewController *)self view];
    [v7 bounds];
    double v8 = (BSUIVibrancyEffectView *)objc_msgSend(v6, "initWithFrame:");
    vibrancyEffectView = self->_vibrancyEffectView;
    self->_vibrancyEffectView = v8;

    [(BSUIVibrancyEffectView *)self->_vibrancyEffectView setAutoresizingMask:18];
    id v10 = [(CHUISWidgetHostViewController *)self view];
    [v10 addSubview:self->_vibrancyEffectView];

    [(CHUISWidgetHostViewController *)self _updateVibrancyEffectView];
  }
  [(CHUISWidgetHostViewController *)self _createWidgetSnapshotViews];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  BSDispatchQueueAssertMain();
  v5.receiver = self;
  v5.super_class = (Class)CHUISWidgetHostViewController;
  [(CHUISWidgetHostViewController *)&v5 viewWillAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  BSDispatchQueueAssertMain();
  self->_isInViewDidDisappear = 1;
  v5.receiver = self;
  v5.super_class = (Class)CHUISWidgetHostViewController;
  [(CHUISWidgetHostViewController *)&v5 viewDidDisappear:v3];
  self->_isInViewDidDisappear = 0;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BSDispatchQueueAssertMain();
  v28.receiver = self;
  v28.super_class = (Class)CHUISWidgetHostViewController;
  [(CHUISWidgetHostViewController *)&v28 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  if (v6)
  {
    uint64_t v7 = [(FBScene *)self->_scene settings];
    double v8 = [v7 displayConfiguration];

    id v9 = [v6 windowScene];
    id v10 = [v9 _FBSScene];
    objc_super v11 = [v10 settings];

    id v12 = [v11 displayConfiguration];
    if (!v12)
    {
      id v12 = [MEMORY[0x1E4F62420] mainConfiguration];
    }
    uint64_t v13 = [v11 displayIdentity];
    unsigned int v14 = [v13 isContinuityDisplay];

    char v15 = [v12 isEqual:v8];
    keybagLockPolicCGFloat y = self->_keybagLockPolicy;
    BOOL v17 = keybagLockPolicy == v14;
    if (keybagLockPolicy == v14) {
      char v18 = v15;
    }
    else {
      char v18 = 0;
    }
    if ((v18 & 1) == 0)
    {
      if (!v17)
      {
        self->_keybagLockPolicCGFloat y = v14;
        v19 = CHUISLogViewController();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          cachedSceneLogDigest = self->_cachedSceneLogDigest;
          *(_DWORD *)buf = 134218498;
          id v30 = self;
          __int16 v31 = 2114;
          id v32 = cachedSceneLogDigest;
          __int16 v33 = 2050;
          uint64_t v34 = v14;
          _os_log_impl(&dword_1BC3F1000, v19, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Keybag Lock Policy changed to %{public}ld", buf, 0x20u);
        }
      }
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      uint64_t v24 = __77__CHUISWidgetHostViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke;
      uint64_t v25 = &unk_1E62AF828;
      id v26 = v12;
      uint64_t v27 = v14;
      [(CHUISWidgetHostViewController *)self modifySceneSettings:&v22];
    }
    [(CHUISWidgetHostViewController *)self _evaluateEffectiveInSecureEnvironmentForReason:@"viewDidMoveToWindow", v22, v23, v24, v25];
    unint64_t effectivePresentationMode = self->_effectivePresentationMode;
    if (effectivePresentationMode == 1
      || effectivePresentationMode == 3
      || effectivePresentationMode == 2
      && ([(CHUISWidgetHostViewController *)self _updateSceneToForeground:1],
          [(FBScene *)self->_scene contentState] != 2))
    {
      [(CHUISWidgetHostViewController *)self _ensureAndEvaluateSnapshotView];
    }

    if (self->_shouldShareTouchesWithHost) {
      [(CHUISWidgetHostViewController *)self _updateTouchDeliveryPolicies];
    }
  }
  else if (self->_shouldShareTouchesWithHost)
  {
    [(CHUISWidgetHostViewController *)self _clearTouchDeliveryPolicies];
  }
  [(CHUISWidgetHostViewController *)self _scheduleEvaluationOfDetachedSceneTimerForReason:@"Window modified"];
}

uint64_t __77__CHUISWidgetHostViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setDisplayConfiguration:*(void *)(a1 + 32)];
  [v3 setKeybagLockPolicy:*(void *)(a1 + 40)];

  return 0;
}

- (void)viewWillLayoutSubviews
{
  BSDispatchQueueAssertMain();
  v4.receiver = self;
  v4.super_class = (Class)CHUISWidgetHostViewController;
  [(CHUISWidgetHostViewController *)&v4 viewWillLayoutSubviews];
  id v3 = [(CHUISWidgetHostViewController *)self view];
  [v3 sendSubviewToBack:self->_materialView];
}

- (void)setMetricsDefineSize:(BOOL)a3
{
  if ((BSEqualBools() & 1) == 0)
  {
    self->_metricsDefineSize = a3;
    [(CHUISWidgetHostViewController *)self _updateViewsCornerRadius];
  }
}

- (void)setClipBehavior:(unint64_t)a3
{
  if (self->_clipBehavior != a3)
  {
    self->_clipBehavior = a3;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __49__CHUISWidgetHostViewController_setClipBehavior___block_invoke;
    v4[3] = &__block_descriptor_40_e78___UIApplicationSceneTransitionContext_16__0__CHUISMutableWidgetSceneSettings_8l;
    v4[4] = a3;
    [(CHUISWidgetHostViewController *)self modifySceneSettings:v4];
    [(CHUISWidgetHostViewController *)self _updateViewsCornerRadius];
  }
}

uint64_t __49__CHUISWidgetHostViewController_setClipBehavior___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

- (void)setWidgetPriority:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_widgetPriority != a3)
  {
    self->_widgetPrioritCGFloat y = a3;
    objc_super v4 = CHUISLogViewController();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      cachedSceneLogDigest = self->_cachedSceneLogDigest;
      id v6 = [NSNumber numberWithUnsignedInteger:self->_widgetPriority];
      *(_DWORD *)buf = 134218498;
      id v9 = self;
      __int16 v10 = 2114;
      objc_super v11 = cachedSceneLogDigest;
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      _os_log_impl(&dword_1BC3F1000, v4, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Widget priority changed to %@", buf, 0x20u);
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__CHUISWidgetHostViewController_setWidgetPriority___block_invoke;
    v7[3] = &unk_1E62AF620;
    void v7[4] = self;
    [(CHUISWidgetHostViewController *)self modifySceneSettings:v7];
  }
}

uint64_t __51__CHUISWidgetHostViewController_setWidgetPriority___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

- (BLSHBacklightSceneHostEnvironment)backlightHostEnvironment
{
  return self->_sceneBacklightEnvironment;
}

- (void)logDebug:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = CHUISLogViewController();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  if (v6)
  {
    uint64_t v7 = CHUISLogViewController();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      cachedSceneLogDigest = self->_cachedSceneLogDigest;
      id v9 = (void *)[[NSString alloc] initWithFormat:v4 arguments:&v17];
      *(_DWORD *)buf = 134218498;
      objc_super v11 = self;
      __int16 v12 = 2114;
      uint64_t v13 = cachedSceneLogDigest;
      __int16 v14 = 2114;
      char v15 = v9;
      _os_log_debug_impl(&dword_1BC3F1000, v7, OS_LOG_TYPE_DEBUG, "[%p-%{public}@] %{public}@", buf, 0x20u);
    }
  }
}

- (void)log:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = CHUISLogViewController();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    uint64_t v7 = CHUISLogViewController();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      cachedSceneLogDigest = self->_cachedSceneLogDigest;
      id v9 = (void *)[[NSString alloc] initWithFormat:v4 arguments:&v17];
      *(_DWORD *)buf = 134218498;
      objc_super v11 = self;
      __int16 v12 = 2114;
      uint64_t v13 = cachedSceneLogDigest;
      __int16 v14 = 2114;
      char v15 = v9;
      _os_log_impl(&dword_1BC3F1000, v7, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] %{public}@", buf, 0x20u);
    }
  }
}

- (id)sceneSpecification
{
  uint64_t v2 = objc_opt_new();

  return v2;
}

- (void)modifySceneSettings:(id)a3
{
  id v4 = a3;
  scene = self->_scene;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__CHUISWidgetHostViewController_modifySceneSettings___block_invoke;
  v7[3] = &unk_1E62AF850;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(FBScene *)scene updateSettingsWithTransitionBlock:v7];
}

id __53__CHUISWidgetHostViewController_modifySceneSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) willModifySceneSettings:v3];

  return v4;
}

- (id)additionalSnapshotPresentationContext
{
  return 0;
}

- (void)sceneDidUpdateClientSettingsWithDiff:(id)a3 oldClientSettings:(id)a4 newClientSettings:(id)a5 transitionContext:(id)a6
{
  id v14 = a4;
  id v8 = a5;
  int v9 = [v14 containsInteractiveControls];
  if (v9 != [v8 containsInteractiveControls])
  {
    __int16 v10 = [(CHUISWidgetHostViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v10 widgetHostViewControllerContainsInteractiveControlsDidChange:self];
    }
  }
  int v11 = [v14 baseContentTouchedDown];
  if (v11 != [v8 baseContentTouchedDown] && self->_wantsBaseContentTouchEvents)
  {
    __int16 v12 = [(CHUISWidgetHostViewController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v13 = -[CHUISTouchEvent initWithBaseContentTouchedDown:]([CHUISTouchEvent alloc], "initWithBaseContentTouchedDown:", [v8 baseContentTouchedDown]);
      [v12 widgetHostViewController:self receivedTouchEvent:v13];
    }
  }
}

- (CHUISWidgetSceneClientSettings)clientSettings
{
  return (CHUISWidgetSceneClientSettings *)[(FBScene *)self->_scene clientSettings];
}

- (id)handleActions:(id)a3
{
  id v3 = a3;

  return v3;
}

- (CHUISWidgetVisibilitySettings)_visibilitySettings
{
  BSDispatchQueueAssertMain();
  visibilitySettings = self->_visibilitySettings;

  return visibilitySettings;
}

- (void)_setVisibilitySettings:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  if (![(CHUISWidgetVisibilitySettings *)self->_visibilitySettings isEqual:v4])
  {
    objc_super v5 = (CHUISWidgetVisibilitySettings *)[v4 copy];
    visibilitySettings = self->_visibilitySettings;
    self->_visibilitySettings = v5;

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__CHUISWidgetHostViewController__setVisibilitySettings___block_invoke;
    v7[3] = &unk_1E62AF620;
    void v7[4] = self;
    [(CHUISWidgetHostViewController *)self modifySceneSettings:v7];
  }
}

uint64_t __56__CHUISWidgetHostViewController__setVisibilitySettings___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

- (BOOL)_hasScene
{
  return self->_scene != 0;
}

- (UIView)_liveSceneView
{
  return (UIView *)[(UIScenePresenter *)self->_scenePresenter presentationView];
}

- (id)_liveSnapshotView
{
  return self->_liveSceneSnapshotView;
}

- (UIView)_staticImageSnapshotView
{
  return (UIView *)self->_persistedWidgetSnapshotImageView;
}

- (UIView)_staticCAARSnapshotView
{
  return (UIView *)self->_persistedWidgetSnapshotCaarView;
}

- (UIView)_staticSnapshotContainerView
{
  return self->_persistedWidgetSnapshotViewContainer;
}

- (UIView)_liveSceneSnapshotView
{
  return self->_liveSceneSnapshotView;
}

- (id)_persistedWidgetSnapshotViewContainer
{
  return self->_persistedWidgetSnapshotViewContainer;
}

- (id)_stateDumpDescription
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __54__CHUISWidgetHostViewController__stateDumpDescription__block_invoke;
  v16[3] = &unk_1E62AF538;
  id v4 = v3;
  id v17 = v4;
  char v18 = self;
  id v5 = (id)[v4 modifyProem:v16];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  __int16 v12 = __54__CHUISWidgetHostViewController__stateDumpDescription__block_invoke_2;
  uint64_t v13 = &unk_1E62AF538;
  id v6 = v4;
  id v14 = v6;
  char v15 = self;
  id v7 = (id)[v6 modifyBody:&v10];
  id v8 = objc_msgSend(v6, "build", v10, v11, v12, v13);

  return v8;
}

void __54__CHUISWidgetHostViewController__stateDumpDescription__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (*(void *)(*(void *)(a1 + 40) + 1304)) {
    id v3 = @"preview";
  }
  else {
    id v3 = @"timeline";
  }
  [v2 appendString:v3 withName:@"type"];
  unint64_t v4 = *(void *)(*(void *)(a1 + 40) + 1280) - 1;
  if (v4 > 2) {
    id v5 = @"none";
  }
  else {
    id v5 = off_1E62AFBF8[v4];
  }
  [*(id *)(a1 + 32) appendString:v5 withName:@"requestedMode"];
  unint64_t v6 = *(void *)(*(void *)(a1 + 40) + 1288) - 1;
  if (v6 > 2) {
    id v7 = @"none";
  }
  else {
    id v7 = off_1E62AFBF8[v6];
  }
  [*(id *)(a1 + 32) appendString:v7 withName:@"effectiveMode"];
  id v8 = (id)[*(id *)(a1 + 32) appendBool:*(void *)(*(void *)(a1 + 40) + 1000) != 0 withName:@"hasScene"];
  int v9 = *(void **)(a1 + 32);
  id v11 = [*(id *)(*(void *)(a1 + 40) + 1000) settings];
  id v10 = (id)objc_msgSend(v9, "appendBool:withName:", objc_msgSend(v11, "isForeground"), @"isSceneForeground");
}

void __54__CHUISWidgetHostViewController__stateDumpDescription__block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 1200) withName:@"widget"];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 1384) withName:@"metrics"];
  id v4 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 1392) withName:@"configID"];
  id v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "_isAppearingOrAppeared"), @"isAppearedOrAppearing");
  id v6 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 1104) withName:@"visibility"];
  id v7 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 1216) withName:@"animationsPaused" ifEqualTo:1];
  id v8 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 1217) withName:@"contentPaused" ifEqualTo:1];
  id v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "shouldVisibleEntrySnapshot"), @"visibleEntryShouldSnapshot", 1);
  id v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "usesSystemBackgroundMaterial"), @"usesSystemBackgroundMaterial", 1);
  id v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "drawSystemBackgroundMaterialIfNecessary"), @"drawSystemBackgroundMaterialIfNecessary", 1);
  id v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "shouldShareTouchesWithHost"), @"sharesTouchesWithHost", 1);
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 1192);
  id v14 = @"NotSet";
  if (v13 == 2) {
    id v14 = @"No";
  }
  if (v13 == 1) {
    char v15 = @"Yes";
  }
  else {
    char v15 = v14;
  }
  [*(id *)(a1 + 32) appendString:v15 withName:@"inSecureEnvironment"];
  id v16 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 1184) withName:@"canAppearInSecureEnvironment" ifEqualTo:1];
  id v17 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 1272) withName:@"supportsLowLuminance" ifEqualTo:1];
  id v18 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 1360) withName:@"showsWidgetLabel" ifEqualTo:1];
  id v19 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 1361) withName:@"interactionDisabled" ifEqualTo:1];
  id v20 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 1220) withName:@"metricsDefineSize" ifEqualTo:1];
  v21 = *(void **)(a1 + 32);
  id v29 = [*(id *)(a1 + 40) userInfo];
  id v22 = (id)objc_msgSend(v21, "appendObject:withName:");

  uint64_t v23 = *(void **)(a1 + 32);
  id v30 = [*(id *)(a1 + 40) view];
  uint64_t v24 = [v30 window];
  id v25 = (id)[v23 appendObject:v24 withName:@"window"];

  id v26 = *(void **)(a1 + 32);
  id v31 = [*(id *)(a1 + 40) view];
  uint64_t v27 = [v31 superview];
  id v28 = (id)[v26 appendObject:v27 withName:@"superview"];
}

- (void)ensureContentWithTimeout:(double)a3 completion:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  BSDispatchQueueAssertMain();
  if (self->_scene)
  {
    id v8 = CHUISLogViewController();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      cachedSceneLogDigest = self->_cachedSceneLogDigest;
      *(_DWORD *)buf = 134218498;
      uint64_t v23 = self;
      __int16 v24 = 2114;
      id v25 = cachedSceneLogDigest;
      __int16 v26 = 2048;
      double v27 = a3;
      _os_log_impl(&dword_1BC3F1000, v8, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Sending content confirmation action: timeout=%f)", buf, 0x20u);
    }

    id v10 = [CHUISContentConfirmationAction alloc];
    uint64_t v11 = MEMORY[0x1E4F14428];
    id v12 = MEMORY[0x1E4F14428];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __69__CHUISWidgetHostViewController_ensureContentWithTimeout_completion___block_invoke;
    v19[3] = &unk_1E62AF8C8;
    v19[4] = self;
    id v20 = v7;
    SEL v21 = a2;
    uint64_t v13 = [(CHUISContentConfirmationAction *)v10 initWithTimeout:v11 queue:v19 completion:a3];

    scene = self->_scene;
    char v15 = [MEMORY[0x1E4F1CAD0] setWithObject:v13];
    [(FBScene *)scene sendActions:v15];
  }
  else
  {
    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    v29[0] = @"Missing scene";
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    id v18 = [v16 errorWithDomain:@"com.apple.chrono.widgethost" code:888 userInfo:v17];
    (*((void (**)(id, void *))v7 + 2))(v7, v18);
  }
}

void __69__CHUISWidgetHostViewController_ensureContentWithTimeout_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = CHUISLogViewController();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(v5 + 1112);
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2112;
      id v41 = v3;
      _os_log_impl(&dword_1BC3F1000, v4, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Received content confirmation action error: %@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if ([*(id *)(*(void *)(a1 + 32) + 1000) contentState] == 2)
  {
    id v7 = CHUISLogViewController();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(v8 + 1112);
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v9;
      _os_log_impl(&dword_1BC3F1000, v7, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Received content confirmation action success!", buf, 0x16u);
    }

    [*(id *)(a1 + 32) _hideSnapshotViewsAnimated:0 forceCompleteTeardown:1];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v10 = CHUISLogViewController();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(v11 + 1112);
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v12;
      _os_log_impl(&dword_1BC3F1000, v10, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Received content confirmation action response, but raced with content ready response.  Waiting for content to be ready.", buf, 0x16u);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v41 = __Block_byref_object_copy__0;
    id v42 = __Block_byref_object_dispose__0;
    id v13 = objc_alloc(MEMORY[0x1E4F4F6F0]);
    id v14 = NSString;
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 1112);
    id v16 = [MEMORY[0x1E4F29128] UUID];
    id v17 = [v16 UUIDString];
    id v18 = [v14 stringWithFormat:@"<WaitForContentReadyTimer-%@-%@>", v15, v17];
    id v43 = (id)[v13 initWithIdentifier:v18];

    id v19 = (void *)MEMORY[0x1E4F4F6B8];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __69__CHUISWidgetHostViewController_ensureContentWithTimeout_completion___block_invoke_168;
    v36[3] = &unk_1E62AF878;
    id v20 = *(void **)(a1 + 40);
    v36[4] = *(void *)(a1 + 32);
    id v21 = v20;
    uint64_t v22 = *(void *)(a1 + 48);
    id v37 = v21;
    uint64_t v38 = buf;
    uint64_t v39 = v22;
    uint64_t v23 = [v19 sentinelWithQueue:MEMORY[0x1E4F14428] signalHandler:v36];
    __int16 v24 = *(void **)(*(void *)&buf[8] + 40);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __69__CHUISWidgetHostViewController_ensureContentWithTimeout_completion___block_invoke_177;
    v34[3] = &unk_1E62AF8A0;
    id v25 = v23;
    id v35 = v25;
    [v24 scheduleWithFireInterval:MEMORY[0x1E4F14428] leewayInterval:v34 queue:3.0 handler:0.0];

    __int16 v26 = *(void **)(*(void *)(a1 + 32) + 1248);
    if (!v26)
    {
      uint64_t v27 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v28 = *(void *)(a1 + 32);
      id v29 = *(void **)(v28 + 1248);
      *(void *)(v28 + 1248) = v27;

      __int16 v26 = *(void **)(*(void *)(a1 + 32) + 1248);
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__CHUISWidgetHostViewController_ensureContentWithTimeout_completion___block_invoke_2;
    aBlock[3] = &unk_1E62AF4E8;
    id v30 = v25;
    id v33 = v30;
    id v31 = _Block_copy(aBlock);
    [v26 addObject:v31];

    _Block_object_dispose(buf, 8);
  }
}

void __69__CHUISWidgetHostViewController_ensureContentWithTimeout_completion___block_invoke_168(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 context];
  if (v3)
  {
    id v4 = CHUISLogViewController();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(v5 + 1112);
      int v13 = 134218242;
      uint64_t v14 = v5;
      __int16 v15 = 2114;
      uint64_t v16 = v6;
      _os_log_impl(&dword_1BC3F1000, v4, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Timed out waiting for content ready for content confirmation action.", (uint8_t *)&v13, 0x16u);
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"CHUISWidgetHostViewController.m" lineNumber:1393 description:@"Context must be an error"];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v7 = CHUISLogViewController();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(v8 + 1112);
      int v13 = 134218242;
      uint64_t v14 = v8;
      __int16 v15 = 2114;
      uint64_t v16 = v9;
      _os_log_impl(&dword_1BC3F1000, v7, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Received content ready response for content confirmation action. Success!", (uint8_t *)&v13, 0x16u);
    }

    [*(id *)(a1 + 32) _hideSnapshotViewsAnimated:0 forceCompleteTeardown:1];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) invalidate];
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;
}

void __69__CHUISWidgetHostViewController_ensureContentWithTimeout_completion___block_invoke_177(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F28568];
  v6[0] = @"Timed out waiting for content to be ready.";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  id v4 = [v2 errorWithDomain:@"com.apple.chrono.widgethost" code:777 userInfo:v3];
  [v1 signalWithContext:v4];
}

uint64_t __69__CHUISWidgetHostViewController_ensureContentWithTimeout_completion___block_invoke_2(uint64_t a1)
{
  BSDispatchQueueAssertMain();
  id v2 = *(void **)(a1 + 32);

  return [v2 signal];
}

- (void)snapshotContentWithTimeout:(double)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__CHUISWidgetHostViewController_snapshotContentWithTimeout_queue_completion___block_invoke;
  v12[3] = &unk_1E62AF940;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(CHUISWidgetHostViewController *)self ensureContentWithTimeout:v12 completion:a3];
}

void __77__CHUISWidgetHostViewController_snapshotContentWithTimeout_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BSDispatchQueueAssertMain();
  if (v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__CHUISWidgetHostViewController_snapshotContentWithTimeout_queue_completion___block_invoke_3;
    block[3] = &unk_1E62AF918;
    id v4 = *(NSObject **)(a1 + 40);
    id v12 = *(id *)(a1 + 48);
    id v11 = v3;
    dispatch_async(v4, block);

    uint64_t v5 = v12;
  }
  else
  {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 1000) snapshotContext];
    objc_msgSend(v5, "setOpaque:", objc_msgSend(*(id *)(a1 + 32), "_actualBackgroundViewMode") == 1);
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 1000) createSnapshotWithContext:v5];
    [*(id *)(a1 + 32) _currentDisplayScale];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77__CHUISWidgetHostViewController_snapshotContentWithTimeout_queue_completion___block_invoke_2;
    v13[3] = &unk_1E62AF8F0;
    id v14 = v6;
    uint64_t v16 = v7;
    id v8 = *(NSObject **)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    id v9 = v6;
    dispatch_async(v8, v13);
  }
}

void __77__CHUISWidgetHostViewController_snapshotContentWithTimeout_queue_completion___block_invoke_2(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) capture])
  {
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1818]), "initWithCGImage:scale:orientation:", objc_msgSend(*(id *)(a1 + 32), "CGImage"), 0, *(double *)(a1 + 48));
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 40);
    id v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F28568];
    v8[0] = @"Unable to snapshot scene.";
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    uint64_t v5 = [v3 errorWithDomain:@"com.apple.chrono.widgethost" code:555 userInfo:v4];
    (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v5);
  }
}

uint64_t __77__CHUISWidgetHostViewController_snapshotContentWithTimeout_queue_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (id)succinctDescription
{
  uint64_t v2 = [(CHUISWidgetHostViewController *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_widget withName:@"widget"];
  id v5 = (id)[v3 appendObject:self->_metrics withName:@"metrics"];
  if (self->_contentType) {
    id v6 = @"preview";
  }
  else {
    id v6 = @"timeline";
  }
  id v7 = (id)[v3 appendObject:v6 withName:@"contentType"];
  unint64_t v8 = self->_requestedPresentationMode - 1;
  if (v8 > 2) {
    id v9 = @"none";
  }
  else {
    id v9 = off_1E62AFBF8[v8];
  }
  id v10 = (id)[v3 appendObject:v9 withName:@"requestedMode"];
  unint64_t v11 = self->_effectivePresentationMode - 1;
  if (v11 > 2) {
    id v12 = @"none";
  }
  else {
    id v12 = off_1E62AFBF8[v11];
  }
  id v13 = (id)[v3 appendObject:v12 withName:@"effectiveMode"];
  id v14 = (id)[v3 appendBool:self->_invalidated withName:@"invalidated"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(CHUISWidgetHostViewController *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v3 = [(CHUISWidgetHostViewController *)self succinctDescriptionBuilder];

  return v3;
}

- (void)invalidate
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    visibilitySettings = self->_visibilitySettings;
    self->_visibilitySettings = 0;

    objc_storeWeak((id *)&self->_delegate, 0);
    [(CHSWidgetExtensionProvider *)self->_extensionProvider unregisterObserver:self];
    id v4 = CHUISLogViewController();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      cachedSceneLogDigest = self->_cachedSceneLogDigest;
      int v6 = 134218242;
      id v7 = self;
      __int16 v8 = 2114;
      id v9 = cachedSceneLogDigest;
      _os_log_impl(&dword_1BC3F1000, v4, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Invalidated", (uint8_t *)&v6, 0x16u);
    }

    [(CHUISWidgetHostViewController *)self _tearDownScene];
  }
}

- (void)keybagStateDidChange:(id)a3
{
}

uint64_t __54__CHUISWidgetHostViewController_keybagStateDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _evaluateEffectiveInSecureEnvironmentForReason:@"keybagUpdate"];
}

- (void)extensionsDidChangeForExtensionProvider:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__CHUISWidgetHostViewController_extensionsDidChangeForExtensionProvider___block_invoke;
  block[3] = &unk_1E62AF4E8;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __73__CHUISWidgetHostViewController_extensionsDidChangeForExtensionProvider___block_invoke(uint64_t a1)
{
  uint64_t v2 = CHUISLogViewControllerTouch();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __73__CHUISWidgetHostViewController_extensionsDidChangeForExtensionProvider___block_invoke_cold_1();
  }

  return [*(id *)(a1 + 32) _updateDescriptorIfNecessary];
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BSDispatchQueueAssertMain();
  __int16 v8 = CHUISLogViewController();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    cachedSceneLogDigest = self->_cachedSceneLogDigest;
    *(_DWORD *)buf = 134218498;
    long long v36 = self;
    __int16 v37 = 2114;
    uint64_t v38 = cachedSceneLogDigest;
    __int16 v39 = 2114;
    id v40 = v7;
    _os_log_impl(&dword_1BC3F1000, v8, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Received actions: %{public}@", buf, 0x20u);
  }

  if (!self->_invalidated)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA80] setWithSet:v7];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (!v12) {
      goto LABEL_12;
    }
    uint64_t v13 = *(void *)v31;
LABEL_6:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v31 != v13) {
        objc_enumerationMutation(v11);
      }
      id v15 = *(void **)(*((void *)&v30 + 1) + 8 * v14);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v12) {
          goto LABEL_6;
        }
LABEL_12:
        id v16 = 0;
LABEL_25:

        goto LABEL_26;
      }
    }
    uint64_t v17 = objc_opt_class();
    id v18 = v15;
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
    id v16 = v19;

    objc_msgSend(v10, "removeObject:", v18, (void)v30);
    if (v16)
    {
      id v11 = [v16 launchRequest];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      unsigned __int8 v21 = objc_opt_respondsToSelector();

      if (((v11 != 0) & v21) == 1)
      {
        id v22 = objc_loadWeakRetained((id *)&self->_delegate);
        [v22 widgetHostViewController:self requestsLaunch:v11];
      }
      else
      {
        uint64_t v23 = [v11 launchAction];
        if (!v23) {
          goto LABEL_25;
        }
        id v24 = objc_loadWeakRetained((id *)&self->_delegate);
        char v25 = objc_opt_respondsToSelector();

        if ((v25 & 1) == 0) {
          goto LABEL_25;
        }
        id v22 = objc_loadWeakRetained((id *)&self->_delegate);
        __int16 v26 = [v11 launchAction];
        [v22 widgetHostViewController:self requestsLaunchWithAction:v26];
      }
      goto LABEL_25;
    }
LABEL_26:
    uint64_t v27 = -[CHUISWidgetHostViewController handleActions:](self, "handleActions:", v10, (void)v30);
    uint64_t v28 = (void *)[v27 mutableCopy];

    if ([v28 count]) {
      id v29 = (id)[(BLSHBacklightFBSceneEnvironmentActionHandler *)self->_sceneBacklightActionHandler respondToActions:v28 forFBScene:v6];
    }
  }
}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = (FBScene *)a3;
  id v7 = a4;
  BSDispatchQueueAssertMain();
  if (self->_scene == v6)
  {
    __int16 v8 = CHUISLogViewController();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      cachedSceneLogDigest = self->_cachedSceneLogDigest;
      int v17 = 134218498;
      id v18 = self;
      __int16 v19 = 2114;
      id v20 = cachedSceneLogDigest;
      __int16 v21 = 2114;
      id v22 = v7;
    }

    uint64_t v10 = [(FBScene *)v6 settings];
    int v11 = [v10 isForeground];

    if (!self->_invalidated)
    {
      if (v11)
      {
        uint64_t v12 = CHUISLogViewController();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = self->_cachedSceneLogDigest;
          int v17 = 134218242;
          id v18 = self;
          __int16 v19 = 2114;
          id v20 = v13;
          _os_log_impl(&dword_1BC3F1000, v12, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Scene deactivated but was foreground - reactivating.", (uint8_t *)&v17, 0x16u);
        }

        [(FBScene *)v6 activateWithTransitionContext:0];
      }
      else
      {
        uint64_t v14 = CHUISLogViewController();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = self->_cachedSceneLogDigest;
          int v17 = 134218242;
          id v18 = self;
          __int16 v19 = 2114;
          id v20 = v15;
          _os_log_impl(&dword_1BC3F1000, v14, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Scene deactivated but was background - invalidating.", (uint8_t *)&v17, 0x16u);
        }

        [(FBScene *)self->_scene invalidate];
        scene = self->_scene;
        self->_scene = 0;
      }
    }
  }
}

- (void)sceneContentStateDidChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = CHUISLogViewController();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    cachedSceneLogDigest = self->_cachedSceneLogDigest;
    [v4 contentState];
    id v7 = NSStringFromFBSceneContentState();
    *(_DWORD *)buf = 134218498;
    int v11 = self;
    __int16 v12 = 2114;
    uint64_t v13 = cachedSceneLogDigest;
    __int16 v14 = 2114;
    id v15 = v7;
    _os_log_impl(&dword_1BC3F1000, v5, OS_LOG_TYPE_INFO, "[%p-%{public}@] Content state did change to %{public}@", buf, 0x20u);
  }
  if ([v4 contentState] == 2)
  {
    [(CHUISWidgetHostViewController *)self _executeSceneContentReadyOperations];
    unint64_t effectivePresentationMode = self->_effectivePresentationMode;
    if (effectivePresentationMode == 2)
    {
      [(CHUISWidgetHostViewController *)self _hideSnapshotViewsAnimated:1];
      unint64_t effectivePresentationMode = self->_effectivePresentationMode;
    }
    if (effectivePresentationMode == 3)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__CHUISWidgetHostViewController_sceneContentStateDidChange___block_invoke;
      block[3] = &unk_1E62AF4E8;
      void block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  [(CHUISWidgetHostViewController *)self _updateBackgroundMaterialAndColor];
}

void *__60__CHUISWidgetHostViewController_sceneContentStateDidChange___block_invoke(uint64_t a1)
{
  CGRect result = *(void **)(a1 + 32);
  if (result[161] == 3)
  {
    [result _ensureAndEvaluateSnapshotView];
    id v3 = *(void **)(a1 + 32);
    return (void *)[v3 _updateSceneToForeground:0];
  }
  return result;
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v18 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  BSDispatchQueueAssertMain();
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v15 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v16 = (objc_class *)objc_opt_class();
      int v17 = NSStringFromClass(v16);
      [v15 handleFailureInMethod:a2, self, @"CHUISWidgetHostViewController.m", 1611, @"Invalidtype of client settings received: %@", v17 object file lineNumber description];
    }
  }
  __int16 v14 = [v18 clientSettings];
  [(CHUISWidgetHostViewController *)self sceneDidUpdateClientSettingsWithDiff:v11 oldClientSettings:v12 newClientSettings:v14 transitionContext:v13];
}

- (id)_persistedSnapshotContext
{
  id v3 = [(CHUISWidgetHostViewController *)self traitCollection];
  unint64_t v4 = [v3 userInterfaceStyle];

  if (v4 <= 1) {
    unint64_t v5 = 1;
  }
  else {
    unint64_t v5 = v4;
  }
  unint64_t colorScheme = self->_colorScheme;
  if (colorScheme == 2) {
    unint64_t v5 = 2;
  }
  if (colorScheme == 1) {
    unint64_t v5 = 1;
  }
  BOOL v7 = v5 < 2;
  id v8 = objc_alloc_init(MEMORY[0x1E4F58D30]);
  [v8 setColorScheme:v7];
  scene = self->_scene;
  if (scene)
  {
    uint64_t v10 = [(FBScene *)self->_scene settings];
    id v11 = [v10 tintParameters];
  }
  else
  {
    id v11 = [(CHUISWidgetHostViewController *)self tintParameters];
    uint64_t v10 = v11;
  }
  [v8 setTintParameters:v11];
  if (scene) {

  }
  objc_msgSend(v8, "setAllowsPrivacySensitiveContent:", -[CHUISWidgetHostViewController _shouldBeEffectivelyLocked](self, "_shouldBeEffectivelyLocked") ^ 1);
  objc_msgSend(v8, "setUserWantsWidgetDataWhenPasscodeLocked:", -[CHUISPreferences userWantsWidgetDataWhenPasscodeLocked](self->_preferences, "userWantsWidgetDataWhenPasscodeLocked"));
  id v12 = self->_scene;
  if (v12)
  {
    id v13 = [(FBScene *)self->_scene settings];
    __int16 v14 = [v13 additionalSnapshotPresentationContext];
  }
  else
  {
    __int16 v14 = [(CHUISWidgetHostViewController *)self additionalSnapshotPresentationContext];
    id v13 = v14;
  }
  [v8 setAdditionalSettingsContext:v14];
  if (v12) {

  }
  id v15 = [(CHSScreenshotManager *)self->_screenshotManager snapshotContextForWidget:self->_widget metrics:self->_metrics attributes:v8];

  return v15;
}

- (id)_newPersistedSnapshotView
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = CHUISLogViewController();
  unint64_t v4 = v3;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    LOWORD(v27) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BC3F1000, v4, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "FetchPersistedSnapshot", "", (uint8_t *)&v27, 2u);
  }

  id v6 = [(CHUISWidgetHostViewController *)self _persistedSnapshotContext];
  BOOL v7 = v6;
  if (v6)
  {
    if ([v6 needsCAPackage])
    {
      id v8 = objc_alloc(MEMORY[0x1E4FB2018]);
      id v9 = [v7 url];
      uint64_t v10 = (void *)[v8 initWithContentsOfURL:v9 publishedObjectViewClassMap:0];

      id v11 = CHUISLogViewController();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        cachedSceneLogDigest = self->_cachedSceneLogDigest;
        __int16 v26 = [v7 url];
        int v27 = 138412802;
        uint64_t v28 = cachedSceneLogDigest;
        __int16 v29 = 2114;
        long long v30 = v10;
        __int16 v31 = 2114;
        long long v32 = v26;
        _os_log_debug_impl(&dword_1BC3F1000, v11, OS_LOG_TYPE_DEBUG, "Read caar snapshot for %@! view: %{public}@ - url: %{public}@", (uint8_t *)&v27, 0x20u);
      }
      id v12 = CHUISLogViewController();
      id v13 = v12;
      os_signpost_id_t v14 = self->_signpostID;
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        id v15 = [v7 url];
        int v27 = 138412290;
        uint64_t v28 = v15;
        _os_signpost_emit_with_name_impl(&dword_1BC3F1000, v13, OS_SIGNPOST_INTERVAL_END, v14, "FetchPersistedSnapshot", "caar - <url>=%@", (uint8_t *)&v27, 0xCu);
      }
    }
    else
    {
      uint64_t v16 = [v7 url];
      id v13 = [(CHUISWidgetHostViewController *)self _snapshotImageFromURL:v16];

      if (v13)
      {
        uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v13];
        int v17 = CHUISLogViewController();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          [(CHUISWidgetHostViewController *)(uint64_t)self _newPersistedSnapshotView];
        }
      }
      else
      {
        uint64_t v10 = 0;
      }
      id v18 = CHUISLogViewController();
      __int16 v19 = v18;
      os_signpost_id_t v20 = self->_signpostID;
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        __int16 v21 = [v7 url];
        int v27 = 138412290;
        uint64_t v28 = v21;
        _os_signpost_emit_with_name_impl(&dword_1BC3F1000, v19, OS_SIGNPOST_INTERVAL_END, v20, "FetchPersistedSnapshot", "image - <url>=%@", (uint8_t *)&v27, 0xCu);
      }
    }

    id v22 = [v10 layer];
    uint64_t v23 = [v7 attributes];
    -[CHUISWidgetHostViewController _applySecurityPolicyToLayer:allowsPrivacySensitiveContent:](self, "_applySecurityPolicyToLayer:allowsPrivacySensitiveContent:", v22, [v23 allowsPrivacySensitiveContent]);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)_setCanAppearInSecureEnvironment:(BOOL)a3 force:(BOOL)a4
{
  BOOL v5 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  if (a4 || (BSEqualBools() & 1) == 0)
  {
    self->_canAppearInSecureEnvironment = v5;
    BOOL v7 = CHUISLogViewController();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      cachedSceneLogDigest = self->_cachedSceneLogDigest;
      id v9 = [NSNumber numberWithBool:v5];
      *(_DWORD *)buf = 134218498;
      int v17 = self;
      __int16 v18 = 2114;
      __int16 v19 = cachedSceneLogDigest;
      __int16 v20 = 2114;
      __int16 v21 = v9;
      _os_log_impl(&dword_1BC3F1000, v7, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Can appear in secure environment changed to %{public}@", buf, 0x20u);
    }
    keybag = self->_keybag;
    if (self->_canAppearInSecureEnvironment)
    {
      [(CHUISKeybag *)keybag addObserver:self];
      id v11 = [(CHUISWidgetHostViewController *)self view];
      id v12 = [v11 layer];
      [v12 setSecurityMode:*MEMORY[0x1E4F3A440]];

      [(CHUISWidgetHostViewController *)self _evaluateEffectiveInSecureEnvironmentForReason:@"Can appear in secure environment"];
    }
    else
    {
      [(CHUISKeybag *)keybag removeObserver:self];
      id v13 = [(CHUISWidgetHostViewController *)self view];
      os_signpost_id_t v14 = [v13 layer];
      [v14 setSecurityMode:*MEMORY[0x1E4F3A438]];

      [(CHUISWidgetHostViewController *)self _setInSecureEnvironment:0 forReason:@"Not eligible for showing in a secure environment"];
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __72__CHUISWidgetHostViewController__setCanAppearInSecureEnvironment_force___block_invoke;
    v15[3] = &unk_1E62AF620;
    v15[4] = self;
    [(CHUISWidgetHostViewController *)self modifySceneSettings:v15];
  }
}

uint64_t __72__CHUISWidgetHostViewController__setCanAppearInSecureEnvironment_force___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

- (void)_applySecurityPolicyToLayer:(id)a3
{
  id v4 = a3;
  [(CHUISWidgetHostViewController *)self _applySecurityPolicyToLayer:v4 allowsPrivacySensitiveContent:[(CHUISWidgetHostViewController *)self _shouldBeEffectivelyLocked] ^ 1];
}

- (void)_applySecurityPolicyToLayer:(id)a3 allowsPrivacySensitiveContent:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (v4)
  {
    id v6 = CHUISLogViewController();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[CHUISWidgetHostViewController _applySecurityPolicyToLayer:allowsPrivacySensitiveContent:]();
    }
    uint64_t v7 = 64;
  }
  else
  {
    id v6 = CHUISLogViewController();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[CHUISWidgetHostViewController _applySecurityPolicyToLayer:allowsPrivacySensitiveContent:]();
    }
    uint64_t v7 = 0;
  }

  [v5 setDisableUpdateMask:v7];
}

- (id)_snapshotImageFromURL:(id)a3
{
  keys[3] = *(void **)MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    keys[0] = @"kCGImageSourceSkipCRC";
    keys[1] = @"kCGImageSourceSkipMetadata";
    keys[2] = *(void **)MEMORY[0x1E4F2FF78];
    BOOL v4 = (void *)*MEMORY[0x1E4F1CFD0];
    values[0] = *(void **)MEMORY[0x1E4F1CFC8];
    values[1] = v4;
    values[2] = @"com.apple.atx";
    CFDictionaryRef v5 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 3, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    id v6 = [v3 path];
    uint64_t v7 = (CGImageSource *)CGImageSourceCreateWithFile();

    if (v7 && (ImageAtIndeCGFloat x = CGImageSourceCreateImageAtIndex(v7, 0, v5), CFRelease(v7), ImageAtIndex))
    {
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithCGImage:ImageAtIndex];
      CGImageRelease(ImageAtIndex);
    }
    else
    {
      id v9 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)_createWidgetSnapshotViews
{
  id v35 = [(CHUISWidgetHostViewController *)self _containerView];
  id v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  persistedWidgetSnapshotViewContainer = self->_persistedWidgetSnapshotViewContainer;
  self->_persistedWidgetSnapshotViewContainer = v3;

  CFDictionaryRef v5 = self->_persistedWidgetSnapshotViewContainer;
  [v35 bounds];
  -[UIView setFrame:](v5, "setFrame:");
  [(UIView *)self->_persistedWidgetSnapshotViewContainer setAutoresizingMask:18];
  id v6 = [(UIView *)self->_persistedWidgetSnapshotViewContainer layer];
  [v6 setName:@"Snapshot Container"];

  [(UIView *)self->_persistedWidgetSnapshotViewContainer setClipsToBounds:1];
  [(UIView *)self->_persistedWidgetSnapshotViewContainer setHidden:1];
  [(UIView *)self->_persistedWidgetSnapshotViewContainer setAlpha:0.0];
  [v35 addSubview:self->_persistedWidgetSnapshotViewContainer];
  uint64_t v7 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:0];
  persistedWidgetSnapshotImageView = self->_persistedWidgetSnapshotImageView;
  self->_persistedWidgetSnapshotImageView = v7;

  id v9 = self->_persistedWidgetSnapshotImageView;
  [v35 bounds];
  -[UIImageView setFrame:](v9, "setFrame:");
  uint64_t v10 = [(UIImageView *)self->_persistedWidgetSnapshotImageView layer];
  [v10 setName:@"Persistent Image View"];

  [(UIImageView *)self->_persistedWidgetSnapshotImageView setAutoresizingMask:18];
  [(UIImageView *)self->_persistedWidgetSnapshotImageView setClipsToBounds:1];
  [(UIImageView *)self->_persistedWidgetSnapshotImageView setHidden:1];
  [(UIImageView *)self->_persistedWidgetSnapshotImageView setAlpha:0.0];
  [(UIView *)self->_persistedWidgetSnapshotViewContainer addSubview:self->_persistedWidgetSnapshotImageView];
  id v11 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  liveSceneSnapshotView = self->_liveSceneSnapshotView;
  self->_liveSceneSnapshotView = v11;

  id v13 = [(UIView *)self->_liveSceneSnapshotView layer];
  [v13 setName:@"Live Scene Snapshot View"];

  os_signpost_id_t v14 = self->_liveSceneSnapshotView;
  [v35 bounds];
  -[UIView setFrame:](v14, "setFrame:");
  [(UIView *)self->_liveSceneSnapshotView setClipsToBounds:1];
  [(UIView *)self->_liveSceneSnapshotView setHidden:1];
  [(UIView *)self->_liveSceneSnapshotView setAlpha:0.0];
  [(UIView *)self->_liveSceneSnapshotView setAutoresizingMask:18];
  [v35 addSubview:self->_liveSceneSnapshotView];
  if ([(CHUISPreferences *)self->_preferences debugSnapshotViewColoring])
  {
    id v15 = [CHUISTouchPassThroughView alloc];
    uint64_t v16 = -[CHUISTouchPassThroughView initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    snapshotDebugView = self->_snapshotDebugView;
    self->_snapshotDebugView = v16;

    __int16 v18 = self->_snapshotDebugView;
    __int16 v19 = [MEMORY[0x1E4FB1618] yellowColor];
    __int16 v20 = [v19 colorWithAlphaComponent:0.7];
    [(UIView *)v18 setBackgroundColor:v20];

    __int16 v21 = self->_snapshotDebugView;
    uint64_t v22 = [(CHUISWidgetHostViewController *)self view];
    [v22 bounds];
    -[UIView setFrame:](v21, "setFrame:");

    uint64_t v23 = [(UIView *)self->_snapshotDebugView layer];
    [v23 setName:@"Snapshot Debug View"];

    [(UIView *)self->_snapshotDebugView setClipsToBounds:1];
    [(UIView *)self->_snapshotDebugView setHidden:1];
    [(UIView *)self->_snapshotDebugView setAlpha:0.0];
    [(UIView *)self->_snapshotDebugView setAutoresizingMask:18];
    id v24 = [(CHUISWidgetHostViewController *)self view];
    [v24 addSubview:self->_snapshotDebugView];
  }
  if ([(CHUISPreferences *)self->_preferences debugViewLabels])
  {
    char v25 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    snapshotDebugLabel = self->_snapshotDebugLabel;
    self->_snapshotDebugLabel = v25;

    int v27 = self->_snapshotDebugLabel;
    uint64_t v28 = [MEMORY[0x1E4FB08E0] systemFontOfSize:16.0];
    [(UILabel *)v27 setFont:v28];

    [(UILabel *)self->_snapshotDebugLabel setTextAlignment:1];
    __int16 v29 = self->_snapshotDebugLabel;
    long long v30 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.75];
    [(UILabel *)v29 setTextColor:v30];

    __int16 v31 = self->_snapshotDebugLabel;
    long long v32 = [MEMORY[0x1E4FB1618] colorWithWhite:0.9 alpha:0.75];
    [(UILabel *)v31 setBackgroundColor:v32];

    uint64_t v33 = [(UILabel *)self->_snapshotDebugLabel layer];
    [v33 setName:@"Snapshot Debug Label"];

    [(UILabel *)self->_snapshotDebugLabel setHidden:1];
    [(UILabel *)self->_snapshotDebugLabel setAlpha:0.0];
    [(UILabel *)self->_snapshotDebugLabel setAutoresizingMask:45];
    uint64_t v34 = [(CHUISWidgetHostViewController *)self view];
    [v34 addSubview:self->_snapshotDebugLabel];
  }
  [(CHUISWidgetHostViewController *)self _updateViewsCornerRadius];
}

- (void)_updateViewsCornerRadius
{
  [(CHUISWidgetHostViewController *)self _effectiveViewCornerRadius];
  double v4 = v3;
  -[UIView _setContinuousCornerRadius:](self->_persistedWidgetSnapshotViewContainer, "_setContinuousCornerRadius:");
  [(UIImageView *)self->_persistedWidgetSnapshotImageView _setContinuousCornerRadius:v4];
  [(UIView *)self->_liveSceneSnapshotView _setContinuousCornerRadius:v4];
  id v7 = [(UIScenePresenter *)self->_scenePresenter presentationView];
  [v7 _setContinuousCornerRadius:v4];

  [(CHUISWidgetHostViewController *)self _effectiveCornerRadius];
  double v6 = v5;
  -[UIView _setContinuousCornerRadius:](self->_snapshotDebugView, "_setContinuousCornerRadius:");
  [(UILabel *)self->_snapshotDebugLabel _setContinuousCornerRadius:v6];
  [(UIVisualEffectView *)self->_materialView _setContinuousCornerRadius:v6];
  id v8 = [(UIVisualEffectView *)self->_materialView layer];
  [v8 setCornerRadius:v6];
}

- (void)_updateSnapshotDebugLabelText:(id)a3
{
  id v7 = a3;
  -[UILabel setText:](self->_snapshotDebugLabel, "setText:");
  [(UILabel *)self->_snapshotDebugLabel sizeToFit];
  snapshotDebugLabel = self->_snapshotDebugLabel;
  [(UILabel *)snapshotDebugLabel bounds];
  CGRect v10 = CGRectInset(v9, -4.0, -4.0);
  -[UILabel setBounds:](snapshotDebugLabel, "setBounds:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
  double v5 = self->_snapshotDebugLabel;
  double v6 = [(CHUISWidgetHostViewController *)self view];
  [v6 bounds];
  UIRectGetCenter();
  -[UILabel setCenter:](v5, "setCenter:");
}

- (BOOL)_canLiveSnapshot
{
  double v3 = [(CHSWidget *)self->_widget extensionBundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.mobiletimer.WorldClockWidget"];

  if (v4) {
    return 0;
  }
  else {
    return ![(CHUISPreferences *)self->_preferences debugPrefersStaticSnapshots];
  }
}

- (void)_applyLiveSnapshotContentsFromSnapshot:(id)a3
{
  id v6 = a3;
  char v4 = [v6 IOSurface];
  if (!v4)
  {
    char v4 = [v6 CGImage];
  }
  double v5 = [(UIView *)self->_liveSceneSnapshotView layer];
  [v5 setContents:v4];

  [(UIView *)self->_liveSceneSnapshotView setClipsToBounds:1];
}

- (void)_ensureAndEvaluateSnapshotView
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t effectivePresentationMode = self->_effectivePresentationMode;
  if (!effectivePresentationMode)
  {
    __int16 v18 = [MEMORY[0x1E4F28B00] currentHandler];

    unint64_t effectivePresentationMode = self->_effectivePresentationMode;
  }
  if (effectivePresentationMode == 2 && [(FBScene *)self->_scene contentState] == 2)
  {
    double v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"CHUISWidgetHostViewController.m" lineNumber:1878 description:@"Live mode can only show a snapshot when the scene does not have content."];
  }
  if ([(CHUISWidgetHostViewController *)self canAppearInSecureEnvironment]
    && [(CHUISWidgetHostViewController *)self _inSecureEnvironmentTriState] == 1
    || (self->_effectivePresentationMode & 0xFFFFFFFFFFFFFFFELL) != 2
    || !CHUISHasGlobalCaptureEntitlement())
  {
    goto LABEL_15;
  }
  id v6 = [(UIView *)self->_liveSceneSnapshotView layer];
  id v7 = [v6 contents];

  if (v7) {
    goto LABEL_17;
  }
  if ([(FBScene *)self->_scene contentState] == 2)
  {
    [(CHUISWidgetHostViewController *)self _hideSnapshotViewsAnimated:0];
    id v8 = CHUISLogViewController();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      cachedSceneLogDigest = self->_cachedSceneLogDigest;
      int v19 = 134218242;
      __int16 v20 = self;
      __int16 v21 = 2114;
      uint64_t v22 = cachedSceneLogDigest;
      _os_log_impl(&dword_1BC3F1000, v8, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Create live scene snapshot view.", (uint8_t *)&v19, 0x16u);
    }

    CGRect v10 = (void *)[(UIScenePresenter *)self->_scenePresenter newSnapshot];
    [(CHUISWidgetHostViewController *)self _applyLiveSnapshotContentsFromSnapshot:v10];

    id v11 = [(UIView *)self->_liveSceneSnapshotView layer];
    [(CHUISWidgetHostViewController *)self _applySecurityPolicyToLayer:v11];

    [(UIView *)self->_liveSceneSnapshotView setHidden:0];
    [(UIView *)self->_liveSceneSnapshotView setAlpha:1.0];
    snapshotDebugView = self->_snapshotDebugView;
    id v13 = [MEMORY[0x1E4FB1618] orangeColor];
    os_signpost_id_t v14 = [v13 colorWithAlphaComponent:0.7];
    [(UIView *)snapshotDebugView setBackgroundColor:v14];

    [(CHUISWidgetHostViewController *)self _updateSnapshotDebugLabelText:@"LIVE SNAPSHOT"];
  }
  else
  {
LABEL_15:
    if (![(CHUISWidgetHostViewController *)self _isPersistedSnapshotContentVisible])
    {
      [(CHUISWidgetHostViewController *)self _hideSnapshotViewsAnimated:0];
      [(CHUISWidgetHostViewController *)self _updatePersistedSnapshotContent];
    }
  }
LABEL_17:
  snapshotDebugLabel = self->_snapshotDebugLabel;
  if (snapshotDebugLabel && [(UILabel *)snapshotDebugLabel isHidden])
  {
    [(UILabel *)self->_snapshotDebugLabel setHidden:0];
    [(UILabel *)self->_snapshotDebugLabel setAlpha:1.0];
  }
  uint64_t v16 = self->_snapshotDebugView;
  if (v16)
  {
    if ([(UIView *)v16 isHidden])
    {
      p_snapshotDebugView = &self->_snapshotDebugView;
      [(UIView *)*p_snapshotDebugView setHidden:0];
      [(UIView *)*p_snapshotDebugView setAlpha:1.0];
    }
  }
}

- (BOOL)_isPersistedSnapshotContentVisible
{
  [(UIView *)self->_persistedWidgetSnapshotViewContainer alpha];
  char v3 = BSFloatEqualToFloat();
  char v4 = [(UIImageView *)self->_persistedWidgetSnapshotImageView image];
  if (v4) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = self->_persistedWidgetSnapshotCaarView != 0;
  }

  return v5 & ~v3;
}

- (void)_updatePersistedSnapshotContentIfNecessary
{
  if ((self->_effectivePresentationMode | 2) == 3
    && [(CHUISWidgetHostViewController *)self _isPersistedSnapshotContentVisible])
  {
    [(CHUISWidgetHostViewController *)self _updatePersistedSnapshotContent];
  }
}

- (void)_updatePersistedSnapshotContent
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_1BC3F1000, v0, v1, "[%p-%{public}@] Create image snapshot view.", v2, v3, v4, v5, v6);
}

- (void)_hideSnapshotViewsAnimated:(BOOL)a3
{
}

- (void)_hideSnapshotViewsAnimated:(BOOL)a3 forceCompleteTeardown:(BOOL)a4
{
  BOOL v4 = a3;
  if (a4
    || ![(UIView *)self->_liveSceneSnapshotView isHidden]
    || ![(UIView *)self->_persistedWidgetSnapshotViewContainer isHidden])
  {
    unint64_t v6 = self->_snapshotHidingSequence + 1;
    self->_snapshotHidingSequence = v6;
    id v7 = CHUISLogViewController();
    id v8 = v7;
    os_signpost_id_t signpostID = self->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BC3F1000, v8, OS_SIGNPOST_EVENT, signpostID, "TeardownSnapshotView", "", buf, 2u);
    }

    CGRect v10 = CHUISLogViewController();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[CHUISWidgetHostViewController _hideSnapshotViewsAnimated:forceCompleteTeardown:]();
    }

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __82__CHUISWidgetHostViewController__hideSnapshotViewsAnimated_forceCompleteTeardown___block_invoke;
    aBlock[3] = &unk_1E62AF968;
    BOOL v18 = v4;
    void aBlock[4] = self;
    aBlock[5] = v6;
    id v11 = (void (**)(void))_Block_copy(aBlock);
    id v12 = v11;
    if (v4 && !self->_disableViewTransitionAnimations)
    {
      id v13 = (void *)MEMORY[0x1E4FB1EB0];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __82__CHUISWidgetHostViewController__hideSnapshotViewsAnimated_forceCompleteTeardown___block_invoke_260;
      v16[3] = &unk_1E62AF4E8;
      void v16[4] = self;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __82__CHUISWidgetHostViewController__hideSnapshotViewsAnimated_forceCompleteTeardown___block_invoke_2;
      v14[3] = &unk_1E62AF990;
      id v15 = v11;
      [v13 animateWithDuration:v16 animations:v14 completion:0.4];
    }
    else
    {
      v11[2](v11);
    }
  }
}

uint64_t __82__CHUISWidgetHostViewController__hideSnapshotViewsAnimated_forceCompleteTeardown___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (!*(unsigned char *)(result + 48) || *(void *)(result + 40) == *(void *)(*(void *)(result + 32) + 1224))
  {
    uint64_t v2 = CHUISLogViewController();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __82__CHUISWidgetHostViewController__hideSnapshotViewsAnimated_forceCompleteTeardown___block_invoke_cold_1();
    }

    [*(id *)(*(void *)(v1 + 32) + 1040) removeFromSuperview];
    uint64_t v3 = *(void *)(v1 + 32);
    BOOL v4 = *(void **)(v3 + 1040);
    *(void *)(v3 + 1040) = 0;

    [*(id *)(*(void *)(v1 + 32) + 1048) setImage:0];
    uint64_t v5 = [*(id *)(*(void *)(v1 + 32) + 1032) layer];
    [v5 setContents:0];

    [*(id *)(*(void *)(v1 + 32) + 1032) setHidden:1];
    [*(id *)(*(void *)(v1 + 32) + 1056) setHidden:1];
    [*(id *)(*(void *)(v1 + 32) + 1064) setHidden:1];
    [*(id *)(*(void *)(v1 + 32) + 1072) setHidden:1];
    [*(id *)(*(void *)(v1 + 32) + 1032) setAlpha:0.0];
    [*(id *)(*(void *)(v1 + 32) + 1056) setAlpha:0.0];
    [*(id *)(*(void *)(v1 + 32) + 1064) setAlpha:0.0];
    return [*(id *)(*(void *)(v1 + 32) + 1072) setAlpha:0.0];
  }
  return result;
}

uint64_t __82__CHUISWidgetHostViewController__hideSnapshotViewsAnimated_forceCompleteTeardown___block_invoke_260(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1032) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 1056) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 1064) setAlpha:0.0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1072);

  return [v2 setAlpha:0.0];
}

uint64_t __82__CHUISWidgetHostViewController__hideSnapshotViewsAnimated_forceCompleteTeardown___block_invoke_2(uint64_t a1)
{
  BSDispatchQueueAssertMain();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

- (void)_executeSceneContentReadyOperations
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(FBScene *)self->_scene contentState] != 2)
  {
    CGRect v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"CHUISWidgetHostViewController.m" lineNumber:2077 description:@"Scene content state was not ready"];
  }
  if ([(NSMutableArray *)self->_waitForSceneContentReadyBlocks count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    BOOL v4 = self->_waitForSceneContentReadyBlocks;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v12;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v4);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v7) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v7));
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }

    p_waitForSceneContentReadyBlocks = &self->_waitForSceneContentReadyBlocks;
    [(NSMutableArray *)*p_waitForSceneContentReadyBlocks removeAllObjects];
    CGRect v9 = *p_waitForSceneContentReadyBlocks;
    *p_waitForSceneContentReadyBlocks = 0;
  }
}

- (id)_containerView
{
  uint64_t v3 = [(BSUIVibrancyEffectView *)self->_vibrancyEffectView contentView];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(CHUISWidgetHostViewController *)self view];
  }
  uint64_t v6 = v5;

  return v6;
}

- (double)_effectiveCornerRadius
{
  if (!self->_metricsDefineSize) {
    return 0.0;
  }
  [(CHSWidgetMetrics *)self->_metrics _effectiveCornerRadius];
  return result;
}

- (double)_effectiveViewCornerRadius
{
  if (self->_clipBehavior) {
    return 0.0;
  }
  [(CHUISWidgetHostViewController *)self _effectiveCornerRadius];
  return result;
}

- (unint64_t)_inSecureEnvironmentTriState
{
  return self->_inSecureEnvironmentTriState;
}

- (void)_setInSecureEnvironment:(unint64_t)a3 forReason:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BSDispatchQueueAssertMain();
  if (self->_inSecureEnvironmentTriState != a3)
  {
    self->_inSecureEnvironmentTriState = a3;
    uint64_t v7 = CHUISLogViewController();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      cachedSceneLogDigest = self->_cachedSceneLogDigest;
      CGRect v9 = @"NotSet";
      if (a3 == 2) {
        CGRect v9 = @"No";
      }
      if (a3 == 1) {
        CGRect v9 = @"Yes";
      }
      CGRect v10 = v9;
      int v11 = 134218754;
      long long v12 = self;
      __int16 v13 = 2114;
      long long v14 = cachedSceneLogDigest;
      __int16 v15 = 2114;
      uint64_t v16 = v10;
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_impl(&dword_1BC3F1000, v7, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Secure environment changed to %{public}@ for reason: %{public}@", (uint8_t *)&v11, 0x2Au);
    }
    [(CHUISWidgetHostViewController *)self _hideSnapshotViewsAnimated:0 forceCompleteTeardown:1];
    [(CHUISWidgetHostViewController *)self _setEffectivePresentationMode:self->_effectivePresentationMode forceExistingRebuild:1];
  }
}

- (void)_evaluateEffectiveInSecureEnvironmentForReason:(id)a3
{
  id v5 = a3;
  if ([(CHUISWidgetHostViewController *)self _shouldBeEffectivelyLocked]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
  [(CHUISWidgetHostViewController *)self _setInSecureEnvironment:v4 forReason:v5];
}

- (BOOL)_shouldBeEffectivelyLocked
{
  return [(CHUISKeybag *)self->_keybag isEffectivelyLocked:self->_keybagLockPolicy];
}

- (void)_invalidateDetachedSceneTimerForReason:(id)a3
{
}

- (void)_invalidateDetachedSceneTimerForReason:(id)a3 ignoreLogging:(BOOL)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  detachedSceneTimer = self->_detachedSceneTimer;
  if (detachedSceneTimer)
  {
    if (!a4)
    {
      id v8 = CHUISLogViewController();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        cachedSceneLogDigest = self->_cachedSceneLogDigest;
        int v11 = 134218498;
        long long v12 = self;
        __int16 v13 = 2114;
        long long v14 = cachedSceneLogDigest;
        __int16 v15 = 2114;
        id v16 = v6;
        _os_log_impl(&dword_1BC3F1000, v8, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Invalidating detached scene timer for reason: %{public}@", (uint8_t *)&v11, 0x20u);
      }

      detachedSceneTimer = self->_detachedSceneTimer;
    }
    [(BSContinuousMachTimer *)detachedSceneTimer invalidate];
    CGRect v10 = self->_detachedSceneTimer;
    self->_detachedSceneTimer = 0;
  }
}

- (void)_scheduleEvaluationOfDetachedSceneTimerForReason:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  [(NSMutableArray *)self->_detachedSceneTimerEvaluationReasons addObject:v4];
  id v5 = CHUISLogViewController();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CHUISWidgetHostViewController _scheduleEvaluationOfDetachedSceneTimerForReason:]();
  }

  if ([(NSMutableArray *)self->_detachedSceneTimerEvaluationReasons count] == 1)
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __82__CHUISWidgetHostViewController__scheduleEvaluationOfDetachedSceneTimerForReason___block_invoke;
    v6[3] = &unk_1E62AF9B8;
    objc_copyWeak(&v7, &location);
    dispatch_async(MEMORY[0x1E4F14428], v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __82__CHUISWidgetHostViewController__scheduleEvaluationOfDetachedSceneTimerForReason___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained[147] componentsJoinedByString:@", "];
    id v4 = CHUISLogViewController();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __82__CHUISWidgetHostViewController__scheduleEvaluationOfDetachedSceneTimerForReason___block_invoke_cold_1();
    }

    [v2[147] removeAllObjects];
    objc_msgSend(v2, "__evaluateDetachedSceneTimerForReason:", v3);
  }
}

- (void)__evaluateDetachedSceneTimerForReason:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = [(CHUISWidgetHostViewController *)self view];
  uint64_t v5 = [v4 window];

  detachedSceneTimer = self->_detachedSceneTimer;
  if ((unint64_t)detachedSceneTimer | v5)
  {
    if (detachedSceneTimer) {
      BOOL v7 = v5 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7) {
      [(CHUISWidgetHostViewController *)self _invalidateDetachedSceneTimerForReason:@"Window exists"];
    }
  }
  else
  {
    scene = self->_scene;
    if (scene)
    {
      CGRect v9 = [(FBScene *)scene settings];
      int v10 = [v9 isForeground];

      if (v10)
      {
        int v11 = CHUISLogViewController();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          cachedSceneLogDigest = self->_cachedSceneLogDigest;
          *(_DWORD *)buf = 134218242;
          uint64_t v22 = self;
          __int16 v23 = 2114;
          id v24 = cachedSceneLogDigest;
          _os_log_impl(&dword_1BC3F1000, v11, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Detached scene detected. Starting idle timer...", buf, 0x16u);
        }

        [(CHUISWidgetHostViewController *)self _invalidateDetachedSceneTimerForReason:@"New timer" ignoreLogging:1];
        objc_initWeak((id *)buf, self);
        id v13 = objc_alloc(MEMORY[0x1E4F4F6F0]);
        long long v14 = [NSString stringWithFormat:@"<DetachedLiveSceneTimer-%@>", self->_cachedSceneLogDigest];
        __int16 v15 = (BSContinuousMachTimer *)[v13 initWithIdentifier:v14];
        id v16 = self->_detachedSceneTimer;
        self->_detachedSceneTimer = v15;

        uint64_t v17 = self->_detachedSceneTimer;
        double detachedSceneTimerInterval = self->_detachedSceneTimerInterval;
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __71__CHUISWidgetHostViewController___evaluateDetachedSceneTimerForReason___block_invoke;
        v19[3] = &unk_1E62AF9E0;
        objc_copyWeak(&v20, (id *)buf);
        [(BSContinuousMachTimer *)v17 scheduleWithFireInterval:MEMORY[0x1E4F14428] leewayInterval:v19 queue:detachedSceneTimerInterval handler:1.0];
        objc_destroyWeak(&v20);
        objc_destroyWeak((id *)buf);
      }
    }
  }
}

void __71__CHUISWidgetHostViewController___evaluateDetachedSceneTimerForReason___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained view];
    id v4 = [v3 window];
    if (v4 || !v2[125])
    {
    }
    else
    {
      uint64_t v5 = [v2[125] settings];
      int v6 = [v5 isForeground];

      if (v6)
      {
        BOOL v7 = CHUISLogViewController();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          __71__CHUISWidgetHostViewController___evaluateDetachedSceneTimerForReason___block_invoke_cold_1();
        }

        [v2 _tearDownScene];
      }
    }
    [v2 _invalidateDetachedSceneTimerForReason:@"Timer fired (no longer foreground)"];
  }
}

+ (id)_compatibilityMetrics
{
  if (_compatibilityMetrics_onceToken[0] != -1) {
    dispatch_once(_compatibilityMetrics_onceToken, &__block_literal_global_281);
  }
  uint64_t v2 = (void *)_compatibilityMetrics___compatibilityMetrics;

  return v2;
}

void __54__CHUISWidgetHostViewController__compatibilityMetrics__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F58E80]);
  uint64_t v1 = objc_msgSend(v0, "initWithSize:cornerRadius:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), 0.0);
  uint64_t v2 = (void *)_compatibilityMetrics___compatibilityMetrics;
  _compatibilityMetrics___compatibilityMetrics = v1;
}

- (int)_actualBackgroundViewMode
{
  if ([(UIVisualEffectView *)self->_materialView isHidden]) {
    return 0;
  }
  id v4 = [(UIVisualEffectView *)self->_materialView effect];
  if (v4) {
    int v3 = 2;
  }
  else {
    int v3 = 1;
  }

  return v3;
}

- (int)_expectedBackgroundViewMode
{
  if ([(CHSWidgetRenderScheme *)self->_renderScheme backgroundViewPolicy]) {
    return 0;
  }
  uint64_t v4 = [(CHSWidgetDescriptor *)self->_descriptor preferredBackgroundStyle];
  if (v4 == 2) {
    return 2 * self->_drawSystemBackgroundMaterialIfNecessary;
  }
  if (v4) {
    return 0;
  }
  scene = self->_scene;
  if (scene)
  {
    if ([(FBScene *)scene contentState] == 2) {
      return 0;
    }
  }
  return 1;
}

- (id)_effectiveBackgroundColor
{
  unint64_t colorScheme = self->_colorScheme;
  switch(colorScheme)
  {
    case 2uLL:
      self = [MEMORY[0x1E4FB1618] blackColor];
      break;
    case 1uLL:
      self = [MEMORY[0x1E4FB1618] whiteColor];
      break;
    case 0uLL:
      self = [MEMORY[0x1E4FB1618] systemBackgroundColor];
      break;
  }

  return self;
}

- (void)_setBackgroundViewMode:(int)a3
{
  if (self->_materialView)
  {
    if ([(CHUISWidgetHostViewController *)self _actualBackgroundViewMode] == a3) {
      return;
    }
  }
  else
  {
    uint64_t v5 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:0];
    materialView = self->_materialView;
    self->_materialView = v5;

    BOOL v7 = self->_materialView;
    id v12 = [(CHUISWidgetHostViewController *)self view];
    [v12 bounds];
    -[UIVisualEffectView setFrame:](v7, "setFrame:");

    id v8 = self->_materialView;
    id v13 = [(CHUISWidgetHostViewController *)self _effectiveBackgroundColor];
    -[UIVisualEffectView setBackgroundColor:](v8, "setBackgroundColor:");

    [(UIVisualEffectView *)self->_materialView setAutoresizingMask:18];
    id v14 = [(CHUISWidgetHostViewController *)self view];
    [v14 insertSubview:self->_materialView atIndex:0];

    id v15 = [(UIVisualEffectView *)self->_materialView layer];
    [v15 setName:@"Material View"];

    id v16 = [(CHUISWidgetHostViewController *)self view];
    [v16 setNeedsLayout];
  }
  if (a3 == 2)
  {
    [(UIVisualEffectView *)self->_materialView setHidden:0];
    id v20 = [MEMORY[0x1E4FB14C8] effectWithStyle:7];
    -[UIVisualEffectView setEffect:](self->_materialView, "setEffect:");
    [(UIVisualEffectView *)self->_materialView setBackgroundColor:0];
    int v11 = self->_materialView;
    [(CHUISWidgetHostViewController *)self _effectiveCornerRadius];
    -[UIVisualEffectView _setContinuousCornerRadius:](v11, "_setContinuousCornerRadius:");
  }
  else
  {
    if (a3 != 1)
    {
      if (!a3)
      {
        [(UIVisualEffectView *)self->_materialView setHidden:1];
        id v17 = [(UIVisualEffectView *)self->_materialView layer];
        [v17 setCornerRadius:0.0];

        CGRect v9 = self->_materialView;
        [(CHUISWidgetHostViewController *)self _effectiveCornerRadius];
        -[UIVisualEffectView _setContinuousCornerRadius:](v9, "_setContinuousCornerRadius:");
      }
      return;
    }
    [(UIVisualEffectView *)self->_materialView setHidden:0];
    [(UIVisualEffectView *)self->_materialView setEffect:0];
    id v18 = [(UIVisualEffectView *)self->_materialView layer];
    [(CHUISWidgetHostViewController *)self _effectiveCornerRadius];
    objc_msgSend(v18, "setCornerRadius:");

    id v19 = [(UIVisualEffectView *)self->_materialView layer];
    [v19 setCornerCurve:*MEMORY[0x1E4F39EA8]];

    int v10 = self->_materialView;
    id v20 = [(CHUISWidgetHostViewController *)self _effectiveBackgroundColor];
    -[UIVisualEffectView setBackgroundColor:](v10, "setBackgroundColor:");
  }
}

- (void)_updateBackgroundMaterialAndColor
{
  uint64_t v3 = [(CHUISWidgetHostViewController *)self _expectedBackgroundViewMode];

  [(CHUISWidgetHostViewController *)self _setBackgroundViewMode:v3];
}

- (BOOL)_isVibrancyEffectEnabled
{
  return [(CHSWidgetRenderScheme *)self->_renderScheme renderingMode] == 1
      && self->_vibrancyConfiguration != 0;
}

- (void)_updateVibrancyEffectView
{
  [(BSUIVibrancyEffectView *)self->_vibrancyEffectView setIsEnabled:[(CHUISWidgetHostViewController *)self _isVibrancyEffectEnabled]];
  vibrancyEffectView = self->_vibrancyEffectView;
  vibrancyConfiguration = self->_vibrancyConfiguration;

  [(BSUIVibrancyEffectView *)vibrancyEffectView setConfiguration:vibrancyConfiguration];
}

- (void)_updateDescriptorIfNecessary
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1BC3F1000, v0, v1, "[%p-%{public}@] Descriptor is now: %{public}@");
}

- (void)_evaluateEffectivePresentationMode
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unint64_t requestedPresentationMode = self->_requestedPresentationMode;
  if (requestedPresentationMode)
  {
    if ([(CHUISPreferences *)self->_preferences debugPrefersStaticSnapshots])
    {
      uint64_t v4 = CHUISLogViewController();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
LABEL_6:

        unint64_t requestedPresentationMode = 1;
        goto LABEL_10;
      }
      cachedSceneLogDigest = self->_cachedSceneLogDigest;
      *(_DWORD *)id v8 = 134218242;
      *(void *)&v8[4] = self;
      *(_WORD *)&v8[12] = 2114;
      *(void *)&v8[14] = cachedSceneLogDigest;
      int v6 = "[%p-%{public}@] Effective mode overridden to \"static\" due to user default.";
    }
    else
    {
      if (requestedPresentationMode != 3) {
        goto LABEL_10;
      }
      if ([(CHUISWidgetHostViewController *)self _canLiveSnapshot])
      {
        unint64_t requestedPresentationMode = 3;
        goto LABEL_10;
      }
      uint64_t v4 = CHUISLogViewController();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_6;
      }
      BOOL v7 = self->_cachedSceneLogDigest;
      *(_DWORD *)id v8 = 134218242;
      *(void *)&v8[4] = self;
      *(_WORD *)&v8[12] = 2114;
      *(void *)&v8[14] = v7;
      int v6 = "[%p-%{public}@] Effective mode overridden to \"static\" due to live snapshot being unsupported.";
    }
    _os_log_impl(&dword_1BC3F1000, v4, OS_LOG_TYPE_DEFAULT, v6, v8, 0x16u);
    goto LABEL_6;
  }
LABEL_10:
  -[CHUISWidgetHostViewController _setEffectivePresentationMode:](self, "_setEffectivePresentationMode:", requestedPresentationMode, *(_OWORD *)v8, *(void *)&v8[16], v9);
}

- (void)_setEffectivePresentationMode:(unint64_t)a3
{
}

- (void)_setEffectivePresentationMode:(unint64_t)a3 forceExistingRebuild:(BOOL)a4
{
  BOOL v4 = a4;
  BSDispatchQueueAssertMain();
  if (self->_effectivePresentationMode != a3 || v4)
  {
    self->_unint64_t effectivePresentationMode = a3;
    switch(a3)
    {
      case 0uLL:
        [(CHUISWidgetHostViewController *)self _hideSnapshotViewsAnimated:0];
        goto LABEL_9;
      case 1uLL:
        id v8 = [(CHUISWidgetHostViewController *)self view];
        uint64_t v9 = [v8 window];

        if (v9) {
          [(CHUISWidgetHostViewController *)self _ensureAndEvaluateSnapshotView];
        }
LABEL_9:
        [(CHUISWidgetHostViewController *)self _updateSceneToForeground:0];
        break;
      case 2uLL:
        [(CHUISWidgetHostViewController *)self _updateSceneToForeground:1];
        if ([(FBScene *)self->_scene contentState] == 2)
        {
          [(CHUISWidgetHostViewController *)self _hideSnapshotViewsAnimated:1];
        }
        else
        {
          int v11 = [(CHUISWidgetHostViewController *)self view];
          id v12 = [v11 window];

          if (v12)
          {
            [(CHUISWidgetHostViewController *)self _ensureAndEvaluateSnapshotView];
          }
        }
        break;
      case 3uLL:
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __84__CHUISWidgetHostViewController__setEffectivePresentationMode_forceExistingRebuild___block_invoke;
        aBlock[3] = &unk_1E62AF4E8;
        void aBlock[4] = self;
        int v10 = (void (**)(void))_Block_copy(aBlock);
        if ([(FBScene *)self->_scene contentState] == 2)
        {
          v10[2](v10);
          [(CHUISWidgetHostViewController *)self _updateSceneToForeground:0];
        }
        else
        {
          [(CHUISWidgetHostViewController *)self _updateSceneToForeground:1];
          v10[2](v10);
        }

        break;
      default:
        return;
    }
  }
}

void __84__CHUISWidgetHostViewController__setEffectivePresentationMode_forceExistingRebuild___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) view];
  uint64_t v3 = [v2 window];

  if (v3)
  {
    BOOL v4 = *(void **)(a1 + 32);
    [v4 _ensureAndEvaluateSnapshotView];
  }
}

- (void)_updateSceneToForeground:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  if (!self->_invalidated && (BSEqualBools() & 1) == 0)
  {
    if (v3)
    {
      uint64_t v5 = [(CHUISWidgetHostViewController *)self view];
      [v5 setClipsToBounds:0];

      int v6 = [(CHUISWidgetHostViewController *)self view];
      [v6 setBackgroundColor:0];
    }
    self->_sceneForeground = v3;
    if (self->_scene)
    {
      BOOL v7 = CHUISLogViewController();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        cachedSceneLogDigest = self->_cachedSceneLogDigest;
        uint64_t v9 = @"Background";
        *(_DWORD *)buf = 134218498;
        if (v3) {
          uint64_t v9 = @"Foreground";
        }
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = cachedSceneLogDigest;
        *(_WORD *)&buf[22] = 2114;
        v49 = v9;
        _os_log_impl(&dword_1BC3F1000, v7, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Updating - %{public}@", buf, 0x20u);
      }

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __58__CHUISWidgetHostViewController__updateSceneToForeground___block_invoke;
      aBlock[3] = &unk_1E62AFA28;
      void aBlock[4] = self;
      BOOL v43 = v3;
      int v10 = (void (**)(void))_Block_copy(aBlock);
      int v11 = v10;
      if (v3 || (self->_effectivePresentationMode | 2) != 3)
      {
        v10[2](v10);
      }
      else
      {
        v40[5] = MEMORY[0x1E4F143A8];
        v40[6] = 3221225472;
        v40[7] = __58__CHUISWidgetHostViewController__updateSceneToForeground___block_invoke_3;
        v40[8] = &unk_1E62AFA50;
        uint64_t v41 = v10;
        BSRunLoopPerformAfterCACommit();
      }
LABEL_24:
      [(CHUISWidgetHostViewController *)self _scheduleEvaluationOfDetachedSceneTimerForReason:@"scene modified"];
      return;
    }
    if (!-[CHUISPreferences enableMemoryStressTestingWithGaspar](self->_preferences, "enableMemoryStressTestingWithGaspar")|| ([MEMORY[0x1E4F28B50] mainBundle], id v12 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v12, "bundleIdentifier"), v13 = objc_claimAutoreleasedReturnValue(), v14 = objc_msgSend(v13, "isEqualToString:", @"com.apple.Gaspar"), v13, v12, (v14 & 1) != 0))
    {
      id v15 = CHUISLogViewController();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = self->_cachedSceneLogDigest;
        id v17 = @"Background";
        *(_DWORD *)buf = 134218498;
        if (v3) {
          id v17 = @"Foreground";
        }
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v16;
        *(_WORD *)&buf[22] = 2114;
        v49 = v17;
        _os_log_impl(&dword_1BC3F1000, v15, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Creating - %{public}@", buf, 0x20u);
      }

      sceneWorkspace = self->_sceneWorkspace;
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __58__CHUISWidgetHostViewController__updateSceneToForeground___block_invoke_300;
      v40[3] = &unk_1E62AFA78;
      v40[4] = self;
      id v19 = [(FBSceneWorkspace *)sceneWorkspace createScene:v40];
      scene = self->_scene;
      self->_scene = v19;

      [(FBScene *)self->_scene setDelegate:self];
      __int16 v21 = [(FBScene *)self->_scene layerManager];
      [v21 addObserver:self];

      uint64_t v22 = self->_scene;
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __58__CHUISWidgetHostViewController__updateSceneToForeground___block_invoke_2_307;
      v38[3] = &unk_1E62AFAF0;
      v38[4] = self;
      BOOL v39 = v3;
      [(FBScene *)v22 configureParameters:v38];
      __int16 v23 = [(FBScene *)self->_scene uiPresentationManager];
      id v24 = [v23 createPresenterWithIdentifier:@"default"];
      scenePresenter = self->_scenePresenter;
      self->_scenePresenter = v24;

      [(UIScenePresenter *)self->_scenePresenter modifyPresentationContext:&__block_literal_global_317];
      [(UIScenePresenter *)self->_scenePresenter activate];
      __int16 v26 = [(UIScenePresenter *)self->_scenePresenter presentationView];
      int v27 = [(CHUISWidgetHostViewController *)self _containerView];
      [v27 insertSubview:v26 atIndex:0];

      uint64_t v28 = [(CHUISWidgetHostViewController *)self view];
      [v28 setNeedsLayout];

      [v26 setClipsToBounds:1];
      __int16 v29 = [v26 layer];
      [v29 setName:@"Scene View"];

      [(CHUISWidgetHostViewController *)self _effectiveViewCornerRadius];
      objc_msgSend(v26, "_setContinuousCornerRadius:");
      uint64_t v44 = 0;
      objc_super v45 = &v44;
      uint64_t v46 = 0x2050000000;
      long long v30 = (void *)getBLSHBacklightFBSceneEnvironmentActionHandlerClass_softClass;
      uint64_t v47 = getBLSHBacklightFBSceneEnvironmentActionHandlerClass_softClass;
      if (!getBLSHBacklightFBSceneEnvironmentActionHandlerClass_softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = __getBLSHBacklightFBSceneEnvironmentActionHandlerClass_block_invoke;
        v49 = (__CFString *)&unk_1E62AFBA0;
        __int16 v50 = &v44;
        __getBLSHBacklightFBSceneEnvironmentActionHandlerClass_block_invoke((uint64_t)buf);
        long long v30 = (void *)v45[3];
      }
      __int16 v31 = v30;
      _Block_object_dispose(&v44, 8);
      long long v32 = (BLSHBacklightFBSceneEnvironmentActionHandler *)objc_alloc_init(v31);
      sceneBacklightActionHandler = self->_sceneBacklightActionHandler;
      self->_sceneBacklightActionHandler = v32;

      uint64_t v34 = [(FBScene *)self->_scene backlightSceneHostEnvironment];
      sceneBacklightEnvironment = self->_sceneBacklightEnvironment;
      self->_sceneBacklightEnvironment = v34;

      [(BLSHBacklightSceneHostEnvironment *)self->_sceneBacklightEnvironment setAlwaysOnEnabledForEnvironment:1];
      [(FBScene *)self->_scene activateWithTransitionContext:0];
      long long v36 = [(FBScene *)self->_scene identifier];
      [(CHUISWidgetHostViewController *)self sceneDidUpdateToSceneIdentifier:v36];

      goto LABEL_24;
    }
    __int16 v37 = CHUISLogViewController();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC3F1000, v37, OS_LOG_TYPE_DEFAULT, "Ignoring scene create due to stress testing mode with Gaspar enabled.", buf, 2u);
    }
  }
}

uint64_t __58__CHUISWidgetHostViewController__updateSceneToForeground___block_invoke(uint64_t a1)
{
  uint64_t result = BSEqualBools();
  if (result)
  {
    BOOL v3 = *(void **)(*(void *)(a1 + 32) + 1000);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __58__CHUISWidgetHostViewController__updateSceneToForeground___block_invoke_2;
    v4[3] = &__block_descriptor_33_e73_v24__0__FBSMutableSceneSettings_8__UIApplicationSceneTransitionContext_16l;
    char v5 = *(unsigned char *)(a1 + 40);
    [v3 performUpdate:v4];
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 1000) isActive];
    if ((result & 1) == 0) {
      return [*(id *)(*(void *)(a1 + 32) + 1000) activateWithTransitionContext:0];
    }
  }
  return result;
}

uint64_t __58__CHUISWidgetHostViewController__updateSceneToForeground___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setForeground:*(unsigned __int8 *)(a1 + 32)];
}

uint64_t __58__CHUISWidgetHostViewController__updateSceneToForeground___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__CHUISWidgetHostViewController__updateSceneToForeground___block_invoke_300(uint64_t a1, void *a2)
{
  id v12 = a2;
  BOOL v3 = [NSString stringWithFormat:@"scene::%@::%p", *(void *)(*(void *)(a1 + 32) + 1392), *(void *)(a1 + 32)];
  [v12 setIdentifier:v3];

  BOOL v4 = [*(id *)(a1 + 32) sceneSpecification];
  [v12 setSpecification:v4];

  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 1232) widgetRenderer];
  int v6 = (void *)v5;
  BOOL v7 = (void *)__defaultWidgetRendererBundleID;
  if (v5) {
    BOOL v7 = (void *)v5;
  }
  id v8 = v7;

  uint64_t v9 = FBSSceneClientIdentity;
  int v10 = [MEMORY[0x1E4F96408] identityForApplicationJobLabel:v8];
  int v11 = [v9 identityForProcessIdentity:v10];

  [v12 setClientIdentity:v11];
}

void __58__CHUISWidgetHostViewController__updateSceneToForeground___block_invoke_2_307(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__CHUISWidgetHostViewController__updateSceneToForeground___block_invoke_3_308;
  v5[3] = &unk_1E62AFAA0;
  void v5[4] = *(void *)(a1 + 32);
  char v6 = *(unsigned char *)(a1 + 40);
  [v3 updateSettingsWithBlock:v5];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__CHUISWidgetHostViewController__updateSceneToForeground___block_invoke_4;
  v4[3] = &unk_1E62AFAC8;
  void v4[4] = *(void *)(a1 + 32);
  [v3 updateClientSettingsWithBlock:v4];
}

void __58__CHUISWidgetHostViewController__updateSceneToForeground___block_invoke_3_308(uint64_t a1, void *a2)
{
  id v31 = a2;
  id v3 = [*(id *)(a1 + 32) metrics];
  BOOL v4 = *(unsigned char **)(a1 + 32);
  if (v4[1220])
  {
    [v4 _currentDisplayScale];
    objc_msgSend(v3, "_effectiveSizePixelAlignedForDisplayScale:");
    BSRectWithSize();
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    id v13 = [v4 view];
    [v13 bounds];
    double v6 = v14;
    double v8 = v15;
    double v10 = v16;
    double v12 = v17;
  }
  objc_msgSend(v31, "setFrame:", v6, v8, v10, v12);
  [v31 setInterfaceOrientation:1];
  id v18 = [*(id *)(a1 + 32) view];
  id v19 = [v18 window];

  if (v19)
  {
    id v20 = [*(id *)(a1 + 32) view];
    __int16 v21 = [v20 window];
    uint64_t v22 = [v21 windowScene];
    __int16 v23 = [v22 _FBSScene];
    id v24 = [v23 settings];
    uint64_t v25 = [v24 displayConfiguration];
    __int16 v26 = v25;
    if (v25)
    {
      id v27 = v25;
    }
    else
    {
      id v27 = [MEMORY[0x1E4F62420] mainConfiguration];
    }
    uint64_t v28 = v27;
  }
  else
  {
    uint64_t v28 = [MEMORY[0x1E4F62420] mainConfiguration];
  }
  [v31 setDisplayConfiguration:v28];
  [v31 setForeground:*(unsigned __int8 *)(a1 + 40)];
  [v31 setWidgetConfigurationIdentifier:*(void *)(*(void *)(a1 + 32) + 1392)];
  __int16 v29 = [*(id *)(a1 + 32) widget];
  [v31 setWidget:v29];

  [v31 setMetrics:v3];
  [v31 setVisibility:*(void *)(*(void *)(a1 + 32) + 1104)];
  [v31 setContentType:*(void *)(*(void *)(a1 + 32) + 1304)];
  [v31 setColorScheme:*(void *)(*(void *)(a1 + 32) + 1312)];
  [v31 setWidgetPriority:*(void *)(*(void *)(a1 + 32) + 1320)];
  [v31 setAnimationsPaused:*(unsigned __int8 *)(*(void *)(a1 + 32) + 1216)];
  [v31 setContentPaused:*(unsigned __int8 *)(*(void *)(a1 + 32) + 1217)];
  [v31 setKeybagLockPolicy:*(void *)(*(void *)(a1 + 32) + 1296)];
  [v31 setCanAppearInSecureEnvironment:*(unsigned __int8 *)(*(void *)(a1 + 32) + 1184)];
  long long v30 = [*(id *)(a1 + 32) additionalSnapshotPresentationContext];
  [v31 setAdditionalSnapshotPresentationContext:v30];

  [v31 setTintParameters:*(void *)(*(void *)(a1 + 32) + 1344)];
  [v31 setInlineTextParameters:*(void *)(*(void *)(a1 + 32) + 1352)];
  [v31 setSupportsLowLuminance:*(unsigned __int8 *)(*(void *)(a1 + 32) + 1272)];
  [v31 setPrefersUnredactedContentInLowLuminanceEnvironment:*(unsigned __int8 *)(*(void *)(a1 + 32) + 1273)];
  [v31 setShowsWidgetLabel:*(unsigned __int8 *)(*(void *)(a1 + 32) + 1360)];
  [v31 setInteractionDisabled:*(unsigned __int8 *)(*(void *)(a1 + 32) + 1361)];
  [v31 setRenderScheme:*(void *)(*(void *)(a1 + 32) + 1328)];
  [v31 setClipBehavior:*(void *)(*(void *)(a1 + 32) + 1368)];
  [v31 setWantsBaseContentTouchEvents:*(unsigned __int8 *)(*(void *)(a1 + 32) + 1365)];
  [*(id *)(a1 + 32) willModifySceneSettings:v31];
}

void __58__CHUISWidgetHostViewController__updateSceneToForeground___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setPreferredInterfaceOrientation:1];
  [*(id *)(a1 + 32) willModifySceneClientSettings:v3];
}

void __58__CHUISWidgetHostViewController__updateSceneToForeground___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setPresentedLayerTypes:26];
  [v2 setAppearanceStyle:2];
  [v2 setBackgroundColorWhileHosting:0];
  [v2 setBackgroundColorWhileNotHosting:0];
}

- (void)_tearDownScene
{
  [(UIScenePresenter *)self->_scenePresenter invalidate];
  scenePresenter = self->_scenePresenter;
  self->_scenePresenter = 0;

  self->_sceneForeground = 0;
  sceneBacklightActionHandler = self->_sceneBacklightActionHandler;
  self->_sceneBacklightActionHandler = 0;

  sceneBacklightEnvironment = self->_sceneBacklightEnvironment;
  self->_sceneBacklightEnvironment = 0;

  double v6 = [(FBScene *)self->_scene layerManager];
  [v6 removeObserver:self];

  [(FBScene *)self->_scene setDelegate:0];
  [(FBScene *)self->_scene invalidate];
  scene = self->_scene;
  self->_scene = 0;

  [(CHUISWidgetHostViewController *)self _invalidateDetachedSceneTimerForReason:@"scene invalidated"];
}

- (void)_modifyVisibilitySettings:(id)a3
{
  double v6 = (void (**)(id, void *))a3;
  BOOL v4 = (void *)[(CHUISWidgetVisibilitySettings *)self->_visibilitySettings mutableCopy];
  v6[2](v6, v4);
  double v5 = (void *)[v4 copy];
  [(CHUISWidgetHostViewController *)self _setVisibilitySettings:v5];
}

- (void)_updateTouchDeliveryPolicies
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1BC3F1000, v0, v1, "Cannot acquire touch assertion for an invalidated widget view controller.", v2, v3, v4, v5, v6);
}

void __61__CHUISWidgetHostViewController__updateTouchDeliveryPolicies__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v5 = CHUISLogViewControllerTouch();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = WeakRetained[139];
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 134218754;
      double v9 = WeakRetained;
      __int16 v10 = 2114;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      uint64_t v13 = v7;
      __int16 v14 = 2114;
      id v15 = v3;
      _os_log_impl(&dword_1BC3F1000, v5, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Sending touch delivery policy %{public}@ failed with error: %{public}@", (uint8_t *)&v8, 0x2Au);
    }
  }
}

- (void)_clearTouchDeliveryPolicies
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = CHUISLogViewControllerTouch();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    cachedSceneLogDigest = self->_cachedSceneLogDigest;
    int v5 = 134218242;
    uint64_t v6 = self;
    __int16 v7 = 2114;
    int v8 = cachedSceneLogDigest;
    _os_log_impl(&dword_1BC3F1000, v3, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Clearing any touch delivery policies", (uint8_t *)&v5, 0x16u);
  }

  [(NSMutableDictionary *)self->_touchDeliveryPolicyAssertions enumerateKeysAndObjectsUsingBlock:&__block_literal_global_330];
  [(NSMutableDictionary *)self->_touchDeliveryPolicyAssertions removeAllObjects];
}

uint64_t __60__CHUISWidgetHostViewController__clearTouchDeliveryPolicies__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidate];
}

- (BOOL)_isAppearingOrAppeared
{
  return [(CHUISWidgetHostViewController *)self _appearState] - 1 < 2;
}

- (void)_resetLogDigests
{
  id v3 = [(CHUISWidgetHostViewController *)self _logDigest];
  cachedSceneLogDigest = self->_cachedSceneLogDigest;
  self->_cachedSceneLogDigest = v3;
}

- (id)_cachedSceneLogDigest
{
  return self->_cachedSceneLogDigest;
}

- (id)_logDigest
{
  if (self->_contentType) {
    uint64_t v2 = @"preview";
  }
  else {
    uint64_t v2 = @"timeline";
  }
  id v3 = [(CHSWidget *)self->_widget _loggingIdentifierWithMetrics:self->_metrics prefix:v2];

  return v3;
}

- (BOOL)metricsDefineSize
{
  return self->_metricsDefineSize;
}

- (unint64_t)clipBehavior
{
  return self->_clipBehavior;
}

- (unint64_t)widgetPriority
{
  return self->_widgetPriority;
}

- (CHSScreenshotManager)_screenshotManager
{
  return self->_screenshotManager;
}

- (void)_setScreenshotManager:(id)a3
{
}

- (BOOL)disableViewTransitionAnimations
{
  return self->_disableViewTransitionAnimations;
}

- (void)setDisableViewTransitionAnimations:(BOOL)a3
{
  self->_disableViewTransitionAnimations = a3;
}

- (FBScene)_scene
{
  return self->_scene;
}

- (void)_setScene:(id)a3
{
}

- (UIScenePresenter)_scenePresenter
{
  return self->_scenePresenter;
}

- (void)_setScenePresenter:(id)a3
{
}

- (double)_detachedSceneTimerInterval
{
  return self->_detachedSceneTimerInterval;
}

- (void)_setDetachedSceneTimerInterval:(double)a3
{
  self->_double detachedSceneTimerInterval = a3;
}

- (CHUISWidgetHostViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CHUISWidgetHostViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CHSWidgetMetrics)metrics
{
  return self->_metrics;
}

- (NSString)widgetConfigurationIdentifier
{
  return self->_widgetConfigurationIdentifier;
}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  return self->_vibrancyConfiguration;
}

- (BOOL)shouldShareTouchesWithHost
{
  return self->_shouldShareTouchesWithHost;
}

- (BOOL)wantsBaseContentTouchEvents
{
  return self->_wantsBaseContentTouchEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrancyConfiguration, 0);
  objc_storeStrong((id *)&self->_widgetConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inlineTextParameters, 0);
  objc_storeStrong((id *)&self->_tintParameters, 0);
  objc_storeStrong((id *)&self->_renderScheme, 0);
  objc_storeStrong((id *)&self->_sceneBacklightActionHandler, 0);
  objc_storeStrong((id *)&self->_sceneBacklightEnvironment, 0);
  objc_storeStrong((id *)&self->_waitForSceneContentReadyBlocks, 0);
  objc_storeStrong((id *)&self->_extensionProvider, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_widgetMetrics, 0);
  objc_storeStrong((id *)&self->_widget, 0);
  objc_storeStrong((id *)&self->_detachedSceneTimerEvaluationReasons, 0);
  objc_storeStrong((id *)&self->_detachedSceneTimer, 0);
  objc_storeStrong((id *)&self->_stateCaptureAssertion, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_vibrancyEffectView, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_cachedSceneLogDigest, 0);
  objc_storeStrong((id *)&self->_visibilitySettings, 0);
  objc_storeStrong((id *)&self->_screenshotManager, 0);
  objc_storeStrong((id *)&self->_snapshotDebugView, 0);
  objc_storeStrong((id *)&self->_snapshotDebugLabel, 0);
  objc_storeStrong((id *)&self->_persistedWidgetSnapshotViewContainer, 0);
  objc_storeStrong((id *)&self->_persistedWidgetSnapshotImageView, 0);
  objc_storeStrong((id *)&self->_persistedWidgetSnapshotCaarView, 0);
  objc_storeStrong((id *)&self->_liveSceneSnapshotView, 0);
  objc_storeStrong((id *)&self->_touchDeliveryPolicyAssertions, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_sceneWorkspace, 0);

  objc_storeStrong((id *)&self->_keybag, 0);
}

- (void)initWithWidget:metrics:widgetConfigurationIdentifier:extensionProvider:sceneWorkspace:screenshotManager:preferences:keybag:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_1BC3F1000, v0, v1, "[%p-%{public}@] Created.", v2, v3, v4, v5, v6);
}

- (void)setWidget:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1BC3F1000, v0, v1, "Unable to set a new widget on an invalidated widget view controller.", v2, v3, v4, v5, v6);
}

- (void)setPresentationMode:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1BC3F1000, v0, v1, "Unable to set a new presentation mode on an invalidated widget view controller.", v2, v3, v4, v5, v6);
}

- (void)setVisibility:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1BC3F1000, v0, v1, "Unable to set visibility on an invalidated widget view controller.", v2, v3, v4, v5, v6);
}

- (void)setVisibleBounds:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1BC3F1000, v0, v1, "Unable to set visible bounds on an invalidated widget view controller.", v2, v3, v4, v5, v6);
}

- (void)setAnimationsPaused:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1BC3F1000, v0, v1, "[%p-%{public}@] Animations paused: %{public}@");
}

- (void)setAnimationsPaused:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1BC3F1000, v0, v1, "Unable to set animations paused on an invalidated widget view controller.", v2, v3, v4, v5, v6);
}

- (void)setContentPaused:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1BC3F1000, v0, v1, "[%p-%{public}@] Content paused: %{public}@");
}

- (void)setContentPaused:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1BC3F1000, v0, v1, "Unable to set content paused on an invalidated widget view controller.", v2, v3, v4, v5, v6);
}

- (void)setTintParameters:fencingAnimations:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_1BC3F1000, v0, v1, "[%p-%{public}@] Tinting parameters change deferred", v2, v3, v4, v5, v6);
}

- (void)setTintParameters:fencingAnimations:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_1BC3F1000, v0, v1, "[%p-%{public}@] Tinting parameters changed", v2, v3, v4, v5, v6);
}

- (void)setTintParameters:fencingAnimations:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1BC3F1000, v0, v1, "Unable to set tint parameters on an invalidated widget view controller.", v2, v3, v4, v5, v6);
}

- (void)setInlineTextParameters:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_1BC3F1000, v0, v1, "[%p-%{public}@] Inline text settings changed", v2, v3, v4, v5, v6);
}

- (void)setInlineTextParameters:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1BC3F1000, v0, v1, "Unable to set inline text settings on an invalidated widget view controller.", v2, v3, v4, v5, v6);
}

- (void)setVisibleEntryShouldSnapshot:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1BC3F1000, v0, v1, "[%p-%{public}@] Should Visible entry snapshotting changed to %{public}@");
}

- (void)setVisibleEntryShouldSnapshot:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1BC3F1000, v0, v1, "Unable to set snapshotability on an invalidated widget view controller.", v2, v3, v4, v5, v6);
}

- (void)setShouldShareTouchesWithHost:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1BC3F1000, v0, v1, "Unable to tag a widget view controller as visibly settled after invalidation.", v2, v3, v4, v5, v6);
}

- (void)cancelTouchesForCurrentEventInHostedContent
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1BC3F1000, v0, v1, "Cannot acquire cancel touch assertion for an invalidated widget view controller.", v2, v3, v4, v5, v6);
}

- (void)setDrawSystemBackgroundMaterialIfNecessary:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1BC3F1000, v0, v1, "Unable to set draw system background material on an invalidated widget view controller.", v2, v3, v4, v5, v6);
}

- (void)_snapshotViewIgnoringVibrancyEffect:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1BC3F1000, v0, v1, "Cannot acquire a scene snapshot on an invalidated widget view controller.", v2, v3, v4, v5, v6);
}

- (void)_implicitSetRenderScheme:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1BC3F1000, v0, v1, "[%p-%{public}@] Render scheme changed to: %{public}@");
}

void __73__CHUISWidgetHostViewController_extensionsDidChangeForExtensionProvider___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1BC3F1000, v0, v1, "[%p-%{public}@] Descriptors did change", v2, v3, v4, v5, v6);
}

- (void)_newPersistedSnapshotView
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 1112);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1BC3F1000, a2, OS_LOG_TYPE_DEBUG, "Read astc snapshot for %{public}@!", (uint8_t *)&v3, 0xCu);
}

- (void)_applySecurityPolicyToLayer:allowsPrivacySensitiveContent:.cold.1()
{
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1BC3F1000, v0, OS_LOG_TYPE_DEBUG, "Snapshot layer will be disabled when locked", v1, 2u);
}

- (void)_applySecurityPolicyToLayer:allowsPrivacySensitiveContent:.cold.2()
{
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1BC3F1000, v0, OS_LOG_TYPE_DEBUG, "Snapshot layer will be enabled when locked", v1, 2u);
}

- (void)_hideSnapshotViewsAnimated:forceCompleteTeardown:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1BC3F1000, v0, v1, "[%p-%{public}@] Destroy snapshot views (animated: %{public}@)");
}

void __82__CHUISWidgetHostViewController__hideSnapshotViewsAnimated_forceCompleteTeardown___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1BC3F1000, v0, v1, "[%p-%{public}@] Finish hiding snapshots", v2, v3, v4, v5, v6);
}

- (void)_scheduleEvaluationOfDetachedSceneTimerForReason:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1BC3F1000, v0, v1, "[%p-%{public}@] Scheduling detached scene timer evaluation for reason: %@");
}

void __82__CHUISWidgetHostViewController__scheduleEvaluationOfDetachedSceneTimerForReason___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1BC3F1000, v0, v1, "[%p-%{public}@] Running detached scene timer evaluation for reason(s): %@");
}

void __71__CHUISWidgetHostViewController___evaluateDetachedSceneTimerForReason___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1BC3F1000, v0, OS_LOG_TYPE_ERROR, "[%p-%{public}@] Detached scene idle timer fired. Invalidating scene.", v1, 0x16u);
}

@end