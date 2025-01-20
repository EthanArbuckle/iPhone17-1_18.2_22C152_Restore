@interface HMMatterBulletinBoardNotification
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMAccessory)accessory;
- (HMMatterBulletinBoardNotification)initWithCoder:(id)a3;
- (HMMatterBulletinBoardNotification)initWithEnabled:(BOOL)a3 condition:(id)a4 accessory:(id)a5 endpointID:(id)a6 messageTargetUUID:(id)a7;
- (NSNumber)endpointID;
- (NSUUID)messageTargetUUID;
- (id)logIdentifier;
- (void)__configureWithContext:(id)a3 accessory:(id)a4;
- (void)_commitWithCompletionHandler:(id)a3;
- (void)_handleBulletinBoardNotificationUpdateNotification:(id)a3;
- (void)_registerNotificationHandlers;
- (void)_unconfigure;
- (void)commitWithCompletionHandler:(id)a3;
- (void)setAccessory:(id)a3;
@end

@implementation HMMatterBulletinBoardNotification

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointID, 0);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);

  objc_destroyWeak((id *)&self->_accessory);
}

- (NSNumber)endpointID
{
  return self->_endpointID;
}

- (NSUUID)messageTargetUUID
{
  return self->_messageTargetUUID;
}

- (HMMatterBulletinBoardNotification)initWithCoder:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessory"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceMatterEndpointID"];
  v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    v9 = (void *)MEMORY[0x19F3A64A0]();
    v25 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v32 = v11;
      __int16 v33 = 2112;
      v34 = v5;
      __int16 v35 = 2112;
      v36 = v7;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded accessory: %@, endpointID: %@", buf, 0x20u);
    }
    v26 = 0;
  }
  else
  {
    unsigned int v28 = [v4 decodeBoolForKey:@"HM.BulletinBoardNotificationEnabled"];
    v12 = (void *)MEMORY[0x1E4F1CAD0];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
    v14 = [v12 setWithArray:v13];
    v15 = [v4 decodeObjectOfClasses:v14 forKey:@"HM.BulletinBoardNotificationCondition"];

    v16 = [v5 home];
    v17 = +[HMPredicateUtilities rewritePredicateForClient:v15 home:v16];

    v18 = [v5 uuid];
    v19 = [v18 UUIDString];
    v29[0] = v19;
    v20 = [v7 stringValue];
    v29[1] = v20;
    v29[2] = @"HM.BulletinBoardNotification";
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:3];

    v22 = (void *)MEMORY[0x1E4F29128];
    v23 = [v5 uuid];
    v24 = objc_msgSend(v22, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v23, 0, v21);

    v25 = [(HMMatterBulletinBoardNotification *)self initWithEnabled:v28 condition:v17 accessory:v5 endpointID:v7 messageTargetUUID:v24];
    v26 = v25;
  }

  return v26;
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
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      v14 = [(HMBulletinBoardNotification *)v11 condition];
      v15 = [v6 condition];
      int v25 = 138543874;
      v26 = v13;
      __int16 v27 = 2112;
      unsigned int v28 = v14;
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
      unsigned int v28 = v22;
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
  id v4 = [(HMMatterBulletinBoardNotification *)self accessory];
  v5 = [v4 name];
  id v6 = [(HMMatterBulletinBoardNotification *)self endpointID];
  v7 = [(HMMatterBulletinBoardNotification *)self messageTargetUUID];
  BOOL v8 = [v3 stringWithFormat:@"%@/%@%@", v5, v6, v7];

  return v8;
}

