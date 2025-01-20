@interface CALNNotificationServerModule
+ (id)_createNotificationStorageAtPath:(id)a3 protected:(BOOL)a4;
+ (id)_createTimeToLeaveRefreshStorageAtPath:(id)a3;
+ (id)_createTriggeredEventNotificationDataStorageAtPath:(id)a3 protected:(BOOL)a4;
+ (id)_filesToMigrate;
+ (id)_notificationStoragePathWithName:(id)a3;
+ (id)_protectedCalendarNotificationStorage;
+ (id)_protectedTriggeredEventNotificationDataStorage;
+ (id)_timeToLeaveRefreshStorage;
+ (id)_timeToLeaveRefreshStoragePathWithName:(id)a3;
+ (id)_triggeredEventNotificationDataStoragePathWithName:(id)a3;
+ (id)_unprotectedCalendarNotificationStorage;
+ (id)_unprotectedTriggeredEventNotificationDataStorage;
+ (void)_migrateNotificationFiles;
+ (void)_migrateNotificationFilesFromDirectory:(id)a3 toDirectory:(id)a4;
+ (void)_setProtectedClassForStorageAtPath:(id)a3;
- (CALNCalendarAppBadgeUpdater)calendarAppBadgeUpdater;
- (CALNInboxNotificationMonitor)inboxNotificationMonitor;
- (CALNNotificationIconCache)iconCache;
- (CALNNotificationIconProvider)iconProvider;
- (CALNNotificationServer)calendarNotificationServer;
- (CALNNotificationServerModule)init;
- (CALNNotificationSourceRefresher)notificationSourceRefresher;
- (CALNNotificationStorageWrapper)calendarStorageWrapper;
- (CALNSchedulingSnoozeUpdateTimer)snoozeUpdateTimer;
- (CALNTriggeredEventNotificationSource)triggeredEventNotificationSource;
- (NSArray)modules;
- (id)_createCalendarNotificationServerWithUserNotificationCenterFactory:(id)a3 storage:(id)a4 eventStoreProvider:(id)a5 alarmEngineMonitor:(id)a6 travelEngine:(id)a7 timeToLeaveRefreshMonitor:(id)a8 timeToLeaveRefreshStorage:(id)a9;
- (id)_createNotificationServerWithUserNotificationCenter:(id)a3 storage:(id)a4 eventStoreProvider:(id)a5 alarmEngineMonitor:(id)a6 travelEngine:(id)a7 timeToLeaveRefreshMonitor:(id)a8 timeToLeaveRefreshStorage:(id)a9;
- (id)_createNotificationSourcesWithNotificationManager:(id)a3 eventStoreProvider:(id)a4 inboxNotificationProvider:(id)a5 alarmEngineMonitor:(id)a6 travelEngine:(id)a7 timeToLeaveRefreshMonitor:(id)a8 timeToLeaveRefreshStorage:(id)a9;
- (void)_registerSettingsCaptureHandlers;
- (void)_reloadNotificationRecords:(id)a3 forNotificationServer:(id)a4;
- (void)_reloadNotificationsAfterFirstUnlock;
- (void)_reloadNotificationsFromUnprotectedStorage:(id)a3 intoProtectedStorage:(id)a4 withStorageWrapper:(id)a5 forNotificationServer:(id)a6;
- (void)_reloadTriggeredEventNotificationData;
- (void)_removeNotificationsFromUnprotectedStorage:(id)a3;
- (void)_updateLocaleReloadIfDifferent:(BOOL)a3;
- (void)_updateSourceClientIdentifiersIfNeeded;
- (void)activate;
- (void)deactivate;
- (void)didRegisterForAlarms;
- (void)protectedDataDidBecomeAvailable;
- (void)receivedAlarmNamed:(id)a3;
- (void)receivedNotificationNamed:(id)a3;
- (void)refreshEventStoreInResponseToDatabaseChangeNotification:(id)a3;
- (void)updateIconsToNewVersionIfNeeded;
@end

@implementation CALNNotificationServerModule

- (void)receivedNotificationNamed:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)os_transaction_create();
  if ([v4 isEqualToString:*MEMORY[0x263F2FE40]]) {
    [(CALNNotificationServerModule *)self refreshEventStoreInResponseToDatabaseChangeNotification:v4];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = [(CALNNotificationServerModule *)self modules];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v10++) receivedNotificationNamed:v4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if ([v4 isEqualToString:*MEMORY[0x263F30108]])
  {
    v11 = [(CALNNotificationServerModule *)self notificationSourceRefresher];
    [v11 refreshNotifications];

    v12 = [(CALNNotificationServerModule *)self snoozeUpdateTimer];
    [v12 significantTimeChange];
LABEL_16:

    goto LABEL_17;
  }
  if (([v4 isEqualToString:*MEMORY[0x263F04AC0]] & 1) != 0
    || ([v4 isEqualToString:*MEMORY[0x263F04B00]] & 1) != 0
    || [v4 isEqualToString:*MEMORY[0x263F2FE48]])
  {
    v12 = [(CALNNotificationServerModule *)self notificationSourceRefresher];
    [v12 refreshNotifications];
    goto LABEL_16;
  }
LABEL_17:
}

- (NSArray)modules
{
  return self->_modules;
}

id __36__CALNNotificationServerModule_init__block_invoke(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F04B98]) initWithEKOptions:256 path:0 changeTrackingClientId:0 enablePropertyModificationLogging:1 allowDelegateSources:1];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    objc_storeWeak(WeakRetained + 2, v2);
  }

  return v2;
}

