@interface HMFitNoiseCheckContentViewController
+ (id)fitNoiseCheckTopTestingView;
- (BOOL)_forceNoiseCheckNudging;
- (BOOL)audioRouteActive;
- (BOOL)budsInEar;
- (BOOL)callActive;
- (BOOL)isDebugModeEnabled;
- (BOOL)isForcedIgnoreFitCheckResultFromBuds;
- (BOOL)ringtoneActive;
- (FitNoiseCheckDelegate)fitNoiseCheckDelegate;
- (HMFitNoiseCheckContentViewController)initWithDeviceAddress:(id)a3;
- (float)getTargetVolume;
- (id)bulletedListLinkButton;
- (id)getResultString:(unint64_t)a3;
- (id)getStepString:(unint64_t)a3;
- (unint64_t)categorizeFitCheckResultBud:(float)a3;
- (unint64_t)categorizeFitCheckResultWithLeftBud:(float)a3 rightBud:(float)a4;
- (void)analyzeResult;
- (void)audioRouteChangedHandler:(id)a3;
- (void)callCancelledHandler;
- (void)callCompletionHandlerWithStaus:(unint64_t)a3;
- (void)clearDebugView;
- (void)deviceDisconnectionHandler:(id)a3;
- (void)fitCheckStopped;
- (void)generateFitCheckResult;
- (void)generateNoiseCheckResult:(int64_t)a3;
- (void)inEarStatusChangedHandler:(id)a3;
- (void)interruptionHandler:(id)a3;
- (void)mainButtonTapped;
- (void)moveToStep:(unint64_t)a3;
- (void)resetVolume;
- (void)sealValueChangedHandler:(id)a3;
- (void)setFitNoiseCheckDelegate:(id)a3;
- (void)setupButtonTray;
- (void)setupConstraints;
- (void)setupContentView;
- (void)setupDebugView;
- (void)setupNotifications;
- (void)setupPlayer;
- (void)showAirpodsFitSuggestionsController;
- (void)showDebugResult;
- (void)showImproveDisclosure;
- (void)startFitCheck;
- (void)startNoiseCheck;
- (void)startNoiseCheckNudging;
- (void)startPreCheck;
- (void)startVolumeObserver;
- (void)stopFitNoiseCheck;
- (void)stopNoiseCheck;
- (void)stopVolumeObserver;
- (void)udpateFitCheckThresholds;
- (void)updateFitCheckResult:(id)a3;
- (void)updateForcedCheckResult;
- (void)updateHeaderButton:(id)a3;
- (void)updateUIForFitCheckReady;
- (void)updateUIForFitCheckRetry;
- (void)updateUIForFitCheckTutorial;
- (void)updateUIForNoiseCheckNudgingStart;
- (void)updateUIForNoiseCheckNudgingStop;
- (void)updateUIForOngoingFitCheck;
- (void)updateUIForOngoingNoiseCheck;
- (void)updateUIForResultFail;
- (void)updateUIForResultPass;
- (void)updateVolume;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HMFitNoiseCheckContentViewController

- (HMFitNoiseCheckContentViewController)initWithDeviceAddress:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"Checking fit and noise." value:&stru_27021F2D8 table:0];

  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"Do not remove AirPods." value:&stru_27021F2D8 table:0];

  v33.receiver = self;
  v33.super_class = (Class)HMFitNoiseCheckContentViewController;
  v10 = [(HMFitNoiseCheckContentViewController *)&v33 initWithTitle:v7 detailText:v9 icon:0 contentLayout:1];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_addressOrUUID, a3);
    uint64_t v12 = +[HearingAidUtils getBluetoothDeviceFromAddressOrUUID:v11->_addressOrUUID];
    device = v11->_device;
    v11->_device = (BluetoothDevice *)v12;

    v11->_currentStep = 0;
    v11->_fitCheckResultOverall = 0;
    v11->_fitCheckResultLeft = 0;
    v11->_fitCheckResultRight = 0;
    v11->_noiseCheckResult = 0;
    v11->_fitNoiseCheckResult = 0;
    [(HMFitNoiseCheckContentViewController *)v11 udpateFitCheckThresholds];
    v11->_fitCheckTimerOngoing = 0;
    id systemVolumeObserver = v11->_systemVolumeObserver;
    v11->_id systemVolumeObserver = 0;

    v15 = objc_alloc_init(_TtC13HearingModeUI19HMNoiseCheckService);
    noiseCheckService = v11->_noiseCheckService;
    v11->_noiseCheckService = v15;

    v11->_fitNoiseCheckOngoing = 0;
    v17 = [[_TtC13HearingModeUI22HMFitNoiseCheckTopView alloc] initWithService:v11->_noiseCheckService];
    fitNoiseCheckTopView = v11->_fitNoiseCheckTopView;
    v11->_fitNoiseCheckTopView = v17;

    v19 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__HMFitNoiseCheckContentViewController_initWithDeviceAddress___block_invoke;
    block[3] = &unk_265366118;
    v20 = v11;
    v32 = v20;
    dispatch_async(v19, block);

    [(HMFitNoiseCheckContentViewController *)v20 setupNotifications];
    v20->_debugMode = [(HMFitNoiseCheckContentViewController *)v20 isDebugModeEnabled];
    v20->_fitCheckFailureCount = 0;
    uint64_t v21 = [objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v20 action:sel_cancelFitNoiseCheck];
    cancelButton = v20->_cancelButton;
    v20->_cancelButton = (UIBarButtonItem *)v21;

    uint64_t v23 = [MEMORY[0x263F5B8B8] accessoryButton];
    headerAccessorybutton = v20->_headerAccessorybutton;
    v20->_headerAccessorybutton = (OBHeaderAccessoryButton *)v23;

    [(OBHeaderAccessoryButton *)v20->_headerAccessorybutton addTarget:v20 action:sel_showImproveDisclosure forControlEvents:64];
    v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v26 = [v25 localizedStringForKey:&stru_27021F2D8 value:&stru_27021F2D8 table:0];
    [(HMFitNoiseCheckContentViewController *)v20 updateHeaderButton:v26];

    v27 = [(HMFitNoiseCheckContentViewController *)v20 headerView];
    [v27 addAccessoryButton:v20->_headerAccessorybutton];

    v28 = (CXCallObserver *)objc_alloc_init(MEMORY[0x263EFC8E8]);
    callObserver = v20->_callObserver;
    v20->_callObserver = v28;
  }
  return v11;
}

uint64_t __62__HMFitNoiseCheckContentViewController_initWithDeviceAddress___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setupPlayer];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)HMFitNoiseCheckContentViewController;
  [(HMHearingTitle2BaseWelcomeController *)&v5 viewDidLoad];
  [(HMFitNoiseCheckContentViewController *)self setupContentView];
  [(HMFitNoiseCheckContentViewController *)self setupConstraints];
  [(HMFitNoiseCheckContentViewController *)self setupButtonTray];
  [(HMFitNoiseCheckContentViewController *)self setupDebugView];
  [(HMFitNoiseCheckContentViewController *)self moveToStep:0];
  cancelButton = self->_cancelButton;
  v4 = [(OBBaseWelcomeController *)self navigationItem];
  [v4 setRightBarButtonItem:cancelButton];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMFitNoiseCheckContentViewController;
  [(HMFitNoiseCheckContentViewController *)&v5 viewDidDisappear:a3];
  NSLog(&cfstr_FitNoiseCheckV.isa);
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  [(HMFitNoiseCheckContentViewController *)self fitCheckStopped];
  [(HMFitNoiseCheckContentViewController *)self stopNoiseCheck];
}

- (void)setupNotifications
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_audioRouteChangedHandler_ name:*MEMORY[0x263EF9248] object:0];

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_sealValueChangedHandler_ name:*MEMORY[0x263F2B8D8] object:0];

  objc_super v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel_inEarStatusChangedHandler_ name:*MEMORY[0x263F2B8D0] object:0];

  v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:self selector:sel_deviceDisconnectionHandler_ name:*MEMORY[0x263F2B910] object:0];

  v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel_interruptionHandler_ name:*MEMORY[0x263F83330] object:0];

  id v10 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v8 = *MEMORY[0x263EF90A0];
  v9 = [MEMORY[0x263EF93E0] sharedInstance];
  [v10 addObserver:self selector:sel_interruptionHandler_ name:v8 object:v9];
}

