@interface HMFitTestController
- (BOOL)isCallActive;
- (BOOL)isDebugModeEnabled;
- (BOOL)isPreferredLanguageEnglish;
- (BOOL)isSmallScreenDevice;
- (BOOL)isiPad;
- (HMFitTestController)initWithDevice:(id)a3;
- (float)getConfidenceThreshold;
- (float)getSealThreshold;
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

@implementation HMFitTestController

- (HMFitTestController)initWithDevice:(id)a3
{
  v93[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (self)
  {
    id v90 = v5;
    v92.receiver = self;
    v92.super_class = (Class)HMFitTestController;
    self = [(HMFitTestController *)&v92 init];
    objc_storeStrong((id *)&self->currentDevice, a3);
    v6 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    fitTestContentView = self->_fitTestContentView;
    self->_fitTestContentView = v6;

    v8 = (UIStackView *)objc_alloc_init(MEMORY[0x263F82BF8]);
    stackViewImages = self->_stackViewImages;
    self->_stackViewImages = v8;

    v10 = (AVSystemController *)objc_alloc_init(MEMORY[0x263F544E0]);
    avSystemController = self->_avSystemController;
    self->_avSystemController = v10;

    self->_testActive = 0;
    self->_initialVolume = 0.0;
    self->_volumeModified = 0;
    v12 = [MEMORY[0x263F544E0] sharedAVSystemController];
    char v13 = [v12 getVolume:&self->_initialVolume forCategory:@"Audio/Video"];

    if ((v13 & 1) == 0) {
      NSLog(&cfstr_FitTestUnableT.isa);
    }
    NSLog(&cfstr_FitTestVolumeB.isa, self->_initialVolume);
    v14 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    spinner = self->_spinner;
    self->_spinner = v14;

    [(UIActivityIndicatorView *)self->_spinner setHidesWhenStopped:1];
    id v16 = objc_alloc(MEMORY[0x263F82E00]);
    double v17 = *MEMORY[0x263F001A8];
    double v18 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v19 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v20 = *(double *)(MEMORY[0x263F001A8] + 24);
    v21 = (UIView *)objc_msgSend(v16, "initWithFrame:", *MEMORY[0x263F001A8], v18, v19, v20);
    leftBudLabel = self->_leftBudLabel;
    self->_leftBudLabel = v21;

    v23 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v17, v18, v19, v20);
    rightBudLabel = self->_rightBudLabel;
    self->_rightBudLabel = v23;

    id v25 = objc_alloc(MEMORY[0x263F82828]);
    v26 = [MEMORY[0x263F827E8] systemImageNamed:@"left.circle.fill"];
    v27 = [MEMORY[0x263F825C8] systemGrayColor];
    v28 = [v26 imageWithTintColor:v27 renderingMode:1];
    v29 = (UIImageView *)[v25 initWithImage:v28];
    leftBudLabelImageView = self->_leftBudLabelImageView;
    self->_leftBudLabelImageView = v29;

    id v31 = objc_alloc(MEMORY[0x263F82828]);
    v32 = [MEMORY[0x263F827E8] systemImageNamed:@"right.circle.fill"];
    v33 = [MEMORY[0x263F825C8] systemGrayColor];
    v34 = [v32 imageWithTintColor:v33 renderingMode:1];
    v35 = (UIImageView *)[v31 initWithImage:v34];
    rightBudLabelImageView = self->_rightBudLabelImageView;
    self->_rightBudLabelImageView = v35;

    v37 = [MEMORY[0x263F827E8] systemImageNamed:@"play.fill"];
    buttonImage = self->_buttonImage;
    self->_buttonImage = v37;

    -[UIView setSize:](self->_leftBudLabel, "setSize:", 18.0, 18.0);
    [(UIView *)self->_leftBudLabel _setContinuousCornerRadius:9.0];
    v39 = [MEMORY[0x263F825C8] clearColor];
    [(UIView *)self->_leftBudLabel setBackgroundColor:v39];

    -[UIView setSize:](self->_rightBudLabel, "setSize:", 18.0, 18.0);
    [(UIView *)self->_rightBudLabel _setContinuousCornerRadius:9.0];
    v40 = [MEMORY[0x263F825C8] clearColor];
    [(UIView *)self->_rightBudLabel setBackgroundColor:v40];

    [(UIView *)self->_leftBudLabel addSubview:self->_leftBudLabelImageView];
    [(UIView *)self->_rightBudLabel addSubview:self->_rightBudLabelImageView];
    v41 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v17, v18, v19, v20);
    leftBudResultLabel = self->_leftBudResultLabel;
    self->_leftBudResultLabel = v41;

    v43 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v17, v18, v19, v20);
    rightBudResultLabel = self->_rightBudResultLabel;
    self->_rightBudResultLabel = v43;

    v45 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v17, v18, v19, v20);
    resultDetailLabel = self->_resultDetailLabel;
    self->_resultDetailLabel = v45;

    [(UILabel *)self->_leftBudResultLabel setText:&stru_2702152D0];
    v47 = [MEMORY[0x263F825C8] systemBlackColor];
    [(UILabel *)self->_leftBudResultLabel setTextColor:v47];

    [(UILabel *)self->_leftBudResultLabel setTextAlignment:1];
    [(UILabel *)self->_leftBudResultLabel setNumberOfLines:0];
    [(UILabel *)self->_leftBudResultLabel setLineBreakMode:0];
    uint64_t v48 = *MEMORY[0x263F83570];
    v49 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    [(UILabel *)self->_leftBudResultLabel setFont:v49];

    [(UILabel *)self->_leftBudResultLabel setAlpha:1.0];
    [(UILabel *)self->_rightBudResultLabel setText:&stru_2702152D0];
    v50 = [MEMORY[0x263F825C8] systemBlackColor];
    [(UILabel *)self->_rightBudResultLabel setTextColor:v50];

    [(UILabel *)self->_rightBudResultLabel setTextAlignment:1];
    [(UILabel *)self->_rightBudResultLabel setNumberOfLines:0];
    [(UILabel *)self->_rightBudResultLabel setLineBreakMode:0];
    v51 = [MEMORY[0x263F81708] preferredFontForTextStyle:v48];
    [(UILabel *)self->_rightBudResultLabel setFont:v51];

    [(UILabel *)self->_rightBudResultLabel setAlpha:1.0];
    [(UILabel *)self->_resultDetailLabel setText:&stru_2702152D0];
    v52 = [MEMORY[0x263F825C8] systemBlackColor];
    [(UILabel *)self->_resultDetailLabel setTextColor:v52];

    [(UILabel *)self->_resultDetailLabel setTextAlignment:1];
    [(UILabel *)self->_resultDetailLabel setNumberOfLines:0];
    [(UILabel *)self->_resultDetailLabel setLineBreakMode:0];
    v53 = [MEMORY[0x263F81708] preferredFontForTextStyle:v48];
    [(UILabel *)self->_resultDetailLabel setFont:v53];

    [(UILabel *)self->_resultDetailLabel setAlpha:1.0];
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0;

    if (self->_darkMode) {
      v55 = "dark";
    }
    else {
      v55 = "light";
    }
    uint64_t v56 = objc_msgSend(NSString, "stringWithFormat:", @"FitTest-Left-%s", v55);
    if (self->_darkMode) {
      v57 = "dark";
    }
    else {
      v57 = "light";
    }
    v58 = objc_msgSend(NSString, "stringWithFormat:", @"FitTest-Right-%s", v57);
    v59 = (void *)MEMORY[0x263F827E8];
    v60 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v89 = (void *)v56;
    v61 = [v59 imageNamed:v56 inBundle:v60 compatibleWithTraitCollection:0];

    v62 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v61];
    leftImView = self->_leftImView;
    self->_leftImView = v62;

    v64 = (void *)MEMORY[0x263F827E8];
    v65 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v66 = [v64 imageNamed:v58 inBundle:v65 compatibleWithTraitCollection:0];

    v67 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v66];
    rightImView = self->_rightImView;
    self->_rightImView = v67;

    v69 = [(HMFitTestController *)self traitCollection];
    self->_darkMode = [v69 userInterfaceStyle] == 2;

    v70 = [MEMORY[0x263F08A00] defaultCenter];
    [v70 addObserver:self selector:sel_inEarStatusChanged_ name:*MEMORY[0x263F2B8D0] object:0];

    v71 = [MEMORY[0x263F08A00] defaultCenter];
    [v71 addObserver:self selector:sel_sealValueChanged_ name:*MEMORY[0x263F2B8D8] object:0];

    v72 = [MEMORY[0x263F08A00] defaultCenter];
    [v72 addObserver:self selector:sel_deviceDisconnectedHandler_ name:*MEMORY[0x263F2B910] object:0];

    v73 = [MEMORY[0x263F08A00] defaultCenter];
    [v73 addObserver:self selector:sel_powerChangedHandler_ name:*MEMORY[0x263F2B8E8] object:0];

    v74 = [MEMORY[0x263F08A00] defaultCenter];
    [v74 addObserver:self selector:sel_applicationDidBecomeActive_ name:*MEMORY[0x263F83318] object:0];

    v75 = [MEMORY[0x263F08A00] defaultCenter];
    [v75 addObserver:self selector:sel_applicationDidEnterBackground_ name:*MEMORY[0x263F83330] object:0];

    v76 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v77 = *MEMORY[0x263EF90A0];
    v78 = [MEMORY[0x263EF93E0] sharedInstance];
    [v76 addObserver:self selector:sel_handleAudioSessionInterruption_ name:v77 object:v78];

    v79 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v80 = *MEMORY[0x263F54470];
    uint64_t v81 = [MEMORY[0x263EF93E0] sharedInstance];
    [v79 addObserver:self selector:sel_handleMediaServerConnectionDied_ name:v80 object:v81];

    v82 = [MEMORY[0x263F544E0] sharedAVSystemController];
    v83 = (void *)MEMORY[0x263F54348];
    v93[0] = *MEMORY[0x263F54348];
    v84 = [MEMORY[0x263EFF8C0] arrayWithObjects:v93 count:1];
    uint64_t v85 = *MEMORY[0x263F544A0];
    id v91 = 0;
    LOBYTE(v81) = [v82 setAttribute:v84 forKey:v85 error:&v91];
    id v86 = v91;

    if (v81)
    {
      NSLog(&cfstr_FitTestSuccess.isa);
      v87 = [MEMORY[0x263F08A00] defaultCenter];
      [v87 addObserver:self selector:sel_handleCallIsActiveDidChangeNotification_ name:*v83 object:0];
    }
    else
    {
      NSLog(&cfstr_FitTestFailedT.isa, v86);
    }

    id v5 = v90;
  }

  return self;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
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
  v19.super_class = (Class)HMFitTestController;
  [(HMFitTestController *)&v19 dealloc];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)HMFitTestController;
  [(HMFitTestController *)&v6 viewDidLoad];
  v3 = [(HMFitTestController *)self navigationItem];
  [v3 setHidesBackButton:1];

  v4 = [(HMFitTestController *)self view];
  id v5 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v4 setBackgroundColor:v5];

  [(UIView *)self->_fitTestContentView sizeToFit];
}

