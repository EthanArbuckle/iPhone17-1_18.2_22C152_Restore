@interface CSRemoteContentModalViewController
- (BOOL)_dismissesOnTap;
- (BOOL)_reducesWhitePoint;
- (BOOL)_shouldCancelInteractiveDismissGesture;
- (BOOL)_supportsLuminanceReductionForCurrentBackgroundStyle;
- (BOOL)_suppressesBottomEdgeContent;
- (BOOL)dismissForDismissType:(int64_t)a3 completion:(id)a4;
- (BOOL)handleEvent:(id)a3;
- (BOOL)isInUnlockGestureMode;
- (BOOL)shouldCaptureHomeGesture;
- (BOOL)shouldHideHomeAffordance;
- (BOOL)suppressesDismissalForNotification;
- (BOOL)suppressesDismissalGesture;
- (CSContentComponent)content;
- (CSDashBoardRemoteContentSettings)remoteContentSettings;
- (CSDateViewComponent)dateTimeComponent;
- (CSLockScreenSettings)lockScreenSettings;
- (CSProudLockComponent)proudLockComponent;
- (CSQuickActionsComponent)quickActionsComponent;
- (CSRemoteContentHostViewController)hostViewController;
- (CSRemoteContentModalViewController)initWithContentDefinition:(id)a3 preferences:(id)a4 hostViewController:(id)a5 authenticationStatusProvider:(id)a6;
- (CSRemoteContentViewControllerDelegate)delegate;
- (SBFAuthenticationStatusProvider)authenticationStatusProvider;
- (UIImpactFeedbackGenerator)rubberBandFeedbackGenerator;
- (id)_newDisplayLayoutElement;
- (int64_t)_backgroundStyle;
- (int64_t)_dateTimeStyle;
- (int64_t)_homeGestureMode;
- (int64_t)contentPresentationType;
- (int64_t)preferredNotificationListMode;
- (void)_addChildHostViewController:(id)a3;
- (void)_createProperties;
- (void)_dismissForced:(BOOL)a3 animated:(BOOL)a4;
- (void)_removeChildHostViewController;
- (void)_setCornerRounded:(BOOL)a3;
- (void)_setUserHasInteractedSinceWake:(BOOL)a3;
- (void)_updateContentAlpha:(double)a3 interactive:(BOOL)a4;
- (void)_updateContentScale:(double)a3 interactive:(BOOL)a4;
- (void)_updateDisplayLayoutElementForActivation:(id)a3;
- (void)_updateForPropertyChanged;
- (void)_updateGrabberViewVisibility;
- (void)_updateSecondaryActionButtonText;
- (void)addGrabberView:(id)a3;
- (void)aggregateAppearance:(id)a3;
- (void)aggregateBehavior:(id)a3;
- (void)dealloc;
- (void)didReceiveTouch;
- (void)dismissForHomeButton;
- (void)handleBottomEdgeGestureBegan:(id)a3;
- (void)handleBottomEdgeGestureChanged:(id)a3;
- (void)handleBottomEdgeGestureEnded:(id)a3;
- (void)handleSecondaryActionForView:(id)a3;
- (void)loadView;
- (void)remoteDidChangeStyle;
- (void)setContent:(id)a3;
- (void)setDateTimeComponent:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHostViewController:(id)a3;
- (void)setLockScreenSettings:(id)a3;
- (void)setProudLockComponent:(id)a3;
- (void)setQuickActionsComponent:(id)a3;
- (void)setRemoteContentSettings:(id)a3;
- (void)setRubberBandFeedbackGenerator:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)viewDidLoad;
@end

@implementation CSRemoteContentModalViewController

