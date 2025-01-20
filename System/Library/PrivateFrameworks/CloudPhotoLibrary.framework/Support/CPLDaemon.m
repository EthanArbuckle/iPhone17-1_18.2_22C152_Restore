@interface CPLDaemon
- (BOOL)_processListener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)allowsConfigurationRefreshForWrapperArray:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)allowedProtocolForClientAccess:(id)a3;
- (id)daemonLibraryManager:(id)a3 engineWrapperWithClientLibraryBaseURL:(id)a4 cloudLibraryStateStorageURL:(id)a5 cloudLibraryResourceStorageURL:(id)a6 libraryIdentifier:(id)a7 mainScopeIdentifier:(id)a8 options:(unint64_t)a9 error:(id *)a10;
- (id)daemonLibraryManagerOtherLibraryManager:(id)a3 withLibraryIdentifier:(id)a4;
- (id)initForSyncBubble:(BOOL)a3 forceClientPush:(BOOL)a4;
- (id)wrapperArray:(id)a3 engineWrapperWithParameters:(id)a4 createIfNecessary:(BOOL)a5 queue:(id)a6 error:(id *)a7;
- (unint64_t)wrapperArray:(id)a3 countOfClientsForWrapper:(id)a4;
- (void)_daemonLibraryManagerWantsToExitNow:(id)a3;
- (void)_deactivateDaemon;
- (void)_performAfterRegistrations:(id)a3;
- (void)_performOnceDeviceIsUnlocked:(id)a3;
- (void)_performPendingBlockAfterFirstUnlock;
- (void)_processConnectionDidInvalidate:(id)a3;
- (void)_reRunFastPassInitialDownloadIfNecessaryForWrapper:(id)a3 withReschedulerManager:(id)a4;
- (void)_registerAfterLaunchWhenAllEnginesAreOpened;
- (void)_registerForBackupRequests;
- (void)_registerForConfigurationRefresh;
- (void)_registerForFastPassInitialDownload;
- (void)_registerForMaintenance;
- (void)_registerForPeriodicUploadOfComputeStates;
- (void)_reportICPLFeatureCheckpoint:(unint64_t)a3;
- (void)_updateConfigurationRefreshIntervalIfNecessary;
- (void)_wrapperArray:(id)a3 forDaemon:(BOOL)a4 getStatusWithCompletionHandler:(id)a5;
- (void)daemonLibraryManager:(id)a3 wantsToExitAfterResettingParametersForLibraryWithIdentifier:(id)a4;
- (void)daemonLibraryManagerHasBeenDisconnected:(id)a3;
- (void)daemonLibraryManagerWantsToExitNow:(id)a3;
- (void)emergencyExitForWrapperArray:(id)a3;
- (void)enumerateDaemonLibraryManagersWithLibraryIdentifier:(id)a3 block:(id)a4;
- (void)getDaemonLibraryManagerStatusesWithCompletionHandler:(id)a3;
- (void)getDaemonStatusWithCompletionHandler:(id)a3;
- (void)getEngineWrapperStatusesWithCompletionHandler:(id)a3;
- (void)initialDownloadHelper:(id)a3 checkActiveAccountWithCompletionHandler:(id)a4;
- (void)registerForSyncBubble;
- (void)requestInitialDownloadOfMainScopeForLibraryWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)requestLibraryWithIdentifier:(id)a3 withActivatedMainScope:(BOOL)a4 completionHandler:(id)a5;
- (void)startSyncTaskForDaemonLibraryManager:(id)a3;
- (void)uploadContent;
- (void)willSwitchUser;
- (void)wipeEnginesIfNecessaryWithCompletionHandler:(id)a3;
- (void)wrapperArray:(id)a3 getStatusDictionaryWithCompletionHandler:(id)a4;
- (void)wrapperArray:(id)a3 getStatusWithCompletionHandler:(id)a4;
- (void)wrapperArray:(id)a3 wrapperDidCompleteInitialSyncOfMainScope:(id)a4;
- (void)wrapperArray:(id)a3 wrapperNeedsInitialDownloadOfMainScope:(id)a4;
- (void)wrapperArray:(id)a3 wrapperShouldBeDropped:(id)a4;
- (void)wrapperArrayCountDidChange:(id)a3;
@end

@implementation CPLDaemon

- (id)initForSyncBubble:(BOOL)a3 forceClientPush:(BOOL)a4
{
  BOOL v5 = a3;
  v83.receiver = self;
  v83.super_class = (Class)CPLDaemon;
  id v7 = [(CPLDaemon *)&v83 init];
  if (!v7) {
    return v7;
  }
  if (os_variant_has_internal_content())
  {
    v8 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v9 = [v8 BOOLForKey:@"CPLDontAskToWipeDatabase"];

    if ((v9 & 1) == 0) {
      +[CPLPrequeliteStore setShouldWarnUserBeforeWipeOnUpgrade:1];
    }
  }
  *((unsigned char *)v7 + 16) = v5;
  if (v5)
  {
    *((unsigned char *)v7 + 17) = a4;
    if (!_CPLSilentLogging)
    {
      v10 = sub_1000060E4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Daemon is launching for sync bubble", buf, 2u);
      }
    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      v11 = sub_1000060E4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Daemon is launching", buf, 2u);
      }
    }
    CPLEnableUnsupportedScopesAlert();
    CPLRequestClientSetRequestBlock();
  }
  uint64_t v12 = +[NSDate date];
  v13 = (void *)*((void *)v7 + 1);
  *((void *)v7 + 1) = v12;

  v14 = objc_alloc_init(CPLBGSTActivitiesReport);
  v15 = (void *)*((void *)v7 + 24);
  *((void *)v7 + 24) = v14;

  __SBSSetStatusBarShowsActivityForApplication = &SBSSetStatusBarShowsActivityForApplication;
  +[NSXPCListener enableTransactions];
  if (!_CPLSilentLogging)
  {
    v16 = sub_1000060E4();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Initializing and launching Daemon", buf, 2u);
    }
  }
  uint64_t v17 = +[CPLCloudKitCoordinator sharedCoordinator];
  v18 = (void *)*((void *)v7 + 7);
  *((void *)v7 + 7) = v17;

  if (!*((unsigned char *)v7 + 16))
  {
    v19 = objc_alloc_init(CPLCloudKitPushNotificationCenter);
    v20 = (void *)*((void *)v7 + 8);
    *((void *)v7 + 8) = v19;
  }
  [*((id *)v7 + 7) setPushNotificationCenter:*((void *)v7 + 8)];
  id v21 = objc_alloc_init((Class)NSMutableArray);
  v22 = (void *)*((void *)v7 + 9);
  *((void *)v7 + 9) = v21;

  id v23 = objc_alloc_init((Class)CPLPlatform);
  +[CPLPlatform setPrequeliteStoreImplementationForPlatform:v23];
  v24 = +[NSUserDefaults standardUserDefaults];
  v25 = [v24 stringForKey:@"CPLFakeICloudPath"];
  if (!v25) {
    goto LABEL_35;
  }
  int has_internal_content = os_variant_has_internal_content();

  if (!has_internal_content) {
    goto LABEL_36;
  }
  if (qword_1002CE3F8 != -1) {
    dispatch_once(&qword_1002CE3F8, &stru_100275E78);
  }
  Class v27 = NSClassFromString(@"EnginePlistTransport");
  Class v28 = NSClassFromString(@"EnginePlistLibrary");
  if (v27)
  {
    Class v29 = v28;
    if (v28)
    {
      if (!_CPLSilentLogging)
      {
        v30 = sub_1000060E4();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Using local transport for CPL Engine", buf, 2u);
        }
      }
      [v23 setPlatformImplementation:v27 forClass:objc_opt_class()];
      [v23 setPlatformImplementation:v29 forClass:objc_opt_class()];
      [*((id *)v7 + 7) coordinatorWontBeUsed];
      goto LABEL_41;
    }
  }
  if (!_CPLSilentLogging)
  {
    v24 = sub_1000060E4();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to find local transport class", buf, 2u);
    }
