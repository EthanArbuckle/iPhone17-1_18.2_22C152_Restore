@interface HMPersonSettingsManager
+ (id)logCategory;
+ (id)personSettingsManagerUUIDFromHomeUUID:(id)a3;
- (HMFMessageDestination)messageDestination;
- (HMPersonSettingsManager)initWithContext:(id)a3 UUID:(id)a4;
- (HMPersonSettingsManager)initWithHome:(id)a3;
- (NSUUID)UUID;
- (_HMContext)context;
- (id)logIdentifier;
- (void)_sendMessageWithName:(id)a3 payload:(id)a4 responseHandler:(id)a5;
- (void)fetchClassificationNotificationsEnabledForPersonWithUUID:(id)a3 completion:(id)a4;
- (void)updateClassificationNotificationsEnabled:(BOOL)a3 forPersonWithUUID:(id)a4 completion:(id)a5;
@end

@implementation HMPersonSettingsManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (id)logIdentifier
{
  v2 = [(HMPersonSettingsManager *)self UUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (HMFMessageDestination)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  v4 = [(HMPersonSettingsManager *)self UUID];
  v5 = (void *)[v3 initWithTarget:v4];

  return (HMFMessageDestination *)v5;
}

- (void)_sendMessageWithName:(id)a3 payload:(id)a4 responseHandler:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F654B0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [(HMPersonSettingsManager *)self messageDestination];
  id v15 = [v8 messageWithName:v11 destination:v12 payload:v10];

  [v15 setResponseHandler:v9];
  v13 = [(HMPersonSettingsManager *)self context];
  v14 = [v13 messageDispatcher];
  [v14 sendMessage:v15];
}

- (void)updateClassificationNotificationsEnabled:(BOOL)a3 forPersonWithUUID:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x19F3A64A0]();
  id v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v25 = v13;
    __int16 v26 = 2048;
    BOOL v27 = v6;
    __int16 v28 = 2112;
    id v29 = v8;
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Set classification notifications enabled: %lu, for person with uuid: %@", buf, 0x20u);
  }
  v22[0] = @"HMPersonSettingsManagerPersonUUIDKey";
  v22[1] = @"HMPersonSettingsManagerClassificationNotificationsEnabledKey";
  v23[0] = v8;
  v14 = [NSNumber numberWithBool:v6];
  v23[1] = v14;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __97__HMPersonSettingsManager_updateClassificationNotificationsEnabled_forPersonWithUUID_completion___block_invoke;
  v18[3] = &unk_1E5943980;
  BOOL v21 = v6;
  v18[4] = v11;
  id v19 = v8;
  id v20 = v9;
  id v16 = v9;
  id v17 = v8;
  [(HMPersonSettingsManager *)v11 _sendMessageWithName:@"HMPersonSettingsManagerSetClassificationNotificationsEnabledMessage" payload:v15 responseHandler:v18];
}

void __97__HMPersonSettingsManager_updateClassificationNotificationsEnabled_forPersonWithUUID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v16 = 138543618;
      id v17 = v11;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to update classification notifications enabled with error: %@", (uint8_t *)&v16, 0x16u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    v12 = HMFBooleanToString();
    uint64_t v13 = *(void *)(a1 + 40);
    int v16 = 138543874;
    id v17 = v11;
    __int16 v18 = 2112;
    id v19 = v12;
    __int16 v20 = 2112;
    uint64_t v21 = v13;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully updated classification notifications enabled to %@ for person with UUID: %@", (uint8_t *)&v16, 0x20u);

    goto LABEL_6;
  }

  v14 = [*(id *)(a1 + 32) context];
  id v15 = [v14 delegateCaller];
  [v15 callCompletion:*(void *)(a1 + 48) error:v5];
}

- (void)fetchClassificationNotificationsEnabledForPersonWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v19 = v11;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching classification notifications enabled for person with uuid: %@", buf, 0x16u);
  }
  int v16 = @"HMPersonSettingsManagerPersonUUIDKey";
  id v17 = v6;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __95__HMPersonSettingsManager_fetchClassificationNotificationsEnabledForPersonWithUUID_completion___block_invoke;
  v14[3] = &unk_1E5944EF0;
  v14[4] = v9;
  id v15 = v7;
  id v13 = v7;
  [(HMPersonSettingsManager *)v9 _sendMessageWithName:@"HMPersonSettingsManagerFetchClassificationNotificationsEnabledMessage" payload:v12 responseHandler:v14];
}

