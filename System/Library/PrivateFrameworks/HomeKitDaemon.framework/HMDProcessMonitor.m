@interface HMDProcessMonitor
+ (BOOL)shouldUpgradeFromBackgroundToForegroundForProcessInfo:(id)a3 processState:(id)a4;
+ (id)foregroundAssertionReasonForProcessState:(id)a3;
+ (id)logCategory;
+ (unint64_t)applicationStateForProcessInfo:(id)a3 rbsProcessState:(id)a4;
+ (unint64_t)applicationStateFromRBSProcessState:(id)a3;
- (HMDProcessMonitor)initWithQueue:(id)a3;
- (HMFTimer)spiClientTerminationDelayTimer;
- (NSArray)foregroundProcesses;
- (NSArray)processes;
- (NSMutableSet)pendingTerminatedApplications;
- (OS_dispatch_queue)queue;
- (id)processInfoForPID:(int)a3;
- (id)processInfoForXPCConnection:(id)a3;
- (os_unfair_lock)_processInfoForPID:(os_unfair_lock *)a1;
- (void)_processAppStateChange:(id)a3;
- (void)_removeProcess:(id)a3;
- (void)dealloc;
- (void)removeFromPendingTerminated:(id)a3;
- (void)removeProcess:(id)a3;
- (void)setSpiClientTerminationDelayTimer:(id)a3;
- (void)timerDidFire:(id)a3;
- (void)updateApplicationMonitor;
- (void)updateProcessInfo:(id)a3 withProcessState:(id)a4;
- (void)updateProcessInfoForRBSProcessHandle:(id)a3 usingUpdate:(id)a4;
@end

@implementation HMDProcessMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingTerminatedApplications, 0);
  objc_storeStrong((id *)&self->_spiClientTerminationDelayTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_processes, 0);
  objc_storeStrong((id *)&self->_internal, 0);
}

- (NSMutableSet)pendingTerminatedApplications
{
  return self->_pendingTerminatedApplications;
}

- (void)setSpiClientTerminationDelayTimer:(id)a3
{
}

- (HMFTimer)spiClientTerminationDelayTimer
{
  return self->_spiClientTerminationDelayTimer;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDProcessMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDProcessMonitor *)self spiClientTerminationDelayTimer];

  v7 = (void *)MEMORY[0x230FBD990]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6 == v4)
  {
    if (v10)
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v26 = v12;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Processing pending terminated applications after timer expired", buf, 0xCu);
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v13 = [(HMDProcessMonitor *)v8 pendingTerminatedApplications];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          [(HMDProcessMonitor *)v8 _processAppStateChange:*(void *)(*((void *)&v20 + 1) + 8 * v17++)];
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v15);
    }

    v18 = [(HMDProcessMonitor *)v8 pendingTerminatedApplications];
    [v18 removeAllObjects];

    v19 = [(HMDProcessMonitor *)v8 spiClientTerminationDelayTimer];
    [v19 suspend];

    [(HMDProcessMonitor *)v8 setSpiClientTerminationDelayTimer:0];
  }
  else
  {
    if (v10)
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v26 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Received an unknown watchdog timer expiry", buf, 0xCu);
    }
  }
}

- (void)updateProcessInfoForRBSProcessHandle:(id)a3 usingUpdate:(id)a4
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  BOOL v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = HMFGetLogIdentifier();
    int v49 = 138543618;
    v50 = v11;
    __int16 v51 = 2112;
    id v52 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Received app state change: %@", (uint8_t *)&v49, 0x16u);
  }
  v12 = -[HMDProcessMonitor processInfoForPID:](v9, "processInfoForPID:", [v6 pid]);
  if (!v12)
  {
    v25 = (void *)MEMORY[0x230FBD990]();
    v26 = v9;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = HMFGetLogIdentifier();
      int v29 = [v6 pid];
      int v49 = 138543618;
      v50 = v28;
      __int16 v51 = 2048;
      id v52 = (id)v29;
      v30 = "%{public}@Cannot look up processInfo for pid %lu";
      v31 = v27;
      os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
      uint32_t v33 = 22;
LABEL_21:
      _os_log_impl(&dword_22F52A000, v31, v32, v30, (uint8_t *)&v49, v33);
    }
