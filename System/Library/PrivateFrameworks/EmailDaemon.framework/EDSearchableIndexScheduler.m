@interface EDSearchableIndexScheduler
+ (BOOL)isDeferrableActivityType:(id)a3;
+ (BOOL)isTurboModeIndexingEnabled;
+ (NSSet)deferrableActivityTypes;
+ (OS_os_log)log;
+ (id)activityTypes;
+ (id)budgetTimeUserDefaultsKeyForIndexName:(id)a3;
+ (id)taskTypes;
- (BOOL)hasAvailableIndexingBudgetForSearchableIndexSchedulable:(id)a3;
- (BOOL)isDataSourceIndexingPermitted;
- (BOOL)isIndexingEnabledForActivityType:(id)a3;
- (BOOL)isIndexingEnabledForTaskType:(id)a3;
- (BOOL)isScheduling;
- (BOOL)scheduledDeferralCheck;
- (EDSearchableIndexBudgetConfiguration)budgetConfiguration;
- (EDSearchableIndexSchedulable)schedulable;
- (EDSearchableIndexScheduler)initWithSchedulable:(id)a3 budgetConfiguration:(id)a4;
- (EDSearchableIndexSchedulerState)state;
- (NSMutableDictionary)activities;
- (NSMutableDictionary)tasks;
- (NSString)budgetTimeUserDefaultsKey;
- (OS_dispatch_queue)indexingStateQueue;
- (double)_budgetTimeFromUserDefaults;
- (double)budgetedTimeRemaining;
- (double)maintenanceIndexingTime;
- (double)otherIndexingTime;
- (id)_xpcActivityIdentifierForActivityType:(id)a3;
- (id)_xpcCriteriaBuilderBlockForActivityType:(id)a3;
- (int64_t)budgetedItemCountRemaining;
- (void)_beginIndexingForTaskType:(id)a3 task:(id)a4;
- (void)_deferActivitiesIfNecessary;
- (void)_disableIndexingForActivityType:(id)a3 defer:(BOOL)a4;
- (void)_disableIndexingForTaskType:(id)a3;
- (void)_enableIndexingForActivityType:(id)a3;
- (void)_enableIndexingForTaskType:(id)a3;
- (void)_logIndexingPowerEventWithIdentifier:(id)a3 additionalEventData:(id)a4 usePersistentLog:(BOOL)a5;
- (void)_periodicallyCheckForDeferralIfNecessary;
- (void)_registerActivityForType:(id)a3 builder:(id)a4 runner:(id)a5;
- (void)_saveBudgetTimeToUserDefaults:(double)a3;
- (void)_startScheduling;
- (void)_stopAllIndexingBacklogComplete:(BOOL)a3;
- (void)_stopIndexingForActivityType:(id)a3 shouldDeferIfPossible:(BOOL)a4;
- (void)_stopIndexingForTaskType:(id)a3 requestRetry:(BOOL)a4 backlogComplete:(BOOL)a5;
- (void)_stopScheduling;
- (void)beginIndexingForActivityType:(id)a3 activity:(id)a4;
- (void)dealloc;
- (void)deferIndexingForActivityType:(id)a3;
- (void)indexingDidFinishForSearchableIndexSchedulable:(id)a3 backlogComplete:(BOOL)a4;
- (void)indexingDidResumeForSearchableIndexSchedulable:(id)a3;
- (void)indexingDidSuspendForSearchableIndexSchedulable:(id)a3;
- (void)searchableIndexSchedulable:(id)a3 didGenerateImportantPowerEventWithIdentifier:(id)a4 eventData:(id)a5;
- (void)searchableIndexSchedulable:(id)a3 didGeneratePowerEventWithIdentifier:(id)a4 eventData:(id)a5;
- (void)searchableIndexSchedulable:(id)a3 didIndexForTime:(double)a4;
- (void)searchableIndexSchedulable:(id)a3 didIndexItemCount:(int64_t)a4 lastItemDateReceived:(id)a5;
- (void)setActivities:(id)a3;
- (void)setBudgetTimeUserDefaultsKey:(id)a3;
- (void)setIndexingStateQueue:(id)a3;
- (void)setScheduledDeferralCheck:(BOOL)a3;
- (void)setScheduling:(BOOL)a3;
- (void)setState:(id)a3;
- (void)setTasks:(id)a3;
@end

@implementation EDSearchableIndexScheduler

- (void)searchableIndexSchedulable:(id)a3 didIndexForTime:(double)a4
{
  v6 = [(EDSearchableIndexScheduler *)self indexingStateQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__EDSearchableIndexScheduler_searchableIndexSchedulable_didIndexForTime___block_invoke;
  v7[3] = &unk_1E6BFFA50;
  v7[4] = self;
  *(double *)&v7[5] = a4;
  dispatch_async(v6, v7);
}

void __86__EDSearchableIndexScheduler_hasAvailableIndexingBudgetForSearchableIndexSchedulable___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _deferActivitiesIfNecessary];
  id v4 = [*(id *)(a1 + 32) budgetConfiguration];
  if ([v4 allowBacklogIndexingOnPower])
  {
    v2 = [*(id *)(a1 + 32) schedulable];
    char v3 = [v2 isPluggedIn];
  }
  else
  {
    char v3 = 0;
  }

  if (*(unsigned char *)(a1 + 48))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) state];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 hasAvailableIndexingBudget] | v3;
  }
}

- (EDSearchableIndexBudgetConfiguration)budgetConfiguration
{
  return self->_budgetConfiguration;
}

