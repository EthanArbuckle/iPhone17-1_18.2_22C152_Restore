@interface EDRemindMeNotificationController
+ (NSString)localizedRemindMeNotificationPlaceholder;
+ (NSString)localizedRemindMeNotificationTitle;
+ (NSString)localizedRemindMeNotificationTitleNoSender;
+ (OS_os_log)log;
- (EDRemindMeNotificationController)initWithHookRegistry:(id)a3 messagePersistence:(id)a4 alarmDateProvider:(id)a5 eventDelegate:(id)a6 alarmScheduler:(id)a7;
- (EDRemindMeNotificationController)initWithHookRegistry:(id)a3 messagePersistence:(id)a4 alarmScheduler:(id)a5;
- (EDRemindMeNotificationControllerEventDelegate)eventDelegate;
- (EFXPCAlarm)xpcAlarm;
- (NSHashTable)observers;
- (id)_fetchMessagesToNotifyWithStartDate:(id)a3 endDate:(id)a4;
- (id)addRemindMeObserver:(id)a3;
- (id)nextAlarmDate;
- (void)_alarmFired;
- (void)_notify:(id)a3;
- (void)_updateAlarmStartDate:(id)a3;
- (void)_updateAlarmUpdatedMessages:(id)a3 readLaterDate:(id)a4 startDate:(id)a5 changeIsRemote:(BOOL)a6;
- (void)controller:(id)a3 scheduleAlarmForMessage:(id)a4 date:(id)a5;
- (void)performDelayedTasks;
- (void)persistenceDidChangeReadLaterDate:(id)a3 messages:(id)a4 changeIsRemote:(BOOL)a5 generationWindow:(id)a6;
- (void)removeRemindMeObserver:(id)a3;
- (void)resetRemindMeAlarmIfNeeded;
- (void)setNextAlarmDate:(uint64_t)a1;
- (void)test_tearDown;
- (void)test_waitForUpdates;
@end

@implementation EDRemindMeNotificationController

uint64_t __56__EDRemindMeNotificationController_addRemindMeObserver___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addObject:*(void *)(a1 + 32)];
}

- (id)addRemindMeObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__EDRemindMeNotificationController_addRemindMeObserver___block_invoke;
  v15[3] = &unk_1E6C04D18;
  id v6 = v4;
  id v16 = v6;
  [(EFLocked *)observers performWhileLocked:v15];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, v6);
  v7 = (void *)MEMORY[0x1E4F60D40];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__EDRemindMeNotificationController_addRemindMeObserver___block_invoke_2;
  v10[3] = &unk_1E6C03410;
  objc_copyWeak(&v11, &location);
  objc_copyWeak(&v12, &from);
  v8 = [v7 tokenWithCancelationBlock:v10];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v8;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__EDRemindMeNotificationController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_75 != -1) {
    dispatch_once(&log_onceToken_75, block);
  }
  v2 = (void *)log_log_75;

  return (OS_os_log *)v2;
}

void __39__EDRemindMeNotificationController_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_75;
  log_log_75 = (uint64_t)v1;
}

+ (NSString)localizedRemindMeNotificationTitle
{
  return (NSString *)_EFLocalizedString();
}

+ (NSString)localizedRemindMeNotificationPlaceholder
{
  return (NSString *)_EFLocalizedString();
}

+ (NSString)localizedRemindMeNotificationTitleNoSender
{
  return (NSString *)_EFLocalizedString();
}

- (EDRemindMeNotificationController)initWithHookRegistry:(id)a3 messagePersistence:(id)a4 alarmScheduler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(DefaultEDRemindMeNotificationControllerAlarmDateProvider);
  id v12 = [(EDRemindMeNotificationController *)self initWithHookRegistry:v8 messagePersistence:v9 alarmDateProvider:v11 eventDelegate:self alarmScheduler:v10];

  return v12;
}

