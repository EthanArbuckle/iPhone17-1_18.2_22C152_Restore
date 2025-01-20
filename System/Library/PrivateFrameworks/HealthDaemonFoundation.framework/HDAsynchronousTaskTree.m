@interface HDAsynchronousTaskTree
- (HDAsynchronousTaskTree)initWithDescription:(id)a3 completion:(id)a4;
- (NSArray)allErrors;
- (NSString)groupDescription;
- (id)description;
- (void)_addTask:(void *)a3 queue:;
- (void)_completeCurrentTaskWithResult:(void *)a3 error:;
- (void)_lock_beginNextTask;
- (void)_lock_insertPendingSubtasks;
- (void)_lock_reportResult:(uint64_t)a1;
- (void)_runPendingCheckpointTasks:(void *)a3 completion:;
- (void)addCheckpointTask:(id)a3;
- (void)addCheckpointTaskOnQueue:(id)a3 task:(id)a4;
- (void)addTask:(id)a3;
- (void)addTaskOnQueue:(id)a3 task:(id)a4;
- (void)addTaskOnQueue:(id)a3 timeout:(double)a4 task:(id)a5;
- (void)addTaskWithTimeout:(double)a3 task:(id)a4;
- (void)begin;
- (void)cancel;
@end

@implementation HDAsynchronousTaskTree

- (HDAsynchronousTaskTree)initWithDescription:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HDAsynchronousTaskTree;
  v8 = [(HDAsynchronousTaskTree *)&v22 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    groupDescription = v8->_groupDescription;
    v8->_groupDescription = (NSString *)v9;

    v8->_lock._os_unfair_lock_opaque = 0;
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    lock_pendingTasks = v8->_lock_pendingTasks;
    v8->_lock_pendingTasks = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    lock_pendingSubtasks = v8->_lock_pendingSubtasks;
    v8->_lock_pendingSubtasks = v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    lock_taskErrors = v8->_lock_taskErrors;
    v8->_lock_taskErrors = v15;

    *(_WORD *)&v8->_lock_started = 0;
    uint64_t v17 = [v7 copy];
    id lock_completion = v8->_lock_completion;
    v8->_id lock_completion = (id)v17;

    uint64_t v19 = HKCreateSerialUtilityDispatchQueue();
    default_task_queue = v8->_default_task_queue;
    v8->_default_task_queue = (OS_dispatch_queue *)v19;
  }
  return v8;
}

- (void)addTask:(id)a3
{
}

- (void)addTaskOnQueue:(id)a3 task:(id)a4
{
}

- (void)addTaskWithTimeout:(double)a3 task:(id)a4
{
}

- (void)addTaskOnQueue:(id)a3 timeout:(double)a4 task:(id)a5
{
  id v16 = a3;
  id v9 = a5;
  if (v16)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HDAsynchronousTaskTree.m", 80, @"Invalid parameter not satisfying: %@", @"queue != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v14 = [MEMORY[0x263F08690] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"HDAsynchronousTaskTree.m", 81, @"Invalid parameter not satisfying: %@", @"handler != nil" object file lineNumber description];

LABEL_3:
  unsigned __int8 v10 = atomic_load((unsigned __int8 *)&self->_rejectAddTask);
  if (v10)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"HDAsynchronousTaskTree.m" lineNumber:82 description:@"Cannot add task if the task tree is rejecting addTask calls"];
  }
  v11 = objc_alloc_init(HDAsynchronousTask);
  -[HDAsynchronousTask setQueue:]((uint64_t)v11, v16);
  if (v11)
  {
    objc_setProperty_nonatomic_copy(v11, v12, v9, 16);
    v11->_timeout = a4;
    v11->_hasTimeout = a4 > 0.0;
  }
  -[HDAsynchronousTaskTree _addTask:queue:]((uint64_t)self, v11, v16);
}

- (void)_addTask:(void *)a3 queue:
{
  id v8 = a2;
  id v5 = a3;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    unsigned __int8 v6 = atomic_load((unsigned __int8 *)(a1 + 40));
    if ((v6 & 1) == 0 && !*(unsigned char *)(a1 + 43))
    {
      uint64_t v7 = 24;
      if (!*(unsigned char *)(a1 + 42)) {
        uint64_t v7 = 16;
      }
      [*(id *)(a1 + v7) addObject:v8];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
}

- (void)addCheckpointTask:(id)a3
{
}

- (void)addCheckpointTaskOnQueue:(id)a3 task:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  if (!v7)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HDAsynchronousTaskTree.m", 100, @"Invalid parameter not satisfying: %@", @"checkpointHandler != nil" object file lineNumber description];
  }
  unsigned __int8 v8 = atomic_load((unsigned __int8 *)&self->_rejectAddTask);
  if (v8)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"HDAsynchronousTaskTree.m" lineNumber:101 description:@"Cannot add task if the task tree is rejecting addTask calls"];
  }
  id v9 = objc_alloc_init(HDAsynchronousTask);
  -[HDAsynchronousTask setQueue:]((uint64_t)v9, v13);
  if (v9) {
    objc_setProperty_nonatomic_copy(v9, v10, v7, 40);
  }
  -[HDAsynchronousTaskTree _addTask:queue:]((uint64_t)self, v9, v13);
}

