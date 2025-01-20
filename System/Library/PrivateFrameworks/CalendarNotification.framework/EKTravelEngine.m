@interface EKTravelEngine
+ (double)_periodicRefreshInterval;
+ (double)_travelAgendaTimeWindowInterval;
+ (double)requestRefreshTimeInterval;
+ (id)requestedDarwinNotifications;
+ (id)travelEligibleEvents:(id)a3 fromStartDate:(id)a4 untilEndDate:(id)a5;
+ (id)travelEligibleEventsInEventStore:(id)a3;
- (BOOL)_authorizedToAcquireLocation;
- (BOOL)_isProtectedDataAvailable;
- (BOOL)authorized;
- (BOOL)authorizedInternal;
- (BOOL)isLocationManagerStatusAuthorized:(int)a3;
- (CALNRouteHypothesizerProvider)routeHypothesizerProvider;
- (EKTravelEngine)initWithRouteHypothesizerProvider:(id)a3;
- (id)_eventStore;
- (id)adviceBlock;
- (id)alarmName;
- (id)authorizationChangedBlock;
- (id)eventSignificantlyChangedBlock;
- (void)_calDatabaseChangedNotificationReceived;
- (void)_calSyncClientBeginningMultiSaveNotificationReceived;
- (void)_calSyncClientFinishedMultiSaveNotificationReceived;
- (void)_enableTravelAdvisoriesForAutomaticBehaviorNotificationReceived;
- (void)_eventKitFeatureSetChanged;
- (void)_installLocationManager;
- (void)_installPeriodicRefreshTimer;
- (void)_installSyncYieldTimer;
- (void)_periodicRefreshTimerFired;
- (void)_refreshIfNeeded;
- (void)_sendFeedbackForPostingNotificationForEventWithExternalURL:(id)a3 feedback:(id)a4;
- (void)_significantTimeChangeNotificationReceived;
- (void)_stopInternal;
- (void)_suggestEventLocationsSettingChanged;
- (void)_trimAgendaEntriesBeforeDate:(id)a3 andAfterDate:(id)a4;
- (void)_uninstallLocationManager;
- (void)_uninstallPeriodicRefreshTimer;
- (void)_uninstallSyncYieldTimer;
- (void)_unregisterAllAgendaEntries;
- (void)_updateDatabaseEncryptionState;
- (void)cancelHypothesisRefreshRequestForEventWithExternalURL:(id)a3;
- (void)ceaseMonitoringForEventWithExternalURL:(id)a3;
- (void)dealloc;
- (void)handleDarwinNotification:(id)a3;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)receivedAlarmNamed:(id)a3;
- (void)requestHypothesisRefreshAtDate:(id)a3 forEventWithExternalURL:(id)a4;
- (void)sendFeedbackForPostingLeaveByNotificationForEventWithExternalURL:(id)a3;
- (void)sendFeedbackForPostingLeaveNowNotificationForEventWithExternalURL:(id)a3;
- (void)setAdviceBlock:(id)a3;
- (void)setAuthorizationChangedBlock:(id)a3;
- (void)setAuthorizedInternal:(BOOL)a3;
- (void)setEventSignificantlyChangedBlock:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation EKTravelEngine

- (void)handleDarwinNotification:(id)a3
{
  id v6 = a3;
  if ([v6 isEqualToString:*MEMORY[0x263F2FE40]])
  {
    [(EKTravelEngine *)self _calDatabaseChangedNotificationReceived];
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F2FF98]])
  {
    [(EKTravelEngine *)self _calSyncClientBeginningMultiSaveNotificationReceived];
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F2FFA0]])
  {
    [(EKTravelEngine *)self _calSyncClientFinishedMultiSaveNotificationReceived];
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F2FD48]])
  {
    [(EKTravelEngine *)self _enableTravelAdvisoriesForAutomaticBehaviorNotificationReceived];
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F30108]])
  {
    [(EKTravelEngine *)self _significantTimeChangeNotificationReceived];
  }
  else if ([v6 isEqualToString:*MEMORY[0x263F04AF8]])
  {
    [(EKTravelEngine *)self _eventKitFeatureSetChanged];
  }
  else
  {
    v4 = [MEMORY[0x263F04B78] stateChangedNotificationName];
    int v5 = [v6 isEqualToString:v4];

    if (v5)
    {
      [(EKTravelEngine *)self _updateDatabaseEncryptionState];
    }
    else if ([v6 isEqualToString:*MEMORY[0x263F2FD60]])
    {
      [(EKTravelEngine *)self _suggestEventLocationsSettingChanged];
    }
  }
}

+ (id)requestedDarwinNotifications
{
  v6[9] = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(MEMORY[0x263F04B78], "stateChangedNotificationName", @"com.apple.navd.wakeUpForHypothesisUpdate", *MEMORY[0x263F2FE40], *MEMORY[0x263F2FF98], *MEMORY[0x263F2FFA0], *MEMORY[0x263F2FD48], *MEMORY[0x263F30108], *MEMORY[0x263F04AF8]);
  uint64_t v3 = *MEMORY[0x263F2FD60];
  v6[7] = v2;
  v6[8] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:9];

  return v4;
}

+ (double)requestRefreshTimeInterval
{
  return 60.0;
}

- (EKTravelEngine)initWithRouteHypothesizerProvider:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)EKTravelEngine;
  id v6 = [(EKTravelEngine *)&v21 init];
  if (v6)
  {
    EKTravelEngineLogInitialize();
    objc_storeStrong((id *)&v6->_routeHypothesizerProvider, a3);
    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    id v7 = objc_claimAutoreleasedReturnValue();
    v8 = (const char *)[v7 UTF8String];

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create(v8, v9);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v10;

    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    id v12 = objc_claimAutoreleasedReturnValue();
    v13 = (const char *)[v12 UTF8String];

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create(v13, v14);
    callbackQueue = v6->_callbackQueue;
    v6->_callbackQueue = (OS_dispatch_queue *)v15;

    v6->_databaseIsEncryptedAndUnreadable = ![(EKTravelEngine *)v6 _isProtectedDataAvailable];
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    eventExternalURLsToAgendaEntries = v6->_eventExternalURLsToAgendaEntries;
    v6->_eventExternalURLsToAgendaEntries = v17;

    v19 = *MEMORY[0x263F04B08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v6;
      _os_log_impl(&dword_2216BB000, v19, OS_LOG_TYPE_DEFAULT, "Travel engine initialized: [%@]", buf, 0xCu);
    }
  }

  return v6;
}

- (void)dealloc
{
  if (self->_running) {
    [(EKTravelEngine *)self _stopInternal];
  }
  v3.receiver = self;
  v3.super_class = (Class)EKTravelEngine;
  [(EKTravelEngine *)&v3 dealloc];
}

- (void)start
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __23__EKTravelEngine_start__block_invoke;
  block[3] = &unk_2645C0D98;
  block[4] = self;
  dispatch_sync(workQueue, block);
}

