@interface HMDPersonDataBatchChange
+ (id)logCategory;
- (HMBLocalZoneLocalInput)localInput;
- (HMDPersonDataBatchChange)initWithLocalInput:(id)a3;
- (NSUUID)UUID;
- (id)attributeDescriptions;
- (id)logIdentifier;
- (void)addOrUpdateFaceCrop:(id)a3;
- (void)addOrUpdatePerson:(id)a3;
- (void)commit;
- (void)removeFaceCropWithUUID:(id)a3;
- (void)removePersonWithUUID:(id)a3;
@end

@implementation HMDPersonDataBatchChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localInput, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (HMBLocalZoneLocalInput)localInput
{
  return (HMBLocalZoneLocalInput *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDPersonDataBatchChange *)self UUID];
  v5 = (void *)[v3 initWithName:@"UUID" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

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
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v21 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Committing person data batch change", buf, 0xCu);
  }
  v7 = (void *)MEMORY[0x1E4F69EF0];
  v8 = NSString;
  v9 = [(HMDPersonDataBatchChange *)v4 UUID];
  v10 = [v8 stringWithFormat:@"Batch person data change for %@", v9];
  v11 = [v7 optionsWithLabel:v10];

  v12 = [(HMDPersonDataBatchChange *)v4 localInput];
  id v19 = 0;
  v13 = [v12 commitWithOptions:v11 error:&v19];
  id v14 = v19;

  if (!v13)
  {
    v15 = (void *)MEMORY[0x1D9452090]();
    v16 = v4;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v21 = v18;
      __int16 v22 = 2112;
      id v23 = v14;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to commit person data batch change: %@", buf, 0x16u);
    }
  }
}

- (void)removeFaceCropWithUUID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Removing face crop with UUID: %@", (uint8_t *)&v10, 0x16u);
  }
  v9 = [(HMDPersonDataBatchChange *)v6 localInput];
  [v9 stageRemovalForModelWithID:v4 error:0];
}

- (void)removePersonWithUUID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Removing person with UUID: %@", (uint8_t *)&v10, 0x16u);
  }
  v9 = [(HMDPersonDataBatchChange *)v6 localInput];
  [v9 stageRemovalForModelWithID:v4 error:0];
}

- (void)addOrUpdateFaceCrop:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = HMFGetLogIdentifier();
    int v15 = 138543618;
    v16 = v8;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Adding/updating face crop: %@", (uint8_t *)&v15, 0x16u);
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
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = HMFGetLogIdentifier();
    int v11 = 138543618;
    __int16 v12 = v8;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Adding/updating person: %@", (uint8_t *)&v11, 0x16u);
  }
  id v9 = [(HMDPersonDataBatchChange *)v6 localInput];
  int v10 = [[HMDPersonModel alloc] initWithPerson:v4];
  [v9 stageAdditionForModel:v10 error:0];
}

- (HMDPersonDataBatchChange)initWithLocalInput:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v14.receiver = self;
    v14.super_class = (Class)HMDPersonDataBatchChange;
    v7 = [(HMDPersonDataBatchChange *)&v14 init];
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_localInput, a3);
      uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
      UUID = v8->_UUID;
      v8->_UUID = (NSUUID *)v9;
    }
    return v8;
  }
  else
  {
    __int16 v12 = (void *)_HMFPreconditionFailure();
    return (HMDPersonDataBatchChange *)+[HMDPersonDataBatchChange logCategory];
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_136905 != -1) {
    dispatch_once(&logCategory__hmf_once_t7_136905, &__block_literal_global_136906);
  }
  v2 = (void *)logCategory__hmf_once_v8_136907;
  return v2;
}

uint64_t __39__HMDPersonDataBatchChange_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v8_136907;
  logCategory__hmf_once_v8_136907 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end