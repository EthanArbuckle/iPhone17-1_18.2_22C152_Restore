@interface HDProcessStateManager
- (BOOL)applicationIsForeground:(id)a3;
- (BOOL)isApplicationFrontBoardVisibleForBundleIdentifier:(id)a3;
- (BOOL)isApplicationInExtendedRuntimeSessionForBundleIdentifier:(id)a3;
- (BOOL)isApplicationStateBackgroundRunningForBundleIdentifier:(id)a3;
- (BOOL)isApplicationStateForegroundForBundleIdentifier:(id)a3;
- (BOOL)isApplicationStateSuspendedForBundleIdentifier:(id)a3;
- (BOOL)processIsForeground:(int)a3;
- (BOOL)registerObserver:(id)a3 forBundleIdentifier:(id)a4;
- (HDApplicationStateMonitorProvider)applicationStateMonitorProvider;
- (HDProcessStateManager)init;
- (HDProcessStateManager)initWithApplicationStateMonitorProvider:(id)a3;
- (id)diagnosticDescription;
- (int)processIdentifierForApplicationIdentifier:(id)a3;
- (unsigned)applicationStateForBundleIdentifier:(id)a3;
- (void)_handleBackboardApplicationInfoChanged:(uint64_t)a1;
- (void)dealloc;
- (void)registerForegroundClientProcessObserver:(id)a3;
- (void)unregisterForegroundClientProcessObserver:(id)a3;
- (void)unregisterObserver:(id)a3 forBundleIdentifier:(id)a4;
@end

@implementation HDProcessStateManager

- (BOOL)registerObserver:(id)a3 forBundleIdentifier:(id)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 length];
  _HKInitializeLogging();
  v9 = (os_log_t *)MEMORY[0x1E4F29F88];
  v10 = *MEMORY[0x1E4F29F88];
  BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F88], OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_debug_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEBUG, "Registering observer %@ for process state changes for %@", buf, 0x16u);
    }
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v13 = v6;
    id v14 = v7;
    if (!self) {
      goto LABEL_23;
    }
    os_unfair_lock_assert_owner(&self->_lock);
    v15 = [(NSMutableDictionary *)self->_processObserversByBundleID objectForKey:v14];
    v16 = v15;
    if (v15)
    {
      [v15 addObject:v13];
      LOBYTE(self) = 1;
LABEL_22:

LABEL_23:
      os_unfair_lock_unlock(p_lock);
      goto LABEL_24;
    }
    v16 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [v16 addObject:v13];
    [(NSMutableDictionary *)self->_processObserversByBundleID setObject:v16 forKey:v14];
    v28 = [(BKSApplicationStateMonitor *)self->_applicationMonitor interestedBundleIDs];
    if (self->_applicationMonitor)
    {
      if ([v28 containsObject:v14])
      {
LABEL_20:
        LOBYTE(self) = 1;
LABEL_21:

        goto LABEL_22;
      }
      v17 = [v28 arrayByAddingObject:v14];
      _HKInitializeLogging();
      v18 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v17;
        _os_log_debug_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEBUG, "Updating application state observer for processes: %@", buf, 0xCu);
      }
      [(BKSApplicationStateMonitor *)self->_applicationMonitor updateInterestedBundleIDs:v17];
    }
    else
    {
      v27 = [(HDProcessStateManager *)self applicationStateMonitorProvider];
      v33[0] = v14;
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
      v20 = [v27 createApplicationStateMonitorWithBundleIDs:v19 states:15 elevatedPriority:1];
      applicationMonitor = self->_applicationMonitor;
      self->_applicationMonitor = v20;

      LODWORD(v19) = self->_applicationMonitor == 0;
      _HKInitializeLogging();
      v22 = *v9;
      v23 = *v9;
      if (v19)
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v14;
          _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "Failed to create an application state monitor for %@.", buf, 0xCu);
        }
        LOBYTE(self) = 0;
        goto LABEL_21;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v14;
        _os_log_debug_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_DEBUG, "Created an application state monitor for bundle identifier %@.", buf, 0xCu);
      }
      objc_initWeak(location, self);
      v24 = self->_applicationMonitor;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __68__HDProcessStateManager__lock_registerObserver_forBundleIdentifier___block_invoke;
      v31 = &unk_1E62FD748;
      objc_copyWeak(v32, location);
      [(BKSApplicationStateMonitor *)v24 setHandler:buf];
      objc_destroyWeak(v32);
      objc_destroyWeak(location);
    }
    [(NSMutableDictionary *)self->_processInfoByBundleID removeObjectForKey:v14];
    v25 = self->_applicationMonitor;
    location[0] = (id)MEMORY[0x1E4F143A8];
    location[1] = (id)3221225472;
    location[2] = __68__HDProcessStateManager__lock_registerObserver_forBundleIdentifier___block_invoke_295;
    location[3] = &unk_1E62FD770;
    location[4] = self;
    [(BKSApplicationStateMonitor *)v25 applicationInfoForApplication:v14 completion:location];
    goto LABEL_20;
  }
  if (v11)
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEBUG, "Failed to register process missing a bundle identifier.", buf, 2u);
  }
  LOBYTE(self) = 0;
