@interface HMMTRAccessoryConnectionRequest
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)hasPendingHighPriorityConnectionRequest;
- (BOOL)isEqual:(id)a3;
- (BOOL)wedConnectionPending;
- (HMFTimer)idleReadTimer;
- (HMFTimer)idleTimer;
- (HMFTimer)idleWriteTimer;
- (HMFTimer)lifeTimer;
- (HMMTRAccessoryConnectionRequest)initWithQueue:(id)a3 server:(id)a4 highPriority:(BOOL)a5 completion:(id)a6;
- (HMMTRAccessoryServer)server;
- (HMMTRFabricConnectionRequest)parentFabricRequest;
- (NSNumber)fabricID;
- (NSNumber)nodeID;
- (OS_dispatch_queue)workQueue;
- (double)_getIdleAccessoryConnectionTimeoutWEDShort;
- (double)_getIdleAccessoryConnectionTimeoutWEDShortRead;
- (double)_getIdleAccessoryConnectionTimeoutWEDShortWrite;
- (id)_getAllPendingOperations;
- (id)attributeDescriptions;
- (id)logIdentifier;
- (id)privateDescription;
- (unint64_t)_numPendingOperations;
- (unint64_t)connectionPriority;
- (unint64_t)hash;
- (unsigned)connectionIdleTime;
- (void)_handleReadWriteTimerDidFire:(id)a3 altTimer:(id)a4;
- (void)_restartConnectionIdleTimer:(double)a3;
- (void)_restartReadWriteIdleTimersWithReadInterval:(double)a3 writeInterval:(double)a4;
- (void)abortAllPendingOperations:(id)a3;
- (void)executeAllPendingOperations;
- (void)kickIdleTimer;
- (void)mergeAccessoryConnectionRequest:(id)a3;
- (void)setConnectionIdleTime:(unsigned __int8)a3;
- (void)setConnectionPriority:(unint64_t)a3;
- (void)setIdleReadTimer:(id)a3;
- (void)setIdleTimer:(id)a3;
- (void)setIdleWriteTimer:(id)a3;
- (void)setParentFabricRequest:(id)a3;
- (void)setServer:(id)a3;
- (void)setWedConnectionPending:(BOOL)a3;
- (void)timerDidFire:(id)a3;
- (void)updateConnectionIdleTime:(unsigned __int8)a3;
@end

@implementation HMMTRAccessoryConnectionRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lifeTimer, 0);
  objc_storeStrong((id *)&self->_idleWriteTimer, 0);
  objc_storeStrong((id *)&self->_idleReadTimer, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_fabricID, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);
  objc_destroyWeak((id *)&self->_server);
  objc_destroyWeak((id *)&self->_parentFabricRequest);
  objc_storeStrong((id *)&self->_pendingOperations, 0);
}

- (void)setConnectionPriority:(unint64_t)a3
{
  self->_connectionPriority = a3;
}

- (unint64_t)connectionPriority
{
  return self->_connectionPriority;
}

- (HMFTimer)lifeTimer
{
  return self->_lifeTimer;
}

- (void)setIdleWriteTimer:(id)a3
{
}

- (HMFTimer)idleWriteTimer
{
  return self->_idleWriteTimer;
}

- (void)setIdleReadTimer:(id)a3
{
}

- (HMFTimer)idleReadTimer
{
  return self->_idleReadTimer;
}

- (void)setIdleTimer:(id)a3
{
}

- (HMFTimer)idleTimer
{
  return self->_idleTimer;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWedConnectionPending:(BOOL)a3
{
  self->_wedConnectionPending = a3;
}

- (BOOL)wedConnectionPending
{
  return self->_wedConnectionPending;
}

- (void)setConnectionIdleTime:(unsigned __int8)a3
{
  self->_connectionIdleTime = a3;
}

- (unsigned)connectionIdleTime
{
  return self->_connectionIdleTime;
}

- (NSNumber)fabricID
{
  return self->_fabricID;
}

- (NSNumber)nodeID
{
  return self->_nodeID;
}

- (void)setServer:(id)a3
{
}

- (HMMTRAccessoryServer)server
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  return (HMMTRAccessoryServer *)WeakRetained;
}

