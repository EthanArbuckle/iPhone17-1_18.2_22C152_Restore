@interface FCTypicalDayProvider
- (BOOL)enumerateActivitySummariesFromDateComponents:(id)a3 toDateComponents:(id)a4 error:(id *)a5 handler:(id)a6;
- (FCTypicalDayProvider)initWithDateProvider:(id)a3 profile:(id)a4 serviceQueue:(id)a5;
- (FITypicalDayActivityModel)typicalDayModel;
- (NSDate)userEndOfDay;
- (NSDate)userStartOfDay;
- (id)_typicalDayIntervalFromToday;
- (id)clientProvidedUserEndOfDay;
- (id)clientProvidedUserStartOfDay;
- (id)currentCalendar;
- (id)currentDate;
- (id)firstOnWristDateToday;
- (id)onServiceQueue_currentActivityCacheSummary;
- (void)_onqueue_handleUpdatedActivitySummary:(id)a3;
- (void)_onqueue_rebuildTypicalDayModelForced:(BOOL)a3;
- (void)_onqueue_registerForSignificantTimeChanges;
- (void)_significantTimeChangeOccurred:(id)a3;
- (void)currentActivitySummaryHelper:(id)a3 didUpdateTodayActivitySummary:(id)a4 changedFields:(unint64_t)a5;
- (void)currentActivitySummaryHelper:(id)a3 didUpdateYesterdayActivitySummary:(id)a4 changedFields:(unint64_t)a5;
- (void)dealloc;
- (void)profileDidBecomeReady:(id)a3;
- (void)setUserEndOfDay:(id)a3;
- (void)setUserStartOfDay:(id)a3;
@end

@implementation FCTypicalDayProvider

- (FCTypicalDayProvider)initWithDateProvider:(id)a3 profile:(id)a4 serviceQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)FCTypicalDayProvider;
  v12 = [(FCTypicalDayProvider *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dateProvider, a3);
    objc_storeWeak((id *)&v13->_profile, v10);
    objc_storeStrong((id *)&v13->_serviceQueue, a5);
    id WeakRetained = objc_loadWeakRetained((id *)&v13->_profile);
    [WeakRetained registerProfileReadyObserver:v13 queue:v13->_serviceQueue];
  }
  return v13;
}

- (void)dealloc
{
  if (notify_is_valid_token(self->_significantTimeChangeToken))
  {
    notify_cancel(self->_significantTimeChangeToken);
    self->_significantTimeChangeToken = -1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v4 = [WeakRetained currentActivitySummaryHelper];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)FCTypicalDayProvider;
  [(FCTypicalDayProvider *)&v5 dealloc];
}

- (void)profileDidBecomeReady:(id)a3
{
  serviceQueue = self->_serviceQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(serviceQueue);
  id v6 = objc_alloc(MEMORY[0x1E4F61C78]);
  v7 = [(FCTypicalDayProvider *)self _typicalDayIntervalFromToday];
  v8 = (FITypicalDayActivityModel *)[v6 initForDateInterval:v7 delegate:self];
  typicalDayModel = self->_typicalDayModel;
  self->_typicalDayModel = v8;

  id v10 = [(FCCDateProvider *)self->_dateProvider coachingDate];
  lastRebuildDate = self->_lastRebuildDate;
  self->_lastRebuildDate = v10;

  _HKInitializeLogging();
  v12 = *MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1D3B3E000, v12, OS_LOG_TYPE_DEFAULT, "Loaded typical day model", v14, 2u);
  }
  v13 = [v5 currentActivitySummaryHelper];

  [v13 addObserver:self];
  [(FCTypicalDayProvider *)self _onqueue_registerForSignificantTimeChanges];
}

- (void)_onqueue_registerForSignificantTimeChanges
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  objc_initWeak(&location, self);
  v3 = (const char *)[@"SignificantTimeChangeNotification" UTF8String];
  v4 = MEMORY[0x1E4F14428];
  id v5 = MEMORY[0x1E4F14428];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __66__FCTypicalDayProvider__onqueue_registerForSignificantTimeChanges__block_invoke;
  id v10 = &unk_1E69B86A8;
  objc_copyWeak(&v11, &location);
  notify_register_dispatch(v3, &self->_significantTimeChangeToken, v4, &v7);

  id v6 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v7, v8, v9, v10);
  [v6 addObserver:self selector:sel__significantTimeChangeOccurred_ name:*MEMORY[0x1E4F1C2E0] object:0];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __66__FCTypicalDayProvider__onqueue_registerForSignificantTimeChanges__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _significantTimeChangeOccurred:0];
}

- (void)_significantTimeChangeOccurred:(id)a3
{
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3B3E000, v4, OS_LOG_TYPE_DEFAULT, "Significant time change occurred", buf, 2u);
  }
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__FCTypicalDayProvider__significantTimeChangeOccurred___block_invoke;
  block[3] = &unk_1E69B8500;
  block[4] = self;
  dispatch_async(serviceQueue, block);
}

uint64_t __55__FCTypicalDayProvider__significantTimeChangeOccurred___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_rebuildTypicalDayModelForced:", 0);
}

