@interface iOSSetupMainController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (BOOL)blockHardwareButtons;
- (NSString)myAppleID;
- (NSString)otherDeviceClassName;
- (NSUUID)deviceIdentifier;
- (SFDeviceSetupSessioniOS)setupSession;
- (int)testMode;
- (unint64_t)supportedInterfaceOrientations;
- (unsigned)badPINCount;
- (unsigned)otherDeviceClassCode;
- (unsigned)otherDeviceColorCode;
- (unsigned)otherDeviceModelCode;
- (void)_handleHomeButtonPressed;
- (void)_handleMigrateStart;
- (void)_handleMigrateStartDemo;
- (void)_handleMigrateStartUI;
- (void)_handleVisualAuthEvent:(int64_t)a3;
- (void)_handleVisualAuthScannedCode:(id)a3;
- (void)_sessionHandleProgress:(unsigned int)a3 info:(id)a4;
- (void)_sessionStart:(id)a3;
- (void)_tryPIN:(id)a3;
- (void)_willAppearInRemoteViewController;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dismiss:(int)a3;
- (void)dismiss:(int)a3 animated:(BOOL)a4;
- (void)handleButtonActions:(id)a3;
- (void)logUsageDone:(int)a3;
- (void)logUsageStart:(int)a3;
- (void)setBadPINCount:(unsigned int)a3;
- (void)setBlockHardwareButtons:(BOOL)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setMyAppleID:(id)a3;
- (void)setOtherDeviceClassCode:(unsigned __int8)a3;
- (void)setOtherDeviceClassName:(id)a3;
- (void)setOtherDeviceColorCode:(unsigned __int8)a3;
- (void)setOtherDeviceModelCode:(unsigned __int8)a3;
- (void)setSetupSession:(id)a3;
- (void)setTestMode:(int)a3;
- (void)showAuthUIWithFlags:(unsigned int)a3 throttleSeconds:(int)a4 animated:(BOOL)a5;
- (void)showBackupSyncUI:(unsigned int)a3 info:(id)a4;
- (void)showDoneUI:(id)a3;
- (void)showFinishUI;
- (void)showStartUI;
- (void)showWiFi;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation iOSSetupMainController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupSession, 0);
  objc_storeStrong((id *)&self->_otherDeviceClassName, 0);
  objc_storeStrong((id *)&self->_myAppleID, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_vcVisualAuthParent, 0);
  objc_storeStrong((id *)&self->_vcVisualAuth, 0);
  objc_storeStrong((id *)&self->_vcStart, 0);
  objc_storeStrong((id *)&self->_vcNav, 0);
  objc_storeStrong((id *)&self->_vcFinish, 0);
  objc_storeStrong((id *)&self->_vcDone, 0);
  objc_storeStrong((id *)&self->_vcBackupSync, 0);
  objc_storeStrong((id *)&self->_vcAuth, 0);
  objc_storeStrong((id *)&self->_storyboard, 0);
  objc_storeStrong((id *)&self->_migrationController, 0);

  objc_storeStrong((id *)&self->_fileTransferSession, 0);
}

- (void)setTestMode:(int)a3
{
  self->_testMode = a3;
}

- (int)testMode
{
  return self->_testMode;
}

- (void)setSetupSession:(id)a3
{
}

- (SFDeviceSetupSessioniOS)setupSession
{
  return self->_setupSession;
}

- (void)setOtherDeviceClassName:(id)a3
{
}

- (NSString)otherDeviceClassName
{
  return self->_otherDeviceClassName;
}

- (void)setOtherDeviceColorCode:(unsigned __int8)a3
{
  self->_otherDeviceColorCode = a3;
}

- (unsigned)otherDeviceColorCode
{
  return self->_otherDeviceColorCode;
}

- (void)setOtherDeviceModelCode:(unsigned __int8)a3
{
  self->_otherDeviceModelCode = a3;
}

- (unsigned)otherDeviceModelCode
{
  return self->_otherDeviceModelCode;
}

- (void)setOtherDeviceClassCode:(unsigned __int8)a3
{
  self->_otherDeviceClassCode = a3;
}

- (unsigned)otherDeviceClassCode
{
  return self->_otherDeviceClassCode;
}

