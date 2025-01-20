@interface CCUIBluetoothMenuModuleViewController
- (BOOL)_shouldHideBluetoothPeripheral:(id)a3;
- (CCUIBluetoothMenuModuleViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_menuItemForBluetoothDevice:(id)a3;
- (id)_menuItemForBluetoothPeripheral:(id)a3;
- (id)_subtitleForConnected:(BOOL)a3;
- (void)_bluetoothAvailabilityChanged:(id)a3;
- (void)_bluetoothDeviceConnectionStatusDidChange:(id)a3;
- (void)_bluetoothDeviceRemoved:(id)a3;
- (void)_startScanning;
- (void)_stopScanning;
- (void)_updateBluetoothMenuItems;
- (void)centralManager:(id)a3 didUpdatePeripheralConnectionState:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CCUIBluetoothMenuModuleViewController

- (CCUIBluetoothMenuModuleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)CCUIBluetoothMenuModuleViewController;
  v4 = [(CCUIAlwaysExpandedMenuModuleViewController *)&v14 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    [(CCUIButtonModuleViewController *)v4 setExpanded:1];
    [(CCUIMenuModuleViewController *)v5 setMinimumMenuItems:6];
    [(CCUIMenuModuleViewController *)v5 setShouldProvideOwnPlatter:1];
    [(CCUIMenuModuleViewController *)v5 setIndentation:1];
    [(CCUIMenuModuleViewController *)v5 setUseTrailingInset:1];
    [(CCUIMenuModuleViewController *)v5 setVisibleMenuItems:5.5];
    v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"CONTROL_CENTER_STATUS_BLUETOOTH_NAME" value:&stru_1F2F34F20 table:@"ControlCenterUI+SystemModules"];
    [(CCUIMenuModuleViewController *)v5 setTitle:v7];

    v8 = [MEMORY[0x1E4FB1830] configurationWithPointSize:6 weight:2 scale:22.0];
    v9 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"bluetooth" withConfiguration:v8];
    v10 = [v9 imageFlippedForRightToLeftLayoutDirection];

    [(CCUIMenuModuleViewController *)v5 setGlyphImage:v10];
    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    busyIdentifiers = v5->_busyIdentifiers;
    v5->_busyIdentifiers = v11;
  }
  return v5;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIBluetoothMenuModuleViewController;
  [(CCUIMenuModuleViewController *)&v4 viewDidLoad];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__CCUIBluetoothMenuModuleViewController_viewDidLoad__block_invoke;
  v3[3] = &unk_1E6A898F8;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
}

void __52__CCUIBluetoothMenuModuleViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 localizedStringForKey:@"CONTROL_CENTER_STATUS_BLUETOOTH_SETTINGS" value:&stru_1F2F34F20 table:@"ControlCenterUI+SystemModules"];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__CCUIBluetoothMenuModuleViewController_viewDidLoad__block_invoke_2;
  v5[3] = &unk_1E6A89D80;
  objc_copyWeak(&v6, &location);
  [v2 setFooterButtonTitle:v4 handler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

uint64_t __52__CCUIBluetoothMenuModuleViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=Bluetooth"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v4 = [WeakRetained contentModuleContext];
  [v4 openURL:v2 completionHandler:0];

  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIBluetoothMenuModuleViewController;
  [(CCUIAlwaysExpandedMenuModuleViewController *)&v4 viewWillAppear:a3];
  [(CCUIBluetoothMenuModuleViewController *)self _startScanning];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIBluetoothMenuModuleViewController;
  [(CCUIAlwaysExpandedMenuModuleViewController *)&v4 viewWillDisappear:a3];
  [(CCUIBluetoothMenuModuleViewController *)self _stopScanning];
}

- (void)_startScanning
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1BD18]);
  uint64_t v14 = *MEMORY[0x1E4F1BC50];
  v15[0] = MEMORY[0x1E4F1CC28];
  objc_super v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v5 = (CBCentralManager *)[v3 initWithDelegate:self queue:0 options:v4];
  centralManager = self->_centralManager;
  self->_centralManager = v5;

  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel__bluetoothDeviceConnectionStatusDidChange_ name:*MEMORY[0x1E4F50B08] object:0];

  v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
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
  v13[2] = __55__CCUIBluetoothMenuModuleViewController__startScanning__block_invoke;
  v13[3] = &unk_1E6A898F8;
  v13[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v13];
}

uint64_t __55__CCUIBluetoothMenuModuleViewController__startScanning__block_invoke(uint64_t a1)
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

  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x1E4F50B00] object:0];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x1E4F50B18] object:0];

  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:self name:*MEMORY[0x1E4F50B10] object:0];

  v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 removeObserver:self name:*MEMORY[0x1E4F50AE8] object:0];

  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 removeObserver:self name:*MEMORY[0x1E4F50B20] object:0];
}

