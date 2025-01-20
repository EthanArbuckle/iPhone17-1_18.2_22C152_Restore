@interface DKEraseFlow
+ (id)_stringForState:(unint64_t)a3;
- (BOOL)_isHomeButtonAllowedForState:(unint64_t)a3;
- (BOOL)allowExpensiveCellular;
- (BOOL)cloudUploadSucceeded;
- (BOOL)continueWithoutInternet;
- (BOOL)eraseDataPlan;
- (BOOL)isCloudUploadInProgress;
- (BOOL)requiresADPSpecificInternetWarning;
- (BOOL)skipLocalDataCheck;
- (BSInvalidatable)homeButtonConsumer;
- (Class)_viewControllerClassForState:(unint64_t)a3;
- (DKAccountProvider)accountProvider;
- (DKCloudProvider)cloudProvider;
- (DKCloudUploadResults)cloudUploadResults;
- (DKConfiguration)configuration;
- (DKEraseFlow)initWithConfiguration:(id)a3;
- (DKEraseFlow)initWithNavigationController:(id)a3;
- (DKEraseFlow)initWithNavigationController:(id)a3 configuration:(id)a4;
- (DKFindMyProvider)findMyProvider;
- (DKNotableUserData)notableUserData;
- (DKNotableUserDataProvider)notableUserDataProvider;
- (DKPasscodeProvider)passcodeProvider;
- (DKWalletProvider)walletProvider;
- (NSString)deviceName;
- (NWPathEvaluator)pathEvaluator;
- (UINavigationController)navigationController;
- (UIViewController)initialViewController;
- (double)cloudUploadTimeRemaining;
- (float)cloudUploadProgress;
- (id)_viewControllerForState:(unint64_t)a3;
- (id)cloudUploadCompletion;
- (id)cloudUploadProgressHandler;
- (id)completion;
- (id)eraseDevice;
- (id)hasInternetConnectivity;
- (id)initForSetupAssistant;
- (id)isBasebandDead;
- (id)presentNetworkSettings;
- (id)startFlow;
- (unint64_t)state;
- (void)_advanceFromInternetWarningAfterPresentedNetworkSettingsDismisses:(id)a3;
- (void)_advanceFromState:(unint64_t)a3;
- (void)_advanceToState:(unint64_t)a3;
- (void)_allowHomeButton;
- (void)_disallowHomeButton;
- (void)_endFlow;
- (void)_endFlowForCancellationWithReason:(id)a3;
- (void)_endFlowWithReason:(id)a3;
- (void)_eraseDevice;
- (void)_hostWillTerminate;
- (void)_nextStateFromState:(unint64_t)a3 completion:(id)a4;
- (void)_presentEraseConfirmation:(id)a3;
- (void)_registerForAnalyticsNotifications;
- (void)_sendTerminatedAnalyticsEventWithState:(unint64_t)a3 willErase:(BOOL)a4 reason:(id)a5;
- (void)_signOutAndEraseDevice;
- (void)_startFlow;
- (void)_startNonInteractiveCloudUpload;
- (void)_supportsNonInteractiveCloudUpload:(id)a3;
- (void)_unregisterForAnalyticsNotifications;
- (void)prepareFlow:(id)a3;
- (void)setAccountProvider:(id)a3;
- (void)setAllowExpensiveCellular:(BOOL)a3;
- (void)setCloudProvider:(id)a3;
- (void)setCloudUploadCompletion:(id)a3;
- (void)setCloudUploadInProgress:(BOOL)a3;
- (void)setCloudUploadProgress:(float)a3;
- (void)setCloudUploadProgressHandler:(id)a3;
- (void)setCloudUploadResults:(id)a3;
- (void)setCloudUploadSucceeded:(BOOL)a3;
- (void)setCloudUploadTimeRemaining:(double)a3;
- (void)setCompletion:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setContinueWithoutInternet:(BOOL)a3;
- (void)setDeviceName:(id)a3;
- (void)setEraseDataPlan:(BOOL)a3;
- (void)setEraseDevice:(id)a3;
- (void)setFindMyProvider:(id)a3;
- (void)setHasInternetConnectivity:(id)a3;
- (void)setHomeButtonConsumer:(id)a3;
- (void)setInitialViewController:(id)a3;
- (void)setIsBasebandDead:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setNotableUserData:(id)a3;
- (void)setNotableUserDataProvider:(id)a3;
- (void)setPasscodeProvider:(id)a3;
- (void)setPathEvaluator:(id)a3;
- (void)setPresentNetworkSettings:(id)a3;
- (void)setRequiresADPSpecificInternetWarning:(BOOL)a3;
- (void)setSkipLocalDataCheck:(BOOL)a3;
- (void)setWalletProvider:(id)a3;
- (void)showFlowContainerFromParentViewController:(id)a3 completion:(id)a4;
@end

@implementation DKEraseFlow

- (DKEraseFlow)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v37.receiver = self;
  v37.super_class = (Class)DKEraseFlow;
  v6 = [(DKEraseFlow *)&v37 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    id eraseDevice = v7->_eraseDevice;
    v7->_id eraseDevice = &__block_literal_global_1;

    objc_initWeak(&location, v7);
    v9 = (NWPathEvaluator *)objc_alloc_init(MEMORY[0x263F14420]);
    pathEvaluator = v7->_pathEvaluator;
    v7->_pathEvaluator = v9;

    uint64_t v31 = MEMORY[0x263EF8330];
    uint64_t v32 = 3221225472;
    v33 = __37__DKEraseFlow_initWithConfiguration___block_invoke_37;
    v34 = &unk_264CF1158;
    objc_copyWeak(&v35, &location);
    uint64_t v11 = MEMORY[0x237E2A3E0](&v31);
    id hasInternetConnectivity = v7->_hasInternetConnectivity;
    v7->_id hasInternetConnectivity = (id)v11;

    id isBasebandDead = v7->_isBasebandDead;
    v7->_id isBasebandDead = &__block_literal_global_40;

    id presentNetworkSettings = v7->_presentNetworkSettings;
    v7->_id presentNetworkSettings = &__block_literal_global_43;

    v15 = objc_alloc_init(DKFindMyProvider);
    findMyProvider = v7->_findMyProvider;
    v7->_findMyProvider = v15;

    v17 = objc_alloc_init(DKPasscodeProvider);
    passcodeProvider = v7->_passcodeProvider;
    v7->_passcodeProvider = v17;

    v19 = objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice", v31, v32, v33, v34);
    uint64_t v20 = [v19 name];
    deviceName = v7->_deviceName;
    v7->_deviceName = (NSString *)v20;

    v22 = objc_alloc_init(DKCloudProvider);
    cloudProvider = v7->_cloudProvider;
    v7->_cloudProvider = v22;

    v24 = objc_alloc_init(DKWalletProvider);
    walletProvider = v7->_walletProvider;
    v7->_walletProvider = v24;

    v26 = [[DKAccountProvider alloc] initWithFindMyProvider:v7->_findMyProvider];
    accountProvider = v7->_accountProvider;
    v7->_accountProvider = v26;

    v28 = [[DKNotableUserDataProvider alloc] initWithAccountProvider:v7->_accountProvider findMyProvider:v7->_findMyProvider walletProvider:v7->_walletProvider];
    notableUserDataProvider = v7->_notableUserDataProvider;
    v7->_notableUserDataProvider = v28;

    v7->_eraseDataPlan = 0;
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __37__DKEraseFlow_initWithConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = objc_alloc_init(MEMORY[0x263F3B438]);
  [v3 setEraseDataPlan:a2];
  v4 = _DKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_237B3F000, v4, OS_LOG_TYPE_DEFAULT, "Erasing data partition...", v7, 2u);
  }

  id v5 = (void *)[objc_alloc(MEMORY[0x263F3B440]) initWithMode:4 options:v3 reason:@"Disembark"];
  v6 = [MEMORY[0x263F3B448] sharedInstance];
  [v6 resetWithRequest:v5 completion:&__block_literal_global_31];
}

