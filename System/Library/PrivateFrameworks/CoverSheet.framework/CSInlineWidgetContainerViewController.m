@interface CSInlineWidgetContainerViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)interpretsViewAsContent:(id)a3;
- (BOOL)isScreenOff;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (CSComplicationDescriptor)widgetDescriptor;
- (CSComplicationManager)complicationManager;
- (CSComplicationWrapperViewController)widgetViewController;
- (CSInlineWidgetContainerViewController)initWithComplicationManager:(id)a3;
- (CSInlineWidgetContainerViewController)initWithComplicationManager:(id)a3 inlineTextAlignment:(unint64_t)a4;
- (CSInlineWidgetContainerViewControllerDelegate)delegate;
- (NSMutableDictionary)cancelTouchesAssertionsByUniqueIdentifier;
- (UIColor)tintColor;
- (UIView)complicationSuperview;
- (id)_buildComplicationPresentationStateForTraitCollection:(id)a3;
- (id)_currentState;
- (id)_hostViewControllerForComplicationDescriptor:(id)a3;
- (id)_widgetTintParameters;
- (id)sceneHostEnvironmentEntriesForBacklightSession;
- (int64_t)layoutStyle;
- (unint64_t)inlineTextAlignment;
- (void)_backlightLuminanceDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_setTextParametersAndFontForWidgetController:(id)a3;
- (void)_updatePresentationStyleForReason:(id)a3;
- (void)_updatePresentationStyleForTransitionToNewTraitCollection:(id)a3 reason:(id)a4;
- (void)beginCancellingTouches;
- (void)endCancellingTouches;
- (void)handleComplicationSelectionGesture:(id)a3;
- (void)setCancelTouchesAssertionsByUniqueIdentifier:(id)a3;
- (void)setComplicationManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInlineTextAlignment:(unint64_t)a3;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setScreenOff:(BOOL)a3;
- (void)setTintColor:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)setWidgetDescriptor:(id)a3;
- (void)setWidgetViewController:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)widgetHostViewController:(id)a3 requestsLaunchWithAction:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CSInlineWidgetContainerViewController

- (CSInlineWidgetContainerViewController)initWithComplicationManager:(id)a3
{
  return [(CSInlineWidgetContainerViewController *)self initWithComplicationManager:a3 inlineTextAlignment:0];
}

- (CSInlineWidgetContainerViewController)initWithComplicationManager:(id)a3 inlineTextAlignment:(unint64_t)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSInlineWidgetContainerViewController;
  v8 = [(CSCoverSheetViewControllerBase *)&v14 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_complicationManager, a3);
    v9->_inlineTextAlignment = a4;
    v9->_layoutStyle = 0;
    v10 = self;
    v15[0] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    id v12 = (id)[(CSInlineWidgetContainerViewController *)v9 registerForTraitChanges:v11 withAction:sel__backlightLuminanceDidChange_previousTraitCollection_];
  }
  return v9;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSInlineWidgetContainerViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewWillAppear:a3];
  [(CSInlineWidgetContainerViewController *)self setVisible:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSInlineWidgetContainerViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewDidDisappear:a3];
  [(CSInlineWidgetContainerViewController *)self setVisible:0];
}

- (void)setScreenOff:(BOOL)a3
{
  if (self->_screenOff != a3)
  {
    self->_screenOff = a3;
    objc_super v4 = NSString;
    NSStringFromBOOL();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = [v4 stringWithFormat:@"setScreenOff:%@", v6];
    [(CSInlineWidgetContainerViewController *)self _updatePresentationStyleForReason:v5];
  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSInlineWidgetContainerViewController;
  id v7 = a4;
  [(CSInlineWidgetContainerViewController *)&v11 willTransitionToTraitCollection:v6 withTransitionCoordinator:v7];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __99__CSInlineWidgetContainerViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E6AD99F0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 animateAlongsideTransition:v9 completion:&__block_literal_global_9];
}

uint64_t __99__CSInlineWidgetContainerViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePresentationStyleForTransitionToNewTraitCollection:*(void *)(a1 + 40) reason:@"willTransitionToTraitCollection:withTransitionCoordinator:"];
}

- (void)_backlightLuminanceDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v7 = [a3 traitCollection];
  id v6 = NSStringFromSelector(a2);
  [(CSInlineWidgetContainerViewController *)self _updatePresentationStyleForTransitionToNewTraitCollection:v7 reason:v6];
}

