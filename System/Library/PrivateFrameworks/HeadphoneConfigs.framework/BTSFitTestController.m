@interface BTSFitTestController
- (BOOL)isCallActive;
- (BOOL)isDebugModeEnabled;
- (BOOL)isSmallScreenDevice;
- (BOOL)isiPad;
- (BTSFitTestController)initWithDevice:(id)a3;
- (float)getConfidenceThreshold;
- (float)getSealThreshold;
- (id)getImageFileName:(unsigned int)a3 forSide:(BOOL)a4;
- (void)callCompletionHandler;
- (void)cleanupAudio;
- (void)copyToClipboard;
- (void)dealloc;
- (void)deviceDisconnectedHandler:(id)a3;
- (void)dismissFitTest;
- (void)fitTestStopped;
- (void)handleAudioSessionInterruption:(id)a3;
- (void)handleCallIsActiveDidChangeNotification:(id)a3;
- (void)handleMediaServerConnectionDied:(id)a3;
- (void)inEarStatusChanged:(id)a3;
- (void)loadView;
- (void)powerChangedHandler:(id)a3;
- (void)removeDoneButton;
- (void)resetVolume;
- (void)sealValueChanged:(id)a3;
- (void)setCancelAction;
- (void)setCompletionHandler:(id)a3;
- (void)setupConstraints;
- (void)setupFitTestContentView;
- (void)startFitTest;
- (void)updateFitTestActiveState;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation BTSFitTestController

