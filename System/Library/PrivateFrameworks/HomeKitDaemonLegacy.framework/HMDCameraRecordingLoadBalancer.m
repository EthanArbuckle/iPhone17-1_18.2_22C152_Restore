@interface HMDCameraRecordingLoadBalancer
+ (id)logCategory;
- (BOOL)_isDeviceB620InOdeonConfiguration:(id)a3;
- (BOOL)isReadyToRecordForCameraWithUUID:(id)a3;
- (HMDCameraRecordingLoadBalancer)initWithHomeManager:(id)a3 resourceUsageMonitor:(id)a4;
- (HMDHomeManager)homeManager;
- (HMFPreferences)preferences;
- (HMISystemResourceUsageMonitor)systemResourceUsageMonitor;
- (NSMutableDictionary)decisionsByCameraUUIDByDeviceUUID;
- (NSMutableDictionary)lastDecisionByCameraUUID;
- (NSMutableDictionary)readyToRecordByCameraUUIDString;
- (NSMutableDictionary)recordingSessionSummariesByCameraUUIDString;
- (id)_loadBalancingDecisionForCamera:(id)a3 deviceFilter:(id)a4;
- (id)_loadBalancingDescriptionFromSortedNodes:(id)a3;
- (id)loadBalancingDecisionForCamera:(id)a3 deviceFilter:(id)a4;
- (unint64_t)_jobSlotLimitForDevice:(id)a3;
- (unint64_t)numberOfActiveRecordingSessions;
- (void)_updateReadyToRecordMetric;
- (void)handleRecordingSessionForwardingFailureForDecision:(id)a3;
- (void)handleRecordingSessionForwardingSuccessForDecision:(id)a3;
- (void)handleResidentMeshInitialized:(id)a3;
- (void)recordingDidEndForCameraWithUUID:(id)a3;
- (void)recordingDidStartForCameraWithUUID:(id)a3;
- (void)removeDataForCameraWithUUID:(id)a3;
- (void)setNumberOfActiveRecordingSessions:(unint64_t)a3;
- (void)setPreferences:(id)a3;
- (void)setReadyToRecord:(BOOL)a3 forCameraWithUUID:(id)a4;
- (void)start;
- (void)systemResourceUsageDidChangeTo:(int64_t)a3;
@end

@implementation HMDCameraRecordingLoadBalancer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDecisionByCameraUUID, 0);
  objc_storeStrong((id *)&self->_decisionsByCameraUUIDByDeviceUUID, 0);
  objc_storeStrong((id *)&self->_readyToRecordByCameraUUIDString, 0);
  objc_storeStrong((id *)&self->_recordingSessionSummariesByCameraUUIDString, 0);
  objc_storeStrong((id *)&self->_systemResourceUsageMonitor, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_preferences, 0);
}

- (void)setNumberOfActiveRecordingSessions:(unint64_t)a3
{
  self->_numberOfActiveRecordingSessions = a3;
}

- (unint64_t)numberOfActiveRecordingSessions
{
  return self->_numberOfActiveRecordingSessions;
}

- (NSMutableDictionary)lastDecisionByCameraUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (NSMutableDictionary)decisionsByCameraUUIDByDeviceUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (NSMutableDictionary)readyToRecordByCameraUUIDString
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (NSMutableDictionary)recordingSessionSummariesByCameraUUIDString
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (HMISystemResourceUsageMonitor)systemResourceUsageMonitor
{
  return (HMISystemResourceUsageMonitor *)objc_getProperty(self, a2, 32, 1);
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (void)setPreferences:(id)a3
{
}

- (HMFPreferences)preferences
{
  return self->_preferences;
}

- (void)systemResourceUsageDidChangeTo:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1D9452090](self, a2);
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = systemResourceUsageLevelAsString();
    int v20 = 138543618;
    v21 = v8;
    __int16 v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating resource usage to %@", (uint8_t *)&v20, 0x16u);
  }
  v10 = [(HMDCameraRecordingLoadBalancer *)v6 homeManager];
  v11 = [v10 residentMesh];

  v12 = [MEMORY[0x1E4F69830] sharedInstance];
  uint64_t v13 = [v12 maxConcurrentAnalyzersForSystemResourceUsageLevel:a3];

  v14 = [NSNumber numberWithUnsignedInteger:v13];
  [v11 setMetricForCurrentDevice:@"numberOfFullJobSlots" withValue:v14 isUrgent:0];

  v15 = [MEMORY[0x1E4F69830] sharedInstance];
  [v15 maxAnalysisFPSForSystemResourceUsageLevel:a3];
  double v17 = v16;

  v18 = [NSNumber numberWithDouble:v17];
  [v11 setMetricForCurrentDevice:@"maximumAnalysisFPS" withValue:v18 isUrgent:0];

  v19 = [NSNumber numberWithInteger:a3];
  [v11 setMetricForCurrentDevice:@"systemResourceUsageLevel" withValue:v19 isUrgent:a3 == 3];
}

- (void)handleResidentMeshInitialized:(id)a3
{
  id v10 = a3;
  os_unfair_lock_lock_with_options();
  unint64_t v4 = [(HMDCameraRecordingLoadBalancer *)self numberOfActiveRecordingSessions];
  os_unfair_lock_unlock(&self->_lock);
  v5 = [(HMDCameraRecordingLoadBalancer *)self homeManager];
  v6 = [v5 residentMesh];
  v7 = [NSNumber numberWithUnsignedInteger:v4];
  [v6 setMetricForCurrentDevice:@"numberOfActiveRecordingSessions" withValue:v7 isUrgent:0];

  [(HMDCameraRecordingLoadBalancer *)self _updateReadyToRecordMetric];
  v8 = [(HMDCameraRecordingLoadBalancer *)self systemResourceUsageMonitor];
  v9 = [v8 getCurrentSystemResourceUsage];
  -[HMDCameraRecordingLoadBalancer systemResourceUsageDidChangeTo:](self, "systemResourceUsageDidChangeTo:", [v9 systemResourceUsageLevel]);
}

