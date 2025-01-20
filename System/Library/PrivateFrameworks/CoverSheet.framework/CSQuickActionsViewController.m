@interface CSQuickActionsViewController
+ (BOOL)deviceSupportsButtons;
+ (Class)viewClass;
- (APSubjectMonitorSubscription)appProtectionSubjectMonitorSubscription;
- (BOOL)_captureExtensionsEnabled;
- (BOOL)_isFlashlightOn;
- (BOOL)_prewarmingForCaptureExtensionLaunch;
- (BOOL)_shouldUseControlsInPlaceOfButtons;
- (BOOL)animatingToCamera;
- (BOOL)captureExtensionsEnabled;
- (BOOL)handleEvent:(id)a3;
- (BOOL)interpretsLocationAsBesideButtons:(CGPoint)a3 inView:(id)a4;
- (BOOL)interpretsLocationAsContent:(CGPoint)a3 inView:(id)a4;
- (BOOL)isCameraRestricted;
- (BOOL)isPortrait;
- (BOOL)shouldTouchesBeginForClick:(id)a3;
- (BOOL)suppressingVisibleChanges;
- (BOOL)systemQuickActionLaunchCaptureApplication:(id)a3;
- (CHSControlHost)controlHost;
- (CSApplicationInforming)applicationInformer;
- (CSCameraPrewarming)cameraPrewarmer;
- (CSCoverSheetViewController)coverSheetViewController;
- (CSQuickActionsConfiguration)quickActionsConfiguration;
- (CSQuickActionsViewController)init;
- (CSQuickActionsViewController)initWithLockScreenDefaults:(id)a3 applicationInformer:(id)a4;
- (SBFLockOutStatusProvider)lockOutController;
- (double)_actionTimeoutDuration;
- (id)_actionForSystemControl:(id)a3;
- (id)_actions;
- (id)_configurationItemForAction:(id)a3 withIdentifier:(id)a4;
- (id)_controlInstanceForSystemControl:(id)a3;
- (id)_newFlashlightAction;
- (id)_quickActionForConfiguration:(id)a3;
- (id)_validActionForAction:(id)a3;
- (id)bestIconViewForApplicationBundleIdentifier:(id)a3;
- (int64_t)presentationPriority;
- (int64_t)presentationStyle;
- (int64_t)presentationType;
- (void)_actions;
- (void)_addStateCaptureHandlers;
- (void)_deviceBlockStateDidChangeNotification:(id)a3;
- (void)_featureLockStateDidChangeNotification:(id)a3;
- (void)_resetIdleTimer;
- (void)_setupFlashlightController;
- (void)_setupFlashlightControllerIfNecessary;
- (void)_tearDownFlashlight;
- (void)_tearDownFlashlightIfOff;
- (void)_updateControlHost;
- (void)_updateFlashlightAction:(id)a3;
- (void)_validateActions;
- (void)activateCameraView;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)dealloc;
- (void)extensionsDidChangeForExtensionProvider:(id)a3;
- (void)fireActionForButton:(id)a3;
- (void)launchCameraCapture:(id)a3;
- (void)loadView;
- (void)setAnimatingToCamera:(BOOL)a3;
- (void)setAppProtectionSubjectMonitorSubscription:(id)a3;
- (void)setApplicationInformer:(id)a3;
- (void)setCameraPrewarmer:(id)a3;
- (void)setControlHost:(id)a3;
- (void)setCoverSheetViewController:(id)a3;
- (void)setLockOutController:(id)a3;
- (void)setQuickActionsConfiguration:(id)a3;
- (void)setSuppressingVisibleChanges:(BOOL)a3;
- (void)touchBeganForButton:(id)a3;
- (void)touchEndedForButton:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CSQuickActionsViewController

- (CSQuickActionsViewController)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FA60B0]);
  v4 = [(CSQuickActionsViewController *)self initWithLockScreenDefaults:v3 applicationInformer:0];

  return v4;
}

- (CSQuickActionsViewController)initWithLockScreenDefaults:(id)a3 applicationInformer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CSQuickActionsViewController;
  v9 = [(CSQuickActionsViewController *)&v22 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lockScreenDefaults, a3);
    v11 = [MEMORY[0x1E4F4B800] subjectMonitorRegistry];
    v12 = [v11 addMonitor:v10 subjectMask:1 subscriptionOptions:1];
    objc_storeWeak((id *)&v10->_appProtectionSubjectMonitorSubscription, v12);

    uint64_t v13 = +[CSLockScreenDomain rootSettings];
    prototypeSettings = v10->_prototypeSettings;
    v10->_prototypeSettings = (CSLockScreenSettings *)v13;

    [(PTSettings *)v10->_prototypeSettings addKeyObserver:v10];
    id v15 = objc_alloc(MEMORY[0x1E4F58E40]);
    v16 = [MEMORY[0x1E4F58E50] visibleControls];
    uint64_t v17 = [v15 initWithOptions:v16];
    extensionProvider = v10->_extensionProvider;
    v10->_extensionProvider = (CHSWidgetExtensionProvider *)v17;

    [(CHSWidgetExtensionProvider *)v10->_extensionProvider registerObserver:v10];
    v19 = (SBMiscellaneousDefaults *)objc_alloc_init(MEMORY[0x1E4FA60B8]);
    miscellaneousSettings = v10->_miscellaneousSettings;
    v10->_miscellaneousSettings = v19;

    objc_storeWeak((id *)&v10->_applicationInformer, v8);
  }

  return v10;
}