- (BTSFitTestController)initWithDevice:(id)a3
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self)
  {
    v116.receiver = self;
    v116.super_class = (Class)BTSFitTestController;
    self = [(BTSFitTestController *)&v116 init];
    p_currentDevice = &self->currentDevice;
    objc_storeStrong((id *)&self->currentDevice, a3);
    v7 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    fitTestContentView = self->_fitTestContentView;
    self->_fitTestContentView = v7;

    v9 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
    stackViewImages = self->_stackViewImages;
    self->_stackViewImages = v9;

    v11 = (AVSystemController *)objc_alloc_init(MEMORY[0x1E4F74F68]);
    avSystemController = self->_avSystemController;
    self->_avSystemController = v11;

    self->_testActive = 0;
    self->_double initialVolume = 0.0;
    self->_volumeModified = 0;
    v13 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
    char v14 = [v13 getVolume:&self->_initialVolume forCategory:@"Audio/Video"];

    if ((v14 & 1) == 0)
    {
      v15 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[BTSFitTestController initWithDevice:](v15, v16, v17, v18, v19, v20, v21, v22);
      }
    }
    v113 = &self->currentDevice;
    v23 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      double initialVolume = self->_initialVolume;
      *(_DWORD *)buf = 134217984;
      *(double *)v119 = initialVolume;
      _os_log_impl(&dword_1E4BFE000, v23, OS_LOG_TYPE_DEFAULT, "Fit Test: Volume before fit test : %0.9f", buf, 0xCu);
    }

    v25 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    spinner = self->_spinner;
    self->_spinner = v25;

    [(UIActivityIndicatorView *)self->_spinner setHidesWhenStopped:1];
    id v27 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v28 = *MEMORY[0x1E4F1DB28];
    double v29 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v30 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v31 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v32 = (UIView *)objc_msgSend(v27, "initWithFrame:", *MEMORY[0x1E4F1DB28], v29, v30, v31);
    leftBudLabel = self->_leftBudLabel;
    self->_leftBudLabel = v32;

    v34 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v28, v29, v30, v31);
    rightBudLabel = self->_rightBudLabel;
    self->_rightBudLabel = v34;

    id v36 = objc_alloc(MEMORY[0x1E4FB1838]);
    v37 = [MEMORY[0x1E4FB1818] systemImageNamed:@"left.circle.fill"];
    v38 = [MEMORY[0x1E4FB1618] systemGrayColor];
    v39 = [v37 imageWithTintColor:v38 renderingMode:1];
    v40 = (UIImageView *)[v36 initWithImage:v39];
    leftBudLabelImageView = self->_leftBudLabelImageView;
    self->_leftBudLabelImageView = v40;

    id v42 = objc_alloc(MEMORY[0x1E4FB1838]);
    v43 = [MEMORY[0x1E4FB1818] systemImageNamed:@"right.circle.fill"];
    v44 = [MEMORY[0x1E4FB1618] systemGrayColor];
    v45 = [v43 imageWithTintColor:v44 renderingMode:1];
    v46 = (UIImageView *)[v42 initWithImage:v45];
    rightBudLabelImageView = self->_rightBudLabelImageView;
    self->_rightBudLabelImageView = v46;

    v48 = [MEMORY[0x1E4FB1818] systemImageNamed:@"play.fill"];
    buttonImage = self->_buttonImage;
    self->_buttonImage = v48;

    -[UIView setSize:](self->_leftBudLabel, "setSize:", 18.0, 18.0);
    [(UIView *)self->_leftBudLabel _setContinuousCornerRadius:9.0];
    v50 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)self->_leftBudLabel setBackgroundColor:v50];

    -[UIView setSize:](self->_rightBudLabel, "setSize:", 18.0, 18.0);
    [(UIView *)self->_rightBudLabel _setContinuousCornerRadius:9.0];
    v51 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)self->_rightBudLabel setBackgroundColor:v51];

    [(UIView *)self->_leftBudLabel addSubview:self->_leftBudLabelImageView];
    [(UIView *)self->_rightBudLabel addSubview:self->_rightBudLabelImageView];
    v52 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v28, v29, v30, v31);
    leftBudResultLabel = self->_leftBudResultLabel;
    self->_leftBudResultLabel = v52;

    v54 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v28, v29, v30, v31);
    rightBudResultLabel = self->_rightBudResultLabel;
    self->_rightBudResultLabel = v54;

    v56 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v28, v29, v30, v31);
    resultDetailLabel = self->_resultDetailLabel;
    self->_resultDetailLabel = v56;

    [(UILabel *)self->_leftBudResultLabel setText:&stru_1F4097960];
    v58 = [MEMORY[0x1E4FB1618] systemBlackColor];
    [(UILabel *)self->_leftBudResultLabel setTextColor:v58];

    [(UILabel *)self->_leftBudResultLabel setTextAlignment:1];
    [(UILabel *)self->_leftBudResultLabel setNumberOfLines:0];
    [(UILabel *)self->_leftBudResultLabel setLineBreakMode:0];
    uint64_t v59 = *MEMORY[0x1E4FB28C8];
    v60 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UILabel *)self->_leftBudResultLabel setFont:v60];

    [(UILabel *)self->_leftBudResultLabel setAlpha:1.0];
    [(UILabel *)self->_rightBudResultLabel setText:&stru_1F4097960];
    v61 = [MEMORY[0x1E4FB1618] systemBlackColor];
    [(UILabel *)self->_rightBudResultLabel setTextColor:v61];

    [(UILabel *)self->_rightBudResultLabel setTextAlignment:1];
    [(UILabel *)self->_rightBudResultLabel setNumberOfLines:0];
    [(UILabel *)self->_rightBudResultLabel setLineBreakMode:0];
    v62 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v59];
    [(UILabel *)self->_rightBudResultLabel setFont:v62];

    [(UILabel *)self->_rightBudResultLabel setAlpha:1.0];
    [(UILabel *)self->_resultDetailLabel setText:&stru_1F4097960];
    v63 = [MEMORY[0x1E4FB1618] systemBlackColor];
    [(UILabel *)self->_resultDetailLabel setTextColor:v63];

    [(UILabel *)self->_resultDetailLabel setTextAlignment:1];
    [(UILabel *)self->_resultDetailLabel setNumberOfLines:0];
    [(UILabel *)self->_resultDetailLabel setLineBreakMode:0];
    v64 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v59];
    [(UILabel *)self->_resultDetailLabel setFont:v64];

    [(UILabel *)self->_resultDetailLabel setAlpha:1.0];
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0;

    if (self->_darkMode) {
      v66 = "dark";
    }
    else {
      v66 = "light";
    }
    v67 = objc_msgSend(NSString, "stringWithFormat:", @"FitTest-Left-%s", v66);
    if (self->_darkMode) {
      v68 = "dark";
    }
    else {
      v68 = "light";
    }
    v69 = objc_msgSend(NSString, "stringWithFormat:", @"FitTest-Right-%s", v68);
    if ([(BluetoothDevice *)*p_currentDevice productId] == 8210)
    {
      *(_DWORD *)buf = 17;
      [(BluetoothDevice *)*p_currentDevice getDeviceColor:buf];
      v70 = [(BTSFitTestController *)self getImageFileName:*(unsigned int *)buf forSide:0];

      uint64_t v71 = [(BTSFitTestController *)self getImageFileName:*(unsigned int *)buf forSide:1];

      v69 = (void *)v71;
    }
    else
    {
      v70 = v67;
    }
    if ([(BluetoothDevice *)*p_currentDevice productId] == 8221)
    {
      *(_DWORD *)buf = 17;
      [(BluetoothDevice *)*p_currentDevice getDeviceColor:buf];
      uint64_t v72 = objc_msgSend(NSString, "stringWithFormat:", @"B498-Left-FitTest-CL%d", *(unsigned int *)buf);

      uint64_t v73 = objc_msgSend(NSString, "stringWithFormat:", @"B498-Right-FitTest-CL%d", *(unsigned int *)buf);

      v70 = (void *)v72;
      v69 = (void *)v73;
    }
    v74 = (void *)MEMORY[0x1E4FB1818];
    v75 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v112 = v70;
    uint64_t v76 = [v74 imageNamed:v70 inBundle:v75 compatibleWithTraitCollection:0];

    v111 = (void *)v76;
    v77 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v76];
    leftImView = self->_leftImView;
    self->_leftImView = v77;

    v79 = (void *)MEMORY[0x1E4FB1818];
    v80 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v81 = [v79 imageNamed:v69 inBundle:v80 compatibleWithTraitCollection:0];

    v82 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v81];
    rightImView = self->_rightImView;
    self->_rightImView = v82;

    v84 = [(BTSFitTestController *)self traitCollection];
    self->_BOOL darkMode = [v84 userInterfaceStyle] == 2;

    if ([(BluetoothDevice *)*v113 productId] == 8221)
    {
      v85 = objc_msgSend(MEMORY[0x1E4FB1838], "_headphoneGetAssetsDictionary:", -[BluetoothDevice productId](*v113, "productId"));
      uint64_t v86 = [(BluetoothDevice *)*v113 productId];
      unsigned int v115 = 17;
      [(BluetoothDevice *)*v113 getDeviceColor:&v115];
      v87 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        BOOL darkMode = self->_darkMode;
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v119 = v86;
        *(_WORD *)&v119[4] = 1024;
        *(_DWORD *)&v119[6] = darkMode;
        __int16 v120 = 1024;
        unsigned int v121 = v115;
        _os_log_impl(&dword_1E4BFE000, v87, OS_LOG_TYPE_DEFAULT, "Initialized filter paramters: pid - %d, darkMode - %d, deviceColor - %d", buf, 0x14u);
      }

      [(UIImageView *)self->_leftImView _headphoneApplyFilters:v85 pid:v86 darkMode:self->_darkMode deviceColor:v115];
      [(UIImageView *)self->_rightImView _headphoneApplyFilters:v85 pid:v86 darkMode:self->_darkMode deviceColor:v115];
    }
    v89 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v89 addObserver:self selector:sel_inEarStatusChanged_ name:*MEMORY[0x1E4F50AD0] object:0];

    v90 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v90 addObserver:self selector:sel_sealValueChanged_ name:*MEMORY[0x1E4F50AD8] object:0];

    v91 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v91 addObserver:self selector:sel_deviceDisconnectedHandler_ name:*MEMORY[0x1E4F50B18] object:0];

    v92 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v92 addObserver:self selector:sel_powerChangedHandler_ name:*MEMORY[0x1E4F50AE8] object:0];

    v93 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v93 addObserver:self selector:sel_applicationDidBecomeActive_ name:*MEMORY[0x1E4FB2628] object:0];

    v94 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v94 addObserver:self selector:sel_applicationDidEnterBackground_ name:*MEMORY[0x1E4FB2640] object:0];

    v95 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v96 = *MEMORY[0x1E4F15000];
    v97 = [MEMORY[0x1E4F153E0] sharedInstance];
    [v95 addObserver:self selector:sel_handleAudioSessionInterruption_ name:v96 object:v97];

    v98 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v99 = *MEMORY[0x1E4F74E30];
    uint64_t v100 = [MEMORY[0x1E4F153E0] sharedInstance];
    [v98 addObserver:self selector:sel_handleMediaServerConnectionDied_ name:v99 object:v100];

    v101 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
    v102 = (void *)MEMORY[0x1E4F74B10];
    uint64_t v117 = *MEMORY[0x1E4F74B10];
    v103 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v117 count:1];
    uint64_t v104 = *MEMORY[0x1E4F74EA8];
    id v114 = 0;
    LOBYTE(v100) = [v101 setAttribute:v103 forKey:v104 error:&v114];
    id v105 = v114;

    v106 = sharedBluetoothSettingsLogComponent();
    v107 = v106;
    if (v100)
    {
      if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v107, OS_LOG_TYPE_INFO, "Fit Test: Successfully set AVSC attribute. Register listener for Call Active notification", buf, 2u);
      }

      v107 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v107 addObserver:self selector:sel_handleCallIsActiveDidChangeNotification_ name:*v102 object:0];
    }
    else if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
    {
      -[BTSFitTestController initWithDevice:]();
    }

    v108 = objc_alloc_init(HPSDeviceAnalytics);
    deviceAnalytics = self->_deviceAnalytics;
    self->_deviceAnalytics = v108;
  }
  return self;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  fitTestController = self->_fitTestController;
  self->_fitTestController = 0;

  playButton = self->_playButton;
  self->_playButton = 0;

  avSystemController = self->_avSystemController;
  self->_avSystemController = 0;

  player = self->_player;
  self->_player = 0;

  fitTestContentView = self->_fitTestContentView;
  self->_fitTestContentView = 0;

  stackViewImages = self->_stackViewImages;
  self->_stackViewImages = 0;

  spinner = self->_spinner;
  self->_spinner = 0;

  buttonImage = self->_buttonImage;
  self->_buttonImage = 0;

  leftBudLabel = self->_leftBudLabel;
  self->_leftBudLabel = 0;

  leftBudLabelImageView = self->_leftBudLabelImageView;
  self->_leftBudLabelImageView = 0;

  rightBudLabelImageView = self->_rightBudLabelImageView;
  self->_rightBudLabelImageView = 0;

  rightBudLabel = self->_rightBudLabel;
  self->_rightBudLabel = 0;

  leftImView = self->_leftImView;
  self->_leftImView = 0;

  rightImView = self->_rightImView;
  self->_rightImView = 0;

  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  v19.receiver = self;
  v19.super_class = (Class)BTSFitTestController;
  [(BTSFitTestController *)&v19 dealloc];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)BTSFitTestController;
  [(BTSFitTestController *)&v6 viewDidLoad];
  v3 = [(BTSFitTestController *)self navigationItem];
  [v3 setHidesBackButton:1];

  v4 = [(BTSFitTestController *)self view];
  id v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v4 setBackgroundColor:v5];

  [(UIView *)self->_fitTestContentView sizeToFit];
}

- (void)viewWillLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)BTSFitTestController;
  [(BTSFitTestController *)&v10 viewWillLayoutSubviews];
  [(OBTrayButton *)self->_playButton bounds];
  double v4 = v3 * 0.25;
  id v5 = [(OBTrayButton *)self->_playButton layer];
  [v5 setCornerRadius:v4];

  [(OBTrayButton *)self->_playButton bounds];
  double v7 = v6 * 0.25;
  v8 = [(OBLinkTrayButton *)self->_debugCopyResultsButton layer];
  [v8 setCornerRadius:v7];

  [(BTSFitTestController *)self setupConstraints];
  v9 = [(BTSFitTestController *)self view];
  [v9 layoutIfNeeded];
}

