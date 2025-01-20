@interface CALNInMemoryTimeToLeaveRefreshStorage
- (CALNInMemoryTimeToLeaveRefreshStorage)init;
- (NSMutableDictionary)refreshDateMap;
- (OS_dispatch_queue)workQueue;
- (id)refreshDateWithIdentifier:(id)a3;
- (id)refreshDates;
- (void)addRefreshDate:(id)a3 withIdentifier:(id)a4;
- (void)removeRefreshDateWithIdentifier:(id)a3;
- (void)removeRefreshDates;
@end

@implementation CALNInMemoryTimeToLeaveRefreshStorage

- (CALNInMemoryTimeToLeaveRefreshStorage)init
{
  v9.receiver = self;
  v9.super_class = (Class)CALNInMemoryTimeToLeaveRefreshStorage;
  v2 = [(CALNInMemoryTimeToLeaveRefreshStorage *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.calendar.notification.inMemoryTimeToLeaveRefreshStorage.work", v3);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
    refreshDateMap = v2->_refreshDateMap;
    v2->_refreshDateMap = (NSMutableDictionary *)v6;
  }
  return v2;
}

- (id)refreshDates
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__7;
  v11 = __Block_byref_object_dispose__7;
  id v12 = 0;
  v3 = [(CALNInMemoryTimeToLeaveRefreshStorage *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__CALNInMemoryTimeToLeaveRefreshStorage_refreshDates__block_invoke;
  v6[3] = &unk_2645C0FA8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __53__CALNInMemoryTimeToLeaveRefreshStorage_refreshDates__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) refreshDateMap];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)addRefreshDate:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CALNInMemoryTimeToLeaveRefreshStorage *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__CALNInMemoryTimeToLeaveRefreshStorage_addRefreshDate_withIdentifier___block_invoke;
  block[3] = &unk_2645C0E60;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, block);
}

void __71__CALNInMemoryTimeToLeaveRefreshStorage_addRefreshDate_withIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) refreshDateMap];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (id)refreshDateWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__7;
  v16 = __Block_byref_object_dispose__7;
  id v17 = 0;
  id v5 = [(CALNInMemoryTimeToLeaveRefreshStorage *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__CALNInMemoryTimeToLeaveRefreshStorage_refreshDateWithIdentifier___block_invoke;
  block[3] = &unk_2645C0E10;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __67__CALNInMemoryTimeToLeaveRefreshStorage_refreshDateWithIdentifier___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) refreshDateMap];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)removeRefreshDateWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNInMemoryTimeToLeaveRefreshStorage *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__CALNInMemoryTimeToLeaveRefreshStorage_removeRefreshDateWithIdentifier___block_invoke;
  v7[3] = &unk_2645C0DC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __73__CALNInMemoryTimeToLeaveRefreshStorage_removeRefreshDateWithIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) refreshDateMap];
  [v2 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (void)removeRefreshDates
{
  uint64_t v3 = [(CALNInMemoryTimeToLeaveRefreshStorage *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__CALNInMemoryTimeToLeaveRefreshStorage_removeRefreshDates__block_invoke;
  block[3] = &unk_2645C0D98;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __59__CALNInMemoryTimeToLeaveRefreshStorage_removeRefreshDates__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) refreshDateMap];
  [v1 removeAllObjects];
}

- (NSMutableDictionary)refreshDateMap
{
  return self->_refreshDateMap;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_refreshDateMap, 0);
}

@end