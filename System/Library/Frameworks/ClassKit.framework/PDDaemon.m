@interface PDDaemon
- (BOOL)canEnableNoUserMode;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSDictionary)overrideEntitlementsDictionaryForTesting;
- (NSDictionary)statusReport;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (PDDaemon)initWithMachServiceName:(id)a3;
- (PDDatabase)database;
- (PDDatabase)studentDevDatabase;
- (PDDatabase)teacherDevDatabase;
- (PDOperationsManager)operationsManager;
- (PDUserNotificationManager)userNotificationManager;
- (id)_databaseInstance;
- (id)appIdentifierForConnection:(id)a3 withEntitlements:(id)a4;
- (id)miniStatusReport;
- (id)setupSignal:(int)a3 handler:(id)a4;
- (id)statusReportCurrentUser;
- (int)mode;
- (unint64_t)memoryPressureStatus;
- (unint64_t)stateHandle;
- (void)_cleanupSavedResponseDirectory;
- (void)_initializeSubsystemsIfNeeded;
- (void)_invalidateAndDeleteManagers;
- (void)_reinitializeManagers;
- (void)_updateBiomeClientWithDatabase:(id)a3;
- (void)dealloc;
- (void)exitClean:(BOOL)a3 reason:(id)a4;
- (void)handleAccountChange;
- (void)handleLocaleChange;
- (void)handleSignal:(int)a3;
- (void)iCloudDriveInitialSyncStatusDidChange:(id)a3;
- (void)invalidateServer:(id)a3;
- (void)loadConfig;
- (void)lock;
- (void)memoryPressureStatusChanged;
- (void)recreateDatabase;
- (void)recreateDatabaseAndReinitialize:(BOOL)a3;
- (void)recreateDevelopmentDatabases;
- (void)registerDashboardAppIfNeeded:(id)a3;
- (void)saveUpdatedConfig;
- (void)serverInitialSyncStatusDidChange:(id)a3;
- (void)setListener:(id)a3;
- (void)setMode:(int)a3;
- (void)setOperationsManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStateHandle:(unint64_t)a3;
- (void)setStudentDevDatabase:(id)a3;
- (void)setTeacherDevDatabase:(id)a3;
- (void)setupLocaleChangeHandler;
- (void)setupMemoryPressureHandlers;
- (void)setupSignalHandlers;
- (void)start;
- (void)terminateClean:(BOOL)a3 reason:(id)a4;
- (void)terminateCleanAfterRecreatingDatabase:(BOOL)a3;
- (void)unlock;
@end

@implementation PDDaemon

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_100002CE4(self);
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AAD0;
  block[3] = &unk_1001F33F0;
  block[4] = self;
  id v9 = v7;
  id v12 = v9;
  v13 = &v14;
  dispatch_sync(queue, block);
  [v9 resume];
  LOBYTE(self) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

- (id)appIdentifierForConnection:(id)a3 withEntitlements:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(v5, "cls_signingIdentifier");
  if (![v7 length])
  {
    uint64_t v8 = [v6 applicationBundleIdentifier];

    id v7 = (void *)v8;
  }
  v10 = +[LSBundleRecord bundleRecordWithBundleIdentifier:v7 allowPlaceholder:0 error:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = [v10 containingBundleRecord];
    id v12 = v11;
    if (v11)
    {
      uint64_t v13 = [v11 bundleIdentifier];

      id v7 = (void *)v13;
    }
  }

  return v7;
}

- (void)unlock
{
}

- (int)mode
{
  return self->_mode;
}

- (void)lock
{
}

- (PDDatabase)database
{
  return self->_database;
}

- (void)_initializeSubsystemsIfNeeded
{
  if (!self->_systemsInitialized && sub_100003CF8())
  {
    v3 = sub_1000057A0(@"DaemonInitializeSubsystems");
    CLSInitLog();
    v4 = CLSLogDatabase;
    if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "initializing account dependant subsystems", buf, 2u);
    }
    CLSInitLog();
    id v5 = (void *)CLSLogDatabase;
    if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_DEBUG))
    {
      v27 = v5;
      v28 = +[NSThread currentThread];
      *(_DWORD *)buf = 138412290;
      uint64_t v39 = (uint64_t)v28;
      _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Current thread: %@", buf, 0xCu);
    }
    [(PDDaemon *)self _cleanupSavedResponseDirectory];
    [(PDDaemon *)self _invalidateAndDeleteManagers];
    database = self->_database;
    if (database)
    {
      sub_1000FA92C(database);
      id v7 = self->_database;
      self->_database = 0;
    }
    uint64_t v8 = [(PDDaemon *)self _databaseInstance];
    id v9 = self->_database;
    self->_database = v8;

    if ((sub_1000FABCC(self->_database) & 1) == 0)
    {
      [(PDDatabase *)self->_database lock];
      if ((sub_1000FA9CC(self->_database) & 1) == 0)
      {
        [(PDDatabase *)self->_database unlock];
        sub_1000FA92C(self->_database);
        v10 = self->_database;
        self->_database = 0;

        CLSInitLog();
        v11 = CLSLogDatabase;
        if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to truncate database. Delete database files and terminate", buf, 2u);
        }
        id v12 = sub_1000D0CEC();
        id v37 = 0;
        unsigned __int8 v13 = sub_1000D1DB8((uint64_t)v12, (uint64_t)&v37);
        id v14 = v37;

        if ((v13 & 1) == 0)
        {
          CLSInitLog();
          v15 = CLSLogDatabase;
          if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v39 = (uint64_t)v14;
            _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to delete database files. Error: %{public}@", buf, 0xCu);
          }
        }
        uint64_t v16 = [(PDDaemon *)self listener];
        [v16 invalidate];

        [(PDDaemon *)self exitClean:0 reason:@"Terminating..."];
      }
      [(PDDatabase *)self->_database unlock];
    }
    if (!self->_database) {
      goto LABEL_47;
    }
    sub_1000062FC();
    char v17 = (id *)objc_claimAutoreleasedReturnValue();
    [(PDDatabase *)self->_database lock];
    uint64_t v18 = sub_100006D08(self->_database, @"currentAccountInfoID");
    CLSInitLog();
    v19 = CLSLogAuthorization;
    if (os_log_type_enabled(CLSLogAuthorization, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 141558274;
      uint64_t v39 = 1752392040;
      __int16 v40 = 2112;
      uint64_t v41 = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "CurrentUserID: %{mask.hash}@", buf, 0x16u);
    }
    if (v17) {
      id v20 = v17[4];
    }
    else {
      id v20 = 0;
    }
    unint64_t v21 = (unint64_t)v20;
    BOOL v22 = (v21 | v18) != 0;
    if (v21 | v18)
    {
      v23 = (void *)v21;
      if (v17)
      {
        id v24 = v17[4];
        if (v24 && v18)
        {
          id v25 = v17[4];
          unsigned __int8 v26 = [v25 isEqualToString:v18];

          if (v26) {
            goto LABEL_45;
          }
          goto LABEL_32;
        }
      }
      else
      {
        id v24 = 0;
      }
    }
