@interface CustomDetectorOnboardingController
- (BOOL)isTrainingNewDetector;
- (CustomDetectorDelegate)customDetectorDelegate;
- (CustomDetectorOnboardingController)initWithCategory:(id)a3;
- (CustomDetectorOnboardingController)initWithDetector:(id)a3;
- (DetectorInfoController)detectorInfoController;
- (LearnMoreController)learnMoreController;
- (NSString)category;
- (NSTimer)timeoutTimer;
- (NameDetectorController)nameDetectorController;
- (OBBoldTrayButton)boldButton;
- (OBBoldTrayButton)continueButton;
- (OBLinkTrayButton)linkButton;
- (OBLinkTrayButton)nameDetectorLinkButton;
- (SoundDetectionKshotTrainingAudioManager)stateManager;
- (TrainDetectorController)trainingController;
- (void)_allShotsRecorded;
- (void)_bugButtonTapped;
- (void)_cancelFromNameSound;
- (void)_cancelFromTraining;
- (void)_cancelModalFlowWithSwipe:(BOOL)a3 fromNameSoundPane:(BOOL)a4;
- (void)_continueToTraining;
- (void)_createInfoPane;
- (void)_createNameSoundPane;
- (void)_finishLater;
- (void)_finishOnboarding;
- (void)_kShotListeningStateDidChange;
- (void)_kShotModelSimilarityWarning;
- (void)_keepListening;
- (void)_keepTraining;
- (void)_setUpContinueButton:(id)a3 withSelector:(SEL)a4;
- (void)_setupLinkButtonWithTitle:(id)a3 action:(SEL)a4;
- (void)_setupTrainingControllerBoldButtonWithTitle:(id)a3 action:(SEL)a4;
- (void)_startTraining;
- (void)_timeout:(id)a3;
- (void)dealloc;
- (void)discardSoundAndKeepListening;
- (void)dismissLearnMorePane;
- (void)enterListeningState;
- (void)enterPreListeningState;
- (void)enterSavingState;
- (void)enterTimeoutState;
- (void)enterWaitingForSaveState;
- (void)enterWaitingForSoundState;
- (void)onboardNewSound;
- (void)presentLearnMorePane;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)saveComplete;
- (void)setBoldButton:(id)a3;
- (void)setCategory:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setCustomDetectorDelegate:(id)a3;
- (void)setDetectorInfoController:(id)a3;
- (void)setIsTrainingNewDetector:(BOOL)a3;
- (void)setLearnMoreController:(id)a3;
- (void)setLinkButton:(id)a3;
- (void)setNameDetectorController:(id)a3;
- (void)setNameDetectorLinkButton:(id)a3;
- (void)setStateManager:(id)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)setTrainingController:(id)a3;
- (void)stateDidUpdate:(int64_t)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CustomDetectorOnboardingController

- (CustomDetectorOnboardingController)initWithCategory:(id)a3
{
  v4 = (NSString *)a3;
  v13.receiver = self;
  v13.super_class = (Class)CustomDetectorOnboardingController;
  v5 = [(CustomDetectorOnboardingController *)&v13 init];
  v6 = v5;
  if (v5)
  {
    v5->_isTrainingNewDetector = 1;
    v5->_category = v4;
    v7 = [(CustomDetectorOnboardingController *)v5 presentationController];
    [v7 setDelegate:v6];

    id v8 = [objc_alloc((Class)AXSDKShotDetector) initWithName:&stru_20F6B8];
    [v8 setCategory:v4];
    v9 = [[SoundDetectionKshotTrainingAudioManager alloc] initWithTargetDetector:v8];
    [(CustomDetectorOnboardingController *)v6 setStateManager:v9];

    v10 = [(CustomDetectorOnboardingController *)v6 stateManager];
    [v10 setDelegate:v6];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)_kShotModelSimilarityWarning, @"com.apple.accessibility.kshot.model.similarity.warning", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v6;
}

