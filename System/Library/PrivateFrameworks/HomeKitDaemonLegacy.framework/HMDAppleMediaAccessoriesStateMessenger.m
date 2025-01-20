@interface HMDAppleMediaAccessoriesStateMessenger
+ (id)logCategory;
- (HMDAppleMediaAccessoriesStateMessenger)initWithIdentifier:(id)a3 messageDispatcher:(id)a4;
- (HMDAppleMediaAccessoriesStateMessengerDelegate)delegate;
- (HMFMessageDispatcher)messageDispatcher;
- (NSUUID)identifier;
- (NSUUID)messageTargetUUID;
- (id)logIdentifier;
- (id)relayMessageName:(id)a3 payload:(id)a4 toAppleMediaAccessory:(id)a5;
- (void)handleAppleMediaAccessoryModelIdentifierRequestMessage:(id)a3;
- (void)registerForMessagesWithHome:(id)a3;
- (void)sendModelIdentifierRequestMessageToAppleMediaAccessory:(id)a3 withAccessoryIdentifier:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation HMDAppleMediaAccessoriesStateMessenger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDAppleMediaAccessoriesStateMessengerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDAppleMediaAccessoriesStateMessengerDelegate *)WeakRetained;
}

- (void)handleAppleMediaAccessoryModelIdentifierRequestMessage:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v25 = 138543618;
    v26 = v8;
    __int16 v27 = 2112;
    id v28 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling apple media accessory model identifier request message: %@", (uint8_t *)&v25, 0x16u);
  }
  v9 = [v4 messagePayload];
  if (v9)
  {
    v10 = [[HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload alloc] initWithPayload:v9];
    if (v10)
    {
      v11 = [(HMDAppleMediaAccessoriesStateMessenger *)v6 delegate];
      if (v11)
      {
        v12 = [(HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload *)v10 accessoryIdentifier];
        [v11 appleMediaAccessoriesStateMessenger:v6 didReceiveModelIdentifierRequestMessage:v4 withAccessoryIdentifier:v12];
      }
      else
      {
        v21 = (void *)MEMORY[0x1D9452090]();
        v22 = v6;
        v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = HMFGetLogIdentifier();
          int v25 = 138543362;
          v26 = v24;
          _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify delegate of model identifier request message due to no delegate", (uint8_t *)&v25, 0xCu);
        }
        v12 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:4];
        [v4 respondWithError:v12];
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x1D9452090]();
      v18 = v6;
      v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = HMFGetLogIdentifier();
        int v25 = 138543618;
        v26 = v20;
        __int16 v27 = 2112;
        id v28 = v9;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to get model identifier request payload from payload: %@", (uint8_t *)&v25, 0x16u);
      }
      v11 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
      [v4 respondWithError:v11];
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1D9452090]();
    v14 = v6;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      int v25 = 138543618;
      v26 = v16;
      __int16 v27 = 2112;
      id v28 = v4;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get message payload from model identifier request message: %@", (uint8_t *)&v25, 0x16u);
    }
    v10 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
    [v4 respondWithError:v10];
  }
}

- (NSUUID)messageTargetUUID
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"8218CC5D-C283-4FE6-9E57-848EF1092455"];
  id v4 = (void *)MEMORY[0x1E4F29128];
  v5 = [(HMDAppleMediaAccessoriesStateMessenger *)self identifier];
  v6 = [v5 UUIDString];
  v7 = [v6 dataUsingEncoding:4];
  v8 = objc_msgSend(v4, "hmf_UUIDWithNamespace:data:", v3, v7);

  return (NSUUID *)v8;
}

- (id)logIdentifier
{
  v2 = [(HMDAppleMediaAccessoriesStateMessenger *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)relayMessageName:(id)a3 payload:(id)a4 toAppleMediaAccessory:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  v12 = [v10 device];
  if (v12)
  {
    v13 = [HMDRemoteDeviceMessageDestination alloc];
    v14 = [(HMDAppleMediaAccessoriesStateMessenger *)self messageTargetUUID];
    v15 = [(HMDRemoteDeviceMessageDestination *)v13 initWithTarget:v14 device:v12];

    id v27 = v8;
    v16 = +[HMDRemoteMessage secureMessageWithName:v8 qualityOfService:-1 destination:v15 messagePayload:v9];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __89__HMDAppleMediaAccessoriesStateMessenger_relayMessageName_payload_toAppleMediaAccessory___block_invoke;
    v28[3] = &unk_1E6A18C18;
    id v29 = v11;
    v17 = (void *)MEMORY[0x1D9452090]([v16 setResponseHandler:v28]);
    v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v31 = v20;
      __int16 v32 = 2112;
      id v33 = v16;
      __int16 v34 = 2112;
      id v35 = v10;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Relaying message: %@ to accessory: %@", buf, 0x20u);
    }
    v21 = [(HMDAppleMediaAccessoriesStateMessenger *)v18 messageDispatcher];
    [v21 sendMessage:v16];

    id v8 = v27;
  }
  else
  {
    v22 = (void *)MEMORY[0x1D9452090]();
    v23 = self;
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      int v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v31 = v25;
      __int16 v32 = 2112;
      id v33 = v8;
      __int16 v34 = 2112;
      id v35 = v9;
      __int16 v36 = 2112;
      id v37 = v10;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Failed to get device to relay message name: %@ payload: %@ to apple media accessory: %@", buf, 0x2Au);
    }
    v15 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:4];
    [v11 finishWithError:v15];
  }

  return v11;
}