- (EDRemindMeNotificationController)initWithHookRegistry:(id)a3 messagePersistence:(id)a4 alarmDateProvider:(id)a5 eventDelegate:(id)a6 alarmScheduler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v39.receiver = self;
  v39.super_class = (Class)EDRemindMeNotificationController;
  v18 = [(EDRemindMeNotificationController *)&v39 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_hookRegistry, a3);
    objc_storeStrong((id *)&v19->_messagePersistence, a4);
    objc_storeStrong((id *)&v19->_alarmDateProvider, a5);
    objc_storeWeak((id *)&v19->_eventDelegate, v16);
    v20 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F60DA0]) initWithObject:v20];
    observers = v19->_observers;
    v19->_observers = (EFLocked *)v21;

    v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v24 = dispatch_queue_create("com.apple.EmailDaemon.EDRemindMeNotificationController.messageScheduler", v23);
    alarmQueue = v19->_alarmQueue;
    v19->_alarmQueue = (OS_dispatch_queue *)v24;

    uint64_t v26 = [objc_alloc(MEMORY[0x1E4F60F48]) initWithScheduler:v17 eventName:@"EDRemindMeNotificationController.alarm" eventHandlerQueue:v19->_alarmQueue];
    xpcAlarm = v19->_xpcAlarm;
    v19->_xpcAlarm = (EFXPCAlarm *)v26;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v19);
    v28 = v19->_xpcAlarm;
    uint64_t v33 = MEMORY[0x1E4F143A8];
    uint64_t v34 = 3221225472;
    v35 = __123__EDRemindMeNotificationController_initWithHookRegistry_messagePersistence_alarmDateProvider_eventDelegate_alarmScheduler___block_invoke;
    v36 = &unk_1E6C04CF0;
    objc_copyWeak(&v37, &location);
    [(EFXPCAlarm *)v28 beginReceivingEventsWithHandler:&v33];
    v29 = [EDQueryCreator alloc];
    uint64_t v30 = -[EDQueryCreator initWithQueryType:](v29, "initWithQueryType:", *MEMORY[0x1E4F5FEF8], v33, v34, v35, v36);
    readLaterQueryCreator = v19->_readLaterQueryCreator;
    v19->_readLaterQueryCreator = (EDQueryCreator *)v30;

    [v13 registerMessageChangeHookResponder:v19];
    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }
  return v19;
}

void __123__EDRemindMeNotificationController_initWithHookRegistry_messagePersistence_alarmDateProvider_eventDelegate_alarmScheduler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _alarmFired];
}

- (void)test_waitForUpdates
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDRemindMeNotificationController.m", 110, @"%s can only be called from unit tests", "-[EDRemindMeNotificationController test_waitForUpdates]");
  }
  alarmQueue = self->_alarmQueue;

  dispatch_sync(alarmQueue, &__block_literal_global_60);
}

- (void)test_tearDown
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDRemindMeNotificationController.m", 116, @"%s can only be called from unit tests", "-[EDRemindMeNotificationController test_tearDown]");
  }
  [(EFXPCAlarm *)self->_xpcAlarm invalidate];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
  alarmQueue = self->_alarmQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__EDRemindMeNotificationController_test_tearDown__block_invoke;
  block[3] = &unk_1E6BFF2F0;
  id v6 = v4;
  id v11 = v6;
  dispatch_async(alarmQueue, block);
  while (([v6 tryLockWhenCondition:1] & 1) == 0)
  {
    v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.001];
    id v8 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v8 runUntilDate:v7];

    [MEMORY[0x1E4F29060] sleepUntilDate:v7];
  }
  [v6 unlock];
}

uint64_t __49__EDRemindMeNotificationController_test_tearDown__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) unlockWithCondition:1];
}

- (NSHashTable)observers
{
  return (NSHashTable *)[(EFLocked *)self->_observers getObject];
}

void __56__EDRemindMeNotificationController_addRemindMeObserver___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v3) {
      [v4 removeRemindMeObserver:v3];
    }

    id WeakRetained = v4;
  }
}

- (void)removeRemindMeObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__EDRemindMeNotificationController_removeRemindMeObserver___block_invoke;
  v7[3] = &unk_1E6C04D18;
  id v8 = v4;
  id v6 = v4;
  [(EFLocked *)observers performWhileLocked:v7];
}

uint64_t __59__EDRemindMeNotificationController_removeRemindMeObserver___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObject:*(void *)(a1 + 32)];
}

