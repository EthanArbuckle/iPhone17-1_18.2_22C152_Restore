@interface HDOntologyFeatureCoordinator
- (BOOL)_insertEntry:(void *)a3 transaction:(uint64_t)a4 error:;
- (BOOL)markShardsWithIdentifiers:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (HDOntologyFeatureCoordinator)init;
- (HDOntologyFeatureCoordinator)initWithOntologyUpdateCoordinator:(id)a3;
- (HDOntologyUpdateCoordinator)updateCoordinator;
- (NSDictionary)shardRequirementStatuses;
- (double)unitTesting_minimumTimeToLive;
- (id)_featureEvaluatorForIdentifier:(uint64_t)a1;
- (id)unitTesting_didInsertEntry;
- (uint64_t)_markFirstLaunchRequestForEntry:(void *)a1 transaction:(void *)a2 error:(uint64_t)a3;
- (uint64_t)_performOrJournalFeatureCoordinatorRequireOperationForItems:(uint64_t)a3 error:;
- (void)_observationQueue_evaluteRequiredFeaturesWithReason:(uint64_t)a1;
- (void)daemonReady:(id)a3;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)evaluteRequiredShardsForEvalulator:(id)a3 reason:(id)a4;
- (void)profileDidBecomeReady:(id)a3;
- (void)profileListDidChange;
- (void)setUnitTesting_didInsertEntry:(id)a3;
- (void)setUnitTesting_minimumTimeToLive:(double)a3;
@end

@implementation HDOntologyFeatureCoordinator

- (HDOntologyFeatureCoordinator)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDOntologyFeatureCoordinator)initWithOntologyUpdateCoordinator:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDOntologyFeatureCoordinator;
  v5 = [(HDOntologyFeatureCoordinator *)&v15 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_updateCoordinator, v4);
    uint64_t v7 = HKCreateSerialDispatchQueue();
    observationQueue = v6->_observationQueue;
    v6->_observationQueue = (OS_dispatch_queue *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    observationQueue_isProfileReady = v6->_observationQueue_isProfileReady;
    v6->_observationQueue_isProfileReady = v9;

    v6->_lock._os_unfair_lock_opaque = 0;
    lock_shardRequirementStatuses = v6->_lock_shardRequirementStatuses;
    v6->_lock_shardRequirementStatuses = (NSDictionary *)MEMORY[0x1E4F1CC08];

    v6->_unitTesting_minimumTimeToLive = -1.0;
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_updateCoordinator);
    v13 = [WeakRetained daemon];
    [v13 registerDaemonReadyObserver:v6 queue:v6->_observationQueue];
  }
  return v6;
}

- (BOOL)markShardsWithIdentifiers:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ([v7 count])
  {
    id v8 = v7;
    if (self)
    {
      id v26 = v7;
      _HKInitializeLogging();
      v9 = HKLogHealthOntology();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = [v8 componentsJoinedByString:@", "];
        v11 = HKStringFromOntologyFeatureRequestOptions();
        *(_DWORD *)buf = 138543874;
        v34 = self;
        __int16 v35 = 2114;
        v36 = v10;
        __int16 v37 = 2114;
        v38 = v11;
        _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: mark shards with identifiers \"%{public}@\" with options %{public}@", buf, 0x20u);
      }
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v25 = v8;
      id obj = v8;
      uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:buf count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v30;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v30 != v15) {
              objc_enumerationMutation(obj);
            }
            id v17 = *(id *)(*((void *)&v29 + 1) + 8 * i);
            if ((HKIsKnownOntologyShardIdentifier() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"%@ is not a known shard identifier", v17);

LABEL_21:
              char v23 = 0;
              goto LABEL_22;
            }
            if ((a4 & 1) != 0
              && (v18 = self,
                  -[HDOntologyFeatureCoordinator _featureEvaluatorForIdentifier:]((uint64_t)self, v17),
                  (v19 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              v20 = v19;
              char v21 = [v19 canRequireShardWithError:a5];

              self = v18;
              if ((v21 & 1) == 0) {
                goto LABEL_21;
              }
            }
            else
            {
            }
            v22 = -[_HDRequiredShardItem initWithShardIdentfier:options:]([_HDRequiredShardItem alloc], v17, a4);
            [v12 addObject:v22];
          }
          uint64_t v14 = [obj countByEnumeratingWithState:&v29 objects:buf count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }

      char v23 = -[HDOntologyFeatureCoordinator _performOrJournalFeatureCoordinatorRequireOperationForItems:error:]((uint64_t)self, v12, (uint64_t)a5);
LABEL_22:

      id v8 = v25;
      id v7 = v26;
    }
    else
    {
      char v23 = 0;
    }
  }
  else
  {
    char v23 = 1;
  }

  return v23;
}

