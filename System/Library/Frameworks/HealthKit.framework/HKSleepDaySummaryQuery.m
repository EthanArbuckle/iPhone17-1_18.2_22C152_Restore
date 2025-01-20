@interface HKSleepDaySummaryQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- ($0AC6E346AE4835514AAA8AC86D8F4844)morningIndexRange;
- (BOOL)ascending;
- (BOOL)onlySleepAnalysis;
- (BOOL)skipDaysWithoutSleepAnalysis;
- (BOOL)surfaceSleepStages;
- (HKSleepDaySummaryCacheSettings)cacheSettings;
- (HKSleepDaySummaryQuery)initWithMorningIndexRange:(id)a3 ascending:(BOOL)a4 limit:(int64_t)a5 options:(unint64_t)a6 resultsHandler:(id)a7;
- (NSCalendar)calendarOverrides;
- (int64_t)limit;
- (unint64_t)options;
- (void)client_deliverDaySummaries:(id)a3 clearPending:(BOOL)a4 isFinalBatch:(BOOL)a5 queryUUID:(id)a6;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
- (void)setCacheSettings:(id)a3;
- (void)setCalendarOverrides:(id)a3;
@end

@implementation HKSleepDaySummaryQuery

- (HKSleepDaySummaryQuery)initWithMorningIndexRange:(id)a3 ascending:(BOOL)a4 limit:(int64_t)a5 options:(unint64_t)a6 resultsHandler:(id)a7
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v13 = a7;
  v26.receiver = self;
  v26.super_class = (Class)HKSleepDaySummaryQuery;
  v14 = [(HKQuery *)&v26 _initWithObjectType:0 predicate:0];
  v15 = v14;
  if (v14)
  {
    v14->_morningIndexRange.start = var0;
    v14->_morningIndexRange.duration = var1;
    if (var0 >= 1 && var1 <= 0)
    {
      _HKInitializeLogging();
      v16 = (void *)HKLogSleep;
      if (os_log_type_enabled((os_log_t)HKLogSleep, OS_LOG_TYPE_FAULT))
      {
        v22 = v16;
        v23 = objc_opt_class();
        id v25 = v23;
        v24 = [(HKQuery *)v15 debugIdentifier];
        *(_DWORD *)buf = 138544130;
        v28 = v23;
        __int16 v29 = 2114;
        v30 = v24;
        __int16 v31 = 2048;
        int64_t v32 = var0;
        __int16 v33 = 2048;
        int64_t v34 = var1;
        _os_log_fault_impl(&dword_19C023000, v22, OS_LOG_TYPE_FAULT, "[%{public}@:%{public}@] Morning index range (start %ld duration %ld) has an incorrect duration", buf, 0x2Au);
      }
    }
    v15->_ascending = a4;
    v15->_limit = a5;
    v15->_options = a6;
    uint64_t v17 = [v13 copy];
    id resultsHandler = v15->_resultsHandler;
    v15->_id resultsHandler = (id)v17;

    cacheSettings = v15->_cacheSettings;
    v15->_cacheSettings = 0;

    calendarOverrides = v15->_calendarOverrides;
    v15->_calendarOverrides = 0;
  }
  return v15;
}

- (BOOL)skipDaysWithoutSleepAnalysis
{
  return self->_options & 1;
}

- (BOOL)onlySleepAnalysis
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (BOOL)surfaceSleepStages
{
  return (LOBYTE(self->_options) >> 2) & 1;
}

- (void)setCacheSettings:(id)a3
{
  id v5 = a3;
  [(HKQuery *)self _throwInvalidArgumentExceptionIfHasBeenExecuted:a2];
  v6 = [(HKQuery *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__HKSleepDaySummaryQuery_setCacheSettings___block_invoke;
  v8[3] = &unk_1E58BBBD0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(v6, v8);
}

uint64_t __43__HKSleepDaySummaryQuery_setCacheSettings___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 192) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)setCalendarOverrides:(id)a3
{
  id v5 = a3;
  [(HKQuery *)self _throwInvalidArgumentExceptionIfHasBeenExecuted:a2];
  v6 = [(HKQuery *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__HKSleepDaySummaryQuery_setCalendarOverrides___block_invoke;
  v8[3] = &unk_1E58BBBD0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(v6, v8);
}

uint64_t __47__HKSleepDaySummaryQuery_setCalendarOverrides___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 200) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)client_deliverDaySummaries:(id)a3 clearPending:(BOOL)a4 isFinalBatch:(BOOL)a5 queryUUID:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v12 = [(HKQuery *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__HKSleepDaySummaryQuery_client_deliverDaySummaries_clearPending_isFinalBatch_queryUUID___block_invoke;
  v15[3] = &unk_1E58BF240;
  v15[4] = self;
  id v16 = v10;
  BOOL v18 = a4;
  BOOL v19 = a5;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, v15);
}

