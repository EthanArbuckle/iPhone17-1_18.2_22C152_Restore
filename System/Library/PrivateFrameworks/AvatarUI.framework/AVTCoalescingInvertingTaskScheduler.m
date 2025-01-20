@interface AVTCoalescingInvertingTaskScheduler
- (AVTCoalescingInvertingTaskScheduler)initWithBackingScheduler:(id)a3 coalescingQueue:(id)a4 delay:(double)a5 environment:(id)a6;
- (AVTTaskScheduler)backingScheduler;
- (NSMutableArray)tasks;
- (OS_dispatch_queue)coalescingQueue;
- (OS_dispatch_queue)stateLock;
- (double)coalesingDelay;
- (void)cancelAllTasks;
- (void)cancelTask:(id)a3;
- (void)performStateWork:(id)a3;
- (void)scheduleTask:(id)a3;
- (void)startTasksFrom:(id)a3;
@end

@implementation AVTCoalescingInvertingTaskScheduler

- (AVTCoalescingInvertingTaskScheduler)initWithBackingScheduler:(id)a3 coalescingQueue:(id)a4 delay:(double)a5 environment:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)AVTCoalescingInvertingTaskScheduler;
  v14 = [(AVTCoalescingInvertingTaskScheduler *)&v21 init];
  if (v14)
  {
    uint64_t v15 = [MEMORY[0x263EFF980] array];
    tasks = v14->_tasks;
    v14->_tasks = (NSMutableArray *)v15;

    objc_storeStrong((id *)&v14->_coalescingQueue, a4);
    v14->_coalesingDelay = a5;
    v17 = [v13 lockProvider];
    uint64_t v18 = ((void (**)(void, const char *))v17)[2](v17, "com.apple.AvatarUI.AVTCoalescingInvertingScheduler.stateLock");
    stateLock = v14->_stateLock;
    v14->_stateLock = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v14->_backingScheduler, a3);
  }

  return v14;
}

- (void)performStateWork:(id)a3
{
  id v4 = a3;
  v5 = [(AVTCoalescingInvertingTaskScheduler *)self stateLock];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__AVTCoalescingInvertingTaskScheduler_performStateWork___block_invoke;
  v7[3] = &unk_263FF02C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __56__AVTCoalescingInvertingTaskScheduler_performStateWork___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) tasks];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)scheduleTask:(id)a3
{
  id v4 = (void *)MEMORY[0x210530210](a3, a2);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__AVTCoalescingInvertingTaskScheduler_scheduleTask___block_invoke;
  v12[3] = &unk_263FF0698;
  id v5 = v4;
  id v13 = v5;
  [(AVTCoalescingInvertingTaskScheduler *)self performStateWork:v12];
  [(AVTCoalescingInvertingTaskScheduler *)self coalesingDelay];
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
  id v8 = [(AVTCoalescingInvertingTaskScheduler *)self coalescingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__AVTCoalescingInvertingTaskScheduler_scheduleTask___block_invoke_2;
  block[3] = &unk_263FF06C0;
  block[4] = self;
  id v11 = v5;
  id v9 = v5;
  dispatch_after(v7, v8, block);
}

void __52__AVTCoalescingInvertingTaskScheduler_scheduleTask___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = (id)MEMORY[0x210530210](v2);
  [v3 insertObject:v4 atIndex:0];
}

uint64_t __52__AVTCoalescingInvertingTaskScheduler_scheduleTask___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) startTasksFrom:*(void *)(a1 + 40)];
}

- (void)startTasksFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3;
  v23 = __Block_byref_object_dispose__3;
  id v24 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __54__AVTCoalescingInvertingTaskScheduler_startTasksFrom___block_invoke;
  v16[3] = &unk_263FF06E8;
  id v5 = v4;
  id v17 = v5;
  uint64_t v18 = &v19;
  [(AVTCoalescingInvertingTaskScheduler *)self performStateWork:v16];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = (id)v20[5];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        id v11 = [(AVTCoalescingInvertingTaskScheduler *)self backingScheduler];
        [v11 scheduleTask:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v25 count:16];
    }
    while (v7);
  }

  _Block_object_dispose(&v19, 8);
}

void __54__AVTCoalescingInvertingTaskScheduler_startTasksFrom___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = (void *)MEMORY[0x210530210](*(void *)(a1 + 32));
  int v4 = [v8 containsObject:v3];

  if (v4)
  {
    uint64_t v5 = [v8 copy];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [v8 removeAllObjects];
  }
}

- (void)cancelAllTasks
{
  [(AVTCoalescingInvertingTaskScheduler *)self performStateWork:&__block_literal_global_2];
  id v3 = [(AVTCoalescingInvertingTaskScheduler *)self backingScheduler];
  [v3 cancelAllTasks];
}

uint64_t __53__AVTCoalescingInvertingTaskScheduler_cancelAllTasks__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeAllObjects];
}

- (void)cancelTask:(id)a3
{
}

- (NSMutableArray)tasks
{
  return self->_tasks;
}

- (OS_dispatch_queue)coalescingQueue
{
  return self->_coalescingQueue;
}

- (OS_dispatch_queue)stateLock
{
  return self->_stateLock;
}

- (AVTTaskScheduler)backingScheduler
{
  return self->_backingScheduler;
}

- (double)coalesingDelay
{
  return self->_coalesingDelay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingScheduler, 0);
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_coalescingQueue, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
}

@end