- (CALNNotificationServerModule)init
{
  v53[5] = *MEMORY[0x263EF8340];
  v52.receiver = self;
  v52.super_class = (Class)CALNNotificationServerModule;
  v2 = [(CALNNotificationServerModule *)&v52 init];
  if (v2)
  {
    v3 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Creating notification server module", (uint8_t *)&buf, 2u);
    }

    +[CALNNotificationServerModule _migrateNotificationFiles];
    unsigned int v48 = [MEMORY[0x263F30020] hasBeenUnlockedSinceBoot];
    id v4 = [CALNNotificationStorageWrapper alloc];
    v5 = objc_opt_class();
    if (v48) {
      [v5 _protectedCalendarNotificationStorage];
    }
    else {
    v6 = [v5 _unprotectedCalendarNotificationStorage];
    }
    uint64_t v7 = [(CALNNotificationStorageWrapper *)v4 initWithWrappedStorage:v6];
    calendarStorageWrapper = v2->_calendarStorageWrapper;
    v2->_calendarStorageWrapper = (CALNNotificationStorageWrapper *)v7;

    objc_initWeak(&buf, v2);
    id v9 = objc_alloc(MEMORY[0x263F04B88]);
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __36__CALNNotificationServerModule_init__block_invoke;
    v49[3] = &unk_2645C1560;
    objc_copyWeak(&v50, &buf);
    uint64_t v10 = [v9 initWithCreationBlock:v49];
    eventStoreProvider = v2->_eventStoreProvider;
    v2->_eventStoreProvider = (EKEphemeralCacheEventStoreProvider *)v10;

    v12 = [[CALNInboxNotificationMonitor alloc] initWithEventStoreProvider:v2->_eventStoreProvider];
    inboxNotificationMonitor = v2->_inboxNotificationMonitor;
    v2->_inboxNotificationMonitor = v12;

    long long v14 = objc_alloc_init(_EKAlarmEngine);
    uint64_t v15 = [MEMORY[0x263F08A00] defaultCenter];
    long long v16 = [[CALNEKAlarmEngineMonitor alloc] initWithAlarmEngine:v14 notificationCenter:v15];
    v46 = v14;
    v47 = (void *)v15;
    v17 = [MEMORY[0x263F04B80] shared];
    LODWORD(v15) = [v17 syntheticTravelAdvisoriesEnabled];

    uint64_t v18 = off_2645C0700;
    if (!v15) {
      uint64_t v18 = off_2645C0520;
    }
    uint64_t v19 = [(__objc2_class *)*v18 sharedInstance];
    v20 = [[EKTravelEngine alloc] initWithRouteHypothesizerProvider:v19];
    v21 = [[CALNEKTravelEngine alloc] initWithTravelEngine:v20];
    v22 = [(id)objc_opt_class() _timeToLeaveRefreshStorage];
    v44 = (void *)v19;
    v45 = v20;
    v23 = [[CALNDefaultTimeToLeaveRefreshMonitor alloc] initWithStorage:v22];
    v24 = +[CALNUNUserNotificationCenterFactory sharedInstance];
    uint64_t v25 = +[CALNCUIKIconProvider sharedInstance];
    iconProvider = v2->_iconProvider;
    v2->_iconProvider = (CALNNotificationIconProvider *)v25;

    v27 = [[CALNNotificationIconCache alloc] initWithIconProvider:v2->_iconProvider];
    iconCache = v2->_iconCache;
    v2->_iconCache = v27;

    v29 = [(CALNNotificationServerModule *)v2 _createCalendarNotificationServerWithUserNotificationCenterFactory:v24 storage:v2->_calendarStorageWrapper eventStoreProvider:v2->_eventStoreProvider alarmEngineMonitor:v16 travelEngine:v21 timeToLeaveRefreshMonitor:v23 timeToLeaveRefreshStorage:v22];
    id v30 = v29;
    v31 = [v30 notificationSources];
    objc_storeStrong((id *)&v2->_calendarNotificationServer, v29);
    v32 = [CALNNotificationSourceRefresher alloc];
    v33 = [(CALNNotificationServerModule *)v2 inboxNotificationMonitor];
    uint64_t v34 = [(CALNNotificationSourceRefresher *)v32 initWithSources:v31 notificationMonitor:v33 notificationManager:v30];
    notificationSourceRefresher = v2->_notificationSourceRefresher;
    v2->_notificationSourceRefresher = (CALNNotificationSourceRefresher *)v34;

    v36 = [CALNCalendarAppBadgeUpdater alloc];
    v37 = [(CALNNotificationServerModule *)v2 inboxNotificationMonitor];
    uint64_t v38 = [(CALNCalendarAppBadgeUpdater *)v36 initWithInboxNotificationMonitor:v37];
    calendarAppBadgeUpdater = v2->_calendarAppBadgeUpdater;
    v2->_calendarAppBadgeUpdater = (CALNCalendarAppBadgeUpdater *)v38;

    v40 = v2->_inboxNotificationMonitor;
    v53[0] = v2->_calendarNotificationServer;
    v53[1] = v40;
    v53[2] = v16;
    v53[3] = v21;
    v53[4] = v23;
    uint64_t v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:5];
    modules = v2->_modules;
    v2->_modules = (NSArray *)v41;

    if (v48)
    {
      [(CALNNotificationServerModule *)v2 _reloadTriggeredEventNotificationData];
      [(CALNTriggeredEventNotificationSource *)v2->_triggeredEventNotificationSource updateSnoozeOptionsForPostedNotifications];
    }
    [(CALNNotificationServerModule *)v2 _updateLocaleReloadIfDifferent:v48];
    [(CALNNotificationServerModule *)v2 _registerSettingsCaptureHandlers];

    objc_destroyWeak(&v50);
    objc_destroyWeak(&buf);
  }
  return v2;
}

