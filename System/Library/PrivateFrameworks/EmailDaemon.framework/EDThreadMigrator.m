@interface EDThreadMigrator
+ (OS_os_log)log;
- (EDInMemoryThreadQueryHandler)queryHandler;
- (EDThreadMigrator)initWithThreadScope:(id)a3 threadPersistence:(id)a4 queryHandler:(id)a5 delegate:(id)a6;
- (EDThreadMigratorDelegate)delegate;
- (EDThreadPersistence)threadPersistence;
- (EFLocked)state;
- (EFScheduler)workScheduler;
- (EMThreadScope)threadScope;
- (double)threadFinalizationInterval;
- (void)_failMigration;
- (void)_finishMigrating;
- (void)_migrateNextBatchWithGeneration:(unint64_t)a3;
- (void)_scheduleFinalizationForBatchedObjectIDs:(id)a3 withGeneration:(unint64_t)a4 forDelete:(BOOL)a5;
- (void)addObjectIDsToMigrate:(id)a3;
- (void)cancel;
- (void)changeObjectIDsToMigrate:(id)a3;
- (void)deleteObjectIDsToMigrate:(id)a3;
- (void)reset;
- (void)setThreadFinalizationInterval:(double)a3;
- (void)start;
@end

@implementation EDThreadMigrator

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__EDThreadMigrator_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_93 != -1) {
    dispatch_once(&log_onceToken_93, block);
  }
  v2 = (void *)log_log_93;

  return (OS_os_log *)v2;
}

void __23__EDThreadMigrator_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_93;
  log_log_93 = (uint64_t)v1;
}

- (EDThreadMigrator)initWithThreadScope:(id)a3 threadPersistence:(id)a4 queryHandler:(id)a5 delegate:(id)a6
{
  id v26 = a3;
  id v25 = a4;
  id v11 = a5;
  id v12 = a6;
  v27.receiver = self;
  v27.super_class = (Class)EDThreadMigrator;
  v13 = [(EDThreadMigrator *)&v27 init];
  v14 = v13;
  if (v13)
  {
    threadScope = v13->_threadScope;
    v13->_threadFinalizationInterval = 2.0;
    v16 = (void *)MEMORY[0x1E4F60F28];
    v17 = [NSString stringWithFormat:@"EDThreadMigrator-%@", threadScope];
    uint64_t v18 = [v16 serialDispatchQueueSchedulerWithName:v17];
    workScheduler = v14->_workScheduler;
    v14->_workScheduler = (EFScheduler *)v18;

    id v20 = objc_alloc(MEMORY[0x1E4F60DA0]);
    v21 = objc_alloc_init(_EDThreadMigrationState);
    uint64_t v22 = [v20 initWithObject:v21];
    state = v14->_state;
    v14->_state = (EFLocked *)v22;

    objc_storeStrong((id *)&v14->_threadScope, a3);
    objc_storeStrong((id *)&v14->_threadPersistence, a4);
    objc_storeStrong((id *)&v14->_queryHandler, a5);
    objc_storeWeak((id *)&v14->_delegate, v12);
  }

  return v14;
}

- (void)start
{
  id v3 = [(EDThreadMigrator *)self state];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __25__EDThreadMigrator_start__block_invoke;
  v4[3] = &unk_1E6C06870;
  v4[4] = self;
  [v3 performWhileLocked:v4];
}