LABEL_35:

LABEL_36:
    if (!_CPLSilentLogging)
    {
      v31 = sub_1000060E4();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "Using engine with CloudKit transport", buf, 2u);
      }
    }
  }
  uint64_t v32 = objc_opt_class();
  [v23 setPlatformImplementation:v32 forClass:objc_opt_class()];
LABEL_41:
  +[CPLPlatform setDirectClientImplementationForPlatform:v23];
  if (*((unsigned char *)v7 + 16))
  {
    uint64_t v33 = objc_opt_class();
    [v23 setPlatformImplementation:v33 forClass:objc_opt_class()];
  }
  +[CPLPlatform setDefaultPlatform:v23];
  v34 = dispatch_queue_attr_make_initially_inactive(0);
  dispatch_queue_t v35 = dispatch_queue_create("com.apple.cloudphotod.daemon", v34);
  v36 = (void *)*((void *)v7 + 16);
  *((void *)v7 + 16) = v35;

  dispatch_set_qos_class_fallback();
  v78 = _NSConcreteStackBlock;
  uint64_t v79 = 3221225472;
  v80 = sub_100006310;
  v81 = &unk_100275EA0;
  v37 = v7;
  id v82 = v37;
  xpc_set_idle_handler();
  v37[138] = 1;
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472;
  v75[2] = sub_100006440;
  v75[3] = &unk_100275EC8;
  SEL v77 = a2;
  v38 = v37;
  id v76 = v38;
  [v38 _performOnceDeviceIsUnlocked:v75];
  signal(15, (void (__cdecl *)(int))1);
  dispatch_source_t v39 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, *((dispatch_queue_t *)v7 + 16));
  v41 = (dispatch_object_t *)(v38 + 13);
  v40 = (void *)v38[13];
  v38[13] = v39;

  v42 = v38[13];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100006588;
  handler[3] = &unk_100275EA0;
  v43 = v38;
  v74 = v43;
  dispatch_source_set_event_handler(v42, handler);
  dispatch_resume(*v41);
  signal(29, (void (__cdecl *)(int))1);
  dispatch_source_t v44 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1DuLL, 0, *((dispatch_queue_t *)v7 + 16));
  v46 = v43 + 14;
  dispatch_object_t v45 = v43[14];
  v43[14] = v44;

  *(void *)buf = 0;
  v70 = buf;
  uint64_t v71 = 0x2020000000;
  char v72 = 0;
  v47 = v43[14];
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_1000066F0;
  v66[3] = &unk_100275F88;
  v68 = buf;
  v48 = v43;
  v67 = v48;
  dispatch_source_set_event_handler(v47, v66);
  dispatch_resume(*v46);
  signal(30, (void (__cdecl *)(int))1);
  dispatch_source_t v49 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1EuLL, 0, *((dispatch_queue_t *)v7 + 16));
  v51 = v48 + 15;
  dispatch_object_t v50 = v48[15];
  v48[15] = v49;

  v52 = v48[15];
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_100006C1C;
  v64[3] = &unk_100275EA0;
  v53 = v48;
  v65 = v53;
  dispatch_source_set_event_handler(v52, v64);
  dispatch_resume(*v51);
  if (!_CPLSilentLogging)
  {
    v54 = sub_1000060E4();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v84 = 138412290;
      CFStringRef v85 = @"com.apple.cloudphotod";
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEBUG, "Daemon listening on %@", v84, 0xCu);
    }
  }
  v55 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.cloudphotod"];
  dispatch_object_t v56 = v53[4];
  v53[4] = v55;

  [v53[4] setDelegate:v53];
  [v53[4] _setQueue:*((void *)v7 + 16)];
  [v53[4] resume];
  v57 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.cloudphotod.daemon"];
  dispatch_object_t v58 = v53[5];
  v53[5] = v57;

  [v53[5] setDelegate:v53];
  [v53[5] _setQueue:*((void *)v7 + 16)];
  [v53[5] resume];
  v59 = objc_alloc_init((Class)NSMutableArray);
  dispatch_object_t v60 = v53[6];
  v53[6] = v59;

  uint32_t v61 = notify_post("com.apple.cpl.cloudphotoddidlaunch");
  if (v61 && !_CPLSilentLogging)
  {
    v62 = sub_1000060E4();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v84 = 67109120;
      LODWORD(v85) = v61;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "Unable to notify that daemon has launched: %i", v84, 8u);
    }
  }
  dispatch_activate(*((dispatch_object_t *)v7 + 16));

  _Block_object_dispose(buf, 8);
  return v7;
}

- (void)_performPendingBlockAfterFirstUnlock
{
  if (self->_isLocked)
  {
    (*((void (**)(void))self->_pendingBlockAfterFirstUnlock + 2))();
    self->_isLocked = 0;
    id pendingBlockAfterFirstUnlock = self->_pendingBlockAfterFirstUnlock;
    self->_id pendingBlockAfterFirstUnlock = 0;
  }
}

- (void)_performOnceDeviceIsUnlocked:(id)a3
{
  BOOL v5 = (void (**)(void))a3;
  if (MKBDeviceUnlockedSinceBoot() == 1)
  {
    if (!_CPLSilentLogging)
    {
      v6 = sub_1000060E4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device is unlocked at launch", buf, 2u);
      }
    }
    self->_isLocked = 0;
    v5[2](v5);
  }
  else
  {
    *(void *)buf = 0;
    v24 = buf;
    uint64_t v25 = 0x2020000000;
    int v26 = 0;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100006F6C;
    v22[3] = &unk_100275F88;
    v22[4] = self;
    v22[5] = buf;
    id v7 = objc_retainBlock(v22);
    v8 = (const char *)kMobileKeyBagLockStatusNotifyToken;
    unsigned __int8 v9 = (int *)(v24 + 24);
    queue = self->_queue;
    v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    v18 = sub_100006FD4;
    v19 = &unk_100275FF0;
    id v21 = buf;
    v11 = v7;
    id v20 = v11;
    if (notify_register_dispatch(v8, v9, (dispatch_queue_t)queue, &v16))
    {
      v14 = +[NSAssertionHandler currentHandler];
      v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLDaemon.m"];
      [v14 handleFailureInMethod:a2 object:self file:v15 lineNumber:545 description:@"Can't register to device protection changes notification"];

      abort();
    }
    id v12 = objc_msgSend(v5, "copy", v16, v17, v18, v19);
    id pendingBlockAfterFirstUnlock = self->_pendingBlockAfterFirstUnlock;
    self->_id pendingBlockAfterFirstUnlock = v12;

    _Block_object_dispose(buf, 8);
  }
}

