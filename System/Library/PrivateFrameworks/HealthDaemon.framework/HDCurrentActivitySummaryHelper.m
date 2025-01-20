@interface HDCurrentActivitySummaryHelper
- (BOOL)hasLoadedActivitySummaries;
- (HDCurrentActivitySummaryHelper)initWithProfile:(id)a3;
- (HKActivitySummary)todayActivitySummary;
- (HKActivitySummary)yesterdayActivitySummary;
- (NSDate)dateOverride;
- (NSTimeZone)timezoneOverride;
- (id)_createEmptyActivitySummaryForIndex:(uint64_t)a1;
- (uint64_t)_changedFieldsBetweenPreviousActivitySummary:(void *)a1 andNewActivitySummary:(void *)a2;
- (void)_generateCacheIndexesWithTodayIndex:(uint64_t *)a3 yesterdayIndex:;
- (void)_handleSignificantTimeChangeNotification:(id)a3;
- (void)_queue_alertObserversTodaySummaryUpdatedWithChangedFields:(uint64_t)a1;
- (void)_queue_alertObserversYesterdaySummaryUpdatedWithChangedFields:(uint64_t)a1;
- (void)_queue_didUpdateObservers;
- (void)_queue_setUpActivityQueryHelperOnlyIfUninitialized:(uint64_t)a1;
- (void)_queue_updateTodayActivitySummary:(uint64_t)a1;
- (void)_queue_updateYesterdayActivitySummary:(uint64_t)a1;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setDateOverride:(id)a3;
- (void)setTimezoneOverride:(id)a3;
@end

@implementation HDCurrentActivitySummaryHelper

- (void)addObserver:(id)a3
{
  id v4 = a3;
  [(HKObserverSet *)self->_observers registerObserver:v4];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__HDCurrentActivitySummaryHelper_addObserver___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __46__HDCurrentActivitySummaryHelper_addObserver___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 64))
  {
    v3 = (void *)[*(id *)(v2 + 48) copy];
    id v4 = (void *)[*(id *)(*(void *)(a1 + 32) + 56) copy];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v7 = *(void **)(v5 + 80);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__HDCurrentActivitySummaryHelper_addObserver___block_invoke_2;
    v10[3] = &unk_1E62FFA90;
    v10[4] = v5;
    id v11 = v3;
    id v12 = v4;
    id v8 = v4;
    id v9 = v3;
    [v7 notifyObserver:v6 handler:v10];

    uint64_t v2 = *(void *)(a1 + 32);
  }
  -[HDCurrentActivitySummaryHelper _queue_didUpdateObservers](v2);
}

- (void)removeObserver:(id)a3
{
  [(HKObserverSet *)self->_observers unregisterObserver:a3];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__HDCurrentActivitySummaryHelper_removeObserver___block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_async(queue, block);
}

void __49__HDCurrentActivitySummaryHelper_removeObserver___block_invoke(uint64_t a1)
{
}

- (void)_queue_updateTodayActivitySummary:(uint64_t)a1
{
  id v5 = a2;
  uint64_t v4 = -[HDCurrentActivitySummaryHelper _changedFieldsBetweenPreviousActivitySummary:andNewActivitySummary:](*(void **)(a1 + 48), v5);
  objc_storeStrong((id *)(a1 + 48), a2);
  -[HDCurrentActivitySummaryHelper _queue_alertObserversTodaySummaryUpdatedWithChangedFields:](a1, v4);
}

