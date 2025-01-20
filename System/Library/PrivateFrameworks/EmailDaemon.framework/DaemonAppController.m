@interface DaemonAppController
+ (DaemonAppController)sharedController;
+ (OS_os_log)log;
+ (id)_startNonAcceptingServer;
+ (void)_deregisterBackgroundTasks;
+ (void)_unregisterAllXPCActivities;
+ (void)_unregisterPushTopics;
+ (void)run;
- (AppBadgeController)badgeController;
- (BOOL)_isAppForeground;
- (BOOL)canRegisterForAPSPush;
- (BOOL)canUseSpotlightIndex;
- (BOOL)isAllowedToAccessProtectedData;
- (BOOL)isForeground;
- (BOOL)isFrontmost;
- (BOOL)isMaild;
- (BOOL)isMobileMail;
- (BOOL)launchedToTest;
- (DaemonAppController)init;
- (DaemonSnapshotInvalidator)snapshotInvalidator;
- (EDActivityPersistence)activityPersistence;
- (EDCategoryCoreAnalyticsLogger)categoryCoreAnalyticsLogger;
- (EDCategorySubsystem)categorySubsystem;
- (EDMailAnalyticsCollector)mailAnalyticsCollector;
- (EDOutgoingMessageRepository)outgoingMessageRepository;
- (EDSearchableIndexBackgroundScheduler)searchableIndexBackgroundScheduler;
- (EDSendLaterUpdateController)sendLaterUpdateController;
- (EDSyncableSettings)syncableSettings;
- (EDWidgetUpdateController)widgetUpdateController;
- (EMBlockedSenderManager)blockedSenderManager;
- (EMCoreAnalyticsCollector)coreAnalyticsCollector;
- (EMFocusController)focusController;
- (FavoritesPersistence)favoritesPersistence;
- (MFAccountsProvider)accountsProvider;
- (MFLibraryReconciler)libraryReconciler;
- (MFMailPurgeableStorage)purgeableStorage;
- (MFMailPurgeableStorageMonitor)purgeableStorageMonitor;
- (MFMailboxProvider)mailboxProvider;
- (MFNanoServer)nanoServer;
- (MFServerMessagesIndexer)serverMessagesIndexer;
- (MFTrashCompactor)trashCompactor;
- (MFUserNotificationCenterController)userNotificationCenterController;
- (id)daemonInterface;
- (id)defaultAttachmentManager;
- (id)messageSummaryLoaderForMessage:(id)a3;
- (id)sourceApplicationBundleIdentifier;
- (void)_callMobileMailAppRemovalService;
- (void)_configureAnalytics;
- (void)_delayedStartupTasks;
- (void)_fetchCategorizationVersion;
- (void)_registerServices;
- (void)_setupSnapshotInvalidation;
- (void)_start;
- (void)autofetchAccount:(id)a3 mailboxUid:(id)a4;
- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4;
- (void)dealloc;
- (void)networkActivityEnded:(id)a3;
- (void)networkActivityStarted:(id)a3;
- (void)registerXPCActivityForResettingXPCAlarms;
- (void)resetPushStateWithCompletion:(id)a3;
- (void)scheduleDelayedStartupTasks;
- (void)setAccountsProvider:(id)a3;
- (void)setBadgeController:(id)a3;
- (void)setBlockedSenderManager:(id)a3;
- (void)setCategoryCoreAnalyticsLogger:(id)a3;
- (void)setCategorySubsystem:(id)a3;
- (void)setFavoritesPersistence:(id)a3;
- (void)setFocusController:(id)a3;
- (void)setLibraryReconciler:(id)a3;
- (void)setOutgoingMessageRepository:(id)a3;
- (void)setPurgeableStorage:(id)a3;
- (void)setPurgeableStorageMonitor:(id)a3;
- (void)setSearchableIndexBackgroundScheduler:(id)a3;
- (void)setSendLaterUpdateController:(id)a3;
- (void)setSnapshotInvalidator:(id)a3;
- (void)setSyncableSettings:(id)a3;
- (void)setTrashCompactor:(id)a3;
- (void)setUserNotificationCenterController:(id)a3;
- (void)setWidgetUpdateController:(id)a3;
- (void)systemDidWake;
- (void)systemWillSleep;
- (void)vipManager:(id)a3 hasVIPNotificationsEnabledWithCompletion:(id)a4;
@end

@implementation DaemonAppController

- (BOOL)isMobileMail
{
  return 1;
}

- (BOOL)isMaild
{
  return 1;
}

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DD5C;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016B720 != -1) {
    dispatch_once(&qword_10016B720, block);
  }
  v2 = (void *)qword_10016B718;

  return (OS_os_log *)v2;
}

+ (DaemonAppController)sharedController
{
  return (DaemonAppController *)(id)qword_10016B728;
}