LABEL_22:

    goto LABEL_32;
  }
  v13 = [v7 state];
  [(HMDProcessMonitor *)v9 updateProcessInfo:v12 withProcessState:v13];

  uint64_t v14 = (void *)MEMORY[0x230FBD990]();
  uint64_t v15 = v9;
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = HMFGetLogIdentifier();
    v18 = [v7 state];
    int v49 = 138543874;
    v50 = v17;
    __int16 v51 = 2112;
    id v52 = v12;
    __int16 v53 = 2112;
    v54 = v18;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Updating %@ with new state: %@", (uint8_t *)&v49, 0x20u);
  }
  if ([v12 state] == -1)
  {
    v25 = (void *)MEMORY[0x230FBD990]();
    v26 = v15;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = HMFGetLogIdentifier();
      int v49 = 138543362;
      v50 = v28;
      v30 = "%{public}@Unknown appState - ignoring";
      v31 = v27;
      os_log_type_t v32 = OS_LOG_TYPE_INFO;
      uint32_t v33 = 12;
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  if (([v12 isTerminated] & 1) == 0
    && ([v12 isBackgrounded] & 1) == 0
    && ![v12 isSuspended])
  {
    v41 = (void *)MEMORY[0x230FBD990]();
    v42 = v15;
    v43 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = HMFGetLogIdentifier();
      int v49 = 138543618;
      v50 = v44;
      __int16 v51 = 2112;
      id v52 = v12;
      _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@%@ back into foreground", (uint8_t *)&v49, 0x16u);
    }
    if ([v12 isEntitledForSPIAccess]) {
      [(HMDProcessMonitor *)v42 removeFromPendingTerminated:v12];
    }
    goto LABEL_31;
  }
  if (([v12 isTerminated] & 1) != 0 || !objc_msgSend(v12, "isEntitledForSPIAccess"))
  {
LABEL_31:
    [(HMDProcessMonitor *)v15 _processAppStateChange:v12];
    goto LABEL_32;
  }
  v19 = [v12 applicationInfo];
  long long v20 = [v19 bundleIdentifier];

  if ([v12 isTerminated]
    && [v20 isEqual:*MEMORY[0x263F0CEB8]])
  {
    long long v21 = (void *)MEMORY[0x230FBD990]();
    long long v22 = v15;
    long long v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = HMFGetLogIdentifier();
      int v49 = 138543362;
      v50 = v24;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Handling HomeUIService termination with no delay", (uint8_t *)&v49, 0xCu);
    }

    goto LABEL_31;
  }
  v34 = (void *)MEMORY[0x230FBD990]();
  v35 = v15;
  v36 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = HMFGetLogIdentifier();
    int v49 = 138543618;
    v50 = v37;
    __int16 v51 = 2112;
    id v52 = v20;
    _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@Delaying notification of backgrounding, termination or suspension %@", (uint8_t *)&v49, 0x16u);
  }
  v38 = [(HMDProcessMonitor *)v35 pendingTerminatedApplications];
  [v38 addObject:v12];

  v39 = [(HMDProcessMonitor *)v35 spiClientTerminationDelayTimer];

  if (v39)
  {
    v40 = [(HMDProcessMonitor *)v35 spiClientTerminationDelayTimer];
    [v40 kick];
  }
  else
  {
    v45 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:5.0];
    [(HMDProcessMonitor *)v35 setSpiClientTerminationDelayTimer:v45];

    v46 = [(HMDProcessMonitor *)v35 spiClientTerminationDelayTimer];
    [v46 setDelegate:v35];

    v47 = [(HMDProcessMonitor *)v35 queue];
    v48 = [(HMDProcessMonitor *)v35 spiClientTerminationDelayTimer];
    [v48 setDelegateQueue:v47];

    v40 = [(HMDProcessMonitor *)v35 spiClientTerminationDelayTimer];
    [v40 resume];
  }