- (CSRemoteContentModalViewController)initWithContentDefinition:(id)a3 preferences:(id)a4 hostViewController:(id)a5 authenticationStatusProvider:(id)a6
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v49.receiver = self;
  v49.super_class = (Class)CSRemoteContentModalViewController;
  v15 = [(CSRemoteContentModalViewController *)&v49 init];
  v16 = v15;
  if (!v15) {
    goto LABEL_7;
  }
  if (v11 && v12 && v13 && v14)
  {
    objc_storeStrong((id *)&v15->_definition, a3);
    objc_storeStrong((id *)&v16->_remoteContentPreferences, a4);
    objc_storeStrong((id *)&v16->_authenticationStatusProvider, a6);
    objc_storeWeak((id *)&v16->_hostViewController, v13);
    uint64_t v17 = +[CSLockScreenDomain rootSettings];
    lockScreenSettings = v16->_lockScreenSettings;
    v16->_lockScreenSettings = (CSLockScreenSettings *)v17;

    [(PTSettings *)v16->_lockScreenSettings addKeyObserver:v16];
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA8]), "initWithStyle:", -[CSLockScreenSettings unlockRubberBandFeedbackIntensity](v16->_lockScreenSettings, "unlockRubberBandFeedbackIntensity"));
    rubberBandFeedbackGenerator = v16->_rubberBandFeedbackGenerator;
    v16->_rubberBandFeedbackGenerator = (UIImpactFeedbackGenerator *)v19;

    v21 = objc_opt_new();
    v22 = [v21 priority:40];
    v23 = [(CSCoverSheetViewControllerBase *)v16 appearanceIdentifier];
    uint64_t v24 = [v22 identifier:v23];
    content = v16->_content;
    v16->_content = (CSContentComponent *)v24;

    v26 = objc_opt_new();
    v27 = [v26 priority:40];
    v28 = [(CSCoverSheetViewControllerBase *)v16 appearanceIdentifier];
    uint64_t v29 = [v27 identifier:v28];
    dateTimeComponent = v16->_dateTimeComponent;
    v16->_dateTimeComponent = (CSDateViewComponent *)v29;

    v31 = objc_opt_new();
    v32 = [v31 priority:40];
    v33 = [(CSCoverSheetViewControllerBase *)v16 appearanceIdentifier];
    uint64_t v34 = [v32 identifier:v33];
    proudLockComponent = v16->_proudLockComponent;
    v16->_proudLockComponent = (CSProudLockComponent *)v34;

    v36 = objc_opt_new();
    v37 = [v36 priority:40];
    v38 = [(CSCoverSheetViewControllerBase *)v16 appearanceIdentifier];
    uint64_t v39 = [v37 identifier:v38];
    quickActionsComponent = v16->_quickActionsComponent;
    v16->_quickActionsComponent = (CSQuickActionsComponent *)v39;

    v50[0] = v16->_content;
    v50[1] = v16->_dateTimeComponent;
    v50[2] = v16->_proudLockComponent;
    v50[3] = v16->_quickActionsComponent;
    uint64_t v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:4];
    components = v16->_components;
    v16->_components = (NSArray *)v41;

    v43 = +[CSLockScreenDomain rootSettings];
    uint64_t v44 = [v43 dashBoardRemoteContentSettings];
    remoteContentSettings = v16->_remoteContentSettings;
    v16->_remoteContentSettings = (CSDashBoardRemoteContentSettings *)v44;

    [(PTSettings *)v16->_remoteContentSettings addKeyObserver:v16];
LABEL_7:
    v46 = v16;
    goto LABEL_11;
  }
  v47 = SBLogDashBoard();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544386;
    v52 = v16;
    __int16 v53 = 1024;
    BOOL v54 = v11 != 0;
    __int16 v55 = 1024;
    BOOL v56 = v12 != 0;
    __int16 v57 = 1024;
    BOOL v58 = v13 != 0;
    __int16 v59 = 1024;
    BOOL v60 = v14 != 0;
    _os_log_impl(&dword_1D839D000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@: Missing required parameters for init; definition: %d, preferences: %d, hostVC: %d, authenticationStatusProvider: %d",
      buf,
      0x24u);
  }

  v46 = 0;
LABEL_11:

  return v46;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  if ([(CSRemoteContentModalViewController *)self isViewLoaded] && WeakRetained) {
    [(CSRemoteContentModalViewController *)self bs_removeChildViewController:WeakRetained];
  }

  v4.receiver = self;
  v4.super_class = (Class)CSRemoteContentModalViewController;
  [(CSCoverSheetViewControllerBase *)&v4 dealloc];
}

- (void)loadView
{
  [(CSRemoteContentModalViewController *)self _createProperties];
  v3 = [CSRemoteContentModalView alloc];
  objc_super v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 bounds];
  v7 = -[CSRemoteContentModalView initWithFrame:](v3, "initWithFrame:");

  [(CSRemoteContentModalView *)v7 setTouchDelegate:self];
  [(CSModalView *)v7 setShowsStatusText:0];
  [(CSModalView *)v7 setDelegate:self];
  [(CSRemoteContentModalView *)v7 setAutoresizingMask:18];
  [(CSModalView *)v7 setWantsEnhancedSecondaryActionButton:1];
  v5 = [MEMORY[0x1E4F428B8] whiteColor];
  [(CSModalView *)v7 setSecondaryActionButtonTextColor:v5];

  [(CSRemoteContentModalViewController *)self setView:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  if (WeakRetained) {
    [(CSRemoteContentModalViewController *)self _addChildHostViewController:WeakRetained];
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CSRemoteContentModalViewController;
  [(CSModalViewControllerBase *)&v3 viewDidLoad];
  [(CSRemoteContentModalViewController *)self _updateSecondaryActionButtonText];
}

- (int64_t)preferredNotificationListMode
{
  return [(SBSRemoteContentPreferences *)self->_remoteContentPreferences preferredNotificationListMode];
}

- (BOOL)suppressesDismissalForNotification
{
  return [(SBSRemoteContentPreferences *)self->_remoteContentPreferences suppressesNotifications];
}

- (BOOL)suppressesDismissalGesture
{
  return (unint64_t)([(CSRemoteContentModalViewController *)self _homeGestureMode] - 1) < 2;
}

- (BOOL)shouldHideHomeAffordance
{
  return [(CSRemoteContentModalViewController *)self _homeGestureMode] == 1;
}

- (BOOL)shouldCaptureHomeGesture
{
  return [(CSRemoteContentModalViewController *)self _homeGestureMode] != 4;
}

- (BOOL)isInUnlockGestureMode
{
  return [(CSRemoteContentModalViewController *)self _homeGestureMode] == 4;
}

- (void)setHostViewController:(id)a3
{
  id obj = a3;
  uint64_t v4 = [(CSRemoteContentModalViewController *)self _removeChildHostViewController];
  if (obj)
  {
    objc_storeWeak((id *)&self->_hostViewController, obj);
    uint64_t v4 = [(CSRemoteContentModalViewController *)self isViewLoaded];
    if (v4) {
      uint64_t v4 = [(CSRemoteContentModalViewController *)self _addChildHostViewController:obj];
    }
  }

  MEMORY[0x1F4181820](v4);
}

- (BOOL)dismissForDismissType:(int64_t)a3 completion:(id)a4
{
  p_hostViewController = &self->_hostViewController;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_hostViewController);
  [WeakRetained didDismissForDismissType:a3];

  id v9 = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(a3) = [v9 remoteContentViewController:self requestsDismissalForType:a3 completion:v7];

  return a3;
}

