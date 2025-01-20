@interface _EKNotificationMonitor
+ (OS_os_log)logHandle;
+ (id)blacklistedNotificationQueue;
+ (id)blacklistedRowIDs;
+ (id)requestedDarwinNotifications;
+ (void)addBlacklistedNotificationObjectID:(id)a3;
- (BOOL)isMonitoringOnlyNotificationCount;
- (EKEventStore)eventStore;
- (EKTimedEventStorePurger)eventStorePurger;
- (NSArray)notificationReferences;
- (OS_dispatch_queue)callbackNotificationQueue;
- (OS_dispatch_queue)notificationQueue;
- (_EKNotificationMonitor)init;
- (_EKNotificationMonitor)initWithOptions:(int64_t)a3;
- (_EKNotificationMonitor)initWithOptions:(int64_t)a3 eventStore:(id)a4;
- (_EKNotificationMonitor)initWithOptions:(int64_t)a3 eventStoreGetter:(id)a4;
- (id)_eventStore;
- (id)_fetchEventNotificationReferencesFromEventStore:(id)a3 earliestExpiringNotification:(id *)a4;
- (id)_initWithOptions:(int64_t)a3 eventStore:(id)a4 eventStoreGetter:(id)a5;
- (id)effectiveCallbackQueue;
- (unint64_t)notificationCount;
- (void)_addRemovedOrAddedObjectIDsTo:(id)a3 oldNotifications:(id)a4 newNotifications:(id)a5;
- (void)_alertPrefChanged;
- (void)_databaseChanged;
- (void)_eventStoreChanged;
- (void)_eventStoreChangedNotification:(id)a3;
- (void)_killSyncTimer:(id)a3;
- (void)_killTimer;
- (void)_notificationCountChangedExternally;
- (void)_resetSyncTimer;
- (void)_syncDidEnd:(id)a3;
- (void)_syncDidEndExternally;
- (void)_syncDidStart;
- (void)_syncTimerFired:(id)a3;
- (void)_timerFired;
- (void)_updateTimerFireDate:(id)a3;
- (void)adjust;
- (void)attemptReload;
- (void)attemptReloadSynchronously:(BOOL)a3;
- (void)dealloc;
- (void)handleDarwinNotification:(id)a3;
- (void)setCallbackNotificationQueue:(id)a3;
- (void)start;
- (void)stop;
- (void)trackChangesInEventStore;
@end

@implementation _EKNotificationMonitor

- (id)_initWithOptions:(int64_t)a3 eventStore:(id)a4 eventStoreGetter:(id)a5
{
  unsigned int v7 = a3;
  id v9 = a4;
  id v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)_EKNotificationMonitor;
  v11 = [(_EKNotificationMonitor *)&v29 init];
  id v13 = v11;
  if (v11)
  {
    v11[102] = v7 & 1;
    v12.i64[0] = *(void *)&vshl_u16((uint16x4_t)(*(void *)&vdup_n_s16(v7) & 0xFF00FF00FF00FFLL), (uint16x4_t)0xFFFCFFFDFFFFFFFELL) & 0xFF01FF01FF01FF01;
    *(_DWORD *)(v11 + 93) = vmovn_s16(v12).u32[0];
    v11[97] = (v7 & 0x20) != 0;
    v11[98] = (v7 & 0x40) != 0;
    v11[100] = (v7 & 0x80) != 0;
    v11[101] = BYTE1(v7) & 1;
    uint64_t v14 = [v10 copy];
    v15 = (void *)*((void *)v13 + 1);
    *((void *)v13 + 1) = v14;

    objc_storeStrong((id *)v13 + 18, a4);
    if (!*((void *)v13 + 18) && !*((void *)v13 + 1))
    {
      v16 = objc_alloc_init(EKTimedEventStorePurger);
      v17 = (void *)*((void *)v13 + 17);
      *((void *)v13 + 17) = v16;

      [*((id *)v13 + 17) setPurgingAllowed:1];
      [*((id *)v13 + 17) setTimeout:10.0];
      [*((id *)v13 + 17) setCreationBlock:&__block_literal_global_46];
    }
    if (*((unsigned char *)v13 + 97))
    {
      id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v19 = (void *)*((void *)v13 + 10);
      *((void *)v13 + 10) = v18;
    }
    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.eventkit.notificationMonitor", v20);
    v22 = (void *)*((void *)v13 + 7);
    *((void *)v13 + 7) = v21;

    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    id v23 = objc_claimAutoreleasedReturnValue();
    v24 = (const char *)[v23 UTF8String];

    v25 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v26 = dispatch_queue_create(v24, v25);
    v27 = (void *)*((void *)v13 + 16);
    *((void *)v13 + 16) = v26;
  }
  return v13;
}