- (CustomDetectorOnboardingController)initWithDetector:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CustomDetectorOnboardingController;
  v5 = [(CustomDetectorOnboardingController *)&v12 init];
  v6 = v5;
  if (v5)
  {
    v7 = [(CustomDetectorOnboardingController *)v5 presentationController];
    [v7 setDelegate:v6];

    id v8 = [[SoundDetectionKshotTrainingAudioManager alloc] initWithTargetDetector:v4];
    [(CustomDetectorOnboardingController *)v6 setStateManager:v8];

    v9 = [(CustomDetectorOnboardingController *)v6 stateManager];
    [v9 setDelegate:v6];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)_kShotModelSimilarityWarning, @"com.apple.accessibility.kshot.model.similarity.warning", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }

  return v6;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)CustomDetectorOnboardingController;
  [(CustomDetectorOnboardingController *)&v10 viewDidLoad];
  objc_initWeak(&location, self);
  v3 = +[AXSDSettings sharedInstance];
  id v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  v6 = __49__CustomDetectorOnboardingController_viewDidLoad__block_invoke;
  v7 = &unk_208798;
  objc_copyWeak(&v8, &location);
  [v3 registerUpdateBlock:&v4 forRetrieveSelector:"soundDetectionKShotListeningState" withListener:self];

  if ([(CustomDetectorOnboardingController *)self isTrainingNewDetector]) {
    [(CustomDetectorOnboardingController *)self _createInfoPane];
  }
  else {
    [(CustomDetectorOnboardingController *)self _startTraining];
  }
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __49__CustomDetectorOnboardingController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _kShotListeningStateDidChange];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CustomDetectorOnboardingController;
  [(CustomDetectorOnboardingController *)&v5 viewWillDisappear:a3];
  id v4 = [(CustomDetectorOnboardingController *)self stateManager];
  [v4 stopListeningAndTrainIfPossible:0];
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  id v4 = [(CustomDetectorOnboardingController *)self visibleViewController];
  objc_super v5 = [(CustomDetectorOnboardingController *)self nameDetectorController];
  id v6 = [v4 isEqual:v5];

  [(CustomDetectorOnboardingController *)self _cancelModalFlowWithSwipe:1 fromNameSoundPane:v6];
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v3 = [(CustomDetectorOnboardingController *)self customDetectorDelegate];
  [v3 exitedOnboardingFlow];
}

- (void)_createInfoPane
{
  id v3 = [(CustomDetectorOnboardingController *)self stateManager];
  id v4 = [v3 targetDetector];
  objc_super v5 = [v4 category];
  id v6 = (void *)AXSDDetectorCategoryAlarm;

  if (v5 == v6)
  {
    objc_super v12 = @"CUSTOM_ALARM";
  }
  else
  {
    v7 = [(CustomDetectorOnboardingController *)self stateManager];
    id v8 = [v7 targetDetector];
    v9 = [v8 category];
    objc_super v10 = (void *)AXSDDetectorCategoryHousehold;

    if (v9 != v10)
    {
      v23 = &stru_20F6B8;
      v11 = &stru_20F6B8;
      goto LABEL_7;
    }
    objc_super v12 = @"CUSTOM_APPLIANCE";
  }
  settingsLocString(v12, @"SoundDetection");
  v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_super v13 = AXLocStringKeyForModel();
  settingsLocString(v13, @"SoundDetection");
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  v14 = [[DetectorInfoController alloc] initWithTitle:v23 detailText:v11 symbolName:0];
  detectorInfoController = self->_detectorInfoController;
  self->_detectorInfoController = v14;

  id v16 = objc_alloc((Class)UIBarButtonItem);
  v17 = settingsLocString(@"CANCEL_BUTTON", @"SoundDetection");
  id v18 = [v16 initWithTitle:v17 style:0 target:self action:"_finishLater"];
  v19 = [(CustomDetectorOnboardingController *)self detectorInfoController];
  v20 = [v19 navigationItem];
  [v20 setRightBarButtonItem:v18];

  v21 = [(CustomDetectorOnboardingController *)self detectorInfoController];
  [(CustomDetectorOnboardingController *)self _setUpContinueButton:v21 withSelector:"_createNameSoundPane"];

  v22 = [(CustomDetectorOnboardingController *)self detectorInfoController];
  [(CustomDetectorOnboardingController *)self pushViewController:v22 animated:1];
}

- (void)_createNameSoundPane
{
  settingsLocString(@"NAME_SOUND_TITLE", @"SoundDetection");
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = settingsLocString(@"NAME_SOUND_SUBTITLE", @"SoundDetection");
  id v4 = [(CustomDetectorOnboardingController *)self stateManager];
  objc_super v5 = [v4 targetDetector];
  id v6 = [v5 category];
  v7 = (void *)AXSDDetectorCategoryAlarm;

  if (v6 == v7)
  {
    objc_super v12 = @"CUSTOM_ALARM_NAME";
    objc_super v13 = @"CUSTOM_ALARM";
  }
  else
  {
    id v8 = [(CustomDetectorOnboardingController *)self stateManager];
    v9 = [v8 targetDetector];
    objc_super v10 = [v9 category];
    v11 = (void *)AXSDDetectorCategoryHousehold;

    if (v10 != v11) {
      goto LABEL_6;
    }
    objc_super v12 = @"CUSTOM_APPLIANCE_NAME";
    objc_super v13 = @"CUSTOM_APPLIANCE";
  }
  uint64_t v14 = settingsLocString(v13, @"SoundDetection");

  uint64_t v15 = settingsLocString(v12, @"SoundDetection");

  id v27 = (id)v14;
  id v3 = (void *)v15;
LABEL_6:
  id v16 = [[NameDetectorController alloc] initWithTitle:v27 detailText:v3 symbolName:0];
  nameDetectorController = self->_nameDetectorController;
  self->_nameDetectorController = v16;

  id v18 = [(CustomDetectorOnboardingController *)self nameDetectorController];
  [v18 setDelegate:self];

  v19 = [(CustomDetectorOnboardingController *)self nameDetectorController];
  [v19 setModalInPresentation:1];

  v20 = [(CustomDetectorOnboardingController *)self nameDetectorController];
  [(CustomDetectorOnboardingController *)self _setUpContinueButton:v20 withSelector:"_continueToTraining"];

  id v21 = objc_alloc((Class)UIBarButtonItem);
  v22 = settingsLocString(@"CANCEL_BUTTON", @"SoundDetection");
  id v23 = [v21 initWithTitle:v22 style:0 target:self action:"_cancelFromNameSound"];
  v24 = [(CustomDetectorOnboardingController *)self nameDetectorController];
  v25 = [v24 navigationItem];
  [v25 setRightBarButtonItem:v23];

  v26 = [(CustomDetectorOnboardingController *)self nameDetectorController];
  [(CustomDetectorOnboardingController *)self pushViewController:v26 animated:1];
}