- (void)evaluteRequiredShardsForEvalulator:(id)a3 reason:(id)a4
{
  id v5 = [NSString stringWithFormat:@"%@ %@", a3, a4];
  -[HDOntologyFeatureCoordinator _observationQueue_evaluteRequiredFeaturesWithReason:]((uint64_t)self, v5);
}

- (void)_observationQueue_evaluteRequiredFeaturesWithReason:(uint64_t)a1
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v61 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    id v4 = [WeakRetained daemon];
    id v5 = [v4 behavior];
    int v6 = [v5 supportsOntologyFeatureEvaluation];

    if (v6)
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
      id v7 = *(void **)(a1 + 16);
      id v8 = objc_loadWeakRetained((id *)(a1 + 64));
      v9 = [v8 profile];
      v10 = [v9 profileIdentifier];
      v11 = [v7 objectForKeyedSubscript:v10];
      int v12 = [v11 BOOLValue];

      if (v12)
      {
        _HKInitializeLogging();
        uint64_t v13 = HKLogHealthOntology();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = a1;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v61;
          _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Re-evaluate required features due to %{public}@", buf, 0x16u);
        }

        dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
        id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        id v15 = objc_loadWeakRetained((id *)(a1 + 64));
        v16 = [v15 daemon];
        id v17 = [v16 profileManager];

        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        id obj = [v17 allProfileIdentifiers];
        uint64_t v18 = [obj countByEnumeratingWithState:&v76 objects:buf count:16];
        uint64_t v66 = a1;
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v77;
          uint64_t v62 = *(void *)v77;
          v63 = v17;
          do
          {
            uint64_t v21 = 0;
            uint64_t v64 = v19;
            do
            {
              if (*(void *)v77 != v20) {
                objc_enumerationMutation(obj);
              }
              uint64_t v22 = *(void *)(*((void *)&v76 + 1) + 8 * v21);
              char v23 = objc_msgSend(v17, "profileForIdentifier:", v22, v61);
              if (v23)
              {
                v24 = [*(id *)(a1 + 16) objectForKeyedSubscript:v22];
                int v25 = [v24 BOOLValue];

                if (v25)
                {
                  uint64_t v67 = v21;
                  long long v74 = 0u;
                  long long v75 = 0u;
                  long long v72 = 0u;
                  long long v73 = 0u;
                  id v26 = *(id *)(a1 + 24);
                  uint64_t v27 = [v26 countByEnumeratingWithState:&v72 objects:v81 count:16];
                  if (v27)
                  {
                    uint64_t v28 = v27;
                    uint64_t v29 = *(void *)v73;
                    do
                    {
                      for (uint64_t i = 0; i != v28; ++i)
                      {
                        if (*(void *)v73 != v29) {
                          objc_enumerationMutation(v26);
                        }
                        long long v31 = *(void **)(*((void *)&v72 + 1) + 8 * i);
                        long long v32 = [v31 featureIdentifier];
                        v33 = [v14 objectForKeyedSubscript:v32];
                        if (!v33)
                        {
                          v33 = &unk_1F17EEDF0;
                          [v14 setObject:&unk_1F17EEDF0 forKeyedSubscript:v32];
                        }
                        uint64_t v34 = [v33 integerValue];
                        if (v34 != 1)
                        {
                          uint64_t v35 = v34;
                          uint64_t v36 = [v31 requiresFeatureShardForProfile:v23];
                          if (v36 == 1 || (!v35 ? (BOOL v37 = v36 == 2) : (BOOL v37 = 0), v37))
                          {
                            v38 = [NSNumber numberWithInteger:v36];
                            [v14 setObject:v38 forKeyedSubscript:v32];
                          }
                        }
                      }
                      uint64_t v28 = [v26 countByEnumeratingWithState:&v72 objects:v81 count:16];
                    }
                    while (v28);
                  }

                  a1 = v66;
                  uint64_t v21 = v67;
                  uint64_t v20 = v62;
                  id v17 = v63;
                  uint64_t v19 = v64;
                }
              }

              ++v21;
            }
            while (v21 != v19);
            uint64_t v19 = [obj countByEnumeratingWithState:&v76 objects:buf count:16];
          }
          while (v19);
        }

        id v39 = v14;
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
        objc_storeStrong((id *)(a1 + 40), v14);
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));

        id v40 = v39;
        v41 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"["];
        v42 = [v40 allKeys];
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __63__HDOntologyFeatureCoordinator__logRequiredShardsByIdentifier___block_invoke;
        v85 = &unk_1E6302EB8;
        id v43 = v40;
        id v86 = v43;
        objc_msgSend(v41, "hk_appendComponentsJoinedByString:container:componentGenerator:", @", ", v42, buf);

        [v41 appendFormat:@"]"];
        _HKInitializeLogging();
        v44 = HKLogHealthOntology();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v81 = 138543618;
          *(void *)&v81[4] = a1;
          __int16 v82 = 2112;
          v83 = v41;
          _os_log_impl(&dword_1BCB7D000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@: underlying conditions require shards: %@", v81, 0x16u);
        }

        id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        id v46 = v43;
        uint64_t v47 = [v46 countByEnumeratingWithState:&v68 objects:v80 count:16];
        if (v47)
        {
          uint64_t v48 = v47;
          uint64_t v49 = *(void *)v69;
          do
          {
            for (uint64_t j = 0; j != v48; ++j)
            {
              if (*(void *)v69 != v49) {
                objc_enumerationMutation(v46);
              }
              v51 = *(void **)(*((void *)&v68 + 1) + 8 * j);
              if (HKIsKnownOntologyShardIdentifier())
              {
                v52 = [v46 objectForKeyedSubscript:v51];
                uint64_t v53 = [v52 integerValue];

                if (v53 == 2) {
                  continue;
                }
                v54 = -[_HDRequiredShardItem initWithShardIdentfier:options:]([_HDRequiredShardItem alloc], v51, v53 == 1);
                [v45 addObject:v54];
              }
              else
              {
                _HKInitializeLogging();
                v54 = HKLogHealthOntology();
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  *(void *)&uint8_t buf[4] = v66;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v51;
                  _os_log_impl(&dword_1BCB7D000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@: Cannot mark shard with identifier %@ because it's unknown", buf, 0x16u);
                }
              }
            }
            uint64_t v48 = [v46 countByEnumeratingWithState:&v68 objects:v80 count:16];
          }
          while (v48);
        }

        id v55 = v45;
        *(void *)v81 = 0;
        char v56 = -[HDOntologyFeatureCoordinator _performOrJournalFeatureCoordinatorRequireOperationForItems:error:](v66, v55, (uint64_t)v81);
        id v57 = *(id *)v81;
        if ((v56 & 1) == 0)
        {
          v58 = objc_msgSend(v55, "hk_map:", &__block_literal_global_337_0);
          _HKInitializeLogging();
          v59 = HKLogHealthOntology();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            v60 = [v58 componentsJoinedByString:@", "];
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v66;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v57;
            *(_WORD *)&buf[22] = 2114;
            v85 = v60;
            _os_log_error_impl(&dword_1BCB7D000, v59, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ Unable to mark [%{public}@]", buf, 0x20u);
          }
        }
      }
    }
  }
}

