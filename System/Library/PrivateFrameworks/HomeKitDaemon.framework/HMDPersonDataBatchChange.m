@interface HMDPersonDataBatchChange
+ (id)logCategory;
- (HMBLocalZoneLocalInput)localInput;
- (HMDPersonDataBatchChange)initWithLocalInput:(id)a3;
- (HMDPersonDataSource)dataSource;
- (NSMutableSet)addedOrUpdatedPersons;
- (NSMutableSet)removedPersonsUUIDs;
- (NSUUID)UUID;
- (id)attributeDescriptions;
- (id)logIdentifier;
- (void)addOrUpdateFaceCrop:(id)a3;
- (void)addOrUpdatePerson:(id)a3;
- (void)commit;
- (void)removeFaceCropWithUUID:(id)a3;
- (void)removePersonWithUUID:(id)a3;
- (void)setDataSource:(id)a3;
@end

@implementation HMDPersonDataBatchChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedPersonsUUIDs, 0);
  objc_storeStrong((id *)&self->_addedOrUpdatedPersons, 0);
  objc_storeStrong((id *)&self->_localInput, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (NSMutableSet)removedPersonsUUIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableSet)addedOrUpdatedPersons
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (HMBLocalZoneLocalInput)localInput
{
  return (HMBLocalZoneLocalInput *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDataSource:(id)a3
{
}

- (HMDPersonDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDPersonDataSource *)WeakRetained;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDPersonDataBatchChange *)self UUID];
  v5 = (void *)[v3 initWithName:@"UUID" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
}

- (id)logIdentifier
{
  v2 = [(HMDPersonDataBatchChange *)self UUID];
  id v3 = [v2 UUIDString];

  return v3;
}

- (void)commit
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v28 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Committing person data batch change", buf, 0xCu);
  }
  v7 = (void *)MEMORY[0x263F49318];
  v8 = NSString;
  v9 = [(HMDPersonDataBatchChange *)v4 UUID];
  v10 = [v8 stringWithFormat:@"Batch person data change for %@", v9];
  v11 = [v7 optionsWithLabel:v10];

  v12 = [(HMDPersonDataBatchChange *)v4 localInput];
  id v26 = 0;
  v13 = [v12 commitWithOptions:v11 error:&v26];
  id v14 = v26;

  if (!v13)
  {
    v15 = (void *)MEMORY[0x230FBD990]();
    v16 = v4;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v28 = v18;
      __int16 v29 = 2112;
      id v30 = v14;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to commit person data batch change: %@", buf, 0x16u);
    }
  }
  v19 = [(HMDPersonDataBatchChange *)v4 addedOrUpdatedPersons];
  if ([v19 count])
  {

LABEL_10:
    v22 = [(HMDPersonDataBatchChange *)v4 dataSource];
    v23 = [(HMDPersonDataBatchChange *)v4 addedOrUpdatedPersons];
    v24 = [(HMDPersonDataBatchChange *)v4 removedPersonsUUIDs];
    id v25 = (id)[v22 addOrUpdatePersons:v23 andRemovePersonsWithUUIDs:v24];

    goto LABEL_11;
  }
  v20 = [(HMDPersonDataBatchChange *)v4 removedPersonsUUIDs];
  uint64_t v21 = [v20 count];

  if (v21) {
    goto LABEL_10;
  }
LABEL_11:
}

- (void)removeFaceCropWithUUID:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Removing face crop with UUID: %@", (uint8_t *)&v10, 0x16u);
  }
  v9 = [(HMDPersonDataBatchChange *)v6 localInput];
  [v9 stageRemovalForModelWithID:v4 error:0];
}

- (void)removePersonWithUUID:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Removing person with UUID: %@", (uint8_t *)&v10, 0x16u);
  }
  v9 = [(HMDPersonDataBatchChange *)v6 removedPersonsUUIDs];
  [v9 addObject:v4];
}

- (void)addOrUpdateFaceCrop:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = HMFGetLogIdentifier();
    int v15 = 138543618;
    v16 = v8;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Adding/updating face crop: %@", (uint8_t *)&v15, 0x16u);
  }
  id v9 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v10 = v9;
  }
  else {
    int v10 = 0;
  }
  id v11 = v10;

  if (v11) {
    __int16 v12 = [[HMDFaceCropModel alloc] initWithPersonFaceCrop:v11];
  }
  else {
    __int16 v12 = [[HMDUnassociatedFaceCropModel alloc] initWithFaceCrop:v9];
  }
  id v13 = v12;

  uint64_t v14 = [(HMDPersonDataBatchChange *)v6 localInput];
  [v14 stageAdditionForModel:v13 error:0];
}

- (void)addOrUpdatePerson:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    id v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Adding/updating person: %@", (uint8_t *)&v10, 0x16u);
  }
  id v9 = [(HMDPersonDataBatchChange *)v6 addedOrUpdatedPersons];
  [v9 addObject:v4];
}

- (HMDPersonDataBatchChange)initWithLocalInput:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v18.receiver = self;
    v18.super_class = (Class)HMDPersonDataBatchChange;
    v7 = [(HMDPersonDataBatchChange *)&v18 init];
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_localInput, a3);
      uint64_t v9 = [MEMORY[0x263F08C38] UUID];
      UUID = v8->_UUID;
      v8->_UUID = (NSUUID *)v9;

      uint64_t v11 = [MEMORY[0x263EFF9C0] set];
      addedOrUpdatedPersons = v8->_addedOrUpdatedPersons;
      v8->_addedOrUpdatedPersons = (NSMutableSet *)v11;

      uint64_t v13 = [MEMORY[0x263EFF9C0] set];
      removedPersonsUUIDs = v8->_removedPersonsUUIDs;
      v8->_removedPersonsUUIDs = (NSMutableSet *)v13;
    }
    return v8;
  }
  else
  {
    v16 = (void *)_HMFPreconditionFailure();
    return (HMDPersonDataBatchChange *)+[HMDPersonDataBatchChange logCategory];
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_35541 != -1) {
    dispatch_once(&logCategory__hmf_once_t7_35541, &__block_literal_global_35542);
  }
  v2 = (void *)logCategory__hmf_once_v8_35543;
  return v2;
}

void __39__HMDPersonDataBatchChange_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v8_35543;
  logCategory__hmf_once_v8_35543 = v0;
}

@end