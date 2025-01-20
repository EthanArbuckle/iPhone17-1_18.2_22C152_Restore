@interface BTSpatialTutorialViewController
- (BTSDevice)currentDevice;
- (BTSpatialTutorialViewController)initWithDevice:(id)a3;
- (void)checkStatusAndPlay;
- (void)deviceDisconnectedHandler:(id)a3;
- (void)dismissWelcomeController;
- (void)handleAudioSessionInterruption:(id)a3;
- (void)handleMediaServerConnectionDied:(id)a3;
- (void)inEarStatusChangedHandler:(id)a3;
- (void)initCommon;
- (void)powerChangedHandler:(id)a3;
- (void)segmentControlValueChanged:(id)a3;
- (void)setCurrentDevice:(id)a3;
- (void)setupConstraints;
- (void)setupStackView;
- (void)setupWelcomeController;
- (void)showAlert;
- (void)startPlayingContent;
- (void)stopPlayingContent;
- (void)updateInEarState;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation BTSpatialTutorialViewController

- (BTSpatialTutorialViewController)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BTSpatialTutorialViewController;
  v6 = [(BTSpatialTutorialViewController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_currentDevice, a3);
    [(BTSpatialTutorialViewController *)v7 initCommon];
  }

  return v7;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)BTSpatialTutorialViewController;
  [(BTSpatialTutorialViewController *)&v3 loadView];
  [(BTSpatialTutorialViewController *)self setupWelcomeController];
}

- (void)viewDidAppear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)BTSpatialTutorialViewController;
  [(BTSpatialTutorialViewController *)&v16 viewDidAppear:1];
  v4 = [MEMORY[0x1E4F31A10] sharedCommandCenter];
  id v5 = [v4 playCommand];
  [v5 setEnabled:1];

  v6 = [MEMORY[0x1E4F31A10] sharedCommandCenter];
  v7 = [v6 playCommand];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __49__BTSpatialTutorialViewController_viewDidAppear___block_invoke;
  v15[3] = &unk_1E6EA8E80;
  v15[4] = self;
  id v8 = (id)[v7 addTargetWithHandler:v15];

  objc_super v9 = [MEMORY[0x1E4F31A10] sharedCommandCenter];
  v10 = [v9 pauseCommand];
  [v10 setEnabled:1];

  v11 = [MEMORY[0x1E4F31A10] sharedCommandCenter];
  v12 = [v11 pauseCommand];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__BTSpatialTutorialViewController_viewDidAppear___block_invoke_2;
  v14[3] = &unk_1E6EA8E80;
  v14[4] = self;
  id v13 = (id)[v12 addTargetWithHandler:v14];

  if (!self->_mediaSessionStarted)
  {
    [(RMMediaSession *)self->_mediaSession _start];
    self->_mediaSessionStarted = 1;
  }
  [(BTSpatialTutorialViewController *)self checkStatusAndPlay];
}

uint64_t __49__BTSpatialTutorialViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return 0;
}

uint64_t __49__BTSpatialTutorialViewController_viewDidAppear___block_invoke_2(uint64_t a1)
{
  return 0;
}

- (void)viewDidDisappear:(BOOL)a3
{
  [(BTSpatialTutorialViewController *)self stopPlayingContent];
  [(RMMediaSession *)self->_mediaSession _stop];
  self->_mediaSessionStarted = 0;
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4F50AD0] object:0];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x1E4F50B18] object:0];

  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x1E4FB2628] object:0];

  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:self name:*MEMORY[0x1E4FB2640] object:0];

  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v9 = *MEMORY[0x1E4F15000];
  v10 = [MEMORY[0x1E4F153E0] sharedInstance];
  [v8 removeObserver:self name:v9 object:v10];

  v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v12 = *MEMORY[0x1E4F74E30];
  id v13 = [MEMORY[0x1E4F153E0] sharedInstance];
  [v11 removeObserver:self name:v12 object:v13];

  v14 = [MEMORY[0x1E4F31A10] sharedCommandCenter];
  v15 = [v14 playCommand];
  [v15 removeTarget:0];

  id v17 = [MEMORY[0x1E4F31A10] sharedCommandCenter];
  objc_super v16 = [v17 pauseCommand];
  [v16 removeTarget:0];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)BTSpatialTutorialViewController;
  [(BTSpatialTutorialViewController *)&v3 viewWillLayoutSubviews];
  [(BTSpatialTutorialViewController *)self setupConstraints];
}

