@interface HMDResidentMesh
+ (id)logCategory;
- (BOOL)_checkReachabilityWithTimerActivation:(BOOL)a3;
- (HMDHomeManager)homeManager;
- (HMDMessageDispatcher)messageDispatcher;
- (HMDResidentMesh)initWithHomeManager:(id)a3 residentEnabled:(BOOL)a4;
- (HMDResidentMeshMeshStorage)resident;
- (HMFTimer)devicesChangedTimer;
- (HMFTimer)linkQualityMonitorTimer;
- (HMFTimer)startupTimer;
- (NSMutableArray)reachableAccessories;
- (NSMutableArray)residents;
- (NSMutableDictionary)loadMetrics;
- (NSSet)primaryResidentForHomes;
- (NSString)stateDump;
- (NSUUID)uuid;
- (OS_dispatch_queue)workQueue;
- (id)_addMeshStorageResidentDevice:(id)a3;
- (id)_addResidentStorageResidentDevice:(id)a3;
- (id)_meshStorageForDeviceIdentifier:(id)a3;
- (id)_meshStorageForResidentDevice:(id)a3;
- (id)_residentMapForAccessories:(id)a3;
- (id)_residentStorageForResidentDevice:(id)a3;
- (id)_stateDump;
- (id)balancedResidentMapForAccessories:(id)a3;
- (id)bestResidentDeviceForAccessory:(id)a3;
- (id)cameraRecordingAnalysisNodesForCameraAccessory:(id)a3;
- (id)deviceForAccessory:(id)a3 residentOrder:(unint64_t)a4 reachableResidents:(unint64_t *)a5;
- (id)messageDestination;
- (int64_t)startupTickCount;
- (void)__accessoryDidUpdateSuspendedState:(id)a3;
- (void)__accessoryIsNotReachable:(id)a3;
- (void)__accessoryIsReachable:(id)a3;
- (void)__deviceIsNotReachable:(id)a3;
- (void)__deviceIsReachable:(id)a3;
- (void)__deviceResidentChanged:(id)a3;
- (void)__rebuildResidents:(id)a3;
- (void)__residentDeviceAddedOrUpdatedNotification:(id)a3;
- (void)__residentDeviceRemovedNotification:(id)a3;
- (void)_addConnectivityFromDeviceToAccessory:(id)a3 activateTimer:(BOOL)a4;
- (void)_buildResidentsWithElection:(id)a3 device:(id)a4;
- (void)_deviceIsNotReachable:(id)a3;
- (void)_handleAddUpdateOrReachabilityChangeForDevice:(id)a3;
- (void)_handleMeshUpdateMessage:(id)a3;
- (void)_handleMeshUpdateRequestMessage:(id)a3;
- (void)_handlePrimaryResidentChangedNotification:(id)a3;
- (void)_removeConnectivityFromDeviceToAccessory:(id)a3 activateTimer:(BOOL)a4;
- (void)_sendMessage:(id)a3 payload:(id)a4 target:(id)a5 force:(BOOL)a6 responseHandler:(id)a7;
- (void)_transmitCurrentDeviceMetricsToPrimaryResidentWithIsUrgent:(BOOL)a3;
- (void)_updateAccessoryLinkQuality;
- (void)dealloc;
- (void)setHomeManager:(id)a3;
- (void)setMessageDispatcher:(id)a3;
- (void)setMetricForCurrentDevice:(id)a3 withValue:(id)a4 isUrgent:(BOOL)a5;
- (void)setPrimaryResidentForHomes:(id)a3;
- (void)setReachableAccessories:(id)a3;
- (void)setResident:(id)a3;
- (void)setResidents:(id)a3;
- (void)setStartupTickCount:(int64_t)a3;
- (void)setWorkQueue:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDResidentMesh

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkQualityMonitorTimer, 0);
  objc_storeStrong((id *)&self->_startupTimer, 0);
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

- (HMFTimer)linkQualityMonitorTimer
{
  return self->_linkQualityMonitorTimer;
}

- (void)setStartupTickCount:(int64_t)a3
{
  self->_startupTickCount = a3;
}

- (int64_t)startupTickCount
{
  return self->_startupTickCount;
}

- (HMFTimer)startupTimer
{
  return self->_startupTimer;
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
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  v4 = [(HMDResidentMesh *)self messageTargetUUID];
  v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (NSString)stateDump
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__105206;
  v11 = __Block_byref_object_dispose__105207;
  id v12 = 0;
  id v3 = [(HMDResidentMesh *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__HMDResidentMesh_stateDump__block_invoke;
  v6[3] = &unk_1E6A18690;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

uint64_t __28__HMDResidentMesh_stateDump__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _stateDump];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)_stateDump
{
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28E78] string];
  v89 = self;
  uint64_t v4 = [(HMDResidentMesh *)self residents];
  uint64_t v5 = [v4 count];

  if (v5) {
    [v3 appendString:@"mesh:\n"];
  }
  v98 = [(HMDResidentMesh *)v89 resident];
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  obuint64_t j = [(HMDResidentMesh *)v89 residents];
  uint64_t v94 = [obj countByEnumeratingWithState:&v127 objects:v137 count:16];
  if (v94)
  {
    id v91 = *(id *)v128;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(id *)v128 != v91) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v127 + 1) + 8 * v6);
        v8 = [v7 residentDevice];
        uint64_t v9 = [v8 device];

        v10 = [v9 identifier];
        v11 = [v9 name];
        [v3 appendFormat:@"    device: %@ / %@ / ", v10, v11];

        uint64_t v99 = v6;
        if (v7 == v98)
        {
          id v12 = [(HMDResidentMesh *)v89 primaryResidentForHomes];
          if ([v12 count]) {
            v13 = @"primary";
          }
          else {
            v13 = @"local";
          }
          [v3 appendString:v13];
        }
        else
        {
          [v3 appendString:@"remote"];
        }
        v96 = v9;
        v14 = [v9 remoteDestinationString];
        [v3 appendFormat:@" / %@\n", v14];

        objc_msgSend(v3, "appendFormat:", @"     generation: %lu\n", objc_msgSend(v7, "generationCount"));
        int v15 = [v7 enabled];
        v16 = "YES";
        if (!v15) {
          v16 = "NO";
        }
        objc_msgSend(v3, "appendFormat:", @"        enabled: %s\n", v16);
        [v3 appendString:@"      can reach:\n"];
        long long v125 = 0u;
        long long v126 = 0u;
        long long v123 = 0u;
        long long v124 = 0u;
        v17 = [v7 accessoryUUIDs];
        uint64_t v18 = [v17 countByEnumeratingWithState:&v123 objects:v136 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v124;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v124 != v20) {
                objc_enumerationMutation(v17);
              }
              v22 = [*(id *)(*((void *)&v123 + 1) + 8 * i) UUIDString];
              [v3 appendFormat:@"           acc uuid: %@\n", v22];
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v123 objects:v136 count:16];
          }
          while (v19);
        }

        v23 = [v7 accessoryListWithLinkQuality];
        v24 = [v23 allKeys];
        v25 = [v24 sortedArrayUsingComparator:&__block_literal_global_279_105219];

        [v3 appendString:@"      HMDResidentMeshMeshStorage Accessories with Link Quality:\n"];
        long long v121 = 0u;
        long long v122 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        id v26 = v25;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v119 objects:v135 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v120;
          do
          {
            for (uint64_t j = 0; j != v28; ++j)
            {
              if (*(void *)v120 != v29) {
                objc_enumerationMutation(v26);
              }
              uint64_t v31 = *(void *)(*((void *)&v119 + 1) + 8 * j);
              v32 = [v7 accessoryListWithLinkQuality];
              v33 = [v32 objectForKey:v31];
              uint64_t v34 = [v33 integerValue];
              v35 = @"*****";
              if ((unint64_t)(v34 - 1) <= 4) {
                v35 = off_1E6A0B8D0[v34 - 1];
              }
              v36 = v35;
              [v3 appendFormat:@"          | Accessory: %@ | LinkQuality : %@ |\n", v31, v36];
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v119 objects:v135 count:16];
          }
          while (v28);
        }

        v37 = [MEMORY[0x1E4F28E78] string];
        [v37 appendFormat:@"{"];
        v38 = [v7 metrics];
        v117[0] = MEMORY[0x1E4F143A8];
        v117[1] = 3221225472;
        v117[2] = __29__HMDResidentMesh__stateDump__block_invoke_2;
        v117[3] = &unk_1E6A19458;
        id v39 = v37;
        id v118 = v39;
        [v38 enumerateKeysAndObjectsUsingBlock:v117];

        if ([v39 hasSuffix:@","]) {
          objc_msgSend(v39, "deleteCharactersInRange:", objc_msgSend(v39, "length") - 1, 1);
        }
        [v39 appendFormat:@" }"];
        [v3 appendFormat:@"      Device metrics: %@ \n", v39];

        uint64_t v6 = v99 + 1;
      }
      while (v99 + 1 != v94);
      uint64_t v94 = [obj countByEnumeratingWithState:&v127 objects:v137 count:16];
    }
    while (v94);
  }

  v40 = [(HMDResidentMesh *)v89 reachableAccessories];
  uint64_t v41 = [v40 count];

  if (v41) {
    [v3 appendString:@"remote primary residents:\n"];
  }
  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  id v92 = [(HMDResidentMesh *)v89 reachableAccessories];
  uint64_t v95 = [v92 countByEnumeratingWithState:&v113 objects:v134 count:16];
  if (v95)
  {
    uint64_t v93 = *(void *)v114;
    do
    {
      uint64_t v42 = 0;
      do
      {
        if (*(void *)v114 != v93) {
          objc_enumerationMutation(v92);
        }
        uint64_t v97 = v42;
        v43 = *(void **)(*((void *)&v113 + 1) + 8 * v42);
        v44 = [v43 residentDevice];
        v45 = [v44 device];
        v46 = [v45 identifier];
        v100 = v44;
        v47 = [v44 device];
        v48 = [v47 name];
        [v3 appendFormat:@"    resident: %@ / %@ \n", v46, v48];

        v49 = [v43 transmitTimer];
        v50 = "YES";
        if (!v49) {
          v50 = "NO";
        }
        objc_msgSend(v3, "appendFormat:", @"         pending: %s\n", v50);

        [v3 appendFormat:@"       can reach:\n"];
        long long v111 = 0u;
        long long v112 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        v51 = [v43 accessoryUUIDs];
        uint64_t v52 = [v51 countByEnumeratingWithState:&v109 objects:v133 count:16];
        if (v52)
        {
          uint64_t v53 = v52;
          uint64_t v54 = *(void *)v110;
          do
          {
            for (uint64_t k = 0; k != v53; ++k)
            {
              if (*(void *)v110 != v54) {
                objc_enumerationMutation(v51);
              }
              uint64_t v56 = *(void *)(*((void *)&v109 + 1) + 8 * k);
              v57 = [v98 residentDevice];
              if ([v100 isEqual:v57])
              {
                [v3 appendFormat:@"            acc uuid: %@%s\n", v56, ""];
              }
              else
              {
                v58 = [v43 lastSentAccessoryUUIDs];
                int v59 = [v58 containsObject:v56];
                v60 = "";
                if (!v59) {
                  v60 = " (new)";
                }
                [v3 appendFormat:@"            acc uuid: %@%s\n", v56, v60];
              }
            }
            uint64_t v53 = [v51 countByEnumeratingWithState:&v109 objects:v133 count:16];
          }
          while (v53);
        }

        v61 = [v43 accessoryListWithLinkQuality];
        v62 = [v61 allKeys];
        v63 = [v62 sortedArrayUsingComparator:&__block_literal_global_319_105233];

        [v3 appendString:@"      HMDResidentMeshResidentStorage Accessories with Link Quality:\n"];
        long long v107 = 0u;
        long long v108 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        id v64 = v63;
        uint64_t v65 = [v64 countByEnumeratingWithState:&v105 objects:v132 count:16];
        if (v65)
        {
          uint64_t v66 = v65;
          uint64_t v67 = *(void *)v106;
          do
          {
            for (uint64_t m = 0; m != v66; ++m)
            {
              if (*(void *)v106 != v67) {
                objc_enumerationMutation(v64);
              }
              uint64_t v69 = *(void *)(*((void *)&v105 + 1) + 8 * m);
              v70 = [v43 accessoryListWithLinkQuality];
              v71 = [v70 objectForKey:v69];
              uint64_t v72 = [v71 integerValue];
              v73 = @"*****";
              if ((unint64_t)(v72 - 1) <= 4) {
                v73 = off_1E6A0B8D0[v72 - 1];
              }
              v74 = v73;
              [v3 appendFormat:@"          | Accessory: %@ | LinkQuality : %@ |\n", v69, v74];
            }
            uint64_t v66 = [v64 countByEnumeratingWithState:&v105 objects:v132 count:16];
          }
          while (v66);
        }

        uint64_t v42 = v97 + 1;
      }
      while (v97 + 1 != v95);
      uint64_t v95 = [v92 countByEnumeratingWithState:&v113 objects:v134 count:16];
    }
    while (v95);
  }

  v75 = [(HMDResidentMesh *)v89 primaryResidentForHomes];
  uint64_t v76 = [v75 count];

  if (v76) {
    [v3 appendString:@"primary resident for:\n"];
  }
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  v77 = [(HMDResidentMesh *)v89 primaryResidentForHomes];
  uint64_t v78 = [v77 countByEnumeratingWithState:&v101 objects:v131 count:16];
  if (v78)
  {
    uint64_t v79 = v78;
    uint64_t v80 = *(void *)v102;
    do
    {
      for (uint64_t n = 0; n != v79; ++n)
      {
        if (*(void *)v102 != v80) {
          objc_enumerationMutation(v77);
        }
        v82 = [*(id *)(*((void *)&v101 + 1) + 8 * n) UUIDString];
        [v3 appendFormat:@"    %@\n", v82];
      }
      uint64_t v79 = [v77 countByEnumeratingWithState:&v101 objects:v131 count:16];
    }
    while (v79);
  }

  if (v98)
  {
    v83 = [(HMDResidentMesh *)v89 messageDispatcher];
    v84 = [v83 secureRemoteTransport];
    v85 = [v84 deviceMonitor];
    char v86 = [v85 isReachable];

    if (v86) {
      goto LABEL_82;
    }
    v87 = @"we are about to go unreachable in the near future unless we get network back.";
  }
  else
  {
    v87 = @"we do not have a resident device (either not logged into iCloud or have reachability issues).";
  }
  [v3 appendString:v87];