- (void)setupPlayer
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 pathForResource:@"E+D-US_ML" ofType:@"wav"];

  objc_super v5 = [NSURL fileURLWithPath:v4];
  v6 = [MEMORY[0x263EF93E0] sharedInstance];
  id v19 = 0;
  [v6 setActive:1 error:&v19];
  id v7 = v19;

  if (v7)
  {
    NSLog(&cfstr_FitNoiseCheckS.isa, v7);
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263EF93E0] sharedInstance];
    uint64_t v9 = *MEMORY[0x263EF9060];
    id v18 = 0;
    [v8 setCategory:v9 error:&v18];
    id v7 = v18;

    if (v7)
    {
      NSLog(&cfstr_FitNoiseCheckS_0.isa, v7);
    }
    else
    {
      id v10 = [MEMORY[0x263EF93E0] sharedInstance];
      uint64_t v11 = *MEMORY[0x263EF9138];
      id v17 = 0;
      [v10 setMode:v11 error:&v17];
      id v12 = v17;

      if (v12) {
        NSLog(&cfstr_FitNoiseCheckS_1.isa, v12);
      }
      id v16 = v12;
      v13 = (AVAudioPlayer *)[objc_alloc(MEMORY[0x263EF93B8]) initWithContentsOfURL:v5 error:&v16];
      id v7 = v16;

      player = self->_player;
      self->_player = v13;

      [(AVAudioPlayer *)self->_player setNumberOfLoops:0];
      [(AVAudioPlayer *)self->_player prepareToPlay];
      NSLog(&cfstr_FitNoiseCheckS_2.isa, v15);
    }
  }
}

- (void)setupContentView
{
  v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v4 = [(HMFitNoiseCheckContentViewController *)self contentView];
  [v4 setBackgroundColor:v3];

  id v5 = [(HMFitNoiseCheckContentViewController *)self contentView];
  [v5 addSubview:self->_fitNoiseCheckTopView];
}

- (void)setupConstraints
{
  v25[5] = *MEMORY[0x263EF8340];
  id v16 = (void *)MEMORY[0x263F08938];
  uint64_t v23 = [(HMFitNoiseCheckTopView *)self->_fitNoiseCheckTopView heightAnchor];
  v24 = [(HMFitNoiseCheckContentViewController *)self contentView];
  v22 = [v24 heightAnchor];
  uint64_t v21 = [v23 constraintLessThanOrEqualToAnchor:v22];
  v25[0] = v21;
  id v19 = [(HMFitNoiseCheckTopView *)self->_fitNoiseCheckTopView leadingAnchor];
  v20 = [(HMFitNoiseCheckContentViewController *)self contentView];
  id v18 = [v20 leadingAnchor];
  id v17 = [v19 constraintEqualToAnchor:v18];
  v25[1] = v17;
  v14 = [(HMFitNoiseCheckTopView *)self->_fitNoiseCheckTopView trailingAnchor];
  uint64_t v15 = [(HMFitNoiseCheckContentViewController *)self contentView];
  v13 = [v15 trailingAnchor];
  id v12 = [v14 constraintEqualToAnchor:v13];
  v25[2] = v12;
  uint64_t v11 = [(HMFitNoiseCheckTopView *)self->_fitNoiseCheckTopView centerXAnchor];
  v3 = [(HMFitNoiseCheckContentViewController *)self contentView];
  v4 = [v3 centerXAnchor];
  id v5 = [v11 constraintEqualToAnchor:v4];
  v25[3] = v5;
  v6 = [(HMFitNoiseCheckTopView *)self->_fitNoiseCheckTopView centerYAnchor];
  id v7 = [(HMFitNoiseCheckContentViewController *)self contentView];
  uint64_t v8 = [v7 centerYAnchor];
  uint64_t v9 = [v6 constraintEqualToAnchor:v8];
  v25[4] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:5];
  [v16 activateConstraints:v10];

  [(HMFitNoiseCheckTopView *)self->_fitNoiseCheckTopView layoutIfNeeded];
}

- (void)setupButtonTray
{
  v3 = [MEMORY[0x263F5B898] boldButton];
  mainButton = self->_mainButton;
  self->_mainButton = v3;

  id v5 = self->_mainButton;
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"Start" value:&stru_27021F2D8 table:0];
  [(OBTrayButton *)v5 setTitle:v7 forState:0];

  [(OBTrayButton *)self->_mainButton addTarget:self action:sel_mainButtonTapped forControlEvents:64];
  id v8 = [(HMFitNoiseCheckContentViewController *)self buttonTray];
  [v8 addButton:self->_mainButton];
}

- (void)mainButtonTapped
{
  v3 = [(HMFitNoiseCheckContentViewController *)self getStepString:self->_currentStep];
  NSLog(&cfstr_FitNoiseCheckM.isa, v3);

  switch(self->_currentStep)
  {
    case 0uLL:
      [(HMFitNoiseCheckContentViewController *)self updateForcedCheckResult];
      break;
    case 5uLL:
    case 6uLL:
    case 8uLL:
      [(HMFitNoiseCheckContentViewController *)self moveToStep:1];
      break;
    case 9uLL:
      v4 = self;
      uint64_t v5 = 1;
      goto LABEL_13;
    case 0xAuLL:
      v4 = self;
      uint64_t v5 = 0;
LABEL_13:
      [(HMFitNoiseCheckContentViewController *)v4 callCompletionHandlerWithStaus:v5];
      break;
    case 0xBuLL:
    case 0xCuLL:
      [(HMFitNoiseCheckContentViewController *)self callCancelledHandler];
      break;
    default:
      return;
  }
}

- (void)moveToStep:(unint64_t)a3
{
  uint64_t v5 = [(HMFitNoiseCheckContentViewController *)self getStepString:self->_currentStep];
  v6 = [(HMFitNoiseCheckContentViewController *)self getStepString:a3];
  NSLog(&cfstr_FitNoiseCheckM_0.isa, v5, v6);

  self->_currentStep = a3;
  switch(a3)
  {
    case 0uLL:
      [(HMFitNoiseCheckContentViewController *)self updateUIForFitCheckReady];
      break;
    case 1uLL:
      [(HMFitNoiseCheckContentViewController *)self updateUIForOngoingFitCheck];
      [(HMFitNoiseCheckContentViewController *)self startPreCheck];
      break;
    case 2uLL:
      [(HMFitNoiseCheckContentViewController *)self updateUIForOngoingFitCheck];
      [(HMFitNoiseCheckContentViewController *)self startFitCheck];
      break;
    case 3uLL:
      [(HMFitNoiseCheckContentViewController *)self updateUIForOngoingNoiseCheck];
      [(HMFitNoiseCheckContentViewController *)self startNoiseCheck];
      break;
    case 4uLL:
      [(HMFitNoiseCheckContentViewController *)self analyzeResult];
      break;
    case 5uLL:
      [(HMFitNoiseCheckContentViewController *)self updateUIForFitCheckRetry];
      break;
    case 6uLL:
      [(HMFitNoiseCheckContentViewController *)self updateUIForFitCheckTutorial];
      break;
    case 7uLL:
      [(HMFitNoiseCheckContentViewController *)self updateUIForNoiseCheckNudgingStart];
      [(HMFitNoiseCheckContentViewController *)self startNoiseCheckNudging];
      break;
    case 8uLL:
      [(HMFitNoiseCheckContentViewController *)self updateUIForNoiseCheckNudgingStop];
      break;
    case 9uLL:
      [(HMFitNoiseCheckContentViewController *)self updateUIForResultPass];
      break;
    case 0xAuLL:
      [(HMFitNoiseCheckContentViewController *)self updateUIForResultFail];
      break;
    default:
      return;
  }
}

- (void)updateUIForFitCheckReady
{
  NSLog(&cfstr_FitNoiseCheckU.isa, a2);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__HMFitNoiseCheckContentViewController_updateUIForFitCheckReady__block_invoke;
  block[3] = &unk_265366118;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __64__HMFitNoiseCheckContentViewController_updateUIForFitCheckReady__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1360) transitionToCheckReady];
  v2 = [*(id *)(a1 + 32) headerView];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"AirPods will check the fit in each ear and measure background noise." value:&stru_27021F2D8 table:0];
  [v2 setTitle:v4];

  uint64_t v5 = [*(id *)(a1 + 32) headerView];
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"Music will play during the check. This is not the hearing test." value:&stru_27021F2D8 table:0];
  [v5 setDetailText:v7];

  [*(id *)(*(void *)(a1 + 32) + 1208) hidesBusyIndicator];
  [*(id *)(*(void *)(a1 + 32) + 1208) setEnabled:1];
  [*(id *)(*(void *)(a1 + 32) + 1368) setAlpha:0.0];
  id v8 = *(void **)(*(void *)(a1 + 32) + 1208);
  uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"Start the Check" value:&stru_27021F2D8 table:0];
  [v8 setTitle:v10 forState:0];

  [*(id *)(a1 + 32) clearDebugView];
  id v13 = [*(id *)(a1 + 32) view];
  uint64_t v11 = [v13 window];
  id v12 = [v11 windowScene];
  [v12 _setSystemVolumeHUDEnabled:0];
}

