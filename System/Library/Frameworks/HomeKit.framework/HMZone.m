@interface HMZone
+ (BOOL)supportsSecureCoding;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMHome)home;
- (HMMutableArray)currentRooms;
- (HMZone)init;
- (HMZone)initWithCoder:(id)a3;
- (HMZone)initWithName:(id)a3 uuid:(id)a4;
- (NSArray)rooms;
- (NSString)assistantIdentifier;
- (NSString)name;
- (NSUUID)uniqueIdentifier;
- (NSUUID)uuid;
- (_HMContext)context;
- (id)roomWithUUID:(id)a3;
- (void)__configureWithContext:(id)a3 home:(id)a4;
- (void)_addRoom:(id)a3 completionHandler:(id)a4;
- (void)_recomputeAssistantIdentifier;
- (void)_removeRoom:(id)a3;
- (void)_removeRoom:(id)a3 completionHandler:(id)a4;
- (void)_unconfigure;
- (void)_updateName:(id)a3 completionHandler:(id)a4;
- (void)addRoom:(HMRoom *)room completionHandler:(void *)completion;
- (void)recomputeAssistantIdentifier;
- (void)removeRoom:(HMRoom *)room completionHandler:(void *)completion;
- (void)setAssistantIdentifier:(id)a3;
- (void)setContext:(id)a3;
- (void)setCurrentRooms:(id)a3;
- (void)setHome:(id)a3;
- (void)setName:(id)a3;
- (void)setUuid:(id)a3;
- (void)updateName:(NSString *)name completionHandler:(void *)completion;
@end

@implementation HMZone

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRooms, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (void)setCurrentRooms:(id)a3
{
}

- (HMMutableArray)currentRooms
{
  return self->_currentRooms;
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

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    v7 = [HMObjectMergeCollection alloc];
    v8 = [(HMZone *)self currentRooms];
    v9 = [v8 array];
    v10 = [v6 currentRooms];
    uint64_t v11 = [v10 array];
    v12 = [(HMObjectMergeCollection *)v7 initWithCurrentObjects:v9 newObjects:v11];

    v13 = [(HMObjectMergeCollection *)v12 removedObjects];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __29__HMZone_mergeFromNewObject___block_invoke;
    v37[3] = &unk_1E5943288;
    v37[4] = self;
    [v13 enumerateObjectsUsingBlock:v37];

    v14 = [(HMZone *)self home];
    v15 = [v14 rooms];
    [(HMObjectMergeCollection *)v12 replaceAddedObjectsWithObjects:v15];

    v16 = [(HMObjectMergeCollection *)v12 addedObjects];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __29__HMZone_mergeFromNewObject___block_invoke_18;
    v36[3] = &unk_1E5943288;
    v36[4] = self;
    [v16 enumerateObjectsUsingBlock:v36];

    v17 = [(HMObjectMergeCollection *)v12 finalObjects];
    v18 = [(HMZone *)self currentRooms];
    [v18 setArray:v17];

    v19 = [(HMObjectMergeCollection *)v12 removedObjects];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __29__HMZone_mergeFromNewObject___block_invoke_19;
    v35[3] = &unk_1E5943288;
    v35[4] = self;
    [v19 enumerateObjectsUsingBlock:v35];

    v20 = [(HMObjectMergeCollection *)v12 addedObjects];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __29__HMZone_mergeFromNewObject___block_invoke_22;
    v34[3] = &unk_1E5943288;
    v34[4] = self;
    [v20 enumerateObjectsUsingBlock:v34];

    char v21 = [(HMObjectMergeCollection *)v12 isModified];
    v22 = [(HMZone *)self name];
    v23 = [v6 name];
    LOBYTE(v11) = [v22 isEqualToString:v23];

    if ((v11 & 1) == 0)
    {
      v24 = [v6 name];
      name = self->_name;
      self->_name = v24;

      v26 = [(HMZone *)self home];
      v27 = [v26 delegate];
      if (objc_opt_respondsToSelector())
      {
        v28 = [(HMZone *)self context];
        v29 = [v28 queue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __29__HMZone_mergeFromNewObject___block_invoke_29;
        block[3] = &unk_1E5945650;
        block[4] = self;
        id v32 = v27;
        id v33 = v26;
        dispatch_async(v29, block);
      }
      char v21 = 1;
    }
  }
  else
  {
    char v21 = 0;
  }

  return v21;
}

