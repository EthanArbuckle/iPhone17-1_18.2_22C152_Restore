@interface CALNInMemoryTriggeredEventNotificationDataStorage
- (CALNInMemoryTriggeredEventNotificationDataStorage)init;
- (NSMutableDictionary)notificationDataMap;
- (OS_dispatch_queue)workQueue;
- (id)notificationData;
- (id)notificationDataWithIdentifier:(id)a3;
- (void)addNotificationData:(id)a3 withIdentifier:(id)a4;
- (void)removeNotificationData;
- (void)removeNotificationDataWithIdentifier:(id)a3;
@end

@implementation CALNInMemoryTriggeredEventNotificationDataStorage

- (CALNInMemoryTriggeredEventNotificationDataStorage)init
{
  v9.receiver = self;
  v9.super_class = (Class)CALNInMemoryTriggeredEventNotificationDataStorage;
  v2 = [(CALNInMemoryTriggeredEventNotificationDataStorage *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.calendar.notification.inMemoryTriggeredEventNotificationDataStorage.work", v3);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
    notificationDataMap = v2->_notificationDataMap;
    v2->_notificationDataMap = (NSMutableDictionary *)v6;
  }
  return v2;
}

- (id)notificationData
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  v3 = [(CALNInMemoryTriggeredEventNotificationDataStorage *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__CALNInMemoryTriggeredEventNotificationDataStorage_notificationData__block_invoke;
  v6[3] = &unk_2645C0FA8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __69__CALNInMemoryTriggeredEventNotificationDataStorage_notificationData__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) notificationDataMap];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)addNotificationData:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CALNInMemoryTriggeredEventNotificationDataStorage *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__CALNInMemoryTriggeredEventNotificationDataStorage_addNotificationData_withIdentifier___block_invoke;
  block[3] = &unk_2645C0E60;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, block);
}

void __88__CALNInMemoryTriggeredEventNotificationDataStorage_addNotificationData_withIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) notificationDataMap];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (id)notificationDataWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  id v5 = [(CALNInMemoryTriggeredEventNotificationDataStorage *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__CALNInMemoryTriggeredEventNotificationDataStorage_notificationDataWithIdentifier___block_invoke;
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

void __84__CALNInMemoryTriggeredEventNotificationDataStorage_notificationDataWithIdentifier___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) notificationDataMap];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)removeNotificationDataWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNInMemoryTriggeredEventNotificationDataStorage *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __90__CALNInMemoryTriggeredEventNotificationDataStorage_removeNotificationDataWithIdentifier___block_invoke;
  v7[3] = &unk_2645C0DC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __90__CALNInMemoryTriggeredEventNotificationDataStorage_removeNotificationDataWithIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) notificationDataMap];
  [v2 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (void)removeNotificationData
{
  uint64_t v3 = [(CALNInMemoryTriggeredEventNotificationDataStorage *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__CALNInMemoryTriggeredEventNotificationDataStorage_removeNotificationData__block_invoke;
  block[3] = &unk_2645C0D98;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __75__CALNInMemoryTriggeredEventNotificationDataStorage_removeNotificationData__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) notificationDataMap];
  [v1 removeAllObjects];
}

- (NSMutableDictionary)notificationDataMap
{
  return self->_notificationDataMap;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_notificationDataMap, 0);
}

@end