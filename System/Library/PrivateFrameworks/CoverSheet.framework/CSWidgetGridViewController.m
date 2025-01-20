@interface CSWidgetGridViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)containsIconsInRow:(unint64_t)a3;
- (BOOL)interpretsViewAsContent:(id)a3;
- (BOOL)isScreenOff;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BSUIVibrancyConfiguration)vibrancyConfiguration;
- (BSUIVibrancyEffectView)vibrancyEffectView;
- (CSComplicationManager)complicationManager;
- (CSWidgetGridViewController)initWithComplicationManager:(id)a3 type:(unint64_t)a4 applicationInformer:(id)a5;
- (CSWidgetGridViewControllerDelegate)delegate;
- (NSMutableDictionary)cancelTouchesAssertionsByUniqueIdentifier;
- (PRPosterContentStyle)contentStyle;
- (PRWidgetGridViewController)widgetGridViewController;
- (UIView)widgetGridContentView;
- (id)_buildComplicationPresentationStateForTraitCollection:(id)a3 interfaceOrientation:(int64_t)a4;
- (id)_currentState;
- (id)_widgetTintParameters;
- (id)sceneHostEnvironmentEntriesForBacklightSession;
- (void)_backlightLuminanceDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_updateColors;
- (void)_updateComplicationPresentationState:(id)a3 reason:(id)a4;
- (void)_updateGridViewControllerOccluded:(BOOL)a3;
- (void)_updatePresentationStyleForNewOrientation:(int64_t)a3;
- (void)_updatePresentationStyleForReason:(id)a3;
- (void)beginCancellingTouches;
- (void)endCancellingTouches;
- (void)setCancelTouchesAssertionsByUniqueIdentifier:(id)a3;
- (void)setComplicationDescriptors:(id)a3 iconLayout:(id)a4;
- (void)setComplicationManager:(id)a3;
- (void)setContentStyle:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setScreenOff:(BOOL)a3;
- (void)setVibrancyConfiguration:(id)a3;
- (void)setVibrancyEffectView:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)setWidgetGridViewController:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)widgetGridViewController:(id)a3 didRequestLaunchForComplicationDescriptor:(id)a4 withAction:(id)a5;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CSWidgetGridViewController

- (CSWidgetGridViewController)initWithComplicationManager:(id)a3 type:(unint64_t)a4 applicationInformer:(id)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CSWidgetGridViewController;
  v11 = [(CSWidgetGridViewController *)&v21 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_complicationManager, a3);
    v12->_needsNestedVibrancyEffectView = a4 == 1;
    v13 = [CSWidgetGridModel alloc];
    v14 = [(CSWidgetGridModel *)v13 initWithComplicationDescriptors:MEMORY[0x1E4F1CBF0] iconLayout:0 type:a4];
    [(CSWidgetGridModel *)v14 setApplicationInformer:v10];
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F92728]) initWithModel:v14];
    widgetGridViewController = v12->_widgetGridViewController;
    v12->_widgetGridViewController = (PRWidgetGridViewController *)v15;

    [(PRWidgetGridViewController *)v12->_widgetGridViewController setDelegate:v12];
    [(CSWidgetGridViewController *)v12 _updateGridViewControllerOccluded:1];
    v17 = self;
    v22[0] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    id v19 = (id)[(CSWidgetGridViewController *)v12 registerForTraitChanges:v18 withAction:sel__backlightLuminanceDidChange_previousTraitCollection_];
  }
  return v12;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)CSWidgetGridViewController;
  [(CSCoverSheetViewControllerBase *)&v6 viewDidLoad];
  if (self->_needsNestedVibrancyEffectView)
  {
    v3 = (BSUIVibrancyEffectView *)objc_alloc_init(MEMORY[0x1E4F4F8F0]);
    vibrancyEffectView = self->_vibrancyEffectView;
    self->_vibrancyEffectView = v3;

    v5 = [(CSWidgetGridViewController *)self view];
    [v5 addSubview:self->_vibrancyEffectView];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSWidgetGridViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewWillAppear:a3];
  [(CSWidgetGridViewController *)self setVisible:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSWidgetGridViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewDidDisappear:a3];
  [(CSWidgetGridViewController *)self setVisible:0];
}

