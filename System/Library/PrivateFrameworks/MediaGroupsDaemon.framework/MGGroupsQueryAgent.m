@interface MGGroupsQueryAgent
- (MGGroupIdentifier)currentIdentifier;
- (MGGroupsQueryAgent)init;
- (MGGroupsQueryAgent)initWithDelegate:(id)a3;
- (MGGroupsQueryAgentDelegate)delegate;
- (NSDictionary)containers;
- (NSDictionary)groups;
- (NSDictionary)groupsByMediator;
- (NSDictionary)mediatorsByGroup;
- (NSDictionary)operations;
- (NSDictionary)queries;
- (NSDictionary)variables;
- (NSMapTable)mediators;
- (NSOperationQueue)queue;
- (id)outstandingQueryForIdentifier:(id)a3;
- (void)_performQueryExchangeUsingGroups:(id)a3 currentIdentifier:(id)a4;
- (void)_prepareWithGroups:(id)a3 currentIdentifier:(id)a4;
- (void)_queryOperation:(id)a3 didFindGroups:(id)a4;
- (void)_withLock:(id)a3;
- (void)addOutstandingQuery:(id)a3;
- (void)groupsMediator:(id)a3 didUpdateGroups:(id)a4;
- (void)groupsMediatorRemoved:(id)a3;
- (void)removeOutstandingQuery:(id)a3;
- (void)setContainers:(id)a3;
- (void)setCurrentDeviceIdentifier:(id)a3;
- (void)setCurrentIdentifier:(id)a3;
- (void)setGroups:(id)a3;
- (void)setGroupsByMediator:(id)a3;
- (void)setMediatorsByGroup:(id)a3;
- (void)setOperations:(id)a3;
- (void)setQueries:(id)a3;
- (void)setVariables:(id)a3;
@end

@implementation MGGroupsQueryAgent

- (MGGroupsQueryAgent)initWithDelegate:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)MGGroupsQueryAgent;
  v5 = [(MGGroupsQueryAgent *)&v33 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    queue = v6->_queue;
    v6->_queue = v7;

    v9 = v6->_queue;
    v10 = NSString;
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v13 = [v10 stringWithFormat:@"%@-%p", v12, v6];
    [(NSOperationQueue *)v9 setName:v13];

    v14 = (NSDictionary *)objc_alloc_init(NSDictionary);
    queries = v6->_queries;
    v6->_queries = v14;

    v16 = (NSDictionary *)objc_alloc_init(NSDictionary);
    operations = v6->_operations;
    v6->_operations = v16;

    uint64_t v18 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    mediators = v6->_mediators;
    v6->_mediators = (NSMapTable *)v18;

    v20 = (NSDictionary *)objc_alloc_init(NSDictionary);
    mediatorsByGroup = v6->_mediatorsByGroup;
    v6->_mediatorsByGroup = v20;

    v22 = (NSDictionary *)objc_alloc_init(NSDictionary);
    groupsByMediator = v6->_groupsByMediator;
    v6->_groupsByMediator = v22;

    v24 = (NSDictionary *)objc_alloc_init(NSDictionary);
    groups = v6->_groups;
    v6->_groups = v24;

    v26 = (NSDictionary *)objc_alloc_init(NSDictionary);
    containers = v6->_containers;
    v6->_containers = v26;

    v28 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v29 = [v28 integerForKey:@"com.apple.media-groups.max-operations"];
    if (v29 <= 5) {
      uint64_t v30 = 5;
    }
    else {
      uint64_t v30 = v29;
    }
    [(NSOperationQueue *)v6->_queue setMaxConcurrentOperationCount:v30];
    v31 = MGLogForCategory(4);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v35 = v6;
      __int16 v36 = 2048;
      uint64_t v37 = v30;
      _os_log_impl(&dword_229257000, v31, OS_LOG_TYPE_DEFAULT, "%p operating with a max concurrency of %ld", buf, 0x16u);
    }
  }
  return v6;
}

- (MGGroupsQueryAgent)init
{
  return [(MGGroupsQueryAgent *)self initWithDelegate:0];
}