void __37__DKEraseFlow_initWithConfiguration___block_invoke_28(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _DKLogSystem();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __37__DKEraseFlow_initWithConfiguration___block_invoke_28_cold_1(v2, v4);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_237B3F000, v4, OS_LOG_TYPE_DEFAULT, "Erase succeeded", v5, 2u);
  }
}

BOOL __37__DKEraseFlow_initWithConfiguration___block_invoke_37(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained pathEvaluator];
  id v3 = [v2 path];

  BOOL v4 = ([v3 status] & 0xFFFFFFFFFFFFFFFDLL) != 0;
  return v4;
}

uint64_t __37__DKEraseFlow_initWithConfiguration___block_invoke_2()
{
  return 0;
}

void __37__DKEraseFlow_initWithConfiguration___block_invoke_3()
{
  id v1 = [MEMORY[0x263F01880] defaultWorkspace];
  v0 = [NSURL URLWithString:@"prefs://root=WIFI"];
  [v1 openSensitiveURL:v0 withOptions:0];
}

- (id)initForSetupAssistant
{
  id v3 = +[DKConfiguration setupAssistantConfiguration];
  BOOL v4 = [(DKEraseFlow *)self initWithConfiguration:v3];

  return v4;
}

- (DKEraseFlow)initWithNavigationController:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  v8 = [(DKEraseFlow *)self initWithConfiguration:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_navigationController, a3);
  }

  return v9;
}

- (DKEraseFlow)initWithNavigationController:(id)a3
{
  id v4 = a3;
  id v5 = +[DKConfiguration defaultConfiguration];
  v6 = [(DKEraseFlow *)self initWithNavigationController:v4 configuration:v5];

  return v6;
}

- (void)prepareFlow:(id)a3
{
  id v4 = a3;
  id v5 = _DKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_237B3F000, v5, OS_LOG_TYPE_DEFAULT, "Preparing flow...", buf, 2u);
  }

  v6 = dispatch_get_global_queue(25, 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __27__DKEraseFlow_prepareFlow___block_invoke;
  v8[3] = &unk_264CF1218;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __27__DKEraseFlow_prepareFlow___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) findMyProvider];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __27__DKEraseFlow_prepareFlow___block_invoke_2;
  v4[3] = &unk_264CF0E68;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 fetchFindMyState:v4];
}

void __27__DKEraseFlow_prepareFlow___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) notableUserDataProvider];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __27__DKEraseFlow_prepareFlow___block_invoke_3;
  v4[3] = &unk_264CF11F0;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 fetchNotableUserData:v4];
}

void __27__DKEraseFlow_prepareFlow___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __27__DKEraseFlow_prepareFlow___block_invoke_4;
  v6[3] = &unk_264CF11C8;
  v6[4] = v4;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 _supportsNonInteractiveCloudUpload:v6];
}

void __27__DKEraseFlow_prepareFlow___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__DKEraseFlow_prepareFlow___block_invoke_5;
  block[3] = &unk_264CF11A0;
  char v12 = a2;
  v6 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v11 = *(id *)(a1 + 48);
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __27__DKEraseFlow_prepareFlow___block_invoke_5(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = _DKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_237B3F000, v2, OS_LOG_TYPE_DEFAULT, "Flow preparation completed!", (uint8_t *)&v8, 2u);
  }

  int v3 = *(unsigned __int8 *)(a1 + 64);
  id v4 = _DKLogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_237B3F000, v4, OS_LOG_TYPE_DEFAULT, "Starting non-interactive cloud upload...", (uint8_t *)&v8, 2u);
    }

    [*(id *)(a1 + 32) _startNonInteractiveCloudUpload];
  }
  else
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v8 = 138543362;
      uint64_t v9 = v6;
      _os_log_impl(&dword_237B3F000, v4, OS_LOG_TYPE_DEFAULT, "Unable to start non-interactive cloud upload (%{public}@)", (uint8_t *)&v8, 0xCu);
    }
  }
  [*(id *)(a1 + 32) setNotableUserData:*(void *)(a1 + 48)];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)showFlowContainerFromParentViewController:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(DKEraseFlow *)self navigationController];
  [v8 setModalPresentationStyle:0];

  id v9 = [(DKEraseFlow *)self navigationController];
  [v7 presentViewController:v9 animated:1 completion:v6];
}

- (id)startFlow
{
  [(DKEraseFlow *)self _startFlow];
  return [(DKEraseFlow *)self initialViewController];
}

- (UINavigationController)navigationController
{
  if (!self->_navigationController)
  {
    int v3 = [(DKEraseFlow *)self initialViewController];

    if (v3)
    {
      id v4 = [(DKEraseFlow *)self initialViewController];
      BOOL v5 = [v4 navigationController];
      [(DKEraseFlow *)self setNavigationController:v5];
    }
  }
  navigationController = self->_navigationController;
  return navigationController;
}

- (void)_registerForAnalyticsNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__hostWillTerminate name:*MEMORY[0x263F1D570] object:0];
}

- (void)_unregisterForAnalyticsNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D570] object:0];
}

- (void)_sendTerminatedAnalyticsEventWithState:(unint64_t)a3 willErase:(BOOL)a4 reason:(id)a5
{
  BOOL v5 = a4;
  v17[3] = *MEMORY[0x263EF8340];
  v16[0] = @"lastPaneShown";
  id v7 = a5;
  int v8 = [(id)objc_opt_class() _stringForState:a3];
  v17[0] = v8;
  v16[1] = @"successful";
  id v9 = [NSNumber numberWithBool:v5];
  v16[2] = @"reason";
  v17[1] = v9;
  v17[2] = v7;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];

  id v11 = _DKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    v13 = @"com.apple.disembarkUI.exited";
    __int16 v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_237B3F000, v11, OS_LOG_TYPE_DEFAULT, "Sending event for %@ with payload %@", (uint8_t *)&v12, 0x16u);
  }

  AnalyticsSendEvent();
}

- (void)_hostWillTerminate
{
  [(DKEraseFlow *)self _unregisterForAnalyticsNotifications];
  unint64_t v3 = [(DKEraseFlow *)self state];
  [(DKEraseFlow *)self _sendTerminatedAnalyticsEventWithState:v3 willErase:0 reason:@"Terminated"];
}