- (void)loadView
{
  id v3 = [CSQuickActionsView alloc];
  v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 bounds];
  id v7 = -[CSQuickActionsView initWithFrame:delegate:](v3, "initWithFrame:delegate:", self);

  [(CSQuickActionsView *)v7 setDelegate:self];
  v5 = [(CSCoverSheetViewControllerBase *)self activeAppearance];
  v6 = [v5 legibilitySettings];
  [(CSQuickActionsView *)v7 setLegibilitySettings:v6];

  [(CSQuickActionsViewController *)self setView:v7];
  [(CSQuickActionsViewController *)self _addStateCaptureHandlers];
}

- (void)setQuickActionsConfiguration:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_quickActionsConfiguration, a3);
    v6 = [v5 controls];
    unint64_t v7 = [v6 count];

    if (v7 >= 2)
    {
      id v8 = [v5 controls];
      v9 = [v8 firstObject];

      if ((BSEqualObjects() & 1) == 0)
      {
        objc_storeStrong((id *)&self->_leadingConfiguration, v9);
        v10 = [(CSQuickActionsViewController *)self _quickActionForConfiguration:self->_leadingConfiguration];
        leadingAction = self->_leadingAction;
        self->_leadingAction = v10;

        v12 = SBLogDashBoard();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = self->_leadingAction;
          int v20 = 138543362;
          v21 = v13;
          _os_log_impl(&dword_1D839D000, v12, OS_LOG_TYPE_DEFAULT, "[Quick Action] leadingConfiguration updated, new leadingAction: %{public}@", (uint8_t *)&v20, 0xCu);
        }
      }
      v14 = [v5 controls];
      id v15 = [v14 lastObject];

      if ((BSEqualObjects() & 1) == 0)
      {
        objc_storeStrong((id *)&self->_trailingConfiguration, v15);
        v16 = [(CSQuickActionsViewController *)self _quickActionForConfiguration:self->_trailingConfiguration];
        trailingAction = self->_trailingAction;
        self->_trailingAction = v16;

        v18 = SBLogDashBoard();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = self->_trailingAction;
          int v20 = 138543362;
          v21 = v19;
          _os_log_impl(&dword_1D839D000, v18, OS_LOG_TYPE_DEFAULT, "[Quick Action] trailingConfiguration updated, new trailingAction: %{public}@", (uint8_t *)&v20, 0xCu);
        }
      }
      [(CSQuickActionsViewController *)self _validateActions];
    }
  }
}

- (id)_quickActionForConfiguration:(id)a3
{
  id v4 = a3;
  switch([v4 category])
  {
    case 0:
      id v5 = objc_alloc_init(CSEmptyQuickAction);
      goto LABEL_6;
    case 1:
      id v5 = [(CSQuickActionsViewController *)self _newFlashlightAction];
      goto LABEL_6;
    case 2:
      id v5 = self->_cameraAction;
      goto LABEL_6;
    case 3:
      id v5 = [(CSQuickActionsViewController *)self _actionForSystemControl:v4];
LABEL_6:
      self = (CSQuickActionsViewController *)v5;
      break;
    default:
      break;
  }

  return self;
}

- (void)_setupFlashlightControllerIfNecessary
{
  leadingAction = self->_leadingAction;
  if (leadingAction)
  {
    uint64_t v4 = objc_opt_class();
    id v5 = leadingAction;
    if (v4)
    {
      if (objc_opt_isKindOfClass()) {
        v6 = v5;
      }
      else {
        v6 = 0;
      }
    }
    else
    {
      v6 = 0;
    }
    v10 = v6;

    if (v10)
    {

LABEL_18:
      [(CSQuickActionsViewController *)self _setupFlashlightController];
      return;
    }
    trailingAction = self->_trailingAction;
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = trailingAction;
    if (v12)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v12 = (uint64_t)v13;
      }
      else {
        uint64_t v12 = 0;
      }
    }

    if (v12) {
      goto LABEL_18;
    }
  }
  else
  {
    unint64_t v7 = [(CSQuickActionsViewController *)self _newFlashlightAction];
    id v8 = self->_leadingAction;
    self->_leadingAction = v7;

    v9 = SBLogDashBoard();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v14[0] = 0;
      _os_log_impl(&dword_1D839D000, v9, OS_LOG_TYPE_DEFAULT, "[Quick Action] leading action being defaulted to flashlight", (uint8_t *)v14, 2u);
    }
  }
}

- (void)_setupFlashlightController
{
  if ([MEMORY[0x1E4FA79B8] deviceSupportsFlashlight] && !self->_flashlight)
  {
    id v3 = [MEMORY[0x1E4FA79B8] sharedInstance];
    flashlight = self->_flashlight;
    self->_flashlight = v3;

    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:self selector:sel__deviceBlockStateDidChangeNotification_ name:*MEMORY[0x1E4FA60F0] object:0];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:self selector:sel__featureLockStateDidChangeNotification_ name:*MEMORY[0x1E4FA7A40] object:0];

    [(CSQuickActionsViewController *)self _updateFlashlightAction:self->_leadingAction];
    trailingAction = self->_trailingAction;
    [(CSQuickActionsViewController *)self _updateFlashlightAction:trailingAction];
  }
}

- (void)_updateFlashlightAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v8 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v8;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    [v7 setFlashlightController:self->_flashlight];
    [(SBUIFlashlightController *)self->_flashlight addObserver:v7];
  }
}

- (id)_newFlashlightAction
{
  if (![MEMORY[0x1E4FA79B8] deviceSupportsFlashlight]) {
    return 0;
  }
  [(CSQuickActionsViewController *)self _setupFlashlightController];
  id v3 = [CSFlashlightQuickAction alloc];
  flashlight = self->_flashlight;

  return [(CSFlashlightQuickAction *)v3 initWithFlashlightController:flashlight];
}