- (void)setGroups:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = [(MGGroupsQueryAgent *)self groups];
  char v6 = [v5 isEqualToDictionary:v4];

  if (v6)
  {
    v7 = v4;
  }
  else
  {
    v7 = (void *)[v4 copy];

    objc_storeStrong((id *)&self->_groups, v7);
    v8 = MGLogForCategory(4);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218240;
      v11 = self;
      __int16 v12 = 2048;
      v13 = v7;
      _os_log_impl(&dword_229257000, v8, OS_LOG_TYPE_DEFAULT, "%p groups updated to %p", (uint8_t *)&v10, 0x16u);
    }

    v9 = [(MGGroupsQueryAgent *)self currentIdentifier];
    [(MGGroupsQueryAgent *)self _performQueryExchangeUsingGroups:v7 currentIdentifier:v9];
  }
}

- (void)setGroupsByMediator:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = [(MGGroupsQueryAgent *)self groupsByMediator];
  char v6 = [v5 isEqualToDictionary:v4];

  if ((v6 & 1) == 0)
  {
    v7 = (void *)[v4 copy];

    p_groupsByMediator = &self->_groupsByMediator;
    v21 = v7;
    objc_storeStrong((id *)&self->_groupsByMediator, v7);
    id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v22 = self;
    int v10 = [(NSDictionary *)self->_groupsByMediator allKeys];
    v11 = [v10 sortedArrayUsingComparator:&__block_literal_global];

    obuint64_t j = v11;
    uint64_t v26 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v26)
    {
      uint64_t v24 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v14 = -[NSDictionary objectForKey:](*p_groupsByMediator, "objectForKey:", v13, v21);
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v28;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v28 != v17) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 8 * j);
                v20 = [v14 objectForKey:v19];
                [v8 setObject:v20 forKey:v19];
                [v9 setObject:v13 forKey:v19];
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
            }
            while (v16);
          }
        }
        uint64_t v26 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v26);
    }

    [(MGGroupsQueryAgent *)v22 setMediatorsByGroup:v9];
    [(MGGroupsQueryAgent *)v22 setGroups:v8];

    id v4 = v21;
  }
}

uint64_t __42__MGGroupsQueryAgent_setGroupsByMediator___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)setCurrentIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = (MGGroupIdentifier *)a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_currentIdentifier == v4 || (-[MGGroupIdentifier isEqual:](v4, "isEqual:") & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    v5 = (MGGroupIdentifier *)[(MGGroupIdentifier *)v4 copy];

    objc_storeStrong((id *)&self->_currentIdentifier, v5);
    char v6 = MGLogForCategory(4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134218240;
      id v9 = self;
      __int16 v10 = 2048;
      v11 = v5;
      _os_log_impl(&dword_229257000, v6, OS_LOG_TYPE_DEFAULT, "%p current identifier changed to %p", (uint8_t *)&v8, 0x16u);
    }

    v7 = [(MGGroupsQueryAgent *)self groups];
    [(MGGroupsQueryAgent *)self _performQueryExchangeUsingGroups:v7 currentIdentifier:v5];
  }
}

- (void)setCurrentDeviceIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__MGGroupsQueryAgent_setCurrentDeviceIdentifier___block_invoke;
  v6[3] = &unk_26485E468;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(MGGroupsQueryAgent *)self _withLock:v6];
}

