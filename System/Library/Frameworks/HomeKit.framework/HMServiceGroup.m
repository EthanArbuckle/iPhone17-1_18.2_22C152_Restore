@interface HMServiceGroup
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMApplicationData)applicationData;
- (HMHome)home;
- (HMMutableArray)currentServices;
- (HMServiceGroup)init;
- (HMServiceGroup)initWithCoder:(id)a3;
- (HMServiceGroup)initWithName:(id)a3 uuid:(id)a4;
- (NSArray)services;
- (NSString)assistantIdentifier;
- (NSString)name;
- (NSUUID)uniqueIdentifier;
- (NSUUID)uuid;
- (_HMContext)context;
- (id)logIdentifier;
- (void)__configureWithContext:(id)a3 home:(id)a4;
- (void)_addOrRemove:(BOOL)a3 service:(id)a4 completionHandler:(id)a5;
- (void)_recomputeAssistantIdentifier;
- (void)_removeServices:(id)a3;
- (void)_unconfigure;
- (void)_updateName:(id)a3 completionHandler:(id)a4;
- (void)addService:(HMService *)service completionHandler:(void *)completion;
- (void)recomputeAssistantIdentifier;
- (void)removeService:(HMService *)service completionHandler:(void *)completion;
- (void)setApplicationData:(id)a3;
- (void)setAssistantIdentifier:(id)a3;
- (void)setContext:(id)a3;
- (void)setCurrentServices:(id)a3;
- (void)setHome:(id)a3;
- (void)setName:(id)a3;
- (void)updateApplicationData:(id)a3 completionHandler:(id)a4;
- (void)updateName:(NSString *)name completionHandler:(void *)completion;
@end

@implementation HMServiceGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentServices, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (void)setCurrentServices:(id)a3
{
}

- (HMMutableArray)currentServices
{
  return self->_currentServices;
}

- (void)setContext:(id)a3
{
}

- (_HMContext)context
{
  return self->_context;
}

- (void)setAssistantIdentifier:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4 = a3;
  v5 = [HMObjectMergeCollection alloc];
  v6 = [(HMServiceGroup *)self currentServices];
  v7 = [v6 array];
  v8 = [v4 currentServices];
  v9 = [v8 array];
  v10 = [(HMObjectMergeCollection *)v5 initWithCurrentObjects:v7 newObjects:v9];

  v11 = [(HMObjectMergeCollection *)v10 removedObjects];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __37__HMServiceGroup_mergeFromNewObject___block_invoke;
  v45[3] = &unk_1E59429A8;
  v45[4] = self;
  [v11 enumerateObjectsUsingBlock:v45];

  v12 = [MEMORY[0x1E4F1CA48] array];
  v13 = [(HMObjectMergeCollection *)v10 addedObjects];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __37__HMServiceGroup_mergeFromNewObject___block_invoke_51;
  v43[3] = &unk_1E5940980;
  v43[4] = self;
  id v14 = v12;
  id v44 = v14;
  [v13 enumerateObjectsUsingBlock:v43];

  [(HMObjectMergeCollection *)v10 replaceAddedObjectsWithObjects:v14];
  v15 = [(HMObjectMergeCollection *)v10 finalObjects];
  v16 = [(HMServiceGroup *)self currentServices];
  [v16 setArray:v15];

  v17 = [(HMObjectMergeCollection *)v10 removedObjects];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __37__HMServiceGroup_mergeFromNewObject___block_invoke_52;
  v42[3] = &unk_1E59429A8;
  v42[4] = self;
  [v17 enumerateObjectsUsingBlock:v42];

  v18 = [(HMObjectMergeCollection *)v10 addedObjects];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __37__HMServiceGroup_mergeFromNewObject___block_invoke_53;
  v41[3] = &unk_1E59429A8;
  v41[4] = self;
  [v18 enumerateObjectsUsingBlock:v41];

  v19 = [(HMServiceGroup *)self name];
  v20 = [v4 name];
  char v21 = [v19 isEqualToString:v20];

  if ((v21 & 1) == 0)
  {
    v22 = [v4 name];
    [(HMServiceGroup *)self setName:v22];

    v23 = [(HMServiceGroup *)self home];
    v24 = [v23 delegate];
    if (objc_opt_respondsToSelector())
    {
      v25 = [(HMServiceGroup *)self context];
      v26 = [v25 queue];
      uint64_t v34 = MEMORY[0x1E4F143A8];
      uint64_t v35 = 3221225472;
      v36 = __37__HMServiceGroup_mergeFromNewObject___block_invoke_60;
      v37 = &unk_1E5945650;
      v38 = self;
      id v39 = v24;
      id v40 = v23;
      dispatch_async(v26, &v34);
    }
  }
  v27 = [(HMServiceGroup *)self applicationData];
  v28 = [v4 applicationData];
  char v29 = HMFEqualObjects();

  if (v29)
  {
    char v30 = v21 ^ 1;
  }
  else
  {
    v31 = [v4 applicationData];
    [(HMServiceGroup *)self setApplicationData:v31];

    v32 = [(HMServiceGroup *)self home];
    [v32 notifyDelegateOfAppDataUpdateForServiceGroup:self];

    char v30 = 1;
  }

  return v30;
}