void __25__EDThreadMigrator_start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 state])
  {
    v4 = +[EDThreadMigrator log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = [v3 generation];
      uint64_t v7 = [v3 unmigratedCount];
      unint64_t v8 = [v3 state] - 1;
      if (v8 > 4) {
        v9 = @"Not Started";
      }
      else {
        v9 = off_1E6C069C8[v8];
      }
      uint64_t v22 = [*(id *)(a1 + 32) threadScope];
      *(_DWORD *)buf = 134219010;
      uint64_t v29 = v5;
      __int16 v30 = 2048;
      uint64_t v31 = v6;
      __int16 v32 = 2048;
      uint64_t v33 = v7;
      __int16 v34 = 2114;
      v35 = v9;
      __int16 v36 = 2114;
      v37 = v22;
      _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Failed to start migration for %lu threads due to wrong state: %{public}@\n%{public}@", buf, 0x34u);
    }
  }
  else
  {
    [v3 setState:1];
    v10 = +[EDThreadMigrator log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = [v3 generation];
      uint64_t v13 = [v3 unmigratedCount];
      v14 = [*(id *)(a1 + 32) threadScope];
      *(_DWORD *)buf = 134218754;
      uint64_t v29 = v11;
      __int16 v30 = 2048;
      uint64_t v31 = v12;
      __int16 v32 = 2048;
      uint64_t v33 = v13;
      __int16 v34 = 2114;
      v35 = v14;
      _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Starting migration for %lu threads\n%{public}@", buf, 0x2Au);
    }
    v4 = objc_alloc_init(MEMORY[0x1E4F60D40]);
    [v3 setMigrationCancelable:v4];
    if ([v3 isFullyMigrated])
    {
      [v3 setState:3];
      v15 = +[EDThreadMigrator log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        uint64_t v17 = [v3 generation];
        uint64_t v18 = [*(id *)(a1 + 32) threadScope];
        *(_DWORD *)buf = 134218498;
        uint64_t v29 = v16;
        __int16 v30 = 2048;
        uint64_t v31 = v17;
        __int16 v32 = 2114;
        uint64_t v33 = (uint64_t)v18;
        _os_log_impl(&dword_1DB39C000, v15, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Finished empty migration: %{public}@", buf, 0x20u);
      }
      v19 = [*(id *)(a1 + 32) workScheduler];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __25__EDThreadMigrator_start__block_invoke_8;
      v26[3] = &unk_1E6BFFAF0;
      v26[4] = *(void *)(a1 + 32);
      objc_super v27 = v4;
      [v19 performBlock:v26];
      id v20 = (id *)&v27;
    }
    else
    {
      v21 = [*(id *)(a1 + 32) workScheduler];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __25__EDThreadMigrator_start__block_invoke_2;
      v23[3] = &unk_1E6BFF7A8;
      v23[4] = *(void *)(a1 + 32);
      v24 = v4;
      id v25 = v3;
      [v21 performBlock:v23];

      id v20 = (id *)&v24;
      v19 = v25;
    }
  }
}

void __25__EDThreadMigrator_start__block_invoke_8(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) threadPersistence];
  id v3 = [*(id *)(a1 + 32) threadScope];
  id v4 = [v2 beginMigratingThreadScope:v3];

  [*(id *)(a1 + 40) addCancelable:v4];
  [*(id *)(a1 + 32) _finishMigrating];
}

void __25__EDThreadMigrator_start__block_invoke_2(id *a1)
{
  v2 = [a1[4] threadPersistence];
  id v3 = [a1[4] threadScope];
  id v4 = [v2 beginMigratingThreadScope:v3];

  [a1[5] addCancelable:v4];
  objc_msgSend(a1[4], "_migrateNextBatchWithGeneration:", objc_msgSend(a1[6], "generation"));
}

- (void)cancel
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  unint64_t v8 = __Block_byref_object_copy__41;
  v9 = __Block_byref_object_dispose__41;
  id v10 = 0;
  id v3 = [(EDThreadMigrator *)self state];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __26__EDThreadMigrator_cancel__block_invoke;
  v4[3] = &unk_1E6C06898;
  v4[4] = self;
  void v4[5] = &v5;
  [v3 performWhileLocked:v4];

  [(id)v6[5] cancel];
  _Block_object_dispose(&v5, 8);
}

void __26__EDThreadMigrator_cancel__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[EDThreadMigrator log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [v3 generation];
    uint64_t v7 = [v3 state];
    if ((unint64_t)(v7 - 1) > 4) {
      unint64_t v8 = @"Not Started";
    }
    else {
      unint64_t v8 = off_1E6C069C8[v7 - 1];
    }
    int v12 = 134218498;
    uint64_t v13 = v5;
    __int16 v14 = 2048;
    uint64_t v15 = v6;
    __int16 v16 = 2114;
    uint64_t v17 = v8;
    _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Canceling migration oldState: %{public}@", (uint8_t *)&v12, 0x20u);
  }

  if ([v3 isInProgress])
  {
    uint64_t v9 = [v3 migrationCancelable];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    [v3 setMigrationCancelable:0];
  }
  [v3 setState:5];
}

