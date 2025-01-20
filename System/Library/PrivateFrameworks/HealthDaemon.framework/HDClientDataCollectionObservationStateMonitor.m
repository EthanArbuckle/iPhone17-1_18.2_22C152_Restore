@interface HDClientDataCollectionObservationStateMonitor
- (HDClientDataCollectionObservationStateMonitor)init;
- (HDClientDataCollectionObservationStateMonitor)initWithClient:(id)a3 delegate:(id)a4;
- (HDClientDataCollectionObservationStateMonitorDelegate)delegate;
- (HDHealthStoreClient)client;
- (HDProfile)profile;
- (id)currentObserverState;
- (uint64_t)_componentStateDidChange;
- (void)dealloc;
- (void)invalidate;
- (void)setDelegate:(id)a3;
@end

@implementation HDClientDataCollectionObservationStateMonitor

- (HDClientDataCollectionObservationStateMonitor)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDClientDataCollectionObservationStateMonitor)initWithClient:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HDClientDataCollectionObservationStateMonitor;
  v9 = [(HDClientDataCollectionObservationStateMonitor *)&v21 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_client, a3);
    v11 = [v7 profile];
    objc_storeWeak((id *)&v10->_profile, v11);

    objc_storeWeak((id *)&v10->_delegate, v8);
    v12 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v10->_lock;
    v10->_lock = v12;

    id WeakRetained = objc_loadWeakRetained((id *)&v10->_profile);
    v15 = [WeakRetained daemon];
    v16 = [v15 processStateManager];
    v17 = [(HDHealthStoreClient *)v10->_client process];
    v18 = [v17 bundleIdentifier];
    [v16 registerObserver:v10 forBundleIdentifier:v18];

    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:v10 selector:sel_workoutManagerDidChangeState_ name:@"HDWorkoutManagerStateDidChange" object:0];
  }
  return v10;
}

- (void)dealloc
{
  [(HDClientDataCollectionObservationStateMonitor *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HDClientDataCollectionObservationStateMonitor;
  [(HDClientDataCollectionObservationStateMonitor *)&v3 dealloc];
}

- (void)invalidate
{
  char v2 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_invalidated, (unsigned __int8 *)&v2, 1u);
  if (!v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v5 = [WeakRetained daemon];
    v6 = [v5 processStateManager];
    id v7 = [(HDHealthStoreClient *)self->_client process];
    id v8 = [v7 bundleIdentifier];
    [v6 unregisterObserver:self forBundleIdentifier:v8];

    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 removeObserver:self];
  }
}

- (id)currentObserverState
{
  objc_super v3 = [(HDHealthStoreClient *)self->_client process];
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v6 = [WeakRetained daemon];
  id v7 = [v6 processStateManager];
  id v8 = [v3 bundleIdentifier];
  unsigned int v34 = [v7 isApplicationStateForegroundForBundleIdentifier:v8];

  id v9 = objc_loadWeakRetained((id *)p_profile);
  v10 = [v9 workoutManager];
  v11 = [v10 currentWorkoutClient];
  v12 = [v11 process];
  v13 = [v12 applicationIdentifier];
  v14 = [v3 applicationIdentifier];
  if (v13 == v14)
  {
    uint64_t v20 = 1;
  }
  else
  {
    v15 = [v3 applicationIdentifier];
    v33 = p_profile;
    if (v15)
    {
      v31 = v15;
      id v30 = objc_loadWeakRetained((id *)p_profile);
      v29 = [v30 workoutManager];
      v28 = [v29 currentWorkoutClient];
      [v28 process];
      v16 = v32 = v10;
      v17 = [v16 applicationIdentifier];
      v18 = [v3 applicationIdentifier];
      uint64_t v19 = [v17 isEqualToString:v18];

      v10 = v32;
      v15 = v31;
    }
    else
    {
      uint64_t v19 = 0;
    }

    uint64_t v20 = v19;
    p_profile = v33;
  }

  id v21 = objc_loadWeakRetained((id *)p_profile);
  v22 = [v21 daemon];
  v23 = [v22 processStateManager];
  v24 = [v3 bundleIdentifier];
  uint64_t v25 = [v23 isApplicationStateBackgroundRunningForBundleIdentifier:v24];

  v26 = +[HDDataCollectionObserverState dataCollectionObserverStateInForeground:v34 hasRunningWorkout:v20 hasBackgroundObserver:v25];

  return v26;
}

- (uint64_t)_componentStateDidChange
{
  if (result)
  {
    v1 = *(void **)(result + 8);
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __73__HDClientDataCollectionObservationStateMonitor__componentStateDidChange__block_invoke;
    v2[3] = &unk_1E62F3208;
    v2[4] = result;
    return objc_msgSend(v1, "hk_withLock:", v2);
  }
  return result;
}

void __73__HDClientDataCollectionObservationStateMonitor__componentStateDidChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained dataCollectionObservationStateDidChangeForClient:*(void *)(*(void *)(a1 + 32) + 24)];
}

- (HDHealthStoreClient)client
{
  return self->_client;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (HDClientDataCollectionObservationStateMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDClientDataCollectionObservationStateMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_client, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

@end