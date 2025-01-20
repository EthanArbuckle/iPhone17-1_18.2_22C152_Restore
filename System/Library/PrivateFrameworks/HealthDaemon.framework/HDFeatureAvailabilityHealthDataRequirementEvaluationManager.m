@interface HDFeatureAvailabilityHealthDataRequirementEvaluationManager
- (BOOL)registerObserver:(id)a3 forRequirements:(id)a4 queue:(id)a5 error:(id *)a6;
- (HDFeatureAvailabilityHealthDataRequirementEvaluationManager)initWithProfile:(id)a3;
- (id)_evaluatorForRequirement:(void *)a3 error:;
- (id)evaluationOfRequirements:(id)a3 error:(id *)a4;
- (void)registerObserver:(id)a3 forRequirements:(id)a4 queue:(id)a5;
- (void)unregisterObserver:(id)a3;
@end

@implementation HDFeatureAvailabilityHealthDataRequirementEvaluationManager

- (HDFeatureAvailabilityHealthDataRequirementEvaluationManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDFeatureAvailabilityHealthDataRequirementEvaluationManager;
  v5 = [(HDFeatureAvailabilityHealthDataRequirementEvaluationManager *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    lock_observedRequirementsByObserver = v6->_lock_observedRequirementsByObserver;
    v6->_lock_observedRequirementsByObserver = (NSMapTable *)v7;
  }
  return v6;
}

- (id)evaluationOfRequirements:(id)a3 error:(id *)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v6;
  uint64_t v33 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v33)
  {
    uint64_t v8 = *(void *)v35;
    v26 = a4;
    uint64_t v27 = *(void *)v35;
    v28 = self;
    while (2)
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(id *)(*((void *)&v34 + 1) + 8 * i);
        v11 = v10;
        if (!self)
        {

LABEL_27:
          v24 = 0;
          goto LABEL_28;
        }
        v12 = -[HDFeatureAvailabilityHealthDataRequirementEvaluationManager _evaluatorForRequirement:error:]((uint64_t)self, v10, a4);
        v13 = v12;
        if (v12)
        {
          id v38 = 0;
          v14 = [v12 isRequirementSatisfied:v11 error:&v38];
          id v15 = v38;
          if (v14)
          {
            id v16 = v14;
          }
          else
          {
            v32 = [(id)objc_opt_class() requirementIdentifier];
            _HKInitializeLogging();
            v17 = HKLogInfrastructure();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543874;
              v45 = self;
              __int16 v46 = 2114;
              v47 = v32;
              __int16 v48 = 2114;
              id v49 = v15;
              _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "[%{public}@] Error evaluating requirement %{public}@: %{public}@", buf, 0x20u);
            }

            v18 = (void *)MEMORY[0x1E4F28C58];
            if (v15)
            {
              v19 = [v15 domain];
              uint64_t v29 = [v15 code];
              v30 = [v15 userInfo];
              v42 = @"HKFeatureAvailabilityRequirementIdentifier";
              v43 = v32;
              v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
              objc_msgSend(v30, "hk_dictionaryByAddingEntriesFromDictionary:", v20);
              v22 = id v21 = v7;
              v23 = [v18 errorWithDomain:v19 code:v29 userInfo:v22];

              id v7 = v21;
              a4 = v26;
            }
            else
            {
              v40 = @"HKFeatureAvailabilityRequirementIdentifier";
              v41 = v32;
              v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
              v23 = objc_msgSend(v18, "hk_error:userInfo:", 2000, v19);
            }

            id v15 = v23;
            uint64_t v8 = v27;
            self = v28;
            if (v15)
            {
              if (a4) {
                *a4 = v15;
              }
              else {
                _HKLogDroppedError();
              }
            }
          }
        }
        else
        {
          v14 = 0;
        }

        if (!v14) {
          goto LABEL_27;
        }
        [v7 setObject:v14 forKeyedSubscript:v11];
      }
      uint64_t v33 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v33) {
        continue;
      }
      break;
    }
  }

  v24 = (void *)[v7 copy];
