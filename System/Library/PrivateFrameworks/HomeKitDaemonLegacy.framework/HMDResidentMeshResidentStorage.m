@interface HMDResidentMeshResidentStorage
+ (id)logCategory;
- (BOOL)_addAccessoryWithLinkQuality:(id)a3 toList:(id)a4;
- (BOOL)_residentDidChange;
- (BOOL)_testCanSkipReachabilityUpdateForAccessory:(id)a3;
- (HMDResidentDevice)residentDevice;
- (HMDResidentMesh)owner;
- (HMDResidentMeshResidentStorage)initWithResidentDevice:(id)a3 owner:(id)a4;
- (HMFTimer)transmitTimer;
- (NSDictionary)lastSentMetrics;
- (NSMutableDictionary)accessoryListWithLinkQuality;
- (NSMutableDictionary)metrics;
- (NSMutableSet)accessoryUUIDs;
- (NSSet)lastSentAccessoryUUIDs;
- (id)_buildPayload;
- (id)logIdentifier;
- (void)_addAccessory:(id)a3 activateTimer:(BOOL)a4;
- (void)_removeAccessory:(id)a3 activateTimer:(BOOL)a4;
- (void)_transmitAfter:(double)a3;
- (void)_transmitStatus:(BOOL)a3;
- (void)setAccessoryListWithLinkQuality:(id)a3;
- (void)setAccessoryUUIDs:(id)a3;
- (void)setLastSentAccessoryUUIDs:(id)a3;
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
  objc_storeStrong((id *)&self->_accessoryListWithLinkQuality, 0);
  objc_storeStrong((id *)&self->_lastSentAccessoryUUIDs, 0);
  objc_storeStrong((id *)&self->_accessoryUUIDs, 0);
  objc_storeStrong((id *)&self->_transmitTimer, 0);
  objc_storeStrong((id *)&self->_lastSentMetrics, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_destroyWeak((id *)&self->_residentDevice);
  objc_destroyWeak((id *)&self->_owner);
}

- (void)setAccessoryListWithLinkQuality:(id)a3
{
}

- (NSMutableDictionary)accessoryListWithLinkQuality
{
  return self->_accessoryListWithLinkQuality;
}

- (void)setLastSentAccessoryUUIDs:(id)a3
{
}

- (NSSet)lastSentAccessoryUUIDs
{
  return self->_lastSentAccessoryUUIDs;
}

- (void)setAccessoryUUIDs:(id)a3
{
}

