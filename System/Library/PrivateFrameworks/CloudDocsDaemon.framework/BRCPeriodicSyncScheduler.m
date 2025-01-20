@interface BRCPeriodicSyncScheduler
+ (id)periodicSyncLastSyncDateKey;
- (BOOL)closed;
- (BOOL)isNetworkReachable;
- (BOOL)isScreenLocked;
- (BOOL)periodicSyncInProgress;
- (BOOL)shouldTriggerPeriodicSync;
- (BRCPeriodicSyncScheduler)initWithContainerScheduler:(id)a3 session:(id)a4;
- (BRCUserDefaults)userDefaults;
- (NSDate)appLibrariesLastBoostTime;
- (NSDate)lastPeriodicSyncDate;
- (NSDate)networkConnectTime;
- (NSDate)networkDisconnectTime;
- (NSDate)screenUnlockedTime;
- (OS_dispatch_queue)syncQueue;
- (OS_dispatch_source)periodicSyncRequestTimer;
- (double)_timeIntervalSinceLastPeriodicSync;
- (void)_appLibraryDidBoostForPresenterNotificationHandler:(id)a3;
- (void)_cancelPeriodicSyncRequestScheduler;
- (void)_markNeedPeriodicSync;
- (void)_periodicSyncCompletionWithError:(id)a3;
- (void)_registerToNotifications;
- (void)_schedulePeriodicSyncRequest;
- (void)_tiggerPeriodicSync;
- (void)_unregisterToNotifications;
- (void)close;
- (void)networkReachabilityChanged:(BOOL)a3;
- (void)resume;
- (void)screenLockChanged:(BOOL)a3;
- (void)setAppLibrariesLastBoostTime:(id)a3;
- (void)setIsNetworkReachable:(BOOL)a3;
- (void)setIsScreenLocked:(BOOL)a3;
- (void)setLastPeriodicSyncDate:(id)a3;
- (void)setNetworkConnectTime:(id)a3;
- (void)setNetworkDisconnectTime:(id)a3;
- (void)setPeriodicSyncInProgress:(BOOL)a3;
- (void)setPeriodicSyncRequestTimer:(id)a3;
- (void)setScreenUnlockedTime:(id)a3;
- (void)setShouldTriggerPeriodicSync:(BOOL)a3;
- (void)setUserDefaults:(id)a3;
@end

@implementation BRCPeriodicSyncScheduler

+ (id)periodicSyncLastSyncDateKey
{
  return @"periodicSyncDate";
}

- (BRCPeriodicSyncScheduler)initWithContainerScheduler:(id)a3 session:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)BRCPeriodicSyncScheduler;
  v9 = [(BRCPeriodicSyncScheduler *)&v31 init];
  if (v9)
  {
    memset(v30, 0, sizeof(v30));
    __brc_create_section(0, (uint64_t)"-[BRCPeriodicSyncScheduler initWithContainerScheduler:session:]", 84, v30);
    v10 = brc_bread_crumbs();
    v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v33 = v30[0];
      __int16 v34 = 2112;
      v35 = v9;
      __int16 v36 = 2112;
      v37 = v10;
      _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Creating %@%@", buf, 0x20u);
    }

    objc_storeStrong((id *)&v9->_containerScheduler, a3);
    objc_storeStrong((id *)&v9->_session, a4);
    uint64_t v12 = +[BRCUserDefaults defaultsForMangledID:0];
    userDefaults = v9->_userDefaults;
    v9->_userDefaults = (BRCUserDefaults *)v12;

    v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(v14, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.brc.periodic-sync-scheduler", v15);

    syncQueue = v9->_syncQueue;
    v9->_syncQueue = (OS_dispatch_queue *)v16;

    uint64_t v18 = [(BRCAccountSession *)v9->_session personaIdentifier];
    personaIdentifier = v9->_personaIdentifier;
    v9->_personaIdentifier = (NSString *)v18;

    periodicSyncRequestTimer = v9->_periodicSyncRequestTimer;
    v9->_periodicSyncRequestTimer = 0;

    *(_WORD *)&v9->_shouldTriggerPeriodicSync = 0;
    v9->_closed = 0;
    uint64_t v21 = [MEMORY[0x1E4F1C9C8] now];
    networkConnectTime = v9->_networkConnectTime;
    v9->_networkConnectTime = (NSDate *)v21;

    uint64_t v23 = [MEMORY[0x1E4F1C9C8] now];
    networkDisconnectTime = v9->_networkDisconnectTime;
    v9->_networkDisconnectTime = (NSDate *)v23;

    uint64_t v25 = [MEMORY[0x1E4F1C9C8] now];
    screenUnlockedTime = v9->_screenUnlockedTime;
    v9->_screenUnlockedTime = (NSDate *)v25;

    uint64_t v27 = [MEMORY[0x1E4F1C9C8] now];
    appLibrariesLastBoostTime = v9->_appLibrariesLastBoostTime;
    v9->_appLibrariesLastBoostTime = (NSDate *)v27;

    __brc_leave_section(v30);
  }

  return v9;
}