void __37__HMServiceGroup_mergeFromNewObject___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed service via service group merge: %@", (uint8_t *)&v8, 0x16u);
  }
}

void __37__HMServiceGroup_mergeFromNewObject___block_invoke_51(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) home];
  id v5 = [v3 accessory];
  v6 = [v5 uuid];
  v7 = [v4 accessoryWithUUID:v6];

  if (v7)
  {
    int v8 = [v3 instanceID];
    v9 = [v7 _findService:v8];

    __int16 v10 = (void *)MEMORY[0x19F3A64A0]();
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = HMFGetOSLogHandle();
    v13 = v12;
    if (v9)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v14 = HMFGetLogIdentifier();
        int v23 = 138543618;
        v24 = v14;
        __int16 v25 = 2112;
        id v26 = v3;
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Added service via service group merge: %@", (uint8_t *)&v23, 0x16u);
      }
      [*(id *)(a1 + 40) addObject:v9];
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        char v21 = HMFGetLogIdentifier();
        v22 = [v3 instanceID];
        int v23 = 138543874;
        v24 = v21;
        __int16 v25 = 2112;
        id v26 = v22;
        __int16 v27 = 2112;
        v28 = v7;
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to find service with instance ID : %@ on accessory : %@", (uint8_t *)&v23, 0x20u);
      }
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x19F3A64A0]();
    id v16 = *(id *)(a1 + 32);
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      v19 = [v3 accessory];
      v20 = [v19 uuid];
      int v23 = 138543618;
      v24 = v18;
      __int16 v25 = 2112;
      id v26 = v20;
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to find the accessory with UUID : %@", (uint8_t *)&v23, 0x16u);
    }
  }
}

void __37__HMServiceGroup_mergeFromNewObject___block_invoke_52(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) home];
  id v5 = [v4 delegate];
  if (objc_opt_respondsToSelector())
  {
    v6 = [*(id *)(a1 + 32) context];
    v7 = [v6 queue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __37__HMServiceGroup_mergeFromNewObject___block_invoke_2;
    v8[3] = &unk_1E5944F20;
    v8[4] = *(void *)(a1 + 32);
    id v9 = v3;
    id v10 = v5;
    id v11 = v4;
    dispatch_async(v7, v8);
  }
}

void __37__HMServiceGroup_mergeFromNewObject___block_invoke_53(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) home];
  id v5 = [v4 delegate];
  if (objc_opt_respondsToSelector())
  {
    v6 = [*(id *)(a1 + 32) context];
    v7 = [v6 queue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __37__HMServiceGroup_mergeFromNewObject___block_invoke_2_56;
    v8[3] = &unk_1E5944F20;
    v8[4] = *(void *)(a1 + 32);
    id v9 = v3;
    id v10 = v5;
    id v11 = v4;
    dispatch_async(v7, v8);
  }
}

void __37__HMServiceGroup_mergeFromNewObject___block_invoke_60(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__HMServiceGroup_mergeFromNewObject___block_invoke_2_61;
  v5[3] = &unk_1E5945650;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 invokeBlock:v5];
}

uint64_t __37__HMServiceGroup_mergeFromNewObject___block_invoke_2_61(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 32) name];
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didUpdateNameForServiceGroup : %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 40) home:*(void *)(a1 + 48) didUpdateNameForServiceGroup:*(void *)(a1 + 32)];
}

void __37__HMServiceGroup_mergeFromNewObject___block_invoke_2_56(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__HMServiceGroup_mergeFromNewObject___block_invoke_3_57;
  v5[3] = &unk_1E5944F20;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  [v3 invokeBlock:v5];
}

