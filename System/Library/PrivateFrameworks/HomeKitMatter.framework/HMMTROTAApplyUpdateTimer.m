@interface HMMTROTAApplyUpdateTimer
+ (id)logCategory;
- (HMFTimer)updateTimer;
- (HMMTRAccessoryServer)server;
- (HMMTROTAApplyUpdateTimer)initWithServer:(id)a3 otaProvider:(id)a4 newVersion:(id)a5 delay:(id)a6 queue:(id)a7;
- (HMMTROTAProviderDelegate)otaProvider;
- (NSNumber)expectedVersion;
- (id)logIdentifier;
- (int64_t)retryCount;
- (void)setExpectedVersion:(id)a3;
- (void)setOtaProvider:(id)a3;
- (void)setRetryCount:(int64_t)a3;
- (void)setUpdateTimer:(id)a3;
- (void)start;
- (void)stop;
- (void)timerDidFire:(id)a3;
@end

@implementation HMMTROTAApplyUpdateTimer

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_server);
  objc_destroyWeak((id *)&self->_otaProvider);
  objc_storeStrong((id *)&self->_expectedVersion, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (HMMTRAccessoryServer)server
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  return (HMMTRAccessoryServer *)WeakRetained;
}

- (void)setOtaProvider:(id)a3
{
}

- (HMMTROTAProviderDelegate)otaProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_otaProvider);
  return (HMMTROTAProviderDelegate *)WeakRetained;
}

- (void)setExpectedVersion:(id)a3
{
}

- (NSNumber)expectedVersion
{
  return self->_expectedVersion;
}

- (void)setUpdateTimer:(id)a3
{
}

- (HMFTimer)updateTimer
{
  return self->_updateTimer;
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
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x2533B64D0]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [(HMMTROTAApplyUpdateTimer *)v6 server];
    *(_DWORD *)buf = 138543618;
    v13 = v8;
    __int16 v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@OTA apply timed out for accessory server [%@]", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&v6->_server);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __41__HMMTROTAApplyUpdateTimer_timerDidFire___block_invoke;
  v11[3] = &unk_265378410;
  v11[4] = v6;
  [WeakRetained fetchSoftwareVersion:1 completionHandler:v11];
}

void __41__HMMTROTAApplyUpdateTimer_timerDidFire___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    v9 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_5:

      id v14 = 0;
      goto LABEL_6;
    }
    v10 = HMFGetLogIdentifier();
    *(_DWORD *)v37 = 138543618;
    *(void *)&v37[4] = v10;
    *(_WORD *)&v37[12] = 2112;
    *(void *)&v37[14] = v6;
    v11 = "%{public}@Failed to retrieve software version number: %@";
    v12 = v9;
    uint32_t v13 = 22;
LABEL_4:
    _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_ERROR, v11, v37, v13);

    goto LABEL_5;
  }
  if (!v5)
  {
    v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    v9 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    v10 = HMFGetLogIdentifier();
    *(_DWORD *)v37 = 138543362;
    *(void *)&v37[4] = v10;
    v11 = "%{public}@Failed to retrieve software version number, got nil object";
    v12 = v9;
    uint32_t v13 = 12;
    goto LABEL_4;
  }
  id v14 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v32 = v14;
  }
  else {
    v32 = 0;
  }
  id v33 = v32;

  if (!v33)
  {
    v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v36 = HMFGetLogIdentifier();
      *(_DWORD *)v37 = 138543618;
      *(void *)&v37[4] = v36;
      *(_WORD *)&v37[12] = 2112;
      *(void *)&v37[14] = v14;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve software version number, unexpected object: %@", v37, 0x16u);
    }
    goto LABEL_5;
  }
  v34 = [*(id *)(a1 + 32) expectedVersion];
  int v35 = [v34 isEqualToNumber:v14];

  if (v35)
  {
    v23 = [*(id *)(a1 + 32) otaProvider];
    v24 = [*(id *)(a1 + 32) server];
    v25 = &unk_2702B5F28;
    goto LABEL_10;
  }