+ (void)run
{
  _set_user_dir_suffix();
  v3 = +[DaemonAppController log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = +[NSBundle mainBundle];
    v5 = [v4 objectForInfoDictionaryKey:kCFBundleVersionKey];
    int v19 = 138543362;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting maild version %{public}@", (uint8_t *)&v19, 0xCu);
  }
  if (+[EMDaemonInterface cachedMailAppIsInstalled])goto LABEL_8; {
  v7 = +[LSApplicationWorkspace defaultWorkspace];
  }
  unsigned int v8 = [v7 applicationIsInstalled:kMFMobileMailBundleIdentifier];

  if (v8)
  {
    v9 = +[DaemonAppController log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "cachedMailAppIsInstalled = NO, but workspace indicates it is installed. Updating cached installation status.", (uint8_t *)&v19, 2u);
    }

    +[EMDaemonInterface setCachedMailAppIsInstalled:1];
LABEL_8:
    if (EFIsCustomerBuild())
    {
      id v10 = objc_alloc((Class)EFWatchdog);
      id v11 = [v10 initWithMonitoredBundleIdentifier:kMFMobileMailBundleIdentifier];
      [v11 start];
    }
    else
    {
      id v11 = 0;
    }
    v12 = objc_alloc_init(DaemonAppController);
    v13 = (void *)qword_10016B728;
    qword_10016B728 = (uint64_t)v12;

    [(id)qword_10016B728 _start];
    v14 = 0;
    v15 = 0;
    goto LABEL_15;
  }
  v16 = +[DaemonAppController log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Mail app is not installed, switching to EDNonAcceptingServer", (uint8_t *)&v19, 2u);
  }

  [a1 _unregisterAllXPCActivities];
  [a1 _unregisterPushTopics];
  [a1 _deregisterBackgroundTasks];
  v15 = [a1 _startNonAcceptingServer];
  v14 = objc_opt_new();
  v17 = +[LSApplicationWorkspace defaultWorkspace];
  [v17 addObserver:v14];

  id v11 = 0;
LABEL_15:
  v18 = +[NSRunLoop mainRunLoop];
  [v18 run];
}

- (void)registerXPCActivityForResettingXPCAlarms
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000E400;
  v3[3] = &unk_100139F90;
  objc_copyWeak(&v4, &location);
  v2 = objc_retainBlock(v3);
  ef_xpc_activity_register();

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  v7 = +[DaemonAppController log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = +[NSNumber numberWithInteger:a4];
    v9 = +[NSNumber numberWithInteger:a3];
    int v10 = 138412546;
    id v11 = v8;
    __int16 v12 = 2112;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Content protection state changed from %@ to %@", (uint8_t *)&v10, 0x16u);
  }
  if (!a3)
  {
    EFUnregisterContentProtectionObserver();
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_contentProtectionSemaphore);
  }
}

