@interface NPHCellularSetupViewController
+ (BOOL)controllerNeedsToRun;
+ (NSMutableSet)loggedEvents;
+ (void)_logEventOncePerSession:(unint64_t)a3;
+ (void)setLoggedEvents:(id)a3;
- (BOOL)haveReceivedProxyPlanItems;
- (BOOL)isCellularSetupFlowComplete;
- (BOOL)isGeminiSetup;
- (BOOL)isTinkerCrossCarrierSetUpFlow;
- (BOOL)wantsLightenBlendedScreen;
- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate;
- (NPHCellularSetupViewController)initWithConfiguration:(int64_t)a3;
- (NSArray)userVisibleErrors;
- (NSString)alternateButtonTitle;
- (NSString)detailString;
- (NSString)suggestedButtonTitle;
- (SUBManager)subManager;
- (UIActivityIndicatorView)spinner;
- (UIBarButtonItem)cancelNavBarButtonItem;
- (UIBarButtonItem)nextNavBarButtonItem;
- (id)_setUpNowDetailString;
- (id)imageResource;
- (id)imageResourceBundleIdentifier;
- (id)okayButtonTitle;
- (id)tapToRadarMetadata;
- (id)titleString;
- (id)trialOfferMessage;
- (int64_t)configuration;
- (int64_t)type;
- (void)_decideWhetherToShowTransferOrSetup;
- (void)checkForSoftwareUpdate;
- (void)ctCellularPlanInfoDidChange:(id)a3;
- (void)dealloc;
- (void)navigateToNextView;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)setAlternateButtonTitle:(id)a3;
- (void)setCancelNavBarButtonItem:(id)a3;
- (void)setConfiguration:(int64_t)a3;
- (void)setDetailString:(id)a3;
- (void)setHaveReceivedProxyPlanItems:(BOOL)a3;
- (void)setIsCellularSetupFlowComplete:(BOOL)a3;
- (void)setIsTinkerCrossCarrierSetUpFlow:(BOOL)a3;
- (void)setMiniFlowDelegate:(id)a3;
- (void)setNextNavBarButtonItem:(id)a3;
- (void)setSpinner:(id)a3;
- (void)setSubManager:(id)a3;
- (void)setSuggestedButtonTitle:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setUpNow;
- (void)setUserVisibleErrors:(id)a3;
- (void)transfer;
- (void)updateUIFromCellularPlanItems;
- (void)updateUIToShowContinue;
- (void)updateUIToShowPlanSetUpTrial;
- (void)updateUIToShowPlanTransferOrSetUpNewOptions;
- (void)updateUIToShowPreinstall;
- (void)updateUIToShowSetUpNow;
- (void)updateUIToShowSetUpNowMultipleSubscriptions;
- (void)updateUIToShowSpinner;
- (void)updateUIToShowUserConsent:(int64_t)a3 relevantPlan:(id)a4;
- (void)updateUIToShowUserVisibleError;
- (void)userTappedConsent:(id)a3;
- (void)userTappedContinue:(id)a3;
- (void)userTappedNext:(id)a3;
- (void)userTappedSetUp:(id)a3;
- (void)userTappedSetUpCarrier:(id)a3;
- (void)userTappedSetUpNew:(id)a3;
- (void)userTappedSkip:(id)a3;
- (void)userTappedTransfer:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation NPHCellularSetupViewController

+ (BOOL)controllerNeedsToRun
{
  v3 = [MEMORY[0x263F57700] activeDevice];
  v4 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"4AA3FF3B-3224-42E6-995E-481F49AE9260"];
  int v5 = [v3 supportsCapability:v4];

  if (!v5) {
    goto LABEL_5;
  }
  v6 = +[NPHCellularBridgeUIManager sharedInstance];
  v7 = [v6 serviceSubscriptionsOfferingRemotePlan];
  uint64_t v8 = [v7 count];

  if (!v8)
  {
    [a1 _logEventOncePerSession:3];
LABEL_5:
    v10 = +[NPHCellularBridgeUIManager sharedInstance];
    [v10 finishRemoteProvisioning];

    return 0;
  }
  BOOL v9 = 1;
  [a1 _logEventOncePerSession:1];
  return v9;
}

- (NPHCellularSetupViewController)initWithConfiguration:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NPHCellularSetupViewController;
  v4 = [(NPHCellularSetupViewController *)&v8 initWithTitle:&stru_26E895688 detailText:0 icon:0 contentLayout:2];
  int v5 = v4;
  if (v4)
  {
    [(NPHCellularSetupViewController *)v4 setConfiguration:a3];
    [(BPSWelcomeOptinViewController *)v5 setStyle:106];
    [(NPHCellularSetupViewController *)v5 setIsCellularSetupFlowComplete:0];
    [(NPHCellularSetupViewController *)v5 setIsTinkerCrossCarrierSetUpFlow:0];
    v6 = +[NPHCellularBridgeUIManager sharedInstance];
    [v6 fetchTinkerFamilyMember];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NPHCellularSetupViewController;
  [(BPSWelcomeOptinViewController *)&v4 dealloc];
}

- (BOOL)isGeminiSetup
{
  v2 = +[NPHCellularBridgeUIManager sharedInstance];
  v3 = [v2 serviceSubscriptionsToOfferUser];

  LOBYTE(v2) = (unint64_t)[v3 count] > 1;
  return (char)v2;
}

+ (NSMutableSet)loggedEvents
{
  v2 = (void *)_loggedEvents;
  if (!_loggedEvents)
  {
    uint64_t v3 = objc_opt_new();
    objc_super v4 = (void *)_loggedEvents;
    _loggedEvents = v3;

    v2 = (void *)_loggedEvents;
  }
  return (NSMutableSet *)v2;
}

+ (void)setLoggedEvents:(id)a3
{
  if ((id)_loggedEvents != a3)
  {
    _loggedEvents = [a3 mutableCopy];
    MEMORY[0x270F9A758]();
  }
}

+ (void)_logEventOncePerSession:(unint64_t)a3
{
  int v5 = [a1 loggedEvents];
  v6 = [NSNumber numberWithUnsignedInteger:a3];
  char v7 = [v5 containsObject:v6];

  if ((v7 & 1) == 0)
  {
    [MEMORY[0x263F5B960] incrementSetUpEvent:a3];
    id v9 = [a1 loggedEvents];
    objc_super v8 = [NSNumber numberWithUnsignedInteger:a3];
    [v9 addObject:v8];
  }
}

- (void)ctCellularPlanInfoDidChange:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__NPHCellularSetupViewController_ctCellularPlanInfoDidChange___block_invoke;
  v6[3] = &unk_264C53698;
  objc_copyWeak(&v8, &location);
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __62__NPHCellularSetupViewController_ctCellularPlanInfoDidChange___block_invoke(id *a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v2 = nph_general_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = +[NPHCellularBridgeUIManager sharedInstance];
    id v4 = [v3 selectedCellularPlan];
    id v5 = +[NPHCellularBridgeUIManager sharedInstance];
    v6 = [v5 cellularPlans];
    int v23 = 136315650;
    v24 = "-[NPHCellularSetupViewController ctCellularPlanInfoDidChange:]_block_invoke";
    __int16 v25 = 2112;
    v26 = v4;
    __int16 v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_235444000, v2, OS_LOG_TYPE_DEFAULT, "Akashi - %s selectedPlan:%@ cellularPlans:%@", (uint8_t *)&v23, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  [WeakRetained setHaveReceivedProxyPlanItems:1];

  id v8 = +[NPHCellularBridgeUIManager sharedInstance];
  id v9 = [v8 cellularUseErrors];
  id v10 = objc_loadWeakRetained(a1 + 6);
  [v10 setUserVisibleErrors:v9];

  id v11 = objc_loadWeakRetained(a1 + 6);
  v12 = [v11 userVisibleErrors];
  uint64_t v13 = [v12 indexOfObjectPassingTest:&__block_literal_global_0];

  if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
    [a1[4] checkForSoftwareUpdate];
  }
  v14 = [a1[5] userInfo];
  v15 = [v14 objectForKey:NPHCellularPlanInfoError];

  if (v15)
  {
    v16 = nph_general_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __62__NPHCellularSetupViewController_ctCellularPlanInfoDidChange___block_invoke_cold_1((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);
    }

    +[NPHCellularBridgeUIManager presentCellularError:v15 onViewController:a1[4]];
  }
  [a1[4] updateUIFromCellularPlanItems];
}

