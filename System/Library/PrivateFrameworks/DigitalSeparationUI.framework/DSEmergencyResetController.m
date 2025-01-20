@interface DSEmergencyResetController
+ (void)initialize;
- (BOOL)isFetching;
- (BOOL)userDidPressReset;
- (DSAppSharing)appSharing;
- (DSContinuityStore)continuityStore;
- (DSEmergencyResetController)init;
- (DSNavigationDelegate)delegate;
- (DSSharingPermissions)permissions;
- (DSWifiSyncStore)wifiSyncStore;
- (NSArray)emergencyResetSteps;
- (NSError)resetError;
- (OBBoldTrayButton)boldButton;
- (OS_dispatch_queue)workQueue;
- (SPBeaconManager)beaconManager;
- (UIProgressView)progressView;
- (UIStackView)progressStackView;
- (void)fetchSharingPermissions:(id)a3;
- (void)handleErrorsAndMoveToNextPane;
- (void)hideProgressBar;
- (void)initializeEmergencyResetActions;
- (void)removeAllPairedDevicesOnQueue:(id)a3 completion:(id)a4;
- (void)resetAllFirstPartySharing:(id)a3;
- (void)resetAllThirdPartyTCCs:(id)a3;
- (void)resetAppDistribution:(id)a3;
- (void)resetIDFA:(id)a3;
- (void)resetNecessaryFirstPartyPermissions:(id)a3;
- (void)safetyResetAll;
- (void)safetyResetAllPressed;
- (void)setAppSharing:(id)a3;
- (void)setBeaconManager:(id)a3;
- (void)setBoldButton:(id)a3;
- (void)setContinuityStore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDigitalSeparationTipsFlag;
- (void)setEmergencyResetSteps:(id)a3;
- (void)setIsFetching:(BOOL)a3;
- (void)setPermissions:(id)a3;
- (void)setProgressStackView:(id)a3;
- (void)setProgressView:(id)a3;
- (void)setResetError:(id)a3;
- (void)setUserDidPressReset:(BOOL)a3;
- (void)setWifiSyncStore:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)showProgressBar;
- (void)unpairContinuityDevices:(id)a3;
- (void)updateProgressBar;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DSEmergencyResetController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    DSLogSafetyResetAll = (uint64_t)os_log_create("com.apple.DigitalSeparation", "DSEmergencyResetController");
    MEMORY[0x270F9A758]();
  }
}

- (DSEmergencyResetController)init
{
  v3 = (void *)MEMORY[0x263F82818];
  v4 = [MEMORY[0x263F825C8] systemBlueColor];
  v5 = [v3 configurationWithHierarchicalColor:v4];

  v6 = DSUILocStringForKey(@"RESET_PEOPLE_APPS");
  v7 = DSUILocStringForKey(@"RESET_PEOPLE_APPS_DETAIL");
  v8 = [MEMORY[0x263F827E8] systemImageNamed:@"person.2.gobackward" withConfiguration:v5];
  v11.receiver = self;
  v11.super_class = (Class)DSEmergencyResetController;
  v9 = [(DSEmergencyResetController *)&v11 initWithTitle:v6 detailText:v7 icon:v8];

  return v9;
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)DSEmergencyResetController;
  [(DSOBWelcomeController *)&v16 viewDidLoad];
  v3 = DSUILocStringForKey(@"RESET_PEOPLE_APPS_BUTTON");
  v4 = +[DSUIUtilities setUpBoldButtonForController:self title:v3 target:self selector:sel_safetyResetAllPressed];
  [(DSEmergencyResetController *)self setBoldButton:v4];

  [(DSEmergencyResetController *)self setResetError:0];
  v5 = (SPBeaconManager *)objc_alloc_init(MEMORY[0x263F66138]);
  beaconManager = self->_beaconManager;
  self->_beaconManager = v5;

  id v7 = objc_alloc_init(MEMORY[0x263F3A388]);
  v8 = (DSAppSharing *)[objc_alloc(MEMORY[0x263F3A348]) initWithTCCStore:v7];
  appSharing = self->_appSharing;
  self->_appSharing = v8;

  v10 = (DSWifiSyncStore *)objc_alloc_init(MEMORY[0x263F3A398]);
  wifiSyncStore = self->_wifiSyncStore;
  self->_wifiSyncStore = v10;

  v12 = (DSContinuityStore *)objc_alloc_init(MEMORY[0x263F3A350]);
  continuityStore = self->_continuityStore;
  self->_continuityStore = v12;

  self->_userDidPressReset = 0;
  self->_isFetching = 1;
  dispatch_queue_t v14 = dispatch_queue_create("SafetyResetAllControllerWork", 0);
  [(DSEmergencyResetController *)self setWorkQueue:v14];

  [(DSEmergencyResetController *)self initializeEmergencyResetActions];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __41__DSEmergencyResetController_viewDidLoad__block_invoke;
  v15[3] = &unk_264C6E7D0;
  v15[4] = self;
  [(DSEmergencyResetController *)self fetchSharingPermissions:v15];
}

