@interface HMDAppleMediaAccessoryMessageRouter
+ (id)logCategory;
- (HMDAppleMediaAccessoryMessageRouter)initWithIdentifier:(id)a3 messageDispatcher:(id)a4;
- (HMDAppleMediaAccessoryMessageRouterDataSource)dataSource;
- (HMFMessageDispatcher)messageDispatcher;
- (NSUUID)identifier;
- (id)dataSourceDeviceForMessage:(id)a3;
- (id)logIdentifier;
- (void)relayMessage:(id)a3 device:(id)a4 allowRemoteRelayFromPrimary:(BOOL)a5;
- (void)routeMessage:(id)a3 allowRemoteRelayFromPrimary:(BOOL)a4 localHandler:(id)a5;
- (void)routeMessage:(id)a3 localHandler:(id)a4;
- (void)setDataSource:(id)a3;
@end

@implementation HMDAppleMediaAccessoryMessageRouter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDataSource:(id)a3
{
}

- (HMDAppleMediaAccessoryMessageRouterDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDAppleMediaAccessoryMessageRouterDataSource *)WeakRetained;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDAppleMediaAccessoryMessageRouter *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)dataSourceDeviceForMessage:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDAppleMediaAccessoryMessageRouter *)self dataSource];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 deviceForAppleMediaAccessoryMessageRouter:self message:v4];
  }
  else
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to data source device due to no data source", (uint8_t *)&v13, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

- (void)relayMessage:(id)a3 device:(id)a4 allowRemoteRelayFromPrimary:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = [(HMDAppleMediaAccessoryMessageRouter *)self dataSource];
  if (![v8 isRemote])
  {
LABEL_7:
    v16 = (void *)[v8 copy];
    v17 = (void *)[v16 mutableCopy];

    [v17 setRemote:1];
    [v17 setSecureRemote:1];
    [v17 setRemoteRestriction:-1];
    v18 = [HMDRemoteDeviceMessageDestination alloc];
    v19 = [v8 destination];
    v20 = [v19 target];
    v21 = [(HMDRemoteDeviceMessageDestination *)v18 initWithTarget:v20 device:v9];
    [v17 setDestination:v21];

    v22 = (void *)MEMORY[0x230FBD990]();
    v23 = self;
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = HMFGetLogIdentifier();
      int v31 = 138543618;
      v32 = v25;
      __int16 v33 = 2112;
      id v34 = v17;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Relaying remote message: %@", (uint8_t *)&v31, 0x16u);
    }
    v26 = [(HMDAppleMediaAccessoryMessageRouter *)v23 messageDispatcher];
    [v26 sendMessage:v17];

    goto LABEL_13;
  }
  if (v5 && [v10 isCurrentDevicePrimaryResident])
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = HMFGetLogIdentifier();
      uint64_t v15 = [v8 identifier];
      int v31 = 138543618;
      v32 = v14;
      __int16 v33 = 2112;
      id v34 = v15;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Allowing relay for message: %@", (uint8_t *)&v31, 0x16u);
    }
    goto LABEL_7;
  }
  v27 = (void *)MEMORY[0x230FBD990]();
  v28 = self;
  v29 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    v30 = HMFGetLogIdentifier();
    int v31 = 138543618;
    v32 = v30;
    __int16 v33 = 2112;
    id v34 = v8;
    _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to relay message due to being a remote message: %@", (uint8_t *)&v31, 0x16u);
  }
  v17 = [MEMORY[0x263F087E8] hmfErrorWithCode:12];
  [v8 respondWithError:v17];
LABEL_13:
}

- (void)routeMessage:(id)a3 allowRemoteRelayFromPrimary:(BOOL)a4 localHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void (**)(id, id))a5;
  v10 = (void *)MEMORY[0x230FBD990]();
  v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = HMFGetLogIdentifier();
    int v21 = 138543618;
    v22 = v13;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Routing message: %@", (uint8_t *)&v21, 0x16u);
  }
  v14 = [(HMDAppleMediaAccessoryMessageRouter *)v11 dataSourceDeviceForMessage:v8];
  uint64_t v15 = v14;
  if (v14)
  {
    if ([v14 isCurrentDevice]) {
      v9[2](v9, v8);
    }
    else {
      [(HMDAppleMediaAccessoryMessageRouter *)v11 relayMessage:v8 device:v15 allowRemoteRelayFromPrimary:v6];
    }
  }
  else
  {
    v16 = [MEMORY[0x263F087E8] hmfErrorWithCode:4];
    v17 = (void *)MEMORY[0x230FBD990]();
    v18 = v11;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      int v21 = 138543618;
      v22 = v20;
      __int16 v23 = 2112;
      id v24 = v16;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to data source device while routing message error: %@", (uint8_t *)&v21, 0x16u);
    }
    [v8 respondWithError:v16];
  }
}

- (void)routeMessage:(id)a3 localHandler:(id)a4
{
}

- (HMDAppleMediaAccessoryMessageRouter)initWithIdentifier:(id)a3 messageDispatcher:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  id v9 = v8;
  if (!v8)
  {
LABEL_7:
    int v13 = (void *)_HMFPreconditionFailure();
    return (HMDAppleMediaAccessoryMessageRouter *)+[HMDAppleMediaAccessoryMessageRouter logCategory];
  }
  v15.receiver = self;
  v15.super_class = (Class)HMDAppleMediaAccessoryMessageRouter;
  v10 = [(HMDAppleMediaAccessoryMessageRouter *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_identifier, a3);
    objc_storeStrong((id *)&v11->_messageDispatcher, a4);
  }

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_148607 != -1) {
    dispatch_once(&logCategory__hmf_once_t6_148607, &__block_literal_global_148608);
  }
  v2 = (void *)logCategory__hmf_once_v7_148609;
  return v2;
}

void __50__HMDAppleMediaAccessoryMessageRouter_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v7_148609;
  logCategory__hmf_once_v7_148609 = v0;
}

@end