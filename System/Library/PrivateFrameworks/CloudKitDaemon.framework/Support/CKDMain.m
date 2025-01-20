@interface CKDMain
+ (id)sharedMain;
- (BOOL)canRunGivenAvailabilityState:(unint64_t)a3;
- (BOOL)systemAvailabilityChanged:(unint64_t)a3;
- (BOOL)upAndRunning;
- (CKDMain)init;
- (_TtC6cloudd13CKDMain_Swift)swiftMain;
- (void)_setupDistnotedEventHandler;
- (void)_setupNotifydEventHandler;
- (void)_setupTCCEventHandler;
- (void)setSwiftMain:(id)a3;
- (void)setUpAndRunning:(BOOL)a3;
- (void)uploadContent;
@end

@implementation CKDMain

+ (id)sharedMain
{
  if (qword_100019220 != -1) {
    dispatch_once(&qword_100019220, &stru_100014E18);
  }
  v2 = (void *)qword_100019218;
  return v2;
}

- (CKDMain)init
{
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v3 = ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "Wed Dec 31 16:00:00 1969";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CloudKit daemon binary was built at %s", buf, 0xCu);
  }
  v9.receiver = self;
  v9.super_class = (Class)CKDMain;
  v4 = [(CKDMain *)&v9 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    swiftMain = v4->_swiftMain;
    v4->_swiftMain = (_TtC6cloudd13CKDMain_Swift *)v5;

    v7 = +[CKDSystemAvailabilityMonitor sharedMonitor];
    [v7 registerWatcher:v4];

    +[CKDBackingAccount registerDeviceCountRefreshActivity];
  }
  return v4;
}

- (void)_setupNotifydEventHandler
{
  id v4 = +[CKDDaemonProcess currentProcess];
  if ([v4 isSystemInstalledBinary])
  {
    v2 = +[CKDDaemonProcess currentProcess];
    id v3 = [v2 processType];

    if (v3 != (id)2)
    {
      xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100014E58);
    }
  }
  else
  {
  }
}

- (void)_setupDistnotedEventHandler
{
}

- (void)_setupTCCEventHandler
{
  v2 = +[CKDDaemonProcess currentProcess];
  id v3 = [v2 processType];

  if (v3 != (id)1)
  {
    id v4 = +[CKDAuthorizationObserver defaultObserver];
    [v4 registerWithBlock:&stru_100014EF8];
  }
}

- (BOOL)canRunGivenAvailabilityState:(unint64_t)a3
{
  return (a3 >> 1) & 1;
}