void __41__DSEmergencyResetController_viewDidLoad__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsFetching:0];
  if ([*(id *)(a1 + 32) userDidPressReset])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__DSEmergencyResetController_viewDidLoad__block_invoke_2;
    block[3] = &unk_264C6E7D0;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __41__DSEmergencyResetController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) updateProgressBar];
  v2 = *(void **)(a1 + 32);
  return [v2 safetyResetAll];
}

- (void)viewWillAppear:(BOOL)a3
{
  if (!self->_isFetching) {
    [(DSEmergencyResetController *)self hideProgressBar];
  }
}

- (void)fetchSharingPermissions:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F3A370]);
  [(DSEmergencyResetController *)self setPermissions:v5];

  objc_initWeak(&location, self);
  v6 = [(DSEmergencyResetController *)self permissions];
  uint64_t v7 = MEMORY[0x263EF83A0];
  id v8 = MEMORY[0x263EF83A0];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__DSEmergencyResetController_fetchSharingPermissions___block_invoke;
  v10[3] = &unk_264C6EB80;
  objc_copyWeak(&v12, &location);
  id v9 = v4;
  id v11 = v9;
  [v6 fetchPermissionsOnQueue:v7 completion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __54__DSEmergencyResetController_fetchSharingPermissions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = DSLogSafetyResetAll;
    if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_ERROR)) {
      __54__DSEmergencyResetController_fetchSharingPermissions___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v28 = v3;
    id v11 = objc_msgSend(v3, "underlyingErrors", a1);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v30;
      uint64_t v15 = *MEMORY[0x263F3A318];
      objc_super v16 = (void *)MEMORY[0x263F3A308];
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(v11);
          }
          v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v19 = [v18 domain];
          int v20 = [v19 isEqualToString:*v16];

          if (v20)
          {
            v21 = [v18 userInfo];
            v22 = [v21 objectForKeyedSubscript:v15];

            v23 = (void *)DSLogSafetyResetAll;
            if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_ERROR))
            {
              v24 = v23;
              v25 = [v18 underlyingErrors];
              *(_DWORD *)buf = 138543618;
              v34 = v22;
              __int16 v35 = 2114;
              v36 = v25;
              _os_log_error_impl(&dword_235BFC000, v24, OS_LOG_TYPE_ERROR, "Failed to fetch permissions for source %{public}@, underlying errors: %{public}@", buf, 0x16u);
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v13);
    }

    a1 = v27;
    id v3 = v28;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setResetError:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)safetyResetAllPressed
{
  id v3 = (void *)MEMORY[0x263F82418];
  id v4 = DSUILocStringForKey(@"RESET_ALERT_BODY");
  uint64_t v5 = [v3 alertControllerWithTitle:0 message:v4 preferredStyle:0];

  uint64_t v6 = (void *)MEMORY[0x263F82400];
  uint64_t v7 = DSUILocStringForKey(@"RESET_CANCEL");
  uint64_t v8 = [v6 actionWithTitle:v7 style:1 handler:&__block_literal_global_4];

  uint64_t v9 = (void *)MEMORY[0x263F82400];
  uint64_t v10 = DSUILocStringForKey(@"RESET_CONFIRM");
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __51__DSEmergencyResetController_safetyResetAllPressed__block_invoke_2;
  v16[3] = &unk_264C6E848;
  v16[4] = self;
  id v11 = [v9 actionWithTitle:v10 style:2 handler:v16];

  uint64_t v12 = (void *)MEMORY[0x263F82400];
  uint64_t v13 = DSUILocStringForKey(@"RESET_CUSTOMIZE");
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __51__DSEmergencyResetController_safetyResetAllPressed__block_invoke_3;
  v15[3] = &unk_264C6E848;
  v15[4] = self;
  uint64_t v14 = [v12 actionWithTitle:v13 style:0 handler:v15];

  [v5 addAction:v11];
  [v5 addAction:v8];
  [v5 addAction:v14];
  [(DSEmergencyResetController *)self presentViewController:v5 animated:1 completion:0];
}

