@interface MFUserNotificationCenterController
- (BOOL)_protectedDataAvailable;
- (BOOL)_settingIsEnabled:(int64_t)a3;
- (BOOL)hasFavoriteMailboxes;
- (BOOL)hasThreads;
- (BOOL)hasVIPs;
- (BOOL)notificationSummarizationEnabled;
- (BOOL)willUseGeneratedSummaries;
- (EDConversationSubscriptionProvider)conversationSubscriptionProvider;
- (EDMessageChangeManager)messageChangeManager;
- (EDMessagePersistence)messagePersistence;
- (EDPersistenceHookRegistry)hookRegistry;
- (EDUserNotificationFilter)notificationFilter;
- (EDUserNotificationMailboxCutoffController)mailboxCutoffController;
- (EFCancelable)notificationPostingDelayToken;
- (EFLocked)notificationsNeedingSummaries;
- (EFLocked)remindMeNotificationsNeedingSummaries;
- (EFLocked)summaryClientsByReference;
- (EMCoreAnalyticsCollector)analyticsCollector;
- (EMVIPReader)vipReader;
- (MFDelayedNotificationPresenter)delayedNotificationPresenter;
- (MFFavoritesReader)favoritesReader;
- (MFMessageResultsGenerator)resultsGenerator;
- (MFNanoServer)nanoServer;
- (MFSystemUserNotificationCenter)systemUserNotificationCenter;
- (MFUserNotificationCenterController)initWithSystemUserNotificationCenter:(id)a3 conversationSubscriptionProvider:(id)a4 favoritesReader:(id)a5 vipReader:(id)a6 blockedSenderReader:(id)a7 messageChangeManager:(id)a8 messagePersistence:(id)a9 hookRegistry:(id)a10 analyticsCollector:(id)a11;
- (MFUserNotificationCenterController)initWithSystemUserNotificationCenter:(id)a3 persistence:(id)a4 favoritesReader:(id)a5 analyticsCollector:(id)a6;
- (MFUserNotificationCenterObserver)observer;
- (MFUserNotificationCenterUpgrader)upgrader;
- (MFUserNotificationSoundController)soundController;
- (MSUserNotificationCenterAnalyticsLogger)notificationAnalyticsLogger;
- (NSDictionary)currentSettingsByTopic;
- (NSLock)summaryClientsLock;
- (NSMutableArray)settingsObservers;
- (OS_dispatch_queue)contentProtectionQueue;
- (OS_dispatch_queue)queue;
- (double)_postingDelayFromDefaults;
- (double)_postingDelayIsMailForeground:(BOOL)a3;
- (id)_coreAnaltyicsForSettings:(id)a3;
- (id)_currentSettingsStringForSettingsByTopic:(id)a3;
- (id)_libraryMessagesForMessageReferences:(id)a3;
- (id)coreAnalyticsPeriodicEvent;
- (id)defaultTopicRequests;
- (id)delayedNotificationsPresenter:(id)a3 userNotificationRequestForNotificationMessage:(id)a4 context:(id)a5;
- (id)notificationRequestForNotificationMessage:(id)a3 destinations:(unint64_t)a4;
- (id)notificationRequestForNotificationMessage:(id)a3 destinations:(unint64_t)a4 isAdd:(BOOL)a5 soundController:(id)a6;
- (id)topicRequestsForAccounts:(id)a3;
- (int64_t)_swipeActionForNotificationActionIdentifier:(id)a3;
- (unint64_t)_defaultEnabledAuthorizationOptionsForAccounts;
- (void)_applicationForegroundStateChanged:(id)a3;
- (void)_loadCurrentSettingsAndNotifyObservers;
- (void)_logCurrentSettings;
- (void)_networkConfigurationChanged:(id)a3;
- (void)_nts_invalidateClient:(id)a3 summaryClientsByReference:(id)a4;
- (void)_performCleanup;
- (void)_performCleanupForNotifications:(id)a3;
- (void)_performCleanupForRemindMeNotifications:(id)a3;
- (void)_performCleanupOnStartup;
- (void)_persistenceDidUpdateSummaryForMessage:(id)a3;
- (void)_registerStateCapture;
- (void)_setupPostingDelayDefaultsObserver;
- (void)_updatePostingDelay:(BOOL)a3;
- (void)activeAccountsDidChangeForNotificationCenterObserver:(id)a3;
- (void)addSettingsObserver:(id)a3;
- (void)cancelSummaryRequestForMessageWithExternalReference:(id)a3;
- (void)cancelSummaryRequestsForAccountWithID:(id)a3;
- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4;
- (void)controller:(id)a3 messageTimerFired:(id)a4;
- (void)conversationFlagsDidChangeForNotificationCenterObserver:(id)a3;
- (void)dealloc;
- (void)delayedNotificationsPresenter:(id)a3 handleUserNotificationRequest:(id)a4 notificationMessage:(id)a5 context:(id)a6;
- (void)handleDidFetchMessages:(id)a3 postImmediately:(BOOL)a4;
- (void)notificationCenterObserver:(id)a3 didStopListeningForChangesForAccountIDs:(id)a4;
- (void)notificationCenterObserver:(id)a3 messageAdded:(id)a4;
- (void)notificationCenterObserver:(id)a3 messagesDeleted:(id)a4;
- (void)notificationCenterObserver:(id)a3 messagesUpdated:(id)a4 flags:(id)a5;
- (void)notificationCenterObserver:(id)a3 removedVIPs:(id)a4;
- (void)notifyMessagesAdded:(id)a3 context:(id)a4;
- (void)notifyMessagesAdded:(id)a3 isSummaryDownload:(BOOL)a4;
- (void)nts_removeNotificationsForRemovedAccounts;
- (void)nts_resetUserNotificationCenterTopics;
- (void)persistenceDidChangeGlobalMessageID:(int64_t)a3 orConversationID:(int64_t)a4 message:(id)a5 generationWindow:(id)a6;
- (void)persistenceDidChangeReadLaterDate:(id)a3 messages:(id)a4 changeIsRemote:(BOOL)a5 generationWindow:(id)a6;
- (void)persistenceDidInitializeConversationSubscriptionProvider;
- (void)persistenceDidUpdateProperties:(id)a3 message:(id)a4 generationWindow:(id)a5;
- (void)processNotificationActionForMessageReferenceURL:(id)a3 actionIdentifier:(id)a4;
- (void)removeNotificationsWithIdentifiers:(id)a3;
- (void)removeSettingsObserver:(id)a3;
- (void)requestSummaryForMessage:(id)a3;
- (void)requestSummaryWithClient:(id)a3;
- (void)resetUserNotificationCenterTopics;
- (void)setDelayedNotificationPresenter:(id)a3;
- (void)setFavoritesReader:(id)a3;
- (void)setHasThreads:(BOOL)a3;
- (void)setHasVIPs:(BOOL)a3;
- (void)setHookRegistry:(id)a3;
- (void)setMessageChangeManager:(id)a3;
- (void)setMessagePersistence:(id)a3;
- (void)setNanoServer:(id)a3;
- (void)setNotificationAnalyticsLogger:(id)a3;
- (void)setNotificationPostingDelayToken:(id)a3;
- (void)setNotificationsNeedingSummaries:(id)a3;
- (void)setObserver:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemindMeNotificationsNeedingSummaries:(id)a3;
- (void)setResultsGenerator:(id)a3;
- (void)setSoundController:(id)a3;
- (void)setSummaryClientsByReference:(id)a3;
- (void)setSummaryClientsLock:(id)a3;
- (void)setSystemUserNotificationCenter:(id)a3;
- (void)setUpgrader:(id)a3;
- (void)start;
- (void)startUpgradeIfNecessary;
- (void)stop;
- (void)updateMessage:(id)a3 withSummary:(id)a4;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)vipsChangedForNotificationCenterObserver:(id)a3;
@end

@implementation MFUserNotificationCenterController

- (MFUserNotificationCenterController)initWithSystemUserNotificationCenter:(id)a3 persistence:(id)a4 favoritesReader:(id)a5 analyticsCollector:(id)a6
{
  id v21 = a3;
  id v10 = a4;
  id v20 = a5;
  id v11 = a6;
  v12 = [v10 conversationPersistence];
  v19 = [v10 vipManager];
  v18 = [v10 blockedSenderManager];
  v17 = [v10 messageChangeManager];
  v13 = [v10 messagePersistence];
  v14 = [v10 hookRegistry];
  v16 = [(MFUserNotificationCenterController *)self initWithSystemUserNotificationCenter:v21 conversationSubscriptionProvider:v12 favoritesReader:v20 vipReader:v19 blockedSenderReader:v18 messageChangeManager:v17 messagePersistence:v13 hookRegistry:v14 analyticsCollector:v11];

  return v16;
}