- (void)loadView
{
  v37.receiver = self;
  v37.super_class = (Class)BTSFitTestController;
  [(BTSFitTestController *)&v37 loadView];
  double v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v4 = [v3 localizedStringForKey:@"FIT_TEST_INIT_HEADER" value:&stru_1F4097960 table:@"DeviceConfig"];

  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v6 = [v5 localizedStringForKey:@"FIT_TEST_INIT_DETAIL" value:&stru_1F4097960 table:@"DeviceConfig"];

  if ([(BluetoothDevice *)self->currentDevice productId] == 8210)
  {
    double v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"FIT_TEST_INIT_DETAIL" value:&stru_1F4097960 table:@"DeviceConfig-B494"];

    double v6 = (void *)v8;
  }
  if ([(BluetoothDevice *)self->currentDevice productId] == 8221)
  {
    v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v10 = [v9 localizedStringForKey:@"FIT_TEST_INIT_DETAIL" value:&stru_1F4097960 table:@"DeviceConfig-B498-v2"];

    double v6 = (void *)v10;
  }
  v11 = (OBWelcomeController *)[objc_alloc(MEMORY[0x1E4F83AF8]) initWithTitle:v4 detailText:v6 icon:0 contentLayout:2];
  fitTestController = self->_fitTestController;
  self->_fitTestController = v11;

  v13 = [(BTSFitTestController *)self view];
  [v13 bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  uint64_t v22 = [(OBWelcomeController *)self->_fitTestController view];
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  v23 = [(OBWelcomeController *)self->_fitTestController view];
  [v23 setAutoresizingMask:18];

  [(BTSFitTestController *)self setupFitTestContentView];
  v24 = [MEMORY[0x1E4F83A80] boldButton];
  playButton = self->_playButton;
  self->_playButton = v24;

  [(OBTrayButton *)self->_playButton setTitle:&stru_1F4097960 forState:0];
  v26 = self->_playButton;
  id v27 = [(UIImage *)self->_buttonImage imageWithRenderingMode:2];
  [(OBTrayButton *)v26 setImage:v27 forState:0];

  [(OBTrayButton *)self->_playButton setClipsToBounds:1];
  double v28 = [(OBTrayButton *)self->_playButton layer];
  [v28 setMasksToBounds:1];

  [(BTSFitTestController *)self updateFitTestActiveState];
  [(OBTrayButton *)self->_playButton addTarget:self action:sel_startFitTest forControlEvents:64];
  [(OBTrayButton *)self->_playButton setUserInteractionEnabled:1];
  double v29 = self->_playButton;
  double v30 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [(OBTrayButton *)v29 setBackgroundColor:v30];

  double v31 = [(OBWelcomeController *)self->_fitTestController buttonTray];
  [v31 addButton:self->_playButton];

  if ([(BTSFitTestController *)self isDebugModeEnabled])
  {
    v32 = [MEMORY[0x1E4F83AB8] linkButton];
    debugCopyResultsButton = self->_debugCopyResultsButton;
    self->_debugCopyResultsButton = v32;

    [(OBLinkTrayButton *)self->_debugCopyResultsButton setTitle:@"Copy Results" forState:0];
    [(OBLinkTrayButton *)self->_debugCopyResultsButton setClipsToBounds:1];
    v34 = [(OBLinkTrayButton *)self->_debugCopyResultsButton layer];
    [v34 setMasksToBounds:1];

    [(OBLinkTrayButton *)self->_debugCopyResultsButton addTarget:self action:sel_copyToClipboard forControlEvents:64];
    [(OBLinkTrayButton *)self->_debugCopyResultsButton setUserInteractionEnabled:1];
  }
  [(BTSFitTestController *)self addChildViewController:self->_fitTestController];
  v35 = [(BTSFitTestController *)self view];
  id v36 = [(OBWelcomeController *)self->_fitTestController view];
  [v35 addSubview:v36];
}

- (void)copyToClipboard
{
  id v4 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  double v3 = [(UILabel *)self->_resultDetailLabel text];
  [v4 setString:v3];
}

- (void)setupFitTestContentView
{
  [(UIStackView *)self->_stackViewImages setAxis:0];
  [(UIStackView *)self->_stackViewImages setAlignment:3];
  [(UIStackView *)self->_stackViewImages setDistribution:2];
  [(UIStackView *)self->_stackViewImages setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_stackViewImages setSemanticContentAttribute:3];
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  -[UIImageView setFrame:](self->_leftBudLabelImageView, "setFrame:", *MEMORY[0x1E4F1DB28], v4, 22.0, 22.0);
  [(UIView *)self->_leftBudLabel center];
  -[UIImageView setCenter:](self->_leftBudLabelImageView, "setCenter:");
  -[UIImageView setFrame:](self->_rightBudLabelImageView, "setFrame:", v3, v4, 22.0, 22.0);
  [(UIView *)self->_rightBudLabel center];
  -[UIImageView setCenter:](self->_rightBudLabelImageView, "setCenter:");
  [(UIImageView *)self->_leftImView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_rightImView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_leftBudLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_rightBudLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_leftBudResultLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_rightBudResultLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_resultDetailLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v5) = 1148846080;
  [(UILabel *)self->_leftBudResultLabel setContentHuggingPriority:1 forAxis:v5];
  LODWORD(v6) = 1148846080;
  [(UILabel *)self->_rightBudResultLabel setContentHuggingPriority:1 forAxis:v6];
  id v10 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  double v7 = [v10 widthAnchor];
  uint64_t v8 = [v7 constraintEqualToConstant:40.0];
  [v8 setActive:1];

  [(UIStackView *)self->_stackViewImages addArrangedSubview:self->_leftImView];
  [(UIStackView *)self->_stackViewImages addArrangedSubview:v10];
  [(UIStackView *)self->_stackViewImages addArrangedSubview:self->_rightImView];
  [(UIView *)self->_fitTestContentView addSubview:self->_leftBudLabel];
  [(UIView *)self->_fitTestContentView addSubview:self->_rightBudLabel];
  [(UIView *)self->_fitTestContentView addSubview:self->_leftBudResultLabel];
  [(UIView *)self->_fitTestContentView addSubview:self->_rightBudResultLabel];
  [(UIView *)self->_fitTestContentView addSubview:self->_resultDetailLabel];
  [(UIView *)self->_fitTestContentView addSubview:self->_stackViewImages];
  [(UIView *)self->_fitTestContentView bringSubviewToFront:self->_leftBudLabel];
  [(UIView *)self->_fitTestContentView bringSubviewToFront:self->_rightBudLabel];
  v9 = [(OBWelcomeController *)self->_fitTestController contentView];
  [v9 addSubview:self->_fitTestContentView];
}

- (BOOL)isiPad
{
  v2 = MGGetStringAnswer();
  char v3 = [v2 isEqualToString:@"iPad"];

  return v3;
}

- (BOOL)isSmallScreenDevice
{
  unsigned int v2 = MGGetSInt32Answer();
  return (v2 < 6) & (0x26u >> v2);
}

- (void)setupConstraints
{
  id v98 = (id)objc_opt_new();
  char v3 = [(UIView *)self->_fitTestContentView topAnchor];
  double v4 = [(OBWelcomeController *)self->_fitTestController contentView];
  double v5 = [v4 topAnchor];
  double v6 = [v3 constraintEqualToAnchor:v5];
  [v98 addObject:v6];

  double v7 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v8 = [v7 preferredContentSizeCategory];

  v97 = v8;
  BOOL v9 = ([v8 isEqualToString:*MEMORY[0x1E4FB27E8]] & 1) == 0
    && ([v8 isEqualToString:*MEMORY[0x1E4FB27D8]] & 1) == 0
    && ![v8 isEqualToString:*MEMORY[0x1E4FB27D0]];
  id v10 = [(BTSFitTestController *)self view];
  [v10 bounds];
  double v12 = v11;

  if ([(BTSFitTestController *)self isSmallScreenDevice])
  {
    v13 = [(BTSFitTestController *)self view];
    [v13 bounds];
    double v15 = v14 * 0.35;
  }
  else
  {
    double v15 = v12 * 0.3;
  }
  if ([(BTSFitTestController *)self isiPad])
  {
    double v16 = [(UIStackView *)self->_stackViewImages topAnchor];
    double v17 = [(OBWelcomeController *)self->_fitTestController headerView];
    double v18 = [v17 bottomAnchor];
    double v19 = [v16 constraintEqualToAnchor:v18 constant:35.0];
    topSpacerConstraint = self->_topSpacerConstraint;
    self->_topSpacerConstraint = v19;
  }
  else
  {
    double v21 = [(BTSFitTestController *)self view];
    [v21 size];
    double v23 = v22;
    v24 = [(BTSFitTestController *)self view];
    [v24 size];
    double v26 = v25;

    double v16 = [(UIStackView *)self->_stackViewImages topAnchor];
    fitTestController = self->_fitTestController;
    if (v23 <= v26)
    {
      double v17 = [(OBWelcomeController *)fitTestController headerView];
      double v18 = [v17 topAnchor];
      float v29 = v15;
      [v16 constraintEqualToAnchor:v18 constant:v29];
    }
    else
    {
      double v17 = [(OBWelcomeController *)fitTestController contentView];
      double v18 = [v17 topAnchor];
      [v16 constraintEqualToAnchor:v18];
    }
    double v28 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    topSpacerConstraint = self->_topSpacerConstraint;
    self->_topSpacerConstraint = v28;
  }

  double v30 = [(BTSFitTestController *)self traitCollection];
  double v31 = [v30 preferredContentSizeCategory];
  if ((v9 | UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v31)))
  {
  }
  else
  {
    int v32 = isPreferredLanguageEnglish();

    if (v32)
    {
      v33 = [(OBWelcomeController *)self->_fitTestController contentView];
      v34 = [v33 heightAnchor];
      v35 = [v34 constraintGreaterThanOrEqualToConstant:403.0];
      [v98 addObject:v35];

      [v98 addObject:self->_topSpacerConstraint];
      goto LABEL_19;
    }
  }
  id v36 = [(OBWelcomeController *)self->_fitTestController contentView];
  objc_super v37 = [v36 heightAnchor];
  v38 = [v37 constraintGreaterThanOrEqualToConstant:403.0];
  [v98 addObject:v38];

  v39 = [(UIStackView *)self->_stackViewImages topAnchor];
  v40 = [(OBWelcomeController *)self->_fitTestController headerView];
  v41 = [v40 bottomAnchor];
  id v42 = [v39 constraintEqualToAnchor:v41 constant:100.0];
  [v98 addObject:v42];

