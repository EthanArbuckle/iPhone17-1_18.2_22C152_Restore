@interface HMBulletinBoardNotification
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)isEnabled;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMBulletinBoardNotification)initWithCoder:(id)a3;
- (HMBulletinBoardNotification)initWithEnabled:(BOOL)a3 condition:(id)a4 service:(id)a5 messageTargetUUID:(id)a6;
- (HMService)service;
- (NSPredicate)condition;
- (NSUUID)messageTargetUUID;
- (NSUUID)uniqueIdentifier;
- (_HMContext)context;
- (id)logIdentifier;
- (void)__configureWithContext:(id)a3;
- (void)_callBulletinBoardNotificationUpdatedDelegate;
- (void)_commitWithCompletionHandler:(id)a3;
- (void)_handleBulletinBoardNotificationUpdateNotification:(id)a3;
- (void)_registerNotificationHandlers;
- (void)_unconfigure;
- (void)commitWithCompletionHandler:(id)a3;
- (void)setCondition:(id)a3;
- (void)setContext:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation HMBulletinBoardNotification

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)__configureWithContext:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x19F3A64A0]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    v10 = v8;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Configuring with context: %@", (uint8_t *)&v9, 0x16u);
  }
  [(HMBulletinBoardNotification *)v6 setContext:v4];
  [(HMBulletinBoardNotification *)v6 _registerNotificationHandlers];
}

- (void)setContext:(id)a3
{
}

- (void)_registerNotificationHandlers
{
  id v4 = [(HMBulletinBoardNotification *)self context];
  v3 = [v4 messageDispatcher];
  [v3 registerForMessage:@"kBulletinBoardNotificationUpdateNotificationKey" receiver:self selector:sel__handleBulletinBoardNotificationUpdateNotification_];
}

- (_HMContext)context
{
  return self->_context;
}

- (HMBulletinBoardNotification)initWithCoder:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"service"];
  uint64_t v6 = [v5 accessory];
  v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    int v9 = (void *)MEMORY[0x19F3A64A0]();
    v25 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      __int16 v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v31 = v11;
      __int16 v32 = 2112;
      v33 = v5;
      __int16 v34 = 2112;
      v35 = v7;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded service: %@, accessory: %@", buf, 0x20u);
    }
    v26 = 0;
  }
  else
  {
    uint64_t v12 = [v4 decodeBoolForKey:@"HM.BulletinBoardNotificationEnabled"];
    uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
    v15 = [v13 setWithArray:v14];
    v16 = [v4 decodeObjectOfClasses:v15 forKey:@"HM.BulletinBoardNotificationCondition"];

    v17 = [v7 home];
    v18 = +[HMPredicateUtilities rewritePredicateForClient:v16 home:v17];

    v19 = [v5 instanceID];
    v20 = [v19 stringValue];
    v28[0] = v20;
    v28[1] = @"HM.BulletinBoardNotification";
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];

    v22 = (void *)MEMORY[0x1E4F29128];
    v23 = [v7 uuid];
    v24 = objc_msgSend(v22, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v23, 0, v21);

    v25 = [(HMBulletinBoardNotification *)self initWithEnabled:v12 condition:v18 service:v5 messageTargetUUID:v24];
    v26 = v25;
  }

  return v26;
}

- (HMBulletinBoardNotification)initWithEnabled:(BOOL)a3 condition:(id)a4 service:(id)a5 messageTargetUUID:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HMBulletinBoardNotification;
  v14 = [(HMBulletinBoardNotification *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_enabled = a3;
    objc_storeStrong((id *)&v14->_condition, a4);
    objc_storeWeak((id *)&v15->_service, v12);
    objc_storeStrong((id *)&v15->_messageTargetUUID, a6);
  }

  return v15;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t14_59972 != -1) {
    dispatch_once(&logCategory__hmf_once_t14_59972, &__block_literal_global_59973);
  }
  v2 = (void *)logCategory__hmf_once_v15_59974;

  return v2;
}

uint64_t __42__HMBulletinBoardNotification_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v15_59974;
  logCategory__hmf_once_v15_59974 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_service);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_condition, 0);
}

- (HMService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);

  return (HMService *)WeakRetained;
}

- (NSUUID)messageTargetUUID
{
  return self->_messageTargetUUID;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  v7 = [(HMBulletinBoardNotification *)self condition];
  BOOL v8 = [v6 condition];
  char v9 = HMFEqualObjects();

  if ((v9 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x19F3A64A0]();
    id v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      v14 = [(HMBulletinBoardNotification *)v11 condition];
      v15 = [v6 condition];
      int v25 = 138543874;
      v26 = v13;
      __int16 v27 = 2112;
      v28 = v14;
      __int16 v29 = 2112;
      v30 = v15;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Merging due to condition value change from %@ to %@", (uint8_t *)&v25, 0x20u);
    }
    v16 = [v6 condition];
    [(HMBulletinBoardNotification *)v11 setCondition:v16];
  }
  int v17 = [(HMBulletinBoardNotification *)self isEnabled];
  if (v17 != [v6 isEnabled])
  {
    v18 = (void *)MEMORY[0x19F3A64A0]();
    v19 = self;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = HMFGetLogIdentifier();
      [(HMBulletinBoardNotification *)v19 isEnabled];
      v22 = HMFBooleanToString();
      [v6 isEnabled];
      v23 = HMFBooleanToString();
      int v25 = 138543874;
      v26 = v21;
      __int16 v27 = 2112;
      v28 = v22;
      __int16 v29 = 2112;
      v30 = v23;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_INFO, "%{public}@Merging due to enabled value change from %@ to %@", (uint8_t *)&v25, 0x20u);
    }
    -[HMBulletinBoardNotification setEnabled:](v19, "setEnabled:", [v6 isEnabled]);
  }

  return v9 ^ 1;
}

