@interface BackupRestoreProgressController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFBackupDeviceController)backupDeviceController;
- (BFFFlowItemDelegate)delegate;
- (BOOL)hasAssertions;
- (BOOL)softwareUpdateDidOccur;
- (BOOL)takeAssertions;
- (BYAnalyticsManager)analyticsManager;
- (BYPasscodeCacheManager)passcodeCacheManager;
- (BackupRestoreProgressController)init;
- (BuddyDisplayMonitor)displayMonitor;
- (BuddyPendingRestoreState)pendingRestoreState;
- (LockdownModeProvider)lockdownModeProvider;
- (MBManager)backupManager;
- (ProximitySetupController)proximitySetupController;
- (RBSAssertion)processAssertion;
- (RestorableBackupItem)backupItem;
- (UIAlertController)alert;
- (__MKBAssertion)deviceLockAssertion;
- (double)backupPercentComplete;
- (double)restorePercentComplete;
- (id)_createRestoreOptions;
- (id)latestSnapshotForBackupUUID:(id)a3 backupCompletedDate:(id)a4 lastSnapshotDate:(id)a5 error:(id *)a6;
- (id)latestSnapshotForBackupUUID:(id)a3 lastSnapshotDate:(id)a4 error:(id *)a5;
- (id)latestSnapshotForSourceDevice:(id *)a3;
- (id)prepareForCloudRestoreRebootBlock;
- (id)waitForBackupToComplete;
- (int64_t)restoreState;
- (void)_attemptRestore;
- (void)_failedToStartRestoreForSnapshotID:(unint64_t)a3 error:(id)a4;
- (void)_presentAlert:(id)a3;
- (void)_traceAnalyticsForGuideUserToBackup:(id)a3 foundBackup:(BOOL)a4 polledForBackup:(BOOL)a5;
- (void)backupDeviceController:(id)a3 backupCompletedWithError:(id)a4;
- (void)backupProgress:(double)a3 estimatedTimeRemaining:(unint64_t)a4;
- (void)controllerWasPopped;
- (void)dealloc;
- (void)handleBackupFailed:(id)a3;
- (void)loadView;
- (void)manager:(id)a3 didFailRestoreWithError:(id)a4;
- (void)manager:(id)a3 didUpdateProgress:(float)a4 estimatedTimeRemaining:(unint64_t)a5;
- (void)managerDidFinishRestore:(id)a3;
- (void)managerDidLoseConnectionToService:(id)a3;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)popBackFromProgress;
- (void)reattemptBackup;
- (void)releaseAssertions;
- (void)renewCredentialsThenStartRestore:(id)a3;
- (void)restoreFailedWithError:(id)a3;
- (void)setAlert:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setBackupDeviceController:(id)a3;
- (void)setBackupItem:(id)a3;
- (void)setBackupManager:(id)a3;
- (void)setBackupPercentComplete:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceLockAssertion:(__MKBAssertion *)a3;
- (void)setDisplayMonitor:(id)a3;
- (void)setLockdownModeProvider:(id)a3;
- (void)setPasscodeCacheManager:(id)a3;
- (void)setPendingRestoreState:(id)a3;
- (void)setPrepareForCloudRestoreRebootBlock:(id)a3;
- (void)setProcessAssertion:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setRestorePercentComplete:(double)a3;
- (void)setRestoreState:(int64_t)a3;
- (void)setSoftwareUpdateDidOccur:(BOOL)a3;
- (void)startRestore:(id)a3;
- (void)updateProgress;
- (void)updateProgressText;
- (void)viewDidAppear:(BOOL)a3;
- (void)willResignActive;
@end

@implementation BackupRestoreProgressController

- (BackupRestoreProgressController)init
{
  SEL v12 = a2;
  v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"RESTORING_FROM_BACKUP" value:&stru_1002B4E18 table:@"RestoreFromBackup"];
  id location = 0;
  v11.receiver = self;
  v11.super_class = (Class)BackupRestoreProgressController;
  v5 = [(BackupRestoreProgressController *)&v11 initWithTitle:v4 detailText:0 icon:0];
  id location = v5;
  objc_storeStrong(&location, v5);

  if (v5)
  {
    id v6 = objc_alloc_init((Class)MBManager);
    v7 = (void *)*((void *)location + 13);
    *((void *)location + 13) = v6;

    [*((id *)location + 13) setDelegate:location];
    *((void *)location + 15) = 0;
    *((void *)location + 16) = 0;
    v8 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v8 addObserver:location selector:"willResignActive" name:UIApplicationWillResignActiveNotification object:0];
  }
  v9 = (BackupRestoreProgressController *)location;
  objc_storeStrong(&location, 0);
  return v9;
}

- (void)dealloc
{
  v5 = self;
  SEL v4 = a2;
  [(BackupRestoreProgressController *)self releaseAssertions];
  v2 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v2 removeObserver:v5 name:UIApplicationWillResignActiveNotification object:0];

  v3.receiver = v5;
  v3.super_class = (Class)BackupRestoreProgressController;
  [(BackupRestoreProgressController *)&v3 dealloc];
}

- (void)loadView
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BackupRestoreProgressController;
  [(BackupRestoreProgressController *)&v3 loadView];
  [(BackupRestoreProgressController *)v5 updateProgressText];
  id v2 = [(BackupRestoreProgressController *)v5 navigationItem];
  [v2 setHidesBackButton:1];
}

- (void)willResignActive
{
  SEL v12 = self;
  SEL v11 = a2;
  if ((id)[(BackupRestoreProgressController *)self restoreState] == (id)1)
  {
    CFArrayRef theArray = (CFArrayRef)CTCopyCurrentCalls();
    if (theArray)
    {
      BOOL v9 = CFArrayGetCount(theArray) > 0;
      CFRelease(theArray);
      if (v9)
      {
        os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          id v2 = oslog;
          os_log_type_t v3 = v7;
          sub_10004B24C(v6);
          _os_log_impl((void *)&_mh_execute_header, v2, v3, "Canceling restore due to incoming call", (uint8_t *)v6, 2u);
        }
        objc_storeStrong((id *)&oslog, 0);
        [(BackupRestoreProgressController *)v12 setRestoreState:3];
        [(MBManager *)v12->_backupManager cancel];
        id v4 = [(BackupRestoreProgressController *)v12 navigationController];
        id v5 = [v4 popViewControllerAnimated:0];
      }
    }
  }
}

