@interface CCUIBluetoothModuleViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_enabledForState:(int)a3;
- (BOOL)_inoperativeForState:(int)a3;
- (BOOL)_shouldHideBluetoothPeripheral:(id)a3;
- (BOOL)_useAlternateSelectedBackgroundForState:(int)a3;
- (BOOL)isObservingStateChanges;
- (BOOL)providesTemplateViewDelegateForExpandedConnectivityModule;
- (BOOL)shouldBeginTransitionToExpandedContentModule;
- (CCUIBluetoothModuleViewController)initWithContentModuleContext:(id)a3;
- (CCUIControlTemplateView)templateViewForExpandedConnectivityModule;
- (CCUIRoundButton)buttonViewForCollapsedConnectivityModule;
- (CCUIRoundButton)glyphViewForExpandedConnectivityModule;
- (NSString)accessibilityIdentifier;
- (id)_debugDescriptionForState:(int)a3;
- (id)_glyphImageForState:(int)a3;
- (id)_menuItemForBluetoothDevice:(id)a3;
- (id)_menuItemForBluetoothPeripheral:(id)a3;
- (id)_subtitleForConnected:(BOOL)a3;
- (id)_subtitleTextWithState:(int)a3;
- (int)_currentState;
- (int)_stateWithOverridesApplied:(int)a3;
- (void)_bluetoothAvailabilityChanged:(id)a3;
- (void)_bluetoothConnectionStatusDidChange:(id)a3;
- (void)_bluetoothDeviceConnectionStatusDidChange:(id)a3;
- (void)_bluetoothDeviceRemoved:(id)a3;
- (void)_bluetoothStateDidChange:(id)a3;
- (void)_startScanning;
- (void)_stopScanning;
- (void)_toggleState;
- (void)_updateBluetoothMenuItems;
- (void)_updateConnectedDeviceNames;
- (void)_updateGlyphImagesWithState:(int)a3;
- (void)_updateState;
- (void)_updateWithState:(int)a3;
- (void)buttonTapped:(id)a3 forEvent:(id)a4;
- (void)centralManager:(id)a3 didUpdatePeripheralConnectionState:(id)a4;
- (void)didTransitionToExpandedContentMode:(BOOL)a3;
- (void)setButtonViewForCollapsedConnectivityModule:(id)a3;
- (void)setGlyphViewForExpandedConnectivityModule:(id)a3;
- (void)setObservingStateChanges:(BOOL)a3;
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

@implementation CCUIBluetoothModuleViewController

