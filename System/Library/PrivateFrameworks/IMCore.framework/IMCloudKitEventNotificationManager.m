@interface IMCloudKitEventNotificationManager
+ (id)logHandle;
+ (id)sharedInstance;
+ (void)__setSingleton__im:(id)a3;
- (BOOL)_hasProgressEventListeners;
- (BOOL)accountHasiMessageEnabled;
- (BOOL)didPromptForCloudKitSync;
- (IMCloudKitEventHandlerAccountInfoProvider)accountInfoProvider;
- (IMCloudKitEventNotificationManager)init;
- (IMCloudKitSyncProgress)progressToSend;
- (IMCloudKitSyncState)previousState;
- (IMCloudKitSyncState)syncState;
- (IMEventNotificationManager)notificationManager;
- (IMWeakReferenceCollection)eventHandlers;
- (NSTimer)fetchStatsTimer;
- (double)progressBroadcastDelay;
- (double)progressPollingInterval;
- (id)cloudKitHooks;
- (id)logHandle;
- (id)syncStateWithDictionary:(id)a3;
- (void)_cancelStatsFetchingTimer;
- (void)_fetchSyncStateStatistics:(id)a3;
- (void)_rescheduleFetchSyncProgress;
- (void)_sendHiddenProgressToEventListeners;
- (void)_sendProgressToEventListeners:(id)a3;
- (void)_sendProgressToEventListenersDeferred;
- (void)_sendSyncStateChangedEventToEventListeners:(id)a3;
- (void)_sendSyncStatisticsToEventHandlers:(id)a3 error:(id)a4;
- (void)_syncStateDidChange:(id)a3;
- (void)_timerExpiredForSyncStatsFetching:(id)a3;
- (void)_updateProgressWithState:(id)a3;
- (void)addEventHandler:(id)a3;
- (void)disableAllSyncEnabledCloudKitDevices;
- (void)fetchRampStateWithCompletion:(id)a3;
- (void)fetchSyncDebuggingInfo:(id)a3;
- (void)fetchSyncState;
- (void)fetchSyncStateAfterClearingErrors;
- (void)fetchSyncStateAfterClearingErrorsWithRepairSuccess:(BOOL)a3 completion:(id)a4;
- (void)fetchSyncStateAfterFetchingAccountStatus;
- (void)fetchSyncStateStatistics;
- (void)fetchSyncStateStatisticsWithCompletion:(id)a3;
- (void)fetchSyncStateWithCompletion:(id)a3;
- (void)performAdditionalStorageRequiredCheck;
- (void)removeEventHandler:(id)a3;
- (void)setAccountInfoProvider:(id)a3;
- (void)setCloudKitSyncEnabled:(BOOL)a3;
- (void)setCloudKitSyncEnabled:(BOOL)a3 withCompletion:(id)a4;
- (void)setDidPromptForCloudKitSync:(BOOL)a3;
- (void)setFetchStatsTimer:(id)a3;
- (void)setNotificationManager:(id)a3;
- (void)setPreviousState:(id)a3;
- (void)setProgressPollingInterval:(double)a3;
- (void)setProgressToSend:(id)a3;
- (void)startInitialSync;
- (void)startPeriodicSync;
- (void)startUserInitiatedSync;
- (void)visitEventHandlers:(id)a3;
@end

@implementation IMCloudKitEventNotificationManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A4AFDBA8;
  block[3] = &unk_1E5B7B2A8;
  block[4] = a1;
  if (qword_1EB3F2330 != -1) {
    dispatch_once(&qword_1EB3F2330, block);
  }
  v2 = (void *)qword_1E965E768;

  return v2;
}

- (IMCloudKitEventNotificationManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)IMCloudKitEventNotificationManager;
  v2 = [(IMCloudKitEventNotificationManager *)&v14 init];
  v3 = v2;
  if (v2)
  {
    v2->_progressPollingInterval = 30.0;
    v4 = (IMWeakReferenceCollection *)objc_alloc_init(MEMORY[0x1E4F6EAD8]);
    eventHandlers = v3->_eventHandlers;
    v3->_eventHandlers = v4;

    v6 = (IMEventNotificationManager *)objc_alloc_init(MEMORY[0x1E4F6E770]);
    notificationManager = v3->_notificationManager;
    v3->_notificationManager = v6;

    v11 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v8, v9, v10);
    objc_msgSend_addObserver_selector_name_object_(v11, v12, (uint64_t)v3, (uint64_t)sel__syncStateDidChange_, @"com.apple.IMCore.IMCloudKitHooks.ValuesChanged", 0);
  }
  return v3;
}