- (void)handleDarwinNotification:(id)a3
{
  id v6 = a3;
  if ([v6 isEqualToString:*MEMORY[0x1E4F57538]])
  {
    [(_EKNotificationMonitor *)self _syncDidStart];
  }
  else if ([v6 isEqualToString:*MEMORY[0x1E4F57540]])
  {
    [(_EKNotificationMonitor *)self _syncDidEnd:0];
  }
  else if (([v6 isEqualToString:@"EKNotificationCountChangedExternallyNotification"] & 1) != 0 {
         || self->_excludeUncheckedCalendars
  }
         && (+[EKCalendarVisibilityManager focusModeConfigurationChangedName](EKCalendarVisibilityManager, "focusModeConfigurationChangedName"), v4 = objc_claimAutoreleasedReturnValue(), int v5 = [v6 isEqualToString:v4], v4, v5))
  {
    [(_EKNotificationMonitor *)self _notificationCountChangedExternally];
  }
  else if (([v6 isEqualToString:*MEMORY[0x1E4F574C0]] & 1) != 0 {
         || [v6 isEqualToString:@"com.apple.eventkit.preference.notification.AlertInviteeDeclines"])
  }
  {
    [(_EKNotificationMonitor *)self _alertPrefChanged];
  }
  else if ([v6 isEqualToString:*MEMORY[0x1E4F574A0]])
  {
    [(_EKNotificationMonitor *)self _databaseChanged];
  }
}

- (unint64_t)notificationCount
{
  if ([(_EKNotificationMonitor *)self isMonitoringOnlyNotificationCount])
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x2020000000;
    uint64_t v12 = 0;
    v3 = [(_EKNotificationMonitor *)self notificationQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43___EKNotificationMonitor_notificationCount__block_invoke;
    v8[3] = &unk_1E5B96F20;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(v3, v8);

    unint64_t v4 = v10[3];
    _Block_object_dispose(&v9, 8);
    return v4;
  }
  else
  {
    id v6 = [(_EKNotificationMonitor *)self notificationReferences];
    unint64_t v7 = [v6 count];

    return v7;
  }
}

- (void)start
{
  if (!self->_running)
  {
    v3 = [(id)objc_opt_class() logHandle];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1A4E47000, v3, OS_LOG_TYPE_DEFAULT, "Monitor starting up.", (uint8_t *)buf, 2u);
    }

    self->_initialCheck = 1;
    [(_EKNotificationMonitor *)self attemptReload];
    self->_running = 1;
    if (self->_registerForDarwinNotifications)
    {
      if (self->_useSyncIdleTimer)
      {
        [MEMORY[0x1E4F576F8] addObserver:self selector:sel__syncDidStart name:*MEMORY[0x1E4F57538]];
        [MEMORY[0x1E4F576F8] addObserver:self selector:sel__syncDidEndExternally name:*MEMORY[0x1E4F57540]];
        [MEMORY[0x1E4F576F8] addObserver:self selector:sel__notificationCountChangedExternally name:@"EKNotificationCountChangedExternallyNotification"];
      }
      [MEMORY[0x1E4F576F8] addObserver:self selector:sel__alertPrefChanged name:*MEMORY[0x1E4F574C0]];
      [MEMORY[0x1E4F576F8] addObserver:self selector:sel__alertPrefChanged name:@"com.apple.eventkit.preference.notification.AlertInviteeDeclines"];
      if (self->_excludeUncheckedCalendars)
      {
        unint64_t v4 = (void *)MEMORY[0x1E4F576F8];
        int v5 = +[EKCalendarVisibilityManager focusModeConfigurationChangedName];
        [v4 addObserver:self selector:sel__notificationCountChangedExternally name:v5];
      }
    }
    if (self->_eventStore)
    {
      id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v6 addObserver:self selector:sel__eventStoreChangedNotification_ name:@"EKEventStoreChangedNotification" object:self->_eventStore];
    }
    if (self->_eventStorePurger)
    {
      objc_initWeak(buf, self);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __31___EKNotificationMonitor_start__block_invoke;
      v7[3] = &unk_1E5B98178;
      objc_copyWeak(&v8, buf);
      [(EKTimedEventStorePurger *)self->_eventStorePurger setChangedBlock:v7];
      objc_destroyWeak(&v8);
      objc_destroyWeak(buf);
    }
  }
}