LABEL_82:

  return v3;
}

uint64_t __29__HMDResidentMesh__stateDump__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@" %@:%@,", a2, a3];
}

uint64_t __29__HMDResidentMesh__stateDump__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __29__HMDResidentMesh__stateDump__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)_transmitCurrentDeviceMetricsToPrimaryResidentWithIsUrgent:(BOOL)a3
{
  BOOL v29 = a3;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(HMDResidentMesh *)self workQueue];
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
            int v15 = [v14 metrics];
            v16 = [(HMDResidentMesh *)self loadMetrics];
            [v15 addEntriesFromDictionary:v16];

            if (([v13 isCurrentDevice] & 1) == 0)
            {
              v17 = (void *)MEMORY[0x1D9452090]();
              uint64_t v18 = self;
              uint64_t v19 = HMFGetOSLogHandle();
              BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
              if (v29)
              {
                if (v20)
                {
                  v21 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = v28;
                  v36 = v21;
                  _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Immediately transmitting updated metrics", buf, 0xCu);
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
                  _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Scheduling transmission of updated metrics", buf, 0xCu);
                }
                [v14 _transmitAfter:10.0];
              }
            }
          }
          else
          {
            v22 = (void *)MEMORY[0x1D9452090]();
            v23 = self;
            v24 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              v25 = HMFGetLogIdentifier();
              id v26 = [v12 uuid];
              *(_DWORD *)buf = 138543618;
              v36 = v25;
              __int16 v37 = 2114;
              v38 = v26;
              _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Could not set metric for current device for home %{public}@: no primary resident", buf, 0x16u);
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
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__HMDResidentMesh_setMetricForCurrentDevice_withValue_isUrgent___block_invoke;
  v13[3] = &unk_1E6A15B38;
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
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
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
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Setting local metric with key: %@, value: %@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = [*(id *)(a1 + 32) loadMetrics];
  [v9 setObject:v8 forKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v10 = [*(id *)(a1 + 32) loadMetrics];
  id v11 = [*(id *)(a1 + 32) resident];
  [v11 setMetrics:v10];

  return [*(id *)(a1 + 32) _transmitCurrentDeviceMetricsToPrimaryResidentWithIsUrgent:*(unsigned __int8 *)(a1 + 56)];
}

- (id)deviceForAccessory:(id)a3 residentOrder:(unint64_t)a4 reachableResidents:(unint64_t *)a5
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (v10 && ([v10 isPrimary] & 1) == 0)
  {
    uint64_t v11 = [v10 bridge];

    id v8 = (id)v11;
  }
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  BOOL v29 = __Block_byref_object_copy__105206;
  v30 = __Block_byref_object_dispose__105207;
  id v31 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  id v12 = [(HMDResidentMesh *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__HMDResidentMesh_deviceForAccessory_residentOrder_reachableResidents___block_invoke;
  block[3] = &unk_1E6A0F130;
  id v13 = v8;
  id v17 = v13;
  uint64_t v18 = self;
  BOOL v20 = &v26;
  unint64_t v21 = a4;
  uint64_t v19 = &v22;
  dispatch_sync(v12, block);

  if (a5) {
    *a5 = v23[3];
  }
  id v14 = (id)v27[5];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v14;
}

void __71__HMDResidentMesh_deviceForAccessory_residentOrder_reachableResidents___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) home];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v26 = v2;
  uint64_t v4 = [v2 residentDeviceManager];
  uint64_t v5 = [v4 availableResidentDevices];
  uint64_t v28 = [v3 setWithArray:v5];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v6 = [*(id *)(a1 + 40) residents];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v27 = 0;
    uint64_t v9 = *(void *)v30;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * v10);
        id v12 = [v11 accessoryUUIDs];
        id v13 = [*(id *)(a1 + 32) uuid];
        if (![v12 containsObject:v13] || (objc_msgSend(v11, "enabled") & 1) == 0)
        {

LABEL_12:
          goto LABEL_13;
        }
        id v14 = [v11 residentDevice];
        int v15 = [v28 containsObject:v14];

        if (!v15) {
          goto LABEL_13;
        }
        ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        if (!*(void *)(a1 + 64))
        {
          uint64_t v16 = [*(id *)(a1 + 40) resident];
          id v17 = [v16 residentDevice];

          uint64_t v18 = [v26 primaryResident];
          if (![v17 isEqual:v18]) {
            goto LABEL_18;
          }
          int v19 = [*(id *)(a1 + 32) isReachable];

          if (v19)
          {
            uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
            id v21 = v17;
            uint64_t v18 = *(void **)(v20 + 40);
            *(void *)(v20 + 40) = v21;
LABEL_18:
          }
          goto LABEL_20;
        }
        ++v27;
LABEL_20:
        if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
        {
          uint64_t v22 = *(void *)(a1 + 64);
          if (v27 == v22)
          {
            if (v22)
            {
              uint64_t v23 = [v11 residentDevice];
              uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
              id v12 = *(void **)(v24 + 40);
              *(void *)(v24 + 40) = v23;
              goto LABEL_12;
            }
          }
        }
LABEL_13:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v25 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
      uint64_t v8 = v25;
    }
    while (v25);
  }
}

- (id)_residentMapForAccessories:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = v4;
  uint64_t v17 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v17)
  {
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(obj);
        }
        unint64_t v7 = 0;
        uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        unint64_t v18 = 0;
        do
        {
          uint64_t v9 = [(HMDResidentMesh *)self deviceForAccessory:v8 residentOrder:v7 reachableResidents:&v18];
          if (v9)
          {
            uint64_t v10 = [v5 objectForKey:v9];
            uint64_t v11 = v10;
            if (v10)
            {
              if (([v10 containsObject:v8] & 1) == 0) {
                [v11 addObject:v8];
              }
            }
            else
            {
              uint64_t v23 = v8;
              id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
              id v13 = (void *)[v12 mutableCopy];
              [v5 setObject:v13 forKey:v9];
            }
          }

          ++v7;
        }
        while (v7 <= v18);
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v17);
  }

  return v5;
}