- (MFUserNotificationCenterController)initWithSystemUserNotificationCenter:(id)a3 conversationSubscriptionProvider:(id)a4 favoritesReader:(id)a5 vipReader:(id)a6 blockedSenderReader:(id)a7 messageChangeManager:(id)a8 messagePersistence:(id)a9 hookRegistry:(id)a10 analyticsCollector:(id)a11
{
  id v64 = a3;
  id v63 = a4;
  id v62 = a5;
  id v61 = a6;
  id v66 = a7;
  id v60 = a8;
  id v59 = a9;
  id v58 = a10;
  id v65 = a11;
  v67.receiver = self;
  v67.super_class = (Class)MFUserNotificationCenterController;
  v18 = [(MFUserNotificationCenterController *)&v67 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_messagePersistence, a9);
    objc_storeStrong((id *)&v19->_systemUserNotificationCenter, a3);
    objc_storeStrong((id *)&v19->_conversationSubscriptionProvider, a4);
    objc_storeStrong((id *)&v19->_favoritesReader, a5);
    objc_storeStrong((id *)&v19->_vipReader, a6);
    objc_storeStrong((id *)&v19->_hookRegistry, a10);
    objc_storeStrong((id *)&v19->_messageChangeManager, a8);
    *(void *)&v19->_settingsLock._os_unfair_lock_opaque = 0;
    id v20 = [[MFUserNotificationCenterObserver alloc] initWithVIPReader:v19->_vipReader favoritesReader:v19->_favoritesReader delegate:v19];
    observer = v19->_observer;
    v19->_observer = v20;

    v22 = [[MFUserNotificationSoundController alloc] initWithUserNotificationCenterObserver:v19->_observer];
    soundController = v19->_soundController;
    v19->_soundController = v22;

    v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v25 = dispatch_queue_attr_make_with_qos_class(v24, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v26 = dispatch_queue_create("com.apple.mail.UserNotificationCenter", v25);
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v26;

    v28 = (EDUserNotificationFilter *)[objc_alloc((Class)EDUserNotificationFilter) initWithBlockedSenderReader:v66 vipReader:v19->_vipReader];
    notificationFilter = v19->_notificationFilter;
    v19->_notificationFilter = v28;

    v30 = (EDUserNotificationMailboxCutoffController *)objc_alloc_init((Class)EDUserNotificationMailboxCutoffController);
    mailboxCutoffController = v19->_mailboxCutoffController;
    v19->_mailboxCutoffController = v30;

    [(MFSystemUserNotificationCenter *)v19->_systemUserNotificationCenter setDelegate:v19];
    [(MFSystemUserNotificationCenter *)v19->_systemUserNotificationCenter setPrivateDelegate:v19];
    [(MFSystemUserNotificationCenter *)v19->_systemUserNotificationCenter setWantsNotificationResponsesDelivered];
    v32 = +[NSNotificationCenter defaultCenter];
    [v32 addObserver:v19 selector:"_applicationForegroundStateChanged:" name:EDClientStateForegroundStateDidChangeNotification object:0];

    v33 = objc_alloc_init(MFDelayedNotificationPresenter);
    delayedNotificationPresenter = v19->_delayedNotificationPresenter;
    v19->_delayedNotificationPresenter = v33;

    [(MFDelayedNotificationPresenter *)v19->_delayedNotificationPresenter setDelegate:v19];
    v35 = MFUserAgent();
    -[MFUserNotificationCenterController _updatePostingDelay:](v19, "_updatePostingDelay:", [v35 isForeground]);

    id v36 = objc_alloc((Class)EFLocked);
    v37 = +[NSMapTable strongToWeakObjectsMapTable];
    v38 = (EFLocked *)[v36 initWithObject:v37];
    summaryClientsByReference = v19->_summaryClientsByReference;
    v19->_summaryClientsByReference = v38;

    v40 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    settingsObservers = v19->_settingsObservers;
    v19->_settingsObservers = v40;

    [(EDPersistenceHookRegistry *)v19->_hookRegistry registerMessageChangeHookResponder:v19];
    [(EDPersistenceHookRegistry *)v19->_hookRegistry registerDatabaseChangeHookResponder:v19];
    id v42 = objc_alloc((Class)EFLocked);
    id v43 = objc_alloc_init((Class)NSMutableSet);
    v44 = (EFLocked *)[v42 initWithObject:v43];
    notificationsNeedingSummaries = v19->_notificationsNeedingSummaries;
    v19->_notificationsNeedingSummaries = v44;

    id v46 = objc_alloc((Class)EFLocked);
    id v47 = objc_alloc_init((Class)NSMutableDictionary);
    v48 = (EFLocked *)[v46 initWithObject:v47];
    remindMeNotificationsNeedingSummaries = v19->_remindMeNotificationsNeedingSummaries;
    v19->_remindMeNotificationsNeedingSummaries = v48;

    objc_storeStrong((id *)&v19->_analyticsCollector, a11);
    id v50 = [(EMCoreAnalyticsCollector *)v19->_analyticsCollector registerForLogEventsWithPeriodicDataProvider:v19];
    v51 = (MSUserNotificationCenterAnalyticsLogger *)[objc_alloc((Class)MSUserNotificationCenterAnalyticsLogger) initWithCoreAnalyticsCollector:v65];
    notificationAnalyticsLogger = v19->_notificationAnalyticsLogger;
    v19->_notificationAnalyticsLogger = v51;

    v53 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v54 = dispatch_queue_attr_make_with_qos_class(v53, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v55 = dispatch_queue_create("com.apple.email.MFUserNotificationCenterController.contentProtectionQueue", v54);
    contentProtectionQueue = v19->_contentProtectionQueue;
    v19->_contentProtectionQueue = (OS_dispatch_queue *)v55;

    EFRegisterContentProtectionObserver();
    [(MFUserNotificationCenterController *)v19 _setupPostingDelayDefaultsObserver];
    [(MFUserNotificationCenterController *)v19 _registerStateCapture];
  }

  return v19;
}

- (void)dealloc
{
  [(EFCancelable *)self->_stateCancelable cancel];
  EFUnregisterContentProtectionObserver();
  v3.receiver = self;
  v3.super_class = (Class)MFUserNotificationCenterController;
  [(MFUserNotificationCenterController *)&v3 dealloc];
}

- (void)start
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009D4F4;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_sync(queue, block);
  v4 = objc_alloc_init(MFNanoServer);
  nanoServer = self->_nanoServer;
  self->_nanoServer = v4;

  [(MFUserNotificationCenterController *)self startUpgradeIfNecessary];
  [(MFUserNotificationCenterController *)self _loadCurrentSettingsAndNotifyObservers];
  v6 = [(MFUserNotificationCenterController *)self observer];
  [v6 startObserving];

  [(MFUserNotificationCenterController *)self _performCleanupOnStartup];
  v7 = +[NSNotificationCenter defaultCenter];
  v8 = +[MFNetworkController sharedInstance];
  [v7 addObserver:self selector:"_networkConfigurationChanged:" name:NetworkConfigurationDidChangeNotification object:v8];
}

- (void)stop
{
  id v4 = [(MFUserNotificationCenterController *)self observer];
  [v4 startObserving];

  id v5 = +[NSNotificationCenter defaultCenter];
  objc_super v3 = +[MFNetworkController sharedInstance];
  [v5 removeObserver:self name:NetworkConfigurationDidChangeNotification object:v3];
}

- (void)_registerStateCapture
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v3 = &_dispatch_main_q;
  objc_copyWeak(&v6, &location);
  EFLogRegisterStateCaptureBlock();
  id v4 = (EFCancelable *)objc_claimAutoreleasedReturnValue();
  stateCancelable = self->_stateCancelable;
  self->_stateCancelable = v4;

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (BOOL)willUseGeneratedSummaries
{
  p_summarizationSettingLock = &self->_summarizationSettingLock;
  os_unfair_lock_lock(&self->_summarizationSettingLock);
  unsigned __int8 v4 = [(MFUserNotificationCenterController *)self notificationSummarizationEnabled];
  os_unfair_lock_unlock(p_summarizationSettingLock);
  int v5 = _os_feature_enabled_impl();
  if (v5) {
    LOBYTE(v5) = EMIsGreymatterAvailableWithOverride() & v4;
  }
  return v5;
}

- (void)startUpgradeIfNecessary
{
  id v3 = [MFUserNotificationCenterUpgrader alloc];
  id v10 = [(MFUserNotificationCenterController *)self systemUserNotificationCenter];
  unsigned __int8 v4 = [(MFUserNotificationCenterController *)self conversationSubscriptionProvider];
  int v5 = [(MFUserNotificationCenterController *)self favoritesReader];
  id v6 = [(MFUserNotificationCenterController *)self vipReader];
  v7 = [(MFUserNotificationCenterController *)self observer];
  v8 = [v7 activeAccounts];
  v9 = [(MFUserNotificationCenterUpgrader *)v3 initWithDelegate:self systemUserNotificationCenter:v10 conversationSubscriptionProvider:v4 favoritesReader:v5 vipReader:v6 activeAccounts:v8];
  [(MFUserNotificationCenterController *)self setUpgrader:v9];

  id v11 = [(MFUserNotificationCenterController *)self upgrader];
  [v11 performUpgradeIfNecessary];
}

- (double)_postingDelayIsMailForeground:(BOOL)a3
{
  if (a3 && ![(MFUserNotificationCenterController *)self willUseGeneratedSummaries]) {
    return 2.0;
  }

  [(MFUserNotificationCenterController *)self _postingDelayFromDefaults];
  return result;
}

