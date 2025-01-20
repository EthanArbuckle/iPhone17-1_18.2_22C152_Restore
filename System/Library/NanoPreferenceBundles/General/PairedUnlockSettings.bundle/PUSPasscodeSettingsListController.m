@interface PUSPasscodeSettingsListController
- (BOOL)_endLockoutAvailable;
- (BOOL)_gizmoHardwareSupportsSEP;
- (BOOL)_gizmoSupportEnvironmentalDosimetry;
- (BOOL)_gizmoSupportEucalyptus;
- (BOOL)_gizmoSupportHeartRateAlert;
- (BOOL)_gizmoSupportPasscodePolicySync;
- (BOOL)_gizmoSupportWatchGestures;
- (BOOL)_gizmoSupportsKappaDetection;
- (BOOL)_gizmoSupportsRespiratoryRate;
- (BOOL)_gizmoSupportsSEPWristDetectSetting;
- (BOOL)_gizmoSupportsScandium;
- (BOOL)_passcodeModificationAllowed;
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)devicesArePairedForUnlocking;
- (BOOL)gizmoHasCredentialedPasses;
- (BOOL)gizmoHasPaymentPasses;
- (BOOL)gizmoIsInLockout;
- (BOOL)gizmoUnlocksPhone;
- (PUConnection)connection;
- (PURemoteDeviceState)gizmoState;
- (PUSPasscodeSettingsListController)init;
- (SFAutoUnlockManager)autoUnlockManager;
- (id)autoUnlockEnabledValue;
- (id)checkGizmoUnlockedCompletionHandler;
- (id)eraseDataEnabledValue;
- (id)simplePasscodeEnabledValue;
- (id)specifiers;
- (id)wristDetectValue:(id)a3;
- (int)activityFlags;
- (unint64_t)_passcodeMinimumLength;
- (void)_addActivityFlag:(int)a3;
- (void)_cancelRemoteAction;
- (void)_checkGizmoLockState;
- (void)_checkHasCredentialedPasses;
- (void)_checkHasPaymentPasses;
- (void)_enableAutoUnlockCanceled:(id)a3;
- (void)_enableAutoUnlockConfirmed:(id)a3;
- (void)_finishRemoteAction:(BOOL)a3;
- (void)_handleError:(id)a3;
- (void)_handleUnknownError;
- (void)_noteAppWillResignActive;
- (void)_promptForGizmoUnlock;
- (void)_removeActivityFlag:(int)a3;
- (void)_resetSimplePasscodeChangeIfNeeded;
- (void)_setGizmoState:(id)a3;
- (void)_setWristDetectFooter:(id)a3 reload:(BOOL)a4;
- (void)_showWristDetectDisableConfirmation;
- (void)_startRemoteAction:(int64_t)a3;
- (void)_storeAndSyncSimplePasscodeEnabled:(BOOL)a3;
- (void)_updateLockoutState;
- (void)_updateSimplePasscodeState;
- (void)_updateUnlockPhoneEnabled;
- (void)_updateUnlockState;
- (void)alertView:(id)a3 willDismissWithButtonIndex:(int64_t)a4;
- (void)cancelDisableWristDetect:(id)a3;
- (void)changePasscode;
- (void)confirmDisablePasscode:(id)a3;
- (void)confirmDisableWristDetect:(id)a3;
- (void)dealloc;
- (void)endLockout:(id)a3;
- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4;
- (void)reloadUI;
- (void)remotePasscodeViewControllerDidCancel:(id)a3;
- (void)setActivityFlags:(int)a3;
- (void)setAutoUnlockEnabledValue:(id)a3;
- (void)setAutoUnlockManager:(id)a3;
- (void)setCheckGizmoUnlockedCompletionHandler:(id)a3;
- (void)setDevicesArePairedForUnlocking:(BOOL)a3;
- (void)setEraseDataEnabledValue:(id)a3;
- (void)setGizmoHasCredentialedPasses:(BOOL)a3;
- (void)setGizmoHasPaymentPasses:(BOOL)a3;
- (void)setGizmoIsInLockout:(BOOL)a3;
- (void)setGizmoState:(id)a3;
- (void)setGizmoUnlocksPhone:(BOOL)a3;
- (void)setSimplePasscodeEnabledValue:(id)a3;
- (void)setWristDetectValue:(id)a3 specifier:(id)a4;
- (void)togglePasscode:(id)a3;
- (void)unlockConnection:(id)a3 remoteDeviceDidCompleteRemoteAction:(BOOL)a4 remoteDeviceState:(id)a5 error:(id)a6;
- (void)unlockConnection:(id)a3 remoteDeviceDidNotifyState:(id)a4;
@end

@implementation PUSPasscodeSettingsListController

- (PUSPasscodeSettingsListController)init
{
  v18.receiver = self;
  v18.super_class = (Class)PUSPasscodeSettingsListController;
  v2 = [(PUSPasscodeSettingsListController *)&v18 init];
  if (v2)
  {
    v3 = (PUConnection *)objc_alloc_init((Class)PUConnection);
    connection = v2->_connection;
    v2->_connection = v3;

    [(PUConnection *)v2->_connection setDelegate:v2];
    v5 = (PURemoteDeviceState *)objc_alloc_init((Class)PURemoteDeviceState);
    gizmoState = v2->_gizmoState;
    v2->_gizmoState = v5;

    v2->_gizmoHasPaymentPasses = 0;
    v2->_gizmoHasCredentialedPasses = 0;
    v2->_activityFlags = 0;
    uint64_t v7 = objc_opt_new();
    syncManager = v2->_syncManager;
    v2->_syncManager = (NPSManager *)v7;

    uint64_t v9 = objc_opt_new();
    autoUnlockManager = v2->_autoUnlockManager;
    v2->_autoUnlockManager = (SFAutoUnlockManager *)v9;

    [(PUSPasscodeSettingsListController *)v2 _updateSimplePasscodeState];
    [(PUSPasscodeSettingsListController *)v2 _updateLockoutState];
    [(PUSPasscodeSettingsListController *)v2 _checkGizmoLockState];
    [(PUSPasscodeSettingsListController *)v2 _checkHasPaymentPasses];
    [(PUSPasscodeSettingsListController *)v2 _checkHasCredentialedPasses];
    [(PUSPasscodeSettingsListController *)v2 _updateUnlockState];
    [(PUSPasscodeSettingsListController *)v2 _updateUnlockPhoneEnabled];
    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v2 selector:"_noteAppWillResignActive" name:UIApplicationWillResignActiveNotification object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_4ECC, @"CSLLockoutStateDidChangeNotification", 0, (CFNotificationSuspensionBehavior)0);
    v13 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v13, v2, (CFNotificationCallback)sub_4ED4, @"NanoSimplePasscodeSettingChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
    v14 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v14, v2, (CFNotificationCallback)sub_4EDC, SFPairedUnlockStateChangedNotification, 0, (CFNotificationSuspensionBehavior)0);
    v15 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v15, v2, (CFNotificationCallback)sub_4EE4, @"CSLDisableWristDetectionChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
    v16 = +[MCProfileConnection sharedConnection];
    [v16 addObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5 = +[MCProfileConnection sharedConnection];
  [v5 removeObserver:self];

  unlockPairingAssertion = self->_unlockPairingAssertion;
  if (unlockPairingAssertion)
  {
    CFRelease(unlockPairingAssertion);
    self->_unlockPairingAssertion = 0;
  }
  [(PUConnection *)self->_connection setDelegate:0];
  connection = self->_connection;
  self->_connection = 0;

  v8.receiver = self;
  v8.super_class = (Class)PUSPasscodeSettingsListController;
  [(PUSPasscodeSettingsListController *)&v8 dealloc];
}

