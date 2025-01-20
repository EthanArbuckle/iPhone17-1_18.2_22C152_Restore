@interface HMMTROTAApplyUpdateRequestTimer
+ (id)logCategory;
- (HMFTimer)updateTimer;
- (HMMTRAccessoryServer)server;
- (HMMTROTAApplyUpdateRequestTimer)initWithServer:(id)a3 otaProvider:(id)a4 queue:(id)a5;
- (HMMTROTAProviderDelegate)otaProvider;
- (id)logIdentifier;
- (void)setOtaProvider:(id)a3;
- (void)setUpdateTimer:(id)a3;
- (void)start;
- (void)stop;
- (void)timerDidFire:(id)a3;
@end

@implementation HMMTROTAApplyUpdateRequestTimer

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_server);
  objc_destroyWeak((id *)&self->_otaProvider);
  objc_storeStrong((id *)&self->_updateTimer, 0);
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
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [(HMMTROTAApplyUpdateRequestTimer *)v6 server];
    int v12 = 138543618;
    v13 = v8;
    __int16 v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_ERROR, "%{public}@OTA apply update request timed out for accessory server [%@]", (uint8_t *)&v12, 0x16u);
  }
  v10 = [(HMMTROTAApplyUpdateRequestTimer *)v6 otaProvider];
  v11 = [(HMMTROTAApplyUpdateRequestTimer *)v6 server];
  [v10 applyUpdateRequestTimerExpiredForAccessoryServer:v11];
}

- (void)stop
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    v7 = [(HMMTROTAApplyUpdateRequestTimer *)v4 server];
    int v9 = 138543618;
    v10 = v6;
    __int16 v11 = 2112;
    int v12 = v7;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Stop OTA apply update request timeout for accessory server [%@]", (uint8_t *)&v9, 0x16u);
  }
  v8 = [(HMMTROTAApplyUpdateRequestTimer *)v4 updateTimer];
  [v8 suspend];
}

- (void)start
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    v7 = [(HMMTROTAApplyUpdateRequestTimer *)v4 server];
    int v9 = 138543618;
    v10 = v6;
    __int16 v11 = 2112;
    int v12 = v7;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting OTA apply update request timeout for accessory server [%@]", (uint8_t *)&v9, 0x16u);
  }
  v8 = [(HMMTROTAApplyUpdateRequestTimer *)v4 updateTimer];
  [v8 resume];
}

- (HMMTROTAApplyUpdateRequestTimer)initWithServer:(id)a3 otaProvider:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMMTROTAApplyUpdateRequestTimer;
  __int16 v11 = [(HMMTROTAApplyUpdateRequestTimer *)&v16 init];
  int v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_server, v8);
    objc_storeWeak((id *)&v12->_otaProvider, v9);
    uint64_t v13 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:300.0];
    updateTimer = v12->_updateTimer;
    v12->_updateTimer = (HMFTimer *)v13;

    [(HMFTimer *)v12->_updateTimer setDelegateQueue:v10];
    [(HMFTimer *)v12->_updateTimer setDelegate:v12];
  }

  return v12;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_1070 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_1070, &__block_literal_global_1071);
  }
  v2 = (void *)logCategory__hmf_once_v4_1072;
  return v2;
}

uint64_t __46__HMMTROTAApplyUpdateRequestTimer_logCategory__block_invoke()
{
  logCategory__hmf_once_v4_1072 = HMFCreateOSLogHandle();
  return MEMORY[0x270F9A758]();
}

@end