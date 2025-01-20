@interface BKSApplicationStateMonitor
- (BKSApplicationStateMonitor)init;
- (BKSApplicationStateMonitor)initWithBundleIDs:(id)a3 states:(unsigned int)a4;
- (BKSApplicationStateMonitor)initWithBundleIDs:(id)a3 states:(unsigned int)a4 elevatedPriority:(BOOL)a5;
- (BKSApplicationStateMonitor)initWithEndpoint:(id)a3 bundleIDs:(id)a4 states:(unsigned int)a5 elevatedPriority:(BOOL)a6;
- (BOOL)_clientSubscribedToThisReasonChange:(id)a3;
- (BOOL)_clientSubscribedToThisStateChange:(id)a3 state:(id)a4 prevState:(id)a5;
- (BOOL)elevatedPriority;
- (NSArray)interestedBundleIDs;
- (id)_legacyInfoForProcess:(id)a3;
- (id)_legacyInfoForProcess:(id)a3 state:(id)a4;
- (id)applicationInfoForApplication:(id)a3;
- (id)applicationInfoForPID:(int)a3;
- (id)bundleInfoValueForKey:(id)a3 PID:(int)a4;
- (id)handler;
- (unsigned)_legacyStateForProcess:(id)a3 state:(id)a4;
- (unsigned)applicationStateForApplication:(id)a3;
- (unsigned)interestedStates;
- (unsigned)mostElevatedApplicationStateForPID:(int)a3;
- (void)applicationInfoForApplication:(id)a3 completion:(id)a4;
- (void)applicationInfoForPID:(int)a3 completion:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)lock_updateConfiguration;
- (void)setHandler:(id)a3;
- (void)updateInterestedAssertionReasons:(id)a3;
- (void)updateInterestedBundleIDs:(id)a3;
- (void)updateInterestedBundleIDs:(id)a3 states:(unsigned int)a4;
- (void)updateInterestedStates:(unsigned int)a3;
@end

@implementation BKSApplicationStateMonitor

- (NSArray)interestedBundleIDs
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_interestedBundleIDs;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)applicationInfoForPID:(int)a3 completion:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"BKSApplicationStateMonitor.m", 188, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  v8 = (void *)MEMORY[0x1E4F964A0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__BKSApplicationStateMonitor_applicationInfoForPID_completion___block_invoke;
  v11[3] = &unk_1E60C6740;
  int v13 = a3;
  v11[4] = self;
  id v12 = v7;
  id v9 = v7;
  [v8 performBackgroundWork:v11];
}

void __54__BKSApplicationStateMonitor_lock_updateConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setPredicates:*(void *)(a1 + 32)];
  v4 = RBSProcessLegacyStateDescriptor();
  [v3 setStateDescriptor:v4];

  [v3 setServiceClass:*(unsigned int *)(a1 + 56)];
  if (*(void *)(a1 + 48))
  {
    objc_initWeak(&location, *(id *)(a1 + 40));
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __54__BKSApplicationStateMonitor_lock_updateConfiguration__block_invoke_2;
    v5[3] = &unk_1E60C6768;
    objc_copyWeak(&v7, &location);
    id v6 = *(id *)(a1 + 48);
    [v3 setUpdateHandler:v5];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    [v3 setUpdateHandler:0];
  }
}

- (void)setHandler:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = (void *)[v5 copy];

  id handler = self->_handler;
  self->_id handler = v6;

  [(BKSApplicationStateMonitor *)self lock_updateConfiguration];
  os_unfair_lock_unlock(p_lock);
}

- (void)updateInterestedBundleIDs:(id)a3
{
  id v4 = a3;
  [(BKSApplicationStateMonitor *)self updateInterestedBundleIDs:v4 states:[(BKSApplicationStateMonitor *)self interestedStates]];
}

