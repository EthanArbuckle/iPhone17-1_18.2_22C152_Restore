@interface TVLatencyColorimeterSetupMainController
- (BOOL)_canShowWhileLocked;
- (BOOL)_deviceSupported;
- (BOOL)started;
- (NSUUID)deviceIdentifier;
- (SFDeviceSetupTVColorCalibratorSession)colorCalibratorSetupSession;
- (unint64_t)supportedInterfaceOrientations;
- (unint64_t)testFlags;
- (void)_sessionHandleProgress:(unsigned int)a3 info:(id)a4;
- (void)_sessionStart:(id)a3;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dismiss:(int)a3;
- (void)dismissAnimated:(BOOL)a3 reenableProxCard:(BOOL)a4 completion:(id)a5;
- (void)handleButtonActions:(id)a3;
- (void)proxCardFlowDidDismiss;
- (void)setColorCalibratorSetupSession:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)setTestFlags:(unint64_t)a3;
- (void)showAuthUIWithFlags:(unsigned int)a3 throttleSeconds:(int)a4;
- (void)showDoneUI:(id)a3 completed:(BOOL)a4;
- (void)showDoneUI:(id)a3 final:(BOOL)a4 completed:(BOOL)a5;
- (void)showPreparingUI;
- (void)showProgressUI;
- (void)showTryAgainUI;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation TVLatencyColorimeterSetupMainController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorCalibratorSetupSession, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_vcTryAgain, 0);
  objc_storeStrong((id *)&self->_vcPreparing, 0);
  objc_storeStrong((id *)&self->_vcStart, 0);
  objc_storeStrong((id *)&self->_vcProgress, 0);
  objc_storeStrong((id *)&self->_vcNav, 0);
  objc_storeStrong((id *)&self->_vcDone, 0);
  objc_storeStrong((id *)&self->_vcAuth, 0);

  objc_storeStrong((id *)&self->_storyboard, 0);
}

- (void)setColorCalibratorSetupSession:(id)a3
{
}