- (id)balancedResidentMapForAccessories:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  uint64_t v34 = -[HMDResidentMesh _residentMapForAccessories:](self, "_residentMapForAccessories:");
  id v4 = objc_opt_new();
  uint64_t v5 = 0;
  long long v31 = self;
  do
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v6 = v30;
    uint64_t v36 = [v6 countByEnumeratingWithState:&v42 objects:v56 count:16];
    if (v36)
    {
      uint64_t v35 = *(void *)v43;
      obuint64_t j = v6;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v43 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          uint64_t v9 = [(HMDResidentMesh *)self bestResidentDeviceForAccessory:v8];
          uint64_t v10 = (void *)MEMORY[0x1D9452090]();
          uint64_t v11 = self;
          id v12 = HMFGetOSLogHandle();
          __int16 v37 = v9;
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            id v13 = HMFGetLogIdentifier();
            [v8 identifier];
            v14 = long long v33 = v10;
            int v15 = [v8 name];
            [v9 device];
            v17 = uint64_t v16 = v4;
            unint64_t v18 = [v17 shortDescription];
            *(_DWORD *)buf = 138544130;
            v49 = v13;
            __int16 v50 = 2114;
            v51 = v14;
            __int16 v52 = 2112;
            uint64_t v53 = v15;
            __int16 v54 = 2114;
            v55 = v18;
            _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Selected %{public}@/%@ for resident device: %{public}@", buf, 0x2Au);

            uint64_t v9 = v37;
            id v4 = v16;

            uint64_t v10 = v33;
            self = v31;
          }

          if (v8)
          {
            long long v19 = [v4 objectForKey:v9];
            long long v20 = v19;
            if (v19)
            {
              if (([v19 containsObject:v8] & 1) == 0) {
                [v20 addObject:v8];
              }
            }
            else
            {
              v47 = v8;
              long long v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
              long long v22 = (void *)[v21 mutableCopy];
              [v4 setObject:v22 forKey:v37];
            }
          }
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          uint64_t v23 = [v34 objectEnumerator];
          uint64_t v24 = [v23 countByEnumeratingWithState:&v38 objects:v46 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v5 = 0;
            uint64_t v26 = *(void *)v39;
            do
            {
              for (uint64_t j = 0; j != v25; ++j)
              {
                if (*(void *)v39 != v26) {
                  objc_enumerationMutation(v23);
                }
                uint64_t v28 = *(void **)(*((void *)&v38 + 1) + 8 * j);
                v5 += [v28 count];
                if (v8 && [v28 containsObject:v8])
                {
                  [v28 removeObject:v8];
                  --v5;
                }
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v38 objects:v46 count:16];
            }
            while (v25);
          }
          else
          {
            uint64_t v5 = 0;
          }
        }
        id v6 = obj;
        uint64_t v36 = [obj countByEnumeratingWithState:&v42 objects:v56 count:16];
      }
      while (v36);
    }
  }
  while (v5);

  return v4;
}

- (id)cameraRecordingAnalysisNodesForCameraAccessory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [(HMDResidentMesh *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__HMDResidentMesh_cameraRecordingAnalysisNodesForCameraAccessory___block_invoke;
  block[3] = &unk_1E6A19668;
  void block[4] = self;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  dispatch_sync(v6, block);

  uint64_t v9 = v14;
  id v10 = v7;

  return v10;
}

void __66__HMDResidentMesh_cameraRecordingAnalysisNodesForCameraAccessory___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) residents];
  id v3 = (void *)[v2 mutableCopy];

  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = [*(id *)(a1 + 40) home];
  id v6 = [v5 residentDeviceManager];
  id v7 = [v6 availableResidentDevices];
  id v8 = [v4 setWithArray:v7];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __66__HMDResidentMesh_cameraRecordingAnalysisNodesForCameraAccessory___block_invoke_2;
  v26[3] = &unk_1E6A0F108;
  id v21 = v8;
  id v27 = v21;
  long long v20 = [v3 indexesOfObjectsPassingTest:v26];
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
        int v15 = *(void **)(a1 + 48);
        uint64_t v16 = [HMDCameraRecordingAnalysisNode alloc];
        uint64_t v17 = [v14 residentDevice];
        unint64_t v18 = [v14 metrics];
        long long v19 = [(HMDCameraRecordingAnalysisNode *)v16 initWithResidentDevice:v17 metrics:v18];
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
    id v6 = [v3 residentDevice];
    id v7 = [v6 capabilities];
    uint64_t v8 = [v7 supportsCameraRecording] ^ 1;
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

- (id)bestResidentDeviceForAccessory:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  long long v38 = __Block_byref_object_copy__105206;
  long long v39 = __Block_byref_object_dispose__105207;
  id v40 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v34[3] = 5;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = [v4 home];
  id v7 = [v6 residentDeviceManager];
  uint64_t v8 = [v7 availableResidentDevices];
  id v9 = [v5 setWithArray:v8];

  uint64_t v10 = [(HMDResidentMesh *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__HMDResidentMesh_bestResidentDeviceForAccessory___block_invoke;
  block[3] = &unk_1E6A11620;
  id v11 = v4;
  id v29 = v11;
  id v30 = self;
  id v12 = v9;
  id v31 = v12;
  long long v32 = v34;
  long long v33 = &v35;
  dispatch_sync(v10, block);

  uint64_t v13 = (void *)v36[5];
  if (!v13)
  {
    id v14 = (void *)MEMORY[0x1D9452090]();
    int v15 = self;
    HMFGetOSLogHandle();
    uint64_t v16 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v42 = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Preferring (self) this resident", buf, 0xCu);
    }
    uint64_t v18 = [(HMDResidentMesh *)v15 deviceForAccessory:v11 residentOrder:0 reachableResidents:0];
    long long v19 = (void *)v36[5];
    v36[5] = v18;

    uint64_t v13 = (void *)v36[5];
    if (!v13)
    {
      long long v20 = (void *)MEMORY[0x1D9452090]();
      id v21 = v15;
      HMFGetOSLogHandle();
      long long v22 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        long long v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v42 = v23;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Preferring first reachable resident", buf, 0xCu);
      }
      uint64_t v24 = [(HMDResidentMesh *)v21 deviceForAccessory:v11 residentOrder:1 reachableResidents:0];
      long long v25 = (void *)v36[5];
      v36[5] = v24;

      uint64_t v13 = (void *)v36[5];
    }
  }
  id v26 = v13;

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(&v35, 8);

  return v26;
}

void __50__HMDResidentMesh_bestResidentDeviceForAccessory___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  if (([v4 hasIPLink] & 1) == 0)
  {
    id v27 = v4;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    obuint64_t j = [*(id *)(a1 + 40) residents];
    uint64_t v5 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v36;
      uint64_t v28 = *(void *)v36;
      do
      {
        uint64_t v8 = 0;
        uint64_t v29 = v6;
        do
        {
          if (*(void *)v36 != v7) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v35 + 1) + 8 * v8);
          uint64_t v10 = *(void **)(a1 + 48);
          id v11 = [v9 residentDevice];
          LODWORD(v10) = [v10 containsObject:v11];

          if (v10)
          {
            long long v33 = 0u;
            long long v34 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            id v12 = [v9 accessoryListWithLinkQuality];
            uint64_t v13 = [v12 keyEnumerator];

            uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v32;
              do
              {
                for (uint64_t i = 0; i != v15; ++i)
                {
                  if (*(void *)v32 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  uint64_t v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
                  long long v19 = [*(id *)(a1 + 32) identifier];
                  int v20 = [v18 isEqualToString:v19];

                  if (v20)
                  {
                    id v21 = [v9 accessoryListWithLinkQuality];
                    long long v22 = [v21 objectForKey:v18];
                    unint64_t v23 = [v22 integerValue];

                    if (v23 < *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
                    {
                      uint64_t v24 = [v9 residentDevice];
                      uint64_t v25 = *(void *)(*(void *)(a1 + 64) + 8);
                      id v26 = *(void **)(v25 + 40);
                      *(void *)(v25 + 40) = v24;

                      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v23;
                    }
                  }
                }
                uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
              }
              while (v15);
            }

            uint64_t v7 = v28;
            uint64_t v6 = v29;
          }
          ++v8;
        }
        while (v8 != v6);
        uint64_t v6 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v6);
    }

    id v4 = v27;
  }
}

- (void)_handleMeshUpdateMessage:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 numberForKey:@"kMeshVersion"];
  if ([v5 unsignedIntegerValue] == 2)
  {
    uint64_t v6 = [v4 uuidForKey:@"kMeshDevice"];
    uint64_t v7 = [(HMDResidentMesh *)self _meshStorageForDeviceIdentifier:v6];
    if (v7)
    {
      uint64_t v8 = [v4 numberForKey:@"kMeshDeviceStorageGenerationCount"];
      objc_msgSend(v7, "setGenerationCount:", objc_msgSend(v8, "unsignedIntegerValue"));

      id v9 = [v4 numberForKey:@"kMeshDeviceStorageEnabled"];
      objc_msgSend(v7, "setEnabled:", objc_msgSend(v9, "BOOLValue"));

      uint64_t v10 = [v4 dictionaryForKey:@"kMeshDeviceStorageSystemLoad"];
      [v7 setMetrics:v10];

      id v11 = [v4 arrayForKey:@"kMeshDeviceStorageAcccessories"];
      id v12 = uuidSetFromArrayOfStrings(v11);
      [v7 setAccessoryUUIDs:v12];

      uint64_t v13 = [v4 dictionaryForKey:@"kMeshDeviceStorageAccessoriesWithLinkQuality"];
      uint64_t v14 = v13;
      if (v13)
      {
        uint64_t v15 = (void *)[v13 mutableCopy];
        [v7 setAccessoryListWithLinkQuality:v15];
      }
      uint64_t v16 = NSNumber;
      uint64_t v17 = [(HMDResidentMesh *)self resident];
      uint64_t v18 = objc_msgSend(v16, "numberWithBool:", objc_msgSend(v17, "enabled"));
      long long v31 = v18;
      long long v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      [v4 respondWithPayload:v19];
    }
    else
    {
      uint64_t v25 = (void *)MEMORY[0x1D9452090]();
      id v26 = self;
      id v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = HMFGetLogIdentifier();
        uint64_t v29 = [v4 shortDescription];
        *(_DWORD *)buf = 138543874;
        long long v33 = v28;
        __int16 v34 = 2114;
        long long v35 = v29;
        __int16 v36 = 2114;
        uint64_t v37 = (uint64_t)v6;
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Rejecting message %{public}@ from unknown device: %{public}@", buf, 0x20u);
      }
      uint64_t v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      [v4 respondWithError:v14];
    }
  }
  else
  {
    int v20 = (void *)MEMORY[0x1D9452090]();
    id v21 = self;
    long long v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      unint64_t v23 = HMFGetLogIdentifier();
      uint64_t v24 = [v4 shortDescription];
      *(_DWORD *)buf = 138544130;
      long long v33 = v23;
      __int16 v34 = 2112;
      long long v35 = v5;
      __int16 v36 = 2048;
      uint64_t v37 = 2;
      __int16 v38 = 2114;
      long long v39 = v24;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Rejecting message with version %@ lower than current version %ld: %{public}@", buf, 0x2Au);
    }
    uint64_t v6 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    [v4 respondWithError:v6];
  }
}