- (BOOL)systemAvailabilityChanged:(unint64_t)a3
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v78 = _os_activity_create((void *)&_mh_execute_header, "systemAvailabilityChanged", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v78, &state);
  BOOL v5 = [(CKDMain *)self canRunGivenAvailabilityState:a3];
  unint64_t v79 = a3;
  v6 = self;
  objc_sync_enter(v6);
  unsigned int v7 = [(CKDMain *)v6 upAndRunning];
  [(CKDMain *)v6 setUpAndRunning:v5];
  objc_sync_exit(v6);
  v80 = v6;

  if (!(v5 & ~v7)) {
    goto LABEL_54;
  }
  if (v6)
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v10 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v104 = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Begin cleaning up background tasks", v104, 2u);
    }
    *(void *)v105 = _NSConcreteStackBlock;
    uint64_t v106 = 3221225472;
    v107 = sub_10000D820;
    v108 = &unk_100014F48;
    dispatch_semaphore_t v109 = v9;
    v11 = v9;
    +[NSURLSession _getActiveSessionIdentifiersWithCompletionHandler:v105];
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);

    v12 = +[CKDDaemonProcess currentProcess];
    if ([v12 isSystemInstalledBinary])
    {
      v13 = +[CKDDaemonProcess currentProcess];
      BOOL v14 = [v13 processType] == (id)2;

      if (!v14)
      {
        v77 = CKGetCacheDir();
        +[CKDPackageDirectoryPurger schedulePeriodicPurgesInDirectory:v77];
        v15 = +[CKDLogicalDeviceContext defaultContext];
        v16 = [v15 metadataCache];
        v17 = [v16 knownContainerizedApplicationIDs];

        v18 = +[NSMutableSet set];
        long long v97 = 0u;
        long long v98 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        id obj = v17;
        id v19 = [obj countByEnumeratingWithState:&v95 objects:v105 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v96;
          do
          {
            for (i = 0; i != v19; i = (char *)i + 1)
            {
              if (*(void *)v96 != v20) {
                objc_enumerationMutation(obj);
              }
              uint64_t v22 = *(void *)(*((void *)&v95 + 1) + 8 * i);
              v23 = +[CKDLogicalDeviceContext defaultContext];
              v24 = [v23 metadataCache];
              v25 = [v24 applicationMetadataForApplicationID:v22];

              if (v25)
              {
                v26 = [v25 applicationContainerPath];
                v27 = [v26 stringByAppendingPathComponent:@"Library/Caches/CloudKit"];
                [v18 addObject:v27];
              }
            }
            id v19 = [obj countByEnumeratingWithState:&v95 objects:v105 count:16];
          }
          while (v19);
        }

        long long v93 = 0u;
        long long v94 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        id v28 = v18;
        id v29 = [v28 countByEnumeratingWithState:&v91 objects:v104 count:16];
        if (v29)
        {
          uint64_t v30 = *(void *)v92;
          do
          {
            for (j = 0; j != v29; j = (char *)j + 1)
            {
              if (*(void *)v92 != v30) {
                objc_enumerationMutation(v28);
              }
              +[CKDPackageDirectoryPurger schedulePeriodicPurgesInDirectory:*(void *)(*((void *)&v91 + 1) + 8 * (void)j)];
            }
            id v29 = [v28 countByEnumeratingWithState:&v91 objects:v104 count:16];
          }
          while (v29);
        }

        v32 = +[NSURL fileURLWithPath:v77];
        v33 = [v32 URLByAppendingPathComponent:@"tmp"];

        if (v33)
        {
          v34 = [v33 lastPathComponent];
          if (ck_log_initialization_predicate != -1) {
            dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
          }
          v35 = (void *)ck_log_facility_ck;
          if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
          {
            v36 = v35;
            v37 = [v33 CKSanitizedPath];
            *(_DWORD *)buf = 138412546;
            v101 = v34;
            __int16 v102 = 2112;
            v103 = v37;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Purging %@ directory at %@", buf, 0x16u);
          }
          +[CKDirectoryPurger purgeDirectoryAtURL:v33];
        }
        v38 = +[CKDLogicalDeviceContext defaultContext];
        v39 = [v38 metadataCache];
        unsigned int v40 = [v39 hasMigrated];

        if (v77) {
          unsigned int v41 = v40;
        }
        else {
          unsigned int v41 = 0;
        }
        if (v41 == 1)
        {
          v42 = +[CKDMetadataCache dbFileName];
          v43 = +[CKDOperationInfoCache dbFileName];
          v44 = +[CKDDirectoryContext daemonDatabaseDirectoryName];
          if (ck_log_initialization_predicate != -1) {
            dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
          }
          v45 = (void *)ck_log_facility_ck;
          if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
          {
            v46 = v45;
            v47 = [v42 CKSanitizedPath];
            v48 = [v77 CKSanitizedPath];
            *(_DWORD *)buf = 138412546;
            v101 = v47;
            __int16 v102 = 2112;
            v103 = v48;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "Migrated %@ db, now purging the cache directory at %@", buf, 0x16u);
          }
          v49 = +[NSURL fileURLWithPath:v77 isDirectory:1];
          id v50 = objc_alloc((Class)CKDirectoryPurger);
          v99 = v49;
          v51 = +[NSArray arrayWithObjects:&v99 count:1];
          id v52 = [v50 initWithDirectoryURLs:v51];

          v87[0] = _NSConcreteStackBlock;
          v87[1] = 3221225472;
          v87[2] = sub_10000DB44;
          v87[3] = &unk_100014F70;
          id v88 = v42;
          id v89 = v43;
          id v90 = v44;
          id v53 = v44;
          id v54 = v43;
          id v55 = v42;
          [v52 setShouldSkipFileBlock:v87];
          [v52 setShouldRemoveFileBlock:&stru_100014FB0];
          [v52 purge];
        }
      }
    }
    else
    {
    }
  }
  [(CKDMain *)v80 _setupNotifydEventHandler];
  [(CKDMain *)v80 _setupDistnotedEventHandler];
  [(CKDMain *)v80 _setupTCCEventHandler];
  id v56 = +[CKDDaemonProcess currentProcess];
  if ([v56 isSystemInstalledBinary])
  {
    v57 = +[CKDDaemonProcess currentProcess];
    BOOL v58 = [v57 processType] == (id)2;

    if (v58) {
      goto LABEL_46;
    }
    v59 = +[CKDLogicalDeviceContext defaultContext];
    v60 = [v59 tokenRegistrationScheduler];
    [v60 registerTokenRefreshActivity];

    v61 = +[CKDLogicalDeviceContext defaultContext];
    v62 = [v61 metadataCache];

    v84[0] = _NSConcreteStackBlock;
    v84[1] = 3221225472;
    v84[2] = sub_10000E79C;
    v84[3] = &unk_100014FD8;
    id v56 = v62;
    id v85 = v56;
    v63 = objc_retainBlock(v84);
    v64 = +[CKDAccountNotifier sharedNotifier];
    [v64 registerObserver:v56 forAccountChangeNotification:v63];

    ((void (*)(void *, void, void))v63[2])(v63, 0, 0);
    [v56 expungeStaleAccountIDs];
    v65 = +[CKDLogicalDeviceContext defaultContext];
    v66 = [v65 operationInfoCache];

    [v66 registerCacheEvictionActivity];
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472;
    v82[2] = sub_10000E7B4;
    v82[3] = &unk_100014FD8;
    id v67 = v66;
    id v83 = v67;
    v68 = objc_retainBlock(v82);
    v69 = +[CKDAccountNotifier sharedNotifier];
    [v69 registerObserver:v67 forAccountChangeNotification:v68];

    ((void (*)(void *, void, uint64_t))v68[2])(v68, 0, 1);
  }

