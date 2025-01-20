@interface HMDSyncOperationQueue
+ (id)logCategory;
- (BOOL)hasExponentialBackoff;
- (BOOL)isInMaximumTimeInterval;
- (BOOL)processFiredTimer:(id)a3;
- (HMDSyncOperationManager)manager;
- (HMFExponentialBackoffTimer)backoffTimer;
- (NSArray)stagedOperations;
- (NSArray)waitingOperations;
- (NSString)description;
- (NSString)name;
- (double)initialBackoff;
- (double)initialDelay;
- (id)allOperations;
- (id)initName:(id)a3 syncManager:(id)a4 initialDelay:(double)a5 initialBackoff:(double)a6 hasBackoff:(BOOL)a7;
- (id)nextOperation;
- (id)operationsToCancel;
- (int64_t)count;
- (int64_t)countTotal;
- (void)_addOperation:(id)a3;
- (void)_addStagedOperation:(id)a3;
- (void)_addWaitingOperation:(id)a3;
- (void)_createBackoffTimer;
- (void)_removeStagedOperation:(id)a3;
- (void)_removeWaitingOperation:(id)a3;
- (void)addOperation:(id)a3 withDelay:(double)a4;
- (void)dropAllOperations;
- (void)dropOperation:(id)a3;
- (void)resetBackoffTimer;
- (void)setBackoffTimer:(id)a3;
- (void)setHasExponentialBackoff:(BOOL)a3;
- (void)setInitialBackoff:(double)a3;
- (void)setInitialDelay:(double)a3;
- (void)setManager:(id)a3;
- (void)stageOperation:(id)a3;
@end

@implementation HMDSyncOperationQueue

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_backoffTimer, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_waitingOperations, 0);
  objc_storeStrong((id *)&self->_stagedOperations, 0);
}

- (void)setHasExponentialBackoff:(BOOL)a3
{
  self->_hasExponentialBackoff = a3;
}

- (BOOL)hasExponentialBackoff
{
  return self->_hasExponentialBackoff;
}

- (void)setInitialBackoff:(double)a3
{
  self->_initialBackoff = a3;
}

- (double)initialBackoff
{
  return self->_initialBackoff;
}

- (void)setInitialDelay:(double)a3
{
  self->_initialDelay = a3;
}

- (double)initialDelay
{
  return self->_initialDelay;
}

- (void)setManager:(id)a3
{
}

- (HMDSyncOperationManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  return (HMDSyncOperationManager *)WeakRetained;
}

- (void)setBackoffTimer:(id)a3
{
}

- (HMFExponentialBackoffTimer)backoffTimer
{
  return self->_backoffTimer;
}

- (NSString)name
{
  return self->_name;
}

- (id)operationsToCancel
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = [(HMDSyncOperationQueue *)self waitingOperations];
  v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v9 = [v8 delayTimer];
        [v9 suspend];

        [v8 setDelayTimer:0];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  v10 = [(HMDSyncOperationQueue *)self backoffTimer];
  [v10 suspend];

  [(HMDSyncOperationQueue *)self setBackoffTimer:0];
  v11 = [(HMDSyncOperationQueue *)self allOperations];
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_stagedOperations removeAllObjects];
  [(NSMutableArray *)self->_waitingOperations removeAllObjects];
  os_unfair_lock_unlock(&self->_lock);
  return v11;
}

- (id)allOperations
{
  v3 = [MEMORY[0x263EFF980] array];
  os_unfair_lock_lock_with_options();
  [v3 addObjectsFromArray:self->_stagedOperations];
  [v3 addObjectsFromArray:self->_waitingOperations];
  os_unfair_lock_unlock(&self->_lock);
  return v3;
}

- (id)nextOperation
{
  v3 = [(HMDSyncOperationQueue *)self stagedOperations];
  v4 = (void *)[v3 count];

  if (v4)
  {
    os_unfair_lock_lock_with_options();
    v4 = [(NSMutableArray *)self->_stagedOperations objectAtIndex:0];
    [(NSMutableArray *)self->_stagedOperations removeObjectAtIndex:0];
    os_unfair_lock_unlock(&self->_lock);
    uint64_t v5 = [(HMDSyncOperationQueue *)self backoffTimer];
    [v5 resume];
  }
  return v4;
}

