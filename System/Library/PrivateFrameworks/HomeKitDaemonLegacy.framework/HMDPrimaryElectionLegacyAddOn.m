@interface HMDPrimaryElectionLegacyAddOn
+ (id)logCategory;
+ (int64_t)compareElectionVersions:(id)a3 otherVersion:(id)a4;
- (BOOL)isAtHome;
- (BOOL)isConfirming;
- (BOOL)residentIsPartOfTheCurrentMesh:(id)a3;
- (HMDPrimaryElectionLegacyAddOn)initWithContext:(id)a3;
- (HMDPrimaryResidentElectionAddOnDelegate)delegate;
- (HMDResidentDevice)preferredElector;
- (HMDResidentDeviceManagerContext)context;
- (HMFTimer)residentMonitorTimer;
- (NSHashTable)devicePreferenceDataSources;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)messageReceiveQueue;
- (id)_electionParameters;
- (id)_electionParameters:(void *)a1;
- (id)computePreferredElector:(unint64_t *)a3;
- (id)dumpState;
- (id)logIdentifier;
- (id)residentsInMesh;
- (uint64_t)compareCapabilities:(void *)a3 withCapabilities:;
- (void)__handleConfirmationRequest:(id)a3;
- (void)_confirmResidentDevice:(void *)a3 electionParameters:(void *)a4 againstDevices:(void *)a5 completionBlock:;
- (void)_handleConfirmResidentDevice:(id)a3;
- (void)_handleResidentElectionParameters:(id)a3;
- (void)_startMonitoringResident;
- (void)_stopMonitoringResident:(void *)a1;
- (void)_updateDischargingTimer:(void *)a1;
- (void)addDataSource:(id)a3;
- (void)atHomeLevelChanged:(int64_t)a3;
- (void)confirmAsResident;
- (void)confirmElector:(void *)a3 completionHandler:;
- (void)confirmOnAvailability;
- (void)confirmPrimaryResident;
- (void)confirmWithCompletionHandler:(id)a3;
- (void)handleBatteryLevelChange:(id)a3;
- (void)handleBatteryStateChange:(id)a3;
- (void)performElectionWithReason:(unint64_t)a3;
- (void)primaryResidentChanged:(id)a3 previousResidentDevice:(id)a4;
- (void)registerForMessages;
- (void)requestConfirmationForElector:(void *)a3 completionHandler:;
- (void)setConfirming:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setResidentMonitorTimer:(id)a3;
- (void)start;
- (void)stop;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDPrimaryElectionLegacyAddOn

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_devicePreferenceDataSources, 0);
  objc_storeStrong((id *)&self->_residentMonitorTimer, 0);
  objc_storeStrong((id *)&self->_preferredElector, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (HMDResidentDeviceManagerContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (HMDResidentDeviceManagerContext *)WeakRetained;
}

- (NSHashTable)devicePreferenceDataSources
{
  return self->_devicePreferenceDataSources;
}

- (void)setResidentMonitorTimer:(id)a3
{
}

- (HMFTimer)residentMonitorTimer
{
  return self->_residentMonitorTimer;
}

- (HMDResidentDevice)preferredElector
{
  return self->_preferredElector;
}

- (void)setConfirming:(BOOL)a3
{
  self->_confirming = a3;
}

- (BOOL)isConfirming
{
  return self->_confirming;
}

- (void)setDelegate:(id)a3
{
}

- (HMDPrimaryResidentElectionAddOnDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDPrimaryResidentElectionAddOnDelegate *)WeakRetained;
}

- (id)dumpState
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)logIdentifier
{
  v2 = [(HMDPrimaryElectionLegacyAddOn *)self context];
  v3 = [v2 home];
  v4 = [v3 uuid];
  v5 = [v4 UUIDString];

  return v5;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  v2 = [(HMDPrimaryElectionLegacyAddOn *)self context];
  v3 = [v2 queue];

  return (OS_dispatch_queue *)v3;
}

- (NSUUID)messageTargetUUID
{
  v2 = [(HMDPrimaryElectionLegacyAddOn *)self context];
  v3 = [v2 home];
  v4 = [v3 uuid];

  return (NSUUID *)v4;
}

- (void)addDataSource:(id)a3
{
  id v7 = a3;
  v4 = [(HMDPrimaryElectionLegacyAddOn *)self context];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 queue];
    dispatch_assert_queue_V2(v6);

    [(NSHashTable *)self->_devicePreferenceDataSources addObject:v7];
  }
}

- (void)atHomeLevelChanged:(int64_t)a3
{
  v5 = [(HMDPrimaryElectionLegacyAddOn *)self context];
  if (v5)
  {
    id v11 = v5;
    v6 = [v5 queue];
    dispatch_assert_queue_V2(v6);

    if ([v11 isCurrentDeviceAvailableResident])
    {
      id v7 = [MEMORY[0x1E4F65528] sharedManager];
      uint64_t v8 = [v7 batteryState];

      if (v8 == 1) {
        -[HMDPrimaryElectionLegacyAddOn _updateDischargingTimer:](self, a3);
      }
    }
    v5 = v11;
    if (a3 == 1)
    {
      v9 = [v11 primaryResidentDevice];
      int v10 = [v9 isCurrentDevice];

      v5 = v11;
      if (v10)
      {
        [(HMDPrimaryElectionLegacyAddOn *)self performElectionWithReason:6];
        v5 = v11;
      }
    }
  }
}

- (void)_updateDischargingTimer:(void *)a1
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v4 = [a1 context];
    v5 = v4;
    if (!v4)
    {
LABEL_15:

      return;
    }
    v6 = [v4 queue];
    dispatch_assert_queue_V2(v6);

    if (isAppleTV())
    {
      id v7 = (void *)MEMORY[0x1D9452090]();
      id v8 = a1;
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v10 = HMFGetLogIdentifier();
        int v25 = 138543362;
        v26 = v10;
        id v11 = "%{public}@We should only be pinging the resident on transient resident capable devices which are enabled";
LABEL_12:
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v25, 0xCu);

        goto LABEL_13;
      }
      goto LABEL_13;
    }
    if (([v5 isResidentSupported] & 1) == 0)
    {
      id v7 = (void *)MEMORY[0x1D9452090]();
      id v8 = a1;
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v10 = HMFGetLogIdentifier();
        int v25 = 138543362;
        v26 = v10;
        id v11 = "%{public}@We shouldn't ping if resident is not supported.";
        goto LABEL_12;
      }
LABEL_13:

LABEL_14:
      goto LABEL_15;
    }
    if (a2 == 1)
    {
      id v7 = (void *)MEMORY[0x1D9452090]();
      id v12 = a1;
      v13 = HMFGetOSLogHandle();
      double v14 = 1800.0;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v15 = HMFGetLogIdentifier();
        int v25 = 138543362;
        v26 = v15;
        v16 = "%{public}@Updating monitor timer since we are not at home and discharging";
LABEL_20:
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, v16, (uint8_t *)&v25, 0xCu);
      }
    }
    else
    {
      uint64_t v17 = [v5 atHomeLevel];
      id v7 = (void *)MEMORY[0x1D9452090]();
      id v18 = a1;
      v19 = HMFGetOSLogHandle();
      v13 = v19;
      if (v17 != 1)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          v24 = HMFGetLogIdentifier();
          int v25 = 138543362;
          v26 = v24;
          _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Battery state change does not require resetting the monitor timer.", (uint8_t *)&v25, 0xCu);
        }
        goto LABEL_14;
      }
      double v14 = 600.0;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v15 = HMFGetLogIdentifier();
        int v25 = 138543362;
        v26 = v15;
        v16 = "%{public}@Updating monitor timer since we are at home and discharging";
        goto LABEL_20;
      }
    }

    v20 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:13 options:v14];
    [a1 setResidentMonitorTimer:v20];

    v21 = [a1 residentMonitorTimer];
    [v21 setDelegate:a1];

    v22 = [v5 queue];
    v23 = [a1 residentMonitorTimer];
    [v23 setDelegateQueue:v22];

    -[HMDPrimaryElectionLegacyAddOn _startMonitoringResident](a1);
    goto LABEL_15;
  }
}

- (void)_startMonitoringResident
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [a1 context];
    v3 = v2;
    if (!v2)
    {
LABEL_14:

      return;
    }
    v4 = [v2 queue];
    dispatch_assert_queue_V2(v4);

    v5 = [v3 primaryResidentDevice];
    v6 = v5;
    if (v5)
    {
      id v7 = [v5 device];
      if (([v7 isCurrentDevice] & 1) == 0
        && [v3 isResidentSupported]
        && ([v3 isResidentEnabled] & 1) != 0)
      {
        int v8 = [v3 isOwnerUser];

        if (v8)
        {
          v9 = (void *)MEMORY[0x1D9452090]();
          id v10 = a1;
          id v11 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            id v12 = HMFGetLogIdentifier();
            int v14 = 138543618;
            v15 = v12;
            __int16 v16 = 2112;
            uint64_t v17 = v6;
            _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Start monitoring resident, %@", (uint8_t *)&v14, 0x16u);
          }
          v13 = [v10 residentMonitorTimer];
          [v13 resume];

          goto LABEL_13;
        }
      }
      else
      {
      }
    }
    -[HMDPrimaryElectionLegacyAddOn _stopMonitoringResident:](a1, v6);
LABEL_13:

    goto LABEL_14;
  }
}

- (void)_stopMonitoringResident:(void *)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v4 = [a1 context];
    v5 = v4;
    if (v4)
    {
      v6 = [v4 queue];
      dispatch_assert_queue_V2(v6);

      id v7 = (void *)MEMORY[0x1D9452090]();
      id v8 = a1;
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = HMFGetLogIdentifier();
        int v12 = 138543618;
        v13 = v10;
        __int16 v14 = 2112;
        id v15 = v3;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Stopping monitoring resident, %@", (uint8_t *)&v12, 0x16u);
      }
      id v11 = [v8 residentMonitorTimer];
      [v11 suspend];
    }
  }
}

