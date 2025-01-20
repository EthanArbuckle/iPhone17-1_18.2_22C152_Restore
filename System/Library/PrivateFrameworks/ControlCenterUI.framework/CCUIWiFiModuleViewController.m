@interface CCUIWiFiModuleViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_enabledForState:(int64_t)a3;
- (BOOL)_inoperativeForState:(int64_t)a3;
- (BOOL)_useAlternateSelectedBackgroundForState:(int64_t)a3;
- (BOOL)isObservingStateChanges;
- (BOOL)providesTemplateViewDelegateForExpandedConnectivityModule;
- (BOOL)shouldBeginTransitionToExpandedContentModule;
- (BOOL)showOtherNetwork;
- (CCUIConnectivityManager)connectivityManager;
- (CCUIControlTemplateView)templateViewForExpandedConnectivityModule;
- (CCUIRoundButton)buttonViewForCollapsedConnectivityModule;
- (CCUIRoundButton)glyphViewForExpandedConnectivityModule;
- (CCUIWiFiModuleViewController)initWithContentModuleContext:(id)a3;
- (NSString)accessibilityIdentifier;
- (WFControlCenterStateMonitor)stateMonitor;
- (WFNetworkListDelegate)listDelegate;
- (WFNetworkListRecord)currentNetwork;
- (float)currentNetworkScaledRSSI;
- (id)_debugDescriptionForState:(int64_t)a3;
- (id)_displayName;
- (id)_glyphImageForState:(int64_t)a3;
- (id)_hotspotImage;
- (id)_menuItemFromNetworkRecord:(id)a3;
- (id)_subtitleTextWithState:(int64_t)a3;
- (id)_wifiImageForSignalBars:(unint64_t)a3;
- (id)_wifiSecureImage;
- (id)_wifiSignalHighImage;
- (id)_wifiSignalLowImage;
- (id)_wifiSignalMediumImage;
- (id)certificateViewControllerWithContext:(id)a3;
- (id)credentialsViewControllerWithContext:(id)a3;
- (id)networkDetailsViewControllerWithContext:(id)a3;
- (id)networkErrorViewControllerWithContext:(id)a3;
- (id)trailingViewForMenuItem:(id)a3;
- (int64_t)_currentState;
- (int64_t)_stateWithOverridesApplied:(int64_t)a3;
- (int64_t)currentNetworkState;
- (int64_t)deviceCapability;
- (unint64_t)currentNetworkSignalBars;
- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 completion:(id)a5;
- (void)_serializeNetworkRecord:(id)a3;
- (void)_startScanning;
- (void)_stopScanning;
- (void)_toggleState;
- (void)_updateGlyphImagesWithState:(int64_t)a3;
- (void)_updateState;
- (void)_updateWiFiMenuItems;
- (void)_updateWithState:(int64_t)a3;
- (void)buttonTapped:(id)a3 forEvent:(id)a4;
- (void)didTransitionToExpandedContentMode:(BOOL)a3;
- (void)setButtonViewForCollapsedConnectivityModule:(id)a3;
- (void)setConnectivityManager:(id)a3;
- (void)setCurrentNetwork:(id)a3;
- (void)setCurrentNetworkScaledRSSI:(float)a3;
- (void)setCurrentNetworkSignalBars:(unint64_t)a3;
- (void)setCurrentNetworkState:(int64_t)a3;
- (void)setDeviceCapability:(int64_t)a3;
- (void)setGlyphViewForExpandedConnectivityModule:(id)a3;
- (void)setListDelegate:(id)a3;
- (void)setNetworks:(id)a3;
- (void)setObservingStateChanges:(BOOL)a3;
- (void)setScanning:(BOOL)a3;
- (void)setShowOtherNetwork:(BOOL)a3;
- (void)setStateMonitor:(id)a3;
- (void)setTemplateViewForExpandedConnectivityModule:(id)a3;
- (void)startObservingStateChanges;
- (void)startObservingStateChangesIfNecessary;
- (void)stopObservingStateChanges;
- (void)stopObservingStateChangesIfNecessary;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willTransitionToExpandedContentMode:(BOOL)a3;
@end

@implementation CCUIWiFiModuleViewController