- (void)_performAfterRegistrations:(id)a3
{
  unsigned __int8 v9 = (void (**)(void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_hasDoneInitialRegistration)
  {
    v9[2]();
  }
  else
  {
    performAfterRegistrations = self->_performAfterRegistrations;
    if (!performAfterRegistrations)
    {
      BOOL v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v6 = self->_performAfterRegistrations;
      self->_performAfterRegistrations = v5;

      performAfterRegistrations = self->_performAfterRegistrations;
    }
    id v7 = [v9 copy];
    id v8 = objc_retainBlock(v7);
    [(NSMutableArray *)performAfterRegistrations addObject:v8];
  }
}

- (void)_registerAfterLaunchWhenAllEnginesAreOpened
{
  if (!self->_isLocked
    && !self->_hasDoneInitialRegistration
    && ![(CPLEngineWrapperArray *)self->_wrappers unopenedCount])
  {
    if (!_CPLSilentLogging)
    {
      v3 = sub_1000060E4();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Monitoring system requests", buf, 2u);
      }
    }
    if (!self->_forSyncBubble)
    {
      [(CPLDaemon *)self _registerForConfigurationRefresh];
      [(CPLDaemon *)self _registerForMaintenance];
      [(CPLDaemon *)self _registerForBackupRequests];
      [(CPLDaemon *)self _registerForFastPassInitialDownload];
      [(CPLDaemon *)self _registerForPeriodicUploadOfComputeStates];
      queue = self->_queue;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10000733C;
      v19[3] = &unk_100275EA0;
      v19[4] = self;
      BOOL v5 = v19;
      *(void *)buf = _NSConcreteStackBlock;
      uint64_t v21 = 3221225472;
      v22 = sub_10000D974;
      id v23 = &unk_100275DF8;
      id v24 = v5;
      v6 = queue;
      dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
      dispatch_async(v6, v7);
    }
    [(CPLDaemon *)self registerForSyncBubble];
    self->_hasDoneInitialRegistration = 1;
    performAfterRegistrations = self->_performAfterRegistrations;
    if (performAfterRegistrations)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      unsigned __int8 v9 = performAfterRegistrations;
      id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v25 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v16;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v16 != v12) {
              objc_enumerationMutation(v9);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v15 + 1) + 8 * i));
          }
          id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v25 count:16];
        }
        while (v11);
      }

      v14 = self->_performAfterRegistrations;
      self->_performAfterRegistrations = 0;
    }
  }
}

- (void)_updateConfigurationRefreshIntervalIfNecessary
{
  v3 = +[BGSystemTaskScheduler sharedScheduler];
  v4 = [v3 taskRequestForIdentifier:@"com.apple.cloudphotod.configurationrefresh"];

  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = [(CPLEngineWrapperArray *)self->_wrappers mostRecentConfigurationDictionary];
      v6 = v5;
      if (!v5) {
        goto LABEL_15;
      }
      [v5 refreshInterval];
      double v8 = v7;
      [v4 interval];
      if (v8 == v9) {
        goto LABEL_15;
      }
      [v4 setInterval:v8];
      [v4 setMinDurationBetweenInstances:v8 * 0.8];
      id v10 = +[BGSystemTaskScheduler sharedScheduler];
      id v18 = 0;
      unsigned int v11 = [v10 updateTaskRequest:v4 error:&v18];
      id v12 = v18;

      if (v11)
      {
        if (!_CPLSilentLogging)
        {
          v13 = sub_1000060E4();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            double v20 = v8;
            v14 = "Updated the refresh interval of the configuration refresh task to %.0f seconds";
            long long v15 = v13;
            os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
            uint32_t v17 = 12;
LABEL_12:
            _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, buf, v17);
            goto LABEL_13;
          }
          goto LABEL_13;
        }
      }
      else if (!_CPLSilentLogging)
      {
        v13 = sub_1000060E4();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          double v20 = v8;
          __int16 v21 = 2112;
          id v22 = v12;
          v14 = "Failed to update the refresh interval of the configuration refresh task to %.0f seconds: %@";
          long long v15 = v13;
          os_log_type_t v16 = OS_LOG_TYPE_ERROR;
          uint32_t v17 = 22;
          goto LABEL_12;
        }
LABEL_13:
      }
LABEL_15:
    }
  }
}

- (void)_registerForConfigurationRefresh
{
  if (!_CPLSilentLogging)
  {
    v3 = sub_1000060E4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering for configuration refresh", buf, 2u);
    }
  }
  v4 = +[BGSystemTaskScheduler sharedScheduler];
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100007640;
  v6[3] = &unk_100276060;
  v6[4] = self;
  [v4 registerForTaskWithIdentifier:@"com.apple.cloudphotod.configurationrefresh" usingQueue:queue launchHandler:v6];
}

- (void)_registerForMaintenance
{
  if (!_CPLSilentLogging)
  {
    v3 = sub_1000060E4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering for maintenance activity", buf, 2u);
    }
  }
  v4 = +[BGSystemTaskScheduler sharedScheduler];
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100007B38;
  v6[3] = &unk_100276060;
  v6[4] = self;
  [v4 registerForTaskWithIdentifier:@"com.apple.cloudphotod.maintenance" usingQueue:queue launchHandler:v6];
}

- (void)_registerForBackupRequests
{
  if (!_CPLSilentLogging)
  {
    v3 = sub_1000060E4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering for user backup requests", buf, 2u);
    }
  }
  v4 = +[BGSystemTaskScheduler sharedScheduler];
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100008098;
  v6[3] = &unk_100276060;
  v6[4] = self;
  [v4 registerForTaskWithIdentifier:@"com.apple.cloudphotod.backup" usingQueue:queue launchHandler:v6];
}

- (void)_reportICPLFeatureCheckpoint:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      v4 = @"Disabled";
      break;
    case 0x32uLL:
      v4 = @"Available";
      break;
    case 0x1EuLL:
      v4 = @"PreviewAvailable";
      break;
    default:
      v4 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Checkpoint_%lu", a3);
      break;
  }
  id v12 = 0;
  unsigned int v5 = +[BGSystemTaskCheckpoints reportFeatureCheckpoint:a3 forFeature:107 error:&v12];
  id v6 = v12;
  if (v5)
  {
    if (!_CPLSilentLogging)
    {
      double v7 = sub_1000060E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v14 = v4;
        __int16 v15 = 2114;
        uint64_t v16 = CPLLibraryIdentifierSystemLibrary;
        double v8 = "Reported iCPL feature is %@ for %{public}@";
        double v9 = v7;
        os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
        uint32_t v11 = 22;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, buf, v11);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
  }
  else if (!_CPLSilentLogging)
  {
    double v7 = sub_1000060E4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v14 = v4;
      __int16 v15 = 2114;
      uint64_t v16 = CPLLibraryIdentifierSystemLibrary;
      __int16 v17 = 2112;
      id v18 = v6;
      double v8 = "Failed to report iCPL feature is %@ for %{public}@: %@";
      double v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
      uint32_t v11 = 32;
      goto LABEL_15;
    }