- (void)setParentFabricRequest:(id)a3
{
}

- (HMMTRFabricConnectionRequest)parentFabricRequest
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentFabricRequest);
  return (HMMTRFabricConnectionRequest *)WeakRetained;
}

- (unint64_t)hash
{
  v3 = [(HMMTRAccessoryConnectionRequest *)self nodeID];
  uint64_t v4 = [v3 hash];

  v5 = [(HMMTRAccessoryConnectionRequest *)self fabricID];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMMTRAccessoryConnectionRequest *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  if (self == v4)
  {
    char v12 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v6 = v5;
    v7 = [(HMMTRAccessoryConnectionRequest *)v6 nodeID];
    v8 = [(HMMTRAccessoryConnectionRequest *)self nodeID];
    int v9 = [v7 isEqual:v8];

    if (v9)
    {
      v10 = [(HMMTRAccessoryConnectionRequest *)v6 fabricID];
      v11 = [(HMMTRAccessoryConnectionRequest *)self fabricID];
      char v12 = [v10 isEqual:v11];
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
LABEL_6:
    char v12 = 0;
  }
LABEL_10:

  return v12;
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  uint64_t v4 = [(HMMTRAccessoryConnectionRequest *)self nodeID];
  v5 = (void *)[v3 initWithName:@"NodeID" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMMTRAccessoryConnectionRequest *)self fabricID];
  v8 = (void *)[v6 initWithName:@"FabricID" value:v7];
  v11[1] = v8;
  int v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
}

- (id)privateDescription
{
  id v3 = NSString;
  uint64_t v4 = [(id)objc_opt_class() shortDescription];
  v5 = [(HMMTRAccessoryConnectionRequest *)self nodeID];
  id v6 = [(HMMTRAccessoryConnectionRequest *)self fabricID];
  v7 = [v3 stringWithFormat:@"%@ %@ [%@]", v4, v5, v6];

  return v7;
}

- (id)logIdentifier
{
  id v3 = NSString;
  uint64_t v4 = [(HMMTRAccessoryConnectionRequest *)self nodeID];
  v5 = [(HMMTRAccessoryConnectionRequest *)self fabricID];
  id v6 = [v3 stringWithFormat:@"%@/%@", v4, v5];

  return v6;
}

- (BOOL)hasPendingHighPriorityConnectionRequest
{
  return [(HMMTRAccessoryConnectionRequest *)self connectionPriority] == 1;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMMTRAccessoryConnectionRequest *)self idleTimer];

  if (v5 == v4)
  {
    v14 = (void *)MEMORY[0x2533B64D0]();
    v10 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = HMFGetLogIdentifier();
      int v28 = 138543362;
      v29 = v16;
      _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_INFO, "%{public}@No activity for accessory, releasing connection", (uint8_t *)&v28, 0xCu);
    }
    v17 = [(HMMTRAccessoryConnectionRequest *)v10 idleWriteTimer];
    [v17 suspend];

    v13 = [(HMMTRAccessoryConnectionRequest *)v10 idleReadTimer];
    [v13 suspend];
    goto LABEL_11;
  }
  id v6 = [(HMMTRAccessoryConnectionRequest *)self idleWriteTimer];

  if (v6 == v4)
  {
    v19 = (void *)MEMORY[0x2533B64D0]();
    v20 = self;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v22 = HMFGetLogIdentifier();
      int v28 = 138543362;
      v29 = v22;
      _os_log_impl(&dword_252495000, v21, OS_LOG_TYPE_DEBUG, "%{public}@timerDidFire - idleWriteTimer", (uint8_t *)&v28, 0xCu);
    }
    v18 = [(HMMTRAccessoryConnectionRequest *)v20 idleWriteTimer];
    uint64_t v23 = [(HMMTRAccessoryConnectionRequest *)v20 idleReadTimer];
    goto LABEL_18;
  }
  id v7 = [(HMMTRAccessoryConnectionRequest *)self idleReadTimer];

  if (v7 == v4)
  {
    v24 = (void *)MEMORY[0x2533B64D0]();
    v20 = self;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v26 = HMFGetLogIdentifier();
      int v28 = 138543362;
      v29 = v26;
      _os_log_impl(&dword_252495000, v25, OS_LOG_TYPE_DEBUG, "%{public}@timerDidFire - idleReadTimer", (uint8_t *)&v28, 0xCu);
    }
    v18 = [(HMMTRAccessoryConnectionRequest *)v20 idleReadTimer];
    uint64_t v23 = [(HMMTRAccessoryConnectionRequest *)v20 idleWriteTimer];
