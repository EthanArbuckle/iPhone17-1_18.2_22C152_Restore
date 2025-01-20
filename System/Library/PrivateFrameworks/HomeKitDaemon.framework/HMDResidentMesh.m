@interface HMDResidentMesh
+ (id)logCategory;
- (HMDHomeManager)homeManager;
- (HMDMessageDispatcher)messageDispatcher;
- (HMDResidentMesh)initWithHomeManager:(id)a3 residentEnabled:(BOOL)a4;
- (HMDResidentMeshMeshStorage)resident;
- (HMFTimer)devicesChangedTimer;
- (NSMutableArray)reachableAccessories;
- (NSMutableArray)residents;
- (NSMutableDictionary)loadMetrics;
- (NSMutableSet)updatedOrAddedDevices;
- (NSSet)primaryResidentForHomes;
- (NSString)stateDump;
- (NSUUID)uuid;
- (OS_dispatch_queue)workQueue;
- (id)_addMeshStorageResidentDevice:(id)a3;
- (id)_addResidentStorageResidentDevice:(id)a3;
- (id)_meshStorageForDeviceIdentifier:(id)a3;
- (id)_meshStorageForResidentDevice:(id)a3;
- (id)_residentStorageForResidentDevice:(id)a3;
- (id)_stateDump;
- (id)cameraRecordingAnalysisNodesForCameraAccessory:(id)a3;
- (id)messageDestination;
- (void)__deviceIsNotReachable:(id)a3;
- (void)__deviceIsReachable:(id)a3;
- (void)__deviceResidentChanged:(id)a3;
- (void)__rebuildResidents:(id)a3;
- (void)__residentDeviceAddedOrUpdatedNotification:(id)a3;
- (void)__residentDeviceRemovedNotification:(id)a3;
- (void)_buildResidentsWithElection:(id)a3 device:(id)a4;
- (void)_deviceIsNotReachable:(id)a3;
- (void)_handleAddUpdateOrReachabilityChangeForDevice:(id)a3;
- (void)_handleMeshUpdateMessage:(id)a3;
- (void)_handleMeshUpdateRequestMessage:(id)a3;
- (void)_handlePrimaryResidentChangedNotification:(id)a3;
- (void)_sendMessage:(id)a3 payload:(id)a4 target:(id)a5 force:(BOOL)a6 responseHandler:(id)a7;
- (void)_transmitCurrentDeviceMetricsToPrimaryResidentWithIsUrgent:(BOOL)a3;
- (void)dealloc;
- (void)setHomeManager:(id)a3;
- (void)setMessageDispatcher:(id)a3;
- (void)setMetricForCurrentDevice:(id)a3 withValue:(id)a4 isUrgent:(BOOL)a5;
- (void)setPrimaryResidentForHomes:(id)a3;
- (void)setReachableAccessories:(id)a3;
- (void)setResident:(id)a3;
- (void)setResidents:(id)a3;
- (void)setUpdatedOrAddedDevices:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDResidentMesh

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedOrAddedDevices, 0);
  objc_storeStrong((id *)&self->_loadMetrics, 0);
  objc_storeStrong((id *)&self->_primaryResidentForHomes, 0);
  objc_storeStrong((id *)&self->_devicesChangedTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_reachableAccessories, 0);
  objc_destroyWeak((id *)&self->_resident);
  objc_storeStrong((id *)&self->_residents, 0);
  objc_destroyWeak((id *)&self->_messageDispatcher);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setUpdatedOrAddedDevices:(id)a3
{
}

- (NSMutableSet)updatedOrAddedDevices
{
  return self->_updatedOrAddedDevices;
}

- (NSMutableDictionary)loadMetrics
{
  return self->_loadMetrics;
}

- (void)setPrimaryResidentForHomes:(id)a3
{
}

- (NSSet)primaryResidentForHomes
{
  return self->_primaryResidentForHomes;
}

- (HMFTimer)devicesChangedTimer
{
  return self->_devicesChangedTimer;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setReachableAccessories:(id)a3
{
}

- (NSMutableArray)reachableAccessories
{
  return self->_reachableAccessories;
}

- (void)setResident:(id)a3
{
}

- (HMDResidentMeshMeshStorage)resident
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resident);
  return (HMDResidentMeshMeshStorage *)WeakRetained;
}

- (void)setResidents:(id)a3
{
}

- (NSMutableArray)residents
{
  return self->_residents;
}

- (void)setMessageDispatcher:(id)a3
{
}

- (HMDMessageDispatcher)messageDispatcher
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageDispatcher);
  return (HMDMessageDispatcher *)WeakRetained;
}