uint64_t __51__DSEmergencyResetController_safetyResetAllPressed__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setUserDidPressReset:1];
  [*(id *)(a1 + 32) showProgressBar];
  uint64_t result = [*(id *)(a1 + 32) isFetching];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) updateProgressBar];
    id v3 = *(void **)(a1 + 32);
    return [v3 safetyResetAll];
  }
  return result;
}

void __51__DSEmergencyResetController_safetyResetAllPressed__block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 goToCustomizeSharing];
}

- (void)initializeEmergencyResetActions
{
  uint64_t v14 = (void *)MEMORY[0x263EFF8C0];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke;
  v25[3] = &unk_264C6EBD0;
  v25[4] = self;
  uint64_t v15 = (void *)[v25 copy];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2;
  v24[3] = &unk_264C6EBD0;
  v24[4] = self;
  id v3 = (void *)[v24 copy];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_342;
  v23[3] = &unk_264C6EBD0;
  v23[4] = self;
  id v4 = (void *)[v23 copy];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_347;
  v22[3] = &unk_264C6EBD0;
  v22[4] = self;
  uint64_t v5 = (void *)[v22 copy];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_352;
  v21[3] = &unk_264C6EBD0;
  v21[4] = self;
  uint64_t v6 = (void *)[v21 copy];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_358;
  v20[3] = &unk_264C6EBD0;
  v20[4] = self;
  uint64_t v13 = (void *)[v20 copy];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_363;
  v19[3] = &unk_264C6EBD0;
  v19[4] = self;
  uint64_t v7 = (void *)[v19 copy];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_3;
  v18[3] = &unk_264C6EBD0;
  v18[4] = self;
  uint64_t v8 = (void *)[v18 copy];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_373;
  v17[3] = &unk_264C6EBD0;
  v17[4] = self;
  uint64_t v9 = (void *)[v17 copy];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_3_379;
  v16[3] = &unk_264C6EBD0;
  v16[4] = self;
  uint64_t v10 = (void *)[v16 copy];
  objc_msgSend(v14, "arrayWithObjects:", v15, v3, v4, v5, v6, v13, v7, v8, v9, v10, 0);
  id v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  emergencyResetSteps = self->_emergencyResetSteps;
  self->_emergencyResetSteps = v11;
}

void __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DSLogSafetyResetAll;
  if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235BFC000, v4, OS_LOG_TYPE_INFO, "Emergency Reset: started resetting first party sharing", buf, 2u);
  }
  uint64_t v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_333;
  v7[3] = &unk_264C6EBA8;
  id v8 = v3;
  id v6 = v3;
  [v5 resetAllFirstPartySharing:v7];
}

uint64_t __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_333(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DSLogSafetyResetAll;
  if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235BFC000, v4, OS_LOG_TYPE_INFO, "Emergency Reset: started resetting third party permissions", buf, 2u);
  }
  uint64_t v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_338;
  v7[3] = &unk_264C6EBA8;
  id v8 = v3;
  id v6 = v3;
  [v5 resetAllThirdPartyTCCs:v7];
}

uint64_t __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_338(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_342(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DSLogSafetyResetAll;
  if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235BFC000, v4, OS_LOG_TYPE_INFO, "Emergency Reset: started resetting necessary first party permissions", buf, 2u);
  }
  uint64_t v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_343;
  v7[3] = &unk_264C6EBA8;
  id v8 = v3;
  id v6 = v3;
  [v5 resetNecessaryFirstPartyPermissions:v7];
}