- (void)initCommon
{
  objc_super v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [(id)MGGetStringAnswer() uppercaseString];
  id v5 = [@"SPATIAL_AUDIO_DETAIL_" stringByAppendingString:v4];
  v6 = [v3 localizedStringForKey:v5 value:&stru_1F4097960 table:@"DeviceConfig"];

  id v7 = objc_alloc(MEMORY[0x1E4F83AF8]);
  id v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v9 = [v8 localizedStringForKey:@"SPATIAL_AUDIO" value:&stru_1F4097960 table:@"DeviceConfig"];
  v10 = (OBWelcomeController *)[v7 initWithTitle:v9 detailText:v6 icon:0 contentLayout:2];
  welcomeController = self->_welcomeController;
  self->_welcomeController = v10;

  uint64_t v12 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
  stackView = self->_stackView;
  self->_stackView = v12;

  id v14 = objc_alloc(MEMORY[0x1E4FB1C10]);
  v15 = (void *)MEMORY[0x1E4F1C978];
  objc_super v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v17 = [v16 localizedStringForKey:@"SPATIAL_TUTORIAL_STEREO_OPTION" value:&stru_1F4097960 table:@"DeviceConfig"];
  v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v19 = [v18 localizedStringForKey:@"SPATIAL_TUTORIAL_SPATIAL_OPTION" value:&stru_1F4097960 table:@"DeviceConfig"];
  v20 = objc_msgSend(v15, "arrayWithObjects:", v17, v19, 0);
  v21 = (UISegmentedControl *)[v14 initWithItems:v20];
  segmentedControl = self->_segmentedControl;
  self->_segmentedControl = v21;

  v23 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  spacerView = self->_spacerView;
  self->_spacerView = v23;

  v25 = (VPSpatialTutorialContentView *)[objc_alloc(MEMORY[0x1E4FB4128]) initWithMode:0];
  spatialTutorialContentView = self->_spatialTutorialContentView;
  self->_spatialTutorialContentView = v25;

  v27 = [(BTSDevice *)self->_currentDevice classicDevice];
  uint64_t v28 = [v27 productId];

  v29 = +[HPSProductUtils getProductSpecificString:v28 descriptionKey:@"SPATIAL_TUTORIAL_OUT_OF_EAR_WARNING"];
  v30 = [(BTSDevice *)self->_currentDevice classicDevice];
  LODWORD(v17) = [v30 getAACPCapabilityBit:32];

  if (v17)
  {
    uint64_t v31 = +[HPSProductUtils getProductSpecificString:v28 descriptionKey:@"SPATIAL_TUTORIAL_NOT_ON_HEAD_WARNING"];

    v29 = (void *)v31;
  }
  v32 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v29 message:&stru_1F4097960 preferredStyle:1];
  alert = self->_alert;
  self->_alert = v32;

  v34 = self->_alert;
  v35 = (void *)MEMORY[0x1E4FB1410];
  v36 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v37 = [v36 localizedStringForKey:@"OK" value:&stru_1F4097960 table:@"DeviceConfig"];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __45__BTSpatialTutorialViewController_initCommon__block_invoke;
  v53[3] = &unk_1E6EA83E0;
  v53[4] = self;
  v38 = [v35 actionWithTitle:v37 style:0 handler:v53];
  [(UIAlertController *)v34 addAction:v38];

  v39 = (NSMutableArray *)objc_opt_new();
  constraints = self->_constraints;
  self->_constraints = v39;

  v41 = (RMMediaSession *)objc_opt_new();
  mediaSession = self->_mediaSession;
  self->_mediaSession = v41;

  self->_mediaSessionStarted = 0;
  v43 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v43 addObserver:self selector:sel_inEarStatusChangedHandler_ name:*MEMORY[0x1E4F50AD0] object:0];

  v44 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v44 addObserver:self selector:sel_deviceDisconnectedHandler_ name:*MEMORY[0x1E4F50B18] object:0];

  v45 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v45 addObserver:self selector:sel_applicationDidBecomeActive_ name:*MEMORY[0x1E4FB2628] object:0];

  v46 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v46 addObserver:self selector:sel_applicationDidEnterBackground_ name:*MEMORY[0x1E4FB2640] object:0];

  v47 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v48 = *MEMORY[0x1E4F15000];
  v49 = [MEMORY[0x1E4F153E0] sharedInstance];
  [v47 addObserver:self selector:sel_handleAudioSessionInterruption_ name:v48 object:v49];

  v50 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v51 = *MEMORY[0x1E4F74E30];
  v52 = [MEMORY[0x1E4F153E0] sharedInstance];
  [v50 addObserver:self selector:sel_handleMediaServerConnectionDied_ name:v51 object:v52];
}

