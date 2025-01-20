@interface TVLatencySetupMainController
- (BOOL)_canShowWhileLocked;
- (BOOL)started;
- (NSUUID)deviceIdentifier;
- (SFDeviceSetupTVLatencySession)latencySetupSession;
- (unint64_t)supportedInterfaceOrientations;
- (unint64_t)testFlags;
- (unsigned)deviceActionType;
- (void)_sessionHandleProgress:(unsigned int)a3 info:(id)a4;
- (void)_sessionStart:(id)a3;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dismiss:(int)a3;
- (void)dismiss:(int)a3 completion:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)setDeviceActionType:(unsigned __int8)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setLatencySetupSession:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)setTestFlags:(unint64_t)a3;
- (void)showAuthUIWithFlags:(unsigned int)a3 throttleSeconds:(int)a4;
- (void)showDoneUI:(id)a3;
- (void)showDoneUI:(id)a3 final:(BOOL)a4;
- (void)showProgressUI;
- (void)showTryAgainUI;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation TVLatencySetupMainController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latencySetupSession, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_vcTryAgain, 0);
  objc_storeStrong((id *)&self->_vcStart, 0);
  objc_storeStrong((id *)&self->_vcProgress, 0);
  objc_storeStrong((id *)&self->_vcNav, 0);
  objc_storeStrong((id *)&self->_vcDone, 0);
  objc_storeStrong((id *)&self->_vcAuth, 0);

  objc_storeStrong((id *)&self->_storyboard, 0);
}

- (void)setDeviceActionType:(unsigned __int8)a3
{
  self->_deviceActionType = a3;
}