- (void)reset
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  unint64_t v8 = __Block_byref_object_copy__41;
  uint64_t v9 = __Block_byref_object_dispose__41;
  id v10 = 0;
  id v3 = [(EDThreadMigrator *)self state];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __25__EDThreadMigrator_reset__block_invoke;
  v4[3] = &unk_1E6C06898;
  v4[4] = self;
  void v4[5] = &v5;
  [v3 performWhileLocked:v4];

  [(id)v6[5] cancel];
  _Block_object_dispose(&v5, 8);
}

void __25__EDThreadMigrator_reset__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[EDThreadMigrator log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [v3 generation];
    uint64_t v7 = [v3 state];
    if ((unint64_t)(v7 - 1) > 4) {
      unint64_t v8 = @"Not Started";
    }
    else {
      unint64_t v8 = off_1E6C069C8[v7 - 1];
    }
    int v12 = 134218498;
    uint64_t v13 = v5;
    __int16 v14 = 2048;
    uint64_t v15 = v6;
    __int16 v16 = 2114;
    uint64_t v17 = v8;
    _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Resetting migration oldState: %{public}@", (uint8_t *)&v12, 0x20u);
  }

  if ([v3 isInProgress])
  {
    uint64_t v9 = [v3 migrationCancelable];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    [v3 setMigrationCancelable:0];
  }
  [v3 reset];
}

- (void)_failMigration
{
  id v2 = [(EDThreadMigrator *)self state];
  [v2 performWhileLocked:&__block_literal_global_83];
}

uint64_t __34__EDThreadMigrator__failMigration__block_invoke(uint64_t a1, void *a2)
{
  return [a2 fail];
}

- (void)_migrateNextBatchWithGeneration:(unint64_t)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = 0;
  objc_super v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__41;
  id v20 = __Block_byref_object_dispose__41;
  id v21 = 0;
  uint64_t v5 = [(EDThreadMigrator *)self state];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__EDThreadMigrator__migrateNextBatchWithGeneration___block_invoke;
  v15[3] = &unk_1E6C068E0;
  v15[7] = &v26;
  v15[8] = a3;
  v15[4] = self;
  v15[5] = &v16;
  v15[6] = &v22;
  [v5 performWhileLocked:v15];

  if (!*((unsigned char *)v27 + 24))
  {
    uint64_t v6 = [(EDThreadMigrator *)self queryHandler];
    uint64_t v7 = [v6 threadsAndMessagesForObjectIDs:v17[5]];
    unint64_t v8 = [(EDThreadMigrator *)self threadPersistence];
    int v9 = [v8 addThreads:v7];

    if (v9)
    {
      uint64_t v10 = (void *)[(id)v17[5] copy];
      [(EDThreadMigrator *)self _scheduleFinalizationForBatchedObjectIDs:v10 withGeneration:a3 forDelete:0];

      if (!*((unsigned char *)v23 + 24))
      {
        uint64_t v11 = [(EDThreadMigrator *)self workScheduler];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __52__EDThreadMigrator__migrateNextBatchWithGeneration___block_invoke_13;
        v14[3] = &unk_1E6BFFA50;
        v14[4] = self;
        v14[5] = a3;
        [v11 performBlock:v14];
      }
    }
    else
    {
      int v12 = +[EDThreadMigrator log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = [(EDThreadMigrator *)self threadScope];
        *(_DWORD *)buf = 134218498;
        uint64_t v31 = self;
        __int16 v32 = 2048;
        unint64_t v33 = a3;
        __int16 v34 = 2114;
        v35 = v13;
        _os_log_error_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_ERROR, "%p[%lu]: Failed migration -- unable to add threads\n%{public}@", buf, 0x20u);
      }
      [(EDThreadMigrator *)self _failMigration];
    }
  }
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
}