- (void)setVisible:(BOOL)a3
{
  if (self->_isVisible != a3)
  {
    self->_isVisible = a3;
    objc_super v4 = NSString;
    NSStringFromBOOL();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = [v4 stringWithFormat:@"setVisible:%@", v6];
    [(CSInlineWidgetContainerViewController *)self _updatePresentationStyleForReason:v5];
  }
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    id v3 = [(CSInlineWidgetContainerViewController *)self view];
    [v3 setNeedsLayout];
  }
}

- (void)viewDidLayoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)CSInlineWidgetContainerViewController;
  [(CSCoverSheetViewControllerBase *)&v11 viewDidLayoutSubviews];
  id v3 = [(CSComplicationWrapperViewController *)self->_widgetViewController view];
  objc_super v4 = [(CSInlineWidgetContainerViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");

  v5 = NSString;
  id v6 = [(CSComplicationDescriptor *)self->_widgetDescriptor widget];
  id v7 = [v6 extensionBundleIdentifier];
  id v8 = [(CSComplicationDescriptor *)self->_widgetDescriptor widget];
  v9 = [v8 kind];
  id v10 = [v5 stringWithFormat:@"%@:%@", v7, v9];

  [v3 setAccessibilityIdentifier:v10];
  [v3 setAccessibilityValue:@"Widget"];
}

- (void)setWidgetDescriptor:(id)a3
{
  p_widgetDescriptor = &self->_widgetDescriptor;
  id v13 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    if (*p_widgetDescriptor)
    {
      [(CSInlineWidgetContainerViewController *)self bs_removeChildViewController:self->_widgetViewController];
      widgetViewController = self->_widgetViewController;
      self->_widgetViewController = 0;
    }
    objc_storeStrong((id *)&self->_widgetDescriptor, a3);
    id v8 = [(CSInlineWidgetContainerViewController *)self _hostViewControllerForComplicationDescriptor:v13];
    v9 = self->_widgetViewController;
    self->_widgetViewController = v8;

    [(CSInlineWidgetContainerViewController *)self loadViewIfNeeded];
    id v10 = self->_widgetViewController;
    objc_super v11 = [(CSInlineWidgetContainerViewController *)self view];
    [(CSInlineWidgetContainerViewController *)self bs_addChildViewController:v10 withSuperview:v11];

    id v12 = NSStringFromSelector(a2);
    [(CSInlineWidgetContainerViewController *)self _updatePresentationStyleForReason:v12];
  }
}

- (id)sceneHostEnvironmentEntriesForBacklightSession
{
  id v3 = [(CSComplicationWrapperViewController *)self->_widgetViewController widgetHostViewController];
  objc_super v4 = [v3 backlightHostEnvironment];

  v5 = [(CSComplicationWrapperViewController *)self->_widgetViewController widgetHostViewController];
  id v6 = [v5 widget];
  id v7 = [v6 extensionIdentity];
  id v8 = [v7 containerBundleIdentifier];

  if (v4)
  {
    v9 = [MEMORY[0x1E4FA5EB0] entryWithSceneHostEnvironment:v4 bundleIdentifier:v8];
    id v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v10;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setTintColor:(id)a3
{
  id v7 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_tintColor, a3);
    v5 = [(CSInlineWidgetContainerViewController *)self _widgetTintParameters];
    id v6 = [(CSComplicationWrapperViewController *)self->_widgetViewController widgetHostViewController];
    [v6 setTintParameters:v5];
  }
}

- (void)beginCancellingTouches
{
  id v11 = [(CSComplicationWrapperViewController *)self->_widgetViewController widgetHostViewController];
  id v3 = [v11 cancelTouchesForCurrentEventInHostedContent];
  if (v3)
  {
    cancelTouchesAssertionsByUniqueIdentifier = self->_cancelTouchesAssertionsByUniqueIdentifier;
    if (!cancelTouchesAssertionsByUniqueIdentifier)
    {
      v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v6 = self->_cancelTouchesAssertionsByUniqueIdentifier;
      self->_cancelTouchesAssertionsByUniqueIdentifier = v5;

      cancelTouchesAssertionsByUniqueIdentifier = self->_cancelTouchesAssertionsByUniqueIdentifier;
    }
    id v7 = [(CSComplicationDescriptor *)self->_widgetDescriptor uniqueIdentifier];
    id v8 = [(NSMutableDictionary *)cancelTouchesAssertionsByUniqueIdentifier objectForKey:v7];

    if (v8) {
      [v8 invalidate];
    }
    v9 = self->_cancelTouchesAssertionsByUniqueIdentifier;
    id v10 = [(CSComplicationDescriptor *)self->_widgetDescriptor uniqueIdentifier];
    [(NSMutableDictionary *)v9 setObject:v3 forKey:v10];
  }
}