LABEL_16:
  }
}

- (void)_registerForFastPassInitialDownload
{
  if (!_CPLSilentLogging)
  {
    v3 = sub_1000060E4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering for Fast Pass Initial Download", buf, 2u);
    }
  }
  v4 = +[BGSystemTaskScheduler sharedScheduler];
  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100008AA4;
  v12[3] = &unk_100276060;
  v12[4] = self;
  [v4 registerForTaskWithIdentifier:@"com.apple.cloudphotod.initialdownload.fastpass" usingQueue:queue launchHandler:v12];

  id v6 = +[BGSystemTaskScheduler sharedScheduler];
  double v7 = [v6 taskRequestForIdentifier:@"com.apple.cloudphotod.initialdownload.fastpass"];

  if (v7)
  {
    if (!_CPLSilentLogging)
    {
      double v8 = sub_1000060E4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v7;
        double v9 = "Fast Pass Initial Download still needs to be run - request: %@";
        os_log_type_t v10 = v8;
        uint32_t v11 = 12;
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  else if (!_CPLSilentLogging)
  {
    double v8 = sub_1000060E4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      double v9 = "Fast Pass Initial Download has already run";
      os_log_type_t v10 = v8;
      uint32_t v11 = 2;
      goto LABEL_12;
    }
LABEL_13:
  }
}

- (void)_registerForPeriodicUploadOfComputeStates
{
  if (!_CPLSilentLogging)
  {
    v3 = sub_1000060E4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering for periodic upload of compute states activity", buf, 2u);
    }
  }
  v4 = +[BGSystemTaskScheduler sharedScheduler];
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000096E4;
  v6[3] = &unk_100276060;
  v6[4] = self;
  [v4 registerForTaskWithIdentifier:@"com.apple.cloudphotod.periodic.upload.computestates" usingQueue:queue launchHandler:v6];
}

- (id)allowedProtocolForClientAccess:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:@"library"])
  {
    v4 = &protocolRef_CPLDaemonLibraryManagerProtocol;
LABEL_6:
    unsigned int v5 = *v4;
    goto LABEL_7;
  }
  if (([v3 isEqual:@"management"] & 1) != 0
    || [v3 isEqual:@"preferences"])
  {
    v4 = &protocolRef_CPLDaemonLibraryManagerMinimalProtocol;
    goto LABEL_6;
  }
  unsigned int v5 = 0;
LABEL_7:

  return v5;
}

- (void)_processConnectionDidInvalidate:(id)a3
{
  if (a3) {
    -[NSMutableArray removeObject:](self->_processClients, "removeObject:");
  }
}

- (BOOL)_processListener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v7 valueForEntitlement:@"com.apple.private.cloudphotod.access"];
  double v9 = v8;
  if (v8 && ([v8 isEqual:@"management"] & 1) != 0)
  {
    os_log_type_t v10 = sub_100012D98();
    [v7 setExportedInterface:v10];
    [v7 setExportedObject:self];
    [v7 _setQueue:self->_queue];
    objc_initWeak((id *)location, self);
    objc_initWeak(&from, v7);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100009D50;
    v13[3] = &unk_100276150;
    objc_copyWeak(&v14, (id *)location);
    objc_copyWeak(&v15, &from);
    [v7 setInvalidationHandler:v13];
    [(NSMutableArray *)self->_processClients addObject:v7];
    [v7 resume];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&from);
    objc_destroyWeak((id *)location);
    BOOL v11 = 1;
  }
  else
  {
    if (_CPLSilentLogging)
    {
      BOOL v11 = 0;
      goto LABEL_9;
    }
    os_log_type_t v10 = sub_1000060E4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = v7;
      __int16 v18 = 2112;
      CFStringRef v19 = @"com.apple.private.cloudphotod.access";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@ has no valid entitlement for %@", location, 0x16u);
    }
    BOOL v11 = 0;
  }

LABEL_9:
  return v11;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = (NSXPCListener *)a3;
  id v7 = a4;
  if (self->_processListener == v6)
  {
    unsigned __int8 v9 = [(CPLDaemon *)self _processListener:v6 shouldAcceptNewConnection:v7];
    goto LABEL_65;
  }
  if (self->_deactivated)
  {
    if (!_CPLSilentLogging)
    {
      double v8 = sub_1000060E4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Some client tried to connect while we were deactivated", buf, 2u);
      }
    }
    unsigned __int8 v9 = 0;
    goto LABEL_65;
  }
  if (!_CPLSilentLogging)
  {
    os_log_type_t v10 = sub_1000060E4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%@ got a new connection: %@", buf, 0x16u);
    }
  }
  uint64_t v11 = [v7 valueForEntitlement:@"com.apple.private.cloudphotod.access"];
  if (v11)
  {
    id v12 = v11;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v7) {
        [v7 auditToken];
      }
      CFStringRef v36 = 0;
      memset(buf, 0, sizeof(buf));
      if (!CPCopyBundleIdentifierAndTeamFromAuditToken())
      {
        if (!_CPLSilentLogging)
        {
          v13 = sub_1000060E4();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v7;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%@ has no bundle identifier. Will fallback on process ID", buf, 0xCu);
          }
        }
        int v14 = [v7 processIdentifier];
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        memset(buf, 0, sizeof(buf));
        if (!proc_name(v14, buf, 0x100u))
        {
          if (_CPLSilentLogging) {
            goto LABEL_42;
          }
          id v15 = sub_1000060E4();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            goto LABEL_41;
          }
          double v20 = __error();
          __int16 v21 = strerror(*v20);
          *(_DWORD *)v37 = 138412546;
          id v38 = v7;
          __int16 v39 = 2080;
          v40 = v21;
          uint64_t v16 = "Can't get process name for %@: %s";
          __int16 v17 = v15;
          uint32_t v18 = 22;
          goto LABEL_40;
        }
        CFStringRef v36 = CFStringCreateWithCString(0, (const char *)buf, 0x8000100u);
        if (!v36 && !_CPLSilentLogging)
        {
          id v15 = sub_1000060E4();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
LABEL_41:

            goto LABEL_42;
          }
          *(_WORD *)v37 = 0;
          uint64_t v16 = "Can't decypher process name";
          __int16 v17 = v15;
          uint32_t v18 = 2;
LABEL_40:
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v16, v37, v18);
          goto LABEL_41;
        }
      }