uint64_t __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_343(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_347(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)DSLogSafetyResetAll;
  if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = v4;
    uint64_t v7 = [v5 appSharing];
    *(_DWORD *)buf = 134217984;
    uint64_t v13 = v7;
    _os_log_impl(&dword_235BFC000, v6, OS_LOG_TYPE_INFO, "Emergency Reset: started resetting shortcuts automation timer. DSAppSharing: %p", buf, 0xCu);
  }
  id v8 = [*(id *)(a1 + 32) appSharing];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_348;
  v10[3] = &unk_264C6EBF8;
  id v11 = v3;
  id v9 = v3;
  [v8 resetShortcutsAutomationTimer:MEMORY[0x263EF83A0] handler:v10];
}

uint64_t __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_348(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_352(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)DSLogSafetyResetAll;
  if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = v4;
    uint64_t v7 = [v5 appSharing];
    *(_DWORD *)buf = 134217984;
    uint64_t v14 = v7;
    _os_log_impl(&dword_235BFC000, v6, OS_LOG_TYPE_INFO, "Emergency Reset: started resetting background app refresh. DSAppSharing: %p", buf, 0xCu);
  }
  id v8 = [*(id *)(a1 + 32) appSharing];
  id v9 = [MEMORY[0x263F3A390] allUserVisibleApps];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_354;
  v11[3] = &unk_264C6EBA8;
  id v12 = v3;
  id v10 = v3;
  [v8 resetBackgroundAppRefresh:v9 queue:MEMORY[0x263EF83A0] handler:v11];
}

uint64_t __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_354(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_358(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DSLogSafetyResetAll;
  if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235BFC000, v4, OS_LOG_TYPE_INFO, "Emergency Reset: started resetting synced devices.", buf, 2u);
  }
  uint64_t v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_359;
  v7[3] = &unk_264C6EBF8;
  id v8 = v3;
  id v6 = v3;
  [v5 removeAllPairedDevicesOnQueue:MEMORY[0x263EF83A0] completion:v7];
}

uint64_t __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_359(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_363(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)DSLogSafetyResetAll;
  if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = v4;
    uint64_t v7 = [v5 beaconManager];
    *(_DWORD *)buf = 134217984;
    uint64_t v13 = v7;
    _os_log_impl(&dword_235BFC000, v6, OS_LOG_TYPE_INFO, "Emergency Reset: started resetting FindMy acknowledgement. BeaconManager: %p", buf, 0xCu);
  }
  id v8 = [*(id *)(a1 + 32) beaconManager];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_364;
  v10[3] = &unk_264C6EBA8;
  id v11 = v3;
  id v9 = v3;
  [v8 setUserHasAcknowledgedFindMy:0 completion:v10];
}

void __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_364(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_365;
  block[3] = &unk_264C6EBA8;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_365(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DSLogSafetyResetAll;
  if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235BFC000, v4, OS_LOG_TYPE_INFO, "Emergency Reset: started resetting IDFA for all apps.", buf, 2u);
  }
  uint64_t v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_369;
  v7[3] = &unk_264C6EBA8;
  id v8 = v3;
  id v6 = v3;
  [v5 resetIDFA:v7];
}

uint64_t __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_369(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_373(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DSLogSafetyResetAll;
  if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235BFC000, v4, OS_LOG_TYPE_INFO, "Emergency Reset: started resetting App Distribution.", buf, 2u);
  }
  uint64_t v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_374;
  v7[3] = &unk_264C6EBA8;
  id v8 = v3;
  id v6 = v3;
  [v5 resetAppDistribution:v7];
}

void __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_374(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_375;
  block[3] = &unk_264C6EBA8;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_375(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_3_379(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DSLogSafetyResetAll;
  if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235BFC000, v4, OS_LOG_TYPE_INFO, "Emergency Reset: started resetting Continuity pairing.", buf, 2u);
  }
  uint64_t v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_380;
  v7[3] = &unk_264C6EBA8;
  id v8 = v3;
  id v6 = v3;
  [v5 unpairContinuityDevices:v7];
}

