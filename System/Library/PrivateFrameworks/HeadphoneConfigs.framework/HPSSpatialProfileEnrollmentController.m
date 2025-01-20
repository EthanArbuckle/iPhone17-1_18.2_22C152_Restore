@interface HPSSpatialProfileEnrollmentController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (BOOL)checkAndShowInEarPopup;
- (BOOL)isEarMovingFast;
- (BOOL)isEarOccluded;
- (BOOL)isEarTooClose;
- (BOOL)isEarTooFar;
- (BOOL)isPresentingWrongEar;
- (BOOL)pillsFilled;
- (HPSSpatialProfileEnrollmentController)init;
- (id)angleArrayToBinaryString:(id)a3;
- (id)dismissalHandler;
- (id)getBudsInEarString;
- (int)state;
- (void)alertEarDistanceWarning:(int)a3;
- (void)alertEarEnrollWarning;
- (void)alertOcclusionWarning;
- (void)bluetoothDidBecomeAvailable;
- (void)cancelBlur;
- (void)cancelSpatialAudioProfile;
- (void)captureViewTimerDidFire;
- (void)checkVolume;
- (void)cleanUpSpinner;
- (void)clearBoundingBox;
- (void)continueButtonTapped;
- (void)continueEarDistanceWarning;
- (void)continueOcclusionWarning;
- (void)didReceiveCaptureVideo:(id)a3 colorImage:(id)a4 depthImage:(id)a5 faceObject:(id)a6;
- (void)didReceiveStateUpdateForSession:(id)a3 stateInfo:(id)a4;
- (void)earCentralPartCaptured;
- (void)earLeftPartCaptured;
- (void)earRightPartCaptured;
- (void)fillFacePillsByDirection:(int)a3;
- (void)forceBlur;
- (void)hideContinueButton;
- (void)hideEarDistanceWarningContinueButton;
- (void)hideEarPillsDots;
- (void)hideOcclusionContinueButton;
- (void)moveToStep:(int)a3;
- (void)nudgeEar;
- (void)pauseEnrollment;
- (void)playEarCaptureSoundWithCompletion:(id)a3;
- (void)prepareSpinner;
- (void)pulseEarBoundingBox;
- (void)resetVolume;
- (void)restartOcclusionWarnCoolDownTimer;
- (void)resumeEnrollment;
- (void)retrieveProfile;
- (void)sendTipKitSignal;
- (void)setDismissalHandler:(id)a3;
- (void)setPillsFilled:(BOOL)a3;
- (void)setupAudioVideo;
- (void)setupEarBoundingBox;
- (void)setupEarTutorialView;
- (void)setupEnrollController;
- (void)setupEnrollViewUI;
- (void)setupWelcomeContentView;
- (void)showBudsInEarPopUp:(id)a3;
- (void)showContinueButton;
- (void)showEarDistanceWarningContinueButton;
- (void)showEarPillsDots;
- (void)showLandscapeAlert;
- (void)showOcclusionContinueButton;
- (void)startCaptureViewTimer;
- (void)startEarDistanceWarnCoolDownTimer;
- (void)startEarEnrollWarningTimer;
- (void)startEarEnrollmentNudgeTimer;
- (void)startEnrollGuidanceTimer;
- (void)startEnrollment;
- (void)startFaceInFrameHandlerTimer;
- (void)startOcclusionWarnCoolDownTimer;
- (void)startPostProcessSpinner;
- (void)startPostProcessTimer;
- (void)startTutorialResumeEnrollTimer;
- (void)startWelcomeSpinner;
- (void)stopCaptureViewTimer;
- (void)stopEarDistanceWarnCoolDownTimer;
- (void)stopEarEnrollmentNudgeTimer;
- (void)stopEnrollGuidanceTimer;
- (void)stopEnrollment;
- (void)stopFaceInFrameHandlerTimer;
- (void)stopOcclusionWarnCoolDownTimer;
- (void)stopPostProcessSpinner;
- (void)stopPostProcessTimer;
- (void)stopTimers;
- (void)stopTutorialResumeEnrollTimer;
- (void)stopWelcomeSpinner;
- (void)syncProfile;
- (void)translateEarBoundingBox:(CGRect)a3 previewLayerBoundingBox:(CGRect)a4;
- (void)triggerEarDistanceWarnCoolDownTimer;
- (void)triggerEarEnrollmentNudgeTimer;
- (void)triggerEnrollGuidanceTimer;
- (void)triggerFaceInFrameHandlerTimeout;
- (void)triggerOcclusionWarnCoolDownTimer;
- (void)triggerPostProcessTimeout;
- (void)triggerstartEarEnrollWarningTimer;
- (void)tutorialResumeEnrollTimerDidFire;
- (void)updateBoundingBoxHiddenStatus;
- (void)updateCurrentTrackingEar:(id)a3 rightEarPoseStatus:(id)a4 earBoundingBox:(CGRect)a5 earStatus:(int)a6;
- (void)updateEarEnrollText;
- (void)updateFaceTrackingStatus:(CGRect)a3;
- (void)userCancelEnrollment;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HPSSpatialProfileEnrollmentController

- (HPSSpatialProfileEnrollmentController)init
{
  if (!self) {
    return 0;
  }
  v41.receiver = self;
  v41.super_class = (Class)HPSSpatialProfileEnrollmentController;
  v2 = [(HPSSpatialProfileEnrollmentController *)&v41 init];
  uint64_t v3 = [MEMORY[0x1E4F50B70] sharedInstance];
  v4 = (void *)*((void *)v2 + 175);
  *((void *)v2 + 175) = v3;

  v2[1408] = 0;
  v2[1409] = 0;
  v2[1410] = 0;
  v5 = (void *)*((void *)v2 + 136);
  *((void *)v2 + 136) = 0;

  v6 = (void *)*((void *)v2 + 129);
  *((void *)v2 + 129) = 0;

  v7 = (void *)*((void *)v2 + 130);
  *((void *)v2 + 130) = 0;

  v8 = (void *)*((void *)v2 + 131);
  *((void *)v2 + 131) = 0;

  v9 = (void *)*((void *)v2 + 143);
  *((void *)v2 + 143) = 0;

  v10 = (void *)*((void *)v2 + 141);
  *((void *)v2 + 141) = 0;

  *((_DWORD *)v2 + 309) = 0;
  *((_DWORD *)v2 + 310) = 0;
  v11 = (void *)*((void *)v2 + 161);
  *((void *)v2 + 161) = 0;

  v2[1301] = 0;
  v2[1302] = 0;
  v2[1303] = 0;
  v2[1304] = 0;
  v2[1305] = 0;
  v2[1216] = 0;
  v2[1217] = 0;
  *((_DWORD *)v2 + 324) = 0;
  v2[1300] = 0;
  *((void *)v2 + 164) = 0;
  v2[1336] = 0;
  v2[1337] = 0;
  v2[1338] = 0;
  v2[1339] = 0;
  v2[1340] = 0;
  v2[1341] = 0;
  v2[1342] = 0;
  *((_DWORD *)v2 + 330) = 0;
  v2[1343] = 0;
  v2[1344] = 0;
  v2[1345] = 0;
  v2[1346] = 0;
  v2[1347] = 0;
  v2[1348] = 0;
  v2[1349] = 0;
  v2[1350] = 0;
  *((_DWORD *)v2 + 338) = 0;
  v2[1356] = 0;
  v2[1357] = 0;
  v2[1358] = 0;
  v2[1359] = 0;
  v2[1360] = 0;
  v2[1361] = 0;
  v2[1362] = 0;
  v2[1364] = 0;
  v2[1363] = 0;
  *((_DWORD *)v2 + 342) = 0;
  v2[1392] = 0;
  *((_DWORD *)v2 + 343) = 0;
  v2[1496] = 0;
  v2[1497] = 0;
  v12 = (void *)*((void *)v2 + 188);
  *((void *)v2 + 188) = 0;

  v13 = (void *)*((void *)v2 + 189);
  *((void *)v2 + 189) = 0;

  v2[1411] = 0;
  v2[1424] = 0;
  v2[1425] = 10;
  *(_OWORD *)(v2 + 1448) = 0u;
  *(_OWORD *)(v2 + 1464) = 0u;
  v2[1426] = 0;
  v2[1444] = 0;
  v2[1427] = 0;
  v2[1440] = 0;
  v2[1441] = 0;
  v2[1442] = 0;
  v2[1443] = 0;
  *((void *)v2 + 186) = 0;
  v14 = (void *)*((void *)v2 + 185);
  *((void *)v2 + 185) = 0;

  *((void *)v2 + 190) = 0xC059000000000000;
  *((void *)v2 + 191) = 0xC059000000000000;
  *((void *)v2 + 192) = 0xC059000000000000;
  *((void *)v2 + 193) = 0xC059000000000000;
  *((void *)v2 + 195) = 0x3FE0000000000000;
  *((void *)v2 + 196) = 0xC059000000000000;
  *((void *)v2 + 197) = 0xC059000000000000;
  v15 = (void *)*((void *)v2 + 198);
  *((void *)v2 + 198) = 0;

  dispatch_queue_t v16 = dispatch_queue_create("com.apple.HeadphoneSettings.stepSerialQueue", 0);
  v17 = (void *)*((void *)v2 + 172);
  *((void *)v2 + 172) = v16;

  dispatch_queue_t v18 = dispatch_queue_create("com.apple.HeadphoneSettings.visualDetectionQueue", 0);
  v19 = (void *)*((void *)v2 + 173);
  *((void *)v2 + 173) = v18;

  *((void *)v2 + 156) = 0;
  id v20 = objc_alloc(MEMORY[0x1E4F1C978]);
  v21 = [NSNumber numberWithDouble:30.0];
  v22 = [NSNumber numberWithDouble:25.0];
  v23 = [NSNumber numberWithDouble:20.0];
  v24 = [NSNumber numberWithDouble:15.0];
  v25 = [NSNumber numberWithDouble:10.0];
  v26 = [NSNumber numberWithDouble:5.0];
  uint64_t v27 = objc_msgSend(v20, "initWithObjects:", v21, v22, v23, v24, v25, v26, 0);
  v28 = (void *)*((void *)v2 + 199);
  *((void *)v2 + 199) = v27;

  id v29 = objc_alloc(MEMORY[0x1E4F1C978]);
  v30 = [NSNumber numberWithDouble:0.5];
  v31 = [NSNumber numberWithDouble:1.0];
  v32 = [NSNumber numberWithDouble:1.5];
  v33 = [NSNumber numberWithDouble:2.0];
  v34 = [NSNumber numberWithDouble:2.5];
  v35 = [NSNumber numberWithDouble:3.0];
  uint64_t v36 = objc_msgSend(v29, "initWithObjects:", v30, v31, v32, v33, v34, v35, 0);
  v37 = (void *)*((void *)v2 + 200);
  *((void *)v2 + 200) = v36;

  v38 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v38 addObserver:v2 selector:sel_cancelSpatialAudioProfile name:*MEMORY[0x1E4FB2640] object:0];

  v39 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v39 addObserver:v2 selector:sel_bluetoothDidBecomeAvailable name:*MEMORY[0x1E4F50AE8] object:0];

  return (HPSSpatialProfileEnrollmentController *)v2;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)HPSSpatialProfileEnrollmentController;
  [(HPSSpatialProfileEnrollmentController *)&v9 viewDidLoad];
  uint64_t v3 = [(HPSSpatialProfileEnrollmentController *)self view];
  [v3 size];
  double v5 = v4;
  v6 = [(HPSSpatialProfileEnrollmentController *)self view];
  [v6 size];
  double v8 = v7;

  if (v5 <= v8)
  {
    [(HPSSpatialProfileEnrollmentController *)self setupEnrollController];
    [(HPSSpatialProfileEnrollmentController *)self setupWelcomeContentView];
    [(HPSSpatialProfileEnrollmentController *)self setupAudioVideo];
    [(HPSSpatialProfileEnrollmentController *)self setupEarTutorialView];
    [(HPSSpatialProfileEnrollmentController *)self setupEarBoundingBox];
    [(HPSSpatialProfileEnrollmentController *)self moveToStep:0];
  }
  else
  {
    [(HPSSpatialProfileEnrollmentController *)self showLandscapeAlert];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HPSSpatialProfileEnrollmentController;
  [(HPSSpatialProfileEnrollmentController *)&v3 viewDidAppear:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  double v4 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Enrollment Controller viewDidDisappear", v5, 2u);
  }

  [(HPSSpatialProfileEnrollmentController *)self cancelSpatialAudioProfile];
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setupEnrollController
{
  v235[47] = *MEMORY[0x1E4F143B8];
  if (!self->_enrollmentSession)
  {
    objc_super v3 = (HRTFEnrollmentSession *)objc_alloc_init(MEMORY[0x1E4F655B0]);
    enrollmentSession = self->_enrollmentSession;
    self->_enrollmentSession = v3;

    [(HRTFEnrollmentSession *)self->_enrollmentSession setDelegate:self];
  }
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_userCancelEnrollment];
  v6 = [(HPSSpatialProfileEnrollmentController *)self navigationItem];
  v229 = (void *)v5;
  [v6 setLeftBarButtonItem:v5];

  double v7 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  double v8 = [(HPSSpatialProfileEnrollmentController *)self view];
  [v8 setBackgroundColor:v7];

  id v9 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  double v10 = *MEMORY[0x1E4F1DB28];
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v14 = (UIView *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], v11, v12, v13);
  enrollContentView = self->_enrollContentView;
  self->_enrollContentView = v14;

  [(UIView *)self->_enrollContentView setTranslatesAutoresizingMaskIntoConstraints:0];
  dispatch_queue_t v16 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v10, v11, v12, v13);
  scrollContentView = self->_scrollContentView;
  self->_scrollContentView = v16;

  [(UIView *)self->_scrollContentView setTranslatesAutoresizingMaskIntoConstraints:0];
  dispatch_queue_t v18 = (UIScrollView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1BE0]), "initWithFrame:", v10, v11, v12, v13);
  scrollView = self->_scrollView;
  self->_scrollView = v18;

  [(UIScrollView *)self->_scrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v20 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  scrollInnerContentView = self->_scrollInnerContentView;
  self->_scrollInnerContentView = v20;

  [(UIView *)self->_scrollInnerContentView setTranslatesAutoresizingMaskIntoConstraints:0];
  v22 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
  scrollInnerStackView = self->_scrollInnerStackView;
  self->_scrollInnerStackView = v22;

  [(UIStackView *)self->_scrollInnerStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_scrollInnerStackView setAxis:1];
  [(UIStackView *)self->_scrollInnerStackView setAlignment:3];
  [(UIStackView *)self->_scrollInnerStackView setDistribution:3];
  id v24 = objc_alloc(MEMORY[0x1E4F83AA0]);
  v25 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v26 = [v25 localizedStringForKey:@"SPATIAL_AUDIO_PROFILE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  uint64_t v27 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v28 = [v27 localizedStringForKey:@"SPATIAL_AUDIO_PROFILE_DETAIL" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  id v29 = (OBHeaderView *)[v24 initWithTitle:v26 detailText:v28 icon:0];
  infoView = self->_infoView;
  self->_infoView = v29;

  [(OBHeaderView *)self->_infoView setTranslatesAutoresizingMaskIntoConstraints:0];
  v31 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  learnMoreView = self->_learnMoreView;
  self->_learnMoreView = v31;

  [(UILabel *)self->_learnMoreView setTranslatesAutoresizingMaskIntoConstraints:0];
  v33 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v34 = [v33 localizedStringForKey:@"WELCOME_DETAIL" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [(UILabel *)self->_learnMoreView setText:v34];

  [(UILabel *)self->_learnMoreView setLineBreakMode:0];
  [(UILabel *)self->_learnMoreView setNumberOfLines:0];
  v35 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  [(UILabel *)self->_learnMoreView setFont:v35];

  [(UILabel *)self->_learnMoreView setAdjustsFontForContentSizeCategory:1];
  uint64_t v36 = [MEMORY[0x1E4FB1618] systemGrayColor];
  [(UILabel *)self->_learnMoreView setTextColor:v36];

  [(UILabel *)self->_learnMoreView setTextAlignment:1];
  v37 = [MEMORY[0x1E4F83A80] boldButton];
  continueButton = self->_continueButton;
  self->_continueButton = v37;

  v39 = self->_continueButton;
  v40 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v41 = [v40 localizedStringForKey:@"CONTINUE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [(OBTrayButton *)v39 setTitle:v41 forState:0];

  [(OBTrayButton *)self->_continueButton addTarget:self action:sel_continueButtonTapped forControlEvents:64];
  v42 = [MEMORY[0x1E4F83A80] boldButton];
  occlusionContinueButton = self->_occlusionContinueButton;
  self->_occlusionContinueButton = v42;

  v44 = self->_occlusionContinueButton;
  v45 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v46 = [v45 localizedStringForKey:@"CONTINUE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [(OBTrayButton *)v44 setTitle:v46 forState:0];

  [(OBTrayButton *)self->_occlusionContinueButton addTarget:self action:sel_continueOcclusionWarning forControlEvents:64];
  v47 = [MEMORY[0x1E4F83A80] boldButton];
  earDistanceWarnContinueButton = self->_earDistanceWarnContinueButton;
  self->_earDistanceWarnContinueButton = v47;

  v49 = self->_earDistanceWarnContinueButton;
  v50 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v51 = [v50 localizedStringForKey:@"CONTINUE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [(OBTrayButton *)v49 setTitle:v51 forState:0];

  [(OBTrayButton *)self->_earDistanceWarnContinueButton addTarget:self action:sel_continueEarDistanceWarning forControlEvents:64];
  id v52 = objc_alloc(MEMORY[0x1E4FB1F00]);
  v53 = [MEMORY[0x1E4FB14C8] effectWithStyle:6];
  v54 = (UIVisualEffectView *)[v52 initWithEffect:v53];
  buttonTrayEffectView = self->_buttonTrayEffectView;
  self->_buttonTrayEffectView = v54;

  [(UIVisualEffectView *)self->_buttonTrayEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
  v56 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  spacerViewFirst = self->_spacerViewFirst;
  self->_spacerViewFirst = v56;

  [(UIView *)self->_spacerViewFirst setTranslatesAutoresizingMaskIntoConstraints:0];
  v58 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  spacerViewSecond = self->_spacerViewSecond;
  self->_spacerViewSecond = v58;

  [(UIView *)self->_spacerViewSecond setTranslatesAutoresizingMaskIntoConstraints:0];
  if (self->_debugMode)
  {
    v60 = [(UIView *)self->_enrollContentView layer];
    [v60 setBorderWidth:1.0];

    id v61 = [MEMORY[0x1E4FB1618] systemRedColor];
    uint64_t v62 = [v61 CGColor];
    v63 = [(UIView *)self->_enrollContentView layer];
    [v63 setBorderColor:v62];

    v64 = [(UIView *)self->_scrollContentView layer];
    [v64 setBorderWidth:1.0];

    id v65 = [MEMORY[0x1E4FB1618] systemBlueColor];
    uint64_t v66 = [v65 CGColor];
    v67 = [(UIView *)self->_scrollContentView layer];
    [v67 setBorderColor:v66];

    v68 = [(UIScrollView *)self->_scrollView layer];
    [v68 setBorderWidth:1.0];

    id v69 = [MEMORY[0x1E4FB1618] systemYellowColor];
    uint64_t v70 = [v69 CGColor];
    v71 = [(UIScrollView *)self->_scrollView layer];
    [v71 setBorderColor:v70];

    v72 = [(OBHeaderView *)self->_infoView layer];
    [v72 setBorderWidth:2.0];

    id v73 = [MEMORY[0x1E4FB1618] systemGreenColor];
    uint64_t v74 = [v73 CGColor];
    v75 = [(OBHeaderView *)self->_infoView layer];
    [v75 setBorderColor:v74];

    v76 = [(UIVisualEffectView *)self->_buttonTrayEffectView layer];
    [v76 setBorderWidth:2.0];

    id v77 = [MEMORY[0x1E4FB1618] systemGrayColor];
    uint64_t v78 = [v77 CGColor];
    v79 = [(UIVisualEffectView *)self->_buttonTrayEffectView layer];
    [v79 setBorderColor:v78];
  }
  v80 = [(HPSSpatialProfileEnrollmentController *)self view];
  [v80 addSubview:self->_enrollContentView];

  v81 = [(HPSSpatialProfileEnrollmentController *)self view];
  [v81 addSubview:self->_scrollContentView];

  [(UIView *)self->_scrollContentView addSubview:self->_scrollView];
  [(UIView *)self->_scrollContentView addSubview:self->_buttonTrayEffectView];
  [(UIView *)self->_scrollContentView addSubview:self->_continueButton];
  [(UIView *)self->_scrollContentView addSubview:self->_occlusionContinueButton];
  [(UIView *)self->_scrollContentView addSubview:self->_earDistanceWarnContinueButton];
  [(UIScrollView *)self->_scrollView addSubview:self->_scrollInnerContentView];
  [(UIView *)self->_scrollInnerContentView addSubview:self->_scrollInnerStackView];
  [(UIStackView *)self->_scrollInnerStackView addArrangedSubview:self->_infoView];
  [(UIStackView *)self->_scrollInnerStackView addArrangedSubview:self->_spacerViewFirst];
  [(UIStackView *)self->_scrollInnerStackView addArrangedSubview:self->_learnMoreView];
  [(UIStackView *)self->_scrollInnerStackView addArrangedSubview:self->_spacerViewSecond];
  [(HPSSpatialProfileEnrollmentController *)self hideOcclusionContinueButton];
  [(HPSSpatialProfileEnrollmentController *)self hideEarDistanceWarningContinueButton];
  v168 = (void *)MEMORY[0x1E4F28DC8];
  v227 = [(UIView *)self->_enrollContentView topAnchor];
  v228 = [(HPSSpatialProfileEnrollmentController *)self view];
  v226 = [v228 safeAreaLayoutGuide];
  v225 = [v226 topAnchor];
  v224 = [v227 constraintEqualToAnchor:v225];
  v235[0] = v224;
  v222 = [(UIView *)self->_enrollContentView heightAnchor];
  v223 = [(HPSSpatialProfileEnrollmentController *)self view];
  [v223 frame];
  v221 = [v222 constraintEqualToConstant:v82];
  v235[1] = v221;
  v219 = [(UIView *)self->_enrollContentView leadingAnchor];
  v220 = [(HPSSpatialProfileEnrollmentController *)self view];
  v218 = [v220 leadingAnchor];
  v217 = [v219 constraintEqualToAnchor:v218];
  v235[2] = v217;
  v215 = [(UIView *)self->_enrollContentView trailingAnchor];
  v216 = [(HPSSpatialProfileEnrollmentController *)self view];
  v214 = [v216 trailingAnchor];
  v213 = [v215 constraintEqualToAnchor:v214];
  v235[3] = v213;
  v212 = [(UIView *)self->_scrollContentView topAnchor];
  v230 = [(UIView *)self->_enrollContentView bottomAnchor];
  v211 = [v212 constraintEqualToAnchor:v230 constant:24.0];
  v235[4] = v211;
  v209 = [(UIView *)self->_scrollContentView leadingAnchor];
  v210 = [(HPSSpatialProfileEnrollmentController *)self view];
  v208 = [v210 leadingAnchor];
  v207 = [v209 constraintEqualToAnchor:v208 constant:24.0];
  v235[5] = v207;
  v205 = [(UIView *)self->_scrollContentView trailingAnchor];
  v206 = [(HPSSpatialProfileEnrollmentController *)self view];
  v204 = [v206 trailingAnchor];
  v203 = [v205 constraintEqualToAnchor:v204 constant:-24.0];
  v235[6] = v203;
  v201 = [(UIView *)self->_scrollContentView bottomAnchor];
  v202 = [(HPSSpatialProfileEnrollmentController *)self view];
  v200 = [v202 safeAreaLayoutGuide];
  v199 = [v200 bottomAnchor];
  v198 = [v201 constraintEqualToAnchor:v199];
  v235[7] = v198;
  v197 = [(OBTrayButton *)self->_continueButton leadingAnchor];
  v196 = [(UIView *)self->_scrollContentView leadingAnchor];
  v195 = [v197 constraintEqualToAnchor:v196];
  v235[8] = v195;
  v194 = [(OBTrayButton *)self->_continueButton trailingAnchor];
  v193 = [(UIView *)self->_scrollContentView trailingAnchor];
  v192 = [v194 constraintEqualToAnchor:v193];
  v235[9] = v192;
  v191 = [(OBTrayButton *)self->_continueButton bottomAnchor];
  v190 = [(UIView *)self->_scrollContentView bottomAnchor];
  v189 = [v191 constraintEqualToAnchor:v190];
  v235[10] = v189;
  v188 = [(OBTrayButton *)self->_occlusionContinueButton leadingAnchor];
  v187 = [(UIView *)self->_scrollContentView leadingAnchor];
  v186 = [v188 constraintEqualToAnchor:v187];
  v235[11] = v186;
  v185 = [(OBTrayButton *)self->_occlusionContinueButton trailingAnchor];
  v184 = [(UIView *)self->_scrollContentView trailingAnchor];
  v183 = [v185 constraintEqualToAnchor:v184];
  v235[12] = v183;
  v182 = [(OBTrayButton *)self->_occlusionContinueButton bottomAnchor];
  v181 = [(UIView *)self->_scrollContentView bottomAnchor];
  v179 = [v182 constraintEqualToAnchor:v181];
  v235[13] = v179;
  v178 = [(OBTrayButton *)self->_earDistanceWarnContinueButton leadingAnchor];
  v177 = [(UIView *)self->_scrollContentView leadingAnchor];
  v176 = [v178 constraintEqualToAnchor:v177];
  v235[14] = v176;
  v175 = [(OBTrayButton *)self->_earDistanceWarnContinueButton trailingAnchor];
  v174 = [(UIView *)self->_scrollContentView trailingAnchor];
  v173 = [v175 constraintEqualToAnchor:v174];
  v235[15] = v173;
  v171 = [(OBTrayButton *)self->_earDistanceWarnContinueButton bottomAnchor];
  v170 = [(UIView *)self->_scrollContentView bottomAnchor];
  v169 = [v171 constraintEqualToAnchor:v170];
  v235[16] = v169;
  v166 = [(UIVisualEffectView *)self->_buttonTrayEffectView leadingAnchor];
  v167 = [(HPSSpatialProfileEnrollmentController *)self view];
  v165 = [v167 leadingAnchor];
  v164 = [v166 constraintEqualToAnchor:v165];
  v235[17] = v164;
  v162 = [(UIVisualEffectView *)self->_buttonTrayEffectView trailingAnchor];
  v163 = [(HPSSpatialProfileEnrollmentController *)self view];
  v161 = [v163 trailingAnchor];
  v160 = [v162 constraintEqualToAnchor:v161];
  v235[18] = v160;
  v159 = [(UIVisualEffectView *)self->_buttonTrayEffectView topAnchor];
  v180 = [(OBTrayButton *)self->_continueButton topAnchor];
  v158 = [v159 constraintEqualToAnchor:v180 constant:-24.0];
  v235[19] = v158;
  v157 = [(UIVisualEffectView *)self->_buttonTrayEffectView topAnchor];
  v156 = [(OBTrayButton *)self->_occlusionContinueButton topAnchor];
  v155 = [v157 constraintEqualToAnchor:v156 constant:-24.0];
  v235[20] = v155;
  v154 = [(UIVisualEffectView *)self->_buttonTrayEffectView topAnchor];
  v172 = [(OBTrayButton *)self->_earDistanceWarnContinueButton topAnchor];
  v153 = [v154 constraintEqualToAnchor:v172 constant:-24.0];
  v235[21] = v153;
  v151 = [(UIVisualEffectView *)self->_buttonTrayEffectView bottomAnchor];
  v152 = [(HPSSpatialProfileEnrollmentController *)self view];
  v150 = [v152 bottomAnchor];
  v149 = [v151 constraintEqualToAnchor:v150];
  v235[22] = v149;
  v148 = [(UIScrollView *)self->_scrollView topAnchor];
  v147 = [(UIView *)self->_scrollContentView topAnchor];
  v146 = [v148 constraintEqualToAnchor:v147];
  v235[23] = v146;
  v145 = [(UIScrollView *)self->_scrollView bottomAnchor];
  v144 = [(UIVisualEffectView *)self->_buttonTrayEffectView topAnchor];
  v143 = [v145 constraintEqualToAnchor:v144 constant:24.0];
  v235[24] = v143;
  v142 = [(UIScrollView *)self->_scrollView leadingAnchor];
  v141 = [(UIView *)self->_scrollContentView leadingAnchor];
  v140 = [v142 constraintEqualToAnchor:v141];
  v235[25] = v140;
  v139 = [(UIScrollView *)self->_scrollView trailingAnchor];
  v138 = [(UIView *)self->_scrollContentView trailingAnchor];
  v137 = [v139 constraintEqualToAnchor:v138];
  v235[26] = v137;
  v136 = [(UIView *)self->_scrollInnerContentView topAnchor];
  v135 = [(UIScrollView *)self->_scrollView topAnchor];
  v134 = [v136 constraintEqualToAnchor:v135];
  v235[27] = v134;
  v133 = [(UIView *)self->_scrollInnerContentView bottomAnchor];
  v132 = [(UIScrollView *)self->_scrollView bottomAnchor];
  v131 = [v133 constraintEqualToAnchor:v132];
  v235[28] = v131;
  v130 = [(UIView *)self->_scrollInnerContentView leadingAnchor];
  v129 = [(UIScrollView *)self->_scrollView leadingAnchor];
  v128 = [v130 constraintEqualToAnchor:v129];
  v235[29] = v128;
  v127 = [(UIView *)self->_scrollInnerContentView trailingAnchor];
  v126 = [(UIScrollView *)self->_scrollView trailingAnchor];
  v125 = [v127 constraintEqualToAnchor:v126];
  v235[30] = v125;
  v232 = [(UIView *)self->_scrollInnerContentView widthAnchor];
  v124 = [(UIScrollView *)self->_scrollView widthAnchor];
  v123 = [v232 constraintEqualToAnchor:v124];
  v235[31] = v123;
  v122 = [(UIStackView *)self->_scrollInnerStackView topAnchor];
  v121 = [(UIScrollView *)self->_scrollView topAnchor];
  v120 = [v122 constraintEqualToAnchor:v121];
  v235[32] = v120;
  v119 = [(UIStackView *)self->_scrollInnerStackView bottomAnchor];
  v118 = [(UIScrollView *)self->_scrollView bottomAnchor];
  v117 = [v119 constraintEqualToAnchor:v118];
  v235[33] = v117;
  v116 = [(UIStackView *)self->_scrollInnerStackView leadingAnchor];
  v115 = [(UIScrollView *)self->_scrollView leadingAnchor];
  v114 = [v116 constraintEqualToAnchor:v115];
  v235[34] = v114;
  v113 = [(UIStackView *)self->_scrollInnerStackView trailingAnchor];
  v112 = [(UIScrollView *)self->_scrollView trailingAnchor];
  v111 = [v113 constraintEqualToAnchor:v112];
  v235[35] = v111;
  v110 = [(OBHeaderView *)self->_infoView leadingAnchor];
  v109 = [(UIStackView *)self->_scrollInnerStackView leadingAnchor];
  v108 = [v110 constraintEqualToAnchor:v109];
  v235[36] = v108;
  v234 = [(OBHeaderView *)self->_infoView trailingAnchor];
  v107 = [(UIStackView *)self->_scrollInnerStackView trailingAnchor];
  v106 = [v234 constraintEqualToAnchor:v107];
  v235[37] = v106;
  v105 = [(UILabel *)self->_learnMoreView leadingAnchor];
  v104 = [(UIStackView *)self->_scrollInnerStackView leadingAnchor];
  v103 = [v105 constraintEqualToAnchor:v104];
  v235[38] = v103;
  v102 = [(UILabel *)self->_learnMoreView trailingAnchor];
  v101 = [(UIStackView *)self->_scrollInnerStackView trailingAnchor];
  v100 = [v102 constraintEqualToAnchor:v101];
  v235[39] = v100;
  v233 = [(UILabel *)self->_learnMoreView heightAnchor];
  v99 = [v233 constraintGreaterThanOrEqualToConstant:50.0];
  v235[40] = v99;
  v98 = [(UIView *)self->_spacerViewFirst leadingAnchor];
  v97 = [(UIStackView *)self->_scrollInnerStackView leadingAnchor];
  v96 = [v98 constraintEqualToAnchor:v97];
  v235[41] = v96;
  v95 = [(UIView *)self->_spacerViewFirst trailingAnchor];
  v94 = [(UIStackView *)self->_scrollInnerStackView trailingAnchor];
  v93 = [v95 constraintEqualToAnchor:v94];
  v235[42] = v93;
  v231 = [(UIView *)self->_spacerViewFirst heightAnchor];
  v83 = [v231 constraintEqualToConstant:24.0];
  v235[43] = v83;
  v84 = [(UIView *)self->_spacerViewSecond leadingAnchor];
  v85 = [(UIStackView *)self->_scrollInnerStackView leadingAnchor];
  v86 = [v84 constraintEqualToAnchor:v85];
  v235[44] = v86;
  v87 = [(UIView *)self->_spacerViewSecond trailingAnchor];
  v88 = [(UIStackView *)self->_scrollInnerStackView trailingAnchor];
  v89 = [v87 constraintEqualToAnchor:v88];
  v235[45] = v89;
  v90 = [(UIView *)self->_spacerViewSecond heightAnchor];
  v91 = [v90 constraintEqualToConstant:24.0];
  v235[46] = v91;
  v92 = [MEMORY[0x1E4F1C978] arrayWithObjects:v235 count:47];
  [v168 activateConstraints:v92];
}

- (void)setupWelcomeContentView
{
  v34[8] = *MEMORY[0x1E4F143B8];
  objc_super v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  welcomeContentView = self->_welcomeContentView;
  self->_welcomeContentView = v3;

  [(UIView *)self->_welcomeContentView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_enrollContentView addSubview:self->_welcomeContentView];
  uint64_t v5 = (void *)MEMORY[0x1E4FB1818];
  v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v33 = [v5 imageNamed:@"SpatialProfileIcon" inBundle:v6 compatibleWithTraitCollection:0];

  double v7 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v33];
  welcomeImageView = self->_welcomeImageView;
  self->_welcomeImageView = v7;

  [(UIImageView *)self->_welcomeImageView setContentMode:1];
  [(UIImageView *)self->_welcomeImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_welcomeContentView addSubview:self->_welcomeImageView];
  v23 = (void *)MEMORY[0x1E4F28DC8];
  v32 = [(UIView *)self->_welcomeContentView leadingAnchor];
  v31 = [(UIView *)self->_enrollContentView leadingAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v34[0] = v30;
  id v29 = [(UIView *)self->_welcomeContentView trailingAnchor];
  v28 = [(UIView *)self->_enrollContentView trailingAnchor];
  uint64_t v27 = [v29 constraintEqualToAnchor:v28];
  v34[1] = v27;
  v26 = [(UIView *)self->_welcomeContentView topAnchor];
  v25 = [(UIView *)self->_enrollContentView topAnchor];
  id v24 = [v26 constraintEqualToAnchor:v25];
  v34[2] = v24;
  v22 = [(UIView *)self->_welcomeContentView bottomAnchor];
  v21 = [(UIView *)self->_enrollContentView bottomAnchor];
  id v20 = [v22 constraintEqualToAnchor:v21];
  v34[3] = v20;
  v19 = [(UIImageView *)self->_welcomeImageView widthAnchor];
  id v9 = [v19 constraintEqualToConstant:240.0];
  v34[4] = v9;
  double v10 = [(UIImageView *)self->_welcomeImageView heightAnchor];
  double v11 = [v10 constraintEqualToConstant:240.0];
  v34[5] = v11;
  double v12 = [(UIImageView *)self->_welcomeImageView centerXAnchor];
  double v13 = [(UIView *)self->_welcomeContentView centerXAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v34[6] = v14;
  v15 = [(UIImageView *)self->_welcomeImageView centerYAnchor];
  dispatch_queue_t v16 = [(UIView *)self->_welcomeContentView centerYAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  v34[7] = v17;
  dispatch_queue_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:8];
  [v23 activateConstraints:v18];
}

- (void)setupAudioVideo
{
  objc_super v3 = objc_alloc_init(HPSSpatialProfileSoundHapticManager);
  soundHapticManager = self->_soundHapticManager;
  self->_soundHapticManager = v3;

  [(HPSSpatialProfileSoundHapticManager *)self->_soundHapticManager start];
  uint64_t v5 = objc_alloc_init(HPSSpatialProfileVideoCaptureSession);
  videoCaptureSession = self->videoCaptureSession;
  self->videoCaptureSession = v5;

  [(HPSSpatialProfileEnrollmentController *)self checkVolume];
}

- (void)checkVolume
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
  p_initialVolume = &self->_initialVolume;
  int v5 = [v3 getVolume:&self->_initialVolume forCategory:@"Audio/Video"];

  v6 = sharedBluetoothSettingsLogComponent();
  double v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = *p_initialVolume;
      int v12 = 134217984;
      double v13 = v8;
      _os_log_impl(&dword_1E4BFE000, v7, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Initial Volume: %f", (uint8_t *)&v12, 0xCu);
    }

    if (*p_initialVolume < 0.5)
    {
      id v9 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 134217984;
        double v13 = 0.5;
        _os_log_impl(&dword_1E4BFE000, v9, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Initial Volume Too Low, Changing to Min Volume: %f", (uint8_t *)&v12, 0xCu);
      }

      double v10 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
      LODWORD(v11) = 0.5;
      [v10 setVolumeTo:@"Audio/Video" forCategory:v11];

      self->_volumeChanged = 1;
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[HPSSpatialProfileSingeStepEnrollmentController checkVolume]();
    }
  }
}

- (void)resetVolume
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_volumeChanged)
  {
    objc_super v3 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      double initialVolume = self->_initialVolume;
      int v7 = 134217984;
      double v8 = initialVolume;
      _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Volume Changed, Reset to Initial Volume: %f", (uint8_t *)&v7, 0xCu);
    }

    int v5 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
    *(float *)&double v6 = self->_initialVolume;
    [v5 setVolumeTo:@"Audio/Video" forCategory:v6];
  }
}

- (void)setupEnrollViewUI
{
  v51[12] = *MEMORY[0x1E4F143B8];
  objc_super v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Setting up Enroll View UI", buf, 2u);
  }

  [(HPSSpatialProfileUIPearlEnrollView *)self->_enrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(BKUIPearlEnrollView *)self->_enrollView setDelegate:self];
  [(BKUIPearlEnrollView *)self->_enrollView preEnrollActivate];
  double v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(BKUIPearlEnrollView *)self->_enrollView setBackgroundColor:v4];

  int v5 = objc_alloc_init(HPSSpatialProfileEarPillContainerView);
  earPillContainer = self->_earPillContainer;
  self->_earPillContainer = v5;

  [(HPSSpatialProfileEarPillContainerView *)self->_earPillContainer setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HPSSpatialProfileEarPillContainerView *)self->_earPillContainer setAlpha:0.0];
  int v7 = [(HPSSpatialProfileEnrollmentController *)self view];
  [v7 frame];
  double v9 = v8 / 390.0;

  BOOL v10 = v9 < 1.0;
  if (v9 >= 1.0) {
    double v11 = 0.0;
  }
  else {
    double v11 = 10.0;
  }
  if (v10) {
    double v12 = 85.0;
  }
  else {
    double v12 = 100.0;
  }
  double v13 = -[HPSSpatialProfileEarDotsMovieView initWithFrame:]([HPSSpatialProfileEarDotsMovieView alloc], "initWithFrame:", 0.0, 0.0, 345.0, v12);
  earDotsMovieView = self->_earDotsMovieView;
  self->_earDotsMovieView = v13;

  [(HPSSpatialProfileEarDotsMovieView *)self->_earDotsMovieView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HPSSpatialProfileEarDotsMovieView *)self->_earDotsMovieView setAlpha:0.0];
  [(UIView *)self->_enrollContentView addSubview:self->_enrollView];
  [(UIView *)self->_enrollContentView addSubview:self->_earPillContainer];
  [(UIView *)self->_enrollContentView addSubview:self->_earDotsMovieView];
  v37 = (void *)MEMORY[0x1E4F28DC8];
  v49 = [(HPSSpatialProfileUIPearlEnrollView *)self->_enrollView leadingAnchor];
  v48 = [(UIView *)self->_enrollContentView leadingAnchor];
  v47 = [v49 constraintEqualToAnchor:v48];
  v51[0] = v47;
  v46 = [(HPSSpatialProfileUIPearlEnrollView *)self->_enrollView trailingAnchor];
  v45 = [(UIView *)self->_enrollContentView trailingAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v51[1] = v44;
  v43 = [(HPSSpatialProfileUIPearlEnrollView *)self->_enrollView topAnchor];
  v42 = [(UIView *)self->_enrollContentView topAnchor];
  objc_super v41 = [v43 constraintEqualToAnchor:v42];
  v51[2] = v41;
  v40 = [(HPSSpatialProfileUIPearlEnrollView *)self->_enrollView bottomAnchor];
  v39 = [(UIView *)self->_enrollContentView bottomAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v51[3] = v38;
  uint64_t v36 = [(HPSSpatialProfileEarPillContainerView *)self->_earPillContainer widthAnchor];
  v35 = [v36 constraintEqualToConstant:172.5];
  v51[4] = v35;
  v34 = [(HPSSpatialProfileEarPillContainerView *)self->_earPillContainer heightAnchor];
  v33 = [v34 constraintEqualToConstant:25.0];
  v51[5] = v33;
  v32 = [(HPSSpatialProfileEarPillContainerView *)self->_earPillContainer centerXAnchor];
  v31 = [(UIView *)self->_enrollContentView centerXAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v51[6] = v30;
  id v29 = [(HPSSpatialProfileEarPillContainerView *)self->_earPillContainer bottomAnchor];
  v28 = [(UIView *)self->_enrollContentView bottomAnchor];
  uint64_t v27 = [v29 constraintEqualToAnchor:v28 constant:v11];
  v51[7] = v27;
  v26 = [(HPSSpatialProfileEarDotsMovieView *)self->_earDotsMovieView widthAnchor];
  v25 = [v26 constraintEqualToConstant:345.0];
  v51[8] = v25;
  id v24 = [(HPSSpatialProfileEarDotsMovieView *)self->_earDotsMovieView heightAnchor];
  v15 = [v24 constraintEqualToConstant:v12];
  v51[9] = v15;
  dispatch_queue_t v16 = [(HPSSpatialProfileEarDotsMovieView *)self->_earDotsMovieView centerXAnchor];
  v17 = [(UIView *)self->_enrollContentView centerXAnchor];
  dispatch_queue_t v18 = [v16 constraintEqualToAnchor:v17];
  v51[10] = v18;
  v19 = [(HPSSpatialProfileEarDotsMovieView *)self->_earDotsMovieView bottomAnchor];
  id v20 = [(UIView *)self->_enrollContentView bottomAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  v51[11] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:12];
  [v37 activateConstraints:v22];

  [(BKUIPearlEnrollView *)self->_enrollView setState:0 completion:&__block_literal_global_11];
  if (!self->_currentStep) {
    [(HPSSpatialProfileUIPearlEnrollView *)self->_enrollView setHidden:1];
  }
  v23 = [(HPSSpatialProfileEnrollmentController *)self view];
  [v23 setNeedsLayout];
}

- (void)setupEarTutorialView
{
  v33[8] = *MEMORY[0x1E4F143B8];
  objc_super v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Setting up Ear Tutorial", buf, 2u);
  }

  double v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  tutorialContentView = self->_tutorialContentView;
  self->_tutorialContentView = v4;

  [(UIView *)self->_tutorialContentView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_enrollContentView addSubview:self->_tutorialContentView];
  double v6 = objc_alloc_init(HPSSpatialProfileEarTutorialView);
  earTutorialView = self->_earTutorialView;
  self->_earTutorialView = v6;

  [(HPSSpatialProfileEarTutorialView *)self->_earTutorialView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_tutorialContentView addSubview:self->_earTutorialView];
  v22 = (void *)MEMORY[0x1E4F28DC8];
  v31 = [(UIView *)self->_tutorialContentView leadingAnchor];
  v30 = [(UIView *)self->_enrollContentView leadingAnchor];
  id v29 = [v31 constraintEqualToAnchor:v30];
  v33[0] = v29;
  v28 = [(UIView *)self->_tutorialContentView trailingAnchor];
  uint64_t v27 = [(UIView *)self->_enrollContentView trailingAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v33[1] = v26;
  v25 = [(UIView *)self->_tutorialContentView topAnchor];
  id v24 = [(UIView *)self->_enrollContentView topAnchor];
  v23 = [v25 constraintEqualToAnchor:v24];
  v33[2] = v23;
  v21 = [(UIView *)self->_tutorialContentView bottomAnchor];
  id v20 = [(UIView *)self->_enrollContentView bottomAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v33[3] = v19;
  dispatch_queue_t v18 = [(HPSSpatialProfileEarTutorialView *)self->_earTutorialView widthAnchor];
  v17 = [v18 constraintEqualToConstant:240.0];
  v33[4] = v17;
  dispatch_queue_t v16 = [(HPSSpatialProfileEarTutorialView *)self->_earTutorialView heightAnchor];
  double v8 = [v16 constraintEqualToConstant:106.666664];
  v33[5] = v8;
  double v9 = [(HPSSpatialProfileEarTutorialView *)self->_earTutorialView centerXAnchor];
  BOOL v10 = [(UIView *)self->_tutorialContentView centerXAnchor];
  double v11 = [v9 constraintEqualToAnchor:v10];
  v33[6] = v11;
  double v12 = [(HPSSpatialProfileEarTutorialView *)self->_earTutorialView centerYAnchor];
  double v13 = [(UIView *)self->_tutorialContentView centerYAnchor];
  uint64_t v14 = [v12 constraintEqualToAnchor:v13];
  v33[7] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:8];
  [v22 activateConstraints:v15];

  [(UIView *)self->_tutorialContentView setHidden:1];
}

- (void)setupEarBoundingBox
{
  objc_super v3 = (CEKSubjectIndicatorView *)objc_alloc_init(MEMORY[0x1E4F57D70]);
  earBoundingBoxView = self->_earBoundingBoxView;
  self->_earBoundingBoxView = v3;

  [(CEKSubjectIndicatorView *)self->_earBoundingBoxView setPulsing:0];
  [(CEKSubjectIndicatorView *)self->_earBoundingBoxView setInactive:1];
  [(CEKSubjectIndicatorView *)self->_earBoundingBoxView setHidden:1];
  enrollContentView = self->_enrollContentView;
  double v6 = self->_earBoundingBoxView;

  [(UIView *)enrollContentView addSubview:v6];
}

- (void)startEnrollment
{
  BOOL enrollmentStarted = self->_enrollmentStarted;
  double v4 = sharedBluetoothSettingsLogComponent();
  int v5 = v4;
  if (enrollmentStarted)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[HPSSpatialProfileSingeStepEnrollmentController startEnrollment]();
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Starting Enrollment", v6, 2u);
    }

    self->_BOOL enrollmentStarted = 1;
    [(HRTFEnrollmentSession *)self->_enrollmentSession startSession:1 then:&__block_literal_global_90];
  }
}