void __23__EKTravelEngine_start__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 32);
  objc_super v3 = (os_log_t *)MEMORY[0x263F04B08];
  v4 = *MEMORY[0x263F04B08];
  BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v6;
      _os_log_impl(&dword_2216BB000, v4, OS_LOG_TYPE_DEFAULT, "The travel engine is already running.  Will not start engine: [%@]", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v7;
      _os_log_impl(&dword_2216BB000, v4, OS_LOG_TYPE_DEFAULT, "Travel engine preparing to start: [%@]", (uint8_t *)&v10, 0xCu);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 34) = [*(id *)(a1 + 32) _isProtectedDataAvailable] ^ 1;
    [*(id *)(a1 + 32) _installPeriodicRefreshTimer];
    [*(id *)(a1 + 32) _installLocationManager];
    *(unsigned char *)(*(void *)(a1 + 32) + 35) = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 33) = 1;
    *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
    v8 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl(&dword_2216BB000, v8, OS_LOG_TYPE_DEFAULT, "Travel engine started: [%@]", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 32) _refreshIfNeeded];
  }
}

- (void)stop
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __22__EKTravelEngine_stop__block_invoke;
  block[3] = &unk_2645C0D98;
  block[4] = self;
  dispatch_sync(workQueue, block);
}

void __22__EKTravelEngine_stop__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 32);
  objc_super v3 = (os_log_t *)MEMORY[0x263F04B08];
  v4 = *MEMORY[0x263F04B08];
  BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT);
  if (!v2)
  {
    if (!v5) {
      return;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138412290;
    uint64_t v11 = v9;
    v8 = "The travel engine is not running.  Will not stop engine: [%@]";
    goto LABEL_8;
  }
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v10 = 138412290;
    uint64_t v11 = v6;
    _os_log_impl(&dword_2216BB000, v4, OS_LOG_TYPE_DEFAULT, "The travel engine is preparing to stop: [%@]", (uint8_t *)&v10, 0xCu);
  }
  [*(id *)(a1 + 32) _stopInternal];
  [*(id *)(a1 + 32) _uninstallLocationManager];
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
  v4 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v10 = 138412290;
    uint64_t v11 = v7;
    v8 = "Travel engine stopped: [%@]";
LABEL_8:
    _os_log_impl(&dword_2216BB000, v4, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0xCu);
  }
}

- (void)_stopInternal
{
  [(EKTravelEngine *)self _unregisterAllAgendaEntries];
  [(EKTravelEngine *)self _uninstallSyncYieldTimer];
  [(EKTravelEngine *)self _uninstallPeriodicRefreshTimer];
}

- (void)requestHypothesisRefreshAtDate:(id)a3 forEventWithExternalURL:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__EKTravelEngine_requestHypothesisRefreshAtDate_forEventWithExternalURL___block_invoke;
    block[3] = &unk_2645C0E60;
    id v11 = v6;
    id v12 = v7;
    v13 = self;
    dispatch_sync(workQueue, block);
  }
  else
  {
    uint64_t v9 = *MEMORY[0x263F04B08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_2216BB000, v9, OS_LOG_TYPE_DEFAULT, "nil 'externalURL' given. Will not request hypothesis refresh at date: [%@] for any events.", buf, 0xCu);
    }
  }
}

void __73__EKTravelEngine_requestHypothesisRefreshAtDate_forEventWithExternalURL___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v2 = (NSObject **)MEMORY[0x263F04B08];
  objc_super v3 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    int v11 = 138412546;
    uint64_t v12 = v4;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Requesting hypothesis refresh at date: [%@] for event that has external URL: [%@]", (uint8_t *)&v11, 0x16u);
  }
  id v6 = [*(id *)(a1[6] + 40) objectForKey:a1[5]];
  id v7 = v6;
  if (v6)
  {
    [v6 requestHypothesisRefreshAtDate:a1[4]];
  }
  else
  {
    v8 = *v2;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = a1[4];
      uint64_t v10 = a1[5];
      int v11 = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      _os_log_impl(&dword_2216BB000, v8, OS_LOG_TYPE_DEFAULT, "Will not request hypothesis refresh at date: [%@] for event that has external URL: [%@] because is isn't being monitored", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)cancelHypothesisRefreshRequestForEventWithExternalURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    workQueue = self->_workQueue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __72__EKTravelEngine_cancelHypothesisRefreshRequestForEventWithExternalURL___block_invoke;
    v8[3] = &unk_2645C0DC0;
    id v9 = v4;
    uint64_t v10 = self;
    dispatch_sync(workQueue, v8);
  }
  else
  {
    id v7 = *MEMORY[0x263F04B08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2216BB000, v7, OS_LOG_TYPE_DEFAULT, "nil 'externalURL' given. Will not cancel a hypothesis refresh request for any events.", buf, 2u);
    }
  }
}

void __72__EKTravelEngine_cancelHypothesisRefreshRequestForEventWithExternalURL___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v2 = (NSObject **)MEMORY[0x263F04B08];
  objc_super v3 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v9 = 138412290;
    uint64_t v10 = v4;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Canceling hypothesis refresh request for event that has external URL: [%@]", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v5 = [*(id *)(*(void *)(a1 + 40) + 40) objectForKey:*(void *)(a1 + 32)];
  id v6 = v5;
  if (v5)
  {
    [v5 cancelHypothesisRefreshRequest];
  }
  else
  {
    id v7 = *v2;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_2216BB000, v7, OS_LOG_TYPE_DEFAULT, "Will not cancel refresh request for event that has external URL: [%@] because it isn't being monitored.", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)ceaseMonitoringForEventWithExternalURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    workQueue = self->_workQueue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __57__EKTravelEngine_ceaseMonitoringForEventWithExternalURL___block_invoke;
    v8[3] = &unk_2645C0DC0;
    id v9 = v4;
    uint64_t v10 = self;
    dispatch_sync(workQueue, v8);
  }
  else
  {
    id v7 = *MEMORY[0x263F04B08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2216BB000, v7, OS_LOG_TYPE_DEFAULT, "nil 'externalURL' given.  Will not cease monitoring for any events.", buf, 2u);
    }
  }
}