- (DaemonAppController)init
{
  v100.receiver = self;
  v100.super_class = (Class)DaemonAppController;
  id v2 = [(DaemonAppController *)&v100 init];
  v3 = (DaemonAppController *)v2;
  if (v2)
  {
    if ((EFDeviceUnlockedSinceBoot() & 1) == 0)
    {
      id v4 = +[DaemonAppController log];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Device has not been unlocked after boot, waiting for unlock...", buf, 2u);
      }

      dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
      v6 = (void *)*((void *)v2 + 13);
      *((void *)v2 + 13) = v5;

      dispatch_queue_t v7 = dispatch_queue_create("com.apple.mail.maild.contentProtectionObserver", 0);
      unsigned int v8 = (void *)*((void *)v2 + 14);
      *((void *)v2 + 14) = v7;

      EFRegisterContentProtectionObserver();
      dispatch_semaphore_wait(*((dispatch_semaphore_t *)v2 + 13), 0xFFFFFFFFFFFFFFFFLL);
      v9 = (void *)*((void *)v2 + 13);
      *((void *)v2 + 13) = 0;

      int v10 = (void *)*((void *)v2 + 14);
      *((void *)v2 + 14) = 0;
    }
    uint64_t v11 = +[EFProcessTransaction transactionWithDescription:@"DaemonAppController startup"];
    __int16 v12 = (void *)*((void *)v2 + 16);
    *((void *)v2 + 16) = v11;

    v13 = objc_alloc_init(NetworkActivityIndicator);
    v14 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v13;

    if (notify_register_dispatch("AppleLanguagePreferencesChangedNotification", (int *)v2 + 16, (dispatch_queue_t)&_dispatch_main_q, &stru_100139FD0))
    {
      *((_DWORD *)v2 + 16) = -1;
    }
    MFSetUserAgent();
    uint64_t v15 = +[MFMailMessageLibrary defaultInstance];
    v16 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v15;

    if (_os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride()) {
      [*((id *)v2 + 2) addPostMigrationStep:objc_opt_class()];
    }
    id v17 = [objc_alloc((Class)MFAttachmentLibraryManager) initWithPrimaryLibrary:*((void *)v2 + 2)];
    v18 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v17;

    id v19 = objc_alloc((Class)UNUserNotificationCenter);
    id v20 = [v19 initWithBundleIdentifier:kMFMobileMailBundleIdentifier];
    v21 = (void *)*((void *)v2 + 15);
    *((void *)v2 + 15) = v20;

    id v22 = objc_alloc_init((Class)EMFocusController);
    v23 = (void *)*((void *)v2 + 35);
    *((void *)v2 + 35) = v22;

    v24 = [[MFDaemonAccountsProvider alloc] initWithFocusController:*((void *)v2 + 35)];
    objc_storeStrong((id *)v2 + 19, v24);
    id v25 = objc_alloc_init((Class)EDSyncableSettings);
    v26 = (void *)*((void *)v2 + 26);
    *((void *)v2 + 26) = v25;

    [*((id *)v2 + 26) setProxyChangeHandler:&stru_10013A010];
    v27 = +[NSUserDefaults em_userDefaults];
    unsigned __int8 v28 = [v27 integerForKey:EMUserDefaultLoadRemoteContentKey];

    if (v28)
    {
      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, v2);
      v29 = +[EFScheduler globalAsyncScheduler];
      v97[0] = _NSConcreteStackBlock;
      v97[1] = 3221225472;
      v97[2] = sub_10000EF9C;
      v97[3] = &unk_10013A038;
      objc_copyWeak(&v98, (id *)buf);
      [v29 performBlock:v97];

      objc_destroyWeak(&v98);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      [*((id *)v2 + 26) beginSyncing];
    }
    uint64_t v30 = [*((id *)v2 + 2) persistence];
    v31 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v30;

    [*((id *)v2 + 4) setAccountsProvider:v24];
    id v32 = objc_alloc((Class)EDVIPManager);
    v33 = +[EMPersistenceLayoutManager mailDataDirectory];
    id v34 = [v32 initWithDirectoryURL:v33 accountsProvider:*((void *)v2 + 19) delegate:v2];
    [*((id *)v2 + 4) setVipManager:v34];

    v35 = +[MFUserProfileProvider_iOS defaultProvider];
    [*((id *)v2 + 4) setUserProfileProvider:v35];

    id v36 = [objc_alloc((Class)MFMailboxProvider) initWithAccountsProvider:v24];
    v37 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v36;

    v38 = [MFRemoteSearchProvider_iOS alloc];
    v39 = [*((id *)v2 + 4) messagePersistence];
    v40 = [(MFRemoteSearchProvider_iOS *)v38 initWithMessagePersistence:v39];
    v41 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v40;

    id v42 = [objc_alloc((Class)MFServerMessagesIndexer) initWithAccountsProvider:*((void *)v2 + 19)];
    v43 = (void *)*((void *)v2 + 39);
    *((void *)v2 + 39) = v42;

    v44 = [v2 serverMessagesIndexer];
    [v44 registerSystemTask];

    v45 = (void *)*((void *)v2 + 4);
    uint64_t v46 = *((void *)v2 + 10);
    uint64_t v47 = *((void *)v2 + 11);
    v48 = [v2 serverMessagesIndexer];
    [v45 setUpWithMailboxProvider:v46 remoteSearchProvider:v47 serverMessagesIndexer:v48];

    v49 = [MFMailPurgeableStorage alloc];
    v50 = [v2 accountsProvider];
    v51 = [(MFMailPurgeableStorage *)v49 initWithAccountsProvider:v50];
    [v2 setPurgeableStorage:v51];

    v52 = [MFMailPurgeableStorageMonitor alloc];
    v53 = [v2 purgeableStorage];
    v54 = [(MFMailPurgeableStorageMonitor *)v52 initWithPurgeableStorage:v53];
    [v2 setPurgeableStorageMonitor:v54];

    v55 = [MFMessageRuleLibraryHook alloc];
    v56 = [*((id *)v2 + 4) messageChangeManager];
    v57 = [(MFMessageRuleLibraryHook *)v55 initWithMessageChangeManager:v56];
    v58 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v57;

    v59 = [*((id *)v2 + 4) hookRegistry];
    [v59 registerMessageChangeHookResponder:*((void *)v2 + 3)];

    v60 = [*((id *)v2 + 4) messagePersistence];
    [v60 setSummaryLoaderProvider:v2];
    v61 = [OutgoingMessageRepository_iOS alloc];
    v62 = [*((id *)v2 + 4) messageChangeManager];
    v63 = [(OutgoingMessageRepository_iOS *)v61 initWithMessagePersistence:v60 messageChangeManager:v62];

    objc_storeStrong((id *)v2 + 36, v63);
    v64 = [[MFListUnsubscribeHandler_iOS alloc] initWithOutgoingMessageRepository:v63];
    [(MFPersistence_iOS *)v3->_persistence setListUnsubscribeHandler:v64];
    +[MFLibraryCompressionActivityManager scheduleLibraryCompressionIfNeeded];
    +[MFMarkLibraryPurgeableActivityManager scheduleIfNeeded];
    uint64_t v65 = [(MFPersistence_iOS *)v3->_persistence blockedSenderManager];
    blockedSenderManager = v3->_blockedSenderManager;
    v3->_blockedSenderManager = (EMBlockedSenderManager *)v65;

    v67 = [(MFPersistence_iOS *)v3->_persistence vipManager];
    +[VIPManager setBackingManager:v67];

    v68 = +[MFPowerController sharedInstance];
    [v68 startListeningForBatterySaverNotifications];

    MFRegisterPowerObserver();
    v69 = (EMCoreAnalyticsCollector *)objc_alloc_init((Class)EMCoreAnalyticsCollector);
    coreAnalyticsCollector = v3->_coreAnalyticsCollector;
    v3->_coreAnalyticsCollector = v69;

    v71 = [(MFPersistence_iOS *)v3->_persistence categoryPersistence];
    uint64_t v72 = [v71 analyticsLogger];
    categoryCoreAnalyticsLogger = v3->_categoryCoreAnalyticsLogger;
    v3->_categoryCoreAnalyticsLogger = (EDCategoryCoreAnalyticsLogger *)v72;

    v74 = [FavoritesPersistence alloc];
    v75 = [(MFPersistence_iOS *)v3->_persistence conversationPersistence];
    v76 = [(MFPersistence_iOS *)v3->_persistence mailboxPersistence];
    v77 = [(FavoritesPersistence *)v74 initWithConversationSubscriptionProvider:v75 accountsProvider:v24 mailboxPersistence:v76 daemonInterface:0 analyticsCollector:v3->_coreAnalyticsCollector];
    favoritesPersistence = v3->_favoritesPersistence;
    v3->_favoritesPersistence = v77;

    v79 = [DaemonFetchController alloc];
    v80 = v3->_favoritesPersistence;
    v81 = [(MFPersistence_iOS *)v3->_persistence hookRegistry];
    v82 = [(DaemonFetchController *)v79 initWithAccountsProvider:v24 favoritesPersistence:v80 hookRegistry:v81];
    fetchController = v3->_fetchController;
    v3->_fetchController = v82;

    v84 = [[MFUserNotificationCenterController alloc] initWithSystemUserNotificationCenter:v3->_systemUserNotificationCenter persistence:v3->_persistence favoritesReader:v3->_favoritesPersistence analyticsCollector:v3->_coreAnalyticsCollector];
    userNotificationCenterController = v3->_userNotificationCenterController;
    v3->_userNotificationCenterController = v84;

    [(MFUserNotificationCenterController *)v3->_userNotificationCenterController addSettingsObserver:v3->_favoritesPersistence];
    v86 = [(MFPersistence_iOS *)v3->_persistence remindMeNotificationController];
    id v87 = [v86 addRemindMeObserver:v3->_userNotificationCenterController];

    v88 = objc_alloc_init(MFTrashCompactor);
    trashCompactor = v3->_trashCompactor;
    v3->_trashCompactor = v88;

    id v90 = objc_alloc((Class)EDSendLaterUpdateController);
    v91 = [(MFPersistence_iOS *)v3->_persistence hookRegistry];
    v92 = [(MFPersistence_iOS *)v3->_persistence alarmScheduler];
    v93 = (EDSendLaterUpdateController *)[v90 initWithHookRegistry:v91 messagePersistence:v60 outgoingRepository:v63 alarmScheduler:v92];
    sendLaterUpdateController = v3->_sendLaterUpdateController;
    v3->_sendLaterUpdateController = v93;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)sub_10000F004, DAReListenForAccounts, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v3;
}