- (NSDictionary)shardRequirementStatuses
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSDictionary *)self->_lock_shardRequirementStatuses copy];
  os_unfair_lock_unlock(p_lock);

  return (NSDictionary *)v4;
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_observationQueue);
  if (v4)
  {
    -[HDOntologyFeatureCoordinator _observationQueue_evaluteRequiredFeaturesWithReason:]((uint64_t)self, @"protectedDataAvailable");
  }
}

- (void)daemonReady:(id)a3
{
  v59[1] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_observationQueue);
  id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v5 = [HDOntologyCHRFeatureEvaluator alloc];
  uint64_t v34 = self;
  p_updateCoordinator = &self->_updateCoordinator;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateCoordinator);
  id v8 = [(HDOntologyCHRFeatureEvaluator *)v5 initWithOntologyUpdateCoordinator:WeakRetained];
  v59[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:1];
  v10 = (void *)[v4 initWithArray:v9];

  location = (id *)p_updateCoordinator;
  id v11 = objc_loadWeakRetained((id *)p_updateCoordinator);
  int v12 = [v11 daemon];

  id v39 = v12;
  uint64_t v13 = [v12 pluginManager];
  id v14 = [v13 pluginsConformingToProtocol:&unk_1F18A8888];
  id v15 = [v14 allValues];

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v15;
  uint64_t v40 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
  if (v40)
  {
    uint64_t v38 = *(void *)v50;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v50 != v38) {
          objc_enumerationMutation(obj);
        }
        v41 = *(void **)(*((void *)&v49 + 1) + 8 * (void)v16);
        v42 = v16;
        id v17 = [v41 ontologyFeatureEvaluatorsForDaemon:v39];
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v45 objects:v57 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v46;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v46 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void **)(*((void *)&v45 + 1) + 8 * i);
              v44[0] = MEMORY[0x1E4F143A8];
              v44[1] = 3221225472;
              v44[2] = __54__HDOntologyFeatureCoordinator__loadFeatureEvaluators__block_invoke;
              v44[3] = &unk_1E6309338;
              v44[4] = v22;
              char v23 = objc_msgSend(v10, "hk_firstObjectPassingTest:", v44);
              if (v23)
              {
                BOOL v37 = [MEMORY[0x1E4F28B00] currentHandler];
                uint64_t v36 = [v22 featureIdentifier];
                [v37 handleFailureInMethod:sel__loadFeatureEvaluators, v34, @"HDOntologyFeatureCoordinator.m", 233, @"%@ is attemping to register as evaluator for %@, but %@ is already registered.", v41, v36, v23 object file lineNumber description];
              }
              [v10 addObject:v22];
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v45 objects:v57 count:16];
          }
          while (v19);
        }

        v16 = v42 + 1;
      }
      while (v42 + 1 != (char *)v40);
      uint64_t v40 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
    }
    while (v40);
  }

  _HKInitializeLogging();
  v24 = HKLogHealthOntology();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = objc_msgSend(v10, "hk_map:", &__block_literal_global_200);
    *(_DWORD *)buf = 138543618;
    v54 = v34;
    __int16 v55 = 2112;
    char v56 = v25;
    _os_log_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: loaded feature evaluators: %@", buf, 0x16u);
  }
  uint64_t v26 = [v10 copy];
  uint64_t v27 = v34;
  featureEvaluators = v34->_featureEvaluators;
  v34->_featureEvaluators = (NSArray *)v26;

  id v29 = objc_loadWeakRetained(location);
  long long v30 = [v29 daemon];
  long long v31 = [v30 profileManager];
  [v31 addProfileManagerObserver:v27 queue:v27->_observationQueue];

  id v43 = objc_loadWeakRetained(location);
  long long v32 = [v43 profile];
  [v32 registerProfileReadyObserver:v27 queue:v27->_observationQueue];
}