- (void)updateIconsToNewVersionIfNeeded
{
  id v9 = objc_alloc_init(CALNDefaultIconIdentifierVersionProvider);
  v3 = [CALNNotificationIconUpdater alloc];
  id v4 = [(id)objc_opt_class() _protectedCalendarNotificationStorage];
  v5 = [(CALNNotificationServerModule *)self iconCache];
  v6 = [(CALNNotificationServerModule *)self iconProvider];
  uint64_t v7 = [(CALNNotificationServerModule *)self calendarNotificationServer];
  uint64_t v8 = [(CALNNotificationIconUpdater *)v3 initWithIconIdentifierVersionProvider:v9 protectedNotificationStorage:v4 iconCache:v5 iconIdentifierProvider:v6 notificationManager:v7];

  [(CALNNotificationIconUpdater *)v8 updateIconsToNewVersionIfNeeded];
}

- (id)_createCalendarNotificationServerWithUserNotificationCenterFactory:(id)a3 storage:(id)a4 eventStoreProvider:(id)a5 alarmEngineMonitor:(id)a6 travelEngine:(id)a7 timeToLeaveRefreshMonitor:(id)a8 timeToLeaveRefreshStorage:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  v23 = [CALNUNUserNotificationCenter alloc];
  v24 = [(CALNUNUserNotificationCenter *)v23 initWithBundleIdentifier:*MEMORY[0x263F300B0] userNotificationCenterFactory:v22 storage:v21 notificationIconCache:self->_iconCache];

  uint64_t v25 = [(CALNNotificationServerModule *)self _createNotificationServerWithUserNotificationCenter:v24 storage:v21 eventStoreProvider:v20 alarmEngineMonitor:v19 travelEngine:v18 timeToLeaveRefreshMonitor:v17 timeToLeaveRefreshStorage:v16];

  return v25;
}

- (id)_createNotificationServerWithUserNotificationCenter:(id)a3 storage:(id)a4 eventStoreProvider:(id)a5 alarmEngineMonitor:(id)a6 travelEngine:(id)a7 timeToLeaveRefreshMonitor:(id)a8 timeToLeaveRefreshStorage:(id)a9
{
  id v27 = a9;
  id v28 = a8;
  id v26 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = [(CALNNotificationServerModule *)self inboxNotificationMonitor];
  id v21 = +[CALNCalAnalyticsHandler sharedInstance];
  id v22 = objc_alloc_init(MEMORY[0x263F30020]);
  v23 = [[CALNNotificationServer alloc] initWithUserNotificationCenter:v19 storage:v18 analyticsHandler:v21 deviceLockObserver:v22];

  v24 = [(CALNNotificationServerModule *)self _createNotificationSourcesWithNotificationManager:v23 eventStoreProvider:v17 inboxNotificationProvider:v20 alarmEngineMonitor:v16 travelEngine:v26 timeToLeaveRefreshMonitor:v28 timeToLeaveRefreshStorage:v27];

  [(CALNNotificationServer *)v23 setNotificationSources:v24];
  return v23;
}