- (uint64_t)_changedFieldsBetweenPreviousActivitySummary:(void *)a1 andNewActivitySummary:(void *)a2
{
  id v3 = a2;
  id v4 = a1;
  id v5 = [v4 activeEnergyBurnedGoal];
  uint64_t v6 = [v3 activeEnergyBurnedGoal];
  int v48 = [v5 isEqual:v6];

  v7 = [v4 activeEnergyBurned];
  id v8 = [v3 activeEnergyBurned];
  int v47 = [v7 isEqual:v8];

  id v9 = [v4 appleMoveTimeGoal];
  v10 = [v3 appleMoveTimeGoal];
  int v46 = [v9 isEqual:v10];

  id v11 = [v4 appleMoveTime];
  id v12 = [v3 appleMoveTime];
  int v45 = [v11 isEqual:v12];

  v13 = [v4 exerciseTimeGoal];
  v14 = [v3 exerciseTimeGoal];
  int v44 = [v13 isEqual:v14];

  v15 = [v4 appleExerciseTime];
  v16 = [v3 appleExerciseTime];
  int v43 = [v15 isEqual:v16];

  v17 = [v4 standHoursGoal];
  v18 = [v3 standHoursGoal];
  int v42 = [v17 isEqual:v18];

  v19 = [v4 appleStandHours];
  v20 = [v3 appleStandHours];
  int v41 = [v19 isEqual:v20];

  v21 = [v4 stepCount];
  v22 = [v3 stepCount];
  int v40 = [v21 isEqual:v22];

  v23 = [v4 _deepBreathingDuration];
  v24 = [v3 _deepBreathingDuration];
  int v25 = [v23 isEqual:v24];

  v26 = [v4 _pushCount];
  v27 = [v3 _pushCount];
  int v28 = [v26 isEqual:v27];

  v29 = [v4 _flightsClimbed];
  v30 = [v3 _flightsClimbed];
  int v31 = [v29 isEqual:v30];

  uint64_t v32 = [v4 _wheelchairUse];
  uint64_t v33 = [v3 _wheelchairUse];
  uint64_t v34 = [v4 activityMoveMode];
  uint64_t v35 = [v3 activityMoveMode];
  int v36 = [v4 isPaused];

  int v37 = [v3 isPaused];
  uint64_t v38 = 16;
  if (v48) {
    uint64_t v38 = 0;
  }
  if (!v47) {
    v38 |= 2uLL;
  }
  if (!v46) {
    v38 |= 0x8000uLL;
  }
  if (!v45) {
    v38 |= 0x4000uLL;
  }
  if (!v44) {
    v38 |= 0x20uLL;
  }
  if (!v43) {
    v38 |= 4uLL;
  }
  if (!v42) {
    v38 |= 0x40uLL;
  }
  if (!v41) {
    v38 |= 8uLL;
  }
  if (!v40) {
    v38 |= 0x80uLL;
  }
  if (!v25) {
    v38 |= 0x400uLL;
  }
  if (!v28) {
    v38 |= 0x800uLL;
  }
  if (!v31) {
    v38 |= 0x1000uLL;
  }
  if (v32 != v33) {
    v38 |= 0x2000uLL;
  }
  if (v34 != v35) {
    v38 |= 0x10000uLL;
  }
  if (v36 != v37) {
    return v38 | 0x20000;
  }
  else {
    return v38;
  }
}

- (void)_generateCacheIndexesWithTodayIndex:(uint64_t *)a3 yesterdayIndex:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v6 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    v7 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
    [v6 setTimeZone:v7];

    if (*(void *)(a1 + 96)) {
      objc_msgSend(v6, "setTimeZone:");
    }
    id v8 = *(void **)(a1 + 88);
    if (v8)
    {
      id v9 = v8;
    }
    else
    {
      id v9 = [MEMORY[0x1E4F1C9C8] date];
    }
    v10 = v9;
    id v11 = [v6 dateByAddingUnit:16 value:-1 toDate:v9 options:0];
    _HKInitializeLogging();
    id v12 = *MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_INFO))
    {
      int v17 = 138412802;
      uint64_t v18 = a1;
      __int16 v19 = 2112;
      v20 = v10;
      __int16 v21 = 2112;
      v22 = v11;
      _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_INFO, "%@: Generating cache indices for today: %@, yesterday: %@", (uint8_t *)&v17, 0x20u);
    }
    v13 = objc_msgSend(v6, "hk_activitySummaryDateComponentsFromDate:", v10);
    v14 = objc_msgSend(v6, "hk_activitySummaryDateComponentsFromDate:", v11);
    uint64_t v15 = _HKCacheIndexFromDateComponents();
    uint64_t v16 = _HKCacheIndexFromDateComponents();
    if (a2) {
      *a2 = v15;
    }
    if (a3) {
      *a3 = v16;
    }
  }
}