- (void)setHomeManager:(id)a3
{
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x263F42570]);
  v4 = [(HMDResidentMesh *)self messageTargetUUID];
  v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (NSString)stateDump
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__152928;
  v11 = __Block_byref_object_dispose__152929;
  id v12 = 0;
  id v3 = [(HMDResidentMesh *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __28__HMDResidentMesh_stateDump__block_invoke;
  v6[3] = &unk_264A2F0A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __28__HMDResidentMesh_stateDump__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _stateDump];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_stateDump
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F089D8] string];
  v51 = self;
  id v4 = [(HMDResidentMesh *)self residents];
  uint64_t v5 = [v4 count];

  if (v5) {
    [v3 appendString:@"mesh:\n"];
  }
  v54 = [(HMDResidentMesh *)v51 resident];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  obuint64_t j = [(HMDResidentMesh *)v51 residents];
  uint64_t v6 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v66 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        v11 = [v10 residentDevice];
        id v12 = [v11 device];

        v13 = [v12 identifier];
        v14 = [v12 name];
        [v3 appendFormat:@"    device: %@ / %@ / ", v13, v14];

        if (v10 == v54)
        {
          v15 = [(HMDResidentMesh *)v51 primaryResidentForHomes];
          if ([v15 count]) {
            v16 = @"primary";
          }
          else {
            v16 = @"local";
          }
          [v3 appendString:v16];
        }
        else
        {
          [v3 appendString:@"remote"];
        }
        v17 = [v12 remoteDestinationString];
        [v3 appendFormat:@" / %@\n", v17];

        objc_msgSend(v3, "appendFormat:", @"     generation: %lu\n", objc_msgSend(v10, "generationCount"));
        int v18 = [v10 enabled];
        v19 = "YES";
        if (!v18) {
          v19 = "NO";
        }
        objc_msgSend(v3, "appendFormat:", @"        enabled: %s\n", v19);
        v20 = [MEMORY[0x263F089D8] string];
        [v20 appendFormat:@"{"];
        v21 = [v10 metrics];
        v63[0] = MEMORY[0x263EF8330];
        v63[1] = 3221225472;
        v63[2] = __29__HMDResidentMesh__stateDump__block_invoke;
        v63[3] = &unk_264A2EB40;
        id v22 = v20;
        id v64 = v22;
        [v21 enumerateKeysAndObjectsUsingBlock:v63];

        if ([v22 hasSuffix:@","]) {
          objc_msgSend(v22, "deleteCharactersInRange:", objc_msgSend(v22, "length") - 1, 1);
        }
        [v22 appendFormat:@" }"];
        [v3 appendFormat:@"      Device metrics: %@ \n", v22];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
    }
    while (v7);
  }

  v23 = [(HMDResidentMesh *)v51 reachableAccessories];
  uint64_t v24 = [v23 count];

  if (v24) {
    [v3 appendString:@"remote primary residents:\n"];
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obja = [(HMDResidentMesh *)v51 reachableAccessories];
  uint64_t v25 = [obja countByEnumeratingWithState:&v59 objects:v70 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v60;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v60 != v27) {
          objc_enumerationMutation(obja);
        }
        v29 = *(void **)(*((void *)&v59 + 1) + 8 * j);
        v30 = [v29 residentDevice];
        v31 = [v30 device];
        v32 = [v31 identifier];
        v33 = [v30 device];
        v34 = [v33 name];
        [v3 appendFormat:@"    resident: %@ / %@ \n", v32, v34];

        v35 = [v29 transmitTimer];
        v36 = "YES";
        if (!v35) {
          v36 = "NO";
        }
        objc_msgSend(v3, "appendFormat:", @"         pending: %s\n", v36);
      }
      uint64_t v26 = [obja countByEnumeratingWithState:&v59 objects:v70 count:16];
    }
    while (v26);
  }

  v37 = [(HMDResidentMesh *)v51 primaryResidentForHomes];
  uint64_t v38 = [v37 count];

  if (v38) {
    [v3 appendString:@"primary resident for:\n"];
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v39 = [(HMDResidentMesh *)v51 primaryResidentForHomes];
  uint64_t v40 = [v39 countByEnumeratingWithState:&v55 objects:v69 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v56;
    do
    {
      for (uint64_t k = 0; k != v41; ++k)
      {
        if (*(void *)v56 != v42) {
          objc_enumerationMutation(v39);
        }
        v44 = [*(id *)(*((void *)&v55 + 1) + 8 * k) UUIDString];
        [v3 appendFormat:@"    %@\n", v44];
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v55 objects:v69 count:16];
    }
    while (v41);
  }

  if (v54)
  {
    v45 = [(HMDResidentMesh *)v51 messageDispatcher];
    v46 = [v45 secureRemoteTransport];
    v47 = [v46 deviceMonitor];
    char v48 = [v47 isReachable];

    if (v48) {
      goto LABEL_45;
    }
    v49 = @"we are about to go unreachable in the near future unless we get network back.";
  }
  else
  {
    v49 = @"we do not have a resident device (either not logged into iCloud or have reachability issues).";
  }
  [v3 appendString:v49];
LABEL_45:

  return v3;
}

uint64_t __29__HMDResidentMesh__stateDump__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@" %@:%@,", a2, a3];
}

- (void)_transmitCurrentDeviceMetricsToPrimaryResidentWithIsUrgent:(BOOL)a3
{
  BOOL v29 = a3;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = [(HMDResidentMesh *)self workQueue];
  dispatch_assert_queue_V2(v4);

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v5 = [(HMDResidentMesh *)self homeManager];
  uint64_t v6 = [v5 homes];

  obuint64_t j = v6;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v32;
    *(void *)&long long v8 = 138543362;
    long long v28 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if (objc_msgSend(v12, "isCurrentDeviceAvailableResident", v28))
        {
          v13 = [v12 primaryResident];
          if (v13)
          {
            v14 = [(HMDResidentMesh *)self _addResidentStorageResidentDevice:v13];
            v15 = [v14 metrics];
            v16 = [(HMDResidentMesh *)self loadMetrics];
            [v15 addEntriesFromDictionary:v16];

            if (([v13 isCurrentDevice] & 1) == 0)
            {
              v17 = (void *)MEMORY[0x230FBD990]();
              int v18 = self;
              v19 = HMFGetOSLogHandle();
              BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
              if (v29)
              {
                if (v20)
                {
                  v21 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = v28;
                  v36 = v21;
                  _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Immediately transmitting updated metrics", buf, 0xCu);
                }
                [v14 _transmitStatus:0];
              }
              else
              {
                if (v20)
                {
                  uint64_t v27 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = v28;
                  v36 = v27;
                  _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Scheduling transmission of updated metrics", buf, 0xCu);
                }
                [v14 _transmitAfter:10.0];
              }
            }
          }
          else
          {
            id v22 = (void *)MEMORY[0x230FBD990]();
            v23 = self;
            uint64_t v24 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              uint64_t v25 = HMFGetLogIdentifier();
              uint64_t v26 = [v12 uuid];
              *(_DWORD *)buf = 138543618;
              v36 = v25;
              __int16 v37 = 2114;
              uint64_t v38 = v26;
              _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Could not set metric for current device for home %{public}@: no primary resident", buf, 0x16u);
            }
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v9);
  }
}

- (void)setMetricForCurrentDevice:(id)a3 withValue:(id)a4 isUrgent:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(HMDResidentMesh *)self workQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __64__HMDResidentMesh_setMetricForCurrentDevice_withValue_isUrgent___block_invoke;
  v13[3] = &unk_264A2B1D8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  BOOL v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __64__HMDResidentMesh_setMetricForCurrentDevice_withValue_isUrgent___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    int v13 = 138543874;
    id v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Setting local metric with key: %@, value: %@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = [*(id *)(a1 + 32) loadMetrics];
  [v9 setObject:v8 forKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v10 = [*(id *)(a1 + 32) loadMetrics];
  id v11 = [*(id *)(a1 + 32) resident];
  [v11 setMetrics:v10];

  return [*(id *)(a1 + 32) _transmitCurrentDeviceMetricsToPrimaryResidentWithIsUrgent:*(unsigned __int8 *)(a1 + 56)];
}

- (id)cameraRecordingAnalysisNodesForCameraAccessory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  uint64_t v6 = [(HMDResidentMesh *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__HMDResidentMesh_cameraRecordingAnalysisNodesForCameraAccessory___block_invoke;
  block[3] = &unk_264A2F2F8;
  block[4] = self;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  dispatch_sync(v6, block);

  id v9 = v14;
  id v10 = v7;

  return v10;
}

void __66__HMDResidentMesh_cameraRecordingAnalysisNodesForCameraAccessory___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) residents];
  id v3 = (void *)[v2 mutableCopy];

  id v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = [*(id *)(a1 + 40) home];
  uint64_t v6 = [v5 residentDeviceManager];
  id v7 = [v6 availableResidentDevices];
  id v8 = [v4 setWithArray:v7];

  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __66__HMDResidentMesh_cameraRecordingAnalysisNodesForCameraAccessory___block_invoke_2;
  v26[3] = &unk_264A22008;
  id v21 = v8;
  id v27 = v21;
  BOOL v20 = [v3 indexesOfObjectsPassingTest:v26];
  objc_msgSend(v3, "removeObjectsAtIndexes:");
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v3;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v22 + 1) + 8 * v13);
        __int16 v15 = *(void **)(a1 + 48);
        uint64_t v16 = [HMDCameraRecordingAnalysisNode alloc];
        __int16 v17 = [v14 residentDevice];
        uint64_t v18 = [v14 metrics];
        uint64_t v19 = [(HMDCameraRecordingAnalysisNode *)v16 initWithResidentDevice:v17 metrics:v18];
        [v15 addObject:v19];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v11);
  }
}