BOOL __62__NPHCellularSetupViewController_ctCellularPlanInfoDidChange___block_invoke_300(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 domain];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  id v4 = (void *)getCTCellularPlanErrorDomainSymbolLoc_ptr;
  uint64_t v12 = getCTCellularPlanErrorDomainSymbolLoc_ptr;
  if (!getCTCellularPlanErrorDomainSymbolLoc_ptr)
  {
    id v5 = (void *)CellularPlanManagerLibrary();
    v10[3] = (uint64_t)dlsym(v5, "CTCellularPlanErrorDomain");
    getCTCellularPlanErrorDomainSymbolLoc_ptr = v10[3];
    id v4 = (void *)v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v4)
  {
    id v8 = (_Unwind_Exception *)__62__NPHCellularSetupViewController_ctCellularPlanInfoDidChange___block_invoke_300_cold_1();
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(v8);
  }
  if ([v3 isEqualToString:*v4]) {
    BOOL v6 = [v2 code] == 32;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)checkForSoftwareUpdate
{
  if (!self->_subManager)
  {
    uint64_t v3 = (SUBManager *)[objc_alloc(MEMORY[0x263F77AF8]) initWithDelegate:0];
    subManager = self->_subManager;
    self->_subManager = v3;

    id v5 = self->_subManager;
    [(SUBManager *)v5 scanForUpdates];
  }
}

- (void)viewDidLoad
{
  v28.receiver = self;
  v28.super_class = (Class)NPHCellularSetupViewController;
  [(BPSWelcomeOptinViewController *)&v28 viewDidLoad];
  uint64_t v3 = [(NPHCellularSetupViewController *)self navigationController];
  id v4 = [v3 presentationController];
  [v4 setDelegate:self];

  id v5 = objc_alloc(MEMORY[0x263F1C468]);
  BOOL v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"AKASHI_NEXT" value:&stru_26E895688 table:0];
  id v8 = (void *)[v5 initWithTitle:v7 style:2 target:self action:sel_userTappedNext_];
  [(NPHCellularSetupViewController *)self setNextNavBarButtonItem:v8];

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:self action:sel_userTappedSkip_];
  [(NPHCellularSetupViewController *)self setCancelNavBarButtonItem:v9];

  id v10 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:101];
  spinner = self->_spinner;
  self->_spinner = v10;

  [(UIActivityIndicatorView *)self->_spinner setHidesWhenStopped:1];
  uint64_t v12 = [(NPHCellularSetupViewController *)self view];
  [v12 addSubview:self->_spinner];

  [(UIActivityIndicatorView *)self->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v13 = [(UIActivityIndicatorView *)self->_spinner centerXAnchor];
  v14 = [(NPHCellularSetupViewController *)self contentView];
  v15 = [v14 centerXAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  [v16 setActive:1];

  uint64_t v17 = [(UIActivityIndicatorView *)self->_spinner topAnchor];
  uint64_t v18 = [(NPHCellularSetupViewController *)self contentView];
  uint64_t v19 = [v18 bottomAnchor];
  uint64_t v20 = [v17 constraintEqualToSystemSpacingBelowAnchor:v19 multiplier:1.0];
  [v20 setActive:1];

  uint64_t v21 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v22 = NPHCellularSetupShouldShowSpinnerNotification;
  int v23 = +[NPHCellularBridgeUIManager sharedInstance];
  [v21 addObserver:self selector:sel_updateUIToShowSpinner name:v22 object:v23];

  v24 = [MEMORY[0x263F08A00] defaultCenter];
  __int16 v25 = NPHCellularPlanInfoDidChangeNotification;
  v26 = +[NPHCellularBridgeUIManager sharedInstance];
  [v24 addObserver:self selector:sel_ctCellularPlanInfoDidChange_ name:v25 object:v26];

  __int16 v27 = +[NPHCellularBridgeUIManager sharedInstance];
  [v27 updateCellularPlansWithFetch:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NPHCellularSetupViewController;
  [(NPHCellularSetupViewController *)&v5 viewWillAppear:a3];
  id v4 = +[NPHCellularBridgeUIManager sharedInstance];
  [v4 fetchTinkerFamilyMember];

  [(NPHCellularSetupViewController *)self updateUIFromCellularPlanItems];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPHCellularSetupViewController;
  [(BPSWelcomeOptinViewController *)&v4 viewDidAppear:a3];
  [(NPHCellularSetupViewController *)self updateUIFromCellularPlanItems];
}

- (id)titleString
{
  uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 localizedStringForKey:@"AKASHI_TITLE" value:&stru_26E895688 table:0];

  objc_super v5 = +[NPHCellularBridgeUIManager sharedInstance];
  if ([v5 isAnyCellularPlanActivating])
  {
    int64_t v6 = [(NPHCellularSetupViewController *)self type];

    if (v6 == 7) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  if ([(NPHCellularSetupViewController *)self isTinkerCrossCarrierSetUpFlow]
    && [(NPHCellularSetupViewController *)self type] == 2)
  {
    id v7 = +[NPHCellularBridgeUIManager sharedInstance];
    id v19 = 0;
    [v7 consentRequiredRelevantCellularPlanItem:&v19];
    id v8 = v19;

    uint64_t v9 = NSString;
    id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v11 = [v10 localizedStringForKey:@"AKASHI_TITLE_CONSENT_TINKER" value:&stru_26E895688 table:0];
    uint64_t v12 = [v8 carrierName];

    uint64_t v13 = objc_msgSend(v9, "stringWithFormat:", v11, v12);

LABEL_15:
    objc_super v4 = (void *)v13;
    goto LABEL_16;
  }
  v14 = +[NPHCellularBridgeUIManager sharedInstance];
  if ([v14 cellularPlanIsSetUp]
    && ![(NPHCellularSetupViewController *)self isGeminiSetup])
  {
    int64_t v18 = [(NPHCellularSetupViewController *)self type];

    if (v18 != 3)
    {
      v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v10 = v15;
      v16 = @"AKASHI_TITLE_COMPLETE";
      goto LABEL_14;
    }
  }
  else
  {
  }
  if ([(NPHCellularSetupViewController *)self isTinkerCrossCarrierSetUpFlow]
    && [(NPHCellularSetupViewController *)self type] == 7)
  {
LABEL_13:
    v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v10 = v15;
    v16 = @"AKASHI_TITLE_INSTALLING";
LABEL_14:
    uint64_t v13 = [v15 localizedStringForKey:v16 value:&stru_26E895688 table:0];

    goto LABEL_15;
  }
LABEL_16:
  return v4;
}

- (id)imageResource
{
  if (+[NPHSharedUtilities isActiveDeviceTinker]) {
    return @"Screen-TinkerCellular";
  }
  else {
    return @"Screen-Akashi";
  }
}

- (id)imageResourceBundleIdentifier
{
  id v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 bundleIdentifier];

  return v3;
}

- (id)okayButtonTitle
{
  if (self->_shouldHideSkipButton)
  {
    id v2 = 0;
  }
  else
  {
    uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v2 = [v3 localizedStringForKey:@"AKASHI_NOT_NOW" value:&stru_26E895688 table:0];
  }
  return v2;
}

- (BOOL)wantsLightenBlendedScreen
{
  return 1;
}

- (void)userTappedNext:(id)a3
{
  objc_super v4 = nph_general_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl(&dword_235444000, v4, OS_LOG_TYPE_DEFAULT, "Akashi - User tapped Next", v5, 2u);
  }

  [MEMORY[0x263F5B960] incrementSetUpEvent:13];
  [(NPHCellularSetupViewController *)self navigateToNextView];
}