LABEL_32:
    char v29 = v22 | sub_1000511A0((uint64_t)self->_database) ^ 1;
    CLSInitLog();
    v30 = CLSLogDatabase;
    if (v29)
    {
      if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v31 = @"NO";
        if (v22) {
          CFStringRef v31 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v39 = (uint64_t)v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "About to call truncate: accountChanged: %@", buf, 0xCu);
      }
      if ((sub_1000FA9CC(self->_database) & 1) == 0)
      {
        sub_1000FA92C(self->_database);
        [(PDDatabase *)self->_database unlock];
        v32 = self->_database;
        self->_database = 0;

        CLSInitLog();
        v33 = CLSLogDatabase;
        if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Failed to truncate database", buf, 2u);
        }
        goto LABEL_46;
      }
    }
    else if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "User Onboarding in progress.", buf, 2u);
    }
    v34 = self->_database;
    if (v17) {
      id v35 = v17[4];
    }
    else {
      id v35 = 0;
    }
    id v36 = v35;
    sub_10016018C(v34, v36, @"currentAccountInfoID");

LABEL_45:
    [(PDDatabase *)self->_database unlock];
    [(PDDaemon *)self _reinitializeManagers];
    self->_systemsInitialized = 1;
    [(PDDaemon *)self _setSettingsVisibilityFlagMacOS];
    sub_100005114(v3);
LABEL_46:

LABEL_47:
  }
}

- (PDDaemon)initWithMachServiceName:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)PDDaemon;
  id v5 = [(PDDaemon *)&v45 init];
  if (v5)
  {
    CLSInitLog();
    id v6 = (id)CLSPersonalPersonaUniqueIdentifier();
    id v7 = (id)CLSProgressClasses();
    id v8 = (id)CLSDashboardClasses();
    id v9 = (id)CLSReportClasses();
    id v10 = (id)CLSHandoutClasses();
    id v11 = (id)CLSArchivedHandoutClasses();
    id v12 = (id)CLSRosterClasses();
    id v13 = (id)CLSSearchClasses();
    id v14 = (id)CLSCollaborationStateClasses();
    id v15 = (id)CLSOnboardingClasses();
    id v16 = (id)CLSQueriableWithoutValidUserClasses();
    id v17 = (id)CLSSurveyClasses();
    id v18 = (id)CLSObjectsClasses();
    id v19 = (id)CLSEndpointServerInterface();
    id v20 = (id)CLSClientRemoteObjectInterface();
    id v21 = (id)CLSQueryInterface();
    id v22 = (id)CLSSaveResponseInterface();
    id v23 = (id)CLSAssetUploadProgressNotifiableInterface();
    id v24 = (id)CLSAssetDownloadProgressNotifiableInterface();
    +[PDDatabase registerEntities];
    id v25 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    unsigned __int8 v26 = dispatch_get_global_queue(25, 0);
    dispatch_queue_t v27 = dispatch_queue_create_with_target_V2("com.apple.progressd.daemon", v25, v26);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v27;

    if ([v4 length])
    {
      char v29 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:v4];
      listener = v5->_listener;
      v5->_listener = v29;

      [(NSXPCListener *)v5->_listener setDelegate:v5];
    }
    CFStringRef v31 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    servers = v5->_servers;
    v5->_servers = v31;

    v5->_lock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v5);
    uint64_t v39 = _NSConcreteStackBlock;
    uint64_t v40 = 3221225472;
    uint64_t v41 = sub_1000CA924;
    v42 = &unk_1001F4218;
    objc_copyWeak(&v43, &location);
    v33 = objc_retainBlock(&v39);
    v34 = dispatch_get_global_queue(0, 0);
    v5->_stateHandle = os_state_add_handler();

    [(PDDaemon *)v5 loadConfig];
    id v35 = objc_alloc_init(PDBiomeClient);
    biomeClient = v5->_biomeClient;
    v5->_biomeClient = v35;

    objc_storeStrong((id *)&qword_10023E908, v5);
    id v37 = +[NSNotificationCenter defaultCenter];
    [v37 addObserver:v5 selector:"iCloudDriveInitialSyncStatusDidChange:" name:CLSInitialiCloudDriveSyncCompleteNotificationName object:0];

    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)dealloc
{
  v3 = (void *)qword_10023E908;
  qword_10023E908 = 0;

  if (self->_stateHandle) {
    os_state_remove_handler();
  }
  v4.receiver = self;
  v4.super_class = (Class)PDDaemon;
  [(PDDaemon *)&v4 dealloc];
}

- (void)iCloudDriveInitialSyncStatusDidChange:(id)a3
{
  objc_super v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:CLSiCloudDriveInitialSyncStatusKey];
  unsigned int v6 = [v5 BOOLValue];

  id v7 = [v4 objectForKey:CLSiCloudDriveInitialSyncErrorKey];
  CLSInitLog();
  id v8 = CLSLogNotifications;
  if (v7)
  {
    if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_ERROR))
    {
      id v9 = "NO";
      if (v6) {
        id v9 = "YES";
      }
      int v13 = 136315394;
      id v14 = v9;
      __int16 v15 = 2114;
      id v16 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Received iCloud Drive initial sync state changed notification. iCloudDrive initial sync done: %s. Error: %{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
  else if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_INFO))
  {
    id v10 = "NO";
    if (v6) {
      id v10 = "YES";
    }
    int v13 = 136315138;
    id v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Received iCloud Drive initial sync state changed notification. iCloudDrive initial sync done: %s", (uint8_t *)&v13, 0xCu);
  }
  id v11 = [(PDDaemon *)self database];
  if (v6 != sub_10005112C(v11))
  {
    sub_10015FEC4(v11, v6, @"initialiCloudDriveSyncComplete");
    CLSInitLog();
    id v12 = CLSLogNotifications;
    if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Posted 'CLSiCloudDriveInitialSyncCompleteDarwinNotificationName' notification", (uint8_t *)&v13, 2u);
    }
    +[CLSUtil postNotificationAsync:CLSiCloudDriveInitialSyncCompleteDarwinNotificationName];
  }
}