- (id)_actionForSystemControl:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSQuickActionsViewController *)self _controlInstanceForSystemControl:v4];
  v6 = [v4 controlIdentity];
  id v7 = [v6 extensionIdentity];
  id v8 = [v7 containerBundleIdentifier];
  int v9 = BSEqualStrings();

  if (v9)
  {
    v10 = [[CSCameraSystemQuickAction alloc] initWithQuickActionControlIdentity:v6 instance:v5 delegate:self prewarmer:self->_cameraPrewarmer prototypeSettings:self->_prototypeSettings defaults:self->_lockScreenDefaults];
  }
  else
  {
    v11 = [v4 controlIdentity];
    uint64_t v12 = [v11 kind];
    int v13 = BSEqualStrings();

    if (v13)
    {
      v10 = [(CSQuickActionsViewController *)self _newFlashlightAction];
    }
    else
    {
      uint64_t v14 = [v4 type];
      if (v14 == 1)
      {
        id v15 = CSSystemToggleQuickAction;
      }
      else if (v14 == 2)
      {
        id v15 = CSSystemButtonQuickAction;
      }
      else
      {
        id v15 = CSSystemQuickAction;
      }
      v10 = (CSCameraSystemQuickAction *)[[v15 alloc] initWithQuickActionControlIdentity:v6 instance:v5 delegate:self];
    }
  }
  v16 = v10;

  return v16;
}

- (id)_configurationItemForAction:(id)a3 withIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    id v8 = [v7 controlIdentity];

    if (v8)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F58D18]);
      v10 = [v7 controlIdentity];
      id v8 = (void *)[v9 initWithUniqueIdentifier:v6 controlIdentity:v10 location:4];

      [v8 setPushPolicy:2];
      [v8 setCanAppearInSecureEnvironment:1];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_controlInstanceForSystemControl:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 controlIdentity];
  uint64_t v6 = [v4 controlType];
  uint64_t v7 = [v4 position];

  if (v7 == 1)
  {
    id v8 = @"Quick-Action-Leading";
    if (v5)
    {
LABEL_4:
      if (v6)
      {
        id v9 = (void *)[objc_alloc(MEMORY[0x1E4F58C90]) initWithControl:v5 contentType:0 hostIdentifier:@"com.apple.springboard.Quick-Actions" configurationIdentifier:v8];
        v10 = [MEMORY[0x1E4F58F30] instanceOfType:v6 instanceIdentity:v9];
        [v10 modifyConfiguration:&__block_literal_global];
        [v10 activate];

        goto LABEL_17;
      }
      v11 = SBLogDashBoard();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      int v22 = 138412290;
      v23 = self;
      uint64_t v12 = "[Quick Action] failed to create controlInstance for %@ due to unknown control type";
      goto LABEL_14;
    }
  }
  else
  {
    if (v7 != 2)
    {
      int v13 = SBLogDashBoard();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CSQuickActionsViewController _controlInstanceForSystemControl:](v13, v14, v15, v16, v17, v18, v19, v20);
      }

      goto LABEL_16;
    }
    id v8 = @"Quick-Action-Trailing";
    if (v5) {
      goto LABEL_4;
    }
  }
  v11 = SBLogDashBoard();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412290;
    v23 = self;
    uint64_t v12 = "[Quick Action] failed to create controlInstance for %@ due to nil controlIdentity";
LABEL_14:
    _os_log_impl(&dword_1D839D000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v22, 0xCu);
  }
LABEL_15:

LABEL_16:
  v10 = 0;
LABEL_17:

  return v10;
}

uint64_t __65__CSQuickActionsViewController__controlInstanceForSystemControl___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setCanAppearInSecureEnvironment:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CSQuickActionsViewController;
  [(CSCoverSheetViewControllerBase *)&v6 viewWillAppear:a3];
  [(CSQuickActionsViewController *)self _setupFlashlightControllerIfNecessary];
  id v4 = [(CSQuickActionsViewController *)self quickActionsView];
  [v4 refreshSupportedButtons];

  id v5 = [(CSQuickActionsViewController *)self quickActionsView];
  [v5 setActionsVisible:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSQuickActionsViewController;
  [(CSCoverSheetViewControllerBase *)&v5 viewDidDisappear:a3];
  [(CSQuickActionsViewController *)self _tearDownFlashlightIfOff];
  id v4 = [(CSQuickActionsViewController *)self quickActionsView];
  [v4 setActionsVisible:0];
}

- (void)dealloc
{
  [(CSQuickActionsViewController *)self _tearDownFlashlightIfOff];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appProtectionSubjectMonitorSubscription);
  [WeakRetained invalidate];

  id v4 = [(CSQuickActionsViewController *)self controlHost];
  [v4 invalidate];

  [(CHSWidgetExtensionProvider *)self->_extensionProvider unregisterObserver:self];
  [(CHSWidgetExtensionProvider *)self->_extensionProvider invalidate];
  [(BSDefaultObserver *)self->_defaultsObserverToken invalidate];
  v5.receiver = self;
  v5.super_class = (Class)CSQuickActionsViewController;
  [(CSCoverSheetViewControllerBase *)&v5 dealloc];
}

- (BOOL)_shouldUseControlsInPlaceOfButtons
{
  return CSFeatureEnabled(8);
}

+ (BOOL)deviceSupportsButtons
{
  uint64_t v2 = SBFEffectiveHomeButtonType();
  id v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  return (v4 & 0xFFFFFFFFFFFFFFFBLL) != 1 && v2 == 2;
}

