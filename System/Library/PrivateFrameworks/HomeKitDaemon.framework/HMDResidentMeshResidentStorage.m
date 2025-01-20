@interface HMDResidentMeshResidentStorage
+ (id)logCategory;
- (BOOL)_residentDidChange;
- (HMDResidentDevice)residentDevice;
- (HMDResidentMesh)owner;
- (HMDResidentMeshResidentStorage)initWithResidentDevice:(id)a3 owner:(id)a4;
- (HMFTimer)transmitTimer;
- (NSDictionary)lastSentMetrics;
- (NSMutableDictionary)metrics;
- (id)_buildPayload;
- (id)logIdentifier;
- (void)_transmitAfter:(double)a3;
- (void)_transmitStatus:(BOOL)a3;
- (void)setLastSentMetrics:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setOwner:(id)a3;
- (void)setResidentDevice:(id)a3;
- (void)setTransmitTimer:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDResidentMeshResidentStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transmitTimer, 0);
  objc_storeStrong((id *)&self->_lastSentMetrics, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_destroyWeak((id *)&self->_residentDevice);
  objc_destroyWeak((id *)&self->_owner);
}

- (void)setTransmitTimer:(id)a3
{
}

- (HMFTimer)transmitTimer
{
  return self->_transmitTimer;
}

- (void)setLastSentMetrics:(id)a3
{
}

- (NSDictionary)lastSentMetrics
{
  return self->_lastSentMetrics;
}

- (void)setMetrics:(id)a3
{
}

- (NSMutableDictionary)metrics
{
  return self->_metrics;
}

- (void)setResidentDevice:(id)a3
{
}

- (HMDResidentDevice)residentDevice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_residentDevice);
  return (HMDResidentDevice *)WeakRetained;
}

- (void)setOwner:(id)a3
{
}

- (HMDResidentMesh)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  return (HMDResidentMesh *)WeakRetained;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDResidentMeshResidentStorage *)self owner];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 workQueue];
    dispatch_assert_queue_V2(v7);

    id v8 = [(HMDResidentMeshResidentStorage *)self transmitTimer];

    if (v8 == v4)
    {
      v9 = (void *)MEMORY[0x230FBD990]();
      v10 = self;
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = HMFGetLogIdentifier();
        int v17 = 138543362;
        v18 = v12;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Transmit timer fired; sending status update",
          (uint8_t *)&v17,
          0xCu);
      }
      [(HMDResidentMeshResidentStorage *)v10 _transmitStatus:0];
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x230FBD990]();
    v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      int v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Resident mesh owner reference is nil", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (id)logIdentifier
{
  v2 = [(HMDResidentMeshResidentStorage *)self residentDevice];
  v3 = [v2 device];
  id v4 = [v3 identifier];
  v5 = [v4 UUIDString];

  return v5;
}