LABEL_6:
  v15 = (void *)MEMORY[0x2533B64D0](objc_msgSend(*(id *)(a1 + 32), "setRetryCount:", objc_msgSend(*(id *)(a1 + 32), "retryCount", *(_OWORD *)v37, *(void *)&v37[16]) + 1));
  id v16 = *(id *)(a1 + 32);
  v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = HMFGetLogIdentifier();
    v19 = [*(id *)(a1 + 32) expectedVersion];
    uint64_t v20 = [*(id *)(a1 + 32) retryCount];
    *(_DWORD *)v37 = 138544130;
    *(void *)&v37[4] = v18;
    *(_WORD *)&v37[12] = 2112;
    *(void *)&v37[14] = v19;
    *(_WORD *)&v37[22] = 2112;
    id v38 = v14;
    __int16 v39 = 2048;
    uint64_t v40 = v20;
    _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_ERROR, "%{public}@Expected Version %@, accessory reported %@ [Attempt %ld].", v37, 0x2Au);
  }
  uint64_t v21 = [*(id *)(a1 + 32) retryCount];
  v22 = *(void **)(a1 + 32);
  if (v21 >= 7)
  {
    v23 = [v22 otaProvider];
    v24 = [*(id *)(a1 + 32) server];
    v25 = &unk_2702B5F40;
LABEL_10:
    [v23 applyUpdateTimerExpiredForAccessoryServer:v24 softwareVersion:v14 didTimeout:v25];

    goto LABEL_14;
  }
  if ([v22 retryCount] == 1)
  {
    v26 = [*(id *)(a1 + 32) updateTimer];
    v27 = [v26 delegateQueue];

    v28 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:300.0];
    [*(id *)(a1 + 32) setUpdateTimer:v28];

    v29 = [*(id *)(a1 + 32) updateTimer];
    [v29 setDelegateQueue:v27];

    v30 = *(void **)(a1 + 32);
    v31 = [v30 updateTimer];
    [v31 setDelegate:v30];
  }
  [*(id *)(a1 + 32) start];
LABEL_14:
}

- (void)stop
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    v7 = [(HMMTROTAApplyUpdateTimer *)v4 server];
    int v9 = 138543618;
    v10 = v6;
    __int16 v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Stop OTA apply timeout for accessory server [%@]", (uint8_t *)&v9, 0x16u);
  }
  id v8 = [(HMMTROTAApplyUpdateTimer *)v4 updateTimer];
  [v8 suspend];
}

- (void)start
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    v7 = [(HMMTROTAApplyUpdateTimer *)v4 server];
    int v9 = 138543618;
    v10 = v6;
    __int16 v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting OTA apply timeout for accessory server [%@]", (uint8_t *)&v9, 0x16u);
  }
  id v8 = [(HMMTROTAApplyUpdateTimer *)v4 updateTimer];
  [v8 resume];
}

- (HMMTROTAApplyUpdateTimer)initWithServer:(id)a3 otaProvider:(id)a4 newVersion:(id)a5 delay:(id)a6 queue:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)HMMTROTAApplyUpdateTimer;
  v17 = [(HMMTROTAApplyUpdateTimer *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_server, v12);
    objc_storeStrong((id *)&v18->_expectedVersion, a5);
    v18->_retryCount = 0;
    objc_storeWeak((id *)&v18->_otaProvider, v13);
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x263F42658]), "initWithTimeInterval:options:", 0, (double)(objc_msgSend(v15, "integerValue") + 300));
    updateTimer = v18->_updateTimer;
    v18->_updateTimer = (HMFTimer *)v19;

    [(HMFTimer *)v18->_updateTimer setDelegateQueue:v16];
    [(HMFTimer *)v18->_updateTimer setDelegate:v18];
  }

  return v18;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8 != -1) {
    dispatch_once(&logCategory__hmf_once_t8, &__block_literal_global_9696);
  }
  v2 = (void *)logCategory__hmf_once_v9;
  return v2;
}

uint64_t __39__HMMTROTAApplyUpdateTimer_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v9;
  logCategory__hmf_once_int v9 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end