- (void)_applicationForegroundStateChanged:(id)a3
{
  id v6 = [a3 userInfo];
  unsigned __int8 v4 = [v6 objectForKeyedSubscript:EDClientStateForegroundStateDidChangeKeyIsForeground];
  id v5 = [v4 BOOLValue];

  [(MFUserNotificationCenterController *)self _updatePostingDelay:v5];
}

- (double)_postingDelayFromDefaults
{
  v2 = +[NSUserDefaults em_userDefaults];
  id v3 = [v2 valueForKey:EMUserDefaultNotificationPostingDelayTime];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = MSUserNotificationCenterPostingDelay;
  }

  return v5;
}

- (void)_setupPostingDelayDefaultsObserver
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v3 = +[NSUserDefaults em_userDefaults];
  uint64_t v4 = EMUserDefaultNotificationPostingDelayTime;
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  v8 = sub_10009DCE4;
  v9 = &unk_10013AD48;
  objc_copyWeak(&v10, &location);
  double v5 = objc_msgSend(v3, "ef_observeKeyPath:options:autoCancelToken:usingBlock:", v4, 5, 1, &v6);
  -[MFUserNotificationCenterController setNotificationPostingDelayToken:](self, "setNotificationPostingDelayToken:", v5, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_updatePostingDelay:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MFUserNotificationCenterController *)self delayedNotificationPresenter];
  [(MFUserNotificationCenterController *)self _postingDelayIsMailForeground:v3];
  objc_msgSend(v5, "setPostingDelay:");
}

- (void)notifyMessagesAdded:(id)a3 isSummaryDownload:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v6 = objc_alloc_init(_MFUserNotificationCenterControllerContext);
  [(_MFUserNotificationCenterControllerContext *)v6 setIsSummaryDownload:v4];
  [(MFUserNotificationCenterController *)self notifyMessagesAdded:v7 context:v6];
}

- (void)notifyMessagesAdded:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009DF40;
  block[3] = &unk_10013ABC8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)nts_removeNotificationsForRemovedAccounts
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v3 = [(MFUserNotificationCenterController *)self observer];
  BOOL v4 = [v3 activeAccounts];
  id v5 = objc_msgSend(v4, "ef_map:", &stru_10013D6C8);

  id v6 = [(MFSystemUserNotificationCenter *)self->_systemUserNotificationCenter deliveredNotifications];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10009E858;
  v11[3] = &unk_10013D6F0;
  id v7 = v5;
  id v12 = v7;
  v8 = objc_msgSend(v6, "ef_compactMap:", v11);
  if ([v8 count])
  {
    id v9 = MSUserNotificationsLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v8 count];
      *(_DWORD *)buf = 134217984;
      id v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Removing %lu notifications due to account changes.", buf, 0xCu);
    }

    [(MFUserNotificationCenterController *)self removeNotificationsWithIdentifiers:v8];
  }
}

- (void)handleDidFetchMessages:(id)a3 postImmediately:(BOOL)a4
{
  id v21 = a3;
  id v6 = MSUserNotificationsLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v29 = v21;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "fetched messages = %{public}@", buf, 0xCu);
  }

  id v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v21 count]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v21;
  id v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v24;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v10);
        id v12 = objc_msgSend(v11, "notificationID", v21);
        id v13 = [(MFUserNotificationCenterController *)self delayedNotificationPresenter];
        [v13 schedulePendingNotificationMessage:v11 identifier:v12 context:@"add"];

        unsigned int v14 = [(MFUserNotificationCenterController *)self willUseGeneratedSummaries];
        if (a4) {
          goto LABEL_13;
        }
        if (!v14)
        {
          v17 = [v11 summary];
          BOOL v18 = v17 == 0;

          if (v18) {
            goto LABEL_14;
          }
          goto LABEL_13;
        }
        v15 = [v11 libraryMessage];
        v16 = [v15 generatedSummary];
        if (v16)
        {

LABEL_13:
          [v7 addObject:v12];
          goto LABEL_14;
        }

LABEL_14:
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v19 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      id v8 = v19;
    }
    while (v19);
  }

  if ([v7 count])
  {
    id v20 = [(MFUserNotificationCenterController *)self delayedNotificationPresenter];
    [v20 immediatelyProcessPendingMessagesWithIdentifiers:v7];
  }
}

- (void)removeNotificationsWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = MSUserNotificationsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v19 = [v4 count];
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing %lu notifications with identifiers: %@", buf, 0x16u);
  }

  id v6 = [(MFUserNotificationCenterController *)self notificationAnalyticsLogger];
  [v6 notificationRemovedWithNotificationIDs:v4];

  id v7 = [(MFUserNotificationCenterController *)self delayedNotificationPresenter];
  [v7 removePendingMessagesWithIdentifiers:v4];

  id v8 = [(MFUserNotificationCenterController *)self systemUserNotificationCenter];
  [v8 removePendingNotificationRequestsWithIdentifiers:v4];

  uint64_t v9 = [(MFUserNotificationCenterController *)self systemUserNotificationCenter];
  [v9 removeDeliveredNotificationsWithIdentifiers:v4];

  notificationsNeedingSummaries = self->_notificationsNeedingSummaries;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10009EF08;
  v16[3] = &unk_10013D718;
  id v11 = v4;
  id v17 = v11;
  [(EFLocked *)notificationsNeedingSummaries performWhileLocked:v16];
  remindMeNotificationsNeedingSummaries = self->_remindMeNotificationsNeedingSummaries;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10009EF14;
  v14[3] = &unk_10013D740;
  id v13 = v11;
  id v15 = v13;
  [(EFLocked *)remindMeNotificationsNeedingSummaries performWhileLocked:v14];
}

- (id)delayedNotificationsPresenter:(id)a3 userNotificationRequestForNotificationMessage:(id)a4 context:(id)a5
{
  id v7 = a4;
  id v8 = [@"add" isEqual:a5];
  if (([v7 isRemindMe] & 1) != 0
    || ([(MFUserNotificationCenterController *)self mailboxCutoffController],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        [v7 libraryMessage],
        id v10 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v11 = [v9 isMessageAboveMailboxCutoff:v10],
        v10,
        v9,
        (v11 & 1) != 0))
  {
    uint64_t v12 = 0;
  }
  else
  {
    id v13 = MSUserNotificationsLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      id v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Notification is below cutoff. Sending directly to NotificationCener. %{public}@", (uint8_t *)&v17, 0xCu);
    }

    uint64_t v12 = 4;
  }
  unsigned int v14 = [(MFUserNotificationCenterController *)self soundController];
  id v15 = [(MFUserNotificationCenterController *)self notificationRequestForNotificationMessage:v7 destinations:v12 isAdd:v8 soundController:v14];

  return v15;
}

- (id)notificationRequestForNotificationMessage:(id)a3 destinations:(unint64_t)a4
{
  id v4 = [(MFUserNotificationCenterController *)self notificationRequestForNotificationMessage:a3 destinations:a4 isAdd:0 soundController:0];

  return v4;
}

- (id)notificationRequestForNotificationMessage:(id)a3 destinations:(unint64_t)a4 isAdd:(BOOL)a5 soundController:(id)a6
{
  BOOL v57 = a5;
  id v8 = a3;
  id v61 = a6;
  id v60 = [v8 notificationID];
  uint64_t v9 = MSUserNotificationsLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "ef_publicDescription");
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v68 = v10;
    __int16 v69 = 2048;
    unint64_t v70 = a4;
    __int16 v71 = 1026;
    BOOL v72 = v57;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "notificationRequestForNotificationMessage: %{public}@, destinations=%lu, isAdd=%{public}d", buf, 0x1Cu);
  }
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  nanoServer = self->_nanoServer;
  id v13 = [v8 account];
  unsigned int v14 = [v8 libraryMessage];
  id v15 = [v14 mailbox];
  v16 = [v15 URLString];
  id v17 = [v8 status];
  id v18 = [v8 dateReceived];
  id v19 = [(MFNanoServer *)nanoServer nanoBulletinFlagsForMessageFromAccount:v13 mailboxURLString:v16 status:v17 dateReceived:v18];

  if (v19) {
    __int16 v20 = v19;
  }
  else {
    __int16 v20 = &__NSDictionary0__struct;
  }
  [v11 setObject:v20 forKeyedSubscript:MSUserNotificationContentKeyNanoFlags];
  id v21 = [v8 messageReference];
  [v11 setObject:v21 forKeyedSubscript:MSUserNotificationContentKeyMessageReference];

  v22 = [v8 accountID];
  [v11 setObject:v22 forKeyedSubscript:MSUserNotificationContentKeyAccountReference];

  long long v23 = [v8 nanoMessageId];
  [v11 setObject:v23 forKeyedSubscript:MSUserNotificationContentKeyNanoMessageId];

  dispatch_queue_t v55 = [v8 senderAddress];
  objc_msgSend(v11, "setObject:forKeyedSubscript:");
  v56 = [v8 suppressionContexts];
  if (v56 && ([v8 isRemindMe] & 1) == 0)
  {
    long long v24 = [v56 allObjects];
    long long v25 = [v24 componentsJoinedByString:@","];

    [v11 setObject:v25 forKeyedSubscript:MSUserNotificationContentKeySuppressionContext];
  }
  id v59 = [v8 coalesceThreadID];
  id v26 = objc_alloc_init((Class)UNMutableNotificationContent);
  v27 = [v8 title];
  [v26 setTitle:v27];

  v28 = [v8 subtitle];
  [v26 setSubtitle:v28];

  id v29 = [v8 dateReceived];
  if (!v29) {
    goto LABEL_12;
  }
  v30 = [v8 dateReceived];
  v31 = +[NSDate date];
  unsigned int v32 = objc_msgSend(v30, "ef_isEarlierThanDate:", v31);

  if (v32)
  {
    v33 = [v8 dateReceived];
    [v26 setDate:v33];
  }
  else
  {
LABEL_12:
    v33 = +[NSDate date];
    [v26 setDate:v33];
  }

  [v26 setCategoryIdentifier:@"mail-message"];
  v34 = [v8 messageReference];
  v35 = +[NSURL URLWithString:v34];
  [v26 setDefaultActionURL:v35];

  id v36 = [v8 topicIdentifiers];
  [v26 setTopicIdentifiers:v36];

  v37 = [v8 accountID];
  [v26 setFilterCriteria:v37];

  if ([v8 isRemindMe])
  {
    v38 = [v8 remindMeDate];
    [v26 setDate:v38];
  }
  v39 = [v8 summary];
  if ([v39 length])
  {
    [v26 setBody:v39];
    v40 = @"Summary added";
LABEL_19:
    char v42 = 1;
    goto LABEL_20;
  }
  if (v39)
  {
    v41 = MFLookupLocalizedString();
    [v26 setBody:v41];

    v40 = @"Summary not found";
    goto LABEL_19;
  }
  if ([v8 isRemindMe]) {
    +[EDRemindMeNotificationController localizedRemindMeNotificationTitle];
  }
  else {
  v52 = MFLookupLocalizedString();
  }
  [v26 setBody:v52];

  [v11 setObject:&__kCFBooleanTrue forKeyedSubscript:MSUserNotificationContentKeyMissingSummary];
  unsigned int v53 = [v8 isRemindMe];
  v54 = @"Summary loading";
  if (v53) {
    v54 = @"Summary for RemindMe will load on unlock";
  }
  v40 = v54;
  char v42 = 0;
