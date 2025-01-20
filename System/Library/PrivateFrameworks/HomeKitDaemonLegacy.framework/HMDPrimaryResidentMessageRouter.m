@interface HMDPrimaryResidentMessageRouter
+ (id)logCategory;
- (HMDPrimaryResidentMessageRouter)initWithHomeUUID:(id)a3 messageDispatcher:(id)a4 metricsDispatcher:(id)a5;
- (HMDPrimaryResidentMessageRouterDataSource)dataSource;
- (HMDPrimaryResidentMessageRouterMetricsDispatcher)metricsDispatcher;
- (HMFMessageDispatcher)messageDispatcher;
- (NSUUID)homeUUID;
- (id)dataSourcePrimaryResidentDeviceWithMessage:(id)a3;
- (id)logIdentifier;
- (void)relayMessage:(id)a3 device:(id)a4;
- (void)routeMessage:(id)a3 allowRemoteRelayFromPrimary:(BOOL)a4 localHandler:(id)a5;
- (void)routeMessage:(id)a3 localHandler:(id)a4;
- (void)setDataSource:(id)a3;
@end

@implementation HMDPrimaryResidentMessageRouter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsDispatcher, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (HMDPrimaryResidentMessageRouterMetricsDispatcher)metricsDispatcher
{
  return (HMDPrimaryResidentMessageRouterMetricsDispatcher *)objc_getProperty(self, a2, 32, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDataSource:(id)a3
{
}

- (HMDPrimaryResidentMessageRouterDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDPrimaryResidentMessageRouterDataSource *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDPrimaryResidentMessageRouter *)self homeUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)relayMessage:(id)a3 device:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isRemote])
  {
    v8 = (void *)MEMORY[0x1D9452090]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v24 = 138543618;
      v25 = v11;
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot relay message that is already remote: %@", (uint8_t *)&v24, 0x16u);
    }
    v12 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:3202];
    [v6 respondWithError:v12];

    v13 = [(HMDPrimaryResidentMessageRouter *)v9 metricsDispatcher];
    v14 = [v6 name];
    [v13 submitFailureEventWithMessageName:v14 failureType:1];
  }
  else
  {
    v15 = (void *)[v6 copy];
    v13 = (void *)[v15 mutableCopy];

    [v13 setRemote:1];
    [v13 setSecureRemote:1];
    v16 = [HMDRemoteDeviceMessageDestination alloc];
    v17 = [v6 destination];
    v18 = [v17 target];
    v19 = [(HMDRemoteDeviceMessageDestination *)v16 initWithTarget:v18 device:v7];
    [v13 setDestination:v19];

    v20 = (void *)MEMORY[0x1D9452090]();
    v21 = self;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = HMFGetLogIdentifier();
      int v24 = 138543618;
      v25 = v23;
      __int16 v26 = 2112;
      id v27 = v13;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Relaying remote message: %@", (uint8_t *)&v24, 0x16u);
    }
    v14 = [(HMDPrimaryResidentMessageRouter *)v21 messageDispatcher];
    [v14 sendMessage:v13];
  }
}