void __29__HMZone_mergeFromNewObject___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed room via zone merge: %@", (uint8_t *)&v8, 0x16u);
  }
}

void __29__HMZone_mergeFromNewObject___block_invoke_18(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Added room via zone merge: %@", (uint8_t *)&v8, 0x16u);
  }
}

void __29__HMZone_mergeFromNewObject___block_invoke_19(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) home];
  id v5 = [v4 delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [*(id *)(a1 + 32) context];
    v7 = [v6 queue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __29__HMZone_mergeFromNewObject___block_invoke_2;
    v8[3] = &unk_1E5944F20;
    v8[4] = *(void *)(a1 + 32);
    id v9 = v3;
    id v10 = v5;
    id v11 = v4;
    dispatch_async(v7, v8);
  }
}

void __29__HMZone_mergeFromNewObject___block_invoke_22(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) home];
  id v5 = [v4 delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [*(id *)(a1 + 32) context];
    v7 = [v6 queue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __29__HMZone_mergeFromNewObject___block_invoke_2_25;
    v8[3] = &unk_1E5944F20;
    v8[4] = *(void *)(a1 + 32);
    id v9 = v3;
    id v10 = v5;
    id v11 = v4;
    dispatch_async(v7, v8);
  }
}

void __29__HMZone_mergeFromNewObject___block_invoke_29(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__HMZone_mergeFromNewObject___block_invoke_2_30;
  v5[3] = &unk_1E5945650;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 invokeBlock:v5];
}

uint64_t __29__HMZone_mergeFromNewObject___block_invoke_2_30(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didUpdateNameForZone:%@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 40) home:*(void *)(a1 + 48) didUpdateNameForZone:*(void *)(a1 + 32)];
}

void __29__HMZone_mergeFromNewObject___block_invoke_2_25(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__HMZone_mergeFromNewObject___block_invoke_3_26;
  v5[3] = &unk_1E5944F20;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  [v3 invokeBlock:v5];
}

uint64_t __29__HMZone_mergeFromNewObject___block_invoke_3_26(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v9 = 138543874;
    __int16 v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didAddRoom:toZone: with room: %@, zone: %@", (uint8_t *)&v9, 0x20u);
  }
  return [*(id *)(a1 + 48) home:*(void *)(a1 + 56) didAddRoom:*(void *)(a1 + 40) toZone:*(void *)(a1 + 32)];
}

void __29__HMZone_mergeFromNewObject___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__HMZone_mergeFromNewObject___block_invoke_3;
  v5[3] = &unk_1E5944F20;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  [v3 invokeBlock:v5];
}

uint64_t __29__HMZone_mergeFromNewObject___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v9 = 138543874;
    __int16 v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didRemoveRoom:fromZone: with room: %@, zone: %@", (uint8_t *)&v9, 0x20u);
  }
  return [*(id *)(a1 + 48) home:*(void *)(a1 + 56) didRemoveRoom:*(void *)(a1 + 40) fromZone:*(void *)(a1 + 32)];
}

- (HMZone)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"zoneName"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"zoneUUID"];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v6];
  id v8 = [(HMZone *)self initWithName:v5 uuid:v7];
  if (v8)
  {
    int v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"home"];
    objc_storeWeak((id *)&v8->_home, v9);

    currentRooms = v8->_currentRooms;
    __int16 v11 = objc_msgSend(v4, "hm_decodeArrayOfConditionalObjects:forKey:", objc_opt_class(), @"rooms");
    [(HMMutableArray *)currentRooms setArray:v11];
  }
  return v8;
}

- (void)_removeRoom:(id)a3
{
  id v4 = a3;
  id v5 = [(HMZone *)self currentRooms];
  [v5 removeObject:v4];
}

- (id)roomWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMZone *)self currentRooms];
  uint64_t v6 = [v5 firstItemWithUUID:v4];

  return v6;
}