- (void)_handleMeshUpdateRequestMessage:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 numberForKey:@"kMeshVersion"];
  if ([v5 unsignedIntegerValue] == 2)
  {
    uint64_t v6 = [v4 uuidForKey:@"kMeshDevice"];
    uint64_t v7 = [(HMDResidentMesh *)self _meshStorageForDeviceIdentifier:v6];
    uint64_t v8 = v7;
    if (v7)
    {
      uint64_t v40 = v6;
      uint64_t v41 = v5;
      id v9 = (void *)MEMORY[0x1E4F1CA48];
      uint64_t v10 = [v7 accessoryUUIDs];
      id v11 = objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));

      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v12 = [v8 accessoryUUIDs];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v42 objects:v48 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v43 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = [*(id *)(*((void *)&v42 + 1) + 8 * i) UUIDString];
            [v11 addObject:v17];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v42 objects:v48 count:16];
        }
        while (v14);
      }

      uint64_t v18 = (void *)MEMORY[0x1D9452090]();
      long long v19 = self;
      int v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v21 = HMFGetLogIdentifier();
        long long v22 = [v4 shortDescription];
        *(_DWORD *)buf = 138543618;
        __int16 v50 = v21;
        __int16 v51 = 2112;
        __int16 v52 = v22;
        _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Responding to mesh update request message: %@", buf, 0x16u);
      }
      v46[0] = @"kMeshDeviceStorageEnabled";
      unint64_t v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "enabled"));
      v47[0] = v23;
      v46[1] = @"kMeshDeviceStorageGenerationCount";
      uint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "generationCount"));
      v47[1] = v24;
      v46[2] = @"kMeshDeviceStorageSystemLoad";
      uint64_t v25 = [v8 metrics];
      v47[2] = v25;
      v46[3] = @"kMeshDeviceStorageAcccessories";
      id v26 = (void *)[v11 copy];
      v47[3] = v26;
      v46[4] = @"kMeshDeviceStorageAccessoriesWithLinkQuality";
      id v27 = [v8 accessoryListWithLinkQuality];
      uint64_t v28 = (void *)[v27 copy];
      v47[4] = v28;
      uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:5];
      [v4 respondWithPayload:v29];

      uint64_t v6 = v40;
      uint64_t v5 = v41;
    }
    else
    {
      long long v35 = (void *)MEMORY[0x1D9452090]();
      __int16 v36 = self;
      uint64_t v37 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        __int16 v38 = HMFGetLogIdentifier();
        long long v39 = [v4 shortDescription];
        *(_DWORD *)buf = 138543874;
        __int16 v50 = v38;
        __int16 v51 = 2114;
        __int16 v52 = v39;
        __int16 v53 = 2114;
        uint64_t v54 = (uint64_t)v6;
        _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_ERROR, "%{public}@Rejecting message %{public}@ from unknown device: %{public}@", buf, 0x20u);
      }
      id v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      [v4 respondWithError:v11];
    }
  }
  else
  {
    uint64_t v30 = (void *)MEMORY[0x1D9452090]();
    long long v31 = self;
    long long v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      long long v33 = HMFGetLogIdentifier();
      __int16 v34 = [v4 shortDescription];
      *(_DWORD *)buf = 138544130;
      __int16 v50 = v33;
      __int16 v51 = 2112;
      __int16 v52 = v5;
      __int16 v53 = 2048;
      uint64_t v54 = 2;
      __int16 v55 = 2114;
      uint64_t v56 = v34;
      _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_ERROR, "%{public}@Rejecting message with version %@ lower than current version %ld: %{public}@", buf, 0x2Au);
    }
    uint64_t v6 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    [v4 respondWithError:v6];
  }
}

- (void)_sendMessage:(id)a3 payload:(id)a4 target:(id)a5 force:(BOOL)a6 responseHandler:(id)a7
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v61 = a3;
  id v60 = a4;
  id v59 = a5;
  id v58 = a7;
  id v11 = [(HMDResidentMesh *)self workQueue];
  dispatch_assert_queue_V2(v11);

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v12 = [(HMDResidentMesh *)self homeManager];
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
        long long v19 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        int v20 = [v19 residentDeviceManager];
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

  id v26 = [(HMDResidentMesh *)self resident];
  id v27 = v26;
  if ((v16 & 1) == 0 && !a6)
  {
    uint64_t v28 = (void *)MEMORY[0x1D9452090]();
    uint64_t v29 = self;
    uint64_t v30 = HMFGetOSLogHandle();
    long long v31 = v61;
    long long v33 = v58;
    long long v32 = v59;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v71 = v34;
      __int16 v72 = 2112;
      id v73 = v61;
      _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Suppressing message %@ because we are not a resident device.", buf, 0x16u);
    }
    long long v35 = v60;
    goto LABEL_36;
  }
  long long v31 = v61;
  long long v33 = v58;
  long long v32 = v59;
  if (!v59)
  {
    __int16 v38 = (void *)MEMORY[0x1D9452090]();
    long long v39 = self;
    uint64_t v40 = HMFGetOSLogHandle();
    long long v35 = v60;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v41 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v71 = v41;
      __int16 v72 = 2112;
      id v73 = v61;
      long long v42 = "%{public}@Suppressing message %@ because target is nil.";
      goto LABEL_34;
    }
LABEL_35:

    goto LABEL_36;
  }
  long long v35 = v60;
  if (!v26)
  {
    __int16 v38 = (void *)MEMORY[0x1D9452090]();
    long long v39 = self;
    uint64_t v40 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v41 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v71 = v41;
      __int16 v72 = 2112;
      id v73 = v61;
      long long v42 = "%{public}@Suppressing message %@ because self.resident is nil.";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  __int16 v36 = [v26 residentDevice];
  int v37 = [v36 isEqual:v59];

  if (v37)
  {
    __int16 v38 = (void *)MEMORY[0x1D9452090]();
    long long v39 = self;
    uint64_t v40 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v41 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v71 = v41;
      __int16 v72 = 2112;
      id v73 = v61;
      long long v42 = "%{public}@Suppressing message %@ because we are the target.";
LABEL_34:
      _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_DEFAULT, v42, buf, 0x16u);

      goto LABEL_35;
    }
    goto LABEL_35;
  }
  uint64_t v57 = +[HMDRemoteMessage messageWithName:v61 messagePayload:v60];
  __int16 v55 = [(HMDResidentMesh *)self messageTargetUUID];
  long long v43 = [v59 device];
  long long v44 = [v43 remoteDestinationString];

  long long v45 = (void *)MEMORY[0x1D9452090]();
  v46 = self;
  v47 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    __int16 v53 = v44;
    v48 = uint64_t v54 = v45;
    v49 = [v57 shortDescription];
    __int16 v50 = [v57 messagePayload];
    *(_DWORD *)buf = 138543874;
    v71 = v48;
    __int16 v72 = 2114;
    id v73 = v49;
    __int16 v74 = 2112;
    v75 = v50;
    _os_log_impl(&dword_1D49D5000, v47, OS_LOG_TYPE_INFO, "%{public}@Sending message %{public}@ with payload: %@", buf, 0x20u);

    long long v45 = v54;
    long long v44 = v53;
  }

  __int16 v51 = [(HMDResidentMesh *)v46 messageDispatcher];
  __int16 v52 = [(HMDResidentMesh *)v46 workQueue];
  [v51 sendSecureMessage:v57 target:v55 userID:v44 destination:v44 responseQueue:v52 responseHandler:v58];

LABEL_36:
}

- (void)_removeConnectivityFromDeviceToAccessory:(id)a3 activateTimer:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(HMDResidentMesh *)self resident];
  uint64_t v8 = (void *)v7;
  if (v6 && v7)
  {
    id v6 = v6;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      uint64_t v10 = v6;
    }
    else {
      uint64_t v10 = 0;
    }
    id v11 = v10;

    if ((isKindOfClass & 1) == 0
      || ([v6 isPrimary] & 1) != 0
      || ([v6 bridge], uint64_t v12 = objc_claimAutoreleasedReturnValue(), v6, (v6 = (id)v12) != 0))
    {
      if ([v11 hasBTLELink])
      {
        uint64_t v13 = [v11 identifier];

        if (v13)
        {
          uint64_t v14 = [v8 accessoryListWithLinkQuality];
          uint64_t v15 = [v11 identifier];
          [v14 removeObjectForKey:v15];
        }
      }
      if ([v6 isSuspended])
      {
        char v16 = (void *)MEMORY[0x1D9452090]();
        uint64_t v17 = self;
        uint64_t v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          long long v19 = HMFGetLogIdentifier();
          int v20 = [v6 uuid];
          id v21 = [v20 UUIDString];
          uint64_t v22 = [v6 identifier];
          *(_DWORD *)buf = 138543874;
          __int16 v51 = v19;
          __int16 v52 = 2112;
          __int16 v53 = v21;
          __int16 v54 = 2112;
          __int16 v55 = v22;
          _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Not removing local connectivity to a suspended accessory %@/%@", buf, 0x20u);
        }
      }
      else
      {
        uint64_t v23 = [v8 accessoryUUIDs];
        uint64_t v24 = [v6 uuid];
        int v25 = [v23 containsObject:v24];

        if (v25)
        {
          id v26 = (void *)MEMORY[0x1D9452090]();
          id v27 = self;
          uint64_t v28 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            uint64_t v29 = HMFGetLogIdentifier();
            uint64_t v30 = [v6 uuid];
            [v30 UUIDString];
            long long v31 = v49 = v26;
            *(_DWORD *)buf = 138543618;
            __int16 v51 = v29;
            __int16 v52 = 2112;
            __int16 v53 = v31;
            _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Removing local connectivity to %@", buf, 0x16u);

            id v26 = v49;
          }

          long long v32 = [v8 accessoryUUIDs];
          long long v33 = [v6 uuid];
          [v32 removeObject:v33];

          objc_msgSend(v8, "setGenerationCount:", objc_msgSend(v8, "generationCount") + 1);
        }
        __int16 v34 = [v6 home];
        long long v35 = [v34 primaryResident];

        if (v35)
        {
          __int16 v36 = [(HMDResidentMesh *)self _addResidentStorageResidentDevice:v35];
          if (![v8 enabled]
            || ([v36 residentDevice],
                int v37 = objc_claimAutoreleasedReturnValue(),
                [v8 residentDevice],
                __int16 v38 = objc_claimAutoreleasedReturnValue(),
                int v39 = [v37 isEqual:v38],
                v38,
                v37,
                v39))
          {
            BOOL v4 = 0;
          }
          [v36 _removeAccessory:v6 activateTimer:v4];
        }
        else
        {
          uint64_t v40 = (void *)MEMORY[0x1D9452090]();
          uint64_t v41 = self;
          long long v42 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            long long v43 = HMFGetLogIdentifier();
            long long v44 = [v6 shortDescription];
            *(_DWORD *)buf = 138543618;
            __int16 v51 = v43;
            __int16 v52 = 2114;
            __int16 v53 = v44;
            _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_INFO, "%{public}@Not removing connectivity from resident storage for accessory whose home has no known primary resident: %{public}@", buf, 0x16u);
          }
        }
      }
    }
    else
    {
      long long v45 = (void *)MEMORY[0x1D9452090]();
      v46 = self;
      v47 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        v48 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v51 = v48;
        _os_log_impl(&dword_1D49D5000, v47, OS_LOG_TYPE_INFO, "%{public}@Not removing connectivity for non-primary accessory with a nil bridge", buf, 0xCu);
      }
      id v6 = 0;
    }
  }
}

