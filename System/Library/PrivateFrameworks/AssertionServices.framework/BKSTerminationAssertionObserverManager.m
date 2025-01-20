@interface BKSTerminationAssertionObserverManager
- (BKSTerminationAssertionObserverManager)init;
- (BOOL)hasTerminationAssertionForBundleID:(id)a3;
- (unint64_t)efficacyForBundleID:(id)a3;
- (void)_createMonitor;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
@end

@implementation BKSTerminationAssertionObserverManager

- (BKSTerminationAssertionObserverManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)BKSTerminationAssertionObserverManager;
  v2 = [(BKSTerminationAssertionObserverManager *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F964A0] createBackgroundQueue:@"com.apple.runningboardservices.bksterminationassertion.callout"];
    calloutQueue = v3->_calloutQueue;
    v3->_calloutQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
    launchPreventedBundleIDs = v3->_launchPreventedBundleIDs;
    v3->_launchPreventedBundleIDs = (NSMutableSet *)v6;

    [(BKSTerminationAssertionObserverManager *)v3 _createMonitor];
  }
  return v3;
}

- (void)addObserver:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  observers = self->_observers;
  if (!observers)
  {
    v5 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v6 = self->_observers;
    self->_observers = v5;

    observers = self->_observers;
  }
  [(NSMutableSet *)observers addObject:v7];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_observers removeObject:v5];

  if (![(NSMutableSet *)self->_observers count])
  {
    observers = self->_observers;
    self->_observers = 0;
  }
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)efficacyForBundleID:(id)a3
{
  if ([(BKSTerminationAssertionObserverManager *)self hasTerminationAssertionForBundleID:a3])
  {
    return 3;
  }
  else
  {
    return 0;
  }
}

- (BOOL)hasTerminationAssertionForBundleID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_monitorIsReady)
  {
    LOBYTE(v6) = [(NSMutableSet *)self->_launchPreventedBundleIDs containsObject:v4];
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x1E4F963E8]);
    v8 = [MEMORY[0x1E4F96408] identityForEmbeddedApplicationIdentifier:v4 jobLabel:v4 auid:geteuid() platform:6];
    objc_super v9 = (void *)[v7 initWithIdentity:v8];

    v10 = [MEMORY[0x1E4F96340] sharedInstance];
    v11 = [v10 preventLaunchPredicatesWithError:0];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v12 = v11;
    uint64_t v6 = [v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v13 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v12);
          }
          if (objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "matchesProcess:", v9, (void)v16))
          {
            LOBYTE(v6) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v6 = [v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)_createMonitor
{
  self->_monitorIsReady = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__BKSTerminationAssertionObserverManager__createMonitor__block_invoke;
  v5[3] = &unk_1E60C6648;
  v5[4] = self;
  v3 = [MEMORY[0x1E4F96418] monitorWithConfiguration:v5];
  monitor = self->_monitor;
  self->_monitor = v3;
}

void __56__BKSTerminationAssertionObserverManager__createMonitor__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setEvents:2];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__BKSTerminationAssertionObserverManager__createMonitor__block_invoke_2;
  v4[3] = &unk_1E60C6620;
  v4[4] = *(void *)(a1 + 32);
  [v3 setPreventLaunchUpdateHandle:v4];
}