uint64_t __49__MGGroupsQueryAgent_setCurrentDeviceIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentIdentifier:*(void *)(a1 + 40)];
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)_performQueryExchangeUsingGroups:(id)a3 currentIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  int v8 = [(MGGroupsQueryAgent *)self queue];
  [v8 cancelAllOperations];
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __73__MGGroupsQueryAgent__performQueryExchangeUsingGroups_currentIdentifier___block_invoke;
  v11[3] = &unk_26485E708;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [v8 addBarrierBlock:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __73__MGGroupsQueryAgent__performQueryExchangeUsingGroups_currentIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _prepareWithGroups:*(void *)(a1 + 32) currentIdentifier:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)_prepareWithGroups:(id)a3 currentIdentifier:(id)a4
{
  uint64_t v124 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v112[0] = MEMORY[0x263EF8330];
  v112[1] = 3221225472;
  v112[2] = __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke;
  v112[3] = &unk_26485E758;
  v112[4] = self;
  id v8 = v6;
  id v113 = v8;
  id v74 = v7;
  id v114 = v74;
  id v9 = (unsigned int (**)(void))MEMORY[0x22A6B39E0](v112);
  if (((unsigned int (*)(void))v9[2])())
  {
    id v10 = MGLogForCategory(4);
    v75 = v10;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v121 = self;
      __int16 v122 = 2048;
      id v123 = v8;
      _os_log_impl(&dword_229257000, v10, OS_LOG_TYPE_DEFAULT, "%p got an update after %p", buf, 0x16u);
    }
    v11 = v74;
  }
  else
  {
    v69 = self;
    id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v12 setObject:v8 forKey:@"ALL_GROUPS_MAP"];
    id v13 = [v8 allValues];
    v75 = v12;
    [v12 setObject:v13 forKey:@"ALL_GROUPS_LIST"];
    id v14 = [MEMORY[0x263F546F8] type];
    v119[0] = v14;
    uint64_t v15 = [MEMORY[0x263F54750] type];
    v119[1] = v15;
    uint64_t v16 = [MEMORY[0x263F54730] type];
    v119[2] = v16;
    uint64_t v17 = [MEMORY[0x263F54718] type];
    v119[3] = v17;
    uint64_t v18 = [MEMORY[0x263F54728] type];
    v119[4] = v18;
    uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v119 count:5];

    v110[0] = MEMORY[0x263EF8330];
    v110[1] = 3221225472;
    v110[2] = __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_24;
    v110[3] = &unk_26485E780;
    id v20 = v19;
    id v111 = v20;
    v21 = [v13 indexesOfObjectsPassingTest:v110];
    v22 = [v13 objectsAtIndexes:v21];

    v108[0] = MEMORY[0x263EF8330];
    v108[1] = 3221225472;
    v108[2] = __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_2_26;
    v108[3] = &unk_26485E7A8;
    id v70 = v20;
    id v109 = v70;
    v23 = [v22 sortedArrayUsingComparator:v108];

    id v24 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v104[0] = MEMORY[0x263EF8330];
    v104[1] = 3221225472;
    v104[2] = __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_3;
    v104[3] = &unk_26485E7D0;
    v25 = v9;
    id v107 = v25;
    id v72 = v8;
    id v73 = v8;
    id v105 = v73;
    id v26 = v24;
    id v106 = v26;
    [v23 enumerateObjectsUsingBlock:v104];
    v71 = v9;
    if (v9[2](v25))
    {
      long long v27 = MGLogForCategory(4);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v121 = v69;
        __int16 v122 = 2048;
        id v123 = v73;
        _os_log_impl(&dword_229257000, v27, OS_LOG_TYPE_DEFAULT, "%p got a newer update after %p", buf, 0x16u);
      }
      v11 = v74;
    }
    else
    {
      long long v102 = 0u;
      long long v103 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      id v28 = v23;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v100 objects:v118 count:16];
      v79 = v23;
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v101;
        uint64_t v76 = *(void *)v101;
        id v77 = v28;
        do
        {
          uint64_t v32 = 0;
          uint64_t v80 = v30;
          do
          {
            if (*(void *)v101 != v31) {
              objc_enumerationMutation(v28);
            }
            long long v33 = *(void **)(*((void *)&v100 + 1) + 8 * v32);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                uint64_t v82 = v32;
                long long v34 = [v33 identifier];
                long long v96 = 0u;
                long long v97 = 0u;
                long long v98 = 0u;
                long long v99 = 0u;
                v35 = [v33 memberIdentifiers];
                uint64_t v36 = [v35 countByEnumeratingWithState:&v96 objects:v117 count:16];
                if (v36)
                {
                  uint64_t v37 = v36;
                  uint64_t v38 = *(void *)v97;
                  do
                  {
                    uint64_t v39 = 0;
                    do
                    {
                      if (*(void *)v97 != v38) {
                        objc_enumerationMutation(v35);
                      }
                      v40 = [v26 objectForKey:*(void *)(*((void *)&v96 + 1) + 8 * v39)];
                      v94[0] = MEMORY[0x263EF8330];
                      v94[1] = 3221225472;
                      v94[2] = __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_29;
                      v94[3] = &unk_26485E7F8;
                      id v41 = v34;
                      id v95 = v41;
                      v42 = [v40 objectsPassingTest:v94];

                      if ([v42 count])
                      {
                        id v43 = [v26 objectForKey:v41];
                        if (!v43)
                        {
                          id v43 = objc_alloc_init(MEMORY[0x263EFF9C0]);
                          [v26 setObject:v43 forKey:v41];
                        }
                        [v43 unionSet:v42];
                      }
                      ++v39;
                    }
                    while (v37 != v39);
                    uint64_t v37 = [v35 countByEnumeratingWithState:&v96 objects:v117 count:16];
                  }
                  while (v37);
                }

                id v28 = v77;
                v23 = v79;
                uint64_t v31 = v76;
                uint64_t v30 = v80;
                uint64_t v32 = v82;
              }
            }
            ++v32;
          }
          while (v32 != v30);
          uint64_t v30 = [v28 countByEnumeratingWithState:&v100 objects:v118 count:16];
        }
        while (v30);
      }

      [v75 setObject:v26 forKey:@"CONTAINMENT_MAP"];
      v11 = v74;
      if (v74 && ([v73 objectForKey:v74], (uint64_t v44 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v45 = (void *)v44;
        v46 = v75;
        [v75 setObject:v44 forKey:@"CURRENT_SOLO_GROUP"];
        v115[0] = @"CURRENT_HOME";
        v47 = (void *)MEMORY[0x263F08A98];
        v83 = [MEMORY[0x263F546F8] type];
        v78 = [v47 predicateWithFormat:@"SELF.type == %@", v83];
        v116[0] = v78;
        v115[1] = @"CURRENT_ROOM";
        v48 = (void *)MEMORY[0x263F08A98];
        v49 = [MEMORY[0x263F54730] type];
        v50 = [v48 predicateWithFormat:@"SELF.type == %@", v49];
        v116[1] = v50;
        v115[2] = @"CURRENT_MEDIA_SYSTEM";
        v51 = (void *)MEMORY[0x263F08A98];
        v52 = [MEMORY[0x263F54728] type];
        v53 = [v51 predicateWithFormat:@"SELF.type == %@", v52];
        v116[2] = v53;
        v115[3] = @"CURRENT_ZONE";
        v54 = (void *)MEMORY[0x263F08A98];
        v55 = [MEMORY[0x263F54750] type];
        v56 = [v54 predicateWithFormat:@"SELF.type == %@", v55];
        v116[3] = v56;
        v81 = [NSDictionary dictionaryWithObjects:v116 forKeys:v115 count:4];

        v23 = v79;
        v57 = (void *)MEMORY[0x263F08A98];
        v58 = [v45 identifier];
        v59 = [v57 predicateWithFormat:@"$CONTAINMENT_MAP[%@] != nil", v58];

        v60 = (void *)MEMORY[0x263F08A98];
        v11 = v74;
        v61 = [v45 identifier];
        v62 = [v60 predicateWithFormat:@"SUBQUERY($CONTAINMENT_MAP[%@], $container, SELF.identifier IN $container)[SIZE] > 0", v61];

        v90[0] = MEMORY[0x263EF8330];
        v90[1] = 3221225472;
        v90[2] = __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_2_60;
        v90[3] = &unk_26485E820;
        id v91 = v59;
        id v92 = v62;
        v93 = v75;
        id v63 = v59;
        id v64 = v62;
        [v81 enumerateKeysAndObjectsUsingBlock:v90];
      }
      else
      {
        v65 = [MEMORY[0x263EFF9D0] null];
        v46 = v75;
        [v75 setObject:v65 forKey:@"CURRENT_SOLO_GROUP"];

        v66 = [MEMORY[0x263EFF9D0] null];
        [v75 setObject:v66 forKey:@"CURRENT_HOME"];

        v67 = [MEMORY[0x263EFF9D0] null];
        [v75 setObject:v67 forKey:@"CURRENT_ROOM"];

        v68 = [MEMORY[0x263EFF9D0] null];
        [v75 setObject:v68 forKey:@"CURRENT_MEDIA_SYSTEM"];

        v45 = [MEMORY[0x263EFF9D0] null];
        [v75 setObject:v45 forKey:@"CURRENT_ZONE"];
      }

      v84[0] = MEMORY[0x263EF8330];
      v84[1] = 3221225472;
      v84[2] = __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_3_64;
      v84[3] = &unk_26485E870;
      v85 = v73;
      v86 = v69;
      id v87 = v11;
      id v88 = v26;
      v89 = v46;
      [(MGGroupsQueryAgent *)v69 _withLock:v84];

      long long v27 = v85;
    }

    id v9 = v71;
    id v8 = v72;
  }
}