- (void)_updateReadyToRecordMetric
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t v4 = [(HMDCameraRecordingLoadBalancer *)self readyToRecordByCameraUUIDString];
  id v7 = (id)[v4 copy];

  os_unfair_lock_unlock(p_lock);
  v5 = [(HMDCameraRecordingLoadBalancer *)self homeManager];
  v6 = [v5 residentMesh];
  [v6 setMetricForCurrentDevice:@"readyToRecordByCameraUUIDString" withValue:v7 isUrgent:0];
}

- (id)_loadBalancingDescriptionFromSortedNodes:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    unint64_t v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_183613);
    v5 = NSString;
    v6 = [v4 componentsJoinedByString:@"\n"];
    id v7 = [v5 stringWithFormat:@"[\n%@\n]", v6];
  }
  else
  {
    id v7 = @"[]";
  }

  return v7;
}

id __75__HMDCameraRecordingLoadBalancer__loadBalancingDescriptionFromSortedNodes___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 metrics];
  unint64_t v4 = [v3 description];
  v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v21 = [v4 componentsSeparatedByCharactersInSet:v5];

  int v20 = (void *)[v21 mutableCopy];
  [v20 removeObject:&stru_1F2C9F1A8];
  v6 = [v20 componentsJoinedByString:@" "];
  id v7 = NSString;
  v19 = [v2 residentDevice];
  v18 = [v19 device];
  v8 = [v18 productInfo];
  [v8 productClass];
  v9 = HMFProductClassToString();
  id v10 = [v2 residentDevice];
  v11 = [v10 device];
  v12 = [v11 name];
  uint64_t v13 = [v2 residentDevice];

  v14 = [v13 device];
  v15 = [v14 identifier];
  double v16 = [v7 stringWithFormat:@"   ([%@] device: %@ (%@) / metrics: %@)", v9, v12, v15, v6];

  return v16;
}

- (unint64_t)_jobSlotLimitForDevice:(id)a3
{
  id v3 = [a3 productInfo];
  if ([v3 productClass] == 4) {
    unint64_t v4 = 5;
  }
  else {
    unint64_t v4 = 3;
  }

  return v4;
}

- (BOOL)_isDeviceB620InOdeonConfiguration:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v25 = [v3 home];
  unint64_t v4 = [v25 appleMediaAccessories];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __68__HMDCameraRecordingLoadBalancer__isDeviceB620InOdeonConfiguration___block_invoke;
  v30[3] = &unk_1E6A18D10;
  id v5 = v3;
  id v31 = v5;
  v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v30);
  if (v6)
  {
    id v22 = v5;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v4;
    uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v24 = *(void *)v27;
      v21 = v4;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v27 != v24) {
            objc_enumerationMutation(obj);
          }
          id v10 = [*(id *)(*((void *)&v26 + 1) + 8 * i) audioDestinationControllerData];
          v11 = [v10 destinationIdentifier];
          v12 = [v11 UUIDString];

          uint64_t v13 = [v6 audioDestination];
          v14 = [v13 identifier];
          if ([v12 isEqualToString:v14])
          {

LABEL_15:
            BOOL v19 = 1;
            unint64_t v4 = v21;
            goto LABEL_16;
          }
          v15 = [v25 mediaSystemForAppleMediaAccessory:v6];
          double v16 = [v15 audioDestination];
          double v17 = [v16 identifier];
          char v18 = [v12 isEqualToString:v17];

          if (v18) {
            goto LABEL_15;
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
        BOOL v19 = 0;
        unint64_t v4 = v21;
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v19 = 0;
    }
LABEL_16:

    id v5 = v22;
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