uint64_t __37__HMServiceGroup_mergeFromNewObject___block_invoke_3_57(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didAddService with service: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 48) home:*(void *)(a1 + 56) didAddService:*(void *)(a1 + 40) toServiceGroup:*(void *)(a1 + 32)];
}

void __37__HMServiceGroup_mergeFromNewObject___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__HMServiceGroup_mergeFromNewObject___block_invoke_3;
  v5[3] = &unk_1E5944F20;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  [v3 invokeBlock:v5];
}

uint64_t __37__HMServiceGroup_mergeFromNewObject___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didRemoveService with service: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 48) home:*(void *)(a1 + 56) didRemoveService:*(void *)(a1 + 40) fromServiceGroup:*(void *)(a1 + 32)];
}

- (id)logIdentifier
{
  v2 = [(HMServiceGroup *)self uniqueIdentifier];
  id v3 = [v2 UUIDString];

  return v3;
}

- (HMServiceGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceGroupName"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceGroupUUID"];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v6];
  int v8 = [(HMServiceGroup *)self initWithName:v5 uuid:v7];
  if (v8)
  {
    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"home"];
    objc_storeWeak((id *)&v8->_home, v9);

    currentServices = v8->_currentServices;
    uint64_t v11 = objc_msgSend(v4, "hm_decodeArrayOfConditionalObjects:forKey:", objc_opt_class(), @"serviceGroupServices");
    [(HMMutableArray *)currentServices setArray:v11];

    uint64_t v12 = [[HMApplicationData alloc] initWithDictionaryFromCoder:v4 key:@"HM.appData"];
    applicationData = v8->_applicationData;
    v8->_applicationData = v12;
  }
  return v8;
}

- (void)updateApplicationData:(id)a3 completionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v6 = a4;
  if (!v6)
  {
    uint64_t v13 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMServiceGroup updateApplicationData:completionHandler:]", @"completion"];
    id v14 = (void *)MEMORY[0x19F3A64A0]();
    v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      char v21 = v17;
      __int16 v22 = 2112;
      uint64_t v23 = v13;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v13 userInfo:0];
    objc_exception_throw(v18);
  }
  id v7 = v6;
  int v8 = [(HMServiceGroup *)self home];
  id v9 = v8;
  if (v8)
  {
    [v8 updateApplicationData:v19 forServiceGroup:self completionHandler:v7];
  }
  else
  {
    __int16 v10 = [(HMServiceGroup *)self context];
    uint64_t v11 = [v10 delegateCaller];
    uint64_t v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    [v11 callCompletion:v7 error:v12];
  }
}

- (void)_addOrRemove:(BOOL)a3 service:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  __int16 v10 = [(HMServiceGroup *)self context];
  uint64_t v11 = v10;
  if (v10)
  {
    if (!v8)
    {
      uint64_t v12 = [v10 delegateCaller];
      uint64_t v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      [v12 callCompletion:v9 error:v13];
LABEL_26:

      goto LABEL_27;
    }
    uint64_t v12 = [(HMServiceGroup *)self home];
    if (v12)
    {
      uint64_t v13 = [v8 accessory];
      uint64_t v14 = [v13 home];
      v15 = (void *)v14;
      if (v13 && v14)
      {
        id v16 = [v12 uuid];
        v41 = v15;
        v17 = [v15 uuid];
        char v18 = [v16 isEqual:v17];

        if (v18)
        {
          id v19 = [(HMServiceGroup *)self currentServices];
          int v20 = [v19 containsObject:v8];

          if (v20 && v6)
          {
            char v21 = [v11 delegateCaller];
            __int16 v22 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v23 = 1;
          }
          else
          {
            if ((v20 | v6))
            {
              char v30 = [v13 uuid];
              v36 = v30;
              v31 = [v8 instanceID];
              v32 = @"kRemoveServiceRequestKey";
              if (v6) {
                v32 = @"kAddServiceRequestKey";
              }
              id v40 = v32;
              id v39 = [(HMServiceGroup *)self uuid];
              v49[0] = @"kAccessoryUUID";
              v38 = [v30 UUIDString];
              v49[1] = @"kServiceInstanceID";
              v50[0] = v38;
              v50[1] = v31;
              v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];
              v42[0] = MEMORY[0x1E4F143A8];
              v42[1] = 3221225472;
              v42[2] = __57__HMServiceGroup__addOrRemove_service_completionHandler___block_invoke;
              v42[3] = &unk_1E5940958;
              id v43 = v11;
              id v44 = self;
              id v45 = v36;
              id v46 = v31;
              id v47 = v9;
              BOOL v48 = v6;
              id v37 = v31;
              id v34 = v36;
              -[_HMContext sendMessage:target:payload:responseHandler:](v43, v40, v39, v33, v42);

              goto LABEL_24;
            }
            char v21 = [v11 delegateCaller];
            __int16 v22 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v23 = 2;
          }
        }
        else
        {
          char v21 = [v11 delegateCaller];
          __int16 v22 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v23 = 11;
        }
        uint64_t v35 = [v22 hmErrorWithCode:v23];
        [v21 callCompletion:v9 error:v35];

LABEL_24:
        v15 = v41;
        goto LABEL_25;
      }
      v28 = [v11 delegateCaller];
      uint64_t v29 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
      [v28 callCompletion:v9 error:v29];
    }
    else
    {
      uint64_t v13 = [v11 delegateCaller];
      v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
      [v13 callCompletion:v9 error:v15];
    }