LABEL_42:
      id v22 = (void *)v36;
      if (!v36) {
        id v22 = (void *)CFRetain(@"anonymous");
      }
      id v23 = [(CPLDaemon *)self allowedProtocolForClientAccess:v12];
      unsigned __int8 v9 = v23 != 0;
      if (v23)
      {
        if (!_CPLSilentLogging)
        {
          id v24 = sub_1000060E4();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v25 = NSStringFromProtocol(v23);
            *(_DWORD *)buf = 138413058;
            *(void *)&uint8_t buf[4] = v7;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v22;
            *(_WORD *)&buf[22] = 2112;
            *(void *)&buf[24] = v25;
            LOWORD(v42) = 2112;
            *(void *)((char *)&v42 + 2) = v12;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Accepting a new connection from %@ (bundle identifier: %@). Allowed protocol is %@ (%@)", buf, 0x2Au);
          }
        }
        unsigned int v34 = [v12 isEqualToString:@"management"];
        int v26 = [objc_alloc((Class)NSString) initWithFormat:@"%@[%@]", v22, v12];
        Class v27 = CPLCopyDefaultSerialQueueAttributes();
        dispatch_queue_t v28 = dispatch_queue_create_with_target_V2("com.apple.cloudphotod.daemon.connection", v27, (dispatch_queue_t)self->_queue);

        dispatch_queue_t v35 = v28;
        [v7 _setQueue:v28];
        Class v29 = [[CPLDaemonLibraryManager alloc] initWithConnection:v7 name:v26 allowedProcol:v23 isManagement:v34];
        [(CPLDaemonLibraryManager *)v29 setDelegate:self];
        [(NSMutableArray *)self->_daemonManagers addObject:v29];
        if (!_CPLSilentLogging)
        {
          v30 = sub_1000060E4();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            daemonManagers = self->_daemonManagers;
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = daemonManagers;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Current daemon's clients: %@", buf, 0xCu);
          }
        }
      }
      else
      {
        if (_CPLSilentLogging)
        {
LABEL_58:

LABEL_59:
          goto LABEL_60;
        }
        int v26 = sub_1000060E4();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v12;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v7;
          *(_WORD *)&buf[22] = 2112;
          *(void *)&buf[24] = v22;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Unknown access type '%@' from %@ (%@)", buf, 0x20u);
        }
      }

      goto LABEL_58;
    }
    if (!_CPLSilentLogging)
    {
      CFStringRef v19 = sub_1000060E4();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v7;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = @"com.apple.private.cloudphotod.access";
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@: value for entitlement %@ is invalid", buf, 0x16u);
      }
    }
  }
  if (!_CPLSilentLogging)
  {
    id v12 = sub_1000060E4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = @"com.apple.private.cloudphotod.access";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@ has no valid entitlement for %@", buf, 0x16u);
    }
    unsigned __int8 v9 = 0;
    goto LABEL_59;
  }
  unsigned __int8 v9 = 0;
LABEL_60:
  if ((v9 & 1) == 0 && !_CPLSilentLogging)
  {
    uint64_t v32 = sub_1000060E4();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "Refusing connection from %@", buf, 0xCu);
    }
  }
LABEL_65:

  return v9;
}

- (id)daemonLibraryManager:(id)a3 engineWrapperWithClientLibraryBaseURL:(id)a4 cloudLibraryStateStorageURL:(id)a5 cloudLibraryResourceStorageURL:(id)a6 libraryIdentifier:(id)a7 mainScopeIdentifier:(id)a8 options:(unint64_t)a9 error:(id *)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  if (!self->_isLocked) {
    goto LABEL_10;
  }
  if (MKBDeviceUnlockedSinceBoot() == 1) {
    [(CPLDaemon *)self _performPendingBlockAfterFirstUnlock];
  }
  if (self->_isLocked)
  {
    if (a10)
    {
      id v22 = +[CPLErrors cplErrorWithCode:100 description:@"Device is locked. File system is not available"];
LABEL_16:
      id v24 = 0;
      *a10 = v22;
      goto LABEL_18;
    }
  }
  else
  {
LABEL_10:
    if (v17 && v18 && v19 && v20)
    {
      id v23 = [[CPLEngineParameters alloc] initWithClientLibraryBaseURL:v17 cloudLibraryStateStorageURL:v18 cloudLibraryResourceStorageURL:v19 libraryIdentifier:v20 mainScopeIdentifier:v21 options:a9];
      id v24 = [(CPLEngineWrapperArray *)self->_wrappers registeredWrapperCreateIfNecessaryWithParameters:v23 error:a10];

      goto LABEL_18;
    }
    if (v20)
    {
      id v24 = [(CPLEngineWrapperArray *)self->_wrappers registeredWrapperWithLibraryIdentifier:v20 error:a10];
      goto LABEL_18;
    }
    if (a10)
    {
      id v22 = +[CPLErrors incorrectParametersErrorForParameter:@"libraryIdentifier"];
      goto LABEL_16;
    }
  }
  id v24 = 0;
LABEL_18:

  return v24;
}

- (void)_daemonLibraryManagerWantsToExitNow:(id)a3
{
  id v4 = a3;
  if (!_CPLSilentLogging)
  {
    id v5 = v4;
    id v6 = sub_1000060E4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ wants to exit now", (uint8_t *)&v8, 0xCu);
    }
  }
  [(CPLEngineWrapperArray *)self->_wrappers emergencyStop];
  if (!_CPLSilentLogging)
  {
    id v7 = sub_1000060E4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "All engines have been closed in emergency, exiting now", (uint8_t *)&v8, 2u);
    }
  }
  exit(0);
}

- (void)daemonLibraryManager:(id)a3 wantsToExitAfterResettingParametersForLibraryWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  parametersStorage = self->_parametersStorage;
  id v16 = 0;
  unsigned int v9 = [(CPLEngineParametersStorage *)parametersStorage removeParametersWithLibraryIdentifier:v7 error:&v16];
  id v10 = v16;
  if (v9)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v11 = sub_1000060E4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v18 = v7;
        id v12 = "Reset parameters for %{public}@";
        v13 = v11;
        os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
        uint32_t v15 = 12;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, buf, v15);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (!_CPLSilentLogging)
  {
    uint64_t v11 = sub_1000060E4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v18 = v7;
      __int16 v19 = 2112;
      id v20 = v10;
      id v12 = "Failed to reset parameters for %{public}@: %@";
      v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 22;
      goto LABEL_8;
    }
LABEL_9:
  }
  [(CPLDaemon *)self _daemonLibraryManagerWantsToExitNow:v6];
}

- (void)daemonLibraryManagerWantsToExitNow:(id)a3
{
  id v4 = a3;
  id v5 = +[NSUserDefaults standardUserDefaults];
  unsigned int v6 = [v5 BOOLForKey:@"CPLDaemonKeepRunningWithNoEngines"];

  if (v6)
  {
    if (!_CPLSilentLogging)
    {
      id v7 = sub_1000060E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412290;
        id v10 = v4;
        int v8 = "%@ wants to exit now but daemon wants to keep running";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v9, 0xCu);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  else
  {
    if (![(CPLEngineWrapperArray *)self->_wrappers count])
    {
      [(CPLDaemon *)self _daemonLibraryManagerWantsToExitNow:v4];
      goto LABEL_11;
    }
    if (!_CPLSilentLogging)
    {
      id v7 = sub_1000060E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412290;
        id v10 = v4;
        int v8 = "%@ wants to exit now but there are still some engines running";
        goto LABEL_9;
      }
LABEL_10:
    }
  }
LABEL_11:
}