- (CCUIWiFiModuleViewController)initWithContentModuleContext:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CCUIWiFiModuleViewController;
  v3 = [(CCUIMenuModuleViewController *)&v18 initWithContentModuleContext:a3];
  if (v3)
  {
    v4 = +[CCUIConnectivityManager sharedInstance];
    objc_storeWeak((id *)&v3->_connectivityManager, v4);
    v5 = [v4 wifiStateMonitor];
    objc_storeWeak((id *)&v3->_stateMonitor, v5);

    [(CCUIMenuModuleViewController *)v3 setMinimumMenuItems:6];
    [(CCUIMenuModuleViewController *)v3 setIndentation:2];
    [(CCUIMenuModuleViewController *)v3 setVisibleMenuItems:5.5];
    v6 = [(CCUIWiFiModuleViewController *)v3 _glyphImageForState:4];
    v7 = [MEMORY[0x1E4FB1618] systemBlueColor];
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F5AE48]) initWithGlyphImage:v6 highlightColor:v7 useLightStyle:1];
    [v8 setUseAutomaticSymbolColors:1];
    [v8 addTarget:v3 action:sel__glyphViewForExpandedConnectivityModuleTapped forControlEvents:64];
    glyphViewForExpandedConnectivityModule = v3->_glyphViewForExpandedConnectivityModule;
    v3->_glyphViewForExpandedConnectivityModule = (CCUIRoundButton *)v8;
    id v10 = v8;

    id v11 = objc_alloc_init(MEMORY[0x1E4F5AE28]);
    [v11 setCustomGlyphView:v10];
    templateViewForExpandedConnectivityModule = v3->_templateViewForExpandedConnectivityModule;
    v3->_templateViewForExpandedConnectivityModule = (CCUIControlTemplateView *)v11;
    id v13 = v11;

    v14 = [(CCUIWiFiModuleViewController *)v3 _displayName];
    [(CCUIMenuModuleViewController *)v3 setTitle:v14];
    [(CCUIControlTemplateView *)v3->_templateViewForExpandedConnectivityModule setTitle:v14];
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F5AE48]) initWithGlyphImage:v6 highlightColor:v7 useLightStyle:1];
    [v15 setUseIndependentAlpha:1];
    [v15 setDynamicLayoutEnabled:1];
    [v15 setUseAutomaticSymbolColors:1];
    [v15 addTarget:v3 action:sel__buttonViewForCollapsedConnectivityModuleTapped forControlEvents:64];
    buttonViewForCollapsedConnectivityModule = v3->_buttonViewForCollapsedConnectivityModule;
    v3->_buttonViewForCollapsedConnectivityModule = (CCUIRoundButton *)v15;
  }
  return v3;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CCUIWiFiModuleViewController;
  [(CCUIMenuModuleViewController *)&v5 viewDidLoad];
  v3 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [(CCUIButtonModuleViewController *)self setSelectedGlyphColor:v3];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__CCUIWiFiModuleViewController_viewDidLoad__block_invoke;
  v4[3] = &unk_1E6A898F8;
  v4[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v4];
}

void __43__CCUIWiFiModuleViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  int v2 = MGGetBoolAnswer();
  v3 = @"CONTROL_CENTER_STATUS_WIFI_SETTINGS";
  if (v2) {
    v3 = @"CONTROL_CENTER_STATUS_WLAN_SETTINGS";
  }
  v4 = v3;
  objc_super v5 = *(void **)(a1 + 32);
  v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:v4 value:&stru_1F2F34F20 table:@"ControlCenterUI+SystemModules"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__CCUIWiFiModuleViewController_viewDidLoad__block_invoke_2;
  v8[3] = &unk_1E6A89D80;
  objc_copyWeak(&v9, &location);
  [v5 setFooterButtonTitle:v7 handler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

uint64_t __43__CCUIWiFiModuleViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  int v2 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=WIFI"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = [WeakRetained contentModuleContext];
  [v4 openURL:v2 completionHandler:0];

  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIWiFiModuleViewController;
  [(CCUIMenuModuleViewController *)&v4 viewWillAppear:a3];
  [(CCUIWiFiModuleViewController *)self startObservingStateChangesIfNecessary];
  [(CCUIWiFiModuleViewController *)self _updateState];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CCUIWiFiModuleViewController;
  [(CCUIMenuModuleViewController *)&v5 viewWillDisappear:a3];
  [(CCUIWiFiModuleViewController *)self stopObservingStateChangesIfNecessary];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listDelegate);
  [WeakRetained networkListViewControllerDidFinish:self];
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CCUIWiFiModuleViewController;
  -[CCUIMenuModuleViewController willTransitionToExpandedContentMode:](&v5, sel_willTransitionToExpandedContentMode_);
  self->_isTransitioning = 1;
  if (v3)
  {
    [(CCUIWiFiModuleViewController *)self _startScanning];
    if (![(CCUIWiFiModuleViewController *)self _enabledForState:[(CCUIWiFiModuleViewController *)self _stateWithOverridesApplied:[(CCUIWiFiModuleViewController *)self _currentState]]])[(CCUIWiFiModuleViewController *)self _toggleState]; {
  }
    }
  [(CCUIWiFiModuleViewController *)self _updateState];
}

- (void)didTransitionToExpandedContentMode:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CCUIWiFiModuleViewController;
  -[CCUIMenuModuleViewController didTransitionToExpandedContentMode:](&v5, sel_didTransitionToExpandedContentMode_);
  self->_isTransitioning = 0;
  if (v3)
  {
    self->_isPresentingMenu = 1;
  }
  else
  {
    self->_isPresentingMenu = 0;
    [(CCUIWiFiModuleViewController *)self _stopScanning];
  }
  [(CCUIWiFiModuleViewController *)self _updateState];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)startObservingStateChangesIfNecessary
{
  if (!self->_observingStateChanges) {
    [(CCUIWiFiModuleViewController *)self startObservingStateChanges];
  }
}

- (void)stopObservingStateChangesIfNecessary
{
  if (self->_observingStateChanges) {
    [(CCUIWiFiModuleViewController *)self stopObservingStateChanges];
  }
}

- (void)startObservingStateChanges
{
  self->_observingStateChanges = 1;
  id v3 = [(CCUIWiFiModuleViewController *)self connectivityManager];
  [v3 addWiFiViewControllerObservingStateChanges:self];
}