- (BOOL)isInMaximumTimeInterval
{
  v3 = [(HMDSyncOperationQueue *)self backoffTimer];
  if (v3)
  {
    v4 = [(HMDSyncOperationQueue *)self backoffTimer];
    [v4 timeInterval];
    double v6 = v5;
    v7 = [(HMDSyncOperationQueue *)self backoffTimer];
    [v7 maximumTimeInterval];
    BOOL v9 = v6 >= v8;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)processFiredTimer:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDSyncOperationQueue *)self backoffTimer];

  if (v5 == v4)
  {
    v20 = [(HMDSyncOperationQueue *)self backoffTimer];
    [v20 suspend];

    if (![(HMDSyncOperationQueue *)self countTotal]) {
      [(HMDSyncOperationQueue *)self setBackoffTimer:0];
    }
    BOOL v13 = 1;
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    double v6 = [(HMDSyncOperationQueue *)self waitingOperations];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v23;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v22 + 1) + 8 * v9);
        id v11 = [v10 delayTimer];
        BOOL v12 = v11 == v4;

        if (v12) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v14 = v10;
      long long v15 = [v14 delayTimer];
      [v15 suspend];

      [v14 setDelayTimer:0];
      if (!v14)
      {
        BOOL v13 = 0;
        goto LABEL_20;
      }
      long long v16 = (void *)MEMORY[0x230FBD990]();
      v17 = self;
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v27 = v19;
        __int16 v28 = 2112;
        id v29 = v14;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Sync queue delay timer fired, staging %@", buf, 0x16u);
      }
      os_unfair_lock_lock_with_options();
      [(NSMutableArray *)v17->_waitingOperations removeObject:v14];
      [(NSMutableArray *)v17->_stagedOperations addObject:v14];
      os_unfair_lock_unlock(&v17->_lock);
      BOOL v13 = 1;
      double v6 = v14;
    }
    else
    {
LABEL_10:
      BOOL v13 = 0;
    }
  }
LABEL_20:

  return v13;
}

- (void)dropAllOperations
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(HMDSyncOperationQueue *)self waitingOperations];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        uint64_t v8 = [v7 delayTimer];
        [v8 suspend];

        [v7 setDelayTimer:0];
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_stagedOperations removeAllObjects];
  [(NSMutableArray *)self->_waitingOperations removeAllObjects];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)dropOperation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    id v7 = v4;
    os_unfair_lock_lock_with_options();
    if ([(NSMutableArray *)self->_waitingOperations containsObject:v7])
    {
      [(NSMutableArray *)self->_waitingOperations removeObject:v7];
      double v6 = [v7 delayTimer];
      [v6 suspend];

      [v7 setDelayTimer:0];
    }
    else if ([(NSMutableArray *)self->_stagedOperations containsObject:v7])
    {
      [(NSMutableArray *)self->_stagedOperations removeObject:v7];
    }
    os_unfair_lock_unlock(p_lock);
    id v4 = v7;
  }
}

- (void)stageOperation:(id)a3
{
  if (a3) {
    -[HMDSyncOperationQueue _addOperation:](self, "_addOperation:");
  }
}