- (NSArray)allErrors
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  v4 = (void *)[(NSMutableArray *)self->_lock_taskErrors copy];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (void)begin
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (self->_lock_started)
  {
    os_unfair_lock_unlock(p_lock);
    if (self->_lock_started)
    {
      id v5 = [MEMORY[0x263F08690] currentHandler];
      [v5 handleFailureInMethod:a2, self, @"HDAsynchronousTaskTree.m", 149, @"Invalid parameter not satisfying: %@", @"!_lock_started" object file lineNumber description];
    }
  }
  else
  {
    self->_lock_started = 1;
    -[HDAsynchronousTaskTree _lock_beginNextTask]((uint64_t)self);
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)_lock_beginNextTask
{
  if (!a1) {
    return;
  }
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
  if (*(unsigned char *)(a1 + 43)) {
    return;
  }
  if ([*(id *)(a1 + 16) count])
  {
    unsigned __int8 v2 = atomic_load((unsigned __int8 *)(a1 + 40));
    if ((v2 & 1) == 0)
    {
      uint64_t v3 = [*(id *)(a1 + 16) objectAtIndexedSubscript:0];
      [*(id *)(a1 + 16) removeObjectAtIndex:0];
      if (v3 && *(void *)(v3 + 40))
      {
        atomic_store(1u, (unsigned __int8 *)(a1 + 41));
        v4 = *(NSObject **)(v3 + 24);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __45__HDAsynchronousTaskTree__lock_beginNextTask__block_invoke;
        block[3] = &unk_2643D45C8;
        uint64_t v19 = (void *)v3;
        uint64_t v20 = a1;
        id v5 = (id)v3;
        dispatch_async(v4, block);
        id v6 = v19;
      }
      else
      {
        if (v3)
        {
          if (*(unsigned char *)(v3 + 8))
          {
            id v9 = dispatch_get_global_queue(0, 0);
            unsigned __int8 v10 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v9);

            dispatch_time_t v11 = dispatch_time(0, (uint64_t)(*(double *)(v3 + 32) * 1000000000.0));
            dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
          }
          else
          {
            unsigned __int8 v10 = 0;
          }
          v12 = *(NSObject **)(v3 + 24);
        }
        else
        {
          unsigned __int8 v10 = 0;
          v12 = 0;
        }
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __45__HDAsynchronousTaskTree__lock_beginNextTask__block_invoke_2;
        v13[3] = &unk_2643D48B8;
        id v14 = (id)v3;
        v15 = v10;
        uint64_t v16 = a1;
        uint64_t v17 = sel__lock_beginNextTask;
        id v6 = (id)v3;
        id v5 = v10;
        dispatch_async(v12, v13);
      }
      return;
    }
    *(unsigned char *)(a1 + 43) = 1;
    uint64_t v8 = a1;
    uint64_t v7 = 3;
  }
  else
  {
    *(unsigned char *)(a1 + 43) = 1;
    uint64_t v7 = [*(id *)(a1 + 32) count] != 0;
    uint64_t v8 = a1;
  }

  -[HDAsynchronousTaskTree _lock_reportResult:](v8, v7);
}

- (void)cancel
{
}