- (HKActivitySummary)todayActivitySummary
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__87;
  v10 = __Block_byref_object_dispose__87;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__HDCurrentActivitySummaryHelper_todayActivitySummary__block_invoke;
  v5[3] = &unk_1E62F3230;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (HKActivitySummary *)v3;
}

void __54__HDCurrentActivitySummaryHelper_todayActivitySummary__block_invoke(uint64_t a1)
{
}

- (HKActivitySummary)yesterdayActivitySummary
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__87;
  v10 = __Block_byref_object_dispose__87;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__HDCurrentActivitySummaryHelper_yesterdayActivitySummary__block_invoke;
  v5[3] = &unk_1E62F3230;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (HKActivitySummary *)v3;
}

void __58__HDCurrentActivitySummaryHelper_yesterdayActivitySummary__block_invoke(uint64_t a1)
{
}

- (void)_queue_updateYesterdayActivitySummary:(uint64_t)a1
{
  id v5 = a2;
  uint64_t v4 = -[HDCurrentActivitySummaryHelper _changedFieldsBetweenPreviousActivitySummary:andNewActivitySummary:](*(void **)(a1 + 56), v5);
  objc_storeStrong((id *)(a1 + 56), a2);
  -[HDCurrentActivitySummaryHelper _queue_alertObserversYesterdaySummaryUpdatedWithChangedFields:](a1, v4);
}

- (BOOL)hasLoadedActivitySummaries
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__HDCurrentActivitySummaryHelper_hasLoadedActivitySummaries__block_invoke;
  v5[3] = &unk_1E62F3230;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __60__HDCurrentActivitySummaryHelper_hasLoadedActivitySummaries__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 64);
  return result;
}

- (HDCurrentActivitySummaryHelper)initWithProfile:(id)a3
{
  v26[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HDCurrentActivitySummaryHelper;
  id v5 = [(HDCurrentActivitySummaryHelper *)&v25 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    _HKInitializeLogging();
    id v9 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    uint64_t v12 = [v9 initWithName:v11 loggingCategory:*MEMORY[0x1E4F29F90]];
    observers = v6->_observers;
    v6->_observers = (HKObserverSet *)v12;

    v14 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A5C0]];
    v26[0] = v14;
    uint64_t v15 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A5D0]];
    v26[1] = v15;
    uint64_t v16 = [MEMORY[0x1E4F2B2C0] categoryTypeForIdentifier:*MEMORY[0x1E4F29770]];
    v26[2] = v16;
    int v17 = [MEMORY[0x1E4F2B2C0] briskMinuteDataType];
    v26[3] = v17;
    uint64_t v18 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8F0]];
    v26[4] = v18;
    __int16 v19 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7E0]];
    v26[5] = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:6];
    typesForDataCollection = v6->_typesForDataCollection;
    v6->_typesForDataCollection = (NSArray *)v20;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)_significantTimeChange, @"SignificantTimeChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    uint64_t v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 addObserver:v6 selector:sel__handleSignificantTimeChangeNotification_ name:*MEMORY[0x1E4F1C2E0] object:0];
  }
  return v6;
}

- (void)dealloc
{
  char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SignificantTimeChangeNotification", 0);
  v5.receiver = self;
  v5.super_class = (Class)HDCurrentActivitySummaryHelper;
  [(HDCurrentActivitySummaryHelper *)&v5 dealloc];
}

- (void)setDateOverride:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__HDCurrentActivitySummaryHelper_setDateOverride___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __50__HDCurrentActivitySummaryHelper_setDateOverride___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _handleSignificantTimeChangeNotification:0];
}

- (NSDate)dateOverride
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__87;
  v10 = __Block_byref_object_dispose__87;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__HDCurrentActivitySummaryHelper_dateOverride__block_invoke;
  v5[3] = &unk_1E62F3230;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __46__HDCurrentActivitySummaryHelper_dateOverride__block_invoke(uint64_t a1)
{
}