uint64_t __68__HMDCameraRecordingLoadBalancer__isDeviceB620InOdeonConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 homePodVariant] == 3)
  {
    unint64_t v4 = [v3 idsIdentifier];
    id v5 = [*(id *)(a1 + 32) device];
    v6 = [v5 deviceAddress];
    uint64_t v7 = [v6 idsIdentifier];
    uint64_t v8 = objc_msgSend(v4, "hmf_isEqualToUUID:", v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_loadBalancingDecisionForCamera:(id)a3 deviceFilter:(id)a4
{
  uint64_t v144 = *MEMORY[0x1E4F143B8];
  id v92 = a3;
  id v91 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  v105 = self;
  v6 = [(HMDCameraRecordingLoadBalancer *)self decisionsByCameraUUIDByDeviceUUID];
  id obj = [v6 allKeys];

  uint64_t v97 = [obj countByEnumeratingWithState:&v136 objects:v143 count:16];
  if (v97)
  {
    uint64_t v94 = *(void *)v137;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v137 != v94)
        {
          uint64_t v8 = v7;
          objc_enumerationMutation(obj);
          uint64_t v7 = v8;
        }
        uint64_t v100 = v7;
        uint64_t v102 = *(void *)(*((void *)&v136 + 1) + 8 * v7);
        v9 = [(HMDCameraRecordingLoadBalancer *)v105 decisionsByCameraUUIDByDeviceUUID];
        id v10 = [v9 objectForKeyedSubscript:v102];

        long long v134 = 0u;
        long long v135 = 0u;
        long long v132 = 0u;
        long long v133 = 0u;
        id v106 = [v10 allKeys];
        uint64_t v11 = [v106 countByEnumeratingWithState:&v132 objects:v142 count:16];
        if (v11)
        {
          uint64_t v108 = *(void *)v133;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v133 != v108) {
                objc_enumerationMutation(v106);
              }
              uint64_t v13 = *(void *)(*((void *)&v132 + 1) + 8 * i);
              v14 = [v10 objectForKeyedSubscript:v13];
              int v15 = [v14 isExpired];

              if (v15)
              {
                double v16 = (void *)MEMORY[0x1D9452090]();
                double v17 = v105;
                char v18 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
                {
                  BOOL v19 = HMFGetLogIdentifier();
                  int v20 = [v10 objectForKeyedSubscript:v13];
                  v21 = [v20 shortDescription];
                  *(_DWORD *)buf = 138543618;
                  *(void *)&buf[4] = v19;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v21;
                  _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Expiring cached HMDCameraRecordingLoadBalancerDecision: %@", buf, 0x16u);
                }
                [v10 setObject:0 forKeyedSubscript:v13];
              }
            }
            uint64_t v11 = [v106 countByEnumeratingWithState:&v132 objects:v142 count:16];
          }
          while (v11);
        }

        if (![v10 count])
        {
          id v22 = [(HMDCameraRecordingLoadBalancer *)v105 decisionsByCameraUUIDByDeviceUUID];
          [v22 setObject:0 forKeyedSubscript:v102];
        }
        uint64_t v7 = v100 + 1;
      }
      while (v100 + 1 != v97);
      uint64_t v97 = [obj countByEnumeratingWithState:&v136 objects:v143 count:16];
    }
    while (v97);
  }

  v23 = [(HMDCameraRecordingLoadBalancer *)v105 lastDecisionByCameraUUID];
  uint64_t v24 = [v92 uniqueIdentifier];
  v25 = [v23 objectForKeyedSubscript:v24];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__HMDCameraRecordingLoadBalancer__loadBalancingDecisionForCamera_deviceFilter___block_invoke;
  aBlock[3] = &unk_1E6A18820;
  id v26 = v92;
  id v129 = v26;
  v130 = v105;
  id v101 = v25;
  id v131 = v101;
  v103 = _Block_copy(aBlock);
  long long v27 = [v26 hapAccessory];
  long long v28 = [v27 bridge];
  long long v29 = v28;
  if (v28)
  {
    id v104 = v28;
  }
  else
  {
    id v104 = [v26 hapAccessory];
  }

  v30 = [(HMDCameraRecordingLoadBalancer *)v105 homeManager];
  id v31 = [v30 residentMesh];
  v32 = [v31 cameraRecordingAnalysisNodesForCameraAccessory:v104];
  id v107 = (id)[v32 mutableCopy];

  uint64_t v33 = [(HMDCameraRecordingLoadBalancer *)v105 preferences];
  v34 = [v33 preferenceForKey:@"loadBalancerOverrideAllowedDeviceNames"];

  v35 = [(HMDCameraRecordingLoadBalancer *)v105 preferences];
  v109 = [v35 preferenceForKey:@"loadBalancerOverrideDeniedDeviceNames"];

  v36 = [v34 value];
  if (v36)
  {
  }
  else
  {
    v37 = [v109 value];
    BOOL v38 = v37 == 0;

    if (v38)
    {
      v125[0] = MEMORY[0x1E4F143A8];
      v125[1] = 3221225472;
      v125[2] = __79__HMDCameraRecordingLoadBalancer__loadBalancingDecisionForCamera_deviceFilter___block_invoke_70;
      v125[3] = &unk_1E6A18848;
      id v126 = v26;
      id v127 = v91;
      v88 = _Block_copy(v125);
      v123[0] = MEMORY[0x1E4F143A8];
      v123[1] = 3221225472;
      v123[2] = __79__HMDCameraRecordingLoadBalancer__loadBalancingDecisionForCamera_deviceFilter___block_invoke_2;
      v123[3] = &unk_1E6A18870;
      id v124 = v88;
      id v89 = v88;
      v90 = [v107 indexesOfObjectsPassingTest:v123];
      [v107 removeObjectsAtIndexes:v90];

      goto LABEL_30;
    }
  }
  v39 = (void *)MEMORY[0x1D9452090]();
  v40 = v105;
  v41 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    v42 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v42;
    _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_INFO, "%{public}@Skipping applying exclusion filter because override is set.", buf, 0xCu);
  }