uint64_t __45__BTSpatialTutorialViewController_initCommon__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissWelcomeController];
}

- (void)setupWelcomeController
{
  objc_super v3 = [(BTSpatialTutorialViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(OBWelcomeController *)self->_welcomeController view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  id v13 = [(OBWelcomeController *)self->_welcomeController view];
  [v13 setAutoresizingMask:18];

  [(BTSpatialTutorialViewController *)self setupStackView];
  id v19 = [MEMORY[0x1E4F83A80] boldButton];
  id v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:@"SPATIAL_TUTORIAL_BUTTON_DONE" value:&stru_1F4097960 table:@"DeviceConfig"];
  [v19 setTitle:v15 forState:0];

  [v19 addTarget:self action:sel_quitSpatialTutorial_ forControlEvents:64];
  objc_super v16 = [(OBWelcomeController *)self->_welcomeController buttonTray];
  [v16 addButton:v19];

  [(BTSpatialTutorialViewController *)self addChildViewController:self->_welcomeController];
  id v17 = [(BTSpatialTutorialViewController *)self view];
  v18 = [(OBWelcomeController *)self->_welcomeController view];
  [v17 addSubview:v18];
}

- (void)setupStackView
{
  [(UIStackView *)self->_stackView setAxis:1];
  [(UIStackView *)self->_stackView setAlignment:3];
  [(UIStackView *)self->_stackView setDistribution:3];
  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UISegmentedControl *)self->_segmentedControl setSelectedSegmentIndex:0];
  [(UISegmentedControl *)self->_segmentedControl addTarget:self action:sel_segmentControlValueChanged_ forControlEvents:4096];
  [(UISegmentedControl *)self->_segmentedControl setTranslatesAutoresizingMaskIntoConstraints:0];
  [(VPSpatialTutorialContentView *)self->_spatialTutorialContentView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_stackView addArrangedSubview:self->_segmentedControl];
  [(UIStackView *)self->_stackView addArrangedSubview:self->_spacerView];
  [(UIStackView *)self->_stackView addArrangedSubview:self->_spatialTutorialContentView];
  id v3 = [(OBWelcomeController *)self->_welcomeController contentView];
  [v3 addSubview:self->_stackView];
}

- (void)setupConstraints
{
  if ([(NSMutableArray *)self->_constraints count])
  {
    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_constraints];
    [(NSMutableArray *)self->_constraints removeAllObjects];
  }
  constraints = self->_constraints;
  double v4 = [(UISegmentedControl *)self->_segmentedControl leadingAnchor];
  double v5 = [(OBWelcomeController *)self->_welcomeController headerView];
  double v6 = [v5 leadingAnchor];
  double v7 = [v4 constraintEqualToAnchor:v6];
  [(NSMutableArray *)constraints addObject:v7];

  double v8 = self->_constraints;
  double v9 = [(UISegmentedControl *)self->_segmentedControl trailingAnchor];
  double v10 = [(OBWelcomeController *)self->_welcomeController headerView];
  double v11 = [v10 trailingAnchor];
  uint64_t v12 = [v9 constraintEqualToAnchor:v11];
  [(NSMutableArray *)v8 addObject:v12];

  id v13 = self->_constraints;
  id v14 = [(UIView *)self->_spacerView heightAnchor];
  v15 = [(UISegmentedControl *)self->_segmentedControl heightAnchor];
  objc_super v16 = [v14 constraintEqualToAnchor:v15];
  [(NSMutableArray *)v13 addObject:v16];

  id v17 = [(OBWelcomeController *)self->_welcomeController headerView];
  [v17 bounds];
  double v18 = 400.0;
  if (v19 <= 400.0)
  {
    v20 = [(OBWelcomeController *)self->_welcomeController headerView];
    [v20 bounds];
    float v22 = v21;
    double v18 = v22;
  }
  v23 = self->_constraints;
  v24 = [(VPSpatialTutorialContentView *)self->_spatialTutorialContentView widthAnchor];
  v25 = [v24 constraintEqualToConstant:v18];
  [(NSMutableArray *)v23 addObject:v25];

  v26 = self->_constraints;
  v27 = [(VPSpatialTutorialContentView *)self->_spatialTutorialContentView heightAnchor];
  uint64_t v28 = [v27 constraintEqualToConstant:v18];
  [(NSMutableArray *)v26 addObject:v28];

  v29 = self->_constraints;
  v30 = [(UIStackView *)self->_stackView topAnchor];
  uint64_t v31 = [(OBWelcomeController *)self->_welcomeController contentView];
  v32 = [v31 topAnchor];
  v33 = [v30 constraintEqualToAnchor:v32];
  [(NSMutableArray *)v29 addObject:v33];

  v34 = self->_constraints;
  v35 = [(UIStackView *)self->_stackView bottomAnchor];
  v36 = [(OBWelcomeController *)self->_welcomeController contentView];
  v37 = [v36 bottomAnchor];
  v38 = [v35 constraintEqualToAnchor:v37];
  [(NSMutableArray *)v34 addObject:v38];

  v39 = self->_constraints;
  v40 = [(UIStackView *)self->_stackView leadingAnchor];
  v41 = [(OBWelcomeController *)self->_welcomeController contentView];
  v42 = [v41 leadingAnchor];
  v43 = [v40 constraintEqualToAnchor:v42];
  [(NSMutableArray *)v39 addObject:v43];

  v44 = self->_constraints;
  v45 = [(UIStackView *)self->_stackView trailingAnchor];
  v46 = [(OBWelcomeController *)self->_welcomeController contentView];
  v47 = [v46 trailingAnchor];
  uint64_t v48 = [v45 constraintEqualToAnchor:v47];
  [(NSMutableArray *)v44 addObject:v48];

  v49 = (void *)MEMORY[0x1E4F28DC8];
  v50 = self->_constraints;

  [v49 activateConstraints:v50];
}