- (void)daemonLibraryManagerHasBeenDisconnected:(id)a3
{
  [(NSMutableArray *)self->_daemonManagers removeObject:a3];
  if ([(NSMutableArray *)self->_daemonManagers count])
  {
    if (_CPLSilentLogging) {
      return;
    }
    id v4 = sub_1000060E4();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_9;
    }
    daemonManagers = self->_daemonManagers;
    int v7 = 138412290;
    CFStringRef v8 = (const __CFString *)daemonManagers;
    unsigned int v6 = "Current daemon's clients: %@";
    goto LABEL_8;
  }
  if (_CPLSilentLogging) {
    return;
  }
  id v4 = sub_1000060E4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412290;
    CFStringRef v8 = @"com.apple.cloudphotod";
    unsigned int v6 = "Daemon listening on %@";
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)&v7, 0xCu);
  }
LABEL_9:
}

- (void)_deactivateDaemon
{
  self->_deactivated = 1;
}

- (void)startSyncTaskForDaemonLibraryManager:(id)a3
{
  id v4 = a3;
  if (qword_1002CE428 != -1) {
    dispatch_once(&qword_1002CE428, &stru_100276368);
  }
  if (byte_1002CE420 && !self->_logoutTask)
  {
    if (!_CPLSilentLogging)
    {
      id v5 = sub_1000060E4();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412290;
        id v9 = v4;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Notified by %@ that we begin a push session. Starting sync task", (uint8_t *)&v8, 0xCu);
      }
    }
    unsigned int v6 = +[UMUserSyncTask taskWithName:@"iCPL upload" reason:@"Starting a push session"];
    logoutTask = self->_logoutTask;
    self->_logoutTask = v6;

    [(UMUserSyncTask *)self->_logoutTask begin];
  }
}

- (id)daemonLibraryManagerOtherLibraryManager:(id)a3 withLibraryIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int v8 = self->_daemonManagers;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(id *)(*((void *)&v17 + 1) + 8 * i);
        if (v12 != v6)
        {
          if (objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "isLibraryManager", (void)v17))
          {
            v13 = [v12 engineWrapper];
            os_log_type_t v14 = [v13 libraryIdentifier];
            unsigned __int8 v15 = [v14 isEqualToString:v7];

            if (v15)
            {
              id v9 = v12;
              goto LABEL_13;
            }
          }
        }
      }
      id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v9;
}

- (void)enumerateDaemonLibraryManagersWithLibraryIdentifier:(id)a3 block:(id)a4
{
  id v5 = a4;
  daemonManagers = self->_daemonManagers;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000AE70;
  v8[3] = &unk_100276178;
  id v9 = v5;
  id v7 = v5;
  [(NSMutableArray *)daemonManagers enumerateObjectsUsingBlock:v8];
}

- (id)wrapperArray:(id)a3 engineWrapperWithParameters:(id)a4 createIfNecessary:(BOOL)a5 queue:(id)a6 error:(id *)a7
{
  BOOL v9 = a5;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [v11 clientLibraryBaseURL];
  os_log_type_t v14 = (void *)v13;
  if (!v9)
  {
    id v16 = [v11 cloudLibraryStateStorageURL];
    id v52 = 0;
    id v51 = 0;
    unsigned __int8 v22 = [v16 getResourceValue:&v52 forKey:NSURLVolumeURLKey error:&v51];
    id v18 = v52;
    id v21 = v51;
    if (v22) {
      goto LABEL_5;
    }

    if (_CPLSilentLogging)
    {
      id v18 = 0;
LABEL_32:

      id v23 = v21;
      if (a7) {
        goto LABEL_21;
      }
      goto LABEL_33;
    }
    id v50 = v12;
    id v38 = sub_1000060E4();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      long long v42 = [v16 path];
      *(_DWORD *)buf = 138412546;
      dispatch_object_t v60 = v42;
      __int16 v61 = 2112;
      id v62 = v21;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Can't access library at %@ anymore: %@", buf, 0x16u);
    }
    id v18 = 0;
LABEL_31:

    id v12 = v50;
    goto LABEL_32;
  }
  long long v47 = a7;
  unsigned __int8 v15 = (void *)v13;
  id v16 = [v11 clientLibraryBaseURL];
  id v57 = 0;
  id v56 = 0;
  unsigned __int8 v17 = [v16 getResourceValue:&v57 forKey:NSURLVolumeURLKey error:&v56];
  id v18 = v57;
  id v19 = v56;
  long long v20 = v19;
  if (v17)
  {
    id v21 = v19;
    os_log_type_t v14 = v15;
LABEL_5:

    id v23 = v21;
    goto LABEL_6;
  }
  id v50 = v12;

  id v38 = [v16 URLByDeletingLastPathComponent];
  id v54 = 0;
  id v55 = 0;
  unsigned __int8 v39 = [v38 getResourceValue:&v55 forKey:NSURLVolumeURLKey error:&v54];
  id v18 = v55;
  id v21 = v54;

  if ((v39 & 1) == 0)
  {
    if (_CPLSilentLogging)
    {
      os_log_type_t v14 = v15;
    }
    else
    {
      long long v43 = sub_1000060E4();
      os_log_type_t v14 = v15;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        long long v44 = [v16 path];
        *(_DWORD *)buf = 138412546;
        dispatch_object_t v60 = v44;
        __int16 v61 = 2112;
        id v62 = v21;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Unable to create library at %@. Unable to get parent folder info: %@", buf, 0x16u);
      }
    }
    a7 = v47;
    goto LABEL_31;
  }
  v40 = +[NSFileManager defaultManager];
  id v53 = v21;
  unsigned __int8 v41 = [v40 createDirectoryAtURL:v16 withIntermediateDirectories:0 attributes:0 error:&v53];
  id v23 = v53;

  os_log_type_t v14 = v15;
  a7 = v47;
  id v12 = v50;
  if ((v41 & 1) == 0)
  {
    if (v47)
    {
LABEL_21:
      id v23 = v23;
      Class v27 = 0;
      *a7 = v23;
      goto LABEL_34;
    }
LABEL_33:
    Class v27 = 0;
    goto LABEL_34;
  }
