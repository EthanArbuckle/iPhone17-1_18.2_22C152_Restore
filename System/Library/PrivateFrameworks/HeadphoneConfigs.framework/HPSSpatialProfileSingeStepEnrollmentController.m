@interface HPSSpatialProfileSingeStepEnrollmentController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (BOOL)checkAndShowInEarPopup;
- (BOOL)isEarOccluded;
- (BOOL)pillsFilled;
- (HPSSpatialProfileSingeStepEnrollmentController)init;
- (NSMutableArray)cachedTransitionStates;
- (NSString)downloadAssetPath;
- (id)angleArrayToBinaryString:(id)a3;
- (id)dismissalHandler;
- (id)getBudsInEarString;
- (int)state;
- (void)bluetoothDidBecomeAvailable;
- (void)cancelBlur;
- (void)cancelSpatialAudioProfile;
- (void)captureViewTimerDidFire;
- (void)checkVolume;
- (void)cleanUpSpinner;
- (void)clearBoundingBox;
- (void)continueButtonTapped;
- (void)didReceiveCaptureVideo:(id)a3 colorImage:(id)a4 depthImage:(id)a5 faceObject:(id)a6;
- (void)didReceiveStateUpdateForSession:(id)a3 stateInfo:(id)a4;
- (void)forceBlur;
- (void)getBudsInEarString;
- (void)hideContinueButton;
- (void)hideEarPillsDots;
- (void)moveToStep:(int)a3;
- (void)pauseEnrollment;
- (void)playEarCaptureSoundWithCompletion:(id)a3;
- (void)prepareSpinner;
- (void)pulseEarBoundingBox;
- (void)resetVolume;
- (void)resumeEnrollment;
- (void)retrieveProfile;
- (void)sendTipKitSignal;
- (void)setCachedTransitionStates:(id)a3;
- (void)setDismissalHandler:(id)a3;
- (void)setDownloadAssetPath:(id)a3;
- (void)setPillsFilled:(BOOL)a3;
- (void)setupAudioVideo;
- (void)setupEarBoundingBox;
- (void)setupEarTutorialView;
- (void)setupEnrollController;
- (void)setupEnrollViewUI;
- (void)setupWelcomeContentView;
- (void)showBudsInEarPopUp:(id)a3;
- (void)showContinueButton;
- (void)showEarPillsDots;
- (void)showLandscapeAlert;
- (void)startCaptureViewTimer;
- (void)startEnrollment;
- (void)startFaceInFrameHandlerTimer;
- (void)startPostProcessSpinner;
- (void)startPostProcessTimer;
- (void)startTutorialResumeEnrollTimer;
- (void)startWelcomeSpinner;
- (void)stopCaptureViewTimer;
- (void)stopEnrollment;
- (void)stopFaceInFrameHandlerTimer;
- (void)stopPostProcessSpinner;
- (void)stopPostProcessTimer;
- (void)stopTimers;
- (void)stopTutorialResumeEnrollTimer;
- (void)stopWelcomeSpinner;
- (void)syncProfile;
- (void)translateEarBoundingBox:(CGRect)a3 previewLayerBoundingBox:(CGRect)a4;
- (void)triggerFaceInFrameHandlerTimeout;
- (void)triggerPostProcessTimeout;
- (void)updateBoundingBoxHiddenStatus;
- (void)updateCurrentTrackingEar:(id)a3 rightEarPoseStatus:(id)a4 earBoundingBox:(CGRect)a5 earStatus:(int)a6;
- (void)updateFaceTrackingStatus:(CGRect)a3;
- (void)userCancelEnrollment;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HPSSpatialProfileSingeStepEnrollmentController

- (HPSSpatialProfileSingeStepEnrollmentController)init
{
  if (!self) {
    return 0;
  }
  v23.receiver = self;
  v23.super_class = (Class)HPSSpatialProfileSingeStepEnrollmentController;
  v2 = [(HPSSpatialProfileSingeStepEnrollmentController *)&v23 init];
  uint64_t v3 = [MEMORY[0x1E4F50B70] sharedInstance];
  btManager = v2->_btManager;
  v2->_btManager = (BluetoothManager *)v3;

  v2->_bluetoothBecameAvailable = 0;
  v2->_inEarDetectDisabledPopUpShown = 0;
  v2->_isEarOccluded = 0;
  welcomeImageView = v2->_welcomeImageView;
  v2->_welcomeImageView = 0;

  pillContainerView = v2->_pillContainerView;
  v2->_pillContainerView = 0;

  soundHapticManager = v2->_soundHapticManager;
  v2->_soundHapticManager = 0;

  v2->_currentStep = 4;
  spinner = v2->_spinner;
  v2->_spinner = 0;

  v2->_enrollmentStarted = 0;
  v2->_enrollmentReady = 0;
  v2->_enrollmentPaused = 0;
  v2->_enrollmentCompleted = 0;
  v2->_enrollViewInitialized = 0;
  v2->_enrollmentFirstPhaseComplete = 0;
  v2->_earBoundingBoxDetected = 0;
  CGSize v9 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  v2->_currentEarBB.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  v2->_currentEarBB.size = v9;
  v2->_welcomeSpinnerOn = 0;
  v2->_postProcessSpinnerOn = 0;
  v2->_initialVolume = 0.0;
  v2->_volumeChanged = 0;
  v2->_currentProgress = 0.0;
  v2->_faceDetected = 0;
  v2->_faceStraightZeroAngleCaptured = 0;
  v2->_faceCaptured = 0;
  v2->_faceTooCloseErrorShowing = 0;
  v2->_faceBoundingBoxStatus = 0;
  v2->_completedPosesCount = 0;
  v2->_earCaptureSoundStep = 0;
  v2->_debugMode = 0;
  v2->_isLookingAtPhone = 0;
  v2->_faceInFrameCount = 0;
  frameContext = v2->_frameContext;
  v2->_frameContext = 0;

  frameDetector = v2->_frameDetector;
  v2->_frameDetector = 0;

  v2->_earOcclusionDetectTracker = 0;
  v2->_supressEarOcclusionWarning = 0;
  v2->_occlusionSupressTimeOut = 10;
  dispatch_queue_t v12 = dispatch_queue_create("com.apple.HeadphoneSettings.stepSerialQueue", 0);
  stepSerialQueue = v2->_stepSerialQueue;
  v2->_stepSerialQueue = (OS_dispatch_queue *)v12;

  dispatch_queue_t v14 = dispatch_queue_create("com.apple.HeadphoneSettings.visualDetectionQueue", 0);
  visualDetectionQueue = v2->_visualDetectionQueue;
  v2->_visualDetectionQueue = (OS_dispatch_queue *)v14;

  v2->_sessionState = 0;
  v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v16 addObserver:v2 selector:sel_cancelSpatialAudioProfile name:*MEMORY[0x1E4FB2640] object:0];

  v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v17 addObserver:v2 selector:sel_bluetoothDidBecomeAvailable name:*MEMORY[0x1E4F50AE8] object:0];

  uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
  cachedTransitionStates = v2->_cachedTransitionStates;
  v2->_cachedTransitionStates = (NSMutableArray *)v18;

  v20 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v22[0] = 0;
    _os_log_impl(&dword_1E4BFE000, v20, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Single step enrollment started.", (uint8_t *)v22, 2u);
  }

  return v2;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)HPSSpatialProfileSingeStepEnrollmentController;
  [(HPSSpatialProfileSingeStepEnrollmentController *)&v9 viewDidLoad];
  uint64_t v3 = [(HPSSpatialProfileSingeStepEnrollmentController *)self view];
  [v3 size];
  double v5 = v4;
  v6 = [(HPSSpatialProfileSingeStepEnrollmentController *)self view];
  [v6 size];
  double v8 = v7;

  if (v5 <= v8)
  {
    [(HPSSpatialProfileSingeStepEnrollmentController *)self setupEnrollController];
    [(HPSSpatialProfileSingeStepEnrollmentController *)self setupWelcomeContentView];
    [(HPSSpatialProfileSingeStepEnrollmentController *)self setupAudioVideo];
    [(HPSSpatialProfileSingeStepEnrollmentController *)self setupEarBoundingBox];
    [(HPSSpatialProfileSingeStepEnrollmentController *)self setupEarTutorialView];
    [(HPSSpatialProfileSingeStepEnrollmentController *)self moveToStep:4];
  }
  else
  {
    [(HPSSpatialProfileSingeStepEnrollmentController *)self showLandscapeAlert];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HPSSpatialProfileSingeStepEnrollmentController;
  [(HPSSpatialProfileSingeStepEnrollmentController *)&v3 viewDidAppear:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  double v4 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Enrollment Controller viewDidDisappear", v5, 2u);
  }

  [(HPSSpatialProfileSingeStepEnrollmentController *)self cancelSpatialAudioProfile];
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
  v91[8] = *MEMORY[0x1E4F143B8];
  if (!self->_enrollmentSession)
  {
    objc_super v3 = (HRTFEnrollmentSession *)objc_alloc_init(MEMORY[0x1E4F655B0]);
    enrollmentSession = self->_enrollmentSession;
    self->_enrollmentSession = v3;

    [(HRTFEnrollmentSession *)self->_enrollmentSession setDelegate:self];
  }
  v87 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_userCancelEnrollment];
  double v5 = [(HPSSpatialProfileSingeStepEnrollmentController *)self navigationItem];
  [v5 setLeftBarButtonItem:v87];

  v6 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  double v7 = [(HPSSpatialProfileSingeStepEnrollmentController *)self view];
  [v7 setBackgroundColor:v6];

  id v8 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  objc_super v9 = (UIView *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  enrollContentView = self->_enrollContentView;
  self->_enrollContentView = v9;

  [(UIView *)self->_enrollContentView setTranslatesAutoresizingMaskIntoConstraints:0];
  id location = 0;
  objc_initWeak(&location, self);
  v11 = [_TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer alloc];
  v88[0] = MEMORY[0x1E4F143A8];
  v88[1] = 3221225472;
  v88[2] = __71__HPSSpatialProfileSingeStepEnrollmentController_setupEnrollController__block_invoke;
  v88[3] = &unk_1E6EA87C0;
  objc_copyWeak(&v89, &location);
  dispatch_queue_t v12 = [(HPSSpatialProfileSingleStepBottomContainer *)v11 initWithBudsInEarString:v88];
  bottomContainerView = self->_bottomContainerView;
  self->_bottomContainerView = v12;

  [(HPSSpatialProfileSingleStepBottomContainer *)self->_bottomContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  dispatch_queue_t v14 = [(HPSSpatialProfileSingleStepBottomContainer *)self->_bottomContainerView infoView];
  v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"SPATIAL_AUDIO_PROFILE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v14 setTitle:v16];

  v17 = [(HPSSpatialProfileSingleStepBottomContainer *)self->_bottomContainerView infoView];
  uint64_t v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v19 = [v18 localizedStringForKey:@"SPATIAL_AUDIO_PROFILE_DETAIL" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v17 setDetailText:v19];

  v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v21 = [v20 localizedStringForKey:@"WELCOME_DETAIL" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  v22 = [(HPSSpatialProfileSingleStepBottomContainer *)self->_bottomContainerView learnMoreView];
  [v22 setText:v21];

  objc_super v23 = self->_bottomContainerView;
  v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v25 = [v24 localizedStringForKey:@"CONTINUE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [(HPSSpatialProfileSingleStepBottomContainer *)v23 updateContinueButtonTitleWithTitle:v25];

  [(HPSSpatialProfileSingleStepBottomContainer *)self->_bottomContainerView updateContinueButtonActionWithTarget:self selector:sel_continueButtonTapped];
  if (self->_debugMode)
  {
    v26 = [(UIView *)self->_enrollContentView layer];
    [v26 setBorderWidth:1.0];

    id v27 = [MEMORY[0x1E4FB1618] systemRedColor];
    uint64_t v28 = [v27 CGColor];
    v29 = [(UIView *)self->_enrollContentView layer];
    [v29 setBorderColor:v28];

    v30 = [(HPSSpatialProfileSingleStepBottomContainer *)self->_bottomContainerView layer];
    [v30 setBorderWidth:1.0];

    id v31 = [MEMORY[0x1E4FB1618] systemBlueColor];
    uint64_t v32 = [v31 CGColor];
    v33 = [(HPSSpatialProfileSingleStepBottomContainer *)self->_bottomContainerView layer];
    [v33 setBorderColor:v32];

    v34 = [(HPSSpatialProfileSingleStepBottomContainer *)self->_bottomContainerView scrollView];
    v35 = [v34 layer];
    [v35 setBorderWidth:1.0];

    id v36 = [MEMORY[0x1E4FB1618] systemYellowColor];
    uint64_t v37 = [v36 CGColor];
    v38 = [(HPSSpatialProfileSingleStepBottomContainer *)self->_bottomContainerView scrollView];
    v39 = [v38 layer];
    [v39 setBorderColor:v37];

    v40 = [(HPSSpatialProfileSingleStepBottomContainer *)self->_bottomContainerView infoView];
    v41 = [v40 layer];
    [v41 setBorderWidth:2.0];

    id v42 = [MEMORY[0x1E4FB1618] systemGreenColor];
    uint64_t v43 = [v42 CGColor];
    v44 = [(HPSSpatialProfileSingleStepBottomContainer *)self->_bottomContainerView layer];
    [v44 setBorderColor:v43];

    v45 = [(HPSSpatialProfileSingleStepBottomContainer *)self->_bottomContainerView buttonTrayEffectView];
    v46 = [v45 layer];
    [v46 setBorderWidth:2.0];

    id v47 = [MEMORY[0x1E4FB1618] systemGrayColor];
    uint64_t v48 = [v47 CGColor];
    v49 = [(HPSSpatialProfileSingleStepBottomContainer *)self->_bottomContainerView buttonTrayEffectView];
    v50 = [v49 layer];
    [v50 setBorderColor:v48];
  }
  v51 = [(HPSSpatialProfileSingeStepEnrollmentController *)self view];
  [v51 addSubview:self->_enrollContentView];

  v52 = [(HPSSpatialProfileSingeStepEnrollmentController *)self view];
  [v52 addSubview:self->_bottomContainerView];

  v64 = (void *)MEMORY[0x1E4F28DC8];
  v84 = [(UIView *)self->_enrollContentView topAnchor];
  v86 = [(HPSSpatialProfileSingeStepEnrollmentController *)self view];
  v85 = [v86 safeAreaLayoutGuide];
  v83 = [v85 topAnchor];
  v82 = [v84 constraintEqualToAnchor:v83];
  v91[0] = v82;
  v80 = [(UIView *)self->_enrollContentView heightAnchor];
  v81 = [(HPSSpatialProfileSingeStepEnrollmentController *)self view];
  [v81 frame];
  v79 = [v80 constraintEqualToConstant:v53];
  v91[1] = v79;
  v77 = [(UIView *)self->_enrollContentView leadingAnchor];
  v78 = [(HPSSpatialProfileSingeStepEnrollmentController *)self view];
  v76 = [v78 leadingAnchor];
  v75 = [v77 constraintEqualToAnchor:v76];
  v91[2] = v75;
  v73 = [(UIView *)self->_enrollContentView trailingAnchor];
  v74 = [(HPSSpatialProfileSingeStepEnrollmentController *)self view];
  v72 = [v74 trailingAnchor];
  v71 = [v73 constraintEqualToAnchor:v72];
  v91[3] = v71;
  v70 = [(HPSSpatialProfileSingleStepBottomContainer *)self->_bottomContainerView topAnchor];
  v69 = [(UIView *)self->_enrollContentView bottomAnchor];
  v68 = [v70 constraintEqualToAnchor:v69];
  v91[4] = v68;
  v66 = [(HPSSpatialProfileSingleStepBottomContainer *)self->_bottomContainerView leadingAnchor];
  v67 = [(HPSSpatialProfileSingeStepEnrollmentController *)self view];
  v65 = [v67 leadingAnchor];
  v54 = [v66 constraintEqualToAnchor:v65];
  v91[5] = v54;
  v55 = [(HPSSpatialProfileSingleStepBottomContainer *)self->_bottomContainerView trailingAnchor];
  v56 = [(HPSSpatialProfileSingeStepEnrollmentController *)self view];
  v57 = [v56 trailingAnchor];
  v58 = [v55 constraintEqualToAnchor:v57];
  v91[6] = v58;
  v59 = [(HPSSpatialProfileSingleStepBottomContainer *)self->_bottomContainerView bottomAnchor];
  v60 = [(HPSSpatialProfileSingeStepEnrollmentController *)self view];
  v61 = [v60 bottomAnchor];
  v62 = [v59 constraintEqualToAnchor:v61];
  v91[7] = v62;
  v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:8];
  [v64 activateConstraints:v63];

  objc_destroyWeak(&v89);
  objc_destroyWeak(&location);
}

id __71__HPSSpatialProfileSingeStepEnrollmentController_setupEnrollController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained getBudsInEarString];

  return v2;
}