- (UIView)widgetGridContentView
{
  v2 = [(CSWidgetGridViewController *)self widgetGridViewController];
  v3 = [v2 view];

  return (UIView *)v3;
}

- (void)setComplicationDescriptors:(id)a3 iconLayout:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(CSWidgetGridViewController *)self widgetGridViewController];
  v8 = [v9 model];
  [v8 setComplicationDescriptors:v7 iconLayout:v6];
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
    [(CSWidgetGridViewController *)self _updatePresentationStyleForReason:v5];
  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSWidgetGridViewController;
  id v7 = a4;
  [(CSWidgetGridViewController *)&v11 willTransitionToTraitCollection:v6 withTransitionCoordinator:v7];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __88__CSWidgetGridViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E6AD99F0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 animateAlongsideTransition:v9 completion:&__block_literal_global_22];
}

void __88__CSWidgetGridViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "_buildComplicationPresentationStateForTraitCollection:interfaceOrientation:", *(void *)(a1 + 40), objc_msgSend(v1, "interfaceOrientation"));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 _updateComplicationPresentationState:v2 reason:@"willTransitionToTraitCollection:withTransitionCoordinator:"];
}

- (void)_backlightLuminanceDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v8 = [a3 traitCollection];
  id v6 = [(CSWidgetGridViewController *)self _buildComplicationPresentationStateForTraitCollection:v8 interfaceOrientation:[(CSWidgetGridViewController *)self interfaceOrientation]];
  id v7 = NSStringFromSelector(a2);
  [(CSWidgetGridViewController *)self _updateComplicationPresentationState:v6 reason:v7];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v19.receiver = self;
  v19.super_class = (Class)CSWidgetGridViewController;
  id v7 = a4;
  -[CSCoverSheetViewControllerBase viewWillTransitionToSize:withTransitionCoordinator:](&v19, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  id v8 = SBFWindowForViewControllerTransition();
  uint64_t v9 = [v8 _toWindowOrientation];

  id v10 = [(CSWidgetGridViewController *)self traitCollection];
  objc_super v11 = [(CSWidgetGridViewController *)self _buildComplicationPresentationStateForTraitCollection:v10 interfaceOrientation:v9];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__CSWidgetGridViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v16[3] = &unk_1E6AD99F0;
  id v17 = v11;
  v18 = self;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__CSWidgetGridViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v13[3] = &unk_1E6AD99F0;
  id v14 = v17;
  uint64_t v15 = self;
  id v12 = v17;
  [v7 animateAlongsideTransition:v16 completion:v13];
}

uint64_t __81__CSWidgetGridViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t result = -[CSComplicationPresentationState shouldPresentLandscapeComplications](*(void *)(a1 + 32));
  if (result)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    return [v3 _updateComplicationPresentationState:v4 reason:@"viewWillTransitionToSize:withTransitionCoordinator: - transition"];
  }
  return result;
}

uint64_t __81__CSWidgetGridViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t result = -[CSComplicationPresentationState shouldPresentLandscapeComplications](*(void *)(a1 + 32));
  if ((result & 1) == 0)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    return [v3 _updateComplicationPresentationState:v4 reason:@"viewWillTransitionToSize:withTransitionCoordinator: - completion"];
  }
  return result;
}

- (void)setVisible:(BOOL)a3
{
  if (self->_isVisible != a3)
  {
    self->_isVisible = a3;
    uint64_t v4 = NSString;
    NSStringFromBOOL();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = [v4 stringWithFormat:@"setVisible:%@", v6];
    [(CSWidgetGridViewController *)self _updatePresentationStyleForReason:v5];
  }
}