LABEL_24:

  return (char)self;
}

- (BOOL)isApplicationStateSuspendedForBundleIdentifier:(id)a3
{
  return [(HDProcessStateManager *)self applicationStateForBundleIdentifier:a3] == 2;
}

- (void)_handleBackboardApplicationInfoChanged:(uint64_t)a1
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  v3 = (os_unfair_lock_s *)(a1 + 48);
  id v4 = a2;
  os_unfair_lock_lock(v3);
  uint64_t v5 = a1;
  id v6 = v4;
  os_unfair_lock_assert_owner(v3);
  uint64_t v7 = *MEMORY[0x1E4F4E230];
  uint64_t v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F4E230]];
  if (!v8) {
    goto LABEL_29;
  }
  v9 = (void *)[*(id *)(a1 + 64) copy];
  id v54 = v6;
  id v10 = v6;
  self;
  BOOL v11 = objc_alloc_init(_HDProcessInfo);
  v12 = [v10 objectForKeyedSubscript:v7];
  uint64_t v13 = [v12 copy];
  bundleIdentifier = v11->_bundleIdentifier;
  v11->_bundleIdentifier = (NSString *)v13;

  v15 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F4E248]];
  v11->_applicationState = [v15 unsignedIntValue];

  v16 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F4E258]];

  v11->_pid = [v16 intValue];
  v53 = v8;
  [*(id *)(v5 + 64) setObject:v11 forKeyedSubscript:v8];

  id v17 = v9;
  os_unfair_lock_assert_owner(v3);
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v19 = [*(id *)(v5 + 64) allKeys];
  [v18 addObjectsFromArray:v19];

  v60 = v17;
  v20 = [v17 allKeys];
  [v18 addObjectsFromArray:v20];

  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v57 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v22 = v18;
  v23 = v21;
  id obj = v22;
  uint64_t v24 = v5;
  uint64_t v61 = [v22 countByEnumeratingWithState:&v63 objects:v77 count:16];
  uint64_t v62 = v5;
  v56 = v21;
  if (!v61) {
    goto LABEL_25;
  }
  uint64_t v59 = *(void *)v64;
  v55 = v3;
  do
  {
    uint64_t v25 = 0;
    do
    {
      if (*(void *)v64 != v59) {
        objc_enumerationMutation(obj);
      }
      v26 = *(void **)(*((void *)&v63 + 1) + 8 * v25);
      v27 = [*(id *)(v24 + 64) objectForKeyedSubscript:v26];
      uint64_t v28 = [v60 objectForKeyedSubscript:v26];
      v29 = (void *)v28;
      if (v27)
      {
        unsigned int v30 = v27[2];
        int v31 = v27[3];
        if (!v28) {
          goto LABEL_10;
        }
      }
      else
      {
        unsigned int v30 = 0;
        if (!v28)
        {
          int v31 = 0;
LABEL_10:
          unsigned int v32 = 0;
          goto LABEL_14;
        }
        int v31 = *(_DWORD *)(v28 + 12);
      }
      unsigned int v32 = *(_DWORD *)(v28 + 8);
LABEL_14:
      id v33 = v26;
      os_unfair_lock_assert_owner(v3);
      if (v30 != v32)
      {
        _HKInitializeLogging();
        v34 = (void *)*MEMORY[0x1E4F29F88];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F88], OS_LOG_TYPE_DEFAULT))
        {
          v35 = v34;
          v36 = HDBKSApplicationStateString(v32);
          v37 = HDBKSApplicationStateString(v30);
          *(_DWORD *)buf = 138414338;
          *(void *)&buf[4] = v33;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v31;
          *(_WORD *)&buf[18] = 2114;
          *(void *)&buf[20] = v36;
          *(_WORD *)&buf[28] = 2114;
          *(void *)&buf[30] = v37;
          *(_WORD *)&buf[38] = 2048;
          unint64_t v79 = v32 == 2;
          *(_WORD *)v80 = 2048;
          *(void *)&v80[2] = v30 == 2;
          __int16 v81 = 2048;
          BOOL v82 = v32 == 8;
          __int16 v83 = 2048;
          BOOL v84 = v30 == 8;
          __int16 v85 = 2048;
          BOOL v86 = v30 < 2;
          _os_log_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_DEFAULT, "Process %@ (%d) state changed %{public}@ -> %{public}@: suspended %ld -> %ld, foreground %ld -> %ld, terminated %ld", buf, 0x58u);

          v3 = v55;
          uint64_t v24 = v62;
        }
        v38 = [*(id *)(v24 + 8) objectForKeyedSubscript:v33];
        v39 = [v38 allObjects];

        v40 = *(NSObject **)(v62 + 56);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __141__HDProcessStateManager__lock_notifyObserversProcessWithBundleIdentifier_processIdentifier_applicationStateChanged_previousApplicationState___block_invoke;
        block[3] = &unk_1E62FD798;
        id v68 = v39;
        unsigned int v70 = v32;
        unsigned int v71 = v30;
        id v69 = v33;
        BOOL v72 = v32 == 2;
        BOOL v73 = v30 == 2;
        BOOL v74 = v32 == 8;
        BOOL v75 = v30 == 8;
        BOOL v76 = v30 < 2;
        id v41 = v39;
        dispatch_async(v40, block);

        uint64_t v24 = v62;
        v23 = v56;
      }

      v42 = v23;
      if (v30 == 8 || (v42 = v57, v32 == 8)) {
        [v42 addObject:v33];
      }

      ++v25;
    }
    while (v61 != v25);
    uint64_t v43 = [obj countByEnumeratingWithState:&v63 objects:v77 count:16];
    uint64_t v61 = v43;
  }
  while (v43);