- (void)setupWelcomeContentView
{
  v34[8] = *MEMORY[0x1E4F143B8];
  objc_super v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  welcomeContentView = self->_welcomeContentView;
  self->_welcomeContentView = v3;

  [(UIView *)self->_welcomeContentView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_enrollContentView addSubview:self->_welcomeContentView];
  double v5 = (void *)MEMORY[0x1E4FB1818];
  v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v33 = [v5 imageNamed:@"SpatialProfileIcon" inBundle:v6 compatibleWithTraitCollection:0];

  double v7 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v33];
  welcomeImageView = self->_welcomeImageView;
  self->_welcomeImageView = v7;

  [(UIImageView *)self->_welcomeImageView setContentMode:1];
  [(UIImageView *)self->_welcomeImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_welcomeContentView addSubview:self->_welcomeImageView];
  objc_super v23 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v32 = [(UIView *)self->_welcomeContentView leadingAnchor];
  id v31 = [(UIView *)self->_enrollContentView leadingAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v34[0] = v30;
  v29 = [(UIView *)self->_welcomeContentView trailingAnchor];
  uint64_t v28 = [(UIView *)self->_enrollContentView trailingAnchor];
  id v27 = [v29 constraintEqualToAnchor:v28];
  v34[1] = v27;
  v26 = [(UIView *)self->_welcomeContentView topAnchor];
  v25 = [(UIView *)self->_enrollContentView topAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v34[2] = v24;
  v22 = [(UIView *)self->_welcomeContentView bottomAnchor];
  v21 = [(UIView *)self->_enrollContentView bottomAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v34[3] = v20;
  v19 = [(UIImageView *)self->_welcomeImageView widthAnchor];
  objc_super v9 = [v19 constraintEqualToConstant:240.0];
  v34[4] = v9;
  v10 = [(UIImageView *)self->_welcomeImageView heightAnchor];
  v11 = [v10 constraintEqualToConstant:240.0];
  v34[5] = v11;
  dispatch_queue_t v12 = [(UIImageView *)self->_welcomeImageView centerXAnchor];
  v13 = [(UIView *)self->_welcomeContentView centerXAnchor];
  dispatch_queue_t v14 = [v12 constraintEqualToAnchor:v13];
  v34[6] = v14;
  v15 = [(UIImageView *)self->_welcomeImageView centerYAnchor];
  v16 = [(UIView *)self->_welcomeContentView centerYAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  v34[7] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:8];
  [v23 activateConstraints:v18];
}

- (void)setupAudioVideo
{
  objc_super v3 = objc_alloc_init(HPSSpatialProfileSingleStepSoundHapticManager);
  soundHapticManager = self->_soundHapticManager;
  self->_soundHapticManager = v3;

  [(HPSSpatialProfileSingleStepSoundHapticManager *)self->_soundHapticManager start];
  double v5 = objc_alloc_init(HPSSpatialProfileVideoCaptureSession);
  videoCaptureSession = self->videoCaptureSession;
  self->videoCaptureSession = v5;

  [(HPSSpatialProfileSingeStepEnrollmentController *)self checkVolume];
}

- (void)checkVolume
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1E4BFE000, v0, v1, "Spatial Profile: Unable to Check Volume", v2, v3, v4, v5, v6);
}

- (void)resetVolume
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_volumeChanged)
  {
    uint64_t v3 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      double initialVolume = self->_initialVolume;
      int v7 = 134217984;
      double v8 = initialVolume;
      _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Volume Changed, Reset to Initial Volume: %f", (uint8_t *)&v7, 0xCu);
    }

    uint64_t v5 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
    *(float *)&double v6 = self->_initialVolume;
    [v5 setVolumeTo:@"Audio/Video" forCategory:v6];
  }
}

- (void)setupEnrollViewUI
{
  v52[12] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Setting up Enroll View UI", buf, 2u);
  }

  [(HPSSpatialProfileSingleStepPearlEnrollView *)self->_enrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(BKUIPearlEnrollView *)self->_enrollView setDelegate:self];
  [(BKUIPearlEnrollView *)self->_enrollView preEnrollActivate];
  uint64_t v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(BKUIPearlEnrollView *)self->_enrollView setBackgroundColor:v4];

  uint64_t v5 = [HPSSpatialProfileSingleStepPillContainerView alloc];
  double v6 = -[HPSSpatialProfileSingleStepPillContainerView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  pillContainerView = self->_pillContainerView;
  self->_pillContainerView = v6;

  [(HPSSpatialProfileSingleStepPillContainerView *)self->_pillContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HPSSpatialProfileSingleStepPillContainerView *)self->_pillContainerView setAlpha:0.0];
  double v8 = [(HPSSpatialProfileSingeStepEnrollmentController *)self view];
  [v8 frame];
  double v10 = v9 / 390.0;

  BOOL v11 = v10 < 1.0;
  if (v10 >= 1.0) {
    double v12 = 5.0;
  }
  else {
    double v12 = 15.0;
  }
  if (v11) {
    double v13 = 85.0;
  }
  else {
    double v13 = 100.0;
  }
  dispatch_queue_t v14 = -[HPSSpatialProfileEarDotsMovieView initWithFrame:]([HPSSpatialProfileEarDotsMovieView alloc], "initWithFrame:", 0.0, 0.0, 345.0, v13);
  earDotsMovieView = self->_earDotsMovieView;
  self->_earDotsMovieView = v14;

  [(HPSSpatialProfileEarDotsMovieView *)self->_earDotsMovieView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HPSSpatialProfileEarDotsMovieView *)self->_earDotsMovieView setAlpha:0.0];
  [(UIView *)self->_enrollContentView addSubview:self->_enrollView];
  [(UIView *)self->_enrollContentView addSubview:self->_pillContainerView];
  [(UIView *)self->_enrollContentView addSubview:self->_earDotsMovieView];
  uint64_t v37 = (void *)MEMORY[0x1E4F28DC8];
  v50 = [(HPSSpatialProfileSingleStepPearlEnrollView *)self->_enrollView leadingAnchor];
  v49 = [(UIView *)self->_enrollContentView leadingAnchor];
  uint64_t v48 = [v50 constraintEqualToAnchor:v49];
  v52[0] = v48;
  id v47 = [(HPSSpatialProfileSingleStepPearlEnrollView *)self->_enrollView trailingAnchor];
  v46 = [(UIView *)self->_enrollContentView trailingAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v52[1] = v45;
  v44 = [(HPSSpatialProfileSingleStepPearlEnrollView *)self->_enrollView topAnchor];
  uint64_t v43 = [(UIView *)self->_enrollContentView topAnchor];
  id v42 = [v44 constraintEqualToAnchor:v43];
  v52[2] = v42;
  v41 = [(HPSSpatialProfileSingleStepPearlEnrollView *)self->_enrollView bottomAnchor];
  v40 = [(UIView *)self->_enrollContentView bottomAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v52[3] = v39;
  v38 = [(HPSSpatialProfileEarDotsMovieView *)self->_earDotsMovieView widthAnchor];
  id v36 = [v38 constraintEqualToConstant:345.0];
  v52[4] = v36;
  v35 = [(HPSSpatialProfileEarDotsMovieView *)self->_earDotsMovieView heightAnchor];
  v34 = [v35 constraintEqualToConstant:v13];
  v52[5] = v34;
  v33 = [(HPSSpatialProfileEarDotsMovieView *)self->_earDotsMovieView centerXAnchor];
  uint64_t v32 = [(UIView *)self->_enrollContentView centerXAnchor];
  id v31 = [v33 constraintEqualToAnchor:v32];
  v52[6] = v31;
  v30 = [(HPSSpatialProfileEarDotsMovieView *)self->_earDotsMovieView bottomAnchor];
  v29 = [(UIView *)self->_enrollContentView bottomAnchor];
  uint64_t v28 = [v30 constraintEqualToAnchor:v29];
  v52[7] = v28;
  id v27 = [(HPSSpatialProfileSingleStepPillContainerView *)self->_pillContainerView widthAnchor];
  v26 = [v27 constraintEqualToConstant:345.0];
  v52[8] = v26;
  v25 = [(HPSSpatialProfileSingleStepPillContainerView *)self->_pillContainerView heightAnchor];
  v16 = [v25 constraintEqualToConstant:100.0];
  v52[9] = v16;
  v17 = [(HPSSpatialProfileSingleStepPillContainerView *)self->_pillContainerView centerXAnchor];
  uint64_t v18 = [(UIView *)self->_enrollContentView centerXAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  v52[10] = v19;
  v20 = [(HPSSpatialProfileSingleStepPillContainerView *)self->_pillContainerView bottomAnchor];
  v21 = [(UIView *)self->_enrollContentView bottomAnchor];
  v22 = [v20 constraintEqualToAnchor:v21 constant:v12];
  v52[11] = v22;
  objc_super v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:12];
  [v37 activateConstraints:v23];

  [(BKUIPearlEnrollView *)self->_enrollView setState:0 completion:&__block_literal_global_6];
  self->_enrollViewState = 0;
  if (self->_currentStep == 4) {
    [(HPSSpatialProfileSingleStepPearlEnrollView *)self->_enrollView setHidden:1];
  }
  v24 = [(HPSSpatialProfileSingeStepEnrollmentController *)self view];
  [v24 setNeedsLayout];
}

- (void)setupEarTutorialView
{
  v33[8] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Setting up Ear Tutorial", buf, 2u);
  }

  uint64_t v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
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
  id v31 = [(UIView *)self->_tutorialContentView leadingAnchor];
  v30 = [(UIView *)self->_enrollContentView leadingAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v33[0] = v29;
  uint64_t v28 = [(UIView *)self->_tutorialContentView trailingAnchor];
  id v27 = [(UIView *)self->_enrollContentView trailingAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v33[1] = v26;
  v25 = [(UIView *)self->_tutorialContentView topAnchor];
  v24 = [(UIView *)self->_enrollContentView topAnchor];
  objc_super v23 = [v25 constraintEqualToAnchor:v24];
  v33[2] = v23;
  v21 = [(UIView *)self->_tutorialContentView bottomAnchor];
  v20 = [(UIView *)self->_enrollContentView bottomAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v33[3] = v19;
  uint64_t v18 = [(HPSSpatialProfileEarTutorialView *)self->_earTutorialView widthAnchor];
  v17 = [v18 constraintEqualToConstant:240.0];
  v33[4] = v17;
  v16 = [(HPSSpatialProfileEarTutorialView *)self->_earTutorialView heightAnchor];
  double v8 = [v16 constraintEqualToConstant:106.666664];
  v33[5] = v8;
  double v9 = [(HPSSpatialProfileEarTutorialView *)self->_earTutorialView centerXAnchor];
  double v10 = [(UIView *)self->_tutorialContentView centerXAnchor];
  BOOL v11 = [v9 constraintEqualToAnchor:v10];
  v33[6] = v11;
  double v12 = [(HPSSpatialProfileEarTutorialView *)self->_earTutorialView centerYAnchor];
  double v13 = [(UIView *)self->_tutorialContentView centerYAnchor];
  dispatch_queue_t v14 = [v12 constraintEqualToAnchor:v13];
  v33[7] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:8];
  [v22 activateConstraints:v15];

  [(UIView *)self->_tutorialContentView setHidden:1];
}

- (void)startEnrollment
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1E4BFE000, v0, v1, "Spatial Profile: Cannot Start Enrollment, Already Started", v2, v3, v4, v5, v6);
}