- (void)_transmitStatus:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v48 = *MEMORY[0x263EF8340];
  v5 = [(HMDResidentMeshResidentStorage *)self owner];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 workQueue];
    dispatch_assert_queue_V2(v7);

    id v8 = [(HMDResidentMeshResidentStorage *)self residentDevice];
    v9 = [v6 resident];
    v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = v6;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      v14 = HMFBooleanToString();
      *(_DWORD *)buf = 138543618;
      v45 = v13;
      __int16 v46 = 2112;
      v47 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Sending status update with force: %@", buf, 0x16u);
    }
    [(HMDResidentMeshResidentStorage *)self setTransmitTimer:0];
    if (![(HMDResidentMeshResidentStorage *)self _residentDidChange] && !v3)
    {
      v15 = (void *)MEMORY[0x230FBD990]();
      id v16 = v11;
      int v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = HMFGetLogIdentifier();
        uint64_t v19 = [v8 device];
        v20 = [v19 shortDescription];
        *(_DWORD *)buf = 138543618;
        v45 = v18;
        __int16 v46 = 2112;
        v47 = v20;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Not sending status update (metrics for %@ did not change and not forced)", buf, 0x16u);
      }
      goto LABEL_26;
    }
    v25 = [v11 _meshStorageForResidentDevice:v8];
    v26 = v25;
    if (v25)
    {
      if ([v25 enabled])
      {
        v27 = [v9 residentDevice];
        int v28 = [v8 isEqual:v27];

        if (v28)
        {
          v29 = (void *)MEMORY[0x230FBD990]();
          id v30 = v11;
          v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            v32 = HMFGetLogIdentifier();
            v33 = [v8 device];
            v34 = [v33 shortDescription];
            *(_DWORD *)buf = 138543618;
            v45 = v32;
            __int16 v46 = 2114;
            v47 = v34;
            v35 = "%{public}@Not sending status update (%{public}@ is ourself)";
LABEL_19:
            _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, v35, buf, 0x16u);
LABEL_22:

LABEL_23:
          }
        }
        else
        {
          if (v9)
          {
            v37 = [(HMDResidentMeshResidentStorage *)self metrics];
            [(HMDResidentMeshResidentStorage *)self setLastSentMetrics:v37];

            v38 = [(HMDResidentMeshResidentStorage *)self _buildPayload];
            v40[0] = MEMORY[0x263EF8330];
            v40[1] = 3221225472;
            v40[2] = __50__HMDResidentMeshResidentStorage__transmitStatus___block_invoke;
            v40[3] = &unk_264A2AEE8;
            id v41 = v11;
            id v42 = v8;
            id v43 = v26;
            [v41 _sendMessage:@"kDeviceMeshUpdateKey" payload:v38 target:v42 force:v3 responseHandler:v40];

            goto LABEL_25;
          }
          v29 = (void *)MEMORY[0x230FBD990]();
          id v30 = v11;
          v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            v32 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v45 = v32;
            _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Not sending status update (our resident device identifier is not set (probably unaccessible))", buf, 0xCu);
            goto LABEL_23;
          }
        }
      }
      else
      {
        v29 = (void *)MEMORY[0x230FBD990]();
        id v30 = v11;
        v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          v32 = HMFGetLogIdentifier();
          v33 = [v26 residentDevice];
          v34 = [v33 device];
          [v34 shortDescription];
          v36 = v39 = v29;
          *(_DWORD *)buf = 138543618;
          v45 = v32;
          __int16 v46 = 2114;
          v47 = v36;
          _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Not sending status update (%{public}@ is not enabled)", buf, 0x16u);

          v29 = v39;
          goto LABEL_22;
        }
      }
    }
    else
    {
      v29 = (void *)MEMORY[0x230FBD990]();
      id v30 = v11;
      v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        v32 = HMFGetLogIdentifier();
        v33 = [v8 device];
        v34 = [v33 shortDescription];
        *(_DWORD *)buf = 138543618;
        v45 = v32;
        __int16 v46 = 2112;
        v47 = v34;
        v35 = "%{public}@Not sending status update (have not heard about %@ from device manager)";
        goto LABEL_19;
      }
    }

LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  v21 = (void *)MEMORY[0x230FBD990]();
  v22 = self;
  v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v24 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v45 = v24;
    _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Resident mesh owner reference is nil", buf, 0xCu);
  }
LABEL_27:
}

void __50__HMDResidentMeshResidentStorage__transmitStatus___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5)
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = a1[4];
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      v12 = [a1[5] device];
      v13 = [v12 shortDescription];
      int v14 = 138543874;
      v15 = v11;
      __int16 v16 = 2114;
      int v17 = v13;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Failed to send status update to %{public}@: %@", (uint8_t *)&v14, 0x20u);
    }
  }
  else
  {
    objc_msgSend(a1[6], "setEnabled:", objc_msgSend(v6, "hmf_BOOLForKey:", @"kMeshDeviceStorageEnabled"));
  }
}

- (id)_buildPayload
{
  v15[5] = *MEMORY[0x263EF8340];
  v2 = [(HMDResidentMeshResidentStorage *)self owner];
  BOOL v3 = [v2 resident];
  v15[0] = &unk_26E472298;
  v14[0] = @"kMeshVersion";
  v14[1] = @"kMeshDeviceStorageGenerationCount";
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "generationCount"));
  v15[1] = v13;
  v14[2] = @"kMeshDevice";
  id v4 = [v3 residentDevice];
  id v5 = [v4 device];
  id v6 = [v5 identifier];
  v7 = [v6 UUIDString];
  v15[2] = v7;
  v14[3] = @"kMeshDeviceStorageEnabled";
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "enabled"));
  v15[3] = v8;
  v14[4] = @"kMeshDeviceStorageSystemLoad";
  id v9 = [v2 loadMetrics];
  v10 = (void *)[v9 copy];
  v15[4] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:5];

  return v11;
}

