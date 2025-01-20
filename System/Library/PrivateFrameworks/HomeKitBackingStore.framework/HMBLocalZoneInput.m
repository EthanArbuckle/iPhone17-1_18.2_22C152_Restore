@interface HMBLocalZoneInput
+ (id)logCategory;
- (BOOL)stageRemovalForModelWithID:(id)a3 error:(id *)a4;
- (HMBLocalSQLContextInputBlock)inputBlock;
- (HMBLocalZone)localZone;
- (HMBLocalZoneInput)initWithLocalZone:(id)a3 inputBlock:(id)a4;
- (id)attributeDescriptions;
- (id)commitWithOptions:(id)a3 error:(id *)a4;
- (id)logIdentifier;
- (unint64_t)stagedChangesCount;
- (void)abort;
- (void)dealloc;
- (void)setStagedChangesCount:(unint64_t)a3;
@end

@implementation HMBLocalZoneInput

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputBlock, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
}

- (void)setStagedChangesCount:(unint64_t)a3
{
  self->_stagedChangesCount = a3;
}

- (unint64_t)stagedChangesCount
{
  return self->_stagedChangesCount;
}

- (HMBLocalSQLContextInputBlock)inputBlock
{
  return (HMBLocalSQLContextInputBlock *)objc_getProperty(self, a2, 16, 1);
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMBLocalZoneInput *)self localZone];
  v5 = [v4 zoneID];
  v6 = [v5 name];
  v7 = (void *)[v3 initWithName:@"Zone Name" value:v6];
  v15[0] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
  v9 = (void *)MEMORY[0x1E4F28ED0];
  v10 = [(HMBLocalZoneInput *)self inputBlock];
  v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "blockRow"));
  v12 = (void *)[v8 initWithName:@"Block Row" value:v11];
  v15[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];

  return v13;
}

- (id)logIdentifier
{
  id v3 = NSString;
  v4 = [(HMBLocalZoneInput *)self localZone];
  v5 = [v4 zoneID];
  v6 = [v5 name];
  v7 = [(HMBLocalZoneInput *)self inputBlock];
  id v8 = [v3 stringWithFormat:@"%@/%lu", v6, objc_msgSend(v7, "blockRow")];

  return v8;
}

- (void)abort
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D944CB30](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1D4693000, v5, OS_LOG_TYPE_INFO, "%{public}@Aborting local zone input", (uint8_t *)&v9, 0xCu);
  }
  v7 = [(HMBLocalZoneInput *)v4 inputBlock];
  id v8 = (id)[v7 abort];
}

- (id)commitWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v6 = (HMBProcessingResult *)a3;
  unint64_t v7 = [(HMBLocalZoneInput *)self stagedChangesCount];
  id v8 = (void *)MEMORY[0x1D944CB30]();
  int v9 = self;
  v10 = HMFGetOSLogHandle();
  uint64_t v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v36 = v12;
      __int16 v37 = 2048;
      uint64_t v38 = [(HMBLocalZoneInput *)v9 stagedChangesCount];
      __int16 v39 = 2112;
      v40 = v6;
      _os_log_impl(&dword_1D4693000, v11, OS_LOG_TYPE_INFO, "%{public}@Committing local zone input containing %lu staged changes with options: %@", buf, 0x20u);
    }
    id v34 = 0;
    v13 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v34];
    v14 = (HMBProcessingResult *)v34;
    if (v13)
    {
      v15 = [(HMBLocalZoneInput *)v9 inputBlock];
      uint64_t v16 = [v15 blockRow];

      v17 = [(HMBLocalZoneInput *)v9 inputBlock];
      uint64_t v18 = [v17 commit:v13];

      if (!v18)
      {
        v32 = [(HMBLocalZoneInput *)v9 localZone];
        v27 = [v32 triggerProcessForBlockRow:v16];

        v14 = 0;
        goto LABEL_21;
      }
      v19 = (void *)MEMORY[0x1D944CB30]();
      v20 = v9;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v36 = v22;
        __int16 v37 = 2112;
        uint64_t v38 = v18;
        _os_log_impl(&dword_1D4693000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to commit local zone input: %@", buf, 0x16u);
      }
      if (!a4)
      {
        v27 = 0;
        v14 = (HMBProcessingResult *)v18;
        goto LABEL_21;
      }
      v23 = (void *)v18;
    }
    else
    {
      v28 = (void *)MEMORY[0x1D944CB30]();
      v29 = v9;
      v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v36 = v31;
        __int16 v37 = 2112;
        uint64_t v38 = (uint64_t)v6;
        __int16 v39 = 2112;
        v40 = v14;
        _os_log_impl(&dword_1D4693000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to archive options %@: %@", buf, 0x20u);
      }
      if (!a4)
      {
        v27 = 0;
        goto LABEL_21;
      }
      v23 = v14;
    }
    v14 = v23;
    v27 = 0;
    *a4 = v14;