- (void)viewDidLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)CSWidgetGridViewController;
  [(CSCoverSheetViewControllerBase *)&v7 viewDidLayoutSubviews];
  vibrancyEffectView = self->_vibrancyEffectView;
  uint64_t v4 = [(CSWidgetGridViewController *)self view];
  [v4 bounds];
  -[BSUIVibrancyEffectView setFrame:](vibrancyEffectView, "setFrame:");

  v5 = [(PRWidgetGridViewController *)self->_widgetGridViewController view];
  id v6 = [(CSWidgetGridViewController *)self view];
  [v6 bounds];
  objc_msgSend(v5, "setFrame:");
}

- (BOOL)interpretsViewAsContent:(id)a3
{
  return [(PRWidgetGridViewController *)self->_widgetGridViewController interpretsViewAsContent:a3];
}

- (void)beginCancellingTouches
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v3 = [(PRWidgetGridViewController *)self->_widgetGridViewController model];
  uint64_t v4 = [v3 complicationDescriptors];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v10 = [(PRWidgetGridViewController *)self->_widgetGridViewController widgetHostViewControllerForComplicationDescriptor:v9];
        objc_super v11 = [v10 cancelTouchesForCurrentEventInHostedContent];
        if (v11)
        {
          if (!self->_cancelTouchesAssertionsByUniqueIdentifier)
          {
            id v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
            cancelTouchesAssertionsByUniqueIdentifier = self->_cancelTouchesAssertionsByUniqueIdentifier;
            self->_cancelTouchesAssertionsByUniqueIdentifier = v12;
          }
          id v14 = [v9 uniqueIdentifier];
          uint64_t v15 = [(NSMutableDictionary *)self->_cancelTouchesAssertionsByUniqueIdentifier objectForKey:v14];
          v16 = v15;
          if (v15) {
            [v15 invalidate];
          }
          [(NSMutableDictionary *)self->_cancelTouchesAssertionsByUniqueIdentifier setObject:v11 forKey:v14];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
}

- (void)endCancellingTouches
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_cancelTouchesAssertionsByUniqueIdentifier;
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

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setVibrancyConfiguration:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_vibrancyConfiguration, a3);
    [(CSWidgetGridViewController *)self _updateColors];
  }
}

- (void)setContentStyle:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contentStyle, a3);
    [(CSWidgetGridViewController *)self _updateColors];
  }
}

- (void)_updateColors
{
  if (!self->_contentStyleRenderer)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F5E4D8]);
    vibrancyEffectView = self->_vibrancyEffectView;
    [(BSUIVibrancyEffectView *)vibrancyEffectView frame];
    id v5 = (CSVibrantContentStyleRenderer *)objc_msgSend(v3, "initWithVibrancyView:styleBoundingRect:", vibrancyEffectView);
    contentStyleRenderer = self->_contentStyleRenderer;
    self->_contentStyleRenderer = v5;
  }
  uint64_t v7 = [(PRPosterContentStyle *)self->_contentStyle type];
  id v8 = self->_contentStyleRenderer;
  if (v7 == 1)
  {
    [(CSVibrantContentStyleRenderer *)v8 clearAllStyling];
    id v11 = objc_alloc_init(MEMORY[0x1E4F92648]);
    [(CSVibrantContentStyleRenderer *)self->_contentStyleRenderer applyStyle:v11];
  }
  else
  {
    [(CSVibrantContentStyleRenderer *)v8 setVibrancyConfiguration:self->_vibrancyConfiguration];
    long long v9 = self->_contentStyleRenderer;
    contentStyle = self->_contentStyle;
    [(CSVibrantContentStyleRenderer *)v9 applyStyle:contentStyle];
  }
}

- (BOOL)containsIconsInRow:(unint64_t)a3
{
  return [(PRWidgetGridViewController *)self->_widgetGridViewController containsIconsInRow:a3];
}