- (void)_handleConfirmResidentDevice:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDPrimaryElectionLegacyAddOn *)self context];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 queue];
    dispatch_assert_queue_V2(v7);

    id v8 = [v6 currentResidentDevice];
    int v9 = [v6 isResidentSupported];
    int v10 = [v6 isOwnerUser];
    if (v9 && ([v8 isEnabled] & v10 & 1) != 0)
    {
      id v11 = [v4 remoteSourceDevice];
      int v12 = [v6 residentDeviceForDevice:v11];
      v33 = [v4 dictionaryForKey:@"kResidentElectionParametersKey"];
      v13 = [v6 primaryResidentDevice];
      __int16 v14 = (void *)MEMORY[0x1D9452090]();
      id v15 = self;
      uint64_t v16 = HMFGetOSLogHandle();
      uint64_t v17 = v16;
      if (v13)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          uint64_t v18 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v36 = v18;
          __int16 v37 = 2112;
          v38 = v12;
          _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Confirming current resident on behalf of %@", buf, 0x16u);
        }
        v34 = v13;
        v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
        v20 = v33;
        -[HMDPrimaryElectionLegacyAddOn _confirmResidentDevice:electionParameters:againstDevices:completionBlock:](v15, v12, v33, v19, 0);

        [v4 respondWithPayload:0];
      }
      else
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v36 = v29;
          _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@No primary resident for confirmation.", buf, 0xCu);
        }
        v30 = [v4 responseHandler];

        v20 = v33;
        if (v30)
        {
          v31 = [v4 responseHandler];
          v32 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
          ((void (**)(void, void *, void))v31)[2](v31, v32, 0);
        }
      }
    }
    else
    {
      v21 = (void *)MEMORY[0x1D9452090]();
      v22 = self;
      v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = HMFGetLogIdentifier();
        int v25 = HMFBooleanToString();
        [v8 isEnabled];
        v26 = HMFBooleanToString();
        uint64_t v27 = HMFBooleanToString();
        *(_DWORD *)buf = 138544130;
        v36 = v24;
        __int16 v37 = 2112;
        v38 = v25;
        __int16 v39 = 2112;
        v40 = v26;
        __int16 v41 = 2112;
        v42 = v27;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Current device is incapable of election and confirmation - Resident Supported: %@, Resident Enabled: %@, Owned Home: %@", buf, 0x2Au);
      }
      v28 = [v4 responseHandler];

      if (!v28) {
        goto LABEL_18;
      }
      id v11 = [v4 responseHandler];
      int v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
      ((void (**)(void, void *, void))v11)[2](v11, v12, 0);
    }

LABEL_18:
  }
}

- (void)_confirmResidentDevice:(void *)a3 electionParameters:(void *)a4 againstDevices:(void *)a5 completionBlock:
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v64 = a2;
  id v61 = a3;
  id v62 = a4;
  v65 = a5;
  if (a1)
  {
    id val = a1;
    int v9 = [a1 context];
    int v10 = v9;
    if (!v9)
    {
LABEL_48:

      goto LABEL_49;
    }
    id v11 = [v9 queue];
    dispatch_assert_queue_V2(v11);

    v63 = [v10 home];
    if (v63)
    {
      if (v64)
      {
        int v12 = [v63 accessories];
        v13 = (void *)[v12 copy];

        if (v13) {
          objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
        }
        else {
        v80 = [MEMORY[0x1E4F1CA48] array];
        }
        long long v108 = 0u;
        long long v109 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
        obuint64_t j = v13;
        uint64_t v22 = [obj countByEnumeratingWithState:&v106 objects:v126 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v107;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v107 != v23) {
                objc_enumerationMutation(obj);
              }
              int v25 = [*(id *)(*((void *)&v106 + 1) + 8 * i) uuid];
              v26 = [v25 UUIDString];
              [v80 addObject:v26];
            }
            uint64_t v22 = [obj countByEnumeratingWithState:&v106 objects:v126 count:16];
          }
          while (v22);
        }

        v124[0] = @"kHomeUUID";
        uint64_t v27 = [v63 uuid];
        v28 = [v27 UUIDString];
        v125[0] = v28;
        v124[1] = @"kAccessoriesListKey";
        v29 = (void *)[v80 copy];
        v125[1] = v29;
        v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v125 forKeys:v124 count:2];

        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v120 = 0x3032000000;
        v121 = __Block_byref_object_copy__116490;
        v122 = __Block_byref_object_dispose__116491;
        id v74 = v64;
        id v123 = v74;
        v104[0] = 0;
        v104[1] = v104;
        v104[2] = 0x3032000000;
        v104[3] = __Block_byref_object_copy__116490;
        v104[4] = __Block_byref_object_dispose__116491;
        id v105 = v61;
        v70 = [v10 primaryResidentDevice];
        if (v70)
        {
          v79 = objc_alloc_init(HMDLegacyPrimaryElectionConfirmationLogEvent);
          -[HMDLegacyPrimaryElectionConfirmationLogEvent setAvailableResidentCount:](v79, "setAvailableResidentCount:", [v62 count]);
          group = (HMDAssertionLogEvent *)dispatch_group_create();
          long long v100 = 0u;
          long long v101 = 0u;
          long long v102 = 0u;
          long long v103 = 0u;
          id v71 = v62;
          uint64_t v30 = [v71 countByEnumeratingWithState:&v100 objects:v118 count:16];
          if (v30)
          {
            uint64_t v73 = *(void *)v101;
            v66 = v10;
            do
            {
              uint64_t v76 = v30;
              for (uint64_t j = 0; j != v76; ++j)
              {
                if (*(void *)v101 != v73) {
                  objc_enumerationMutation(v71);
                }
                v32 = *(void **)(*((void *)&v100 + 1) + 8 * j);
                if ([v74 isEqual:v32])
                {
                  [(HMDLegacyPrimaryElectionConfirmationLogEvent *)v79 setAvailableResidentCount:[(HMDLegacyPrimaryElectionConfirmationLogEvent *)v79 availableResidentCount]- 1];
                }
                else
                {
                  id v99 = (id)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Confirm against other resident"];
                  dispatch_group_enter(&group->super.super);
                  objc_initWeak(&location, val);
                  aBlock[0] = MEMORY[0x1E4F143A8];
                  aBlock[1] = 3221225472;
                  aBlock[2] = __106__HMDPrimaryElectionLegacyAddOn__confirmResidentDevice_electionParameters_againstDevices_completionBlock___block_invoke;
                  aBlock[3] = &unk_1E6A0FF10;
                  objc_copyWeak(&v97, &location);
                  id v33 = v10;
                  id v89 = v33;
                  id v90 = v99;
                  v91 = v32;
                  v92 = v79;
                  p_long long buf = &buf;
                  v96 = v104;
                  id v93 = v70;
                  v94 = group;
                  v78 = (void (**)(void *, void, void *))_Block_copy(aBlock);
                  v34 = [v32 device];
                  char v35 = [v34 isCurrentDevice];

                  if (v35)
                  {
                    v36 = (void *)MEMORY[0x1D9452090]();
                    id v37 = val;
                    HMFGetOSLogHandle();
                    v38 = (id)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                    {
                      HMFGetLogIdentifier();
                      id v39 = (id)objc_claimAutoreleasedReturnValue();
                      v40 = [v99 identifier];
                      __int16 v41 = [v40 shortDescription];
                      *(_DWORD *)v110 = 138543618;
                      id v111 = v39;
                      __int16 v112 = 2114;
                      v113 = v41;
                      _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Confirming against current device", v110, 0x16u);
                    }
                    -[HMDPrimaryElectionLegacyAddOn _electionParameters:](v37, v80);
                    v42 = (HMDRemoteDeviceMessageDestination *)objc_claimAutoreleasedReturnValue();
                    v78[2](v78, 0, v42);
                  }
                  else
                  {
                    uint64_t v43 = [HMDRemoteDeviceMessageDestination alloc];
                    v44 = [val messageTargetUUID];
                    v45 = [v32 device];
                    v42 = [(HMDRemoteDeviceMessageDestination *)v43 initWithTarget:v44 device:v45];

                    v46 = +[HMDRemoteMessage secureMessageWithName:@"kResidentElectionParametersInternalRequestKey" destination:v42 messagePayload:v67];
                    context = (void *)MEMORY[0x1D9452090]([v46 setResponseHandler:v78]);
                    id v47 = val;
                    HMFGetOSLogHandle();
                    v48 = (id)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
                    {
                      HMFGetLogIdentifier();
                      id v68 = (id)objc_claimAutoreleasedReturnValue();
                      v49 = [v99 identifier];
                      v50 = [v49 shortDescription];
                      v51 = [v32 shortDescription];
                      v52 = [v46 shortDescription];
                      *(_DWORD *)v110 = 138544130;
                      id v111 = v68;
                      __int16 v112 = 2114;
                      v113 = v50;
                      __int16 v114 = 2112;
                      v115 = v51;
                      __int16 v116 = 2112;
                      v117 = v52;
                      _os_log_impl(&dword_1D49D5000, v48, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Confirming against resident capable device %@ with message: %@", v110, 0x2Au);

                      int v10 = v66;
                    }

                    v53 = [v33 messageDispatcher];
                    [v53 sendMessage:v46];
                  }
                  objc_destroyWeak(&v97);
                  objc_destroyWeak(&location);
                  __HMFActivityScopeLeave();
                }
              }
              uint64_t v30 = [v71 countByEnumeratingWithState:&v100 objects:v118 count:16];
            }
            while (v30);
          }

          v54 = [v10 queue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __106__HMDPrimaryElectionLegacyAddOn__confirmResidentDevice_electionParameters_againstDevices_completionBlock___block_invoke_50;
          block[3] = &unk_1E6A184D8;
          id v82 = v70;
          id v83 = v10;
          id v84 = val;
          v86 = v65;
          v87 = &buf;
          v85 = v79;
          v55 = v79;
          dispatch_group_notify(&group->super.super, v54, block);
        }
        else
        {
          v56 = (void *)MEMORY[0x1D9452090]();
          id v57 = val;
          HMFGetOSLogHandle();
          v58 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT))
          {
            v59 = HMFGetLogIdentifier();
            *(_DWORD *)v110 = 138543362;
            id v111 = v59;
            _os_log_impl(&dword_1D49D5000, v58, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Current resident cannot be determined", v110, 0xCu);
          }
          group = [[HMDAssertionLogEvent alloc] initWithReason:@"Current resident cannot be determined"];
          v60 = +[HMDMetricsManager sharedLogEventSubmitter];
          [v60 submitLogEvent:group];

          if (v65) {
            v65[2]();
          }
        }

        _Block_object_dispose(v104, 8);
        _Block_object_dispose(&buf, 8);

        goto LABEL_47;
      }
      uint64_t v18 = (void *)MEMORY[0x1D9452090]();
      id v19 = a1;
      v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = HMFGetLogIdentifier();
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v21;
        _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Cancelling confirmation: device to confirm is not specified", (uint8_t *)&buf, 0xCu);
      }
      if (!v65) {
        goto LABEL_47;
      }
    }
    else
    {
      __int16 v14 = (void *)MEMORY[0x1D9452090]();
      id v15 = a1;
      uint64_t v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = HMFGetLogIdentifier();
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v17;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Returning early from confirming as resident since home does not exist", (uint8_t *)&buf, 0xCu);
      }
      if (!v65) {
        goto LABEL_47;
      }
    }
    v65[2]();