- (void)userTappedContinue:(id)a3
{
  objc_super v4 = nph_general_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl(&dword_235444000, v4, OS_LOG_TYPE_DEFAULT, "Akashi - User tapped Continue", v5, 2u);
  }

  [(NPHCellularSetupViewController *)self navigateToNextView];
}

- (void)userTappedConsent:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [MEMORY[0x263F5B960] incrementSetUpEvent:14];
  objc_super v5 = +[NPHCellularBridgeUIManager sharedInstance];
  int64_t v6 = [v5 selectedCellularPlan];

  id v7 = [(BPSWelcomeOptinViewController *)self suggestedChoiceButton];
  LODWORD(v5) = v7 != v4;

  id v8 = nph_general_log();
  uint64_t v9 = 2 * v5;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "-[NPHCellularSetupViewController userTappedConsent:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2048;
    v26 = (void *)v9;
    _os_log_impl(&dword_235444000, v8, OS_LOG_TYPE_DEFAULT, "%s: %@ consentResponse: %ld", buf, 0x20u);
  }

  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2050000000;
  uint64_t v17 = (void *)getCTCellularPlanManagerClass_softClass;
  uint64_t v24 = getCTCellularPlanManagerClass_softClass;
  if (!getCTCellularPlanManagerClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getCTCellularPlanManagerClass_block_invoke;
    v26 = &unk_264C537D8;
    __int16 v27 = &v21;
    __getCTCellularPlanManagerClass_block_invoke((uint64_t)buf, v10, v11, v12, v13, v14, v15, v16, v20[0]);
    uint64_t v17 = (void *)v22[3];
  }
  id v18 = v17;
  _Block_object_dispose(&v21, 8);
  id v19 = [v18 sharedManager];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __52__NPHCellularSetupViewController_userTappedConsent___block_invoke;
  v20[3] = &unk_264C536E8;
  v20[4] = self;
  v20[5] = v9;
  [v19 userDidProvideConsentResponse:v9 forPlan:v6 isRemote:1 completion:v20];
}

void __52__NPHCellularSetupViewController_userTappedConsent___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__NPHCellularSetupViewController_userTappedConsent___block_invoke_2;
  block[3] = &unk_264C536C0;
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = v5;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __52__NPHCellularSetupViewController_userTappedConsent___block_invoke_2(void *a1)
{
  uint64_t v2 = (uint64_t)(a1 + 4);
  if (a1[4])
  {
    uint64_t v3 = nph_general_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __52__NPHCellularSetupViewController_userTappedConsent___block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  uint64_t v10 = (void *)a1[5];
  if (a1[6]) {
    return [v10 navigateToNextView];
  }
  else {
    return [v10 updateUIFromCellularPlanItems];
  }
}

- (void)navigateToNextView
{
  [(id)objc_opt_class() setLoggedEvents:0];
  uint64_t v3 = [(NPHCellularSetupViewController *)self miniFlowDelegate];
  [v3 miniFlowStepComplete:self];

  if ([(NPHCellularSetupViewController *)self configuration] == 1)
  {
    [(NPHCellularSetupViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
  else if ([(NPHCellularSetupViewController *)self configuration] == 2)
  {
    id v4 = +[NPHCellularBridgeUIManager sharedInstance];
    [v4 finishRemoteProvisioning];
  }
}

- (void)userTappedSkip:(id)a3
{
  id v4 = a3;
  uint64_t v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_235444000, v5, OS_LOG_TYPE_DEFAULT, "Akashi - Skipped Setup", v8, 2u);
  }

  [MEMORY[0x263F5B960] incrementSetUpEvent:11];
  if ([(NPHCellularSetupViewController *)self type] == 2) {
    [(NPHCellularSetupViewController *)self userTappedConsent:v4];
  }
  if ([(NPHCellularSetupViewController *)self configuration] == 2)
  {
    uint64_t v6 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CellularSetupBridgeBuddyUI"];
    uint64_t v7 = [v6 principalClass];
    if (v7) {
      [MEMORY[0x263F2BBA8] markSkippedSetupPaneClassForCurrentDevice:v7];
    }
  }
  [(NPHCellularSetupViewController *)self navigateToNextView];
}

- (void)userTappedSetUp:(id)a3
{
  id v4 = nph_general_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_235444000, v4, OS_LOG_TYPE_DEFAULT, "Akashi - User tapped Set Up", v5, 2u);
  }

  [MEMORY[0x263F5B960] incrementSetUpEvent:12];
  [(NPHCellularSetupViewController *)self setUpNow];
}

- (void)userTappedTransfer:(id)a3
{
  id v4 = nph_general_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_235444000, v4, OS_LOG_TYPE_DEFAULT, "Akashi - User tapped Transfer", v5, 2u);
  }

  [MEMORY[0x263F5B960] incrementSetUpEvent:15];
  [(NPHCellularSetupViewController *)self transfer];
}

- (void)userTappedSetUpNew:(id)a3
{
  id v4 = nph_general_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235444000, v4, OS_LOG_TYPE_DEFAULT, "Akashi - User tapped Set Up New", buf, 2u);
  }

  if ([(NPHCellularSetupViewController *)self isGeminiSetup])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__NPHCellularSetupViewController_userTappedSetUpNew___block_invoke;
    block[3] = &unk_264C53628;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    [MEMORY[0x263F5B960] incrementSetUpEvent:16];
    [(NPHCellularSetupViewController *)self setUpNow];
  }
}

uint64_t __53__NPHCellularSetupViewController_userTappedSetUpNew___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateUIToShowSetUpNowMultipleSubscriptions];
}

- (void)setUpNow
{
  uint64_t v3 = +[NPHCellularBridgeUIManager sharedInstance];
  id v4 = [v3 cellularPlanRequiringPreInstallConsent];

  uint64_t v5 = +[NPHCellularBridgeUIManager sharedInstance];
  uint64_t v6 = v5;
  if (v4)
  {
    uint64_t v7 = +[NPHCellularBridgeUIManager sharedInstance];
    uint64_t v8 = [v7 cellularPlanRequiringPreInstallConsent];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __42__NPHCellularSetupViewController_setUpNow__block_invoke;
    v16[3] = &unk_264C53738;
    v16[4] = self;
    [v6 installPendingCellularPlan:v8 withCompletion:v16];
  }
  else
  {
    uint64_t v9 = [v5 serviceSubscriptionsToOfferUser];
    uint64_t v10 = [v9 firstObject];

    uint64_t v11 = +[NPHCellularBridgeUIManager sharedInstance];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __42__NPHCellularSetupViewController_setUpNow__block_invoke_353;
    v13[3] = &unk_264C53788;
    id v14 = v10;
    uint64_t v15 = self;
    id v12 = v10;
    [v11 setUpCellularPlanOnViewController:self withContext:v12 withCompletion:v13];
  }
}

