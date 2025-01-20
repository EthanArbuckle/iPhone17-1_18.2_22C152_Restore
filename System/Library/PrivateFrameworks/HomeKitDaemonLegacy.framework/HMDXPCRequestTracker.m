@interface HMDXPCRequestTracker
+ (id)logCategory;
- (HMDXPCRequestTracker)initWithQueue:(id)a3;
- (HMDXPCRequestTracker)initWithQueue:(id)a3 watchdogTimer:(id)a4;
- (HMFTimer)watchdogTimer;
- (NSMutableDictionary)pendingRequests;
- (NSSet)requestIdentifiers;
- (NSString)clientName;
- (OS_dispatch_queue)queue;
- (void)_respondToRequest:(id)a3 withPayload:(id)a4 error:(id)a5;
- (void)addRequestWithIdentifier:(id)a3 name:(id)a4 qualityOfService:(int64_t)a5 isTimeoutDisabled:(BOOL)a6 responseHandler:(id)a7;
- (void)cancelAllRequests;
- (void)respondToRequestWithIdentifier:(id)a3 withPayload:(id)a4 error:(id)a5;
- (void)setClientName:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDXPCRequestTracker

uint64_t __60__HMDXPCRequestTracker__respondToRequest_withPayload_error___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t17_163220 != -1) {
    dispatch_once(&logCategory__hmf_once_t17_163220, &__block_literal_global_163221);
  }
  v2 = (void *)logCategory__hmf_once_v18_163222;
  return v2;
}

- (void)setClientName:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSString *)[v6 copy];
  clientName = self->_clientName;
  self->_clientName = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)addRequestWithIdentifier:(id)a3 name:(id)a4 qualityOfService:(int64_t)a5 isTimeoutDisabled:(BOOL)a6 responseHandler:(id)a7
{
  BOOL v8 = a6;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v14 = [(HMDXPCRequestTracker *)self pendingRequests];
  uint64_t v15 = [v14 count];

  if (!v15)
  {
    v16 = (void *)MEMORY[0x1D9452090]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v35 = v19;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Starting watchdog timer", buf, 0xCu);
    }
    v20 = [(HMDXPCRequestTracker *)v17 watchdogTimer];
    [v20 resume];
  }
  v21 = (void *)MEMORY[0x1E4F1C9C8];
  v22 = [(HMDXPCRequestTracker *)self watchdogTimer];
  [v22 timeInterval];
  v23 = objc_msgSend(v21, "dateWithTimeIntervalSinceNow:");

  if (v8)
  {
    v24 = (void *)MEMORY[0x1D9452090]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v35 = v27;
      __int16 v36 = 2112;
      id v37 = v12;
      __int16 v38 = 2112;
      id v39 = v11;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Disabling timeout for message %@(%@)", buf, 0x20u);
    }
    uint64_t v28 = [MEMORY[0x1E4F1C9C8] distantFuture];

    v23 = (void *)v28;
  }
  v29 = [[HMDXPCRequest alloc] initWithName:v12 qualityOfService:v32 timeoutDate:v23 responseHandler:v13];
  v30 = [(HMDXPCRequestTracker *)self pendingRequests];
  [v30 setObject:v29 forKeyedSubscript:v11];

  os_unfair_lock_unlock(lock);
}

- (HMFTimer)watchdogTimer
{
  return self->_watchdogTimer;
}