- (EDActivityPersistence)activityPersistence
{
  return (EDActivityPersistence *)[(MFPersistence_iOS *)self->_persistence activityPersistence];
}

- (void)dealloc
{
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1) {
    notify_cancel(notifyToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)DaemonAppController;
  [(DaemonAppController *)&v4 dealloc];
}

+ (id)_startNonAcceptingServer
{
  id v2 = objc_alloc((Class)EDNonAcceptingServer);
  v7[0] = EMDaemonServiceName;
  v7[1] = @"com.apple.mobilemail.services.xpc";
  v7[2] = @"com.apple.mobilemail.nano.pairedsync";
  v3 = +[NSArray arrayWithObjects:v7 count:3];
  id v4 = [v2 initWithMachServiceNames:v3];

  dispatch_time_t v5 = dispatch_time(0, 10000000000);
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, &stru_10013A058);

  return v4;
}

- (void)_start
{
  [(MFMailMessageLibrary *)self->_library start];
  v3 = +[DaemonAppController log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting up MailXPCServices.", buf, 2u);
  }

  [(DaemonAppController *)self _registerServices];
  id v4 = +[DaemonAppController log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting up UserNotificationCenterController.", v23, 2u);
  }

  dispatch_time_t v5 = [(DaemonAppController *)self userNotificationCenterController];
  [v5 start];

  id v6 = +[MFUserSyncStakeholder sharedStakeholder];
  dispatch_queue_t v7 = +[MFUserProfileProvider_iOS defaultProvider];
  unsigned int v8 = +[VIPManager defaultInstance];
  id v9 = objc_alloc((Class)MFCategorySubsystem_iOS);
  persistence = self->_persistence;
  uint64_t v11 = [(DaemonAppController *)self categoryCoreAnalyticsLogger];
  id v12 = [v9 initWithPersistence:persistence userProfileProvider:v7 vipManager:v8 sourceApplicationBundleIdentifier:kMFMobileMailBundleIdentifier categorizationAnalyticsLogger:v11];
  [(DaemonAppController *)self setCategorySubsystem:v12];

  v13 = [(DaemonAppController *)self categorySubsystem];
  [v13 scheduleRecurringActivity];

  v14 = [DaemonInterfaceFactory alloc];
  uint64_t v15 = self->_persistence;
  v16 = [(DaemonAppController *)self categorySubsystem];
  id v17 = [(DaemonInterfaceFactory *)v14 initWithPersistence:v15 categorySubsystem:v16 sharedFetchController:self->_fetchController];

  v18 = (EDServer *)[objc_alloc((Class)EDServer) initWithDaemonInterfaceFactory:v17];
  server = self->_server;
  self->_server = v18;

  id v20 = (MFLibraryReconciler *)[objc_alloc((Class)MFLibraryReconciler) initWithLibrary:self->_library queryProvider:self->_server accountsProvider:self->_accountsProvider];
  libraryReconciler = self->_libraryReconciler;
  self->_libraryReconciler = v20;

  [(EDServer *)self->_server start];
  [(EFProcessTransaction *)self->_startupTransaction invalidate];
  startupTransaction = self->_startupTransaction;
  self->_startupTransaction = 0;

  [(DaemonAppController *)self scheduleDelayedStartupTasks];
}

- (void)_registerServices
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000F808;
  v2[3] = &unk_100139BA8;
  v2[4] = self;
  v2[5] = a2;
  if (qword_10016B730 != -1) {
    dispatch_once(&qword_10016B730, v2);
  }
}