- (CCUIBluetoothModuleViewController)initWithContentModuleContext:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)CCUIBluetoothModuleViewController;
  v3 = [(CCUIMenuModuleViewController *)&v22 initWithContentModuleContext:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F50B70] sharedInstance];
    bluetoothManager = v3->_bluetoothManager;
    v3->_bluetoothManager = (BluetoothManager *)v4;

    connectedDeviceNames = v3->_connectedDeviceNames;
    v3->_connectedDeviceNames = (NSArray *)MEMORY[0x1E4F1CBF0];

    [(CCUIMenuModuleViewController *)v3 setMinimumMenuItems:6];
    [(CCUIMenuModuleViewController *)v3 setIndentation:1];
    [(CCUIMenuModuleViewController *)v3 setUseTrailingInset:1];
    [(CCUIMenuModuleViewController *)v3 setVisibleMenuItems:5.5];
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    busyIdentifiers = v3->_busyIdentifiers;
    v3->_busyIdentifiers = v7;

    v9 = [(CCUIBluetoothModuleViewController *)v3 _glyphImageForState:3];
    v10 = [MEMORY[0x1E4FB1618] systemBlueColor];
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F5AE48]) initWithGlyphImage:v9 highlightColor:v10 useLightStyle:1];
    [v11 setUseAutomaticSymbolColors:1];
    [v11 addTarget:v3 action:sel__glyphViewForExpandedConnectivityModuleTapped forControlEvents:64];
    glyphViewForExpandedConnectivityModule = v3->_glyphViewForExpandedConnectivityModule;
    v3->_glyphViewForExpandedConnectivityModule = (CCUIRoundButton *)v11;
    id v13 = v11;

    id v14 = objc_alloc_init(MEMORY[0x1E4F5AE28]);
    [v14 setCustomGlyphView:v13];
    templateViewForExpandedConnectivityModule = v3->_templateViewForExpandedConnectivityModule;
    v3->_templateViewForExpandedConnectivityModule = (CCUIControlTemplateView *)v14;
    id v16 = v14;

    v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v18 = [v17 localizedStringForKey:@"CONTROL_CENTER_STATUS_BLUETOOTH_NAME" value:&stru_1F2F34F20 table:@"ControlCenterUI+SystemModules"];

    [(CCUIMenuModuleViewController *)v3 setTitle:v18];
    [(CCUIControlTemplateView *)v3->_templateViewForExpandedConnectivityModule setTitle:v18];
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F5AE48]) initWithGlyphImage:v9 highlightColor:v10 useLightStyle:1];
    [v19 setUseIndependentAlpha:1];
    [v19 setDynamicLayoutEnabled:1];
    [v19 setUseAutomaticSymbolColors:1];
    [v19 addTarget:v3 action:sel__buttonViewForCollapsedConnectivityModuleTapped forControlEvents:64];
    buttonViewForCollapsedConnectivityModule = v3->_buttonViewForCollapsedConnectivityModule;
    v3->_buttonViewForCollapsedConnectivityModule = (CCUIRoundButton *)v19;
  }
  return v3;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CCUIBluetoothModuleViewController;
  [(CCUIMenuModuleViewController *)&v5 viewDidLoad];
  v3 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [(CCUIButtonModuleViewController *)self setSelectedGlyphColor:v3];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__CCUIBluetoothModuleViewController_viewDidLoad__block_invoke;
  v4[3] = &unk_1E6A898F8;
  v4[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v4];
}

void __48__CCUIBluetoothModuleViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"CONTROL_CENTER_STATUS_BLUETOOTH_SETTINGS" value:&stru_1F2F34F20 table:@"ControlCenterUI+SystemModules"];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__CCUIBluetoothModuleViewController_viewDidLoad__block_invoke_2;
  v5[3] = &unk_1E6A89D80;
  objc_copyWeak(&v6, &location);
  [v2 setFooterButtonTitle:v4 handler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

uint64_t __48__CCUIBluetoothModuleViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=Bluetooth"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = [WeakRetained contentModuleContext];
  [v4 openURL:v2 completionHandler:0];

  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIBluetoothModuleViewController;
  [(CCUIMenuModuleViewController *)&v4 viewWillAppear:a3];
  [(CCUIBluetoothModuleViewController *)self startObservingStateChangesIfNecessary];
  [(CCUIBluetoothModuleViewController *)self _updateState];
  [(CCUIBluetoothModuleViewController *)self _updateConnectedDeviceNames];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIBluetoothModuleViewController;
  [(CCUIMenuModuleViewController *)&v4 viewWillDisappear:a3];
  [(CCUIBluetoothModuleViewController *)self stopObservingStateChangesIfNecessary];
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CCUIBluetoothModuleViewController;
  -[CCUIMenuModuleViewController willTransitionToExpandedContentMode:](&v5, sel_willTransitionToExpandedContentMode_);
  self->_isTransitioning = 1;
  if (v3)
  {
    [(CCUIBluetoothModuleViewController *)self _startScanning];
    if (![(CCUIBluetoothModuleViewController *)self _enabledForState:[(CCUIBluetoothModuleViewController *)self _stateWithOverridesApplied:[(CCUIBluetoothModuleViewController *)self _currentState]]])[(CCUIBluetoothModuleViewController *)self _toggleState]; {
  }
    }
  else
  {
    [(CCUIBluetoothModuleViewController *)self _stopScanning];
  }
  [(CCUIBluetoothModuleViewController *)self _updateState];
}

