@interface WirelessModemController
- (BOOL)_wiFiPower;
- (WirelessModemController)init;
- (id)_bandPreferenceSpecFooterLabel;
- (id)_bandPreferenceSpecLabel;
- (id)_wiFiPassword;
- (id)bandPreference;
- (id)bandPreferenceSpec;
- (id)dataUsageString;
- (id)familyShareSpecifier;
- (id)internetTethering:(id)a3;
- (id)passwordSpec;
- (id)placardSpec;
- (id)setupViewSpec;
- (id)shareOption;
- (id)shareSpecifier;
- (id)specifiers;
- (id)stateFooterSpec;
- (id)tetheringSwitchSpec;
- (id)usageSpecifier;
- (void)_btAuthenticationRequestHandler:(id)a3;
- (void)_btDevicePairedHandler:(id)a3;
- (void)_btPinRequestHandler:(id)a3;
- (void)_btPowerChangedHandler:(id)a3;
- (void)_btSSPConfirmationHandler:(id)a3;
- (void)_btSSPNumericComparisonHandler:(id)a3;
- (void)_btSSPPasskeyDisplayHandler:(id)a3;
- (void)_managedConfigurationChangedHandler:(id)a3;
- (void)_misStateChangedHandler:(id)a3;
- (void)_registerAllNotificationObservers;
- (void)_setMISDiscoveryStateEnabled:(BOOL)a3 effectiveImmediately:(BOOL)a4;
- (void)_setMISDiscoveryStateEnabled:(BOOL)a3 effectiveImmediately:(BOOL)a4 forceBand:(BOOL)a5;
- (void)_setWiFiPassword:(id)a3;
- (void)_unregisterAllNotificationObservers;
- (void)_updatePersonalHotspotModificationDisableState;
- (void)_updateTetheringText:(BOOL)a3;
- (void)_wiFiPowerChangedHandler;
- (void)alertSheetDismissed:(id)a3;
- (void)allowWirelessConnections:(BOOL)a3;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationWillResign:(id)a3;
- (void)cleanupPairing;
- (void)dealloc;
- (void)dismissPairingAlert:(id)a3;
- (void)init;
- (void)setBandPreference:(id)a3 specifier:(id)a4;
- (void)setInternetTethering:(id)a3 specifier:(id)a4;
- (void)setPersonalHotspotModificationDisableState:(BOOL)a3;
- (void)setShareOption:(id)a3;
- (void)showAlert:(id)a3;
- (void)showPairingAlert:(id)a3;
- (void)specifiers;
- (void)terminateSearching:(BOOL)a3;
- (void)updateInstructionsSection:(int)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation WirelessModemController

- (WirelessModemController)init
{
  v26.receiver = self;
  v26.super_class = (Class)WirelessModemController;
  v2 = [(WirelessModemController *)&v26 init];
  if (v2)
  {
    v2->_wifiClient = (__WiFiManagerClient *)WiFiManagerClientCreate();
    v2->_wifiIsWAPI = MGGetBoolAnswer();
    v2->_placardFeatureEnabled = _os_feature_enabled_impl();
    Class v3 = NSClassFromString(&cfstr_Btspaircontrol.isa);
    v2->_btPairControllerClass = v3;
    if (!v3)
    {
      v4 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PreferenceBundles/BluetoothSettings.bundle"];
      [v4 load];

      v2->_btPairControllerClass = NSClassFromString(&cfstr_Btspaircontrol.isa);
    }
    v2->_btPairSetupClass = NSClassFromString(&cfstr_Btspairsetup.isa);
    v2->_btSSPRequestClass = NSClassFromString(&cfstr_Btssppairingre.isa);
    v2->_btAlertClass = NSClassFromString(&cfstr_Btalert.isa);
    v2->_btClassicDeviceClass = NSClassFromString(&cfstr_Btsdeviceclass.isa);
    if (v2->_wifiClient)
    {
      v2->_wifiTetheringSupported = WiFiManagerClientIsTetheringSupported() != 0;
      v2->_personalHotspotModificationDisabled = WiFiManagerClientIsPersonalHotspotModificationDisabled() != 0;
      v5 = WiFiManagerClientCopyProperty();
      v6 = v5;
      if (v5)
      {
        v2->_showBandPreferenceUI = [v5 BOOLValue];
        v7 = WMSLogComponent();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          [(WirelessModemController *)v7 init];
        }
      }
      if (!v2->_showBandPreferenceUI) {
        v2->_showBandPreferenceUI = 1;
      }
    }
    if (v2->_wifiTetheringSupported)
    {
      v15 = (void *)WiFiManagerClientCopyDevices();
      if ([v15 count])
      {
        v2->_wifiDevice = [v15 objectAtIndexedSubscript:0];
        CFRunLoopGetCurrent();
        WiFiManagerClientScheduleWithRunLoop();
        id v16 = objc_initWeak(&location, v2);
        WiFiDeviceClientRegisterPowerCallback();

        objc_destroyWeak(&location);
      }
    }
    v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v18 = [v17 bundleIdentifier];

    CFPreferencesSynchronize(v18, (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
    LOBYTE(location) = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"ShowBTPowerPrompt", v18, (Boolean *)&location);
    if ((_BYTE)location) {
      BOOL v20 = AppBooleanValue == 0;
    }
    else {
      BOOL v20 = 0;
    }
    char v21 = !v20;
    v2->_showBTPowerPrompt = v21;
  }
  dispatch_queue_t v22 = dispatch_queue_create("com.apple.wirelessmodemsettings.phsettings-serial", 0);
  serialQueue = v2->_serialQueue;
  v2->_serialQueue = (OS_dispatch_queue *)v22;

  [(WirelessModemController *)v2 setTitle:&stru_26F3105F0];
  return v2;
}

- (void)applicationWillResign:(id)a3
{
}

- (void)terminateSearching:(BOOL)a3
{
  if (self->_wifiTetheringSupported)
  {
    v5 = dispatch_get_global_queue(-32768, 0);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __46__WirelessModemController_terminateSearching___block_invoke;
    v8[3] = &unk_26506AB18;
    v8[4] = self;
    BOOL v9 = a3;
    dispatch_async(v5, v8);
  }
  v6 = objc_msgSend(MEMORY[0x263F2B998], "sharedInstance", a3);
  [v6 setDiscoverable:0];

  v7 = [MEMORY[0x263F2B998] sharedInstance];
  [v7 setConnectable:0];

  [(WirelessModemController *)self cleanupPairing];
}

uint64_t __46__WirelessModemController_terminateSearching___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setMISDiscoveryStateEnabled:0 effectiveImmediately:*(unsigned __int8 *)(a1 + 40)];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)WirelessModemController;
  [(WirelessModemController *)&v3 viewDidLoad];
  v2 = WMSUIEventDictionary(@"view-ph", 0);
  WMSubmitUIEventMetric(v2);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = [(WirelessModemController *)self navigationController];
  v5 = [v4 childViewControllers];
  id v6 = [v5 lastObject];

  if (!v6
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    [(WirelessModemController *)self _unregisterAllNotificationObservers];
    [(WirelessModemController *)self terminateSearching:0];
  }
}

- (void)applicationDidBecomeActive:(id)a3
{
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WirelessModemController;
  [(WirelessModemController *)&v10 viewDidAppear:a3];
  [(WirelessModemController *)self _registerAllNotificationObservers];
  [(WirelessModemController *)self allowWirelessConnections:1];
  if (_os_feature_enabled_impl())
  {
    v4 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.PersonalHotspot"];
    id v5 = objc_alloc(MEMORY[0x263F08DB0]);
    id v6 = [MEMORY[0x263EFF960] currentLocale];
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 bundleURL];
    BOOL v9 = (void *)[v5 initWithKey:@"Personal Hotspot" table:0 locale:v6 bundleURL:v8];

    if (objc_opt_respondsToSelector()) {
      [(WirelessModemController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.personal-hotspot" title:v9 localizedNavigationComponents:MEMORY[0x263EFFA68] deepLink:v4];
    }
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WirelessModemController;
  -[WirelessModemController willMoveToParentViewController:](&v8, sel_willMoveToParentViewController_);
  if (!a3)
  {
    id v5 = [(WirelessModemController *)self parentViewController];
    id v6 = [v5 navigationItem];
    [v6 setTitleView:0];

    v7 = [(WirelessModemController *)self navigationItem];
    [v7 setTitleView:0];
  }
}

- (void)dealloc
{
  [(WirelessModemController *)self _unregisterAllNotificationObservers];
  [(WirelessModemController *)self allowWirelessConnections:0];
  if (self->_wifiTetheringSupported)
  {
    CFRunLoopGetCurrent();
    WiFiManagerClientUnscheduleFromRunLoop();
  }
  [(UIAlertController *)self->_powerAlert dismissViewControllerAnimated:1 completion:0];
  [self->_btSSPAlert dismiss];
  [self->_btAlert dismiss];
  wifiDevice = self->_wifiDevice;
  if (wifiDevice) {
    CFRelease(wifiDevice);
  }
  wifiClient = self->_wifiClient;
  if (wifiClient) {
    CFRelease(wifiClient);
  }
  v5.receiver = self;
  v5.super_class = (Class)WirelessModemController;
  [(WirelessModemController *)&v5 dealloc];
}

- (void)_misStateChangedHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__WirelessModemController__misStateChangedHandler___block_invoke;
  v6[3] = &unk_26506A988;
  id v7 = v4;
  objc_super v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __51__WirelessModemController__misStateChangedHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) userInfo];
  objc_super v3 = [v2 objectForKeyedSubscript:@"State"];
  unsigned int v4 = [v3 unsignedIntValue];

  id v5 = *(id **)(a1 + 40);
  if (v4 > 0x3FD)
  {
    [v5 _updateTetheringText:0];
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = v7[178];
    [v7 reloadSpecifier:v8];
  }
  else
  {
    [v5[176] dismissViewControllerAnimated:1 completion:0];
    [*(id *)(*(void *)(a1 + 40) + 1552) dismiss];
    [*(id *)(a1 + 40) cleanupPairing];
    id v9 = [*(id *)(a1 + 40) rootController];
    id v6 = (id)[v9 popViewControllerAnimated:1];
  }
}