void __65__HPSSpatialProfileSingeStepEnrollmentController_startEnrollment__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    __65__HPSSpatialProfileSingeStepEnrollmentController_startEnrollment__block_invoke_cold_1();
  }
  uint64_t v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Enrollment Started", v3, 2u);
  }
}

- (void)stopEnrollment
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1E4BFE000, v0, v1, "Spatial Profile: Cannot Stop Enrollment, Already Stopped", v2, v3, v4, v5, v6);
}

void __64__HPSSpatialProfileSingeStepEnrollmentController_stopEnrollment__block_invoke()
{
  v0 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1E4BFE000, v0, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Enrollment Stopped", v1, 2u);
  }
}

- (void)pauseEnrollment
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1E4BFE000, v0, v1, "Spatial Profile: Cannot Pause Enrollment, Already Paused", v2, v3, v4, v5, v6);
}

- (void)resumeEnrollment
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1E4BFE000, v0, v1, "Spatial Profile: Cannot Resume Enrollment, NOT Paused", v2, v3, v4, v5, v6);
}

- (void)moveToStep:(int)a3
{
  stepSerialQueue = self->_stepSerialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke;
  v4[3] = &unk_1E6EA88F8;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(stepSerialQueue, v4);
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke(uint64_t a1)
{
  uint64_t v2 = dispatch_group_create();
  dispatch_group_t v3 = dispatch_group_create();
  NSLog(&cfstr_SpatialProfile_17.isa);
  dispatch_group_enter(v2);
  id location = 0;
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(_DWORD *)(v4 + 1132);
  *(_DWORD *)(v4 + 1132) = *(_DWORD *)(a1 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2;
  block[3] = &unk_1E6EA82F0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
  uint64_t v6 = *(void *)(a1 + 32);
  switch(*(_DWORD *)(v6 + 1132))
  {
    case 0:
      v22 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v22, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> CouldntScanEar", buf, 2u);
      }

      [*(id *)(*(void *)(a1 + 32) + 1168) updateStatus:0 EnrollmentResult:@"Failed"];
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_93;
      v58[3] = &unk_1E6EA8808;
      objc_super v23 = v3;
      uint64_t v24 = *(void *)(a1 + 32);
      v59 = v23;
      uint64_t v60 = v24;
      int v61 = v5;
      v25 = MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v58);

      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_94;
      v56[3] = &unk_1E6EA82F0;
      v57 = v2;
      dispatch_group_notify(v23, v25, v56);

      BOOL v11 = v59;
      goto LABEL_34;
    case 1:
    case 2:
      [*(id *)(v6 + 1168) incrementRightEarOcclusionCount];
      [*(id *)(*(void *)(a1 + 32) + 1168) incrementLeftEarOcclusionCount];
      int v7 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v7, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> HairCoveringEar", buf, 2u);
      }

      [*(id *)(*(void *)(a1 + 32) + 1168) updateStatus:0 EnrollmentResult:@"Failed"];
      [*(id *)(a1 + 32) forceBlur];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_95;
      v52[3] = &unk_1E6EA8808;
      double v8 = v3;
      uint64_t v9 = *(void *)(a1 + 32);
      double v53 = v8;
      uint64_t v54 = v9;
      int v55 = v5;
      double v10 = MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v52);

      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_96;
      v50[3] = &unk_1E6EA82F0;
      v51 = v2;
      dispatch_group_notify(v8, v10, v50);

      BOOL v11 = v53;
      goto LABEL_34;
    case 3:
      v26 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v26, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> GeneralFailure", buf, 2u);
      }

      [*(id *)(*(void *)(a1 + 32) + 1168) updateStatus:0 EnrollmentResult:@"Failed"];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_97;
      v47[3] = &unk_1E6EA8428;
      id v27 = v3;
      uint64_t v28 = *(void *)(a1 + 32);
      uint64_t v48 = v27;
      uint64_t v49 = v28;
      v29 = MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v47);

      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_3_108;
      v45[3] = &unk_1E6EA82F0;
      v46 = v2;
      dispatch_group_notify(v27, v29, v45);

      BOOL v11 = v48;
      goto LABEL_34;
    case 4:
      v30 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v30, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> Welcome", buf, 2u);
      }

      v88[0] = MEMORY[0x1E4F143A8];
      v88[1] = 3221225472;
      v88[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_66;
      v88[3] = &unk_1E6EA8808;
      void v88[4] = *(void *)(a1 + 32);
      int v90 = v5;
      id v89 = v2;
      id v31 = (void *)MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v88);

      BOOL v11 = v89;
      goto LABEL_34;
    case 5:
      double v12 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v12, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> FrontView", buf, 2u);
      }

      uint64_t v13 = *(void *)(a1 + 32);
      if (!*(void *)(v13 + 1168))
      {
        dispatch_queue_t v14 = objc_alloc_init(HPSSpatialProfileAnalytics);
        uint64_t v15 = *(void *)(a1 + 32);
        v16 = *(void **)(v15 + 1168);
        *(void *)(v15 + 1168) = v14;

        uint64_t v13 = *(void *)(a1 + 32);
      }
      v84[0] = MEMORY[0x1E4F143A8];
      v84[1] = 3221225472;
      v84[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_69;
      v84[3] = &unk_1E6EA8830;
      v84[4] = v13;
      int v87 = v5;
      v85 = v3;
      v86 = v2;
      v17 = (void *)MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v84);

      BOOL v11 = v85;
      goto LABEL_34;
    case 6:
      uint64_t v32 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v32, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> FrontViewCapturePositionFace", buf, 2u);
      }

      [*(id *)(*(void *)(a1 + 32) + 1168) initFrameRateDetection];
      [*(id *)(*(void *)(a1 + 32) + 1168) updateFaceEnrollStart];
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_71;
      v79[3] = &unk_1E6EA8830;
      v33 = v3;
      uint64_t v34 = *(void *)(a1 + 32);
      v80 = v33;
      uint64_t v81 = v34;
      int v83 = v5;
      v82 = v2;
      v35 = (void *)MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v79);

      BOOL v11 = v80;
      goto LABEL_34;
    case 7:
      id v36 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v36, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> FrontViewCaptureMoveHead", buf, 2u);
      }

      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_74;
      v73[3] = &unk_1E6EA8880;
      v74 = v3;
      objc_copyWeak(&v77, &location);
      int v78 = v5;
      uint64_t v75 = *(void *)(a1 + 32);
      v76 = v2;
      uint64_t v37 = (void *)MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v73);

      objc_destroyWeak(&v77);
      BOOL v11 = v74;
      goto LABEL_34;
    case 8:
      *(unsigned char *)(v6 + 1226) = 1;
      v38 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v38, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> FrontViewCaptureCompleted", buf, 2u);
      }

      [*(id *)(*(void *)(a1 + 32) + 1168) updateFaceEnrollDuration];
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_78;
      v67[3] = &unk_1E6EA88D0;
      v39 = v3;
      uint64_t v40 = *(void *)(a1 + 32);
      v68 = v39;
      uint64_t v69 = v40;
      int v72 = v5;
      objc_copyWeak(&v71, &location);
      v70 = v2;
      v41 = (void *)MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v67);

      objc_destroyWeak(&v71);
      BOOL v11 = v68;
      goto LABEL_34;
    case 0xA:
      uint64_t v43 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v43, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> RetrieveProfile", buf, 2u);
      }

      [*(id *)(a1 + 32) retrieveProfile];
      goto LABEL_41;
    case 0xB:
      uint64_t v18 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v18, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> SyncProfile", buf, 2u);
      }

      [*(id *)(a1 + 32) syncProfile];
      goto LABEL_41;
    case 0xC:
      [*(id *)(v6 + 1168) updateStatus:1 EnrollmentResult:@"Success"];
      v19 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v19, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> Completed", buf, 2u);
      }

      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_85;
      v64[3] = &unk_1E6EA8808;
      v64[4] = *(void *)(a1 + 32);
      v20 = v3;
      v65 = v20;
      int v66 = v5;
      v21 = MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v64);

      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_5_89;
      v62[3] = &unk_1E6EA82F0;
      v63 = v2;
      dispatch_group_notify(v20, v21, v62);

      BOOL v11 = v65;
LABEL_34:

      break;
    default:
      id v42 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_cold_1();
      }