- (void)didTransitionToExpandedContentMode:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CCUIBluetoothModuleViewController;
  -[CCUIMenuModuleViewController didTransitionToExpandedContentMode:](&v5, sel_didTransitionToExpandedContentMode_);
  self->_isTransitioning = 0;
  self->_isPresentingMenu = a3;
  [(CCUIBluetoothModuleViewController *)self _updateState];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)centralManager:(id)a3 didUpdatePeripheralConnectionState:(id)a4
{
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  objc_super v5 = [v7 identifier];
  id v6 = [v5 UUIDString];

  if ([v7 state] == 1 || objc_msgSend(v7, "state") == 3)
  {
    if ([(NSMutableSet *)self->_busyIdentifiers containsObject:v6]) {
      goto LABEL_8;
    }
    [(NSMutableSet *)self->_busyIdentifiers addObject:v6];
  }
  else
  {
    if (![(NSMutableSet *)self->_busyIdentifiers containsObject:v6]) {
      goto LABEL_8;
    }
    [(NSMutableSet *)self->_busyIdentifiers removeObject:v6];
  }
  [(CCUIBluetoothModuleViewController *)self _updateBluetoothMenuItems];
LABEL_8:
}

- (void)startObservingStateChangesIfNecessary
{
  if (!self->_observingStateChanges) {
    [(CCUIBluetoothModuleViewController *)self startObservingStateChanges];
  }
}

- (void)stopObservingStateChangesIfNecessary
{
  if (self->_observingStateChanges) {
    [(CCUIBluetoothModuleViewController *)self stopObservingStateChanges];
  }
}

- (void)startObservingStateChanges
{
  self->_observingStateChanges = 1;
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__bluetoothStateDidChange_ name:*MEMORY[0x1E4F50B60] object:self->_bluetoothManager];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__bluetoothConnectionStatusDidChange_ name:*MEMORY[0x1E4F50AF0] object:self->_bluetoothManager];
}

- (void)stopObservingStateChanges
{
  self->_observingStateChanges = 0;
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F50B60] object:self->_bluetoothManager];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4F50AF0] object:self->_bluetoothManager];
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CCUIBluetoothModuleViewController *)self _toggleState];
  v8.receiver = self;
  v8.super_class = (Class)CCUIBluetoothModuleViewController;
  [(CCUIButtonModuleViewController *)&v8 buttonTapped:v7 forEvent:v6];
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  [(CCUIBluetoothModuleViewController *)self _updateBluetoothMenuItems];
  v4.receiver = self;
  v4.super_class = (Class)CCUIBluetoothModuleViewController;
  return [(CCUIMenuModuleViewController *)&v4 shouldBeginTransitionToExpandedContentModule];
}

- (void)_startScanning
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1BD18]);
  uint64_t v14 = *MEMORY[0x1E4F1BC50];
  v15[0] = MEMORY[0x1E4F1CC28];
  objc_super v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  objc_super v5 = (CBCentralManager *)[v3 initWithDelegate:self queue:0 options:v4];
  centralManager = self->_centralManager;
  self->_centralManager = v5;

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel__bluetoothDeviceConnectionStatusDidChange_ name:*MEMORY[0x1E4F50B08] object:0];

  objc_super v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 addObserver:self selector:sel__bluetoothDeviceConnectionStatusDidChange_ name:*MEMORY[0x1E4F50B00] object:0];

  v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 addObserver:self selector:sel__bluetoothDeviceConnectionStatusDidChange_ name:*MEMORY[0x1E4F50B18] object:0];

  v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 addObserver:self selector:sel__bluetoothDeviceConnectionStatusDidChange_ name:*MEMORY[0x1E4F50B10] object:0];

  v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 addObserver:self selector:sel__bluetoothAvailabilityChanged_ name:*MEMORY[0x1E4F50AE8] object:0];

  v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 addObserver:self selector:sel__bluetoothDeviceRemoved_ name:*MEMORY[0x1E4F50B20] object:0];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__CCUIBluetoothModuleViewController__startScanning__block_invoke;
  v13[3] = &unk_1E6A898F8;
  v13[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v13];
}

uint64_t __51__CCUIBluetoothModuleViewController__startScanning__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateBluetoothMenuItems];
}

- (void)_stopScanning
{
  [(CBCentralManager *)self->_centralManager setDelegate:0];
  centralManager = self->_centralManager;
  self->_centralManager = 0;

  objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4F50B08] object:0];

  objc_super v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x1E4F50B00] object:0];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x1E4F50B18] object:0];

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:self name:*MEMORY[0x1E4F50B10] object:0];

  objc_super v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 removeObserver:self name:*MEMORY[0x1E4F50AE8] object:0];

  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 removeObserver:self name:*MEMORY[0x1E4F50B20] object:0];
}

