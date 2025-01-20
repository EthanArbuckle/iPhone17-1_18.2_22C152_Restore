@interface ProfileDevicePickerMainController
- (void)_discoveryFoundDevice:(id)a3;
- (void)_discoveryStart;
- (void)_discoveryStop;
- (void)_discoveryTimeout;
- (void)_pickerAlertCanceled;
- (void)_pickerAlertHandlePickedDevice:(id)a3;
- (void)_pickerAlertShow;
- (void)_pickerAlertShowError:(id)a3;
- (void)_pickerAlertShowNoDevices;
- (void)_pickerAlertShowSuccess;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dismiss:(int)a3;
- (void)handleButtonActions:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation ProfileDevicePickerMainController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemSession, 0);
  objc_storeStrong((id *)&self->_installTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);

  objc_storeStrong((id *)&self->_alertController, 0);
}

- (void)_pickerAlertCanceled
{
  alertController = self->_alertController;
  self->_alertController = 0;

  if (dword_1001CC830 <= 30 && (dword_1001CC830 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(ProfileDevicePickerMainController *)self dismiss:8];
  id v4 = +[NSDistributedNotificationCenter defaultCenter];
  [v4 postNotificationName:@"com.apple.sharing.DeviceProfile" object:@"com.apple.sharingd" userInfo:&off_1001A7118 deliverImmediately:1];
}

- (void)_pickerAlertShowSuccess
{
  v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"CHOOSE_SUCCESS_TITLE" value:&stru_1001A1DC0 table:@"Localizable"];

  v5 = +[UIAlertController alertControllerWithTitle:v4 message:0 preferredStyle:1];
  v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"OK_BUTTON_TITLE" value:&stru_1001A1DC0 table:@"Localizable"];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10011D724;
  v10[3] = &unk_1001A11A0;
  v10[4] = self;
  v8 = +[UIAlertAction actionWithTitle:v7 style:0 handler:v10];
  [v5 addAction:v8];
  [(ProfileDevicePickerMainController *)self presentViewController:v5 animated:1 completion:0];
  v9 = +[NSDistributedNotificationCenter defaultCenter];
  [v9 postNotificationName:@"com.apple.sharing.DeviceProfile" object:@"com.apple.sharingd" userInfo:&off_1001A70F0 deliverImmediately:1];
}

- (void)_pickerAlertShowError:(id)a3
{
  id v4 = a3;
  v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"CHOOSE_INSTALL_FAILED_TITLE" value:&stru_1001A1DC0 table:@"Localizable"];

  id v7 = [v4 code];
  v15 = sub_100138494(@"CHOOSE_INSTALL_FAILED_INFO_FORMAT", v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);
  v16 = +[UIAlertController alertControllerWithTitle:v6 message:v15 preferredStyle:1];
  v17 = +[NSBundle mainBundle];
  v18 = [v17 localizedStringForKey:@"OK_BUTTON_TITLE" value:&stru_1001A1DC0 table:@"Localizable"];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10011D990;
  v24[3] = &unk_1001A11A0;
  v24[4] = self;
  v19 = +[UIAlertAction actionWithTitle:v18 style:0 handler:v24];
  [v16 addAction:v19];
  [(ProfileDevicePickerMainController *)self presentViewController:v16 animated:1 completion:0];
  CFStringRef v25 = @"errorCode";
  id v20 = [v4 code];

  v21 = +[NSNumber numberWithInteger:v20];
  v26 = v21;
  v22 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];

  v23 = +[NSDistributedNotificationCenter defaultCenter];
  [v23 postNotificationName:@"com.apple.sharing.DeviceProfile" object:@"com.apple.sharingd" userInfo:v22 deliverImmediately:1];
}