- (void)_setGizmoState:(id)a3
{
  id v5 = a3;
  v6 = pu_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Updating gizmo state %@", buf, 0xCu);
  }

  objc_storeStrong((id *)&self->_gizmoState, a3);
  if (![(PURemoteDeviceState *)self->_gizmoState isPasscodeLocked])
  {
    objc_super v8 = pu_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Allow user to view settings because gizmo is unlocked", buf, 2u);
    }
    goto LABEL_7;
  }
  unsigned int v7 = [(PUSPasscodeSettingsListController *)self _endLockoutAvailable];
  objc_super v8 = pu_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Will bypass lockout to allow user re-enable pin entry", buf, 2u);
    }
LABEL_7:

    [(PUSPasscodeSettingsListController *)self _removeActivityFlag:2];
    goto LABEL_14;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Will ask user to enter passcode on gizmo", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_5230;
  v10[3] = &unk_103E8;
  objc_copyWeak(&v11, (id *)buf);
  [(PUSPasscodeSettingsListController *)self setCheckGizmoUnlockedCompletionHandler:v10];
  [(PUSPasscodeSettingsListController *)self _promptForGizmoUnlock];
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
LABEL_14:
}

- (void)_checkGizmoLockState
{
  v3 = pu_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Checking gizmo state", (uint8_t *)buf, 2u);
  }

  [(PUSPasscodeSettingsListController *)self _addActivityFlag:2];
  objc_initWeak(buf, self);
  connection = self->_connection;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_5390;
  v5[3] = &unk_10410;
  objc_copyWeak(&v6, buf);
  [(PUConnection *)connection queryRemoteDeviceState:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

- (void)_checkHasPaymentPasses
{
  [(PUSPasscodeSettingsListController *)self _addActivityFlag:8];
  id v3 = objc_alloc_init((Class)NPKCompanionAgentConnection);
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_54EC;
  v4[3] = &unk_10438;
  objc_copyWeak(&v5, &location);
  [v3 paymentPassUniqueIDsSynchronous:1 reply:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_checkHasCredentialedPasses
{
  [(PUSPasscodeSettingsListController *)self _addActivityFlag:64];
  id v3 = objc_alloc_init((Class)NPKCompanionAgentConnection);
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_5650;
  v4[3] = &unk_10438;
  objc_copyWeak(&v5, &location);
  [v3 credentialedPassUniqueIDsSynchronous:1 reply:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_updateUnlockState
{
  [(PUSPasscodeSettingsListController *)self _addActivityFlag:16];
  id v3 = pu_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Checking with Sharing if paired unlock is enabled", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v4 = +[SFUnlockManager sharedUnlockManager];
  uint64_t v5 = IDSDefaultPairedDevice;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_581C;
  v6[3] = &unk_10460;
  objc_copyWeak(&v7, buf);
  v6[4] = self;
  [v4 unlockEnabledWithDevice:v5 completionHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

- (void)_updateUnlockPhoneEnabled
{
  id v3 = pu_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Checking with Sharing if gizmo can unlock phone", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  autoUnlockManager = self->_autoUnlockManager;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_5A34;
  v5[3] = &unk_10488;
  objc_copyWeak(&v6, buf);
  [(SFAutoUnlockManager *)autoUnlockManager eligibleAutoUnlockDevicesWithCompletionHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

- (void)_handleError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 domain];
  id v6 = pu_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Received error %{public}@", buf, 0xCu);
  }

  if ([v5 isEqualToString:@"com.apple.paired-unlock"])
  {
    id v7 = (char *)[v4 code];
    if (v7 == (unsigned char *)&dword_4 + 2)
    {
      if (self->_pendingAction == 2) {
        [(PUSPasscodeSettingsListController *)self _resetSimplePasscodeChangeIfNeeded];
      }
    }
    else if (v7 == (unsigned char *)&dword_4 + 1)
    {
      CFStringRef v8 = @"BUSY_TITLE_PASSCODE_ENABLE";
      switch(self->_pendingAction)
      {
        case 1:
          goto LABEL_18;
        case 2:
          CFStringRef v8 = @"BUSY_TITLE_PASSCODE_CHANGE";
          goto LABEL_18;
        case 3:
          unsigned int v9 = [(PURemoteDeviceState *)self->_gizmoState isUnlockOnly];
          CFStringRef v8 = @"BUSY_TITLE_PASSCODE_DISABLE";
          if (v9) {
            CFStringRef v8 = @"BUSY_TITLE_PASSCODE_DISABLE_UNLOCK_ONLY";
          }
          goto LABEL_18;
        case 4:
          CFStringRef v8 = @"BUSY_TITLE_UNLOCK_ENABLE";
LABEL_18:
          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472;
          v11[2] = sub_5E90;
          v11[3] = &unk_104B0;
          v11[4] = self;
          v12 = (__CFString *)v8;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

          break;
        default:
          break;
      }
    }
    else if (v7 == (unsigned char *)&dword_0 + 2)
    {
      [(PUSPasscodeSettingsListController *)self _promptForGizmoUnlock];
    }
  }
  else if (([v5 isEqualToString:SFUnlockErrorDomian] & 1) == 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_6000;
    block[3] = &unk_104D8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_handleUnknownError
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_6138;
  v8[3] = &unk_104D8;
  v8[4] = self;
  id v3 = objc_retainBlock(v8);
  id v4 = [(PUSPasscodeSettingsListController *)self transitionCoordinator];

  if (v4)
  {
    uint64_t v5 = [(PUSPasscodeSettingsListController *)self transitionCoordinator];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_6200;
    v6[3] = &unk_10550;
    v6[4] = self;
    id v7 = v3;
    [v5 animateAlongsideTransition:0 completion:v6];
  }
  else
  {
    ((void (*)(void *))v3[2])(v3);
  }
}

- (void)_promptForGizmoUnlock
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_63F4;
  block[3] = &unk_104D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_finishRemoteAction:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = pu_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = PURemoteActionToString();
    id v7 = +[NSNumber numberWithBool:v3];
    int v15 = 138412546;
    v16 = v6;
    __int16 v17 = 2112;
    objc_super v18 = v7;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Finished remote action %@, completed = %@", (uint8_t *)&v15, 0x16u);
  }
  [(PUSPasscodeSettingsListController *)self _removeActivityFlag:4];
  int64_t pendingAction = self->_pendingAction;
  if (pendingAction == 5)
  {
    if (v3)
    {
      v10 = +[SFUnlockManager sharedUnlockManager];
      [v10 disableUnlockWithDevice:IDSDefaultPairedDevice];
    }
    else
    {
      v10 = [(PUSPasscodeSettingsListController *)self specifierForID:@"WRIST_DETECTION_CELL_ID"];
      id v11 = pu_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = +[NSNumber numberWithBool:[(PURemoteDeviceState *)self->_gizmoState isWristDetectEnabled]];
        int v15 = 138412290;
        v16 = v12;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Cancelled remote action wristDetect = %@", (uint8_t *)&v15, 0xCu);
      }
      id v13 = +[NSNumber numberWithBool:[(PURemoteDeviceState *)self->_gizmoState isWristDetectEnabled]];
      [(PUSPasscodeSettingsListController *)self setPreferenceValue:v13 specifier:v10];
    }
  }
  else if (pendingAction == 4)
  {
    unlockPairingAssertion = self->_unlockPairingAssertion;
    if (unlockPairingAssertion)
    {
      CFRelease(unlockPairingAssertion);
      self->_unlockPairingAssertion = 0;
    }
  }
  id v14 = [(PUSPasscodeSettingsListController *)self presentedViewController];

  if (v14) {
    [(PUSPasscodeSettingsListController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_updateLockoutState
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6858;
  block[3] = &unk_104D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_updateSimplePasscodeState
{
  id v3 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.nanosystemsettings"];
  id v4 = [v3 synchronize];
  char v9 = 0;
  unsigned __int8 v5 = [v3 BOOLForKey:@"simple-passcode" keyExistsAndHasValidFormat:&v9];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_6990;
  v7[3] = &unk_10578;
  if (v9) {
    char v6 = v5;
  }
  else {
    char v6 = 1;
  }
  char v8 = v6;
  v7[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

- (void)_startRemoteAction:(int64_t)a3
{
  unsigned __int8 v5 = pu_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = PURemoteActionToString();
    *(_DWORD *)buf = 138412290;
    v23 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Starting remote action %@", buf, 0xCu);
  }
  id v7 = [(PUSPasscodeSettingsListController *)self presentedViewController];

  if (!v7)
  {
    self->_int64_t pendingAction = a3;
    [(PUSPasscodeSettingsListController *)self _addActivityFlag:4];
    unsigned int v8 = [(PURemoteDeviceState *)self->_gizmoState isUnlockOnly];
    if (a3 == 3) {
      unsigned int v9 = v8;
    }
    else {
      unsigned int v9 = 0;
    }
    if (((a3 == 2) & v8) != 0) {
      int64_t v10 = 1;
    }
    else {
      int64_t v10 = a3;
    }
    if ([(PUSPasscodeSettingsListController *)self _gizmoSupportsSEPWristDetectSetting])
    {
      if (a3 == 5) {
        goto LABEL_20;
      }
      if (a3 == 6)
      {
        if (([(PURemoteDeviceState *)self->_gizmoState hasPasscodeSet] ^ 1 | v9)) {
          goto LABEL_20;
        }
LABEL_19:
        v12 = [[PUSRemotePasscodeViewController alloc] initWithAction:v10];
        [(PUSRemotePasscodeViewController *)v12 setPasscodeDelegate:self];
        [(PUSPasscodeSettingsListController *)self presentViewController:v12 animated:1 completion:0];

        goto LABEL_20;
      }
      if ((v9 & 1) == 0) {
        goto LABEL_19;
      }
    }
    else
    {
      if (a3 == 6) {
        char v11 = 1;
      }
      else {
        char v11 = v9;
      }
      if ((v11 & 1) == 0) {
        goto LABEL_19;
      }
    }
LABEL_20:
    if (self->_wantsSimplePasscode) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = 2;
    }
    [(PUConnection *)self->_connection requestRemoteDeviceRemoteAction:a3 type:v13];
    if (a3 == 4)
    {
      unlockPairingAssertion = self->_unlockPairingAssertion;
      if (unlockPairingAssertion) {
        CFRelease(unlockPairingAssertion);
      }
      v20[0] = @"MKBAssertionKey";
      v20[1] = @"MKBAssertionTimeout";
      v21[0] = @"RemoteProfile";
      v21[1] = &off_11210;
      +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
      self->_unlockPairingAssertion = (__MKBAssertion *)MKBDeviceLockAssertion();
      [(PURemoteDeviceState *)self->_gizmoState version];
      if ((NRVersionIsGreaterThanOrEqual() & 1) == 0)
      {
        id v15 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.Carousel"];
        [v15 setBool:0 forKey:@"DisableWristDetection"];
        id v16 = [v15 synchronize];
        syncManager = self->_syncManager;
        objc_super v18 = +[NSSet setWithObject:@"DisableWristDetection"];
        [(NPSManager *)syncManager synchronizeNanoDomain:@"com.apple.Carousel" keys:v18];

        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, @"CSLDisableWristDetectionChangedNotification", 0, 0, 0);
      }
    }
  }
}

- (void)_noteAppWillResignActive
{
}

- (void)_resetSimplePasscodeChangeIfNeeded
{
  if (self->_justChangedWantsSimplePasscode)
  {
    [(PUSPasscodeSettingsListController *)self _storeAndSyncSimplePasscodeEnabled:!self->_wantsSimplePasscode];
    self->_justChangedWantsSimplePasscode = 0;
  }
}

- (void)_cancelRemoteAction
{
  id v3 = pu_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Canceling remote action", v4, 2u);
  }

  [(PUSPasscodeSettingsListController *)self _resetSimplePasscodeChangeIfNeeded];
  [(PUConnection *)self->_connection requestRemoteDeviceRemoteAction:0 type:0];
  [(PUSPasscodeSettingsListController *)self _finishRemoteAction:0];
}

- (void)remotePasscodeViewControllerDidCancel:(id)a3
{
}

- (void)unlockConnection:(id)a3 remoteDeviceDidCompleteRemoteAction:(BOOL)a4 remoteDeviceState:(id)a5 error:(id)a6
{
  BOOL v7 = a4;
  id v9 = a5;
  id v10 = a6;
  char v11 = pu_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    BOOL v18 = v7;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Remote action completed:%{BOOL}u, gizmo state: %@", buf, 0x12u);
  }

  if (v7)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_6F4C;
    block[3] = &unk_104B0;
    id v15 = v9;
    id v16 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else if (v10)
  {
    [(PUSPasscodeSettingsListController *)self _handleError:v10];
  }
  else
  {
    [(PUSPasscodeSettingsListController *)self _resetSimplePasscodeChangeIfNeeded];
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_708C;
  v12[3] = &unk_10578;
  v12[4] = self;
  BOOL v13 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
}

- (void)unlockConnection:(id)a3 remoteDeviceDidNotifyState:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_7144;
  v6[3] = &unk_104B0;
  id v7 = a4;
  unsigned int v8 = self;
  id v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (id)specifiers
{
  id v3 = (id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  id v4 = *v3;
  if (!*v3)
  {
    id v5 = [(PUSPasscodeSettingsListController *)self loadSpecifiersFromPlistName:@"PasscodeSettings" target:self];
    if (self->_activityFlags || self->_gizmoIsInLockout) {
      unsigned int v6 = 1;
    }
    else {
      unsigned int v6 = [(PURemoteDeviceState *)self->_gizmoState isPasscodeLocked];
    }
    id v7 = [v5 specifierForID:@"TOGGLE_PASSCODE_ID"];
    unsigned int v8 = +[MCProfileConnection sharedConnection];
    unsigned int v71 = [v8 BOOLRestrictionForFeature:MCFeatureAlphanumericPasscodeRequired];
    unsigned int v9 = [(PUSPasscodeSettingsListController *)self _passcodeModificationAllowed];
    unsigned int v10 = v9;
    uint64_t v11 = 0;
    unsigned int v74 = v6;
    if ((v6 & 1) == 0 && v9)
    {
      if ([(PURemoteDeviceState *)self->_gizmoState hasPasscodeSet]) {
        uint64_t v11 = (v71 != 1) & ~[v8 isPasscodeRequired];
      }
      else {
        uint64_t v11 = 1;
      }
    }
    v68 = v8;
    id location = v3;
    v12 = pu_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v13 = [(PURemoteDeviceState *)self->_gizmoState hasPasscodeSet];
      BOOL gizmoIsInLockout = self->_gizmoIsInLockout;
      *(_DWORD *)buf = 67110144;
      unsigned int v77 = v6;
      __int16 v78 = 1024;
      BOOL v79 = v71 == 1;
      __int16 v80 = 1024;
      unsigned int v81 = v10;
      __int16 v82 = 1024;
      unsigned int v83 = v13;
      __int16 v84 = 1024;
      BOOL v85 = gizmoIsInLockout;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "busyOrDisabled:%{BOOL}u, requireUnlockOnly:%{BOOL}u, passcodeModificationAllowed:%{BOOL}u, hasPasscodeSet:%{BOOL}u, gizmoIsInLockout:%{BOOL}u", buf, 0x20u);
    }

    id v15 = +[NSNumber numberWithBool:v11];
    uint64_t v75 = PSEnabledKey;
    objc_msgSend(v7, "setProperty:forKey:", v15);

    if ([(PURemoteDeviceState *)self->_gizmoState hasPasscodeSet])
    {
      unsigned __int8 v16 = [(PURemoteDeviceState *)self->_gizmoState isUnlockOnly];
      __int16 v17 = +[NSBundle bundleForClass:objc_opt_class()];
      BOOL v18 = v17;
      char v19 = v74;
      if (v16) {
        CFStringRef v20 = @"PASSCODE_DISABLE_UNLOCK_ONLY";
      }
      else {
        CFStringRef v20 = @"PASSCODE_DISABLE";
      }
      v21 = [v17 localizedStringForKey:v20 value:&stru_107E8 table:@"PasscodeSettings"];
    }
    else
    {
      BOOL v18 = +[NSBundle bundleForClass:objc_opt_class()];
      v21 = [v18 localizedStringForKey:@"PASSCODE_ENABLE" value:&stru_107E8 table:@"PasscodeSettings"];
      char v19 = v74;
    }
    [v7 setName:v21];

    v73 = [v5 specifierForID:@"CHANGE_PASSCODE_ID"];
    if (v19)
    {
      uint64_t v22 = 0;
    }
    else
    {
      unsigned int v23 = [(PURemoteDeviceState *)self->_gizmoState hasPasscodeSet];
      if (v71 == 1) {
        unsigned int v24 = 0;
      }
      else {
        unsigned int v24 = v23;
      }
      uint64_t v22 = v24 & v10;
    }
    v69 = v7;
    v25 = +[NSNumber numberWithInt:v22];
    [v73 setProperty:v25 forKey:v75];

    LODWORD(v25) = [(PURemoteDeviceState *)self->_gizmoState isUnlockOnly];
    v26 = +[NSBundle bundleForClass:objc_opt_class()];
    v27 = v26;
    if (v25) {
      CFStringRef v28 = @"PASSCODE_CHANGE_UNLOCK_ONLY";
    }
    else {
      CFStringRef v28 = @"PASSCODE_CHANGE";
    }
    v29 = [v26 localizedStringForKey:v28 value:&stru_107E8 table:@"PasscodeSettings"];
    [v73 setName:v29];

    if (![(PUSPasscodeSettingsListController *)self _endLockoutAvailable])
    {
      v30 = [v5 specifierForID:@"END_LOCKOUT_GROUP_ID"];
      [v5 removeObject:v30];

      v31 = [v5 specifierForID:@"END_LOCKOUT_BUTTON_ID"];
      [v5 removeObject:v31];
    }
    v32 = +[MCProfileConnection sharedConnection];
    unsigned int v33 = [v32 isPasscodeSet];

    v72 = [v5 specifierForID:@"SIMPLE_PASSCODE_SWITCH_ID"];
    unint64_t v34 = [(PUSPasscodeSettingsListController *)self _passcodeMinimumLength];
    unsigned int v35 = [(PURemoteDeviceState *)self->_gizmoState isUnlockOnly];
    v36 = pu_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      unsigned int v77 = v33;
      __int16 v78 = 1024;
      BOOL v79 = v34 > 4;
      __int16 v80 = 1024;
      unsigned int v81 = v35;
      _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "thisDeviceHasPasscode:%{BOOL}u, nonSimplePasscodeRequired:%{BOOL}u, isUnlockOnly:%{BOOL}u", buf, 0x14u);
    }

    if (v35)
    {
      v37 = pu_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
        sub_AC30(v37);
      }
    }
    if ((v19 & 1) != 0 || ![(PURemoteDeviceState *)self->_gizmoState hasPasscodeSet])
    {
      uint64_t v40 = 0;
    }
    else
    {
      unsigned __int8 v38 = [(PURemoteDeviceState *)self->_gizmoState isUnlockOnly];
      if (v34 < 5) {
        unsigned int v39 = v10;
      }
      else {
        unsigned int v39 = 0;
      }
      if (v38) {
        uint64_t v40 = 0;
      }
      else {
        uint64_t v40 = v39;
      }
    }
    v41 = +[NSNumber numberWithInt:v40];
    [v72 setProperty:v41 forKey:v75];

    v42 = [v5 specifierForID:@"SIMPLE_PASSCODE_GROUP_ID"];
    v43 = +[NSBundle bundleForClass:objc_opt_class()];
    v44 = [v43 localizedStringForKey:@"SIMPLE_PASSCODE_DESCRIPTION" value:&stru_107E8 table:@"PasscodeSettings"];
    v45 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v44, 4);
    uint64_t v46 = PSFooterTextGroupKey;
    v67 = v42;
    [v42 setProperty:v45 forKey:PSFooterTextGroupKey];

    v47 = [v5 specifierForID:@"AUTO_UNLOCK_SWITCH_ID"];
    if ((v74 & 1) != 0
      || ([(PURemoteDeviceState *)self->_gizmoState hasPasscodeSet] & v33) != 1)
    {
      BOOL v48 = 0;
    }
    else
    {
      BOOL v48 = ([(PURemoteDeviceState *)self->_gizmoState isUnlockOnly] & 1) == 0
         && v71 != 1;
    }
    v49 = +[NSNumber numberWithInt:v48];
    [v47 setProperty:v49 forKey:v75];

    v50 = [v5 specifierForID:@"AUTO_UNLOCK_GROUP_ID"];
    v51 = +[NSBundle bundleForClass:objc_opt_class()];
    v52 = v51;
    if (v33) {
      CFStringRef v53 = @"AUTO_UNLOCK_DESCRIPTION";
    }
    else {
      CFStringRef v53 = @"AUTO_UNLOCK_COMPANION_NO_PASSCODE_DESCRIPTION";
    }
    v54 = [v51 localizedStringForKey:v53 value:&stru_107E8 table:@"PasscodeSettings"];
    [v50 setProperty:v54 forKey:v46];

    v55 = [v5 specifierForID:@"ERASE_DATA_SWITCH_ID"];
    if (v74) {
      id v56 = 0;
    }
    else {
      id v56 = [(PURemoteDeviceState *)self->_gizmoState hasPasscodeSet];
    }
    v57 = +[NSNumber numberWithInt:v56];
    [v55 setProperty:v57 forKey:v75];

    v58 = [v5 specifierForID:@"ERASE_DATA_GROUP_ID"];
    uint64_t v59 = +[NSBundle bundleForClass:objc_opt_class()];
    v60 = [(id)v59 localizedStringForKey:@"ERASE_DATA_DESCRIPTION" value:&stru_107E8 table:@"PasscodeSettings"];
    v61 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v60, 10);
    [v58 setProperty:v61 forKey:v46];

    objc_storeStrong(location, v5);
    v62 = [*location specifierForID:@"WRIST_DETECTION_CELL_ID"];
    v63 = +[MCProfileConnection sharedConnection];
    LOBYTE(v59) = [v63 isSettingLockedDownByRestrictions:MCFeatureWatchWristDetectRequired];

    if (v59) {
      unsigned int v64 = 0;
    }
    else {
      unsigned int v64 = [(PURemoteDeviceState *)self->_gizmoState isUnlockOnly] ^ 1;
    }
    v65 = +[NSNumber numberWithInt:v64 & (v74 ^ 1)];
    [v62 setProperty:v65 forKey:v75];

    [(PUSPasscodeSettingsListController *)self _setWristDetectFooter:v62 reload:0];
    id v4 = *location;
  }

  return v4;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (void)confirmDisablePasscode:(id)a3
{
  if ([(PURemoteDeviceState *)self->_gizmoState hasPasscodeSet])
  {
    [(PUSPasscodeSettingsListController *)self _startRemoteAction:3];
  }
}

- (void)togglePasscode:(id)a3
{
  id v4 = a3;
  if ([(PURemoteDeviceState *)self->_gizmoState hasPasscodeSet])
  {
    if (self->_gizmoHasPaymentPasses)
    {
      id v5 = objc_alloc_init((Class)PSConfirmationSpecifier);
      unsigned int v6 = [(PURemoteDeviceState *)self->_gizmoState isUnlockOnly];
      id v7 = +[NSBundle bundleForClass:objc_opt_class()];
      unsigned int v8 = v7;
      if (v6) {
        CFStringRef v9 = @"PASSCODE_DISABLE_WARNING_TITLE_UNLOCK_ONLY";
      }
      else {
        CFStringRef v9 = @"PASSCODE_DISABLE_WARNING_TITLE";
      }
      unsigned int v10 = [v7 localizedStringForKey:v9 value:&stru_107E8 table:@"PasscodeSettings"];

      BOOL gizmoHasCredentialedPasses = self->_gizmoHasCredentialedPasses;
      unsigned int v12 = [(PURemoteDeviceState *)self->_gizmoState isUnlockOnly];
      unsigned int v13 = +[NSBundle bundleForClass:objc_opt_class()];
      id v14 = v13;
      CFStringRef v15 = @"PASSCODE_DISABLE_WARNING_BODY_CARDS_AND_KEYS";
      if (v12) {
        CFStringRef v15 = @"PASSCODE_DISABLE_WARNING_BODY_CARDS_AND_KEYS_UNLOCK_ONLY";
      }
      CFStringRef v16 = @"PASSCODE_DISABLE_WARNING_BODY_CARDS_UNLOCK_ONLY";
      if (!v12) {
        CFStringRef v16 = @"PASSCODE_DISABLE_WARNING_BODY_CARDS";
      }
      if (gizmoHasCredentialedPasses) {
        CFStringRef v17 = v15;
      }
      else {
        CFStringRef v17 = v16;
      }
      BOOL v18 = [v13 localizedStringForKey:v17 value:&stru_107E8 table:@"PasscodeSettings"];

      v24[0] = PSConfirmationTitleKey;
      v24[1] = PSConfirmationPromptKey;
      v25[0] = v10;
      v25[1] = v18;
      v24[2] = PSConfirmationOKKey;
      char v19 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v20 = [v19 localizedStringForKey:@"PASSCODE_DISABLE_WARNING_CONFIRM" value:&stru_107E8 table:@"PasscodeSettings"];
      v25[2] = v20;
      v24[3] = PSConfirmationCancelKey;
      v21 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v22 = [v21 localizedStringForKey:@"PASSCODE_DISABLE_WARNING_CANCEL" value:&stru_107E8 table:@"PasscodeSettings"];
      v25[3] = v22;
      unsigned int v23 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];
      [v5 setupWithDictionary:v23];

      [v5 setTarget:self];
      [v5 setConfirmationAction:"confirmDisablePasscode:"];
      [v5 setProperty:&__kCFBooleanTrue forKey:PSConfirmationDestructiveKey];
      [(PUSPasscodeSettingsListController *)self showConfirmationViewForSpecifier:v5];
    }
    else
    {
      [(PUSPasscodeSettingsListController *)self confirmDisablePasscode:v4];
    }
  }
  else
  {
    [(PUSPasscodeSettingsListController *)self _startRemoteAction:1];
  }
}