- (void)stopObservingStateChanges
{
  self->_observingStateChanges = 0;
  id v3 = [(CCUIWiFiModuleViewController *)self connectivityManager];
  [v3 removeWiFiViewControllerObservingStateChanges:self];
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CCUIWiFiModuleViewController *)self _toggleState];
  v8.receiver = self;
  v8.super_class = (Class)CCUIWiFiModuleViewController;
  [(CCUIButtonModuleViewController *)&v8 buttonTapped:v7 forEvent:v6];
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  [(CCUIWiFiModuleViewController *)self _updateWiFiMenuItems];
  v4.receiver = self;
  v4.super_class = (Class)CCUIWiFiModuleViewController;
  return [(CCUIMenuModuleViewController *)&v4 shouldBeginTransitionToExpandedContentModule];
}

- (id)_displayName
{
  int v2 = MGGetBoolAnswer();
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v4 = v3;
  if (v2) {
    objc_super v5 = @"CONTROL_CENTER_STATUS_WLAN_NAME";
  }
  else {
    objc_super v5 = @"CONTROL_CENTER_STATUS_WIFI_NAME";
  }
  id v6 = [v3 localizedStringForKey:v5 value:&stru_1F2F34F20 table:@"ControlCenterUI+SystemModules"];

  return v6;
}

- (void)_startScanning
{
  id v3 = *MEMORY[0x1E4F5AD98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9[0]) = 0;
    _os_log_impl(&dword_1D7B17000, v3, OS_LOG_TYPE_DEFAULT, "[WiFi Module] Start scanning for networks", (uint8_t *)v9, 2u);
  }
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2050000000;
  objc_super v4 = (void *)getWFNetworkListControllerClass_softClass;
  uint64_t v13 = getWFNetworkListControllerClass_softClass;
  if (!getWFNetworkListControllerClass_softClass)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __getWFNetworkListControllerClass_block_invoke;
    v9[3] = &unk_1E6A89EB0;
    v9[4] = &v10;
    __getWFNetworkListControllerClass_block_invoke((uint64_t)v9);
    objc_super v4 = (void *)v11[3];
  }
  objc_super v5 = v4;
  _Block_object_dispose(&v10, 8);
  id v6 = (WFNetworkListController *)[[v5 alloc] initWithViewController:self viewProvider:self];
  wifiManager = self->_wifiManager;
  self->_wifiManager = v6;

  [(WFNetworkListController *)self->_wifiManager startScanning];
  [(CCUIWiFiModuleViewController *)self _updateWiFiMenuItems];
  objc_super v8 = [(CCUIWiFiModuleViewController *)self connectivityManager];
  [v8 addWiFiViewControllerObservingStateChanges:self];
}

- (void)_stopScanning
{
  id v3 = *MEMORY[0x1E4F5AD98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1D7B17000, v3, OS_LOG_TYPE_DEFAULT, "[WiFi Module] Stop scanning for networks", v7, 2u);
  }
  [(WFNetworkListController *)self->_wifiManager stopScanning];
  wifiManager = self->_wifiManager;
  self->_wifiManager = 0;

  networks = self->_networks;
  self->_networks = 0;

  id v6 = [(CCUIWiFiModuleViewController *)self connectivityManager];
  [v6 removeWiFiViewControllerObservingStateChanges:self];
}

