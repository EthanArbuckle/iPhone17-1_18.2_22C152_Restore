@interface ADDaemon
+ (double)processLaunchTime;
+ (id)sharedDaemon;
+ (unint64_t)processLaunchMachTime;
+ (unint64_t)processLoadedMachTime;
- (ADDaemon)init;
- (BOOL)_analyticsListenerShouldAcceptNewConnection:(id)a3;
- (BOOL)_analyticsObservationListenerShouldAcceptNewConnection:(id)a3;
- (BOOL)_audioSessionAssertionServiceListenerShouldAcceptNewConnection:(id)a3;
- (BOOL)_clientListenerShouldAcceptNewConnection:(id)a3;
- (BOOL)_dictationListenerShouldAcceptNewConnection:(id)a3;
- (BOOL)_locationServiceListenerShouldAcceptNewConnection:(id)a3;
- (BOOL)_managedStorageListenerShouldAcceptNewConnection:(id)a3;
- (BOOL)_notificationServiceListenerShouldAcceptNewConnection:(id)a3;
- (BOOL)_securityListenerShouldAcceptNewConnection:(id)a3;
- (BOOL)_settingsListenerShouldAcceptNewConnection:(id)a3;
- (BOOL)_synapseSyncListenerShouldAcceptNewConnection:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_peerLocationService;
- (id)_proxyService;
- (id)_synapseAppBundleIDFromPossibleDeamonBundleID:(id)a3;
- (void)_bundleID:(id *)a3 andPath:(id *)a4 forXPCConnection:(id)a5;
- (void)_daemonDidLaunchWithContext:(id)a3;
- (void)_daemonWillShutdown;
- (void)_enabledBitsChanged:(id)a3;
- (void)_meDeviceChanged:(id)a3;
- (void)_registerForSyncNotifications;
- (void)_registerSyncCoalescedJob;
- (void)_setupAccessibility;
- (void)_setupAnalyticsListener;
- (void)_setupAnalyticsObservationListener;
- (void)_setupAnnouncementSpeakingStatePublisher;
- (void)_setupAudioSessionAssertionAcquisitionService;
- (void)_setupAudioSessionAssertionServiceListener;
- (void)_setupClientListener;
- (void)_setupClientLiteListener;
- (void)_setupCloudKit;
- (void)_setupDictationListener;
- (void)_setupDistributedNotificationHandlers;
- (void)_setupExternalRequestListener;
- (void)_setupHomeKit;
- (void)_setupIDSServices;
- (void)_setupInternal;
- (void)_setupLocationService;
- (void)_setupLocationServiceListener;
- (void)_setupManagedStorageListener;
- (void)_setupMemoryPressureObservation;
- (void)_setupMobileGestaltNotificationHandlers;
- (void)_setupMultiUserCloudSyncer;
- (void)_setupNotificationServiceListener;
- (void)_setupNotifyHandlers;
- (void)_setupOfflineDictationStatusObserver;
- (void)_setupPairedSync;
- (void)_setupPommesSearchService;
- (void)_setupRapportServices;
- (void)_setupSecurityListener;
- (void)_setupSessionLanguage;
- (void)_setupSettingsListener;
- (void)_setupSiriAnalyticsListener;
- (void)_setupSynapseSyncListener;
- (void)_setupSyncListener;
- (void)_setupTetherListener;
- (void)_setupWirelessCoexManagerSubscription;
- (void)_syncForReason:(id)a3 withCoalescing:(BOOL)a4;
- (void)dealloc;
- (void)keepAlive;
- (void)runWithLaunchContext:(id)a3;
- (void)scheduleDestroyJob;
- (void)scheduleUnlockedWork:(id)a3;
- (void)scheduleValidationRefreshForInterval:(double)a3;
- (void)shutdown;
- (void)startUIRequestWithInfo:(id)a3;
- (void)startUISpeechRequest;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
- (void)syncForReason:(id)a3 withCoalescing:(BOOL)a4;
- (void)unscheduleDestroyJob;
@end

@implementation ADDaemon

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_trialExperimentsQueue, 0);
  objc_storeStrong((id *)&self->_dictationPidSet, 0);
  objc_storeStrong((id *)&self->_dictationListenerQueue, 0);
  objc_storeStrong((id *)&self->_unlockedWorkQueue, 0);
  objc_storeStrong((id *)&self->_peerLocationManagerRemote, 0);
  objc_storeStrong((id *)&self->_proxyRemote, 0);
  objc_storeStrong((id *)&self->_syncReasonsQueued, 0);
  objc_storeStrong((id *)&self->_siriTetherListener, 0);
  objc_storeStrong((id *)&self->_clientLiteListener, 0);
  objc_storeStrong((id *)&self->_externalRequestListener, 0);
  objc_storeStrong((id *)&self->_syncListener, 0);
  objc_storeStrong((id *)&self->_pommesSearchServiceLauncher, 0);
  objc_storeStrong((id *)&self->_locationServiceListener, 0);
  objc_storeStrong((id *)&self->_audioSessionAssertionServiceListener, 0);
  objc_storeStrong((id *)&self->_notificationServiceListener, 0);
  objc_storeStrong((id *)&self->_securityListener, 0);
  objc_storeStrong((id *)&self->_managedStorageListener, 0);
  objc_storeStrong((id *)&self->_synapseSyncListener, 0);
  objc_storeStrong((id *)&self->_settingsListener, 0);
  objc_storeStrong((id *)&self->_dictationListener, 0);
  objc_storeStrong((id *)&self->_clientListener, 0);
  objc_storeStrong((id *)&self->_analyticsObservationListener, 0);
  objc_storeStrong((id *)&self->_analyticsListener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_setupAccessibility
{
  id v2 = [off_100580B88() sharedSystemShellSwitcher];
  [v2 signalSiriAvailability];
}

- (void)_setupOfflineDictationStatusObserver
{
  id v2 = +[ADDictationOfflineStatusObserver sharedDictationOfflineStatusObserver];
}

- (void)scheduleUnlockedWork:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C8770;
  v7[3] = &unk_10050E188;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)scheduleValidationRefreshForInterval:(double)a3
{
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    v9 = "_ADValidationRefreshCriteriaForInterval";
    __int16 v10 = 2048;
    double v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s %lf", (uint8_t *)&v8, 0x16u);
  }
  if (a3 >= 0.0) {
    double v5 = a3;
  }
  else {
    double v5 = (double)XPC_ACTIVITY_INTERVAL_1_DAY;
  }
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v6, XPC_ACTIVITY_INTERVAL, (uint64_t)v5);
  if (v5 * 0.5 > a3)
  {
    double v7 = 0.0;
    if (a3 >= 0.0) {
      double v7 = a3;
    }
    xpc_dictionary_set_int64(v6, XPC_ACTIVITY_DELAY, (uint64_t)v7);
  }
  xpc_dictionary_set_int64(v6, XPC_ACTIVITY_GRACE_PERIOD, 0);
  xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_string(v6, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
  sub_100274FD0("com.apple.siri.xpc_activity.refresh_validation", v6, &stru_100508948, &stru_100508988);
}

- (void)unscheduleDestroyJob
{
}