- (void)updateInterestedBundleIDs:(id)a3 states:(unsigned int)a4
{
  id v10 = a3;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"BKSApplicationStateMonitor.m" lineNumber:159 description:@"bundleIDs must be an array"];
    }
  }
  os_unfair_lock_lock(&self->_lock);
  id v7 = (NSArray *)[v10 copy];
  interestedBundleIDs = self->_interestedBundleIDs;
  self->_interestedBundleIDs = v7;

  self->_interestedStates = a4;
  [(BKSApplicationStateMonitor *)self lock_updateConfiguration];
  os_unfair_lock_unlock(&self->_lock);
}

- (unsigned)interestedStates
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LODWORD(v2) = v2->_interestedStates;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (void)dealloc
{
  [(RBSProcessMonitor *)self->_monitor invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BKSApplicationStateMonitor;
  [(BKSApplicationStateMonitor *)&v3 dealloc];
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id handler = self->_handler;
  self->_id handler = 0;

  [(RBSProcessMonitor *)self->_monitor invalidate];
  monitor = self->_monitor;
  self->_monitor = 0;

  os_unfair_lock_unlock(p_lock);
}

- (unsigned)applicationStateForApplication:(id)a3
{
  objc_super v3 = [(BKSApplicationStateMonitor *)self applicationInfoForApplication:a3];
  id v4 = [v3 objectForKey:@"SBApplicationStateKey"];
  unsigned int v5 = [v4 unsignedIntValue];

  return v5;
}

- (unsigned)mostElevatedApplicationStateForPID:(int)a3
{
  objc_super v3 = [(BKSApplicationStateMonitor *)self applicationInfoForPID:*(void *)&a3];
  id v4 = [v3 objectForKey:@"SBMostElevatedStateForProcessID"];
  unsigned int v5 = [v4 unsignedIntValue];

  return v5;
}

void __63__BKSApplicationStateMonitor_applicationInfoForPID_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) applicationInfoForPID:*(unsigned int *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)applicationInfoForPID:(int)a3
{
  if (a3 < 1)
  {
    v8 = 0;
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F963D0];
    unsigned int v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:");
    id v6 = [v4 legacyPredicateMatchingProcessIdentifier:v5];

    id v7 = [MEMORY[0x1E4F963E8] handleForPredicate:v6 error:0];
    v8 = [(BKSApplicationStateMonitor *)self _legacyInfoForProcess:v7];
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_interestedBundleIDs, 0);
  objc_storeStrong((id *)&self->_interestedAssertionReasons, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

void __71__BKSApplicationStateMonitor_applicationInfoForApplication_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) applicationInfoForApplication:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)applicationInfoForApplication:(id)a3
{
  if (a3)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F963D0], "legacyPredicateMatchingBundleIdentifier:");
    unsigned int v5 = [MEMORY[0x1E4F963E8] handleForPredicate:v4 error:0];
    id v6 = [(BKSApplicationStateMonitor *)self _legacyInfoForProcess:v5];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (BKSApplicationStateMonitor)initWithEndpoint:(id)a3 bundleIDs:(id)a4 states:(unsigned int)a5 elevatedPriority:(BOOL)a6
{
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BKSApplicationStateMonitor;
  v11 = [(BKSApplicationStateMonitor *)&v18 init];
  if (v11)
  {
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v17 = [MEMORY[0x1E4F28B00] currentHandler];
        [v17 handleFailureInMethod:a2 object:v11 file:@"BKSApplicationStateMonitor.m" lineNumber:94 description:@"bundleIDs must be an array"];
      }
    }
    v11->_lock._os_unfair_lock_opaque = 0;
    id v12 = (RBSProcessMonitor *)objc_alloc_init(MEMORY[0x1E4F96418]);
    monitor = v11->_monitor;
    v11->_monitor = v12;

    v11->_elevatedPriority = a6;
    uint64_t v14 = [v10 copy];
    interestedBundleIDs = v11->_interestedBundleIDs;
    v11->_interestedBundleIDs = (NSArray *)v14;

    v11->_interestedStates = a5;
  }

  return v11;
}