- (void)_toggleState
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CCUIBluetoothModuleViewController *)self _stateWithOverridesApplied:[(CCUIBluetoothModuleViewController *)self _currentState]];
  objc_super v4 = (void *)*MEMORY[0x1E4F5AD98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
  {
    objc_super v5 = v4;
    id v6 = [(CCUIBluetoothModuleViewController *)self _debugDescriptionForState:v3];
    *(_DWORD *)buf = 138543362;
    v12 = v6;
    _os_log_impl(&dword_1D7B17000, v5, OS_LOG_TYPE_DEFAULT, "[Bluetooth Module] Toggle Bluetooth state from %{public}@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  bluetoothManager = self->_bluetoothManager;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__CCUIBluetoothModuleViewController__toggleState__block_invoke;
  v8[3] = &unk_1E6A8A4A0;
  v8[4] = self;
  int v10 = v3;
  objc_copyWeak(&v9, (id *)buf);
  [(BluetoothManager *)bluetoothManager bluetoothStateActionWithCompletion:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __49__CCUIBluetoothModuleViewController__toggleState__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 32) _stateWithOverridesApplied:a2];
  objc_super v5 = (void *)*MEMORY[0x1E4F5AD98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(unsigned int *)(a1 + 48);
    objc_super v8 = v5;
    id v9 = [v6 _debugDescriptionForState:v7];
    int v10 = [*(id *)(a1 + 32) _debugDescriptionForState:v4];
    int v21 = 138543618;
    objc_super v22 = v9;
    __int16 v23 = 2114;
    v24 = v10;
    _os_log_impl(&dword_1D7B17000, v8, OS_LOG_TYPE_DEFAULT, "[Bluetooth Module] Toggled Bluetooth state from %{public}@ to %{public}@", (uint8_t *)&v21, 0x16u);
  }
  int v11 = *(_DWORD *)(a1 + 48);
  if ((v11 - 1) <= 1 && (v4 - 3) <= 1)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v14 = v13;
    v15 = @"CONTROL_CENTER_STATUS_MESSAGE_BLUETOOTH_CONNECTIONS_ENABLED";
    goto LABEL_12;
  }
  if ((v11 == 4 || v11 == 3) && v4 == 2)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v14 = v13;
    v15 = @"CONTROL_CENTER_STATUS_MESSAGE_BLUETOOTH_CONNECTIONS_DISABLED";
LABEL_12:
    id v16 = [v13 localizedStringForKey:v15 value:&stru_1F2F34F20 table:@"ControlCenterUI+SystemModules"];

    if (v16)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      v18 = [WeakRetained contentModuleContext];

      v19 = [MEMORY[0x1E4F5AE60] statusUpdateWithMessage:v16 type:0];
      [v18 enqueueStatusUpdate:v19];
    }
  }
  id v20 = objc_loadWeakRetained((id *)(a1 + 40));
  [v20 _updateWithState:a2];
}

- (void)_bluetoothStateDidChange:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F5AD98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl(&dword_1D7B17000, v4, OS_LOG_TYPE_DEFAULT, "[Bluetooth Module] Bluetooth state changed", v5, 2u);
  }
  [(CCUIBluetoothModuleViewController *)self _updateState];
}

- (void)_bluetoothConnectionStatusDidChange:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F5AD98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl(&dword_1D7B17000, v4, OS_LOG_TYPE_DEFAULT, "[Bluetooth Module] Bluetooth connection status changed", v5, 2u);
  }
  [(CCUIBluetoothModuleViewController *)self _updateState];
  [(CCUIBluetoothModuleViewController *)self _updateConnectedDeviceNames];
}