- (void)_addConnectivityFromDeviceToAccessory:(id)a3 activateTimer:(BOOL)a4
{
  uint64_t v4 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(HMDResidentMesh *)self resident];
  if (v7)
  {
    id v6 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v6;
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = v8;

    if (!v9
      || ([v9 isPrimary] & 1) != 0
      || ([v9 bridge], v10 = objc_claimAutoreleasedReturnValue(), v6, (id v6 = (id)v10) != 0))
    {
      id v11 = [v7 accessoryUUIDs];
      uint64_t v12 = [v6 uuid];
      char v13 = [v11 containsObject:v12];

      if ((v13 & 1) == 0)
      {
        uint64_t v14 = (void *)MEMORY[0x1D9452090]();
        uint64_t v15 = self;
        char v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          uint64_t v17 = v38 = v4;
          uint64_t v18 = [v6 uuid];
          long long v19 = [v18 UUIDString];
          *(_DWORD *)buf = 138543618;
          uint64_t v40 = v17;
          __int16 v41 = 2114;
          long long v42 = v19;
          _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Adding local connectivity to mesh storage for accessory: %{public}@", buf, 0x16u);

          uint64_t v4 = v38;
        }

        int v20 = [v7 accessoryUUIDs];
        id v21 = [v6 uuid];
        [v20 addObject:v21];

        objc_msgSend(v7, "setGenerationCount:", objc_msgSend(v7, "generationCount") + 1);
      }
      uint64_t v22 = [v6 home];
      uint64_t v23 = [v22 primaryResident];

      if (v23)
      {
        uint64_t v24 = [(HMDResidentMesh *)self _addResidentStorageResidentDevice:v23];
        if ([v9 hasBTLELink])
        {
          int v25 = [v7 accessoryListWithLinkQuality];
          [v24 _addAccessoryWithLinkQuality:v9 toList:v25];
        }
        if (![v7 enabled]
          || ([v24 residentDevice],
              id v26 = objc_claimAutoreleasedReturnValue(),
              [v7 residentDevice],
              id v27 = objc_claimAutoreleasedReturnValue(),
              int v28 = [v26 isEqual:v27],
              v27,
              v26,
              v28))
        {
          uint64_t v4 = 0;
        }
        [v24 _addAccessory:v6 activateTimer:v4];
      }
      else
      {
        uint64_t v29 = (void *)MEMORY[0x1D9452090]();
        uint64_t v30 = self;
        long long v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          long long v32 = HMFGetLogIdentifier();
          long long v33 = [v6 shortDescription];
          *(_DWORD *)buf = 138543618;
          uint64_t v40 = v32;
          __int16 v41 = 2114;
          long long v42 = v33;
          _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@Not adding connectivity to resident storage for accessory whose home has no known primary resident: %{public}@", buf, 0x16u);
        }
      }
    }
    else
    {
      __int16 v34 = (void *)MEMORY[0x1D9452090]();
      long long v35 = self;
      __int16 v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        int v37 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v40 = v37;
        _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_INFO, "%{public}@Not adding connectivity for non-primary accessory with nil bridge", buf, 0xCu);
      }
      id v6 = 0;
    }
  }
}

- (BOOL)_checkReachabilityWithTimerActivation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1D9452090](self, a2);
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    id v9 = (void *)v8;
    uint64_t v10 = "NO";
    if (v3) {
      uint64_t v10 = "YES";
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v39 = v8;
    __int16 v40 = 2080;
    __int16 v41 = v10;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Beginning full reachability check (timerActivation=%s)", buf, 0x16u);
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v11 = [(HMDResidentMesh *)v6 homeManager];
  uint64_t v12 = [v11 homes];

  uint64_t v26 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
  char v13 = 0;
  if (v26)
  {
    uint64_t v25 = *(void *)v33;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v33 != v25) {
          objc_enumerationMutation(v12);
        }
        uint64_t v27 = v14;
        uint64_t v15 = *(void **)(*((void *)&v32 + 1) + 8 * v14);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        char v16 = [v15 accessories];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v29 != v19) {
                objc_enumerationMutation(v16);
              }
              id v21 = *(id *)(*((void *)&v28 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                uint64_t v22 = v21;
              }
              else {
                uint64_t v22 = 0;
              }
              id v23 = v22;

              if (v23)
              {
                if ([v21 isReachable])
                {
                  [(HMDResidentMesh *)v6 _addConnectivityFromDeviceToAccessory:v21 activateTimer:v3];
                }
                else
                {
                  [(HMDResidentMesh *)v6 _removeConnectivityFromDeviceToAccessory:v21 activateTimer:v3];
                  char v13 = 1;
                }
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }
          while (v18);
        }

        uint64_t v14 = v27 + 1;
      }
      while (v27 + 1 != v26);
      uint64_t v26 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v26);
  }

  return v13 & 1;
}

- (id)_addResidentStorageResidentDevice:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDResidentMesh *)self _residentStorageForResidentDevice:v4];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = v5;
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = [v4 device];
      char v13 = [v12 shortDescription];
      int v16 = 138543618;
      uint64_t v17 = v11;
      __int16 v18 = 2114;
      uint64_t v19 = v13;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding resident device to residents list: %{public}@", (uint8_t *)&v16, 0x16u);
    }
    uint64_t v7 = [[HMDResidentMeshResidentStorage alloc] initWithResidentDevice:v4 owner:v9];
    uint64_t v14 = [(HMDResidentMesh *)v9 reachableAccessories];
    [v14 addObject:v7];
  }
  return v7;
}

- (id)_residentStorageForResidentDevice:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
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
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDResidentMesh *)self _meshStorageForResidentDevice:v4];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = v5;
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1D9452090]();
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
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding resident device to mesh: %{public}@", (uint8_t *)&v16, 0x16u);
    }
    uint64_t v7 = [[HMDResidentMeshMeshStorage alloc] initWithResidentDevice:v4 owner:v9];
    long long v14 = [(HMDResidentMesh *)v9 residents];
    [v14 addObject:v7];
  }
  return v7;
}