- (void)setMyAppleID:(id)a3
{
}

- (NSString)myAppleID
{
  return self->_myAppleID;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setBlockHardwareButtons:(BOOL)a3
{
  self->_blockHardwareButtons = a3;
}

- (BOOL)blockHardwareButtons
{
  return self->_blockHardwareButtons;
}

- (void)setBadPINCount:(unsigned int)a3
{
  self->_badPINCount = a3;
}

- (unsigned)badPINCount
{
  return self->_badPINCount;
}

- (void)showWiFi
{
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v3 = [(UIStoryboard *)self->_storyboard instantiateViewControllerWithIdentifier:@"WiFi"];
  [v3 setMainController:self];
  sub_1001386A0(self->_vcNav, v3, 1);
}

- (void)showFinishUI
{
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  vcFinish = self->_vcFinish;
  if (!vcFinish)
  {
    v4 = [(UIStoryboard *)self->_storyboard instantiateViewControllerWithIdentifier:@"Finish"];
    v5 = self->_vcFinish;
    self->_vcFinish = v4;

    [(SVSBaseViewController *)self->_vcFinish setMainController:self];
    vcFinish = self->_vcFinish;
  }
  vcNav = self->_vcNav;

  sub_1001386A0(vcNav, vcFinish, 1);
}

- (void)showDoneUI:(id)a3
{
  id v9 = a3;
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize()))
  {
    id v8 = v9;
    LogPrintF();
  }
  vcDone = self->_vcDone;
  if (!vcDone)
  {
    v5 = [(UIStoryboard *)self->_storyboard instantiateViewControllerWithIdentifier:@"Done"];
    v6 = self->_vcDone;
    self->_vcDone = v5;

    [(SVSBaseViewController *)self->_vcDone setMainController:self];
    vcDone = self->_vcDone;
  }
  -[iOSSetupDoneViewController setError:](vcDone, "setError:", v9, v8);
  [(SFDeviceSetupSessioniOS *)self->_setupSession invalidate];
  setupSession = self->_setupSession;
  self->_setupSession = 0;

  sub_1001386A0(self->_vcNav, self->_vcDone, 1);
  [(iOSSetupMainController *)self logUsageDone:NSErrorToOSStatus()];
}

- (void)showBackupSyncUI:(unsigned int)a3 info:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v9 = a4;
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  vcBackupSync = self->_vcBackupSync;
  if (!vcBackupSync)
  {
    v7 = [(UIStoryboard *)self->_storyboard instantiateViewControllerWithIdentifier:@"BackupSync"];
    id v8 = self->_vcBackupSync;
    self->_vcBackupSync = v7;

    [(SVSBaseViewController *)self->_vcBackupSync setMainController:self];
    sub_1001386A0(self->_vcNav, self->_vcBackupSync, 1);
    vcBackupSync = self->_vcBackupSync;
  }
  [(iOSSetupBackupSyncViewController *)vcBackupSync handleProgressEvent:v4 info:v9];
}

- (void)showStartUI
{
  [(iOSSetupStartViewController *)self->_vcStart setAutoStart:1];
  vcNav = self->_vcNav;
  vcStart = self->_vcStart;

  sub_1001386A0(vcNav, vcStart, 1);
}

- (void)_tryPIN:(id)a3
{
  v7 = (__CFString *)a3;
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize()))
  {
    int v4 = IsAppleInternalBuild();
    CFStringRef v5 = @"*";
    if (v4) {
      CFStringRef v5 = v7;
    }
    CFStringRef v6 = v5;
    LogPrintF();
  }
  -[SFDeviceSetupSessioniOS tryPIN:](self->_setupSession, "tryPIN:", v7, v6);
}