- (void)_toggleState
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(CCUIWiFiModuleViewController *)self _stateWithOverridesApplied:[(CCUIWiFiModuleViewController *)self _currentState]];
  objc_super v4 = (void *)*MEMORY[0x1E4F5AD98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
  {
    objc_super v5 = v4;
    id v6 = [(CCUIWiFiModuleViewController *)self _debugDescriptionForState:v3];
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_impl(&dword_1D7B17000, v5, OS_LOG_TYPE_DEFAULT, "[WiFi Module] Toggle WiFi state from %{public}@", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateMonitor);
  objc_super v8 = [WeakRetained linkQuality];
  id v9 = [v8 ssid];

  objc_initWeak((id *)buf, self);
  id v10 = objc_loadWeakRetained((id *)&self->_stateMonitor);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__CCUIWiFiModuleViewController__toggleState__block_invoke;
  v12[3] = &unk_1E6A89E40;
  v12[4] = self;
  v14[1] = v3;
  id v11 = v9;
  id v13 = v11;
  objc_copyWeak(v14, (id *)buf);
  [v10 performAction:v12];

  objc_destroyWeak(v14);
  objc_destroyWeak((id *)buf);
}

void __44__CCUIWiFiModuleViewController__toggleState__block_invoke(uint64_t a1, void *a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CCUIWiFiModuleViewController__toggleState__block_invoke_2;
  block[3] = &unk_1E6A89E18;
  id v3 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  objc_super v4 = *(void **)(a1 + 56);
  v7[1] = a2;
  v7[2] = v4;
  id v6 = v3;
  objc_copyWeak(v7, (id *)(a1 + 48));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(v7);
}

void __44__CCUIWiFiModuleViewController__toggleState__block_invoke_2(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _stateWithOverridesApplied:*(void *)(a1 + 56)];
  id v3 = (void *)*MEMORY[0x1E4F5AD98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 64);
    id v6 = v3;
    id v7 = [v4 _debugDescriptionForState:v5];
    objc_super v8 = [*(id *)(a1 + 32) _debugDescriptionForState:v2];
    *(_DWORD *)buf = 138543618;
    v28 = v7;
    __int16 v29 = 2114;
    v30 = v8;
    _os_log_impl(&dword_1D7B17000, v6, OS_LOG_TYPE_DEFAULT, "[WiFi Module] Toggled WiFi state from %{public}@ to %{public}@", buf, 0x16u);
  }
  uint64_t v9 = *(void *)(a1 + 64);
  if (v9 == 1)
  {
    if (v2 != 3) {
      goto LABEL_22;
    }
    goto LABEL_16;
  }
  if (v9 == 2 && v2 == 3)
  {
LABEL_16:
    int v18 = MGGetBoolAnswer();
    v19 = @"CONTROL_CENTER_STATUS_MESSAGE_WIFI_BUSY";
    v20 = @"CONTROL_CENTER_STATUS_MESSAGE_WLAN_BUSY";
LABEL_17:
    if (v18) {
      v19 = v20;
    }
    v21 = (void *)MEMORY[0x1E4F28B50];
    v22 = v19;
    v16 = [v21 bundleForClass:objc_opt_class()];
    uint64_t v17 = [v16 localizedStringForKey:v22 value:&stru_1F2F34F20 table:@"ControlCenterUI+SystemModules"];

LABEL_20:
    if (v17)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      v24 = [WeakRetained contentModuleContext];

      v25 = [MEMORY[0x1E4F5AE60] statusUpdateWithMessage:v17 type:0];
      [v24 enqueueStatusUpdate:v25];
    }
    goto LABEL_22;
  }
  if (v9 == 3 && v2 == 4)
  {
    if (![*(id *)(a1 + 40) length]) {
      goto LABEL_22;
    }
    int v11 = MGGetBoolAnswer();
    uint64_t v12 = @"CONTROL_CENTER_STATUS_MESSAGE_WIFI_CONNECTED";
    if (v11) {
      uint64_t v12 = @"CONTROL_CENTER_STATUS_MESSAGE_WLAN_CONNECTED";
    }
    id v13 = (void *)MEMORY[0x1E4F28B50];
    v14 = v12;
    v15 = [v13 bundleForClass:objc_opt_class()];
    v16 = [v15 localizedStringForKey:v14 value:&stru_1F2F34F20 table:@"ControlCenterUI+SystemModules"];

    uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", v16, *(void *)(a1 + 40));
    goto LABEL_20;
  }
  if ((v9 == 3 || v9 == 4) && v2 == 2)
  {
    int v18 = MGGetBoolAnswer();
    v19 = @"CONTROL_CENTER_STATUS_MESSAGE_WIFI_DISCONNECTED";
    v20 = @"CONTROL_CENTER_STATUS_MESSAGE_WLAN_DISCONNECTED";
    goto LABEL_17;
  }
LABEL_22:
  id v26 = objc_loadWeakRetained((id *)(a1 + 48));
  [v26 _updateWithState:*(void *)(a1 + 56)];
}

- (void)_updateGlyphImagesWithState:(int64_t)a3
{
  id v6 = [(CCUIWiFiModuleViewController *)self _glyphImageForState:a3];
  [(CCUIMenuModuleViewController *)self setGlyphImage:v6];
  objc_super v4 = [(CCUIWiFiModuleViewController *)self buttonViewForCollapsedConnectivityModule];
  [v4 setGlyphImage:v6];
  uint64_t v5 = [(CCUIWiFiModuleViewController *)self glyphViewForExpandedConnectivityModule];
  [v5 setGlyphImage:v6];
}

- (void)_updateState
{
  int64_t v3 = [(CCUIWiFiModuleViewController *)self _currentState];

  [(CCUIWiFiModuleViewController *)self _updateWithState:v3];
}

- (void)_updateWithState:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int64_t v4 = [(CCUIWiFiModuleViewController *)self _stateWithOverridesApplied:a3];
  uint64_t v5 = [(CCUIWiFiModuleViewController *)self _subtitleTextWithState:v4];
  [(CCUIButtonModuleViewController *)self setValueText:v5];
  [(CCUIButtonModuleViewController *)self setSelectedValueText:v5];
  [(CCUIControlTemplateView *)self->_templateViewForExpandedConnectivityModule setSubtitle:v5];
  BOOL v6 = [(CCUIWiFiModuleViewController *)self _inoperativeForState:v4];
  [(CCUIControlTemplateView *)self->_templateViewForExpandedConnectivityModule setEnabled:!v6];
  [(CCUIRoundButton *)self->_buttonViewForCollapsedConnectivityModule setEnabled:!v6];
  BOOL v7 = [(CCUIWiFiModuleViewController *)self _enabledForState:v4];
  [(CCUIButtonModuleViewController *)self setSelected:v7 & ![(CCUIButtonModuleViewController *)self isExpanded]];
  [(CCUIRoundButton *)self->_glyphViewForExpandedConnectivityModule setSelected:v7];
  [(CCUIRoundButton *)self->_buttonViewForCollapsedConnectivityModule setSelected:v7];
  [(CCUIWiFiModuleViewController *)self _updateGlyphImagesWithState:v4];
  BOOL v8 = [(CCUIWiFiModuleViewController *)self _useAlternateSelectedBackgroundForState:v4];
  [(CCUIRoundButton *)self->_buttonViewForCollapsedConnectivityModule setUseAlternateBackground:v8];
  [(CCUIRoundButton *)self->_glyphViewForExpandedConnectivityModule setUseAlternateBackground:v8];
  uint64_t v9 = (void *)*MEMORY[0x1E4F5AD98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    int v11 = [(CCUIWiFiModuleViewController *)self _debugDescriptionForState:v4];
    int v12 = 138544131;
    id v13 = v11;
    __int16 v14 = 1024;
    BOOL v15 = v6;
    __int16 v16 = 1024;
    BOOL v17 = v7;
    __int16 v18 = 2113;
    v19 = v5;
    _os_log_impl(&dword_1D7B17000, v10, OS_LOG_TYPE_DEFAULT, "[WiFi Module] State updated to %{public}@ [ inoperative: %d, enabled: %d, subtitle: %{private}@ ]", (uint8_t *)&v12, 0x22u);
  }
}

