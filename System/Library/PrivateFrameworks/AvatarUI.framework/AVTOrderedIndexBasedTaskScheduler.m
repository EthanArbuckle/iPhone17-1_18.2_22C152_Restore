@interface AVTOrderedIndexBasedTaskScheduler
+ (id)indexesForReadyTasksToRunGivenScheduledTasks:(id)a3 order:(id)a4 readyTasks:(id)a5 readyRowIndex:(id)a6;
+ (id)rowBaseIndexForIndex:(id)a3;
- (AVTOrderedIndexBasedTaskScheduler)initWithEnvironment:(id)a3;
- (NSMutableArray)scheduledTasksOrder;
- (NSMutableDictionary)readyTasks;
- (NSMutableDictionary)scheduledTasks;
- (OS_dispatch_queue)stateLock;
- (void)cancelAllTasks;
- (void)cancelTask:(id)a3;
- (void)performStateWork:(id)a3;
- (void)scheduleTask:(id)a3 forIndex:(unint64_t)a4;
- (void)taskReady:(id)a3 forIndex:(unint64_t)a4;
@end

@implementation AVTOrderedIndexBasedTaskScheduler

- (AVTOrderedIndexBasedTaskScheduler)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AVTOrderedIndexBasedTaskScheduler;
  v5 = [(AVTOrderedIndexBasedTaskScheduler *)&v16 init];
  if (v5)
  {
    v6 = [v4 lockProvider];
    uint64_t v7 = ((void (**)(void, const char *))v6)[2](v6, "com.apple.AvatarUI.AVTOrderedIndexBasedScheduler.stateLock");
    stateLock = v5->_stateLock;
    v5->_stateLock = (OS_dispatch_queue *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    scheduledTasks = v5->_scheduledTasks;
    v5->_scheduledTasks = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    readyTasks = v5->_readyTasks;
    v5->_readyTasks = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x263EFF980] array];
    scheduledTasksOrder = v5->_scheduledTasksOrder;
    v5->_scheduledTasksOrder = (NSMutableArray *)v13;
  }
  return v5;
}

- (void)performStateWork:(id)a3
{
  id v4 = a3;
  v5 = [(AVTOrderedIndexBasedTaskScheduler *)self stateLock];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__AVTOrderedIndexBasedTaskScheduler_performStateWork___block_invoke;
  v7[3] = &unk_263FF02C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __54__AVTOrderedIndexBasedTaskScheduler_performStateWork___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) scheduledTasks];
  v3 = [*(id *)(a1 + 32) scheduledTasksOrder];
  id v4 = [*(id *)(a1 + 32) readyTasks];
  (*(void (**)(uint64_t, id, void *, void *))(v2 + 16))(v2, v5, v3, v4);
}

- (void)scheduleTask:(id)a3 forIndex:(unint64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__AVTOrderedIndexBasedTaskScheduler_scheduleTask_forIndex___block_invoke;
  v8[3] = &unk_263FF2A00;
  id v9 = v6;
  unint64_t v10 = a4;
  id v7 = v6;
  [(AVTOrderedIndexBasedTaskScheduler *)self performStateWork:v8];
}

void __59__AVTOrderedIndexBasedTaskScheduler_scheduleTask_forIndex___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = NSNumber;
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = a4;
  id v10 = a3;
  id v11 = a2;
  v12 = [v7 numberWithUnsignedInteger:v8];
  [v11 removeObjectForKey:v12];

  uint64_t v13 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  [v10 removeObject:v13];

  v14 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  [v9 removeObjectForKey:v14];

  v15 = (void *)[*(id *)(a1 + 32) copy];
  objc_super v16 = (void *)MEMORY[0x210530210]();
  v17 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  [v11 setObject:v16 forKey:v17];

  id v18 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  [v10 addObject:v18];
}