LABEL_47:

    goto LABEL_48;
  }
LABEL_49:
}

void __106__HMDPrimaryElectionLegacyAddOn__confirmResidentDevice_electionParameters_againstDevices_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    int v9 = [WeakRetained context];

    if (v9)
    {
      int v10 = [*(id *)(a1 + 32) queue];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __106__HMDPrimaryElectionLegacyAddOn__confirmResidentDevice_electionParameters_againstDevices_completionBlock___block_invoke_2;
      v14[3] = &unk_1E6A0FEE8;
      objc_copyWeak(&v23, (id *)(a1 + 96));
      id v15 = v5;
      id v11 = *(id *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 48);
      v13 = *(void **)(a1 + 56);
      id v16 = v11;
      uint64_t v17 = v12;
      id v18 = v13;
      long long v22 = *(_OWORD *)(a1 + 80);
      id v19 = v6;
      id v20 = *(id *)(a1 + 64);
      id v21 = *(id *)(a1 + 72);
      dispatch_async(v10, v14);

      objc_destroyWeak(&v23);
    }
  }
}

- (id)_electionParameters:(void *)a1
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    id v5 = [a1 context];
    if (v5)
    {
      v28 = a1;
      objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
      uint64_t v30 = v29 = v4;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v6 = v4;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
      if (v7)
      {
        v2 = (void *)v7;
        uint64_t v8 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v2; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v32 != v8) {
              objc_enumerationMutation(v6);
            }
            uint64_t v10 = *(void *)(*((void *)&v31 + 1) + 8 * i);
            id v11 = [v5 home];
            uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v10];
            v13 = [v11 accessoryWithUUID:v12];

            id v14 = v13;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v15 = v14;
            }
            else {
              id v15 = 0;
            }
            unint64_t v16 = v15;

            id v17 = v14;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v18 = v17;
            }
            else {
              id v18 = 0;
            }
            unint64_t v19 = v18;

            if (v16 | v19)
            {
              if ([v17 isReachable]) {
                id v20 = &unk_1F2DC8908;
              }
              else {
                id v20 = &unk_1F2DC8920;
              }
              [v30 setObject:v20 forKey:v10];
            }
          }
          v2 = (void *)[v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
        }
        while (v2);
      }

      v36[0] = v30;
      v35[0] = @"kAccessoriesListKey";
      v35[1] = @"kEnabledKey";
      id v21 = NSNumber;
      int v22 = [v5 isResidentSupported];
      if (v22)
      {
        v2 = [v5 currentResidentDevice];
        uint64_t v23 = [v2 isEnabled];
      }
      else
      {
        uint64_t v23 = 0;
      }
      id v4 = v29;
      int v25 = [v21 numberWithInt:v23];
      v36[1] = v25;
      v35[2] = @"kAtHomeStateKey";
      v26 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v28, "isAtHome"));
      v36[2] = v26;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];

      if (v22) {
    }
      }
    else
    {
      v24 = (void *)MEMORY[0x1E4F1CC08];
    }
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

uint64_t __106__HMDPrimaryElectionLegacyAddOn__confirmResidentDevice_electionParameters_againstDevices_completionBlock___block_invoke_50(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 40) primaryResidentDevice];
  char v3 = HMFEqualObjects();

  if (v3)
  {
    if ((HMFEqualObjects() & 1) == 0) {
      [*(id *)(a1 + 56) setChangedPrimary:1];
    }
    id v4 = [*(id *)(a1 + 48) delegate];
    [v4 primaryElectionAddOn:*(void *)(a1 + 48) didElectPrimaryResident:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) confirmed:1 electionLogEvent:*(void *)(a1 + 56)];

    uint64_t result = *(void *)(a1 + 64);
    if (result)
    {
      id v6 = *(uint64_t (**)(void))(result + 16);
      return v6();
    }
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 48);
    int v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = [*(id *)(a1 + 40) primaryResidentDevice];
      int v13 = 138543874;
      id v14 = v10;
      __int16 v15 = 2112;
      uint64_t v16 = v11;
      __int16 v17 = 2112;
      id v18 = v12;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Cancelling confirmation: resident device has changed from %@ to %@", (uint8_t *)&v13, 0x20u);
    }
    uint64_t result = *(void *)(a1 + 64);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

void __106__HMDPrimaryElectionLegacyAddOn__confirmResidentDevice_electionParameters_againstDevices_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  if (*(void *)(a1 + 32))
  {
    char v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = WeakRetained;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      uint64_t v7 = [*(id *)(a1 + 40) identifier];
      id v8 = [v7 shortDescription];
      int v9 = [*(id *)(a1 + 48) shortDescription];
      uint64_t v10 = *(void **)(a1 + 32);
      *(_DWORD *)long long buf = 138544130;
      id v82 = v6;
      __int16 v83 = 2114;
      id v84 = v8;
      __int16 v85 = 2112;
      v86 = v9;
      __int16 v87 = 2112;
      v88 = v10;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Failed to get election parameters from resident device %@: %@", buf, 0x2Au);
    }
    goto LABEL_32;
  }
  objc_msgSend(*(id *)(a1 + 56), "setResidentsRespondedCount:", objc_msgSend(*(id *)(a1 + 56), "residentsRespondedCount") + 1);
  unint64_t v80 = 0;
  uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
  uint64_t v12 = *(void **)(a1 + 48);
  int v13 = *(void **)(a1 + 64);
  id v14 = *(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  id v15 = v11;
  id v16 = v12;
  id v17 = v13;
  if (!WeakRetained)
  {
    uint64_t v29 = 0;
    goto LABEL_24;
  }
  id v18 = [WeakRetained context];
  if (v18)
  {
    v79 = v14;
    id v75 = v15;
    uint64_t v19 = [[HMDResidentDeviceElectionParameters alloc] initWithResident:v14 dictionaryRepresentation:v15];
    id v76 = v17;
    id v20 = [[HMDResidentDeviceElectionParameters alloc] initWithResident:v16 dictionaryRepresentation:v17];
    unint64_t v80 = 1;
    v78 = v19;
    uint64_t v21 = [(HMDResidentDeviceElectionParameters *)v19 isEnabled];
    v77 = v20;
    uint64_t v22 = [(HMDResidentDeviceElectionParameters *)v20 isEnabled];
    uint64_t v23 = (void *)MEMORY[0x1D9452090]();
    id v24 = WeakRetained;
    int v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543874;
      id v82 = v26;
      __int16 v83 = 2112;
      id v84 = (HMDResidentDeviceElectionParameters *)v21;
      __int16 v85 = 2112;
      v86 = (HMDResidentDeviceElectionParameters *)v22;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Comparing enabled status: %@ -> %@", buf, 0x20u);
    }
    if (!(v21 | v22)
      || (!v21 ? (uint64_t v27 = (void *)v22, v28 = 0) : (uint64_t v27 = (void *)v21, v28 = v22),
          (uint64_t v29 = [v27 compare:v28]) == 0))
    {

      unint64_t v80 = 2;
      uint64_t v30 = [v79 device];
      long long v31 = [v30 capabilities];

      long long v32 = [v16 device];
      long long v33 = [v32 capabilities];

      long long v34 = (void *)MEMORY[0x1D9452090]();
      id v35 = v24;
      v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        id v37 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543874;
        id v82 = v37;
        __int16 v83 = 2112;
        id v84 = v31;
        __int16 v85 = 2112;
        v86 = v33;
        _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_DEBUG, "%{public}@Comparing capabilities status: %@ -> %@", buf, 0x20u);
      }
      uint64_t v29 = -[HMDPrimaryElectionLegacyAddOn compareCapabilities:withCapabilities:]((uint64_t)v35, v31, v33);

      id v14 = v79;
      id v17 = v76;
      if (v29) {
        goto LABEL_22;
      }
      uint64_t v38 = (void *)MEMORY[0x1D9452090]();
      id v39 = v35;
      v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        __int16 v41 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543874;
        id v82 = v41;
        __int16 v83 = 2112;
        id v84 = v78;
        __int16 v85 = 2112;
        v86 = v77;
        _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_DEBUG, "%{public}@Comparing parameters: %@ -> %@", buf, 0x20u);
      }
      uint64_t v29 = [(HMDResidentDeviceElectionParameters *)v78 compare:v77 outCriteria:&v80];
      if (v29) {
        goto LABEL_22;
      }
      unint64_t v80 = 8;
      v52 = [v79 device];
      uint64_t v21 = [v52 version];

      v53 = [v16 device];
      uint64_t v22 = [v53 version];

      v54 = (void *)MEMORY[0x1D9452090]();
      id v55 = v39;
      v56 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
      {
        id v57 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543874;
        id v82 = v57;
        __int16 v83 = 2112;
        id v84 = (HMDResidentDeviceElectionParameters *)v21;
        __int16 v85 = 2112;
        v86 = (HMDResidentDeviceElectionParameters *)v22;
        _os_log_impl(&dword_1D49D5000, v56, OS_LOG_TYPE_DEBUG, "%{public}@Comparing election versions: %@ -> %@", buf, 0x20u);
      }
      int64_t v58 = +[HMDPrimaryElectionLegacyAddOn compareElectionVersions:v21 otherVersion:v22];
      if (v58)
      {
        uint64_t v29 = v58;
      }
      else
      {
        unint64_t v80 = 10;
        v59 = [v18 primaryResidentDevice];
        v60 = (void *)MEMORY[0x1D9452090]();
        id v61 = v55;
        id v62 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          id v74 = v70 = v61;
          v63 = [v59 shortDescription];
          [v79 shortDescription];
          id v71 = v60;
          id v64 = (HMDResidentDeviceElectionParameters *)objc_claimAutoreleasedReturnValue();
          [v16 shortDescription];
          v65 = v72 = v59;
          *(_DWORD *)long long buf = 138544130;
          id v82 = v74;
          __int16 v83 = 2112;
          id v84 = v63;
          __int16 v85 = 2112;
          v86 = v64;
          __int16 v87 = 2112;
          v88 = v65;
          _os_log_impl(&dword_1D49D5000, v62, OS_LOG_TYPE_DEBUG, "%{public}@Comparing current primary %@: %@ -> %@", buf, 0x2Au);

          v59 = v72;
          v60 = v71;

          id v61 = v70;
        }

        if ([v59 isEqual:v79])
        {
          uint64_t v29 = 1;
        }
        else if ([v59 isEqual:v16])
        {
          uint64_t v29 = -1;
        }
        else
        {
          v66 = (void *)MEMORY[0x1D9452090]();
          id v67 = v61;
          id v68 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v69 = uint64_t v73 = v59;
            *(_DWORD *)long long buf = 138543362;
            id v82 = v69;
            _os_log_impl(&dword_1D49D5000, v68, OS_LOG_TYPE_DEBUG, "%{public}@Comparing, equivalent", buf, 0xCu);

            v59 = v73;
          }

          uint64_t v29 = 0;
          unint64_t v80 = 0;
        }
      }
    }

    id v14 = v79;
    id v17 = v76;
