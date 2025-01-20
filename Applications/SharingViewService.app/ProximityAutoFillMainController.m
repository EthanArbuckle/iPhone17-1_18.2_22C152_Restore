@interface ProximityAutoFillMainController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (BOOL)prefHideTTR;
- (BOOL)prefSkipAuth;
- (NSString)deviceAddress;
- (NSUUID)deviceIdentifier;
- (UIStoryboard)mainStoryboard;
- (id)deviceForSession;
- (int64_t)testMode;
- (unint64_t)badPINCount;
- (unint64_t)supportedInterfaceOrientations;
- (void)_deviceFound:(id)a3;
- (void)_handlePairingFinished;
- (void)_handlePromptForPINWithFlags:(unsigned int)a3 throttleSeconds:(int)a4;
- (void)_handleVisualAuthEvent:(int64_t)a3;
- (void)_handleVisualAuthScannedCode:(id)a3;
- (void)_tryPIN:(id)a3;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)deviceDiscoveryStart;
- (void)deviceDiscoveryStop;
- (void)dismiss:(int)a3;
- (void)dismiss:(int)a3 completion:(id)a4;
- (void)ensureStoppedWithDismiss:(BOOL)a3;
- (void)ensureStoppedWithDismiss:(BOOL)a3 reason:(int)a4;
- (void)fileRadar:(id)a3;
- (void)handleButtonActions:(id)a3;
- (void)handlePasswordPicked:(id)a3;
- (void)passwordViewController:(id)a3 selectedCredential:(id)a4;
- (void)passwordViewControllerDidFinish:(id)a3;
- (void)sessionStart;
- (void)sessionStop;
- (void)setBadPINCount:(unint64_t)a3;
- (void)setDeviceAddress:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setMainStoryboard:(id)a3;
- (void)setPrefSkipAuth:(BOOL)a3;
- (void)setTestMode:(int64_t)a3;
- (void)showAuthenticateUI;
- (void)showDoneUI:(id)a3;
- (void)showPairingUIWithFlags:(unsigned int)a3 throttleSeconds:(int)a4;
- (void)showPasswordPickerUI;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ProximityAutoFillMainController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainStoryboard, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceAddress, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_associatedDomains, 0);
  objc_storeStrong((id *)&self->_unlocalizedAppName, 0);
  objc_storeStrong((id *)&self->_vcVisualAuthParent, 0);
  objc_storeStrong((id *)&self->_vcVisualAuth, 0);
  objc_storeStrong((id *)&self->_vcStart, 0);
  objc_storeStrong((id *)&self->_vcPicker, 0);
  objc_storeStrong((id *)&self->_vcNav, 0);
  objc_storeStrong((id *)&self->_vcDone, 0);
  objc_storeStrong((id *)&self->_vcAuth, 0);
  objc_storeStrong((id *)&self->_pin, 0);
  objc_storeStrong((id *)&self->_pickedPassword, 0);
  objc_storeStrong((id *)&self->_pickedUsername, 0);
  objc_storeStrong((id *)&self->_peerContactID, 0);
  objc_storeStrong((id *)&self->_localizedAppName, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);
  objc_storeStrong(&self->_credentialsHandler, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_authContext, 0);

  objc_storeStrong((id *)&self->_autoFillSession, 0);
}

- (void)setTestMode:(int64_t)a3
{
  self->_testMode = a3;
}

- (int64_t)testMode
{
  return self->_testMode;
}

- (void)setPrefSkipAuth:(BOOL)a3
{
  self->_prefSkipAuth = a3;
}

- (BOOL)prefSkipAuth
{
  return self->_prefSkipAuth;
}

- (BOOL)prefHideTTR
{
  return self->_prefHideTTR;
}

- (void)setMainStoryboard:(id)a3
{
}

