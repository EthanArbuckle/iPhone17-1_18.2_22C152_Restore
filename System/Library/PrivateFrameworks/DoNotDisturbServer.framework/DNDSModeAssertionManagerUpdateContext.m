@interface DNDSModeAssertionManagerUpdateContext
- (DNDSModeAssertionManagerUpdateContext)initWithStore:(id)a3 clientDetailsProvider:(id)a4;
- (DNDSModeAssertionStore)store;
- (DNDSModeAssertionUpdateResult)updateResult;
- (id)_calculateUpdateResultForStore:(id)a3 previousStore:(id)a4;
- (id)invalidateAssertionsForRequest:(id)a3;
- (id)modeAssertionInvalidationsMatchingPredicate:(id)a3;
- (id)modeAssertionsMatchingPredicate:(id)a3;
- (id)takeAssertionWithDetails:(id)a3 source:(id)a4 startDate:(id)a5;
- (id)takeAssertionWithUUID:(id)a3 details:(id)a4 source:(id)a5 startDate:(id)a6;
- (void)_cleanupStore:(id)a3;
- (void)_resolveStore:(id)a3;
@end

@implementation DNDSModeAssertionManagerUpdateContext

- (DNDSModeAssertionManagerUpdateContext)initWithStore:(id)a3 clientDetailsProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DNDSModeAssertionManagerUpdateContext;
  v8 = [(DNDSModeAssertionManagerUpdateContext *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    store = v8->_store;
    v8->_store = (DNDSModeAssertionStore *)v9;

    objc_storeStrong((id *)&v8->_clientDetailsProvider, a4);
    uint64_t v11 = +[DNDSModeAssertionUpdateResult emptyResult];
    updateResult = v8->_updateResult;
    v8->_updateResult = (DNDSModeAssertionUpdateResult *)v11;
  }
  return v8;
}