- (id)_createNotificationSourcesWithNotificationManager:(id)a3 eventStoreProvider:(id)a4 inboxNotificationProvider:(id)a5 alarmEngineMonitor:(id)a6 travelEngine:(id)a7 timeToLeaveRefreshMonitor:(id)a8 timeToLeaveRefreshStorage:(id)a9
{
  v94[9] = *MEMORY[0x263EF8340];
  id v70 = a9;
  id v66 = a8;
  id v64 = a7;
  id v68 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = +[CALNDefaultEKCalendarNotificationReferenceProvider sharedInstance];
  uint64_t v19 = +[CALNCUIKIconProvider sharedInstance];
  v92 = +[CALNNullRemoteMutator sharedInstance];
  v93 = +[CALNDataAccessExpressSharedConnection sharedConnection];
  uint64_t v20 = +[CALNEKUIEventRepresentationProvider sharedInstance];
  v91 = +[CALNEKUIEventRepresentationProvider sharedInstance];
  id v21 = [MEMORY[0x263F30058] sharedInstance];
  id v22 = [CALNEventInvitationNotificationEKDataSource alloc];
  v23 = [MEMORY[0x263F04B50] calendarPreferences];
  v85 = [(CALNEventInvitationNotificationEKDataSource *)v22 initWithEventStoreProvider:v16 inboxNotificationProvider:v15 notificationReferenceProvider:v18 remoteMutator:v92 dataSourceEventRepresentationProvider:v20 preferences:v23];

  v82 = [[CALNEventInvitationNotificationSource alloc] initWithDataSource:v85 notificationManager:v17 iconIdentifierProvider:v19 dateProvider:v21];
  v24 = [CALNEventInvitationResponseNotificationEKDataSource alloc];
  uint64_t v25 = [MEMORY[0x263F04B50] calendarPreferences];
  v63 = v15;
  v87 = (void *)v18;
  v84 = [(CALNEventInvitationResponseNotificationEKDataSource *)v24 initWithEventStoreProvider:v16 inboxNotificationProvider:v15 notificationReferenceProvider:v18 dataSourceEventRepresentationProvider:v20 preferences:v25];

  v86 = (void *)v19;
  v78 = [[CALNEventInvitationResponseNotificationSource alloc] initWithDataSource:v84 notificationManager:v17 iconIdentifierProvider:v19 dateProvider:v21];
  id v26 = [CALNEventCanceledNotificationEKDataSource alloc];
  id v27 = [MEMORY[0x263F04B50] calendarPreferences];
  v81 = (void *)v20;
  v83 = [(CALNEventCanceledNotificationEKDataSource *)v26 initWithEventStoreProvider:v16 inboxNotificationProvider:v15 notificationReferenceProvider:v18 remoteMutator:v92 dataSourceEventRepresentationProvider:v20 preferences:v27];

  v72 = [[CALNEventCanceledNotificationSource alloc] initWithDataSource:v83 notificationManager:v17 iconIdentifierProvider:v19 dateProvider:v21];
  v80 = +[CALNCLCoreLocationProvider sharedInstance];
  v77 = +[CALNEKTTLEventTracker sharedInstance];
  v79 = +[CALNEKFoundInAppsEventTracker sharedInstance];
  v76 = +[CALNEKSuggestionsServiceLogger sharedInstance];
  v75 = +[CALNGEORouteHypothesizerProvider sharedInstance];
  v74 = +[CALNEKDebugPreferences sharedInstance];
  id v28 = [CALNTriggeredEventNotificationMailtoURLProvider alloc];
  v29 = +[CALNMSMailAccounts sharedInstance];
  v73 = [(CALNTriggeredEventNotificationMailtoURLProvider *)v28 initWithMailAccounts:v29];

  v88 = [[CALNTriggeredEventNotificationEKDataSource alloc] initWithEventStoreProvider:v16 remoteMutator:v92 dataSourceEventRepresentationProvider:v20 coreLocationProvider:v80 ttlEventTracker:v77 alarmEngineMonitor:v68 travelEngine:v64 foundInAppsEventTracker:v79 suggestionsServiceLogger:v76 routeHypothesizerProvider:v75 timeToLeaveRefreshMonitor:v66 debugPreferences:v74 mailtoURLProvider:v73];
  v69 = objc_alloc_init(CALNDefaultTravelAdvisoryAuthority);
  v61 = [[CALNDefaultTriggeredEventNotificationTriggerHelper alloc] initWithTravelAdvisoryAuthority:v69 dateProvider:v21];
  v60 = [[CALNDefaultTriggeredEventNotificationTransitionProvider alloc] initWithTravelAdvisoryAuthority:v69 dateProvider:v21];
  v67 = objc_alloc_init(CALNCUIKTravelAdvisoryDescriptionGenerator);
  v59 = [[CALNDefaultTriggeredEventNotificationBodyDescriptionProvider alloc] initWithTravelAdvisoryDescriptionGenerator:v67 dateProvider:v21];
  v65 = (void *)[objc_alloc(MEMORY[0x263F04C08]) initWithDateProvider:v21];
  v57 = [[CALNEKTravelAdvisoryTimelinessAuthority alloc] initWithTravelAdvisoryTimelinessAuthority:v65];
  v56 = [(id)objc_opt_class() _unprotectedTriggeredEventNotificationDataStorage];
  v55 = +[CALNLaunchServicesURLHandler sharedInstance];
  v54 = +[CALNDefaultTriggeredEventNotificationMapItemURLProvider sharedInstance];
  xpc_object_t v62 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v62, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8290]);
  v58 = [[CALNXPCActivityScheduler alloc] initWithActivityIdentifier:@"com.apple.calendar.notification.snoozeRefresh" otherCriteria:v62];
  id v30 = [[CALNSchedulingSnoozeUpdateTimer alloc] initWithDateProvider:v21 scheduler:v58];
  snoozeUpdateTimer = self->_snoozeUpdateTimer;
  self->_snoozeUpdateTimer = v30;

  v32 = [[CALNTriggeredEventNotificationSource alloc] initWithDataSource:v88 notificationManager:v17 iconIdentifierProvider:v19 sourceEventRepresentationProvider:v91 triggerHelper:v61 transitionProvider:v60 bodyDescriptionProvider:v59 travelAdvisoryTimelinessAuthority:v57 dateProvider:v21 notificationDataStorage:v56 urlHandler:v55 mapItemURLProvider:v54 timeToLeaveRefreshStorage:v70 snoozeUpdateTimer:self->_snoozeUpdateTimer];
  triggeredEventNotificationSource = self->_triggeredEventNotificationSource;
  self->_triggeredEventNotificationSource = v32;

  uint64_t v34 = [CALNSharedCalendarInvitationNotificationEKDataSource alloc];
  v35 = [MEMORY[0x263F04B50] calendarPreferences];
  v36 = v16;
  uint64_t v37 = v18;
  v71 = [(CALNSharedCalendarInvitationNotificationEKDataSource *)v34 initWithEventStoreProvider:v36 inboxNotificationProvider:v63 notificationReferenceProvider:v18 dataAccessExpressConnection:v93 preferences:v35];

  objc_super v52 = [[CALNSharedCalendarInvitationNotificationSource alloc] initWithDataSource:v71 notificationManager:v17 iconIdentifierProvider:v19 sourceEventRepresentationProvider:v91];
  uint64_t v38 = [CALNSharedCalendarInvitationResponseNotificationEKDataSource alloc];
  v39 = [MEMORY[0x263F04B50] calendarPreferences];
  v53 = [(CALNSharedCalendarInvitationResponseNotificationEKDataSource *)v38 initWithEventStoreProvider:v36 inboxNotificationProvider:v63 notificationReferenceProvider:v18 preferences:v39];

  v40 = [[CALNSharedCalendarInvitationResponseNotificationSource alloc] initWithDataSource:v53 notificationManager:v17 iconIdentifierProvider:v19 sourceEventRepresentationProvider:v91];
  uint64_t v41 = [CALNCalendarResourceChangedNotificationEKDataSource alloc];
  v42 = [MEMORY[0x263F04B50] calendarPreferences];
  v43 = v41;
  uint64_t v44 = v37;
  v45 = [(CALNCalendarResourceChangedNotificationEKDataSource *)v43 initWithEventStoreProvider:v36 inboxNotificationProvider:v63 notificationReferenceProvider:v37 preferences:v42];

  v46 = [[CALNCalendarResourceChangedNotificationSource alloc] initWithDataSource:v45 notificationManager:v17 iconIdentifierProvider:v19 sourceEventRepresentationProvider:v91 dateProvider:v21];
  v47 = [[CALNSuggestedEventNotificationEKDataSource alloc] initWithEventStoreProvider:v36 inboxNotificationProvider:v63 notificationReferenceProvider:v44];

  unsigned int v48 = [[CALNSuggestedEventNotificationSource alloc] initWithDataSource:v47 notificationManager:v17 iconIdentifierProvider:v19];
  v49 = [[CALNFakeNotificationSource alloc] initWithNotificationManager:v17 iconIdentifierProvider:v86 sourceIdentifierSuffix:@"calendar"];

  v94[0] = v82;
  v94[1] = v78;
  id v50 = self->_triggeredEventNotificationSource;
  v94[2] = v72;
  v94[3] = v50;
  v94[4] = v52;
  v94[5] = v40;
  v94[6] = v46;
  v94[7] = v48;
  v94[8] = v49;
  v90 = [MEMORY[0x263EFF8C0] arrayWithObjects:v94 count:9];

  return v90;
}

