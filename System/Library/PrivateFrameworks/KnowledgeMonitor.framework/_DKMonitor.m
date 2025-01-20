@interface _DKMonitor
+ (BOOL)shouldMergeUnchangedEvents;
+ (id)entitlements;
+ (id)eventStream;
- (BOOL)_instantMonitorNeedsActivation;
- (BOOL)_instantMonitorNeedsDeactivation;
- (BOOL)historicalStateHasChanged:(id)a3;
- (BOOL)instantMonitorNeedsActivation;
- (BOOL)instantMonitorNeedsDeactivation;
- (NSDate)dateAtLastClockChange;
- (NSDate)lastUpdate;
- (NSMutableDictionary)historicalState;
- (NSMutableDictionary)instantState;
- (NSSet)classesForSecureStateDecoding;
- (OS_dispatch_queue)eventQueue;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_DKEvent)currentEvent;
- (_DKMonitor)init;
- (id)eventComparator;
- (id)filter;
- (id)historicalHandler;
- (id)instantHandler;
- (id)loadState;
- (id)shutdownHandler;
- (int64_t)references;
- (unint64_t)machTimeAtLastClockChange;
- (void)dealloc;
- (void)endCurrentEvent:(id)a3;
- (void)invalidateInstantState;
- (void)saveState;
- (void)setCurrentEvent:(id)a3;
- (void)setCurrentEvent:(id)a3 inferHistoricalState:(BOOL)a4;
- (void)setDateAtLastClockChange:(id)a3;
- (void)setEventComparator:(id)a3;
- (void)setFilter:(id)a3;
- (void)setHistoricalHandler:(id)a3;
- (void)setInstantHandler:(id)a3;
- (void)setLastUpdate:(id)a3;
- (void)setMachTimeAtLastClockChange:(unint64_t)a3;
- (void)setShutdownHandler:(id)a3;
- (void)systemClockDidChange:(id)a3;
@end

@implementation _DKMonitor

- (_DKEvent)currentEvent
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  eventQueue = self->_eventQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __26___DKMonitor_currentEvent__block_invoke;
  v5[3] = &unk_264714A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(eventQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (_DKEvent *)v3;
}

- (id)eventComparator
{
  return self->_eventComparator;
}

- (void)setCurrentEvent:(id)a3 inferHistoricalState:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51___DKMonitor_setCurrentEvent_inferHistoricalState___block_invoke;
  v13[3] = &unk_264714AB8;
  v13[4] = self;
  id v14 = v6;
  BOOL v15 = a4;
  uint64_t v8 = v13;
  v9 = queue;
  id v10 = v6;
  id v11 = (void *)os_transaction_create();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_1;
  block[3] = &unk_2647148A0;
  id v17 = v11;
  id v18 = v8;
  id v12 = v11;
  dispatch_async(v9, block);
}

- (BOOL)historicalStateHasChanged:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_instantState objectForKeyedSubscript:@"kCurrentEvent"];
  if (v5) {
    BOOL v6 = (*((uint64_t (**)(void))self->_eventComparator + 2))() != 0;
  }
  else {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)saveState
{
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __23___DKMonitor_saveState__block_invoke;
  v7[3] = &unk_264714788;
  v7[4] = self;
  id v3 = v7;
  id v4 = queue;
  v5 = (void *)os_transaction_create();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_1;
  block[3] = &unk_2647148A0;
  id v9 = v5;
  id v10 = v3;
  id v6 = v5;
  dispatch_async(v4, block);
}

+ (BOOL)shouldMergeUnchangedEvents
{
  return 0;
}

- (id)historicalHandler
{
  return self->_historicalHandler;
}

- (id)instantHandler
{
  return self->_instantHandler;
}

- (OS_os_log)log
{
  return self->_log;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)filter
{
  return self->_filter;
}

- (NSSet)classesForSecureStateDecoding
{
  return (NSSet *)[MEMORY[0x263EFFA08] set];
}

