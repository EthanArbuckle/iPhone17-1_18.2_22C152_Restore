@interface HMAudioAnalysisEventBulletinBoardNotification
+ (id)logCategory;
+ (id)predicateForOptions:(unint64_t)a3;
+ (id)shortDescription;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMAudioAnalysisEventBulletinBoardNotification)initWithEnabled:(BOOL)a3 condition:(id)a4 accessoryIdentifier:(id)a5;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)shortDescription;
- (NSUUID)accessoryIdentifier;
- (id)logIdentifier;
- (id)uniqueIdentifier;
- (unint64_t)options;
- (void)__configureWithContext:(id)a3;
- (void)commitWithCompletionHandler:(id)a3;
@end

@implementation HMAudioAnalysisEventBulletinBoardNotification

- (void).cxx_destruct
{
}

- (NSUUID)accessoryIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (NSArray)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMBulletinBoardNotification *)self isEnabled];
  v4 = HMFBooleanToString();
  v5 = (void *)[v3 initWithName:@"Enabled" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMBulletinBoardNotification *)self condition];
  v8 = (void *)[v6 initWithName:@"Condition" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return (NSArray *)v9;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (id)logIdentifier
{
  v2 = [(HMAudioAnalysisEventBulletinBoardNotification *)self accessoryIdentifier];
  id v3 = [v2 UUIDString];

  return v3;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
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
    v7 = [(HMBulletinBoardNotification *)self condition];
    v8 = [v6 condition];
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
        int v26 = 138543874;
        v27 = v13;
        __int16 v28 = 2112;
        v29 = v14;
        __int16 v30 = 2112;
        v31 = v15;
        _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Merging due to condition value change from %@ to %@", (uint8_t *)&v26, 0x20u);
      }
      v16 = [v6 condition];
      [(HMBulletinBoardNotification *)v11 setCondition:v16];
    }
    int v17 = [(HMBulletinBoardNotification *)self isEnabled];
    if (v17 == [v6 isEnabled])
    {
      char v24 = v9 ^ 1;
    }
    else
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
        int v26 = 138543874;
        v27 = v21;
        __int16 v28 = 2112;
        v29 = v22;
        __int16 v30 = 2112;
        v31 = v23;
        _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_INFO, "%{public}@Merging due to enabled value change from %@ to %@", (uint8_t *)&v26, 0x20u);
      }
      -[HMBulletinBoardNotification setEnabled:](v19, "setEnabled:", [v6 isEnabled]);
      char v24 = 1;
    }
  }
  else
  {
    char v24 = 0;
  }

  return v24;
}

- (id)uniqueIdentifier
{
  v2 = (void *)MEMORY[0x1E4F29128];
  id v3 = [(HMAudioAnalysisEventBulletinBoardNotification *)self accessoryIdentifier];
  id v4 = objc_msgSend(v2, "hm_deriveUUIDFromBaseUUID:", v3);

  return v4;
}

- (void)__configureWithContext:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    v10 = v8;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring HMAudioAnalysisEventBulletinBoardNotification with context %@", (uint8_t *)&v9, 0x16u);
  }
  [(HMBulletinBoardNotification *)v6 setContext:v4];
}