LABEL_22:

    id v15 = v75;
    goto LABEL_23;
  }
  uint64_t v29 = 0;
LABEL_23:

LABEL_24:
  if (v29 == -1)
  {
    v42 = (void *)MEMORY[0x1D9452090]();
    id v43 = WeakRetained;
    v44 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      v45 = HMFGetLogIdentifier();
      v46 = [*(id *)(a1 + 40) identifier];
      id v47 = [v46 shortDescription];
      v48 = *(HMDResidentDeviceElectionParameters **)(a1 + 48);
      v49 = *(void **)(a1 + 72);
      *(_DWORD *)long long buf = 138544130;
      id v82 = v45;
      __int16 v83 = 2114;
      id v84 = v47;
      __int16 v85 = 2112;
      v86 = v48;
      __int16 v87 = 2112;
      v88 = v49;
      _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Preferring device: %@ over current primary resident: %@", buf, 0x2Au);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), *(id *)(a1 + 48));
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), *(id *)(a1 + 64));
  }
  if (v80 > 0x11) {
    v50 = @"unknown reason";
  }
  else {
    v50 = off_1E6A0CFC0[v80];
  }
  v51 = v50;
  [*(id *)(a1 + 56) setCriteria:v51];

LABEL_32:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 80));
}

- (uint64_t)compareCapabilities:(void *)a3 withCapabilities:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = [(id)a1 context];
    if (v7 && (HMFEqualObjects() & 1) == 0)
    {
      if (!v5)
      {
        a1 = -1;
        goto LABEL_5;
      }
      if (!v6)
      {
        a1 = 1;
        goto LABEL_5;
      }
      uint64_t v21 = v7;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      int v9 = [(id)a1 devicePreferenceDataSources];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v32 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        unint64_t v12 = 0;
        unint64_t v13 = 0;
        uint64_t v14 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(v9);
            }
            id v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            v13 += [v16 supportsDeviceWithCapabilities:v5];
            v12 += [v16 supportsDeviceWithCapabilities:v6];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v32 count:16];
        }
        while (v11);
      }
      else
      {
        unint64_t v12 = 0;
        unint64_t v13 = 0;
      }

      id v17 = (void *)MEMORY[0x1D9452090]();
      id v18 = (id)a1;
      uint64_t v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        id v20 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543874;
        uint64_t v27 = v20;
        __int16 v28 = 2048;
        unint64_t v29 = v13;
        __int16 v30 = 2048;
        unint64_t v31 = v12;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Comparing device preferences: %ld -> %ld", buf, 0x20u);
      }
      if (v13 > v12) {
        a1 = 1;
      }
      else {
        a1 = -1;
      }
      uint64_t v7 = v21;
      if (v13 != v12) {
        goto LABEL_5;
      }
    }
    a1 = 0;
LABEL_5:
  }
  return a1;
}

- (void)_handleResidentElectionParameters:(id)a3
{
  id v12 = a3;
  id v4 = [(HMDPrimaryElectionLegacyAddOn *)self context];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 queue];
    dispatch_assert_queue_V2(v6);

    uint64_t v7 = [v12 messagePayload];
    id v8 = objc_msgSend(v7, "hmf_arrayForKey:", @"kAccessoriesListKey");

    int v9 = [v12 responseHandler];

    if (v9)
    {
      uint64_t v10 = -[HMDPrimaryElectionLegacyAddOn _electionParameters:](self, v8);
      uint64_t v11 = [v12 responseHandler];
      ((void (**)(void, void, void *))v11)[2](v11, 0, v10);
    }
  }
}

- (BOOL)isAtHome
{
  v2 = [(HMDPrimaryElectionLegacyAddOn *)self context];
  char v3 = v2;
  if (v2) {
    BOOL v4 = [v2 atHomeLevel] == 2 || objc_msgSend(v3, "atHomeLevel") == 3;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)confirmPrimaryResident
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  char v3 = [(HMDPrimaryElectionLegacyAddOn *)self context];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = [v3 queue];
    dispatch_assert_queue_V2(v5);

    id v6 = [v4 currentResidentDevice];
    int v7 = [v4 isResidentSupported];
    int v8 = [v4 isOwnerUser];
    if (v7 && ([v6 isEnabled] & v8 & 1) != 0)
    {
      int v9 = [v4 primaryResidentDevice];
      uint64_t v10 = v9;
      if (v9)
      {
        uint64_t v11 = [v9 device];
        char v12 = [v11 isCurrentDevice];

        if ((v12 & 1) == 0)
        {
          unint64_t v13 = (void *)MEMORY[0x1D9452090]();
          uint64_t v14 = self;
          id v15 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            id v16 = HMFGetLogIdentifier();
            id v17 = [v10 shortDescription];
            *(_DWORD *)long long buf = 138543618;
            uint64_t v33 = v16;
            __int16 v34 = 2112;
            id v35 = v17;
            _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Confirming primary resident: %@", buf, 0x16u);
          }
          id v18 = [v10 device];
          uint64_t v19 = [v18 capabilities];
          id v20 = [v6 device];
          uint64_t v21 = [v20 capabilities];
          uint64_t v22 = -[HMDPrimaryElectionLegacyAddOn compareCapabilities:withCapabilities:]((uint64_t)v14, v19, v21);

          if (v22 == -1)
          {
            objc_initWeak((id *)buf, v14);
            v30[0] = MEMORY[0x1E4F143A8];
            v30[1] = 3221225472;
            v30[2] = __55__HMDPrimaryElectionLegacyAddOn_confirmPrimaryResident__block_invoke;
            v30[3] = &unk_1E6A18528;
            objc_copyWeak(&v31, (id *)buf);
            [(HMDPrimaryElectionLegacyAddOn *)v14 confirmWithCompletionHandler:v30];
            objc_destroyWeak(&v31);
            objc_destroyWeak((id *)buf);
          }
        }
      }
    }
    else
    {
      long long v23 = (void *)MEMORY[0x1D9452090]();
      long long v24 = self;
      long long v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = HMFGetLogIdentifier();
        uint64_t v27 = HMFBooleanToString();
        [v6 isEnabled];
        __int16 v28 = HMFBooleanToString();
        unint64_t v29 = HMFBooleanToString();
        *(_DWORD *)long long buf = 138544130;
        uint64_t v33 = v26;
        __int16 v34 = 2112;
        id v35 = v27;
        __int16 v36 = 2112;
        id v37 = v28;
        __int16 v38 = 2112;
        id v39 = v29;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Current device is incapable of election and confirmation - Resident Supported: %@, Resident Enabled: %@, Owned Home: %@", buf, 0x2Au);
      }
    }
  }
}

void __55__HMDPrimaryElectionLegacyAddOn_confirmPrimaryResident__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = WeakRetained;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Confirmed with error: %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)confirmOnAvailability
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDPrimaryElectionLegacyAddOn *)self context];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = [v3 queue];
    dispatch_assert_queue_V2(v5);

    id v6 = [v4 currentResidentDevice];
    int v7 = -[HMDPrimaryElectionLegacyAddOn _electionParameters](self);
    int v8 = (void *)MEMORY[0x1D9452090]();
    int v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v11 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      __int16 v36 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Resident device has become available", buf, 0xCu);
    }
    id v12 = [(HMDPrimaryElectionLegacyAddOn *)v9 computePreferredElector:0];
    uint64_t v13 = [v4 primaryResidentDevice];
    if (v13)
    {
      uint64_t v14 = [v12 device];
      int v15 = [v14 isCurrentDevice];

      id v16 = (void *)MEMORY[0x1D9452090]();
      id v17 = v9;
      id v18 = HMFGetOSLogHandle();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
      if (v15)
      {
        if (v19)
        {
          id v20 = HMFGetLogIdentifier();
          uint64_t v21 = [v4 primaryResidentDevice];
          *(_DWORD *)long long buf = 138543618;
          __int16 v36 = v20;
          __int16 v37 = 2112;
          __int16 v38 = v21;
          _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Confirming ourselves against primary resident %@", buf, 0x16u);
        }
        __int16 v34 = v13;
        uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
        -[HMDPrimaryElectionLegacyAddOn _confirmResidentDevice:electionParameters:againstDevices:completionBlock:](v17, v6, v7, v22, 0);
      }
      else
      {
        if (v19)
        {
          long long v23 = HMFGetLogIdentifier();
          long long v24 = [v4 primaryResidentDevice];
          *(_DWORD *)long long buf = 138543618;
          __int16 v36 = v23;
          __int16 v37 = 2112;
          __int16 v38 = v24;
          _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Requesting to confirm this device against primary resident %@", buf, 0x16u);
        }
        long long v25 = [HMDRemoteDeviceMessageDestination alloc];
        v26 = [(HMDPrimaryElectionLegacyAddOn *)v17 messageTargetUUID];
        uint64_t v27 = [v12 device];
        __int16 v28 = [(HMDRemoteDeviceMessageDestination *)v25 initWithTarget:v26 device:v27];

        long long v32 = @"kResidentElectionParametersKey";
        uint64_t v33 = v7;
        unint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
        __int16 v30 = +[HMDRemoteMessage secureMessageWithName:@"kResidentConfirmDeviceInternalRequestKey" destination:v28 messagePayload:v29];

        id v31 = [v4 messageDispatcher];
        [v31 sendMessage:v30 completionHandler:0];
      }
    }
    else
    {
      [(HMDPrimaryElectionLegacyAddOn *)v9 performElectionWithReason:0];
    }
  }
}

