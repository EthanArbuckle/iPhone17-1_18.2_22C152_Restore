@interface HMDSiriEndpointProfilesMessenger
+ (id)logCategory;
- (HMDMessageRouter)messageRouter;
- (HMDSiriEndpointProfileMessageHandler)messageHandler;
- (HMDSiriEndpointProfilesMessenger)initWithMessageTargetUUID:(id)a3 messageDispatcher:(id)a4 messageRouter:(id)a5 messageHandler:(id)a6;
- (HMFMessageDispatcher)messageDispatcher;
- (NSUUID)messageTargetUUID;
- (id)intermediateApplyOnboardingSelectionsRequestMessageForMessage:(id)a3 error:(id *)a4;
- (id)logIdentifier;
- (void)registerForMessagesWithHome:(id)a3;
- (void)routeSiriEndpointApplyOnboardingSelectionsRequestMessage:(id)a3;
- (void)routeSiriEndpointDeleteSiriHistoryMessage:(id)a3;
@end

@implementation HMDSiriEndpointProfilesMessenger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_messageRouter, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
}

- (HMDSiriEndpointProfileMessageHandler)messageHandler
{
  return (HMDSiriEndpointProfileMessageHandler *)objc_getProperty(self, a2, 32, 1);
}

- (HMDMessageRouter)messageRouter
{
  return (HMDMessageRouter *)objc_getProperty(self, a2, 24, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)messageTargetUUID
{
  return self->_messageTargetUUID;
}

- (id)logIdentifier
{
  v2 = [(HMDSiriEndpointProfilesMessenger *)self messageTargetUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)intermediateApplyOnboardingSelectionsRequestMessageForMessage:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x263F0E798]);
  v8 = [v6 messagePayload];
  v9 = (void *)[v7 initWithPayload:v8];

  if (v9)
  {
    v10 = (void *)[v6 mutableCopy];
    v11 = [v6 identifier];
    [v10 setIdentifier:v11];

    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __104__HMDSiriEndpointProfilesMessenger_intermediateApplyOnboardingSelectionsRequestMessageForMessage_error___block_invoke;
    v17[3] = &unk_264A2AEE8;
    id v18 = v6;
    v19 = self;
    id v20 = v9;
    [v10 setResponseHandler:v17];
  }
  else
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v22 = v15;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to get accessory UUID for intermediate apply onboarding selections message handler using message: %@", buf, 0x16u);
    }
    [MEMORY[0x263F087E8] hmfErrorWithCode:3];
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

void __104__HMDSiriEndpointProfilesMessenger_intermediateApplyOnboardingSelectionsRequestMessageForMessage_error___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [a1[4] respondWithPayload:v6 error:v5];
  if (v6)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x263F0E7A0]) initWithPayload:v6];
    if (v8)
    {
      v9 = [MEMORY[0x263F08A00] defaultCenter];
      v22[0] = @"accessoryUUID";
      id v10 = a1[5];
      v11 = objc_msgSend(a1[6], "accessoryUUID", @"accessoryUUID");
      v22[1] = @"HMDSiriEndpointProfileNeedsOnboardingResultCodingKey";
      v23[0] = v11;
      v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "onboardingResult"));
      v23[1] = v12;
      v13 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
      [v9 postNotificationName:@"HMDSiriEndpointProfileUpdateNeedsOnboardingNotification" object:v10 userInfo:v13];
    }
    else
    {
      id v18 = (void *)MEMORY[0x230FBD990]();
      id v19 = a1[5];
      id v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v25 = v21;
        __int16 v26 = 2112;
        id v27 = v6;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to get response using apply onboarding intermediate response payload: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x230FBD990](v7);
    id v15 = a1[5];
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v17;
      __int16 v26 = 2112;
      id v27 = v5;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to get response payload for apply onboarding intermediate response with error: %@", buf, 0x16u);
    }
  }
}