- (void)viewWillLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)HMFitTestController;
  [(HMFitTestController *)&v10 viewWillLayoutSubviews];
  [(OBTrayButton *)self->_playButton bounds];
  double v4 = v3 * 0.25;
  id v5 = [(OBTrayButton *)self->_playButton layer];
  [v5 setCornerRadius:v4];

  [(OBTrayButton *)self->_playButton bounds];
  double v7 = v6 * 0.25;
  v8 = [(OBLinkTrayButton *)self->_debugCopyResultsButton layer];
  [v8 setCornerRadius:v7];

  [(HMFitTestController *)self setupConstraints];
  v9 = [(HMFitTestController *)self view];
  [v9 layoutIfNeeded];
}

- (void)loadView
{
  v33.receiver = self;
  v33.super_class = (Class)HMFitTestController;
  [(HMFitTestController *)&v33 loadView];
  double v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v4 = [v3 localizedStringForKey:@"Ear Tip Fit Test" value:&stru_2702152D0 table:0];

  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v6 = [v5 localizedStringForKey:@"Place AirPods in both ears so they’re comfortable and secure, then press play to test fit.\n\nFor best results, complete ear tip fit test in a quiet environment.", &stru_2702152D0, 0 value table];

  double v7 = (OBWelcomeController *)[objc_alloc(MEMORY[0x263F5B918]) initWithTitle:v4 detailText:v6 icon:0 contentLayout:2];
  fitTestController = self->_fitTestController;
  self->_fitTestController = v7;

  v9 = [(HMFitTestController *)self view];
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v18 = [(OBWelcomeController *)self->_fitTestController view];
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  objc_super v19 = [(OBWelcomeController *)self->_fitTestController view];
  [v19 setAutoresizingMask:18];

  [(HMFitTestController *)self setupFitTestContentView];
  double v20 = [MEMORY[0x263F5B898] boldButton];
  playButton = self->_playButton;
  self->_playButton = v20;

  [(OBTrayButton *)self->_playButton setTitle:&stru_2702152D0 forState:0];
  v22 = self->_playButton;
  v23 = [(UIImage *)self->_buttonImage imageWithRenderingMode:2];
  [(OBTrayButton *)v22 setImage:v23 forState:0];

  [(OBTrayButton *)self->_playButton setClipsToBounds:1];
  v24 = [(OBTrayButton *)self->_playButton layer];
  [v24 setMasksToBounds:1];

  [(HMFitTestController *)self updateFitTestActiveState];
  [(OBTrayButton *)self->_playButton addTarget:self action:sel_startFitTest forControlEvents:64];
  [(OBTrayButton *)self->_playButton setUserInteractionEnabled:1];
  id v25 = self->_playButton;
  v26 = [MEMORY[0x263F825C8] systemBlueColor];
  [(OBTrayButton *)v25 setBackgroundColor:v26];

  v27 = [(OBWelcomeController *)self->_fitTestController buttonTray];
  [v27 addButton:self->_playButton];

  if ([(HMFitTestController *)self isDebugModeEnabled])
  {
    v28 = [MEMORY[0x263F5B8D0] linkButton];
    debugCopyResultsButton = self->_debugCopyResultsButton;
    self->_debugCopyResultsButton = v28;

    [(OBLinkTrayButton *)self->_debugCopyResultsButton setTitle:@"Copy Results" forState:0];
    [(OBLinkTrayButton *)self->_debugCopyResultsButton setClipsToBounds:1];
    v30 = [(OBLinkTrayButton *)self->_debugCopyResultsButton layer];
    [v30 setMasksToBounds:1];

    [(OBLinkTrayButton *)self->_debugCopyResultsButton addTarget:self action:sel_copyToClipboard forControlEvents:64];
    [(OBLinkTrayButton *)self->_debugCopyResultsButton setUserInteractionEnabled:1];
  }
  [(HMFitTestController *)self addChildViewController:self->_fitTestController];
  id v31 = [(HMFitTestController *)self view];
  v32 = [(OBWelcomeController *)self->_fitTestController view];
  [v31 addSubview:v32];
}