- (id)_electionParameters
{
  id v1 = a1;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [a1 context];
    id v3 = v2;
    if (v2)
    {
      BOOL v4 = [v2 home];
      id v5 = [v4 accessories];
      id v6 = (void *)[v5 copy];

      if (v6) {
        objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
      }
      else {
      int v7 = [MEMORY[0x1E4F1CA48] array];
      }
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "uuid", (void)v16);
            uint64_t v14 = [v13 UUIDString];
            [v7 addObject:v14];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v10);
      }

      -[HMDPrimaryElectionLegacyAddOn _electionParameters:](v1, v7);
      id v1 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v1 = (id)MEMORY[0x1E4F1CC08];
    }
  }
  return v1;
}

- (void)confirmAsResident
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDPrimaryElectionLegacyAddOn *)self context];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = [v3 queue];
    dispatch_assert_queue_V2(v5);

    if (([v4 isResidentSupported] & 1) == 0)
    {
      uint64_t v14 = MEMORY[0x1D9452090]();
      int v15 = self;
      long long v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        long long v17 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        long long v25 = v17;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Do not confirm ourselves as the resident; We are not currently supported",
          buf,
          0xCu);
      }
      long long v18 = (void *)v14;
      goto LABEL_11;
    }
    if (![(HMDPrimaryElectionLegacyAddOn *)self isConfirming])
    {
      id v6 = (void *)MEMORY[0x1D9452090]();
      int v7 = self;
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        long long v25 = v9;
        _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Starting to confirm ourselves as the resident", buf, 0xCu);
      }
      uint64_t v10 = [v4 home];

      if (v10)
      {
        [(HMDPrimaryElectionLegacyAddOn *)v7 setConfirming:1];
        uint64_t v11 = [v4 currentResidentDevice];
        id v12 = -[HMDPrimaryElectionLegacyAddOn _electionParameters](v7);
        uint64_t v13 = [v4 availableResidentDevices];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __50__HMDPrimaryElectionLegacyAddOn_confirmAsResident__block_invoke;
        v23[3] = &unk_1E6A19B30;
        v23[4] = v7;
        -[HMDPrimaryElectionLegacyAddOn _confirmResidentDevice:electionParameters:againstDevices:completionBlock:](v7, v11, v12, v13, v23);

        goto LABEL_12;
      }
      uint64_t v19 = MEMORY[0x1D9452090]();
      id v20 = v7;
      uint64_t v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        uint64_t v22 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        long long v25 = v22;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Returning early from confirming as resident since home does not exist", buf, 0xCu);
      }
      long long v18 = (void *)v19;
LABEL_11:
    }
  }
LABEL_12:
}

uint64_t __50__HMDPrimaryElectionLegacyAddOn_confirmAsResident__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setConfirming:0];
}

- (void)__handleConfirmationRequest:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDPrimaryElectionLegacyAddOn *)self context];
  id v6 = v5;
  if (v5)
  {
    int v7 = [v5 queue];
    dispatch_assert_queue_V2(v7);

    if ([v6 isResidentSupported]
      && ([v6 isCurrentDeviceAvailableResident] & 1) != 0)
    {
      if ([v4 BOOLForKey:@"shouldElect"]) {
        [(HMDPrimaryElectionLegacyAddOn *)self computePreferredElector:0];
      }
      else {
      id v12 = [v6 currentResidentDevice];
      }
      if (v12)
      {
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __61__HMDPrimaryElectionLegacyAddOn___handleConfirmationRequest___block_invoke;
        v18[3] = &unk_1E6A197F0;
        id v19 = v4;
        -[HMDPrimaryElectionLegacyAddOn confirmElector:completionHandler:](self, v12, v18);
        uint64_t v13 = v19;
      }
      else
      {
        uint64_t v14 = (void *)MEMORY[0x1D9452090]();
        int v15 = self;
        long long v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          long long v17 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543362;
          uint64_t v21 = v17;
          _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Confirmation failed, unable to determine the elector", buf, 0xCu);
        }
        uint64_t v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"Confirmation failed." reason:@"Unable to determine the elector" suggestion:0];
        [v4 respondWithError:v13];
      }
    }
    else
    {
      id v8 = (void *)MEMORY[0x1D9452090]();
      uint64_t v9 = self;
      uint64_t v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        uint64_t v21 = v11;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Confirmation failed, not an available resident", buf, 0xCu);
      }
      id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48 description:@"Confirmation failed." reason:@"Not an available resident device." suggestion:0];
      [v4 respondWithError:v12];
    }
  }
}

uint64_t __61__HMDPrimaryElectionLegacyAddOn___handleConfirmationRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) respondWithPayload:0 error:a2];
}

- (void)confirmElector:(void *)a3 completionHandler:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    int v7 = [a1 context];
    id v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 queue];
      dispatch_assert_queue_V2(v9);

      uint64_t v10 = [v5 device];
      char v11 = [v10 isCurrentDevice];

      if (v11)
      {
        id v12 = [v8 primaryResidentDevice];
        uint64_t v13 = v12;
        if (v12)
        {
          id v14 = v12;
          int v15 = [a1 context];
          if (v15)
          {
            v44 = v14;
            long long v16 = [v14 capabilities];
            if (v16)
            {
              v42 = v13;
              long long v47 = 0u;
              long long v48 = 0u;
              long long v45 = 0u;
              long long v46 = 0u;
              long long v17 = [a1 devicePreferenceDataSources];
              uint64_t v18 = [v17 countByEnumeratingWithState:&v45 objects:buf count:16];
              if (v18)
              {
                uint64_t v19 = v18;
                uint64_t v20 = *(void *)v46;
                while (2)
                {
                  for (uint64_t i = 0; i != v19; ++i)
                  {
                    if (*(void *)v46 != v20) {
                      objc_enumerationMutation(v17);
                    }
                    if (([*(id *)(*((void *)&v45 + 1) + 8 * i) supportsDeviceWithCapabilities:v16] & 1) == 0)
                    {

                      char v22 = 0;
                      goto LABEL_22;
                    }
                  }
                  uint64_t v19 = [v17 countByEnumeratingWithState:&v45 objects:buf count:16];
                  if (v19) {
                    continue;
                  }
                  break;
                }
              }

              char v22 = 1;
LABEL_22:
              uint64_t v13 = v42;
            }
            else
            {
              unint64_t v29 = (void *)MEMORY[0x1D9452090]();
              id v30 = a1;
              id v31 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                __int16 v41 = HMFGetLogIdentifier();
                id v43 = v29;
                [v44 shortDescription];
                *(_DWORD *)long long buf = 138543618;
                v50 = v41;
                v52 = __int16 v51 = 2112;
                long long v32 = (void *)v52;
                _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to confirm device, %@, missing capabilities", buf, 0x16u);

                unint64_t v29 = v43;
              }

              char v22 = 0;
            }

            id v14 = v44;
          }
          else
          {
            char v22 = 0;
          }

          uint64_t v33 = (void *)MEMORY[0x1D9452090]();
          id v34 = a1;
          id v35 = HMFGetOSLogHandle();
          BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_INFO);
          if (v22)
          {
            if (v36)
            {
              __int16 v37 = HMFGetLogIdentifier();
              __int16 v38 = [v14 shortDescription];
              *(_DWORD *)long long buf = 138543618;
              v50 = v37;
              __int16 v51 = 2112;
              uint64_t v52 = (uint64_t)v38;
              _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_INFO, "%{public}@Confirmed device: %@", buf, 0x16u);
            }
            if (!v6) {
              goto LABEL_37;
            }
            goto LABEL_36;
          }
          if (v36)
          {
            uint64_t v39 = HMFGetLogIdentifier();
            uint64_t v40 = [v14 shortDescription];
            *(_DWORD *)long long buf = 138543618;
            v50 = v39;
            __int16 v51 = 2112;
            uint64_t v52 = (uint64_t)v40;
            _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_INFO, "%{public}@Confirmation of device, %@, failed, starting full election", buf, 0x16u);
          }
          uint64_t v27 = v34;
          uint64_t v28 = 5;
        }
        else
        {
          long long v23 = (void *)MEMORY[0x1D9452090]();
          id v24 = a1;
          long long v25 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            uint64_t v26 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543362;
            v50 = v26;
            _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@No primary resident, starting full election", buf, 0xCu);
          }
          uint64_t v27 = v24;
          uint64_t v28 = 0;
        }
        [v27 performElectionWithReason:v28];
        if (!v6)
        {
LABEL_37:

          goto LABEL_38;
        }
LABEL_36:
        v6[2](v6, 0);
        goto LABEL_37;
      }
      -[HMDPrimaryElectionLegacyAddOn requestConfirmationForElector:completionHandler:](a1, v5, v6);
    }
LABEL_38:
  }
}