void __42__NPHCellularSetupViewController_setUpNow__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__NPHCellularSetupViewController_setUpNow__block_invoke_2;
  v6[3] = &unk_264C53710;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __42__NPHCellularSetupViewController_setUpNow__block_invoke_2(uint64_t result)
{
  v1 = (uint64_t *)(result + 32);
  if (*(void *)(result + 32))
  {
    uint64_t v2 = result;
    id v3 = nph_general_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __42__NPHCellularSetupViewController_setUpNow__block_invoke_2_cold_1(v1, v3);
    }

    return +[NPHCellularBridgeUIManager presentCellularError:*(void *)(v2 + 32) onViewController:*(void *)(v2 + 40)];
  }
  return result;
}

void __42__NPHCellularSetupViewController_setUpNow__block_invoke_353(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__NPHCellularSetupViewController_setUpNow__block_invoke_2_354;
  block[3] = &unk_264C53760;
  id v8 = v3;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = v4;
  uint64_t v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __42__NPHCellularSetupViewController_setUpNow__block_invoke_2_354(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    id v3 = nph_general_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __42__NPHCellularSetupViewController_setUpNow__block_invoke_2_354_cold_1(a1, v2, v3);
    }

    +[NPHCellularBridgeUIManager presentCellularError:*(void *)(a1 + 32) onViewController:*(void *)(a1 + 48)];
  }
  uint64_t result = [*(id *)(a1 + 48) configuration];
  if (result == 1) {
    return [*(id *)(a1 + 48) navigateToNextView];
  }
  return result;
}

- (void)transfer
{
  id v3 = +[NPHCellularBridgeUIManager sharedInstance];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__NPHCellularSetupViewController_transfer__block_invoke;
  v4[3] = &unk_264C53738;
  v4[4] = self;
  [v3 transferCellularPlanOnViewController:self withCompletion:v4];
}

void __42__NPHCellularSetupViewController_transfer__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__NPHCellularSetupViewController_transfer__block_invoke_2;
  block[3] = &unk_264C537B0;
  id v6 = v3;
  id v4 = v3;
  objc_copyWeak(&v7, &location);
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
}

void __42__NPHCellularSetupViewController_transfer__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  if (*(void *)(a1 + 32))
  {
    id v3 = nph_general_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __42__NPHCellularSetupViewController_transfer__block_invoke_2_cold_1(v1, v3, v4, v5, v6, v7, v8, v9);
    }

    uint64_t v10 = *(void *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    +[NPHCellularBridgeUIManager presentCellularError:v10 onViewController:WeakRetained];
  }
}

- (void)userTappedSetUpCarrier:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235444000, v5, OS_LOG_TYPE_DEFAULT, "Akashi - User tapped Set Up Carrier", buf, 2u);
  }

  uint64_t v6 = objc_getAssociatedObject(v4, sel_updateUIToShowSetUpNowMultipleSubscriptions);

  uint64_t v7 = nph_general_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v14 = "-[NPHCellularSetupViewController userTappedSetUpCarrier:]";
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl(&dword_235444000, v7, OS_LOG_TYPE_DEFAULT, "Akashi - %s subscriptionContext:%@", buf, 0x16u);
  }

  uint64_t v8 = +[NPHCellularBridgeUIManager sharedInstance];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__NPHCellularSetupViewController_userTappedSetUpCarrier___block_invoke;
  v10[3] = &unk_264C53788;
  id v11 = v6;
  id v12 = self;
  id v9 = v6;
  [v8 setUpCellularPlanOnViewController:self withContext:v9 withCompletion:v10];
}

void __57__NPHCellularSetupViewController_userTappedSetUpCarrier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__NPHCellularSetupViewController_userTappedSetUpCarrier___block_invoke_2;
  block[3] = &unk_264C53760;
  id v8 = v3;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = v4;
  uint64_t v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __57__NPHCellularSetupViewController_userTappedSetUpCarrier___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    id v3 = nph_general_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __57__NPHCellularSetupViewController_userTappedSetUpCarrier___block_invoke_2_cold_1(a1, v2, v3);
    }

    +[NPHCellularBridgeUIManager presentCellularError:*(void *)(a1 + 32) onViewController:*(void *)(a1 + 48)];
  }
  uint64_t result = [*(id *)(a1 + 48) configuration];
  if (result == 1) {
    return [*(id *)(a1 + 48) navigateToNextView];
  }
  return result;
}

- (void)updateUIFromCellularPlanItems
{
}

- (void)updateUIToShowSpinner
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    id v12 = "-[NPHCellularSetupViewController updateUIToShowSpinner]";
    _os_log_impl(&dword_235444000, v3, OS_LOG_TYPE_DEFAULT, "Akashi - %s", (uint8_t *)&v11, 0xCu);
  }

  [(NPHCellularSetupViewController *)self setType:0];
  [(id)objc_opt_class() _logEventOncePerSession:4];
  id v4 = [(OBBaseWelcomeController *)self navigationItem];
  if ([(NPHCellularSetupViewController *)self configuration] == 1) {
    [(NPHCellularSetupViewController *)self cancelNavBarButtonItem];
  }
  else {
  uint64_t v5 = [(NPHCellularSetupViewController *)self nextNavBarButtonItem];
  }
  [v4 setRightBarButtonItem:v5];

  suggestedButtonTitle = self->_suggestedButtonTitle;
  self->_suggestedButtonTitle = 0;

  alternateButtonTitle = self->_alternateButtonTitle;
  self->_alternateButtonTitle = 0;

  id v8 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
  [v8 setHidden:1];

  self->_shouldHideSkipButton = 1;
  [(UIActivityIndicatorView *)self->_spinner startAnimating];
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v10 = [v9 localizedStringForKey:@"AKASHI_PLAN_UNKNOWN" value:&stru_26E895688 table:0];
  [(NPHCellularSetupViewController *)self setDetailString:v10];

  [(BPSWelcomeOptinViewController *)self refreshViews];
}