- (void)_handleVisualAuthScannedCode:(id)a3
{
  id v4 = a3;
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (mach_absolute_time() >= self->_visualAuthNextTicks)
  {
    if (self->_visualAuthTryingCode)
    {
      if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
        goto LABEL_12;
      }
    }
    else
    {
      self->_visualAuthTryingCode = 1;
      [(iOSSetupMainController *)self _tryPIN:v4];
    }
  }
  else if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize()))
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
    if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(VPScannerViewController *)self->_vcVisualAuth dismissViewControllerAnimated:1 completion:0];
    vcVisualAuth = self->_vcVisualAuth;
    self->_vcVisualAuth = 0;

    id v8 = [(UIViewController *)self->_vcVisualAuthParent view];
    [v8 setHidden:0];

    vcVisualAuthParent = self->_vcVisualAuthParent;
    self->_vcVisualAuthParent = 0;

    [(SFDeviceSetupSessioniOS *)self->_setupSession setPairFlags:0];
    [(iOSSetupMainController *)self showAuthUIWithFlags:0 throttleSeconds:0xFFFFFFFFLL animated:0];
  }
  else if (a3 == 1)
  {
    if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v4 = self->_vcVisualAuth;
    BOOL v5 = v4 == 0;
    [(VPScannerViewController *)v4 dismissViewControllerAnimated:1 completion:0];
    CFStringRef v6 = self->_vcVisualAuth;
    self->_vcVisualAuth = 0;

    [(iOSSetupMainController *)self dismiss:5 animated:v5];
  }
  else if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)showAuthUIWithFlags:(unsigned int)a3 throttleSeconds:(int)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  self->_visualAuthTryingCode = 0;
  vcAuth = self->_vcAuth;
  if ((a3 & 0x100) == 0 || vcAuth)
  {
    if (vcAuth)
    {
      -[iOSSetupAuthViewController showWithFlags:throttleSeconds:](vcAuth, "showWithFlags:throttleSeconds:");
    }
    else
    {
      v14 = [(UIStoryboard *)self->_storyboard instantiateViewControllerWithIdentifier:@"ManualAuth", *(void *)&a4];
      v15 = self->_vcAuth;
      self->_vcAuth = v14;

      [(SVSBaseViewController *)self->_vcAuth setMainController:self];
      vcNav = self->_vcNav;
      v17 = self->_vcAuth;
      if (v5)
      {
        sub_1001386A0(vcNav, v17, 0);
      }
      else
      {
        v22 = self->_vcAuth;
        [(SVSCommonNavController *)vcNav pushViewController:v22 animated:0];
      }
    }
  }
  else
  {
    if (a4 >= 1)
    {
      uint64_t v8 = mach_absolute_time();
      self->_visualAuthNextTicks = SecondsToUpTicks() + v8;
    }
    if (!self->_vcVisualAuth)
    {
      id v9 = [(SVSCommonNavController *)self->_vcNav visibleViewController];
      vcVisualAuthParent = self->_vcVisualAuthParent;
      self->_vcVisualAuthParent = v9;

      v11 = +[VPScannerViewController instantiateViewController];
      vcVisualAuth = self->_vcVisualAuth;
      self->_vcVisualAuth = v11;

      if (self->_otherDeviceClassCode - 1 > 6) {
        CFStringRef v13 = @"_IPHONE";
      }
      else {
        CFStringRef v13 = off_1001A18E0[(self->_otherDeviceClassCode - 1)];
      }
      v18 = [@"IOS_SETUP_SCANNER_TITLE" stringByAppendingString:v13];
      v19 = sub_100138280(@"Localizable", v18);
      [(VPScannerViewController *)self->_vcVisualAuth setTitleMessage:v19];

      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100101B6C;
      v25[3] = &unk_1001A16D8;
      v25[4] = self;
      [(VPScannerViewController *)self->_vcVisualAuth setEventHandler:v25];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100101B78;
      v24[3] = &unk_1001A1BB0;
      v24[4] = self;
      [(VPScannerViewController *)self->_vcVisualAuth setScannedCodeHandler:v24];
      v20 = self->_vcNav;
      v21 = self->_vcVisualAuth;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100101B84;
      v23[3] = &unk_1001A1BD8;
      v23[4] = self;
      [(SVSCommonNavController *)v20 presentViewController:v21 animated:0 completion:v23];
    }
  }
}