- (void)_pickerAlertShowNoDevices
{
  v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"CHOOSE_NO_DEVICES_TITLE" value:&stru_1001A1DC0 table:@"Localizable"];

  v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"CHOOSE_NO_DEVICES_INFO" value:&stru_1001A1DC0 table:@"Localizable"];

  id v7 = +[UIAlertController alertControllerWithTitle:v4 message:v6 preferredStyle:1];
  uint64_t v8 = +[NSBundle mainBundle];
  uint64_t v9 = [v8 localizedStringForKey:@"OK_BUTTON_TITLE" value:&stru_1001A1DC0 table:@"Localizable"];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10011DB74;
  v12[3] = &unk_1001A11A0;
  v12[4] = self;
  uint64_t v10 = +[UIAlertAction actionWithTitle:v9 style:0 handler:v12];
  [v7 addAction:v10];
  [(ProfileDevicePickerMainController *)self presentViewController:v7 animated:1 completion:0];
  uint64_t v11 = +[NSDistributedNotificationCenter defaultCenter];
  [v11 postNotificationName:@"com.apple.sharing.DeviceProfile" object:@"com.apple.sharingd" userInfo:&off_1001A70C8 deliverImmediately:1];
}

- (void)_pickerAlertHandlePickedDevice:(id)a3
{
  id v4 = a3;
  CFDataGetTypeID();
  v5 = CFDictionaryGetTypedValue();
  if (v5)
  {
    v6 = (SFSystemSession *)objc_alloc_init((Class)SFSystemSession);
    systemSession = self->_systemSession;
    self->_systemSession = v6;

    [(SFSystemSession *)self->_systemSession setPeerDevice:v4];
    [(SFSystemSession *)self->_systemSession activate];
    uint64_t v8 = self->_systemSession;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10011DE18;
    v18[3] = &unk_1001A11C8;
    v18[4] = self;
    [(SFSystemSession *)v8 installProfileWithData:v5 completion:v18];
    uint64_t v9 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    installTimeoutTimer = self->_installTimeoutTimer;
    self->_installTimeoutTimer = v9;

    uint64_t v11 = self->_installTimeoutTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10011DEE4;
    handler[3] = &unk_1001A1BD8;
    handler[4] = self;
    dispatch_source_set_event_handler(v11, handler);
    SFDispatchTimerSet();
    dispatch_resume((dispatch_object_t)self->_installTimeoutTimer);
  }
  else
  {
    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    uint64_t v12 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    uint64_t v13 = (void *)v12;
    CFStringRef v14 = @"?";
    if (v12) {
      CFStringRef v14 = (const __CFString *)v12;
    }
    CFStringRef v20 = v14;
    v15 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v16 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-6745 userInfo:v15];
    [(ProfileDevicePickerMainController *)self _pickerAlertShowError:v16];
  }
}

