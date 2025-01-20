@interface HMCameraObjectFetchClient
+ (id)logCategory;
- (Class)classForUnarchiving;
- (HMCameraObjectFetchClient)initWithUUID:(id)a3 context:(id)a4 messageName:(id)a5 destination:(id)a6;
- (HMFMessageDestination)destination;
- (NSDictionary)payload;
- (NSMutableArray)fetchedObjects;
- (NSString)messageName;
- (NSUUID)UUID;
- (_HMContext)context;
- (id)logIdentifier;
- (void)dealloc;
- (void)fetchWithCompletion:(id)a3;
- (void)handleDidFetchObjectsMessage:(id)a3;
- (void)setClassForUnarchiving:(Class)a3;
- (void)setPayload:(id)a3;
@end

@implementation HMCameraObjectFetchClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchedObjects, 0);
  objc_storeStrong((id *)&self->_classForUnarchiving, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_messageName, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

- (NSMutableArray)fetchedObjects
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setClassForUnarchiving:(Class)a3
{
}

- (Class)classForUnarchiving
{
  return (Class)objc_getProperty(self, a2, 48, 1);
}

- (void)setPayload:(id)a3
{
}

- (NSDictionary)payload
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (HMFMessageDestination)destination
{
  return (HMFMessageDestination *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)messageName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
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
  v2 = [(HMCameraObjectFetchClient *)self UUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)handleDidFetchObjectsMessage:(id)a3
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 messagePayload];
  v6 = [v5 objectForKeyedSubscript:@"HMCOFC.mk.fo"];

  if (!v6)
  {
    uint64_t v15 = MEMORY[0x19F3A64A0]();
    v16 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      v19 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      v41 = v18;
      __int16 v42 = 2112;
      uint64_t v43 = (uint64_t)v19;
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Could not find fetched objects in message payload: %@", buf, 0x16u);
    }
    v20 = (void *)v15;
    goto LABEL_21;
  }
  v7 = [(HMCameraObjectFetchClient *)self classForUnarchiving];
  if (!v7)
  {
    id v14 = v6;
    objc_opt_class();
    int v21 = objc_opt_isKindOfClass() & 1;
    if (v21) {
      v22 = v14;
    }
    else {
      v22 = 0;
    }
    id v23 = v22;

    if (v21)
    {
LABEL_12:
      v24 = (void *)MEMORY[0x19F3A64A0]();
      v25 = self;
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v27 = HMFGetLogIdentifier();
        uint64_t v28 = [v14 count];
        *(_DWORD *)buf = 138543618;
        v41 = v27;
        __int16 v42 = 2048;
        uint64_t v43 = v28;
        _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_INFO, "%{public}@Handling %lu fetched objects", buf, 0x16u);
      }
      v29 = [(HMCameraObjectFetchClient *)v25 fetchedObjects];
      [v29 addObjectsFromArray:v14];

      [v4 respondWithPayload:0];
      goto LABEL_22;
    }
    uint64_t v35 = MEMORY[0x19F3A64A0]();
    v36 = self;
    v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v41 = v38;
      __int16 v42 = 2112;
      uint64_t v43 = (uint64_t)v14;
      _os_log_impl(&dword_19D1A8000, v37, OS_LOG_TYPE_ERROR, "%{public}@No class for unarchiving and fetchedObjects was not already an array: %@", buf, 0x16u);
    }
    v20 = (void *)v35;
LABEL_21:
    id v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    [v4 respondWithError:v14];
    goto LABEL_22;
  }
  v8 = v7;
  v9 = (void *)MEMORY[0x1E4F28DC0];
  v10 = (void *)MEMORY[0x1E4F1CAD0];
  v46[0] = objc_opt_class();
  v46[1] = v8;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
  v12 = [v10 setWithArray:v11];
  id v39 = 0;
  uint64_t v13 = [v9 unarchivedObjectOfClasses:v12 fromData:v6 error:&v39];
  id v14 = v39;

  if (v13)
  {

    id v14 = (id)v13;
    goto LABEL_12;
  }
  v30 = (void *)MEMORY[0x19F3A64A0]();
  v31 = self;
  v32 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    v33 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v41 = v33;
    __int16 v42 = 2112;
    uint64_t v43 = (uint64_t)v6;
    __int16 v44 = 2112;
    id v45 = v14;
    _os_log_impl(&dword_19D1A8000, v32, OS_LOG_TYPE_ERROR, "%{public}@Could decode encoded fetched objects %@: %@", buf, 0x20u);
  }
  v34 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
  [v4 respondWithError:v34];

LABEL_22:
}