- (void)_registerToNotifications
{
  id v5 = +[BRCSystemResourcesManager manager];
  [v5 addReachabilityObserver:self];
  [v5 addScreenLockObserver:self];
  v3 = objc_msgSend((id)*MEMORY[0x1E4F59250], "br_libnotifyPerPersonaNotificationName:", self->_personaIdentifier);
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__appLibraryDidBoostForPresenterNotificationHandler_ name:v3 object:0];
}

- (void)_unregisterToNotifications
{
  id v5 = +[BRCSystemResourcesManager manager];
  [v5 removeReachabilityObserver:self];
  [v5 removeScreenLockObserver:self];
  v3 = objc_msgSend((id)*MEMORY[0x1E4F59250], "br_libnotifyPerPersonaNotificationName:", self->_personaIdentifier);
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:v3 object:0];
}

- (void)close
{
  self->_closed = 1;
  [(BRCPeriodicSyncScheduler *)self _unregisterToNotifications];
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__BRCPeriodicSyncScheduler_close__block_invoke;
  block[3] = &unk_1E6993698;
  block[4] = self;
  dispatch_async(syncQueue, block);
}

uint64_t __33__BRCPeriodicSyncScheduler_close__block_invoke()
{
  return BRPerformWithPersonaAndError();
}

void __33__BRCPeriodicSyncScheduler_close__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u)) {
      __33__BRCPeriodicSyncScheduler_close__block_invoke_2_cold_1();
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
    [*(id *)(a1 + 32) _cancelPeriodicSyncRequestScheduler];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 8);
    *(void *)(v6 + 8) = 0;

    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(v8 + 96);
    *(void *)(v8 + 96) = 0;

    uint64_t v10 = *(void *)(a1 + 32);
    v11 = *(void **)(v10 + 24);
    *(void *)(v10 + 24) = 0;
  }
}

- (void)resume
{
  id v3 = [(BRCAccountSession *)self->_session clientTruthWorkloop];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__BRCPeriodicSyncScheduler_resume__block_invoke;
  block[3] = &unk_1E6993698;
  block[4] = self;
  dispatch_async_and_wait(v3, block);

  [(BRCPeriodicSyncScheduler *)self _registerToNotifications];
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__BRCPeriodicSyncScheduler_resume__block_invoke_9;
  v5[3] = &unk_1E6993698;
  v5[4] = self;
  dispatch_async(syncQueue, v5);
}

void __34__BRCPeriodicSyncScheduler_resume__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) clientState];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"periodicSyncDate"];
  v4 = *(void **)(*(void *)v1 + 40);
  *(void *)(*(void *)v1 + 40) = v3;

  if (!*(void *)(*(void *)v1 + 40))
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v6 = *(void **)(*(void *)v1 + 40);
    *(void *)(*(void *)v1 + 40) = v5;

    uint64_t v7 = *(void *)(*(void *)v1 + 40);
    uint64_t v8 = [*(id *)(*(void *)v1 + 16) clientState];
    [v8 setObject:v7 forKeyedSubscript:@"periodicSyncDate"];

    v9 = [*(id *)(*(void *)v1 + 16) clientDB];
    [v9 forceBatchStart];
  }
  uint64_t v10 = brc_bread_crumbs();
  v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    __34__BRCPeriodicSyncScheduler_resume__block_invoke_cold_1(v1);
  }
}

uint64_t __34__BRCPeriodicSyncScheduler_resume__block_invoke_9(uint64_t a1)
{
  v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __34__BRCPeriodicSyncScheduler_resume__block_invoke_9_cold_1(a1);
  }

  return BRPerformWithPersonaAndError();
}