- (BOOL)interpretsLocationAsContent:(CGPoint)a3 inView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = [(CSQuickActionsViewController *)self quickActionsView];
  char v9 = objc_msgSend(v8, "interpretsLocationAsContent:inView:", v7, x, y);

  return v9;
}

- (BOOL)interpretsLocationAsBesideButtons:(CGPoint)a3 inView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = [(CSQuickActionsViewController *)self quickActionsView];
  char v9 = objc_msgSend(v8, "interpretsLocationAsBesideContent:inView:", v7, x, y);

  return v9;
}

- (id)bestIconViewForApplicationBundleIdentifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CSQuickActionsViewController *)self quickActionsView];
  objc_super v6 = [v5 buttonsForApplicationBundleIdentifier:v4];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastFiredQuickActionsButton);
  if ([v6 containsObject:WeakRetained])
  {
    id v8 = WeakRetained;
  }
  else
  {
    id v8 = [v6 firstObject];
  }
  char v9 = v8;

  return v9;
}

- (void)_addStateCaptureHandlers
{
  if (+[CSQuickActionsViewController deviceSupportsButtons])
  {
    objc_initWeak(&location, self);
    id v3 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v5, &location);
    id v4 = (id)BSLogAddStateCaptureBlockWithTitle();

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

__CFString *__56__CSQuickActionsViewController__addStateCaptureHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained quickActionsView];
  int v3 = [v2 isUserInteractionEnabled];
  id v4 = @"Interaction disabled\n";
  if (v3) {
    id v4 = @"Interaction enabled\n";
  }
  id v5 = v4;

  return v5;
}

- (void)_validateActions
{
  id obj = [(CSQuickActionsViewController *)self _validActionForAction:self->_leadingAction];
  int v3 = [(CSQuickActionsViewController *)self _validActionForAction:self->_trailingAction];
  if (!BSEqualObjects())
  {
    objc_storeStrong((id *)&self->_validatedLeadingAction, obj);
    p_validatedTrailingAction = &self->_validatedTrailingAction;
    if (BSEqualObjects())
    {
LABEL_6:
      id v5 = [(CSQuickActionsViewController *)self quickActionsView];
      objc_super v6 = [(CSQuickActionsViewController *)self _actions];
      [v5 setButtonActions:v6];

      [(CSQuickActionsViewController *)self _updateControlHost];
      goto LABEL_7;
    }
LABEL_5:
    objc_storeStrong((id *)p_validatedTrailingAction, v3);
    goto LABEL_6;
  }
  p_validatedTrailingAction = &self->_validatedTrailingAction;
  if ((BSEqualObjects() & 1) == 0) {
    goto LABEL_5;
  }
LABEL_7:
}

- (void)_updateControlHost
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v3 = [(CSQuickActionsViewController *)self _configurationItemForAction:self->_validatedLeadingAction withIdentifier:@"Quick-Action-Leading"];
  id v4 = [(CSQuickActionsViewController *)self _configurationItemForAction:self->_validatedTrailingAction withIdentifier:@"Quick-Action-Trailing"];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_super v6 = v5;
  if (v3) {
    [v5 addObject:v3];
  }
  if (v4) {
    [v6 addObject:v4];
  }
  uint64_t v7 = [v6 count];
  controlHost = self->_controlHost;
  if (v7)
  {
    if (!controlHost)
    {
      char v9 = SBLogDashBoard();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1D839D000, v9, OS_LOG_TYPE_DEFAULT, "[Quick Action] activating control host", (uint8_t *)&v15, 2u);
      }

      v10 = (CHSControlHost *)[objc_alloc(MEMORY[0x1E4F58C78]) initWithIdentifier:@"com.apple.springboard.Quick-Actions"];
      v11 = self->_controlHost;
      self->_controlHost = v10;

      [(CHSControlHost *)self->_controlHost activate];
    }
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F58C48]) initWithControlItems:v6];
    int v13 = SBLogDashBoard();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      uint64_t v16 = v12;
      _os_log_impl(&dword_1D839D000, v13, OS_LOG_TYPE_DEFAULT, "[Quick Action] updating control host configuration %@", (uint8_t *)&v15, 0xCu);
    }

    [(CHSControlHost *)self->_controlHost setConfiguration:v12];
  }
  else if (controlHost)
  {
    uint64_t v14 = SBLogDashBoard();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1D839D000, v14, OS_LOG_TYPE_DEFAULT, "[Quick Action] deactivating control host", (uint8_t *)&v15, 2u);
    }

    [(CHSControlHost *)self->_controlHost deactivate];
    [(CHSControlHost *)self->_controlHost invalidate];
    [(CSQuickActionsViewController *)self setControlHost:0];
  }
}