- (void)changePasscode
{
  if ([(PURemoteDeviceState *)self->_gizmoState hasPasscodeSet])
  {
    [(PUSPasscodeSettingsListController *)self _startRemoteAction:2];
  }
}

- (void)endLockout:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  connection = self->_connection;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_80C4;
  v6[3] = &unk_105A0;
  objc_copyWeak(&v7, &location);
  [(PUConnection *)connection requestRemoteDeviceRemoveLockout:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (id)autoUnlockEnabledValue
{
  id v3 = pu_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int activityFlags = self->_activityFlags;
    int64_t pendingAction = self->_pendingAction;
    unsigned int v6 = +[MCProfileConnection sharedConnection];
    unsigned int v7 = [v6 isPasscodeSet];
    unsigned int v8 = [(PURemoteDeviceState *)self->_gizmoState hasPasscodeSet];
    BOOL devicesArePairedForUnlocking = self->_devicesArePairedForUnlocking;
    v15[0] = 67110144;
    v15[1] = activityFlags;
    __int16 v16 = 1024;
    int v17 = pendingAction;
    __int16 v18 = 1024;
    unsigned int v19 = v7;
    __int16 v20 = 1024;
    unsigned int v21 = v8;
    __int16 v22 = 1024;
    BOOL v23 = devicesArePairedForUnlocking;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "activityFlags:0x%X, _pendingAction:%u, isPasscodeSet:%{BOOL}u, hasPasscodeSet:%{BOOL}u, devicesArePairedForUnlocking:%{BOOL}u", (uint8_t *)v15, 0x20u);
  }
  if (![(PURemoteDeviceState *)self->_gizmoState hasPasscodeSet])
  {
    BOOL v10 = 0;
    id v11 = 0;
    if ((self->_activityFlags & 4) == 0) {
      goto LABEL_12;
    }
LABEL_8:
    if (!v10 && self->_pendingAction != 4) {
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  BOOL v10 = self->_devicesArePairedForUnlocking;
  if ((self->_activityFlags & 4) != 0) {
    goto LABEL_8;
  }
  if (!self->_devicesArePairedForUnlocking)
  {
LABEL_10:
    id v11 = 0;
    goto LABEL_12;
  }
LABEL_11:
  unsigned int v12 = +[MCProfileConnection sharedConnection];
  id v11 = [v12 isPasscodeSet];

LABEL_12:
  unsigned int v13 = +[NSNumber numberWithBool:v11];

  return v13;
}

- (void)setAutoUnlockEnabledValue:(id)a3
{
  if ([a3 BOOLValue])
  {
    if ([(PURemoteDeviceState *)self->_gizmoState isWristDetectEnabled])
    {
      [(PUSPasscodeSettingsListController *)self _enableAutoUnlockConfirmed:0];
    }
    else
    {
      id v4 = objc_alloc_init((Class)PSConfirmationSpecifier);
      v14[0] = PSConfirmationTitleKey;
      unsigned int v13 = +[NSBundle bundleForClass:objc_opt_class()];
      unsigned int v12 = [v13 localizedStringForKey:@"AUTO_UNLOCK_CONFIRMATION_OK" value:&stru_107E8 table:@"PasscodeSettings"];
      v15[0] = v12;
      v14[1] = PSConfirmationPromptKey;
      id v5 = +[NSBundle bundleForClass:objc_opt_class()];
      unsigned int v6 = [v5 localizedStringForKey:@"AUTO_UNLOCK_CONFIRMATION_BODY" value:&stru_107E8 table:@"PasscodeSettings"];
      v15[1] = v6;
      v14[2] = PSConfirmationOKKey;
      unsigned int v7 = +[NSBundle bundleForClass:objc_opt_class()];
      unsigned int v8 = [v7 localizedStringForKey:@"AUTO_UNLOCK_CONFIRMATION_OK" value:&stru_107E8 table:@"PasscodeSettings"];
      _DWORD v15[2] = v8;
      v14[3] = PSConfirmationCancelKey;
      CFStringRef v9 = +[NSBundle bundleForClass:objc_opt_class()];
      BOOL v10 = [v9 localizedStringForKey:@"AUTO_UNLOCK_CONFIRMATION_CANCEL" value:&stru_107E8 table:@"PasscodeSettings"];
      v15[3] = v10;
      id v11 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];
      [v4 setupWithDictionary:v11];

      [v4 setTarget:self];
      [v4 setConfirmationAction:"_enableAutoUnlockConfirmed:"];
      [v4 setConfirmationCancelAction:"_enableAutoUnlockCanceled:"];
      [(PUSPasscodeSettingsListController *)self showConfirmationViewForSpecifier:v4];
    }
  }
  else
  {
    [(PUConnection *)self->_connection unpairForUnlock];
    self->_BOOL devicesArePairedForUnlocking = 0;
  }
}