- (void)popBackFromProgress
{
  id v2 = [(BackupRestoreProgressController *)self backupDeviceController];
  [(BFFBackupDeviceController *)v2 reset];

  id v3 = [(BackupRestoreProgressController *)self navigationController];
  id v4 = (BackupRestoreProgressController *)[v3 topViewController];

  if (v4 == self)
  {
    id v5 = [(BackupRestoreProgressController *)self delegate];
    id v6 = [(BFFFlowItemDelegate *)v5 popToBuddyControllerWithClass:objc_opt_class() animated:1];

    if (!v6)
    {
      os_log_type_t v7 = [(BackupRestoreProgressController *)self delegate];
      id v8 = [(BFFFlowItemDelegate *)v7 popToBuddyControllerWithClass:objc_opt_class() animated:1];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BackupRestoreProgressController;
  [(BackupRestoreProgressController *)&v6 viewDidAppear:a3];
  id v3 = [(BackupRestoreProgressController *)v9 alert];

  if (v3)
  {
    id v4 = v9;
    id v5 = [(BackupRestoreProgressController *)v9 alert];
    [(BackupRestoreProgressController *)v4 presentViewController:v5 animated:1 completion:0];
  }
}

- (void)renewCredentialsThenStartRestore:(id)a3
{
  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = +[ACAccountStore defaultStore];
  id v22 = [v3 aa_primaryAppleAccount];

  id v4 = +[BFFAppleAccountInfo primaryAccountInfo];
  id v5 = [v4 rawPassword];
  [v22 _aa_setRawPassword:v5];

  id v6 = +[BYSecurityInterface sharedInterface];
  LOBYTE(v4) = [v6 isICDPEnabledForPrimaryAccount];

  if (v4)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = oslog;
      os_log_type_t v8 = v20;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Renewing account credentials prior to restore...", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    uint64_t v25 = kACRenewCredentialsShouldAvoidUIKey;
    v26 = &__kCFBooleanTrue;
    id v18 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    id v9 = +[ACAccountStore defaultStore];
    id v10 = v22;
    SEL v11 = _NSConcreteStackBlock;
    int v12 = -1073741824;
    int v13 = 0;
    v14 = sub_100063750;
    v15 = &unk_1002B1318;
    v16 = v24;
    id v17 = location[0];
    [v9 renewCredentialsForAccount:v10 options:v18 completion:&v11];

    objc_storeStrong(&v17, 0);
    objc_storeStrong((id *)&v16, 0);
    objc_storeStrong(&v18, 0);
  }
  else
  {
    [(BackupRestoreProgressController *)v24 startRestore:location[0]];
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (void)startRestore:(id)a3
{
  int v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  BOOL v7 = sub_100063AD4;
  os_log_type_t v8 = &unk_1002B12F0;
  id v9 = v12;
  id v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_failedToStartRestoreForSnapshotID:(unint64_t)a3 error:(id)a4
{
  id v78 = self;
  SEL v77 = a2;
  unint64_t v76 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  char v74 = 0;
  id v4 = [location domain];
  BOOL v5 = 0;
  if ([v4 isEqualToString:@"MBErrorDomain"]) {
    BOOL v5 = [location code] == (id)204;
  }

  if (v5)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v72 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = v76;
      id v7 = [v78 backupItem];
      id v8 = [v7 backupUDID];
      sub_1000649B4((uint64_t)buf, v6, (uint64_t)v8);
      _os_log_impl((void *)&_mh_execute_header, oslog, v72, "Unable to find the snapshot ID %ld in backup UDID %@; searching for one that is the same...",
        buf,
        0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v71 = 0;
    id v9 = [v78 backupItem];
    id v10 = [v9 backupUUID];
    uint64_t v11 = *((void *)v78 + 13);
    id obj = 0;
    id v12 = +[BuddyBackupUtilities backupForUUID:v10 withManager:v11 error:&obj];
    objc_storeStrong(&v71, obj);
    id v70 = v12;

    if (!v71 && v70)
    {
      id v62 = 0;
      memset(__b, 0, sizeof(__b));
      id v14 = [v70 snapshots];
      id v15 = [v14 countByEnumeratingWithState:__b objects:v81 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)__b[2];
        do
        {
          for (unint64_t i = 0; i < (unint64_t)v15; ++i)
          {
            if (*(void *)__b[2] != v16) {
              objc_enumerationMutation(v14);
            }
            id v61 = *(id *)(__b[1] + 8 * i);
            id v18 = [v61 date];
            id v19 = [v78 backupItem];
            id v20 = [v19 snapshot];
            id v21 = [v20 date];
            unsigned __int8 v22 = [v18 isEqualToDate:v21];

            if (v22)
            {
              objc_storeStrong(&v62, v61);
              int v59 = 2;
              goto LABEL_29;
            }
          }
          id v15 = [v14 countByEnumeratingWithState:__b objects:v81 count:16];
        }
        while (v15);
      }
      int v59 = 0;
LABEL_29:

      if (v62)
      {
        os_log_t v55 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v54 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          id v25 = [v62 snapshotID];
          id v26 = [v78 backupItem];
          id v27 = [v26 backupUDID];
          sub_1000649B4((uint64_t)v80, (uint64_t)v25, (uint64_t)v27);
          _os_log_impl((void *)&_mh_execute_header, v55, v54, "Found snapshot ID %ld in backup UDID %@ that was the same!", v80, 0x16u);
        }
        objc_storeStrong((id *)&v55, 0);
        id v28 = [v78 backupItem];
        id v29 = [v28 backup];
        v30 = +[RestorableBackupItem restorableBackupItemWithBackup:v29 snapshot:v62];
        [v78 setBackupItem:v30];

        os_log_t v53 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v52 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          id v31 = [v78 backupItem];
          id v32 = [v31 backupUDID];
          sub_100063D38((uint64_t)v79, (uint64_t)v32, (uint64_t)[v62 snapshotID]);
          _os_log_impl((void *)&_mh_execute_header, v53, v52, "Starting iCloud Restore for backup UDID %@ and snapshot %ld...", v79, 0x16u);
        }
        objc_storeStrong((id *)&v53, 0);
        id v33 = [v78 backupManager];
        id v34 = [v78 backupItem];
        id v35 = [v34 backupUDID];
        id v36 = [v62 snapshotID];
        id v37 = [v78 _createRestoreOptions];
        v46 = _NSConcreteStackBlock;
        int v47 = -1073741824;
        int v48 = 0;
        v49 = sub_1000649D4;
        v50 = &unk_1002B0FF0;
        id v51 = v78;
        [v33 startRestoreForBackupUDID:v35 snapshotID:v36 options:v37 completion:&v46];

        char v74 = 1;
        objc_storeStrong(&v51, 0);
      }
      else
      {
        os_log_t v58 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v57 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          v23 = v58;
          os_log_type_t v24 = v57;
          sub_10004B24C(v56);
          _os_log_impl((void *)&_mh_execute_header, v23, v24, "Failed to find a snapshot that was the same!", v56, 2u);
        }
        objc_storeStrong((id *)&v58, 0);
      }
      objc_storeStrong(&v62, 0);
    }
    else
    {
      os_log_t v68 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v67 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        char v65 = 0;
        char v63 = 0;
        if (_BYIsInternalInstall())
        {
          int v13 = (NSString *)v71;
        }
        else if (v71)
        {
          id v66 = [v71 domain];
          char v65 = 1;
          int v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v66, [v71 code]);
          id v64 = v13;
          char v63 = 1;
        }
        else
        {
          int v13 = 0;
        }
        sub_10004BB7C((uint64_t)v82, (uint64_t)v13);
        _os_log_impl((void *)&_mh_execute_header, v68, v67, "Failed to get the list of backups: %{public}@", v82, 0xCu);
        if (v63) {

        }
        if (v65) {
      }
        }
      objc_storeStrong((id *)&v68, 0);
    }
    objc_storeStrong(&v70, 0);
    objc_storeStrong(&v71, 0);
  }
  if ((v74 & 1) == 0)
  {
    v38 = &_dispatch_main_q;
    block = _NSConcreteStackBlock;
    int v40 = -1073741824;
    int v41 = 0;
    v42 = sub_100064C30;
    v43 = &unk_1002B12F0;
    id v44 = v78;
    id v45 = location;
    dispatch_async((dispatch_queue_t)v38, &block);

    objc_storeStrong(&v45, 0);
    objc_storeStrong(&v44, 0);
  }
  objc_storeStrong(&location, 0);
}