void __57__EKTravelEngine_ceaseMonitoringForEventWithExternalURL___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v2 = (NSObject **)MEMORY[0x263F04B08];
  objc_super v3 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v10 = 138412290;
    uint64_t v11 = v4;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Ceasing monitoring for event that has external URL: [%@]", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v5 = [*(id *)(*(void *)(a1 + 40) + 40) objectForKey:*(void *)(a1 + 32)];
  if (v5)
  {
    id v6 = [MEMORY[0x263F04B80] shared];
    char v7 = [v6 preventMarkingTravelAdvisoryEntriesAsDismissed];

    if ((v7 & 1) == 0) {
      [v5 setDismissed:1];
    }
    [v5 reset];
  }
  else
  {
    uint64_t v8 = *v2;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl(&dword_2216BB000, v8, OS_LOG_TYPE_DEFAULT, "Will not cease monitoring for event that has external URL: [%@] because it isn't being monitored.", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)receivedAlarmNamed:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [v4 hasPrefix:@"com.apple.calaccessd.travelEngine."];
  id v6 = (os_log_t *)MEMORY[0x263F04B10];
  char v7 = *MEMORY[0x263F04B10];
  BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x263F04B10], OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_2216BB000, v7, OS_LOG_TYPE_DEFAULT, "EKTravelEngine received alarm named: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    uint64_t v9 = [(EKTravelEngine *)self alarmName];
    int v10 = [v4 isEqualToString:v9];

    if (v10)
    {
      *((unsigned char *)v22 + 24) = 1;
      uint64_t v11 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_2216BB000, v11, OS_LOG_TYPE_DEFAULT, "EKTravelEngine received periodic refresh alarm", (uint8_t *)&buf, 2u);
      }
      workQueue = self->_workQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __37__EKTravelEngine_receivedAlarmNamed___block_invoke;
      block[3] = &unk_2645C0D98;
      void block[4] = self;
      dispatch_sync(workQueue, block);
    }
    else
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v26 = 0x3032000000;
      v27 = __Block_byref_object_copy__4;
      v28 = __Block_byref_object_dispose__4;
      id v29 = 0;
      __int16 v13 = self->_workQueue;
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __37__EKTravelEngine_receivedAlarmNamed___block_invoke_19;
      v19[3] = &unk_2645C0FA8;
      v19[4] = self;
      v19[5] = &buf;
      dispatch_sync(v13, v19);
      uint64_t v14 = *(void **)(*((void *)&buf + 1) + 40);
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __37__EKTravelEngine_receivedAlarmNamed___block_invoke_2;
      v16[3] = &unk_2645C10F0;
      v18 = &v21;
      id v17 = v4;
      [v14 enumerateObjectsUsingBlock:v16];

      _Block_object_dispose(&buf, 8);
    }
    if (!*((unsigned char *)v22 + 24))
    {
      uint64_t v15 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_2216BB000, v15, OS_LOG_TYPE_DEFAULT, "Uninstalling unrecognized alarm for travel engine", (uint8_t *)&buf, 2u);
      }
      [v4 UTF8String];
      xpc_set_event();
    }
    _Block_object_dispose(&v21, 8);
  }
  else if (v8)
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_2216BB000, v7, OS_LOG_TYPE_DEFAULT, "EKTravelEngine skipping the alarm named: %{public}@. It may be an alarm from another place like EKAlarmEngine.", (uint8_t *)&buf, 0xCu);
  }
}

uint64_t __37__EKTravelEngine_receivedAlarmNamed___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _periodicRefreshTimerFired];
}

uint64_t __37__EKTravelEngine_receivedAlarmNamed___block_invoke_19(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) allValues];
  return MEMORY[0x270F9A758]();
}

void __37__EKTravelEngine_receivedAlarmNamed___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_super v3 = v7;
  }
  else {
    objc_super v3 = 0;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = v3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= [v5 receivedAlarmNamed:v4];
  id v6 = [v5 throttle];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= [v6 receivedAlarmNamed:*(void *)(a1 + 32)];
}

+ (id)travelEligibleEventsInEventStore:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  id v6 = [v4 CalSimulatedDateForNow];
  [(id)objc_opt_class() _travelAgendaTimeWindowInterval];
  id v7 = objc_msgSend(v6, "dateByAddingTimeInterval:");
  BOOL v8 = [a1 travelEligibleEvents:v5 fromStartDate:v6 untilEndDate:v7];

  return v8;
}

+ (id)travelEligibleEvents:(id)a3 fromStartDate:(id)a4 untilEndDate:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v22 = a4;
  id v8 = a5;
  uint64_t v9 = [v7 calendarsForEntityType:0];
  int v10 = [MEMORY[0x263EFF980] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (([v16 isIgnoringEventAlerts] & 1) == 0)
        {
          id v17 = [v16 source];
          char v18 = [v17 isDelegate];

          if ((v18 & 1) == 0) {
            [v10 addObject:v16];
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v13);
  }

  v19 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    id v28 = v22;
    __int16 v29 = 2112;
    id v30 = v8;
    __int16 v31 = 2112;
    v32 = v10;
    _os_log_impl(&dword_2216BB000, v19, OS_LOG_TYPE_DEFAULT, "Will search for travel agenda candidates between [%@] and [%@].  Calendars to search: [%@]", buf, 0x20u);
  }
  v20 = [v7 travelEligibleEventsInCalendars:v10 startDate:v22 endDate:v8];

  return v20;
}

- (BOOL)authorized
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __28__EKTravelEngine_authorized__block_invoke;
  v5[3] = &unk_2645C0FA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __28__EKTravelEngine_authorized__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) authorizedInternal];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)sendFeedbackForPostingLeaveByNotificationForEventWithExternalURL:(id)a3
{
}

uint64_t __83__EKTravelEngine_sendFeedbackForPostingLeaveByNotificationForEventWithExternalURL___block_invoke(uint64_t a1, void *a2)
{
  return [a2 sendFeedbackForPostingLeaveByNotification];
}

- (void)sendFeedbackForPostingLeaveNowNotificationForEventWithExternalURL:(id)a3
{
}

uint64_t __84__EKTravelEngine_sendFeedbackForPostingLeaveNowNotificationForEventWithExternalURL___block_invoke(uint64_t a1, void *a2)
{
  return [a2 sendFeedbackForPostingLeaveNowNotification];
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 authorizationStatus];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v5 = (os_log_t *)MEMORY[0x263F04B08];
  uint64_t v6 = (void *)*MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)MEMORY[0x263F04C18];
    uint64_t v8 = v6;
    char v9 = [v7 authorizationStatusAsString:v4];
    *(_DWORD *)long long buf = 138412290;
    id v22 = v9;
    _os_log_impl(&dword_2216BB000, v8, OS_LOG_TYPE_DEFAULT, "Location authorization status changed to [%@]", buf, 0xCu);
  }
  BOOL v10 = [(EKTravelEngine *)self isLocationManagerStatusAuthorized:v4];
  if (v10)
  {
    [(EKTravelEngine *)self _refreshIfNeeded];
  }
  else if ((v4 - 1) <= 1)
  {
    id v11 = [MEMORY[0x263F087C8] defaultCenter];
    [v11 postNotificationName:@"com.apple.calendar.LocationAuthDenied" object:0 userInfo:0 deliverImmediately:1];

    [(EKTravelEngine *)self _unregisterAllAgendaEntries];
    self->_needsRefresh = 1;
  }
  if (v10 != [(EKTravelEngine *)self authorizedInternal])
  {
    [(EKTravelEngine *)self setAuthorizedInternal:v10];
    os_log_t v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = NSNumber;
      uint64_t v14 = v12;
      uint64_t v15 = objc_msgSend(v13, "numberWithBool:", -[EKTravelEngine authorizedInternal](self, "authorizedInternal"));
      *(_DWORD *)long long buf = 138412290;
      id v22 = v15;
      _os_log_impl(&dword_2216BB000, v14, OS_LOG_TYPE_DEFAULT, "The location authorization state has changed.  self.authorizedInternal: [%@]", buf, 0xCu);
    }
    uint64_t v16 = [(EKTravelEngine *)self authorizationChangedBlock];
    id v17 = v16;
    if (v16)
    {
      callbackQueue = self->_callbackQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __56__EKTravelEngine_locationManagerDidChangeAuthorization___block_invoke;
      block[3] = &unk_2645C1138;
      id v20 = v16;
      dispatch_async(callbackQueue, block);
    }
  }
}