LABEL_18:
    v27 = (void *)v23;
    [(HMMTRAccessoryConnectionRequest *)v20 _handleReadWriteTimerDidFire:v18 altTimer:v23];

    goto LABEL_19;
  }
  id v8 = [(HMMTRAccessoryConnectionRequest *)self lifeTimer];

  if (v8 == v4)
  {
    int v9 = (void *)MEMORY[0x2533B64D0]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      char v12 = HMFGetLogIdentifier();
      int v28 = 138543362;
      v29 = v12;
      _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_INFO, "%{public}@Lifetime of the accessory connection request expired, releasing connection", (uint8_t *)&v28, 0xCu);
    }
    v13 = [MEMORY[0x263F087E8] hmfErrorWithCode:13];
    [(HMMTRAccessoryConnectionRequest *)v10 abortAllPendingOperations:v13];
LABEL_11:

    v18 = [(HMMTRAccessoryConnectionRequest *)v10 parentFabricRequest];
    [v18 operationsCompletedForAccessoryConnectionRequest:v10];
LABEL_19:
  }
}

- (void)_handleReadWriteTimerDidFire:(id)a3 altTimer:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMMTRAccessoryConnectionRequest *)self server];
  char v9 = [v8 isReadyToReadFromMTRDevice];

  if (v9)
  {
    int v10 = [v7 isRunning];
    v11 = (void *)MEMORY[0x2533B64D0]();
    char v12 = self;
    v13 = HMFGetOSLogHandle();
    v14 = v13;
    if (v10)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v15 = HMFGetLogIdentifier();
        int v22 = 138543362;
        uint64_t v23 = v15;
        _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_DEBUG, "%{public}@handleReadWriteTimerDidFire - pending read or write", (uint8_t *)&v22, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v20 = HMFGetLogIdentifier();
        int v22 = 138543362;
        uint64_t v23 = v20;
        _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, "%{public}@handleReadWriteTimerDidFire - no pending read/writes, mark connection as idle", (uint8_t *)&v22, 0xCu);
      }
      v21 = [(HMMTRAccessoryConnectionRequest *)v12 idleTimer];
      [v21 fire];
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x2533B64D0]();
    v17 = self;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = HMFGetLogIdentifier();
      int v22 = 138543362;
      uint64_t v23 = v19;
      _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_DEBUG, "%{public}@handleReadWriteTimerDidFire - sub not yet establish, kick timer", (uint8_t *)&v22, 0xCu);
    }
    [v6 resume];
  }
}

- (void)kickIdleTimer
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    char v9 = v6;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_DEBUG, "%{public}@kickIdleTimer", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [(HMMTRAccessoryConnectionRequest *)v4 idleTimer];
  [v7 resume];
}

- (void)abortAllPendingOperations:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x2533B64D0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v25 = v8;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@abortAllPendingOperations", buf, 0xCu);
  }
  char v9 = [(HMMTRAccessoryConnectionRequest *)v6 _getAllPendingOperations];
  uint64_t v10 = [(HMMTRAccessoryConnectionRequest *)v6 idleTimer];
  [v10 suspend];

  v11 = [(HMMTRAccessoryConnectionRequest *)v6 idleWriteTimer];
  [v11 suspend];

  char v12 = [(HMMTRAccessoryConnectionRequest *)v6 idleReadTimer];
  [v12 suspend];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v19 + 1) + 8 * v17) + 16))(*(void *)(*((void *)&v19 + 1) + 8 * v17));
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v15);
  }

  v18 = [(HMMTRAccessoryConnectionRequest *)v6 parentFabricRequest];
  [v18 operationsCompletedForAccessoryConnectionRequest:v6];
}