- (BOOL)hasAssertions
{
  id v2 = [(BackupRestoreProgressController *)self processAssertion];
  BOOL v3 = 0;
  if (v2) {
    BOOL v3 = [(BackupRestoreProgressController *)self deviceLockAssertion] != 0;
  }

  return v3;
}

- (BOOL)takeAssertions
{
  id v45 = self;
  location[1] = (id)a2;
  id v2 = [(BackupRestoreProgressController *)self processAssertion];
  [(RBSAssertion *)v2 invalidate];

  id v3 = objc_alloc((Class)RBSAssertion);
  id v4 = +[RBSTarget targetWithPid:getpid()];
  BOOL v5 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.purplebuddy" name:@"Update"];
  os_log_type_t v52 = v5;
  uint64_t v6 = +[NSArray arrayWithObjects:&v52 count:1];
  id v7 = [v3 initWithExplanation:@"iCloud Restore" target:v4 attributes:v6];
  [(BackupRestoreProgressController *)v45 setProcessAssertion:v7];

  location[0] = 0;
  id v8 = [(BackupRestoreProgressController *)v45 processAssertion];
  id v43 = 0;
  LOBYTE(v7) = [(RBSAssertion *)v8 acquireWithError:&v43];
  objc_storeStrong(location, v43);

  if ((v7 ^ 1))
  {
    id v42 = (id)_BYLoggingFacility();
    os_log_type_t v41 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_ERROR))
    {
      char v39 = 0;
      char v37 = 0;
      if (_BYIsInternalInstall())
      {
        id v9 = (NSString *)location[0];
      }
      else if (location[0])
      {
        id v40 = [location[0] domain];
        char v39 = 1;
        id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v40, [location[0] code]);
        v38 = v9;
        char v37 = 1;
      }
      else
      {
        id v9 = 0;
      }
      sub_10004BB7C((uint64_t)buf, (uint64_t)v9);
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v42, v41, "Failed to take process assertion during migration: %{public}@", buf, 0xCu);
      if (v37) {

      }
      if (v39) {
    }
      }
    objc_storeStrong(&v42, 0);
    [(BackupRestoreProgressController *)v45 releaseAssertions];
    char v46 = 0;
    int v36 = 1;
  }
  else
  {
    id v35 = (id)_BYLoggingFacility();
    os_log_type_t v34 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v35;
      os_log_type_t v11 = v34;
      sub_10004B24C(v33);
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Process lock assertion successfully taken during restore", v33, 2u);
    }
    objc_storeStrong(&v35, 0);
    CFTypeRef v32 = 0;
    if ([(BackupRestoreProgressController *)v45 softwareUpdateDidOccur])
    {
      id v31 = objc_alloc_init((Class)BYBuddyDaemonGeneralClient);
      [v31 cancelDataMigratorDeferredExit];
      [(BackupRestoreProgressController *)v45 setDeviceLockAssertion:MKBDeviceLockAssertionConsume()];
      if ([(BackupRestoreProgressController *)v45 deviceLockAssertion])
      {
        id v30 = (id)_BYLoggingFacility();
        os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = v30;
          os_log_type_t v13 = v29;
          sub_10004B24C(v28);
          _os_log_impl((void *)&_mh_execute_header, v12, v13, "Device lock assertion successfully consumed during restore", v28, 2u);
        }
        objc_storeStrong(&v30, 0);
      }
      else
      {
        os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v26 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          char v25 = 0;
          char v24 = 0;
          if (_BYIsInternalInstall()) {
            uint64_t v14 = (uint64_t)v32;
          }
          else {
            uint64_t v14 = 0;
          }
          sub_10004BB7C((uint64_t)v50, v14);
          _os_log_error_impl((void *)&_mh_execute_header, oslog, v26, "Failed to consume device lock assertion during restore - %{public}@", v50, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
      objc_storeStrong(&v31, 0);
    }
    else
    {
      CFStringRef v48 = @"MKBAssertionKey";
      CFStringRef v49 = @"RestoreFromBackup";
      id v23 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      [(BackupRestoreProgressController *)v45 setDeviceLockAssertion:MKBDeviceLockAssertion()];
      if ([(BackupRestoreProgressController *)v45 deviceLockAssertion])
      {
        os_log_t v22 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = v22;
          os_log_type_t v16 = v21;
          sub_10004B24C(v20);
          _os_log_impl((void *)&_mh_execute_header, v15, v16, "Device lock assertion successfully taken during restore", v20, 2u);
        }
        objc_storeStrong((id *)&v22, 0);
      }
      else
      {
        os_log_t v19 = (os_log_t)(id)_BYLoggingFacility();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          if (_BYIsInternalInstall()) {
            uint64_t v17 = (uint64_t)v32;
          }
          else {
            uint64_t v17 = 0;
          }
          sub_10004BB7C((uint64_t)v47, v17);
          _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to take device lock assertion during restore - %{public}@", v47, 0xCu);
        }
        objc_storeStrong((id *)&v19, 0);
      }
      objc_storeStrong(&v23, 0);
    }
    if ([(BackupRestoreProgressController *)v45 deviceLockAssertion])
    {
      char v46 = 1;
    }
    else
    {
      [(BackupRestoreProgressController *)v45 releaseAssertions];
      CFRelease(v32);
      char v46 = 0;
    }
    int v36 = 1;
  }
  objc_storeStrong(location, 0);
  return v46 & 1;
}

- (void)releaseAssertions
{
  uint64_t v14 = self;
  oslog[1] = (os_log_t)a2;
  id v2 = [(BackupRestoreProgressController *)self processAssertion];

  if (v2)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      id v3 = oslog[0];
      os_log_type_t v4 = v12;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Releasing process assertion", buf, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    BOOL v5 = [(BackupRestoreProgressController *)v14 processAssertion];
    [(RBSAssertion *)v5 invalidate];

    [(BackupRestoreProgressController *)v14 setProcessAssertion:0];
  }
  if ([(BackupRestoreProgressController *)v14 deviceLockAssertion])
  {
    os_log_t v10 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = v10;
      os_log_type_t v7 = v9;
      sub_10004B24C(v8);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Releasing device lock assertion taken during restore", (uint8_t *)v8, 2u);
    }
    objc_storeStrong((id *)&v10, 0);
    CFRelease([(BackupRestoreProgressController *)v14 deviceLockAssertion]);
    [(BackupRestoreProgressController *)v14 setDeviceLockAssertion:0];
  }
}

- (void)setAlert:(id)a3
{
  os_log_type_t v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!v4->_alert) {
    objc_storeStrong((id *)&v4->_alert, location[0]);
  }
  objc_storeStrong(location, 0);
}