void __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_380(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_381;
  block[3] = &unk_264C6EBA8;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_381(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)safetyResetAll
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = DSLogSafetyResetAll;
  if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235BFC000, v3, OS_LOG_TYPE_INFO, "User initiated an Emergency Reset", buf, 2u);
  }
  [(DSEmergencyResetController *)self setUserDidPressReset:0];
  dispatch_group_t v4 = dispatch_group_create();
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__DSEmergencyResetController_safetyResetAll__block_invoke;
  aBlock[3] = &unk_264C6EC20;
  aBlock[4] = self;
  uint64_t v5 = v4;
  v19 = v5;
  id v6 = _Block_copy(aBlock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = self->_emergencyResetSteps;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
        dispatch_group_enter(v5);
        (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v6);
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v21 count:16];
    }
    while (v9);
  }

  [(DSEmergencyResetController *)self setDigitalSeparationTipsFlag];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__DSEmergencyResetController_safetyResetAll__block_invoke_386;
  block[3] = &unk_264C6E7D0;
  void block[4] = self;
  dispatch_group_notify(v5, MEMORY[0x263EF83A0], block);
}

void __44__DSEmergencyResetController_safetyResetAll__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [*(id *)(a1 + 32) updateProgressBar];
  dispatch_group_t v4 = (void *)DSLogSafetyResetAll;
  if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_INFO))
  {
    id v5 = v3;
    id v6 = v4;
    int v7 = 136315138;
    uint64_t v8 = [v5 UTF8String];
    _os_log_impl(&dword_235BFC000, v6, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v7, 0xCu);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __44__DSEmergencyResetController_safetyResetAll__block_invoke_386(uint64_t a1)
{
  [*(id *)(a1 + 32) handleErrorsAndMoveToNextPane];
  id v1 = DSLogSafetyResetAll;
  if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_235BFC000, v1, OS_LOG_TYPE_INFO, "Emergency Reset complete", v3, 2u);
  }
  return AnalyticsSendEventLazy();
}

uint64_t __44__DSEmergencyResetController_safetyResetAll__block_invoke_390()
{
  return 0;
}