- (void)_enableAutoUnlockConfirmed:(id)a3
{
}

- (void)_enableAutoUnlockCanceled:(id)a3
{
}

- (id)simplePasscodeEnabledValue
{
  unint64_t v3 = [(PUSPasscodeSettingsListController *)self _passcodeMinimumLength];
  unsigned int v4 = [(PUSPasscodeSettingsListController *)self _passcodeModificationAllowed];
  if (!self->_wantsSimplePasscode || v3 >= 5) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = v4;
  }

  return +[NSNumber numberWithInt:v6];
}

- (unint64_t)_passcodeMinimumLength
{
  if ([(PUSPasscodeSettingsListController *)self _gizmoSupportPasscodePolicySync])
  {
    unint64_t v3 = [(PURemoteDeviceState *)self->_gizmoState passcodePolicy];
    id v4 = [v3 passcodeMinimumLength];
  }
  else
  {
    id v5 = +[MCProfileConnection sharedConnection];
    unint64_t v3 = [v5 valueRestrictionForFeature:MCFeatureMinimumPasscodeLength];

    if (!v3)
    {
      unint64_t v6 = 0;
      goto LABEL_7;
    }
    id v4 = [v3 unsignedIntegerValue];
  }
  unint64_t v6 = (unint64_t)v4;
LABEL_7:

  return v6;
}

