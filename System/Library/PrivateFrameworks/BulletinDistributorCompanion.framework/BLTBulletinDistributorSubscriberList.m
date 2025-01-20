@interface BLTBulletinDistributorSubscriberList
- (BLTBulletinDistributorSubscriberList)init;
- (BOOL)hasSubscribersForSectionID:(id)a3;
- (NSMutableArray)subscribers;
- (OS_dispatch_queue)queue;
- (id)subscribedSectionIDs;
- (void)_removeSubscribersWithMachServiceName:(id)a3 exceptFor:(id)a4;
- (void)addSubscriber:(id)a3;
- (void)pingWithBulletin:(id)a3 ack:(id)a4;
- (void)pingWithRecordID:(id)a3 forSectionID:(id)a4;
- (void)removeSubscriber:(id)a3;
- (void)setSubscribers:(id)a3;
- (void)subscriber:(id)a3 subscribedWithMachServiceName:(id)a4;
@end

@implementation BLTBulletinDistributorSubscriberList

- (BLTBulletinDistributorSubscriberList)init
{
  v9.receiver = self;
  v9.super_class = (Class)BLTBulletinDistributorSubscriberList;
  v2 = [(BLTBulletinDistributorSubscriberList *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    subscribers = v2->_subscribers;
    v2->_subscribers = (NSMutableArray *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.bulletindistributor.subscriberlist", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (void)addSubscriber:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__BLTBulletinDistributorSubscriberList_addSubscriber___block_invoke;
  v7[3] = &unk_264683BB0;
  id v8 = v4;
  objc_super v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __54__BLTBulletinDistributorSubscriberList_addSubscriber___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = blt_general_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) machServiceName];
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_222F4C000, v2, OS_LOG_TYPE_INFO, "Adding subscriber with machServiceName %@", (uint8_t *)&v7, 0xCu);
  }
  id v4 = *(void **)(a1 + 40);
  v5 = [*(id *)(a1 + 32) machServiceName];
  [v4 _removeSubscribersWithMachServiceName:v5 exceptFor:*(void *)(a1 + 32)];

  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  return [*(id *)(*(void *)(a1 + 40) + 8) addObject:*(void *)(a1 + 32)];
}

- (void)removeSubscriber:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__BLTBulletinDistributorSubscriberList_removeSubscriber___block_invoke;
  v7[3] = &unk_264683BB0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __57__BLTBulletinDistributorSubscriberList_removeSubscriber___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) machServiceName];

  if (!v2)
  {
    [*(id *)(a1 + 32) setDelegate:0];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(*(void *)(a1 + 40) + 8);
    [v4 removeObject:v3];
  }
}

- (void)pingWithBulletin:(id)a3 ack:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__BLTBulletinDistributorSubscriberList_pingWithBulletin_ack___block_invoke;
  block[3] = &unk_264683E50;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __61__BLTBulletinDistributorSubscriberList_pingWithBulletin_ack___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1[4] + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "pingWithBulletin:ack:", a1[5], a1[6], (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)pingWithRecordID:(id)a3 forSectionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__BLTBulletinDistributorSubscriberList_pingWithRecordID_forSectionID___block_invoke;
  block[3] = &unk_264683E78;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __70__BLTBulletinDistributorSubscriberList_pingWithRecordID_forSectionID___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1[4] + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "pingWithRecordID:forSectionID:", a1[5], a1[6], (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)subscribedSectionIDs
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x3032000000;
  long long v10 = __Block_byref_object_copy__10;
  v11 = __Block_byref_object_dispose__10;
  id v12 = [MEMORY[0x263EFF9C0] set];
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__BLTBulletinDistributorSubscriberList_subscribedSectionIDs__block_invoke;
  v6[3] = &unk_264685790;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __60__BLTBulletinDistributorSubscriberList_subscribedSectionIDs__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        long long v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "sectionIDs", (void)v9);
        [v7 unionSet:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (BOOL)hasSubscribersForSectionID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__BLTBulletinDistributorSubscriberList_hasSubscribersForSectionID___block_invoke;
  block[3] = &unk_2646857B8;
  block[4] = self;
  id v9 = v4;
  long long v10 = &v11;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(v4) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __67__BLTBulletinDistributorSubscriberList_hasSubscribersForSectionID___block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1[4] + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "sectionIDs", (void)v9);
        int v8 = [v7 containsObject:a1[5]];

        if (v8)
        {
          *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)subscriber:(id)a3 subscribedWithMachServiceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__BLTBulletinDistributorSubscriberList_subscriber_subscribedWithMachServiceName___block_invoke;
  block[3] = &unk_264683E78;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(queue, block);
}

uint64_t __81__BLTBulletinDistributorSubscriberList_subscriber_subscribedWithMachServiceName___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeSubscribersWithMachServiceName:*(void *)(a1 + 40) exceptFor:*(void *)(a1 + 48)];
}

- (void)_removeSubscribersWithMachServiceName:(id)a3 exceptFor:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    int v8 = [MEMORY[0x263EFF980] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v17 = self;
    id v9 = self->_subscribers;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(id *)(*((void *)&v18 + 1) + 8 * v13);
          if (v14 != v7)
          {
            v15 = [*(id *)(*((void *)&v18 + 1) + 8 * v13) machServiceName];
            int v16 = [v15 isEqualToString:v6];

            if (v16)
            {
              [v8 addObject:v14];
              [v14 setDelegate:0];
            }
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    [(NSMutableArray *)v17->_subscribers removeObjectsInArray:v8];
  }
}

- (NSMutableArray)subscribers
{
  return self->_subscribers;
}

- (void)setSubscribers:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
}

@end