uint64_t __73__EDSearchableIndexScheduler_searchableIndexSchedulable_didIndexForTime___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) state];
  [v2 didIndexForTime:*(double *)(a1 + 40)];

  char v3 = [*(id *)(a1 + 32) state];
  int v4 = [v3 needsToStopBudgetedIndexing];

  if (v4)
  {
    [*(id *)(a1 + 32) _logIndexingPowerEventWithIdentifier:@"Indexing budget exhausted." additionalEventData:0 usePersistentLog:1];
    [*(id *)(a1 + 32) _stopIndexingForActivityType:@"budgeted" shouldDeferIfPossible:0];
    id v5 = [*(id *)(a1 + 32) budgetConfiguration];
    [v5 time];
    double v7 = v6;
    v8 = [*(id *)(a1 + 32) state];
    [v8 setBudgetedTimeRemaining:v7];
  }
  v9 = *(void **)(a1 + 32);
  v10 = [v9 state];
  [v10 budgetedTimeRemaining];
  objc_msgSend(v9, "_saveBudgetTimeToUserDefaults:");

  v11 = *(void **)(a1 + 32);

  return [v11 _deferActivitiesIfNecessary];
}

- (EDSearchableIndexSchedulerState)state
{
  return self->_state;
}

- (void)_saveBudgetTimeToUserDefaults:(double)a3
{
  id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v5 = [(EDSearchableIndexScheduler *)self budgetTimeUserDefaultsKey];
  [v6 setDouble:v5 forKey:a3];
}

- (NSString)budgetTimeUserDefaultsKey
{
  return self->_budgetTimeUserDefaultsKey;
}

- (BOOL)hasAvailableIndexingBudgetForSearchableIndexSchedulable:(id)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = -86;
  char v4 = [(id)objc_opt_class() isTurboModeIndexingEnabled];
  id v5 = [(EDSearchableIndexScheduler *)self indexingStateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__EDSearchableIndexScheduler_hasAvailableIndexingBudgetForSearchableIndexSchedulable___block_invoke;
  block[3] = &unk_1E6C05CE0;
  block[4] = self;
  block[5] = &v9;
  char v8 = v4;
  dispatch_sync(v5, block);

  LOBYTE(self) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)self;
}

- (void)_deferActivitiesIfNecessary
{
  char v3 = [(EDSearchableIndexScheduler *)self indexingStateQueue];
  dispatch_assert_queue_V2(v3);

  activities = self->_activities;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__EDSearchableIndexScheduler__deferActivitiesIfNecessary__block_invoke;
  v5[3] = &unk_1E6C05CB8;
  v5[4] = self;
  [(NSMutableDictionary *)activities enumerateKeysAndObjectsUsingBlock:v5];
}

- (OS_dispatch_queue)indexingStateQueue
{
  return self->_indexingStateQueue;
}

+ (BOOL)isTurboModeIndexingEnabled
{
  return [MEMORY[0x1E4F602E0] preferenceEnabled:27];
}

- (void)_logIndexingPowerEventWithIdentifier:(id)a3 additionalEventData:(id)a4 usePersistentLog:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [(EDSearchableIndexScheduler *)self state];
  uint64_t v11 = [v10 powerEventData];
  char v12 = (void *)[v11 mutableCopy];

  if ([v9 count]) {
    [v12 addEntriesFromDictionary:v9];
  }
  if (v5)
  {
    v13 = +[EDSearchableIndexScheduler log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543618;
      id v17 = v8;
      __int16 v18 = 2114;
      v19 = v12;
      v14 = v13;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
LABEL_8:
      _os_log_impl(&dword_1DB39C000, v14, v15, "%{public}@ : %{public}@", (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    v13 = +[EDSearchableIndexScheduler log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v16 = 138543618;
      id v17 = v8;
      __int16 v18 = 2114;
      v19 = v12;
      v14 = v13;
      os_log_type_t v15 = OS_LOG_TYPE_INFO;
      goto LABEL_8;
    }
  }
}

+ (id)taskTypes
{
  if (taskTypes_onceToken != -1) {
    dispatch_once(&taskTypes_onceToken, &__block_literal_global_33_0);
  }
  v2 = (void *)taskTypes_taskTypes;

  return v2;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__EDSearchableIndexScheduler_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_85 != -1) {
    dispatch_once(&log_onceToken_85, block);
  }
  v2 = (void *)log_log_85;

  return (OS_os_log *)v2;
}

+ (id)activityTypes
{
  if (activityTypes_onceToken != -1) {
    dispatch_once(&activityTypes_onceToken, &__block_literal_global_74);
  }
  v2 = (void *)activityTypes_activityTypes;

  return v2;
}

uint64_t __112__EDSearchableIndexScheduler_searchableIndexSchedulable_didGenerateImportantPowerEventWithIdentifier_eventData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _logIndexingPowerEventWithIdentifier:*(void *)(a1 + 40) additionalEventData:*(void *)(a1 + 48) usePersistentLog:1];
}

uint64_t __103__EDSearchableIndexScheduler_searchableIndexSchedulable_didGeneratePowerEventWithIdentifier_eventData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _logIndexingPowerEventWithIdentifier:*(void *)(a1 + 40) additionalEventData:*(void *)(a1 + 48) usePersistentLog:0];
}

- (void)searchableIndexSchedulable:(id)a3 didGeneratePowerEventWithIdentifier:(id)a4 eventData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(EDSearchableIndexScheduler *)self indexingStateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__EDSearchableIndexScheduler_searchableIndexSchedulable_didGeneratePowerEventWithIdentifier_eventData___block_invoke;
  block[3] = &unk_1E6BFF7A8;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

- (void)searchableIndexSchedulable:(id)a3 didGenerateImportantPowerEventWithIdentifier:(id)a4 eventData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(EDSearchableIndexScheduler *)self indexingStateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__EDSearchableIndexScheduler_searchableIndexSchedulable_didGenerateImportantPowerEventWithIdentifier_eventData___block_invoke;
  block[3] = &unk_1E6BFF7A8;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __33__EDSearchableIndexScheduler_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_85;
  log_log_85 = (uint64_t)v1;
}

void __43__EDSearchableIndexScheduler_activityTypes__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"budgeted", @"maintenance", 0);
  os_log_t v1 = (void *)activityTypes_activityTypes;
  activityTypes_activityTypes = v0;
}