uint64_t __66__HMDResidentMesh_cameraRecordingAnalysisNodesForCameraAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 residentDevice];
  if ([v4 containsObject:v5])
  {
    uint64_t v6 = [v3 residentDevice];
    id v7 = [v6 capabilities];
    uint64_t v8 = [v7 supportsCameraRecording] ^ 1;
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

- (void)_handleMeshUpdateMessage:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 numberForKey:@"kMeshVersion"];
  if ([v5 unsignedIntegerValue] == 2)
  {
    uint64_t v6 = [v4 uuidForKey:@"kMeshDevice"];
    id v7 = [(HMDResidentMesh *)self _meshStorageForDeviceIdentifier:v6];
    if (v7)
    {
      uint64_t v8 = [v4 numberForKey:@"kMeshDeviceStorageGenerationCount"];
      objc_msgSend(v7, "setGenerationCount:", objc_msgSend(v8, "unsignedIntegerValue"));

      id v9 = [v4 numberForKey:@"kMeshDeviceStorageEnabled"];
      objc_msgSend(v7, "setEnabled:", objc_msgSend(v9, "BOOLValue"));

      uint64_t v10 = [v4 dictionaryForKey:@"kMeshDeviceStorageSystemLoad"];
      [v7 setMetrics:v10];

      uint64_t v11 = NSNumber;
      uint64_t v12 = [(HMDResidentMesh *)self resident];
      uint64_t v13 = objc_msgSend(v11, "numberWithBool:", objc_msgSend(v12, "enabled"));
      uint64_t v26 = v13;
      id v14 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      [v4 respondWithPayload:v14];
    }
    else
    {
      BOOL v20 = (void *)MEMORY[0x230FBD990]();
      id v21 = self;
      long long v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        long long v23 = HMFGetLogIdentifier();
        long long v24 = [v4 shortDescription];
        *(_DWORD *)buf = 138543874;
        long long v28 = v23;
        __int16 v29 = 2114;
        v30 = v24;
        __int16 v31 = 2114;
        uint64_t v32 = (uint64_t)v6;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Rejecting message %{public}@ from unknown device: %{public}@", buf, 0x20u);
      }
      uint64_t v12 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      [v4 respondWithError:v12];
    }
  }
  else
  {
    __int16 v15 = (void *)MEMORY[0x230FBD990]();
    uint64_t v16 = self;
    __int16 v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      uint64_t v19 = [v4 shortDescription];
      *(_DWORD *)buf = 138544130;
      long long v28 = v18;
      __int16 v29 = 2112;
      v30 = v5;
      __int16 v31 = 2048;
      uint64_t v32 = 2;
      __int16 v33 = 2114;
      long long v34 = v19;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Rejecting message with version %@ lower than current version %ld: %{public}@", buf, 0x2Au);
    }
    uint64_t v6 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    [v4 respondWithError:v6];
  }
}

- (void)_handleMeshUpdateRequestMessage:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 numberForKey:@"kMeshVersion"];
  if ([v5 unsignedIntegerValue] == 2)
  {
    uint64_t v6 = [v4 uuidForKey:@"kMeshDevice"];
    id v7 = [(HMDResidentMesh *)self _meshStorageForDeviceIdentifier:v6];
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    uint64_t v11 = v10;
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        uint64_t v13 = [v4 shortDescription];
        *(_DWORD *)buf = 138543618;
        long long v28 = v12;
        __int16 v29 = 2112;
        v30 = v13;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Responding to mesh update request message: %@", buf, 0x16u);
      }
      id v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "enabled", @"kMeshDeviceStorageEnabled"));
      v26[0] = v14;
      v25[1] = @"kMeshDeviceStorageGenerationCount";
      __int16 v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "generationCount"));
      v26[1] = v15;
      v25[2] = @"kMeshDeviceStorageSystemLoad";
      uint64_t v16 = [v7 metrics];
      v26[2] = v16;
      __int16 v17 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];
      [v4 respondWithPayload:v17];
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        long long v23 = HMFGetLogIdentifier();
        long long v24 = [v4 shortDescription];
        *(_DWORD *)buf = 138543874;
        long long v28 = v23;
        __int16 v29 = 2114;
        v30 = v24;
        __int16 v31 = 2114;
        uint64_t v32 = (uint64_t)v6;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Rejecting message %{public}@ from unknown device: %{public}@", buf, 0x20u);
      }
      id v14 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      [v4 respondWithError:v14];
    }
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x230FBD990]();
    uint64_t v19 = self;
    BOOL v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      long long v22 = [v4 shortDescription];
      *(_DWORD *)buf = 138544130;
      long long v28 = v21;
      __int16 v29 = 2112;
      v30 = v5;
      __int16 v31 = 2048;
      uint64_t v32 = 2;
      __int16 v33 = 2114;
      long long v34 = v22;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Rejecting message with version %@ lower than current version %ld: %{public}@", buf, 0x2Au);
    }
    uint64_t v6 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    [v4 respondWithError:v6];
  }
}

- (void)_sendMessage:(id)a3 payload:(id)a4 target:(id)a5 force:(BOOL)a6 responseHandler:(id)a7
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v61 = a3;
  id v60 = a4;
  id v59 = a5;
  id v58 = a7;
  uint64_t v11 = [(HMDResidentMesh *)self workQueue];
  dispatch_assert_queue_V2(v11);

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  uint64_t v12 = [(HMDResidentMesh *)self homeManager];
  uint64_t v13 = [v12 homes];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v66 objects:v77 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    char v16 = 0;
    uint64_t v17 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v67 != v17) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        BOOL v20 = [v19 residentDeviceManager];
        id v21 = [v20 availableResidentDevices];

        uint64_t v22 = [v21 countByEnumeratingWithState:&v62 objects:v76 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v63;
          while (2)
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v63 != v24) {
                objc_enumerationMutation(v21);
              }
              if ([*(id *)(*((void *)&v62 + 1) + 8 * j) isCurrentDevice])
              {
                char v16 = 1;
                goto LABEL_16;
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v62 objects:v76 count:16];
            if (v23) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v66 objects:v77 count:16];
    }
    while (v15);
  }
  else
  {
    char v16 = 0;
  }

  uint64_t v26 = [(HMDResidentMesh *)self resident];
  id v27 = v26;
  if ((v16 & 1) == 0 && !a6)
  {
    long long v28 = (void *)MEMORY[0x230FBD990]();
    __int16 v29 = self;
    v30 = HMFGetOSLogHandle();
    __int16 v31 = v61;
    __int16 v33 = v58;
    uint64_t v32 = v59;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      long long v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v71 = v34;
      __int16 v72 = 2112;
      id v73 = v61;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Suppressing message %@ because we are not a resident device.", buf, 0x16u);
    }
    uint64_t v35 = v60;
    goto LABEL_36;
  }
  __int16 v31 = v61;
  __int16 v33 = v58;
  uint64_t v32 = v59;
  if (!v59)
  {
    uint64_t v38 = (void *)MEMORY[0x230FBD990]();
    v39 = self;
    uint64_t v40 = HMFGetOSLogHandle();
    uint64_t v35 = v60;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v41 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v71 = v41;
      __int16 v72 = 2112;
      id v73 = v61;
      uint64_t v42 = "%{public}@Suppressing message %@ because target is nil.";
      goto LABEL_34;
    }