- (id)_widgetTintParameters
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F58EE8]) initWithPrimaryTintColor:0 secondaryTintColor:0 filterStyle:2 fallbackFilterStyle:2 fraction:1.0];

  return v2;
}

- (id)_currentState
{
  lastKnownComplicationPresentationState = self->_lastKnownComplicationPresentationState;
  if (!lastKnownComplicationPresentationState)
  {
    uint64_t v4 = [(CSWidgetGridViewController *)self traitCollection];
    id v5 = [(CSWidgetGridViewController *)self _buildComplicationPresentationStateForTraitCollection:v4 interfaceOrientation:[(CSWidgetGridViewController *)self interfaceOrientation]];
    uint64_t v6 = self->_lastKnownComplicationPresentationState;
    self->_lastKnownComplicationPresentationState = v5;

    lastKnownComplicationPresentationState = self->_lastKnownComplicationPresentationState;
  }
  uint64_t v7 = lastKnownComplicationPresentationState;

  return v7;
}

- (id)_buildComplicationPresentationStateForTraitCollection:(id)a3 interfaceOrientation:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [CSComplicationPresentationState alloc];
  char isVisible = self->_isVisible;
  LOBYTE(self) = self->_screenOff;
  uint64_t v9 = [v6 _backlightLuminance];

  long long v10 = -[CSComplicationPresentationState initWithVisibility:isScreenOff:backlightLuminance:interfaceOrientation:](v7, isVisible, (char)self, v9, a4);

  return v10;
}

- (void)_updatePresentationStyleForReason:(id)a3
{
  id v4 = a3;
  id v6 = [(CSWidgetGridViewController *)self traitCollection];
  id v5 = [(CSWidgetGridViewController *)self _buildComplicationPresentationStateForTraitCollection:v6 interfaceOrientation:[(CSWidgetGridViewController *)self interfaceOrientation]];
  [(CSWidgetGridViewController *)self _updateComplicationPresentationState:v5 reason:v4];
}

- (void)_updatePresentationStyleForNewOrientation:(int64_t)a3
{
  id v4 = [(CSWidgetGridViewController *)self traitCollection];
  id v5 = [(CSWidgetGridViewController *)self _buildComplicationPresentationStateForTraitCollection:v4 interfaceOrientation:[(CSWidgetGridViewController *)self interfaceOrientation]];

  [(CSWidgetGridViewController *)self _updateComplicationPresentationState:v5 reason:@"Orientation Change"];
}

