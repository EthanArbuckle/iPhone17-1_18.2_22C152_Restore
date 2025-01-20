@interface HDBackgroundWorkoutRunner
+ (BOOL)hasBackgroundPermissionForBundleIdentifier:(id)a3 errorOut:(id *)a4;
+ (id)acquireBKSAssertionForClient:(id)a3;
+ (void)releaseBKSAssertion:(id)a3 forClient:(id)a4;
- (HDBackgroundWorkoutRunner)initWithDaemon:(id)a3;
- (id)takeBackgroundRunningAssertionForOwnerIdentifier:(id)a3 client:(id)a4 includeCoreLocationAssertion:(BOOL)a5;
- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4;
- (void)assertionManager:(id)a3 assertionTaken:(id)a4;
- (void)dealloc;
- (void)processDidEnterForeground:(id)a3;
@end

@implementation HDBackgroundWorkoutRunner

- (HDBackgroundWorkoutRunner)initWithDaemon:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDBackgroundWorkoutRunner;
  v5 = [(HDBackgroundWorkoutRunner *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = (HDAssertionManager *)objc_alloc_init(MEMORY[0x1E4F65CD0]);
    assertionManager = v6->_assertionManager;
    v6->_assertionManager = v9;

    [(HDAssertionManager *)v6->_assertionManager addObserver:v6 forAssertionIdentifier:@"HDWorkoutSessionAssertionIdentifierBackgroundRunning" queue:v6->_queue];
  }

  return v6;
}

- (void)dealloc
{
  [(HDAssertionManager *)self->_assertionManager removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)HDBackgroundWorkoutRunner;
  [(HDBackgroundWorkoutRunner *)&v3 dealloc];
}

- (id)takeBackgroundRunningAssertionForOwnerIdentifier:(id)a3 client:(id)a4 includeCoreLocationAssertion:(BOOL)a5
{
  id v9 = a4;
  id v10 = a3;
  v11 = [_HDBackgroundRunningAssertion alloc];
  id v12 = v9;
  if (v11)
  {
    v17.receiver = v11;
    v17.super_class = (Class)_HDBackgroundRunningAssertion;
    v13 = [(HDBackgroundWorkoutRunner *)&v17 initWithAssertionIdentifier:@"HDWorkoutSessionAssertionIdentifierBackgroundRunning" ownerIdentifier:v10];
    v11 = (_HDBackgroundRunningAssertion *)v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13[2]._queue, a4);
      v11->_shouldAcquireCLAssertion = a5;
    }
  }

  if ([(HDAssertionManager *)self->_assertionManager takeAssertion:v11]) {
    v14 = v11;
  }
  else {
    v14 = 0;
  }
  v15 = v14;

  return v15;
}

- (void)assertionManager:(id)a3 assertionTaken:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HDBackgroundWorkoutRunner.m", 118, @"Invalid parameter not satisfying: %@", @"[assertion isKindOfClass:[_HDBackgroundRunningAssertion class]]" object file lineNumber description];
  }
  uint64_t v7 = (id *)v6;
  v23 = v7;
  if (v7) {
    id v8 = v7[11];
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  id v10 = [v9 process];
  v11 = [v10 bundleIdentifier];

  if (+[HDBackgroundWorkoutRunner hasBackgroundPermissionForBundleIdentifier:v11 errorOut:0])
  {
    id v12 = +[HDBackgroundWorkoutRunner acquireBKSAssertionForClient:v9];
    -[_HDBackgroundRunningAssertion setBksAssertion:]((uint64_t)v23, v12);

    if (v23 && *((unsigned char *)v23 + 80))
    {
      v13 = [v9 process];
      _HKInitializeLogging();
      v14 = (void *)*MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
      {
        v15 = v14;
        v16 = [v13 bundleIdentifier];
        *(_DWORD *)buf = 138543618;
        v25 = v16;
        __int16 v26 = 1024;
        int v27 = [v13 processIdentifier];
        _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_INFO, "Taking CoreLocation in-use assertion for bundle %{public}@ (%d).", buf, 0x12u);
      }
      objc_super v17 = (void *)MEMORY[0x1E4F1E5E8];
      v18 = [v13 applicationIdentifier];
      v19 = (void *)[v17 newAssertionForBundleIdentifier:v18 withReason:@"HealthKit Background Workout"];

      objc_storeStrong(v23 + 13, v19);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
    v21 = [WeakRetained processStateManager];
    [v21 registerObserver:self forBundleIdentifier:v11];
  }
}

- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  queue = self->_queue;
  id v9 = a3;
  dispatch_assert_queue_V2(queue);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __int16 v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"HDBackgroundWorkoutRunner.m", 136, @"Invalid parameter not satisfying: %@", @"[assertion isKindOfClass:[_HDBackgroundRunningAssertion class]]" object file lineNumber description];
  }
  id v10 = (id *)v7;
  int v27 = v10;
  if (v10) {
    id v11 = v10[11];
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;
  v13 = [v27 ownerIdentifier];
  v14 = [v9 activeAssertionsForIdentifier:v13];

  uint64_t v15 = [v14 count];
  if (!v15)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
    objc_super v17 = [WeakRetained processStateManager];
    v18 = [v12 process];
    v19 = [v18 bundleIdentifier];
    [v17 unregisterObserver:self forBundleIdentifier:v19];
  }
  if (v27)
  {
    id v20 = v27[13];
    if (v20)
    {
      v21 = [v12 process];
      _HKInitializeLogging();
      v22 = (void *)*MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
      {
        v23 = v22;
        v24 = [v21 bundleIdentifier];
        *(_DWORD *)buf = 138543618;
        v29 = v24;
        __int16 v30 = 1024;
        int v31 = [v21 processIdentifier];
        _os_log_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_INFO, "Releasing CoreLocation in-use assertion for bundle %{public}@ (%d)", buf, 0x12u);
      }
      [v20 invalidate];
    }
    id v25 = v27[12];
  }
  else
  {
    id v25 = 0;
  }
  +[HDBackgroundWorkoutRunner releaseBKSAssertion:v25 forClient:v12];
}

- (void)processDidEnterForeground:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__HDBackgroundWorkoutRunner_processDidEnterForeground___block_invoke;
  v7[3] = &unk_1E62F31C0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __55__HDBackgroundWorkoutRunner_processDidEnterForeground___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v24 = v16;
    _os_log_debug_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEBUG, "Application entered foreground: %@", buf, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 40) + 16) activeAssertionsForIdentifier:@"HDWorkoutSessionAssertionIdentifierBackgroundRunning"];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v18 + 1) + 8 * v6);
        if (v7) {
          id v8 = *(void **)(v7 + 88);
        }
        else {
          id v8 = 0;
        }
        id v9 = v8;
        id v10 = [v9 process];
        id v11 = [v10 bundleIdentifier];
        int v12 = [v11 isEqualToString:*(void *)(a1 + 32)];

        if (v12)
        {
          if (v7) {
            uint64_t v13 = *(void *)(v7 + 96);
          }
          else {
            uint64_t v13 = 0;
          }
          +[HDBackgroundWorkoutRunner releaseBKSAssertion:v13 forClient:v9];
          v14 = +[HDBackgroundWorkoutRunner acquireBKSAssertionForClient:v9];
          -[_HDBackgroundRunningAssertion setBksAssertion:](v7, v14);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v15 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v4 = v15;
    }
    while (v15);
  }
}

+ (BOOL)hasBackgroundPermissionForBundleIdentifier:(id)a3 errorOut:(id *)a4
{
  _HKInitializeLogging();
  uint64_t v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_debug_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEBUG, "Client does not have background run mode. Will not take process assertion", v6, 2u);
  }
  return 0;
}

+ (id)acquireBKSAssertionForClient:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 process];
  uint64_t v4 = [v3 bundleIdentifier];
  _HKInitializeLogging();
  uint64_t v5 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v4;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_INFO, "Taking background workout assertion for process %{public}@", buf, 0xCu);
  }
  id v6 = objc_alloc(MEMORY[0x1E4F4E280]);
  uint64_t v7 = [v3 processIdentifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__HDBackgroundWorkoutRunner_acquireBKSAssertionForClient___block_invoke;
  v11[3] = &unk_1E62F8588;
  id v12 = v4;
  id v8 = v4;
  id v9 = (void *)[v6 initWithPID:v7 flags:3 reason:19 name:@"HealthKit Background Workout" withHandler:v11];

  return v9;
}

void __58__HDBackgroundWorkoutRunner_acquireBKSAssertionForClient___block_invoke(uint64_t a1, char a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v3 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138543362;
      uint64_t v6 = v4;
      _os_log_error_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_ERROR, "Failed to acquire assertion for : %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
}

+ (void)releaseBKSAssertion:(id)a3 forClient:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    _HKInitializeLogging();
    uint64_t v7 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
    {
      id v8 = v7;
      id v9 = [v6 process];
      id v10 = [v9 bundleIdentifier];
      id v11 = [v6 process];
      int v12 = 138543618;
      uint64_t v13 = v10;
      __int16 v14 = 1024;
      int v15 = [v11 processIdentifier];
      _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_INFO, "Releasing background workout assertion for process %{public}@ (%d)", (uint8_t *)&v12, 0x12u);
    }
    [v5 invalidate];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);

  objc_destroyWeak((id *)&self->_daemon);
}

@end