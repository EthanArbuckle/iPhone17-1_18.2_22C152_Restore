@interface HFUpdateLoggerDebuggingController
+ (id)_sharedInstance;
- (HFUpdateLoggerDebuggingController)init;
- (NSHashTable)_queue_runningLoggers;
- (NSMutableDictionary)_queue_historyStringsKeyedByLogger;
- (OS_dispatch_queue)queue;
- (id)_historyStrings;
- (id)_runningLoggerStrings;
- (id)_runningLoggers;
- (int64_t)_queue_iteration;
- (void)_addRunningLogger:(id)a3;
- (void)_removeRunningLogger:(id)a3;
- (void)setQueue:(id)a3;
- (void)set_queue_historyStringsKeyedByLogger:(id)a3;
- (void)set_queue_iteration:(int64_t)a3;
- (void)set_queue_runningLoggers:(id)a3;
@end

@implementation HFUpdateLoggerDebuggingController

- (void)_addRunningLogger:(id)a3
{
  id v4 = a3;
  v5 = [v4 startDate];
  v6 = (void *)[v5 copy];

  v7 = [(HFUpdateLoggerDebuggingController *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__HFUpdateLoggerDebuggingController__addRunningLogger___block_invoke;
  block[3] = &unk_26408D388;
  block[4] = self;
  id v11 = v4;
  id v12 = v6;
  id v8 = v6;
  id v9 = v4;
  dispatch_async(v7, block);
}

void __55__HFUpdateLoggerDebuggingController__addRunningLogger___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "set_queue_iteration:", objc_msgSend(*(id *)(a1 + 32), "_queue_iteration") + 1);
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_runningLoggers");
  [v2 addObject:*(void *)(a1 + 40)];

  id v5 = [NSString stringWithFormat:@"%04d %@: Started %@", objc_msgSend(*(id *)(a1 + 32), "_queue_iteration"), *(void *)(a1 + 48), *(void *)(a1 + 40)];
  v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_historyStringsKeyedByLogger");
  id v4 = [MEMORY[0x263F08D40] valueWithNonretainedObject:*(void *)(a1 + 40)];
  [v3 setObject:v5 forKeyedSubscript:v4];
}

- (int64_t)_queue_iteration
{
  return self->__queue_iteration;
}

- (NSHashTable)_queue_runningLoggers
{
  return self->__queue_runningLoggers;
}

void __58__HFUpdateLoggerDebuggingController__removeRunningLogger___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_runningLoggers");
  [v2 removeObject:*(void *)(a1 + 40)];

  id v8 = [MEMORY[0x263F08D40] valueWithNonretainedObject:*(void *)(a1 + 40)];
  v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_historyStringsKeyedByLogger");
  id v4 = [v3 objectForKeyedSubscript:v8];

  if (v4)
  {
    [*(id *)(a1 + 48) timeIntervalSinceDate:*(void *)(a1 + 56)];
    v6 = objc_msgSend(v4, "stringByAppendingFormat:", @" -> Finished in %fs", v5);
    v7 = objc_msgSend(*(id *)(a1 + 32), "_queue_historyStringsKeyedByLogger");
    [v7 setObject:v6 forKeyedSubscript:v8];
  }
}

- (NSMutableDictionary)_queue_historyStringsKeyedByLogger
{
  return self->__queue_historyStringsKeyedByLogger;
}

- (void)set_queue_iteration:(int64_t)a3
{
  self->__queue_iteration = a3;
}

+ (id)_sharedInstance
{
  if (qword_26AB2F1C8 != -1) {
    dispatch_once(&qword_26AB2F1C8, &__block_literal_global_115);
  }
  v2 = (void *)_MergedGlobals_265;
  return v2;
}

