@interface HSNetworkInterfaceManager
- (CBController)bluetoothController;
- (CWFInterface)wifiInterface;
- (HSNetworkInterfaceManager)initWithAlertHostViewController:(id)a3;
- (UIAlertController)enableBluetoothAndWiFiAlertController;
- (UIViewController)alertHostViewController;
- (id)_alertBaseLocalizationKeyForRequestBluetooth:(BOOL)a3 Wifi:(BOOL)a4;
- (id)_alertLocalizedDescriptionForRequestBluetooth:(BOOL)a3 Wifi:(BOOL)a4;
- (id)_alertLocalizedTitleForRequestBluetooth:(BOOL)a3 Wifi:(BOOL)a4;
- (unint64_t)_wiFiInterfaceStatus;
- (unint64_t)bluetoothInterfaceStatus;
- (unint64_t)wiFiInterfaceStatus;
- (void)_setBluetoothPowerState:(BOOL)a3;
- (void)_setWiFiPowerState:(BOOL)a3 autoJoinDisabled:(BOOL)a4;
- (void)_updateAlertForBluetooth:(BOOL)a3 Wifi:(BOOL)a4;
- (void)_updateBluetoothInterfaceStatusWithCompletion:(id)a3;
- (void)checkNetworkStatusAndShowAlertIfNeededForBluetooth:(BOOL)a3 Wifi:(BOOL)a4;
- (void)dealloc;
- (void)setAlertHostViewController:(id)a3;
- (void)setBluetoothController:(id)a3;
- (void)setBluetoothInterfaceStatus:(unint64_t)a3;
- (void)setEnableBluetoothAndWiFiAlertController:(id)a3;
- (void)setNetworkInterfacePowerState:(BOOL)a3;
- (void)setWifiInterface:(id)a3;
@end

@implementation HSNetworkInterfaceManager

- (HSNetworkInterfaceManager)initWithAlertHostViewController:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HSNetworkInterfaceManager;
  v5 = [(HSNetworkInterfaceManager *)&v12 init];
  v6 = v5;
  if (v5)
  {
    v5->_bluetoothInterfaceStatus = 0;
    v7 = (CBController *)objc_alloc_init((Class)CBController);
    bluetoothController = v6->_bluetoothController;
    v6->_bluetoothController = v7;

    v9 = (CWFInterface *)objc_alloc_init((Class)CWFInterface);
    wifiInterface = v6->_wifiInterface;
    v6->_wifiInterface = v9;

    objc_storeWeak((id *)&v6->_alertHostViewController, v4);
  }

  return v6;
}

- (void)checkNetworkStatusAndShowAlertIfNeededForBluetooth:(BOOL)a3 Wifi:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (a3 || a4)
  {
    if (a4)
    {
      v7 = [(HSNetworkInterfaceManager *)self wifiInterface];
      [v7 activate];
    }
    if (v5)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100046864;
      v8[3] = &unk_1000AAD50;
      v8[4] = self;
      BOOL v9 = v5;
      BOOL v10 = v4;
      [(HSNetworkInterfaceManager *)self _updateBluetoothInterfaceStatusWithCompletion:v8];
    }
    else
    {
      [(HSNetworkInterfaceManager *)self _updateAlertForBluetooth:0 Wifi:v4];
    }
  }
}

- (void)dealloc
{
  [(CWFInterface *)self->_wifiInterface invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HSNetworkInterfaceManager;
  [(HSNetworkInterfaceManager *)&v3 dealloc];
}

- (void)setNetworkInterfacePowerState:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  unint64_t v6 = [(HSNetworkInterfaceManager *)self bluetoothInterfaceStatus];
  unint64_t v7 = [(HSNetworkInterfaceManager *)self _wiFiInterfaceStatus];
  if (v6 && v6 != v5) {
    [(HSNetworkInterfaceManager *)self _setBluetoothPowerState:v3];
  }
  if (v7 && v7 != v5)
  {
    [(HSNetworkInterfaceManager *)self _setWiFiPowerState:v3 autoJoinDisabled:v3 ^ 1];
  }
}

- (void)_updateBluetoothInterfaceStatusWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HSNetworkInterfaceManager *)self bluetoothController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100046A20;
  v7[3] = &unk_1000AAD78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getPowerStateWithCompletion:v7];
}