void __34__BRCPeriodicSyncScheduler_resume__block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u)) {
      __33__BRCPeriodicSyncScheduler_close__block_invoke_2_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 32) _markNeedPeriodicSync];
    [*(id *)(a1 + 32) _schedulePeriodicSyncRequest];
  }
}

- (void)networkReachabilityChanged:(BOOL)a3
{
  if (!self->_closed)
  {
    syncQueue = self->_syncQueue;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __55__BRCPeriodicSyncScheduler_networkReachabilityChanged___block_invoke;
    v4[3] = &unk_1E6996758;
    v4[4] = self;
    BOOL v5 = a3;
    dispatch_async(syncQueue, v4);
  }
}

uint64_t __55__BRCPeriodicSyncScheduler_networkReachabilityChanged___block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 34)) {
    return BRPerformWithPersonaAndError();
  }
  return result;
}

void __55__BRCPeriodicSyncScheduler_networkReachabilityChanged___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = brc_bread_crumbs();
    BOOL v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u)) {
      __33__BRCPeriodicSyncScheduler_close__block_invoke_2_cold_1();
    }
  }
  else if (*(unsigned char *)(*(void *)(a1 + 32) + 35))
  {
    if (!*(unsigned char *)(a1 + 40))
    {
      uint64_t v6 = [MEMORY[0x1E4F1C9C8] now];
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void **)(v7 + 56);
      *(void *)(v7 + 56) = v6;

      *(unsigned char *)(*(void *)(a1 + 32) + 35) = *(unsigned char *)(a1 + 40);
      [*(id *)(a1 + 32) _cancelPeriodicSyncRequestScheduler];
    }
  }
  else if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v10 = *(void *)(a1 + 32);
    v11 = *(void **)(v10 + 48);
    *(void *)(v10 + 48) = v9;

    *(unsigned char *)(*(void *)(a1 + 32) + 35) = *(unsigned char *)(a1 + 40);
    [*(id *)(*(void *)(a1 + 32) + 48) timeIntervalSinceDate:*(void *)(*(void *)(a1 + 32) + 56)];
    double v13 = v12;
    [*(id *)(*(void *)(a1 + 32) + 96) periodicSyncNetworkUnreachableMinThreshold];
    if (v13 >= v14)
    {
      v15 = brc_bread_crumbs();
      dispatch_queue_t v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = *(void *)(a1 + 32);
        int v18 = 138412802;
        uint64_t v19 = v17;
        __int16 v20 = 2048;
        double v21 = v13 / 60.0;
        __int16 v22 = 2112;
        uint64_t v23 = v15;
        _os_log_debug_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Network disconnected for %.1f mins --> Assume missing push%@", (uint8_t *)&v18, 0x20u);
      }

      [*(id *)(a1 + 32) _markNeedPeriodicSync];
    }
    [*(id *)(a1 + 32) _schedulePeriodicSyncRequest];
  }
}

- (void)screenLockChanged:(BOOL)a3
{
  if (!self->_closed)
  {
    syncQueue = self->_syncQueue;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __46__BRCPeriodicSyncScheduler_screenLockChanged___block_invoke;
    v4[3] = &unk_1E6996758;
    v4[4] = self;
    BOOL v5 = a3;
    dispatch_async(syncQueue, v4);
  }
}

uint64_t __46__BRCPeriodicSyncScheduler_screenLockChanged___block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 34)) {
    return BRPerformWithPersonaAndError();
  }
  return result;
}

void __46__BRCPeriodicSyncScheduler_screenLockChanged___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = brc_bread_crumbs();
    BOOL v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u)) {
      __33__BRCPeriodicSyncScheduler_close__block_invoke_2_cold_1();
    }
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v6 + 36))
    {
      if (!*(unsigned char *)(a1 + 40))
      {
        uint64_t v7 = [MEMORY[0x1E4F1C9C8] now];
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v9 = *(void **)(v8 + 64);
        *(void *)(v8 + 64) = v7;

        *(unsigned char *)(*(void *)(a1 + 32) + 36) = *(unsigned char *)(a1 + 40);
        [*(id *)(a1 + 32) _schedulePeriodicSyncRequest];
      }
    }
    else if (*(unsigned char *)(a1 + 40))
    {
      *(unsigned char *)(v6 + 36) = 1;
      [*(id *)(a1 + 32) _cancelPeriodicSyncRequestScheduler];
    }
  }
}