LABEL_41:
      dispatch_group_leave(v2);
      break;
  }
  dispatch_time_t v44 = dispatch_time(0, 3000000000);
  dispatch_group_wait(v2, v44);
  objc_destroyWeak(&location);
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 1392) scrollView];
  objc_msgSend(v1, "setContentOffset:animated:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_66(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1392) moveToEnrollmentFromStep:*(unsigned int *)(a1 + 48) toStep:4];
  if (!+[HPSSpatialProfileManager isProxCardShowed]) {
    +[HPSSpatialProfileManager setProxCardShowed:1];
  }
  [*(id *)(a1 + 32) startEnrollment];
  [*(id *)(a1 + 32) showContinueButton];
  [*(id *)(*(void *)(a1 + 32) + 1384) setAlpha:0.0];
  uint64_t v2 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v2);
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_69(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1040) setHidden:0];
  [*(id *)(*(void *)(a1 + 32) + 1040) setFaceCaptured:0];
  uint64_t v2 = *(void **)(a1 + 32);
  dispatch_group_t v3 = (void *)v2[124];
  uint64_t v4 = (void *)v2[174];
  uint64_t v5 = *(unsigned int *)(a1 + 56);
  id v15 = (id)v2[130];
  v13[4] = v2;
  id v14 = v3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_70;
  v13[3] = &unk_1E6EA82F0;
  id v6 = v3;
  id v7 = v15;
  [v4 moveToEnrollmentFromStep:v5 toStep:5 animateInAlongSide:&v15 animateOutAlongSide:&v14 animatedCompletion:v13];
  id v8 = v15;

  id v9 = v14;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_3;
  v11[3] = &unk_1E6EA82F0;
  double v10 = *(NSObject **)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  dispatch_group_notify(v10, MEMORY[0x1E4F14428], v11);
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_70(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 984) removeFromSuperview];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1040) tutorialMovieView];
  [v2 play];
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_3(uint64_t a1)
{
  id v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_group_t v3 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> FrontView Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_71(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id v2 = [*(id *)(*(void *)(a1 + 40) + 1040) tutorialMovieView];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(v3 + 1040);
  uint64_t v5 = *(void **)(v3 + 1392);
  uint64_t v6 = *(unsigned int *)(a1 + 56);
  id v23 = v2;
  id v24 = v4;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_72;
  v21[3] = &unk_1E6EA8428;
  v21[4] = v3;
  id v22 = *(id *)(a1 + 32);
  id v7 = v4;
  [v5 moveToEnrollmentFromStep:v6 toStep:6 animateInAlongSide:&v24 animateOutAlongSide:&v23 animatedCompletion:v21];
  id v8 = v24;

  id v9 = v23;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v10 = *(void *)(a1 + 40);
  BOOL v11 = *(void **)(v10 + 1032);
  uint64_t v12 = *(unsigned int *)(v10 + 1132);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_4;
  v19[3] = &unk_1E6EA82F0;
  id v20 = *(id *)(a1 + 32);
  [v11 triggerSoundHapticForEnrollmentState:v12 completion:v19];
  [*(id *)(a1 + 40) resumeEnrollment];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  uint64_t v13 = *(NSObject **)(a1 + 32);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_5;
  v17 = &unk_1E6EA82F0;
  id v18 = *(id *)(a1 + 48);
  dispatch_group_notify(v13, MEMORY[0x1E4F14428], &v14);
  objc_msgSend(*(id *)(a1 + 40), "startFaceInFrameHandlerTimer", v14, v15, v16, v17);
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_72(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 1208) = 5;
  [*(id *)(a1 + 32) startCaptureViewTimer];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1040) pillContainer];
  [v2 setHidden:1];

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 1040);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_3_73;
  v5[3] = &unk_1E6EA8428;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 40);
  [v4 setState:3 completion:v5];
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_3_73(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 1408) = 3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_4(uint64_t a1)
{
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_5(uint64_t a1)
{
  id v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> FrontViewCapturePositionFace Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_74(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_75;
  aBlock[3] = &unk_1E6EA8858;
  objc_copyWeak(&v17, (id *)(a1 + 56));
  int v18 = *(_DWORD *)(a1 + 64);
  int8x16_t v10 = *(int8x16_t *)(a1 + 32);
  id v2 = (id)v10.i64[0];
  int8x16_t v16 = vextq_s8(v10, v10, 8uLL);
  uint64_t v3 = _Block_copy(aBlock);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(a1 + 40);
  if (*(_DWORD *)(v5 + 1408) == 5) {
    (*((void (**)(void *))v3 + 2))(v3);
  }
  else {
    [*(id *)(v5 + 1040) setState:5 completion:v3];
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1168), "initFrameRateDetection", *(_OWORD *)&v10);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(v6 + 1032);
  uint64_t v8 = *(unsigned int *)(v6 + 1132);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_3_76;
  v13[3] = &unk_1E6EA82F0;
  id v14 = *(id *)(a1 + 32);
  [v7 triggerSoundHapticForEnrollmentState:v8 completion:v13];
  id v9 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_4_77;
  block[3] = &unk_1E6EA82F0;
  id v12 = *(id *)(a1 + 48);
  dispatch_group_notify(v9, MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v17);
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_75(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained showEarPillsDots];
  [WeakRetained[174] moveToEnrollmentFromStep:*(unsigned int *)(a1 + 56) toStep:7];
  [*(id *)(*(void *)(a1 + 32) + 976) bringSubviewToFront:*(void *)(*(void *)(a1 + 32) + 1072)];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1072), "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [*(id *)(*(void *)(a1 + 32) + 1072) setHidden:0];
  *(_DWORD *)(*(void *)(a1 + 32) + 1408) = 5;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_3_76(uint64_t a1)
{
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_4_77(uint64_t a1)
{
  id v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> FrontViewCaptureMoveHead Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_78(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  [*(id *)(*(void *)(a1 + 40) + 1040) setFaceCaptured:1];
  [*(id *)(a1 + 40) stopCaptureViewTimer];
  [*(id *)(a1 + 40) startPostProcessTimer];
  [*(id *)(a1 + 40) forceBlur];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  [*(id *)(*(void *)(a1 + 40) + 1392) moveToEnrollmentFromStep:*(unsigned int *)(a1 + 64) toStep:8];
  id v2 = *(void **)(*(void *)(a1 + 40) + 1040);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_79;
  v11[3] = &unk_1E6EA88A8;
  objc_copyWeak(&v13, (id *)(a1 + 56));
  int8x16_t v6 = *(int8x16_t *)(a1 + 32);
  id v3 = (id)v6.i64[0];
  int8x16_t v12 = vextq_s8(v6, v6, 8uLL);
  [v2 setState:6 completion:v11];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v4 = *(void **)(*(void *)(a1 + 40) + 1032);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_3_80;
  v9[3] = &unk_1E6EA82F0;
  id v10 = *(id *)(a1 + 32);
  [v4 triggerSoundHapticForEarCaptureState:1 completion:v9];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  uint64_t v5 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_4_81;
  block[3] = &unk_1E6EA82F0;
  id v8 = *(id *)(a1 + 48);
  dispatch_group_notify(v5, MEMORY[0x1E4F14428], block);
  [*(id *)(a1 + 40) stopFaceInFrameHandlerTimer];
  [*(id *)(a1 + 40) sendTipKitSignal];

  objc_destroyWeak(&v13);
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_79(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained[130] pillContainer];
  [v2 setHidden:0];

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1072), "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [*(id *)(*(void *)(a1 + 32) + 1072) setHidden:1];
  [*(id *)(*(void *)(a1 + 32) + 1072) setAlpha:0.0];
  *(_DWORD *)(*(void *)(a1 + 32) + 1408) = 6;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_3_80(uint64_t a1)
{
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_4_81(uint64_t a1)
{
  id v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> FrontViewCaptureCompleted Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_85(uint64_t a1)
{
  [*(id *)(a1 + 32) stopTimers];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 1392);
  uint64_t v4 = *(unsigned int *)(a1 + 48);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_86;
  v17[3] = &unk_1E6EA82F0;
  v17[4] = v2;
  [v3 moveToEnrollmentFromStep:v4 toStep:12 completionAction:v17];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  int8x16_t v6 = *(void **)(v5 + 1040);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_3_87;
  v15[3] = &unk_1E6EA8428;
  v15[4] = v5;
  id v16 = *(id *)(a1 + 40);
  [v6 setState:10 completion:v15];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 1032);
  uint64_t v9 = *(unsigned int *)(v7 + 1132);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  int8x16_t v12 = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_4_88;
  id v13 = &unk_1E6EA82F0;
  id v14 = *(id *)(a1 + 40);
  [v8 triggerSoundHapticForEnrollmentState:v9 completion:&v10];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1384), "setAlpha:", 0.0, v10, v11, v12, v13);
  [*(id *)(a1 + 32) stopEnrollment];
  [*(id *)(a1 + 32) showContinueButton];
  [*(id *)(*(void *)(a1 + 32) + 1392) updateContinueButtonActionWithTarget:*(void *)(a1 + 32) selector:sel_cancelSpatialAudioProfile];
  *(unsigned char *)(*(void *)(a1 + 32) + 1193) = 1;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_86(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[1113])
  {
    [v2 stopPostProcessSpinner];
    uint64_t v2 = *(unsigned char **)(a1 + 32);
  }

  return [v2 stopPostProcessTimer];
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_3_87(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 1408) = 10;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_4_88(uint64_t a1)
{
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_5_89(uint64_t a1)
{
  uint64_t v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> Completed Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_93(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  [*(id *)(*(void *)(a1 + 40) + 1392) moveToEnrollmentFromStep:*(unsigned int *)(a1 + 48) toStep:0];
  [*(id *)(a1 + 40) showContinueButton];
  [*(id *)(*(void *)(a1 + 40) + 1392) updateContinueButtonActionWithTarget:*(void *)(a1 + 40) selector:sel_cancelSpatialAudioProfile];
  uint64_t v2 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v2);
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_94(uint64_t a1)
{
  uint64_t v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> CouldntScanEar Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_95(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  [*(id *)(*(void *)(a1 + 40) + 1392) moveToEnrollmentFromStep:*(unsigned int *)(a1 + 48) toStep:2];
  uint64_t v2 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v2);
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_96(uint64_t a1)
{
  uint64_t v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> HairCoveringEar Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_97(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 1392) infoView];
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"GENERAL_FAILURE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v2 setTitle:v4];

  uint64_t v5 = [*(id *)(*(void *)(a1 + 40) + 1392) infoView];
  int8x16_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"GENERAL_FAILURE_DETAIL" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v5 setDetailText:v7];

  id v8 = *(void **)(*(void *)(a1 + 40) + 1392);
  uint64_t v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v10 = [v9 localizedStringForKey:@"DONE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v8 updateContinueButtonTitleWithTitle:v10];

  uint64_t v11 = *(void *)(a1 + 40);
  if (*(void *)(v11 + 1176))
  {
    [(id)v11 cleanUpSpinner];
    uint64_t v11 = *(void *)(a1 + 40);
  }
  if (*(unsigned char *)(v11 + 1113))
  {
    [(id)v11 stopPostProcessSpinner];
    uint64_t v11 = *(void *)(a1 + 40);
  }
  [(id)v11 stopPostProcessTimer];
  [*(id *)(*(void *)(a1 + 40) + 1384) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 40) + 1040) setHidden:1];
  [*(id *)(a1 + 40) stopEnrollment];
  [*(id *)(a1 + 40) showContinueButton];
  [*(id *)(*(void *)(a1 + 40) + 1392) updateContinueButtonActionWithTarget:*(void *)(a1 + 40) selector:sel_cancelSpatialAudioProfile];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  int8x16_t v12 = *(void **)(*(void *)(a1 + 40) + 1032);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_107;
  v13[3] = &unk_1E6EA82F0;
  id v14 = *(id *)(a1 + 32);
  [v12 triggerSoundHapticForEnrollmentState:3 completion:v13];
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_107(uint64_t a1)
{
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_3_108(uint64_t a1)
{
  uint64_t v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> GeneralFailure Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)continueButtonTapped
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int currentStep = self->_currentStep;
    unint64_t sessionState = self->_sessionState;
    v9[0] = 67109376;
    v9[1] = currentStep;
    __int16 v10 = 1024;
    int v11 = sessionState;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: ContinueButton Tapped Current Step %d, Currente Session %d ", (uint8_t *)v9, 0xEu);
  }

  if (self->_currentStep == 4)
  {
    if ([(HPSSpatialProfileSingeStepEnrollmentController *)self checkAndShowInEarPopup]) {
      return;
    }
    if (([(BluetoothManager *)self->_btManager available] & 1) == 0)
    {
      int8x16_t v6 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9[0]) = 0;
        _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, "Spatial Profile: btManager is not available", (uint8_t *)v9, 2u);
      }

      if (!self->_welcomeSpinnerOn)
      {
        uint64_t v7 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v9[0]) = 0;
          _os_log_impl(&dword_1E4BFE000, v7, OS_LOG_TYPE_DEFAULT, "Spatial Profile: btManager is not available starting welcome spinner", (uint8_t *)v9, 2u);
        }

        [(HPSSpatialProfileSingeStepEnrollmentController *)self startWelcomeSpinner];
      }
    }
  }
  if (self->_enrollmentReady)
  {
    int v8 = self->_currentStep;
    if (v8 <= 9) {
      [(HPSSpatialProfileSingeStepEnrollmentController *)self moveToStep:(v8 + 1)];
    }
  }
  else if (!self->_welcomeSpinnerOn)
  {
    [(HPSSpatialProfileSingeStepEnrollmentController *)self startWelcomeSpinner];
  }
}

- (void)userCancelEnrollment
{
  id v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: User Cancelled Spatial Audio Profile", v4, 2u);
  }

  [(HPSSpatialProfileAnalytics *)self->_enrollmentAnalytics updateStatus:0 EnrollmentResult:@"Cancel"];
  [(HPSSpatialProfileSingeStepEnrollmentController *)self cancelSpatialAudioProfile];
}

- (void)stopTimers
{
  [(HPSSpatialProfileSingeStepEnrollmentController *)self stopFaceInFrameHandlerTimer];
  [(HPSSpatialProfileSingeStepEnrollmentController *)self stopCaptureViewTimer];

  [(HPSSpatialProfileSingeStepEnrollmentController *)self stopPostProcessTimer];
}

- (void)cancelSpatialAudioProfile
{
  id v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Cancel Spatial Audio Profile", buf, 2u);
  }

  if (self->_enrollmentStarted) {
    [(HPSSpatialProfileSingeStepEnrollmentController *)self stopEnrollment];
  }
  [(HPSSpatialProfileSingeStepEnrollmentController *)self stopTimers];
  [(HPSSpatialProfileSingleStepSoundHapticManager *)self->_soundHapticManager stop];
  [(HPSSpatialProfileSingeStepEnrollmentController *)self resetVolume];
  [(HPSSpatialProfileEarTutorialView *)self->_earTutorialView stopPlayers];
  [(HPSSpatialProfileSingeStepEnrollmentController *)self dismissViewControllerAnimated:1 completion:&__block_literal_global_113];
  if (self->_enrollmentCompleted)
  {
    uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"HPSSpatialAudioProfileUpdated" object:0];
  }
  if (self->dismissalHandler)
  {
    uint64_t v5 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int8x16_t v6 = 0;
      _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Executing : Dismiss handler", v6, 2u);
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
  block[2] = __77__HPSSpatialProfileSingeStepEnrollmentController_bluetoothDidBecomeAvailable__block_invoke;
  block[3] = &unk_1E6EA82F0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __77__HPSSpatialProfileSingeStepEnrollmentController_bluetoothDidBecomeAvailable__block_invoke(uint64_t result)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(result + 32) + 1112))
  {
    uint64_t v1 = result;
    uint64_t v2 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(v1 + 32);
      int v4 = *(unsigned __int8 *)(v3 + 1190);
      int v5 = [*(id *)(v3 + 1264) available];
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
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = [*a1 resultSize];
  v4[0] = 67109120;
  v4[1] = v3;
  _os_log_error_impl(&dword_1E4BFE000, a2, OS_LOG_TYPE_ERROR, "Spatial Profile: Profile Generation failed : result size %d ", (uint8_t *)v4, 8u);
}

uint64_t __65__HPSSpatialProfileSingeStepEnrollmentController_retrieveProfile__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) moveToStep:3];
}

void __65__HPSSpatialProfileSingeStepEnrollmentController_retrieveProfile__block_invoke_120(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = sharedBluetoothSettingsLogComponent();
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

  [*(id *)(a1[4] + 1160) appendData:v3];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1[5] + 8) + 40));
}

uint64_t __65__HPSSpatialProfileSingeStepEnrollmentController_retrieveProfile__block_invoke_122(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 1160) length];
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1E4BFE000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Retrieved Profile Size: %lu", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 32) moveToStep:11];
}

- (void)syncProfile
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  profileData = self->_profileData;
  if (profileData && [(NSMutableData *)profileData length])
  {
    int v4 = sharedBluetoothSettingsLogComponent();
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
    _DWORD v9[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_syncProfile__block_invoke;
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

void __61__HPSSpatialProfileSingeStepEnrollmentController_syncProfile__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = sharedBluetoothSettingsLogComponent();
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

  [*(id *)(a1 + 32) moveToStep:12];
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

    [(HPSSpatialProfileSingeStepEnrollmentController *)self stopTutorialResumeEnrollTimer];
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

    [(HPSSpatialProfileSingeStepEnrollmentController *)self stopCaptureViewTimer];
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
  uint64_t v7 = [v4 alertControllerWithTitle:v6 message:&stru_1F4097960 preferredStyle:1];

  uint64_t v8 = (void *)MEMORY[0x1E4FB1410];
  __int16 v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"CANCEL_ENROLLMENT_ALERT_PROMPT_BUTTON" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__HPSSpatialProfileSingeStepEnrollmentController_captureViewTimerDidFire__block_invoke;
  v12[3] = &unk_1E6EA83E0;
  v12[4] = self;
  uint64_t v11 = [v8 actionWithTitle:v10 style:0 handler:v12];
  [v7 addAction:v11];

  [(HPSSpatialProfileSingeStepEnrollmentController *)self presentViewController:v7 animated:1 completion:0];
}

uint64_t __73__HPSSpatialProfileSingeStepEnrollmentController_captureViewTimerDidFire__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelSpatialAudioProfile];
}