LABEL_28:

  return v24;
}

- (id)_evaluatorForRequirement:(void *)a3 error:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    if (WeakRetained)
    {
      id v7 = objc_loadWeakRetained((id *)(a1 + 8));
      uint64_t v8 = objc_msgSend(v7, "profileExtensionsConformingToProtocol:", &unk_1F18A8AC8, (void)v22);
    }
    else
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
    }

    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v32 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "evaluatorForRequirement:", v5, (void)v22);
          if (v13)
          {
            v20 = (void *)v13;
            goto LABEL_21;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v32 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    uint64_t v8 = [(id)objc_opt_class() requirementIdentifier];
    _HKInitializeLogging();
    v14 = HKLogInfrastructure();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = a1;
      __int16 v30 = 2114;
      v31 = v8;
      _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] No evaluator found for requirement %{public}@", buf, 0x16u);
    }

    id v15 = (void *)MEMORY[0x1E4F28C58];
    v26 = @"HKFeatureAvailabilityRequirementIdentifier";
    uint64_t v27 = v8;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    v17 = objc_msgSend(v15, "hk_error:userInfo:", 3, v16);

    id v18 = v17;
    v19 = v18;
    if (v18)
    {
      if (a3) {
        *a3 = v18;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v20 = 0;
LABEL_21:
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)registerObserver:(id)a3 forRequirements:(id)a4 queue:(id)a5
{
}

- (BOOL)registerObserver:(id)a3 forRequirements:(id)a4 queue:(id)a5 error:(id *)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v11 count])
  {
    _HKInitializeLogging();
    uint64_t v13 = HKLogInfrastructure();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v39 = self;
      __int16 v40 = 2114;
      id v41 = v10;
      _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Registering %{public}@ for changes", buf, 0x16u);
    }

    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v14 = [(NSMapTable *)self->_lock_observedRequirementsByObserver objectForKey:v10];
    id v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = [MEMORY[0x1E4F1CAD0] set];
    }
    id v18 = v16;

    id v32 = v11;
    __int16 v30 = v18;
    objc_msgSend(v11, "hk_minus:", v18);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v34;
      while (2)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v34 != v22) {
            objc_enumerationMutation(v19);
          }
          long long v24 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          long long v25 = -[HDFeatureAvailabilityHealthDataRequirementEvaluationManager _evaluatorForRequirement:error:]((uint64_t)self, v24, a6);
          if (!v25)
          {
            BOOL v17 = 0;
            v28 = v19;
            uint64_t v27 = v30;
            goto LABEL_18;
          }
          v26 = v25;
          [v25 registerObserver:v10 forRequirement:v24 queue:v12];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }

    uint64_t v27 = v30;
    v28 = [v30 setByAddingObjectsFromSet:v19];
    [(NSMapTable *)self->_lock_observedRequirementsByObserver setObject:v28 forKey:v10];
    BOOL v17 = 1;
LABEL_18:
    os_unfair_lock_unlock(lock);

    id v11 = v32;
  }
  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

- (void)unregisterObserver:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = HKLogInfrastructure();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = self;
    __int16 v21 = 2114;
    id v22 = v4;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unregistering %{public}@ from changes", buf, 0x16u);
  }

  os_unfair_lock_lock(&self->_lock);
  id v6 = [(NSMapTable *)self->_lock_observedRequirementsByObserver objectForKey:v4];
  id v7 = v6;
  if (v6)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v13 = -[HDFeatureAvailabilityHealthDataRequirementEvaluationManager _evaluatorForRequirement:error:]((uint64_t)self, v12, 0);
          [v13 unregisterObserver:v4 forRequirement:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
    [(NSMapTable *)self->_lock_observedRequirementsByObserver removeObjectForKey:v4];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_observedRequirementsByObserver, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end