- (void)_continueToTraining
{
  id v3 = [(CustomDetectorOnboardingController *)self nameDetectorController];
  id v4 = [v3 detectorNameTextField];
  objc_super v5 = [v4 text];
  id v6 = [(CustomDetectorOnboardingController *)self stateManager];
  v7 = [v6 targetDetector];
  [v7 setName:v5];

  id v8 = [(CustomDetectorOnboardingController *)self stateManager];
  v9 = [v8 targetDetector];
  objc_super v10 = [v9 name];
  id v11 = [v10 length];

  if (!v11)
  {
    objc_super v12 = settingsLocString(@"CUSTOM_SOUND_PLACEHOLDER", @"SoundDetection");
    objc_super v13 = [(CustomDetectorOnboardingController *)self stateManager];
    uint64_t v14 = [v13 targetDetector];
    [v14 setName:v12];
  }
  uint64_t v15 = +[AXSDSettings sharedInstance];
  id v16 = [(CustomDetectorOnboardingController *)self stateManager];
  v17 = [v16 targetDetector];
  [v15 addKShotDetector:v17];

  if (!self->_nameDetectorLinkButton)
  {
    id v18 = +[OBLinkTrayButton linkButton];
    nameDetectorLinkButton = self->_nameDetectorLinkButton;
    self->_nameDetectorLinkButton = v18;

    v20 = [(CustomDetectorOnboardingController *)self nameDetectorLinkButton];
    id v21 = settingsLocString(@"FINISH_LATER", @"SoundDetection");
    [v20 setTitle:v21 forState:0];

    v22 = [(CustomDetectorOnboardingController *)self nameDetectorLinkButton];
    [v22 addTarget:self action:"_cancelFromNameSound" forControlEvents:64];

    id v23 = [(CustomDetectorOnboardingController *)self nameDetectorController];
    v24 = [v23 buttonTray];
    v25 = [(CustomDetectorOnboardingController *)self nameDetectorLinkButton];
    [v24 addButton:v25];
  }

  [(CustomDetectorOnboardingController *)self _startTraining];
}

- (void)_startTraining
{
  AXLocStringKeyForModel();
  id v35 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = settingsLocString(@"SET_UP", @"SoundDetection");
  id v4 = [(CustomDetectorOnboardingController *)self stateManager];
  objc_super v5 = [v4 targetDetector];
  id v6 = [v5 name];
  v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v3, v6);

  id v8 = [TrainDetectorController alloc];
  v9 = settingsLocString(v35, @"SoundDetection");
  objc_super v10 = [(TrainDetectorController *)v8 initWithTitle:v7 detailText:v9 symbolName:0];
  trainingController = self->_trainingController;
  self->_trainingController = v10;

  objc_super v12 = [(CustomDetectorOnboardingController *)self trainingController];
  [v12 setModalInPresentation:1];

  objc_super v13 = [(CustomDetectorOnboardingController *)self trainingController];
  [v13 setLearnMoreDelegate:self];

  uint64_t v14 = [(CustomDetectorOnboardingController *)self stateManager];
  uint64_t v15 = [v14 targetDetector];
  id v16 = [v15 category];
  v17 = [(CustomDetectorOnboardingController *)self trainingController];
  [v17 setCategory:v16];

  id v18 = objc_alloc((Class)UIBarButtonItem);
  v19 = settingsLocString(@"CANCEL_BUTTON", @"SoundDetection");
  id v20 = [v18 initWithTitle:v19 style:0 target:self action:"_cancelFromTraining"];
  id v21 = [(CustomDetectorOnboardingController *)self trainingController];
  v22 = [v21 navigationItem];
  [v22 setRightBarButtonItem:v20];

  if (AXIsInternalInstall())
  {
    id v23 = +[UIImage systemImageNamed:@"ant.circle.fill"];
    v24 = +[UIColor systemBlueColor];
    v25 = [v23 imageWithTintColor:v24];
    v26 = +[UIButton systemButtonWithImage:v25 target:self action:"_bugButtonTapped"];

    id v27 = [(CustomDetectorOnboardingController *)self trainingController];
    v28 = [v27 navigationItem];
    [v28 setTitleView:v26];
  }
  linkButton = self->_linkButton;
  self->_linkButton = 0;

  boldButton = self->_boldButton;
  self->_boldButton = 0;

  v31 = settingsLocString(@"START_LISTENING_BUTTON", @"SoundDetection");
  [(CustomDetectorOnboardingController *)self _setupTrainingControllerBoldButtonWithTitle:v31 action:"enterWaitingForSoundState"];

  v32 = settingsLocString(@"FINISH_LATER", @"SoundDetection");
  [(CustomDetectorOnboardingController *)self _setupLinkButtonWithTitle:v32 action:"_finishLater"];

  v33 = [(CustomDetectorOnboardingController *)self trainingController];
  [(CustomDetectorOnboardingController *)self pushViewController:v33 animated:1];

  [(SoundDetectionKshotTrainingAudioManager *)self->_stateManager startListening];
  v34 = +[AXSDSettings sharedInstance];
  [v34 setSoundDetectionKShotListeningState:0];
}