- (id)logIdentifier
{
  v3 = NSString;
  id v4 = [(HMBulletinBoardNotification *)self service];
  v5 = [v4 name];
  id v6 = [(HMBulletinBoardNotification *)self messageTargetUUID];
  v7 = [v3 stringWithFormat:@"%@/%@", v5, v6];

  return v7;
}

- (void)_commitWithCompletionHandler:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMBulletinBoardNotification *)self context];
  if (!v4)
  {
    uint64_t v39 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMBulletinBoardNotification _commitWithCompletionHandler:]", @"completion"];
    v40 = (void *)MEMORY[0x19F3A64A0]();
    v41 = self;
    v42 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v43 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v52 = v43;
      __int16 v53 = 2112;
      v54 = (const char *)v39;
      _os_log_impl(&dword_19D1A8000, v42, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v44 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v39 userInfo:0];
    objc_exception_throw(v44);
  }
  id v6 = (void *)v5;
  if (v5)
  {
    v7 = [(HMBulletinBoardNotification *)self service];
    BOOL v8 = [v7 accessory];
    char v9 = [v8 home];

    if (v9)
    {
      v49 = @"HM.BulletinBoardNotificationEnabled";
      v10 = objc_msgSend(NSNumber, "numberWithBool:", -[HMBulletinBoardNotification isEnabled](self, "isEnabled"));
      v50 = v10;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      id v12 = (void *)[v11 mutableCopy];

      id v13 = [(HMBulletinBoardNotification *)self condition];

      if (v13)
      {
        v14 = [(HMBulletinBoardNotification *)self condition];
        BOOL v15 = +[HMPredicateUtilities validatePredicate:v14];

        if (!v15)
        {
          v23 = [(HMBulletinBoardNotification *)self context];
          id v30 = [v23 delegateCaller];
          id v29 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
          [v30 callCompletion:v4 error:v29];
          goto LABEL_15;
        }
        buf[0] = 0;
        v16 = [(HMBulletinBoardNotification *)self condition];
        int v17 = +[HMPredicateUtilities rewritePredicateForDaemon:v16 characteristicIsInvalid:buf];

        if (v17)
        {
          v18 = encodeRootObject(v17);
          [v12 setObject:v18 forKeyedSubscript:@"HM.BulletinBoardNotificationCondition"];
        }
      }
      id v19 = objc_alloc(MEMORY[0x1E4F654B0]);
      id v20 = objc_alloc(MEMORY[0x1E4F65488]);
      v21 = [(HMBulletinBoardNotification *)self messageTargetUUID];
      v22 = (void *)[v20 initWithTarget:v21];
      v23 = (void *)[v19 initWithName:@"kBulletinBoardNotificationCommitRequestKey" destination:v22 payload:v12];

      v24 = [(HMBulletinBoardNotification *)self context];
      int v25 = [v24 pendingRequests];

      v26 = [v23 identifier];
      __int16 v27 = _Block_copy(v4);
      [v25 addCompletionBlock:v27 forIdentifier:v26];

      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __60__HMBulletinBoardNotification__commitWithCompletionHandler___block_invoke;
      v45[3] = &unk_1E59450E8;
      id v46 = v25;
      id v47 = v26;
      id v28 = v6;
      id v48 = v28;
      id v29 = v26;
      id v30 = v25;
      [v23 setResponseHandler:v45];
      uint64_t v31 = [v28 messageDispatcher];
      [v31 sendMessage:v23];

LABEL_15:
      goto LABEL_16;
    }
    uint64_t v36 = [(HMBulletinBoardNotification *)self context];
    v37 = [v36 delegateCaller];
    v38 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    [v37 callCompletion:v4 error:v38];

    char v9 = 0;
  }
  else
  {
    __int16 v32 = (void *)MEMORY[0x19F3A64A0]();
    v33 = self;
    __int16 v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v52 = v35;
      __int16 v53 = 2080;
      v54 = "-[HMBulletinBoardNotification _commitWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v34, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    char v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v4 + 2))(v4, v9);
  }
LABEL_16:
}

void __60__HMBulletinBoardNotification__commitWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = a2;
    id v7 = [v3 removeCompletionBlockForIdentifier:v4];
    id v6 = [*(id *)(a1 + 48) delegateCaller];
    [v6 callCompletion:v7 error:v5];
  }
}

