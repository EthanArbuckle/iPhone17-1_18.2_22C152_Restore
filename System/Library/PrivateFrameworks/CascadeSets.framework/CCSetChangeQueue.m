@interface CCSetChangeQueue
+ (void)groupSetsByPersonaIdentifier:(id)a3 enumerateGroupsUsingBlock:(id)a4;
- (CCSetChangeQueue)init;
- (id)dequeueAll;
- (void)enqueue:(id)a3;
@end

@implementation CCSetChangeQueue

- (CCSetChangeQueue)init
{
  v9.receiver = self;
  v9.super_class = (Class)CCSetChangeQueue;
  v2 = [(CCSetChangeQueue *)&v9 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    setChanges = v2->_setChanges;
    v2->_setChanges = (NSMutableSet *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.cascade.setChange.queue", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

+ (void)groupSetsByPersonaIdentifier:(id)a3 enumerateGroupsUsingBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  dispatch_queue_t v6 = (void (**)(id, void *, void *))a4;
  if ([v5 count])
  {
    if ([v5 count] == 1)
    {
      v7 = [v5 anyObject];
      v8 = [v7 personaIdentifier];
      objc_super v9 = [MEMORY[0x263EFFA08] setWithObject:v7];
      v6[2](v6, v8, v9);
    }
    else
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      v10 = objc_msgSend(v5, "allObjects", 0);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        v13 = 0;
        uint64_t v14 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v19 != v14) {
              objc_enumerationMutation(v10);
            }
            v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            v17 = [v16 personaIdentifier];
            if (!v17)
            {
              if (!v13) {
                v13 = objc_opt_new();
              }
              [v13 addObject:v16];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v12);
      }
      else
      {
        v13 = 0;
      }

      if ([v13 count]) {
        v6[2](v6, 0, v13);
      }
    }
  }
}

- (id)dequeueAll
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  objc_super v9 = __Block_byref_object_copy__10;
  v10 = __Block_byref_object_dispose__10;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__CCSetChangeQueue_dequeueAll__block_invoke;
  v5[3] = &unk_26527AB10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __30__CCSetChangeQueue_dequeueAll__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(void **)(*(void *)(a1 + 32) + 8);

  return [v5 removeAllObjects];
}

- (void)enqueue:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __28__CCSetChangeQueue_enqueue___block_invoke;
  v7[3] = &unk_265279EE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __28__CCSetChangeQueue_enqueue___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_setChanges, 0);
}

@end