- (void)copyToClipboard
{
  id v4 = [MEMORY[0x263F82A18] generalPasteboard];
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
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  -[UIImageView setFrame:](self->_leftBudLabelImageView, "setFrame:", *MEMORY[0x263F001A8], v4, 22.0, 22.0);
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
  id v10 = objc_alloc_init(MEMORY[0x263F82E00]);
  double v7 = [v10 widthAnchor];
  v8 = [v7 constraintEqualToConstant:40.0];
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

  double v7 = [MEMORY[0x263F82438] sharedApplication];
  v8 = [v7 preferredContentSizeCategory];

  v97 = v8;
  BOOL v9 = ([v8 isEqualToString:*MEMORY[0x263F83488]] & 1) == 0
    && ([v8 isEqualToString:*MEMORY[0x263F83470]] & 1) == 0
    && ![v8 isEqualToString:*MEMORY[0x263F83468]];
  id v10 = [(HMFitTestController *)self view];
  [v10 bounds];
  double v12 = v11;

  if ([(HMFitTestController *)self isSmallScreenDevice])
  {
    double v13 = [(HMFitTestController *)self view];
    [v13 bounds];
    double v15 = v14 * 0.35;
  }
  else
  {
    double v15 = v12 * 0.3;
  }
  if ([(HMFitTestController *)self isiPad])
  {
    double v16 = [(UIStackView *)self->_stackViewImages topAnchor];
    double v17 = [(OBWelcomeController *)self->_fitTestController headerView];
    double v18 = [v17 bottomAnchor];
    objc_super v19 = [v16 constraintEqualToAnchor:v18 constant:35.0];
    topSpacerConstraint = self->_topSpacerConstraint;
    self->_topSpacerConstraint = v19;
  }
  else
  {
    v21 = [(HMFitTestController *)self view];
    [v21 size];
    double v23 = v22;
    v24 = [(HMFitTestController *)self view];
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
    v28 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    topSpacerConstraint = self->_topSpacerConstraint;
    self->_topSpacerConstraint = v28;
  }

  v30 = [(HMFitTestController *)self traitCollection];
  id v31 = [v30 preferredContentSizeCategory];
  if ((v9 | UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v31)))
  {
  }
  else
  {
    BOOL v32 = [(HMFitTestController *)self isPreferredLanguageEnglish];

    if (v32)
    {
      objc_super v33 = [(OBWelcomeController *)self->_fitTestController contentView];
      v34 = [v33 heightAnchor];
      v35 = [v34 constraintGreaterThanOrEqualToConstant:403.0];
      [v98 addObject:v35];

      [v98 addObject:self->_topSpacerConstraint];
      goto LABEL_19;
    }
  }
  v36 = [(OBWelcomeController *)self->_fitTestController contentView];
  v37 = [v36 heightAnchor];
  v38 = [v37 constraintGreaterThanOrEqualToConstant:403.0];
  [v98 addObject:v38];

  v39 = [(UIStackView *)self->_stackViewImages topAnchor];
  v40 = [(OBWelcomeController *)self->_fitTestController headerView];
  v41 = [v40 bottomAnchor];
  v42 = [v39 constraintEqualToAnchor:v41 constant:100.0];
  [v98 addObject:v42];