- (void)respondToRequestWithIdentifier:(id)a3 withPayload:(id)a4 error:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  BOOL v8 = (NSString *)a3;
  id v9 = a4;
  id v10 = a5;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v12 = [(HMDXPCRequestTracker *)self pendingRequests];
  id v13 = [v12 objectForKeyedSubscript:v8];

  if (v13)
  {
    [(HMDXPCRequestTracker *)self _respondToRequest:v13 withPayload:v9 error:v10];
    if (v10)
    {
      v33 = [NSString stringWithFormat:@" with error %@", v10];
    }
    else
    {
      v33 = &stru_1F2C9F1A8;
    }
    v19 = (void *)MEMORY[0x1D9452090]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      v23 = [v13 name];
      clientName = v20->_clientName;
      *(_DWORD *)buf = 138544386;
      id v35 = v22;
      __int16 v36 = 2114;
      id v37 = v23;
      __int16 v38 = 2114;
      id v39 = v8;
      __int16 v40 = 2114;
      v41 = clientName;
      __int16 v42 = 2114;
      v43 = v33;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Answering incoming message %{public}@ (%{public}@) from client '%{public}@' that expects a response%{public}@", buf, 0x34u);
    }
    v25 = [(HMDXPCRequestTracker *)v20 pendingRequests];
    [v25 setObject:0 forKeyedSubscript:v8];

    v26 = [(HMDXPCRequestTracker *)v20 pendingRequests];
    BOOL v27 = [v26 count] == 0;

    if (v27)
    {
      uint64_t v28 = (void *)MEMORY[0x1D9452090]();
      v29 = v20;
      HMFGetOSLogHandle();
      v30 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        v31 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v35 = v31;
        _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_DEBUG, "%{public}@Suspending timer after last request was removed", buf, 0xCu);
      }
      uint64_t v32 = [(HMDXPCRequestTracker *)v29 watchdogTimer];
      [v32 suspend];
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1D9452090]();
    uint64_t v15 = self;
    HMFGetOSLogHandle();
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = HMFGetLogIdentifier();
      v18 = v15->_clientName;
      *(_DWORD *)buf = 138543874;
      id v35 = v17;
      __int16 v36 = 2114;
      id v37 = v8;
      __int16 v38 = 2114;
      id v39 = v18;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to find request with identifier %{public}@ for client '%{public}@' to remove from request tracker", buf, 0x20u);
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (NSMutableDictionary)pendingRequests
{
  return self->_pendingRequests;
}

- (void)_respondToRequest:(id)a3 withPayload:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v10 responseHandler];
  id v12 = (void *)[v11 copy];

  [v10 qualityOfService];
  LODWORD(v11) = HMFQOSClassFromQualityOfService();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HMDXPCRequestTracker__respondToRequest_withPayload_error___block_invoke;
  block[3] = &unk_1E6A193D0;
  id v20 = v8;
  id v21 = v12;
  id v19 = v9;
  id v13 = v8;
  id v14 = v9;
  id v15 = v12;
  dispatch_block_t v16 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)v11, 0, block);
  v17 = [(HMDXPCRequestTracker *)self queue];
  dispatch_async(v17, v16);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (HMDXPCRequestTracker)initWithQueue:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F65580];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithTimeInterval:4 options:300.0];
  v7 = [(HMDXPCRequestTracker *)self initWithQueue:v5 watchdogTimer:v6];

  return v7;
}

- (HMDXPCRequestTracker)initWithQueue:(id)a3 watchdogTimer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDXPCRequestTracker;
  id v9 = [(HMDXPCRequestTracker *)&v15 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    clientName = v10->_clientName;
    v10->_clientName = (NSString *)@"<unknown>";

    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    pendingRequests = v10->_pendingRequests;
    v10->_pendingRequests = (NSMutableDictionary *)v12;

    objc_storeStrong((id *)&v10->_watchdogTimer, a4);
    [(HMFTimer *)v10->_watchdogTimer setDelegate:v10];
    [(HMFTimer *)v10->_watchdogTimer setDelegateQueue:v7];
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
}