uint64_t __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_2;
  v7[3] = &unk_26485E730;
  v11 = &v12;
  v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = *(id *)(a1 + 48);
  [v2 _withLock:v7];
  uint64_t v5 = *((unsigned __int8 *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v5;
}

void __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) groups];
  if (objc_msgSend(v2, "isEqualToDictionary:"))
  {
    id v3 = *(void **)(a1 + 48);
    uint64_t v4 = [*(id *)(a1 + 40) currentIdentifier];
    if (v3 == v4)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    }
    else
    {
      uint64_t v5 = *(void **)(a1 + 48);
      id v6 = [*(id *)(a1 + 40) currentIdentifier];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v5 isEqual:v6] ^ 1;
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

uint64_t __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_24(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 type];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_2_26(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [a2 type];
  unint64_t v8 = [v5 indexOfObject:v7];

  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = [v6 type];

  unint64_t v11 = [v9 indexOfObject:v10];
  uint64_t v12 = -1;
  if (v8 >= v11) {
    uint64_t v12 = 1;
  }
  if (v8 == v11) {
    return 0;
  }
  else {
    return v12;
  }
}

void __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_3(void **a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  char v6 = (*((uint64_t (**)(void))a1[6] + 2))();
  *a4 = v6;
  if ((v6 & 1) == 0) {
    _AddContainmentForGroup(v7, a1[4], MEMORY[0x263EFFA68], a1[5], a1[6]);
  }
}