- (id)_meshStorageForDeviceIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
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
  uint64_t v18 = *MEMORY[0x1E4F143B8];
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
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDResidentMesh *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
  char v11 = [(HMDResidentMesh *)self homeManager];
  uint64_t v12 = [v11 homes];

  v139[0] = MEMORY[0x1E4F143A8];
  v139[1] = 3221225472;
  v139[2] = __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke;
  v139[3] = &unk_1E6A0F070;
  id v13 = v9;
  id v140 = v13;
  id v14 = v10;
  id v141 = v14;
  objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v139);
  v136[0] = MEMORY[0x1E4F143A8];
  v136[1] = 3221225472;
  v136[2] = __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke_2;
  v136[3] = &unk_1E6A0F070;
  id v15 = v13;
  id v137 = v15;
  uint64_t v138 = self;
  v96 = v12;
  objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v136);
  long long v16 = [MEMORY[0x1E4F1CA80] set];
  v132[0] = MEMORY[0x1E4F143A8];
  v132[1] = 3221225472;
  v132[2] = __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke_229;
  v132[3] = &unk_1E6A0F0B8;
  id v95 = v14;
  id v133 = v95;
  id v17 = v16;
  id v134 = v17;
  v135 = self;
  objc_msgSend(v15, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v132);
  uint64_t v18 = [MEMORY[0x1E4F1CA80] set];
  v127[0] = MEMORY[0x1E4F143A8];
  v127[1] = 3221225472;
  v127[2] = __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke_235;
  v127[3] = &unk_1E6A0F0E0;
  v127[4] = self;
  id v97 = v6;
  id v128 = v97;
  id v92 = v7;
  id v129 = v92;
  id v105 = v15;
  id v130 = v105;
  id v19 = v18;
  id v131 = v19;
  uint64_t v94 = v17;
  objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v127);
  uint64_t v20 = [(HMDResidentMesh *)self resident];
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  id v21 = [(HMDResidentMesh *)self residents];
  uint64_t v22 = (void *)[v21 copy];

  uint64_t v23 = [v22 countByEnumeratingWithState:&v123 objects:v152 count:16];
  long long v106 = self;
  v98 = v19;
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v124;
    long long v101 = v22;
    do
    {
      uint64_t v26 = 0;
      obuint64_t j = v24;
      do
      {
        if (*(void *)v124 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void **)(*((void *)&v123 + 1) + 8 * v26);
        long long v28 = objc_msgSend(v27, "residentDevice", v92);
        int v29 = [v28 isCurrentDevice];

        if (v29)
        {
          if (([v27 isEqual:v20] & 1) == 0)
          {
            uint64_t v30 = v25;
            long long v31 = (void *)MEMORY[0x1D9452090]();
            long long v32 = self;
            long long v33 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              long long v34 = v99 = v20;
              long long v35 = [v27 residentDevice];
              __int16 v36 = [v35 device];
              int v37 = [v36 shortDescription];
              *(_DWORD *)buf = 138543618;
              v145 = v34;
              __int16 v146 = 2114;
              v147 = v37;
              _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_INFO, "%{public}@Setting resident device to %{public}@", buf, 0x16u);

              id v19 = v98;
              self = v106;

              uint64_t v22 = v101;
              uint64_t v20 = v99;
            }

            uint64_t v25 = v30;
            uint64_t v24 = obj;
          }
          id v38 = v27;

          uint64_t v39 = [(HMDResidentMesh *)self loadMetrics];
          [v38 setMetrics:v39];

          [(HMDResidentMesh *)self setResident:v38];
          uint64_t v20 = v38;
        }
        __int16 v40 = [v27 residentDevice];
        char v41 = [v19 containsObject:v40];

        if ((v41 & 1) == 0)
        {
          uint64_t v42 = [(HMDResidentMesh *)self residents];
          [v42 removeObject:v27];
        }
        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [v22 countByEnumeratingWithState:&v123 objects:v152 count:16];
    }
    while (v24);
  }
  v100 = v20;

  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  uint64_t v43 = [(HMDResidentMesh *)self reachableAccessories];
  long long v44 = (void *)[v43 copy];

  uint64_t v45 = [v44 countByEnumeratingWithState:&v119 objects:v151 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v120;
    do
    {
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v120 != v47) {
          objc_enumerationMutation(v44);
        }
        v49 = *(void **)(*((void *)&v119 + 1) + 8 * i);
        __int16 v50 = objc_msgSend(v49, "residentDevice", v92);
        char v51 = [v19 containsObject:v50];

        if ((v51 & 1) == 0)
        {
          __int16 v52 = [(HMDResidentMesh *)self reachableAccessories];
          [v52 removeObject:v49];
        }
      }
      uint64_t v46 = [v44 countByEnumeratingWithState:&v119 objects:v151 count:16];
    }
    while (v46);
  }

  if ([v97 isEqual:@"HMDResidentDeviceManagerAddResidentNotification"]) {
    int v53 = 1;
  }
  else {
    int v53 = [v97 isEqual:@"HMDResidentDeviceManagerUpdateResidentNotification"];
  }
  __int16 v54 = v105;
  __int16 v55 = [(HMDResidentMesh *)self primaryResidentForHomes];
  int v56 = [v105 isSubsetOfSet:v55];

  if (!v56 || v53)
  {
    uint64_t v57 = (void *)MEMORY[0x1D9452090]();
    id v58 = self;
    id v59 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      id v60 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v145 = v60;
      _os_log_impl(&dword_1D49D5000, v59, OS_LOG_TYPE_INFO, "%{public}@Our primary residents list has new items (or some shift in devices happened):", buf, 0xCu);
    }
    long long v117 = 0u;
    long long v118 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    id obja = v105;
    uint64_t v61 = [obja countByEnumeratingWithState:&v115 objects:v150 count:16];
    if (v61)
    {
      uint64_t v62 = v61;
      uint64_t v63 = *(void *)v116;
      do
      {
        uint64_t v64 = 0;
        uint64_t v102 = v62;
        do
        {
          if (*(void *)v116 != v63) {
            objc_enumerationMutation(obja);
          }
          long long v65 = *(void **)(*((void *)&v115 + 1) + 8 * v64);
          long long v66 = (void *)MEMORY[0x1D9452090]();
          long long v67 = v58;
          long long v68 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
          {
            long long v69 = HMFGetLogIdentifier();
            [v65 UUIDString];
            v71 = v70 = v58;
            __int16 v72 = [(HMDResidentMesh *)v67 primaryResidentForHomes];
            int v73 = [v72 containsObject:v65];
            *(_DWORD *)buf = 138543874;
            __int16 v74 = " (added)";
            if (v73) {
              __int16 v74 = "";
            }
            v145 = v69;
            __int16 v146 = 2114;
            v147 = v71;
            __int16 v148 = 2080;
            v149 = v74;
            _os_log_impl(&dword_1D49D5000, v68, OS_LOG_TYPE_INFO, "%{public}@  Home: %{public}@%s", buf, 0x20u);

            id v58 = v70;
            uint64_t v62 = v102;

            self = v106;
          }

          ++v64;
        }
        while (v62 != v64);
        uint64_t v62 = [obja countByEnumeratingWithState:&v115 objects:v150 count:16];
      }
      while (v62);
    }

    [(HMDResidentMesh *)v58 _checkReachabilityWithTimerActivation:1];
    long long v111 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    v75 = [(HMDResidentMesh *)v58 residents];
    uint64_t v76 = [v75 countByEnumeratingWithState:&v111 objects:v143 count:16];
    if (v76)
    {
      uint64_t v77 = v76;
      uint64_t v78 = *(void *)v112;
      do
      {
        for (uint64_t j = 0; j != v77; ++j)
        {
          if (*(void *)v112 != v78) {
            objc_enumerationMutation(v75);
          }
          uint64_t v80 = *(void **)(*((void *)&v111 + 1) + 8 * j);
          if (v100 != v80 && [*(id *)(*((void *)&v111 + 1) + 8 * j) enabled]) {
            [v80 _requestStatus];
          }
        }
        uint64_t v77 = [v75 countByEnumeratingWithState:&v111 objects:v143 count:16];
      }
      while (v77);
    }

    __int16 v54 = v105;
  }
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  v81 = [(HMDResidentMesh *)self primaryResidentForHomes];
  uint64_t v82 = [v81 countByEnumeratingWithState:&v107 objects:v142 count:16];
  if (v82)
  {
    uint64_t v83 = v82;
    uint64_t v84 = *(void *)v108;
    do
    {
      for (uint64_t k = 0; k != v83; ++k)
      {
        if (*(void *)v108 != v84) {
          objc_enumerationMutation(v81);
        }
        char v86 = *(void **)(*((void *)&v107 + 1) + 8 * k);
        if (([v54 containsObject:v86] & 1) == 0)
        {
          v87 = (void *)MEMORY[0x1D9452090]();
          v88 = self;
          v89 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
          {
            v90 = HMFGetLogIdentifier();
            id v91 = [v86 UUIDString];
            *(_DWORD *)buf = 138543618;
            v145 = v90;
            __int16 v146 = 2114;
            v147 = v91;
            _os_log_impl(&dword_1D49D5000, v89, OS_LOG_TYPE_INFO, "%{public}@  Home: %{public}@ (removed)", buf, 0x16u);

            self = v106;
          }

          __int16 v54 = v105;
        }
      }
      uint64_t v83 = [v81 countByEnumeratingWithState:&v107 objects:v142 count:16];
    }
    while (v83);
  }

  [(HMDResidentMesh *)self setPrimaryResidentForHomes:v54];
}

void __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
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
      uint64_t v8 = (void *)MEMORY[0x1D9452090]();
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
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Could not create resident storage for home %{public}@: no primary resident", (uint8_t *)&v13, 0x16u);
      }
    }
  }
}

void __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke_229(id *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [a1[4] objectForKeyedSubscript:v3];
  uint64_t v5 = (void *)MEMORY[0x1D9452090]([a1[5] addObjectsFromArray:v4]);
  id v6 = a1[6];
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    id v9 = objc_msgSend(v4, "na_map:", &__block_literal_global_233);
    int v10 = 138543874;
    char v11 = v8;
    __int16 v12 = 2114;
    id v13 = v3;
    __int16 v14 = 2114;
    __int16 v15 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Home %{public}@ may use devices: %{public}@", (uint8_t *)&v10, 0x20u);
  }
}

void __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke_235(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 capabilities];
  char v5 = [v4 isResidentCapable];

  if (v5)
  {
    id v6 = [v3 device];
    id v7 = [v6 version];
    id v8 = (id)minimumSupportedResidentHomeKitVersion;
    char v9 = [v7 isAtLeastVersion:v8];

    if (v9)
    {
      if (![*(id *)(a1 + 40) isEqual:@"HMDResidentDeviceManagerRemoveResidentNotification"]|| (objc_msgSend(v3, "device"), int v10 = objc_claimAutoreleasedReturnValue(), v11 = objc_msgSend(v10, "isEqual:", *(void *)(a1 + 48)), v10, !v11))
      {
        if ([v3 isCurrentDevice])
        {
          if (![*(id *)(a1 + 56) count])
          {
            __int16 v12 = (void *)MEMORY[0x1D9452090]();
            id v13 = *(id *)(a1 + 32);
            __int16 v14 = HMFGetOSLogHandle();
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
              goto LABEL_13;
            }
            __int16 v15 = HMFGetLogIdentifier();
            uint64_t v16 = [v3 device];
            uint64_t v17 = [v16 shortDescription];
            int v31 = 138543618;
            long long v32 = v15;
            __int16 v33 = 2114;
            long long v34 = v17;
            uint64_t v18 = "%{public}@Not adding the current device because it isn't a part of any homes: %{public}@";
            goto LABEL_9;
          }
        }
        else
        {
          uint64_t v24 = [*(id *)(a1 + 32) messageDispatcher];
          uint64_t v25 = [v24 secureRemoteTransport];
          uint64_t v26 = [v25 deviceMonitor];
          uint64_t v27 = [v26 unreachableDevices];
          long long v28 = [v3 device];
          int v29 = [v27 containsObject:v28];

          if (v29)
          {
            __int16 v12 = (void *)MEMORY[0x1D9452090]();
            id v13 = *(id *)(a1 + 32);
            __int16 v14 = HMFGetOSLogHandle();
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
              goto LABEL_13;
            }
            __int16 v15 = HMFGetLogIdentifier();
            uint64_t v16 = [v3 device];
            uint64_t v17 = [v16 shortDescription];
            int v31 = 138543618;
            long long v32 = v15;
            __int16 v33 = 2114;
            long long v34 = v17;
            uint64_t v18 = "%{public}@Not adding unreachable device: %{public}@";
            goto LABEL_9;
          }
        }
        [*(id *)(a1 + 64) addObject:v3];
        id v30 = (id)[*(id *)(a1 + 32) _addMeshStorageResidentDevice:v3];
        goto LABEL_14;
      }
      __int16 v12 = (void *)MEMORY[0x1D9452090]();
      id v13 = *(id *)(a1 + 32);
      __int16 v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        __int16 v15 = HMFGetLogIdentifier();
        uint64_t v16 = [v3 device];
        uint64_t v17 = [v16 shortDescription];
        int v31 = 138543618;
        long long v32 = v15;
        __int16 v33 = 2114;
        long long v34 = v17;
        uint64_t v18 = "%{public}@Received a remove resident notification for device %{public}@";
LABEL_9:
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v31, 0x16u);

LABEL_12:
      }
    }
    else
    {
      __int16 v12 = (void *)MEMORY[0x1D9452090]();
      id v13 = *(id *)(a1 + 32);
      __int16 v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        __int16 v15 = HMFGetLogIdentifier();
        id v19 = [v3 device];
        uint64_t v20 = [v19 version];
        id v21 = (id)minimumSupportedResidentHomeKitVersion;
        uint64_t v22 = [v3 device];
        uint64_t v23 = [v22 shortDescription];
        int v31 = 138544130;
        long long v32 = v15;
        __int16 v33 = 2112;
        long long v34 = v20;
        __int16 v35 = 2112;
        id v36 = v21;
        __int16 v37 = 2114;
        id v38 = v23;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Device version %@ does not support required resident version %@: %{public}@", (uint8_t *)&v31, 0x2Au);

        goto LABEL_12;
      }
    }
  }
  else
  {
    __int16 v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = *(id *)(a1 + 32);
    __int16 v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      __int16 v15 = HMFGetLogIdentifier();
      uint64_t v16 = [v3 device];
      uint64_t v17 = [v16 shortDescription];
      int v31 = 138543618;
      long long v32 = v15;
      __int16 v33 = 2114;
      long long v34 = v17;
      uint64_t v18 = "%{public}@Device is not resident capable: %{public}@";
      goto LABEL_9;
    }
  }
LABEL_13:

LABEL_14:
}

uint64_t __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke_2_230(uint64_t a1, void *a2)
{
  return [a2 shortDescription];
}