- (void)centralManager:(id)a3 didUpdatePeripheralConnectionState:(id)a4
{
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v5 = [v7 identifier];
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
  [(CCUIBluetoothMenuModuleViewController *)self _updateBluetoothMenuItems];
LABEL_8:
}

- (void)_updateBluetoothMenuItems
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v5 = [MEMORY[0x1E4F50B70] sharedInstance];
  id v6 = [v5 pairedDevices];

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
        v11 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        v12 = [(CCUIBluetoothMenuModuleViewController *)self _menuItemForBluetoothDevice:v11];
        [v3 addObject:v12];
        v13 = [v11 address];
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
  uint64_t v14 = [(CBCentralManager *)self->_centralManager sharedPairingAgent];
  v15 = [v14 retrievePairedPeers];

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
        v20 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        if (![(CCUIBluetoothMenuModuleViewController *)self _shouldHideBluetoothPeripheral:v20])
        {
          v21 = [(CCUIBluetoothMenuModuleViewController *)self _menuItemForBluetoothPeripheral:v20];
          [v3 addObject:v21];
        }
        v22 = [v20 identifier];
        v23 = [v22 UUIDString];
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
          BOOL v31 = [(CCUIBluetoothMenuModuleViewController *)self _shouldHideBluetoothPeripheral:v28];

          if (v31) {
            goto LABEL_27;
          }
          v29 = [(CCUIBluetoothMenuModuleViewController *)self _menuItemForBluetoothPeripheral:v28];
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

  [v3 sortUsingComparator:&__block_literal_global_6];
  [(CCUIMenuModuleViewController *)self setMenuItems:v3];
}

uint64_t __66__CCUIBluetoothMenuModuleViewController__updateBluetoothMenuItems__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 title];
  id v6 = [v4 title];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

- (id)_menuItemForBluetoothDevice:(id)a3
{
  id v4 = a3;
  v5 = [v4 address];
  objc_initWeak(&location, self);
  id v6 = objc_alloc(MEMORY[0x1E4F5AE38]);
  uint64_t v7 = [v4 name];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __69__CCUIBluetoothMenuModuleViewController__menuItemForBluetoothDevice___block_invoke;
  uint64_t v16 = &unk_1E6A89DC8;
  objc_copyWeak(&v19, &location);
  id v8 = v4;
  id v17 = v8;
  id v9 = v5;
  id v18 = v9;
  v10 = (void *)[v6 initWithTitle:v7 identifier:v9 handler:&v13];

  objc_msgSend(v10, "setBusy:", -[NSMutableSet containsObject:](self->_busyIdentifiers, "containsObject:", v9, v13, v14, v15, v16));
  v11 = -[CCUIBluetoothMenuModuleViewController _subtitleForConnected:](self, "_subtitleForConnected:", [v8 connected]);
  [v10 setSubtitle:v11];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v10;
}

uint64_t __69__CCUIBluetoothMenuModuleViewController__menuItemForBluetoothDevice___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    int v3 = [*(id *)(a1 + 32) connected];
    [WeakRetained[158] addObject:*(void *)(a1 + 40)];
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
  v5 = [v4 identifier];
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
  v13[2] = __73__CCUIBluetoothMenuModuleViewController__menuItemForBluetoothPeripheral___block_invoke;
  v13[3] = &unk_1E6A89DF0;
  id v9 = v4;
  id v14 = v9;
  objc_copyWeak(&v15, &location);
  v10 = (void *)[v8 initWithTitle:v7 identifier:v6 handler:v13];
  objc_msgSend(v10, "setBusy:", -[NSMutableSet containsObject:](self->_busyIdentifiers, "containsObject:", v6));
  v11 = -[CCUIBluetoothMenuModuleViewController _subtitleForConnected:](self, "_subtitleForConnected:", [v9 isConnectedToSystem]);
  [v10 setSubtitle:v11];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v10;
}

uint64_t __73__CCUIBluetoothMenuModuleViewController__menuItemForBluetoothPeripheral___block_invoke(uint64_t a1)
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
    v12 = v8;
    _os_log_impl(&dword_1D7B17000, v7, OS_LOG_TYPE_DEFAULT, "Bluetooth connection status changed: %{public}@", (uint8_t *)&v11, 0xCu);
  }
  busyIdentifiers = self->_busyIdentifiers;
  v10 = [v5 address];
  [(NSMutableSet *)busyIdentifiers removeObject:v10];

  [(CCUIBluetoothMenuModuleViewController *)self _updateBluetoothMenuItems];
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
  [(CCUIBluetoothMenuModuleViewController *)self _updateBluetoothMenuItems];
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
    v10 = v8;
    _os_log_impl(&dword_1D7B17000, v7, OS_LOG_TYPE_DEFAULT, "Bluetooth device removed: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  [(CCUIBluetoothMenuModuleViewController *)self _updateBluetoothMenuItems];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centralManager, 0);

  objc_storeStrong((id *)&self->_busyIdentifiers, 0);
}

@end