LABEL_6:
  if (!v18 && !_CPLSilentLogging)
  {
    id v24 = sub_1000060E4();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = [v14 path];
      *(_DWORD *)buf = 138412290;
      dispatch_object_t v60 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Unable to determine engine volume for %@", buf, 0xCu);
    }
  }
  long long v48 = v14;
  id v26 = [objc_alloc((Class)CPLEngineLibrary) initWithParameters:v11];
  Class v27 = [[CPLEngineWrapper alloc] initWithParameters:v11 engine:v26 queue:v12];
  dispatch_queue_t v28 = [[CPLEngineLibrarySupervisor alloc] initWithEngineLibrary:v26 queue:self->_queue];
  [v26 setSupervisor:v28];

  if (+[CPLResource cplShouldGenerateDerivatives])
  {
    Class v29 = [v26 store];
    v30 = [v29 derivativesCache];
    [v30 setDerivativeGeneratorClass:objc_opt_class()];
  }
  v31 = [v26 transport];
  uint64_t v32 = [v31 platformObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!self->_forSyncBubble)
    {
      long long v46 = [v26 libraryIdentifier];
      uint64_t v33 = [v26 processesInvolvedInSyncSessions];
      [v26 clientAppBundleIdentifier];
      v34 = id v49 = v12;
      dispatch_object_t v58 = v34;
      dispatch_queue_t v35 = +[NSArray arrayWithObjects:&v58 count:1];
      CFStringRef v36 = +[CPLCloudKitReschedulerCoordinator cloudKitReschedulerManagerForLibraryWithIdentifier:v46 involvedProcesses:v33 relatedApplications:v35];
      [v32 setReschedulerManager:v36];

      id v12 = v49;
    }
    v37 = objc_alloc_init(CPLCloudKitComputeStateEncryptionHelper);
    [v32 registerHelper:v37 withIdentifier:@"compute-state-encryption"];
  }
  [(CPLEngineWrapper *)v27 setVolumeURL:v18];

  os_log_type_t v14 = v48;
LABEL_34:

  return v27;
}

- (void)wrapperArray:(id)a3 wrapperShouldBeDropped:(id)a4
{
  objc_msgSend(a4, "libraryIdentifier", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  +[CPLCloudKitReschedulerCoordinator dropCloudKitReschedulerManagerForLibraryWithIdentifier:v4];
}

- (BOOL)allowsConfigurationRefreshForWrapperArray:(id)a3
{
  return !self->_forSyncBubble;
}

- (void)emergencyExitForWrapperArray:(id)a3
{
  id v3 = a3;
  if (!_CPLSilentLogging)
  {
    id v4 = sub_1000060E4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Daemon exiting immediately", v5, 2u);
    }
  }
  exit(0);
}

- (void)wrapperArrayCountDidChange:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    if (![v4 unopenedCount]) {
      [(CPLDaemon *)self _registerAfterLaunchWhenAllEnginesAreOpened];
    }
  }
  else
  {
    if (self->_closing || self->_deactivated)
    {
      if (!_CPLSilentLogging)
      {
        id v6 = sub_1000060E4();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No more engines open - exiting immediately", buf, 2u);
        }
      }
      exit(0);
    }
    if (!_CPLSilentLogging)
    {
      id v5 = sub_1000060E4();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No engines are configured", v7, 2u);
      }
    }
  }
}

- (void)_wrapperArray:(id)a3 forDaemon:(BOOL)a4 getStatusWithCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000B7CC;
  v17[3] = &unk_1002761E8;
  BOOL v20 = a4;
  v17[4] = self;
  id v10 = v8;
  id v18 = v10;
  id v11 = v9;
  id v19 = v11;
  id v12 = objc_retainBlock(v17);
  uint64_t v13 = v12;
  pushNotificationCenter = self->_pushNotificationCenter;
  if (pushNotificationCenter)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000BDB0;
    v15[3] = &unk_100276238;
    v15[4] = self;
    id v16 = v12;
    [(CPLCloudKitPushNotificationCenter *)pushNotificationCenter getStatusWithCompletionHandler:v15];
  }
  else
  {
    ((void (*)(void *, void))v12[2])(v12, 0);
  }
}

- (void)wrapperArray:(id)a3 getStatusWithCompletionHandler:(id)a4
{
}

- (void)wrapperArray:(id)a3 getStatusDictionaryWithCompletionHandler:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000C014;
  v11[3] = &unk_100276288;
  v11[4] = self;
  id v12 = v5;
  id v7 = v11;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D974;
  block[3] = &unk_100275DF8;
  id v14 = v7;
  id v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

- (void)_reRunFastPassInitialDownloadIfNecessaryForWrapper:(id)a3 withReschedulerManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)BGFastPassSystemTaskRequest) initWithIdentifier:@"com.apple.cloudphotod.initialdownload.fastpass"];
  [v8 setRequiresProtectionClass:3];
  [v8 setRequiresExternalPower:0];
  [v8 setRequiresNetworkConnectivity:1];
  [v8 setPriority:2];
  id v9 = [v7 involvedProcesses];
  [v8 setInvolvedProcesses:v9];

  [v8 setFeatureCodes:&off_100292C28];
  uint64_t v10 = [v7 taskIdentifier];

  uint64_t v30 = v10;
  id v11 = +[NSArray arrayWithObjects:&v30 count:1];
  [v8 setProcessingTaskIdentifiers:v11];

  id v12 = +[NSSet setWithObjects:@"com.apple.cloudphotod.initialdownload.assets", @"com.apple.cloudphotod.initialdownload.finished", @"com.apple.cloudphotod.initialdownload.fastpass", 0];
  [v8 setProducedResultIdentifiers:v12];

  [v8 setReRun:1];
  uint64_t v13 = +[BGSystemTaskScheduler sharedScheduler];
  id v25 = 0;
  LOBYTE(v10) = [v13 submitTaskRequest:v8 error:&v25];
  id v14 = v25;

  if ((v10 & 1) == 0)
  {
    unsigned __int8 v17 = [v14 domain];
    if ([v17 isEqualToString:BGSystemTaskSchedulerErrorDomain])
    {
      id v18 = [v14 code];

      if (v18 == (id)5)
      {
        if (_CPLSilentLogging) {
          goto LABEL_18;
        }
        id v19 = sub_1000060E4();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v20 = [v6 libraryIdentifier];
          *(_DWORD *)buf = 138543362;
          Class v27 = v20;
          id v21 = "Noting that %{public}@ needs Fast Pass Initial Download but failed to submit a rerun request because the"
                " request has already been submitted";
          unsigned __int8 v22 = v19;
          os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
          uint32_t v24 = 12;
LABEL_16:
          _os_log_impl((void *)&_mh_execute_header, v22, v23, v21, buf, v24);

          goto LABEL_17;
        }
        goto LABEL_17;
      }
    }
    else
    {
    }
    if (_CPLSilentLogging) {
      goto LABEL_18;
    }
    id v19 = sub_1000060E4();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      BOOL v20 = [v6 libraryIdentifier];
      *(_DWORD *)buf = 138543618;
      Class v27 = v20;
      __int16 v28 = 2112;
      id v29 = v14;
      id v21 = "Noting that %{public}@ needs Fast Pass Initial Download but failed to submit request: %@";
      unsigned __int8 v22 = v19;
      os_log_type_t v23 = OS_LOG_TYPE_ERROR;
      uint32_t v24 = 22;
      goto LABEL_16;
    }
