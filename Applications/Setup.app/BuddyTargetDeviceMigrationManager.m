@interface BuddyTargetDeviceMigrationManager
+ (id)createDeviceTransferTask:(id)a3;
- (BOOL)didComplete;
- (BOOL)forceUpdateToMigrate;
- (BOOL)hasImportedKeychain;
- (BOOL)hasTransferredData;
- (BOOL)hasVersionIncompatibility;
- (BOOL)ignoreProximityDisconnections;
- (BOOL)inAppleStore;
- (BOOL)migrationInProgressOrCompleted;
- (BOOL)requiresUpdateToMigrate;
- (BOOL)softwareUpdateDidOccur;
- (BOOL)userChoseMigration;
- (BYAnalyticsManager)analyticsManager;
- (BYPasscodeCacheManager)passcodeCacheManager;
- (BYPreferencesController)buddyPreferencesExcludedFromBackup;
- (BuddyDisplayMonitor)displayMonitor;
- (BuddyNetworkProvider)networkProvider;
- (BuddyTargetDeviceMigrationManager)initWithFileTranferSession:(id)a3 proximitySetupController:(id)a4 prepareForMigrationRebootBlock:(id)a5 passcodeCacheManager:(id)a6 buddyPreferencesExcludedFromBackup:(id)a7 analyticsManager:(id)a8 lockdownModeProvider:(id)a9;
- (MBDeviceTransferKeychain)keychainInfo;
- (MBDeviceTransferPreflight)preflightInformation;
- (NSError)keychainError;
- (NSError)preflightError;
- (NSString)sourceDeviceModel;
- (NSString)sourceDeviceProductVersion;
- (OS_dispatch_queue)keychainDataTransferCompletionQueue;
- (ProximitySetupController)proximitySetupController;
- (_TtP5Setup20LockdownModeProvider_)lockdownModeProvider;
- (__MKBAssertion)acquireDeviceLockAssertion;
- (id)_targetDeviceTransferTask;
- (id)keychainDataImportCompletionBlock;
- (id)preflightCompletionBlock;
- (id)prepareForMigrationRebootBlock;
- (void)_rebootDevice;
- (void)_stageReboot;
- (void)cancelDeviceTransferTask;
- (void)connectionTerminated;
- (void)didCancel;
- (void)didCompleteWithError:(id)a3;
- (void)reset;
- (void)setAnalyticsManager:(id)a3;
- (void)setBuddyPreferencesExcludedFromBackup:(id)a3;
- (void)setDidComplete:(BOOL)a3;
- (void)setDisplayMonitor:(id)a3;
- (void)setHasImportedKeychain:(BOOL)a3;
- (void)setHasTransferredData:(BOOL)a3;
- (void)setHasVersionIncompatibility:(BOOL)a3;
- (void)setIgnoreProximityDisconnections:(BOOL)a3;
- (void)setInAppleStore:(BOOL)a3;
- (void)setKeychainDataImportCompletionBlock:(id)a3;
- (void)setKeychainDataTransferCompletionQueue:(id)a3;
- (void)setKeychainError:(id)a3;
- (void)setKeychainInfo:(id)a3;
- (void)setLockdownModeProvider:(id)a3;
- (void)setNetworkProvider:(id)a3;
- (void)setPasscodeCacheManager:(id)a3;
- (void)setPreflightCompletionBlock:(id)a3;
- (void)setPreflightError:(id)a3;
- (void)setPreflightInformation:(id)a3;
- (void)setPrepareForMigrationRebootBlock:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setRequiresUpdateToMigrate:(BOOL)a3;
- (void)setSoftwareUpdateDidOccur:(BOOL)a3;
- (void)setSourceDeviceModel:(id)a3;
- (void)setSourceDeviceProductVersion:(id)a3;
- (void)setUserChoseMigration:(BOOL)a3;
- (void)start;
- (void)startDataTransfer;
- (void)startDeviceTransferTask;
- (void)startKeychainDataImport;
- (void)startKeychainDataTransferWithCompletionHandler:(id)a3;
- (void)startPreflight;
- (void)waitForKeychain:(id)a3;
- (void)waitForKeychainDataImport:(id)a3;
- (void)waitForKeychainDataTransfer:(id)a3;
- (void)waitForPreflight:(id)a3;
@end

@implementation BuddyTargetDeviceMigrationManager