- (void)_updateGlyphImagesWithState:(int)a3
{
  id v6 = [(CCUIBluetoothModuleViewController *)self _glyphImageForState:*(void *)&a3];
  [(CCUIMenuModuleViewController *)self setGlyphImage:v6];
  uint64_t v4 = [(CCUIBluetoothModuleViewController *)self buttonViewForCollapsedConnectivityModule];
  [v4 setGlyphImage:v6];
  objc_super v5 = [(CCUIBluetoothModuleViewController *)self glyphViewForExpandedConnectivityModule];
  [v5 setGlyphImage:v6];
}

- (void)_updateState
{
  uint64_t v3 = [(CCUIBluetoothModuleViewController *)self _currentState];

  [(CCUIBluetoothModuleViewController *)self _updateWithState:v3];
}

- (void)_updateWithState:(int)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(CCUIBluetoothModuleViewController *)self _stateWithOverridesApplied:*(void *)&a3];
  objc_super v5 = [(CCUIBluetoothModuleViewController *)self _subtitleTextWithState:v4];
  [(CCUIButtonModuleViewController *)self setValueText:v5];
  [(CCUIButtonModuleViewController *)self setSelectedValueText:v5];
  [(CCUIControlTemplateView *)self->_templateViewForExpandedConnectivityModule setSubtitle:v5];
  BOOL v6 = [(CCUIBluetoothModuleViewController *)self _inoperativeForState:v4];
  [(CCUIControlTemplateView *)self->_templateViewForExpandedConnectivityModule setEnabled:!v6];
  [(CCUIRoundButton *)self->_buttonViewForCollapsedConnectivityModule setEnabled:!v6];
  BOOL v7 = [(CCUIBluetoothModuleViewController *)self _enabledForState:v4];
  [(CCUIButtonModuleViewController *)self setSelected:v7 & ![(CCUIButtonModuleViewController *)self isExpanded]];
  [(CCUIRoundButton *)self->_glyphViewForExpandedConnectivityModule setSelected:v7];
  [(CCUIRoundButton *)self->_buttonViewForCollapsedConnectivityModule setSelected:v7];
  [(CCUIBluetoothModuleViewController *)self _updateGlyphImagesWithState:v4];
  BOOL v8 = [(CCUIBluetoothModuleViewController *)self _useAlternateSelectedBackgroundForState:v4];
  [(CCUIRoundButton *)self->_buttonViewForCollapsedConnectivityModule setUseAlternateBackground:v8];
  [(CCUIRoundButton *)self->_glyphViewForExpandedConnectivityModule setUseAlternateBackground:v8];
  id v9 = (void *)*MEMORY[0x1E4F5AD98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = v9;
    int v11 = [(CCUIBluetoothModuleViewController *)self _debugDescriptionForState:v4];
    int v12 = 138544131;
    uint64_t v13 = v11;
    __int16 v14 = 1024;
    BOOL v15 = v6;
    __int16 v16 = 1024;
    BOOL v17 = v7;
    __int16 v18 = 2113;
    v19 = v5;
    _os_log_impl(&dword_1D7B17000, v10, OS_LOG_TYPE_DEFAULT, "[Bluetooth Module] Bluetooth state updated to %{public}@ [ inoperative: %d enabled: %d subtitle: %{private}@ ]", (uint8_t *)&v12, 0x22u);
  }
}

- (int)_currentState
{
  return [(BluetoothManager *)self->_bluetoothManager bluetoothState];
}

- (int)_stateWithOverridesApplied:(int)a3
{
  if (CCSIsInternalInstall())
  {
    uint64_t v4 = +[CCUIControlCenterDefaults standardDefaults];
    char v5 = [v4 shouldExcludeControlCenterFromStatusBarOverrides];

    if ((v5 & 1) == 0)
    {
      BOOL v6 = (unsigned char *)[MEMORY[0x1E4FB1C88] getStatusBarOverrideData];
      if (v6[16])
      {
        if (v6[80])
        {
          if (v6[2593]) {
            return 3;
          }
          else {
            return 2;
          }
        }
        else
        {
          return 1;
        }
      }
    }
  }
  return a3;
}