- (void)updateUIForOngoingFitCheck
{
  NSLog(&cfstr_FitNoiseCheckU.isa, a2);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__HMFitNoiseCheckContentViewController_updateUIForOngoingFitCheck__block_invoke;
  block[3] = &unk_265366118;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __66__HMFitNoiseCheckContentViewController_updateUIForOngoingFitCheck__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) headerView];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"Checking fit and noise." value:&stru_27021F2D8 table:0];
  [v2 setTitle:v4];

  uint64_t v5 = [*(id *)(a1 + 32) headerView];
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"Do not remove AirPods." value:&stru_27021F2D8 table:0];
  [v5 setDetailText:v7];

  [*(id *)(*(void *)(a1 + 32) + 1208) showsBusyIndicator];
  id v8 = *(void **)(*(void *)(a1 + 32) + 1368);
  return [v8 setAlpha:0.0];
}

- (void)updateUIForOngoingNoiseCheck
{
  NSLog(&cfstr_FitNoiseCheckU_0.isa, a2);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__HMFitNoiseCheckContentViewController_updateUIForOngoingNoiseCheck__block_invoke;
  block[3] = &unk_265366118;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __68__HMFitNoiseCheckContentViewController_updateUIForOngoingNoiseCheck__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) headerView];
  v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v2 = [v1 localizedStringForKey:@"Checking fit and noise." value:&stru_27021F2D8 table:0];
  [v3 setTitle:v2];
}

- (void)updateUIForFitCheckRetry
{
  NSLog(&cfstr_FitNoiseCheckU_1.isa, a2);
  int64_t v3 = +[HMFitNoiseCheckTopView budStatusWithLeftBudGood:self->_fitCheckResultLeft == 1 rightBudGood:self->_fitCheckResultRight == 1];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __64__HMFitNoiseCheckContentViewController_updateUIForFitCheckRetry__block_invoke;
  v4[3] = &unk_265366168;
  v4[4] = self;
  v4[5] = v3;
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

void __64__HMFitNoiseCheckContentViewController_updateUIForFitCheckRetry__block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4 = *(void **)(v3 + 1360);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __64__HMFitNoiseCheckContentViewController_updateUIForFitCheckRetry__block_invoke_2;
  v14[3] = &unk_265366140;
  v14[4] = v3;
  [v4 transitionToFitCheckResultWithBudState:v2 actionStringBlock:v14];
  uint64_t v5 = [*(id *)(a1 + 32) headerView];
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"You can improve fit by adjusting the position of your AirPods or changing the ear tip size." value:&stru_27021F2D8 table:0];
  [v5 setDetailText:v7];

  [*(id *)(*(void *)(a1 + 32) + 1208) hidesBusyIndicator];
  [*(id *)(*(void *)(a1 + 32) + 1208) setEnabled:1];
  id v8 = *(void **)(*(void *)(a1 + 32) + 1208);
  uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"Check Fit and Noise Again" value:&stru_27021F2D8 table:0];
  [v8 setTitle:v10 forState:0];

  uint64_t v11 = *(void **)(a1 + 32);
  id v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v13 = [v12 localizedStringForKey:@"How to Change Ear Tips" value:&stru_27021F2D8 table:0];
  [v11 updateHeaderButton:v13];
}

void __64__HMFitNoiseCheckContentViewController_updateUIForFitCheckRetry__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v6 = [v2 headerView];
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:v3 value:&stru_27021F2D8 table:0];

  [v6 setTitle:v5];
}

- (void)updateUIForFitCheckTutorial
{
  NSLog(&cfstr_FitNoiseCheckU_2.isa, a2);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__HMFitNoiseCheckContentViewController_updateUIForFitCheckTutorial__block_invoke;
  block[3] = &unk_265366118;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __67__HMFitNoiseCheckContentViewController_updateUIForFitCheckTutorial__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1360) transitionToFitNudging];
  uint64_t v2 = [*(id *)(a1 + 32) headerView];
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"Change Your AirPod’s Ear Tips" value:&stru_27021F2D8 table:0];
  [v2 setTitle:v4];

  uint64_t v5 = [*(id *)(a1 + 32) headerView];
  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"Many people can improve the fit of their AirPods Pro by trying a larger ear tip." value:&stru_27021F2D8 table:0];
  [v5 setDetailText:v7];

  [*(id *)(*(void *)(a1 + 32) + 1208) hidesBusyIndicator];
  [*(id *)(*(void *)(a1 + 32) + 1208) setEnabled:1];
  id v8 = *(void **)(*(void *)(a1 + 32) + 1208);
  id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v9 = [v10 localizedStringForKey:@"Check Fit and Noise Again" value:&stru_27021F2D8 table:0];
  [v8 setTitle:v9 forState:0];
}

- (void)updateUIForNoiseCheckNudgingStart
{
  NSLog(&cfstr_FitNoiseCheckU_3.isa, a2);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__HMFitNoiseCheckContentViewController_updateUIForNoiseCheckNudgingStart__block_invoke;
  block[3] = &unk_265366118;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __73__HMFitNoiseCheckContentViewController_updateUIForNoiseCheckNudgingStart__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1360) transitionToNoiseNudging];
  uint64_t v2 = [*(id *)(a1 + 32) headerView];
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"Find a quiet place and check again." value:&stru_27021F2D8 table:0];
  [v2 setTitle:v4];

  uint64_t v5 = [*(id *)(a1 + 32) headerView];
  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"Too much background noise can cause inaccurate test results in your test. The hearing test will be paused if it gets too loud." value:&stru_27021F2D8 table:0];
  [v5 setDetailText:v7];

  [*(id *)(*(void *)(a1 + 32) + 1208) setEnabled:0];
  id v8 = *(void **)(*(void *)(a1 + 32) + 1208);
  uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"Check Fit and Noise Again" value:&stru_27021F2D8 table:0];
  [v8 setTitle:v10 forState:0];

  uint64_t v11 = *(void **)(a1 + 32);
  id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v12 = [v13 localizedStringForKey:@"Suggestions to Reduce Noise" value:&stru_27021F2D8 table:0];
  [v11 updateHeaderButton:v12];
}

- (void)updateUIForNoiseCheckNudgingStop
{
  NSLog(&cfstr_FitNoiseCheckU_3.isa, a2);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__HMFitNoiseCheckContentViewController_updateUIForNoiseCheckNudgingStop__block_invoke;
  block[3] = &unk_265366118;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __72__HMFitNoiseCheckContentViewController_updateUIForNoiseCheckNudgingStop__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) headerView];
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"Find a quiet place and check again." value:&stru_27021F2D8 table:0];
  [v2 setTitle:v4];

  uint64_t v5 = [*(id *)(a1 + 32) headerView];
  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"Too much background noise can cause inaccurate test results in your test. The hearing test will be paused if it gets too loud." value:&stru_27021F2D8 table:0];
  [v5 setDetailText:v7];

  [*(id *)(*(void *)(a1 + 32) + 1208) hidesBusyIndicator];
  [*(id *)(*(void *)(a1 + 32) + 1208) setEnabled:1];
  id v8 = *(void **)(*(void *)(a1 + 32) + 1208);
  uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"Check Fit and Noise Again" value:&stru_27021F2D8 table:0];
  [v8 setTitle:v10 forState:0];

  uint64_t v11 = *(void **)(a1 + 32);
  id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v12 = [v13 localizedStringForKey:@"Suggestions to Reduce Noise" value:&stru_27021F2D8 table:0];
  [v11 updateHeaderButton:v12];
}

- (void)updateUIForResultPass
{
  NSLog(&cfstr_FitNoiseCheckU_4.isa, a2);
  int64_t v3 = +[HMFitNoiseCheckTopView budStatusWithLeftBudGood:1 rightBudGood:1];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __61__HMFitNoiseCheckContentViewController_updateUIForResultPass__block_invoke;
  v4[3] = &unk_265366168;
  v4[4] = self;
  v4[5] = v3;
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

void __61__HMFitNoiseCheckContentViewController_updateUIForResultPass__block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4 = *(void **)(v3 + 1360);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__HMFitNoiseCheckContentViewController_updateUIForResultPass__block_invoke_2;
  v11[3] = &unk_265366140;
  v11[4] = v3;
  [v4 transitionToFitCheckResultWithBudState:v2 actionStringBlock:v11];
  uint64_t v5 = [*(id *)(a1 + 32) headerView];
  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"Don’t remove or adjust your AirPods until you finish the hearing test." value:&stru_27021F2D8 table:0];
  [v5 setDetailText:v7];

  [*(id *)(*(void *)(a1 + 32) + 1208) hidesBusyIndicator];
  [*(id *)(*(void *)(a1 + 32) + 1208) setEnabled:1];
  id v8 = *(void **)(*(void *)(a1 + 32) + 1208);
  uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"Next" value:&stru_27021F2D8 table:0];
  [v8 setTitle:v10 forState:0];
}

void __61__HMFitNoiseCheckContentViewController_updateUIForResultPass__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v6 = [v2 headerView];
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:v3 value:&stru_27021F2D8 table:0];

  [v6 setTitle:v5];
}