- (BuddyTargetDeviceMigrationManager)initWithFileTranferSession:(id)a3 proximitySetupController:(id)a4 prepareForMigrationRebootBlock:(id)a5 passcodeCacheManager:(id)a6 buddyPreferencesExcludedFromBackup:(id)a7 analyticsManager:(id)a8 lockdownModeProvider:(id)a9
{
  id v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id obj = 0;
  objc_storeStrong(&obj, a4);
  id v26 = 0;
  objc_storeStrong(&v26, a5);
  id v25 = 0;
  objc_storeStrong(&v25, a6);
  id v24 = 0;
  objc_storeStrong(&v24, a7);
  id v23 = 0;
  objc_storeStrong(&v23, a8);
  id v22 = 0;
  objc_storeStrong(&v22, a9);
  id v14 = v29;
  id v29 = 0;
  v21.receiver = v14;
  v21.super_class = (Class)BuddyTargetDeviceMigrationManager;
  id v29 = [(BuddyTargetDeviceMigrationManager *)&v21 initWithFileTranferSession:location[0]];
  objc_storeStrong(&v29, v29);
  if (v29)
  {
    objc_storeStrong((id *)v29 + 4, obj);
    id v15 = objc_retainBlock(v26);
    v16 = (void *)*((void *)v29 + 5);
    *((void *)v29 + 5) = v15;

    objc_storeStrong((id *)v29 + 15, v25);
    objc_storeStrong((id *)v29 + 16, v24);
    objc_storeStrong((id *)v29 + 17, v23);
    id v17 = +[BYPreferencesController buddyPreferencesInternal];
    unsigned __int8 v18 = [v17 BOOLForKey:@"RequireSoftwareUpdateForMigration"];
    *((unsigned char *)v29 + 9) = v18 & 1;

    objc_storeStrong((id *)v29 + 19, v22);
  }
  v19 = (BuddyTargetDeviceMigrationManager *)v29;
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v29, 0);
  return v19;
}

- (void)start
{
  v8 = self;
  SEL v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)BuddyTargetDeviceMigrationManager;
  [(BuddyTargetDeviceMigrationManager *)&v6 start];
  dispatch_queue_t v2 = dispatch_queue_create("Keychain Data Transfer Completion Queue", 0);
  [(BuddyTargetDeviceMigrationManager *)v8 setKeychainDataTransferCompletionQueue:v2];

  v3 = [(BuddyTargetDeviceMigrationManager *)v8 keychainDataTransferCompletionQueue];
  dispatch_suspend(v3);

  v4 = [(BuddyTargetDeviceMigrationManager *)v8 networkProvider];
  unsigned __int8 v5 = [(BuddyNetworkProvider *)v4 inAppleStore];
  [(BuddyTargetDeviceMigrationManager *)v8 setInAppleStore:v5 & 1];
}

- (void)startPreflight
{
  v9 = self;
  v8[1] = (id)a2;
  dispatch_queue_t v2 = [(BuddyTargetDeviceMigrationManager *)self migrationQueue];
  block = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  objc_super v6 = sub_100098AB0;
  SEL v7 = &unk_1002B0D20;
  v8[0] = v9;
  dispatch_async(v2, &block);

  objc_storeStrong(v8, 0);
}

- (void)waitForPreflight:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(BuddyTargetDeviceMigrationManager *)v12 migrationQueue];
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  SEL v7 = sub_100098FCC;
  v8 = &unk_1002B0CD0;
  v9 = v12;
  id v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)startKeychainDataTransferWithCompletionHandler:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(BuddyTargetDeviceMigrationManager *)v12 migrationQueue];
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  SEL v7 = sub_1000991DC;
  v8 = &unk_1002B0CD0;
  v9 = v12;
  id v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)waitForKeychainDataTransfer:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(BuddyTargetDeviceMigrationManager *)v12 keychainDataTransferCompletionQueue];
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  SEL v7 = sub_100099704;
  v8 = &unk_1002B0CD0;
  v9 = v12;
  id v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)startKeychainDataImport
{
  v9 = self;
  v8[1] = (id)a2;
  dispatch_queue_t v2 = [(BuddyTargetDeviceMigrationManager *)self migrationQueue];
  block = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  int v6 = sub_1000999DC;
  SEL v7 = &unk_1002B0D20;
  v8[0] = v9;
  dispatch_async(v2, &block);

  objc_storeStrong(v8, 0);
}