uint64_t __56__EKTravelEngine_locationManagerDidChangeAuthorization___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_calDatabaseChangedNotificationReceived
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v3 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *MEMORY[0x263F2FE40];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v8 = v4;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Received notification: [%@].", buf, 0xCu);
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__EKTravelEngine__calDatabaseChangedNotificationReceived__block_invoke;
  block[3] = &unk_2645C0D98;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __57__EKTravelEngine__calDatabaseChangedNotificationReceived__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 33) = 1;
  return [*(id *)(a1 + 32) _refreshIfNeeded];
}

- (void)_eventKitFeatureSetChanged
{
  char v3 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "The state EventKit feature set was changed", buf, 2u);
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__EKTravelEngine__eventKitFeatureSetChanged__block_invoke;
  block[3] = &unk_2645C0D98;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __44__EKTravelEngine__eventKitFeatureSetChanged__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 33) = 1;
  return [*(id *)(a1 + 32) _refreshIfNeeded];
}

- (void)_suggestEventLocationsSettingChanged
{
  char v3 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "The state of SuggestEventLocations was changed", buf, 2u);
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__EKTravelEngine__suggestEventLocationsSettingChanged__block_invoke;
  block[3] = &unk_2645C0D98;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __54__EKTravelEngine__suggestEventLocationsSettingChanged__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 33) = 1;
  return [*(id *)(a1 + 32) _refreshIfNeeded];
}

- (void)_calSyncClientBeginningMultiSaveNotificationReceived
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v3 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *MEMORY[0x263F2FF98];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v8 = v4;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Received notification: [%@].", buf, 0xCu);
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__EKTravelEngine__calSyncClientBeginningMultiSaveNotificationReceived__block_invoke;
  block[3] = &unk_2645C0D98;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

void __70__EKTravelEngine__calSyncClientBeginningMultiSaveNotificationReceived__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 35))
  {
    int v2 = *MEMORY[0x263F04B08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_2216BB000, v2, OS_LOG_TYPE_DEFAULT, "The travel engine is yielding to sync already.  Ignoring notification.", v4, 2u);
    }
  }
  else
  {
    *(unsigned char *)(v1 + 35) = 1;
    char v3 = *(void **)(a1 + 32);
    [v3 _installSyncYieldTimer];
  }
}

- (void)_calSyncClientFinishedMultiSaveNotificationReceived
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v3 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *MEMORY[0x263F2FFA0];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v8 = v4;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Received notification: [%@].", buf, 0xCu);
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__EKTravelEngine__calSyncClientFinishedMultiSaveNotificationReceived__block_invoke;
  block[3] = &unk_2645C0D98;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

void __69__EKTravelEngine__calSyncClientFinishedMultiSaveNotificationReceived__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 35))
  {
    *(unsigned char *)(v1 + 35) = 0;
    [*(id *)(a1 + 32) _uninstallSyncYieldTimer];
    char v3 = *(void **)(a1 + 32);
    [v3 _refreshIfNeeded];
  }
  else
  {
    uint64_t v4 = *MEMORY[0x263F04B08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_2216BB000, v4, OS_LOG_TYPE_DEFAULT, "The travel engine is not currently yielding to sync.  Ignoring notification.", v5, 2u);
    }
  }
}

- (void)_enableTravelAdvisoriesForAutomaticBehaviorNotificationReceived
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v3 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *MEMORY[0x263F2FD48];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v8 = v4;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Received notification: [%@].", buf, 0xCu);
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__EKTravelEngine__enableTravelAdvisoriesForAutomaticBehaviorNotificationReceived__block_invoke;
  block[3] = &unk_2645C0D98;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __81__EKTravelEngine__enableTravelAdvisoriesForAutomaticBehaviorNotificationReceived__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 33) = 1;
  return [*(id *)(a1 + 32) _refreshIfNeeded];
}

- (void)_significantTimeChangeNotificationReceived
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v3 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *MEMORY[0x263F30108];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v8 = v4;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Received notification: [%@].", buf, 0xCu);
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__EKTravelEngine__significantTimeChangeNotificationReceived__block_invoke;
  block[3] = &unk_2645C0D98;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

void __60__EKTravelEngine__significantTimeChangeNotificationReceived__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v2 = [MEMORY[0x263EFF910] CalSimulatedDateForNow];
  int v3 = [v2 isBeforeDate:*(void *)(*(void *)(a1 + 32) + 64)];
  uint64_t v4 = *MEMORY[0x263F04B08];
  BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 64);
      int v8 = 138543618;
      uint64_t v9 = v2;
      __int16 v10 = 2114;
      uint64_t v11 = v6;
      _os_log_impl(&dword_2216BB000, v4, OS_LOG_TYPE_DEFAULT, "Refreshing in response to significant time changed notification as the current time (%{public}@) is before the last time we refreshed (%{public}@)", (uint8_t *)&v8, 0x16u);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 33) = 1;
    [*(id *)(a1 + 32) _refreshIfNeeded];
  }
  else if (v5)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 64);
    int v8 = 138543618;
    uint64_t v9 = v2;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_impl(&dword_2216BB000, v4, OS_LOG_TYPE_DEFAULT, "NOT refreshing in response to significant time changed notification as the current time (%{public}@) is after the last time we refreshed (%{public}@)", (uint8_t *)&v8, 0x16u);
  }
}

- (void)_updateDatabaseEncryptionState
{
  int v3 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Updating database encryption state.", buf, 2u);
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__EKTravelEngine__updateDatabaseEncryptionState__block_invoke;
  block[3] = &unk_2645C0D98;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

unsigned char *__48__EKTravelEngine__updateDatabaseEncryptionState__block_invoke(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (result[34])
  {
    uint64_t result = (unsigned char *)[result _isProtectedDataAvailable];
    if (result)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 34) = 0;
      *(unsigned char *)(*(void *)(a1 + 32) + 33) = 1;
      int v3 = *(void **)(a1 + 32);
      return (unsigned char *)[v3 _refreshIfNeeded];
    }
  }
  return result;
}

- (BOOL)isLocationManagerStatusAuthorized:(int)a3
{
  return a3 == 3;
}

- (BOOL)_isProtectedDataAvailable
{
  id v2 = objc_alloc_init(MEMORY[0x263F04B78]);
  char v3 = [v2 dataIsAccessible];

  return v3;
}

- (void)_installSyncYieldTimer
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  char v3 = (os_log_t *)MEMORY[0x263F04B08];
  uint64_t v4 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v12 = (uint64_t)self;
    _os_log_impl(&dword_2216BB000, v4, OS_LOG_TYPE_DEFAULT, "Installing sync yield timer for travel engine: [%@].", buf, 0xCu);
  }
  BOOL v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_workQueue);
  syncYieldTimer = self->_syncYieldTimer;
  self->_syncYieldTimer = v5;

  dispatch_time_t v7 = dispatch_time(0, 240000000000);
  dispatch_source_set_timer((dispatch_source_t)self->_syncYieldTimer, v7, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);
  int v8 = self->_syncYieldTimer;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __40__EKTravelEngine__installSyncYieldTimer__block_invoke;
  handler[3] = &unk_2645C0D98;
  handler[4] = self;
  dispatch_source_set_event_handler(v8, handler);
  uint64_t v9 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218242;
    uint64_t v12 = 240;
    __int16 v13 = 2112;
    uint64_t v14 = self;
    _os_log_impl(&dword_2216BB000, v9, OS_LOG_TYPE_DEFAULT, "Installed sync yield timer with [%ld] second length for travel engine: [%@].", buf, 0x16u);
  }
  dispatch_resume((dispatch_object_t)self->_syncYieldTimer);
}