- (void)activate
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(CALNNotificationServerModule *)self modules];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) activate];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  if ([MEMORY[0x263F30020] hasBeenUnlockedSinceBoot]) {
    [(CALNNotificationServerModule *)self _updateSourceClientIdentifiersIfNeeded];
  }
}

- (void)deactivate
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(CALNNotificationServerModule *)self modules];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) deactivate];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)refreshEventStoreInResponseToDatabaseChangeNotification:(id)a3
{
  id v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_lastCreatedEventStore);
  if (WeakRetained)
  {
    uint64_t v6 = [(EKEphemeralCacheEventStoreProvider *)self->_eventStoreProvider eventStore];
    long long v7 = +[CALNLogSubsystem calendar];
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6 == WeakRetained)
    {
      if (v8)
      {
        *(_WORD *)long long v10 = 0;
        _os_log_impl(&dword_2216BB000, v7, OS_LOG_TYPE_DEFAULT, "Got a database changed notification and we have an EKEventStore. Letting the event store handle the notification first.", v10, 2u);
      }

      [WeakRetained handleExternalDatabaseChangeNotification:v4];
    }
    else
    {
      if (v8)
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_2216BB000, v7, OS_LOG_TYPE_DEFAULT, "Missed refreshing EKEventStore in response to handling database change notification; continuing without refreshing.",
          buf,
          2u);
      }
    }
  }
  else
  {
    uint64_t v6 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v9 = 0;
      _os_log_impl(&dword_2216BB000, v6, OS_LOG_TYPE_DEFAULT, "Not refreshing EKEventStore before handling database change notification because we don't have an EKEventStore right now.", v9, 2u);
    }
  }
}

- (void)_registerSettingsCaptureHandlers
{
  CADStatsRegisterCollectionCallback();
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.calendar.notifications.stateCaptureQ", v2);

  CalAddStateCaptureBlock();
}

void __64__CALNNotificationServerModule__registerSettingsCaptureHandlers__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = a2;
  id v4 = [v2 userNotificationCenter];
  [v4 collectSettingsStats:v3];
}

id __64__CALNNotificationServerModule__registerSettingsCaptureHandlers__block_invoke_2(uint64_t a1)
{
  v2 = objc_opt_new();
  id v3 = [*(id *)(*(void *)(a1 + 32) + 32) userNotificationCenter];
  [v3 collectSettingsStats:v2];

  return v2;
}

- (void)_updateLocaleReloadIfDifferent:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v6 = [v5 localeIdentifier];

  long long v7 = [MEMORY[0x263F30010] shared];
  BOOL v8 = [v7 objectForKey:@"NotificationsLastLocale"];

  if (([v6 isEqualToString:v8] & 1) == 0)
  {
    if (v3)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __63__CALNNotificationServerModule__updateLocaleReloadIfDifferent___block_invoke;
      block[3] = &unk_2645C0E60;
      id v12 = v8;
      id v13 = v6;
      long long v14 = self;
      dispatch_async(MEMORY[0x263EF83A0], block);

      long long v9 = v12;
    }
    else
    {
      long long v10 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id buf = 138543618;
        id v16 = v8;
        __int16 v17 = 2114;
        uint64_t v18 = v6;
        _os_log_impl(&dword_2216BB000, v10, OS_LOG_TYPE_DEFAULT, "Updating locale from %{public}@ to %{public}@", buf, 0x16u);
      }

      long long v9 = [MEMORY[0x263F30010] shared];
      [v9 setObject:v6 forKey:@"NotificationsLastLocale"];
    }
  }
}

void __63__CALNNotificationServerModule__updateLocaleReloadIfDifferent___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v10 = 138543618;
    uint64_t v11 = v3;
    __int16 v12 = 2114;
    uint64_t v13 = v4;
    _os_log_impl(&dword_2216BB000, v2, OS_LOG_TYPE_DEFAULT, "Reloading notifications because locale changed from %{public}@ to %{public}@", (uint8_t *)&v10, 0x16u);
  }

  uint64_t v5 = +[CALNNotificationServerModule _protectedCalendarNotificationStorage];
  uint64_t v6 = *(void **)(a1 + 48);
  long long v7 = [v5 notificationRecords];
  BOOL v8 = [*(id *)(a1 + 48) calendarNotificationServer];
  [v6 _reloadNotificationRecords:v7 forNotificationServer:v8];

  long long v9 = [MEMORY[0x263F30010] shared];
  [v9 setObject:*(void *)(a1 + 40) forKey:@"NotificationsLastLocale"];
}

- (void)_reloadTriggeredEventNotificationData
{
  uint64_t v3 = +[CALNNotificationServerModule _unprotectedTriggeredEventNotificationDataStorage];
  uint64_t v4 = +[CALNNotificationServerModule _protectedTriggeredEventNotificationDataStorage];
  BOOL v5 = [(CALNTriggeredEventNotificationSource *)self->_triggeredEventNotificationSource migrateToStorage:v4];
  uint64_t v6 = +[CALNLogSubsystem calendar];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_2216BB000, v6, OS_LOG_TYPE_DEFAULT, "Reloaded triggered event notification data after first unlock", buf, 2u);
    }

    [v3 removeNotificationData];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl(&dword_2216BB000, v6, OS_LOG_TYPE_DEFAULT, "Already reloaded triggered event notification data after first unlock; not doing it again",
        v8,
        2u);
    }
  }
}