- (void)updateUIToShowContinue
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v27 = "-[NPHCellularSetupViewController updateUIToShowContinue]";
    _os_log_impl(&dword_235444000, v3, OS_LOG_TYPE_DEFAULT, "Akashi - %s", buf, 0xCu);
  }

  [(NPHCellularSetupViewController *)self setType:7];
  [(NPHCellularSetupViewController *)self setIsCellularSetupFlowComplete:1];
  [(id)objc_opt_class() _logEventOncePerSession:6];
  id v4 = [(OBBaseWelcomeController *)self navigationItem];
  [v4 setRightBarButtonItem:0];

  self->_shouldHideSkipButton = 1;
  [(UIActivityIndicatorView *)self->_spinner stopAnimating];
  BOOL v5 = +[NPHSharedUtilities isActiveDeviceTinker];
  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v7 = v6;
  if (v5)
  {
    id v8 = [v6 localizedStringForKey:@"AKASHI_DONE" value:&stru_26E895688 table:0];
    suggestedButtonTitle = self->_suggestedButtonTitle;
    self->_suggestedButtonTitle = v8;

    int v10 = MGGetBoolAnswer();
    int v11 = @"WIFI";
    if (v10) {
      int v11 = @"WLAN";
    }
    id v12 = [NSString stringWithFormat:@"AKASHI_TINKER_DETAIL_FYI_%@", v11];
    uint64_t v13 = NSString;
    id v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    __int16 v15 = [v14 localizedStringForKey:v12 value:&stru_26E895688 table:0];
    uint64_t v16 = +[NPHCellularBridgeUIManager sharedInstance];
    uint64_t v17 = [v16 tinkerFamilyMemberFirstName];
    id v18 = objc_msgSend(v13, "stringWithFormat:", v15, v17);
    [(NPHCellularSetupViewController *)self setDetailString:v18];
  }
  else
  {
    id v19 = [v6 localizedStringForKey:@"AKASHI_CONTINUE" value:&stru_26E895688 table:0];
    uint64_t v20 = self->_suggestedButtonTitle;
    self->_suggestedButtonTitle = v19;

    id v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v14 = [v12 localizedStringForKey:@"AKASHI_DETAIL_FYI" value:&stru_26E895688 table:0];
    [(NPHCellularSetupViewController *)self setDetailString:v14];
  }

  uint64_t v21 = [(BPSWelcomeOptinViewController *)self suggestedChoiceButton];
  [v21 removeTarget:self action:0 forControlEvents:64];

  uint64_t v22 = [(BPSWelcomeOptinViewController *)self suggestedChoiceButton];
  [v22 addTarget:self action:sel_userTappedContinue_ forControlEvents:64];

  alternateButtonTitle = self->_alternateButtonTitle;
  self->_alternateButtonTitle = 0;

  uint64_t v24 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
  [v24 removeTarget:self action:0 forControlEvents:64];

  __int16 v25 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
  [v25 setHidden:1];

  [(BPSWelcomeOptinViewController *)self refreshViews];
}

- (void)updateUIToShowPreinstall
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    id v12 = "-[NPHCellularSetupViewController updateUIToShowPreinstall]";
    _os_log_impl(&dword_235444000, v3, OS_LOG_TYPE_DEFAULT, "Akashi - %s", (uint8_t *)&v11, 0xCu);
  }

  [(NPHCellularSetupViewController *)self setType:1];
  [(id)objc_opt_class() _logEventOncePerSession:7];
  id v4 = [(OBBaseWelcomeController *)self navigationItem];
  if ([(NPHCellularSetupViewController *)self configuration] == 1)
  {
    BOOL v5 = [(NPHCellularSetupViewController *)self cancelNavBarButtonItem];
    [v4 setRightBarButtonItem:v5];
  }
  else
  {
    [v4 setRightBarButtonItem:0];
  }

  suggestedButtonTitle = self->_suggestedButtonTitle;
  self->_suggestedButtonTitle = 0;

  alternateButtonTitle = self->_alternateButtonTitle;
  self->_alternateButtonTitle = 0;

  id v8 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
  [v8 setHidden:1];

  self->_shouldHideSkipButton = 1;
  [(UIActivityIndicatorView *)self->_spinner startAnimating];
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v10 = [v9 localizedStringForKey:@"AKASHI_PLAN_PREINSTALL" value:&stru_26E895688 table:0];
  [(NPHCellularSetupViewController *)self setDetailString:v10];

  [(BPSWelcomeOptinViewController *)self refreshViews];
}

- (void)updateUIToShowUserConsent:(int64_t)a3 relevantPlan:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = nph_general_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 136315650;
    __int16 v27 = "-[NPHCellularSetupViewController updateUIToShowUserConsent:relevantPlan:]";
    __int16 v28 = 2048;
    int64_t v29 = a3;
    __int16 v30 = 2112;
    id v31 = v6;
    _os_log_impl(&dword_235444000, v7, OS_LOG_TYPE_DEFAULT, "Akashi - %s consentType:%ld relevantPlanItem:%@", (uint8_t *)&v26, 0x20u);
  }

  [(NPHCellularSetupViewController *)self setType:2];
  [(id)objc_opt_class() _logEventOncePerSession:10];
  id v8 = +[NPHCellularBridgeUIManager sharedInstance];
  id v9 = [v8 userConsentMessageForConsentType:a3 relevantPlanItem:v6];

  int v10 = [(OBBaseWelcomeController *)self navigationItem];
  if ([(NPHCellularSetupViewController *)self configuration] == 1)
  {
    int v11 = [(NPHCellularSetupViewController *)self cancelNavBarButtonItem];
    [v10 setRightBarButtonItem:v11];
  }
  else
  {
    [v10 setRightBarButtonItem:0];
  }

  BOOL v12 = [(NPHCellularSetupViewController *)self isTinkerCrossCarrierSetUpFlow];
  uint64_t v13 = (void *)0x263F08000;
  id v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  __int16 v15 = v14;
  if (v12) {
    uint64_t v16 = @"AKASHI_CONSENT_TINKER";
  }
  else {
    uint64_t v16 = @"AKASHI_CONTINUE";
  }
  uint64_t v17 = [v14 localizedStringForKey:v16 value:&stru_26E895688 table:0];
  objc_storeStrong((id *)&self->_suggestedButtonTitle, v17);

  id v18 = [(BPSWelcomeOptinViewController *)self suggestedChoiceButton];
  [v18 removeTarget:self action:0 forControlEvents:64];

  id v19 = [(BPSWelcomeOptinViewController *)self suggestedChoiceButton];
  [v19 addTarget:self action:sel_userTappedConsent_ forControlEvents:64];

  int64_t v20 = [(NPHCellularSetupViewController *)self configuration];
  if (v20 == 1)
  {
    uint64_t v21 = 0;
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v21 = [v13 localizedStringForKey:@"AKASHI_FINISH_UP_LATER" value:&stru_26E895688 table:0];
  }
  objc_storeStrong((id *)&self->_alternateButtonTitle, v21);
  if (v20 != 1)
  {
  }
  BOOL v22 = [(NPHCellularSetupViewController *)self configuration] == 1;
  uint64_t v23 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
  [v23 setHidden:v22];

  uint64_t v24 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
  [v24 removeTarget:self action:0 forControlEvents:64];

  if ([(NPHCellularSetupViewController *)self configuration] == 2)
  {
    __int16 v25 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
    [v25 addTarget:self action:sel_userTappedConsent_ forControlEvents:64];
  }
  self->_shouldHideSkipButton = 1;
  [(UIActivityIndicatorView *)self->_spinner stopAnimating];
  [(NPHCellularSetupViewController *)self setDetailString:v9];
  [(BPSWelcomeOptinViewController *)self refreshViews];
}

