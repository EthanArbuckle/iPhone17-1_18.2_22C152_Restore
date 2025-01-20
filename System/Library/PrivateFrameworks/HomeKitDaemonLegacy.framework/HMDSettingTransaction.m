@interface HMDSettingTransaction
- (BOOL)initialCreation;
- (HMDSettingTransaction)initWithTransactionLabel:(id)a3;
- (NSMutableSet)removeUUIDs;
- (NSMutableSet)updateModels;
- (NSString)transactionLabel;
- (id)initForInitialCreationWithTransactionLabel:(id)a3;
- (void)addModel:(id)a3;
- (void)addModelToBeUpdated:(id)a3;
- (void)addSettingModel:(id)a3;
- (void)removeModelWithIdentifier:(id)a3;
@end

@implementation HMDSettingTransaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeUUIDs, 0);
  objc_storeStrong((id *)&self->_updateModels, 0);
  objc_storeStrong((id *)&self->_transactionLabel, 0);
}

- (BOOL)initialCreation
{
  return self->_initialCreation;
}

- (NSMutableSet)removeUUIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableSet)updateModels
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)transactionLabel
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)addModelToBeUpdated:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDSettingTransaction *)self updateModels];
  [v5 addObject:v4];
}

- (void)removeModelWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDSettingTransaction *)self removeUUIDs];
  [v5 addObject:v4];
}

- (void)addModel:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDSettingTransaction *)self updateModels];
  [v5 addObject:v4];
}

- (void)addSettingModel:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
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
    v7 = [(HMDSettingTransaction *)self updateModels];
    [v7 addObject:v6];
  }
  else
  {
    v8 = (void *)MEMORY[0x1D9452090]();
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      v12 = v10;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Model not of required type %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (id)initForInitialCreationWithTransactionLabel:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDSettingTransaction;
  id v6 = [(HMDSettingTransaction *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transactionLabel, a3);
    v7->_initialCreation = 1;
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    updateModels = v7->_updateModels;
    v7->_updateModels = (NSMutableSet *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    removeUUIDs = v7->_removeUUIDs;
    v7->_removeUUIDs = (NSMutableSet *)v10;
  }
  return v7;
}

- (HMDSettingTransaction)initWithTransactionLabel:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDSettingTransaction;
  id v6 = [(HMDSettingTransaction *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transactionLabel, a3);
    v7->_initialCreation = 0;
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    updateModels = v7->_updateModels;
    v7->_updateModels = (NSMutableSet *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    removeUUIDs = v7->_removeUUIDs;
    v7->_removeUUIDs = (NSMutableSet *)v10;
  }
  return v7;
}

@end