LABEL_19:
  v43 = [(UIStackView *)self->_stackViewImages centerXAnchor];
  v44 = [(OBWelcomeController *)self->_fitTestController contentView];
  v45 = [v44 centerXAnchor];
  v46 = [v43 constraintEqualToAnchor:v45];
  [v98 addObject:v46];

  v47 = [(UILabel *)self->_leftBudResultLabel topAnchor];
  uint64_t v48 = [(UIView *)self->_leftBudLabel bottomAnchor];
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

  uint64_t v56 = [(UILabel *)self->_rightBudResultLabel centerXAnchor];
  v57 = [(UIView *)self->_rightBudLabel centerXAnchor];
  v58 = [v56 constraintEqualToAnchor:v57];
  [v98 addObject:v58];

  v59 = [(UIView *)self->_leftBudLabel widthAnchor];
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

  v71 = [(UILabel *)self->_resultDetailLabel topAnchor];
  v72 = [(UILabel *)self->_leftBudResultLabel bottomAnchor];
  v73 = [v71 constraintGreaterThanOrEqualToAnchor:v72 constant:1.0];
  [v98 addObject:v73];

  v74 = [(UILabel *)self->_resultDetailLabel topAnchor];
  v75 = [(UILabel *)self->_rightBudResultLabel bottomAnchor];
  v76 = [v74 constraintGreaterThanOrEqualToAnchor:v75 constant:1.0];
  [v98 addObject:v76];

  uint64_t v77 = [(UILabel *)self->_resultDetailLabel leadingAnchor];
  v78 = [(OBWelcomeController *)self->_fitTestController headerView];
  v79 = [v78 leadingAnchor];
  uint64_t v80 = [v77 constraintEqualToAnchor:v79];
  [v98 addObject:v80];

  uint64_t v81 = [(UILabel *)self->_resultDetailLabel trailingAnchor];
  v82 = [(OBWelcomeController *)self->_fitTestController headerView];
  v83 = [v82 trailingAnchor];
  v84 = [v81 constraintEqualToAnchor:v83];
  [v98 addObject:v84];

  uint64_t v85 = [(UIView *)self->_leftBudLabel topAnchor];
  id v86 = [(UIImageView *)self->_leftImView bottomAnchor];
  v87 = [v85 constraintEqualToAnchor:v86 constant:20.0];
  [v98 addObject:v87];

  v88 = [(UIView *)self->_rightBudLabel topAnchor];
  v89 = [(UIImageView *)self->_rightImView bottomAnchor];
  id v90 = [v88 constraintEqualToAnchor:v89 constant:20.0];
  [v98 addObject:v90];

  id v91 = [(UIView *)self->_leftBudLabel leftAnchor];
  objc_super v92 = [(UIStackView *)self->_stackViewImages leftAnchor];
  v93 = [v91 constraintEqualToAnchor:v92 constant:62.0];
  [v98 addObject:v93];

  v94 = [(UIView *)self->_rightBudLabel rightAnchor];
  v95 = [(UIStackView *)self->_stackViewImages rightAnchor];
  v96 = [v94 constraintEqualToAnchor:v95 constant:-62.0];
  [v98 addObject:v96];

  [MEMORY[0x263F08938] activateConstraints:v98];
}