- (void)commitWithCompletionHandler:(id)a3
{
  v48[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMBulletinBoardNotification *)self context];
  if (!v4)
  {
    uint64_t v28 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAudioAnalysisEventBulletinBoardNotification commitWithCompletionHandler:]", @"completion"];
    v29 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v30 = self;
    v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v42 = v32;
      __int16 v43 = 2112;
      v44 = (const char *)v28;
      _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v33 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v28 userInfo:0];
    objc_exception_throw(v33);
  }
  id v6 = (void *)v5;
  if (v5)
  {
    v7 = [(HMBulletinBoardNotification *)self condition];
    BOOL v8 = [(HMBulletinBoardNotification *)self isEnabled];
    if (+[HMPredicateUtilities validatePredicate:v7])
    {
      v36 = +[HMPredicateUtilities rewritePredicateForDaemon:v7 characteristicIsInvalid:0];
      v47[0] = @"HM.BulletinBoardNotificationEnabled";
      int v9 = [NSNumber numberWithBool:v8];
      v47[1] = @"HM.BulletinBoardNotificationCondition";
      v48[0] = v9;
      v10 = encodeRootObject(v36);
      v48[1] = v10;
      __int16 v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:2];

      id v12 = [v6 messageDispatcher];
      id v13 = objc_alloc(MEMORY[0x1E4F65488]);
      v14 = [(HMAudioAnalysisEventBulletinBoardNotification *)self accessoryIdentifier];
      v35 = (void *)[v13 initWithTarget:v14];

      objc_initWeak(&location, self);
      v15 = [MEMORY[0x1E4F654B0] messageWithName:@"kBulletinBoardNotificationCommitRequestKey" destination:v35 payload:v11];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __77__HMAudioAnalysisEventBulletinBoardNotification_commitWithCompletionHandler___block_invoke;
      v37[3] = &unk_1E5944188;
      objc_copyWeak(&v39, &location);
      id v38 = v4;
      context = (void *)MEMORY[0x19F3A64A0]([v15 setResponseHandler:v37]);
      v16 = self;
      HMFGetOSLogHandle();
      int v17 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        v19 = [v15 shortDescription];
        *(_DWORD *)buf = 138543874;
        id v42 = v18;
        __int16 v43 = 2112;
        v44 = v19;
        __int16 v45 = 2112;
        v46 = v16;
        _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_INFO, "%{public}@Committing audio analysis event bulletin board notification using message %@: %@", buf, 0x20u);
      }
      [v12 sendMessage:v15];

      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);
    }
    else
    {
      char v24 = (void *)MEMORY[0x19F3A64A0]();
      v25 = self;
      int v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v42 = v27;
        __int16 v43 = 2112;
        v44 = v7;
        _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@Invalid predicate: %@", buf, 0x16u);
      }
      v36 = [(HMBulletinBoardNotification *)v25 context];
      __int16 v11 = [v36 delegateCaller];
      id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      [v11 callCompletion:v4 error:v12];
    }
  }
  else
  {
    v20 = (void *)MEMORY[0x19F3A64A0]();
    v21 = self;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v42 = v23;
      __int16 v43 = 2080;
      v44 = "-[HMAudioAnalysisEventBulletinBoardNotification commitWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, char *))v4 + 2))(v4, v7);
  }
}

void __77__HMAudioAnalysisEventBulletinBoardNotification_commitWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = WeakRetained;
  v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v11)
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v25 = v12;
      __int16 v26 = 2112;
      id v27 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Daemon responded with error %@ for commiting Audio Analysis settings", buf, 0x16u);
    }
    id v13 = [v9 context];
    v14 = [v13 delegateCaller];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __77__HMAudioAnalysisEventBulletinBoardNotification_commitWithCompletionHandler___block_invoke_20;
    v21[3] = &unk_1E59454E8;
    v15 = &v23;
    id v23 = *(id *)(a1 + 32);
    id v22 = v5;
    [v14 invokeBlock:v21];

    v16 = v22;
  }
  else
  {
    if (v11)
    {
      int v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v25 = v17;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully set Audio Analysis user notification settings", buf, 0xCu);
    }
    v16 = [v9 context];
    id v18 = [v16 delegateCaller];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __77__HMAudioAnalysisEventBulletinBoardNotification_commitWithCompletionHandler___block_invoke_22;
    v19[3] = &unk_1E59454C0;
    v15 = &v20;
    id v20 = *(id *)(a1 + 32);
    [v18 invokeBlock:v19];
  }
}

uint64_t __77__HMAudioAnalysisEventBulletinBoardNotification_commitWithCompletionHandler___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __77__HMAudioAnalysisEventBulletinBoardNotification_commitWithCompletionHandler___block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)options
{
  v2 = [(HMBulletinBoardNotification *)self condition];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  id v5 = +[HMPredicateUtilities audioAnalysisNotificationOptionsInPredicate:v4];

  unint64_t v6 = [v5 unsignedIntValue];
  return v6;
}

- (HMAudioAnalysisEventBulletinBoardNotification)initWithEnabled:(BOOL)a3 condition:(id)a4 accessoryIdentifier:(id)a5
{
  BOOL v6 = a3;
  BOOL v8 = (void *)MEMORY[0x1E4F29128];
  id v9 = a5;
  id v10 = a4;
  BOOL v11 = [v8 UUID];
  v16.receiver = self;
  v16.super_class = (Class)HMAudioAnalysisEventBulletinBoardNotification;
  id v12 = [(HMBulletinBoardNotification *)&v16 initWithEnabled:v6 condition:v10 service:0 messageTargetUUID:v11];

  uint64_t v13 = [v9 copy];
  accessoryIdentifier = v12->_accessoryIdentifier;
  v12->_accessoryIdentifier = (NSUUID *)v13;

  return v12;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t11 != -1) {
    dispatch_once(&logCategory__hmf_once_t11, &__block_literal_global_12221);
  }
  v2 = (void *)logCategory__hmf_once_v12;

  return v2;
}

uint64_t __60__HMAudioAnalysisEventBulletinBoardNotification_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v12;
  logCategory__hmf_once_id v12 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)predicateForOptions:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(%K & %i) != 0", @"audioAnalysisEventNotificationOptions", a3);
}

@end