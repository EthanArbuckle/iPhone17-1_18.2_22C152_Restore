@interface ASTBluetoothDevicesController
- (ASTBluetoothDevicesController)init;
- (AXMouseEventListener)mouseEventListener;
- (BOOL)shouldAddClassicDevice:(id)a3;
- (id)_customizableMouseForDevice:(id)a3;
- (id)allowedServices;
- (id)bluetoothPowerAlertMessage;
- (id)detailSpecifiersForDevice:(id)a3 withTarget:(id)a4;
- (id)devicesGroupName;
- (int64_t)axDeviceControllerType;
- (void)powerAlertCancelled;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation ASTBluetoothDevicesController

- (int64_t)axDeviceControllerType
{
  return 3;
}

- (ASTBluetoothDevicesController)init
{
  v5.receiver = self;
  v5.super_class = (Class)ASTBluetoothDevicesController;
  v2 = [(AXBluetoothDevicesController *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(AXBluetoothDevicesController *)v2 setAuthorizedServices:32];
    [(ASTBluetoothDevicesController *)v3 mouseEventListener];
  }
  return v3;
}

- (AXMouseEventListener)mouseEventListener
{
  mouseEventListener = self->_mouseEventListener;
  if (!mouseEventListener)
  {
    v4 = +[AXMouseEventListener sharedInstance];
    objc_super v5 = self->_mouseEventListener;
    self->_mouseEventListener = v4;

    mouseEventListener = self->_mouseEventListener;
  }

  return mouseEventListener;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ASTBluetoothDevicesController;
  [(AXBluetoothDevicesController *)&v4 viewDidAppear:a3];
  [(AXBluetoothDevicesController *)self setScanningEnabled:1];
  [(AXBluetoothDevicesController *)self showBluetoothPowerAlert:1];
}

- (void)powerAlertCancelled
{
  id v3 = [(ASTBluetoothDevicesController *)self rootController];
  id v2 = [v3 popViewControllerAnimated:1];
}

- (id)bluetoothPowerAlertMessage
{
  return settingsLocString(@"BluetoothRequiredMessage", @"HandSettings");
}

- (id)devicesGroupName
{
  return settingsLocString(@"BluetoothDevicesLabel", @"HandSettings");
}

- (id)allowedServices
{
  id v2 = +[CBUUID UUIDWithString:CBUUIDHumanInterfaceDeviceServiceString];
  objc_super v5 = v2;
  id v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (id)detailSpecifiersForDevice:(id)a3 withTarget:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(ASTBluetoothDevicesController *)self _customizableMouseForDevice:v6];
  if (v8)
  {
    v9 = [(ASTBluetoothDevicesController *)self loadSpecifiersFromPlistName:@"ASTMouseDeviceConfig" target:v7];
    v10 = +[NSArray arrayWithArray:v9];

    v11 = [v10 objectAtIndex:1];
    v15[0] = @"AX_CUSTOMIZABLE_MOUSE_KEY";
    v15[1] = @"AX_CUSTOMIZABLE_MOUSE_IS_CONNECTED_KEY";
    v16[0] = v8;
    v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 connected]);
    v16[1] = v12;
    v13 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
    [v11 setUserInfo:v13];
  }
  else
  {
    v10 = &__NSArray0__struct;
  }

  return v10;
}