LABEL_30:
  v122[0] = MEMORY[0x1E4F143A8];
  v122[1] = 3221225472;
  v122[2] = __79__HMDCameraRecordingLoadBalancer__loadBalancingDecisionForCamera_deviceFilter___block_invoke_73;
  v122[3] = &unk_1E6A188C0;
  v122[4] = v105;
  v43 = objc_msgSend(v107, "na_map:", v122);
  v44 = [v34 value];

  if (v44)
  {
    v45 = [v34 value];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v46 = v45;
    }
    else {
      v46 = 0;
    }
    id v47 = v46;

    v48 = (void *)MEMORY[0x1D9452090]();
    v49 = v105;
    v50 = HMFGetOSLogHandle();
    v51 = v50;
    if (v47)
    {
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        v52 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v52;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v47;
        _os_log_impl(&dword_1D49D5000, v51, OS_LOG_TYPE_INFO, "%{public}@Applying load balancer override with allow list: %@", buf, 0x16u);
      }
      v120[0] = MEMORY[0x1E4F143A8];
      v120[1] = 3221225472;
      v120[2] = __79__HMDCameraRecordingLoadBalancer__loadBalancingDecisionForCamera_deviceFilter___block_invoke_78;
      v120[3] = &unk_1E6A188E8;
      id v121 = v47;
      uint64_t v53 = objc_msgSend(v43, "na_filter:", v120);

      v43 = (void *)v53;
    }
    else
    {
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        v98 = HMFGetLogIdentifier();
        v54 = [v34 value];
        v55 = objc_opt_class();
        id v95 = v55;
        v56 = [v34 value];
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v98;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v55;
        *(_WORD *)&buf[22] = 2112;
        v141 = v56;
        _os_log_impl(&dword_1D49D5000, v51, OS_LOG_TYPE_ERROR, "%{public}@Device names allow list was not an array (%@): %@", buf, 0x20u);
      }
    }
  }
  v57 = [v109 value];

  if (v57)
  {
    v58 = [v109 value];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v59 = v58;
    }
    else {
      v59 = 0;
    }
    id v60 = v59;

    v61 = (void *)MEMORY[0x1D9452090]();
    v62 = v105;
    v63 = HMFGetOSLogHandle();
    v64 = v63;
    if (v60)
    {
      if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
      {
        v65 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v65;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v60;
        _os_log_impl(&dword_1D49D5000, v64, OS_LOG_TYPE_INFO, "%{public}@Applying load balancer override with deny list: %@", buf, 0x16u);
      }
      v118[0] = MEMORY[0x1E4F143A8];
      v118[1] = 3221225472;
      v118[2] = __79__HMDCameraRecordingLoadBalancer__loadBalancingDecisionForCamera_deviceFilter___block_invoke_79;
      v118[3] = &unk_1E6A188E8;
      id v119 = v60;
      uint64_t v66 = objc_msgSend(v43, "na_filter:", v118);

      v43 = (void *)v66;
    }
    else
    {
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        v99 = HMFGetLogIdentifier();
        v67 = [v109 value];
        v68 = objc_opt_class();
        id v96 = v68;
        v69 = [v109 value];
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v99;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v68;
        *(_WORD *)&buf[22] = 2112;
        v141 = v69;
        _os_log_impl(&dword_1D49D5000, v64, OS_LOG_TYPE_ERROR, "%{public}@Device names deny list was not an array (%@): %@", buf, 0x20u);
      }
    }
  }
  v70 = [v43 sortedArrayUsingComparator:v103];

  v71 = (void *)MEMORY[0x1D9452090]();
  v72 = v105;
  v73 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
  {
    v74 = HMFGetLogIdentifier();
    v75 = [v26 uniqueIdentifier];
    v76 = [v75 UUIDString];
    v77 = [(HMDCameraRecordingLoadBalancer *)v72 _loadBalancingDescriptionFromSortedNodes:v70];
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v74;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v76;
    *(_WORD *)&buf[22] = 2112;
    v141 = v77;
    _os_log_impl(&dword_1D49D5000, v73, OS_LOG_TYPE_INFO, "%{public}@Residents sorted for camera (%@): %@", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LODWORD(v141) = 0;
  uint64_t v114 = 0;
  v115 = &v114;
  uint64_t v116 = 0x2020000000;
  int v117 = 0;
  v110[0] = MEMORY[0x1E4F143A8];
  v110[1] = 3221225472;
  v110[2] = __79__HMDCameraRecordingLoadBalancer__loadBalancingDecisionForCamera_deviceFilter___block_invoke_80;
  v110[3] = &unk_1E6A18910;
  v112 = buf;
  id v78 = v26;
  id v111 = v78;
  v113 = &v114;
  objc_msgSend(v70, "na_each:", v110);
  v79 = [HMDCameraRecordingLoadBalancerDecision alloc];
  v80 = [v78 uniqueIdentifier];
  uint64_t v81 = [v70 count];
  uint64_t v82 = *(int *)(*(void *)&buf[8] + 24);
  uint64_t v83 = *((int *)v115 + 6);
  v84 = [v70 firstObject];
  v85 = [MEMORY[0x1E4F1C9C8] now];
  v86 = [(HMDCameraRecordingLoadBalancerDecision *)v79 initWithCameraUUID:v80 numberOfAvailableDevices:v81 totalNumberOfJobSlots:v82 remainingNumberOfJobSlots:v83 analysisNode:v84 decisionDate:v85];

  _Block_object_dispose(&v114, 8);
  _Block_object_dispose(buf, 8);

  return v86;
}

uint64_t __79__HMDCameraRecordingLoadBalancer__loadBalancingDecisionForCamera_deviceFilter___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  id v104 = v5;
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  id v9 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;
  v103 = v9;

  v12 = [v8 residentDevice];
  uint64_t v13 = [v11 residentDevice];
  v109 = v12;
  id v111 = [v12 device];
  v112 = v13;
  uint64_t v14 = [v13 device];
  int v15 = [v8 metrics];
  uint64_t v16 = objc_msgSend(v15, "hmf_numberForKey:", @"numberOfActiveRecordingSessions");

  double v17 = [v11 metrics];
  uint64_t v18 = objc_msgSend(v17, "hmf_numberForKey:", @"numberOfActiveRecordingSessions");

  BOOL v19 = &unk_1F2DC9EE0;
  if (v16) {
    int v20 = (void *)v16;
  }
  else {
    int v20 = &unk_1F2DC9EE0;
  }
  if (v18) {
    BOOL v19 = (void *)v18;
  }
  v113 = v19;
  uint64_t v114 = v20;
  v21 = [v8 metrics];
  id v22 = objc_msgSend(v21, "hmf_dictionaryForKey:", @"recordingSessionSummaries");

  v23 = [v11 metrics];
  uint64_t v24 = objc_msgSend(v23, "hmf_dictionaryForKey:", @"recordingSessionSummaries");

  v25 = [v8 metrics];
  id v26 = objc_msgSend(v25, "hmf_numberForKey:", @"systemResourceUsageLevel");

  if (v26) {
    uint64_t v98 = [v26 integerValue];
  }
  else {
    uint64_t v98 = 0;
  }
  long long v27 = [v11 metrics];
  long long v28 = objc_msgSend(v27, "hmf_numberForKey:", @"systemResourceUsageLevel");

  v110 = (void *)v14;
  v105 = v26;
  uint64_t v100 = v28;
  if (v28) {
    objc_msgSend(a1[4], "uniqueIdentifier", objc_msgSend(v28, "integerValue"));
  }
  else {
  long long v29 = objc_msgSend(a1[4], "uniqueIdentifier", 0);
  }
  v30 = [v29 UUIDString];
  uint64_t v102 = v22;
  id v31 = [v22 objectForKeyedSubscript:v30];

  v32 = [a1[4] uniqueIdentifier];
  uint64_t v33 = [v32 UUIDString];
  id v101 = v24;
  v34 = [v24 objectForKeyedSubscript:v33];

  v35 = [v8 metrics];
  v36 = objc_msgSend(v35, "hmf_numberForKey:", @"numberOfFullJobSlots");

  v37 = [v11 metrics];
  BOOL v38 = objc_msgSend(v37, "hmf_numberForKey:", @"numberOfFullJobSlots");

  v39 = [v8 metrics];
  v40 = objc_msgSend(v39, "hmf_numberForKey:", @"numberOfPartialJobSlots");

  v41 = [v11 metrics];
  v115 = objc_msgSend(v41, "hmf_numberForKey:", @"numberOfPartialJobSlots");

  v99 = v40;
  if (v40)
  {
    unint64_t v42 = [a1[5] _jobSlotLimitForDevice:v111];
    uint64_t v43 = [v40 integerValue];
    uint64_t v44 = [v36 integerValue];
    if (v44 + v43 >= v42) {
      unint64_t v45 = v42;
    }
    else {
      unint64_t v45 = v44 + v43;
    }
    uint64_t v46 = [NSNumber numberWithInteger:v45];

    v36 = (void *)v46;
  }
  if (v115)
  {
    unint64_t v47 = [a1[5] _jobSlotLimitForDevice:v110];
    uint64_t v48 = [v115 integerValue];
    uint64_t v49 = [v38 integerValue];
    if (v49 + v48 >= v47) {
      unint64_t v50 = v47;
    }
    else {
      unint64_t v50 = v49 + v48;
    }
    uint64_t v51 = [NSNumber numberWithInteger:v50];

    BOOL v38 = (void *)v51;
  }
  uint64_t v108 = v36;
  uint64_t v52 = [v36 integerValue];
  uint64_t v53 = v52 - [v114 integerValue];
  id v107 = v38;
  uint64_t v54 = [v38 integerValue];
  uint64_t v55 = [v113 integerValue];
  if (v31) {
    uint64_t v56 = v53 + 1;
  }
  else {
    uint64_t v56 = v53;
  }
  if (v34) {
    uint64_t v57 = v54 - v55 + 1;
  }
  else {
    uint64_t v57 = v54 - v55;
  }
  v58 = [v8 metrics];
  unint64_t v59 = objc_msgSend(v58, "hmf_numberForKey:", @"maximumAnalysisFPS");

  id v60 = [v11 metrics];
  id v106 = objc_msgSend(v60, "hmf_numberForKey:", @"maximumAnalysisFPS");

  v61 = v109;
  int v62 = [a1[5] _isDeviceB620InOdeonConfiguration:v109];
  int v63 = [a1[5] _isDeviceB620InOdeonConfiguration:v112];
  if (v62 && (v63 & 1) == 0 && v57 > 0)
  {
    uint64_t v64 = 1;
LABEL_41:
    v65 = v111;
LABEL_42:
    uint64_t v66 = v110;
LABEL_43:
    v67 = v105;
    v68 = v115;
LABEL_44:
    v69 = (void *)v59;
    goto LABEL_45;
  }
  if (((v63 ^ 1 | v62) & 1) == 0 && v56 > 0)
  {
    uint64_t v64 = -1;
    goto LABEL_41;
  }
  v68 = v115;
  if (v31 && v98 <= 2 && v56 > 0)
  {
    uint64_t v64 = -1;
LABEL_54:
    uint64_t v66 = v110;
    v65 = v111;
    v67 = v105;
    goto LABEL_44;
  }
  if (v34 && v97 <= 2 && v57 > 0)
  {
    uint64_t v64 = 1;
    goto LABEL_54;
  }
  v71 = [v111 identifier];
  v72 = [a1[6] deviceUUID];
  int v73 = objc_msgSend(v71, "hmf_isEqualToUUID:", v72);

  if (v73 && v98 <= 2 && v56 > 0)
  {
    uint64_t v64 = -1;
    v61 = v109;
    goto LABEL_41;
  }
  uint64_t v66 = v110;
  v74 = [v110 identifier];
  v75 = [a1[6] deviceUUID];
  int v76 = objc_msgSend(v74, "hmf_isEqualToUUID:", v75);

  if (v76 && v97 <= 2 && v57 > 0)
  {
    uint64_t v64 = 1;
LABEL_63:
    v61 = v109;
    v65 = v111;
    goto LABEL_43;
  }
  if (!v108 || !v107)
  {
    if (v108)
    {
      BOOL v77 = v56 <= 0;
      v61 = v109;
      v65 = v111;
      v67 = v105;
      v68 = v115;
      if (!v77)
      {
        uint64_t v64 = -1;
        goto LABEL_44;
      }
      goto LABEL_82;
    }
    v61 = v109;
    v65 = v111;
    v67 = v105;
    v68 = v115;
    if (!v107 || v57 <= 0) {
      goto LABEL_82;
    }
LABEL_77:
    uint64_t v64 = 1;
    goto LABEL_44;
  }
  if (v56 >= 1 && v56 > v57)
  {
    uint64_t v64 = -1;
    goto LABEL_63;
  }
  v61 = v109;
  v67 = v105;
  v68 = v115;
  if (v57 > v56 && v57 > 0)
  {
    uint64_t v64 = 1;
    v65 = v111;
    goto LABEL_44;
  }
  BOOL v77 = v56 < 1;
  v65 = v111;
  if (!v77 && v57 >= 1)
  {
    v69 = (void *)v59;
    if (v59 > (unint64_t)v106) {
      goto LABEL_104;
    }
    if ((unint64_t)v106 > v59) {
      goto LABEL_77;
    }
  }
LABEL_82:
  v69 = (void *)v59;
  if (!v98
    || (!v97 ? (v77 = v98 < 3) : (v77 = 0), !v77 ? (char v78 = 0) : (char v78 = 1), (v64 = -1, v98 >= v97) && (v78 & 1) == 0))
  {
    if (!v97
      || (!v98 ? (v79 = v97 < 3) : (v79 = 0), !v79 ? (v80 = 0) : (v80 = 1), (uint64_t v64 = 1, v98 <= v97) && (v80 & 1) == 0))
    {
      uint64_t v64 = [v114 compare:v113];
      if (!v64)
      {
        if ([v65 isCurrentDevice])
        {
          uint64_t v64 = 1;
          goto LABEL_45;
        }
        if ([v110 isCurrentDevice])
        {
LABEL_104:
          uint64_t v64 = -1;
          goto LABEL_45;
        }
        uint64_t v81 = [v65 productInfo];
        uint64_t v82 = [v81 productClass];
        uint64_t v83 = [v110 productInfo];
        uint64_t v84 = [v83 productClass];

        if (v82 == v84) {
          goto LABEL_106;
        }
        id v89 = [v65 productInfo];
        uint64_t v90 = [v89 productClass];

        if (v90 == 4)
        {
          uint64_t v64 = -1;
          goto LABEL_110;
        }
        id v91 = [v110 productInfo];
        uint64_t v92 = [v91 productClass];

        if (v92 == 4)
        {
          uint64_t v64 = 1;
        }
        else
        {
          v93 = [v65 productInfo];
          uint64_t v94 = [v93 productClass];

          if (v94 != 3)
          {
            uint64_t v66 = v110;
            id v95 = [v110 productInfo];
            uint64_t v96 = [v95 productClass];

            v69 = (void *)v59;
            if (v96 != 3)
            {
LABEL_106:
              v85 = [v66 version];
              v86 = [v65 version];
              uint64_t v64 = [v85 compare:v86];

              v61 = v109;
              v67 = v105;
              v68 = v115;
              if (!v64)
              {
                v87 = [v65 identifier];
                v88 = [v66 identifier];
                uint64_t v64 = [v87 compare:v88];

                v68 = v115;
                v61 = v109;
              }
              goto LABEL_45;
            }
            uint64_t v64 = 1;
LABEL_110:
            v61 = v109;
            v67 = v105;
            v68 = v115;
            goto LABEL_45;
          }
          uint64_t v64 = -1;
        }
        v61 = v109;
        goto LABEL_42;
      }
    }
  }
LABEL_45:

  return v64;
}

