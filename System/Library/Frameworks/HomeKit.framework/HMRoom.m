@interface HMRoom
+ (BOOL)supportsSecureCoding;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMApplicationData)applicationData;
- (HMHome)home;
- (HMRoom)init;
- (HMRoom)initWithCoder:(id)a3;
- (HMRoom)initWithName:(id)a3;
- (NSArray)accessories;
- (NSString)assistantIdentifier;
- (NSString)name;
- (NSUUID)uniqueIdentifier;
- (NSUUID)uuid;
- (_HMContext)context;
- (void)__configureWithContext:(id)a3 home:(id)a4;
- (void)_recomputeAssistantIdentifier;
- (void)_unconfigure;
- (void)_updateName:(id)a3 completionHandler:(id)a4;
- (void)recomputeAssistantIdentifier;
- (void)setApplicationData:(id)a3;
- (void)setAssistantIdentifier:(id)a3;
- (void)setContext:(id)a3;
- (void)setHome:(id)a3;
- (void)setName:(id)a3;
- (void)setUuid:(id)a3;
- (void)updateApplicationData:(id)a3 completionHandler:(id)a4;
- (void)updateName:(NSString *)name completionHandler:(void *)completion;
@end

@implementation HMRoom

- (NSUUID)uniqueIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    objc_msgSend(MEMORY[0x1E4F29128], "hm_deriveUUIDFromBaseUUID:", self->_uuid);
    v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v6 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v5;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  v7 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (NSArray)accessories
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v15 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = [(HMRoom *)self home];
  v4 = [v3 accessories];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v10 = [(HMRoom *)self uuid];
        v11 = [v9 room];
        v12 = [v11 uuid];
        int v13 = [v10 isEqual:v12];

        if (v13) {
          [v15 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return (NSArray *)v15;
}

- (NSUUID)uuid
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_uuid;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (HMHome)home
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  os_unfair_lock_unlock(p_lock);

  return (HMHome *)WeakRetained;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMApplicationData)applicationData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_applicationData;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)__configureWithContext:(id)a3 home:(id)a4
{
  id v7 = a3;
  [(HMRoom *)self setHome:a4];
  uint64_t v6 = v7;
  if (v7)
  {
    [(HMRoom *)self setContext:v7];
    uint64_t v6 = v7;
  }
}

- (void)setHome:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_home, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)setContext:(id)a3
{
}

- (NSString)name
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_name;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (HMRoom)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"roomName"];
  uint64_t v6 = [(HMRoom *)self initWithName:v5];
  if (v6)
  {
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"home"];
    objc_storeWeak((id *)&v6->_home, v7);

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"roomUUID"];
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v8];
    uuid = v6->_uuid;
    v6->_uuid = (NSUUID *)v9;

    v11 = [[HMApplicationData alloc] initWithDictionaryFromCoder:v4 key:@"HM.appData"];
    applicationData = v6->_applicationData;
    v6->_applicationData = v11;
  }
  return v6;
}

- (HMRoom)initWithName:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMRoom;
  id v5 = [(HMRoom *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = objc_alloc_init(HMApplicationData);
    applicationData = v5->_applicationData;
    v5->_applicationData = v8;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (void)setAssistantIdentifier:(id)a3
{
}

- (_HMContext)context
{
  return self->_context;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = [(HMRoom *)self home];
    v8 = [(HMRoom *)self name];
    uint64_t v9 = [v6 name];
    char v10 = [v8 isEqualToString:v9];

    if ((v10 & 1) == 0)
    {
      objc_super v11 = [v6 name];
      [(HMRoom *)self setName:v11];

      v12 = [v7 delegate];
      if (objc_opt_respondsToSelector())
      {
        int v13 = [(HMRoom *)self context];
        v14 = [v13 queue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __29__HMRoom_mergeFromNewObject___block_invoke;
        block[3] = &unk_1E5945650;
        block[4] = self;
        id v30 = v12;
        id v31 = v7;
        dispatch_async(v14, block);
      }
    }
    id v15 = [(HMRoom *)self assistantIdentifier];
    long long v16 = [v6 assistantIdentifier];
    char v17 = HMFEqualObjects();

    if (v17)
    {
      char v18 = v10 ^ 1;
    }
    else
    {
      long long v19 = [v6 assistantIdentifier];
      [(HMRoom *)self setAssistantIdentifier:v19];

      char v18 = 1;
    }
    v20 = [(HMRoom *)self applicationData];
    uint64_t v21 = [v6 applicationData];
    char v22 = HMFEqualObjects();

    if ((v22 & 1) == 0)
    {
      v23 = (void *)MEMORY[0x19F3A64A0]();
      v24 = self;
      v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v33 = v26;
        _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_INFO, "%{public}@Updating room application data via merge", buf, 0xCu);
      }
      v27 = [v6 applicationData];
      [(HMRoom *)v24 setApplicationData:v27];

      [v7 notifyDelegateOfAppDataUpdateForRoom:v24];
      char v18 = 1;
    }
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

void __29__HMRoom_mergeFromNewObject___block_invoke(id *a1)
{
  v2 = [a1[4] context];
  v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__HMRoom_mergeFromNewObject___block_invoke_2;
  v6[3] = &unk_1E5945650;
  id v7 = a1[5];
  id v4 = a1[6];
  id v5 = a1[4];
  id v8 = v4;
  id v9 = v5;
  [v3 invokeBlock:v6];
}

uint64_t __29__HMRoom_mergeFromNewObject___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didUpdateNameForRoom:*(void *)(a1 + 48)];
}