- (void)_notificationCountChangedExternally
{
  v3 = [(id)objc_opt_class() logHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4E47000, v3, OS_LOG_TYPE_DEFAULT, "Notification count changed externally.", buf, 2u);
  }

  *(void *)buf = 0;
  unint64_t v7 = buf;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  notificationQueue = self->_notificationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61___EKNotificationMonitor__notificationCountChangedExternally__block_invoke;
  v5[3] = &unk_1E5B96E30;
  v5[4] = self;
  v5[5] = buf;
  dispatch_sync(notificationQueue, v5);
  if (v7[24]) {
    [(_EKNotificationMonitor *)self attemptReload];
  }
  _Block_object_dispose(buf, 8);
}

- (void)attemptReload
{
}

- (void)attemptReloadSynchronously:(BOOL)a3
{
  BOOL v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53___EKNotificationMonitor_attemptReloadSynchronously___block_invoke;
  v7[3] = &unk_1E5B96E08;
  void v7[4] = self;
  int v5 = (void *)MEMORY[0x1A6266730](v7, a2);
  queue = self->_queue;
  if (v3) {
    dispatch_sync(queue, v5);
  }
  else {
    dispatch_async(queue, v5);
  }
}

- (id)_fetchEventNotificationReferencesFromEventStore:(id)a3 earliestExpiringNotification:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unint64_t v7 = [(id)objc_opt_class() logHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1A4E47000, v7, OS_LOG_TYPE_DEFAULT, "Fetching event notifications from event store: %@.", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v8 = [v6 eventNotificationsExcludingUncheckedCalendars:self->_excludeUncheckedCalendars filteredByShowsNotificationsFlag:self->_filteredByShowsNotificationsFlag earliestExpiringNotification:a4];
  char v9 = [(id)objc_opt_class() logHandle];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1A4E47000, v9, OS_LOG_TYPE_DEFAULT, "Fetched event notifications from event store: %@.", (uint8_t *)&buf, 0xCu);
  }

  if (self->_automaticallyFaultNotifications)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __103___EKNotificationMonitor__fetchEventNotificationReferencesFromEventStore_earliestExpiringNotification___block_invoke;
    v16[3] = &unk_1E5B981F0;
    v16[4] = self;
    [v8 enumerateObjectsUsingBlock:v16];
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__13;
  v20 = __Block_byref_object_dispose__13;
  id v21 = 0;
  id v10 = +[_EKNotificationMonitor blacklistedNotificationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103___EKNotificationMonitor__fetchEventNotificationReferencesFromEventStore_earliestExpiringNotification___block_invoke_84;
  block[3] = &unk_1E5B969D8;
  block[4] = &buf;
  dispatch_sync(v10, block);

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __103___EKNotificationMonitor__fetchEventNotificationReferencesFromEventStore_earliestExpiringNotification___block_invoke_2;
  v14[3] = &unk_1E5B98218;
  v14[4] = &buf;
  uint64_t v11 = [MEMORY[0x1E4F28F60] predicateWithBlock:v14];
  uint64_t v12 = [v8 filteredArrayUsingPredicate:v11];

  _Block_object_dispose(&buf, 8);

  return v12;
}

+ (OS_os_log)logHandle
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35___EKNotificationMonitor_logHandle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (logHandle_onceToken != -1) {
    dispatch_once(&logHandle_onceToken, block);
  }
  v2 = (void *)logHandle_logHandle;

  return (OS_os_log *)v2;
}

- (BOOL)isMonitoringOnlyNotificationCount
{
  return self->_isMonitoringOnlyNotificationCount;
}

