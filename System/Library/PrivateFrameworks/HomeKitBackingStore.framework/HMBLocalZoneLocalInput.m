@interface HMBLocalZoneLocalInput
- (BOOL)stageAdditionForModel:(id)a3 error:(id *)a4;
- (id)commitWithOptions:(id)a3 error:(id *)a4;
- (int64_t)additionConstraint;
- (void)setAdditionConstraint:(int64_t)a3;
@end

@implementation HMBLocalZoneLocalInput

- (void)setAdditionConstraint:(int64_t)a3
{
  self->_additionConstraint = a3;
}

- (int64_t)additionConstraint
{
  return self->_additionConstraint;
}

- (id)commitWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int64_t v7 = [(HMBLocalZoneLocalInput *)self additionConstraint];
  if (v7 == 2)
  {
    v12 = (void *)MEMORY[0x1D944CB30]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v20 = v15;
      __int16 v21 = 2048;
      uint64_t v22 = [(HMBLocalZoneLocalInput *)v13 additionConstraint];
      _os_log_impl(&dword_1D4693000, v14, OS_LOG_TYPE_INFO, "%{public}@Setting disallowsModelCreation to YES because addition constraint is %ld", buf, 0x16u);
    }
    [v6 setDisallowsModelCreation:1];
  }
  else if (v7 == 1)
  {
    v8 = (void *)MEMORY[0x1D944CB30]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v20 = v11;
      __int16 v21 = 2048;
      uint64_t v22 = [(HMBLocalZoneLocalInput *)v9 additionConstraint];
      _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_INFO, "%{public}@Setting requiresModelCreation to YES because addition constraint is %ld", buf, 0x16u);
    }
    [v6 setRequiresModelCreation:1];
  }
  v18.receiver = self;
  v18.super_class = (Class)HMBLocalZoneLocalInput;
  v16 = [(HMBLocalZoneInput *)&v18 commitWithOptions:v6 error:a4];

  return v16;
}

- (BOOL)stageAdditionForModel:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int64_t v7 = (void *)MEMORY[0x1D944CB30]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v30 = v10;
    __int16 v31 = 2112;
    id v32 = v6;
    _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_INFO, "%{public}@Staging addition for model: %@", buf, 0x16u);
  }
  v11 = [(HMBLocalZoneInput *)v8 localZone];
  v12 = [v11 modelContainer];
  uint64_t v13 = [v12 bestModelEncodingForStorageLocation:3];

  v14 = [(HMBLocalZoneInput *)v8 localZone];
  v15 = [v14 modelContainer];
  id v28 = 0;
  v16 = [v15 dataFromModel:v6 encoding:v13 storageLocation:3 updatedModelIDs:0 error:&v28];
  id v17 = v28;

  if (v16)
  {
    objc_super v18 = [(HMBLocalZoneInput *)v8 inputBlock];
    v19 = [MEMORY[0x1E4F29128] UUID];
    v20 = [v19 data];
    __int16 v21 = [v18 updateExternalID:v20 externalData:0 modelEncoding:v13 modelData:v16];

    BOOL v22 = v21 == 0;
    if (v21)
    {
      if (a4) {
        *a4 = v21;
      }
    }
    else
    {
      [(HMBLocalZoneInput *)v8 setStagedChangesCount:[(HMBLocalZoneInput *)v8 stagedChangesCount] + 1];
    }
  }
  else
  {
    uint64_t v23 = (void *)MEMORY[0x1D944CB30]();
    v24 = v8;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v30 = v26;
      __int16 v31 = 2112;
      id v32 = v6;
      __int16 v33 = 2112;
      id v34 = v17;
      _os_log_impl(&dword_1D4693000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode model %@: %@", buf, 0x20u);
    }
    BOOL v22 = 0;
    if (a4) {
      *a4 = v17;
    }
  }

  return v22;
}

@end