- (void)_removeRoom:(id)a3 completionHandler:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMZone *)self context];
  int v9 = v8;
  if (v8)
  {
    if (v6)
    {
      __int16 v10 = [(HMZone *)self home];
      if (v10)
      {
        __int16 v11 = [v9 messageDispatcher];

        if (v11)
        {
          uint64_t v12 = [(HMZone *)self currentRooms];
          char v13 = [v12 containsObject:v6];

          if (v13)
          {
            uint64_t v14 = [v6 uuid];
            uint64_t v15 = [(HMZone *)self uuid];
            v31 = @"kRoomUUID";
            v16 = [v14 UUIDString];
            id v32 = v16;
            v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
            v26[0] = MEMORY[0x1E4F143A8];
            v26[1] = 3221225472;
            v26[2] = __40__HMZone__removeRoom_completionHandler___block_invoke;
            v26[3] = &unk_1E59441B0;
            id v27 = v9;
            id v29 = v14;
            id v30 = v7;
            v28 = self;
            id v18 = v14;
            -[_HMContext sendMessage:target:payload:responseHandler:](v27, @"kRemoveRoomRequestKey", v15, v17, v26);

LABEL_16:
            goto LABEL_17;
          }
          id v18 = [v9 delegateCaller];
          v23 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v24 = 2;
        }
        else
        {
          id v18 = [v9 delegateCaller];
          v23 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v24 = 21;
        }
      }
      else
      {
        id v18 = [v9 delegateCaller];
        v23 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v24 = 12;
      }
      v25 = [v23 hmErrorWithCode:v24];
      [v18 callCompletion:v7 error:v25];

      goto LABEL_16;
    }
    __int16 v10 = [v8 delegateCaller];
    id v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    [v10 callCompletion:v7 error:v18];
    goto LABEL_16;
  }
  v19 = (void *)MEMORY[0x19F3A64A0]();
  v20 = self;
  char v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v34 = v22;
    __int16 v35 = 2080;
    v36 = "-[HMZone _removeRoom:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v7)
  {
    __int16 v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
LABEL_17:
  }
}

void __40__HMZone__removeRoom_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    id v3 = [*(id *)(a1 + 32) delegateCaller];
    [v3 callCompletion:*(void *)(a1 + 56) error:v7];
  }
  else
  {
    id v4 = [*(id *)(a1 + 40) home];
    id v3 = [v4 roomWithUUID:*(void *)(a1 + 48)];

    if (v3)
    {
      id v5 = [*(id *)(a1 + 40) currentRooms];
      [v5 removeObject:v3];
    }
    id v6 = [*(id *)(a1 + 32) delegateCaller];
    [v6 callCompletion:*(void *)(a1 + 56) error:0];
  }
}