- (void)_appLibraryDidBoostForPresenterNotificationHandler:(id)a3
{
  if (!self->_closed)
  {
    syncQueue = self->_syncQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__BRCPeriodicSyncScheduler__appLibraryDidBoostForPresenterNotificationHandler___block_invoke;
    block[3] = &unk_1E6993698;
    block[4] = self;
    dispatch_async(syncQueue, block);
  }
}

void __79__BRCPeriodicSyncScheduler__appLibraryDidBoostForPresenterNotificationHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 34) && !*(unsigned char *)(v1 + 36))
  {
    id v3 = [MEMORY[0x1E4F1C9C8] now];
    [v3 timeIntervalSinceDate:*((void *)*v2 + 9)];
    double v5 = v4;
    objc_storeStrong((id *)*v2 + 9, v3);
    [*v2 _timeIntervalSinceLastPeriodicSync];
    double v7 = v6;
    [*((id *)*v2 + 12) periodicSyncAutoTriggerTimeInterval];
    if (v7 >= v8)
    {
      uint64_t v10 = brc_bread_crumbs();
      v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __79__BRCPeriodicSyncScheduler__appLibraryDidBoostForPresenterNotificationHandler___block_invoke_cold_1(v2);
      }
    }
    else
    {
      [*((id *)*v2 + 12) periodicSyncAppLibraryLastBoostMinThreshold];
      if (v5 < v9)
      {
LABEL_10:

        return;
      }
      uint64_t v10 = brc_bread_crumbs();
      v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        id v12 = *v2;
        *(_DWORD *)buf = 138412802;
        id v14 = v12;
        __int16 v15 = 2048;
        double v16 = v5 / 60.0;
        __int16 v17 = 2112;
        int v18 = v10;
        _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - User did not use iCloud Drive for %.1f mins --> trigger periodic sync%@", buf, 0x20u);
      }
    }

    BRPerformWithPersonaAndError();
    goto LABEL_10;
  }
}

void __79__BRCPeriodicSyncScheduler__appLibraryDidBoostForPresenterNotificationHandler___block_invoke_12(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    double v4 = brc_bread_crumbs();
    double v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u)) {
      __33__BRCPeriodicSyncScheduler_close__block_invoke_2_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 32) _markNeedPeriodicSync];
    [*(id *)(a1 + 32) _schedulePeriodicSyncRequest];
  }
}

- (double)_timeIntervalSinceLastPeriodicSync
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  id v3 = [MEMORY[0x1E4F1C9C8] now];
  [v3 timeIntervalSinceDate:self->_lastPeriodicSyncDate];
  double v5 = v4;

  return fmax(v5, 0.0);
}

- (void)_markNeedPeriodicSync
{
  if (!self->_closed) {
    self->_shouldTriggerPeriodicSync = 1;
  }
}