- (id)takeAssertionWithUUID:(id)a3 details:(id)a4 source:(id)a5 startDate:(id)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v12 = a4;
  id v13 = a3;
  objc_super v14 = _os_activity_create(&dword_1D3052000, "com.apple.donotdisturb.ModeAssertionManagerUpdateContext.takeAssertion", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v14, &state);
  v15 = (void *)[(DNDSModeAssertionStore *)self->_store mutableCopy];
  clientDetailsProvider = self->_clientDetailsProvider;
  v17 = [v10 clientIdentifier];
  v46 = [(DNDSClientDetailsProvider *)clientDetailsProvider clientDetailsForIdentifier:v17];

  v18 = (void *)[objc_alloc(MEMORY[0x1E4F5F600]) initWithUUID:v13 startDate:v11 details:v12 source:v10];
  v19 = [v15 assertions];
  v20 = [v15 invalidations];
  char v21 = [v19 containsObject:v18];
  if (v21)
  {
    v22 = DNDSLogAssertionManager;
    if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v51 = v18;
      _os_log_impl(&dword_1D3052000, v22, OS_LOG_TYPE_DEFAULT, "Assertion already exists in store; assertion=%{public}@",
        buf,
        0xCu);
    }
  }
  else
  {
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __88__DNDSModeAssertionManagerUpdateContext_takeAssertionWithUUID_details_source_startDate___block_invoke;
    v47[3] = &unk_1E6973FA0;
    v45 = &v48;
    id v23 = v18;
    id v48 = v23;
    if ((objc_msgSend(v20, "bs_containsObjectPassingTest:", v47) & 1) == 0)
    {
      uint64_t v27 = [v19 arrayByAddingObject:v23];

      v44 = (void *)v27;
      [v15 setAssertions:v27];
      v28 = DNDSLogAssertionManager;
      if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v51 = v23;
        _os_log_impl(&dword_1D3052000, v28, OS_LOG_TYPE_DEFAULT, "Inserted new assertion into store; assertion=%{public}@",
          buf,
          0xCu);
      }
      if ([v46 isUserInteractionClient])
      {
        uint64_t v29 = +[DNDSModeAssertionInvalidationPredicate predicateForAnyAssertion];
        uint64_t v30 = 2;
      }
      else
      {
        v31 = [v46 identifiers];
        uint64_t v29 = +[DNDSModeAssertionInvalidationPredicate predicateForAssertionClientIdentifiers:v31];

        uint64_t v30 = 4;
      }
      v43 = (void *)v29;
      v32 = +[DNDSModeAssertionInvalidationRequest requestWithPredicate:v29 requestDate:v11 source:v10 reason:v30];
      v33 = [v15 invalidationRequests];
      v34 = [v33 arrayByAddingObject:v32];

      [v15 setInvalidationRequests:v34];
      v35 = DNDSLogAssertionManager;
      if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v51 = v32;
        _os_log_impl(&dword_1D3052000, v35, OS_LOG_TYPE_DEFAULT, "Inserted new invalidation request into store; invalidationRequest=%{public}@",
          buf,
          0xCu);
      }
      v36 = [MEMORY[0x1E4F1C9C8] date];
      [v15 sanitizeDatesForThreshold:v36];

      [(DNDSModeAssertionManagerUpdateContext *)self _resolveStore:v15];
      [(DNDSModeAssertionManagerUpdateContext *)self _cleanupStore:v15];
      v37 = [(DNDSModeAssertionManagerUpdateContext *)self _calculateUpdateResultForStore:v15 previousStore:self->_store];
      v38 = [(DNDSModeAssertionUpdateResult *)self->_updateResult resultCombiningWithResult:v37];
      updateResult = self->_updateResult;
      self->_updateResult = v38;

      v40 = (DNDSModeAssertionStore *)[v15 copy];
      store = self->_store;
      self->_store = v40;

      os_activity_scope_leave(&state);
      id v26 = v37;
      v19 = v44;
      goto LABEL_17;
    }
    v24 = DNDSLogAssertionManager;
    if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v51 = v23;
      _os_log_impl(&dword_1D3052000, v24, OS_LOG_TYPE_DEFAULT, "Assertion was already invalidated; assertion=%{public}@",
        buf,
        0xCu);
    }
  }
  v25 = +[DNDSModeAssertionUpdateResult emptyResult];
  os_activity_scope_leave(&state);
  id v26 = v25;
  if ((v21 & 1) == 0) {
LABEL_17:
  }

  return v26;
}

uint64_t __88__DNDSModeAssertionManagerUpdateContext_takeAssertionWithUUID_details_source_startDate___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 assertion];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)modeAssertionsMatchingPredicate:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(DNDSModeAssertionStore *)self->_store assertions];
  id v6 = [v5 filteredArrayUsingPredicate:v4];

  id v7 = (void *)DNDSLogAssertionManager;
  if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    int v10 = 134218242;
    uint64_t v11 = [v6 count];
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Found %lu assertion(s) for predicate: predicate=%{public}@", (uint8_t *)&v10, 0x16u);
  }
  return v6;
}

- (id)modeAssertionInvalidationsMatchingPredicate:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(DNDSModeAssertionStore *)self->_store invalidations];
  id v6 = [v5 filteredArrayUsingPredicate:v4];

  id v7 = (void *)DNDSLogAssertionManager;
  if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    int v10 = 134218242;
    uint64_t v11 = [v6 count];
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Found %lu assertion invalidation(s) for predicate: predicate=%{public}@", (uint8_t *)&v10, 0x16u);
  }
  return v6;
}

- (id)takeAssertionWithDetails:(id)a3 source:(id)a4 startDate:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F29128];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  __int16 v12 = [v8 UUID];
  id v13 = [(DNDSModeAssertionManagerUpdateContext *)self takeAssertionWithUUID:v12 details:v11 source:v10 startDate:v9];

  return v13;
}