- (void)waitForKeychainDataImport:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(BuddyTargetDeviceMigrationManager *)v12 migrationQueue];
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  SEL v7 = sub_100099F04;
  v8 = &unk_1002B0CD0;
  v9 = v12;
  id v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)waitForKeychain:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v12;
  int v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  SEL v7 = sub_10009A080;
  v8 = &unk_1002B1F00;
  id v10 = location[0];
  v9 = v12;
  [(BuddyTargetDeviceMigrationManager *)v3 waitForKeychainDataTransfer:&v4];
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)startDataTransfer
{
  id v10 = self;
  v9[1] = (id)a2;
  dispatch_queue_t v2 = [(BuddyTargetDeviceMigrationManager *)self passcodeCacheManager];
  [(BYPasscodeCacheManager *)v2 persistPasscodeStash];

  v3 = [(BuddyTargetDeviceMigrationManager *)v10 migrationQueue];
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  SEL v7 = sub_10009A1E0;
  v8 = &unk_1002B0D20;
  v9[0] = v10;
  dispatch_async(v3, &block);

  objc_storeStrong(v9, 0);
}

- (void)reset
{
}

- (BOOL)requiresUpdateToMigrate
{
  BOOL requiresUpdateToMigrate = self->_requiresUpdateToMigrate;
  unsigned __int8 v3 = 1;
  if (!requiresUpdateToMigrate) {
    unsigned __int8 v3 = [(BuddyTargetDeviceMigrationManager *)self forceUpdateToMigrate];
  }
  return v3 & 1;
}

- (BOOL)hasVersionIncompatibility
{
  id v2 = [(BuddyTargetDeviceMigrationManager *)self error];
  id v3 = [v2 domain];
  unsigned __int8 v4 = [v3 isEqualToString:@"MBErrorDomain"];
  char v7 = 0;
  BOOL v5 = 0;
  if (v4)
  {
    id v8 = [(BuddyTargetDeviceMigrationManager *)self error];
    char v7 = 1;
    BOOL v5 = [v8 code] == (id)203;
  }
  BOOL v10 = v5;
  if (v7) {

  }
  return v10;
}

- (BOOL)migrationInProgressOrCompleted
{
  BOOL v5 = 0;
  if ([(BuddyTargetDeviceMigrationManager *)self userChoseMigration])
  {
    unsigned __int8 v2 = [(BuddyTargetDeviceMigrationManager *)self willMigrate];
    unsigned __int8 v3 = 1;
    if ((v2 & 1) == 0) {
      unsigned __int8 v3 = [(BuddyTargetDeviceMigrationManager *)self didComplete];
    }
    return v3 & 1;
  }
  return v5;
}

- (void)startDeviceTransferTask
{
  unsigned __int8 v2 = [(BuddyTargetDeviceMigrationManager *)self proximitySetupController];
  unsigned __int8 v3 = [(ProximitySetupController *)v2 model];
  [(BuddyTargetDeviceMigrationManager *)self setSourceDeviceModel:v3];

  unsigned __int8 v4 = [(BuddyTargetDeviceMigrationManager *)self proximitySetupController];
  BOOL v5 = [(ProximitySetupController *)v4 productVersion];
  [(BuddyTargetDeviceMigrationManager *)self setSourceDeviceProductVersion:v5];

  id v6 = [(BuddyTargetDeviceMigrationManager *)self _targetDeviceTransferTask];
  [v6 start];
}

- (void)cancelDeviceTransferTask
{
  id v2 = [(BuddyTargetDeviceMigrationManager *)self _targetDeviceTransferTask];
  [v2 cancel];
}

- (void)didCancel
{
  v9 = self;
  v8[1] = (id)a2;
  [(BuddyTargetDeviceMigrationManager *)self setWillMigrate:0];
  id v2 = [(BuddyTargetDeviceMigrationManager *)v9 migrationQueue];
  block = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = sub_10009A8D8;
  char v7 = &unk_1002B0D20;
  v8[0] = v9;
  dispatch_async(v2, &block);

  objc_storeStrong(v8, 0);
}