- (BOOL)_isAppForeground
{
  id v2 = +[MFAppStateMonitor sharedInstance];
  unsigned __int8 v3 = [v2 isVisible];

  return v3;
}

+ (void)_unregisterAllXPCActivities
{
  xpc_activity_unregister("com.apple.MobileMail.pushPurgeableSpaceUpdate");
  xpc_activity_unregister("com.apple.email.ConversationDailyExporter");
  xpc_activity_unregister("com.apple.email.ConversationPruning");
  xpc_activity_unregister("com.apple.email.interaction-log.submit-pet");
  xpc_activity_unregister("com.apple.email.maild.suggestionsLostMessageProcessing");
  xpc_activity_unregister("com.apple.email.searchableIndex.scheduler.budgeted");
  xpc_activity_unregister("com.apple.email.searchableIndex.scheduler.maintenance");
  xpc_activity_unregister("com.apple.email.spotlightVerification");
  xpc_activity_unregister("com.apple.emaildaemon.protecteddatabasepersistence.cleanup");
  xpc_activity_unregister("com.apple.message.LibraryPurgeableMigrator");
  xpc_activity_unregister("com.apple.message.db.vacuum");
  xpc_activity_unregister("com.apple.message.journal-reconciliation");
  xpc_activity_unregister("com.apple.message.libraryCompression");
  xpc_activity_unregister("com.apple.message.statisticsLogging");
  xpc_activity_unregister("com.apple.mobilemail.powernapFetches");
  xpc_activity_unregister("com.apple.mobilemail.scheduledFetches");
  xpc_activity_unregister("com.apple.mobilemail.compactingFetches");
  xpc_activity_unregister("com.apple.email.updateWidget");
  xpc_activity_unregister("com.apple.mobilemail.indexState");
  xpc_activity_unregister("com.apple.email.EMCoreAnalyticsCollector");
  xpc_activity_unregister("com.apple.mobilemail.activity.reset-device-activity-alarms");
  xpc_activity_unregister("com.apple.email.maild.sendlaterdelivery.alarmrestart");
  xpc_activity_unregister("com.apple.email.ProcessSQLQueryPerformanceData");
  xpc_activity_unregister("com.apple.email.EDRemoteContentManager.requestScheduler");
  xpc_activity_unregister("com.apple.email.EDRemoteContentPersistence.analyticsScheduler");
  xpc_activity_unregister("com.apple.mail.searchableIndex.indexingDiagnosticsCollector");

  xpc_activity_unregister("com.apple.mail.mailboxPersistence.statisticsReportingScheduler");
}

+ (void)_deregisterBackgroundTasks
{
  +[EDSearchableIndexBackgroundScheduler deregister];
  sub_10000FB60(@"com.apple.email.searchIndexerBGTask");
  sub_10000FB60(@"com.apple.mail.blackpearl.categorizer");
  sub_10000FB60(@"com.apple.email.categorization.FastPass");
  sub_10000FB60(@"com.apple.email.search.FastPass");
  sub_10000FB60(@"com.apple.mail.messageauthentication");

  sub_10000FB60(@"com.apple.mail.businessconnectgrouping");
}

+ (void)_unregisterPushTopics
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.mail.maild.unregisterPushTopics", v2);

  id v3 = objc_alloc((Class)APSConnection);
  id v4 = [v3 initWithEnvironmentName:APSEnvironmentProduction namedDelegatePort:@"com.apple.email.maild.aps" queue:v5];
  [v4 setEnabledTopics:&__NSArray0__struct ignoredTopics:&__NSArray0__struct opportunisticTopics:&__NSArray0__struct];
  [v4 shutdown];
}

- (id)daemonInterface
{
  return 0;
}

- (BOOL)launchedToTest
{
  return 0;
}

- (BOOL)isFrontmost
{
  return [(DaemonAppController *)self _isAppForeground];
}

- (id)defaultAttachmentManager
{
  return +[MFAttachmentLibraryManager defaultManager];
}

- (EMBlockedSenderManager)blockedSenderManager
{
  return self->_blockedSenderManager;
}

- (void)resetPushStateWithCompletion:(id)a3
{
  id v4 = a3;
  id v3 = +[AutoFetchController sharedController];
  [v3 resetPushStateWithCompletion:v4];
}

- (void)autofetchAccount:(id)a3 mailboxUid:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  dispatch_queue_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v5 primaryMailboxUid];
  }
  id v9 = v8;
  int v10 = MFAutoFetchLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = objc_msgSend(v5, "ef_publicDescription");
    int v20 = 138543362;
    v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Autofetching after abort %{public}@", (uint8_t *)&v20, 0xCu);
  }
  id v12 = [v5 storeForMailboxUid:v9];
  v13 = +[MessageBodyLoader loaderForAccount:v5];
  [v13 beginAddingNewMessagesForStore:v12];

  if (((unint64_t)objc_msgSend(v12, "fetchMobileSynchronously:", objc_msgSend(v12, "fetchWindow")) & 0x8000000000000000) != 0)
  {
    v14 = [v5 connectionError];
    if (!v14)
    {
      v18 = +[MFActivityMonitor currentMonitor];
      v14 = [v18 error];
    }
    uint64_t v15 = MFLogGeneral();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v19 = objc_msgSend(v14, "ef_publicDescription");
      sub_1000C00A0(v19, (uint8_t *)&v20, v15);
    }
  }
  else
  {
    v14 = +[MailPersistentStorage sharedStorage];
    uint64_t v15 = +[NSDate date];
    v16 = [v12 mailbox];
    id v17 = [v16 URLString];
    [v14 setFetchDate:v15 forSource:v17];
  }
}

