@interface ACHCurrentActivitySummaryQueryServer
+ (Class)queryClass;
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
- (ACHCurrentActivitySummaryQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable;
- (BOOL)_shouldListenForUpdates;
- (void)_queue_start;
- (void)_queue_startDataCollection;
- (void)_queue_stop;
- (void)_queue_stopDataCollection;
- (void)currentActivitySummaryHelper:(id)a3 didUpdateTodayActivitySummary:(id)a4 changedFields:(unint64_t)a5;
- (void)currentActivitySummaryHelper:(id)a3 didUpdateYesterdayActivitySummary:(id)a4 changedFields:(unint64_t)a5;
@end

@implementation ACHCurrentActivitySummaryQueryServer

- (ACHCurrentActivitySummaryQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ACHCurrentActivitySummaryQueryServer;
  v11 = [(HDQueryServer *)&v16 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (v11)
  {
    v12 = [v10 collectionIntervals];
    uint64_t v13 = [v12 copy];
    collectionIntervals = v11->_collectionIntervals;
    v11->_collectionIntervals = (NSDictionary *)v13;
  }
  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [[ACHCurrentActivitySummaryQueryServer alloc] initWithUUID:v13 configuration:v12 client:v11 delegate:v10];

  return v14;
}

- (void)_queue_start
{
  v12.receiver = self;
  v12.super_class = (Class)ACHCurrentActivitySummaryQueryServer;
  [(HDQueryServer *)&v12 _queue_start];
  v3 = [(HDQueryServer *)self profile];
  v4 = [v3 dataCollectionManager];
  v5 = [MEMORY[0x263EFF910] date];
  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = [(NSDictionary *)self->_collectionIntervals allKeys];
  v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = MEMORY[0x263EFFA68];
  }
  id v10 = [v6 setWithArray:v9];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__ACHCurrentActivitySummaryQueryServer__queue_start__block_invoke;
  v11[3] = &unk_264516010;
  v11[4] = self;
  [v4 requestAggregationThroughDate:v5 types:v10 mode:0 options:1 completion:v11];
}

void __52__ACHCurrentActivitySummaryQueryServer__queue_start__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) profile];
  v2 = [v3 currentActivitySummaryHelper];
  [v2 addObserver:*(void *)(a1 + 32)];
}

- (void)_queue_stop
{
  v5.receiver = self;
  v5.super_class = (Class)ACHCurrentActivitySummaryQueryServer;
  [(HDQueryServer *)&v5 _queue_stop];
  id v3 = [(HDQueryServer *)self profile];
  v4 = [v3 currentActivitySummaryHelper];
  [v4 removeObserver:self];
}

- (void)_queue_startDataCollection
{
  id v3 = [(HDQueryServer *)self profile];
  v4 = [v3 dataCollectionManager];

  collectionIntervals = self->_collectionIntervals;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __66__ACHCurrentActivitySummaryQueryServer__queue_startDataCollection__block_invoke;
  v14[3] = &unk_2645170B8;
  id v15 = v4;
  objc_super v16 = self;
  id v6 = v4;
  [(NSDictionary *)collectionIntervals enumerateKeysAndObjectsUsingBlock:v14];
  uint64_t v7 = [MEMORY[0x263EFF910] date];
  v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = [(NSDictionary *)self->_collectionIntervals allKeys];
  id v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = MEMORY[0x263EFFA68];
  }
  objc_super v12 = [v8 setWithArray:v11];
  [v6 requestAggregationThroughDate:v7 types:v12 mode:1 options:1 completion:&__block_literal_global_15];

  v13.receiver = self;
  v13.super_class = (Class)ACHCurrentActivitySummaryQueryServer;
  [(HDQueryServer *)&v13 _queue_startDataCollection];
}

void __66__ACHCurrentActivitySummaryQueryServer__queue_startDataCollection__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a2;
  [a3 doubleValue];
  objc_msgSend(v4, "startDataCollectionForType:observer:collectionInterval:", v6, v5);
}

- (void)_queue_stopDataCollection
{
  v10.receiver = self;
  v10.super_class = (Class)ACHCurrentActivitySummaryQueryServer;
  [(HDQueryServer *)&v10 _queue_stopDataCollection];
  id v3 = [(HDQueryServer *)self profile];
  v4 = [v3 dataCollectionManager];

  collectionIntervals = self->_collectionIntervals;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__ACHCurrentActivitySummaryQueryServer__queue_stopDataCollection__block_invoke;
  v7[3] = &unk_2645170B8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [(NSDictionary *)collectionIntervals enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __65__ACHCurrentActivitySummaryQueryServer__queue_stopDataCollection__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) stopDataCollectionForType:a2 observer:*(void *)(a1 + 40)];
}