- (void)_reloadNotificationsAfterFirstUnlock
{
  uint64_t v3 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v8 = 0;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Reloading calendar notifications after first unlock", v8, 2u);
  }

  uint64_t v4 = [(CALNNotificationServerModule *)self calendarNotificationServer];
  BOOL v5 = [(id)objc_opt_class() _unprotectedCalendarNotificationStorage];
  uint64_t v6 = [(id)objc_opt_class() _protectedCalendarNotificationStorage];
  BOOL v7 = [(CALNNotificationServerModule *)self calendarStorageWrapper];
  [(CALNNotificationServerModule *)self _reloadNotificationsFromUnprotectedStorage:v5 intoProtectedStorage:v6 withStorageWrapper:v7 forNotificationServer:v4];
}

- (void)_reloadNotificationsFromUnprotectedStorage:(id)a3 intoProtectedStorage:(id)a4 withStorageWrapper:(id)a5 forNotificationServer:(id)a6
{
  id v10 = a6;
  id v12 = a3;
  [a5 setWrappedStorage:a4];
  uint64_t v11 = [v12 notificationRecords];
  [(CALNNotificationServerModule *)self _reloadNotificationRecords:v11 forNotificationServer:v10];

  [(CALNNotificationServerModule *)self _removeNotificationsFromUnprotectedStorage:v12];
}

- (void)didRegisterForAlarms
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(CALNNotificationServerModule *)self modules];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) didRegisterForAlarms];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)receivedAlarmNamed:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)os_transaction_create();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [(CALNNotificationServerModule *)self modules];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) receivedAlarmNamed:v4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)protectedDataDidBecomeAvailable
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)os_transaction_create();
  +[CALNNotificationUtilities createSentinelFileIfNeeded];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [(CALNNotificationServerModule *)self modules];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) protectedDataDidBecomeAvailable];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(CALNNotificationServerModule *)self _reloadTriggeredEventNotificationData];
  [(CALNNotificationServerModule *)self _reloadNotificationsAfterFirstUnlock];
  [(CALNNotificationServerModule *)self _updateSourceClientIdentifiersIfNeeded];
  [(CALNNotificationServerModule *)self updateIconsToNewVersionIfNeeded];
}

- (void)_updateSourceClientIdentifiersIfNeeded
{
  uint64_t v3 = [MEMORY[0x263F30010] shared];
  uint64_t v4 = [v3 integerForKey:@"NotificationSourceClientIdentifierVersion"];

  if (v4 != 1)
  {
    uint64_t v5 = [MEMORY[0x263F30010] shared];
    [v5 setInteger:1 forKey:@"NotificationSourceClientIdentifierVersion"];

    id v6 = [(CALNNotificationServerModule *)self notificationSourceRefresher];
    [v6 refreshNotifications];
  }
}

- (void)_reloadNotificationRecords:(id)a3 forNotificationServer:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v5;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v34;
    unint64_t v11 = 0x2645C0000uLL;
    *(void *)&long long v8 = 138412546;
    long long v29 = v8;
    id v30 = v6;
    do
    {
      uint64_t v12 = 0;
      uint64_t v31 = v9;
      do
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(obj);
        }
        long long v13 = *(void **)(*((void *)&v33 + 1) + 8 * v12);
        uint64_t v14 = objc_msgSend(v13, "sourceIdentifier", v29);
        id v15 = [v6 notificationSourceForSourceIdentifier:v14];

        if (v15)
        {
          uint64_t v16 = [v13 mutableCopy];
          __int16 v17 = [v13 sourceClientIdentifier];
          uint64_t v18 = [v15 contentForNotificationWithSourceClientIdentifier:v17];
          [v16 setContent:v18];

          id v19 = [v16 copy];
          [v6 updateRecord:v19];

          uint64_t v20 = [*(id *)(v11 + 1368) calendar];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            id v21 = [v16 sourceIdentifier];
            id v22 = [v16 sourceClientIdentifier];
            v23 = [v16 content];
            [v23 title];
            unint64_t v24 = v11;
            v26 = uint64_t v25 = v10;
            *(_DWORD *)id buf = 138543874;
            uint64_t v38 = v21;
            __int16 v39 = 2114;
            v40 = v22;
            __int16 v41 = 2112;
            v42 = v26;
            _os_log_impl(&dword_2216BB000, v20, OS_LOG_TYPE_DEFAULT, "Reloaded notification record with source identifier = %{public}@, source client identifier = %{public}@, title = %@", buf, 0x20u);

            uint64_t v10 = v25;
            unint64_t v11 = v24;
            id v6 = v30;

            uint64_t v9 = v31;
          }
        }
        else
        {
          uint64_t v16 = [*(id *)(v11 + 1368) defaultCategory];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            id v27 = [v13 sourceClientIdentifier];
            id v28 = [v13 sourceIdentifier];
            *(_DWORD *)id buf = v29;
            uint64_t v38 = v27;
            __int16 v39 = 2114;
            v40 = v28;
            _os_log_error_impl(&dword_2216BB000, v16, OS_LOG_TYPE_ERROR, "Cannot reload notification with sourceClientIdentifier = %@. Failed to find notification source with sourceIdentifier = %{public}@.", buf, 0x16u);
          }
        }

        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v9);
  }
}

- (void)_removeNotificationsFromUnprotectedStorage:(id)a3
{
}

uint64_t __75__CALNNotificationServerModule__removeNotificationsFromUnprotectedStorage___block_invoke()
{
  return 1;
}

