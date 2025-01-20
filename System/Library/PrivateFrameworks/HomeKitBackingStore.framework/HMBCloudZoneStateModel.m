@interface HMBCloudZoneStateModel
+ (id)hmbProperties;
- (HMBCloudZone)cloudZone;
- (HMBCloudZoneRebuilderStatus)rebuilderStatus;
- (HMBCloudZoneStateModel)initWithModelID:(id)a3 parentModelID:(id)a4;
- (NSSet)subscriptions;
- (void)setCloudZone:(id)a3;
- (void)setRebuilderStatus:(id)a3;
- (void)setSubscriptions:(id)a3;
@end

@implementation HMBCloudZoneStateModel

+ (id)hmbProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__HMBCloudZoneStateModel_hmbProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (hmbProperties_onceToken != -1) {
    dispatch_once(&hmbProperties_onceToken, block);
  }
  v2 = (void *)hmbProperties__properties;
  return v2;
}

void __39__HMBCloudZoneStateModel_hmbProperties__block_invoke(uint64_t a1)
{
  v13[5] = *MEMORY[0x1E4F143B8];
  v11.receiver = *(id *)(a1 + 32);
  v11.super_class = (Class)&OBJC_METACLASS___HMBCloudZoneStateModel;
  v1 = objc_msgSendSuper2(&v11, sel_hmbProperties);
  uint64_t v2 = [v1 mutableCopy];
  v3 = (void *)hmbProperties__properties;
  hmbProperties__properties = v2;

  v4 = (void *)hmbProperties__properties;
  v12[0] = @"zoneID";
  v5 = +[HMBModelField fieldWithClass:objc_opt_class()];
  v13[0] = v5;
  v12[1] = @"needsZoneCreation";
  v6 = +[HMBModelField fieldWithClass:objc_opt_class()];
  v13[1] = v6;
  v12[2] = @"needsZoneDeletion";
  v7 = +[HMBModelField fieldWithClass:objc_opt_class()];
  v13[2] = v7;
  v12[3] = @"subscriptionsData";
  v8 = +[HMBModelField fieldWithClass:objc_opt_class()];
  v13[3] = v8;
  v12[4] = @"rebuilderStatus";
  v9 = +[HMBModelField fieldWithClass:objc_opt_class()];
  v13[4] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:5];
  [v4 addEntriesFromDictionary:v10];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rebuilderStatus, 0);
  objc_destroyWeak((id *)&self->_cloudZone);
}

- (void)setRebuilderStatus:(id)a3
{
}

- (HMBCloudZoneRebuilderStatus)rebuilderStatus
{
  return self->_rebuilderStatus;
}

- (void)setCloudZone:(id)a3
{
}

- (HMBCloudZone)cloudZone
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudZone);
  return (HMBCloudZone *)WeakRetained;
}

- (void)setSubscriptions:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v12 = 0;
  v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v12];
  id v6 = v12;
  if (v5)
  {
    [(HMBCloudZoneStateModel *)self setSubscriptionsData:v5];
  }
  else
  {
    v7 = (void *)MEMORY[0x1D944CB30]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      objc_super v11 = [v4 hmbDescription];
      *(_DWORD *)buf = 138543874;
      v14 = v10;
      __int16 v15 = 2112;
      v16 = v11;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode subscriptions %@: %@", buf, 0x20u);
    }
  }
}

- (NSSet)subscriptions
{
  v24[2] = *MEMORY[0x1E4F143B8];
  v3 = [(HMBCloudZoneStateModel *)self subscriptionsData];
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28DC0];
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    v7 = [v5 setWithArray:v6];
    id v17 = 0;
    v8 = [v4 unarchivedObjectOfClasses:v7 fromData:v3 error:&v17];
    id v9 = v17;

    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v12 = (void *)MEMORY[0x1D944CB30]();
      v13 = self;
      v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        __int16 v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v19 = v15;
        __int16 v20 = 2112;
        v21 = v3;
        __int16 v22 = 2112;
        id v23 = v9;
        _os_log_impl(&dword_1D4693000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode subscriptions data %@: %@", buf, 0x20u);
      }
      id v10 = [MEMORY[0x1E4F1CAD0] set];
    }
    objc_super v11 = v10;
  }
  else
  {
    objc_super v11 = [MEMORY[0x1E4F1CAD0] set];
  }

  return (NSSet *)v11;
}

- (HMBCloudZoneStateModel)initWithModelID:(id)a3 parentModelID:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)HMBCloudZoneStateModel;
  id v4 = [(HMBModel *)&v9 initWithModelID:a3 parentModelID:a4];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = MEMORY[0x1E4F1CC28];
    [(HMBCloudZoneStateModel *)v4 setNeedsZoneCreation:MEMORY[0x1E4F1CC28]];
    [(HMBCloudZoneStateModel *)v5 setNeedsZoneDeletion:v6];
    v7 = [MEMORY[0x1E4F1CAD0] set];
    [(HMBCloudZoneStateModel *)v5 setSubscriptions:v7];
  }
  return v5;
}

@end