LABEL_20:
  id v43 = MSUserNotificationsLog();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v68 = v40;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Notification Request For Message: %{public}@", buf, 0xCu);
  }

  if ([v8 isRemindMe])
  {
    remindMeNotificationsNeedingSummaries = self->_remindMeNotificationsNeedingSummaries;
    v45 = v65;
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_10009FB98;
    v65[3] = &unk_10013D768;
    char v66 = v42;
    v65[4] = v8;
    [(EFLocked *)remindMeNotificationsNeedingSummaries performWhileLocked:v65];
  }
  else
  {
    notificationsNeedingSummaries = self->_notificationsNeedingSummaries;
    v45 = v62;
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_10009FD00;
    v62[3] = &unk_10013D790;
    char v63 = v42;
    v62[4] = v8;
    BOOL v64 = v57;
    [(EFLocked *)notificationsNeedingSummaries performWhileLocked:v62];
  }

  [v26 setThreadIdentifier:v59];
  [v26 setUserInfo:v11];
  char v47 = [v8 isRemindMe] ^ 1;
  if (!v61) {
    char v47 = 1;
  }
  if (v47)
  {
    if (v61 && v57)
    {
      v49 = [v8 suppressionContexts];
      [v61 addSoundIfNecessaryForNotificationContent:v26 suppressionContexts:v49];
    }
  }
  else
  {
    v48 = MSUserNotificationsLog();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
      sub_1000C245C(v48);
    }

    [v61 addRemindMeSoundForNotificationContent:v26];
  }
  if (a4) {
    +[UNNotificationRequest requestWithIdentifier:content:trigger:destinations:](UNNotificationRequest, "requestWithIdentifier:content:trigger:destinations:", v60, v26, 0);
  }
  else {
  id v50 = +[UNNotificationRequest requestWithIdentifier:v60 content:v26 trigger:0];
  }

  return v50;
}

- (void)delayedNotificationsPresenter:(id)a3 handleUserNotificationRequest:(id)a4 notificationMessage:(id)a5 context:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  unsigned int v12 = [@"add" isEqual:v11];
  unsigned int v13 = [@"modify" isEqual:v11];
  unsigned int v14 = [v9 content];
  id v15 = [v14 userInfo];
  v16 = [v15 objectForKeyedSubscript:MSUserNotificationContentKeyMissingSummary];
  unsigned __int8 v17 = [v16 BOOLValue];

  id v18 = [v10 notificationID];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  if (v12)
  {
    id v19 = [(MFUserNotificationCenterController *)self systemUserNotificationCenter];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000A01E0;
    v29[3] = &unk_10013D7B8;
    __int16 v20 = &v32;
    objc_copyWeak(&v32, &location);
    id v30 = v9;
    char v33 = v17 ^ 1;
    id v31 = v18;
    [v19 addNotificationRequest:v30 withCompletionHandler:v29];
    id v21 = &v30;
    v22 = &v31;
LABEL_5:

    objc_destroyWeak(v20);
    goto LABEL_6;
  }
  if (v13)
  {
    id v19 = [(MFUserNotificationCenterController *)self systemUserNotificationCenter];
    long long v23 = [v9 content];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000A0440;
    v24[3] = &unk_10013D7B8;
    __int16 v20 = &v27;
    objc_copyWeak(&v27, &location);
    id v25 = v9;
    char v28 = v17 ^ 1;
    id v26 = v18;
    [v19 replaceContentForRequestWithIdentifier:v26 replacementContent:v23 completionHandler:v24];
    id v21 = &v25;
    v22 = &v26;

    goto LABEL_5;
  }
LABEL_6:
  objc_destroyWeak(&location);
}

- (void)resetUserNotificationCenterTopics
{
  BOOL v3 = [(MFUserNotificationCenterController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A0700;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)nts_resetUserNotificationCenterTopics
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v3 = [(MFUserNotificationCenterController *)self observer];
  id v4 = [v3 activeAccounts];

  id v5 = MSUserNotificationsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Generating new topics based on active accounts: %{public}@", buf, 0xCu);
  }

  id v6 = +[NSSet setWithArray:v4];
  id v7 = [(MFUserNotificationCenterController *)self topicRequestsForAccounts:v6];

  id v8 = [(MFUserNotificationCenterController *)self defaultTopicRequests];
  if ([v7 count] && objc_msgSend(v8, "count"))
  {
    uint64_t v9 = [v7 setByAddingObjectsFromSet:v8];

    id v7 = (void *)v9;
  }
  id v10 = MSUserNotificationsLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setting new NotificationCenter topics: %@", buf, 0xCu);
  }

  id v11 = [(MFUserNotificationCenterController *)self systemUserNotificationCenter];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000A0994;
  v13[3] = &unk_10013A0C0;
  id v12 = v7;
  id v14 = v12;
  [v11 setNotificationTopics:v12 withCompletionHandler:v13];
}

- (id)topicRequestsForAccounts:(id)a3
{
  BOOL v3 = objc_msgSend(a3, "ef_compactMap:", &stru_10013D7F8);

  return v3;
}

- (unint64_t)_defaultEnabledAuthorizationOptionsForAccounts
{
  return EMBlackPearlIsFeatureEnabled() ^ 1;
}

- (id)defaultTopicRequests
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  id v4 = [(MFUserNotificationCenterController *)self vipReader];
  unsigned int v5 = [v4 hasVIPs];

  if (v5)
  {
    id v6 = MFLookupLocalizedString();
    id v7 = +[UNNotificationTopicRequest topicRequestWithIdentifier:MSUserNotificationCenterTopicVIP displayName:v6 priority:2 sortIdentifier:@"vip" supportedOptions:5 enabledOptions:5];
    [v3 addObject:v7];
  }
  if ([(MFUserNotificationCenterController *)self hasFavoriteMailboxes])
  {
    id v8 = MFLookupLocalizedString();
    uint64_t v9 = +[UNNotificationTopicRequest topicRequestWithIdentifier:MSUserNotificationCenterTopicFavoriteMailboxes displayName:v8 priority:1 sortIdentifier:@"favorites" supportedOptions:4 enabledOptions:0];
    [v3 addObject:v9];
  }
  id v10 = [(MFUserNotificationCenterController *)self conversationSubscriptionProvider];
  unsigned int v11 = [v10 hasSubscribedConversations];

  if (v11)
  {
    id v12 = MFLookupLocalizedString();
    unsigned int v13 = +[UNNotificationTopicRequest topicRequestWithIdentifier:MSUserNotificationCenterTopicNotifiedThreads displayName:v12 priority:3 sortIdentifier:@"Thread" supportedOptions:5 enabledOptions:5];
    [v3 addObject:v13];
  }
  id v14 = MFLookupLocalizedString();
  id v15 = +[UNNotificationTopicRequest topicRequestWithIdentifier:MSUserNotificationCenterTopicRemindMe displayName:v14 priority:4 sortIdentifier:@"RemindMe" supportedOptions:7 enabledOptions:7];
  [v3 addObject:v15];

  if (EMBlackPearlIsFeatureEnabled())
  {
    v16 = _EFLocalizedStringFromTable();
    unsigned __int8 v17 = +[UNNotificationTopicRequest topicRequestWithIdentifier:MSUserNotificationCenterTopicPrimary displayName:v16 priority:5 sortIdentifier:@"Primary Inbox" supportedOptions:6 enabledOptions:0];
    [v3 addObject:v17];

    id v18 = _EFLocalizedStringFromTable();
    id v19 = +[UNNotificationTopicRequest topicRequestWithIdentifier:MSUserNotificationCenterTopicPrimaryMessageBadges displayName:v18 priority:5 sortIdentifier:@"Unread Messages in Primary" supportedOptions:5 enabledOptions:1];
    [v3 addObject:v19];

    __int16 v20 = _EFLocalizedStringFromTable();
    id v21 = +[UNNotificationTopicRequest topicRequestWithIdentifier:MSUserNotificationCenterTopicAllMessages displayName:v20 priority:5 sortIdentifier:@"All Unread Messages" supportedOptions:5 enabledOptions:0];
    [v3 addObject:v21];
  }

  return v3;
}