- (void)updateUIForResultFail
{
  NSLog(&cfstr_FitNoiseCheckU_5.isa, a2);
  int64_t v3 = +[HMFitNoiseCheckTopView budStatusWithLeftBudGood:self->_fitCheckResultLeft == 1 rightBudGood:self->_fitCheckResultRight == 1];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __61__HMFitNoiseCheckContentViewController_updateUIForResultFail__block_invoke;
  v4[3] = &unk_265366168;
  v4[4] = self;
  v4[5] = v3;
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

void __61__HMFitNoiseCheckContentViewController_updateUIForResultFail__block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4 = *(void **)(v3 + 1360);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__HMFitNoiseCheckContentViewController_updateUIForResultFail__block_invoke_2;
  v11[3] = &unk_265366140;
  v11[4] = v3;
  [v4 transitionToFitCheckResultWithBudState:v2 actionStringBlock:v11];
  uint64_t v5 = [*(id *)(a1 + 32) headerView];
  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"You may be able to make further adjustments to get a better fit." value:&stru_27021F2D8 table:0];
  [v5 setDetailText:v7];

  [*(id *)(*(void *)(a1 + 32) + 1208) hidesBusyIndicator];
  [*(id *)(*(void *)(a1 + 32) + 1208) setEnabled:1];
  [*(id *)(*(void *)(a1 + 32) + 1368) setAlpha:1.0];
  id v8 = *(void **)(*(void *)(a1 + 32) + 1208);
  uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"Check Fit and Noise Again" value:&stru_27021F2D8 table:0];
  [v8 setTitle:v10 forState:0];
}

void __61__HMFitNoiseCheckContentViewController_updateUIForResultFail__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v6 = [v2 headerView];
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:v3 value:&stru_27021F2D8 table:0];

  [v6 setTitle:v5];
}

- (BOOL)budsInEar
{
  uint64_t v7 = 0x300000003;
  [(BluetoothDevice *)self->_device inEarStatusPrimary:(char *)&v7 + 4 secondary:&v7];
  BOOL v2 = v7 == 0;
  id v3 = "YES";
  if (v7) {
    id v3 = "No";
  }
  if (HIDWORD(v7)) {
    v4 = "No";
  }
  else {
    v4 = "Yes";
  }
  if (v7) {
    uint64_t v5 = "No";
  }
  else {
    uint64_t v5 = "Yes";
  }
  NSLog(&cfstr_FitNoiseCheckI_0.isa, v3, v4, v5);
  return v2;
}

- (BOOL)callActive
{
  BOOL v2 = [MEMORY[0x263F544E0] sharedAVSystemController];
  id v3 = [v2 attributeForKey:*MEMORY[0x263F54340]];

  int v4 = [v3 BOOLValue];
  uint64_t v5 = "No";
  if (v4) {
    uint64_t v5 = "Yes";
  }
  NSLog(&cfstr_FitNoiseCheckC_0.isa, v5);

  return v4;
}

- (BOOL)ringtoneActive
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v2 = [(CXCallObserver *)self->_callObserver calls];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  int v4 = "No";
  if (v3)
  {
    uint64_t v5 = v3;
    int v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v2);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v9 hasConnected] & 1) == 0
          && ([v9 hasEnded] & 1) == 0
          && ([v9 isOnHold] & 1) == 0)
        {
          v6 |= [v9 isOutgoing] ^ 1;
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
    if (v6) {
      int v4 = "Yes";
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  NSLog(&cfstr_FitNoiseCheckR.isa, v4);

  return v6 & 1;
}

- (BOOL)audioRouteActive
{
  uint64_t v3 = [MEMORY[0x263EF93E0] sharedInstance];
  int v4 = [v3 currentRoute];
  uint64_t v5 = [v4 outputs];
  NSLog(&cfstr_CurrentAudioRo.isa, v5);

  int v6 = [(BluetoothDevice *)self->_device address];
  NSLog(&cfstr_CurrentAudioRo_0.isa, v6);

  uint64_t v7 = [MEMORY[0x263EF93E0] sharedInstance];
  id v8 = [v7 currentRoute];
  uint64_t v9 = [v8 outputs];

  if ([v9 count] == 1)
  {
    id v10 = [MEMORY[0x263EF93E0] sharedInstance];
    long long v11 = [v10 currentRoute];
    long long v12 = [v11 outputs];
    long long v13 = [v12 firstObject];
    long long v14 = [v13 UID];

    uint64_t v15 = [(BluetoothDevice *)self->_device address];
    int v16 = [v14 containsString:v15];

    if (v16) {
      id v17 = "YES";
    }
    else {
      id v17 = "NO";
    }
    id v18 = [(BluetoothDevice *)self->_device address];
    NSLog(&cfstr_CurrentAudioRo_2.isa, v17, v14, v18);
  }
  else
  {
    NSLog(&cfstr_CurrentAudioRo_1.isa, [v9 count]);
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (void)startPreCheck
{
  if (![(HMFitNoiseCheckContentViewController *)self budsInEar])
  {
    NSLog(&cfstr_FitNoiseCheckP_0.isa);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__HMFitNoiseCheckContentViewController_startPreCheck__block_invoke;
    block[3] = &unk_265366118;
    void block[4] = self;
    uint64_t v3 = MEMORY[0x263EF83A0];
    int v4 = block;
    goto LABEL_6;
  }
  if ([(HMFitNoiseCheckContentViewController *)self callActive]
    || [(HMFitNoiseCheckContentViewController *)self ringtoneActive])
  {
    NSLog(&cfstr_FitNoiseCheckP_1.isa);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __53__HMFitNoiseCheckContentViewController_startPreCheck__block_invoke_3;
    v6[3] = &unk_265366118;
    v6[4] = self;
    uint64_t v3 = MEMORY[0x263EF83A0];
    int v4 = v6;
LABEL_6:
    dispatch_async(v3, v4);
    return;
  }
  if (![(HMFitNoiseCheckContentViewController *)self audioRouteActive])
  {
    NSLog(&cfstr_CurrentAudioRo_3.isa);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __53__HMFitNoiseCheckContentViewController_startPreCheck__block_invoke_5;
    v5[3] = &unk_265366118;
    v5[4] = self;
    uint64_t v3 = MEMORY[0x263EF83A0];
    int v4 = v5;
    goto LABEL_6;
  }
  [(HMFitNoiseCheckContentViewController *)self moveToStep:2];
}

void __53__HMFitNoiseCheckContentViewController_startPreCheck__block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)MEMORY[0x263F82418];
  uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v4 = [v3 localizedStringForKey:@"Place AirPods Pro In Both Ears" value:&stru_27021F2D8 table:0];
  uint64_t v5 = [v2 alertControllerWithTitle:v4 message:&stru_27021F2D8 preferredStyle:1];

  int v6 = (void *)MEMORY[0x263F82400];
  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"OK" value:&stru_27021F2D8 table:0];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__HMFitNoiseCheckContentViewController_startPreCheck__block_invoke_2;
  v10[3] = &unk_265366190;
  v10[4] = *(void *)(a1 + 32);
  uint64_t v9 = [v6 actionWithTitle:v8 style:0 handler:v10];
  [v5 addAction:v9];

  [*(id *)(a1 + 32) presentViewController:v5 animated:1 completion:0];
}

uint64_t __53__HMFitNoiseCheckContentViewController_startPreCheck__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) moveToStep:0];
}

void __53__HMFitNoiseCheckContentViewController_startPreCheck__block_invoke_3(uint64_t a1)
{
  BOOL v2 = (void *)MEMORY[0x263F82418];
  uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v4 = [v3 localizedStringForKey:@"End Call To Continue Test" value:&stru_27021F2D8 table:0];
  uint64_t v5 = [v2 alertControllerWithTitle:v4 message:&stru_27021F2D8 preferredStyle:1];

  int v6 = (void *)MEMORY[0x263F82400];
  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"OK" value:&stru_27021F2D8 table:0];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__HMFitNoiseCheckContentViewController_startPreCheck__block_invoke_4;
  v10[3] = &unk_265366190;
  v10[4] = *(void *)(a1 + 32);
  uint64_t v9 = [v6 actionWithTitle:v8 style:0 handler:v10];
  [v5 addAction:v9];

  [*(id *)(a1 + 32) presentViewController:v5 animated:1 completion:0];
}

uint64_t __53__HMFitNoiseCheckContentViewController_startPreCheck__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) moveToStep:0];
}

void __53__HMFitNoiseCheckContentViewController_startPreCheck__block_invoke_5(uint64_t a1)
{
  BOOL v2 = (void *)MEMORY[0x263F82418];
  uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v4 = [v3 localizedStringForKey:@"Switch Audio Output to AirPods Pro to Continue" value:&stru_27021F2D8 table:0];
  uint64_t v5 = [v2 alertControllerWithTitle:v4 message:&stru_27021F2D8 preferredStyle:1];

  int v6 = (void *)MEMORY[0x263F82400];
  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"OK" value:&stru_27021F2D8 table:0];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__HMFitNoiseCheckContentViewController_startPreCheck__block_invoke_6;
  v10[3] = &unk_265366190;
  v10[4] = *(void *)(a1 + 32);
  uint64_t v9 = [v6 actionWithTitle:v8 style:0 handler:v10];
  [v5 addAction:v9];

  [*(id *)(a1 + 32) presentViewController:v5 animated:1 completion:0];
}