- (void)serverInitialSyncStatusDidChange:(id)a3
{
  CLSInitLog();
  objc_super v4 = CLSLogNotifications;
  if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Received notification for server sync status change", buf, 2u);
  }
  if (sub_100051044(self->_database) && sub_1000510B8(self->_database))
  {
    initial_sync_transaction = self->_initial_sync_transaction;
    if (initial_sync_transaction)
    {
      sub_100005114(initial_sync_transaction);
      unsigned int v6 = self->_initial_sync_transaction;
      self->_initial_sync_transaction = 0;
    }
    +[CLSUtil postNotificationAsync:CLSInitialSyncCompleteDarwinNotificationName];
  }
  else
  {
    CLSInitLog();
    id v7 = CLSLogNotifications;
    if (os_log_type_enabled(CLSLogNotifications, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Sync not completed yet according to database", v8, 2u);
    }
  }
}

- (void)loadConfig
{
  objc_super v4 = sub_1000D0CEC();
  id v5 = sub_1000D11D4((uint64_t)v4);

  id v15 = 0;
  id v6 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v5 error:&v15];
  id v7 = v15;
  id v8 = v7;
  if (v6)
  {
    id v9 = [v6 objectForKeyedSubscript:@"mode"];
    id v10 = [v9 integerValue];

    int v11 = 2 * (v10 == (id)2);
    if (v10 == (id)1) {
      int v11 = 1;
    }
  }
  else
  {
    if ([v7 code] != (id)260)
    {
      CLSInitLog();
      id v12 = (void *)CLSLogDatabase;
      if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
      {
        int v13 = v12;
        id v14 = [v5 path];
        *(_DWORD *)buf = 138412546;
        id v17 = v14;
        __int16 v18 = 2112;
        id v19 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to init config dictionary from file at '%@'. Error: '%@'.", buf, 0x16u);
      }
    }
    int v11 = 0;
  }
  self->_mode = v11;
}

- (void)saveUpdatedConfig
{
  CFStringRef v9 = @"mode";
  objc_super v4 = +[NSNumber numberWithInt:self->_mode];
  id v10 = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];

  id v6 = sub_1000057A0(@"Update Config");
  id v7 = sub_1000D0CEC();
  id v8 = sub_1000D11D4((uint64_t)v7);
  [v5 writeToURL:v8 atomically:1];

  sub_100005114(v6);
}

- (void)setMode:(int)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    [(PDDaemon *)self saveUpdatedConfig];
    +[CLSUtil postNotification:"com.apple.progressd.devModeChanged"];
    sub_1000A8424();
    objc_super v4 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    if (v4) {
      v4[8] = a3 != 0;
    }
  }
}

- (NSDictionary)overrideEntitlementsDictionaryForTesting
{
  return 0;
}

- (void)start
{
  [(PDDaemon *)self setupMemoryPressureHandlers];
  [(PDDaemon *)self setupSignalHandlers];
  v3 = sub_1000057A0(@"DaemonInitTransaction");
  sub_100002CE4(self);
  objc_initWeak(&location, self);
  queue = self->_queue;
  id v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  id v7 = sub_1000CB220;
  id v8 = &unk_1001F2D28;
  objc_copyWeak(&v9, &location);
  dispatch_async(queue, &v5);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  sub_100005114(v3);
  [(PDDaemon *)self setupLocaleChangeHandler];
  +[CLSUtil postNotification:"com.apple.progressd.available"];
}

- (void)setupSignalHandlers
{
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000CB4EC;
  v17[3] = &unk_1001F2D28;
  objc_copyWeak(&v18, &location);
  uint64_t v3 = [(PDDaemon *)self setupSignal:3 handler:v17];
  objc_super v4 = (void *)qword_10023E5B8;
  qword_10023E5B8 = v3;

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000CB530;
  v15[3] = &unk_1001F2D28;
  objc_copyWeak(&v16, &location);
  uint64_t v5 = [(PDDaemon *)self setupSignal:6 handler:v15];
  uint64_t v6 = (void *)qword_10023E5C0;
  qword_10023E5C0 = v5;

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000CB574;
  v13[3] = &unk_1001F2D28;
  objc_copyWeak(&v14, &location);
  uint64_t v7 = [(PDDaemon *)self setupSignal:15 handler:v13];
  id v8 = (void *)qword_10023E5C8;
  qword_10023E5C8 = v7;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000CB5B8;
  v11[3] = &unk_1001F2D28;
  objc_copyWeak(&v12, &location);
  uint64_t v9 = [(PDDaemon *)self setupSignal:29 handler:v11];
  id v10 = (void *)qword_10023E5D0;
  qword_10023E5D0 = v9;

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (id)setupSignal:(int)a3 handler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, a3, 0, (dispatch_queue_t)self->_queue);
  if (v7)
  {
    signal(a3, (void (__cdecl *)(int))1);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000CB788;
    handler[3] = &unk_1001F4240;
    id v13 = v6;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume(v7);
  }
  else
  {
    CLSInitLog();
    id v8 = (void *)CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = v8;
      id v10 = sub_1000CB798(a3);
      *(_DWORD *)buf = 138412290;
      id v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Could not set up signal handler for '%@'", buf, 0xCu);
    }
  }

  return v7;
}