- (void)_commitWithCompletionHandler:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMBulletinBoardNotification *)self context];
  if (!v4)
  {
    uint64_t v38 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMMatterBulletinBoardNotification _commitWithCompletionHandler:]", @"completion"];
    v39 = (void *)MEMORY[0x19F3A64A0]();
    v40 = self;
    v41 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v51 = v42;
      __int16 v52 = 2112;
      v53 = (const char *)v38;
      _os_log_impl(&dword_19D1A8000, v41, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v43 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v38 userInfo:0];
    objc_exception_throw(v43);
  }
  id v6 = (void *)v5;
  if (v5)
  {
    v7 = [(HMMatterBulletinBoardNotification *)self accessory];
    BOOL v8 = [v7 home];

    if (v8)
    {
      v48 = @"HM.BulletinBoardNotificationEnabled";
      char v9 = objc_msgSend(NSNumber, "numberWithBool:", -[HMBulletinBoardNotification isEnabled](self, "isEnabled"));
      v49 = v9;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      v11 = (void *)[v10 mutableCopy];

      v12 = [(HMBulletinBoardNotification *)self condition];

      if (v12)
      {
        v13 = [(HMBulletinBoardNotification *)self condition];
        BOOL v14 = +[HMPredicateUtilities validatePredicate:v13];

        if (!v14)
        {
          v22 = [(HMBulletinBoardNotification *)self context];
          id v29 = [v22 delegateCaller];
          id v28 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
          [v29 callCompletion:v4 error:v28];
          goto LABEL_15;
        }
        v15 = [(HMBulletinBoardNotification *)self condition];
        v16 = +[HMPredicateUtilities rewritePredicateForDaemon:v15];

        if (v16)
        {
          int v17 = encodeRootObject(v16);
          [v11 setObject:v17 forKeyedSubscript:@"HM.BulletinBoardNotificationCondition"];
        }
      }
      id v18 = objc_alloc(MEMORY[0x1E4F654B0]);
      id v19 = objc_alloc(MEMORY[0x1E4F65488]);
      v20 = [(HMMatterBulletinBoardNotification *)self messageTargetUUID];
      v21 = (void *)[v19 initWithTarget:v20];
      v22 = (void *)[v18 initWithName:@"kBulletinBoardNotificationCommitRequestKey" destination:v21 payload:v11];

      v23 = [(HMBulletinBoardNotification *)self context];
      v24 = [v23 pendingRequests];

      int v25 = [v22 identifier];
      v26 = _Block_copy(v4);
      [v24 addCompletionBlock:v26 forIdentifier:v25];

      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __66__HMMatterBulletinBoardNotification__commitWithCompletionHandler___block_invoke;
      v44[3] = &unk_1E59450E8;
      id v45 = v24;
      id v46 = v25;
      id v27 = v6;
      id v47 = v27;
      id v28 = v25;
      id v29 = v24;
      [v22 setResponseHandler:v44];
      v30 = [v27 messageDispatcher];
      [v30 sendMessage:v22];

LABEL_15:
      goto LABEL_16;
    }
    __int16 v35 = [(HMBulletinBoardNotification *)self context];
    v36 = [v35 delegateCaller];
    uint64_t v37 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    [v36 callCompletion:v4 error:v37];

    BOOL v8 = 0;
  }
  else
  {
    uint64_t v31 = (void *)MEMORY[0x19F3A64A0]();
    v32 = self;
    __int16 v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v51 = v34;
      __int16 v52 = 2080;
      v53 = "-[HMMatterBulletinBoardNotification _commitWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v33, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    BOOL v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v4 + 2))(v4, v8);
  }
LABEL_16:
}

void __66__HMMatterBulletinBoardNotification__commitWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
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
    uint64_t v13 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMMatterBulletinBoardNotification commitWithCompletionHandler:]", @"completion"];
    BOOL v14 = (void *)MEMORY[0x19F3A64A0]();
    v15 = self;
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
    block[2] = __65__HMMatterBulletinBoardNotification_commitWithCompletionHandler___block_invoke;
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
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v22 = v11;
      __int16 v23 = 2080;
      v24 = "-[HMMatterBulletinBoardNotification commitWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v4 + 2))(v4, v12);
  }
}