uint64_t __40__EKTravelEngine__installSyncYieldTimer__block_invoke(uint64_t a1)
{
  id v2 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_ERROR)) {
    __40__EKTravelEngine__installSyncYieldTimer__block_invoke_cold_1(v2);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 35) = 0;
  [*(id *)(a1 + 32) _refreshIfNeeded];
  return [*(id *)(a1 + 32) _uninstallSyncYieldTimer];
}

- (void)_uninstallSyncYieldTimer
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (self->_syncYieldTimer)
  {
    char v3 = *MEMORY[0x263F04B08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      uint64_t v6 = self;
      _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Uninstalling sync yield timer for travel engine: [%@].", (uint8_t *)&v5, 0xCu);
    }
    dispatch_source_cancel((dispatch_source_t)self->_syncYieldTimer);
    syncYieldTimer = self->_syncYieldTimer;
    self->_syncYieldTimer = 0;
  }
}

+ (double)_travelAgendaTimeWindowInterval
{
  +[EKTravelEngineAgendaEntry fuzzyMaximumInitialUpdateIntervalBeforeStartDate];
  return fmax(v2 * 1.5, 43200.0);
}

+ (double)_periodicRefreshInterval
{
  +[EKTravelEngineAgendaEntry fuzzyMaximumInitialUpdateIntervalBeforeStartDate];
  double v3 = v2;
  [(id)objc_opt_class() _travelAgendaTimeWindowInterval];
  return v4 - v3 + -120.0;
}

- (id)alarmName
{
  return (id)[NSString stringWithFormat:@"%@%@", @"com.apple.calaccessd.travelEngine.", @"periodicRefreshTimer"];
}

- (void)_installPeriodicRefreshTimer
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  [(id)objc_opt_class() _periodicRefreshInterval];
  double v4 = v3;
  int v5 = [MEMORY[0x263EFF910] date];
  uint64_t v6 = [v5 dateByAddingTimeInterval:v4];

  uint64_t v7 = (void *)*MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = NSNumber;
    uint64_t v9 = v7;
    __int16 v10 = [v8 numberWithDouble:v4];
    int v14 = 138412802;
    uint64_t v15 = self;
    __int16 v16 = 2112;
    id v17 = v10;
    __int16 v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_2216BB000, v9, OS_LOG_TYPE_DEFAULT, "Installing a periodic refresh timer for travel engine: [%@].  Timer interval: [%@].  Estimated fire date (based on system time): [%@].", (uint8_t *)&v14, 0x20u);
  }
  int64_t v11 = (unint64_t)((ceil(v4) + (double)time(0)) * 1000000000.0);
  xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_date(v12, (const char *)*MEMORY[0x263F300A8], v11);
  id v13 = [(EKTravelEngine *)self alarmName];
  [v13 UTF8String];
  xpc_set_event();
}

- (void)_uninstallPeriodicRefreshTimer
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  double v3 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = self;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Uninstalling the periodic refresh timer for travel engine: [%@].", (uint8_t *)&v5, 0xCu);
  }
  id v4 = [(EKTravelEngine *)self alarmName];
  [v4 UTF8String];
  xpc_set_event();
}

- (void)_trimAgendaEntriesBeforeDate:(id)a3 andAfterDate:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_2216BB000, v8, OS_LOG_TYPE_DEFAULT, "Trimming entries before [%@] and after [%@].", buf, 0x16u);
  }
  eventExternalURLsToAgendaEntries = self->_eventExternalURLsToAgendaEntries;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __60__EKTravelEngine__trimAgendaEntriesBeforeDate_andAfterDate___block_invoke;
  v15[3] = &unk_2645C1160;
  id v16 = v6;
  id v17 = v7;
  id v10 = v7;
  id v11 = v6;
  xpc_object_t v12 = [(NSMutableDictionary *)eventExternalURLsToAgendaEntries keysOfEntriesPassingTest:v15];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __60__EKTravelEngine__trimAgendaEntriesBeforeDate_andAfterDate___block_invoke_41;
  v14[3] = &unk_2645C1188;
  v14[4] = self;
  [v12 enumerateObjectsUsingBlock:v14];
  id v13 = [v12 allObjects];
  [(NSMutableDictionary *)self->_eventExternalURLsToAgendaEntries removeObjectsForKeys:v13];
}

uint64_t __60__EKTravelEngine__trimAgendaEntriesBeforeDate_andAfterDate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [v4 originalEvent];
  id v6 = [v5 startDate];

  id v7 = [v4 originalEvent];
  int v8 = [v7 endDate];

  if ([v8 CalIsBeforeOrSameAsDate:*(void *)(a1 + 32)])
  {
    uint64_t v9 = *MEMORY[0x263F04B08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v4;
      id v10 = "Removing travel agenda entry that ends before the time window: [%@]";
LABEL_7:
      _os_log_impl(&dword_2216BB000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    if (![v6 CalIsAfterDate:*(void *)(a1 + 40)])
    {
      uint64_t v11 = 0;
      goto LABEL_10;
    }
    uint64_t v9 = *MEMORY[0x263F04B08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v4;
      id v10 = "Removing travel agenda entry that starts after the time window: [%@]";
      goto LABEL_7;
    }
  }
  uint64_t v11 = 1;
LABEL_10:

  return v11;
}

void __60__EKTravelEngine__trimAgendaEntriesBeforeDate_andAfterDate___block_invoke_41(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:a2];
  [v2 reset];
}

- (BOOL)_authorizedToAcquireLocation
{
  id v2 = [MEMORY[0x263F30050] bundle];
  int v3 = [MEMORY[0x263F30048] authorizationStatusForBundle:v2];
  uint64_t v4 = *MEMORY[0x263F300B0];
  int v5 = [MEMORY[0x263F30048] authorizationStatusForBundleIdentifier:*MEMORY[0x263F300B0]];
  char v6 = [MEMORY[0x263F30048] preciseLocationAuthorizedForBundle:v2];
  char v7 = [MEMORY[0x263F30048] preciseLocationAuthorizedForBundleIdentifier:v4];
  if (v3 != 3 || v5 <= 2) {
    char v9 = 0;
  }
  else {
    char v9 = v6;
  }
  char v10 = v9 & v7;

  return v10;
}