void __56__HPSSpatialProfileEnrollmentController_startEnrollment__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    __56__HPSSpatialProfileEnrollmentController_startEnrollment__block_invoke_cold_1();
  }
  v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v3 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Enrollment Started", v3, 2u);
  }
}

- (void)stopEnrollment
{
  BOOL enrollmentStarted = self->_enrollmentStarted;
  double v4 = sharedBluetoothSettingsLogComponent();
  int v5 = v4;
  if (enrollmentStarted)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Stopping Enrollment", v6, 2u);
    }

    self->_BOOL enrollmentStarted = 0;
    [(HRTFEnrollmentSession *)self->_enrollmentSession stopSession:&__block_literal_global_94];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[HPSSpatialProfileSingeStepEnrollmentController stopEnrollment]();
    }
  }
}

void __55__HPSSpatialProfileEnrollmentController_stopEnrollment__block_invoke()
{
  v0 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1E4BFE000, v0, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Enrollment Stopped", v1, 2u);
  }
}

- (void)pauseEnrollment
{
  if (self->_enrollmentStarted)
  {
    if (self->_enrollmentPaused)
    {
      objc_super v3 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        -[HPSSpatialProfileSingeStepEnrollmentController pauseEnrollment]();
      }
    }
    else
    {
      [(HRTFEnrollmentSession *)self->_enrollmentSession pauseSession];
      self->_enrollmentPaused = 1;
      objc_super v3 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v4 = 0;
        _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Enrollment Paused", v4, 2u);
      }
    }
  }
  else
  {
    objc_super v3 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[HPSSpatialProfileSingeStepEnrollmentController pauseEnrollment]();
    }
  }
}

- (void)resumeEnrollment
{
  if (self->_enrollmentStarted)
  {
    if (self->_enrollmentPaused)
    {
      [(HRTFEnrollmentSession *)self->_enrollmentSession resumeSession];
      self->_enrollmentPaused = 0;
      objc_super v3 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v6 = 0;
        double v4 = "Spatial Profile: Enrollment Resumed";
        int v5 = (uint8_t *)&v6;
LABEL_7:
        _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
      }
    }
    else
    {
      objc_super v3 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        -[HPSSpatialProfileSingeStepEnrollmentController resumeEnrollment]();
      }
    }
  }
  else
  {
    objc_super v3 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      double v4 = "Spatial Profile: Cannot Resume Enrollment, NOT Started";
      int v5 = buf;
      goto LABEL_7;
    }
  }
}

- (void)moveToStep:(int)a3
{
  stepSerialQueue = self->_stepSerialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke;
  v4[3] = &unk_1E6EA88F8;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(stepSerialQueue, v4);
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke(uint64_t a1)
{
  v2 = dispatch_group_create();
  dispatch_group_t v3 = dispatch_group_create();
  NSLog(&cfstr_SpatialProfile_17.isa);
  dispatch_group_enter(v2);
  id location = 0;
  objc_initWeak(&location, *(id *)(a1 + 32));
  *(_DWORD *)(*(void *)(a1 + 32) + 1240) = *(_DWORD *)(*(void *)(a1 + 32) + 1236);
  *(_DWORD *)(*(void *)(a1 + 32) + 1236) = *(_DWORD *)(a1 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2;
  block[3] = &unk_1E6EA82F0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
  uint64_t v4 = *(void *)(a1 + 32);
  switch(*(_DWORD *)(v4 + 1236))
  {
    case 0:
      int v5 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> Welcome", buf, 2u);
      }

      v147[0] = MEMORY[0x1E4F143A8];
      v147[1] = 3221225472;
      v147[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_98;
      v147[3] = &unk_1E6EA8428;
      v147[4] = *(void *)(a1 + 32);
      v148 = v2;
      __int16 v6 = (void *)MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v147);

      int v7 = v148;
      goto LABEL_65;
    case 1:
      double v8 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v8, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> FrontView", buf, 2u);
      }

      uint64_t v9 = *(void *)(a1 + 32);
      if (!*(void *)(v9 + 1280))
      {
        BOOL v10 = objc_alloc_init(HPSSpatialProfileAnalytics);
        uint64_t v11 = *(void *)(a1 + 32);
        double v12 = *(void **)(v11 + 1280);
        *(void *)(v11 + 1280) = v10;

        uint64_t v9 = *(void *)(a1 + 32);
      }
      v144[0] = MEMORY[0x1E4F143A8];
      v144[1] = 3221225472;
      v144[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_101;
      v144[3] = &unk_1E6EA8998;
      v144[4] = v9;
      v145 = v3;
      v146 = v2;
      double v13 = (void *)MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v144);

      int v7 = v145;
      goto LABEL_65;
    case 2:
      uint64_t v14 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v14, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> FrontViewCapturePositionFace", buf, 2u);
      }

      [*(id *)(*(void *)(a1 + 32) + 1280) initFrameRateDetection];
      [*(id *)(*(void *)(a1 + 32) + 1280) updateFaceEnrollStart];
      v140[0] = MEMORY[0x1E4F143A8];
      v140[1] = 3221225472;
      v140[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_112;
      v140[3] = &unk_1E6EA8998;
      v15 = v3;
      uint64_t v16 = *(void *)(a1 + 32);
      v141 = v15;
      uint64_t v142 = v16;
      v143 = v2;
      v17 = (void *)MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v140);

      int v7 = v141;
      goto LABEL_65;
    case 3:
      dispatch_queue_t v18 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v18, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> FrontViewCaptureMoveHead", buf, 2u);
      }

      v136[0] = MEMORY[0x1E4F143A8];
      v136[1] = 3221225472;
      v136[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_118;
      v136[3] = &unk_1E6EA8998;
      v19 = v3;
      uint64_t v20 = *(void *)(a1 + 32);
      v137 = v19;
      uint64_t v138 = v20;
      v139 = v2;
      v21 = (void *)MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v136);

      int v7 = v137;
      goto LABEL_65;
    case 4:
      v22 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v22, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> FrontViewCaptureCompleted", buf, 2u);
      }

      [*(id *)(*(void *)(a1 + 32) + 1280) updateFaceEnrollDuration];
      v132[0] = MEMORY[0x1E4F143A8];
      v132[1] = 3221225472;
      v132[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_122;
      v132[3] = &unk_1E6EA8998;
      v23 = v3;
      uint64_t v24 = *(void *)(a1 + 32);
      v133 = v23;
      uint64_t v134 = v24;
      v135 = v2;
      v25 = (void *)MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v132);

      int v7 = v133;
      goto LABEL_65;
    case 5:
      v26 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v26, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> RightEar", buf, 2u);
      }

      v128[0] = MEMORY[0x1E4F143A8];
      v128[1] = 3221225472;
      v128[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_129;
      v128[3] = &unk_1E6EA8998;
      uint64_t v27 = v3;
      uint64_t v28 = *(void *)(a1 + 32);
      v129 = v27;
      uint64_t v130 = v28;
      v131 = v2;
      id v29 = (void *)MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v128);

      int v7 = v129;
      goto LABEL_65;
    case 6:
      v30 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v30, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> RightEarCaptureHoldPhone", buf, 2u);
      }

      [*(id *)(*(void *)(a1 + 32) + 1280) updateRightEarEnrollStart];
      v124[0] = MEMORY[0x1E4F143A8];
      v124[1] = 3221225472;
      v124[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_142;
      v124[3] = &unk_1E6EA8998;
      v31 = v3;
      uint64_t v32 = *(void *)(a1 + 32);
      v125 = v31;
      uint64_t v126 = v32;
      v127 = v2;
      v33 = (void *)MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v124);

      int v7 = v125;
      goto LABEL_65;
    case 7:
      v34 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v34, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> RightEarCaptureRotateHead", buf, 2u);
      }

      [*(id *)(a1 + 32) startEarEnrollmentNudgeTimer];
      v119[0] = MEMORY[0x1E4F143A8];
      v119[1] = 3221225472;
      v119[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_147;
      v119[3] = &unk_1E6EA8FE8;
      v35 = v3;
      uint64_t v36 = *(void *)(a1 + 32);
      v120 = v35;
      uint64_t v121 = v36;
      objc_copyWeak(&v123, &location);
      v122 = v2;
      v37 = (void *)MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v119);

      objc_destroyWeak(&v123);
      int v7 = v120;
      goto LABEL_65;
    case 8:
      v56 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v56, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> RightEarCaptureCompleted", buf, 2u);
      }

      [*(id *)(*(void *)(a1 + 32) + 1280) updateRightEarEnrollDuration];
      [*(id *)(a1 + 32) stopEarEnrollmentNudgeTimer];
      v114[0] = MEMORY[0x1E4F143A8];
      v114[1] = 3221225472;
      v114[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_151;
      v114[3] = &unk_1E6EA8FE8;
      v57 = v3;
      uint64_t v58 = *(void *)(a1 + 32);
      v115 = v57;
      uint64_t v116 = v58;
      objc_copyWeak(&v118, &location);
      v117 = v2;
      v59 = (void *)MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v114);

      objc_destroyWeak(&v118);
      int v7 = v115;
      goto LABEL_65;
    case 9:
      v60 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v60, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> LeftEar", buf, 2u);
      }

      v110[0] = MEMORY[0x1E4F143A8];
      v110[1] = 3221225472;
      v110[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_158;
      v110[3] = &unk_1E6EA8998;
      id v61 = v3;
      uint64_t v62 = *(void *)(a1 + 32);
      v111 = v61;
      uint64_t v112 = v62;
      v113 = v2;
      v63 = (void *)MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v110);

      int v7 = v111;
      goto LABEL_65;
    case 0xA:
      v38 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v38, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> LeftEarCaptureHoldPhone", buf, 2u);
      }

      [*(id *)(*(void *)(a1 + 32) + 1280) updateLeftEarEnrollStart];
      v106[0] = MEMORY[0x1E4F143A8];
      v106[1] = 3221225472;
      v106[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_170;
      v106[3] = &unk_1E6EA8998;
      v39 = v3;
      uint64_t v40 = *(void *)(a1 + 32);
      v107 = v39;
      uint64_t v108 = v40;
      v109 = v2;
      objc_super v41 = (void *)MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v106);

      int v7 = v107;
      goto LABEL_65;
    case 0xB:
      v42 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v42, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> LeftEarCaptureRotateHead", buf, 2u);
      }

      [*(id *)(a1 + 32) startEarEnrollmentNudgeTimer];
      v101[0] = MEMORY[0x1E4F143A8];
      v101[1] = 3221225472;
      v101[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_175;
      v101[3] = &unk_1E6EA8FE8;
      v43 = v3;
      uint64_t v44 = *(void *)(a1 + 32);
      v102 = v43;
      uint64_t v103 = v44;
      objc_copyWeak(&v105, &location);
      v104 = v2;
      v45 = (void *)MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v101);

      objc_destroyWeak(&v105);
      int v7 = v102;
      goto LABEL_65;
    case 0xC:
      v46 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v46, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> LeftEarCaptureCompleted", buf, 2u);
      }

      [*(id *)(*(void *)(a1 + 32) + 1280) updateLeftEarEnrollDuration];
      [*(id *)(a1 + 32) stopEarEnrollmentNudgeTimer];
      v96[0] = MEMORY[0x1E4F143A8];
      v96[1] = 3221225472;
      v96[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_179;
      v96[3] = &unk_1E6EA8FE8;
      v47 = v3;
      uint64_t v48 = *(void *)(a1 + 32);
      v97 = v47;
      uint64_t v98 = v48;
      objc_copyWeak(&v100, &location);
      v99 = v2;
      v49 = (void *)MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v96);

      objc_destroyWeak(&v100);
      int v7 = v97;
      goto LABEL_65;
    case 0xE:
      v50 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v50, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> RetrieveProfile", buf, 2u);
      }

      [*(id *)(a1 + 32) retrieveProfile];
      goto LABEL_55;
    case 0xF:
      v51 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v51, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> SyncProfile", buf, 2u);
      }

      [*(id *)(a1 + 32) syncProfile];
      goto LABEL_55;
    case 0x10:
      [*(id *)(v4 + 1280) updateStatus:1 EnrollmentResult:@"Success"];
      id v65 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v65, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> Completed", buf, 2u);
      }

      v94[0] = MEMORY[0x1E4F143A8];
      v94[1] = 3221225472;
      v94[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_189;
      v94[3] = &unk_1E6EA8428;
      v94[4] = *(void *)(a1 + 32);
      uint64_t v66 = v3;
      v95 = v66;
      v67 = MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v94);

      v92[0] = MEMORY[0x1E4F143A8];
      v92[1] = 3221225472;
      v92[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_201;
      v92[3] = &unk_1E6EA82F0;
      v93 = v2;
      dispatch_group_notify(v66, v67, v92);

      int v7 = v95;
      goto LABEL_65;
    case 0x11:
      v68 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v68, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> CouldntScanEar", buf, 2u);
      }

      [*(id *)(*(void *)(a1 + 32) + 1280) updateStatus:0 EnrollmentResult:@"Failed"];
      v89[0] = MEMORY[0x1E4F143A8];
      v89[1] = 3221225472;
      v89[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_205;
      v89[3] = &unk_1E6EA8428;
      id v69 = v3;
      uint64_t v70 = *(void *)(a1 + 32);
      v90 = v69;
      uint64_t v91 = v70;
      v71 = MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v89);

      v87[0] = MEMORY[0x1E4F143A8];
      v87[1] = 3221225472;
      v87[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_215;
      v87[3] = &unk_1E6EA82F0;
      v88 = v2;
      dispatch_group_notify(v69, v71, v87);

      int v7 = v90;
      goto LABEL_65;
    case 0x12:
      v72 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v72, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> HairCoveringEar", buf, 2u);
      }

      [*(id *)(*(void *)(a1 + 32) + 1280) updateStatus:0 EnrollmentResult:@"Failed"];
      v84[0] = MEMORY[0x1E4F143A8];
      v84[1] = 3221225472;
      v84[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_216;
      v84[3] = &unk_1E6EA8428;
      id v73 = v3;
      uint64_t v74 = *(void *)(a1 + 32);
      v85 = v73;
      uint64_t v86 = v74;
      v75 = MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v84);

      v82[0] = MEMORY[0x1E4F143A8];
      v82[1] = 3221225472;
      v82[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_223;
      v82[3] = &unk_1E6EA82F0;
      v83 = v2;
      dispatch_group_notify(v73, v75, v82);

      int v7 = v85;
      goto LABEL_65;
    case 0x13:
      id v52 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v52, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> GeneralFailure", buf, 2u);
      }

      [*(id *)(*(void *)(a1 + 32) + 1280) updateStatus:0 EnrollmentResult:@"Failed"];
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_224;
      v79[3] = &unk_1E6EA8428;
      v53 = v3;
      uint64_t v54 = *(void *)(a1 + 32);
      v80 = v53;
      uint64_t v81 = v54;
      v55 = MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v79);

      v77[0] = MEMORY[0x1E4F143A8];
      v77[1] = 3221225472;
      v77[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_232;
      v77[3] = &unk_1E6EA82F0;
      uint64_t v78 = v2;
      dispatch_group_notify(v53, v55, v77);

      int v7 = v80;
LABEL_65:

      break;
    default:
      v64 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
        __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_cold_1();
      }