- (void)_pickerAlertShow
{
  if ([(NSMutableDictionary *)self->_devices count])
  {
    unsigned int pickerFlags = self->_pickerFlags;
    if ((~pickerFlags & 3) != 0)
    {
      if (pickerFlags)
      {
        uint64_t v10 = +[NSBundle mainBundle];
        uint64_t v5 = [v10 localizedStringForKey:@"CHOOSE_APPLETV_TITLE" value:&stru_1001A1DC0 table:@"Localizable"];

        v6 = +[NSBundle mainBundle];
        id v7 = v6;
        CFStringRef v8 = @"CHOOSE_APPLETV_INFO";
      }
      else
      {
        if ((pickerFlags & 2) == 0)
        {
          uint64_t v9 = 0;
          goto LABEL_25;
        }
        uint64_t v11 = +[NSBundle mainBundle];
        uint64_t v5 = [v11 localizedStringForKey:@"CHOOSE_TITLE_HOMEPOD" value:&stru_1001A1DC0 table:@"Localizable"];

        v6 = +[NSBundle mainBundle];
        id v7 = v6;
        CFStringRef v8 = @"CHOOSE_INFO_HOMEPOD";
      }
    }
    else
    {
      id v4 = +[NSBundle mainBundle];
      uint64_t v5 = [v4 localizedStringForKey:@"CHOOSE_DEVICE_TITLE" value:&stru_1001A1DC0 table:@"Localizable"];

      v6 = +[NSBundle mainBundle];
      id v7 = v6;
      CFStringRef v8 = @"CHOOSE_DEVICE_INFO";
    }
    uint64_t v9 = [v6 localizedStringForKey:v8 value:&stru_1001A1DC0 table:@"Localizable"];

    if (v5)
    {
      if (v9)
      {
LABEL_14:
        v32 = (void *)v5;
        uint64_t v12 = +[UIAlertController alertControllerWithTitle:v5 message:v9 preferredStyle:1];
        alertController = self->_alertController;
        self->_alertController = v12;

        id v14 = objc_alloc_init((Class)NSMutableArray);
        v15 = self;
        devices = self->_devices;
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_10011E49C;
        v40[3] = &unk_1001A1150;
        id v17 = v14;
        id v41 = v17;
        [(NSMutableDictionary *)devices enumerateKeysAndObjectsUsingBlock:v40];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id obj = v17;
        id v18 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v37;
          do
          {
            for (i = 0; i != v19; i = (char *)i + 1)
            {
              if (*(void *)v37 != v20) {
                objc_enumerationMutation(obj);
              }
              v22 = *(void **)(*((void *)&v36 + 1) + 8 * i);
              uint64_t v23 = [v22 name];
              if (v23) {
                v24 = (__CFString *)v23;
              }
              else {
                v24 = @"?";
              }
              v35[0] = _NSConcreteStackBlock;
              v35[1] = 3221225472;
              v35[2] = sub_10011E51C;
              v35[3] = &unk_1001A1178;
              v35[4] = v15;
              v35[5] = v22;
              CFStringRef v25 = +[UIAlertAction actionWithTitle:v24 style:0 handler:v35];
              [(UIAlertController *)v15->_alertController addAction:v25];
            }
            id v19 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
          }
          while (v19);
        }

        v26 = +[NSBundle mainBundle];
        v27 = [v26 localizedStringForKey:@"CANCEL" value:&stru_1001A1DC0 table:@"Localizable"];

        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_10011E568;
        v34[3] = &unk_1001A11A0;
        v28 = (id *)v15;
        v34[4] = v15;
        v29 = +[UIAlertAction actionWithTitle:v27 style:1 handler:v34];
        [v28[3] addAction:v29];
        [v28 presentViewController:v28[3] animated:1 completion:0];

        return;
      }
LABEL_26:
      v31 = +[NSBundle mainBundle];
      uint64_t v9 = [v31 localizedStringForKey:@"CHOOSE_DEVICE_INFO" value:&stru_1001A1DC0 table:@"Localizable"];

      goto LABEL_14;
    }
LABEL_25:
    v30 = +[NSBundle mainBundle];
    uint64_t v5 = [v30 localizedStringForKey:@"CHOOSE_DEVICE_TITLE" value:&stru_1001A1DC0 table:@"Localizable"];

    if (v9) {
      goto LABEL_14;
    }
    goto LABEL_26;
  }

  [(ProfileDevicePickerMainController *)self _pickerAlertShowNoDevices];
}

- (void)_discoveryTimeout
{
  if (dword_1001CC830 <= 30 && (dword_1001CC830 != -1 || _LogCategory_Initialize()))
  {
    id v3 = [(NSMutableDictionary *)self->_devices count];
    LogPrintF();
  }
  [(ProfileDevicePickerMainController *)self _discoveryStop];

  [(ProfileDevicePickerMainController *)self _pickerAlertShow];
}

