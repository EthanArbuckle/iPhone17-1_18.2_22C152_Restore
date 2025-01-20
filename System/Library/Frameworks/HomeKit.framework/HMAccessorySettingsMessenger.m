@interface HMAccessorySettingsMessenger
+ (id)legacyMessageTargetUUIDWithHomeUUID:(id)a3;
+ (id)logCategory;
+ (id)messageTargetUUIDWithHomeUUID:(id)a3;
+ (id)shortDescription;
- (HMAccessorySettingsMessenger)initWithMessageDispatcher:(id)a3 messageTargetUUID:(id)a4 metricsDispatcher:(id)a5;
- (HMAccessorySettingsMetricsDispatcher)metricsDispatcher;
- (HMFMessageDispatcher)messageDispatcher;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)shortDescription;
- (NSUUID)messageTargetUUID;
- (id)logIdentifier;
- (void)sendFetchAccessorySettingsRequestWithAccessoryUUID:(id)a3 keyPaths:(id)a4 completionHandler:(id)a5;
- (void)sendUpdateAccessorySettingRequestWithAccessoryUUID:(id)a3 keyPath:(id)a4 settingValue:(id)a5 completionHandler:(id)a6;
- (void)submitMetricEventWithMessage:(id)a3 error:(id)a4;
@end

@implementation HMAccessorySettingsMessenger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
  objc_storeStrong((id *)&self->_metricsDispatcher, 0);

  objc_storeStrong((id *)&self->_messageDispatcher, 0);
}

- (NSUUID)messageTargetUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (HMAccessorySettingsMetricsDispatcher)metricsDispatcher
{
  return (HMAccessorySettingsMetricsDispatcher *)objc_getProperty(self, a2, 16, 1);
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
  v2 = [(HMAccessorySettingsMessenger *)self messageTargetUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (NSArray)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMAccessorySettingsMessenger *)self messageTargetUUID];
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

- (void)submitMetricEventWithMessage:(id)a3 error:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = [(HMAccessorySettingsMessenger *)self metricsDispatcher];
    [v8 submitEventWithMessage:v6 error:v7];
  }
  else
  {
    v9 = (void *)MEMORY[0x19F3A64A0]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to submit fetch event due to message lost before metric submission", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)sendUpdateAccessorySettingRequestWithAccessoryUUID:(id)a3 keyPath:(id)a4 settingValue:(id)a5 completionHandler:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v15 = self;
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v34 = v17;
    __int16 v35 = 2112;
    id v36 = v10;
    __int16 v37 = 2112;
    id v38 = v11;
    __int16 v39 = 2112;
    id v40 = v12;
    _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@Sending update request message with accessory UUID: %@ key path: %@ setting value: %@", buf, 0x2Au);
  }
  v18 = [[HMAccessorySettingsUpdateRequestMessagePayload alloc] initWithAccessoryUUID:v10 keyPath:v11 settingValue:v12];
  id v19 = objc_alloc(MEMORY[0x1E4F65488]);
  v20 = [(HMAccessorySettingsMessenger *)v15 messageTargetUUID];
  v21 = (void *)[v19 initWithTarget:v20];

  id v22 = objc_alloc(MEMORY[0x1E4F654B0]);
  v23 = [(HMAccessorySettingsUpdateRequestMessagePayload *)v18 payloadCopy];
  v24 = (void *)[v22 initWithName:@"HMAccessorySettingsUpdateRequestMessage" destination:v21 payload:v23];

  v25 = (void *)[v24 copy];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __122__HMAccessorySettingsMessenger_sendUpdateAccessorySettingRequestWithAccessoryUUID_keyPath_settingValue_completionHandler___block_invoke;
  v30[3] = &unk_1E5945510;
  v30[4] = v15;
  id v31 = v25;
  id v32 = v13;
  id v26 = v13;
  id v27 = v25;
  [v24 setResponseHandler:v30];
  v28 = [(HMAccessorySettingsMessenger *)v15 metricsDispatcher];
  [v28 startEventWithMessage:v24 updateKeyPath:v11];

  v29 = [(HMAccessorySettingsMessenger *)v15 messageDispatcher];
  [v29 sendMessage:v24];
}

void __122__HMAccessorySettingsMessenger_sendUpdateAccessorySettingRequestWithAccessoryUUID_keyPath_settingValue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v18 = 138543618;
      id v19 = v11;
      __int16 v20 = 2112;
      id v21 = v5;
      id v12 = "%{public}@Update request message responded with error: %@";
      id v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 22;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v13, v14, v12, (uint8_t *)&v18, v15);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v18 = 138543362;
    id v19 = v11;
    id v12 = "%{public}@Update request message responded";
    id v13 = v10;
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
    uint32_t v15 = 12;
    goto LABEL_6;
  }

  [*(id *)(a1 + 32) submitMetricEventWithMessage:*(void *)(a1 + 40) error:v5];
  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v5, v16, v17);
}