- (void)setTimezoneOverride:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__HDCurrentActivitySummaryHelper_setTimezoneOverride___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __54__HDCurrentActivitySummaryHelper_setTimezoneOverride___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _handleSignificantTimeChangeNotification:0];
}

- (NSTimeZone)timezoneOverride
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__87;
  v10 = __Block_byref_object_dispose__87;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__HDCurrentActivitySummaryHelper_timezoneOverride__block_invoke;
  v5[3] = &unk_1E62F3230;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSTimeZone *)v3;
}

void __50__HDCurrentActivitySummaryHelper_timezoneOverride__block_invoke(uint64_t a1)
{
}

- (void)_queue_setUpActivityQueryHelperOnlyIfUninitialized:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a1 && (!a2 || !*(void *)(a1 + 16)))
  {
    -[HDCurrentActivitySummaryHelper _generateCacheIndexesWithTodayIndex:yesterdayIndex:](a1, (uint64_t *)(a1 + 32), (uint64_t *)(a1 + 40));
    _HKInitializeLogging();
    id v3 = *MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v25 = a1;
      __int16 v26 = 2048;
      uint64_t v27 = v4;
      __int16 v28 = 2048;
      uint64_t v29 = v5;
      _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting up new query helper with indices today: (%ld) and yesterday: (%ld)", buf, 0x20u);
    }
    uint64_t v6 = [MEMORY[0x1E4F2B830] filterWithOperatorType:4 cacheIndex:*(void *)(a1 + 32)];
    uint64_t v7 = [MEMORY[0x1E4F2B830] filterWithOperatorType:4 cacheIndex:*(void *)(a1 + 40)];
    uint64_t v8 = (void *)MEMORY[0x1E4F2B878];
    v23[0] = v6;
    v23[1] = v7;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    v10 = [v8 orFilterWithSubfilters:v9];

    objc_initWeak((id *)buf, (id)a1);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    __int16 v19 = __85__HDCurrentActivitySummaryHelper__queue_setUpActivityQueryHelperOnlyIfUninitialized___block_invoke;
    uint64_t v20 = &unk_1E62F6158;
    objc_copyWeak(&v22, (id *)buf);
    uint64_t v21 = a1;
    id v11 = _Block_copy(&v17);
    *(unsigned char *)(a1 + 64) = 0;
    objc_msgSend(*(id *)(a1 + 16), "stop", v17, v18, v19, v20);
    uint64_t v12 = [HDActivitySummaryQueryHelper alloc];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    uint64_t v14 = [(HDActivitySummaryQueryHelper *)v12 initWithProfile:WeakRetained filter:v10 batchedInitialResultsHandler:v11 batchedUpdateHandler:v11];
    uint64_t v16 = *(void **)(a1 + 16);
    uint64_t v15 = (id *)(a1 + 16);
    id *v15 = (id)v14;

    [*v15 start];
    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
}

void __85__HDCurrentActivitySummaryHelper__queue_setUpActivityQueryHelperOnlyIfUninitialized___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    id v11 = WeakRetained[3];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __85__HDCurrentActivitySummaryHelper__queue_setUpActivityQueryHelperOnlyIfUninitialized___block_invoke_2;
    v14[3] = &unk_1E62F6A40;
    id v15 = v8;
    uint64_t v16 = v10;
    id v12 = v7;
    uint64_t v13 = *(void *)(a1 + 32);
    id v17 = v12;
    uint64_t v18 = v13;
    dispatch_async(v11, v14);
  }
}