LABEL_25:

  if (([v23 isEqual:v57] & 1) == 0 && (objc_msgSend(*(id *)(v24 + 24), "isEqual:", v23) & 1) == 0)
  {
    v44 = [*(id *)(v24 + 16) allObjects];
    v45 = (void *)[v56 copy];
    v46 = (void *)[v57 copy];
    v47 = *(NSObject **)(v24 + 56);
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __83__HDProcessStateManager__lock_handleProcessInfoChangedWithAllPreviousProcessInfos___block_invoke;
    *(void *)&unsigned char buf[24] = &unk_1E62F30F8;
    *(void *)&buf[32] = v44;
    unint64_t v79 = (unint64_t)v45;
    *(void *)v80 = v46;
    id v48 = v46;
    id v49 = v45;
    id v50 = v44;
    dispatch_async(v47, buf);

    uint64_t v24 = v62;
    v23 = v56;
  }
  uint64_t v51 = [v23 copy];
  v52 = *(void **)(v24 + 24);
  *(void *)(v24 + 24) = v51;

  uint64_t v8 = v53;
  id v6 = v54;
LABEL_29:

  os_unfair_lock_unlock(v3);
}

- (BOOL)isApplicationStateForegroundForBundleIdentifier:(id)a3
{
  return [(HDProcessStateManager *)self applicationStateForBundleIdentifier:a3] == 8;
}