- (void)handleSignal:(int)a3
{
  uint64_t v5 = sub_1000CB798(a3);
  if (a3 != 29)
  {
    id v8 = +[NSString stringWithFormat:@"Received signal '%@'", v5];
    [(PDDaemon *)self exitClean:0 reason:v8];
    goto LABEL_7;
  }
  CLSInitLog();
  id v6 = CLSLogDefault;
  if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    int v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received signal '%@'", buf, 0xCu);
  }
  CLSInitLog();
  uint64_t v7 = (void *)CLSLogDefault;
  if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    uint64_t v9 = [(PDDaemon *)self miniStatusReport];
    *(_DWORD *)buf = 138412290;
    int v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Mini Status Report: %@", buf, 0xCu);

LABEL_7:
  }
}

- (void)setupMemoryPressureHandlers
{
  objc_initWeak(&location, self);
  self->_memoryPressureStatus = 1;
  uint64_t v3 = dispatch_get_global_queue(2, 0);
  dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_memorypressure, 0, 1uLL, v3);
  uint64_t v5 = (void *)qword_10023E5D8;
  qword_10023E5D8 = (uint64_t)v4;

  id v6 = qword_10023E5D8;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000CBBD4;
  handler[3] = &unk_1001F2D28;
  objc_copyWeak(&v18, &location);
  dispatch_source_set_event_handler(v6, handler);
  dispatch_activate((dispatch_object_t)qword_10023E5D8);
  dispatch_source_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_memorypressure, 0, 2uLL, v3);
  id v8 = (void *)qword_10023E5E0;
  qword_10023E5E0 = (uint64_t)v7;

  uint64_t v9 = qword_10023E5E0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000CBC20;
  v15[3] = &unk_1001F2D28;
  objc_copyWeak(&v16, &location);
  dispatch_source_set_event_handler(v9, v15);
  dispatch_activate((dispatch_object_t)qword_10023E5E0);
  dispatch_source_t v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_memorypressure, 0, 4uLL, v3);
  int v11 = (void *)qword_10023E5E8;
  qword_10023E5E8 = (uint64_t)v10;

  id v12 = qword_10023E5E8;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000CBC6C;
  v13[3] = &unk_1001F2D28;
  objc_copyWeak(&v14, &location);
  dispatch_source_set_event_handler(v12, v13);
  dispatch_activate((dispatch_object_t)qword_10023E5E8);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)memoryPressureStatusChanged
{
  unint64_t memoryPressureStatus = self->_memoryPressureStatus;
  if (memoryPressureStatus == 4)
  {
    uint64_t v3 = (double *)&unk_10023E600;
    dispatch_source_t v4 = "Memory Pressure Status: Critical";
    char v5 = 1;
  }
  else
  {
    if (memoryPressureStatus == 2)
    {
      uint64_t v3 = (double *)&unk_10023E5F8;
      dispatch_source_t v4 = "Memory Pressure Status: Warning";
    }
    else if (memoryPressureStatus == 1)
    {
      uint64_t v3 = (double *)&unk_10023E5F0;
      dispatch_source_t v4 = "Memory Pressure Status: Normal";
    }
    else
    {
      uint64_t v3 = (double *)&unk_10023E608;
      dispatch_source_t v4 = "Memory Pressure Status: Unknown - we should not get here!!!";
    }
    char v5 = 0;
  }
  sub_1000CBD2C(v5, v3, (uint64_t)v4);
}

- (void)setupLocaleChangeHandler
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"handleLocaleChange" name:NSCurrentLocaleDidChangeNotification object:0];
}

- (void)handleLocaleChange
{
}

- (void)exitClean:(BOOL)a3 reason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  CLSInitLog();
  dispatch_source_t v7 = CLSLogDefault;
  if (v4)
  {
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Clean exit with reason: %{public}@", (uint8_t *)&v11, 0xCu);
    }
    id v8 = sub_1000A8424();
    sub_1000A9420(v8);
  }
  else if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138543362;
    id v12 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Dirty exit with reason: %{public}@", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v9 = [(PDDaemon *)self operationsManager];
  sub_10010EB4C(v9);

  [(PDBiomeClient *)self->_biomeClient cancelSubscription];
  dispatch_source_t v10 = +[NSNotificationCenter defaultCenter];
  [v10 removeObserver:self name:NSCurrentLocaleDidChangeNotification object:0];

  if (!v4) {
    exit(0);
  }
  xpc_transaction_exit_clean();
}

- (void)terminateClean:(BOOL)a3 reason:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CC108;
  block[3] = &unk_1001F2D50;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(queue, block);
}

- (void)invalidateServer:(id)a3
{
  id v4 = a3;
  [v4 invalidate];
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CC40C;
  block[3] = &unk_1001F26E8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)handleAccountChange
{
  CLSInitLog();
  id v3 = CLSLogDefault;
  if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Handling AppleAccount change notification.", buf, 2u);
  }
  id v4 = +[PDUserDefaults sharedDefaults];
  unsigned int v5 = [v4 enableVerboseLogging];

  if (v5) {
    CLSLogDebugCurrentPersona();
  }
  database = self->_database;
  if (database) {
    sub_1000DB49C(database, 0);
  }
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  *(void *)buf = 0;
  unsigned __int8 v26 = buf;
  uint64_t v27 = 0x3032000000;
  v28 = sub_10000B704;
  char v29 = sub_10000B59C;
  id v30 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_10000B704;
  v23[4] = sub_10000B59C;
  id v24 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000CC980;
  v22[3] = &unk_1001F42B8;
  v22[4] = &v35;
  v22[5] = &v31;
  v22[6] = buf;
  v22[7] = v23;
  sub_100042308((uint64_t)PDAccountInfo, v22);
  if (*((unsigned char *)v36 + 24))
  {
    CLSInitLog();
    dispatch_source_t v7 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "User DSID changed; re-initializing subsystems.",
        v21,
        2u);
    }
    [(PDDaemon *)self lock];
    [(PDDaemon *)self _invalidateAndDeleteManagers];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = self->_servers;
    id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v17 objects:v39 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v18;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "invalidate", (void)v17);
        }
        id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v17 objects:v39 count:16];
      }
      while (v9);
    }

    id v12 = self->_servers;
    [(NSMutableSet *)v12 removeAllObjects];

    self->_systemsInitialized = 0;
    [(PDDaemon *)self _initializeSubsystemsIfNeeded];
    [(PDDaemon *)self unlock];
    CLSInitLog();
    id v14 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Posting notification 'CLSAccountChangedDarwinNotificationName'", v21, 2u);
    }
    +[CLSUtil postNotification:](CLSUtil, "postNotification:", "com.apple.progressd.accountChanged", (void)v17);
  }
  else
  {
    CLSInitLog();
    id v15 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "User DSID did not change; subsystem not re-initialized.",
        v21,
        2u);
    }
    if (*((unsigned char *)v32 + 24))
    {
      CLSInitLog();
      id v16 = CLSLogDefault;
      if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v21 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Authentication state changed, posting notification 'CLSAccountChangedDarwinNotificationName'", v21, 2u);
      }
      +[CLSUtil postNotification:"com.apple.progressd.accountChanged"];
      sub_100003784(self->_operationsManager, 0);
    }
    [(PDDaemon *)self _setSettingsVisibilityFlagMacOS];
  }
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
}

