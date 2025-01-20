@interface HDCloudSyncManagerTaskQueue
- (BOOL)_primitiveConsiderStartingNextTask;
- (BOOL)hasActiveTask;
- (HDCloudSyncManagerTask)activeTask;
- (HDCloudSyncManagerTaskQueue)initWithDelegate:(id)a3;
- (HDCloudSyncManagerTaskQueueDelegate)delegate;
- (int64_t)pendingTaskCount;
- (void)addTask:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HDCloudSyncManagerTaskQueue

- (HDCloudSyncManagerTaskQueue)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncManagerTaskQueue;
  v5 = [(HDCloudSyncManagerTaskQueue *)&v8 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (int64_t)pendingTaskCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t v4 = self->_pendingTasksBeingSorted + [(NSMutableArray *)self->_pendingTasks count];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)hasActiveTask
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_activeTask) {
    BOOL isComputingActiveTask = 1;
  }
  else {
    BOOL isComputingActiveTask = self->_isComputingActiveTask;
  }
  os_unfair_lock_unlock(p_lock);
  return isComputingActiveTask;
}

- (HDCloudSyncManagerTask)activeTask
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t v4 = self->_activeTask;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)addTask:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_pendingTasks;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v9), "combineWithTask:", v4, (void)v15))
        {
          os_unfair_lock_unlock(&self->_lock);

          goto LABEL_20;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  if ([v4 priority] >= 100)
  {
    activeTask = self->_activeTask;
    if (activeTask)
    {
      uint64_t v11 = [(HDCloudSyncManagerTask *)activeTask priority];
      if (v11 < [v4 priority])
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(HDCloudSyncManagerTask *)self->_activeTask cancel];
        }
      }
    }
  }
  pendingTasks = self->_pendingTasks;
  if (!pendingTasks)
  {
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v14 = self->_pendingTasks;
    self->_pendingTasks = v13;

    pendingTasks = self->_pendingTasks;
  }
  -[NSMutableArray addObject:](pendingTasks, "addObject:", v4, (void)v15);
  os_unfair_lock_unlock(&self->_lock);
  while (-[HDCloudSyncManagerTaskQueue _primitiveConsiderStartingNextTask]((uint64_t)self))
    ;
LABEL_20:
}

- (BOOL)_primitiveConsiderStartingNextTask
{
  if (!a1) {
    return 0;
  }
  v2 = (os_unfair_lock_s *)(a1 + 8);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  if (*(void *)(a1 + 40) || *(unsigned char *)(a1 + 32) || *(unsigned char *)(a1 + 33))
  {
    os_unfair_lock_unlock(v2);
    return 0;
  }
  v5 = (id *)(a1 + 16);
  uint64_t v6 = *(void **)(a1 + 16);
  id v7 = v6;
  uint64_t v8 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = 0;

  *(void *)(a1 + 24) = [v7 count];
  *(unsigned char *)(a1 + 32) = 1;
  os_unfair_lock_unlock(v2);
  objc_copyWeak(&to, (id *)(a1 + 48));
  id v9 = objc_loadWeakRetained(&to);

  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __65__HDCloudSyncManagerTaskQueue__primitiveConsiderStartingNextTask__block_invoke;
    v12[3] = &unk_1E63098F0;
    objc_copyWeak(&v13, &to);
    v12[4] = a1;
    [v7 sortUsingComparator:v12];
    objc_destroyWeak(&v13);
  }
  os_unfair_lock_lock(v2);
  if (*v5) {
    objc_msgSend(v7, "addObjectsFromArray:");
  }
  objc_storeStrong((id *)(a1 + 16), v6);
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 0;
  v10 = [*(id *)(a1 + 16) firstObject];
  BOOL v3 = v10 != 0;
  if (v10)
  {
    [*v5 removeObjectAtIndex:0];
    objc_storeStrong((id *)(a1 + 40), v10);
    *(unsigned char *)(a1 + 33) = 1;
    os_unfair_lock_unlock(v2);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__HDCloudSyncManagerTaskQueue__primitiveConsiderStartingNextTask__block_invoke_2;
    v11[3] = &unk_1E62F3208;
    v11[4] = a1;
    [v10 startWithCompletion:v11];
    os_unfair_lock_lock(v2);
    *(unsigned char *)(a1 + 33) = 0;
  }
  os_unfair_lock_unlock(v2);

  objc_destroyWeak(&to);
  return v3;
}

uint64_t __65__HDCloudSyncManagerTaskQueue__primitiveConsiderStartingNextTask__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  uint64_t v9 = [WeakRetained compareTask:v7 withTask:v6 queue:*(void *)(a1 + 32)];

  return v9;
}

void __65__HDCloudSyncManagerTaskQueue__primitiveConsiderStartingNextTask__block_invoke_2(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(unsigned __int8 *)(v4 + 33);
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 8));
  if (!v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6)
    {
      while ((-[HDCloudSyncManagerTaskQueue _primitiveConsiderStartingNextTask](v6) & 1) != 0)
        ;
    }
  }
}

- (HDCloudSyncManagerTaskQueueDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDCloudSyncManagerTaskQueueDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeTask, 0);

  objc_storeStrong((id *)&self->_pendingTasks, 0);
}

@end