- (void)_schedulePeriodicSyncRequest
{
  v46[3] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  if (!self->_closed
    && self->_shouldTriggerPeriodicSync
    && !self->_isScreenLocked
    && self->_isNetworkReachable
    && !self->_periodicSyncInProgress
    && !self->_periodicSyncRequestTimer)
  {
    id v3 = [MEMORY[0x1E4F1C9C8] now];
    [(BRCUserDefaults *)self->_userDefaults periodicSyncNetworkStableMinThreshold];
    double v5 = v4;
    [v3 timeIntervalSinceDate:self->_networkConnectTime];
    double v7 = v5 - v6;
    [(BRCUserDefaults *)self->_userDefaults periodicSyncScreenUnlockedMinThreshold];
    double v9 = v8;
    [v3 timeIntervalSinceDate:self->_screenUnlockedTime];
    double v11 = v9 - v10;
    [(BRCUserDefaults *)self->_userDefaults periodicSyncTimeInterval];
    double v13 = v12;
    [v3 timeIntervalSinceDate:self->_lastPeriodicSyncDate];
    double v15 = v13 - v14;
    double v16 = [NSNumber numberWithDouble:v7];
    v46[0] = v16;
    __int16 v17 = [NSNumber numberWithDouble:v11];
    v46[1] = v17;
    int v18 = [NSNumber numberWithDouble:v15];
    v46[2] = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:3];

    __int16 v20 = objc_msgSend(v19, "br_maxWithComparator:", *MEMORY[0x1E4F59648]);
    [v20 doubleValue];
    double v22 = v21;

    if (v22 <= 0.0)
    {
      [(BRCPeriodicSyncScheduler *)self _tiggerPeriodicSync];
    }
    else
    {
      uint64_t v23 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_syncQueue);
      periodicSyncRequestTimer = self->_periodicSyncRequestTimer;
      self->_periodicSyncRequestTimer = v23;

      int64_t v25 = (unint64_t)(v22 * 1000000000.0);
      v26 = self->_periodicSyncRequestTimer;
      dispatch_time_t v27 = dispatch_time(0, v25);
      dispatch_source_set_timer(v26, v27, 0xFFFFFFFFFFFFFFFFLL, v25 / 10);
      v28 = self->_periodicSyncRequestTimer;
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __56__BRCPeriodicSyncScheduler__schedulePeriodicSyncRequest__block_invoke;
      v37[3] = &unk_1E6993698;
      v37[4] = self;
      v29 = v28;
      v30 = v37;
      objc_super v31 = v30;
      v32 = v30;
      if (*MEMORY[0x1E4F59658])
      {
        v32 = ((void (*)(void *))*MEMORY[0x1E4F59658])(v30);
      }
      dispatch_block_t v33 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v32);
      dispatch_source_set_event_handler(v29, v33);

      dispatch_resume((dispatch_object_t)self->_periodicSyncRequestTimer);
      __int16 v34 = brc_bread_crumbs();
      v35 = brc_default_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        __int16 v36 = self->_periodicSyncRequestTimer;
        *(_DWORD *)buf = 138413058;
        v39 = self;
        __int16 v40 = 2112;
        v41 = v36;
        __int16 v42 = 2048;
        unint64_t v43 = v25 / 0x3B9ACA00uLL;
        __int16 v44 = 2112;
        v45 = v34;
        _os_log_debug_impl(&dword_1D353B000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - scheduled _periodicSyncRequestTimer %@ in %llu sec%@", buf, 0x2Au);
      }
    }
  }
}

uint64_t __56__BRCPeriodicSyncScheduler__schedulePeriodicSyncRequest__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tiggerPeriodicSync];
}

- (void)_cancelPeriodicSyncRequestScheduler
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  if (self->_periodicSyncRequestTimer)
  {
    id v3 = brc_bread_crumbs();
    double v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      periodicSyncRequestTimer = self->_periodicSyncRequestTimer;
      int v7 = 138412802;
      double v8 = self;
      __int16 v9 = 2112;
      double v10 = periodicSyncRequestTimer;
      __int16 v11 = 2112;
      double v12 = v3;
      _os_log_debug_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - cancelling periodicSyncRequestTimer %@%@", (uint8_t *)&v7, 0x20u);
    }

    dispatch_source_cancel((dispatch_source_t)self->_periodicSyncRequestTimer);
    double v5 = self->_periodicSyncRequestTimer;
    self->_periodicSyncRequestTimer = 0;
  }
}

- (void)_tiggerPeriodicSync
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_1D353B000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@: Periodic sync already running%@", v1, 0x16u);
}

void __47__BRCPeriodicSyncScheduler__tiggerPeriodicSync__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v3 = objc_msgSend(MEMORY[0x1E4F1A218], "br_syncDownPeriodic");
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__BRCPeriodicSyncScheduler__tiggerPeriodicSync__block_invoke_2;
  v4[3] = &unk_1E69939E8;
  v4[4] = *(void *)(a1 + 32);
  [v2 schedulePeriodicSyncInGroup:v3 completion:v4];
}

uint64_t __47__BRCPeriodicSyncScheduler__tiggerPeriodicSync__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _periodicSyncCompletionWithError:a2];
}

- (void)_periodicSyncCompletionWithError:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(BRCAccountSession *)self->_session clientDB];
  [v5 assertOnQueue];

  if (v4)
  {
    double v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u)) {
      -[BRCPeriodicSyncScheduler _periodicSyncCompletionWithError:]();
    }
  }
  double v8 = [MEMORY[0x1E4F1C9C8] now];
  __int16 v9 = brc_bread_crumbs();
  double v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    int v18 = self;
    __int16 v19 = 2112;
    __int16 v20 = v8;
    __int16 v21 = 2112;
    double v22 = v9;
    _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - persist last periodic sync date: %@%@", buf, 0x20u);
  }

  __int16 v11 = [(BRCAccountSession *)self->_session clientState];
  [v11 setObject:v8 forKeyedSubscript:@"periodicSyncDate"];

  double v12 = [(BRCAccountSession *)self->_session clientDB];
  [v12 forceBatchStart];

  syncQueue = self->_syncQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__BRCPeriodicSyncScheduler__periodicSyncCompletionWithError___block_invoke;
  v15[3] = &unk_1E6993628;
  v15[4] = self;
  id v16 = v8;
  id v14 = v8;
  dispatch_async(syncQueue, v15);
}