LABEL_19:
  v43 = [(UIStackView *)self->_stackViewImages centerXAnchor];
  v44 = [(OBWelcomeController *)self->_fitTestController contentView];
  v45 = [v44 centerXAnchor];
  v46 = [v43 constraintEqualToAnchor:v45];
  [v98 addObject:v46];

  v47 = [(UILabel *)self->_leftBudResultLabel topAnchor];
  v48 = [(UIView *)self->_leftBudLabel bottomAnchor];
  v49 = [v47 constraintEqualToAnchor:v48 constant:1.0];
  [v98 addObject:v49];

  v50 = [(UILabel *)self->_rightBudResultLabel topAnchor];
  v51 = [(UIView *)self->_rightBudLabel bottomAnchor];
  v52 = [v50 constraintEqualToAnchor:v51 constant:1.0];
  [v98 addObject:v52];

  v53 = [(UILabel *)self->_leftBudResultLabel centerXAnchor];
  v54 = [(UIView *)self->_leftBudLabel centerXAnchor];
  v55 = [v53 constraintEqualToAnchor:v54];
  [v98 addObject:v55];

  v56 = [(UILabel *)self->_rightBudResultLabel centerXAnchor];
  v57 = [(UIView *)self->_rightBudLabel centerXAnchor];
  v58 = [v56 constraintEqualToAnchor:v57];
  [v98 addObject:v58];

  uint64_t v59 = [(UIView *)self->_leftBudLabel widthAnchor];
  v60 = [v59 constraintEqualToConstant:18.0];
  [v98 addObject:v60];

  v61 = [(UIView *)self->_leftBudLabel heightAnchor];
  v62 = [v61 constraintEqualToConstant:18.0];
  [v98 addObject:v62];

  v63 = [(UIView *)self->_rightBudLabel widthAnchor];
  v64 = [v63 constraintEqualToConstant:18.0];
  [v98 addObject:v64];

  v65 = [(UIView *)self->_rightBudLabel heightAnchor];
  v66 = [v65 constraintEqualToConstant:18.0];
  [v98 addObject:v66];

  v67 = [(UILabel *)self->_leftBudResultLabel widthAnchor];
  v68 = [v67 constraintLessThanOrEqualToConstant:113.0];
  [v98 addObject:v68];

  v69 = [(UILabel *)self->_rightBudResultLabel widthAnchor];
  v70 = [v69 constraintLessThanOrEqualToConstant:113.0];
  [v98 addObject:v70];

  uint64_t v71 = [(UILabel *)self->_resultDetailLabel topAnchor];
  uint64_t v72 = [(UILabel *)self->_leftBudResultLabel bottomAnchor];
  uint64_t v73 = [v71 constraintGreaterThanOrEqualToAnchor:v72 constant:1.0];
  [v98 addObject:v73];

  v74 = [(UILabel *)self->_resultDetailLabel topAnchor];
  v75 = [(UILabel *)self->_rightBudResultLabel bottomAnchor];
  uint64_t v76 = [v74 constraintGreaterThanOrEqualToAnchor:v75 constant:1.0];
  [v98 addObject:v76];

  v77 = [(UILabel *)self->_resultDetailLabel leadingAnchor];
  v78 = [(OBWelcomeController *)self->_fitTestController headerView];
  v79 = [v78 leadingAnchor];
  v80 = [v77 constraintEqualToAnchor:v79];
  [v98 addObject:v80];

  v81 = [(UILabel *)self->_resultDetailLabel trailingAnchor];
  v82 = [(OBWelcomeController *)self->_fitTestController headerView];
  v83 = [v82 trailingAnchor];
  v84 = [v81 constraintEqualToAnchor:v83];
  [v98 addObject:v84];

  v85 = [(UIView *)self->_leftBudLabel topAnchor];
  uint64_t v86 = [(UIImageView *)self->_leftImView bottomAnchor];
  v87 = [v85 constraintEqualToAnchor:v86 constant:20.0];
  [v98 addObject:v87];

  v88 = [(UIView *)self->_rightBudLabel topAnchor];
  v89 = [(UIImageView *)self->_rightImView bottomAnchor];
  v90 = [v88 constraintEqualToAnchor:v89 constant:20.0];
  [v98 addObject:v90];

  v91 = [(UIView *)self->_leftBudLabel leftAnchor];
  v92 = [(UIStackView *)self->_stackViewImages leftAnchor];
  v93 = [v91 constraintEqualToAnchor:v92 constant:62.0];
  [v98 addObject:v93];

  v94 = [(UIView *)self->_rightBudLabel rightAnchor];
  v95 = [(UIStackView *)self->_stackViewImages rightAnchor];
  uint64_t v96 = [v94 constraintEqualToAnchor:v95 constant:-62.0];
  [v98 addObject:v96];

  [MEMORY[0x1E4F28DC8] activateConstraints:v98];
}

- (void)startFitTest
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = *a1;
  int v4 = *(unsigned __int8 *)(a2 + 1138);
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_error_impl(&dword_1E4BFE000, log, OS_LOG_TYPE_ERROR, "Fit Test: budsInEar: %d, callActive: %d", (uint8_t *)v5, 0xEu);
}

void __36__BTSFitTestController_startFitTest__block_invoke()
{
  v0 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1E4BFE000, v0, OS_LOG_TYPE_DEFAULT, "Fit Test: No action needed", v1, 2u);
  }
}

void __36__BTSFitTestController_startFitTest__block_invoke_133(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  float v33 = 0.0;
  unsigned int v2 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
  char v3 = [v2 getVolume:&v33 forCategory:@"Audio/Video"];

  int v4 = sharedBluetoothSettingsLogComponent();
  double v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v35 = v33;
      _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Fit Test: Current volume : %f", buf, 0xCu);
    }

    if (v33 < 0.5)
    {
      __int16 v6 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, "Fit Test: Increase volume for AudioVideo for fit test", buf, 2u);
      }

      int v7 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
      LODWORD(v8) = 0.5;
      [v7 setVolumeTo:@"Audio/Video" forCategory:v8];

      *(unsigned char *)(*(void *)(a1 + 32) + 1140) = 1;
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __36__BTSFitTestController_startFitTest__block_invoke_133_cold_3(v5, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  double v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v17 = [v16 pathForResource:@"E+D-US_ML" ofType:@"wav"];

  double v18 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v17];
  double v19 = [MEMORY[0x1E4F153E0] sharedInstance];
  id v32 = 0;
  [v19 setActive:1 error:&v32];
  id v20 = v32;

  if (v20)
  {
    double v21 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      __36__BTSFitTestController_startFitTest__block_invoke_133_cold_2();
    }
  }
  double v22 = [MEMORY[0x1E4F153E0] sharedInstance];
  uint64_t v23 = *MEMORY[0x1E4F14F98];
  id v31 = v20;
  [v22 setCategory:v23 error:&v31];
  id v24 = v31;

  if (v24)
  {
    double v25 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      __36__BTSFitTestController_startFitTest__block_invoke_133_cold_1();
    }

    id v26 = 0;
  }
  else
  {
    id v30 = 0;
    uint64_t v27 = [objc_alloc(MEMORY[0x1E4F153C0]) initWithContentsOfURL:v18 error:&v30];
    id v26 = v30;
    uint64_t v28 = *(void *)(a1 + 32);
    float v29 = *(void **)(v28 + 1024);
    *(void *)(v28 + 1024) = v27;

    [*(id *)(*(void *)(a1 + 32) + 1024) setNumberOfLoops:5];
    [*(id *)(*(void *)(a1 + 32) + 1024) prepareToPlay];
    [*(id *)(*(void *)(a1 + 32) + 1024) play];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 1137) = 1;
}