- (void)_discoveryFoundDevice:(id)a3
{
  id v12 = a3;
  id v4 = [v12 model];
  uint64_t v5 = v4;
  unsigned int pickerFlags = self->_pickerFlags;
  if (pickerFlags)
  {
    if ([v4 hasPrefix:@"AppleTV"])
    {
LABEL_10:
      id v7 = [v12 identifier];
      if (v7)
      {
        if (dword_1001CC830 <= 30 && (dword_1001CC830 != -1 || _LogCategory_Initialize()))
        {
          id v11 = v12;
          LogPrintF();
        }
        devices = self->_devices;
        if (!devices)
        {
          uint64_t v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          uint64_t v10 = self->_devices;
          self->_devices = v9;

          devices = self->_devices;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v12, v7, v11);
      }
      else if (dword_1001CC830 <= 60 && (dword_1001CC830 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

      goto LABEL_24;
    }
    unsigned int pickerFlags = self->_pickerFlags;
  }
  if ((pickerFlags & 2) != 0
    && (([v5 hasPrefix:@"AudioAccessory"] & 1) != 0
     || ([v5 hasPrefix:@"HomePod1,"] & 1) != 0))
  {
    goto LABEL_10;
  }
  if (dword_1001CC830 <= 9 && (dword_1001CC830 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_24:
}

- (void)_discoveryStop
{
  [(SFDeviceDiscovery *)self->_deviceDiscovery invalidate];
  deviceDiscovery = self->_deviceDiscovery;
  self->_deviceDiscovery = 0;
}

- (void)_discoveryStart
{
  id v3 = (SFDeviceDiscovery *)objc_alloc_init((Class)SFDeviceDiscovery);
  deviceDiscovery = self->_deviceDiscovery;
  self->_deviceDiscovery = v3;

  [(SFDeviceDiscovery *)self->_deviceDiscovery setDiscoveryFlags:1];
  [(SFDeviceDiscovery *)self->_deviceDiscovery setPurpose:@"ProfileDevicePicker"];
  [(SFDeviceDiscovery *)self->_deviceDiscovery setScanRate:50];
  [(SFDeviceDiscovery *)self->_deviceDiscovery setTimeout:2.0];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10011EA3C;
  v6[3] = &unk_1001A1258;
  v6[4] = self;
  [(SFDeviceDiscovery *)self->_deviceDiscovery setDeviceFoundHandler:v6];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10011EA48;
  v5[3] = &unk_1001A1BD8;
  v5[4] = self;
  [(SFDeviceDiscovery *)self->_deviceDiscovery setTimeoutHandler:v5];
  [(SFDeviceDiscovery *)self->_deviceDiscovery activateWithCompletion:&stru_1001A10E8];
}

- (void)handleButtonActions:(id)a3
{
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        if (([*(id *)(*((void *)&v9 + 1) + 8 * i) events] & 0x10) != 0)
        {
          if (dword_1001CC830 <= 30 && (dword_1001CC830 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          [(ProfileDevicePickerMainController *)self dismiss:4];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)dismiss:(int)a3
{
  if (!self->_dismissed)
  {
    self->_dismissed = 1;
    id v4 = [(ProfileDevicePickerMainController *)self _remoteViewControllerProxy];
    id v5 = v4;
    alertController = self->_alertController;
    if (alertController)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10011ED6C;
      v7[3] = &unk_1001A1BD8;
      id v8 = v4;
      [(UIAlertController *)alertController dismissViewControllerAnimated:1 completion:v7];
    }
    else
    {
      [v4 dismiss];
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC830 <= 30 && (dword_1001CC830 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(ProfileDevicePickerMainController *)self _discoveryStop];
  if (!self->_dismissed)
  {
    if (dword_1001CC830 <= 30 && (dword_1001CC830 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(ProfileDevicePickerMainController *)self dismiss:21];
  }
  v5.receiver = self;
  v5.super_class = (Class)ProfileDevicePickerMainController;
  [(SVSBaseMainController *)&v5 viewDidDisappear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC830 <= 30 && (dword_1001CC830 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)ProfileDevicePickerMainController;
  [(ProfileDevicePickerMainController *)&v5 viewDidAppear:v3];
  [(ProfileDevicePickerMainController *)self _discoveryStart];
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  uint64_t v7 = [a3 userInfo];
  userInfo = self->super._userInfo;
  self->super._userInfo = v7;

  if (dword_1001CC830 <= 30 && (dword_1001CC830 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_unsigned int pickerFlags = CFDictionaryGetInt64Ranged();
  if (v6) {
    v6[2](v6);
  }
}

@end