- (NSMutableSet)accessoryUUIDs
{
  return self->_accessoryUUIDs;
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
  uint64_t v19 = *MEMORY[0x1E4F143B8];
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
      v9 = (void *)MEMORY[0x1D9452090]();
      v10 = self;
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = HMFGetLogIdentifier();
        int v17 = 138543362;
        v18 = v12;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Transmit timer fired; sending status update",
          (uint8_t *)&v17,
          0xCu);
      }
      [(HMDResidentMeshResidentStorage *)v10 _transmitStatus:0];
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1D9452090]();
    v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      int v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Resident mesh owner reference is nil", (uint8_t *)&v17, 0xCu);
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
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v5 = [(HMDResidentMeshResidentStorage *)self owner];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 workQueue];
    dispatch_assert_queue_V2(v7);

    id v8 = [(HMDResidentMeshResidentStorage *)self residentDevice];
    v9 = [v6 resident];
    v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = v6;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      v14 = HMFBooleanToString();
      *(_DWORD *)buf = 138543618;
      v46 = v13;
      __int16 v47 = 2112;
      v48 = v14;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Sending status update with force: %@", buf, 0x16u);
    }
    [(HMDResidentMeshResidentStorage *)self setTransmitTimer:0];
    if (![(HMDResidentMeshResidentStorage *)self _residentDidChange] && !v3)
    {
      v15 = (void *)MEMORY[0x1D9452090]();
      id v16 = v11;
      int v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = HMFGetLogIdentifier();
        uint64_t v19 = [v8 device];
        v20 = [v19 shortDescription];
        *(_DWORD *)buf = 138543618;
        v46 = v18;
        __int16 v47 = 2112;
        v48 = v20;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Not sending status update (metrics for %@ did not change and not forced)", buf, 0x16u);
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
          v29 = (void *)MEMORY[0x1D9452090]();
          id v30 = v11;
          v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            v32 = HMFGetLogIdentifier();
            v33 = [v8 device];
            v34 = [v33 shortDescription];
            *(_DWORD *)buf = 138543618;
            v46 = v32;
            __int16 v47 = 2114;
            v48 = v34;
            v35 = "%{public}@Not sending status update (%{public}@ is ourself)";
LABEL_19:
            _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, v35, buf, 0x16u);
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

            v38 = [(HMDResidentMeshResidentStorage *)self accessoryUUIDs];
            [(HMDResidentMeshResidentStorage *)self setLastSentAccessoryUUIDs:v38];

            v39 = [(HMDResidentMeshResidentStorage *)self _buildPayload];
            v41[0] = MEMORY[0x1E4F143A8];
            v41[1] = 3221225472;
            v41[2] = __50__HMDResidentMeshResidentStorage__transmitStatus___block_invoke;
            v41[3] = &unk_1E6A149B8;
            id v42 = v11;
            id v43 = v8;
            id v44 = v26;
            [v42 _sendMessage:@"kDeviceMeshUpdateKey" payload:v39 target:v43 force:v3 responseHandler:v41];

            goto LABEL_25;
          }
          v29 = (void *)MEMORY[0x1D9452090]();
          id v30 = v11;
          v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            v32 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v46 = v32;
            _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@Not sending status update (our resident device identifier is not set (probably unaccessible))", buf, 0xCu);
            goto LABEL_23;
          }
        }
      }
      else
      {
        v29 = (void *)MEMORY[0x1D9452090]();
        id v30 = v11;
        v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          v32 = HMFGetLogIdentifier();
          v33 = [v26 residentDevice];
          v34 = [v33 device];
          [v34 shortDescription];
          v36 = v40 = v29;
          *(_DWORD *)buf = 138543618;
          v46 = v32;
          __int16 v47 = 2114;
          v48 = v36;
          _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@Not sending status update (%{public}@ is not enabled)", buf, 0x16u);

          v29 = v40;
          goto LABEL_22;
        }
      }
    }
    else
    {
      v29 = (void *)MEMORY[0x1D9452090]();
      id v30 = v11;
      v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        v32 = HMFGetLogIdentifier();
        v33 = [v8 device];
        v34 = [v33 shortDescription];
        *(_DWORD *)buf = 138543618;
        v46 = v32;
        __int16 v47 = 2112;
        v48 = v34;
        v35 = "%{public}@Not sending status update (have not heard about %@ from device manager)";
        goto LABEL_19;
      }
    }

LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  v21 = (void *)MEMORY[0x1D9452090]();
  v22 = self;
  v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v24 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v46 = v24;
    _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Resident mesh owner reference is nil", buf, 0xCu);
  }
LABEL_27:
}

void __50__HMDResidentMeshResidentStorage__transmitStatus___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5)
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
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
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Failed to send status update to %{public}@: %@", (uint8_t *)&v14, 0x20u);
    }
  }
  else
  {
    objc_msgSend(a1[6], "setEnabled:", objc_msgSend(v6, "hmf_BOOLForKey:", @"kMeshDeviceStorageEnabled"));
  }
}