- (int64_t)_currentState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateMonitor);
  int64_t v3 = [WeakRetained state];

  return v3;
}

- (int64_t)_stateWithOverridesApplied:(int64_t)a3
{
  if (CCSIsInternalInstall())
  {
    int64_t v4 = +[CCUIControlCenterDefaults standardDefaults];
    char v5 = [v4 shouldExcludeControlCenterFromStatusBarOverrides];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = [MEMORY[0x1E4FB1C88] getStatusBarOverrideData];
      if (*(unsigned char *)(v6 + 9))
      {
        if ((*(_DWORD *)(v6 + 2160) - 5) >= 2) {
          return 2;
        }
        else {
          return 4;
        }
      }
    }
  }
  return a3;
}

- (id)trailingViewForMenuItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      BOOL v7 = v6;
    }
    else {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    uint64_t v9 = objc_alloc_init(CCUIWifiMenuModuleItemTrailingView);
    if ([v8 isSecure])
    {
      id v10 = [(CCUIWiFiModuleViewController *)self _wifiSecureImage];
      int v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v10];
      [v11 setContentMode:1];
      [(CCUIWifiMenuModuleItemTrailingView *)v9 addSubview:v11];
    }
    if ([v8 isHotspot]) {
      [(CCUIWiFiModuleViewController *)self _hotspotImage];
    }
    else {
    int v12 = -[CCUIWiFiModuleViewController _wifiImageForSignalBars:](self, "_wifiImageForSignalBars:", [v8 signalBars]);
    }
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v12];
    [v13 setContentMode:1];
    [(CCUIWifiMenuModuleItemTrailingView *)v9 addSubview:v13];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)credentialsViewControllerWithContext:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=WIFI&path=Credentials"];
  uint64_t v5 = [(CCUIMenuModuleViewController *)self contentModuleContext];
  [v5 openURL:v4 completionHandler:0];

  return 0;
}

- (id)certificateViewControllerWithContext:(id)a3
{
  return 0;
}

- (id)networkDetailsViewControllerWithContext:(id)a3
{
  return 0;
}

- (id)networkErrorViewControllerWithContext:(id)a3
{
  id v4 = [a3 error];
  uint64_t v5 = [v4 localizedDescription];
  id v6 = [v4 localizedRecoverySuggestion];
  [(CCUIWiFiModuleViewController *)self _presentAlertWithTitle:v5 message:v6 completion:0];

  return 0;
}

- (void)setScanning:(BOOL)a3
{
  uint64_t v4 = a3 & [(CCUIButtonModuleViewController *)self isExpanded];

  [(CCUIMenuModuleViewController *)self setBusy:v4];
}

- (void)setCurrentNetwork:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_currentNetwork, a3);
    [(CCUIWiFiModuleViewController *)self _updateWiFiMenuItems];
  }
}

- (void)setNetworks:(id)a3
{
  id v4 = a3;
  id v5 = [v4 allObjects];
  id v6 = objc_msgSend(v5, "bs_filter:", &__block_literal_global_7);

  if (self->_currentNetwork)
  {
    uint64_t v7 = objc_msgSend(v6, "arrayByAddingObject:");

    id v6 = (void *)v7;
  }
  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x2020000000;
  id v8 = (void (*)(void))getWFScanRecordAlphaSortCompartorSymbolLoc_ptr;
  BOOL v17 = getWFScanRecordAlphaSortCompartorSymbolLoc_ptr;
  if (!getWFScanRecordAlphaSortCompartorSymbolLoc_ptr)
  {
    uint64_t v9 = (void *)WiFiKitUILibrary();
    v15[3] = (uint64_t)dlsym(v9, "WFScanRecordAlphaSortCompartor");
    getWFScanRecordAlphaSortCompartorSymbolLoc_ptr = (_UNKNOWN *)v15[3];
    id v8 = (void (*)(void))v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v8) {
    -[CCUIWiFiModuleViewController setNetworks:]();
  }
  id v10 = v8();
  int v11 = [v6 sortedArrayUsingComparator:v10];

  if ((BSEqualObjects() & 1) == 0)
  {
    int v12 = (NSArray *)[v11 copy];
    networks = self->_networks;
    self->_networks = v12;

    [(CCUIWiFiModuleViewController *)self _updateWiFiMenuItems];
  }
}

uint64_t __44__CCUIWiFiModuleViewController_setNetworks___block_invoke(uint64_t a1, void *a2)
{
  return [a2 prominentDisplay];
}

