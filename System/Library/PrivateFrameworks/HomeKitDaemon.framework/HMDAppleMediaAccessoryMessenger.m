@interface HMDAppleMediaAccessoryMessenger
+ (id)logCategory;
- (HMDAppleMediaAccessoryLocalMessageHandler)localHandler;
- (HMDAppleMediaAccessoryMessenger)initWithIdentifier:(id)a3 messageDispatcher:(id)a4 router:(id)a5 localHandler:(id)a6;
- (HMDMessageRouter)router;
- (HMFMessageDispatcher)messageDispatcher;
- (NSUUID)identifier;
- (id)logIdentifier;
- (void)registerForMessagesWithHome:(id)a3;
- (void)routeSiriEndpointDeleteSiriHistoryMessage:(id)a3;
- (void)sendDeleteSiriHistoryRequestForAccessoryWithUUID:(id)a3 completionHandler:(id)a4;
@end

@implementation HMDAppleMediaAccessoryMessenger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localHandler, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_router, 0);
}

- (HMDAppleMediaAccessoryLocalMessageHandler)localHandler
{
  return (HMDAppleMediaAccessoryLocalMessageHandler *)objc_getProperty(self, a2, 32, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (HMDMessageRouter)router
{
  return (HMDMessageRouter *)objc_getProperty(self, a2, 8, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDAppleMediaAccessoryMessenger *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)routeSiriEndpointDeleteSiriHistoryMessage:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v12 = v8;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Routing siri endpoint delete siri history message: %@", buf, 0x16u);
  }
  v9 = [(HMDAppleMediaAccessoryMessenger *)v6 router];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __77__HMDAppleMediaAccessoryMessenger_routeSiriEndpointDeleteSiriHistoryMessage___block_invoke;
  v10[3] = &unk_264A2F558;
  v10[4] = v6;
  [v9 routeMessage:v4 localHandler:v10];
}

void __77__HMDAppleMediaAccessoryMessenger_routeSiriEndpointDeleteSiriHistoryMessage___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 localHandler];
  [v4 handleSiriEndpointDeleteSiriHistoryMessage:v3];
}

- (void)sendDeleteSiriHistoryRequestForAccessoryWithUUID:(id)a3 completionHandler:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v28 = v11;
    __int16 v29 = 2112;
    id v30 = v6;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Sending delete siri history request message for accessory uuid: %@", buf, 0x16u);
  }
  v12 = (void *)[objc_alloc(MEMORY[0x263F0E7A8]) initWithAccessoryUUID:v6];
  id v13 = objc_alloc(MEMORY[0x263F42570]);
  id v14 = [(HMDAppleMediaAccessoryMessenger *)v9 messageTargetUUID];
  uint64_t v15 = (void *)[v13 initWithTarget:v14];

  id v16 = objc_alloc(MEMORY[0x263F42590]);
  v17 = [MEMORY[0x263F0E7A8] messageName];
  v18 = [v12 payloadCopy];
  v19 = (void *)[v16 initWithName:v17 destination:v15 payload:v18];

  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  v23 = __102__HMDAppleMediaAccessoryMessenger_sendDeleteSiriHistoryRequestForAccessoryWithUUID_completionHandler___block_invoke;
  v24 = &unk_264A2B228;
  v25 = v9;
  id v26 = v7;
  id v20 = v7;
  [v19 setResponseHandler:&v21];
  -[HMDAppleMediaAccessoryMessenger routeSiriEndpointDeleteSiriHistoryMessage:](v9, "routeSiriEndpointDeleteSiriHistoryMessage:", v19, v21, v22, v23, v24, v25);
}

void __102__HMDAppleMediaAccessoryMessenger_sendDeleteSiriHistoryRequestForAccessoryWithUUID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      v12 = v10;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Delete siri history message responded with error: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)registerForMessagesWithHome:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v17 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Registering for messages", buf, 0xCu);
  }
  v9 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  v10 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  int v11 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v4 userPrivilege:3 remoteAccessRequired:0];
  v12 = [(HMDAppleMediaAccessoryMessenger *)v6 messageDispatcher];
  __int16 v13 = [MEMORY[0x263F0E7A8] messageName];
  v15[0] = v9;
  v15[1] = v10;
  v15[2] = v11;
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];
  [v12 registerForMessage:v13 receiver:v6 policies:v14 selector:sel_routeSiriEndpointDeleteSiriHistoryMessage_];
}

- (HMDAppleMediaAccessoryMessenger)initWithIdentifier:(id)a3 messageDispatcher:(id)a4 router:(id)a5 localHandler:(id)a6
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
  uint64_t v15 = v14;
  if (!v14)
  {
LABEL_11:
    v19 = (void *)_HMFPreconditionFailure();
    return (HMDAppleMediaAccessoryMessenger *)+[HMDAppleMediaAccessoryMessenger logCategory];
  }
  v21.receiver = self;
  v21.super_class = (Class)HMDAppleMediaAccessoryMessenger;
  id v16 = [(HMDAppleMediaAccessoryMessenger *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_identifier, a3);
    objc_storeStrong((id *)&v17->_messageDispatcher, a4);
    objc_storeStrong((id *)&v17->_router, a5);
    objc_storeStrong((id *)&v17->_localHandler, a6);
  }

  return v17;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_90256 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_90256, &__block_literal_global_90257);
  }
  v2 = (void *)logCategory__hmf_once_v5_90258;
  return v2;
}

void __46__HMDAppleMediaAccessoryMessenger_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v5_90258;
  logCategory__hmf_once_v5_90258 = v0;
}

@end