LABEL_46:
  v70 = +[CKDDaemonProcess currentProcess];
  if ([v70 isSystemInstalledBinary])
  {
    v71 = +[CKDDaemonProcess currentProcess];
    BOOL v72 = [v71 processType] == (id)2;

    if (!v72)
    {
      if (CKIsRunningInSyncBubble())
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        v73 = ck_log_facility_ck;
        if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v105 = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEBUG, "We're in a sync bubble. Waiting to be asked to upload content before kicking off pending long lived operations", v105, 2u);
        }
      }
      else
      {
        v76 = +[CKDProcessScopedStateManager sharedManager];
        [v76 kickOffPendingLongLivedOperations];
      }
    }
  }
  else
  {
  }
LABEL_54:
  if (v79 == 3)
  {
    v74 = [(CKDMain *)v80 swiftMain];
    [v74 markSystemAvailableForCacheDelete];
  }
  os_activity_scope_leave(&state);

  return 1;
}

- (void)uploadContent
{
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v2 = ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Requested to upload content. Kicking off unfinished long-lived operations", v4, 2u);
  }
  id v3 = +[CKDProcessScopedStateManager sharedManager];
  [v3 kickOffPendingLongLivedOperations];
}

- (_TtC6cloudd13CKDMain_Swift)swiftMain
{
  return self->_swiftMain;
}

- (void)setSwiftMain:(id)a3
{
}

- (BOOL)upAndRunning
{
  return self->_upAndRunning;
}

- (void)setUpAndRunning:(BOOL)a3
{
  self->_upAndRunning = a3;
}

- (void).cxx_destruct
{
}

@end