- (void)scheduleDestroyJob
{
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(xdict, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_int64(xdict, XPC_ACTIVITY_DELAY, 15);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_string(xdict, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
  sub_100274FD0("com.apple.siri.xpc_activity.destroy", xdict, &stru_1005089A8, &stru_1005089C8);
}

- (void)_syncForReason:(id)a3 withCoalescing:(BOOL)a4
{
  BOOL v4 = a4;
  xpc_object_t v6 = (__CFString *)a3;
  if (sub_1001FC284())
  {
    double v7 = +[ADDaemon sharedDaemon];
    [v7 keepAlive];

    sub_1002E6E94(v6);
    syncReasonsQueued = self->_syncReasonsQueued;
    if (!syncReasonsQueued)
    {
      v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      __int16 v10 = self->_syncReasonsQueued;
      self->_syncReasonsQueued = v9;

      syncReasonsQueued = self->_syncReasonsQueued;
    }
    [(NSMutableSet *)syncReasonsQueued addObject:v6];
    if (v4 && self->_lastSyncRequested && (uint64_t v11 = mach_absolute_time(), v11 < AFMachAbsoluteTimeAddTimeInterval()))
    {
      v12 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        v17 = self->_syncReasonsQueued;
        *(_DWORD *)buf = 136315394;
        v20 = "-[ADDaemon _syncForReason:withCoalescing:]";
        __int16 v21 = 2112;
        v22 = v17;
        _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s Sync requested recently; sync reasons enqueued: %@",
          buf,
          0x16u);
      }
      if (!self->_syncActivityRegistered)
      {
        dispatch_time_t v13 = dispatch_time(0, 3000000000);
        queue = self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000C8D5C;
        block[3] = &unk_10050E138;
        block[4] = self;
        dispatch_after(v13, queue, block);
      }
    }
    else
    {
      [(ADDaemon *)self _registerSyncCoalescedJob];
    }
  }
  else
  {
    v15 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      CFStringRef v16 = &stru_10050F7D8;
      if (v6) {
        CFStringRef v16 = v6;
      }
      *(_DWORD *)buf = 136315394;
      v20 = "-[ADDaemon _syncForReason:withCoalescing:]";
      __int16 v21 = 2112;
      v22 = (void *)v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s ignoring request to sync %@", buf, 0x16u);
    }
  }
}

- (void)syncForReason:(id)a3 withCoalescing:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C8E0C;
  block[3] = &unk_10050CA08;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)_registerSyncCoalescedJob
{
  self->_lastSyncRequested = mach_absolute_time();
  if (self->_syncActivityRegistered)
  {
    v3 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[ADDaemon _registerSyncCoalescedJob]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Sync now activity already registered", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000C9158;
    v9[3] = &unk_10050E138;
    v9[4] = self;
    BOOL v4 = v9;
    if (sub_1001FC284())
    {
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      dispatch_time_t v13 = sub_100274ED8;
      v14 = &unk_100508760;
      v15 = v4;
      double v5 = objc_retainBlock(&buf);
      xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v6, XPC_ACTIVITY_DELAY, 0);
      xpc_dictionary_set_int64(v6, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_5_MIN);
      xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REPEATING, 0);
      xpc_dictionary_set_string(v6, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
      xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_ALLOW_BATTERY, 1);
      xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
      xpc_dictionary_set_string(v6, XPC_ACTIVITY_NETWORK_TRANSFER_DIRECTION, XPC_ACTIVITY_NETWORK_TRANSFER_BIDIRECTIONAL);
      sub_100274FD0("com.apple.siri.xpc_activity.sync.now", v6, 0, v5);
      double v7 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)id v10 = 136315138;
        BOOL v11 = "ADRegisterSyncNowActivity";
        _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s sync now xpc activity registered", v10, 0xCu);
      }
    }
    else
    {
      id v8 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "ADRegisterSyncNowActivity";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Skipped register XPC activitiy for SyncNow because sync is disabled", (uint8_t *)&buf, 0xCu);
      }
    }

    self->_syncActivityRegistered = 1;
  }
}

- (void)_setupSessionLanguage
{
  id v2 = +[ADCommandCenter sharedCommandCenter];
  [v2 setLanguageCodeIfNeeded];

  id v5 = +[ADCommandCenter sharedCommandCenter];
  v3 = +[ADPreferences sharedPreferences];
  BOOL v4 = [v3 outputVoice];
  objc_msgSend(v5, "_outputVoice_setOutputVoice:", v4);
}

- (void)_daemonWillShutdown
{
  id v2 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    id v8 = "-[ADDaemon _daemonWillShutdown]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s assistantd shutting down\n\n", (uint8_t *)&v7, 0xCu);
  }
  v3 = +[ADCommandCenter sharedCommandCenter];
  [v3 prepareForShutdown];

  BOOL v4 = +[AFDiagnostics sharedDiagnostics];
  [v4 flush];

  id v5 = +[SiriCoreNetworkManager sharedInstance];
  [v5 deRegisterWithWirelessCoexManager];

  xpc_object_t v6 = +[SNNetworkManager sharedInstance];
  [v6 unregisterClient];
}

- (void)_daemonDidLaunchWithContext:(id)a3
{
  AFLogInitIfNeeded();
  uint64_t v4 = sub_1001FC704();
  id v5 = (void *)qword_100585E48;
  qword_100585E48 = v4;

  AFInstallCommonSignalHandlers();
  if (qword_100585A70 != -1) {
    dispatch_once(&qword_100585A70, &stru_100501FC0);
  }
  id v6 = +[AFInstanceContext currentContext];
  int v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    v25 = "-[ADDaemon _daemonDidLaunchWithContext:]";
    __int16 v26 = 2080;
    v27 = "MobileAssistantDaemons-3402.74.3.11.4";
    __int16 v28 = 2080;
    v29 = "1";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s assistantd launched build %s~%s", buf, 0x20u);
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000C96E4;
  v23[3] = &unk_10050E138;
  v23[4] = self;
  id v8 = objc_retainBlock(v23);
  v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INTERACTIVE, 0);

  BOOL v11 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.assistantd.trial", v10);
  trialExperimentsQueue = self->_trialExperimentsQueue;
  self->_trialExperimentsQueue = v11;

  +[ADExperimentManager tracerAllocationsWithQueue:self->_trialExperimentsQueue];
  dispatch_time_t v13 = self->_queue;
  v14 = +[ADQueueMonitor sharedMonitor];
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  v20 = sub_1000C9F90;
  __int16 v21 = &unk_10050C458;
  v22 = v13;
  v15 = v13;
  [v14 addQueue:v15 heartBeatInterval:&v18 timeoutInterval:5.0 timeoutHandler:5.0];

  CFStringRef v16 = +[AFInstanceContext defaultContext];
  instanceContext = self->_instanceContext;
  self->_instanceContext = v16;

  ((void (*)(void *))v8[2])(v8);
}

- (void)_setupPommesSearchService
{
  if ((AFIsHorseman() & 1) == 0)
  {
    self->_pommesSearchServiceLauncher = (PommesSearchServiceLauncher *)objc_alloc_init((Class)PommesSearchServiceLauncher);
    _objc_release_x1();
  }
}

- (void)_setupAudioSessionAssertionAcquisitionService
{
}

- (void)_setupWirelessCoexManagerSubscription
{
  if (AFDeviceSupportsWiFiLPASMode() && _AFPreferencesiRATManagerRecommendationEnabled())
  {
    id v2 = +[SiriCoreNetworkManager sharedInstance];
    [v2 registerWithWirelessCoexManager];

    id v3 = +[SNNetworkManager sharedInstance];
    [v3 registerClient];
  }
}

- (void)_setupMemoryPressureObservation
{
  id v2 = +[AFMemoryPressureObserver sharedObserver];
}

- (void)_setupMultiUserCloudSyncer
{
  id v2 = +[ADMultiUserCloudKitSyncer sharedService];
}

