@interface HMMultiuserSettingsMessenger
+ (id)logCategory;
+ (id)shortDescription;
- (HMFMessageDispatcher)messageDispatcher;
- (HMMultiuserSettingsMessenger)initWithMessageDispatcher:(id)a3 messageTargetUUID:(id)a4;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)shortDescription;
- (NSUUID)messageTargetUUID;
- (id)logIdentifier;
- (void)sendFetchMultiuserSettingsRequest:(id)a3;
@end

@implementation HMMultiuserSettingsMessenger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);

  objc_storeStrong((id *)&self->_messageDispatcher, 0);
}

- (NSUUID)messageTargetUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (id)logIdentifier
{
  v2 = [(HMMultiuserSettingsMessenger *)self messageTargetUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (NSArray)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMMultiuserSettingsMessenger *)self messageTargetUUID];
  v5 = (void *)[v3 initWithName:@"messageTargetUUID" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return (NSArray *)v6;
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (void)sendFetchMultiuserSettingsRequest:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x19F3A64A0]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [(HMMultiuserSettingsMessenger *)v6 messageTargetUUID];
    *(_DWORD *)buf = 138543618;
    v23 = v8;
    __int16 v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Sending multiuser fetch request message with targetUUID %@", buf, 0x16u);
  }
  id v10 = objc_alloc(MEMORY[0x1E4F65488]);
  v11 = [(HMMultiuserSettingsMessenger *)v6 messageTargetUUID];
  v12 = (void *)[v10 initWithTarget:v11];

  v13 = (void *)[objc_alloc(MEMORY[0x1E4F654B0]) initWithName:@"HMMultiuserSettingsFetchRequestMessage" destination:v12 payload:0];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __66__HMMultiuserSettingsMessenger_sendFetchMultiuserSettingsRequest___block_invoke;
  v19 = &unk_1E5944EF0;
  v20 = v6;
  id v21 = v4;
  id v14 = v4;
  [v13 setResponseHandler:&v16];
  v15 = [(HMMultiuserSettingsMessenger *)v6 messageDispatcher];
  [v15 sendMessage:v13];
}

void __66__HMMultiuserSettingsMessenger_sendFetchMultiuserSettingsRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    int v18 = 138543618;
    v19 = v10;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Calling responseHandler in sendFetchMultiuserSettingsRequest with responsePayload %@", (uint8_t *)&v18, 0x16u);
  }
  if (v6)
  {
    v11 = [[HMMultiUserSettingsForMetrics alloc] initWithPayload:v6];
    if (v11)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      v12 = (void *)MEMORY[0x19F3A64A0]();
      id v13 = *(id *)(a1 + 32);
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = HMFGetLogIdentifier();
        int v18 = 138543362;
        v19 = v15;
        _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@Failed to instantiate HMMultiUserSettingsForMetrics", (uint8_t *)&v18, 0xCu);
      }
      uint64_t v16 = *(void *)(a1 + 40);
      uint64_t v17 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
      (*(void (**)(uint64_t, void *, void))(v16 + 16))(v16, v17, 0);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (HMMultiuserSettingsMessenger)initWithMessageDispatcher:(id)a3 messageTargetUUID:(id)a4
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
    id v13 = (void *)_HMFPreconditionFailure();
    return (HMMultiuserSettingsMessenger *)+[HMMultiuserSettingsMessenger logCategory];
  }
  v15.receiver = self;
  v15.super_class = (Class)HMMultiuserSettingsMessenger;
  id v10 = [(HMMultiuserSettingsMessenger *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_messageDispatcher, a3);
    objc_storeStrong((id *)&v11->_messageTargetUUID, a4);
  }

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_40645 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_40645, &__block_literal_global_40646);
  }
  v2 = (void *)logCategory__hmf_once_v4_40647;

  return v2;
}

uint64_t __43__HMMultiuserSettingsMessenger_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v4_40647;
  logCategory__hmf_once_v4_40647 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end