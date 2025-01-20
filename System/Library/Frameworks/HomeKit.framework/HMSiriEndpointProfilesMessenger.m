@interface HMSiriEndpointProfilesMessenger
+ (id)logCategory;
+ (id)messageTargetUUIDWithHomeUUID:(id)a3;
- (HMFMessageDispatcher)messageDispatcher;
- (HMSiriEndpointProfilesMessenger)initWithMessageTargetUUID:(id)a3 messageDispatcher:(id)a4;
- (NSUUID)messageTargetUUID;
- (id)logIdentifier;
- (void)sendApplyOnboardingSelectionsRequestWithAccessoryUUID:(id)a3 onboardingSelections:(id)a4 completionHandler:(id)a5;
- (void)sendDeleteSiriHistoryRequestWithAccessoryUUID:(id)a3 completionHandler:(id)a4;
@end

@implementation HMSiriEndpointProfilesMessenger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageDispatcher, 0);

  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)messageTargetUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (id)logIdentifier
{
  v2 = [(HMSiriEndpointProfilesMessenger *)self messageTargetUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)sendDeleteSiriHistoryRequestWithAccessoryUUID:(id)a3 completionHandler:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x19F3A64A0]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v29 = v11;
    __int16 v30 = 2112;
    id v31 = v6;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Sending delete siri history request with accessory UUID: %@", buf, 0x16u);
  }
  v12 = [[HMSiriEndpointDeleteSiriHistoryMessagePayload alloc] initWithAccessoryUUID:v6];
  id v13 = objc_alloc(MEMORY[0x1E4F65488]);
  v14 = [(HMSiriEndpointProfilesMessenger *)v9 messageTargetUUID];
  v15 = (void *)[v13 initWithTarget:v14];

  id v16 = objc_alloc(MEMORY[0x1E4F654B0]);
  v17 = +[HMSiriEndpointDeleteSiriHistoryMessagePayload messageName];
  v18 = [(HMSiriEndpointDeleteSiriHistoryMessagePayload *)v12 payloadCopy];
  v19 = (void *)[v16 initWithName:v17 destination:v15 payload:v18];

  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __99__HMSiriEndpointProfilesMessenger_sendDeleteSiriHistoryRequestWithAccessoryUUID_completionHandler___block_invoke;
  v25 = &unk_1E5944EF0;
  v26 = v9;
  id v27 = v7;
  id v20 = v7;
  [v19 setResponseHandler:&v22];
  v21 = [(HMSiriEndpointProfilesMessenger *)v9 messageDispatcher];
  [v21 sendMessage:v19];
}

void __99__HMSiriEndpointProfilesMessenger_sendDeleteSiriHistoryRequestWithAccessoryUUID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = *(id *)(a1 + 32);
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      v12 = v10;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Delete siri history message responded with error: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)sendApplyOnboardingSelectionsRequestWithAccessoryUUID:(id)a3 onboardingSelections:(id)a4 completionHandler:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = (void *)MEMORY[0x19F3A64A0]();
  v12 = self;
  __int16 v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    uint64_t v32 = v14;
    __int16 v33 = 2112;
    id v34 = v8;
    __int16 v35 = 2112;
    id v36 = v9;
    _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Sending apply onboarding selections request with accessory UUID: %@ onboarding selections: %@", buf, 0x20u);
  }
  uint64_t v15 = [[HMSiriEndpointApplyOnboardingSelectionsPayload alloc] initWithAccessoryUUID:v8 onboardingSelections:v9];
  id v16 = objc_alloc(MEMORY[0x1E4F65488]);
  v17 = [(HMSiriEndpointProfilesMessenger *)v12 messageTargetUUID];
  v18 = (void *)[v16 initWithTarget:v17];

  id v19 = objc_alloc(MEMORY[0x1E4F654B0]);
  id v20 = [(HMSiriEndpointApplyOnboardingSelectionsPayload *)v15 payloadCopy];
  v21 = (void *)[v19 initWithName:@"HMSiriEndpointApplyOnboardingSelectionsRequestMessage" destination:v18 payload:v20];

  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  id v27 = __128__HMSiriEndpointProfilesMessenger_sendApplyOnboardingSelectionsRequestWithAccessoryUUID_onboardingSelections_completionHandler___block_invoke;
  v28 = &unk_1E5944EF0;
  v29 = v12;
  id v30 = v10;
  id v22 = v10;
  [v21 setResponseHandler:&v25];
  uint64_t v23 = [(HMSiriEndpointProfilesMessenger *)v12 messageDispatcher];
  v24 = (void *)[v21 copy];
  [v23 sendMessage:v24];
}

void __128__HMSiriEndpointProfilesMessenger_sendApplyOnboardingSelectionsRequestWithAccessoryUUID_onboardingSelections_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = HMFGetLogIdentifier();
      int v22 = 138543618;
      uint64_t v23 = v11;
      __int16 v24 = 2112;
      id v25 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Send apply onboarding selections request responded with error: %@", (uint8_t *)&v22, 0x16u);
    }
LABEL_5:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_16;
  }
  if (!v6)
  {
    id v14 = (void *)MEMORY[0x19F3A64A0]();
    id v15 = *(id *)(a1 + 32);
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      int v22 = 138543362;
      uint64_t v23 = v17;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to get apply onboarding selections response payload", (uint8_t *)&v22, 0xCu);
    }
    id v5 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
    goto LABEL_5;
  }
  v12 = [[HMSiriEndpointApplyOnboardingSelectionsResponsePayload alloc] initWithPayload:v6];
  __int16 v13 = v12;
  if (v12)
  {
    (*(void (**)(void, void, int64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, [(HMSiriEndpointApplyOnboardingSelectionsResponsePayload *)v12 onboardingResult]);
    id v5 = 0;
  }
  else
  {
    v18 = (void *)MEMORY[0x19F3A64A0]();
    id v19 = *(id *)(a1 + 32);
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      int v22 = 138543618;
      uint64_t v23 = v21;
      __int16 v24 = 2112;
      id v25 = v7;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode apply onboarding selections response payload: %@", (uint8_t *)&v22, 0x16u);
    }
    id v5 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }

LABEL_16:
}

- (HMSiriEndpointProfilesMessenger)initWithMessageTargetUUID:(id)a3 messageDispatcher:(id)a4
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
    __int16 v13 = (void *)_HMFPreconditionFailure();
    return (HMSiriEndpointProfilesMessenger *)+[HMSiriEndpointProfilesMessenger logCategory];
  }
  v15.receiver = self;
  v15.super_class = (Class)HMSiriEndpointProfilesMessenger;
  id v10 = [(HMSiriEndpointProfilesMessenger *)&v15 init];
  int v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_messageTargetUUID, a3);
    objc_storeStrong((id *)&v11->_messageDispatcher, a4);
  }

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_56050 != -1) {
    dispatch_once(&logCategory__hmf_once_t6_56050, &__block_literal_global_56051);
  }
  v2 = (void *)logCategory__hmf_once_v7_56052;

  return v2;
}

uint64_t __46__HMSiriEndpointProfilesMessenger_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v7_56052;
  logCategory__hmf_once_v7_56052 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)messageTargetUUIDWithHomeUUID:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F29128];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithUUIDString:@"CFD1F2B8-1A6D-447F-B7CC-23AE501D9033"];
  id v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = [v4 UUIDString];

  id v8 = [v7 dataUsingEncoding:4];
  id v9 = objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v5, v8);

  return v9;
}

@end