- (void)sendFetchAccessorySettingsRequestWithAccessoryUUID:(id)a3 keyPaths:(id)a4 completionHandler:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x19F3A64A0]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    os_log_type_t v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    id v31 = v14;
    __int16 v32 = 2112;
    id v33 = v8;
    __int16 v34 = 2112;
    id v35 = v9;
    _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Sending fetch request message with accessory UUID: %@ key paths: %@", buf, 0x20u);
  }
  uint32_t v15 = [[HMAccessorySettingsFetchRequestMessagePayload alloc] initWithAccessoryUUID:v8 keyPaths:v9];
  id v16 = objc_alloc(MEMORY[0x1E4F65488]);
  uint64_t v17 = [(HMAccessorySettingsMessenger *)v12 messageTargetUUID];
  int v18 = (void *)[v16 initWithTarget:v17];

  id v19 = objc_alloc(MEMORY[0x1E4F654B0]);
  __int16 v20 = [(HMAccessorySettingsFetchRequestMessagePayload *)v15 payloadCopy];
  id v21 = (void *)[v19 initWithName:@"HMAccessorySettingsFetchRequestMessage" destination:v18 payload:v20];

  uint64_t v22 = (void *)[v21 copy];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __110__HMAccessorySettingsMessenger_sendFetchAccessorySettingsRequestWithAccessoryUUID_keyPaths_completionHandler___block_invoke;
  v27[3] = &unk_1E5945510;
  id v28 = v22;
  id v29 = v10;
  v27[4] = v12;
  id v23 = v22;
  id v24 = v10;
  [v21 setResponseHandler:v27];
  v25 = [(HMAccessorySettingsMessenger *)v12 metricsDispatcher];
  [v25 startEventWithMessage:v21 updateKeyPath:0];

  id v26 = [(HMAccessorySettingsMessenger *)v12 messageDispatcher];
  [v26 sendMessage:v21];
}

void __110__HMAccessorySettingsMessenger_sendFetchAccessorySettingsRequestWithAccessoryUUID_keyPaths_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = [[HMAccessorySettingsFetchResponseMessagePayload alloc] initWithPayload:v6];
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    id v11 = v10;
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v12 = HMFGetLogIdentifier();
        int v27 = 138543618;
        id v28 = v12;
        __int16 v29 = 2112;
        v30 = v7;
        _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Fetch request message responded with response payload: %@", (uint8_t *)&v27, 0x16u);
      }
      id v13 = [(HMAccessorySettingsFetchResponseMessagePayload *)v7 failureInformation];
      os_log_type_t v14 = [v13 failedKeyPaths];
      uint64_t v15 = [v14 count];

      if (v15)
      {
        id v16 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v17 = [(HMAccessorySettingsFetchResponseMessagePayload *)v7 failureInformation];
        int v18 = [v17 payloadCopy];
        id v19 = [v16 hmfErrorWithCode:11 userInfo:v18];
      }
      else
      {
        id v19 = 0;
      }
      [*(id *)(a1 + 32) submitMetricEventWithMessage:*(void *)(a1 + 40) error:v19];
      uint64_t v25 = *(void *)(a1 + 48);
      id v26 = [(HMAccessorySettingsFetchResponseMessagePayload *)v7 settings];
      (*(void (**)(uint64_t, void *, void *))(v25 + 16))(v25, v19, v26);
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v24 = HMFGetLogIdentifier();
        int v27 = 138543618;
        id v28 = v24;
        __int16 v29 = 2112;
        v30 = v6;
        _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode fetch response using payload: %@", (uint8_t *)&v27, 0x16u);
      }
      id v19 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      [*(id *)(a1 + 32) submitMetricEventWithMessage:*(void *)(a1 + 40) error:v19];
    }
  }
  else
  {
    if (!v5)
    {
      id v5 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
    }
    __int16 v20 = (void *)MEMORY[0x19F3A64A0]();
    id v21 = *(id *)(a1 + 32);
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v23 = HMFGetLogIdentifier();
      int v27 = 138543618;
      id v28 = v23;
      __int16 v29 = 2112;
      v30 = v5;
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Fetch request message responded with error: %@", (uint8_t *)&v27, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [*(id *)(a1 + 32) submitMetricEventWithMessage:*(void *)(a1 + 40) error:v5];
  }
}

- (HMAccessorySettingsMessenger)initWithMessageDispatcher:(id)a3 messageTargetUUID:(id)a4 metricsDispatcher:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  id v12 = v11;
  if (!v11)
  {
LABEL_9:
    id v16 = (void *)_HMFPreconditionFailure();
    return (HMAccessorySettingsMessenger *)+[HMAccessorySettingsMessenger logCategory];
  }
  v18.receiver = self;
  v18.super_class = (Class)HMAccessorySettingsMessenger;
  id v13 = [(HMAccessorySettingsMessenger *)&v18 init];
  os_log_type_t v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_messageDispatcher, a3);
    objc_storeStrong((id *)&v14->_messageTargetUUID, a4);
    objc_storeStrong((id *)&v14->_metricsDispatcher, a5);
  }

  return v14;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_46061 != -1) {
    dispatch_once(&logCategory__hmf_once_t8_46061, &__block_literal_global_46062);
  }
  v2 = (void *)logCategory__hmf_once_v9_46063;

  return v2;
}

uint64_t __43__HMAccessorySettingsMessenger_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v9_46063;
  logCategory__hmf_once_v9_46063 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (id)legacyMessageTargetUUIDWithHomeUUID:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F29128];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithUUIDString:@"257D2091-3412-4683-8586-B0CF9DF75439"];
  id v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = [v4 UUIDString];

  id v8 = [v7 dataUsingEncoding:4];
  id v9 = objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v5, v8);

  return v9;
}

+ (id)messageTargetUUIDWithHomeUUID:(id)a3
{
  id v3 = a3;

  return v3;
}

@end