- (void)executeAllPendingOperations
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v25 = v6;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@executeAllPendingOperations", buf, 0xCu);
  }
  uint64_t v7 = [(HMMTRAccessoryConnectionRequest *)v4 connectionPriority];
  int v8 = [(HMMTRAccessoryConnectionRequest *)v4 _getAllPendingOperations];
  if ([v8 count])
  {
    char v9 = [(HMMTRAccessoryConnectionRequest *)v4 idleTimer];
    [v9 suspend];

    if (v7 == 1)
    {
      uint64_t v10 = [(HMMTRAccessoryConnectionRequest *)v4 idleWriteTimer];
      [v10 suspend];
    }
    v11 = [(HMMTRAccessoryConnectionRequest *)v4 idleReadTimer];
    [v11 suspend];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v19 + 1) + 8 * v16) + 16))(*(void *)(*((void *)&v19 + 1) + 8 * v16));
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }

    [(HMMTRAccessoryConnectionRequest *)v4 kickIdleTimer];
    if (v7 == 1)
    {
      uint64_t v17 = [(HMMTRAccessoryConnectionRequest *)v4 idleWriteTimer];
      [v17 resume];
    }
    v18 = [(HMMTRAccessoryConnectionRequest *)v4 idleReadTimer];
    [v18 resume];
  }
}

- (void)mergeAccessoryConnectionRequest:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x2533B64D0]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    int v12 = 138543362;
    uint64_t v13 = v8;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@mergeAccessoryConnectionRequest", (uint8_t *)&v12, 0xCu);
  }
  os_unfair_lock_lock_with_options();
  if ([v4 connectionPriority] == 1) {
    [(HMMTRAccessoryConnectionRequest *)v6 setConnectionPriority:1];
  }
  pendingOperations = v6->_pendingOperations;
  uint64_t v10 = [v4 _getAllPendingOperations];
  [(NSMutableArray *)pendingOperations addObjectsFromArray:v10];

  os_unfair_lock_unlock(&v6->_lock);
  v11 = [(HMMTRAccessoryConnectionRequest *)v6 lifeTimer];
  [v11 resume];
}

- (id)_getAllPendingOperations
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [MEMORY[0x263EFF8C0] arrayWithArray:self->_pendingOperations];
  [(NSMutableArray *)self->_pendingOperations removeAllObjects];
  [(HMMTRAccessoryConnectionRequest *)self setConnectionPriority:0];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)_numPendingOperations
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t v4 = [(NSMutableArray *)self->_pendingOperations count];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_restartReadWriteIdleTimersWithReadInterval:(double)a3 writeInterval:(double)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v7 = [(HMMTRAccessoryConnectionRequest *)self idleReadTimer];
  int v8 = [v7 isRunning];

  char v9 = [(HMMTRAccessoryConnectionRequest *)self idleWriteTimer];
  int v10 = [v9 isRunning];

  v11 = [(HMMTRAccessoryConnectionRequest *)self idleReadTimer];
  [v11 suspend];

  int v12 = [(HMMTRAccessoryConnectionRequest *)self idleWriteTimer];
  [v12 suspend];

  uint64_t v13 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v14 = self;
  uint64_t v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = HMFGetLogIdentifier();
    int v27 = 138543874;
    int v28 = v16;
    __int16 v29 = 2048;
    double v30 = a3;
    __int16 v31 = 2048;
    double v32 = a4;
    _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Updating AccessoryConnectionRequest read/write idle time to: read: %f, write: %f", (uint8_t *)&v27, 0x20u);
  }
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:a3];
  [(HMMTRAccessoryConnectionRequest *)v14 setIdleReadTimer:v17];

  v18 = [(HMMTRAccessoryConnectionRequest *)v14 workQueue];
  long long v19 = [(HMMTRAccessoryConnectionRequest *)v14 idleReadTimer];
  [v19 setDelegateQueue:v18];

  long long v20 = [(HMMTRAccessoryConnectionRequest *)v14 idleReadTimer];
  [v20 setDelegate:v14];

  if (v8)
  {
    long long v21 = [(HMMTRAccessoryConnectionRequest *)v14 idleReadTimer];
    [v21 resume];
  }
  long long v22 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:a4];
  [(HMMTRAccessoryConnectionRequest *)v14 setIdleWriteTimer:v22];

  uint64_t v23 = [(HMMTRAccessoryConnectionRequest *)v14 workQueue];
  uint64_t v24 = [(HMMTRAccessoryConnectionRequest *)v14 idleWriteTimer];
  [v24 setDelegateQueue:v23];

  v25 = [(HMMTRAccessoryConnectionRequest *)v14 idleWriteTimer];
  [v25 setDelegate:v14];

  if (v10)
  {
    uint64_t v26 = [(HMMTRAccessoryConnectionRequest *)v14 idleWriteTimer];
    [v26 resume];
  }
}