- (void)startFitTest
{
  BOOL callActive = self->_callActive;
  if (self->_budsInEar)
  {
    if (!self->_callActive)
    {
      [(HMFitTestController *)self setCancelAction];
      [(HMFitTestController *)self removeDoneButton];
      NSLog(&cfstr_FitTestStartFi.isa);
      double v14 = [MEMORY[0x263EFF910] date];
      startFitTestTimestamp = self->_startFitTestTimestamp;
      self->_startFitTestTimestamp = v14;

      [(OBTrayButton *)self->_playButton setUserInteractionEnabled:0];
      [(BluetoothDevice *)self->currentDevice SendSetupCommand:1];
      double v16 = [(OBWelcomeController *)self->_fitTestController headerView];
      double v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      double v18 = [v17 localizedStringForKey:@"Do Not Remove AirPods" value:&stru_2702152D0 table:0];

      [v16 setTitle:v18];
      [v16 setDetailText:&stru_2702152D0];
      objc_super v19 = [(HMFitTestController *)self view];
      [v19 setNeedsLayout];

      [(UILabel *)self->_leftBudResultLabel setText:&stru_2702152D0];
      [(UILabel *)self->_rightBudResultLabel setText:&stru_2702152D0];
      [(UILabel *)self->_resultDetailLabel setText:&stru_2702152D0];
      [(UIActivityIndicatorView *)self->_spinner setActivityIndicatorViewStyle:101];
      spinner = self->_spinner;
      v21 = [MEMORY[0x263F825C8] systemWhiteColor];
      [(UIActivityIndicatorView *)spinner setColor:v21];

      double v22 = [MEMORY[0x263F825C8] systemWhiteColor];
      [(UIActivityIndicatorView *)self->_spinner setTintColor:v22];

      [(UIActivityIndicatorView *)self->_spinner startAnimating];
      [(OBTrayButton *)self->_playButton bounds];
      double v24 = v23 * 0.5;
      [(OBTrayButton *)self->_playButton bounds];
      -[UIActivityIndicatorView setCenter:](self->_spinner, "setCenter:", v24, v25 * 0.5);
      double v26 = [(OBTrayButton *)self->_playButton imageView];
      [v26 setHidden:1];

      [(OBTrayButton *)self->_playButton addSubview:self->_spinner];
      v27 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __35__HMFitTestController_startFitTest__block_invoke_2;
      block[3] = &unk_265364210;
      block[4] = self;
      dispatch_async(v27, block);

      return;
    }
    BOOL callActive = 1;
  }
  NSLog(&cfstr_FitTestBudsine.isa, a2, self->_budsInEar, callActive);
  BOOL budsInEar = self->_budsInEar;
  double v5 = (void *)MEMORY[0x263F82418];
  double v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v7 = v6;
  if (budsInEar) {
    v8 = @"End Call To Continue Test";
  }
  else {
    v8 = @"Place AirPods In Both Ears";
  }
  BOOL v9 = [v6 localizedStringForKey:v8 value:&stru_2702152D0 table:0];
  id v28 = [v5 alertControllerWithTitle:v9 message:&stru_2702152D0 preferredStyle:1];

  id v10 = (void *)MEMORY[0x263F82400];
  double v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v12 = [v11 localizedStringForKey:@"OK" value:&stru_2702152D0 table:0];
  double v13 = [v10 actionWithTitle:v12 style:0 handler:&__block_literal_global_1];
  [v28 addAction:v13];

  [(HMFitTestController *)self presentViewController:v28 animated:1 completion:0];
}

void __35__HMFitTestController_startFitTest__block_invoke()
{
}

void __35__HMFitTestController_startFitTest__block_invoke_2(uint64_t a1)
{
  float v22 = 0.0;
  unsigned int v2 = [MEMORY[0x263F544E0] sharedAVSystemController];
  char v3 = [v2 getVolume:&v22 forCategory:@"Audio/Video"];

  if (v3)
  {
    NSLog(&cfstr_FitTestCurrent.isa, v22);
    *(float *)&double v4 = v22;
    if (v22 < 0.5)
    {
      NSLog(&cfstr_FitTestIncreas.isa, v4);
      double v5 = [MEMORY[0x263F544E0] sharedAVSystemController];
      LODWORD(v6) = 0.5;
      [v5 setVolumeTo:@"Audio/Video" forCategory:v6];

      *(unsigned char *)(*(void *)(a1 + 32) + 1140) = 1;
    }
  }
  else
  {
    NSLog(&cfstr_FitTestUnableT_0.isa);
  }
  double v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 pathForResource:@"E+D-US_ML" ofType:@"wav"];

  BOOL v9 = [NSURL fileURLWithPath:v8];
  id v10 = [MEMORY[0x263EF93E0] sharedInstance];
  id v21 = 0;
  [v10 setActive:1 error:&v21];
  id v11 = v21;

  if (v11) {
    NSLog(&cfstr_FitTestUnableT_1.isa, v11);
  }
  double v12 = [MEMORY[0x263EF93E0] sharedInstance];
  uint64_t v13 = *MEMORY[0x263EF9060];
  id v20 = v11;
  [v12 setCategory:v13 error:&v20];
  id v14 = v20;

  if (v14)
  {
    NSLog(&cfstr_FitTestCouldnT.isa, v14);

    id v15 = 0;
  }
  else
  {
    id v19 = 0;
    uint64_t v16 = [objc_alloc(MEMORY[0x263EF93B8]) initWithContentsOfURL:v9 error:&v19];
    id v15 = v19;
    uint64_t v17 = *(void *)(a1 + 32);
    double v18 = *(void **)(v17 + 1024);
    *(void *)(v17 + 1024) = v16;

    [*(id *)(*(void *)(a1 + 32) + 1024) setNumberOfLoops:5];
    [*(id *)(*(void *)(a1 + 32) + 1024) prepareToPlay];
    [*(id *)(*(void *)(a1 + 32) + 1024) play];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 1137) = 1;
}

- (void)setCancelAction
{
  char v3 = [(HMFitTestController *)self navigationItem];
  [v3 setLeftBarButtonItems:0 animated:1];

  id v5 = (id)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_dismissFitTest];
  double v4 = [(HMFitTestController *)self navigationItem];
  [v4 setLeftBarButtonItem:v5];
}

- (void)removeDoneButton
{
  id v2 = [(HMFitTestController *)self navigationItem];
  [v2 setRightBarButtonItem:0 animated:1];
}

- (void)dismissFitTest
{
  [(HMFitTestController *)self cleanupAudio];
  [(HMFitTestController *)self resetVolume];
  if (!self->_completionHandler)
  {
    [(HMFitTestController *)self dismissViewControllerAnimated:1 completion:&__block_literal_global_166];
  }
}