- (void)taskReady:(id)a3 forIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x263EFF980] array];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:a4];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __56__AVTOrderedIndexBasedTaskScheduler_taskReady_forIndex___block_invoke;
  v15 = &unk_263FF2A50;
  id v16 = v8;
  v17 = self;
  id v18 = v7;
  id v19 = v6;
  id v9 = v7;
  id v10 = v6;
  id v11 = v8;
  [(AVTOrderedIndexBasedTaskScheduler *)self performStateWork:&v12];
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", &__block_literal_global_30, v12, v13, v14, v15);
}

void __56__AVTOrderedIndexBasedTaskScheduler_taskReady_forIndex___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v7 objectForKey:*(void *)(a1 + 32)];
  id v11 = (void *)v10;
  if (v10 && *(void *)(a1 + 56) == v10)
  {
    uint64_t v12 = (void *)MEMORY[0x210530210](v10);
    [v9 setObject:v12 forKey:*(void *)(a1 + 32)];

    uint64_t v13 = [(id)objc_opt_class() rowBaseIndexForIndex:*(void *)(a1 + 32)];
    v14 = [(id)objc_opt_class() indexesForReadyTasksToRunGivenScheduledTasks:v7 order:v8 readyTasks:v9 readyRowIndex:v13];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __56__AVTOrderedIndexBasedTaskScheduler_taskReady_forIndex___block_invoke_2;
    v15[3] = &unk_263FF2A28;
    id v16 = *(id *)(a1 + 48);
    id v17 = v9;
    id v18 = v7;
    id v19 = v8;
    [v14 enumerateObjectsUsingBlock:v15];
  }
}

void __56__AVTOrderedIndexBasedTaskScheduler_taskReady_forIndex___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v7 = a2;
  id v5 = [v4 objectForKeyedSubscript:v7];
  id v6 = (void *)MEMORY[0x210530210]();
  [v3 addObject:v6];

  [*(id *)(a1 + 48) removeObjectForKey:v7];
  [*(id *)(a1 + 40) removeObjectForKey:v7];
  [*(id *)(a1 + 56) removeObject:v7];
}

uint64_t __56__AVTOrderedIndexBasedTaskScheduler_taskReady_forIndex___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void *))(a2 + 16))(a2, &__block_literal_global_8_0);
}

+ (id)indexesForReadyTasksToRunGivenScheduledTasks:(id)a3 order:(id)a4 readyTasks:(id)a5 readyRowIndex:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (![v12 count]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"This should only be called when we have ready tasks"];
  }
  v14 = [v12 allKeys];
  v15 = [v14 sortedArrayUsingSelector:sel_compare_];

  if ([v10 count])
  {
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __113__AVTOrderedIndexBasedTaskScheduler_indexesForReadyTasksToRunGivenScheduledTasks_order_readyTasks_readyRowIndex___block_invoke;
    v33[3] = &unk_263FF2A98;
    id v35 = a1;
    id v16 = v13;
    id v34 = v16;
    if ([v11 indexOfObjectPassingTest:v33] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v29 = v13;
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __113__AVTOrderedIndexBasedTaskScheduler_indexesForReadyTasksToRunGivenScheduledTasks_order_readyTasks_readyRowIndex___block_invoke_2;
      v30[3] = &unk_263FF2A98;
      id v32 = a1;
      id v31 = v16;
      id v17 = [v11 indexesOfObjectsPassingTest:v30];
      id v18 = [v11 objectsAtIndexes:v17];
      id v19 = [v18 sortedArrayUsingSelector:sel_compare_];
      v20 = [v19 firstObject];

      v21 = [v12 objectForKey:v20];

      if (v21)
      {
        v22 = [v11 sortedArrayUsingSelector:sel_compare_];
        v23 = [MEMORY[0x263EFF980] arrayWithObject:v20];
        for (unint64_t i = [v22 indexOfObject:v20] + 1; i < objc_msgSend(v22, "count"); ++i)
        {
          v25 = [v22 objectAtIndexedSubscript:i];
          v26 = [v12 objectForKey:v25];

          if (!v26)
          {

            break;
          }
          [v23 addObject:v25];
        }
        id v27 = (id)[v23 copy];
      }
      else
      {
        id v27 = (id)MEMORY[0x263EFFA68];
      }
      id v13 = v29;
    }
    else
    {
      id v27 = (id)MEMORY[0x263EFFA68];
    }
  }
  else
  {
    id v27 = v15;
  }

  return v27;
}