LABEL_32:
}

- (void)updateProcessInfo:(id)a3 withProcessState:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(id)objc_opt_class() applicationStateForProcessInfo:v6 rbsProcessState:v7];
  if ([v6 state] != v8)
  {
    v9 = (void *)MEMORY[0x230FBD990]();
    BOOL v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      if (v8 > 4) {
        v13 = @"unknown";
      }
      else {
        v13 = off_264A26338[v8];
      }
      uint64_t v14 = v13;
      *(_DWORD *)buf = 138543874;
      long long v21 = v12;
      __int16 v22 = 2114;
      long long v23 = v14;
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating application state to %{public}@ for process: %@", buf, 0x20u);
    }
    [v6 _updateState:v8];
    uint64_t v15 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v16 = HMDProcessMonitorProcessStateDidChangeNotification;
    v18 = @"processInfo";
    id v19 = v6;
    uint64_t v17 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    [v15 postNotificationName:v16 object:v10 userInfo:v17];
  }
}

- (void)_processAppStateChange:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    BOOL v10 = v8;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Processing change of state for %@", (uint8_t *)&v9, 0x16u);
  }
  if ([v4 isTerminated]) {
    [(HMDProcessMonitor *)v6 removeProcess:v4];
  }
}

- (void)removeFromPendingTerminated:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 applicationInfo];
  id v6 = [v5 bundleIdentifier];

  id v7 = self;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  unint64_t v8 = [(HMDProcessMonitor *)self pendingTerminatedApplications];
  int v9 = (void *)[v8 copy];

  uint64_t v29 = [v9 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v29)
  {
    uint64_t v11 = *(void *)v31;
    *(void *)&long long v10 = 138543618;
    long long v27 = v10;
    v28 = v7;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "applicationInfo", v27);
        uint64_t v15 = [v14 bundleIdentifier];
        int v16 = [v15 isEqual:v6];

        if (v16)
        {
          uint64_t v17 = (void *)MEMORY[0x230FBD990]();
          v18 = v7;
          id v19 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v21 = id v20 = v4;
            *(_DWORD *)buf = v27;
            v35 = v21;
            __int16 v36 = 2112;
            v37 = v6;
            _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Dropping termination notification for %@", buf, 0x16u);

            id v4 = v20;
            id v7 = v28;
          }

          __int16 v22 = [(HMDProcessMonitor *)v18 pendingTerminatedApplications];
          [v22 removeObject:v13];

          LODWORD(v22) = [v13 identifier];
          if (v22 != [v4 identifier]) {
            [(HMDProcessMonitor *)v18 _removeProcess:v13];
          }
        }
      }
      uint64_t v29 = [v9 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v29);
  }

  [(HMDProcessMonitor *)v7 pendingTerminatedApplications];
  v24 = long long v23 = v7;
  uint64_t v25 = [v24 count];

  if (!v25)
  {
    uint64_t v26 = [(HMDProcessMonitor *)v23 spiClientTerminationDelayTimer];
    [v26 suspend];

    [(HMDProcessMonitor *)v23 setSpiClientTerminationDelayTimer:0];
  }
}

- (void)_removeProcess:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableSet *)self->_processes removeObject:v4];
  os_unfair_lock_unlock(&self->_lock);
  if (isInternalBuild())
  {
    v5 = [MEMORY[0x263F08A00] defaultCenter];
    unint64_t v8 = @"processInfo";
    v9[0] = v4;
    id v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    [v5 postNotificationName:@"HMDProcessMonitorProcessRemovedNotification" object:self userInfo:v6];
  }
  id v7 = [v4 applicationInfo];
  [v7 removeProcess:v4];
}

- (void)removeProcess:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    unint64_t v8 = HMFGetLogIdentifier();
    int v17 = 138543618;
    v18 = v8;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing process info: %@", (uint8_t *)&v17, 0x16u);
  }
  [(HMDProcessMonitor *)v6 _removeProcess:v4];
  int v9 = [v4 applicationInfo];
  long long v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 processes];
    uint64_t v12 = [v11 count];

    if (!v12)
    {
      uint64_t v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = v10;
      uint64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v16 = HMFGetLogIdentifier();
        int v17 = 138543362;
        v18 = v16;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Updating application monitor because last process info was removed from application info", (uint8_t *)&v17, 0xCu);
      }
      [(HMDProcessMonitor *)v6 updateApplicationMonitor];
    }
  }
}