- (BOOL)canEnableNoUserMode
{
  if (sub_1000A5C14()) {
    return 1;
  }

  return sub_1000A5D90();
}

- (void)_updateBiomeClientWithDatabase:(id)a3
{
  id v4 = a3;
  unsigned int v5 = dispatch_get_global_queue(33, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000CCEE0;
  v7[3] = &unk_1001F2710;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_reinitializeManagers
{
  [(PDDaemon *)self _cleanupSavedResponseDirectory];
  BOOL v3 = sub_1000CCDD4(self);
  unsigned int v4 = [(PDDaemon *)self canEnableNoUserMode];
  unsigned int v5 = +[PDUserDefaults sharedDefaults];
  unsigned int v6 = [v5 enableVerboseLogging];

  if (v6)
  {
    CLSInitLog();
    dispatch_source_t v7 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      if ((v4 & v3) != 0) {
        CFStringRef v8 = @"no user";
      }
      else {
        CFStringRef v8 = @"normal";
      }
      int v24 = 138412290;
      CFStringRef v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Reinitializing daemon (%@ mode).", (uint8_t *)&v24, 0xCu);
    }
  }
  [(PDUserNotificationManager *)self->_userNotificationManager invalidate];
  id v9 = (PDOperationsManager *)sub_10010ECC8((id *)[PDOperationsManager alloc], self->_database);
  operationsManager = self->_operationsManager;
  self->_operationsManager = v9;

  sub_10010F090(self->_operationsManager, self->_queue);
  BOOL v11 = [(PDDaemon *)self database];
  sub_1000E5BD0(v11);

  if (!v3)
  {
    if (!sub_100051044(self->_database) || !sub_1000510B8(self->_database))
    {
      initial_sync_transaction = self->_initial_sync_transaction;
      if (initial_sync_transaction) {
        sub_100005114(initial_sync_transaction);
      }
      id v13 = +[NSNotificationCenter defaultCenter];
      [v13 addObserver:self selector:"serverInitialSyncStatusDidChange:" name:CLSInitialServerSyncCompleteNotificationName object:0];

      sub_1000057A0(@"Initial Server Sync");
      id v14 = (OS_os_transaction *)objc_claimAutoreleasedReturnValue();
      id v15 = self->_initial_sync_transaction;
      self->_initial_sync_transaction = v14;
    }
    id v16 = [[PDUserNotificationManager alloc] initWithDatabase:self->_database];
    userNotificationManager = self->_userNotificationManager;
    self->_userNotificationManager = v16;

    [(PDUserNotificationManager *)self->_userNotificationManager registerForNotifications];
    unsigned int v18 = [(PDDaemon *)self mode];
    if (v18 == 2)
    {
      uint64_t v19 = [(PDDaemon *)self teacherDevDatabase];
    }
    else if (v18 == 1)
    {
      uint64_t v19 = [(PDDaemon *)self studentDevDatabase];
    }
    else
    {
      if (v18)
      {
        long long v20 = 0;
LABEL_21:
        id v21 = sub_1000064B8(self, v20);

        unsigned int v22 = [v21 isStudent];
        if (v22) {
          [(PDDaemon *)self _updateBiomeClientWithDatabase:self->_database];
        }
        goto LABEL_23;
      }
      uint64_t v19 = [(PDDaemon *)self database];
    }
    long long v20 = (void *)v19;
    goto LABEL_21;
  }
LABEL_23:
  id v23 = sub_1000062FC();
  sub_1000D1AFC((uint64_t)PDFileManager, v23);
}

- (void)_cleanupSavedResponseDirectory
{
  v2 = +[NSFileManager defaultManager];
  BOOL v3 = sub_1000D0CEC();
  unsigned int v4 = sub_1000D13D4((uint64_t)v3);
  id v8 = 0;
  unsigned __int8 v5 = [v2 removeItemAtURL:v4 error:&v8];
  id v6 = v8;

  if ((v5 & 1) == 0)
  {
    CLSInitLog();
    dispatch_source_t v7 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to cleanup response file directory. Error %@", buf, 0xCu);
    }
  }
}

- (void)_invalidateAndDeleteManagers
{
  sub_10010EB1C();
  userNotificationManager = self->_userNotificationManager;
  if (userNotificationManager)
  {
    [(PDUserNotificationManager *)userNotificationManager invalidate];
    unsigned int v4 = self->_userNotificationManager;
    self->_userNotificationManager = 0;
  }
  operationsManager = self->_operationsManager;
  if (operationsManager)
  {
    sub_10010EB4C(operationsManager);
    id v6 = self->_operationsManager;
    self->_operationsManager = 0;
  }
}

- (void)registerDashboardAppIfNeeded:(id)a3
{
  id v4 = a3;
  if (sub_10013C284(self->_database, v4))
  {
    CLSInitLog();
    unsigned __int8 v5 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Queue register operation for dashboard app: %@.", (uint8_t *)&v8, 0xCu);
    }
    id v6 = [(PDURLRequestOperation *)[PDDashboardAppRegisterOperation alloc] initWithDatabase:self->_database];
    dispatch_source_t v7 = [(PDDaemon *)self operationsManager];
    sub_100111240(v7, v6);
  }
}

- (id)_databaseInstance
{
  v2 = sub_1000D0CEC();
  BOOL v3 = sub_1000D12A8((uint64_t)v2);

  id v4 = sub_1000FA6B4([PDDatabase alloc], v3);

  return v4;
}