- (void)_deviceIsNotReachable:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isCurrentDevice])
  {
    char v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v54 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Our device lost visibility to the rest of the world. Setting timeout before pulling the plug.", buf, 0xCu);
    }
    dispatch_time_t v9 = dispatch_time(0, 10000000000);
    int v10 = [(HMDResidentMesh *)v6 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__HMDResidentMesh__deviceIsNotReachable___block_invoke;
    block[3] = &unk_1E6A19B30;
    void block[4] = v6;
    dispatch_after(v9, v10, block);
  }
  else
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    int v11 = [(HMDResidentMesh *)self reachableAccessories];
    __int16 v12 = (void *)[v11 copy];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v47 objects:v57 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v48;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v48 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          uint64_t v18 = [v17 residentDevice];
          id v19 = [v18 device];
          int v20 = [v4 isEqual:v19];

          if (v20)
          {
            id v21 = (void *)MEMORY[0x1D9452090]();
            uint64_t v22 = self;
            uint64_t v23 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              uint64_t v24 = HMFGetLogIdentifier();
              uint64_t v25 = [v4 shortDescription];
              *(_DWORD *)buf = 138543618;
              __int16 v54 = v24;
              __int16 v55 = 2114;
              int v56 = v25;
              _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Removed device %{public}@ from resident storage", buf, 0x16u);
            }
            uint64_t v26 = [(HMDResidentMesh *)v22 reachableAccessories];
            [v26 removeObject:v17];

            goto LABEL_17;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v47 objects:v57 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_17:

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v27 = [(HMDResidentMesh *)self residents];
    long long v28 = (void *)[v27 copy];

    uint64_t v29 = [v28 countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v44;
      while (2)
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v44 != v31) {
            objc_enumerationMutation(v28);
          }
          __int16 v33 = *(void **)(*((void *)&v43 + 1) + 8 * j);
          long long v34 = [v33 residentDevice];
          __int16 v35 = [v34 device];
          int v36 = [v4 isEqual:v35];

          if (v36)
          {
            __int16 v37 = (void *)MEMORY[0x1D9452090]();
            id v38 = self;
            uint64_t v39 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              __int16 v40 = HMFGetLogIdentifier();
              char v41 = [v4 shortDescription];
              *(_DWORD *)buf = 138543618;
              __int16 v54 = v40;
              __int16 v55 = 2114;
              int v56 = v41;
              _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_INFO, "%{public}@Removed device %{public}@ from mesh storage", buf, 0x16u);
            }
            uint64_t v42 = [(HMDResidentMesh *)v38 residents];
            [v42 removeObject:v33];

            goto LABEL_29;
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v43 objects:v52 count:16];
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) messageDispatcher];
  id v3 = [v2 secureRemoteTransport];
  id v4 = [v3 deviceMonitor];
  char v5 = [v4 isReachable];

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = *(id *)(a1 + 32);
  id v8 = HMFGetOSLogHandle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      int v10 = HMFGetLogIdentifier();
      int v15 = 138543362;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Nope, we came back.", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    if (v9)
    {
      int v11 = HMFGetLogIdentifier();
      int v15 = 138543362;
      uint64_t v16 = v11;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Lost visibility to the rest of the world. Deconstructing the mesh entirely.", (uint8_t *)&v15, 0xCu);
    }
    [*(id *)(a1 + 32) setResident:0];
    __int16 v12 = [*(id *)(a1 + 32) residents];
    [v12 removeAllObjects];

    uint64_t v13 = [*(id *)(a1 + 32) reachableAccessories];
    [v13 removeAllObjects];

    uint64_t v14 = [MEMORY[0x1E4F1CAD0] set];
    [*(id *)(a1 + 32) setPrimaryResidentForHomes:v14];
  }
}

- (void)_handleAddUpdateOrReachabilityChangeForDevice:(id)a3
{
  id v3 = [(HMDResidentMesh *)self devicesChangedTimer];
  [v3 resume];
}

- (void)_updateAccessoryLinkQuality
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v3 = [(HMDResidentMesh *)self homeManager];
  id v4 = [v3 homes];

  obuint64_t j = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v37;
    uint64_t v26 = *(void *)v37;
    do
    {
      uint64_t v8 = 0;
      uint64_t v27 = v6;
      do
      {
        if (*(void *)v37 != v7) {
          objc_enumerationMutation(obj);
        }
        BOOL v9 = *(void **)(*((void *)&v36 + 1) + 8 * v8);
        if (objc_msgSend(v9, "isCurrentDeviceAvailableResident", v26))
        {
          uint64_t v30 = [v9 primaryResident];
          if (v30)
          {
            uint64_t v29 = v8;
            long long v34 = 0u;
            long long v35 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            id v31 = [v9 accessories];
            uint64_t v10 = [v31 countByEnumeratingWithState:&v32 objects:v40 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v12 = *(void *)v33;
              do
              {
                for (uint64_t i = 0; i != v11; ++i)
                {
                  if (*(void *)v33 != v12) {
                    objc_enumerationMutation(v31);
                  }
                  uint64_t v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
                  int v15 = [(HMDResidentMesh *)self resident];
                  uint64_t v16 = [v15 accessoryListWithLinkQuality];
                  uint64_t v17 = [v16 allKeys];
                  uint64_t v18 = [v14 identifier];
                  int v19 = [v17 containsObject:v18];

                  if (v19)
                  {
                    int v20 = [(HMDResidentMesh *)self _addResidentStorageResidentDevice:v30];
                    id v21 = v14;
                    objc_opt_class();
                    if (objc_opt_isKindOfClass()) {
                      uint64_t v22 = v21;
                    }
                    else {
                      uint64_t v22 = 0;
                    }
                    id v23 = v22;

                    if ([v23 hasBTLELink])
                    {
                      uint64_t v24 = [v20 accessoryListWithLinkQuality];
                      int v25 = [v20 _addAccessoryWithLinkQuality:v23 toList:v24];

                      if (v25) {
                        [v20 _transmitAfter:10.0];
                      }
                    }
                  }
                }
                uint64_t v11 = [v31 countByEnumeratingWithState:&v32 objects:v40 count:16];
              }
              while (v11);
            }

            uint64_t v7 = v26;
            uint64_t v6 = v27;
            uint64_t v8 = v29;
          }
        }
        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v6);
  }
}

- (void)timerDidFire:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDResidentMesh *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDResidentMesh *)self devicesChangedTimer];

  if (v6 == v4)
  {
    [(HMDResidentMesh *)self _buildResidentsWithElection:@"HMDResidentDeviceManagerAddResidentNotification" device:0];
  }
  else
  {
    id v7 = [(HMDResidentMesh *)self startupTimer];

    if (v7 == v4)
    {
      if ([(HMDResidentMesh *)self _checkReachabilityWithTimerActivation:0]&& (unint64_t v9 = [(HMDResidentMesh *)self startupTickCount], [(HMDResidentMesh *)self setStartupTickCount:v9 + 1], v9 < 4))
      {
        [v4 resume];
      }
      else
      {
        uint64_t v10 = (void *)MEMORY[0x1D9452090]();
        uint64_t v11 = self;
        uint64_t v12 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          long long v28 = v13;
          __int16 v29 = 2048;
          uint64_t v30 = [(HMDResidentMesh *)v11 startupTickCount];
          __int16 v31 = 2048;
          uint64_t v32 = 4;
          _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Can connect with all accessories (or we've timed out if %lu > %lu), broadcasting out.", buf, 0x20u);
        }
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v14 = [(HMDResidentMesh *)v11 reachableAccessories];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v23 != v17) {
                objc_enumerationMutation(v14);
              }
              int v19 = *(void **)(*((void *)&v22 + 1) + 8 * i);
              int v20 = [v19 accessoryUUIDs];
              uint64_t v21 = [v20 count];

              if (v21) {
                [v19 _transmitStatus:1];
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v16);
        }
      }
    }
    else
    {
      id v8 = [(HMDResidentMesh *)self linkQualityMonitorTimer];

      if (v8 == v4) {
        [(HMDResidentMesh *)self _updateAccessoryLinkQuality];
      }
    }
  }
}

- (void)_handlePrimaryResidentChangedNotification:(id)a3
{
  id v4 = [(HMDResidentMesh *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__HMDResidentMesh__handlePrimaryResidentChangedNotification___block_invoke;
  block[3] = &unk_1E6A19B30;
  void block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __61__HMDResidentMesh__handlePrimaryResidentChangedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _transmitCurrentDeviceMetricsToPrimaryResidentWithIsUrgent:1];
}

- (void)__deviceResidentChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDResidentMesh *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__HMDResidentMesh___deviceResidentChanged___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  unint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __43__HMDResidentMesh___deviceResidentChanged___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  char v19 = 0;
  id v2 = [*(id *)(a1 + 32) userInfo];
  LODWORD(v3) = objc_msgSend(v2, "hmf_BOOLForKey:isPresent:", @"kResidentEnabledKey", &v19);

  if (v19) {
    uint64_t v3 = v3;
  }
  else {
    uint64_t v3 = 1;
  }
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 40);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    long long v22 = v7;
    __int16 v23 = 1024;
    int v24 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Received notification that the current resident's enabled status is now %{BOOL}d", buf, 0x12u);
  }
  id v8 = [*(id *)(a1 + 40) resident];
  unint64_t v9 = v8;
  if (v8)
  {
    [v8 setEnabled:v3];
    if (v3) {
      [*(id *)(a1 + 40) _checkReachabilityWithTimerActivation:0];
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v10 = objc_msgSend(*(id *)(a1 + 40), "reachableAccessories", 0);
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
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__HMDResidentMesh___rebuildResidents___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  unint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __38__HMDResidentMesh___rebuildResidents___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) userInfo];
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
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = HMFGetOSLogHandle();
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
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Resident device changed (%{public}@ / %{public}@) notification.", (uint8_t *)&v15, 0x20u);
  }
  [*(id *)(a1 + 40) _buildResidentsWithElection:0 device:0];
}

- (void)__residentDeviceAddedOrUpdatedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDResidentMesh *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__HMDResidentMesh___residentDeviceAddedOrUpdatedNotification___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __62__HMDResidentMesh___residentDeviceAddedOrUpdatedNotification___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 valueForKey:@"HMDResidentDeviceManagerResidentDeviceNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = *(id *)(a1 + 40);
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    uint64_t v10 = [*(id *)(a1 + 32) name];
    uint64_t v11 = [v5 identifier];
    uint64_t v12 = [v11 UUIDString];
    int v15 = 138543874;
    long long v16 = v9;
    __int16 v17 = 2114;
    long long v18 = v10;
    __int16 v19 = 2114;
    int v20 = v12;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Resident device changed (%{public}@ / %{public}@) notification.", (uint8_t *)&v15, 0x20u);
  }
  uint64_t v13 = *(void **)(a1 + 40);
  uint64_t v14 = [v5 device];
  [v13 _handleAddUpdateOrReachabilityChangeForDevice:v14];
}