uint64_t __79__HMDCameraRecordingLoadBalancer__loadBalancingDecisionForCamera_deviceFilter___block_invoke_70(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [v3 metrics];
  id v5 = [v4 objectForKeyedSubscript:@"readyToRecordByCameraUUIDString"];
  id v6 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v7 = [v6 UUIDString];
  id v8 = [v5 objectForKeyedSubscript:v7];

  if ([v8 BOOLValue])
  {
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = [v3 residentDevice];
    uint64_t v11 = (*(unsigned int (**)(uint64_t, void *))(v9 + 16))(v9, v10) ^ 1;
  }
  else
  {
    uint64_t v11 = 1;
  }

  return v11;
}

uint64_t __79__HMDCameraRecordingLoadBalancer__loadBalancingDecisionForCamera_deviceFilter___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

HMDCameraRecordingAnalysisNode *__79__HMDCameraRecordingLoadBalancer__loadBalancingDecisionForCamera_deviceFilter___block_invoke_73(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [*(id *)(a1 + 32) decisionsByCameraUUIDByDeviceUUID];
  id v5 = [v3 residentDevice];
  id v6 = [v5 device];
  uint64_t v7 = [v6 identifier];
  id v8 = [v4 objectForKeyedSubscript:v7];

  uint64_t v9 = [v3 metrics];
  uint64_t v10 = objc_msgSend(v9, "hmf_dictionaryForKey:", @"recordingSessionSummaries");
  uint64_t v11 = (void *)v10;
  v12 = (void *)MEMORY[0x1E4F1CC08];
  if (v10) {
    v12 = (void *)v10;
  }
  id v13 = v12;

  uint64_t v14 = (void *)[v13 mutableCopy];
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  int v39 = 0;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __79__HMDCameraRecordingLoadBalancer__loadBalancingDecisionForCamera_deviceFilter___block_invoke_2_74;
  v32[3] = &unk_1E6A18898;
  id v15 = v13;
  id v33 = v15;
  id v16 = v14;
  id v34 = v16;
  v35 = &v36;
  objc_msgSend(v8, "na_each:", v32);
  double v17 = [v3 metrics];
  uint64_t v18 = [v17 objectForKeyedSubscript:@"numberOfActiveRecordingSessions"];
  BOOL v19 = (void *)v18;
  int v20 = &unk_1F2DC9EE0;
  if (v18) {
    int v20 = (void *)v18;
  }
  id v21 = v20;

  id v22 = NSNumber;
  int v23 = [v21 intValue];
  uint64_t v24 = [v22 numberWithInt:(*((_DWORD *)v37 + 6) + v23)];
  v25 = [v3 metrics];
  id v26 = (void *)[v25 mutableCopy];

  [v26 setObject:v24 forKeyedSubscript:@"numberOfActiveRecordingSessions"];
  long long v27 = (void *)[v16 copy];
  [v26 setObject:v27 forKeyedSubscript:@"recordingSessionSummaries"];

  long long v28 = [HMDCameraRecordingAnalysisNode alloc];
  long long v29 = [v3 residentDevice];
  v30 = [(HMDCameraRecordingAnalysisNode *)v28 initWithResidentDevice:v29 metrics:v26];

  _Block_object_dispose(&v36, 8);
  return v30;
}

