@interface HMHearingAidEnrollmentViewController
- (HMHearingAidEnrollmentViewController)initWithBluetoothUUID:(id)a3 withAudiogramSample:(id)a4;
- (HMHearingAidEnrollmentViewController)initWithDeviceAddress:(id)a3 withAudiogramSample:(id)a4;
- (HearingAidEnrollmentDelegate)hearingAidEnrollmentDelegate;
- (id)_cancelButtonBarButton;
- (id)getInvalidAudiograms;
- (id)getValidAudiograms;
- (void)completeStep:(int)a3;
- (void)dismissHearingAidEnrollment;
- (void)enrollHearingAid;
- (void)initAudiogramSample:(id)a3;
- (void)initHearingModeService;
- (void)moveToStep:(int)a3;
- (void)selectAudiogram:(id)a3;
- (void)setHearingAidEnrollmentDelegate:(id)a3;
- (void)showInstructionForUse;
- (void)updateAudiograms:(id)a3 invalidAudiograms:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HMHearingAidEnrollmentViewController

- (HMHearingAidEnrollmentViewController)initWithBluetoothUUID:(id)a3 withAudiogramSample:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    NSLog(&cfstr_HearingAidInit.isa, v7);
    v15.receiver = self;
    v15.super_class = (Class)HMHearingAidEnrollmentViewController;
    v9 = [(HMHearingAidEnrollmentViewController *)&v15 initWithTitle:@"Hearing Aid Enrollment" detailText:0 icon:0];
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_uuid, a3);
      uint64_t v11 = +[HearingAidUtils getBluetoothDeviceFromAddressOrUUID:v7];
      device = v10->_device;
      v10->_device = (BluetoothDevice *)v11;

      [(HMHearingAidEnrollmentViewController *)v10 initAudiogramSample:v8];
    }
    self = v10;
    v13 = self;
  }
  else
  {
    NSLog(&cfstr_HearingAidCann.isa);
    v13 = 0;
  }

  return v13;
}

- (HMHearingAidEnrollmentViewController)initWithDeviceAddress:(id)a3 withAudiogramSample:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v6];

  if (v8)
  {
    v9 = [(HMHearingAidEnrollmentViewController *)self initWithBluetoothUUID:v6 withAudiogramSample:v7];
  }
  else
  {
    if (!v6)
    {
      NSLog(&cfstr_HearingAidCann_0.isa);
      objc_super v15 = 0;
      goto LABEL_8;
    }
    NSLog(&cfstr_HearingAidInit_0.isa, v6);
    v17.receiver = self;
    v17.super_class = (Class)HMHearingAidEnrollmentViewController;
    v10 = [(HMHearingAidEnrollmentViewController *)&v17 initWithTitle:@"Hearing Aid Enrollment" detailText:0 icon:0];
    if (v10)
    {
      uint64_t v11 = [v6 stringByReplacingOccurrencesOfString:@"-" withString:@":"];
      address = v10->_address;
      v10->_address = (NSString *)v11;

      uint64_t v13 = +[HearingAidUtils getBluetoothDeviceFromAddressOrUUID:v6];
      device = v10->_device;
      v10->_device = (BluetoothDevice *)v13;

      [(HMHearingAidEnrollmentViewController *)v10 initAudiogramSample:v7];
    }
    v9 = v10;
  }
  self = v9;
  objc_super v15 = v9;
LABEL_8:

  return v15;
}

- (void)initAudiogramSample:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    NSLog(&cfstr_HearingAidAudi.isa);
    v4 = (HKAudiogramSample *)v7;
    selectedAudiogram = self->_selectedAudiogram;
    self->_selectedAudiogram = v4;
    BOOL v6 = 1;
  }
  else
  {
    NSLog(&cfstr_HearingAidAudi_0.isa);
    BOOL v6 = 0;
    selectedAudiogram = self->_selectedAudiogram;
    self->_selectedAudiogram = 0;
  }

  self->audiogramPassedIn = v6;
  [(HMHearingAidEnrollmentViewController *)self initHearingModeService];
}