- (void)_updateComplicationPresentationState:(id)a3 reason:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (__CFString *)a3;
  id v8 = (__CFString *)a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__CSWidgetGridViewController__updateComplicationPresentationState_reason___block_invoke;
  block[3] = &unk_1E6AD87F8;
  block[4] = self;
  if (_updateComplicationPresentationState_reason__onceToken != -1) {
    dispatch_once(&_updateComplicationPresentationState_reason__onceToken, block);
  }
  lastKnownComplicationPresentationState = self->_lastKnownComplicationPresentationState;
  long long v10 = [(CSWidgetGridViewController *)self _currentState];
  if (BSEqualObjects() && lastKnownComplicationPresentationState)
  {
    id v11 = SBLogCoverSheetWidgets();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134219010;
      v27 = self;
      __int16 v28 = 2114;
      uint64_t v29 = _updateComplicationPresentationState_reason__className;
      __int16 v30 = 2114;
      v31 = v10;
      __int16 v32 = 2114;
      v33 = v7;
      __int16 v34 = 2114;
      v35 = v8;
      long long v12 = "[%p/%{public}@] Bailing (equal state) on Presentation mode transition from %{public}@ -> %{public}@ for reason: %{public}@";
      v13 = v11;
      uint32_t v14 = 52;
LABEL_31:
      _os_log_impl(&dword_1D839D000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    }
  }
  else
  {
    if (!lastKnownComplicationPresentationState)
    {
      uint64_t v15 = SBLogCoverSheetWidgets();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134219010;
        v27 = self;
        __int16 v28 = 2114;
        uint64_t v29 = _updateComplicationPresentationState_reason__className;
        __int16 v30 = 2114;
        v31 = v10;
        __int16 v32 = 2114;
        v33 = v7;
        __int16 v34 = 2114;
        v35 = v8;
        _os_log_impl(&dword_1D839D000, v15, OS_LOG_TYPE_DEFAULT, "[%p/%{public}@] Proceeding w/ Presentation mode transition because we haven't done one yet, from %{public}@ -> %{public}@ for reason: %{public}@", buf, 0x34u);
      }
    }
    objc_storeStrong((id *)&self->_lastKnownComplicationPresentationState, a3);
    unint64_t v16 = -[CSComplicationPresentationState suggestedComplicationPresentationMode]((uint64_t)v7) & 0xFFFFFFFFFFFFFFFELL;
    long long v17 = [(CSWidgetGridViewController *)self widgetGridViewController];
    long long v18 = [v17 model];
    uint64_t v19 = [v18 type];

    BOOL v20 = v16 == 2 && v19 != 1;
    if (v19 == 1 && v16 == 2) {
      BOOL v20 = -[CSComplicationPresentationState shouldPresentLandscapeComplications]((BOOL)v7);
    }
    objc_super v21 = SBLogCoverSheetWidgets();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      if (v20) {
        uint64_t v22 = @"VISIBLE";
      }
      else {
        uint64_t v22 = @"OCCLUDED";
      }
      *(_DWORD *)buf = 134219266;
      v27 = self;
      __int16 v28 = 2114;
      uint64_t v29 = _updateComplicationPresentationState_reason__className;
      __int16 v30 = 2114;
      v31 = v22;
      __int16 v32 = 2114;
      v33 = v10;
      __int16 v34 = 2114;
      v35 = v7;
      __int16 v36 = 2114;
      v37 = v8;
      _os_log_impl(&dword_1D839D000, v21, OS_LOG_TYPE_DEFAULT, "[%p/%{public}@] Begin Presentation mode transition to %{public}@ for %{public}@ -> %{public}@ for reason: %{public}@", buf, 0x3Eu);
    }

    if (v20)
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __74__CSWidgetGridViewController__updateComplicationPresentationState_reason___block_invoke_49;
      v24[3] = &unk_1E6AD87F8;
      v24[4] = self;
      [MEMORY[0x1E4F42FF0] performWithoutAnimation:v24];
    }
    [(PRWidgetGridViewController *)self->_widgetGridViewController bs_beginAppearanceTransition:v20 animated:0];
    [(CSWidgetGridViewController *)self _updateGridViewControllerOccluded:v20 ^ 1];
    [(PRWidgetGridViewController *)self->_widgetGridViewController bs_endAppearanceTransition:v20];
    if (!v20) {
      [(CSWidgetGridViewController *)self bs_removeChildViewController:self->_widgetGridViewController];
    }
    id v11 = SBLogCoverSheetWidgets();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      if (v20) {
        v23 = @"VISIBLE";
      }
      else {
        v23 = @"OCCLUDED";
      }
      *(_DWORD *)buf = 134219266;
      v27 = self;
      __int16 v28 = 2114;
      uint64_t v29 = _updateComplicationPresentationState_reason__className;
      __int16 v30 = 2114;
      v31 = v23;
      __int16 v32 = 2114;
      v33 = v10;
      __int16 v34 = 2114;
      v35 = v7;
      __int16 v36 = 2114;
      v37 = v8;
      long long v12 = "[%p/%{public}@] End Presentation mode transition to %{public}@ from %{public}@ -> %{public}@ completed for r"
            "eason: %{public}@";
      v13 = v11;
      uint32_t v14 = 62;
      goto LABEL_31;
    }
  }
}