- (void)fetchSyncState
{
  objc_msgSend_cloudKitHooks(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_broadcastCloudKitState(v7, v4, v5, v6);
}

- (void)_syncStateDidChange:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_userInfo(a3, a2, (uint64_t)a3, v3);
  v8 = objc_msgSend_syncStateWithDictionary_(self, v6, (uint64_t)v5, v7);

  objc_msgSend_setPreviousState_(self, v9, (uint64_t)v8, v10);
  objc_super v14 = objc_msgSend_logHandle(self, v11, v12, v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v19 = 138412290;
    v20 = v8;
    _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "received new sync state: %@", (uint8_t *)&v19, 0xCu);
  }

  objc_msgSend__sendSyncStateChangedEventToEventListeners_(self, v15, (uint64_t)v8, v16);
  objc_msgSend__updateProgressWithState_(self, v17, (uint64_t)v8, v18);
}

- (id)syncStateWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [IMCloudKitSyncState alloc];
  uint64_t v9 = objc_msgSend_accountHasiMessageEnabled(self, v6, v7, v8);
  v11 = objc_msgSend_initWithAccountEnabled_stateDictionary_(v5, v10, v9, (uint64_t)v4);

  return v11;
}

- (void)setPreviousState:(id)a3
{
}

- (id)logHandle
{
  uint64_t v2 = objc_opt_class();

  return (id)objc_msgSend_logHandle(v2, v3, v4, v5);
}

- (BOOL)accountHasiMessageEnabled
{
  uint64_t v5 = objc_msgSend_accountInfoProvider(self, a2, v2, v3);

  if (!v5) {
    return 1;
  }
  uint64_t v9 = objc_msgSend_accountInfoProvider(self, v6, v7, v8);
  char v12 = objc_msgSend_cloudKitEventNotificationManagerAccountHasiMessageEnabled_(v9, v10, (uint64_t)self, v11);

  return v12;
}

- (IMCloudKitEventHandlerAccountInfoProvider)accountInfoProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);

  return (IMCloudKitEventHandlerAccountInfoProvider *)WeakRetained;
}

- (void)_updateProgressWithState:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_fetchStatsTimer(self, v5, v6, v7);

  if (v8)
  {
    char v12 = objc_msgSend_logHandle(self, v9, v10, v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_INFO, "Rescheduled sync progress: cancelled", v25, 2u);
    }

    objc_msgSend__cancelStatsFetchingTimer(self, v13, v14, v15);
  }
  if (objc_msgSend__hasProgressEventListeners(self, v9, v10, v11))
  {
    int v19 = objc_msgSend_logHandle(self, v16, v17, v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_1A4CB76FC(v19);
    }

    v22 = objc_msgSend_createSyncProgressWithSyncStatistics_(v4, v20, 0, v21);
    objc_msgSend__sendProgressToEventListeners_(self, v23, (uint64_t)v22, v24);
  }
}

- (NSTimer)fetchStatsTimer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fetchStatsTimer);

  return (NSTimer *)WeakRetained;
}

- (void)_sendSyncStateChangedEventToEventListeners:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1A4B6A6D8;
  v8[3] = &unk_1E5B7B948;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  objc_msgSend_visitEventHandlers_(self, v6, (uint64_t)v8, v7);
}

- (BOOL)_hasProgressEventListeners
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1A4B6C664;
  v5[3] = &unk_1E5B7BB30;
  v5[4] = &v6;
  objc_msgSend_visitEventHandlers_(self, a2, (uint64_t)v5, v2);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)visitEventHandlers:(id)a3
{
  objc_msgSend_enumerateObjectsUsingBlock_(self->_eventHandlers, a2, (uint64_t)a3, v3);
}

+ (id)logHandle
{
  if (qword_1EB3F22F0 != -1) {
    dispatch_once(&qword_1EB3F22F0, &unk_1EF8E51D8);
  }
  uint64_t v2 = (void *)qword_1EB3F2308;

  return v2;
}

