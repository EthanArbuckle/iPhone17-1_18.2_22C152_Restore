@interface HDTaskServerRegistry
- (BOOL)loadTaskServersFromPluginAtURL:(id)a3 error:(id *)a4;
- (BOOL)registerTaskServerClass:(Class)a3 error:(id *)a4;
- (BOOL)registerTaskServerClasses:(id)a3 error:(id *)a4;
- (BOOL)registerTaskServerClassesWithProvider:(id)a3 error:(id *)a4;
- (Class)_taskServerClassForIdentifier:(id)a3;
- (HDDaemon)daemon;
- (HDTaskServerRegistry)initWithDaemon:(id)a3;
- (id)createTaskServerEndpointForIdentifier:(id)a3 taskUUID:(id)a4 instanceUUID:(id)a5 configuration:(id)a6 client:(id)a7 connectionQueue:(id)a8 error:(id *)a9;
- (id)taskServerForTaskUUID:(id)a3;
- (uint64_t)_lock_registerTaskServerClass:(uint64_t)a3 error:;
- (void)addObserver:(id)a3 forTaskServerUUID:(id)a4 queue:(id)a5;
- (void)didCreateTaskServer:(id)a3;
- (void)removeObserver:(id)a3 forTaskServerUUID:(id)a4;
- (void)removeTaskServerObserver:(id)a3;
- (void)taskServerDidInvalidate:(id)a3;
@end

@implementation HDTaskServerRegistry

- (HDTaskServerRegistry)initWithDaemon:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HDTaskServerRegistry;
  v5 = [(HDTaskServerRegistry *)&v16 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    taskServerClassesByTaskIdentifier = v6->_taskServerClassesByTaskIdentifier;
    v6->_taskServerClassesByTaskIdentifier = v7;

    uint64_t v9 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    taskServersByUUID = v6->_taskServersByUUID;
    v6->_taskServersByUUID = (NSMapTable *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    taskServerObserversByUUID = v6->_taskServerObserversByUUID;
    v6->_taskServerObserversByUUID = v11;

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    loadedPluginURLs = v6->_loadedPluginURLs;
    v6->_loadedPluginURLs = v13;

    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (BOOL)registerTaskServerClassesWithProvider:(id)a3 error:(id *)a4
{
  v6 = [a3 taskServerClasses];
  if ([v6 count]) {
    BOOL v7 = [(HDTaskServerRegistry *)self registerTaskServerClasses:v6 error:a4];
  }
  else {
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)registerTaskServerClass:(Class)a3 error:(id *)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v12 = 0;
  char v8 = -[HDTaskServerRegistry _lock_registerTaskServerClass:error:]((uint64_t)self, a3, (uint64_t)&v12);
  id v9 = v12;
  os_unfair_lock_unlock(p_lock);
  if ((v8 & 1) == 0)
  {
    id v10 = v9;
    if (v10)
    {
      if (a4) {
        *a4 = v10;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v8;
}

- (uint64_t)_lock_registerTaskServerClass:(uint64_t)a3 error:
{
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 40));
    if (objc_opt_respondsToSelector())
    {
      v6 = [a2 taskIdentifier];
      BOOL v7 = (void *)[*(id *)(a1 + 8) objectForKeyedSubscript:v6];
      if (![v7 isSubclassOfClass:a2]
        || ([a2 isSubclassOfClass:v7] & 1) == 0)
      {
        if (v7)
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 3, @"Attempt to register class '%@' as a task server for '%@', but class '%@' is already registered for that identifier.", a2, v6, objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", v6));
          uint64_t v8 = 0;
LABEL_11:

          return v8;
        }
        [*(id *)(a1 + 8) setObject:a2 forKeyedSubscript:v6];
      }
      uint64_t v8 = 1;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 3, @"%@ does not respond to taskIdentifier", a2);
  }
  return 0;
}

- (BOOL)registerTaskServerClasses:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v20;
LABEL_3:
    uint64_t v12 = 0;
    v13 = v10;
    while (1)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(v7);
      }
      v14 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
      id v18 = v13;
      int v15 = -[HDTaskServerRegistry _lock_registerTaskServerClass:error:]((uint64_t)self, v14, (uint64_t)&v18);
      id v10 = v18;

      if (!v15) {
        break;
      }
      ++v12;
      v13 = v10;
      if (v9 == v12)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v9) {
          goto LABEL_3;
        }

        os_unfair_lock_unlock(&self->_lock);
        BOOL v16 = 1;
        goto LABEL_16;
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  os_unfair_lock_unlock(&self->_lock);
  id v10 = v10;
  if (v10)
  {
    if (a4) {
      *a4 = v10;
    }
    else {
      _HKLogDroppedError();
    }
  }

  BOOL v16 = 0;
LABEL_16:

  return v16;
}