+ (NSSet)deferrableActivityTypes
{
  if (deferrableActivityTypes_onceToken != -1) {
    dispatch_once(&deferrableActivityTypes_onceToken, &__block_literal_global_31_1);
  }
  v2 = (void *)deferrableActivityTypes_deferrableActivityTypes;

  return (NSSet *)v2;
}

void __53__EDSearchableIndexScheduler_deferrableActivityTypes__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithObject:@"budgeted"];
  os_log_t v1 = (void *)deferrableActivityTypes_deferrableActivityTypes;
  deferrableActivityTypes_deferrableActivityTypes = v0;
}

void __39__EDSearchableIndexScheduler_taskTypes__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithObject:@"fastpass"];
  os_log_t v1 = (void *)taskTypes_taskTypes;
  taskTypes_taskTypes = v0;
}

+ (BOOL)isDeferrableActivityType:(id)a3
{
  id v3 = a3;
  char v4 = +[EDSearchableIndexScheduler deferrableActivityTypes];
  char v5 = [v4 containsObject:v3];

  return v5;
}

+ (id)budgetTimeUserDefaultsKeyForIndexName:(id)a3
{
  id v3 = [NSString stringWithFormat:@"%@.%@", @"com.apple.email.searchableIndex.scheduler", a3];

  return v3;
}

- (EDSearchableIndexScheduler)initWithSchedulable:(id)a3 budgetConfiguration:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)EDSearchableIndexScheduler;
  id v8 = [(EDSearchableIndexScheduler *)&v28 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_schedulable, v6);
    objc_storeStrong((id *)&v9->_budgetConfiguration, a4);
    id v10 = [@"com.apple.email.searchableIndex.scheduler" stringByAppendingString:@".indexingStateQueue"];
    id v11 = (const char *)[v10 UTF8String];
    char v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create(v11, v12);
    indexingStateQueue = v9->_indexingStateQueue;
    v9->_indexingStateQueue = (OS_dispatch_queue *)v13;

    os_log_type_t v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    activities = v9->_activities;
    v9->_activities = v15;

    id v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    tasks = v9->_tasks;
    v9->_tasks = v17;

    v19 = [v6 indexName];
    uint64_t v20 = +[EDSearchableIndexScheduler budgetTimeUserDefaultsKeyForIndexName:v19];
    budgetTimeUserDefaultsKey = v9->_budgetTimeUserDefaultsKey;
    v9->_budgetTimeUserDefaultsKey = (NSString *)v20;

    v22 = [EDSearchableIndexSchedulerState alloc];
    [(EDSearchableIndexScheduler *)v9 _budgetTimeFromUserDefaults];
    uint64_t v23 = -[EDSearchableIndexSchedulerState initWithBudgetedTimeRemaining:](v22, "initWithBudgetedTimeRemaining:");
    state = v9->_state;
    v9->_state = (EDSearchableIndexSchedulerState *)v23;

    v25 = +[EDSearchableIndexScheduler log];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = objc_msgSend(v7, "ef_publicDescription");
      *(_DWORD *)buf = 138543362;
      v30 = v26;
      _os_log_impl(&dword_1DB39C000, v25, OS_LOG_TYPE_DEFAULT, "Initializing scheduler with budgetConfiguration:%{public}@", buf, 0xCu);
    }
  }

  return v9;
}

- (void)dealloc
{
  [(EDSearchableIndexScheduler *)self _stopAllIndexingBacklogComplete:0];
  id v3 = [(EDSearchableIndexScheduler *)self state];
  [v3 setBudgetedItemCountRemaining:0];

  v4.receiver = self;
  v4.super_class = (Class)EDSearchableIndexScheduler;
  [(EDSearchableIndexScheduler *)&v4 dealloc];
}

- (void)setScheduling:(BOOL)a3
{
  if (self->_scheduling != a3)
  {
    self->_scheduling = a3;
    if (a3) {
      [(EDSearchableIndexScheduler *)self _startScheduling];
    }
    else {
      [(EDSearchableIndexScheduler *)self _stopScheduling];
    }
  }
}

- (id)_xpcActivityIdentifierForActivityType:(id)a3
{
  id v3 = [NSString stringWithFormat:@"%@.%@", @"com.apple.email.searchableIndex.scheduler", a3];

  return v3;
}

- (id)_xpcCriteriaBuilderBlockForActivityType:(id)a3
{
  id v5 = a3;
  id v6 = [(EDSearchableIndexScheduler *)self budgetConfiguration];
  [v6 periodDuration];
  double v8 = v7;
  if ([v5 isEqual:@"budgeted"])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __70__EDSearchableIndexScheduler__xpcCriteriaBuilderBlockForActivityType___block_invoke;
    aBlock[3] = &unk_1E6C05C40;
    id v18 = v5;
    uint64_t v19 = (uint64_t)v8;
    id v9 = _Block_copy(aBlock);
    id v10 = v18;
LABEL_5:

    goto LABEL_7;
  }
  if ([v5 isEqual:@"maintenance"])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __70__EDSearchableIndexScheduler__xpcCriteriaBuilderBlockForActivityType___block_invoke_47;
    v14[3] = &unk_1E6C05C40;
    uint64_t v16 = (uint64_t)v8;
    id v15 = v5;
    id v9 = _Block_copy(v14);
    id v10 = v15;
    goto LABEL_5;
  }
  id v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2, self, @"EDSearchableIndexScheduler.m", 198, @"Attempting to find a criteria builder block indexing for an unsupported activity type: %@", v5 object file lineNumber description];

  id v9 = 0;
LABEL_7:
  char v12 = _Block_copy(v9);

  return v12;
}