- (void)_sessionHandleProgress:(unsigned int)a3 info:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  CFStringRef v6 = (__CFString *)a4;
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize()))
  {
    v7 = sub_100101F84(v4);
    CFStringRef v8 = &stru_1001A1DC0;
    if (v6) {
      CFStringRef v8 = v6;
    }
    v22 = v7;
    CFStringRef v23 = v8;
    LogPrintF();
  }
  setupSession = self->_setupSession;
  if (setupSession)
  {
    if ((int)v4 <= 299)
    {
      if ((int)v4 <= 96)
      {
        if (v4 == 20)
        {
          CFErrorGetTypeID();
          CFDictionaryGetTypedValue();
          id v10 = (id)objc_claimAutoreleasedReturnValue();
          [(iOSSetupMainController *)self showDoneUI:v10];
          v18 = [(iOSSetupMainController *)self _remoteViewControllerProxy];
          [v18 setIdleTimerDisabled:0 forReason:@"com.apple.SharingViewService.iOSSetup"];
        }
        else
        {
          if (v4 != 70 || !self->_vcVisualAuth) {
            goto LABEL_43;
          }
          id v10 = objc_alloc_init((Class)UINotificationFeedbackGenerator);
          [v10 notificationOccurred:0];
          vcVisualAuth = self->_vcVisualAuth;
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_10010289C;
          v24[3] = &unk_1001A1BD8;
          v24[4] = self;
          [(VPScannerViewController *)vcVisualAuth dismissViewControllerAnimated:1 completion:v24];
          v12 = self->_vcVisualAuth;
          self->_vcVisualAuth = 0;

          CFStringRef v13 = [(UIViewController *)self->_vcVisualAuthParent view];
          [v13 setHidden:0];

          vcVisualAuthParent = self->_vcVisualAuthParent;
          self->_vcVisualAuthParent = 0;
        }
        goto LABEL_43;
      }
      if (v4 == 97)
      {
        v15 = [(SFDeviceSetupSessioniOS *)setupSession fileTransferSessionTemplate];
        if (v15) {
          [(BYMigrationSourceController *)self->_migrationController setFileTransferSession:v15];
        }

        vcFinish = self->_vcFinish;
        uint64_t v17 = 97;
      }
      else
      {
        if (v4 != 99)
        {
          if (v4 == 240) {
            [(iOSSetupMainController *)self showFinishUI];
          }
          goto LABEL_43;
        }
        vcFinish = self->_vcFinish;
        uint64_t v17 = 99;
      }
      -[iOSSetupFinishViewController handleProgressEvent:](vcFinish, "handleProgressEvent:", v17, v22, v23);
      goto LABEL_43;
    }
    if ((int)v4 <= 399)
    {
      if (v4 == 300 || v4 == 310) {
        -[iOSSetupMainController showBackupSyncUI:info:](self, "showBackupSyncUI:info:", v4, v6, v22, v23);
      }
    }
    else
    {
      switch(v4)
      {
        case 0x190:
          if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          v19 = self->_vcVisualAuth;
          BOOL v20 = v19 == 0;
          -[VPScannerViewController dismissViewControllerAnimated:completion:](v19, "dismissViewControllerAnimated:completion:", 1, 0, v22, v23);
          v21 = self->_vcVisualAuth;
          self->_vcVisualAuth = 0;

          [(iOSSetupMainController *)self dismiss:17 animated:v20];
          break;
        case 0x191:
          if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          -[iOSSetupMainController _handleVisualAuthEvent:](self, "_handleVisualAuthEvent:", 2, v22, v23);
          break;
        case 0x19A:
          [(iOSSetupMainController *)self _handleMigrateStart];
          break;
      }
    }
  }
LABEL_43:
}

- (void)_sessionStart:(id)a3
{
  id v4 = a3;
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize()))
  {
    id v8 = v4;
    LogPrintF();
  }
  [(SFDeviceSetupSessioniOS *)self->_setupSession invalidate];
  BOOL v5 = (SFDeviceSetupSessioniOS *)objc_alloc_init((Class)SFDeviceSetupSessioniOS);
  setupSession = self->_setupSession;
  self->_setupSession = v5;

  [(SFDeviceSetupSessioniOS *)self->_setupSession setPeerDevice:v4];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100102A90;
  v10[3] = &unk_1001A1B10;
  v10[4] = self;
  [(SFDeviceSetupSessioniOS *)self->_setupSession setProgressHandler:v10];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100102AA0;
  v9[3] = &unk_1001A1B60;
  v9[4] = self;
  [(SFDeviceSetupSessioniOS *)self->_setupSession setPromptForPINHandler:v9];
  [(SFDeviceSetupSessioniOS *)self->_setupSession activate];
  [(iOSSetupMainController *)self logUsageStart:9];
  v7 = [(iOSSetupMainController *)self _remoteViewControllerProxy];
  [v7 setIdleTimerDisabled:1 forReason:@"com.apple.SharingViewService.iOSSetup"];
}