- (BOOL)_shouldListenForUpdates
{
  return 1;
}

- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable
{
  return 1;
}

- (void)currentActivitySummaryHelper:(id)a3 didUpdateTodayActivitySummary:(id)a4 changedFields:(unint64_t)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = [(HDQueryServer *)self clientProxy];
  if (v8)
  {
    if (([(HKActivitySummary *)self->_lastTodaySummary _allFieldsAreEqual:v7] & 1) == 0)
    {
      uint64_t v9 = ACHLogXPC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[ACHCurrentActivitySummaryQueryServer currentActivitySummaryHelper:didUpdateTodayActivitySummary:changedFields:]();
      }

      objc_super v10 = [(HDQueryServer *)self queryUUID];
      objc_msgSend(v8, "client_deliverTodaySummary:changedTodayFields:yesterdaySummary:changedYesterdayFields:queryUUID:", v7, a5, 0, 0, v10);

      uint64_t v11 = (HKActivitySummary *)[v7 copy];
      p_super = &self->_lastTodaySummary->super;
      self->_lastTodaySummary = v11;
      goto LABEL_11;
    }
  }
  else
  {
    objc_super v13 = ACHLogXPC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ACHCurrentActivitySummaryQueryServer currentActivitySummaryHelper:didUpdateTodayActivitySummary:changedFields:]();
    }
  }
  p_super = ACHLogXPC();
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v7;
    _os_log_impl(&dword_21F5DA000, p_super, OS_LOG_TYPE_DEFAULT, "Not calling query client with todayActivitySummary: %@, same as lastTodaySummary.", (uint8_t *)&v14, 0xCu);
  }
LABEL_11:
}

- (void)currentActivitySummaryHelper:(id)a3 didUpdateYesterdayActivitySummary:(id)a4 changedFields:(unint64_t)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = [(HDQueryServer *)self clientProxy];
  if (v8)
  {
    if (([(HKActivitySummary *)self->_lastYesterdaySummary _allFieldsAreEqual:v7] & 1) == 0)
    {
      uint64_t v9 = ACHLogXPC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[ACHCurrentActivitySummaryQueryServer currentActivitySummaryHelper:didUpdateYesterdayActivitySummary:changedFields:]();
      }

      objc_super v10 = [(HDQueryServer *)self queryUUID];
      objc_msgSend(v8, "client_deliverTodaySummary:changedTodayFields:yesterdaySummary:changedYesterdayFields:queryUUID:", 0, 0, v7, a5, v10);

      uint64_t v11 = (HKActivitySummary *)[v7 copy];
      p_super = &self->_lastYesterdaySummary->super;
      self->_lastYesterdaySummary = v11;
      goto LABEL_11;
    }
  }
  else
  {
    objc_super v13 = ACHLogXPC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ACHCurrentActivitySummaryQueryServer currentActivitySummaryHelper:didUpdateTodayActivitySummary:changedFields:]();
    }
  }
  p_super = ACHLogXPC();
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v7;
    _os_log_impl(&dword_21F5DA000, p_super, OS_LOG_TYPE_DEFAULT, "Not calling query client with yesterdayActivitySummary: %@, same as lastYesterdaySummary.", (uint8_t *)&v14, 0xCu);
  }
LABEL_11:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionIntervals, 0);
  objc_storeStrong((id *)&self->_lastYesterdaySummary, 0);
  objc_storeStrong((id *)&self->_lastTodaySummary, 0);
  objc_storeStrong((id *)&self->_currentSummaryHelper, 0);
}

- (void)currentActivitySummaryHelper:didUpdateTodayActivitySummary:changedFields:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_21F5DA000, v0, OS_LOG_TYPE_ERROR, "Missing query client for server %@", v1, 0xCu);
}

- (void)currentActivitySummaryHelper:didUpdateTodayActivitySummary:changedFields:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_21F5DA000, v0, OS_LOG_TYPE_DEBUG, "Calling query client with today summary: %@", v1, 0xCu);
}

- (void)currentActivitySummaryHelper:didUpdateYesterdayActivitySummary:changedFields:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_21F5DA000, v0, OS_LOG_TYPE_DEBUG, "Calling query client with yesterday summary: %@", v1, 0xCu);
}

@end