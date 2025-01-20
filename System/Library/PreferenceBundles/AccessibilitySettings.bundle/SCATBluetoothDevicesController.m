@interface SCATBluetoothDevicesController
- (BOOL)shouldAddClassicDevice:(id)a3;
- (SCATBluetoothDevicesController)init;
- (id)allowedServices;
- (id)bluetoothPowerAlertMessage;
- (id)bluetoothPoweredOffFooter;
- (id)devicesGroupName;
- (int64_t)axDeviceControllerType;
- (void)powerAlertCancelled;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SCATBluetoothDevicesController

- (SCATBluetoothDevicesController)init
{
  v5.receiver = self;
  v5.super_class = (Class)SCATBluetoothDevicesController;
  v2 = [(AXBluetoothDevicesController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(AXBluetoothDevicesController *)v2 setAuthorizedServices:32];
  }
  return v3;
}

- (int64_t)axDeviceControllerType
{
  return 2;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCATBluetoothDevicesController;
  [(AXBluetoothDevicesController *)&v4 viewDidAppear:a3];
  [(AXBluetoothDevicesController *)self setScanningEnabled:1];
  [(AXBluetoothDevicesController *)self showBluetoothPowerAlert:1];
}

- (void)powerAlertCancelled
{
  id v3 = [(SCATBluetoothDevicesController *)self rootController];
  id v2 = [v3 popViewControllerAnimated:1];
}

- (id)allowedServices
{
  id v2 = +[CBUUID UUIDWithString:CBUUIDHumanInterfaceDeviceServiceString];
  objc_super v5 = v2;
  id v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (BOOL)shouldAddClassicDevice:(id)a3
{
  id v3 = a3;
  if ([v3 isAppleHIDDevice])
  {
    objc_super v4 = +[AXSettings sharedInstance];
    unsigned __int8 v5 = [v4 assistiveTouchMouseAllowAppleBluetoothDevicesPairing];

    if ((v5 & 1) == 0)
    {
      v8 = SWCHLogHW();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v3;
LABEL_13:
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Not allowing device: %@", (uint8_t *)&v12, 0xCu);
      }
LABEL_14:
      BOOL v9 = 0;
      goto LABEL_15;
    }
  }
  if ([v3 type] != 25 && objc_msgSend(v3, "type") != 24)
  {
    if ([v3 type] != 29
      || (+[AXSettings sharedInstance],
          v6 = objc_claimAutoreleasedReturnValue(),
          unsigned int v7 = [v6 assistiveTouchMouseAllowAppleBluetoothDevicesPairing],
          v6,
          !v7))
    {
      unsigned int v11 = [v3 type];
      if (v11 == 26 || v11 == 4)
      {
        v8 = SWCHLogHW();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_10;
        }
        int v12 = 138412290;
        id v13 = v3;
        goto LABEL_9;
      }
      v8 = SWCHLogHW();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v3;
        goto LABEL_13;
      }
      goto LABEL_14;
    }
  }
  v8 = SWCHLogHW();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v3;
LABEL_9:
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Allowing device: %@", (uint8_t *)&v12, 0xCu);
  }
LABEL_10:
  BOOL v9 = 1;
LABEL_15:

  return v9;
}

- (id)devicesGroupName
{
  return (id)AXParameterizedLocalizedString();
}

- (id)bluetoothPoweredOffFooter
{
  return (id)AXParameterizedLocalizedString();
}

- (id)bluetoothPowerAlertMessage
{
  return (id)AXParameterizedLocalizedString();
}

@end