- (NSArray)notificationReferences
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__13;
  uint64_t v11 = __Block_byref_object_dispose__13;
  id v12 = 0;
  BOOL v3 = [(_EKNotificationMonitor *)self notificationQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48___EKNotificationMonitor_notificationReferences__block_invoke;
  v6[3] = &unk_1E5B96F20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (id)effectiveCallbackQueue
{
  callbackNotificationQueue = self->_callbackNotificationQueue;
  if (callbackNotificationQueue)
  {
    BOOL v3 = callbackNotificationQueue;
  }
  else
  {
    BOOL v3 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
    id v4 = MEMORY[0x1E4F14428];
  }

  return v3;
}

- (id)_eventStore
{
  eventStoreGetter = (void (**)(id, SEL))self->_eventStoreGetter;
  if (eventStoreGetter)
  {
    eventStoreGetter[2](self->_eventStoreGetter, a2);
    eventStorePurger = (EKEventStore *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    eventStore = self->_eventStore;
    if (eventStore)
    {
      eventStorePurger = eventStore;
    }
    else
    {
      eventStorePurger = (EKEventStore *)self->_eventStorePurger;
      if (eventStorePurger)
      {
        eventStorePurger = [(EKEventStore *)eventStorePurger acquireCachedEventStoreOrCreate:1];
      }
    }
  }

  return eventStorePurger;
}

+ (id)blacklistedNotificationQueue
{
  if (blacklistedNotificationQueue_onceToken != -1) {
    dispatch_once(&blacklistedNotificationQueue_onceToken, &__block_literal_global_79);
  }
  v2 = (void *)blacklistedNotificationQueue__blacklistedNotificationQueue;

  return v2;
}

- (void)_updateTimerFireDate:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(_EKNotificationMonitor *)self _killTimer];
  if (v4)
  {
    int v5 = [MEMORY[0x1E4F1C9C8] date];
    int v6 = [v4 CalIsBeforeDate:v5];
    BOOL v7 = v6;
    if (v6 && self->_lastExpirationTimerFireDateWasInThePast)
    {
      uint64_t v8 = [(id)objc_opt_class() logHandle];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[_EKNotificationMonitor _updateTimerFireDate:]((uint64_t)v4, v8);
      }

      self->_lastExpirationTimerFireDateWasInThePast = v7;
    }
    else
    {
      self->_lastExpirationTimerFireDateWasInThePast = v6;
      uint64_t v9 = [(id)objc_opt_class() logHandle];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138543362;
        id v17 = v4;
        _os_log_impl(&dword_1A4E47000, v9, OS_LOG_TYPE_DEFAULT, "Next expiration fire time will be %{public}@.", (uint8_t *)&v16, 0xCu);
      }

      id v10 = (NSDate *)[v4 copy];
      nextFireTime = self->_nextFireTime;
      self->_nextFireTime = v10;

      id v12 = (PCPersistentTimer *)[objc_alloc(MEMORY[0x1E4F89D38]) initWithFireDate:self->_nextFireTime serviceIdentifier:@"com.apple.eventkit.invitationmonitor" target:self selector:sel__timerFired userInfo:0];
      timer = self->_timer;
      self->_timer = v12;

      [(PCPersistentTimer *)self->_timer setMinimumEarlyFireProportion:1.0];
      uint64_t v14 = self->_timer;
      v15 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [(PCPersistentTimer *)v14 scheduleInRunLoop:v15];
    }
  }
  else
  {
    int v5 = [(id)objc_opt_class() logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1A4E47000, v5, OS_LOG_TYPE_DEFAULT, "No expiring notifications. Not setting expiration timer.", (uint8_t *)&v16, 2u);
    }
  }
}

- (void)_killTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  timer = self->_timer;
  if (timer)
  {
    [(PCPersistentTimer *)timer invalidate];
    id v4 = self->_timer;
    self->_timer = 0;
  }
  nextFireTime = self->_nextFireTime;
  self->_nextFireTime = 0;
}

- (void)_addRemovedOrAddedObjectIDsTo:(id)a3 oldNotifications:(id)a4 newNotifications:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v12 = (id)[v8 mutableCopy];
  [v12 intersectSet:v7];
  [v8 minusSet:v12];
  [v7 minusSet:v12];
  id v10 = [v8 allObjects];

  [v9 addObjectsFromArray:v10];
  uint64_t v11 = [v7 allObjects];

  [v9 addObjectsFromArray:v11];
}

- (_EKNotificationMonitor)initWithOptions:(int64_t)a3 eventStore:(id)a4
{
  return (_EKNotificationMonitor *)[(_EKNotificationMonitor *)self _initWithOptions:a3 eventStore:a4 eventStoreGetter:0];
}

+ (id)requestedDarwinNotifications
{
  v6[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F574C0];
  v6[0] = @"EKNotificationCountChangedExternallyNotification";
  v6[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F57540];
  v6[2] = *MEMORY[0x1E4F57538];
  v6[3] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];

  return v4;
}

- (_EKNotificationMonitor)init
{
  return (_EKNotificationMonitor *)[(_EKNotificationMonitor *)self _initWithOptions:0 eventStore:0 eventStoreGetter:0];
}