- (id)_validActionForAction:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    char v9 = [v8 controlIdentity];
    v10 = [v9 extensionIdentity];
    v11 = [v10 containerBundleIdentifier];
    uint64_t v12 = [v9 kind];
  }
  else
  {
    v10 = objc_opt_class();
    id v13 = v6;
    if (v10)
    {
      if (objc_opt_isKindOfClass()) {
        v10 = v13;
      }
      else {
        v10 = 0;
      }
    }

    if (!v10)
    {
      uint64_t v16 = (CSEmptyQuickAction *)v13;
      uint64_t v12 = 0;
      v11 = 0;
      char v9 = 0;
      goto LABEL_40;
    }
    v11 = @"com.apple.camera";
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F58CC0]) initWithExtensionBundleIdentifier:@"com.apple.camera.LauncherControlExtension" containerBundleIdentifier:v11 deviceIdentifier:0];
    uint64_t v12 = @"com.apple.camera.deeplink.button";
    char v9 = 0;
  }
  uint64_t v14 = [MEMORY[0x1E4F4B7E0] applicationWithBundleIdentifier:v11];
  if (([v14 isLocked] & 1) != 0 || objc_msgSend(v14, "isHidden"))
  {
    int v15 = SBLogDashBoard();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v33 = v6;
      __int16 v34 = 2114;
      v35 = v11;
      _os_log_impl(&dword_1D839D000, v15, OS_LOG_TYPE_DEFAULT, "[Quick Action] removing button for %{public}@ with containerBundleIdentifier %{public}@ because app was hidden or locked", buf, 0x16u);
    }

    uint64_t v16 = objc_alloc_init(CSEmptyQuickAction);
    goto LABEL_39;
  }
  extensionProvider = self->_extensionProvider;
  if (!v9)
  {
    uint64_t v19 = [v10 extensionBundleIdentifier];
    v29 = [(CHSWidgetExtensionProvider *)extensionProvider widgetExtensionContainerForExtensionBundleIdentifier:v19];

    v28 = [v29 extensionForExtensionIdentity:v10];
    uint64_t v20 = [v28 orderedControlDescriptors];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __54__CSQuickActionsViewController__validActionForAction___block_invoke;
    v30[3] = &unk_1E6AD8970;
    v31 = v12;
    uint64_t v18 = objc_msgSend(v20, "bs_firstObjectPassingTest:", v30);

    if (v18) {
      goto LABEL_21;
    }
LABEL_24:
    v21 = SBLogDashBoard();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v33 = v6;
      __int16 v34 = 2114;
      v35 = v11;
      _os_log_impl(&dword_1D839D000, v21, OS_LOG_TYPE_DEFAULT, "[Quick Action] no descriptor found for %{public}@ with containerBundleIdentifier %{public}@", buf, 0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationInformer);
    v23 = WeakRetained;
    if (WeakRetained)
    {
      if ([WeakRetained isSystemRestoringFromBackup])
      {
LABEL_33:
        v25 = (CSEmptyQuickAction *)v6;
LABEL_37:
        uint64_t v16 = v25;

        goto LABEL_38;
      }
      if (([v23 isInstallingApplicationWithBundleIdentifier:v11] & 1) != 0
        || [v23 applicationExistsForBundleIdentifier:v11])
      {
        uint64_t v24 = SBLogDashBoard();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          [(CSQuickActionsViewController *)(uint64_t)v6 _validActionForAction:v24];
        }

        goto LABEL_33;
      }
    }
    v26 = SBLogDashBoard();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v33 = v6;
      __int16 v34 = 2114;
      v35 = v11;
      _os_log_impl(&dword_1D839D000, v26, OS_LOG_TYPE_DEFAULT, "[Quick Action] removing button for %{public}@ because no control descriptor found and could not find application with containerBundleIdentifier %{public}@", buf, 0x16u);
    }

    v25 = objc_alloc_init(CSEmptyQuickAction);
    goto LABEL_37;
  }
  uint64_t v18 = [(CHSWidgetExtensionProvider *)self->_extensionProvider controlDescriptorForControl:v9];
  if (!v18) {
    goto LABEL_24;
  }
LABEL_21:
  uint64_t v16 = (CSEmptyQuickAction *)v6;
LABEL_38:

LABEL_39:
LABEL_40:

  return v16;
}

uint64_t __54__CSQuickActionsViewController__validActionForAction___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 kind];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (int64_t)presentationPriority
{
  return 7;
}

- (int64_t)presentationStyle
{
  return 1;
}

- (int64_t)presentationType
{
  return 1;
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CSQuickActionsViewController;
  if (![(CSCoverSheetViewControllerBase *)&v16 handleEvent:v4]
    || ([v4 isConsumable] & 1) == 0)
  {
    uint64_t v6 = [v4 type];
    char v5 = 0;
    if (v6 > 23)
    {
      if (v6 == 24)
      {
        [(CSQuickActionsViewController *)self _setupFlashlightControllerIfNecessary];
        uint64_t v14 = [(CSQuickActionsViewController *)self quickActionsView];
        [v14 setUserInteractionEnabled:1];

        char v9 = [(CSQuickActionsViewController *)self quickActionsView];
        uint64_t v7 = v9;
        uint64_t v10 = 1;
      }
      else
      {
        if (v6 != 25) {
          goto LABEL_16;
        }
        [(CSQuickActionsViewController *)self _tearDownFlashlightIfOff];
        id v8 = [(CSQuickActionsViewController *)self quickActionsView];
        [v8 setUserInteractionEnabled:0];

        char v9 = [(CSQuickActionsViewController *)self quickActionsView];
        uint64_t v7 = v9;
        uint64_t v10 = 0;
      }
      [v9 setActionsVisible:v10];
    }
    else
    {
      if (v6 == 1)
      {
        v11 = [(CSQuickActionsViewController *)self quickActionsView];
        uint64_t v12 = [(CSCoverSheetViewControllerBase *)self activeAppearance];
        id v13 = [v12 legibilitySettings];
        [v11 setLegibilitySettings:v13];

LABEL_15:
        char v5 = 0;
        goto LABEL_16;
      }
      if (v6 != 2) {
        goto LABEL_16;
      }
      uint64_t v7 = [(CSQuickActionsViewController *)self quickActionsView];
      [v7 refreshSupportedButtons];
    }

    goto LABEL_15;
  }
  char v5 = [v4 isConsumable];
LABEL_16:

  return v5;
}