- (void)updateUIToShowUserVisibleError
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v31 = "-[NPHCellularSetupViewController updateUIToShowUserVisibleError]";
    _os_log_impl(&dword_235444000, v3, OS_LOG_TYPE_DEFAULT, "Akashi - %s", buf, 0xCu);
  }

  [(NPHCellularSetupViewController *)self setType:8];
  [(id)objc_opt_class() _logEventOncePerSession:9];
  id v4 = [(OBBaseWelcomeController *)self navigationItem];
  if ([(NPHCellularSetupViewController *)self configuration] == 1)
  {
    BOOL v5 = [(NPHCellularSetupViewController *)self cancelNavBarButtonItem];
    [v4 setRightBarButtonItem:v5];
  }
  else
  {
    [v4 setRightBarButtonItem:0];
  }

  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"AKASHI_CONTINUE" value:&stru_26E895688 table:0];
  suggestedButtonTitle = self->_suggestedButtonTitle;
  self->_suggestedButtonTitle = v7;

  id v9 = [(BPSWelcomeOptinViewController *)self suggestedChoiceButton];
  [v9 removeTarget:self action:0 forControlEvents:64];

  int v10 = [(BPSWelcomeOptinViewController *)self suggestedChoiceButton];
  [v10 addTarget:self action:sel_userTappedContinue_ forControlEvents:64];

  alternateButtonTitle = self->_alternateButtonTitle;
  self->_alternateButtonTitle = 0;

  BOOL v12 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
  [v12 removeTarget:self action:0 forControlEvents:64];

  uint64_t v13 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
  [v13 setHidden:1];

  id v14 = [MEMORY[0x263EFFA08] setWithArray:self->_userVisibleErrors];
  __int16 v15 = [v14 allObjects];

  uint64_t v16 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v17 = v15;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v17);
        }
        BOOL v22 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v23 = objc_msgSend(v22, "localizedDescription", (void)v25);
        [v16 appendString:v23];

        uint64_t v24 = [v17 lastObject];
        LOBYTE(v22) = [v22 isEqual:v24];

        if ((v22 & 1) == 0) {
          [v16 appendString:@"\r\r"];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v19);
  }

  self->_shouldHideSkipButton = 1;
  [(UIActivityIndicatorView *)self->_spinner stopAnimating];
  [(NPHCellularSetupViewController *)self setDetailString:v16];
  [(BPSWelcomeOptinViewController *)self refreshViews];
}

- (id)_setUpNowDetailString
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"AKASHI_MESSAGE_SET_UP_NOW" value:&stru_26E895688 table:0];

  if (+[NPHSharedUtilities isActiveDeviceTinker])
  {
    int v4 = MGGetBoolAnswer();
    BOOL v5 = @"WIFI";
    if (v4) {
      BOOL v5 = @"WLAN";
    }
    id v6 = [NSString stringWithFormat:@"AKASHI_MESSAGE_TINKER_SET_UP_NOW_%@", v5];
    uint64_t v7 = NSString;
    id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:v6 value:&stru_26E895688 table:0];
    int v10 = +[NPHCellularBridgeUIManager sharedInstance];
    int v11 = [v10 tinkerFamilyMemberFirstName];
    uint64_t v12 = objc_msgSend(v7, "stringWithFormat:", v9, v11);

    id v3 = (void *)v12;
  }
  return v3;
}

- (void)updateUIToShowSetUpNow
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    uint64_t v16 = "-[NPHCellularSetupViewController updateUIToShowSetUpNow]";
    _os_log_impl(&dword_235444000, v3, OS_LOG_TYPE_DEFAULT, "Akashi - %s", (uint8_t *)&v15, 0xCu);
  }

  [(NPHCellularSetupViewController *)self setType:3];
  [(id)objc_opt_class() _logEventOncePerSession:5];
  int v4 = [(OBBaseWelcomeController *)self navigationItem];
  if ([(NPHCellularSetupViewController *)self configuration] == 1)
  {
    BOOL v5 = [(NPHCellularSetupViewController *)self cancelNavBarButtonItem];
    [v4 setRightBarButtonItem:v5];
  }
  else
  {
    [v4 setRightBarButtonItem:0];
  }

  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"AKASHI_SETUP_NOW" value:&stru_26E895688 table:0];
  suggestedButtonTitle = self->_suggestedButtonTitle;
  self->_suggestedButtonTitle = v7;

  id v9 = [(BPSWelcomeOptinViewController *)self suggestedChoiceButton];
  [v9 removeTarget:self action:0 forControlEvents:64];

  int v10 = [(BPSWelcomeOptinViewController *)self suggestedChoiceButton];
  [v10 addTarget:self action:sel_userTappedSetUp_ forControlEvents:64];

  alternateButtonTitle = self->_alternateButtonTitle;
  self->_alternateButtonTitle = 0;

  uint64_t v12 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
  [v12 removeTarget:self action:0 forControlEvents:64];

  uint64_t v13 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
  [v13 setHidden:1];

  self->_shouldHideSkipButton = 0;
  [(UIActivityIndicatorView *)self->_spinner stopAnimating];
  id v14 = [(NPHCellularSetupViewController *)self _setUpNowDetailString];
  [(NPHCellularSetupViewController *)self setDetailString:v14];

  [(BPSWelcomeOptinViewController *)self refreshViews];
}

- (void)updateUIToShowPlanTransferOrSetUpNewOptions
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v30 = "-[NPHCellularSetupViewController updateUIToShowPlanTransferOrSetUpNewOptions]";
    _os_log_impl(&dword_235444000, v3, OS_LOG_TYPE_DEFAULT, "Akashi - %s", buf, 0xCu);
  }

  [(NPHCellularSetupViewController *)self setType:4];
  int v4 = +[NPHCellularBridgeUIManager sharedInstance];
  BOOL v5 = [v4 transferableRemotePlan];
  id v6 = [v5 carrierName];

  uint64_t v7 = [(OBBaseWelcomeController *)self navigationItem];
  if ([(NPHCellularSetupViewController *)self configuration] == 1)
  {
    id v8 = [(NPHCellularSetupViewController *)self cancelNavBarButtonItem];
    [v7 setRightBarButtonItem:v8];
  }
  else
  {
    [v7 setRightBarButtonItem:0];
  }

  id v9 = NSString;
  int v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v11 = [v10 localizedStringForKey:@"AKASHI_SETUP_TRANSFER" value:&stru_26E895688 table:0];
  objc_msgSend(v9, "stringWithFormat:", v11, v6);
  uint64_t v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  suggestedButtonTitle = self->_suggestedButtonTitle;
  self->_suggestedButtonTitle = v12;

  id v14 = [(BPSWelcomeOptinViewController *)self suggestedChoiceButton];
  [v14 removeTarget:self action:0 forControlEvents:64];

  int v15 = [(BPSWelcomeOptinViewController *)self suggestedChoiceButton];
  [v15 addTarget:self action:sel_userTappedTransfer_ forControlEvents:64];

  uint64_t v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v17 = [v16 localizedStringForKey:@"AKASHI_SETUP_NEW" value:&stru_26E895688 table:0];
  alternateButtonTitle = self->_alternateButtonTitle;
  self->_alternateButtonTitle = v17;

  uint64_t v19 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
  [v19 removeTarget:self action:0 forControlEvents:64];

  uint64_t v20 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
  [v20 addTarget:self action:sel_userTappedSetUpNew_ forControlEvents:64];

  uint64_t v21 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
  [v21 setHidden:0];

  self->_shouldHideSkipButton = 0;
  [(UIActivityIndicatorView *)self->_spinner stopAnimating];
  LODWORD(v16) = +[NPHSharedUtilities isActiveDeviceTinker];
  BOOL v22 = NSString;
  uint64_t v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v24 = v23;
  if (v16)
  {
    long long v25 = [v23 localizedStringForKey:@"AKASHI_MESSAGE_TRANSFER_OR_NEW_TINKER" value:&stru_26E895688 table:0];
    long long v26 = +[NPHCellularBridgeUIManager sharedInstance];
    long long v27 = [v26 tinkerFamilyMemberFirstName];
    long long v28 = objc_msgSend(v22, "stringWithFormat:", v25, v27, v6);
    [(NPHCellularSetupViewController *)self setDetailString:v28];
  }
  else
  {
    long long v25 = [v23 localizedStringForKey:@"AKASHI_MESSAGE_TRANSFER_OR_NEW" value:&stru_26E895688 table:0];
    long long v26 = objc_msgSend(v22, "stringWithFormat:", v25, v6);
    [(NPHCellularSetupViewController *)self setDetailString:v26];
  }

  [(BPSWelcomeOptinViewController *)self refreshViews];
}