- (PDDatabase)teacherDevDatabase
{
  teacherDevDatabase = self->_teacherDevDatabase;
  if (!teacherDevDatabase)
  {
    id v4 = sub_1000D0CEC();
    unsigned __int8 v5 = sub_1000D130C((uint64_t)v4);

    id v6 = (PDDatabase *)sub_1000FA6B4([PDDatabase alloc], v5);
    dispatch_source_t v7 = self->_teacherDevDatabase;
    self->_teacherDevDatabase = v6;

    if ((sub_1000FABCC(self->_teacherDevDatabase) & 1) == 0)
    {
      int v8 = self->_teacherDevDatabase;
      self->_teacherDevDatabase = 0;
    }
    teacherDevDatabase = self->_teacherDevDatabase;
  }

  return teacherDevDatabase;
}

- (PDDatabase)studentDevDatabase
{
  studentDevDatabase = self->_studentDevDatabase;
  if (!studentDevDatabase)
  {
    id v4 = sub_1000D0CEC();
    unsigned __int8 v5 = sub_1000D1370((uint64_t)v4);

    id v6 = (PDDatabase *)sub_1000FA6B4([PDDatabase alloc], v5);
    dispatch_source_t v7 = self->_studentDevDatabase;
    self->_studentDevDatabase = v6;

    if ((sub_1000FABCC(self->_studentDevDatabase) & 1) == 0)
    {
      int v8 = self->_studentDevDatabase;
      self->_studentDevDatabase = 0;
    }
    studentDevDatabase = self->_studentDevDatabase;
  }

  return studentDevDatabase;
}

- (id)statusReportCurrentUser
{
  uint64_t v3 = sub_1000062FC();
  id v4 = [(PDDaemon *)self database];
  unsigned __int8 v5 = sub_100003E58(v4);
  id v6 = sub_100004B84(v4);
  sub_100002F10(v4);
  v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v3) {
    unsigned int v7 = objc_msgSend(*(id *)(v3 + 24), "aa_isManagedAppleID");
  }
  else {
    unsigned int v7 = 0;
  }
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = sub_10000B704;
  v54 = sub_10000B59C;
  id v55 = (id)objc_opt_new();
  if (v5)
  {
    uint64_t v8 = objc_opt_class();
    id v9 = [v5 objectID];
    v79 = v9;
    id v10 = +[NSArray arrayWithObjects:&v79 count:1];
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_1000CDC70;
    v47[3] = &unk_1001F42E0;
    id v48 = v4;
    v49 = &v50;
    [v48 selectAll:v8 where:@"personID = ?" bindings:v10 block:v47];

    v60[0] = @"orgID";
    objc_super v45 = [v5 orgID];
    CFStringRef v11 = v45;
    CFStringRef v12 = v46;
    if (!v45) {
      CFStringRef v11 = &stru_1001F6580;
    }
    if (!v46) {
      CFStringRef v12 = &stru_1001F6580;
    }
    v69[0] = v11;
    v69[1] = v12;
    v60[1] = @"organizationName";
    v60[2] = @"objectID";
    v44 = [v5 objectID];
    CFStringRef v13 = v44;
    if (!v44) {
      CFStringRef v13 = &stru_1001F6580;
    }
    v69[2] = v13;
    v60[3] = @"name";
    id v43 = [v5 displayName];
    CFStringRef v14 = v43;
    if (!v43) {
      CFStringRef v14 = &stru_1001F6580;
    }
    v69[3] = v14;
    v60[4] = @"progressTrackingAllowed";
    if ([v5 isProgressTrackingAllowed]) {
      CFStringRef v15 = @"YES";
    }
    else {
      CFStringRef v15 = @"NO";
    }
    if (v7) {
      CFStringRef v16 = @"YES";
    }
    else {
      CFStringRef v16 = @"NO";
    }
    v69[4] = v15;
    v69[5] = v16;
    v60[5] = @"hasManagedAccount";
    v60[6] = @"isSearchable";
    if ([v5 isSearchable]) {
      CFStringRef v17 = @"YES";
    }
    else {
      CFStringRef v17 = @"NO";
    }
    v69[6] = v17;
    v60[7] = @"role (orion)";
    uint64_t v41 = +[CLSPerson stringForRole:v6];
    v69[7] = v41;
    v60[8] = @"roles (asm)";
    CFStringRef v18 = (const __CFString *)v51[5];
    if (!v18) {
      CFStringRef v18 = &stru_1001F6580;
    }
    v69[8] = v18;
    v60[9] = @"data-separated";
    if (v3)
    {
      if (*(unsigned char *)(v3 + 8)) {
        CFStringRef v19 = @"YES";
      }
      else {
        CFStringRef v19 = @"NO";
      }
      CFStringRef v70 = v19;
      CFStringRef v61 = @"openFromManagedToUnmanaged";
      if (*(unsigned char *)(v3 + 10)) {
        CFStringRef v20 = @"YES";
      }
      else {
        CFStringRef v20 = @"NO";
      }
      CFStringRef v71 = v20;
      CFStringRef v62 = @"openFromUnmanagedToManaged";
      if (*(unsigned char *)(v3 + 11)) {
        CFStringRef v21 = @"YES";
      }
      else {
        CFStringRef v21 = @"NO";
      }
      CFStringRef v72 = v21;
      CFStringRef v63 = @"hasUbiquityEnabled";
      if (*(unsigned char *)(v3 + 9)) {
        CFStringRef v22 = @"YES";
      }
      else {
        CFStringRef v22 = @"NO";
      }
      CFStringRef v73 = v22;
      CFStringRef v64 = @"rosterServiceAuthenticationState";
    }
    else
    {
      CFStringRef v70 = @"NO";
      CFStringRef v71 = @"NO";
      CFStringRef v61 = @"openFromManagedToUnmanaged";
      CFStringRef v62 = @"openFromUnmanagedToManaged";
      CFStringRef v72 = @"NO";
      CFStringRef v73 = @"NO";
      CFStringRef v63 = @"hasUbiquityEnabled";
      CFStringRef v64 = @"rosterServiceAuthenticationState";
    }
    id v23 = NSStringFromCLSAuthenticationState();
    v74 = v23;
    CFStringRef v65 = @"handoutServiceAuthenticationState";
    int v24 = NSStringFromCLSAuthenticationState();
    v75 = v24;
    CFStringRef v66 = @"iCloudDriveAuthenticationState";
    CFStringRef v25 = NSStringFromCLSAuthenticationState();
    v76 = v25;
    CFStringRef v67 = @"schoolworkUbiquitousContainerURL";
    if (v3) {
      unsigned __int8 v26 = *(void **)(v3 + 80);
    }
    else {
      unsigned __int8 v26 = 0;
    }
    id v27 = v26;
    uint64_t v28 = [v27 absoluteString];
    char v29 = (void *)v28;
    if (v28) {
      CFStringRef v30 = (const __CFString *)v28;
    }
    else {
      CFStringRef v30 = &stru_1001F6580;
    }
    CFStringRef v77 = v30;
    CFStringRef v68 = @"schoolworkUbiquitousContainerError";
    if (v3) {
      uint64_t v31 = *(void **)(v3 + 88);
    }
    else {
      uint64_t v31 = 0;
    }
    CFStringRef v32 = v31;
    uint64_t v33 = (__CFString *)v32;
    if (v32) {
      CFStringRef v34 = v32;
    }
    else {
      CFStringRef v34 = &stru_1001F6580;
    }
    CFStringRef v78 = v34;
    uint64_t v35 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v69, v60, 18, v41);
  }
  else
  {
    BOOL v36 = sub_1000CCDD4(self);
    CFStringRef v37 = @"NO";
    if (v7) {
      CFStringRef v37 = @"YES";
    }
    if (v36)
    {
      CFStringRef v58 = @"none";
      CFStringRef v59 = @"(No User Mode)";
      char v38 = &v58;
      uint64_t v39 = &v59;
    }
    else
    {
      CFStringRef v56 = @"none";
      CFStringRef v57 = &stru_1001F6580;
      char v38 = &v56;
      uint64_t v39 = &v57;
    }
    v38[1] = @"hasManagedAccount";
    v39[1] = v37;
    uint64_t v35 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:");
  }
  _Block_object_dispose(&v50, 8);

  return v35;
}