- (void)allowWirelessConnections:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3
    || ([(WirelessModemController *)self view],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 _isInAWindow],
        v5,
        v6))
  {
    id v7 = [MEMORY[0x263F2B998] sharedInstance];
    [v7 setDiscoverable:v3];

    uint64_t v8 = [MEMORY[0x263F2B998] sharedInstance];
    [v8 setConnectable:v3];

    if (self->_wifiTetheringSupported)
    {
      [(WirelessModemController *)self _setMISDiscoveryStateEnabled:v3 effectiveImmediately:v3];
    }
  }
}

- (void)_managedConfigurationChangedHandler:(id)a3
{
  dispatch_time_t v4 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__WirelessModemController__managedConfigurationChangedHandler___block_invoke;
  block[3] = &unk_26506AB40;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
}

uint64_t __63__WirelessModemController__managedConfigurationChangedHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePersonalHotspotModificationDisableState];
}

- (void)_updatePersonalHotspotModificationDisableState
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a1) {
    v2 = "Disabled";
  }
  else {
    v2 = "Enabled";
  }
  int v3 = 136315394;
  dispatch_time_t v4 = "-[WirelessModemController _updatePersonalHotspotModificationDisableState]";
  __int16 v5 = 2080;
  int v6 = v2;
  _os_log_error_impl(&dword_23F3F1000, a2, OS_LOG_TYPE_ERROR, "%s: Personal Hotspot Modification is %s", (uint8_t *)&v3, 0x16u);
}

- (void)setPersonalHotspotModificationDisableState:(BOOL)a3
{
  if (self->_personalHotspotModificationDisabled == a3)
  {
    int v3 = WMSLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[WirelessModemController setPersonalHotspotModificationDisableState:](v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  else
  {
    self->_personalHotspotModificationDisabled = a3;
    tetheringSwitchSpec = self->_tetheringSwitchSpec;
    if (a3) {
      uint64_t v13 = MEMORY[0x263EFFA80];
    }
    else {
      uint64_t v13 = MEMORY[0x263EFFA88];
    }
    [(PSSpecifier *)tetheringSwitchSpec setProperty:v13 forKey:*MEMORY[0x263F600A8]];
    uint64_t v14 = self->_tetheringSwitchSpec;
    [(WirelessModemController *)self reloadSpecifier:v14 animated:0];
  }
}

- (void)_registerAllNotificationObservers
{
  if (!self->_didRegisteredNotificationObservers)
  {
    int v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:self selector:sel_applicationWillResign_ name:@"UIApplicationWillResignActiveNotification" object:0];

    uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:self selector:sel_applicationDidBecomeActive_ name:@"UIApplicationDidBecomeActiveNotification" object:0];

    uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:self selector:sel__misStateChangedHandler_ name:@"MISManagerStateChangedNotification" object:0];

    uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:self selector:sel__btPowerChangedHandler_ name:*MEMORY[0x263F2B8E8] object:0];

    uint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:self selector:sel__btPowerChangedHandler_ name:*MEMORY[0x263F2B980] object:0];

    uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:self selector:sel__btAuthenticationRequestHandler_ name:*MEMORY[0x263F2B950] object:0];

    uint64_t v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:self selector:sel__btDevicePairedHandler_ name:*MEMORY[0x263F2B958] object:0];

    uint64_t v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:self selector:sel__btDevicePairedHandler_ name:*MEMORY[0x263F2B960] object:0];

    uint64_t v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:self selector:sel__btAuthenticationRequestHandler_ name:*MEMORY[0x263F2B970] object:0];

    uint64_t v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:self selector:sel__btAuthenticationRequestHandler_ name:*MEMORY[0x263F2B978] object:0];

    uint64_t v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:self selector:sel__btAuthenticationRequestHandler_ name:*MEMORY[0x263F2B968] object:0];

    uint64_t v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:self selector:sel__managedConfigurationChangedHandler_ name:*MEMORY[0x263F536E0] object:0];

    self->_didRegisteredNotificationObservers = 1;
  }
}

- (void)_unregisterAllNotificationObservers
{
  int v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  if (self->_wifiDevice) {
    WiFiDeviceClientRegisterPowerCallback();
  }
  self->_didRegisteredNotificationObservers = 0;
}

- (void)_setMISDiscoveryStateEnabled:(BOOL)a3 effectiveImmediately:(BOOL)a4
{
}

- (void)_setMISDiscoveryStateEnabled:(BOOL)a3 effectiveImmediately:(BOOL)a4 forceBand:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  v14[2] = *MEMORY[0x263EF8340];
  uint64_t v8 = WMSLogComponent();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[WirelessModemController _setMISDiscoveryStateEnabled:effectiveImmediately:forceBand:](v7, v6, v8);
  }

  v13[0] = @"SOFTAP_ENABLE";
  uint64_t v9 = [NSNumber numberWithBool:v7];
  v13[1] = @"SOFTAP_IMMEDIATE_DISABLE";
  v14[0] = v9;
  uint64_t v10 = [NSNumber numberWithBool:v6];
  v14[1] = v10;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  if (v5)
  {
    uint64_t v12 = (void *)[v11 mutableCopy];
    [v12 setObject:MEMORY[0x263EFFA88] forKey:@"SOFTAP_FORCE_2_4G_CHANNEL"];

    uint64_t v11 = v12;
  }
  WiFiManagerClientSetMISDiscoveryStateExt();
}

- (void)_wiFiPowerChangedHandler
{
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__WirelessModemController__wiFiPowerChangedHandler__block_invoke;
  block[3] = &unk_26506AB90;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_sync(serialQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __51__WirelessModemController__wiFiPowerChangedHandler__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__WirelessModemController__wiFiPowerChangedHandler__block_invoke_2;
  block[3] = &unk_26506AB68;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x263EF83A0], block);
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 1401))
  {
    *(unsigned char *)(v2 + 1401) = 0;
    if (!*(unsigned char *)(*(void *)(a1 + 32) + 1400))
    {
      int v3 = +[MISManager sharedManager];
      [v3 setState:1023];
    }
  }
  if (WiFiDeviceClientGetPower()) {
    [*(id *)(a1 + 32) _setMISDiscoveryStateEnabled:1 effectiveImmediately:0];
  }
  objc_destroyWeak(&v5);
}

void __51__WirelessModemController__wiFiPowerChangedHandler__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateTetheringText:0];
}

- (BOOL)_wiFiPower
{
  if (self->_wifiTetheringSupported)
  {
    wifiDevice = self->_wifiDevice;
    if (wifiDevice) {
      LOBYTE(wifiDevice) = WiFiDeviceClientGetPower() != 0;
    }
  }
  else
  {
    LOBYTE(wifiDevice) = 0;
  }
  return (char)wifiDevice;
}

- (void)_setWiFiPassword:(id)a3
{
  id v4 = a3;
  if (self->_wifiClient)
  {
    id v6 = v4;
    id v5 = v4;
    WiFiManagerClientSetMisPassword();
    id v4 = v6;
  }
}

- (id)_wiFiPassword
{
  if (!self->_wifiClient) {
    goto LABEL_5;
  }
  int v3 = (void *)WiFiManagerClientCopyMisPassword();
  if ([v3 length]) {
    goto LABEL_6;
  }
  uint64_t v4 = +[WiFiPasswordController generateDefaultPassword];

  if (v4)
  {
    [(WirelessModemController *)self _setWiFiPassword:v4];
    id v5 = WMSUIEventDictionary(@"generated-ph-password", 0);
    WMSubmitUIEventMetric(v5);

    int v3 = (void *)v4;
  }
  else
  {
LABEL_5:
    int v3 = 0;
  }
LABEL_6:

  return v3;
}

