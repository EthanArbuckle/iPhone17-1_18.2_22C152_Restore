@interface HMBCloudDatabaseStateModel
+ (id)hmbProperties;
- (CKDatabase)database;
- (HMBCloudDatabaseStateModel)initWithModelID:(id)a3 parentModelID:(id)a4;
- (NAFuture)queuedCloudPullFuture;
- (NSSet)subscriptions;
- (void)setDatabase:(id)a3;
- (void)setQueuedCloudPullFuture:(id)a3;
- (void)setSubscriptions:(id)a3;
@end

@implementation HMBCloudDatabaseStateModel

+ (id)hmbProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__HMBCloudDatabaseStateModel_hmbProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (hmbProperties_onceToken_7757 != -1) {
    dispatch_once(&hmbProperties_onceToken_7757, block);
  }
  v2 = (void *)hmbProperties__properties_7758;
  return v2;
}

void __43__HMBCloudDatabaseStateModel_hmbProperties__block_invoke(uint64_t a1)
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)&OBJC_METACLASS___HMBCloudDatabaseStateModel;
  v1 = objc_msgSendSuper2(&v9, sel_hmbProperties);
  uint64_t v2 = [v1 mutableCopy];
  v3 = (void *)hmbProperties__properties_7758;
  hmbProperties__properties_7758 = v2;

  v4 = (void *)hmbProperties__properties_7758;
  v10[0] = @"cloudID";
  v5 = +[HMBModelField fieldWithClass:objc_opt_class()];
  v11[0] = v5;
  v10[1] = @"lastAdministrativeFetch";
  v6 = +[HMBModelField fieldWithClass:objc_opt_class()];
  v11[1] = v6;
  v10[2] = @"subscriptionsData";
  v7 = +[HMBModelField fieldWithClass:objc_opt_class()];
  v11[2] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  [v4 addEntriesFromDictionary:v8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedCloudPullFuture, 0);
  objc_destroyWeak((id *)&self->_database);
}

- (void)setQueuedCloudPullFuture:(id)a3
{
}

- (NAFuture)queuedCloudPullFuture
{
  return (NAFuture *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDatabase:(id)a3
{
}

- (CKDatabase)database
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_database);
  return (CKDatabase *)WeakRetained;
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
    [(HMBCloudDatabaseStateModel *)self setSubscriptionsData:v5];
  }
  else
  {
    v7 = (void *)MEMORY[0x1D944CB30]();
    v8 = self;
    objc_super v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      v11 = [v4 hmbDescription];
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
  v3 = [(HMBCloudDatabaseStateModel *)self subscriptionsData];
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
    v11 = v10;
  }
  else
  {
    v11 = [MEMORY[0x1E4F1CAD0] set];
  }

  return (NSSet *)v11;
}

- (HMBCloudDatabaseStateModel)initWithModelID:(id)a3 parentModelID:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HMBCloudDatabaseStateModel;
  id v4 = [(HMBModel *)&v8 initWithModelID:a3 parentModelID:a4];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F1C9C8] distantPast];
    [(HMBCloudDatabaseStateModel *)v4 setLastAdministrativeFetch:v5];

    id v6 = [MEMORY[0x1E4F1CAD0] set];
    [(HMBCloudDatabaseStateModel *)v4 setSubscriptions:v6];
  }
  return v4;
}

@end