- (id)miniStatusReport
{
  uint64_t v3 = objc_opt_new();
  id v4 = [(PDDaemon *)self statusReportCurrentUser];
  [v3 setObject:v4 forKeyedSubscript:@"current user"];

  unsigned __int8 v5 = +[PDUserDefaults sharedDefaults];
  id v6 = [v5 dictionaryRepresentation];
  [v3 setObject:v6 forKeyedSubscript:@"userDefaults"];

  return v3;
}

- (NSDictionary)statusReport
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = sub_1000062FC();
  CFStringRef v63 = (void *)v4;
  if (v4)
  {
    id v5 = *(id *)(v4 + 48);
    if (v5) {
      [v3 setObject:v5 forKeyedSubscript:@"GSTokenSchoolwork"];
    }
    id v6 = (void *)v63[7];
  }
  else
  {
    id v5 = 0;
    id v6 = 0;
  }
  id v7 = v6;

  if (v7) {
    [v3 setObject:v7 forKeyedSubscript:@"GSTokenAXM"];
  }
  CFStringRef v57 = v7;
  uint64_t v8 = v63;
  if (v63) {
    uint64_t v8 = (void *)v63[3];
  }
  id v9 = v8;

  if (v9)
  {
    uint64_t v78 = 0;
    v79 = &v78;
    uint64_t v80 = 0x3032000000;
    v81 = sub_10000B704;
    v82 = sub_10000B59C;
    id v83 = 0;
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = sub_1000CE874;
    v75[3] = &unk_1001F4328;
    CFStringRef v77 = &v78;
    dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &stru_1001F4300);
    id v76 = v10;
    sub_100043E7C((uint64_t)PDAccountInfo, v75);
    dispatch_time_t v11 = dispatch_time(0, 60000000000);
    if (dispatch_block_wait(v10, v11))
    {
      CLSInitLog();
      CFStringRef v12 = CLSLogDefault;
      if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Timed out when getting iCloud quota info!", buf, 2u);
      }
    }
    uint64_t v13 = v79[5];
    if (v13) {
      [v3 setObject:v13 forKeyedSubscript:@"iCloud Quota Info"];
    }

    _Block_object_dispose(&v78, 8);
  }
  CFStringRef v14 = +[NSBundle mainBundle];
  CFStringRef v62 = [v14 infoDictionary];

  CFStringRef v15 = [v62 objectForKeyedSubscript:@"CFBundleShortVersionString"];
  CFStringRef v16 = [v62 objectForKeyedSubscript:@"CFBundleVersion"];
  CFStringRef v17 = +[NSString stringWithFormat:@"%@ (%@)", v15, v16];
  [v3 setObject:v17 forKeyedSubscript:@"version"];

  CFStringRef v18 = NSStringFromDevMode();
  [v3 setObject:v18 forKeyedSubscript:@"Dev Mode"];

  CFStringRef v19 = [(PDDaemon *)self database];
  CFStringRef v20 = [(PDDaemon *)self statusReportCurrentUser];
  [v3 setObject:v20 forKeyedSubscript:@"current user"];

  CFStringRef v21 = sub_100005B44(v19);
  CFStringRef v22 = [v21 dictionaryRepresentation];
  [v3 setObject:v22 forKeyedSubscript:@"service config (orion)"];

  id v23 = sub_100003A74(v19);
  int v24 = [v23 dictionaryRepresentation];
  [v3 setObject:v24 forKeyedSubscript:@"service config (asm)"];

  CFStringRef v25 = objc_opt_new();
  uint64_t v26 = objc_opt_class();
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_1000CEA08;
  v72[3] = &unk_1001F4350;
  id v60 = v25;
  id v73 = v60;
  [v19 selectAll:v26 block:v72];
  [v3 setObject:v60 forKeyedSubscript:@"blocked apps"];
  id v27 = objc_opt_new();
  [(PDDaemon *)self lock];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v28 = self->_servers;
  id v29 = [(NSMutableSet *)v28 countByEnumeratingWithState:&v68 objects:v86 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v69;
    do
    {
      for (i = 0; i != v29; i = (char *)i + 1)
      {
        if (*(void *)v69 != v30) {
          objc_enumerationMutation(v28);
        }
        CFStringRef v32 = [*(id *)(*((void *)&v68 + 1) + 8 * i) statusReport];
        [v27 addObject:v32];
      }
      id v29 = [(NSMutableSet *)v28 countByEnumeratingWithState:&v68 objects:v86 count:16];
    }
    while (v29);
  }

  [(PDDaemon *)self unlock];
  id v59 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%ld connected clients", objc_msgSend(v27, "count"));
  [v3 setObject:v27 forKeyedSubscript:v59];
  uint64_t v33 = +[PDUserDefaults sharedDefaults];
  CFStringRef v34 = [v33 dictionaryRepresentation];
  [v3 setObject:v34 forKeyedSubscript:@"userDefaults"];

  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_1000CEA68;
  v66[3] = &unk_1001F4378;
  id v58 = (id)objc_opt_new();
  id v67 = v58;
  CFStringRef v61 = objc_retainBlock(v66);
  [v19 selectAll:objc_opt_class() block:v61];
  [v19 selectAll:objc_opt_class() block:v61];
  [v3 setObject:v58 forKeyedSubscript:@"Pending sync items"];
  uint64_t v35 = [(PDDaemon *)self operationsManager];
  BOOL v36 = sub_100113994(v35);
  [v3 setObject:v36 forKeyedSubscript:@"Operations report"];

  CFStringRef v37 = objc_opt_new();
  uint64_t v38 = objc_opt_class();
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_1000CEADC;
  v64[3] = &unk_1001F43A0;
  id v39 = v37;
  id v65 = v39;
  [v19 selectAll:v38 block:v64];
  [v3 setObject:v39 forKeyedSubscript:@"endpoints"];
  uint64_t v40 = objc_opt_new();
  uint64_t v41 = +[PDURLRequestOperation setAppleInternalHeadersForRequest:v40];
  if (!v41)
  {
    id v42 = [v40 allHTTPHeaderFields];
    [v3 setObject:v42 forKeyedSubscript:@"anisetteHeader"];
  }
  id v43 = [(PDDaemon *)self operationsManager];
  unsigned int v44 = sub_1001132C4(v43);
  objc_super v45 = @"opportunistic";
  if (v44) {
    objc_super v45 = @"enabled";
  }
  v46 = v45;

  [v3 setObject:v46 forKeyedSubscript:@"Push Type"];
  v47 = +[PDUserDefaults sharedDefaults];
  id v48 = [v47 dictionaryRepresentation];
  [v3 setObject:v48 forKeyedSubscript:@"userDefaults"];

  v84[0] = @"ASM sync";
  if (sub_100051044(v19)) {
    CFStringRef v49 = @"YES";
  }
  else {
    CFStringRef v49 = @"NO";
  }
  v85[0] = v49;
  v84[1] = @"Orion sync";
  if (sub_1000510B8(v19)) {
    CFStringRef v50 = @"YES";
  }
  else {
    CFStringRef v50 = @"NO";
  }
  v85[1] = v50;
  v84[2] = @"iCloud Drive initial sync";
  if (sub_10005112C(v19)) {
    CFStringRef v51 = @"YES";
  }
  else {
    CFStringRef v51 = @"NO";
  }
  v85[2] = v51;
  uint64_t v52 = +[NSDictionary dictionaryWithObjects:v85 forKeys:v84 count:3];
  [v3 setObject:v52 forKeyedSubscript:@"Server sync status"];
  v53 = sub_1001262E0();
  if ([v53 count]) {
    [v3 setObject:v53 forKeyedSubscript:@"Cached PDFileSyncAgent Info"];
  }
  v54 = (char *)[(PDBiomeClient *)self->_biomeClient biomeSubscriptionStatus] - 1;
  if ((unint64_t)v54 > 2) {
    CFStringRef v55 = @"Unknown";
  }
  else {
    CFStringRef v55 = *(&off_1001F43C0 + (void)v54);
  }
  [v3 setObject:v55 forKeyedSubscript:@"biomeSubscriptionStatus"];

  return (NSDictionary *)v3;
}