- (id)processInfoForXPCConnection:(id)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  -[HMDProcessMonitor _processInfoForPID:]((os_unfair_lock *)self, [v4 processIdentifier]);
  v5 = (HMDProcessInfo *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    id v6 = [HMDProcessInfo alloc];
    if (v4)
    {
      [v4 auditToken];
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
    }
    v5 = [(HMDProcessInfo *)v6 initWithAuditToken:&v17];
    [(NSMutableSet *)self->_processes addObject:v5];
    os_unfair_lock_unlock(&self->_lock);
    id v7 = [(HMDProcessInfo *)v5 applicationInfo];
    [v7 addProcess:v5];

    if (isInternalBuild())
    {
      unint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
      long long v23 = @"processInfo";
      v24[0] = v5;
      int v9 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
      [v8 postNotificationName:@"HMDProcessMonitorProcessAddedNotification" object:self userInfo:v9];
    }
    if ([(HMDProcessInfo *)v5 shouldMonitor])
    {
      [(HMDProcessMonitor *)self updateApplicationMonitor];
      long long v10 = [(HMDProcessInfo *)v5 processHandle];
      uint64_t v11 = [v10 currentState];
      [(HMDProcessMonitor *)self updateProcessInfo:v5 withProcessState:v11];
    }
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    uint64_t v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v20 = v15;
      __int16 v21 = 2112;
      __int16 v22 = v5;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Created process info: %@", buf, 0x16u);
    }
  }

  return v5;
}

- (os_unfair_lock)_processInfoForPID:(os_unfair_lock *)a1
{
  if (a1)
  {
    id v4 = a1;
    os_unfair_lock_assert_owner(a1 + 2);
    v5 = *(void **)&v4[6]._os_unfair_lock_opaque;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __40__HMDProcessMonitor__processInfoForPID___block_invoke;
    v7[3] = &__block_descriptor_36_e24_B16__0__HMDProcessInfo_8l;
    int v8 = a2;
    objc_msgSend(v5, "na_firstObjectPassingTest:", v7);
    a1 = (os_unfair_lock *)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = vars8;
  }
  return a1;
}

BOOL __40__HMDProcessMonitor__processInfoForPID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier] == *(_DWORD *)(a1 + 32);
}

- (id)processInfoForPID:(int)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = -[HMDProcessMonitor _processInfoForPID:]((os_unfair_lock *)self, a3);
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (NSArray)foregroundProcesses
{
  uint64_t v2 = [(HMDProcessMonitor *)self processes];
  v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_160258);

  return (NSArray *)v3;
}

uint64_t __40__HMDProcessMonitor_foregroundProcesses__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isForegrounded];
}

- (NSArray)processes
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableSet *)self->_processes allObjects];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)updateApplicationMonitor
{
  v3 = [MEMORY[0x263EFF980] array];
  os_unfair_lock_lock_with_options();
  processes = self->_processes;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __45__HMDProcessMonitor_updateApplicationMonitor__block_invoke;
  v18[3] = &unk_264A227E8;
  id v5 = v3;
  id v19 = v5;
  [(NSMutableSet *)processes hmf_enumerateWithAutoreleasePoolUsingBlock:v18];

  os_unfair_lock_unlock(&self->_lock);
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__HMDProcessMonitor_updateApplicationMonitor__block_invoke_2;
  aBlock[3] = &unk_264A22838;
  id v6 = v5;
  id v15 = v6;
  objc_copyWeak(&v16, &location);
  id v7 = _Block_copy(aBlock);
  int v8 = [(HMDProcessMonitor *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__HMDProcessMonitor_updateApplicationMonitor__block_invoke_2_24;
  block[3] = &unk_264A2EE80;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __45__HMDProcessMonitor_updateApplicationMonitor__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 shouldMonitor])
  {
    v3 = [v7 processHandle];

    if (v3)
    {
      id v4 = (void *)MEMORY[0x263F645D8];
      id v5 = [v7 processHandle];
      id v6 = [v4 predicateMatchingHandle:v5];

      [*(id *)(a1 + 32) addObject:v6];
    }
  }
}

