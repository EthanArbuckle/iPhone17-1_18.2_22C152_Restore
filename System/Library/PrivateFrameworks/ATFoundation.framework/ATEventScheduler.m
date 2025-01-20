@interface ATEventScheduler
+ (id)sharedInstance;
- (ATEventScheduler)init;
- (BOOL)hasScheduledEvent:(id)a3;
- (void)_postExpiredEvents;
- (void)_scheduleNextEvent;
- (void)removeEvent:(id)a3;
- (void)scheduleEvent:(id)a3 afterDelay:(double)a4 withUserData:(id)a5;
- (void)scheduleRecurringEvent:(id)a3 withInterval:(double)a4 afterDelay:(double)a5 withUserData:(id)a6;
- (void)start;
@end

@implementation ATEventScheduler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventAccessQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_events, 0);
}

- (void)_postExpiredEvents
{
  queue = self->_queue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__ATEventScheduler__postExpiredEvents__block_invoke;
  v3[3] = &unk_1E6B8C220;
  v3[4] = self;
  v3[5] = a2;
  dispatch_async(queue, v3);
}

void __38__ATEventScheduler__postExpiredEvents__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  id v25 = (id)objc_opt_new();
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__ATEventScheduler__postExpiredEvents__block_invoke_2;
  block[3] = &unk_1E6B8BDC0;
  block[4] = v2;
  block[5] = &v20;
  block[6] = *(void *)(a1 + 40);
  dispatch_sync(v3, block);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = (id)v21[5];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v28 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v16;
    *(void *)&long long v6 = 138543362;
    long long v14 = v6;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "objectForKey:", @"name", v14, (void)v15);
        v11 = [v9 objectForKey:@"userData"];
        v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v12 postNotificationName:v10 object:0 userInfo:v11];

        v13 = _ATLogCategoryFramework();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v14;
          v27 = v10;
          _os_log_impl(&dword_1D9BC7000, v13, OS_LOG_TYPE_DEFAULT, "Firing notification %{public}@", buf, 0xCu);
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v28 count:16];
    }
    while (v5);
  }

  _Block_object_dispose(&v20, 8);
}

uint64_t __38__ATEventScheduler__postExpiredEvents__block_invoke_2(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v3 = v2;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v39 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v10 = [v9 objectForKey:@"time"];
        [v10 doubleValue];
        double v12 = v11;

        if (v12 <= v3) {
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v6);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v13 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        v19 = [v18 objectForKey:@"name"];
        uint64_t v20 = [v18 objectForKey:@"isRecurring"];
        char v21 = [v20 BOOLValue];

        if (v21)
        {
          uint64_t v22 = (void *)[v18 mutableCopy];
          v23 = [v18 objectForKey:@"time"];
          [v23 doubleValue];
          double v25 = v24;

          v26 = [v18 objectForKey:@"interval"];
          [v26 doubleValue];
          double v28 = v27;

          if (v28 <= 0.0)
          {
            uint64_t v29 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
            [v29 setObject:0 forKey:@"ScheduledEvents"];
            [v29 synchronize];
            [MEMORY[0x1E4F28B00] currentHandler];
            v31 = v33 = v18;
            [v31 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"ATEventScheduler.m", 201, @"found invalid recurrence interval in event %@", v33 object file lineNumber description];
          }
          do
            double v25 = v28 + v25;
          while (v25 < v3);
          v30 = [NSNumber numberWithDouble:v25];
          [v22 setValue:v30 forKey:@"time"];

          [*(id *)(*(void *)(a1 + 32) + 8) setObject:v22 forKey:v19];
        }
        else
        {
          [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:v19];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v15);
  }

  return [*(id *)(a1 + 32) _scheduleNextEvent];
}