- (BOOL)hasFavoriteMailboxes
{
  v2 = [(MFUserNotificationCenterController *)self favoritesReader];
  unsigned __int8 v3 = [v2 hasFavoriteMailboxes];

  return v3;
}

- (void)notificationCenterObserver:(id)a3 messageAdded:(id)a4
{
}

- (void)notificationCenterObserver:(id)a3 messagesUpdated:(id)a4 flags:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A1124;
  block[3] = &unk_10013ABC8;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);
}

- (void)notificationCenterObserver:(id)a3 messagesDeleted:(id)a4
{
  id v5 = a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000A15EC;
  v9[3] = &unk_10013BD90;
  v9[4] = self;
  id v6 = objc_msgSend(v5, "ef_compactMap:", v9);
  id v7 = MSUserNotificationsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 count];
    *(_DWORD *)buf = 134349314;
    id v11 = v8;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removing notifications for %{public}lu deleted messages: %{public}@", buf, 0x16u);
  }

  [(MFUserNotificationCenterController *)self removeNotificationsWithIdentifiers:v6];
}

- (void)vipsChangedForNotificationCenterObserver:(id)a3
{
  id v4 = MSUserNotificationsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Reloading User Notification Center topics due to VIPs change", v5, 2u);
  }

  [(MFUserNotificationCenterController *)self resetUserNotificationCenterTopics];
}

- (void)notificationCenterObserver:(id)a3 removedVIPs:(id)a4
{
  id v5 = [(MFUserNotificationCenterController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A1778;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_async(v5, block);
}

- (void)conversationFlagsDidChangeForNotificationCenterObserver:(id)a3
{
  id v4 = MSUserNotificationsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Reloading User Notification Center topics due to Conversation Flags change", v5, 2u);
  }

  [(MFUserNotificationCenterController *)self resetUserNotificationCenterTopics];
}

- (void)notificationCenterObserver:(id)a3 didStopListeningForChangesForAccountIDs:(id)a4
{
  id v5 = a4;
  id v6 = MSUserNotificationsLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No longer listenting for changes for accounts: %{public}@", buf, 0xCu);
  }

  id v7 = [(MFUserNotificationCenterController *)self delayedNotificationPresenter];
  [v7 removePendingMessagesWithAccountIdentifiers:v5];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        -[MFUserNotificationCenterController cancelSummaryRequestsForAccountWithID:](self, "cancelSummaryRequestsForAccountWithID:", *(void *)(*((void *)&v12 + 1) + 8 * (void)v11), (void)v12);
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)activeAccountsDidChangeForNotificationCenterObserver:(id)a3
{
  id v4 = MSUserNotificationsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Active accounts changes. Will rebuild topics and remove stale notifictions", buf, 2u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A2020;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)controller:(id)a3 messageTimerFired:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    id v7 = MSUserNotificationsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_msgSend(v6, "ef_publicDescription");
      *(_DWORD *)buf = 138543362;
      long long v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Remind Me: messageTimerFired message:%{public}@", buf, 0xCu);
    }
    id v9 = objc_alloc_init(_MFUserNotificationCenterControllerContext);
    [(_MFUserNotificationCenterControllerContext *)v9 setIsRemindMe:1];
    uint64_t v10 = +[NSDate now];
    [(_MFUserNotificationCenterControllerContext *)v9 setRemindMeDate:v10];

    id v12 = v6;
    id v11 = +[NSArray arrayWithObjects:&v12 count:1];
    [(MFUserNotificationCenterController *)self notifyMessagesAdded:v11 context:v9];
  }
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(void))a5;
  id v9 = +[EFProcessTransaction transactionWithDescription:@"Handle Notification Action Transaction"];
  uint64_t v10 = [v7 notification];
  id v11 = [v7 actionIdentifier];
  id v12 = MSUserNotificationsLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138543874;
    id v27 = v7;
    __int16 v28 = 2114;
    id v29 = v10;
    __int16 v30 = 2114;
    id v31 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Did receive response %{public}@ for notification: %{public}@ and action: %{public}@", (uint8_t *)&v26, 0x20u);
  }

  long long v13 = [v7 notification];
  long long v14 = [v13 request];
  long long v15 = [v14 content];
  v16 = [v15 userInfo];

  unsigned __int8 v17 = [v16 objectForKeyedSubscript:MSUserNotificationContentKeyMessageReference];
  id v18 = +[NSURL URLWithString:v17];

  if (v18)
  {
    [(MFUserNotificationCenterController *)self processNotificationActionForMessageReferenceURL:v18 actionIdentifier:v11];
  }
  else
  {
    id v19 = MSUserNotificationsLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000C2580((uint64_t)v7, v19, v20, v21, v22, v23, v24, v25);
    }
  }
  [v9 invalidate];
  if (v8) {
    v8[2](v8);
  }
}

- (void)addSettingsObserver:(id)a3
{
  id v7 = a3;
  p_settingsLock = &self->_settingsLock;
  os_unfair_lock_lock(&self->_settingsLock);
  id v5 = [(MFUserNotificationCenterController *)self settingsObservers];
  [v5 addObject:v7];

  id v6 = [(MFUserNotificationCenterController *)self currentSettingsByTopic];
  os_unfair_lock_unlock(p_settingsLock);
  if (v6) {
    [v7 userNotificationCenterSettingsDidChange:v6];
  }
}

- (void)removeSettingsObserver:(id)a3
{
  id v6 = a3;
  p_settingsLock = &self->_settingsLock;
  os_unfair_lock_lock(&self->_settingsLock);
  id v5 = [(MFUserNotificationCenterController *)self settingsObservers];
  [v5 removeObject:v6];

  os_unfair_lock_unlock(p_settingsLock);
}

- (void)_loadCurrentSettingsAndNotifyObservers
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  systemUserNotificationCenter = self->_systemUserNotificationCenter;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A27A0;
  v7[3] = &unk_10013D888;
  objc_copyWeak(&v8, &location);
  [(MFSystemUserNotificationCenter *)systemUserNotificationCenter getNotificationSettingsWithCompletionHandler:v7];
  id v4 = self->_systemUserNotificationCenter;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000A2928;
  v5[3] = &unk_10013AD48;
  objc_copyWeak(&v6, &location);
  [(MFSystemUserNotificationCenter *)v4 getNotificationSettingsForTopicsWithCompletionHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_logCurrentSettings
{
  p_settingsLock = &self->_settingsLock;
  os_unfair_lock_lock(&self->_settingsLock);
  id v4 = self->_currentSettingsByTopic;
  os_unfair_lock_unlock(p_settingsLock);
  id v5 = MSUserNotificationsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(MFUserNotificationCenterController *)self _currentSettingsStringForSettingsByTopic:v4];
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v7, 0xCu);
  }
}

- (id)_currentSettingsStringForSettingsByTopic:(id)a3
{
  id v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000A2CA8;
  v6[3] = &unk_10013D8B0;
  id v4 = [objc_alloc((Class)NSMutableString) initWithString:@"User Notification Settings\n"];
  id v7 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];

  return v4;
}

- (id)coreAnalyticsPeriodicEvent
{
  p_settingsLock = &self->_settingsLock;
  os_unfair_lock_lock(&self->_settingsLock);
  id v4 = [(NSDictionary *)self->_currentSettingsByTopic copy];
  os_unfair_lock_unlock(p_settingsLock);
  id v5 = [(MFUserNotificationCenterController *)self _coreAnaltyicsForSettings:v4];

  return v5;
}