- (void)_setupCloudKit
{
  if (AFProcessIsRunningAsInstance())
  {
    id v2 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      id v5 = "-[ADDaemon _setupCloudKit]";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s Skipping setup for CloudKit because the process is running as an instance of a multi-instance service.", buf, 0xCu);
    }
  }
  else
  {
    id v3 = +[ADCloudKitManager sharedManager];
    [v3 enablePushNotifications];
  }
}

- (void)_setupHomeKit
{
  id v2 = +[ADHomeDataSharingRepromptManager sharedManager];
  id v3 = +[ADHomeInfoManager sharedInfoManager];
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  id v5 = a4;
  id v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    v12 = "-[ADDaemon syncCoordinator:beginSyncSession:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CA4AC;
  block[3] = &unk_10050E138;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, block);
}

- (void)_setupPairedSync
{
  id v3 = [off_100580B80() syncCoordinatorWithServiceName:@"com.apple.pairedsync.siri"];
  [v3 setDelegate:self];
}

- (void)_setupClientLiteListener
{
  id v3 = objc_alloc_init(ADClientLiteListener);
  clientLiteListener = self->_clientLiteListener;
  self->_clientLiteListener = v3;

  id v5 = self->_clientLiteListener;
  [(ADClientLiteListener *)v5 listen];
}

- (void)_setupExternalRequestListener
{
  id v3 = objc_alloc_init(ADExternalRequestListener);
  externalRequestListener = self->_externalRequestListener;
  self->_externalRequestListener = v3;

  [(ADExternalRequestListener *)self->_externalRequestListener listen];
  sub_1001FD68C();
}

- (void)_setupTetherListener
{
  id v3 = objc_alloc_init(ADSiriTetherListener);
  siriTetherListener = self->_siriTetherListener;
  self->_siriTetherListener = v3;

  id v5 = self->_siriTetherListener;
  [(ADSiriTetherListener *)v5 listen];
}

- (void)_registerForSyncNotifications
{
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)sub_1000CA8B8, kCFLocaleCurrentLocaleDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_enabledBitsChanged:" name:@"ADPreferencesEnabledBitsDidChangeNotification" object:0];
  uint64_t v4 = +[ADFMIPListener sharedListener];
  [v4 startListening];

  [v5 addObserver:self selector:"_meDeviceChanged:" name:@"ADMultiUserMeDeviceChangedNotification" object:0];
}

- (void)_meDeviceChanged:(id)a3
{
  v5[0] = @"com.apple.contact.people";
  v5[1] = @"com.apple.siri.applications";
  v5[2] = @"com.apple.siri.vocabularyupdates";
  id v3 = +[NSArray arrayWithObjects:v5 count:3];
  uint64_t v4 = +[ADCommandCenter sharedCommandCenter];
  [v4 syncAnchorKeys:v3 forceReset:0 reasons:&off_100523300];
}

- (void)_enabledBitsChanged:(id)a3
{
  sub_1002E7814(@"ADPreferencesEnabledBitsDidChangeNotification");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(ADDaemon *)self syncForReason:v4 withCoalescing:1];
}

- (void)_setupSyncListener
{
  id v3 = +[ADMUXCompanionSyncTokenContainer sharedInstance];
  if (sub_1001FB9E8())
  {
    id v4 = dispatch_get_global_queue(0, 0);
    mach_service = xpc_connection_create_mach_service("com.apple.assistant.sync", v4, 1uLL);
    syncListener = self->_syncListener;
    self->_syncListener = mach_service;

    xpc_connection_set_event_handler(self->_syncListener, &stru_100501120);
    int v7 = self->_syncListener;
    xpc_connection_resume(v7);
  }
  else
  {
    id v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      id v10 = "-[ADDaemon _setupSyncListener]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Skipping setup for sync listener because the process is running as an instance of a multi-instance service, or the device can never sync", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)_setupMobileGestaltNotificationHandlers
{
  if (!self->_mg_notification_token)
  {
    CFStringRef v4 = @"UserAssignedDeviceName";
    id v3 = +[NSArray arrayWithObjects:&v4 count:1];
    self->_mg_notification_token = (MGNotificationTokenStruct *)MGRegisterForUpdates();
  }
}

- (void)_setupDistributedNotificationHandlers
{
  queue = self->_queue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000CB384;
  handler[3] = &unk_10050A808;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.distnoted.matching", queue, handler);
}

- (void)_setupNotifyHandlers
{
  queue = self->_queue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000CB60C;
  handler[3] = &unk_10050A808;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", queue, handler);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = (NSXPCListener *)a3;
  id v7 = a4;
  if (self->_clientListener == v6)
  {
    unsigned __int8 v9 = [(ADDaemon *)self _clientListenerShouldAcceptNewConnection:v7];
LABEL_24:
    BOOL v8 = v9;
    goto LABEL_25;
  }
  if (self->_settingsListener == v6)
  {
    unsigned __int8 v9 = [(ADDaemon *)self _settingsListenerShouldAcceptNewConnection:v7];
    goto LABEL_24;
  }
  if (self->_dictationListener == v6)
  {
    unsigned __int8 v9 = [(ADDaemon *)self _dictationListenerShouldAcceptNewConnection:v7];
    goto LABEL_24;
  }
  if (self->_managedStorageListener == v6)
  {
    unsigned __int8 v9 = [(ADDaemon *)self _managedStorageListenerShouldAcceptNewConnection:v7];
    goto LABEL_24;
  }
  if (self->_synapseSyncListener == v6)
  {
    unsigned __int8 v9 = [(ADDaemon *)self _synapseSyncListenerShouldAcceptNewConnection:v7];
    goto LABEL_24;
  }
  if (self->_analyticsListener == v6)
  {
    unsigned __int8 v9 = [(ADDaemon *)self _analyticsListenerShouldAcceptNewConnection:v7];
    goto LABEL_24;
  }
  if (self->_securityListener == v6)
  {
    unsigned __int8 v9 = [(ADDaemon *)self _securityListenerShouldAcceptNewConnection:v7];
    goto LABEL_24;
  }
  if (self->_analyticsObservationListener == v6)
  {
    unsigned __int8 v9 = [(ADDaemon *)self _analyticsObservationListenerShouldAcceptNewConnection:v7];
    goto LABEL_24;
  }
  if (self->_notificationServiceListener == v6)
  {
    unsigned __int8 v9 = [(ADDaemon *)self _notificationServiceListenerShouldAcceptNewConnection:v7];
    goto LABEL_24;
  }
  if (self->_audioSessionAssertionServiceListener == v6)
  {
    unsigned __int8 v9 = [(ADDaemon *)self _audioSessionAssertionServiceListenerShouldAcceptNewConnection:v7];
    goto LABEL_24;
  }
  if (self->_locationServiceListener == v6)
  {
    unsigned __int8 v9 = [(ADDaemon *)self _locationServiceListenerShouldAcceptNewConnection:v7];
    goto LABEL_24;
  }
  BOOL v8 = 0;
LABEL_25:

  return v8;
}

- (void)_setupAnnouncementSpeakingStatePublisher
{
  id v2 = +[ADUserNotificationAnnouncementSpeakingStatePublisher sharedPublisher];
}

- (BOOL)_audioSessionAssertionServiceListenerShouldAcceptNewConnection:(id)a3
{
  id v3 = a3;
  char HasEntitlement = AFConnectionHasEntitlement();
  if (HasEntitlement)
  {
    unsigned int v5 = [v3 processIdentifier];
    id v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[ADDaemon _audioSessionAssertionServiceListenerShouldAcceptNewConnection:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v3;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v15) = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@ Audio Session Assertion Service Connection Connected (pid=%d])", buf, 0x1Cu);
    }
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v15 = sub_1000CC01C;
    CFStringRef v16 = sub_1000CC02C;
    v17 = [[ADAudioSessionAssertionConnection alloc] initWithXPCConnection:v3];
    id v7 = AFAudioSessionAssertionServiceXPCInterface();
    [v3 setExportedInterface:v7];

    [v3 setExportedObject:*(void *)(*(void *)&buf[8] + 40)];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000CC034;
    v12[3] = &unk_1005010A0;
    unsigned int v13 = v5;
    v12[4] = buf;
    [v3 setInvalidationHandler:v12];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000CC114;
    v10[3] = &unk_1005010A0;
    unsigned int v11 = v5;
    uint8_t v10[4] = buf;
    [v3 setInterruptionHandler:v10];
    [v3 resume];
    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ADDaemon _audioSessionAssertionServiceListenerShouldAcceptNewConnection:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s %@ Audio Session Assertion Service Connection does not have required entitlements.", buf, 0x16u);
    }
  }

  return HasEntitlement;
}