void __61__BRCPeriodicSyncScheduler__periodicSyncCompletionWithError___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 40);
  BRPerformWithPersonaAndError();
}

void __61__BRCPeriodicSyncScheduler__periodicSyncCompletionWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = brc_bread_crumbs();
    double v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u)) {
      __33__BRCPeriodicSyncScheduler_close__block_invoke_2_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 32) _cancelPeriodicSyncRequestScheduler];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
    *(unsigned char *)(*(void *)(a1 + 32) + 33) = 0;
  }
}

- (NSDate)lastPeriodicSyncDate
{
  return self->_lastPeriodicSyncDate;
}

- (void)setLastPeriodicSyncDate:(id)a3
{
}

- (BOOL)shouldTriggerPeriodicSync
{
  return self->_shouldTriggerPeriodicSync;
}

- (void)setShouldTriggerPeriodicSync:(BOOL)a3
{
  self->_shouldTriggerPeriodicSync = a3;
}

- (BOOL)periodicSyncInProgress
{
  return self->_periodicSyncInProgress;
}

- (void)setPeriodicSyncInProgress:(BOOL)a3
{
  self->_periodicSyncInProgress = a3;
}

- (BOOL)closed
{
  return self->_closed;
}

- (BOOL)isNetworkReachable
{
  return self->_isNetworkReachable;
}

- (void)setIsNetworkReachable:(BOOL)a3
{
  self->_isNetworkReachable = a3;
}

- (NSDate)networkConnectTime
{
  return self->_networkConnectTime;
}

- (void)setNetworkConnectTime:(id)a3
{
}

- (NSDate)networkDisconnectTime
{
  return self->_networkDisconnectTime;
}

- (void)setNetworkDisconnectTime:(id)a3
{
}

- (BOOL)isScreenLocked
{
  return self->_isScreenLocked;
}

- (void)setIsScreenLocked:(BOOL)a3
{
  self->_isScreenLocked = a3;
}

- (NSDate)screenUnlockedTime
{
  return self->_screenUnlockedTime;
}

- (void)setScreenUnlockedTime:(id)a3
{
}

- (NSDate)appLibrariesLastBoostTime
{
  return self->_appLibrariesLastBoostTime;
}

- (void)setAppLibrariesLastBoostTime:(id)a3
{
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (OS_dispatch_source)periodicSyncRequestTimer
{
  return self->_periodicSyncRequestTimer;
}

- (void)setPeriodicSyncRequestTimer:(id)a3
{
}

- (BRCUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_periodicSyncRequestTimer, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_appLibrariesLastBoostTime, 0);
  objc_storeStrong((id *)&self->_screenUnlockedTime, 0);
  objc_storeStrong((id *)&self->_networkDisconnectTime, 0);
  objc_storeStrong((id *)&self->_networkConnectTime, 0);
  objc_storeStrong((id *)&self->_lastPeriodicSyncDate, 0);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_session, 0);

  objc_storeStrong((id *)&self->_containerScheduler, 0);
}

void __33__BRCPeriodicSyncScheduler_close__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] Failed to adopt persona: %@%@");
}

void __34__BRCPeriodicSyncScheduler_resume__block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(*(void *)a1 + 40);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Last periodic sync date: %@%@", (void)v3, DWORD2(v3));
}

void __34__BRCPeriodicSyncScheduler_resume__block_invoke_9_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] %@ - try trigger periodic sync on startup%@", (void)v3, DWORD2(v3));
}

void __79__BRCPeriodicSyncScheduler__appLibraryDidBoostForPresenterNotificationHandler___block_invoke_cold_1(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] %@ - long time since last periodic sync --> trigger periodic sync%@", (void)v3, DWORD2(v3));
}

- (void)_periodicSyncCompletionWithError:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] Periodic sync failed with: %@%@");
}

@end