- (BOOL)isForeground
{
  return 1;
}

- (id)sourceApplicationBundleIdentifier
{
  return kMFMobileMailBundleIdentifier;
}

- (BOOL)isAllowedToAccessProtectedData
{
  return 1;
}

- (BOOL)canRegisterForAPSPush
{
  return 1;
}

- (BOOL)canUseSpotlightIndex
{
  return 1;
}

- (void)networkActivityStarted:(id)a3
{
}

- (void)networkActivityEnded:(id)a3
{
}

- (id)messageSummaryLoaderForMessage:(id)a3
{
  id v3 = a3;
  id v4 = [[MessageSummaryLoader alloc] initWithMessage:v3];

  return v4;
}

- (void)scheduleDelayedStartupTasks
{
  [(DaemonAppController *)self registerXPCActivityForResettingXPCAlarms];
  id v3 = +[EFProcessTransaction transactionWithDescription:@"Delayed Startup Transaction"];
  id v4 = +[EFScheduler mainThreadScheduler];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100010214;
  void v7[3] = &unk_100139C20;
  v7[4] = self;
  id v5 = v3;
  id v8 = v5;
  id v6 = [v4 afterDelay:v7 performBlock:2.0];
}

- (void)_delayedStartupTasks
{
  id v3 = +[DaemonAppController log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v40 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Performing delayed startup tasks.", v40, 2u);
  }

  id v4 = +[MFVIPSendersLibrary defaultInstance];
  [v4 checkForAddressBookChanges];

  id v5 = [(MFPersistence_iOS *)self->_persistence conversationPersistence];
  [v5 initializeConversationManagerAndPerformInitialSync];

  id v6 = [AppBadgeController alloc];
  dispatch_queue_t v7 = [(MFPersistence_iOS *)self->_persistence messagePersistence];
  id v8 = [(MFPersistence_iOS *)self->_persistence hookRegistry];
  mailboxProvider = self->_mailboxProvider;
  focusController = self->_focusController;
  id v11 = objc_alloc((Class)MSBucketBarConfigurationController);
  id v12 = objc_alloc_init((Class)MSUserDefaultsBucketBarConfigurationProvider);
  id v13 = [v11 initWithProvider:v12];
  v14 = [(AppBadgeController *)v6 initWithMessagePersistence:v7 hookRegistry:v8 mailboxProvider:mailboxProvider focusController:focusController bucketBarController:v13];
  badgeController = self->_badgeController;
  self->_badgeController = v14;

  [(MFUserNotificationCenterController *)self->_userNotificationCenterController addSettingsObserver:self->_badgeController];
  v16 = [MFApplicationShortcutProvider alloc];
  id v17 = [(DaemonAppController *)self accountsProvider];
  favoritesPersistence = self->_favoritesPersistence;
  id v19 = [(MFPersistence_iOS *)self->_persistence messagePersistence];
  int v20 = [(MFPersistence_iOS *)self->_persistence hookRegistry];
  v21 = [(MFApplicationShortcutProvider *)v16 initWithAccountsProvider:v17 favoritesPersistence:favoritesPersistence messagePersistence:v19 hookRegistry:v20];
  appShortcutProvider = self->_appShortcutProvider;
  self->_appShortcutProvider = v21;

  if (+[SuggestionsDataProvider isHarvestingSupported])
  {
    v23 = [[SuggestionsDataProvider alloc] initWithLibrary:self->_library];
    suggestionsDataProvider = self->_suggestionsDataProvider;
    self->_suggestionsDataProvider = v23;

    [(SuggestionsDataProvider *)self->_suggestionsDataProvider resumeFullDownloadProcessing];
  }
  id v25 = objc_alloc((Class)EDWidgetUpdateController);
  uint64_t v41 = MFWidgetKindMessages;
  v26 = +[NSArray arrayWithObjects:&v41 count:1];
  v27 = [(MFPersistence_iOS *)self->_persistence hookRegistry];
  unsigned __int8 v28 = (EDWidgetUpdateController *)[v25 initWithWidgetBundleIdentifier:MFMobileMailWidgetBundleIdentifier widgetKindIdentifiers:v26 hookRegistry:v27];
  widgetUpdateController = self->_widgetUpdateController;
  self->_widgetUpdateController = v28;

  id v30 = +[MFDeliveryQueue sharedDeliveryQueue];
  [(DaemonAppController *)self _setupSnapshotInvalidation];
  [(MFPersistence_iOS *)self->_persistence scheduleRecurringActivity];
  v31 = [(MFPersistence_iOS *)self->_persistence remindMeNotificationController];
  [v31 performDelayedTasks];

  +[EMServerConfiguration refreshAsync];
  id v32 = (EDSearchableIndexBackgroundScheduler *)objc_alloc_init((Class)EDSearchableIndexBackgroundScheduler);
  searchableIndexBackgroundScheduler = self->_searchableIndexBackgroundScheduler;
  self->_searchableIndexBackgroundScheduler = v32;

  id v34 = +[LSApplicationWorkspace defaultWorkspace];
  id v35 = [v34 applicationIsInstalled:kMFMobileMailBundleIdentifier];

  +[EMDaemonInterface setCachedMailAppIsInstalled:v35];
  if ((v35 & 1) == 0)
  {
    id v36 = +[DaemonAppController log];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_1000C00F8(v36);
    }

    [(DaemonAppController *)self _callMobileMailAppRemovalService];
  }
  [(DaemonAppController *)self _configureAnalytics];
  v37 = [(DaemonAppController *)self categorySubsystem];
  [v37 start];

  _os_feature_enabled_impl();
  EDCategoryPowerLogDidCreateInstance();
  [(DaemonAppController *)self _fetchCategorizationVersion];
  v38 = +[MailAccount mailAccounts];
  +[MailAccount updatePersonalStatusForAccounts:v38 forceUpdate:1];

  v39 = [(MFPersistence_iOS *)self->_persistence rulesController];
  [v39 registerForWebRuleNotifications];
}