- (void)updateProgress
{
  if (self->_backupThenRestore)
  {
    double backupPercentComplete = self->_backupPercentComplete;
    [(BackupRestoreProgressController *)self restorePercentComplete];
    [(BackupRestoreProgressController *)self setProgress:(backupPercentComplete + v3) / 2.0];
  }
  else
  {
    [(BackupRestoreProgressController *)self restorePercentComplete];
    [(BackupRestoreProgressController *)self setProgress:v4];
  }
}

- (void)updateProgressText
{
  if (![(BackupRestoreProgressController *)self restoreState] && self->_backupThenRestore)
  {
    double v4 = +[NSBundle mainBundle];
    BOOL v5 = [(NSBundle *)v4 localizedStringForKey:@"WAITING_FOR_BACKUP" value:&stru_1002B4E18 table:@"RestoreFromBackup"];
    uint64_t v6 = [(BackupRestoreProgressController *)self backupDeviceController];
    os_log_type_t v7 = [(BFFBackupDeviceController *)v6 backingUpDeviceName];
    id v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v7);
    [(BackupRestoreProgressController *)self setTitle:v8];
  }
  else
  {
    id v2 = +[NSBundle mainBundle];
    double v3 = [(NSBundle *)v2 localizedStringForKey:@"RESTORING_FROM_BACKUP" value:&stru_1002B4E18 table:@"RestoreFromBackup"];
    [(BackupRestoreProgressController *)self setTitle:v3];
  }
}

- (id)latestSnapshotForSourceDevice:(id *)a3
{
  double v4 = [(BackupRestoreProgressController *)self backupDeviceController];
  BOOL v5 = [(BFFBackupDeviceController *)v4 backingUpDeviceUUID];
  uint64_t v6 = [(BackupRestoreProgressController *)self backupDeviceController];
  os_log_type_t v7 = [(BFFBackupDeviceController *)v6 completionDate];
  id v8 = [(BackupRestoreProgressController *)self latestSnapshotForBackupUUID:v5 backupCompletedDate:v7 lastSnapshotDate:self->_lastSourceDeviceSnapshotDate error:a3];

  return v8;
}

- (id)latestSnapshotForBackupUUID:(id)a3 lastSnapshotDate:(id)a4 error:(id *)a5
{
  os_log_type_t v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v7 = [(BackupRestoreProgressController *)v11 latestSnapshotForBackupUUID:location[0] backupCompletedDate:0 lastSnapshotDate:v9 error:a5];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);

  return v7;
}

- (id)latestSnapshotForBackupUUID:(id)a3 backupCompletedDate:(id)a4 lastSnapshotDate:(id)a5 error:(id *)a6
{
  v73 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v71 = 0;
  objc_storeStrong(&v71, a4);
  id v70 = 0;
  objc_storeStrong(&v70, a5);
  v69 = a6;
  id v68 = 0;
  backupManager = v73->_backupManager;
  id obj = 0;
  id v10 = +[BuddyBackupUtilities backupForUUID:location[0] withManager:backupManager error:&obj];
  objc_storeStrong(&v68, obj);
  id v67 = v10;
  if (v68 || !v67)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v64 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      char v62 = 0;
      char v60 = 0;
      if (_BYIsInternalInstall())
      {
        os_log_type_t v11 = (NSString *)v68;
      }
      else if (v68)
      {
        id v63 = [v68 domain];
        char v62 = 1;
        os_log_type_t v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v63, [v68 code]);
        id v61 = v11;
        char v60 = 1;
      }
      else
      {
        os_log_type_t v11 = 0;
      }
      sub_10004BB7C((uint64_t)buf, (uint64_t)v11);
      _os_log_impl((void *)&_mh_execute_header, oslog, v64, "Failed to get the list of backups: %{public}@", buf, 0xCu);
      if (v60) {

      }
      if (v62) {
    }
      }
    objc_storeStrong((id *)&oslog, 0);
    if (v69)
    {
      id v12 = v68;
      id *v69 = v12;
    }
LABEL_61:
    id v74 = 0;
    int v44 = 1;
    goto LABEL_62;
  }
  os_log_t v59 = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v58 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    sub_100051470((uint64_t)v82, (uint64_t)v71, (uint64_t)v70);
    _os_log_impl((void *)&_mh_execute_header, v59, v58, "Looking for a snapshot that is same or newer than %@ or newer than %@", v82, 0x16u);
  }
  objc_storeStrong((id *)&v59, 0);
  id v57 = 0;
  id v13 = [v67 snapshots];
  uint64_t v14 = +[NSSortDescriptor sortDescriptorWithKey:@"date" ascending:0];
  v81 = v14;
  id v15 = +[NSArray arrayWithObjects:&v81 count:1];
  id v56 = [v13 sortedArrayUsingDescriptors:v15];

  if ([v56 count])
  {
    memset(__b, 0, sizeof(__b));
    id v16 = v56;
    id v17 = [v16 countByEnumeratingWithState:__b objects:v80 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)__b[2];
      do
      {
        for (unint64_t i = 0; i < (unint64_t)v17; ++i)
        {
          if (*(void *)__b[2] != v18) {
            objc_enumerationMutation(v16);
          }
          id v55 = *(id *)(__b[1] + 8 * i);
          if ([v55 state] == 3
            && ([v55 isCompatible] & 1) != 0)
          {
            unint64_t v53 = 0;
            id v20 = [v55 date];
            id v21 = [v20 compare:v71];

            unint64_t v53 = (unint64_t)v21;
            if (v71 && v53 <= 1)
            {
              os_log_t v52 = (os_log_t)(id)_BYLoggingFacility();
              os_log_type_t v51 = OS_LOG_TYPE_DEFAULT;
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
              {
                os_log_t v22 = v52;
                os_log_type_t v23 = v51;
                id v24 = [v55 snapshotID];
                id v25 = [v55 date];
                sub_10006652C((uint64_t)v79, (uint64_t)v24, (uint64_t)v25, (uint64_t)v71);
                _os_log_impl((void *)&_mh_execute_header, v22, v23, "Choosing snapshot ID %ld (%@) as it is the same or newer than the backup the source device just made (%@)", v79, 0x20u);
              }
              objc_storeStrong((id *)&v52, 0);
              objc_storeStrong(&v57, v55);
            }
            else
            {
              char v49 = 0;
              BOOL v26 = 0;
              if (v70)
              {
                id v50 = [v55 date];
                char v49 = 1;
                BOOL v26 = [v50 compare:v70] == (id)1;
              }
              if (v49) {

              }
              if (v26)
              {
                os_log_t v48 = (os_log_t)(id)_BYLoggingFacility();
                os_log_type_t v47 = OS_LOG_TYPE_DEFAULT;
                if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                {
                  id v27 = v48;
                  os_log_type_t v28 = v47;
                  id v29 = [v55 snapshotID];
                  id v30 = [v55 date];
                  sub_10006652C((uint64_t)v78, (uint64_t)v29, (uint64_t)v30, (uint64_t)v70);
                  _os_log_impl((void *)&_mh_execute_header, v27, v28, "Choosing snapshot ID %ld (%@) as it is newer than the reported newest backup (%@)", v78, 0x20u);
                }
                objc_storeStrong((id *)&v48, 0);
                objc_storeStrong(&v57, v55);
              }
              else
              {
                os_log_t v46 = (os_log_t)(id)_BYLoggingFacility();
                os_log_type_t v45 = OS_LOG_TYPE_DEFAULT;
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                {
                  id v31 = v46;
                  os_log_type_t v32 = v45;
                  id v33 = [v55 snapshotID];
                  id v34 = [v55 date];
                  sub_100066554((uint64_t)v77, (uint64_t)v33, (uint64_t)v34, (uint64_t)v70, (uint64_t)v71);
                  _os_log_impl((void *)&_mh_execute_header, v31, v32, "Not picking snapshot ID %ld (%@) as it is older than both the existing backup (%@) and the new backup (%@)", v77, 0x2Au);
                }
                objc_storeStrong((id *)&v46, 0);
              }
            }
            if (v57)
            {
              int v44 = 2;
              goto LABEL_51;
            }
          }
          else
          {
            os_log_t v43 = (os_log_t)(id)_BYLoggingFacility();
            os_log_type_t v42 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              id v35 = v43;
              sub_100046588((uint64_t)v76, (uint64_t)[v55 snapshotID]);
              _os_log_impl((void *)&_mh_execute_header, v35, v42, "Skipping snapshot ID %ld as it's not committed and/or not compatible", v76, 0xCu);
            }
            objc_storeStrong((id *)&v43, 0);
          }
        }
        id v17 = [v16 countByEnumeratingWithState:__b objects:v80 count:16];
      }
      while (v17);
    }
    int v44 = 0;