- (_EKNotificationMonitor)initWithOptions:(int64_t)a3
{
  return (_EKNotificationMonitor *)[(_EKNotificationMonitor *)self _initWithOptions:a3 eventStore:0 eventStoreGetter:0];
}

- (_EKNotificationMonitor)initWithOptions:(int64_t)a3 eventStoreGetter:(id)a4
{
  return (_EKNotificationMonitor *)[(_EKNotificationMonitor *)self _initWithOptions:a3 eventStore:0 eventStoreGetter:a4];
}

- (void)dealloc
{
  [(_EKNotificationMonitor *)self _killSyncTimer:0];
  [(_EKNotificationMonitor *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)_EKNotificationMonitor;
  [(_EKNotificationMonitor *)&v3 dealloc];
}

- (void)stop
{
  if (self->_running)
  {
    objc_super v3 = [(id)objc_opt_class() logHandle];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A4E47000, v3, OS_LOG_TYPE_DEFAULT, "Monitor shutting down.", buf, 2u);
    }

    if (self->_registerForDarwinNotifications)
    {
      if (self->_useSyncIdleTimer)
      {
        [MEMORY[0x1E4F576F8] removeObserver:self name:*MEMORY[0x1E4F57538]];
        [MEMORY[0x1E4F576F8] removeObserver:self name:*MEMORY[0x1E4F57540]];
        [MEMORY[0x1E4F576F8] removeObserver:self name:@"EKNotificationCountChangedExternallyNotification"];
      }
      [MEMORY[0x1E4F576F8] removeObserver:self name:*MEMORY[0x1E4F574C0]];
    }
    if (self->_eventStore)
    {
      id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v4 removeObserver:self name:@"EKEventStoreChangedNotification" object:self->_eventStore];
    }
    eventStorePurger = self->_eventStorePurger;
    if (eventStorePurger) {
      [(EKTimedEventStorePurger *)eventStorePurger setChangedBlock:0];
    }
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __30___EKNotificationMonitor_stop__block_invoke;
    block[3] = &unk_1E5B96E08;
    block[4] = self;
    dispatch_sync(queue, block);
    self->_running = 0;
  }
}

- (void)adjust
{
  if (self->_running)
  {
    [(_EKNotificationMonitor *)self attemptReload];
  }
  else
  {
    uint64_t v2 = [(id)objc_opt_class() logHandle];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v3 = 0;
      _os_log_impl(&dword_1A4E47000, v2, OS_LOG_TYPE_DEFAULT, "Ignoring expiration timer because the notification monitor is not running.", v3, 2u);
    }
  }
}

- (void)_eventStoreChangedNotification:(id)a3
{
  if (!+[EKChangeListener isSyncStatusChangeNotification:a3])
  {
    [(_EKNotificationMonitor *)self _eventStoreChanged];
  }
}

- (void)_eventStoreChanged
{
  [(_EKNotificationMonitor *)self trackChangesInEventStore];

  [(_EKNotificationMonitor *)self attemptReload];
}

- (void)_databaseChanged
{
  objc_super v3 = [(id)objc_opt_class() logHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A4E47000, v3, OS_LOG_TYPE_DEFAULT, "Database changed.", v4, 2u);
  }

  [(_EKNotificationMonitor *)self trackChangesInEventStore];
  [(_EKNotificationMonitor *)self attemptReload];
}

- (void)_alertPrefChanged
{
  objc_super v3 = [(id)objc_opt_class() logHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A4E47000, v3, OS_LOG_TYPE_DEFAULT, "Alert pref changed.", v4, 2u);
  }

  [(_EKNotificationMonitor *)self attemptReload];
}

- (void)_timerFired
{
  objc_super v3 = [(id)objc_opt_class() logHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A4E47000, v3, OS_LOG_TYPE_DEFAULT, "Expiration timer fired.", v4, 2u);
  }

  [(_EKNotificationMonitor *)self adjust];
}