- (void)updateApplicationData:(id)a3 completionHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v8 = [(HMRoom *)self context];
  if (!v7)
  {
    uint64_t v20 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMRoom updateApplicationData:completionHandler:]", @"completion"];
    uint64_t v21 = (void *)MEMORY[0x19F3A64A0]();
    char v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v27 = v24;
      __int16 v28 = 2112;
      v29 = (const char *)v20;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v25 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v20 userInfo:0];
    objc_exception_throw(v25);
  }
  id v9 = (void *)v8;
  if (v8)
  {
    char v10 = [(HMRoom *)self home];
    objc_super v11 = v10;
    if (v10)
    {
      [v10 updateApplicationData:v6 forRoom:self completionHandler:v7];
    }
    else
    {
      char v17 = [(HMRoom *)self context];
      char v18 = [v17 delegateCaller];
      long long v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:12 userInfo:0];
      [v18 callCompletion:v7 error:v19];
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x19F3A64A0]();
    int v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v27 = v15;
      __int16 v28 = 2080;
      v29 = "-[HMRoom updateApplicationData:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    long long v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v7[2](v7, v16);
  }
}

- (void)_updateName:(id)a3 completionHandler:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMRoom *)self context];
  if (v8)
  {
    if (!v6)
    {
      uint64_t v20 = [(HMRoom *)self context];
      uint64_t v21 = [v20 delegateCaller];
      char v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:20 userInfo:0];
      [v21 callCompletion:v7 error:v22];

      goto LABEL_20;
    }
    unint64_t v9 = [v6 length];
    if (HMMaxLengthForNaming__hmf_once_t7 != -1) {
      dispatch_once(&HMMaxLengthForNaming__hmf_once_t7, &__block_literal_global_55_24575);
    }
    if (v9 > HMMaxLengthForNaming__hmf_once_v8)
    {
      char v10 = (void *)MEMORY[0x19F3A64A0]();
      objc_super v11 = self;
      v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v61 = v13;
        _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@New name is longer than the pre-defined max length", buf, 0xCu);
      }
      v14 = [v8 delegateCaller];
      id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:46];
      [v14 callCompletion:v7 error:v15];

      goto LABEL_20;
    }
    v23 = (void *)[v6 copy];
    v24 = [(HMRoom *)self home];
    if (v24)
    {
      id v25 = [(HMRoom *)self uuid];
      v26 = [v24 roomForEntireHome];
      v27 = [v26 uuid];
      int v28 = [v25 isEqual:v27];

      if (!v28)
      {
        v33 = [(HMRoom *)self name];
        int v34 = [v33 isEqualToString:v23];

        if (!v34)
        {
          id v35 = objc_alloc(MEMORY[0x1E4F65488]);
          v36 = [(HMRoom *)self uuid];
          v49 = (void *)[v35 initWithTarget:v36];

          v37 = (void *)MEMORY[0x1E4F654B0];
          v58 = @"kRoomName";
          v59 = v23;
          v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
          v39 = [v37 messageWithName:@"kRenameRoomRequestKey" destination:v49 payload:v38];

          objc_initWeak((id *)buf, self);
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __40__HMRoom__updateName_completionHandler___block_invoke;
          aBlock[3] = &unk_1E5944AE0;
          objc_copyWeak(&v57, (id *)buf);
          id v55 = v23;
          id v56 = v7;
          v40 = _Block_copy(aBlock);
          v41 = [(HMRoom *)self context];
          v42 = [v41 pendingRequests];

          v43 = [v39 identifier];
          v44 = _Block_copy(v40);
          [v42 addCompletionBlock:v44 forIdentifier:v43];

          v50[0] = MEMORY[0x1E4F143A8];
          v50[1] = 3221225472;
          v50[2] = __40__HMRoom__updateName_completionHandler___block_invoke_2;
          v50[3] = &unk_1E5945510;
          id v45 = v42;
          id v51 = v45;
          id v46 = v43;
          id v52 = v46;
          id v47 = v40;
          id v53 = v47;
          [v39 setResponseHandler:v50];
          v48 = [v8 messageDispatcher];
          [v48 sendMessage:v39 completionHandler:0];

          objc_destroyWeak(&v57);
          objc_destroyWeak((id *)buf);

          goto LABEL_19;
        }
        v29 = [(HMRoom *)self context];
        uint64_t v30 = [v29 delegateCaller];
        [v30 callCompletion:v7 error:0];
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      v29 = [(HMRoom *)self context];
      uint64_t v30 = [v29 delegateCaller];
      uint64_t v31 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:29 userInfo:0];
    }
    else
    {
      v29 = [(HMRoom *)self context];
      uint64_t v30 = [v29 delegateCaller];
      uint64_t v31 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:12 userInfo:0];
    }
    v32 = (void *)v31;
    [v30 callCompletion:v7 error:v31];

    goto LABEL_18;
  }
  long long v16 = (void *)MEMORY[0x19F3A64A0]();
  char v17 = self;
  char v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    long long v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v61 = v19;
    __int16 v62 = 2080;
    v63 = "-[HMRoom _updateName:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
  }