- (void)addOperation:(id)a3 withDelay:(double)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6)
  {
    id v7 = [(HMDSyncOperationQueue *)self manager];
    if ([(HMDSyncOperationQueue *)self hasExponentialBackoff])
    {
      [(HMDSyncOperationQueue *)self initialDelay];
      double v9 = v8;
      long long v10 = [(HMDSyncOperationQueue *)self backoffTimer];

      if (v10)
      {
        long long v11 = [(HMDSyncOperationQueue *)self backoffTimer];
        [v11 timeInterval];
        double v9 = v12;
      }
      if (v9 >= a4) {
        a4 = v9;
      }
      BOOL v13 = (void *)MEMORY[0x230FBD990]();
      uint64_t v14 = self;
      long long v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        long long v16 = HMFGetLogIdentifier();
        int v23 = 138543618;
        long long v24 = v16;
        __int16 v25 = 2048;
        double v26 = a4;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Current delay is %g", (uint8_t *)&v23, 0x16u);
      }
      if (a4 > 0.0)
      {
        v17 = [v7 timerFactory];
        uint64_t v18 = v17[2](a4);
        [v6 setDelayTimer:v18];

        v19 = [v6 delayTimer];
        [v19 setDelegate:v7];
      }
      [(HMDSyncOperationQueue *)v14 _createBackoffTimer];
    }
    else if (a4 > 0.0)
    {
      v20 = [v7 timerFactory];
      v21 = v20[2](a4);
      [v6 setDelayTimer:v21];

      long long v22 = [v6 delayTimer];
      [v22 setDelegate:v7];
    }
    [(HMDSyncOperationQueue *)self _addOperation:v6];
  }
}