- (void)logUsageDone:(int)a3
{
  if (!self->_loggedUsageDone)
  {
    uint64_t v3 = *(void *)&a3;
    self->_loggedUsageDone = 1;
    CFStringGetTypeID();
    uint64_t v5 = CFDictionaryGetTypedValue();
    if (v5) {
      CFStringRef v6 = (__CFString *)v5;
    }
    else {
      CFStringRef v6 = &stru_1001A1DC0;
    }
    uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
    mach_absolute_time();
    uint64_t v8 = UpTicksToMilliseconds();
    v15[0] = v6;
    v14[0] = @"sid";
    v14[1] = @"smoothedRSSI";
    id v9 = +[NSNumber numberWithInt:Int64Ranged];
    v15[1] = v9;
    v14[2] = @"errorCode";
    id v10 = +[NSNumber numberWithInt:v3];
    v15[2] = v10;
    v14[3] = @"durationMs";
    v11 = +[NSNumber numberWithUnsignedLongLong:v8];
    v15[3] = v11;
    v14[4] = @"badPINCount";
    v12 = +[NSNumber numberWithUnsignedInt:self->_badPINCount];
    v15[4] = v12;
    CFStringRef v13 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:5];
    SFMetricsLog();

    if (dword_1001CC338 <= 50 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
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
      uint64_t v5 = (__CFString *)v4;
    }
    else {
      uint64_t v5 = &stru_1001A1DC0;
    }
    uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
    mach_absolute_time();
    uint64_t v7 = UpTicksToMilliseconds();
    v13[0] = v5;
    v12[0] = @"sid";
    v12[1] = @"smoothedRSSI";
    uint64_t v8 = +[NSNumber numberWithInt:Int64Ranged];
    v13[1] = v8;
    v12[2] = @"action";
    id v9 = +[NSNumber numberWithInt:v3];
    v13[2] = v9;
    v12[3] = @"userMs";
    id v10 = +[NSNumber numberWithUnsignedLongLong:v7];
    v13[3] = v10;
    v11 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4];
    SFMetricsLog();

    if (dword_1001CC338 <= 50 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)_handleMigrateStartUI
{
  id v6 = [(SFDeviceSetupSessioniOS *)self->_setupSession fileTransferSessionTemplate];
  if (v6)
  {
    uint64_t v3 = (BYMigrationSourceController *)objc_alloc_init((Class)BYMigrationSourceController);
    migrationController = self->_migrationController;
    self->_migrationController = v3;

    if (self->_migrationController)
    {
      if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        -[BYMigrationSourceController launchSetupForMigration:](self->_migrationController, "launchSetupForMigration:", v6, v6);
      }
      else
      {
        -[BYMigrationSourceController launchSetupForMigration:](self->_migrationController, "launchSetupForMigration:", v6, v5);
      }
      goto LABEL_14;
    }
    if (dword_1001CC338 <= 90 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
      goto LABEL_11;
    }
  }
  else if (dword_1001CC338 <= 90 && (dword_1001CC338 != -1 || _LogCategory_Initialize()))
  {
LABEL_11:
    LogPrintF();
  }
LABEL_14:
}