- (id)cloudKitHooks
{
  return (id)objc_msgSend_sharedInstance(IMCloudKitHooks, a2, v2, v3);
}

- (void)setProgressPollingInterval:(double)a3
{
  self->_progressPollingInterval = a3;
}

+ (void)__setSingleton__im:(id)a3
{
}

- (void)addEventHandler:(id)a3
{
  objc_msgSend_addObject_(self->_eventHandlers, a2, (uint64_t)a3, v3);
}

- (void)removeEventHandler:(id)a3
{
  objc_msgSend_removeObject_(self->_eventHandlers, a2, (uint64_t)a3, v3);
}

- (IMCloudKitSyncState)syncState
{
  id v5 = objc_msgSend_previousState(self, a2, v2, v3);
  if (!v5)
  {
    uint64_t v6 = [IMCloudKitSyncState alloc];
    uint64_t v10 = objc_msgSend_accountHasiMessageEnabled(self, v7, v8, v9);
    uint64_t v14 = objc_msgSend_cloudKitHooks(self, v11, v12, v13);
    uint64_t v18 = objc_msgSend_syncStateDictionary(v14, v15, v16, v17);
    id v5 = objc_msgSend_initWithAccountEnabled_stateDictionary_(v6, v19, v10, (uint64_t)v18);
  }

  return (IMCloudKitSyncState *)v5;
}

- (void)fetchSyncStateAfterFetchingAccountStatus
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Requesting to broadcast CloudKit syncState after fetching account status", v11, 2u);
    }
  }
  uint64_t v7 = objc_msgSend_cloudKitHooks(self, v3, v4, v5);
  objc_msgSend_broadcastCloudKitStateAfterFetchingAccountStatus(v7, v8, v9, v10);
}

- (void)fetchSyncStateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_notificationManager(self, v5, v6, v7);
  uint64_t v10 = objc_msgSend_createEventListenerForNotificationName_object_(v8, v9, @"com.apple.IMCore.IMCloudKitHooks.ValuesChanged", 0);

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1A4B6A908;
  v13[3] = &unk_1E5B7B990;
  v13[4] = self;
  id v14 = v4;
  id v11 = v4;
  objc_msgSend_startListeningForEventTarget_sendStartingEvent_completion_(v10, v12, (uint64_t)self, (uint64_t)&unk_1EF8E5D18, v13);
}

- (void)fetchRampStateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_notificationManager(self, v5, v6, v7);
  uint64_t v10 = objc_msgSend_createEventListenerForNotificationName_object_(v8, v9, @"IMCloudKitFetchedRampStateNotification", 0);

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1A4B6AB3C;
  v13[3] = &unk_1E5B7B9B8;
  id v14 = v4;
  id v11 = v4;
  objc_msgSend_startListeningForEventTarget_sendStartingEvent_completion_(v10, v12, (uint64_t)self, (uint64_t)&unk_1EF8E5D98, v13);
}

- (void)fetchSyncStateAfterClearingErrors
{
  uint64_t v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  char isMessagesIniCloudVersion2 = objc_msgSend_isMessagesIniCloudVersion2(v5, v6, v7, v8);

  if ((isMessagesIniCloudVersion2 & 1) == 0)
  {
    objc_msgSend_cloudKitHooks(self, v10, v11, v12);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_broadcastCloudKitStateAfterClearingErrors(v16, v13, v14, v15);
  }
}

- (void)fetchSyncStateAfterClearingErrorsWithRepairSuccess:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v10 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v7, v8, v9);
  char isMessagesIniCloudVersion2 = objc_msgSend_isMessagesIniCloudVersion2(v10, v11, v12, v13);

  if ((isMessagesIniCloudVersion2 & 1) == 0)
  {
    uint64_t v18 = objc_msgSend_notificationManager(self, v15, v16, v17);
    v20 = objc_msgSend_createEventListenerForNotificationName_object_(v18, v19, @"com.apple.IMCore.IMCloudKitHooks.ValuesChanged", 0);

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1A4B6AE3C;
    v22[3] = &unk_1E5B7B9E0;
    v22[4] = self;
    id v23 = v6;
    BOOL v24 = a3;
    objc_msgSend_startListeningForEventTarget_sendStartingEvent_completion_(v20, v21, (uint64_t)self, (uint64_t)&unk_1EF8E4150, v22);
  }
}