- (void)_supportsNonInteractiveCloudUpload:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(DKEraseFlow *)self accountProvider];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__DKEraseFlow__supportsNonInteractiveCloudUpload___block_invoke;
  v7[3] = &unk_264CF1290;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 preparationRequiredForPrimaryAppleAccountWithCompletion:v7];
}

void __50__DKEraseFlow__supportsNonInteractiveCloudUpload___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__DKEraseFlow__supportsNonInteractiveCloudUpload___block_invoke_2;
  v8[3] = &unk_264CF1268;
  id v9 = v5;
  id v6 = *(id *)(a1 + 40);
  char v12 = a2;
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

void __50__DKEraseFlow__supportsNonInteractiveCloudUpload___block_invoke_2(uint64_t a1)
{
  id v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    unint64_t v3 = _DKLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __50__DKEraseFlow__supportsNonInteractiveCloudUpload___block_invoke_2_cold_1(v2, v3);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else if (*(unsigned char *)(a1 + 56))
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
  else
  {
    id v5 = [*(id *)(a1 + 40) cloudProvider];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __50__DKEraseFlow__supportsNonInteractiveCloudUpload___block_invoke_85;
    v7[3] = &unk_264CF1240;
    id v6 = *(id *)(a1 + 48);
    v7[4] = *(void *)(a1 + 40);
    id v8 = v6;
    [v5 hasDataToUpload:v7];
  }
}

void __50__DKEraseFlow__supportsNonInteractiveCloudUpload___block_invoke_85(uint64_t a1, char a2)
{
  if (a2)
  {
    unint64_t v3 = [*(id *)(a1 + 32) configuration];
    char v4 = [v3 allowNonInteractiveCloudUpload];

    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) cloudProvider];
      int v6 = [v5 isRestoring];

      if (v6)
      {
        id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      }
      else
      {
        id v8 = [*(id *)(a1 + 32) cloudProvider];
        uint64_t v9 = [v8 isUploadSupportedForCurrentNetwork];

        if (!v9 || v9 == 2)
        {
          id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
        }
        else
        {
          if (v9 != 1) {
            return;
          }
          id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
        }
      }
    }
    else
    {
      id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
  }
  else
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
}

- (void)_startNonInteractiveCloudUpload
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__DKEraseFlow__startNonInteractiveCloudUpload__block_invoke;
  v7[3] = &unk_264CF12B8;
  objc_copyWeak(&v8, &location);
  [(DKEraseFlow *)self setCloudUploadProgressHandler:v7];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__DKEraseFlow__startNonInteractiveCloudUpload__block_invoke_2;
  v5[3] = &unk_264CF12E0;
  objc_copyWeak(&v6, &location);
  [(DKEraseFlow *)self setCloudUploadCompletion:v5];
  [(DKEraseFlow *)self setCloudUploadInProgress:1];
  unint64_t v3 = dispatch_get_global_queue(25, 0);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__DKEraseFlow__startNonInteractiveCloudUpload__block_invoke_3;
  v4[3] = &unk_264CF0A98;
  v4[4] = self;
  dispatch_async(v3, v4);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __46__DKEraseFlow__startNonInteractiveCloudUpload__block_invoke(uint64_t a1, float a2, double a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v5 = a2;
  [WeakRetained setCloudUploadProgress:v5];
  [WeakRetained setCloudUploadTimeRemaining:a3];
}

void __46__DKEraseFlow__startNonInteractiveCloudUpload__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setCloudUploadResults:v3];
  LODWORD(v2) = [v3 success];

  if (v2)
  {
    [WeakRetained setCloudUploadSucceeded:1];
    [WeakRetained setCloudUploadProgress:0.0];
  }
}

void __46__DKEraseFlow__startNonInteractiveCloudUpload__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cloudProvider];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__DKEraseFlow__startNonInteractiveCloudUpload__block_invoke_4;
  v4[3] = &unk_264CF1308;
  uint64_t v5 = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __46__DKEraseFlow__startNonInteractiveCloudUpload__block_invoke_5;
  v3[3] = &unk_264CF1330;
  v3[4] = v5;
  [v2 beginUploadAllowingExpensiveCellular:0 progressHandler:v4 completion:v3];
}

void __46__DKEraseFlow__startNonInteractiveCloudUpload__block_invoke_4(uint64_t a1, float a2, double a3)
{
  id v6 = [*(id *)(a1 + 32) cloudUploadProgressHandler];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) cloudUploadProgressHandler];
    v7[2](a2, a3);
  }
}

void __46__DKEraseFlow__startNonInteractiveCloudUpload__block_invoke_5(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) cloudUploadCompletion];

  if (v3)
  {
    char v4 = [*(id *)(a1 + 32) cloudUploadCompletion];
    ((void (**)(void, id))v4)[2](v4, v5);
  }
}

- (void)_startFlow
{
  id v3 = _DKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v4 = 0;
    _os_log_impl(&dword_237B3F000, v3, OS_LOG_TYPE_DEFAULT, "Starting flow...", v4, 2u);
  }

  [MEMORY[0x263F3A3A8] clearFollowUp];
  [(DKEraseFlow *)self _registerForAnalyticsNotifications];
  [(DKEraseFlow *)self _advanceToState:0];
}

- (void)_endFlowWithReason:(id)a3
{
  id v4 = a3;
  [(DKEraseFlow *)self _sendTerminatedAnalyticsEventWithState:[(DKEraseFlow *)self state] willErase:1 reason:v4];

  [(DKEraseFlow *)self _endFlow];
}

- (void)_endFlowForCancellationWithReason:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(DKEraseFlow *)self state];
  id v6 = [NSString stringWithFormat:@"User Cancelled (%@)", v4];

  [(DKEraseFlow *)self _sendTerminatedAnalyticsEventWithState:v5 willErase:1 reason:v6];
  [(DKEraseFlow *)self _endFlow];
}

- (void)_endFlow
{
  id v3 = _DKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_237B3F000, v3, OS_LOG_TYPE_DEFAULT, "Ending flow...", v6, 2u);
  }

  [(DKEraseFlow *)self _allowHomeButton];
  [(DKEraseFlow *)self _unregisterForAnalyticsNotifications];
  id v4 = [(DKEraseFlow *)self completion];

  if (v4)
  {
    unint64_t v5 = [(DKEraseFlow *)self completion];
    v5[2]();
  }
  else
  {
    unint64_t v5 = [(DKEraseFlow *)self navigationController];
    [v5 dismissViewControllerAnimated:1 completion:0];
  }
}

