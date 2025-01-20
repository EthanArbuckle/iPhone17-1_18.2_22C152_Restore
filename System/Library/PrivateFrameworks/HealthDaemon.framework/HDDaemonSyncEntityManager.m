@interface HDDaemonSyncEntityManager
- (HDDaemonSyncEntityManager)initWithDaemon:(id)a3;
- (NSArray)orderedSyncEntities;
- (NSDictionary)syncEntitiesByIdentifier;
- (void)_lock_loadSyncEntities;
@end

@implementation HDDaemonSyncEntityManager

- (HDDaemonSyncEntityManager)initWithDaemon:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDDaemonSyncEntityManager;
  v5 = [(HDDaemonSyncEntityManager *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)_lock_loadSyncEntities
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
    if (!*(void *)(a1 + 24))
    {
      id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v42 = a1;
      v3 = (id *)(a1 + 8);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      v5 = [WeakRetained behavior];
      [v5 futureMigrationsEnabled];
      v6 = HDBuiltinOrderedSyncEntities();
      v7 = (void *)[v6 mutableCopy];

      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v55 objects:v69 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v56;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v56 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v55 + 1) + 8 * i);
            v14 = [v13 syncEntityIdentifier];
            [v2 setObject:v13 forKeyedSubscript:v14];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v55 objects:v69 count:16];
        }
        while (v10);
      }
      v43 = v8;

      id v15 = objc_loadWeakRetained(v3);
      v16 = [v15 pluginManager];
      v17 = [v16 pluginsConformingToProtocol:&unk_1F1803C10];
      v18 = [v17 allValues];

      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id obj = v18;
      uint64_t v46 = [obj countByEnumeratingWithState:&v51 objects:v68 count:16];
      if (v46)
      {
        uint64_t v45 = *(void *)v52;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v52 != v45) {
              objc_enumerationMutation(obj);
            }
            v20 = *(void **)(*((void *)&v51 + 1) + 8 * v19);
            v21 = [v20 orderedSyncEntities];
            id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            long long v47 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            id v23 = v21;
            uint64_t v24 = [v23 countByEnumeratingWithState:&v47 objects:v67 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v26 = *(void *)v48;
LABEL_17:
              uint64_t v27 = 0;
              while (1)
              {
                if (*(void *)v48 != v26) {
                  objc_enumerationMutation(v23);
                }
                v28 = *(void **)(*((void *)&v47 + 1) + 8 * v27);
                v29 = [v28 syncEntityIdentifier];
                if ([v22 objectForKeyedSubscript:v29]) {
                  break;
                }
                if ([v2 objectForKeyedSubscript:v29])
                {
                  _HKInitializeLogging();
                  v35 = (void *)*MEMORY[0x1E4F29FA8];
                  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR)) {
                    goto LABEL_28;
                  }
                  v31 = v35;
                  uint64_t v36 = [v2 objectForKeyedSubscript:v29];
                  *(_DWORD *)buf = 138544130;
                  v60 = v20;
                  __int16 v61 = 2114;
                  v62 = v28;
                  __int16 v63 = 2114;
                  uint64_t v64 = (uint64_t)v29;
                  __int16 v65 = 2112;
                  uint64_t v66 = v36;
                  v33 = v31;
                  v34 = "Plugin %{public}@ provides a sync entity %{public}@ with identifier %{public}@, but a sync entit"
                        "y already exists (%@) for that identifier. This plugin will be ignored for sync.";
                  goto LABEL_32;
                }
                [v22 setObject:v28 forKeyedSubscript:v29];

                if (v25 == ++v27)
                {
                  uint64_t v25 = [v23 countByEnumeratingWithState:&v47 objects:v67 count:16];
                  if (v25) {
                    goto LABEL_17;
                  }
                  goto LABEL_24;
                }
              }
              _HKInitializeLogging();
              v30 = (void *)*MEMORY[0x1E4F29FA8];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
              {
LABEL_28:

                goto LABEL_29;
              }
              v31 = v30;
              uint64_t v32 = [v22 objectForKeyedSubscript:v29];
              *(_DWORD *)buf = 138544130;
              v60 = v20;
              __int16 v61 = 2114;
              v62 = v28;
              __int16 v63 = 2114;
              uint64_t v64 = v32;
              __int16 v65 = 2114;
              uint64_t v66 = (uint64_t)v29;
              v33 = v31;
              v34 = "Plugin %{public}@ provides multiple sync entities (%{public}@, %{public}@) for identifier %{public}@"
                    ". This plugin will be ignored for sync.";
LABEL_32:
              _os_log_error_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_ERROR, v34, buf, 0x2Au);

              goto LABEL_28;
            }
LABEL_24:

            [v43 addObjectsFromArray:v23];
            [v2 addEntriesFromDictionary:v22];
LABEL_29:

            ++v19;
          }
          while (v19 != v46);
          uint64_t v37 = [obj countByEnumeratingWithState:&v51 objects:v68 count:16];
          uint64_t v46 = v37;
        }
        while (v37);
      }

      uint64_t v38 = [v43 copy];
      v39 = *(void **)(v42 + 24);
      *(void *)(v42 + 24) = v38;

      uint64_t v40 = [v2 copy];
      v41 = *(void **)(v42 + 32);
      *(void *)(v42 + 32) = v40;
    }
  }
}

- (NSArray)orderedSyncEntities
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_allOrderedSyncEntities = self->_lock_allOrderedSyncEntities;
  if (!lock_allOrderedSyncEntities)
  {
    -[HDDaemonSyncEntityManager _lock_loadSyncEntities]((uint64_t)self);
    lock_allOrderedSyncEntities = self->_lock_allOrderedSyncEntities;
  }
  v5 = lock_allOrderedSyncEntities;
  os_unfair_lock_unlock(p_lock);
  if (v5) {
    v6 = v5;
  }
  else {
    v6 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  v7 = v6;

  return v7;
}

- (NSDictionary)syncEntitiesByIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_allSyncEntitiesByIdentifier = self->_lock_allSyncEntitiesByIdentifier;
  if (!lock_allSyncEntitiesByIdentifier)
  {
    -[HDDaemonSyncEntityManager _lock_loadSyncEntities]((uint64_t)self);
    lock_allSyncEntitiesByIdentifier = self->_lock_allSyncEntitiesByIdentifier;
  }
  v5 = (void *)[(NSDictionary *)lock_allSyncEntitiesByIdentifier copy];
  os_unfair_lock_unlock(p_lock);
  if (v5) {
    v6 = v5;
  }
  else {
    v6 = (void *)MEMORY[0x1E4F1CC08];
  }
  v7 = v6;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_allSyncEntitiesByIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_allOrderedSyncEntities, 0);

  objc_destroyWeak((id *)&self->_daemon);
}

@end