uint64_t __79__HMDCameraRecordingLoadBalancer__loadBalancingDecisionForCamera_deviceFilter___block_invoke_78(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 residentDevice];
  unint64_t v4 = [v3 device];
  id v5 = [v4 name];
  uint64_t v6 = [v2 containsObject:v5];

  return v6;
}

uint64_t __79__HMDCameraRecordingLoadBalancer__loadBalancingDecisionForCamera_deviceFilter___block_invoke_79(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 residentDevice];
  unint64_t v4 = [v3 device];
  id v5 = [v4 name];
  uint64_t v6 = [v2 containsObject:v5] ^ 1;

  return v6;
}

void __79__HMDCameraRecordingLoadBalancer__loadBalancingDecisionForCamera_deviceFilter___block_invoke_80(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [v3 metrics];
  uint64_t v5 = objc_msgSend(v4, "hmf_numberForKey:", @"numberOfActiveRecordingSessions");
  uint64_t v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = (void *)v5;
  }
  else {
    uint64_t v7 = &unk_1F2DC9EE0;
  }
  id v21 = v7;

  id v8 = [v3 metrics];
  uint64_t v9 = objc_msgSend(v8, "hmf_numberForKey:", @"numberOfFullJobSlots");
  uint64_t v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = (void *)v9;
  }
  else {
    uint64_t v11 = &unk_1F2DC9EE0;
  }
  id v12 = v11;

  uint64_t v13 = [v12 integerValue];
  uint64_t v14 = v13 - [v21 integerValue];
  LODWORD(v13) = [v12 integerValue];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v13;
  id v15 = [v3 metrics];

  id v16 = objc_msgSend(v15, "hmf_dictionaryForKey:", @"recordingSessionSummaries");

  double v17 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v18 = [v17 UUIDString];
  BOOL v19 = [v16 objectForKeyedSubscript:v18];

  if (v19) {
    uint64_t v20 = v14 + 1;
  }
  else {
    uint64_t v20 = v14;
  }
  if (v20 >= 1) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v20;
  }
}