- (_DKMonitor)init
{
  v41.receiver = self;
  v41.super_class = (Class)_DKMonitor;
  v2 = [(_DKMonitor *)&v41 init];
  if (v2)
  {
    id v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    os_log_t v5 = os_log_create("com.apple.coreduet.monitors", Name);
    log = v2->_log;
    v2->_log = (OS_os_log *)v5;

    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    id v8 = objc_claimAutoreleasedReturnValue();
    id v9 = (const char *)[v8 UTF8String];
    id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create(v9, v10);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v11;

    v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    id v15 = [v14 stringByAppendingString:@".event"];
    v16 = (const char *)[v15 UTF8String];
    id v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create(v16, v17);
    eventQueue = v2->_eventQueue;
    v2->_eventQueue = (OS_dispatch_queue *)v18;

    uint64_t v20 = [(_DKMonitor *)v2 loadState];
    state = v2->_state;
    v2->_state = (NSDictionary *)v20;

    uint64_t v22 = [(NSDictionary *)v2->_state objectForKeyedSubscript:@"kInstantState"];
    instantState = v2->_instantState;
    v2->_instantState = (NSMutableDictionary *)v22;

    uint64_t v24 = [(NSDictionary *)v2->_state objectForKeyedSubscript:@"kHistoricalState"];
    historicalState = v2->_historicalState;
    v2->_historicalState = (NSMutableDictionary *)v24;

    uint64_t v26 = [(NSMutableDictionary *)v2->_historicalState objectForKeyedSubscript:@"kLastUpdateDate"];
    lastUpdate = v2->_lastUpdate;
    v2->_lastUpdate = (NSDate *)v26;

    id eventComparator = v2->_eventComparator;
    v2->_id eventComparator = &__block_literal_global_1;

    id filter = v2->_filter;
    v2->_id filter = &__block_literal_global_20;

    if ([(id)objc_opt_class() shouldMergeUnchangedEvents])
    {
      uint64_t v30 = [(NSMutableDictionary *)v2->_instantState objectForKeyedSubscript:@"kCurrentEvent"];
      currentEvent = v2->_currentEvent;
      v2->_currentEvent = (_DKEvent *)v30;
    }
    v32 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"Backlight", @"ScreenLockState", @"AppUsage", 0);
    uint64_t v33 = [(id)objc_opt_class() eventStream];
    if (v33)
    {
      v34 = (void *)v33;
      v35 = [(id)objc_opt_class() eventStream];
      int v36 = [v32 containsObject:v35];

      if (v36)
      {
        v2->_machTimeAtLastClockChange = mach_continuous_time();
        uint64_t v37 = [MEMORY[0x263EFF910] date];
        dateAtLastClockChange = v2->_dateAtLastClockChange;
        v2->_dateAtLastClockChange = (NSDate *)v37;

        v39 = [MEMORY[0x263F08A00] defaultCenter];
        [v39 addObserver:v2 selector:sel_systemClockDidChange_ name:*MEMORY[0x263EFF5C8] object:0];
      }
    }
  }
  return v2;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263EFF5C8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)_DKMonitor;
  [(_DKMonitor *)&v4 dealloc];
}

- (id)loadState
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__2;
  id v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __23___DKMonitor_loadState__block_invoke;
  v5[3] = &unk_264714A68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (id)eventStream
{
  return 0;
}

+ (id)entitlements
{
  return 0;
}

- (BOOL)instantMonitorNeedsActivation
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43___DKMonitor_instantMonitorNeedsActivation__block_invoke;
  v5[3] = &unk_264714A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_instantMonitorNeedsActivation
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int64_t references = self->_references;
  self->_int64_t references = references + 1;
  return references == 0;
}

- (BOOL)instantMonitorNeedsDeactivation
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45___DKMonitor_instantMonitorNeedsDeactivation__block_invoke;
  v5[3] = &unk_264714A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_instantMonitorNeedsDeactivation
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int64_t v3 = self->_references - 1;
  self->_int64_t references = v3;
  return v3 == 0;
}