- (void)_handleMigrateStartDemo
{
  if (!self->_fileTransferSession)
  {
    if (dword_1001CC338 <= 50 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v3 = [(SFDeviceSetupSessioniOS *)self->_setupSession fileTransferSessionTemplate];
    fileTransferSession = self->_fileTransferSession;
    self->_fileTransferSession = v3;
    uint64_t v5 = v3;

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10010345C;
    v16[3] = &unk_1001A1A08;
    v16[4] = self;
    [(RPFileTransferSession *)v5 setCompletionHandler:v16];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100103514;
    v15[3] = &unk_1001A0DF0;
    v15[4] = v5;
    [(RPFileTransferSession *)v5 setProgressHandler:v15];
    [(RPFileTransferSession *)v5 setReceivedItemHandler:&stru_1001A0E30];
    [(RPFileTransferSession *)v5 activate];
    id v6 = +[NSURL fileURLWithPath:@"/tmp/Test1.txt" relativeToURL:0];
    uint64_t v7 = +[NSData dataWithBytes:"Test1" length:5];
    [v7 writeToURL:v6 options:0 error:0];

    id v8 = objc_alloc_init((Class)RPFileTransferItem);
    [v8 setItemURL:v6];
    [(RPFileTransferSession *)v5 addItem:v8];
    id v9 = +[NSURL fileURLWithPath:@"/tmp/Test2.txt" relativeToURL:0];

    id v10 = +[NSData dataWithBytes:"Test2" length:5];
    [v10 writeToURL:v9 options:0 error:0];

    id v11 = objc_alloc_init((Class)RPFileTransferItem);
    [v11 setItemURL:v9];
    [(RPFileTransferSession *)v5 addItem:v11];
    v12 = +[NSURL fileURLWithPath:@"/tmp/Test3.txt" relativeToURL:0];

    CFStringRef v13 = +[NSData dataWithBytes:"Test3" length:5];
    [v13 writeToURL:v12 options:0 error:0];

    id v14 = objc_alloc_init((Class)RPFileTransferItem);
    [v14 setItemURL:v12];
    [(RPFileTransferSession *)v5 addItem:v14];
    [(RPFileTransferSession *)v5 finish];
  }
}

- (void)_handleMigrateStart
{
  if (CFPrefs_GetInt64())
  {
    [(iOSSetupMainController *)self _handleMigrateStartDemo];
  }
  else
  {
    [(iOSSetupMainController *)self _handleMigrateStartUI];
  }
}

- (void)_handleHomeButtonPressed
{
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (self->_homePressed || MKBGetDeviceLockState() - 1 > 1)
  {
    [(iOSSetupMainController *)self dismiss:4];
  }
  else
  {
    if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_homePressed = 1;
  }
}

- (void)handleButtonActions:(id)a3
{
  id v4 = a3;
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize()))
  {
    if (self->_blockHardwareButtons) {
      uint64_t v5 = "yes";
    }
    else {
      uint64_t v5 = "no";
    }
    id v12 = v4;
    CFStringRef v13 = v5;
    LogPrintF();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (!self->_blockHardwareButtons
          && ([*(id *)(*((void *)&v14 + 1) + 8 * i) events] & 0x10) != 0)
        {
          [(iOSSetupMainController *)self _handleHomeButtonPressed];
        }
        [v11 sendResponseWithUnHandledEvents:0 v12, v13, v14];
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)dismiss:(int)a3 animated:(BOOL)a4
{
  if (!self->_dismissed)
  {
    BOOL v4 = a4;
    self->_dismissed = 1;
    [(iOSSetupMainController *)self logUsageStart:*(void *)&a3];
    [(iOSSetupMainController *)self _remoteViewControllerProxy];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100103B04;
    v7[3] = &unk_1001A1BD8;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = v8;
    [(iOSSetupMainController *)self dismissViewControllerAnimated:v4 completion:v7];
  }
}