- (id)invalidateAssertionsForRequest:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.opaque[0] = 0;
  v17.opaque[1] = 0;
  v5 = _os_activity_create(&dword_1D3052000, "com.apple.donotdisturb.ModeAssertionManagerUpdateContext.invalidateAssertions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v17);
  id v6 = (void *)[(DNDSModeAssertionStore *)self->_store mutableCopy];
  id v7 = [v6 invalidationRequests];
  v8 = [v7 arrayByAddingObject:v4];

  [v6 setInvalidationRequests:v8];
  id v9 = DNDSLogAssertionManager;
  if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = v4;
    _os_log_impl(&dword_1D3052000, v9, OS_LOG_TYPE_DEFAULT, "Inserted new invalidation request into store; request=%{public}@",
      buf,
      0xCu);
  }
  id v10 = [MEMORY[0x1E4F1C9C8] date];
  [v6 sanitizeDatesForThreshold:v10];

  [(DNDSModeAssertionManagerUpdateContext *)self _resolveStore:v6];
  [(DNDSModeAssertionManagerUpdateContext *)self _cleanupStore:v6];
  id v11 = [(DNDSModeAssertionManagerUpdateContext *)self _calculateUpdateResultForStore:v6 previousStore:self->_store];
  __int16 v12 = [(DNDSModeAssertionUpdateResult *)self->_updateResult resultCombiningWithResult:v11];
  updateResult = self->_updateResult;
  self->_updateResult = v12;

  uint64_t v14 = (DNDSModeAssertionStore *)[v6 copy];
  store = self->_store;
  self->_store = v14;

  os_activity_scope_leave(&v17);
  return v11;
}

- (void)_resolveStore:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 assertions];
  v5 = [v3 invalidations];
  v25 = v3;
  id v6 = [v3 invalidationRequests];
  id v7 = [v4 sortedArrayUsingComparator:&__block_literal_global_8];

  uint64_t v29 = [v6 sortedArrayUsingComparator:&__block_literal_global_9];

  id v26 = [MEMORY[0x1E4F1CA48] array];
  v24 = v5;
  v8 = (void *)[v5 mutableCopy];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v28 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v32 != v28) {
          objc_enumerationMutation(obj);
        }
        __int16 v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __55__DNDSModeAssertionManagerUpdateContext__resolveStore___block_invoke_3;
        v30[3] = &unk_1E6974008;
        v30[4] = v12;
        id v13 = objc_msgSend(v29, "bs_firstObjectPassingTest:", v30);
        if (v13)
        {
          id v14 = objc_alloc(MEMORY[0x1E4F5F630]);
          v15 = [v13 requestDate];
          v16 = [v13 details];
          os_activity_scope_state_s v17 = [v13 source];
          v18 = objc_msgSend(v14, "initWithAssertion:invalidationDate:details:source:reason:reasonOverride:", v12, v15, v16, v17, objc_msgSend(v13, "reason"), objc_msgSend(v13, "reasonOverride"));

          if ([v8 containsObject:v18])
          {
            uint64_t v19 = DNDSLogAssertionManager;
            if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v36 = v18;
              __int16 v37 = 2114;
              v38 = v13;
              uint64_t v20 = v19;
              char v21 = "Assertion already invalidated, skipping work; invalidation=%{public}@, invalidationRequest=%{public}@";
              goto LABEL_14;
            }
          }
          else
          {
            [v8 addObject:v18];
            uint64_t v23 = DNDSLogAssertionManager;
            if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v36 = v18;
              __int16 v37 = 2114;
              v38 = v13;
              uint64_t v20 = v23;
              char v21 = "Assertion invalidated; invalidation=%{public}@, invalidationRequest=%{public}@";
LABEL_14:
              _os_log_impl(&dword_1D3052000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 0x16u);
            }
          }

          goto LABEL_16;
        }
        [v26 addObject:v12];
        v22 = DNDSLogAssertionManager;
        if (os_log_type_enabled((os_log_t)DNDSLogAssertionManager, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v36 = v12;
          _os_log_impl(&dword_1D3052000, v22, OS_LOG_TYPE_INFO, "Assertion preserved; assertion=%{public}@", buf, 0xCu);
        }
LABEL_16:
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v10);
  }

  [v8 sortUsingComparator:&__block_literal_global_18];
  [v25 setAssertions:v26];
  [v25 setInvalidations:v8];
  [v25 setInvalidationRequests:v29];
}