void __45__HMDProcessMonitor_updateApplicationMonitor__block_invoke_2(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  [v3 setPredicates:*(void *)(a1 + 32)];
  id v4 = objc_alloc_init(MEMORY[0x263F645E8]);
  v8[0] = *MEMORY[0x263F3F620];
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  [v4 setEndowmentNamespaces:v5];

  [v4 setValues:25];
  [v3 setStateDescriptor:v4];
  [v3 setServiceClass:25];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__HMDProcessMonitor_updateApplicationMonitor__block_invoke_3;
  v6[3] = &unk_264A22810;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  [v3 setUpdateHandler:v6];
  objc_destroyWeak(&v7);
}

void __45__HMDProcessMonitor_updateApplicationMonitor__block_invoke_2_24(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 16))
  {
    if ([*(id *)(a1 + 40) count])
    {
      uint64_t v5 = [MEMORY[0x263F645C0] monitorWithConfiguration:*(void *)(a1 + 48)];
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = *(void **)(v6 + 16);
      *(void *)(v6 + 16) = v5;

      return;
    }
    if (!*(void *)(*(void *)(a1 + 32) + 16))
    {
      id v3 = 0;
      goto LABEL_3;
    }
  }
  uint64_t v2 = [*(id *)(a1 + 40) count];
  id v3 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v2)
  {
LABEL_3:
    uint64_t v4 = *(void *)(a1 + 48);
    [v3 updateConfiguration:v4];
    return;
  }
  [v3 invalidate];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 16);
  *(void *)(v8 + 16) = 0;
}

void __45__HMDProcessMonitor_updateApplicationMonitor__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v11 = WeakRetained;
  if (WeakRetained)
  {
    id v12 = [WeakRetained queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__HMDProcessMonitor_updateApplicationMonitor__block_invoke_20;
    block[3] = &unk_264A2F2F8;
    block[4] = v11;
    id v17 = v8;
    id v18 = v9;
    dispatch_async(v12, block);
  }
  else
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v20 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Lost self for RBSProcessMonitorUpdateInfo", buf, 0xCu);
    }
  }
}

uint64_t __45__HMDProcessMonitor_updateApplicationMonitor__block_invoke_20(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateProcessInfoForRBSProcessHandle:*(void *)(a1 + 40) usingUpdate:*(void *)(a1 + 48)];
}

- (void)dealloc
{
  [(RBSProcessMonitor *)self->_internal invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HMDProcessMonitor;
  [(HMDProcessMonitor *)&v3 dealloc];
}

- (HMDProcessMonitor)initWithQueue:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDProcessMonitor;
  uint64_t v6 = [(HMDProcessMonitor *)&v13 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    uint64_t v8 = [MEMORY[0x263EFF9C0] set];
    processes = v7->_processes;
    v7->_processes = (NSMutableSet *)v8;

    uint64_t v10 = [MEMORY[0x263EFF9C0] set];
    pendingTerminatedApplications = v7->_pendingTerminatedApplications;
    v7->_pendingTerminatedApplications = (NSMutableSet *)v10;
  }
  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t21_160284 != -1) {
    dispatch_once(&logCategory__hmf_once_t21_160284, &__block_literal_global_46_160285);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v22_160286;
  return v2;
}

void __32__HMDProcessMonitor_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v22_160286;
  logCategory__hmf_once_v22_160286 = v0;
}