LABEL_20:
}

void __40__HMRoom__updateName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v8 = WeakRetained;
  if (!v4)
  {
    [WeakRetained setName:*(void *)(a1 + 32)];
    id WeakRetained = v8;
  }
  id v6 = [WeakRetained context];
  id v7 = [v6 delegateCaller];
  [v7 callCompletion:*(void *)(a1 + 40) error:v4];
}

void __40__HMRoom__updateName_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = [*(id *)(a1 + 32) removeCompletionBlockForIdentifier:*(void *)(a1 + 40)];
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)updateName:(NSString *)name completionHandler:(void *)completion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = name;
  id v7 = completion;
  id v8 = [(HMRoom *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMRoom updateName:completionHandler:]", @"completion"];
    char v17 = (void *)MEMORY[0x19F3A64A0]();
    char v18 = self;
    long long v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      __int16 v27 = 2112;
      int v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  unint64_t v9 = v8;
  if (v8)
  {
    char v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__HMRoom_updateName_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    objc_super v11 = (void *)MEMORY[0x19F3A64A0]();
    v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v26 = v14;
      __int16 v27 = 2080;
      int v28 = "-[HMRoom updateName:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __39__HMRoom_updateName_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateName:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)recomputeAssistantIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(HMRoom *)self _recomputeAssistantIdentifier];

  os_unfair_lock_unlock(p_lock);
}

- (NSString)assistantIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  assistantIdentifier = self->_assistantIdentifier;
  if (!assistantIdentifier)
  {
    [(HMRoom *)self _recomputeAssistantIdentifier];
    assistantIdentifier = self->_assistantIdentifier;
  }
  id v5 = assistantIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (void)_recomputeAssistantIdentifier
{
  hm_assistantIdentifierWithSalts(@"RM", (uint64_t)self->_uuid, 0);
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  assistantIdentifier = self->_assistantIdentifier;
  self->_assistantIdentifier = v3;

  MEMORY[0x1F41817F8](v3, assistantIdentifier);
}

- (void)setApplicationData:(id)a3
{
  id v4 = (HMApplicationData *)a3;
  os_unfair_lock_lock_with_options();
  applicationData = self->_applicationData;
  self->_applicationData = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setUuid:(id)a3
{
  id v4 = (NSUUID *)a3;
  os_unfair_lock_lock_with_options();
  uuid = self->_uuid;
  self->_uuid = v4;

  os_unfair_lock_unlock(&self->_lock);
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
      v12 = v8;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring room", (uint8_t *)&v11, 0xCu);
    }
    [(HMRoom *)v5 setHome:0];
    [(HMRoom *)v5 setContext:0];
    unint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 removeObserver:v5];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      char v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (HMRoom)init
{
  return 0;
}

@end