void __70__EDSearchableIndexScheduler__xpcCriteriaBuilderBlockForActivityType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_super v4 = +[EDSearchableIndexScheduler log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "Configuring %{public}@ actvitity with interval: %lld", (uint8_t *)&v7, 0x16u);
  }

  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E4F141C8], *(void *)(a1 + 40));
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F142F8], 1);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E4F141A8], 0);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E4F14170], 0);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14138], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14310], 1);
}

void __70__EDSearchableIndexScheduler__xpcCriteriaBuilderBlockForActivityType___block_invoke_47(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = +[EDSearchableIndexScheduler log];
  int64_t v6 = 3 * v4;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2048;
    int64_t v11 = v6;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Configuring %{public}@ actvitity with interval: %lld", (uint8_t *)&v8, 0x16u);
  }

  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E4F141C8], v6);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F142F8], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14310], 1);
}

- (void)_startScheduling
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB39C000, v0, v1, "Failed to register task for search fast pass", v2, v3, v4, v5, v6);
}

void __46__EDSearchableIndexScheduler__startScheduling__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) numberOfItemsToIndexOnResume];
  id v3 = [*(id *)(a1 + 32) state];
  [v3 setBudgetedItemCountRemaining:v2];
}

void __46__EDSearchableIndexScheduler__startScheduling__block_invoke_55(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (!xpc_activity_set_state(v3, 4))
    {
      uint64_t v5 = +[EDSearchableIndexScheduler log];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        xpc_activity_state_t state = xpc_activity_get_state(v3);
        __46__EDSearchableIndexScheduler__startScheduling__block_invoke_55_cold_1(v6, v8, state, v5);
      }
    }
    [WeakRetained beginIndexingForActivityType:*(void *)(a1 + 32) activity:v3];
  }
  else
  {
    xpc_activity_set_state(v3, 5);
  }
}

void __46__EDSearchableIndexScheduler__startScheduling__block_invoke_57(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = +[EDSearchableIndexScheduler log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Search fast pass task started.", v7, 2u);
    }

    [WeakRetained _beginIndexingForTaskType:@"fastpass" task:v3];
  }
  else
  {
    uint64_t v6 = +[EDSearchableIndexScheduler log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __46__EDSearchableIndexScheduler__startScheduling__block_invoke_57_cold_1();
    }

    [v3 setTaskCompleted];
  }
}

- (void)_registerActivityForType:(id)a3 builder:(id)a4 runner:(id)a5
{
  id v13 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v13 isEqual:@"budgeted"])
  {
    int64_t v11 = @"com.apple.email.searchableIndex.scheduler.budgeted";
LABEL_5:
    [(__CFString *)v11 UTF8String];
    ef_xpc_activity_register();
    goto LABEL_7;
  }
  if ([v13 isEqual:@"maintenance"])
  {
    int64_t v11 = @"com.apple.email.searchableIndex.scheduler.maintenance";
    goto LABEL_5;
  }
  uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
  [v12 handleFailureInMethod:a2, self, @"EDSearchableIndexScheduler.m", 277, @"Attempting to register unsupported activity type: %@", v13 object file lineNumber description];

LABEL_7:
}

- (void)_stopScheduling
{
  id v3 = [(EDSearchableIndexScheduler *)self indexingStateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__EDSearchableIndexScheduler__stopScheduling__block_invoke;
  block[3] = &unk_1E6BFF2F0;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __45__EDSearchableIndexScheduler__stopScheduling__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _stopAllIndexingBacklogComplete:0];
  uint64_t v2 = [*(id *)(a1 + 32) state];
  [v2 setBudgetedItemCountRemaining:0];

  id v3 = [MEMORY[0x1E4F4F440] sharedScheduler];
  [v3 deregisterTaskWithIdentifier:@"com.apple.email.search.FastPass"];

  uint64_t v4 = +[EDSearchableIndexScheduler log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "_stopScheduling - deregistered search fast pass", v5, 2u);
  }
}

- (void)beginIndexingForActivityType:(id)a3 activity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(EDSearchableIndexScheduler *)self indexingStateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__EDSearchableIndexScheduler_beginIndexingForActivityType_activity___block_invoke;
  block[3] = &unk_1E6BFF7A8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __68__EDSearchableIndexScheduler_beginIndexingForActivityType_activity___block_invoke(uint64_t a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) activities];
  id v3 = (id *)(a1 + 40);
  uint64_t v4 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v4)
  {
    uint64_t v5 = +[EDSearchableIndexScheduler log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __68__EDSearchableIndexScheduler_beginIndexingForActivityType_activity___block_invoke_cold_1((uint64_t *)(a1 + 40), v5);
    }

    xpc_activity_set_state(v4, 5);
    id v6 = [*(id *)(a1 + 32) state];
    [v6 disableIndexingForActivityType:*v3];
  }
  uint64_t v7 = *(void *)(a1 + 48);
  int v8 = [*(id *)(a1 + 32) activities];
  [v8 setObject:v7 forKeyedSubscript:*v3];

  if ([*v3 isEqual:@"maintenance"])
  {
    id v9 = [*(id *)(a1 + 32) state];
    [v9 setMaintenanceIndexingTime:0.0];

    id v10 = [*(id *)(a1 + 32) budgetConfiguration];
    [v10 time];
    double v12 = v11;
    id v13 = [*(id *)(a1 + 32) state];
    [v13 setBudgetedTimeRemaining:v12];

    id v14 = *(void **)(a1 + 32);
    id v15 = [v14 state];
    [v15 budgetedTimeRemaining];
    objc_msgSend(v14, "_saveBudgetTimeToUserDefaults:");
  }
  [*(id *)(a1 + 32) _enableIndexingForActivityType:*(void *)(a1 + 40)];
  id v17 = *(void **)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 40);
  uint64_t v19 = @"activityType";
  v20[0] = v16;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  [v17 _logIndexingPowerEventWithIdentifier:@"Enabled indexing." additionalEventData:v18 usePersistentLog:1];
}

