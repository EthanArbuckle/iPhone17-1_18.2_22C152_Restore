@interface HMMTROTAAnnounceTimer
+ (id)logCategory;
- (HMFTimer)announceTimer;
- (HMMTRAccessoryServer)server;
- (HMMTROTAAnnounceTimer)initWithServer:(id)a3 nodeId:(id)a4 endpoint:(id)a5 queue:(id)a6;
- (NSNumber)endpoint;
- (NSNumber)nodeId;
- (id)logIdentifier;
- (void)setAnnounceTimer:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setNodeId:(id)a3;
- (void)start;
- (void)stop;
- (void)timerDidFire:(id)a3;
@end

@implementation HMMTROTAAnnounceTimer

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_nodeId, 0);
  objc_storeStrong((id *)&self->_announceTimer, 0);
}

- (HMMTRAccessoryServer)server
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  return (HMMTRAccessoryServer *)WeakRetained;
}

- (void)setEndpoint:(id)a3
{
}

- (NSNumber)endpoint
{
  return self->_endpoint;
}

- (void)setNodeId:(id)a3
{
}

- (NSNumber)nodeId
{
  return self->_nodeId;
}

- (void)setAnnounceTimer:(id)a3
{
}

- (HMFTimer)announceTimer
{
  return self->_announceTimer;
}

- (id)logIdentifier
{
  v2 = NSString;
  p_server = &self->_server;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  v5 = [WeakRetained nodeID];
  id v6 = objc_loadWeakRetained((id *)p_server);
  v7 = [v6 fabricID];
  v8 = [v2 stringWithFormat:@"%@/%@", v5, v7];

  return v8;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x2533B64D0]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [(HMMTROTAAnnounceTimer *)v6 server];
    *(_DWORD *)buf = 138543618;
    v15 = v8;
    __int16 v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@OTA Announce triggered for [%@]", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&v6->_server);
  nodeId = v6->_nodeId;
  endpoint = v6->_endpoint;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __38__HMMTROTAAnnounceTimer_timerDidFire___block_invoke;
  v13[3] = &unk_265376E00;
  v13[4] = v6;
  [WeakRetained announceOtaProvider:nodeId providerEndpoint:endpoint immediateAnnouncement:1 completionHandler:v13];
}

void __38__HMMTROTAAnnounceTimer_timerDidFire___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier();
      v9 = [*(id *)(a1 + 32) server];
      int v14 = 138543874;
      v15 = v8;
      __int16 v16 = 2112;
      v17 = v9;
      __int16 v18 = 2112;
      id v19 = v3;
      v10 = "%{public}@OTA Announce failed for server:%@ with Error: %@.";
      v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 32;
LABEL_6:
      _os_log_impl(&dword_252495000, v11, v12, v10, (uint8_t *)&v14, v13);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [*(id *)(a1 + 32) server];
    int v14 = 138543618;
    v15 = v8;
    __int16 v16 = 2112;
    v17 = v9;
    v10 = "%{public}@OTA Announce completed for server:%@.";
    v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 22;
    goto LABEL_6;
  }
}

- (void)stop
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    v7 = [(HMMTROTAAnnounceTimer *)v4 server];
    int v9 = 138543618;
    v10 = v6;
    __int16 v11 = 2112;
    os_log_type_t v12 = v7;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Stop OTA Announce timeout for accessory server [%@]", (uint8_t *)&v9, 0x16u);
  }
  v8 = [(HMMTROTAAnnounceTimer *)v4 announceTimer];
  [v8 suspend];
}

- (void)start
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    [(HMFTimer *)v4->_announceTimer timeInterval];
    uint64_t v8 = v7;
    int v9 = [(HMMTROTAAnnounceTimer *)v4 server];
    int v11 = 138543874;
    os_log_type_t v12 = v6;
    __int16 v13 = 2048;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    __int16 v16 = v9;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting OTA Announce timeout with delay of %f for accessory server [%@]", (uint8_t *)&v11, 0x20u);
  }
  v10 = [(HMMTROTAAnnounceTimer *)v4 announceTimer];
  [v10 resume];
}

- (HMMTROTAAnnounceTimer)initWithServer:(id)a3 nodeId:(id)a4 endpoint:(id)a5 queue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMMTROTAAnnounceTimer;
  uint64_t v14 = [(HMMTROTAAnnounceTimer *)&v19 init];
  __int16 v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_server, v10);
    objc_storeStrong((id *)&v15->_nodeId, a4);
    objc_storeStrong((id *)&v15->_endpoint, a5);
    uint64_t v16 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:(double)(arc4random_uniform(0x258u) + 300)];
    announceTimer = v15->_announceTimer;
    v15->_announceTimer = (HMFTimer *)v16;

    [(HMFTimer *)v15->_announceTimer setDelegateQueue:v13];
    [(HMFTimer *)v15->_announceTimer setDelegate:v15];
  }

  return v15;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5 != -1) {
    dispatch_once(&logCategory__hmf_once_t5, &__block_literal_global_3286);
  }
  v2 = (void *)logCategory__hmf_once_v6;
  return v2;
}

uint64_t __36__HMMTROTAAnnounceTimer_logCategory__block_invoke()
{
  logCategory__hmf_once_id v6 = HMFCreateOSLogHandle();
  return MEMORY[0x270F9A758]();
}

@end