- (void)_cancelFromTraining
{
}

- (void)_cancelFromNameSound
{
}

- (void)_cancelModalFlowWithSwipe:(BOOL)a3 fromNameSoundPane:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7 = [(CustomDetectorOnboardingController *)self stateManager];
  if ([v7 state])
  {
    id v8 = [(CustomDetectorOnboardingController *)self stateManager];
    v9 = (char *)[v8 state];

    BOOL v10 = v9 == (unsigned char *)&dword_4 + 2;
    int v11 = !v5;
    if (v9 == (unsigned char *)&dword_4 + 2) {
      int v11 = 1;
    }
    if (v11) {
      objc_super v12 = @"CANCEL_CONFIRMATION";
    }
    else {
      objc_super v12 = @"FINISH_LATER_CONFIRMATION";
    }
  }
  else
  {

    BOOL v10 = 1;
    objc_super v12 = @"CANCEL_CONFIRMATION";
  }
  objc_super v13 = settingsLocString(v12, @"SoundDetection");
  uint64_t v14 = +[UIAlertController alertControllerWithTitle:0 message:v13 preferredStyle:0];
  if (v10)
  {
    uint64_t v15 = settingsLocString(@"DISCARD_CHANGES", @"SoundDetection");
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = __82__CustomDetectorOnboardingController__cancelModalFlowWithSwipe_fromNameSoundPane___block_invoke;
    v30[3] = &unk_208B68;
    v30[4] = self;
    id v16 = +[UIAlertAction actionWithTitle:v15 style:2 handler:v30];
    [v14 addAction:v16];

    if (v4) {
      v17 = @"KEEP_EDITING";
    }
    else {
      v17 = @"KEEP_LISTENING";
    }
    id v18 = settingsLocString(v17, @"SoundDetection");
    v19 = &__block_literal_global_69;
  }
  else if (v5)
  {
    id v20 = settingsLocString(@"FINISH_LATER", @"SoundDetection");
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = __82__CustomDetectorOnboardingController__cancelModalFlowWithSwipe_fromNameSoundPane___block_invoke_4;
    v29[3] = &unk_208B68;
    v29[4] = self;
    id v21 = +[UIAlertAction actionWithTitle:v20 style:0 handler:v29];
    [v14 addAction:v21];

    id v18 = settingsLocString(@"KEEP_LISTENING", @"SoundDetection");
    v19 = &__block_literal_global_373_0;
  }
  else
  {
    v22 = settingsLocString(@"DISCARD_CHANGES", @"SoundDetection");
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = __82__CustomDetectorOnboardingController__cancelModalFlowWithSwipe_fromNameSoundPane___block_invoke_6;
    v28[3] = &unk_208B68;
    v28[4] = self;
    id v23 = +[UIAlertAction actionWithTitle:v22 style:2 handler:v28];
    [v14 addAction:v23];

    v24 = settingsLocString(@"SAVE_PROGRESS", @"SoundDetection");
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = __82__CustomDetectorOnboardingController__cancelModalFlowWithSwipe_fromNameSoundPane___block_invoke_8;
    v27[3] = &unk_208B68;
    v27[4] = self;
    v25 = +[UIAlertAction actionWithTitle:v24 style:0 handler:v27];
    [v14 addAction:v25];

    id v18 = settingsLocString(@"KEEP_LISTENING", @"SoundDetection");
    v19 = &__block_literal_global_378;
  }
  v26 = +[UIAlertAction actionWithTitle:v18 style:1 handler:v19];
  [v14 addAction:v26];

  [(CustomDetectorOnboardingController *)self presentViewController:v14 animated:1 completion:0];
}

id __82__CustomDetectorOnboardingController__cancelModalFlowWithSwipe_fromNameSoundPane___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __82__CustomDetectorOnboardingController__cancelModalFlowWithSwipe_fromNameSoundPane___block_invoke_2;
  v3[3] = &unk_2087C0;
  v3[4] = v1;
  return [v1 dismissViewControllerAnimated:1 completion:v3];
}