LABEL_51:
  }
  else
  {
    os_log_t v41 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v40 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      sub_10004B238((uint64_t)v75, (uint64_t)location[0]);
      _os_log_impl((void *)&_mh_execute_header, v41, v40, "No snapshots found for device backup UUID %@", v75, 0xCu);
    }
    objc_storeStrong((id *)&v41, 0);
  }
  if (v57)
  {
    id v39 = +[RestorableBackupItem restorableBackupItemWithBackup:v67 snapshot:v57];
    id v74 = v39;
    int v44 = 1;
    objc_storeStrong(&v39, 0);
  }
  else
  {
    if (v69)
    {
      int v36 = +[NSError errorWithDomain:@"BackupRestoreProgressErrorDomain" code:-1 userInfo:0];
      id *v69 = v36;
    }
    int v44 = 0;
  }
  objc_storeStrong(&v56, 0);
  objc_storeStrong(&v57, 0);
  if (!v44) {
    goto LABEL_61;
  }
LABEL_62:
  objc_storeStrong(&v67, 0);
  objc_storeStrong(&v68, 0);
  objc_storeStrong(&v70, 0);
  objc_storeStrong(&v71, 0);
  objc_storeStrong(location, 0);
  id v37 = v74;

  return v37;
}

- (void)reattemptBackup
{
  id v17 = self;
  v16[1] = (id)a2;
  if ([(BackupRestoreProgressController *)self takeAssertions])
  {
    v17->_backupThenRestore = 1;
    v17->_double backupPercentComplete = 0.0;
    [(BackupRestoreProgressController *)v17 updateProgress];
    [(BackupRestoreProgressController *)v17 updateProgressText];
    [(BackupRestoreProgressController *)v17 setTimeRemainingEstimate:1.79769313e308];
    id v2 = dispatch_get_global_queue(0, 0);
    block = _NSConcreteStackBlock;
    int v12 = -1073741824;
    int v13 = 0;
    uint64_t v14 = sub_1000667AC;
    id v15 = &unk_1002B0D20;
    v16[0] = v17;
    dispatch_async(v2, &block);

    objc_storeStrong(v16, 0);
  }
  else
  {
    objc_initWeak(&location, v17);
    double v3 = _NSConcreteStackBlock;
    int v4 = -1073741824;
    int v5 = 0;
    uint64_t v6 = sub_10006696C;
    id v7 = &unk_1002B0CA8;
    objc_copyWeak(&v8, &location);
    id v9 = +[BuddyRestoreHelpers alertForBackupError:0 forBackup:1 okButtonAction:&v3];
    [(BackupRestoreProgressController *)v17 _presentAlert:v9];
    objc_storeStrong(&v9, 0);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)handleBackupFailed:(id)a3
{
  int v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BackupRestoreProgressController *)v12 releaseAssertions];
  double v3 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_100066AC8;
  id v8 = &unk_1002B12F0;
  id v9 = location[0];
  id v10 = v12;
  dispatch_async((dispatch_queue_t)v3, &block);

  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_traceAnalyticsForGuideUserToBackup:(id)a3 foundBackup:(BOOL)a4 polledForBackup:(BOOL)a5
{
  uint64_t v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v16 = a4;
  BOOL v15 = a5;
  v19[0] = @"success";
  id v7 = +[NSNumber numberWithInt:location[0] == 0];
  v20[0] = v7;
  v19[1] = @"foundBackup";
  id v8 = +[NSNumber numberWithBool:a4];
  v20[1] = v8;
  v19[2] = @"polledForBackup";
  id v9 = +[NSNumber numberWithBool:v15];
  v20[2] = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];
  id v14 = +[NSMutableDictionary dictionaryWithDictionary:v10];

  if (location[0])
  {
    id v11 = [location[0] domain];
    int v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (%ld)", v11, [location[0] code]);
    [v14 setObject:v12 forKeyedSubscript:@"error"];
  }
  int v13 = [(BackupRestoreProgressController *)v18 analyticsManager];
  [(BYAnalyticsManager *)v13 addEvent:@"com.apple.setupassistant.ios.guideUserToBackup" withPayload:v14 persist:1];

  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)_presentAlert:(id)a3
{
  id v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v12 = _NSConcreteStackBlock;
  int v13 = -1073741824;
  int v14 = 0;
  BOOL v15 = sub_100067ECC;
  BOOL v16 = &unk_1002B12F0;
  id v17 = v21;
  id v18 = location[0];
  id v19 = objc_retainBlock(&v12);
  double v3 = +[NSThread currentThread];
  int v4 = +[NSThread mainThread];

  if (v3 == v4)
  {
    (*((void (**)(void))v19 + 2))();
  }
  else
  {
    int v5 = &_dispatch_main_q;
    block = _NSConcreteStackBlock;
    int v7 = -1073741824;
    int v8 = 0;
    id v9 = sub_100068050;
    id v10 = &unk_1002B0D70;
    id v11 = v19;
    dispatch_async((dispatch_queue_t)v5, &block);

    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)_attemptRestore
{
  os_log_type_t v51 = self;
  location[1] = (id)a2;
  if ([(BackupRestoreProgressController *)self hasAssertions])
  {
    int v14 = [(BackupRestoreProgressController *)v51 backupDeviceController];
    [(BFFBackupDeviceController *)v14 setDelegate:v51];

    BOOL v15 = [(BackupRestoreProgressController *)v51 backupDeviceController];
    unsigned __int8 v16 = [(BFFBackupDeviceController *)v15 isBackingUp];
    char v32 = 0;
    unsigned __int8 v17 = 1;
    if ((v16 & 1) == 0)
    {
      id v33 = [(BackupRestoreProgressController *)v51 backupDeviceController];
      char v32 = 1;
      unsigned __int8 v17 = [v33 backupStateUnknown];
    }
    v51->_backupThenRestore = v17 & 1;
    if (v32) {

    }
    if (v51->_backupThenRestore)
    {
      id v18 = [(BackupRestoreProgressController *)v51 backupItem];
      id v19 = [(RestorableBackupItem *)v18 snapshot];
      id v20 = (NSDate *)[(MBSnapshot *)v19 date];
      lastSourceDeviceSnapshotDate = v51->_lastSourceDeviceSnapshotDate;
      v51->_lastSourceDeviceSnapshotDate = v20;
    }
    os_log_t v22 = [(BackupRestoreProgressController *)v51 passcodeCacheManager];
    [(BYPasscodeCacheManager *)v22 persistPasscodeStash];

    objc_initWeak(&v31, v51);
    os_log_type_t v23 = dispatch_get_global_queue(0, 0);
    block = _NSConcreteStackBlock;
    int v25 = -1073741824;
    int v26 = 0;
    id v27 = sub_100068758;
    os_log_type_t v28 = &unk_1002B1368;
    id v29 = v51;
    objc_copyWeak(&v30, &v31);
    dispatch_async(v23, &block);

    objc_destroyWeak(&v30);
    objc_storeStrong((id *)&v29, 0);
    objc_destroyWeak(&v31);
  }
  else
  {
    location[0] = (id)_BYLoggingFacility();
    os_log_type_t v49 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      id v2 = location[0];
      os_log_type_t v3 = v49;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "attempted restore without assertions bailing early...", buf, 2u);
    }
    objc_storeStrong(location, 0);
    objc_initWeak(&from, v51);
    int v4 = +[NSBundle mainBundle];
    int v5 = [(NSBundle *)v4 localizedStringForKey:@"BACKUP_FAILED_ALERT_TITLE" value:&stru_1002B4E18 table:@"RestoreFromBackup"];
    id v46 = +[UIAlertController alertControllerWithTitle:v5 message:&stru_1002B4E18 preferredStyle:1];

    id v6 = v46;
    int v7 = +[NSBundle mainBundle];
    int v8 = [(NSBundle *)v7 localizedStringForKey:@"CHOOSE_A_DIFFERENT_BACKUP" value:&stru_1002B4E18 table:@"RestoreFromBackup"];
    os_log_type_t v40 = _NSConcreteStackBlock;
    int v41 = -1073741824;
    int v42 = 0;
    os_log_t v43 = sub_100068680;
    int v44 = &unk_1002B13E0;
    objc_copyWeak(&v45, &from);
    id v9 = +[UIAlertAction actionWithTitle:v8 style:0 handler:&v40];
    [v6 addAction:v9];

    id v10 = v46;
    id v11 = +[NSBundle mainBundle];
    int v12 = [(NSBundle *)v11 localizedStringForKey:@"TRY_AGAIN_ALERT" value:&stru_1002B4E18 table:@"RestoreFromBackup"];
    id v34 = _NSConcreteStackBlock;
    int v35 = -1073741824;
    int v36 = 0;
    id v37 = sub_1000686E8;
    v38 = &unk_1002B13E0;
    objc_copyWeak(&v39, &from);
    int v13 = +[UIAlertAction actionWithTitle:v12 style:0 handler:&v34];
    [v10 addAction:v13];

    [(BackupRestoreProgressController *)v51 _presentAlert:v46];
    objc_destroyWeak(&v39);
    objc_destroyWeak(&v45);
    objc_storeStrong(&v46, 0);
    objc_destroyWeak(&from);
  }
}