- (void)setBandPreference:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 BOOLValue];
  [NSNumber numberWithUnsignedInt:v6];
  WiFiManagerClientSetProperty();
  BOOL v7 = WMSLogComponent();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[WirelessModemController setBandPreference:specifier:](v6, v7);
  }

  [(WirelessModemController *)self _setMISDiscoveryStateEnabled:1 effectiveImmediately:1 forceBand:v6];
  int v8 = [v5 BOOLValue];

  if (v8) {
    uint64_t v9 = @"true";
  }
  else {
    uint64_t v9 = @"false";
  }
  uint64_t v10 = WMSUIEventDictionary(@"toggle-ph-compatibility", v9);
  WMSubmitUIEventMetric(v10);
}

- (id)bandPreference
{
  uint64_t v2 = (void *)WiFiManagerClientCopyProperty();
  int v3 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v2, "intValue") == 1);

  return v3;
}

- (void)_btPowerChangedHandler:(id)a3
{
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__WirelessModemController__btPowerChangedHandler___block_invoke;
  block[3] = &unk_26506ABB8;
  void block[4] = self;
  objc_copyWeak(&v6, &location);
  dispatch_sync(serialQueue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __50__WirelessModemController__btPowerChangedHandler___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__WirelessModemController__btPowerChangedHandler___block_invoke_2;
  block[3] = &unk_26506AB40;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 1400))
  {
    *(unsigned char *)(v2 + 1400) = 0;
    if (!*(unsigned char *)(*(void *)(a1 + 32) + 1401))
    {
      int v3 = +[MISManager sharedManager];
      [v3 setState:1023];
    }
  }
  uint64_t v4 = [MEMORY[0x263F2B998] sharedInstance];
  int v5 = [v4 powered];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v7 = WeakRetained;
  if (v5) {
    [WeakRetained allowWirelessConnections:1];
  }
  else {
    [WeakRetained cleanupPairing];
  }

  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 1432);
  *(void *)(v8 + 1432) = 0;
}

uint64_t __50__WirelessModemController__btPowerChangedHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTetheringText:0];
}

- (void)_btAuthenticationRequestHandler:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (self->_btPairControllerClass && self->_btPairSetupClass && self->_btSSPRequestClass)
  {
    id v6 = [(WirelessModemController *)self rootController];
    BOOL v7 = [v6 visibleViewController];
    if ((objc_opt_isKindOfClass() & 1) != 0 || self->_btSSPAlert)
    {

      goto LABEL_7;
    }
    id btAlert = self->_btAlert;

    if (btAlert)
    {
LABEL_7:
      uint64_t v8 = WMSLogComponent();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[WirelessModemController _btAuthenticationRequestHandler:]((uint64_t)self, v8);
      }
LABEL_9:

      goto LABEL_10;
    }
    if (!self->_waitingOnBTPower && !self->_currentDeviceSpecifier)
    {
      uint64_t v10 = [v5 name];
      uint64_t v11 = *MEMORY[0x263F2B978];
      if ([v10 isEqualToString:*MEMORY[0x263F2B978]])
      {
      }
      else
      {
        uint64_t v12 = [v5 name];
        int v13 = [v12 isEqualToString:*MEMORY[0x263F2B968]];

        if (!v13)
        {
          uint64_t v8 = [v5 object];
          goto LABEL_19;
        }
      }
      uint64_t v14 = [v5 object];
      uint64_t v8 = [v14 objectForKeyedSubscript:@"device"];

LABEL_19:
      v15 = WMSLogComponent();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v51 = NSStringFromSelector(a2);
        v52 = [v5 name];
        v53 = [v8 name];
        *(_DWORD *)buf = 138412802;
        v55 = v51;
        __int16 v56 = 2112;
        v57 = v52;
        __int16 v58 = 2112;
        v59 = v53;
        _os_log_error_impl(&dword_23F3F1000, v15, OS_LOG_TYPE_ERROR, "%@ received %@ for device %@", buf, 0x20u);
      }
      if ([v8 majorClass] == 256
        && ([v5 userInfo],
            id v16 = objc_claimAutoreleasedReturnValue(),
            [v16 valueForKey:@"delayedPairingForNR"],
            v17 = objc_claimAutoreleasedReturnValue(),
            v17,
            v16,
            !v17))
      {
        v36 = WMSLogComponent();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          -[WirelessModemController _btAuthenticationRequestHandler:](v36, v37, v38, v39, v40, v41, v42, v43);
        }

        v44 = (void *)MEMORY[0x263EFF9A0];
        v45 = [v5 userInfo];
        v24 = [v44 dictionaryWithDictionary:v45];

        [v24 setObject:&stru_26F3105F0 forKeyedSubscript:@"delayedPairingForNR"];
        v46 = (void *)MEMORY[0x263F089F8];
        v28 = [v5 name];
        v47 = [v5 object];
        v48 = [v46 notificationWithName:v28 object:v47 userInfo:v24];
        [(WirelessModemController *)self performSelector:sel__btAuthenticationRequestHandler_ withObject:v48 afterDelay:1.0];
      }
      else
      {
        uint64_t v18 = [v8 name];
        v19 = (void *)v18;
        BOOL v20 = &stru_26F3105F0;
        if (v18) {
          BOOL v20 = (__CFString *)v18;
        }
        char v21 = v20;

        dispatch_queue_t v22 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v21 target:self set:0 get:0 detail:0 cell:1 edit:0];
        currentDeviceSpecifier = self->_currentDeviceSpecifier;
        self->_currentDeviceSpecifier = v22;

        v24 = [MEMORY[0x263EFF9A0] dictionary];
        v25 = NSStringFromClass(self->_btPairSetupClass);
        [v24 setObject:v25 forKeyedSubscript:*MEMORY[0x263F60080]];

        objc_super v26 = NSStringFromClass(self->_btPairControllerClass);
        [v24 setObject:v26 forKeyedSubscript:*MEMORY[0x263F60228]];

        [v24 setObject:@"PSLinkCell" forKeyedSubscript:*MEMORY[0x263F602A0]];
        [v24 setObject:v21 forKeyedSubscript:*MEMORY[0x263F602D0]];

        v27 = [v8 address];
        [v24 setObject:v27 forKeyedSubscript:*MEMORY[0x263F60138]];

        [(PSSpecifier *)self->_currentDeviceSpecifier setProperties:v24];
        v28 = [MEMORY[0x263EFF9A0] dictionary];
        v29 = [(objc_class *)self->_btClassicDeviceClass deviceWithDevice:v8];
        [v28 setObject:v29 forKeyedSubscript:@"bt-device"];

        [v28 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"reverse-pairing"];
        [(PSSpecifier *)self->_currentDeviceSpecifier setUserInfo:v28];
        v30 = [v5 name];
        int v31 = [v30 isEqualToString:*MEMORY[0x263F2B950]];

        if (v31)
        {
          [(WirelessModemController *)self _btPinRequestHandler:v5];
        }
        else
        {
          v32 = [v5 name];
          int v33 = [v32 isEqualToString:*MEMORY[0x263F2B970]];

          if (v33)
          {
            [(WirelessModemController *)self _btSSPConfirmationHandler:v5];
          }
          else
          {
            v34 = [v5 name];
            int v35 = [v34 isEqualToString:v11];

            if (v35)
            {
              [(WirelessModemController *)self _btSSPNumericComparisonHandler:v5];
            }
            else
            {
              v49 = [v5 name];
              int v50 = [v49 isEqualToString:*MEMORY[0x263F2B968]];

              if (v50) {
                [(WirelessModemController *)self _btSSPPasskeyDisplayHandler:v5];
              }
            }
          }
        }
      }

      goto LABEL_9;
    }
  }
LABEL_10:
}

- (void)_btPinRequestHandler:(id)a3
{
  id v5 = a3;
  id v6 = WMSLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    [(WirelessModemController *)a2 _btPinRequestHandler:v6];
  }

  id v7 = objc_alloc_init(self->_btPairSetupClass);
  [(WirelessModemController *)self setShowingSetupController:1];
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x263F5FE88]));
  [v7 setRootController:WeakRetained];

  [v7 setParentController:self];
  [v7 setSpecifier:self->_currentDeviceSpecifier];
  objc_storeWeak((id *)((char *)self->_currentDeviceSpecifier + (int)*MEMORY[0x263F5FE40]), self);
  [(WirelessModemController *)self showController:v7];
}