- (id)_eventStore
{
  timedEventStorePurger = self->_timedEventStorePurger;
  if (!timedEventStorePurger)
  {
    uint64_t v4 = (EKTimedEventStorePurger *)objc_alloc_init(MEMORY[0x263F04C00]);
    int v5 = self->_timedEventStorePurger;
    self->_timedEventStorePurger = v4;

    [(EKTimedEventStorePurger *)self->_timedEventStorePurger setTimeout:4.0];
    [(EKTimedEventStorePurger *)self->_timedEventStorePurger setPurgingAllowed:1];
    [(EKTimedEventStorePurger *)self->_timedEventStorePurger setCreationBlock:&__block_literal_global_48];
    timedEventStorePurger = self->_timedEventStorePurger;
  }
  return (id)[(EKTimedEventStorePurger *)timedEventStorePurger acquireCachedEventStoreOrCreate:1];
}

id __29__EKTravelEngine__eventStore__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F04B98]);
  return v0;
}

- (void)_refreshIfNeeded
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (!self->_needsRefresh)
  {
    int v3 = *MEMORY[0x263F04B08];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)long long buf = 138412290;
    v32 = self;
    uint64_t v4 = "Data does not need to be refreshed.  Will not refresh data for travel engine: [%@]";
    goto LABEL_10;
  }
  if (self->_databaseIsEncryptedAndUnreadable)
  {
    int v3 = *MEMORY[0x263F04B08];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)long long buf = 138412290;
    v32 = self;
    uint64_t v4 = "Cannot access data. Will not refresh data for travel engine: [%@]";
LABEL_10:
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, v4, buf, 0xCu);
    return;
  }
  if (self->_yieldingToSync)
  {
    int v3 = *MEMORY[0x263F04B08];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)long long buf = 138412290;
    v32 = self;
    uint64_t v4 = "Currently yielding to sync. Will not refresh data for travel engine: [%@]";
    goto LABEL_10;
  }
  BOOL v5 = [(EKTravelEngine *)self _authorizedToAcquireLocation];
  char v6 = (os_log_t *)MEMORY[0x263F04B08];
  char v7 = *MEMORY[0x263F04B08];
  BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_DWORD *)long long buf = 138412290;
      v32 = self;
      _os_log_impl(&dword_2216BB000, v7, OS_LOG_TYPE_DEFAULT, "Refreshing data for travel engine: [%@]", buf, 0xCu);
    }
    char v9 = [MEMORY[0x263EFF910] CalSimulatedDateForNow];
    objc_storeStrong((id *)&self->_lastRefreshDate, v9);
    char v10 = [(EKTravelEngine *)self _eventStore];
    [(id)objc_opt_class() _travelAgendaTimeWindowInterval];
    double v12 = v11;
    os_log_t v13 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = NSNumber;
      uint64_t v15 = v13;
      id v16 = [v14 numberWithDouble:v12];
      *(_DWORD *)long long buf = 138412290;
      v32 = v16;
      _os_log_impl(&dword_2216BB000, v15, OS_LOG_TYPE_DEFAULT, "The travel agenda time window interval is [%@] seconds.", buf, 0xCu);
    }
    id v17 = [v9 dateByAddingTimeInterval:v12];
    [(EKTravelEngine *)self _trimAgendaEntriesBeforeDate:v9 andAfterDate:v17];
    __int16 v18 = +[EKTravelEngine travelEligibleEvents:v10 fromStartDate:v9 untilEndDate:v17];
    id v19 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    __int16 v20 = *v6;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = v20;
      uint64_t v22 = [v18 count];
      *(_DWORD *)long long buf = 134217984;
      v32 = (EKTravelEngine *)v22;
      _os_log_impl(&dword_2216BB000, v21, OS_LOG_TYPE_DEFAULT, "Found [%lu] travel agenda candidates.", buf, 0xCu);
    }
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __34__EKTravelEngine__refreshIfNeeded__block_invoke;
    v29[3] = &unk_2645C1248;
    v29[4] = self;
    id v23 = v19;
    id v30 = v23;
    [v18 enumerateObjectsUsingBlock:v29];
    long long v24 = (void *)[(NSMutableDictionary *)self->_eventExternalURLsToAgendaEntries copy];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __34__EKTravelEngine__refreshIfNeeded__block_invoke_60;
    v26[3] = &unk_2645C1270;
    id v27 = v23;
    id v28 = self;
    id v25 = v23;
    [v24 enumerateKeysAndObjectsUsingBlock:v26];

    self->_needsRefresh = 0;
  }
  else
  {
    if (v8)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_2216BB000, v7, OS_LOG_TYPE_DEFAULT, "Calendar system service is not authorized to use location", buf, 2u);
    }
    self->_needsRefresh = 1;
  }
}