- (void)commitWithCompletionHandler:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMBulletinBoardNotification *)self context];
  if (!v4)
  {
    uint64_t v13 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMBulletinBoardNotification commitWithCompletionHandler:]", @"completion"];
    v14 = (void *)MEMORY[0x19F3A64A0]();
    BOOL v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v22 = v17;
      __int16 v23 = 2112;
      v24 = (const char *)v13;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v13 userInfo:0];
    objc_exception_throw(v18);
  }
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__HMBulletinBoardNotification_commitWithCompletionHandler___block_invoke;
    block[3] = &unk_1E59454E8;
    block[4] = self;
    id v20 = v4;
    dispatch_async(v7, block);
  }
  else
  {
    BOOL v8 = (void *)MEMORY[0x19F3A64A0]();
    char v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v22 = v11;
      __int16 v23 = 2080;
      v24 = "-[HMBulletinBoardNotification commitWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v4 + 2))(v4, v12);
  }
}

uint64_t __59__HMBulletinBoardNotification_commitWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _commitWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)_callBulletinBoardNotificationUpdatedDelegate
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v18 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Calling service notification delegate", buf, 0xCu);
  }
  id v7 = [(HMBulletinBoardNotification *)v4 service];
  BOOL v8 = [v7 accessory];
  char v9 = [v8 delegate];
  if ([v9 conformsToProtocol:&unk_1EEF70C88])
  {
    id v10 = v9;
    if (objc_opt_respondsToSelector())
    {
      id v11 = [(HMBulletinBoardNotification *)v4 context];
      id v12 = [v11 delegateCaller];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __76__HMBulletinBoardNotification__callBulletinBoardNotificationUpdatedDelegate__block_invoke;
      v13[3] = &unk_1E5945650;
      id v14 = v10;
      id v15 = v8;
      id v16 = v7;
      [v12 invokeBlock:v13];
    }
  }
}

uint64_t __76__HMBulletinBoardNotification__callBulletinBoardNotificationUpdatedDelegate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessory:*(void *)(a1 + 40) didUpdateBulletinBoardNotificationForService:*(void *)(a1 + 48)];
}

- (void)setCondition:(id)a3
{
  id v4 = (NSPredicate *)a3;
  os_unfair_lock_lock_with_options();
  condition = self->_condition;
  self->_condition = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSPredicate)condition
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_condition;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setEnabled:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_enabled = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isEnabled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_enabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSUUID)uniqueIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    objc_msgSend(MEMORY[0x1E4F29128], "hm_deriveUUIDFromBaseUUID:", self->_messageTargetUUID);
    id v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v5;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  id v7 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (void)_handleBulletinBoardNotificationUpdateNotification:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    BOOL v8 = HMFGetLogIdentifier();
    char v9 = [v4 messagePayload];
    int v25 = 138543618;
    v26 = v8;
    __int16 v27 = 2112;
    id v28 = v9;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Received bulletin board update notification with message %@", (uint8_t *)&v25, 0x16u);
  }
  uint64_t v10 = [v4 BOOLForKey:@"HM.BulletinBoardNotificationEnabled"];
  id v11 = [v4 predicateForKey:@"HM.BulletinBoardNotificationCondition"];
  id v12 = [(HMBulletinBoardNotification *)v6 service];
  uint64_t v13 = [v12 accessory];
  id v14 = [v13 home];
  id v15 = +[HMPredicateUtilities rewritePredicateForClient:v11 home:v14];

  id v16 = [(HMBulletinBoardNotification *)v6 context];
  int v17 = [v16 pendingRequests];

  id v18 = [v4 identifier];
  uint64_t v19 = [v17 removeCompletionBlockForIdentifier:v18];

  int v20 = v10 ^ [(HMBulletinBoardNotification *)v6 isEnabled];
  if (v20 == 1) {
    [(HMBulletinBoardNotification *)v6 setEnabled:v10];
  }
  v21 = [(HMBulletinBoardNotification *)v6 condition];
  int v22 = HMFEqualObjects();

  if (v22)
  {
    if (!v19)
    {
      if (!v20) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else
  {
    [(HMBulletinBoardNotification *)v6 setCondition:v15];
    if (!v19)
    {
LABEL_11:
      [(HMBulletinBoardNotification *)v6 _callBulletinBoardNotificationUpdatedDelegate];
      goto LABEL_12;
    }
  }
  __int16 v23 = [(HMBulletinBoardNotification *)v6 context];
  v24 = [v23 delegateCaller];
  [v24 callCompletion:v19 error:0];

LABEL_12:
}

- (void)_unconfigure
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  context = self->_context;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (context)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      BOOL v8 = HMFGetLogIdentifier();
      int v13 = 138543362;
      id v14 = v8;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring bulletinBoard notification", (uint8_t *)&v13, 0xCu);
    }
    char v9 = [(HMBulletinBoardNotification *)v5 context];
    uint64_t v10 = [v9 messageDispatcher];
    [v10 deregisterReceiver:v5];

    [(HMBulletinBoardNotification *)v5 setContext:0];
    id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 removeObserver:v5];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      id v14 = v12;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", (uint8_t *)&v13, 0xCu);
    }
  }
}

@end