- (int64_t)contentPresentationType
{
  return 0;
}

- (void)remoteDidChangeStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  id obj = [WeakRetained contentPreferences];

  if (obj)
  {
    objc_storeStrong((id *)&self->_remoteContentPreferences, obj);
    if ([(CSRemoteContentModalViewController *)self _suppressesBottomEdgeContent]) {
      [(CSRemoteContentModalViewController *)self _setUserHasInteractedSinceWake:1];
    }
  }
  [(CSRemoteContentModalViewController *)self _updateGrabberViewVisibility];
  uint64_t v4 = +[CSAction actionWithType:3];
  [(CSCoverSheetViewControllerBase *)self sendAction:v4];

  [(CSRemoteContentModalViewController *)self _updateSecondaryActionButtonText];
  [(CSCoverSheetViewControllerBase *)self updateAppearanceForController:self];
  [(CSCoverSheetViewControllerBase *)self updateBehaviorForController:self];
}

- (void)aggregateAppearance:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)CSRemoteContentModalViewController;
  [(CSModalViewControllerBase *)&v61 aggregateAppearance:v4];
  if (!self->_remoteContentPreferences) {
    goto LABEL_45;
  }
  v5 = [MEMORY[0x1E4F1CA80] set];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v6 = [v4 components];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v57 objects:v63 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v58 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        unint64_t v12 = [v11 type];
        if (v12 > 0x1B || ((1 << v12) & 0xFFFADED) == 0) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v57 objects:v63 count:16];
    }
    while (v8);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v14 = v5;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v53 objects:v62 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v54;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v54 != v17) {
          objc_enumerationMutation(v14);
        }
        [v4 removeComponent:*(void *)(*((void *)&v53 + 1) + 8 * j)];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v53 objects:v62 count:16];
    }
    while (v16);
  }

  uint64_t v19 = +[CSComponent footerCallToActionLabel];
  v20 = [v19 priority:40];
  v21 = [v20 hidden:1];
  [v4 addComponent:v21];

  LODWORD(v21) = [(CSRemoteContentModalViewController *)self shouldHideHomeAffordance];
  v22 = objc_opt_new();
  v23 = [v22 priority:40];
  uint64_t v24 = v23;
  if (v21) {
    [v23 hidden:1];
  }
  else {
  v25 = [v23 suppressTeachableMomentsAnimation:1];
  }
  [v4 addComponent:v25];

  [v4 addComponent:self->_content];
  [v4 addComponent:self->_proudLockComponent];
  [v4 addComponent:self->_quickActionsComponent];
  v26 = +[CSComponent backgroundContent];
  v27 = [v26 priority:40];
  v28 = [v27 hidden:1];
  [v4 addComponent:v28];

  uint64_t v29 = +[CSComponent pageContent];
  v30 = [v29 priority:40];
  v31 = [v30 hidden:1];
  [v4 addComponent:v31];

  int64_t v32 = [(CSRemoteContentModalViewController *)self _backgroundStyle];
  int64_t v33 = [(CSRemoteContentModalViewController *)self _dateTimeStyle];
  if (self->_remoteContentPreferences)
  {
    int64_t v34 = v33;
    switch(v32)
    {
      case 0:
        int v35 = 0;
        uint64_t v36 = 1;
        break;
      case 1:
        int v35 = 0;
        uint64_t v36 = 5;
        break;
      case 2:
        int v35 = 1;
        uint64_t v36 = 6;
        break;
      case 3:
      case 4:
        int v35 = 1;
        uint64_t v36 = 7;
        break;
      default:
        uint64_t v36 = 0;
        int v35 = 0;
        break;
    }
    v37 = objc_opt_new();
    v38 = [v37 priority:40];
    uint64_t v39 = [NSNumber numberWithInteger:v36];
    v40 = [v38 style:v39];
    [v4 addComponent:v40];

    if (v35)
    {
      id v41 = objc_alloc(MEMORY[0x1E4F43228]);
      v42 = [MEMORY[0x1E4F428B8] whiteColor];
      v43 = (void *)[v41 initWithStyle:1 contentColor:v42];
      [v4 setLegibilitySettings:v43];
    }
    if (v34 == 2)
    {
      dateTimeComponent = self->_dateTimeComponent;
      uint64_t v45 = 1;
    }
    else
    {
      if (v34 == 1)
      {
        [(CSDateViewComponent *)self->_dateTimeComponent setVibrantAndCentered:1];
LABEL_40:
        if ([(CSRemoteContentModalViewController *)self _suppressesBottomEdgeContent])
        {
          v46 = +[CSComponent quickActions];
          v47 = [v46 priority:40];
          v48 = [v47 hidden:1];
          [v4 addComponent:v48];
        }
        goto LABEL_42;
      }
      if (v34) {
        goto LABEL_40;
      }
      [(CSDateViewComponent *)self->_dateTimeComponent setVibrantAndCentered:0];
      dateTimeComponent = self->_dateTimeComponent;
      uint64_t v45 = 0;
    }
    [(CSComponent *)dateTimeComponent setHidden:v45];
    goto LABEL_40;
  }