LABEL_35:

    goto LABEL_36;
  }
  uint64_t v35 = v60;
  if (!v26)
  {
    uint64_t v38 = (void *)MEMORY[0x230FBD990]();
    v39 = self;
    uint64_t v40 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v41 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v71 = v41;
      __int16 v72 = 2112;
      id v73 = v61;
      uint64_t v42 = "%{public}@Suppressing message %@ because self.resident is nil.";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  v36 = [v26 residentDevice];
  int v37 = [v36 isEqual:v59];

  if (v37)
  {
    uint64_t v38 = (void *)MEMORY[0x230FBD990]();
    v39 = self;
    uint64_t v40 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v41 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v71 = v41;
      __int16 v72 = 2112;
      id v73 = v61;
      uint64_t v42 = "%{public}@Suppressing message %@ because we are the target.";
LABEL_34:
      _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_DEFAULT, v42, buf, 0x16u);

      goto LABEL_35;
    }
    goto LABEL_35;
  }
  long long v57 = +[HMDRemoteMessage messageWithName:v61 messagePayload:v60];
  long long v55 = [(HMDResidentMesh *)self messageTargetUUID];
  v43 = [v59 device];
  v44 = [v43 remoteDestinationString];

  v45 = (void *)MEMORY[0x230FBD990]();
  v46 = self;
  v47 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v53 = v44;
    char v48 = v54 = v45;
    v49 = [v57 shortDescription];
    v50 = [v57 messagePayload];
    *(_DWORD *)buf = 138543874;
    v71 = v48;
    __int16 v72 = 2114;
    id v73 = v49;
    __int16 v74 = 2112;
    v75 = v50;
    _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_INFO, "%{public}@Sending message %{public}@ with payload: %@", buf, 0x20u);

    v45 = v54;
    v44 = v53;
  }

  v51 = [(HMDResidentMesh *)v46 messageDispatcher];
  v52 = [(HMDResidentMesh *)v46 workQueue];
  [v51 sendSecureMessage:v57 target:v55 userID:v44 destination:v44 responseQueue:v52 responseHandler:v58];

LABEL_36:
}

- (id)_addResidentStorageResidentDevice:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDResidentMesh *)self _residentStorageForResidentDevice:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = [v4 device];
      uint64_t v13 = [v12 shortDescription];
      int v16 = 138543618;
      uint64_t v17 = v11;
      __int16 v18 = 2114;
      uint64_t v19 = v13;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding resident device to residents list: %{public}@", (uint8_t *)&v16, 0x16u);
    }
    id v7 = [[HMDResidentMeshResidentStorage alloc] initWithResidentDevice:v4 owner:v9];
    uint64_t v14 = [(HMDResidentMesh *)v9 reachableAccessories];
    [v14 addObject:v7];
  }
  return v7;
}

- (id)_residentStorageForResidentDevice:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(HMDResidentMesh *)self reachableAccessories];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 residentDevice];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_addMeshStorageResidentDevice:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDResidentMesh *)self _meshStorageForResidentDevice:v4];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = v5;
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      char v11 = HMFGetLogIdentifier();
      uint64_t v12 = [v4 device];
      long long v13 = [v12 shortDescription];
      int v16 = 138543618;
      uint64_t v17 = v11;
      __int16 v18 = 2114;
      uint64_t v19 = v13;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding resident device to mesh: %{public}@", (uint8_t *)&v16, 0x16u);
    }
    uint64_t v7 = [[HMDResidentMeshMeshStorage alloc] initWithResidentDevice:v4 owner:v9];
    long long v14 = [(HMDResidentMesh *)v9 residents];
    [v14 addObject:v7];
  }
  return v7;
}