- (void)profileListDidChange
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_observationQueue);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_observationQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateCoordinator);
  id v4 = [WeakRetained daemon];
  id v5 = [v4 profileManager];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int v6 = objc_msgSend(v5, "allProfileIdentifiers", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [v5 profileForIdentifier:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        int v12 = v11;
        if (v11)
        {
          observationQueue_isProfileReady = self->_observationQueue_isProfileReady;
          id v14 = [v11 profileIdentifier];
          id v15 = [(NSMutableDictionary *)observationQueue_isProfileReady objectForKeyedSubscript:v14];
          char v16 = [v15 BOOLValue];

          if ((v16 & 1) == 0) {
            [v12 registerProfileReadyObserver:self queue:self->_observationQueue];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  -[HDOntologyFeatureCoordinator _observationQueue_evaluteRequiredFeaturesWithReason:]((uint64_t)self, @"profileListDidChange");
}

- (void)profileDidBecomeReady:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  observationQueue = self->_observationQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(observationQueue);
  observationQueue_isProfileReady = self->_observationQueue_isProfileReady;
  uint64_t v7 = [v5 profileIdentifier];
  [(NSMutableDictionary *)observationQueue_isProfileReady setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v7];

  id v8 = v5;
  uint64_t v9 = [v8 database];
  [v9 addProtectedDataObserver:self queue:self->_observationQueue];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_featureEvaluators;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "registerRequiredObserversForProfile:queue:", v8, self->_observationQueue, (void)v15);
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }

  -[HDOntologyFeatureCoordinator _observationQueue_evaluteRequiredFeaturesWithReason:]((uint64_t)self, @"profileDidBecomeReady");
}