uint64_t __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_29(uint64_t a1, void *a2)
{
  return [a2 containsObject:*(void *)(a1 + 32)] ^ 1;
}

void __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_2_60(uint64_t a1, void *a2, void *a3)
{
  v17[3] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263F08730];
  uint64_t v8 = *(void *)(a1 + 40);
  v17[0] = *(void *)(a1 + 32);
  v17[1] = v6;
  v17[2] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
  id v10 = [v7 andPredicateWithSubpredicates:v9];

  unint64_t v11 = [v10 predicateWithSubstitutionVariables:*(void *)(a1 + 48)];

  uint64_t v12 = [*(id *)(a1 + 48) objectForKey:@"ALL_GROUPS_LIST"];
  id v13 = [v12 filteredArrayUsingPredicate:v11];

  uint64_t v14 = *(void **)(a1 + 48);
  char v15 = [v13 firstObject];
  if (v15)
  {
    [v14 setObject:v15 forKey:v5];
  }
  else
  {
    uint64_t v16 = [MEMORY[0x263EFF9D0] null];
    [v14 setObject:v16 forKey:v5];
  }
}

void __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_3_64(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) groups];
  if ([v2 isEqualToDictionary:v3])
  {
    uint64_t v4 = *(void **)(a1 + 48);
    uint64_t v5 = [*(id *)(a1 + 40) currentIdentifier];
    if (v4 == (void *)v5)
    {

LABEL_9:
      [*(id *)(a1 + 40) setContainers:*(void *)(a1 + 56)];
      [*(id *)(a1 + 40) setVariables:*(void *)(a1 + 64)];
      uint64_t v12 = [*(id *)(a1 + 40) queue];
      uint64_t v9 = [*(id *)(a1 + 40) queries];
      id v13 = MGLogForCategory(4);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134218240;
        uint64_t v27 = v14;
        __int16 v28 = 2048;
        uint64_t v29 = [v9 count];
        _os_log_impl(&dword_229257000, v13, OS_LOG_TYPE_DEFAULT, "%p spawning %lu queries", buf, 0x16u);
      }

      char v15 = [*(id *)(a1 + 40) operations];
      uint64_t v16 = (void *)[v15 mutableCopy];

      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_65;
      v21[3] = &unk_26485E848;
      int8x16_t v20 = *(int8x16_t *)(a1 + 32);
      id v17 = (id)v20.i64[0];
      int8x16_t v22 = vextq_s8(v20, v20, 8uLL);
      id v23 = *(id *)(a1 + 64);
      id v24 = v16;
      id v25 = v12;
      id v18 = v12;
      id v19 = v16;
      [v9 enumerateKeysAndObjectsUsingBlock:v21];
      [*(id *)(a1 + 40) setOperations:v19];

      goto LABEL_12;
    }
    id v6 = (void *)v5;
    id v7 = *(void **)(a1 + 48);
    uint64_t v8 = [*(id *)(a1 + 40) currentIdentifier];
    LODWORD(v7) = [v7 isEqual:v8];

    if (v7) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  uint64_t v9 = MGLogForCategory(4);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218240;
    uint64_t v27 = v10;
    __int16 v28 = 2048;
    uint64_t v29 = v11;
    _os_log_impl(&dword_229257000, v9, OS_LOG_TYPE_DEFAULT, "%p got a late update after %p", buf, 0x16u);
  }