- (void)initHearingModeService
{
  NSLog(&cfstr_HearingAidInit_1.isa, a2);
  v3 = (HMServiceClient *)objc_alloc_init(MEMORY[0x263F472F8]);
  hearingModeClient = self->_hearingModeClient;
  self->_hearingModeClient = v3;

  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__HMHearingAidEnrollmentViewController_initHearingModeService__block_invoke;
  v8[3] = &unk_265366050;
  objc_copyWeak(&v9, &location);
  [(HMServiceClient *)self->_hearingModeClient setAudiogramsAvailableHandler:v8];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__HMHearingAidEnrollmentViewController_initHearingModeService__block_invoke_2;
  v7[3] = &unk_265366078;
  v7[4] = self;
  [(HMServiceClient *)self->_hearingModeClient setDeviceRecordChangedHandler:v7];
  v5 = self->_hearingModeClient;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__HMHearingAidEnrollmentViewController_initHearingModeService__block_invoke_3;
  v6[3] = &unk_2653660A0;
  v6[4] = self;
  [(HMServiceClient *)v5 activateWithCompletion:v6];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __62__HMHearingAidEnrollmentViewController_initHearingModeService__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v9 = a2;
  id v7 = a3;
  if (a4)
  {
    NSLog(&cfstr_HearingAidCann_1.isa);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained updateAudiograms:v9 invalidAudiograms:v7];
  }
}

void __62__HMHearingAidEnrollmentViewController_initHearingModeService__block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  NSLog(&cfstr_HearingAidDevi.isa, v11);
  v3 = *(void **)(*(void *)(a1 + 32) + 1184);
  v4 = [v11 bluetoothAddress];
  if ([v3 isEqualToString:v4])
  {
  }
  else
  {
    v5 = *(void **)(*(void *)(a1 + 32) + 1192);
    BOOL v6 = [v11 bluetoothUUID];
    LODWORD(v5) = [v5 isEqualToString:v6];

    if (!v5) {
      goto LABEL_5;
    }
  }
  id v7 = [v11 bluetoothUUID];
  NSLog(&cfstr_HearingAidUpda.isa, v7);

  uint64_t v8 = [v11 bluetoothUUID];
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(void **)(v9 + 1208);
  *(void *)(v9 + 1208) = v8;

LABEL_5:
}

void __62__HMHearingAidEnrollmentViewController_initHearingModeService__block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSLog(&cfstr_HearingAidFail.isa, a2);
    [*(id *)(*(void *)(a1 + 32) + 1272) invalidate];
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 1272);
    *(void *)(v3 + 1272) = 0;
  }
  else
  {
    NSLog(&cfstr_HearingAidOkTo.isa);
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HMHearingAidEnrollmentViewController;
  [(OBBaseWelcomeController *)&v3 viewDidLoad];
  [(HMHearingAidEnrollmentViewController *)self moveToStep:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v22.receiver = self;
  v22.super_class = (Class)HMHearingAidEnrollmentViewController;
  [(OBBaseWelcomeController *)&v22 viewDidAppear:a3];
  v4 = [(HKAudiogramSample *)self->_selectedAudiogram hearingLevelSummary];
  v5 = [v4 leftEarMetrics];
  if (v5)
  {
    BOOL v6 = [(HKAudiogramSample *)self->_selectedAudiogram hearingLevelSummary];
    id v7 = [v6 leftEarMetrics];
    uint64_t v8 = [v7 averageSensitivity];
  }
  else
  {
    uint64_t v8 = 0;
  }

  uint64_t v9 = [(HKAudiogramSample *)self->_selectedAudiogram hearingLevelSummary];
  v10 = [v9 rightEarMetrics];
  if (v10)
  {
    id v11 = [(HKAudiogramSample *)self->_selectedAudiogram hearingLevelSummary];
    v12 = [v11 rightEarMetrics];
    uint64_t v13 = [v12 averageSensitivity];
  }
  else
  {
    uint64_t v13 = 0;
  }

  v14 = +[EnrollmentAnalyticManager shared];
  if ([(HKAudiogramSample *)self->_selectedAudiogram isFirstPartyHearingTestResult])uint64_t v15 = 1; {
  else
  }
    uint64_t v15 = 2;
  [v14 updateKeyWithKey:1 value:v15];

  v16 = +[EnrollmentAnalyticManager shared];
  [v16 updateKeyWithKey:2 value:HKHearingLevelClassificationForSensitivity()];

  objc_super v17 = +[EnrollmentAnalyticManager shared];
  [v17 updateKeyWithKey:3 value:HKHearingLevelClassificationForSensitivity()];

  v18 = [MEMORY[0x263F08AB0] processInfo];
  v19 = [v18 processName];
  int v20 = [v19 isEqualToString:@"Health"];

  if (v20)
  {
    v21 = +[EnrollmentAnalyticManager shared];
    [v21 updateKeyWithKey:6 value:2];
  }
}

- (void)dismissHearingAidEnrollment
{
  objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"HearingModeUpdated" object:0];

  v4 = [(HMHearingAidEnrollmentViewController *)self navigationController];
  v5 = (objc_class *)objc_opt_class();
  BOOL v6 = NSStringFromClass(v5);
  int v7 = [v6 isEqualToString:@"HKNavigationController"];

  if (v7)
  {
    NSLog(&cfstr_HearingAidSubm.isa);
    uint64_t v8 = +[EnrollmentAnalyticManager shared];
    objc_msgSend(v8, "updateKeyWithKey:value:", 0, -[BluetoothDevice productId](self->_device, "productId"));

    uint64_t v9 = +[EnrollmentAnalyticManager shared];
    [v9 submitEvent];
  }
  id v10 = [(HMHearingAidEnrollmentViewController *)self navigationController];
  [v10 dismissViewControllerAnimated:1 completion:&__block_literal_global_1];
}