- (void)requestConfirmationForElector:(void *)a3 completionHandler:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  id v7 = a3;
  if (a1)
  {
    id v8 = [a1 context];
    uint64_t v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 queue];
      dispatch_assert_queue_V2(v10);

      if (v5) {
        goto LABEL_7;
      }
      id v6 = [v9 primaryResidentDevice];
      char v11 = (void *)MEMORY[0x1D9452090]();
      id v12 = a1;
      uint64_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543618;
        id v43 = v14;
        __int16 v44 = 2112;
        long long v45 = v6;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@No elector provided, using current primary: %@", buf, 0x16u);
      }
      if (v6)
      {
LABEL_7:
        int v15 = (void *)MEMORY[0x1D9452090]();
        id v16 = a1;
        long long v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          uint64_t v18 = HMFGetLogIdentifier();
          uint64_t v19 = [v6 shortDescription];
          *(_DWORD *)long long buf = 138543618;
          id v43 = v18;
          __int16 v44 = 2112;
          long long v45 = v19;
          _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Requesting confirmation from %@", buf, 0x16u);
        }
        BOOL v20 = v5 == 0;

        uint64_t v21 = [v6 device];
        char v22 = [HMDRemoteDeviceMessageDestination alloc];
        long long v23 = [v16 messageTargetUUID];
        id v24 = [(HMDRemoteDeviceMessageDestination *)v22 initWithTarget:v23 device:v21];

        long long v25 = (void *)MEMORY[0x1E4F654B0];
        uint64_t v40 = @"shouldElect";
        uint64_t v26 = [NSNumber numberWithBool:v20];
        __int16 v41 = v26;
        uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        uint64_t v28 = [v25 messageWithName:*MEMORY[0x1E4F2D1E8] destination:v24 payload:v27];

        [v28 setSecureRemote:1];
        objc_initWeak((id *)buf, v16);
        uint64_t v34 = MEMORY[0x1E4F143A8];
        uint64_t v35 = 3221225472;
        BOOL v36 = __81__HMDPrimaryElectionLegacyAddOn_requestConfirmationForElector_completionHandler___block_invoke;
        __int16 v37 = &unk_1E6A193F8;
        objc_copyWeak(&v39, (id *)buf);
        id v38 = v7;
        [v28 setResponseHandler:&v34];
        unint64_t v29 = objc_msgSend(v9, "messageDispatcher", v34, v35, v36, v37);
        [v29 sendMessage:v28 completionHandler:0];

        objc_destroyWeak(&v39);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        id v30 = (void *)MEMORY[0x1D9452090]();
        id v31 = v12;
        long long v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v33 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543362;
          id v43 = v33;
          _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot confirm, unable to determine primary resident", buf, 0xCu);
        }
        if (!v7)
        {
          id v6 = 0;
          goto LABEL_11;
        }
        uint64_t v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:91 description:@"Cannot confirm." reason:@"Unable to determine primary resident" suggestion:0];
        (*((void (**)(id, void *))v7 + 2))(v7, v21);
        id v6 = 0;
      }
    }
LABEL_11:
  }
}

void __81__HMDPrimaryElectionLegacyAddOn_requestConfirmationForElector_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = WeakRetained;
  uint64_t v10 = HMFGetOSLogHandle();
  char v11 = v10;
  if (v5)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    id v12 = HMFGetLogIdentifier();
    int v18 = 138543618;
    uint64_t v19 = v12;
    __int16 v20 = 2112;
    id v21 = v5;
    uint64_t v13 = "%{public}@Confirmation request failed with error: %@";
    id v14 = v11;
    os_log_type_t v15 = OS_LOG_TYPE_ERROR;
    uint32_t v16 = 22;
  }
  else
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    id v12 = HMFGetLogIdentifier();
    int v18 = 138543362;
    uint64_t v19 = v12;
    uint64_t v13 = "%{public}@Confirmation request succeeded";
    id v14 = v11;
    os_log_type_t v15 = OS_LOG_TYPE_INFO;
    uint32_t v16 = 12;
  }
  _os_log_impl(&dword_1D49D5000, v14, v15, v13, (uint8_t *)&v18, v16);

LABEL_7:
  uint64_t v17 = *(void *)(a1 + 32);
  if (v17) {
    (*(void (**)(uint64_t, id))(v17 + 16))(v17, v5);
  }
}

- (void)confirmWithCompletionHandler:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDPrimaryElectionLegacyAddOn *)self context];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 queue];
    dispatch_assert_queue_V2(v7);

    if ([v6 isOwnerUser])
    {
      id v8 = [v6 currentResidentDevice];
      id v9 = [v6 availableResidentDevices];
      char v10 = [v9 containsObject:v8];

      if (v10)
      {
        char v11 = [(HMDPrimaryElectionLegacyAddOn *)self computePreferredElector:0];
        if (v11)
        {
          -[HMDPrimaryElectionLegacyAddOn confirmElector:completionHandler:](self, v11, v4);
        }
        else
        {
          __int16 v20 = (void *)MEMORY[0x1D9452090]();
          id v21 = self;
          uint64_t v22 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            long long v23 = HMFGetLogIdentifier();
            int v25 = 138543362;
            uint64_t v26 = v23;
            _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Confirmation failed, unable to determine the elector", (uint8_t *)&v25, 0xCu);
          }
          if (v4)
          {
            id v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"Confirmation failed." reason:@"Unable to determine the elector" suggestion:0];
            (*((void (**)(id, void *))v4 + 2))(v4, v24);
          }
        }
      }
      else
      {
        uint32_t v16 = (void *)MEMORY[0x1D9452090]();
        uint64_t v17 = self;
        int v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          uint64_t v19 = HMFGetLogIdentifier();
          int v25 = 138543362;
          uint64_t v26 = v19;
          _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Requesting confirmation from primary resident device", (uint8_t *)&v25, 0xCu);
        }
        -[HMDPrimaryElectionLegacyAddOn requestConfirmationForElector:completionHandler:](v17, 0, v4);
      }
      goto LABEL_18;
    }
    id v12 = (void *)MEMORY[0x1D9452090]();
    uint64_t v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      os_log_type_t v15 = HMFGetLogIdentifier();
      int v25 = 138543362;
      uint64_t v26 = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Confirmation is only available to the owner of the home", (uint8_t *)&v25, 0xCu);
    }
    if (v4)
    {
      id v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48 description:0 reason:@"Confirmation is only available to the owner of the home." suggestion:0];
      (*((void (**)(id, void *))v4 + 2))(v4, v8);
LABEL_18:
    }
  }
}

- (id)computePreferredElector:(unint64_t *)a3
{
  id v4 = self;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMDPrimaryElectionLegacyAddOn *)self context];
  id v6 = v5;
  if (v5)
  {
    if (a3) {
      *a3 = 11;
    }
    id v38 = v5;
    id v7 = objc_msgSend(v5, "availableResidentDevices", a3);
    id v8 = (void *)[v7 mutableCopy];

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v9 = (void *)[v8 copy];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v46;
      uint64_t v39 = *(void *)v46;
      do
      {
        uint64_t v13 = 0;
        uint64_t v40 = v11;
        do
        {
          if (*(void *)v46 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v45 + 1) + 8 * v13);
          if (([v14 isReachable] & 1) == 0)
          {
            os_log_type_t v15 = (void *)MEMORY[0x1D9452090]();
            uint32_t v16 = v4;
            uint64_t v17 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              int v18 = HMFGetLogIdentifier();
              uint64_t v19 = [v14 device];
              [v19 isCurrentDevice];
              HMFBooleanToString();
              __int16 v41 = v15;
              __int16 v20 = v9;
              id v21 = v4;
              v23 = uint64_t v22 = v8;
              *(_DWORD *)long long buf = 138543874;
              v50 = v18;
              __int16 v51 = 2112;
              uint64_t v52 = v14;
              __int16 v53 = 2112;
              v54 = v23;
              _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Not electing resident as it is unreachable: %@, isCurrentDevice: %@", buf, 0x20u);

              uint64_t v11 = v40;
              id v8 = v22;
              id v4 = v21;
              id v9 = v20;
              os_log_type_t v15 = v41;

              uint64_t v12 = v39;
            }

            [v8 removeObject:v14];
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v45 objects:v55 count:16];
      }
      while (v11);
    }

    if (isInternalBuild())
    {
      id v6 = v38;
      id v24 = [v38 home];
      int v25 = [v24 uuid];

      uint64_t v26 = [(id)preferredPrimaryForHome objectForKey:v25];
      if (v26)
      {
        uint64_t v27 = (void *)MEMORY[0x1D9452090]();
        uint64_t v28 = v4;
        unint64_t v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          id v30 = HMFGetLogIdentifier();
          [v25 UUIDString];
          v32 = id v31 = v8;
          uint64_t v33 = [v26 UUIDString];
          *(_DWORD *)long long buf = 138543874;
          v50 = v30;
          __int16 v51 = 2112;
          uint64_t v52 = v32;
          __int16 v53 = 2112;
          v54 = v33;
          _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_INFO, "%{public}@The house %@ has a preferred primary device of %@", buf, 0x20u);

          id v8 = v31;
        }
      }
    }
    else
    {
      uint64_t v26 = 0;
      id v6 = v38;
    }
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __57__HMDPrimaryElectionLegacyAddOn_computePreferredElector___block_invoke;
    v42[3] = &unk_1E6A0FEC0;
    id v43 = v26;
    uint64_t v44 = v37;
    id v35 = v26;
    [v8 sortUsingComparator:v42];
    uint64_t v34 = [v8 lastObject];
  }
  else
  {
    uint64_t v34 = 0;
  }

  return v34;
}