- (unint64_t)state
{
  id v3 = [(DKEraseFlow *)self navigationController];
  id v4 = [v3 topViewController];
  unint64_t v5 = (objc_class *)objc_opt_class();

  if (v5 == [(DKEraseFlow *)self _viewControllerClassForState:0]) {
    return 0;
  }
  unint64_t v6 = 1;
  if (v5 != [(DKEraseFlow *)self _viewControllerClassForState:1])
  {
    unint64_t v6 = 2;
    if (v5 != [(DKEraseFlow *)self _viewControllerClassForState:2])
    {
      unint64_t v6 = 7;
      if (v5 != [(DKEraseFlow *)self _viewControllerClassForState:7])
      {
        unint64_t v6 = 3;
        if (v5 != [(DKEraseFlow *)self _viewControllerClassForState:3])
        {
          unint64_t v6 = 4;
          if (v5 != [(DKEraseFlow *)self _viewControllerClassForState:4]) {
            return 5;
          }
        }
      }
    }
  }
  return v6;
}

- (void)_advanceFromState:(unint64_t)a3
{
  unint64_t v5 = [(DKEraseFlow *)self navigationController];
  unint64_t v6 = [v5 topViewController];
  id v7 = [v6 view];
  [v7 setUserInteractionEnabled:0];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __33__DKEraseFlow__advanceFromState___block_invoke;
  v8[3] = &unk_264CF1358;
  void v8[4] = self;
  [(DKEraseFlow *)self _nextStateFromState:a3 completion:v8];
}

uint64_t __33__DKEraseFlow__advanceFromState___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) navigationController];
  unint64_t v5 = [v4 topViewController];
  unint64_t v6 = [v5 view];
  [v6 setUserInteractionEnabled:1];

  id v7 = *(void **)(a1 + 32);
  return [v7 _advanceToState:a2];
}

- (void)_advanceFromInternetWarningAfterPresentedNetworkSettingsDismisses:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 presentedViewController];
  if (!v5) {
    -[DKEraseFlow _advanceFromInternetWarningAfterPresentedNetworkSettingsDismisses:]();
  }

  unint64_t v6 = _DKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_237B3F000, v6, OS_LOG_TYPE_DEFAULT, "Waiting for network settings dismissal", buf, 2u);
  }

  [v4 showBusy];
  id v7 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
  dispatch_source_set_timer(v7, 0, 0x5F5E100uLL, 0x989680uLL);
  *(void *)buf = 0;
  v15 = buf;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  objc_initWeak(&location, v4);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __81__DKEraseFlow__advanceFromInternetWarningAfterPresentedNetworkSettingsDismisses___block_invoke;
  handler[3] = &unk_264CF1380;
  objc_copyWeak(&v12, &location);
  uint64_t v10 = v7;
  id v11 = buf;
  handler[4] = self;
  id v8 = v7;
  dispatch_source_set_event_handler(v8, handler);
  dispatch_activate(v8);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);
}

void __81__DKEraseFlow__advanceFromInternetWarningAfterPresentedNetworkSettingsDismisses___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (!WeakRetained)
  {
    id v12 = _DKLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_237B3F000, v12, OS_LOG_TYPE_DEFAULT, "Detected internet warning release", v20, 2u);
    }

LABEL_14:
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
    goto LABEL_15;
  }
  id v4 = [WeakRetained presentedViewController];

  if (!v4)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      unint64_t v5 = _DKLogSystem();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_237B3F000, v5, OS_LOG_TYPE_DEFAULT, "Detected network settings dismissal", buf, 2u);
      }

      uint64_t v6 = [MEMORY[0x263EFF910] now];
      uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
      id v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
    uint64_t v9 = [*(id *)(a1 + 32) hasInternetConnectivity];
    int v10 = v9[2]();

    if (v10)
    {
      id v11 = _DKLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_237B3F000, v11, OS_LOG_TYPE_DEFAULT, "Detected network settings connectivity", v18, 2u);
      }

      [v3 showAvailable];
      objc_msgSend(*(id *)(a1 + 32), "_advanceFromState:", objc_msgSend(*(id *)(a1 + 32), "state"));
    }
    else
    {
      v13 = [MEMORY[0x263EFF910] now];
      [v13 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      double v15 = v14;

      if (v15 < 2.0) {
        goto LABEL_15;
      }
      uint64_t v16 = _DKLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_237B3F000, v16, OS_LOG_TYPE_DEFAULT, "Network settings did not change connectivity after delay", v17, 2u);
      }

      [v3 showAvailable];
    }
    goto LABEL_14;
  }
LABEL_15:
}

- (void)_advanceToState:(unint64_t)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  unint64_t v5 = _DKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(id)objc_opt_class() _stringForState:a3];
    *(_DWORD *)buf = 138543362;
    v34 = v6;
    _os_log_impl(&dword_237B3F000, v5, OS_LOG_TYPE_DEFAULT, "Advancing to state %{public}@...", buf, 0xCu);
  }
  if ([(DKEraseFlow *)self _isHomeButtonAllowedForState:a3]) {
    [(DKEraseFlow *)self _allowHomeButton];
  }
  else {
    [(DKEraseFlow *)self _disallowHomeButton];
  }
  uint64_t v7 = [(DKEraseFlow *)self _viewControllerForState:a3];
  if (v7)
  {
    id v8 = _DKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v34 = v7;
      _os_log_impl(&dword_237B3F000, v8, OS_LOG_TYPE_DEFAULT, "Pushing to %{public}@...", buf, 0xCu);
    }

    if (a3 != 4) {
      goto LABEL_20;
    }
    id v9 = v7;
    objc_initWeak((id *)buf, self);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __31__DKEraseFlow__advanceToState___block_invoke;
    v31[3] = &unk_264CF1308;
    id v10 = v9;
    id v32 = v10;
    [(DKEraseFlow *)self setCloudUploadProgressHandler:v31];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __31__DKEraseFlow__advanceToState___block_invoke_2;
    v28[3] = &unk_264CF13A8;
    objc_copyWeak(&v30, (id *)buf);
    id v11 = v10;
    id v29 = v11;
    [(DKEraseFlow *)self setCloudUploadCompletion:v28];
    if ([(DKEraseFlow *)self isCloudUploadInProgress])
    {
      id v12 = [(DKEraseFlow *)self cloudUploadProgressHandler];
      [(DKEraseFlow *)self cloudUploadProgress];
      float v14 = v13;
      [(DKEraseFlow *)self cloudUploadTimeRemaining];
      v12[2](v12, v14, v15);

      uint64_t v16 = [(DKEraseFlow *)self cloudUploadResults];

      if (!v16) {
        goto LABEL_19;
      }
      v17 = [(DKEraseFlow *)self cloudUploadResults];
      char v18 = [v17 success];

      if (v18) {
        goto LABEL_19;
      }
      id v19 = [(DKEraseFlow *)self cloudUploadCompletion];
      uint64_t v20 = [(DKEraseFlow *)self cloudUploadResults];
      ((void (**)(void, void *))v19)[2](v19, v20);
    }
    else
    {
      id v19 = [(DKEraseFlow *)self cloudProvider];
      BOOL v21 = [(DKEraseFlow *)self allowExpensiveCellular];
      uint64_t v20 = [(DKEraseFlow *)self cloudUploadProgressHandler];
      v22 = [(DKEraseFlow *)self cloudUploadCompletion];
      [v19 beginUploadAllowingExpensiveCellular:v21 progressHandler:v20 completion:v22];
    }