- (void)dismiss:(int)a3
{
  [(iOSSetupMainController *)self dismiss:*(void *)&a3 animated:a3 != 19];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v5 = [(iOSSetupMainController *)self _remoteViewControllerProxy];
  [v5 setIdleTimerDisabled:0 forReason:@"com.apple.SharingViewService.iOSSetup"];

  if (!self->_dismissed)
  {
    if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(iOSSetupMainController *)self dismiss:21];
  }
  [(SFDeviceSetupSessioniOS *)self->_setupSession invalidate];
  setupSession = self->_setupSession;
  self->_setupSession = 0;

  storyboard = self->_storyboard;
  self->_storyboard = 0;

  [(SVSBaseViewController *)self->_vcAuth setMainController:0];
  vcAuth = self->_vcAuth;
  self->_vcAuth = 0;

  [(SVSBaseViewController *)self->_vcBackupSync setMainController:0];
  vcBackupSync = self->_vcBackupSync;
  self->_vcBackupSync = 0;

  [(SVSBaseViewController *)self->_vcDone setMainController:0];
  vcDone = self->_vcDone;
  self->_vcDone = 0;

  [(SVSBaseViewController *)self->_vcFinish setMainController:0];
  vcFinish = self->_vcFinish;
  self->_vcFinish = 0;

  vcNav = self->_vcNav;
  self->_vcNav = 0;

  [(SVSBaseViewController *)self->_vcStart setMainController:0];
  vcStart = self->_vcStart;
  self->_vcStart = 0;

  v14.receiver = self;
  v14.super_class = (Class)iOSSetupMainController;
  [(SVSBaseMainController *)&v14 viewDidDisappear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v14.receiver = self;
  v14.super_class = (Class)iOSSetupMainController;
  [(iOSSetupMainController *)&v14 viewDidAppear:v3];
  self->_viewAppearedTicks = mach_absolute_time();
  uint64_t v5 = +[UIStoryboard storyboardWithName:@"iOSSetup" bundle:0];
  storyboard = self->_storyboard;
  self->_storyboard = v5;

  id v7 = [(UIStoryboard *)self->_storyboard instantiateInitialViewController];
  vcNav = self->_vcNav;
  self->_vcNav = v7;

  [(SVSCommonNavController *)self->_vcNav setDelegate:self];
  [(SVSCommonNavController *)self->_vcNav setModalPresentationStyle:4];
  uint64_t v9 = +[UIDevice currentDevice];
  unint64_t v10 = (unint64_t)[v9 userInterfaceIdiom];

  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    [(SVSCommonNavController *)self->_vcNav setModalTransitionStyle:2];
  }
  [(SVSCommonNavController *)self->_vcNav setTransitioningDelegate:self->_vcNav];
  id v11 = [(SVSCommonNavController *)self->_vcNav viewControllers];
  id v12 = [v11 firstObject];
  vcStart = self->_vcStart;
  self->_vcStart = v12;

  [(SVSBaseViewController *)self->_vcStart setMainController:self];
  [(iOSSetupMainController *)self presentViewController:self->_vcNav animated:1 completion:0];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(iOSSetupMainController *)self view];
  BOOL v3 = [v2 window];

  if (!v3) {
    return 30;
  }
  BOOL v4 = +[UIDevice currentDevice];
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

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  objc_super v14 = (void (**)(void))a4;
  id v6 = [a3 userInfo];
  userInfo = self->super._userInfo;
  self->super._userInfo = v6;

  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  CFStringGetTypeID();
  id v8 = CFDictionaryGetTypedValue();
  if ([v8 isEqual:@"00000000-0000-0000-0000-000000000001"])
  {
    int v9 = 1;
  }
  else
  {
    if (![v8 isEqual:@"00000000-0000-0000-0000-000000000002"]) {
      goto LABEL_10;
    }
    int v9 = 2;
  }
  self->_testMode = v9;
LABEL_10:
  if (v8)
  {
    unint64_t v10 = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDString:v8];
    deviceIdentifier = self->_deviceIdentifier;
    self->_deviceIdentifier = v10;
  }
  self->_otherDeviceClassCode = CFDictionaryGetInt64Ranged();
  self->_otherDeviceModelCode = CFDictionaryGetInt64Ranged();
  self->_otherDeviceColorCode = CFDictionaryGetInt64Ranged();
  SFLocalizedStringForKey();
  id v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  otherDeviceClassName = self->_otherDeviceClassName;
  self->_otherDeviceClassName = v12;

  if (v14) {
    v14[2](v14);
  }
}

- (void)_willAppearInRemoteViewController
{
  v4.receiver = self;
  v4.super_class = (Class)iOSSetupMainController;
  [(SVSBaseMainController *)&v4 _willAppearInRemoteViewController];
  BOOL v3 = [(iOSSetupMainController *)self _remoteViewControllerProxy];
  [v3 setAllowsAlertStacking:1];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

@end