- (void)_scheduleNextEvent
{
  if (self->_started)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__ATEventScheduler__scheduleNextEvent__block_invoke;
    block[3] = &unk_1E6B8C468;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

void __38__ATEventScheduler__scheduleNextEvent__block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v28 = 0;
  uint64_t v29 = (double *)&v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  double v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  double v2 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "count"));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(NSObject **)(v3 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__ATEventScheduler__scheduleNextEvent__block_invoke_24;
  block[3] = &unk_1E6B8BF00;
  block[4] = v3;
  uint64_t v20 = &v28;
  char v21 = &v22;
  uint64_t v5 = v2;
  v19 = v5;
  dispatch_sync(v4, block);
  uint64_t v6 = _ATLogCategoryFramework_Oversize();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v33 = v5;
    _os_log_impl(&dword_1D9BC7000, v6, OS_LOG_TYPE_DEFAULT, "Scheduling next event from events: %{public}@", buf, 0xCu);
  }

  if (v23[5])
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
    [v7 timeIntervalSinceReferenceDate];
    double v9 = v8;

    v10 = [(id)v23[5] objectForKey:@"name"];
    double v11 = v29[3];
    if (v11 >= v9) {
      int64_t v12 = (uint64_t)v11 - (uint64_t)v9;
    }
    else {
      int64_t v12 = 0;
    }
    id v13 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v29[3]];
      uint64_t v15 = (uint64_t)v29[3];
      *(_DWORD *)buf = 138544386;
      v33 = v10;
      __int16 v34 = 2114;
      long long v35 = v14;
      __int16 v36 = 2048;
      int64_t v37 = v12;
      __int16 v38 = 2048;
      uint64_t v39 = (uint64_t)v9;
      __int16 v40 = 2048;
      uint64_t v41 = v15;
      _os_log_impl(&dword_1D9BC7000, v13, OS_LOG_TYPE_DEFAULT, "scheduling next event '%{public}@' for %{public}@ (%llds from now) timeIntervalForNow %lld, timeIntervalForNextEvent %lld", buf, 0x34u);
    }
    if (v12)
    {
      xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v16, (const char *)*MEMORY[0x1E4F14170], v12);
      xpc_dictionary_set_string(v16, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
      xpc_dictionary_set_BOOL(v16, (const char *)*MEMORY[0x1E4F14138], 1);
      xpc_dictionary_set_BOOL(v16, (const char *)*MEMORY[0x1E4F14340], 0);
      xpc_dictionary_set_BOOL(v16, (const char *)*MEMORY[0x1E4F142F8], 0);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __38__ATEventScheduler__scheduleNextEvent__block_invoke_26;
      handler[3] = &unk_1E6B8BD98;
      handler[4] = *(void *)(a1 + 32);
      xpc_activity_register("com.apple.atc.events", v16, handler);
    }
    else
    {
      [*(id *)(a1 + 32) _postExpiredEvents];
    }
  }
  else
  {
    xpc_activity_unregister("com.apple.atc.events");
    v10 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BC7000, v10, OS_LOG_TYPE_DEFAULT, "no more events to schedule", buf, 2u);
    }
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
}

void __38__ATEventScheduler__scheduleNextEvent__block_invoke_24(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  double v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 setObject:*(void *)(a1[4] + 8) forKey:@"ScheduledEvents"];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obuint64_t j = [*(id *)(a1[4] + 8) allValues];
  uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        double v8 = [v7 objectForKey:@"time"];
        [v8 doubleValue];
        double v10 = v9;

        double v11 = *(double *)(*(void *)(a1[6] + 8) + 24);
        if (v11 == 0.0 || v10 < v11)
        {
          objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v7);
          *(double *)(*(void *)(a1[6] + 8) + 24) = v10;
          double v11 = *(double *)(*(void *)(a1[6] + 8) + 24);
        }
        id v13 = (void *)a1[5];
        uint64_t v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v11];
        uint64_t v15 = [v7 objectForKey:@"name"];
        [v13 setObject:v14 forKey:v15];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }
}

uint64_t __38__ATEventScheduler__scheduleNextEvent__block_invoke_26(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postExpiredEvents];
}

- (BOOL)hasScheduledEvent:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  int64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  eventAccessQueue = self->_eventAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__ATEventScheduler_hasScheduledEvent___block_invoke;
  block[3] = &unk_1E6B8C528;
  id v9 = v4;
  double v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(eventAccessQueue, block);
  LOBYTE(eventAccessQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)eventAccessQueue;
}

void __38__ATEventScheduler_hasScheduledEvent___block_invoke(void *a1)
{
  double v2 = [*(id *)(a1[4] + 8) objectForKey:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v2 != 0;
}

- (void)removeEvent:(id)a3
{
  id v4 = a3;
  eventAccessQueue = self->_eventAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__ATEventScheduler_removeEvent___block_invoke;
  v7[3] = &unk_1E6B8C5A0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(eventAccessQueue, v7);
}

uint64_t __32__ATEventScheduler_removeEvent___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  double v2 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1D9BC7000, v2, OS_LOG_TYPE_DEFAULT, "removing event '%{public}@'", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 40) + 8) removeObjectForKey:*(void *)(a1 + 32)];
  return [*(id *)(a1 + 40) _scheduleNextEvent];
}