LABEL_21:

    goto LABEL_22;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v24 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v36 = v24;
    _os_log_impl(&dword_1D4693000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Skipping local zone input commit with no staged changes", buf, 0xCu);
  }
  v25 = (void *)MEMORY[0x1E4F7A0D8];
  v26 = [HMBProcessingResult alloc];
  v14 = [(HMBProcessingResult *)v26 initWithOptions:v6 actions:MEMORY[0x1E4F1CBF0] mirrorOutputResult:0];
  v27 = [v25 futureWithResult:v14];
LABEL_22:

  return v27;
}

- (BOOL)stageRemovalForModelWithID:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = (void *)MEMORY[0x1D944CB30]();
  id v8 = self;
  int v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    int v17 = 138543618;
    uint64_t v18 = v10;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_INFO, "%{public}@Staging removal for model with ID: %@", (uint8_t *)&v17, 0x16u);
  }
  uint64_t v11 = [(HMBLocalZoneInput *)v8 inputBlock];
  v12 = [MEMORY[0x1E4F29128] UUID];
  v13 = [v12 data];
  v14 = [v6 data];
  v15 = [v11 updateExternalID:v13 externalData:0 modelEncoding:0 modelData:v14];

  if (v15)
  {
    if (a4) {
      *a4 = v15;
    }
  }
  else
  {
    [(HMBLocalZoneInput *)v8 setStagedChangesCount:[(HMBLocalZoneInput *)v8 stagedChangesCount] + 1];
  }

  return v15 == 0;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMBLocalZoneInput *)self inputBlock];
  uint64_t v4 = [v3 blockRow];

  if (v4)
  {
    v5 = (void *)MEMORY[0x1D944CB30]();
    id v6 = self;
    unint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v13 = v8;
      _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_INFO, "%{public}@Aborting input block left uncommitted", buf, 0xCu);
    }
    int v9 = [(HMBLocalZoneInput *)v6 inputBlock];
    id v10 = (id)[v9 abort];
  }
  v11.receiver = self;
  v11.super_class = (Class)HMBLocalZoneInput;
  [(HMBLocalZoneInput *)&v11 dealloc];
}

- (HMBLocalZoneInput)initWithLocalZone:(id)a3 inputBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  int v9 = v8;
  if (!v8)
  {
LABEL_7:
    v13 = (void *)_HMFPreconditionFailure();
    return (HMBLocalZoneInput *)+[HMBLocalZoneInput logCategory];
  }
  v15.receiver = self;
  v15.super_class = (Class)HMBLocalZoneInput;
  id v10 = [(HMBLocalZoneInput *)&v15 init];
  objc_super v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_localZone, a3);
    objc_storeStrong((id *)&v11->_inputBlock, a4);
  }

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_6622 != -1) {
    dispatch_once(&logCategory__hmf_once_t7_6622, &__block_literal_global_6623);
  }
  v2 = (void *)logCategory__hmf_once_v8_6624;
  return v2;
}

uint64_t __32__HMBLocalZoneInput_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v8_6624;
  logCategory__hmf_once_v8_6624 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end