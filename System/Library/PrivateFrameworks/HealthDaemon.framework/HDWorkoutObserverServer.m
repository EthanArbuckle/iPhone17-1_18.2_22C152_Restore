@interface HDWorkoutObserverServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (HDWorkoutObserverServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)_sendSnapshotForWorkout:(void *)a1;
- (void)dealloc;
- (void)remote_startTaskServerIfNeeded;
- (void)remote_waitForAutomaticWorkoutRecoveryWithCompletion:(id)a3;
- (void)workoutDataAccumulator:(id)a3 didUpdateEvents:(id)a4;
- (void)workoutDataAccumulator:(id)a3 didUpdateStartDate:(id)a4;
- (void)workoutManager:(id)a3 currentWorkout:(id)a4 didChangeToState:(int64_t)a5;
- (void)workoutManager:(id)a3 currentWorkout:(id)a4 didUpdateDataAccumulator:(id)a5;
- (void)workoutManager:(id)a3 didUpdateCurrentWorkout:(id)a4;
@end

@implementation HDWorkoutObserverServer

- (HDWorkoutObserverServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)HDWorkoutObserverServer;
  v6 = [(HDStandardTaskServer *)&v10 initWithUUID:a3 configuration:a4 client:a5 delegate:a6];
  if (v6)
  {
    v7 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v6->_lock;
    v6->_lock = v7;
  }
  return v6;
}

- (void)dealloc
{
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__HDWorkoutObserverServer_dealloc__block_invoke;
  v5[3] = &unk_1E62F3208;
  v5[4] = self;
  [(NSLock *)lock hk_withLock:v5];
  v4.receiver = self;
  v4.super_class = (Class)HDWorkoutObserverServer;
  [(HDWorkoutObserverServer *)&v4 dealloc];
}

void __34__HDWorkoutObserverServer_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 40))
  {
    v3 = [*(id *)(v1 + 48) workoutDataAccumulator];
    [v3 removeDataAccumulationObserver:*(void *)(a1 + 32)];

    id v5 = [*(id *)(a1 + 32) profile];
    objc_super v4 = [v5 workoutManager];
    [v4 unregisterCurrentWorkoutObserver:*(void *)(a1 + 32)];
  }
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E4F2BC70];
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2A548];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  return 1;
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F2B9A0] serverInterface];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F2B9A0] clientInterface];
}

- (void)remote_startTaskServerIfNeeded
{
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__HDWorkoutObserverServer_remote_startTaskServerIfNeeded__block_invoke;
  v6[3] = &unk_1E62F3208;
  v6[4] = self;
  [(NSLock *)lock hk_withLock:v6];
  objc_super v4 = [(HDStandardTaskServer *)self profile];
  id v5 = [v4 workoutManager];
  [v5 registerCurrentWorkoutObserver:self];
}

uint64_t __57__HDWorkoutObserverServer_remote_startTaskServerIfNeeded__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 40)) {
    *(unsigned char *)(v1 + 40) = 1;
  }
  return result;
}

- (void)remote_waitForAutomaticWorkoutRecoveryWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(HDStandardTaskServer *)self profile];
  id v5 = [v6 workoutManager];
  [v5 performWhenPostLaunchSessionRecoveryHasCompleted:v4];
}

- (void)workoutManager:(id)a3 didUpdateCurrentWorkout:(id)a4
{
  id v5 = a4;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__HDWorkoutObserverServer_workoutManager_didUpdateCurrentWorkout___block_invoke;
  v8[3] = &unk_1E62F31C0;
  id v9 = v5;
  objc_super v10 = self;
  id v7 = v5;
  [(NSLock *)lock hk_withLock:v8];
  -[HDWorkoutObserverServer _sendSnapshotForWorkout:](self, v7);
}

void __66__HDWorkoutObserverServer_workoutManager_didUpdateCurrentWorkout___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    v3 = *(void **)(*(void *)(a1 + 40) + 48);
    if (v3)
    {
      id v4 = [v3 workoutDataAccumulator];
      [v4 removeDataAccumulationObserver:*(void *)(a1 + 40)];

      v2 = *(void **)(a1 + 32);
    }
    else
    {
      v2 = 0;
    }
  }
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 48), v2);
  id v5 = [*(id *)(a1 + 32) workoutDataAccumulator];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) workoutDataAccumulator];
    [v6 addDataAccumulationObserver:*(void *)(a1 + 40)];
  }
}

- (void)_sendSnapshotForWorkout:(void *)a1
{
  if (a1)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__HDWorkoutObserverServer__sendSnapshotForWorkout___block_invoke;
    v6[3] = &unk_1E62F3170;
    v6[4] = a1;
    id v3 = a2;
    id v4 = [a1 remoteObjectProxyWithErrorHandler:v6];
    id v5 = [v3 currentWorkoutSnapshot];

    objc_msgSend(v4, "clientRemote_didUpdateWorkoutSnapshot:", v5);
  }
}

- (void)workoutManager:(id)a3 currentWorkout:(id)a4 didChangeToState:(int64_t)a5
{
}

- (void)workoutManager:(id)a3 currentWorkout:(id)a4 didUpdateDataAccumulator:(id)a5
{
  id v7 = a5;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__HDWorkoutObserverServer_workoutManager_currentWorkout_didUpdateDataAccumulator___block_invoke;
  v11[3] = &unk_1E62F31C0;
  id v12 = v7;
  v13 = self;
  id v9 = v7;
  id v10 = a4;
  [(NSLock *)lock hk_withLock:v11];
  -[HDWorkoutObserverServer _sendSnapshotForWorkout:](self, v10);
}

uint64_t __82__HDWorkoutObserverServer_workoutManager_currentWorkout_didUpdateDataAccumulator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addDataAccumulationObserver:*(void *)(a1 + 40)];
}

- (void)workoutDataAccumulator:(id)a3 didUpdateEvents:(id)a4
{
}

- (void)workoutDataAccumulator:(id)a3 didUpdateStartDate:(id)a4
{
}

void __51__HDWorkoutObserverServer__sendSnapshotForWorkout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of new snapshot: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);

  objc_storeStrong((id *)&self->_currentWorkout, 0);
}

@end