- (void)_beginIndexingForTaskType:(id)a3 task:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(EDSearchableIndexScheduler *)self indexingStateQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(EDSearchableIndexScheduler *)self tasks];
  id v10 = [v9 objectForKeyedSubscript:v6];

  if (v10)
  {
    double v11 = +[EDSearchableIndexScheduler log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[EDSearchableIndexScheduler _beginIndexingForTaskType:task:]((uint64_t)v6, (uint64_t)v10, v11);
    }

    [v10 setTaskCompleted];
  }
  double v12 = [(EDSearchableIndexScheduler *)self tasks];
  [v12 setObject:v7 forKeyedSubscript:v6];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __61__EDSearchableIndexScheduler__beginIndexingForTaskType_task___block_invoke;
  id v18 = &unk_1E6BFF198;
  objc_copyWeak(&v20, &location);
  id v13 = v6;
  id v19 = v13;
  [v7 setExpirationHandler:&v15];
  -[EDSearchableIndexScheduler _enableIndexingForTaskType:](self, "_enableIndexingForTaskType:", v13, v15, v16, v17, v18);
  v22 = @"taskType";
  v23[0] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  [(EDSearchableIndexScheduler *)self _logIndexingPowerEventWithIdentifier:@"Enabled indexing." additionalEventData:v14 usePersistentLog:1];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __61__EDSearchableIndexScheduler__beginIndexingForTaskType_task___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[EDSearchableIndexScheduler log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_DEFAULT, "Search fast pass task expired.", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [WeakRetained indexingStateQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __61__EDSearchableIndexScheduler__beginIndexingForTaskType_task___block_invoke_66;
    v6[3] = &unk_1E6BFFAF0;
    v6[4] = v4;
    id v7 = *(id *)(a1 + 32);
    dispatch_async(v5, v6);
  }
}

uint64_t __61__EDSearchableIndexScheduler__beginIndexingForTaskType_task___block_invoke_66(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopIndexingForTaskType:*(void *)(a1 + 40) requestRetry:1 backlogComplete:0];
}

- (void)_stopIndexingForActivityType:(id)a3 shouldDeferIfPossible:(BOOL)a4
{
  BOOL v4 = a4;
  v11[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v4) {
    BOOL v4 = +[EDSearchableIndexScheduler isDeferrableActivityType:v6];
  }
  [(EDSearchableIndexScheduler *)self _disableIndexingForActivityType:v6 defer:v4];
  id v7 = [(EDSearchableIndexScheduler *)self activities];
  [v7 removeObjectForKey:v6];

  v10[0] = @"activityType";
  v10[1] = @"deferred";
  v11[0] = v6;
  int v8 = [NSNumber numberWithBool:v4];
  v11[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  [(EDSearchableIndexScheduler *)self _logIndexingPowerEventWithIdentifier:@"Stopped indexing." additionalEventData:v9 usePersistentLog:1];
}

- (void)_stopIndexingForTaskType:(id)a3 requestRetry:(BOOL)a4 backlogComplete:(BOOL)a5
{
  BOOL v6 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v8 = (__CFString *)a3;
  id v9 = [(EDSearchableIndexScheduler *)self indexingStateQueue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(EDSearchableIndexScheduler *)self tasks];
  double v11 = [v10 objectForKeyedSubscript:v8];

  [(EDSearchableIndexScheduler *)self _disableIndexingForTaskType:v8];
  double v12 = [(EDSearchableIndexScheduler *)self tasks];
  [v12 removeObjectForKey:v8];

  if (v11)
  {
    if (v6)
    {
      id v19 = 0;
      char v13 = [v11 setTaskExpiredWithRetryAfter:&v19 error:300.0];
      id v14 = v19;
      if (v13)
      {
        uint64_t v15 = +[EDSearchableIndexScheduler log];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v23 = v8;
          _os_log_impl(&dword_1DB39C000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ task requested more time", buf, 0xCu);
        }
      }
      else
      {
        uint64_t v15 = +[EDSearchableIndexScheduler log];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[EDSearchableIndexScheduler _stopIndexingForTaskType:requestRetry:backlogComplete:]((uint64_t)v8, (uint64_t)v14, v15);
        }
      }
    }
    else
    {
      if (v8 == @"fastpass" && !a5)
      {
        uint64_t v16 = +[EDSearchableIndexScheduler log];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_DEFAULT, "reportFeatureCheckpoint BGSystemTaskFeatureCheckpointPreviewAvailable for kSemanticSearchFeatureCode", buf, 2u);
        }

        [MEMORY[0x1E4F4F430] reportFeatureCheckpoint:30 forFeature:301 error:0];
      }
      id v17 = +[EDSearchableIndexScheduler log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v23 = v8;
        _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ task completed", buf, 0xCu);
      }

      [v11 setTaskCompleted];
    }
  }
  id v20 = @"taskType";
  v21 = v8;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  [(EDSearchableIndexScheduler *)self _logIndexingPowerEventWithIdentifier:@"Stopped indexing." additionalEventData:v18 usePersistentLog:1];
}

- (void)deferIndexingForActivityType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EDSearchableIndexScheduler *)self indexingStateQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__EDSearchableIndexScheduler_deferIndexingForActivityType___block_invoke;
  v7[3] = &unk_1E6BFFAF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __59__EDSearchableIndexScheduler_deferIndexingForActivityType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopIndexingForActivityType:*(void *)(a1 + 40) shouldDeferIfPossible:1];
}

void __57__EDSearchableIndexScheduler__deferActivitiesIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (xpc_activity_should_defer(v6))
  {
    id v7 = +[EDSearchableIndexScheduler log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "XPC Requested deferral of activity %@", (uint8_t *)&v8, 0xCu);
    }

    [*(id *)(a1 + 32) _stopIndexingForActivityType:v5 shouldDeferIfPossible:1];
  }
}