- (BOOL)_passcodeModificationAllowed
{
  if ([(PUSPasscodeSettingsListController *)self _gizmoSupportPasscodePolicySync])
  {
    unint64_t v3 = [(PURemoteDeviceState *)self->_gizmoState passcodePolicy];
    unsigned __int8 v4 = [v3 isModificationAllowed];
  }
  else
  {
    unint64_t v3 = +[MCProfileConnection sharedConnection];
    unsigned __int8 v4 = [v3 isPasscodeModificationAllowed];
  }
  BOOL v5 = v4;

  return v5;
}

- (void)_storeAndSyncSimplePasscodeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.nanosystemsettings"];
  self->_wantsSimplePasscode = v3;
  [v8 setBool:v3 forKey:@"simple-passcode"];
  id v5 = [v8 synchronize];
  syncManager = self->_syncManager;
  unsigned int v7 = +[NSSet setWithObject:@"simple-passcode"];
  [(NPSManager *)syncManager synchronizeNanoDomain:@"com.apple.nanosystemsettings" keys:v7];
}

- (void)setSimplePasscodeEnabledValue:(id)a3
{
  id v4 = [a3 BOOLValue];
  if (self->_wantsSimplePasscode != v4)
  {
    [(PUSPasscodeSettingsListController *)self _storeAndSyncSimplePasscodeEnabled:v4];
    self->_justChangedWantsSimplePasscode = 1;
    [(PUSPasscodeSettingsListController *)self _startRemoteAction:2];
  }
}