LABEL_55:
      dispatch_group_leave(v2);
      break;
  }
  dispatch_time_t v76 = dispatch_time(0, 3000000000);
  dispatch_group_wait(v2, v76);
  objc_destroyWeak(&location);
}

uint64_t __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 992), "setContentOffset:animated:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_98(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 1032);
  dispatch_group_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"CONTINUE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v2 setTitle:v4 forState:0];

  if (!+[HPSSpatialProfileManager isProxCardShowed]) {
    +[HPSSpatialProfileManager setProxCardShowed:1];
  }
  [*(id *)(a1 + 32) startEnrollment];
  [*(id *)(a1 + 32) showContinueButton];
  [*(id *)(*(void *)(a1 + 32) + 1144) setAlpha:0.0];
  int v5 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v5);
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_101(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 1016);
  dispatch_group_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"FRONT_VIEW" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v2 setTitle:v4];

  int v5 = *(void **)(*(void *)(a1 + 32) + 1016);
  __int16 v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v7 = [v6 localizedStringForKey:@"FRONT_VIEW_DETAIL" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v5 setDetailText:v7];

  double v8 = *(void **)(*(void *)(a1 + 32) + 1032);
  uint64_t v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v10 = [v9 localizedStringForKey:@"START_FRONT_VIEW_CAPTURE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v8 setTitle:v10 forState:0];

  [*(id *)(*(void *)(a1 + 32) + 1080) removeFromSuperview];
  [*(id *)(*(void *)(a1 + 32) + 1024) removeFromSuperview];
  [*(id *)(*(void *)(a1 + 32) + 1072) removeFromSuperview];
  [*(id *)(*(void *)(a1 + 32) + 1136) setHidden:0];
  [*(id *)(*(void *)(a1 + 32) + 1136) setFaceCaptured:0];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  uint64_t v11 = *(void **)(*(void *)(a1 + 32) + 1136);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_111;
  v15[3] = &unk_1E6EA82F0;
  id v16 = *(id *)(a1 + 40);
  [v11 setState:2 completion:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3;
  v13[3] = &unk_1E6EA82F0;
  double v12 = *(NSObject **)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  dispatch_group_notify(v12, MEMORY[0x1E4F14428], v13);
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_111(uint64_t a1)
{
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3(uint64_t a1)
{
  v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_group_t v3 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> FrontView Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_112(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = *(void **)(*(void *)(a1 + 40) + 1016);
  dispatch_group_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"FRONT_VIEW_CAPTURE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v2 setTitle:v4];

  int v5 = *(void **)(*(void *)(a1 + 40) + 1016);
  __int16 v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v7 = [v6 localizedStringForKey:@"FRONT_VIEW_DETAIL" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v5 setDetailText:v7];

  *(_DWORD *)(*(void *)(a1 + 40) + 1320) = 5;
  [*(id *)(a1 + 40) startCaptureViewTimer];
  [*(id *)(a1 + 40) hideContinueButton];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  double v8 = *(void **)(*(void *)(a1 + 40) + 1136);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_116;
  v17[3] = &unk_1E6EA82F0;
  id v18 = *(id *)(a1 + 32);
  [v8 setState:3 completion:v17];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v9 = *(void *)(a1 + 40);
  BOOL v10 = *(void **)(v9 + 1128);
  uint64_t v11 = *(unsigned int *)(v9 + 1236);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_117;
  v15[3] = &unk_1E6EA82F0;
  id v16 = *(id *)(a1 + 32);
  [v10 triggerSoundHapticForEnrollmentState:v11 completion:v15];
  [*(id *)(a1 + 40) resumeEnrollment];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  double v12 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4;
  block[3] = &unk_1E6EA82F0;
  id v14 = *(id *)(a1 + 48);
  dispatch_group_notify(v12, MEMORY[0x1E4F14428], block);
  [*(id *)(a1 + 40) startFaceInFrameHandlerTimer];
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_116(uint64_t a1)
{
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_117(uint64_t a1)
{
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4(uint64_t a1)
{
  v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_group_t v3 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> FrontViewCapturePositionFace Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_118(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = *(void **)(*(void *)(a1 + 40) + 1136);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_119;
  v11[3] = &unk_1E6EA82F0;
  id v12 = *(id *)(a1 + 32);
  [v2 setState:5 completion:v11];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(v3 + 1128);
  uint64_t v5 = *(unsigned int *)(v3 + 1236);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_120;
  v9[3] = &unk_1E6EA82F0;
  id v10 = *(id *)(a1 + 32);
  [v4 triggerSoundHapticForEnrollmentState:v5 completion:v9];
  __int16 v6 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_121;
  block[3] = &unk_1E6EA82F0;
  id v8 = *(id *)(a1 + 48);
  dispatch_group_notify(v6, MEMORY[0x1E4F14428], block);
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_119(uint64_t a1)
{
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_120(uint64_t a1)
{
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_121(uint64_t a1)
{
  v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> FrontViewCaptureMoveHead Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_122(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = *(void **)(*(void *)(a1 + 40) + 1016);
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"FRONT_VIEW_CAPTURE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v2 setTitle:v4];

  uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 1016);
  __int16 v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v7 = [v6 localizedStringForKey:@"FRONT_VIEW_CAPTURED" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v5 setDetailText:v7];

  id v8 = *(void **)(*(void *)(a1 + 40) + 1032);
  uint64_t v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"CONTINUE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v8 setTitle:v10 forState:0];

  [*(id *)(a1 + 40) stopCaptureViewTimer];
  [*(id *)(*(void *)(a1 + 40) + 1136) setFaceCaptured:1];
  [*(id *)(a1 + 40) showContinueButton];
  [*(id *)(a1 + 40) forceBlur];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v11 = *(void **)(*(void *)(a1 + 40) + 1136);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_126;
  v20[3] = &unk_1E6EA82F0;
  id v21 = *(id *)(a1 + 32);
  [v11 setState:6 completion:v20];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v12 = *(void *)(a1 + 40);
  double v13 = *(void **)(v12 + 1128);
  uint64_t v14 = *(unsigned int *)(v12 + 1236);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_127;
  v18[3] = &unk_1E6EA82F0;
  id v19 = *(id *)(a1 + 32);
  [v13 triggerSoundHapticForEnrollmentState:v14 completion:v18];
  [*(id *)(a1 + 40) pauseEnrollment];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v15 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_128;
  block[3] = &unk_1E6EA82F0;
  id v17 = *(id *)(a1 + 48);
  dispatch_group_notify(v15, MEMORY[0x1E4F14428], block);
  [*(id *)(a1 + 40) stopFaceInFrameHandlerTimer];
  [*(id *)(a1 + 40) sendTipKitSignal];
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_126(uint64_t a1)
{
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_127(uint64_t a1)
{
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_128(uint64_t a1)
{
  v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> FrontViewCaptureCompleted Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_129(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = *(void **)(*(void *)(a1 + 40) + 1016);
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"RIGHT_EAR" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v2 setTitle:v4];

  uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 1016);
  __int16 v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v7 = [v6 localizedStringForKey:@"RIGHT_EAR_DETAIL" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v5 setDetailText:v7];

  id v8 = *(void **)(*(void *)(a1 + 40) + 1032);
  uint64_t v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"START_RIGHT_EAR_CAPTURE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v8 setTitle:v10 forState:0];

  [*(id *)(*(void *)(a1 + 40) + 1152) setHidden:0];
  [*(id *)(*(void *)(a1 + 40) + 1160) startPlayerRightEar];
  uint64_t v11 = [*(id *)(*(void *)(a1 + 40) + 1136) pillContainer];
  [v11 setHidden:1];

  [*(id *)(*(void *)(a1 + 40) + 1136) setCrosshairsHidden:1];
  [*(id *)(*(void *)(a1 + 40) + 1136) setPauseBlur:1];
  [*(id *)(*(void *)(a1 + 40) + 1136) setForceBlur:0];
  [*(id *)(*(void *)(a1 + 40) + 1136) setHidden:1];
  *(_DWORD *)(*(void *)(a1 + 40) + 1352) = 2;
  *(void *)(*(void *)(a1 + 40) + 1560) = 0x3FE0000000000000;
  *(void *)(*(void *)(a1 + 40) + 1568) = 0xC059000000000000;
  *(void *)(*(void *)(a1 + 40) + 1576) = 0xC059000000000000;
  uint64_t v12 = *(void *)(a1 + 40);
  double v13 = *(void **)(v12 + 1584);
  *(void *)(v12 + 1584) = 0;

  [*(id *)(*(void *)(a1 + 40) + 1136) setCameraBlurAmount:0 useShade:0 duration:0.0 completion:0.5];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v14 = *(void **)(*(void *)(a1 + 40) + 1136);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_139;
  v26[3] = &unk_1E6EA82F0;
  id v27 = *(id *)(a1 + 32);
  [v14 setState:3 completion:v26];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v15 = *(void *)(a1 + 40);
  id v16 = *(void **)(v15 + 1128);
  uint64_t v17 = *(unsigned int *)(v15 + 1236);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_140;
  v24[3] = &unk_1E6EA82F0;
  id v25 = *(id *)(a1 + 32);
  [v16 triggerSoundHapticForEnrollmentState:v17 completion:v24];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v18 = *(NSObject **)(a1 + 32);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_141;
  v21[3] = &unk_1E6EA8428;
  id v19 = *(id *)(a1 + 48);
  uint64_t v20 = *(void *)(a1 + 40);
  id v22 = v19;
  uint64_t v23 = v20;
  dispatch_group_notify(v18, MEMORY[0x1E4F14428], v21);
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_139(uint64_t a1)
{
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_140(uint64_t a1)
{
}

uint64_t __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_141(uint64_t a1)
{
  v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> RightEar Done", v4, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  return [*(id *)(a1 + 40) startTutorialResumeEnrollTimer];
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_142(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  [*(id *)(a1 + 40) stopTutorialResumeEnrollTimer];
  v2 = *(void **)(*(void *)(a1 + 40) + 1016);
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"RIGHT_EAR_CAPTURE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v2 setTitle:v4];

  [*(id *)(*(void *)(a1 + 40) + 1152) setHidden:1];
  [*(id *)(*(void *)(a1 + 40) + 1160) stopPlayerRightEar];
  [*(id *)(a1 + 40) startCaptureViewTimer];
  [*(id *)(a1 + 40) hideContinueButton];
  [*(id *)(*(void *)(a1 + 40) + 1136) setHidden:0];
  *(unsigned char *)(*(void *)(a1 + 40) + 1410) = 0;
  *(unsigned char *)(*(void *)(a1 + 40) + 1411) = 0;
  *(unsigned char *)(*(void *)(a1 + 40) + 1426) = 0;
  *(unsigned char *)(*(void *)(a1 + 40) + 1427) = 0;
  *(unsigned char *)(*(void *)(a1 + 40) + 1442) = 0;
  *(unsigned char *)(*(void *)(a1 + 40) + 1443) = 0;
  *(void *)(*(void *)(a1 + 40) + 1528) = 0xC059000000000000;
  *(unsigned char *)(*(void *)(a1 + 40) + 1440) = 0;
  *(unsigned char *)(*(void *)(a1 + 40) + 1441) = 0;
  *(unsigned char *)(*(void *)(a1 + 40) + 1425) = 10;
  [*(id *)(a1 + 40) startOcclusionWarnCoolDownTimer];
  [*(id *)(a1 + 40) startEarDistanceWarnCoolDownTimer];
  [*(id *)(a1 + 40) startEnrollGuidanceTimer];
  [*(id *)(*(void *)(a1 + 40) + 1280) initFrameRateDetection];
  [*(id *)(a1 + 40) resumeEnrollment];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  uint64_t v5 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_146;
  block[3] = &unk_1E6EA82F0;
  id v7 = *(id *)(a1 + 48);
  dispatch_group_notify(v5, MEMORY[0x1E4F14428], block);
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_146(uint64_t a1)
{
  v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> RightEarCaptureHoldPhone Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_147(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = *(void **)(*(void *)(a1 + 40) + 1016);
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"RIGHT_EAR_CAPTURE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v2 setTitle:v4];

  [*(id *)(*(void *)(a1 + 40) + 976) bringSubviewToFront:*(void *)(*(void *)(a1 + 40) + 1176)];
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1176), "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [*(id *)(*(void *)(a1 + 40) + 1168) setAlpha:1.0];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 1136);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_148;
  v14[3] = &unk_1E6EA84F0;
  objc_copyWeak(&v16, (id *)(a1 + 56));
  id v15 = *(id *)(a1 + 32);
  [v5 setState:5 completion:v14];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(v6 + 1128);
  uint64_t v8 = *(unsigned int *)(v6 + 1236);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_149;
  v12[3] = &unk_1E6EA82F0;
  id v13 = *(id *)(a1 + 32);
  [v7 triggerSoundHapticForEnrollmentState:v8 completion:v12];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  uint64_t v9 = *(NSObject **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_150;
  v10[3] = &unk_1E6EA82F0;
  id v11 = *(id *)(a1 + 48);
  dispatch_group_notify(v9, MEMORY[0x1E4F14428], v10);

  objc_destroyWeak(&v16);
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_148(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained showEarPillsDots];

  uint64_t v3 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v3);
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_149(uint64_t a1)
{
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_150(uint64_t a1)
{
  v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> RightEarCaptureRotateHead Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_151(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  [*(id *)(a1 + 40) hideEarDistanceWarningContinueButton];
  [*(id *)(a1 + 40) hideOcclusionContinueButton];
  v2 = *(void **)(*(void *)(a1 + 40) + 1016);
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"RIGHT_EAR_CAPTURE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v2 setTitle:v4];

  uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 1016);
  uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"RIGHT_EAR_CAPTURED" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v5 setDetailText:v7];

  uint64_t v8 = *(void **)(*(void *)(a1 + 40) + 1032);
  uint64_t v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"CONTINUE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v8 setTitle:v10 forState:0];

  [*(id *)(a1 + 40) stopCaptureViewTimer];
  [*(id *)(a1 + 40) stopEnrollGuidanceTimer];
  [*(id *)(*(void *)(a1 + 40) + 1176) setHidden:1];
  [*(id *)(a1 + 40) showContinueButton];
  [*(id *)(a1 + 40) forceBlur];
  [*(id *)(a1 + 40) hideEarPillsDots];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id v11 = *(void **)(*(void *)(a1 + 40) + 1136);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_155;
  v20[3] = &unk_1E6EA84F0;
  objc_copyWeak(&v22, (id *)(a1 + 56));
  id v21 = *(id *)(a1 + 32);
  [v11 setState:6 completion:v20];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v12 = *(void *)(a1 + 40);
  id v13 = *(void **)(v12 + 1128);
  uint64_t v14 = *(unsigned int *)(v12 + 1236);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_156;
  v18[3] = &unk_1E6EA82F0;
  id v19 = *(id *)(a1 + 32);
  [v13 triggerSoundHapticForEnrollmentState:v14 completion:v18];
  [*(id *)(a1 + 40) pauseEnrollment];
  *(_DWORD *)(*(void *)(a1 + 40) + 1352) = 3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v15 = *(NSObject **)(a1 + 32);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_157;
  v16[3] = &unk_1E6EA82F0;
  id v17 = *(id *)(a1 + 48);
  dispatch_group_notify(v15, MEMORY[0x1E4F14428], v16);

  objc_destroyWeak(&v22);
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_155(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained[142] pillContainer];
  [v2 setHidden:0];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_156(uint64_t a1)
{
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_157(uint64_t a1)
{
  v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> RightEarCaptureCompleted Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_158(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = *(void **)(*(void *)(a1 + 40) + 1016);
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"LEFT_EAR" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v2 setTitle:v4];

  uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 1016);
  uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"LEFT_EAR_DETAIL" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v5 setDetailText:v7];

  uint64_t v8 = *(void **)(*(void *)(a1 + 40) + 1032);
  uint64_t v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"START_LEFT_EAR_CAPTURE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v8 setTitle:v10 forState:0];

  [*(id *)(*(void *)(a1 + 40) + 1152) setHidden:0];
  [*(id *)(*(void *)(a1 + 40) + 1160) startPlayerLeftEar];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id v11 = *(void **)(*(void *)(a1 + 40) + 1136);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_168;
  v19[3] = &unk_1E6EA82F0;
  id v20 = *(id *)(a1 + 32);
  [v11 setState:3 completion:v19];
  uint64_t v12 = [*(id *)(*(void *)(a1 + 40) + 1136) pillContainer];
  [v12 setHidden:1];

  [*(id *)(*(void *)(a1 + 40) + 1136) setHidden:1];
  [*(id *)(a1 + 40) cancelBlur];
  [*(id *)(*(void *)(a1 + 40) + 1144) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 40) + 1144) resetPillsAnimated:1];
  *(unsigned char *)(*(void *)(a1 + 40) + 1343) = 0;
  *(_DWORD *)(*(void *)(a1 + 40) + 1368) = 2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v13 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_169;
  block[3] = &unk_1E6EA8428;
  id v14 = *(id *)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 40);
  id v17 = v14;
  uint64_t v18 = v15;
  dispatch_group_notify(v13, MEMORY[0x1E4F14428], block);
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_168(uint64_t a1)
{
}

uint64_t __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_169(uint64_t a1)
{
  v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> LeftEar Done", v4, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  return [*(id *)(a1 + 40) startTutorialResumeEnrollTimer];
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_170(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = *(void **)(*(void *)(a1 + 40) + 1016);
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"LEFT_EAR_CAPTURE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v2 setTitle:v4];

  [*(id *)(*(void *)(a1 + 40) + 1152) setHidden:1];
  [*(id *)(*(void *)(a1 + 40) + 1160) stopPlayerLeftEar];
  [*(id *)(a1 + 40) stopTutorialResumeEnrollTimer];
  [*(id *)(a1 + 40) startCaptureViewTimer];
  [*(id *)(a1 + 40) hideContinueButton];
  [*(id *)(*(void *)(a1 + 40) + 1136) setPauseBlur:1];
  [*(id *)(*(void *)(a1 + 40) + 1136) setHidden:0];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 40) + 1136) pillContainer];
  [v5 setHidden:1];

  *(unsigned char *)(*(void *)(a1 + 40) + 1410) = 0;
  *(unsigned char *)(*(void *)(a1 + 40) + 1426) = 0;
  *(unsigned char *)(*(void *)(a1 + 40) + 1427) = 0;
  *(unsigned char *)(*(void *)(a1 + 40) + 1411) = 0;
  *(unsigned char *)(*(void *)(a1 + 40) + 1440) = 0;
  *(unsigned char *)(*(void *)(a1 + 40) + 1441) = 0;
  *(unsigned char *)(*(void *)(a1 + 40) + 1442) = 0;
  *(unsigned char *)(*(void *)(a1 + 40) + 1443) = 0;
  *(void *)(*(void *)(a1 + 40) + 1520) = 0xC059000000000000;
  *(unsigned char *)(*(void *)(a1 + 40) + 1425) = 10;
  *(void *)(*(void *)(a1 + 40) + 1560) = 0x3FE0000000000000;
  *(void *)(*(void *)(a1 + 40) + 1568) = 0xC059000000000000;
  *(void *)(*(void *)(a1 + 40) + 1576) = 0xC059000000000000;
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(v6 + 1584);
  *(void *)(v6 + 1584) = 0;

  uint64_t v8 = *(void *)(a1 + 40);
  double v9 = *(double *)(v8 + 1560);
  *(float *)&double v9 = v9;
  [*(id *)(v8 + 1128) setEnrollGuidancePitch:v9];
  [*(id *)(a1 + 40) startOcclusionWarnCoolDownTimer];
  [*(id *)(a1 + 40) startEarDistanceWarnCoolDownTimer];
  [*(id *)(a1 + 40) startEnrollGuidanceTimer];
  [*(id *)(*(void *)(a1 + 40) + 1280) initFrameRateDetection];
  [*(id *)(a1 + 40) resumeEnrollment];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v10 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_174;
  block[3] = &unk_1E6EA82F0;
  id v12 = *(id *)(a1 + 48);
  dispatch_group_notify(v10, MEMORY[0x1E4F14428], block);
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_174(uint64_t a1)
{
  v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> LeftEarCaptureHoldPhone Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_175(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = *(void **)(*(void *)(a1 + 40) + 1016);
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"LEFT_EAR_CAPTURE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v2 setTitle:v4];

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v5 = [*(id *)(*(void *)(a1 + 40) + 1136) pillContainer];
  [v5 setHidden:1];

  uint64_t v6 = *(void **)(*(void *)(a1 + 40) + 1136);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_176;
  v15[3] = &unk_1E6EA84F0;
  objc_copyWeak(&v17, (id *)(a1 + 56));
  id v16 = *(id *)(a1 + 32);
  [v6 setState:5 completion:v15];
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1176), "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  *(unsigned char *)(*(void *)(a1 + 40) + 1364) = 0;
  *(unsigned char *)(*(void *)(a1 + 40) + 1363) = 0;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void **)(v7 + 1128);
  uint64_t v9 = *(unsigned int *)(v7 + 1236);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_177;
  v13[3] = &unk_1E6EA82F0;
  id v14 = *(id *)(a1 + 32);
  [v8 triggerSoundHapticForEnrollmentState:v9 completion:v13];
  [*(id *)(a1 + 40) resumeEnrollment];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v10 = *(NSObject **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_178;
  v11[3] = &unk_1E6EA82F0;
  id v12 = *(id *)(a1 + 48);
  dispatch_group_notify(v10, MEMORY[0x1E4F14428], v11);

  objc_destroyWeak(&v17);
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_176(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained showEarPillsDots];

  uint64_t v3 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v3);
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_177(uint64_t a1)
{
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_178(uint64_t a1)
{
  v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> LeftEarCaptureRotateHead Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_179(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  [*(id *)(*(void *)(a1 + 40) + 1176) setHidden:1];
  [*(id *)(a1 + 40) hideEarDistanceWarningContinueButton];
  [*(id *)(a1 + 40) hideOcclusionContinueButton];
  [*(id *)(a1 + 40) stopEnrollGuidanceTimer];
  v2 = *(void **)(*(void *)(a1 + 40) + 1016);
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"LEFT_EAR_CAPTURE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v2 setTitle:v4];

  uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 1016);
  uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"LEFT_EAR_CAPTURED" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v5 setDetailText:v7];

  [*(id *)(a1 + 40) stopCaptureViewTimer];
  [*(id *)(a1 + 40) startPostProcessTimer];
  [*(id *)(a1 + 40) hideEarPillsDots];
  [*(id *)(a1 + 40) forceBlur];
  *(_DWORD *)(*(void *)(a1 + 40) + 1368) = 3;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v8 = *(void **)(*(void *)(a1 + 40) + 1136);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_183;
  v17[3] = &unk_1E6EA84F0;
  objc_copyWeak(&v19, (id *)(a1 + 56));
  id v18 = *(id *)(a1 + 32);
  [v8 setState:6 completion:v17];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = *(void **)(v9 + 1128);
  uint64_t v11 = *(unsigned int *)(v9 + 1236);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_184;
  v15[3] = &unk_1E6EA82F0;
  id v16 = *(id *)(a1 + 32);
  [v10 triggerSoundHapticForEnrollmentState:v11 completion:v15];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v12 = *(NSObject **)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_185;
  v13[3] = &unk_1E6EA82F0;
  id v14 = *(id *)(a1 + 48);
  dispatch_group_notify(v12, MEMORY[0x1E4F14428], v13);

  objc_destroyWeak(&v19);
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_183(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained[142] pillContainer];
  [v2 setHidden:0];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_184(uint64_t a1)
{
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_185(uint64_t a1)
{
  v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> LeftEarCaptureCompleted Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_189(uint64_t a1)
{
  [*(id *)(a1 + 32) stopTimers];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v2 = *(void **)(*(void *)(a1 + 32) + 1016);
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"SPATIAL_AUDIO_PROFILE_TITLE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v2 setTitle:v4];

  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 1016);
  uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"SPATIAL_AUDIO_PROFILE_COMPLETE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v5 setDetailText:v7];

  uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 1032);
  uint64_t v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"DONE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v8 setTitle:v10 forState:0];

  uint64_t v11 = *(unsigned char **)(a1 + 32);
  if (v11[1217])
  {
    [v11 stopPostProcessSpinner];
    uint64_t v11 = *(unsigned char **)(a1 + 32);
  }
  [v11 stopPostProcessTimer];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  id v12 = *(void **)(*(void *)(a1 + 32) + 1136);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_199;
  v21[3] = &unk_1E6EA82F0;
  id v22 = *(id *)(a1 + 40);
  [v12 setState:10 completion:v21];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = *(void **)(v13 + 1128);
  uint64_t v15 = *(unsigned int *)(v13 + 1236);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_200;
  id v19 = &unk_1E6EA82F0;
  id v20 = *(id *)(a1 + 40);
  [v14 triggerSoundHapticForEnrollmentState:v15 completion:&v16];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1144), "setAlpha:", 0.0, v16, v17, v18, v19);
  [*(id *)(a1 + 32) stopEnrollment];
  [*(id *)(a1 + 32) showContinueButton];
  [*(id *)(*(void *)(a1 + 32) + 1032) removeTarget:*(void *)(a1 + 32) action:sel_continueButtonTapped forControlEvents:64];
  [*(id *)(*(void *)(a1 + 32) + 1032) addTarget:*(void *)(a1 + 32) action:sel_cancelSpatialAudioProfile forControlEvents:64];
  *(unsigned char *)(*(void *)(a1 + 32) + 1304) = 1;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_199(uint64_t a1)
{
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_200(uint64_t a1)
{
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_201(uint64_t a1)
{
  v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> Completed Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_205(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = *(void **)(*(void *)(a1 + 40) + 1016);
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"COULDNT_SCAN_EAR" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v2 setTitle:v4];

  uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 1016);
  uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"COULDNT_SCAN_EAR_DETAIL" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v5 setDetailText:v7];

  [*(id *)(a1 + 40) showContinueButton];
  [*(id *)(*(void *)(a1 + 40) + 1032) removeTarget:*(void *)(a1 + 40) action:sel_continueButtonTapped forControlEvents:64];
  uint64_t v8 = *(void **)(*(void *)(a1 + 40) + 1032);
  uint64_t v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"SCAN_AGAIN" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v8 setTitle:v10 forState:0];

  [*(id *)(*(void *)(a1 + 40) + 1032) addTarget:*(void *)(a1 + 40) action:sel_cancelSpatialAudioProfile forControlEvents:64];
  uint64_t v11 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v11);
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_215(uint64_t a1)
{
  v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> CouldntScanEar Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_216(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = *(void **)(*(void *)(a1 + 40) + 1016);
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"HAIR_COVERING_EAR" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v2 setTitle:v4];

  uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 1016);
  uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"HAIR_COVERING_EAR_DETAIL" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v5 setDetailText:v7];

  [*(id *)(a1 + 40) showContinueButton];
  [*(id *)(*(void *)(a1 + 40) + 1032) removeTarget:*(void *)(a1 + 40) action:sel_continueButtonTapped forControlEvents:64];
  uint64_t v8 = *(void **)(*(void *)(a1 + 40) + 1032);
  uint64_t v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"SCAN_AGAIN" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v8 setTitle:v10 forState:0];

  [*(id *)(*(void *)(a1 + 40) + 1032) addTarget:*(void *)(a1 + 40) action:sel_cancelSpatialAudioProfile forControlEvents:64];
  uint64_t v11 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v11);
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_223(uint64_t a1)
{
  v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> HairCoveringEar Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_224(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = *(void **)(*(void *)(a1 + 40) + 1016);
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"GENERAL_FAILURE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v2 setTitle:v4];

  uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 1016);
  uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"GENERAL_FAILURE_DETAIL" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v5 setDetailText:v7];

  uint64_t v8 = *(void **)(*(void *)(a1 + 40) + 1032);
  uint64_t v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"DONE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v8 setTitle:v10 forState:0];

  uint64_t v11 = *(void *)(a1 + 40);
  if (*(void *)(v11 + 1288))
  {
    [(id)v11 cleanUpSpinner];
    uint64_t v11 = *(void *)(a1 + 40);
  }
  if (*(unsigned char *)(v11 + 1217))
  {
    [(id)v11 stopPostProcessSpinner];
    uint64_t v11 = *(void *)(a1 + 40);
  }
  [(id)v11 stopPostProcessTimer];
  [*(id *)(*(void *)(a1 + 40) + 1144) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 40) + 1136) setHidden:1];
  [*(id *)(a1 + 40) stopEnrollment];
  [*(id *)(a1 + 40) showContinueButton];
  [*(id *)(*(void *)(a1 + 40) + 1032) removeTarget:*(void *)(a1 + 40) action:sel_continueButtonTapped forControlEvents:64];
  [*(id *)(*(void *)(a1 + 40) + 1032) addTarget:*(void *)(a1 + 40) action:sel_cancelSpatialAudioProfile forControlEvents:64];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id v12 = *(void **)(*(void *)(a1 + 40) + 1128);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_231;
  v13[3] = &unk_1E6EA82F0;
  id v14 = *(id *)(a1 + 32);
  [v12 triggerSoundHapticForEnrollmentState:19 completion:v13];
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_231(uint64_t a1)
{
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_232(uint64_t a1)
{
  v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> GeneralFailure Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)continueButtonTapped
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int currentStep = self->_currentStep;
    unint64_t sessionState = self->_sessionState;
    v11[0] = 67109376;
    v11[1] = currentStep;
    __int16 v12 = 1024;
    int v13 = sessionState;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: ContinueButton Tapped Current Step %d, Currente Session %d ", (uint8_t *)v11, 0xEu);
  }

  if (!self->_currentStep)
  {
    if ([(HPSSpatialProfileEnrollmentController *)self checkAndShowInEarPopup]) {
      return;
    }
    if (([(BluetoothManager *)self->_btManager available] & 1) == 0)
    {
      uint64_t v9 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11[0]) = 0;
        _os_log_impl(&dword_1E4BFE000, v9, OS_LOG_TYPE_DEFAULT, "Spatial Profile: btManager is not available", (uint8_t *)v11, 2u);
      }

      if (!self->_welcomeSpinnerOn)
      {
        id v10 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v11[0]) = 0;
          _os_log_impl(&dword_1E4BFE000, v10, OS_LOG_TYPE_DEFAULT, "Spatial Profile: btManager is not available starting welcome spinner", (uint8_t *)v11, 2u);
        }

        [(HPSSpatialProfileEnrollmentController *)self startWelcomeSpinner];
      }
    }
  }
  if (self->_enrollmentReady)
  {
    int v6 = self->_currentStep;
    if (v6 > 13) {
      return;
    }
    if (self->_sessionState == 3)
    {
      if (v6 == 12) {
        return;
      }
      uint64_t v7 = self;
      uint64_t v8 = 12;
    }
    else
    {
      uint64_t v8 = (v6 + 1);
      uint64_t v7 = self;
    }
    [(HPSSpatialProfileEnrollmentController *)v7 moveToStep:v8];
  }
  else if (!self->_welcomeSpinnerOn)
  {
    [(HPSSpatialProfileEnrollmentController *)self startWelcomeSpinner];
  }
}

- (void)userCancelEnrollment
{
  uint64_t v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: User Cancelled Spatial Audio Profile", v4, 2u);
  }

  [(HPSSpatialProfileAnalytics *)self->_enrollmentAnalytics updateStatus:0 EnrollmentResult:@"Cancel"];
  [(HPSSpatialProfileEnrollmentController *)self cancelSpatialAudioProfile];
}

- (void)stopTimers
{
  [(HPSSpatialProfileEnrollmentController *)self stopFaceInFrameHandlerTimer];
  [(HPSSpatialProfileEnrollmentController *)self stopOcclusionWarnCoolDownTimer];
  [(HPSSpatialProfileEnrollmentController *)self stopEarDistanceWarnCoolDownTimer];
  [(HPSSpatialProfileEnrollmentController *)self stopEnrollGuidanceTimer];
  [(HPSSpatialProfileEnrollmentController *)self stopCaptureViewTimer];
  [(HPSSpatialProfileEnrollmentController *)self stopPostProcessTimer];

  [(HPSSpatialProfileEnrollmentController *)self stopEarEnrollmentNudgeTimer];
}

- (void)cancelSpatialAudioProfile
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Cancel Spatial Audio Profile", (uint8_t *)&v13, 2u);
  }

  uint64_t v4 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CGFloat x = self->_currentEarBB.origin.x;
    CGFloat y = self->_currentEarBB.origin.y;
    CGFloat width = self->_currentEarBB.size.width;
    CGFloat height = self->_currentEarBB.size.height;
    double leftLastReceivedYaw = self->_leftLastReceivedYaw;
    double rightLastReceivedYaw = self->_rightLastReceivedYaw;
    int v13 = 134219264;
    CGFloat v14 = x;
    __int16 v15 = 2048;
    CGFloat v16 = y;
    __int16 v17 = 2048;
    CGFloat v18 = width;
    __int16 v19 = 2048;
    CGFloat v20 = height;
    __int16 v21 = 2048;
    double v22 = leftLastReceivedYaw;
    __int16 v23 = 2048;
    double v24 = rightLastReceivedYaw;
    _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "Spatial Profile: _currentEarBB.origin.x %f , _currentEarBB.origin.y %f , _currentEarBB.size.width %f , _currentEarBB.size.height %f Left Ear Last Yaw %f Right Ear Last Yaw %f", (uint8_t *)&v13, 0x3Eu);
  }

  if (self->_enrollmentStarted) {
    [(HPSSpatialProfileEnrollmentController *)self stopEnrollment];
  }
  [(HPSSpatialProfileEnrollmentController *)self stopTimers];
  [(HPSSpatialProfileSoundHapticManager *)self->_soundHapticManager stop];
  [(HPSSpatialProfileEnrollmentController *)self resetVolume];
  [(HPSSpatialProfileEarTutorialView *)self->_earTutorialView stopPlayers];
  [(HPSSpatialProfileEnrollmentController *)self dismissViewControllerAnimated:1 completion:&__block_literal_global_237];
  if (self->_enrollmentCompleted)
  {
    uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 postNotificationName:@"HPSSpatialAudioProfileUpdated" object:0];
  }
  if (self->dismissalHandler)
  {
    __int16 v12 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1E4BFE000, v12, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Executing : Dismiss handler", (uint8_t *)&v13, 2u);
    }

    (*((void (**)(void))self->dismissalHandler + 2))();
  }
  [(HPSSpatialProfileAnalytics *)self->_enrollmentAnalytics submitHPSSpatialProfileEnrollAnalytics];
}