- (void)enrollHearingAid
{
  objc_super v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  id v4 = objc_alloc_init(MEMORY[0x263F472D8]);
  [v4 setSelectedAudiogram:self->_selectedAudiogram];
  hearingModeClient = self->_hearingModeClient;
  deviceIdentifier = self->_deviceIdentifier;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__HMHearingAidEnrollmentViewController_enrollHearingAid__block_invoke;
  v8[3] = &unk_2653660C8;
  void v8[4] = self;
  uint64_t v9 = v3;
  int v7 = v3;
  [(HMServiceClient *)hearingModeClient modifyDeviceConfig:v4 identifier:deviceIdentifier completion:v8];
}

void __56__HMHearingAidEnrollmentViewController_enrollHearingAid__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_super v3 = "Failed";
  if (!a2) {
    objc_super v3 = "Succeeded";
  }
  NSLog(&cfstr_HearingAidAudi_1.isa, v3);
  id v4 = objc_alloc_init(MEMORY[0x263F472D8]);
  [v4 setEnrollHearingAssist:1];
  uint64_t v5 = *(void *)(a1 + 32);
  BOOL v6 = *(void **)(v5 + 1272);
  uint64_t v7 = *(void *)(v5 + 1208);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__HMHearingAidEnrollmentViewController_enrollHearingAid__block_invoke_2;
  v8[3] = &unk_2653660C8;
  void v8[4] = v5;
  id v9 = *(id *)(a1 + 40);
  [v6 modifyDeviceConfig:v4 identifier:v7 completion:v8];
}

void __56__HMHearingAidEnrollmentViewController_enrollHearingAid__block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_super v3 = "Failed";
  if (!a2) {
    objc_super v3 = "Succeeded";
  }
  NSLog(&cfstr_HearingAidEnro_0.isa, v3);
  id v4 = objc_alloc_init(MEMORY[0x263F472D8]);
  [v4 setEnableHearingAid:1];
  [v4 setEnableSwipeGain:2];
  uint64_t v5 = *(void *)(a1 + 32);
  BOOL v6 = *(void **)(v5 + 1272);
  uint64_t v7 = *(void *)(v5 + 1208);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__HMHearingAidEnrollmentViewController_enrollHearingAid__block_invoke_3;
  v8[3] = &unk_2653660C8;
  void v8[4] = v5;
  id v9 = *(id *)(a1 + 40);
  [v6 modifyDeviceConfig:v4 identifier:v7 completion:v8];
}

void __56__HMHearingAidEnrollmentViewController_enrollHearingAid__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = "Failed";
  if (!a2) {
    id v4 = "Succeeded";
  }
  NSLog(&cfstr_HearingAidEnab.isa, v4);
  if (!a2) {
    [*(id *)(*(void *)(a1 + 32) + 1200) setListeningMode:3];
  }
  id v5 = objc_alloc_init(MEMORY[0x263F472D8]);
  [v5 setEnablePMEMedia:1];
  [v5 setEnablePMEVoice:1];
  [v5 setEnableMediaAssist:1];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 1272);
  uint64_t v8 = *(void *)(v6 + 1208);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__HMHearingAidEnrollmentViewController_enrollHearingAid__block_invoke_4;
  v9[3] = &unk_2653660A0;
  id v10 = *(id *)(a1 + 40);
  [v7 modifyDeviceConfig:v5 identifier:v8 completion:v9];
}

void __56__HMHearingAidEnrollmentViewController_enrollHearingAid__block_invoke_4(uint64_t a1, uint64_t a2)
{
  objc_super v3 = "Failed";
  if (a2)
  {
    uint64_t v4 = 12;
  }
  else
  {
    objc_super v3 = "Succeeded";
    uint64_t v4 = 11;
  }
  NSLog(&cfstr_HearingAidPmeC.isa, v3);
  id v5 = +[EnrollmentAnalyticManager shared];
  [v5 updateKeyWithKey:4 value:v4];

  uint64_t v6 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v6);
}

