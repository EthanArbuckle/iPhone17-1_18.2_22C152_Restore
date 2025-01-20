@interface HMDResidentMeshMeshStorage
- (BOOL)enabled;
- (HMDResidentDevice)residentDevice;
- (HMDResidentMesh)owner;
- (HMDResidentMeshMeshStorage)initWithResidentDevice:(id)a3 owner:(id)a4;
- (NSDictionary)metrics;
- (NSMutableDictionary)accessoryListWithLinkQuality;
- (NSMutableSet)accessoryUUIDs;
- (unint64_t)generationCount;
- (unint64_t)nestedStatusRequests;
- (void)_requestStatus;
- (void)setAccessoryListWithLinkQuality:(id)a3;
- (void)setAccessoryUUIDs:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGenerationCount:(unint64_t)a3;
- (void)setMetrics:(id)a3;
- (void)setNestedStatusRequests:(unint64_t)a3;
- (void)setOwner:(id)a3;
@end

@implementation HMDResidentMeshMeshStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryListWithLinkQuality, 0);
  objc_storeStrong((id *)&self->_accessoryUUIDs, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_residentDevice, 0);
  objc_destroyWeak((id *)&self->_owner);
}

- (void)setAccessoryListWithLinkQuality:(id)a3
{
}

- (NSMutableDictionary)accessoryListWithLinkQuality
{
  return self->_accessoryListWithLinkQuality;
}

- (void)setAccessoryUUIDs:(id)a3
{
}

- (NSMutableSet)accessoryUUIDs
{
  return self->_accessoryUUIDs;
}

- (void)setNestedStatusRequests:(unint64_t)a3
{
  self->_nestedStatusRequests = a3;
}

- (unint64_t)nestedStatusRequests
{
  return self->_nestedStatusRequests;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setGenerationCount:(unint64_t)a3
{
  self->_generationCount = a3;
}

- (unint64_t)generationCount
{
  return self->_generationCount;
}

- (void)setMetrics:(id)a3
{
}

- (NSDictionary)metrics
{
  return self->_metrics;
}

- (HMDResidentDevice)residentDevice
{
  return self->_residentDevice;
}

- (void)setOwner:(id)a3
{
}

- (HMDResidentMesh)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  return (HMDResidentMesh *)WeakRetained;
}

- (void)_requestStatus
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDResidentMeshMeshStorage *)self owner];
  if (!v3) {
    _HMFPreconditionFailure();
  }
  v4 = v3;
  v5 = [v3 workQueue];
  dispatch_assert_queue_V2(v5);

  unint64_t v6 = [(HMDResidentMeshMeshStorage *)self nestedStatusRequests];
  v7 = [(HMDResidentMeshMeshStorage *)self residentDevice];
  char v8 = [v7 isReachable];

  if (v8)
  {
    uint64_t v9 = [(HMDResidentMeshMeshStorage *)self setNestedStatusRequests:[(HMDResidentMeshMeshStorage *)self nestedStatusRequests] + 1];
    if (!v6)
    {
      v23[0] = @"kMeshDevice";
      v16 = [(HMDResidentMeshMeshStorage *)self residentDevice];
      v17 = [v16 device];
      v18 = [v17 identifier];
      v19 = [v18 UUIDString];
      v23[1] = @"kMeshVersion";
      v24[0] = v19;
      v24[1] = &unk_1F2DC8830;
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];

      v21 = [(HMDResidentMeshMeshStorage *)self residentDevice];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __44__HMDResidentMeshMeshStorage__requestStatus__block_invoke;
      v22[3] = &unk_1E6A18C18;
      v22[4] = self;
      [v4 _sendMessage:@"kDeviceMeshUpdateRequestKey" payload:v20 target:v21 force:0 responseHandler:v22];

      goto LABEL_10;
    }
    v10 = (void *)MEMORY[0x1D9452090](v9);
    v11 = [(HMDResidentMeshMeshStorage *)self owner];
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = HMFGetLogIdentifier();
      v14 = [(HMDResidentMeshMeshStorage *)self residentDevice];
      *(_DWORD *)buf = 138543618;
      v26 = v13;
      __int16 v27 = 2112;
      v28 = v14;
      v15 = "%{public}@Not sending status request because we already have an outstanding request for device: %@";
