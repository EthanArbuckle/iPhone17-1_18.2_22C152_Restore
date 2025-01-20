@interface HDWorkoutMirroringManager
- (HDMirroredWorkoutAnalyticsCollector)analyticsCollector;
- (HDWorkoutMirroringManager)initWithWorkoutManager:(id)a3;
- (id)activeSessionBundleIdentifier;
- (void)_createServerWithData:(id)a3 completion:(id)a4;
- (void)_takeBackgroundRuntimeAssertionForProcessWithBundleIdentifier:(id)a3 pid:(int)a4;
- (void)dealloc;
- (void)launchClientWithBundleIdentifier:(id)a3;
- (void)profileDidBecomeReady:(id)a3;
- (void)rapportMessenger:(id)a3 didReceiveRequest:(id)a4 data:(id)a5 responseHandler:(id)a6;
- (void)recoverMirroredWorkoutSessionWithCompletion:(id)a3;
- (void)setActiveSessionBundleIdentifier:(id)a3;
- (void)setAnalyticsCollector:(id)a3;
@end

@implementation HDWorkoutMirroringManager

- (HDWorkoutMirroringManager)initWithWorkoutManager:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HDWorkoutMirroringManager;
  v5 = [(HDWorkoutMirroringManager *)&v17 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_workoutManager, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    assertionsByBundleIdentifier = v6->_assertionsByBundleIdentifier;
    v6->_assertionsByBundleIdentifier = v7;

    v9 = objc_alloc_init(HDMirroredWorkoutAnalyticsCollector);
    analyticsCollector = v6->_analyticsCollector;
    v6->_analyticsCollector = v9;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_workoutManager);
    v12 = [WeakRetained profile];
    [v12 registerProfileReadyObserver:v6 queue:0];

    id v13 = objc_loadWeakRetained((id *)&v6->_workoutManager);
    v14 = [v13 profile];
    v15 = [v14 rapportMessenger];
    [v15 addObserver:v6 forSchemaIdentifier:0];
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = [(NSMutableDictionary *)self->_assertionsByBundleIdentifier allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    v7 = (os_log_t *)MEMORY[0x1E4F29FB8];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v9 isValid])
        {
          id v15 = 0;
          char v10 = [v9 invalidateSyncWithError:&v15];
          id v11 = v15;
          if ((v10 & 1) == 0)
          {
            _HKInitializeLogging();
            v12 = *v7;
            if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v21 = self;
              __int16 v22 = 2114;
              id v23 = v11;
              _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to invalidate existing background runtime assertion with error: %{public}@", buf, 0x16u);
            }
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v5);
  }

  os_unfair_lock_unlock(lock);
  v14.receiver = self;
  v14.super_class = (Class)HDWorkoutMirroringManager;
  [(HDWorkoutMirroringManager *)&v14 dealloc];
}

- (void)setActiveSessionBundleIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  p_workoutManager = &self->_workoutManager;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_workoutManager);
  uint64_t v6 = [WeakRetained profile];
  v7 = HDMirroredWorkoutSessionKeyValueDomainWithProfile(v6);

  id v10 = 0;
  LOBYTE(WeakRetained) = [v7 setString:v4 forKey:@"active-session-bundle-id" error:&v10];

  id v8 = v10;
  if ((WeakRetained & 1) == 0)
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v8;
      _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "[mirroring] Failed to persist the active mirrored session bundle identifier: %{public}@.", buf, 0xCu);
    }
  }
}

- (id)activeSessionBundleIdentifier
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workoutManager);
  v3 = [WeakRetained profile];
  id v4 = HDMirroredWorkoutSessionKeyValueDomainWithProfile(v3);

  id v9 = 0;
  uint64_t v5 = [v4 stringForKey:@"active-session-bundle-id" error:&v9];
  id v6 = v9;
  if (v6)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "[mirroring] Failed to read active session bundle identifier: %{public}@", buf, 0xCu);
    }
  }

  return v5;
}

- (void)profileDidBecomeReady:(id)a3
{
}