LABEL_17:

    goto LABEL_18;
  }
  if (!_CPLSilentLogging)
  {
    unsigned __int8 v15 = sub_1000060E4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v6 libraryIdentifier];
      *(_DWORD *)buf = 138543362;
      Class v27 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Noting that %{public}@ needs Fast Pass Initial Download - resubmitted request", buf, 0xCu);
    }
  }
  [(CPLBGSTActivitiesReport *)self->_backgroundSystemTasksReport didSubmitTaskWithIdentifier:@"com.apple.cloudphotod.initialdownload.fastpass"];
LABEL_18:
}

- (void)wrapperArray:(id)a3 wrapperNeedsInitialDownloadOfMainScope:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (!self->_forSyncBubble && [v5 isSystemLibrary])
  {
    id v7 = [v6 engine];
    id v8 = [v7 transport];
    id v9 = [v8 platformObject];

    uint64_t v10 = [v9 reschedulerManager];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        queue = self->_queue;
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_10000C738;
        v15[3] = &unk_1002760B0;
        v15[4] = self;
        id v16 = v6;
        id v17 = v10;
        id v12 = v15;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000D974;
        block[3] = &unk_100275DF8;
        id v19 = v12;
        uint64_t v13 = queue;
        dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
        dispatch_async(v13, v14);
      }
    }
  }
}

- (void)wrapperArray:(id)a3 wrapperDidCompleteInitialSyncOfMainScope:(id)a4
{
  if (!self->_forSyncBubble && objc_msgSend(a4, "isSystemLibrary", a3))
  {
    [(CPLDaemon *)self _reportICPLFeatureCheckpoint:50];
  }
}

- (unint64_t)wrapperArray:(id)a3 countOfClientsForWrapper:(id)a4
{
  id v5 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = self->_daemonManagers;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "engineWrapper", (void)v14);
        id v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v5) {
          ++v9;
        }
      }
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (void)getDaemonStatusWithCompletionHandler:(id)a3
{
}

- (void)getEngineWrapperStatusesWithCompletionHandler:(id)a3
{
  queue = self->_queue;
  id v5 = (void (**)(id, id, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  id v6 = [(CPLEngineWrapperArray *)self->_wrappers wrapperStatuses];
  v5[2](v5, v6, 0);
}

- (void)getDaemonLibraryManagerStatusesWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, id, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_daemonManagers, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_daemonManagers;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v10), "status", (void)v12);
        [v5 addObject:v11];

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  v4[2](v4, v5, 0);
}

- (void)requestLibraryWithIdentifier:(id)a3 withActivatedMainScope:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)requestInitialDownloadOfMainScopeForLibraryWithIdentifier:(id)a3 completionHandler:(id)a4
{
}

- (void)wipeEnginesIfNecessaryWithCompletionHandler:(id)a3
{
  wrappers = self->_wrappers;
  id v4 = (void (**)(id, void))a3;
  [(CPLEngineWrapperArray *)wrappers wipeEnginesIfNecessary];
  v4[2](v4, 0);
}

- (void)initialDownloadHelper:(id)a3 checkActiveAccountWithCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[NSProgress progressWithTotalUnitCount:1];
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000CE2C;
  v17[3] = &unk_1002762B0;
  v17[4] = self;
  BOOL v20 = v21;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = v8;
  id v9 = v7;
  id v19 = v9;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000CEC8;
  v15[3] = &unk_100276288;
  v15[4] = self;
  uint64_t v10 = objc_retainBlock(v17);
  id v16 = v10;
  [v8 setCancellationHandler:v15];
  coordinator = self->_coordinator;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000D030;
  v13[3] = &unk_100276300;
  void v13[4] = self;
  long long v12 = v10;
  id v14 = v12;
  [(CPLCloudKitCoordinator *)coordinator fetchAccountInfoWithCompletionHandler:v13];

  _Block_object_dispose(v21, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundSystemTasksReport, 0);
  objc_storeStrong((id *)&self->_logoutTask, 0);
  objc_storeStrong((id *)&self->_syncTask, 0);
  objc_storeStrong((id *)&self->_performAfterRegistrations, 0);
  objc_storeStrong(&self->_pendingBlockAfterFirstUnlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_supervisorSignalSource, 0);
  objc_storeStrong((id *)&self->_watchInfoSignalSource, 0);
  objc_storeStrong((id *)&self->_watchKillSignalSource, 0);
  objc_storeStrong((id *)&self->_watchCPLLibrarySource, 0);
  objc_storeStrong((id *)&self->_initialDownloadHelper, 0);
  objc_storeStrong((id *)&self->_wrappers, 0);
  objc_storeStrong((id *)&self->_daemonManagers, 0);
  objc_storeStrong((id *)&self->_pushNotificationCenter, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_processClients, 0);
  objc_storeStrong((id *)&self->_processListener, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_parametersStorage, 0);
  objc_storeStrong((id *)&self->_launchDate, 0);
}

- (void)registerForSyncBubble
{
  if (qword_1002CE428 != -1) {
    dispatch_once(&qword_1002CE428, &stru_100276368);
  }
  if (byte_1002CE420 && !self->_registeredStakeholder)
  {
    if (!_CPLSilentLogging)
    {
      id v3 = sub_1000060E4();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering for sync bubble", v5, 2u);
      }
    }
    id v4 = +[UMUserManager sharedManager];
    [v4 registerUserSyncStakeholder:self withMachServiceName:@"com.apple.cloudphotod.syncstakeholder"];

    self->_registeredStakeholder = 1;
  }
}

- (void)willSwitchUser
{
  if (self->_logoutTask)
  {
    if (_CPLSilentLogging) {
      return;
    }
    v2 = sub_1000060E4();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    __int16 v6 = 0;
    id v3 = "Notified that user will be switched, we have a running sync task";
    id v4 = (uint8_t *)&v6;
    goto LABEL_8;
  }
  if (_CPLSilentLogging) {
    return;
  }
  v2 = sub_1000060E4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v5 = 0;
    id v3 = "Notified that user will be switched, we don't have a running sync task";
    id v4 = (uint8_t *)&v5;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, v3, v4, 2u);
  }
LABEL_9:
}

- (void)uploadContent
{
  if (!self->_syncTask && self->_registeredStakeholder)
  {
    if (!_CPLSilentLogging)
    {
      id v3 = sub_1000060E4();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Notified that we need to upload content. Starting sync task", buf, 2u);
      }
    }
    id v4 = +[UMUserSyncTask taskWithName:@"iCPL upload" reason:@"Pushing pending records"];
    syncTask = self->_syncTask;
    self->_syncTask = v4;

    [(UMUserSyncTask *)self->_syncTask begin];
    wrappers = self->_wrappers;
    BOOL forceClientPush = self->_forceClientPush;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000D688;
    v8[3] = &unk_100276328;
    void v8[4] = self;
    [(CPLEngineWrapperArray *)wrappers forceBackupWithActivity:0 forceClientPush:forceClientPush completionHandler:v8];
  }
}

@end