LABEL_19:

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);

LABEL_20:
    v23 = [(DKEraseFlow *)self navigationController];

    if (v23)
    {
      v24 = [(DKEraseFlow *)self navigationController];
      [v24 pushViewController:v7 animated:1];
    }
    else
    {
      [(DKEraseFlow *)self setInitialViewController:v7];
    }
    goto LABEL_25;
  }
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 7uLL:
      -[DKEraseFlow _advanceToState:]();
    case 5uLL:
      if ([(DKEraseFlow *)self continueWithoutInternet]) {
        [(DKEraseFlow *)self _eraseDevice];
      }
      else {
        [(DKEraseFlow *)self _signOutAndEraseDevice];
      }
      break;
    case 6uLL:
      v25 = [(DKEraseFlow *)self accountProvider];
      v26 = [(DKEraseFlow *)self navigationController];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __31__DKEraseFlow__advanceToState___block_invoke_3;
      v27[3] = &unk_264CF13D0;
      v27[4] = self;
      [v25 preparePrimaryAppleAccountForSignOutWithPresentingViewController:v26 completion:v27];

      break;
    default:
      break;
  }
LABEL_25:
}

uint64_t __31__DKEraseFlow__advanceToState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "uploadProgress:withTimeRemaining:");
}

void __31__DKEraseFlow__advanceToState___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 success])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _advanceToState:5];
  }
  else
  {
    [*(id *)(a1 + 32) uploadDidComplete:v4];
  }
}

void __31__DKEraseFlow__advanceToState___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__DKEraseFlow__advanceToState___block_invoke_4;
  block[3] = &unk_264CF0A20;
  char v9 = a2;
  block[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __31__DKEraseFlow__advanceToState___block_invoke_4(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 48))
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 _advanceFromState:6];
  }
  else
  {
    id v5 = _DKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      char v6 = _DKIsInternalInstall();
      uint64_t v7 = *(void **)(a1 + 40);
      if ((v6 & 1) == 0 && v7)
      {
        char v9 = NSString;
        id v1 = [*(id *)(a1 + 40) domain];
        uint64_t v7 = [v9 stringWithFormat:@"<Error domain: %@, code %ld>", v1, objc_msgSend(*(id *)(a1 + 40), "code")];
        int v8 = 1;
      }
      else
      {
        int v8 = 0;
      }
      *(_DWORD *)buf = 138412290;
      id v11 = v7;
      _os_log_error_impl(&dword_237B3F000, v5, OS_LOG_TYPE_ERROR, "Failed to prepare primary Apple Account for sign out: %@", buf, 0xCu);
      if (v8)
      {
      }
    }

    return [*(id *)(a1 + 32) _endFlowWithReason:@"Primary Apple Account Preparation Failure"];
  }
}

- (Class)_viewControllerClassForState:(unint64_t)a3
{
  if (a3 <= 7 && ((0x9Fu >> a3) & 1) != 0)
  {
    id v4 = objc_opt_class();
  }
  else
  {
    id v4 = 0;
  }
  return (Class)v4;
}

- (id)_viewControllerForState:(unint64_t)a3
{
  uint64_t v3 = 0;
  uint64_t v39 = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 0uLL:
      uint64_t v3 = objc_alloc_init(DKIntroViewController);
      id v5 = [(DKEraseFlow *)self notableUserData];
      [(DKIntroViewController *)v3 setNotableUserData:v5];

      char v6 = _DKLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = [(DKIntroViewController *)v3 notableUserData];
        *(_DWORD *)buf = 138412290;
        v38 = v7;
        _os_log_impl(&dword_237B3F000, v6, OS_LOG_TYPE_DEFAULT, "viewController.notableUserData %@", buf, 0xCu);
      }
      int v8 = [(DKEraseFlow *)self hasInternetConnectivity];
      [(DKIntroViewController *)v3 setHasInternetConnectivity:v8];

      char v9 = [(DKEraseFlow *)self isBasebandDead];
      [(DKIntroViewController *)v3 setIsBasebandDead:v9[2]()];

      id v10 = [(DKEraseFlow *)self configuration];
      -[DKIntroViewController setPreventOpeningSafari:](v3, "setPreventOpeningSafari:", [v10 preventOpeningSafari]);

      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __39__DKEraseFlow__viewControllerForState___block_invoke;
      v36[3] = &unk_264CF13F8;
      v36[4] = self;
      [(DKIntroViewController *)v3 setFetchRestoreState:v36];
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_2;
      v35[3] = &unk_264CF1448;
      v35[4] = self;
      [(DKIntroViewController *)v3 setConfirmErase:v35];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_4;
      v34[3] = &unk_264CF0EB8;
      v34[4] = self;
      [(DKIntroViewController *)v3 setBeginEraseBlock:v34];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_5;
      v33[3] = &unk_264CF0A98;
      v33[4] = self;
      [(DKIntroViewController *)v3 setEraseLaterBlock:v33];
      break;
    case 1uLL:
      uint64_t v3 = objc_alloc_init(DKPasscodeViewController);
      float v13 = [(DKEraseFlow *)self passcodeProvider];
      uint64_t v14 = [v13 unlockType];
      double v15 = [(DKEraseFlow *)self passcodeProvider];
      -[DKIntroViewController setUnlockScreenType:simplePasscodeType:](v3, "setUnlockScreenType:simplePasscodeType:", v14, [v15 simplePasscodeType]);

      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_6;
      v32[3] = &unk_264CF1470;
      v32[4] = self;
      [(DKIntroViewController *)v3 setVerifyPasscode:v32];
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_7;
      v31[3] = &unk_264CF1498;
      void v31[4] = self;
      [(DKIntroViewController *)v3 setPasscodeVerified:v31];
      break;
    case 2uLL:
      id v11 = [DKScreenTimePasscodeViewController alloc];
      uint64_t v12 = [(DKEraseFlow *)self deviceName];
      uint64_t v3 = [(DKScreenTimePasscodeViewController *)v11 initWithDeviceName:v12];

      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_8;
      v30[3] = &unk_264CF1470;
      v30[4] = self;
      [(DKIntroViewController *)v3 setVerifyPasscode:v30];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_9;
      v29[3] = &unk_264CF0A98;
      v29[4] = self;
      [(DKIntroViewController *)v3 setPasscodeVerified:v29];
      break;
    case 3uLL:
      uint64_t v3 = objc_alloc_init(DKPromptCloudUploadViewController);
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_131;
      v25[3] = &unk_264CF14E8;
      v25[4] = self;
      [(DKIntroViewController *)v3 setHasInternetConnectivity:v25];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_2_132;
      v24[3] = &unk_264CF14E8;
      v24[4] = self;
      [(DKIntroViewController *)v3 setShouldWarnForDataUsage:v24];
      uint64_t v16 = [(DKEraseFlow *)self presentNetworkSettings];
      [(DKIntroViewController *)v3 setPresentNetworkSettings:v16];

      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_3_133;
      v23[3] = &unk_264CF0A98;
      v23[4] = self;
      [(DKIntroViewController *)v3 setEraseNowBlock:v23];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_4_134;
      v22[3] = &unk_264CF0EB8;
      v22[4] = self;
      [(DKIntroViewController *)v3 setUploadThenEraseBlock:v22];
      break;
    case 4uLL:
      uint64_t v3 = objc_alloc_init(DKCloudUploadViewController);
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_5_135;
      v21[3] = &unk_264CF0A98;
      v21[4] = self;
      [(DKIntroViewController *)v3 setCancelBlock:v21];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_6_139;
      v20[3] = &unk_264CF0A98;
      v20[4] = self;
      [(DKIntroViewController *)v3 setSkipBlock:v20];
      break;
    case 7uLL:
      if ([(DKEraseFlow *)self requiresADPSpecificInternetWarning]) {
        +[DKInternetWarningViewController advancedDataProtectionConfiguration];
      }
      else {
      v17 = +[DKInternetWarningViewController standardConfiguration];
      }
      uint64_t v3 = [[DKInternetWarningViewController alloc] initWithConfiguration:v17];
      char v18 = [(DKEraseFlow *)self notableUserData];
      [(DKIntroViewController *)v3 setNotableUserData:v18];

      objc_initWeak((id *)buf, v3);
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_10;
      v27[3] = &unk_264CF14C0;
      v27[4] = self;
      objc_copyWeak(&v28, (id *)buf);
      [(DKIntroViewController *)v3 setRequireInternetBlock:v27];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_130;
      v26[3] = &unk_264CF0A98;
      v26[4] = self;
      [(DKIntroViewController *)v3 setContinueWithoutInternetBlock:v26];
      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)buf);

      break;
    default:
      break;
  }
  return v3;
}