- (void)bluetoothDidBecomeAvailable
{
  self->_bluetoothBecameAvailable = 1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__HPSSpatialProfileEnrollmentController_bluetoothDidBecomeAvailable__block_invoke;
  block[3] = &unk_1E6EA82F0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __68__HPSSpatialProfileEnrollmentController_bluetoothDidBecomeAvailable__block_invoke(uint64_t result)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(result + 32) + 1216))
  {
    uint64_t v1 = result;
    v2 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(v1 + 32);
      int v4 = *(unsigned __int8 *)(v3 + 1302);
      int v5 = [*(id *)(v3 + 1400) available];
      v6[0] = 67109376;
      v6[1] = v4;
      __int16 v7 = 1024;
      int v8 = v5;
      _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: bluetoothDidBecomeAvailable -> stopWelcomeSpinner, _enrollmentReady %d [_btManager available] %d", (uint8_t *)v6, 0xEu);
    }

    return [*(id *)(v1 + 32) stopWelcomeSpinner];
  }
  return result;
}

- (void)retrieveProfile
{
  [a1 code];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1E4BFE000, v1, v2, "Spatial Profile: Fetch Completed: Error: %s, Error code: %d", v3, v4, v5, v6, 2u);
}

uint64_t __56__HPSSpatialProfileEnrollmentController_retrieveProfile__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) moveToStep:19];
}

void __56__HPSSpatialProfileEnrollmentController_retrieveProfile__block_invoke_244(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    int v7 = 134218240;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Retrive completion : requestedSize = %lu profileSize = %lu", (uint8_t *)&v7, 0x16u);
  }

  [*(id *)(a1[4] + 1272) appendData:v3];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1[5] + 8) + 40));
}

uint64_t __56__HPSSpatialProfileEnrollmentController_retrieveProfile__block_invoke_246(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 1272) length];
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Retrieved Profile Size: %lu", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 32) moveToStep:15];
}

- (void)syncProfile
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  profileData = self->_profileData;
  if (profileData && [(NSMutableData *)profileData length])
  {
    uint64_t v4 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      NSUInteger v5 = [(NSMutableData *)self->_profileData length];
      *(_DWORD *)buf = 134217984;
      NSUInteger v12 = v5;
      _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Syncing Profile, Size: %lu", buf, 0xCu);
    }

    uint64_t v6 = [MEMORY[0x1E4F50B88] soundProfileRecordWithCustomData:self->_profileData];
    id v7 = objc_alloc_init(MEMORY[0x1E4F50B80]);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__HPSSpatialProfileEnrollmentController_syncProfile__block_invoke;
    v9[3] = &unk_1E6EA8948;
    void v9[4] = self;
    id v10 = v7;
    id v8 = v7;
    [v8 createSoundProfileRecord:v6 completion:v9];
  }
  else
  {
    uint64_t v6 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Cannot Sync Profile, Invalid Profile Data", buf, 2u);
    }
  }
}

void __52__HPSSpatialProfileEnrollmentController_syncProfile__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sharedBluetoothSettingsLogComponent();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (v3)
  {
    if (v5) {
      __61__HPSSpatialProfileSingeStepEnrollmentController_syncProfile__block_invoke_cold_2((uint64_t)v3, v4);
    }
  }
  else if (v5)
  {
    __61__HPSSpatialProfileSingeStepEnrollmentController_syncProfile__block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) moveToStep:16];
  [*(id *)(a1 + 40) invalidate];
}

- (id)angleArrayToBinaryString:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = &stru_1F4097960;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      __int16 v9 = v6;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * v8) captured]) {
          id v10 = @"1%@";
        }
        else {
          id v10 = @"0%@";
        }
        objc_msgSend(NSString, "stringWithFormat:", v10, v9);
        uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v8;
        __int16 v9 = v6;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = &stru_1F4097960;
  }

  return v6;
}

- (void)startTutorialResumeEnrollTimer
{
  id v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Start Tutorial automatic Delay Transition timer", buf, 2u);
  }

  if (self->_tutorialResumeEnrollTimer)
  {
    uint64_t v4 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v9 = 0;
      _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Stopping Tutorial automatic Delay Transition timer…", v9, 2u);
    }

    [(HPSSpatialProfileEnrollmentController *)self stopTutorialResumeEnrollTimer];
  }
  uint64_t v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Starting Tutorial automatic Delay Transition timer", v8, 2u);
  }

  uint64_t v6 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_tutorialResumeEnrollTimerDidFire selector:0 userInfo:0 repeats:3.0];
  tutorialResumeEnrollTimer = self->_tutorialResumeEnrollTimer;
  self->_tutorialResumeEnrollTimer = v6;
}

- (void)tutorialResumeEnrollTimerDidFire
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9[0]) = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Tutorial automatic Delay Transition Timer did Fire", (uint8_t *)v9, 2u);
  }

  int currentStep = self->_currentStep;
  if (currentStep == 9 || currentStep == 5)
  {
    uint64_t v6 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = self->_currentStep;
      BOOL enrollmentPaused = self->_enrollmentPaused;
      v9[0] = 67109376;
      v9[1] = v7;
      __int16 v10 = 1024;
      BOOL v11 = enrollmentPaused;
      _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Starting enrollment while in Ear tutorial %d Enrollment Status %d", (uint8_t *)v9, 0xEu);
    }

    if (self->_enrollmentPaused) {
      [(HPSSpatialProfileEnrollmentController *)self resumeEnrollment];
    }
  }
}

- (void)stopTutorialResumeEnrollTimer
{
  id v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Stopping capture view timer", v5, 2u);
  }

  [(NSTimer *)self->_tutorialResumeEnrollTimer invalidate];
  tutorialResumeEnrollTimer = self->_tutorialResumeEnrollTimer;
  self->_tutorialResumeEnrollTimer = 0;
}

- (void)startCaptureViewTimer
{
  id v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Restart capture view timer", buf, 2u);
  }

  if (self->_captureViewTimer)
  {
    uint64_t v4 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v9 = 0;
      _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Stopping capture view timer…", v9, 2u);
    }

    [(HPSSpatialProfileEnrollmentController *)self stopCaptureViewTimer];
  }
  uint64_t v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Starting capture view timer", v8, 2u);
  }

  uint64_t v6 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_captureViewTimerDidFire selector:0 userInfo:0 repeats:180.0];
  captureViewTimer = self->_captureViewTimer;
  self->_captureViewTimer = v6;
}

- (void)stopCaptureViewTimer
{
  id v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Stopping capture view timer", v5, 2u);
  }

  [(NSTimer *)self->_captureViewTimer invalidate];
  captureViewTimer = self->_captureViewTimer;
  self->_captureViewTimer = 0;
}

- (void)captureViewTimerDidFire
{
  id v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: captureViewTimerDidFire canceling spatial audio profile", buf, 2u);
  }

  uint64_t v4 = (void *)MEMORY[0x1E4FB1418];
  uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:@"CANCEL_ENROLLMENT_ALERT_PROMPT" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  int v7 = [v4 alertControllerWithTitle:v6 message:&stru_1F4097960 preferredStyle:1];

  uint64_t v8 = (void *)MEMORY[0x1E4FB1410];
  __int16 v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  __int16 v10 = [v9 localizedStringForKey:@"CANCEL_ENROLLMENT_ALERT_PROMPT_BUTTON" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__HPSSpatialProfileEnrollmentController_captureViewTimerDidFire__block_invoke;
  v12[3] = &unk_1E6EA83E0;
  void v12[4] = self;
  BOOL v11 = [v8 actionWithTitle:v10 style:0 handler:v12];
  [v7 addAction:v11];

  [(HPSSpatialProfileEnrollmentController *)self presentViewController:v7 animated:1 completion:0];
}

uint64_t __64__HPSSpatialProfileEnrollmentController_captureViewTimerDidFire__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelSpatialAudioProfile];
}

- (BOOL)isEarOccluded
{
  unsigned int currentStep = self->_currentStep;
  BOOL v3 = currentStep > 0xB;
  int v4 = (1 << currentStep) & 0xCC0;
  BOOL v5 = v3 || v4 == 0;
  return !v5 && !self->_supressEarOcclusionWarning && self->_isEarOccluded;
}

- (BOOL)isPresentingWrongEar
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!self->_supressEarEnrollWarning)
  {
    int leftEarStatus = self->_leftEarStatus;
    BOOL v5 = leftEarStatus < 1 || leftEarStatus == 3;
    if (v5 || self->_currentTrackingEar != 2)
    {
      int rightEarStatus = self->_rightEarStatus;
      BOOL v15 = rightEarStatus < 1 || rightEarStatus == 3;
      if (v15 || self->_currentTrackingEar != 1) {
        return 0;
      }
      uint64_t v6 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        BOOL supressEarEnrollWarning = self->_supressEarEnrollWarning;
        int v17 = self->_rightEarStatus;
        int leftEarCaptureCount = self->_leftEarCaptureCount;
        int v19 = 67109632;
        BOOL v20 = supressEarEnrollWarning;
        __int16 v21 = 1024;
        int v22 = v17;
        __int16 v23 = 1024;
        int v24 = leftEarCaptureCount;
        BOOL v11 = "Spatial Profile: Detectin left ear during right enrollment Timeout: %d Right ear status %d Threshold %d";
        uint64_t v12 = v6;
        uint32_t v13 = 20;
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v6 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v7 = self->_supressEarEnrollWarning;
        int v8 = self->_rightEarStatus;
        int v9 = self->_leftEarStatus;
        int v10 = self->_leftEarCaptureCount;
        int v19 = 67109888;
        BOOL v20 = v7;
        __int16 v21 = 1024;
        int v22 = v8;
        __int16 v23 = 1024;
        int v24 = v9;
        __int16 v25 = 1024;
        int v26 = v10;
        BOOL v11 = "Spatial Profile: Detecting right ear during left enrollment Timeout: %d Right ear status %d Left ear statu"
              "s %d Threshold %d";
        uint64_t v12 = v6;
        uint32_t v13 = 26;
LABEL_18:
        _os_log_impl(&dword_1E4BFE000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v19, v13);
      }
    }

    return 1;
  }
  return 0;
}

- (void)alertEarEnrollWarning
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    double currentYaw = self->_currentYaw;
    double candidateYaw = self->_candidateYaw;
    *(_DWORD *)buf = 134218240;
    double v23 = currentYaw;
    __int16 v24 = 2048;
    double v25 = candidateYaw;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Error Message *** Enrolling Left ear while right ear enroll is still pending Current yaw %f Candidate Yaw %f ", buf, 0x16u);
  }

  [(HPSSpatialProfileEnrollmentController *)self pauseEnrollment];
  [(HPSSpatialProfileEnrollmentController *)self forceBlur];
  [(CEKSubjectIndicatorView *)self->_earBoundingBoxView setHidden:1];
  uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v7 = [v6 localizedStringForKey:@"SPATIAL_AUDIO_PROFILE_WRONG_EAR_LEFT_TITLE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];

  int v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v9 = [v8 localizedStringForKey:@"SPATIAL_AUDIO_PROFILE_WRONG_EAR_LEFT_TEXT" value:&stru_1F4097960 table:@"SpatialAudioProfile"];

  if (self->_currentTrackingEar == 1)
  {
    int v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v11 = [v10 localizedStringForKey:@"SPATIAL_AUDIO_PROFILE_WRONG_EAR_RIGHT_TITLE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];

    uint64_t v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v13 = [v12 localizedStringForKey:@"SPATIAL_AUDIO_PROFILE_WRONG_EAR_RIGHT_TEXT" value:&stru_1F4097960 table:@"SpatialAudioProfile"];

    BOOL v7 = (void *)v11;
    int v9 = (void *)v13;
  }
  long long v14 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v7 message:v9 preferredStyle:1];
  BOOL v15 = (void *)MEMORY[0x1E4FB1410];
  CGFloat v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v17 = [v16 localizedStringForKey:@"CANCEL_ENROLLMENT_ALERT_PROMPT_BUTTON" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __62__HPSSpatialProfileEnrollmentController_alertEarEnrollWarning__block_invoke;
  v21[3] = &unk_1E6EA83E0;
  void v21[4] = self;
  CGFloat v18 = [v15 actionWithTitle:v17 style:0 handler:v21];
  [v14 addAction:v18];

  [(HPSSpatialProfileEnrollmentController *)self presentViewController:v14 animated:1 completion:0];
  stepSerialQueue = self->_stepSerialQueue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __62__HPSSpatialProfileEnrollmentController_alertEarEnrollWarning__block_invoke_3;
  v20[3] = &unk_1E6EA82F0;
  void v20[4] = self;
  dispatch_async(stepSerialQueue, v20);
}

void __62__HPSSpatialProfileEnrollmentController_alertEarEnrollWarning__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) startEarEnrollWarningTimer];
  [*(id *)(a1 + 32) cancelBlur];
  [*(id *)(a1 + 32) resumeEnrollment];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__HPSSpatialProfileEnrollmentController_alertEarEnrollWarning__block_invoke_2;
  block[3] = &unk_1E6EA82F0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __62__HPSSpatialProfileEnrollmentController_alertEarEnrollWarning__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1128) playProgressPlayer:*(unsigned int *)(*(void *)(a1 + 32) + 1236)];
}

void __62__HPSSpatialProfileEnrollmentController_alertEarEnrollWarning__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 1128);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__HPSSpatialProfileEnrollmentController_alertEarEnrollWarning__block_invoke_4;
  v5[3] = &unk_1E6EA82F0;
  uint64_t v6 = v2;
  int v4 = v2;
  [v3 triggerSoundHapticForEnrollmentState:19 completion:v5];
}

void __62__HPSSpatialProfileEnrollmentController_alertEarEnrollWarning__block_invoke_4(uint64_t a1)
{
}

- (id)getBudsInEarString
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  [(BluetoothManager *)self->_btManager connectedDevices];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(v2);
        }
        BOOL v7 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (+[HPSProductUtils isAppleHeadphone:v7]
          && ([v7 isTemporaryPaired] & 1) == 0)
        {
          if ([v7 isGenuineAirPods])
          {
            int v8 = +[BTSDeviceClassic deviceWithDevice:v7];
            int v9 = v8;
            if (v8)
            {
              int v24 = 3;
              int v25 = 3;
              int v10 = [v8 classicDevice];
              [v10 inEarStatusPrimary:&v25 secondary:&v24];

              if (!v25 || !v24)
              {
                uint64_t v12 = [v9 classicDevice];
                unsigned int v13 = [v12 productId];

                objc_msgSend(NSString, "stringWithFormat:", @"ACCESSORY_MODEL_NAME_%d", v13 - 0x2000);
                long long v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
                BOOL v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
                CGFloat v16 = [v15 localizedStringForKey:v14 value:&stru_1F4097960 table:@"SpatialAudioProfile"];
                if ([v16 length] && v13 >= 0x200A)
                {

                  if (v13 >> 4 <= 0x200)
                  {
LABEL_27:
                    int v17 = sharedBluetoothSettingsLogComponent();
                    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                    {
                      CGFloat v18 = [v9 classicDevice];
                      int v19 = [v18 name];
                      *(_DWORD *)buf = 138412290;
                      v33 = v19;
                      _os_log_impl(&dword_1E4BFE000, v17, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Device %@, bud in ear", buf, 0xCu);
                    }
                    BOOL v20 = [(id)MGGetStringAnswer() uppercaseString];
                    uint64_t v11 = [@"SPATIAL_AUDIO_PROFILE_IED_WARN_" stringByAppendingFormat:@"%@_%@", v20, v14];

                    if (v13 == 8215)
                    {
                      __int16 v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
                      uint64_t v22 = [v21 localizedStringForKey:@"SPATIAL_AUDIO_PROFILE_IED_WARN_IPHONE_ACCESSORY_MODEL_NAME_23" value:&stru_1F4097960 table:@"DeviceConfig-B453"];

                      uint64_t v11 = (void *)v22;
                    }

                    goto LABEL_32;
                  }
                }
                else
                {
                }
                if (v13 == 8210) {
                  long long v14 = @"ACCESSORY_MODEL_NAME_18";
                }
                else {
                  long long v14 = @"ACCESSORY_MODEL_NAME_15";
                }
                goto LABEL_27;
              }
            }
          }
          else
          {
            int v9 = sharedBluetoothSettingsLogComponent();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
              [(HPSSpatialProfileSingeStepEnrollmentController *)&v26 getBudsInEarString];
            }
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 0;
LABEL_32:

  return v11;
}

- (void)triggerFaceInFrameHandlerTimeout
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int faceBoundingBoxStatus = self->_faceBoundingBoxStatus;
    *(_DWORD *)buf = 67109120;
    int v12 = faceBoundingBoxStatus;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Update Face Capture %d ", buf, 8u);
  }

  if ((self->_currentStep & 0xFFFFFFFE) == 2)
  {
    if (self->_faceBoundingBoxStatus == 1 && !self->_faceCaptured)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __73__HPSSpatialProfileEnrollmentController_triggerFaceInFrameHandlerTimeout__block_invoke;
      block[3] = &unk_1E6EA82F0;
      void block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
      uint64_t v5 = (void *)MEMORY[0x1E4F1CB00];
      double v6 = 1.0;
    }
    else
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      _DWORD v9[2] = __73__HPSSpatialProfileEnrollmentController_triggerFaceInFrameHandlerTimeout__block_invoke_2;
      v9[3] = &unk_1E6EA82F0;
      void v9[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], v9);
      uint64_t v5 = (void *)MEMORY[0x1E4F1CB00];
      double v6 = 3.0;
    }
    BOOL v7 = [v5 scheduledTimerWithTimeInterval:self target:sel_triggerFaceInFrameHandlerTimeout selector:0 userInfo:0 repeats:v6];
    faceInFrameHandlerTimer = self->_faceInFrameHandlerTimer;
    self->_faceInFrameHandlerTimer = v7;
  }
  else
  {
    [(HPSSpatialProfileEnrollmentController *)self stopFaceInFrameHandlerTimer];
  }
}

void __73__HPSSpatialProfileEnrollmentController_triggerFaceInFrameHandlerTimeout__block_invoke(uint64_t a1)
{
  id v12 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v2 = [v12 objectForKey:*MEMORY[0x1E4F1C490]];
  int v3 = [v2 BOOLValue];

  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 1016);
  uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v6 = [v5 localizedStringForKey:@"FACE_TOO_CLOSE_TITLE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v4 setTitle:v6];

  BOOL v7 = *(void **)(*(void *)(a1 + 32) + 1016);
  int v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v9 = v8;
  if (v3) {
    int v10 = @"FACE_TOO_CLOSE_DETAIL_METRICS";
  }
  else {
    int v10 = @"FACE_TOO_CLOSE_DETAIL_IMPERIAL";
  }
  uint64_t v11 = [v8 localizedStringForKey:v10 value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v7 setDetailText:v11];
}

void __73__HPSSpatialProfileEnrollmentController_triggerFaceInFrameHandlerTimeout__block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 1016);
  int v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"FRONT_VIEW_CAPTURE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v2 setTitle:v4];

  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 1016);
  id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v6 = [v7 localizedStringForKey:@"FRONT_VIEW_DETAIL" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v5 setDetailText:v6];
}

- (void)startFaceInFrameHandlerTimer
{
  if (self->_faceInFrameHandlerTimer)
  {
    int v3 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Face Tracker Timer already started, stopping it first", buf, 2u);
    }

    [(HPSSpatialProfileEnrollmentController *)self stopFaceInFrameHandlerTimer];
  }
  uint64_t v4 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Face Tracker Timer", v7, 2u);
  }

  uint64_t v5 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_triggerFaceInFrameHandlerTimeout selector:0 userInfo:0 repeats:3.0];
  faceInFrameHandlerTimer = self->_faceInFrameHandlerTimer;
  self->_faceInFrameHandlerTimer = v5;
}

- (void)stopFaceInFrameHandlerTimer
{
  int v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Stopping Face Tracker Timer", v5, 2u);
  }

  [(NSTimer *)self->_faceInFrameHandlerTimer invalidate];
  faceInFrameHandlerTimer = self->_faceInFrameHandlerTimer;
  self->_faceInFrameHandlerTimer = 0;
}

- (void)startOcclusionWarnCoolDownTimer
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__HPSSpatialProfileEnrollmentController_startOcclusionWarnCoolDownTimer__block_invoke;
  block[3] = &unk_1E6EA82F0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __72__HPSSpatialProfileEnrollmentController_startOcclusionWarnCoolDownTimer__block_invoke(uint64_t a1, double a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 1416))
  {
    [(id)v3 stopOcclusionWarnCoolDownTimer];
    uint64_t v3 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(v3 + 1424) = 1;
  LOBYTE(a2) = *(unsigned char *)(*(void *)(a1 + 32) + 1425);
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CB00], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", (double)*(unint64_t *)&a2);
  uint64_t v5 = *(void *)(a1 + 32);
  double v6 = *(void **)(v5 + 1416);
  *(void *)(v5 + 1416) = v4;

  id v7 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 1425);
    v11[0] = 67109120;
    v11[1] = v8;
    _os_log_impl(&dword_1E4BFE000, v7, OS_LOG_TYPE_DEFAULT, "Spatial Profile:Start Occlusion timer for %dSec", (uint8_t *)v11, 8u);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  unsigned int v10 = *(unsigned __int8 *)(v9 + 1425);
  if (v10 <= 0x1E) {
    *(unsigned char *)(v9 + 1425) = v10 + 5;
  }
}

- (void)restartOcclusionWarnCoolDownTimer
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__HPSSpatialProfileEnrollmentController_restartOcclusionWarnCoolDownTimer__block_invoke;
  block[3] = &unk_1E6EA82F0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __74__HPSSpatialProfileEnrollmentController_restartOcclusionWarnCoolDownTimer__block_invoke(uint64_t a1, double a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 1416))
  {
    [(id)v3 stopOcclusionWarnCoolDownTimer];
    uint64_t v3 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(v3 + 1424) = 1;
  LOBYTE(a2) = *(unsigned char *)(*(void *)(a1 + 32) + 1425);
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CB00], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", (double)*(unint64_t *)&a2);
  uint64_t v5 = *(void *)(a1 + 32);
  double v6 = *(void **)(v5 + 1416);
  *(void *)(v5 + 1416) = v4;

  id v7 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 1425);
    v9[0] = 67109120;
    v9[1] = v8;
    _os_log_impl(&dword_1E4BFE000, v7, OS_LOG_TYPE_DEFAULT, "Spatial Profile:Restart Occlusion warning timer to  %dSec", (uint8_t *)v9, 8u);
  }
}

- (void)triggerOcclusionWarnCoolDownTimer
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  self->_supressEarOcclusionWarning = 0;
  uint64_t v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isLookingAtPhone) {
      uint64_t v4 = @"YES";
    }
    else {
      uint64_t v4 = @"NO";
    }
    int v5 = 138412290;
    double v6 = v4;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile:Ready to show occlusion error %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)stopOcclusionWarnCoolDownTimer
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isLookingAtPhone) {
      uint64_t v4 = @"YES";
    }
    else {
      uint64_t v4 = @"NO";
    }
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Stopping Occlusion Timer Attention %@", (uint8_t *)&v6, 0xCu);
  }

  [(NSTimer *)self->_occlusionWarnCoolDownTimer invalidate];
  occlusionWarnCoolDownTimer = self->_occlusionWarnCoolDownTimer;
  self->_occlusionWarnCoolDownTimer = 0;
}

- (void)alertOcclusionWarning
{
  [(HPSSpatialProfileEnrollmentController *)self updateBoundingBoxHiddenStatus];
  int currentStep = self->_currentStep;
  if ((currentStep & 0xFFFFFFFE) == 6)
  {
    [(HPSSpatialProfileAnalytics *)self->_enrollmentAnalytics incrementRightEarOcclusionCount];
    int currentStep = self->_currentStep;
  }
  if ((currentStep & 0xFFFFFFFE) == 0xA) {
    [(HPSSpatialProfileAnalytics *)self->_enrollmentAnalytics incrementLeftEarOcclusionCount];
  }
  [(HPSSpatialProfileEnrollmentController *)self pauseEnrollment];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__HPSSpatialProfileEnrollmentController_alertOcclusionWarning__block_invoke;
  block[3] = &unk_1E6EA82F0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __62__HPSSpatialProfileEnrollmentController_alertOcclusionWarning__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) getBudsInEarString];
  [*(id *)(a1 + 32) clearBoundingBox];
  [*(id *)(*(void *)(a1 + 32) + 1128) pauseProgressPlayer];
  [*(id *)(*(void *)(a1 + 32) + 1128) pauseEnrollGuidancePlayer];
  [*(id *)(a1 + 32) forceBlur];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 1016);
  uint64_t v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v5 = [v4 localizedStringForKey:@"OCCLUSION_EAR" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v3 setTitle:v5];

  int v6 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"Buds In ear";
    if (!v2) {
      uint64_t v7 = @"General";
    }
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(v8 + 1568);
    uint64_t v10 = *(void *)(v8 + 1576);
    *(_DWORD *)buf = 138412802;
    int v24 = v7;
    __int16 v25 = 2048;
    uint64_t v26 = v9;
    __int16 v27 = 2048;
    uint64_t v28 = v10;
    _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Error Message *** Occlusion detection warning shown to user : %@ Current Yaw %f Candidate Yaw %f", buf, 0x20u);
  }

  uint64_t v11 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v12 = *(void **)(v11 + 1016);
    uint64_t v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    long long v14 = v13;
    BOOL v15 = v2;