LABEL_42:
  [v4 addComponent:self->_dateTimeComponent];
  if ([(CSRemoteContentModalViewController *)self _reducesWhitePoint])
  {
    [(CSRemoteContentModalViewController *)self _backgroundStyle];
    objc_super v49 = objc_opt_new();
    v50 = [v49 priority:40];
    v51 = [v50 lighterReduction:BSSettingFlagForBool()];
    v52 = [v51 hidden:0];
    [v4 addComponent:v52];
  }
LABEL_45:
}

- (void)aggregateBehavior:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSRemoteContentModalViewController;
  [(CSModalViewControllerBase *)&v8 aggregateBehavior:v4];
  [v4 addRestrictedCapabilities:0x2000];
  if ([(CSRemoteContentModalViewController *)self shouldCaptureHomeGesture]) {
    [v4 addRestrictedCapabilities:4096];
  }
  else {
    [v4 removeRestrictedCapabilities:4096];
  }
  [v4 removeRestrictedCapabilities:130];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);

  if (WeakRetained)
  {
    if ([(CSDashBoardRemoteContentSettings *)self->_remoteContentSettings autoExtendsIdleTimer]) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 2;
    }
    if (self->_userHasInteractedSinceWake) {
      uint64_t v7 = 4;
    }
    else {
      uint64_t v7 = 1;
    }
  }
  else
  {
    uint64_t v6 = 2;
    uint64_t v7 = 2;
  }
  [v4 setIdleTimerMode:v6];
  [v4 setIdleTimerDuration:v7];
}

- (id)_newDisplayLayoutElement
{
  v2 = [(SBSRemoteContentDefinition *)self->_definition serviceName];
  if (v2)
  {
    objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4FA6A68]) initWithIdentifier:v2];
    [v3 setFillsDisplayBounds:1];
    [v3 setLayoutRole:6];
    [v3 setUIApplicationElement:1];
    [v3 setBundleIdentifier:v2];
  }
  else
  {
    objc_super v3 = 0;
  }

  return v3;
}

- (void)_updateDisplayLayoutElementForActivation:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSRemoteContentModalViewController;
  id v4 = a3;
  [(CSCoverSheetViewControllerBase *)&v5 _updateDisplayLayoutElementForActivation:v4];
  objc_msgSend(v4, "sb_setTransitioning:", (-[CSRemoteContentModalViewController _appearState](self, "_appearState", v5.receiver, v5.super_class) & 0xFFFFFFFD) == 1);
}

- (void)handleSecondaryActionForView:(id)a3
{
  id v4 = +[CSAction actionWithType:3];
  [(CSCoverSheetViewControllerBase *)self sendAction:v4];

  [(CSRemoteContentModalViewController *)self _dismissForced:1 animated:1];
}

- (void)didReceiveTouch
{
  if ([(CSRemoteContentModalViewController *)self _dismissesOnTap])
  {
    id v3 = +[CSAction actionWithType:1];
    [(CSCoverSheetViewControllerBase *)self sendAction:v3];
  }
  else if ([(CSDashBoardRemoteContentSettings *)self->_remoteContentSettings undimsOnTap])
  {
    [(CSRemoteContentModalViewController *)self _setUserHasInteractedSinceWake:1];
  }
}

- (void)_setUserHasInteractedSinceWake:(BOOL)a3
{
  if (self->_userHasInteractedSinceWake != a3)
  {
    self->_userHasInteractedSinceWake = a3;
    [(CSCoverSheetViewControllerBase *)self updateAppearanceForController:self];
    [(CSCoverSheetViewControllerBase *)self updateBehaviorForController:self];
  }
}