- (id)nextAlarmDate
{
  if (a1)
  {
    a1 = [a1[3] nextDate];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setNextAlarmDate:(uint64_t)a1
{
  id v3 = a2;
  if (a1) {
    [*(id *)(a1 + 24) setNextDate:v3];
  }
}

- (void)performDelayedTasks
{
  alarmQueue = self->_alarmQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__EDRemindMeNotificationController_performDelayedTasks__block_invoke;
  v3[3] = &unk_1E6BFFA50;
  v3[4] = self;
  v3[5] = a2;
  dispatch_async(alarmQueue, v3);
}

void __55__EDRemindMeNotificationController_performDelayedTasks__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = -[EDRemindMeNotificationController nextAlarmDate](*(id **)(a1 + 32));
  id v3 = +[EDRemindMeNotificationController log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v7 = 138543618;
    id v8 = v4;
    __int16 v9 = 2114;
    id v10 = v2;
    _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ nextAlarmDate:%{public}@", (uint8_t *)&v7, 0x16u);
  }
  if (!v2
    || ([MEMORY[0x1E4F1C9C8] now],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = objc_msgSend(v2, "ef_isEarlierThanDate:", v5),
        v5,
        v6))
  {
    [*(id *)(a1 + 32) _updateAlarmStartDate:0];
  }
}

- (void)_updateAlarmStartDate:(id)a3
{
}

- (void)_updateAlarmUpdatedMessages:(id)a3 readLaterDate:(id)a4 startDate:(id)a5 changeIsRemote:(BOOL)a6
{
  BOOL v7 = a6;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_alarmQueue);
  if (!v14)
  {
    id v15 = -[EDRemindMeNotificationController nextAlarmDate]((id *)&self->super.isa);
    id v16 = v15;
    if (v15)
    {
      id v14 = v15;
    }
    else
    {
      id v17 = [MEMORY[0x1E4F1C9C8] now];
      objc_msgSend(v17, "ec_integerDate");
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  SEL aSelector = a2;
  v18 = self->_readLaterQueryCreator;
  v19 = [(EDQueryCreator *)v18 queryWithStartDate:v14 endDate:0];

  v20 = self->_messagePersistence;
  uint64_t v21 = [(EDMessagePersistence *)v20 persistedMessagesMatchingQuery:v19 limit:1];

  uint64_t v22 = [v12 count];
  if (!v13 && v22)
  {
    uint64_t v37 = MEMORY[0x1E4F143A8];
    uint64_t v38 = 3221225472;
    objc_super v39 = __103__EDRemindMeNotificationController__updateAlarmUpdatedMessages_readLaterDate_startDate_changeIsRemote___block_invoke;
    v40 = &unk_1E6C02500;
    id v41 = v12;
    uint64_t v23 = objc_msgSend(v21, "ef_filter:", &v37, aSelector);

    uint64_t v21 = (void *)v23;
  }
  if (objc_msgSend(v21, "count", aSelector, v37, v38, v39, v40))
  {
    int v6 = [v21 firstObject];
    dispatch_queue_t v24 = [v6 readLater];
    id v25 = [v24 date];

    if (!v7) {
      goto LABEL_14;
    }
  }
  else
  {
    id v25 = 0;
    if (!v7) {
      goto LABEL_14;
    }
  }
  int v6 = [MEMORY[0x1E4F1C9C8] now];
  if (!objc_msgSend(v13, "ef_isLaterThanDate:", v6))
  {
LABEL_27:

    goto LABEL_28;
  }
LABEL_14:
  uint64_t v26 = [v12 count];
  if (v13) {
    BOOL v27 = v26 == 0;
  }
  else {
    BOOL v27 = 1;
  }
  int v28 = !v27;
  if (v7)
  {

    if ((v28 & 1) == 0) {
      goto LABEL_28;
    }
  }
  else if (!v28)
  {
    goto LABEL_28;
  }
  if (!v25 || objc_msgSend(v13, "ef_isEarlierThanDate:", v25))
  {
    id v29 = v12;

    int v6 = v25;
    uint64_t v21 = v29;
    id v25 = v13;
    goto LABEL_27;
  }
LABEL_28:
  uint64_t v30 = +[EDRemindMeNotificationController log];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = NSStringFromSelector(aSelectora);
    uint64_t v32 = [v12 count];
    *(_DWORD *)buf = 138544642;
    v43 = v31;
    __int16 v44 = 2048;
    uint64_t v45 = v32;
    __int16 v46 = 2114;
    id v47 = v13;
    __int16 v48 = 2114;
    id v49 = v14;
    __int16 v50 = 1024;
    BOOL v51 = v7;
    __int16 v52 = 2114;
    id v53 = v25;
    _os_log_impl(&dword_1DB39C000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ updatedMessages:%lu readLaterDate:%{public}@ startDate:%{public}@ changeIsRemote:%{BOOL}d firstMessageReadLaterDate:%{public}@", buf, 0x3Au);
  }
  uint64_t v33 = [(EDRemindMeNotificationController *)self eventDelegate];
  if (v25)
  {
    uint64_t v34 = [v21 firstObject];
  }
  else
  {
    uint64_t v34 = 0;
  }
  [v33 controller:self scheduleAlarmForMessage:v34 date:v25];
  -[EDRemindMeNotificationController setNextAlarmDate:]((uint64_t)self, v25);
}

uint64_t __103__EDRemindMeNotificationController__updateAlarmUpdatedMessages_readLaterDate_startDate_changeIsRemote___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (id)_fetchMessagesToNotifyWithStartDate:(id)a3 endDate:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (self) {
    readLaterQueryCreator = self->_readLaterQueryCreator;
  }
  else {
    readLaterQueryCreator = 0;
  }
  id v10 = [(EDQueryCreator *)readLaterQueryCreator queryWithStartDate:v7 endDate:v8];
  uint64_t v11 = +[EDRemindMeNotificationController log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = NSStringFromSelector(a2);
    int v17 = 138543874;
    v18 = v12;
    __int16 v19 = 2114;
    id v20 = v7;
    __int16 v21 = 2114;
    id v22 = v8;
    _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ startDate:%{public}@ endDate:%{public}@", (uint8_t *)&v17, 0x20u);
  }
  if (self) {
    messagePersistence = self->_messagePersistence;
  }
  else {
    messagePersistence = 0;
  }
  id v14 = [(EDMessagePersistence *)messagePersistence persistedMessagesMatchingQuery:v10 limit:0x7FFFFFFFFFFFFFFFLL];
  id v15 = objc_msgSend(v14, "ef_uniquifyWithComparator:", &__block_literal_global_87);

  return v15;
}

uint64_t __80__EDRemindMeNotificationController__fetchMessagesToNotifyWithStartDate_endDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "globalMessageID"));
  id v7 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v5, "globalMessageID"));
  uint64_t v8 = [v6 compare:v7];

  return v8;
}