- (id)_wifiImageForSignalBars:(unint64_t)a3
{
  if (a3 > 1)
  {
    if (a3 == 2) {
      [(CCUIWiFiModuleViewController *)self _wifiSignalMediumImage];
    }
    else {
    int64_t v3 = [(CCUIWiFiModuleViewController *)self _wifiSignalHighImage];
    }
  }
  else
  {
    int64_t v3 = [(CCUIWiFiModuleViewController *)self _wifiSignalLowImage];
  }

  return v3;
}

- (id)_hotspotImage
{
  hotspotImage = self->_hotspotImage;
  if (!hotspotImage)
  {
    id v4 = (void *)MEMORY[0x1E4FB1818];
    id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v6 = [v4 imageNamed:@"WiFiHotspotGlyph" inBundle:v5];
    uint64_t v7 = [v6 _imageThatSuppressesAccessibilityHairlineThickening];
    id v8 = self->_hotspotImage;
    self->_hotspotImage = v7;

    hotspotImage = self->_hotspotImage;
  }

  return hotspotImage;
}

- (id)_wifiSecureImage
{
  wifiSecureImage = self->_wifiSecureImage;
  if (!wifiSecureImage)
  {
    id v4 = (void *)MEMORY[0x1E4FB1818];
    id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v6 = [v4 imageNamed:@"WiFiSecureGlyph" inBundle:v5];
    uint64_t v7 = [v6 _imageThatSuppressesAccessibilityHairlineThickening];
    id v8 = self->_wifiSecureImage;
    self->_wifiSecureImage = v7;

    wifiSecureImage = self->_wifiSecureImage;
  }

  return wifiSecureImage;
}

- (id)_wifiSignalLowImage
{
  wifiSignalLowImage = self->_wifiSignalLowImage;
  if (!wifiSignalLowImage)
  {
    id v4 = (void *)MEMORY[0x1E4FB1818];
    id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v6 = [v4 imageNamed:@"WiFiSignalLowGlyph" inBundle:v5];
    uint64_t v7 = [v6 _imageThatSuppressesAccessibilityHairlineThickening];
    id v8 = self->_wifiSignalLowImage;
    self->_wifiSignalLowImage = v7;

    wifiSignalLowImage = self->_wifiSignalLowImage;
  }

  return wifiSignalLowImage;
}

- (id)_wifiSignalMediumImage
{
  wifiSignalMediumImage = self->_wifiSignalMediumImage;
  if (!wifiSignalMediumImage)
  {
    id v4 = (void *)MEMORY[0x1E4FB1818];
    id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v6 = [v4 imageNamed:@"WiFiSignalMediumGlyph" inBundle:v5];
    uint64_t v7 = [v6 _imageThatSuppressesAccessibilityHairlineThickening];
    id v8 = self->_wifiSignalMediumImage;
    self->_wifiSignalMediumImage = v7;

    wifiSignalMediumImage = self->_wifiSignalMediumImage;
  }

  return wifiSignalMediumImage;
}

- (id)_wifiSignalHighImage
{
  wifiSignalHighImage = self->_wifiSignalHighImage;
  if (!wifiSignalHighImage)
  {
    id v4 = (void *)MEMORY[0x1E4FB1818];
    id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v6 = [v4 imageNamed:@"WiFiSignalHighGlyph" inBundle:v5];
    uint64_t v7 = [v6 _imageThatSuppressesAccessibilityHairlineThickening];
    id v8 = self->_wifiSignalHighImage;
    self->_wifiSignalHighImage = v7;

    wifiSignalHighImage = self->_wifiSignalHighImage;
  }

  return wifiSignalHighImage;
}

- (void)_updateWiFiMenuItems
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [MEMORY[0x1E4F1CA48] array];
  if (self->_currentNetwork)
  {
    id v4 = -[CCUIWiFiModuleViewController _menuItemFromNetworkRecord:](self, "_menuItemFromNetworkRecord:");
    [v3 addObject:v4];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_networks;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (([(WFNetworkListRecord *)self->_currentNetwork isEqual:v10] & 1) == 0)
        {
          int v11 = [(CCUIWiFiModuleViewController *)self _menuItemFromNetworkRecord:v10];
          [v3 addObject:v11];
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  if ([(CCUIWiFiModuleViewController *)self _appearState] == 2)
  {
    [(CCUIMenuModuleViewController *)self setMenuItems:v3];
  }
  else
  {
    int v12 = (void *)MEMORY[0x1E4FB1EB0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__CCUIWiFiModuleViewController__updateWiFiMenuItems__block_invoke;
    v13[3] = &unk_1E6A89968;
    v13[4] = self;
    id v14 = v3;
    [v12 performWithoutAnimation:v13];
  }
}

uint64_t __52__CCUIWiFiModuleViewController__updateWiFiMenuItems__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMenuItems:*(void *)(a1 + 40)];
}