- (void)_createProperties
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v3 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
  p_scaleProperty = &self->_scaleProperty;
  scaleProperty = self->_scaleProperty;
  self->_scaleProperty = v3;

  [(UIViewFloatAnimatableProperty *)self->_scaleProperty setValue:1.0];
  uint64_t v6 = (SBFFluidBehaviorSettings *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  scaleSettings = self->_scaleSettings;
  self->_scaleSettings = v6;

  [(SBFFluidBehaviorSettings *)self->_scaleSettings setBehaviorType:2];
  [(SBFFluidBehaviorSettings *)self->_scaleSettings setDampingRatio:1.0];
  [(SBFFluidBehaviorSettings *)self->_scaleSettings setResponse:0.5];
  objc_super v8 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
  p_alphaProperty = &self->_alphaProperty;
  alphaProperty = self->_alphaProperty;
  self->_alphaProperty = v8;

  [(UIViewFloatAnimatableProperty *)self->_alphaProperty setValue:1.0];
  id v11 = (SBFFluidBehaviorSettings *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  alphaSettings = self->_alphaSettings;
  self->_alphaSettings = v11;

  [(SBFFluidBehaviorSettings *)self->_alphaSettings setBehaviorType:1];
  [(SBFFluidBehaviorSettings *)self->_alphaSettings setDampingRatio:1.0];
  [(SBFFluidBehaviorSettings *)self->_alphaSettings setResponse:0.25];
  objc_initWeak(&location, self);
  id v13 = (void *)MEMORY[0x1E4F42FF0];
  id v14 = *p_alphaProperty;
  v19[0] = *p_scaleProperty;
  v19[1] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __55__CSRemoteContentModalViewController__createProperties__block_invoke;
  v16[3] = &unk_1E6AD92C8;
  objc_copyWeak(&v17, &location);
  [v13 _createTransformerWithInputAnimatableProperties:v15 presentationValueChangedCallback:v16];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __55__CSRemoteContentModalViewController__createProperties__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateForPropertyChanged];
}

- (void)_updateForPropertyChanged
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (![(CSRemoteContentModalViewController *)self shouldHideHomeAffordance])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v19 = 0u;
    [(UIViewFloatAnimatableProperty *)self->_scaleProperty presentationValue];
    CSComponentTransitionInputsMake(0, (uint64_t)&v19, 0.0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v3, 0.0);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = self->_components;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          [v9 setTransitionModifiers:16];
          v14[0] = v19;
          v14[1] = v20;
          v14[2] = v21;
          [v9 setTransitionInputs:v14];
        }
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v22 count:16];
      }
      while (v6);
    }

    double v10 = 1.0;
    if (!UIAccessibilityIsReduceTransparencyEnabled())
    {
      [(UIViewFloatAnimatableProperty *)self->_alphaProperty presentationValue];
      double v10 = v11;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
    id v13 = [WeakRetained view];
    [v13 setAlpha:v10];
  }
  [(CSCoverSheetViewControllerBase *)self updateAppearanceForController:self];
}

- (void)addGrabberView:(id)a3
{
  id v9 = a3;
  p_grabberView = (id *)&self->_grabberView;
  objc_storeStrong((id *)&self->_grabberView, a3);
  if (SBFEffectiveHomeButtonType() == 2)
  {
    id v6 = *p_grabberView;
    uint64_t v7 = [(CSModalViewControllerBase *)self view];
    [v7 bounds];
    objc_msgSend(v6, "setFrame:");

    [*p_grabberView setAutoresizingMask:18];
    objc_super v8 = [(CSModalViewControllerBase *)self view];
    [v8 addSubview:*p_grabberView];
  }
  [(CSRemoteContentModalViewController *)self _updateGrabberViewVisibility];
}

- (void)_updateGrabberViewVisibility
{
  if ([(CSRemoteContentModalViewController *)self shouldHideHomeAffordance])
  {
    grabberView = self->_grabberView;
    [(UIView *)grabberView removeFromSuperview];
  }
  else
  {
    id v4 = [(CSModalViewControllerBase *)self view];
    [v4 addSubview:self->_grabberView];
  }
}

- (void)handleBottomEdgeGestureBegan:(id)a3
{
  id v4 = a3;
  [(CSRemoteContentModalViewController *)self _setCornerRounded:1];
  uint64_t v5 = [(CSModalViewControllerBase *)self view];
  [v4 translationInView:v5];
  CGFloat v7 = v6;
  CGFloat v9 = v8;

  self->_previousTranslation.x = v7;
  self->_previousTranslation.y = v9;

  if ([(CSRemoteContentModalViewController *)self suppressesDismissalGesture]
    && ![(CSRemoteContentModalViewController *)self shouldHideHomeAffordance])
  {
    rubberBandFeedbackGenerator = self->_rubberBandFeedbackGenerator;
    [(UIImpactFeedbackGenerator *)rubberBandFeedbackGenerator prepare];
  }
}

- (void)handleBottomEdgeGestureChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSModalViewControllerBase *)self view];
  [v4 translationInView:v5];
  CGFloat v7 = v6;
  CGFloat v9 = v8;

  self->_previousTranslation.x = v7;
  self->_previousTranslation.y = v9;
  [(UIViewFloatAnimatableProperty *)self->_scaleProperty presentationValue];
  BSUIInvertRubberBandValueForInterval();
  BSUIConstrainValueToIntervalWithRubberBand();
  -[CSRemoteContentModalViewController _updateContentScale:interactive:](self, "_updateContentScale:interactive:", 1, 0x3FEB333333333333, 1, 0x3FF0000000000000, 1);
  [(UIViewFloatAnimatableProperty *)self->_alphaProperty presentationValue];
  BSUIInvertRubberBandValueForInterval();
  BSUIConstrainValueToIntervalWithRubberBand();
  -[CSRemoteContentModalViewController _updateContentAlpha:interactive:](self, "_updateContentAlpha:interactive:", 1, 0x3FEB333333333333, 1, 0x3FF0000000000000, 1);
}

- (void)handleBottomEdgeGestureEnded:(id)a3
{
  [(CSRemoteContentModalViewController *)self _updateContentScale:0 interactive:1.0];
  [(CSRemoteContentModalViewController *)self _updateContentAlpha:0 interactive:1.0];
  if (![(CSRemoteContentModalViewController *)self _shouldCancelInteractiveDismissGesture])
  {
    if (![(CSRemoteContentModalViewController *)self shouldHideHomeAffordance])
    {
      if ([(CSRemoteContentModalViewController *)self suppressesDismissalGesture])
      {
        [(UIImpactFeedbackGenerator *)self->_rubberBandFeedbackGenerator impactOccurred];
      }
      else if ([(CSRemoteContentModalViewController *)self shouldCaptureHomeGesture])
      {
        [(UIImpactFeedbackGenerator *)self->_rubberBandFeedbackGenerator impactOccurredWithIntensity:0.5];
      }
    }
    [(CSRemoteContentModalViewController *)self _dismissForced:0 animated:1];
  }
}

- (void)dismissForHomeButton
{
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  CGFloat v9 = (CSDashBoardRemoteContentSettings *)a3;
  id v6 = a4;
  if ((CSDashBoardRemoteContentSettings *)self->_lockScreenSettings == v9)
  {
    if ([v6 isEqualToString:@"unlockRubberBandFeedbackIntensity"])
    {
      CGFloat v7 = (UIImpactFeedbackGenerator *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA8]), "initWithStyle:", -[CSLockScreenSettings unlockRubberBandFeedbackIntensity](self->_lockScreenSettings, "unlockRubberBandFeedbackIntensity"));
      rubberBandFeedbackGenerator = self->_rubberBandFeedbackGenerator;
      self->_rubberBandFeedbackGenerator = v7;
    }
  }
  else if (self->_remoteContentSettings == v9)
  {
    [(CSCoverSheetViewControllerBase *)self updateAppearanceForController:self];
  }
}

- (void)_setCornerRounded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(CSModalViewControllerBase *)self view];
  id v6 = v5;
  if (v3)
  {
    CGFloat v7 = [MEMORY[0x1E4F42D90] mainScreen];
    double v8 = [v7 traitCollection];
    [v8 displayCornerRadius];
    objc_msgSend(v6, "_setContinuousCornerRadius:");
  }
  else
  {
    [v5 _setContinuousCornerRadius:0.0];
  }

  id v9 = [(CSModalViewControllerBase *)self view];
  [v9 setClipsToBounds:v3];
}

- (void)_updateContentScale:(double)a3 interactive:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = 5;
  }
  else {
    uint64_t v4 = 3;
  }
  scaleSettings = self->_scaleSettings;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__CSRemoteContentModalViewController__updateContentScale_interactive___block_invoke;
  v8[3] = &unk_1E6AD9748;
  v8[4] = self;
  *(double *)&v8[5] = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__CSRemoteContentModalViewController__updateContentScale_interactive___block_invoke_2;
  v6[3] = &unk_1E6ADA998;
  BOOL v7 = a4;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E4F42FF0], "sb_animateWithSettings:mode:animations:completion:", scaleSettings, v4, v8, v6);
}

uint64_t __70__CSRemoteContentModalViewController__updateContentScale_interactive___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1064) setValue:*(double *)(a1 + 40)];
}

uint64_t __70__CSRemoteContentModalViewController__updateContentScale_interactive___block_invoke_2(uint64_t result)
{
  if (!*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) _setCornerRounded:0];
  }
  return result;
}

- (void)_updateContentAlpha:(double)a3 interactive:(BOOL)a4
{
  BOOL v4 = !a4;
  alphaSettings = self->_alphaSettings;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__CSRemoteContentModalViewController__updateContentAlpha_interactive___block_invoke;
  v7[3] = &unk_1E6AD9748;
  if (v4) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 5;
  }
  v7[4] = self;
  *(double *)&v7[5] = a3;
  objc_msgSend(MEMORY[0x1E4F42FF0], "sb_animateWithSettings:mode:animations:completion:", alphaSettings, v6, v7, 0);
}