- (void)_setupAudioSessionAssertionServiceListener
{
  id v3 = [(AFInstanceContext *)self->_instanceContext createXPCListenerWithMachServiceName:kAssistantAudioSessionAssertionServiceName];
  audioSessionAssertionServiceListener = self->_audioSessionAssertionServiceListener;
  self->_audioSessionAssertionServiceListener = v3;

  [(NSXPCListener *)self->_audioSessionAssertionServiceListener setDelegate:self];
  unsigned int v5 = self->_audioSessionAssertionServiceListener;
  [(NSXPCListener *)v5 resume];
}

- (BOOL)_notificationServiceListenerShouldAcceptNewConnection:(id)a3
{
  id v3 = a3;
  char HasEntitlement = AFConnectionHasEntitlement();
  if (HasEntitlement)
  {
    unsigned int v5 = [v3 processIdentifier];
    id v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315650;
      v17 = "-[ADDaemon _notificationServiceListenerShouldAcceptNewConnection:]";
      __int16 v18 = 2112;
      id v19 = v3;
      __int16 v20 = 1024;
      unsigned int v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@ Notification Service Connection Connected (pid=%d])", buf, 0x1Cu);
    }
    id v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___AFUserNotificationService];
    [v3 setExportedInterface:v7];

    BOOL v8 = [[ADUserNotificationServiceProvider alloc] initWithConnection:v3 bundleIdentifier:0 notificationCategories:0];
    [v3 setExportedObject:v8];

    unsigned __int8 v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___AFUserNotificationServiceDelegate];
    [v3 setRemoteObjectInterface:v9];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000CC4F4;
    v14[3] = &unk_10050A4D8;
    unsigned int v15 = v5;
    [v3 setInvalidationHandler:v14];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000CC5B0;
    v12[3] = &unk_10050A4D8;
    unsigned int v13 = v5;
    [v3 setInterruptionHandler:v12];
    [v3 resume];
  }
  else
  {
    id v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      v17 = "-[ADDaemon _notificationServiceListenerShouldAcceptNewConnection:]";
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s %@ Notification Service Connection does not have required entitlements.", buf, 0x16u);
    }
  }

  return HasEntitlement;
}

- (void)_setupNotificationServiceListener
{
  id v3 = [(AFInstanceContext *)self->_instanceContext createXPCListenerWithMachServiceName:kAssistantNotificationServiceName];
  notificationServiceListener = self->_notificationServiceListener;
  self->_notificationServiceListener = v3;

  [(NSXPCListener *)self->_notificationServiceListener setDelegate:self];
  [(NSXPCListener *)self->_notificationServiceListener resume];
  id v5 = +[ADUserNotificationServiceProvider personalDomainNotificationProvider];
}

- (BOOL)_securityListenerShouldAcceptNewConnection:(id)a3
{
  id v3 = a3;
  char HasEntitlement = AFConnectionHasEntitlement();
  if (HasEntitlement)
  {
    unsigned int v5 = [v3 processIdentifier];
    id v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315650;
      CFStringRef v16 = "-[ADDaemon _securityListenerShouldAcceptNewConnection:]";
      __int16 v17 = 2112;
      id v18 = v3;
      __int16 v19 = 1024;
      unsigned int v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@ Security Connection Connected (pid=%d])", buf, 0x1Cu);
    }
    id v7 = AFSecurityServiceGetXPCInterface();
    [v3 setExportedInterface:v7];

    BOOL v8 = +[ADSecurityService sharedService];
    [v3 setExportedObject:v8];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000CC928;
    v13[3] = &unk_10050A4D8;
    unsigned int v14 = v5;
    [v3 setInvalidationHandler:v13];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000CC9E4;
    v11[3] = &unk_10050A4D8;
    unsigned int v12 = v5;
    [v3 setInterruptionHandler:v11];
    [v3 resume];
  }
  else
  {
    unsigned __int8 v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      CFStringRef v16 = "-[ADDaemon _securityListenerShouldAcceptNewConnection:]";
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s %@ Security Connection does not have required entitlements.", buf, 0x16u);
    }
  }

  return HasEntitlement;
}

- (void)_setupSecurityListener
{
  id v3 = [(AFInstanceContext *)self->_instanceContext createXPCListenerWithMachServiceName:kAssistantSecurityServiceName];
  securityListener = self->_securityListener;
  self->_securityListener = v3;

  [(NSXPCListener *)self->_securityListener setDelegate:self];
  unsigned int v5 = self->_securityListener;
  [(NSXPCListener *)v5 resume];
}

- (BOOL)_analyticsObservationListenerShouldAcceptNewConnection:(id)a3
{
  id v3 = a3;
  char HasEntitlement = AFConnectionHasEntitlement();
  if (HasEntitlement)
  {
    unsigned int v5 = [v3 processIdentifier];
    id v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315650;
      id v18 = "-[ADDaemon _analyticsObservationListenerShouldAcceptNewConnection:]";
      __int16 v19 = 2112;
      id v20 = v3;
      __int16 v21 = 1024;
      unsigned int v22 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@ Analytics Observation Connection Connected (pid=%d])", buf, 0x1Cu);
    }
    id v7 = +[ADAnalyticsService sharedService];
    [v3 setExportedObject:v7];

    BOOL v8 = AFAnalyticsObservationServiceGetXPCInterface();
    [v3 setExportedInterface:v8];

    unsigned __int8 v9 = AFAnalyticsObserverGetXPCInterface();
    [v3 setRemoteObjectInterface:v9];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000CCD94;
    v15[3] = &unk_10050A4D8;
    unsigned int v16 = v5;
    [v3 setInvalidationHandler:v15];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000CCE70;
    v13[3] = &unk_10050A4D8;
    unsigned int v14 = v5;
    [v3 setInterruptionHandler:v13];
    id v10 = +[ADAnalyticsService sharedService];
    [v10 setObserverConnection:v3];

    [v3 resume];
  }
  else
  {
    unsigned int v11 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v18 = "-[ADDaemon _analyticsObservationListenerShouldAcceptNewConnection:]";
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s %@ Analytics Observation Connection does not have required entitlements.", buf, 0x16u);
    }
  }

  return HasEntitlement;
}

- (void)_setupAnalyticsObservationListener
{
  id v3 = [(AFInstanceContext *)self->_instanceContext createXPCListenerWithMachServiceName:kAssistantAnalyticsObservationServiceName];
  analyticsObservationListener = self->_analyticsObservationListener;
  self->_analyticsObservationListener = v3;

  [(NSXPCListener *)self->_analyticsObservationListener setDelegate:self];
  unsigned int v5 = self->_analyticsObservationListener;
  [(NSXPCListener *)v5 resume];
}

