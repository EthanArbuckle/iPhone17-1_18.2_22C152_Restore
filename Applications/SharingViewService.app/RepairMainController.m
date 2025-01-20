@interface RepairMainController
- (NSUUID)deviceIdentifier;
- (id)productImage;
- (int)testMode;
- (unint64_t)supportedInterfaceOrientations;
- (unsigned)deviceColorCode;
- (void)_sessionHandleProgress:(unsigned int)a3 info:(id)a4;
- (void)_sessionStart:(id)a3;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dismiss:(int)a3;
- (void)dismiss:(int)a3 completion:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)logUsageDone:(int)a3;
- (void)logUsageStart:(int)a3;
- (void)setDeviceColorCode:(unsigned __int8)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setTestMode:(int)a3;
- (void)showDoneUI:(int)a3;
- (void)showDoneUI:(int)a3 error:(id)a4 final:(BOOL)a5;
- (void)showProgressUI;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation RepairMainController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_productImage, 0);
  objc_storeStrong((id *)&self->_vcStart, 0);
  objc_storeStrong((id *)&self->_vcProgress, 0);
  objc_storeStrong((id *)&self->_vcNav, 0);
  objc_storeStrong((id *)&self->_vcDone, 0);
  objc_storeStrong((id *)&self->_storyboard, 0);

  objc_storeStrong((id *)&self->_sfSession, 0);
}

- (void)setTestMode:(int)a3
{
  self->_testMode = a3;
}