- (void)routeMessage:(id)a3 allowRemoteRelayFromPrimary:(BOOL)a4 localHandler:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (void (**)(id, id))a5;
  v9 = (void *)MEMORY[0x1D9452090]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    v13 = [v7 shortDescription];
    int v38 = 138543618;
    v39 = v12;
    __int16 v40 = 2112;
    v41 = v13;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Routing message: %@", (uint8_t *)&v38, 0x16u);
  }
  v14 = [(HMDPrimaryResidentMessageRouter *)v10 dataSourcePrimaryResidentDeviceWithMessage:v7];
  v15 = v14;
  if (!v14)
  {
    v17 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2032];
    v18 = (void *)MEMORY[0x1D9452090]();
    v19 = v10;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      int v38 = 138543618;
      v39 = v21;
      __int16 v40 = 2112;
      v41 = v17;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to data source primary resident with error: %@", (uint8_t *)&v38, 0x16u);
    }
    [v7 respondWithError:v17];
    v22 = [(HMDPrimaryResidentMessageRouter *)v19 metricsDispatcher];
    v23 = [v7 name];
    int v24 = v22;
    v25 = v23;
    uint64_t v26 = 3;
    goto LABEL_14;
  }
  if (([v14 isConfirmed] & 1) == 0)
  {
    v17 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2033];
    id v27 = (void *)MEMORY[0x1D9452090]();
    uint64_t v28 = v10;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      int v38 = 138543618;
      v39 = v30;
      __int16 v40 = 2112;
      v41 = v17;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to get confirmed primary resident device with error: %@", (uint8_t *)&v38, 0x16u);
    }
    [v7 respondWithError:v17];
    v22 = [(HMDPrimaryResidentMessageRouter *)v28 metricsDispatcher];
    v23 = [v7 name];
    int v24 = v22;
    v25 = v23;
    uint64_t v26 = 4;
LABEL_14:
    [v24 submitFailureEventWithMessageName:v25 failureType:v26];

    goto LABEL_15;
  }
  v16 = [v15 device];
  if (v16)
  {
    v17 = v16;
    if ([v16 isCurrentDevice]) {
      v8[2](v8, v7);
    }
    else {
      [(HMDPrimaryResidentMessageRouter *)v10 relayMessage:v7 device:v17];
    }
  }
  else
  {
    v31 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2034];
    v32 = (void *)MEMORY[0x1D9452090]();
    v33 = v10;
    v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v35 = HMFGetLogIdentifier();
      int v38 = 138543618;
      v39 = v35;
      __int16 v40 = 2112;
      v41 = v31;
      _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to get destination device from primary resident device with error: %@", (uint8_t *)&v38, 0x16u);
    }
    [v7 respondWithError:v31];
    v36 = [(HMDPrimaryResidentMessageRouter *)v33 metricsDispatcher];
    v37 = [v7 name];
    [v36 submitFailureEventWithMessageName:v37 failureType:5];

    v17 = 0;
  }
LABEL_15:
}

- (void)routeMessage:(id)a3 localHandler:(id)a4
{
}

- (id)dataSourcePrimaryResidentDeviceWithMessage:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDPrimaryResidentMessageRouter *)self dataSource];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 primaryResidentDeviceForPrimaryResidentMessageRouter:self];
  }
  else
  {
    v8 = (void *)MEMORY[0x1D9452090]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v15 = 138543362;
      v16 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to data source primary resident device due to no data source", (uint8_t *)&v15, 0xCu);
    }
    v12 = [(HMDPrimaryResidentMessageRouter *)v9 metricsDispatcher];
    v13 = [v4 name];
    [v12 submitFailureEventWithMessageName:v13 failureType:2];

    id v7 = 0;
  }

  return v7;
}

- (HMDPrimaryResidentMessageRouter)initWithHomeUUID:(id)a3 messageDispatcher:(id)a4 metricsDispatcher:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!v10)
  {
LABEL_7:
    v16 = (void *)_HMFPreconditionFailure();
    return (HMDPrimaryResidentMessageRouter *)+[HMDPrimaryResidentMessageRouter logCategory];
  }
  v12 = v11;
  v18.receiver = self;
  v18.super_class = (Class)HMDPrimaryResidentMessageRouter;
  v13 = [(HMDPrimaryResidentMessageRouter *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_homeUUID, a3);
    objc_storeStrong((id *)&v14->_messageDispatcher, a4);
    objc_storeStrong((id *)&v14->_metricsDispatcher, a5);
  }

  return v14;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_11976 != -1) {
    dispatch_once(&logCategory__hmf_once_t7_11976, &__block_literal_global_11977);
  }
  v2 = (void *)logCategory__hmf_once_v8_11978;
  return v2;
}

uint64_t __46__HMDPrimaryResidentMessageRouter_logCategory__block_invoke()
{
  logCategory__hmf_once_v8_11978 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

@end