- (void)rapportMessenger:(id)a3 didReceiveRequest:(id)a4 data:(id)a5 responseHandler:(id)a6
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_super v14 = [v11 name];
  int v15 = [v14 isEqualToString:@"startMirroring"];

  if (v15)
  {
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __85__HDWorkoutMirroringManager_rapportMessenger_didReceiveRequest_data_responseHandler___block_invoke;
    v69[3] = &unk_1E62FA1A8;
    v70 = (HDCodableWorkoutSessionSyncTransaction *)v13;
    [(HDWorkoutMirroringManager *)self _createServerWithData:v12 completion:v69];
    long long v16 = v70;
  }
  else
  {
    long long v17 = [v11 name];
    int v18 = [v17 isEqualToString:@"recoverSession"];

    if (v18)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_workoutManager);
      long long v16 = [WeakRetained currentWorkout];

      if (v16)
      {
        v20 = [(HDCodableWorkoutSessionSyncTransaction *)v16 syncController];
        [v20 rapportMessenger:v10 didReceiveRequest:v11 data:v12 responseHandler:v13];
      }
      else
      {
        id v29 = objc_loadWeakRetained((id *)&self->_workoutManager);
        v30 = [v29 profile];
        id v68 = 0;
        v31 = +[HDWorkoutSessionServer sessionIdentifierForRecoveryInProfile:v30 error:&v68];
        id v32 = v68;

        _HKInitializeLogging();
        v33 = (void *)*MEMORY[0x1E4F29FB8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
        {
          v45 = v33;
          v46 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v72 = v46;
          __int16 v73 = 2114;
          v74 = v31;
          __int16 v75 = 2114;
          id v76 = v32;
          id v47 = v46;
          _os_log_error_impl(&dword_1BCB7D000, v45, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Queried persisted session identifier: %{public}@, error: %{public}@", buf, 0x20u);
        }
        (*((void (**)(id, void, id))v13 + 2))(v13, 0, v32);

        long long v16 = 0;
      }
    }
    else
    {
      long long v16 = [[HDCodableWorkoutSessionSyncTransaction alloc] initWithData:v12];
      v21 = (void *)MEMORY[0x1E4F29128];
      __int16 v22 = [(HDCodableWorkoutSessionSyncTransaction *)v16 sessionUUID];
      id v23 = objc_msgSend(v21, "hk_UUIDWithData:", v22);

      if (v23)
      {
        v24 = v23;
        id v25 = objc_loadWeakRetained((id *)&self->_workoutManager);
        v26 = [v25 sessionServers];
        v59 = v24;
        v27 = [v26 objectForKeyedSubscript:v24];

        if (v27)
        {
          v28 = [v27 syncController];
          [v28 rapportMessenger:v10 didReceiveRequest:v11 data:v12 responseHandler:v13];

          id v23 = v59;
        }
        else
        {
          _HKInitializeLogging();
          v35 = (void *)*MEMORY[0x1E4F29FB8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
          {
            v52 = v35;
            v53 = objc_opt_class();
            id v58 = v53;
            v54 = [v11 name];
            *(_DWORD *)buf = 138543874;
            v72 = v53;
            __int16 v73 = 2114;
            v74 = v59;
            __int16 v75 = 2114;
            id v76 = v54;
            _os_log_error_impl(&dword_1BCB7D000, v52, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Session server %{public}@ doesn't exist to handle request %{public}@", buf, 0x20u);
          }
          v36 = [MEMORY[0x1E4F2B860] sharedBehavior];
          int v37 = [v36 isCompanionCapable];

          if (v37)
          {
            v61[0] = MEMORY[0x1E4F143A8];
            v61[1] = 3221225472;
            v61[2] = __85__HDWorkoutMirroringManager_rapportMessenger_didReceiveRequest_data_responseHandler___block_invoke_296;
            v61[3] = &unk_1E630DD68;
            id v67 = v13;
            id v23 = v59;
            id v62 = v59;
            id v63 = 0;
            id v64 = v10;
            id v65 = v11;
            id v66 = v12;
            [(HDWorkoutMirroringManager *)self recoverMirroredWorkoutSessionWithCompletion:v61];
          }
          else
          {
            id v38 = objc_loadWeakRetained((id *)&self->_workoutManager);
            v39 = [v38 profile];
            id v60 = 0;
            v40 = +[HDWorkoutSessionServer sessionIdentifierForRecoveryInProfile:v39 error:&v60];
            id v41 = v60;

            _HKInitializeLogging();
            v42 = (void *)*MEMORY[0x1E4F29FB8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
            {
              v55 = v42;
              v56 = objc_opt_class();
              *(_DWORD *)buf = 138543874;
              v72 = v56;
              __int16 v73 = 2114;
              v74 = v40;
              __int16 v75 = 2114;
              id v76 = v41;
              id v57 = v56;
              _os_log_error_impl(&dword_1BCB7D000, v55, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Queried persisted session identifier: %{public}@, error: %{public}@", buf, 0x20u);
            }
            id v23 = v59;
            if (([v59 isEqual:v40] & 1) != 0 || v41)
            {
              uint64_t v43 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Unable to complete mirrored workout session request (#3).");
            }
            else
            {
              uint64_t v43 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 118, @"Workout session %@ doesn't exist.", v59);
            }
            v44 = (void *)v43;
            (*((void (**)(id, void, uint64_t))v13 + 2))(v13, 0, v43);
          }
          v27 = 0;
        }
      }
      else
      {
        _HKInitializeLogging();
        v34 = (void *)*MEMORY[0x1E4F29FB8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
        {
          v48 = v34;
          v49 = objc_opt_class();
          id v50 = v49;
          v51 = [v11 name];
          *(_DWORD *)buf = 138543618;
          v72 = v49;
          __int16 v73 = 2114;
          v74 = v51;
          _os_log_error_impl(&dword_1BCB7D000, v48, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Malformed incoming request %{public}@: session UUID is missing.", buf, 0x16u);

          id v23 = 0;
        }
        v27 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Unable to complete mirrored workout session request (#1).");
        (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v27);
      }
    }
  }
}

uint64_t __85__HDWorkoutMirroringManager_rapportMessenger_didReceiveRequest_data_responseHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __85__HDWorkoutMirroringManager_rapportMessenger_didReceiveRequest_data_responseHandler___block_invoke_296(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = [v10 identifier];
    int v7 = [v6 isEqual:*(void *)(a1 + 32)];

    if (!v7) {
      goto LABEL_6;
    }
    id v8 = [*(id *)(a1 + 40) syncController];
    [v8 rapportMessenger:*(void *)(a1 + 48) didReceiveRequest:*(void *)(a1 + 56) data:*(void *)(a1 + 64) responseHandler:*(void *)(a1 + 72)];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 72);
    id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Unable to complete mirrored workout session request (#2).");
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v8);
  }

LABEL_6:
}

- (void)_createServerWithData:(id)a3 completion:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void (**)(id, void *, void))a4;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v9 = [[HDCodableWorkoutSessionSyncTransaction alloc] initWithData:v6];
  id v10 = (void *)MEMORY[0x1E4F29128];
  id v11 = [(HDCodableWorkoutSessionSyncTransaction *)v9 sessionUUID];
  id v12 = objc_msgSend(v10, "hk_UUIDWithData:", v11);

  id v13 = (void *)MEMORY[0x1E4F2B768];
  objc_super v14 = [(HDCodableWorkoutSessionSyncTransaction *)v9 configuration];
  int v15 = [v14 workoutConfiguration];
  long long v16 = [v13 createWithCodable:v15];

  long long v17 = [(HDCodableWorkoutSessionSyncTransaction *)v9 configuration];
  int v18 = [v17 sourceBundleIdentifier];

  if (v12 && v16 && v18)
  {
    v40 = v16;
    id v41 = v6;
    p_workoutManager = &self->_workoutManager;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_workoutManager);
    v21 = [WeakRetained sessionServers];
    __int16 v22 = [v21 objectForKeyedSubscript:v12];

    if (v22)
    {
      os_unfair_lock_unlock(&self->_lock);
      v7[2](v7, v22, 0);
      long long v16 = v40;
      id v6 = v41;
    }
    else
    {
      id v42 = 0;
      v24 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v18 allowPlaceholder:0 error:&v42];
      id v39 = v42;
      if (v24)
      {
        id v25 = [v24 applicationState];
        char v26 = [v25 isInstalled];

        if (v26)
        {
          [(HDWorkoutMirroringManager *)self setActiveSessionBundleIdentifier:v18];
          v27 = [HDMirroredWorkoutSessionServer alloc];
          id v37 = objc_loadWeakRetained((id *)p_workoutManager);
          [v37 profile];
          v28 = id v38 = v24;
          id v29 = [(HDCodableWorkoutSessionSyncTransaction *)v9 globalState];
          long long v16 = v40;
          v30 = [(HDMirroredWorkoutSessionServer *)v27 initWithProfile:v28 configuration:v40 sessionUUID:v12 globalState:v29 clientBundleIdentifier:v18];

          v24 = v38;
          id v31 = objc_loadWeakRetained((id *)p_workoutManager);
          [v31 _didCreateMirroredSessionServer:v30];

          os_unfair_lock_unlock(p_lock);
          v7[2](v7, v30, 0);
          id v6 = v41;
        }
        else
        {
          os_unfair_lock_unlock(&self->_lock);
          _HKInitializeLogging();
          v34 = *MEMORY[0x1E4F29FB8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v44 = v18;
            _os_log_error_impl(&dword_1BCB7D000, v34, OS_LOG_TYPE_ERROR, "[mirroring] Ignoring workout session mirroring request because the companion app %{public}@ is not installed.", buf, 0xCu);
          }
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 552, @"Application is not installed on companion device.");
          v30 = (HDMirroredWorkoutSessionServer *)objc_claimAutoreleasedReturnValue();
          ((void (**)(id, void *, HDMirroredWorkoutSessionServer *))v7)[2](v7, 0, v30);
          long long v16 = v40;
          id v6 = v41;
        }
        v33 = v39;
      }
      else
      {
        os_unfair_lock_unlock(&self->_lock);
        _HKInitializeLogging();
        id v32 = *MEMORY[0x1E4F29FB8];
        v33 = v39;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v44 = v39;
          _os_log_error_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_ERROR, "[mirroring] Unable to fetch LSApplicationRecord to start mirrored workout session with error: %{public}@", buf, 0xCu);
        }
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Failed to start mirroring workout session.");
        v30 = (HDMirroredWorkoutSessionServer *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, void *, HDMirroredWorkoutSessionServer *))v7)[2](v7, 0, v30);
        long long v16 = v40;
        id v6 = v41;
      }

      __int16 v22 = 0;
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    _HKInitializeLogging();
    id v23 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      v35 = v23;
      v36 = [(HDCodableWorkoutSessionSyncTransaction *)v9 configuration];
      *(_DWORD *)buf = 138543874;
      id v44 = v12;
      __int16 v45 = 2114;
      v46 = v36;
      __int16 v47 = 2114;
      id v48 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_ERROR, "[mirroring] Cannot start mirroring with invalid request. Session UUID: %{public}@, configuration: %{public}@, data: %{public}@", buf, 0x20u);
    }
    __int16 v22 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Failed to start mirroring workout session.");
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v22);
  }
}