- (void)inEarStatusChanged:(id)a3
{
  id v12 = [a3 object];
  double v4 = [v12 objectForKeyedSubscript:@"primaryInEarStatus"];
  id v5 = [v12 objectForKeyedSubscript:@"secondaryInEarStatus"];
  double v6 = [v12 objectForKeyedSubscript:@"device"];
  double v7 = [v6 address];
  v8 = [(BluetoothDevice *)self->currentDevice address];

  if (v7 == v8)
  {
    int v9 = [v4 BOOLValue];
    unsigned int v10 = (v9 | [v5 BOOLValue]) ^ 1;
    NSLog(&cfstr_FitTestPrimary.isa, v4, v5, v10);
    int budsInEar = self->_budsInEar;
    self->_int budsInEar = v10;
    if (budsInEar == v10)
    {
      NSLog(&cfstr_FitTestNoChang.isa);
    }
    else
    {
      NSLog(&cfstr_FitTestUpdateU.isa);
      if (self->_testActive) {
        [(HMFitTestController *)self fitTestStopped];
      }
    }
  }
}

- (void)sealValueChanged:(id)a3
{
  id v4 = a3;
  if (!self->_testActive)
  {
    NSLog(&cfstr_FitTestDiscard.isa);
    goto LABEL_37;
  }
  id v5 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_dismissFitTest];
  double v6 = [(HMFitTestController *)self navigationItem];
  [v6 setLeftBarButtonItems:0 animated:1];

  double v7 = [(HMFitTestController *)self navigationItem];
  [v7 setRightBarButtonItem:v5];

  v8 = [v4 object];
  int v9 = [v8 objectForKeyedSubscript:@"sealLeft"];
  unsigned int v10 = [v8 objectForKeyedSubscript:@"sealRight"];
  [v9 floatValue];
  float v12 = v11;
  [v10 floatValue];
  float v14 = v13;
  NSLog(&cfstr_FitTestLeftsea.isa, v12);
  NSLog(&cfstr_FitTestRightse.isa, v14);
  id v15 = [v8 objectForKeyedSubscript:@"confidenceLeft"];
  uint64_t v16 = [v8 objectForKeyedSubscript:@"confidenceRight"];
  [v15 floatValue];
  float v18 = v17;
  [v16 floatValue];
  float v20 = v19;
  NSLog(&cfstr_FitTestConfide.isa, v18);
  NSLog(&cfstr_FitTestConfide_0.isa, v20);
  [(HMFitTestController *)self fitTestStopped];
  id v21 = [(OBWelcomeController *)self->_fitTestController headerView];
  [(HMFitTestController *)self getConfidenceThreshold];
  v53 = v9;
  v52 = v15;
  if (v18 < v22 || v20 < v22)
  {
    NSLog(&cfstr_FitTestConfide_1.isa);
    id v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    float v29 = [v28 localizedStringForKey:@"Unable to Complete Ear Tip Fit Test" value:&stru_2702152D0 table:0];
    [v21 setTitle:v29];

    v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v31 = [v30 localizedStringForKey:@"Make sure to find a quiet location and remain still during ear tip fit test." value:&stru_2702152D0 table:0];
    [v21 setDetailText:v31];

    [(HMFitTestController *)self setupConstraints];
    BOOL v32 = [(HMFitTestController *)self view];
    [v32 setNeedsLayout];

    objc_super v33 = [(HMFitTestController *)self view];
    [v33 layoutIfNeeded];
LABEL_33:

    goto LABEL_34;
  }
  [(HMFitTestController *)self getSealThreshold];
  float v24 = v23;
  double v25 = (void *)MEMORY[0x263F82E00];
  if (v12 < v23)
  {
    double v26 = v62;
    v62[0] = MEMORY[0x263EF8330];
    v62[1] = 3221225472;
    v27 = __40__HMFitTestController_sealValueChanged___block_invoke;
  }
  else
  {
    double v26 = v61;
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v27 = __40__HMFitTestController_sealValueChanged___block_invoke_2;
  }
  BOOL v34 = v12 < v23;
  v26[2] = v27;
  v26[3] = &unk_265364210;
  v26[4] = self;
  objc_msgSend(v25, "animateWithDuration:animations:", 0.5);
  v35 = (void *)MEMORY[0x263F82E00];
  if (v14 < v24)
  {
    v36 = v60;
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v37 = __40__HMFitTestController_sealValueChanged___block_invoke_3;
  }
  else
  {
    v36 = v59;
    v59[0] = MEMORY[0x263EF8330];
    v59[1] = 3221225472;
    v37 = __40__HMFitTestController_sealValueChanged___block_invoke_4;
  }
  v36[2] = v37;
  v36[3] = &unk_265364210;
  v36[4] = self;
  objc_msgSend(v35, "animateWithDuration:animations:", 0.5);
  v38 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v39 = [v38 localizedStringForKey:@"Ear Tip Fit Results" value:&stru_2702152D0 table:0];
  [v21 setTitle:v39];

  char v40 = v14 < v24 || v34;
  if ((v40 & 1) == 0)
  {
    v43 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v44 = [v43 localizedStringForKey:@"The ear tips you’re using are a good fit for both ears." value:&stru_2702152D0 table:0];
    [v21 setDetailText:v44];

    if (self->_completionHandler)
    {
      playButton = self->_playButton;
      v46 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v47 = [v46 localizedStringForKey:@"Continue" value:&stru_2702152D0 table:0];
      [(OBTrayButton *)playButton setTitle:v47 forState:0];

      uint64_t v48 = [(OBTrayButton *)self->_playButton imageView];
      [v48 setHidden:1];

      [(OBTrayButton *)self->_playButton removeTarget:self action:sel_startFitTest forControlEvents:64];
      [(OBTrayButton *)self->_playButton addTarget:self action:sel_callCompletionHandler forControlEvents:64];
    }
    goto LABEL_34;
  }
  if (v12 < v24 && v14 < v24)
  {
    v41 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    objc_super v33 = v41;
    v42 = @"Adjust both AirPods in your ears, or try another ear tip size and run the test again.\n\nYou should use the ear tips that are most comfortable in each ear.";
LABEL_32:
    v51 = [v41 localizedStringForKey:v42 value:&stru_2702152D0 table:0];
    [v21 setDetailText:v51];

    goto LABEL_33;
  }
  char v49 = v14 >= v24 || v34;
  if ((v49 & 1) == 0)
  {
    v41 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    objc_super v33 = v41;
    v42 = @"Try adjusting the right AirPod in your ear, or change the ear tip size and try the test again.\n\nYou should use the ear tip that is most comfortable in each ear.";
    goto LABEL_32;
  }
  if (v12 < v24 && v14 >= v24)
  {
    v41 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    objc_super v33 = v41;
    v42 = @"Try adjusting the left AirPod in your ear, or change the ear tip size and try the test again.\n\nYou should use the ear tip that is most comfortable in each ear.";
    goto LABEL_32;
  }
  NSLog(&cfstr_FitTestLeftsea_0.isa, v12 >= v24, v12 < v24, v14 >= v24, v14 < v24);