LABEL_12:
}

void __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_65(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [[MGGroupsQueryOperation alloc] initWithAgent:*(void *)(a1 + 32) query:v5 groups:*(void *)(a1 + 40) substitutionVariables:*(void *)(a1 + 48)];

  [*(id *)(a1 + 56) setObject:v7 forKey:v6];
  [*(id *)(a1 + 64) addOperation:v7];
}

- (void)_queryOperation:(id)a3 didFindGroups:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v8 = [v6 query];
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__4;
  uint64_t v27 = __Block_byref_object_dispose__4;
  id v28 = 0;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  char v15 = __52__MGGroupsQueryAgent__queryOperation_didFindGroups___block_invoke;
  uint64_t v16 = &unk_26485E898;
  id v9 = v8;
  id v17 = v9;
  v21 = &v29;
  id v10 = v6;
  id v18 = v10;
  id v19 = self;
  id v11 = v7;
  id v20 = v11;
  int8x16_t v22 = &v23;
  [(MGGroupsQueryAgent *)self _withLock:&v13];
  if (!*((unsigned char *)v30 + 24))
  {
    uint64_t v12 = [(MGGroupsQueryAgent *)self delegate];
    [v12 groupsQueryAgent:self didFindResults:v24[5] forQuery:v9];
  }
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
}

void __52__MGGroupsQueryAgent__queryOperation_didFindGroups___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  long long v33 = [*(id *)(a1 + 32) identifier];
  int v2 = [*(id *)(a1 + 40) isCancelled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v2;
  if (v2)
  {
    id v3 = MGLogForCategory(4);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 48);
      uint64_t v5 = [*(id *)(a1 + 56) count];
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v4;
      __int16 v40 = 2112;
      id v41 = v33;
      __int16 v42 = 2048;
      uint64_t v43 = v5;
      _os_log_impl(&dword_229257000, v3, OS_LOG_TYPE_DEFAULT, "%p canceled query %@ with %lu found items", buf, 0x20u);
    }
  }
  else
  {
    char v32 = [*(id *)(a1 + 48) operations];
    id v6 = *(void **)(a1 + 40);
    id v7 = [v32 objectForKey:v33];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v6 != v7;

    if (v6 == v7)
    {
      id v11 = [v32 mutableCopy];
      [v11 removeObjectForKey:v33];
      uint64_t v31 = v11;
      [*(id *)(a1 + 48) setOperations:v11];
      uint64_t v12 = MGLogForCategory(4);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 48);
        uint64_t v14 = [*(id *)(a1 + 56) count];
        *(_DWORD *)buf = 134218498;
        *(void *)&uint8_t buf[4] = v13;
        __int16 v40 = 2112;
        id v41 = v33;
        __int16 v42 = 2048;
        uint64_t v43 = v14;
        _os_log_impl(&dword_229257000, v12, OS_LOG_TYPE_DEFAULT, "%p completed query %@ with %lu found items", buf, 0x20u);
      }

      uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      uint64_t v16 = *(void *)(*(void *)(a1 + 72) + 8);
      id v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;

      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v18 = *(id *)(a1 + 56);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v35;
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v35 != v20) {
              objc_enumerationMutation(v18);
            }
            int8x16_t v22 = *(void **)(*((void *)&v34 + 1) + 8 * v21);
            *(void *)buf = 0;
            uint64_t v23 = [v22 identifier];
            id v24 = [*(id *)(a1 + 48) mediatorsByGroup];
            uint64_t v25 = [v24 objectForKey:v23];

            if (v25)
            {
              id v26 = [*(id *)(a1 + 48) mediators];
              uint64_t v27 = [v26 objectForKey:v25];
              objc_storeWeak((id *)buf, v27);
            }
            id v28 = [MGGroupsQueryAgentResult alloc];
            id WeakRetained = objc_loadWeakRetained((id *)buf);
            uint64_t v30 = [(MGGroupsQueryAgentResult *)v28 initWithGroup:v22 mediator:WeakRetained];

            [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObject:v30];
            objc_destroyWeak((id *)buf);

            ++v21;
          }
          while (v19 != v21);
          uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v19);
      }
    }
    else
    {
      uint64_t v8 = MGLogForCategory(4);
      uint64_t v31 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 48);
        uint64_t v10 = [*(id *)(a1 + 56) count];
        *(_DWORD *)buf = 134218498;
        *(void *)&uint8_t buf[4] = v9;
        __int16 v40 = 2112;
        id v41 = v33;
        __int16 v42 = 2048;
        uint64_t v43 = v10;
        _os_log_impl(&dword_229257000, v8, OS_LOG_TYPE_DEFAULT, "%p subsumed query %@ with %lu found items", buf, 0x20u);
      }
    }

    id v3 = v32;
  }
}