- (id)_customizableMouseForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__1;
  v33 = __Block_byref_object_dispose__1;
  id v34 = 0;
  objc_super v5 = [(ASTBluetoothDevicesController *)self mouseEventListener];
  id v6 = [v5 discoveredMouseDevices];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = __61__ASTBluetoothDevicesController__customizableMouseForDevice___block_invoke;
  v26[3] = &unk_209A58;
  id v7 = v4;
  id v27 = v7;
  v28 = &v29;
  [v6 enumerateObjectsUsingBlock:v26];

  if (!v30[5] && [v7 isClassicDevice])
  {
    v8 = [(ASTBluetoothDevicesController *)self mouseEventListener];
    v9 = [v8 discoveredMouseDevices];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = __61__ASTBluetoothDevicesController__customizableMouseForDevice___block_invoke_2;
    v23[3] = &unk_209A58;
    id v24 = v7;
    v25 = &v29;
    [v9 enumerateObjectsUsingBlock:v23];
  }
  if (!v30[5])
  {
    v10 = +[AXSettings sharedInstance];
    v11 = [v10 assistiveTouchMouseCustomizedClickActions];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __61__ASTBluetoothDevicesController__customizableMouseForDevice___block_invoke_3;
    v20[3] = &unk_209A58;
    id v12 = v7;
    id v21 = v12;
    v22 = &v29;
    [v11 enumerateObjectsUsingBlock:v20];

    if (!v30[5])
    {
      if ([v12 isClassicDevice])
      {
        v13 = +[AXSettings sharedInstance];
        v14 = [v13 assistiveTouchMouseCustomizedClickActions];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = __61__ASTBluetoothDevicesController__customizableMouseForDevice___block_invoke_4;
        v17[3] = &unk_209A58;
        id v18 = v12;
        v19 = &v29;
        [v14 enumerateObjectsUsingBlock:v17];
      }
    }
  }
  id v15 = (id)v30[5];

  _Block_object_dispose(&v29, 8);

  return v15;
}

void __61__ASTBluetoothDevicesController__customizableMouseForDevice___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = [v10 identifier];
  v8 = [*(id *)(a1 + 32) identifier];
  unsigned int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __61__ASTBluetoothDevicesController__customizableMouseForDevice___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  unsigned int v7 = [*(id *)(a1 + 32) vendorId];
  if ([v9 vendorId] == (id)v7)
  {
    unsigned int v8 = [*(id *)(a1 + 32) productId];
    if ([v9 productId] == (id)v8)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }
  }
}

void __61__ASTBluetoothDevicesController__customizableMouseForDevice___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  unsigned int v7 = [v10 identifier];
  unsigned int v8 = [*(id *)(a1 + 32) identifier];
  unsigned int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __61__ASTBluetoothDevicesController__customizableMouseForDevice___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  unsigned int v7 = [*(id *)(a1 + 32) vendorId];
  if ([v9 vendorId] == (id)v7)
  {
    unsigned int v8 = [*(id *)(a1 + 32) productId];
    if ([v9 productId] == (id)v8)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }
  }
}

- (BOOL)shouldAddClassicDevice:(id)a3
{
  id v3 = a3;
  if ([v3 isAppleHIDDevice])
  {
    id v4 = +[AXSettings sharedInstance];
    unsigned __int8 v5 = [v4 assistiveTouchMouseAllowAppleBluetoothDevicesPairing];

    if ((v5 & 1) == 0)
    {
      unsigned int v8 = ASTLogMouse();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v3;
LABEL_14:
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Not allowing device: %@", (uint8_t *)&v11, 0xCu);
      }
LABEL_15:
      BOOL v9 = 0;
      goto LABEL_16;
    }
  }
  if ([v3 type] != 25 && objc_msgSend(v3, "type") != 24)
  {
    if ([v3 type] != 29
      || (+[AXSettings sharedInstance],
          id v6 = objc_claimAutoreleasedReturnValue(),
          unsigned int v7 = [v6 assistiveTouchMouseAllowAppleBluetoothDevicesPairing],
          v6,
          !v7))
    {
      unsigned int v8 = ASTLogMouse();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v3;
        goto LABEL_14;
      }
      goto LABEL_15;
    }
  }
  unsigned int v8 = ASTLogMouse();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Allowing device: %@", (uint8_t *)&v11, 0xCu);
  }
  BOOL v9 = 1;
LABEL_16:

  return v9;
}

- (void).cxx_destruct
{
}

@end