- (BOOL)loadTaskServersFromPluginAtURL:(id)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  id v8 = v7;
  if (!self) {
    goto LABEL_24;
  }
  if ([(NSMutableSet *)self->_loadedPluginURLs containsObject:v8])
  {
    BOOL v9 = 1;
    goto LABEL_31;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v10 = [(HDTaskServerRegistry *)self daemon];
  uint64_t v11 = [v10 pluginManager];
  uint64_t v12 = [v11 allowablePluginDirectoryPaths];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v41 count:16];
  if (!v13)
  {
LABEL_12:

    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Invalid plugin URL for task server registration: %@", v8);
LABEL_24:
    BOOL v9 = 0;
    goto LABEL_31;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v35;
LABEL_6:
  uint64_t v16 = 0;
  while (1)
  {
    if (*(void *)v35 != v15) {
      objc_enumerationMutation(v12);
    }
    uint64_t v17 = *(void *)(*((void *)&v34 + 1) + 8 * v16);
    id v18 = [v8 path];
    LOBYTE(v17) = [v18 hasPrefix:v17];

    if (v17) {
      break;
    }
    if (v14 == ++v16)
    {
      uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v41 count:16];
      if (v14) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
  }

  [(NSMutableSet *)self->_loadedPluginURLs addObject:v8];
  long long v19 = (void *)MEMORY[0x1E4F2B330];
  v40 = &unk_1F1803C88;
  long long v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  long long v21 = (objc_class *)[v19 loadPrincipalClassConformingToProtocols:v20 fromBundleAtURL:v8 skipIfLoaded:0];

  if (!v21) {
    goto LABEL_24;
  }
  id v22 = objc_alloc_init(v21);
  v23 = v22;
  if (v22)
  {
    [v22 taskServerClasses];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v24 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = [v24 countByEnumeratingWithState:&v30 objects:buf count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v31 != v27) {
            objc_enumerationMutation(v24);
          }
          if (!-[HDTaskServerRegistry _lock_registerTaskServerClass:error:]((uint64_t)self, *(void **)(*((void *)&v30 + 1) + 8 * i), (uint64_t)a4))
          {
            BOOL v9 = 0;
            goto LABEL_26;
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v30 objects:buf count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }
    BOOL v9 = 1;
LABEL_26:
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v24 = HKLogInfrastructure();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v39 = v21;
      _os_log_error_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_ERROR, "Unable to instantiate candidate task server class provider %{public}@", buf, 0xCu);
    }
    BOOL v9 = 0;
  }

LABEL_31:
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (id)taskServerForTaskUUID:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(NSMapTable *)self->_taskServersByUUID objectForKey:v5];

  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)addObserver:(id)a3 forTaskServerUUID:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HDTaskServerRegistry.m", 183, @"Invalid parameter not satisfying: %@", @"taskUUID != nil" object file lineNumber description];
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v13 = [(NSMutableDictionary *)self->_taskServerObserversByUUID objectForKeyedSubscript:v10];
  if (!v13)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    uint64_t v15 = [v10 UUIDString];
    uint64_t v16 = HKLogInfrastructure();
    uint64_t v13 = (void *)[v14 initWithName:v15 loggingCategory:v16];

    [(NSMutableDictionary *)self->_taskServerObserversByUUID setObject:v13 forKeyedSubscript:v10];
  }
  [v13 registerObserver:v9 queue:v11];
  uint64_t v17 = [(NSMapTable *)self->_taskServersByUUID objectForKey:v10];
  os_unfair_lock_unlock(p_lock);
  if (v17)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __60__HDTaskServerRegistry_addObserver_forTaskServerUUID_queue___block_invoke;
    v19[3] = &unk_1E63076A0;
    id v20 = v17;
    [v13 notifyObserver:v9 handler:v19];
  }
}

uint64_t __60__HDTaskServerRegistry_addObserver_forTaskServerUUID_queue___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didCreateTaskServer:*(void *)(a1 + 32)];
}

- (void)removeObserver:(id)a3 forTaskServerUUID:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  id v9 = [(NSMutableDictionary *)self->_taskServerObserversByUUID objectForKeyedSubscript:v7];

  [v9 unregisterObserver:v8];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeTaskServerObserver:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(NSMutableDictionary *)self->_taskServerObserversByUUID allValues];
  os_unfair_lock_unlock(p_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "unregisterObserver:", v4, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)didCreateTaskServer:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  taskServersByUUID = self->_taskServersByUUID;
  id v7 = [v4 taskUUID];
  [(NSMapTable *)taskServersByUUID setObject:v4 forKey:v7];

  taskServerObserversByUUID = self->_taskServerObserversByUUID;
  uint64_t v9 = [v4 taskUUID];
  uint64_t v10 = [(NSMutableDictionary *)taskServerObserversByUUID objectForKeyedSubscript:v9];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__HDTaskServerRegistry_didCreateTaskServer___block_invoke;
  v12[3] = &unk_1E63076A0;
  id v13 = v4;
  id v11 = v4;
  [v10 notifyObservers:v12];

  os_unfair_lock_unlock(p_lock);
}