- (void)recreateDevelopmentDatabases
{
  CLSInitLog();
  uint64_t v3 = CLSLogDatabase;
  if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v6 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "recreating dev databases", v6, 2u);
  }
  uint64_t v4 = [(PDDaemon *)self teacherDevDatabase];
  sub_1000FA9CC(v4);

  id v5 = [(PDDaemon *)self studentDevDatabase];
  sub_1000FA9CC(v5);
}

- (void)recreateDatabase
{
}

- (void)recreateDatabaseAndReinitialize:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[PDUserDefaults sharedDefaults];
  [v5 resetUserDefaultsIfAllowed];

  CLSInitLog();
  id v6 = CLSLogDatabase;
  if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "recreating database", v7, 2u);
  }
  sub_1000FA9CC(self->_database);
  if (v3)
  {
    [(PDDaemon *)self _invalidateAndDeleteManagers];
    [(PDDaemon *)self _reinitializeManagers];
  }
}

- (void)terminateCleanAfterRecreatingDatabase:(BOOL)a3
{
  if (a3) {
    [(PDDaemon *)self recreateDatabaseAndReinitialize:0];
  }
  uint64_t v4 = dispatch_get_global_queue(33, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CED38;
  block[3] = &unk_1001F2A68;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (PDOperationsManager)operationsManager
{
  return self->_operationsManager;
}

- (void)setOperationsManager:(id)a3
{
}

- (void)setTeacherDevDatabase:(id)a3
{
}

- (void)setStudentDevDatabase:(id)a3
{
}

- (PDUserNotificationManager)userNotificationManager
{
  return self->_userNotificationManager;
}

- (unint64_t)memoryPressureStatus
{
  return self->_memoryPressureStatus;
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideEntitlementsDictionary, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_userNotificationManager, 0);
  objc_storeStrong((id *)&self->_studentDevDatabase, 0);
  objc_storeStrong((id *)&self->_teacherDevDatabase, 0);
  objc_storeStrong((id *)&self->_operationsManager, 0);
  objc_storeStrong((id *)&self->_biomeClient, 0);
  objc_storeStrong((id *)&self->_initial_sync_transaction, 0);
  objc_storeStrong((id *)&self->_servers, 0);

  objc_storeStrong((id *)&self->_database, 0);
}

@end