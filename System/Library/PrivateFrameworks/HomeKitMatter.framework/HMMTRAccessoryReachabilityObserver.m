@interface HMMTRAccessoryReachabilityObserver
+ (id)logCategory;
- (HMMTRAccessoryReachabilityObserver)initWithQueue:(id)a3;
- (HMMTRAccessoryServer)targetServer;
- (OS_dispatch_queue)workQueue;
- (id)completionBlock;
- (id)logIdentifier;
- (void)indicateNotificationFromServer:(id)a3 notifyType:(unint64_t)a4 withDictionary:(id)a5;
- (void)setCompletionBlock:(id)a3;
- (void)setTargetServer:(id)a3;
- (void)startObservingReachabilityForAccessoryServer:(id)a3 completion:(id)a4;
- (void)stopObservingReachabilityWithError:(id)a3;
@end

@implementation HMMTRAccessoryReachabilityObserver

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_destroyWeak((id *)&self->_targetServer);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setTargetServer:(id)a3
{
}

- (HMMTRAccessoryServer)targetServer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetServer);
  return (HMMTRAccessoryServer *)WeakRetained;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (id)logIdentifier
{
  v2 = NSString;
  p_targetServer = &self->_targetServer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetServer);
  v5 = [WeakRetained nodeID];
  id v6 = objc_loadWeakRetained((id *)p_targetServer);
  v7 = [v6 fabricID];
  v8 = [v2 stringWithFormat:@"%@/%@", v5, v7];

  return v8;
}

- (void)indicateNotificationFromServer:(id)a3 notifyType:(unint64_t)a4 withDictionary:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    if (a4 == 1)
    {
      v13 = [(HMMTRAccessoryReachabilityObserver *)self targetServer];
      if (v13)
      {
        if (HMFEqualObjects())
        {
          if (v9 && objc_msgSend(v9, "hmf_BOOLForKey:", *MEMORY[0x263F353F8]))
          {
            v14 = (void *)MEMORY[0x2533B64D0]();
            v15 = self;
            v16 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              v17 = HMFGetLogIdentifier();
              v18 = [v13 nodeID];
              *(_DWORD *)buf = 138543618;
              v41 = v17;
              __int16 v42 = 2112;
              unint64_t v43 = (unint64_t)v18;
              _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@Accessory server with nodeID %@ became reachable", buf, 0x16u);
            }
            v19 = [(HMMTRAccessoryReachabilityObserver *)v15 completionBlock];
            [(HMMTRAccessoryReachabilityObserver *)v15 setCompletionBlock:0];
            if (v19)
            {
              v20 = [(HMMTRAccessoryReachabilityObserver *)v15 workQueue];
              block[0] = MEMORY[0x263EF8330];
              block[1] = 3221225472;
              block[2] = __95__HMMTRAccessoryReachabilityObserver_indicateNotificationFromServer_notifyType_withDictionary___block_invoke;
              block[3] = &unk_265377430;
              id v39 = v19;
              dispatch_async(v20, block);
            }
            goto LABEL_31;
          }
          v30 = (void *)MEMORY[0x2533B64D0]();
          v31 = self;
          v32 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            v33 = HMFGetLogIdentifier();
            v37 = [v13 nodeID];
            *(_DWORD *)buf = 138543618;
            v41 = v33;
            __int16 v42 = 2112;
            unint64_t v43 = (unint64_t)v37;
            _os_log_impl(&dword_252495000, v32, OS_LOG_TYPE_INFO, "%{public}@Accessory server with nodeID %@ is currently unreachable, still waiting for reachable notification", buf, 0x16u);

            goto LABEL_29;
          }
LABEL_30:

LABEL_31:

          goto LABEL_32;
        }
        v30 = (void *)MEMORY[0x2533B64D0]();
        v31 = self;
        v32 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          goto LABEL_30;
        }
        v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v41 = v33;
        __int16 v42 = 2112;
        unint64_t v43 = (unint64_t)v13;
        __int16 v44 = 2112;
        id v45 = v12;
        v34 = "%{public}@Expecting notification for accessory server %@, received notification for accessory server %@, ignoring";
        v35 = v32;
        uint32_t v36 = 32;
      }
      else
      {
        v30 = (void *)MEMORY[0x2533B64D0]();
        v31 = self;
        v32 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          goto LABEL_30;
        }
        v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v41 = v33;
        __int16 v42 = 2112;
        unint64_t v43 = (unint64_t)v12;
        v34 = "%{public}@Not expected any notification for any server, but received notification for accessory server %@, ignoring";
        v35 = v32;
        uint32_t v36 = 22;
      }
      _os_log_impl(&dword_252495000, v35, OS_LOG_TYPE_ERROR, v34, buf, v36);