- (void)_completeCurrentTaskWithResult:(void *)a3 error:
{
  id v5 = a3;
  if (a1)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1 + 8));
    switch(a2)
    {
      case 0:
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
        -[HDAsynchronousTaskTree _lock_insertPendingSubtasks]((const os_unfair_lock *)a1);
        -[HDAsynchronousTaskTree _lock_beginNextTask](a1);
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
        break;
      case 1:
      case 3:
        if (!v5)
        {
          objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 100, @"Asynchronous task failed without reporting an error.");
          id v5 = (id)objc_claimAutoreleasedReturnValue();
        }
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
        [*(id *)(a1 + 32) addObject:v5];
        id v6 = (void *)[*(id *)(a1 + 24) copy];
        [*(id *)(a1 + 24) removeAllObjects];
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __63__HDAsynchronousTaskTree__completeCurrentTaskWithResult_error___block_invoke;
        v10[3] = &unk_2643D4500;
        v10[4] = a1;
        uint64_t v7 = v10;
        goto LABEL_10;
      case 2:
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
        *(unsigned char *)(a1 + 43) = 1;
        if (!v5)
        {
          objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 100, @"Asynchronous task had a critical failure without reporting an error.");
          id v5 = (id)objc_claimAutoreleasedReturnValue();
        }
        [*(id *)(a1 + 32) addObject:v5];
        id v6 = [MEMORY[0x263EFF980] arrayWithArray:*(void *)(a1 + 24)];
        uint64_t v8 = (void *)[*(id *)(a1 + 16) copy];
        [v6 addObjectsFromArray:v8];

        [*(id *)(a1 + 24) removeAllObjects];
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
        v9[0] = MEMORY[0x263EF8330];
        v9[1] = 3221225472;
        v9[2] = __63__HDAsynchronousTaskTree__completeCurrentTaskWithResult_error___block_invoke_2;
        v9[3] = &unk_2643D4500;
        v9[4] = a1;
        uint64_t v7 = v9;
LABEL_10:
        -[HDAsynchronousTaskTree _runPendingCheckpointTasks:completion:](a1, v6, v7);

        break;
      default:
        break;
    }
  }
}

- (void)_lock_insertPendingSubtasks
{
  if (a1)
  {
    v1 = (os_unfair_lock *)a1;
    os_unfair_lock_assert_owner(a1 + 2);
    uint64_t v3 = *(void *)&v1[4]._os_unfair_lock_opaque;
    unsigned __int8 v2 = *(void **)&v1[6]._os_unfair_lock_opaque;
    v1 += 4;
    [v2 addObjectsFromArray:v3];
    [*(id *)&v1->_os_unfair_lock_opaque removeAllObjects];
    id v4 = *(id *)&v1->_os_unfair_lock_opaque;
    objc_storeStrong((id *)v1, *(id *)&v1[2]._os_unfair_lock_opaque);
    id v5 = *(void **)&v1[2]._os_unfair_lock_opaque;
    *(void *)&v1[2]._os_unfair_lock_opaque = v4;
  }
}

void __63__HDAsynchronousTaskTree__completeCurrentTaskWithResult_error___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  -[HDAsynchronousTaskTree _lock_beginNextTask](*(void *)(a1 + 32));
  unsigned __int8 v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);

  os_unfair_lock_unlock(v2);
}

- (void)_runPendingCheckpointTasks:(void *)a3 completion:
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = objc_alloc_init(HDSynchronousTaskGroup);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __64__HDAsynchronousTaskTree__runPendingCheckpointTasks_completion___block_invoke;
    v23[3] = &unk_2643D4908;
    v23[4] = a1;
    id v24 = v6;
    [(HDSynchronousTaskGroup *)v7 setDidFinish:v23];
    [(HDSynchronousTaskGroup *)v7 beginTask];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v16 = v5;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * v12);
          if (v13 && *(void *)(v13 + 40))
          {
            atomic_store(1u, (unsigned __int8 *)(a1 + 41));
            [(HDSynchronousTaskGroup *)v7 beginTask];
            id v14 = *(NSObject **)(v13 + 24);
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __64__HDAsynchronousTaskTree__runPendingCheckpointTasks_completion___block_invoke_2;
            block[3] = &unk_2643D4680;
            void block[4] = v13;
            block[5] = a1;
            v18 = v7;
            dispatch_async(v14, block);
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v15 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
        uint64_t v10 = v15;
      }
      while (v15);
    }

    [(HDSynchronousTaskGroup *)v7 finishTask];
    id v5 = v16;
  }
}

void __63__HDAsynchronousTaskTree__completeCurrentTaskWithResult_error___block_invoke_2(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  -[HDAsynchronousTaskTree _lock_reportResult:](*(void *)(a1 + 32), 2);
  unsigned __int8 v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);

  os_unfair_lock_unlock(v2);
}

- (void)_lock_reportResult:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    id v4 = (void *)MEMORY[0x21D49F640](*(void *)(a1 + 48));
    id v5 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;

    if (a2)
    {
      id v6 = [*(id *)(a1 + 32) firstObject];
    }
    else
    {
      id v6 = 0;
    }
    uint64_t v9 = v6;
    id v7 = v6;
    id v8 = v4;
    HKDispatchAsyncOnGlobalConcurrentQueue();
  }
}