void __39__DKEraseFlow__viewControllerForState___block_invoke(uint64_t a1, void (**a2)(void, void))
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 cloudProvider];
  a2[2](v4, [v5 isRestoring]);
}

void __39__DKEraseFlow__viewControllerForState___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__DKEraseFlow__viewControllerForState___block_invoke_3;
  v6[3] = &unk_264CF1420;
  v6[4] = v4;
  id v7 = v3;
  id v5 = v3;
  [v4 _presentEraseConfirmation:v6];
}

uint64_t __39__DKEraseFlow__viewControllerForState___block_invoke_3(uint64_t a1, int a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v3, "setEraseDataPlan:");
    id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v4();
  }
  else
  {
    return [v3 _endFlowForCancellationWithReason:@"Confirmation"];
  }
}

uint64_t __39__DKEraseFlow__viewControllerForState___block_invoke_4(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setSkipLocalDataCheck:a2];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 state];
  return [v3 _advanceFromState:v4];
}

uint64_t __39__DKEraseFlow__viewControllerForState___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) configuration];
  int v3 = [v2 postFollowUp];

  if (v3) {
    [MEMORY[0x263F3A3A8] postFollowUp];
  }
  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 _endFlowWithReason:@"Not Now"];
}

uint64_t __39__DKEraseFlow__viewControllerForState___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 passcodeProvider];
  uint64_t v5 = [v4 verifyPasscode:v3];

  return v5;
}

uint64_t __39__DKEraseFlow__viewControllerForState___block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 accountProvider];
  [v7 cacheLocalDevicePasscode:v6 passcodeType:a3];

  int v8 = *(void **)(a1 + 32);
  uint64_t v9 = [v8 state];
  return [v8 _advanceFromState:v9];
}

uint64_t __39__DKEraseFlow__viewControllerForState___block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 passcodeProvider];
  uint64_t v5 = [v4 verifyScreenTimePasscode:v3];

  return v5;
}

uint64_t __39__DKEraseFlow__viewControllerForState___block_invoke_9(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 state];
  return [v1 _advanceFromState:v2];
}

void __39__DKEraseFlow__viewControllerForState___block_invoke_10(uint64_t a1)
{
  uint64_t v2 = _DKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_237B3F000, v2, OS_LOG_TYPE_DEFAULT, "Requiring internet and presenting network settings", v9, 2u);
  }

  [*(id *)(a1 + 32) setContinueWithoutInternet:0];
  id v3 = [*(id *)(a1 + 32) presentNetworkSettings];
  v3[2]();

  uint64_t v4 = [*(id *)(a1 + 32) configuration];
  int v5 = [v4 presentsNetworkSettingsModally];

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v7 = WeakRetained;
    if (WeakRetained)
    {
      int v8 = [WeakRetained presentedViewController];

      if (v8) {
        [*(id *)(a1 + 32) _advanceFromInternetWarningAfterPresentedNetworkSettingsDismisses:v7];
      }
    }
  }
}

uint64_t __39__DKEraseFlow__viewControllerForState___block_invoke_130(uint64_t a1)
{
  uint64_t v2 = _DKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_237B3F000, v2, OS_LOG_TYPE_DEFAULT, "Continuing without internet", v4, 2u);
  }

  [*(id *)(a1 + 32) setContinueWithoutInternet:1];
  return objc_msgSend(*(id *)(a1 + 32), "_advanceFromState:", objc_msgSend(*(id *)(a1 + 32), "state"));
}

BOOL __39__DKEraseFlow__viewControllerForState___block_invoke_131(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) cloudProvider];
  uint64_t v2 = [v1 isUploadSupportedForCurrentNetwork];

  return (unint64_t)(v2 - 1) < 2;
}

BOOL __39__DKEraseFlow__viewControllerForState___block_invoke_2_132(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) cloudProvider];
  uint64_t v2 = [v1 isUploadSupportedForCurrentNetwork];

  return v2 == 2;
}

uint64_t __39__DKEraseFlow__viewControllerForState___block_invoke_3_133(uint64_t a1)
{
  return [*(id *)(a1 + 32) _advanceToState:5];
}

uint64_t __39__DKEraseFlow__viewControllerForState___block_invoke_4_134(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setAllowExpensiveCellular:a2];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 state];
  return [v3 _advanceFromState:v4];
}

uint64_t __39__DKEraseFlow__viewControllerForState___block_invoke_5_135(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endFlowForCancellationWithReason:@"Cloud Upload"];
}

uint64_t __39__DKEraseFlow__viewControllerForState___block_invoke_6_139(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cloudProvider];
  [v2 cancelUpload];

  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 state];
  return [v3 _advanceFromState:v4];
}

