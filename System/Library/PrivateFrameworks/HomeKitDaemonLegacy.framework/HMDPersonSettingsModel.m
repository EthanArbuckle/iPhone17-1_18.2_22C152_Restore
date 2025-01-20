@interface HMDPersonSettingsModel
+ (BOOL)hmbExcludeFromCloudStorage;
+ (NSUUID)sentinelModelUUID;
+ (NSUUID)sentinelParentUUID;
+ (id)hmbProperties;
- (HMDPersonSettingsModel)init;
- (NSDictionary)faceClassificationNotificationsEnabledByPersonUUID;
- (id)classificationNotificationsEnabledForPersonUUID:(id)a3;
- (id)unarchivedClassificationNotificationsEnabledForPersonUUID;
- (void)archiveClassificationNotificationsEnabledForPersonUUID:(id)a3;
- (void)setClassificationNotificationsEnabled:(id)a3 forPersonUUID:(id)a4;
@end

@implementation HMDPersonSettingsModel

+ (NSUUID)sentinelModelUUID
{
  if (sentinelModelUUID_onceToken != -1) {
    dispatch_once(&sentinelModelUUID_onceToken, &__block_literal_global_11_189901);
  }
  v2 = (void *)sentinelModelUUID_sentinelModelUUID;
  return (NSUUID *)v2;
}

uint64_t __43__HMDPersonSettingsModel_sentinelModelUUID__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"B9F6C6E7-1B18-463B-B95A-6AF8C7A5E4DF"];
  uint64_t v1 = sentinelModelUUID_sentinelModelUUID;
  sentinelModelUUID_sentinelModelUUID = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (NSUUID)sentinelParentUUID
{
  if (sentinelParentUUID_onceToken_189907 != -1) {
    dispatch_once(&sentinelParentUUID_onceToken_189907, &__block_literal_global_5_189908);
  }
  v2 = (void *)sentinelParentUUID_sentinelParentUUID_189909;
  return (NSUUID *)v2;
}

uint64_t __44__HMDPersonSettingsModel_sentinelParentUUID__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"BCF7ED70-4FE2-4186-8B8C-F4832AC1A54B"];
  uint64_t v1 = sentinelParentUUID_sentinelParentUUID_189909;
  sentinelParentUUID_sentinelParentUUID_189909 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)hmbExcludeFromCloudStorage
{
  return 1;
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_189914 != -1) {
    dispatch_once(&hmbProperties_onceToken_189914, &__block_literal_global_189915);
  }
  v2 = (void *)hmbProperties_properties_189916;
  return v2;
}

void __39__HMDPersonSettingsModel_hmbProperties__block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v3 = @"classificationNotificationSettingsData";
  uint64_t v0 = [MEMORY[0x1E4F69E98] fieldWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)hmbProperties_properties_189916;
  hmbProperties_properties_189916 = v1;
}

- (void)archiveClassificationNotificationsEnabledForPersonUUID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F28DB0];
  v6 = (void *)[v4 copy];
  id v13 = 0;
  v7 = [v5 archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v13];
  id v8 = v13;

  if (v7)
  {
    [(HMDPersonSettingsModel *)self setClassificationNotificationSettingsData:v7];
  }
  else
  {
    v9 = (void *)MEMORY[0x1D9452090]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v15 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to archive classificationNotificationsEnabledForPersonUUID, settings updates have not been made", buf, 0xCu);
    }
  }
}

- (id)unarchivedClassificationNotificationsEnabledForPersonUUID
{
  v2 = [(HMDPersonSettingsModel *)self faceClassificationNotificationsEnabledByPersonUUID];
  v3 = (void *)[v2 mutableCopy];

  return v3;
}

- (void)setClassificationNotificationsEnabled:(id)a3 forPersonUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDPersonSettingsModel *)self unarchivedClassificationNotificationsEnabledForPersonUUID];
  [v8 setObject:v7 forKeyedSubscript:v6];

  [(HMDPersonSettingsModel *)self archiveClassificationNotificationsEnabledForPersonUUID:v8];
}

- (id)classificationNotificationsEnabledForPersonUUID:(id)a3
{
  id v4 = a3;
  v5 = [(HMDPersonSettingsModel *)self unarchivedClassificationNotificationsEnabledForPersonUUID];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (HMDPersonSettingsModel)init
{
  v3 = [(id)objc_opt_class() sentinelModelUUID];
  id v4 = [(id)objc_opt_class() sentinelParentUUID];
  v5 = [(HMBModel *)self initWithModelID:v3 parentModelID:v4];

  return v5;
}

- (NSDictionary)faceClassificationNotificationsEnabledByPersonUUID
{
  v23[3] = *MEMORY[0x1E4F143B8];
  v3 = [(HMDPersonSettingsModel *)self classificationNotificationSettingsData];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28DC0];
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v23[2] = objc_opt_class();
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
    id v7 = [v5 setWithArray:v6];
    id v8 = [(HMDPersonSettingsModel *)self classificationNotificationSettingsData];
    id v18 = 0;
    v9 = [v4 unarchivedObjectOfClasses:v7 fromData:v8 error:&v18];
    id v10 = v18;

    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v13 = (void *)MEMORY[0x1D9452090]();
      v14 = self;
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v20 = v16;
        __int16 v21 = 2112;
        id v22 = v10;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive classificationNotificationSettingsData with error: %@", buf, 0x16u);
      }
      id v11 = [MEMORY[0x1E4F1C9E8] dictionary];
    }
    v12 = v11;
  }
  else
  {
    v12 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  return (NSDictionary *)v12;
}

@end