- (void)setCloudKitSyncEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = @"NO";
      if (v3) {
        uint64_t v9 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v9;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "set messages in cloud enabled: %@", buf, 0xCu);
    }
  }
  uint64_t v10 = objc_msgSend_notificationManager(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_createEventListenerForNotificationName_object_(v10, v11, @"com.apple.IMCore.IMCloudKitHooks.SetEnabledReturned", 0);

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1A4B6B2B4;
  v14[3] = &unk_1E5B7BA48;
  BOOL v15 = v3;
  objc_msgSend_startListeningForEventTarget_sendStartingEvent_completion_(v12, v13, (uint64_t)self, (uint64_t)v14, &unk_1EF8E5EB8);
}

- (void)setCloudKitSyncEnabled:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v10 = objc_msgSend_logHandle(self, v7, v8, v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = @"NO";
    if (v4) {
      uint64_t v11 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v25 = v11;
    _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "set messages in cloud enabled: %@", buf, 0xCu);
  }

  BOOL v15 = objc_msgSend_notificationManager(self, v12, v13, v14);
  uint64_t v17 = objc_msgSend_createEventListenerForNotificationName_object_(v15, v16, @"com.apple.IMCore.IMCloudKitHooks.SetEnabledReturned", 0);

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1A4B6B4C8;
  v22[3] = &unk_1E5B7BA48;
  BOOL v23 = v4;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1A4B6B51C;
  v20[3] = &unk_1E5B7B9B8;
  id v21 = v6;
  id v18 = v6;
  objc_msgSend_startListeningForEventTarget_sendStartingEvent_completion_(v17, v19, (uint64_t)self, (uint64_t)v22, v20);
}

- (void)startPeriodicSync
{
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "beginning periodic sync", v11, 2u);
    }
  }
  uint64_t v7 = objc_msgSend_cloudKitHooks(self, v3, v4, v5);
  objc_msgSend_initiatePeriodicSync(v7, v8, v9, v10);
}

- (void)startUserInitiatedSync
{
  objc_msgSend_cloudKitHooks(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startUserInitiatedSync(v7, v4, v5, v6);
}

- (void)startInitialSync
{
  uint64_t v5 = objc_msgSend_logHandle(self, a2, v2, v3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_INFO, "beginning initial sync", v11, 2u);
  }

  uint64_t v9 = objc_msgSend_cloudKitHooks(self, v6, v7, v8);
  objc_msgSend_initiateSync_forceRunNow_reply_(v9, v10, @"initial", 1, &unk_1EF8E5F58);
}

- (BOOL)didPromptForCloudKitSync
{
  uint64_t v4 = objc_msgSend_standardUserDefaults(MEMORY[0x1E4F1CB18], a2, v2, v3);
  uint64_t v7 = objc_msgSend_objectForKey_(v4, v5, @"HasPromptedForMessagesInCloud", v6);

  if (v7) {
    char v11 = objc_msgSend_BOOLValue(v7, v8, v9, v10);
  }
  else {
    char v11 = 0;
  }

  return v11;
}

- (void)setDidPromptForCloudKitSync:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = @"NO";
      if (v3) {
        uint64_t v8 = @"YES";
      }
      int v11 = 138412290;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "set did prompt for cloud kit sync to %@", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v9 = objc_msgSend_standardUserDefaults(MEMORY[0x1E4F1CB18], v4, v5, v6);
  objc_msgSend_setBool_forKey_(v9, v10, v3, @"HasPromptedForMessagesInCloud");
}

- (void)disableAllSyncEnabledCloudKitDevices
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v11 = 0;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "attempting to disable all icloud devices", v11, 2u);
    }
  }
  uint64_t v7 = objc_msgSend_notificationManager(self, v3, v4, v5);
  uint64_t v9 = objc_msgSend_createEventListenerForNotificationName_object_(v7, v8, @"com.apple.IMCore.IMCloudKitHooks.tryToDisableAllDevicesReturned", 0);

  objc_msgSend_startListeningForEventTarget_sendStartingEvent_completion_(v9, v10, (uint64_t)self, (uint64_t)&unk_1EF8E4330, &unk_1EF8E4310);
}

