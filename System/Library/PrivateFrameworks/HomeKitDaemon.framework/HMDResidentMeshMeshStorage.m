@interface HMDResidentMeshMeshStorage
- (BOOL)enabled;
- (HMDResidentDevice)residentDevice;
- (HMDResidentMesh)owner;
- (HMDResidentMeshMeshStorage)initWithResidentDevice:(id)a3 owner:(id)a4;
- (NSDictionary)metrics;
- (unint64_t)generationCount;
- (unint64_t)nestedStatusRequests;
- (void)_requestStatus;
- (void)setEnabled:(BOOL)a3;
- (void)setGenerationCount:(unint64_t)a3;
- (void)setMetrics:(id)a3;
- (void)setNestedStatusRequests:(unint64_t)a3;
- (void)setOwner:(id)a3;
@end

@implementation HMDResidentMeshMeshStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_residentDevice, 0);
  objc_destroyWeak((id *)&self->_owner);
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
  uint64_t v29 = *MEMORY[0x263EF8340];
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
      v24[1] = &unk_26E472298;
      v20 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];

      v21 = [(HMDResidentMeshMeshStorage *)self residentDevice];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __44__HMDResidentMeshMeshStorage__requestStatus__block_invoke;
      v22[3] = &unk_264A2F0C8;
      v22[4] = self;
      [v4 _sendMessage:@"kDeviceMeshUpdateRequestKey" payload:v20 target:v21 force:0 responseHandler:v22];

      goto LABEL_10;
    }
    v10 = (void *)MEMORY[0x230FBD990](v9);
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
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEBUG, v15, buf, 0x16u);
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x230FBD990]();
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
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = [*(id *)(a1 + 32) nestedStatusRequests];
  [*(id *)(a1 + 32) setNestedStatusRequests:0];
  if (v5)
  {
    char v8 = [*(id *)(a1 + 32) owner];
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = v8;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      v13 = [*(id *)(a1 + 32) residentDevice];
      v14 = [v13 device];
      int v24 = 138543874;
      v25 = v12;
      __int16 v26 = 2112;
      __int16 v27 = v14;
      __int16 v28 = 2112;
      id v29 = v5;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Got error result for kDeviceMeshUpdateRequestKey from %@: %@", (uint8_t *)&v24, 0x20u);
    }
    uint64_t v15 = [v5 code];
    if (v15 == 54)
    {
      v16 = [v5 domain];
      int v17 = [v16 isEqualToString:*MEMORY[0x263F0C710]];

      if (v17) {
        uint64_t v15 = [*(id *)(a1 + 32) setGenerationCount:0];
      }
    }
    if (v7 >= 2)
    {
      v18 = (void *)MEMORY[0x230FBD990](v15);
      id v19 = v10;
      v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = HMFGetLogIdentifier();
        v22 = [*(id *)(a1 + 32) residentDevice];
        int v24 = 138543618;
        v25 = v21;
        __int16 v26 = 2112;
        __int16 v27 = v22;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Retrying kDeviceMeshUpdateRequestKey message for %@", (uint8_t *)&v24, 0x16u);
      }
      [*(id *)(a1 + 32) _requestStatus];
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setEnabled:", objc_msgSend(v6, "hmf_BOOLForKey:", @"kMeshDeviceStorageEnabled"));
    v23 = objc_msgSend(v6, "hmf_numberForKey:", @"kMeshDeviceStorageGenerationCount");
    objc_msgSend(*(id *)(a1 + 32), "setGenerationCount:", objc_msgSend(v23, "unsignedIntegerValue"));

    objc_msgSend(v6, "hmf_dictionaryForKey:", @"kMeshDeviceStorageSystemLoad");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) setMetrics:v10];
  }
}

- (HMDResidentMeshMeshStorage)initWithResidentDevice:(id)a3 owner:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDResidentMeshMeshStorage;
  uint64_t v9 = [(HMDResidentMeshMeshStorage *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_residentDevice, a3);
    objc_storeWeak((id *)&v10->_owner, v8);
    uint64_t v11 = [NSDictionary dictionary];
    metrics = v10->_metrics;
    v10->_metrics = (NSDictionary *)v11;

    v10->_generationCount = 1;
    v10->_enabled = 1;
  }

  return v10;
}

@end