- (void)didCompleteWithError:(id)a3
{
  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyTargetDeviceMigrationManager *)v30 setDidComplete:1];
  id v3 = [location[0] domain];
  BOOL v4 = 0;
  if ([v3 isEqualToString:@"MBErrorDomain"]) {
    BOOL v4 = [location[0] code] == (id)202;
  }

  if (v4)
  {
    uint64_t v5 = BYDeviceMigrationManagerErrorDomain;
    id v6 = (char *)[(BuddyTargetDeviceMigrationManager *)v30 cancellationCause] + 1000;
    NSErrorUserInfoKey v33 = NSUnderlyingErrorKey;
    id v34 = location[0];
    char v7 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    id v8 = +[NSError errorWithDomain:v5 code:v6 userInfo:v7];
    id v9 = location[0];
    location[0] = v8;
  }
  if ([(BuddyTargetDeviceMigrationManager *)v30 userChoseMigration])
  {
    v31[0] = @"success";
    id v26 = +[NSNumber numberWithInt:location[0] == 0];
    v32[0] = v26;
    v31[1] = @"connectionType";
    id v10 = [(BuddyTargetDeviceMigrationManager *)v30 connectionInfo];
    v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 connectionType]);
    v32[1] = v11;
    v31[2] = @"sourceDeviceModel";
    v12 = [(BuddyTargetDeviceMigrationManager *)v30 sourceDeviceModel];
    v32[2] = v12;
    v31[3] = @"sourceDeviceProductVersion";
    v13 = [(BuddyTargetDeviceMigrationManager *)v30 sourceDeviceProductVersion];
    v32[3] = v13;
    v31[4] = @"inAppleStore";
    id v14 = +[NSNumber numberWithBool:[(BuddyTargetDeviceMigrationManager *)v30 inAppleStore]];
    v32[4] = v14;
    v31[5] = @"transferSize";
    id v15 = +[NSNumber numberWithUnsignedLongLong:[(BuddyTargetDeviceMigrationManager *)v30 bytesTransferred]];
    v32[5] = v15;
    v31[6] = @"numberOfFilesTransferred";
    v16 = +[NSNumber numberWithUnsignedLongLong:[(BuddyTargetDeviceMigrationManager *)v30 filesTransferred]];
    v32[6] = v16;
    v31[7] = @"transferDuration";
    [(BuddyTargetDeviceMigrationManager *)v30 durationOfTransfer];
    id v17 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v32[7] = v17;
    v31[8] = @"restoreDuration";
    [(BuddyTargetDeviceMigrationManager *)v30 durationOfRestore];
    unsigned __int8 v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v32[8] = v18;
    v19 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:9];
    id v28 = +[NSMutableDictionary dictionaryWithDictionary:v19];

    if (location[0])
    {
      id v20 = [location[0] domain];
      objc_super v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (%ld)", v20, [location[0] code]);
      [v28 setObject:v21 forKeyedSubscript:@"error"];

      id v22 = [location[0] userInfo];
      id v27 = [v22 objectForKey:NSUnderlyingErrorKey];

      if (v27)
      {
        id v23 = [location[0] domain];
        id v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (%ld)", v23, [location[0] code]);
        [v28 setObject:v24 forKeyedSubscript:@"underlyingError"];
      }
      objc_storeStrong(&v27, 0);
    }
    id v25 = [(BuddyTargetDeviceMigrationManager *)v30 analyticsManager];
    [(BYAnalyticsManager *)v25 addEvent:@"com.apple.setupassistant.ios.migration" withPayload:v28 persist:1];

    objc_storeStrong(&v28, 0);
  }
  if (!location[0]) {
    [(BuddyTargetDeviceMigrationManager *)v30 _stageReboot];
  }
  objc_storeStrong(location, 0);
}

- (__MKBAssertion)acquireDeviceLockAssertion
{
  id v15 = self;
  SEL v14 = a2;
  if ([(BuddyTargetDeviceMigrationManager *)self softwareUpdateDidOccur])
  {
    id location = objc_alloc_init((Class)BYBuddyDaemonGeneralClient);
    [location cancelDataMigratorDeferredExit];
    CFTypeRef cf = 0;
    uint64_t v10 = MKBDeviceLockAssertionConsume();
    if (v10)
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        id v2 = oslog;
        os_log_type_t v3 = v8;
        sub_10004B24C(buf);
        _os_log_impl((void *)&_mh_execute_header, v2, v3, "Device lock assertion consumed during migration", buf, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    else
    {
      os_log_t v6 = (os_log_t)(id)_BYLoggingFacility();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        if (_BYIsInternalInstall()) {
          CFTypeRef v4 = cf;
        }
        else {
          CFTypeRef v4 = 0;
        }
        sub_10004BB7C((uint64_t)v17, (uint64_t)v4);
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to consume device lock assertion during migration - %{public}@", v17, 0xCu);
      }
      objc_storeStrong((id *)&v6, 0);
      CFRelease(cf);
    }
    v16 = (__MKBAssertion *)v10;
    objc_storeStrong(&location, 0);
  }
  else
  {
    v13.receiver = v15;
    v13.super_class = (Class)BuddyTargetDeviceMigrationManager;
    return [(BuddyTargetDeviceMigrationManager *)&v13 acquireDeviceLockAssertion];
  }
  return v16;
}