- (id)eraseDataEnabledValue
{
  id v2 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.nanosystemsettings"];
  id v3 = [v2 synchronize];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 BOOLForKey:@"erase-data-enabled"]);

  return v4;
}

- (void)setEraseDataEnabledValue:(id)a3
{
  id v4 = a3;
  id v9 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.nanosystemsettings"];
  id v5 = [v4 BOOLValue];

  [v9 setBool:v5 forKey:@"erase-data-enabled"];
  id v6 = [v9 synchronize];
  syncManager = self->_syncManager;
  id v8 = +[NSSet setWithObject:@"erase-data-enabled"];
  [(NPSManager *)syncManager synchronizeNanoDomain:@"com.apple.nanosystemsettings" keys:v8];
}

- (void)setWristDetectValue:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  if ([a3 BOOLValue])
  {
    unsigned int v7 = pu_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = +[NSNumber numberWithUnsignedInt:[(PURemoteDeviceState *)self->_gizmoState version]];
      int v10 = 138412290;
      id v11 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "enabling wrist dection, paired device version = %@", (uint8_t *)&v10, 0xCu);
    }
    [(PURemoteDeviceState *)self->_gizmoState version];
    if (NRVersionIsGreaterThanOrEqual())
    {
      [(PUSPasscodeSettingsListController *)self _startRemoteAction:6];
    }
    else
    {
      id v9 = [(PUSPasscodeSettingsListController *)self specifierForID:@"WRIST_DETECTION_CELL_ID"];
      [(PUSPasscodeSettingsListController *)self setPreferenceValue:&__kCFBooleanTrue specifier:v9];
    }
  }
  else
  {
    [(PUSPasscodeSettingsListController *)self _showWristDetectDisableConfirmation];
  }
  [(PUSPasscodeSettingsListController *)self _setWristDetectFooter:v6 reload:1];
}

- (id)wristDetectValue:(id)a3
{
  id v3 = [(PUSPasscodeSettingsListController *)self readPreferenceValue:a3];
  unsigned int v4 = [v3 BOOLValue];

  id v5 = +[MCProfileConnection sharedConnection];
  uint64_t v6 = v4 | [v5 isSettingLockedDownByRestrictions:MCFeatureWatchWristDetectRequired];

  return +[NSNumber numberWithBool:v6];
}

- (void)_setWristDetectFooter:(id)a3 reload:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [(PUSPasscodeSettingsListController *)self readPreferenceValue:a3];
  unsigned int v7 = [v6 BOOLValue];

  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = v8;
  if (v7) {
    CFStringRef v10 = @"WRIST_DETECTION_FOOTER";
  }
  else {
    CFStringRef v10 = @"WRIST_DETECTION_OFF_FOOTER";
  }
  id v12 = [v8 localizedStringForKey:v10 value:&stru_107E8 table:@"PasscodeSettings"];

  id v11 = [(PUSPasscodeSettingsListController *)self specifierForID:@"WRIST_DETECTION_GROUP_ID"];
  [v11 setProperty:v12 forKey:PSFooterTextGroupKey];
  if (v4) {
    [(PUSPasscodeSettingsListController *)self reloadSpecifier:v11];
  }
}

