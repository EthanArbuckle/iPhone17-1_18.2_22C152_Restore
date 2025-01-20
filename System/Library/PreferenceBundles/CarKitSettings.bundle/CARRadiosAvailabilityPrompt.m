@interface CARRadiosAvailabilityPrompt
- (BOOL)needsPresentationConsideration;
- (BOOL)shouldPromptBluetoothPower;
- (BOOL)shouldPromptWiFiPower;
- (BOOL)updateRadiosAvailabilityAlertPresentation;
- (CARRadiosAvailabilityPrompt)init;
- (UIAlertController)presentedAlertController;
- (UIViewController)presentingController;
- (void)_setupWiFi;
- (void)_teardownWiFi;
- (void)dealloc;
- (void)handleBluetoothPowerChanged:(id)a3;
- (void)handleWifiPowerChanged;
- (void)setBluetoothPowered:(BOOL)a3;
- (void)setNeedsPresentationConsideration:(BOOL)a3;
- (void)setPresentedAlertController:(id)a3;
- (void)setPresentingController:(id)a3;
- (void)setWiFiPowered:(BOOL)a3;
@end

@implementation CARRadiosAvailabilityPrompt

- (CARRadiosAvailabilityPrompt)init
{
  v6.receiver = self;
  v6.super_class = (Class)CARRadiosAvailabilityPrompt;
  v2 = [(CARRadiosAvailabilityPrompt *)&v6 init];
  if (v2)
  {
    id v3 = +[BluetoothManager sharedInstance];
    [(CARRadiosAvailabilityPrompt *)v2 _setupWiFi];
    [(CARRadiosAvailabilityPrompt *)v2 setNeedsPresentationConsideration:1];
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"handleBluetoothPowerChanged:" name:BluetoothPowerChangedNotification object:0];
  }
  return v2;
}

- (void)_setupWiFi
{
  id v3 = (__WiFiManagerClient *)WiFiManagerClientCreate();
  self->_wifiManager = v3;
  if (v3)
  {
    id v5 = (id)WiFiManagerClientCopyDevices();
    if (v5 && [v5 count])
    {
      unint64_t v4 = 0;
      do
      {
        if ([v5 objectAtIndex:v4]) {
          WiFiDeviceClientRegisterPowerCallback();
        }
        ++v4;
      }
      while (v4 < (unint64_t)[v5 count]);
    }
    CFRunLoopGetMain();
    WiFiManagerClientScheduleWithRunLoop();
  }
}

- (void)_teardownWiFi
{
  if (self->_wifiManager)
  {
    id v4 = (id)WiFiManagerClientCopyDevices();
    if (v4 && [v4 count])
    {
      unint64_t v3 = 0;
      do
      {
        if ([v4 objectAtIndex:v3]) {
          WiFiDeviceClientRegisterPowerCallback();
        }
        ++v3;
      }
      while (v3 < (unint64_t)[v4 count]);
    }
    CFRunLoopGetMain();
    WiFiManagerClientUnscheduleFromRunLoop();
    CFRelease(self->_wifiManager);
  }
}

- (void)dealloc
{
  unint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(CARRadiosAvailabilityPrompt *)self _teardownWiFi];
  v4.receiver = self;
  v4.super_class = (Class)CARRadiosAvailabilityPrompt;
  [(CARRadiosAvailabilityPrompt *)&v4 dealloc];
}

- (void)setPresentingController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingController, a3);
  if (a3 && [(CARRadiosAvailabilityPrompt *)self needsPresentationConsideration])
  {
    [(CARRadiosAvailabilityPrompt *)self updateRadiosAvailabilityAlertPresentation];
  }
}

- (BOOL)shouldPromptBluetoothPower
{
  v2 = +[BluetoothManager sharedInstance];
  unsigned int v3 = [v2 available];

  if (!v3) {
    return 0;
  }
  objc_super v4 = +[BluetoothManager sharedInstance];
  BOOL v5 = [v4 powerState] == 0;

  return v5;
}

- (void)setBluetoothPowered:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[BluetoothManager sharedInstance];
  [v4 setPowered:v3];
}