void __56__BKSTerminationAssertionObserverManager__createMonitor__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
  uint64_t v55 = a1;
  v54 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) copy];
  id v5 = [MEMORY[0x1E4F1CA80] set];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v72 objects:v78 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v73 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        id v12 = [v11 bundleIdentifier];

        if (v12)
        {
          uint64_t v13 = [v11 bundleIdentifier];
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v72 objects:v78 count:16];
    }
    while (v8);
  }
  v48 = v6;

  v14 = (void *)[v5 mutableCopy];
  [v14 minusSet:*(void *)(*(void *)(v55 + 32) + 48)];
  v50 = (void *)[*(id *)(*(void *)(v55 + 32) + 48) mutableCopy];
  [v50 minusSet:v5];
  v49 = v5;
  objc_storeStrong((id *)(*(void *)(v55 + 32) + 48), v5);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(v55 + 32) + 32));
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  obuint64_t j = v14;
  uint64_t v15 = [obj countByEnumeratingWithState:&v68 objects:v77 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v69;
    uint64_t v52 = *MEMORY[0x1E4F28588];
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v69 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v68 + 1) + 8 * j);
        v20 = (void *)MEMORY[0x1E4F963E8];
        uint64_t v21 = objc_msgSend(MEMORY[0x1E4F96430], "predicateMatchingBundleIdentifier:", v19, v48, v49);
        id v67 = 0;
        v22 = [v20 handleForPredicate:v21 error:&v67];
        id v23 = v67;

        if (v22)
        {
          v24 = [v22 currentState];
          char v25 = [v24 isRunning];

          if ((v25 & 1) == 0) {
            goto LABEL_23;
          }
        }
        else
        {
          v26 = [v23 userInfo];
          v27 = [v26 objectForKeyedSubscript:v52];
          if (v27 == @"Specified predicate matched multiple processes") {
            goto LABEL_24;
          }
          v28 = v27;
          if (!v27)
          {

LABEL_23:
            v30 = *(NSObject **)(*(void *)(v55 + 32) + 40);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __56__BKSTerminationAssertionObserverManager__createMonitor__block_invoke_3;
            block[3] = &unk_1E60C65F8;
            id v65 = v54;
            uint64_t v66 = v19;
            dispatch_async(v30, block);
            v26 = v65;
LABEL_24:

            goto LABEL_25;
          }
          char v29 = [(__CFString *)v27 isEqual:@"Specified predicate matched multiple processes"];

          if ((v29 & 1) == 0) {
            goto LABEL_23;
          }
        }
LABEL_25:
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v68 objects:v77 count:16];
    }
    while (v16);
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v31 = v50;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v60 objects:v76 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v61;
    uint64_t v51 = *MEMORY[0x1E4F28588];
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v61 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v36 = *(void *)(*((void *)&v60 + 1) + 8 * k);
        v37 = (void *)MEMORY[0x1E4F963E8];
        v38 = objc_msgSend(MEMORY[0x1E4F96430], "predicateMatchingBundleIdentifier:", v36, v48);
        id v59 = 0;
        v39 = [v37 handleForPredicate:v38 error:&v59];
        id v40 = v59;

        if (v39)
        {
          v41 = [v39 currentState];
          char v42 = [v41 isRunning];

          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
        }
        else
        {
          v43 = [v40 userInfo];
          v44 = [v43 objectForKeyedSubscript:v51];
          if (v44 == @"Specified predicate matched multiple processes") {
            goto LABEL_41;
          }
          v45 = v44;
          if (!v44)
          {

LABEL_40:
            v47 = *(NSObject **)(*(void *)(v55 + 32) + 40);
            v56[0] = MEMORY[0x1E4F143A8];
            v56[1] = 3221225472;
            v56[2] = __56__BKSTerminationAssertionObserverManager__createMonitor__block_invoke_4;
            v56[3] = &unk_1E60C65F8;
            id v57 = v54;
            uint64_t v58 = v36;
            dispatch_async(v47, v56);
            v43 = v57;
LABEL_41:

            goto LABEL_42;
          }
          char v46 = [(__CFString *)v44 isEqual:@"Specified predicate matched multiple processes"];

          if ((v46 & 1) == 0) {
            goto LABEL_40;
          }
        }
LABEL_42:
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v60 objects:v76 count:16];
    }
    while (v33);
  }
}

void __56__BKSTerminationAssertionObserverManager__createMonitor__block_invoke_3(uint64_t a1)
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
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "noteTerminationAssertionEfficacyChangedTo:forBundleIdentifier:", 3, *(void *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void __56__BKSTerminationAssertionObserverManager__createMonitor__block_invoke_4(uint64_t a1)
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
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "noteTerminationAssertionEfficacyChangedTo:forBundleIdentifier:", 0, *(void *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)dealloc
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchPreventedBundleIDs, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end