- (id)_meshStorageForDeviceIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [(HMDResidentMesh *)self residents];
  id v6 = (id)[v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = [v9 residentDevice];
        char v11 = [v10 device];
        uint64_t v12 = [v11 identifier];
        char v13 = [v12 isEqual:v4];

        if (v13)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_meshStorageForResidentDevice:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(HMDResidentMesh *)self residents];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 residentDevice];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_buildResidentsWithElection:(id)a3 device:(id)a4
{
  uint64_t v160 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDResidentMesh *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [MEMORY[0x263EFF9C0] set];
  uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
  char v11 = [(HMDResidentMesh *)self homeManager];
  uint64_t v12 = [v11 homes];

  v146[0] = MEMORY[0x263EF8330];
  v146[1] = 3221225472;
  v146[2] = __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke;
  v146[3] = &unk_264A21F90;
  id v13 = v9;
  id v147 = v13;
  id v14 = v10;
  id v148 = v14;
  objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v146);
  v143[0] = MEMORY[0x263EF8330];
  v143[1] = 3221225472;
  v143[2] = __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke_2;
  v143[3] = &unk_264A21F90;
  id v15 = v13;
  id v144 = v15;
  v145 = self;
  v100 = v12;
  objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v143);
  long long v16 = [MEMORY[0x263EFF9C0] set];
  v139[0] = MEMORY[0x263EF8330];
  v139[1] = 3221225472;
  v139[2] = __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke_199;
  v139[3] = &unk_264A21FB8;
  id v99 = v14;
  id v140 = v99;
  id v17 = v16;
  id v141 = v17;
  v142 = self;
  objc_msgSend(v15, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v139);
  uint64_t v18 = [MEMORY[0x263EFF9C0] set];
  v133[0] = MEMORY[0x263EF8330];
  v133[1] = 3221225472;
  v133[2] = __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke_205;
  v133[3] = &unk_264A21FE0;
  id v101 = v6;
  id v134 = v101;
  id v97 = v7;
  id v135 = v97;
  v136 = self;
  id v108 = v15;
  id v137 = v108;
  id v19 = v18;
  id v138 = v19;
  v98 = v17;
  objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v133);
  uint64_t v20 = [(HMDResidentMesh *)self resident];
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  id v21 = [(HMDResidentMesh *)self residents];
  uint64_t v22 = (void *)[v21 copy];

  v109 = self;
  obuint64_t j = [v22 countByEnumeratingWithState:&v129 objects:v159 count:16];
  v103 = v19;
  if (obj)
  {
    uint64_t v23 = *(void *)v130;
    uint64_t v104 = *(void *)v130;
    do
    {
      for (uint64_t i = 0; i != obj; ++i)
      {
        if (*(void *)v130 != v23) {
          objc_enumerationMutation(v22);
        }
        uint64_t v25 = *(void **)(*((void *)&v129 + 1) + 8 * i);
        uint64_t v26 = [v25 residentDevice];
        int v27 = [v26 isCurrentDevice];

        if (v27)
        {
          if (([v25 isEqual:v20] & 1) == 0)
          {
            long long v28 = v22;
            __int16 v29 = (void *)MEMORY[0x230FBD990]();
            v30 = self;
            __int16 v31 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              uint64_t v32 = v106 = v20;
              __int16 v33 = [v25 residentDevice];
              long long v34 = [v33 device];
              uint64_t v35 = [v34 shortDescription];
              *(_DWORD *)buf = 138543618;
              v152 = v32;
              __int16 v153 = 2114;
              v154 = v35;
              _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Setting resident device to %{public}@", buf, 0x16u);

              id v19 = v103;
              self = v109;

              uint64_t v20 = v106;
            }

            uint64_t v22 = v28;
            uint64_t v23 = v104;
          }
          id v36 = v25;

          int v37 = [(HMDResidentMesh *)self loadMetrics];
          [v36 setMetrics:v37];

          [(HMDResidentMesh *)self setResident:v36];
          uint64_t v20 = v36;
        }
        uint64_t v38 = [v25 residentDevice];
        char v39 = [v19 containsObject:v38];

        if ((v39 & 1) == 0)
        {
          uint64_t v40 = [(HMDResidentMesh *)self residents];
          [v40 removeObject:v25];
        }
      }
      obuint64_t j = [v22 countByEnumeratingWithState:&v129 objects:v159 count:16];
    }
    while (obj);
  }
  v107 = v20;

  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  uint64_t v41 = [(HMDResidentMesh *)self reachableAccessories];
  uint64_t v42 = (void *)[v41 copy];

  uint64_t v43 = [v42 countByEnumeratingWithState:&v125 objects:v158 count:16];
  v44 = v108;
  if (v43)
  {
    uint64_t v45 = v43;
    uint64_t v46 = *(void *)v126;
    do
    {
      for (uint64_t j = 0; j != v45; ++j)
      {
        if (*(void *)v126 != v46) {
          objc_enumerationMutation(v42);
        }
        char v48 = *(void **)(*((void *)&v125 + 1) + 8 * j);
        v49 = [v48 residentDevice];
        char v50 = [v19 containsObject:v49];

        if ((v50 & 1) == 0)
        {
          v51 = [(HMDResidentMesh *)self reachableAccessories];
          [v51 removeObject:v48];
        }
      }
      uint64_t v45 = [v42 countByEnumeratingWithState:&v125 objects:v158 count:16];
    }
    while (v45);
  }

  if ([v101 isEqual:@"HMDResidentDeviceManagerAddResidentNotification"]) {
    int v102 = 1;
  }
  else {
    int v102 = [v101 isEqual:@"HMDResidentDeviceManagerUpdateResidentNotification"];
  }
  v52 = [(HMDResidentMesh *)self primaryResidentForHomes];
  int v53 = [v108 isSubsetOfSet:v52];

  if (!v53 || v102)
  {
    v54 = (void *)MEMORY[0x230FBD990]();
    long long v55 = self;
    long long v56 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      long long v57 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v152 = v57;
      _os_log_impl(&dword_22F52A000, v56, OS_LOG_TYPE_INFO, "%{public}@Our primary residents list has new items (or some shift in devices happened):", buf, 0xCu);
    }
    long long v123 = 0u;
    long long v124 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    id obja = v108;
    uint64_t v58 = [obja countByEnumeratingWithState:&v121 objects:v157 count:16];
    if (v58)
    {
      uint64_t v59 = v58;
      uint64_t v60 = *(void *)v122;
      do
      {
        uint64_t v61 = 0;
        uint64_t v105 = v59;
        do
        {
          if (*(void *)v122 != v60) {
            objc_enumerationMutation(obja);
          }
          long long v62 = *(void **)(*((void *)&v121 + 1) + 8 * v61);
          long long v63 = (void *)MEMORY[0x230FBD990]();
          long long v64 = v55;
          long long v65 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
          {
            long long v66 = HMFGetLogIdentifier();
            [v62 UUIDString];
            v68 = long long v67 = v55;
            long long v69 = [(HMDResidentMesh *)v64 primaryResidentForHomes];
            int v70 = [v69 containsObject:v62];
            *(_DWORD *)buf = 138543874;
            v71 = " (added)";
            if (v70) {
              v71 = "";
            }
            v152 = v66;
            __int16 v153 = 2114;
            v154 = v68;
            __int16 v155 = 2080;
            v156 = v71;
            _os_log_impl(&dword_22F52A000, v65, OS_LOG_TYPE_INFO, "%{public}@  Home: %{public}@%s", buf, 0x20u);

            long long v55 = v67;
            uint64_t v59 = v105;

            self = v109;
          }

          ++v61;
        }
        while (v59 != v61);
        uint64_t v59 = [obja countByEnumeratingWithState:&v121 objects:v157 count:16];
      }
      while (v59);
    }

    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    objb = [(HMDResidentMesh *)v55 residents];
    uint64_t v72 = [objb countByEnumeratingWithState:&v117 objects:v150 count:16];
    id v73 = v107;
    v44 = v108;
    if (v72)
    {
      uint64_t v74 = v72;
      uint64_t v75 = *(void *)v118;
      do
      {
        for (uint64_t k = 0; k != v74; ++k)
        {
          if (*(void *)v118 != v75) {
            objc_enumerationMutation(objb);
          }
          v77 = *(void **)(*((void *)&v117 + 1) + 8 * k);
          if (v73 != v77 && [*(id *)(*((void *)&v117 + 1) + 8 * k) enabled])
          {
            uint64_t v78 = [(HMDResidentMesh *)v55 updatedOrAddedDevices];
            v79 = [v77 residentDevice];
            v80 = [v79 device];
            v81 = v55;
            int v82 = [v78 containsObject:v80];

            if (v82)
            {
              v83 = [(HMDResidentMesh *)v81 updatedOrAddedDevices];
              v84 = [v77 residentDevice];
              v85 = [v84 device];
              [v83 removeObject:v85];

              self = v109;
              id v73 = v107;
              long long v55 = v81;
            }
            else
            {
              self = v109;
              id v73 = v107;
              long long v55 = v81;
              if (v102) {
                continue;
              }
            }
            [v77 _requestStatus];
          }
        }
        uint64_t v74 = [objb countByEnumeratingWithState:&v117 objects:v150 count:16];
      }
      while (v74);
    }
  }
  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  v86 = [(HMDResidentMesh *)self primaryResidentForHomes];
  uint64_t v87 = [v86 countByEnumeratingWithState:&v113 objects:v149 count:16];
  if (v87)
  {
    uint64_t v88 = v87;
    uint64_t v89 = *(void *)v114;
    do
    {
      for (uint64_t m = 0; m != v88; ++m)
      {
        if (*(void *)v114 != v89) {
          objc_enumerationMutation(v86);
        }
        v91 = *(void **)(*((void *)&v113 + 1) + 8 * m);
        if (([v44 containsObject:v91] & 1) == 0)
        {
          v92 = (void *)MEMORY[0x230FBD990]();
          v93 = self;
          v94 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
          {
            v95 = HMFGetLogIdentifier();
            v96 = [v91 UUIDString];
            *(_DWORD *)buf = 138543618;
            v152 = v95;
            __int16 v153 = 2114;
            v154 = v96;
            _os_log_impl(&dword_22F52A000, v94, OS_LOG_TYPE_INFO, "%{public}@  Home: %{public}@ (removed)", buf, 0x16u);

            self = v109;
          }

          v44 = v108;
        }
      }
      uint64_t v88 = [v86 countByEnumeratingWithState:&v113 objects:v149 count:16];
    }
    while (v88);
  }

  [(HMDResidentMesh *)self setPrimaryResidentForHomes:v44];
}