- (int)testMode
{
  return self->_testMode;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceColorCode:(unsigned __int8)a3
{
  self->_deviceColorCode = a3;
}

- (unsigned)deviceColorCode
{
  return self->_deviceColorCode;
}

- (id)productImage
{
  productImage = self->_productImage;
  if (!productImage)
  {
    id v8 = 0;
    id v9 = 0;
    id v7 = 0;
    sub_100137568(1u, [(RepairMainController *)self deviceColorCode], 13, &v9, 0, &v8, &v7);
    v4 = +[UIImage imageNamed:v9 inBundle:v7];
    v5 = self->_productImage;
    self->_productImage = v4;

    productImage = self->_productImage;
  }

  return productImage;
}

- (void)showProgressUI
{
  if (dword_1001CC9D8 <= 30 && (dword_1001CC9D8 != -1 || _LogCategory_Initialize())) {
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

- (void)showDoneUI:(int)a3 error:(id)a4 final:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a3;
  id v14 = a4;
  if (self->_vcDone)
  {
    if (!v5) {
      goto LABEL_17;
    }
    goto LABEL_12;
  }
  if (dword_1001CC9D8 <= 30 && (dword_1001CC9D8 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v13 = v6;
    LogPrintF();
  }
  if ((v6 & 0xFFFFFFFB) == 0x497C8) {
    CFStringRef v8 = @"WiFiError";
  }
  else {
    CFStringRef v8 = @"Done";
  }
  -[UIStoryboard instantiateViewControllerWithIdentifier:](self->_storyboard, "instantiateViewControllerWithIdentifier:", v8, v13);
  id v9 = (RepairDoneViewController *)objc_claimAutoreleasedReturnValue();
  vcDone = self->_vcDone;
  self->_vcDone = v9;

  [(SVSBaseViewController *)self->_vcDone setMainController:self];
  [(RepairDoneViewController *)self->_vcDone setStatus:v6];
  [(RepairDoneViewController *)self->_vcDone setError:v14];
  sub_1001386A0(self->_vcNav, self->_vcDone, 0);
  [(RepairMainController *)self logUsageDone:v6];
  if (v5)
  {
LABEL_12:
    if (dword_1001CC9D8 <= 30 && (dword_1001CC9D8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SFDeviceRepairSession *)self->_sfSession invalidate];
    sfSession = self->_sfSession;
    self->_sfSession = 0;

    v12 = [(RepairMainController *)self _remoteViewControllerProxy];
    [v12 setIdleTimerDisabled:0 forReason:@"com.apple.SharingViewService.Repair"];
  }
LABEL_17:
}

- (void)showDoneUI:(int)a3
{
}

- (void)_sessionHandleProgress:(unsigned int)a3 info:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if ((int)v4 <= 199)
  {
    switch(v4)
    {
      case 0x14:
        id v8 = v6;
        if (dword_1001CC9D8 <= 30 && (dword_1001CC9D8 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        [(RepairMainController *)self showDoneUI:0 error:0 final:1];
        break;
      case 0x1E:
        id v8 = v6;
        CFErrorGetTypeID();
        id v7 = CFDictionaryGetTypedValue();
        if (dword_1001CC9D8 <= 60 && (dword_1001CC9D8 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        [(RepairMainController *)self showDoneUI:NSErrorToOSStatus() error:v7 final:1];

        break;
      case 0x60:
        id v8 = v6;
        if (dword_1001CC9D8 <= 30 && (dword_1001CC9D8 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        [(RepairMainController *)self showDoneUI:0];
        break;
      default:
        goto LABEL_24;
    }
    goto LABEL_23;
  }
  if ((v4 - 200) <= 0x1E && ((1 << (v4 + 56)) & 0x40100001) != 0)
  {
    id v8 = v6;
    [(RepairProgressViewController *)self->_vcProgress handleProgressEvent:v4];
LABEL_23:
    id v6 = v8;
  }
LABEL_24:
}

- (void)_sessionStart:(id)a3
{
  id v4 = a3;
  if (dword_1001CC9D8 <= 30 && (dword_1001CC9D8 != -1 || _LogCategory_Initialize()))
  {
    id v9 = v4;
    LogPrintF();
  }
  -[RepairMainController logUsageStart:](self, "logUsageStart:", 9, v9);
  [(RepairMainController *)self showProgressUI];
  if (self->_testMode)
  {
    dispatch_time_t v5 = dispatch_time(0, 3000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100125BCC;
    block[3] = &unk_1001A1BD8;
    block[4] = self;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    [(SFDeviceRepairSession *)self->_sfSession invalidate];
    id v6 = (SFDeviceRepairSession *)objc_alloc_init((Class)SFDeviceRepairSession);
    sfSession = self->_sfSession;
    self->_sfSession = v6;

    [(SFDeviceRepairSession *)self->_sfSession setPeerDevice:v4];
    [(SFDeviceRepairSession *)self->_sfSession setPresentingViewController:self->_vcStart];
    [(SFDeviceRepairSession *)self->_sfSession setRepairFlags:CFDictionaryGetInt64Ranged()];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100125C00;
    v10[3] = &unk_1001A1B10;
    v10[4] = self;
    [(SFDeviceRepairSession *)self->_sfSession setProgressHandler:v10];
    [(SFDeviceRepairSession *)self->_sfSession activate];
    id v8 = [(RepairMainController *)self _remoteViewControllerProxy];
    [v8 setIdleTimerDisabled:1 forReason:@"com.apple.SharingViewService.Repair"];
  }
}

- (void)logUsageDone:(int)a3
{
  if (!self->_loggedUsageDone)
  {
    uint64_t v3 = *(void *)&a3;
    self->_loggedUsageDone = 1;
    CFStringGetTypeID();
    uint64_t v4 = CFDictionaryGetTypedValue();
    if (v4) {
      dispatch_time_t v5 = (__CFString *)v4;
    }
    else {
      dispatch_time_t v5 = &stru_1001A1DC0;
    }
    uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
    mach_absolute_time();
    uint64_t v7 = UpTicksToMilliseconds();
    v12[0] = @"_cat";
    v12[1] = @"_op";
    v13[0] = @"Repair";
    v13[1] = @"Done";
    v13[2] = v5;
    v12[2] = @"sid";
    v12[3] = @"rssi";
    id v8 = +[NSNumber numberWithInt:Int64Ranged];
    v13[3] = v8;
    v12[4] = @"error";
    id v9 = +[NSNumber numberWithInt:v3];
    v13[4] = v9;
    v12[5] = @"ms";
    v10 = +[NSNumber numberWithUnsignedLongLong:v7];
    v13[5] = v10;
    v11 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:6];
    SFDashboardLogJSON();

    if (dword_1001CC9D8 <= 50 && (dword_1001CC9D8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)logUsageStart:(int)a3
{
  if (!self->_loggedUsageStart)
  {
    uint64_t v3 = *(void *)&a3;
    self->_loggedUsageStart = 1;
    CFStringGetTypeID();
    uint64_t v4 = CFDictionaryGetTypedValue();
    if (v4) {
      dispatch_time_t v5 = (__CFString *)v4;
    }
    else {
      dispatch_time_t v5 = &stru_1001A1DC0;
    }
    uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
    mach_absolute_time();
    uint64_t v7 = UpTicksToMilliseconds();
    v12[0] = @"_cat";
    v12[1] = @"_op";
    v13[0] = @"Repair";
    v13[1] = @"Start";
    v13[2] = v5;
    v12[2] = @"sid";
    v12[3] = @"rssi";
    id v8 = +[NSNumber numberWithInt:Int64Ranged];
    v13[3] = v8;
    v12[4] = @"action";
    id v9 = +[NSNumber numberWithInt:v3];
    v13[4] = v9;
    v12[5] = @"ms";
    v10 = +[NSNumber numberWithUnsignedLongLong:v7];
    v13[5] = v10;
    v11 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:6];
    SFDashboardLogJSON();

    if (dword_1001CC9D8 <= 50 && (dword_1001CC9D8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
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
          if (dword_1001CC9D8 <= 30 && (dword_1001CC9D8 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          [(RepairMainController *)self dismiss:4];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)dismiss:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (!self->_dismissed)
  {
    self->_dismissed = 1;
    [(RepairMainController *)self logUsageStart:v4];
    uint64_t v7 = [(RepairMainController *)self _remoteViewControllerProxy];
    id v8 = v7;
    vcNav = self->_vcNav;
    if (vcNav)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1001262DC;
      v10[3] = &unk_1001A1AE8;
      id v12 = v6;
      id v11 = v8;
      [(SVSCommonNavController *)vcNav dismissViewControllerAnimated:1 completion:v10];
    }
    else
    {
      [v7 dismiss];
    }
  }
}

- (void)dismiss:(int)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC9D8 <= 30 && (dword_1001CC9D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v5 = [(RepairMainController *)self _remoteViewControllerProxy];
  [v5 setIdleTimerDisabled:0 forReason:@"com.apple.SharingViewService.Repair"];

  if (!self->_dismissed)
  {
    if (dword_1001CC9D8 <= 30 && (dword_1001CC9D8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RepairMainController *)self dismiss:21];
  }
  [(SFDeviceRepairSession *)self->_sfSession invalidate];
  sfSession = self->_sfSession;
  self->_sfSession = 0;

  storyboard = self->_storyboard;
  self->_storyboard = 0;

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

  v12.receiver = self;
  v12.super_class = (Class)RepairMainController;
  [(SVSBaseMainController *)&v12 viewDidDisappear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC9D8 <= 30 && (dword_1001CC9D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v14.receiver = self;
  v14.super_class = (Class)RepairMainController;
  [(RepairMainController *)&v14 viewDidAppear:v3];
  self->_viewAppearedTicks = mach_absolute_time();
  id v5 = +[UIStoryboard storyboardWithName:@"Repair" bundle:0];
  storyboard = self->_storyboard;
  self->_storyboard = v5;

  uint64_t v7 = [(UIStoryboard *)self->_storyboard instantiateInitialViewController];
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
  id v11 = [(SVSCommonNavController *)self->_vcNav viewControllers];
  objc_super v12 = [v11 firstObject];
  vcStart = self->_vcStart;
  self->_vcStart = v12;

  [(SVSBaseViewController *)self->_vcStart setMainController:self];
  [(RepairMainController *)self presentViewController:self->_vcNav animated:1 completion:0];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(RepairMainController *)self view];
  BOOL v3 = [v2 window];

  if (!v3) {
    return 30;
  }
  uint64_t v4 = +[UIDevice currentDevice];
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
  v15 = (void (**)(void))a4;
  id v6 = [a3 userInfo];
  userInfo = self->super._userInfo;
  self->super._userInfo = v6;

  if (dword_1001CC9D8 <= 30 && (dword_1001CC9D8 != -1 || _LogCategory_Initialize()))
  {
    objc_super v14 = self->super._userInfo;
    LogPrintF();
  }
  self->_deviceColorCode = CFDictionaryGetInt64Ranged();
  CFStringGetTypeID();
  id v8 = CFDictionaryGetTypedValue();
  if (v8)
  {
    long long v9 = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDString:v8];
    deviceIdentifier = self->_deviceIdentifier;
    self->_deviceIdentifier = v9;
  }
  if (objc_msgSend(v8, "isEqual:", @"00000000-0000-0000-0000-000000000001", v14))
  {
    int v11 = 1;
LABEL_13:
    objc_super v12 = v15;
LABEL_14:
    self->_testMode = v11;
    goto LABEL_15;
  }
  if ([v8 isEqual:@"00000000-0000-0000-0000-000000000002"])
  {
    int v11 = 2;
    goto LABEL_13;
  }
  if ([v8 isEqual:@"00000000-0000-0000-0000-000000000003"])
  {
    int v11 = 3;
    goto LABEL_13;
  }
  unsigned int v13 = [v8 isEqual:@"00000000-0000-0000-0000-000000000004"];
  objc_super v12 = v15;
  if (v13)
  {
    int v11 = 4;
    goto LABEL_14;
  }
LABEL_15:
  if (v12) {
    v15[2]();
  }
}

@end