- (void)performAdditionalStorageRequiredCheck
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v11 = 0;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Check if additional storage is required", v11, 2u);
    }
  }
  uint64_t v7 = objc_msgSend_notificationManager(self, v3, v4, v5);
  uint64_t v9 = objc_msgSend_createEventListenerForNotificationName_object_(v7, v8, @"com.apple.IMCore.IMCloudKitHooks.AdditionalStorageCheckReturned", 0);

  objc_msgSend_startListeningForEventTarget_sendStartingEvent_completion_(v9, v10, (uint64_t)self, (uint64_t)&unk_1EF8E6018, &unk_1EF8E5FD8);
}

- (void)_fetchSyncStateStatistics:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_logHandle(self, v5, v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1A4CB74C8(v8);
  }

  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = sub_1A4B6C148;
  id v21 = &unk_1E5B7B990;
  v22 = self;
  id v23 = v4;
  id v9 = v4;
  uint64_t v10 = _Block_copy(&v18);
  uint64_t v14 = objc_msgSend_notificationManager(self, v11, v12, v13, v18, v19, v20, v21, v22);
  uint64_t v16 = objc_msgSend_createEventListenerForNotificationName_object_(v14, v15, @"IMCloudKitFetchedSyncStatsNotification", 0);

  objc_msgSend_startListeningForEventTarget_sendStartingEvent_completion_(v16, v17, (uint64_t)self, (uint64_t)&unk_1EF8E4350, v10);
}

- (void)_sendSyncStatisticsToEventHandlers:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1A4B6C3A4;
  v12[3] = &unk_1E5B7BAB8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  objc_msgSend_visitEventHandlers_(self, v10, (uint64_t)v12, v11);
}

- (void)fetchSyncStateStatistics
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1A4B6C474;
  v3[3] = &unk_1E5B7BAE0;
  v3[4] = self;
  objc_msgSend__fetchSyncStateStatistics_(self, a2, (uint64_t)v3, v2);
}

- (void)fetchSyncStateStatisticsWithCompletion:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1A4B6C518;
  v8[3] = &unk_1E5B7BB08;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  objc_msgSend__fetchSyncStateStatistics_(self, v6, (uint64_t)v8, v7);
}

- (void)_cancelStatsFetchingTimer
{
  id v5 = objc_msgSend_fetchStatsTimer(self, a2, v2, v3);
  if (v5)
  {
    id v11 = v5;
    objc_msgSend_invalidate(v5, v6, v7, v8);
    objc_msgSend_setFetchStatsTimer_(self, v9, 0, v10);
    id v5 = v11;
  }
}

- (void)_timerExpiredForSyncStatsFetching:(id)a3
{
  id v5 = objc_msgSend_logHandle(self, a2, (uint64_t)a3, v3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_INFO, "Rescheduled sync progress: firing", v11, 2u);
  }

  objc_msgSend_fetchSyncState(self, v6, v7, v8);
  objc_msgSend_setFetchStatsTimer_(self, v9, 0, v10);
}

- (void)_rescheduleFetchSyncProgress
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend_fetchStatsTimer(self, a2, v2, v3);

  if (v5)
  {
    id v9 = objc_msgSend_logHandle(self, v6, v7, v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_progressPollingInterval(self, v10, v11, v12);
      int v29 = 134217984;
      uint64_t v30 = v13;
      _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, "Rescheduled sync progress pending (interval %f secs)", (uint8_t *)&v29, 0xCu);
    }
  }
  else
  {
    objc_msgSend__cancelStatsFetchingTimer(self, v6, v7, v8);
    uint64_t v17 = objc_msgSend_logHandle(self, v14, v15, v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_progressPollingInterval(self, v18, v19, v20);
      int v29 = 134217984;
      uint64_t v30 = v21;
      _os_log_impl(&dword_1A4AF7000, v17, OS_LOG_TYPE_INFO, "Rescheduled sync progress for %f seconds in the future", (uint8_t *)&v29, 0xCu);
    }

    v22 = (void *)MEMORY[0x1E4F1CB00];
    objc_msgSend_progressPollingInterval(self, v23, v24, v25);
    id v9 = objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(v22, v26, (uint64_t)self, (uint64_t)sel__timerExpiredForSyncStatsFetching_, 0, 0);
    objc_msgSend_setFetchStatsTimer_(self, v27, (uint64_t)v9, v28);
  }
}