- (void)addOutstandingQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__MGGroupsQueryAgent_addOutstandingQuery___block_invoke;
  v8[3] = &unk_26485E5F8;
  v8[4] = self;
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  [(MGGroupsQueryAgent *)self _withLock:v8];
}

void __42__MGGroupsQueryAgent_addOutstandingQuery___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) queries];
  id v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (!v3)
  {
    id v4 = (void *)[v2 mutableCopy];
    [v4 setObject:*(void *)(a1 + 48) forKey:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setQueries:v4];
    uint64_t v5 = [*(id *)(a1 + 32) operations];
    id v6 = [v5 objectForKey:*(void *)(a1 + 40)];

    if (!v6)
    {
      id v7 = [MGGroupsQueryOperation alloc];
      uint64_t v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 48);
      id v10 = [v8 groups];
      id v11 = [*(id *)(a1 + 32) variables];
      uint64_t v12 = [(MGGroupsQueryOperation *)v7 initWithAgent:v8 query:v9 groups:v10 substitutionVariables:v11];

      uint64_t v13 = [*(id *)(a1 + 32) operations];
      uint64_t v14 = (void *)[v13 mutableCopy];

      [v14 setObject:v12 forKey:*(void *)(a1 + 40)];
      [*(id *)(a1 + 32) setOperations:v14];
      uint64_t v15 = [*(id *)(a1 + 32) queue];
      [v15 addOperation:v12];
    }
    uint64_t v16 = MGLogForCategory(4);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = *(void *)(a1 + 40);
      int v19 = 134218242;
      uint64_t v20 = v17;
      __int16 v21 = 2112;
      uint64_t v22 = v18;
      _os_log_impl(&dword_229257000, v16, OS_LOG_TYPE_DEFAULT, "%p added query %@", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (void)removeOutstandingQuery:(id)a3
{
  id v4 = [a3 identifier];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__MGGroupsQueryAgent_removeOutstandingQuery___block_invoke;
  v6[3] = &unk_26485E468;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(MGGroupsQueryAgent *)self _withLock:v6];
}

void __45__MGGroupsQueryAgent_removeOutstandingQuery___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) queries];
  id v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = (void *)[v2 mutableCopy];
    [v4 removeObjectForKey:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setQueries:v4];
    id v5 = MGLogForCategory(4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      int v15 = 134218242;
      uint64_t v16 = v6;
      __int16 v17 = 2112;
      uint64_t v18 = v7;
      _os_log_impl(&dword_229257000, v5, OS_LOG_TYPE_DEFAULT, "%p removed query %@", (uint8_t *)&v15, 0x16u);
    }
  }
  uint64_t v8 = [*(id *)(a1 + 32) operations];
  uint64_t v9 = [v8 objectForKey:*(void *)(a1 + 40)];
  id v10 = v9;
  if (v9)
  {
    [v9 cancel];
    id v11 = (void *)[v8 mutableCopy];
    [v11 removeObjectForKey:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setOperations:v11];
    uint64_t v12 = MGLogForCategory(4);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      int v15 = 134218242;
      uint64_t v16 = v13;
      __int16 v17 = 2112;
      uint64_t v18 = v14;
      _os_log_impl(&dword_229257000, v12, OS_LOG_TYPE_DEFAULT, "%p canceled removed query %@", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (id)outstandingQueryForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__4;
  int v15 = __Block_byref_object_dispose__4;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__MGGroupsQueryAgent_outstandingQueryForIdentifier___block_invoke;
  v8[3] = &unk_26485E4E0;
  id v10 = &v11;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(MGGroupsQueryAgent *)self _withLock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __52__MGGroupsQueryAgent_outstandingQueryForIdentifier___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) queries];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)groupsMediator:(id)a3 didUpdateGroups:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__MGGroupsQueryAgent_groupsMediator_didUpdateGroups___block_invoke;
  v10[3] = &unk_26485E5F8;
  v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(MGGroupsQueryAgent *)self _withLock:v10];
}