void __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [v3 enabledResidents];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "isCurrentDevice", (void)v13))
        {
          id v9 = *(void **)(a1 + 32);
          uint64_t v10 = [v3 uuid];
          [v9 addObject:v10];

          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  char v11 = *(void **)(a1 + 40);
  uint64_t v12 = [v3 uuid];
  [v11 setObject:v4 forKeyedSubscript:v12];
}

void __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 uuid];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4)
  {
    uint64_t v6 = [v3 primaryResident];
    if (v6)
    {
      id v7 = (id)[*(id *)(a1 + 40) _addResidentStorageResidentDevice:v6];
    }
    else
    {
      uint64_t v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = *(id *)(a1 + 40);
      uint64_t v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        char v11 = HMFGetLogIdentifier();
        uint64_t v12 = [v3 uuid];
        int v13 = 138543618;
        long long v14 = v11;
        __int16 v15 = 2114;
        long long v16 = v12;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Could not create resident storage for home %{public}@: no primary resident", (uint8_t *)&v13, 0x16u);
      }
    }
  }
}

void __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke_199(id *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [a1[4] objectForKeyedSubscript:v3];
  uint64_t v5 = (void *)MEMORY[0x230FBD990]([a1[5] addObjectsFromArray:v4]);
  id v6 = a1[6];
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    id v9 = objc_msgSend(v4, "na_map:", &__block_literal_global_203);
    int v10 = 138543874;
    char v11 = v8;
    __int16 v12 = 2114;
    id v13 = v3;
    __int16 v14 = 2114;
    __int16 v15 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Home %{public}@ may use devices: %{public}@", (uint8_t *)&v10, 0x20u);
  }
}

void __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke_205(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([*(id *)(a1 + 32) isEqual:@"HMDResidentDeviceManagerRemoveResidentNotification"])
  {
    id v4 = [v3 device];
    int v5 = [v4 isEqual:*(void *)(a1 + 40)];

    if (v5)
    {
      id v6 = (void *)MEMORY[0x230FBD990]();
      id v7 = *(id *)(a1 + 48);
      uint64_t v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = HMFGetLogIdentifier();
        int v10 = [v3 device];
        char v11 = [v10 shortDescription];
        int v20 = 138543618;
        id v21 = v9;
        __int16 v22 = 2114;
        uint64_t v23 = v11;
        __int16 v12 = "%{public}@Received a remove resident notification for device %{public}@";
LABEL_12:
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v20, 0x16u);

        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  if (![v3 isCurrentDevice])
  {
    id v13 = [*(id *)(a1 + 48) messageDispatcher];
    __int16 v14 = [v13 secureRemoteTransport];
    __int16 v15 = [v14 deviceMonitor];
    uint64_t v16 = [v15 unreachableDevices];
    uint64_t v17 = [v3 device];
    int v18 = [v16 containsObject:v17];

    if (v18)
    {
      id v6 = (void *)MEMORY[0x230FBD990]();
      id v7 = *(id *)(a1 + 48);
      uint64_t v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = HMFGetLogIdentifier();
        int v10 = [v3 device];
        char v11 = [v10 shortDescription];
        int v20 = 138543618;
        id v21 = v9;
        __int16 v22 = 2114;
        uint64_t v23 = v11;
        __int16 v12 = "%{public}@Not adding unreachable device: %{public}@";
        goto LABEL_12;
      }
      goto LABEL_13;
    }
LABEL_14:
    [*(id *)(a1 + 64) addObject:v3];
    id v19 = (id)[*(id *)(a1 + 48) _addMeshStorageResidentDevice:v3];
    goto LABEL_15;
  }
  if ([*(id *)(a1 + 56) count]) {
    goto LABEL_14;
  }
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v10 = [v3 device];
    char v11 = [v10 shortDescription];
    int v20 = 138543618;
    id v21 = v9;
    __int16 v22 = 2114;
    uint64_t v23 = v11;
    __int16 v12 = "%{public}@Not adding the current device because it isn't a part of any homes: %{public}@";
    goto LABEL_12;
  }
LABEL_13:

LABEL_15:
}

uint64_t __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke_2_200(uint64_t a1, void *a2)
{
  return [a2 shortDescription];
}

- (void)_deviceIsNotReachable:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isCurrentDevice])
  {
    int v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v57 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Our device lost visibility to the rest of the world. Setting timeout before pulling the plug.", buf, 0xCu);
    }
    dispatch_time_t v9 = dispatch_time(0, 10000000000);
    int v10 = [(HMDResidentMesh *)v6 workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__HMDResidentMesh__deviceIsNotReachable___block_invoke;
    block[3] = &unk_264A2F7F8;
    block[4] = v6;
    dispatch_after(v9, v10, block);
  }
  else
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    char v11 = [(HMDResidentMesh *)self reachableAccessories];
    __int16 v12 = (void *)[v11 copy];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v50 objects:v60 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v51;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v51 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          int v18 = [v17 residentDevice];
          id v19 = [v18 device];
          int v20 = [v4 isEqual:v19];

          if (v20)
          {
            id v21 = (void *)MEMORY[0x230FBD990]();
            __int16 v22 = self;
            uint64_t v23 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              uint64_t v24 = HMFGetLogIdentifier();
              uint64_t v25 = [v4 shortDescription];
              *(_DWORD *)buf = 138543618;
              long long v57 = v24;
              __int16 v58 = 2114;
              uint64_t v59 = v25;
              _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Removed device %{public}@ from resident storage", buf, 0x16u);
            }
            uint64_t v26 = [(HMDResidentMesh *)v22 reachableAccessories];
            [v26 removeObject:v17];

            goto LABEL_17;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v50 objects:v60 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_17:

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    int v27 = [(HMDResidentMesh *)self residents];
    long long v28 = (void *)[v27 copy];

    uint64_t v29 = [v28 countByEnumeratingWithState:&v46 objects:v55 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v47;
      while (2)
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v47 != v31) {
            objc_enumerationMutation(v28);
          }
          __int16 v33 = *(void **)(*((void *)&v46 + 1) + 8 * j);
          long long v34 = [v33 residentDevice];
          uint64_t v35 = [v34 device];
          int v36 = [v4 isEqual:v35];

          if (v36)
          {
            int v37 = (void *)MEMORY[0x230FBD990]();
            uint64_t v38 = self;
            char v39 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              uint64_t v40 = HMFGetLogIdentifier();
              uint64_t v41 = [v4 shortDescription];
              *(_DWORD *)buf = 138543618;
              long long v57 = v40;
              __int16 v58 = 2114;
              uint64_t v59 = v41;
              _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_INFO, "%{public}@Removed device %{public}@ from mesh storage", buf, 0x16u);
            }
            uint64_t v42 = [(HMDResidentMesh *)v38 residents];
            [v42 removeObject:v33];

            uint64_t v43 = [(HMDResidentMesh *)v38 updatedOrAddedDevices];
            v44 = [v33 residentDevice];
            uint64_t v45 = [v44 device];
            [v43 removeObject:v45];

            goto LABEL_29;
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v46 objects:v55 count:16];
        if (v30) {
          continue;
        }
        break;
      }
    }