uint64_t __85__HDOntologyFeatureCoordinator__processRequiredShardItems_profile_transaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v94 = a2;
  uint64_t v95 = a1;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v92 = [obj countByEnumeratingWithState:&v108 objects:v113 count:16];
  if (!v92)
  {
    uint64_t v85 = 1;
    goto LABEL_84;
  }
  uint64_t v93 = *(void *)v109;
  *(void *)&long long v4 = 138544130;
  long long v87 = v4;
  do
  {
    uint64_t v5 = 0;
    do
    {
      if (*(void *)v109 != v93) {
        objc_enumerationMutation(obj);
      }
      uint64_t v96 = v5;
      uint64_t v6 = *(void *)(v95 + 40);
      id v7 = *(id *)(*((void *)&v108 + 1) + 8 * v5);
      id v8 = v94;
      uint64_t v102 = v6;
      if (!v6) {
        goto LABEL_81;
      }
      uint64_t v9 = v7;
      id v104 = v8;
      self;
      v10 = HKOntologyShardSchemaTypeForShardIdentifier();
      uint64_t v11 = HKCurrentSchemaVersionForShardIdentifier();
      id v99 = v7;
      uint64_t v12 = v9 ? v9[1] : 0;
      uint64_t v13 = objc_msgSend(MEMORY[0x1E4F65D00], "predicateWithProperty:equalToValue:", @"identifier", v12, v87);
      id v14 = (void *)MEMORY[0x1E4F65D08];
      long long v15 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"schema_type" notEqualToValue:v10];
      *(void *)buf = v15;
      long long v16 = (void *)MEMORY[0x1E4F65D00];
      long long v17 = [NSNumber numberWithInteger:v11];
      long long v18 = [v16 predicateWithProperty:@"schema_version" notEqualToValue:v17];
      *(void *)&buf[8] = v18;
      long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:2];
      uint64_t v20 = [v14 predicateMatchingAnyPredicates:v19];

      uint64_t v21 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v13 otherPredicate:v20];
      v114[0] = @"desired_state";
      v114[1] = @"desired_state_date";
      uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v114 count:2];
      char v23 = [v104 graphDatabase];

      v24 = [v23 underlyingDatabase];
      LODWORD(v19) = +[HDSQLiteEntity updateProperties:v22 predicate:v21 database:v24 error:a3 bindingHandler:&__block_literal_global_322_0];

      int v25 = v9;
      id v7 = v99;
      if (!v19)
      {
LABEL_81:

LABEL_83:
        uint64_t v85 = 0;
        goto LABEL_84;
      }
      if (v9) {
        uint64_t v26 = (void *)v9[1];
      }
      else {
        uint64_t v26 = 0;
      }
      id v112 = 0;
      id v27 = v26;
      id v28 = v104;
      id v29 = v27;
      long long v30 = HKOntologyShardSchemaTypeForShardIdentifier();
      uint64_t v31 = HKCurrentSchemaVersionForShardIdentifier();
      id WeakRetained = objc_loadWeakRetained((id *)(v102 + 64));
      v33 = [WeakRetained shardRegistry];
      LOBYTE(v31) = [v33 entryWithIdentifier:v29 schemaType:v30 schemaVersion:v31 entryOut:&v112 transaction:v28 error:a3];

      id v34 = v112;
      if ((v31 & 1) == 0)
      {

        goto LABEL_83;
      }
      if (!v34)
      {
        uint64_t v36 = v25;
        id v55 = v28;
        char v56 = HKOntologyShardSchemaTypeForShardIdentifier();
        if (!v25)
        {
          uint64_t v62 = (void *)[objc_alloc(MEMORY[0x1E4F2B2F8]) initWithIdentifier:0 schemaType:v56 schemaVersion:HKCurrentSchemaVersionForShardIdentifier() desiredState:1];
          goto LABEL_30;
        }
        uint64_t v57 = HKCurrentSchemaVersionForShardIdentifier();
        uint64_t v58 = v36[2];
        id v59 = objc_alloc(MEMORY[0x1E4F2B2F8]);
        if (v58) {
          uint64_t v60 = 3;
        }
        else {
          uint64_t v60 = 1;
        }
        id v61 = (void *)[v59 initWithIdentifier:v36[1] schemaType:v56 schemaVersion:v57 desiredState:v60];
        uint64_t v62 = v61;
        if ((v58 & 1) == 0)
        {
LABEL_30:
          uint64_t v63 = 2;
          goto LABEL_37;
        }
        if ((v58 & 2) != 0
          && (id v37 = v55,
              !-[HDOntologyFeatureCoordinator _markFirstLaunchRequestForEntry:transaction:error:](v61, v55, a3)))
        {
          uint64_t v54 = 0;
          uint64_t v68 = v96;
        }
        else
        {
          uint64_t v63 = 1;
LABEL_37:
          uint64_t v68 = v96;
          if (-[HDOntologyFeatureCoordinator _insertEntry:transaction:error:](v102, v62, v55, a3)) {
            uint64_t v54 = v63;
          }
          else {
            uint64_t v54 = 0;
          }
          id v37 = v55;
        }

        goto LABEL_68;
      }
      if (v25) {
        uint64_t v35 = v25[2];
      }
      else {
        LOBYTE(v35) = 0;
      }
      uint64_t v36 = v34;
      id v37 = v28;
      if (v35) {
        uint64_t v38 = 3;
      }
      else {
        uint64_t v38 = 1;
      }
      if ([v36 desiredState] != v38)
      {
        uint64_t v64 = v36;
        id v65 = v37;
        v106 = v65;
        if ((~(_BYTE)v35 & 3) != 0)
        {
          if ((v35 & 5) != 0) {
            goto LABEL_59;
          }
          id v101 = v37;
          long long v69 = v64;
          uint64_t v67 = v69;
          double v70 = *(double *)(v102 + 56);
          if (v70 < 0.0)
          {
            long long v71 = [v69 identifier];
            long long v72 = -[HDOntologyFeatureCoordinator _featureEvaluatorForIdentifier:](v102, v71);

            if (v72 && (objc_opt_class(), (objc_opt_respondsToSelector() & 1) != 0))
            {
              [(id)objc_opt_class() minimumTimeToLive];
              double v70 = v73;
            }
            else if ([MEMORY[0x1E4F2B860] isAppleInternalInstall])
            {
              double v70 = 604800.0;
            }
            else
            {
              double v70 = 2592000.0;
            }
          }
          double Current = CFAbsoluteTimeGetCurrent();
          long long v75 = [v67 desiredStateDate];
          [v75 timeIntervalSinceReferenceDate];
          double v77 = v70 + v76;

          if (Current > v77)
          {
            _HKInitializeLogging();
            long long v78 = HKLogHealthOntology();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
            {
              v90 = [v67 desiredStateDate];
              long long v79 = HKDiagnosticStringFromDate();
              HKDiagnosticStringFromDuration();
              v80 = v98 = v25;
              *(_DWORD *)buf = v87;
              *(void *)&uint8_t buf[4] = v102;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v67;
              *(_WORD *)&buf[22] = 2114;
              v116 = v79;
              __int16 v117 = 2114;
              v118 = v80;
              _os_log_impl(&dword_1BCB7D000, v78, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ TTL has expired because %{public}@ is more than %{public}@ before now", buf, 0x2Au);

              int v25 = v98;
            }

            id v37 = v101;
            goto LABEL_59;
          }

          uint64_t v54 = 2;
          id v37 = v101;
LABEL_65:
          v81 = v106;
        }
        else
        {
          uint64_t v66 = -[HDOntologyFeatureCoordinator _markFirstLaunchRequestForEntry:transaction:error:](v64, v65, a3);
          if (v66 != 1)
          {
            uint64_t v54 = v66;
            uint64_t v67 = v64;
            goto LABEL_65;
          }
LABEL_59:
          uint64_t v67 = (void *)[v64 copyWithDesiredState:v38];

          v81 = v106;
          BOOL v82 = -[HDOntologyFeatureCoordinator _insertEntry:transaction:error:](v102, v67, v106, a3);
          uint64_t v83 = 1;
          if ((v35 & 1) == 0) {
            uint64_t v83 = 2;
          }
          if (v82) {
            uint64_t v54 = v83;
          }
          else {
            uint64_t v54 = 0;
          }
        }

LABEL_67:
        uint64_t v68 = v96;
        goto LABEL_68;
      }
      if ((~(_BYTE)v35 & 5) != 0)
      {
        uint64_t v54 = 2;
        goto LABEL_67;
      }
      v97 = v25;
      id v100 = v37;
      v88 = (void *)MEMORY[0x1E4F65D08];
      id v39 = (void *)MEMORY[0x1E4F65D00];
      id v105 = v37;
      uint64_t v40 = v36;
      v103 = [v40 identifier];
      v89 = [v39 predicateWithProperty:@"identifier" equalToValue:v103];
      *(void *)buf = v89;
      v41 = (void *)MEMORY[0x1E4F65D00];
      v42 = [v40 schemaType];
      id v43 = [v41 predicateWithProperty:@"schema_type" equalToValue:v42];
      *(void *)&buf[8] = v43;
      v44 = (void *)MEMORY[0x1E4F65D00];
      long long v45 = NSNumber;
      uint64_t v46 = [v40 schemaVersion];

      long long v47 = [v45 numberWithInteger:v46];
      long long v48 = [v44 predicateWithProperty:@"schema_version" equalToValue:v47];
      *(void *)&buf[16] = v48;
      long long v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:3];
      long long v50 = [v88 predicateMatchingAllPredicates:v49];

      v114[0] = @"desired_state_date";
      long long v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v114 count:1];
      long long v52 = [v105 graphDatabase];

      uint64_t v53 = [v52 underlyingDatabase];
      LODWORD(v42) = +[HDSQLiteEntity updateProperties:v51 predicate:v50 database:v53 error:a3 bindingHandler:&__block_literal_global_332];

      if (v42)
      {
        if ([v40 currentVersion] < 1) {
          uint64_t v54 = 1;
        }
        else {
          uint64_t v54 = 2;
        }
      }
      else
      {
        uint64_t v54 = 0;
      }
      uint64_t v68 = v96;
      int v25 = v97;
      id v37 = v100;