void __82__CustomDetectorOnboardingController__cancelModalFlowWithSwipe_fromNameSoundPane___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) stateManager];
  [v2 stopListeningAndTrainIfPossible:0];

  id v5 = [*(id *)(a1 + 32) customDetectorDelegate];
  id v3 = [*(id *)(a1 + 32) stateManager];
  BOOL v4 = [v3 targetDetector];
  [v5 cancelCustomDetectorTrainingForTarget:v4];
}

id __82__CustomDetectorOnboardingController__cancelModalFlowWithSwipe_fromNameSoundPane___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishLater];
}

id __82__CustomDetectorOnboardingController__cancelModalFlowWithSwipe_fromNameSoundPane___block_invoke_6(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __82__CustomDetectorOnboardingController__cancelModalFlowWithSwipe_fromNameSoundPane___block_invoke_7;
  v3[3] = &unk_2087C0;
  v3[4] = v1;
  return [v1 dismissViewControllerAnimated:1 completion:v3];
}

void __82__CustomDetectorOnboardingController__cancelModalFlowWithSwipe_fromNameSoundPane___block_invoke_7(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) stateManager];
  [v2 stopListeningAndTrainIfPossible:0];

  id v5 = [*(id *)(a1 + 32) customDetectorDelegate];
  id v3 = [*(id *)(a1 + 32) stateManager];
  BOOL v4 = [v3 targetDetector];
  [v5 cancelCustomDetectorTrainingForTarget:v4];
}

id __82__CustomDetectorOnboardingController__cancelModalFlowWithSwipe_fromNameSoundPane___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishLater];
}

