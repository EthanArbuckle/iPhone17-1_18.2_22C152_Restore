@interface HKMCDaySummaryQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- ($0AC6E346AE4835514AAA8AC86D8F4844)dayIndexRange;
- (BOOL)ascending;
- (HKMCDaySummaryQuery)initWithDayIndexRange:(id)a3 ascending:(BOOL)a4 limit:(int64_t)a5 resultsHandler:(id)a6;
- (int64_t)limit;
- (void)client_deliverDaySummaries:(id)a3 clearPending:(BOOL)a4 isFinalBatch:(BOOL)a5 daySummaryAnchor:(id)a6 queryUUID:(id)a7;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
@end

@implementation HKMCDaySummaryQuery

uint64_t __103__HKMCDaySummaryQuery_client_deliverDaySummaries_clearPending_isFinalBatch_daySummaryAnchor_queryUUID___block_invoke_277(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    v4 = objc_opt_class();
    v5 = NSNumber;
    v6 = *(void **)(a1 + 40);
    id v7 = v4;
    v8 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    v9 = HKSensitiveLogItem();
    int v11 = 138543874;
    v12 = v4;
    __int16 v13 = 2112;
    v14 = v8;
    __int16 v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_2249E9000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Delivering %@ summaries: %@", (uint8_t *)&v11, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)client_deliverDaySummaries:(id)a3 clearPending:(BOOL)a4 isFinalBatch:(BOOL)a5 daySummaryAnchor:(id)a6 queryUUID:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  __int16 v15 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __103__HKMCDaySummaryQuery_client_deliverDaySummaries_clearPending_isFinalBatch_daySummaryAnchor_queryUUID___block_invoke;
  block[3] = &unk_2646E9C80;
  block[4] = self;
  id v20 = v12;
  BOOL v23 = a4;
  BOOL v24 = a5;
  id v21 = v14;
  id v22 = v13;
  id v16 = v13;
  id v17 = v14;
  id v18 = v12;
  dispatch_async(v15, block);
}

void __103__HKMCDaySummaryQuery_client_deliverDaySummaries_clearPending_isFinalBatch_daySummaryAnchor_queryUUID___block_invoke(uint64_t a1)
{
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEBUG)) {
    __103__HKMCDaySummaryQuery_client_deliverDaySummaries_clearPending_isFinalBatch_daySummaryAnchor_queryUUID___block_invoke_cold_1(a1, v2);
  }
  v3 = *(void **)(*(void *)(a1 + 32) + 160);
  if (v3 && !*(unsigned char *)(a1 + 64))
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
  if (*(unsigned char *)(a1 + 65))
  {
    id v7 = *(id *)(*(void *)(a1 + 32) + 160);
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(v8 + 160);
    *(void *)(v8 + 160) = 0;

    v10 = (void *)MEMORY[0x22A61C290](*(void *)(*(void *)(a1 + 32) + 152));
    if (v10)
    {
      int v11 = *(void **)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 48);
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __103__HKMCDaySummaryQuery_client_deliverDaySummaries_clearPending_isFinalBatch_daySummaryAnchor_queryUUID___block_invoke_277;
      v13[3] = &unk_2646E9C58;
      v13[4] = v11;
      id v14 = v7;
      id v16 = v10;
      id v15 = *(id *)(a1 + 56);
      objc_msgSend(v11, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v12, 1, v13);
    }
  }
}

+ (id)clientInterfaceProtocol
{
  return &unk_26D7D9A30;
}

- (void)queue_validate
{
  v3.receiver = self;
  v3.super_class = (Class)HKMCDaySummaryQuery;
  [(HKQuery *)&v3 queue_validate];
  if (!self->_resultsHandler) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263F0AC10], @"%@ resultsHandler must not be nil", objc_opt_class() format];
  }
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKMCDaySummaryQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id resultsHandler = self->_resultsHandler;
  self->_id resultsHandler = 0;
}

- (void)queue_populateConfiguration:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKMCDaySummaryQuery;
  id v4 = a3;
  [(HKQuery *)&v5 queue_populateConfiguration:v4];
  objc_msgSend(v4, "setDayIndexRange:", self->_dayIndexRange.start, self->_dayIndexRange.duration, v5.receiver, v5.super_class);
  [v4 setAscending:self->_ascending];
  [v4 setLimit:self->_limit];
}

- (HKMCDaySummaryQuery)initWithDayIndexRange:(id)a3 ascending:(BOOL)a4 limit:(int64_t)a5 resultsHandler:(id)a6
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  id v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HKMCDaySummaryQuery;
  uint64_t v12 = [(HKQuery *)&v17 _initWithObjectType:0 predicate:0];
  id v13 = v12;
  if (v12)
  {
    v12->_dayIndexRange.start = var0;
    v12->_dayIndexRange.duration = var1;
    v12->_ascending = a4;
    v12->_limit = a5;
    uint64_t v14 = [v11 copy];
    id resultsHandler = v13->_resultsHandler;
    v13->_id resultsHandler = (id)v14;
  }
  return v13;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (void)configureClientInterface:(id)a3
{
  id v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKMCDaySummaryQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  id v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverDaySummaries_clearPending_isFinalBatch_daySummaryAnchor_queryUUID_, 0, 0);
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x22A61C290](self->_resultsHandler);
  objc_super v6 = [(HKQuery *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__HKMCDaySummaryQuery_queue_deliverError___block_invoke;
  block[3] = &unk_2646E9510;
  id v10 = v4;
  id v11 = v5;
  block[4] = self;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __42__HKMCDaySummaryQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, 0, a1[5]);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)dayIndexRange
{
  p_dayIndexRange = &self->_dayIndexRange;
  int64_t start = self->_dayIndexRange.start;
  int64_t duration = p_dayIndexRange->duration;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summariesPendingDelivery, 0);
  objc_storeStrong(&self->_resultsHandler, 0);
}

void __103__HKMCDaySummaryQuery_client_deliverDaySummaries_clearPending_isFinalBatch_daySummaryAnchor_queryUUID___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  objc_super v3 = a2;
  id v4 = objc_opt_class();
  id v5 = NSNumber;
  objc_super v6 = *(void **)(a1 + 40);
  id v16 = v4;
  id v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
  id v8 = NSNumber;
  v9 = [*(id *)(a1 + 40) firstObject];
  id v10 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "dayIndex"));
  id v11 = NSNumber;
  uint64_t v12 = [*(id *)(a1 + 40) lastObject];
  id v13 = objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "dayIndex"));
  uint64_t v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
  id v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 65)];
  *(_DWORD *)buf = 138544642;
  id v18 = v4;
  __int16 v19 = 2112;
  id v20 = v7;
  __int16 v21 = 2112;
  id v22 = v10;
  __int16 v23 = 2112;
  BOOL v24 = v13;
  __int16 v25 = 2112;
  v26 = v14;
  __int16 v27 = 2112;
  v28 = v15;
  _os_log_debug_impl(&dword_2249E9000, v3, OS_LOG_TYPE_DEBUG, "[%{public}@] Received batch of %@ summaries (%@ - %@), clear pending: %@, is final: %@", buf, 0x3Eu);
}

@end