void __79__HMDCameraRecordingLoadBalancer__loadBalancingDecisionForCamera_deviceFilter___block_invoke_2_74(void *a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = (void *)a1[4];
  id v9 = v3;
  uint64_t v5 = [v3 UUIDString];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    uint64_t v7 = (void *)a1[5];
    id v8 = [v9 UUIDString];
    [v7 setObject:MEMORY[0x1E4F1CC08] forKeyedSubscript:v8];

    ++*(_DWORD *)(*(void *)(a1[6] + 8) + 24);
  }
}

- (void)handleRecordingSessionForwardingFailureForDecision:(id)a3
{
  id v14 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v5 = [(HMDCameraRecordingLoadBalancer *)self decisionsByCameraUUIDByDeviceUUID];
  uint64_t v6 = [v14 deviceUUID];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = [(HMDCameraRecordingLoadBalancer *)self decisionsByCameraUUIDByDeviceUUID];
    id v9 = [v14 deviceUUID];
    uint64_t v10 = [v8 objectForKeyedSubscript:v9];
    uint64_t v11 = [v14 cameraUUID];
    [v10 setObject:0 forKeyedSubscript:v11];
  }
  id v12 = [(HMDCameraRecordingLoadBalancer *)self lastDecisionByCameraUUID];
  uint64_t v13 = [v14 cameraUUID];
  [v12 setObject:0 forKeyedSubscript:v13];

  os_unfair_lock_unlock(p_lock);
}

- (void)handleRecordingSessionForwardingSuccessForDecision:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  uint64_t v6 = os_unfair_lock_lock_with_options();
  uint64_t v7 = (void *)MEMORY[0x1D9452090](v6);
  id v8 = self;
  HMFGetOSLogHandle();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    int v26 = 138543618;
    long long v27 = v10;
    __int16 v28 = 2112;
    id v29 = v4;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling successful load balancing decision: %@", (uint8_t *)&v26, 0x16u);
  }
  uint64_t v11 = [v4 deviceUUID];
  BOOL v12 = v11 == 0;

  if (!v12)
  {
    uint64_t v13 = [(HMDCameraRecordingLoadBalancer *)v8 decisionsByCameraUUIDByDeviceUUID];
    id v14 = [v4 deviceUUID];
    id v15 = [v13 objectForKeyedSubscript:v14];
    BOOL v16 = v15 == 0;

    if (v16)
    {
      double v17 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v18 = [(HMDCameraRecordingLoadBalancer *)v8 decisionsByCameraUUIDByDeviceUUID];
      BOOL v19 = [v4 deviceUUID];
      [v18 setObject:v17 forKeyedSubscript:v19];
    }
    uint64_t v20 = [(HMDCameraRecordingLoadBalancer *)v8 decisionsByCameraUUIDByDeviceUUID];
    id v21 = [v4 deviceUUID];
    id v22 = [v20 objectForKeyedSubscript:v21];
    int v23 = [v4 cameraUUID];
    [v22 setObject:v4 forKeyedSubscript:v23];

    uint64_t v24 = [(HMDCameraRecordingLoadBalancer *)v8 lastDecisionByCameraUUID];
    v25 = [v4 cameraUUID];
    [v24 setObject:v4 forKeyedSubscript:v25];
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)loadBalancingDecisionForCamera:(id)a3 deviceFilter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v9 = [(HMDCameraRecordingLoadBalancer *)self _loadBalancingDecisionForCamera:v6 deviceFilter:v7];
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (void)removeDataForCameraWithUUID:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v5 = [(HMDCameraRecordingLoadBalancer *)self readyToRecordByCameraUUIDString];
  id v6 = [v4 UUIDString];
  [v5 setObject:0 forKeyedSubscript:v6];

  id v7 = [(HMDCameraRecordingLoadBalancer *)self recordingSessionSummariesByCameraUUIDString];
  id v8 = [v4 UUIDString];
  [v7 setObject:0 forKeyedSubscript:v8];

  id v9 = [(HMDCameraRecordingLoadBalancer *)self decisionsByCameraUUIDByDeviceUUID];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__HMDCameraRecordingLoadBalancer_removeDataForCameraWithUUID___block_invoke;
  v11[3] = &unk_1E6A187F8;
  id v10 = v4;
  id v12 = v10;
  objc_msgSend(v9, "na_each:", v11);

  os_unfair_lock_unlock(&self->_lock);
  [(HMDCameraRecordingLoadBalancer *)self _updateReadyToRecordMetric];
}

uint64_t __62__HMDCameraRecordingLoadBalancer_removeDataForCameraWithUUID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];
}

- (void)setReadyToRecord:(BOOL)a3 forCameraWithUUID:(id)a4
{
  BOOL v4 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    uint64_t v11 = HMFBooleanToString();
    int v15 = 138543874;
    BOOL v16 = v10;
    __int16 v17 = 2112;
    uint64_t v18 = v11;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Setting ready to record to %@ for camera with UUID %@", (uint8_t *)&v15, 0x20u);
  }
  os_unfair_lock_lock_with_options();
  id v12 = [NSNumber numberWithBool:v4];
  uint64_t v13 = [(HMDCameraRecordingLoadBalancer *)v8 readyToRecordByCameraUUIDString];
  id v14 = [v6 UUIDString];
  [v13 setObject:v12 forKeyedSubscript:v14];

  os_unfair_lock_unlock(&v8->_lock);
  [(HMDCameraRecordingLoadBalancer *)v8 _updateReadyToRecordMetric];
}