uint64_t __70__CSRemoteContentModalViewController__updateContentAlpha_interactive___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1080) setValue:*(double *)(a1 + 40)];
}

- (BOOL)_shouldCancelInteractiveDismissGesture
{
  [(UIViewFloatAnimatableProperty *)self->_scaleProperty presentationValue];
  double v4 = v3;
  [(UIViewFloatAnimatableProperty *)self->_scaleProperty velocity];
  double v6 = v5;
  if ([(CSDashBoardRemoteContentSettings *)self->_remoteContentSettings usesLegacyDismissalLogic])
  {
    double v7 = 1000.0;
  }
  else
  {
    [(CSDashBoardRemoteContentSettings *)self->_remoteContentSettings directFlingDampeningFactor];
    double v7 = v8 * 1000.0;
  }
  double v9 = v4 + v6 / v7 * 0.99 / 0.01;
  if ([(CSDashBoardRemoteContentSettings *)self->_remoteContentSettings usesLegacyDismissalLogic])
  {
    double v10 = 0.0;
    if (v9 <= 1.0) {
      double v10 = 1.0 - v9;
    }
    double v11 = fabs(v10);
    [(CSDashBoardRemoteContentSettings *)self->_remoteContentSettings legacyThreshold];
    return v11 < vabdd_f64(v12, v9);
  }
  else
  {
    [(CSDashBoardRemoteContentSettings *)self->_remoteContentSettings directThreshold];
    return v9 > v14;
  }
}

- (void)_dismissForced:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (![(CSRemoteContentModalViewController *)self suppressesDismissalGesture] || v5)
  {
    self->_dismissing = 1;
    double v7 = 0.3;
    if (!v4) {
      double v7 = 0.0;
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__CSRemoteContentModalViewController__dismissForced_animated___block_invoke;
    v9[3] = &unk_1E6AD87F8;
    v9[4] = self;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62__CSRemoteContentModalViewController__dismissForced_animated___block_invoke_2;
    v8[3] = &unk_1E6AD8A40;
    v8[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:v9 animations:v8 completion:v7];
  }
}

void __62__CSRemoteContentModalViewController__dismissForced_animated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 setAlpha:0.0];

  id v3 = [*(id *)(a1 + 32) view];
  [v3 setBackgroundColor:0];
}

void __62__CSRemoteContentModalViewController__dismissForced_animated___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 removeFromSuperview];

  id v3 = *(void **)(a1 + 32);
  id v4 = +[CSAction actionWithType:1];
  [v3 sendAction:v4];
}

- (void)_updateSecondaryActionButtonText
{
  if ([(CSRemoteContentModalViewController *)self _suppressesBottomEdgeContent])
  {
    id v5 = 0;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v5 = [v3 localizedStringForKey:@"BEDTIME_DISMISS" value:&stru_1F3020248 table:@"CoverSheet"];
  }
  id v4 = [(CSModalViewControllerBase *)self viewIfLoaded];
  [v4 setSecondaryActionButtonText:v5];
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSRemoteContentModalViewController;
  if ([(CSCoverSheetViewControllerBase *)&v8 handleEvent:v4]
    && ([v4 isConsumable] & 1) != 0)
  {
    goto LABEL_6;
  }
  uint64_t v5 = [v4 type];
  if (v5 == 22)
  {
    [(CSRemoteContentModalViewController *)self didReceiveTouch];
    goto LABEL_8;
  }
  if (v5 != 25)
  {
LABEL_8:
    BOOL v6 = 0;
    goto LABEL_9;
  }
  [(CSRemoteContentModalViewController *)self _setUserHasInteractedSinceWake:0];
LABEL_6:
  BOOL v6 = 1;
LABEL_9:

  return v6;
}

- (void)_addChildHostViewController:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__CSRemoteContentModalViewController__addChildHostViewController___block_invoke;
  v6[3] = &unk_1E6AD8AF8;
  id v7 = v4;
  objc_super v8 = self;
  id v5 = v4;
  [(CSRemoteContentModalViewController *)self bs_addChildViewController:v5 animated:1 transitionBlock:v6];
}

void __66__CSRemoteContentModalViewController__addChildHostViewController___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  id v3 = [*(id *)(a1 + 40) view];
  [v3 bounds];
  objc_msgSend(v2, "setFrame:");

  id v5 = [*(id *)(a1 + 40) view];
  id v4 = [*(id *)(a1 + 32) view];
  [v5 sendSubviewToBack:v4];
}

- (void)_removeChildHostViewController
{
  if ([(CSRemoteContentModalViewController *)self isViewLoaded])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
    if (WeakRetained) {
      [(CSRemoteContentModalViewController *)self bs_removeChildViewController:WeakRetained];
    }
  }

  objc_storeWeak((id *)&self->_hostViewController, 0);
}