LABEL_34:
  if ([(HMFitTestController *)self isDebugModeEnabled])
  {
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __40__HMFitTestController_sealValueChanged___block_invoke_5;
    v54[3] = &unk_265364238;
    v54[4] = self;
    float v55 = v12;
    float v56 = v18;
    float v57 = v14;
    float v58 = v20;
    [MEMORY[0x263F82E00] animateWithDuration:v54 animations:0.5];
  }

LABEL_37:
}

void __40__HMFitTestController_sealValueChanged___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F827E8] systemImageNamed:@"left.circle.fill"];
  char v3 = [MEMORY[0x263F825C8] systemYellowColor];
  id v4 = [v2 imageWithTintColor:v3 renderingMode:1];
  [*(id *)(*(void *)(a1 + 32) + 1072) setImage:v4];

  id v5 = [MEMORY[0x263F825C8] systemYellowColor];
  [*(id *)(*(void *)(a1 + 32) + 1096) setTextColor:v5];

  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v6 = [v7 localizedStringForKey:@"Adjust or Try\n a Different\n Ear Tip" value:&stru_2702152D0 table:0];
  [*(id *)(*(void *)(a1 + 32) + 1096) setText:v6];
}

void __40__HMFitTestController_sealValueChanged___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F827E8] systemImageNamed:@"left.circle.fill"];
  char v3 = [MEMORY[0x263F825C8] systemGreenColor];
  id v4 = [v2 imageWithTintColor:v3 renderingMode:1];
  [*(id *)(*(void *)(a1 + 32) + 1072) setImage:v4];

  id v5 = [MEMORY[0x263F825C8] systemGreenColor];
  [*(id *)(*(void *)(a1 + 32) + 1096) setTextColor:v5];

  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v6 = [v7 localizedStringForKey:@"Good Seal" value:&stru_2702152D0 table:0];
  [*(id *)(*(void *)(a1 + 32) + 1096) setText:v6];
}

void __40__HMFitTestController_sealValueChanged___block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x263F827E8] systemImageNamed:@"right.circle.fill"];
  char v3 = [MEMORY[0x263F825C8] systemYellowColor];
  id v4 = [v2 imageWithTintColor:v3 renderingMode:1];
  [*(id *)(*(void *)(a1 + 32) + 1088) setImage:v4];

  id v5 = [MEMORY[0x263F825C8] systemYellowColor];
  [*(id *)(*(void *)(a1 + 32) + 1104) setTextColor:v5];

  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v6 = [v7 localizedStringForKey:@"Adjust or Try\n a Different\n Ear Tip" value:&stru_2702152D0 table:0];
  [*(id *)(*(void *)(a1 + 32) + 1104) setText:v6];
}

void __40__HMFitTestController_sealValueChanged___block_invoke_4(uint64_t a1)
{
  id v2 = [MEMORY[0x263F827E8] systemImageNamed:@"right.circle.fill"];
  char v3 = [MEMORY[0x263F825C8] systemGreenColor];
  id v4 = [v2 imageWithTintColor:v3 renderingMode:1];
  [*(id *)(*(void *)(a1 + 32) + 1088) setImage:v4];

  id v5 = [MEMORY[0x263F825C8] systemGreenColor];
  [*(id *)(*(void *)(a1 + 32) + 1104) setTextColor:v5];

  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v6 = [v7 localizedStringForKey:@"Good Seal" value:&stru_2702152D0 table:0];
  [*(id *)(*(void *)(a1 + 32) + 1104) setText:v6];
}

void __40__HMFitTestController_sealValueChanged___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 984) buttonTray];
  [v2 addButton:*(void *)(*(void *)(a1 + 32) + 1000)];

  char v3 = [MEMORY[0x263F825C8] systemGreenColor];
  [*(id *)(*(void *)(a1 + 32) + 1128) setTextColor:v3];

  id v4 = [NSString stringWithFormat:@"\nLeft Seal : %.2f  Confidence : %.2f\nRight Seal : %.2f  Confidence : %.2f", *(float *)(a1 + 40), *(float *)(a1 + 44), *(float *)(a1 + 48), *(float *)(a1 + 52)];
  [*(id *)(*(void *)(a1 + 32) + 1128) setText:v4];
}