- (void)recoverMirroredWorkoutSessionWithCompletion:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__HDWorkoutMirroringManager_recoverMirroredWorkoutSessionWithCompletion___block_invoke;
  aBlock[3] = &unk_1E62FA1A8;
  id v19 = v4;
  id v5 = _Block_copy(aBlock);
  id v6 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v7 = [v6 isCompanionCapable];

  if (v7)
  {
    _HKInitializeLogging();
    id v8 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = v8;
      id v10 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v21 = v10;
      id v11 = v10;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Running session recovering.", buf, 0xCu);
    }
    id v12 = [[HDRapportRequestIdentifier alloc] initWithSchemaIdentifier:0 name:@"recoverSession"];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_workoutManager);
    objc_super v14 = [WeakRetained profile];
    int v15 = [v14 rapportMessenger];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __73__HDWorkoutMirroringManager_recoverMirroredWorkoutSessionWithCompletion___block_invoke_316;
    v16[3] = &unk_1E630DD90;
    v16[4] = self;
    id v17 = v5;
    [v15 sendRequest:v12 data:0 completion:v16];
  }
  else
  {
    (*((void (**)(void *, void, void))v5 + 2))(v5, 0, 0);
  }
}

uint64_t __73__HDWorkoutMirroringManager_recoverMirroredWorkoutSessionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __73__HDWorkoutMirroringManager_recoverMirroredWorkoutSessionWithCompletion___block_invoke_316(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    _HKInitializeLogging();
    char v7 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "[mirroring] Failed to recover mirrored workout session: %{public}@", buf, 0xCu);
    }
  }
  id v8 = *(void **)(a1 + 32);
  if (v5)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __73__HDWorkoutMirroringManager_recoverMirroredWorkoutSessionWithCompletion___block_invoke_317;
    v10[3] = &unk_1E62FA1A8;
    id v11 = *(id *)(a1 + 40);
    [v8 _createServerWithData:v5 completion:v10];
  }
  else
  {
    uint64_t v9 = [*(id *)(a1 + 32) activeSessionBundleIdentifier];
    [v8 launchClientWithBundleIdentifier:v9];

    [*(id *)(a1 + 32) setActiveSessionBundleIdentifier:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __73__HDWorkoutMirroringManager_recoverMirroredWorkoutSessionWithCompletion___block_invoke_317(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)launchClientWithBundleIdentifier:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F629E0];
    uint64_t v10 = *MEMORY[0x1E4F625F8];
    v11[0] = MEMORY[0x1E4F1CC38];
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __62__HDWorkoutMirroringManager_launchClientWithBundleIdentifier___block_invoke;
    v7[3] = &unk_1E630DDB8;
    id v8 = v4;
    uint64_t v9 = self;
    objc_msgSend(v5, "hd_openApplication:optionsDictionary:completion:", v8, v6, v7);
  }
}