- (void)_stopAllIndexingBacklogComplete:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = +[EDSearchableIndexScheduler activityTypes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v27;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v26 + 1) + 8 * v8);
        uint64_t v10 = [(EDSearchableIndexScheduler *)self state];
        int v11 = [v10 isIndexingEnabledForActivityType:v9];

        if (v11) {
          [(EDSearchableIndexScheduler *)self _stopIndexingForActivityType:v9 shouldDeferIfPossible:0];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v6);
  }

  if (v3)
  {
    double v12 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
    char v13 = [v12 BOOLForKey:@"markedSemanticSearchAvailable"];

    id v14 = +[EDSearchableIndexScheduler log];
    uint64_t v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[EDSearchableIndexScheduler _stopAllIndexingBacklogComplete:]();
      }
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB39C000, v15, OS_LOG_TYPE_INFO, "reportFeatureCheckpoint BGSystemTaskFeatureCheckpointAvailable for kSemanticSearchFeatureCode", buf, 2u);
      }

      if ([MEMORY[0x1E4F4F430] reportFeatureCheckpoint:50 forFeature:301 error:0])
      {
        uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
        [v15 setBool:1 forKey:@"markedSemanticSearchAvailable"];
      }
      else
      {
        uint64_t v15 = +[EDSearchableIndexScheduler log];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[EDSearchableIndexScheduler _stopAllIndexingBacklogComplete:]();
        }
      }
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v16 = [(EDSearchableIndexScheduler *)self tasks];
  id v17 = [v16 allKeys];

  uint64_t v18 = [v17 countByEnumeratingWithState:&v21 objects:v30 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v17);
        }
        [(EDSearchableIndexScheduler *)self _stopIndexingForTaskType:*(void *)(*((void *)&v21 + 1) + 8 * v20++) requestRetry:v3 ^ 1 backlogComplete:v3];
      }
      while (v18 != v20);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v21 objects:v30 count:16];
    }
    while (v18);
  }
}

- (void)_periodicallyCheckForDeferralIfNecessary
{
  BOOL v3 = [(EDSearchableIndexScheduler *)self indexingStateQueue];
  dispatch_assert_queue_V2(v3);

  id v7 = [(EDSearchableIndexScheduler *)self state];
  if ([v7 isIndexingEnabledByActivities])
  {
    BOOL v4 = [(EDSearchableIndexScheduler *)self scheduledDeferralCheck];

    if (!v4)
    {
      [(EDSearchableIndexScheduler *)self setScheduledDeferralCheck:1];
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      dispatch_time_t v5 = dispatch_time(0, 3000000000);
      uint64_t v6 = [(EDSearchableIndexScheduler *)self indexingStateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __70__EDSearchableIndexScheduler__periodicallyCheckForDeferralIfNecessary__block_invoke;
      block[3] = &unk_1E6C00E78;
      objc_copyWeak(&v9, &location);
      dispatch_after(v5, v6, block);

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
  else
  {
  }
}

void __70__EDSearchableIndexScheduler__periodicallyCheckForDeferralIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = +[EDSearchableIndexScheduler log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_INFO, "Checking for XPC deferral", v3, 2u);
  }

  [WeakRetained _deferActivitiesIfNecessary];
  [WeakRetained setScheduledDeferralCheck:0];
  [WeakRetained _periodicallyCheckForDeferralIfNecessary];
}

- (void)_enableIndexingForActivityType:(id)a3
{
  id v11 = a3;
  BOOL v4 = [(EDSearchableIndexScheduler *)self indexingStateQueue];
  dispatch_assert_queue_V2(v4);

  dispatch_time_t v5 = [(EDSearchableIndexScheduler *)self state];
  char v6 = [v5 isIndexingEnabledForActivityType:v11];

  if ((v6 & 1) == 0)
  {
    id v7 = [(EDSearchableIndexScheduler *)self state];
    [v7 enableIndexingForActivityType:v11];

    uint64_t v8 = [(EDSearchableIndexScheduler *)self state];
    uint64_t v9 = [v8 isDataSourceIndexingPermitted];
    uint64_t v10 = [(EDSearchableIndexScheduler *)self schedulable];
    [v10 setDataSourceIndexingPermitted:v9];

    [(EDSearchableIndexScheduler *)self _periodicallyCheckForDeferralIfNecessary];
  }
}

- (void)_enableIndexingForTaskType:(id)a3
{
  id v11 = a3;
  BOOL v4 = [(EDSearchableIndexScheduler *)self indexingStateQueue];
  dispatch_assert_queue_V2(v4);

  dispatch_time_t v5 = [(EDSearchableIndexScheduler *)self state];
  char v6 = [v5 isIndexingEnabledForTaskType:v11];

  if ((v6 & 1) == 0)
  {
    id v7 = [(EDSearchableIndexScheduler *)self state];
    [v7 enableIndexingForTaskType:v11];

    uint64_t v8 = [(EDSearchableIndexScheduler *)self state];
    uint64_t v9 = [v8 isDataSourceIndexingPermitted];
    uint64_t v10 = [(EDSearchableIndexScheduler *)self schedulable];
    [v10 setDataSourceIndexingPermitted:v9];
  }
}

- (void)_disableIndexingForActivityType:(id)a3 defer:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(EDSearchableIndexScheduler *)self state];
  int v8 = [v7 isIndexingEnabledForActivityType:v6];

  if (v8)
  {
    uint64_t v9 = [(EDSearchableIndexScheduler *)self state];
    [v9 disableIndexingForActivityType:v6];

    uint64_t v10 = [(EDSearchableIndexScheduler *)self state];
    uint64_t v11 = [v10 isDataSourceIndexingPermitted];
    double v12 = [(EDSearchableIndexScheduler *)self schedulable];
    [v12 setDataSourceIndexingPermitted:v11];

    char v13 = [(EDSearchableIndexScheduler *)self activities];
    id v14 = [v13 objectForKeyedSubscript:v6];

    if (v14)
    {
      xpc_activity_state_t v15 = v4 ? 3 : 5;
      if (!xpc_activity_set_state(v14, v15))
      {
        uint64_t v16 = +[EDSearchableIndexScheduler log];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v17 = 138543874;
          id v18 = v6;
          __int16 v19 = 2048;
          xpc_activity_state_t state = xpc_activity_get_state(v14);
          __int16 v21 = 2048;
          xpc_activity_state_t v22 = v15;
          _os_log_error_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_ERROR, "Failed to transition %{public}@ from state %ld to state %ld.", (uint8_t *)&v17, 0x20u);
        }
      }
    }
  }
}