+ (void)addBlacklistedNotificationObjectID:(id)a3
{
  id v4 = a3;
  int v5 = [a1 blacklistedNotificationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61___EKNotificationMonitor_addBlacklistedNotificationObjectID___block_invoke;
  block[3] = &unk_1E5B96E08;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

+ (id)blacklistedRowIDs
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__13;
  uint64_t v14 = __Block_byref_object_dispose__13;
  id v15 = 0;
  uint64_t v2 = [a1 blacklistedNotificationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43___EKNotificationMonitor_blacklistedRowIDs__block_invoke;
  block[3] = &unk_1E5B969D8;
  void block[4] = &v10;
  dispatch_sync(v2, block);

  objc_super v3 = objc_opt_new();
  id v4 = (void *)v11[5];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43___EKNotificationMonitor_blacklistedRowIDs__block_invoke_2;
  v7[3] = &unk_1E5B981C8;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  _Block_object_dispose(&v10, 8);

  return v5;
}

- (void)_resetSyncTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_notificationQueue);
  if (self->_useSyncIdleTimer)
  {
    [(_EKNotificationMonitor *)self _killSyncTimer:0];
    id v3 = objc_alloc(MEMORY[0x1E4F1CB00]);
    id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:30.0];
    id v5 = (NSTimer *)[v3 initWithFireDate:v4 interval:self target:sel__syncTimerFired_ selector:0 userInfo:0 repeats:0.0];
    syncTimer = self->_syncTimer;
    self->_syncTimer = v5;

    id v7 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v7 addTimer:self->_syncTimer forMode:*MEMORY[0x1E4F1C4B0]];
  }
}

- (void)_killSyncTimer:(id)a3
{
  id v4 = (NSTimer *)a3;
  syncTimer = self->_syncTimer;
  if (!v4 || (BOOL v6 = syncTimer == v4, syncTimer = v4, v6))
  {
    id v8 = v4;
    [(NSTimer *)syncTimer invalidate];
    id v7 = self->_syncTimer;
    self->_syncTimer = 0;

    id v4 = v8;
  }

  MEMORY[0x1F41817F8](syncTimer, v4);
}

- (void)_syncTimerFired:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() logHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_1A4E47000, v5, OS_LOG_TYPE_DEFAULT, "Sync timer fired.", v6, 2u);
  }

  [(_EKNotificationMonitor *)self _syncDidEnd:v4];
}

- (void)_syncDidStart
{
  id v3 = [(id)objc_opt_class() logHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A4E47000, v3, OS_LOG_TYPE_DEFAULT, "Sync started. Suppressing notification monitor checks while it runs.", buf, 2u);
  }

  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39___EKNotificationMonitor__syncDidStart__block_invoke;
  block[3] = &unk_1E5B96E08;
  void block[4] = self;
  dispatch_sync(notificationQueue, block);
}

- (void)_syncDidEndExternally
{
}

- (void)_syncDidEnd:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38___EKNotificationMonitor__syncDidEnd___block_invoke;
  block[3] = &unk_1E5B96E58;
  void block[4] = self;
  id v6 = v4;
  id v8 = v6;
  id v9 = &v10;
  dispatch_sync(notificationQueue, block);
  if (*((unsigned char *)v11 + 24)) {
    [(_EKNotificationMonitor *)self attemptReload];
  }

  _Block_object_dispose(&v10, 8);
}

- (void)trackChangesInEventStore
{
  if (self->_computeChangedNotificationSet && !self->_isMonitoringOnlyNotificationCount)
  {
    id v3 = [(_EKNotificationMonitor *)self _eventStore];
    id v4 = [v3 connection];
    id v5 = [v4 CADOperationProxySync];
    lastChangedTimestamp = self->_lastChangedTimestamp;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50___EKNotificationMonitor_trackChangesInEventStore__block_invoke;
    v7[3] = &unk_1E5B98240;
    void v7[4] = self;
    [v5 CADDatabaseGetChangedEntityIDsSinceTimestamp:lastChangedTimestamp reply:v7];
  }
}

- (OS_dispatch_queue)callbackNotificationQueue
{
  return self->_callbackNotificationQueue;
}

- (void)setCallbackNotificationQueue:(id)a3
{
}

- (EKTimedEventStorePurger)eventStorePurger
{
  return self->_eventStorePurger;
}

- (EKEventStore)eventStore
{
  return self->_eventStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_eventStorePurger, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_callbackNotificationQueue, 0);
  objc_storeStrong((id *)&self->_notificationReferences, 0);
  objc_storeStrong((id *)&self->_changedIDs, 0);
  objc_storeStrong((id *)&self->_lastChangedTimestamp, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_syncTimer, 0);
  objc_storeStrong((id *)&self->_nextFireTime, 0);
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong(&self->_eventStoreGetter, 0);
}

- (void)_updateTimerFireDate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_ERROR, "Received multiple expiration dates in the past. Will not set expiration timer. Most recent expiration date received was %{public}@", (uint8_t *)&v2, 0xCu);
}

@end