- (BOOL)_analyticsListenerShouldAcceptNewConnection:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 processIdentifier];
  unsigned int v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    v24 = "-[ADDaemon _analyticsListenerShouldAcceptNewConnection:]";
    __int16 v25 = 2112;
    id v26 = v3;
    __int16 v27 = 1024;
    unsigned int v28 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@ Analytics Connection Connected (pid=%d])", buf, 0x1Cu);
  }
  id v6 = AFAnalyticsServiceGetXPCInterface();
  [v3 setExportedInterface:v6];

  id v7 = +[ADAnalyticsService sharedService];
  [v3 setExportedObject:v7];

  XPCInterface = (void *)AFAnalyticsServiceDelegateGetXPCInterface();
  [v3 setRemoteObjectInterface:XPCInterface];

  objc_initWeak((id *)buf, v3);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000CD264;
  v20[3] = &unk_100501078;
  unsigned int v22 = v4;
  objc_copyWeak(&v21, (id *)buf);
  [v3 setInvalidationHandler:v20];
  unsigned int v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  unsigned int v16 = sub_1000CD354;
  __int16 v17 = &unk_100501078;
  unsigned int v19 = v4;
  objc_copyWeak(&v18, (id *)buf);
  [v3 setInterruptionHandler:&v14];
  unsigned __int8 v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UTILITY, 0);

  dispatch_queue_t v11 = dispatch_queue_create(0, v10);
  objc_msgSend(v3, "_setQueue:", v11, v14, v15, v16, v17);

  unsigned int v12 = +[ADAnalyticsService sharedService];
  [v12 connectionConnected:v3];

  [v3 resume];
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);

  return 1;
}

- (void)_setupAnalyticsListener
{
  id v3 = [(AFInstanceContext *)self->_instanceContext createXPCListenerWithMachServiceName:kAssistantAnalyticsServiceName];
  analyticsListener = self->_analyticsListener;
  self->_analyticsListener = v3;

  [(NSXPCListener *)self->_analyticsListener setDelegate:self];
  unsigned int v5 = self->_analyticsListener;
  id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_UTILITY, 0);

  dispatch_queue_t v8 = dispatch_queue_create(0, v7);
  [(NSXPCListener *)v5 _setQueue:v8];

  unsigned __int8 v9 = self->_analyticsListener;
  [(NSXPCListener *)v9 resume];
}

- (void)_setupSiriAnalyticsListener
{
  id v2 = +[ADSiriAnalyticsServiceHost sharedSiriAnalyticsServiceHost];
  [v2 setupXPCListener];
}

- (BOOL)_managedStorageListenerShouldAcceptNewConnection:(id)a3
{
  id v3 = a3;
  int HasEntitlement = AFConnectionHasEntitlement();
  if (HasEntitlement)
  {
    unsigned int v5 = [v3 processIdentifier];
    id v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315650;
      id v18 = "-[ADDaemon _managedStorageListenerShouldAcceptNewConnection:]";
      __int16 v19 = 2112;
      id v20 = v3;
      __int16 v21 = 1024;
      unsigned int v22 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@ Managed Storage Connection Connected (pid=%d)", buf, 0x1Cu);
    }
    id v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___AFManagedStorageService];
    [v3 setExportedInterface:v7];

    dispatch_queue_t v8 = objc_alloc_init(ADManagedStorageConnection);
    [v3 setExportedObject:v8];
    dispatch_queue_t v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    unsigned int v13 = sub_1000CD70C;
    unsigned int v14 = &unk_1005012D0;
    uint64_t v15 = v8;
    unsigned int v16 = v5;
    unsigned __int8 v9 = v8;
    [v3 setInvalidationHandler:&v11];
    objc_msgSend(v3, "resume", v11, v12, v13, v14);
  }
  return HasEntitlement;
}

- (void)_setupManagedStorageListener
{
  id v3 = [(AFInstanceContext *)self->_instanceContext createXPCListenerWithMachServiceName:kAssistantManagedStorageServiceName];
  managedStorageListener = self->_managedStorageListener;
  self->_managedStorageListener = v3;

  [(NSXPCListener *)self->_managedStorageListener setDelegate:self];
  unsigned int v5 = self->_managedStorageListener;
  [(NSXPCListener *)v5 resume];
}