- (SFDeviceSetupTVColorCalibratorSession)colorCalibratorSetupSession
{
  return self->_colorCalibratorSetupSession;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setTestFlags:(unint64_t)a3
{
  self->_testFlags = a3;
}

- (unint64_t)testFlags
{
  return self->_testFlags;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)started
{
  return self->_started;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)_deviceSupported
{
  int DeviceClass = GestaltGetDeviceClass();
  int v3 = MGIsQuestionValid();
  if (v3)
  {
    LOBYTE(v3) = MGGetBoolAnswer();
    if (DeviceClass != 1) {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)showTryAgainUI
{
  if (dword_1001CC6D8 <= 30 && (dword_1001CC6D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  vcTryAgain = self->_vcTryAgain;
  if (!vcTryAgain)
  {
    v4 = objc_alloc_init(TVLatencyColorimeterSetupTryAgainViewController);
    v5 = self->_vcTryAgain;
    self->_vcTryAgain = v4;

    [(TVLatencyColorimeterSetupBaseViewController *)self->_vcTryAgain setMainController:self];
    vcTryAgain = self->_vcTryAgain;
  }
  vcNav = self->_vcNav;

  sub_1001131DC(vcNav, vcTryAgain);
}

- (void)showProgressUI
{
  if (dword_1001CC6D8 <= 30 && (dword_1001CC6D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  vcProgress = self->_vcProgress;
  if (!vcProgress)
  {
    v4 = objc_alloc_init(TVLatencyColorimeterSetupProgressViewController);
    v5 = self->_vcProgress;
    self->_vcProgress = v4;

    [(TVLatencyColorimeterSetupBaseViewController *)self->_vcProgress setMainController:self];
    vcProgress = self->_vcProgress;
  }
  vcNav = self->_vcNav;

  sub_1001131DC(vcNav, vcProgress);
}

- (void)showPreparingUI
{
  if (dword_1001CC6D8 <= 30 && (dword_1001CC6D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  vcPreparing = self->_vcPreparing;
  if (!vcPreparing)
  {
    v4 = objc_alloc_init(TVLatencyColorimeterSetupPreparingViewController);
    v5 = self->_vcPreparing;
    self->_vcPreparing = v4;

    [(TVLatencyColorimeterSetupBaseViewController *)self->_vcPreparing setMainController:self];
    vcPreparing = self->_vcPreparing;
  }
  vcNav = self->_vcNav;

  sub_1001131DC(vcNav, vcPreparing);
}

- (void)showDoneUI:(id)a3 final:(BOOL)a4 completed:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v13 = a3;
  if (dword_1001CC6D8 <= 30 && (dword_1001CC6D8 != -1 || _LogCategory_Initialize()))
  {
    id v12 = v13;
    LogPrintF();
  }
  if (self->_vcDone)
  {
    if (!v6) {
      goto LABEL_14;
    }
  }
  else
  {
    v8 = objc_alloc_init(TVLatencyColorimeterSetupDoneViewController);
    vcDone = self->_vcDone;
    self->_vcDone = v8;

    [(TVLatencyColorimeterSetupBaseViewController *)self->_vcDone setMainController:self];
    [(TVLatencyColorimeterSetupDoneViewController *)self->_vcDone setError:v13];
    [(TVLatencyColorimeterSetupDoneViewController *)self->_vcDone setCompleted:v5];
    sub_1001131DC(self->_vcNav, self->_vcDone);
    if (!v6) {
      goto LABEL_14;
    }
  }
  if (dword_1001CC6D8 <= 30 && (dword_1001CC6D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(SFDeviceSetupTVColorCalibratorSession *)self->_colorCalibratorSetupSession invalidate];
  colorCalibratorSetupSession = self->_colorCalibratorSetupSession;
  self->_colorCalibratorSetupSession = 0;

  v11 = [(TVLatencyColorimeterSetupMainController *)self _remoteViewControllerProxy];
  [v11 setIdleTimerDisabled:0 forReason:@"com.apple.SharingViewService.TVLatencySetup"];

LABEL_14:
}

- (void)showDoneUI:(id)a3 completed:(BOOL)a4
{
}

- (void)showAuthUIWithFlags:(unsigned int)a3 throttleSeconds:(int)a4
{
  vcAuth = self->_vcAuth;
  if (vcAuth)
  {
    [(TVLatencyColorimeterSetupAuthViewController *)vcAuth showWithFlags:*(void *)&a3 throttleSeconds:*(void *)&a4];
  }
  else
  {
    if (dword_1001CC6D8 <= 30 && (dword_1001CC6D8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    BOOL v6 = [(UIStoryboard *)self->_storyboard instantiateViewControllerWithIdentifier:@"AuthUI"];
    v7 = self->_vcAuth;
    self->_vcAuth = v6;

    [(SVSBaseViewController *)self->_vcAuth setMainController:self];
    vcNav = self->_vcNav;
    v9 = self->_vcAuth;
    sub_1001131DC(vcNav, v9);
  }
}

- (void)_sessionHandleProgress:(unsigned int)a3 info:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if ((int)a3 <= 277)
  {
    if (a3 == 30)
    {
LABEL_9:
      id v11 = v6;
      CFErrorGetTypeID();
      v8 = CFDictionaryGetTypedValue();
      if (dword_1001CC6D8 <= 60 && (dword_1001CC6D8 != -1 || _LogCategory_Initialize()))
      {
        v10 = v8;
        LogPrintF();
      }
      [(TVLatencyColorimeterSetupMainController *)self showTryAgainUI];
    }
    else
    {
      if (a3 != 96) {
        goto LABEL_24;
      }
LABEL_6:
      id v11 = v6;
      if (dword_1001CC6D8 <= 30)
      {
        if (dword_1001CC6D8 != -1 || (v9 = _LogCategory_Initialize(), id v7 = v11, v9))
        {
          LogPrintF();
          id v7 = v11;
        }
      }
      id v6 = [(TVLatencyColorimeterSetupMainController *)self showDoneUI:0 completed:v7 != 0];
    }
  }
  else
  {
    switch(a3)
    {
      case 0x116u:
        id v11 = v6;
        [(TVLatencyColorimeterSetupMainController *)self showProgressUI];
        id v6 = [(TVLatencyColorimeterSetupProgressViewController *)self->_vcProgress handleProgressEvent:278];
        break;
      case 0x117u:
        goto LABEL_24;
      case 0x118u:
        goto LABEL_9;
      case 0x119u:
        id v11 = v6;
        id v6 = [(TVLatencyColorimeterSetupMainController *)self showTryAgainUI];
        break;
      case 0x11Au:
        goto LABEL_6;
      default:
        if (a3 != 400) {
          goto LABEL_24;
        }
        id v11 = v6;
        if (dword_1001CC6D8 <= 30 && (dword_1001CC6D8 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        id v6 = [(TVLatencyColorimeterSetupMainController *)self dismiss:17];
        break;
    }
  }
  id v7 = v11;
LABEL_24:

  _objc_release_x1(v6, v7);
}

- (void)_sessionStart:(id)a3
{
  self->_started = 1;
  id v4 = a3;
  BOOL v5 = (SFDeviceSetupTVColorCalibratorSession *)objc_alloc_init((Class)SFDeviceSetupTVColorCalibratorSession);
  colorCalibratorSetupSession = self->_colorCalibratorSetupSession;
  self->_colorCalibratorSetupSession = v5;

  [(SFDeviceSetupTVColorCalibratorSession *)self->_colorCalibratorSetupSession setPeerDevice:v4];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100116228;
  v9[3] = &unk_1001A1B10;
  v9[4] = self;
  [(SFDeviceSetupTVColorCalibratorSession *)self->_colorCalibratorSetupSession setProgressHandler:v9];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100116238;
  v8[3] = &unk_1001A1B60;
  v8[4] = self;
  [(SFDeviceSetupTVColorCalibratorSession *)self->_colorCalibratorSetupSession setPromptForPINHandler:v8];
  [(SFDeviceSetupTVColorCalibratorSession *)self->_colorCalibratorSetupSession activate];
  id v7 = [(TVLatencyColorimeterSetupMainController *)self _remoteViewControllerProxy];
  [v7 setIdleTimerDisabled:1 forReason:@"com.apple.SharingViewService.TVLatencySetup"];
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
          if (dword_1001CC6D8 <= 30 && (dword_1001CC6D8 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          [(TVLatencyColorimeterSetupMainController *)self dismiss:4];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)proxCardFlowDidDismiss
{
}

- (void)dismissAnimated:(BOOL)a3 reenableProxCard:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  if (!self->_dismissed)
  {
    self->_dismissed = 1;
    if (self->_started)
    {
      id v9 = objc_alloc_init((Class)SFClient);
      long long v10 = v9;
      if (v5)
      {
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_1001165E8;
        v17[3] = &unk_1001A1A08;
        v17[4] = v9;
        [v9 reenableProxCardType:30 completion:v17];
      }
      else
      {
        [v9 invalidate];
      }
    }
    long long v11 = [(TVLatencyColorimeterSetupMainController *)self _remoteViewControllerProxy];
    long long v12 = v11;
    vcNav = self->_vcNav;
    if (vcNav)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10011668C;
      v14[3] = &unk_1001A1AE8;
      id v16 = v8;
      id v15 = v12;
      [(UINavigationController *)vcNav dismissViewControllerAnimated:v6 completion:v14];
    }
    else
    {
      [v11 dismiss];
    }
  }
}

- (void)dismiss:(int)a3
{
  [(TVLatencyColorimeterSetupMainController *)self dismissAnimated:a3 != 19 reenableProxCard:a3 != 5 completion:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC6D8 <= 30 && (dword_1001CC6D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  BOOL v5 = [(TVLatencyColorimeterSetupMainController *)self _remoteViewControllerProxy];
  [v5 setIdleTimerDisabled:0 forReason:@"com.apple.SharingViewService.TVLatencySetup"];

  if (!self->_dismissed)
  {
    if (dword_1001CC6D8 <= 30 && (dword_1001CC6D8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(TVLatencyColorimeterSetupMainController *)self dismiss:21];
  }
  [(SFDeviceSetupTVColorCalibratorSession *)self->_colorCalibratorSetupSession invalidate];
  colorCalibratorSetupSession = self->_colorCalibratorSetupSession;
  self->_colorCalibratorSetupSession = 0;

  storyboard = self->_storyboard;
  self->_storyboard = 0;

  [(SVSBaseViewController *)self->_vcAuth setMainController:0];
  vcAuth = self->_vcAuth;
  self->_vcAuth = 0;

  [(TVLatencyColorimeterSetupBaseViewController *)self->_vcDone setMainController:0];
  vcDone = self->_vcDone;
  self->_vcDone = 0;

  vcNav = self->_vcNav;
  self->_vcNav = 0;

  [(TVLatencyColorimeterSetupBaseViewController *)self->_vcProgress setMainController:0];
  vcProgress = self->_vcProgress;
  self->_vcProgress = 0;

  [(TVLatencyColorimeterSetupBaseViewController *)self->_vcPreparing setMainController:0];
  vcPreparing = self->_vcPreparing;
  self->_vcPreparing = 0;

  [(TVLatencyColorimeterSetupBaseViewController *)self->_vcStart setMainController:0];
  vcStart = self->_vcStart;
  self->_vcStart = 0;

  [(TVLatencyColorimeterSetupBaseViewController *)self->_vcTryAgain setMainController:0];
  vcTryAgain = self->_vcTryAgain;
  self->_vcTryAgain = 0;

  v15.receiver = self;
  v15.super_class = (Class)TVLatencyColorimeterSetupMainController;
  [(SVSBaseMainController *)&v15 viewDidDisappear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC6D8 <= 30 && (dword_1001CC6D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v12.receiver = self;
  v12.super_class = (Class)TVLatencyColorimeterSetupMainController;
  [(TVLatencyColorimeterSetupMainController *)&v12 viewDidAppear:v3];
  BOOL v5 = +[UIStoryboard storyboardWithName:@"TVColorCalibrationSetup" bundle:0];
  storyboard = self->_storyboard;
  self->_storyboard = v5;

  unsigned int v7 = [(TVLatencyColorimeterSetupMainController *)self _deviceSupported];
  id v8 = off_100199E08;
  if (!v7) {
    id v8 = &off_100199E10;
  }
  id v9 = objc_alloc_init(*v8);
  [v9 setMainController:self];
  long long v10 = [(TVLatencyColorimeterSetupMainController *)self presentProxCardFlowWithDelegate:self initialViewController:v9];
  vcNav = self->_vcNav;
  self->_vcNav = v10;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(TVLatencyColorimeterSetupMainController *)self view];
  BOOL v3 = [v2 window];

  if (!v3) {
    return 30;
  }
  id v4 = +[UIDevice currentDevice];
  id v5 = [v4 userInterfaceIdiom];

  if (v5 == (id)1) {
    return (1 << (char)[UIApp activeInterfaceOrientation]);
  }
  else {
    return 2;
  }
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  objc_super v12 = (void (**)(void))a4;
  BOOL v6 = [a3 userInfo];
  userInfo = self->super._userInfo;
  self->super._userInfo = v6;

  if (dword_1001CC6D8 <= 30 && (dword_1001CC6D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  CFStringGetTypeID();
  id v8 = CFDictionaryGetTypedValue();
  if (v8)
  {
    id v9 = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDString:v8];
    deviceIdentifier = self->_deviceIdentifier;
    self->_deviceIdentifier = v9;
  }
  CFStringGetTypeID();
  long long v11 = CFDictionaryGetTypedValue();

  if (v11) {
    self->_testFlags = SFTestFlagsFromString();
  }
  if (v12) {
    v12[2](v12);
  }
}

@end