- (void)_restartConnectionIdleTimer:(double)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = [(HMMTRAccessoryConnectionRequest *)self idleTimer];
  int v6 = [v5 isRunning];

  uint64_t v7 = [(HMMTRAccessoryConnectionRequest *)self idleTimer];
  [v7 suspend];

  int v8 = (void *)MEMORY[0x2533B64D0]();
  char v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = HMFGetLogIdentifier();
    int v17 = 138543618;
    v18 = v11;
    __int16 v19 = 2048;
    double v20 = a3;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Updating AccessoryConnectionRequest Idle time to: %f", (uint8_t *)&v17, 0x16u);
  }
  int v12 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:a3];
  [(HMMTRAccessoryConnectionRequest *)v9 setIdleTimer:v12];

  uint64_t v13 = [(HMMTRAccessoryConnectionRequest *)v9 workQueue];
  uint64_t v14 = [(HMMTRAccessoryConnectionRequest *)v9 idleTimer];
  [v14 setDelegateQueue:v13];

  uint64_t v15 = [(HMMTRAccessoryConnectionRequest *)v9 idleTimer];
  [v15 setDelegate:v9];

  if (v6)
  {
    uint64_t v16 = [(HMMTRAccessoryConnectionRequest *)v9 idleTimer];
    [v16 resume];
  }
}

- (void)updateConnectionIdleTime:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  if ([(HMMTRAccessoryConnectionRequest *)self connectionIdleTime] == a3) {
    return;
  }
  [(HMMTRAccessoryConnectionRequest *)self setConnectionIdleTime:v3];
  if (v3 == 2)
  {
    [(HMMTRAccessoryConnectionRequest *)self _restartConnectionIdleTimer:30.0];
    double v5 = 60.0;
    int v6 = self;
    double v7 = 60.0;
  }
  else
  {
    if (v3 != 1)
    {
      [(HMMTRAccessoryConnectionRequest *)self _restartConnectionIdleTimer:7.5];
      return;
    }
    [(HMMTRAccessoryConnectionRequest *)self _getIdleAccessoryConnectionTimeoutWEDShort];
    -[HMMTRAccessoryConnectionRequest _restartConnectionIdleTimer:](self, "_restartConnectionIdleTimer:");
    [(HMMTRAccessoryConnectionRequest *)self _getIdleAccessoryConnectionTimeoutWEDShortRead];
    double v9 = v8;
    [(HMMTRAccessoryConnectionRequest *)self _getIdleAccessoryConnectionTimeoutWEDShortWrite];
    double v7 = v10;
    int v6 = self;
    double v5 = v9;
  }
  [(HMMTRAccessoryConnectionRequest *)v6 _restartReadWriteIdleTimersWithReadInterval:v5 writeInterval:v7];
}

