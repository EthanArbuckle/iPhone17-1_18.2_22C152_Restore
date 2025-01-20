@interface HMDCHIPThreadNetworkEventListener
+ (id)logCategory;
- (BOOL)pendingRadioStateChangeNotification;
- (HMDCHIPThreadNetworkEventListener)initWithThreadResidentCommissioner:(id)a3;
- (HMDCHIPThreadNetworkEventListenerDelegate)eventListenerDelegate;
- (HMDThreadResidentCommissioner)threadResidentCommissioner;
- (int64_t)threadNetworkConnectionState;
- (int64_t)threadNetworkNodeType;
- (void)dealloc;
- (void)setEventListenerDelegate:(id)a3;
- (void)setPendingRadioStateChangeNotification:(BOOL)a3;
- (void)setThreadNetworkConnectionState:(int64_t)a3;
- (void)setThreadNetworkNodeType:(int64_t)a3;
- (void)setThreadResidentCommissioner:(id)a3;
- (void)stopListeningForEvents;
- (void)threadBTCallStateChange:(id)a3;
- (void)threadNetworkStateChange:(id)a3;
@end

@implementation HMDCHIPThreadNetworkEventListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadResidentCommissioner, 0);
  objc_destroyWeak((id *)&self->_eventListenerDelegate);
}

- (void)setPendingRadioStateChangeNotification:(BOOL)a3
{
  self->_pendingRadioStateChangeNotification = a3;
}

- (BOOL)pendingRadioStateChangeNotification
{
  return self->_pendingRadioStateChangeNotification;
}

- (void)setThreadResidentCommissioner:(id)a3
{
}

- (HMDThreadResidentCommissioner)threadResidentCommissioner
{
  return (HMDThreadResidentCommissioner *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEventListenerDelegate:(id)a3
{
}

- (HMDCHIPThreadNetworkEventListenerDelegate)eventListenerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventListenerDelegate);
  return (HMDCHIPThreadNetworkEventListenerDelegate *)WeakRetained;
}

- (void)setThreadNetworkConnectionState:(int64_t)a3
{
  self->_threadNetworkConnectionState = a3;
}

- (int64_t)threadNetworkConnectionState
{
  return self->_threadNetworkConnectionState;
}

- (void)setThreadNetworkNodeType:(int64_t)a3
{
  self->_threadNetworkNodeType = a3;
}

- (int64_t)threadNetworkNodeType
{
  return self->_threadNetworkNodeType;
}

- (void)threadBTCallStateChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 callState];
  if (!v5)
  {
LABEL_7:
    uint64_t v6 = 0;
    goto LABEL_8;
  }
  if (v5 != 1)
  {
    v7 = (void *)MEMORY[0x230FBD990]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      v13 = v10;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unexpected event %@", (uint8_t *)&v12, 0x16u);
    }
    goto LABEL_7;
  }
  uint64_t v6 = 1;
LABEL_8:
  v11 = [(HMDCHIPThreadNetworkEventListener *)self eventListenerDelegate];
  if (v11 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v11 handleThreadBTCallStateChange:v6];
  }
}

- (void)threadNetworkStateChange:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x230FBD990]();
  uint64_t v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v21 = v8;
    __int16 v22 = 2112;
    id v23 = v4;
    __int16 v24 = 2048;
    uint64_t v25 = [v4 eventType];
    __int16 v26 = 2048;
    uint64_t v27 = [v4 eventValue];
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@threadNetworkStateChange - received event %@, type %ld, value %ld", buf, 0x2Au);
  }
  v9 = [(HMDCHIPThreadNetworkEventListener *)v6 eventListenerDelegate];
  uint64_t v10 = [v4 eventType];
  if (v10 == 1)
  {
    -[HMDCHIPThreadNetworkEventListener setThreadNetworkNodeType:](v6, "setThreadNetworkNodeType:", [v4 eventValue]);
  }
  else if (v10)
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    int v12 = v6;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __int16 v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v21 = v14;
      __int16 v22 = 2112;
      id v23 = v4;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unexpected event %@", buf, 0x16u);
    }
  }
  else
  {
    -[HMDCHIPThreadNetworkEventListener setThreadNetworkConnectionState:](v6, "setThreadNetworkConnectionState:", [v4 eventValue]);
  }
  if (![(HMDCHIPThreadNetworkEventListener *)v6 pendingRadioStateChangeNotification])
  {
    [(HMDCHIPThreadNetworkEventListener *)v6 setPendingRadioStateChangeNotification:1];
    objc_initWeak((id *)buf, v6);
    dispatch_time_t v15 = dispatch_time(0, 50000000);
    uint64_t v16 = dispatch_get_global_queue(21, 0);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __62__HMDCHIPThreadNetworkEventListener_threadNetworkStateChange___block_invoke;
    v17[3] = &unk_264A2C148;
    objc_copyWeak(&v19, (id *)buf);
    id v18 = v9;
    dispatch_after(v15, v16, v17);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
}

void __62__HMDCHIPThreadNetworkEventListener_threadNetworkStateChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setPendingRadioStateChangeNotification:0];
  if (*(void *)(a1 + 32) && (objc_opt_respondsToSelector() & 1) != 0) {
    [*(id *)(a1 + 32) handleNetworkStateChange];
  }
}

- (void)stopListeningForEvents
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = [(HMDCHIPThreadNetworkEventListener *)self threadResidentCommissioner];
  [v3 unregisterForThreadNetworkEvents:self];

  id v4 = (void *)MEMORY[0x230FBD990]([(HMDCHIPThreadNetworkEventListener *)self setThreadResidentCommissioner:0]);
  uint64_t v5 = self;
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@stopped listening for events", (uint8_t *)&v8, 0xCu);
  }
}

- (void)dealloc
{
  threadResidentCommissioner = self->_threadResidentCommissioner;
  if (threadResidentCommissioner) {
    [(HMDThreadResidentCommissioner *)threadResidentCommissioner unregisterForThreadNetworkEvents:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)HMDCHIPThreadNetworkEventListener;
  [(HMDCHIPThreadNetworkEventListener *)&v4 dealloc];
}

- (HMDCHIPThreadNetworkEventListener)initWithThreadResidentCommissioner:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDCHIPThreadNetworkEventListener;
  uint64_t v6 = [(HMDCHIPThreadNetworkEventListener *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_threadResidentCommissioner, a3);
    int v8 = (void *)MEMORY[0x230FBD990]([(HMDThreadResidentCommissioner *)v7->_threadResidentCommissioner registerForThreadNetworkEvents:v7]);
    v9 = v7;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      dispatch_time_t v15 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@started listening for events", buf, 0xCu);
    }
  }

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5_208482 != -1) {
    dispatch_once(&logCategory__hmf_once_t5_208482, &__block_literal_global_208483);
  }
  v2 = (void *)logCategory__hmf_once_v6_208484;
  return v2;
}

void __48__HMDCHIPThreadNetworkEventListener_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v6_208484;
  logCategory__hmf_once_v6_208484 = v0;
}

@end