void __89__HMDAppleMediaAccessoriesStateMessenger_relayMessageName_payload_toAppleMediaAccessory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v5)
  {
    [*(id *)(a1 + 32) finishWithResult:v5];
  }
  else
  {
    uint64_t v6 = (uint64_t)v7;
    if (!v7)
    {
      uint64_t v6 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
    }
    id v7 = (id)v6;
    [*(id *)(a1 + 32) finishWithError:v6];
  }
}

- (void)sendModelIdentifierRequestMessageToAppleMediaAccessory:(id)a3 withAccessoryIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1D9452090]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    id v28 = v14;
    __int16 v29 = 2112;
    id v30 = v8;
    __int16 v31 = 2112;
    id v32 = v9;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Sending model identifier request message to apple media accessory: %@ accessory identifier: %@", buf, 0x20u);
  }
  v15 = [[HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload alloc] initWithAccessoryIdentifier:v9];
  v16 = +[HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload messageName];
  v17 = [(HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload *)v15 payloadCopy];
  v18 = [(HMDAppleMediaAccessoriesStateMessenger *)v12 relayMessageName:v16 payload:v17 toAppleMediaAccessory:v8];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __132__HMDAppleMediaAccessoriesStateMessenger_sendModelIdentifierRequestMessageToAppleMediaAccessory_withAccessoryIdentifier_completion___block_invoke;
  v25[3] = &unk_1E6A17D78;
  v25[4] = v12;
  id v19 = v10;
  id v26 = v19;
  id v20 = (id)[v18 addFailureBlock:v25];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __132__HMDAppleMediaAccessoriesStateMessenger_sendModelIdentifierRequestMessageToAppleMediaAccessory_withAccessoryIdentifier_completion___block_invoke_14;
  v23[3] = &unk_1E6A13D80;
  v23[4] = v12;
  id v24 = v19;
  id v21 = v19;
  id v22 = (id)[v18 addSuccessBlock:v23];
}

void __132__HMDAppleMediaAccessoriesStateMessenger_sendModelIdentifierRequestMessageToAppleMediaAccessory_withAccessoryIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Relay model identifier request payload completed with error: %@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __132__HMDAppleMediaAccessoriesStateMessenger_sendModelIdentifierRequestMessageToAppleMediaAccessory_withAccessoryIdentifier_completion___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v17 = 138543618;
    v18 = v7;
    __int16 v19 = 2112;
    id v20 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Relay model identifier request payload completed with response payload: %@", (uint8_t *)&v17, 0x16u);
  }
  int v8 = [[HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload alloc] initWithPayload:v3];
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = [(HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload *)v8 modelIdentifier];
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = *(id *)(a1 + 32);
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v17 = 138543618;
      v18 = v15;
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode model identifier response payload: %@", (uint8_t *)&v17, 0x16u);
    }
    uint64_t v16 = *(void *)(a1 + 40);
    id v11 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
    (*(void (**)(uint64_t, void *, void))(v16 + 16))(v16, v11, 0);
  }
}

- (void)registerForMessagesWithHome:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  uint64_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    int v17 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Registering for messages", buf, 0xCu);
  }
  id v9 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  uint64_t v10 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  id v11 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v4 userPrivilege:4 remoteAccessRequired:0];
  uint64_t v12 = [(HMDAppleMediaAccessoriesStateMessenger *)v6 messageDispatcher];
  id v13 = +[HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload messageName];
  v15[0] = v9;
  v15[1] = v10;
  v15[2] = v11;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
  [v12 registerForMessage:v13 receiver:v6 policies:v14 selector:sel_handleAppleMediaAccessoryModelIdentifierRequestMessage_];
}

- (HMDAppleMediaAccessoriesStateMessenger)initWithIdentifier:(id)a3 messageDispatcher:(id)a4
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
    id v13 = (void *)_HMFPreconditionFailure();
    return (HMDAppleMediaAccessoriesStateMessenger *)+[HMDAppleMediaAccessoriesStateMessenger logCategory];
  }
  v15.receiver = self;
  v15.super_class = (Class)HMDAppleMediaAccessoriesStateMessenger;
  uint64_t v10 = [(HMDAppleMediaAccessoriesStateMessenger *)&v15 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_identifier, a3);
    objc_storeStrong((id *)&v11->_messageDispatcher, a4);
  }

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_154185 != -1) {
    dispatch_once(&logCategory__hmf_once_t7_154185, &__block_literal_global_154186);
  }
  v2 = (void *)logCategory__hmf_once_v8_154187;
  return v2;
}

uint64_t __53__HMDAppleMediaAccessoriesStateMessenger_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v8_154187;
  logCategory__hmf_once_v8_154187 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end