uint64_t __44__HDTaskServerRegistry_didCreateTaskServer___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didCreateTaskServer:*(void *)(a1 + 32)];
}

- (void)taskServerDidInvalidate:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  taskServerObserversByUUID = self->_taskServerObserversByUUID;
  id v7 = [v4 taskUUID];
  uint64_t v8 = [(NSMutableDictionary *)taskServerObserversByUUID objectForKeyedSubscript:v7];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__HDTaskServerRegistry_taskServerDidInvalidate___block_invoke;
  v12[3] = &unk_1E63076A0;
  id v13 = v4;
  id v9 = v4;
  [v8 notifyObservers:v12];

  uint64_t v10 = self->_taskServerObserversByUUID;
  id v11 = [v9 taskUUID];
  [(NSMutableDictionary *)v10 setObject:0 forKeyedSubscript:v11];

  os_unfair_lock_unlock(p_lock);
}

uint64_t __48__HDTaskServerRegistry_taskServerDidInvalidate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didInvalidateTaskServer:*(void *)(a1 + 32)];
}

- (Class)_taskServerClassForIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = (void *)[(NSMutableDictionary *)self->_taskServerClassesByTaskIdentifier objectForKeyedSubscript:v5];

  os_unfair_lock_unlock(p_lock);

  return (Class)v6;
}

- (id)createTaskServerEndpointForIdentifier:(id)a3 taskUUID:(id)a4 instanceUUID:(id)a5 configuration:(id)a6 client:(id)a7 connectionQueue:(id)a8 error:(id *)a9
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  long long v21 = [(HDTaskServerRegistry *)self _taskServerClassForIdentifier:v15];
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a9, 3, @"No registered task server for identifier '%@'", v15);
    goto LABEL_19;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
    v28 = NSStringFromClass(v21);
    objc_msgSend(v27, "hk_assignError:code:format:", a9, 125, @"Task server class %@ failed to implement requiredEntitlements", v28);
    goto LABEL_16;
  }
  id v35 = v17;
  id v37 = v16;
  [(objc_class *)v21 requiredEntitlements];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = [v22 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v40 != v25) {
          objc_enumerationMutation(v22);
        }
        if (![v19 hasRequiredEntitlement:*(void *)(*((void *)&v39 + 1) + 8 * i) error:a9])
        {

          long long v21 = 0;
          id v17 = v35;
          id v16 = v37;
          goto LABEL_19;
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v24) {
        continue;
      }
      break;
    }
  }

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v17 = v35;
    id v16 = v37;
    if (v18)
    {
      long long v30 = (void *)MEMORY[0x1E4F28C58];
      v28 = NSStringFromClass(v21);
      objc_msgSend(v30, "hk_assignError:code:format:", a9, 125, @"Task server class %@ does not implement configurationClass", v28);
      goto LABEL_16;
    }
    goto LABEL_24;
  }
  [(objc_class *)v21 configurationClass];
  id v17 = v35;
  id v16 = v37;
  if (objc_opt_isKindOfClass())
  {
LABEL_24:
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ![(objc_class *)v21 validateClient:v19 error:a9])
    {
      goto LABEL_17;
    }
    if (!v18) {
      goto LABEL_29;
    }
    if (objc_opt_respondsToSelector())
    {
      if (([(objc_class *)v21 validateConfiguration:v18 client:v19 error:a9] & 1) == 0) {
        goto LABEL_17;
      }
LABEL_29:
      v38 = [HDTaskServerEndpoint alloc];
      long long v36 = [v19 configuration];
      long long v34 = [v19 profile];
      long long v31 = [v19 databaseAccessibilityAssertions];
      long long v21 = [(HDTaskServerEndpoint *)v38 initWithTaskServerClass:v21 taskConfiguration:v18 healthStoreConfiguration:v36 taskUUID:v16 instanceUUID:v17 profile:v34 databaseAccessibilityAssertions:v31 connectionQueue:v20];

      if (v21) {
        long long v32 = v21;
      }
      else {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a9, 3, @"Failed to instantiate task server endpoint for '%@'", v15);
      }

      goto LABEL_19;
    }
    long long v33 = (void *)MEMORY[0x1E4F28C58];
    v28 = NSStringFromClass(v21);
    objc_msgSend(v33, "hk_assignError:code:format:", a9, 125, @"Task server class %@ failed to implement validateConfiguration:error:", v28);
LABEL_16:

    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a9, 3, @"Invalid configuration class %@ (expected %@)", objc_opt_class(), -[objc_class configurationClass](v21, "configurationClass"));
LABEL_17:
  long long v21 = 0;
LABEL_19:

  return v21;
}

- (HDDaemon)daemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);

  return (HDDaemon *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_loadedPluginURLs, 0);
  objc_storeStrong((id *)&self->_taskServerObserversByUUID, 0);
  objc_storeStrong((id *)&self->_taskServersByUUID, 0);

  objc_storeStrong((id *)&self->_taskServerClassesByTaskIdentifier, 0);
}

@end