- (void)_finishOnboarding
{
  id v3 = [(CustomDetectorOnboardingController *)self customDetectorDelegate];
  [v3 exitedOnboardingFlow];

  BOOL v4 = [(CustomDetectorOnboardingController *)self timeoutTimer];
  [v4 invalidate];

  [(CustomDetectorOnboardingController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)_finishLater
{
  id v3 = [(CustomDetectorOnboardingController *)self stateManager];
  [v3 stopListeningAndTrainIfPossible:0];

  BOOL v4 = [(CustomDetectorOnboardingController *)self timeoutTimer];
  [v4 invalidate];

  id v5 = [(CustomDetectorOnboardingController *)self customDetectorDelegate];
  [v5 exitedOnboardingFlow];

  [(CustomDetectorOnboardingController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)enterWaitingForSoundState
{
  id v3 = [(CustomDetectorOnboardingController *)self boldButton];
  [v3 setHidden:1];

  BOOL v4 = [(CustomDetectorOnboardingController *)self trainingController];
  [v4 enterWaitingForSoundState];

  id v5 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_timeout:" selector:0 userInfo:0 repeats:30.0];
  [(CustomDetectorOnboardingController *)self setTimeoutTimer:v5];
}

- (void)enterPreListeningState
{
  id v3 = settingsLocString(@"FINISH_LATER", @"SoundDetection");
  [(CustomDetectorOnboardingController *)self _setupLinkButtonWithTitle:v3 action:"_finishLater"];

  BOOL v4 = settingsLocString(@"START_LISTENING_BUTTON", @"SoundDetection");
  [(CustomDetectorOnboardingController *)self _setupTrainingControllerBoldButtonWithTitle:v4 action:"enterWaitingForSoundState"];

  id v5 = [(CustomDetectorOnboardingController *)self boldButton];
  [v5 setEnabled:1];

  id v6 = [(CustomDetectorOnboardingController *)self trainingController];
  [v6 enterPreListeningState];
}

- (void)_timeout:(id)a3
{
  BOOL v4 = [(CustomDetectorOnboardingController *)self timeoutTimer];
  [v4 invalidate];

  [(CustomDetectorOnboardingController *)self setTimeoutTimer:0];
  id v5 = +[AXSDSettings sharedInstance];
  [v5 setSoundDetectionKShotListeningState:5];
}

- (void)enterTimeoutState
{
  if ([(CustomDetectorOnboardingController *)self isTrainingNewDetector])
  {
    id v3 = settingsLocString(@"DIFFERENT_SOUND_BUTTON", @"SoundDetection");
    [(CustomDetectorOnboardingController *)self _setupTrainingControllerBoldButtonWithTitle:v3 action:"onboardNewSound"];
  }
  BOOL v4 = settingsLocString(@"IGNORE_KEEP_LISTENING", @"SoundDetection");
  [(CustomDetectorOnboardingController *)self _setupLinkButtonWithTitle:v4 action:"_keepListening"];

  id v5 = [(CustomDetectorOnboardingController *)self trainingController];
  [v5 enterTimeoutState];
}

- (void)presentLearnMorePane
{
  id v3 = [LearnMoreController alloc];
  BOOL v4 = settingsLocString(@"LEARN_MORE_TITLE", @"SoundDetection");
  id v5 = [(LearnMoreController *)v3 initWithTitle:v4];
  learnMoreController = self->_learnMoreController;
  self->_learnMoreController = v5;

  v7 = [(CustomDetectorOnboardingController *)self learnMoreController];
  [(CustomDetectorOnboardingController *)self _setUpContinueButton:v7 withSelector:"dismissLearnMorePane"];

  id v8 = [(CustomDetectorOnboardingController *)self learnMoreController];
  [(CustomDetectorOnboardingController *)self presentViewController:v8 animated:1 completion:0];
}

- (void)dismissLearnMorePane
{
  id v2 = [(CustomDetectorOnboardingController *)self learnMoreController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)onboardNewSound
{
  id v3 = +[AXSDSettings sharedInstance];
  BOOL v4 = [(CustomDetectorOnboardingController *)self stateManager];
  id v5 = [v4 targetDetector];
  [v3 deleteTrainingFilesForDetector:v5];

  id v6 = [(CustomDetectorOnboardingController *)self popViewControllerAnimated:1];
  id v8 = [(CustomDetectorOnboardingController *)self nameDetectorController];
  v7 = [v8 detectorNameTextField];
  [v7 setText:&stru_20F6B8];
}

- (void)enterListeningState
{
  id v3 = [(CustomDetectorOnboardingController *)self trainingController];
  BOOL v4 = [(CustomDetectorOnboardingController *)self stateManager];
  objc_msgSend(v3, "enterListeningStateWithCheckmarkIndex:", objc_msgSend(v4, "state"));

  id v5 = settingsLocString(@"FINISH_LATER", @"SoundDetection");
  [(CustomDetectorOnboardingController *)self _setupLinkButtonWithTitle:v5 action:"_finishLater"];

  id v6 = [(CustomDetectorOnboardingController *)self boldButton];
  [v6 setHidden:1];
}

- (void)enterWaitingForSaveState
{
  id v3 = [(CustomDetectorOnboardingController *)self trainingController];
  BOOL v4 = [(CustomDetectorOnboardingController *)self stateManager];
  objc_msgSend(v3, "enterWaitingForSaveState:", objc_msgSend(v4, "state"));

  id v5 = settingsLocString(@"IGNORE_KEEP_LISTENING", @"SoundDetection");
  [(CustomDetectorOnboardingController *)self _setupLinkButtonWithTitle:v5 action:"discardSoundAndKeepListening"];

  settingsLocString(@"SAVE_SOUND", @"SoundDetection");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(CustomDetectorOnboardingController *)self _setupTrainingControllerBoldButtonWithTitle:v6 action:"enterSavingState"];
}

- (void)enterSavingState
{
  id v3 = +[AXSDSettings sharedInstance];
  [v3 setKShotShouldSaveCurrentSound:1];

  BOOL v4 = [(CustomDetectorOnboardingController *)self trainingController];
  id v5 = [(CustomDetectorOnboardingController *)self stateManager];
  objc_msgSend(v4, "enterSavingStateWithCheckmarkIndex:", objc_msgSend(v5, "state"));

  id v6 = settingsLocString(@"START_LISTENING_BUTTON", @"SoundDetection");
  [(CustomDetectorOnboardingController *)self _setupTrainingControllerBoldButtonWithTitle:v6 action:"enterWaitingForSoundState"];

  v7 = settingsLocString(@"FINISH_LATER", @"SoundDetection");
  [(CustomDetectorOnboardingController *)self _setupLinkButtonWithTitle:v7 action:"_finishLater"];

  id v8 = [(CustomDetectorOnboardingController *)self boldButton];
  [v8 setEnabled:0];
}

- (void)saveComplete
{
  id v2 = +[AXSDSettings sharedInstance];
  [v2 setSoundDetectionKShotListeningState:0];
}

- (void)discardSoundAndKeepListening
{
  id v3 = +[AXSDSettings sharedInstance];
  [v3 setKShotShouldSaveCurrentSound:0];

  BOOL v4 = [(CustomDetectorOnboardingController *)self trainingController];
  id v5 = [(CustomDetectorOnboardingController *)self stateManager];
  objc_msgSend(v4, "resetCheckmarkIndex:", objc_msgSend(v5, "state"));

  [(CustomDetectorOnboardingController *)self _keepListening];
}

- (void)_keepListening
{
  [(CustomDetectorOnboardingController *)self enterWaitingForSoundState];
  settingsLocString(@"FINISH_LATER", @"SoundDetection");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(CustomDetectorOnboardingController *)self _setupLinkButtonWithTitle:v3 action:"_finishLater"];
}

- (void)_keepTraining
{
  id v3 = [(CustomDetectorOnboardingController *)self stateManager];
  [v3 updateState];

  BOOL v4 = [(CustomDetectorOnboardingController *)self trainingController];
  id v5 = [(CustomDetectorOnboardingController *)self stateManager];
  objc_msgSend(v4, "resetCheckmarkIndex:", objc_msgSend(v5, "state"));

  id v6 = +[AXSDSettings sharedInstance];
  [v6 setSoundDetectionKShotListeningState:0];
}

- (void)_allShotsRecorded
{
  id v3 = [(CustomDetectorOnboardingController *)self linkButton];
  [v3 setHidden:1];

  BOOL v4 = [(CustomDetectorOnboardingController *)self trainingController];
  [v4 enterDoneState];

  id v5 = settingsLocString(@"DONE_BUTTON", @"SoundDetection");
  [(CustomDetectorOnboardingController *)self _setupTrainingControllerBoldButtonWithTitle:v5 action:"_finishOnboarding"];

  id v6 = [(CustomDetectorOnboardingController *)self boldButton];
  [v6 setEnabled:1];

  id v7 = [(CustomDetectorOnboardingController *)self stateManager];
  [v7 stopListeningAndTrainIfPossible:1];
}

- (void)_kShotModelSimilarityWarning
{
  id v3 = settingsLocString(@"DIFFERENT_SOUND_BUTTON", @"SoundDetection");
  [(CustomDetectorOnboardingController *)self _setupTrainingControllerBoldButtonWithTitle:v3 action:"onboardNewSound"];

  BOOL v4 = settingsLocString(@"IGNORE_KEEP_LISTENING", @"SoundDetection");
  [(CustomDetectorOnboardingController *)self _setupLinkButtonWithTitle:v4 action:"_keepTraining"];

  id v5 = +[AXSDSettings sharedInstance];
  [v5 setSoundDetectionKShotListeningState:6];

  id v7 = [(CustomDetectorOnboardingController *)self trainingController];
  id v6 = [(CustomDetectorOnboardingController *)self stateManager];
  objc_msgSend(v7, "enterModelSimilarityWarningState:", objc_msgSend(v6, "state"));
}

- (void)_kShotListeningStateDidChange
{
  id v3 = +[AXSDSettings sharedInstance];
  id v4 = [v3 soundDetectionKShotListeningState];

  switch((unint64_t)v4)
  {
    case 0uLL:
      [(CustomDetectorOnboardingController *)self enterPreListeningState];
      break;
    case 2uLL:
      [(CustomDetectorOnboardingController *)self enterListeningState];
      id v5 = [(CustomDetectorOnboardingController *)self timeoutTimer];
      [v5 invalidate];

      break;
    case 3uLL:
      [(CustomDetectorOnboardingController *)self enterWaitingForSaveState];
      break;
    case 4uLL:
      [(CustomDetectorOnboardingController *)self saveComplete];
      break;
    case 5uLL:
      [(CustomDetectorOnboardingController *)self enterTimeoutState];
      break;
    default:
      return;
  }
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v5.receiver = self;
  v5.super_class = (Class)CustomDetectorOnboardingController;
  [(CustomDetectorOnboardingController *)&v5 dealloc];
}

- (void)stateDidUpdate:(int64_t)a3
{
}

void __53__CustomDetectorOnboardingController_stateDidUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) trainingController];
  [v2 updateProgressToState:*(void *)(a1 + 40)];

  uint64_t v3 = *(void *)(a1 + 40);
  if (v3 != 6)
  {
    if (v3 == 5)
    {
      id v4 = *(void **)(a1 + 32);
      [v4 _allShotsRecorded];
    }
    else
    {
      id v5 = +[AXSDSettings sharedInstance];
      [v5 setSoundDetectionKShotListeningState:4];
    }
  }
}