- (void)endCancellingTouches
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_cancelTouchesAssertionsByUniqueIdentifier;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = -[NSMutableDictionary objectForKey:](self->_cancelTouchesAssertionsByUniqueIdentifier, "objectForKey:", *(void *)(*((void *)&v9 + 1) + 8 * v7), (void)v9);
        [v8 invalidate];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_cancelTouchesAssertionsByUniqueIdentifier removeAllObjects];
}

- (BOOL)interpretsViewAsContent:(id)a3
{
  if (!a3) {
    return 0;
  }
  widgetViewController = self->_widgetViewController;
  id v4 = a3;
  uint64_t v5 = [(CSComplicationWrapperViewController *)widgetViewController view];
  char v6 = [v5 containsView:v4];

  return v6;
}

- (void)handleComplicationSelectionGesture:(id)a3
{
  id v14 = a3;
  BOOL v4 = [v14 state] == 1 || objc_msgSend(v14, "state") == 2;
  if ([v14 state] == 3 || objc_msgSend(v14, "state") == 4)
  {
    [(CSComplicationWrapperViewController *)self->_widgetViewController setHighlighted:0];
  }
  else
  {
    uint64_t v5 = [(CSInlineWidgetContainerViewController *)self view];
    [v14 locationInView:v5];
    double v7 = v6;
    double v9 = v8;

    long long v10 = [(CSInlineWidgetContainerViewController *)self view];
    long long v11 = objc_msgSend(v10, "hitTest:withEvent:", 0, v7, v9);

    long long v12 = [(CSComplicationWrapperViewController *)self->_widgetViewController view];
    int v13 = [v12 containsView:v11];

    if (v13) {
      [(CSComplicationWrapperViewController *)self->_widgetViewController setHighlighted:v4];
    }
  }
}

- (id)_widgetTintParameters
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F58EE8]) initWithPrimaryTintColor:0 secondaryTintColor:0 filterStyle:2 fallbackFilterStyle:2 fraction:1.0];

  return v2;
}

- (void)_setTextParametersAndFontForWidgetController:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x1E4F58CD0];
  id v5 = a3;
  id v8 = objc_alloc_init(v4);
  [v8 setSize:&unk_1F306A878];
  double v6 = [NSNumber numberWithDouble:*MEMORY[0x1E4F43920]];
  [v8 setWeight:v6];

  id v7 = objc_alloc_init(MEMORY[0x1E4F58CE8]);
  [v7 setFontSpecification:v8];
  [v7 setSymbolScale:1];
  [v7 setShowsDateAlongsideText:1];
  [v7 setHorizontalAlignment:self->_inlineTextAlignment];
  [v5 setInlineTextParameters:v7];
}

- (id)_hostViewControllerForComplicationDescriptor:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x1E4F58F58];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [v5 widget];
  id v8 = [v5 metrics];
  double v9 = [v5 uniqueIdentifier];

  long long v10 = (void *)[v6 initWithWidget:v7 metrics:v8 widgetConfigurationIdentifier:v9];
  [(CSInlineWidgetContainerViewController *)self _setTextParametersAndFontForWidgetController:v10];
  [v10 setDrawSystemBackgroundMaterialIfNecessary:0];
  [v10 setVisibility:2];
  [v10 setCanAppearInSecureEnvironment:1];
  [v10 setShouldShareTouchesWithHost:1];
  [v10 setSupportsLowLuminance:1];
  [v10 setPrefersUnredactedContentInLowLuminanceEnvironment:1];
  [v10 setColorScheme:2];
  [v10 setContentType:0];
  [v10 setDelegate:self];
  long long v11 = [(CSInlineWidgetContainerViewController *)self _widgetTintParameters];
  if (v11) {
    [v10 setTintParameters:v11];
  }
  long long v12 = [(CSInlineWidgetContainerViewController *)self _currentState];
  [v10 setPresentationMode:-[CSComplicationPresentationState suggestedComplicationPresentationMode]((uint64_t)v12)];

  int v13 = [[CSComplicationWrapperViewController alloc] initWithWidgetHostViewController:v10];

  return v13;
}