- (void)startPlayingContent
{
}

- (void)stopPlayingContent
{
}

- (void)checkStatusAndPlay
{
  [(BTSpatialTutorialViewController *)self updateInEarState];
  if (self->_budsInEar)
  {
    if (self->_alertShowing)
    {
      alert = self->_alert;
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __53__BTSpatialTutorialViewController_checkStatusAndPlay__block_invoke;
      v4[3] = &unk_1E6EA82F0;
      v4[4] = self;
      [(UIAlertController *)alert dismissViewControllerAnimated:1 completion:v4];
    }
    else
    {
      [(BTSpatialTutorialViewController *)self startPlayingContent];
    }
  }
  else if (!self->_alertShowing)
  {
    [(BTSpatialTutorialViewController *)self showAlert];
  }
}

uint64_t __53__BTSpatialTutorialViewController_checkStatusAndPlay__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1042) = 0;
  return [*(id *)(a1 + 32) startPlayingContent];
}

- (void)dismissWelcomeController
{
  [(BTSpatialTutorialViewController *)self stopPlayingContent];
  if (self->_alertShowing)
  {
    alert = self->_alert;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __59__BTSpatialTutorialViewController_dismissWelcomeController__block_invoke;
    v4[3] = &unk_1E6EA82F0;
    v4[4] = self;
    [(UIAlertController *)alert dismissViewControllerAnimated:1 completion:v4];
  }
  else
  {
    [(BTSpatialTutorialViewController *)self dismissViewControllerAnimated:1 completion:&__block_literal_global_73];
  }
}

uint64_t __59__BTSpatialTutorialViewController_dismissWelcomeController__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:&__block_literal_global_10];
}

- (void)updateInEarState
{
  uint64_t v7 = 0x300000003;
  id v3 = [(BTSpatialTutorialViewController *)self currentDevice];
  double v4 = [v3 classicDevice];
  [v4 inEarStatusPrimary:(char *)&v7 + 4 secondary:&v7];

  self->_budsInEar = v7 == 0;
  double v5 = [(BTSDevice *)self->_currentDevice classicDevice];
  if ([v5 productId] == 8215)
  {
    self->_budsInEar = 1;
  }
  else
  {
    double v6 = [(BTSDevice *)self->_currentDevice classicDevice];
    self->_budsInEar |= [v6 productId] == 8229;
  }
}

- (void)showAlert
{
  self->_alertShowing = 1;
}