- (BOOL)_synapseSyncListenerShouldAcceptNewConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = kAssistantSiriDeveloperEntitlement;
  if (AFConnectionHasEntitlement() & 1) != 0 || (AFConnectionHasEntitlement())
  {
    unsigned int v6 = [v4 processIdentifier];
    id v22 = 0;
    id v23 = 0;
    [(ADDaemon *)self _bundleID:&v23 andPath:&v22 forXPCConnection:v4];
    id v7 = v23;
    id v8 = v22;
    unsigned __int8 v9 = [(ADDaemon *)self _synapseAppBundleIDFromPossibleDeamonBundleID:v7];

    BOOL v10 = v9 != 0;
    dispatch_queue_t v11 = AFSiriLogContextDaemon;
    if (v9)
    {
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315906;
        __int16 v27 = "-[ADDaemon _synapseSyncListenerShouldAcceptNewConnection:]";
        __int16 v28 = 1024;
        *(_DWORD *)v29 = v6;
        *(_WORD *)&v29[4] = 2112;
        *(void *)&v29[6] = v9;
        *(_WORD *)&v29[14] = 2112;
        *(void *)&v29[16] = v4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s assistantd accepted connection from app (pid=%d bundleID=%@) %@", buf, 0x26u);
      }
      uint64_t v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ADIntentPreferencesAndVocabularyUpdateService];
      v25[0] = objc_opt_class();
      v25[1] = objc_opt_class();
      unsigned int v13 = +[NSArray arrayWithObjects:v25 count:2];
      unsigned int v14 = +[NSSet setWithArray:v13];
      [v12 setClasses:v14 forSelector:"recordVocabulary:forIntentSlot:withValidationCompletion:" argumentIndex:0 ofReply:0];

      v24[0] = objc_opt_class();
      v24[1] = objc_opt_class();
      uint64_t v15 = +[NSArray arrayWithObjects:v24 count:2];
      unsigned int v16 = +[NSSet setWithArray:v15];
      [v12 setClasses:v16 forSelector:"recordVocabulary:forIntentSlot:onBehalfOf:withValidationCompletion:" argumentIndex:0 ofReply:0];

      [v4 setExportedInterface:v12];
      __int16 v17 = [[ADIntentVocabularyUpdateConnection alloc] initWithBundleID:v9 path:v8 canDonateOnBehalfOfApps:AFConnectionHasEntitlement()];
      [v4 setExportedObject:v17];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000CDC70;
      v20[3] = &unk_10050A4D8;
      unsigned int v21 = v6;
      [v4 setInvalidationHandler:v20];
      [v4 resume];
    }
    else if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315650;
      __int16 v27 = "-[ADDaemon _synapseSyncListenerShouldAcceptNewConnection:]";
      __int16 v28 = 2112;
      *(void *)v29 = v4;
      *(_WORD *)&v29[8] = 1024;
      *(_DWORD *)&v29[10] = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s %@ Rejecting connection, because no kCFBundleIdentifierKey could be found for pid=%d but we expected it to be a .app bundle", buf, 0x1Cu);
    }
  }
  else
  {
    id v18 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315650;
      __int16 v27 = "-[ADDaemon _synapseSyncListenerShouldAcceptNewConnection:]";
      __int16 v28 = 2112;
      *(void *)v29 = v5;
      *(_WORD *)&v29[8] = 2114;
      *(void *)&v29[10] = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s no '%@' entitlement for connection %{public}@", buf, 0x20u);
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (id)_synapseAppBundleIDFromPossibleDeamonBundleID:(id)a3
{
  id v3 = (__CFString *)a3;
  if ([(__CFString *)v3 isEqualToString:@"com.apple.imagent"])
  {

    id v3 = @"com.apple.MobileSMS";
  }
  if ([&off_1005232D0 containsObject:v3])
  {

    id v3 = @"com.apple.mobileslideshow";
  }
  return v3;
}

- (void)_bundleID:(id *)a3 andPath:(id *)a4 forXPCConnection:(id)a5
{
  id v7 = a5;
  id v8 = v7;
  CFErrorRef error = 0;
  if (v7) {
    [v7 auditToken];
  }
  else {
    memset(&token, 0, sizeof(token));
  }
  unsigned __int8 v9 = SecTaskCreateWithAuditToken(0, &token);
  if (v9)
  {
    BOOL v10 = v9;
    dispatch_queue_t v11 = (__CFString *)SecTaskCopySigningIdentifier(v9, &error);
    CFErrorRef v12 = error;
    if (error)
    {
      unsigned int v13 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315650;
        __int16 v27 = "-[ADDaemon _bundleID:andPath:forXPCConnection:]";
        __int16 v28 = 2112;
        v29 = v8;
        __int16 v30 = 2112;
        v31 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Could not get signing identifier. Connection: %@, error:  %@", buf, 0x20u);
        CFErrorRef v12 = error;
      }
      CFRelease(v12);
    }
    if (!v11)
    {
      unsigned int v14 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        __int16 v27 = "-[ADDaemon _bundleID:andPath:forXPCConnection:]";
        __int16 v28 = 2112;
        v29 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Could not get the bundle identifier. Connection: %@", buf, 0x16u);
      }
    }
    CFRelease(v10);
    uint64_t v15 = 0;
    BOOL v16 = a4 != 0;
    if (a4 && v11)
    {
      id v23 = 0;
      uint64_t v15 = +[LSBundleRecord bundleRecordWithBundleIdentifier:v11 allowPlaceholder:0 error:&v23];
      __int16 v17 = (__CFString *)v23;
      if (!v15)
      {
        id v18 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          CFStringRef v19 = &stru_10050F7D8;
          *(_DWORD *)long long buf = 136315650;
          __int16 v27 = "-[ADDaemon _bundleID:andPath:forXPCConnection:]";
          __int16 v28 = 2112;
          if (v17) {
            CFStringRef v19 = v17;
          }
          v29 = v8;
          __int16 v30 = 2112;
          v31 = (void *)v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Could not get bundle path for other-side of XPC connection %@ %@", buf, 0x20u);
        }
      }

      BOOL v16 = 1;
    }
  }
  else
  {
    id v20 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      __int16 v27 = "-[ADDaemon _bundleID:andPath:forXPCConnection:]";
      __int16 v28 = 2112;
      v29 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s Could not create task with audit token. Connection: %@", buf, 0x16u);
    }
    dispatch_queue_t v11 = 0;
    uint64_t v15 = 0;
    BOOL v16 = a4 != 0;
  }
  unsigned int v21 = [v15 URL];
  id v22 = [v21 path];

  if (a3) {
    *a3 = v11;
  }
  if (v16) {
    *a4 = v22;
  }
}

- (void)_setupSynapseSyncListener
{
  id v3 = [(AFInstanceContext *)self->_instanceContext createXPCListenerWithMachServiceName:kINVocabularyUpdateServiceName];
  synapseSyncListener = self->_synapseSyncListener;
  self->_synapseSyncListener = v3;

  [(NSXPCListener *)self->_synapseSyncListener setDelegate:self];
  uint64_t v5 = self->_synapseSyncListener;
  [(NSXPCListener *)v5 resume];
}

- (void)_setupSettingsListener
{
  id v3 = [(AFInstanceContext *)self->_instanceContext createXPCListenerWithMachServiceName:kAssistantSettingsServiceName];
  settingsListener = self->_settingsListener;
  self->_settingsListener = v3;

  [(NSXPCListener *)self->_settingsListener setDelegate:self];
  [(NSXPCListener *)self->_settingsListener resume];
  if (AFIsInternalInstall())
  {
    uint64_t v5 = dispatch_get_global_queue(17, 0);
    dispatch_async(v5, &stru_100501050);
  }
}

- (BOOL)_settingsListenerShouldAcceptNewConnection:(id)a3
{
  id v3 = a3;
  uint64_t v4 = kAssistantSettingsEntitlement;
  if ((AFConnectionHasEntitlement() & 1) != 0
    || (uint64_t v5 = kAssistantClientEntitlement, (AFConnectionHasEntitlement() & 1) != 0))
  {
    unsigned int v6 = [v3 processIdentifier];
    id v7 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315650;
      v24 = "-[ADDaemon _settingsListenerShouldAcceptNewConnection:]";
      __int16 v25 = 2112;
      *(void *)id v26 = v3;
      *(_WORD *)&v26[8] = 1024;
      *(_DWORD *)&v26[10] = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %@ Settings Connection Connected (pid=%d)", buf, 0x1Cu);
    }
    id v8 = +[ADCommandCenter sharedCommandCenter];
    [v8 sanityCheckAutodownloadedAssetsForced:0];

    unsigned __int8 v9 = AFSettingsServiceDelegateXPCInterface();
    [v3 setRemoteObjectInterface:v9];

    BOOL v10 = AFSettingsServiceXPCInterface();
    [v3 setExportedInterface:v10];

    dispatch_queue_t v11 = [[ADSettingsClient alloc] initWithXPCConnection:v3];
    [v3 setExportedObject:v11];
    __int16 v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    CFStringRef v19 = sub_1000CE4B4;
    id v20 = &unk_1005012D0;
    unsigned int v21 = v11;
    unsigned int v22 = v6;
    CFErrorRef v12 = v11;
    [v3 setInvalidationHandler:&v17];
    objc_msgSend(v3, "resume", v17, v18, v19, v20);

    BOOL v13 = 1;
  }
  else
  {
    unsigned int v14 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      BOOL v16 = v14;
      *(_DWORD *)long long buf = 136315906;
      v24 = "-[ADDaemon _settingsListenerShouldAcceptNewConnection:]";
      __int16 v25 = 1024;
      *(_DWORD *)id v26 = [v3 processIdentifier];
      *(_WORD *)&v26[4] = 2112;
      *(void *)&v26[6] = v4;
      __int16 v27 = 2112;
      uint64_t v28 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s Rejecting attempt to connect by pid=%d because it is missing one of the entitlements %@ or %@ (either will do)", buf, 0x26u);
    }
    BOOL v13 = 0;
  }

  return v13;
}

- (void)_setupDictationListener
{
  id v3 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
  dictationPidSet = self->_dictationPidSet;
  self->_dictationPidSet = v3;

  uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  unsigned int v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INTERACTIVE, 0);

  id v7 = (OS_dispatch_queue *)dispatch_queue_create(0, v6);
  dictationListenerQueue = self->_dictationListenerQueue;
  self->_dictationListenerQueue = v7;

  unsigned __int8 v9 = [(AFInstanceContext *)self->_instanceContext createXPCListenerWithMachServiceName:kAssistantDictationServiceName];
  dictationListener = self->_dictationListener;
  self->_dictationListener = v9;

  [(NSXPCListener *)self->_dictationListener setDelegate:self];
  [(NSXPCListener *)self->_dictationListener _setQueue:self->_dictationListenerQueue];
  dispatch_queue_t v11 = self->_dictationListener;
  [(NSXPCListener *)v11 resume];
}