LABEL_29:

      goto LABEL_30;
    }
    uint64_t v26 = MEMORY[0x2533B64D0]();
    v27 = self;
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v41 = v29;
      __int16 v42 = 2048;
      unint64_t v43 = a4;
      __int16 v44 = 2112;
      id v45 = v12;
      _os_log_impl(&dword_252495000, v28, OS_LOG_TYPE_ERROR, "%{public}@Received unexpected notification %lu accessory server, ignoring %@", buf, 0x20u);
    }
    v25 = (void *)v26;
  }
  else
  {
    uint64_t v21 = MEMORY[0x2533B64D0]();
    v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v41 = v24;
      __int16 v42 = 2112;
      unint64_t v43 = (unint64_t)v10;
      _os_log_impl(&dword_252495000, v23, OS_LOG_TYPE_ERROR, "%{public}@Received notification for a non-matter accessory server, ignoring %@", buf, 0x16u);
    }
    v25 = (void *)v21;
  }
LABEL_32:
}

uint64_t __95__HMMTRAccessoryReachabilityObserver_indicateNotificationFromServer_notifyType_withDictionary___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopObservingReachabilityWithError:(id)a3
{
  id v4 = a3;
  v5 = [(HMMTRAccessoryReachabilityObserver *)self completionBlock];

  if (v5)
  {
    id v6 = [(HMMTRAccessoryReachabilityObserver *)self completionBlock];
    [(HMMTRAccessoryReachabilityObserver *)self setCompletionBlock:0];
    v7 = [(HMMTRAccessoryReachabilityObserver *)self workQueue];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __73__HMMTRAccessoryReachabilityObserver_stopObservingReachabilityWithError___block_invoke;
    v14 = &unk_2653770F0;
    id v16 = v6;
    id v15 = v4;
    id v8 = v6;
    dispatch_async(v7, &v11);
  }
  id v9 = [(HMMTRAccessoryReachabilityObserver *)self targetServer];
  id v10 = v9;
  if (v9) {
    [v9 unregisterForNotifications:self];
  }
  [(HMMTRAccessoryReachabilityObserver *)self setTargetServer:0];
}

void __73__HMMTRAccessoryReachabilityObserver_stopObservingReachabilityWithError___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    v2 = *(void (**)(uint64_t))(v1 + 16);
    uint64_t v3 = *(void *)(a1 + 40);
    v2(v3);
  }
  else
  {
    id v4 = [MEMORY[0x263F087E8] hmfErrorWithCode:12];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v4);
  }
}

- (void)startObservingReachabilityForAccessoryServer:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  id v8 = [(HMMTRAccessoryReachabilityObserver *)self completionBlock];

  if (v8)
  {
    id v9 = [(HMMTRAccessoryReachabilityObserver *)self completionBlock];
    [(HMMTRAccessoryReachabilityObserver *)self setCompletionBlock:0];
    id v10 = [(HMMTRAccessoryReachabilityObserver *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __94__HMMTRAccessoryReachabilityObserver_startObservingReachabilityForAccessoryServer_completion___block_invoke;
    block[3] = &unk_265377430;
    id v25 = v9;
    id v11 = v9;
    dispatch_async(v10, block);
  }
  uint64_t v12 = (void *)MEMORY[0x2533B64D0]();
  v13 = self;
  v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    id v16 = [v6 nodeID];
    *(_DWORD *)buf = 138543618;
    v27 = v15;
    __int16 v28 = 2112;
    v29 = v16;
    _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, "%{public}@Starting reachability observation for accessory server with nodeID %@", buf, 0x16u);
  }
  v17 = [v6 matterDevice];
  uint64_t v18 = [v17 state];

  if (v18 == 1)
  {
    v19 = (void *)MEMORY[0x2533B64D0]();
    v20 = v13;
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = HMFGetLogIdentifier();
      v23 = [v6 nodeID];
      *(_DWORD *)buf = 138543618;
      v27 = v22;
      __int16 v28 = 2112;
      v29 = v23;
      _os_log_impl(&dword_252495000, v21, OS_LOG_TYPE_INFO, "%{public}@Accessory server with nodeID %@ was already reachable, replying immediately", buf, 0x16u);
    }
    v7[2](v7, 0);
  }
  else
  {
    [(HMMTRAccessoryReachabilityObserver *)v13 setTargetServer:v6];
    [(HMMTRAccessoryReachabilityObserver *)v13 setCompletionBlock:v7];
    [v6 registerForNotifications:v13];
  }
}

void __94__HMMTRAccessoryReachabilityObserver_startObservingReachabilityForAccessoryServer_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] hmfErrorWithCode:12];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (HMMTRAccessoryReachabilityObserver)initWithQueue:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMMTRAccessoryReachabilityObserver;
  id v6 = [(HMMTRAccessoryReachabilityObserver *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workQueue, a3);
    objc_storeWeak((id *)&v7->_targetServer, 0);
    id completionBlock = v7->_completionBlock;
    v7->_id completionBlock = 0;
  }
  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_5335 != -1) {
    dispatch_once(&logCategory__hmf_once_t9_5335, &__block_literal_global_5336);
  }
  id v2 = (void *)logCategory__hmf_once_v10_5337;
  return v2;
}

uint64_t __49__HMMTRAccessoryReachabilityObserver_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v10_5337;
  logCategory__hmf_once_v10_5337 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end