LABEL_11:
    int v17 = [v13 localizedStringForKey:v15 value:&stru_1F4097960 table:@"SpatialAudioProfile"];
    [v12 setDetailText:v17];

    goto LABEL_12;
  }
  unsigned int v16 = *(_DWORD *)(v11 + 1236) & 0xFFFFFFFE;
  if (v16 == 6)
  {
    uint64_t v12 = *(void **)(v11 + 1016);
    uint64_t v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    long long v14 = v13;
    BOOL v15 = @"OCCLUSION_EAR_DETAIL_RIGHT";
    goto LABEL_11;
  }
  if (v16 == 10)
  {
    uint64_t v12 = *(void **)(v11 + 1016);
    uint64_t v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    long long v14 = v13;
    BOOL v15 = @"OCCLUSION_EAR_DETAIL_LEFT";
    goto LABEL_11;
  }
LABEL_12:
  CGFloat v18 = dispatch_group_create();
  dispatch_group_enter(v18);
  int v19 = *(void **)(*(void *)(a1 + 32) + 1128);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __62__HPSSpatialProfileEnrollmentController_alertOcclusionWarning__block_invoke_344;
  v21[3] = &unk_1E6EA82F0;
  uint64_t v22 = v18;
  BOOL v20 = v18;
  [v19 triggerSoundHapticForEnrollmentState:19 completion:v21];
  [*(id *)(a1 + 32) showOcclusionContinueButton];
}

void __62__HPSSpatialProfileEnrollmentController_alertOcclusionWarning__block_invoke_344(uint64_t a1)
{
}

- (void)continueOcclusionWarning
{
  uint64_t v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Occlusion Continue Button Tapped", buf, 2u);
  }

  [(HPSSpatialProfileEnrollmentController *)self resumeEnrollment];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__HPSSpatialProfileEnrollmentController_continueOcclusionWarning__block_invoke;
  block[3] = &unk_1E6EA82F0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
  self->_isEarOccluded = 0;
  self->_earOcclusionDetectTracker = 0;
  [(HPSSpatialProfileSoundHapticManager *)self->_soundHapticManager playProgressPlayer:self->_currentStep];
  [(HPSSpatialProfileEnrollmentController *)self startOcclusionWarnCoolDownTimer];
}

uint64_t __65__HPSSpatialProfileEnrollmentController_continueOcclusionWarning__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) cancelBlur];
  [*(id *)(a1 + 32) hideOcclusionContinueButton];
  id v2 = *(void **)(a1 + 32);

  return [v2 updateEarEnrollText];
}

- (void)updateEarEnrollText
{
  switch(self->_currentStep)
  {
    case 6:
    case 7:
      infoView = self->_infoView;
      uint64_t v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      int v5 = [v4 localizedStringForKey:@"RIGHT_EAR_CAPTURE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
      [(OBHeaderView *)infoView setTitle:v5];

      int v6 = self->_infoView;
      uint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v8 = @"RIGHT_EAR_DETAIL";
      goto LABEL_4;
    case 0xA:
    case 0xB:
      uint64_t v9 = self->_infoView;
      uint64_t v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v11 = [v10 localizedStringForKey:@"LEFT_EAR_CAPTURE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
      [(OBHeaderView *)v9 setTitle:v11];

      int v6 = self->_infoView;
      uint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v8 = @"LEFT_EAR_DETAIL";
LABEL_4:
      id v13 = v7;
      uint64_t v12 = [v7 localizedStringForKey:v8 value:&stru_1F4097960 table:@"SpatialAudioProfile"];
      [(OBHeaderView *)v6 setDetailText:v12];

      break;
    default:
      return;
  }
}

- (void)startEarEnrollWarningTimer
{
  if (self->_startEarEnrollWarningCoolDownTimer)
  {
    uint64_t v3 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Wrong ear check", buf, 2u);
    }

    [(NSTimer *)self->_startEarEnrollWarningCoolDownTimer invalidate];
    startEarEnrollWarningCoolDownTimer = self->_startEarEnrollWarningCoolDownTimer;
    self->_startEarEnrollWarningCoolDownTimer = 0;
  }
  self->_BOOL supressEarEnrollWarning = 1;
  int v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Wrong ear check shown, wait some time before showing again", v8, 2u);
  }

  int v6 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_triggerstartEarEnrollWarningTimer selector:0 userInfo:0 repeats:3.0];
  uint64_t v7 = self->_startEarEnrollWarningCoolDownTimer;
  self->_startEarEnrollWarningCoolDownTimer = v6;
}

- (void)triggerstartEarEnrollWarningTimer
{
  self->_BOOL supressEarEnrollWarning = 0;
  id v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Wrong Ear warning Process Timeout", v3, 2u);
  }
}

- (void)startPostProcessTimer
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_postProcessTimer)
  {
    uint64_t v3 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Post Process Timer already started, stopping it first", (uint8_t *)&v10, 2u);
    }

    [(HPSSpatialProfileEnrollmentController *)self stopPostProcessTimer];
  }
  if (MGGetBoolAnswer()) {
    double v4 = 120.0;
  }
  else {
    double v4 = 240.0;
  }
  int v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    double v11 = v4;
    _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Starting Post Process Timer %f", (uint8_t *)&v10, 0xCu);
  }

  int v6 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_triggerPostProcessTimeout selector:0 userInfo:0 repeats:v4];
  postProcessTimer = self->_postProcessTimer;
  self->_postProcessTimer = v6;

  uint64_t v8 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_startPostProcessSpinner selector:0 userInfo:0 repeats:2.0];
  postProcessSpinnerTimer = self->_postProcessSpinnerTimer;
  self->_postProcessSpinnerTimer = v8;
}

- (void)stopPostProcessTimer
{
  uint64_t v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Stopping Post Process Timer", v6, 2u);
  }

  [(NSTimer *)self->_postProcessTimer invalidate];
  postProcessTimer = self->_postProcessTimer;
  self->_postProcessTimer = 0;

  [(NSTimer *)self->_postProcessSpinnerTimer invalidate];
  postProcessSpinnerTimer = self->_postProcessSpinnerTimer;
  self->_postProcessSpinnerTimer = 0;
}

- (void)triggerPostProcessTimeout
{
  uint64_t v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Triggering Post Process Timeout", v4, 2u);
  }

  [(HPSSpatialProfileEnrollmentController *)self moveToStep:19];
}

- (void)didReceiveStateUpdateForSession:(id)a3 stateInfo:(id)a4
{
  uint64_t v235 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1E4F655E8];
  uint64_t v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F655E8]];
  if (!v9
    || (int v10 = (void *)v9,
        [v7 objectForKeyedSubscript:*v8],
        double v11 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) == 0))
  {
    -[HPSSpatialProfileEnrollmentController didReceiveStateUpdateForSession:stateInfo:]();
  }

  uint64_t v12 = [v7 objectForKeyedSubscript:*v8];
  *(double *)&unint64_t v13 = COERCE_DOUBLE([v12 integerValue]);

  long long v14 = (void *)MEMORY[0x1E4F655C0];
  BOOL v15 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F655C0]];

  if (v15)
  {
    double v16 = [v7 objectForKeyedSubscript:*v14];
    double v17 = v16;
    if (v16 != 0.0)
    {
      [*(id *)&v16 code];
      CGFloat v18 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v209 = v17;
        _os_log_impl(&dword_1E4BFE000, v18, OS_LOG_TYPE_DEFAULT, "Spatial Profile: didReceiveStateUpdateForSession  ERROR: %@ ", buf, 0xCu);
      }

      if (self->_currentStep != 19) {
        [(HPSSpatialProfileEnrollmentController *)self moveToStep:19];
      }
      int v19 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[HPSSpatialProfileSingeStepEnrollmentController didReceiveStateUpdateForSession:stateInfo:].cold.4(*(void **)&v17);
      }
    }
  }
  if (self->_sessionState != v13)
  {
    BOOL v20 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v209 = *(double *)&v13;
      _os_log_impl(&dword_1E4BFE000, v20, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Frame Rate : Update Session %lu", buf, 0xCu);
    }

    self->_unint64_t sessionState = v13;
  }
  if (v13 - 1 <= 1) {
    [(HPSSpatialProfileAnalytics *)self->_enrollmentAnalytics incrementFrameCount];
  }
  __int16 v21 = (void *)MEMORY[0x1E4F655D8];
  uint64_t v22 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F655D8]];

  if (v22)
  {
    double v23 = [v7 objectForKeyedSubscript:*v21];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      -[HPSSpatialProfileEnrollmentController didReceiveStateUpdateForSession:stateInfo:]();
    }

    int v24 = [v7 objectForKeyedSubscript:*v21];
    [v24 doubleValue];
    double v26 = v25;
  }
  else
  {
    double v26 = 0.0;
  }
  unint64_t v27 = 0x1EAE8C000;
  switch(v13)
  {
    case 0uLL:
      uint64_t v28 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v28, OS_LOG_TYPE_DEFAULT, "Spatial Profile: State Update: Idle", buf, 2u);
      }

      goto LABEL_274;
    case 1uLL:
      uint64_t v29 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F655C8]];
      long long v30 = v29;
      if (!v29) {
        goto LABEL_170;
      }
      [v29 faceBoundingBox];
      if (!CGRectEqualToRect(v236, *MEMORY[0x1E4F1DB28]) && !self->_faceCaptured)
      {
        [v30 faceBoundingBox];
        -[HPSSpatialProfileEnrollmentController updateFaceTrackingStatus:](self, "updateFaceTrackingStatus:");
      }
      id v177 = v7;
      v180 = v30;
      id v174 = v6;
      if (!self->_faceStraightZeroAngleCaptured)
      {
        long long v204 = 0u;
        long long v205 = 0u;
        long long v202 = 0u;
        long long v203 = 0u;
        long long v31 = [v30 yawAngles];
        uint64_t v32 = [v31 countByEnumeratingWithState:&v202 objects:v234 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v203;
          do
          {
            for (uint64_t i = 0; i != v33; ++i)
            {
              if (*(void *)v203 != v34) {
                objc_enumerationMutation(v31);
              }
              uint64_t v36 = *(void **)(*((void *)&v202 + 1) + 8 * i);
              [v36 angle];
              if (v37 == 0.0 && [v36 captured])
              {
                self->_faceStraightZeroAngleCaptured = 1;
                v38 = sharedBluetoothSettingsLogComponent();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                {
                  [v36 angle];
                  double v40 = v39;
                  int v41 = [v36 captured];
                  *(_DWORD *)buf = 134218240;
                  double v209 = v40;
                  __int16 v210 = 1024;
                  LODWORD(v211) = v41;
                  _os_log_impl(&dword_1E4BFE000, v38, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Captured straight face angle %f ->  %d", buf, 0x12u);
                }
              }
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v202 objects:v234 count:16];
          }
          while (v33);
        }

        long long v30 = v180;
      }
      if ([v30 hasYawAngle] && objc_msgSend(v30, "hasPitchAngle"))
      {
        if (self->_faceDetected || !self->_faceStraightZeroAngleCaptured || self->_currentStep != 2) {
          goto LABEL_111;
        }
        v42 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E4BFE000, v42, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Fill up Straight angle: Transition to View CaptureMoveHead", buf, 2u);
        }

        self->_faceDetected = 1;
        uint64_t v43 = 3;
      }
      else
      {
        if (!self->_faceDetected || self->_currentStep != 3) {
          goto LABEL_111;
        }
        v68 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E4BFE000, v68, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Face NOT Detected, Return to previous step", buf, 2u);
        }

        self->_faceDetected = 0;
        uint64_t v43 = 2;
      }
      [(HPSSpatialProfileEnrollmentController *)self moveToStep:v43];
LABEL_111:
      long long v200 = 0u;
      long long v201 = 0u;
      long long v198 = 0u;
      long long v199 = 0u;
      v79 = [v30 yawAngles];
      uint64_t v80 = [v79 countByEnumeratingWithState:&v198 objects:v233 count:16];
      if (v80)
      {
        uint64_t v81 = v80;
        uint64_t v82 = *(void *)v199;
        do
        {
          for (uint64_t j = 0; j != v81; ++j)
          {
            if (*(void *)v199 != v82) {
              objc_enumerationMutation(v79);
            }
            if (self->_faceDetected)
            {
              v84 = *(void **)(*((void *)&v198 + 1) + 8 * j);
              [v84 angle];
              if (v85 > 0.0 && [v84 captured] && !self->_faceRightFilled)
              {
                uint64_t v91 = sharedBluetoothSettingsLogComponent();
                if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
                {
                  [v84 angle];
                  *(_DWORD *)buf = 134217984;
                  double v209 = v92;
                  _os_log_impl(&dword_1E4BFE000, v91, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Fill up Right with Yaw: %f", buf, 0xCu);
                }

                self->_faceRightFilled = 1;
                if (self->_faceUpFilled) {
                  [(HPSSpatialProfileEnrollmentController *)self fillFacePillsByDirection:1];
                }
                uint64_t v89 = 0;
                if (self->_faceDownFilled)
                {
                  uint64_t v90 = 7;
LABEL_136:
                  [(HPSSpatialProfileEnrollmentController *)self fillFacePillsByDirection:v90];
                }
LABEL_137:
                [(HPSSpatialProfileEnrollmentController *)self fillFacePillsByDirection:v89];
                continue;
              }
              if (self->_faceDetected)
              {
                [v84 angle];
                if (v86 < 0.0 && [v84 captured] && !self->_faceLeftFilled)
                {
                  v87 = sharedBluetoothSettingsLogComponent();
                  if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
                  {
                    [v84 angle];
                    *(_DWORD *)buf = 134217984;
                    double v209 = v88;
                    _os_log_impl(&dword_1E4BFE000, v87, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Fill up Left with Yaw: %f", buf, 0xCu);
                  }

                  self->_faceLeftFilled = 1;
                  if (self->_faceUpFilled) {
                    [(HPSSpatialProfileEnrollmentController *)self fillFacePillsByDirection:3];
                  }
                  uint64_t v89 = 4;
                  if (self->_faceDownFilled)
                  {
                    uint64_t v90 = 5;
                    goto LABEL_136;
                  }
                  goto LABEL_137;
                }
              }
            }
          }
          uint64_t v81 = [v79 countByEnumeratingWithState:&v198 objects:v233 count:16];
        }
        while (v81);
      }

      long long v196 = 0u;
      long long v197 = 0u;
      long long v194 = 0u;
      long long v195 = 0u;
      v93 = [v180 pitchAngles];
      uint64_t v94 = [v93 countByEnumeratingWithState:&v194 objects:v232 count:16];
      if (!v94)
      {
LABEL_169:

        id v6 = v174;
        id v7 = v177;
        unint64_t v27 = 0x1EAE8C000uLL;
        long long v30 = v180;
LABEL_170:
        if (v26 == 1.0 && !self->_faceCaptured)
        {
          v107 = sharedBluetoothSettingsLogComponent();
          if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
          {
            [(BKUIPearlEnrollView *)self->_enrollView percentOfPillsCompleted];
            *(_DWORD *)buf = 134217984;
            double v209 = v108;
            _os_log_impl(&dword_1E4BFE000, v107, OS_LOG_TYPE_DEFAULT, "Spatial Profile: State Update: Face Captured %f", buf, 0xCu);
          }

          self->_faceCaptured = 1;
          *(Class *)((char *)&self->super.super.super.isa + *(int *)(v27 + 3932)) = 0;
          v109 = dispatch_get_global_queue(21, 0);
          v193[0] = MEMORY[0x1E4F143A8];
          v193[1] = 3221225472;
          v193[2] = __83__HPSSpatialProfileEnrollmentController_didReceiveStateUpdateForSession_stateInfo___block_invoke;
          v193[3] = &unk_1E6EA82F0;
          v193[4] = self;
          dispatch_async(v109, v193);
        }
        goto LABEL_273;
      }
      uint64_t v95 = v94;
      uint64_t v96 = *(void *)v195;
LABEL_142:
      uint64_t v97 = 0;
      while (1)
      {
        if (*(void *)v195 != v96) {
          objc_enumerationMutation(v93);
        }
        if (!self->_faceDetected) {
          goto LABEL_167;
        }
        uint64_t v98 = *(void **)(*((void *)&v194 + 1) + 8 * v97);
        [v98 angle];
        if (v99 > 0.0 && [v98 captured] && !self->_faceUpFilled) {
          break;
        }
        if (!self->_faceDetected) {
          goto LABEL_167;
        }
        [v98 angle];
        if (v100 >= 0.0 || ![v98 captured] || self->_faceDownFilled) {
          goto LABEL_167;
        }
        v101 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
        {
          [v98 angle];
          *(_DWORD *)buf = 134217984;
          double v209 = v102;
          _os_log_impl(&dword_1E4BFE000, v101, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Fill up Down with Pitch: %f", buf, 0xCu);
        }

        self->_faceDownFilled = 1;
        if (self->_faceLeftFilled) {
          [(HPSSpatialProfileEnrollmentController *)self fillFacePillsByDirection:5];
        }
        uint64_t v103 = 6;
        if (self->_faceRightFilled)
        {
          uint64_t v104 = 7;
LABEL_165:
          [(HPSSpatialProfileEnrollmentController *)self fillFacePillsByDirection:v104];
        }
LABEL_166:
        [(HPSSpatialProfileEnrollmentController *)self fillFacePillsByDirection:v103];
LABEL_167:
        if (v95 == ++v97)
        {
          uint64_t v95 = [v93 countByEnumeratingWithState:&v194 objects:v232 count:16];
          if (!v95) {
            goto LABEL_169;
          }
          goto LABEL_142;
        }
      }
      id v105 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
      {
        [v98 angle];
        *(_DWORD *)buf = 134217984;
        double v209 = v106;
        _os_log_impl(&dword_1E4BFE000, v105, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Fill up Up with Pitch: %f", buf, 0xCu);
      }

      self->_faceUpFilled = 1;
      if (self->_faceLeftFilled) {
        [(HPSSpatialProfileEnrollmentController *)self fillFacePillsByDirection:3];
      }
      uint64_t v103 = 2;
      if (!self->_faceRightFilled) {
        goto LABEL_166;
      }
      uint64_t v104 = 1;
      goto LABEL_165;
    case 2uLL:
      long long v30 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F655B8]];
      uint64_t v44 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F655D0]];
      v45 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F655E0]];
      uint64_t v46 = [v30 earCaptureStatus];
      [v30 earBoundingBox];
      double v48 = v47;
      double v50 = v49;
      double v52 = v51;
      double v54 = v53;
      -[HPSSpatialProfileEnrollmentController updateCurrentTrackingEar:rightEarPoseStatus:earBoundingBox:earStatus:](self, "updateCurrentTrackingEar:rightEarPoseStatus:earBoundingBox:earStatus:", v44, v45, v46);
      int currentStep = self->_currentStep;
      if (currentStep == 9)
      {
        if (self->_currentTrackingEar != 1) {
          goto LABEL_272;
        }
        v56 = v45;
        v57 = sharedBluetoothSettingsLogComponent();
        if (!os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_95;
        }
        *(_WORD *)buf = 0;
        uint64_t v58 = "Spatial Profile: Deteceted Left Ear when in Tutorial View, Pivot to enrollment ";
        goto LABEL_94;
      }
      if (currentStep == 5)
      {
        if (self->_currentTrackingEar != 2) {
          goto LABEL_272;
        }
        v56 = v45;
        v57 = sharedBluetoothSettingsLogComponent();
        if (!os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_95;
        }
        *(_WORD *)buf = 0;
        uint64_t v58 = "Spatial Profile: Deteceted Right Ear when in Tutorial View, Pivot to right ear enrollment ";
LABEL_94:
        _os_log_impl(&dword_1E4BFE000, v57, OS_LOG_TYPE_DEFAULT, v58, buf, 2u);
LABEL_95:

        [(HPSSpatialProfileEnrollmentController *)self continueButtonTapped];
        v45 = v56;
        goto LABEL_272;
      }
      v173 = v30;
      id v69 = sharedBluetoothSettingsLogComponent();
      v181 = v44;
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
      {
        *(double *)&v135 = COERCE_DOUBLE(@"NO");
        if (v44 && [v44 hasYawAngle]) {
          *(double *)&v135 = COERCE_DOUBLE(@"YES");
        }
        v136 = @"NO";
        if (v45)
        {
          if ([v45 hasYawAngle]) {
            v136 = @"YES";
          }
          else {
            v136 = @"NO";
          }
        }
        if (v44)
        {
          if ([v44 hasYawAngle])
          {
            [v44 currentYawAngle];
            unint64_t v137 = v165;
          }
          else
          {
            unint64_t v137 = 0xC059000000000000;
          }
          if ([v44 hasPitchAngle])
          {
            [v44 currentPitchAngle];
            unint64_t v138 = v166;
          }
          else
          {
            unint64_t v138 = 0xC059000000000000;
          }
        }
        else
        {
          unint64_t v137 = 0xC059000000000000;
          unint64_t v138 = 0xC059000000000000;
        }
        if (v45)
        {
          if ([v45 hasYawAngle])
          {
            [v45 currentYawAngle];
            unint64_t v167 = v169;
          }
          else
          {
            unint64_t v167 = 0xC059000000000000;
          }
          if ([v45 hasPitchAngle]) {
            [v45 currentPitchAngle];
          }
          else {
            unint64_t v168 = 0xC059000000000000;
          }
        }
        else
        {
          unint64_t v167 = 0xC059000000000000;
          unint64_t v168 = 0xC059000000000000;
        }
        v170 = @"YES";
        if (!self->_earBoundingBoxDetected) {
          v170 = @"NO";
        }
        *(_DWORD *)buf = 138415106;
        double v209 = *(double *)&v135;
        __int16 v210 = 2112;
        v211 = v136;
        __int16 v212 = 2048;
        unint64_t v213 = v137;
        __int16 v214 = 2048;
        unint64_t v215 = v138;
        __int16 v216 = 2048;
        unint64_t v217 = v167;
        __int16 v218 = 2048;
        unint64_t v219 = v168;
        __int16 v220 = 2112;
        v221 = v170;
        __int16 v222 = 2048;
        double v223 = v48;
        __int16 v224 = 2048;
        double v225 = v50;
        __int16 v226 = 2048;
        double v227 = v52;
        __int16 v228 = 2048;
        double v229 = v54;
        __int16 v230 = 1024;
        int v231 = v46;
        _os_log_debug_impl(&dword_1E4BFE000, v69, OS_LOG_TYPE_DEBUG, "Spatial Profile: Left :%@ Right:%@ Yaw-Pitch left (%f ,%f) Right (%f ,%f)Ear Bounding Box: : %@ origin(%f, %f), size(%f, %f) Status %d", buf, 0x76u);
        unint64_t v27 = 0x1EAE8C000;
      }

      long long v30 = v173;
      if (self->_enrollmentPaused) {
        goto LABEL_180;
      }
      v237.origin.CGFloat x = v48;
      v237.origin.CGFloat y = v50;
      v237.size.CGFloat width = v52;
      v237.size.CGFloat height = v54;
      if (!CGRectEqualToRect(v237, *MEMORY[0x1E4F1DB28]))
      {
        uint64_t v70 = v45;
        v71 = [(HPSSpatialProfileVideoCaptureSession *)self->videoCaptureSession previewLayer];
        [v71 frame];
        -[HPSSpatialProfileEnrollmentController translateEarBoundingBox:previewLayerBoundingBox:](self, "translateEarBoundingBox:previewLayerBoundingBox:", v48, v50, v52, v54, v72, v73, v74, v75);

        if (!self->_rightEarDetected && self->_currentStep == 6)
        {
          dispatch_time_t v76 = sharedBluetoothSettingsLogComponent();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1E4BFE000, v76, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Right Ear Detected", buf, 2u);
          }

          self->_rightEarDetected = 1;
          [(HPSSpatialProfileEnrollmentController *)self moveToStep:7];
        }
        v45 = v70;
        if (!self->_leftEarDetected && self->_currentStep == 10)
        {
          id v77 = sharedBluetoothSettingsLogComponent();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1E4BFE000, v77, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Left Ear Detected", buf, 2u);
          }

          [(HPSSpatialProfileEnrollmentController *)self pauseEnrollment];
          self->_leftEarDetected = 1;
          [(HPSSpatialProfileEnrollmentController *)self moveToStep:11];
          v45 = v70;
        }
      }
      [(HPSSpatialProfileEnrollmentController *)self updateBoundingBoxHiddenStatus];
      if ([(HPSSpatialProfileEnrollmentController *)self isEarTooClose])
      {
        uint64_t v78 = 3;
LABEL_177:
        [(HPSSpatialProfileEnrollmentController *)self alertEarDistanceWarning:v78];
        goto LABEL_178;
      }
      if ([(HPSSpatialProfileEnrollmentController *)self isEarTooFar])
      {
        uint64_t v78 = 4;
        goto LABEL_177;
      }
      if ([(HPSSpatialProfileEnrollmentController *)self isEarMovingFast])
      {
        uint64_t v78 = 5;
        goto LABEL_177;
      }
LABEL_178:
      if ([(HPSSpatialProfileEnrollmentController *)self isEarOccluded]) {
        [(HPSSpatialProfileEnrollmentController *)self alertOcclusionWarning];
      }
LABEL_180:
      if (v45)
      {
        if ([(HPSSpatialProfileEnrollmentController *)self isPresentingWrongEar])
        {
          v110 = v45;
          v111 = sharedBluetoothSettingsLogComponent();
          if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1E4BFE000, v111, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Seeing Left ear When Right is not completed", buf, 2u);
          }

          if (!self->_enrollmentPaused)
          {
            v192[0] = MEMORY[0x1E4F143A8];
            v192[1] = 3221225472;
            v192[2] = __83__HPSSpatialProfileEnrollmentController_didReceiveStateUpdateForSession_stateInfo___block_invoke_356;
            v192[3] = &unk_1E6EA82F0;
            v192[4] = self;
            dispatch_async(MEMORY[0x1E4F14428], v192);
          }
          char v112 = 0;
          v45 = v110;
        }
        else
        {
          id v175 = v6;
          id v178 = v7;
          long long v190 = 0u;
          long long v191 = 0u;
          long long v188 = 0u;
          long long v189 = 0u;
          v171 = v45;
          v113 = [v45 yawAngles];
          uint64_t v114 = [v113 countByEnumeratingWithState:&v188 objects:v207 count:16];
          if (v114)
          {
            uint64_t v115 = v114;
            char v116 = 0;
            uint64_t v117 = *(void *)v189;
            do
            {
              for (uint64_t k = 0; k != v115; ++k)
              {
                if (*(void *)v189 != v117) {
                  objc_enumerationMutation(v113);
                }
                v119 = *(void **)(*((void *)&v188 + 1) + 8 * k);
                [v119 angle];
                double v121 = -v120;
                if (v120 <= -11.0)
                {
                  double v125 = v120;
                  int v126 = [v119 captured];
                  if (v125 >= -13.0)
                  {
                    if (v126 && !self->_rightEarMidCaptured)
                    {
                      uint64_t v130 = sharedBluetoothSettingsLogComponent();
                      if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
                      {
                        [v119 angle];
                        *(_DWORD *)buf = 134218240;
                        double v209 = v121;
                        __int16 v210 = 2048;
                        v211 = v131;
                        _os_log_impl(&dword_1E4BFE000, v130, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Right Ear: Mid Captured: %f (%f)", buf, 0x16u);
                      }

                      char v116 = 1;
                      self->_rightEarMidCaptured = 1;
                      double v132 = CACurrentMediaTime();
                      self->_lastEarCaptureTime = v132;
                      self->_enrollGuidancePitch = 0.5;
                      LODWORD(v132) = 0.5;
                      [(HPSSpatialProfileSoundHapticManager *)self->_soundHapticManager setEnrollGuidancePitch:v132];
                      [(HPSSpatialProfileEnrollmentController *)self earCentralPartCaptured];
                      [(HPSSpatialProfileAnalytics *)self->_enrollmentAnalytics updateRightEarMidAnglelDuration];
                    }
                  }
                  else if (v126 && !self->_rightEarFrontCaptured)
                  {
                    v127 = sharedBluetoothSettingsLogComponent();
                    if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
                    {
                      [v119 angle];
                      *(_DWORD *)buf = 134218240;
                      double v209 = v121;
                      __int16 v210 = 2048;
                      v211 = v128;
                      _os_log_impl(&dword_1E4BFE000, v127, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Right Ear: Front Captured: %f (%f)", buf, 0x16u);
                    }

                    char v116 = 1;
                    self->_rightEarFrontCaptured = 1;
                    double v129 = CACurrentMediaTime();
                    self->_lastEarCaptureTime = v129;
                    self->_enrollGuidancePitch = 0.5;
                    LODWORD(v129) = 0.5;
                    [(HPSSpatialProfileSoundHapticManager *)self->_soundHapticManager setEnrollGuidancePitch:v129];
                    [(HPSSpatialProfileAnalytics *)self->_enrollmentAnalytics updateRightEarFrontAnglelDuration];
                    [(HPSSpatialProfileEnrollmentController *)self earLeftPartCaptured];
                  }
                }
                else if ([v119 captured] && !self->_rightEarRearCaptured)
                {
                  v122 = sharedBluetoothSettingsLogComponent();
                  if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
                  {
                    [v119 angle];
                    *(_DWORD *)buf = 134218240;
                    double v209 = v121;
                    __int16 v210 = 2048;
                    v211 = v123;
                    _os_log_impl(&dword_1E4BFE000, v122, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Right Ear: Rear Captured: %f (%f)", buf, 0x16u);
                  }

                  char v116 = 1;
                  self->_rightEarRearCaptured = 1;
                  self->_lastEarCaptureTime = CACurrentMediaTime();
                  [(HPSSpatialProfileEnrollmentController *)self earRightPartCaptured];
                  self->_enrollGuidancePitch = 0.5;
                  LODWORD(v124) = 0.5;
                  [(HPSSpatialProfileSoundHapticManager *)self->_soundHapticManager setEnrollGuidancePitch:v124];
                  [(HPSSpatialProfileAnalytics *)self->_enrollmentAnalytics updateRightEarBackAnglelDuration];
                }
              }
              uint64_t v115 = [v113 countByEnumeratingWithState:&v188 objects:v207 count:16];
            }
            while (v115);
          }
          else
          {
            char v116 = 0;
          }

          v133 = [v171 remainingYawAngles];
          if ([v133 count])
          {

            char v112 = v116 & 1;
            id v6 = v175;
            id v7 = v178;
            unint64_t v27 = 0x1EAE8C000;
            long long v30 = v173;
          }
          else
          {
            BOOL rightEarCaptured = self->_rightEarCaptured;

            id v6 = v175;
            id v7 = v178;
            unint64_t v27 = 0x1EAE8C000;
            long long v30 = v173;
            if (rightEarCaptured)
            {
              char v112 = v116;
            }
            else
            {
              v139 = sharedBluetoothSettingsLogComponent();
              if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1E4BFE000, v139, OS_LOG_TYPE_DEFAULT, "Spatial Profile: State Update: Right Ear Captured", buf, 2u);
              }

              self->_BOOL rightEarCaptured = 1;
              [(HPSSpatialProfileEnrollmentController *)self moveToStep:8];
              char v112 = 0;
            }
          }
          uint64_t v44 = v181;
          v45 = v171;
        }
      }
      else
      {
        char v112 = 0;
      }
      if (!v44) {
        goto LABEL_270;
      }
      if ([(HPSSpatialProfileEnrollmentController *)self isPresentingWrongEar])
      {
        v140 = v45;
        v141 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E4BFE000, v141, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Seeing Left ear When Right is not completed", buf, 2u);
        }

        if (self->_enrollmentPaused)
        {
          v45 = v140;
          goto LABEL_270;
        }
        v187[0] = MEMORY[0x1E4F143A8];
        v187[1] = 3221225472;
        v187[2] = __83__HPSSpatialProfileEnrollmentController_didReceiveStateUpdateForSession_stateInfo___block_invoke_357;
        v187[3] = &unk_1E6EA82F0;
        v187[4] = self;
        dispatch_async(MEMORY[0x1E4F14428], v187);
        uint64_t v44 = v181;
        v45 = v140;
        if ((v112 & 1) == 0) {
          goto LABEL_272;
        }