void __52__EDThreadMigrator__migrateNextBatchWithGeneration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!objc_msgSend(v3, "verifyIsMigratingGeneration:andIsInState:logIdentifier:logAction:logCount:", *(void *)(a1 + 64), 1, *(void *)(a1 + 32), @"Stopping migration", objc_msgSend(v3, "unmigratedCount")))
  {
    uint64_t v16 = *(void *)(a1 + 56);
LABEL_9:
    *(unsigned char *)(*(void *)(v16 + 8) + 24) = 1;
    goto LABEL_10;
  }
  uint64_t v4 = [v3 nextBatch];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = +[EDThreadMigrator log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 64);
    int v9 = *(void **)(a1 + 32);
    uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
    uint64_t v11 = [*(id *)(a1 + 32) threadScope];
    int v17 = 134218754;
    uint64_t v18 = v9;
    __int16 v19 = 2048;
    uint64_t v20 = v8;
    __int16 v21 = 2048;
    uint64_t v22 = v10;
    __int16 v23 = 2114;
    uint64_t v24 = v11;
    _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Migrating batch of %lu threads\n%{public}@", (uint8_t *)&v17, 0x2Au);
  }
  if ([v3 isEmpty])
  {
    int v12 = +[EDThreadMigrator log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void **)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 64);
      uint64_t v15 = [v13 threadScope];
      int v17 = 134218498;
      uint64_t v18 = v13;
      __int16 v19 = 2048;
      uint64_t v20 = v14;
      __int16 v21 = 2114;
      uint64_t v22 = (uint64_t)v15;
      _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Finishing migration\n%{public}@", (uint8_t *)&v17, 0x20u);
    }
    [v3 setState:2];
    uint64_t v16 = *(void *)(a1 + 48);
    goto LABEL_9;
  }
LABEL_10:
}

uint64_t __52__EDThreadMigrator__migrateNextBatchWithGeneration___block_invoke_13(uint64_t a1)
{
  return [*(id *)(a1 + 32) _migrateNextBatchWithGeneration:*(void *)(a1 + 40)];
}

- (void)_scheduleFinalizationForBatchedObjectIDs:(id)a3 withGeneration:(unint64_t)a4 forDelete:(BOOL)a5
{
  id v8 = a3;
  int v9 = [(EDThreadMigrator *)self workScheduler];
  [(EDThreadMigrator *)self threadFinalizationInterval];
  double v11 = v10;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86__EDThreadMigrator__scheduleFinalizationForBatchedObjectIDs_withGeneration_forDelete___block_invoke;
  v14[3] = &unk_1E6C06930;
  BOOL v17 = a5;
  v14[4] = self;
  unint64_t v16 = a4;
  id v12 = v8;
  id v15 = v12;
  id v13 = (id)[v9 afterDelay:v14 performBlock:v11];
}

void __86__EDThreadMigrator__scheduleFinalizationForBatchedObjectIDs_withGeneration_forDelete___block_invoke(uint64_t a1)
{
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v2 = [*(id *)(a1 + 32) state];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86__EDThreadMigrator__scheduleFinalizationForBatchedObjectIDs_withGeneration_forDelete___block_invoke_2;
  v5[3] = &unk_1E6C06908;
  char v9 = *(unsigned char *)(a1 + 56);
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 48);
  v5[4] = v4;
  id v6 = v3;
  uint64_t v7 = &v10;
  [v2 performWhileLocked:v5];

  if (*((unsigned char *)v11 + 24)) {
    [*(id *)(a1 + 32) _finishMigrating];
  }

  _Block_object_dispose(&v10, 8);
}