- (void)restoreFailedWithError:(id)a3
{
  int v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BackupRestoreProgressController *)v13 setRestoreState:2];
  objc_initWeak(&from, v13);
  id v3 = location[0];
  int v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = sub_1000697F4;
  int v8 = &unk_1002B0CA8;
  objc_copyWeak(&v9, &from);
  id v10 = +[BuddyRestoreHelpers alertForBackupError:v3 okButtonAction:&v4];
  [(BackupRestoreProgressController *)v13 _presentAlert:v10];
  objc_storeStrong(&v10, 0);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0);
}

- (id)waitForBackupToComplete
{
  id v31 = self;
  v30[1] = (id)a2;
  v30[0] = 0;
  id location = 0;
  id v2 = [(BackupRestoreProgressController *)self backupDeviceController];
  [(BFFBackupDeviceController *)v2 timeRemaining];
  double v4 = v3;

  double v28 = v4;
  double v27 = 0.0;
  if (v4 * 60.0 * 1.2 >= 900.0) {
    double v5 = 900.0;
  }
  else {
    double v5 = v28 * 60.0 * 1.2;
  }
  double v27 = v5;
  double v26 = 10.0;
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100046588((uint64_t)buf, *(uint64_t *)&v27);
    _os_log_impl((void *)&_mh_execute_header, oslog, v24, "Polling backup to determine when the source devices finishes backing up for %f seconds...", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  for (double i = 0.0; i < v27; double i = i + v26)
  {
    id obj = location;
    id v6 = -[BackupRestoreProgressController latestSnapshotForSourceDevice:](v31, "latestSnapshotForSourceDevice:", &obj, i);
    objc_storeStrong(&location, obj);
    id v7 = v30[0];
    v30[0] = v6;

    if (v30[0]) {
      break;
    }
    if (location)
    {
      os_log_t v21 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = v21;
        os_log_type_t v9 = v20;
        char v10 = _BYIsInternalInstall();
        char v18 = 0;
        char v16 = 0;
        if (v10)
        {
          id v11 = (NSString *)location;
        }
        else if (location)
        {
          id v19 = [location domain];
          char v18 = 1;
          id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v19, [location code]);
          id v17 = v11;
          char v16 = 1;
        }
        else
        {
          id v11 = 0;
        }
        sub_10004BB7C((uint64_t)v33, (uint64_t)v11);
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "Failed to determine latest backup: %{public}@", v33, 0xCu);
        if (v16) {

        }
        if (v18) {
      }
        }
      objc_storeStrong((id *)&v21, 0);
    }
    os_log_t v15 = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = v15;
      sub_100046588((uint64_t)v32, *(uint64_t *)&v26);
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No latest backup found; sleeping for %f seconds...",
        v32,
        0xCu);
    }
    objc_storeStrong((id *)&v15, 0);
    sleep(v26);
  }
  id v13 = v30[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v30, 0);
  return v13;
}

- (id)_createRestoreOptions
{
  int v8 = self;
  location[1] = (id)a2;
  location[0] = objc_alloc_init((Class)MBStartRestoreOptions);
  id v2 = [(BackupRestoreProgressController *)v8 pendingRestoreState];
  unsigned __int8 v3 = [(BuddyPendingRestoreState *)v2 allowCellularNetwork];

  if (v3)
  {
    id v4 = +[MBCellularAccess inexpensiveCellularAccess];
    [location[0] setCellularAccess:v4];
  }
  id v5 = location[0];
  objc_storeStrong(location, 0);
  return v5;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (void)controllerWasPopped
{
  if ((id)[(BackupRestoreProgressController *)self restoreState] == (id)1)
  {
    [(BackupRestoreProgressController *)self setRestoreState:3];
    [(MBManager *)self->_backupManager cancel];
  }
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BackupRestoreProgressController *)v4 takeAssertions];
  [(BackupRestoreProgressController *)v4 _attemptRestore];
  if (location[0]) {
    (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
  }
  objc_storeStrong(location, 0);
}