- (BOOL)isEarOccluded
{
  return !self->_supressEarOcclusionWarning && self->_isEarOccluded;
}

- (id)getBudsInEarString
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  [(BluetoothManager *)self->_btManager connectedDevices];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v34 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if (+[HPSProductUtils isAppleHeadphone:v7]
          && ([v7 isTemporaryPaired] & 1) == 0)
        {
          if ([v7 isGenuineAirPods])
          {
            uint64_t v8 = +[BTSDeviceClassic deviceWithDevice:v7];
            __int16 v9 = v8;
            if (v8)
            {
              int v29 = 3;
              int v30 = 3;
              id v10 = [v8 classicDevice];
              [v10 inEarStatusPrimary:&v30 secondary:&v29];

              if (!v30 || !v29)
              {
                long long v12 = [v9 classicDevice];
                unsigned int v13 = [v12 productId];

                objc_msgSend(NSString, "stringWithFormat:", @"ACCESSORY_MODEL_NAME_%d", v13 - 0x2000);
                long long v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
                long long v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
                id v16 = [v15 localizedStringForKey:v14 value:&stru_1F4097960 table:@"SpatialAudioProfile"];
                if ([v16 length] && v13 >= 0x200A)
                {

                  if (v13 >> 4 <= 0x200) {
                    goto LABEL_27;
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
LABEL_27:
                uint64_t v17 = sharedBluetoothSettingsLogComponent();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                {
                  int v18 = [v9 classicDevice];
                  v19 = [v18 name];
                  *(_DWORD *)buf = 138412290;
                  v38 = v19;
                  _os_log_impl(&dword_1E4BFE000, v17, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Device %@, bud in ear", buf, 0xCu);
                }
                id v20 = [(id)MGGetStringAnswer() uppercaseString];
                v21 = [@"SPATIAL_AUDIO_PROFILE_IED_WARN_" stringByAppendingFormat:@"%@_%@", v20, v14];

                id v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
                uint64_t v11 = [v22 localizedStringForKey:v21 value:&stru_1F4097960 table:@"SpatialAudioProfile"];

                switch(v13)
                {
                  case 0x2025u:
                    id v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
                    id v24 = v23;
                    v25 = @"SPATIAL_AUDIO_PROFILE_IED_WARN_IPHONE_ACCESSORY_MODEL_NAME_24";
                    v26 = @"DeviceConfig-B465";
                    break;
                  case 0x201Du:
                    id v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
                    id v24 = v23;
                    v25 = @"SPATIAL_AUDIO_PROFILE_IED_WARN_IPHONE_ACCESSORY_MODEL_NAME_42";
                    v26 = @"DeviceConfig-B498-v2";
                    break;
                  case 0x2017u:
                    id v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
                    id v24 = v23;
                    v25 = @"SPATIAL_AUDIO_PROFILE_IED_WARN_IPHONE_ACCESSORY_MODEL_NAME_23";
                    v26 = @"DeviceConfig-B453";
                    break;
                  default:
LABEL_36:

                    goto LABEL_37;
                }
                uint64_t v27 = [v23 localizedStringForKey:v25 value:&stru_1F4097960 table:v26];

                uint64_t v11 = (void *)v27;
                goto LABEL_36;
              }
            }
          }
          else
          {
            __int16 v9 = sharedBluetoothSettingsLogComponent();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
              [(HPSSpatialProfileSingeStepEnrollmentController *)&v31 getBudsInEarString];
            }
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 0;
LABEL_37:

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

  if ((self->_currentStep & 0xFFFFFFFE) != 6) {
    goto LABEL_8;
  }
  if (self->_faceBoundingBoxStatus == 1 && !self->_faceCaptured)
  {
    self->_faceTooCloseErrorShowing = 1;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__HPSSpatialProfileSingeStepEnrollmentController_triggerFaceInFrameHandlerTimeout__block_invoke;
    block[3] = &unk_1E6EA82F0;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
    uint64_t v5 = (void *)MEMORY[0x1E4F1CB00];
    double v6 = 1.0;
    goto LABEL_10;
  }
  if (!self->_faceTooCloseErrorShowing)
  {
LABEL_8:
    [(HPSSpatialProfileSingeStepEnrollmentController *)self stopFaceInFrameHandlerTimer];
    return;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _DWORD v9[2] = __82__HPSSpatialProfileSingeStepEnrollmentController_triggerFaceInFrameHandlerTimeout__block_invoke_2;
  v9[3] = &unk_1E6EA82F0;
  void v9[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], v9);
  uint64_t v5 = (void *)MEMORY[0x1E4F1CB00];
  double v6 = 3.0;
LABEL_10:
  uint64_t v7 = [v5 scheduledTimerWithTimeInterval:self target:sel_triggerFaceInFrameHandlerTimeout selector:0 userInfo:0 repeats:v6];
  faceInFrameHandlerTimer = self->_faceInFrameHandlerTimer;
  self->_faceInFrameHandlerTimer = v7;
}

void __82__HPSSpatialProfileSingeStepEnrollmentController_triggerFaceInFrameHandlerTimeout__block_invoke(uint64_t a1)
{
  id v12 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v2 = [v12 objectForKey:*MEMORY[0x1E4F1C490]];
  int v3 = [v2 BOOLValue];

  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 1392) infoView];
  uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v6 = [v5 localizedStringForKey:@"FACE_TOO_CLOSE_TITLE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v4 setTitle:v6];

  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 1392) infoView];
  uint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  __int16 v9 = v8;
  if (v3) {
    id v10 = @"FACE_TOO_CLOSE_DETAIL_METRICS";
  }
  else {
    id v10 = @"FACE_TOO_CLOSE_DETAIL_IMPERIAL";
  }
  uint64_t v11 = [v8 localizedStringForKey:v10 value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  [v7 setDetailText:v11];
}

void __82__HPSSpatialProfileSingeStepEnrollmentController_triggerFaceInFrameHandlerTimeout__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 1227))
  {
    int v3 = [*(id *)(v1 + 1392) infoView];
    uint64_t v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v5 = [v4 localizedStringForKey:@"SINGLE_STEP_FRONT_VIEW_CAPTURE" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
    [v3 setTitle:v5];

    double v6 = [*(id *)(*(void *)(a1 + 32) + 1392) infoView];
    uint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"SINGLE_STEP_FRONT_VIEW_CAPTURE_DETAIL" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
    [v6 setDetailText:v8];

    uint64_t v1 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(v1 + 1227) = 0;
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

    [(HPSSpatialProfileSingeStepEnrollmentController *)self stopFaceInFrameHandlerTimer];
  }
  uint64_t v4 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
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

- (void)startPostProcessTimer
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_postProcessTimer)
  {
    int v3 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Post Process Timer already started, stopping it first", (uint8_t *)&v10, 2u);
    }

    [(HPSSpatialProfileSingeStepEnrollmentController *)self stopPostProcessTimer];
  }
  if (MGGetBoolAnswer()) {
    double v4 = 120.0;
  }
  else {
    double v4 = 240.0;
  }
  uint64_t v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    double v11 = v4;
    _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Starting Post Process Timer %f", (uint8_t *)&v10, 0xCu);
  }

  double v6 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_triggerPostProcessTimeout selector:0 userInfo:0 repeats:v4];
  postProcessTimer = self->_postProcessTimer;
  self->_postProcessTimer = v6;

  uint64_t v8 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_startPostProcessSpinner selector:0 userInfo:0 repeats:2.0];
  postProcessSpinnerTimer = self->_postProcessSpinnerTimer;
  self->_postProcessSpinnerTimer = v8;
}

- (void)stopPostProcessTimer
{
  int v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v6 = 0;
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
  int v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Triggering Post Process Timeout", v4, 2u);
  }

  [(HPSSpatialProfileSingeStepEnrollmentController *)self moveToStep:3];
}

- (void)didReceiveStateUpdateForSession:(id)a3 stateInfo:(id)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
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
    -[HPSSpatialProfileSingeStepEnrollmentController didReceiveStateUpdateForSession:stateInfo:]();
  }

  uint64_t v12 = [v7 objectForKeyedSubscript:*v8];
  unint64_t v13 = [v12 integerValue];

  long long v14 = (void *)MEMORY[0x1E4F655C0];
  long long v15 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F655C0]];

  if (v15)
  {
    id v16 = [v7 objectForKeyedSubscript:*v14];
    uint64_t v17 = v16;
    if (v16)
    {
      [v16 code];
      int v18 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v74 = (unint64_t)v17;
        _os_log_impl(&dword_1E4BFE000, v18, OS_LOG_TYPE_DEFAULT, "Spatial Profile: didReceiveStateUpdateForSession  ERROR: %@ ", buf, 0xCu);
      }

      if (self->_currentStep != 3) {
        [(HPSSpatialProfileSingeStepEnrollmentController *)self moveToStep:3];
      }
      v19 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[HPSSpatialProfileSingeStepEnrollmentController didReceiveStateUpdateForSession:stateInfo:].cold.4(v17);
      }
    }
  }
  if (self->_sessionState != v13)
  {
    id v20 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v74 = v13;
      _os_log_impl(&dword_1E4BFE000, v20, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Frame Rate : Update Session %lu", buf, 0xCu);
    }

    self->_unint64_t sessionState = v13;
  }
  if (v13 - 1 <= 1) {
    [(HPSSpatialProfileAnalytics *)self->_enrollmentAnalytics incrementFrameCount];
  }
  v21 = (void *)MEMORY[0x1E4F655D8];
  id v22 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F655D8]];

  if (v22)
  {
    id v23 = [v7 objectForKeyedSubscript:*v21];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      -[HPSSpatialProfileSingeStepEnrollmentController didReceiveStateUpdateForSession:stateInfo:]();
    }

    id v24 = [v7 objectForKeyedSubscript:*v21];
    [v24 doubleValue];
    double v26 = v25;
  }
  else
  {
    double v26 = 0.0;
  }
  switch(v13)
  {
    case 0uLL:
      uint64_t v27 = sharedBluetoothSettingsLogComponent();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_71;
      }
      *(_WORD *)buf = 0;
      uint64_t v28 = "Spatial Profile: State Update: Idle";
      int v29 = v27;
      uint32_t v30 = 2;
      goto LABEL_34;
    case 1uLL:
      uint64_t v27 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F655C8]];
      uint8_t v31 = [v27 yawAngles];
      unsigned int v32 = [v31 count];

      unint64_t v33 = 0x1EAE8C000;
      if (v27)
      {
        unsigned int v34 = v32 >> 1;
        [v27 faceBoundingBox];
        if (!CGRectEqualToRect(v78, *MEMORY[0x1E4F1DB28]) && !self->_faceCaptured)
        {
          [v27 faceBoundingBox];
          -[HPSSpatialProfileSingeStepEnrollmentController updateFaceTrackingStatus:](self, "updateFaceTrackingStatus:");
        }
        unint64_t v35 = 0x1EAE8C000;
        if (!self->_faceStraightZeroAngleCaptured)
        {
          v39 = [v27 yawAngles];
          uint64_t v40 = [v39 objectAtIndexedSubscript:v34];
          int v41 = [v40 captured];

          if (v41)
          {
            self->_faceStraightZeroAngleCaptured = 1;
            id v42 = sharedBluetoothSettingsLogComponent();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218240;
              unint64_t v74 = 0;
              __int16 v75 = 1024;
              int v76 = 1;
              _os_log_impl(&dword_1E4BFE000, v42, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Captured straight face angle %f ->  %d", buf, 0x12u);
            }
          }
          unint64_t v35 = 0x1EAE8C000uLL;
          if (!self->_faceStraightZeroAngleCaptured) {
            goto LABEL_53;
          }
        }
        if (self->_currentStep == 6)
        {
          self->_faceDetected = 1;
          [*(id *)((char *)&self->super.super.super.isa + *(int *)(v35 + 3316)) fillPill:v34 updatePillsForPoseStatus:v27 withCompletion:&__block_literal_global_214];
          uint64_t v43 = sharedBluetoothSettingsLogComponent();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1E4BFE000, v43, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Fill up Straight angle: Transition to View CaptureMoveHead", buf, 2u);
          }

          unint64_t v33 = 0x1EAE8C000;
          if (self->_currentStep <= 6) {
            [(HPSSpatialProfileSingeStepEnrollmentController *)self moveToStep:7];
          }
        }
        else
        {
LABEL_53:
          unint64_t v33 = 0x1EAE8C000uLL;
        }
        int currentStep = self->_currentStep;
        if (currentStep == 7 || currentStep == 2)
        {
          [(HPSSpatialProfileSingleStepSoundHapticManager *)self->_soundHapticManager startEnrollLoop];
          v45 = *(Class *)((char *)&self->super.super.super.isa + *(int *)(v35 + 3316));
          v46 = (char *)self + *(int *)(v33 + 3404);
          v72[0] = MEMORY[0x1E4F143A8];
          v72[1] = 3221225472;
          v72[2] = __92__HPSSpatialProfileSingeStepEnrollmentController_didReceiveStateUpdateForSession_stateInfo___block_invoke_215;
          v72[3] = &unk_1E6EA8970;
          v72[4] = self;
          [v45 updatePillsForPoseStatus:v27 pillCount:v46 alongSideAction:v72];
        }
      }
      id v47 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F655B8]];
      uint64_t v48 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F655D0]];
      uint64_t v49 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F655E0]];
      uint64_t v50 = [v47 earCaptureStatus];
      [v47 earBoundingBox];
      double v52 = v51;
      double v54 = v53;
      double v56 = v55;
      double v58 = v57;
      -[HPSSpatialProfileSingeStepEnrollmentController updateCurrentTrackingEar:rightEarPoseStatus:earBoundingBox:earStatus:](self, "updateCurrentTrackingEar:rightEarPoseStatus:earBoundingBox:earStatus:", v48, v49, v50);
      if (self->_enrollmentPaused) {
        goto LABEL_66;
      }
      v79.origin.x = v52;
      v79.origin.y = v54;
      v79.size.width = v56;
      v79.size.height = v58;
      if (!CGRectEqualToRect(v79, *MEMORY[0x1E4F1DB28]))
      {
        v59 = [(HPSSpatialProfileVideoCaptureSession *)self->videoCaptureSession previewLayer];
        [v59 frame];
        -[HPSSpatialProfileSingeStepEnrollmentController translateEarBoundingBox:previewLayerBoundingBox:](self, "translateEarBoundingBox:previewLayerBoundingBox:", v52, v54, v56, v58, v60, v61, v62, v63);
      }
      [(HPSSpatialProfileSingeStepEnrollmentController *)self updateBoundingBoxHiddenStatus];
      BOOL v64 = [(HPSSpatialProfileSingeStepEnrollmentController *)self isEarOccluded];
      int v65 = self->_currentStep;
      if (v64)
      {
        if (v65 != 7) {
          goto LABEL_66;
        }
        uint64_t v66 = 2;
      }
      else
      {
        if (v65 != 2) {
          goto LABEL_66;
        }
        uint64_t v66 = 7;
      }
      [(HPSSpatialProfileSingeStepEnrollmentController *)self moveToStep:v66];