- (void)updateUIToShowSetUpNowMultipleSubscriptions
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v36 = "-[NPHCellularSetupViewController updateUIToShowSetUpNowMultipleSubscriptions]";
    _os_log_impl(&dword_235444000, v3, OS_LOG_TYPE_DEFAULT, "Akashi - %s", buf, 0xCu);
  }

  [(NPHCellularSetupViewController *)self setType:5];
  [(id)objc_opt_class() _logEventOncePerSession:5];
  int v4 = [(OBBaseWelcomeController *)self navigationItem];
  if ([(NPHCellularSetupViewController *)self configuration] == 1)
  {
    BOOL v5 = [(NPHCellularSetupViewController *)self cancelNavBarButtonItem];
    [v4 setRightBarButtonItem:v5];
  }
  else
  {
    [v4 setRightBarButtonItem:0];
  }

  unint64_t v6 = 0x264C53000uLL;
  uint64_t v7 = +[NPHCellularBridgeUIManager sharedInstance];
  id v8 = [v7 serviceSubscriptionsToOfferUser];

  id v9 = nph_general_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "-[NPHCellularSetupViewController updateUIToShowSetUpNowMultipleSubscriptions]";
    __int16 v37 = 2112;
    v38 = v8;
    _os_log_impl(&dword_235444000, v9, OS_LOG_TYPE_DEFAULT, "Akashi - %s serviceSubscriptionsToOfferUser:%@", buf, 0x16u);
  }

  int v10 = [(BPSWelcomeOptinViewController *)self suggestedChoiceButton];
  v34[0] = v10;
  int v11 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
  v34[1] = v11;
  uint64_t v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];

  uint64_t v12 = 0;
  char v13 = 1;
  do
  {
    char v33 = v13;
    id v14 = [v8 objectAtIndex:v12];
    [*(id *)(v6 + 1016) sharedInstance];
    v16 = unint64_t v15 = v6;
    uint64_t v17 = [v16 simLabelForSubscription:v14];

    uint64_t v18 = NSString;
    uint64_t v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    [v19 localizedStringForKey:@"AKASHI_SETUP_CARRIER_NOW" value:&stru_26E895688 table:0];
    v21 = uint64_t v20 = v8;
    objc_msgSend(v18, "stringWithFormat:", v21, v17);
    BOOL v22 = (objc_class *)objc_claimAutoreleasedReturnValue();

    uint64_t v23 = [v32 objectAtIndexedSubscript:v12];
    uint64_t v24 = [v32 objectAtIndexedSubscript:v12];
    long long v25 = [(BPSWelcomeOptinViewController *)self suggestedChoiceButton];

    long long v26 = &OBJC_IVAR___NPHCellularSetupViewController__alternateButtonTitle;
    if (v24 == v25) {
      long long v26 = &OBJC_IVAR___NPHCellularSetupViewController__suggestedButtonTitle;
    }
    uint64_t v27 = *v26;
    long long v28 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v27);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v27) = v22;
    int64_t v29 = v22;

    [v23 removeTarget:self action:0 forControlEvents:64];
    [v23 addTarget:self action:sel_userTappedSetUpCarrier_ forControlEvents:64];
    objc_setAssociatedObject(v23, sel_updateUIToShowSetUpNowMultipleSubscriptions, v14, (void *)1);

    id v8 = v20;
    unint64_t v6 = v15;

    char v13 = 0;
    uint64_t v12 = 1;
  }
  while ((v33 & 1) != 0);
  __int16 v30 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
  [v30 setHidden:0];

  self->_shouldHideSkipButton = 0;
  [(UIActivityIndicatorView *)self->_spinner stopAnimating];
  uint64_t v31 = [(NPHCellularSetupViewController *)self _setUpNowDetailString];
  [(NPHCellularSetupViewController *)self setDetailString:v31];

  [(BPSWelcomeOptinViewController *)self refreshViews];
}

- (void)updateUIToShowPlanSetUpTrial
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    uint64_t v16 = "-[NPHCellularSetupViewController updateUIToShowPlanSetUpTrial]";
    _os_log_impl(&dword_235444000, v3, OS_LOG_TYPE_DEFAULT, "Akashi - %s", (uint8_t *)&v15, 0xCu);
  }

  [(NPHCellularSetupViewController *)self setType:6];
  [(id)objc_opt_class() _logEventOncePerSession:8];
  int v4 = [(OBBaseWelcomeController *)self navigationItem];
  if ([(NPHCellularSetupViewController *)self configuration] == 1)
  {
    BOOL v5 = [(NPHCellularSetupViewController *)self cancelNavBarButtonItem];
    [v4 setRightBarButtonItem:v5];
  }
  else
  {
    [v4 setRightBarButtonItem:0];
  }

  unint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"AKASHI_SETUP_NOW" value:&stru_26E895688 table:0];
  suggestedButtonTitle = self->_suggestedButtonTitle;
  self->_suggestedButtonTitle = v7;

  id v9 = [(BPSWelcomeOptinViewController *)self suggestedChoiceButton];
  [v9 removeTarget:self action:0 forControlEvents:64];

  int v10 = [(BPSWelcomeOptinViewController *)self suggestedChoiceButton];
  [v10 addTarget:self action:sel_userTappedSetUp_ forControlEvents:64];

  alternateButtonTitle = self->_alternateButtonTitle;
  self->_alternateButtonTitle = 0;

  uint64_t v12 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
  [v12 removeTarget:self action:0 forControlEvents:64];

  char v13 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
  [v13 setHidden:1];

  self->_shouldHideSkipButton = 0;
  [(UIActivityIndicatorView *)self->_spinner stopAnimating];
  id v14 = [(NPHCellularSetupViewController *)self trialOfferMessage];
  [(NPHCellularSetupViewController *)self setDetailString:v14];

  [(BPSWelcomeOptinViewController *)self refreshViews];
}

- (id)trialOfferMessage
{
  uint64_t v2 = +[NPHCellularBridgeUIManager sharedInstance];
  id v3 = [v2 trialPlanType];

  if (![(__CFString *)v3 length])
  {

    id v3 = @"FREEORSPECIAL";
  }
  int v4 = [(__CFString *)v3 uppercaseString];
  BOOL v5 = [@"AKASHI_MESSAGE_SET_UP_TRIAL_" stringByAppendingString:v4];

  unint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:v5 value:&stru_26E895688 table:0];

  if ([v7 hasPrefix:@"AKASHI_MESSAGE_SET_UP_TRIAL_"])
  {
    id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"AKASHI_MESSAGE_SET_UP_TRIAL_FREEORSPECIAL" value:&stru_26E895688 table:0];

    uint64_t v7 = (void *)v9;
  }
  int v10 = +[NPHCellularBridgeUIManager sharedInstance];
  int v11 = +[NPHCellularBridgeUIManager sharedInstance];
  uint64_t v12 = [v11 serviceSubscriptionsOfferingTrialPlan];
  char v13 = [v12 firstObject];
  id v14 = [v10 carrierNameForSubscription:v13];

  int v15 = [NSString stringWithValidatedFormat:v7, @"%@", 0, v14 validFormatSpecifiers error];

  return v15;
}