LABEL_29:
  }
}

void __41__HMDResidentMesh__deviceIsNotReachable___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) messageDispatcher];
  id v3 = [v2 secureRemoteTransport];
  id v4 = [v3 deviceMonitor];
  char v5 = [v4 isReachable];

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = HMFGetOSLogHandle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      int v10 = HMFGetLogIdentifier();
      int v15 = 138543362;
      uint64_t v16 = v10;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Nope, we came back.", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    if (v9)
    {
      char v11 = HMFGetLogIdentifier();
      int v15 = 138543362;
      uint64_t v16 = v11;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Lost visibility to the rest of the world. Deconstructing the mesh entirely.", (uint8_t *)&v15, 0xCu);
    }
    [*(id *)(a1 + 32) setResident:0];
    __int16 v12 = [*(id *)(a1 + 32) residents];
    [v12 removeAllObjects];

    uint64_t v13 = [*(id *)(a1 + 32) reachableAccessories];
    [v13 removeAllObjects];

    uint64_t v14 = [MEMORY[0x263EFFA08] set];
    [*(id *)(a1 + 32) setPrimaryResidentForHomes:v14];
  }
}

- (void)_handleAddUpdateOrReachabilityChangeForDevice:(id)a3
{
  id v6 = a3;
  if (([v6 isCurrentDevice] & 1) == 0)
  {
    id v4 = [(HMDResidentMesh *)self updatedOrAddedDevices];
    [v4 addObject:v6];
  }
  char v5 = [(HMDResidentMesh *)self devicesChangedTimer];
  [v5 resume];
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  char v5 = [(HMDResidentMesh *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDResidentMesh *)self devicesChangedTimer];

  if (v6 == v4)
  {
    [(HMDResidentMesh *)self _buildResidentsWithElection:@"HMDResidentDeviceManagerAddResidentNotification" device:0];
  }
}

- (void)_handlePrimaryResidentChangedNotification:(id)a3
{
  id v4 = [(HMDResidentMesh *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__HMDResidentMesh__handlePrimaryResidentChangedNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __61__HMDResidentMesh__handlePrimaryResidentChangedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _transmitCurrentDeviceMetricsToPrimaryResidentWithIsUrgent:1];
}

- (void)__deviceResidentChanged:(id)a3
{
  id v4 = a3;
  char v5 = [(HMDResidentMesh *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__HMDResidentMesh___deviceResidentChanged___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __43__HMDResidentMesh___deviceResidentChanged___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  char v19 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  LODWORD(v3) = objc_msgSend(v2, "hmf_BOOLForKey:isPresent:", @"kResidentEnabledKey", &v19);

  if (v19) {
    uint64_t v3 = v3;
  }
  else {
    uint64_t v3 = 1;
  }
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 40);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v22 = v7;
    __int16 v23 = 1024;
    int v24 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Received notification that the current resident's enabled status is now %{BOOL}d", buf, 0x12u);
  }
  id v8 = [*(id *)(a1 + 40) resident];
  BOOL v9 = v8;
  if (v8)
  {
    [v8 setEnabled:v3];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    int v10 = objc_msgSend(*(id *)(a1 + 40), "reachableAccessories", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * i) _transmitStatus:1];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v12);
    }
  }
}

- (void)__rebuildResidents:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDResidentMesh *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__HMDResidentMesh___rebuildResidents___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __38__HMDResidentMesh___rebuildResidents___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 valueForKey:@"HMDDeviceNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (!v5)
  {
    id v6 = [*(id *)(a1 + 32) object];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v3 = v7;
  }
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = *(id *)(a1 + 40);
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    uint64_t v12 = [*(id *)(a1 + 32) name];
    uint64_t v13 = [v3 identifier];
    uint64_t v14 = [v13 UUIDString];
    int v15 = 138543874;
    long long v16 = v11;
    __int16 v17 = 2114;
    long long v18 = v12;
    __int16 v19 = 2114;
    int v20 = v14;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Resident device changed (%{public}@ / %{public}@) notification.", (uint8_t *)&v15, 0x20u);
  }
  [*(id *)(a1 + 40) _buildResidentsWithElection:0 device:0];
}

- (void)__residentDeviceAddedOrUpdatedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDResidentMesh *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__HMDResidentMesh___residentDeviceAddedOrUpdatedNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __62__HMDResidentMesh___residentDeviceAddedOrUpdatedNotification___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 valueForKey:@"HMDResidentDeviceManagerResidentDeviceNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = *(id *)(a1 + 40);
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v10 = [*(id *)(a1 + 32) name];
    uint64_t v11 = [v5 identifier];
    uint64_t v12 = [v11 UUIDString];
    int v15 = 138543874;
    long long v16 = v9;
    __int16 v17 = 2114;
    long long v18 = v10;
    __int16 v19 = 2114;
    int v20 = v12;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Resident device changed (%{public}@ / %{public}@) notification.", (uint8_t *)&v15, 0x20u);
  }
  uint64_t v13 = *(void **)(a1 + 40);
  uint64_t v14 = [v5 device];
  [v13 _handleAddUpdateOrReachabilityChangeForDevice:v14];
}

- (void)__residentDeviceRemovedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDResidentMesh *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__HMDResidentMesh___residentDeviceRemovedNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __55__HMDResidentMesh___residentDeviceRemovedNotification___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 valueForKey:@"HMDResidentDeviceManagerResidentDeviceNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = *(id *)(a1 + 40);
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v10 = [*(id *)(a1 + 32) name];
    uint64_t v11 = [v5 device];
    uint64_t v12 = [v11 identifier];
    uint64_t v13 = [v12 UUIDString];
    int v17 = 138543874;
    long long v18 = v9;
    __int16 v19 = 2114;
    int v20 = v10;
    __int16 v21 = 2114;
    __int16 v22 = v13;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Resident device removed (%{public}@ / %{public}@) notification.", (uint8_t *)&v17, 0x20u);
  }
  uint64_t v14 = *(void **)(a1 + 40);
  int v15 = [*(id *)(a1 + 32) name];
  long long v16 = [v5 device];
  [v14 _buildResidentsWithElection:v15 device:v16];
}

- (void)__deviceIsNotReachable:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDResidentMesh *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__HMDResidentMesh___deviceIsNotReachable___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __42__HMDResidentMesh___deviceIsNotReachable___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = *(id *)(a1 + 40);
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [v4 identifier];
    int v10 = [v9 UUIDString];
    int v11 = 138543618;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    uint64_t v14 = v10;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Device %{public}@ is NOT reachable (notification)", (uint8_t *)&v11, 0x16u);
  }
  [*(id *)(a1 + 40) _deviceIsNotReachable:v4];
}