- (id)_legacyInfoForProcess:(id)a3
{
  id v4 = a3;
  unsigned int v5 = RBSProcessLegacyStateDescriptor();
  id v6 = [v4 currentStateMatchingDescriptor:v5];

  id v7 = [(BKSApplicationStateMonitor *)self _legacyInfoForProcess:v4 state:v6];

  return v7;
}

void __54__BKSApplicationStateMonitor_lock_updateConfiguration__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = [v7 state];
  id v10 = [v7 previousState];

  v11 = [WeakRetained _legacyInfoForProcess:v6 state:v9];
  if (v11)
  {
    if (![v10 isRunning] || (objc_msgSend(v9, "isRunning") & 1) != 0) {
      goto LABEL_18;
    }
    id v12 = [v6 lastExitContext];
    int v13 = [v12 status];
    uint64_t v14 = [v13 code];

    if (v14 > 3221229822)
    {
      if (v14 != 4227595259)
      {
        if (v14 == 3735943697)
        {
          uint64_t v17 = 1;
          goto LABEL_16;
        }
        uint64_t v15 = 3221229823;
        goto LABEL_14;
      }
    }
    else if (v14 != 732775916 && v14 != 1307235759)
    {
      uint64_t v15 = 2343432205;
LABEL_14:
      if (v14 != v15)
      {
LABEL_17:

LABEL_18:
        v19 = [v11 objectForKey:@"SBApplicationStateRunningReasonsKey"];
        if (([WeakRetained _clientSubscribedToThisStateChange:v6 state:v9 prevState:v10] & 1) != 0
          || [WeakRetained _clientSubscribedToThisReasonChange:v19])
        {
          (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        }

        goto LABEL_22;
      }
    }
    uint64_t v17 = 5;
LABEL_16:
    objc_super v18 = [MEMORY[0x1E4F28ED0] numberWithInteger:v17];
    [v11 setObject:v18 forKey:@"BKSApplicationStateExitReasonKey"];

    goto LABEL_17;
  }
  v16 = rbs_shim_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v20 = 138543362;
    id v21 = v6;
    _os_log_impl(&dword_1B50B5000, v16, OS_LOG_TYPE_INFO, "Ignoring update for process: %{public}@", (uint8_t *)&v20, 0xCu);
  }

LABEL_22:
}

- (BOOL)_clientSubscribedToThisStateChange:(id)a3 state:(id)a4 prevState:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = [(BKSApplicationStateMonitor *)self _legacyStateForProcess:v8 state:v9];
  unsigned int interestedStates = self->_interestedStates;
  if (v10)
  {
    unsigned int v13 = [(BKSApplicationStateMonitor *)self _legacyStateForProcess:v8 state:v10];
    unsigned int v14 = self->_interestedStates & v13;
    if (v11 == v13)
    {
      uint64_t v15 = [v9 process];
      int v16 = [v15 pid];
      uint64_t v17 = [v10 process];
      BOOL v18 = v16 != [v17 pid];

      goto LABEL_6;
    }
  }
  else
  {
    unsigned int v14 = self->_interestedStates & 1;
  }
  BOOL v18 = 1;
LABEL_6:
  if (interestedStates & v11 | v14) {
    BOOL v19 = v18;
  }
  else {
    BOOL v19 = 0;
  }

  return v19;
}