LABEL_271:
        [(HPSSpatialProfileEnrollmentController *)self startOcclusionWarnCoolDownTimer];
        [(HPSSpatialProfileEnrollmentController *)self startEarDistanceWarnCoolDownTimer];
        goto LABEL_272;
      }
      if (self->_rightEarStatus != 3) {
        goto LABEL_270;
      }
      v172 = v45;
      id v176 = v6;
      id v179 = v7;
      long long v185 = 0u;
      long long v186 = 0u;
      long long v183 = 0u;
      long long v184 = 0u;
      uint64_t v142 = [v44 yawAngles];
      uint64_t v143 = [v142 countByEnumeratingWithState:&v183 objects:v206 count:16];
      if (v143)
      {
        uint64_t v144 = v143;
        uint64_t v145 = *(void *)v184;
        do
        {
          for (uint64_t m = 0; m != v144; ++m)
          {
            if (*(void *)v184 != v145) {
              objc_enumerationMutation(v142);
            }
            v147 = *(void **)(*((void *)&v183 + 1) + 8 * m);
            [v147 angle];
            double v149 = -v148;
            if (v148 >= -13.0)
            {
              double v153 = v148;
              int v154 = [v147 captured];
              if (v153 <= -11.0)
              {
                if (v154 && !self->_leftEarMidCaptured)
                {
                  v158 = sharedBluetoothSettingsLogComponent();
                  if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
                  {
                    [v147 angle];
                    *(_DWORD *)buf = 134218240;
                    double v209 = v149;
                    __int16 v210 = 2048;
                    v211 = v159;
                    _os_log_impl(&dword_1E4BFE000, v158, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Left Ear: Mid Captured: %f (%f)", buf, 0x16u);
                  }

                  char v112 = 1;
                  self->_leftEarMidCaptured = 1;
                  double v160 = CACurrentMediaTime();
                  self->_lastEarCaptureTime = v160;
                  self->_enrollGuidancePitch = 0.5;
                  LODWORD(v160) = 0.5;
                  [(HPSSpatialProfileSoundHapticManager *)self->_soundHapticManager setEnrollGuidancePitch:v160];
                  [(HPSSpatialProfileEnrollmentController *)self earCentralPartCaptured];
                  [(HPSSpatialProfileAnalytics *)self->_enrollmentAnalytics updateLeftEarMidAnglelDuration];
                }
              }
              else if (v154 && !self->_leftEarFrontCaptured)
              {
                v155 = sharedBluetoothSettingsLogComponent();
                if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
                {
                  [v147 angle];
                  *(_DWORD *)buf = 134218240;
                  double v209 = v149;
                  __int16 v210 = 2048;
                  v211 = v156;
                  _os_log_impl(&dword_1E4BFE000, v155, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Left Ear: Rear Captured: %f (%f)", buf, 0x16u);
                }

                char v112 = 1;
                self->_leftEarFrontCaptured = 1;
                double v157 = CACurrentMediaTime();
                self->_lastEarCaptureTime = v157;
                self->_enrollGuidancePitch = 0.5;
                LODWORD(v157) = 0.5;
                [(HPSSpatialProfileSoundHapticManager *)self->_soundHapticManager setEnrollGuidancePitch:v157];
                [(HPSSpatialProfileEnrollmentController *)self earLeftPartCaptured];
                [(HPSSpatialProfileAnalytics *)self->_enrollmentAnalytics updateLeftEarBackAnglelDuration];
              }
            }
            else if ([v147 captured] && !self->_leftEarRearCaptured)
            {
              v150 = sharedBluetoothSettingsLogComponent();
              if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
              {
                [v147 angle];
                *(_DWORD *)buf = 134218240;
                double v209 = v149;
                __int16 v210 = 2048;
                v211 = v151;
                _os_log_impl(&dword_1E4BFE000, v150, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Left Ear: Front Captured: %f (%f)", buf, 0x16u);
              }

              char v112 = 1;
              self->_leftEarRearCaptured = 1;
              double v152 = CACurrentMediaTime();
              self->_lastEarCaptureTime = v152;
              self->_enrollGuidancePitch = 0.5;
              LODWORD(v152) = 0.5;
              [(HPSSpatialProfileSoundHapticManager *)self->_soundHapticManager setEnrollGuidancePitch:v152];
              [(HPSSpatialProfileEnrollmentController *)self earRightPartCaptured];
              [(HPSSpatialProfileAnalytics *)self->_enrollmentAnalytics updateLeftEarFrontAnglelDuration];
            }
          }
          uint64_t v144 = [v142 countByEnumeratingWithState:&v183 objects:v206 count:16];
        }
        while (v144);
      }

      uint64_t v44 = v181;
      v161 = [v181 remainingYawAngles];
      if ([v161 count])
      {

        id v6 = v176;
        id v7 = v179;
        unint64_t v27 = 0x1EAE8C000;
        long long v30 = v173;
        v45 = v172;
        if ((v112 & 1) == 0) {
          goto LABEL_272;
        }
        goto LABEL_271;
      }
      BOOL leftEarCaptured = self->_leftEarCaptured;

      id v6 = v176;
      id v7 = v179;
      unint64_t v27 = 0x1EAE8C000uLL;
      long long v30 = v173;
      v45 = v172;
      if (leftEarCaptured)
      {
LABEL_270:
        uint64_t v44 = v181;
        if ((v112 & 1) == 0) {
          goto LABEL_272;
        }
        goto LABEL_271;
      }
      v164 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v164, OS_LOG_TYPE_DEFAULT, "Spatial Profile: State Update: Left Ear Captured", buf, 2u);
      }

      self->_BOOL leftEarCaptured = 1;
      [(HPSSpatialProfileEnrollmentController *)self moveToStep:12];
      uint64_t v44 = v181;
      v45 = v172;
LABEL_272:

LABEL_273:
LABEL_274:
      uint64_t v163 = *(int *)(v27 + 3932);
      if (*(double *)((char *)&self->super.super.super.isa + v163) != v26) {
        *(double *)((char *)&self->super.super.super.isa + v163) = v26;
      }

      return;
    case 3uLL:
      [(HPSSpatialProfileAnalytics *)self->_enrollmentAnalytics updateSoundProfileCreationDurationStart];
      int v59 = self->_currentStep;
      if (v59 <= 11 && (v59 == 9 || v59 == 5))
      {
        v60 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E4BFE000, v60, OS_LOG_TYPE_DEFAULT, "Spatial Profile: detected Post Process when in  Tutorial View, Pivot to next step. ", buf, 2u);
        }

        int v61 = self->_currentStep;
        if (v61 != 12)
        {
          if (v61 <= 10) {
            [(HPSSpatialProfileEnrollmentController *)self moveToStep:11];
          }
          [(HPSSpatialProfileEnrollmentController *)self moveToStep:12];
        }
      }
      uint64_t v62 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        int v63 = self->_currentStep;
        *(_DWORD *)buf = 67109120;
        LODWORD(v209) = v63;
        _os_log_impl(&dword_1E4BFE000, v62, OS_LOG_TYPE_DEFAULT, "Spatial Profile: State Update: Post Process : %d", buf, 8u);
      }

      goto LABEL_274;
    case 4uLL:
      v64 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v64, OS_LOG_TYPE_DEFAULT, "Spatial Profile: State Update: Retrieve Profile", buf, 2u);
      }

      int v65 = self->_currentStep;
      if (v65 == 9 || v65 == 5)
      {
        uint64_t v66 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E4BFE000, v66, OS_LOG_TYPE_DEFAULT, "Spatial Profile: detected Post Process when in  Tutorial View, Pivot to next step. ", buf, 2u);
        }

        [(HPSSpatialProfileEnrollmentController *)self continueButtonTapped];
        int v65 = self->_currentStep;
      }
      if (v65 != 12)
      {
        if (v65 <= 10) {
          [(HPSSpatialProfileEnrollmentController *)self moveToStep:11];
        }
        [(HPSSpatialProfileEnrollmentController *)self moveToStep:12];
      }
      [(HPSSpatialProfileEnrollmentController *)self moveToStep:14];
      [(HPSSpatialProfileAnalytics *)self->_enrollmentAnalytics updateSoundProfileCreationDuration];
      goto LABEL_274;
    case 5uLL:
      v67 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
        -[HPSSpatialProfileSingeStepEnrollmentController didReceiveStateUpdateForSession:stateInfo:]();
      }

      [(HPSSpatialProfileAnalytics *)self->_enrollmentAnalytics updateStatus:0 EnrollmentResult:@"Failed"];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __83__HPSSpatialProfileEnrollmentController_didReceiveStateUpdateForSession_stateInfo___block_invoke_358;
      block[3] = &unk_1E6EA82F0;
      void block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
      goto LABEL_274;
    default:
      goto LABEL_274;
  }
}

uint64_t __83__HPSSpatialProfileEnrollmentController_didReceiveStateUpdateForSession_stateInfo___block_invoke(uint64_t a1)
{
  sleep(1u);
  id v2 = *(void **)(a1 + 32);

  return [v2 moveToStep:4];
}

uint64_t __83__HPSSpatialProfileEnrollmentController_didReceiveStateUpdateForSession_stateInfo___block_invoke_356(uint64_t a1)
{
  id v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile:Enrolling Wrong ear", v4, 2u);
  }

  return [*(id *)(a1 + 32) alertEarEnrollWarning];
}

uint64_t __83__HPSSpatialProfileEnrollmentController_didReceiveStateUpdateForSession_stateInfo___block_invoke_357(uint64_t a1)
{
  id v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile:Enrolling Wrong ear", v4, 2u);
  }

  return [*(id *)(a1 + 32) alertEarEnrollWarning];
}

uint64_t __83__HPSSpatialProfileEnrollmentController_didReceiveStateUpdateForSession_stateInfo___block_invoke_358(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopEnrollment];
}

- (void)didReceiveCaptureVideo:(id)a3 colorImage:(id)a4 depthImage:(id)a5 faceObject:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  int v10 = v9;
  if (self->_enrollViewInitialized)
  {
    visualDetectionQueue = self->_visualDetectionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __97__HPSSpatialProfileEnrollmentController_didReceiveCaptureVideo_colorImage_depthImage_faceObject___block_invoke_363;
    block[3] = &unk_1E6EA8428;
    uint64_t v12 = (id *)v14;
    v14[0] = v9;
    v14[1] = self;
    dispatch_async(visualDetectionQueue, block);
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __97__HPSSpatialProfileEnrollmentController_didReceiveCaptureVideo_colorImage_depthImage_faceObject___block_invoke;
    v15[3] = &unk_1E6EA8998;
    uint64_t v12 = (id *)v16;
    v16[0] = v8;
    v16[1] = self;
    id v17 = v10;
    dispatch_async(MEMORY[0x1E4F14428], v15);
  }
}

void __97__HPSSpatialProfileEnrollmentController_didReceiveCaptureVideo_colorImage_depthImage_faceObject___block_invoke(uint64_t a1)
{
  v35[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = sharedBluetoothSettingsLogComponent();
  double v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v31) = 0;
      _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Update Preview Layer", (uint8_t *)&v31, 2u);
    }

    *(unsigned char *)(*(void *)(a1 + 40) + 1305) = 1;
    [*(id *)(*(void *)(a1 + 40) + 1256) setPreviewLayer:*(void *)(a1 + 32)];
    uint64_t v5 = [MEMORY[0x1E4F1E018] contextWithOptions:0];
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(void **)(v6 + 1504);
    *(void *)(v6 + 1504) = v5;

    id v8 = (void *)MEMORY[0x1E4F1E030];
    uint64_t v9 = *MEMORY[0x1E4F1DFB8];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 1504);
    uint64_t v34 = *MEMORY[0x1E4F1DFA8];
    v35[0] = *MEMORY[0x1E4F1DFA0];
    double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    uint64_t v12 = [v8 detectorOfType:v9 context:v10 options:v11];
    uint64_t v13 = *(void *)(a1 + 40);
    long long v14 = *(void **)(v13 + 1512);
    *(void *)(v13 + 1512) = v12;

    BOOL v15 = [*(id *)(*(void *)(a1 + 40) + 1256) previewLayer];
    [v15 setOpacity:0.0];

    double v16 = [[HPSSpatialProfileUIPearlEnrollView alloc] initWithVideoCaptureSession:*(void *)(*(void *)(a1 + 40) + 1256) inSheet:0 squareNeedsPositionLayout:0];
    uint64_t v17 = *(void *)(a1 + 40);
    CGFloat v18 = *(void **)(v17 + 1136);
    *(void *)(v17 + 1136) = v16;

    [*(id *)(a1 + 40) setupEnrollViewUI];
    [*(id *)(a1 + 40) pauseEnrollment];
    uint64_t v19 = *(void *)(a1 + 40) + 1096;
    double Width = (double)CVPixelBufferGetWidth((CVPixelBufferRef)[*(id *)(a1 + 48) pixelBuffer]);
    size_t Height = CVPixelBufferGetHeight((CVPixelBufferRef)[*(id *)(a1 + 48) pixelBuffer]);
    *(void *)uint64_t v19 = 0;
    *(void *)(v19 + 8) = 0;
    *(double *)(v19 + 16) = Width;
    *(double *)(v19 + 24) = (double)Height;
    uint64_t v22 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 1112);
      uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 1120);
      int v31 = 134218240;
      *(void *)uint64_t v32 = v24;
      *(_WORD *)&v32[8] = 2048;
      uint64_t v33 = v23;
      _os_log_impl(&dword_1E4BFE000, v22, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Frame Size  %f %f", (uint8_t *)&v31, 0x16u);
    }

    double v25 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(*(void *)(a1 + 40) + 1216)) {
        double v26 = @"YES";
      }
      else {
        double v26 = @"NO";
      }
      int v31 = 138412290;
      *(void *)uint64_t v32 = v26;
      _os_log_impl(&dword_1E4BFE000, v25, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Checking enrollment viewer Spinner %@", (uint8_t *)&v31, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1 + 40) + 1302) = 1;
    if (*(unsigned char *)(*(void *)(a1 + 40) + 1216))
    {
      unint64_t v27 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = *(void *)(a1 + 40);
        int v29 = *(unsigned __int8 *)(v28 + 1302);
        int v30 = [*(id *)(v28 + 1400) available];
        int v31 = 67109376;
        *(_DWORD *)uint64_t v32 = v29;
        *(_WORD *)&v32[4] = 1024;
        *(_DWORD *)&v32[6] = v30;
        _os_log_impl(&dword_1E4BFE000, v27, OS_LOG_TYPE_DEFAULT, "Spatial Profile: didReceiveCaptureVideo -> stopWelcomeSpinner, _enrollmentReady %d [_btManager available] %d", (uint8_t *)&v31, 0xEu);
      }

      [*(id *)(a1 + 40) stopWelcomeSpinner];
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __106__HPSSpatialProfileSingeStepEnrollmentController_didReceiveCaptureVideo_colorImage_depthImage_faceObject___block_invoke_cold_1();
    }
  }
}

void __97__HPSSpatialProfileEnrollmentController_didReceiveCaptureVideo_colorImage_depthImage_faceObject___block_invoke_363(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    int v2 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 1496);
    uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
    double v4 = [NSNumber numberWithInt:6];
    uint64_t v5 = [v3 dictionaryWithObject:v4 forKey:*MEMORY[0x1E4F1DFB0]];

    uint64_t v6 = [*(id *)(*(void *)(a1 + 40) + 1512) featuresInImage:*(void *)(a1 + 32) options:v5];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (!v7) {
      goto LABEL_12;
    }
    uint64_t v8 = v7;
    int v23 = v2;
    uint64_t v24 = v5;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v6);
        }
        long long v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v9 |= [v14 hasLeftEyePosition];
        v10 |= [v14 hasRightEyePosition];
        v11 |= [v14 hasMouthPosition];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v8);
    uint64_t v5 = v24;
    int v2 = v23;
    if (v9 & v10 & v11)
    {
      uint64_t v15 = *(void *)(a1 + 40);
      unsigned int v16 = *(unsigned __int8 *)(v15 + 1497);
      if (v16 <= 0x63) {
        *(unsigned char *)(v15 + 1497) = v16 + 1;
      }
    }
    else
    {
LABEL_12:
      *(unsigned char *)(*(void *)(a1 + 40) + 1497) = 0;
    }
    *(unsigned char *)(*(void *)(a1 + 40) + 1496) = *(unsigned __int8 *)(*(void *)(a1 + 40) + 1497) > 0x63u;
    if (v2 != *(unsigned __int8 *)(*(void *)(a1 + 40) + 1496))
    {
      uint64_t v17 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 40);
        int v19 = *(unsigned __int8 *)(v18 + 1496);
        int v20 = *(unsigned __int8 *)(v18 + 1497);
        if (v19) {
          __int16 v21 = @"At Phone";
        }
        else {
          __int16 v21 = @"away";
        }
        *(_DWORD *)buf = 138412546;
        int v30 = v21;
        __int16 v31 = 1024;
        int v32 = v20;
        _os_log_impl(&dword_1E4BFE000, v17, OS_LOG_TYPE_DEFAULT, "Spatial Profile: 2 User attention status %@ Count %d", buf, 0x12u);
      }

      uint64_t v22 = *(void *)(a1 + 40);
      if (*(unsigned char *)(v22 + 1496))
      {
        *(unsigned char *)(v22 + 1411) = 0;
        *(unsigned char *)(*(void *)(a1 + 40) + 1410) = 0;
      }
    }
  }
}

- (int)state
{
  return 6;
}

- (void)playEarCaptureSoundWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  if (self->_earCaptureSoundStep == 1)
  {
    soundHapticManager = self->_soundHapticManager;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __75__HPSSpatialProfileEnrollmentController_playEarCaptureSoundWithCompletion___block_invoke_2;
    v12[3] = &unk_1E6EA82F0;
    uint64_t v13 = v5;
    [(HPSSpatialProfileSoundHapticManager *)soundHapticManager triggerSoundHapticForEarCaptureState:1 completion:v12];
    uint64_t v7 = v13;
  }
  else
  {
    if (self->_earCaptureSoundStep)
    {
      dispatch_group_leave(v5);
      goto LABEL_7;
    }
    uint64_t v6 = self->_soundHapticManager;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __75__HPSSpatialProfileEnrollmentController_playEarCaptureSoundWithCompletion___block_invoke;
    v14[3] = &unk_1E6EA82F0;
    uint64_t v15 = v5;
    [(HPSSpatialProfileSoundHapticManager *)v6 triggerSoundHapticForEarCaptureState:0 completion:v14];
    uint64_t v7 = v15;
  }

LABEL_7:
  ++self->_earCaptureSoundStep;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__HPSSpatialProfileEnrollmentController_playEarCaptureSoundWithCompletion___block_invoke_3;
  block[3] = &unk_1E6EA8278;
  id v11 = v4;
  id v9 = v4;
  dispatch_group_notify(v5, MEMORY[0x1E4F14428], block);
}

void __75__HPSSpatialProfileEnrollmentController_playEarCaptureSoundWithCompletion___block_invoke(uint64_t a1)
{
}

void __75__HPSSpatialProfileEnrollmentController_playEarCaptureSoundWithCompletion___block_invoke_2(uint64_t a1)
{
}

uint64_t __75__HPSSpatialProfileEnrollmentController_playEarCaptureSoundWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)showBudsInEarPopUp:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 classicDevice];
  unsigned int v6 = [v5 productId];

  objc_msgSend(NSString, "stringWithFormat:", @"ACCESSORY_MODEL_NAME_%d", v6 - 0x2000);
  uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:v7 value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  if ([v9 length]) {
    BOOL v10 = v6 >= 0x200A;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {

    if (v6 >> 4 <= 0x200) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  if (v6 == 8210) {
    uint64_t v7 = @"ACCESSORY_MODEL_NAME_18";
  }
  else {
    uint64_t v7 = @"ACCESSORY_MODEL_NAME_15";
  }
LABEL_10:
  id v11 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v4 classicDevice];
    uint64_t v13 = [v12 name];
    *(_DWORD *)buf = 138412290;
    int v30 = v13;
    _os_log_impl(&dword_1E4BFE000, v11, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Device %@, bud in ear", buf, 0xCu);
  }
  long long v14 = [(id)MGGetStringAnswer() uppercaseString];
  uint64_t v15 = [@"SPATIAL_AUDIO_PROFILE_IED_WARN_" stringByAppendingFormat:@"%@_%@", v14, v7];

  long long v28 = v4;
  if (v6 == 8215)
  {
    unsigned int v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v17 = [v16 localizedStringForKey:@"SPATIAL_AUDIO_PROFILE_IED_WARN_IPHONE_ACCESSORY_MODEL_NAME_23" value:&stru_1F4097960 table:@"DeviceConfig-B453"];

    uint64_t v15 = (void *)v17;
  }
  uint64_t v18 = (void *)MEMORY[0x1E4FB1418];
  int v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v20 = [v19 localizedStringForKey:v15 value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  __int16 v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v22 = [v21 localizedStringForKey:@"SPATIAL_AUDIO_PROFILE_IN_EAR_TEXT" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  int v23 = [v18 alertControllerWithTitle:v20 message:v22 preferredStyle:1];

  uint64_t v24 = (void *)MEMORY[0x1E4FB1410];
  long long v25 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  long long v26 = [v25 localizedStringForKey:@"OK" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  long long v27 = [v24 actionWithTitle:v26 style:0 handler:&__block_literal_global_377];
  [v23 addAction:v27];

  [(HPSSpatialProfileEnrollmentController *)self presentViewController:v23 animated:1 completion:0];
}

- (BOOL)checkAndShowInEarPopup
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [(BluetoothManager *)self->_btManager connectedDevices];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (+[HPSProductUtils isAppleHeadphone:v8]
          && ([v8 isTemporaryPaired] & 1) == 0)
        {
          if ([v8 isGenuineAirPods])
          {
            id v9 = +[BTSDeviceClassic deviceWithDevice:v8];
            if ([v8 inEarDetectEnabled])
            {
              if (v9)
              {
                int v14 = 3;
                *(_DWORD *)buf = 3;
                BOOL v10 = [v9 classicDevice];
                [v10 inEarStatusPrimary:buf secondary:&v14];

                if (!*(_DWORD *)buf || !v14)
                {
                  [(HPSSpatialProfileEnrollmentController *)self showBudsInEarPopUp:v9];
                  BOOL v12 = 1;
LABEL_26:

                  goto LABEL_27;
                }
              }
            }
            else
            {
              id v11 = sharedBluetoothSettingsLogComponent();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1E4BFE000, v11, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Please enable the Automatic Ear Detection in Bluetooth Settings", buf, 2u);
              }

              if (v9)
              {
                BOOL v12 = !self->_inEarDetectDisabledPopUpShown;
                if (!self->_inEarDetectDisabledPopUpShown)
                {
                  BOOL v12 = 1;
                  self->_inEarDetectDisabledPopUpShown = 1;
                  [(HPSSpatialProfileEnrollmentController *)self showBudsInEarPopUp:v9];
                }
                goto LABEL_26;
              }
            }
          }
          else
          {
            id v9 = sharedBluetoothSettingsLogComponent();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
              [(HPSSpatialProfileSingeStepEnrollmentController *)&v16 getBudsInEarString];
            }
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_27:

  return v12;
}

- (void)showLandscapeAlert
{
  id v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Landscape Mode Detected, not supported, show pop up alert", buf, 2u);
  }

  uint64_t v4 = (void *)MEMORY[0x1E4FB1418];
  uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:@"LANDSCAPE_MODE_ALERT_TITLE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  uint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"LANDSCAPE_MODE_ALERT_DETAIL" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  id v9 = [v4 alertControllerWithTitle:v6 message:v8 preferredStyle:1];

  BOOL v10 = (void *)MEMORY[0x1E4FB1410];
  id v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v12 = [v11 localizedStringForKey:@"OK" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __59__HPSSpatialProfileEnrollmentController_showLandscapeAlert__block_invoke;
  v14[3] = &unk_1E6EA83E0;
  void v14[4] = self;
  uint64_t v13 = [v10 actionWithTitle:v12 style:0 handler:v14];
  [v9 addAction:v13];

  [(HPSSpatialProfileEnrollmentController *)self presentViewController:v9 animated:1 completion:0];
}

uint64_t __59__HPSSpatialProfileEnrollmentController_showLandscapeAlert__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelSpatialAudioProfile];
}

- (void)fillFacePillsByDirection:(int)a3
{
  uint64_t v3 = 0;
  if ((a3 - 1) <= 6) {
    uint64_t v3 = qword_1E4CC4890[a3 - 1];
  }
  stepSerialQueue = self->_stepSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__HPSSpatialProfileEnrollmentController_fillFacePillsByDirection___block_invoke;
  v5[3] = &unk_1E6EA8318;
  void v5[4] = self;
  v5[5] = v3;
  dispatch_async(stepSerialQueue, v5);
}

void __66__HPSSpatialProfileEnrollmentController_fillFacePillsByDirection___block_invoke(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __66__HPSSpatialProfileEnrollmentController_fillFacePillsByDirection___block_invoke_2;
  v1[3] = &unk_1E6EA8318;
  v1[4] = *(void *)(a1 + 32);
  v1[5] = *(void *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], v1);
}

void __66__HPSSpatialProfileEnrollmentController_fillFacePillsByDirection___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1136) pillContainer];
  [v2 fillPillsAroundAngle:*(double *)(a1 + 40)];
}

- (void)showEarPillsDots
{
  earPillContainer = self->_earPillContainer;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__HPSSpatialProfileEnrollmentController_showEarPillsDots__block_invoke;
  v4[3] = &unk_1E6EA82F0;
  v4[4] = self;
  [MEMORY[0x1E4FB1EB0] transitionWithView:earPillContainer duration:5242880 options:v4 animations:0 completion:0.4];
  [(HPSSpatialProfileEarDotsMovieView *)self->_earDotsMovieView showDots];
}

uint64_t __57__HPSSpatialProfileEnrollmentController_showEarPillsDots__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1144) setAlpha:1.0];
}

- (void)hideEarPillsDots
{
  earPillContainer = self->_earPillContainer;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__HPSSpatialProfileEnrollmentController_hideEarPillsDots__block_invoke;
  v4[3] = &unk_1E6EA82F0;
  v4[4] = self;
  [MEMORY[0x1E4FB1EB0] transitionWithView:earPillContainer duration:5242880 options:v4 animations:0 completion:0.4];
  [(HPSSpatialProfileEarDotsMovieView *)self->_earDotsMovieView hideDots];
}

uint64_t __57__HPSSpatialProfileEnrollmentController_hideEarPillsDots__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1144) setAlpha:0.0];
}

- (void)prepareSpinner
{
  if (!self->_spinner)
  {
    uint64_t v3 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    spinner = self->_spinner;
    self->_spinner = v3;

    [(UIActivityIndicatorView *)self->_spinner setHidesWhenStopped:1];
    [(UIActivityIndicatorView *)self->_spinner setActivityIndicatorViewStyle:100];
    [(OBTrayButton *)self->_continueButton bounds];
    double v6 = v5 * 0.5;
    [(OBTrayButton *)self->_continueButton bounds];
    -[UIActivityIndicatorView setCenter:](self->_spinner, "setCenter:", v6, v7 * 0.5);
    [(UIActivityIndicatorView *)self->_spinner startAnimating];
    continueButton = self->_continueButton;
    id v9 = self->_spinner;
    [(OBTrayButton *)continueButton addSubview:v9];
  }
}

- (void)cleanUpSpinner
{
  [(UIActivityIndicatorView *)self->_spinner stopAnimating];
  [(UIActivityIndicatorView *)self->_spinner removeFromSuperview];
  spinner = self->_spinner;
  self->_spinner = 0;
}

- (void)startWelcomeSpinner
{
  uint64_t v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Start Welcome Spinner", v7, 2u);
  }

  self->_welcomeSpinnerOn = 1;
  uint64_t v4 = [(OBTrayButton *)self->_continueButton titleLabel];
  [v4 setHidden:1];

  [(OBTrayButton *)self->_continueButton setUserInteractionEnabled:0];
  [(HPSSpatialProfileEnrollmentController *)self prepareSpinner];
  spinner = self->_spinner;
  double v6 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  [(UIActivityIndicatorView *)spinner setColor:v6];
}

- (void)stopWelcomeSpinner
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!self->_enrollmentReady || ![(BluetoothManager *)self->_btManager available])
  {
    double v5 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      enrollmentReadCGFloat y = self->_enrollmentReady;
      int v8 = [(BluetoothManager *)self->_btManager available];
      v9[0] = 67109376;
      v9[1] = enrollmentReady;
      __int16 v10 = 1024;
      int v11 = v8;
      _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: stopWelcomeSpinner failed _enrollmentReady %d [_btManager available] %d", (uint8_t *)v9, 0xEu);
    }
    goto LABEL_11;
  }
  BOOL welcomeSpinnerOn = self->_welcomeSpinnerOn;
  uint64_t v4 = sharedBluetoothSettingsLogComponent();
  double v5 = v4;
  if (!welcomeSpinnerOn)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[HPSSpatialProfileSingeStepEnrollmentController stopWelcomeSpinner]();
    }