- (void)removeRoom:(HMRoom *)room completionHandler:(void *)completion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = room;
  id v7 = completion;
  id v8 = [(HMZone *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMZone removeRoom:completionHandler:]", @"completion"];
    v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      __int16 v27 = 2112;
      v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  int v9 = v8;
  if (v8)
  {
    __int16 v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__HMZone_removeRoom_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    __int16 v11 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v12 = self;
    char v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v26 = v14;
      __int16 v27 = 2080;
      v28 = "-[HMZone removeRoom:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __39__HMZone_removeRoom_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeRoom:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_addRoom:(id)a3 completionHandler:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMZone *)self context];
  int v9 = v8;
  if (v8)
  {
    if (v6)
    {
      __int16 v10 = [v6 uuid];

      if (v10)
      {
        __int16 v11 = [(HMZone *)self home];
        if (v11)
        {
          uint64_t v12 = [v6 home];
          char v13 = [v12 uuid];
          uint64_t v14 = [v11 uuid];
          char v15 = [v13 isEqual:v14];

          if (v15)
          {
            uint64_t v16 = [v6 uuid];
            v17 = [v11 roomForEntireHome];
            id v18 = [v17 uuid];
            int v19 = [v16 isEqual:v18];

            if (v19)
            {
              id v20 = [v9 delegateCaller];
              id v21 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v22 = 24;
            }
            else
            {
              id v30 = [(HMZone *)self currentRooms];
              int v31 = [v30 containsObject:v6];

              if (!v31)
              {
                id v32 = [v6 uuid];
                id v33 = [(HMZone *)self uuid];
                v41 = @"kRoomUUID";
                v34 = [v32 UUIDString];
                v42 = v34;
                __int16 v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
                v36[0] = MEMORY[0x1E4F143A8];
                v36[1] = 3221225472;
                v36[2] = __37__HMZone__addRoom_completionHandler___block_invoke;
                v36[3] = &unk_1E59441B0;
                id v37 = v9;
                id v39 = v32;
                id v40 = v7;
                v38 = self;
                id v20 = v32;
                -[_HMContext sendMessage:target:payload:responseHandler:](v37, @"kAddRoomRequestKey", v33, v35, v36);

                goto LABEL_18;
              }
              id v20 = [v9 delegateCaller];
              id v21 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v22 = 1;
            }
          }
          else
          {
            id v20 = [v9 delegateCaller];
            id v21 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v22 = 11;
          }
        }
        else
        {
          id v20 = [v9 delegateCaller];
          id v21 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v22 = 12;
        }
        uint64_t v29 = [v21 hmErrorWithCode:v22];
        [v20 callCompletion:v7 error:v29];

LABEL_18:
        goto LABEL_19;
      }
      __int16 v11 = [v9 delegateCaller];
      __int16 v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v28 = 21;
    }
    else
    {
      __int16 v11 = [v8 delegateCaller];
      __int16 v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v28 = 20;
    }
    id v20 = [v27 hmErrorWithCode:v28];
    [v11 callCompletion:v7 error:v20];
    goto LABEL_18;
  }
  v23 = (void *)MEMORY[0x19F3A64A0]();
  id v24 = self;
  v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v44 = v26;
    __int16 v45 = 2080;
    v46 = "-[HMZone _addRoom:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v7)
  {
    __int16 v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
LABEL_19:
  }
}

void __37__HMZone__addRoom_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    id v3 = [*(id *)(a1 + 32) delegateCaller];
    [v3 callCompletion:*(void *)(a1 + 56) error:v7];
  }
  else
  {
    id v4 = [*(id *)(a1 + 40) home];
    id v3 = [v4 roomWithUUID:*(void *)(a1 + 48)];

    if (v3)
    {
      id v5 = [*(id *)(a1 + 40) currentRooms];
      [v5 addObjectIfNotPresent:v3];
    }
    id v6 = [*(id *)(a1 + 32) delegateCaller];
    [v6 callCompletion:*(void *)(a1 + 56) error:0];
  }
}

- (void)addRoom:(HMRoom *)room completionHandler:(void *)completion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = room;
  id v7 = completion;
  id v8 = [(HMZone *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMZone addRoom:completionHandler:]", @"completion"];
    v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = self;
    int v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      __int16 v27 = 2112;
      uint64_t v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  int v9 = v8;
  if (v8)
  {
    __int16 v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__HMZone_addRoom_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    __int16 v11 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v12 = self;
    char v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v26 = v14;
      __int16 v27 = 2080;
      uint64_t v28 = "-[HMZone addRoom:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    char v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __36__HMZone_addRoom_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addRoom:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_updateName:(id)a3 completionHandler:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMZone *)self context];
  int v9 = v8;
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
        char v15 = [(HMZone *)self home];
        if (!v15)
        {
          uint64_t v22 = [v9 delegateCaller];
          uint64_t v28 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
          [v22 callCompletion:v7 error:v28];

          goto LABEL_16;
        }
        v26 = [(HMZone *)self name];
        int v27 = [v26 isEqualToString:v6];

        if (!v27)
        {
          uint64_t v29 = [(HMZone *)self uuid];
          __int16 v35 = @"kZoneName";
          id v36 = v6;
          id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __40__HMZone__updateName_completionHandler___block_invoke;
          v31[3] = &unk_1E5945510;
          id v32 = v9;
          id v33 = self;
          id v34 = v7;
          -[_HMContext sendMessage:target:payload:responseHandler:](v32, @"kRenameZoneRequestKey", v29, v30, v31);

          goto LABEL_17;
        }
        v23 = [v9 delegateCaller];
        uint64_t v22 = v23;
        id v24 = v7;
        v25 = 0;
LABEL_15:
        [v23 callCompletion:v24 error:v25];
LABEL_16:

        goto LABEL_17;
      }
      __int16 v11 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v12 = self;
      char v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v38 = v14;
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@New name is longer than the pre-defined max length", buf, 0xCu);
      }
      char v15 = [v9 delegateCaller];
      uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = 46;
    }
    else
    {
      char v15 = [v8 delegateCaller];
      uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = 20;
    }
    uint64_t v22 = [v16 hmErrorWithCode:v17];
    v23 = v15;
    id v24 = v7;
    v25 = v22;
    goto LABEL_15;
  }
  id v18 = (void *)MEMORY[0x19F3A64A0]();
  int v19 = self;
  id v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    id v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v38 = v21;
    __int16 v39 = 2080;
    id v40 = "-[HMZone _updateName:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v7)
  {
    char v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v15);