LABEL_25:

    goto LABEL_26;
  }
  uint64_t v24 = (void *)MEMORY[0x19F3A64A0]();
  __int16 v25 = self;
  id v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    __int16 v27 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v52 = v27;
    __int16 v53 = 2080;
    v54 = "-[HMServiceGroup _addOrRemove:service:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v9)
  {
    uint64_t v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v9 + 2))(v9, v12);
LABEL_27:
  }
}

void __57__HMServiceGroup__addOrRemove_service_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  if (v10)
  {
    id v3 = [*(id *)(a1 + 32) delegateCaller];
    [v3 callCompletion:*(void *)(a1 + 64) error:v10];
  }
  else
  {
    id v4 = [*(id *)(a1 + 40) home];
    id v5 = [v4 accessoryWithUUID:*(void *)(a1 + 48)];
    id v3 = [v5 _findService:*(void *)(a1 + 56)];

    if (v3)
    {
      int v6 = *(unsigned __int8 *)(a1 + 72);
      id v7 = [*(id *)(a1 + 40) currentServices];
      id v8 = v7;
      if (v6) {
        [v7 addObjectIfNotPresent:v3];
      }
      else {
        [v7 removeObject:v3];
      }
    }
    id v9 = [*(id *)(a1 + 32) delegateCaller];
    [v9 callCompletion:*(void *)(a1 + 64) error:0];
  }
}

- (void)removeService:(HMService *)service completionHandler:(void *)completion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v6 = service;
  id v7 = completion;
  id v8 = [(HMServiceGroup *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMServiceGroup removeService:completionHandler:]", @"completion"];
    v17 = (void *)MEMORY[0x19F3A64A0]();
    char v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v20;
      __int16 v27 = 2112;
      v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__HMServiceGroup_removeService_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    uint64_t v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v14;
      __int16 v27 = 2080;
      v28 = "-[HMServiceGroup removeService:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __50__HMServiceGroup_removeService_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addOrRemove:0 service:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)addService:(HMService *)service completionHandler:(void *)completion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v6 = service;
  id v7 = completion;
  id v8 = [(HMServiceGroup *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMServiceGroup addService:completionHandler:]", @"completion"];
    v17 = (void *)MEMORY[0x19F3A64A0]();
    char v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v20;
      __int16 v27 = 2112;
      v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__HMServiceGroup_addService_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    uint64_t v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v14;
      __int16 v27 = 2080;
      v28 = "-[HMServiceGroup addService:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __47__HMServiceGroup_addService_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addOrRemove:1 service:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_updateName:(id)a3 completionHandler:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMServiceGroup *)self context];
  id v9 = v8;
  if (v8)
  {
    if (v6)
    {
      unint64_t v10 = [v6 length];
      if (HMMaxLengthForNaming__hmf_once_t7 != -1) {
        dispatch_once(&HMMaxLengthForNaming__hmf_once_t7, &__block_literal_global_55_24575);
      }
      if (v10 <= HMMaxLengthForNaming__hmf_once_v8)
      {
        v15 = [(HMServiceGroup *)self home];
        if (!v15)
        {
          __int16 v22 = [v9 delegateCaller];
          v28 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
          [v22 callCompletion:v7 error:v28];

          goto LABEL_16;
        }
        id v26 = [(HMServiceGroup *)self name];
        int v27 = [v26 isEqualToString:v6];

        if (!v27)
        {
          uint64_t v29 = [(HMServiceGroup *)self uuid];
          uint64_t v35 = @"kServiceGroupName";
          id v36 = v6;
          char v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __48__HMServiceGroup__updateName_completionHandler___block_invoke;
          v31[3] = &unk_1E5945510;
          id v32 = v9;
          v33 = self;
          id v34 = v7;
          -[_HMContext sendMessage:target:payload:responseHandler:](v32, @"kRenameServiceGroupRequestKey", v29, v30, v31);

          goto LABEL_17;
        }
        uint64_t v23 = [v9 delegateCaller];
        __int16 v22 = v23;
        id v24 = v7;
        __int16 v25 = 0;
LABEL_15:
        [v23 callCompletion:v24 error:v25];
LABEL_16:

        goto LABEL_17;
      }
      uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v12 = self;
      uint64_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v38 = v14;
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@New name is longer than the pre-defined max length", buf, 0xCu);
      }
      v15 = [v9 delegateCaller];
      uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = 46;
    }
    else
    {
      v15 = [v8 delegateCaller];
      uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = 20;
    }
    __int16 v22 = [v16 hmErrorWithCode:v17];
    uint64_t v23 = v15;
    id v24 = v7;
    __int16 v25 = v22;
    goto LABEL_15;
  }
  char v18 = (void *)MEMORY[0x19F3A64A0]();
  id v19 = self;
  int v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    id v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v38 = v21;
    __int16 v39 = 2080;
    id v40 = "-[HMServiceGroup _updateName:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v7)
  {
    v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v15);
LABEL_17:
  }
}