- (void)unregisterObserver:(id)a3 forBundleIdentifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 length];
  _HKInitializeLogging();
  v9 = *MEMORY[0x1E4F29F88];
  BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F88], OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10)
    {
      int v16 = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_debug_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEBUG, "Unregistering observer %@ for process state changes for %@", (uint8_t *)&v16, 0x16u);
    }
    os_unfair_lock_lock(&self->_lock);
    id v11 = v7;
    if (self)
    {
      id v12 = v6;
      os_unfair_lock_assert_owner(&self->_lock);
      uint64_t v13 = [(NSMutableDictionary *)self->_processObserversByBundleID objectForKeyedSubscript:v11];
      [v13 removeObject:v12];

      id v14 = [v13 allObjects];
      uint64_t v15 = [v14 count];

      if (!v15) {
        [(NSMutableDictionary *)self->_processObserversByBundleID removeObjectForKey:v11];
      }
    }
    os_unfair_lock_unlock(&self->_lock);
  }
  else if (v10)
  {
    LOWORD(v16) = 0;
    _os_log_debug_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEBUG, "Failed to unregister process, empty bundle identifier.", (uint8_t *)&v16, 2u);
  }
}

- (void)registerForegroundClientProcessObserver:(id)a3
{
  if (a3)
  {
    p_lock = &self->_lock;
    id v5 = a3;
    os_unfair_lock_lock(p_lock);
    [(NSHashTable *)self->_foregroundClientProcessObservers addObject:v5];

    os_unfair_lock_unlock(p_lock);
  }
}

- (HDProcessStateManager)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDProcessStateManager)initWithApplicationStateMonitorProvider:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HDProcessStateManager;
  id v5 = [(HDProcessStateManager *)&v23 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_applicationStateMonitorProvider, v4);
    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    processObserversByBundleID = v6->_processObserversByBundleID;
    v6->_processObserversByBundleID = v7;

    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v9 = HKCreateSerialDispatchQueue();
    clientCalloutQueue = v6->_clientCalloutQueue;
    v6->_clientCalloutQueue = (OS_dispatch_queue *)v9;

    id v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    processInfoByBundleID = v6->_processInfoByBundleID;
    v6->_processInfoByBundleID = v11;

    uint64_t v13 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    foregroundClientProcessObservers = v6->_foregroundClientProcessObservers;
    v6->_foregroundClientProcessObservers = (NSHashTable *)v13;

    uint64_t v15 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    foregroundClientBundleIdentifiers = v6->_foregroundClientBundleIdentifiers;
    v6->_foregroundClientBundleIdentifiers = v15;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_applicationStateMonitorProvider);
    uint64_t v18 = [WeakRetained createRBSProcessStateProvider];
    rbsProcessStateProvider = v6->_rbsProcessStateProvider;
    v6->_rbsProcessStateProvider = (HDRBSProcessStateProvider *)v18;

    uint64_t v20 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
    [v20 addObject:v6];

    id v21 = v6;
  }

  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
  [v3 removeObject:self];

  v4.receiver = self;
  v4.super_class = (Class)HDProcessStateManager;
  [(HDProcessStateManager *)&v4 dealloc];
}

- (void)unregisterForegroundClientProcessObserver:(id)a3
{
  if (a3)
  {
    p_lock = &self->_lock;
    id v5 = a3;
    os_unfair_lock_lock(p_lock);
    [(NSHashTable *)self->_foregroundClientProcessObservers removeObject:v5];

    os_unfair_lock_unlock(p_lock);
  }
}

- (unsigned)applicationStateForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    os_unfair_lock_lock(&self->_lock);
    id v5 = [(NSMutableDictionary *)self->_processInfoByBundleID objectForKeyedSubscript:v4];
    id v6 = self->_applicationMonitor;
    os_unfair_lock_unlock(&self->_lock);
    if (v5)
    {
      unsigned int v7 = v5[2];
    }
    else if (v6)
    {
      unsigned int v7 = [(BKSApplicationStateMonitor *)v6 applicationStateForApplication:v4];
    }
    else
    {
      uint64_t v8 = [(HDProcessStateManager *)self applicationStateMonitorProvider];
      uint64_t v9 = [v8 createApplicationStateMonitor];

      unsigned int v7 = [v9 applicationStateForApplication:v4];
      [v9 invalidate];
    }
  }
  else
  {
    unsigned int v7 = 0;
  }

  return v7;
}

