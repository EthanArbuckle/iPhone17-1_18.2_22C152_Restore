@interface HMCameraBulletinBoardSmartNotification
+ (id)logCategory;
+ (id)personFamiliarityOptionsInPredicate:(id)a3;
+ (id)predicateForPersonFamiliarityOptions:(unint64_t)a3;
+ (id)predicateForSignificantEventTypes:(unint64_t)a3;
+ (id)predicateForSignificantEventTypes:(unint64_t)a3 personFamiliarityOptions:(unint64_t)a4;
+ (id)shortDescription;
+ (id)significantEventTypesInPredicate:(id)a3;
- (HMCameraBulletinBoardSmartNotification)initWithEnabled:(BOOL)a3 condition:(id)a4 context:(id)a5 cameraUserSettings:(id)a6;
- (HMCameraUserSettings)cameraUserSettings;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)shortDescription;
- (id)logIdentifier;
- (unint64_t)personFamiliarityOptions;
- (unint64_t)significantEventTypes;
- (void)commitWithCompletionHandler:(id)a3;
- (void)setCameraUserSettings:(id)a3;
@end

@implementation HMCameraBulletinBoardSmartNotification

- (HMCameraBulletinBoardSmartNotification)initWithEnabled:(BOOL)a3 condition:(id)a4 context:(id)a5 cameraUserSettings:(id)a6
{
  BOOL v8 = a3;
  v10 = (void *)MEMORY[0x1E4F29128];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  v14 = [v10 UUID];
  v17.receiver = self;
  v17.super_class = (Class)HMCameraBulletinBoardSmartNotification;
  v15 = [(HMBulletinBoardNotification *)&v17 initWithEnabled:v8 condition:v13 service:0 messageTargetUUID:v14];

  [(HMBulletinBoardNotification *)v15 setContext:v12];
  objc_storeWeak((id *)&v15->_cameraUserSettings, v11);

  return v15;
}

- (void).cxx_destruct
{
}

- (void)setCameraUserSettings:(id)a3
{
}

- (HMCameraUserSettings)cameraUserSettings
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraUserSettings);

  return (HMCameraUserSettings *)WeakRetained;
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
  BOOL v8 = (void *)[v6 initWithName:@"Condition" value:v7];
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
  v2 = [(HMCameraBulletinBoardSmartNotification *)self cameraUserSettings];
  id v3 = [v2 uniqueIdentifier];
  v4 = [v3 UUIDString];

  return v4;
}

- (void)commitWithCompletionHandler:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [(HMBulletinBoardNotification *)self context];
  if (!v4)
  {
    uint64_t v31 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMCameraBulletinBoardSmartNotification commitWithCompletionHandler:]", @"completion"];
    v32 = (void *)MEMORY[0x19F3A64A0]();
    v33 = self;
    v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v38 = v35;
      __int16 v39 = 2112;
      v40 = (const char *)v31;
      _os_log_impl(&dword_19D1A8000, v34, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v36 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v31 userInfo:0];
    objc_exception_throw(v36);
  }
  id v6 = (void *)v5;
  if (v5)
  {
    v7 = [(HMCameraBulletinBoardSmartNotification *)self cameraUserSettings];
    if (v7)
    {
      BOOL v8 = [(HMBulletinBoardNotification *)self condition];
      BOOL v9 = +[HMPredicateUtilities validatePredicate:v8];

      v10 = (void *)MEMORY[0x19F3A64A0]();
      id v11 = self;
      id v12 = HMFGetOSLogHandle();
      id v13 = v12;
      if (v9)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v14 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v38 = v14;
          __int16 v39 = 2112;
          v40 = (const char *)v11;
          _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Committing camera bulletin board smart notification: %@", buf, 0x16u);
        }
        v15 = [(HMBulletinBoardNotification *)v11 condition];
        v16 = +[HMPredicateUtilities rewritePredicateForDaemon:v15 characteristicIsInvalid:0];

        objc_msgSend(v7, "updateBulletinNotificationEnabled:condition:completionHandler:", -[HMBulletinBoardNotification isEnabled](v11, "isEnabled"), v16, v4);
        goto LABEL_18;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v28 = HMFGetLogIdentifier();
        v29 = [(HMBulletinBoardNotification *)v11 condition];
        *(_DWORD *)buf = 138543618;
        v38 = v28;
        __int16 v39 = 2112;
        v40 = v29;
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Invalid predicate: %@", buf, 0x16u);
      }
      v16 = [(HMBulletinBoardNotification *)v11 context];
      v25 = [v16 delegateCaller];
      v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = 3;
    }
    else
    {
      v21 = (void *)MEMORY[0x19F3A64A0]();
      v22 = self;
      v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v38 = v24;
        _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@No reference to cameraUserSettings, unable to commit change", buf, 0xCu);
      }
      v16 = [(HMBulletinBoardNotification *)v22 context];
      v25 = [v16 delegateCaller];
      v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = -1;
    }
    v30 = [v26 hmErrorWithCode:v27];
    [v25 callCompletion:v4 error:v30];

LABEL_18:
    goto LABEL_19;
  }
  objc_super v17 = (void *)MEMORY[0x19F3A64A0]();
  v18 = self;
  v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v38 = v20;
    __int16 v39 = 2080;
    v40 = "-[HMCameraBulletinBoardSmartNotification commitWithCompletionHandler:]";
    _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
  v4[2](v4, v7);
LABEL_19:
}

- (unint64_t)personFamiliarityOptions
{
  v2 = [(HMBulletinBoardNotification *)self condition];
  if (v2)
  {
    id v3 = [(id)objc_opt_class() personFamiliarityOptionsInPredicate:v2];
    unint64_t v4 = [v3 integerValue];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (unint64_t)significantEventTypes
{
  v2 = [(HMBulletinBoardNotification *)self condition];
  if (v2)
  {
    id v3 = [(id)objc_opt_class() significantEventTypesInPredicate:v2];
    unint64_t v4 = [v3 integerValue];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5 != -1) {
    dispatch_once(&logCategory__hmf_once_t5, &__block_literal_global_13469);
  }
  v2 = (void *)logCategory__hmf_once_v6;

  return v2;
}

uint64_t __53__HMCameraBulletinBoardSmartNotification_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v6;
  logCategory__hmf_once_id v6 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)personFamiliarityOptionsInPredicate:(id)a3
{
  return +[HMPredicateUtilities bitwiseAndValueWithKeyPath:@"personFamiliarityOptions" inPredicate:a3 validValues:7];
}

+ (id)significantEventTypesInPredicate:(id)a3
{
  return +[HMPredicateUtilities bitwiseAndValueWithKeyPath:@"cameraSignificantEvent" inPredicate:a3 validValues:31];
}

+ (id)predicateForSignificantEventTypes:(unint64_t)a3 personFamiliarityOptions:(unint64_t)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = [a1 predicateForSignificantEventTypes:a3];
  v7 = v6;
  if (a4)
  {
    BOOL v8 = [a1 predicateForPersonFamiliarityOptions:a4];
    BOOL v9 = (void *)MEMORY[0x1E4F28BA0];
    v13[0] = v7;
    v13[1] = v8;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    id v11 = [v9 andPredicateWithSubpredicates:v10];
  }
  else
  {
    id v11 = v6;
  }

  return v11;
}

+ (id)predicateForPersonFamiliarityOptions:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(%K & %i) != 0", @"personFamiliarityOptions", a3 & 7);
}

+ (id)predicateForSignificantEventTypes:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(%K & %i) != 0", @"cameraSignificantEvent", a3 & 0x1F);
}

@end