- (void)_decideWhetherToShowTransferOrSetup
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315138;
    uint64_t v20 = "-[NPHCellularSetupViewController _decideWhetherToShowTransferOrSetup]";
    _os_log_impl(&dword_235444000, v3, OS_LOG_TYPE_DEFAULT, "Akashi - %s", (uint8_t *)&v19, 0xCu);
  }

  int v4 = +[NPHCellularBridgeUIManager sharedInstance];
  int v5 = [v4 isTinkerCrossCarrierSetup];

  if (v5)
  {
    [(NPHCellularSetupViewController *)self setIsTinkerCrossCarrierSetUpFlow:1];
    [(NPHCellularSetupViewController *)self updateUIToShowSetUpNow];
  }
  else
  {
    if ([(NPHCellularSetupViewController *)self configuration] == 2)
    {
      unint64_t v6 = [(BPSWelcomeOptinViewController *)self delegate];
      uint64_t v7 = [v6 setupFlowUserInfo];

      id v8 = [v7 objectForKey:*MEMORY[0x263F2BB90]];
      uint64_t v9 = v8;
      if (v8)
      {
        int v10 = [v8 valueForProperty:*MEMORY[0x263F57550]];
      }
      else
      {
        int v11 = [v7 objectForKey:*MEMORY[0x263F2BB88]];
        uint64_t v12 = v11;
        if (v11)
        {
          int v10 = [v11 deviceCSN];
        }
        else
        {
          int v10 = 0;
        }
      }
      char v13 = nph_general_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136315650;
        uint64_t v20 = "-[NPHCellularSetupViewController _decideWhetherToShowTransferOrSetup]";
        __int16 v21 = 2112;
        BOOL v22 = v7;
        __int16 v23 = 2112;
        uint64_t v24 = v10;
        _os_log_impl(&dword_235444000, v13, OS_LOG_TYPE_DEFAULT, "%s - setupMetadata:%@ CSN:%@", (uint8_t *)&v19, 0x20u);
      }
    }
    else
    {
      int v10 = 0;
    }
    id v14 = +[NPHCellularBridgeUIManager sharedInstance];
    int v15 = [v14 shouldAllowUserToTransferPlanFromDeviceWithCSN:v10];

    if (v15)
    {
      [(NPHCellularSetupViewController *)self updateUIToShowPlanTransferOrSetUpNewOptions];
    }
    else if ([(NPHCellularSetupViewController *)self isGeminiSetup])
    {
      [(NPHCellularSetupViewController *)self updateUIToShowSetUpNowMultipleSubscriptions];
    }
    else
    {
      uint64_t v16 = +[NPHCellularBridgeUIManager sharedInstance];
      uint64_t v17 = [v16 serviceSubscriptionsOfferingTrialPlan];
      uint64_t v18 = [v17 count];

      if (v18) {
        [(NPHCellularSetupViewController *)self updateUIToShowPlanSetUpTrial];
      }
      else {
        [(NPHCellularSetupViewController *)self updateUIToShowSetUpNow];
      }
    }
  }
}

- (void)presentationControllerWillDismiss:(id)a3
{
  if ([(NPHCellularSetupViewController *)self configuration] == 1
    && [(NPHCellularSetupViewController *)self type] == 2)
  {
    [(NPHCellularSetupViewController *)self userTappedConsent:0];
  }
}

- (id)tapToRadarMetadata
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F2BBB8]) initWithComponent:3];
  return v2;
}

- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->miniFlowDelegate);
  return (BPSSetupMiniFlowControllerDelegate *)WeakRetained;
}

- (void)setMiniFlowDelegate:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)haveReceivedProxyPlanItems
{
  return self->_haveReceivedProxyPlanItems;
}

- (void)setHaveReceivedProxyPlanItems:(BOOL)a3
{
  self->_haveReceivedProxyPlanItems = a3;
}

- (BOOL)isTinkerCrossCarrierSetUpFlow
{
  return self->_isTinkerCrossCarrierSetUpFlow;
}

- (void)setIsTinkerCrossCarrierSetUpFlow:(BOOL)a3
{
  self->_isTinkerCrossCarrierSetUpFlow = a3;
}

- (BOOL)isCellularSetupFlowComplete
{
  return self->_isCellularSetupFlowComplete;
}

- (void)setIsCellularSetupFlowComplete:(BOOL)a3
{
  self->_isCellularSetupFlowComplete = a3;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (UIBarButtonItem)nextNavBarButtonItem
{
  return self->_nextNavBarButtonItem;
}

- (void)setNextNavBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)cancelNavBarButtonItem
{
  return self->_cancelNavBarButtonItem;
}

- (void)setCancelNavBarButtonItem:(id)a3
{
}

- (NSString)detailString
{
  return self->_detailString;
}

- (void)setDetailString:(id)a3
{
}

- (NSString)suggestedButtonTitle
{
  return self->_suggestedButtonTitle;
}

- (void)setSuggestedButtonTitle:(id)a3
{
}

- (NSString)alternateButtonTitle
{
  return self->_alternateButtonTitle;
}

- (void)setAlternateButtonTitle:(id)a3
{
}

- (NSArray)userVisibleErrors
{
  return self->_userVisibleErrors;
}

- (void)setUserVisibleErrors:(id)a3
{
}

- (int64_t)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(int64_t)a3
{
  self->_configuration = a3;
}

- (SUBManager)subManager
{
  return self->_subManager;
}

- (void)setSubManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subManager, 0);
  objc_storeStrong((id *)&self->_userVisibleErrors, 0);
  objc_storeStrong((id *)&self->_alternateButtonTitle, 0);
  objc_storeStrong((id *)&self->_suggestedButtonTitle, 0);
  objc_storeStrong((id *)&self->_detailString, 0);
  objc_storeStrong((id *)&self->_cancelNavBarButtonItem, 0);
  objc_storeStrong((id *)&self->_nextNavBarButtonItem, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_destroyWeak((id *)&self->miniFlowDelegate);
}

void __62__NPHCellularSetupViewController_ctCellularPlanInfoDidChange___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t __62__NPHCellularSetupViewController_ctCellularPlanInfoDidChange___block_invoke_300_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __52__NPHCellularSetupViewController_userTappedConsent___block_invoke_2_cold_1(v0);
}

void __52__NPHCellularSetupViewController_userTappedConsent___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __42__NPHCellularSetupViewController_setUpNow__block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 136315394;
  int v4 = "-[NPHCellularSetupViewController setUpNow]_block_invoke_2";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_235444000, a2, OS_LOG_TYPE_ERROR, "%s - Error in installPendingCellularPlan error:%@", (uint8_t *)&v3, 0x16u);
}

void __42__NPHCellularSetupViewController_setUpNow__block_invoke_2_354_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *a2;
  int v5 = 136315650;
  uint64_t v6 = "-[NPHCellularSetupViewController setUpNow]_block_invoke_2";
  __int16 v7 = 2112;
  uint64_t v8 = v3;
  __int16 v9 = 2112;
  uint64_t v10 = v4;
  _os_log_error_impl(&dword_235444000, log, OS_LOG_TYPE_ERROR, "%s - Error setting up cellular plan - subscriptionContext:%@ error:%@", (uint8_t *)&v5, 0x20u);
}

void __42__NPHCellularSetupViewController_transfer__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __57__NPHCellularSetupViewController_userTappedSetUpCarrier___block_invoke_2_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *a2;
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_235444000, log, OS_LOG_TYPE_ERROR, "Error setting up cellular plan - subscriptionContext:%@ error:%@", (uint8_t *)&v5, 0x16u);
}

@end