- (void)_addOperation:(id)a3
{
  uint64_t v148 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v135 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id v5 = [(HMDSyncOperationQueue *)self stagedOperations];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v135 objects:v147 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v136;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v136 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v135 + 1) + 8 * i);
        long long v11 = [v4 zoneName];
        double v12 = [v10 zoneName];
        int v13 = [v11 isEqualToString:v12];

        if (v13)
        {
          uint64_t v14 = [v4 options];
          int v15 = [v14 isDelayRespected];

          long long v16 = (void *)MEMORY[0x230FBD990]();
          v17 = self;
          uint64_t v18 = HMFGetOSLogHandle();
          BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
          if (!v15)
          {
            if (v19)
            {
              v35 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              v141 = v35;
              _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Dropping new operation, already have staged operation", buf, 0xCu);
            }
            v36 = [v4 options];
            int v37 = [v36 isCloudConflict];

            if (v37)
            {
              v38 = [v4 options];
              uint64_t v39 = [v38 isCloudConflict];
              v40 = [v10 options];
              [v40 setCloudConflict:v39];
            }
            v41 = [v4 operationCompletions];
            v42 = v10;
            goto LABEL_92;
          }
          if (v19)
          {
            v20 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v141 = v20;
            _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Dropping staged operation, new operation has longer delay that must be respected", buf, 0xCu);
          }
          [(HMDSyncOperationQueue *)v17 _removeStagedOperation:v10];
          v21 = [v10 options];
          int v22 = [v21 isCloudConflict];

          if (v22)
          {
            int v23 = [v10 options];
            uint64_t v24 = [v23 isCloudConflict];
            __int16 v25 = [v4 options];
            [v25 setCloudConflict:v24];
          }
          double v26 = [v10 operationCompletions];
          [v4 updateOperationCompletionsWithArray:v26];

          goto LABEL_16;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v135 objects:v147 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  uint64_t v27 = [v4 delayTimer];

  if (!v27)
  {
    long long v129 = 0uLL;
    long long v130 = 0uLL;
    *((void *)&v127 + 1) = 0;
    long long v128 = 0uLL;
    v51 = [(HMDSyncOperationQueue *)self waitingOperations];
    uint64_t v52 = [v51 countByEnumeratingWithState:&v127 objects:v139 count:16];
    if (!v52) {
      goto LABEL_44;
    }
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v128;
    while (1)
    {
      for (uint64_t j = 0; j != v53; ++j)
      {
        if (*(void *)v128 != v54) {
          objc_enumerationMutation(v51);
        }
        v56 = *(void **)(*((void *)&v127 + 1) + 8 * j);
        v57 = [v4 zoneName];
        v58 = [v56 zoneName];
        int v59 = [v57 isEqualToString:v58];

        if (v59)
        {
          v60 = (void *)MEMORY[0x230FBD990]();
          v61 = self;
          v62 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            v63 = HMFGetLogIdentifier();
            v64 = [v56 zoneName];
            *(_DWORD *)buf = 138543618;
            v141 = v63;
            __int16 v142 = 2112;
            id v143 = v64;
            _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_INFO, "%{public}@Dropping scheduled operation, new operation being added directly to staged for %@", buf, 0x16u);
          }
          id v5 = v56;

          if (v5)
          {
            v65 = [v5 options];
            int v66 = [v65 isDelayRespected];

            if (v66)
            {
              v67 = (void *)MEMORY[0x230FBD990]();
              v68 = v61;
              v69 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
              {
                v70 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                v141 = v70;
                _os_log_impl(&dword_22F52A000, v69, OS_LOG_TYPE_INFO, "%{public}@Dropping new operation, found operation has delay that must respected", buf, 0xCu);
              }
LABEL_91:
              v41 = [v4 operationCompletions];
              v42 = v5;
LABEL_92:
              [v42 updateOperationCompletionsWithArray:v41];
              goto LABEL_93;
            }
            v88 = [v5 delayTimer];
            [v88 suspend];

            [v5 setDelayTimer:0];
            [(HMDSyncOperationQueue *)v61 _removeWaitingOperation:v5];
            v89 = [v5 options];
            int v90 = [v89 isCloudConflict];

            if (v90)
            {
              v91 = [v5 options];
              uint64_t v92 = [v91 isCloudConflict];
              v93 = [v4 options];
              [v93 setCloudConflict:v92];
            }
            v51 = [v5 operationCompletions];
            [v4 updateOperationCompletionsWithArray:v51];
LABEL_66:
          }
          v94 = (void *)MEMORY[0x230FBD990]();
          v95 = self;
          v96 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
          {
            v97 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v141 = v97;
            __int16 v142 = 2112;
            id v143 = v4;
            _os_log_impl(&dword_22F52A000, v96, OS_LOG_TYPE_INFO, "%{public}@Schedule operation without delay %@", buf, 0x16u);
          }
          [(HMDSyncOperationQueue *)v95 _addStagedOperation:v4];
          goto LABEL_94;
        }
      }
      uint64_t v53 = [v51 countByEnumeratingWithState:&v127 objects:v139 count:16];
      if (!v53)
      {
LABEL_44:
        id v5 = 0;
        goto LABEL_66;
      }
    }
  }
  long long v133 = 0uLL;
  long long v134 = 0uLL;
  long long v131 = 0uLL;
  long long v132 = 0uLL;
  __int16 v28 = [(HMDSyncOperationQueue *)self waitingOperations];
  id v5 = (id)[v28 countByEnumeratingWithState:&v131 objects:v146 count:16];
  if (!v5) {
    goto LABEL_80;
  }
  uint64_t v29 = *(void *)v132;
  while (2)
  {
    for (k = 0; k != v5; k = (char *)k + 1)
    {
      if (*(void *)v132 != v29) {
        objc_enumerationMutation(v28);
      }
      uint64_t v31 = *(void **)(*((void *)&v131 + 1) + 8 * (void)k);
      v32 = [v4 zoneName];
      v33 = [v31 zoneName];
      char v34 = [v32 isEqualToString:v33];

      if (v34)
      {
        id v5 = v31;

        if (!v5) {
          goto LABEL_81;
        }
        v43 = [v4 options];
        if ([v43 isDelayRespected])
        {
          v44 = [v5 options];
          char v45 = [v44 isDelayRespected];

          if ((v45 & 1) == 0)
          {
            v46 = (void *)MEMORY[0x230FBD990]();
            v47 = self;
            v48 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
            {
              v49 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              v141 = v49;
              v50 = "%{public}@Dropping found operation, must respect delay for new operation";
LABEL_76:
              _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_INFO, v50, buf, 0xCu);

              goto LABEL_77;
            }
            goto LABEL_77;
          }
        }
        else
        {
        }
        v71 = [v4 options];
        if ([v71 isDelayRespected])
        {
        }
        else
        {
          v72 = [v5 options];
          int v73 = [v72 isDelayRespected];

          if (v73)
          {
            v46 = (void *)MEMORY[0x230FBD990]();
            v74 = self;
            v48 = HMFGetOSLogHandle();
            if (!os_log_type_enabled(v48, OS_LOG_TYPE_INFO)) {
              goto LABEL_89;
            }
            v75 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v141 = v75;
            v76 = "%{public}@Dropping new operation, must respect delay for found operation";
            goto LABEL_88;
          }
        }
        v77 = [v4 options];
        if ([v77 isDelayRespected])
        {
          v78 = [v5 options];
          int v79 = [v78 isDelayRespected];

          if (v79)
          {
            v80 = [v5 delayTimer];
            [v80 timeInterval];
            double v82 = v81;
            v83 = [v4 delayTimer];
            [v83 timeInterval];
            double v85 = v84;

            v46 = (void *)MEMORY[0x230FBD990]();
            v86 = self;
            v48 = HMFGetOSLogHandle();
            BOOL v87 = os_log_type_enabled(v48, OS_LOG_TYPE_INFO);
            if (v82 < v85)
            {
              if (v87)
              {
                v49 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                v141 = v49;
                v50 = "%{public}@Dropping found operation, new operation delay is longer and must respected";
                goto LABEL_76;
              }
LABEL_77:

              v108 = [v5 delayTimer];
              [v108 suspend];

              [v5 setDelayTimer:0];
              [(HMDSyncOperationQueue *)self _removeWaitingOperation:v5];
              v109 = [v5 options];
              int v110 = [v109 isCloudConflict];

              if (v110)
              {
                v111 = [v5 options];
                uint64_t v112 = [v111 isCloudConflict];
                v113 = [v4 options];
                [v113 setCloudConflict:v112];
              }
              __int16 v28 = [v5 operationCompletions];
              [v4 updateOperationCompletionsWithArray:v28];
              goto LABEL_80;
            }
            if (v87)
            {
              v75 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              v141 = v75;
              v76 = "%{public}@Dropping new operation, found operation delay is longer and must respected";
LABEL_88:
              _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_INFO, v76, buf, 0xCu);

              goto LABEL_89;
            }
            goto LABEL_89;
          }
        }
        else
        {
        }
        __int16 v28 = [v4 options];
        if ([v28 isDelayRespected]) {
          goto LABEL_80;
        }
        v98 = [v5 options];
        char v99 = [v98 isDelayRespected];

        if (v99) {
          goto LABEL_81;
        }
        v100 = [v5 delayTimer];
        [v100 timeInterval];
        double v102 = v101;
        v103 = [v4 delayTimer];
        [v103 timeInterval];
        double v105 = v104;

        v46 = (void *)MEMORY[0x230FBD990]();
        v106 = self;
        v48 = HMFGetOSLogHandle();
        BOOL v107 = os_log_type_enabled(v48, OS_LOG_TYPE_INFO);
        if (v102 > v105)
        {
          if (v107)
          {
            v49 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v141 = v49;
            v50 = "%{public}@Dropping found operation, new operation delay is shorter";
            goto LABEL_76;
          }
          goto LABEL_77;
        }
        if (v107)
        {
          v75 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v141 = v75;
          v76 = "%{public}@Dropping new operation, found operation delay is shorter";
          goto LABEL_88;
        }
LABEL_89:

        v122 = [v4 options];
        int v123 = [v122 isCloudConflict];

        if (v123)
        {
          v124 = [v4 options];
          uint64_t v125 = [v124 isCloudConflict];
          v126 = [v5 options];
          [v126 setCloudConflict:v125];
        }
        goto LABEL_91;
      }
    }
    id v5 = (id)[v28 countByEnumeratingWithState:&v131 objects:v146 count:16];
    if (v5) {
      continue;
    }
    break;
  }