LABEL_17:
  }
}

void __40__HMZone__updateName_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
    int v9 = objc_msgSend(a3, "hmf_stringForKey:", @"kZoneName");
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
  id v8 = [(HMZone *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMZone updateName:completionHandler:]", @"completion"];
    uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = self;
    int v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      __int16 v27 = 2112;
      uint64_t v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  int v9 = v8;
  if (v8)
  {
    id v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__HMZone_updateName_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    __int16 v11 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v12 = self;
    char v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v26 = v14;
      __int16 v27 = 2080;
      uint64_t v28 = "-[HMZone updateName:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    char v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __39__HMZone_updateName_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateName:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)recomputeAssistantIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(HMZone *)self _recomputeAssistantIdentifier];

  os_unfair_lock_unlock(p_lock);
}

- (NSString)assistantIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  assistantIdentifier = self->_assistantIdentifier;
  if (!assistantIdentifier)
  {
    [(HMZone *)self _recomputeAssistantIdentifier];
    assistantIdentifier = self->_assistantIdentifier;
  }
  id v5 = assistantIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (void)_recomputeAssistantIdentifier
{
  hm_assistantIdentifierWithSalts(@"ZN", (uint64_t)self->_uuid, 0);
  id v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  assistantIdentifier = self->_assistantIdentifier;
  self->_assistantIdentifier = v3;

  MEMORY[0x1F41817F8](v3, assistantIdentifier);
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

- (void)setUuid:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v6);
  id v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  uuid = self->_uuid;
  self->_uuid = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSUUID)uuid
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_uuid;
  os_unfair_lock_unlock(p_lock);

  return v4;
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
    id v6 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v5;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  uint64_t v7 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (NSArray)rooms
{
  v2 = [(HMZone *)self currentRooms];
  id v3 = [v2 array];

  return (NSArray *)v3;
}

- (void)setName:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSString *)[v6 copy];
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)name
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_name;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)__configureWithContext:(id)a3 home:(id)a4
{
  id v7 = a3;
  [(HMZone *)self setHome:a4];
  id v6 = v7;
  if (v7)
  {
    [(HMZone *)self setContext:v7];
    id v6 = v7;
  }
}

- (void)_unconfigure
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  context = self->_context;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (context)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v8 = HMFGetLogIdentifier();
      int v11 = 138543362;
      uint64_t v12 = v8;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring zone", (uint8_t *)&v11, 0xCu);
    }
    [(HMZone *)v5 setHome:0];
    [(HMZone *)v5 setContext:0];
    int v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 removeObserver:v5];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      uint64_t v12 = v10;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (HMZone)initWithName:(id)a3 uuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMZone;
  id v8 = [(HMZone *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v7);
    uuid = v8->_uuid;
    v8->_uuid = (NSUUID *)v11;

    uint64_t v13 = +[HMMutableArray array];
    currentRooms = v8->_currentRooms;
    v8->_currentRooms = (HMMutableArray *)v13;
  }
  return v8;
}

- (HMZone)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end