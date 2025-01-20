@interface HMIUpdatedFaceprintsResult
- (HMIUpdatedFaceprintsResult)initWithExistingAtCurrentVersion:(id)a3 createdAtCurrentVersion:(id)a4 existingAtOtherVersions:(id)a5;
- (NSSet)allAtCurrentVersion;
- (NSSet)createdAtCurrentVersion;
- (NSSet)existingAtCurrentVersion;
- (NSSet)existingAtOtherVersions;
@end

@implementation HMIUpdatedFaceprintsResult

- (HMIUpdatedFaceprintsResult)initWithExistingAtCurrentVersion:(id)a3 createdAtCurrentVersion:(id)a4 existingAtOtherVersions:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMIUpdatedFaceprintsResult;
  v12 = [(HMIUpdatedFaceprintsResult *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_existingAtCurrentVersion, a3);
    objc_storeStrong((id *)&v13->_createdAtCurrentVersion, a4);
    objc_storeStrong((id *)&v13->_existingAtOtherVersions, a5);
  }

  return v13;
}

- (NSSet)allAtCurrentVersion
{
  v3 = [MEMORY[0x263EFF9C0] set];
  v4 = [(HMIUpdatedFaceprintsResult *)self existingAtCurrentVersion];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __49__HMIUpdatedFaceprintsResult_allAtCurrentVersion__block_invoke;
  v16[3] = &unk_26477CCA8;
  v16[4] = self;
  id v5 = v3;
  id v17 = v5;
  objc_msgSend(v4, "na_each:", v16);

  v6 = [(HMIUpdatedFaceprintsResult *)self createdAtCurrentVersion];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __49__HMIUpdatedFaceprintsResult_allAtCurrentVersion__block_invoke_35;
  v13 = &unk_26477CCA8;
  v14 = self;
  id v15 = v5;
  id v7 = v5;
  objc_msgSend(v6, "na_each:", &v10);

  v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);
  return (NSSet *)v8;
}

void __49__HMIUpdatedFaceprintsResult_allAtCurrentVersion__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 isSentinelFaceprint])
  {
    v4 = (void *)MEMORY[0x22A641C70]();
    id v5 = *(id *)(a1 + 32);
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543362;
      id v9 = v7;
      _os_log_impl(&dword_225DC6000, v6, OS_LOG_TYPE_INFO, "%{public}@Skipping sentinel faceprint in existingAtCurrentVersion", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

void __49__HMIUpdatedFaceprintsResult_allAtCurrentVersion__block_invoke_35(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 isSentinelFaceprint])
  {
    v4 = (void *)MEMORY[0x22A641C70]();
    id v5 = *(id *)(a1 + 32);
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543362;
      id v9 = v7;
      _os_log_impl(&dword_225DC6000, v6, OS_LOG_TYPE_INFO, "%{public}@Skipping sentinel faceprint in createdAtCurrentVersion", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (NSSet)existingAtOtherVersions
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (NSSet)createdAtCurrentVersion
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)existingAtCurrentVersion
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingAtCurrentVersion, 0);
  objc_storeStrong((id *)&self->_createdAtCurrentVersion, 0);
  objc_storeStrong((id *)&self->_existingAtOtherVersions, 0);
}

@end