- (id)_subtitleTextWithState:(int)a3
{
  if (a3 == 2)
  {
    BOOL v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    BOOL v7 = v6;
    BOOL v8 = @"CONTROL_CENTER_STATUS_BLUETOOTH_DISCONNECTED";
    goto LABEL_11;
  }
  if (a3 == 4)
  {
    BOOL v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    BOOL v7 = v6;
    BOOL v8 = @"CONTROL_CENTER_STATUS_BLUETOOTH_BUSY";
    goto LABEL_11;
  }
  if (a3 != 3)
  {
    if (a3 > 1)
    {
      char v5 = 0;
      goto LABEL_13;
    }
    BOOL v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    BOOL v7 = v6;
    BOOL v8 = @"CONTROL_CENTER_STATUS_BLUETOOTH_OFF";
LABEL_11:
    char v5 = [v6 localizedStringForKey:v8 value:&stru_1F2F34F20 table:@"ControlCenterUI+SystemModules"];
LABEL_12:

    goto LABEL_13;
  }
  NSUInteger v4 = [(NSArray *)self->_connectedDeviceNames count];
  char v5 = (void *)v4;
  if (v4)
  {
    if (v4 == 1)
    {
      char v5 = [(NSArray *)self->_connectedDeviceNames firstObject];
    }
    else
    {
      int v10 = NSString;
      int v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      int v12 = [v11 localizedStringForKey:@"CONTROL_CENTER_STATUS_BLUETOOTH_DEVICES" value:&stru_1F2F34F20 table:@"ControlCenterUI+SystemModules"];
      char v5 = objc_msgSend(v10, "localizedStringWithFormat:", v12, v5);
    }
  }
  if (![v5 length])
  {
    BOOL v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v13 = [v7 localizedStringForKey:@"CONTROL_CENTER_STATUS_BLUETOOTH_ON" value:&stru_1F2F34F20 table:@"ControlCenterUI+SystemModules"];

    char v5 = (void *)v13;
    goto LABEL_12;
  }
LABEL_13:

  return v5;
}

- (void)_updateConnectedDeviceNames
{
  uint64_t v3 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__CCUIBluetoothModuleViewController__updateConnectedDeviceNames__block_invoke;
  block[3] = &unk_1E6A898F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __64__CCUIBluetoothModuleViewController__updateConnectedDeviceNames__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 1264) connectedDeviceNamesThatMayBeDenylisted];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__CCUIBluetoothModuleViewController__updateConnectedDeviceNames__block_invoke_2;
  v4[3] = &unk_1E6A89968;
  v4[4] = *(void *)(a1 + 32);
  id v5 = v2;
  id v3 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

uint64_t __64__CCUIBluetoothModuleViewController__updateConnectedDeviceNames__block_invoke_2(uint64_t a1)
{
  uint64_t result = BSEqualObjects();
  if ((result & 1) == 0)
  {
    uint64_t v3 = [*(id *)(a1 + 40) copy];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 1272);
    *(void *)(v4 + 1272) = v3;

    BOOL v6 = *(void **)(a1 + 32);
    return [v6 _updateState];
  }
  return result;
}

- (BOOL)_inoperativeForState:(int)a3
{
  return (a3 - 5) < 0xFFFFFFFC;
}

- (BOOL)_enabledForState:(int)a3
{
  return a3 == 3;
}

- (id)_glyphImageForState:(int)a3
{
  if (a3 > 4) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = off_1E6A8A4C0[a3];
  }
  uint64_t v4 = [(CCUIButtonModuleViewController *)self contentMetrics];
  id v5 = [v4 symbolConfiguration];
  BOOL v6 = [MEMORY[0x1E4FB1830] configurationWithScale:1];
  BOOL v7 = [v5 configurationByApplyingConfiguration:v6];

  BOOL v8 = [MEMORY[0x1E4FB1818] _systemImageNamed:v3 withConfiguration:v7];

  return v8;
}

- (id)_debugDescriptionForState:(int)a3
{
  if ((a3 - 1) > 3) {
    return @"unavailable";
  }
  else {
    return off_1E6A8A4E8[a3 - 1];
  }
}

- (BOOL)_useAlternateSelectedBackgroundForState:(int)a3
{
  return ((a3 - 2) & 0xFFFFFFFD) == 0;
}