- (void)setCancelAction
{
  char v3 = [(BTSFitTestController *)self navigationItem];
  [v3 setLeftBarButtonItems:0 animated:1];

  id v5 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_dismissFitTest];
  int v4 = [(BTSFitTestController *)self navigationItem];
  [v4 setLeftBarButtonItem:v5];
}

- (void)removeDoneButton
{
  id v2 = [(BTSFitTestController *)self navigationItem];
  [v2 setRightBarButtonItem:0 animated:1];
}

- (void)dismissFitTest
{
  [(BTSFitTestController *)self cleanupAudio];
  [(BTSFitTestController *)self resetVolume];
  if (!self->_completionHandler)
  {
    [(BTSFitTestController *)self dismissViewControllerAnimated:1 completion:&__block_literal_global_147];
  }
}

- (void)inEarStatusChanged:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v4 = [a3 object];
  id v5 = [v4 objectForKeyedSubscript:@"primaryInEarStatus"];
  __int16 v6 = [v4 objectForKeyedSubscript:@"secondaryInEarStatus"];
  int v7 = [v4 objectForKeyedSubscript:@"device"];
  double v8 = [v7 address];
  uint64_t v9 = [(BluetoothDevice *)self->currentDevice address];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    int v11 = [v5 BOOLValue];
    int v12 = (v11 | [v6 BOOLValue]) ^ 1;
    uint64_t v13 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412802;
      double v18 = v5;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 1024;
      int v22 = v12;
      _os_log_impl(&dword_1E4BFE000, v13, OS_LOG_TYPE_DEFAULT, "Fit Test: PrimaryInEar: %@, secondaryInEar : %@. newBudsInEar: %d", (uint8_t *)&v17, 0x1Cu);
    }

    int budsInEar = self->_budsInEar;
    self->_int budsInEar = v12;
    uint64_t v15 = sharedBluetoothSettingsLogComponent();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (budsInEar == v12)
    {
      if (v16)
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1E4BFE000, v15, OS_LOG_TYPE_DEFAULT, "Fit Test: No change needed based on in-ear status change", (uint8_t *)&v17, 2u);
      }
    }
    else
    {
      if (v16)
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1E4BFE000, v15, OS_LOG_TYPE_DEFAULT, "Fit Test: Update UI since in-ear status has changed", (uint8_t *)&v17, 2u);
      }

      if (self->_testActive) {
        [(BTSFitTestController *)self fitTestStopped];
      }
    }
  }
}