- (void)__deviceIsReachable:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDResidentMesh *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__HMDResidentMesh___deviceIsReachable___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __39__HMDResidentMesh___deviceIsReachable___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = *(id *)(a1 + 40);
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [v4 identifier];
    int v10 = [v9 UUIDString];
    int v11 = 138543618;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    uint64_t v14 = v10;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Device %{public}@ is reachable (notification)", (uint8_t *)&v11, 0x16u);
  }
  [*(id *)(a1 + 40) _handleAddUpdateOrReachabilityChangeForDevice:v4];
}

- (void)dealloc
{
  id v3 = [(HMDResidentMesh *)self messageDispatcher];
  [v3 deregisterReceiver:self];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)HMDResidentMesh;
  [(HMDResidentMesh *)&v5 dealloc];
}

- (HMDResidentMesh)initWithHomeManager:(id)a3 residentEnabled:(BOOL)a4
{
  v50[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v48.receiver = self;
  v48.super_class = (Class)HMDResidentMesh;
  id v7 = [(HMDResidentMesh *)&v48 init];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    residents = v7->_residents;
    v7->_residents = (NSMutableArray *)v8;

    uint64_t v10 = [MEMORY[0x263EFF980] array];
    reachableAccessories = v7->_reachableAccessories;
    v7->_reachableAccessories = (NSMutableArray *)v10;

    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
    loadMetrics = v7->_loadMetrics;
    v7->_loadMetrics = (NSMutableDictionary *)v12;

    uint64_t v14 = [MEMORY[0x263EFF9C0] set];
    updatedOrAddedDevices = v7->_updatedOrAddedDevices;
    v7->_updatedOrAddedDevices = (NSMutableSet *)v14;

    objc_storeWeak((id *)&v7->_homeManager, v6);
    uint64_t v16 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"82455554-35AB-4772-B3A4-DCA0F933F5D3"];
    uuid = v7->_uuid;
    v7->_uuid = (NSUUID *)v16;

    uint64_t v18 = [MEMORY[0x263EFFA08] set];
    primaryResidentForHomes = v7->_primaryResidentForHomes;
    v7->_primaryResidentForHomes = (NSSet *)v18;

    HMDispatchQueueNameString();
    id v20 = objc_claimAutoreleasedReturnValue();
    __int16 v21 = (const char *)[v20 UTF8String];
    __int16 v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v23 = dispatch_queue_create(v21, v22);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v23;

    objc_storeWeak((id *)&v7->_resident, 0);
    uint64_t v25 = [v6 messageDispatcher];
    objc_storeWeak((id *)&v7->_messageDispatcher, v25);
    uint64_t v26 = v7->_workQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__HMDResidentMesh_initWithHomeManager_residentEnabled___block_invoke;
    block[3] = &unk_264A2B870;
    int v27 = v7;
    long long v46 = v27;
    BOOL v47 = a4;
    dispatch_sync(v26, block);
    uint64_t v28 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:1 options:2.0];
    id v29 = v27[8];
    v27[8] = (id)v28;

    [v27[8] setDelegate:v27];
    [v27[8] setDelegateQueue:v7->_workQueue];
    uint64_t v30 = [MEMORY[0x263F08A00] defaultCenter];
    [v30 addObserver:v27 selector:sel___residentDeviceAddedOrUpdatedNotification_ name:@"HMDResidentDeviceManagerAddResidentNotification" object:0];

    uint64_t v31 = [MEMORY[0x263F08A00] defaultCenter];
    [v31 addObserver:v27 selector:sel___residentDeviceAddedOrUpdatedNotification_ name:@"HMDResidentDeviceManagerUpdateResidentNotification" object:0];

    uint64_t v32 = [MEMORY[0x263F08A00] defaultCenter];
    [v32 addObserver:v27 selector:sel___residentDeviceRemovedNotification_ name:@"HMDResidentDeviceManagerRemoveResidentNotification" object:0];

    __int16 v33 = [MEMORY[0x263F08A00] defaultCenter];
    [v33 addObserver:v27 selector:sel___rebuildResidents_ name:@"HMDAccountAddedDeviceNotification" object:0];

    long long v34 = [MEMORY[0x263F08A00] defaultCenter];
    [v34 addObserver:v27 selector:sel___rebuildResidents_ name:@"HMDDeviceUpdatedNotification" object:0];

    uint64_t v35 = [MEMORY[0x263F08A00] defaultCenter];
    [v35 addObserver:v27 selector:sel___rebuildResidents_ name:@"HMDAccountRemovedDeviceNotification" object:0];

    int v36 = [MEMORY[0x263F08A00] defaultCenter];
    [v36 addObserver:v27 selector:sel___deviceResidentChanged_ name:@"HMDHomeManagerResidentEnabledChangedNotification" object:0];

    int v37 = [MEMORY[0x263F08A00] defaultCenter];
    [v37 addObserver:v27 selector:sel__handlePrimaryResidentChangedNotification_ name:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" object:0];

    uint64_t v38 = [MEMORY[0x263F08A00] defaultCenter];
    [v38 addObserver:v27 selector:sel___deviceIsNotReachable_ name:@"HMDRemoteDeviceIsNotReachableNotification" object:0];

    char v39 = [MEMORY[0x263F08A00] defaultCenter];
    [v39 addObserver:v27 selector:sel___deviceIsReachable_ name:@"HMDRemoteDeviceIsReachableNotification" object:0];

    uint64_t v40 = +[HMDRemoteMessagePolicy defaultPolicy];
    [v40 setRequiresAccountMessage:1];
    [v40 setRequiresSecureMessage:1];
    [v40 setTransportRestriction:-1];
    uint64_t v41 = (void *)[v40 copy];
    v50[0] = v41;
    uint64_t v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:1];
    [v25 registerForMessage:@"kDeviceMeshUpdateRequestKey" receiver:v27 policies:v42 selector:sel__handleMeshUpdateRequestMessage_];

    long long v49 = v41;
    uint64_t v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v49 count:1];
    [v25 registerForMessage:@"kDeviceMeshUpdateKey" receiver:v27 policies:v43 selector:sel__handleMeshUpdateMessage_];
  }
  return v7;
}

void __55__HMDResidentMesh_initWithHomeManager_residentEnabled___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _buildResidentsWithElection:0 device:0];
  uint64_t v2 = [*(id *)(a1 + 32) resident];
  id v3 = v2;
  if (v2)
  {
    [v2 setEnabled:*(unsigned __int8 *)(a1 + 40)];
  }
  else
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543362;
      id v9 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@We do not have a current device (probably logged out from iCloud).", (uint8_t *)&v8, 0xCu);
    }
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t63_153066 != -1) {
    dispatch_once(&logCategory__hmf_once_t63_153066, &__block_literal_global_281_153067);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v64_153068;
  return v2;
}

void __30__HMDResidentMesh_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v64_153068;
  logCategory__hmf_once_v64_153068 = v0;
}

@end