- (void)moveToStep:(int)a3
{
  v49[4] = *MEMORY[0x263EF8340];
  NSLog(&cfstr_HearingAidMove.isa, a2, a3);
  switch(a3)
  {
    case 0:
      if (!self->_hearingAidIntroViewController)
      {
        id v5 = objc_alloc_init(HMHearingAidIntroViewController);
        hearingAidIntroViewController = self->_hearingAidIntroViewController;
        self->_hearingAidIntroViewController = v5;

        [(HMHearingAidIntroViewController *)self->_hearingAidIntroViewController setDelegate:self];
        [(HMHearingAidEnrollmentViewController *)self addChildViewController:self->_hearingAidIntroViewController];
        [(HMHearingAidIntroViewController *)self->_hearingAidIntroViewController didMoveToParentViewController:self];
        uint64_t v7 = [(HMHearingAidEnrollmentViewController *)self view];
        uint64_t v8 = [(HMHearingAidIntroViewController *)self->_hearingAidIntroViewController view];
        [v7 addSubview:v8];

        v38 = (void *)MEMORY[0x263F08938];
        id v47 = [(HMHearingAidIntroViewController *)self->_hearingAidIntroViewController view];
        v45 = [v47 topAnchor];
        v46 = [(HMHearingAidEnrollmentViewController *)self view];
        v44 = [v46 topAnchor];
        v43 = [v45 constraintEqualToAnchor:v44];
        v49[0] = v43;
        v42 = [(HMHearingAidIntroViewController *)self->_hearingAidIntroViewController view];
        v40 = [v42 heightAnchor];
        v41 = [(HMHearingAidEnrollmentViewController *)self view];
        v39 = [v41 heightAnchor];
        v37 = [v40 constraintEqualToAnchor:v39];
        v49[1] = v37;
        v36 = [(HMHearingAidIntroViewController *)self->_hearingAidIntroViewController view];
        id v9 = [v36 leadingAnchor];
        id v10 = [(HMHearingAidEnrollmentViewController *)self view];
        id v11 = [v10 leadingAnchor];
        v12 = [v9 constraintEqualToAnchor:v11];
        v49[2] = v12;
        uint64_t v13 = [(HMHearingAidIntroViewController *)self->_hearingAidIntroViewController view];
        v14 = [v13 trailingAnchor];
        uint64_t v15 = [(HMHearingAidEnrollmentViewController *)self view];
        v16 = [v15 trailingAnchor];
        objc_super v17 = [v14 constraintEqualToAnchor:v16];
        v49[3] = v17;
        v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:4];
        [v38 activateConstraints:v18];
      }
      v19 = +[EnrollmentAnalyticManager shared];
      [v19 updateKeyWithKey:4 value:7];

      int v20 = +[EnrollmentAnalyticManager shared];
      [v20 updateKeyWithKey:5 value:1];

      return;
    case 1:
      if (!self->_adjustModeInfoViewController)
      {
        v21 = objc_alloc_init(HMHearingAidTimeToAdjustInfoViewController);
        adjustModeInfoViewController = self->_adjustModeInfoViewController;
        self->_adjustModeInfoViewController = v21;

        [(HMHearingAidTimeToAdjustInfoViewController *)self->_adjustModeInfoViewController setDelegate:self];
      }
      v23 = [(HMHearingAidEnrollmentViewController *)self navigationController];
      [v23 pushViewController:self->_adjustModeInfoViewController animated:1];

      v24 = +[EnrollmentAnalyticManager shared];
      id v48 = v24;
      uint64_t v25 = 8;
      goto LABEL_19;
    case 2:
      if (!self->_setupCompleteViewController)
      {
        v26 = [HMHearingAidSetupCompleteViewController alloc];
        v27 = [(BluetoothDevice *)self->_device name];
        v28 = [(HMHearingAidSetupCompleteViewController *)v26 initWithDeviceName:v27];
        setupCompleteViewController = self->_setupCompleteViewController;
        self->_setupCompleteViewController = v28;

        [(HMHearingAidSetupCompleteViewController *)self->_setupCompleteViewController setDelegate:self];
      }
      if (!self->_instructionForUseViewController)
      {
        v30 = objc_alloc_init(HMHearingAidInstructionsForUseViewController);
        instructionForUseViewController = self->_instructionForUseViewController;
        self->_instructionForUseViewController = &v30->super.super;
      }
      v32 = [(HMHearingAidEnrollmentViewController *)self navigationController];
      [v32 pushViewController:self->_setupCompleteViewController animated:1];

      v24 = +[EnrollmentAnalyticManager shared];
      id v48 = v24;
      uint64_t v25 = 9;
      goto LABEL_19;
    case 3:
      [(HMHearingAidEnrollmentViewController *)self dismissHearingAidEnrollment];
      return;
    case 4:
      if (!self->_adjustSoundInfoViewController)
      {
        v33 = objc_alloc_init(HMHearingAidAdjustSoundInControlCenterViewController);
        adjustSoundInfoViewController = self->_adjustSoundInfoViewController;
        self->_adjustSoundInfoViewController = v33;

        [(HMHearingAidAdjustSoundInControlCenterViewController *)self->_adjustSoundInfoViewController setDelegate:self];
      }
      v35 = [(HMHearingAidEnrollmentViewController *)self navigationController];
      [v35 pushViewController:self->_adjustSoundInfoViewController animated:1];

      v24 = +[EnrollmentAnalyticManager shared];
      id v48 = v24;
      uint64_t v25 = 10;
LABEL_19:
      [v24 updateKeyWithKey:4 value:v25];

      break;
    default:
      return;
  }
}