- (id)_coreAnaltyicsForSettings:(id)a3
{
  uint64_t v103 = 0;
  v104 = &v103;
  uint64_t v105 = 0x2020000000;
  uint64_t v106 = 0;
  uint64_t v99 = 0;
  v100 = &v99;
  uint64_t v101 = 0x2020000000;
  uint64_t v102 = 0;
  uint64_t v95 = 0;
  v96 = &v95;
  uint64_t v97 = 0x2020000000;
  uint64_t v98 = 0;
  uint64_t v91 = 0;
  v92 = &v91;
  uint64_t v93 = 0x2020000000;
  uint64_t v94 = 0;
  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x2020000000;
  uint64_t v90 = 0;
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x2020000000;
  char v86 = 0;
  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x2020000000;
  char v82 = 0;
  uint64_t v75 = 0;
  v76 = &v75;
  uint64_t v77 = 0x2020000000;
  char v78 = 0;
  uint64_t v71 = 0;
  BOOL v72 = &v71;
  uint64_t v73 = 0x2020000000;
  char v74 = 0;
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x2020000000;
  char v70 = 0;
  uint64_t v63 = 0;
  BOOL v64 = &v63;
  uint64_t v65 = 0x2020000000;
  char v66 = 0;
  uint64_t v59 = 0;
  id v60 = &v59;
  uint64_t v61 = 0x2020000000;
  char v62 = 0;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  char v58 = 0;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  char v54 = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  char v50 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v27 = 0;
  __int16 v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000A3798;
  v26[3] = &unk_10013D8D8;
  v26[4] = self;
  v26[5] = &v83;
  v26[6] = &v79;
  v26[7] = &v75;
  v26[8] = &v71;
  v26[9] = &v35;
  v26[10] = &v67;
  v26[11] = &v63;
  v26[12] = &v59;
  v26[13] = &v55;
  v26[14] = &v27;
  v26[15] = &v51;
  v26[16] = &v47;
  v26[17] = &v43;
  v26[18] = &v39;
  v26[19] = &v31;
  v26[20] = &v103;
  v26[21] = &v99;
  v26[22] = &v95;
  v26[23] = &v91;
  v26[24] = &v87;
  [a3 enumerateKeysAndObjectsUsingBlock:v26];
  v107[0] = @"totalAccounts";
  v108[0] = +[NSNumber numberWithInteger:v104[3]];
  v107[1] = @"accountsWithAlertsEnabled";
  uint64_t v25 = (void *)v108[0];
  uint64_t v24 = +[NSNumber numberWithInteger:v100[3]];
  v108[1] = v24;
  v107[2] = @"accountsWithLockScreenEnabled";
  uint64_t v23 = +[NSNumber numberWithInteger:v96[3]];
  v108[2] = v23;
  v107[3] = @"accountsWithSoundEnabled";
  uint64_t v22 = +[NSNumber numberWithInteger:v92[3]];
  v108[3] = v22;
  v107[4] = @"accountsWithBadgesEnabled";
  uint64_t v21 = +[NSNumber numberWithInteger:v88[3]];
  v108[4] = v21;
  v107[5] = @"hasVIP";
  uint64_t v20 = +[NSNumber numberWithBool:*((unsigned __int8 *)v36 + 24)];
  v108[5] = v20;
  v107[6] = @"vipAlertsEnabled";
  id v19 = +[NSNumber numberWithBool:*((unsigned __int8 *)v84 + 24)];
  v108[6] = v19;
  v107[7] = @"vipLockScreenEnabled";
  id v18 = +[NSNumber numberWithBool:*((unsigned __int8 *)v80 + 24)];
  v108[7] = v18;
  v107[8] = @"vipSoundsEnabled";
  unsigned __int8 v17 = +[NSNumber numberWithBool:*((unsigned __int8 *)v76 + 24)];
  v108[8] = v17;
  v107[9] = @"vipBadgesEnabled";
  v16 = +[NSNumber numberWithBool:*((unsigned __int8 *)v72 + 24)];
  v108[9] = v16;
  v107[10] = @"hasNotifyThreads";
  long long v15 = +[NSNumber numberWithBool:*((unsigned __int8 *)v28 + 24)];
  v108[10] = v15;
  v107[11] = @"notifyThreadAlertsEnabled";
  id v3 = +[NSNumber numberWithBool:*((unsigned __int8 *)v68 + 24)];
  v108[11] = v3;
  v107[12] = @"notifyThreadsLockScreenEnabled";
  id v4 = +[NSNumber numberWithBool:*((unsigned __int8 *)v64 + 24)];
  v108[12] = v4;
  v107[13] = @"notifyThreadSoundsEnabled";
  id v5 = +[NSNumber numberWithBool:*((unsigned __int8 *)v60 + 24)];
  v108[13] = v5;
  v107[14] = @"notifyThreadBadgesEnabled";
  id v6 = +[NSNumber numberWithBool:*((unsigned __int8 *)v56 + 24)];
  v108[14] = v6;
  v107[15] = @"hasFavorites";
  id v7 = +[NSNumber numberWithBool:*((unsigned __int8 *)v32 + 24)];
  v108[15] = v7;
  v107[16] = @"favoritesAlertsEnabled";
  id v8 = +[NSNumber numberWithBool:*((unsigned __int8 *)v52 + 24)];
  v108[16] = v8;
  v107[17] = @"favoritesLockScreenEnabled";
  id v9 = +[NSNumber numberWithBool:*((unsigned __int8 *)v48 + 24)];
  v108[17] = v9;
  v107[18] = @"favoritesSoundsEnabled";
  uint64_t v10 = +[NSNumber numberWithBool:*((unsigned __int8 *)v44 + 24)];
  v108[18] = v10;
  v107[19] = @"favoritesBadgesEnabled";
  id v11 = +[NSNumber numberWithBool:*((unsigned __int8 *)v40 + 24)];
  v108[19] = v11;
  id v12 = +[NSDictionary dictionaryWithObjects:v108 forKeys:v107 count:20];

  id v13 = [objc_alloc((Class)EMCoreAnalyticsEvent) initWithEventName:@"com.apple.mail.usernotifications.settings" collectionData:v12];
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(&v91, 8);
  _Block_object_dispose(&v95, 8);
  _Block_object_dispose(&v99, 8);
  _Block_object_dispose(&v103, 8);

  return v13;
}

- (BOOL)_settingIsEnabled:(int64_t)a3
{
  return a3 == 2;
}

- (void)processNotificationActionForMessageReferenceURL:(id)a3 actionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(MFUserNotificationCenterController *)self _swipeActionForNotificationActionIdentifier:v7];
  id v9 = [(MFUserNotificationCenterController *)self messagePersistence];
  uint64_t v10 = [v9 messageObjectIDForURL:v6];

  id v11 = [(MFUserNotificationCenterController *)self messagePersistence];
  uint64_t v47 = v10;
  id v12 = +[NSArray arrayWithObjects:&v47 count:1];
  id v13 = [v11 persistedMessagesForMessageObjectIDs:v12 requireProtectedData:0 temporarilyUnavailableMessageObjectIDs:0];

  if ([v13 count])
  {
    if ((v8 & 0xFFFFFFFFFFFFFFFELL) == 8)
    {
      long long v14 = [v13 firstObject];
      long long v15 = [v14 account];
      v16 = v15;
      if (v8 == 9) {
        uint64_t v17 = 2;
      }
      else {
        uint64_t v17 = 3;
      }
      id v18 = [v15 mailboxForType:v17];
      id v19 = [(MFUserNotificationCenterController *)self messageChangeManager];
      uint64_t v20 = [v18 URL];
      id v21 = [v19 moveMessages:v13 destinationMailboxURL:v20 userInitiated:0];

      uint64_t v22 = MSUserNotificationsLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = ECNSStringFromMailboxMailboxType();
        int v43 = 138543618;
        id v44 = v23;
        __int16 v45 = 2114;
        id v46 = v6;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "process notification %{public}@ action for messageID: %{public}@.", (uint8_t *)&v43, 0x16u);
      }
      goto LABEL_20;
    }
    if (v8 == 6)
    {
      char v34 = [(MFUserNotificationCenterController *)self messageChangeManager];
      uint64_t v35 = +[ECMessageFlagChange setFlagged];
      id v36 = [v34 applyFlagChange:v35 toMessages:v13];

      long long v14 = MSUserNotificationsLog();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      int v43 = 138543362;
      id v44 = v6;
      uint64_t v33 = "process notification flag action for messageID: %{public}@.";
      goto LABEL_17;
    }
    if (v8 == 2)
    {
      char v30 = [(MFUserNotificationCenterController *)self messageChangeManager];
      uint64_t v31 = +[ECMessageFlagChange setRead];
      id v32 = [v30 applyFlagChange:v31 toMessages:v13];

      long long v14 = MSUserNotificationsLog();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      int v43 = 138543362;
      id v44 = v6;
      uint64_t v33 = "process notification mark as read action for messageID: %{public}@.";
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v33, (uint8_t *)&v43, 0xCu);
      goto LABEL_20;
    }
    long long v14 = MSUserNotificationsLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000C2658((uint64_t)v7, v14, v37, v38, v39, v40, v41, v42);
    }
  }
  else
  {
    long long v14 = MSUserNotificationsLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000C25EC((uint64_t)v6, v14, v24, v25, v26, v27, v28, v29);
    }
  }
LABEL_20:
}

- (int64_t)_swipeActionForNotificationActionIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MSMailNotificationActionIdentifierPrefix;
  if ([v3 hasPrefix:MSMailNotificationActionIdentifierPrefix])
  {
    id v5 = objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v4, "length"));
    int64_t v6 = +[MFTriageActionUtilities triageActionForActionKey:v5];
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (void)persistenceDidInitializeConversationSubscriptionProvider
{
  id v3 = MSUserNotificationsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Generating new topics due to conversation provider initialization", v4, 2u);
  }

  [(MFUserNotificationCenterController *)self resetUserNotificationCenterTopics];
}