- (void)__residentDeviceRemovedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDResidentMesh *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__HMDResidentMesh___residentDeviceRemovedNotification___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __55__HMDResidentMesh___residentDeviceRemovedNotification___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 valueForKey:@"HMDResidentDeviceManagerResidentDeviceNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = *(id *)(a1 + 40);
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    uint64_t v10 = [*(id *)(a1 + 32) name];
    uint64_t v11 = [v5 device];
    uint64_t v12 = [v11 identifier];
    uint64_t v13 = [v12 UUIDString];
    int v17 = 138543874;
    long long v18 = v9;
    __int16 v19 = 2114;
    int v20 = v10;
    __int16 v21 = 2114;
    long long v22 = v13;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Resident device removed (%{public}@ / %{public}@) notification.", (uint8_t *)&v17, 0x20u);
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
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__HMDResidentMesh___deviceIsNotReachable___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __42__HMDResidentMesh___deviceIsNotReachable___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = *(id *)(a1 + 40);
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [v4 identifier];
    uint64_t v10 = [v9 UUIDString];
    int v11 = 138543618;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    uint64_t v14 = v10;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Device %{public}@ is NOT reachable (notification)", (uint8_t *)&v11, 0x16u);
  }
  [*(id *)(a1 + 40) _deviceIsNotReachable:v4];
}

- (void)__deviceIsReachable:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDResidentMesh *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__HMDResidentMesh___deviceIsReachable___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __39__HMDResidentMesh___deviceIsReachable___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = *(id *)(a1 + 40);
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [v4 identifier];
    uint64_t v10 = [v9 UUIDString];
    int v11 = 138543618;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    uint64_t v14 = v10;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Device %{public}@ is reachable (notification)", (uint8_t *)&v11, 0x16u);
  }
  [*(id *)(a1 + 40) _handleAddUpdateOrReachabilityChangeForDevice:v4];
}

- (void)__accessoryDidUpdateSuspendedState:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDResidentMesh *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__HMDResidentMesh___accessoryDidUpdateSuspendedState___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __54__HMDResidentMesh___accessoryDidUpdateSuspendedState___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  if (v4)
  {
    uint64_t v5 = [v4 suspendedState];
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = *(id *)(a1 + 40);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      uint64_t v10 = [v4 uuid];
      int v11 = HAPAccessorySuspendedStateDescription();
      uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isReachable"));
      int v13 = 138544130;
      uint64_t v14 = v9;
      __int16 v15 = 2114;
      long long v16 = v10;
      __int16 v17 = 2112;
      long long v18 = v11;
      __int16 v19 = 2112;
      int v20 = v12;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Accessory %{public}@ updated its suspended state to: '%@'. Reachable: '%@'", (uint8_t *)&v13, 0x2Au);
    }
    if (!v5 && ([v4 isReachable] & 1) == 0) {
      [*(id *)(a1 + 40) _removeConnectivityFromDeviceToAccessory:v4 activateTimer:1];
    }
  }
}

- (void)__accessoryIsNotReachable:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDResidentMesh *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__HMDResidentMesh___accessoryIsNotReachable___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __45__HMDResidentMesh___accessoryIsNotReachable___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = *(id *)(a1 + 40);
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [v4 uuid];
    int v10 = 138543618;
    int v11 = v8;
    __int16 v12 = 2114;
    int v13 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Accessory %{public}@ is NOT reachable (notification)", (uint8_t *)&v10, 0x16u);
  }
  [*(id *)(a1 + 40) _removeConnectivityFromDeviceToAccessory:v4 activateTimer:1];
}

- (void)__accessoryIsReachable:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDResidentMesh *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__HMDResidentMesh___accessoryIsReachable___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __42__HMDResidentMesh___accessoryIsReachable___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = *(id *)(a1 + 40);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [v4 uuid];
      int v10 = 138543618;
      int v11 = v8;
      __int16 v12 = 2114;
      int v13 = v9;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Accessory %{public}@ is reachable (notification)", (uint8_t *)&v10, 0x16u);
    }
    [*(id *)(a1 + 40) _addConnectivityFromDeviceToAccessory:v4 activateTimer:1];
  }
}

- (void)dealloc
{
  id v3 = [(HMDResidentMesh *)self messageDispatcher];
  [v3 deregisterReceiver:self];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)HMDResidentMesh;
  [(HMDResidentMesh *)&v5 dealloc];
}

- (HMDResidentMesh)initWithHomeManager:(id)a3 residentEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  v55[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v53.receiver = self;
  v53.super_class = (Class)HMDResidentMesh;
  id v7 = [(HMDResidentMesh *)&v53 init];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    residents = v7->_residents;
    v7->_residents = (NSMutableArray *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    reachableAccessories = v7->_reachableAccessories;
    v7->_reachableAccessories = (NSMutableArray *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    loadMetrics = v7->_loadMetrics;
    v7->_loadMetrics = (NSMutableDictionary *)v12;

    objc_storeWeak((id *)&v7->_homeManager, v6);
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"82455554-35AB-4772-B3A4-DCA0F933F5D3"];
    uuid = v7->_uuid;
    v7->_uuid = (NSUUID *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CAD0] set];
    primaryResidentForHomes = v7->_primaryResidentForHomes;
    v7->_primaryResidentForHomes = (NSSet *)v16;

    HMDispatchQueueNameString();
    id v18 = objc_claimAutoreleasedReturnValue();
    __int16 v19 = (const char *)[v18 UTF8String];
    int v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create(v19, v20);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v21;

    objc_storeWeak((id *)&v7->_resident, 0);
    uint64_t v23 = [v6 messageDispatcher];
    objc_storeWeak((id *)&v7->_messageDispatcher, v23);
    int v24 = v7->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__HMDResidentMesh_initWithHomeManager_residentEnabled___block_invoke;
    block[3] = &unk_1E6A19B58;
    uint64_t v25 = v7;
    char v51 = v25;
    BOOL v52 = v4;
    dispatch_sync(v24, block);
    uint64_t v26 = [objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:1 options:2.0];
    devicesChangedTimer = v25->_devicesChangedTimer;
    v25->_devicesChangedTimer = (HMFTimer *)v26;

    [(HMFTimer *)v25->_devicesChangedTimer setDelegate:v25];
    [(HMFTimer *)v25->_devicesChangedTimer setDelegateQueue:v7->_workQueue];
    if (v4)
    {
      v25->_startupTickCount = 0;
      uint64_t v28 = [objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:1 options:30.0];
      startupTimer = v25->_startupTimer;
      v25->_startupTimer = (HMFTimer *)v28;

      [(HMFTimer *)v25->_startupTimer setDelegate:v25];
      [(HMFTimer *)v25->_startupTimer setDelegateQueue:v7->_workQueue];
      [(HMFTimer *)v25->_startupTimer fire];
    }
    uint64_t v30 = [objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:4 options:600.0];
    linkQualityMonitorTimer = v25->_linkQualityMonitorTimer;
    v25->_linkQualityMonitorTimer = (HMFTimer *)v30;

    [(HMFTimer *)v25->_linkQualityMonitorTimer setDelegate:v25];
    [(HMFTimer *)v25->_linkQualityMonitorTimer setDelegateQueue:v7->_workQueue];
    [(HMFTimer *)v25->_linkQualityMonitorTimer resume];
    [(HMFTimer *)v25->_linkQualityMonitorTimer fire];
    uint64_t v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v32 addObserver:v25 selector:sel___accessoryIsReachable_ name:@"HMDAccessoryIsReachableNotification" object:0];

    uint64_t v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v33 addObserver:v25 selector:sel___accessoryIsNotReachable_ name:@"HMDAccessoryIsNotReachableNotification" object:0];

    long long v34 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v34 addObserver:v25 selector:sel___accessoryDidUpdateSuspendedState_ name:@"HMDHAPAccessoryUpdatedSuspendedState" object:0];

    long long v35 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v35 addObserver:v25 selector:sel___residentDeviceAddedOrUpdatedNotification_ name:@"HMDResidentDeviceManagerAddResidentNotification" object:0];

    long long v36 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v36 addObserver:v25 selector:sel___residentDeviceAddedOrUpdatedNotification_ name:@"HMDResidentDeviceManagerUpdateResidentNotification" object:0];

    long long v37 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v37 addObserver:v25 selector:sel___residentDeviceRemovedNotification_ name:@"HMDResidentDeviceManagerRemoveResidentNotification" object:0];

    long long v38 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v38 addObserver:v25 selector:sel___rebuildResidents_ name:@"HMDAccountAddedDeviceNotification" object:0];

    long long v39 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v39 addObserver:v25 selector:sel___rebuildResidents_ name:@"HMDDeviceUpdatedNotification" object:0];

    __int16 v40 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v40 addObserver:v25 selector:sel___rebuildResidents_ name:@"HMDAccountRemovedDeviceNotification" object:0];

    char v41 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v41 addObserver:v25 selector:sel___deviceResidentChanged_ name:@"HMDHomeManagerResidentEnabledChangedNotification" object:0];

    uint64_t v42 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v42 addObserver:v25 selector:sel__handlePrimaryResidentChangedNotification_ name:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" object:0];

    long long v43 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v43 addObserver:v25 selector:sel___deviceIsNotReachable_ name:@"HMDRemoteDeviceIsNotReachableNotification" object:0];

    long long v44 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v44 addObserver:v25 selector:sel___deviceIsReachable_ name:@"HMDRemoteDeviceIsReachableNotification" object:0];

    long long v45 = +[HMDRemoteMessagePolicy defaultPolicy];
    [v45 setRequiresAccountMessage:1];
    [v45 setRequiresSecureMessage:1];
    [v45 setTransportRestriction:-1];
    long long v46 = (void *)[v45 copy];
    v55[0] = v46;
    long long v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];
    [v23 registerForMessage:@"kDeviceMeshUpdateRequestKey" receiver:v25 policies:v47 selector:sel__handleMeshUpdateRequestMessage_];

    __int16 v54 = v46;
    long long v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
    [v23 registerForMessage:@"kDeviceMeshUpdateKey" receiver:v25 policies:v48 selector:sel__handleMeshUpdateMessage_];
  }
  return v7;
}

void __55__HMDResidentMesh_initWithHomeManager_residentEnabled___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _buildResidentsWithElection:0 device:0];
  id v2 = [*(id *)(a1 + 32) resident];
  id v3 = v2;
  if (v2)
  {
    [v2 setEnabled:*(unsigned __int8 *)(a1 + 40)];
  }
  else
  {
    BOOL v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543362;
      id v9 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@We do not have a current device (probably logged out from iCloud).", (uint8_t *)&v8, 0xCu);
    }
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t96 != -1) {
    dispatch_once(&logCategory__hmf_once_t96, &__block_literal_global_337_105386);
  }
  id v2 = (void *)logCategory__hmf_once_v97;
  return v2;
}

uint64_t __30__HMDResidentMesh_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v97;
  logCategory__hmf_once_id v97 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end