- (void)completeStep:(int)a3
{
  NSLog(&cfstr_HearingAidComp.isa, a2, a3);
  if (a3 < 2)
  {
    uint64_t v5 = (a3 + 1);
    uint64_t v6 = self;
  }
  else
  {
    if ((a3 - 3) < 2)
    {
      [(HMHearingAidEnrollmentViewController *)self dismissHearingAidEnrollment];
      return;
    }
    if (a3 != 2) {
      return;
    }
    [(HMHearingAidEnrollmentViewController *)self enrollHearingAid];
    uint64_t v6 = self;
    uint64_t v5 = 4;
  }
  [(HMHearingAidEnrollmentViewController *)v6 moveToStep:v5];
}

- (void)updateAudiograms:(id)a3 invalidAudiograms:(id)a4
{
  uint64_t v6 = (NSArray *)a3;
  uint64_t v7 = (NSArray *)a4;
  NSLog(&cfstr_HearingAidUpda_0.isa);
  validAudiograms = self->_validAudiograms;
  self->_validAudiograms = v6;
  id v10 = v6;

  invalidAudiograms = self->_invalidAudiograms;
  self->_invalidAudiograms = v7;
}

- (id)getValidAudiograms
{
  NSLog(&cfstr_HearingAidGetV.isa, a2);
  validAudiograms = self->_validAudiograms;
  return validAudiograms;
}

- (id)getInvalidAudiograms
{
  NSLog(&cfstr_HearingAidGetI.isa, a2);
  invalidAudiograms = self->_invalidAudiograms;
  return invalidAudiograms;
}

- (void)selectAudiogram:(id)a3
{
  uint64_t v4 = (HKAudiogramSample *)a3;
  uint64_t v5 = [(HKAudiogramSample *)v4 description];
  NSLog(&cfstr_HearingAidSetA.isa, v5);

  selectedAudiogram = self->_selectedAudiogram;
  self->_selectedAudiogram = v4;
}

- (void)showInstructionForUse
{
  id v4 = (id)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:self->_instructionForUseViewController];
  objc_super v3 = [(HMHearingAidEnrollmentViewController *)self navigationController];
  [v3 presentViewController:v4 animated:1 completion:0];
}

- (id)_cancelButtonBarButton
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelHearingAidEnrollment];
  return v2;
}

- (HearingAidEnrollmentDelegate)hearingAidEnrollmentDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hearingAidEnrollmentDelegate);
  return (HearingAidEnrollmentDelegate *)WeakRetained;
}

- (void)setHearingAidEnrollmentDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hearingAidEnrollmentDelegate);
  objc_storeStrong((id *)&self->_invalidAudiograms, 0);
  objc_storeStrong((id *)&self->_validAudiograms, 0);
  objc_storeStrong((id *)&self->_hearingModeClient, 0);
  objc_storeStrong((id *)&self->_selectedAudiogram, 0);
  objc_storeStrong((id *)&self->_instructionForUseViewController, 0);
  objc_storeStrong((id *)&self->_setupCompleteViewController, 0);
  objc_storeStrong((id *)&self->_adjustModeInfoViewController, 0);
  objc_storeStrong((id *)&self->_adjustSoundInfoViewController, 0);
  objc_storeStrong((id *)&self->_hearingAidIntroViewController, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end