- (void)setCameraPrewarmer:(id)a3
{
  char v5 = (CSCameraPrewarming *)a3;
  if (self->_cameraPrewarmer != v5)
  {
    objc_storeStrong((id *)&self->_cameraPrewarmer, a3);
    if (!self->_cameraAction)
    {
      uint64_t v6 = [[CSCameraQuickAction alloc] initWithDelegate:self prewarmer:self->_cameraPrewarmer prototypeSettings:self->_prototypeSettings defaults:self->_lockScreenDefaults];
      cameraAction = self->_cameraAction;
      self->_cameraAction = v6;

      if (!self->_trailingAction)
      {
        objc_storeStrong((id *)&self->_trailingAction, self->_cameraAction);
        id v8 = SBLogDashBoard();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)char v9 = 0;
          _os_log_impl(&dword_1D839D000, v8, OS_LOG_TYPE_DEFAULT, "[Quick Action] trailing action being defaulted to camera", v9, 2u);
        }
      }
      [(CSQuickActionsViewController *)self _validateActions];
    }
  }
}

- (BOOL)isCameraRestricted
{
  uint64_t v2 = [(CSCoverSheetViewControllerBase *)self activeBehavior];
  char v3 = [v2 areRestrictedCapabilities:4];

  return v3;
}

- (void)activateCameraView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetViewController);
  [WeakRetained activateCameraViewAnimated:1 sendingActions:0 completion:0];
}

- (void)launchCameraCapture:(id)a3
{
  id v4 = a3;
  id v6 = [(CSQuickActionsViewController *)self coverSheetViewController];
  char v5 = [v6 applicationLauncher];
  [v5 launchCaptureApplication:v4];
}

- (BOOL)systemQuickActionLaunchCaptureApplication:(id)a3
{
  id v4 = a3;
  char v5 = [(CSQuickActionsViewController *)self coverSheetViewController];
  id v6 = [v5 applicationLauncher];
  char v7 = [v6 launchCaptureApplication:v4];

  return v7;
}

- (BOOL)_captureExtensionsEnabled
{
  return MEMORY[0x1F412AB50](0, a2);
}

- (BOOL)_prewarmingForCaptureExtensionLaunch
{
  int v2 = [(CSQuickActionsViewController *)self _captureExtensionsEnabled];
  if (v2)
  {
    LOBYTE(v2) = _os_feature_enabled_impl();
  }
  return v2;
}

- (BOOL)isPortrait
{
  return (unint64_t)([(CSQuickActionsViewController *)self interfaceOrientation] - 1) < 2;
}

- (BOOL)shouldTouchesBeginForClick:(id)a3
{
  char v3 = [(CSQuickActionsViewController *)self coverSheetViewController];
  id v4 = [v3 activeBehavior];
  int v5 = [v4 areRestrictedCapabilities:0x2000000];

  if (v5)
  {
    id v6 = SBLogDashBoard();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1D839D000, v6, OS_LOG_TYPE_DEFAULT, "[Quick Action] New touch dropped for restriction", v8, 2u);
    }
  }
  return v5 ^ 1;
}

- (void)touchBeganForButton:(id)a3
{
  id v4 = a3;
  [(CSQuickActionsViewController *)self _actionTimeoutDuration];
  double v6 = v5;
  if ((BSFloatIsZero() & 1) == 0)
  {
    objc_initWeak(&location, self);
    if (self->_buttonTouchTimer)
    {
      char v7 = SBLogDashBoard();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, "[Quick Action] Previous timeout zombified?", buf, 2u);
      }

      [(NSTimer *)self->_buttonTouchTimer invalidate];
      buttonTouchTimer = self->_buttonTouchTimer;
      self->_buttonTouchTimer = 0;
    }
    char v9 = (void *)MEMORY[0x1E4F1CB00];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __52__CSQuickActionsViewController_touchBeganForButton___block_invoke;
    v16[3] = &unk_1E6AD8998;
    objc_copyWeak(&v17, &location);
    uint64_t v10 = [v9 timerWithTimeInterval:0 repeats:v16 block:v6];
    v11 = self->_buttonTouchTimer;
    self->_buttonTouchTimer = v10;

    uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
    timerStartTime = self->_timerStartTime;
    self->_timerStartTime = v12;

    uint64_t v14 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v14 addTimer:self->_buttonTouchTimer forMode:*MEMORY[0x1E4F1C4B0]];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  self->_buttonActionAllowedForTimer = 1;
  int v15 = [v4 action];
  [v15 touchBegan];
}