- (unsigned)deviceActionType
{
  return self->_deviceActionType;
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

- (void)setLatencySetupSession:(id)a3
{
}

- (SFDeviceSetupTVLatencySession)latencySetupSession
{
  return self->_latencySetupSession;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)showTryAgainUI
{
  if (dword_1001CCF28 <= 30 && (dword_1001CCF28 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  vcTryAgain = self->_vcTryAgain;
  if (!vcTryAgain)
  {
    v4 = [(UIStoryboard *)self->_storyboard instantiateViewControllerWithIdentifier:@"TryAgain"];
    v5 = self->_vcTryAgain;
    self->_vcTryAgain = v4;

    [(SVSBaseViewController *)self->_vcTryAgain setMainController:self];
    vcTryAgain = self->_vcTryAgain;
  }
  vcNav = self->_vcNav;

  sub_1001386A0(vcNav, vcTryAgain, 0);
}

- (void)showProgressUI
{
  if (dword_1001CCF28 <= 30 && (dword_1001CCF28 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  vcProgress = self->_vcProgress;
  if (!vcProgress)
  {
    v4 = [(UIStoryboard *)self->_storyboard instantiateViewControllerWithIdentifier:@"Progress"];
    v5 = self->_vcProgress;
    self->_vcProgress = v4;

    [(SVSBaseViewController *)self->_vcProgress setMainController:self];
    vcProgress = self->_vcProgress;
  }
  vcNav = self->_vcNav;

  sub_1001386A0(vcNav, vcProgress, 0);
}

- (void)showDoneUI:(id)a3 final:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  if (dword_1001CCF28 <= 30 && (dword_1001CCF28 != -1 || _LogCategory_Initialize()))
  {
    id v10 = v11;
    LogPrintF();
  }
  if (self->_vcDone)
  {
    if (!v4) {
      goto LABEL_14;
    }
  }
  else
  {
    v6 = [(UIStoryboard *)self->_storyboard instantiateViewControllerWithIdentifier:@"Done"];
    vcDone = self->_vcDone;
    self->_vcDone = v6;

    [(SVSBaseViewController *)self->_vcDone setMainController:self];
    [(TVLatencySetupDoneViewController *)self->_vcDone setError:v11];
    sub_1001386A0(self->_vcNav, self->_vcDone, 0);
    if (!v4) {
      goto LABEL_14;
    }
  }
  if (dword_1001CCF28 <= 30 && (dword_1001CCF28 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(SFDeviceSetupTVLatencySession *)self->_latencySetupSession invalidate];
  latencySetupSession = self->_latencySetupSession;
  self->_latencySetupSession = 0;

  v9 = [(TVLatencySetupMainController *)self _remoteViewControllerProxy];
  [v9 setIdleTimerDisabled:0 forReason:@"com.apple.SharingViewService.TVLatencySetup"];

LABEL_14:
}

- (void)showDoneUI:(id)a3
{
}

- (void)showAuthUIWithFlags:(unsigned int)a3 throttleSeconds:(int)a4
{
  vcAuth = self->_vcAuth;
  if (vcAuth)
  {
    [(TVLatencySetupAuthViewController *)vcAuth showWithFlags:*(void *)&a3 throttleSeconds:*(void *)&a4];
  }
  else
  {
    if (dword_1001CCF28 <= 30 && (dword_1001CCF28 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v6 = [(UIStoryboard *)self->_storyboard instantiateViewControllerWithIdentifier:@"AuthUI"];
    v7 = self->_vcAuth;
    self->_vcAuth = v6;

    [(SVSBaseViewController *)self->_vcAuth setMainController:self];
    vcNav = self->_vcNav;
    v9 = self->_vcAuth;
    sub_1001386A0(vcNav, v9, 0);
  }
}

- (void)_sessionHandleProgress:(unsigned int)a3 info:(id)a4
{
  id v6 = a4;
  if ((int)a3 <= 271)
  {
    switch(a3)
    {
      case 0x1Eu:
LABEL_8:
        id v11 = v6;
        CFErrorGetTypeID();
        v9 = CFDictionaryGetTypedValue();
        if (dword_1001CCF28 <= 60 && (dword_1001CCF28 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        if (v9)
        {
          [(TVLatencySetupMainController *)self showDoneUI:v9];
        }
        else
        {
          id v10 = NSErrorF();
          [(TVLatencySetupMainController *)self showDoneUI:v10];
        }
        break;
      case 0x60u:
LABEL_11:
        id v11 = v6;
        if (dword_1001CCF28 <= 30 && (dword_1001CCF28 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        [(TVLatencySetupMainController *)self showDoneUI:0];
        break;
      case 0x104u:
        id v11 = v6;
        [(TVLatencySetupMainController *)self showProgressUI];
        vcProgress = self->_vcProgress;
        uint64_t v8 = 260;
LABEL_19:
        [(TVLatencySetupProgressViewController *)vcProgress handleProgressEvent:v8];
        break;
      default:
        goto LABEL_30;
    }
  }
  else
  {
    switch(a3)
    {
      case 0x110u:
        goto LABEL_11;
      case 0x111u:
      case 0x113u:
        goto LABEL_30;
      case 0x112u:
        goto LABEL_8;
      case 0x114u:
        id v11 = v6;
        [(TVLatencySetupMainController *)self showTryAgainUI];
        break;
      case 0x115u:
        id v11 = v6;
        [(TVLatencySetupMainController *)self showProgressUI];
        vcProgress = self->_vcProgress;
        uint64_t v8 = 277;
        goto LABEL_19;
      default:
        if (a3 != 400) {
          goto LABEL_30;
        }
        id v11 = v6;
        if (dword_1001CCF28 <= 30 && (dword_1001CCF28 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        [(TVLatencySetupMainController *)self dismiss:17];
        break;
    }
  }
  id v6 = v11;
LABEL_30:
}

- (void)_sessionStart:(id)a3
{
  self->_started = 1;
  id v4 = a3;
  v5 = (SFDeviceSetupTVLatencySession *)objc_alloc_init((Class)SFDeviceSetupTVLatencySession);
  latencySetupSession = self->_latencySetupSession;
  self->_latencySetupSession = v5;

  [(SFDeviceSetupTVLatencySession *)self->_latencySetupSession setPeerDevice:v4];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100139884;
  v9[3] = &unk_1001A1B10;
  v9[4] = self;
  [(SFDeviceSetupTVLatencySession *)self->_latencySetupSession setProgressHandler:v9];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100139894;
  v8[3] = &unk_1001A1B60;
  v8[4] = self;
  [(SFDeviceSetupTVLatencySession *)self->_latencySetupSession setPromptForPINHandler:v8];
  [(SFDeviceSetupTVLatencySession *)self->_latencySetupSession activate];
  v7 = [(TVLatencySetupMainController *)self _remoteViewControllerProxy];
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
          if (dword_1001CCF28 <= 30 && (dword_1001CCF28 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          [(TVLatencySetupMainController *)self dismiss:4];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)dismiss:(int)a3 completion:(id)a4
{
  id v6 = a4;
  if (!self->_dismissed)
  {
    self->_dismissed = 1;
    if (self->_started)
    {
      id v7 = objc_alloc_init((Class)SFClient);
      uint64_t v8 = v7;
      if (a3 == 5)
      {
        [v7 invalidate];
      }
      else
      {
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_100139C34;
        v15[3] = &unk_1001A1A08;
        v15[4] = v7;
        [v7 reenableProxCardType:25 completion:v15];
      }
    }
    long long v9 = [(TVLatencySetupMainController *)self _remoteViewControllerProxy];
    long long v10 = v9;
    vcNav = self->_vcNav;
    if (vcNav)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100139CD8;
      v12[3] = &unk_1001A1AE8;
      id v14 = v6;
      id v13 = v10;
      [(SVSCommonNavController *)vcNav dismissViewControllerAnimated:a3 != 19 completion:v12];
    }
    else
    {
      [v9 dismiss];
    }
  }
}

- (void)dismiss:(int)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CCF28 <= 30 && (dword_1001CCF28 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v5 = [(TVLatencySetupMainController *)self _remoteViewControllerProxy];
  [v5 setIdleTimerDisabled:0 forReason:@"com.apple.SharingViewService.TVLatencySetup"];

  if (!self->_dismissed)
  {
    if (dword_1001CCF28 <= 30 && (dword_1001CCF28 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(TVLatencySetupMainController *)self dismiss:21];
  }
  [(SFDeviceSetupTVLatencySession *)self->_latencySetupSession invalidate];
  latencySetupSession = self->_latencySetupSession;
  self->_latencySetupSession = 0;

  storyboard = self->_storyboard;
  self->_storyboard = 0;

  [(SVSBaseViewController *)self->_vcAuth setMainController:0];
  vcAuth = self->_vcAuth;
  self->_vcAuth = 0;

  [(SVSBaseViewController *)self->_vcDone setMainController:0];
  vcDone = self->_vcDone;
  self->_vcDone = 0;

  vcNav = self->_vcNav;
  self->_vcNav = 0;

  [(SVSBaseViewController *)self->_vcProgress setMainController:0];
  vcProgress = self->_vcProgress;
  self->_vcProgress = 0;

  [(SVSBaseViewController *)self->_vcStart setMainController:0];
  vcStart = self->_vcStart;
  self->_vcStart = 0;

  [(SVSBaseViewController *)self->_vcTryAgain setMainController:0];
  vcTryAgain = self->_vcTryAgain;
  self->_vcTryAgain = 0;

  v14.receiver = self;
  v14.super_class = (Class)TVLatencySetupMainController;
  [(SVSBaseMainController *)&v14 viewDidDisappear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CCF28 <= 30 && (dword_1001CCF28 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v14.receiver = self;
  v14.super_class = (Class)TVLatencySetupMainController;
  [(TVLatencySetupMainController *)&v14 viewDidAppear:v3];
  id v5 = +[UIStoryboard storyboardWithName:@"TVLatencySetup" bundle:0];
  storyboard = self->_storyboard;
  self->_storyboard = v5;

  id v7 = [(UIStoryboard *)self->_storyboard instantiateInitialViewController];
  vcNav = self->_vcNav;
  self->_vcNav = v7;

  [(SVSCommonNavController *)self->_vcNav setDelegate:self];
  [(SVSCommonNavController *)self->_vcNav setModalPresentationStyle:4];
  long long v9 = +[UIDevice currentDevice];
  unint64_t v10 = (unint64_t)[v9 userInterfaceIdiom];

  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    [(SVSCommonNavController *)self->_vcNav setModalTransitionStyle:2];
  }
  [(SVSCommonNavController *)self->_vcNav setTransitioningDelegate:self->_vcNav];
  long long v11 = [(SVSCommonNavController *)self->_vcNav viewControllers];
  long long v12 = [v11 firstObject];
  vcStart = self->_vcStart;
  self->_vcStart = v12;

  [(SVSBaseViewController *)self->_vcStart setMainController:self];
  [(TVLatencySetupMainController *)self presentViewController:self->_vcNav animated:1 completion:0];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(TVLatencySetupMainController *)self view];
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
  long long v12 = (void (**)(void))a4;
  id v6 = [a3 userInfo];
  userInfo = self->super._userInfo;
  self->super._userInfo = v6;

  if (dword_1001CCF28 <= 30 && (dword_1001CCF28 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  CFStringGetTypeID();
  uint64_t v8 = CFDictionaryGetTypedValue();
  if (v8)
  {
    long long v9 = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDString:v8];
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