LABEL_80:

LABEL_81:
  v114 = (void *)MEMORY[0x230FBD990]();
  v115 = self;
  v116 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v116, OS_LOG_TYPE_INFO))
  {
    v117 = HMFGetLogIdentifier();
    v118 = [v4 delayTimer];
    [v118 timeInterval];
    v120 = v119;
    v121 = [v5 zoneName];
    *(_DWORD *)buf = 138543874;
    v141 = v117;
    __int16 v142 = 2048;
    id v143 = v120;
    __int16 v144 = 2112;
    v145 = v121;
    _os_log_impl(&dword_22F52A000, v116, OS_LOG_TYPE_INFO, "%{public}@Schedule operation with delay %g: %@", buf, 0x20u);
  }
  [(HMDSyncOperationQueue *)v115 _addWaitingOperation:v4];
  v41 = [v4 delayTimer];
  [v41 resume];
LABEL_93:

LABEL_94:
}

- (void)resetBackoffTimer
{
  v3 = [(HMDSyncOperationQueue *)self backoffTimer];

  if (v3)
  {
    id v4 = [(HMDSyncOperationQueue *)self backoffTimer];
    [v4 suspend];

    [(HMDSyncOperationQueue *)self setBackoffTimer:0];
  }
}

- (void)_createBackoffTimer
{
  if ([(HMDSyncOperationQueue *)self hasExponentialBackoff])
  {
    v3 = [(HMDSyncOperationQueue *)self backoffTimer];

    if (!v3)
    {
      id v4 = objc_alloc(MEMORY[0x263F42528]);
      [(HMDSyncOperationQueue *)self initialBackoff];
      id v5 = objc_msgSend(v4, "initWithMinimumTimeInterval:maximumTimeInterval:exponentialFactor:options:", cloudUploadTimerIntervalExponentialFactor, 1);
      [(HMDSyncOperationQueue *)self setBackoffTimer:v5];

      id v7 = [(HMDSyncOperationQueue *)self backoffTimer];
      uint64_t v6 = [(HMDSyncOperationQueue *)self manager];
      [v7 setDelegate:v6];
    }
  }
}