uint64_t __65__HMMatterBulletinBoardNotification_commitWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _commitWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)_handleBulletinBoardNotificationUpdateNotification:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    BOOL v8 = HMFGetLogIdentifier();
    char v9 = [v4 messagePayload];
    int v23 = 138543618;
    v24 = v8;
    __int16 v25 = 2112;
    v26 = v9;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Received Matter bulletin board update notification with message %@", (uint8_t *)&v23, 0x16u);
  }
  uint64_t v10 = [v4 BOOLForKey:@"HM.BulletinBoardNotificationEnabled"];
  v11 = [v4 predicateForKey:@"HM.BulletinBoardNotificationCondition"];
  v12 = [(HMMatterBulletinBoardNotification *)v6 accessory];
  uint64_t v13 = [v12 home];
  BOOL v14 = +[HMPredicateUtilities rewritePredicateForClient:v11 home:v13];

  v15 = [(HMBulletinBoardNotification *)v6 context];
  v16 = [v15 pendingRequests];

  int v17 = [v4 identifier];
  id v18 = [v16 removeCompletionBlockForIdentifier:v17];

  if (v10 != [(HMBulletinBoardNotification *)v6 isEnabled]) {
    [(HMBulletinBoardNotification *)v6 setEnabled:v10];
  }
  id v19 = [(HMBulletinBoardNotification *)v6 condition];
  char v20 = HMFEqualObjects();

  if ((v20 & 1) == 0) {
    [(HMBulletinBoardNotification *)v6 setCondition:v14];
  }
  if (v18)
  {
    v21 = [(HMBulletinBoardNotification *)v6 context];
    v22 = [v21 delegateCaller];
    [v22 callCompletion:v18 error:0];
  }
}

- (void)_unconfigure
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(HMBulletinBoardNotification *)self context];

  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      BOOL v8 = HMFGetLogIdentifier();
      int v13 = 138543362;
      BOOL v14 = v8;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring Matter bulletinBoard notification", (uint8_t *)&v13, 0xCu);
    }
    char v9 = [(HMBulletinBoardNotification *)v5 context];
    uint64_t v10 = [v9 messageDispatcher];
    [v10 deregisterReceiver:v5];

    [(HMBulletinBoardNotification *)v5 setContext:0];
    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 removeObserver:v5];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      BOOL v14 = v12;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)__configureWithContext:(id)a3 accessory:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)MEMORY[0x19F3A64A0]();
  char v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    int v13 = v11;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Configuring with context: %@", (uint8_t *)&v12, 0x16u);
  }
  [(HMBulletinBoardNotification *)v9 setContext:v6];
  [(HMMatterBulletinBoardNotification *)v9 setAccessory:v7];
  [(HMMatterBulletinBoardNotification *)v9 _registerNotificationHandlers];
}

- (void)setAccessory:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_accessory, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HMAccessory)accessory
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  os_unfair_lock_unlock(p_lock);

  return (HMAccessory *)WeakRetained;
}

- (void)_registerNotificationHandlers
{
  id v4 = [(HMBulletinBoardNotification *)self context];
  v3 = [v4 messageDispatcher];
  [v3 registerForMessage:@"kBulletinBoardNotificationUpdateNotificationKey" receiver:self selector:sel__handleBulletinBoardNotificationUpdateNotification_];
}

- (HMMatterBulletinBoardNotification)initWithEnabled:(BOOL)a3 condition:(id)a4 accessory:(id)a5 endpointID:(id)a6 messageTargetUUID:(id)a7
{
  BOOL v10 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)HMMatterBulletinBoardNotification;
  id v15 = [(HMBulletinBoardNotification *)&v18 initWithEnabled:v10 condition:a4 service:0 messageTargetUUID:v14];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_accessory, v12);
    objc_storeStrong((id *)&v16->_endpointID, a6);
    objc_storeStrong((id *)&v16->_messageTargetUUID, a7);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t10 != -1) {
    dispatch_once(&logCategory__hmf_once_t10, &__block_literal_global_22039);
  }
  v2 = (void *)logCategory__hmf_once_v11;

  return v2;
}

uint64_t __48__HMMatterBulletinBoardNotification_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v11;
  logCategory__hmf_once_v11 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end