- (void)_onqueue_rebuildTypicalDayModelForced:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  id v5 = [(FCCDateProvider *)self->_dateProvider coachingDate];
  if (a3) {
    goto LABEL_7;
  }
  if (self->_lastRebuildDate)
  {
    id v6 = [(FCCDateProvider *)self->_dateProvider coachingCalendar];
    int v7 = [v6 isDate:v5 inSameDayAsDate:self->_lastRebuildDate];

    if (v7)
    {
      _HKInitializeLogging();
      uint64_t v8 = *MEMORY[0x1E4F29F08];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        id v9 = "Already rebuilt the typical day model today";
LABEL_13:
        _os_log_impl(&dword_1D3B3E000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, 2u);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v11 = [WeakRetained database];
  char v12 = [v11 isProtectedDataAvailable];

  if (v12)
  {
LABEL_7:
    v13 = [(FCTypicalDayProvider *)self _typicalDayIntervalFromToday];
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      objc_super v16 = v13;
      _os_log_impl(&dword_1D3B3E000, v14, OS_LOG_TYPE_DEFAULT, "Rebuilding typical day model with interval: %@", (uint8_t *)&v15, 0xCu);
    }
    [(FITypicalDayActivityModel *)self->_typicalDayModel rebuildWithInterval:v13];

    goto LABEL_10;
  }
  _HKInitializeLogging();
  uint64_t v8 = *MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    id v9 = "Waiting for protected to be available before rebuilding typical day model";
    goto LABEL_13;
  }
LABEL_10:
}

- (void)_onqueue_handleUpdatedActivitySummary:(id)a3
{
  objc_storeStrong((id *)&self->_currentActivitySummary, a3);
  id v5 = a3;
  [(FITypicalDayActivityModel *)self->_typicalDayModel handleUpdatedCurrentActivitySummary:v5];
}

- (id)_typicalDayIntervalFromToday
{
  v3 = [(FCCDateProvider *)self->_dateProvider coachingCalendar];
  v4 = [(FCCDateProvider *)self->_dateProvider coachingDate];
  id v5 = [v3 startOfDayForDate:v4];

  id v6 = objc_msgSend(v3, "hk_startOfDateBySubtractingDays:fromDate:", *MEMORY[0x1E4F61C30], v5);
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v6 endDate:v5];

  return v7;
}

- (id)currentDate
{
  return (id)[(FCCDateProvider *)self->_dateProvider coachingDate];
}

- (id)currentCalendar
{
  return (id)[(FCCDateProvider *)self->_dateProvider coachingCalendar];
}

- (id)firstOnWristDateToday
{
  return 0;
}

- (BOOL)enumerateActivitySummariesFromDateComponents:(id)a3 toDateComponents:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10 = a6;
  id v11 = (objc_class *)MEMORY[0x1E4F65A70];
  id v12 = a4;
  id v13 = a3;
  id v14 = [v11 alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_super v16 = (void *)[v14 initWithProfile:WeakRetained];

  [v16 setShouldIncludePrivateProperties:1];
  [v16 setShouldIncludeStatistics:1];
  uint64_t v17 = HDActivityCacheEntityPredicateForCachesInDateComponentsRange();

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __100__FCTypicalDayProvider_enumerateActivitySummariesFromDateComponents_toDateComponents_error_handler___block_invoke;
  v20[3] = &unk_1E69B86D0;
  id v21 = v10;
  id v18 = v10;
  LOBYTE(a5) = [v16 enumerateActivitySummariesWithPredicate:v17 error:a5 handler:v20];

  return (char)a5;
}

uint64_t __100__FCTypicalDayProvider_enumerateActivitySummariesFromDateComponents_toDateComponents_error_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)clientProvidedUserStartOfDay
{
  return self->_userStartOfDay;
}

- (id)clientProvidedUserEndOfDay
{
  return self->_userEndOfDay;
}

- (id)onServiceQueue_currentActivityCacheSummary
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  currentActivitySummary = self->_currentActivitySummary;
  return currentActivitySummary;
}

- (void)currentActivitySummaryHelper:(id)a3 didUpdateTodayActivitySummary:(id)a4 changedFields:(unint64_t)a5
{
  id v6 = a4;
  objc_initWeak(&location, self);
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__FCTypicalDayProvider_currentActivitySummaryHelper_didUpdateTodayActivitySummary_changedFields___block_invoke;
  block[3] = &unk_1E69B86F8;
  objc_copyWeak(&v11, &location);
  id v10 = v6;
  id v8 = v6;
  dispatch_async(serviceQueue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __97__FCTypicalDayProvider_currentActivitySummaryHelper_didUpdateTodayActivitySummary_changedFields___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_onqueue_handleUpdatedActivitySummary:", *(void *)(a1 + 32));
}

- (void)currentActivitySummaryHelper:(id)a3 didUpdateYesterdayActivitySummary:(id)a4 changedFields:(unint64_t)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    _HKInitializeLogging();
    int v7 = *MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v11 = a5;
      _os_log_impl(&dword_1D3B3E000, v7, OS_LOG_TYPE_DEFAULT, "Yesterday summary changed, rebuilding typical day model (changed fields = %lu", buf, 0xCu);
    }
    serviceQueue = self->_serviceQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __101__FCTypicalDayProvider_currentActivitySummaryHelper_didUpdateYesterdayActivitySummary_changedFields___block_invoke;
    block[3] = &unk_1E69B8500;
    void block[4] = self;
    dispatch_async(serviceQueue, block);
  }
}

uint64_t __101__FCTypicalDayProvider_currentActivitySummaryHelper_didUpdateYesterdayActivitySummary_changedFields___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_rebuildTypicalDayModelForced:", 1);
}

- (FITypicalDayActivityModel)typicalDayModel
{
  return self->_typicalDayModel;
}

- (NSDate)userStartOfDay
{
  return self->_userStartOfDay;
}

- (void)setUserStartOfDay:(id)a3
{
}

- (NSDate)userEndOfDay
{
  return self->_userEndOfDay;
}

- (void)setUserEndOfDay:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userEndOfDay, 0);
  objc_storeStrong((id *)&self->_userStartOfDay, 0);
  objc_storeStrong((id *)&self->_typicalDayModel, 0);
  objc_storeStrong((id *)&self->_currentActivitySummary, 0);
  objc_storeStrong((id *)&self->_lastRebuildDate, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_dateProvider, 0);
}

@end