void __95__HMPersonSettingsManager_fetchClassificationNotificationsEnabledForPersonWithUUID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = objc_msgSend(v6, "hmf_numberForKey:", @"HMPersonSettingsManagerClassificationNotificationsEnabledKey");
    if (v8)
    {
      id v9 = (void *)v8;
      id v10 = [*(id *)(a1 + 32) context];
      id v11 = [v10 delegateCaller];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __95__HMPersonSettingsManager_fetchClassificationNotificationsEnabledForPersonWithUUID_completion___block_invoke_2;
      v25[3] = &unk_1E5945138;
      v25[4] = *(void *)(a1 + 32);
      id v12 = v9;
      id v26 = v12;
      id v27 = *(id *)(a1 + 40);
      [v11 invokeBlock:v25];
    }
    else
    {
      id v19 = (void *)MEMORY[0x19F3A64A0]();
      id v20 = *(id *)(a1 + 32);
      id v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v34 = v22;
        __int16 v35 = 2112;
        id v36 = v7;
        _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to find enabled value on message response payload: %@", buf, 0x16u);
      }
      v23 = [*(id *)(a1 + 32) context];
      v24 = [v23 delegateCaller];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __95__HMPersonSettingsManager_fetchClassificationNotificationsEnabledForPersonWithUUID_completion___block_invoke_16;
      v28[3] = &unk_1E59454C0;
      id v29 = *(id *)(a1 + 40);
      [v24 invokeBlock:v28];

      id v12 = 0;
    }
  }
  else
  {
    id v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = *(id *)(a1 + 32);
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v34 = v16;
      __int16 v35 = 2112;
      id v36 = v5;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch classification notifications enabled with error: %@", buf, 0x16u);
    }
    id v17 = [*(id *)(a1 + 32) context];
    __int16 v18 = [v17 delegateCaller];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __95__HMPersonSettingsManager_fetchClassificationNotificationsEnabledForPersonWithUUID_completion___block_invoke_14;
    v30[3] = &unk_1E59454E8;
    id v32 = *(id *)(a1 + 40);
    id v31 = v5;
    [v18 invokeBlock:v30];

    id v12 = v32;
  }
}

uint64_t __95__HMPersonSettingsManager_fetchClassificationNotificationsEnabledForPersonWithUUID_completion___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 1, *(void *)(a1 + 32));
}

void __95__HMPersonSettingsManager_fetchClassificationNotificationsEnabledForPersonWithUUID_completion___block_invoke_16(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
  (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, 1, v2);
}

uint64_t __95__HMPersonSettingsManager_fetchClassificationNotificationsEnabledForPersonWithUUID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    unsigned int v6 = [*(id *)(a1 + 40) BOOLValue];
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling completion with enabled: %lu", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), [*(id *)(a1 + 40) BOOLValue], 0);
}

- (HMPersonSettingsManager)initWithContext:(id)a3 UUID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMPersonSettingsManager;
  id v9 = [(HMPersonSettingsManager *)&v14 init];
  __int16 v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    uint64_t v11 = [(id)objc_opt_class() personSettingsManagerUUIDFromHomeUUID:v8];
    UUID = v10->_UUID;
    v10->_UUID = (NSUUID *)v11;
  }
  return v10;
}

- (HMPersonSettingsManager)initWithHome:(id)a3
{
  id v4 = a3;
  id v5 = [v4 context];
  unsigned int v6 = [v4 uuid];

  id v7 = [(HMPersonSettingsManager *)self initWithContext:v5 UUID:v6];
  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7 != -1) {
    dispatch_once(&logCategory__hmf_once_t7, &__block_literal_global_25594);
  }
  id v2 = (void *)logCategory__hmf_once_v8;

  return v2;
}

uint64_t __38__HMPersonSettingsManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v8;
  logCategory__hmf_once_id v8 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)personSettingsManagerUUIDFromHomeUUID:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F29128];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithUUIDString:@"C23FC973-0266-4A09-BC05-8BB8A48F79C9"];
  unsigned int v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = [v4 UUIDString];

  id v8 = [v7 dataUsingEncoding:4];
  id v9 = objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v5, v8);

  return v9;
}

@end