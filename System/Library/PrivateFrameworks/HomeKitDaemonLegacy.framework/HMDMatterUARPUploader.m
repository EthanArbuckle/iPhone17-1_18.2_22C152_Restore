@interface HMDMatterUARPUploader
- (BOOL)accessoryReachable:(id)a3 error:(id *)a4;
- (BOOL)accessoryUnreachable:(id)a3 error:(id *)a4;
- (BOOL)applyStagedAssetsForAccessory:(id)a3 error:(id *)a4;
- (BOOL)cancelAssetStagingForAccessory:(id)a3 asset:(id)a4;
- (BOOL)offerAssetToAccessory:(id)a3 asset:(id)a4 error:(id *)a5;
- (BOOL)pauseAssetTransfersForAccessory:(id)a3;
- (BOOL)recvDataFromAccessory:(id)a3 data:(id)a4 error:(id *)a5;
- (BOOL)rescindStagedAssetsForAccessory:(id)a3 error:(id *)a4;
- (BOOL)resumeAssetTransfersForAccessory:(id)a3;
@end

@implementation HMDMatterUARPUploader

- (BOOL)cancelAssetStagingForAccessory:(id)a3 asset:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = HMFGetLogIdentifier();
    int v13 = 138543618;
    v14 = v11;
    __int16 v15 = 2080;
    v16 = "-[HMDMatterUARPUploader cancelAssetStagingForAccessory:asset:]";
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@%s: This function should not be called for Matter accessories", (uint8_t *)&v13, 0x16u);
  }

  return 0;
}

- (BOOL)resumeAssetTransfersForAccessory:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    v11 = v8;
    __int16 v12 = 2080;
    int v13 = "-[HMDMatterUARPUploader resumeAssetTransfersForAccessory:]";
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@%s: This function should not be called for Matter accessories", (uint8_t *)&v10, 0x16u);
  }

  return 0;
}

- (BOOL)pauseAssetTransfersForAccessory:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    v11 = v8;
    __int16 v12 = 2080;
    int v13 = "-[HMDMatterUARPUploader pauseAssetTransfersForAccessory:]";
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@%s: This function should not be called for Matter accessories", (uint8_t *)&v10, 0x16u);
  }

  return 0;
}

- (BOOL)rescindStagedAssetsForAccessory:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = HMFGetLogIdentifier();
    int v11 = 138543618;
    __int16 v12 = v9;
    __int16 v13 = 2080;
    uint64_t v14 = "-[HMDMatterUARPUploader rescindStagedAssetsForAccessory:error:]";
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@%s: This function should not be called for Matter accessories", (uint8_t *)&v11, 0x16u);
  }

  return 0;
}

- (BOOL)applyStagedAssetsForAccessory:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = HMFGetLogIdentifier();
    int v11 = 138543618;
    __int16 v12 = v9;
    __int16 v13 = 2080;
    uint64_t v14 = "-[HMDMatterUARPUploader applyStagedAssetsForAccessory:error:]";
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@%s: This function should not be called for Matter accessories", (uint8_t *)&v11, 0x16u);
  }

  return 0;
}

- (BOOL)offerAssetToAccessory:(id)a3 asset:(id)a4 error:(id *)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)MEMORY[0x1D9452090]();
  int v10 = self;
  int v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    __int16 v12 = HMFGetLogIdentifier();
    int v14 = 138543618;
    uint64_t v15 = v12;
    __int16 v16 = 2080;
    uint64_t v17 = "-[HMDMatterUARPUploader offerAssetToAccessory:asset:error:]";
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@%s: This function should not be called for Matter accessories", (uint8_t *)&v14, 0x16u);
  }

  return 0;
}

- (BOOL)recvDataFromAccessory:(id)a3 data:(id)a4 error:(id *)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)MEMORY[0x1D9452090]();
  int v10 = self;
  int v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    __int16 v12 = HMFGetLogIdentifier();
    int v14 = 138543618;
    uint64_t v15 = v12;
    __int16 v16 = 2080;
    uint64_t v17 = "-[HMDMatterUARPUploader recvDataFromAccessory:data:error:]";
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@%s: This function should not be called for Matter accessories", (uint8_t *)&v14, 0x16u);
  }

  return 0;
}

- (BOOL)accessoryUnreachable:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v11 = 138543874;
    __int16 v12 = v9;
    __int16 v13 = 2080;
    int v14 = "-[HMDMatterUARPUploader accessoryUnreachable:error:]";
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@%s: accessory %@ is now unreachable.", (uint8_t *)&v11, 0x20u);
  }

  return 1;
}

- (BOOL)accessoryReachable:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v11 = 138543874;
    __int16 v12 = v9;
    __int16 v13 = 2080;
    int v14 = "-[HMDMatterUARPUploader accessoryReachable:error:]";
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@%s: accessory %@ is now reachable.", (uint8_t *)&v11, 0x20u);
  }

  return 1;
}

@end