- (void)sealValueChanged:(id)a3
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_testActive)
  {
    id v5 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_dismissFitTest];
    __int16 v6 = [(BTSFitTestController *)self navigationItem];
    [v6 setLeftBarButtonItems:0 animated:1];

    int v7 = [(BTSFitTestController *)self navigationItem];
    [v7 setRightBarButtonItem:v5];

    id v103 = v4;
    double v8 = [v4 object];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"sealLeft"];
    int v10 = [v8 objectForKeyedSubscript:@"sealRight"];
    v102 = v9;
    [v9 floatValue];
    float v12 = v11;
    v101 = v10;
    [v10 floatValue];
    float v14 = v13;
    uint64_t v15 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)uint64_t v117 = v12;
      _os_log_impl(&dword_1E4BFE000, v15, OS_LOG_TYPE_DEFAULT, "Fit Test: leftSeal : %0.06f", buf, 0xCu);
    }

    BOOL v16 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)uint64_t v117 = v14;
      _os_log_impl(&dword_1E4BFE000, v16, OS_LOG_TYPE_DEFAULT, "Fit Test: rightSeal : %0.06f", buf, 0xCu);
    }

    int v17 = [v8 objectForKeyedSubscript:@"confidenceLeft"];
    double v18 = [v8 objectForKeyedSubscript:@"confidenceRight"];
    uint64_t v100 = v17;
    [v17 floatValue];
    float v20 = v19;
    uint64_t v99 = v18;
    [v18 floatValue];
    float v22 = v21;
    int v23 = [(BluetoothDevice *)self->currentDevice productId];
    if (v23 == 8210) {
      float v24 = v12;
    }
    else {
      float v24 = -0.0;
    }
    float v25 = v20 + v24;
    if (v23 == 8210) {
      float v26 = v14;
    }
    else {
      float v26 = -0.0;
    }
    float v27 = v22 + v26;
    int v28 = [(BluetoothDevice *)self->currentDevice productId];
    if (v28 == 8221) {
      float v29 = v12;
    }
    else {
      float v29 = -0.0;
    }
    float v30 = v25 + v29;
    if (v28 == 8221) {
      float v31 = v14;
    }
    else {
      float v31 = -0.0;
    }
    id v32 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)uint64_t v117 = v30;
      _os_log_impl(&dword_1E4BFE000, v32, OS_LOG_TYPE_DEFAULT, "Fit Test: confidenceL : %0.06f", buf, 0xCu);
    }
    float v33 = v27 + v31;

    v34 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)uint64_t v117 = v33;
      _os_log_impl(&dword_1E4BFE000, v34, OS_LOG_TYPE_DEFAULT, "Fit Test: confidenceR : %0.06f", buf, 0xCu);
    }

    [(BTSFitTestController *)self fitTestStopped];
    double v35 = [(OBWelcomeController *)self->_fitTestController headerView];
    [(BTSFitTestController *)self getSealThreshold];
    float v37 = v36;
    [(BTSFitTestController *)self getConfidenceThreshold];
    float v39 = v38;
    if (v30 < v38 || v33 < v38)
    {
      v41 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        -[BTSFitTestController sealValueChanged:](v41, v42, v43, v44, v45, v46, v47, v48);
      }

      v49 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v50 = [v49 localizedStringForKey:@"FIT_TEST_RESULTS_FAILED_HEADER" value:&stru_1F4097960 table:@"DeviceConfig"];
      [v35 setTitle:v50];

      v51 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v52 = [v51 localizedStringForKey:@"FIT_TEST_RESULTS_FAILED_DETAIL" value:&stru_1F4097960 table:@"DeviceConfig"];
      [v35 setDetailText:v52];

      [(BTSFitTestController *)self setupConstraints];
      v53 = [(BTSFitTestController *)self view];
      [v53 setNeedsLayout];

      v54 = [(BTSFitTestController *)self view];
      [v54 layoutIfNeeded];

      BOOL v104 = 0;
      BOOL v55 = 0;
      BOOL v56 = 0;
    }
    else
    {
      BOOL v104 = v12 >= v37;
      v58 = (void *)MEMORY[0x1E4FB1EB0];
      if (v12 < v37)
      {
        uint64_t v59 = v115;
        v115[0] = MEMORY[0x1E4F143A8];
        v115[1] = 3221225472;
        v60 = __41__BTSFitTestController_sealValueChanged___block_invoke;
      }
      else
      {
        uint64_t v59 = v114;
        v114[0] = MEMORY[0x1E4F143A8];
        v114[1] = 3221225472;
        v60 = __41__BTSFitTestController_sealValueChanged___block_invoke_2;
      }
      BOOL v55 = v12 < v37;
      v59[2] = v60;
      v59[3] = &unk_1E6EA82F0;
      v59[4] = self;
      objc_msgSend(v58, "animateWithDuration:animations:", 0.5);
      BOOL v56 = v14 >= v37;
      v61 = (void *)MEMORY[0x1E4FB1EB0];
      if (v14 < v37)
      {
        v62 = v113;
        v113[0] = MEMORY[0x1E4F143A8];
        v113[1] = 3221225472;
        v63 = __41__BTSFitTestController_sealValueChanged___block_invoke_3;
      }
      else
      {
        v62 = v112;
        v112[0] = MEMORY[0x1E4F143A8];
        v112[1] = 3221225472;
        v63 = __41__BTSFitTestController_sealValueChanged___block_invoke_4;
      }
      v62[2] = v63;
      v62[3] = &unk_1E6EA82F0;
      v62[4] = self;
      objc_msgSend(v61, "animateWithDuration:animations:", 0.5);
      v64 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v65 = [v64 localizedStringForKey:@"FIT_TEST_RESULTS_HEADER" value:&stru_1F4097960 table:@"DeviceConfig"];
      [v35 setTitle:v65];

      BOOL v57 = v14 < v37;
      if (v14 >= v37 && v12 >= v37)
      {
        uint64_t v73 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v74 = [v73 localizedStringForKey:@"FIT_TEST_BOTH_GOOD_DETAIL" value:&stru_1F4097960 table:@"DeviceConfig"];
        [v35 setDetailText:v74];

        if (self->_completionHandler)
        {
          playButton = self->_playButton;
          uint64_t v76 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v77 = [v76 localizedStringForKey:@"CONTINUE" value:&stru_1F4097960 table:@"DeviceConfig"];
          [(OBTrayButton *)playButton setTitle:v77 forState:0];

          v78 = [(OBTrayButton *)self->_playButton imageView];
          [v78 setHidden:1];

          [(OBTrayButton *)self->_playButton removeTarget:self action:sel_startFitTest forControlEvents:64];
          [(OBTrayButton *)self->_playButton addTarget:self action:sel_callCompletionHandler forControlEvents:64];
        }
        BOOL v55 = 0;
        BOOL v57 = 0;
        goto LABEL_70;
      }
      if (v12 < v37 && v14 < v37)
      {
        v67 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v68 = [v67 localizedStringForKey:@"FIT_TEST_BOTH_POOR_DETAIL" value:&stru_1F4097960 table:@"DeviceConfig"];
        [v35 setDetailText:v68];

        if ([(BluetoothDevice *)self->currentDevice productId] == 8210)
        {
          v69 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v70 = [v69 localizedStringForKey:@"FIT_TEST_BOTH_POOR_DETAIL" value:&stru_1F4097960 table:@"DeviceConfig-B494"];
          [v35 setDetailText:v70];
        }
        if ([(BluetoothDevice *)self->currentDevice productId] == 8221)
        {
          uint64_t v71 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          uint64_t v72 = [v71 localizedStringForKey:@"FIT_TEST_BOTH_POOR_DETAIL" value:&stru_1F4097960 table:@"DeviceConfig-B498-v2"];
          [v35 setDetailText:v72];
        }
        BOOL v104 = 0;
LABEL_69:
        BOOL v56 = 0;
        goto LABEL_70;
      }
      if (v14 < v37 && v12 >= v37)
      {
        v82 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v83 = [v82 localizedStringForKey:@"FIT_TEST_LEFT_GOOD_RIGHT_POOR_DETAIL" value:&stru_1F4097960 table:@"DeviceConfig"];
        [v35 setDetailText:v83];

        if ([(BluetoothDevice *)self->currentDevice productId] == 8210)
        {
          v84 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v85 = [v84 localizedStringForKey:@"FIT_TEST_LEFT_GOOD_RIGHT_POOR_DETAIL" value:&stru_1F4097960 table:@"DeviceConfig-B494"];
          [v35 setDetailText:v85];
        }
        if ([(BluetoothDevice *)self->currentDevice productId] == 8221)
        {
          uint64_t v86 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v87 = [v86 localizedStringForKey:@"FIT_TEST_LEFT_GOOD_RIGHT_POOR_DETAIL" value:&stru_1F4097960 table:@"DeviceConfig-B498-v2"];
          [v35 setDetailText:v87];
        }
        BOOL v55 = 0;
        goto LABEL_69;
      }
      if (v12 >= v37 || v14 < v37)
      {
        v81 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109888;
          *(_DWORD *)uint64_t v117 = v12 >= v37;
          *(_WORD *)&v117[4] = 1024;
          *(_DWORD *)&v117[6] = v12 < v37;
          __int16 v118 = 1024;
          BOOL v119 = v14 >= v37;
          __int16 v120 = 1024;
          BOOL v121 = v14 < v37;
          _os_log_impl(&dword_1E4BFE000, v81, OS_LOG_TYPE_DEFAULT, "Fit Test: leftSealGood: %d, leftSealPoor: %d, rightSealGood: %d, rightSealPoor: %d", buf, 0x1Au);
        }

        goto LABEL_70;
      }
      v93 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v94 = [v93 localizedStringForKey:@"FIT_TEST_LEFT_POOR_RIGHT_GOOD_DETAIL" value:&stru_1F4097960 table:@"DeviceConfig"];
      [v35 setDetailText:v94];

      if ([(BluetoothDevice *)self->currentDevice productId] == 8210)
      {
        v95 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v96 = [v95 localizedStringForKey:@"FIT_TEST_LEFT_POOR_RIGHT_GOOD_DETAIL" value:&stru_1F4097960 table:@"DeviceConfig-B494"];
        [v35 setDetailText:v96];
      }
      if ([(BluetoothDevice *)self->currentDevice productId] == 8221)
      {
        v97 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v98 = [v97 localizedStringForKey:@"FIT_TEST_LEFT_POOR_RIGHT_GOOD_DETAIL" value:&stru_1F4097960 table:@"DeviceConfig-B498-v2"];
        [v35 setDetailText:v98];
      }
      BOOL v104 = 0;
    }
    BOOL v57 = 0;
LABEL_70:
    if ([(BTSFitTestController *)self isDebugModeEnabled])
    {
      v105[0] = MEMORY[0x1E4F143A8];
      v105[1] = 3221225472;
      v105[2] = __41__BTSFitTestController_sealValueChanged___block_invoke_201;
      v105[3] = &unk_1E6EA8618;
      v105[4] = self;
      float v106 = v37;
      float v107 = v39;
      float v108 = v12;
      float v109 = v30;
      float v110 = v14;
      float v111 = v33;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v105 animations:0.5];
    }
    [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFitTestValue:6 value:(int)v12];
    [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFitTestValue:7 value:(int)v14];
    [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFitTestValue:1 value:(int)v30];
    [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFitTestValue:2 value:(int)v33];
    [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFitTestValue:5 value:[(BluetoothDevice *)self->currentDevice productId]];
    if (v104 && v56) {
      uint64_t v88 = 2;
    }
    else {
      uint64_t v88 = v55 || v57;
    }
    [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFitTestValue:9 value:v88];
    v89 = [MEMORY[0x1E4F1C9C8] date];
    endFitTestTimestamp = self->_endFitTestTimestamp;
    self->_endFitTestTimestamp = v89;

    deviceAnalytics = self->_deviceAnalytics;
    [(NSDate *)self->_endFitTestTimestamp timeIntervalSinceDate:self->_startFitTestTimestamp];
    [(HPSDeviceAnalytics *)deviceAnalytics updateFitTestValue:8 value:(int)v92];
    [(HPSDeviceAnalytics *)self->_deviceAnalytics submitFitTestAnalytics];

    id v4 = v103;
    goto LABEL_76;
  }
  id v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Fit Test: Discard results since test is not active", buf, 2u);
  }
LABEL_76:
}

void __41__BTSFitTestController_sealValueChanged___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1818] systemImageNamed:@"left.circle.fill"];
  char v3 = [MEMORY[0x1E4FB1618] systemYellowColor];
  id v4 = [v2 imageWithTintColor:v3 renderingMode:1];
  [*(id *)(*(void *)(a1 + 32) + 1072) setImage:v4];

  id v5 = [MEMORY[0x1E4FB1618] systemYellowColor];
  [*(id *)(*(void *)(a1 + 32) + 1096) setTextColor:v5];

  id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  __int16 v6 = [v7 localizedStringForKey:@"FIT_TEST_POOR_RESULT" value:&stru_1F4097960 table:@"DeviceConfig"];
  [*(id *)(*(void *)(a1 + 32) + 1096) setText:v6];
}