- (void)_disableIndexingForTaskType:(id)a3
{
  id v11 = a3;
  BOOL v4 = [(EDSearchableIndexScheduler *)self indexingStateQueue];
  dispatch_assert_queue_V2(v4);

  dispatch_time_t v5 = [(EDSearchableIndexScheduler *)self state];
  int v6 = [v5 isIndexingEnabledForTaskType:v11];

  if (v6)
  {
    id v7 = [(EDSearchableIndexScheduler *)self state];
    [v7 disableIndexingForTaskType:v11];

    int v8 = [(EDSearchableIndexScheduler *)self state];
    uint64_t v9 = [v8 isDataSourceIndexingPermitted];
    uint64_t v10 = [(EDSearchableIndexScheduler *)self schedulable];
    [v10 setDataSourceIndexingPermitted:v9];
  }
}

- (BOOL)isIndexingEnabledForActivityType:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  dispatch_time_t v5 = [(EDSearchableIndexScheduler *)self indexingStateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__EDSearchableIndexScheduler_isIndexingEnabledForActivityType___block_invoke;
  block[3] = &unk_1E6C00A40;
  id v9 = v4;
  uint64_t v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(self) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)self;
}

void __63__EDSearchableIndexScheduler_isIndexingEnabledForActivityType___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) state];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 isIndexingEnabledForActivityType:*(void *)(a1 + 40)];
}

- (BOOL)isIndexingEnabledForTaskType:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  dispatch_time_t v5 = [(EDSearchableIndexScheduler *)self indexingStateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__EDSearchableIndexScheduler_isIndexingEnabledForTaskType___block_invoke;
  block[3] = &unk_1E6C00A40;
  id v9 = v4;
  uint64_t v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(self) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)self;
}

void __59__EDSearchableIndexScheduler_isIndexingEnabledForTaskType___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) state];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 isIndexingEnabledForTaskType:*(void *)(a1 + 40)];
}

- (int64_t)budgetedItemCountRemaining
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  BOOL v3 = [(EDSearchableIndexScheduler *)self indexingStateQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__EDSearchableIndexScheduler_budgetedItemCountRemaining__block_invoke;
  v6[3] = &unk_1E6C00A68;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __56__EDSearchableIndexScheduler_budgetedItemCountRemaining__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) state];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 budgetedItemCountRemaining];
}

- (BOOL)isDataSourceIndexingPermitted
{
  id v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  BOOL v3 = [(EDSearchableIndexScheduler *)self indexingStateQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__EDSearchableIndexScheduler_isDataSourceIndexingPermitted__block_invoke;
  v5[3] = &unk_1E6C00A68;
  v5[4] = v2;
  void v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __59__EDSearchableIndexScheduler_isDataSourceIndexingPermitted__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) state];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isDataSourceIndexingPermitted];
}

- (double)otherIndexingTime
{
  uint64_t v7 = 0;
  uint64_t v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  BOOL v3 = [(EDSearchableIndexScheduler *)self indexingStateQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__EDSearchableIndexScheduler_otherIndexingTime__block_invoke;
  v6[3] = &unk_1E6C00A68;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __47__EDSearchableIndexScheduler_otherIndexingTime__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) state];
  [v3 otherIndexingTime];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
}

- (double)maintenanceIndexingTime
{
  uint64_t v7 = 0;
  uint64_t v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v3 = [(EDSearchableIndexScheduler *)self indexingStateQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__EDSearchableIndexScheduler_maintenanceIndexingTime__block_invoke;
  v6[3] = &unk_1E6C00A68;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __53__EDSearchableIndexScheduler_maintenanceIndexingTime__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) state];
  [v3 maintenanceIndexingTime];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
}

- (double)budgetedTimeRemaining
{
  uint64_t v7 = 0;
  uint64_t v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v3 = [(EDSearchableIndexScheduler *)self indexingStateQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__EDSearchableIndexScheduler_budgetedTimeRemaining__block_invoke;
  v6[3] = &unk_1E6C00A68;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __51__EDSearchableIndexScheduler_budgetedTimeRemaining__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) state];
  [v3 budgetedTimeRemaining];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
}

- (double)_budgetTimeFromUserDefaults
{
  id v3 = [(EDSearchableIndexScheduler *)self budgetTimeUserDefaultsKey];
  double v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  dispatch_time_t v5 = [v4 objectForKey:v3];
  uint64_t v6 = [(EDSearchableIndexScheduler *)self budgetConfiguration];
  [v6 time];
  double v8 = v7;

  if (v5)
  {
    [v4 doubleForKey:v3];
    if (v9 < v8) {
      double v8 = v9;
    }
  }

  return v8;
}

- (void)searchableIndexSchedulable:(id)a3 didIndexItemCount:(int64_t)a4 lastItemDateReceived:(id)a5
{
  id v7 = a5;
  double v8 = [(EDSearchableIndexScheduler *)self indexingStateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__EDSearchableIndexScheduler_searchableIndexSchedulable_didIndexItemCount_lastItemDateReceived___block_invoke;
  block[3] = &unk_1E6C00900;
  double v12 = self;
  int64_t v13 = a4;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, block);
}