- (id)_buildPayload
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v26 = [(HMDResidentMeshResidentStorage *)self owner];
  BOOL v3 = [v26 resident];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = [v3 accessoryUUIDs];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v27 + 1) + 8 * i) UUIDString];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v7);
  }

  v32[0] = &unk_1F2DC8830;
  v31[0] = @"kMeshVersion";
  v31[1] = @"kMeshDeviceStorageGenerationCount";
  v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "generationCount"));
  v32[1] = v25;
  v31[2] = @"kMeshDevice";
  v24 = [v3 residentDevice];
  v22 = [v24 device];
  [v22 identifier];
  id v11 = v3;
  v12 = v23 = v3;
  v13 = [v12 UUIDString];
  v32[2] = v13;
  v31[3] = @"kMeshDeviceStorageEnabled";
  int v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "enabled"));
  v32[3] = v14;
  v31[4] = @"kMeshDeviceStorageAcccessories";
  v15 = (void *)[v4 copy];
  v32[4] = v15;
  v31[5] = @"kMeshDeviceStorageAccessoriesWithLinkQuality";
  __int16 v16 = [(HMDResidentMeshResidentStorage *)self accessoryListWithLinkQuality];
  int v17 = (void *)[v16 copy];
  v32[5] = v17;
  v31[6] = @"kMeshDeviceStorageSystemLoad";
  __int16 v18 = [v26 loadMetrics];
  id v19 = (void *)[v18 copy];
  v32[6] = v19;
  id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:7];

  return v21;
}

- (void)_transmitAfter:(double)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMDResidentMeshResidentStorage *)self owner];
  if (!v5)
  {
    uint64_t v12 = MEMORY[0x1D9452090]();
    v13 = self;
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v31 = 138543362;
      v32 = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot transmit after delay because owner reference is nil", (uint8_t *)&v31, 0xCu);
    }
    id v11 = (void *)v12;
    goto LABEL_16;
  }
  uint64_t v6 = [(HMDResidentMeshResidentStorage *)self transmitTimer];

  if (v6)
  {
    uint64_t v7 = MEMORY[0x1D9452090]();
    id v8 = v5;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = HMFGetLogIdentifier();
      int v31 = 138543362;
      v32 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Not scheduling transmit timer because one already exists", (uint8_t *)&v31, 0xCu);
    }
    id v11 = (void *)v7;
LABEL_16:
    goto LABEL_17;
  }
  BOOL v16 = [(HMDResidentMeshResidentStorage *)self _residentDidChange];
  int v17 = (void *)MEMORY[0x1D9452090]();
  id v18 = v5;
  id v19 = HMFGetOSLogHandle();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
  if (!v16)
  {
    if (v20)
    {
      long long v30 = HMFGetLogIdentifier();
      int v31 = 138543362;
      v32 = v30;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Not scheduling transmit timer because metrics didn't change", (uint8_t *)&v31, 0xCu);
    }
    id v11 = v17;
    goto LABEL_16;
  }
  if (v20)
  {
    id v21 = HMFGetLogIdentifier();
    v22 = [(HMDResidentMeshResidentStorage *)self residentDevice];
    v23 = [v22 device];
    v24 = [v23 shortDescription];
    int v31 = 138543874;
    v32 = v21;
    __int16 v33 = 2114;
    uint64_t v34 = v24;
    __int16 v35 = 2048;
    double v36 = a3;
    _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Starting transmit timer for %{public}@ for %fs", (uint8_t *)&v31, 0x20u);
  }
  v25 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:0 options:a3];
  [(HMDResidentMeshResidentStorage *)self setTransmitTimer:v25];

  v26 = [(HMDResidentMeshResidentStorage *)self transmitTimer];
  [v26 setDelegate:self];

  long long v27 = [(HMDResidentMeshResidentStorage *)self transmitTimer];
  long long v28 = [v18 workQueue];
  [v27 setDelegateQueue:v28];

  long long v29 = [(HMDResidentMeshResidentStorage *)self transmitTimer];
  [v29 resume];

LABEL_17:
}