- (void)_btSSPConfirmationHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [v5 object];
  id v7 = WMSLogComponent();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = NSStringFromSelector(a2);
    uint64_t v11 = [v5 name];
    uint64_t v12 = [v6 name];
    int v13 = 138412802;
    uint64_t v14 = v10;
    __int16 v15 = 2112;
    id v16 = v11;
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    _os_log_error_impl(&dword_23F3F1000, v7, OS_LOG_TYPE_ERROR, "%@ received %@ for device %@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v8 = (void *)[objc_alloc(self->_btSSPRequestClass) initWithDevice:v6 andSpecifier:self->_currentDeviceSpecifier];
  id btSSPAlert = self->_btSSPAlert;
  self->_id btSSPAlert = v8;

  [self->_btSSPAlert setPairingStyle:0 andPasskey:0];
  [self->_btSSPAlert setDelegate:self];
  [self->_btSSPAlert show];
}

- (void)_btSSPNumericComparisonHandler:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [v5 object];
  id v7 = [v6 objectForKeyedSubscript:@"device"];
  uint64_t v8 = [v6 objectForKeyedSubscript:@"value"];
  uint64_t v9 = WMSLogComponent();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = NSStringFromSelector(a2);
    int v13 = [v5 name];
    uint64_t v14 = [v7 name];
    int v15 = 138412802;
    id v16 = v12;
    __int16 v17 = 2112;
    uint64_t v18 = v13;
    __int16 v19 = 2112;
    BOOL v20 = v14;
    _os_log_error_impl(&dword_23F3F1000, v9, OS_LOG_TYPE_ERROR, "%@ received %@ for device %@", (uint8_t *)&v15, 0x20u);
  }
  uint64_t v10 = (void *)[objc_alloc(self->_btSSPRequestClass) initWithDevice:v7 andSpecifier:self->_currentDeviceSpecifier];
  id btSSPAlert = self->_btSSPAlert;
  self->_id btSSPAlert = v10;

  [self->_btSSPAlert setPairingStyle:1 andPasskey:v8];
  [self->_btSSPAlert setDelegate:self];
  [self->_btSSPAlert show];
}

- (void)_btSSPPasskeyDisplayHandler:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [v5 object];
  id v7 = [v6 objectForKeyedSubscript:@"device"];
  uint64_t v8 = [v6 objectForKeyedSubscript:@"value"];
  uint64_t v9 = WMSLogComponent();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = NSStringFromSelector(a2);
    int v13 = [v5 name];
    uint64_t v14 = [v7 name];
    int v15 = 138412802;
    id v16 = v12;
    __int16 v17 = 2112;
    uint64_t v18 = v13;
    __int16 v19 = 2112;
    BOOL v20 = v14;
    _os_log_error_impl(&dword_23F3F1000, v9, OS_LOG_TYPE_ERROR, "%@ received %@ for device %@", (uint8_t *)&v15, 0x20u);
  }
  uint64_t v10 = (void *)[objc_alloc(self->_btSSPRequestClass) initWithDevice:v7 andSpecifier:self->_currentDeviceSpecifier];
  id btSSPAlert = self->_btSSPAlert;
  self->_id btSSPAlert = v10;

  [self->_btSSPAlert setPairingStyle:2 andPasskey:v8];
  [self->_btSSPAlert setDelegate:self];
  [self->_btSSPAlert show];
}

- (void)_btDevicePairedHandler:(id)a3
{
  id v24 = a3;
  uint64_t v4 = [v24 object];
  id v5 = [v4 address];
  id v6 = [(PSSpecifier *)self->_currentDeviceSpecifier identifier];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    uint64_t v8 = [(PSSpecifier *)self->_currentDeviceSpecifier userInfo];
    uint64_t v9 = [v8 objectForKey:@"PIN-ended"];

    uint64_t v10 = [(PSSpecifier *)self->_currentDeviceSpecifier userInfo];
    [v10 removeObjectForKey:@"PIN-ended"];

    uint64_t v11 = [v24 name];
    int v12 = [v11 isEqualToString:*MEMORY[0x263F2B958]];

    if (v12)
    {
      if (!self->_btAlert)
      {
        int v13 = (void *)[objc_alloc(self->_btAlertClass) initWithDevice:v4];
        id btAlert = self->_btAlert;
        self->_id btAlert = v13;

        [self->_btAlert setDelegate:self];
        if (v9) {
          goto LABEL_5;
        }
        id btSSPAlert = self->_btSSPAlert;
        if (btSSPAlert
          && [btSSPAlert pairingStyle] != 2
          && [self->_btSSPAlert pairingStyle] != 3)
        {
          goto LABEL_13;
        }
        BOOL v20 = [(WirelessModemController *)self rootController];
        uint64_t v21 = [v20 visibleViewController];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
LABEL_5:
          if (![v9 isEqualToString:@"entered"])
          {
            __int16 v17 = [v24 userInfo];
            uint64_t v18 = [v17 objectForKeyedSubscript:*MEMORY[0x263F2B938]];

LABEL_15:
            [(WirelessModemController *)self cleanupPairing];
            [self->_btAlert showAlertWithResult:v18];

            goto LABEL_16;
          }
          int v15 = NSNumber;
          uint64_t v16 = 156;
        }
        else
        {
LABEL_13:
          int v15 = NSNumber;
          uint64_t v16 = 1;
        }
        uint64_t v18 = [v15 numberWithUnsignedInt:v16];
        goto LABEL_15;
      }
    }
    else
    {
      [(WirelessModemController *)self cleanupPairing];
    }
LABEL_16:
    currentDeviceSpecifier = self->_currentDeviceSpecifier;
    self->_currentDeviceSpecifier = 0;
  }
}

- (void)alertSheetDismissed:(id)a3
{
  self->_id btAlert = 0;
  MEMORY[0x270F9A758]();
}

- (void)cleanupPairing
{
  [self->_btSSPAlert dismiss];
  id btSSPAlert = self->_btSSPAlert;
  self->_id btSSPAlert = 0;

  uint64_t v4 = [(WirelessModemController *)self rootController];
  id v5 = [v4 visibleViewController];
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v9 = [(WirelessModemController *)self rootController];
    int v7 = [v9 visibleViewController];
    uint64_t v8 = [v7 parentViewController];
    [v8 performSelector:sel_dismiss];
  }
}

- (id)internetTethering:(id)a3
{
  int v6 = 0;
  int v3 = +[MISManager sharedManager];
  [v3 getState:&v6 andReason:0];

  uint64_t v4 = [NSNumber numberWithInt:v6 == 1023];

  return v4;
}