- (void)_callMobileMailAppRemovalService
{
  [@"/System/Library/AppRemovalServices/com.apple.mobilemail.appremoval.xpc" fileSystemRepresentation];
  xpc_add_bundle();
  id v2 = [objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.mobilemail.appremoval"];
  id v3 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___LSAppRemovalServiceProtocol];
  [v2 setRemoteObjectInterface:v3];

  [v2 resume];
  id v4 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&stru_10013A098];
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000108D4;
    v6[3] = &unk_10013A0C0;
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    id v5 = v7;
    [v4 removeAppWithReply:v6];
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (void)systemWillSleep
{
  id v2 = +[MailAccount activeAccounts];
  [v2 makeObjectsPerformSelector:"systemWillSleep"];
}

- (void)systemDidWake
{
  id v2 = +[MailAccount activeAccounts];
  [v2 makeObjectsPerformSelector:"systemDidWake"];
}

- (void)vipManager:(id)a3 hasVIPNotificationsEnabledWithCompletion:(id)a4
{
  id v5 = a4;
  systemUserNotificationCenter = self->_systemUserNotificationCenter;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100010B30;
  v8[3] = &unk_10013A0E8;
  id v9 = v5;
  id v7 = v5;
  [(MFSystemUserNotificationCenter *)systemUserNotificationCenter getNotificationSettingsForTopicsWithCompletionHandler:v8];
}

- (void)_setupSnapshotInvalidation
{
  id v3 = [DaemonSnapshotInvalidator alloc];
  id v4 = [(MFPersistence_iOS *)self->_persistence hookRegistry];
  server = self->_server;
  id v6 = [(DaemonAppController *)self focusController];
  id v7 = [(DaemonSnapshotInvalidator *)v3 initWithApplicationBundleIdentifier:kMFMobileMailBundleIdentifier hookRegistry:v4 remoteClientsProvider:server focusController:v6];
  [(DaemonAppController *)self setSnapshotInvalidator:v7];

  id v8 = +[EFDevice currentDevice];
  LODWORD(v6) = [v8 isInternal];

  if (v6)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100010F14;
    v25[3] = &unk_10013A110;
    objc_copyWeak(&v26, &location);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100010FEC;
    v23[3] = &unk_10013A138;
    id v9 = objc_retainBlock(v25);
    id v24 = v9;
    int v10 = +[EMInternalPreferences observeChangesForPreference:14 usingBlock:v23];
    snapshotOverrideObservation = self->_snapshotOverrideObservation;
    self->_snapshotOverrideObservation = v10;

    id v12 = +[EDClientState sharedInstance];
    uint64_t v13 = EDClientStateIsRunningTestsKey;
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    int v20 = sub_100011070;
    v21 = &unk_10013A0E8;
    v14 = v9;
    id v22 = v14;
    objc_msgSend(v12, "ef_observeKeyPath:options:usingBlock:", v13, 1, &v18);
    uint64_t v15 = (EFCancelable *)objc_claimAutoreleasedReturnValue();
    clientIsTestingObservation = self->_clientIsTestingObservation;
    self->_clientIsTestingObservation = v15;

    id v17 = +[EDClientState sharedInstance];
    ((void (*)(void *, id, id))v14[2])(v14, [v17 isRunningTests], +[EMInternalPreferences preferenceEnabled:](EMInternalPreferences, "preferenceEnabled:", 14));

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
}

- (void)_configureAnalytics
{
  id v8 = objc_alloc_init((Class)MFSMIMEConfigurationProvider);
  id v3 = objc_alloc((Class)EDMailAnalyticsCollector);
  coreAnalyticsCollector = self->_coreAnalyticsCollector;
  id v5 = [(MFPersistence_iOS *)self->_persistence messagePersistence];
  id v6 = (EDMailAnalyticsCollector *)[v3 initWithAnalyticsCollector:coreAnalyticsCollector smimeConfigurationProvider:v8 messagePersistence:v5];
  mailAnalyticsCollector = self->_mailAnalyticsCollector;
  self->_mailAnalyticsCollector = v6;
}

- (void)_fetchCategorizationVersion
{
  id v3 = objc_alloc_init(off_100169608());
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000112A8;
  v4[3] = &unk_10013A160;
  v4[4] = self;
  [v3 getBlackPearlVersionWithCompletion:v4];
}