void __52__CSQuickActionsViewController_touchBeganForButton___block_invoke(uint64_t a1)
{
  int v2 = SBLogDashBoard();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl(&dword_1D839D000, v2, OS_LOG_TYPE_DEFAULT, "[Quick Action] Timeout fired.", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *((unsigned char *)WeakRetained + 1160) = 0;
  [*((id *)WeakRetained + 143) invalidate];
  id v4 = (void *)*((void *)WeakRetained + 143);
  *((void *)WeakRetained + 143) = 0;
}

- (void)fireActionForButton:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(CSQuickActionsViewController *)self coverSheetViewController];
  double v6 = [v5 activeBehavior];
  int v7 = [v6 areRestrictedCapabilities:0x2000000];

  if (v7)
  {
    id v8 = SBLogDashBoard();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D839D000, v8, OS_LOG_TYPE_DEFAULT, "[Quick Action] Firing dropped for restriction", buf, 2u);
    }

    [v4 setSelected:0];
  }
  else
  {
    objc_storeWeak((id *)&self->_lastFiredQuickActionsButton, v4);
    char v9 = [MEMORY[0x1E4F1C9C8] date];
    [v9 timeIntervalSinceDate:self->_timerStartTime];
    double v11 = v10;

    [(CSQuickActionsViewController *)self _actionTimeoutDuration];
    double v13 = v12;
    unint64_t v14 = vcvtmd_s64_f64(v11 * 10.0);
    int v15 = BSFloatGreaterThanOrEqualToFloat();
    int v16 = v15;
    BOOL buttonActionAllowedForTimer = self->_buttonActionAllowedForTimer;
    if (!self->_buttonActionAllowedForTimer && (v15 & 1) == 0)
    {
      uint64_t v18 = SBLogDashBoard();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        [(CSQuickActionsViewController *)v18 fireActionForButton:v11];
      }

      BOOL buttonActionAllowedForTimer = self->_buttonActionAllowedForTimer;
    }
    if (buttonActionAllowedForTimer) {
      int v19 = 0;
    }
    else {
      int v19 = v16;
    }
    uint64_t v20 = [v4 action];
    v21 = v20;
    if (v19 == 1)
    {
      if ([v20 supportsSelection]) {
        uint64_t v22 = [v4 isSelected] ^ 1;
      }
      else {
        uint64_t v22 = 0;
      }
      [v4 setSelected:v22];

      v29 = SBLogDashBoard();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        double v41 = v13;
        __int16 v42 = 2048;
        double v43 = v11;
        _os_log_impl(&dword_1D839D000, v29, OS_LOG_TYPE_DEFAULT, "[Quick Action] Action failed for timeout. Timeout: %f. Elapsed: %f", buf, 0x16u);
      }

      uint64_t v38 = *MEMORY[0x1E4FA74C8];
      v30 = [NSNumber numberWithInteger:v14];
      v39 = v30;
      v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      v32 = (void *)MEMORY[0x1E4FA5E78];
      id v33 = v31;
      __int16 v34 = [v32 sharedInstance];
      [v34 emitEvent:43 withPayload:v33];

      v35 = +[CSAction actionWithType:6];
      [(CSCoverSheetViewControllerBase *)self sendAction:v35];
    }
    else
    {
      [v20 fireAction];
      if (([v21 supportsSelection] & 1) == 0) {
        [v4 setSelected:0];
      }
      [(CSQuickActionsViewController *)self _resetIdleTimer];
      v23 = objc_msgSend(NSNumber, "numberWithInteger:", v14, *MEMORY[0x1E4FA74C8]);
      v37 = v23;
      uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      v25 = (void *)MEMORY[0x1E4FA5E78];
      id v26 = v24;
      v27 = [v25 sharedInstance];
      [v27 emitEvent:42 withPayload:v26];

      v28 = +[CSAction actionWithType:5];
      [(CSCoverSheetViewControllerBase *)self sendAction:v28];
    }
  }
}

- (void)touchEndedForButton:(id)a3
{
  id v4 = [a3 action];
  [v4 touchEnded];

  [(NSTimer *)self->_buttonTouchTimer invalidate];
  buttonTouchTimer = self->_buttonTouchTimer;
  self->_buttonTouchTimer = 0;

  self->_BOOL buttonActionAllowedForTimer = 0;
}

- (void)_resetIdleTimer
{
  id v4 = +[CSAction actionWithType:3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetViewController);
  [WeakRetained handleAction:v4 fromSender:self];
}

- (double)_actionTimeoutDuration
{
  int v2 = [(CSLockScreenSettings *)self->_prototypeSettings dashBoardQuickActionButtonSettings];
  [v2 maximumTouchDuration];
  double v4 = v3;

  return v4;
}

- (void)_tearDownFlashlightIfOff
{
  if (![(CSQuickActionsViewController *)self _isFlashlightOn])
  {
    [(CSQuickActionsViewController *)self _tearDownFlashlight];
  }
}

- (void)_tearDownFlashlight
{
  [(SBUIFlashlightController *)self->_flashlight coolDown];
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FA60F0] object:0];

  double v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4FA7A40] object:0];

  flashlight = self->_flashlight;
  self->_flashlight = 0;
}

- (id)_actions
{
  if ([(CSQuickActionsViewController *)self _shouldUseControlsInPlaceOfButtons])
  {
    double v3 = self->_validatedLeadingAction;
    double v4 = self->_validatedTrailingAction;
  }
  else
  {
    leadingAction = self->_leadingAction;
    uint64_t v6 = objc_opt_class();
    int v7 = leadingAction;
    if (v6)
    {
      if (objc_opt_isKindOfClass()) {
        id v8 = v7;
      }
      else {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = 0;
    }
    char v9 = v8;

    if (v9) {
      double v10 = self->_leadingAction;
    }
    else {
      double v10 = [(CSQuickActionsViewController *)self _newFlashlightAction];
    }
    double v3 = v10;

    double v4 = self->_cameraAction;
    double v11 = SBLogDashBoard();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v31[0] = 0;
      _os_log_impl(&dword_1D839D000, v11, OS_LOG_TYPE_DEFAULT, "[Quick Action] ignoring customization because LockPick has been disabled", (uint8_t *)v31, 2u);
    }
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v13 = v12;
  if (v3)
  {
    [v12 addObject:v3];
    if (v4)
    {
LABEL_16:
      [v13 addObject:v4];
      goto LABEL_23;
    }
  }
  else
  {
    unint64_t v14 = SBLogDashBoard();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      [(CSQuickActionsViewController *)v14 _actions];
    }

    if (v4) {
      goto LABEL_16;
    }
  }
  uint64_t v22 = SBLogDashBoard();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    [(CSQuickActionsViewController *)v22 _actions];
  }

LABEL_23:

  return v13;
}

- (BOOL)_isFlashlightOn
{
  return [(SBUIFlashlightController *)self->_flashlight level] != 0;
}