- (void)setInternetTethering:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v154[0] = 1022;
  int v8 = [v6 BOOLValue];
  if (v8) {
    uint64_t v9 = 1023;
  }
  else {
    uint64_t v9 = 1022;
  }
  uint64_t v10 = +[MISManager sharedManager];
  [v10 getState:v154 andReason:0];

  if (v154[0] == v9) {
    goto LABEL_60;
  }
  if (v154[0] == 1022) {
    int v11 = v8;
  }
  else {
    int v11 = 0;
  }
  if (v11 == 1)
  {
    if (([MEMORY[0x263F2B998] sharedInstance],
          int v12 = objc_claimAutoreleasedReturnValue(),
          char v13 = [v12 enabled],
          v12,
          BOOL v14 = [(WirelessModemController *)self _wiFiPower],
          char v15 = v14,
          (v13 & 1) == 0)
      && self->_showBTPowerPrompt
      || self->_wifiTetheringSupported && (!self->_wifiDevice ? (char v16 = 1) : (char v16 = v14), (v16 & 1) == 0))
    {
      BOOL v20 = [NSNumber numberWithBool:1];
      [v7 setProperty:v20 forKey:*MEMORY[0x263F60020]];

      [(WirelessModemController *)self reloadSpecifier:v7];
      id v134 = v7;
      if (v13)
      {
        v128 = (void *)MEMORY[0x263F82418];
        uint64_t v21 = NSString;
        v135 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v22 = [v135 localizedStringForKey:@"POWER_ALERT_WF_OFF_TITLE" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
        v123 = (void *)v22;
        BOOL wifiIsWAPI = self->_wifiIsWAPI;
        id v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v125 = v24;
        if (wifiIsWAPI) {
          v25 = @"WIFI_CH";
        }
        else {
          v25 = @"WIFI";
        }
        v121 = [v24 localizedStringForKey:v25 value:&stru_26F3105F0 table:@"WirelessModemSettings"];
        objc_super v26 = objc_msgSend(v21, "stringWithFormat:", v22, v121);
        v27 = NSString;
        v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v29 = [v28 localizedStringForKey:@"POWER_ALERT_WF_OFF_MESSAGE" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
        BOOL v30 = self->_wifiIsWAPI;
        int v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v32 = v31;
        if (v30) {
          int v33 = @"WIFI_CH";
        }
        else {
          int v33 = @"WIFI";
        }
        v34 = [v31 localizedStringForKey:v33 value:&stru_26F3105F0 table:@"WirelessModemSettings"];
        int v35 = objc_msgSend(v27, "stringWithFormat:", v29, v34);
        v36 = [v128 alertControllerWithTitle:v26 message:v35 preferredStyle:1];
        powerAlert = self->_powerAlert;
        self->_powerAlert = v36;

        objc_initWeak(&location, self->_powerAlert);
        uint64_t v38 = (void *)MEMORY[0x263F82400];
        uint64_t v39 = NSString;
        uint64_t v40 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v41 = [v40 localizedStringForKey:@"POWER_ALERT_WF_OFF_CANCEL_BUTTON" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
        if (self->_wifiIsWAPI)
        {
          uint64_t v42 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          [v42 localizedStringForKey:@"WIFI_CH" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
        }
        else
        {
          uint64_t v42 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          [v42 localizedStringForKey:@"WIFI" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
        v76 = };
        v77 = objc_msgSend(v39, "stringWithFormat:", v41, v76);
        v139[0] = MEMORY[0x263EF8330];
        v139[1] = 3221225472;
        v139[2] = __58__WirelessModemController_setInternetTethering_specifier___block_invoke_7;
        v139[3] = &unk_26506ABE0;
        objc_copyWeak(&v140, &location);
        v126 = [v38 actionWithTitle:v77 style:1 handler:v139];

        v78 = (void *)MEMORY[0x263F82400];
        v79 = NSString;
        v80 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v81 = [v80 localizedStringForKey:@"POWER_ALERT_WF_OFF_OK_BUTTON" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
        if (self->_wifiIsWAPI)
        {
          v82 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          [v82 localizedStringForKey:@"WIFI_CH" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
        }
        else
        {
          v82 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          [v82 localizedStringForKey:@"WIFI" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
        v83 = };
        v84 = objc_msgSend(v79, "stringWithFormat:", v81, v83);
        v137[0] = MEMORY[0x263EF8330];
        v137[1] = 3221225472;
        v137[2] = __58__WirelessModemController_setInternetTethering_specifier___block_invoke_8;
        v137[3] = &unk_26506AC08;
        v137[4] = self;
        objc_copyWeak(&v138, &location);
        v85 = [v78 actionWithTitle:v84 style:0 handler:v137];

        [(UIAlertController *)self->_powerAlert addAction:v126];
        [(UIAlertController *)self->_powerAlert addAction:v85];

        objc_destroyWeak(&v138);
        v86 = &v140;
LABEL_58:
        objc_destroyWeak(v86);
        objc_destroyWeak(&location);
        id v7 = v134;
        goto LABEL_59;
      }
      if (self->_wifiTetheringSupported)
      {
        if (self->_wifiDevice) {
          char v43 = v15;
        }
        else {
          char v43 = 1;
        }
        v136 = (void *)MEMORY[0x263F82418];
        if ((v43 & 1) == 0)
        {
          v87 = NSString;
          v133 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v88 = [v133 localizedStringForKey:@"POWER_ALERT_BOTH_OFF_TITLE" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
          v127 = (void *)v88;
          BOOL v89 = self->_wifiIsWAPI;
          v90 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v130 = v90;
          if (v89) {
            v91 = @"WIFI_CH";
          }
          else {
            v91 = @"WIFI";
          }
          v124 = [v90 localizedStringForKey:v91 value:&stru_26F3105F0 table:@"WirelessModemSettings"];
          v122 = objc_msgSend(v87, "stringWithFormat:", v88, v124);
          v92 = NSString;
          v93 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v94 = [v93 localizedStringForKey:@"POWER_ALERT_BOTH_OFF_MESSAGE" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
          BOOL v95 = self->_wifiIsWAPI;
          v96 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v97 = v96;
          if (v95) {
            v98 = @"WIFI_CH";
          }
          else {
            v98 = @"WIFI";
          }
          v99 = [v96 localizedStringForKey:v98 value:&stru_26F3105F0 table:@"WirelessModemSettings"];
          v100 = objc_msgSend(v92, "stringWithFormat:", v94, v99);
          v101 = [v136 alertControllerWithTitle:v122 message:v100 preferredStyle:1];
          v102 = self->_powerAlert;
          self->_powerAlert = v101;

          objc_initWeak(&location, self->_powerAlert);
          v103 = (void *)MEMORY[0x263F82400];
          v104 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v105 = [v104 localizedStringForKey:@"POWER_ALERT_BOTH_OFF_CANCEL_BUTTON" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
          v151[0] = MEMORY[0x263EF8330];
          v151[1] = 3221225472;
          v151[2] = __58__WirelessModemController_setInternetTethering_specifier___block_invoke;
          v151[3] = &unk_26506ABE0;
          objc_copyWeak(&v152, &location);
          v131 = [v103 actionWithTitle:v105 style:1 handler:v151];

          v106 = (void *)MEMORY[0x263F82400];
          v107 = NSString;
          v108 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v109 = [v108 localizedStringForKey:@"POWER_ALERT_BOTH_OFF_OK_BUTTON" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
          if (self->_wifiIsWAPI)
          {
            v110 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            [v110 localizedStringForKey:@"WIFI_CH" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
          }
          else
          {
            v110 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            [v110 localizedStringForKey:@"WIFI" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
          v118 = };
          v119 = objc_msgSend(v107, "stringWithFormat:", v109, v118);
          v149[0] = MEMORY[0x263EF8330];
          v149[1] = 3221225472;
          v149[2] = __58__WirelessModemController_setInternetTethering_specifier___block_invoke_2;
          v149[3] = &unk_26506AC08;
          v149[4] = self;
          objc_copyWeak(&v150, &location);
          v120 = [v106 actionWithTitle:v119 style:0 handler:v149];

          [(UIAlertController *)self->_powerAlert addAction:v131];
          [(UIAlertController *)self->_powerAlert addAction:v120];

          objc_destroyWeak(&v150);
          v86 = &v152;
          goto LABEL_58;
        }
        v132 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v129 = [v132 localizedStringForKey:@"POWER_ALERT_BT_OFF_TITLE" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
        v44 = NSString;
        v45 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v46 = [v45 localizedStringForKey:@"POWER_ALERT_BT_OFF_MESSAGE" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
        BOOL v47 = self->_wifiIsWAPI;
        v48 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v49 = v48;
        if (v47) {
          int v50 = @"WIFI_CH";
        }
        else {
          int v50 = @"WIFI";
        }
        v51 = [v48 localizedStringForKey:v50 value:&stru_26F3105F0 table:@"WirelessModemSettings"];
        v52 = objc_msgSend(v44, "stringWithFormat:", v46, v51);
        v53 = [v136 alertControllerWithTitle:v129 message:v52 preferredStyle:1];
        v54 = self->_powerAlert;
        self->_powerAlert = v53;

        objc_initWeak(&location, self->_powerAlert);
        v55 = (void *)MEMORY[0x263F82400];
        __int16 v56 = NSString;
        v57 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        __int16 v58 = [v57 localizedStringForKey:@"POWER_ALERT_BT_OFF_CANCEL_BUTTON" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
        if (self->_wifiIsWAPI)
        {
          v59 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          [v59 localizedStringForKey:@"WIFI_CH" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
        }
        else
        {
          v59 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          [v59 localizedStringForKey:@"WIFI" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
        v111 = };
        v112 = objc_msgSend(v56, "stringWithFormat:", v58, v111);
        v143[0] = MEMORY[0x263EF8330];
        v143[1] = 3221225472;
        v143[2] = __58__WirelessModemController_setInternetTethering_specifier___block_invoke_5;
        v143[3] = &unk_26506AC08;
        v143[4] = self;
        v70 = &v144;
        objc_copyWeak(&v144, &location);
        v113 = [v55 actionWithTitle:v112 style:1 handler:v143];

        v114 = (void *)MEMORY[0x263F82400];
        v115 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v116 = [v115 localizedStringForKey:@"POWER_ALERT_BT_OFF_OK_BUTTON" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
        v141[0] = MEMORY[0x263EF8330];
        v141[1] = 3221225472;
        v141[2] = __58__WirelessModemController_setInternetTethering_specifier___block_invoke_6;
        v141[3] = &unk_26506AC08;
        v141[4] = self;
        objc_copyWeak(&v142, &location);
        v117 = [v114 actionWithTitle:v116 style:0 handler:v141];

        [(UIAlertController *)self->_powerAlert addAction:v113];
        [(UIAlertController *)self->_powerAlert addAction:v117];

        objc_destroyWeak(&v142);
      }
      else
      {
        uint64_t v60 = (void *)MEMORY[0x263F82418];
        v61 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v62 = [v61 localizedStringForKey:@"POWER_ALERT_BT_ONLY_OFF_TITLE" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
        v63 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v64 = [v63 localizedStringForKey:@"POWER_ALERT_BT_ONLY_OFF_MESSAGE" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
        v65 = [v60 alertControllerWithTitle:v62 message:v64 preferredStyle:1];
        v66 = self->_powerAlert;
        self->_powerAlert = v65;

        objc_initWeak(&location, self->_powerAlert);
        v67 = (void *)MEMORY[0x263F82400];
        v68 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v69 = [v68 localizedStringForKey:@"POWER_ALERT_BT_ONLY_OFF_CANCEL_BUTTON" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
        v147[0] = MEMORY[0x263EF8330];
        v147[1] = 3221225472;
        v147[2] = __58__WirelessModemController_setInternetTethering_specifier___block_invoke_3;
        v147[3] = &unk_26506AC08;
        v147[4] = self;
        v70 = &v148;
        objc_copyWeak(&v148, &location);
        v71 = [v67 actionWithTitle:v69 style:1 handler:v147];

        v72 = (void *)MEMORY[0x263F82400];
        v73 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v74 = [v73 localizedStringForKey:@"POWER_ALERT_BT_ONLY_OFF_OK_BUTTON" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
        v145[0] = MEMORY[0x263EF8330];
        v145[1] = 3221225472;
        v145[2] = __58__WirelessModemController_setInternetTethering_specifier___block_invoke_4;
        v145[3] = &unk_26506AC08;
        v145[4] = self;
        objc_copyWeak(&v146, &location);
        v75 = [v72 actionWithTitle:v74 style:0 handler:v145];

        [(UIAlertController *)self->_powerAlert addAction:v71];
        [(UIAlertController *)self->_powerAlert addAction:v75];

        objc_destroyWeak(&v146);
      }
      objc_destroyWeak(v70);
      objc_destroyWeak(&location);
      id v7 = v134;
LABEL_59:
      [(WirelessModemController *)self presentViewController:self->_powerAlert animated:1 completion:0];
      goto LABEL_60;
    }
  }
  [(WirelessModemController *)self updateInstructionsSection:v9];
  __int16 v17 = +[MISManager sharedManager];
  [v17 setState:v9];

  if ([v6 BOOLValue]) {
    uint64_t v18 = @"true";
  }
  else {
    uint64_t v18 = @"false";
  }
  __int16 v19 = WMSUIEventDictionary(@"toggle-ph-discovery", v18);
  WMSubmitUIEventMetric(v19);

LABEL_60:
}

void __58__WirelessModemController_setInternetTethering_specifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[MISManager sharedManager];
  [v2 setState:1023];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

void __58__WirelessModemController_setInternetTethering_specifier___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1401) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 1400) = 1;
  WiFiManagerClientSetPower();
  uint64_t v2 = [MEMORY[0x263F2B998] sharedInstance];
  [v2 setPowered:1];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

void __58__WirelessModemController_setInternetTethering_specifier___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1404) = 0;
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  applicationID = [v2 bundleIdentifier];

  CFPreferencesSetAppValue(@"ShowBTPowerPrompt", (CFPropertyListRef)*MEMORY[0x263EFFB38], applicationID);
  CFPreferencesSynchronize(applicationID, (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  int v3 = +[MISManager sharedManager];
  [v3 setState:1023];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

void __58__WirelessModemController_setInternetTethering_specifier___block_invoke_4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1400) = 1;
  uint64_t v2 = [MEMORY[0x263F2B998] sharedInstance];
  [v2 setPowered:1];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

void __58__WirelessModemController_setInternetTethering_specifier___block_invoke_5(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1404) = 0;
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  applicationID = [v2 bundleIdentifier];

  CFPreferencesSetAppValue(@"ShowBTPowerPrompt", (CFPropertyListRef)*MEMORY[0x263EFFB38], applicationID);
  CFPreferencesSynchronize(applicationID, (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  int v3 = +[MISManager sharedManager];
  [v3 setState:1023];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

void __58__WirelessModemController_setInternetTethering_specifier___block_invoke_6(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1400) = 1;
  uint64_t v2 = [MEMORY[0x263F2B998] sharedInstance];
  [v2 setPowered:1];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

void __58__WirelessModemController_setInternetTethering_specifier___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = +[MISManager sharedManager];
  [v2 setState:1023];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

void __58__WirelessModemController_setInternetTethering_specifier___block_invoke_8(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1401) = 1;
  WiFiManagerClientSetPower();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (void)updateInstructionsSection:(int)a3
{
  if (a3 == 1022)
  {
    [(WirelessModemController *)self removeSpecifier:self->_setupViewSpec];
  }
  else if (a3 == 1023)
  {
    uint64_t v3 = 1;
    if (self->_familyHotspotEnabled) {
      uint64_t v3 = 2;
    }
    [(WirelessModemController *)self insertSpecifier:self->_setupViewSpec atEndOfGroup:v3 + self->_showBandPreferenceUI animated:1];
  }
}

- (void)_updateTetheringText:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = 0;
  id v5 = +[MISManager sharedManager];
  [v5 getState:(char *)&v27 + 4 andReason:&v27];

  uint64_t v6 = *MEMORY[0x263F600A8];
  if (self->_personalHotspotModificationDisabled) {
    uint64_t v7 = MEMORY[0x263EFFA80];
  }
  else {
    uint64_t v7 = MEMORY[0x263EFFA88];
  }
  [(PSSpecifier *)self->_tetheringSwitchSpec setProperty:v7 forKey:*MEMORY[0x263F600A8]];
  if (!self->_waitingOnWifiPower && !self->_waitingOnBTPower) {
    [(PSSpecifier *)self->_tetheringSwitchSpec setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F60020]];
  }
  if (HIDWORD(v27) == 1023)
  {
    int v8 = [MEMORY[0x263F2B998] sharedInstance];
    char v9 = [v8 enabled];

    BOOL v10 = [(WirelessModemController *)self _wiFiPower];
    if ((v9 & 1) != 0 || v10)
    {
      id v24 = NSString;
      int v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v13 = [v11 localizedStringForKey:@"TETHERING_TEXT_DEFAULT" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
      BOOL v14 = WMSGetCurrentDeviceName();
      __int16 v17 = objc_msgSend(v24, "stringWithFormat:", v13, v14);
    }
    else
    {
      int v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int v12 = NSString;
      char v13 = [MEMORY[0x263F82670] currentDevice];
      BOOL v14 = [v13 model];
      char v15 = [v14 uppercaseString];
      char v16 = [v12 stringWithFormat:@"%@_%@", @"TETHERING_TEXT_USB", v15];
      __int16 v17 = [v11 localizedStringForKey:v16 value:&stru_26F3105F0 table:@"WirelessModemSettings"];
    }
  }
  else
  {
    uint64_t v18 = NSString;
    __int16 v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v20 = [v19 localizedStringForKey:@"TETHERING_TEXT_DEFAULT" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
    uint64_t v21 = WMSGetCurrentDeviceName();
    __int16 v17 = objc_msgSend(v18, "stringWithFormat:", v20, v21);

    if (HIDWORD(v27) != 1022
      || v27 == 4
      && (+[MISManager sharedManager],
          uint64_t v22 = objc_claimAutoreleasedReturnValue(),
          int v23 = [v22 didUserPreventData],
          v22,
          v23))
    {
      [(PSSpecifier *)self->_tetheringSwitchSpec setProperty:MEMORY[0x263EFFA80] forKey:v6];
    }
  }
  stateFooterSpec = self->_stateFooterSpec;
  if (v3)
  {
    [(PSSpecifier *)stateFooterSpec setProperty:v17 forKey:@"TextFooterInitialText"];
  }
  else
  {
    objc_super v26 = [(PSSpecifier *)stateFooterSpec propertyForKey:*MEMORY[0x263F60128]];
    [v26 setText:v17];

    [(WirelessModemController *)self reloadSpecifier:self->_stateFooterSpec animated:0];
  }
}

- (id)shareOption
{
  unsigned int ShareMyPersonalHotspotMode = WiFiManagerClientGetShareMyPersonalHotspotMode();
  if (ShareMyPersonalHotspotMode > 2) {
    return &unk_26F312DE8;
  }
  else {
    return (id)qword_26506AC28[ShareMyPersonalHotspotMode];
  }
}

- (void)setShareOption:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:&unk_26F312DE8])
  {
    uint64_t v4 = @"Never";
  }
  else if ([v3 isEqual:&unk_26F312E00])
  {
    uint64_t v4 = @"Automatic";
  }
  else
  {
    if (([v3 isEqual:&unk_26F312DD0] & 1) == 0)
    {
      id v5 = WMSLogComponent();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[WirelessModemController setShareOption:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
    uint64_t v4 = @"Ask for Approval";
  }
  WiFiManagerClientSetShareMyPersonalHotspotMode();
  char v13 = WMSLogComponent();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[WirelessModemController setShareOption:]((uint64_t)v4, v13, v14, v15, v16, v17, v18, v19);
  }
}

- (id)shareSpecifier
{
  v17[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"FAMILY_HOTSPOT_OFF" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
  v17[0] = v5;
  uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"FAMILY_HOTSPOT_ASK" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
  v17[1] = v7;
  uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v9 = [v8 localizedStringForKey:@"FAMILY_HOTSPOT_AUTOMATIC" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
  v17[2] = v9;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
  uint64_t v11 = (void *)[v3 initWithArray:v10];

  uint64_t v12 = (void *)MEMORY[0x263F5FC40];
  char v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v14 = [v13 localizedStringForKey:@"FAMILY_HOTSPOT" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
  uint64_t v15 = [v12 preferenceSpecifierNamed:v14 target:self set:sel_setShareOption_ get:sel_shareOption detail:objc_opt_class() cell:2 edit:0];

  [v15 setValues:&unk_26F312E30 titles:v11];

  return v15;
}

- (id)familyShareSpecifier
{
  id v3 = (void *)MEMORY[0x263F5FC40];
  uint64_t v4 = NSString;
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:@"FAMILY_SHARING_TITLE" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
  BOOL wifiIsWAPI = self->_wifiIsWAPI;
  uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v9 = v8;
  if (wifiIsWAPI) {
    uint64_t v10 = @"WIFI_CH";
  }
  else {
    uint64_t v10 = @"WIFI";
  }
  uint64_t v11 = [v8 localizedStringForKey:v10 value:&stru_26F3105F0 table:@"WirelessModemSettings"];
  uint64_t v12 = objc_msgSend(v4, "stringWithFormat:", v6, v11);
  char v13 = [v3 preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  return v13;
}

- (id)dataUsageString
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)WiFiManagerClientCopyProperty();
  if (v2)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v20 = v2;
    id obj = v2;
    uint64_t v24 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    id v3 = 0;
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    if (v24)
    {
      uint64_t v23 = *(void *)v36;
      uint64_t v22 = *MEMORY[0x263F55F70];
      uint64_t v30 = *MEMORY[0x263F55F80];
      uint64_t v29 = *MEMORY[0x263F55F60];
      uint64_t v28 = *MEMORY[0x263F55F40];
      uint64_t v27 = *MEMORY[0x263F55F58];
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v36 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = v6;
          uint64_t v7 = [*(id *)(*((void *)&v35 + 1) + 8 * v6) objectForKey:v22];
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v26 = v7;
          uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v39 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v32;
            do
            {
              uint64_t v11 = 0;
              uint64_t v12 = v3;
              char v13 = v4;
              do
              {
                if (*(void *)v32 != v10) {
                  objc_enumerationMutation(v26);
                }
                uint64_t v14 = *(void **)(*((void *)&v31 + 1) + 8 * v11);
                uint64_t v15 = [v14 objectForKey:v30];
                uint64_t v16 = [v14 objectForKey:v29];
                id v3 = [v14 objectForKey:v28];

                uint64_t v4 = [v14 objectForKey:v27];

                uint64_t v17 = [v16 unsignedIntegerValue];
                v5 += v17 + [v15 unsignedIntegerValue];

                ++v11;
                uint64_t v12 = v3;
                char v13 = v4;
              }
              while (v9 != v11);
              uint64_t v9 = [v26 countByEnumeratingWithState:&v31 objects:v39 count:16];
            }
            while (v9);
          }

          uint64_t v6 = v25 + 1;
        }
        while (v25 + 1 != v24);
        uint64_t v24 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v24);
    }

    if (v5)
    {
      uint64_t v18 = [MEMORY[0x263F086F0] stringFromByteCount:v5 countStyle:0];
    }
    else
    {
      uint64_t v18 = &stru_26F3105F0;
    }
    uint64_t v2 = v20;
  }
  else
  {
    uint64_t v18 = &stru_26F3105F0;
  }

  return v18;
}

- (id)usageSpecifier
{
  id v3 = (void *)WiFiManagerClientCopyProperty();
  if (v3
    && ([(WirelessModemController *)self dataUsageString],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 isEqualToString:&stru_26F3105F0],
        v4,
        (v5 & 1) == 0))
  {
    uint64_t v7 = (void *)MEMORY[0x263F5FC40];
    uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"HOTSPOT_USAGE" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
    uint64_t v6 = [v7 preferenceSpecifierNamed:v9 target:self set:0 get:sel_dataUsageString detail:objc_opt_class() cell:2 edit:0];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)placardSpec
{
  uint64_t v2 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26F3105F0 target:self set:0 get:0 detail:0 cell:4 edit:0];
  [v2 setObject:NSClassFromString(&cfstr_Wirelessmodems_0.isa) forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  [v2 setIdentifier:@"PHS_PLACARD"];

  return v2;
}

- (id)tetheringSwitchSpec
{
  id v3 = NSString;
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  char v5 = [v4 localizedStringForKey:@"ALLOW_OTHERS" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
  BOOL wifiIsWAPI = self->_wifiIsWAPI;
  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v8 = v7;
  if (wifiIsWAPI) {
    uint64_t v9 = @"WIFI_CH";
  }
  else {
    uint64_t v9 = @"WIFI";
  }
  uint64_t v10 = [v7 localizedStringForKey:v9 value:&stru_26F3105F0 table:@"WirelessModemSettings"];
  uint64_t v11 = objc_msgSend(v3, "stringWithFormat:", v5, v10);

  uint64_t v12 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v11 target:self set:sel_setInternetTethering_specifier_ get:sel_internetTethering_ detail:0 cell:6 edit:0];

  return v12;
}

- (id)passwordSpec
{
  id v3 = (void *)MEMORY[0x263F5FC40];
  uint64_t v4 = NSString;
  char v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:@"WIFI_PASSWORD" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
  BOOL wifiIsWAPI = self->_wifiIsWAPI;
  uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v9 = v8;
  if (wifiIsWAPI) {
    uint64_t v10 = @"WIFI_CH";
  }
  else {
    uint64_t v10 = @"WIFI";
  }
  uint64_t v11 = [v8 localizedStringForKey:v10 value:&stru_26F3105F0 table:@"WirelessModemSettings"];
  uint64_t v12 = objc_msgSend(v4, "stringWithFormat:", v6, v11);
  char v13 = [v3 preferenceSpecifierNamed:v12 target:self set:0 get:sel_wifiPassword_ detail:objc_opt_class() cell:2 edit:0];

  return v13;
}

- (id)setupViewSpec
{
  id v3 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  uint64_t v4 = [v3 properties];
  [v4 setValue:@"TetheringSetupView" forKey:*MEMORY[0x263F60118]];

  char v5 = [NSNumber numberWithBool:self->_wifiTetheringSupported];
  [v3 setProperty:v5 forKey:@"SupportsWifi"];

  return v3;
}

- (id)stateFooterSpec
{
  uint64_t v2 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  id v3 = [v2 properties];
  [v3 setValue:@"TetheringSwitchFooterView" forKey:*MEMORY[0x263F60118]];

  return v2;
}

- (id)bandPreferenceSpec
{
  id v3 = (void *)MEMORY[0x263F5FC40];
  uint64_t v4 = [(WirelessModemController *)self _bandPreferenceSpecLabel];
  char v5 = [v3 preferenceSpecifierNamed:v4 target:self set:sel_setBandPreference_specifier_ get:sel_bandPreference detail:0 cell:6 edit:0];

  return v5;
}

- (id)_bandPreferenceSpecLabel
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"MAXIMIZE_COMPATIBILITY" value:&stru_26F3105F0 table:@"WirelessModemSettings"];

  return v3;
}

- (id)_bandPreferenceSpecFooterLabel
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"MAXIMIZE_COMPATIBILITY_FOOTER" value:&stru_26F3105F0 table:@"WirelessModemSettings"];

  return v3;
}

- (id)specifiers
{
  v76[2] = *MEMORY[0x263EF8340];
  uint64_t v72 = (int)*MEMORY[0x263F5FDB8];
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v72);
  if (v3) {
    goto LABEL_52;
  }
  id v68 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v4 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  unint64_t v6 = v5 & 0xFFFFFFFFFFFFFFFBLL;
  uint64_t v7 = NSString;
  uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v9 = v8;
  if (v6 == 1)
  {
    uint64_t v10 = [v8 localizedStringForKey:@"INSTANT_HOTSPOT_IPAD" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
    BOOL wifiIsWAPI = self->_wifiIsWAPI;
    uint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    char v13 = v12;
    if (wifiIsWAPI) {
      uint64_t v14 = @"WIFI_CH";
    }
    else {
      uint64_t v14 = @"WIFI";
    }
  }
  else
  {
    uint64_t v10 = [v8 localizedStringForKey:@"INSTANT_HOTSPOT_IPHONE" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
    BOOL v15 = self->_wifiIsWAPI;
    uint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    char v13 = v12;
    if (v15) {
      uint64_t v14 = @"WIFI_CH";
    }
    else {
      uint64_t v14 = @"WIFI";
    }
  }
  uint64_t v16 = [v12 localizedStringForKey:v14 value:&stru_26F3105F0 table:@"WirelessModemSettings"];
  uint64_t v17 = objc_msgSend(v7, "stringWithFormat:", v10, v16);

  uint64_t v18 = v68;
  if (!self->_placardFeatureEnabled)
  {
    uint64_t v19 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v19 setProperty:v17 forKey:*MEMORY[0x263F600F8]];
    [v68 addObject:v19];
  }
  id v20 = (void *)WiFiManagerClientCopyFamilyHotspotPreferences();
  uint64_t v21 = v20;
  if (v20 && [v20 count])
  {
    self->_familyHotspotEnabled = 1;
    uint64_t v22 = WMSLogComponent();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      [(WirelessModemController *)(uint64_t)v21 specifiers];
    }
  }
  else
  {
    self->_familyHotspotEnabled = 0;
  }
  if (!self->_placardFeatureEnabled)
  {
    uint64_t v30 = 0;
    goto LABEL_23;
  }
  placardSpec = self->_placardSpec;
  if (placardSpec)
  {
    uint64_t v30 = placardSpec;
  }
  else
  {
    uint64_t v30 = [(WirelessModemController *)self placardSpec];
    objc_storeStrong((id *)&self->_placardSpec, v30);
    if (!v30) {
      goto LABEL_23;
    }
  }
  long long v31 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  v76[0] = v31;
  v76[1] = v30;
  long long v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v76 count:2];
  [v68 addObjectsFromArray:v32];

LABEL_23:
  tetheringGroupSpec = self->_tetheringGroupSpec;
  if (tetheringGroupSpec)
  {
    v71 = tetheringGroupSpec;
  }
  else
  {
    v71 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    objc_storeStrong((id *)&self->_tetheringGroupSpec, v71);
  }
  tetheringSwitchSpec = self->_tetheringSwitchSpec;
  if (tetheringSwitchSpec)
  {
    v70 = tetheringSwitchSpec;
  }
  else
  {
    v70 = [(WirelessModemController *)self tetheringSwitchSpec];
    objc_storeStrong((id *)&self->_tetheringSwitchSpec, v70);
  }
  passwordSpec = self->_passwordSpec;
  if (passwordSpec)
  {
    v69 = passwordSpec;
  }
  else
  {
    v69 = [(WirelessModemController *)self passwordSpec];
    objc_storeStrong((id *)&self->_passwordSpec, v69);
  }
  stateFooterSpec = self->_stateFooterSpec;
  if (stateFooterSpec)
  {
    long long v37 = stateFooterSpec;
  }
  else
  {
    long long v37 = [(WirelessModemController *)self stateFooterSpec];
    objc_storeStrong((id *)&self->_stateFooterSpec, v37);
  }
  v75[0] = v71;
  v75[1] = v70;
  v75[2] = v69;
  v75[3] = v37;
  v67 = v37;
  long long v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v75 count:4];
  [v68 addObjectsFromArray:v38];

  if (self->_familyHotspotEnabled)
  {
    uint64_t v39 = [MEMORY[0x263F5FC40] groupSpecifierWithName:0];
    v65 = NSString;
    v66 = (void *)v39;
    uint64_t v40 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v41 = [v40 localizedStringForKey:@"FAMILY_SHARING" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
    uint64_t v42 = v30;
    char v43 = v17;
    BOOL v44 = self->_wifiIsWAPI;
    v45 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v46 = v45;
    BOOL v47 = !v44;
    uint64_t v17 = v43;
    uint64_t v30 = v42;
    if (v47) {
      v48 = @"WIFI";
    }
    else {
      v48 = @"WIFI_CH";
    }
    v49 = [v45 localizedStringForKey:v48 value:&stru_26F3105F0 table:@"WirelessModemSettings"];
    int v50 = objc_msgSend(v65, "stringWithFormat:", v41, v49);
    [v66 setProperty:v50 forKey:*MEMORY[0x263F600F8]];

    uint64_t v18 = v68;
    v51 = [(WirelessModemController *)self familyShareSpecifier];
    v74[0] = v66;
    v74[1] = v51;
    v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:v74 count:2];
    [v68 addObjectsFromArray:v52];
  }
  if (self->_showBandPreferenceUI)
  {
    bandPreferenceSpec = self->_bandPreferenceSpec;
    if (bandPreferenceSpec)
    {
      v54 = bandPreferenceSpec;
LABEL_45:
      v55 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
      __int16 v56 = [(WirelessModemController *)self _bandPreferenceSpecFooterLabel];
      [v55 setProperty:v56 forKey:*MEMORY[0x263F600F8]];

      v73[0] = v55;
      v73[1] = v54;
      v57 = [MEMORY[0x263EFF8C0] arrayWithObjects:v73 count:2];
      [v18 addObjectsFromArray:v57];

      goto LABEL_46;
    }
    v54 = [(WirelessModemController *)self bandPreferenceSpec];
    objc_storeStrong((id *)&self->_bandPreferenceSpec, v54);
    if (v54) {
      goto LABEL_45;
    }
  }
  else
  {
    v54 = 0;
  }
LABEL_46:
  setupViewSpec = self->_setupViewSpec;
  if (setupViewSpec)
  {
    v59 = setupViewSpec;
  }
  else
  {
    v59 = [(WirelessModemController *)self setupViewSpec];
    objc_storeStrong((id *)&self->_setupViewSpec, v59);
  }
  uint64_t v60 = [(WirelessModemController *)self internetTethering:0];
  int v61 = [v60 BOOLValue];

  if (v61) {
    [v18 addObject:v59];
  }
  [(WirelessModemController *)self _updateTetheringText:1];
  v62 = *(Class *)((char *)&self->super.super.super.super.super.isa + v72);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v72) = (Class)v18;
  id v63 = v18;

  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v72);
LABEL_52:

  return v3;
}

- (void)showAlert:(id)a3
{
}

- (void)showPairingAlert:(id)a3
{
}

- (void)dismissPairingAlert:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bandPreferenceSpec, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong(&self->_btAlert, 0);
  objc_storeStrong(&self->_btSSPAlert, 0);
  objc_storeStrong((id *)&self->_placardSpec, 0);
  objc_storeStrong((id *)&self->_setupViewSpec, 0);
  objc_storeStrong((id *)&self->_stateFooterSpec, 0);
  objc_storeStrong((id *)&self->_passwordSpec, 0);
  objc_storeStrong((id *)&self->_currentDeviceSpecifier, 0);
  objc_storeStrong((id *)&self->_tetheringSwitchSpec, 0);
  objc_storeStrong((id *)&self->_tetheringGroupSpec, 0);

  objc_storeStrong((id *)&self->_powerAlert, 0);
}

- (void)init
{
}

- (void)setPersonalHotspotModificationDisableState:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_setMISDiscoveryStateEnabled:(char)a1 effectiveImmediately:(char)a2 forceBand:(os_log_t)log .cold.1(char a1, char a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  uint64_t v4 = "-[WirelessModemController _setMISDiscoveryStateEnabled:effectiveImmediately:forceBand:]";
  __int16 v5 = 1024;
  int v6 = a1 & 1;
  __int16 v7 = 1024;
  int v8 = a2 & 1;
  _os_log_error_impl(&dword_23F3F1000, log, OS_LOG_TYPE_ERROR, "%s: enabled: %d immediately: %d", (uint8_t *)&v3, 0x18u);
}

- (void)setBandPreference:(int)a1 specifier:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  int v3 = "-[WirelessModemController setBandPreference:specifier:]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&dword_23F3F1000, a2, OS_LOG_TYPE_ERROR, "%s: setting new preference: %d", (uint8_t *)&v2, 0x12u);
}

- (void)_btAuthenticationRequestHandler:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 1544);
  uint64_t v3 = *(void *)(a1 + 1552);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_23F3F1000, a2, OS_LOG_TYPE_ERROR, "Ignoring authentication request as there's something pending user interaction: _sspAlert(%@), _alert(%@)", (uint8_t *)&v4, 0x16u);
}

- (void)_btAuthenticationRequestHandler:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_btPinRequestHandler:(NSObject *)a3 .cold.1(const char *a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = NSStringFromSelector(a1);
  __int16 v6 = [a2 name];
  uint64_t v7 = [a2 object];
  uint64_t v8 = [v7 name];
  int v9 = 138412802;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  __int16 v13 = 2112;
  uint64_t v14 = v8;
  _os_log_error_impl(&dword_23F3F1000, a3, OS_LOG_TYPE_ERROR, "%@ received %@ for device %@", (uint8_t *)&v9, 0x20u);
}

- (void)setShareOption:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setShareOption:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)specifiers
{
}

@end