uint64_t __74__CSWidgetGridViewController__updateComplicationPresentationState_reason___block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  uint64_t v2 = _updateComplicationPresentationState_reason__className;
  _updateComplicationPresentationState_reason__className = v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

void __74__CSWidgetGridViewController__updateComplicationPresentationState_reason___block_invoke_49(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 1049)) {
    [*(id *)(v2 + 1104) contentView];
  }
  else {
  id v3 = [(id)v2 view];
  }
  objc_msgSend(*(id *)(a1 + 32), "bs_addChildViewController:withSuperview:", *(void *)(*(void *)(a1 + 32) + 1120), v3);
}

- (void)_updateGridViewControllerOccluded:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PRWidgetGridViewController *)self->_widgetGridViewController view];
  id v5 = [v4 subviews];
  id v6 = [v5 firstObject];

  if (objc_opt_respondsToSelector()) {
    [v6 setOccluded:v3];
  }
}

- (id)sceneHostEnvironmentEntriesForBacklightSession
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v18 = [MEMORY[0x1E4F1CA80] set];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  BOOL v3 = [(PRWidgetGridViewController *)self->_widgetGridViewController model];
  id v4 = [v3 complicationDescriptors];

  id obj = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = [(PRWidgetGridViewController *)self->_widgetGridViewController widgetHostViewControllerForComplicationDescriptor:*(void *)(*((void *)&v19 + 1) + 8 * i)];
        long long v10 = [v9 backlightHostEnvironment];
        if (v10)
        {
          id v11 = [v9 widget];
          long long v12 = [v11 extensionIdentity];
          v13 = [v12 containerBundleIdentifier];

          uint32_t v14 = [MEMORY[0x1E4FA5EB0] entryWithSceneHostEnvironment:v10 bundleIdentifier:v13];
          [v18 addObject:v14];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  uint64_t v15 = (void *)[v18 copy];

  return v15;
}

- (void)widgetGridViewController:(id)a3 didRequestLaunchForComplicationDescriptor:(id)a4 withAction:(id)a5
{
  id v13 = a4;
  id v7 = a5;
  id v8 = [(CSWidgetGridViewController *)self delegate];

  if (!v8
    || (id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        char v10 = [WeakRetained widgetGridViewControllerShouldPreventLaunchFromWidget:self],
        WeakRetained,
        (v10 & 1) == 0))
  {
    complicationManager = self->_complicationManager;
    long long v12 = [v13 widget];
    [(CSComplicationManager *)complicationManager handleLaunchRequestForWidget:v12 withAction:v7];
  }
}

- (CSWidgetGridViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSWidgetGridViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isScreenOff
{
  return self->_screenOff;
}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  return self->_vibrancyConfiguration;
}

- (PRPosterContentStyle)contentStyle
{
  return self->_contentStyle;
}

- (BSUIVibrancyEffectView)vibrancyEffectView
{
  return self->_vibrancyEffectView;
}

- (void)setVibrancyEffectView:(id)a3
{
}

- (CSComplicationManager)complicationManager
{
  return self->_complicationManager;
}

- (void)setComplicationManager:(id)a3
{
}

- (PRWidgetGridViewController)widgetGridViewController
{
  return self->_widgetGridViewController;
}

- (void)setWidgetGridViewController:(id)a3
{
}

- (NSMutableDictionary)cancelTouchesAssertionsByUniqueIdentifier
{
  return self->_cancelTouchesAssertionsByUniqueIdentifier;
}

- (void)setCancelTouchesAssertionsByUniqueIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelTouchesAssertionsByUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_widgetGridViewController, 0);
  objc_storeStrong((id *)&self->_complicationManager, 0);
  objc_storeStrong((id *)&self->_vibrancyEffectView, 0);
  objc_storeStrong((id *)&self->_contentStyle, 0);
  objc_storeStrong((id *)&self->_vibrancyConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentStyleRenderer, 0);

  objc_storeStrong((id *)&self->_lastKnownComplicationPresentationState, 0);
}

@end