- (void)_updateBluetoothMenuItems
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v5 = [MEMORY[0x1E4F50B70] sharedInstance];
  BOOL v6 = [v5 pairedDevices];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        int v12 = [(CCUIBluetoothModuleViewController *)self _menuItemForBluetoothDevice:v11];
        [v3 addObject:v12];
        uint64_t v13 = [v11 address];
        [v4 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v8);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  __int16 v14 = [(CBCentralManager *)self->_centralManager sharedPairingAgent];
  BOOL v15 = [v14 retrievePairedPeers];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v40 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        if (![(CCUIBluetoothModuleViewController *)self _shouldHideBluetoothPeripheral:v20])
        {
          int v21 = [(CCUIBluetoothModuleViewController *)self _menuItemForBluetoothPeripheral:v20];
          [v3 addObject:v21];
        }
        objc_super v22 = [v20 identifier];
        __int16 v23 = [v22 UUIDString];
        [v4 addObject:v23];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v17);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = [(CBCentralManager *)self->_centralManager retrieveConnectedPeripheralsWithServices:MEMORY[0x1E4F1CBF0] allowAll:1];
  uint64_t v24 = [obj countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v36;
    do
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v36 != v26) {
          objc_enumerationMutation(obj);
        }
        v28 = *(void **)(*((void *)&v35 + 1) + 8 * k);
        v29 = [v28 identifier];
        v30 = [v29 UUIDString];
        if ([v4 containsObject:v30])
        {
        }
        else
        {
          BOOL v31 = [(CCUIBluetoothModuleViewController *)self _shouldHideBluetoothPeripheral:v28];

          if (v31) {
            goto LABEL_27;
          }
          v29 = [(CCUIBluetoothModuleViewController *)self _menuItemForBluetoothPeripheral:v28];
          [v3 addObject:v29];
        }

LABEL_27:
        v32 = [v28 identifier];
        v33 = [v32 UUIDString];
        [v4 addObject:v33];
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v25);
  }

  [v3 sortUsingComparator:&__block_literal_global_12];
  [(CCUIMenuModuleViewController *)self setMenuItems:v3];
}

uint64_t __62__CCUIBluetoothModuleViewController__updateBluetoothMenuItems__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 title];
  BOOL v6 = [v4 title];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

- (id)_menuItemForBluetoothDevice:(id)a3
{
  id v4 = a3;
  id v5 = [v4 address];
  objc_initWeak(&location, self);
  id v6 = objc_alloc(MEMORY[0x1E4F5AE38]);
  uint64_t v7 = [v4 name];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  BOOL v15 = __65__CCUIBluetoothModuleViewController__menuItemForBluetoothDevice___block_invoke;
  uint64_t v16 = &unk_1E6A89DC8;
  objc_copyWeak(&v19, &location);
  id v8 = v4;
  id v17 = v8;
  id v9 = v5;
  id v18 = v9;
  int v10 = (void *)[v6 initWithTitle:v7 identifier:v9 handler:&v13];

  objc_msgSend(v10, "setBusy:", -[NSMutableSet containsObject:](self->_busyIdentifiers, "containsObject:", v9, v13, v14, v15, v16));
  int v11 = -[CCUIBluetoothModuleViewController _subtitleForConnected:](self, "_subtitleForConnected:", [v8 connected]);
  [v10 setSubtitle:v11];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v10;
}

uint64_t __65__CCUIBluetoothModuleViewController__menuItemForBluetoothDevice___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    int v3 = [*(id *)(a1 + 32) connected];
    [WeakRetained[161] addObject:*(void *)(a1 + 40)];
    [WeakRetained _updateBluetoothMenuItems];
    id v4 = *(void **)(a1 + 32);
    if (v3) {
      [v4 disconnect];
    }
    else {
      [v4 connect];
    }
  }

  return 0;
}