+ (id)_notificationStoragePathWithName:(id)a3
{
  id v3 = a3;
  uint64_t v4 = CALNDefaultCalendarDirectory();
  id v5 = [v4 stringByAppendingPathComponent:v3];

  return v5;
}

+ (id)_createNotificationStorageAtPath:(id)a3 protected:(BOOL)a4
{
  uint64_t v4 = +[CALNPersistentNotificationStorage persistentNotificationStorageWithPath:a3 isProtectedStorage:a4];
  id v5 = (void *)_createNotificationStorageAtPath_protected__storage;
  _createNotificationStorageAtPath_protected__storage = v4;

  id v6 = (void *)_createNotificationStorageAtPath_protected__storage;
  return v6;
}

+ (void)_setProtectedClassForStorageAtPath:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v10 = *MEMORY[0x263F080A8];
  v11[0] = *MEMORY[0x263F08098];
  id v5 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v9 = 0;
  char v6 = [v4 setAttributes:v5 ofItemAtPath:v3 error:&v9];
  id v7 = v9;

  if ((v6 & 1) == 0)
  {
    long long v8 = +[CALNLogSubsystem defaultCategory];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[CALNNotificationServerModule _setProtectedClassForStorageAtPath:]((uint64_t)v3, v8);
    }
  }
}

+ (id)_unprotectedCalendarNotificationStorage
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__CALNNotificationServerModule__unprotectedCalendarNotificationStorage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (_unprotectedCalendarNotificationStorage_onceToken != -1) {
    dispatch_once(&_unprotectedCalendarNotificationStorage_onceToken, block);
  }
  v2 = (void *)_unprotectedCalendarNotificationStorage_storage;
  return v2;
}

void __71__CALNNotificationServerModule__unprotectedCalendarNotificationStorage__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _notificationStoragePathWithName:@"Notifications.Calendar.Unprotected"];
  uint64_t v2 = [*(id *)(a1 + 32) _createNotificationStorageAtPath:v4 protected:0];
  id v3 = (void *)_unprotectedCalendarNotificationStorage_storage;
  _unprotectedCalendarNotificationStorage_storage = v2;
}

+ (id)_protectedCalendarNotificationStorage
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__CALNNotificationServerModule__protectedCalendarNotificationStorage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (_protectedCalendarNotificationStorage_onceToken != -1) {
    dispatch_once(&_protectedCalendarNotificationStorage_onceToken, block);
  }
  uint64_t v2 = (void *)_protectedCalendarNotificationStorage_storage;
  return v2;
}

void __69__CALNNotificationServerModule__protectedCalendarNotificationStorage__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _notificationStoragePathWithName:@"Notifications.Calendar.Protected"];
  uint64_t v2 = [*(id *)(a1 + 32) _createNotificationStorageAtPath:v4 protected:1];
  id v3 = (void *)_protectedCalendarNotificationStorage_storage;
  _protectedCalendarNotificationStorage_storage = v2;

  [*(id *)(a1 + 32) _setProtectedClassForStorageAtPath:v4];
}

+ (id)_unprotectedTriggeredEventNotificationDataStorage
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__CALNNotificationServerModule__unprotectedTriggeredEventNotificationDataStorage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (_unprotectedTriggeredEventNotificationDataStorage_onceToken != -1) {
    dispatch_once(&_unprotectedTriggeredEventNotificationDataStorage_onceToken, block);
  }
  uint64_t v2 = (void *)_unprotectedTriggeredEventNotificationDataStorage_storage;
  return v2;
}

void __81__CALNNotificationServerModule__unprotectedTriggeredEventNotificationDataStorage__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _triggeredEventNotificationDataStoragePathWithName:@"Notifications.Calendar.TriggeredEvent.NotificationData.Unprotected"];
  uint64_t v2 = [*(id *)(a1 + 32) _createTriggeredEventNotificationDataStorageAtPath:v4 protected:0];
  id v3 = (void *)_unprotectedTriggeredEventNotificationDataStorage_storage;
  _unprotectedTriggeredEventNotificationDataStorage_storage = v2;
}

+ (id)_protectedTriggeredEventNotificationDataStorage
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__CALNNotificationServerModule__protectedTriggeredEventNotificationDataStorage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (_protectedTriggeredEventNotificationDataStorage_onceToken != -1) {
    dispatch_once(&_protectedTriggeredEventNotificationDataStorage_onceToken, block);
  }
  uint64_t v2 = (void *)_protectedTriggeredEventNotificationDataStorage_storage;
  return v2;
}

void __79__CALNNotificationServerModule__protectedTriggeredEventNotificationDataStorage__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _triggeredEventNotificationDataStoragePathWithName:@"Notifications.Calendar.TriggeredEvent.NotificationData"];
  uint64_t v2 = [*(id *)(a1 + 32) _createTriggeredEventNotificationDataStorageAtPath:v4 protected:1];
  id v3 = (void *)_protectedTriggeredEventNotificationDataStorage_storage;
  _protectedTriggeredEventNotificationDataStorage_storage = v2;

  [*(id *)(a1 + 32) _setProtectedClassForStorageAtPath:v4];
}

+ (id)_triggeredEventNotificationDataStoragePathWithName:(id)a3
{
  id v3 = a3;
  id v4 = CALNDefaultCalendarDirectory();
  id v5 = [v4 stringByAppendingPathComponent:v3];

  return v5;
}

+ (id)_createTriggeredEventNotificationDataStorageAtPath:(id)a3 protected:(BOOL)a4
{
  return +[CALNPersistentTriggeredEventNotificationDataStorage persistentStorageWithPath:a3 isProtectedStorage:a4];
}

+ (id)_timeToLeaveRefreshStorage
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__CALNNotificationServerModule__timeToLeaveRefreshStorage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (_timeToLeaveRefreshStorage_onceToken != -1) {
    dispatch_once(&_timeToLeaveRefreshStorage_onceToken, block);
  }
  uint64_t v2 = (void *)_timeToLeaveRefreshStorage_storage;
  return v2;
}