void __53__MGGroupsQueryAgent_groupsMediator_didUpdateGroups___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = MGLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v10 = 134218496;
    uint64_t v11 = v3;
    __int16 v12 = 2048;
    uint64_t v13 = v4;
    __int16 v14 = 2048;
    uint64_t v15 = v5;
    _os_log_impl(&dword_229257000, v2, OS_LOG_TYPE_DEFAULT, "%p received update %p from %p", (uint8_t *)&v10, 0x20u);
  }

  id v6 = [*(id *)(a1 + 48) identifier];
  id v7 = [*(id *)(a1 + 32) mediators];
  [v7 setObject:*(void *)(a1 + 48) forKey:v6];

  id v8 = [*(id *)(a1 + 32) groupsByMediator];
  id v9 = (void *)[v8 mutableCopy];

  [v9 setObject:*(void *)(a1 + 40) forKey:v6];
  [*(id *)(a1 + 32) setGroupsByMediator:v9];
}

- (void)groupsMediatorRemoved:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__MGGroupsQueryAgent_groupsMediatorRemoved___block_invoke;
  v6[3] = &unk_26485E468;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(MGGroupsQueryAgent *)self _withLock:v6];
}

void __44__MGGroupsQueryAgent_groupsMediatorRemoved___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = MGLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v9 = 134218240;
    uint64_t v10 = v3;
    __int16 v11 = 2048;
    uint64_t v12 = v4;
    _os_log_impl(&dword_229257000, v2, OS_LOG_TYPE_DEFAULT, "%p dropping %p", (uint8_t *)&v9, 0x16u);
  }

  id v5 = [*(id *)(a1 + 40) identifier];
  id v6 = [*(id *)(a1 + 32) mediators];
  [v6 removeObjectForKey:v5];

  id v7 = [*(id *)(a1 + 32) groupsByMediator];
  id v8 = (void *)[v7 mutableCopy];

  [v8 removeObjectForKey:v5];
  [*(id *)(a1 + 32) setGroupsByMediator:v8];
}

- (MGGroupsQueryAgentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MGGroupsQueryAgentDelegate *)WeakRetained;
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (NSDictionary)operations
{
  return self->_operations;
}

- (void)setOperations:(id)a3
{
}

- (NSMapTable)mediators
{
  return self->_mediators;
}

- (NSDictionary)mediatorsByGroup
{
  return self->_mediatorsByGroup;
}

- (void)setMediatorsByGroup:(id)a3
{
}

- (NSDictionary)groupsByMediator
{
  return self->_groupsByMediator;
}

- (NSDictionary)groups
{
  return self->_groups;
}

- (MGGroupIdentifier)currentIdentifier
{
  return self->_currentIdentifier;
}

- (NSDictionary)containers
{
  return self->_containers;
}

- (void)setContainers:(id)a3
{
}

- (NSDictionary)variables
{
  return self->_variables;
}

- (void)setVariables:(id)a3
{
}

- (NSDictionary)queries
{
  return self->_queries;
}

- (void)setQueries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queries, 0);
  objc_storeStrong((id *)&self->_variables, 0);
  objc_storeStrong((id *)&self->_containers, 0);
  objc_storeStrong((id *)&self->_currentIdentifier, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_groupsByMediator, 0);
  objc_storeStrong((id *)&self->_mediatorsByGroup, 0);
  objc_storeStrong((id *)&self->_mediators, 0);
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end