- (double)progressBroadcastDelay
{
  return 1.0;
}

- (void)_sendProgressToEventListenersDeferred
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend_progressToSend(self, a2, v2, v3);
  objc_msgSend_setProgressToSend_(self, v6, 0, v7);
  uint64_t v11 = objc_msgSend_logHandle(self, v8, v9, v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v5;
    _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "Sending progress to event handlers: %@", buf, 0xCu);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1A4B6C954;
  v15[3] = &unk_1E5B7B948;
  v15[4] = self;
  id v16 = v5;
  id v12 = v5;
  objc_msgSend_visitEventHandlers_(self, v13, (uint64_t)v15, v14);
}

- (void)_sendProgressToEventListeners:(id)a3
{
  id v4 = a3;
  objc_msgSend_setProgressToSend_(self, v5, (uint64_t)v4, v6);
  uint64_t v10 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v7, v8, v9);
  int isMessagesIniCloudVersion2 = objc_msgSend_isMessagesIniCloudVersion2(v10, v11, v12, v13);

  if (isMessagesIniCloudVersion2)
  {
    objc_msgSend__sendProgressToEventListenersDeferred(self, v15, v16, v17);
  }
  else
  {
    objc_msgSend_progressBroadcastDelay(self, v15, v16, v17);
    double v19 = v18;
    objc_msgSend_broadcastDeferralOverride(v4, v20, v21, v22);
    if (v19 <= v26) {
      objc_msgSend_broadcastDeferralOverride(v4, v23, v24, v25);
    }
    else {
      objc_msgSend_progressBroadcastDelay(self, v23, v24, v25);
    }
    double v31 = v30;
    v32 = objc_msgSend_logHandle(self, v27, v28, v29);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
      sub_1A4CB7680(v32, v31);
    }

    objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E4FBA8A8], v33, (uint64_t)self, (uint64_t)sel__sendProgressToEventListenersDeferred, 0);
    objc_msgSend_performSelector_withObject_afterDelay_(self, v34, (uint64_t)sel__sendProgressToEventListenersDeferred, 0, v31);
  }
}

- (void)_sendHiddenProgressToEventListeners
{
  uint64_t v3 = [IMCloudKitSyncProgress alloc];
  id v7 = (id)objc_msgSend_initWithType_syncState_syncStatistics_(v3, v4, 2, 0, 0);
  objc_msgSend__sendProgressToEventListeners_(self, v5, (uint64_t)v7, v6);
}

- (void)fetchSyncDebuggingInfo:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Fetching sync state debugging info…", buf, 2u);
    }
  }
  uint64_t v9 = objc_msgSend_notificationManager(self, v5, v6, v7);
  uint64_t v11 = objc_msgSend_createEventListenerForNotificationName_object_(v9, v10, @"IMCloudKitFetchedSyncDebuggingInfoNotification", 0);

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1A4B6CF30;
  v14[3] = &unk_1E5B7BB80;
  id v15 = v4;
  id v12 = v4;
  objc_msgSend_startListeningForEventTarget_sendStartingEvent_completion_(v11, v13, (uint64_t)self, (uint64_t)v14, &unk_1EF8E3B70);
}

- (void)setAccountInfoProvider:(id)a3
{
}

- (double)progressPollingInterval
{
  return self->_progressPollingInterval;
}

- (IMWeakReferenceCollection)eventHandlers
{
  return (IMWeakReferenceCollection *)objc_getProperty(self, a2, 24, 1);
}

- (IMEventNotificationManager)notificationManager
{
  return (IMEventNotificationManager *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNotificationManager:(id)a3
{
}

- (void)setFetchStatsTimer:(id)a3
{
}

- (IMCloudKitSyncState)previousState
{
  return (IMCloudKitSyncState *)objc_getProperty(self, a2, 48, 1);
}

- (IMCloudKitSyncProgress)progressToSend
{
  return (IMCloudKitSyncProgress *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProgressToSend:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressToSend, 0);
  objc_storeStrong((id *)&self->_previousState, 0);
  objc_destroyWeak((id *)&self->_fetchStatsTimer);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_eventHandlers, 0);

  objc_destroyWeak((id *)&self->_accountInfoProvider);
}

@end