void __86__EDThreadMigrator__scheduleFinalizationForBatchedObjectIDs_withGeneration_forDelete___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 64)) {
    uint64_t v4 = @"Skipping delete finalization";
  }
  else {
    uint64_t v4 = @"Skipping finalization";
  }
  uint64_t v5 = v4;
  if (objc_msgSend(v3, "verifyIsMigratingGeneration:andIsInState:orState:logIdentifier:logAction:logCount:", *(void *)(a1 + 56), 1, 2, *(void *)(a1 + 32), v5, objc_msgSend(*(id *)(a1 + 40), "count")))
  {
    id v6 = +[EDThreadMigrator log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 56);
      if (*(unsigned char *)(a1 + 64)) {
        uint64_t v8 = @"deletion";
      }
      else {
        uint64_t v8 = @"migration";
      }
      char v9 = *(void **)(a1 + 32);
      uint64_t v10 = [*(id *)(a1 + 40) count];
      double v11 = [*(id *)(a1 + 32) threadScope];
      int v20 = 134219010;
      __int16 v21 = v9;
      __int16 v22 = 2048;
      uint64_t v23 = v7;
      __int16 v24 = 2114;
      uint64_t v25 = v8;
      __int16 v26 = 2048;
      uint64_t v27 = v10;
      __int16 v28 = 2114;
      char v29 = v11;
      _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Finalized %{public}@ for %lu threads: %{public}@", (uint8_t *)&v20, 0x34u);
    }
    uint64_t v12 = *(void *)(a1 + 40);
    if (*(unsigned char *)(a1 + 64)) {
      [v3 removeDeletedObjectIDs:v12];
    }
    else {
      [v3 removeMigratedObjectIDs:v12];
    }
    if ([v3 state] == 2 && objc_msgSend(v3, "isFullyMigrated"))
    {
      char v13 = +[EDThreadMigrator log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void **)(a1 + 32);
        uint64_t v15 = *(void *)(a1 + 56);
        int v16 = *(unsigned __int8 *)(a1 + 64);
        uint64_t v17 = [v14 threadScope];
        uint64_t v18 = (void *)v17;
        __int16 v19 = @"delete ";
        int v20 = 134218754;
        __int16 v21 = v14;
        __int16 v22 = 2048;
        if (!v16) {
          __int16 v19 = &stru_1F3583658;
        }
        uint64_t v23 = v15;
        __int16 v24 = 2112;
        uint64_t v25 = v19;
        __int16 v26 = 2114;
        uint64_t v27 = v17;
        _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Finished migration after finalizing last %@batch: %{public}@", (uint8_t *)&v20, 0x2Au);
      }
      [v3 setState:3];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
}

- (void)_finishMigrating
{
  id v4 = [(EDThreadMigrator *)self threadPersistence];
  id v3 = [(EDThreadMigrator *)self threadScope];
  [v4 endMigratingThreadScope:v3];

  id v5 = [(EDThreadMigrator *)self delegate];
  [v5 threadMigratorDidComplete:self];
}

- (void)addObjectIDsToMigrate:(id)a3
{
  id v4 = a3;
  id v5 = [(EDThreadMigrator *)self state];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__EDThreadMigrator_addObjectIDsToMigrate___block_invoke;
  v7[3] = &unk_1E6C06958;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 performWhileLocked:v7];
}