- (id)_currentState
{
  lastKnownComplicationPresentationState = self->_lastKnownComplicationPresentationState;
  if (!lastKnownComplicationPresentationState)
  {
    BOOL v4 = [(CSInlineWidgetContainerViewController *)self traitCollection];
    id v5 = [(CSInlineWidgetContainerViewController *)self _buildComplicationPresentationStateForTraitCollection:v4];
    id v6 = self->_lastKnownComplicationPresentationState;
    self->_lastKnownComplicationPresentationState = v5;

    lastKnownComplicationPresentationState = self->_lastKnownComplicationPresentationState;
  }
  id v7 = lastKnownComplicationPresentationState;

  return v7;
}

- (id)_buildComplicationPresentationStateForTraitCollection:(id)a3
{
  id v4 = a3;
  id v5 = [CSComplicationPresentationState alloc];
  char isVisible = self->_isVisible;
  char screenOff = self->_screenOff;
  uint64_t v8 = [v4 _backlightLuminance];

  double v9 = -[CSComplicationPresentationState initWithVisibility:isScreenOff:backlightLuminance:interfaceOrientation:](v5, isVisible, screenOff, v8, [(CSInlineWidgetContainerViewController *)self interfaceOrientation]);

  return v9;
}

- (void)_updatePresentationStyleForReason:(id)a3
{
  id v4 = a3;
  id v5 = [(CSInlineWidgetContainerViewController *)self traitCollection];
  [(CSInlineWidgetContainerViewController *)self _updatePresentationStyleForTransitionToNewTraitCollection:v5 reason:v4];
}

- (void)_updatePresentationStyleForTransitionToNewTraitCollection:(id)a3 reason:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__CSInlineWidgetContainerViewController__updatePresentationStyleForTransitionToNewTraitCollection_reason___block_invoke;
  block[3] = &unk_1E6AD87F8;
  block[4] = self;
  if (_updatePresentationStyleForTransitionToNewTraitCollection_reason__onceToken != -1) {
    dispatch_once(&_updatePresentationStyleForTransitionToNewTraitCollection_reason__onceToken, block);
  }
  lastKnownComplicationPresentationState = self->_lastKnownComplicationPresentationState;
  double v9 = [(CSInlineWidgetContainerViewController *)self _buildComplicationPresentationStateForTraitCollection:v6];
  long long v10 = [(CSInlineWidgetContainerViewController *)self _currentState];
  if (BSEqualObjects() && lastKnownComplicationPresentationState)
  {
    long long v11 = SBLogCoverSheetWidgets();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134219010;
      v24 = self;
      __int16 v25 = 2114;
      uint64_t v26 = _updatePresentationStyleForTransitionToNewTraitCollection_reason__className;
      __int16 v27 = 2114;
      v28 = v10;
      __int16 v29 = 2114;
      v30 = v9;
      __int16 v31 = 2114;
      id v32 = v7;
      long long v12 = "[%p/%{public}@] Bailing (equal state) on Presentation mode transition from %{public}@ -> %{public}@ for reason: %{public}@";
LABEL_17:
      _os_log_impl(&dword_1D839D000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0x34u);
    }
  }
  else
  {
    if (!lastKnownComplicationPresentationState)
    {
      int v13 = SBLogCoverSheetWidgets();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134219010;
        v24 = self;
        __int16 v25 = 2114;
        uint64_t v26 = _updatePresentationStyleForTransitionToNewTraitCollection_reason__className;
        __int16 v27 = 2114;
        v28 = v10;
        __int16 v29 = 2114;
        v30 = v9;
        __int16 v31 = 2114;
        id v32 = v7;
        _os_log_impl(&dword_1D839D000, v13, OS_LOG_TYPE_DEFAULT, "[%p/%{public}@] Proceeding w/ Presentation mode transition because we haven't done one yet, from %{public}@ -> %{public}@ for reason: %{public}@", buf, 0x34u);
      }
    }
    objc_storeStrong((id *)&self->_lastKnownComplicationPresentationState, v9);
    id v14 = SBLogCoverSheetWidgets();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134219010;
      v24 = self;
      __int16 v25 = 2114;
      uint64_t v26 = _updatePresentationStyleForTransitionToNewTraitCollection_reason__className;
      __int16 v27 = 2114;
      v28 = v10;
      __int16 v29 = 2114;
      v30 = v9;
      __int16 v31 = 2114;
      id v32 = v7;
      _os_log_impl(&dword_1D839D000, v14, OS_LOG_TYPE_DEFAULT, "[%p/%{public}@] Begin Presentation mode transition from %{public}@ -> %{public}@ for reason: %{public}@", buf, 0x34u);
    }

    unint64_t v15 = -[CSComplicationPresentationState suggestedComplicationPresentationMode]((uint64_t)v9);
    BOOL v16 = (v15 & 0xFFFFFFFFFFFFFFFELL) == 2;
    [(CSInlineWidgetContainerViewController *)self bs_beginAppearanceTransitionForChildViewController:self->_widgetViewController toVisible:v16 animated:0];
    v17 = [(CSComplicationWrapperViewController *)self->_widgetViewController widgetHostViewController];
    [v17 setPresentationMode:v15];

    [(CSInlineWidgetContainerViewController *)self bs_endAppearanceTransitionForChildViewController:self->_widgetViewController toVisible:v16];
    v18 = SBLogCoverSheetWidgets();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = _updatePresentationStyleForTransitionToNewTraitCollection_reason__className;
      v20 = NSStringFromWidgetPresentationMode(v15);
      v21 = [(CSComplicationWrapperViewController *)self->_widgetViewController widgetHostViewController];
      *(_DWORD *)buf = 134218754;
      v24 = self;
      __int16 v25 = 2114;
      uint64_t v26 = v19;
      __int16 v27 = 2114;
      v28 = v20;
      __int16 v29 = 2114;
      v30 = v21;
      _os_log_impl(&dword_1D839D000, v18, OS_LOG_TYPE_DEFAULT, "[%p/%{public}@] Updating Presentation mode to '%{public}@' for %{public}@", buf, 0x2Au);
    }
    long long v11 = SBLogCoverSheetWidgets();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134219010;
      v24 = self;
      __int16 v25 = 2114;
      uint64_t v26 = _updatePresentationStyleForTransitionToNewTraitCollection_reason__className;
      __int16 v27 = 2114;
      v28 = v10;
      __int16 v29 = 2114;
      v30 = v9;
      __int16 v31 = 2114;
      id v32 = v7;
      long long v12 = "[%p/%{public}@] End Presentation mode transition from %{public}@ -> %{public}@ completed for reason: %{public}@";
      goto LABEL_17;
    }
  }
}