- (void)_nextStateFromState:(unint64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(id, uint64_t))a4;
  switch(a3)
  {
    case 0uLL:
      id v7 = [(DKEraseFlow *)self passcodeProvider];
      int v8 = [v7 isDevicePasscodeSet];

      if (v8)
      {
        v6[2](v6, 1);
        goto LABEL_23;
      }
      float v13 = self;
      uint64_t v14 = 1;
      goto LABEL_16;
    case 1uLL:
      uint64_t v9 = [(DKEraseFlow *)self passcodeProvider];
      int v10 = [v9 isScreenTimePasscodeSet];

      if (v10)
      {
        v6[2](v6, 2);
        goto LABEL_23;
      }
      float v13 = self;
      uint64_t v14 = 2;
      goto LABEL_16;
    case 2uLL:
      id v11 = [(DKEraseFlow *)self hasInternetConnectivity];
      char v12 = v11[2]();

      if ((v12 & 1) == 0)
      {
        BOOL v21 = [(DKEraseFlow *)self accountProvider];
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __46__DKEraseFlow__nextStateFromState_completion___block_invoke;
        v26[3] = &unk_264CF1538;
        v26[4] = self;
        v27 = v6;
        [v21 primaryAppleAccountRequiresADPSpecificInternetWarning:v26];

        v22 = v27;
        goto LABEL_18;
      }
      float v13 = self;
      uint64_t v14 = 7;
LABEL_16:
      [(DKEraseFlow *)v13 _nextStateFromState:v14 completion:v6];
      goto LABEL_23;
    case 3uLL:
      goto LABEL_21;
    case 4uLL:
      goto LABEL_11;
    case 5uLL:
      -[DKEraseFlow _nextStateFromState:completion:]();
    case 6uLL:
      if ([(DKEraseFlow *)self cloudUploadSucceeded]
        || [(DKEraseFlow *)self skipLocalDataCheck]
        || ([(DKEraseFlow *)self configuration],
            double v15 = objc_claimAutoreleasedReturnValue(),
            int v16 = [v15 skipBackup],
            v15,
            v16))
      {
LABEL_11:
        v17 = v6[2];
LABEL_13:
        id v19 = v6;
        uint64_t v20 = 5;
        goto LABEL_22;
      }
      if ([(DKEraseFlow *)self isCloudUploadInProgress])
      {
LABEL_21:
        v17 = v6[2];
        id v19 = v6;
        uint64_t v20 = 4;
LABEL_22:
        v17(v19, v20);
        goto LABEL_23;
      }
      v23 = [(DKEraseFlow *)self cloudProvider];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __46__DKEraseFlow__nextStateFromState_completion___block_invoke_140;
      v24[3] = &unk_264CF0C20;
      v25 = v6;
      [v23 hasDataToUpload:v24];

      v22 = v25;
LABEL_18:

LABEL_23:
      return;
    case 7uLL:
      BOOL v18 = [(DKEraseFlow *)self continueWithoutInternet];
      v17 = v6[2];
      if (v18) {
        goto LABEL_13;
      }
      id v19 = v6;
      uint64_t v20 = 6;
      goto LABEL_22;
    default:
      goto LABEL_23;
  }
}

void __46__DKEraseFlow__nextStateFromState_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__DKEraseFlow__nextStateFromState_completion___block_invoke_2;
  v9[3] = &unk_264CF1510;
  char v13 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = v7;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

uint64_t __46__DKEraseFlow__nextStateFromState_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = _DKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v4 = *(void *)(a1 + 32);
    v8[0] = 67109378;
    v8[1] = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl(&dword_237B3F000, v2, OS_LOG_TYPE_DEFAULT, "Requires adp specific internet warning %d error %@", (uint8_t *)v8, 0x12u);
  }

  if (!*(void *)(a1 + 32)
    && (([*(id *)(a1 + 40) setRequiresADPSpecificInternetWarning:*(unsigned __int8 *)(a1 + 56)],
         *(unsigned char *)(a1 + 56))
     || ([*(id *)(a1 + 40) notableUserData],
         uint64_t v6 = objc_claimAutoreleasedReturnValue(),
         int v7 = [v6 findMyEnabled],
         v6,
         v7)))
  {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    return [*(id *)(a1 + 40) _nextStateFromState:7 completion:*(void *)(a1 + 48)];
  }
}

uint64_t __46__DKEraseFlow__nextStateFromState_completion___block_invoke_140(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 5;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

+ (id)_stringForState:(unint64_t)a3
{
  if (a3 - 1 > 6) {
    return @"Introduction";
  }
  else {
    return off_264CF1598[a3 - 1];
  }
}

- (BOOL)_isHomeButtonAllowedForState:(unint64_t)a3
{
  return (a3 < 8) & (0xEFu >> a3);
}

- (void)_disallowHomeButton
{
  uint64_t v3 = [(DKEraseFlow *)self homeButtonConsumer];

  if (!v3)
  {
    uint64_t v4 = _DKLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl(&dword_237B3F000, v4, OS_LOG_TYPE_DEFAULT, "Disallowing home button use...", v7, 2u);
    }

    id v5 = [MEMORY[0x263F79398] sharedInstance];
    uint64_t v6 = [v5 beginConsumingPressesForButtonKind:1 eventConsumer:self priority:0];
    [(DKEraseFlow *)self setHomeButtonConsumer:v6];
  }
}

- (void)_allowHomeButton
{
  uint64_t v3 = [(DKEraseFlow *)self homeButtonConsumer];

  if (v3)
  {
    uint64_t v4 = _DKLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_237B3F000, v4, OS_LOG_TYPE_DEFAULT, "Allowing home button use...", v6, 2u);
    }

    id v5 = [(DKEraseFlow *)self homeButtonConsumer];
    [v5 invalidate];

    [(DKEraseFlow *)self setHomeButtonConsumer:0];
  }
}

- (void)_presentEraseConfirmation:(id)a3
{
  id v4 = a3;
  id v5 = [(DKEraseFlow *)self notableUserData];
  uint64_t v6 = [v5 cellularPlans];
  id v8 = +[DKEraseConfirmationAlertController alertControllerWithCellularPlans:v6 completion:v4];

  int v7 = [(DKEraseFlow *)self navigationController];
  [v7 presentViewController:v8 animated:1 completion:0];
}

- (void)_eraseDevice
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [(DKEraseFlow *)self _sendTerminatedAnalyticsEventWithState:[(DKEraseFlow *)self state] willErase:1 reason:@"User Initiated"];
  uint64_t v3 = [(DKEraseFlow *)self eraseDevice];
  v3[2](v3, [(DKEraseFlow *)self eraseDataPlan]);
}

- (void)_signOutAndEraseDevice
{
}

void __37__DKEraseFlow__signOutAndEraseDevice__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__DKEraseFlow__signOutAndEraseDevice__block_invoke_2;
  block[3] = &unk_264CF0A20;
  char v11 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __37__DKEraseFlow__signOutAndEraseDevice__block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v2 = *(void **)(a1 + 40);
    [v2 _eraseDevice];
  }
  else
  {
    uint64_t v3 = _DKLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __37__DKEraseFlow__signOutAndEraseDevice__block_invoke_2_cold_1(a1, v3);
    }

    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __37__DKEraseFlow__signOutAndEraseDevice__block_invoke_171;
    v7[3] = &unk_264CF0A98;
    void v7[4] = *(void *)(a1 + 40);
    id v4 = objc_msgSend(MEMORY[0x263F1C3F8], "dkui_unknownFailureAlertControllerWithCompletion:", v7);
    id v5 = [*(id *)(a1 + 40) navigationController];
    uint64_t v6 = [v5 topViewController];
    [v6 presentViewController:v4 animated:1 completion:0];
  }
}

uint64_t __37__DKEraseFlow__signOutAndEraseDevice__block_invoke_171(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endFlowForCancellationWithReason:@"Apple Account"];
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (id)eraseDevice
{
  return self->_eraseDevice;
}