- (void)showProgressBar
{
  id v3 = [(DSEmergencyResetController *)self headerView];
  [v3 setDetailText:&stru_26E9097D0];

  dispatch_group_t v4 = [(DSEmergencyResetController *)self buttonTray];
  id v5 = [(DSEmergencyResetController *)self boldButton];
  [v4 removeButton:v5];

  [(DSEmergencyResetController *)self setBoldButton:0];
  id v6 = (UIStackView *)objc_alloc_init(MEMORY[0x263F82BF8]);
  progressStackView = self->_progressStackView;
  self->_progressStackView = v6;

  uint64_t v8 = [(DSEmergencyResetController *)self progressStackView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v9 = [(DSEmergencyResetController *)self progressStackView];
  [v9 setAxis:1];

  uint64_t v10 = [(DSEmergencyResetController *)self progressStackView];
  [v10 setAlignment:3];

  uint64_t v11 = [(DSEmergencyResetController *)self progressStackView];
  [v11 setSpacing:20.0];

  uint64_t v12 = [(DSEmergencyResetController *)self contentView];
  uint64_t v13 = [(DSEmergencyResetController *)self progressStackView];
  [v12 addSubview:v13];

  long long v14 = [(DSEmergencyResetController *)self progressStackView];
  long long v15 = [v14 topAnchor];
  long long v16 = [(DSEmergencyResetController *)self contentView];
  long long v17 = [v16 topAnchor];
  v18 = [v15 constraintEqualToAnchor:v17 constant:20.0];
  [v18 setActive:1];

  v19 = [(DSEmergencyResetController *)self progressStackView];
  int v20 = [v19 widthAnchor];
  v21 = [(DSEmergencyResetController *)self contentView];
  uint64_t v22 = [v21 widthAnchor];
  v23 = [v20 constraintEqualToAnchor:v22];
  [v23 setActive:1];

  id v41 = objc_alloc_init(MEMORY[0x263F828E0]);
  [v41 setTranslatesAutoresizingMaskIntoConstraints:0];
  v24 = DSUILocStringForKey(@"PROGRESS_TEXT");
  [v41 setText:v24];

  v25 = [MEMORY[0x263F825C8] secondaryLabelColor];
  [v41 setTextColor:v25];

  [v41 setTextAlignment:1];
  v26 = [(DSEmergencyResetController *)self progressStackView];
  [v26 addArrangedSubview:v41];

  uint64_t v27 = [v41 widthAnchor];
  id v28 = [(DSEmergencyResetController *)self progressStackView];
  long long v29 = [v28 widthAnchor];
  long long v30 = [v27 constraintEqualToAnchor:v29];
  [v30 setActive:1];

  long long v31 = (UIProgressView *)objc_alloc_init(MEMORY[0x263F82AF0]);
  progressView = self->_progressView;
  self->_progressView = v31;

  v33 = [(DSEmergencyResetController *)self progressView];
  [v33 setTranslatesAutoresizingMaskIntoConstraints:0];

  v34 = [(DSEmergencyResetController *)self progressStackView];
  __int16 v35 = [(DSEmergencyResetController *)self progressView];
  [v34 addArrangedSubview:v35];

  v36 = [(DSEmergencyResetController *)self progressView];
  v37 = [v36 widthAnchor];
  uint64_t v38 = [(DSEmergencyResetController *)self progressStackView];
  v39 = [v38 widthAnchor];
  v40 = [v37 constraintEqualToAnchor:v39 constant:-20.0];
  [v40 setActive:1];
}

- (void)hideProgressBar
{
  id v3 = [(DSEmergencyResetController *)self progressStackView];
  [v3 removeFromSuperview];

  dispatch_group_t v4 = [(DSEmergencyResetController *)self headerView];
  id v5 = DSUILocStringForKey(@"RESET_PEOPLE_APPS_DETAIL");
  [v4 setDetailText:v5];

  id v6 = [(DSEmergencyResetController *)self boldButton];

  if (!v6)
  {
    DSUILocStringForKey(@"RESET_PEOPLE_APPS_BUTTON");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    int v7 = +[DSUIUtilities setUpBoldButtonForController:self title:v8 target:self selector:sel_safetyResetAllPressed];
    [(DSEmergencyResetController *)self setBoldButton:v7];
  }
}

- (void)updateProgressBar
{
  id v3 = [(DSEmergencyResetController *)self progressView];
  [v3 progress];
  float v5 = v4;
  float v6 = 1.0 / (double)([(NSArray *)self->_emergencyResetSteps count] + 1);
  float v7 = v5 + v6;

  if (v7 >= 1.0) {
    float v7 = v7 + -0.1;
  }
  id v9 = [(DSEmergencyResetController *)self progressView];
  *(float *)&double v8 = v7;
  [v9 setProgress:v8];
}

- (void)setDigitalSeparationTipsFlag
{
  id v2 = BiomeLibrary();
  id v3 = [v2 Discoverability];
  id v9 = [v3 Signals];

  float v4 = [v9 source];
  id v5 = objc_alloc(MEMORY[0x263F2A0D8]);
  float v6 = [MEMORY[0x263F08AB0] processInfo];
  float v7 = [v6 operatingSystemVersionString];
  double v8 = (void *)[v5 initWithContentIdentifier:@"com.apple.DigitalSeparation.safety-reset" context:0 osBuild:v7 userInfo:0];

  [v4 sendEvent:v8];
}

- (void)handleErrorsAndMoveToNextPane
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = [(DSEmergencyResetController *)self resetError];

  if (v3)
  {
    float v4 = [(DSEmergencyResetController *)self resetError];
    [v4 underlyingErrors];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if ([v10 code] == 7 || objc_msgSend(v10, "code") == 8 || objc_msgSend(v10, "code") == 6)
          {

            long long v17 = (void *)MEMORY[0x263F82418];
            v18 = DSUILocStringForKey(@"RESET_ALL_FAILED_RESTRICTIONS_TITLE");
            v19 = DSUILocStringForKey(@"RESET_ALL_FAILED_RESTRICTIONS");
            uint64_t v13 = [v17 alertControllerWithTitle:v18 message:v19 preferredStyle:1];

            long long v14 = (void *)MEMORY[0x263F82400];
            long long v15 = DSUILocStringForKey(@"OK");
            v23[0] = MEMORY[0x263EF8330];
            v23[1] = 3221225472;
            v23[2] = __59__DSEmergencyResetController_handleErrorsAndMoveToNextPane__block_invoke;
            v23[3] = &unk_264C6E848;
            v23[4] = self;
            long long v16 = v23;
            goto LABEL_14;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    uint64_t v11 = (void *)MEMORY[0x263F82418];
    uint64_t v12 = [(DSEmergencyResetController *)self resetError];
    uint64_t v13 = objc_msgSend(v11, "ds_alertControllerWithStopSharingError:", v12);

    long long v14 = (void *)MEMORY[0x263F82400];
    long long v15 = DSUILocStringForKey(@"OK");
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __59__DSEmergencyResetController_handleErrorsAndMoveToNextPane__block_invoke_2;
    v22[3] = &unk_264C6E848;
    v22[4] = self;
    long long v16 = v22;
LABEL_14:
    int v20 = [v14 actionWithTitle:v15 style:1 handler:v16];
    [v13 addAction:v20];

    [(DSEmergencyResetController *)self presentViewController:v13 animated:1 completion:0];
  }
  else
  {
    id v21 = [(DSEmergencyResetController *)self delegate];
    [v21 pushNextPane];
  }
}

void __59__DSEmergencyResetController_handleErrorsAndMoveToNextPane__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 pushNextPane];
}