+ (id)createDeviceTransferTask:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = objc_alloc((Class)MBTargetDeviceTransferTask);
  id v4 = [v3 initWithFileTransferSession:location[0]];
  objc_storeStrong(location, 0);

  return v4;
}

- (id)_targetDeviceTransferTask
{
  return [(BuddyTargetDeviceMigrationManager *)self deviceTransferTask];
}

- (void)_stageReboot
{
  id v22 = self;
  location[1] = (id)a2;
  id v2 = [(BuddyTargetDeviceMigrationManager *)self buddyPreferencesExcludedFromBackup];
  unsigned __int8 v3 = +[BuddyMigrationState hasStateFromPreferences:v2];

  if (v3)
  {
    location[0] = (id)_BYLoggingFacility();
    os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = location[0];
      os_log_type_t v5 = v20;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Promoting device lock assertion...", buf, 2u);
    }
    objc_storeStrong(location, 0);
    [(BuddyTargetDeviceMigrationManager *)v22 deviceLockAssertion];
    int v18 = MKBDeviceLockAssertionPromote();
    if (v18)
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        sub_10005A060(v23, v18);
        _os_log_error_impl((void *)&_mh_execute_header, oslog, v16, "Failed to promote device lock assertion: %d", v23, 8u);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
  }
  os_log_t v6 = [(BuddyTargetDeviceMigrationManager *)v22 buddyPreferencesExcludedFromBackup];
  char v7 = +[NSNumber numberWithBool:[(BuddyTargetDeviceMigrationManager *)v22 softwareUpdateDidOccur]];
  [(BYPreferencesController *)v6 setObject:v7 forKey:BYBuddySoftwareUpdateMigration persistImmediately:1];

  os_log_type_t v8 = (void (**)(void))[(BuddyTargetDeviceMigrationManager *)v22 prepareForMigrationRebootBlock];
  v8[2](v8);

  id v9 = &_dispatch_main_q;
  uint64_t v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  objc_super v13 = sub_10009B664;
  SEL v14 = &unk_1002B0D20;
  id v15 = v22;
  dispatch_async((dispatch_queue_t)v9, &v10);

  objc_storeStrong((id *)&v15, 0);
}

- (void)_rebootDevice
{
  id v29 = self;
  location[1] = (id)a2;
  location[0] = (id)_BYLoggingFacility();
  os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = location[0];
    os_log_type_t v3 = v27;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Rebooting...", buf, 2u);
  }
  objc_storeStrong(location, 0);
  id v25 = objc_alloc_init((Class)MBManager);
  id v4 = [(BuddyTargetDeviceMigrationManager *)v29 lockdownModeProvider];
  unsigned __int8 v5 = [(LockdownModeProvider *)v4 hasStagedEnablement];

  if (v5)
  {
    id v24 = (id)_BYLoggingFacility();
    os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v6 = v24;
      os_log_type_t v7 = v23;
      sub_10004B24C(v22);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Enabling lockdown...", v22, 2u);
    }
    objc_storeStrong(&v24, 0);
    os_log_type_t v8 = [(BuddyTargetDeviceMigrationManager *)v29 lockdownModeProvider];
    os_log_type_t v16 = _NSConcreteStackBlock;
    int v17 = -1073741824;
    int v18 = 0;
    v19 = sub_10009BA28;
    os_log_type_t v20 = &unk_1002B0FF0;
    id v21 = v25;
    [(LockdownModeProvider *)v8 enableWithStrategy:1 completionHandler:&v16];

    objc_storeStrong(&v21, 0);
  }
  else
  {
    [v25 rebootDevice:0];
  }
  id v9 = [(BuddyTargetDeviceMigrationManager *)v29 migrationQueue];
  uint64_t v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  objc_super v13 = sub_10009BBA4;
  SEL v14 = &unk_1002B0D20;
  id v15 = v29;
  dispatch_async(v9, &v10);

  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(&v25, 0);
}