void __48__HMServiceGroup__updateName_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  if (v10)
  {
    id v5 = [*(id *)(a1 + 32) delegateCaller];
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = v10;
  }
  else
  {
    id v9 = objc_msgSend(a3, "hmf_stringForKey:", @"kServiceGroupName");
    [*(id *)(a1 + 40) setName:v9];

    id v5 = [*(id *)(a1 + 32) delegateCaller];
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = 0;
  }
  [v5 callCompletion:v7 error:v8];
}

- (void)updateName:(NSString *)name completionHandler:(void *)completion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = name;
  uint64_t v7 = completion;
  id v8 = [(HMServiceGroup *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMServiceGroup updateName:completionHandler:]", @"completion"];
    uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
    char v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v20;
      __int16 v27 = 2112;
      v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__HMServiceGroup_updateName_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    uint64_t v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v14;
      __int16 v27 = 2080;
      v28 = "-[HMServiceGroup updateName:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __47__HMServiceGroup_updateName_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateName:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_removeServices:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v32 = [MEMORY[0x1E4F1CA48] array];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v3;
  uint64_t v29 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v52;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v52 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = v4;
        id v5 = *(void **)(*((void *)&v51 + 1) + 8 * v4);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v34 = [(HMServiceGroup *)self services];
        uint64_t v6 = [v34 countByEnumeratingWithState:&v47 objects:v56 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v48;
          do
          {
            uint64_t v9 = 0;
            uint64_t v33 = v7;
            do
            {
              if (*(void *)v48 != v8) {
                objc_enumerationMutation(v34);
              }
              id v10 = *(void **)(*((void *)&v47 + 1) + 8 * v9);
              uint64_t v11 = [v10 accessory];
              uint64_t v12 = [v11 uuid];
              uint64_t v13 = [v5 accessory];
              uint64_t v14 = [v13 uuid];
              if ([v12 isEqual:v14])
              {
                v15 = [v10 instanceID];
                [v5 instanceID];
                v17 = uint64_t v16 = v8;
                int v36 = [v15 isEqualToNumber:v17];

                uint64_t v8 = v16;
                uint64_t v7 = v33;

                if (v36) {
                  [v32 addObject:v10];
                }
              }
              else
              {
              }
              ++v9;
            }
            while (v7 != v9);
            uint64_t v7 = [v34 countByEnumeratingWithState:&v47 objects:v56 count:16];
          }
          while (v7);
        }

        uint64_t v4 = v31 + 1;
      }
      while (v31 + 1 != v29);
      uint64_t v29 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v29);
  }

  char v18 = [(HMServiceGroup *)self currentServices];
  [v18 removeObjectsInArray:v32];

  id v35 = [(HMServiceGroup *)self home];
  id v19 = [v35 delegate];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v37 = v32;
  uint64_t v20 = [v37 countByEnumeratingWithState:&v43 objects:v55 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v44 != v22) {
          objc_enumerationMutation(v37);
        }
        uint64_t v24 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          __int16 v25 = [(HMServiceGroup *)self context];
          id v26 = [v25 delegateCaller];
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __34__HMServiceGroup__removeServices___block_invoke;
          v38[3] = &unk_1E5944F20;
          id v39 = v19;
          id v40 = v35;
          uint64_t v41 = v24;
          v42 = self;
          [v26 invokeBlock:v38];
        }
      }
      uint64_t v21 = [v37 countByEnumeratingWithState:&v43 objects:v55 count:16];
    }
    while (v21);
  }
}