void __42__EDThreadMigrator_addObjectIDsToMigrate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = [v3 state];
  if (v4 < 2)
  {
    char v6 = 0;
  }
  else
  {
    if (v4 != 2)
    {
      if (v4 == 3)
      {
        id v5 = +[EDThreadMigrator log];
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = *(void *)(a1 + 32);
          uint64_t v18 = [v3 generation];
          uint64_t v19 = *(void *)(a1 + 40);
          int v20 = [*(id *)(a1 + 32) threadScope];
          *(_DWORD *)buf = 134218754;
          uint64_t v24 = v17;
          __int16 v25 = 2048;
          uint64_t v26 = v18;
          __int16 v27 = 2114;
          uint64_t v28 = v19;
          __int16 v29 = 2114;
          uint64_t v30 = v20;
          _os_log_error_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_ERROR, "%p[%lu]: Got more object IDs after migration finished. objects: {%{public}@}; thread scope: {%{public}@}",
            buf,
            0x2Au);
        }
      }
      goto LABEL_15;
    }
    [v3 setState:1];
    uint64_t v7 = +[EDThreadMigrator log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = [v3 generation];
      uint64_t v10 = [*(id *)(a1 + 32) threadScope];
      *(_DWORD *)buf = 134218498;
      uint64_t v24 = v8;
      __int16 v25 = 2048;
      uint64_t v26 = v9;
      __int16 v27 = 2114;
      uint64_t v28 = (uint64_t)v10;
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Resuming migration for thread scope %{public}@", buf, 0x20u);
    }
    char v6 = 1;
  }
  [v3 addObjectIDs:*(void *)(a1 + 40)];
  double v11 = +[EDThreadMigrator log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = [v3 generation];
    uint64_t v14 = [*(id *)(a1 + 40) count];
    uint64_t v15 = [*(id *)(a1 + 32) threadScope];
    *(_DWORD *)buf = 134218754;
    uint64_t v24 = v12;
    __int16 v25 = 2048;
    uint64_t v26 = v13;
    __int16 v27 = 2048;
    uint64_t v28 = v14;
    __int16 v29 = 2114;
    uint64_t v30 = v15;
    _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Added %lu threads to migration for thread scope %{public}@", buf, 0x2Au);
  }
  if (v6)
  {
    int v16 = [*(id *)(a1 + 32) workScheduler];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __42__EDThreadMigrator_addObjectIDsToMigrate___block_invoke_32;
    v21[3] = &unk_1E6BFFAF0;
    v21[4] = *(void *)(a1 + 32);
    id v22 = v3;
    [v16 performBlock:v21];
  }
LABEL_15:
}

uint64_t __42__EDThreadMigrator_addObjectIDsToMigrate___block_invoke_32(uint64_t a1)
{
  os_log_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) generation];

  return [v1 _migrateNextBatchWithGeneration:v2];
}

- (void)changeObjectIDsToMigrate:(id)a3
{
  id v4 = a3;
  id v5 = [(EDThreadMigrator *)self state];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__EDThreadMigrator_changeObjectIDsToMigrate___block_invoke;
  v7[3] = &unk_1E6C06958;
  id v6 = v4;
  id v8 = v6;
  uint64_t v9 = self;
  [v5 performWhileLocked:v7];
}

void __45__EDThreadMigrator_changeObjectIDsToMigrate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 state];
  if ((unint64_t)(v4 - 1) >= 2)
  {
    if (v4 == 3)
    {
      uint64_t v17 = +[EDThreadMigrator log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = *(void *)(a1 + 40);
        uint64_t v19 = [v3 generation];
        int v20 = *(void **)(a1 + 32);
        __int16 v21 = [*(id *)(a1 + 40) threadScope];
        *(_DWORD *)buf = 134218754;
        uint64_t v27 = v18;
        __int16 v28 = 2048;
        uint64_t v29 = v19;
        __int16 v30 = 2114;
        uint64_t v31 = v20;
        __int16 v32 = 2114;
        unint64_t v33 = v21;
        _os_log_error_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_ERROR, "%p[%lu]: Got changed object IDs after migration finished: %{public}@\n%{public}@", buf, 0x2Au);
      }
    }
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __45__EDThreadMigrator_changeObjectIDsToMigrate___block_invoke_2;
    v24[3] = &unk_1E6C04A00;
    id v6 = v3;
    id v25 = v6;
    uint64_t v7 = objc_msgSend(v5, "ef_filter:", v24);
    if (![v7 count]) {
      goto LABEL_13;
    }
    [v6 addObjectIDs:v7];
    [v6 removeMigratedObjectIDs:v7];
    id v8 = +[EDThreadMigrator log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = [v6 generation];
      double v11 = [*(id *)(a1 + 40) threadScope];
      *(_DWORD *)buf = 134218754;
      uint64_t v27 = v9;
      __int16 v28 = 2048;
      uint64_t v29 = v10;
      __int16 v30 = 2114;
      uint64_t v31 = v7;
      __int16 v32 = 2114;
      unint64_t v33 = v11;
      _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Resetting object IDs %{public}@ after change\n%{public}@", buf, 0x2Au);
    }
    if ([v6 state] == 2)
    {
      [v6 setState:1];
      uint64_t v12 = +[EDThreadMigrator log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 40);
        uint64_t v14 = [v6 generation];
        uint64_t v15 = [*(id *)(a1 + 40) threadScope];
        *(_DWORD *)buf = 134218498;
        uint64_t v27 = v13;
        __int16 v28 = 2048;
        uint64_t v29 = v14;
        __int16 v30 = 2114;
        uint64_t v31 = v15;
        _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Resuming migration\n%{public}@", buf, 0x20u);
      }
      int v16 = [*(id *)(a1 + 40) workScheduler];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __45__EDThreadMigrator_changeObjectIDsToMigrate___block_invoke_34;
      v22[3] = &unk_1E6BFFAF0;
      v22[4] = *(void *)(a1 + 40);
      id v23 = v6;
      [v16 performBlock:v22];
    }
    else
    {
LABEL_13:
    }
  }
}