- (void)_setupLinkButtonWithTitle:(id)a3 action:(SEL)a4
{
  if (self->_linkButton)
  {
    id v6 = a3;
    id v7 = [(CustomDetectorOnboardingController *)self linkButton];
    [v7 removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];

    id v8 = [(CustomDetectorOnboardingController *)self linkButton];
    [v8 setTitle:v6 forState:0];

    id v16 = [(CustomDetectorOnboardingController *)self linkButton];
    [v16 addTarget:self action:a4 forControlEvents:64];
  }
  else
  {
    id v9 = a3;
    BOOL v10 = +[OBLinkTrayButton linkButton];
    linkButton = self->_linkButton;
    self->_linkButton = v10;

    objc_super v12 = [(CustomDetectorOnboardingController *)self linkButton];
    [v12 setTitle:v9 forState:0];

    objc_super v13 = [(CustomDetectorOnboardingController *)self linkButton];
    [v13 addTarget:self action:a4 forControlEvents:64];

    id v16 = [(CustomDetectorOnboardingController *)self trainingController];
    uint64_t v14 = [v16 buttonTray];
    uint64_t v15 = [(CustomDetectorOnboardingController *)self linkButton];
    [v14 addButton:v15];
  }
}

- (void)_setupTrainingControllerBoldButtonWithTitle:(id)a3 action:(SEL)a4
{
  if (self->_boldButton)
  {
    id v6 = a3;
    id v7 = [(CustomDetectorOnboardingController *)self boldButton];
    [v7 removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];

    id v8 = [(CustomDetectorOnboardingController *)self boldButton];
    [v8 setTitle:v6 forState:0];

    id v9 = [(CustomDetectorOnboardingController *)self boldButton];
    [v9 addTarget:self action:a4 forControlEvents:64];

    BOOL v10 = [(CustomDetectorOnboardingController *)self boldButton];
    [v10 setHidden:0];

    id v18 = [(CustomDetectorOnboardingController *)self boldButton];
    [v18 setEnabled:1];
  }
  else
  {
    id v11 = a3;
    objc_super v12 = +[OBBoldTrayButton boldButton];
    boldButton = self->_boldButton;
    self->_boldButton = v12;

    uint64_t v14 = [(CustomDetectorOnboardingController *)self boldButton];
    [v14 setTitle:v11 forState:0];

    uint64_t v15 = [(CustomDetectorOnboardingController *)self boldButton];
    [v15 addTarget:self action:a4 forControlEvents:64];

    id v18 = [(CustomDetectorOnboardingController *)self trainingController];
    id v16 = [v18 buttonTray];
    v17 = [(CustomDetectorOnboardingController *)self boldButton];
    [v16 addButton:v17];
  }
}