uint64_t __55__DNDSModeAssertionManagerUpdateContext__resolveStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 startDate];
  id v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __55__DNDSModeAssertionManagerUpdateContext__resolveStore___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 requestDate];
  id v6 = [v4 requestDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __55__DNDSModeAssertionManagerUpdateContext__resolveStore___block_invoke_3(uint64_t a1, void *a2)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 requestDate];
  v5 = +[DNDSModeAssertionInvalidationPredicate predicateForAssertionsTakenBeforeDate:v4];

  id v6 = (void *)MEMORY[0x1E4F28BA0];
  v12[0] = v5;
  uint64_t v7 = [v3 predicate];

  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  uint64_t v9 = [v6 andPredicateWithSubpredicates:v8];

  uint64_t v10 = [v9 evaluateWithObject:*(void *)(a1 + 32)];
  return v10;
}

uint64_t __55__DNDSModeAssertionManagerUpdateContext__resolveStore___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 invalidationDate];
  id v6 = [v4 invalidationDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)_cleanupStore:(id)a3
{
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F1CAA0];
  v5 = [v3 assertions];
  id v6 = [v4 orderedSetWithArray:v5];

  v86 = v6;
  uint64_t v7 = [v6 array];
  [v3 setAssertions:v7];

  id v97 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v125 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  v87 = v3;
  v8 = [v3 invalidations];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v125 objects:v135 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v126;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v126 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v125 + 1) + 8 * i);
        id v14 = [v13 assertion];
        v15 = [v14 source];
        v16 = [v15 clientIdentifier];

        os_activity_scope_state_s v17 = [v13 assertion];
        v18 = [v17 source];
        uint64_t v19 = [v18 deviceIdentifier];
        uint64_t v20 = (void *)v19;
        char v21 = @"default.device";
        if (v19) {
          char v21 = (__CFString *)v19;
        }
        v22 = v21;

        uint64_t v23 = [(DNDSClientDetailsProvider *)self->_clientDetailsProvider clientDetailsForIdentifier:v16];
        id v24 = [v97 objectForKey:v23];
        if (!v24) {
          id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        }
        [v24 setObject:v13 forKey:v22];
        if ((unint64_t)[v24 count] >= 3)
        {
          v25 = [v24 keysSortedByValueUsingComparator:&__block_literal_global_23];
          id v26 = [v25 firstObject];
          [v24 removeObjectForKey:v26];
        }
        [v97 setObject:v24 forKey:v16];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v125 objects:v135 count:16];
    }
    while (v10);
  }

  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  uint64_t v28 = [v97 allValues];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v121 objects:v134 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v122;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v122 != v31) {
          objc_enumerationMutation(v28);
        }
        long long v33 = [*(id *)(*((void *)&v121 + 1) + 8 * j) allValues];
        [v27 addObjectsFromArray:v33];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v121 objects:v134 count:16];
    }
    while (v30);
  }

  [v27 sortUsingComparator:&__block_literal_global_25_0];
  [v87 setInvalidations:v27];
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  id obj = [v87 invalidationRequests];
  uint64_t v36 = [obj countByEnumeratingWithState:&v117 objects:v133 count:16];
  v98 = v34;
  if (v36)
  {
    uint64_t v37 = v36;
    v38 = 0;
    uint64_t v39 = *(void *)v118;
    id v88 = v35;
    id v89 = v27;
    uint64_t v91 = *(void *)v118;
    do
    {
      uint64_t v40 = 0;
      uint64_t v94 = v37;
      do
      {
        if (*(void *)v118 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v96 = v40;
        v41 = *(void **)(*((void *)&v117 + 1) + 8 * v40);
        v42 = [v41 predicate];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v44 = v41;

          [v34 removeAllObjects];
          [v35 removeAllObjects];
          v38 = v44;
        }
        else
        {
          v45 = [v41 predicate];
          objc_opt_class();
          char v46 = objc_opt_isKindOfClass();

          v47 = [v41 predicate];
          id v48 = v47;
          if (v46)
          {
            v92 = v38;
            long long v115 = 0u;
            long long v116 = 0u;
            long long v113 = 0u;
            long long v114 = 0u;
            v90 = v47;
            id v99 = [v47 clientIdentifiers];
            uint64_t v49 = [v99 countByEnumeratingWithState:&v113 objects:v132 count:16];
            if (v49)
            {
              uint64_t v50 = v49;
              uint64_t v51 = *(void *)v114;
              do
              {
                for (uint64_t k = 0; k != v50; ++k)
                {
                  if (*(void *)v114 != v51) {
                    objc_enumerationMutation(v99);
                  }
                  uint64_t v53 = *(void *)(*((void *)&v113 + 1) + 8 * k);
                  v54 = [(DNDSClientDetailsProvider *)self->_clientDetailsProvider clientDetailsForIdentifier:v53];
                  v55 = [v41 source];
                  uint64_t v56 = [v55 deviceIdentifier];
                  v57 = (void *)v56;
                  v58 = @"default.device";
                  if (v56) {
                    v58 = (__CFString *)v56;
                  }
                  v59 = v58;

                  id v60 = [v34 objectForKey:v54];
                  if (!v60) {
                    id v60 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                  }
                  [v60 setObject:v41 forKey:v59];
                  if ((unint64_t)[v60 count] >= 3)
                  {
                    v61 = [v60 keysSortedByValueUsingComparator:&__block_literal_global_29];
                    v62 = [v61 firstObject];
                    [v60 removeObjectForKey:v62];

                    id v34 = v98;
                  }
                  [v34 setObject:v60 forKey:v53];
                }
                uint64_t v50 = [v99 countByEnumeratingWithState:&v113 objects:v132 count:16];
              }
              while (v50);
            }

            id v35 = v88;
            id v27 = v89;
            v38 = v92;
          }
          else
          {
            objc_opt_class();
            objc_opt_isKindOfClass();

            v63 = [v41 predicate];
            long long v109 = 0u;
            long long v110 = 0u;
            long long v111 = 0u;
            long long v112 = 0u;
            v64 = [v63 UUIDs];
            uint64_t v65 = [v64 countByEnumeratingWithState:&v109 objects:v131 count:16];
            if (v65)
            {
              uint64_t v66 = v65;
              uint64_t v67 = *(void *)v110;
              do
              {
                for (uint64_t m = 0; m != v66; ++m)
                {
                  if (*(void *)v110 != v67) {
                    objc_enumerationMutation(v64);
                  }
                  [v35 setObject:v41 forKey:*(void *)(*((void *)&v109 + 1) + 8 * m)];
                }
                uint64_t v66 = [v64 countByEnumeratingWithState:&v109 objects:v131 count:16];
              }
              while (v66);
            }
          }
          uint64_t v39 = v91;
          uint64_t v37 = v94;
        }
        uint64_t v40 = v96 + 1;
      }
      while (v96 + 1 != v37);
      uint64_t v37 = [obj countByEnumeratingWithState:&v117 objects:v133 count:16];
    }
    while (v37);
  }
  else
  {
    v38 = 0;
  }

  v69 = [MEMORY[0x1E4F1CA80] set];
  objc_msgSend(v69, "bs_safeAddObject:", v38);
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  v70 = [v34 allValues];
  uint64_t v71 = [v70 countByEnumeratingWithState:&v105 objects:v130 count:16];
  if (v71)
  {
    uint64_t v72 = v71;
    uint64_t v73 = *(void *)v106;
    do
    {
      for (uint64_t n = 0; n != v72; ++n)
      {
        if (*(void *)v106 != v73) {
          objc_enumerationMutation(v70);
        }
        v75 = [*(id *)(*((void *)&v105 + 1) + 8 * n) allValues];
        [v69 addObjectsFromArray:v75];
      }
      uint64_t v72 = [v70 countByEnumeratingWithState:&v105 objects:v130 count:16];
    }
    while (v72);
  }
  v93 = v38;

  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  v76 = [v87 invalidations];
  uint64_t v77 = [v76 countByEnumeratingWithState:&v101 objects:v129 count:16];
  if (v77)
  {
    uint64_t v78 = v77;
    uint64_t v79 = *(void *)v102;
    do
    {
      for (iuint64_t i = 0; ii != v78; ++ii)
      {
        if (*(void *)v102 != v79) {
          objc_enumerationMutation(v76);
        }
        v81 = [*(id *)(*((void *)&v101 + 1) + 8 * ii) assertion];
        v82 = [v81 UUID];
        v83 = [v35 objectForKey:v82];

        objc_msgSend(v69, "bs_safeAddObject:", v83);
      }
      uint64_t v78 = [v76 countByEnumeratingWithState:&v101 objects:v129 count:16];
    }
    while (v78);
  }

  v84 = [v69 allObjects];
  v85 = [v84 sortedArrayUsingComparator:&__block_literal_global_33_0];

  [v87 setInvalidationRequests:v85];
}