void __58__CALNNotificationServerModule__timeToLeaveRefreshStorage__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _timeToLeaveRefreshStoragePathWithName:@"Notifications.Calendar.TriggeredEvent.TimeToLeaveRefresh"];
  uint64_t v2 = [*(id *)(a1 + 32) _createTimeToLeaveRefreshStorageAtPath:v4];
  id v3 = (void *)_timeToLeaveRefreshStorage_storage;
  _timeToLeaveRefreshStorage_storage = v2;
}

+ (id)_timeToLeaveRefreshStoragePathWithName:(id)a3
{
  id v3 = a3;
  id v4 = CALNDefaultCalendarDirectory();
  id v5 = [v4 stringByAppendingPathComponent:v3];

  return v5;
}

+ (id)_createTimeToLeaveRefreshStorageAtPath:(id)a3
{
  return +[CALNPersistentTimeToLeaveRefreshStorage persistentStorageWithPath:a3];
}

+ (void)_migrateNotificationFiles
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2216BB000, log, OS_LOG_TYPE_DEBUG, "Migration is not required", v1, 2u);
}

+ (id)_filesToMigrate
{
  return &unk_26D3C5F40;
}

+ (void)_migrateNotificationFilesFromDirectory:(id)a3 toDirectory:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v26 = a3;
  id v6 = a4;
  id v7 = [a1 _filesToMigrate];
  long long v8 = [MEMORY[0x263F08850] defaultManager];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v29;
    *(void *)&long long v11 = 138543618;
    long long v22 = v11;
    uint64_t v24 = *(void *)v29;
    id v25 = v9;
    id v23 = v6;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend(v6, "stringByAppendingPathComponent:", v15, v22);
        if ([v8 fileExistsAtPath:v16])
        {
          __int16 v17 = +[CALNLogSubsystem calendar];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)id buf = 138543362;
            uint64_t v33 = v15;
            _os_log_impl(&dword_2216BB000, v17, OS_LOG_TYPE_DEFAULT, "Not attempting to migrate file %{public}@ because it already exists in the destination directory", buf, 0xCu);
          }
        }
        else
        {
          __int16 v17 = [v26 stringByAppendingPathComponent:v15];
          if ([v8 fileExistsAtPath:v17])
          {
            id v27 = 0;
            char v18 = [v8 moveItemAtPath:v17 toPath:v16 error:&v27];
            id v19 = v27;
            uint64_t v20 = +[CALNLogSubsystem calendar];
            id v21 = v20;
            if (v18)
            {
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)id buf = 138543362;
                uint64_t v33 = v15;
                _os_log_impl(&dword_2216BB000, v21, OS_LOG_TYPE_DEFAULT, "Successfully moved file %{public}@", buf, 0xCu);
              }
            }
            else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)id buf = v22;
              uint64_t v33 = v15;
              __int16 v34 = 2112;
              long long v35 = v19;
              _os_log_error_impl(&dword_2216BB000, v21, OS_LOG_TYPE_ERROR, "Error moving file %{public}@: %@", buf, 0x16u);
            }

            id v6 = v23;
            uint64_t v13 = v24;
            id v9 = v25;
          }
          else
          {
            id v19 = +[CALNLogSubsystem calendar];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)id buf = 138543362;
              uint64_t v33 = v15;
              _os_log_impl(&dword_2216BB000, v19, OS_LOG_TYPE_DEFAULT, "Not attempting to migrate file %{public}@ because it doesn't exist in the source directory", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v12 = [v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v12);
  }
}

- (CALNInboxNotificationMonitor)inboxNotificationMonitor
{
  return self->_inboxNotificationMonitor;
}

- (CALNNotificationServer)calendarNotificationServer
{
  return self->_calendarNotificationServer;
}

- (CALNNotificationSourceRefresher)notificationSourceRefresher
{
  return self->_notificationSourceRefresher;
}

- (CALNCalendarAppBadgeUpdater)calendarAppBadgeUpdater
{
  return self->_calendarAppBadgeUpdater;
}

- (CALNNotificationStorageWrapper)calendarStorageWrapper
{
  return self->_calendarStorageWrapper;
}

- (CALNTriggeredEventNotificationSource)triggeredEventNotificationSource
{
  return self->_triggeredEventNotificationSource;
}

- (CALNNotificationIconCache)iconCache
{
  return self->_iconCache;
}

- (CALNSchedulingSnoozeUpdateTimer)snoozeUpdateTimer
{
  return self->_snoozeUpdateTimer;
}

- (CALNNotificationIconProvider)iconProvider
{
  return self->_iconProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modules, 0);
  objc_storeStrong((id *)&self->_iconProvider, 0);
  objc_storeStrong((id *)&self->_snoozeUpdateTimer, 0);
  objc_storeStrong((id *)&self->_iconCache, 0);
  objc_storeStrong((id *)&self->_triggeredEventNotificationSource, 0);
  objc_storeStrong((id *)&self->_calendarStorageWrapper, 0);
  objc_storeStrong((id *)&self->_calendarAppBadgeUpdater, 0);
  objc_storeStrong((id *)&self->_notificationSourceRefresher, 0);
  objc_storeStrong((id *)&self->_calendarNotificationServer, 0);
  objc_storeStrong((id *)&self->_inboxNotificationMonitor, 0);
  objc_destroyWeak((id *)&self->_lastCreatedEventStore);
  objc_storeStrong((id *)&self->_eventStoreProvider, 0);
}

+ (void)_setProtectedClassForStorageAtPath:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2216BB000, a2, OS_LOG_TYPE_ERROR, "Failed to set data class protection for path %{public}@", (uint8_t *)&v2, 0xCu);
}

@end