- (void)_deviceBlockStateDidChangeNotification:(id)a3
{
  if ([(CSQuickActionsViewController *)self _isFlashlightOn]
    && [(SBFLockOutStatusProvider *)self->_lockOutController isBlocked])
  {
    flashlight = self->_flashlight;
    [(SBUIFlashlightController *)flashlight turnFlashlightOffForReason:@"Lock Out Status Changed"];
  }
}

- (void)_featureLockStateDidChangeNotification:(id)a3
{
  double v4 = [a3 userInfo];
  double v5 = [v4 objectForKey:*MEMORY[0x1E4FA7B20]];
  int v6 = [v5 BOOLValue];

  if ([(CSQuickActionsViewController *)self _isFlashlightOn] && v6)
  {
    flashlight = self->_flashlight;
    [(SBUIFlashlightController *)flashlight turnFlashlightOffForReason:@"Lock Out Status Changed"];
  }
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__CSQuickActionsViewController_appProtectionSubjectsChanged_forSubscription___block_invoke;
  v7[3] = &unk_1E6AD88C0;
  id v8 = v5;
  char v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __77__CSQuickActionsViewController_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  double v3 = [*(id *)(a1 + 40) appProtectionSubjectMonitorSubscription];
  LODWORD(v2) = [v2 isEqual:v3];

  if (v2)
  {
    double v4 = *(void **)(a1 + 40);
    [v4 _validateActions];
  }
}

- (void)extensionsDidChangeForExtensionProvider:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__CSQuickActionsViewController_extensionsDidChangeForExtensionProvider___block_invoke;
  block[3] = &unk_1E6AD87F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __72__CSQuickActionsViewController_extensionsDidChangeForExtensionProvider___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _validateActions];
}

- (CSCoverSheetViewController)coverSheetViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetViewController);

  return (CSCoverSheetViewController *)WeakRetained;
}

- (void)setCoverSheetViewController:(id)a3
{
}

- (SBFLockOutStatusProvider)lockOutController
{
  return self->_lockOutController;
}

- (void)setLockOutController:(id)a3
{
}

- (CSCameraPrewarming)cameraPrewarmer
{
  return self->_cameraPrewarmer;
}

- (BOOL)suppressingVisibleChanges
{
  return self->_suppressingVisibleChanges;
}

- (void)setSuppressingVisibleChanges:(BOOL)a3
{
  self->_suppressingVisibleChanges = a3;
}

- (BOOL)captureExtensionsEnabled
{
  return self->_captureExtensionsEnabled;
}

- (CSQuickActionsConfiguration)quickActionsConfiguration
{
  return self->_quickActionsConfiguration;
}

- (BOOL)animatingToCamera
{
  return self->_animatingToCamera;
}

- (void)setAnimatingToCamera:(BOOL)a3
{
  self->_animatingToCamera = a3;
}

- (APSubjectMonitorSubscription)appProtectionSubjectMonitorSubscription
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appProtectionSubjectMonitorSubscription);

  return (APSubjectMonitorSubscription *)WeakRetained;
}

- (void)setAppProtectionSubjectMonitorSubscription:(id)a3
{
}

- (CHSControlHost)controlHost
{
  return self->_controlHost;
}

- (void)setControlHost:(id)a3
{
}

- (CSApplicationInforming)applicationInformer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationInformer);

  return (CSApplicationInforming *)WeakRetained;
}

- (void)setApplicationInformer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_applicationInformer);
  objc_storeStrong((id *)&self->_controlHost, 0);
  objc_destroyWeak((id *)&self->_appProtectionSubjectMonitorSubscription);
  objc_storeStrong((id *)&self->_quickActionsConfiguration, 0);
  objc_storeStrong((id *)&self->_cameraPrewarmer, 0);
  objc_storeStrong((id *)&self->_lockOutController, 0);
  objc_destroyWeak((id *)&self->_coverSheetViewController);
  objc_destroyWeak((id *)&self->_lastFiredQuickActionsButton);
  objc_storeStrong((id *)&self->_extensionProvider, 0);
  objc_storeStrong((id *)&self->_timerStartTime, 0);
  objc_storeStrong((id *)&self->_buttonTouchTimer, 0);
  objc_storeStrong((id *)&self->_validatedTrailingAction, 0);
  objc_storeStrong((id *)&self->_validatedLeadingAction, 0);
  objc_storeStrong((id *)&self->_trailingAction, 0);
  objc_storeStrong((id *)&self->_leadingAction, 0);
  objc_storeStrong((id *)&self->_trailingConfiguration, 0);
  objc_storeStrong((id *)&self->_leadingConfiguration, 0);
  objc_storeStrong((id *)&self->_cameraAction, 0);
  objc_storeStrong((id *)&self->_defaultsObserverToken, 0);
  objc_storeStrong((id *)&self->_lockScreenDefaults, 0);
  objc_storeStrong((id *)&self->_miscellaneousSettings, 0);
  objc_storeStrong((id *)&self->_prototypeSettings, 0);

  objc_storeStrong((id *)&self->_flashlight, 0);
}

- (void)_controlInstanceForSystemControl:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_validActionForAction:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D839D000, log, OS_LOG_TYPE_ERROR, "[Quick Action] keeping button for %{public}@ with nil control descriptor because found application with containerBundleIdentifier %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)fireActionForButton:(double)a3 .cold.1(os_log_t log, double a2, double a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  double v4 = a2;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_error_impl(&dword_1D839D000, log, OS_LOG_TYPE_ERROR, "[Quick Action] Timeout flag was incorrect! Timeout: %f. Elapsed: %f", (uint8_t *)&v3, 0x16u);
}

- (void)_actions
{
}

@end