LABEL_66:
      unint64_t v67 = *(unsigned int *)((char *)&self->super.super.super.isa + *(int *)(v33 + 3404));
      v68 = [v27 yawAngles];
      if ([v68 count] > v67) {
        goto LABEL_69;
      }
      BOOL faceCaptured = self->_faceCaptured;

      if (!faceCaptured)
      {
        self->_currentProgress = 0.0;
        v68 = dispatch_get_global_queue(21, 0);
        v71[0] = MEMORY[0x1E4F143A8];
        v71[1] = 3221225472;
        v71[2] = __92__HPSSpatialProfileSingeStepEnrollmentController_didReceiveStateUpdateForSession_stateInfo___block_invoke_219;
        v71[3] = &unk_1E6EA82F0;
        v71[4] = self;
        dispatch_async(v68, v71);
LABEL_69:
      }
LABEL_71:

LABEL_72:
      if (self->_currentProgress != v26) {
        self->_currentProgress = v26;
      }

      return;
    case 3uLL:
      [(HPSSpatialProfileAnalytics *)self->_enrollmentAnalytics updateSoundProfileCreationDurationStart];
      uint64_t v27 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        int v36 = self->_currentStep;
        *(_DWORD *)buf = 67109120;
        LODWORD(v74) = v36;
        uint64_t v28 = "Spatial Profile: State Update: Post Process : %d";
        int v29 = v27;
        uint32_t v30 = 8;
LABEL_34:
        _os_log_impl(&dword_1E4BFE000, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);
      }
      goto LABEL_71;
    case 4uLL:
      if (self->_currentStep <= 7) {
        [(HPSSpatialProfileSingeStepEnrollmentController *)self moveToStep:8];
      }
      uint64_t v37 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4BFE000, v37, OS_LOG_TYPE_DEFAULT, "Spatial Profile: State Update: Retrieve Profile", buf, 2u);
      }

      [(HPSSpatialProfileSingeStepEnrollmentController *)self moveToStep:10];
      [(HPSSpatialProfileAnalytics *)self->_enrollmentAnalytics updateSoundProfileCreationDuration];
      goto LABEL_72;
    case 5uLL:
      v38 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        -[HPSSpatialProfileSingeStepEnrollmentController didReceiveStateUpdateForSession:stateInfo:]();
      }

      [(HPSSpatialProfileAnalytics *)self->_enrollmentAnalytics updateStatus:0 EnrollmentResult:@"Failed"];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __92__HPSSpatialProfileSingeStepEnrollmentController_didReceiveStateUpdateForSession_stateInfo___block_invoke_220;
      block[3] = &unk_1E6EA82F0;
      void block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
      goto LABEL_72;
    default:
      goto LABEL_72;
  }
}

int *__92__HPSSpatialProfileSingeStepEnrollmentController_didReceiveStateUpdateForSession_stateInfo___block_invoke_215(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 1232) = 0;
  char v2 = [*(id *)(*(void *)(a1 + 32) + 1384) leftSectionCompleted];
  int v3 = [*(id *)(*(void *)(a1 + 32) + 1384) rightSectionCompleted];
  int v4 = v3;
  if ((v2 & 1) != 0 || v3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v5 + 1192))
    {
      *(unsigned char *)(v5 + 1192) = 1;
      [*(id *)(*(void *)(a1 + 32) + 1032) triggerSoundHapticForEarCaptureState:0 completion:&__block_literal_global_217];
    }
  }
  id v6 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [*(id *)(*(void *)(a1 + 32) + 1384) leftSectionCompleted];
    int v8 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 1412);
    v11[0] = 67109632;
    v11[1] = v7;
    __int16 v12 = 1024;
    int v13 = v4;
    __int16 v14 = 1024;
    int v15 = v8;
    _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Phase 2 -> End, L%i R%i _enrollmentUICompletionStepComplete:%i", (uint8_t *)v11, 0x14u);
  }

  result = (int *)[*(id *)(*(void *)(a1 + 32) + 1384) leftSectionCompleted];
  if (result)
  {
    result = (int *)[*(id *)(*(void *)(a1 + 32) + 1384) rightSectionCompleted];
    if (result)
    {
      if (!*(unsigned char *)(*(void *)(a1 + 32) + 1412))
      {
        int v10 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v11[0]) = 0;
          _os_log_impl(&dword_1E4BFE000, v10, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Phase 2 -> End UI complete", (uint8_t *)v11, 2u);
        }

        *(unsigned char *)(*(void *)(a1 + 32) + 1412) = 1;
        [*(id *)(*(void *)(a1 + 32) + 1032) stopEnrollLoop];
        *(_DWORD *)(*(void *)(a1 + 32) + 1228) = 33;
        result = *(int **)(a1 + 32);
        if (result[283] <= 7) {
          return (int *)[result moveToStep:8];
        }
      }
    }
  }
  return result;
}

void __92__HPSSpatialProfileSingeStepEnrollmentController_didReceiveStateUpdateForSession_stateInfo___block_invoke_2()
{
  v0 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1E4BFE000, v0, OS_LOG_TYPE_DEFAULT, "Spatial Profile: HPSSpatialProfileEarCaptureStep_First complete sound played", v1, 2u);
  }
}

uint64_t __92__HPSSpatialProfileSingeStepEnrollmentController_didReceiveStateUpdateForSession_stateInfo___block_invoke_219(uint64_t a1)
{
  return [*(id *)(a1 + 32) moveToStep:8];
}

uint64_t __92__HPSSpatialProfileSingeStepEnrollmentController_didReceiveStateUpdateForSession_stateInfo___block_invoke_220(uint64_t a1)
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
    block[2] = __106__HPSSpatialProfileSingeStepEnrollmentController_didReceiveCaptureVideo_colorImage_depthImage_faceObject___block_invoke_231;
    block[3] = &unk_1E6EA8428;
    __int16 v12 = (id *)v14;
    v14[0] = v9;
    v14[1] = self;
    dispatch_async(visualDetectionQueue, block);
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __106__HPSSpatialProfileSingeStepEnrollmentController_didReceiveCaptureVideo_colorImage_depthImage_faceObject___block_invoke;
    v15[3] = &unk_1E6EA8998;
    __int16 v12 = (id *)v16;
    v16[0] = v8;
    v16[1] = self;
    id v17 = v10;
    dispatch_async(MEMORY[0x1E4F14428], v15);
  }
}

void __106__HPSSpatialProfileSingeStepEnrollmentController_didReceiveCaptureVideo_colorImage_depthImage_faceObject___block_invoke(uint64_t a1)
{
  v35[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = sharedBluetoothSettingsLogComponent();
  int v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v31) = 0;
      _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Update Preview Layer", (uint8_t *)&v31, 2u);
    }

    *(unsigned char *)(*(void *)(a1 + 40) + 1194) = 1;
    [*(id *)(*(void *)(a1 + 40) + 1144) setPreviewLayer:*(void *)(a1 + 32)];
    uint64_t v5 = [MEMORY[0x1E4F1E018] contextWithOptions:0];
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = *(void **)(v6 + 1368);
    *(void *)(v6 + 1368) = v5;

    id v8 = (void *)MEMORY[0x1E4F1E030];
    uint64_t v9 = *MEMORY[0x1E4F1DFB8];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 1368);
    uint64_t v34 = *MEMORY[0x1E4F1DFA8];
    v35[0] = *MEMORY[0x1E4F1DFA0];
    double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    uint64_t v12 = [v8 detectorOfType:v9 context:v10 options:v11];
    uint64_t v13 = *(void *)(a1 + 40);
    __int16 v14 = *(void **)(v13 + 1376);
    *(void *)(v13 + 1376) = v12;

    int v15 = [*(id *)(*(void *)(a1 + 40) + 1144) previewLayer];
    [v15 setOpacity:0.0];

    uint64_t v16 = [[HPSSpatialProfileSingleStepPearlEnrollView alloc] initWithVideoCaptureSession:*(void *)(*(void *)(a1 + 40) + 1144) inSheet:0 squareNeedsPositionLayout:0];
    uint64_t v17 = *(void *)(a1 + 40);
    int v18 = *(void **)(v17 + 1040);
    *(void *)(v17 + 1040) = v16;

    [*(id *)(a1 + 40) setupEnrollViewUI];
    [*(id *)(a1 + 40) pauseEnrollment];
    uint64_t v19 = *(void *)(a1 + 40) + 1000;
    double Width = (double)CVPixelBufferGetWidth((CVPixelBufferRef)[*(id *)(a1 + 48) pixelBuffer]);
    size_t Height = CVPixelBufferGetHeight((CVPixelBufferRef)[*(id *)(a1 + 48) pixelBuffer]);
    *(void *)uint64_t v19 = 0;
    *(void *)(v19 + 8) = 0;
    *(double *)(v19 + 16) = Width;
    *(double *)(v19 + 24) = (double)Height;
    id v22 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 1016);
      uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 1024);
      int v31 = 134218240;
      *(void *)unsigned int v32 = v24;
      *(_WORD *)&v32[8] = 2048;
      uint64_t v33 = v23;
      _os_log_impl(&dword_1E4BFE000, v22, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Frame Size  %f %f", (uint8_t *)&v31, 0x16u);
    }

    double v25 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(*(void *)(a1 + 40) + 1112)) {
        double v26 = @"YES";
      }
      else {
        double v26 = @"NO";
      }
      int v31 = 138412290;
      *(void *)unsigned int v32 = v26;
      _os_log_impl(&dword_1E4BFE000, v25, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Checking enrollment viewer Spinner %@", (uint8_t *)&v31, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1 + 40) + 1190) = 1;
    if (*(unsigned char *)(*(void *)(a1 + 40) + 1112))
    {
      uint64_t v27 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = *(void *)(a1 + 40);
        int v29 = *(unsigned __int8 *)(v28 + 1190);
        int v30 = [*(id *)(v28 + 1264) available];
        int v31 = 67109376;
        *(_DWORD *)unsigned int v32 = v29;
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

void __106__HPSSpatialProfileSingeStepEnrollmentController_didReceiveCaptureVideo_colorImage_depthImage_faceObject___block_invoke_231(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    int v2 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 1362);
    int v3 = (void *)MEMORY[0x1E4F1C9E8];
    int v4 = [NSNumber numberWithInt:6];
    uint64_t v5 = [v3 dictionaryWithObject:v4 forKey:*MEMORY[0x1E4F1DFB0]];

    uint64_t v6 = [*(id *)(*(void *)(a1 + 40) + 1376) featuresInImage:*(void *)(a1 + 32) options:v5];
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
        __int16 v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
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
      unsigned int v16 = *(unsigned __int8 *)(v15 + 1363);
      if (v16 <= 0x63) {
        *(unsigned char *)(v15 + 1363) = v16 + 1;
      }
    }
    else
    {
LABEL_12:
      *(unsigned char *)(*(void *)(a1 + 40) + 1363) = 0;
    }
    *(unsigned char *)(*(void *)(a1 + 40) + 1362) = *(unsigned __int8 *)(*(void *)(a1 + 40) + 1363) > 0x63u;
    if (v2 != *(unsigned __int8 *)(*(void *)(a1 + 40) + 1362))
    {
      uint64_t v17 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 40);
        int v19 = *(unsigned __int8 *)(v18 + 1362);
        int v20 = *(unsigned __int8 *)(v18 + 1363);
        if (v19) {
          v21 = @"At Phone";
        }
        else {
          v21 = @"away";
        }
        *(_DWORD *)buf = 138412546;
        int v30 = v21;
        __int16 v31 = 1024;
        int v32 = v20;
        _os_log_impl(&dword_1E4BFE000, v17, OS_LOG_TYPE_DEFAULT, "Spatial Profile: 2 User attention status %@ Count %d", buf, 0x12u);
      }

      uint64_t v22 = *(void *)(a1 + 40);
      if (*(unsigned char *)(v22 + 1362))
      {
        *(void *)(v22 + 1304) = 0;
        *(unsigned char *)(*(void *)(a1 + 40) + 1276) = 0;
      }
    }
  }
}