- (BOOL)isReadyToRecordForCameraWithUUID:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(HMDCameraRecordingLoadBalancer *)self readyToRecordByCameraUUIDString];
  id v7 = [v4 UUIDString];
  id v8 = [v6 objectForKeyedSubscript:v7];
  char v9 = [v8 BOOLValue];

  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (void)recordingDidEndForCameraWithUUID:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraRecordingLoadBalancer *)self homeManager];
  if (v5)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    if ([(HMDCameraRecordingLoadBalancer *)self numberOfActiveRecordingSessions])
    {
      [(HMDCameraRecordingLoadBalancer *)self setNumberOfActiveRecordingSessions:[(HMDCameraRecordingLoadBalancer *)self numberOfActiveRecordingSessions] - 1];
      unint64_t v7 = [(HMDCameraRecordingLoadBalancer *)self numberOfActiveRecordingSessions];
    }
    else
    {
      id v8 = (void *)MEMORY[0x1D9452090]();
      char v9 = self;
      HMFGetOSLogHandle();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        int v27 = 138543618;
        __int16 v28 = v11;
        __int16 v29 = 2112;
        id v30 = v4;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Got recordingDidEndForCamera: %@ with numberOfActiveRecordingSessions == 0", (uint8_t *)&v27, 0x16u);
      }
      unint64_t v7 = 0;
    }
    id v12 = [(HMDCameraRecordingLoadBalancer *)self recordingSessionSummariesByCameraUUIDString];
    uint64_t v13 = [v4 UUIDString];
    id v14 = [v12 objectForKeyedSubscript:v13];
    BOOL v15 = v14 == 0;

    if (v15)
    {
      BOOL v16 = (void *)MEMORY[0x1D9452090]();
      __int16 v17 = self;
      HMFGetOSLogHandle();
      uint64_t v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        __int16 v19 = HMFGetLogIdentifier();
        int v27 = 138543618;
        __int16 v28 = v19;
        __int16 v29 = 2112;
        id v30 = v4;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Got recordingDidEndForCamera: %@ with no corresponding entry in recordingSessionSummariesByCameraUUIDString", (uint8_t *)&v27, 0x16u);
      }
    }
    id v20 = [(HMDCameraRecordingLoadBalancer *)self recordingSessionSummariesByCameraUUIDString];
    uint64_t v21 = [v4 UUIDString];
    [v20 setObject:0 forKeyedSubscript:v21];

    id v22 = [(HMDCameraRecordingLoadBalancer *)self recordingSessionSummariesByCameraUUIDString];
    int v23 = (void *)[v22 copy];

    os_unfair_lock_unlock(p_lock);
    uint64_t v24 = [v5 residentMesh];
    v25 = [NSNumber numberWithUnsignedInteger:v7];
    [v24 setMetricForCurrentDevice:@"numberOfActiveRecordingSessions" withValue:v25 isUrgent:0];

    int v26 = [v5 residentMesh];
    [v26 setMetricForCurrentDevice:@"recordingSessionSummaries" withValue:v23 isUrgent:0];
  }
}

- (void)recordingDidStartForCameraWithUUID:(id)a3
{
  id v14 = a3;
  id v4 = [(HMDCameraRecordingLoadBalancer *)self homeManager];
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    [(HMDCameraRecordingLoadBalancer *)self setNumberOfActiveRecordingSessions:[(HMDCameraRecordingLoadBalancer *)self numberOfActiveRecordingSessions] + 1];
    unint64_t v6 = [(HMDCameraRecordingLoadBalancer *)self numberOfActiveRecordingSessions];
    unint64_t v7 = [(HMDCameraRecordingLoadBalancer *)self recordingSessionSummariesByCameraUUIDString];
    id v8 = [v14 UUIDString];
    [v7 setObject:MEMORY[0x1E4F1CC08] forKeyedSubscript:v8];

    char v9 = [(HMDCameraRecordingLoadBalancer *)self recordingSessionSummariesByCameraUUIDString];
    id v10 = (void *)[v9 copy];

    os_unfair_lock_unlock(p_lock);
    uint64_t v11 = [v4 residentMesh];
    id v12 = [NSNumber numberWithUnsignedInteger:v6];
    [v11 setMetricForCurrentDevice:@"numberOfActiveRecordingSessions" withValue:v12 isUrgent:0];

    uint64_t v13 = [v4 residentMesh];
    [v13 setMetricForCurrentDevice:@"recordingSessionSummaries" withValue:v10 isUrgent:0];
  }
}

- (void)start
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v4 = [(HMDCameraRecordingLoadBalancer *)self homeManager];
  [v3 addObserver:self selector:sel_handleResidentMeshInitialized_ name:@"HMDHomeManagerHomeDataLoadedNotification" object:v4];

  uint64_t v5 = [(HMDCameraRecordingLoadBalancer *)self systemResourceUsageMonitor];
  [v5 setDelegate:self];

  id v6 = [(HMDCameraRecordingLoadBalancer *)self systemResourceUsageMonitor];
  [v6 start];
}

- (HMDCameraRecordingLoadBalancer)initWithHomeManager:(id)a3 resourceUsageMonitor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HMDCameraRecordingLoadBalancer;
  id v8 = [(HMDCameraRecordingLoadBalancer *)&v21 init];
  char v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v8->_homeManager, v6);
    objc_storeStrong((id *)&v9->_systemResourceUsageMonitor, a4);
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    readyToRecordByCameraUUIDString = v9->_readyToRecordByCameraUUIDString;
    v9->_readyToRecordByCameraUUIDString = (NSMutableDictionary *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    recordingSessionSummariesByCameraUUIDString = v9->_recordingSessionSummariesByCameraUUIDString;
    v9->_recordingSessionSummariesByCameraUUIDString = (NSMutableDictionary *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    decisionsByCameraUUIDByDeviceUUID = v9->_decisionsByCameraUUIDByDeviceUUID;
    v9->_decisionsByCameraUUIDByDeviceUUID = (NSMutableDictionary *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
    lastDecisionByCameraUUID = v9->_lastDecisionByCameraUUID;
    v9->_lastDecisionByCameraUUID = (NSMutableDictionary *)v16;

    uint64_t v18 = [MEMORY[0x1E4F65530] sharedPreferences];
    preferences = v9->_preferences;
    v9->_preferences = (HMFPreferences *)v18;
  }
  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t28_183671 != -1) {
    dispatch_once(&logCategory__hmf_once_t28_183671, &__block_literal_global_109_183672);
  }
  id v2 = (void *)logCategory__hmf_once_v29_183673;
  return v2;
}

uint64_t __45__HMDCameraRecordingLoadBalancer_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v29_183673;
  logCategory__hmf_once_v29_183673 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end