- (void)_setBluetoothPowerState:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HSNetworkInterfaceManager *)self bluetoothController];
  id v6 = v4;
  if (v3) {
    uint64_t v5 = 5;
  }
  else {
    uint64_t v5 = 4;
  }
  [v4 setPowerState:v5 completion:&stru_1000AADB8];
}

- (unint64_t)_wiFiInterfaceStatus
{
  BOOL v3 = [(HSNetworkInterfaceManager *)self wifiInterface];
  if ([v3 powerOn])
  {
    id v4 = [(HSNetworkInterfaceManager *)self wifiInterface];
    if ([v4 userAutoJoinDisabled]) {
      unint64_t v5 = 1;
    }
    else {
      unint64_t v5 = 2;
    }
  }
  else
  {
    unint64_t v5 = 1;
  }

  return v5;
}

- (void)_setWiFiPowerState:(BOOL)a3 autoJoinDisabled:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  unint64_t v7 = [(HSNetworkInterfaceManager *)self wifiInterface];
  id v14 = 0;
  [v7 setPower:v5 error:&v14];
  id v8 = v14;

  BOOL v9 = [(HSNetworkInterfaceManager *)self wifiInterface];
  id v13 = 0;
  [v9 setUserAutoJoinDisabled:v4 error:&v13];
  id v10 = v13;

  if (v8)
  {
    v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100067FF8();
    }
  }
  if (v10)
  {
    objc_super v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100067F84();
    }
  }
}

- (void)_updateAlertForBluetooth:(BOOL)a3 Wifi:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v7 = (id)[(HSNetworkInterfaceManager *)self bluetoothInterfaceStatus] == (id)1 && v5;
  BOOL v8 = (id)[(HSNetworkInterfaceManager *)self _wiFiInterfaceStatus] == (id)1 && v4;
  BOOL v9 = [(HSNetworkInterfaceManager *)self _alertLocalizedTitleForRequestBluetooth:v7 Wifi:v8];
  id v10 = [(HSNetworkInterfaceManager *)self _alertLocalizedDescriptionForRequestBluetooth:v7 Wifi:v8];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000470F0;
  v34[3] = &unk_1000A9560;
  id v11 = v9;
  id v35 = v11;
  v36 = self;
  id v12 = v10;
  id v37 = v12;
  id v13 = objc_retainBlock(v34);
  uint64_t v14 = [(HSNetworkInterfaceManager *)self enableBluetoothAndWiFiAlertController];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(HSNetworkInterfaceManager *)self alertHostViewController];
    v17 = [v16 presentedViewController];
    v18 = [(HSNetworkInterfaceManager *)self enableBluetoothAndWiFiAlertController];

    if (v17 == v18)
    {
      if (v7 || v8)
      {
        if (!v8 && !v7) {
          goto LABEL_22;
        }
        ((void (*)(void *))v13[2])(v13);
        if (!v11 || !v12) {
          goto LABEL_22;
        }
        v29 = [(HSNetworkInterfaceManager *)self enableBluetoothAndWiFiAlertController];
        [v29 setTitle:v11];

        v30 = [(HSNetworkInterfaceManager *)self enableBluetoothAndWiFiAlertController];
        [v30 setMessage:v12];
      }
      else
      {
        v30 = [(HSNetworkInterfaceManager *)self alertHostViewController];
        [v30 dismissViewControllerAnimated:1 completion:0];
      }

      goto LABEL_22;
    }
  }
  v19 = [(HSNetworkInterfaceManager *)self enableBluetoothAndWiFiAlertController];
  if (v19)
  {
  }
  else if (v7 || v8)
  {
    ((void (*)(void *))v13[2])(v13);
    if (v11)
    {
      if (v12)
      {
        v20 = +[UIAlertController alertControllerWithTitle:v11 message:v12 preferredStyle:1];
        [(HSNetworkInterfaceManager *)self setEnableBluetoothAndWiFiAlertController:v20];

        v21 = [(HSNetworkInterfaceManager *)self enableBluetoothAndWiFiAlertController];
        v22 = sub_100060C64(@"HSBluetoothAndWiFiAlertDontTurnOnAction");
        v23 = +[UIAlertAction actionWithTitle:v22 style:1 handler:&stru_1000AADD8];
        [v21 addAction:v23];

        objc_initWeak(&location, self);
        v24 = [(HSNetworkInterfaceManager *)self enableBluetoothAndWiFiAlertController];
        v25 = sub_100060C64(@"HSBluetoothAndWiFiAlertTurnOnAction");
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_100047174;
        v31[3] = &unk_1000AAE00;
        objc_copyWeak(&v32, &location);
        v26 = +[UIAlertAction actionWithTitle:v25 style:0 handler:v31];
        [v24 addAction:v26];

        v27 = [(HSNetworkInterfaceManager *)self alertHostViewController];
        v28 = [(HSNetworkInterfaceManager *)self enableBluetoothAndWiFiAlertController];
        [v27 presentViewController:v28 animated:1 completion:0];

        objc_destroyWeak(&v32);
        objc_destroyWeak(&location);
      }
    }
  }