- (void)persistenceDidUpdateProperties:(id)a3 message:(id)a4 generationWindow:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v9 = [v7 containsObject:ECMessagePropertySummary];
    id v10 = [v7 containsObject:EDPersistedMessagePropertyGeneratedSummary];
    id v11 = v10;
    if (v9)
    {
      [(MFUserNotificationCenterController *)self _persistenceDidUpdateSummaryForMessage:v8];
      if ((v11 & 1) == 0)
      {
LABEL_9:
        uint64_t v17 = [(MFUserNotificationCenterController *)self notificationAnalyticsLogger];
        id v18 = [v8 notificationID];
        [v17 messageSummaryAddedForNotificationID:v18 isGeneratedSummary:v11];

        goto LABEL_10;
      }
LABEL_6:
      id v12 = MSUserNotificationsLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [v8 notificationID];
        *(_DWORD *)buf = 138543362;
        id v21 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Generated summary updated for %{public}@", buf, 0xCu);
      }
      long long v14 = [(MFUserNotificationCenterController *)self delayedNotificationPresenter];
      long long v15 = [v8 notificationID];
      id v19 = v15;
      v16 = +[NSArray arrayWithObjects:&v19 count:1];
      [v14 immediatelyProcessPendingMessagesWithIdentifiers:v16];

      goto LABEL_9;
    }
    if (v10) {
      goto LABEL_6;
    }
  }
LABEL_10:
}

- (void)_persistenceDidUpdateSummaryForMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 notificationID];
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  notificationsNeedingSummaries = self->_notificationsNeedingSummaries;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000A466C;
  v21[3] = &unk_10013D900;
  uint64_t v23 = &v24;
  id v7 = v5;
  id v22 = v7;
  [(EFLocked *)notificationsNeedingSummaries performWhileLocked:v21];
  summaryClientsByReference = self->_summaryClientsByReference;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000A4758;
  v18[3] = &unk_10013D928;
  id v9 = v4;
  id v19 = v9;
  uint64_t v20 = &v24;
  [(EFLocked *)summaryClientsByReference performWhileLocked:v18];
  if (*((unsigned char *)v25 + 24))
  {
    id v10 = MSUserNotificationsLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v9 summary];
      unsigned int v12 = [v11 length];
      id v13 = objc_msgSend(v9, "ef_publicDescription");
      *(_DWORD *)buf = 67109378;
      unsigned int v30 = v12;
      __int16 v31 = 2114;
      id v32 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Persistence did update summary=%u, message=%{public}@", buf, 0x12u);
    }
    id v28 = v9;
    long long v14 = +[NSArray arrayWithObjects:&v28 count:1];
    [(MFUserNotificationCenterController *)self notifyMessagesAdded:v14 isSummaryDownload:1];
  }
  else
  {
    long long v14 = MSUserNotificationsLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      long long v15 = [v9 summary];
      unsigned int v16 = [v15 length];
      uint64_t v17 = objc_msgSend(v9, "ef_publicDescription");
      *(_DWORD *)buf = 67109378;
      unsigned int v30 = v16;
      __int16 v31 = 2114;
      id v32 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Persistence did update summary=%u, message=%{public}@, but there were no notifications needing summaries", buf, 0x12u);
    }
  }

  _Block_object_dispose(&v24, 8);
}

- (void)persistenceDidChangeGlobalMessageID:(int64_t)a3 orConversationID:(int64_t)a4 message:(id)a5 generationWindow:(id)a6
{
  id v8 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A48D0;
  block[3] = &unk_10013A8A8;
  id v13 = self;
  int64_t v14 = a4;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, block);
}

- (void)persistenceDidChangeReadLaterDate:(id)a3 messages:(id)a4 changeIsRemote:(BOOL)a5 generationWindow:(id)a6
{
  id v9 = a4;
  id v10 = MSUserNotificationsLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = NSStringFromSelector(a2);
    int v17 = 138543618;
    id v18 = v11;
    __int16 v19 = 2048;
    id v20 = [v9 count];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ message.count:%ld", (uint8_t *)&v17, 0x16u);
  }
  id v12 = v9;
  id v13 = v12;
  if (!a3)
  {
    int64_t v14 = objc_msgSend(v12, "ef_compactMap:", &stru_10013D970);
    long long v15 = MSUserNotificationsLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v14 count];
      int v17 = 134349314;
      id v18 = v16;
      __int16 v19 = 2114;
      id v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Removing Remind Me notifications for %{public}lu messages: %{public}@", (uint8_t *)&v17, 0x16u);
    }

    [(MFUserNotificationCenterController *)self removeNotificationsWithIdentifiers:v14];
  }
}

- (void)_networkConfigurationChanged:(id)a3
{
  id v4 = +[MFNetworkController sharedInstance];
  unsigned int v5 = [v4 isDataAvailable];

  if (v5)
  {
    uint64_t v8 = 0;
    id v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    notificationsNeedingSummaries = self->_notificationsNeedingSummaries;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000A4F04;
    v7[3] = &unk_10013D998;
    void v7[4] = &v8;
    [(EFLocked *)notificationsNeedingSummaries performWhileLocked:v7];
    if (*((unsigned char *)v9 + 24)) {
      [(MFUserNotificationCenterController *)self _performCleanup];
    }
    _Block_object_dispose(&v8, 8);
  }
}

- (void)requestSummaryWithClient:(id)a3
{
  id v4 = a3;
  unsigned int v5 = MSUserNotificationsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v6 = objc_msgSend(v4, "ef_publicDescription");
    *(_DWORD *)buf = 138543362;
    long long v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "requestSummaryWithClient=%{public}@", buf, 0xCu);
  }
  summaryClientsByReference = self->_summaryClientsByReference;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000A51F8;
  v12[3] = &unk_10013D9C0;
  id v8 = v4;
  id v13 = v8;
  [(EFLocked *)summaryClientsByReference performWhileLocked:v12];
  id v9 = [v8 message];
  uint64_t v10 = [v9 account];
  char v11 = +[MessageBodyLoader loaderForAccount:v10];
  [v11 addSingleMessageClient:v8];
}

- (void)requestSummaryForMessage:(id)a3
{
  id v4 = a3;
  unsigned int v5 = MSUserNotificationsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v6 = objc_msgSend(v4, "ef_publicDescription");
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "requestSummaryForMessage=%{public}@", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [[_MFUserNotificationCenterSummaryClient alloc] initWithObserver:self message:v4];
  [(MFUserNotificationCenterController *)self requestSummaryWithClient:v7];
}

- (void)_nts_invalidateClient:(id)a3 summaryClientsByReference:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  int64_t v6 = [v11 message];
  id v7 = objc_msgSend(v6, "mf_externalReference");

  [v11 setObserver:0];
  int v8 = [v11 message];
  id v9 = [v8 account];
  uint64_t v10 = +[MessageBodyLoader loaderForAccount:v9];
  [v10 removeSingleMessageClient:v11];

  if (v7) {
    [v5 removeObjectForKey:v7];
  }
}

- (void)cancelSummaryRequestForMessageWithExternalReference:(id)a3
{
  id v4 = a3;
  id v5 = [(MFUserNotificationCenterController *)self summaryClientsLock];
  [v5 lock];

  summaryClientsByReference = self->_summaryClientsByReference;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000A5600;
  v8[3] = &unk_10013D9E8;
  id v7 = v4;
  id v9 = v7;
  uint64_t v10 = self;
  [(EFLocked *)summaryClientsByReference performWhileLocked:v8];
}

- (void)cancelSummaryRequestsForAccountWithID:(id)a3
{
  id v4 = a3;
  id v5 = MSUserNotificationsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "cancelSummaryRequestsForAccountWithID=%{public}@", buf, 0xCu);
  }

  summaryClientsByReference = self->_summaryClientsByReference;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000A57D4;
  v8[3] = &unk_10013D9E8;
  id v7 = v4;
  id v9 = v7;
  uint64_t v10 = self;
  [(EFLocked *)summaryClientsByReference performWhileLocked:v8];
}

- (void)updateMessage:(id)a3 withSummary:(id)a4
{
  id v5 = a3;
  summaryClientsByReference = self->_summaryClientsByReference;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000A5A38;
  v8[3] = &unk_10013D9C0;
  id v9 = v5;
  id v7 = v5;
  [(EFLocked *)summaryClientsByReference performWhileLocked:v8];
}

- (void)_performCleanupOnStartup
{
  if ([(MFUserNotificationCenterController *)self _protectedDataAvailable])
  {
    [(MFUserNotificationCenterController *)self _performCleanup];
  }
  else
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:self selector:"_performCleanupOnStartup" name:MailMessageLibraryDidFinishReconciliation object:0];
  }
}

- (void)_performCleanup
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A5BE0;
  block[3] = &unk_100139C48;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_performCleanupForRemindMeNotifications:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = sub_1000A5DD8;
  v10[4] = sub_1000A5DE8;
  id v11 = (id)0xAAAAAAAAAAAAAAAALL;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A5DF0;
  block[3] = &unk_10013DA78;
  void block[4] = self;
  id v8 = v4;
  id v9 = v10;
  id v6 = v4;
  dispatch_async(queue, block);

  _Block_object_dispose(v10, 8);
}

