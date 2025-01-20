@interface HDCloudSyncManagerTask
- (BOOL)combineWithTask:(id)a3;
- (HDCloudSyncManagerTask)init;
- (HDCloudSyncManagerTask)originalTask;
- (NSArray)mirroringTasks;
- (NSProgress)progress;
- (int64_t)priority;
- (int64_t)status;
- (void)finish;
- (void)main;
- (void)mirrorTask:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)startWithCompletion:(id)a3;
@end

@implementation HDCloudSyncManagerTask

- (HDCloudSyncManagerTask)init
{
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncManagerTask;
  v2 = [(HDCloudSyncManagerTask *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:100];
    progress = v3->_progress;
    v3->_progress = (NSProgress *)v4;

    mirroringTasks = v3->_mirroringTasks;
    v3->_mirroringTasks = (NSArray *)MEMORY[0x1E4F1CBF0];

    v3->_priority = 0;
  }
  return v3;
}

- (int64_t)status
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t status = self->_status;
  os_unfair_lock_unlock(p_lock);
  return status;
}

- (BOOL)combineWithTask:(id)a3
{
  return 0;
}

- (void)startWithCompletion:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HDCloudSyncManagerTask.m", 55, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalTask);

  int64_t status = self->_status;
  if (!status)
  {
    objc_super v8 = (void *)[v5 copy];
    id completion = self->_completion;
    self->_id completion = v8;

    self->_int64_t status = 1;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v10 = self->_mirroringTasks;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          *(void *)(*(void *)(*((void *)&v19 + 1) + 8 * i) + 24) = self->_status;
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v12);
    }
  }
  os_unfair_lock_unlock(&self->_lock);
  if (WeakRetained)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HDCloudSyncManagerTask.m", 67, @"Invalid parameter not satisfying: %@", @"hasOriginalTask == NO" object file lineNumber description];

    if (!status) {
      goto LABEL_14;
    }
  }
  else if (!status)
  {
    goto LABEL_14;
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"HDCloudSyncManagerTask.m", 68, @"Invalid parameter not satisfying: %@", @"status == HDCloudSyncManagerTaskStatusPending" object file lineNumber description];

LABEL_14:
  _HKInitializeLogging();
  v15 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v24 = self;
    _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting.", buf, 0xCu);
  }
  [(HDCloudSyncManagerTask *)self main];
}

- (void)main
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (void)finish
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t status = self->_status;
  v6 = (void (**)(void))_Block_copy(self->_completion);
  id completion = self->_completion;
  self->_id completion = 0;

  if (self->_status == 1)
  {
    self->_int64_t status = 2;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    objc_super v8 = self->_mirroringTasks;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
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
          *(void *)(*(void *)(*((void *)&v19 + 1) + 8 * v12++) + 24) = self->_status;
        }
        while (v10 != v12);
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v10);
    }
  }
  mirroringTasks = self->_mirroringTasks;
  self->_mirroringTasks = (NSArray *)MEMORY[0x1E4F1CBF0];

  os_unfair_lock_unlock(p_lock);
  if (!status)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HDCloudSyncManagerTask.m", 95, @"Invalid parameter not satisfying: %@", @"status != HDCloudSyncManagerTaskStatusPending" object file lineNumber description];
  }
  int64_t v14 = [(NSProgress *)self->_progress completedUnitCount];
  int64_t v15 = [(NSProgress *)self->_progress totalUnitCount];
  if (v14 <= v15) {
    int64_t v16 = v15;
  }
  else {
    int64_t v16 = v14;
  }
  [(NSProgress *)self->_progress setCompletedUnitCount:v16];
  if (status == 1)
  {
    _HKInitializeLogging();
    v17 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = self;
      _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished.", buf, 0xCu);
    }
    if (v6) {
      v6[2](v6);
    }
  }
}

- (void)mirrorTask:(id)a3
{
  obj = (char *)a3;
  if (!obj)
  {
    int64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HDCloudSyncManagerTask.m", 123, @"Invalid parameter not satisfying: %@", @"originalTask" object file lineNumber description];
  }
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalTask);

  objc_storeWeak((id *)&self->_originalTask, obj);
  os_unfair_lock_unlock(&self->_lock);
  if (WeakRetained)
  {
    int64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HDCloudSyncManagerTask.m", 128, @"Invalid parameter not satisfying: %@", @"hasOriginalTask == NO" object file lineNumber description];
  }
  v6 = self;
  if (obj)
  {
    if (!v6)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:sel__addMirroringTask_, obj, @"HDCloudSyncManagerTask.m", 110, @"Invalid parameter not satisfying: %@", @"mirroringTask" object file lineNumber description];
    }
    v7 = (os_unfair_lock_s *)(obj + 8);
    os_unfair_lock_lock((os_unfair_lock_t)obj + 2);
    if (*((void *)obj + 3))
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28F90], "hd_progressMirroringProgress:", *((void *)obj + 6));
      progress = v6->_progress;
      v6->_progress = (NSProgress *)v8;

      os_unfair_lock_unlock(v7);
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:sel__addMirroringTask_, obj, @"HDCloudSyncManagerTask.m", 118, @"Invalid parameter not satisfying: %@", @"status == HDCloudSyncManagerTaskStatusPending" object file lineNumber description];
    }
    else
    {
      uint64_t v11 = [*((id *)obj + 4) arrayByAddingObject:v6];
      uint64_t v12 = (void *)*((void *)obj + 4);
      *((void *)obj + 4) = v11;

      uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28F90], "hd_progressMirroringProgress:", *((void *)obj + 6));
      int64_t v14 = v6->_progress;
      v6->_progress = (NSProgress *)v13;

      os_unfair_lock_unlock(v7);
    }
  }
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 48, 1);
}

- (HDCloudSyncManagerTask)originalTask
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalTask);

  return (HDCloudSyncManagerTask *)WeakRetained;
}

- (NSArray)mirroringTasks
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_originalTask);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_mirroringTasks, 0);

  objc_storeStrong(&self->_completion, 0);
}

@end