void __34__EKTravelEngine__refreshIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v2 = a2;
  int v3 = [v2 externalURL];
  uint64_t v4 = [v3 absoluteString];

  BOOL v5 = [v2 preferredLocation];
  char v6 = (os_log_t *)MEMORY[0x263F04B08];
  char v7 = (void *)*MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = v7;
    char v9 = [v2 title];
    char v10 = [v2 startDate];
    *(_DWORD *)long long buf = 138413058;
    id v66 = v9;
    __int16 v67 = 2112;
    v68 = v5;
    __int16 v69 = 2112;
    v70 = v10;
    __int16 v71 = 2112;
    v72 = v4;
    _os_log_impl(&dword_2216BB000, v8, OS_LOG_TYPE_DEFAULT, "Inspecting travel agenda candidate event with title [%@], location [%@], start date [%@], and external URL [%@].", buf, 0x2Au);
  }
  if (v4)
  {
    if (!v5)
    {
      id v16 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v66 = v4;
        _os_log_impl(&dword_2216BB000, v16, OS_LOG_TYPE_DEFAULT, "No location for event with external URL: [%@].  Will unregister as travel entry if it exists.", buf, 0xCu);
      }
      id v17 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:v4];
      if (v17)
      {
        __int16 v18 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v66 = v4;
          _os_log_impl(&dword_2216BB000, v18, OS_LOG_TYPE_DEFAULT, "Unregistering event with external URL [%@] since it seems to have lost its location.", buf, 0xCu);
        }
        [v17 reset];
        [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:v4];
      }

      goto LABEL_43;
    }
    if (+[CALNNotificationFilter shouldIgnoreNotificationForEvent:v2])
    {
      double v11 = *v6;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        double v12 = "Event is or may be junk. Will not register as travel agenda item.";
        os_log_t v13 = v11;
        uint32_t v14 = 2;
LABEL_10:
        _os_log_impl(&dword_2216BB000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
        goto LABEL_43;
      }
      goto LABEL_43;
    }
    id v19 = [v2 travelStartLocation];
    v57 = [v19 routing];

    uint64_t v20 = [MEMORY[0x263F30040] routingModeEnumForCalRouteType:v57];
    if (v57)
    {
      unsigned int v56 = [MEMORY[0x263F04C18] geoTransportTypeForCalLocationRoutingMode:v20];
    }
    else
    {
      os_log_t v21 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = (void *)MEMORY[0x263F04C18];
        id v23 = v21;
        long long v24 = [v22 geoTransportTypeAsString:4];
        *(_DWORD *)long long buf = 138412546;
        id v66 = v4;
        __int16 v67 = 2112;
        v68 = v24;
        _os_log_impl(&dword_2216BB000, v23, OS_LOG_TYPE_DEFAULT, "No routing method found on event with external URL [%@].  Defaulting to [%@].", buf, 0x16u);
      }
      unsigned int v56 = 4;
    }
    os_log_t v25 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      long long v26 = (void *)MEMORY[0x263F04C18];
      id v27 = v25;
      id v28 = [v26 geoTransportTypeAsString:v56];
      *(_DWORD *)long long buf = 138412546;
      id v66 = v28;
      __int16 v67 = 2112;
      v68 = v4;
      _os_log_impl(&dword_2216BB000, v27, OS_LOG_TYPE_DEFAULT, "Using routing method [%@] for event with external URL [%@].", buf, 0x16u);
    }
    __int16 v29 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:v4];
    if (!v29)
    {
      id v30 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v66 = v4;
        _os_log_impl(&dword_2216BB000, v30, OS_LOG_TYPE_DEFAULT, "Creating agenda entry because one does not exist for event with external URL: [%@]", buf, 0xCu);
      }
      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      __int16 v31 = [EKTravelEngineAgendaEntry alloc];
      v32 = [*(id *)(a1 + 32) routeHypothesizerProvider];
      __int16 v29 = [(EKTravelEngineAgendaEntry *)v31 initWithRouteHypothesizerProvider:v32];

      v62[0] = MEMORY[0x263EF8330];
      v62[1] = 3221225472;
      v62[2] = __34__EKTravelEngine__refreshIfNeeded__block_invoke_54;
      v62[3] = &unk_2645C11F8;
      objc_copyWeak(&v64, (id *)buf);
      id v33 = v4;
      id v63 = v33;
      [(EKTravelEngineAgendaEntry *)v29 setUpdateBlock:v62];
      v59[0] = MEMORY[0x263EF8330];
      v59[1] = 3221225472;
      v59[2] = __34__EKTravelEngine__refreshIfNeeded__block_invoke_2_56;
      v59[3] = &unk_2645C11F8;
      objc_copyWeak(&v61, (id *)buf);
      id v34 = v33;
      id v60 = v34;
      [(EKTravelEngineAgendaEntry *)v29 setEntrySignificantlyChangedBlock:v59];
      [*(id *)(*(void *)(a1 + 32) + 40) setObject:v29 forKey:v34];

      objc_destroyWeak(&v61);
      objc_destroyWeak(&v64);
      objc_destroyWeak((id *)buf);
    }
    if ([(EKTravelEngineAgendaEntry *)v29 dismissed])
    {
      v35 = [v2 structuredLocation];
      v36 = [v35 title];
      v37 = [(EKTravelEngineAgendaEntry *)v29 originalEvent];
      v38 = [v37 locationString];
      char v39 = [v36 isEqualToString:v38];

      if ((v39 & 1) == 0)
      {
        v44 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v66 = v4;
          v45 = "The entry has been dismissed, but it's location has changed.  Clearing the dismissed flag for the entry "
                "for event with external URL: [%@]";
          goto LABEL_36;
        }
LABEL_37:
        [(EKTravelEngineAgendaEntry *)v29 setDismissed:0];
        goto LABEL_38;
      }
      v40 = [v2 startDate];
      v41 = [(EKTravelEngineAgendaEntry *)v29 originalEvent];
      v42 = [v41 startDate];
      char v43 = [v40 isEqualToDate:v42];

      if ((v43 & 1) == 0)
      {
        v44 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v66 = v4;
          v45 = "The entry has been dismissed, but it's start date has changed.  Clearing the dismissed flag for the entr"
                "y for event with external URL: [%@]";
LABEL_36:
          _os_log_impl(&dword_2216BB000, v44, OS_LOG_TYPE_DEFAULT, v45, buf, 0xCu);
          goto LABEL_37;
        }
        goto LABEL_37;
      }
    }
LABEL_38:
    if ([(EKTravelEngineAgendaEntry *)v29 dismissed])
    {
      v46 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v66 = v4;
        _os_log_impl(&dword_2216BB000, v46, OS_LOG_TYPE_DEFAULT, "The entry has been dismissed.  Will not update the entry for event with external URL: [%@]", buf, 0xCu);
      }
    }
    else
    {
      v47 = objc_alloc_init(EKTravelEngineOriginalEvent);
      [(EKTravelEngineOriginalEvent *)v47 setEventExternalURL:v4];
      v48 = [v2 startDate];
      [(EKTravelEngineOriginalEvent *)v47 setStartDate:v48];

      v49 = [v2 endDate];
      [(EKTravelEngineOriginalEvent *)v47 setEndDate:v49];

      [(EKTravelEngineOriginalEvent *)v47 setTransportTypeOverride:v56];
      v50 = [v2 structuredLocation];
      v51 = [v50 title];
      [(EKTravelEngineOriginalEvent *)v47 setLocationString:v51];

      v52 = [v5 geoLocation];
      [(EKTravelEngineOriginalEvent *)v47 setGeoLocation:v52];

      -[EKTravelEngineOriginalEvent setLocationIsAConferenceRoom:](v47, "setLocationIsAConferenceRoom:", [v2 locationIsAConferenceRoom]);
      v53 = [v5 mapKitHandle];
      [(EKTravelEngineOriginalEvent *)v47 setLocationMapKitHandle:v53];

      -[EKTravelEngineOriginalEvent setAutomaticGeocodingAllowed:](v47, "setAutomaticGeocodingAllowed:", [v2 automaticLocationGeocodingAllowed]);
      -[EKTravelEngineOriginalEvent setHasPredictedLocation:](v47, "setHasPredictedLocation:", [v2 hasPredictedLocation]);
      v54 = [v2 locationWithoutPrediction];
      [(EKTravelEngineOriginalEvent *)v47 setLocationStringWithoutPrediction:v54];

      v55 = [v2 calendar];
      -[EKTravelEngineOriginalEvent setIsOnSharedCalendar:](v47, "setIsOnSharedCalendar:", [v55 sharingStatus] != 0);
      [(EKTravelEngineAgendaEntry *)v29 updateHypothesizerIfNecessaryWithOriginalEvent:v47];
    }
    [*(id *)(a1 + 40) addObject:v4];

    goto LABEL_43;
  }
  uint64_t v15 = *v6;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v66 = v2;
    double v12 = "No external url for event: [%@].  Will not register as travel agenda item.";
    os_log_t v13 = v15;
    uint32_t v14 = 12;
    goto LABEL_10;
  }
LABEL_43:
}

void __34__EKTravelEngine__refreshIfNeeded__block_invoke_54(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v5 = WeakRetained;
  if (WeakRetained)
  {
    char v6 = WeakRetained[1];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__EKTravelEngine__refreshIfNeeded__block_invoke_2;
    block[3] = &unk_2645C0E60;
    id v8 = v3;
    id v9 = *(id *)(a1 + 32);
    char v10 = v5;
    dispatch_async(v6, block);
  }
}

void __34__EKTravelEngine__refreshIfNeeded__block_invoke_2(id *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = [a1[4] latestHypothesis];
  id v3 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = a1[5];
    *(_DWORD *)long long buf = 138412546;
    id v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v2;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Hypothesis updated for event with external URL: [%@].  Hypothesis: [%@]", buf, 0x16u);
  }
  BOOL v5 = [a1[6] adviceBlock];
  char v6 = v5;
  if (v5)
  {
    char v7 = *((void *)a1[6] + 2);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__EKTravelEngine__refreshIfNeeded__block_invoke_55;
    block[3] = &unk_2645C11D0;
    id v11 = v5;
    id v9 = a1[5];
    id v10 = v2;
    dispatch_async(v7, block);
  }
}