- (BOOL)_residentDidChange
{
  BOOL v3 = [(HMDResidentMeshResidentStorage *)self metrics];
  id v4 = [(HMDResidentMeshResidentStorage *)self lastSentMetrics];
  if ([v3 isEqualToDictionary:v4])
  {
    id v5 = [(HMDResidentMeshResidentStorage *)self accessoryUUIDs];
    uint64_t v6 = [(HMDResidentMeshResidentStorage *)self lastSentAccessoryUUIDs];
    int v7 = [v5 isEqual:v6] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (void)_removeAccessory:(id)a3 activateTimer:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 identifier];

  if (v7)
  {
    id v8 = [(HMDResidentMeshResidentStorage *)self accessoryListWithLinkQuality];
    id v9 = [v6 identifier];
    [v8 removeObjectForKey:v9];
  }
  else
  {
    v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v37 = v13;
      __int16 v38 = 2112;
      id v39 = v6;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Accessory: %@ with nil identifier sent to remove", buf, 0x16u);
    }
  }
  int v14 = [(HMDResidentMeshResidentStorage *)self accessoryUUIDs];
  v15 = [v6 uuid];
  int v16 = [v14 containsObject:v15];

  if (v16
    && ![(HMDResidentMeshResidentStorage *)self _testCanSkipReachabilityUpdateForAccessory:v6])
  {
    int v17 = (void *)MEMORY[0x1D9452090]();
    id v18 = [(HMDResidentMeshResidentStorage *)self owner];
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      BOOL v20 = v35 = v4;
      __int16 v33 = [(HMDResidentMeshResidentStorage *)self owner];
      v32 = [v33 resident];
      int v31 = [v32 residentDevice];
      long long v30 = [v31 device];
      [v30 shortDescription];
      id v21 = v34 = v17;
      v22 = [v6 uuid];
      v23 = [(HMDResidentMeshResidentStorage *)self residentDevice];
      v24 = [v23 device];
      uint64_t v25 = [v24 shortDescription];
      v26 = (void *)v25;
      *(_DWORD *)buf = 138544386;
      long long v27 = "NO";
      uint64_t v37 = v20;
      if (v35) {
        long long v27 = "YES";
      }
      __int16 v38 = 2114;
      id v39 = v21;
      __int16 v40 = 2114;
      v41 = v22;
      __int16 v42 = 2114;
      uint64_t v43 = v25;
      __int16 v44 = 2080;
      v45 = v27;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Removing connectivity from %{public}@ to %{public}@ for %{public}@ (activateTimer=%s)", buf, 0x34u);

      int v17 = v34;
      BOOL v4 = v35;
    }

    long long v28 = [(HMDResidentMeshResidentStorage *)self accessoryUUIDs];
    long long v29 = [v6 uuid];
    [v28 removeObject:v29];

    if (v4) {
      [(HMDResidentMeshResidentStorage *)self _transmitAfter:10.0];
    }
  }
}

- (void)_addAccessory:(id)a3 activateTimer:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 uuid];
  id v8 = [(HMDResidentMeshResidentStorage *)self owner];
  id v9 = (void *)MEMORY[0x1D9452090]();
  if (v8)
  {
    v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v40 = v12;
      __int16 v41 = 2112;
      id v42 = v6;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Adding accessory to mesh: %@", buf, 0x16u);
    }
    id v13 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v14 = v13;
    }
    else {
      int v14 = 0;
    }
    id v15 = v14;

    if ([v15 hasBTLELink])
    {
      int v16 = [(HMDResidentMeshResidentStorage *)v10 accessoryListWithLinkQuality];
      BOOL v17 = [(HMDResidentMeshResidentStorage *)v10 _addAccessoryWithLinkQuality:v15 toList:v16];
    }
    else
    {
      BOOL v17 = 0;
    }
    BOOL v20 = [(HMDResidentMeshResidentStorage *)v10 accessoryUUIDs];
    char v21 = [v20 containsObject:v7];

    if ((v21 & 1) == 0
      && ![(HMDResidentMeshResidentStorage *)v10 _testCanSkipReachabilityUpdateForAccessory:v13])
    {
      BOOL v38 = v4;
      v22 = (void *)MEMORY[0x1D9452090]();
      v23 = [(HMDResidentMeshResidentStorage *)v10 owner];
      v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        uint64_t v37 = HMFGetLogIdentifier();
        BOOL v35 = [(HMDResidentMeshResidentStorage *)v10 owner];
        uint64_t v34 = [v35 resident];
        __int16 v33 = [v34 residentDevice];
        v32 = [v33 device];
        uint64_t v25 = [v32 shortDescription];
        long long v30 = [(HMDResidentMeshResidentStorage *)v10 residentDevice];
        [v30 device];
        v26 = int v31 = v23;
        [v26 shortDescription];
        long long v27 = v36 = v22;
        long long v29 = HMFBooleanToString();
        *(_DWORD *)buf = 138544386;
        __int16 v40 = v37;
        __int16 v41 = 2114;
        id v42 = v25;
        __int16 v43 = 2114;
        __int16 v44 = v7;
        __int16 v45 = 2114;
        uint64_t v46 = v27;
        __int16 v47 = 2112;
        v48 = v29;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Adding connectivity from %{public}@ to %{public}@ for %{public}@ (activateTimer=%@)", buf, 0x34u);

        v22 = v36;
        v23 = v31;
      }
      long long v28 = [(HMDResidentMeshResidentStorage *)v10 accessoryUUIDs];
      [v28 addObject:v7];

      if (v38 || v17) {
        [(HMDResidentMeshResidentStorage *)v10 _transmitAfter:10.0];
      }
    }
  }
  else
  {
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v40 = v19;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@[HMDResidentMesh] Owner of Resident Device node disappeared out from under us.", buf, 0xCu);
    }
  }
}