- (double)_getIdleAccessoryConnectionTimeoutWEDShortWrite
{
  v2 = (void *)CFPreferencesCopyAppValue(@"hmmtr.thread.wed.idletimer.shortwrite", (CFStringRef)*MEMORY[0x263EFFE60]);
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 15.0;
  }

  return v5;
}

- (double)_getIdleAccessoryConnectionTimeoutWEDShortRead
{
  v2 = (void *)CFPreferencesCopyAppValue(@"hmmtr.thread.wed.idletimer.shortread", (CFStringRef)*MEMORY[0x263EFFE60]);
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 2.0;
  }

  return v5;
}

- (double)_getIdleAccessoryConnectionTimeoutWEDShort
{
  v2 = (void *)CFPreferencesCopyAppValue(@"hmmtr.thread.wed.idletimer.short", (CFStringRef)*MEMORY[0x263EFFE60]);
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 7.5;
  }

  return v5;
}

- (HMMTRAccessoryConnectionRequest)initWithQueue:(id)a3 server:(id)a4 highPriority:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v33.receiver = self;
  v33.super_class = (Class)HMMTRAccessoryConnectionRequest;
  uint64_t v14 = [(HMMTRAccessoryConnectionRequest *)&v33 init];
  uint64_t v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_server, v12);
    uint64_t v16 = [v12 nodeID];
    nodeID = v15->_nodeID;
    v15->_nodeID = (NSNumber *)v16;

    uint64_t v18 = [v12 fabricID];
    fabricID = v15->_fabricID;
    v15->_fabricID = (NSNumber *)v18;

    objc_storeStrong((id *)&v15->_workQueue, a3);
    objc_storeWeak((id *)&v15->_parentFabricRequest, 0);
    v15->_connectionPriority = v7;
    double v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pendingOperations = v15->_pendingOperations;
    v15->_pendingOperations = v20;

    long long v22 = v15->_pendingOperations;
    uint64_t v23 = (void *)MEMORY[0x2533B66E0](v13);
    [(NSMutableArray *)v22 addObject:v23];

    v15->_connectionIdleTime = 0;
    uint64_t v24 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:7.5];
    idleTimer = v15->_idleTimer;
    v15->_idleTimer = (HMFTimer *)v24;

    [(HMFTimer *)v15->_idleTimer setDelegateQueue:v11];
    [(HMFTimer *)v15->_idleTimer setDelegate:v15];
    uint64_t v26 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:60.0];
    idleReadTimer = v15->_idleReadTimer;
    v15->_idleReadTimer = (HMFTimer *)v26;

    [(HMFTimer *)v15->_idleReadTimer setDelegateQueue:v11];
    [(HMFTimer *)v15->_idleReadTimer setDelegate:v15];
    uint64_t v28 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:60.0];
    idleWriteTimer = v15->_idleWriteTimer;
    v15->_idleWriteTimer = (HMFTimer *)v28;

    [(HMFTimer *)v15->_idleWriteTimer setDelegateQueue:v11];
    [(HMFTimer *)v15->_idleWriteTimer setDelegate:v15];
    uint64_t v30 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:60.0];
    lifeTimer = v15->_lifeTimer;
    v15->_lifeTimer = (HMFTimer *)v30;

    [(HMFTimer *)v15->_lifeTimer setDelegateQueue:v11];
    [(HMFTimer *)v15->_lifeTimer setDelegate:v15];
    [(HMFTimer *)v15->_lifeTimer resume];
  }

  return v15;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16 != -1) {
    dispatch_once(&logCategory__hmf_once_t16, &__block_literal_global_978);
  }
  v2 = (void *)logCategory__hmf_once_v17;
  return v2;
}

uint64_t __46__HMMTRAccessoryConnectionRequest_logCategory__block_invoke()
{
  logCategory__hmf_once_int v17 = HMFCreateOSLogHandle();
  return MEMORY[0x270F9A758]();
}

@end