- (MFAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (void)setAccountsProvider:(id)a3
{
}

- (MFMailPurgeableStorage)purgeableStorage
{
  return self->_purgeableStorage;
}

- (void)setPurgeableStorage:(id)a3
{
}

- (void)setBlockedSenderManager:(id)a3
{
}

- (FavoritesPersistence)favoritesPersistence
{
  return self->_favoritesPersistence;
}

- (void)setFavoritesPersistence:(id)a3
{
}

- (MFMailboxProvider)mailboxProvider
{
  return self->_mailboxProvider;
}

- (MFNanoServer)nanoServer
{
  return self->_nanoServer;
}

- (MFTrashCompactor)trashCompactor
{
  return self->_trashCompactor;
}

- (void)setTrashCompactor:(id)a3
{
}

- (EMCoreAnalyticsCollector)coreAnalyticsCollector
{
  return self->_coreAnalyticsCollector;
}

- (EDSyncableSettings)syncableSettings
{
  return self->_syncableSettings;
}

- (void)setSyncableSettings:(id)a3
{
}

- (MFMailPurgeableStorageMonitor)purgeableStorageMonitor
{
  return self->_purgeableStorageMonitor;
}

- (void)setPurgeableStorageMonitor:(id)a3
{
}

- (AppBadgeController)badgeController
{
  return self->_badgeController;
}

- (void)setBadgeController:(id)a3
{
}

- (EDCategorySubsystem)categorySubsystem
{
  return self->_categorySubsystem;
}

- (void)setCategorySubsystem:(id)a3
{
}

- (MFUserNotificationCenterController)userNotificationCenterController
{
  return self->_userNotificationCenterController;
}

- (void)setUserNotificationCenterController:(id)a3
{
}

- (DaemonSnapshotInvalidator)snapshotInvalidator
{
  return self->_snapshotInvalidator;
}

- (void)setSnapshotInvalidator:(id)a3
{
}

- (MFLibraryReconciler)libraryReconciler
{
  return self->_libraryReconciler;
}

- (void)setLibraryReconciler:(id)a3
{
}

- (EDWidgetUpdateController)widgetUpdateController
{
  return self->_widgetUpdateController;
}

- (void)setWidgetUpdateController:(id)a3
{
}

- (EDSendLaterUpdateController)sendLaterUpdateController
{
  return self->_sendLaterUpdateController;
}

- (void)setSendLaterUpdateController:(id)a3
{
}

- (EMFocusController)focusController
{
  return self->_focusController;
}

- (void)setFocusController:(id)a3
{
}

- (EDOutgoingMessageRepository)outgoingMessageRepository
{
  return self->_outgoingMessageRepository;
}

- (void)setOutgoingMessageRepository:(id)a3
{
}

- (EDMailAnalyticsCollector)mailAnalyticsCollector
{
  return self->_mailAnalyticsCollector;
}

- (EDSearchableIndexBackgroundScheduler)searchableIndexBackgroundScheduler
{
  return self->_searchableIndexBackgroundScheduler;
}

- (void)setSearchableIndexBackgroundScheduler:(id)a3
{
}

- (MFServerMessagesIndexer)serverMessagesIndexer
{
  return self->_serverMessagesIndexer;
}

- (EDCategoryCoreAnalyticsLogger)categoryCoreAnalyticsLogger
{
  return self->_categoryCoreAnalyticsLogger;
}

- (void)setCategoryCoreAnalyticsLogger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryCoreAnalyticsLogger, 0);
  objc_storeStrong((id *)&self->_serverMessagesIndexer, 0);
  objc_storeStrong((id *)&self->_searchableIndexBackgroundScheduler, 0);
  objc_storeStrong((id *)&self->_mailAnalyticsCollector, 0);
  objc_storeStrong((id *)&self->_outgoingMessageRepository, 0);
  objc_storeStrong((id *)&self->_focusController, 0);
  objc_storeStrong((id *)&self->_sendLaterUpdateController, 0);
  objc_storeStrong((id *)&self->_widgetUpdateController, 0);
  objc_storeStrong((id *)&self->_libraryReconciler, 0);
  objc_storeStrong((id *)&self->_snapshotInvalidator, 0);
  objc_storeStrong((id *)&self->_userNotificationCenterController, 0);
  objc_storeStrong((id *)&self->_categorySubsystem, 0);
  objc_storeStrong((id *)&self->_badgeController, 0);
  objc_storeStrong((id *)&self->_purgeableStorageMonitor, 0);
  objc_storeStrong((id *)&self->_syncableSettings, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsCollector, 0);
  objc_storeStrong((id *)&self->_trashCompactor, 0);
  objc_storeStrong((id *)&self->_nanoServer, 0);
  objc_storeStrong((id *)&self->_favoritesPersistence, 0);
  objc_storeStrong((id *)&self->_blockedSenderManager, 0);
  objc_storeStrong((id *)&self->_purgeableStorage, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_snapshotOverrideObservation, 0);
  objc_storeStrong((id *)&self->_clientIsTestingObservation, 0);
  objc_storeStrong((id *)&self->_startupTransaction, 0);
  objc_storeStrong((id *)&self->_systemUserNotificationCenter, 0);
  objc_storeStrong((id *)&self->_contentProtectionQueue, 0);
  objc_storeStrong((id *)&self->_contentProtectionSemaphore, 0);
  objc_storeStrong((id *)&self->_appShortcutProvider, 0);
  objc_storeStrong((id *)&self->_remoteSearchProvider, 0);
  objc_storeStrong((id *)&self->_mailboxProvider, 0);
  objc_storeStrong((id *)&self->_suggestionsDataProvider, 0);
  objc_storeStrong((id *)&self->_networkActivityIndicator, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_fetchController, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_messageRuleLibraryHook, 0);
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_attachmentManager, 0);
}

@end