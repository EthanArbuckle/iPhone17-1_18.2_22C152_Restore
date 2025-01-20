@interface BTDevicePickerServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (id)host;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_btSSPConfirmationHandler:(id)a3;
- (void)_btSSPNumericComparisonHandler:(id)a3;
- (void)_btSSPPasskeyDisplayHandler:(id)a3;
- (void)alertSheetDismissed:(id)a3;
- (void)authenticationRequestHandler:(id)a3;
- (void)cancelDevicePicker;
- (void)checkAttachTimeout;
- (void)cleanupPairing;
- (void)deviceConnectionCompleteHandler:(id)a3;
- (void)deviceDiscoveryStoppedHandler:(id)a3;
- (void)deviceFoundHandler:(id)a3;
- (void)deviceLostHandler:(id)a3;
- (void)deviceNameChangedHandler:(id)a3;
- (void)devicePairedHandler:(id)a3;
- (void)didDismissWithResult:(int64_t)a3 deviceAddress:(id)a4;
- (void)discoveredDevice:(id)a3 deviceAddress:(id)a4;
- (void)dismissAnimated:(BOOL)a3;
- (void)dismissPairingAlert:(id)a3;
- (void)displayDevice:(id)a3 deviceAddress:(id)a4;
- (void)loadView;
- (void)powerChanged:(id)a3;
- (void)showAlert:(id)a3;
- (void)showBTDevicePickerWithTitle:(id)a3 Service:(unsigned int)a4;
- (void)showInternal;
- (void)showPairingAlert:(id)a3;
- (void)startScanning;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation BTDevicePickerServiceViewController

- (void)didDismissWithResult:(int64_t)a3 deviceAddress:(id)a4
{
  id v6 = a4;
  id v7 = [(BTDevicePickerServiceViewController *)self host];
  [v7 didDismissWithResult:a3 deviceAddress:v6];
}

- (void)discoveredDevice:(id)a3 deviceAddress:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BTDevicePickerServiceViewController *)self host];
  [v8 discoveredDevice:v7 deviceAddress:v6];
}

- (id)host
{
  return [(BTDevicePickerServiceViewController *)self _remoteViewControllerProxy];
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___BTDevicePickerRemoteViewController];
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___BTDevicePickerRemoteViewControllerHost];
}

- (void)loadView
{
  id v3 = objc_alloc_init((Class)UIView);
  [(BTDevicePickerServiceViewController *)self setView:v3];

  v4 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/BluetoothManager.framework"];
  unsigned int v5 = [v4 load];

  if (v5)
  {
    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:self selector:"powerChanged:" name:@"BluetoothPowerChangedNotification" object:0];

    id v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:self selector:"powerChanged:" name:@"BluetoothAvailabilityChangedNotification" object:0];

    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:self selector:"deviceDiscoveryStoppedHandler:" name:@"BluetoothDiscoveryStoppedNotification" object:0];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:self selector:"deviceFoundHandler:" name:@"BluetoothDeviceDiscoveredNotification" object:0];

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:self selector:"deviceLostHandler:" name:@"BluetoothDeviceRemovedNotification" object:0];

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:self selector:"deviceNameChangedHandler:" name:@"BluetoothDeviceUpdatedNotification" object:0];

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:self selector:"authenticationRequestHandler:" name:@"BluetoothPairingPINRequestNotification" object:0];

    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:self selector:"authenticationRequestHandler:" name:@"BluetoothPairingUserConfirmationNotification" object:0];

    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:self selector:"authenticationRequestHandler:" name:@"BluetoothPairingUserNumericComparisionNotification" object:0];

    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:self selector:"authenticationRequestHandler:" name:@"BluetoothPairingPassKeyDisplayNotification" object:0];

    v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:self selector:"devicePairedHandler:" name:@"BluetoothPairingPINResultFailedNotification" object:0];

    v17 = +[NSNotificationCenter defaultCenter];
    [v17 addObserver:self selector:"devicePairedHandler:" name:@"BluetoothPairingPINResultSuccessNotification" object:0];

    v18 = +[NSNotificationCenter defaultCenter];
    [v18 addObserver:self selector:"deviceConnectionCompleteHandler:" name:@"BluetoothDeviceConnectSuccessNotification" object:0];

    v19 = +[NSNotificationCenter defaultCenter];
    [v19 addObserver:self selector:"deviceConnectionCompleteHandler:" name:@"BluetoothDeviceConnectFailedNotification" object:0];

    v20 = [NSClassFromString(@"BluetoothManager") sharedInstance];
    btManager = self->_btManager;
    self->_btManager = v20;

    v22 = NSClassFromString(@"BTSSPPairingRequest");
    self->_btSSPRequestClass = v22;
    if (!v22)
    {
      v23 = +[NSBundle bundleWithPath:@"/System/Library/PreferenceBundles/BluetoothSettings.bundle"];
      [v23 load];

      self->_btSSPRequestClass = NSClassFromString(@"BTSSPPairingRequest");
    }
    self->_btAlertClass = NSClassFromString(@"BTAlert");
  }
}