- (void)fitTestStopped
{
  self->_testActive = 0;
  char v3 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__HMFitTestController_fitTestStopped__block_invoke;
  block[3] = &unk_265364210;
  block[4] = self;
  dispatch_async(v3, block);

  [(UIActivityIndicatorView *)self->_spinner stopAnimating];
  [(UIActivityIndicatorView *)self->_spinner setHidden:1];
  [(OBTrayButton *)self->_playButton setUserInteractionEnabled:1];
  id v4 = [(OBTrayButton *)self->_playButton imageView];
  [v4 setHidden:0];

  id v5 = [(OBWelcomeController *)self->_fitTestController headerView];
  double v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"Ear Tip Fit Test" value:&stru_2702152D0 table:0];
  [v5 setTitle:v7];

  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v9 = [v8 localizedStringForKey:@"Place AirPods in both ears so they’re comfortable and secure, then press play to test fit.\n\nFor best results, complete ear tip fit test in a quiet environment.", &stru_2702152D0, 0 value table];

  [v5 setDetailText:v9];
}

uint64_t __37__HMFitTestController_fitTestStopped__block_invoke(uint64_t a1)
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
    [(HMFitTestController *)self dismissFitTest];
  }
}

- (void)powerChangedHandler:(id)a3
{
  id v4 = (void *)MEMORY[0x263F2B998];
  id v5 = a3;
  id v6 = [v4 sharedInstance];
  int v7 = [v6 enabled];

  v8 = [v5 name];

  int v9 = "off";
  if (v7) {
    int v9 = "on";
  }
  NSLog(&cfstr_FitTestReceive.isa, v8, v9);

  [(HMFitTestController *)self dismissFitTest];
}

- (void)handleCallIsActiveDidChangeNotification:(id)a3
{
  int callActive = self->_callActive;
  int v5 = [(HMFitTestController *)self isCallActive];
  self->_int callActive = [(HMFitTestController *)self isCallActive];
  if (callActive == v5) {
    NSLog(&cfstr_FitTestNoChang_0.isa);
  }
  else {
    NSLog(&cfstr_FitTestUpdateU_0.isa);
  }
}

- (void)handleAudioSessionInterruption:(id)a3
{
  id v6 = [a3 userInfo];
  id v4 = [v6 objectForKey:*MEMORY[0x263EF90C8]];
  uint64_t v5 = [v4 unsignedIntegerValue];

  if (v5 == 1)
  {
    NSLog(&cfstr_FitTestAudioSe.isa, self->_testActive);
    if (self->_testActive) {
      [(HMFitTestController *)self fitTestStopped];
    }
  }
}

- (void)handleMediaServerConnectionDied:(id)a3
{
  NSLog(&cfstr_FitTestAudioSe_0.isa, a2, a3);
  avSystemController = self->_avSystemController;
  self->_avSystemController = 0;
}

- (void)updateFitTestActiveState
{
  uint64_t v3 = 0x300000003;
  [(BluetoothDevice *)self->currentDevice inEarStatusPrimary:(char *)&v3 + 4 secondary:&v3];
  self->_int budsInEar = v3 == 0;
  self->_int callActive = [(HMFitTestController *)self isCallActive];
}

- (void)resetVolume
{
  if (self->_volumeModified)
  {
    float initialVolume = self->_initialVolume;
    if (initialVolume <= 0.5)
    {
      NSLog(&cfstr_FitTestCleanup.isa, a2, initialVolume);
      id v4 = [MEMORY[0x263F544E0] sharedAVSystemController];
      *(float *)&double v5 = self->_initialVolume;
      [v4 setVolumeTo:@"Audio/Video" forCategory:v5];

      self->_volumeModified = 0;
    }
  }
}

- (void)cleanupAudio
{
  NSLog(&cfstr_FitTestCleanUp.isa, a2);
  [(AVAudioPlayer *)self->_player setVolume:0.0 fadeDuration:1.0];
  uint64_t v3 = [MEMORY[0x263EF93E0] sharedInstance];
  id v5 = 0;
  [v3 setActive:0 withOptions:1 error:&v5];
  id v4 = v5;

  if (v4) {
    NSLog(&cfstr_FitTestFailedT_0.isa, v4);
  }
}

- (BOOL)isCallActive
{
  id v2 = [MEMORY[0x263F544E0] sharedAVSystemController];
  uint64_t v3 = [v2 attributeForKey:*MEMORY[0x263F54340]];

  unsigned int v4 = [v3 BOOLValue];
  LOBYTE(v2) = v4;
  NSLog(&cfstr_FitTestCallIsA.isa, v4);

  return (char)v2;
}

- (BOOL)isPreferredLanguageEnglish
{
  id v2 = [MEMORY[0x263EFF960] preferredLanguages];
  uint64_t v3 = [v2 firstObject];
  if ([v3 isEqualToString:@"en"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 hasPrefix:@"en-"];
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
  int v3 = [(BluetoothDevice *)self->currentDevice productId];
  if (v3 == 8228 || (float result = -5.0, v3 == 8212))
  {
    if (self->_completionHandler)
    {
      NSLog(&cfstr_FitTestGetseal.isa);
      return 6.0;
    }
    else
    {
      return 0.0;
    }
  }
  return result;
}

- (float)getConfidenceThreshold
{
  int v2 = [(BluetoothDevice *)self->currentDevice productId];
  float result = 10.0;
  if (((v2 - 8212) & 0xFFFFFFEF) == 0) {
    return -3.0;
  }
  return result;
}

- (void)setCompletionHandler:(id)a3
{
  id v4 = a3;
  NSLog(&cfstr_FitTestSetting.isa);
  id v5 = _Block_copy(v4);

  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v5;
}

- (void)callCompletionHandler
{
  NSLog(&cfstr_FitTestCallCom.isa, a2);
  int v3 = (void (*)(void))*((void *)self->_completionHandler + 2);
  v3();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endFitTestTimestamp, 0);
  objc_storeStrong((id *)&self->_startFitTestTimestamp, 0);
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

@end