- (id)_menuItemForBluetoothPeripheral:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [v5 UUIDString];

  objc_initWeak(&location, self->_centralManager);
  if ([v4 hasTag:@"DA_ASK_RETAIN_DEVICE"]) {
    [v4 customProperty:@"ASK_DISPLAY_NAME"];
  }
  else {
  uint64_t v7 = [v4 name];
  }
  id v8 = objc_alloc(MEMORY[0x1E4F5AE38]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__CCUIBluetoothModuleViewController__menuItemForBluetoothPeripheral___block_invoke;
  v13[3] = &unk_1E6A89DF0;
  id v9 = v4;
  id v14 = v9;
  objc_copyWeak(&v15, &location);
  int v10 = (void *)[v8 initWithTitle:v7 identifier:v6 handler:v13];
  objc_msgSend(v10, "setBusy:", -[NSMutableSet containsObject:](self->_busyIdentifiers, "containsObject:", v6));
  int v11 = -[CCUIBluetoothModuleViewController _subtitleForConnected:](self, "_subtitleForConnected:", [v9 isConnectedToSystem]);
  [v10 setSubtitle:v11];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v10;
}

uint64_t __69__CCUIBluetoothModuleViewController__menuItemForBluetoothPeripheral___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isConnectedToSystem];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v2) {
    [WeakRetained cancelPeripheralConnection:v5];
  }
  else {
    [WeakRetained connectPeripheral:v5 options:0];
  }

  return 0;
}

- (BOOL)_shouldHideBluetoothPeripheral:(id)a3
{
  id v4 = a3;
  if ([v4 connectedTransport] == 2)
  {
    uint64_t v5 = [(CBCentralManager *)self->_centralManager sharedPairingAgent];
    if ([v5 isPeerCloudPaired:v4]) {
      LOBYTE(v6) = 1;
    }
    else {
      int v6 = [v4 visibleInSettings] ^ 1;
    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (id)_subtitleForConnected:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v5 = v4;
  if (v3) {
    int v6 = @"CONTROL_CENTER_STATUS_BLUETOOTH_CONNECTED";
  }
  else {
    int v6 = @"CONTROL_CENTER_STATUS_BLUETOOTH_DISCONNECTED";
  }
  uint64_t v7 = [v4 localizedStringForKey:v6 value:&stru_1F2F34F20 table:@"ControlCenterUI+SystemModules"];

  return v7;
}

- (void)_bluetoothDeviceConnectionStatusDidChange:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v5 = [v4 object];

  int v6 = (void *)*MEMORY[0x1E4F5AD98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    id v8 = [v5 name];
    int v11 = 138543362;
    int v12 = v8;
    _os_log_impl(&dword_1D7B17000, v7, OS_LOG_TYPE_DEFAULT, "Bluetooth connection status changed: %{public}@", (uint8_t *)&v11, 0xCu);
  }
  busyIdentifiers = self->_busyIdentifiers;
  int v10 = [v5 address];
  [(NSMutableSet *)busyIdentifiers removeObject:v10];

  [(CCUIBluetoothModuleViewController *)self _updateBluetoothMenuItems];
}

- (void)_bluetoothAvailabilityChanged:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v5 = [v4 object];

  int v6 = (void *)*MEMORY[0x1E4F5AD98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    v8[0] = 67109120;
    v8[1] = [v5 BOOLValue];
    _os_log_impl(&dword_1D7B17000, v7, OS_LOG_TYPE_DEFAULT, "Bluetooth device availability changed: %{BOOL}d", (uint8_t *)v8, 8u);
  }
  [(CCUIBluetoothModuleViewController *)self _updateBluetoothMenuItems];
}

- (void)_bluetoothDeviceRemoved:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v5 = [v4 object];

  int v6 = (void *)*MEMORY[0x1E4F5AD98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    id v8 = [v5 name];
    int v9 = 138543362;
    int v10 = v8;
    _os_log_impl(&dword_1D7B17000, v7, OS_LOG_TYPE_DEFAULT, "Bluetooth device removed: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  [(CCUIBluetoothModuleViewController *)self _updateBluetoothMenuItems];
}

- (NSString)accessibilityIdentifier
{
  return (NSString *)@"bluetooth-button";
}

- (BOOL)providesTemplateViewDelegateForExpandedConnectivityModule
{
  return 0;
}

- (BOOL)isObservingStateChanges
{
  return self->_observingStateChanges;
}

- (void)setObservingStateChanges:(BOOL)a3
{
  self->_observingStateChanges = a3;
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
  objc_storeStrong((id *)&self->_busyIdentifiers, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_connectedDeviceNames, 0);

  objc_storeStrong((id *)&self->_bluetoothManager, 0);
}

@end