+ (unint64_t)applicationStateForProcessInfo:(id)a3 rbsProcessState:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 shouldMonitor])
  {
    uint64_t v8 = [a1 applicationStateFromRBSProcessState:v7];
    unint64_t v9 = v8;
    if (v8 != 4)
    {
      if (v8 == 1)
      {
        uint64_t v10 = [a1 foregroundAssertionReasonForProcessState:v7];
        if (v10)
        {
          uint64_t v11 = (void *)MEMORY[0x230FBD990]();
          id v12 = a1;
          objc_super v13 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            id v14 = HMFGetLogIdentifier();
            int v20 = 138543874;
            uint64_t v21 = v14;
            __int16 v22 = 2112;
            id v23 = v6;
            __int16 v24 = 2112;
            uint64_t v25 = v10;
            _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Upgrading app state to foreground for process %@: %@", (uint8_t *)&v20, 0x20u);
          }
          unint64_t v9 = 0;
        }
        else
        {
          unint64_t v9 = 1;
        }
      }
      if ([v6 isEntitledForSPIAccess])
      {
        if (v9 == 1
          && [a1 shouldUpgradeFromBackgroundToForegroundForProcessInfo:v6 processState:v7])
        {
          id v15 = (void *)MEMORY[0x230FBD990]();
          id v16 = a1;
          id v17 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            id v18 = HMFGetLogIdentifier();
            int v20 = 138543618;
            uint64_t v21 = v18;
            __int16 v22 = 2112;
            id v23 = v6;
            _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Upgrading app state to foreground as the client has SPI access and is background running: %@", (uint8_t *)&v20, 0x16u);
          }
          unint64_t v9 = 2;
        }
        else if (v9 == -1)
        {
          unint64_t v9 = 0;
        }
      }
    }
  }
  else
  {
    unint64_t v9 = -1;
  }

  return v9;
}

+ (BOOL)shouldUpgradeFromBackgroundToForegroundForProcessInfo:(id)a3 processState:(id)a4
{
  id v5 = a3;
  id v6 = [a4 assertions];
  char v7 = objc_msgSend(v6, "na_any:", &__block_literal_global_43_160293);

  if (v7)
  {
    char v8 = 0;
  }
  else
  {
    unint64_t v9 = [v5 applicationIdentifier];
    char v10 = [v9 isEqualToString:*MEMORY[0x263F0D238]];

    char v8 = v10 ^ 1;
  }

  return v8;
}

uint64_t __88__HMDProcessMonitor_shouldUpgradeFromBackgroundToForegroundForProcessInfo_processState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 domain];
  uint64_t v3 = [v2 isEqualToString:@"com.apple.dasd:DYLDLaunch"];

  return v3;
}

+ (unint64_t)applicationStateFromRBSProcessState:(id)a3
{
  id v3 = a3;
  unint64_t v4 = 4;
  switch([v3 taskState])
  {
    case 1u:
      break;
    case 2u:
    case 4u:
      id v5 = [v3 endowmentNamespaces];
      int v6 = [v5 containsObject:*MEMORY[0x263F3F620]];

      unint64_t v4 = v6 ^ 1u;
      break;
    case 3u:
      unint64_t v4 = 3;
      break;
    default:
      unint64_t v4 = -1;
      break;
  }

  return v4;
}

+ (id)foregroundAssertionReasonForProcessState:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v3 = [a3 assertions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        int v9 = [v8 type];
        if (v9 == 3)
        {
          uint64_t v12 = [v8 reason];
          if (v12 == 7 || v12 == 10008 || v12 == 9)
          {
            id v15 = NSString;
            id v18 = [v8 name];
            id v19 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "reason"));
            id v16 = [v8 explanation];
            int v20 = [v15 stringWithFormat:@"%@(%@):%@", v18, v19, v16];

            goto LABEL_21;
          }
        }
        else if (v9 == 2)
        {
          char v10 = [v8 domain];
          int v11 = [v10 isEqualToString:@"com.apple.siri:IntentStartupGrant"];

          if (v11)
          {
            id v17 = NSString;
            id v18 = [v8 domain];
            id v19 = [v8 explanation];
            int v20 = [v17 stringWithFormat:@"%@:%@", v18, v19];
LABEL_21:

            goto LABEL_22;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  int v20 = 0;
LABEL_22:

  return v20;
}

@end