- (void)backupDeviceController:(id)a3 backupCompletedWithError:(id)a4
{
  id v74 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v72 = 0;
  objc_storeStrong(&v72, a4);
  if (v72)
  {
    id v5 = (__CFString *)[v72 domain];
    BOOL v6 = 0;
    if (v5 == @"BFFBackupDeviceErrorDomain") {
      BOOL v6 = [v72 code] == (id)-1;
    }

    if (v6)
    {
      id v71 = (id)_BYLoggingFacility();
      os_log_type_t v70 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v71, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = v71;
        os_log_type_t v8 = v70;
        sub_10004B24C(buf);
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "Source device disconnected while waiting for backup to complete", buf, 2u);
      }
      objc_storeStrong(&v71, 0);
      id v68 = [(BackupRestoreProgressController *)v74 waitForBackupToComplete];
      [(BackupRestoreProgressController *)v74 _traceAnalyticsForGuideUserToBackup:0 foundBackup:v68 != 0 polledForBackup:1];
      if (v68)
      {
        [(BackupRestoreProgressController *)v74 renewCredentialsThenStartRestore:v68];
      }
      else
      {
        id v67 = (id)_BYLoggingFacility();
        char v66 = 16;
        if (os_log_type_enabled((os_log_t)v67, OS_LOG_TYPE_ERROR))
        {
          os_log_type_t v9 = v67;
          os_log_type_t v10 = v66;
          sub_10004B24C(v65);
          _os_log_error_impl((void *)&_mh_execute_header, v9, v10, "No latest backup found; giving up!", v65, 2u);
        }
        objc_storeStrong(&v67, 0);
        [(BackupRestoreProgressController *)v74 handleBackupFailed:v72];
      }
      objc_storeStrong(&v68, 0);
    }
    else
    {
      id v64 = (id)_BYLoggingFacility();
      os_log_type_t v63 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v64, OS_LOG_TYPE_ERROR))
      {
        char v61 = 0;
        char v59 = 0;
        if (_BYIsInternalInstall())
        {
          id v11 = (NSString *)v72;
        }
        else if (v72)
        {
          id v62 = [v72 domain];
          char v61 = 1;
          id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v62, [v72 code]);
          char v60 = v11;
          char v59 = 1;
        }
        else
        {
          id v11 = 0;
        }
        sub_10004BB7C((uint64_t)v76, (uint64_t)v11);
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v64, v63, "Backup failed with error: %{public}@", v76, 0xCu);
        if (v59) {

        }
        if (v61) {
      }
        }
      objc_storeStrong(&v64, 0);
      [(BackupRestoreProgressController *)v74 _traceAnalyticsForGuideUserToBackup:v72 foundBackup:0 polledForBackup:0];
      [(BackupRestoreProgressController *)v74 handleBackupFailed:v72];
    }
  }
  else
  {
    int v12 = [(BackupRestoreProgressController *)v74 proximitySetupController];
    [(ProximitySetupController *)v12 setupFinished];

    v74->_double backupPercentComplete = 1.0;
    id v13 = &_dispatch_main_q;
    block = _NSConcreteStackBlock;
    int v54 = -1073741824;
    int v55 = 0;
    id v56 = sub_10006A650;
    id v57 = &unk_1002B0D20;
    os_log_type_t v58 = v74;
    dispatch_async((dispatch_queue_t)v13, &block);

    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v51 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = oslog;
      os_log_type_t v15 = v51;
      sub_10004B24C(v50);
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Waiting 30 seconds for iCloud servers to ingest the new backup...", v50, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    sleep(0x1Eu);
    os_log_t v49 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v48 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      char v16 = v49;
      os_log_type_t v17 = v48;
      sub_10004B24C(v47);
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Searching for latest snapshot for source device...", v47, 2u);
    }
    objc_storeStrong((id *)&v49, 0);
    id v46 = 0;
    id v45 = 0;
    int v44 = 0;
    do
    {
      id obj = v46;
      id v18 = [(BackupRestoreProgressController *)v74 latestSnapshotForSourceDevice:&obj];
      objc_storeStrong(&v46, obj);
      id v19 = v45;
      id v45 = v18;

      if (v45) {
        break;
      }
      os_log_t v42 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v41 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        os_log_type_t v20 = v42;
        os_log_type_t v21 = v41;
        char v22 = _BYIsInternalInstall();
        char v39 = 0;
        char v37 = 0;
        if (v22)
        {
          os_log_type_t v23 = (NSString *)v46;
        }
        else if (v46)
        {
          id v40 = [v46 domain];
          char v39 = 1;
          os_log_type_t v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v40, [v46 code]);
          id v38 = v23;
          char v37 = 1;
        }
        else
        {
          os_log_type_t v23 = 0;
        }
        sub_10004BB7C((uint64_t)v75, (uint64_t)v23);
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "Unable to retrieve latest backup: %{public}@", v75, 0xCu);
        if (v37) {

        }
        if (v39) {
      }
        }
      objc_storeStrong((id *)&v42, 0);
      os_log_t v36 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v35 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        os_log_type_t v24 = v36;
        os_log_type_t v25 = v35;
        sub_10004B24C(v34);
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "Attempting to retry to get latest backup due to error...", v34, 2u);
      }
      objc_storeStrong((id *)&v36, 0);
      ++v44;
      sleep(5u);
    }
    while (v44 < 3);
    [(BackupRestoreProgressController *)v74 _traceAnalyticsForGuideUserToBackup:0 foundBackup:v45 != 0 polledForBackup:0];
    if (v45)
    {
      [(BackupRestoreProgressController *)v74 renewCredentialsThenStartRestore:v45];
    }
    else
    {
      double v26 = &_dispatch_main_q;
      double v27 = _NSConcreteStackBlock;
      int v28 = -1073741824;
      int v29 = 0;
      id v30 = sub_10006A67C;
      id v31 = &unk_1002B12F0;
      char v32 = v74;
      id v33 = v46;
      dispatch_async((dispatch_queue_t)v26, &v27);

      objc_storeStrong(&v33, 0);
      objc_storeStrong((id *)&v32, 0);
    }
    objc_storeStrong(&v45, 0);
    objc_storeStrong(&v46, 0);
    objc_storeStrong((id *)&v58, 0);
  }
  objc_storeStrong(&v72, 0);
  objc_storeStrong(location, 0);
}

- (void)backupProgress:(double)a3 estimatedTimeRemaining:(unint64_t)a4
{
  int v14 = self;
  SEL v13 = a2;
  double v12 = a3;
  id v11 = (void *)a4;
  id v4 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  os_log_type_t v8 = sub_10006A8CC;
  os_log_type_t v9 = &unk_1002B1430;
  v10[1] = v11;
  v10[0] = v14;
  v10[2] = *(id *)&v12;
  dispatch_async((dispatch_queue_t)v4, &block);

  objc_storeStrong(v10, 0);
}