- (UIStoryboard)mainStoryboard
{
  return self->_mainStoryboard;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceAddress:(id)a3
{
}

- (NSString)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setBadPINCount:(unint64_t)a3
{
  self->_badPINCount = a3;
}

- (unint64_t)badPINCount
{
  return self->_badPINCount;
}

- (void)_tryPIN:(id)a3
{
  v7 = (__CFString *)a3;
  if (dword_1001CC8A0 <= 30 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize()))
  {
    int v4 = IsAppleInternalBuild();
    CFStringRef v5 = @"*";
    if (v4) {
      CFStringRef v5 = v7;
    }
    CFStringRef v6 = v5;
    LogPrintF();
  }
  -[SFRemoteAutoFillSession tryPIN:](self->_autoFillSession, "tryPIN:", v7, v6);
}

- (void)_handlePromptForPINWithFlags:(unsigned int)a3 throttleSeconds:(int)a4
{
  if (self->_pin)
  {
    if (dword_1001CC8A0 <= 30 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    pin = self->_pin;
    [(ProximityAutoFillMainController *)self _tryPIN:pin];
  }
  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10011F504;
    v6[3] = &unk_1001A16B0;
    v6[4] = self;
    unsigned int v7 = a3;
    int v8 = a4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)_handlePairingFinished
{
  if (self->_vcVisualAuth)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10011F598;
    block[3] = &unk_1001A1BD8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)sessionStop
{
  if (self->_autoFillSession)
  {
    if (dword_1001CC8A0 <= 50 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SFRemoteAutoFillSession *)self->_autoFillSession invalidate];
    autoFillSession = self->_autoFillSession;
    self->_autoFillSession = 0;
  }
}

- (void)sessionStart
{
  v3 = [(ProximityAutoFillMainController *)self deviceForSession];
  if (v3)
  {
    if (dword_1001CC8A0 <= 50 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize()))
    {
      int v8 = v3;
      LogPrintF();
    }
    autoFillSession = self->_autoFillSession;
    if (autoFillSession)
    {
      [(SFRemoteAutoFillSession *)autoFillSession invalidate];
    }
    else
    {
      CFStringRef v5 = (SFRemoteAutoFillSession *)objc_alloc_init((Class)SFRemoteAutoFillSession);
      CFStringRef v6 = self->_autoFillSession;
      self->_autoFillSession = v5;
    }
    -[SFRemoteAutoFillSession setDispatchQueue:](self->_autoFillSession, "setDispatchQueue:", self->_workQueue, v8);
    [(SFRemoteAutoFillSession *)self->_autoFillSession setPeerDevice:v3];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10011F9E4;
    v11[3] = &unk_1001A1BD8;
    v11[4] = self;
    [(SFRemoteAutoFillSession *)self->_autoFillSession setPairingFinishedHandler:v11];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10011F9EC;
    v10[3] = &unk_1001A12F0;
    v10[4] = self;
    [(SFRemoteAutoFillSession *)self->_autoFillSession setPromptForPickerHandler:v10];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10011FB4C;
    v9[3] = &unk_1001A1B60;
    v9[4] = self;
    [(SFRemoteAutoFillSession *)self->_autoFillSession setPromptForPINHandler:v9];
    [(SFRemoteAutoFillSession *)self->_autoFillSession activate];
  }
  else
  {
    if (dword_1001CC8A0 <= 60 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    unsigned int v7 = NSErrorWithOSStatusF();
    [(ProximityAutoFillMainController *)self showDoneUI:v7];
  }
}

- (void)passwordViewController:(id)a3 selectedCredential:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_1001CC8A0 <= 30 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  vcPicker = self->_vcPicker;
  v9 = (_SFAppAutoFillPasswordViewController *)v6;
  v10 = vcPicker;
  if (v10 == v9)
  {
  }
  else
  {
    v11 = v10;
    if ((v9 == 0) != (v10 != 0))
    {
      unsigned __int8 v12 = [(_SFAppAutoFillPasswordViewController *)v9 isEqual:v10];

      if (v12) {
        goto LABEL_15;
      }
    }
    else
    {
    }
    if (dword_1001CC8A0 <= 60 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
LABEL_15:
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011FE20;
  block[3] = &unk_1001A1B88;
  block[4] = self;
  id v15 = v7;
  id v13 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)passwordViewControllerDidFinish:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (dword_1001CC8A0 <= 30)
  {
    id v5 = v3;
    if (dword_1001CC8A0 != -1 || (v3 = (id)_LogCategory_Initialize(), id v4 = v5, v3))
    {
      id v3 = (id)LogPrintF();
      id v4 = v5;
    }
  }

  _objc_release_x1(v3, v4);
}