- (id)_menuItemFromNetworkRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 ssid];
  uint64_t v6 = [(WFNetworkListRecord *)self->_currentNetwork ssid];
  uint64_t v7 = [v5 isEqualToString:v6];

  if (v7) {
    uint64_t v8 = @"selected.";
  }
  else {
    uint64_t v8 = @"notselected.";
  }
  uint64_t v9 = [(__CFString *)v8 stringByAppendingString:v5];
  objc_initWeak(location, self);
  uint64_t v10 = [CCUIWiFiMenuModuleItem alloc];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __59__CCUIWiFiModuleViewController__menuItemFromNetworkRecord___block_invoke;
  v21[3] = &unk_1E6A89E88;
  objc_copyWeak(&v23, location);
  id v11 = v4;
  id v22 = v11;
  int v12 = [(CCUIMenuModuleItem *)v10 initWithTitle:v5 identifier:v9 handler:v21];
  [(CCUIMenuModuleItem *)v12 setSelected:v7];
  -[CCUIWiFiMenuModuleItem setHotspot:](v12, "setHotspot:", [v11 iOSHotspot]);
  -[CCUIWiFiMenuModuleItem setSecure:](v12, "setSecure:", [v11 isSecure]);
  [v11 scaledRSSI];
  float v14 = v13;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  long long v15 = (uint64_t (*)(float))getWFSignalBarsFromScaledRSSISymbolLoc_ptr;
  __int16 v29 = getWFSignalBarsFromScaledRSSISymbolLoc_ptr;
  if (!getWFSignalBarsFromScaledRSSISymbolLoc_ptr)
  {
    location[1] = (id)MEMORY[0x1E4F143A8];
    location[2] = (id)3221225472;
    location[3] = __getWFSignalBarsFromScaledRSSISymbolLoc_block_invoke;
    location[4] = &unk_1E6A89EB0;
    v25 = &v26;
    long long v16 = (void *)WiFiKitUILibrary();
    long long v17 = dlsym(v16, "WFSignalBarsFromScaledRSSI");
    *(void *)(v25[1] + 24) = v17;
    getWFSignalBarsFromScaledRSSISymbolLoc_ptr = *(_UNKNOWN **)(v25[1] + 24);
    long long v15 = (uint64_t (*)(float))v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (v15)
  {
    [(CCUIWiFiMenuModuleItem *)v12 setSignalBars:v15(v14)];

    objc_destroyWeak(&v23);
    objc_destroyWeak(location);

    return v12;
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v20 = [NSString stringWithUTF8String:"NSUInteger _WFSignalBarsFromScaledRSSI(float)"];
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, @"CCUIWiFiModuleViewController.m", 43, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

uint64_t __59__CCUIWiFiModuleViewController__menuItemFromNetworkRecord___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _serializeNetworkRecord:*(void *)(a1 + 32)];
  int64_t v3 = [WeakRetained listDelegate];
  [v3 networkListViewController:WeakRetained didTapRecord:*(void *)(a1 + 32)];

  [WeakRetained scrollToTop:1];
  return 0;
}

- (void)_serializeNetworkRecord:(id)a3
{
  int64_t v3 = [a3 attributes];
  id v4 = [@"~/Library/Caches/com.apple.wifi" stringByExpandingTildeInPath];
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v6 = [v5 fileExistsAtPath:v4];

  if ((v6 & 1) != 0
    || ([MEMORY[0x1E4F28CB8] defaultManager],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = 0,
        int v8 = [v7 createDirectoryAtPath:v4 withIntermediateDirectories:0 attributes:0 error:&v10],
        v7,
        v8))
  {
    uint64_t v9 = [v4 stringByAppendingPathComponent:@"LastEnterpriseNetwork.plist"];
    [v3 writeToFile:v9 atomically:0];
  }
}

- (id)_subtitleTextWithState:(int64_t)a3
{
  switch(a3)
  {
    case 2:
    case 5:
      int v3 = MGGetBoolAnswer();
      id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      if (v3) {
        id v5 = @"CONTROL_CENTER_STATUS_WLAN_DISCONNECTED";
      }
      else {
        id v5 = @"CONTROL_CENTER_STATUS_WIFI_DISCONNECTED";
      }
      goto LABEL_13;
    case 3:
      int v7 = MGGetBoolAnswer();
      id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      if (v7) {
        id v5 = @"CONTROL_CENTER_STATUS_WLAN_BUSY";
      }
      else {
        id v5 = @"CONTROL_CENTER_STATUS_WIFI_BUSY";
      }
LABEL_13:
      char v6 = v4;
      goto LABEL_14;
    case 4:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_stateMonitor);
      uint64_t v9 = [WeakRetained linkQuality];
      uint64_t v10 = [v9 ssid];

      if ([v10 length]) {
        goto LABEL_16;
      }
      id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v11 = [v4 localizedStringForKey:@"CONTROL_CENTER_STATUS_WIFI_ON" value:&stru_1F2F34F20 table:@"ControlCenterUI+SystemModules"];

      uint64_t v10 = (void *)v11;
      goto LABEL_15;
    default:
      if ((unint64_t)a3 > 1)
      {
        uint64_t v10 = 0;
      }
      else
      {
        char v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v4 = v6;
        id v5 = @"CONTROL_CENTER_STATUS_WIFI_OFF";
LABEL_14:
        uint64_t v10 = [v6 localizedStringForKey:v5 value:&stru_1F2F34F20 table:@"ControlCenterUI+SystemModules"];
LABEL_15:
      }
LABEL_16:
      return v10;
  }
}

- (BOOL)_inoperativeForState:(int64_t)a3
{
  return (unint64_t)(a3 - 6) < 0xFFFFFFFFFFFFFFFBLL;
}

- (BOOL)_enabledForState:(int64_t)a3
{
  return (unint64_t)(a3 - 3) < 2;
}