- (BOOL)shouldPromptWiFiPower
{
  wifiManager = self->_wifiManager;
  if (wifiManager) {
    LOBYTE(wifiManager) = WiFiManagerClientGetPower() == 0;
  }
  return (char)wifiManager;
}

- (void)setWiFiPowered:(BOOL)a3
{
  if (self->_wifiManager) {
    _WiFiManagerClientSetPower();
  }
}

- (BOOL)updateRadiosAvailabilityAlertPresentation
{
  [(CARRadiosAvailabilityPrompt *)self setNeedsPresentationConsideration:0];
  unsigned int v3 = [(CARRadiosAvailabilityPrompt *)self shouldPromptBluetoothPower];
  unsigned int v4 = [(CARRadiosAvailabilityPrompt *)self shouldPromptWiFiPower];
  char v5 = v4;
  if (v3 && v4) {
    goto LABEL_3;
  }
  if (v3)
  {
    v12 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = [v12 localizedStringForKey:@"POWER_BLUETOOTH_TITLE" value:&stru_24F60 table:@"Alerts"];

    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = [v9 localizedStringForKey:@"POWER_ENABLE_BLUETOOTH_BUTTON" value:&stru_24F60 table:@"Alerts"];
LABEL_6:

    v13 = [(CARRadiosAvailabilityPrompt *)self presentingController];

    if (v13)
    {
      v14 = +[NSBundle bundleForClass:objc_opt_class()];
      v15 = [v14 localizedStringForKey:@"POWER_MESSAGE" value:&stru_24F60 table:@"Alerts"];

      v16 = +[NSBundle bundleForClass:objc_opt_class()];
      v17 = [v16 localizedStringForKey:@"POWER_CANCEL_BUTTON" value:&stru_24F60 table:@"Alerts"];

      BOOL v18 = 1;
      v19 = +[UIAlertController alertControllerWithTitle:v8 message:v15 preferredStyle:1];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_8FEC;
      v28[3] = &unk_24950;
      char v29 = v3;
      v28[4] = self;
      char v30 = v5;
      v20 = +[UIAlertAction actionWithTitle:v11 style:0 handler:v28];
      [v19 addAction:v20];

      v21 = +[UIAlertAction actionWithTitle:v17 style:1 handler:&stru_24990];
      [v19 addAction:v21];

      v22 = [(CARRadiosAvailabilityPrompt *)self presentingController];
      [v22 presentViewController:v19 animated:1 completion:0];

      [(CARRadiosAvailabilityPrompt *)self setPresentedAlertController:v19];
    }
    else
    {
      BOOL v18 = 1;
      [(CARRadiosAvailabilityPrompt *)self setNeedsPresentationConsideration:1];
    }
    return v18;
  }
  if (v4)
  {
LABEL_3:
    objc_super v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = SFLocalizableWAPIStringKeyForKey();
    v8 = [v6 localizedStringForKey:v7 value:&stru_24F60 table:@"Alerts"];

    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = SFLocalizableWAPIStringKeyForKey();
    v11 = [v9 localizedStringForKey:v10 value:&stru_24F60 table:@"Alerts"];

    goto LABEL_6;
  }
  uint64_t v23 = [(CARRadiosAvailabilityPrompt *)self presentingController];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(CARRadiosAvailabilityPrompt *)self presentedAlertController];

    if (v25)
    {
      v26 = [(CARRadiosAvailabilityPrompt *)self presentingController];
      [v26 dismissViewControllerAnimated:1 completion:0];
    }
  }
  return 0;
}

- (void)handleBluetoothPowerChanged:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_90D0;
  block[3] = &unk_24818;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)handleWifiPowerChanged
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9184;
  block[3] = &unk_24818;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (UIViewController)presentingController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingController);

  return (UIViewController *)WeakRetained;
}

- (BOOL)needsPresentationConsideration
{
  return self->_needsPresentationConsideration;
}

- (void)setNeedsPresentationConsideration:(BOOL)a3
{
  self->_needsPresentationConsideration = a3;
}

- (UIAlertController)presentedAlertController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedAlertController);

  return (UIAlertController *)WeakRetained;
}

- (void)setPresentedAlertController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentedAlertController);

  objc_destroyWeak((id *)&self->_presentingController);
}

@end