- (BOOL)_dictationListenerShouldAcceptNewConnection:(id)a3
{
  id v4 = a3;
  id v5 = [v4 processIdentifier];
  unsigned int v6 = +[NSNumber numberWithInt:v5];
  id v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    uint64_t v28 = "-[ADDaemon _dictationListenerShouldAcceptNewConnection:]";
    __int16 v29 = 2112;
    id v30 = v4;
    __int16 v31 = 1024;
    int v32 = (int)v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %@ Dictation Connection Connected (pid=%d])", buf, 0x1Cu);
  }
  NSUInteger v8 = [(NSCountedSet *)self->_dictationPidSet countForObject:v6];
  if (v8 >= 0x10)
  {
    __int16 v17 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v28 = "-[ADDaemon _dictationListenerShouldAcceptNewConnection:]";
      __int16 v29 = 1024;
      LODWORD(v30) = v5;
      _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "%s Too many connections from pid %d, refusing connection", buf, 0x12u);
    }
  }
  else
  {
    unsigned __int8 v9 = +[ADQueueMonitor sharedMonitor];
    [v9 beginMonitoring];

    BOOL v10 = +[ADAnalyticsService sharedService];
    [v10 beginEventsGrouping];

    [(NSCountedSet *)self->_dictationPidSet addObject:v6];
    dispatch_queue_t v11 = AFDictationServiceDelegateXPCInterface();
    [v4 setRemoteObjectInterface:v11];

    CFErrorRef v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___AFDictationService];
    [v4 setExportedInterface:v12];

    BOOL v13 = [v4 remoteObjectProxy];
    unsigned int v14 = [[ADDictationConnection alloc] initWithServiceDelegate:v13];
    [v4 setExportedObject:v14];
    uint64_t v15 = [(ADDictationConnection *)v14 queue];
    [v4 _setQueue:v15];

    CFStringRef v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    unsigned int v21 = sub_1000CE960;
    unsigned int v22 = &unk_10050B6A8;
    int v26 = (int)v5;
    id v23 = v14;
    v24 = self;
    id v25 = v6;
    BOOL v16 = v14;
    [v4 setInvalidationHandler:&v19];
    objc_msgSend(v4, "resume", v19, v20, v21, v22);
  }
  return v8 < 0x10;
}

- (void)startUISpeechRequest
{
}

- (void)startUIRequestWithInfo:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CEBD4;
  block[3] = &unk_10050E138;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (BOOL)_clientListenerShouldAcceptNewConnection:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 processIdentifier];
  id v36 = 0;
  [(ADDaemon *)self _bundleID:&v36 andPath:0 forXPCConnection:v4];
  id v6 = v36;
  if ((AFIsHorseman() & 1) != 0 || ![v6 isEqualToString:@"com.apple.springboard"])
  {
    uint64_t v12 = kAssistantClientEntitlement;
    if ((AFConnectionHasEntitlement() & 1) == 0)
    {
      __int16 v29 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v43 = 136315650;
        *(void *)&v43[4] = "-[ADDaemon _clientListenerShouldAcceptNewConnection:]";
        *(_WORD *)&v43[12] = 1024;
        *(_DWORD *)&v43[14] = v5;
        *(_WORD *)&v43[18] = 2112;
        *(void *)&v43[20] = v12;
        unsigned __int8 v9 = "%s Rejecting connection attempt by PID %d because it is missing the entitlement %@";
        BOOL v10 = v29;
        uint32_t v11 = 28;
        goto LABEL_21;
      }
LABEL_18:
      BOOL v28 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v7 = kAssistantClientEntitlement;
    if ((AFConnectionHasEntitlementCached() & 1) == 0)
    {
      id v8 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v43 = 136315650;
        *(void *)&v43[4] = "-[ADDaemon _clientListenerShouldAcceptNewConnection:]";
        *(_WORD *)&v43[12] = 2112;
        *(void *)&v43[14] = v6;
        *(_WORD *)&v43[22] = 2112;
        *(void *)&v43[24] = v7;
        unsigned __int8 v9 = "%s Rejecting connection attempt by %@ because it is missing the entitlement %@";
        BOOL v10 = v8;
        uint32_t v11 = 32;
LABEL_21:
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v9, v43, v11);
        goto LABEL_18;
      }
      goto LABEL_18;
    }
  }
  *(void *)v43 = 0;
  *(void *)&v43[8] = v43;
  *(void *)&v43[16] = 0x3032000000;
  *(void *)&v43[24] = sub_1000CC01C;
  v44 = sub_1000CC02C;
  id v45 = (id)os_transaction_create();
  BOOL v13 = +[ADQueueMonitor sharedMonitor];
  [v13 beginMonitoring];

  unsigned int v14 = +[ADAnalyticsService sharedService];
  [v14 beginEventsGrouping];

  if (AFIsNano() && (AFDeviceSupportsSiriUOD() & 1) == 0)
  {
    uint64_t v15 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      v38 = "-[ADDaemon _clientListenerShouldAcceptNewConnection:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Preheating session on client connection", buf, 0xCu);
    }
    BOOL v16 = +[ADCommandCenter sharedCommandCenter];
    [v16 preheatWithStyle:3 forOptions:0 completion:0];
  }
  __int16 v17 = +[ADCommandCenter sharedCommandCenter];
  if (AFIsHorseman()) {
    [v17 showingVisibleAssistantUIForReason:@"ADLocationInUseReasonHorsemanConnected" completion:0];
  }
  uint64_t v18 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    v38 = "-[ADDaemon _clientListenerShouldAcceptNewConnection:]";
    __int16 v39 = 2112;
    id v40 = v4;
    __int16 v41 = 1024;
    unsigned int v42 = v5;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s %@ Client Connection Connected (pid=%d])", buf, 0x1Cu);
  }
  CFStringRef v19 = AFClientServiceDelegateXPCInterface();
  [v4 setRemoteObjectInterface:v19];

  uint64_t v20 = AFClientServiceXPCInterface();
  [v4 setExportedInterface:v20];

  unsigned int v21 = (id)qword_100585E48;
  unsigned int v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v23 = dispatch_queue_attr_make_with_qos_class(v22, QOS_CLASS_UNSPECIFIED, 0);

  dispatch_queue_t v24 = dispatch_queue_create_with_target_V2(0, v23, v21);
  [v4 _setQueue:v24];

  id v25 = [[ADClientConnection alloc] initWithXPCConnection:v4];
  [v4 setExportedObject:v25];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000CF160;
  v31[3] = &unk_100501010;
  int v26 = v25;
  int v32 = v26;
  unsigned int v35 = v5;
  id v27 = v17;
  id v33 = v27;
  v34 = v43;
  [v4 setInvalidationHandler:v31];
  [v27 clientConnected:v26];
  [v4 resume];

  _Block_object_dispose(v43, 8);
  BOOL v28 = 1;
LABEL_19:

  return v28;
}