uint64_t __45__EDThreadMigrator_changeObjectIDsToMigrate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isRecentlyMigrated:a2];
}

uint64_t __45__EDThreadMigrator_changeObjectIDsToMigrate___block_invoke_34(uint64_t a1)
{
  os_log_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) generation];

  return [v1 _migrateNextBatchWithGeneration:v2];
}

- (void)deleteObjectIDsToMigrate:(id)a3
{
  id v4 = a3;
  id v5 = [(EDThreadMigrator *)self state];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__EDThreadMigrator_deleteObjectIDsToMigrate___block_invoke;
  v7[3] = &unk_1E6C06958;
  id v6 = v4;
  id v8 = v6;
  uint64_t v9 = self;
  [v5 performWhileLocked:v7];
}

void __45__EDThreadMigrator_deleteObjectIDsToMigrate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__EDThreadMigrator_deleteObjectIDsToMigrate___block_invoke_2;
  aBlock[3] = &unk_1E6BFF7A8;
  id v4 = v3;
  id v33 = v4;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v34 = v5;
  uint64_t v35 = v6;
  uint64_t v7 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v8 = [v4 state];
  if ((unint64_t)(v8 - 1) < 2)
  {
    v7[2](v7);
    double v11 = *(void **)(a1 + 32);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __45__EDThreadMigrator_deleteObjectIDsToMigrate___block_invoke_35;
    v30[3] = &unk_1E6C04A00;
    uint64_t v12 = v4;
    uint64_t v31 = v12;
    uint64_t v10 = objc_msgSend(v11, "ef_filter:", v30);
    if ([v10 count])
    {
      [v12 addDeletedObjectIDs:v10];
      uint64_t v13 = +[EDThreadMigrator log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 40);
        uint64_t v15 = [v12 generation];
        int v16 = [*(id *)(a1 + 40) threadScope];
        *(_DWORD *)buf = 134218754;
        uint64_t v37 = v14;
        __int16 v38 = 2048;
        uint64_t v39 = v15;
        __int16 v40 = 2114;
        v41 = v10;
        __int16 v42 = 2114;
        v43 = v16;
        _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Deleting %{public}@\n%{public}@", buf, 0x2Au);
      }
    }
    if ([v12 state] == 1 && [v12 isEmpty])
    {
      [v12 setState:2];
      uint64_t v17 = +[EDThreadMigrator log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 40);
        uint64_t v19 = [v12 generation];
        int v20 = [*(id *)(a1 + 40) threadScope];
        *(_DWORD *)buf = 134218498;
        uint64_t v37 = v18;
        __int16 v38 = 2048;
        uint64_t v39 = v19;
        __int16 v40 = 2114;
        v41 = v20;
        _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Finishing migration after deleting last batch: %{public}@", buf, 0x20u);
      }
    }
    uint64_t v9 = v31;
    goto LABEL_17;
  }
  if (v8)
  {
    if (v8 == 3)
    {
      uint64_t v9 = +[EDThreadMigrator log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = *(void *)(a1 + 40);
        uint64_t v23 = [v4 generation];
        uint64_t v24 = *(void **)(a1 + 32);
        id v25 = [*(id *)(a1 + 40) threadScope];
        *(_DWORD *)buf = 134218754;
        uint64_t v37 = v22;
        __int16 v38 = 2048;
        uint64_t v39 = v23;
        __int16 v40 = 2114;
        v41 = v24;
        __int16 v42 = 2114;
        v43 = v25;
        _os_log_error_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_ERROR, "%p[%lu]: Got deleted object IDs after migration finished: %{public}@\n%{public}@", buf, 0x2Au);
      }
      uint64_t v10 = 0;
LABEL_17:

      goto LABEL_20;
    }
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    v7[2](v7);
  }