- (void)_removeRunningLogger:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 startDate];
  v6 = (void *)[v5 copy];

  v7 = [MEMORY[0x263EFF910] date];
  id v8 = [(HFUpdateLoggerDebuggingController *)self queue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__HFUpdateLoggerDebuggingController__removeRunningLogger___block_invoke;
  v12[3] = &unk_26408D478;
  v12[4] = self;
  id v13 = v4;
  id v14 = v7;
  id v15 = v6;
  id v9 = v6;
  id v10 = v7;
  id v11 = v4;
  dispatch_async(v8, v12);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

uint64_t __52__HFUpdateLoggerDebuggingController__sharedInstance__block_invoke()
{
  _MergedGlobals_265 = objc_alloc_init(HFUpdateLoggerDebuggingController);
  return MEMORY[0x270F9A758]();
}

- (HFUpdateLoggerDebuggingController)init
{
  v12.receiver = self;
  v12.super_class = (Class)HFUpdateLoggerDebuggingController;
  v2 = [(HFUpdateLoggerDebuggingController *)&v12 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.Home.HFUpdateLoggerDebuggingController", 0);
    [(HFUpdateLoggerDebuggingController *)v2 setQueue:v3];

    id v4 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    [(HFUpdateLoggerDebuggingController *)v2 set_queue_runningLoggers:v4];

    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(HFUpdateLoggerDebuggingController *)v2 set_queue_historyStringsKeyedByLogger:v5];

    [(HFUpdateLoggerDebuggingController *)v2 set_queue_iteration:0];
    objc_initWeak(&location, v2);
    v6 = +[HFDebugStateDumpManager sharedInstance];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __41__HFUpdateLoggerDebuggingController_init__block_invoke;
    v9[3] = &unk_26408CBE8;
    objc_copyWeak(&v10, &location);
    id v7 = (id)[v6 registerStateDumpHandler:v9 withName:@"HFRunningUpdateLoggers"];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)set_queue_runningLoggers:(id)a3
{
}

- (void)set_queue_historyStringsKeyedByLogger:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

id __41__HFUpdateLoggerDebuggingController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_queue_t v3 = [WeakRetained _runningLoggerStrings];
  }
  else
  {
    dispatch_queue_t v3 = (void *)MEMORY[0x263EFFA78];
  }

  return v3;
}

- (id)_runningLoggers
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__16;
  id v11 = __Block_byref_object_dispose__16;
  id v12 = 0;
  dispatch_queue_t v3 = [(HFUpdateLoggerDebuggingController *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__HFUpdateLoggerDebuggingController__runningLoggers__block_invoke;
  v6[3] = &unk_26408FE10;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __52__HFUpdateLoggerDebuggingController__runningLoggers__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_runningLoggers");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_runningLoggerStrings
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__16;
  id v11 = __Block_byref_object_dispose__16;
  id v12 = 0;
  uint64_t v3 = [(HFUpdateLoggerDebuggingController *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__HFUpdateLoggerDebuggingController__runningLoggerStrings__block_invoke;
  v6[3] = &unk_2640962C8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __58__HFUpdateLoggerDebuggingController__runningLoggerStrings__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_runningLoggers");
  uint64_t v3 = [v2 allObjects];
  id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_18_4);

  id v5 = objc_msgSend(*(id *)(a1 + 32), "_queue_historyStringsKeyedByLogger");
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__HFUpdateLoggerDebuggingController__runningLoggerStrings__block_invoke_3;
  v11[3] = &unk_2640962A0;
  id v12 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "na_filter:", v11);
  uint64_t v8 = [v7 allValues];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

uint64_t __58__HFUpdateLoggerDebuggingController__runningLoggerStrings__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F08D40] valueWithNonretainedObject:a2];
}

uint64_t __58__HFUpdateLoggerDebuggingController__runningLoggerStrings__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (id)_historyStrings
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__16;
  id v11 = __Block_byref_object_dispose__16;
  id v12 = 0;
  uint64_t v3 = [(HFUpdateLoggerDebuggingController *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__HFUpdateLoggerDebuggingController__historyStrings__block_invoke;
  v6[3] = &unk_26408FE10;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __52__HFUpdateLoggerDebuggingController__historyStrings__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_historyStringsKeyedByLogger");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v6 allValues];
  uint64_t v3 = [v2 sortedArrayUsingSelector:sel_compare_];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__queue_historyStringsKeyedByLogger, 0);
  objc_storeStrong((id *)&self->__queue_runningLoggers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end