- (id)_legacyInfoForProcess:(id)a3 state:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identity];
  id v9 = [v8 embeddedApplicationIdentifier];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v12 = [v8 xpcServiceIdentifier];
    unsigned int v13 = v12;
    if (v12)
    {
      id v11 = v12;
    }
    else
    {
      unsigned int v14 = [v6 bundle];
      id v11 = [v14 identifier];
    }
  }

  if (v6 && v11)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
    unsigned int v46 = [v8 isXPCService];
    if (v46)
    {
      int v16 = [v8 hostIdentifier];
      uint64_t v17 = objc_msgSend(v16, "rbs_pid");
    }
    else
    {
      uint64_t v17 = 0;
    }
    uint64_t v19 = [(BKSApplicationStateMonitor *)self _legacyStateForProcess:v6 state:v7];
    BOOL v18 = [v7 assertions];
    if ([v18 count])
    {
      unsigned int v40 = v19;
      unsigned int v41 = v17;
      v42 = v15;
      v43 = v8;
      id v44 = v7;
      id v45 = v6;
      int v20 = [MEMORY[0x1E4F1CA48] array];
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v21 = v18;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v47 objects:v54 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v48 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            v27 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v26, "reason"));
            uint64_t v28 = [v26 explanation];
            v29 = (void *)v28;
            if (v27) {
              BOOL v30 = v28 == 0;
            }
            else {
              BOOL v30 = 1;
            }
            if (!v30)
            {
              v52[0] = @"SBApplicationStateRunningReasonAssertionReasonKey";
              v52[1] = @"SBApplicationStateRunningReasonAssertionIdentifierKey";
              v53[0] = v27;
              v53[1] = v28;
              v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:2];
              [v20 addObject:v31];
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v47 objects:v54 count:16];
        }
        while (v23);
      }

      uint64_t v15 = v42;
      if ([v20 count]) {
        [v42 setObject:v20 forKey:@"SBApplicationStateRunningReasonsKey"];
      }

      id v7 = v44;
      id v6 = v45;
      id v8 = v43;
      uint64_t v19 = v40;
      uint64_t v17 = v41;
    }
    v32 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v19];
    [v15 setObject:v32 forKey:@"SBApplicationStateKey"];

    v33 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v19];
    [v15 setObject:v33 forKey:@"SBMostElevatedStateForProcessID"];

    v34 = [MEMORY[0x1E4F28ED0] numberWithBool:v19 == 8];
    [v15 setObject:v34 forKey:@"BKSApplicationStateAppIsFrontmost"];

    [v15 setObject:v11 forKey:@"SBApplicationStateDisplayIDKey"];
    int v35 = [v6 pid];
    v36 = [MEMORY[0x1E4F28ED0] numberWithInt:v35 & ~(v35 >> 31)];
    [v15 setObject:v36 forKey:@"SBApplicationStateProcessIDKey"];

    v37 = [MEMORY[0x1E4F28ED0] numberWithBool:v46];
    [v15 setObject:v37 forKey:@"BKSApplicationStateExtensionKey"];

    if ((int)v17 >= 1)
    {
      v38 = [MEMORY[0x1E4F28ED0] numberWithInt:v17];
      [v15 setObject:v38 forKey:@"BKSApplicationStateHostPIDKey"];
    }
  }
  else
  {
    BOOL v18 = rbs_shim_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B50B5000, v18, OS_LOG_TYPE_INFO, "BKSApplicationStateMonitor resolved state as not running with no bundleID", buf, 2u);
    }
    uint64_t v15 = 0;
  }

  return v15;
}

- (unsigned)_legacyStateForProcess:(id)a3 state:(id)a4
{
  id v4 = a4;
  switch([v4 taskState])
  {
    case 1u:
      unsigned int v7 = 1;
      break;
    case 2u:
    case 4u:
      unsigned int v5 = [v4 endowmentNamespaces];
      int v6 = [v5 containsObject:*MEMORY[0x1E4F964E0]];

      if (v6) {
        unsigned int v7 = 8;
      }
      else {
        unsigned int v7 = 4;
      }
      break;
    case 3u:
      unsigned int v7 = 2;
      break;
    default:
      unsigned int v7 = 0;
      break;
  }

  return v7;
}