void __62__HDWorkoutMirroringManager_launchClientWithBundleIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  _HKInitializeLogging();
  char v7 = *MEMORY[0x1E4F29FB8];
  id v8 = *MEMORY[0x1E4F29FB8];
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = v7;
      int v12 = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 1024;
      LODWORD(v15) = [v5 pid];
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "[mirroring] Launched %{public}@ with pid: %d", (uint8_t *)&v12, 0x12u);
    }
    objc_msgSend(*(id *)(a1 + 40), "_takeBackgroundRuntimeAssertionForProcessWithBundleIdentifier:pid:", *(void *)(a1 + 32), objc_msgSend(v5, "pid"));
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = 138543618;
    uint64_t v13 = v11;
    __int16 v14 = 2114;
    id v15 = v6;
    _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "[mirroring] Failed to launch %{public}@ with error: %{public}@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)_takeBackgroundRuntimeAssertionForProcessWithBundleIdentifier:(id)a3 pid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v8 = [(NSMutableDictionary *)self->_assertionsByBundleIdentifier objectForKeyedSubscript:v6];
  if (![v8 isValid]) {
    goto LABEL_4;
  }
  id v20 = 0;
  char v9 = [v8 invalidateSyncWithError:&v20];
  id v10 = v20;
  uint64_t v11 = v10;
  if (v9)
  {

LABEL_4:
    uint64_t v11 = [MEMORY[0x1E4F96478] targetWithPid:v4];
    int v12 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.healthd" name:@"MirroredWorkoutSessionUpdate"];
    v25[0] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];

    __int16 v14 = (void *)[objc_alloc(MEMORY[0x1E4F96318]) initWithExplanation:@"Mirrored Workout Session Update" target:v11 attributes:v13];
    [v14 setInvalidationHandler:&__block_literal_global_240];
    id v19 = 0;
    int v15 = [v14 acquireWithError:&v19];
    id v16 = v19;
    if (v15)
    {
      [(NSMutableDictionary *)self->_assertionsByBundleIdentifier setObject:v14 forKeyedSubscript:v6];
    }
    else
    {
      _HKInitializeLogging();
      id v17 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v22 = v6;
        __int16 v23 = 2114;
        id v24 = v16;
        _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "[mirroring] Failed to acquire background runtime assertion for process %{public}@: %{public}@", buf, 0x16u);
      }
    }
    os_unfair_lock_unlock(p_lock);

    goto LABEL_12;
  }
  _HKInitializeLogging();
  int v18 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = v11;
    _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "[mirroring] Failed to invalidate existing background runtime assertion with error: %{public}@", buf, 0xCu);
  }
  os_unfair_lock_unlock(p_lock);
LABEL_12:
}

void __95__HDWorkoutMirroringManager__takeBackgroundRuntimeAssertionForProcessWithBundleIdentifier_pid___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    id v8 = v4;
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "[mirroring] Background runtime assertion %{public}@ was invalidated with error: %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

- (HDMirroredWorkoutAnalyticsCollector)analyticsCollector
{
  return self->_analyticsCollector;
}

- (void)setAnalyticsCollector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsCollector, 0);
  objc_storeStrong((id *)&self->_assertionsByBundleIdentifier, 0);

  objc_destroyWeak((id *)&self->_workoutManager);
}

@end