uint64_t __96__EDSearchableIndexScheduler_searchableIndexSchedulable_didIndexItemCount_lastItemDateReceived___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[EDSearchableIndexScheduler log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 32);
    v11[0] = 67109378;
    v11[1] = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    _os_log_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_INFO, "didIndexItemCount: %d lastItemDateReceived: %@", (uint8_t *)v11, 0x12u);
  }

  dispatch_time_t v5 = [*(id *)(a1 + 40) state];
  [v5 didIndexItemCount:*(void *)(a1 + 48)];

  uint64_t v6 = [*(id *)(a1 + 40) state];
  if ([v6 isIndexingEnabledForTaskType:@"fastpass"])
  {
    id v7 = [*(id *)(a1 + 40) state];
    if ([v7 fastPassIndexedItemCount] >= 10000)
    {

LABEL_8:
      [*(id *)(a1 + 40) _stopIndexingForTaskType:@"fastpass" requestRetry:0 backlogComplete:0];
      return [*(id *)(a1 + 40) _deferActivitiesIfNecessary];
    }
    [*(id *)(a1 + 32) timeIntervalSinceNow];
    BOOL v9 = fabs(v8) < 2628000.0;

    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  return [*(id *)(a1 + 40) _deferActivitiesIfNecessary];
}

- (void)indexingDidResumeForSearchableIndexSchedulable:(id)a3
{
  uint64_t v4 = [(EDSearchableIndexScheduler *)self indexingStateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__EDSearchableIndexScheduler_indexingDidResumeForSearchableIndexSchedulable___block_invoke;
  block[3] = &unk_1E6BFF2F0;
  void block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __77__EDSearchableIndexScheduler_indexingDidResumeForSearchableIndexSchedulable___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) budgetConfiguration];
  uint64_t v3 = [v2 numberOfItemsToIndexOnResume];
  uint64_t v4 = [*(id *)(a1 + 32) state];
  [v4 setBudgetedItemCountRemaining:v3];

  dispatch_time_t v5 = *(void **)(a1 + 32);

  return [v5 _deferActivitiesIfNecessary];
}

- (void)indexingDidSuspendForSearchableIndexSchedulable:(id)a3
{
  uint64_t v4 = [(EDSearchableIndexScheduler *)self indexingStateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__EDSearchableIndexScheduler_indexingDidSuspendForSearchableIndexSchedulable___block_invoke;
  block[3] = &unk_1E6BFF2F0;
  void block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __78__EDSearchableIndexScheduler_indexingDidSuspendForSearchableIndexSchedulable___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deferActivitiesIfNecessary];
}

- (void)indexingDidFinishForSearchableIndexSchedulable:(id)a3 backlogComplete:(BOOL)a4
{
  uint64_t v6 = [(EDSearchableIndexScheduler *)self indexingStateQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __93__EDSearchableIndexScheduler_indexingDidFinishForSearchableIndexSchedulable_backlogComplete___block_invoke;
  v7[3] = &unk_1E6C05288;
  v7[4] = self;
  BOOL v8 = a4;
  dispatch_async(v6, v7);
}

uint64_t __93__EDSearchableIndexScheduler_indexingDidFinishForSearchableIndexSchedulable_backlogComplete___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopAllIndexingBacklogComplete:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)isScheduling
{
  return self->_scheduling;
}

- (EDSearchableIndexSchedulable)schedulable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_schedulable);

  return (EDSearchableIndexSchedulable *)WeakRetained;
}

- (BOOL)scheduledDeferralCheck
{
  return self->_scheduledDeferralCheck;
}

- (void)setScheduledDeferralCheck:(BOOL)a3
{
  self->_scheduledDeferralCheck = a3;
}

- (void)setBudgetTimeUserDefaultsKey:(id)a3
{
}

- (void)setIndexingStateQueue:(id)a3
{
}

- (void)setState:(id)a3
{
}

- (NSMutableDictionary)activities
{
  return self->_activities;
}

- (void)setActivities:(id)a3
{
}

- (NSMutableDictionary)tasks
{
  return self->_tasks;
}

- (void)setTasks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_indexingStateQueue, 0);
  objc_storeStrong((id *)&self->_budgetTimeUserDefaultsKey, 0);
  objc_storeStrong((id *)&self->_budgetConfiguration, 0);

  objc_destroyWeak((id *)&self->_schedulable);
}

void __46__EDSearchableIndexScheduler__startScheduling__block_invoke_55_cold_1(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 138543874;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  *((_WORD *)buf + 11) = 1024;
  *((_DWORD *)buf + 6) = 4;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Failed to transition %{public}@ from state %ld to state %d.", buf, 0x1Cu);
}

void __46__EDSearchableIndexScheduler__startScheduling__block_invoke_57_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB39C000, v0, v1, "Marking search fast pass task completed, self is nil.", v2, v3, v4, v5, v6);
}

void __68__EDSearchableIndexScheduler_beginIndexingForActivityType_activity___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "Attempted to begin indexing an activity type (%{public}@) that is already active - marking old ACTIVITY as DONE", (uint8_t *)&v3, 0xCu);
}

- (void)_beginIndexingForTaskType:(NSObject *)a3 task:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_2_1(&dword_1DB39C000, a2, a3, "Attempted to begin indexing a task type (%{public}@) that already has a task: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)_stopIndexingForTaskType:(uint64_t)a1 requestRetry:(uint64_t)a2 backlogComplete:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_2_1(&dword_1DB39C000, a2, a3, "%{public}@ task expired with retry failed: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)_stopAllIndexingBacklogComplete:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1DB39C000, v0, OS_LOG_TYPE_DEBUG, "Already reported FeatureCheckpointAvailable", v1, 2u);
}

- (void)_stopAllIndexingBacklogComplete:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB39C000, v0, v1, "reportFeatureCheckpoint BGSystemTaskFeatureCheckpointAvailable for kSemanticSearchFeatureCode failed", v2, v3, v4, v5, v6);
}

@end