void __59__DSEmergencyResetController_handleErrorsAndMoveToNextPane__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 pushNextPane];
}

- (void)resetAllFirstPartySharing:(id)a3
{
  id v4 = a3;
  id v5 = [(DSEmergencyResetController *)self permissions];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__DSEmergencyResetController_resetAllFirstPartySharing___block_invoke;
  v7[3] = &unk_264C6EC68;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 stopAllSharingOnQueue:MEMORY[0x263EF83A0] completion:v7];
}

void __56__DSEmergencyResetController_resetAllFirstPartySharing___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ([v5 count])
  {
    id v4 = [MEMORY[0x263F3A360] errorWithCode:2 underlyingErrors:v5];
    [*(id *)(a1 + 32) setResetError:v4];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)resetAllThirdPartyTCCs:(id)a3
{
  id v4 = a3;
  id v5 = [(DSEmergencyResetController *)self appSharing];
  id v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = [MEMORY[0x263F3A390] tccServices];
  id v8 = [v6 setWithArray:v7];
  id v9 = [MEMORY[0x263F3A390] allApps];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__DSEmergencyResetController_resetAllThirdPartyTCCs___block_invoke;
  v11[3] = &unk_264C6EC90;
  void v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [v5 resetPermissions:v8 forApps:v9 queue:MEMORY[0x263EF83A0] handler:v11];
}

void __53__DSEmergencyResetController_resetAllThirdPartyTCCs___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 count])
  {
    id v3 = [MEMORY[0x263F3A360] errorWithCode:4 underlyingErrors:v4];
    [*(id *)(a1 + 32) setResetError:v3];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)removeAllPairedDevicesOnQueue:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DSEmergencyResetController *)self wifiSyncStore];
  [v8 removeAllPairedDevicesOnQueue:v7 completion:v6];
}

- (void)resetNecessaryFirstPartyPermissions:(id)a3
{
  id v4 = a3;
  id v5 = [(DSEmergencyResetController *)self appSharing];
  id v6 = [MEMORY[0x263EFFA08] setWithObject:@"DSLocationAlways"];
  id v7 = [MEMORY[0x263EFFA08] setWithObject:@"com.apple.shortcuts"];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__DSEmergencyResetController_resetNecessaryFirstPartyPermissions___block_invoke;
  v9[3] = &unk_264C6EC90;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v5 resetPermissions:v6 forApps:v7 queue:MEMORY[0x263EF83A0] handler:v9];
}