- (int64_t)count
{
  v2 = [(HMDSyncOperationQueue *)self stagedOperations];
  int64_t v3 = [v2 count];

  return v3;
}

- (int64_t)countTotal
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = [(NSMutableArray *)self->_stagedOperations count];
  int64_t v5 = [(NSMutableArray *)self->_waitingOperations count] + v4;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (NSString)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = NSString;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(HMDSyncOperationQueue *)self name];
  id v7 = [v4 stringWithFormat:@"<%@ %@, Staged Operations = %@, Waiting Operations = %@>", v5, v6, self->_stagedOperations, self->_waitingOperations];

  os_unfair_lock_unlock(p_lock);
  return (NSString *)v7;
}

- (void)_removeWaitingOperation:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_waitingOperations removeObject:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_addWaitingOperation:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_waitingOperations addObject:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_removeStagedOperation:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_stagedOperations removeObject:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_addStagedOperation:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_stagedOperations addObject:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)waitingOperations
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_waitingOperations copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSArray)stagedOperations
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_stagedOperations copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (id)initName:(id)a3 syncManager:(id)a4 initialDelay:(double)a5 initialBackoff:(double)a6 hasBackoff:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HMDSyncOperationQueue;
  int v15 = [(HMDSyncOperationQueue *)&v22 init];
  long long v16 = v15;
  if (v15)
  {
    v15->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v15->_name, a3);
    objc_storeWeak((id *)&v16->_manager, v14);
    uint64_t v17 = [MEMORY[0x263EFF980] array];
    stagedOperations = v16->_stagedOperations;
    v16->_stagedOperations = (NSMutableArray *)v17;

    uint64_t v19 = [MEMORY[0x263EFF980] array];
    waitingOperations = v16->_waitingOperations;
    v16->_waitingOperations = (NSMutableArray *)v19;

    v16->_initialDelay = a5;
    v16->_initialBackoff = a6;
    v16->_hasExponentialBackoff = a7;
  }

  return v16;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t28_139863 != -1) {
    dispatch_once(&logCategory__hmf_once_t28_139863, &__block_literal_global_139864);
  }
  v2 = (void *)logCategory__hmf_once_v29_139865;
  return v2;
}

void __36__HMDSyncOperationQueue_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v29_139865;
  logCategory__hmf_once_v29_139865 = v0;
}

@end