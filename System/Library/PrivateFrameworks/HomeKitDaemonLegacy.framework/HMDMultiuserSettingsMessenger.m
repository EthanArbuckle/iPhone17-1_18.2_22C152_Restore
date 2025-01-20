@interface HMDMultiuserSettingsMessenger
+ (id)logCategory;
- (HMDHome)home;
- (HMDMultiuserSettingsMessenger)initWithHome:(id)a3 messageDispatcher:(id)a4;
- (HMFMessageDispatcher)messageDispatcher;
- (NSUUID)messageTargetUUID;
- (id)logIdentifier;
- (void)handleFetchMultiuserSettingsRequest:(id)a3;
- (void)registerForMessages;
@end

@implementation HMDMultiuserSettingsMessenger

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 8, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDMultiuserSettingsMessenger *)self messageTargetUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (NSUUID)messageTargetUUID
{
  v2 = [(HMDMultiuserSettingsMessenger *)self home];
  v3 = [v2 uuid];

  return (NSUUID *)v3;
}

- (void)handleFetchMultiuserSettingsRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [(HMDMultiuserSettingsMessenger *)v6 home];
    v10 = [v9 multiUserSettings];
    int v14 = 138543618;
    v15 = v8;
    __int16 v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling fetch Multiuser Settings Request, %@", (uint8_t *)&v14, 0x16u);
  }
  v11 = [(HMDMultiuserSettingsMessenger *)v6 home];
  v12 = [v11 multiUserSettings];

  v13 = [v12 payloadCopy];
  [v4 respondWithPayload:v13];
}

- (void)registerForMessages
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  id v4 = [(HMDMultiuserSettingsMessenger *)self home];
  v5 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v4 userPrivilege:3 remoteAccessRequired:0];

  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v15 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Registered for Multiuser Settings Metrics Messages", buf, 0xCu);
  }
  v10 = [(HMDMultiuserSettingsMessenger *)v7 messageDispatcher];
  uint64_t v11 = *MEMORY[0x1E4F2DA30];
  v13[0] = v3;
  v13[1] = v5;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  [v10 registerForMessage:v11 receiver:v7 policies:v12 selector:sel_handleFetchMultiuserSettingsRequest_];
}

- (HMDMultiuserSettingsMessenger)initWithHome:(id)a3 messageDispatcher:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v8 = v7;
  if (!v7)
  {
LABEL_7:
    v12 = (void *)_HMFPreconditionFailure();
    return (HMDMultiuserSettingsMessenger *)+[HMDMultiuserSettingsMessenger logCategory];
  }
  v14.receiver = self;
  v14.super_class = (Class)HMDMultiuserSettingsMessenger;
  v9 = [(HMDMultiuserSettingsMessenger *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_messageDispatcher, a4);
    objc_storeWeak((id *)&v10->_home, v6);
  }

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_130550 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_130550, &__block_literal_global_130551);
  }
  v2 = (void *)logCategory__hmf_once_v3_130552;
  return v2;
}

uint64_t __44__HMDMultiuserSettingsMessenger_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v3_130552;
  logCategory__hmf_once_v3_130552 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end