- (void)segmentControlValueChanged:(id)a3
{
  NSInteger v4 = [(UISegmentedControl *)self->_segmentedControl selectedSegmentIndex];
  if (v4)
  {
    if (v4 != 1) {
      return;
    }
    [(RMMediaSession *)self->_mediaSession _resetTrackingForAllClients];
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 0;
  }
  spatialTutorialContentView = self->_spatialTutorialContentView;

  [(VPSpatialTutorialContentView *)spatialTutorialContentView setMode:v5];
}

- (void)deviceDisconnectedHandler:(id)a3
{
  id v7 = [a3 object];
  NSInteger v4 = [v7 address];
  uint64_t v5 = [(BTSpatialTutorialViewController *)self currentDevice];
  double v6 = [v5 identifier];

  if (v4 == v6) {
    [(BTSpatialTutorialViewController *)self dismissWelcomeController];
  }
}

- (void)powerChangedHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F50B70] sharedInstance];
  int v6 = [v5 enabled];

  id v7 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v4 name];
    double v9 = (void *)v8;
    double v10 = "off";
    if (v6) {
      double v10 = "on";
    }
    int v11 = 138412546;
    uint64_t v12 = v8;
    __int16 v13 = 2080;
    id v14 = v10;
    _os_log_impl(&dword_1E4BFE000, v7, OS_LOG_TYPE_DEFAULT, "Received %@ with power state %s", (uint8_t *)&v11, 0x16u);
  }
  [(BTSpatialTutorialViewController *)self dismissWelcomeController];
}

- (void)handleAudioSessionInterruption:(id)a3
{
  id v6 = [a3 userInfo];
  id v4 = [v6 objectForKey:*MEMORY[0x1E4F15020]];
  uint64_t v5 = [v4 unsignedIntegerValue];

  if (v5 == 1) {
    [(BTSpatialTutorialViewController *)self dismissWelcomeController];
  }
}

- (void)handleMediaServerConnectionDied:(id)a3
{
  id v4 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "Audio session server connection died", v5, 2u);
  }

  [(BTSpatialTutorialViewController *)self dismissWelcomeController];
}

- (void)inEarStatusChangedHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 object];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"device"];
  id v6 = [v5 address];
  id v7 = [(BTSpatialTutorialViewController *)self currentDevice];
  uint64_t v8 = [v7 identifier];

  if (v6 == v8)
  {
    double v9 = [v4 objectForKeyedSubscript:@"primaryInEarStatus"];
    double v10 = [v4 objectForKeyedSubscript:@"secondaryInEarStatus"];
    int v11 = [v9 BOOLValue];
    int v12 = v11 | [v10 BOOLValue];
    __int16 v13 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      double v19 = v9;
      __int16 v20 = 2112;
      double v21 = v10;
      __int16 v22 = 1024;
      int v23 = v12 ^ 1;
      _os_log_impl(&dword_1E4BFE000, v13, OS_LOG_TYPE_DEFAULT, "PrimaryInEar: %@, secondaryInEar : %@. newBudsInEar: %d", buf, 0x1Cu);
    }

    if (self->_alertShowing) {
      char v14 = v12;
    }
    else {
      char v14 = 1;
    }
    if (v14)
    {
      if (self->_alertShowing) {
        int v15 = 0;
      }
      else {
        int v15 = v12;
      }
      if (v15 == 1)
      {
        [(BTSpatialTutorialViewController *)self stopPlayingContent];
        [(BTSpatialTutorialViewController *)self showAlert];
      }
    }
    else
    {
      alert = self->_alert;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __61__BTSpatialTutorialViewController_inEarStatusChangedHandler___block_invoke;
      v17[3] = &unk_1E6EA82F0;
      v17[4] = self;
      [(UIAlertController *)alert dismissViewControllerAnimated:1 completion:v17];
    }
  }
  else
  {
    double v9 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4BFE000, v9, OS_LOG_TYPE_DEFAULT, "Device does not match, cannot handle In Ear Status change", buf, 2u);
    }
  }
}

uint64_t __61__BTSpatialTutorialViewController_inEarStatusChangedHandler___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1042) = 0;
  return [*(id *)(a1 + 32) startPlayingContent];
}

- (BTSDevice)currentDevice
{
  return self->_currentDevice;
}

- (void)setCurrentDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDevice, 0);
  objc_storeStrong((id *)&self->_mediaSession, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong((id *)&self->_spatialTutorialContentView, 0);
  objc_storeStrong((id *)&self->_spacerView, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_stackView, 0);

  objc_storeStrong((id *)&self->_welcomeController, 0);
}

@end