uint64_t __53__HMFitNoiseCheckContentViewController_startPreCheck__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) moveToStep:0];
}

- (void)startFitCheck
{
  NSLog(&cfstr_FitNoiseCheckS_3.isa, a2);
  self->_fitNoiseCheckOngoing = 1;
  fitCheckResultDict = self->_fitCheckResultDict;
  self->_fitCheckResultDict = 0;

  self->_fitCheckResultOverall = 0;
  self->_fitCheckResultLeft = 0;
  self->_fitCheckResultRight = 0;
  [(BluetoothDevice *)self->_device SendSetupCommand:1];
  ++self->_fitCheckTimerOngoing;
  dispatch_time_t v4 = dispatch_time(0, 7000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__HMFitNoiseCheckContentViewController_startFitCheck__block_invoke;
  block[3] = &unk_265366118;
  void block[4] = self;
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
  [(HMFitNoiseCheckTopView *)self->_fitNoiseCheckTopView transitionToFitCheck];
  [(HMFitNoiseCheckContentViewController *)self clearDebugView];
  [(HMFitNoiseCheckContentViewController *)self updateVolume];
  [(HMFitNoiseCheckContentViewController *)self startVolumeObserver];
  uint64_t v5 = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__HMFitNoiseCheckContentViewController_startFitCheck__block_invoke_2;
  v6[3] = &unk_265366118;
  v6[4] = self;
  dispatch_async(v5, v6);

  self->_fitCheckOngoing = 1;
}

void __53__HMFitNoiseCheckContentViewController_startFitCheck__block_invoke(uint64_t a1)
{
  v15[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 1240)) {
    uint64_t v3 = "YES";
  }
  else {
    uint64_t v3 = "NO";
  }
  NSLog(&cfstr_FitNoiseCheckF.isa, v3, *(unsigned int *)(v2 + 1300));
  --*(_DWORD *)(*(void *)(a1 + 32) + 1300);
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 1240))
  {
    if (!*(_DWORD *)(v4 + 1300))
    {
      NSLog(&cfstr_FitNoiseCheckF_0.isa);
      v14[0] = @"sealLeft";
      *(float *)&double v5 = *(float *)(*(void *)(a1 + 32) + 1292) + -1.0;
      int v6 = [NSNumber numberWithFloat:v5];
      v15[0] = v6;
      v14[1] = @"sealRight";
      *(float *)&double v7 = *(float *)(*(void *)(a1 + 32) + 1292) + -1.0;
      id v8 = [NSNumber numberWithFloat:v7];
      v15[1] = v8;
      v14[2] = @"confidenceLeft";
      *(float *)&double v9 = *(float *)(*(void *)(a1 + 32) + 1296) + -1.0;
      id v10 = [NSNumber numberWithFloat:v9];
      v15[2] = v10;
      v14[3] = @"confidenceRight";
      *(float *)&double v11 = *(float *)(*(void *)(a1 + 32) + 1296) + -1.0;
      long long v12 = [NSNumber numberWithFloat:v11];
      v15[3] = v12;
      long long v13 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];

      [*(id *)(a1 + 32) updateFitCheckResult:v13];
    }
  }
}

void *__53__HMFitNoiseCheckContentViewController_startFitCheck__block_invoke_2(uint64_t a1, double a2)
{
  result = *(void **)(*(void *)(a1 + 32) + 1232);
  if (result)
  {
    LODWORD(a2) = 1.0;
    [result setVolume:a2];
    [*(id *)(*(void *)(a1 + 32) + 1232) setCurrentTime:0.0];
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 1232);
    return (void *)[v4 play];
  }
  return result;
}

- (void)fitCheckStopped
{
  NSLog(&cfstr_FitNoiseCheckF_1.isa, a2);
  if (self->_fitCheckOngoing)
  {
    NSLog(&cfstr_FitNoiseCheckS_4.isa);
    [(BluetoothDevice *)self->_device SendSetupCommand:3];
  }
  self->_fitCheckOngoing = 0;
  uint64_t v3 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__HMFitNoiseCheckContentViewController_fitCheckStopped__block_invoke;
  block[3] = &unk_265366118;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __55__HMFitNoiseCheckContentViewController_fitCheckStopped__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1232) setVolume:0.0 fadeDuration:1.0];
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__HMFitNoiseCheckContentViewController_fitCheckStopped__block_invoke_2;
  block[3] = &unk_265366118;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x263EF83A0], block);
}

uint64_t __55__HMFitNoiseCheckContentViewController_fitCheckStopped__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) stopVolumeObserver];
  dispatch_time_t v2 = *(void **)(a1 + 32);
  return [v2 resetVolume];
}

- (unint64_t)categorizeFitCheckResultBud:(float)a3
{
  if (self->_fitCheckSealThresholdBad > a3) {
    return 3;
  }
  if (self->_fitCheckSealThresholdGood < a3) {
    return 1;
  }
  return 2;
}

- (unint64_t)categorizeFitCheckResultWithLeftBud:(float)a3 rightBud:(float)a4
{
  BOOL v4 = a4 == 1.0 && a3 == 1.0;
  unint64_t v5 = 1;
  if (!v4) {
    unint64_t v5 = 2;
  }
  if (a4 == 3.0 || a3 == 3.0) {
    return 3;
  }
  else {
    return v5;
  }
}

- (void)udpateFitCheckThresholds
{
  CFPreferencesAppSynchronize(@"com.apple.ConnectedAudio");
  Boolean keyExistsAndHasValidFormat = 0;
  float AppIntegerValue = (float)CFPreferencesGetAppIntegerValue(@"ForcedFitCheckSealThresholdGood", @"com.apple.ConnectedAudio", &keyExistsAndHasValidFormat);
  BOOL v4 = keyExistsAndHasValidFormat == 0;
  if (!keyExistsAndHasValidFormat) {
    float AppIntegerValue = 6.0;
  }
  self->_fitCheckSealThresholdGood = AppIntegerValue;
  if (v4) {
    unint64_t v5 = "Default";
  }
  else {
    unint64_t v5 = "Forced";
  }
  NSLog(&cfstr_FitNoiseCheckS_5.isa, v5, AppIntegerValue);
  float v6 = (float)CFPreferencesGetAppIntegerValue(@"ForcedFitCheckSealThresholdBad", @"com.apple.ConnectedAudio", &keyExistsAndHasValidFormat);
  BOOL v7 = keyExistsAndHasValidFormat == 0;
  if (!keyExistsAndHasValidFormat) {
    float v6 = -9.0;
  }
  self->_fitCheckSealThresholdBad = v6;
  if (v7) {
    id v8 = "Default";
  }
  else {
    id v8 = "Forced";
  }
  NSLog(&cfstr_FitNoiseCheckS_6.isa, v8, v6);
  float v9 = (float)CFPreferencesGetAppIntegerValue(@"ForcedFitCheckConfidenceThreshold", @"com.apple.ConnectedAudio", &keyExistsAndHasValidFormat);
  BOOL v10 = keyExistsAndHasValidFormat == 0;
  if (!keyExistsAndHasValidFormat) {
    float v9 = -3.0;
  }
  self->_fitCheckConfidenceThreshold = v9;
  if (v10) {
    double v11 = "Default";
  }
  else {
    double v11 = "Forced";
  }
  NSLog(&cfstr_FitNoiseCheckS_7.isa, v11, v9);
}

- (void)updateFitCheckResult:(id)a3
{
  objc_storeStrong((id *)&self->_fitCheckResultDict, a3);
  [(HMFitNoiseCheckContentViewController *)self fitCheckStopped];
  [(HMFitNoiseCheckContentViewController *)self generateFitCheckResult];
  [(HMFitNoiseCheckContentViewController *)self moveToStep:3];
}