- (void)_showWristDetectDisableConfirmation
{
  id v3 = objc_alloc_init((Class)PSConfirmationSpecifier);
  BOOL v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"WRIST_DETECTION_DISABLE_WARNING_CONFIRM" value:&stru_107E8 table:@"PasscodeSettings"];
  [v3 setTitle:v5];

  uint64_t v6 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v7 = [v6 localizedStringForKey:@"WRIST_DETECTION_DISABLE_WARNING_MSG" value:&stru_107E8 table:@"PasscodeSettings"];
  id v8 = +[NSMutableString stringWithString:v7];

  LODWORD(v7) = self->_devicesArePairedForUnlocking;
  id v9 = +[NSBundle bundleForClass:objc_opt_class()];
  CFStringRef v10 = v9;
  if (v7) {
    CFStringRef v11 = @"WRIST_DETECTION_DISABLE_WARNING_MSG_PAIREDUNLOCK";
  }
  else {
    CFStringRef v11 = @"WRIST_DETECTION_DISABLE_WARNING_MSG_AUTOLOCK";
  }
  id v12 = [v9 localizedStringForKey:v11 value:&stru_107E8 table:@"PasscodeSettings"];
  [v8 appendString:v12];

  if ([(PUSPasscodeSettingsListController *)self gizmoUnlocksPhone])
  {
    unsigned int v13 = +[NSBundle bundleForClass:objc_opt_class()];
    id v14 = [v13 localizedStringForKey:@"WRIST_DETECTION_DISABLE_WARNING_MSG_UNLOCKPHONE" value:&stru_107E8 table:@"PasscodeSettings"];
    [v8 appendString:v14];
  }
  if (![(PUSPasscodeSettingsListController *)self _gizmoSupportsSEPWristDetectSetting]&& self->_gizmoHasPaymentPasses)
  {
    CFStringRef v15 = +[NSBundle bundleForClass:objc_opt_class()];
    __int16 v16 = [v15 localizedStringForKey:@"WRIST_DETECTION_DISABLE_WARNING_MSG_PAY" value:&stru_107E8 table:@"PasscodeSettings"];
    [v8 appendString:v16];
  }
  if ([sub_94D0() newtonTriggersEmergencySOS])
  {
    int v17 = +[NSBundle bundleForClass:objc_opt_class()];
    __int16 v18 = [v17 localizedStringForKey:@"WRIST_DETECTION_DISABLE_WARNING_MSG_NEWTON" value:&stru_107E8 table:@"PasscodeSettings"];
    [v8 appendString:v18];
  }
  if ([sub_94D0() kappaTriggersEmergencySOS]
    && [(PUSPasscodeSettingsListController *)self _gizmoSupportsKappaDetection])
  {
    unsigned int v19 = +[SOSUtilities crashDetectionWristDetectionWarningDescription];
    [v8 appendString:v19];
  }
  if ([(PUSPasscodeSettingsListController *)self _gizmoSupportHeartRateAlert])
  {
    __int16 v20 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v21 = [v20 localizedStringForKey:@"WRIST_DETECTION_DISABLE_WARNING_MSG_HEART" value:&stru_107E8 table:@"PasscodeSettings"];
    [v8 appendString:v21];
  }
  if ([(PUSPasscodeSettingsListController *)self _gizmoSupportsScandium])
  {
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x2020000000;
    __int16 v22 = (unsigned int (*)(void))off_15678;
    v43 = off_15678;
    if (!off_15678)
    {
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_A2C4;
      v39[3] = &unk_105C8;
      v39[4] = &v40;
      sub_A2C4((uint64_t)v39);
      __int16 v22 = (unsigned int (*)(void))v41[3];
    }
    _Block_object_dispose(&v40, 8);
    if (!v22) {
      sub_AC74();
    }
    if (v22())
    {
      BOOL v23 = +[NSBundle bundleForClass:objc_opt_class()];
      unsigned int v24 = [v23 localizedStringForKey:@"WRIST_DETECTION_DISABLE_WARNING_MSG_SCANDIUM" value:&stru_107E8 table:@"PasscodeSettings"];
      [v8 appendString:v24];
    }
  }
  if ([(PUSPasscodeSettingsListController *)self _gizmoSupportsRespiratoryRate])
  {
    v25 = +[NSBundle bundleForClass:objc_opt_class()];
    v26 = [v25 localizedStringForKey:@"WRIST_DETECTION_DISABLE_WARNING_MSG_RR" value:&stru_107E8 table:@"PasscodeSettings"];
    [v8 appendString:v26];
  }
  if ([(PUSPasscodeSettingsListController *)self _gizmoSupportEucalyptus])
  {
    v27 = +[NSBundle bundleForClass:objc_opt_class()];
    CFStringRef v28 = [v27 localizedStringForKey:@"WRIST_DETECTION_DISABLE_WARNING_MSG_EUCALYPTUS" value:&stru_107E8 table:@"PasscodeSettings"];
    [v8 appendString:v28];
  }
  v29 = +[NSBundle bundleForClass:objc_opt_class()];
  v30 = [v29 localizedStringForKey:@"WRIST_DETECTION_DISABLE_WARNING_MSG_ACTIVITY" value:&stru_107E8 table:@"PasscodeSettings"];
  [v8 appendString:v30];

  if ([(PUSPasscodeSettingsListController *)self _gizmoSupportEnvironmentalDosimetry])
  {
    v31 = +[NSBundle bundleForClass:objc_opt_class()];
    v32 = [v31 localizedStringForKey:@"WRIST_DETECTION_DISABLE_WARNING_MSG_NOISE" value:&stru_107E8 table:@"PasscodeSettings"];
    [v8 appendString:v32];
  }
  if ([(PUSPasscodeSettingsListController *)self _gizmoSupportWatchGestures])
  {
    unsigned int v33 = +[NSBundle bundleForClass:objc_opt_class()];
    unint64_t v34 = [v33 localizedStringForKey:@"WRIST_DETECTION_DISABLE_WARNING_MSG_ELTON" value:&stru_107E8 table:@"PasscodeSettings_Elton"];
    [v8 appendString:v34];
  }
  [v3 setPrompt:v8];
  unsigned int v35 = +[NSBundle bundleForClass:objc_opt_class()];
  v36 = [v35 localizedStringForKey:@"WRIST_DETECTION_DISABLE_WARNING_CANCEL" value:&stru_107E8 table:@"PasscodeSettings"];
  [v3 setCancelButton:v36];

  v37 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned __int8 v38 = [v37 localizedStringForKey:@"WRIST_DETECTION_DISABLE_WARNING_CONFIRM" value:&stru_107E8 table:@"PasscodeSettings"];
  [v3 setOkButton:v38];

  [v3 setProperty:&__kCFBooleanTrue forKey:PSConfirmationDestructiveKey];
  [v3 setTarget:self];
  [v3 setConfirmationAction:"confirmDisableWristDetect:"];
  [v3 setConfirmationCancelAction:"cancelDisableWristDetect:"];
  [(PUSPasscodeSettingsListController *)self showConfirmationViewForSpecifier:v3];
}

- (BOOL)_endLockoutAvailable
{
  BOOL v3 = [(PUSPasscodeSettingsListController *)self gizmoIsInLockout];
  if (v3) {
    LOBYTE(v3) = ![(PUSPasscodeSettingsListController *)self _gizmoHardwareSupportsSEP];
  }
  return v3;
}

- (BOOL)_gizmoHardwareSupportsSEP
{
  id v2 = +[NRPairedDeviceRegistry sharedInstance];
  BOOL v3 = [v2 getDevices];

  if ([v3 count])
  {
    BOOL v4 = [v3 objectAtIndexedSubscript:0];
  }
  else
  {
    BOOL v4 = 0;
  }
  id v5 = [v4 valueForProperty:NRDevicePropertyHasSEP];
  unsigned __int8 v6 = [v5 BOOLValue];

  return v6;
}

- (BOOL)_gizmoSupportsSEPWristDetectSetting
{
  unsigned __int8 v3 = [(PUSPasscodeSettingsListController *)self _gizmoHardwareSupportsSEP];
  [(PURemoteDeviceState *)self->_gizmoState version];
  return v3 & NRVersionIsGreaterThanOrEqual();
}