uint64_t __34__HMServiceGroup__removeServices___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didRemoveService:*(void *)(a1 + 48) fromServiceGroup:*(void *)(a1 + 56)];
}

- (void)recomputeAssistantIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(HMServiceGroup *)self _recomputeAssistantIdentifier];

  os_unfair_lock_unlock(p_lock);
}

- (NSString)assistantIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  assistantIdentifier = self->_assistantIdentifier;
  if (!assistantIdentifier)
  {
    [(HMServiceGroup *)self _recomputeAssistantIdentifier];
    assistantIdentifier = self->_assistantIdentifier;
  }
  id v5 = assistantIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (void)_recomputeAssistantIdentifier
{
  hm_assistantIdentifierWithSalts(@"SG", (uint64_t)self->_uuid, 0);
  id v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  assistantIdentifier = self->_assistantIdentifier;
  self->_assistantIdentifier = v3;

  MEMORY[0x1F41817F8](v3, assistantIdentifier);
}

- (void)setApplicationData:(id)a3
{
  uint64_t v4 = (HMApplicationData *)a3;
  os_unfair_lock_lock_with_options();
  applicationData = self->_applicationData;
  self->_applicationData = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMApplicationData)applicationData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_applicationData;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setHome:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_home, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HMHome)home
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  os_unfair_lock_unlock(p_lock);

  return (HMHome *)WeakRetained;
}

- (NSUUID)uniqueIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    objc_msgSend(MEMORY[0x1E4F29128], "hm_deriveUUIDFromBaseUUID:", self->_uuid);
    id v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v5;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  uint64_t v7 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (NSArray)services
{
  v2 = [(HMServiceGroup *)self currentServices];
  id v3 = [v2 array];

  return (NSArray *)v3;
}

- (void)setName:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = (NSString *)[v6 copy];
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)name
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_name;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)__configureWithContext:(id)a3 home:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    uint64_t v13 = v11;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Configuring with context: %@", (uint8_t *)&v12, 0x16u);
  }
  [(HMServiceGroup *)v9 setHome:v7];
  if (v6) {
    [(HMServiceGroup *)v9 setContext:v6];
  }
}

- (void)_unconfigure
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  context = self->_context;
  uint64_t v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (context)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v11 = 138543362;
      int v12 = v8;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring serviceGroup", (uint8_t *)&v11, 0xCu);
    }
    [(HMServiceGroup *)v5 setHome:0];
    [(HMServiceGroup *)v5 setContext:0];
    uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 removeObserver:v5];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      int v12 = v10;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (HMServiceGroup)initWithName:(id)a3 uuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMServiceGroup;
  uint64_t v8 = [(HMServiceGroup *)&v18 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v7);
    uuid = v8->_uuid;
    v8->_uuid = (NSUUID *)v11;

    uint64_t v13 = +[HMMutableArray array];
    currentServices = v8->_currentServices;
    v8->_currentServices = (HMMutableArray *)v13;

    id v15 = objc_alloc_init(HMApplicationData);
    applicationData = v8->_applicationData;
    v8->_applicationData = v15;
  }
  return v8;
}

- (HMServiceGroup)init
{
  return 0;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t22_25086 != -1) {
    dispatch_once(&logCategory__hmf_once_t22_25086, &__block_literal_global_25087);
  }
  v2 = (void *)logCategory__hmf_once_v23_25088;

  return v2;
}

uint64_t __29__HMServiceGroup_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v23_25088;
  logCategory__hmf_once_v23_25088 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end