- (void)routeSiriEndpointDeleteSiriHistoryMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDSiriEndpointProfilesMessenger *)self messageRouter];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __78__HMDSiriEndpointProfilesMessenger_routeSiriEndpointDeleteSiriHistoryMessage___block_invoke;
  v6[3] = &unk_264A2F558;
  v6[4] = self;
  [v5 routeMessage:v4 localHandler:v6];
}

void __78__HMDSiriEndpointProfilesMessenger_routeSiriEndpointDeleteSiriHistoryMessage___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 messageHandler];
  [v4 handleSiriEndpointDeleteSiriHistoryRequestMessage:v3];
}

- (void)routeSiriEndpointApplyOnboardingSelectionsRequestMessage:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Routing siri endpoint apply onboarding selections request message: %@", buf, 0x16u);
  }
  id v13 = 0;
  v9 = [(HMDSiriEndpointProfilesMessenger *)v6 intermediateApplyOnboardingSelectionsRequestMessageForMessage:v4 error:&v13];
  id v10 = v13;
  if (v9)
  {
    v11 = [(HMDSiriEndpointProfilesMessenger *)v6 messageRouter];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __93__HMDSiriEndpointProfilesMessenger_routeSiriEndpointApplyOnboardingSelectionsRequestMessage___block_invoke;
    v12[3] = &unk_264A2F558;
    v12[4] = v6;
    [v11 routeMessage:v9 localHandler:v12];
  }
  else
  {
    [v4 respondWithError:v10];
  }
}

void __93__HMDSiriEndpointProfilesMessenger_routeSiriEndpointApplyOnboardingSelectionsRequestMessage___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 messageHandler];
  [v4 handleSiriEndpointApplyOnboardingSelectionsRequestMessage:v3];
}

- (void)registerForMessagesWithHome:(id)a3
{
  v15[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  id v6 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  uint64_t v7 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v4 userPrivilege:4 remoteAccessRequired:0];

  v8 = [(HMDSiriEndpointProfilesMessenger *)self messageDispatcher];
  uint64_t v9 = *MEMORY[0x263F0D918];
  v15[0] = v5;
  v15[1] = v6;
  v15[2] = v7;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];
  [v8 registerForMessage:v9 receiver:self policies:v10 selector:sel_routeSiriEndpointApplyOnboardingSelectionsRequestMessage_];

  v11 = [(HMDSiriEndpointProfilesMessenger *)self messageDispatcher];
  v12 = [MEMORY[0x263F0E7A8] messageName];
  v14[0] = v5;
  v14[1] = v6;
  v14[2] = v7;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];
  [v11 registerForMessage:v12 receiver:self policies:v13 selector:sel_routeSiriEndpointDeleteSiriHistoryMessage_];
}

- (HMDSiriEndpointProfilesMessenger)initWithMessageTargetUUID:(id)a3 messageDispatcher:(id)a4 messageRouter:(id)a5 messageHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v13)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  id v15 = v14;
  if (!v14)
  {
LABEL_11:
    id v19 = (void *)_HMFPreconditionFailure();
    return (HMDSiriEndpointProfilesMessenger *)+[HMDSiriEndpointProfilesMessenger logCategory];
  }
  v21.receiver = self;
  v21.super_class = (Class)HMDSiriEndpointProfilesMessenger;
  __int16 v16 = [(HMDSiriEndpointProfilesMessenger *)&v21 init];
  id v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_messageTargetUUID, a3);
    objc_storeStrong((id *)&v17->_messageDispatcher, a4);
    objc_storeStrong((id *)&v17->_messageRouter, a5);
    objc_storeStrong((id *)&v17->_messageHandler, a6);
  }

  return v17;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_31497 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_31497, &__block_literal_global_31498);
  }
  v2 = (void *)logCategory__hmf_once_v5_31499;
  return v2;
}

void __47__HMDSiriEndpointProfilesMessenger_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v5_31499;
  logCategory__hmf_once_v5_31499 = v0;
}

@end