LABEL_68:

      if (v54 == 1)
      {
        *(unsigned char *)(*(void *)(*(void *)(v95 + 48) + 8) + 24) = 1;
      }
      else if (!v54)
      {
        goto LABEL_83;
      }
      uint64_t v5 = v68 + 1;
    }
    while (v92 != v5);
    uint64_t v84 = [obj countByEnumeratingWithState:&v108 objects:v113 count:16];
    uint64_t v85 = 1;
    uint64_t v92 = v84;
  }
  while (v84);
LABEL_84:

  return v85;
}

uint64_t __54__HDOntologyFeatureCoordinator__loadFeatureEvaluators__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  long long v4 = [v2 featureIdentifier];
  uint64_t v5 = [v3 featureIdentifier];

  uint64_t v6 = [v4 isEqualToString:v5];
  return v6;
}

uint64_t __54__HDOntologyFeatureCoordinator__loadFeatureEvaluators__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 featureIdentifier];
}

void __93__HDOntologyFeatureCoordinator__markNotCurrentEntriesAsNotRequiredForItem_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879E80](a2, @"desired_state", 1);
  CFAbsoluteTimeGetCurrent();

  JUMPOUT(0x1C1879E50);
}

- (uint64_t)_markFirstLaunchRequestForEntry:(void *)a1 transaction:(void *)a2 error:(uint64_t)a3
{
  id v5 = a2;
  uint64_t v6 = (objc_class *)NSString;
  id v7 = a1;
  id v8 = [v6 alloc];
  uint64_t v9 = [v7 identifier];
  v10 = [v7 schemaType];
  uint64_t v11 = [v7 schemaVersion];

  uint64_t v12 = (void *)[v8 initWithFormat:@"firstLaunch-%@:%@:%ld", v9, v10, v11];
  uint64_t v13 = [v5 graphDatabase];
  uint64_t v21 = 0;
  LODWORD(v9) = [v13 metadataValueForKey:v12 valueOut:&v21 error:a3];
  uint64_t v14 = v21;

  uint64_t v15 = 0;
  if (v9)
  {
    if (v14)
    {
      uint64_t v15 = 2;
    }
    else
    {
      long long v16 = [v5 graphDatabase];
      long long v17 = [MEMORY[0x1E4F1C9C8] date];
      long long v18 = HKDiagnosticStringFromDate();
      unsigned int v19 = [v16 setMetadataValue:v18 forKey:v12 error:a3];

      uint64_t v15 = v19;
    }
  }

  return v15;
}