- (void)manager:(id)a3 didUpdateProgress:(float)a4 estimatedTimeRemaining:(unint64_t)a5
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  float v16 = a4;
  os_log_type_t v15 = (void *)a5;
  int v7 = &_dispatch_main_q;
  os_log_type_t v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  id v11 = sub_10006AA54;
  double v12 = &unk_1002B1458;
  v13[1] = v15;
  v13[0] = v18;
  float v14 = a4;
  dispatch_async((dispatch_queue_t)v7, &v8);

  objc_storeStrong(v13, 0);
  objc_storeStrong(location, 0);
}

- (void)managerDidFinishRestore:(id)a3
{
  int v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v27 = (id)_BYLoggingFacility();
  os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v3 = v27;
    os_log_type_t v4 = v26;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Successfully finished restore", buf, 2u);
  }
  objc_storeStrong(&v27, 0);
  [(BackupRestoreProgressController *)v29 setRestoreState:4];
  id v5 = (void (**)(void))[(BackupRestoreProgressController *)v29 prepareForCloudRestoreRebootBlock];
  v5[2](v5);

  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = oslog;
    os_log_type_t v7 = v23;
    sub_10004B24C(v22);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Promoting device lock assertion...", v22, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(BackupRestoreProgressController *)v29 deviceLockAssertion];
  if (MKBDeviceLockAssertionPromote())
  {
    os_log_t v20 = (os_log_t)(id)_BYLoggingFacility();
    char v19 = 16;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      os_log_type_t v8 = v20;
      os_log_type_t v9 = v19;
      sub_10004B24C(v18);
      _os_log_error_impl((void *)&_mh_execute_header, v8, v9, "Failed to promote device lock assertion", v18, 2u);
    }
    objc_storeStrong((id *)&v20, 0);
  }
  int v10 = &_dispatch_main_q;
  id v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  float v14 = sub_10006AD6C;
  os_log_type_t v15 = &unk_1002B12F0;
  float v16 = v29;
  id v17 = location[0];
  dispatch_async((dispatch_queue_t)v10, &v11);

  objc_storeStrong(&v17, 0);
  objc_storeStrong((id *)&v16, 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 didFailRestoreWithError:(id)a4
{
  os_log_type_t v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  if ((id)[(BackupRestoreProgressController *)v24 restoreState] != (id)3)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v20 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      char v18 = 0;
      char v16 = 0;
      if (_BYIsInternalInstall())
      {
        id v5 = (NSString *)v22;
      }
      else if (v22)
      {
        id v19 = [v22 domain];
        char v18 = 1;
        id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v19, [v22 code]);
        id v17 = v5;
        char v16 = 1;
      }
      else
      {
        id v5 = 0;
      }
      sub_10004BB7C((uint64_t)buf, (uint64_t)v5);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, v20, "Restore failed: %{public}@", buf, 0xCu);
      if (v16) {

      }
      if (v18) {
    }
      }
    objc_storeStrong((id *)&oslog, 0);
    id v6 = [v22 domain];
    BOOL backupThenRestore = 0;
    if ([v6 isEqualToString:@"MBErrorDomain"])
    {
      if ([v22 code] == (id)204 || (BOOL backupThenRestore = 0, objc_msgSend(v22, "code") == (id)205)) {
        BOOL backupThenRestore = v24->_backupThenRestore;
      }
    }

    if (backupThenRestore)
    {
      os_log_type_t v8 = dispatch_get_global_queue(0, 0);
      block = _NSConcreteStackBlock;
      int v10 = -1073741824;
      int v11 = 0;
      int v12 = sub_10006B4D4;
      int v13 = &unk_1002B12F0;
      float v14 = v24;
      id v15 = v22;
      dispatch_async(v8, &block);

      objc_storeStrong(&v15, 0);
      objc_storeStrong((id *)&v14, 0);
    }
    else if ([v22 code] != (id)202)
    {
      [(BackupRestoreProgressController *)v24 restoreFailedWithError:v22];
    }
  }
  [(BackupRestoreProgressController *)v24 releaseAssertions];
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (void)managerDidLoseConnectionToService:(id)a3
{
  float v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((id)[(BackupRestoreProgressController *)v14 restoreState] == (id)1)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    char v11 = 16;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v3 = oslog;
      os_log_type_t v4 = v11;
      sub_10004B24C(buf);
      _os_log_error_impl((void *)&_mh_execute_header, v3, v4, "Lost connection to backup while restoring!", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    [(BackupRestoreProgressController *)v14 manager:location[0] didFailRestoreWithError:0];
  }
  else
  {
    os_log_t v9 = (os_log_t)(id)_BYLoggingFacility();
    char v8 = 16;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v5 = v9;
      os_log_type_t v6 = v8;
      sub_10004B24C(v7);
      _os_log_error_impl((void *)&_mh_execute_header, v5, v6, "Lost connection to backup!", (uint8_t *)v7, 2u);
    }
    objc_storeStrong((id *)&v9, 0);
  }
  objc_storeStrong(location, 0);
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RestorableBackupItem)backupItem
{
  return self->_backupItem;
}

- (void)setBackupItem:(id)a3
{
}

- (BOOL)softwareUpdateDidOccur
{
  return self->_softwareUpdateDidOccur;
}

- (void)setSoftwareUpdateDidOccur:(BOOL)a3
{
  self->_softwareUpdateDidOccur = a3;
}

- (BuddyPendingRestoreState)pendingRestoreState
{
  return self->_pendingRestoreState;
}

- (void)setPendingRestoreState:(id)a3
{
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
}

- (BFFBackupDeviceController)backupDeviceController
{
  return self->_backupDeviceController;
}

- (void)setBackupDeviceController:(id)a3
{
}

- (id)prepareForCloudRestoreRebootBlock
{
  return self->_prepareForCloudRestoreRebootBlock;
}

- (void)setPrepareForCloudRestoreRebootBlock:(id)a3
{
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (LockdownModeProvider)lockdownModeProvider
{
  return self->_lockdownModeProvider;
}

- (void)setLockdownModeProvider:(id)a3
{
}

- (MBManager)backupManager
{
  return self->_backupManager;
}

- (void)setBackupManager:(id)a3
{
}

- (int64_t)restoreState
{
  return self->_restoreState;
}

- (void)setRestoreState:(int64_t)a3
{
  self->_restoreState = a3;
}

- (double)backupPercentComplete
{
  return self->_backupPercentComplete;
}

- (void)setBackupPercentComplete:(double)a3
{
  self->_double backupPercentComplete = a3;
}

- (double)restorePercentComplete
{
  return self->_restorePercentComplete;
}

- (void)setRestorePercentComplete:(double)a3
{
  self->_restorePercentComplete = a3;
}

- (RBSAssertion)processAssertion
{
  return self->_processAssertion;
}

- (void)setProcessAssertion:(id)a3
{
}

- (__MKBAssertion)deviceLockAssertion
{
  return self->_deviceLockAssertion;
}

- (void)setDeviceLockAssertion:(__MKBAssertion *)a3
{
  self->_deviceLockAssertion = a3;
}

- (UIAlertController)alert
{
  return self->_alert;
}

- (BuddyDisplayMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (void)setDisplayMonitor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end