- (void)updateCurrentTrackingEar:(id)a3 rightEarPoseStatus:(id)a4 earBoundingBox:(CGRect)a5 earStatus:(int)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = (char *)a3;
  id v14 = a4;
  uint64_t v15 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v45.origin.CGFloat x = x;
    v45.origin.CGFloat y = y;
    v45.size.CGFloat width = width;
    v45.size.CGFloat height = height;
    unsigned int v16 = NSStringFromRect(v45);
    unint64_t earOcclusionDetectTracker = self->_earOcclusionDetectTracker;
    int v34 = 138413314;
    unint64_t v35 = v13;
    __int16 v36 = 2112;
    unint64_t v37 = (unint64_t)v14;
    __int16 v38 = 2112;
    v39 = v16;
    __int16 v40 = 1024;
    int v41 = a6;
    __int16 v42 = 2048;
    unint64_t v43 = earOcclusionDetectTracker;
    _os_log_impl(&dword_1E4BFE000, v15, OS_LOG_TYPE_DEFAULT, "Spatial Profile: updateCurrentTrackingEar left:%@  right: %@  box: %@  status:%i tracker:%lu", (uint8_t *)&v34, 0x30u);
  }
  if (self->_currentStep >= 7)
  {
    BOOL isEarOccluded = self->_isEarOccluded;
    switch(a6)
    {
      case 0:
        unint64_t v19 = self->_earOcclusionDetectTracker;
        if (v19) {
          self->_unint64_t earOcclusionDetectTracker = v19 - 1;
        }
        unint64_t earTooCloseDetectTracker = self->_earTooCloseDetectTracker;
        if (earTooCloseDetectTracker) {
          self->_unint64_t earTooCloseDetectTracker = earTooCloseDetectTracker - 1;
        }
        uint64_t v21 = 1288;
        unint64_t earTooFarDetectTracker = self->_earTooFarDetectTracker;
        if (earTooFarDetectTracker)
        {
          uint64_t v23 = earTooFarDetectTracker - 1;
          goto LABEL_21;
        }
        break;
      case 2:
        if (!self->_isLookingAtPhone && !self->_earTooClose)
        {
          uint64_t v21 = 1304;
          goto LABEL_18;
        }
        break;
      case 3:
        if (!self->_isLookingAtPhone)
        {
          uint64_t v21 = 1296;
          unint64_t v24 = self->_earTooCloseDetectTracker;
          if (v24 < 6) {
            goto LABEL_20;
          }
          uint64_t v23 = 5;
          goto LABEL_21;
        }
        break;
      case 4:
        uint64_t v21 = 1288;
LABEL_18:
        unint64_t v24 = *(unint64_t *)((char *)&self->super.super.super.isa + v21);
        if (v24 < 0xB) {
LABEL_20:
        }
          uint64_t v23 = v24 + 1;
        else {
          uint64_t v23 = 10;
        }
LABEL_21:
        *(Class *)((char *)&self->super.super.super.isa + v21) = (Class)v23;
        break;
      default:
        break;
    }
    self->_BOOL isEarOccluded = self->_earOcclusionDetectTracker > 9;
    if (self->_earTooFarDetectTracker < 0xA)
    {
      unint64_t v25 = self->_earTooCloseDetectTracker;
      if (!v25)
      {
        self->_earTooFar = 0;
        goto LABEL_31;
      }
    }
    else
    {
      self->_earTooFar = 1;
      unint64_t v25 = self->_earTooCloseDetectTracker;
    }
    if (v25 >= 5)
    {
      self->_earTooClose = 1;
      goto LABEL_33;
    }
    if (v25)
    {
      if (self->_earTooClose) {
        goto LABEL_33;
      }
      goto LABEL_32;
    }
LABEL_31:
    self->_earTooClose = 0;
LABEL_32:
    if (!self->_earTooFar)
    {
LABEL_34:
      v46.origin.CGFloat x = x;
      v46.origin.CGFloat y = y;
      v46.size.CGFloat width = width;
      v46.size.CGFloat height = height;
      BOOL v26 = CGRectEqualToRect(v46, *MEMORY[0x1E4F1DB28]);
      unint64_t earBoundingBoxDetectTracker = self->_earBoundingBoxDetectTracker;
      if (v26)
      {
        BOOL v28 = earBoundingBoxDetectTracker >= 3;
        unint64_t v29 = earBoundingBoxDetectTracker - 3;
        if (!v28) {
          unint64_t v29 = 0;
        }
        self->_unint64_t earBoundingBoxDetectTracker = v29;
      }
      else
      {
        unint64_t v29 = earBoundingBoxDetectTracker + 1;
        self->_unint64_t earBoundingBoxDetectTracker = v29;
        self->_currentEarBB.origin.CGFloat x = x;
        self->_currentEarBB.origin.CGFloat y = y;
        self->_currentEarBB.size.CGFloat width = width;
        self->_currentEarBB.size.CGFloat height = height;
      }
      if (v29 >= 0xB)
      {
        unint64_t v29 = 10;
        self->_unint64_t earBoundingBoxDetectTracker = 10;
      }
      self->_earBoundingBoxDetected = v29 != 0;
      if (isEarOccluded != self->_isEarOccluded)
      {
        int v30 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v31 = self->_earOcclusionDetectTracker;
          BOOL supressEarOcclusionWarning = self->_supressEarOcclusionWarning;
          if (self->_isEarOccluded) {
            uint64_t v33 = "YES";
          }
          else {
            uint64_t v33 = "NO";
          }
          int v34 = 136315650;
          unint64_t v35 = v33;
          __int16 v36 = 2048;
          unint64_t v37 = v31;
          __int16 v38 = 1024;
          LODWORD(v39) = supressEarOcclusionWarning;
          _os_log_impl(&dword_1E4BFE000, v30, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Ear Occlusion changed to %s current number of entries %lu UI supressed = %d", (uint8_t *)&v34, 0x1Cu);
        }
      }
      goto LABEL_48;
    }
LABEL_33:
    self->_unint64_t earOcclusionDetectTracker = 0;
    self->_BOOL isEarOccluded = 0;
    goto LABEL_34;
  }
LABEL_48:
}

- (void)translateEarBoundingBox:(CGRect)a3 previewLayerBoundingBox:(CGRect)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__HPSSpatialProfileSingeStepEnrollmentController_translateEarBoundingBox_previewLayerBoundingBox___block_invoke;
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

uint64_t __98__HPSSpatialProfileSingeStepEnrollmentController_translateEarBoundingBox_previewLayerBoundingBox___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __98__HPSSpatialProfileSingeStepEnrollmentController_translateEarBoundingBox_previewLayerBoundingBox___block_invoke_2;
  v2[3] = &unk_1E6EA89C0;
  v2[4] = *(void *)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 40);
  return [MEMORY[0x1E4FB1EB0] animateWithDuration:v2 animations:0.1];
}

uint64_t __98__HPSSpatialProfileSingeStepEnrollmentController_translateEarBoundingBox_previewLayerBoundingBox___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1072), "setBounds:", 0.0, 0.0, *(float *)(a1 + 40), *(float *)(a1 + 44));
  double v2 = *(float *)(a1 + 48);
  double v3 = *(float *)(a1 + 52);
  float64x2_t v4 = *(void **)(*(void *)(a1 + 32) + 1072);

  return objc_msgSend(v4, "setCenter:", v2, v3);
}

- (void)updateBoundingBoxHiddenStatus
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = [(CEKSubjectIndicatorView *)self->_earBoundingBoxView isHidden];
  if (self->_currentStep == 7)
  {
    if (v3 == !self->_earBoundingBoxDetected) {
      return;
    }
    if (self->_earBoundingBoxDetected)
    {
      [(CEKSubjectIndicatorView *)self->_earBoundingBoxView bounds];
      if (CGRectEqualToRect(v12, *MEMORY[0x1E4F1DB28])) {
        return;
      }
      int v4 = 0;
      goto LABEL_8;
    }
  }
  else if (v3)
  {
    return;
  }
  int v4 = 1;
LABEL_8:
  uint64_t v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = @"Showing";
    if (v4) {
      uint64_t v6 = @"Hidden";
    }
    *(_DWORD *)buf = 138412290;
    int v10 = v6;
    _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Bouding Box Updated : %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__HPSSpatialProfileSingeStepEnrollmentController_updateBoundingBoxHiddenStatus__block_invoke;
  v7[3] = &unk_1E6EA89E8;
  v7[4] = self;
  char v8 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __79__HPSSpatialProfileSingeStepEnrollmentController_updateBoundingBoxHiddenStatus__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __79__HPSSpatialProfileSingeStepEnrollmentController_updateBoundingBoxHiddenStatus__block_invoke_2;
  v2[3] = &unk_1E6EA89E8;
  v2[4] = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(a1 + 40);
  return [MEMORY[0x1E4FB1EB0] animateWithDuration:v2 animations:0.3];
}

uint64_t __79__HPSSpatialProfileSingeStepEnrollmentController_updateBoundingBoxHiddenStatus__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1072) setHidden:*(unsigned __int8 *)(a1 + 40)];
}

- (void)clearBoundingBox
{
  self->_unint64_t earBoundingBoxDetectTracker = 0;
  self->_earBoundingBoxDetected = 0;
  [(HPSSpatialProfileSingeStepEnrollmentController *)self updateBoundingBoxHiddenStatus];
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
    v12[2] = __84__HPSSpatialProfileSingeStepEnrollmentController_playEarCaptureSoundWithCompletion___block_invoke_2;
    v12[3] = &unk_1E6EA82F0;
    uint64_t v13 = v5;
    [(HPSSpatialProfileSingleStepSoundHapticManager *)soundHapticManager triggerSoundHapticForEarCaptureState:1 completion:v12];
    float32x2_t v7 = v13;
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
    void v14[2] = __84__HPSSpatialProfileSingeStepEnrollmentController_playEarCaptureSoundWithCompletion___block_invoke;
    v14[3] = &unk_1E6EA82F0;
    float v15 = v5;
    [(HPSSpatialProfileSingleStepSoundHapticManager *)v6 triggerSoundHapticForEarCaptureState:0 completion:v14];
    float32x2_t v7 = v15;
  }

LABEL_7:
  ++self->_earCaptureSoundStep;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__HPSSpatialProfileSingeStepEnrollmentController_playEarCaptureSoundWithCompletion___block_invoke_3;
  block[3] = &unk_1E6EA8278;
  id v11 = v4;
  id v9 = v4;
  dispatch_group_notify(v5, MEMORY[0x1E4F14428], block);
}

void __84__HPSSpatialProfileSingeStepEnrollmentController_playEarCaptureSoundWithCompletion___block_invoke(uint64_t a1)
{
}

void __84__HPSSpatialProfileSingeStepEnrollmentController_playEarCaptureSoundWithCompletion___block_invoke_2(uint64_t a1)
{
}

uint64_t __84__HPSSpatialProfileSingeStepEnrollmentController_playEarCaptureSoundWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setupEarBoundingBox
{
  char v3 = (CEKSubjectIndicatorView *)objc_alloc_init(MEMORY[0x1E4F57D70]);
  earBoundingBoxView = self->_earBoundingBoxView;
  self->_earBoundingBoxView = v3;

  [(CEKSubjectIndicatorView *)self->_earBoundingBoxView setPulsing:0];
  [(CEKSubjectIndicatorView *)self->_earBoundingBoxView setInactive:1];
  [(CEKSubjectIndicatorView *)self->_earBoundingBoxView setHidden:1];
  enrollContentView = self->_enrollContentView;
  uint64_t v6 = self->_earBoundingBoxView;

  [(UIView *)enrollContentView addSubview:v6];
}

- (void)pulseEarBoundingBox
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__HPSSpatialProfileSingeStepEnrollmentController_pulseEarBoundingBox__block_invoke;
  block[3] = &unk_1E6EA82F0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __69__HPSSpatialProfileSingeStepEnrollmentController_pulseEarBoundingBox__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1072) setInactive:0];
  [*(id *)(*(void *)(a1 + 32) + 1072) startScalingWithExpansionWidth:1 duration:10.0 repeatCount:0.1];
  dispatch_time_t v2 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__HPSSpatialProfileSingeStepEnrollmentController_pulseEarBoundingBox__block_invoke_2;
  block[3] = &unk_1E6EA82F0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

uint64_t __69__HPSSpatialProfileSingeStepEnrollmentController_pulseEarBoundingBox__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1072) setInactive:1];
}

- (void)showBudsInEarPopUp:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 classicDevice];
  unsigned int v6 = [v5 productId];

  objc_msgSend(NSString, "stringWithFormat:", @"ACCESSORY_MODEL_NAME_%d", v6 - 0x2000);
  float32x2_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  char v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
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
    float32x2_t v7 = @"ACCESSORY_MODEL_NAME_18";
  }
  else {
    float32x2_t v7 = @"ACCESSORY_MODEL_NAME_15";
  }