void __45__HDAsynchronousTaskTree__lock_beginNextTask__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void *)(v2 + 40);
  }
  else {
    uint64_t v3 = 0;
  }
  (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 40));
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 8));
  atomic_store(0, (unsigned __int8 *)(*(void *)(a1 + 40) + 41));
  -[HDAsynchronousTaskTree _lock_beginNextTask](*(void *)(a1 + 40));
  id v4 = (os_unfair_lock_s *)(*(void *)(a1 + 40) + 8);

  os_unfair_lock_unlock(v4);
}

void __45__HDAsynchronousTaskTree__lock_beginNextTask__block_invoke_2(uint64_t a1)
{
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2810000000;
  v21[3] = &unk_21BFFE047;
  char v22 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if (!*(unsigned char *)(v2 + 8)) {
      goto LABEL_4;
    }
    uint64_t v3 = *(void **)(a1 + 40);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __45__HDAsynchronousTaskTree__lock_beginNextTask__block_invoke_3;
    handler[3] = &unk_2643D4868;
    v18 = v21;
    id v4 = v3;
    uint64_t v5 = *(void *)(a1 + 48);
    id v16 = v4;
    uint64_t v17 = v5;
    dispatch_source_set_event_handler(v4, handler);
    dispatch_resume(*(dispatch_object_t *)(a1 + 40));

    uint64_t v2 = *(void *)(a1 + 32);
    if (v2) {
LABEL_4:
    }
      uint64_t v2 = *(void *)(v2 + 16);
  }
  id v6 = (void (**)(id, uint64_t, void *))(id)v2;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__HDAsynchronousTaskTree__lock_beginNextTask__block_invoke_4;
  v9[3] = &unk_2643D4890;
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v12 = v19;
  uint64_t v13 = v21;
  v9[4] = v8;
  uint64_t v14 = v7;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  v6[2](v6, v8, v9);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);
}

void __45__HDAsynchronousTaskTree__lock_beginNextTask__block_invoke_3(uint64_t a1)
{
  if ((atomic_exchange((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 48) + 8) + 32), 1u) & 1) == 0)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
    objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 100, @"Asynchronous task failed due to timeout");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    -[HDAsynchronousTaskTree _completeCurrentTaskWithResult:error:](*(void *)(a1 + 40), 2, v2);
  }
}

uint64_t __45__HDAsynchronousTaskTree__lock_beginNextTask__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v7 + 24))
  {
    id v12 = v5;
    uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:*(void *)(a1 + 72) object:*(void *)(a1 + 32) file:@"HDAsynchronousTaskTree.m" lineNumber:269 description:@"Asynchronous task has already completed."];

    id v6 = v12;
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  }
  *(unsigned char *)(v7 + 24) = 1;
  if ((atomic_exchange((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 64) + 8) + 32), 1u) & 1) == 0)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    id v11 = v6;
    if (v8 && *(unsigned char *)(v8 + 8)) {
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 48));
    }
    -[HDAsynchronousTaskTree _completeCurrentTaskWithResult:error:](*(void *)(a1 + 32), a2, v11);
    id v6 = v11;
  }

  return MEMORY[0x270F9A758](v5, v6);
}

void __45__HDAsynchronousTaskTree__lock_reportResult___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = 0;

  id v6 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);

  os_unfair_lock_unlock(v6);
}

uint64_t __64__HDAsynchronousTaskTree__runPendingCheckpointTasks_completion___block_invoke(uint64_t a1)
{
  atomic_store(0, (unsigned __int8 *)(*(void *)(a1 + 32) + 41));
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __64__HDAsynchronousTaskTree__runPendingCheckpointTasks_completion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2) {
    uint64_t v3 = *(void *)(v2 + 40);
  }
  else {
    uint64_t v3 = 0;
  }
  (*(void (**)(uint64_t, void))(v3 + 16))(v3, a1[5]);
  uint64_t v4 = (void *)a1[6];

  return [v4 finishTask];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p %@>", objc_opt_class(), self, self->_groupDescription];
}

- (NSString)groupDescription
{
  return self->_groupDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupDescription, 0);
  objc_storeStrong((id *)&self->_default_task_queue, 0);
  objc_storeStrong(&self->_lock_completion, 0);
  objc_storeStrong((id *)&self->_lock_taskErrors, 0);
  objc_storeStrong((id *)&self->_lock_pendingSubtasks, 0);

  objc_storeStrong((id *)&self->_lock_pendingTasks, 0);
}

@end