- (id)_libraryMessagesForMessageReferences:(id)a3
{
  id v3 = objc_msgSend(a3, "ef_compactMap:", &stru_10013DA98);
  id v4 = +[MFMessageCriterion orCompoundCriterionWithCriteria:v3];
  id v5 = +[MFMailMessageLibrary defaultInstance];
  id v6 = [v5 messagesMatchingCriterion:v4 options:6297663];

  return v6;
}

- (void)_performCleanupForNotifications:(id)a3
{
  id v30 = a3;
  __int16 v31 = self;
  if (![(MFUserNotificationCenterController *)self _protectedDataAvailable])
  {
    id v4 = MSUserNotificationsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Not performing cleanup. Protected data is not available.", buf, 2u);
    }
  }
  id v5 = MSUserNotificationsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Performing cleanup", buf, 2u);
  }

  id v35 = objc_alloc_init((Class)NSMutableArray);
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  id v7 = objc_alloc_init((Class)NSMutableSet);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v30;
  id v8 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v41;
    uint64_t v10 = MSUserNotificationContentKeyMessageReference;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        id v13 = [v12 request];
        int64_t v14 = [v13 identifier];

        [v7 addObject:v14];
        long long v15 = [v12 request];
        id v16 = [v15 content];
        int v17 = [v16 userInfo];

        [v6 setObject:v17 forKeyedSubscript:v14];
        id v18 = [v17 objectForKeyedSubscript:v10];
        objc_msgSend(v35, "ef_addOptionalObject:", v18);
      }
      id v8 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v8);
  }

  [(MFUserNotificationCenterController *)v31 _libraryMessagesForMessageReferences:v35];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  id v19 = [v34 countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v37;
    uint64_t v32 = MSUserNotificationContentKeyMissingSummary;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v37 != v20) {
          objc_enumerationMutation(v34);
        }
        id v22 = *(void **)(*((void *)&v36 + 1) + 8 * (void)j);
        uint64_t v23 = [v22 notificationID];
        if (([v22 read] & 1) == 0 && (objc_msgSend(v22, "deleted") & 1) == 0)
        {
          [v7 removeObject:v23];
          uint64_t v24 = [v6 objectForKeyedSubscript:v23];
          uint64_t v25 = [v24 objectForKeyedSubscript:v32];
          unsigned int v26 = [v25 BOOLValue];

          if (v26) {
            [(MFUserNotificationCenterController *)v31 requestSummaryForMessage:v22];
          }
        }
      }
      id v19 = [v34 countByEnumeratingWithState:&v36 objects:v48 count:16];
    }
    while (v19);
  }

  if ([v7 count])
  {
    char v27 = MSUserNotificationsLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = [v7 count];
      *(_DWORD *)buf = 134218242;
      id v45 = v28;
      __int16 v46 = 2114;
      id v47 = v7;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Removing %lu stale notifications during cleanup. %{public}@", buf, 0x16u);
    }

    uint64_t v29 = [v7 allObjects];
    [(MFUserNotificationCenterController *)v31 removeNotificationsWithIdentifiers:v29];
  }
}

- (BOOL)_protectedDataAvailable
{
  v2 = +[MFMailMessageLibrary defaultInstance];
  id v3 = [v2 protectedDataAvailability];

  return v3 == 0;
}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  if (!a3)
  {
    uint64_t v7 = 0;
    id v8 = &v7;
    uint64_t v9 = 0x3032000000;
    uint64_t v10 = sub_1000A5DD8;
    id v11 = sub_1000A5DE8;
    id v12 = 0;
    remindMeNotificationsNeedingSummaries = self->_remindMeNotificationsNeedingSummaries;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000A6CD4;
    v6[3] = &unk_10013DAC0;
    void v6[4] = &v7;
    -[EFLocked performWhileLocked:](remindMeNotificationsNeedingSummaries, "performWhileLocked:", v6, a4);
    if ([(id)v8[5] count]) {
      [(MFUserNotificationCenterController *)self _performCleanupForRemindMeNotifications:v8[5]];
    }
    _Block_object_dispose(&v7, 8);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)contentProtectionQueue
{
  return self->_contentProtectionQueue;
}

- (EDConversationSubscriptionProvider)conversationSubscriptionProvider
{
  return self->_conversationSubscriptionProvider;
}

- (EMVIPReader)vipReader
{
  return self->_vipReader;
}

- (MFFavoritesReader)favoritesReader
{
  return self->_favoritesReader;
}

- (void)setFavoritesReader:(id)a3
{
}

- (EDUserNotificationFilter)notificationFilter
{
  return self->_notificationFilter;
}

- (EDUserNotificationMailboxCutoffController)mailboxCutoffController
{
  return self->_mailboxCutoffController;
}

- (MFMessageResultsGenerator)resultsGenerator
{
  return self->_resultsGenerator;
}

- (void)setResultsGenerator:(id)a3
{
}

- (NSLock)summaryClientsLock
{
  return self->_summaryClientsLock;
}

- (void)setSummaryClientsLock:(id)a3
{
}

- (MFSystemUserNotificationCenter)systemUserNotificationCenter
{
  return self->_systemUserNotificationCenter;
}

- (void)setSystemUserNotificationCenter:(id)a3
{
}

- (MFUserNotificationCenterUpgrader)upgrader
{
  return self->_upgrader;
}

- (void)setUpgrader:(id)a3
{
}

- (MFUserNotificationCenterObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
}

- (MFUserNotificationSoundController)soundController
{
  return self->_soundController;
}

- (void)setSoundController:(id)a3
{
}

- (EFLocked)summaryClientsByReference
{
  return self->_summaryClientsByReference;
}

- (void)setSummaryClientsByReference:(id)a3
{
}

- (BOOL)hasVIPs
{
  return self->_hasVIPs;
}

- (void)setHasVIPs:(BOOL)a3
{
  self->_hasVIPs = a3;
}

- (BOOL)hasThreads
{
  return self->_hasThreads;
}

- (void)setHasThreads:(BOOL)a3
{
  self->_hasThreads = a3;
}

- (MFDelayedNotificationPresenter)delayedNotificationPresenter
{
  return self->_delayedNotificationPresenter;
}

- (void)setDelayedNotificationPresenter:(id)a3
{
}

- (NSMutableArray)settingsObservers
{
  return self->_settingsObservers;
}

- (NSDictionary)currentSettingsByTopic
{
  return self->_currentSettingsByTopic;
}

- (BOOL)notificationSummarizationEnabled
{
  return self->_notificationSummarizationEnabled;
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

- (void)setHookRegistry:(id)a3
{
}

- (EFLocked)notificationsNeedingSummaries
{
  return self->_notificationsNeedingSummaries;
}

- (void)setNotificationsNeedingSummaries:(id)a3
{
}

- (EFLocked)remindMeNotificationsNeedingSummaries
{
  return self->_remindMeNotificationsNeedingSummaries;
}

- (void)setRemindMeNotificationsNeedingSummaries:(id)a3
{
}

- (MFNanoServer)nanoServer
{
  return self->_nanoServer;
}

- (void)setNanoServer:(id)a3
{
}

- (EDMessageChangeManager)messageChangeManager
{
  return self->_messageChangeManager;
}

- (void)setMessageChangeManager:(id)a3
{
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (void)setMessagePersistence:(id)a3
{
}

- (EMCoreAnalyticsCollector)analyticsCollector
{
  return self->_analyticsCollector;
}

- (MSUserNotificationCenterAnalyticsLogger)notificationAnalyticsLogger
{
  return self->_notificationAnalyticsLogger;
}

- (void)setNotificationAnalyticsLogger:(id)a3
{
}

- (EFCancelable)notificationPostingDelayToken
{
  return self->_notificationPostingDelayToken;
}

- (void)setNotificationPostingDelayToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationPostingDelayToken, 0);
  objc_storeStrong((id *)&self->_notificationAnalyticsLogger, 0);
  objc_storeStrong((id *)&self->_analyticsCollector, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_messageChangeManager, 0);
  objc_storeStrong((id *)&self->_nanoServer, 0);
  objc_storeStrong((id *)&self->_remindMeNotificationsNeedingSummaries, 0);
  objc_storeStrong((id *)&self->_notificationsNeedingSummaries, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_currentSettingsByTopic, 0);
  objc_storeStrong((id *)&self->_settingsObservers, 0);
  objc_storeStrong((id *)&self->_delayedNotificationPresenter, 0);
  objc_storeStrong((id *)&self->_summaryClientsByReference, 0);
  objc_storeStrong((id *)&self->_soundController, 0);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_upgrader, 0);
  objc_storeStrong((id *)&self->_systemUserNotificationCenter, 0);
  objc_storeStrong((id *)&self->_summaryClientsLock, 0);
  objc_storeStrong((id *)&self->_resultsGenerator, 0);
  objc_storeStrong((id *)&self->_mailboxCutoffController, 0);
  objc_storeStrong((id *)&self->_notificationFilter, 0);
  objc_storeStrong((id *)&self->_favoritesReader, 0);
  objc_storeStrong((id *)&self->_vipReader, 0);
  objc_storeStrong((id *)&self->_conversationSubscriptionProvider, 0);
  objc_storeStrong((id *)&self->_contentProtectionQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_stateCancelable, 0);
}

@end