uint64_t __55__DNDSModeAssertionManagerUpdateContext__cleanupStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 invalidationDate];
  id v6 = [v4 invalidationDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __55__DNDSModeAssertionManagerUpdateContext__cleanupStore___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 invalidationDate];
  id v6 = [v4 invalidationDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __55__DNDSModeAssertionManagerUpdateContext__cleanupStore___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 requestDate];
  id v6 = [v4 requestDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __55__DNDSModeAssertionManagerUpdateContext__cleanupStore___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 requestDate];
  id v6 = [v4 requestDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)_calculateUpdateResultForStore:(id)a3 previousStore:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 assertions];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __86__DNDSModeAssertionManagerUpdateContext__calculateUpdateResultForStore_previousStore___block_invoke;
  v21[3] = &unk_1E6973720;
  id v8 = v5;
  id v22 = v8;
  uint64_t v9 = objc_msgSend(v7, "bs_filter:", v21);

  uint64_t v10 = [v6 invalidations];

  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __86__DNDSModeAssertionManagerUpdateContext__calculateUpdateResultForStore_previousStore___block_invoke_2;
  uint64_t v19 = &unk_1E6973FA0;
  id v20 = v8;
  id v11 = v8;
  __int16 v12 = objc_msgSend(v10, "bs_filter:", &v16);

  id v13 = [DNDSModeAssertionUpdateResult alloc];
  id v14 = -[DNDSModeAssertionUpdateResult initWithAssertions:invalidations:](v13, "initWithAssertions:invalidations:", v9, v12, v16, v17, v18, v19);

  return v14;
}

uint64_t __86__DNDSModeAssertionManagerUpdateContext__calculateUpdateResultForStore_previousStore___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 assertions];
  int v5 = [v4 containsObject:v3];

  return v5 ^ 1u;
}

uint64_t __86__DNDSModeAssertionManagerUpdateContext__calculateUpdateResultForStore_previousStore___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 invalidations];
  int v5 = [v4 containsObject:v3];

  return v5 ^ 1u;
}

- (DNDSModeAssertionStore)store
{
  return self->_store;
}

- (DNDSModeAssertionUpdateResult)updateResult
{
  return self->_updateResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateResult, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_clientDetailsProvider, 0);
}

@end