- (id)deviceForSession
{
  if (self->_deviceIdentifier)
  {
    id v3 = (SFDevice *)objc_alloc_init((Class)SFDevice);
    [(SFDevice *)v3 setIdentifier:self->_deviceIdentifier];
    if (self->_peerContactID) {
      -[SFDevice setContactIdentifier:](v3, "setContactIdentifier:");
    }
  }
  else if (self->_deviceAddress && (device = self->_device) != 0)
  {
    id v3 = device;
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)_deviceFound:(id)a3
{
  id v17 = a3;
  id v4 = [v17 bleDevice];
  id v5 = [v4 advertisementFields];
  id v6 = [v5 objectForKeyedSubscript:@"bdAddr"];

  if (v6)
  {
    id v7 = SFHexStringForData();
    int v8 = +[NSCharacterSet symbolCharacterSet];
    v9 = [v7 stringByTrimmingCharactersInSet:v8];

    deviceAddress = self->_deviceAddress;
    v11 = v9;
    unsigned __int8 v12 = deviceAddress;
    if (v11 == v12)
    {
    }
    else
    {
      id v13 = v12;
      if ((v11 == 0) == (v12 != 0))
      {

        device = (SFDevice *)v11;
LABEL_13:

LABEL_14:
        goto LABEL_15;
      }
      unsigned int v14 = [(NSString *)v11 isEqual:v12];

      if (!v14) {
        goto LABEL_14;
      }
    }
    if (dword_1001CC8A0 <= 50 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v16 = (SFDevice *)v17;
    device = self->_device;
    self->_device = v16;
    goto LABEL_13;
  }
LABEL_15:
}

- (void)deviceDiscoveryStop
{
  [(SFDeviceDiscovery *)self->_deviceDiscovery invalidate];
  deviceDiscovery = self->_deviceDiscovery;
  self->_deviceDiscovery = 0;
}

- (void)deviceDiscoveryStart
{
  if (!self->_deviceDiscovery)
  {
    if (dword_1001CC8A0 <= 30 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = (SFDeviceDiscovery *)objc_alloc_init((Class)SFDeviceDiscovery);
    deviceDiscovery = self->_deviceDiscovery;
    self->_deviceDiscovery = v3;

    [(SFDeviceDiscovery *)self->_deviceDiscovery setChangeFlags:13];
    [(SFDeviceDiscovery *)self->_deviceDiscovery setDiscoveryFlags:8208];
    [(SFDeviceDiscovery *)self->_deviceDiscovery setDispatchQueue:self->_workQueue];
    [(SFDeviceDiscovery *)self->_deviceDiscovery setRssiThreshold:-60];
    [(SFDeviceDiscovery *)self->_deviceDiscovery setScanRate:20];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10012035C;
    v7[3] = &unk_1001A1258;
    v7[4] = self;
    [(SFDeviceDiscovery *)self->_deviceDiscovery setDeviceFoundHandler:v7];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100120368;
    v6[3] = &unk_1001A1258;
    v6[4] = self;
    [(SFDeviceDiscovery *)self->_deviceDiscovery setDeviceLostHandler:v6];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100120374;
    v5[3] = &unk_1001A1280;
    v5[4] = self;
    [(SFDeviceDiscovery *)self->_deviceDiscovery setDeviceChangedHandler:v5];
    [(SFDeviceDiscovery *)self->_deviceDiscovery activateWithCompletion:&stru_1001A12A0];
  }
}

- (void)showPasswordPickerUI
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (self->_pickerState)
  {
    if (dword_1001CC8A0 <= 60 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    NSErrorWithOSStatusF();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [(ProximityAutoFillMainController *)self showDoneUI:v7];
  }
  else
  {
    id v3 = +[NSURL URLWithString:self->_url];
    self->_pickerState = 1;
    id v4 = (_SFAppAutoFillPasswordViewController *)objc_alloc_init(off_1001CC910());
    vcPicker = self->_vcPicker;
    self->_vcPicker = v4;

    [(_SFAppAutoFillPasswordViewController *)self->_vcPicker setDelegate:self];
    if (v3) {
      [(_SFAppAutoFillPasswordViewController *)self->_vcPicker setWebViewURL:v3];
    }
    if (self->_bundleID) {
      -[_SFAppAutoFillPasswordViewController setRemoteAppID:](self->_vcPicker, "setRemoteAppID:");
    }
    if (self->_localizedAppName) {
      -[_SFAppAutoFillPasswordViewController setRemoteLocalizedAppName:](self->_vcPicker, "setRemoteLocalizedAppName:");
    }
    if (self->_unlocalizedAppName) {
      -[_SFAppAutoFillPasswordViewController setRemoteUnlocalizedAppName:](self->_vcPicker, "setRemoteUnlocalizedAppName:");
    }
    if (self->_associatedDomains && (objc_opt_respondsToSelector() & 1) != 0) {
      [(_SFAppAutoFillPasswordViewController *)self->_vcPicker setExternallyVerifiedAndApprovedSharedWebCredentialsDomains:self->_associatedDomains];
    }
    [(_SFAppAutoFillPasswordViewController *)self->_vcPicker setAuthenticationGracePeriod:45.0];
    id v6 = self->_vcPicker;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1001206D4;
    v8[3] = &unk_1001A1898;
    v8[4] = self;
    [(_SFAppAutoFillPasswordViewController *)v6 authenticateToPresentInPopover:0 completion:v8];
  }
}

- (void)_handleVisualAuthScannedCode:(id)a3
{
  id v4 = a3;
  if (dword_1001CC8A0 <= 30 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (mach_absolute_time() >= self->_visualAuthNextTicks)
  {
    if (self->_visualAuthTryingCode)
    {
      if (dword_1001CC8A0 <= 30 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
        goto LABEL_12;
      }
    }
    else
    {
      self->_visualAuthTryingCode = 1;
      [(ProximityAutoFillMainController *)self _tryPIN:v4];
    }
  }
  else if (dword_1001CC8A0 <= 30 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize()))
  {
    UpTicksToSecondsF();
LABEL_12:
    LogPrintF();
  }
}

- (void)_handleVisualAuthEvent:(int64_t)a3
{
  if (a3 == 2)
  {
    if (dword_1001CC8A0 <= 30 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(VPScannerViewController *)self->_vcVisualAuth dismissViewControllerAnimated:1 completion:0];
    vcVisualAuth = self->_vcVisualAuth;
    self->_vcVisualAuth = 0;

    id v6 = [(UIViewController *)self->_vcVisualAuthParent view];
    [v6 setHidden:0];

    vcVisualAuthParent = self->_vcVisualAuthParent;
    self->_vcVisualAuthParent = 0;

    [(ProximityAutoFillMainController *)self showPairingUIWithFlags:0 throttleSeconds:0xFFFFFFFFLL];
  }
  else if (a3 == 1)
  {
    if (dword_1001CC8A0 <= 30 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(VPScannerViewController *)self->_vcVisualAuth dismissViewControllerAnimated:1 completion:0];
    id v4 = self->_vcVisualAuth;
    self->_vcVisualAuth = 0;

    [(ProximityAutoFillMainController *)self ensureStoppedWithDismiss:1 reason:5];
    return;
  }
  if (dword_1001CC8A0 <= 30 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)showPairingUIWithFlags:(unsigned int)a3 throttleSeconds:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (dword_1001CC8A0 <= 30 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_visualAuthTryingCode = 0;
  vcAuth = self->_vcAuth;
  if ((v5 & 0x100) == 0 || vcAuth)
  {
    if (vcAuth)
    {
      [(ProximityAutoFillAuthViewController *)vcAuth showWithFlags:v5 throttleSeconds:v4];
    }
    else
    {
      id v17 = [(UIStoryboard *)self->_mainStoryboard instantiateViewControllerWithIdentifier:@"PINAuth"];
      v18 = self->_vcAuth;
      self->_vcAuth = v17;

      [(SVSBaseViewController *)self->_vcAuth setMainController:self];
      vcNav = self->_vcNav;
      v20 = self->_vcAuth;
      sub_1001386A0(vcNav, v20, 0);
    }
  }
  else
  {
    if ((int)v4 >= 1)
    {
      uint64_t v8 = mach_absolute_time();
      self->_visualAuthNextTicks = SecondsToUpTicks() + v8;
    }
    if (!self->_vcVisualAuth)
    {
      v9 = [(SVSCommonNavController *)self->_vcNav visibleViewController];
      vcVisualAuthParent = self->_vcVisualAuthParent;
      self->_vcVisualAuthParent = v9;

      v11 = +[VPScannerViewController instantiateViewController];
      vcVisualAuth = self->_vcVisualAuth;
      self->_vcVisualAuth = v11;

      id v13 = +[NSBundle mainBundle];
      unsigned int v14 = [v13 localizedStringForKey:@"PROX_AUTOFILL_VISUAL_PAIRING_TITLE_IPHONE" value:&stru_1001A1DC0 table:@"Localizable"];
      [(VPScannerViewController *)self->_vcVisualAuth setTitleMessage:v14];

      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100120F74;
      v23[3] = &unk_1001A16D8;
      v23[4] = self;
      [(VPScannerViewController *)self->_vcVisualAuth setEventHandler:v23];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100120F80;
      v22[3] = &unk_1001A1BB0;
      v22[4] = self;
      [(VPScannerViewController *)self->_vcVisualAuth setScannedCodeHandler:v22];
      id v15 = self->_vcNav;
      v16 = self->_vcVisualAuth;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100120F8C;
      v21[3] = &unk_1001A1BD8;
      v21[4] = self;
      [(SVSCommonNavController *)v15 presentViewController:v16 animated:0 completion:v21];
    }
  }
}

- (void)showDoneUI:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (dword_1001CC8A0 <= 30 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize()))
  {
    v9 = [v4 localizedDescription];
    LogPrintF();
  }
  id v5 = v4;
  id v10 = v5;
  if (!v5)
  {
    if (self->_testMode == 2)
    {
      NSErrorWithOSStatusF();
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = 0;
    }
  }
  vcDone = self->_vcDone;
  if (!vcDone)
  {
    id v7 = [(UIStoryboard *)self->_mainStoryboard instantiateViewControllerWithIdentifier:@"Done"];
    uint64_t v8 = self->_vcDone;
    self->_vcDone = v7;

    [(SVSBaseViewController *)self->_vcDone setMainController:self];
    vcDone = self->_vcDone;
  }
  -[ProximityAutoFillDoneViewController setError:](vcDone, "setError:", v5, v9);
  sub_1001386A0(self->_vcNav, self->_vcDone, 0);
}

- (void)showAuthenticateUI
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (self->_prefSkipAuth)
  {
    if (dword_1001CC8A0 <= 30 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_authState = 2;
LABEL_11:
    [(ProximityAutoFillMainController *)self showPasswordPickerUI];
  }
  else
  {
    switch(self->_authState)
    {
      case 0:
        if (dword_1001CC8A0 <= 30 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        self->_authState = 1;
        id v3 = (LAContext *)objc_alloc_init((Class)LAContext);
        authContext = self->_authContext;
        self->_authContext = v3;

        [(LAContext *)self->_authContext setTouchIDAuthenticationAllowableReuseDuration:45.0];
        id v5 = self->_authContext;
        id v16 = 0;
        unsigned int v6 = [(LAContext *)v5 canEvaluatePolicy:1 error:&v16];
        id v7 = v16;
        uint64_t v8 = v7;
        if (v6)
        {
          id v9 = [UIApp beginBackgroundTaskWithExpirationHandler:&stru_1001A11E8];
          id v10 = +[NSBundle mainBundle];
          v11 = [v10 localizedStringForKey:@"PROX_AUTOFILL_AUTH_REASON" value:&stru_1001A1DC0 table:@"Localizable"];

          unsigned __int8 v12 = self->_authContext;
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_10012148C;
          v15[3] = &unk_1001A1210;
          v15[4] = self;
          v15[5] = v9;
          [(LAContext *)v12 evaluatePolicy:1 localizedReason:v11 reply:v15];
        }
        else
        {
          self->_authState = 3;
          if (v7)
          {
            [(ProximityAutoFillMainController *)self showDoneUI:v7];
          }
          else
          {
            id v13 = NSErrorWithOSStatusF();
            [(ProximityAutoFillMainController *)self showDoneUI:v13];
          }
        }

        break;
      case 2:
      case 4:
        goto LABEL_11;
      default:
        NSErrorWithOSStatusF();
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        [(ProximityAutoFillMainController *)self showDoneUI:v14];

        break;
    }
  }
}

- (void)handlePasswordPicked:(id)a3
{
  id v4 = a3;
  id v13 = v4;
  if (dword_1001CC8A0 <= 30)
  {
    if (dword_1001CC8A0 != -1 || (v5 = _LogCategory_Initialize(), id v4 = v13, v5))
    {
      id v12 = v4;
      LogPrintF();
      id v4 = v13;
    }
  }
  if (v4)
  {
    self->_pickerState = 4;
    unsigned int v6 = [v4 user];
    pickedUsername = self->_pickedUsername;
    self->_pickedUsername = v6;

    uint64_t v8 = [v13 password];
    pickedPassword = self->_pickedPassword;
    self->_pickedPassword = v8;

    if (dword_1001CC8A0 <= 30 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    credentialsHandler = (void (**)(id, NSString *, NSString *, void))self->_credentialsHandler;
    if (credentialsHandler)
    {
      credentialsHandler[2](credentialsHandler, self->_pickedUsername, self->_pickedPassword, 0);
    }
    else if (dword_1001CC8A0 <= 60 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v10 = 0;
  }
  else
  {
    self->_pickerState = 7;
    id v10 = NSErrorWithOSStatusF();
  }
  -[ProximityAutoFillMainController showDoneUI:](self, "showDoneUI:", v10, v12);
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
          if (dword_1001CC8A0 <= 30 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          [(ProximityAutoFillMainController *)self ensureStoppedWithDismiss:1 reason:4];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)fileRadar:(id)a3
{
  id v3 = a3;
  if (dword_1001CC8A0 <= 60 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize()))
  {
    v19 = [v3 localizedDescription];
    LogPrintF();
  }
  if (v3)
  {
    id v4 = [v3 localizedDescription];
    id v5 = +[NSMutableString stringWithFormat:@"AutoFill: %@", v4, v3];
  }
  else
  {
    id v5 = +[NSMutableString stringWithFormat:@"AutoFill: %@", @"Share Failed", 0];
  }
  v26[0] = @"Classification";
  v26[1] = @"ComponentID";
  v27[0] = @"Serious Bug";
  v27[1] = @"939440";
  v26[2] = @"ComponentName";
  v26[3] = @"ComponentVersion";
  v27[2] = @"Proximity AutoFill";
  v27[3] = @"all";
  v26[4] = @"ExtensionIdentifiers";
  v26[5] = @"Reproducibility";
  v27[4] = @"com.apple.DiagnosticExtensions.Bluetooth";
  v27[5] = @"I Didn't Try";
  v26[6] = @"Title";
  v27[6] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:7];
  uint64_t v7 = +[NSMutableArray array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v14 = [v8 objectForKeyedSubscript:v13];
        id v15 = +[NSURLQueryItem queryItemWithName:v13 value:v14];
        [v7 addObject:v15];
      }
      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  id v16 = +[NSURLComponents componentsWithString:@"tap-to-radar://new"];
  [v16 setQueryItems:v7];
  id v17 = (void *)UIApp;
  v18 = [v16 URL];
  [v17 openURL:v18 withCompletionHandler:0];
}

- (void)ensureStoppedWithDismiss:(BOOL)a3 reason:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  if (dword_1001CC8A0 <= 50 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = "no";
    if (v5) {
      uint64_t v7 = "yes";
    }
    id v16 = v7;
    uint64_t v17 = v4;
    LogPrintF();
  }
  [(ProximityAutoFillMainController *)self deviceDiscoveryStop];
  [(ProximityAutoFillMainController *)self sessionStop];
  mainStoryboard = self->_mainStoryboard;
  self->_mainStoryboard = 0;

  [(SVSBaseViewController *)self->_vcAuth setMainController:0];
  vcAuth = self->_vcAuth;
  self->_vcAuth = 0;

  [(SVSBaseViewController *)self->_vcDone setMainController:0];
  vcDone = self->_vcDone;
  self->_vcDone = 0;

  vcNav = self->_vcNav;
  self->_vcNav = 0;

  vcPicker = self->_vcPicker;
  self->_vcPicker = 0;

  [(SVSBaseViewController *)self->_vcStart setMainController:0];
  vcStart = self->_vcStart;
  self->_vcStart = 0;

  vcVisualAuth = self->_vcVisualAuth;
  self->_vcVisualAuth = 0;

  vcVisualAuthParent = self->_vcVisualAuthParent;
  self->_vcVisualAuthParent = 0;

  if (v5)
  {
    [(ProximityAutoFillMainController *)self dismiss:v4];
  }
}

- (void)ensureStoppedWithDismiss:(BOOL)a3
{
}

- (void)dismiss:(int)a3 completion:(id)a4
{
  id v6 = a4;
  if (!self->_dismissed)
  {
    self->_dismissed = 1;
    [(ProximityAutoFillMainController *)self _remoteViewControllerProxy];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100121FCC;
    v8[3] = &unk_1001A1AE8;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = v6;
    id v7 = v9;
    [(ProximityAutoFillMainController *)self dismissViewControllerAnimated:a3 != 19 completion:v8];
  }
}

- (void)dismiss:(int)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC8A0 <= 30 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (self->_authState == 1)
  {
    if (dword_1001CC8A0 <= 30 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v8 = self;
    id v6 = &v8;
  }
  else
  {
    BOOL v5 = [(ProximityAutoFillMainController *)self _remoteViewControllerProxy];
    [v5 setIdleTimerDisabled:0 forReason:@"com.apple.SharingViewService.ProximityAutoFill"];

    if (self->_dismissed)
    {
      [(ProximityAutoFillMainController *)self ensureStoppedWithDismiss:0];
    }
    else
    {
      if (dword_1001CC8A0 <= 30 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [(ProximityAutoFillMainController *)self ensureStoppedWithDismiss:1 reason:21];
    }
    id v7 = self;
    id v6 = &v7;
  }
  v6[1] = (ProximityAutoFillMainController *)ProximityAutoFillMainController;
  [super viewDidDisappear:v3, v7];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC8A0 <= 30 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v14.receiver = self;
  v14.super_class = (Class)ProximityAutoFillMainController;
  [(ProximityAutoFillMainController *)&v14 viewDidAppear:v3];
  BOOL v5 = +[UIStoryboard storyboardWithName:@"ProximityAutoFill" bundle:0];
  mainStoryboard = self->_mainStoryboard;
  self->_mainStoryboard = v5;

  id v7 = [(UIStoryboard *)self->_mainStoryboard instantiateInitialViewController];
  vcNav = self->_vcNav;
  self->_vcNav = v7;

  [(SVSCommonNavController *)self->_vcNav setDelegate:self];
  [(SVSCommonNavController *)self->_vcNav setModalPresentationStyle:4];
  [(SVSCommonNavController *)self->_vcNav setTransitioningDelegate:self->_vcNav];
  id v9 = +[UIDevice currentDevice];
  unint64_t v10 = (unint64_t)[v9 userInterfaceIdiom];

  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    [(SVSCommonNavController *)self->_vcNav setModalTransitionStyle:2];
  }
  uint64_t v11 = [(SVSCommonNavController *)self->_vcNav viewControllers];
  long long v12 = [v11 firstObject];
  vcStart = self->_vcStart;
  self->_vcStart = v12;

  [(SVSBaseViewController *)self->_vcStart setMainController:self];
  [(ProximityAutoFillMainController *)self presentViewController:self->_vcNav animated:1 completion:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ProximityAutoFillMainController;
  [(ProximityAutoFillMainController *)&v4 viewWillAppear:a3];
  [(ProximityAutoFillMainController *)self deviceDiscoveryStart];
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  id v7 = [a3 userInfo];
  userInfo = self->super._userInfo;
  self->super._userInfo = v7;

  if (dword_1001CC8A0 <= 30 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v9 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.SharingViewService.ProximityAutoFill", 0);
  workQueue = self->_workQueue;
  self->_workQueue = v9;

  uint64_t v11 = [(ProximityAutoFillMainController *)self _remoteViewControllerProxy];
  [v11 setAllowsAlertStacking:1];

  CFStringGetTypeID();
  long long v12 = CFDictionaryGetTypedValue();
  if (v12) {
    objc_storeStrong((id *)&self->_deviceAddress, v12);
  }
  CFStringGetTypeID();
  uint64_t v13 = CFDictionaryGetTypedValue();

  if ([v13 isEqual:@"00000000-0000-0000-0000-000000000001"])
  {
    int64_t v14 = 1;
  }
  else if ([v13 isEqual:@"00000000-0000-0000-0000-000000000002"])
  {
    int64_t v14 = 2;
  }
  else
  {
    if (![v13 isEqual:@"00000000-0000-0000-0000-000000000003"]) {
      goto LABEL_14;
    }
    int64_t v14 = 3;
  }
  self->_testMode = v14;
LABEL_14:
  if (v13)
  {
    id v15 = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDString:v13];
    deviceIdentifier = self->_deviceIdentifier;
    self->_deviceIdentifier = v15;
  }
  CFStringGetTypeID();
  uint64_t v17 = CFDictionaryGetTypedValue();

  if (v17) {
    objc_storeStrong((id *)&self->_peerContactID, v17);
  }
  CFStringGetTypeID();
  v18 = CFDictionaryGetTypedValue();

  if (v18) {
    objc_storeStrong((id *)&self->_pin, v18);
  }
  uint64_t Int64 = CFPrefs_GetInt64();
  if (IsAppleInternalBuild() && Int64)
  {
    BOOL v19 = 1;
  }
  else
  {
    if (!self->_prefAutoPayload) {
      goto LABEL_31;
    }
    BOOL v19 = 0;
  }
  if (dword_1001CC8A0 <= 30 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_prefAutoPayload = v19;
LABEL_31:
  BOOL v21 = CFPrefs_GetInt64() != 0;
  if (self->_prefHideTTR != v21)
  {
    if (dword_1001CC8A0 <= 30 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_prefHideTTR = v21;
  }
  BOOL v22 = CFPrefs_GetInt64() != 0;
  if (self->_prefSkipAuth != v22)
  {
    if (dword_1001CC8A0 <= 30 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_prefSkipAuth = v22;
  }
  if (v6) {
    v6[2](v6);
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(ProximityAutoFillMainController *)self view];
  BOOL v3 = [v2 window];

  if (!v3) {
    return 30;
  }
  objc_super v4 = +[UIDevice currentDevice];
  id v5 = [v4 userInterfaceIdiom];

  if (v5 == (id)1) {
    return (1 << (char)[UIApp activeInterfaceOrientation]);
  }
  else {
    return 2;
  }
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

@end