LABEL_10:
  id v11 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    CGRect v12 = [v4 classicDevice];
    uint64_t v13 = [v12 name];
    *(_DWORD *)buf = 138412290;
    int v32 = v13;
    _os_log_impl(&dword_1E4BFE000, v11, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Device %@, bud in ear", buf, 0xCu);
  }
  float v14 = [(id)MGGetStringAnswer() uppercaseString];
  float v15 = [@"SPATIAL_AUDIO_PROFILE_IED_WARN_" stringByAppendingFormat:@"%@_%@", v14, v7];

  float v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  float v17 = [v16 localizedStringForKey:v15 value:&stru_1F4097960 table:@"SpatialAudioProfile"];

  switch(v6)
  {
    case 0x2025u:
      uint64_t v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      float v19 = v18;
      float v20 = @"SPATIAL_AUDIO_PROFILE_IED_WARN_IPHONE_ACCESSORY_MODEL_NAME_24";
      uint64_t v21 = @"DeviceConfig-B465";
      goto LABEL_18;
    case 0x201Du:
      uint64_t v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      float v19 = v18;
      float v20 = @"SPATIAL_AUDIO_PROFILE_IED_WARN_IPHONE_ACCESSORY_MODEL_NAME_42";
      uint64_t v21 = @"DeviceConfig-B498-v2";
      goto LABEL_18;
    case 0x2017u:
      uint64_t v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      float v19 = v18;
      float v20 = @"SPATIAL_AUDIO_PROFILE_IED_WARN_IPHONE_ACCESSORY_MODEL_NAME_23";
      uint64_t v21 = @"DeviceConfig-B453";
LABEL_18:
      uint64_t v22 = [v18 localizedStringForKey:v20 value:&stru_1F4097960 table:v21];

      float v17 = (void *)v22;
      break;
  }
  uint64_t v23 = (void *)MEMORY[0x1E4FB1418];
  unint64_t v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  unint64_t v25 = [v24 localizedStringForKey:@"SPATIAL_AUDIO_PROFILE_IN_EAR_TEXT" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  BOOL v26 = [v23 alertControllerWithTitle:v17 message:v25 preferredStyle:1];

  long long v27 = (void *)MEMORY[0x1E4FB1410];
  BOOL v28 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  unint64_t v29 = [v28 localizedStringForKey:@"OK" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  int v30 = [v27 actionWithTitle:v29 style:0 handler:&__block_literal_global_254];
  [v26 addAction:v30];

  [(HPSSpatialProfileSingeStepEnrollmentController *)self presentViewController:v26 animated:1 completion:0];
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
        char v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
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
                  [(HPSSpatialProfileSingeStepEnrollmentController *)self showBudsInEarPopUp:v9];
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
                  [(HPSSpatialProfileSingeStepEnrollmentController *)self showBudsInEarPopUp:v9];
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
  float32x2_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v8 = [v7 localizedStringForKey:@"LANDSCAPE_MODE_ALERT_DETAIL" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  id v9 = [v4 alertControllerWithTitle:v6 message:v8 preferredStyle:1];

  BOOL v10 = (void *)MEMORY[0x1E4FB1410];
  id v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v12 = [v11 localizedStringForKey:@"OK" value:&stru_1F4097960 table:@"SpatialAudioProfile"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __68__HPSSpatialProfileSingeStepEnrollmentController_showLandscapeAlert__block_invoke;
  v14[3] = &unk_1E6EA83E0;
  void v14[4] = self;
  uint64_t v13 = [v10 actionWithTitle:v12 style:0 handler:v14];
  [v9 addAction:v13];

  [(HPSSpatialProfileSingeStepEnrollmentController *)self presentViewController:v9 animated:1 completion:0];
}

uint64_t __68__HPSSpatialProfileSingeStepEnrollmentController_showLandscapeAlert__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelSpatialAudioProfile];
}

- (void)showEarPillsDots
{
  pillContainerView = self->_pillContainerView;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  _DWORD v4[2] = __66__HPSSpatialProfileSingeStepEnrollmentController_showEarPillsDots__block_invoke;
  v4[3] = &unk_1E6EA82F0;
  v4[4] = self;
  [MEMORY[0x1E4FB1EB0] transitionWithView:pillContainerView duration:5242880 options:v4 animations:0 completion:0.4];
  [(HPSSpatialProfileEarDotsMovieView *)self->_earDotsMovieView showDots];
}

uint64_t __66__HPSSpatialProfileSingeStepEnrollmentController_showEarPillsDots__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1384) setAlpha:1.0];
}

- (void)hideEarPillsDots
{
  pillContainerView = self->_pillContainerView;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  _DWORD v4[2] = __66__HPSSpatialProfileSingeStepEnrollmentController_hideEarPillsDots__block_invoke;
  v4[3] = &unk_1E6EA82F0;
  v4[4] = self;
  [MEMORY[0x1E4FB1EB0] transitionWithView:pillContainerView duration:5242880 options:v4 animations:0 completion:0.4];
  [(HPSSpatialProfileEarDotsMovieView *)self->_earDotsMovieView hideDots];
}

uint64_t __66__HPSSpatialProfileSingeStepEnrollmentController_hideEarPillsDots__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1384) setAlpha:0.0];
}

- (void)prepareSpinner
{
  if (!self->_spinner)
  {
    id v3 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    spinner = self->_spinner;
    self->_spinner = v3;

    [(UIActivityIndicatorView *)self->_spinner setHidesWhenStopped:1];
    [(UIActivityIndicatorView *)self->_spinner setActivityIndicatorViewStyle:100];
    uint64_t v5 = [(HPSSpatialProfileSingleStepBottomContainer *)self->_bottomContainerView continueButton];
    [v5 bounds];
    double v7 = v6 * 0.5;
    char v8 = [(HPSSpatialProfileSingleStepBottomContainer *)self->_bottomContainerView continueButton];
    [v8 bounds];
    -[UIActivityIndicatorView setCenter:](self->_spinner, "setCenter:", v7, v9 * 0.5);

    [(UIActivityIndicatorView *)self->_spinner startAnimating];
    id v10 = [(HPSSpatialProfileSingleStepBottomContainer *)self->_bottomContainerView continueButton];
    [v10 addSubview:self->_spinner];
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
  id v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v9 = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Start Welcome Spinner", v9, 2u);
  }

  self->_welcomeSpinnerOn = 1;
  uint64_t v4 = [(HPSSpatialProfileSingleStepBottomContainer *)self->_bottomContainerView continueButton];
  uint64_t v5 = [v4 titleLabel];
  [v5 setHidden:1];

  double v6 = [(HPSSpatialProfileSingleStepBottomContainer *)self->_bottomContainerView continueButton];
  [v6 setUserInteractionEnabled:0];

  [(HPSSpatialProfileSingeStepEnrollmentController *)self prepareSpinner];
  spinner = self->_spinner;
  char v8 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  [(UIActivityIndicatorView *)spinner setColor:v8];
}

- (void)stopWelcomeSpinner
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1E4BFE000, v0, v1, "Spatial Profile: Not Started, Can Not Stop Post Process Spinner", v2, v3, v4, v5, v6);
}

- (void)startPostProcessSpinner
{
  uint64_t v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v14 = 0;
    _os_log_impl(&dword_1E4BFE000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Start Post Process Spinner", v14, 2u);
  }

  self->_postProcessSpinnerOn = 1;
  uint64_t v4 = [(HPSSpatialProfileSingleStepBottomContainer *)self->_bottomContainerView continueButton];
  uint64_t v5 = [v4 titleLabel];
  [v5 setHidden:1];

  uint8_t v6 = [(HPSSpatialProfileSingleStepBottomContainer *)self->_bottomContainerView continueButton];
  [v6 setUserInteractionEnabled:0];

  double v7 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  char v8 = [(HPSSpatialProfileSingleStepBottomContainer *)self->_bottomContainerView continueButton];
  [v8 setTintColor:v7];

  double v9 = [(HPSSpatialProfileSingleStepBottomContainer *)self->_bottomContainerView continueButton];
  id v10 = [MEMORY[0x1E4FB1618] clearColor];
  [v9 setBackgroundColor:v10];

  [(HPSSpatialProfileSingeStepEnrollmentController *)self showContinueButton];
  [(HPSSpatialProfileSingeStepEnrollmentController *)self prepareSpinner];
  id v11 = [(HPSSpatialProfileSingleStepBottomContainer *)self->_bottomContainerView continueButton];
  [v11 setAlpha:1.0];

  spinner = self->_spinner;
  uint64_t v13 = [MEMORY[0x1E4FB1618] systemGrayColor];
  [(UIActivityIndicatorView *)spinner setColor:v13];
}

- (void)stopPostProcessSpinner
{
  BOOL postProcessSpinnerOn = self->_postProcessSpinnerOn;
  uint64_t v4 = sharedBluetoothSettingsLogComponent();
  uint64_t v5 = v4;
  if (postProcessSpinnerOn)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Stop Post Process Spinner", v11, 2u);
    }

    self->_BOOL postProcessSpinnerOn = 0;
    uint8_t v6 = [MEMORY[0x1E4FB1618] systemBlueColor];
    double v7 = [(HPSSpatialProfileSingleStepBottomContainer *)self->_bottomContainerView continueButton];
    [v7 setTintColor:v6];

    char v8 = [(HPSSpatialProfileSingleStepBottomContainer *)self->_bottomContainerView continueButton];
    double v9 = [v8 titleLabel];
    [v9 setHidden:0];

    id v10 = [(HPSSpatialProfileSingleStepBottomContainer *)self->_bottomContainerView continueButton];
    [v10 setUserInteractionEnabled:1];

    [(HPSSpatialProfileSingeStepEnrollmentController *)self cleanUpSpinner];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[HPSSpatialProfileSingeStepEnrollmentController stopWelcomeSpinner]();
    }
  }
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
  BOOL v12 = sharedBluetoothSettingsLogComponent();
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

- (void)hideContinueButton
{
}

- (void)showContinueButton
{
}

- (void)cancelBlur
{
  [(HPSSpatialProfileSingleStepPearlEnrollView *)self->_enrollView setPauseBlur:1];
  [(HPSSpatialProfileSingleStepPearlEnrollView *)self->_enrollView setForceBlur:0];
  enrollView = self->_enrollView;

  [(HPSSpatialProfileSingleStepPearlEnrollView *)enrollView setCameraBlurAmount:0 useShade:0 duration:0.0 completion:0.5];
}

- (void)forceBlur
{
  [(HPSSpatialProfileSingleStepPearlEnrollView *)self->_enrollView setPauseBlur:0];
  [(HPSSpatialProfileSingleStepPearlEnrollView *)self->_enrollView setForceBlur:1];
  enrollView = self->_enrollView;

  [(HPSSpatialProfileSingleStepPearlEnrollView *)enrollView setCameraBlurAmount:0 useShade:0 duration:15.0 completion:0.5];
}

- (void)sendTipKitSignal
{
  uint64_t v2 = [MEMORY[0x1E4F504C8] discoverabilitySignal];
  uint64_t v3 = [v2 source];
  id v4 = objc_alloc(MEMORY[0x1E4F50318]);
  uint64_t v5 = [MEMORY[0x1E4F28B50] mainBundle];
  uint8_t v6 = [v5 bundleIdentifier];
  double v7 = (void *)[v4 initWithIdentifier:@"com.apple.HeadphoneSettings.spatial-profile-enrollment-triggered" bundleID:v6 context:0];

  [v3 sendEvent:v7];
  char v8 = sharedBluetoothSettingsLogComponent();
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

- (NSString)downloadAssetPath
{
  return self->_downloadAssetPath;
}

- (void)setDownloadAssetPath:(id)a3
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

- (NSMutableArray)cachedTransitionStates
{
  return self->_cachedTransitionStates;
}

- (void)setCachedTransitionStates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedTransitionStates, 0);
  objc_storeStrong((id *)&self->_downloadAssetPath, 0);
  objc_storeStrong(&self->dismissalHandler, 0);
  objc_storeStrong((id *)&self->_offScreenBottomContainerView, 0);
  objc_storeStrong((id *)&self->_bottomContainerView, 0);
  objc_storeStrong((id *)&self->_pillContainerView, 0);
  objc_storeStrong((id *)&self->_frameDetector, 0);
  objc_storeStrong((id *)&self->_frameContext, 0);
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
  objc_storeStrong((id *)&self->_enrollView, 0);
  objc_storeStrong((id *)&self->_soundHapticManager, 0);
  objc_storeStrong((id *)&self->_welcomeImageView, 0);
  objc_storeStrong((id *)&self->_welcomeContentView, 0);

  objc_storeStrong((id *)&self->_enrollContentView, 0);
}

void __65__HPSSpatialProfileSingeStepEnrollmentController_startEnrollment__block_invoke_cold_1()
{
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1E4BFE000, v0, v1, "Spatial Profile: Move to Step -> Default", v2, v3, v4, v5, v6);
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_syncProfile__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1E4BFE000, v0, v1, "Spatial Profile: Profile Synced", v2, v3, v4, v5, v6);
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_syncProfile__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E4BFE000, a2, OS_LOG_TYPE_ERROR, "Spatial Profile: Profile NOT Synced, Error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)getBudsInEarString
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1E4BFE000, log, OS_LOG_TYPE_ERROR, "Spatial Profile: Not Genuine Apple Headphone", buf, 2u);
}

- (void)didReceiveStateUpdateForSession:stateInfo:.cold.1()
{
}

- (void)didReceiveStateUpdateForSession:stateInfo:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1E4BFE000, v0, v1, "Spatial Profile: State Update: State Error", v2, v3, v4, v5, v6);
}

- (void)didReceiveStateUpdateForSession:stateInfo:.cold.3()
{
}

- (void)didReceiveStateUpdateForSession:(void *)a1 stateInfo:.cold.4(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1E4BFE000, v1, v2, "Spatial Profile: Fetch Completed: Error: %s, Error code: %d", v3, v4, v5, v6, 2u);
}

void __106__HPSSpatialProfileSingeStepEnrollmentController_didReceiveCaptureVideo_colorImage_depthImage_faceObject___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1E4BFE000, v0, v1, "Spatial Profile: Invalid Capture Session", v2, v3, v4, v5, v6);
}

@end