- (void)_alarmFired
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_alarmQueue);
  id v4 = -[EDRemindMeNotificationController nextAlarmDate]((id *)&self->super.isa);
  id v5 = [MEMORY[0x1E4F1C9C8] now];
  int v6 = objc_msgSend(v5, "ec_integerDate");

  if (objc_msgSend(v6, "ef_isLaterThanDate:", v4))
  {
    id v7 = v6;
  }
  else
  {
    uint64_t v8 = [v4 dateByAddingTimeInterval:1.0];
    id v7 = objc_msgSend(v8, "ec_integerDate");

    __int16 v9 = +[EDRemindMeNotificationController log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      id v26 = v10;
      __int16 v27 = 2114;
      int v28 = v7;
      _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ update endDate to %{public}@ so it's after startDate", buf, 0x16u);
    }
  }
  uint64_t v11 = [(EDRemindMeNotificationController *)self _fetchMessagesToNotifyWithStartDate:v4 endDate:v7];
  id v12 = +[EDRemindMeNotificationController log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = -[EDRemindMeNotificationController nextAlarmDate]((id *)&self->super.isa);
    uint64_t v15 = [v11 count];
    *(_DWORD *)buf = 138543874;
    id v26 = v13;
    __int16 v27 = 2114;
    int v28 = v14;
    __int16 v29 = 2048;
    uint64_t v30 = v15;
    _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ nextAlarmDate:%{public}@ messages to notify:%lu", buf, 0x20u);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v16 = v11;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v16);
        }
        -[EDRemindMeNotificationController _notify:](self, "_notify:", *(void *)(*((void *)&v20 + 1) + 8 * v19++), (void)v20);
      }
      while (v17 != v19);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v17);
  }

  [(EDRemindMeNotificationController *)self _updateAlarmStartDate:v7];
}