uint64_t __57__HMDPrimaryElectionLegacyAddOn_computePreferredElector___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  id v9 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;

  uint64_t v12 = [v8 device];

  uint64_t v13 = [v11 device];

  if (isInternalBuild())
  {
    id v14 = *(void **)(a1 + 32);
    os_log_type_t v15 = [v12 identifier];
    LODWORD(v14) = [v14 isEqual:v15];

    if (v14)
    {
      uint32_t v16 = *(uint64_t **)(a1 + 40);
      if (v16)
      {
        uint64_t v17 = 12;
LABEL_32:
        uint64_t *v16 = v17;
        goto LABEL_33;
      }
      goto LABEL_33;
    }
    int v18 = *(void **)(a1 + 32);
    uint64_t v19 = [v13 identifier];
    LODWORD(v18) = [v18 isEqual:v19];

    if (v18)
    {
      __int16 v20 = *(uint64_t **)(a1 + 40);
      if (v20)
      {
        uint64_t v21 = 12;
LABEL_27:
        uint64_t *v20 = v21;
        goto LABEL_28;
      }
      goto LABEL_28;
    }
  }
  uint64_t v22 = [v12 version];
  long long v23 = [v13 version];
  uint64_t v24 = [v22 compare:v23];

  if (v24)
  {
    int v25 = *(void **)(a1 + 40);
    if (v25) {
      *int v25 = 16;
    }
  }
  else
  {
    uint64_t v26 = [v12 productInfo];
    uint64_t v27 = [v26 productClass];
    uint64_t v28 = [v13 productInfo];
    uint64_t v29 = [v28 productClass];

    if (v27 != v29)
    {
      id v30 = [v12 productInfo];
      uint64_t v31 = [v30 productClass];

      if (v31 == 3)
      {
        __int16 v20 = *(uint64_t **)(a1 + 40);
        if (v20)
        {
          uint64_t v21 = 4;
          goto LABEL_27;
        }
LABEL_28:
        uint64_t v24 = -1;
        goto LABEL_34;
      }
      uint64_t v33 = [v13 productInfo];
      uint64_t v34 = [v33 productClass];

      if (v34 == 3)
      {
        uint32_t v16 = *(uint64_t **)(a1 + 40);
        if (v16)
        {
          uint64_t v17 = 4;
          goto LABEL_32;
        }
        goto LABEL_33;
      }
    }
    if ([v12 isCurrentDevice])
    {
      uint32_t v16 = *(uint64_t **)(a1 + 40);
      if (v16)
      {
        uint64_t v17 = 11;
        goto LABEL_32;
      }
LABEL_33:
      uint64_t v24 = 1;
      goto LABEL_34;
    }
    int v32 = [v13 isCurrentDevice];
    __int16 v20 = *(uint64_t **)(a1 + 40);
    if (v32)
    {
      if (v20)
      {
        uint64_t v21 = 11;
        goto LABEL_27;
      }
      goto LABEL_28;
    }
    uint64_t v24 = 0;
    if (v20) {
      uint64_t *v20 = 0;
    }
  }
LABEL_34:

  return v24;
}

- (void)handleBatteryLevelChange:(id)a3
{
  id v4 = [(HMDPrimaryElectionLegacyAddOn *)self context];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 queue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__HMDPrimaryElectionLegacyAddOn_handleBatteryLevelChange___block_invoke;
    v7[3] = &unk_1E6A197C8;
    v7[4] = self;
    id v8 = v5;
    dispatch_async(v6, v7);
  }
}

void __58__HMDPrimaryElectionLegacyAddOn_handleBatteryLevelChange___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier();
    int v18 = 138543362;
    uint64_t v19 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Received notification that of battery level change", (uint8_t *)&v18, 0xCu);
  }
  id v6 = [*(id *)(a1 + 40) currentResidentDevice];
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F65528] sharedManager];
    [v7 batteryLevel];
    float v9 = v8;

    BOOL v10 = v9 <= 0.2 && (unint64_t)(v9 > 0.0);
    if (v10 != [v6 isLowBattery])
    {
      id v11 = (void *)MEMORY[0x1D9452090]();
      id v12 = *(id *)(a1 + 32);
      uint64_t v13 = HMFGetOSLogHandle();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
      if (v10)
      {
        if (v14)
        {
          os_log_type_t v15 = HMFGetLogIdentifier();
          int v18 = 138543362;
          uint64_t v19 = v15;
          uint32_t v16 = "%{public}@Currently in a low battery state, notifying clients";
LABEL_13:
          _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, v16, (uint8_t *)&v18, 0xCu);
        }
      }
      else if (v14)
      {
        os_log_type_t v15 = HMFGetLogIdentifier();
        int v18 = 138543362;
        uint64_t v19 = v15;
        uint32_t v16 = "%{public}@No longer in a low battery state, notifying clients";
        goto LABEL_13;
      }

      [v6 setLowBattery:v10];
      uint64_t v17 = [*(id *)(a1 + 32) delegate];
      [v17 primaryElectionAddOn:*(void *)(a1 + 32) didUpdateResidentDevice:v6];
    }
  }
}

- (void)handleBatteryStateChange:(id)a3
{
  id v4 = [(HMDPrimaryElectionLegacyAddOn *)self context];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 queue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__HMDPrimaryElectionLegacyAddOn_handleBatteryStateChange___block_invoke;
    v7[3] = &unk_1E6A197C8;
    v7[4] = self;
    id v8 = v5;
    dispatch_async(v6, v7);
  }
}

void __58__HMDPrimaryElectionLegacyAddOn_handleBatteryStateChange___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v40 = 138543362;
    __int16 v41 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Received notification that of battery state change", (uint8_t *)&v40, 0xCu);
  }
  id v6 = [*(id *)(a1 + 40) currentResidentDevice];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 batteryState];
    float v9 = [MEMORY[0x1E4F65528] sharedManager];
    uint64_t v10 = [v9 batteryState];

    if (v10 != v8)
    {
      if (v8)
      {
        if (v10 == 1)
        {
          id v11 = (void *)MEMORY[0x1D9452090]();
          id v12 = *(id *)(a1 + 32);
          uint64_t v13 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            BOOL v14 = HMFGetLogIdentifier();
            int v40 = 138543362;
            __int16 v41 = v14;
            _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Currently discharging, notifying clients", (uint8_t *)&v40, 0xCu);
          }
          -[HMDPrimaryElectionLegacyAddOn _updateDischargingTimer:](*(void **)(a1 + 32), [*(id *)(a1 + 40) atHomeLevel]);
          goto LABEL_29;
        }
        if (v8 == 1)
        {
          os_log_type_t v15 = (void *)MEMORY[0x1D9452090]();
          id v16 = *(id *)(a1 + 32);
          uint64_t v17 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            int v18 = HMFGetLogIdentifier();
            int v40 = 138543362;
            __int16 v41 = v18;
            _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Currently charging, notifying clients", (uint8_t *)&v40, 0xCu);
          }
          uint64_t v19 = *(void **)(a1 + 32);
          if (!v19) {
            goto LABEL_29;
          }
          uint64_t v20 = [*(id *)(a1 + 32) context];
          uint64_t v21 = v20;
          if (!v20) {
            goto LABEL_28;
          }
          uint64_t v22 = [v20 queue];
          dispatch_assert_queue_V2(v22);

          if (isAppleTV())
          {
            uint64_t v23 = MEMORY[0x1D9452090]();
            id v24 = v19;
            int v25 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              uint64_t v26 = HMFGetLogIdentifier();
              int v40 = 138543362;
              __int16 v41 = v26;
              _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@We should only be pinging the resident on transient resident capable devices which are enabled", (uint8_t *)&v40, 0xCu);
            }
            uint64_t v27 = (void *)v23;
          }
          else
          {
            char v28 = [v21 isResidentSupported];
            uint64_t v29 = (void *)MEMORY[0x1D9452090]();
            id v30 = v19;
            uint64_t v31 = HMFGetOSLogHandle();
            BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_INFO);
            if (v28)
            {
              if (v32)
              {
                uint64_t v33 = HMFGetLogIdentifier();
                int v40 = 138543362;
                __int16 v41 = v33;
                _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@Updating monitor timer since we are charging", (uint8_t *)&v40, 0xCu);
              }
              uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:5 options:60.0];
              [v30 setResidentMonitorTimer:v34];

              id v35 = [v30 residentMonitorTimer];
              [v35 setDelegate:v30];

              BOOL v36 = [v21 queue];
              uint64_t v37 = [v30 residentMonitorTimer];
              [v37 setDelegateQueue:v36];

              -[HMDPrimaryElectionLegacyAddOn _startMonitoringResident](v30);
              goto LABEL_28;
            }
            if (v32)
            {
              id v38 = HMFGetLogIdentifier();
              int v40 = 138543362;
              __int16 v41 = v38;
              _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@We shouldn't ping if resident is not supported.", (uint8_t *)&v40, 0xCu);
            }
            uint64_t v27 = v29;
          }
LABEL_28:

LABEL_29:
          [v7 setBatteryState:v10];
          uint64_t v39 = [*(id *)(a1 + 32) delegate];
          [v39 primaryElectionAddOn:*(void *)(a1 + 32) didUpdateResidentDevice:v7];

          goto LABEL_30;
        }
      }
      [v7 setBatteryState:v10];
    }
  }
LABEL_30:
}

- (void)timerDidFire:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDPrimaryElectionLegacyAddOn *)self context];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 queue];
    dispatch_assert_queue_V2(v7);

    uint64_t v8 = [v6 primaryResidentDevice];
    float v9 = [v8 device];

    if (v9 && ([v9 isCurrentDevice] & 1) == 0)
    {
      uint64_t v10 = (void *)MEMORY[0x1D9452090]();
      id v11 = self;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543618;
        uint64_t v19 = v13;
        __int16 v20 = 2112;
        uint64_t v21 = v9;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Pinging resident: %@", buf, 0x16u);
      }
      BOOL v14 = [v6 messageDispatcher];
      os_log_type_t v15 = [v14 secureRemoteTransport];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __46__HMDPrimaryElectionLegacyAddOn_timerDidFire___block_invoke;
      v16[3] = &unk_1E6A10888;
      v16[4] = v11;
      id v17 = v9;
      [v15 pingDevice:v17 completionHandler:v16];
    }
  }
}

void __46__HMDPrimaryElectionLegacyAddOn_timerDidFire___block_invoke(uint64_t a1, char a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((a2 & 1) == 0)
  {
    id v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = *(id *)(a1 + 32);
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543618;
      float v9 = v6;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Ping failed for resident: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (id)residentsInMesh
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (void)primaryResidentChanged:(id)a3 previousResidentDevice:(id)a4
{
}

- (void)performElectionWithReason:(unint64_t)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMDPrimaryElectionLegacyAddOn *)self context];
  id v6 = v5;
  if (!v5) {
    goto LABEL_21;
  }
  uint64_t v7 = [v5 queue];
  dispatch_assert_queue_V2(v7);

  int v8 = (void *)MEMORY[0x1D9452090]();
  float v9 = self;
  __int16 v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    if (a3 - 1 > 6) {
      uint64_t v12 = @"no primary";
    }
    else {
      uint64_t v12 = off_1E6A0CF88[a3 - 1];
    }
    uint64_t v13 = v12;
    *(_DWORD *)long long buf = 138543618;
    uint64_t v42 = v11;
    __int16 v43 = 2112;
    uint64_t v44 = v13;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Performing election with reason: %@", buf, 0x16u);
  }
  if (([v6 isResidentEnabled] & 1) == 0)
  {
    __int16 v20 = (void *)MEMORY[0x1D9452090]();
    uint64_t v21 = v9;
    uint64_t v22 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
      goto LABEL_20;
    }
    uint64_t v23 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    uint64_t v42 = v23;
    id v24 = "%{public}@Only resident capable devices which are enabled should perform resident election";