- (void)generateFitCheckResult
{
  uint64_t v3 = [(NSDictionary *)self->_fitCheckResultDict objectForKeyedSubscript:@"sealLeft"];
  [v3 floatValue];
  float v5 = v4;

  float v6 = [(NSDictionary *)self->_fitCheckResultDict objectForKeyedSubscript:@"sealRight"];
  [v6 floatValue];
  float v8 = v7;

  float v9 = [(NSDictionary *)self->_fitCheckResultDict objectForKeyedSubscript:@"confidenceLeft"];
  [v9 floatValue];
  float v11 = v10;

  long long v12 = [(NSDictionary *)self->_fitCheckResultDict objectForKeyedSubscript:@"confidenceRight"];
  [v12 floatValue];
  float v14 = v13;

  NSLog(&cfstr_FitNoiseCheckF_2.isa, v5);
  NSLog(&cfstr_FitNoiseCheckF_3.isa, v8);
  NSLog(&cfstr_FitNoiseCheckF_4.isa, v11);
  NSLog(&cfstr_FitNoiseCheckF_5.isa, v14);
  *(float *)&double v15 = self->_fitCheckConfidenceThreshold;
  if (v11 < *(float *)&v15 || v14 < *(float *)&v15)
  {
    self->_fitCheckResultOverall = 3;
    v22 = [(HMFitNoiseCheckContentViewController *)self getResultString:3];
    NSLog(&cfstr_FitNoiseCheckF_6.isa, v22);
  }
  else
  {
    *(float *)&double v15 = v5;
    self->_fitCheckResultLeft = [(HMFitNoiseCheckContentViewController *)self categorizeFitCheckResultBud:v15];
    *(float *)&double v17 = v8;
    unint64_t v18 = [(HMFitNoiseCheckContentViewController *)self categorizeFitCheckResultBud:v17];
    self->_fitCheckResultRight = v18;
    *(float *)&double v19 = (float)self->_fitCheckResultLeft;
    *(float *)&double v20 = (float)v18;
    unint64_t v21 = [(HMFitNoiseCheckContentViewController *)self categorizeFitCheckResultWithLeftBud:v19 rightBud:v20];
    self->_fitCheckResultOverall = v21;
    v22 = [(HMFitNoiseCheckContentViewController *)self getResultString:v21];
    uint64_t v23 = [(HMFitNoiseCheckContentViewController *)self getResultString:self->_fitCheckResultLeft];
    v24 = [(HMFitNoiseCheckContentViewController *)self getResultString:self->_fitCheckResultRight];
    NSLog(&cfstr_FitNoiseCheckF_7.isa, v22, v23, v24);
  }
  unsigned int fitCheckFailureCount = self->_fitCheckFailureCount;
  if (self->_fitCheckResultOverall != 1) {
    ++fitCheckFailureCount;
  }
  self->_unsigned int fitCheckFailureCount = fitCheckFailureCount;
}

- (void)startVolumeObserver
{
  v17[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F544E0] sharedAVSystemController];
  float v4 = (uint64_t *)MEMORY[0x263F544A8];
  v17[0] = *MEMORY[0x263F544A8];
  float v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  uint64_t v6 = *MEMORY[0x263F544A0];
  id v16 = 0;
  [v3 setAttribute:v5 forKey:v6 error:&v16];
  id v7 = v16;

  if (v7)
  {
    float v8 = [v7 localizedDescription];
    NSLog(&cfstr_FitNoiseCheckC_1.isa, v8);
  }
  else
  {
    NSLog(&cfstr_FitNoiseCheckS_8.isa);
    objc_initWeak(&location, self);
    float v9 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v10 = *v4;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __59__HMFitNoiseCheckContentViewController_startVolumeObserver__block_invoke;
    v13[3] = &unk_2653661B8;
    objc_copyWeak(&v14, &location);
    float v11 = [v9 addObserverForName:v10 object:0 queue:0 usingBlock:v13];
    id systemVolumeObserver = self->_systemVolumeObserver;
    self->_id systemVolumeObserver = v11;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __59__HMFitNoiseCheckContentViewController_startVolumeObserver__block_invoke(uint64_t a1, void *a2)
{
  dispatch_time_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained getTargetVolume];
  float v6 = v5;

  id v7 = [v3 userInfo];

  id v12 = [v7 objectForKey:*MEMORY[0x263F54338]];

  [v12 floatValue];
  if (v8 != v6)
  {
    float v9 = [MEMORY[0x263F544E0] sharedAVSystemController];
    *(float *)&double v10 = v6;
    [v9 setActiveCategoryVolumeTo:v10];

    [v12 floatValue];
    NSLog(&cfstr_FitNoiseCheckV_0.isa, v11, v6);
  }
}

- (void)stopVolumeObserver
{
  NSLog(&cfstr_FitNoiseCheckS_9.isa, a2);
  if (self->_systemVolumeObserver)
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self->_systemVolumeObserver];

    id systemVolumeObserver = self->_systemVolumeObserver;
    self->_id systemVolumeObserver = 0;
  }
}

- (void)startNoiseCheck
{
  NSLog(&cfstr_FitNoiseCheckS_10.isa, a2);
  self->_noiseCheckOngoing = 1;
  noiseCheckService = self->_noiseCheckService;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__HMFitNoiseCheckContentViewController_startNoiseCheck__block_invoke;
  v4[3] = &unk_2653661E0;
  v4[4] = self;
  [(HMNoiseCheckService *)noiseCheckService runNoiseCheckWithCompletionHandler:v4];
}

void __55__HMFitNoiseCheckContentViewController_startNoiseCheck__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 1329)) {
    float v5 = "YES";
  }
  else {
    float v5 = "NO";
  }
  if (*(unsigned char *)(v4 + 1328)) {
    float v6 = "YES";
  }
  else {
    float v6 = "NO";
  }
  NSLog(&cfstr_FitNoiseCheckN.isa, v5, v6);
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v7 + 1329) && *(unsigned char *)(v7 + 1328))
  {
    *(unsigned char *)(v7 + 1328) = 0;
    [*(id *)(a1 + 32) generateNoiseCheckResult:a2];
    float v8 = *(void **)(a1 + 32);
    [v8 moveToStep:4];
  }
}

- (void)startNoiseCheckNudging
{
  NSLog(&cfstr_FitNoiseCheckS_11.isa, a2);
  if (!self->_fitNoiseCheckOngoing)
  {
    self->_fitNoiseCheckOngoing = 1;
    noiseCheckService = self->_noiseCheckService;
    fitNoiseCheckTopView = self->_fitNoiseCheckTopView;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __62__HMFitNoiseCheckContentViewController_startNoiseCheckNudging__block_invoke;
    v5[3] = &unk_265365FC0;
    v5[4] = self;
    [(HMNoiseCheckService *)noiseCheckService runNoiseCheckNudgingWithTopView:fitNoiseCheckTopView passAction:v5];
  }
}

void __62__HMFitNoiseCheckContentViewController_startNoiseCheckNudging__block_invoke(uint64_t a1, int a2)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 1329)) {
    uint64_t v4 = "YES";
  }
  else {
    uint64_t v4 = "NO";
  }
  NSLog(&cfstr_FitNoiseCheckN_0.isa, v4);
  if (*(unsigned char *)(*(void *)(a1 + 32) + 1329))
  {
    if (a2)
    {
      NSLog(&cfstr_FitNoiseCheckN_1.isa);
      float v5 = *(void **)(a1 + 32);
      [v5 moveToStep:8];
    }
    else
    {
      NSLog(&cfstr_FitNoiseCheckN_2.isa);
      float v6 = *(void **)(a1 + 32);
      [v6 updateUIForNoiseCheckNudgingStart];
    }
  }
}

- (void)stopNoiseCheck
{
  NSLog(&cfstr_FitNoiseCheckS_12.isa, a2);
  self->_noiseCheckOngoing = 0;
  noiseCheckService = self->_noiseCheckService;
  [(HMNoiseCheckService *)noiseCheckService stopNoiseCheck];
}

- (void)generateNoiseCheckResult:(int64_t)a3
{
  if ((unint64_t)a3 <= 3) {
    self->_noiseCheckResult = qword_2512C63E0[a3];
  }
}

- (void)stopFitNoiseCheck
{
  NSLog(&cfstr_FitNoiseCheckS_13.isa, a2);
  self->_fitNoiseCheckOngoing = 0;
  [(HMFitNoiseCheckContentViewController *)self fitCheckStopped];
  [(HMFitNoiseCheckContentViewController *)self stopNoiseCheck];
  [(HMFitNoiseCheckContentViewController *)self moveToStep:0];
}

- (void)analyzeResult
{
  if ([(HMFitNoiseCheckContentViewController *)self _forceNoiseCheckNudging]) {
    goto LABEL_5;
  }
  self->_fitNoiseCheckOngoing = 0;
  [(HMFitNoiseCheckContentViewController *)self showDebugResult];
  id v3 = [(HMFitNoiseCheckContentViewController *)self getResultString:self->_fitCheckResultOverall];
  uint64_t v4 = [(HMFitNoiseCheckContentViewController *)self getResultString:self->_noiseCheckResult];
  NSLog(&cfstr_FitNoiseCheckA.isa, v3, v4, self->_fitCheckFailureCount);

  if (self->_fitCheckResultOverall == 3)
  {
    float v5 = self;
    uint64_t v6 = 5;
    goto LABEL_6;
  }
  if (self->_noiseCheckResult == 3)
  {
LABEL_5:
    float v5 = self;
    uint64_t v6 = 7;
  }
  else
  {
    float v5 = self;
    uint64_t v6 = 9;
  }
LABEL_6:
  [(HMFitNoiseCheckContentViewController *)v5 moveToStep:v6];
}