uint64_t __34__EKTravelEngine__refreshIfNeeded__block_invoke_55(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __34__EKTravelEngine__refreshIfNeeded__block_invoke_2_56(uint64_t a1)
{
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[1];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __34__EKTravelEngine__refreshIfNeeded__block_invoke_3;
    v5[3] = &unk_2645C0DC0;
    id v6 = *(id *)(a1 + 32);
    char v7 = v3;
    dispatch_async(v4, v5);
  }
}

void __34__EKTravelEngine__refreshIfNeeded__block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v11 = v3;
    _os_log_impl(&dword_2216BB000, v2, OS_LOG_TYPE_DEFAULT, "Significant change encountered for event with external URL [%@].", buf, 0xCu);
  }
  id v4 = [*(id *)(a1 + 40) eventSignificantlyChangedBlock];
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = *(NSObject **)(*(void *)(a1 + 40) + 16);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __34__EKTravelEngine__refreshIfNeeded__block_invoke_57;
    v7[3] = &unk_2645C1220;
    id v9 = v4;
    id v8 = *(id *)(a1 + 32);
    dispatch_async(v6, v7);
  }
}

uint64_t __34__EKTravelEngine__refreshIfNeeded__block_invoke_57(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __34__EKTravelEngine__refreshIfNeeded__block_invoke_60(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (([*(id *)(a1 + 32) containsObject:v5] & 1) == 0)
  {
    char v7 = *MEMORY[0x263F04B08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_2216BB000, v7, OS_LOG_TYPE_DEFAULT, "Unregistering event with external URL since it's not in the travel window: [%@]", (uint8_t *)&v8, 0xCu);
    }
    [v6 reset];
    [*(id *)(*(void *)(a1 + 40) + 40) removeObjectForKey:v5];
  }
}

- (void)_unregisterAllAgendaEntries
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Unregistering all agenda entries.", buf, 2u);
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [(NSMutableDictionary *)self->_eventExternalURLsToAgendaEntries allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
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
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) reset];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }

  [(NSMutableDictionary *)self->_eventExternalURLsToAgendaEntries removeAllObjects];
}

- (void)_periodicRefreshTimerFired
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = self;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "The periodic refresh timer fired for travel engine: [%@].", (uint8_t *)&v4, 0xCu);
  }
  [(EKTravelEngine *)self _uninstallPeriodicRefreshTimer];
  [(EKTravelEngine *)self _installPeriodicRefreshTimer];
  self->_needsRefresh = 1;
  [(EKTravelEngine *)self _refreshIfNeeded];
}

- (void)_installLocationManager
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v3 = (os_log_t *)MEMORY[0x263F04B08];
  int v4 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_2216BB000, v4, OS_LOG_TYPE_DEFAULT, "Installation of location manager requested.", (uint8_t *)&v10, 2u);
  }
  uint64_t v5 = [MEMORY[0x263F30050] bundle];
  id v6 = objc_alloc(MEMORY[0x263F00A60]);
  uint64_t v7 = [v5 bundlePath];
  uint64_t v8 = (void *)[v6 initWithEffectiveBundlePath:v7 delegate:self onQueue:self->_workQueue];

  objc_storeStrong((id *)&self->_locationManager, v8);
  long long v9 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    long long v11 = v8;
    _os_log_impl(&dword_2216BB000, v9, OS_LOG_TYPE_DEFAULT, "Installation of location manager complete.  Location manager: [%@]", (uint8_t *)&v10, 0xCu);
  }
}

- (void)_uninstallLocationManager
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v3 = (os_log_t *)MEMORY[0x263F04B08];
  int v4 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2216BB000, v4, OS_LOG_TYPE_DEFAULT, "Uninstallation of location manager requested.", buf, 2u);
  }
  [(CLLocationManager *)self->_locationManager setDelegate:0];
  locationManager = self->_locationManager;
  self->_locationManager = 0;

  id v6 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_2216BB000, v6, OS_LOG_TYPE_DEFAULT, "Uninstallation of location manager complete.", v7, 2u);
  }
}

- (void)_sendFeedbackForPostingNotificationForEventWithExternalURL:(id)a3 feedback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v6)
  {
    int v10 = *MEMORY[0x263F04B08];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_WORD *)long long buf = 0;
    long long v11 = "nil 'externalURL' given.  Will not send feedback for posting notification.";
LABEL_8:
    _os_log_impl(&dword_2216BB000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
    goto LABEL_9;
  }
  if (!v7)
  {
    int v10 = *MEMORY[0x263F04B08];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_WORD *)long long buf = 0;
    long long v11 = "nil 'feedback' given.  Will not send feedback for posting notification.";
    goto LABEL_8;
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__EKTravelEngine__sendFeedbackForPostingNotificationForEventWithExternalURL_feedback___block_invoke;
  block[3] = &unk_2645C1298;
  void block[4] = self;
  id v13 = v6;
  id v14 = v8;
  dispatch_async(workQueue, block);

LABEL_9:
}

void __86__EKTravelEngine__sendFeedbackForPostingNotificationForEventWithExternalURL_feedback___block_invoke(void *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1[4] + 40) objectForKey:a1[5]];
  if (v2)
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    uint64_t v3 = *MEMORY[0x263F04B08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = a1[5];
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Will not send feedback for posting notification for event that has external URL: [%@] because it isn't being monitored.", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (id)adviceBlock
{
  return self->_adviceBlock;
}

- (void)setAdviceBlock:(id)a3
{
}

- (id)authorizationChangedBlock
{
  return self->_authorizationChangedBlock;
}

- (void)setAuthorizationChangedBlock:(id)a3
{
}

- (id)eventSignificantlyChangedBlock
{
  return self->_eventSignificantlyChangedBlock;
}

- (void)setEventSignificantlyChangedBlock:(id)a3
{
}

- (CALNRouteHypothesizerProvider)routeHypothesizerProvider
{
  return self->_routeHypothesizerProvider;
}

- (BOOL)authorizedInternal
{
  return self->_authorizedInternal;
}

- (void)setAuthorizedInternal:(BOOL)a3
{
  self->_authorizedInternal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeHypothesizerProvider, 0);
  objc_storeStrong(&self->_eventSignificantlyChangedBlock, 0);
  objc_storeStrong(&self->_authorizationChangedBlock, 0);
  objc_storeStrong(&self->_adviceBlock, 0);
  objc_storeStrong((id *)&self->_lastRefreshDate, 0);
  objc_storeStrong((id *)&self->_timedEventStorePurger, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_eventExternalURLsToAgendaEntries, 0);
  objc_storeStrong((id *)&self->_syncYieldTimer, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __40__EKTravelEngine__installSyncYieldTimer__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2216BB000, log, OS_LOG_TYPE_ERROR, "Sync yield timer fired.  Overriding sync yield and refreshing if needed.", v1, 2u);
}

@end