void __41__BTSFitTestController_sealValueChanged___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1818] systemImageNamed:@"left.circle.fill"];
  char v3 = [MEMORY[0x1E4FB1618] systemGreenColor];
  id v4 = [v2 imageWithTintColor:v3 renderingMode:1];
  [*(id *)(*(void *)(a1 + 32) + 1072) setImage:v4];

  id v5 = [MEMORY[0x1E4FB1618] systemGreenColor];
  [*(id *)(*(void *)(a1 + 32) + 1096) setTextColor:v5];

  id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  __int16 v6 = [v7 localizedStringForKey:@"FIT_TEST_GOOD_RESULT" value:&stru_1F4097960 table:@"DeviceConfig"];
  [*(id *)(*(void *)(a1 + 32) + 1096) setText:v6];
}

void __41__BTSFitTestController_sealValueChanged___block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1818] systemImageNamed:@"right.circle.fill"];
  char v3 = [MEMORY[0x1E4FB1618] systemYellowColor];
  id v4 = [v2 imageWithTintColor:v3 renderingMode:1];
  [*(id *)(*(void *)(a1 + 32) + 1088) setImage:v4];

  id v5 = [MEMORY[0x1E4FB1618] systemYellowColor];
  [*(id *)(*(void *)(a1 + 32) + 1104) setTextColor:v5];

  id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  __int16 v6 = [v7 localizedStringForKey:@"FIT_TEST_POOR_RESULT" value:&stru_1F4097960 table:@"DeviceConfig"];
  [*(id *)(*(void *)(a1 + 32) + 1104) setText:v6];
}

void __41__BTSFitTestController_sealValueChanged___block_invoke_4(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1818] systemImageNamed:@"right.circle.fill"];
  char v3 = [MEMORY[0x1E4FB1618] systemGreenColor];
  id v4 = [v2 imageWithTintColor:v3 renderingMode:1];
  [*(id *)(*(void *)(a1 + 32) + 1088) setImage:v4];

  id v5 = [MEMORY[0x1E4FB1618] systemGreenColor];
  [*(id *)(*(void *)(a1 + 32) + 1104) setTextColor:v5];

  id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  __int16 v6 = [v7 localizedStringForKey:@"FIT_TEST_GOOD_RESULT" value:&stru_1F4097960 table:@"DeviceConfig"];
  [*(id *)(*(void *)(a1 + 32) + 1104) setText:v6];
}

void __41__BTSFitTestController_sealValueChanged___block_invoke_201(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 984) buttonTray];
  [v2 addButton:*(void *)(*(void *)(a1 + 32) + 1000)];

  char v3 = [MEMORY[0x1E4FB1618] systemGreenColor];
  [*(id *)(*(void *)(a1 + 32) + 1128) setTextColor:v3];

  id v4 = [NSString stringWithFormat:@"Target Seal : %.2f  Confidence : %.2f\nLeft Seal : %.2f  Confidence : %.2f\nRight Seal : %.2f  Confidence : %.2f", *(float *)(a1 + 40), *(float *)(a1 + 44), *(float *)(a1 + 48), *(float *)(a1 + 52), *(float *)(a1 + 56), *(float *)(a1 + 60)];
  [*(id *)(*(void *)(a1 + 32) + 1128) setText:v4];
}

- (void)fitTestStopped
{
  self->_testActive = 0;
  char v3 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__BTSFitTestController_fitTestStopped__block_invoke;
  block[3] = &unk_1E6EA82F0;
  block[4] = self;
  dispatch_async(v3, block);

  [(UIActivityIndicatorView *)self->_spinner stopAnimating];
  [(UIActivityIndicatorView *)self->_spinner setHidden:1];
  [(OBTrayButton *)self->_playButton setUserInteractionEnabled:1];
  id v4 = [(OBTrayButton *)self->_playButton imageView];
  [v4 setHidden:0];

  id v5 = [(OBWelcomeController *)self->_fitTestController headerView];
  __int16 v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"FIT_TEST_INIT_HEADER" value:&stru_1F4097960 table:@"DeviceConfig"];
  [v5 setTitle:v7];

  double v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v9 = [v8 localizedStringForKey:@"FIT_TEST_INIT_DETAIL" value:&stru_1F4097960 table:@"DeviceConfig"];

  if ([(BluetoothDevice *)self->currentDevice productId] == 8210)
  {
    int v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v11 = [v10 localizedStringForKey:@"FIT_TEST_INIT_DETAIL" value:&stru_1F4097960 table:@"DeviceConfig-B494"];

    uint64_t v9 = (void *)v11;
  }
  if ([(BluetoothDevice *)self->currentDevice productId] == 8221)
  {
    float v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v13 = [v12 localizedStringForKey:@"FIT_TEST_INIT_DETAIL" value:&stru_1F4097960 table:@"DeviceConfig-B498-v2"];

    uint64_t v9 = (void *)v13;
  }
  [v5 setDetailText:v9];
}

uint64_t __38__BTSFitTestController_fitTestStopped__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) resetVolume];
  id v2 = *(void **)(a1 + 32);

  return [v2 cleanupAudio];
}

- (void)deviceDisconnectedHandler:(id)a3
{
  id v6 = [a3 object];
  id v4 = [v6 address];
  id v5 = [(BluetoothDevice *)self->currentDevice address];

  if (v4 == v5) {
    [(BTSFitTestController *)self dismissFitTest];
  }
}

- (void)powerChangedHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F50B70] sharedInstance];
  int v6 = [v5 enabled];

  id v7 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v4 name];
    uint64_t v9 = (void *)v8;
    int v10 = "off";
    if (v6) {
      int v10 = "on";
    }
    int v11 = 138412546;
    uint64_t v12 = v8;
    __int16 v13 = 2080;
    float v14 = v10;
    _os_log_impl(&dword_1E4BFE000, v7, OS_LOG_TYPE_DEFAULT, "Fit Test: Received %@ with power state %s", (uint8_t *)&v11, 0x16u);
  }
  [(BTSFitTestController *)self dismissFitTest];
}

- (void)handleCallIsActiveDidChangeNotification:(id)a3
{
  int callActive = self->_callActive;
  int v5 = [(BTSFitTestController *)self isCallActive];
  self->_int callActive = [(BTSFitTestController *)self isCallActive];
  int v6 = sharedBluetoothSettingsLogComponent();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (callActive == v5)
  {
    if (v7)
    {
      __int16 v10 = 0;
      uint64_t v8 = "Fit Test: No change needed based on call status change";
      uint64_t v9 = (uint8_t *)&v10;
LABEL_6:
      _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
  }
  else if (v7)
  {
    *(_WORD *)buf = 0;
    uint64_t v8 = "Fit Test: Update UI since call status has changed";
    uint64_t v9 = buf;
    goto LABEL_6;
  }
}

- (void)handleAudioSessionInterruption:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 userInfo];
  int v5 = [v4 objectForKey:*MEMORY[0x1E4F15020]];
  uint64_t v6 = [v5 unsignedIntegerValue];

  if (v6 == 1)
  {
    BOOL v7 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL testActive = self->_testActive;
      v9[0] = 67109120;
      v9[1] = testActive;
      _os_log_impl(&dword_1E4BFE000, v7, OS_LOG_TYPE_DEFAULT, "Fit Test: Audio session interrupted. Reset Fit Test (Active: %d)", (uint8_t *)v9, 8u);
    }

    if (self->_testActive) {
      [(BTSFitTestController *)self fitTestStopped];
    }
  }
}

- (void)handleMediaServerConnectionDied:(id)a3
{
  id v4 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "Fit Test: Audio session server connection died", v6, 2u);
  }

  avSystemController = self->_avSystemController;
  self->_avSystemController = 0;
}

- (void)updateFitTestActiveState
{
  uint64_t v3 = 0x300000003;
  [(BluetoothDevice *)self->currentDevice inEarStatusPrimary:(char *)&v3 + 4 secondary:&v3];
  self->_int budsInEar = v3 == 0;
  self->_int callActive = [(BTSFitTestController *)self isCallActive];
}