- (void)updateVolume
{
  id v3 = [MEMORY[0x263F544E0] sharedAVSystemController];
  int v4 = [v3 getVolume:&self->_volumeBeforeFitCheck forCategory:@"Audio/Video"];

  if (v4)
  {
    NSLog(&cfstr_FitNoiseCheckU_6.isa, self->_volumeBeforeFitCheck);
    [(HMFitNoiseCheckContentViewController *)self getTargetVolume];
    float v6 = v5;
    uint64_t v7 = [MEMORY[0x263F544E0] sharedAVSystemController];
    *(float *)&double v8 = v6;
    int v9 = [v7 setVolumeTo:@"Audio/Video" forCategory:v8];

    if (v9)
    {
      NSLog(&cfstr_FitNoiseCheckU_7.isa, v6);
      self->_volumeChanged = 1;
    }
    else
    {
      NSLog(&cfstr_FitNoiseCheckU_8.isa, v6);
    }
  }
  else
  {
    NSLog(&cfstr_FitNoiseCheckU_9.isa);
  }
}

- (float)getTargetVolume
{
  CFPreferencesAppSynchronize(@"com.apple.ConnectedAudio");
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"ForcedFitCheckTargetVolume", @"com.apple.ConnectedAudio", &keyExistsAndHasValidFormat);
  float v3 = 0.5;
  if (keyExistsAndHasValidFormat) {
    BOOL v4 = AppIntegerValue < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4 && AppIntegerValue <= 100)
  {
    float v3 = (double)AppIntegerValue / 100.0;
    NSLog(&cfstr_FitNoiseCheckF_8.isa, v3);
  }
  return v3;
}

- (void)resetVolume
{
  if (self->_volumeChanged)
  {
    NSLog(&cfstr_FitNoiseCheckR_0.isa, a2, self->_volumeBeforeFitCheck);
    float v3 = [MEMORY[0x263F544E0] sharedAVSystemController];
    *(float *)&double v4 = self->_volumeBeforeFitCheck;
    [v3 setVolumeTo:@"Audio/Video" forCategory:v4];

    self->_volumeChanged = 0;
  }
}

- (void)callCompletionHandlerWithStaus:(unint64_t)a3
{
  float v5 = [(HMFitNoiseCheckContentViewController *)self fitNoiseCheckDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = "Failed";
    if (a3 == 1) {
      uint64_t v7 = "Passed";
    }
    NSLog(&cfstr_FitNoiseCheckC_2.isa, v7);
    id v8 = [(HMFitNoiseCheckContentViewController *)self fitNoiseCheckDelegate];
    [v8 fitNoiseCheckCompleted:self status:a3];
  }
  else
  {
    NSLog(&cfstr_FitNoiseCheckC_3.isa);
  }
}

- (void)callCancelledHandler
{
  float v3 = [(HMFitNoiseCheckContentViewController *)self fitNoiseCheckDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    NSLog(&cfstr_FitNoiseCheckC_4.isa);
    id v5 = [(HMFitNoiseCheckContentViewController *)self fitNoiseCheckDelegate];
    [v5 fitNoiseCheckCancelled:self];
  }
  else
  {
    NSLog(&cfstr_FitNoiseCheckC_5.isa);
  }
}

- (void)sealValueChangedHandler:(id)a3
{
  id v5 = a3;
  NSLog(&cfstr_FitNoiseCheckS_14.isa);
  if (self->_fitCheckOngoing)
  {
    if ([(HMFitNoiseCheckContentViewController *)self isForcedIgnoreFitCheckResultFromBuds])
    {
      NSLog(&cfstr_FitNoiseCheckF_9.isa);
    }
    else
    {
      char v4 = [v5 object];
      [(HMFitNoiseCheckContentViewController *)self updateFitCheckResult:v4];
    }
  }
  else
  {
    NSLog(&cfstr_FitNoiseCheckD.isa);
  }
}

- (void)audioRouteChangedHandler:(id)a3
{
  NSLog(&cfstr_CurrentAudioRo_4.isa, a2, a3);
  if (self->_fitNoiseCheckOngoing)
  {
    if (![(HMFitNoiseCheckContentViewController *)self audioRouteActive])
    {
      NSLog(&cfstr_CurrentAudioRo_6.isa);
      [(HMFitNoiseCheckContentViewController *)self stopFitNoiseCheck];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __65__HMFitNoiseCheckContentViewController_audioRouteChangedHandler___block_invoke;
      block[3] = &unk_265366118;
      void block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
  else
  {
    NSLog(&cfstr_CurrentAudioRo_5.isa);
  }
}

void __65__HMFitNoiseCheckContentViewController_audioRouteChangedHandler___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = (void *)MEMORY[0x263F82418];
  float v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  char v4 = [v3 localizedStringForKey:@"Switch Audio Output to AirPods Pro to Continue" value:&stru_27021F2D8 table:0];
  id v5 = [v2 alertControllerWithTitle:v4 message:&stru_27021F2D8 preferredStyle:1];

  char v6 = (void *)MEMORY[0x263F82400];
  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"OK" value:&stru_27021F2D8 table:0];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__HMFitNoiseCheckContentViewController_audioRouteChangedHandler___block_invoke_2;
  v10[3] = &unk_265366190;
  v10[4] = *(void *)(a1 + 32);
  int v9 = [v6 actionWithTitle:v8 style:0 handler:v10];
  [v5 addAction:v9];

  [*(id *)(a1 + 32) presentViewController:v5 animated:1 completion:0];
}

uint64_t __65__HMFitNoiseCheckContentViewController_audioRouteChangedHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) moveToStep:0];
}

- (void)inEarStatusChangedHandler:(id)a3
{
  char v4 = [a3 object];
  id v5 = [v4 objectForKeyedSubscript:@"primaryInEarStatus"];
  char v6 = [v4 objectForKeyedSubscript:@"secondaryInEarStatus"];
  uint64_t v7 = [v4 objectForKeyedSubscript:@"device"];
  id v8 = [v7 address];
  int v9 = [(BluetoothDevice *)self->_device address];

  if (v8 == v9)
  {
    int v10 = [v5 BOOLValue];
    int v11 = [v6 BOOLValue];
    int v12 = v10 | v11;
    LOBYTE(v10) = (v10 | v11) ^ 1;
    NSLog(&cfstr_FitNoiseCheckP_2.isa, v5, v6, v12 ^ 1u);
    if ((v10 & 1) == 0)
    {
      NSLog(&cfstr_FitNoiseCheckB.isa);
      [(HMFitNoiseCheckContentViewController *)self stopFitNoiseCheck];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __66__HMFitNoiseCheckContentViewController_inEarStatusChangedHandler___block_invoke;
      block[3] = &unk_265366118;
      void block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

void __66__HMFitNoiseCheckContentViewController_inEarStatusChangedHandler___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = (void *)MEMORY[0x263F82418];
  float v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  char v4 = [v3 localizedStringForKey:@"Place AirPods Pro In Both Ears" value:&stru_27021F2D8 table:0];
  id v5 = [v2 alertControllerWithTitle:v4 message:&stru_27021F2D8 preferredStyle:1];

  char v6 = (void *)MEMORY[0x263F82400];
  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"OK" value:&stru_27021F2D8 table:0];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__HMFitNoiseCheckContentViewController_inEarStatusChangedHandler___block_invoke_2;
  v10[3] = &unk_265366190;
  v10[4] = *(void *)(a1 + 32);
  int v9 = [v6 actionWithTitle:v8 style:0 handler:v10];
  [v5 addAction:v9];

  [*(id *)(a1 + 32) presentViewController:v5 animated:1 completion:0];
}

uint64_t __66__HMFitNoiseCheckContentViewController_inEarStatusChangedHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) moveToStep:0];
}

- (void)deviceDisconnectionHandler:(id)a3
{
  NSLog(&cfstr_FitNoiseCheckH.isa, a2, a3);
  [(HMFitNoiseCheckContentViewController *)self stopFitNoiseCheck];
  [(HMFitNoiseCheckContentViewController *)self callCompletionHandlerWithStaus:0];
}

- (void)interruptionHandler:(id)a3
{
  id v4 = [a3 object];
  NSLog(&cfstr_FitNoiseCheckH_0.isa, v4);
  [(HMFitNoiseCheckContentViewController *)self stopFitNoiseCheck];
}

- (id)getStepString:(unint64_t)a3
{
  if (a3 - 1 > 0xB) {
    return @"Ready";
  }
  else {
    return off_265366200[a3 - 1];
  }
}

- (id)getResultString:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"Unknown";
  }
  else {
    return off_265366260[a3 - 1];
  }
}