- (BOOL)_insertEntry:(void *)a3 transaction:(uint64_t)a4 error:
{
  id v7 = a3;
  id v8 = a2;
  id v9 = v7;
  v10 = _Block_copy(*(const void **)(a1 + 48));
  if (v10)
  {
    uint64_t v11 = [v9 graphDatabase];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __80__HDOntologyFeatureCoordinator__callDidInsertEntryTestHookForEntry_transaction___block_invoke;
    v14[3] = &unk_1E62F61D0;
    id v16 = v10;
    v14[4] = a1;
    id v15 = v8;
    [v11 onCommit:v14 orRollback:0];
  }
  BOOL v12 = +[HDOntologyShardRegistry insertEntry:v8 transaction:v9 error:a4];

  return v12;
}

- (id)_featureEvaluatorForIdentifier:(uint64_t)a1
{
  id v3 = a2;
  long long v4 = *(void **)(a1 + 24);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__HDOntologyFeatureCoordinator__featureEvaluatorForIdentifier___block_invoke;
  v8[3] = &unk_1E6309338;
  id v5 = v3;
  id v9 = v5;
  uint64_t v6 = objc_msgSend(v4, "hk_firstObjectPassingTest:", v8);

  return v6;
}

void __82__HDOntologyFeatureCoordinator__updateDesiredStateDateForEntry_transaction_error___block_invoke()
{
  CFAbsoluteTimeGetCurrent();

  JUMPOUT(0x1C1879E50);
}