- (void)endCurrentEvent:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_log_t v5 = [(NSMutableDictionary *)self->_instantState objectForKeyedSubscript:@"kCurrentEvent"];
  if (v5)
  {
    uint64_t v6 = [(_DKMonitor *)self filter];
    char v7 = ((uint64_t (**)(void, void *))v6)[2](v6, v5);

    if ((v7 & 1) == 0)
    {
      [v5 setEndDate:v4];
      uint64_t v8 = [(_DKMonitor *)self historicalHandler];

      if (v8)
      {
        char v9 = [(_DKMonitor *)self historicalHandler];
        v11[0] = v5;
        id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
        ((void (**)(void, void *))v9)[2](v9, v10);
      }
    }
    [(NSMutableDictionary *)self->_instantState removeObjectForKey:@"kCurrentEvent"];
  }
}

- (void)setCurrentEvent:(id)a3
{
}

- (void)invalidateInstantState
{
}

- (void)setLastUpdate:(id)a3
{
  id v9 = a3;
  os_log_t v5 = [(_DKMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x22A629AA0]();
  objc_storeStrong((id *)&self->_lastUpdate, a3);
  lastUpdate = self->_lastUpdate;
  if (lastUpdate)
  {
    uint64_t v8 = [(_DKMonitor *)self historicalState];
    [v8 setObject:lastUpdate forKeyedSubscript:@"kLastUpdateDate"];

    [(_DKMonitor *)self saveState];
  }
}

- (void)systemClockDidChange:(id)a3
{
  id v4 = a3;
  if (systemClockDidChange__onceToken != -1) {
    dispatch_once(&systemClockDidChange__onceToken, &__block_literal_global_48);
  }
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  eventQueue = self->_eventQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35___DKMonitor_systemClockDidChange___block_invoke_2;
  v6[3] = &unk_264714A68;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(eventQueue, v6);
  if (*((unsigned char *)v8 + 24))
  {
    [(_DKMonitor *)self invalidateInstantState];
    [(_DKMonitor *)self synchronouslyReflectCurrentValue];
  }
  _Block_object_dispose(&v7, 8);
}

- (void)setInstantHandler:(id)a3
{
}

- (void)setHistoricalHandler:(id)a3
{
}

- (id)shutdownHandler
{
  return self->_shutdownHandler;
}

- (void)setShutdownHandler:(id)a3
{
}

- (NSDate)lastUpdate
{
  return self->_lastUpdate;
}

- (NSMutableDictionary)instantState
{
  return self->_instantState;
}

- (NSMutableDictionary)historicalState
{
  return self->_historicalState;
}

- (void)setEventComparator:(id)a3
{
}

- (void)setFilter:(id)a3
{
}

- (int64_t)references
{
  return self->_references;
}

- (unint64_t)machTimeAtLastClockChange
{
  return self->_machTimeAtLastClockChange;
}

- (void)setMachTimeAtLastClockChange:(unint64_t)a3
{
  self->_machTimeAtLastClockChange = a3;
}

- (NSDate)dateAtLastClockChange
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDateAtLastClockChange:(id)a3
{
}

- (OS_dispatch_queue)eventQueue
{
  return self->_eventQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_dateAtLastClockChange, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong(&self->_eventComparator, 0);
  objc_storeStrong((id *)&self->_historicalState, 0);
  objc_storeStrong((id *)&self->_instantState, 0);
  objc_storeStrong((id *)&self->_currentEvent, 0);
  objc_storeStrong((id *)&self->_lastUpdate, 0);
  objc_storeStrong(&self->_shutdownHandler, 0);
  objc_storeStrong(&self->_historicalHandler, 0);
  objc_storeStrong(&self->_instantHandler, 0);
  objc_storeStrong((id *)&self->_bootSessionUUID, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end