- (void)timerDidFire:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v4 = [(HMDXPCRequestTracker *)self watchdogTimer];

  id v5 = v35;
  if (v4 == v35)
  {
    __int16 v38 = [MEMORY[0x1E4F1C9C8] date];
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v6 = [(HMDXPCRequestTracker *)self pendingRequests];
    id v7 = (void *)[v6 copy];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v51 count:16];
    if (v8)
    {
      uint64_t v37 = *(void *)v40;
      id obj = v7;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v40 != v37) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          id v11 = [(HMDXPCRequestTracker *)self pendingRequests];
          uint64_t v12 = [v11 objectForKeyedSubscript:v10];

          id v13 = (void *)MEMORY[0x1D9452090]();
          id v14 = self;
          HMFGetOSLogHandle();
          objc_super v15 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            id v16 = (id)objc_claimAutoreleasedReturnValue();
            v17 = [v12 name];
            *(_DWORD *)buf = 138543874;
            id v44 = v16;
            __int16 v45 = 2112;
            v46 = v17;
            __int16 v47 = 2112;
            uint64_t v48 = v10;
            _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Checking if request %@ (%@) timed out after watchdog timer fired", buf, 0x20u);
          }
          v18 = [v12 timeoutDate];
          BOOL v19 = [v18 compare:v38] == -1;

          if (v19)
          {
            id v20 = (void *)MEMORY[0x1D9452090]();
            id v21 = v14;
            HMFGetOSLogHandle();
            id v22 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              id v23 = (id)objc_claimAutoreleasedReturnValue();
              v24 = [v12 name];
              clientName = v21->_clientName;
              *(_DWORD *)buf = 138544130;
              id v44 = v23;
              __int16 v45 = 2112;
              v46 = v24;
              __int16 v47 = 2112;
              uint64_t v48 = v10;
              __int16 v49 = 2112;
              v50 = clientName;
              _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Reaping timed out pending request %@ (%@) from client '%@' that expects a response", buf, 0x2Au);
            }
            v26 = [MEMORY[0x1E4F28C58] hmErrorWithCode:8];
            [(HMDXPCRequestTracker *)v21 _respondToRequest:v12 withPayload:0 error:v26];

            BOOL v27 = [(HMDXPCRequestTracker *)v21 pendingRequests];
            [v27 setObject:0 forKeyedSubscript:v10];

            uint64_t v28 = [(HMDXPCRequestTracker *)v21 pendingRequests];
            LODWORD(v27) = [v28 count] == 0;

            if (v27)
            {
              v29 = (void *)MEMORY[0x1D9452090]();
              v30 = v21;
              HMFGetOSLogHandle();
              v31 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v32 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                id v44 = v32;
                _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_DEBUG, "%{public}@Suspending watchdog timer after handling timeout", buf, 0xCu);
              }
              v33 = [(HMDXPCRequestTracker *)v30 watchdogTimer];
              [v33 suspend];
            }
          }
        }
        id v7 = obj;
        uint64_t v8 = [obj countByEnumeratingWithState:&v39 objects:v51 count:16];
      }
      while (v8);
    }

    os_unfair_lock_unlock(lock);
    id v5 = v35;
  }
}

- (void)cancelAllRequests
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v22 = self;
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v28 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Canceling all pending requests", buf, 0xCu);
  }
  os_unfair_lock_lock_with_options();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = [(HMDXPCRequestTracker *)v22 pendingRequests];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v7)
  {
    uint64_t v21 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v6);
        }
        uint64_t v9 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v10 = [(HMDXPCRequestTracker *)v22 pendingRequests];
        id v11 = [v10 objectForKeyedSubscript:v9];

        if (v11)
        {
          uint64_t v12 = (void *)MEMORY[0x1D9452090]();
          id v13 = v22;
          HMFGetOSLogHandle();
          id v14 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            id v15 = (id)objc_claimAutoreleasedReturnValue();
            id v16 = [v11 name];
            clientName = v13->_clientName;
            *(_DWORD *)buf = 138544130;
            id v28 = v15;
            __int16 v29 = 2112;
            v30 = v16;
            __int16 v31 = 2112;
            uint64_t v32 = v9;
            __int16 v33 = 2112;
            v34 = clientName;
            _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Canceling pending request %@ (%@) from client '%@' that expects a response", buf, 0x2Au);
          }
          v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:23];
          [(HMDXPCRequestTracker *)v13 _respondToRequest:v11 withPayload:0 error:v18];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v7);
  }

  BOOL v19 = [(HMDXPCRequestTracker *)v22 pendingRequests];
  [v19 removeAllObjects];

  id v20 = [(HMDXPCRequestTracker *)v22 watchdogTimer];
  [v20 suspend];

  os_unfair_lock_unlock(&v22->_lock);
}

- (NSString)clientName
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_clientName;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSSet)requestIdentifiers
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = [(HMDXPCRequestTracker *)self pendingRequests];
  id v6 = [v5 allKeys];
  uint64_t v7 = [v4 setWithArray:v6];

  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v7;
}

uint64_t __35__HMDXPCRequestTracker_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v18_163222;
  logCategory__hmf_once_v18_163222 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end