uint64_t __106__CSInlineWidgetContainerViewController__updatePresentationStyleForTransitionToNewTraitCollection_reason___block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  uint64_t v2 = _updatePresentationStyleForTransitionToNewTraitCollection_reason__className;
  _updatePresentationStyleForTransitionToNewTraitCollection_reason__className = v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

- (void)widgetHostViewController:(id)a3 requestsLaunchWithAction:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v8 = WeakRetained;
  if (!WeakRetained || ([WeakRetained preventsLaunchFromWidgetWithAction:v6] & 1) == 0)
  {
    complicationManager = self->_complicationManager;
    long long v10 = [v11 widget];
    [(CSComplicationManager *)complicationManager handleLaunchRequestForWidget:v10 withAction:v6];
  }
}

- (CSComplicationDescriptor)widgetDescriptor
{
  return self->_widgetDescriptor;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (CSInlineWidgetContainerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSInlineWidgetContainerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isScreenOff
{
  return self->_screenOff;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (UIView)complicationSuperview
{
  return self->_complicationSuperview;
}

- (CSComplicationManager)complicationManager
{
  return self->_complicationManager;
}

- (void)setComplicationManager:(id)a3
{
}

- (CSComplicationWrapperViewController)widgetViewController
{
  return self->_widgetViewController;
}

- (void)setWidgetViewController:(id)a3
{
}

- (NSMutableDictionary)cancelTouchesAssertionsByUniqueIdentifier
{
  return self->_cancelTouchesAssertionsByUniqueIdentifier;
}

- (void)setCancelTouchesAssertionsByUniqueIdentifier:(id)a3
{
}

- (unint64_t)inlineTextAlignment
{
  return self->_inlineTextAlignment;
}

- (void)setInlineTextAlignment:(unint64_t)a3
{
  self->_inlineTextAlignment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelTouchesAssertionsByUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_widgetViewController, 0);
  objc_storeStrong((id *)&self->_complicationManager, 0);
  objc_storeStrong((id *)&self->_complicationSuperview, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_widgetDescriptor, 0);

  objc_storeStrong((id *)&self->_lastKnownComplicationPresentationState, 0);
}

@end