- (id)bundleInfoValueForKey:(id)a3 PID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  int v6 = (void *)MEMORY[0x1E4F963E8];
  unsigned int v7 = [MEMORY[0x1E4F28ED0] numberWithInt:v4];
  id v8 = [v6 handleForIdentifier:v7 error:0];

  LODWORD(v7) = [v5 isEqualToString:*MEMORY[0x1E4F1CFF8]];
  id v9 = [v8 bundle];
  id v10 = v9;
  if (v7) {
    [v9 identifier];
  }
  else {
  id v11 = [v9 bundleInfoValueForKey:v5];
  }

  return v11;
}

- (BOOL)_clientSubscribedToThisReasonChange:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_interestedAssertionReasons)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "objectForKey:", @"SBApplicationStateRunningReasonAssertionReasonKey", (void)v15);
          BOOL v12 = [(NSArray *)self->_interestedAssertionReasons containsObject:v11];

          if (v12)
          {
            BOOL v13 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    BOOL v13 = 0;
LABEL_12:
  }
  else
  {
    BOOL v13 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v13;
}

- (void)applicationInfoForApplication:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    BOOL v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BKSApplicationStateMonitor.m", 179, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  uint64_t v9 = (void *)MEMORY[0x1E4F964A0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__BKSApplicationStateMonitor_applicationInfoForApplication_completion___block_invoke;
  v13[3] = &unk_1E60C6718;
  v13[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  [v9 performBackgroundWork:v13];
}

- (void)lock_updateConfiguration
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  interestedBundleIDs = self->_interestedBundleIDs;
  if (interestedBundleIDs)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v5 = interestedBundleIDs;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [MEMORY[0x1E4F963D0] legacyPredicateMatchingBundleIdentifier:*(void *)(*((void *)&v21 + 1) + 8 * i)];
          [v3 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v5 = [MEMORY[0x1E4F963D0] legacyPredicate];
    [v3 addObject:v5];
  }

  if (self->_elevatedPriority) {
    int v11 = 25;
  }
  else {
    int v11 = 17;
  }
  BOOL v12 = (void *)MEMORY[0x1BA997230](self->_handler);
  monitor = self->_monitor;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __54__BKSApplicationStateMonitor_lock_updateConfiguration__block_invoke;
  v16[3] = &unk_1E60C6790;
  int v20 = v11;
  long long v18 = self;
  id v19 = v12;
  id v17 = v3;
  id v14 = v12;
  id v15 = v3;
  [(RBSProcessMonitor *)monitor updateConfiguration:v16];
}

- (BKSApplicationStateMonitor)init
{
  return [(BKSApplicationStateMonitor *)self initWithBundleIDs:0 states:0xFFFFFFFFLL elevatedPriority:0];
}

- (BKSApplicationStateMonitor)initWithBundleIDs:(id)a3 states:(unsigned int)a4 elevatedPriority:(BOOL)a5
{
  return [(BKSApplicationStateMonitor *)self initWithEndpoint:0 bundleIDs:a3 states:*(void *)&a4 elevatedPriority:a5];
}

- (BKSApplicationStateMonitor)initWithBundleIDs:(id)a3 states:(unsigned int)a4
{
  return [(BKSApplicationStateMonitor *)self initWithBundleIDs:a3 states:*(void *)&a4 elevatedPriority:0];
}

- (id)handler
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)MEMORY[0x1BA997230](self->_handler);
  os_unfair_lock_unlock(p_lock);
  id v5 = (void *)MEMORY[0x1BA997230](v4);

  return v5;
}

- (BOOL)elevatedPriority
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_elevatedPriority;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)updateInterestedStates:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(BKSApplicationStateMonitor *)self interestedBundleIDs];
  [(BKSApplicationStateMonitor *)self updateInterestedBundleIDs:v5 states:v3];
}

- (void)updateInterestedAssertionReasons:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = (NSArray *)[v5 copy];

  interestedAssertionReasons = self->_interestedAssertionReasons;
  self->_interestedAssertionReasons = v6;

  [(BKSApplicationStateMonitor *)self lock_updateConfiguration];
  os_unfair_lock_unlock(p_lock);
}

@end