- (void)_transmitAfter:(double)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = [(HMDResidentMeshResidentStorage *)self owner];
  if (!v5)
  {
    uint64_t v12 = MEMORY[0x230FBD990]();
    v13 = self;
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v31 = 138543362;
      v32 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot transmit after delay because owner reference is nil", (uint8_t *)&v31, 0xCu);
    }
    id v11 = (void *)v12;
    goto LABEL_16;
  }
  id v6 = [(HMDResidentMeshResidentStorage *)self transmitTimer];

  if (v6)
  {
    uint64_t v7 = MEMORY[0x230FBD990]();
    id v8 = v5;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = HMFGetLogIdentifier();
      int v31 = 138543362;
      v32 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Not scheduling transmit timer because one already exists", (uint8_t *)&v31, 0xCu);
    }
    id v11 = (void *)v7;
LABEL_16:
    goto LABEL_17;
  }
  BOOL v16 = [(HMDResidentMeshResidentStorage *)self _residentDidChange];
  int v17 = (void *)MEMORY[0x230FBD990]();
  id v18 = v5;
  id v19 = HMFGetOSLogHandle();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
  if (!v16)
  {
    if (v20)
    {
      id v30 = HMFGetLogIdentifier();
      int v31 = 138543362;
      v32 = v30;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Not scheduling transmit timer because metrics didn't change", (uint8_t *)&v31, 0xCu);
    }
    id v11 = v17;
    goto LABEL_16;
  }
  if (v20)
  {
    v21 = HMFGetLogIdentifier();
    v22 = [(HMDResidentMeshResidentStorage *)self residentDevice];
    v23 = [v22 device];
    v24 = [v23 shortDescription];
    int v31 = 138543874;
    v32 = v21;
    __int16 v33 = 2114;
    v34 = v24;
    __int16 v35 = 2048;
    double v36 = a3;
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Starting transmit timer for %{public}@ for %fs", (uint8_t *)&v31, 0x20u);
  }
  v25 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:a3];
  [(HMDResidentMeshResidentStorage *)self setTransmitTimer:v25];

  v26 = [(HMDResidentMeshResidentStorage *)self transmitTimer];
  [v26 setDelegate:self];

  v27 = [(HMDResidentMeshResidentStorage *)self transmitTimer];
  int v28 = [v18 workQueue];
  [v27 setDelegateQueue:v28];

  v29 = [(HMDResidentMeshResidentStorage *)self transmitTimer];
  [v29 resume];

LABEL_17:
}

- (BOOL)_residentDidChange
{
  BOOL v3 = [(HMDResidentMeshResidentStorage *)self metrics];
  id v4 = [(HMDResidentMeshResidentStorage *)self lastSentMetrics];
  char v5 = [v3 isEqualToDictionary:v4] ^ 1;

  return v5;
}

- (HMDResidentMeshResidentStorage)initWithResidentDevice:(id)a3 owner:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  id v8 = v7;
  if (!v7)
  {
LABEL_7:
    int v17 = (void *)_HMFPreconditionFailure();
    return (HMDResidentMeshResidentStorage *)+[HMDResidentMeshResidentStorage logCategory];
  }
  v19.receiver = self;
  v19.super_class = (Class)HMDResidentMeshResidentStorage;
  id v9 = [(HMDResidentMeshResidentStorage *)&v19 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_owner, v8);
    objc_storeWeak((id *)&v10->_residentDevice, v6);
    id v11 = [v8 loadMetrics];
    uint64_t v12 = [v11 mutableCopy];
    metrics = v10->_metrics;
    v10->_metrics = (NSMutableDictionary *)v12;

    uint64_t v14 = [NSDictionary dictionary];
    lastSentMetrics = v10->_lastSentMetrics;
    v10->_lastSentMetrics = (NSDictionary *)v14;
  }
  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16_152819 != -1) {
    dispatch_once(&logCategory__hmf_once_t16_152819, &__block_literal_global_152820);
  }
  v2 = (void *)logCategory__hmf_once_v17_152821;
  return v2;
}

void __45__HMDResidentMeshResidentStorage_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v17_152821;
  logCategory__hmf_once_v17_152821 = v0;
}

@end