LABEL_19:
    _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, v24, buf, 0xCu);

    goto LABEL_20;
  }
  if (([v6 isResidentSupported] & 1) == 0)
  {
    __int16 v20 = (void *)MEMORY[0x1D9452090]();
    uint64_t v21 = v9;
    uint64_t v22 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
      goto LABEL_20;
    }
    uint64_t v23 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    uint64_t v42 = v23;
    id v24 = "%{public}@Resident election is not supported on this device.";
    goto LABEL_19;
  }
  if (([v6 isOwnerUser] & 1) == 0)
  {
    __int16 v20 = (void *)MEMORY[0x1D9452090]();
    uint64_t v21 = v9;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      uint64_t v42 = v23;
      id v24 = "%{public}@Only owners can perform resident election";
      goto LABEL_19;
    }
LABEL_20:

    goto LABEL_21;
  }
  BOOL v14 = [v6 currentResidentDevice];
  -[HMDPrimaryElectionLegacyAddOn _stopMonitoringResident:](v9, v14);

  os_log_type_t v15 = (void *)MEMORY[0x1D9452090]();
  id v16 = v9;
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = HMFGetLogIdentifier();
    if (a3 - 1 > 6) {
      uint64_t v19 = @"no primary";
    }
    else {
      uint64_t v19 = off_1E6A0CF88[a3 - 1];
    }
    int v25 = v19;
    *(_DWORD *)long long buf = 138543618;
    uint64_t v42 = v18;
    __int16 v43 = 2112;
    uint64_t v44 = v25;
    _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Starting primary resident election: %@", buf, 0x16u);
  }
  unint64_t v40 = 0;
  uint64_t v26 = [(HMDPrimaryElectionLegacyAddOn *)v16 computePreferredElector:&v40];
  uint64_t v27 = [(HMDPrimaryElectionLegacyAddOn *)v16 delegate];
  char v28 = (void *)MEMORY[0x1D9452090]();
  uint64_t v29 = v16;
  id v30 = HMFGetOSLogHandle();
  BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
  if (v26)
  {
    if (v31)
    {
      BOOL v32 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      uint64_t v42 = v32;
      __int16 v43 = 2112;
      uint64_t v44 = v26;
      _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Resident device elected: %@", buf, 0x16u);
    }
    uint64_t v33 = objc_alloc_init(HMDLegacyPrimaryElectionLogEvent);
    if (a3 - 1 > 6) {
      uint64_t v34 = @"no primary";
    }
    else {
      uint64_t v34 = off_1E6A0CF88[a3 - 1];
    }
    BOOL v36 = v34;
    [(HMDLegacyPrimaryElectionLogEvent *)v33 setReason:v36];

    if (v40 > 0x11) {
      uint64_t v37 = @"unknown reason";
    }
    else {
      uint64_t v37 = off_1E6A0CFC0[v40];
    }
    id v38 = v37;
    [(HMDLegacyPrimaryElectionLogEvent *)v33 setCriteria:v38];

    uint64_t v39 = [v6 availableResidentDevices];
    -[HMDLegacyPrimaryElectionLogEvent setAvailableResidentCount:](v33, "setAvailableResidentCount:", [v39 count]);

    [v27 primaryElectionAddOn:v29 didElectPrimaryResident:v26 confirmed:0 electionLogEvent:v33];
  }
  else
  {
    if (v31)
    {
      id v35 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      uint64_t v42 = v35;
      _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@No resident device available", buf, 0xCu);
    }
    uint64_t v33 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"No valid resident found" reason:0 suggestion:0];
    [v27 primaryElectionAddOn:v29 didFailToElectWithError:v33];
  }

LABEL_21:
}

- (BOOL)residentIsPartOfTheCurrentMesh:(id)a3
{
  return 0;
}

- (void)registerForMessages
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDPrimaryElectionLegacyAddOn *)self context];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 messageDispatcher];
    os_log_type_t v15 = [v4 home];
    id v6 = +[HMDRemoteMessagePolicy defaultPolicy];
    [v6 setRequiresSecureMessage:1];
    [v6 setRequiresAccountMessage:1];
    [v6 setTransportRestriction:-1];
    uint64_t v7 = (void *)[v6 copy];
    int v8 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v15 userPrivilege:3 remoteAccessRequired:0];
    v18[0] = v7;
    v18[1] = v8;
    float v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    [v5 registerForMessage:@"kResidentElectionParametersInternalRequestKey" receiver:self policies:v9 selector:sel__handleResidentElectionParameters_];

    uint64_t v10 = *MEMORY[0x1E4F2D1E8];
    v17[0] = v7;
    v17[1] = v8;
    uint64_t v11 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
    v17[2] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
    [v5 registerForMessage:v10 receiver:self policies:v12 selector:sel___handleConfirmationRequest_];

    v16[0] = v7;
    v16[1] = v8;
    uint64_t v13 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
    v16[2] = v13;
    BOOL v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
    [v5 registerForMessage:@"kResidentConfirmDeviceInternalRequestKey" receiver:self policies:v14 selector:sel__handleConfirmResidentDevice_];
  }
}

- (void)stop
{
  id v2 = [(HMDPrimaryElectionLegacyAddOn *)self residentMonitorTimer];
  [v2 suspend];
}

- (void)start
{
  id v3 = [(HMDPrimaryElectionLegacyAddOn *)self context];
  if (v3)
  {
    id v5 = v3;
    id v4 = [v3 queue];
    dispatch_assert_queue_V2(v4);

    -[HMDPrimaryElectionLegacyAddOn _startMonitoringResident](self);
    id v3 = v5;
  }
}

- (HMDPrimaryElectionLegacyAddOn)initWithContext:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HMDPrimaryElectionLegacyAddOn;
  id v5 = [(HMDPrimaryElectionLegacyAddOn *)&v23 init];
  uint64_t v6 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
  devicePreferenceDataSources = v5->_devicePreferenceDataSources;
  v5->_devicePreferenceDataSources = (NSHashTable *)v6;

  objc_storeWeak((id *)&v5->_context, v4);
  uint64_t v8 = [objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:5 options:60.0];
  residentMonitorTimer = v5->_residentMonitorTimer;
  v5->_residentMonitorTimer = (HMFTimer *)v8;

  [(HMFTimer *)v5->_residentMonitorTimer setDelegate:v5];
  uint64_t v10 = [v4 queue];
  [(HMFTimer *)v5->_residentMonitorTimer setDelegateQueue:v10];

  uint64_t v11 = +[HMDDeviceCapabilities deviceCapabilities];
  int v12 = [v11 isResidentCapable];

  if (v12)
  {
    uint64_t v13 = [MEMORY[0x1E4F65528] sharedManager];
    int v14 = [v13 hasBattery];

    if (v14)
    {
      os_log_type_t v15 = (void *)MEMORY[0x1D9452090]();
      id v16 = v5;
      id v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v18 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        int v25 = v18;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Monitoring power state information for transient resident device", buf, 0xCu);
      }
      uint64_t v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v19 addObserver:v16 selector:sel_handleBatteryStateChange_ name:*MEMORY[0x1E4F64F38] object:0];

      __int16 v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v20 addObserver:v16 selector:sel_handleBatteryLevelChange_ name:*MEMORY[0x1E4F64F30] object:0];

      uint64_t v21 = [MEMORY[0x1E4F65528] sharedManager];
      [v21 start];
    }
  }

  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t87 != -1) {
    dispatch_once(&logCategory__hmf_once_t87, &__block_literal_global_116627);
  }
  id v2 = (void *)logCategory__hmf_once_v88;
  return v2;
}

uint64_t __44__HMDPrimaryElectionLegacyAddOn_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v88;
  logCategory__hmf_once_v88 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (int64_t)compareElectionVersions:(id)a3 otherVersion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [[HMDHomeKitVersion alloc] initWithVersionString:@"5.1"];
  if (([v5 isEqualToVersion:v6] & 1) == 0
    && (![v5 isAtLeastVersion:v7] || (objc_msgSend(v6, "isAtLeastVersion:", v7) & 1) == 0))
  {
    if ([v5 isAtLeastVersion:v7]) {
      goto LABEL_22;
    }
    if ([v6 isAtLeastVersion:v7]) {
      goto LABEL_24;
    }
  }

  uint64_t v7 = [[HMDHomeKitVersion alloc] initWithVersionString:@"4.0"];
  if (([v5 isEqualToVersion:v6] & 1) == 0
    && (![v5 isAtLeastVersion:v7] || (objc_msgSend(v6, "isAtLeastVersion:", v7) & 1) == 0))
  {
    if ([v5 isAtLeastVersion:v7]) {
      goto LABEL_22;
    }
    if ([v6 isAtLeastVersion:v7]) {
      goto LABEL_24;
    }
  }

  uint64_t v7 = [[HMDHomeKitVersion alloc] initWithVersionString:@"3.2"];
  if (([v5 isEqualToVersion:v6] & 1) != 0
    || [v5 isAtLeastVersion:v7] && (objc_msgSend(v6, "isAtLeastVersion:", v7) & 1) != 0)
  {
    goto LABEL_12;
  }
  if ([v5 isAtLeastVersion:v7])
  {
LABEL_22:
    int64_t v8 = 1;
    goto LABEL_25;
  }
  if ([v6 isAtLeastVersion:v7]) {
    goto LABEL_24;
  }
LABEL_12:

  uint64_t v7 = [[HMDHomeKitVersion alloc] initWithVersionString:@"3.1"];
  if (([v5 isEqualToVersion:v6] & 1) == 0
    && (![v5 isAtLeastVersion:v7] || (objc_msgSend(v6, "isAtLeastVersion:", v7) & 1) == 0))
  {
    if ([v5 isAtLeastVersion:v7]) {
      goto LABEL_22;
    }
    if ([v6 isAtLeastVersion:v7])
    {
LABEL_24:
      int64_t v8 = -1;
      goto LABEL_25;
    }
  }
  int64_t v8 = 0;
LABEL_25:

  return v8;
}

@end