- (BOOL)_testCanSkipReachabilityUpdateForAccessory:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = 0;
  }
  id v5 = v4;
  id v6 = v5;
  if (v5)
  {
    int v7 = [v5 cameraProfiles];
    BOOL v8 = [v7 count] == 0;
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (BOOL)_addAccessoryWithLinkQuality:(id)a3 toList:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = [v6 identifier];
  char v16 = 0;
  uint64_t v15 = 5;
  BOOL v8 = [v6 home];

  [v8 retrieveStateForTrackedAccessory:v7 stateNumber:0 isReachable:&v16 linkQuality:&v15 lastSeen:0];
  id v9 = [v5 objectForKeyedSubscript:v7];
  v10 = v9;
  if (!v16)
  {
    if (v9)
    {
      [v5 setObject:0 forKeyedSubscript:v7];
      goto LABEL_7;
    }
LABEL_8:
    BOOL v13 = 0;
    goto LABEL_9;
  }
  if (!v9) {
    goto LABEL_8;
  }
  uint64_t v11 = [v9 integerValue];
  if (v11 == v15) {
    goto LABEL_8;
  }
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  [v5 setObject:v12 forKeyedSubscript:v7];

LABEL_7:
  BOOL v13 = 1;
LABEL_9:

  return v13;
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
  BOOL v8 = v7;
  if (!v7)
  {
LABEL_7:
    v23 = (void *)_HMFPreconditionFailure();
    return (HMDResidentMeshResidentStorage *)+[HMDResidentMeshResidentStorage logCategory];
  }
  v25.receiver = self;
  v25.super_class = (Class)HMDResidentMeshResidentStorage;
  id v9 = [(HMDResidentMeshResidentStorage *)&v25 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_owner, v8);
    objc_storeWeak((id *)&v10->_residentDevice, v6);
    uint64_t v11 = [v8 loadMetrics];
    uint64_t v12 = [v11 mutableCopy];
    metrics = v10->_metrics;
    v10->_metrics = (NSMutableDictionary *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionary];
    lastSentMetrics = v10->_lastSentMetrics;
    v10->_lastSentMetrics = (NSDictionary *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
    accessoryUUIDs = v10->_accessoryUUIDs;
    v10->_accessoryUUIDs = (NSMutableSet *)v16;

    uint64_t v18 = [MEMORY[0x1E4F1CAD0] set];
    lastSentAccessoryUUIDs = v10->_lastSentAccessoryUUIDs;
    v10->_lastSentAccessoryUUIDs = (NSSet *)v18;

    uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
    accessoryListWithLinkQuality = v10->_accessoryListWithLinkQuality;
    v10->_accessoryListWithLinkQuality = (NSMutableDictionary *)v20;
  }
  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t23_105076 != -1) {
    dispatch_once(&logCategory__hmf_once_t23_105076, &__block_literal_global_105077);
  }
  v2 = (void *)logCategory__hmf_once_v24_105078;
  return v2;
}

uint64_t __45__HMDResidentMeshResidentStorage_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v24_105078;
  logCategory__hmf_once_v24_105078 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end