void __85__HDCurrentActivitySummaryHelper__queue_setUpActivityQueryHelperOnlyIfUninitialized___block_invoke_2(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    _HKInitializeLogging();
    uint64_t v2 = *MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = *(void *)(a1 + 56);
      uint64_t v20 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v19;
      __int16 v27 = 2114;
      uint64_t v28 = v20;
      _os_log_error_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_ERROR, "%{public}@: Error occurred, resetting query helper: %{public}@", buf, 0x16u);
    }
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3)
    {
      [*(id *)(v3 + 16) stop];
      uint64_t v4 = *(void **)(v3 + 16);
      *(void *)(v3 + 16) = 0;
    }
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(id *)(a1 + 48);
    id v7 = v6;
    if (v5)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:buf count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v22;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v22 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * v12);
            uint64_t v14 = (void *)MEMORY[0x1C187C0E0](v9);
            id v15 = objc_msgSend(v13, "_gregorianDateComponents", (void)v21);
            uint64_t v16 = _HKCacheIndexFromDateComponents();

            if (v16 == *(void *)(v5 + 32))
            {
              -[HDCurrentActivitySummaryHelper _queue_updateTodayActivitySummary:](v5, v13);
            }
            else if (v16 == *(void *)(v5 + 40))
            {
              -[HDCurrentActivitySummaryHelper _queue_updateYesterdayActivitySummary:](v5, v13);
            }
            ++v12;
          }
          while (v10 != v12);
          uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:buf count:16];
          uint64_t v10 = v9;
        }
        while (v9);
      }

      if (!*(unsigned char *)(v5 + 64) && ![v8 count])
      {
        id v17 = -[HDCurrentActivitySummaryHelper _createEmptyActivitySummaryForIndex:](v5, *(void *)(v5 + 32));
        -[HDCurrentActivitySummaryHelper _queue_updateTodayActivitySummary:](v5, v17);

        uint64_t v18 = -[HDCurrentActivitySummaryHelper _createEmptyActivitySummaryForIndex:](v5, *(void *)(v5 + 40));
        -[HDCurrentActivitySummaryHelper _queue_updateYesterdayActivitySummary:](v5, v18);
      }
      *(unsigned char *)(v5 + 64) = 1;
    }
  }
}

- (id)_createEmptyActivitySummaryForIndex:(uint64_t)a1
{
  if (a1)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F2ABA8]);
    [v3 _setActivitySummaryIndex:a2];
    [v3 _setDataLoading:1];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)_queue_alertObserversTodaySummaryUpdatedWithChangedFields:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = (void *)[*(id *)(a1 + 48) copy];
    uint64_t v5 = *(void **)(a1 + 80);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __92__HDCurrentActivitySummaryHelper__queue_alertObserversTodaySummaryUpdatedWithChangedFields___block_invoke;
    v7[3] = &unk_1E62FFA68;
    v7[4] = a1;
    id v8 = v4;
    uint64_t v9 = a2;
    id v6 = v4;
    [v5 notifyObservers:v7];
  }
}

- (void)_queue_alertObserversYesterdaySummaryUpdatedWithChangedFields:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = (void *)[*(id *)(a1 + 56) copy];
    uint64_t v5 = *(void **)(a1 + 80);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __96__HDCurrentActivitySummaryHelper__queue_alertObserversYesterdaySummaryUpdatedWithChangedFields___block_invoke;
    v7[3] = &unk_1E62FFA68;
    v7[4] = a1;
    id v8 = v4;
    uint64_t v9 = a2;
    id v6 = v4;
    [v5 notifyObservers:v7];
  }
}

uint64_t __92__HDCurrentActivitySummaryHelper__queue_alertObserversTodaySummaryUpdatedWithChangedFields___block_invoke(void *a1, void *a2)
{
  return [a2 currentActivitySummaryHelper:a1[4] didUpdateTodayActivitySummary:a1[5] changedFields:a1[6]];
}

uint64_t __96__HDCurrentActivitySummaryHelper__queue_alertObserversYesterdaySummaryUpdatedWithChangedFields___block_invoke(void *a1, void *a2)
{
  return [a2 currentActivitySummaryHelper:a1[4] didUpdateYesterdayActivitySummary:a1[5] changedFields:a1[6]];
}