- (BOOL)isApplicationInExtendedRuntimeSessionForBundleIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(MEMORY[0x1E4F963F8], "identifierWithPid:", -[HDProcessStateManager processIdentifierForApplicationIdentifier:](self, "processIdentifierForApplicationIdentifier:", a3));
  id v5 = [(HDRBSProcessStateProvider *)self->_rbsProcessStateProvider stateForProcessIdentifier:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = objc_msgSend(v5, "tags", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v13 + 1) + 8 * i) isEqualToString:@"CSLExtendedRuntimeSession"])
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)isApplicationFrontBoardVisibleForBundleIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (os_log_t *)MEMORY[0x1E4F29F88];
  id v6 = *MEMORY[0x1E4F29F88];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F88], OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543618;
    long long v14 = self;
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Verifying FrontBoard visibility for %{public}@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F963F8], "identifierWithPid:", -[HDProcessStateManager processIdentifierForApplicationIdentifier:](self, "processIdentifierForApplicationIdentifier:", v4));
  uint64_t v8 = [(HDRBSProcessStateProvider *)self->_rbsProcessStateProvider stateForProcessIdentifier:v7];
  uint64_t v9 = [v8 endowmentNamespaces];
  int v10 = [v9 containsObject:*MEMORY[0x1E4F62718]];

  if (v10)
  {
    _HKInitializeLogging();
    BOOL v11 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543618;
      long long v14 = self;
      __int16 v15 = 2114;
      id v16 = v7;
      _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Current process identifier %{public}@ has FBS scene visibility endowment", (uint8_t *)&v13, 0x16u);
    }
  }

  return v10;
}

- (BOOL)isApplicationStateBackgroundRunningForBundleIdentifier:(id)a3
{
  return [(HDProcessStateManager *)self applicationStateForBundleIdentifier:a3] == 4;
}

- (BOOL)applicationIsForeground:(id)a3
{
  id v4 = a3;
  id v5 = [(HDProcessStateManager *)self applicationStateMonitorProvider];
  id v6 = [v5 createApplicationStateMonitor];

  LODWORD(v5) = [v6 applicationStateForApplication:v4];
  [v6 invalidate];

  return v5 == 8;
}

- (BOOL)processIsForeground:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(HDProcessStateManager *)self applicationStateMonitorProvider];
  id v5 = [v4 createApplicationStateMonitor];

  LODWORD(v3) = [v5 mostElevatedApplicationStateForPID:v3];
  [v5 invalidate];

  return v3 == 8;
}

- (int)processIdentifierForApplicationIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HDProcessStateManager *)self applicationStateMonitorProvider];
  id v6 = [v5 createApplicationStateMonitor];

  uint64_t v7 = [v6 applicationInfoForApplication:v4];
  [v6 invalidate];
  uint64_t v8 = [v7 objectForKey:*MEMORY[0x1E4F4E258]];
  uint64_t v9 = v8;
  if (v8) {
    int v10 = [v8 intValue];
  }
  else {
    int v10 = -1;
  }
  BOOL v11 = [v7 objectForKey:*MEMORY[0x1E4F4E248]];
  int v12 = [v11 unsignedIntValue];

  if (v12 == 1 && v10 != -1)
  {
    _HKInitializeLogging();
    long long v14 = *MEMORY[0x1E4F29F88];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F88], OS_LOG_TYPE_INFO))
    {
      int v16 = 138543618;
      id v17 = v4;
      __int16 v18 = 1026;
      int v19 = v10;
      _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_INFO, "Process %{public}@ is terminated but monitor reported pid %{public}d. Returning -1.", (uint8_t *)&v16, 0x12u);
    }
    int v10 = -1;
  }

  return v10;
}