void __89__HKSleepDaySummaryQuery_client_deliverDaySummaries_clearPending_isFinalBatch_queryUUID___block_invoke(uint64_t a1)
{
  _HKInitializeLogging();
  v2 = (void *)HKLogSleep;
  if (os_log_type_enabled((os_log_t)HKLogSleep, OS_LOG_TYPE_DEBUG)) {
    __89__HKSleepDaySummaryQuery_client_deliverDaySummaries_clearPending_isFinalBatch_queryUUID___block_invoke_cold_1(a1, v2);
  }
  v3 = *(void **)(*(void *)(a1 + 32) + 160);
  if (v3 && !*(unsigned char *)(a1 + 56))
  {
    [v3 addObjectsFromArray:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 40) mutableCopy];
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 160);
    *(void *)(v5 + 160) = v4;
  }
  if (*(unsigned char *)(a1 + 57))
  {
    id v7 = (void *)[*(id *)(*(void *)(a1 + 32) + 160) copy];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 160);
    *(void *)(v8 + 160) = 0;

    id v10 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 152));
    if (v10)
    {
      id v11 = *(void **)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 48);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __89__HKSleepDaySummaryQuery_client_deliverDaySummaries_clearPending_isFinalBatch_queryUUID___block_invoke_24;
      v15[3] = &unk_1E58BBA78;
      id v13 = v7;
      uint64_t v14 = *(void *)(a1 + 32);
      id v16 = v13;
      uint64_t v17 = v14;
      id v18 = v10;
      objc_msgSend(v11, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v12, 1, v15);
    }
  }
}