- (void)confirmDisableWristDetect:(id)a3
{
  BOOL v4 = [(PUSPasscodeSettingsListController *)self _gizmoSupportsSEPWristDetectSetting];
  id v5 = pu_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v6 = +[NSNumber numberWithUnsignedInt:[(PURemoteDeviceState *)self->_gizmoState version]];
    unsigned int v7 = +[NSNumber numberWithBool:v4];
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 2112;
    CFStringRef v11 = v7;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "disabling wrist dection, paired device version = %@, wrist detect support in SEP = %@", (uint8_t *)&v8, 0x16u);
  }
  [(PUSPasscodeSettingsListController *)self _startRemoteAction:5];
}

- (void)cancelDisableWristDetect:(id)a3
{
}

- (BOOL)_gizmoSupportsKappaDetection
{
  unsigned int v2 = [sub_94D0() isKappaDetectionSupportedOnActiveWatch];
  if (v2)
  {
    id v3 = sub_94D0();
    LOBYTE(v2) = [v3 isKappaVisible];
  }
  return v2;
}

- (BOOL)_gizmoSupportHeartRateAlert
{
  unsigned int v2 = +[NRPairedDeviceRegistry sharedInstance];
  id v3 = [v2 getActivePairedDevice];
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"E17D2903-B868-4E6C-8E76-6D4939BEED44"];
  unsigned __int8 v5 = [v3 supportsCapability:v4];

  return v5;
}

- (BOOL)_gizmoSupportEnvironmentalDosimetry
{
  unsigned int v2 = +[NRPairedDeviceRegistry sharedInstance];
  id v3 = [v2 getActivePairedDevice];
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F5C2DAD0-38FB-4B3B-86D3-B264F4F8CBDA"];
  unsigned __int8 v5 = [v3 supportsCapability:v4];

  return v5;
}

- (BOOL)_gizmoSupportsScandium
{
  unsigned int v2 = +[NRPairedDeviceRegistry sharedInstance];
  id v3 = [v2 getActivePairedDevice];
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"BD3A4341-7090-4622-9694-2AC0F536C478"];
  unsigned __int8 v5 = [v3 supportsCapability:v4];

  return v5;
}

- (BOOL)_gizmoSupportsRespiratoryRate
{
  unsigned int v2 = +[NRPairedDeviceRegistry sharedInstance];
  id v3 = [v2 getActivePairedDevice];
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"5C64C95B-8E7C-46AB-A110-1E51C93D7B7F"];
  unsigned __int8 v5 = [v3 supportsCapability:v4];

  return v5;
}

- (BOOL)_gizmoSupportPasscodePolicySync
{
  unsigned int v2 = [(PURemoteDeviceState *)self->_gizmoState passcodePolicy];

  return v2 != 0;
}

- (BOOL)_gizmoSupportEucalyptus
{
  unsigned int v2 = +[NRPairedDeviceRegistry sharedInstance];
  id v3 = [v2 getActivePairedDevice];
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"C0F3C2C3-0CDE-4DF9-A95A-789AC9A0348B"];
  unsigned __int8 v5 = [v3 supportsCapability:v4];

  return v5;
}

- (BOOL)_gizmoSupportWatchGestures
{
  unsigned int v2 = +[NRPairedDeviceRegistry sharedInstance];
  id v3 = [v2 getActivePairedDevice];
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"0E581E21-36BA-4770-9408-0467585E8495"];
  unsigned __int8 v5 = [v3 supportsCapability:v4];

  return v5;
}

- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4
{
  [(PUSPasscodeSettingsListController *)self reloadSpecifiers];
  id v6 = +[MCProfileConnection sharedConnection];
  if ([v6 isPasscodeModificationAllowed])
  {
  }
  else
  {
    unsigned __int8 v5 = [(PUSPasscodeSettingsListController *)self presentedViewController];

    if (v5)
    {
      [(PUSPasscodeSettingsListController *)self _cancelRemoteAction];
    }
  }
}

- (void)alertView:(id)a3 willDismissWithButtonIndex:(int64_t)a4
{
  if (!a4 && self->_awaitingUnlockAlertView == a3)
  {
    id v6 = [(PUSPasscodeSettingsListController *)self navigationController];
    id v4 = [v6 navigationController];
    id v5 = [v4 popViewControllerAnimated:1];
  }
}

- (void)setActivityFlags:(int)a3
{
  int activityFlags = self->_activityFlags;
  self->_int activityFlags = a3;
  id v6 = pu_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109376;
    v7[1] = activityFlags;
    __int16 v8 = 1024;
    int v9 = a3;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Activity flag updates from 0x%X to 0x%X", (uint8_t *)v7, 0xEu);
  }

  if ((a3 != 0) == (activityFlags == 0)) {
    [(PUSPasscodeSettingsListController *)self reloadUI];
  }
}

- (void)_addActivityFlag:(int)a3
{
  uint64_t v4 = [(PUSPasscodeSettingsListController *)self activityFlags] | a3;

  [(PUSPasscodeSettingsListController *)self setActivityFlags:v4];
}

- (void)_removeActivityFlag:(int)a3
{
  uint64_t v4 = [(PUSPasscodeSettingsListController *)self activityFlags] & ~a3;

  [(PUSPasscodeSettingsListController *)self setActivityFlags:v4];
}

- (void)reloadUI
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9E90;
  block[3] = &unk_104D8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)gizmoHasPaymentPasses
{
  return self->_gizmoHasPaymentPasses;
}

- (void)setGizmoHasPaymentPasses:(BOOL)a3
{
  self->_gizmoHasPaymentPasses = a3;
}

- (BOOL)gizmoHasCredentialedPasses
{
  return self->_gizmoHasCredentialedPasses;
}

- (void)setGizmoHasCredentialedPasses:(BOOL)a3
{
  self->_BOOL gizmoHasCredentialedPasses = a3;
}

- (BOOL)devicesArePairedForUnlocking
{
  return self->_devicesArePairedForUnlocking;
}

- (void)setDevicesArePairedForUnlocking:(BOOL)a3
{
  self->_BOOL devicesArePairedForUnlocking = a3;
}

- (BOOL)gizmoUnlocksPhone
{
  return self->_gizmoUnlocksPhone;
}

- (void)setGizmoUnlocksPhone:(BOOL)a3
{
  self->_gizmoUnlocksPhone = a3;
}

- (SFAutoUnlockManager)autoUnlockManager
{
  return self->_autoUnlockManager;
}

- (void)setAutoUnlockManager:(id)a3
{
}

- (PURemoteDeviceState)gizmoState
{
  return self->_gizmoState;
}

- (void)setGizmoState:(id)a3
{
}

- (BOOL)gizmoIsInLockout
{
  return self->_gizmoIsInLockout;
}

- (void)setGizmoIsInLockout:(BOOL)a3
{
  self->_BOOL gizmoIsInLockout = a3;
}

- (id)checkGizmoUnlockedCompletionHandler
{
  return self->_checkGizmoUnlockedCompletionHandler;
}

- (void)setCheckGizmoUnlockedCompletionHandler:(id)a3
{
}

- (PUConnection)connection
{
  return self->_connection;
}

- (int)activityFlags
{
  return self->_activityFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_checkGizmoUnlockedCompletionHandler, 0);
  objc_storeStrong((id *)&self->_gizmoState, 0);
  objc_storeStrong((id *)&self->_autoUnlockManager, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);

  objc_storeStrong((id *)&self->_awaitingUnlockAlertView, 0);
}

@end