- (void)scheduleRecurringEvent:(id)a3 withInterval:(double)a4 afterDelay:(double)a5 withUserData:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  eventAccessQueue = self->_eventAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__ATEventScheduler_scheduleRecurringEvent_withInterval_afterDelay_withUserData___block_invoke;
  block[3] = &unk_1E6B8BD70;
  double v20 = v13 + a5;
  double v21 = a4;
  id v17 = v10;
  id v18 = v11;
  long long v19 = self;
  id v14 = v11;
  id v15 = v10;
  dispatch_sync(eventAccessQueue, block);
}

void __80__ATEventScheduler_scheduleRecurringEvent_withInterval_afterDelay_withUserData___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  double v2 = objc_opt_new();
  [v2 setObject:*(void *)(a1 + 32) forKey:@"name"];
  uint64_t v3 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
  [v2 setObject:v3 forKey:@"time"];

  [v2 setObject:MEMORY[0x1E4F1CC38] forKey:@"isRecurring"];
  id v4 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
  [v2 setObject:v4 forKey:@"interval"];

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    [v2 setObject:v5 forKey:@"userData"];
  }
  uint64_t v6 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v2;
    _os_log_impl(&dword_1D9BC7000, v6, OS_LOG_TYPE_DEFAULT, "scheduling recurring event %{public}@", (uint8_t *)&v7, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 48) + 8) setObject:v2 forKey:*(void *)(a1 + 32)];
  [*(id *)(a1 + 48) _scheduleNextEvent];
}

- (void)scheduleEvent:(id)a3 afterDelay:(double)a4 withUserData:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  eventAccessQueue = self->_eventAccessQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__ATEventScheduler_scheduleEvent_afterDelay_withUserData___block_invoke;
  v14[3] = &unk_1E6B8BFA0;
  double v18 = v11 + a4;
  id v15 = v8;
  id v16 = v9;
  id v17 = self;
  id v12 = v9;
  id v13 = v8;
  dispatch_sync(eventAccessQueue, v14);
}

void __58__ATEventScheduler_scheduleEvent_afterDelay_withUserData___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  double v2 = objc_opt_new();
  [v2 setObject:*(void *)(a1 + 32) forKey:@"name"];
  uint64_t v3 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
  [v2 setObject:v3 forKey:@"time"];

  [v2 setObject:MEMORY[0x1E4F1CC28] forKey:@"isRecurring"];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    [v2 setObject:v4 forKey:@"userData"];
  }
  uint64_t v5 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    int v7 = v2;
    _os_log_impl(&dword_1D9BC7000, v5, OS_LOG_TYPE_DEFAULT, "scheduling event %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 48) + 8) setObject:v2 forKey:*(void *)(a1 + 32)];
  [*(id *)(a1 + 48) _scheduleNextEvent];
}

- (void)start
{
  self->_started = 1;
  [(ATEventScheduler *)self _scheduleNextEvent];
}

- (ATEventScheduler)init
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)ATEventScheduler;
  double v2 = [(ATEventScheduler *)&v16 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    events = v2->_events;
    v2->_events = (NSMutableDictionary *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("ATNotificationScheduler", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("ATNotificationScheduler - access", 0);
    eventAccessQueue = v2->_eventAccessQueue;
    v2->_eventAccessQueue = (OS_dispatch_queue *)v7;

    v2->_started = 0;
    id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v10 = [v9 objectForKey:@"ScheduledEvents"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [v10 mutableCopy];
      id v12 = v2->_events;
      v2->_events = (NSMutableDictionary *)v11;

      id v13 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = v2->_events;
        *(_DWORD *)buf = 138543362;
        double v18 = v14;
        _os_log_impl(&dword_1D9BC7000, v13, OS_LOG_TYPE_DEFAULT, "loaded saved events %{public}@", buf, 0xCu);
      }
    }
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_436);
  }
  double v2 = (void *)sharedInstance__scheduler;

  return v2;
}

uint64_t __34__ATEventScheduler_sharedInstance__block_invoke()
{
  sharedInstance__scheduler = objc_alloc_init(ATEventScheduler);

  return MEMORY[0x1F41817F8]();
}

@end