- (BOOL)isDebugModeEnabled
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(@"com.apple.ConnectedAudio");
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"FitNoiseCheckDebugMode", @"com.apple.ConnectedAudio", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (void)setupDebugView
{
  v25[4] = *MEMORY[0x263EF8340];
  if (self->_debugMode)
  {
    NSLog(&cfstr_FitNoiseCheckS_15.isa, a2);
    id v3 = objc_alloc(MEMORY[0x263F828E0]);
    id v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    resultDetailLabel = self->_resultDetailLabel;
    self->_resultDetailLabel = v4;

    [(UILabel *)self->_resultDetailLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)self->_resultDetailLabel setText:&stru_27021F2D8];
    char v6 = [MEMORY[0x263F825C8] systemBlackColor];
    [(UILabel *)self->_resultDetailLabel setTextColor:v6];

    [(UILabel *)self->_resultDetailLabel setTextAlignment:1];
    [(UILabel *)self->_resultDetailLabel setNumberOfLines:0];
    [(UILabel *)self->_resultDetailLabel setLineBreakMode:0];
    uint64_t v7 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    [(UILabel *)self->_resultDetailLabel setFont:v7];

    [(UILabel *)self->_resultDetailLabel setAlpha:1.0];
    id v8 = [(HMFitNoiseCheckContentViewController *)self headerView];
    [v8 addSubview:self->_resultDetailLabel];

    double v19 = (void *)MEMORY[0x263F08938];
    v24 = [(UILabel *)self->_resultDetailLabel heightAnchor];
    uint64_t v23 = [v24 constraintEqualToConstant:150.0];
    v25[0] = v23;
    unint64_t v21 = [(UILabel *)self->_resultDetailLabel leadingAnchor];
    v22 = [(HMFitNoiseCheckContentViewController *)self contentView];
    double v20 = [v22 leadingAnchor];
    int v9 = [v21 constraintEqualToAnchor:v20];
    v25[1] = v9;
    int v10 = [(UILabel *)self->_resultDetailLabel trailingAnchor];
    int v11 = [(HMFitNoiseCheckContentViewController *)self contentView];
    int v12 = [v11 trailingAnchor];
    float v13 = [v10 constraintEqualToAnchor:v12];
    v25[2] = v13;
    id v14 = [(UILabel *)self->_resultDetailLabel topAnchor];
    double v15 = [(HMFitNoiseCheckContentViewController *)self headerView];
    id v16 = [v15 bottomAnchor];
    double v17 = [v14 constraintEqualToAnchor:v16];
    v25[3] = v17;
    unint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:4];
    [v19 activateConstraints:v18];
  }
}

- (void)showDebugResult
{
  if (self->_debugMode)
  {
    NSLog(&cfstr_FitNoiseCheckS_16.isa, a2);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__HMFitNoiseCheckContentViewController_showDebugResult__block_invoke;
    block[3] = &unk_265366118;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __55__HMFitNoiseCheckContentViewController_showDebugResult__block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = [MEMORY[0x263F825C8] systemBlueColor];
  [*(id *)(*(void *)(a1 + 32) + 1352) setTextColor:v2];

  id v3 = NSString;
  id v4 = *(float **)(a1 + 32);
  double v24 = v4[306];
  [v4 getTargetVolume];
  double v6 = v5;
  id v25 = [*(id *)(*(void *)(a1 + 32) + 1248) objectForKeyedSubscript:@"sealLeft"];
  [v25 floatValue];
  double v8 = v7;
  int v9 = [*(id *)(*(void *)(a1 + 32) + 1248) objectForKeyedSubscript:@"confidenceLeft"];
  [v9 floatValue];
  double v11 = v10;
  int v12 = [*(id *)(*(void *)(a1 + 32) + 1248) objectForKeyedSubscript:@"sealRight"];
  [v12 floatValue];
  double v14 = v13;
  double v15 = [*(id *)(*(void *)(a1 + 32) + 1248) objectForKeyedSubscript:@"confidenceRight"];
  [v15 floatValue];
  double v17 = v16;
  uint64_t v18 = *(void *)(a1 + 32);
  double v19 = *(float *)(v18 + 1288);
  double v20 = *(float *)(v18 + 1292);
  double v21 = *(float *)(v18 + 1296);
  v22 = [(id)v18 getResultString:*(void *)(v18 + 1320)];
  uint64_t v23 = [v3 stringWithFormat:@"Fit Check:\nVolume Initial : %.2f Target: %.2f\nLeft Seal : %.2f  Confidence : %.2f\nRight Seal : %.2f  Confidence : %.2f\nThreshold Good: %.1f  Bad: %.1f  Conf: %.1f\nNoise Check: \n%@", *(void *)&v24, *(void *)&v6, *(void *)&v8, *(void *)&v11, *(void *)&v14, *(void *)&v17, *(void *)&v19, *(void *)&v20, *(void *)&v21, v22];
  [*(id *)(*(void *)(a1 + 32) + 1352) setText:v23];
}

- (void)clearDebugView
{
  if (self->_debugMode)
  {
    NSLog(&cfstr_FitNoiseCheckC_6.isa, a2);
    resultDetailLabel = self->_resultDetailLabel;
    [(UILabel *)resultDetailLabel setText:&stru_27021F2D8];
  }
}

- (BOOL)_forceNoiseCheckNudging
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(@"com.apple.ConnectedAudio");
  if (CFPreferencesGetAppBooleanValue(@"ForceNoiseCheckNudging", @"com.apple.ConnectedAudio", &keyExistsAndHasValidFormat))
  {
    BOOL v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    BOOL v2 = 1;
  }
  return !v2;
}

- (void)updateForcedCheckResult
{
  CFPreferencesAppSynchronize(@"com.apple.ConnectedAudio");
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"ForcedFitNoiseCheckPass", @"com.apple.ConnectedAudio", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    id v4 = "Pass";
    if (AppBooleanValue)
    {
      uint64_t v5 = 9;
    }
    else
    {
      id v4 = "Fail";
      uint64_t v5 = 10;
    }
    NSLog(&cfstr_FitNoiseCheckF_10.isa, v4);
  }
  else
  {
    NSLog(&cfstr_FitNoiseCheckN_3.isa);
    uint64_t v5 = 1;
  }
  [(HMFitNoiseCheckContentViewController *)self moveToStep:v5];
}

- (BOOL)isForcedIgnoreFitCheckResultFromBuds
{
  CFPreferencesAppSynchronize(@"com.apple.ConnectedAudio");
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"ForcedIgnoreFitCheckResultFromBuds", @"com.apple.ConnectedAudio", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (void)showImproveDisclosure
{
  unint64_t currentStep = self->_currentStep;
  if (currentStep - 7 >= 2)
  {
    if (currentStep == 5)
    {
      [(HMFitNoiseCheckContentViewController *)self showAirpodsFitSuggestionsController];
    }
    else
    {
      NSLog(&cfstr_Showimprovedis.isa, a2);
    }
  }
  else
  {
    [(OBWelcomeController *)self showAirpodsNoiseReductionController];
  }
}

- (void)updateHeaderButton:(id)a3
{
  [(OBHeaderAccessoryButton *)self->_headerAccessorybutton setTitle:a3 forState:0];
  unint64_t v4 = self->_currentStep - 5;
  double v5 = 0.0;
  if (v4 <= 3) {
    double v5 = dbl_2512C6400[v4];
  }
  headerAccessorybutton = self->_headerAccessorybutton;
  [(OBHeaderAccessoryButton *)headerAccessorybutton setAlpha:v5];
}

- (id)bulletedListLinkButton
{
  return (id)[MEMORY[0x263F5B8A8] linkButton];
}

+ (id)fitNoiseCheckTopTestingView
{
  BOOL v2 = [_TtC13HearingModeUI22HMFitNoiseCheckTopView alloc];
  BOOL v3 = objc_alloc_init(_TtC13HearingModeUI19HMNoiseCheckService);
  unint64_t v4 = [(HMFitNoiseCheckTopView *)v2 initWithService:v3];

  [(HMFitNoiseCheckTopView *)v4 testRun];
  return v4;
}

- (FitNoiseCheckDelegate)fitNoiseCheckDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fitNoiseCheckDelegate);
  return (FitNoiseCheckDelegate *)WeakRetained;
}

- (void)setFitNoiseCheckDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fitNoiseCheckDelegate);
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_storeStrong((id *)&self->_headerAccessorybutton, 0);
  objc_storeStrong((id *)&self->_fitNoiseCheckTopView, 0);
  objc_storeStrong((id *)&self->_resultDetailLabel, 0);
  objc_storeStrong((id *)&self->_noiseCheckService, 0);
  objc_storeStrong(&self->_systemVolumeObserver, 0);
  objc_storeStrong((id *)&self->_fitCheckResultDict, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_mainButton, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_addressOrUUID, 0);
}

- (void)showAirpodsFitSuggestionsController
{
  BOOL v2 = self;
  HMFitNoiseCheckContentViewController.showAirpodsFitSuggestionsController()();
}

@end