- (void)_setupClientListener
{
  id v3 = [(AFInstanceContext *)self->_instanceContext createXPCListenerWithMachServiceName:kAssistantClientServiceName];
  clientListener = self->_clientListener;
  self->_clientListener = v3;

  [(NSXPCListener *)self->_clientListener setDelegate:self];
  unsigned int v5 = self->_clientListener;
  id v6 = (id)qword_100585E48;
  uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UNSPECIFIED, 0);

  dispatch_queue_t v9 = dispatch_queue_create_with_target_V2(0, v8, v6);
  [(NSXPCListener *)v5 _setQueue:v9];

  BOOL v10 = self->_clientListener;
  [(NSXPCListener *)v10 resume];
}

- (id)_peerLocationService
{
  if (!self->_peerLocationManagerRemote && AFSupportsPairedDevice())
  {
    id v3 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      dispatch_queue_t v9 = "-[ADDaemon _peerLocationService]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Starting Peer Location Service", (uint8_t *)&v8, 0xCu);
    }
    id v4 = objc_alloc_init(ADPeerLocationRemote);
    peerLocationManagerRemote = self->_peerLocationManagerRemote;
    self->_peerLocationManagerRemote = v4;
  }
  id v6 = self->_peerLocationManagerRemote;
  return v6;
}

- (id)_proxyService
{
  if (!self->_proxyRemote && AFSupportsPairedDevice())
  {
    id v3 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      dispatch_queue_t v9 = "-[ADDaemon _proxyService]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Starting Siri Connection Proxy", (uint8_t *)&v8, 0xCu);
    }
    id v4 = objc_alloc_init(ADSiriConnectionRemote);
    proxyRemote = self->_proxyRemote;
    self->_proxyRemote = v4;
  }
  id v6 = self->_proxyRemote;
  return v6;
}

- (void)_setupIDSServices
{
  if ((AFIsNano() & 1) == 0)
  {
    id v3 = [(ADDaemon *)self _proxyService];
    id v4 = [(ADDaemon *)self _peerLocationService];
  }
  unsigned int v5 = +[ADCommandCenter sharedCommandCenter];
  id v6 = [v5 _sharedDataService];

  uint64_t v7 = +[ADCommandCenter sharedCommandCenter];
  [v7 listenForSharedDataFromCloud];

  id v8 = +[ADPeerCloudService sharedInstance];
  [v8 startListeningForRemote];
}

- (BOOL)_locationServiceListenerShouldAcceptNewConnection:(id)a3
{
  id v3 = a3;
  char HasEntitlement = AFConnectionHasEntitlement();
  if (HasEntitlement)
  {
    unsigned int v5 = [v3 processIdentifier];
    id v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315650;
      BOOL v13 = "-[ADDaemon _locationServiceListenerShouldAcceptNewConnection:]";
      __int16 v14 = 2112;
      id v15 = v3;
      __int16 v16 = 1024;
      unsigned int v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s %@ Location Service Connection Connected (pid=%d])", (uint8_t *)&v12, 0x1Cu);
    }
    uint64_t v7 = +[ADLocationService sharedService];
    id v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___AFLocationServiceInterface];
    [v3 setExportedInterface:v8];

    [v3 setExportedObject:v7];
    dispatch_queue_t v9 = [v7 dispatchQueue];
    [v3 _setQueue:v9];

    [v3 resume];
  }
  else
  {
    BOOL v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      BOOL v13 = "-[ADDaemon _locationServiceListenerShouldAcceptNewConnection:]";
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s %@ Location Service Connection does not have required entitlements.", (uint8_t *)&v12, 0x16u);
    }
  }

  return HasEntitlement;
}

- (void)_setupLocationServiceListener
{
  id v3 = [(AFInstanceContext *)self->_instanceContext createXPCListenerWithMachServiceName:kAFLocationServiceMachServiceName];
  locationServiceListener = self->_locationServiceListener;
  self->_locationServiceListener = v3;

  [(NSXPCListener *)self->_locationServiceListener setDelegate:self];
  unsigned int v5 = self->_locationServiceListener;
  id v6 = +[ADLocationService sharedService];
  uint64_t v7 = [v6 dispatchQueue];
  [(NSXPCListener *)v5 _setQueue:v7];

  id v8 = self->_locationServiceListener;
  [(NSXPCListener *)v8 resume];
}

- (void)_setupLocationService
{
  id v2 = +[ADLocationService sharedService];
}

- (void)_setupRapportServices
{
  if (AFIsHorseman()) {
    id v3 = +[ADMyriadService sharedService];
  }
  id v4 = +[ADCoreSpeechService sharedService];
  unsigned int v5 = +[ADCompanionService sharedInstance];
  [v5 startListeningForRemote];

  queue = self->_queue;
  xpc_set_event_stream_handler("com.apple.rapport.matching", queue, &stru_100500FE8);
}

- (void)_setupInternal
{
  if (AFIsInternalInstall() && _AFPreferencesNetworkLoggingEnabled())
  {
    id v2 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v3 = 136315138;
      id v4 = "-[ADDaemon _setupInternal]";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s Enabling CFNetwork diagnostics", (uint8_t *)&v3, 0xCu);
    }
    setenv("CFNETWORK_DIAGNOSTICS", "3", 1);
    setenv("CFNETWORK_DIAGNOSTICS_NO_SYSLOG", "1", 1);
  }
}

- (void)keepAlive
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = sub_1000CC01C;
  v6[4] = sub_1000CC02C;
  id v7 = (id)os_transaction_create();
  dispatch_time_t v3 = dispatch_time(0, 10000000000);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CFC58;
  block[3] = &unk_10050E318;
  void block[4] = v6;
  dispatch_after(v3, queue, block);
  _Block_object_dispose(v6, 8);
}

- (void)shutdown
{
}

- (void)runWithLaunchContext:(id)a3
{
  id v6 = a3;
  CFBundleGetMainBundle();
  [(ADDaemon *)self _daemonDidLaunchWithContext:v6];
  unsigned int v5 = +[NSRunLoop mainRunLoop];
  [v5 run];
}

- (void)dealloc
{
  [(NSXPCListener *)self->_clientListener setDelegate:0];
  [(NSXPCListener *)self->_dictationListener setDelegate:0];
  [(NSXPCListener *)self->_settingsListener setDelegate:0];
  [(NSXPCListener *)self->_synapseSyncListener setDelegate:0];
  [(NSXPCListener *)self->_managedStorageListener setDelegate:0];
  [(NSXPCListener *)self->_analyticsListener setDelegate:0];
  [(NSXPCListener *)self->_securityListener setDelegate:0];
  [(NSXPCListener *)self->_analyticsObservationListener setDelegate:0];
  [(NSXPCListener *)self->_notificationServiceListener setDelegate:0];
  [(NSXPCListener *)self->_audioSessionAssertionServiceListener setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)ADDaemon;
  [(ADDaemon *)&v3 dealloc];
}

- (ADDaemon)init
{
  v9.receiver = self;
  v9.super_class = (Class)ADDaemon;
  id v2 = [(ADDaemon *)&v9 init];
  if (v2)
  {
    objc_super v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, 0);

    unsigned int v5 = dispatch_queue_attr_make_initially_inactive(v4);

    dispatch_queue_t v6 = dispatch_queue_create("ADDaemon", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

+ (unint64_t)processLoadedMachTime
{
  return qword_1005859E0;
}

+ (unint64_t)processLaunchMachTime
{
  return qword_1005859D8;
}

+ (double)processLaunchTime
{
  return *(double *)&qword_1005859D0;
}

+ (id)sharedDaemon
{
  if (qword_1005859C8 != -1) {
    dispatch_once(&qword_1005859C8, &stru_100500FC8);
  }
  id v2 = (void *)qword_1005859C0;
  return v2;
}

@end