void __68__HDProcessStateManager__lock_registerObserver_forBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  -[HDProcessStateManager _handleBackboardApplicationInfoChanged:]((uint64_t)WeakRetained, v3);
}

void __68__HDProcessStateManager__lock_registerObserver_forBundleIdentifier___block_invoke_295(uint64_t a1, void *a2)
{
}

void __83__HDProcessStateManager__lock_handleProcessInfoChangedWithAllPreviousProcessInfos___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "foregroundClientProcessesDidChange:previouslyForegroundBundleIdentifiers:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void __141__HDProcessStateManager__lock_notifyObserversProcessWithBundleIdentifier_processIdentifier_applicationStateChanged_previousApplicationState___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (*(_DWORD *)(a1 + 48) != *(_DWORD *)(a1 + 52) && (objc_opt_respondsToSelector() & 1) != 0) {
          [v7 processWithBundleIdentifier:*(void *)(a1 + 40) didTransitionFromState:*(unsigned int *)(a1 + 48) toState:*(unsigned int *)(a1 + 52)];
        }
        int v8 = *(unsigned __int8 *)(a1 + 57);
        if (!*(unsigned char *)(a1 + 56)) {
          goto LABEL_15;
        }
        if (!*(unsigned char *)(a1 + 57))
        {
          if (objc_opt_respondsToSelector()) {
            [v7 processResumed:*(void *)(a1 + 40)];
          }
          if (!*(unsigned char *)(a1 + 56))
          {
            int v8 = *(unsigned __int8 *)(a1 + 57);
LABEL_15:
            if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
              [v7 processSuspended:*(void *)(a1 + 40)];
            }
          }
        }
        int v9 = *(unsigned __int8 *)(a1 + 59);
        if (!*(unsigned char *)(a1 + 58)) {
          goto LABEL_24;
        }
        if (!*(unsigned char *)(a1 + 59))
        {
          if (objc_opt_respondsToSelector()) {
            [v7 processDidEnterBackground:*(void *)(a1 + 40)];
          }
          if (!*(unsigned char *)(a1 + 58))
          {
            int v9 = *(unsigned __int8 *)(a1 + 59);
LABEL_24:
            if (v9 && (objc_opt_respondsToSelector() & 1) != 0) {
              [v7 processDidEnterForeground:*(void *)(a1 + 40)];
            }
          }
        }
        if (*(unsigned char *)(a1 + 60) && (objc_opt_respondsToSelector() & 1) != 0) {
          [v7 processTerminated:*(void *)(a1 + 40)];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (id)diagnosticDescription
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithString:@"Client processes:"];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [(NSMutableDictionary *)self->_processInfoByBundleID allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * v8);
        if (v9)
        {
          id v10 = *(id *)(v9 + 16);
          long long v11 = [NSNumber numberWithInt:*(unsigned int *)(v9 + 12)];
          unsigned int v12 = *(_DWORD *)(v9 + 8);
        }
        else
        {
          long long v11 = [NSNumber numberWithInt:0];
          id v10 = 0;
          unsigned int v12 = 0;
        }
        long long v13 = HDBKSApplicationStateString(v12);
        [v3 appendFormat:@"\n\t%@ (%@) %@", v10, v11, v13];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v14 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v6 = v14;
    }
    while (v14);
  }

  return v3;
}

- (HDApplicationStateMonitorProvider)applicationStateMonitorProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationStateMonitorProvider);

  return (HDApplicationStateMonitorProvider *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_applicationStateMonitorProvider);
  objc_storeStrong((id *)&self->_processInfoByBundleID, 0);
  objc_storeStrong((id *)&self->_clientCalloutQueue, 0);
  objc_storeStrong((id *)&self->_rbsProcessStateProvider, 0);
  objc_storeStrong((id *)&self->_applicationMonitor, 0);
  objc_storeStrong((id *)&self->_foregroundClientBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_foregroundClientProcessObservers, 0);

  objc_storeStrong((id *)&self->_processObserversByBundleID, 0);
}

@end