- (void)_setUpContinueButton:(id)a3 withSelector:(SEL)a4
{
  id v6 = a3;
  id v7 = +[OBBoldTrayButton boldButton];
  continueButton = self->_continueButton;
  self->_continueButton = v7;

  id v9 = [(CustomDetectorOnboardingController *)self continueButton];
  BOOL v10 = settingsLocString(@"CONTINUE_BUTTON", @"SoundDetection");
  [v9 setTitle:v10 forState:0];

  id v11 = [(CustomDetectorOnboardingController *)self continueButton];
  [v11 addTarget:self action:a4 forControlEvents:64];

  id v13 = [v6 buttonTray];

  objc_super v12 = [(CustomDetectorOnboardingController *)self continueButton];
  [v13 addButton:v12];
}

- (void)_bugButtonTapped
{
  uint64_t v3 = settingsLocString(@"TTR_ALERT_TITLE", @"SoundDetection");
  id v4 = settingsLocString(@"TTR_ALERT_MESSAGE", @"SoundDetection");
  id v5 = +[UIAlertController alertControllerWithTitle:v3 message:v4 preferredStyle:1];

  id v6 = settingsLocString(@"TTR_CONTINUE_TITLE", @"SoundDetection");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __54__CustomDetectorOnboardingController__bugButtonTapped__block_invoke;
  v10[3] = &unk_208B68;
  v10[4] = self;
  id v7 = +[UIAlertAction actionWithTitle:v6 style:0 handler:v10];

  [v5 addAction:v7];
  id v8 = settingsLocString(@"TTR_CANCEL_TITLE", @"SoundDetection");
  id v9 = +[UIAlertAction actionWithTitle:v8 style:1 handler:&__block_literal_global_432];

  [v5 addAction:v9];
  [(CustomDetectorOnboardingController *)self presentViewController:v5 animated:1 completion:0];
}

void __54__CustomDetectorOnboardingController__bugButtonTapped__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) stateManager];
  v1 = [v2 targetDetector];
  AXSDKShotGatherFilesAndGenerateRadarForDetector();
}

- (CustomDetectorDelegate)customDetectorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customDetectorDelegate);

  return (CustomDetectorDelegate *)WeakRetained;
}

- (void)setCustomDetectorDelegate:(id)a3
{
}

- (DetectorInfoController)detectorInfoController
{
  return self->_detectorInfoController;
}

- (void)setDetectorInfoController:(id)a3
{
}

- (NameDetectorController)nameDetectorController
{
  return self->_nameDetectorController;
}

- (void)setNameDetectorController:(id)a3
{
}

- (TrainDetectorController)trainingController
{
  return self->_trainingController;
}

- (void)setTrainingController:(id)a3
{
}

- (LearnMoreController)learnMoreController
{
  return self->_learnMoreController;
}

- (void)setLearnMoreController:(id)a3
{
}

- (OBBoldTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
}

- (OBLinkTrayButton)linkButton
{
  return self->_linkButton;
}

- (void)setLinkButton:(id)a3
{
}

- (OBLinkTrayButton)nameDetectorLinkButton
{
  return self->_nameDetectorLinkButton;
}

- (void)setNameDetectorLinkButton:(id)a3
{
}

- (OBBoldTrayButton)boldButton
{
  return self->_boldButton;
}

- (void)setBoldButton:(id)a3
{
}

- (SoundDetectionKshotTrainingAudioManager)stateManager
{
  return self->_stateManager;
}

- (void)setStateManager:(id)a3
{
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (BOOL)isTrainingNewDetector
{
  return self->_isTrainingNewDetector;
}

- (void)setIsTrainingNewDetector:(BOOL)a3
{
  self->_isTrainingNewDetector = a3;
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  self->_category = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_stateManager, 0);
  objc_storeStrong((id *)&self->_boldButton, 0);
  objc_storeStrong((id *)&self->_nameDetectorLinkButton, 0);
  objc_storeStrong((id *)&self->_linkButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_learnMoreController, 0);
  objc_storeStrong((id *)&self->_trainingController, 0);
  objc_storeStrong((id *)&self->_nameDetectorController, 0);
  objc_storeStrong((id *)&self->_detectorInfoController, 0);

  objc_destroyWeak((id *)&self->_customDetectorDelegate);
}

@end