LABEL_8:
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEBUG, v15, buf, 0x16u);
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1D9452090]();
    v11 = [(HMDResidentMeshMeshStorage *)self owner];
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = HMFGetLogIdentifier();
      v14 = [(HMDResidentMeshMeshStorage *)self residentDevice];
      *(_DWORD *)buf = 138543618;
      v26 = v13;
      __int16 v27 = 2112;
      v28 = v14;
      v15 = "%{public}@skipping update to unreachable resident %@";
      goto LABEL_8;
    }
  }

LABEL_10:
}

void __44__HMDResidentMeshMeshStorage__requestStatus__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = [*(id *)(a1 + 32) nestedStatusRequests];
  [*(id *)(a1 + 32) setNestedStatusRequests:0];
  if (v5)
  {
    char v8 = [*(id *)(a1 + 32) owner];
    uint64_t v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = v8;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      v13 = [*(id *)(a1 + 32) residentDevice];
      v14 = [v13 device];
      int v29 = 138543874;
      v30 = v12;
      __int16 v31 = 2112;
      v32 = v14;
      __int16 v33 = 2112;
      id v34 = v5;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Got error result for kDeviceMeshUpdateRequestKey from %@: %@", (uint8_t *)&v29, 0x20u);
    }
    if ([v5 code] == 54)
    {
      v15 = [v5 domain];
      int v16 = [v15 isEqualToString:*MEMORY[0x1E4F2D140]];

      if (v16)
      {
        [*(id *)(a1 + 32) setGenerationCount:0];
        v17 = [*(id *)(a1 + 32) accessoryUUIDs];
        [v17 removeAllObjects];

        v18 = [MEMORY[0x1E4F1CA60] dictionary];
        [*(id *)(a1 + 32) setAccessoryListWithLinkQuality:v18];
      }
    }
    if (v7 >= 2)
    {
      v19 = (void *)MEMORY[0x1D9452090]();
      id v20 = v10;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = HMFGetLogIdentifier();
        v23 = [*(id *)(a1 + 32) residentDevice];
        int v29 = 138543618;
        v30 = v22;
        __int16 v31 = 2112;
        v32 = v23;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Retrying kDeviceMeshUpdateRequestKey message for %@", (uint8_t *)&v29, 0x16u);
      }
      [*(id *)(a1 + 32) _requestStatus];
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setEnabled:", objc_msgSend(v6, "hmf_BOOLForKey:", @"kMeshDeviceStorageEnabled"));
    v24 = objc_msgSend(v6, "hmf_numberForKey:", @"kMeshDeviceStorageGenerationCount");
    objc_msgSend(*(id *)(a1 + 32), "setGenerationCount:", objc_msgSend(v24, "unsignedIntegerValue"));

    v25 = objc_msgSend(v6, "hmf_dictionaryForKey:", @"kMeshDeviceStorageSystemLoad");
    [*(id *)(a1 + 32) setMetrics:v25];

    v26 = objc_msgSend(v6, "hmf_arrayForKey:", @"kMeshDeviceStorageAcccessories");
    __int16 v27 = uuidSetFromArrayOfStrings(v26);
    [*(id *)(a1 + 32) setAccessoryUUIDs:v27];

    objc_msgSend(v6, "hmf_dictionaryForKey:", @"kMeshDeviceStorageAccessoriesWithLinkQuality");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    v28 = (void *)[v10 mutableCopy];
    [*(id *)(a1 + 32) setAccessoryListWithLinkQuality:v28];
  }
}

- (HMDResidentMeshMeshStorage)initWithResidentDevice:(id)a3 owner:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMDResidentMeshMeshStorage;
  uint64_t v9 = [(HMDResidentMeshMeshStorage *)&v18 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_residentDevice, a3);
    objc_storeWeak((id *)&v10->_owner, v8);
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionary];
    metrics = v10->_metrics;
    v10->_metrics = (NSDictionary *)v11;

    v10->_generationCount = 1;
    v10->_enabled = 1;
    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    accessoryUUIDs = v10->_accessoryUUIDs;
    v10->_accessoryUUIDs = v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
    accessoryListWithLinkQuality = v10->_accessoryListWithLinkQuality;
    v10->_accessoryListWithLinkQuality = (NSMutableDictionary *)v15;
  }
  return v10;
}

@end