LABEL_22:
}

- (id)_alertLocalizedTitleForRequestBluetooth:(BOOL)a3 Wifi:(BOOL)a4
{
  BOOL v4 = [(HSNetworkInterfaceManager *)self _alertBaseLocalizationKeyForRequestBluetooth:a3 Wifi:a4];
  if (v4)
  {
    BOOL v5 = +[NSString stringWithFormat:@"%@_Title", v4];
    id v6 = sub_100060C64(v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_alertLocalizedDescriptionForRequestBluetooth:(BOOL)a3 Wifi:(BOOL)a4
{
  BOOL v4 = [(HSNetworkInterfaceManager *)self _alertBaseLocalizationKeyForRequestBluetooth:a3 Wifi:a4];
  if (v4)
  {
    BOOL v5 = +[NSString stringWithFormat:@"%@_Description", v4];
    id v6 = sub_100060C64(v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_alertBaseLocalizationKeyForRequestBluetooth:(BOOL)a3 Wifi:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  unsigned int v6 = +[HFUtilities useWLANInsteadOfWiFi];
  if (v5 && v4)
  {
    BOOL v7 = @"HSBluetoothAndWiFiAlertTurnOnWiFiAndBluetooth";
    CFStringRef v8 = @"HSBluetoothAndWiFiAlertTurnOnWLANAndBluetooth";
  }
  else
  {
    if (!v4)
    {
      if (v5) {
        BOOL v9 = @"HSBluetoothAndWiFiAlertTurnOnBluetooth";
      }
      else {
        BOOL v9 = 0;
      }
      goto LABEL_12;
    }
    BOOL v7 = @"HSBluetoothAndWiFiAlertTurnOnWiFi";
    CFStringRef v8 = @"HSBluetoothAndWiFiAlertTurnOnWLAN";
  }
  if (v6) {
    BOOL v7 = (__CFString *)v8;
  }
  BOOL v9 = v7;
LABEL_12:

  return v9;
}

- (unint64_t)bluetoothInterfaceStatus
{
  return self->_bluetoothInterfaceStatus;
}

- (void)setBluetoothInterfaceStatus:(unint64_t)a3
{
  self->_bluetoothInterfaceStatus = a3;
}

- (unint64_t)wiFiInterfaceStatus
{
  return self->_wiFiInterfaceStatus;
}

- (CBController)bluetoothController
{
  return self->_bluetoothController;
}

- (void)setBluetoothController:(id)a3
{
}

- (CWFInterface)wifiInterface
{
  return self->_wifiInterface;
}

- (void)setWifiInterface:(id)a3
{
}

- (UIViewController)alertHostViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertHostViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setAlertHostViewController:(id)a3
{
}

- (UIAlertController)enableBluetoothAndWiFiAlertController
{
  return self->_enableBluetoothAndWiFiAlertController;
}

- (void)setEnableBluetoothAndWiFiAlertController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enableBluetoothAndWiFiAlertController, 0);
  objc_destroyWeak((id *)&self->_alertHostViewController);
  objc_storeStrong((id *)&self->_wifiInterface, 0);

  objc_storeStrong((id *)&self->_bluetoothController, 0);
}

@end