- (void)_queue_didUpdateObservers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if ([*(id *)(a1 + 80) count])
    {
      if (*(void *)(a1 + 16)) {
        return;
      }
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      id v3 = [WeakRetained database];
      uint64_t v4 = *(void *)(a1 + 24);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __59__HDCurrentActivitySummaryHelper__queue_didUpdateObservers__block_invoke;
      v14[3] = &unk_1E62F3208;
      void v14[4] = a1;
      [v3 performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:v4 block:v14];
    }
    else
    {
      id v5 = objc_loadWeakRetained((id *)(a1 + 8));
      id WeakRetained = [v5 dataCollectionManager];

      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v3 = *(id *)(a1 + 72);
      uint64_t v6 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v3);
            }
            objc_msgSend(WeakRetained, "stopDataCollectionForType:observer:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), a1, (void)v10);
          }
          while (v7 != v9);
          uint64_t v7 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
        }
        while (v7);
      }
    }
  }
}

void __59__HDCurrentActivitySummaryHelper__queue_didUpdateObservers__block_invoke(uint64_t a1)
{
}

void __46__HDCurrentActivitySummaryHelper_addObserver___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  id v5 = a2;
  [v5 currentActivitySummaryHelper:v3 didUpdateTodayActivitySummary:v4 changedFields:-1];
  [v5 currentActivitySummaryHelper:a1[4] didUpdateYesterdayActivitySummary:a1[6] changedFields:-1];
}

- (void)_handleSignificantTimeChangeNotification:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__HDCurrentActivitySummaryHelper__handleSignificantTimeChangeNotification___block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_async(queue, block);
}

void __75__HDCurrentActivitySummaryHelper__handleSignificantTimeChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 16))
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x1E4F29F90];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v9;
    uint64_t v8 = "%{public}@: Significant time change occurred, query helper has not been set up yet";
    goto LABEL_7;
  }
  *(void *)buf = 0;
  -[HDCurrentActivitySummaryHelper _generateCacheIndexesWithTodayIndex:yesterdayIndex:](v2, (uint64_t *)buf, 0);
  uint64_t v3 = *(void *)buf;
  uint64_t v4 = *(void *)(v2 + 32);
  _HKInitializeLogging();
  id v5 = *MEMORY[0x1E4F29F90];
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEFAULT);
  if (v3 == v4)
  {
    if (!v6) {
      return;
    }
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v7;
    uint64_t v8 = "%{public}@: Significant time change occurred, no date change";
LABEL_7:
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
    return;
  }
  if (v6)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v10;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Significant time change occurred, date change occurred. Re-querying", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  long long v12 = [WeakRetained database];
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void *)(v13 + 24);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__HDCurrentActivitySummaryHelper__handleSignificantTimeChangeNotification___block_invoke_295;
  v15[3] = &unk_1E62F3208;
  v15[4] = v13;
  [v12 performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:v14 block:v15];
}

void __75__HDCurrentActivitySummaryHelper__handleSignificantTimeChangeNotification___block_invoke_295(uint64_t a1)
{
  -[HDCurrentActivitySummaryHelper _queue_setUpActivityQueryHelperOnlyIfUninitialized:](*(void *)(a1 + 32), 0);
  uint64_t v2 = -[HDCurrentActivitySummaryHelper _createEmptyActivitySummaryForIndex:](*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 32));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v2;

  uint64_t v5 = -[HDCurrentActivitySummaryHelper _createEmptyActivitySummaryForIndex:](*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 40));
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v5;

  -[HDCurrentActivitySummaryHelper _queue_alertObserversTodaySummaryUpdatedWithChangedFields:](*(void *)(a1 + 32), -1);
  uint64_t v8 = *(void *)(a1 + 32);

  -[HDCurrentActivitySummaryHelper _queue_alertObserversYesterdaySummaryUpdatedWithChangedFields:](v8, -1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timezoneOverride, 0);
  objc_storeStrong((id *)&self->_dateOverride, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_typesForDataCollection, 0);
  objc_storeStrong((id *)&self->_yesterdaySummary, 0);
  objc_storeStrong((id *)&self->_todaySummary, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_queryHelper, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end