void __89__HKSleepDaySummaryQuery_client_deliverDaySummaries_clearPending_isFinalBatch_queryUUID___block_invoke_24(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v38 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(v2, "hk_addDayIndex:", objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "morningIndex"));
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v27 objects:v38 count:16];
    }
    while (v5);
  }

  _HKInitializeLogging();
  uint64_t v8 = (void *)HKLogSleep;
  if (os_log_type_enabled((os_log_t)HKLogSleep, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = objc_opt_class();
    id v11 = *(void **)(a1 + 40);
    id v12 = v10;
    id v13 = [v11 debugIdentifier];
    *(_DWORD *)buf = 138543874;
    __int16 v33 = v10;
    __int16 v34 = 2114;
    uint64_t v35 = v13;
    __int16 v36 = 2114;
    id v37 = v2;
    _os_log_impl(&dword_19C023000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Delivering summaries for: %{public}@", buf, 0x20u);
  }
  if (HKShowSensitiveLogItems() && os_log_type_enabled((os_log_t)HKLogSleep, OS_LOG_TYPE_DEBUG))
  {
    _HKInitializeLogging();
    uint64_t v14 = (void *)HKLogSleep;
    if (os_log_type_enabled((os_log_t)HKLogSleep, OS_LOG_TYPE_DEBUG)) {
      __89__HKSleepDaySummaryQuery_client_deliverDaySummaries_clearPending_isFinalBatch_queryUUID___block_invoke_24_cold_1(a1, v14);
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v22 = a1;
    id v15 = *(id *)(a1 + 32);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v24;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v23 + 1) + 8 * v19);
          _HKInitializeLogging();
          v21 = HKLogSleep;
          if (os_log_type_enabled((os_log_t)HKLogSleep, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            __int16 v33 = v20;
            _os_log_debug_impl(&dword_19C023000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v17);
    }

    a1 = v22;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (void)queue_populateConfiguration:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKSleepDaySummaryQuery;
  [(HKQuery *)&v10 queue_populateConfiguration:v4];
  objc_msgSend(v4, "setMorningIndexRange:", self->_morningIndexRange.start, self->_morningIndexRange.duration);
  [v4 setAscending:self->_ascending];
  [v4 setLimit:self->_limit];
  [v4 setOptions:self->_options];
  [v4 setCacheSettings:self->_cacheSettings];
  [v4 setCalendarOverrides:self->_calendarOverrides];
  _HKInitializeLogging();
  uint64_t v5 = (void *)HKLogSleep;
  if (os_log_type_enabled((os_log_t)HKLogSleep, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    id v7 = objc_opt_class();
    id v8 = v7;
    id v9 = [(HKQuery *)self debugIdentifier];
    *(_DWORD *)buf = 138543874;
    id v12 = v7;
    __int16 v13 = 2114;
    uint64_t v14 = v9;
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Configuration populated: %{public}@", buf, 0x20u);
  }
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EECFB908;
}

+ (void)configureClientInterface:(id)a3
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___HKSleepDaySummaryQuery;
  id v3 = a3;
  objc_msgSendSuper2(&v7, sel_configureClientInterface_, v3);
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0, v7.receiver, v7.super_class);
  [v3 setClasses:v6 forSelector:sel_client_deliverDaySummaries_clearPending_isFinalBatch_queryUUID_ argumentIndex:0 ofReply:0];
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _Block_copy(self->_resultsHandler);
  uint64_t v6 = [(HKQuery *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__HKSleepDaySummaryQuery_queue_deliverError___block_invoke;
  block[3] = &unk_1E58BB9A0;
  id v10 = v4;
  id v11 = v5;
  block[4] = self;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __45__HKSleepDaySummaryQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)queue_validate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = objc_opt_class();
  id v5 = v4;
  uint64_t v6 = [a2 debugIdentifier];
  id v7 = [a2 cacheSettings];
  id v8 = [v7 identifier];
  int v9 = 138543874;
  id v10 = v4;
  __int16 v11 = 2114;
  id v12 = v6;
  __int16 v13 = 2112;
  uint64_t v14 = v8;
  _os_log_fault_impl(&dword_19C023000, v3, OS_LOG_TYPE_FAULT, "[%{public}@:%{public}@] Not using cached results for query with caching identifier %@ due to unbounded morning index range", (uint8_t *)&v9, 0x20u);
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKSleepDaySummaryQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id resultsHandler = self->_resultsHandler;
  self->_id resultsHandler = 0;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)morningIndexRange
{
  p_morningIndexRange = &self->_morningIndexRange;
  int64_t start = self->_morningIndexRange.start;
  int64_t duration = p_morningIndexRange->duration;
  result.int64_t var1 = duration;
  result.int64_t var0 = start;
  return result;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (int64_t)limit
{
  return self->_limit;
}

- (unint64_t)options
{
  return self->_options;
}

- (HKSleepDaySummaryCacheSettings)cacheSettings
{
  return self->_cacheSettings;
}

- (NSCalendar)calendarOverrides
{
  return self->_calendarOverrides;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarOverrides, 0);
  objc_storeStrong((id *)&self->_cacheSettings, 0);
  objc_storeStrong((id *)&self->_summariesPendingDelivery, 0);

  objc_storeStrong(&self->_resultsHandler, 0);
}

void __89__HKSleepDaySummaryQuery_client_deliverDaySummaries_clearPending_isFinalBatch_queryUUID___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  log = a2;
  id v3 = objc_opt_class();
  id v4 = *(void **)(a1 + 32);
  id v16 = v3;
  objc_super v5 = [v4 debugIdentifier];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
  id v7 = NSNumber;
  id v8 = [*(id *)(a1 + 40) firstObject];
  int v9 = objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "morningIndex"));
  id v10 = NSNumber;
  __int16 v11 = [*(id *)(a1 + 40) lastObject];
  id v12 = objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "morningIndex"));
  __int16 v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  uint64_t v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 57)];
  *(_DWORD *)buf = 138544898;
  uint64_t v18 = v3;
  __int16 v19 = 2114;
  v20 = v5;
  __int16 v21 = 2112;
  uint64_t v22 = v6;
  __int16 v23 = 2112;
  long long v24 = v9;
  __int16 v25 = 2112;
  long long v26 = v12;
  __int16 v27 = 2112;
  long long v28 = v13;
  __int16 v29 = 2112;
  long long v30 = v14;
  _os_log_debug_impl(&dword_19C023000, log, OS_LOG_TYPE_DEBUG, "[%{public}@:%{public}@] Received batch of %@ summaries (%@ - %@), clear pending: %@, is final: %@", buf, 0x48u);
}

void __89__HKSleepDaySummaryQuery_client_deliverDaySummaries_clearPending_isFinalBatch_queryUUID___block_invoke_24_cold_1(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_opt_class();
  objc_super v5 = *(void **)(a1 + 40);
  id v6 = v4;
  id v7 = [v5 debugIdentifier];
  int v8 = 138543618;
  int v9 = v4;
  __int16 v10 = 2114;
  __int16 v11 = v7;
  _os_log_debug_impl(&dword_19C023000, v3, OS_LOG_TYPE_DEBUG, "[%{public}@:%{public}@] Summaries:", (uint8_t *)&v8, 0x16u);
}

@end