- (uint64_t)_performOrJournalFeatureCoordinatorRequireOperationForItems:(uint64_t)a3 error:
{
  id v6 = a2;
  id v7 = [_HDOntologyFeatureCoordinatorRequireOperation alloc];
  id v8 = v6;
  if (v7)
  {
    v17.receiver = v7;
    v17.super_class = (Class)_HDOntologyFeatureCoordinatorRequireOperation;
    id v9 = (_HDOntologyFeatureCoordinatorRequireOperation *)objc_msgSendSuper2(&v17, sel_init);
    id v7 = v9;
    if (v9) {
      objc_storeStrong((id *)&v9->_items, a2);
    }
  }

  v10 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained(v10);
  [WeakRetained lockUpdateLock];

  id v12 = objc_loadWeakRetained(v10);
  uint64_t v13 = [v12 profile];
  uint64_t v14 = [(HDJournalableOperation *)v7 performOrJournalWithProfile:v13 error:a3];

  id v15 = objc_loadWeakRetained(v10);
  [v15 unlockUpdateLock];

  return v14;
}

uint64_t __63__HDOntologyFeatureCoordinator__markEntriesOrLogErrorForItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 description];
}

uint64_t __63__HDOntologyFeatureCoordinator__featureEvaluatorForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = *(void **)(a1 + 32);
  id v5 = [v3 featureIdentifier];
  if (v4 == v5)
  {
    uint64_t v9 = 1;
  }
  else
  {
    id v6 = [v3 featureIdentifier];
    if (v6)
    {
      id v7 = *(void **)(a1 + 32);
      id v8 = [v3 featureIdentifier];
      uint64_t v9 = [v7 isEqualToString:v8];
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  return v9;
}

void __59__HDOntologyFeatureCoordinator__triggerGatedOntologyUpdate__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  _HKInitializeLogging();
  id v6 = HKLogHealthOntology();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      int v11 = 138543362;
      uint64_t v12 = v5;
      id v8 = "%{public}@: Success triggered ontology update";
      uint64_t v9 = v6;
      uint32_t v10 = 12;
LABEL_6:
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, v10);
    }
  }
  else if (v7)
  {
    int v11 = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    id v14 = v4;
    id v8 = "%{public}@: Failure triggered ontology update: %{public}@";
    uint64_t v9 = v6;
    uint32_t v10 = 22;
    goto LABEL_6;
  }
}

id __63__HDOntologyFeatureCoordinator__logRequiredShardsByIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSString;
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];
  [v5 integerValue];
  id v6 = HKStringFromOptionalBooleanResult();
  BOOL v7 = [v2 stringWithFormat:@"(%@, %@)", v4, v6];

  return v7;
}

uint64_t __80__HDOntologyFeatureCoordinator__callDidInsertEntryTestHookForEntry_transaction___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)unitTesting_didInsertEntry
{
  return self->_unitTesting_didInsertEntry;
}

- (void)setUnitTesting_didInsertEntry:(id)a3
{
}

- (double)unitTesting_minimumTimeToLive
{
  return self->_unitTesting_minimumTimeToLive;
}

- (void)setUnitTesting_minimumTimeToLive:(double)a3
{
  self->_unitTesting_minimumTimeToLive = a3;
}

- (HDOntologyUpdateCoordinator)updateCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateCoordinator);

  return (HDOntologyUpdateCoordinator *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_updateCoordinator);
  objc_storeStrong(&self->_unitTesting_didInsertEntry, 0);
  objc_storeStrong((id *)&self->_lock_shardRequirementStatuses, 0);
  objc_storeStrong((id *)&self->_featureEvaluators, 0);
  objc_storeStrong((id *)&self->_observationQueue_isProfileReady, 0);

  objc_storeStrong((id *)&self->_observationQueue, 0);
}

@end