void __66__DSEmergencyResetController_resetNecessaryFirstPartyPermissions___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 count])
  {
    id v3 = [MEMORY[0x263F3A360] errorWithCode:4 underlyingErrors:v4];
    [*(id *)(a1 + 32) setResetError:v3];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)resetIDFA:(id)a3
{
  id v4 = a3;
  id v5 = [(DSEmergencyResetController *)self appSharing];
  id v6 = [MEMORY[0x263EFFA08] setWithObject:@"kTCCServiceUserTracking"];
  id v7 = [MEMORY[0x263F3A390] allApps];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __40__DSEmergencyResetController_resetIDFA___block_invoke;
  v9[3] = &unk_264C6EC90;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v5 resetPermissions:v6 forApps:v7 queue:MEMORY[0x263EF83A0] handler:v9];
}

void __40__DSEmergencyResetController_resetIDFA___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 count])
  {
    id v3 = [MEMORY[0x263F3A360] errorWithCode:4 underlyingErrors:v4];
    [*(id *)(a1 + 32) setResetError:v3];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)resetAppDistribution:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__DSEmergencyResetController_resetAppDistribution___block_invoke;
  v5[3] = &unk_264C6EBF8;
  id v6 = v3;
  id v4 = v3;
  +[AppDistributorWrapper handleEmergencyResetWithCompletionHandler:v5];
}

void __51__DSEmergencyResetController_resetAppDistribution___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = DSLogSafetyResetAll;
    if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_ERROR)) {
      __51__DSEmergencyResetController_resetAppDistribution___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unpairContinuityDevices:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DSEmergencyResetController *)self continuityStore];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__DSEmergencyResetController_unpairContinuityDevices___block_invoke;
  v7[3] = &unk_264C6EBF8;
  id v8 = v4;
  id v6 = v4;
  [v5 unpairAllDevicesWithCompletion:v7];
}

void __54__DSEmergencyResetController_unpairContinuityDevices___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = DSLogSafetyResetAll;
    if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_ERROR)) {
      __54__DSEmergencyResetController_unpairContinuityDevices___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (DSNavigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DSNavigationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DSSharingPermissions)permissions
{
  return self->_permissions;
}

- (void)setPermissions:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (DSAppSharing)appSharing
{
  return self->_appSharing;
}

- (void)setAppSharing:(id)a3
{
}

- (OBBoldTrayButton)boldButton
{
  return self->_boldButton;
}

- (void)setBoldButton:(id)a3
{
}

- (NSError)resetError
{
  return self->_resetError;
}

- (void)setResetError:(id)a3
{
}

- (BOOL)isFetching
{
  return self->_isFetching;
}

- (void)setIsFetching:(BOOL)a3
{
  self->_isFetching = a3;
}

- (SPBeaconManager)beaconManager
{
  return self->_beaconManager;
}

- (void)setBeaconManager:(id)a3
{
}

- (UIStackView)progressStackView
{
  return self->_progressStackView;
}

- (void)setProgressStackView:(id)a3
{
}

- (UIProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
}

- (BOOL)userDidPressReset
{
  return self->_userDidPressReset;
}

- (void)setUserDidPressReset:(BOOL)a3
{
  self->_userDidPressReset = a3;
}

- (DSWifiSyncStore)wifiSyncStore
{
  return self->_wifiSyncStore;
}

- (void)setWifiSyncStore:(id)a3
{
}

- (DSContinuityStore)continuityStore
{
  return self->_continuityStore;
}

- (void)setContinuityStore:(id)a3
{
}

- (NSArray)emergencyResetSteps
{
  return self->_emergencyResetSteps;
}

- (void)setEmergencyResetSteps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emergencyResetSteps, 0);
  objc_storeStrong((id *)&self->_continuityStore, 0);
  objc_storeStrong((id *)&self->_wifiSyncStore, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_progressStackView, 0);
  objc_storeStrong((id *)&self->_beaconManager, 0);
  objc_storeStrong((id *)&self->_resetError, 0);
  objc_storeStrong((id *)&self->_boldButton, 0);
  objc_storeStrong((id *)&self->_appSharing, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_permissions, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __54__DSEmergencyResetController_fetchSharingPermissions___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __51__DSEmergencyResetController_resetAppDistribution___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __54__DSEmergencyResetController_unpairContinuityDevices___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end