LABEL_20:
  if ([v10 count])
  {
    __int16 v21 = [*(id *)(a1 + 40) workScheduler];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __45__EDThreadMigrator_deleteObjectIDsToMigrate___block_invoke_36;
    v26[3] = &unk_1E6BFFA78;
    v26[4] = *(void *)(a1 + 40);
    id v27 = v10;
    id v28 = *(id *)(a1 + 32);
    id v29 = v4;
    [v21 performBlock:v26];
  }
}

void __45__EDThreadMigrator_deleteObjectIDsToMigrate___block_invoke_2(id *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [a1[4] removeObjectIDs:a1[5]];
  uint64_t v2 = +[EDThreadMigrator log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[6];
    uint64_t v4 = [a1[4] generation];
    uint64_t v5 = [a1[5] count];
    uint64_t v6 = [a1[6] threadScope];
    int v7 = 134218754;
    id v8 = v3;
    __int16 v9 = 2048;
    uint64_t v10 = v4;
    __int16 v11 = 2048;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Deleting %lu threads from migration \n%{public}@", (uint8_t *)&v7, 0x2Au);
  }
}

uint64_t __45__EDThreadMigrator_deleteObjectIDsToMigrate___block_invoke_35(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isRecentlyMigrated:a2];
}

uint64_t __45__EDThreadMigrator_deleteObjectIDsToMigrate___block_invoke_36(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) threadPersistence];
  int v3 = [v2 deleteThreadsWithObjectIDs:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = [*(id *)(a1 + 56) generation];
    return [v4 _scheduleFinalizationForBatchedObjectIDs:v5 withGeneration:v6 forDelete:1];
  }
  else
  {
    id v8 = +[EDThreadMigrator log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = [*(id *)(a1 + 56) generation];
      __int16 v11 = [*(id *)(a1 + 32) threadScope];
      int v12 = 134218498;
      uint64_t v13 = v9;
      __int16 v14 = 2048;
      uint64_t v15 = v10;
      __int16 v16 = 2114;
      uint64_t v17 = v11;
      _os_log_error_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_ERROR, "%p[%lu]: Failed migration -- unable to delete threads\n%{public}@", (uint8_t *)&v12, 0x20u);
    }
    return [*(id *)(a1 + 32) _failMigration];
  }
}

- (EMThreadScope)threadScope
{
  return self->_threadScope;
}

- (EFLocked)state
{
  return self->_state;
}

- (EFScheduler)workScheduler
{
  return self->_workScheduler;
}

- (EDThreadPersistence)threadPersistence
{
  return self->_threadPersistence;
}

- (EDInMemoryThreadQueryHandler)queryHandler
{
  return self->_queryHandler;
}

- (EDThreadMigratorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EDThreadMigratorDelegate *)WeakRetained;
}

- (double)threadFinalizationInterval
{
  return self->_threadFinalizationInterval;
}

- (void)setThreadFinalizationInterval:(double)a3
{
  self->_threadFinalizationInterval = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queryHandler, 0);
  objc_storeStrong((id *)&self->_threadPersistence, 0);
  objc_storeStrong((id *)&self->_workScheduler, 0);
  objc_storeStrong((id *)&self->_state, 0);

  objc_storeStrong((id *)&self->_threadScope, 0);
}

@end