- (int64_t)_dateTimeStyle
{
  if ([(CSDashBoardRemoteContentSettings *)self->_remoteContentSettings overrideContentPreferences])
  {
    remoteContentSettings = self->_remoteContentSettings;
    return [(CSDashBoardRemoteContentSettings *)remoteContentSettings dateTimeStyleOverride];
  }
  else
  {
    remoteContentPreferences = self->_remoteContentPreferences;
    return [(SBSRemoteContentPreferences *)remoteContentPreferences dateTimeStyle];
  }
}

- (int64_t)_backgroundStyle
{
  if ([(CSDashBoardRemoteContentSettings *)self->_remoteContentSettings overrideContentPreferences])
  {
    remoteContentSettings = self->_remoteContentSettings;
    return [(CSDashBoardRemoteContentSettings *)remoteContentSettings backgroundStyleOverride];
  }
  else
  {
    remoteContentPreferences = self->_remoteContentPreferences;
    return [(SBSRemoteContentPreferences *)remoteContentPreferences backgroundStyle];
  }
}

- (int64_t)_homeGestureMode
{
  if ([(CSDashBoardRemoteContentSettings *)self->_remoteContentSettings overrideContentPreferences])
  {
    remoteContentSettings = self->_remoteContentSettings;
    return [(CSDashBoardRemoteContentSettings *)remoteContentSettings homeGestureModeOverride];
  }
  else if ([(SBFAuthenticationStatusProvider *)self->_authenticationStatusProvider hasAuthenticatedAtLeastOnceSinceBoot])
  {
    remoteContentPreferences = self->_remoteContentPreferences;
    return [(SBSRemoteContentPreferences *)remoteContentPreferences homeGestureMode];
  }
  else
  {
    return 4;
  }
}

- (BOOL)_suppressesBottomEdgeContent
{
  return [(SBSRemoteContentPreferences *)self->_remoteContentPreferences suppressesBottomEdgeContent];
}

- (BOOL)_dismissesOnTap
{
  if ([(CSDashBoardRemoteContentSettings *)self->_remoteContentSettings overrideContentPreferences])
  {
    remoteContentSettings = self->_remoteContentSettings;
    return [(CSDashBoardRemoteContentSettings *)remoteContentSettings dismissesOnTapOverride];
  }
  else
  {
    remoteContentPreferences = self->_remoteContentPreferences;
    return [(SBSRemoteContentPreferences *)remoteContentPreferences dismissesOnTap];
  }
}

- (BOOL)_reducesWhitePoint
{
  if (self->_userHasInteractedSinceWake
    || ![(CSDashBoardRemoteContentSettings *)self->_remoteContentSettings forceLuminanceReduction]&& ![(SBSRemoteContentPreferences *)self->_remoteContentPreferences reducesWhitePoint])
  {
    return 0;
  }

  return [(CSRemoteContentModalViewController *)self _supportsLuminanceReductionForCurrentBackgroundStyle];
}

- (BOOL)_supportsLuminanceReductionForCurrentBackgroundStyle
{
  return (unint64_t)([(CSRemoteContentModalViewController *)self _backgroundStyle] - 2) < 3;
}

- (CSRemoteContentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSRemoteContentViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBFAuthenticationStatusProvider)authenticationStatusProvider
{
  return self->_authenticationStatusProvider;
}

- (CSRemoteContentHostViewController)hostViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);

  return (CSRemoteContentHostViewController *)WeakRetained;
}

- (CSLockScreenSettings)lockScreenSettings
{
  return self->_lockScreenSettings;
}

- (void)setLockScreenSettings:(id)a3
{
}

- (UIImpactFeedbackGenerator)rubberBandFeedbackGenerator
{
  return self->_rubberBandFeedbackGenerator;
}

- (void)setRubberBandFeedbackGenerator:(id)a3
{
}

- (CSContentComponent)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (CSDateViewComponent)dateTimeComponent
{
  return self->_dateTimeComponent;
}

- (void)setDateTimeComponent:(id)a3
{
}

- (CSProudLockComponent)proudLockComponent
{
  return self->_proudLockComponent;
}

- (void)setProudLockComponent:(id)a3
{
}

- (CSQuickActionsComponent)quickActionsComponent
{
  return self->_quickActionsComponent;
}

- (void)setQuickActionsComponent:(id)a3
{
}

- (CSDashBoardRemoteContentSettings)remoteContentSettings
{
  return self->_remoteContentSettings;
}

- (void)setRemoteContentSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteContentSettings, 0);
  objc_storeStrong((id *)&self->_quickActionsComponent, 0);
  objc_storeStrong((id *)&self->_proudLockComponent, 0);
  objc_storeStrong((id *)&self->_dateTimeComponent, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_rubberBandFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_lockScreenSettings, 0);
  objc_destroyWeak((id *)&self->_hostViewController);
  objc_storeStrong((id *)&self->_authenticationStatusProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_remoteContentPreferences, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_grabberView, 0);
  objc_storeStrong((id *)&self->_alphaSettings, 0);
  objc_storeStrong((id *)&self->_alphaProperty, 0);
  objc_storeStrong((id *)&self->_scaleSettings, 0);

  objc_storeStrong((id *)&self->_scaleProperty, 0);
}

@end