LABEL_11:

    return;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9[0]) = 0;
    _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Stop Welcome Spinner", (uint8_t *)v9, 2u);
  }

  self->_BOOL welcomeSpinnerOn = 0;
  double v6 = [(OBTrayButton *)self->_continueButton titleLabel];
  [v6 setHidden:0];

  [(OBTrayButton *)self->_continueButton setUserInteractionEnabled:1];
  [(HPSSpatialProfileEnrollmentController *)self cleanUpSpinner];
  [(HPSSpatialProfileEnrollmentController *)self continueButtonTapped];
}

- (void)startPostProcessSpinner
{
  uint64_t v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Start Post Process Spinner", v8, 2u);
  }

  self->_postProcessSpinnerOn = 1;
  uint64_t v4 = [(OBTrayButton *)self->_continueButton titleLabel];
  [v4 setHidden:1];

  [(OBTrayButton *)self->_continueButton setUserInteractionEnabled:0];
  double v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(OBTrayButton *)self->_continueButton setTintColor:v5];

  [(HPSSpatialProfileEnrollmentController *)self showContinueButton];
  [(HPSSpatialProfileEnrollmentController *)self prepareSpinner];
  spinner = self->_spinner;
  double v7 = [MEMORY[0x1E4FB1618] systemGrayColor];
  [(UIActivityIndicatorView *)spinner setColor:v7];
}

- (void)stopPostProcessSpinner
{
  BOOL postProcessSpinnerOn = self->_postProcessSpinnerOn;
  uint64_t v4 = sharedBluetoothSettingsLogComponent();
  double v5 = v4;
  if (postProcessSpinnerOn)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Stop Post Process Spinner", v8, 2u);
    }

    self->_BOOL postProcessSpinnerOn = 0;
    double v6 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [(OBTrayButton *)self->_continueButton setTintColor:v6];

    double v7 = [(OBTrayButton *)self->_continueButton titleLabel];
    [v7 setHidden:0];

    [(OBTrayButton *)self->_continueButton setUserInteractionEnabled:1];
    [(HPSSpatialProfileEnrollmentController *)self cleanUpSpinner];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[HPSSpatialProfileSingeStepEnrollmentController stopWelcomeSpinner]();
    }
  }
}

- (void)earLeftPartCaptured
{
  stepSerialQueue = self->_stepSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HPSSpatialProfileEnrollmentController_earLeftPartCaptured__block_invoke;
  block[3] = &unk_1E6EA82F0;
  void block[4] = self;
  dispatch_async(stepSerialQueue, block);
}

void __60__HPSSpatialProfileEnrollmentController_earLeftPartCaptured__block_invoke(uint64_t a1)
{
  id v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  [*(id *)(a1 + 32) pulseEarBoundingBox];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 1144);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__HPSSpatialProfileEnrollmentController_earLeftPartCaptured__block_invoke_2;
  v10[3] = &unk_1E6EA82F0;
  uint64_t v4 = v2;
  int v11 = v4;
  [v3 fillLeftPillsWithCompletion:v10];
  dispatch_group_enter(v4);
  double v5 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__HPSSpatialProfileEnrollmentController_earLeftPartCaptured__block_invoke_3;
  v8[3] = &unk_1E6EA82F0;
  id v9 = v4;
  double v6 = v4;
  [v5 playEarCaptureSoundWithCompletion:v8];
  dispatch_time_t v7 = dispatch_time(0, 3000000000);
  dispatch_group_wait(v6, v7);
}

void __60__HPSSpatialProfileEnrollmentController_earLeftPartCaptured__block_invoke_2(uint64_t a1)
{
}

void __60__HPSSpatialProfileEnrollmentController_earLeftPartCaptured__block_invoke_3(uint64_t a1)
{
}

- (void)earCentralPartCaptured
{
  stepSerialQueue = self->_stepSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__HPSSpatialProfileEnrollmentController_earCentralPartCaptured__block_invoke;
  block[3] = &unk_1E6EA82F0;
  void block[4] = self;
  dispatch_async(stepSerialQueue, block);
}

void __63__HPSSpatialProfileEnrollmentController_earCentralPartCaptured__block_invoke(uint64_t a1)
{
  id v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  [*(id *)(a1 + 32) pulseEarBoundingBox];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 1144);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__HPSSpatialProfileEnrollmentController_earCentralPartCaptured__block_invoke_2;
  v10[3] = &unk_1E6EA82F0;
  uint64_t v4 = v2;
  int v11 = v4;
  [v3 fillCentralPillsWithCompletion:v10];
  dispatch_group_enter(v4);
  double v5 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__HPSSpatialProfileEnrollmentController_earCentralPartCaptured__block_invoke_3;
  v8[3] = &unk_1E6EA82F0;
  id v9 = v4;
  double v6 = v4;
  [v5 playEarCaptureSoundWithCompletion:v8];
  dispatch_time_t v7 = dispatch_time(0, 3000000000);
  dispatch_group_wait(v6, v7);
}

void __63__HPSSpatialProfileEnrollmentController_earCentralPartCaptured__block_invoke_2(uint64_t a1)
{
}

void __63__HPSSpatialProfileEnrollmentController_earCentralPartCaptured__block_invoke_3(uint64_t a1)
{
}

- (void)earRightPartCaptured
{
  stepSerialQueue = self->_stepSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__HPSSpatialProfileEnrollmentController_earRightPartCaptured__block_invoke;
  block[3] = &unk_1E6EA82F0;
  void block[4] = self;
  dispatch_async(stepSerialQueue, block);
}

void __61__HPSSpatialProfileEnrollmentController_earRightPartCaptured__block_invoke(uint64_t a1)
{
  id v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  [*(id *)(a1 + 32) pulseEarBoundingBox];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 1144);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__HPSSpatialProfileEnrollmentController_earRightPartCaptured__block_invoke_2;
  v10[3] = &unk_1E6EA82F0;
  uint64_t v4 = v2;
  int v11 = v4;
  [v3 fillRightPillsWithCompletion:v10];
  dispatch_group_enter(v4);
  double v5 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__HPSSpatialProfileEnrollmentController_earRightPartCaptured__block_invoke_3;
  v8[3] = &unk_1E6EA82F0;
  id v9 = v4;
  double v6 = v4;
  [v5 playEarCaptureSoundWithCompletion:v8];
  dispatch_time_t v7 = dispatch_time(0, 3000000000);
  dispatch_group_wait(v6, v7);
}

void __61__HPSSpatialProfileEnrollmentController_earRightPartCaptured__block_invoke_2(uint64_t a1)
{
}

void __61__HPSSpatialProfileEnrollmentController_earRightPartCaptured__block_invoke_3(uint64_t a1)
{
}

- (void)pulseEarBoundingBox
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HPSSpatialProfileEnrollmentController_pulseEarBoundingBox__block_invoke;
  block[3] = &unk_1E6EA82F0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __60__HPSSpatialProfileEnrollmentController_pulseEarBoundingBox__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1176) setInactive:0];
  [*(id *)(*(void *)(a1 + 32) + 1176) startScalingWithExpansionWidth:1 duration:10.0 repeatCount:0.1];
  dispatch_time_t v2 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HPSSpatialProfileEnrollmentController_pulseEarBoundingBox__block_invoke_2;
  block[3] = &unk_1E6EA82F0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

uint64_t __60__HPSSpatialProfileEnrollmentController_pulseEarBoundingBox__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1176) setInactive:1];
}

- (void)clearBoundingBox
{
  self->_earBoundingBoxDetectTracker = 0;
  self->_earBoundingBoxDetected = 0;
  [(HPSSpatialProfileEnrollmentController *)self updateBoundingBoxHiddenStatus];
}

- (void)updateBoundingBoxHiddenStatus
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v3 = [(CEKSubjectIndicatorView *)self->_earBoundingBoxView isHidden];
  int currentStep = self->_currentStep;
  if (currentStep == 7 || currentStep == 11)
  {
    if (v3 == !self->_earBoundingBoxDetected) {
      return;
    }
    if (self->_earBoundingBoxDetected)
    {
      [(CEKSubjectIndicatorView *)self->_earBoundingBoxView bounds];
      if (CGRectEqualToRect(v14, *MEMORY[0x1E4F1DB28])) {
        return;
      }
      int v6 = 0;
      goto LABEL_12;
    }
  }
  else if (v3)
  {
    return;
  }
  int v6 = 1;
LABEL_12:
  dispatch_time_t v7 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = @"Showing";
    if (v6) {
      int v8 = @"Hidden";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v8;
    _os_log_impl(&dword_1E4BFE000, v7, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Bouding Box Updated : %@", buf, 0xCu);
  }

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _DWORD v9[2] = __70__HPSSpatialProfileEnrollmentController_updateBoundingBoxHiddenStatus__block_invoke;
  v9[3] = &unk_1E6EA89E8;
  void v9[4] = self;
  char v10 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

uint64_t __70__HPSSpatialProfileEnrollmentController_updateBoundingBoxHiddenStatus__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __70__HPSSpatialProfileEnrollmentController_updateBoundingBoxHiddenStatus__block_invoke_2;
  v2[3] = &unk_1E6EA89E8;
  v2[4] = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(a1 + 40);
  return [MEMORY[0x1E4FB1EB0] animateWithDuration:v2 animations:0.3];
}

uint64_t __70__HPSSpatialProfileEnrollmentController_updateBoundingBoxHiddenStatus__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1176) setHidden:*(unsigned __int8 *)(a1 + 40)];
}

- (void)translateEarBoundingBox:(CGRect)a3 previewLayerBoundingBox:(CGRect)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__HPSSpatialProfileEnrollmentController_translateEarBoundingBox_previewLayerBoundingBox___block_invoke;
  block[3] = &unk_1E6EA89C0;
  void block[4] = self;
  v4.f64[0] = a4.size.width;
  v4.f64[1] = a4.size.height;
  _Q7 = vcvtq_f64_f32(vcvt_f32_f64(vdivq_f64(v4, (float64x2_t)self->_visageFrame.size)));
  CGFloat height = a3.size.height;
  float32x2_t v7 = vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(vcvt_f32_f64(vmulq_f64((float64x2_t)a3.size, _Q7))), (float64x2_t)xmmword_1E4CC47B0));
  float v8 = vmlad_n_f64((float)(0.5 * v7.f32[0]), a3.origin.x, _Q7.f64[0]);
  __asm { FMLA            D3, D1, V7.D[1] }
  float v14 = _D3;
  float v15 = a4.origin.y + v14;
  float v16 = a4.size.width - v8;
  void block[5] = v7;
  float v17 = a4.origin.x + v16;
  float v19 = v17;
  float v20 = v15;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __89__HPSSpatialProfileEnrollmentController_translateEarBoundingBox_previewLayerBoundingBox___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __89__HPSSpatialProfileEnrollmentController_translateEarBoundingBox_previewLayerBoundingBox___block_invoke_2;
  v2[3] = &unk_1E6EA89C0;
  v2[4] = *(void *)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 40);
  return [MEMORY[0x1E4FB1EB0] animateWithDuration:v2 animations:0.1];
}

uint64_t __89__HPSSpatialProfileEnrollmentController_translateEarBoundingBox_previewLayerBoundingBox___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1176), "setBounds:", 0.0, 0.0, *(float *)(a1 + 40), *(float *)(a1 + 44));
  double v2 = *(float *)(a1 + 48);
  double v3 = *(float *)(a1 + 52);
  float64x2_t v4 = *(void **)(*(void *)(a1 + 32) + 1176);

  return objc_msgSend(v4, "setCenter:", v2, v3);
}

- (void)updateFaceTrackingStatus:(CGRect)a3
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int faceBoundingBoxStatus = self->_faceBoundingBoxStatus;
  double v9 = self->_visageFrame.size.height;
  float v10 = a3.size.width / self->_visageFrame.size.width;
  if (faceBoundingBoxStatus == 1)
  {
    if (v10 >= 0.45) {
      return;
    }
    int v11 = 5;
  }
  else
  {
    if (faceBoundingBoxStatus != 5 || v10 <= 0.55) {
      return;
    }
    int v11 = 1;
  }
  self->_int faceBoundingBoxStatus = v11;
  uint64_t v12 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    float v13 = height / v9;
    int v14 = self->_faceBoundingBoxStatus;
    v15[0] = 67110912;
    v15[1] = faceBoundingBoxStatus;
    __int16 v16 = 1024;
    int v17 = v14;
    __int16 v18 = 2048;
    double v19 = (float)(v10 * 100.0);
    __int16 v20 = 2048;
    double v21 = (float)(v13 * 100.0);
    __int16 v22 = 2048;
    CGFloat v23 = width;
    __int16 v24 = 2048;
    double v25 = height;
    __int16 v26 = 2048;
    CGFloat v27 = x;
    __int16 v28 = 2048;
    CGFloat v29 = y;
    _os_log_impl(&dword_1E4BFE000, v12, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Face Status changed from %d -> %d Status Ratio [ %f %f ] Face BB [ %f %f , %f %f]", (uint8_t *)v15, 0x4Au);
  }
}

- (void)updateCurrentTrackingEar:(id)a3 rightEarPoseStatus:(id)a4 earBoundingBox:(CGRect)a5 earStatus:(int)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  float v15 = v14;
  if (v13)
  {
    BOOL v78 = [v13 hasYawAngle] != 0;
    if (v15)
    {
LABEL_3:
      BOOL v77 = [v15 hasYawAngle] != 0;
      goto LABEL_6;
    }
  }
  else
  {
    BOOL v78 = 0;
    if (v14) {
      goto LABEL_3;
    }
  }
  BOOL v77 = 0;
LABEL_6:
  int currentTrackingEar = self->_currentTrackingEar;
  BOOL earTooClose = self->_earTooClose;
  BOOL earTooFar = self->_earTooFar;
  BOOL isEarOccluded = self->_isEarOccluded;
  unsigned int currentStep = self->_currentStep;
  BOOL v18 = currentStep > 0xB;
  int v19 = (1 << currentStep) & 0xCC0;
  if (v18 || v19 == 0) {
    goto LABEL_42;
  }
  switch(a6)
  {
    case 0:
      if (self->_earOcclusionDetectTracker) {
        --self->_earOcclusionDetectTracker;
      }
      if (self->_earTooCloseDetectTracker) {
        --self->_earTooCloseDetectTracker;
      }
      if (self->_earTooFarDetectTracker) {
        --self->_earTooFarDetectTracker;
      }
      if (self->_motionBlurrTracker) {
        self->_motionBlurrTracker = 0;
      }
      break;
    case 2:
      if (!self->_isLookingAtPhone && !earTooClose)
      {
        uint64_t v21 = 1411;
        unsigned int earOcclusionDetectTracker = self->_earOcclusionDetectTracker;
        if (earOcclusionDetectTracker < 0x15) {
          goto LABEL_29;
        }
        char v23 = 20;
        goto LABEL_30;
      }
      break;
    case 3:
      if (!self->_isLookingAtPhone)
      {
        uint64_t v21 = 1427;
        unsigned int earOcclusionDetectTracker = self->_earTooCloseDetectTracker;
        if (earOcclusionDetectTracker < 6) {
          goto LABEL_29;
        }
        char v23 = 5;
        goto LABEL_30;
      }
      break;
    case 4:
      uint64_t v21 = 1441;
      unsigned int earOcclusionDetectTracker = self->_earTooFarDetectTracker;
      if (earOcclusionDetectTracker < 0xB) {
        goto LABEL_29;
      }
      char v23 = 10;
      goto LABEL_30;
    case 5:
      uint64_t v21 = 1443;
      unsigned int earOcclusionDetectTracker = self->_motionBlurrTracker;
      if (earOcclusionDetectTracker < 0x1F) {
LABEL_29:
      }
        char v23 = earOcclusionDetectTracker + 1;
      else {
        char v23 = 30;
      }
LABEL_30:
      *((unsigned char *)&self->super.super.super.isa + v21) = v23;
      break;
    default:
      break;
  }
  self->_BOOL isEarOccluded = self->_earOcclusionDetectTracker > 0x13u;
  if (self->_earTooFarDetectTracker < 0xAu)
  {
    if (!self->_earTooCloseDetectTracker) {
      self->_BOOL earTooFar = 0;
    }
  }
  else
  {
    self->_BOOL earTooFar = 1;
  }
  unsigned int earTooCloseDetectTracker = self->_earTooCloseDetectTracker;
  if (earTooCloseDetectTracker > 4)
  {
    LOBYTE(earTooCloseDetectTracker) = 1;
LABEL_38:
    self->_BOOL earTooClose = earTooCloseDetectTracker;
    goto LABEL_39;
  }
  if (!self->_earTooCloseDetectTracker) {
    goto LABEL_38;
  }
LABEL_39:
  self->_BOOL motionBlurr = self->_motionBlurrTracker > 0x1Du;
  if (self->_earTooClose || self->_earTooFar)
  {
    self->_unsigned int earOcclusionDetectTracker = 0;
    self->_BOOL isEarOccluded = 0;
  }
LABEL_42:
  v90.origin.CGFloat x = x;
  v90.origin.CGFloat y = y;
  v90.size.CGFloat width = width;
  v90.size.CGFloat height = height;
  BOOL v25 = CGRectEqualToRect(v90, *MEMORY[0x1E4F1DB28]);
  unsigned int earBoundingBoxDetectTracker = self->_earBoundingBoxDetectTracker;
  if (v25)
  {
    BOOL v27 = earBoundingBoxDetectTracker >= 3;
    unsigned __int8 v28 = earBoundingBoxDetectTracker - 3;
    if (!v27) {
      unsigned __int8 v28 = 0;
    }
    self->_unsigned int earBoundingBoxDetectTracker = v28;
  }
  else
  {
    self->_unsigned int earBoundingBoxDetectTracker = earBoundingBoxDetectTracker + 1;
    self->_currentEarBB.origin.CGFloat x = x;
    self->_currentEarBB.origin.CGFloat y = y;
    self->_currentEarBB.size.CGFloat width = width;
    self->_currentEarBB.size.CGFloat height = height;
    unsigned __int8 v28 = self->_earBoundingBoxDetectTracker;
  }
  if (v28 >= 0x15u)
  {
    unsigned __int8 v28 = 20;
    self->_unsigned int earBoundingBoxDetectTracker = 20;
  }
  self->_earBoundingBoxDetected = v28 != 0;
  if (v78)
  {
    [v13 currentYawAngle];
    if (v29 != -100.0)
    {
      [v13 currentYawAngle];
      self->_leftEarLastYaw = v30;
      [v13 currentYawAngle];
      self->_double leftLastReceivedYaw = v31;
      [v13 currentYawAngle];
      self->_double currentYaw = v32;
      uint64_t v33 = [v13 remainingYawAngles];
      pendingYaw = self->_pendingYaw;
      self->_pendingYaw = v33;
    }
    self->_rightEarLastYaw = -100.0;
    ++self->_leftEarCaptureCount;
    unsigned int leftEarInViewCount = self->_leftEarInViewCount;
    if (leftEarInViewCount <= 0x13) {
      self->_unsigned int leftEarInViewCount = leftEarInViewCount + 1;
    }
    self->_rightEarCaptureCount = 0;
  }
  else
  {
    self->_int leftEarCaptureCount = 0;
    if (self->_leftEarInViewCount) {
      --self->_leftEarInViewCount;
    }
  }
  if (v77)
  {
    [v15 currentYawAngle];
    if (v36 != -100.0)
    {
      [v15 currentYawAngle];
      self->_rightEarLastYaw = v37;
      [v15 currentYawAngle];
      self->_double rightLastReceivedYaw = v38;
      [v15 currentYawAngle];
      self->_double currentYaw = v39;
      double v40 = [v15 remainingYawAngles];
      int v41 = self->_pendingYaw;
      self->_pendingYaw = v40;
    }
    self->_leftEarLastYaw = -100.0;
    ++self->_rightEarCaptureCount;
    unsigned int rightEarInViewCount = self->_rightEarInViewCount;
    if (rightEarInViewCount <= 0x13) {
      self->_unsigned int rightEarInViewCount = rightEarInViewCount + 1;
    }
    int v43 = 1361;
  }
  else
  {
    if (self->_rightEarInViewCount) {
      --self->_rightEarInViewCount;
    }
    int v43 = 1349;
  }
  *((unsigned char *)&self->super.super.super.isa + v43) = 0;
  if (v13)
  {
    if ([v13 hasYawAngle])
    {
      int leftEarStatus = self->_leftEarStatus;
      if (leftEarStatus >= 1 && leftEarStatus != 3)
      {
        [v13 currentYawAngle];
        self->_double currentYaw = v45;
        uint64_t v46 = [v13 remainingYawAngles];
        double v47 = self->_pendingYaw;
        self->_pendingYaw = v46;
      }
    }
  }
  if (v15)
  {
    if ([v15 hasYawAngle])
    {
      int rightEarStatus = self->_rightEarStatus;
      if (rightEarStatus >= 1 && rightEarStatus != 3)
      {
        [v15 currentYawAngle];
        self->_double currentYaw = v49;
        double v50 = [v15 remainingYawAngles];
        double v51 = self->_pendingYaw;
        self->_pendingYaw = v50;
      }
    }
  }
  double v52 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    double currentYaw = self->_currentYaw;
    double candidateYaw = self->_candidateYaw;
    v55 = @"YES";
    if (self->_earTooClose) {
      v56 = @"YES";
    }
    else {
      v56 = @"NO";
    }
    if (self->_earTooFar) {
      v57 = @"YES";
    }
    else {
      v57 = @"NO";
    }
    if (self->_motionBlurr) {
      uint64_t v58 = @"YES";
    }
    else {
      uint64_t v58 = @"NO";
    }
    if (!self->_isEarOccluded) {
      v55 = @"NO";
    }
    *(_DWORD *)buf = 134219266;
    *(double *)uint64_t v80 = currentYaw;
    *(_WORD *)&v80[8] = 2048;
    *(double *)uint64_t v81 = candidateYaw;
    *(_WORD *)&v81[8] = 2112;
    uint64_t v82 = v56;
    __int16 v83 = 2112;
    v84 = v57;
    __int16 v85 = 2112;
    double v86 = v58;
    __int16 v87 = 2112;
    double v88 = v55;
    _os_log_impl(&dword_1E4BFE000, v52, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Current yaw : %f  < %f >  :  Too Close: %@ Too Far : %@ Motion Blurr: %@ Occlusion (Note other param affect this) : %@", buf, 0x3Eu);
  }

  if (self->_leftEarCaptureCount >= 5u)
  {
    self->_int leftEarCaptureCount = 1;
    self->_int currentTrackingEar = 1;
  }
  if (self->_rightEarCaptureCount >= 5u)
  {
    self->_rightEarCaptureCount = 1;
    self->_int currentTrackingEar = 2;
  }
  if (v78 || v77)
  {
    int v59 = self->_currentTrackingEar;
  }
  else
  {
    int v59 = 0;
    self->_int currentTrackingEar = 0;
  }
  if (v59 != currentTrackingEar)
  {
    v60 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      int v61 = self->_currentTrackingEar;
      int v62 = self->_currentStep;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)uint64_t v80 = v61;
      *(_WORD *)&v80[4] = 1024;
      *(_DWORD *)&v80[6] = v62;
      _os_log_impl(&dword_1E4BFE000, v60, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Ear Tracking Changed to %d Current State %d", buf, 0xEu);
    }
  }
  if (earTooClose != self->_earTooClose
    || earTooFar != self->_earTooFar
    || isEarOccluded != self->_isEarOccluded
    || self->_currentTrackingEar != currentTrackingEar)
  {
    int v63 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      v64 = @"YES";
      if (self->_earTooClose) {
        int v65 = @"YES";
      }
      else {
        int v65 = @"NO";
      }
      BOOL motionBlurr = self->_motionBlurr;
      BOOL v67 = self->_isEarOccluded;
      if (self->_earTooFar) {
        v68 = @"YES";
      }
      else {
        v68 = @"NO";
      }
      *(_DWORD *)buf = 138413058;
      if (motionBlurr) {
        id v69 = @"YES";
      }
      else {
        id v69 = @"NO";
      }
      *(void *)uint64_t v80 = v65;
      *(_WORD *)&v80[8] = 2112;
      if (!v67) {
        v64 = @"NO";
      }
      *(void *)uint64_t v81 = v68;
      *(_WORD *)&v81[8] = 2112;
      uint64_t v82 = v69;
      __int16 v83 = 2112;
      v84 = v64;
      _os_log_impl(&dword_1E4BFE000, v63, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Ear Aggressor parameter Changes Too Close: %@ Too Far : %@ Motion Blurr: %@ Occlusion (Note other param affect this) : %@ ", buf, 0x2Au);
    }

    if (isEarOccluded != self->_isEarOccluded)
    {
      uint64_t v70 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_isEarOccluded) {
          v71 = "YES";
        }
        else {
          v71 = "NO";
        }
        int v72 = self->_earOcclusionDetectTracker;
        BOOL supressEarOcclusionWarning = self->_supressEarOcclusionWarning;
        *(_DWORD *)buf = 136315650;
        *(void *)uint64_t v80 = v71;
        *(_WORD *)&v80[8] = 1024;
        *(_DWORD *)uint64_t v81 = v72;
        *(_WORD *)&v81[4] = 1024;
        *(_DWORD *)&v81[6] = supressEarOcclusionWarning;
        _os_log_impl(&dword_1E4BFE000, v70, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Ear Occlusion changed to %s current number of entries %d UI supressed = %d", buf, 0x18u);
      }
    }
  }
}

- (void)hideContinueButton
{
  [(OBTrayButton *)self->_continueButton setHidden:1];
  buttonTrayEffectView = self->_buttonTrayEffectView;

  [(UIVisualEffectView *)buttonTrayEffectView setHidden:1];
}

- (void)showContinueButton
{
  [(OBTrayButton *)self->_continueButton setHidden:0];
  buttonTrayEffectView = self->_buttonTrayEffectView;

  [(UIVisualEffectView *)buttonTrayEffectView setHidden:0];
}

- (void)hideOcclusionContinueButton
{
  [(OBTrayButton *)self->_occlusionContinueButton setHidden:1];
  buttonTrayEffectView = self->_buttonTrayEffectView;

  [(UIVisualEffectView *)buttonTrayEffectView setHidden:1];
}

- (void)showOcclusionContinueButton
{
  [(OBTrayButton *)self->_occlusionContinueButton setHidden:0];
  buttonTrayEffectView = self->_buttonTrayEffectView;

  [(UIVisualEffectView *)buttonTrayEffectView setHidden:0];
}

- (BOOL)isEarTooClose
{
  unsigned int currentStep = self->_currentStep;
  BOOL v3 = currentStep > 0xB;
  int v4 = (1 << currentStep) & 0xCC0;
  BOOL v5 = v3 || v4 == 0;
  return !v5 && !self->_supressEarDistanceWarning && self->_earTooClose;
}

- (BOOL)isEarTooFar
{
  unsigned int currentStep = self->_currentStep;
  BOOL v3 = currentStep > 0xB;
  int v4 = (1 << currentStep) & 0xCC0;
  BOOL v5 = v3 || v4 == 0;
  return !v5 && !self->_supressEarDistanceWarning && self->_earTooFar;
}

- (BOOL)isEarMovingFast
{
  unsigned int currentStep = self->_currentStep;
  BOOL v3 = currentStep > 0xB;
  int v4 = (1 << currentStep) & 0xCC0;
  BOOL v5 = v3 || v4 == 0;
  return !v5 && !self->_supressEarDistanceWarning && self->_motionBlurr && !self->_earTooClose && !self->_earTooFar;
}

- (void)startEarDistanceWarnCoolDownTimer
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__HPSSpatialProfileEnrollmentController_startEarDistanceWarnCoolDownTimer__block_invoke;
  block[3] = &unk_1E6EA82F0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __74__HPSSpatialProfileEnrollmentController_startEarDistanceWarnCoolDownTimer__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 1432))
  {
    [(id)v2 stopEarDistanceWarnCoolDownTimer];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(v2 + 1444) = 1;
  uint64_t v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:sel_triggerEarDistanceWarnCoolDownTimer selector:0 userInfo:0 repeats:9.0];
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(void **)(v4 + 1432);
  *(void *)(v4 + 1432) = v3;

  int v6 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)float32x2_t v7 = 0;
    _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Start Ear distance Cool down timer", v7, 2u);
  }
}

- (void)triggerEarDistanceWarnCoolDownTimer
{
  self->_supressEarDistanceWarning = 0;
  uint64_t v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Ready to show ear too close error", v3, 2u);
  }
}

- (void)stopEarDistanceWarnCoolDownTimer
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    CGFloat x = self->_currentEarBB.origin.x;
    CGFloat y = self->_currentEarBB.origin.y;
    CGFloat width = self->_currentEarBB.size.width;
    CGFloat height = self->_currentEarBB.size.height;
    int v9 = 134218752;
    CGFloat v10 = x;
    __int16 v11 = 2048;
    CGFloat v12 = y;
    __int16 v13 = 2048;
    CGFloat v14 = width;
    __int16 v15 = 2048;
    CGFloat v16 = height;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Stopping ear too close  Timer Current Bounding Box [ %f %f %f %f", (uint8_t *)&v9, 0x2Au);
  }

  [(NSTimer *)self->_earTooCloseWarnCoolDownTimer invalidate];
  earTooCloseWarnCoolDownTimer = self->_earTooCloseWarnCoolDownTimer;
  self->_earTooCloseWarnCoolDownTimer = 0;
}

- (void)startEnrollGuidanceTimer
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__HPSSpatialProfileEnrollmentController_startEnrollGuidanceTimer__block_invoke;
  block[3] = &unk_1E6EA82F0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __65__HPSSpatialProfileEnrollmentController_startEnrollGuidanceTimer__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 1552))
  {
    [*(id *)(a1 + 32) stopEnrollGuidanceTimer];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:v2 target:sel_triggerEnrollGuidanceTimer selector:0 userInfo:0 repeats:5.0];
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(void **)(v4 + 1552);
  *(void *)(v4 + 1552) = v3;

  int v6 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)float32x2_t v7 = 0;
    _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Start Progress Player", v7, 2u);
  }
}