- (void)setEraseDevice:(id)a3
{
}

- (id)hasInternetConnectivity
{
  return self->_hasInternetConnectivity;
}

- (void)setHasInternetConnectivity:(id)a3
{
}

- (id)isBasebandDead
{
  return self->_isBasebandDead;
}

- (void)setIsBasebandDead:(id)a3
{
}

- (id)presentNetworkSettings
{
  return self->_presentNetworkSettings;
}

- (void)setPresentNetworkSettings:(id)a3
{
}

- (DKAccountProvider)accountProvider
{
  return self->_accountProvider;
}

- (void)setAccountProvider:(id)a3
{
}

- (DKFindMyProvider)findMyProvider
{
  return self->_findMyProvider;
}

- (void)setFindMyProvider:(id)a3
{
}

- (DKNotableUserDataProvider)notableUserDataProvider
{
  return self->_notableUserDataProvider;
}

- (void)setNotableUserDataProvider:(id)a3
{
}

- (DKPasscodeProvider)passcodeProvider
{
  return self->_passcodeProvider;
}

- (void)setPasscodeProvider:(id)a3
{
}

- (DKCloudProvider)cloudProvider
{
  return self->_cloudProvider;
}

- (void)setCloudProvider:(id)a3
{
}

- (DKWalletProvider)walletProvider
{
  return self->_walletProvider;
}

- (void)setWalletProvider:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (DKConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void)setNavigationController:(id)a3
{
}

- (UIViewController)initialViewController
{
  return self->_initialViewController;
}

- (void)setInitialViewController:(id)a3
{
}

- (BOOL)skipLocalDataCheck
{
  return self->_skipLocalDataCheck;
}

- (void)setSkipLocalDataCheck:(BOOL)a3
{
  self->_skipLocalDataCheck = a3;
}

- (BOOL)requiresADPSpecificInternetWarning
{
  return self->_requiresADPSpecificInternetWarning;
}

- (void)setRequiresADPSpecificInternetWarning:(BOOL)a3
{
  self->_requiresADPSpecificInternetWarning = a3;
}

- (BOOL)continueWithoutInternet
{
  return self->_continueWithoutInternet;
}

- (void)setContinueWithoutInternet:(BOOL)a3
{
  self->_continueWithoutInternet = a3;
}

- (BOOL)allowExpensiveCellular
{
  return self->_allowExpensiveCellular;
}

- (void)setAllowExpensiveCellular:(BOOL)a3
{
  self->_allowExpensiveCellular = a3;
}

- (DKNotableUserData)notableUserData
{
  return self->_notableUserData;
}

- (void)setNotableUserData:(id)a3
{
}

- (NWPathEvaluator)pathEvaluator
{
  return self->_pathEvaluator;
}

- (void)setPathEvaluator:(id)a3
{
}

- (id)cloudUploadProgressHandler
{
  return self->_cloudUploadProgressHandler;
}

- (void)setCloudUploadProgressHandler:(id)a3
{
}

- (id)cloudUploadCompletion
{
  return self->_cloudUploadCompletion;
}

- (void)setCloudUploadCompletion:(id)a3
{
}

- (float)cloudUploadProgress
{
  return self->_cloudUploadProgress;
}

- (void)setCloudUploadProgress:(float)a3
{
  self->_cloudUploadProgress = a3;
}

- (double)cloudUploadTimeRemaining
{
  return self->_cloudUploadTimeRemaining;
}

- (void)setCloudUploadTimeRemaining:(double)a3
{
  self->_cloudUploadTimeRemaining = a3;
}

- (DKCloudUploadResults)cloudUploadResults
{
  return self->_cloudUploadResults;
}

- (void)setCloudUploadResults:(id)a3
{
}

- (BOOL)isCloudUploadInProgress
{
  return self->_cloudUploadInProgress;
}

- (void)setCloudUploadInProgress:(BOOL)a3
{
  self->_cloudUploadInProgress = a3;
}

- (BOOL)cloudUploadSucceeded
{
  return self->_cloudUploadSucceeded;
}

- (void)setCloudUploadSucceeded:(BOOL)a3
{
  self->_cloudUploadSucceeded = a3;
}

- (BSInvalidatable)homeButtonConsumer
{
  return self->_homeButtonConsumer;
}

- (void)setHomeButtonConsumer:(id)a3
{
}

- (BOOL)eraseDataPlan
{
  return self->_eraseDataPlan;
}

- (void)setEraseDataPlan:(BOOL)a3
{
  self->_eraseDataPlan = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeButtonConsumer, 0);
  objc_storeStrong((id *)&self->_cloudUploadResults, 0);
  objc_storeStrong(&self->_cloudUploadCompletion, 0);
  objc_storeStrong(&self->_cloudUploadProgressHandler, 0);
  objc_storeStrong((id *)&self->_pathEvaluator, 0);
  objc_storeStrong((id *)&self->_notableUserData, 0);
  objc_storeStrong((id *)&self->_initialViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_walletProvider, 0);
  objc_storeStrong((id *)&self->_cloudProvider, 0);
  objc_storeStrong((id *)&self->_passcodeProvider, 0);
  objc_storeStrong((id *)&self->_notableUserDataProvider, 0);
  objc_storeStrong((id *)&self->_findMyProvider, 0);
  objc_storeStrong((id *)&self->_accountProvider, 0);
  objc_storeStrong(&self->_presentNetworkSettings, 0);
  objc_storeStrong(&self->_isBasebandDead, 0);
  objc_storeStrong(&self->_hasInternetConnectivity, 0);
  objc_storeStrong(&self->_eraseDevice, 0);
  objc_storeStrong(&self->_completion, 0);
}

void __37__DKEraseFlow_initWithConfiguration___block_invoke_28_cold_1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v5 = _DKIsInternalInstall();
  if ((v5 & 1) == 0)
  {
    uint64_t v6 = NSString;
    uint64_t v2 = [a1 domain];
    a1 = [v6 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(a1, "code")];
  }
  *(_DWORD *)buf = 138543362;
  id v8 = a1;
  _os_log_error_impl(&dword_237B3F000, a2, OS_LOG_TYPE_ERROR, "Failed to erase: %{public}@", buf, 0xCu);
  if (!v5)
  {
  }
}

void __50__DKEraseFlow__supportsNonInteractiveCloudUpload___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_237B3F000, a2, OS_LOG_TYPE_ERROR, "Failed to determine preparation requirements for primary Apple Account: %@", (uint8_t *)&v3, 0xCu);
}

- (void)_advanceFromInternetWarningAfterPresentedNetworkSettingsDismisses:.cold.1()
{
}

- (void)_advanceToState:.cold.1()
{
}

- (void)_nextStateFromState:completion:.cold.1()
{
}

void __37__DKEraseFlow__signOutAndEraseDevice__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_237B3F000, a2, OS_LOG_TYPE_ERROR, "Failed to sign out of primary Apple account: %@", (uint8_t *)&v3, 0xCu);
}

@end