- (void)resetVolume
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_volumeModified && self->_initialVolume <= 0.5)
  {
    uint64_t v3 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      double initialVolume = self->_initialVolume;
      int v7 = 134217984;
      double v8 = initialVolume;
      _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Fit Test: Cleanup audio. Set audioVideo volume to: %f", (uint8_t *)&v7, 0xCu);
    }

    int v5 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
    *(float *)&double v6 = self->_initialVolume;
    [v5 setVolumeTo:@"Audio/Video" forCategory:v6];

    self->_volumeModified = 0;
  }
}

- (void)cleanupAudio
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4BFE000, v0, v1, "Fit Test: Failed to deactivate AVAudioSession with AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation : %@", v2, v3, v4, v5, v6);
}

- (BOOL)isCallActive
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
  uint64_t v3 = [v2 attributeForKey:*MEMORY[0x1E4F74B08]];

  int v4 = [v3 BOOLValue];
  uint64_t v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Fit Test: Call is active : %d", (uint8_t *)v7, 8u);
  }

  return v4;
}

- (BOOL)isDebugModeEnabled
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(@"com.apple.BTServer");
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"FitTestOptions", @"com.apple.BTServer", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (float)getSealThreshold
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v3 = [(BluetoothDevice *)self->currentDevice productId];
  int v4 = v3;
  float v5 = 4.3;
  if (v3 != 8210) {
    float v5 = -5.0;
  }
  if (v3 == 8221) {
    float v6 = 5.0;
  }
  else {
    float v6 = v5;
  }
  if (v3 == 8212)
  {
    float v6 = 0.0;
    if (self->_completionHandler)
    {
      int v7 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_1E4BFE000, v7, OS_LOG_TYPE_DEFAULT, "Fit Test: getSealThreshold Hearing Test Threshold 6.0", (uint8_t *)&v10, 2u);
      }
    }
  }
  if (v4 == 8228) {
    float v6 = 0.0;
  }
  uint64_t v8 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    double v11 = v6;
    _os_log_impl(&dword_1E4BFE000, v8, OS_LOG_TYPE_DEFAULT, "Fit Test: Target Seal Threshold: %.2f", (uint8_t *)&v10, 0xCu);
  }

  return v6;
}

- (float)getConfidenceThreshold
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v2 = [(BluetoothDevice *)self->currentDevice productId];
  float v3 = 5.1;
  if (v2 != 8210) {
    float v3 = 10.0;
  }
  if (v2 == 8221) {
    float v3 = 1.0;
  }
  if (v2 == 8212 || v2 == 8228) {
    float v5 = -3.0;
  }
  else {
    float v5 = v3;
  }
  float v6 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    double v9 = v5;
    _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, "Fit Test: Target Confidence Threshold: %.2f", (uint8_t *)&v8, 0xCu);
  }

  return v5;
}

- (id)getImageFileName:(unsigned int)a3 forSide:(BOOL)a4
{
  if ((int)a3 > 84)
  {
    if ((int)a3 <= 118)
    {
      if (a3 == 85)
      {
        int v4 = NSString;
        float v5 = "Left";
        if (a4) {
          float v5 = "Right";
        }
        BOOL darkMode = self->_darkMode;
        int v7 = "dark-CL8";
        int v8 = "light-CL5";
        goto LABEL_43;
      }
      if (a3 == 102)
      {
        int v4 = NSString;
        float v5 = "Left";
        if (a4) {
          float v5 = "Right";
        }
        BOOL darkMode = self->_darkMode;
        int v7 = "dark-CL9";
        int v8 = "light-CL6";
        goto LABEL_43;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x77u:
          int v4 = NSString;
          float v5 = "Left";
          if (a4) {
            float v5 = "Right";
          }
          BOOL darkMode = self->_darkMode;
          int v7 = "dark-CL7";
          int v8 = "light-CL7";
          goto LABEL_43;
        case 0x88u:
          int v4 = NSString;
          float v5 = "Left";
          if (a4) {
            float v5 = "Right";
          }
          BOOL darkMode = self->_darkMode;
          int v7 = "dark-CL8";
          int v8 = "light-CL8";
          goto LABEL_43;
        case 0x99u:
          int v4 = NSString;
          float v5 = "Left";
          if (a4) {
            float v5 = "Right";
          }
          BOOL darkMode = self->_darkMode;
          int v7 = "dark-CL9";
          int v8 = "light-CL9";
          goto LABEL_43;
      }
    }
LABEL_17:
    int v4 = NSString;
    float v5 = "Left";
    if (a4) {
      float v5 = "Right";
    }
    BOOL darkMode = self->_darkMode;
    int v7 = "dark-CL1";
    int v8 = "light-CL1";
    goto LABEL_43;
  }
  if ((int)a3 <= 33)
  {
    if (!a3)
    {
      int v4 = NSString;
      float v5 = "Left";
      if (a4) {
        float v5 = "Right";
      }
      BOOL darkMode = self->_darkMode;
      int v7 = "dark-CL0";
      int v8 = "light-CL0";
      goto LABEL_43;
    }
    goto LABEL_17;
  }
  switch(a3)
  {
    case '""':
      int v4 = NSString;
      float v5 = "Left";
      if (a4) {
        float v5 = "Right";
      }
      BOOL darkMode = self->_darkMode;
      int v7 = "dark-CL2";
      int v8 = "light-CL2";
      break;
    case '3':
      int v4 = NSString;
      float v5 = "Left";
      if (a4) {
        float v5 = "Right";
      }
      BOOL darkMode = self->_darkMode;
      int v7 = "dark-CL3";
      int v8 = "light-CL3";
      break;
    case 'D':
      int v4 = NSString;
      float v5 = "Left";
      if (a4) {
        float v5 = "Right";
      }
      BOOL darkMode = self->_darkMode;
      int v7 = "dark-CL7";
      int v8 = "light-CL4";
      break;
    default:
      goto LABEL_17;
  }
LABEL_43:
  if (darkMode) {
    double v9 = v7;
  }
  else {
    double v9 = v8;
  }
  uint64_t v10 = objc_msgSend(v4, "stringWithFormat:", @"%s-FitTest-%s", v5, v9);

  return v10;
}

- (void)setCompletionHandler:(id)a3
{
  id v4 = a3;
  float v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Fit Test: Setting Completion Handler", v8, 2u);
  }

  float v6 = _Block_copy(v4);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v6;

  [(HPSDeviceAnalytics *)self->_deviceAnalytics updateFitTestValue:4 value:1];
}

- (void)callCompletionHandler
{
  float v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Fit Test: Call Completion Handler", v4, 2u);
  }

  (*((void (**)(void))self->_completionHandler + 2))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endFitTestTimestamp, 0);
  objc_storeStrong((id *)&self->_startFitTestTimestamp, 0);
  objc_storeStrong((id *)&self->_deviceAnalytics, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_resultDetailLabel, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_buttonImage, 0);
  objc_storeStrong((id *)&self->_rightBudResultLabel, 0);
  objc_storeStrong((id *)&self->_leftBudResultLabel, 0);
  objc_storeStrong((id *)&self->_rightBudLabelImageView, 0);
  objc_storeStrong((id *)&self->_rightBudLabel, 0);
  objc_storeStrong((id *)&self->_leftBudLabelImageView, 0);
  objc_storeStrong((id *)&self->_leftBudLabel, 0);
  objc_storeStrong((id *)&self->_rightImView, 0);
  objc_storeStrong((id *)&self->_leftImView, 0);
  objc_storeStrong((id *)&self->_stackViewImages, 0);
  objc_storeStrong((id *)&self->_fitTestContentView, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_avSystemController, 0);
  objc_storeStrong((id *)&self->_topSpacerConstraint, 0);
  objc_storeStrong((id *)&self->_debugCopyResultsButton, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_storeStrong((id *)&self->_fitTestController, 0);

  objc_storeStrong((id *)&self->currentDevice, 0);
}

- (void)initWithDevice:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4BFE000, v0, v1, "Fit Test: Failed to subscribe to AVSystemController notifications due to error: %@", v2, v3, v4, v5, v6);
}

- (void)initWithDevice:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __36__BTSFitTestController_startFitTest__block_invoke_133_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4BFE000, v0, v1, "Fit Test: Couldn't set session's audio category %@", v2, v3, v4, v5, v6);
}

void __36__BTSFitTestController_startFitTest__block_invoke_133_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4BFE000, v0, v1, "Fit Test: Unable to activate AVAudioSession : %@", v2, v3, v4, v5, v6);
}

void __36__BTSFitTestController_startFitTest__block_invoke_133_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sealValueChanged:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end