- (void)fetchWithCompletion:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMCameraObjectFetchClient *)self context];
  v6 = [v5 messageDispatcher];
  [v6 registerForMessage:@"HMCOFC.m.dfo" receiver:self selector:sel_handleDidFetchObjectsMessage_];

  v7 = [(HMCameraObjectFetchClient *)self payload];
  v8 = (void *)[v7 mutableCopy];

  v9 = [(HMCameraObjectFetchClient *)self UUID];
  [v8 setObject:v9 forKeyedSubscript:@"HMCOFC.mk.u"];

  v10 = (void *)MEMORY[0x1E4F654B0];
  v11 = [(HMCameraObjectFetchClient *)self messageName];
  v12 = [(HMCameraObjectFetchClient *)self destination];
  uint64_t v13 = [v10 messageWithName:v11 destination:v12 payload:v8];

  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  id v23 = __49__HMCameraObjectFetchClient_fetchWithCompletion___block_invoke;
  v24 = &unk_1E5944EF0;
  v25 = self;
  id v14 = v4;
  id v26 = v14;
  uint64_t v15 = (void *)MEMORY[0x19F3A64A0]([v13 setResponseHandler:&v21]);
  v16 = self;
  v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v28 = v18;
    _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_INFO, "%{public}@Fetching objects", buf, 0xCu);
  }
  v19 = [(HMCameraObjectFetchClient *)v16 context];
  v20 = [v19 messageDispatcher];
  [v20 sendMessage:v13];
}

void __49__HMCameraObjectFetchClient_fetchWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  v9 = HMFGetOSLogHandle();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v11;
      __int16 v27 = 2112;
      uint64_t v28 = (uint64_t)v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch objects: %@", buf, 0x16u);
    }
    v12 = [*(id *)(a1 + 32) context];
    uint64_t v13 = [v12 delegateCaller];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __49__HMCameraObjectFetchClient_fetchWithCompletion___block_invoke_12;
    v22[3] = &unk_1E59454E8;
    id v14 = &v24;
    id v24 = *(id *)(a1 + 40);
    id v23 = v5;
    [v13 invokeBlock:v22];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      v16 = [*(id *)(a1 + 32) fetchedObjects];
      *(_DWORD *)buf = 138543618;
      id v26 = v15;
      __int16 v27 = 2048;
      uint64_t v28 = [v16 count];
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched %lu objects", buf, 0x16u);
    }
    v17 = [*(id *)(a1 + 32) context];
    v18 = [v17 delegateCaller];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __49__HMCameraObjectFetchClient_fetchWithCompletion___block_invoke_14;
    v20[3] = &unk_1E59454E8;
    id v14 = &v21;
    id v19 = *(id *)(a1 + 40);
    v20[4] = *(void *)(a1 + 32);
    id v21 = v19;
    [v18 invokeBlock:v20];
  }
}

uint64_t __49__HMCameraObjectFetchClient_fetchWithCompletion___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __49__HMCameraObjectFetchClient_fetchWithCompletion___block_invoke_14(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) fetchedObjects];
  v2 = (void *)[v3 copy];
  (*(void (**)(uint64_t, void *, void))(v1 + 16))(v1, v2, 0);
}

- (void)dealloc
{
  id v3 = [(HMCameraObjectFetchClient *)self context];
  id v4 = [v3 messageDispatcher];
  [v4 deregisterReceiver:self];

  v5.receiver = self;
  v5.super_class = (Class)HMCameraObjectFetchClient;
  [(HMCameraObjectFetchClient *)&v5 dealloc];
}

- (HMCameraObjectFetchClient)initWithUUID:(id)a3 context:(id)a4 messageName:(id)a5 destination:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)HMCameraObjectFetchClient;
  uint64_t v15 = [(HMCameraObjectFetchClient *)&v25 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_UUID, a3);
    objc_storeStrong((id *)&v16->_context, a4);
    uint64_t v17 = [v13 copy];
    messageName = v16->_messageName;
    v16->_messageName = (NSString *)v17;

    uint64_t v19 = [v14 copy];
    destination = v16->_destination;
    v16->_destination = (HMFMessageDestination *)v19;

    payload = v16->_payload;
    v16->_payload = (NSDictionary *)MEMORY[0x1E4F1CC08];

    uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
    fetchedObjects = v16->_fetchedObjects;
    v16->_fetchedObjects = (NSMutableArray *)v22;
  }
  return v16;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_35993 != -1) {
    dispatch_once(&logCategory__hmf_once_t8_35993, &__block_literal_global_35994);
  }
  v2 = (void *)logCategory__hmf_once_v9_35995;

  return v2;
}

uint64_t __40__HMCameraObjectFetchClient_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v9_35995;
  logCategory__hmf_once_v9_35995 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end