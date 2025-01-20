@interface HMDAccessorySettingsLegacyMessageReceiver
- (HMDAccessorySettingsLegacyMessageReceiver)initWithMessageTargetUUID:(id)a3 messageDispatcher:(id)a4;
- (HMDAccessorySettingsMessenger)messenger;
- (HMFMessageDispatcher)messageDispatcher;
- (NSUUID)messageTargetUUID;
- (void)registerForMessagesWithHome:(id)a3;
- (void)routeAccessorySettingsFetchRequestMessage:(id)a3;
- (void)routeAccessorySettingsUpdateRequestMessage:(id)a3;
- (void)setMessenger:(id)a3;
@end

@implementation HMDAccessorySettingsLegacyMessageReceiver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_destroyWeak((id *)&self->_messenger);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMessenger:(id)a3
{
}

- (HMDAccessorySettingsMessenger)messenger
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messenger);
  return (HMDAccessorySettingsMessenger *)WeakRetained;
}

- (NSUUID)messageTargetUUID
{
  return self->_messageTargetUUID;
}

- (void)routeAccessorySettingsUpdateRequestMessage:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v16 = 138543618;
    v17 = v8;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Routing legacy update request message: %@", (uint8_t *)&v16, 0x16u);
  }
  v9 = [(HMDAccessorySettingsLegacyMessageReceiver *)v6 messenger];
  v10 = v9;
  if (v9)
  {
    [v9 routeAccessorySettingsUpdateRequestMessage:v4];
  }
  else
  {
    v11 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:4];
    v12 = (void *)MEMORY[0x1D9452090]();
    v13 = v6;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v16 = 138543618;
      v17 = v15;
      __int16 v18 = 2112;
      id v19 = v11;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle legacy update request message due to unconfigured messenger error: %@", (uint8_t *)&v16, 0x16u);
    }
    [v4 respondWithError:v11];
  }
}

- (void)routeAccessorySettingsFetchRequestMessage:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v16 = 138543618;
    v17 = v8;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Routing legacy fetch request message: %@", (uint8_t *)&v16, 0x16u);
  }
  v9 = [(HMDAccessorySettingsLegacyMessageReceiver *)v6 messenger];
  v10 = v9;
  if (v9)
  {
    [v9 routeAccessorySettingsFetchRequestMessage:v4];
  }
  else
  {
    v11 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:4];
    v12 = (void *)MEMORY[0x1D9452090]();
    v13 = v6;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v16 = 138543618;
      v17 = v15;
      __int16 v18 = 2112;
      id v19 = v11;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle legacy fetch request message due to unconfigured messenger error: %@", (uint8_t *)&v16, 0x16u);
    }
    [v4 respondWithError:v11];
  }
}

- (void)registerForMessagesWithHome:(id)a3
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  v6 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v7 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v4 userPrivilege:0 remoteAccessRequired:0];
  v8 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v4 userPrivilege:4 remoteAccessRequired:0];

  v9 = [(HMDAccessorySettingsLegacyMessageReceiver *)self messageDispatcher];
  uint64_t v10 = *MEMORY[0x1E4F2C620];
  v16[0] = v5;
  v16[1] = v6;
  v16[2] = v7;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
  [v9 registerForMessage:v10 receiver:self policies:v11 selector:sel_routeAccessorySettingsFetchRequestMessage_];

  v12 = [(HMDAccessorySettingsLegacyMessageReceiver *)self messageDispatcher];
  uint64_t v13 = *MEMORY[0x1E4F2C630];
  v15[0] = v5;
  v15[1] = v6;
  v15[2] = v8;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
  [v12 registerForMessage:v13 receiver:self policies:v14 selector:sel_routeAccessorySettingsUpdateRequestMessage_];
}

- (HMDAccessorySettingsLegacyMessageReceiver)initWithMessageTargetUUID:(id)a3 messageDispatcher:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    uint64_t v13 = (HMDAnnounceUserSettingsModel *)_HMFPreconditionFailure();
    return (HMDAccessorySettingsLegacyMessageReceiver *)[(HMDAnnounceUserSettingsModel *)v13 initWithUserUUID:v15];
  }
  v16.receiver = self;
  v16.super_class = (Class)HMDAccessorySettingsLegacyMessageReceiver;
  uint64_t v10 = [(HMDAccessorySettingsLegacyMessageReceiver *)&v16 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_messageTargetUUID, a3);
    objc_storeStrong((id *)&v11->_messageDispatcher, a4);
  }

  return v11;
}

@end