- (id)_glyphImageForState:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    int v3 = 0;
  }
  else {
    int v3 = off_1E6A89F20[a3];
  }
  id v4 = [(CCUIButtonModuleViewController *)self contentMetrics];
  id v5 = [v4 symbolConfiguration];
  char v6 = [MEMORY[0x1E4FB1830] configurationWithScale:1];
  int v7 = [v5 configurationByApplyingConfiguration:v6];

  int v8 = [MEMORY[0x1E4FB1818] _systemImageNamed:v3 withConfiguration:v7];
  uint64_t v9 = [v8 imageFlippedForRightToLeftLayoutDirection];

  return v9;
}

- (id)_debugDescriptionForState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return @"unavailable";
  }
  else {
    return off_1E6A89F50[a3 - 1];
  }
}

- (BOOL)_useAlternateSelectedBackgroundForState:(int64_t)a3
{
  return a3 == 2;
}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 completion:(id)a5
{
  int v8 = (void *)MEMORY[0x1E4FB1418];
  id v9 = a5;
  id v13 = [v8 alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  uint64_t v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v11 = [v10 localizedStringForKey:@"CONTROL_CENTER_ALERT_OK" value:&stru_1F2F34F20 table:@"ControlCenterUI+SystemModules"];

  int v12 = [MEMORY[0x1E4FB1410] actionWithTitle:v11 style:0 handler:0];
  [v13 addAction:v12];

  [(CCUIWiFiModuleViewController *)self presentViewController:v13 animated:1 completion:v9];
}

- (NSString)accessibilityIdentifier
{
  return (NSString *)@"wifi-button";
}

- (BOOL)providesTemplateViewDelegateForExpandedConnectivityModule
{
  return 0;
}

- (BOOL)showOtherNetwork
{
  return self->_showOtherNetwork;
}

- (void)setShowOtherNetwork:(BOOL)a3
{
  self->_showOtherNetwork = a3;
}

- (float)currentNetworkScaledRSSI
{
  return self->_currentNetworkScaledRSSI;
}

- (void)setCurrentNetworkScaledRSSI:(float)a3
{
  self->_currentNetworkScaledRSSI = a3;
}

- (unint64_t)currentNetworkSignalBars
{
  return self->_currentNetworkSignalBars;
}

- (void)setCurrentNetworkSignalBars:(unint64_t)a3
{
  self->_currentNetworkSignalBars = a3;
}

- (WFNetworkListRecord)currentNetwork
{
  return (WFNetworkListRecord *)objc_getProperty(self, a2, 1336, 1);
}

- (int64_t)currentNetworkState
{
  return self->_currentNetworkState;
}

- (void)setCurrentNetworkState:(int64_t)a3
{
  self->_currentNetworkState = a3;
}

- (int64_t)deviceCapability
{
  return self->_deviceCapability;
}

- (void)setDeviceCapability:(int64_t)a3
{
  self->_deviceCapability = a3;
}

- (BOOL)isObservingStateChanges
{
  return self->_observingStateChanges;
}

- (void)setObservingStateChanges:(BOOL)a3
{
  self->_observingStateChanges = a3;
}

- (WFNetworkListDelegate)listDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listDelegate);

  return (WFNetworkListDelegate *)WeakRetained;
}

- (void)setListDelegate:(id)a3
{
}

- (WFControlCenterStateMonitor)stateMonitor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateMonitor);

  return (WFControlCenterStateMonitor *)WeakRetained;
}

- (void)setStateMonitor:(id)a3
{
}

- (CCUIConnectivityManager)connectivityManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectivityManager);

  return (CCUIConnectivityManager *)WeakRetained;
}

- (void)setConnectivityManager:(id)a3
{
}

- (CCUIRoundButton)buttonViewForCollapsedConnectivityModule
{
  return self->_buttonViewForCollapsedConnectivityModule;
}

- (void)setButtonViewForCollapsedConnectivityModule:(id)a3
{
}

- (CCUIControlTemplateView)templateViewForExpandedConnectivityModule
{
  return self->_templateViewForExpandedConnectivityModule;
}

- (void)setTemplateViewForExpandedConnectivityModule:(id)a3
{
}

- (CCUIRoundButton)glyphViewForExpandedConnectivityModule
{
  return self->_glyphViewForExpandedConnectivityModule;
}

- (void)setGlyphViewForExpandedConnectivityModule:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphViewForExpandedConnectivityModule, 0);
  objc_storeStrong((id *)&self->_templateViewForExpandedConnectivityModule, 0);
  objc_storeStrong((id *)&self->_buttonViewForCollapsedConnectivityModule, 0);
  objc_destroyWeak((id *)&self->_connectivityManager);
  objc_destroyWeak((id *)&self->_stateMonitor);
  objc_destroyWeak((id *)&self->_listDelegate);
  objc_storeStrong((id *)&self->_currentNetwork, 0);
  objc_storeStrong((id *)&self->_wifiSignalHighImage, 0);
  objc_storeStrong((id *)&self->_wifiSignalMediumImage, 0);
  objc_storeStrong((id *)&self->_wifiSignalLowImage, 0);
  objc_storeStrong((id *)&self->_wifiSecureImage, 0);
  objc_storeStrong((id *)&self->_hotspotImage, 0);
  objc_storeStrong((id *)&self->_networks, 0);

  objc_storeStrong((id *)&self->_wifiManager, 0);
}

- (void)setNetworks:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSComparator _WFScanRecordAlphaSortCompartor(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CCUIWiFiModuleViewController.m", 42, @"%s", dlerror());

  __break(1u);
}

@end