- (void)connectionTerminated
{
  int v12 = self;
  oslog[1] = (os_log_t)a2;
  if ([(BuddyTargetDeviceMigrationManager *)self ignoreProximityDisconnections])
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      id v2 = oslog[0];
      os_log_type_t v3 = v10;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Ignoring loss of proximity connection; will not cancel migration",
        buf,
        2u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  else
  {
    os_log_t v8 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v8;
      os_log_type_t v5 = v7;
      sub_10004B24C(v6);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Cancelling migration in response to loss of proximity connection...", (uint8_t *)v6, 2u);
    }
    objc_storeStrong((id *)&v8, 0);
    [(BuddyTargetDeviceMigrationManager *)v12 cancelWithCause:4];
  }
}

- (void)setRequiresUpdateToMigrate:(BOOL)a3
{
  self->_BOOL requiresUpdateToMigrate = a3;
}

- (BOOL)forceUpdateToMigrate
{
  return self->_forceUpdateToMigrate;
}

- (BOOL)userChoseMigration
{
  return self->_userChoseMigration;
}

- (void)setUserChoseMigration:(BOOL)a3
{
  self->_userChoseMigration = a3;
}

- (BOOL)hasTransferredData
{
  return self->_hasTransferredData;
}

- (void)setHasTransferredData:(BOOL)a3
{
  self->_hasTransferredData = a3;
}

- (BOOL)didComplete
{
  return self->_didComplete;
}

- (void)setDidComplete:(BOOL)a3
{
  self->_didComplete = a3;
}

- (BOOL)ignoreProximityDisconnections
{
  return self->_ignoreProximityDisconnections;
}

- (void)setIgnoreProximityDisconnections:(BOOL)a3
{
  self->_ignoreProximityDisconnections = a3;
}

- (BOOL)softwareUpdateDidOccur
{
  return self->_softwareUpdateDidOccur;
}

- (void)setSoftwareUpdateDidOccur:(BOOL)a3
{
  self->_softwareUpdateDidOccur = a3;
}

- (void)setHasVersionIncompatibility:(BOOL)a3
{
  self->_hasVersionIncompatibility = a3;
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
}

- (id)prepareForMigrationRebootBlock
{
  return self->_prepareForMigrationRebootBlock;
}

- (void)setPrepareForMigrationRebootBlock:(id)a3
{
}

- (BOOL)hasImportedKeychain
{
  return self->_hasImportedKeychain;
}

- (void)setHasImportedKeychain:(BOOL)a3
{
  self->_hasImportedKeychain = a3;
}

- (MBDeviceTransferPreflight)preflightInformation
{
  return self->_preflightInformation;
}

- (void)setPreflightInformation:(id)a3
{
}

- (NSError)preflightError
{
  return self->_preflightError;
}

- (void)setPreflightError:(id)a3
{
}

- (MBDeviceTransferKeychain)keychainInfo
{
  return self->_keychainInfo;
}

- (void)setKeychainInfo:(id)a3
{
}

- (NSError)keychainError
{
  return self->_keychainError;
}

- (void)setKeychainError:(id)a3
{
}

- (id)preflightCompletionBlock
{
  return self->_preflightCompletionBlock;
}

- (void)setPreflightCompletionBlock:(id)a3
{
}

- (OS_dispatch_queue)keychainDataTransferCompletionQueue
{
  return self->_keychainDataTransferCompletionQueue;
}

- (void)setKeychainDataTransferCompletionQueue:(id)a3
{
}

- (id)keychainDataImportCompletionBlock
{
  return self->_keychainDataImportCompletionBlock;
}

- (void)setKeychainDataImportCompletionBlock:(id)a3
{
}

- (NSString)sourceDeviceModel
{
  return self->_sourceDeviceModel;
}

- (void)setSourceDeviceModel:(id)a3
{
}

- (NSString)sourceDeviceProductVersion
{
  return self->_sourceDeviceProductVersion;
}

- (void)setSourceDeviceProductVersion:(id)a3
{
}

- (BOOL)inAppleStore
{
  return self->_inAppleStore;
}

- (void)setInAppleStore:(BOOL)a3
{
  self->_inAppleStore = a3;
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return self->_buddyPreferencesExcludedFromBackup;
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (BuddyDisplayMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (void)setDisplayMonitor:(id)a3
{
}

- (_TtP5Setup20LockdownModeProvider_)lockdownModeProvider
{
  return self->_lockdownModeProvider;
}

- (void)setLockdownModeProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end