BOOL __113__AVTOrderedIndexBasedTaskScheduler_indexesForReadyTasksToRunGivenScheduledTasks_order_readyTasks_readyRowIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [(id)objc_opt_class() rowBaseIndexForIndex:v6];

  uint64_t v8 = [v7 compare:*(void *)(a1 + 32)];
  if (!v8) {
    *a4 = 1;
  }
  return v8 == -1;
}

uint64_t __113__AVTOrderedIndexBasedTaskScheduler_indexesForReadyTasksToRunGivenScheduledTasks_order_readyTasks_readyRowIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [(id)objc_opt_class() rowBaseIndexForIndex:v3];

  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];
  return v5;
}

+ (id)rowBaseIndexForIndex:(id)a3
{
  id v3 = NSNumber;
  unint64_t v4 = 3 * ([a3 unsignedIntegerValue] / 3uLL);
  return (id)[v3 numberWithUnsignedInteger:v4];
}

- (void)cancelAllTasks
{
}

void __51__AVTOrderedIndexBasedTaskScheduler_cancelAllTasks__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v6 = a2;
  [a3 removeAllObjects];
  [v6 removeAllObjects];

  [v7 removeAllObjects];
}

- (void)cancelTask:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__AVTOrderedIndexBasedTaskScheduler_cancelTask___block_invoke;
  v6[3] = &unk_263FF2B30;
  id v7 = v4;
  id v5 = v4;
  [(AVTOrderedIndexBasedTaskScheduler *)self performStateWork:v6];
}

void __48__AVTOrderedIndexBasedTaskScheduler_cancelTask___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __48__AVTOrderedIndexBasedTaskScheduler_cancelTask___block_invoke_2;
  v13[3] = &unk_263FF2B08;
  id v14 = *(id *)(a1 + 32);
  id v9 = a2;
  id v10 = (void (**)(void, void))MEMORY[0x210530210](v13);
  id v11 = ((void (**)(void, id))v10)[2](v10, v9);

  if (v11) {
    [v7 removeObject:v11];
  }
  id v12 = (id)((uint64_t (*)(void, id))v10[2])(v10, v8);
}

id __48__AVTOrderedIndexBasedTaskScheduler_cancelTask___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__AVTOrderedIndexBasedTaskScheduler_cancelTask___block_invoke_3;
  v8[3] = &unk_263FF2AE0;
  id v9 = *(id *)(a1 + 32);
  id v4 = [v3 keysOfEntriesPassingTest:v8];
  id v5 = [v4 anyObject];

  if (v5)
  {
    [v3 removeObjectForKey:v5];
    id v6 = v5;
  }

  return v5;
}

uint64_t __48__AVTOrderedIndexBasedTaskScheduler_cancelTask___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = (void *)MEMORY[0x210530210](v5);
  uint64_t v8 = [v6 isEqual:v7];

  if (v8) {
    *a4 = 1;
  }
  return v8;
}

- (NSMutableDictionary)scheduledTasks
{
  return self->_scheduledTasks;
}

- (NSMutableArray)scheduledTasksOrder
{
  return self->_scheduledTasksOrder;
}

- (NSMutableDictionary)readyTasks
{
  return self->_readyTasks;
}

- (OS_dispatch_queue)stateLock
{
  return self->_stateLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_readyTasks, 0);
  objc_storeStrong((id *)&self->_scheduledTasksOrder, 0);
  objc_storeStrong((id *)&self->_scheduledTasks, 0);
}

@end