- (void)showBTDevicePickerWithTitle:(id)a3 Service:(unsigned int)a4
{
  id v7 = a3;
  if (BTDevicePickerUILogInitOnce != -1) {
    dispatch_once_f(&BTDevicePickerUILogInitOnce, 0, (dispatch_function_t)BTDevicePickerUILogInit);
  }
  id v8 = BTDevicePickerUILogComponent;
  if (os_log_type_enabled((os_log_t)BTDevicePickerUILogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Preparing BT device picker UI", buf, 2u);
  }
  objc_storeStrong((id *)&self->_title, a3);
  self->_service = a4;
  if (self->_showingAlert || self->_btSSPAlert)
  {
    if (BTDevicePickerUILogInitOnce != -1) {
      dispatch_once_f(&BTDevicePickerUILogInitOnce, 0, (dispatch_function_t)BTDevicePickerUILogInit);
    }
    v9 = BTDevicePickerUILogComponent;
    if (os_log_type_enabled((os_log_t)BTDevicePickerUILogComponent, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Ignoring duplicate show call", v12, 2u);
    }
  }
  else
  {
    self->_showingAlert = 1;
    if ([(BluetoothManager *)self->_btManager available])
    {
      [(BTDevicePickerServiceViewController *)self showInternal];
    }
    else
    {
      if (BTDevicePickerUILogInitOnce != -1) {
        dispatch_once_f(&BTDevicePickerUILogInitOnce, 0, (dispatch_function_t)BTDevicePickerUILogInit);
      }
      v10 = BTDevicePickerUILogComponent;
      if (os_log_type_enabled((os_log_t)BTDevicePickerUILogComponent, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Waiting 3s for Bluetooth to become available", v11, 2u);
      }
      [(BTDevicePickerServiceViewController *)self performSelector:"checkAttachTimeout" withObject:0 afterDelay:3.0];
    }
  }
}

- (void)dismissAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self];

  [(BluetoothManager *)self->_btManager setDevicePairingEnabled:0];
  [(BluetoothManager *)self->_btManager setDeviceScanningEnabled:0];
  [(BTDevicePickerServiceViewController *)self cleanupPairing];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100001BF0;
  v6[3] = &unk_1000081B0;
  v6[4] = self;
  [(BTDevicePickerServiceViewController *)self dismissViewControllerAnimated:v3 completion:v6];
}

- (void)displayDevice:(id)a3 deviceAddress:(id)a4
{
  unsigned int v5 = [(BluetoothManager *)self->_btManager deviceFromAddressString:a4];
  if (v5)
  {
    if (BTDevicePickerUILogInitOnce != -1) {
      dispatch_once_f(&BTDevicePickerUILogInitOnce, 0, (dispatch_function_t)BTDevicePickerUILogInit);
    }
    id v6 = (void *)BTDevicePickerUILogComponent;
    if (os_log_type_enabled((os_log_t)BTDevicePickerUILogComponent, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      id v8 = [v5 name];
      v9 = [v5 address];
      *(_DWORD *)buf = 138412546;
      v22 = v8;
      __int16 v23 = 2112;
      v24 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Insert device: %@ with address: %@ to device picker list", buf, 0x16u);
    }
    if ([(NSMutableArray *)self->_deviceList indexOfObject:v5] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v10 = 0;
      if ([(NSMutableArray *)self->_deviceList count])
      {
        do
        {
          v11 = [v5 name];
          v12 = [(NSMutableArray *)self->_deviceList objectAtIndexedSubscript:v10];
          v13 = [v12 name];
          id v14 = [v11 caseInsensitiveCompare:v13];

          if (v14 == (id)-1) {
            break;
          }
          ++v10;
        }
        while (v10 < (unint64_t)[(NSMutableArray *)self->_deviceList count]);
      }
      [(NSMutableArray *)self->_deviceList insertObject:v5 atIndex:v10];
      tableView = self->_tableView;
      v16 = +[NSIndexPath indexPathForRow:v10 inSection:0];
      v20 = v16;
      v17 = +[NSArray arrayWithObjects:&v20 count:1];
      [(UITableView *)tableView insertRowsAtIndexPaths:v17 withRowAnimation:0];

      v18 = self->_tableView;
      v19 = +[NSIndexPath indexPathForRow:v10 inSection:0];
      [(UITableView *)v18 scrollToRowAtIndexPath:v19 atScrollPosition:0 animated:1];
    }
  }
}

- (void)checkAttachTimeout
{
  if (([(BluetoothManager *)self->_btManager available] & 1) == 0)
  {
    if (BTDevicePickerUILogInitOnce != -1) {
      dispatch_once_f(&BTDevicePickerUILogInitOnce, 0, (dispatch_function_t)BTDevicePickerUILogInit);
    }
    BOOL v3 = BTDevicePickerUILogComponent;
    if (os_log_type_enabled((os_log_t)BTDevicePickerUILogComponent, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cancelling picker as we couldn't communicate with Bluetooth", v4, 2u);
    }
    [(BTDevicePickerServiceViewController *)self dismissAnimated:1];
    [(BTDevicePickerServiceViewController *)self didDismissWithResult:3 deviceAddress:0];
  }
}

- (void)showInternal
{
  if ([(BluetoothManager *)self->_btManager powered])
  {
    BOOL v3 = (NSMutableArray *)objc_opt_new();
    deviceList = self->_deviceList;
    self->_deviceList = v3;

    unsigned int v5 = (UITableView *)objc_alloc_init((Class)UITableView);
    tableView = self->_tableView;
    self->_tableView = v5;

    [(UITableView *)self->_tableView setDelegate:self];
    [(UITableView *)self->_tableView setDataSource:self];
    id v7 = objc_alloc_init((Class)UITableViewController);
    objc_msgSend(v7, "setPreferredContentSize:", 300.0, 200.0);
    [v7 setTableView:self->_tableView];
    [(UITableView *)self->_tableView reloadData];
    id v8 = +[UIAlertController alertControllerWithTitle:self->_title message:0 preferredStyle:1];
    alertView = self->_alertView;
    self->_alertView = v8;

    unint64_t v10 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"CANCEL" value:&stru_100008478 table:@"BTClassic"];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000021C0;
    v13[3] = &unk_1000081D8;
    v13[4] = self;
    v12 = +[UIAlertAction actionWithTitle:v11 style:1 handler:v13];

    [(UIAlertController *)self->_alertView addAction:v12];
    [(UIAlertController *)self->_alertView setValue:v7 forKey:@"contentViewController"];
    [(BTDevicePickerServiceViewController *)self presentViewController:self->_alertView animated:1 completion:0];
    [(BTDevicePickerServiceViewController *)self startScanning];
  }
  else
  {
    [(BTDevicePickerServiceViewController *)self dismissAnimated:0];
    [(BluetoothManager *)self->_btManager showPowerPrompt];
    [(BTDevicePickerServiceViewController *)self didDismissWithResult:1 deviceAddress:0];
  }
}

- (void)startScanning
{
  if (BTDevicePickerUILogInitOnce != -1) {
    dispatch_once_f(&BTDevicePickerUILogInitOnce, 0, (dispatch_function_t)BTDevicePickerUILogInit);
  }
  BOOL v3 = BTDevicePickerUILogComponent;
  if (os_log_type_enabled((os_log_t)BTDevicePickerUILogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Start Scanning", buf, 2u);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(BluetoothManager *)self->_btManager pairedDevices];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * i) isServiceSupported:self->_service])
        {
          self->_checkingPaired = 1;
          goto LABEL_15;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  [(BluetoothManager *)self->_btManager setDevicePairingEnabled:1];
  if (self->_checkingPaired)
  {
    if (BTDevicePickerUILogInitOnce != -1) {
      dispatch_once_f(&BTDevicePickerUILogInitOnce, 0, (dispatch_function_t)BTDevicePickerUILogInit);
    }
    v9 = BTDevicePickerUILogComponent;
    if (os_log_type_enabled((os_log_t)BTDevicePickerUILogComponent, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Searching for available paired devices", buf, 2u);
    }
    [(BluetoothManager *)self->_btManager scanForConnectableDevices:self->_service];
  }
  else
  {
    if (BTDevicePickerUILogInitOnce != -1) {
      dispatch_once_f(&BTDevicePickerUILogInitOnce, 0, (dispatch_function_t)BTDevicePickerUILogInit);
    }
    unint64_t v10 = BTDevicePickerUILogComponent;
    if (os_log_type_enabled((os_log_t)BTDevicePickerUILogComponent, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int service = self->_service;
      *(_DWORD *)buf = 67109120;
      unsigned int v17 = service;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Searching for devices that support service 0x%08X", buf, 8u);
    }
    [(BluetoothManager *)self->_btManager scanForServices:self->_service];
  }
}

- (void)cancelDevicePicker
{
  if (BTDevicePickerUILogInitOnce != -1) {
    dispatch_once_f(&BTDevicePickerUILogInitOnce, 0, (dispatch_function_t)BTDevicePickerUILogInit);
  }
  BOOL v3 = BTDevicePickerUILogComponent;
  if (os_log_type_enabled((os_log_t)BTDevicePickerUILogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "BT device picker cancelled", v6, 2u);
  }
  alertView = self->_alertView;
  self->_alertView = 0;

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self];

  [(BluetoothManager *)self->_btManager setDevicePairingEnabled:0];
  [(BluetoothManager *)self->_btManager setDeviceScanningEnabled:0];
  [(BluetoothManager *)self->_btManager resetDeviceScanning];
  [(BTDevicePickerServiceViewController *)self didDismissWithResult:2 deviceAddress:0];
}

- (void)cleanupPairing
{
  [self->_btSSPAlert dismiss];
  id btSSPAlert = self->_btSSPAlert;
  self->_id btSSPAlert = 0;
}

- (void)powerChanged:(id)a3
{
  if ([(BluetoothManager *)self->_btManager available])
  {
    if (BTDevicePickerUILogInitOnce != -1) {
      dispatch_once_f(&BTDevicePickerUILogInitOnce, 0, (dispatch_function_t)BTDevicePickerUILogInit);
    }
    v4 = BTDevicePickerUILogComponent;
    if (os_log_type_enabled((os_log_t)BTDevicePickerUILogComponent, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Bluetooth communication now available", v9, 2u);
    }
    if (self->_alertView)
    {
      if ([(BluetoothManager *)self->_btManager powered]) {
        [(BTDevicePickerServiceViewController *)self startScanning];
      }
    }
    else if (self->_showingAlert)
    {
      [(BTDevicePickerServiceViewController *)self showInternal];
    }
  }
  else
  {
    if (BTDevicePickerUILogInitOnce != -1) {
      dispatch_once_f(&BTDevicePickerUILogInitOnce, 0, (dispatch_function_t)BTDevicePickerUILogInit);
    }
    id v5 = BTDevicePickerUILogComponent;
    if (os_log_type_enabled((os_log_t)BTDevicePickerUILogComponent, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Bluetooth communication now unavailable", buf, 2u);
    }
    self->_checkingPaired = 0;
    connectingSpec = self->_connectingSpec;
    self->_connectingSpec = 0;

    [(NSMutableArray *)self->_deviceList removeAllObjects];
    [self->_btSSPAlert dismissAnimated:0];
    id btSSPAlert = self->_btSSPAlert;
    self->_id btSSPAlert = 0;

    [self->_btAlert dismissAnimated:0];
    id btAlert = self->_btAlert;
    self->_id btAlert = 0;

    [(UITableView *)self->_tableView reloadData];
  }
}

- (void)deviceDiscoveryStoppedHandler:(id)a3
{
  id v4 = a3;
  if (BTDevicePickerUILogInitOnce != -1) {
    dispatch_once_f(&BTDevicePickerUILogInitOnce, 0, (dispatch_function_t)BTDevicePickerUILogInit);
  }
  id v5 = (void *)BTDevicePickerUILogComponent;
  if (os_log_type_enabled((os_log_t)BTDevicePickerUILogComponent, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    uint64_t v7 = [v4 name];
    int v10 = 138412290;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received %@", (uint8_t *)&v10, 0xCu);
  }
  if (self->_checkingPaired)
  {
    self->_checkingPaired = 0;
    if (BTDevicePickerUILogInitOnce != -1) {
      dispatch_once_f(&BTDevicePickerUILogInitOnce, 0, (dispatch_function_t)BTDevicePickerUILogInit);
    }
    id v8 = BTDevicePickerUILogComponent;
    if (os_log_type_enabled((os_log_t)BTDevicePickerUILogComponent, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int service = self->_service;
      int v10 = 67109120;
      LODWORD(v11) = service;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Continuing to search for devices that support service 0x%08X", (uint8_t *)&v10, 8u);
    }
    [(BluetoothManager *)self->_btManager scanForServices:self->_service];
  }
}

- (void)deviceFoundHandler:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  if (BTDevicePickerUILogInitOnce != -1) {
    dispatch_once_f(&BTDevicePickerUILogInitOnce, 0, (dispatch_function_t)BTDevicePickerUILogInit);
  }
  id v6 = (void *)BTDevicePickerUILogComponent;
  if (os_log_type_enabled((os_log_t)BTDevicePickerUILogComponent, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    id v8 = [v4 name];
    v9 = [v5 name];
    int v12 = 138412546;
    long long v13 = v8;
    __int16 v14 = 2112;
    long long v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received %@ for device %@", (uint8_t *)&v12, 0x16u);
  }
  int v10 = [v5 name];
  v11 = [v5 address];
  [(BTDevicePickerServiceViewController *)self discoveredDevice:v10 deviceAddress:v11];
}

- (void)deviceNameChangedHandler:(id)a3
{
  id v6 = a3;
  uint64_t v7 = [v6 object];
  if (BTDevicePickerUILogInitOnce != -1) {
    dispatch_once_f(&BTDevicePickerUILogInitOnce, 0, (dispatch_function_t)BTDevicePickerUILogInit);
  }
  id v8 = (void *)BTDevicePickerUILogComponent;
  if (os_log_type_enabled((os_log_t)BTDevicePickerUILogComponent, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    int v10 = [v6 name];
    v11 = [v7 name];
    *(_DWORD *)buf = 138412546;
    v31 = v10;
    __int16 v32 = 2112;
    v33 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received %@ for device %@", buf, 0x16u);
  }
  int v12 = (char *)[(NSMutableArray *)self->_deviceList indexOfObject:v7];
  long long v13 = v12;
  if (!v12)
  {
    __int16 v14 = 0;
LABEL_9:
    if (v13 + 1 >= [(NSMutableArray *)self->_deviceList count])
    {
      v16 = 0;
      if (!v14) {
        goto LABEL_23;
      }
    }
    else
    {
      uint64_t v15 = [(NSMutableArray *)self->_deviceList objectAtIndexedSubscript:v13 + 1];
      v16 = (void *)v15;
      if (!v14)
      {
        if (!v15) {
          goto LABEL_23;
        }
        v25 = 0;
        char v27 = 1;
LABEL_18:
        unsigned int v17 = [v16 name];
        v18 = [v7 name];
        id v26 = [v17 caseInsensitiveCompare:v18];

        if ((v27 & 1) == 0)
        {
        }
        __int16 v14 = v25;
        if (v26 != (id)1) {
          goto LABEL_21;
        }
LABEL_23:
        tableView = self->_tableView;
        __int16 v23 = +[NSIndexPath indexPathForRow:v13 inSection:0];
        v29 = v23;
        v24 = +[NSArray arrayWithObjects:&v29 count:1];
        [(UITableView *)tableView reloadRowsAtIndexPaths:v24 withRowAnimation:0];

        goto LABEL_24;
      }
    }
    BOOL v3 = [v14 name];
    id v4 = [v7 name];
    if ([v3 caseInsensitiveCompare:v4] != (id)-1)
    {

LABEL_21:
      [(NSMutableArray *)self->_deviceList removeObjectAtIndex:v13];
      v19 = self->_tableView;
      v20 = +[NSIndexPath indexPathForRow:v13 inSection:0];
      v28 = v20;
      v21 = +[NSArray arrayWithObjects:&v28 count:1];
      [(UITableView *)v19 deleteRowsAtIndexPaths:v21 withRowAnimation:0];

      [(BTDevicePickerServiceViewController *)self deviceFoundHandler:v6];
LABEL_24:

      goto LABEL_25;
    }
    if (!v16)
    {

      goto LABEL_23;
    }
    v25 = v14;
    char v27 = 0;
    goto LABEL_18;
  }
  if (v12 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    __int16 v14 = [(NSMutableArray *)self->_deviceList objectAtIndexedSubscript:v12 - 1];
    goto LABEL_9;
  }
LABEL_25:
}

- (void)deviceLostHandler:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  if (BTDevicePickerUILogInitOnce != -1) {
    dispatch_once_f(&BTDevicePickerUILogInitOnce, 0, (dispatch_function_t)BTDevicePickerUILogInit);
  }
  id v6 = (void *)BTDevicePickerUILogComponent;
  if (os_log_type_enabled((os_log_t)BTDevicePickerUILogComponent, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    id v8 = [v4 name];
    v9 = [v5 name];
    *(_DWORD *)buf = 138412546;
    unsigned int v17 = v8;
    __int16 v18 = 2112;
    v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received %@ for device %@", buf, 0x16u);
  }
  id v10 = [(NSMutableArray *)self->_deviceList indexOfObject:v5];
  if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = v10;
    [(NSMutableArray *)self->_deviceList removeObjectAtIndex:v10];
    tableView = self->_tableView;
    long long v13 = +[NSIndexPath indexPathForRow:v11 inSection:0];
    uint64_t v15 = v13;
    __int16 v14 = +[NSArray arrayWithObjects:&v15 count:1];
    [(UITableView *)tableView deleteRowsAtIndexPaths:v14 withRowAnimation:0];
  }
}

- (void)authenticationRequestHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_btSSPRequestClass)
  {
    [(BluetoothManager *)self->_btManager cancelPairing];
    goto LABEL_9;
  }
  if (self->_btSSPAlert || self->_btAlert)
  {
    if (BTDevicePickerUILogInitOnce != -1) {
      dispatch_once_f(&BTDevicePickerUILogInitOnce, 0, (dispatch_function_t)BTDevicePickerUILogInit);
    }
    id v6 = BTDevicePickerUILogComponent;
    if (os_log_type_enabled((os_log_t)BTDevicePickerUILogComponent, OS_LOG_TYPE_ERROR)) {
      sub_100004488((uint64_t *)&self->_btSSPAlert, (uint64_t)self, v6);
    }
    goto LABEL_9;
  }
  uint64_t v7 = [v4 name];
  if ([v7 isEqualToString:@"BluetoothPairingUserNumericComparisionNotification"])
  {
  }
  else
  {
    id v8 = [v5 name];
    unsigned int v9 = [v8 isEqualToString:@"BluetoothPairingPassKeyDisplayNotification"];

    if (!v9)
    {
      id v11 = [v5 object];
      goto LABEL_15;
    }
  }
  id v10 = [v5 object];
  id v11 = [v10 valueForKey:@"device"];

LABEL_15:
  if (BTDevicePickerUILogInitOnce != -1) {
    dispatch_once_f(&BTDevicePickerUILogInitOnce, 0, (dispatch_function_t)BTDevicePickerUILogInit);
  }
  int v12 = (void *)BTDevicePickerUILogComponent;
  if (os_log_type_enabled((os_log_t)BTDevicePickerUILogComponent, OS_LOG_TYPE_DEFAULT))
  {
    long long v13 = v12;
    __int16 v14 = [v5 name];
    uint64_t v15 = [v11 name];
    *(_DWORD *)buf = 138412546;
    v40 = v14;
    __int16 v41 = 2112;
    v42 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received %@ for device %@", buf, 0x16u);
  }
  v16 = [(PSSpecifierStub *)self->_connectingSpec device];
  unsigned int v17 = [v16 address];
  __int16 v18 = [v11 address];
  unsigned int v19 = [v17 isEqualToString:v18];

  if (v19)
  {
    v20 = [v5 name];
    unsigned int v21 = [v20 isEqualToString:@"BluetoothPairingPINRequestNotification"];

    if (v21)
    {
      [(BluetoothManager *)self->_btManager cancelPairing];
      [(BTDevicePickerServiceViewController *)self dismissAnimated:1];
      v37 = +[NSBundle bundleForClass:objc_opt_class()];
      v22 = [v37 localizedStringForKey:@"OLD_DEVICE_TITLE" value:&stru_100008478 table:@"BTClassic"];
      __int16 v23 = +[NSBundle bundleForClass:objc_opt_class()];
      v24 = [v23 localizedStringForKey:@"OLD_DEVICE_MESSAGE" value:&stru_100008478 table:@"BTClassic"];
      v25 = [v11 name];
      id v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v24, v25);
      char v27 = +[UIAlertController alertControllerWithTitle:v22 message:v26 preferredStyle:1];

      v28 = +[NSBundle bundleForClass:objc_opt_class()];
      v29 = [v28 localizedStringForKey:@"OK" value:&stru_100008478 table:@"BTClassic"];
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100003624;
      v38[3] = &unk_1000081D8;
      v38[4] = self;
      v30 = +[UIAlertAction actionWithTitle:v29 style:1 handler:v38];

      [v27 addAction:v30];
      [(BTDevicePickerServiceViewController *)self presentViewController:v27 animated:1 completion:0];
    }
    else
    {
      v31 = [v5 name];
      unsigned int v32 = [v31 isEqualToString:@"BluetoothPairingUserConfirmationNotification"];

      if (v32)
      {
        [(BTDevicePickerServiceViewController *)self _btSSPConfirmationHandler:v5];
      }
      else
      {
        v33 = [v5 name];
        unsigned int v34 = [v33 isEqualToString:@"BluetoothPairingUserNumericComparisionNotification"];

        if (v34)
        {
          [(BTDevicePickerServiceViewController *)self _btSSPNumericComparisonHandler:v5];
        }
        else
        {
          v35 = [v5 name];
          unsigned int v36 = [v35 isEqualToString:@"BluetoothPairingPassKeyDisplayNotification"];

          if (v36) {
            [(BTDevicePickerServiceViewController *)self _btSSPPasskeyDisplayHandler:v5];
          }
        }
      }
    }
  }

LABEL_9:
}

- (void)_btSSPConfirmationHandler:(id)a3
{
  id v7 = [a3 object];
  id btSSPAlert = self->_btSSPAlert;
  self->_id btSSPAlert = 0;

  id v5 = [objc_alloc(self->_btSSPRequestClass) initWithDevice:v7 andSpecifier:self->_connectingSpec];
  id v6 = self->_btSSPAlert;
  self->_id btSSPAlert = v5;

  [self->_btSSPAlert setDelegate:self];
  [self->_btSSPAlert setPairingStyle:0 andPasskey:0];
  [self->_btSSPAlert show];
}

- (void)_btSSPNumericComparisonHandler:(id)a3
{
  id v9 = [a3 object];
  id v4 = [v9 valueForKey:@"device"];
  id v5 = [v9 valueForKey:@"value"];
  id btSSPAlert = self->_btSSPAlert;
  self->_id btSSPAlert = 0;

  id v7 = [objc_alloc(self->_btSSPRequestClass) initWithDevice:v4 andSpecifier:self->_connectingSpec];
  id v8 = self->_btSSPAlert;
  self->_id btSSPAlert = v7;

  [self->_btSSPAlert setDelegate:self];
  [self->_btSSPAlert setPairingStyle:1 andPasskey:v5];
  [self->_btSSPAlert show];
}

- (void)_btSSPPasskeyDisplayHandler:(id)a3
{
  id v9 = [a3 object];
  id v4 = [v9 valueForKey:@"device"];
  id v5 = [v9 valueForKey:@"value"];
  id btSSPAlert = self->_btSSPAlert;
  self->_id btSSPAlert = 0;

  id v7 = [objc_alloc(self->_btSSPRequestClass) initWithDevice:v4 andSpecifier:self->_connectingSpec];
  id v8 = self->_btSSPAlert;
  self->_id btSSPAlert = v7;

  [self->_btSSPAlert setDelegate:self];
  [self->_btSSPAlert setPairingStyle:2 andPasskey:v5];
  [self->_btSSPAlert show];
}

- (void)devicePairedHandler:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  if (BTDevicePickerUILogInitOnce != -1) {
    dispatch_once_f(&BTDevicePickerUILogInitOnce, 0, (dispatch_function_t)BTDevicePickerUILogInit);
  }
  id v6 = (void *)BTDevicePickerUILogComponent;
  if (os_log_type_enabled((os_log_t)BTDevicePickerUILogComponent, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = [v4 name];
    id v9 = [v5 name];
    int v23 = 138412546;
    v24 = v8;
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received %@ for device %@", (uint8_t *)&v23, 0x16u);
  }
  id v10 = [v5 address];
  id v11 = [(PSSpecifierStub *)self->_connectingSpec device];
  int v12 = [v11 address];
  unsigned int v13 = [v10 isEqualToString:v12];

  if (v13)
  {
    [(BTDevicePickerServiceViewController *)self cleanupPairing];
    __int16 v14 = [v4 name];
    unsigned int v15 = [v14 isEqualToString:@"BluetoothPairingPINResultFailedNotification"];

    if (v15)
    {
      v16 = [(PSSpecifierStub *)self->_connectingSpec userInfo];
      unsigned int v17 = [v16 objectForKeyedSubscript:@"PIN-ended"];

      [(BTDevicePickerServiceViewController *)self dismissAnimated:1];
      if ([v17 isEqualToString:@"cancelled"])
      {
        [(BTDevicePickerServiceViewController *)self didDismissWithResult:2 deviceAddress:0];
      }
      else if (!self->_btAlert)
      {
        id v18 = [objc_alloc(self->_btAlertClass) initWithDevice:v5];
        id btAlert = self->_btAlert;
        self->_id btAlert = v18;

        [self->_btAlert setDelegate:self];
        if (v17
          || (id btSSPAlert = self->_btSSPAlert) == 0
          || [btSSPAlert pairingStyle] == 2
          || [self->_btSSPAlert pairingStyle] == 3)
        {
          v20 = [v4 userInfo];
          unsigned int v21 = [v20 objectForKeyedSubscript:@"BluetoothErrorKey"];
        }
        else
        {
          unsigned int v21 = &off_100008650;
        }
        [self->_btAlert showAlertWithResult:v21];
      }
    }
  }
}

- (void)deviceConnectionCompleteHandler:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  if (BTDevicePickerUILogInitOnce != -1) {
    dispatch_once_f(&BTDevicePickerUILogInitOnce, 0, (dispatch_function_t)BTDevicePickerUILogInit);
  }
  id v6 = (void *)BTDevicePickerUILogComponent;
  if (os_log_type_enabled((os_log_t)BTDevicePickerUILogComponent, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = [v4 name];
    id v9 = [v5 name];
    int v21 = 138412546;
    v22 = v8;
    __int16 v23 = 2112;
    v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received %@ for device %@", (uint8_t *)&v21, 0x16u);
  }
  id v10 = [v5 address];
  id v11 = [(PSSpecifierStub *)self->_connectingSpec device];
  int v12 = [v11 address];
  unsigned int v13 = [v10 isEqualToString:v12];

  if (v13)
  {
    [(BTDevicePickerServiceViewController *)self cleanupPairing];
    __int16 v14 = [v4 name];
    unsigned int v15 = [v14 isEqualToString:@"BluetoothDeviceConnectFailedNotification"];

    if (!v15)
    {
      unsigned int v19 = [v5 address];
      [(BTDevicePickerServiceViewController *)self didDismissWithResult:0 deviceAddress:v19];
      goto LABEL_10;
    }
    [(BTDevicePickerServiceViewController *)self dismissAnimated:1];
    if (!self->_btAlert)
    {
      id v16 = [objc_alloc(self->_btAlertClass) initWithDevice:v5];
      id btAlert = self->_btAlert;
      self->_id btAlert = v16;

      [self->_btAlert setDelegate:self];
      id v18 = self->_btAlert;
      unsigned int v19 = [v4 userInfo];
      v20 = [v19 objectForKeyedSubscript:@"BluetoothErrorKey"];
      [v18 showAlertWithResult:v20];

LABEL_10:
    }
  }
}

- (void)alertSheetDismissed:(id)a3
{
  id v4 = a3;
  if (BTDevicePickerUILogInitOnce != -1) {
    dispatch_once_f(&BTDevicePickerUILogInitOnce, 0, (dispatch_function_t)BTDevicePickerUILogInit);
  }
  id v5 = BTDevicePickerUILogComponent;
  if (os_log_type_enabled((os_log_t)BTDevicePickerUILogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Alert sheet dismissed", v7, 2u);
  }
  id btAlert = self->_btAlert;
  self->_id btAlert = 0;

  [(BTDevicePickerServiceViewController *)self didDismissWithResult:3 deviceAddress:0];
}

- (void)showAlert:(id)a3
{
  id v4 = a3;
  if (BTDevicePickerUILogInitOnce != -1) {
    dispatch_once_f(&BTDevicePickerUILogInitOnce, 0, (dispatch_function_t)BTDevicePickerUILogInit);
  }
  id v5 = BTDevicePickerUILogComponent;
  if (os_log_type_enabled((os_log_t)BTDevicePickerUILogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Present alert", v6, 2u);
  }
  [(BTDevicePickerServiceViewController *)self dismissViewControllerAnimated:1 completion:0];
  [(BTDevicePickerServiceViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)showPairingAlert:(id)a3
{
  id v4 = a3;
  if (BTDevicePickerUILogInitOnce != -1) {
    dispatch_once_f(&BTDevicePickerUILogInitOnce, 0, (dispatch_function_t)BTDevicePickerUILogInit);
  }
  id v5 = BTDevicePickerUILogComponent;
  if (os_log_type_enabled((os_log_t)BTDevicePickerUILogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Present pairing alert", v6, 2u);
  }
  [(BTDevicePickerServiceViewController *)self dismissViewControllerAnimated:1 completion:0];
  [(BTDevicePickerServiceViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)dismissPairingAlert:(id)a3
{
  id v4 = a3;
  if (BTDevicePickerUILogInitOnce != -1) {
    dispatch_once_f(&BTDevicePickerUILogInitOnce, 0, (dispatch_function_t)BTDevicePickerUILogInit);
  }
  id v5 = BTDevicePickerUILogComponent;
  if (os_log_type_enabled((os_log_t)BTDevicePickerUILogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dismiss pairing alert", v6, 2u);
  }
  [(BTDevicePickerServiceViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v12 = [v7 cellForRowAtIndexPath:v6];
  id v8 = -[NSMutableArray objectAtIndexedSubscript:](self->_deviceList, "objectAtIndexedSubscript:", [v6 row]);
  id v9 = objc_alloc_init(PSSpecifierStub);
  connectingSpec = self->_connectingSpec;
  self->_connectingSpec = v9;

  [(PSSpecifierStub *)self->_connectingSpec setDevice:v8];
  [v7 setUserInteractionEnabled:0];
  [(BluetoothManager *)self->_btManager setDeviceScanningEnabled:0];
  [(BluetoothManager *)self->_btManager resetDeviceScanning];
  id v11 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  [v12 setAccessoryView:v11];
  [v11 startAnimating];
  [v8 connect];
  [v7 deselectRowAtIndexPath:v6 animated:1];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (int64_t)[(NSMutableArray *)self->_deviceList count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"BTDevice"];
  if (!v7) {
    id v7 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"BTDevice"];
  }
  id v8 = -[NSMutableArray objectAtIndexedSubscript:](self->_deviceList, "objectAtIndexedSubscript:", [v6 row]);
  id v9 = [v8 name];
  id v10 = [v7 textLabel];
  [v10 setText:v9];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_btAlert, 0);
  objc_storeStrong(&self->_btSSPAlert, 0);
  objc_storeStrong((id *)&self->_btManager, 0);
  objc_storeStrong((id *)&self->_connectingSpec, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_deviceList, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_alertView, 0);
}

@end