- (void)_notify:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_alarmQueue);
  id v5 = [(EDRemindMeNotificationController *)self observers];
  int v6 = [v5 allObjects];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "controller:messageTimerFired:", self, v4, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)resetRemindMeAlarmIfNeeded
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self) {
    alarmDateProvider = self->_alarmDateProvider;
  }
  else {
    alarmDateProvider = 0;
  }
  id v4 = alarmDateProvider;
  id v5 = [(EDRemindMeNotificationControllerAlarmDateProvider *)v4 nextDate];

  int v6 = +[EDRemindMeNotificationController log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "Next alarm date from DefaultEDRemindMeNotificationControllerAlarmDateProvider: %{public}@.", (uint8_t *)&v9, 0xCu);
  }

  if (v5)
  {
    id v7 = +[EDRemindMeNotificationController log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      uint64_t v10 = v5;
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "Reset remind me later next alarm to %{public}@.", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v8 = [(EDRemindMeNotificationController *)self xpcAlarm];
    [v8 setNextFireDate:v5 isUserVisible:1];
  }
}

- (void)controller:(id)a3 scheduleAlarmForMessage:(id)a4 date:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = +[EDRemindMeNotificationController log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = NSStringFromSelector(a2);
    int v13 = 138543874;
    long long v14 = v11;
    __int16 v15 = 2114;
    id v16 = v9;
    __int16 v17 = 2048;
    uint64_t v18 = [v8 globalMessageID];
    _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ date:%{public}@ message.globalMessageID:%lld", (uint8_t *)&v13, 0x20u);
  }
  long long v12 = [(EDRemindMeNotificationController *)self xpcAlarm];
  [v12 setNextFireDate:v9 isUserVisible:1];
}

- (void)persistenceDidChangeReadLaterDate:(id)a3 messages:(id)a4 changeIsRemote:(BOOL)a5 generationWindow:(id)a6
{
  BOOL v6 = a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  long long v12 = +[EDRemindMeNotificationController log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543874;
    long long v22 = v13;
    __int16 v23 = 1024;
    BOOL v24 = v6;
    __int16 v25 = 2114;
    id v26 = v10;
    _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ changeIsRemote:%{BOOL}d readLaterDate:%{public}@", buf, 0x1Cu);
  }
  alarmQueue = self->_alarmQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __111__EDRemindMeNotificationController_persistenceDidChangeReadLaterDate_messages_changeIsRemote_generationWindow___block_invoke;
  v17[3] = &unk_1E6C04D60;
  v17[4] = self;
  id v18 = v10;
  id v19 = v11;
  BOOL v20 = v6;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(alarmQueue, v17);
}

void __111__EDRemindMeNotificationController_persistenceDidChangeReadLaterDate_messages_changeIsRemote_generationWindow___block_invoke(uint64_t a1)
{
  -[EDRemindMeNotificationController nextAlarmDate](*(id **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2 || !*(void *)(a1 + 40) || (objc_msgSend(v2, "isEqualToDate:") & 1) == 0) {
    [*(id *)(a1 + 32) _updateAlarmUpdatedMessages:*(void *)(a1 + 48) readLaterDate:*(void *)(a1 + 40) startDate:0 changeIsRemote:*(unsigned __int8 *)(a1 + 56)];
  }
}

- (EDRemindMeNotificationControllerEventDelegate)eventDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventDelegate);

  return (EDRemindMeNotificationControllerEventDelegate *)WeakRetained;
}

- (EFXPCAlarm)xpcAlarm
{
  return self->_xpcAlarm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcAlarm, 0);
  objc_destroyWeak((id *)&self->_eventDelegate);
  objc_storeStrong((id *)&self->_readLaterQueryCreator, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_alarmDateProvider, 0);
  objc_storeStrong((id *)&self->_alarmQueue, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end