- (void)triggerEnrollGuidanceTimer
{
  *(void *)((char *)&v72[2] + 6) = *MEMORY[0x1E4F143B8];
  pendingYaw = self->_pendingYaw;
  if (pendingYaw)
  {
    double enrollGuidancePitch = self->_enrollGuidancePitch;
    if ([(NSArray *)pendingYaw count])
    {
      double candidateYaw = self->_candidateYaw;
      self->_double candidateYaw = -100.0;
      int v6 = [(NSArray *)self->_pendingYaw firstObject];
      float32x2_t v7 = v6;
      if (v6)
      {
        [v6 floatValue];
        double v9 = (float)-v8;
        self->_double candidateYaw = v9;
        if (candidateYaw != v9)
        {
          CGFloat v10 = sharedBluetoothSettingsLogComponent();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            double v11 = self->_candidateYaw;
            *(_DWORD *)buf = 134218240;
            double v67 = candidateYaw;
            __int16 v68 = 2048;
            double v69 = v11;
            _os_log_impl(&dword_1E4BFE000, v10, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Dynamic enrollment guidance Candidate angle updated %f --> %f", buf, 0x16u);
          }
        }
      }
      int leftEarStatus = self->_leftEarStatus;
      BOOL v13 = leftEarStatus < 1 || leftEarStatus == 3;
      if (v13 || !self->_leftEarInViewCount)
      {
        int rightEarStatus = self->_rightEarStatus;
        BOOL v14 = rightEarStatus >= 1 && rightEarStatus != 3 && self->_rightEarInViewCount != 0;
      }
      else
      {
        BOOL v14 = 1;
      }
      uint64_t v17 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        double currentYaw = self->_currentYaw;
        double v19 = self->_candidateYaw;
        int leftEarInViewCount = self->_leftEarInViewCount;
        int rightEarInViewCount = self->_rightEarInViewCount;
        __int16 v22 = @"NO";
        if (v14) {
          __int16 v22 = @"YES";
        }
        *(_DWORD *)buf = 134219010;
        double v67 = currentYaw;
        __int16 v68 = 2048;
        double v69 = v19;
        __int16 v70 = 1024;
        *(_DWORD *)v71 = leftEarInViewCount;
        *(_WORD *)&v71[4] = 1024;
        *(_DWORD *)&v71[6] = rightEarInViewCount;
        LOWORD(v72[0]) = 2112;
        *(void *)((char *)v72 + 2) = v22;
        _os_log_impl(&dword_1E4BFE000, v17, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Dynamic enrollment guidance evaluating Feedback Current Yaw %f Target Yaw %f Ear Tracking [L %d R %d] %@", buf, 0x2Cu);
      }

      double v23 = self->_candidateYaw;
      if (v23 != -100.0)
      {
        if (v14)
        {
          uint64_t v58 = 1568;
          double v24 = vabdd_f64(v23, self->_currentYaw);
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          int v59 = v7;
          BOOL v25 = self->_feedBackBinning;
          uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v61 objects:v65 count:16];
          if (v26)
          {
            uint64_t v27 = v26;
            unint64_t v28 = 0;
            uint64_t v29 = *(void *)v62;
            while (2)
            {
              uint64_t v30 = 0;
              unint64_t v31 = v28 + v27;
              do
              {
                if (*(void *)v62 != v29) {
                  objc_enumerationMutation(v25);
                }
                double v32 = *(void **)(*((void *)&v61 + 1) + 8 * v30);
                objc_msgSend(v32, "floatValue", v58);
                if (v24 > v33)
                {
                  unint64_t v31 = v28 + v30;
                  double v36 = [(NSArray *)self->_feedBackPitch objectAtIndex:v28 + v30];
                  [v36 floatValue];
                  self->_double enrollGuidancePitch = v37;
                  double v38 = sharedBluetoothSettingsLogComponent();
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                  {
                    double v39 = self->_enrollGuidancePitch;
                    [v32 floatValue];
                    *(_DWORD *)buf = 134218240;
                    double v67 = v39;
                    __int16 v68 = 2048;
                    double v69 = v40;
                    _os_log_impl(&dword_1E4BFE000, v38, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Dynamic enrollment guidance Calcuated new Pitch %f based on Bin %f ", buf, 0x16u);
                  }

                  goto LABEL_42;
                }
                ++v30;
              }
              while (v27 != v30);
              uint64_t v27 = [(NSArray *)v25 countByEnumeratingWithState:&v61 objects:v65 count:16];
              unint64_t v28 = v31;
              if (v27) {
                continue;
              }
              break;
            }
          }
          else
          {
            unint64_t v31 = 0;
          }
LABEL_42:

          float32x2_t v7 = v59;
          if (v31 > [(NSArray *)self->_feedBackBinning count])
          {
            int v41 = [(NSArray *)self->_feedBackPitch lastObject];
            [v41 floatValue];
            self->_double enrollGuidancePitch = v42;
            int v43 = sharedBluetoothSettingsLogComponent();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              double v44 = self->_enrollGuidancePitch;
              *(_DWORD *)buf = 134217984;
              double v67 = v44;
              _os_log_impl(&dword_1E4BFE000, v43, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Dynamic enrollment guidance Calcuated new Pitch as lowest %f", buf, 0xCu);
            }
          }
          double v45 = sharedBluetoothSettingsLogComponent();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            double v46 = self->_candidateYaw;
            double v47 = *(double *)((char *)&self->super.super.super.isa + v58);
            double v48 = self->_enrollGuidancePitch;
            *(_DWORD *)buf = 134218752;
            double v67 = v46;
            __int16 v68 = 2048;
            double v69 = v47;
            __int16 v70 = 2048;
            *(double *)v71 = v24;
            *(_WORD *)&v71[8] = 2048;
            *(double *)int v72 = v48;
            _os_log_impl(&dword_1E4BFE000, v45, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Dynamic enrollment guidance Candidate %f  _currentYaw %f : evaluating Delta %f New Pitch %f ", buf, 0x2Au);
          }

          if (enrollGuidancePitch != self->_enrollGuidancePitch
            || ![(HPSSpatialProfileSoundHapticManager *)self->_soundHapticManager isEnrollGuidancePlaying])
          {
            double v49 = sharedBluetoothSettingsLogComponent();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              double v50 = self->_enrollGuidancePitch;
              BOOL v51 = [(HPSSpatialProfileSoundHapticManager *)self->_soundHapticManager isEnrollGuidancePlaying];
              double v52 = @"YES";
              *(_DWORD *)buf = 134218498;
              double v67 = enrollGuidancePitch;
              if (v51) {
                double v52 = @"NO";
              }
              __int16 v68 = 2048;
              double v69 = v50;
              __int16 v70 = 2112;
              *(void *)v71 = v52;
              _os_log_impl(&dword_1E4BFE000, v49, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Dynamic enrollment guidance Update Dynamic audio feedback pitch %f -> %f Restart Play %@", buf, 0x20u);
            }

            double v53 = self->_enrollGuidancePitch;
            *(float *)&double v53 = v53;
            [(HPSSpatialProfileSoundHapticManager *)self->_soundHapticManager setEnrollGuidancePitch:v53];
            if (![(HPSSpatialProfileSoundHapticManager *)self->_soundHapticManager isEnrollGuidancePlaying])[(HPSSpatialProfileSoundHapticManager *)self->_soundHapticManager playEnrollGuidance:self->_currentStep]; {
          }
            }
        }
        else
        {
          self->_double enrollGuidancePitch = 0.5;
          LODWORD(v23) = 0.5;
          [(HPSSpatialProfileSoundHapticManager *)self->_soundHapticManager setEnrollGuidancePitch:v23];
          uint64_t v34 = sharedBluetoothSettingsLogComponent();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            double v35 = self->_enrollGuidancePitch;
            *(_DWORD *)buf = 134218240;
            double v67 = enrollGuidancePitch;
            __int16 v68 = 2048;
            double v69 = v35;
            _os_log_impl(&dword_1E4BFE000, v34, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Dynamic enrollment guidance Not tracking ear, reset Pitch + Pause Play .%f -> %f", buf, 0x16u);
          }

          [(HPSSpatialProfileSoundHapticManager *)self->_soundHapticManager pauseEnrollGuidancePlayer];
          self->_double currentYaw = -100.0;
        }
      }
    }
  }
  int v54 = self->_leftEarStatus;
  BOOL v55 = v54 < 1 || v54 == 3;
  if (!v55 || ((int v56 = self->_rightEarStatus, v56 >= 1) ? (v57 = v56 == 3) : (v57 = 1), !v57))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__HPSSpatialProfileEnrollmentController_triggerEnrollGuidanceTimer__block_invoke;
    block[3] = &unk_1E6EA82F0;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __67__HPSSpatialProfileEnrollmentController_triggerEnrollGuidanceTimer__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 1552) = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:sel_triggerEnrollGuidanceTimer selector:0 userInfo:0 repeats:0.5];

  return MEMORY[0x1F41817F8]();
}

- (void)stopEnrollGuidanceTimer
{
  uint64_t v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Dynamic enrollment guidance Stopping Timer", v6, 2u);
  }

  enrollGuidanceTimer = self->_enrollGuidanceTimer;
  if (enrollGuidanceTimer)
  {
    [(NSTimer *)enrollGuidanceTimer invalidate];
    BOOL v5 = self->_enrollGuidanceTimer;
    self->_enrollGuidanceTimer = 0;
  }
}

- (void)alertEarDistanceWarning:(int)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double currentYaw = self->_currentYaw;
    double candidateYaw = self->_candidateYaw;
    *(_DWORD *)buf = 67109632;
    int v16 = a3;
    __int16 v17 = 2048;
    double v18 = currentYaw;
    __int16 v19 = 2048;
    double v20 = candidateYaw;
    _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Error Message *** Ear distance detection warning shown to user %d Current yaw %f Candidate Yaw %f ", buf, 0x1Cu);
  }

  self->_unsigned int earOcclusionDetectTracker = 0;
  self->_BOOL isEarOccluded = 0;
  [(HPSSpatialProfileEnrollmentController *)self restartOcclusionWarnCoolDownTimer];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__HPSSpatialProfileEnrollmentController_alertEarDistanceWarning___block_invoke;
  block[3] = &unk_1E6EA82F0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
  switch(a3)
  {
    case 5:
      [(HPSSpatialProfileEnrollmentController *)self pauseEnrollment];
      float v8 = v11;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      double v9 = __65__HPSSpatialProfileEnrollmentController_alertEarDistanceWarning___block_invoke_6;
      break;
    case 4:
      [(HPSSpatialProfileEnrollmentController *)self pauseEnrollment];
      float v8 = v12;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      double v9 = __65__HPSSpatialProfileEnrollmentController_alertEarDistanceWarning___block_invoke_4;
      break;
    case 3:
      [(HPSSpatialProfileEnrollmentController *)self pauseEnrollment];
      float v8 = v13;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      double v9 = __65__HPSSpatialProfileEnrollmentController_alertEarDistanceWarning___block_invoke_2;
      break;
    default:
      return;
  }
  v8[2] = v9;
  v8[3] = &unk_1E6EA82F0;
  void v8[4] = self;
  CGFloat v10 = (void *)MEMORY[0x1E4F14428];
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __65__HPSSpatialProfileEnrollmentController_alertEarDistanceWarning___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1128) pauseProgressPlayer];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1128);

  return [v2 pauseEnrollGuidancePlayer];
}

void __65__HPSSpatialProfileEnrollmentController_alertEarDistanceWarning___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) clearBoundingBox];
  [*(id *)(a1 + 32) forceBlur];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1016);
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"EAR_TOO_CLOSE_TITLE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v2 setTitle:v4];

  BOOL v5 = [MEMORY[0x1E4F1CA20] currentLocale];
  int v6 = [v5 objectForKey:*MEMORY[0x1E4F1C490]];
  LODWORD(v4) = [v6 BOOLValue];

  float32x2_t v7 = *(void **)(*(void *)(a1 + 32) + 1016);
  float v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v9 = v8;
  if (v4) {
    CGFloat v10 = @"EAR_TOO_CLOSE_DETAIL_METRICS";
  }
  else {
    CGFloat v10 = @"EAR_TOO_CLOSE_DETAIL_IMPERIAL";
  }
  double v11 = [v8 localizedStringForKey:v10 value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v7 setDetailText:v11];

  CGFloat v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  BOOL v13 = *(void **)(*(void *)(a1 + 32) + 1128);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  _DWORD v15[2] = __65__HPSSpatialProfileEnrollmentController_alertEarDistanceWarning___block_invoke_3;
  v15[3] = &unk_1E6EA82F0;
  int v16 = v12;
  BOOL v14 = v12;
  [v13 triggerSoundHapticForEnrollmentState:19 completion:v15];
  [*(id *)(a1 + 32) showEarDistanceWarningContinueButton];
}

void __65__HPSSpatialProfileEnrollmentController_alertEarDistanceWarning___block_invoke_3(uint64_t a1)
{
}

void __65__HPSSpatialProfileEnrollmentController_alertEarDistanceWarning___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) clearBoundingBox];
  [*(id *)(a1 + 32) forceBlur];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1016);
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"EAR_TOO_FAR_TITLE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v2 setTitle:v4];

  BOOL v5 = [MEMORY[0x1E4F1CA20] currentLocale];
  int v6 = [v5 objectForKey:*MEMORY[0x1E4F1C490]];
  LODWORD(v4) = [v6 BOOLValue];

  float32x2_t v7 = *(void **)(*(void *)(a1 + 32) + 1016);
  float v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v9 = v8;
  if (v4) {
    CGFloat v10 = @"EAR_TOO_CLOSE_DETAIL_METRICS";
  }
  else {
    CGFloat v10 = @"EAR_TOO_CLOSE_DETAIL_IMPERIAL";
  }
  double v11 = [v8 localizedStringForKey:v10 value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v7 setDetailText:v11];

  CGFloat v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  BOOL v13 = *(void **)(*(void *)(a1 + 32) + 1128);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  _DWORD v15[2] = __65__HPSSpatialProfileEnrollmentController_alertEarDistanceWarning___block_invoke_5;
  v15[3] = &unk_1E6EA82F0;
  int v16 = v12;
  BOOL v14 = v12;
  [v13 triggerSoundHapticForEnrollmentState:19 completion:v15];
  [*(id *)(a1 + 32) showEarDistanceWarningContinueButton];
}

void __65__HPSSpatialProfileEnrollmentController_alertEarDistanceWarning___block_invoke_5(uint64_t a1)
{
}

void __65__HPSSpatialProfileEnrollmentController_alertEarDistanceWarning___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) clearBoundingBox];
  [*(id *)(a1 + 32) forceBlur];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1016);
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"EAR_TOO_FAST_DETAIL" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v2 setDetailText:v4];

  BOOL v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  int v6 = *(void **)(*(void *)(a1 + 32) + 1128);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__HPSSpatialProfileEnrollmentController_alertEarDistanceWarning___block_invoke_7;
  v8[3] = &unk_1E6EA82F0;
  double v9 = v5;
  float32x2_t v7 = v5;
  [v6 triggerSoundHapticForEnrollmentState:19 completion:v8];
  [*(id *)(a1 + 32) showEarDistanceWarningContinueButton];
}

void __65__HPSSpatialProfileEnrollmentController_alertEarDistanceWarning___block_invoke_7(uint64_t a1)
{
}

- (void)continueEarDistanceWarning
{
  uint64_t v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Ear Too close ContinueButton Tapped", buf, 2u);
  }

  [(HPSSpatialProfileEnrollmentController *)self resumeEnrollment];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__HPSSpatialProfileEnrollmentController_continueEarDistanceWarning__block_invoke;
  block[3] = &unk_1E6EA82F0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
  self->_BOOL isEarOccluded = 0;
  self->_unsigned int earOcclusionDetectTracker = 0;
  self->_BOOL earTooClose = 0;
  self->_unsigned int earTooCloseDetectTracker = 0;
  self->_BOOL earTooFar = 0;
  self->_earTooFarDetectTracker = 0;
  [(HPSSpatialProfileEnrollmentController *)self startEarDistanceWarnCoolDownTimer];
}

uint64_t __67__HPSSpatialProfileEnrollmentController_continueEarDistanceWarning__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) cancelBlur];
  [*(id *)(a1 + 32) hideEarDistanceWarningContinueButton];
  [*(id *)(a1 + 32) updateEarEnrollText];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 1128);
  uint64_t v4 = *(unsigned int *)(v2 + 1236);

  return [v3 playProgressPlayer:v4];
}

- (void)hideEarDistanceWarningContinueButton
{
  [(OBTrayButton *)self->_earDistanceWarnContinueButton setHidden:1];
  buttonTrayEffectView = self->_buttonTrayEffectView;

  [(UIVisualEffectView *)buttonTrayEffectView setHidden:1];
}

- (void)showEarDistanceWarningContinueButton
{
  [(OBTrayButton *)self->_earDistanceWarnContinueButton setHidden:0];
  buttonTrayEffectView = self->_buttonTrayEffectView;

  [(UIVisualEffectView *)buttonTrayEffectView setHidden:0];
}

- (void)startEarEnrollmentNudgeTimer
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__HPSSpatialProfileEnrollmentController_startEarEnrollmentNudgeTimer__block_invoke;
  block[3] = &unk_1E6EA82F0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __69__HPSSpatialProfileEnrollmentController_startEarEnrollmentNudgeTimer__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 1480))
  {
    [*(id *)(a1 + 32) stopEarEnrollmentNudgeTimer];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:v2 target:sel_triggerEarEnrollmentNudgeTimer selector:0 userInfo:1 repeats:20.0];
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(void **)(v4 + 1480);
  *(void *)(v4 + 1480) = v3;

  int v6 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)float32x2_t v7 = 0;
    _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, "Spatial Profile:Checking ear enrollment nudge", v7, 2u);
  }
}

- (void)triggerEarEnrollmentNudgeTimer
{
  if (self->_rightEarStatus == 3 && self->_leftEarStatus == 3) {
    [(HPSSpatialProfileEnrollmentController *)self stopEarEnrollmentNudgeTimer];
  }
  else {
    [(HPSSpatialProfileEnrollmentController *)self nudgeEar];
  }
}

- (void)nudgeEar
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (CACurrentMediaTime() - self->_lastEarCaptureTime < 3.0 || self->_enrollmentPaused)
  {
    uint64_t v3 = sharedBluetoothSettingsLogComponent();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
LABEL_6:

      return;
    }
    CFTimeInterval v4 = CACurrentMediaTime() - self->_lastEarCaptureTime;
    BOOL enrollmentPaused = self->_enrollmentPaused;
    *(_DWORD *)buf = 134218240;
    *(CFTimeInterval *)float v37 = v4;
    *(_WORD *)&v37[8] = 1024;
    LODWORD(v38) = enrollmentPaused;
    int v6 = "Spatial Profile:got frame within last %f sec Enrollment Pause status: %d";
    float32x2_t v7 = v3;
    uint32_t v8 = 18;
LABEL_5:
    _os_log_impl(&dword_1E4BFE000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    goto LABEL_6;
  }
  double v9 = sharedBluetoothSettingsLogComponent();
  CGFloat v10 = &OBJC_IVAR___HPSSpatialProfileEnrollmentController__earTooFar;
  double v11 = &OBJC_IVAR___HPSSpatialProfileEnrollmentController__earTooFar;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int leftEarStatus = self->_leftEarStatus;
    BOOL leftEarRearCaptured = self->_leftEarRearCaptured;
    BOOL leftEarFrontCaptured = self->_leftEarFrontCaptured;
    int rightEarStatus = self->_rightEarStatus;
    BOOL rightEarFrontCaptured = self->_rightEarFrontCaptured;
    BOOL rightEarRearCaptured = self->_rightEarRearCaptured;
    CFTimeInterval v18 = CACurrentMediaTime() - self->_lastEarCaptureTime;
    double candidateYaw = self->_candidateYaw;
    double currentYaw = self->_currentYaw;
    *(_DWORD *)buf = 67111168;
    *(_DWORD *)float v37 = leftEarStatus;
    *(_WORD *)&v37[4] = 1024;
    *(_DWORD *)&v37[6] = leftEarRearCaptured;
    LOWORD(v38) = 1024;
    *(_DWORD *)((char *)&v38 + 2) = leftEarFrontCaptured;
    HIWORD(v38) = 1024;
    int v39 = rightEarStatus;
    __int16 v40 = 1024;
    BOOL v41 = rightEarFrontCaptured;
    CGFloat v10 = &OBJC_IVAR___HPSSpatialProfileEnrollmentController__earTooFar;
    __int16 v42 = 1024;
    BOOL v43 = rightEarRearCaptured;
    double v11 = &OBJC_IVAR___HPSSpatialProfileEnrollmentController__earTooFar;
    __int16 v44 = 2048;
    CFTimeInterval v45 = v18;
    __int16 v46 = 2048;
    double v47 = candidateYaw;
    __int16 v48 = 2048;
    double v49 = currentYaw;
    _os_log_impl(&dword_1E4BFE000, v9, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Trigger nudge Left ear Status %d : [ Rear captured : %d Fron Captured : %d ] right ear  Status %d: [ Rear captured : %d Fron Captured : %d ] Time From last detection %f Candidate Yaw %f Current Yaw %f", buf, 0x44u);
  }

  uint64_t v21 = v11[11];
  double v22 = *(double *)((char *)&self->super.super.super.isa + v21);
  if (v22 == -100.0 || (v23 = v10[12], double v24 = *(double *)((char *)&self->super.super.super.isa + v23), v24 == -100.0))
  {
    uint64_t v26 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4BFE000, v26, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Ignore Trigger nudge Left ear due to missing yaw", buf, 2u);
    }

    return;
  }
  if (vabdd_f64(v24, v22) <= 10.0)
  {
    uint64_t v3 = sharedBluetoothSettingsLogComponent();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_6;
    }
    uint64_t v27 = *(uint64_t *)((char *)&self->super.super.super.isa + v23);
    uint64_t v28 = *(uint64_t *)((char *)&self->super.super.super.isa + v21);
    *(_DWORD *)buf = 134218240;
    *(void *)float v37 = v27;
    *(_WORD *)&v37[8] = 2048;
    uint64_t v38 = v28;
    int v6 = "Spatial Profile: Ignore Trigger nudge Left ear due to lower threshold : Candiate %f - Current %f";
    float32x2_t v7 = v3;
    uint32_t v8 = 22;
    goto LABEL_5;
  }
  if (self->_rightEarStatus != 2)
  {
    if (self->_leftEarStatus != 2) {
      return;
    }
    if (v24 > v22)
    {
LABEL_24:
      dispatch_time_t v29 = dispatch_time(0, 300000000);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke_5;
      v33[3] = &unk_1E6EA82F0;
      v33[4] = self;
      uint64_t v30 = MEMORY[0x1E4F14428];
      unint64_t v31 = v33;
LABEL_27:
      dispatch_after(v29, v30, v31);
      return;
    }
    goto LABEL_26;
  }
  dispatch_time_t v25 = dispatch_time(0, 300000000);
  if (v24 <= v22)
  {
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke_3;
    v34[3] = &unk_1E6EA82F0;
    v34[4] = self;
    dispatch_after(v25, MEMORY[0x1E4F14428], v34);
    if (self->_leftEarStatus != 2) {
      return;
    }
LABEL_26:
    dispatch_time_t v29 = dispatch_time(0, 300000000);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke_7;
    v32[3] = &unk_1E6EA82F0;
    v32[4] = self;
    uint64_t v30 = MEMORY[0x1E4F14428];
    unint64_t v31 = v32;
    goto LABEL_27;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke;
  block[3] = &unk_1E6EA82F0;
  void block[4] = self;
  dispatch_after(v25, MEMORY[0x1E4F14428], block);
  if (self->_leftEarStatus == 2) {
    goto LABEL_24;
  }
}

uint64_t __49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) forceBlur];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 1136);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke_2;
  v5[3] = &unk_1E6EA82F0;
  void v5[4] = v2;
  return [v3 nudgeRight:v5];
}

_DWORD *__49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke_2(uint64_t a1)
{
  uint64_t result = *(_DWORD **)(a1 + 32);
  if (result[338] == 2 || result[342] == 2) {
    return (_DWORD *)[result cancelBlur];
  }
  return result;
}

uint64_t __49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) forceBlur];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 1136);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke_4;
  v5[3] = &unk_1E6EA82F0;
  void v5[4] = v2;
  return [v3 nudgeLeft:v5];
}

_DWORD *__49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke_4(uint64_t a1)
{
  uint64_t result = *(_DWORD **)(a1 + 32);
  if (result[338] == 2 || result[342] == 2) {
    return (_DWORD *)[result cancelBlur];
  }
  return result;
}

uint64_t __49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) forceBlur];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 1136);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke_6;
  v5[3] = &unk_1E6EA82F0;
  void v5[4] = v2;
  return [v3 nudgeLeft:v5];
}

_DWORD *__49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke_6(uint64_t a1)
{
  uint64_t result = *(_DWORD **)(a1 + 32);
  if (result[338] == 2 || result[342] == 2) {
    return (_DWORD *)[result cancelBlur];
  }
  return result;
}

uint64_t __49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke_7(uint64_t a1)
{
  [*(id *)(a1 + 32) forceBlur];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 1136);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke_8;
  v5[3] = &unk_1E6EA82F0;
  void v5[4] = v2;
  return [v3 nudgeRight:v5];
}

_DWORD *__49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke_8(uint64_t a1)
{
  uint64_t result = *(_DWORD **)(a1 + 32);
  if (result[338] == 2 || result[342] == 2) {
    return (_DWORD *)[result cancelBlur];
  }
  return result;
}

- (void)stopEarEnrollmentNudgeTimer
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__HPSSpatialProfileEnrollmentController_stopEarEnrollmentNudgeTimer__block_invoke;
  block[3] = &unk_1E6EA82F0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __68__HPSSpatialProfileEnrollmentController_stopEarEnrollmentNudgeTimer__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1480) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 1480);
  *(void *)(v2 + 1480) = 0;
}

- (void)cancelBlur
{
  [(HPSSpatialProfileUIPearlEnrollView *)self->_enrollView setPauseBlur:1];
  [(HPSSpatialProfileUIPearlEnrollView *)self->_enrollView setForceBlur:0];
  enrollView = self->_enrollView;

  [(HPSSpatialProfileUIPearlEnrollView *)enrollView setCameraBlurAmount:0 useShade:0 duration:0.0 completion:0.5];
}

- (void)forceBlur
{
  [(HPSSpatialProfileUIPearlEnrollView *)self->_enrollView setPauseBlur:0];
  [(HPSSpatialProfileUIPearlEnrollView *)self->_enrollView setForceBlur:1];
  enrollView = self->_enrollView;

  [(HPSSpatialProfileUIPearlEnrollView *)enrollView setCameraBlurAmount:0 useShade:0 duration:15.0 completion:0.5];
}

- (void)sendTipKitSignal
{
  uint64_t v2 = [MEMORY[0x1E4F504C8] discoverabilitySignal];
  uint64_t v3 = [v2 source];
  id v4 = objc_alloc(MEMORY[0x1E4F50318]);
  BOOL v5 = [MEMORY[0x1E4F28B50] mainBundle];
  int v6 = [v5 bundleIdentifier];
  float32x2_t v7 = (void *)[v4 initWithIdentifier:@"com.apple.HeadphoneSettings.spatial-profile-enrollment-triggered" bundleID:v6 context:0];

  [v3 sendEvent:v7];
  uint32_t v8 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v9 = 0;
    _os_log_impl(&dword_1E4BFE000, v8, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Signal Sent to TipKit", v9, 2u);
  }
}

- (id)dismissalHandler
{
  return self->dismissalHandler;
}

- (void)setDismissalHandler:(id)a3
{
}

- (BOOL)pillsFilled
{
  return self->_pillsFilled;
}

- (void)setPillsFilled:(BOOL)a3
{
  self->_pillsFilled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->dismissalHandler, 0);
  objc_storeStrong((id *)&self->_feedBackPitch, 0);
  objc_storeStrong((id *)&self->_feedBackBinning, 0);
  objc_storeStrong((id *)&self->_pendingYaw, 0);
  objc_storeStrong((id *)&self->_enrollGuidanceTimer, 0);
  objc_storeStrong((id *)&self->_frameDetector, 0);
  objc_storeStrong((id *)&self->_frameContext, 0);
  objc_storeStrong((id *)&self->_earEnrollmentNudgeTimer, 0);
  objc_storeStrong((id *)&self->_earTooCloseWarnCoolDownTimer, 0);
  objc_storeStrong((id *)&self->_occlusionWarnCoolDownTimer, 0);
  objc_storeStrong((id *)&self->_btManager, 0);
  objc_storeStrong((id *)&self->_visualDetectionQueue, 0);
  objc_storeStrong((id *)&self->_stepSerialQueue, 0);
  objc_storeStrong((id *)&self->_faceInFrameHandlerTimer, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_enrollmentAnalytics, 0);
  objc_storeStrong((id *)&self->_profileData, 0);
  objc_storeStrong((id *)&self->_enrollmentSession, 0);
  objc_storeStrong((id *)&self->videoCaptureSession, 0);
  objc_storeStrong((id *)&self->_startEarEnrollWarningCoolDownTimer, 0);
  objc_storeStrong((id *)&self->_tutorialResumeEnrollTimer, 0);
  objc_storeStrong((id *)&self->_postProcessSpinnerTimer, 0);
  objc_storeStrong((id *)&self->_postProcessTimer, 0);
  objc_storeStrong((id *)&self->_captureViewTimer, 0);
  objc_storeStrong((id *)&self->_earBoundingBoxView, 0);
  objc_storeStrong((id *)&self->_earDotsMovieView, 0);
  objc_storeStrong((id *)&self->_earTutorialView, 0);
  objc_storeStrong((id *)&self->_tutorialContentView, 0);
  objc_storeStrong((id *)&self->_earPillContainer, 0);
  objc_storeStrong((id *)&self->_enrollView, 0);
  objc_storeStrong((id *)&self->_soundHapticManager, 0);
  objc_storeStrong((id *)&self->_welcomeImageView, 0);
  objc_storeStrong((id *)&self->_welcomeContentView, 0);
  objc_storeStrong((id *)&self->_spacerViewSecond, 0);
  objc_storeStrong((id *)&self->_spacerViewFirst, 0);
  objc_storeStrong((id *)&self->_buttonTrayEffectView, 0);
  objc_storeStrong((id *)&self->_earDistanceWarnContinueButton, 0);
  objc_storeStrong((id *)&self->_occlusionContinueButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_learnMoreView, 0);
  objc_storeStrong((id *)&self->_infoView, 0);
  objc_storeStrong((id *)&self->_scrollInnerStackView, 0);
  objc_storeStrong((id *)&self->_scrollInnerContentView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_scrollContentView, 0);

  objc_storeStrong((id *)&self->_enrollContentView, 0);
}

void __56__HPSSpatialProfileEnrollmentController_startEnrollment__block_invoke_cold_1()
{
}

- (void)didReceiveStateUpdateForSession:stateInfo:.cold.1()
{
}

- (void)didReceiveStateUpdateForSession:stateInfo:.cold.3()
{
}

@end