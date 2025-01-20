@interface AXRNearbyDevicesViewController
- (AXRDeviceDiscoveryManager)discoveryManager;
- (BOOL)_canShowWhileLocked;
- (NSArray)discoveredDevices;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_connectToDevice:(id)a3;
- (void)_dismissPresentedViewController;
- (void)_showActiveDeviceConnectionAlertWithDevice:(id)a3;
- (void)_showFailedToConnectAlert;
- (void)deviceDiscoveryManager:(id)a3 updatedDevices:(id)a4;
- (void)setDiscoveredDevices:(id)a3;
- (void)setDiscoveryManager:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation AXRNearbyDevicesViewController

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)AXRNearbyDevicesViewController;
  [(AXRNearbyDevicesViewController *)&v8 viewDidLoad];
  v3 = [MEMORY[0x263F220A0] sharedInstance];
  [(AXRNearbyDevicesViewController *)self setDiscoveryManager:v3];

  v4 = [(AXRNearbyDevicesViewController *)self discoveryManager];
  [v4 addObserver:self];

  v5 = [(AXRNearbyDevicesViewController *)self discoveryManager];
  v6 = [v5 cachedDiscoveredDevices];
  [(AXRNearbyDevicesViewController *)self setDiscoveredDevices:v6];

  v7 = [(AXRNearbyDevicesViewController *)self tableView];
  [v7 registerClass:objc_opt_class() forCellReuseIdentifier:@"NearbyDeviceCell"];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AXRNearbyDevicesViewController;
  [(AXRNearbyDevicesViewController *)&v3 viewDidAppear:a3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AXRNearbyDevicesViewController;
  [(AXRNearbyDevicesViewController *)&v3 viewDidDisappear:a3];
}

- (void)_connectToDevice:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__AXRNearbyDevicesViewController__connectToDevice___block_invoke;
  v6[3] = &unk_264DA8BE8;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [v5 connectIfNecessary:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __51__AXRNearbyDevicesViewController__connectToDevice___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (a2) {
    [WeakRetained _showActiveDeviceConnectionAlertWithDevice:*(void *)(a1 + 32)];
  }
  else {
    [WeakRetained _showFailedToConnectAlert];
  }
}

- (void)_showActiveDeviceConnectionAlertWithDevice:(id)a3
{
  id v4 = a3;
  id v8 = [[AXRConnectedDeviceViewController alloc] initWithRemoteDevice:v4];

  id v5 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:24 target:self action:sel__dismissPresentedViewController];
  v6 = [(AXRConnectedDeviceViewController *)v8 navigationItem];
  [v6 setRightBarButtonItem:v5];

  id v7 = (void *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:v8];
  [(AXRNearbyDevicesViewController *)self presentViewController:v7 animated:1 completion:&__block_literal_global];
}

- (void)_dismissPresentedViewController
{
  id v2 = [(AXRNearbyDevicesViewController *)self presentedViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)_showFailedToConnectAlert
{
  objc_super v3 = (void *)MEMORY[0x263F1C3F8];
  id v4 = AXRLocalizedStringForKey();
  id v8 = [v3 alertControllerWithTitle:v4 message:0 preferredStyle:0];

  id v5 = (void *)MEMORY[0x263F1C3F0];
  v6 = AXRLocalizedStringForKey();
  id v7 = [v5 actionWithTitle:v6 style:0 handler:0];
  [v8 addAction:v7];

  [(AXRNearbyDevicesViewController *)self presentViewController:v8 animated:1 completion:0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)deviceDiscoveryManager:(id)a3 updatedDevices:(id)a4
{
  [(AXRNearbyDevicesViewController *)self setDiscoveredDevices:a4];
  id v5 = [(AXRNearbyDevicesViewController *)self tableView];
  [v5 reloadData];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(AXRNearbyDevicesViewController *)self discoveredDevices];
  uint64_t v6 = [v5 count];

  if (!v6) {
    return 1;
  }
  id v7 = [(AXRNearbyDevicesViewController *)self discoveredDevices];
  int64_t v8 = [v7 count];

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"NearbyDeviceCell" forIndexPath:v6];
  [v7 setHidden:0];
  int64_t v8 = [(AXRNearbyDevicesViewController *)self discoveredDevices];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    unint64_t v10 = [v6 item];
    v11 = [(AXRNearbyDevicesViewController *)self discoveredDevices];
    unint64_t v12 = [v11 count];

    if (v10 >= v12)
    {
      v20 = [v7 textLabel];
      [v20 setText:0];

      [v7 setHidden:1];
    }
    else
    {
      v13 = [(AXRNearbyDevicesViewController *)self discoveredDevices];
      v14 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));

      v15 = [v14 displayName];
      v16 = [v7 textLabel];
      [v16 setText:v15];
    }
  }
  else
  {
    v17 = (void *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
    [v17 startAnimating];
    [v7 setAccessoryView:v17];
    v18 = AXRLocalizedStringForKey();
    v19 = [v7 textLabel];
    [v19 setText:v18];
  }
  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return (id)AXRLocalizedStringForKey();
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  unint64_t v7 = [v6 row];
  int64_t v8 = [(AXRNearbyDevicesViewController *)self discoveredDevices];
  unint64_t v9 = [v8 count];

  if (v7 < v9)
  {
    unint64_t v10 = [(AXRNearbyDevicesViewController *)self discoveredDevices];
    v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

    [(AXRNearbyDevicesViewController *)self _connectToDevice:v11];
  }
  [v12 deselectRowAtIndexPath:v6 animated:1];
}

- (AXRDeviceDiscoveryManager)discoveryManager
{
  return self->_discoveryManager;
}

- (void)setDiscoveryManager:(id)a3
{
}

- (NSArray)discoveredDevices
{
  return self->_discoveredDevices;
}

- (void)setDiscoveredDevices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveredDevices, 0);
  objc_storeStrong((id *)&self->_discoveryManager, 0);
}

@end