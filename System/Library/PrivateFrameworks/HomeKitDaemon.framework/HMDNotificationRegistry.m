@interface HMDNotificationRegistry
+ (id)logCategory;
- (BOOL)_processCharacteristicsRequests:(void *)a1;
- (BOOL)hasRegistrationsForActionSetUUID:(id)a3;
- (BOOL)removeRegistrationsForActionSetUUID:(id)a3;
- (BOOL)removeRegistrationsForMediaProfile:(id)a3;
- (BOOL)setNotificationsEnabled:(BOOL)a3 user:(id)a4 deviceIdsDestination:(id)a5 characteristicsPayload:(id)a6 characteristicChangeThresholdsPayload:(id)a7 mediaPropertiesPayload:(id)a8 actionSetsPayload:(id)a9 matterNotificationPayload:(id)a10;
- (HMDNotificationRegistry)init;
- (HMDNotificationRegistry)initWithPendingRequestsRetryTimer:(id)a3;
- (NSMutableSet)chipRemoteSubscribers;
- (id)characteristicsByDestinationForCharacteristics:(id)a3;
- (id)delegates;
- (id)destinationsRegisteredForNotificationsForActionSetResponses:(id)a3;
- (id)destinationsRegisteredForNotificationsForCharacteristics:(id)a3;
- (id)destinationsRegisteredForNotificationsForProperties:(id)a3;
- (id)filterActionSetResponses:(id)a3 deviceIdsDestination:(id)a4;
- (id)filterCharacteristics:(id)a3 deviceIdsDestination:(id)a4;
- (id)filterProperties:(id)a3 deviceIdsDestination:(id)a4;
- (id)home;
- (id)logIdentifier;
- (id)propertiesRegisteredForMediaProfileUniqueIdentifier:(id)a3;
- (id)shortDescription;
- (uint64_t)_processMediaPropertiesRequests:(void *)a1;
- (void)_addPendingRequests:(void *)a1;
- (void)addDelegate:(id)a3;
- (void)auditNotificationDestinations:(id)a3 home:(id)a4;
- (void)clearAllRegistrations;
- (void)configureWithHome:(id)a3;
- (void)configureWithHome:(id)a3 coreDataAdapter:(id)a4;
- (void)disableAllRegistrations;
- (void)notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles:(void *)a1;
- (void)notifyDelegatesOfRegistryUpdatesForActionSets:(void *)a1;
- (void)removeRegistrationsForCharacteristics:(id)a3;
- (void)reprocessEnabledCharacteristicRegistrations;
- (void)setChipRemoteSubscribers:(id)a3;
- (void)storeCHIPRemoteSubscriberWithRemoteSourceID:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDNotificationRegistry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_pendingRequestsRetryTimer, 0);
  objc_storeStrong((id *)&self->_coreDataAdapter, 0);
  objc_storeStrong((id *)&self->_chipRemoteSubscribers, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
}

- (void)setChipRemoteSubscribers:(id)a3
{
}

- (NSMutableSet)chipRemoteSubscribers
{
  return self->_chipRemoteSubscribers;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (self)
  {
    Property = objc_getProperty(self, v4, 64, 1);
    dispatch_assert_queue_V2(Property);
    id v8 = objc_getProperty(self, v7, 40, 1);
  }
  else
  {
    dispatch_assert_queue_V2(0);
    id v8 = 0;
  }
  if (v8 == v5)
  {
    v9 = (void *)MEMORY[0x230FBD990]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v58 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Pending requests retry timer fired", buf, 0xCu);
    }
    if (self)
    {
      v14 = objc_getProperty(v10, v13, 64, 1);
      dispatch_assert_queue_V2(v14);
      v16 = objc_msgSend(objc_getProperty(v10, v15, 48, 1), "copy");
      objc_msgSend(objc_getProperty(v10, v17, 48, 1), "removeAllObjects");
      uint64_t v18 = [v16 count];
      v19 = (void *)MEMORY[0x230FBD990]();
      v20 = v10;
      v21 = HMFGetOSLogHandle();
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
      if (v18)
      {
        id v44 = v5;
        if (v22)
        {
          v23 = HMFGetLogIdentifier();
          uint64_t v24 = [v16 count];
          *(_DWORD *)buf = 138543618;
          v58 = v23;
          __int16 v59 = 2048;
          uint64_t v60 = v24;
          _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Processing %lu pending request(s)", buf, 0x16u);
        }
        v46 = [MEMORY[0x263EFF9C0] set];
        v45 = [MEMORY[0x263EFF9C0] set];
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        v43 = v16;
        id v25 = v16;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v47 objects:buf count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v48;
          do
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v48 != v28) {
                objc_enumerationMutation(v25);
              }
              v30 = *(void **)(*((void *)&v47 + 1) + 8 * i);
              if ([v30 retryCount] < 5)
              {
                objc_msgSend(v30, "setRetryCount:", objc_msgSend(v30, "retryCount") + 1);
                id v36 = v30;
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  v37 = v36;
                }
                else {
                  v37 = 0;
                }
                id v38 = v37;

                if (v38)
                {
                  [v46 addObject:v38];
                }
                else
                {
                  id v39 = v36;
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    v40 = v39;
                  }
                  else {
                    v40 = 0;
                  }
                  id v41 = v40;

                  if (v41) {
                    [v45 addObject:v41];
                  }
                }
              }
              else
              {
                v31 = (void *)MEMORY[0x230FBD990]();
                v32 = v20;
                v33 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  v34 = HMFGetLogIdentifier();
                  uint64_t v35 = [v30 retryCount];
                  *(_DWORD *)v51 = 138543874;
                  v52 = v34;
                  __int16 v53 = 2048;
                  uint64_t v54 = v35;
                  __int16 v55 = 2112;
                  v56 = v30;
                  _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Dropping pending request that is still around after %ld retries: %@", v51, 0x20u);
                }
              }
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v47 objects:buf count:16];
          }
          while (v27);
        }

        -[HMDNotificationRegistry _processCharacteristicsRequests:](v20, v46);
        -[HMDNotificationRegistry _processMediaPropertiesRequests:](v20, v45);

        v16 = v43;
        id v5 = v44;
      }
      else
      {
        if (v22)
        {
          v42 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v58 = v42;
          _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@No pending requests to process", buf, 0xCu);
        }
      }
    }
  }
}

- (BOOL)_processCharacteristicsRequests:(void *)a1
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v66 = v3;
  if (a1
    && (id v5 = v3,
        v6 = objc_getProperty(a1, v4, 64, 1),
        dispatch_assert_queue_V2(v6),
        [v5 count]))
  {
    id v72 = a1;
    v70 = [MEMORY[0x263EFF9C0] set];
    v67 = [MEMORY[0x263EFF9C0] set];
    v69 = +[HMDHAPMetadata getSharedInstance];
    long long v83 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v80 = 0u;
    id obj = v66;
    uint64_t v73 = [obj countByEnumeratingWithState:&v80 objects:v88 count:16];
    if (v73)
    {
      uint64_t v71 = *(void *)v81;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v81 != v71)
          {
            uint64_t v8 = v7;
            objc_enumerationMutation(obj);
            uint64_t v7 = v8;
          }
          uint64_t v74 = v7;
          v9 = *(void **)(*((void *)&v80 + 1) + 8 * v7);
          v10 = (void *)MEMORY[0x230FBD990]();
          self = (id *)v72;
          v11 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            v12 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v12;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v9;
            _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Processing characteristics request: %@", buf, 0x16u);
          }
          id v13 = v9;
          Property = objc_getProperty(self, v14, 64, 1);
          dispatch_assert_queue_V2(Property);
          long long v86 = 0u;
          long long v87 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          id v76 = (id)objc_msgSend(objc_getProperty(self, v16, 48, 1), "copy");
          uint64_t v17 = [v76 countByEnumeratingWithState:&v84 objects:buf count:16];
          if (v17)
          {
            uint64_t v18 = *(void *)v85;
            do
            {
              uint64_t v19 = 0;
              do
              {
                if (*(void *)v85 != v18) {
                  objc_enumerationMutation(v76);
                }
                id v20 = *(id *)(*((void *)&v84 + 1) + 8 * v19);
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  v21 = v20;
                }
                else {
                  v21 = 0;
                }
                id v22 = v21;

                if (v22)
                {
                  v23 = [v22 deviceIdsDestination];
                  uint64_t v24 = [v13 deviceIdsDestination];
                  if ([v23 isEqualToString:v24])
                  {
                    id v25 = [v22 accessoryUUID];
                    uint64_t v26 = [v13 accessoryUUID];
                    int v27 = [v25 isEqual:v26];

                    if (v27)
                    {
                      uint64_t v28 = [v22 characteristicInstanceIDs];
                      v29 = [v13 characteristicInstanceIDs];
                      [v28 minusSet:v29];

                      v30 = [v22 characteristicInstanceIDs];
                      BOOL v31 = [v30 count] == 0;

                      v32 = (void *)MEMORY[0x230FBD990]();
                      v33 = self;
                      v34 = HMFGetOSLogHandle();
                      BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_INFO);
                      if (v31)
                      {
                        if (v35)
                        {
                          v37 = HMFGetLogIdentifier();
                          *(_DWORD *)v89 = 138543618;
                          v90 = v37;
                          __int16 v91 = 2112;
                          id v92 = v22;
                          _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, "%{public}@Removing pending characteristics request that matches a new characteristics request: %@", v89, 0x16u);
                        }
                        objc_msgSend(objc_getProperty(v33, v38, 48, 1), "removeObject:", v22);
                      }
                      else
                      {
                        if (v35)
                        {
                          id v36 = HMFGetLogIdentifier();
                          *(_DWORD *)v89 = 138543618;
                          v90 = v36;
                          __int16 v91 = 2112;
                          id v92 = v22;
                          _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, "%{public}@Updated pending characteristics request: %@", v89, 0x16u);
                        }
                      }
                    }
                  }
                  else
                  {
                  }
                }

                ++v19;
              }
              while (v17 != v19);
              uint64_t v39 = [v76 countByEnumeratingWithState:&v84 objects:buf count:16];
              uint64_t v17 = v39;
            }
            while (v39);
          }

          id WeakRetained = objc_loadWeakRetained(self + 7);
          id v41 = [v13 accessoryUUID];
          v42 = [WeakRetained accessoryWithUUID:v41];

          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v43 = v42;
          }
          else {
            v43 = 0;
          }
          id v44 = v43;

          if (v44)
          {
            v78[0] = MEMORY[0x263EF8330];
            v78[1] = 3221225472;
            v78[2] = __59__HMDNotificationRegistry__processCharacteristicsRequests___block_invoke;
            v78[3] = &unk_264A1C3D0;
            v78[4] = v13;
            id v79 = v69;
            v45 = [v44 characteristicsPassingTest:v78];
            uint64_t v46 = [v45 count];
            long long v47 = [v13 characteristicInstanceIDs];
            LOBYTE(v46) = v46 == [v47 count];

            if (v46)
            {
              v77[0] = MEMORY[0x263EF8330];
              v77[1] = 3221225472;
              v77[2] = __59__HMDNotificationRegistry__processCharacteristicsRequests___block_invoke_157;
              v77[3] = &unk_264A24C18;
              v77[4] = v13;
              long long v48 = objc_msgSend(v45, "na_map:", v77);
              long long v49 = [[HMDNotificationRegistryCoreDataCharacteristicsRequest alloc] initWithRequest:v13 characteristicThresholds:v48];
              [v67 addObject:v49];
            }
            else
            {
              uint64_t v54 = (void *)MEMORY[0x230FBD990]();
              __int16 v55 = self;
              v56 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
              {
                v57 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                *(void *)&uint8_t buf[4] = v57;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v13;
                _os_log_impl(&dword_22F52A000, v56, OS_LOG_TYPE_INFO, "%{public}@Cannot find all characteristics for request so adding to pending requests: %@", buf, 0x16u);
              }
              [v70 addObject:v13];
            }
          }
          else
          {
            long long v50 = (void *)MEMORY[0x230FBD990]();
            v51 = self;
            v52 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              __int16 v53 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v53;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v13;
              _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_INFO, "%{public}@Cannot find accessory for characteristics request so adding to pending requests: %@", buf, 0x16u);
            }
            [v70 addObject:v13];
          }

          uint64_t v7 = v74 + 1;
        }
        while (v74 + 1 != v73);
        uint64_t v73 = [obj countByEnumeratingWithState:&v80 objects:v88 count:16];
      }
      while (v73);
    }

    objc_msgSend(objc_getProperty(v72, v58, 32, 1), "processCharacteristicsRequests:", v67);
    id v59 = (id)objc_claimAutoreleasedReturnValue();
    id v60 = v70;
    uint64_t v61 = (void *)MEMORY[0x230FBD990]();
    *(void *)&long long v84 = 0;
    *((void *)&v84 + 1) = &v84;
    *(void *)&long long v85 = 0x2020000000;
    BYTE8(v85) = 0;
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __79__HMDNotificationRegistry__processCoreDataRequestResults_pendingRequestsToAdd___block_invoke;
    v94 = &unk_264A18598;
    id v95 = v72;
    id v62 = v60;
    id v96 = v62;
    v97 = &v84;
    objc_msgSend(v59, "hmf_enumerateWithAutoreleasePoolUsingBlock:", buf);
    int v63 = *(unsigned __int8 *)(*((void *)&v84 + 1) + 24);

    _Block_object_dispose(&v84, 8);
    BOOL v64 = v63 != 0;

    -[HMDNotificationRegistry _addPendingRequests:](v72, v62);
  }
  else
  {
    BOOL v64 = 0;
  }

  return v64;
}

- (uint64_t)_processMediaPropertiesRequests:(void *)a1
{
  uint64_t v113 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v83 = v3;
  if (!a1
    || (id v5 = v3,
        Property = objc_getProperty(a1, v4, 64, 1),
        dispatch_assert_queue_V2(Property),
        ![v5 count]))
  {
    char v87 = 0;
    goto LABEL_62;
  }
  v89 = a1;
  long long v85 = [MEMORY[0x263EFF9C0] set];
  long long v84 = [MEMORY[0x263EFF9C0] set];
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id obj = v83;
  uint64_t v90 = [obj countByEnumeratingWithState:&v94 objects:v102 count:16];
  if (!v90)
  {
    char v87 = 0;
    goto LABEL_59;
  }
  char v87 = 0;
  uint64_t v88 = *(void *)v95;
  do
  {
    uint64_t v7 = 0;
    do
    {
      if (*(void *)v95 != v88)
      {
        uint64_t v8 = v7;
        objc_enumerationMutation(obj);
        uint64_t v7 = v8;
      }
      uint64_t v91 = v7;
      v9 = *(void **)(*((void *)&v94 + 1) + 8 * v7);
      v10 = (void *)MEMORY[0x230FBD990]();
      self = v89;
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v108 = v12;
        __int16 v109 = 2112;
        id v110 = v9;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Processing media properties request: %@", buf, 0x16u);
      }
      id v13 = v9;
      SEL v15 = objc_getProperty(self, v14, 64, 1);
      dispatch_assert_queue_V2(v15);
      long long v100 = 0u;
      long long v101 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      id v93 = (id)objc_msgSend(objc_getProperty(self, v16, 48, 1), "copy");
      uint64_t v17 = [v93 countByEnumeratingWithState:&v98 objects:buf count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v99;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v99 != v18) {
              objc_enumerationMutation(v93);
            }
            id v20 = *(id *)(*((void *)&v98 + 1) + 8 * v19);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v21 = v20;
            }
            else {
              v21 = 0;
            }
            id v22 = v21;

            if (v22)
            {
              v23 = [v22 deviceIdsDestination];
              uint64_t v24 = [v13 deviceIdsDestination];
              if ([v23 isEqualToString:v24])
              {
                id v25 = [v22 mediaProfileUUID];
                uint64_t v26 = [v13 mediaProfileUUID];
                int v27 = [v25 isEqual:v26];

                if (v27)
                {
                  uint64_t v28 = [v22 mediaProperties];
                  v29 = [v13 mediaProperties];
                  [v28 minusSet:v29];

                  v30 = [v22 mediaProperties];
                  BOOL v31 = [v30 count] == 0;

                  v32 = (void *)MEMORY[0x230FBD990]();
                  id v33 = self;
                  v34 = HMFGetOSLogHandle();
                  BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_INFO);
                  if (v31)
                  {
                    if (v35)
                    {
                      v37 = HMFGetLogIdentifier();
                      *(_DWORD *)v103 = 138543618;
                      v104 = v37;
                      __int16 v105 = 2112;
                      id v106 = v22;
                      _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, "%{public}@Removing pending media properties request that matches a new media properties request: %@", v103, 0x16u);
                    }
                    objc_msgSend(objc_getProperty(v33, v38, 48, 1), "removeObject:", v22);
                  }
                  else
                  {
                    if (v35)
                    {
                      id v36 = HMFGetLogIdentifier();
                      *(_DWORD *)v103 = 138543618;
                      v104 = v36;
                      __int16 v105 = 2112;
                      id v106 = v22;
                      _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, "%{public}@Updated pending media properties request: %@", v103, 0x16u);
                    }
                  }
                }
              }
              else
              {
              }
            }

            ++v19;
          }
          while (v17 != v19);
          uint64_t v39 = [v93 countByEnumeratingWithState:&v98 objects:buf count:16];
          uint64_t v17 = v39;
        }
        while (v39);
      }

      v40 = -[HMDNotificationRegistry home]((id *)self);
      id v41 = [v13 mediaProfileUUID];
      v42 = [v40 mediaProfileWithUUID:v41];

      if (v42)
      {
        v43 = [v13 mediaProperties];
        BOOL v44 = [v43 count] == 0;

        if (!v44)
        {
          int v45 = [v13 enable];
          uint64_t v46 = (void *)MEMORY[0x230FBD990]();
          long long v47 = (os_unfair_lock_s *)self;
          long long v48 = HMFGetOSLogHandle();
          BOOL v49 = os_log_type_enabled(v48, OS_LOG_TYPE_INFO);
          if (v45)
          {
            if (v49)
            {
              long long v50 = HMFGetLogIdentifier();
              v51 = [v13 mediaProperties];
              *(_DWORD *)buf = 138543874;
              v108 = v50;
              __int16 v109 = 2112;
              id v110 = v42;
              __int16 v111 = 2112;
              v112 = v51;
              _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_INFO, "%{public}@Enabling notification for media profile: %@ media properties: %@", buf, 0x20u);
            }
            v52 = [v13 mediaProperties];
            __int16 v53 = [v13 user];
            uint64_t v54 = [v13 deviceIdsDestination];
            id v55 = v42;
            id v56 = v52;
            id v57 = v53;
            id v58 = v54;
            if ([v56 count])
            {
              id v59 = v47 + 2;
              os_unfair_lock_lock_with_options();
              id v61 = objc_getProperty(v47, v60, 32, 1);
              char v62 = [v61 enableNotificationForMediaProfile:v55 mediaProperties:v56 user:v57 deviceIdsDestination:v58];

              os_unfair_lock_unlock(v59);
              if ((v62 & 1) == 0)
              {
LABEL_39:
                char v63 = 0;
LABEL_53:
                v87 |= v63;
                goto LABEL_54;
              }
              goto LABEL_50;
            }
          }
          else
          {
            if (v49)
            {
              id v72 = HMFGetLogIdentifier();
              uint64_t v73 = [v13 mediaProperties];
              *(_DWORD *)buf = 138543874;
              v108 = v72;
              __int16 v109 = 2112;
              id v110 = v42;
              __int16 v111 = 2112;
              v112 = v73;
              _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_INFO, "%{public}@Disabling notification for media profile: %@ media properties: %@", buf, 0x20u);
            }
            uint64_t v74 = [v13 mediaProperties];
            v75 = [v13 user];
            id v76 = [v13 deviceIdsDestination];
            id v55 = v42;
            id v56 = v74;
            id v57 = v75;
            id v58 = v76;
            if ([v56 count])
            {
              v77 = v47 + 2;
              os_unfair_lock_lock_with_options();
              id v79 = objc_getProperty(v47, v78, 32, 1);
              char v80 = [v79 disableNotificationForMediaProfile:v55 mediaProperties:v56 user:v57 deviceIdsDestination:v58];

              os_unfair_lock_unlock(v77);
              if ((v80 & 1) == 0) {
                goto LABEL_39;
              }
LABEL_50:
              objc_msgSend(v42, "uniqueIdentifier", v83);
              id v56 = (id)objc_claimAutoreleasedReturnValue();
              [v84 addObject:v56];
              char v63 = 1;
LABEL_52:

              goto LABEL_53;
            }
          }

          char v63 = 0;
          goto LABEL_52;
        }
        v68 = (void *)MEMORY[0x230FBD990]();
        id v69 = self;
        v70 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
        {
          uint64_t v71 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v108 = v71;
          __int16 v109 = 2112;
          id v110 = v13;
          _os_log_impl(&dword_22F52A000, v70, OS_LOG_TYPE_INFO, "%{public}@No media properties exist for request: %@", buf, 0x16u);
        }
      }
      else
      {
        BOOL v64 = (void *)MEMORY[0x230FBD990]();
        id v65 = self;
        v66 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
        {
          v67 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v108 = v67;
          __int16 v109 = 2112;
          id v110 = v13;
          _os_log_impl(&dword_22F52A000, v66, OS_LOG_TYPE_INFO, "%{public}@Cannot find media profile for media properties request so adding to pending requests: %@", buf, 0x16u);
        }
        [v85 addObject:v13];
      }
LABEL_54:

      uint64_t v7 = v91 + 1;
    }
    while (v91 + 1 != v90);
    uint64_t v90 = [obj countByEnumeratingWithState:&v94 objects:v102 count:16];
  }
  while (v90);
LABEL_59:

  -[HMDNotificationRegistry _addPendingRequests:](v89, v85);
  if ([v84 count])
  {
    long long v81 = [v84 allObjects];
    -[HMDNotificationRegistry notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles:](v89, v81);
  }
LABEL_62:

  return v87 & 1;
}

- (id)home
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 7);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void)_addPendingRequests:(void *)a1
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  Property = objc_getProperty(a1, v4, 64, 1);
  dispatch_assert_queue_V2(Property);
  if ([v3 count])
  {
    uint64_t v7 = objc_msgSend(objc_getProperty(a1, v6, 48, 1), "unionSet:", v3);
    uint64_t v8 = (void *)MEMORY[0x230FBD990](v7);
    id v9 = a1;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      SEL v14 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Resuming pending requests timer", (uint8_t *)&v13, 0xCu);
    }
    objc_msgSend(objc_getProperty(v9, v12, 40, 1), "resume");
  }
}

- (void)notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    SEL v4 = -[HMDNotificationRegistry delegates]((uint64_t)a1);
    id v5 = [v4 allObjects];

    objc_initWeak(&location, a1);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __81__HMDNotificationRegistry_notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles___block_invoke;
    v6[3] = &unk_264A185C0;
    objc_copyWeak(&v8, &location);
    id v7 = v3;
    objc_msgSend(v5, "na_each:", v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (id)delegates
{
  v2 = (os_unfair_lock_s *)(a1 + 8);
  os_unfair_lock_lock_with_options();
  id v3 = (void *)[*(id *)(a1 + 16) copy];
  os_unfair_lock_unlock(v2);
  return v3;
}

void __81__HMDNotificationRegistry_notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = WeakRetained;
    if (WeakRetained) {
      id WeakRetained = objc_getProperty(WeakRetained, v5, 64, 1);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __81__HMDNotificationRegistry_notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles___block_invoke_2;
    block[3] = &unk_264A2B5D8;
    id v7 = WeakRetained;
    objc_copyWeak(&v11, (id *)(a1 + 40));
    id v9 = v3;
    id v10 = *(id *)(a1 + 32);
    dispatch_async(v7, block);

    objc_destroyWeak(&v11);
  }
}

void __81__HMDNotificationRegistry_notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = WeakRetained;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@About to notify delegate of mediaPropertyRegistrationsDidChange %@", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 32) mediaPropertyRegistrationsDidChangeForMediaProfiles:*(void *)(a1 + 40)];
}

uint64_t __59__HMDNotificationRegistry__processCharacteristicsRequests___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 type];
  id v5 = [v3 service];
  v6 = [v5 type];

  uint64_t v7 = [*(id *)(a1 + 32) characteristicInstanceIDs];
  int v8 = [v3 instanceID];

  if ([v7 containsObject:v8]) {
    uint64_t v9 = [*(id *)(a1 + 40) shouldFilterChangeNotificationsForCharacteristicType:v4 serviceType:v6] ^ 1;
  }
  else {
    uint64_t v9 = 0;
  }

  return v9;
}

HMDCharacteristicNotificationChangeThreshold *__59__HMDNotificationRegistry__processCharacteristicsRequests___block_invoke_157(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 characteristicChangeThresholds];
  id v5 = [v3 instanceID];
  v6 = [v4 objectForKeyedSubscript:v5];

  uint64_t v7 = [[HMDCharacteristicNotificationChangeThreshold alloc] initWithCharacteristic:v3 threshold:v6];
  return v7;
}

void __79__HMDNotificationRegistry__processCoreDataRequestResults_pendingRequestsToAdd___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 coreDataRequest];
  id v5 = [v4 request];
  if ([v3 didSucceed])
  {
    if ([v3 didModify])
    {
      v6 = [v4 characteristicThresholds];
      uint64_t v7 = [v6 firstObject];
      int v8 = [v7 characteristic];
      uint64_t v9 = [v8 accessory];

      __int16 v10 = [v3 modifiedCharacteristics];
      uint64_t v11 = [v5 deviceIdsDestination];
      if (objc_msgSend(v10, "hmf_isEmpty"))
      {
LABEL_14:

        goto LABEL_15;
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      int v12 = [v5 enable];
      int v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = *(id *)(a1 + 32);
      uint64_t v15 = HMFGetOSLogHandle();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
      if (v12)
      {
        if (v16)
        {
          uint64_t v26 = HMFGetLogIdentifier();
          uint64_t v17 = [v9 name];
          [v9 uuid];
          uint64_t v24 = v27 = v13;
          uint64_t v18 = [v24 UUIDString];
          *(_DWORD *)buf = 138544130;
          v30 = v26;
          __int16 v31 = 2112;
          v32 = v17;
          __int16 v33 = 2112;
          v34 = v18;
          __int16 v35 = 2112;
          id v36 = v10;
          _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Enabling notification for accessory %@/%@ characteristics %@", buf, 0x2Au);

          int v13 = v27;
LABEL_12:
        }
      }
      else if (v16)
      {
        uint64_t v26 = HMFGetLogIdentifier();
        uint64_t v17 = [v9 name];
        id v25 = [v9 uuid];
        [v25 UUIDString];
        v23 = uint64_t v28 = v13;
        *(_DWORD *)buf = 138544130;
        v30 = v26;
        __int16 v31 = 2112;
        v32 = v17;
        __int16 v33 = 2112;
        v34 = v23;
        __int16 v35 = 2112;
        id v36 = v10;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Disabling notification for accessory %@/%@ characteristics %@", buf, 0x2Au);

        int v13 = v28;
        goto LABEL_12;
      }

      objc_msgSend(v9, "setNotificationsEnabled:forCharacteristics:clientIdentifier:", objc_msgSend(v5, "enable"), v10, v11);
      objc_msgSend(v9, "updateNotificationEnabled:forCharacteristics:onBehalfOf:", objc_msgSend(v5, "enable"), v10, v11);
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = *(id *)(a1 + 32);
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v30 = v22;
      __int16 v31 = 2112;
      v32 = v5;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Processing request: %@ failed, adding to pending requests", buf, 0x16u);
    }
    [*(id *)(a1 + 40) addObject:v5];
  }
LABEL_15:
}

- (id)logIdentifier
{
  v2 = -[HMDNotificationRegistry home]((id *)&self->super.super.isa);
  id v3 = [v2 uuid];
  id v4 = [v3 UUIDString];

  return v4;
}

- (void)addDelegate:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    __int16 v10 = v8;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@adding delegate %@", (uint8_t *)&v9, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  [(NSHashTable *)v6->_delegates addObject:v4];
  os_unfair_lock_unlock(&v6->_lock);
}

- (BOOL)setNotificationsEnabled:(BOOL)a3 user:(id)a4 deviceIdsDestination:(id)a5 characteristicsPayload:(id)a6 characteristicChangeThresholdsPayload:(id)a7 mediaPropertiesPayload:(id)a8 actionSetsPayload:(id)a9 matterNotificationPayload:(id)a10
{
  BOOL v216 = a3;
  uint64_t v270 = *MEMORY[0x263EF8340];
  id v218 = a4;
  id v219 = a5;
  id v15 = a6;
  id v203 = a7;
  id v197 = a8;
  id v199 = a9;
  id v211 = a10;
  if (self) {
    Property = objc_getProperty(self, v16, 64, 1);
  }
  else {
    Property = 0;
  }
  dispatch_assert_queue_V2(Property);
  uint64_t v18 = (void *)MEMORY[0x230FBD990]();
  v204 = self;
  selfa = self;
  uint64_t v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = HMFGetLogIdentifier();
    v21 = HMFBooleanToString();
    id v22 = [v218 shortDescription];
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v20;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v21;
    *(_WORD *)&buf[22] = 2112;
    v268 = v22;
    LOWORD(v269) = 2112;
    *(void *)((char *)&v269 + 2) = v219;
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Setting notifications enabled to %@ for user: %@ deviceIdsDestination: %@", buf, 0x2Au);
  }
  v212 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v199, "count"));
  v206 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v15, "count"));
  long long v248 = 0u;
  long long v249 = 0u;
  long long v246 = 0u;
  long long v247 = 0u;
  id obj = v15;
  uint64_t v224 = [obj countByEnumeratingWithState:&v246 objects:v261 count:16];
  if (v224)
  {
    id v221 = *(id *)v247;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(id *)v247 != v221) {
          objc_enumerationMutation(obj);
        }
        id v24 = *(id *)(*((void *)&v246 + 1) + 8 * v23);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v25 = v24;
        }
        else {
          id v25 = 0;
        }
        id v26 = v25;

        if (v26)
        {
          int v27 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v26];
          v226 = v27;
          if (v27)
          {
            uint64_t v28 = [v27 UUIDString];
            v29 = [obj objectForKeyedSubscript:v28];

            id v30 = v29;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              __int16 v31 = v30;
            }
            else {
              __int16 v31 = 0;
            }
            id v32 = v31;

            if (v32)
            {
              __int16 v33 = [[HMDNotificationRegistryCharacteristicsRequest alloc] initWithEnable:v216 user:v218 deviceIdsDestination:v219 accessoryUUID:v226];
              id v34 = v203;
              id v214 = v226;
              if (v204)
              {
                __int16 v35 = (void *)MEMORY[0x230FBD990]();
                id v36 = [v214 UUIDString];
                uint64_t v37 = [v34 objectForKeyedSubscript:v36];

                id v38 = v37;
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  uint64_t v39 = v38;
                }
                else {
                  uint64_t v39 = 0;
                }
                id v40 = v39;

                if (v40)
                {
                  id v41 = [MEMORY[0x263EFF9A0] dictionary];
                  *(void *)buf = MEMORY[0x263EF8330];
                  *(void *)&buf[8] = 3221225472;
                  *(void *)&buf[16] = __74__HMDNotificationRegistry_parseChangeThresholdsFromPayload_accessoryUUID___block_invoke;
                  v268 = &unk_264A18570;
                  *(void *)&long long v269 = selfa;
                  id v42 = v41;
                  *((void *)&v269 + 1) = v42;
                  objc_msgSend(v40, "na_each:", buf);
                  id v209 = v26;
                  id v43 = v30;
                  BOOL v44 = v35;
                  int v45 = v33;
                  id v46 = v32;
                  id v47 = v34;
                  long long v48 = (void *)*((void *)&v269 + 1);
                  id v49 = v42;

                  id v34 = v47;
                  id v32 = v46;
                  __int16 v33 = v45;
                  __int16 v35 = v44;
                  id v30 = v43;
                  id v26 = v209;
                }
                else
                {
                  id v49 = (id)MEMORY[0x263EFFA78];
                }
              }
              else
              {
                id v49 = 0;
              }

              if ([v49 count])
              {
                v66 = [(HMDNotificationRegistryCharacteristicsRequest *)v33 characteristicChangeThresholds];
                [v66 addEntriesFromDictionary:v49];
              }
              v67 = [(HMDNotificationRegistryCharacteristicsRequest *)v33 characteristicInstanceIDs];
              [v67 addObjectsFromArray:v32];

              [v206 addObject:v33];
            }
            else
            {
              SEL v60 = (void *)MEMORY[0x230FBD990]();
              id v61 = selfa;
              char v62 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
              {
                char v63 = HMFGetLogIdentifier();
                BOOL v64 = objc_opt_class();
                *(_DWORD *)buf = 138543874;
                *(void *)&uint8_t buf[4] = v63;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v30;
                *(_WORD *)&buf[22] = 2112;
                v268 = v64;
                id v65 = v64;
                _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_INFO, "%{public}@Ignoring notification registration characteristics payload value that is not an array: %@)%@)", buf, 0x20u);
              }
            }
          }
          else
          {
            id v56 = (void *)MEMORY[0x230FBD990]();
            id v57 = selfa;
            id v58 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
            {
              id v59 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v59;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v26;
              _os_log_impl(&dword_22F52A000, v58, OS_LOG_TYPE_INFO, "%{public}@Ignoring accessory UUID string that cannot be converted in a UUID: %@", buf, 0x16u);
            }
          }
        }
        else
        {
          long long v50 = (void *)MEMORY[0x230FBD990]();
          v51 = selfa;
          v52 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            __int16 v53 = HMFGetLogIdentifier();
            uint64_t v54 = objc_opt_class();
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v53;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v24;
            *(_WORD *)&buf[22] = 2112;
            v268 = v54;
            id v55 = v54;
            _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_INFO, "%{public}@Ignoring notification registration characteristics payload key that is not a string: %@ (%@)", buf, 0x20u);
          }
        }

        ++v23;
      }
      while (v224 != v23);
      uint64_t v68 = [obj countByEnumeratingWithState:&v246 objects:v261 count:16];
      uint64_t v224 = v68;
    }
    while (v68);
  }

  v210 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v197, "count"));
  long long v244 = 0u;
  long long v245 = 0u;
  long long v242 = 0u;
  long long v243 = 0u;
  id v222 = v197;
  uint64_t v69 = [v222 countByEnumeratingWithState:&v242 objects:v260 count:16];
  if (v69)
  {
    uint64_t v227 = *(void *)v243;
    do
    {
      uint64_t v70 = 0;
      uint64_t v207 = v69;
      do
      {
        if (*(void *)v243 != v227) {
          objc_enumerationMutation(v222);
        }
        id v71 = *(id *)(*((void *)&v242 + 1) + 8 * v70);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v72 = v71;
        }
        else {
          id v72 = 0;
        }
        id v73 = v72;

        if (v73)
        {
          uint64_t v74 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v73];
          v75 = v74;
          if (v74)
          {
            id v76 = [v74 UUIDString];
            v77 = [v222 objectForKeyedSubscript:v76];

            id v78 = v77;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v79 = v78;
            }
            else {
              id v79 = 0;
            }
            id v80 = v79;

            if (v80)
            {
              long long v81 = [[HMDNotificationRegistryMediaPropertiesRequest alloc] initWithEnable:v216 user:v218 deviceIdsDestination:v219 mediaProfileUUID:v75];
              long long v82 = [(HMDNotificationRegistryMediaPropertiesRequest *)v81 mediaProperties];
              [v82 addObjectsFromArray:v80];

              [v210 addObject:v81];
            }
            else
            {
              id v93 = (void *)MEMORY[0x230FBD990]();
              long long v94 = selfa;
              long long v95 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
              {
                long long v96 = HMFGetLogIdentifier();
                long long v97 = objc_opt_class();
                *(_DWORD *)buf = 138543874;
                *(void *)&uint8_t buf[4] = v96;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v78;
                *(_WORD *)&buf[22] = 2112;
                v268 = v97;
                id v98 = v97;
                _os_log_impl(&dword_22F52A000, v95, OS_LOG_TYPE_INFO, "%{public}@Ignoring notification registration media properties payload value that is not an array: %@ (%@)", buf, 0x20u);

                uint64_t v69 = v207;
              }
            }
          }
          else
          {
            v89 = (void *)MEMORY[0x230FBD990]();
            uint64_t v90 = selfa;
            uint64_t v91 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
            {
              id v92 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v92;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v73;
              _os_log_impl(&dword_22F52A000, v91, OS_LOG_TYPE_INFO, "%{public}@Ignoring media profile UUID string that cannot be converted in a UUID: %@", buf, 0x16u);
            }
          }
        }
        else
        {
          long long v83 = (void *)MEMORY[0x230FBD990]();
          long long v84 = selfa;
          long long v85 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
          {
            long long v86 = HMFGetLogIdentifier();
            char v87 = objc_opt_class();
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v86;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v71;
            *(_WORD *)&buf[22] = 2112;
            v268 = v87;
            id v88 = v87;
            _os_log_impl(&dword_22F52A000, v85, OS_LOG_TYPE_INFO, "%{public}@Ignoring notification registration media properties payload key that is not a string: %@ (%@)", buf, 0x20u);
          }
        }

        ++v70;
      }
      while (v69 != v70);
      uint64_t v69 = [v222 countByEnumeratingWithState:&v242 objects:v260 count:16];
    }
    while (v69);
  }

  long long v240 = 0u;
  long long v241 = 0u;
  long long v239 = 0u;
  long long v238 = 0u;
  id v215 = v199;
  uint64_t v99 = [v215 countByEnumeratingWithState:&v238 objects:v259 count:16];
  if (v99)
  {
    uint64_t v100 = *(void *)v239;
    do
    {
      for (uint64_t i = 0; i != v99; ++i)
      {
        if (*(void *)v239 != v100) {
          objc_enumerationMutation(v215);
        }
        id v102 = *(id *)(*((void *)&v238 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v103 = v102;
        }
        else {
          v103 = 0;
        }
        id v104 = v103;

        if (v104)
        {
          __int16 v105 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v104];
          if (v105)
          {
            id v106 = [[HMDNotificationRegistryActionSetRequest alloc] initWithEnable:v216 user:v218 deviceIdsDestination:v219 actionSetUUID:v105];
            [v212 addObject:v106];
          }
          else
          {
            __int16 v111 = (void *)MEMORY[0x230FBD990]();
            v112 = selfa;
            uint64_t v113 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
            {
              v114 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v114;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v104;
              _os_log_impl(&dword_22F52A000, v113, OS_LOG_TYPE_ERROR, "%{public}@Action set uuid string (%@) could not be converted to a uuid", buf, 0x16u);
            }
          }
        }
        else
        {
          v107 = (void *)MEMORY[0x230FBD990]();
          v108 = selfa;
          __int16 v109 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
          {
            id v110 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v110;
            _os_log_impl(&dword_22F52A000, v109, OS_LOG_TYPE_ERROR, "%{public}@Action set element was not a string", buf, 0xCu);
          }
        }
      }
      uint64_t v99 = [v215 countByEnumeratingWithState:&v238 objects:v259 count:16];
    }
    while (v99);
  }

  id v196 = v212;
  if (!v204
    || (v116 = objc_getProperty(selfa, v115, 64, 1),
        dispatch_assert_queue_V2(v116),
        ![v196 count]))
  {
    int v208 = 0;
    goto LABEL_141;
  }
  v200 = [MEMORY[0x263EFF9C0] set];
  v198 = [MEMORY[0x263EFF9C0] set];
  long long v252 = 0u;
  long long v253 = 0u;
  long long v250 = 0u;
  long long v251 = 0u;
  id v201 = v196;
  uint64_t v205 = [v201 countByEnumeratingWithState:&v250 objects:v262 count:16];
  if (!v205)
  {
    int v208 = 0;
    goto LABEL_138;
  }
  int v208 = 0;
  uint64_t v202 = *(void *)v251;
  do
  {
    uint64_t v117 = 0;
    do
    {
      if (*(void *)v251 != v202)
      {
        uint64_t v118 = v117;
        objc_enumerationMutation(v201);
        uint64_t v117 = v118;
      }
      uint64_t v213 = v117;
      v119 = *(void **)(*((void *)&v250 + 1) + 8 * v117);
      v120 = (void *)MEMORY[0x230FBD990]();
      v228 = selfa;
      v121 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v121, OS_LOG_TYPE_INFO))
      {
        v122 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v122;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v119;
        _os_log_impl(&dword_22F52A000, v121, OS_LOG_TYPE_INFO, "%{public}@Processing action set request: %@", buf, 0x16u);
      }
      id v217 = v119;
      v124 = objc_getProperty(v228, v123, 64, 1);
      dispatch_assert_queue_V2(v124);
      long long v256 = 0u;
      long long v257 = 0u;
      long long v254 = 0u;
      long long v255 = 0u;
      v126 = objc_msgSend(objc_getProperty(v228, v125, 48, 1), "copy");
      uint64_t v127 = [v126 countByEnumeratingWithState:&v254 objects:buf count:16];
      if (v127)
      {
        uint64_t v128 = *(void *)v255;
        do
        {
          for (uint64_t j = 0; j != v127; ++j)
          {
            if (*(void *)v255 != v128) {
              objc_enumerationMutation(v126);
            }
            id v130 = *(id *)(*((void *)&v254 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v131 = v130;
            }
            else {
              v131 = 0;
            }
            id v132 = v131;

            if (v132)
            {
              v133 = [v132 deviceIdsDestination];
              v134 = [v132 deviceIdsDestination];
              if ([v133 isEqualToString:v134])
              {
                v135 = [v132 actionSetUUID];
                v136 = [v132 actionSetUUID];
                int v137 = [v135 isEqual:v136];

                if (v137)
                {
                  v138 = (void *)MEMORY[0x230FBD990]();
                  v139 = v228;
                  v140 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v140, OS_LOG_TYPE_INFO))
                  {
                    v141 = HMFGetLogIdentifier();
                    *(_DWORD *)v263 = 138543618;
                    v264 = v141;
                    __int16 v265 = 2112;
                    id v266 = v132;
                    _os_log_impl(&dword_22F52A000, v140, OS_LOG_TYPE_INFO, "%{public}@Removing pending action set request that matches a new action set request: %@", v263, 0x16u);
                  }
                  objc_msgSend(objc_getProperty(v139, v142, 48, 1), "removeObject:", v132);
                }
              }
              else
              {
              }
            }
          }
          uint64_t v127 = [v126 countByEnumeratingWithState:&v254 objects:buf count:16];
        }
        while (v127);
      }

      v143 = -[HMDNotificationRegistry home]((id *)&v228->super.super.isa);
      v144 = [v217 actionSetUUID];
      v145 = [v143 actionSetWithUUID:v144];

      if (v145)
      {
        int v146 = [v217 enable];
        v147 = (void *)MEMORY[0x230FBD990]();
        v148 = v228;
        v149 = HMFGetOSLogHandle();
        BOOL v150 = os_log_type_enabled(v149, OS_LOG_TYPE_INFO);
        if (v146)
        {
          if (v150)
          {
            v151 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v151;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v145;
            _os_log_impl(&dword_22F52A000, v149, OS_LOG_TYPE_INFO, "%{public}@Enabling notification for action set: %@", buf, 0x16u);
          }
          v152 = [v145 uuid];
          v153 = [v217 user];
          v154 = [v217 deviceIdsDestination];
          id v155 = v152;
          id v156 = v153;
          id v157 = v154;
          v158 = v148 + 2;
          os_unfair_lock_lock_with_options();
          id v160 = objc_getProperty(v148, v159, 32, 1);
          char v161 = [v160 enableNotificationForActionSetUUID:v155 user:v156 deviceIdsDestination:v157];

          os_unfair_lock_unlock(v158);
          if ((v161 & 1) == 0) {
            goto LABEL_124;
          }
LABEL_131:
          v178 = [v145 uuid];
          [v198 addObject:v178];

          int v162 = 1;
        }
        else
        {
          if (v150)
          {
            v167 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v167;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v145;
            _os_log_impl(&dword_22F52A000, v149, OS_LOG_TYPE_INFO, "%{public}@Disabling notification for action set: %@", buf, 0x16u);
          }
          v168 = [v145 uuid];
          v169 = [v217 user];
          v170 = [v217 deviceIdsDestination];
          id v171 = v168;
          id v172 = v169;
          id v173 = v170;
          v174 = v148 + 2;
          os_unfair_lock_lock_with_options();
          id v176 = objc_getProperty(v148, v175, 32, 1);
          int v177 = [v176 disableNotificationForActionSetUUID:v171 user:v172 deviceIdsDestination:v173];

          os_unfair_lock_unlock(v174);
          if (v177) {
            goto LABEL_131;
          }
LABEL_124:
          int v162 = 0;
        }
        v208 |= v162;
        goto LABEL_133;
      }
      v163 = (void *)MEMORY[0x230FBD990]();
      v164 = v228;
      v165 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v165, OS_LOG_TYPE_INFO))
      {
        v166 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v166;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v217;
        _os_log_impl(&dword_22F52A000, v165, OS_LOG_TYPE_INFO, "%{public}@Cannot find action set for action set request so adding to pending requests: %@", buf, 0x16u);
      }
      [v200 addObject:v217];
LABEL_133:

      uint64_t v117 = v213 + 1;
    }
    while (v213 + 1 != v205);
    uint64_t v205 = [v201 countByEnumeratingWithState:&v250 objects:v262 count:16];
  }
  while (v205);
LABEL_138:

  -[HMDNotificationRegistry _addPendingRequests:](selfa, v200);
  if ([v198 count])
  {
    v179 = [v198 allObjects];
    -[HMDNotificationRegistry notifyDelegatesOfRegistryUpdatesForActionSets:](selfa, v179);
  }
LABEL_141:

  v225 = -[HMDNotificationRegistry home]((id *)&selfa->super.super.isa);
  v180 = (void *)MEMORY[0x230FBD990]();
  v229 = selfa;
  v181 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v181, OS_LOG_TYPE_INFO))
  {
    v182 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v182;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v211;
    _os_log_impl(&dword_22F52A000, v181, OS_LOG_TYPE_INFO, "%{public}@Handling notification registration for matter attributes. payload=%@", buf, 0x16u);
  }
  long long v236 = 0u;
  long long v237 = 0u;
  long long v234 = 0u;
  long long v235 = 0u;
  v183 = [v225 hapAccessories];
  uint64_t v184 = [v183 countByEnumeratingWithState:&v234 objects:v258 count:16];
  if (v184)
  {
    char v185 = 0;
    uint64_t v186 = *(void *)v235;
    do
    {
      for (uint64_t k = 0; k != v184; ++k)
      {
        if (*(void *)v235 != v186) {
          objc_enumerationMutation(v183);
        }
        v188 = *(void **)(*((void *)&v234 + 1) + 8 * k);
        v189 = [v188 matterNodeID];
        if (([v189 isEqual:&unk_26E470C00] & 1) == 0)
        {
          v190 = objc_msgSend(v211, "hmf_dictionaryForKey:", v189);
          BOOL v191 = v190 == 0;

          if (!v191)
          {
            v230[0] = MEMORY[0x263EF8330];
            v230[1] = 3221225472;
            v230[2] = __205__HMDNotificationRegistry_setNotificationsEnabled_user_deviceIdsDestination_characteristicsPayload_characteristicChangeThresholdsPayload_mediaPropertiesPayload_actionSetsPayload_matterNotificationPayload___block_invoke;
            v230[3] = &unk_264A2EA20;
            id v231 = v189;
            v232 = v229;
            id v233 = v225;
            [v188 setCHIPReportHandler:v230];

            char v185 = 1;
          }
        }
      }
      uint64_t v184 = [v183 countByEnumeratingWithState:&v234 objects:v258 count:16];
    }
    while (v184);

    if (v185)
    {
      [(HMDNotificationRegistry *)v229 storeCHIPRemoteSubscriberWithRemoteSourceID:v219];
      int v192 = 1;
      goto LABEL_157;
    }
  }
  else
  {
  }
  int v192 = 0;
LABEL_157:
  BOOL v193 = -[HMDNotificationRegistry _processCharacteristicsRequests:](v229, v206);
  int v194 = v193 | -[HMDNotificationRegistry _processMediaPropertiesRequests:](v229, v210);
  if ((v192 | v208 | v194)) {
    [v225 saveToCurrentAccountWithReason:@"kModifyCharacterisiticNotificationsRequestKey"];
  }

  return (v194 | v208 | v192) & 1;
}

void __205__HMDNotificationRegistry_setNotificationsEnabled_user_deviceIdsDestination_characteristicsPayload_characteristicChangeThresholdsPayload_mediaPropertiesPayload_actionSetsPayload_matterNotificationPayload___block_invoke(uint64_t a1, void *a2)
{
  v10[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  v9[0] = @"HMDHomeCHIPNodeIDMessageKey";
  v9[1] = @"HMDHomeCHIPReportMessageKey";
  v10[0] = v3;
  v10[1] = a2;
  id v4 = NSDictionary;
  id v5 = a2;
  v6 = [v4 dictionaryWithObjects:v10 forKeys:v9 count:2];
  uint64_t v7 = [MEMORY[0x263F42590] messageWithName:@"HMDHomeCHIPSendReportMessage" messagePayload:v6];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __205__HMDNotificationRegistry_setNotificationsEnabled_user_deviceIdsDestination_characteristicsPayload_characteristicChangeThresholdsPayload_mediaPropertiesPayload_actionSetsPayload_matterNotificationPayload___block_invoke_2;
  v8[3] = &unk_264A2F0C8;
  v8[4] = *(void *)(a1 + 40);
  [v7 setResponseHandler:v8];
  [*(id *)(a1 + 48) handleCHIPSendReportMessage:v7];
}

void __205__HMDNotificationRegistry_setNotificationsEnabled_user_deviceIdsDestination_characteristicsPayload_characteristicChangeThresholdsPayload_mediaPropertiesPayload_actionSetsPayload_matterNotificationPayload___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  int v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    __int16 v10 = HMFGetLogIdentifier();
    int v11 = 138543618;
    id v12 = v10;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEBUG, "%{public}@CHIP report handling complete: error %@", (uint8_t *)&v11, 0x16u);
  }
}

- (void)notifyDelegatesOfRegistryUpdatesForActionSets:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = -[HMDNotificationRegistry delegates]((uint64_t)a1);
    id v5 = [v4 allObjects];

    objc_initWeak(&location, a1);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __73__HMDNotificationRegistry_notifyDelegatesOfRegistryUpdatesForActionSets___block_invoke;
    v6[3] = &unk_264A185C0;
    objc_copyWeak(&v8, &location);
    id v7 = v3;
    objc_msgSend(v5, "na_each:", v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __73__HMDNotificationRegistry_notifyDelegatesOfRegistryUpdatesForActionSets___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = WeakRetained;
    if (WeakRetained) {
      id WeakRetained = objc_getProperty(WeakRetained, v5, 64, 1);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__HMDNotificationRegistry_notifyDelegatesOfRegistryUpdatesForActionSets___block_invoke_2;
    block[3] = &unk_264A2B5D8;
    id v7 = WeakRetained;
    objc_copyWeak(&v11, (id *)(a1 + 40));
    id v9 = v3;
    id v10 = *(id *)(a1 + 32);
    dispatch_async(v7, block);

    objc_destroyWeak(&v11);
  }
}

void __73__HMDNotificationRegistry_notifyDelegatesOfRegistryUpdatesForActionSets___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = WeakRetained;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@About to notify delegate of stateRegistrationsDidChangeForActionSetUUIDs %@", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 32) stateRegistrationsDidChangeForActionSetUUIDs:*(void *)(a1 + 40)];
}

void __74__HMDNotificationRegistry_parseChangeThresholdsFromPayload_accessoryUUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v8 = v7;
  }
  else {
    int v8 = 0;
  }
  id v9 = v8;

  id v10 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  if (v9) {
    BOOL v13 = v12 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    id v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = *(id *)(a1 + 32);
    BOOL v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      int v22 = 138543874;
      uint64_t v23 = v17;
      __int16 v24 = 2112;
      id v25 = v9;
      __int16 v26 = 2112;
      id v27 = v12;
      uint64_t v18 = "%{public}@Change threshold key %@ or value %@ was not of expected type";
LABEL_18:
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v22, 0x20u);
    }
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v19 = [v9 integerValue];
  if (v19 <= 0)
  {
    id v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = *(id *)(a1 + 32);
    BOOL v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      int v22 = 138543874;
      uint64_t v23 = v17;
      __int16 v24 = 2112;
      id v25 = v9;
      __int16 v26 = 2112;
      id v27 = v12;
      uint64_t v18 = "%{public}@Change threshold key %@ with value %@ is an invalid instance id";
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  id v20 = *(void **)(a1 + 40);
  v21 = [NSNumber numberWithInteger:v19];
  [v20 setObject:v12 forKeyedSubscript:v21];

LABEL_20:
}

- (void)storeCHIPRemoteSubscriberWithRemoteSourceID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(HMDNotificationRegistry *)self chipRemoteSubscribers];

    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      [(HMDNotificationRegistry *)self setChipRemoteSubscribers:v6];
    }
    id v7 = [(HMDNotificationRegistry *)self chipRemoteSubscribers];
    [v7 addObject:v4];
  }
}

- (void)auditNotificationDestinations:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v31 = a4;
  id v7 = [MEMORY[0x263EFF980] array];
  locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self) {
    id Property = objc_getProperty(self, v8, 32, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;
  uint64_t v11 = [v10 removeCharacteristicRegistrationsWithoutAllowedDestinations:v6];

  if (isiOSDevice())
  {
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke;
    v40[3] = &unk_264A184C0;
    id v41 = v31;
    id v42 = v7;
    objc_msgSend(v11, "na_each:", v40, lock);
  }
  id v12 = +[HMDDeviceCapabilities deviceCapabilities];
  int v13 = [v12 isResidentCapable];

  if (v13)
  {
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke_129;
    v38[3] = &unk_264A184E8;
    id v39 = v31;
    id v15 = objc_msgSend(v11, "na_map:", v38);
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke_2_131;
    v36[3] = &unk_264A28320;
    v36[4] = self;
    id v37 = v7;
    objc_msgSend(v15, "na_each:", v36);
  }
  if (self) {
    id v16 = objc_getProperty(self, v14, 32, 1);
  }
  else {
    id v16 = 0;
  }
  id v17 = v16;
  uint64_t v18 = [v17 removeMediaRegistrationsWithoutAllowedDestinations:v6];

  if ([v18 count])
  {
    id v20 = objc_msgSend(v18, "na_map:", &__block_literal_global_135);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke_2_136;
    aBlock[3] = &unk_264A2F820;
    aBlock[4] = self;
    id v21 = v20;
    id v35 = v21;
    int v22 = _Block_copy(aBlock);
    [v7 addObject:v22];
  }
  if (self) {
    id v23 = objc_getProperty(self, v19, 32, 1);
  }
  else {
    id v23 = 0;
  }
  id v24 = v23;
  id v25 = [v24 removeActionSetRegistrationsWithoutAllowedDestinations:v6];

  if ([v25 count])
  {
    __int16 v26 = objc_msgSend(v25, "na_map:", &__block_literal_global_140_28194);
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke_4;
    v32[3] = &unk_264A2F820;
    v32[4] = self;
    id v27 = v26;
    id v33 = v27;
    uint64_t v28 = _Block_copy(v32);
    [v7 addObject:v28];
  }
  os_unfair_lock_unlock(locka);
  objc_msgSend(v7, "na_each:", &__block_literal_global_143_28195);
}

void __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 accessoryUUID];
  id v6 = [v4 accessoryWithUUID:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    id v9 = [v3 characteristicInstanceID];
    id v10 = [v8 hmdCharacteristicForInstanceId:v9];

    uint64_t v11 = [v3 deviceIdsDestination];
    id v12 = *(void **)(a1 + 40);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke_2;
    aBlock[3] = &unk_264A2F2F8;
    id v17 = v11;
    id v18 = v10;
    id v19 = v8;
    id v13 = v10;
    id v14 = v11;
    id v15 = _Block_copy(aBlock);
    [v12 addObject:v15];
  }
}

id __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke_129(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 accessoryUUID];
  id v6 = [v4 accessoryWithUUID:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    id v9 = [v3 characteristicInstanceID];
    id v10 = [v8 hmdCharacteristicForInstanceId:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke_2_131(uint64_t a1, void *a2)
{
  id v4 = a2;
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v3, 32, 1);
  }
  id v6 = [Property destinationsToNotifyForCharacteristic:v4];
  if (![v6 count])
  {
    id v7 = [v4 accessory];
    id v8 = *(void **)(a1 + 40);
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    id v13 = __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke_3;
    id v14 = &unk_264A2F820;
    id v15 = v4;
    id v16 = v7;
    id v9 = v7;
    id v10 = _Block_copy(&v11);
    objc_msgSend(v8, "addObject:", v10, v11, v12, v13, v14);
  }
}

void __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke_2_136(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) allObjects];
  -[HMDNotificationRegistry notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles:](v1, v2);
}

void __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) allObjects];
  -[HMDNotificationRegistry notifyDelegatesOfRegistryUpdatesForActionSets:](v1, v2);
}

uint64_t __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke_3_137(uint64_t a1, void *a2)
{
  return [a2 actionSetUUID];
}

uint64_t __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke_132(uint64_t a1, void *a2)
{
  return [a2 mediaProfileUniqueIdentifier];
}

void __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = HMFGetLogIdentifier();
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    id v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    _os_log_impl(&dword_22F52A000, v3, OS_LOG_TYPE_INFO, "%{public}@Deregistering client %@ for notification for characteristic %@", buf, 0x20u);
  }
  id v6 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v8 count:1];
  [v6 setNotificationsEnabled:0 forCharacteristics:v7 clientIdentifier:0];
}

void __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke_2(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = HMFGetLogIdentifier();
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    *(_DWORD *)buf = 138543874;
    __int16 v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl(&dword_22F52A000, v3, OS_LOG_TYPE_INFO, "%{public}@Deregistering client %@ for notification for characteristic %@", buf, 0x20u);
  }
  id v7 = (void *)a1[6];
  uint64_t v9 = a1[5];
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
  [v7 setNotificationsEnabled:0 forCharacteristics:v8 clientIdentifier:a1[4]];
}

- (id)destinationsRegisteredForNotificationsForActionSetResponses:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v19 = a3;
  if ([v19 count])
  {
    id v4 = [MEMORY[0x263EFF9C0] set];
    locuint64_t k = &self->_lock;
    os_unfair_lock_lock_with_options();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v5 = v19;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v20 + 1) + 8 * v9);
          if (self) {
            id Property = objc_getProperty(self, v6, 32, 1);
          }
          else {
            id Property = 0;
          }
          id v12 = Property;
          uint64_t v13 = objc_msgSend(v10, "actionSetUUID", lock);
          __int16 v14 = [v12 destinationsToNotifyForActionSetUUID:v13];

          [v4 addObjectsFromArray:v14];
          ++v9;
        }
        while (v7 != v9);
        uint64_t v15 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
        uint64_t v7 = v15;
      }
      while (v15);
    }

    os_unfair_lock_unlock(lock);
    uint64_t v16 = (void *)[v4 copy];
  }
  else
  {
    uint64_t v16 = [MEMORY[0x263EFFA08] set];
  }

  return v16;
}

- (id)destinationsRegisteredForNotificationsForProperties:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [MEMORY[0x263EFF9C0] set];
    os_unfair_lock_lock_with_options();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v4;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v19;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * v10);
          if (self) {
            id Property = objc_getProperty(self, v7, 32, 1);
          }
          else {
            id Property = 0;
          }
          id v13 = Property;
          __int16 v14 = [v13 destinationsToNotifyForMediaPropertyResponse:v11];

          [v5 addObjectsFromArray:v14];
          ++v10;
        }
        while (v8 != v10);
        uint64_t v15 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        uint64_t v8 = v15;
      }
      while (v15);
    }

    os_unfair_lock_unlock(&self->_lock);
    uint64_t v16 = (void *)[v5 copy];
  }
  else
  {
    uint64_t v16 = [MEMORY[0x263EFFA08] set];
  }

  return v16;
}

- (id)destinationsRegisteredForNotificationsForCharacteristics:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9C0] set];
  if ([v4 count])
  {
    os_unfair_lock_lock_with_options();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v4;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v19;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * v10);
          if (self) {
            id Property = objc_getProperty(self, v7, 32, 1);
          }
          else {
            id Property = 0;
          }
          id v13 = Property;
          __int16 v14 = [v13 destinationsToNotifyForCharacteristic:v11];

          [v5 addObjectsFromArray:v14];
          ++v10;
        }
        while (v8 != v10);
        uint64_t v15 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        uint64_t v8 = v15;
      }
      while (v15);
    }

    os_unfair_lock_unlock(&self->_lock);
  }
  uint64_t v16 = (void *)[v5 copy];

  return v16;
}

- (id)characteristicsByDestinationForCharacteristics:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  id v6 = [v4 dictionary];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __74__HMDNotificationRegistry_characteristicsByDestinationForCharacteristics___block_invoke;
  void v10[3] = &unk_264A24CB8;
  v10[4] = self;
  uint64_t v7 = objc_msgSend(v5, "na_reduceWithInitialValue:reducer:", v6, v10);

  uint64_t v8 = (void *)[v7 copy];
  return v8;
}

id __74__HMDNotificationRegistry_characteristicsByDestinationForCharacteristics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v7 = a3;
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v6, 32, 1);
  }
  uint64_t v9 = [Property destinationsToNotifyForCharacteristic:v5];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __74__HMDNotificationRegistry_characteristicsByDestinationForCharacteristics___block_invoke_2;
  v15[3] = &unk_264A2B8C0;
  id v10 = v7;
  id v16 = v10;
  id v17 = v5;
  id v11 = v5;
  objc_msgSend(v9, "na_each:", v15);
  id v12 = v17;
  id v13 = v10;

  return v13;
}

void __74__HMDNotificationRegistry_characteristicsByDestinationForCharacteristics___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  if (!v3)
  {
    id v3 = [MEMORY[0x263EFF9C0] set];
    [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v4];
  }
  [v3 addObject:*(void *)(a1 + 40)];
}

- (id)filterActionSetResponses:(id)a3 deviceIdsDestination:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v21 = v6;
  if ([v6 count])
  {
    long long v22 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    locuint64_t k = &self->_lock;
    os_unfair_lock_lock_with_options();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = v6;
    uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v25;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v24 + 1) + 8 * v11);
          if (self) {
            id Property = objc_getProperty(self, v8, 32, 1);
          }
          else {
            id Property = 0;
          }
          id v14 = Property;
          uint64_t v15 = objc_msgSend(v12, "actionSetUUID", lock);
          id v16 = [v14 destinationsToNotifyForActionSetUUID:v15];

          if ([v16 containsObject:v7]) {
            [v22 addObject:v12];
          }

          ++v11;
        }
        while (v9 != v11);
        uint64_t v17 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
        uint64_t v9 = v17;
      }
      while (v17);
    }

    os_unfair_lock_unlock(lock);
    long long v18 = (void *)[v22 copy];
  }
  else
  {
    long long v18 = (void *)MEMORY[0x263EFFA68];
  }

  return v18;
}

- (BOOL)hasRegistrationsForActionSetUUID:(id)a3
{
  id v4 = a3;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self) {
    id Property = objc_getProperty(self, v6, 32, 1);
  }
  else {
    id Property = 0;
  }
  id v8 = Property;
  char v9 = [v8 hasEnabledRegistrationForActionSetUUID:v4];

  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (id)propertiesRegisteredForMediaProfileUniqueIdentifier:(id)a3
{
  id v4 = a3;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self) {
    id Property = objc_getProperty(self, v6, 32, 1);
  }
  else {
    id Property = 0;
  }
  id v8 = Property;
  char v9 = [v8 mediaPropertiesRegisteredForMediaProfileUniqueIdentifier:v4];

  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (id)filterProperties:(id)a3 deviceIdsDestination:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    long long v20 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    os_unfair_lock_lock_with_options();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v6;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v22;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * v12);
          if (self) {
            id Property = objc_getProperty(self, v9, 32, 1);
          }
          else {
            id Property = 0;
          }
          id v15 = Property;
          id v16 = [v15 destinationsToNotifyForMediaPropertyResponse:v13];

          if ([v16 containsObject:v7]) {
            [v20 addObject:v13];
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v17 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
        uint64_t v10 = v17;
      }
      while (v17);
    }

    os_unfair_lock_unlock(&self->_lock);
    long long v18 = (void *)[v20 copy];
  }
  else
  {
    long long v18 = (void *)MEMORY[0x263EFFA68];
  }

  return v18;
}

- (id)filterCharacteristics:(id)a3 deviceIdsDestination:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    long long v20 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    os_unfair_lock_lock_with_options();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v6;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v22;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * v12);
          if (self) {
            id Property = objc_getProperty(self, v9, 32, 1);
          }
          else {
            id Property = 0;
          }
          id v15 = Property;
          id v16 = [v15 destinationsToNotifyForCharacteristic:v13];

          if ([v16 containsObject:v7]) {
            [v20 addObject:v13];
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v17 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
        uint64_t v10 = v17;
      }
      while (v17);
    }

    os_unfair_lock_unlock(&self->_lock);
    long long v18 = (void *)[v20 copy];
  }
  else
  {
    long long v18 = (void *)MEMORY[0x263EFFA68];
  }

  return v18;
}

- (BOOL)removeRegistrationsForActionSetUUID:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = v8;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing registrations for action set: %@", buf, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  if (v6) {
    id Property = objc_getProperty(v6, v9, 32, 1);
  }
  else {
    id Property = 0;
  }
  id v11 = Property;
  char v12 = [v11 removeRegistrationsForActionSetUUID:v4];

  os_unfair_lock_unlock(&v6->_lock);
  if (v12)
  {
    id v15 = v4;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
    -[HMDNotificationRegistry notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles:](v6, v13);
  }
  return v12;
}

- (BOOL)removeRegistrationsForMediaProfile:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v18 = v8;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing registrations for media profile: %@", buf, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  if (v6) {
    id Property = objc_getProperty(v6, v9, 32, 1);
  }
  else {
    id Property = 0;
  }
  id v11 = Property;
  char v12 = [v11 removeRegistrationsForMediaProfile:v4];

  os_unfair_lock_unlock(&v6->_lock);
  if (v12)
  {
    uint64_t v13 = [v4 uniqueIdentifier];
    id v16 = v13;
    id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
    -[HMDNotificationRegistry notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles:](v6, v14);
  }
  return v12;
}

- (void)removeRegistrationsForCharacteristics:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v13 = 138543618;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing registrations for characteristics: %@", (uint8_t *)&v13, 0x16u);
  }
  p_locuint64_t k = &v6->_lock;
  os_unfair_lock_lock_with_options();
  if (v6) {
    id Property = objc_getProperty(v6, v10, 32, 1);
  }
  else {
    id Property = 0;
  }
  id v12 = Property;
  [v12 removeRegistrationsForCharacteristics:v4];

  os_unfair_lock_unlock(p_lock);
}

- (id)shortDescription
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self) {
    id Property = objc_getProperty(self, v4, 32, 1);
  }
  else {
    id Property = 0;
  }
  id v6 = Property;
  id v7 = [v6 shortDescription];

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)clearAllRegistrations
{
  if (self)
  {
    id v3 = [MEMORY[0x263EFFA08] set];
    id v4 = [MEMORY[0x263EFFA08] set];
    os_unfair_lock_lock_with_options();
    id v6 = objc_getProperty(self, v5, 32, 1);
    [v6 removeAllCharacteristicRegistrations];

    id v8 = objc_getProperty(self, v7, 32, 1);
    char v9 = [v8 removeAllActionSetRegistrations];

    id v11 = objc_getProperty(self, v10, 32, 1);
    id v14 = [v11 removeAllMediaProfileRegistrations];

    os_unfair_lock_unlock(&self->_lock);
    if ([v14 count])
    {
      id v12 = [v14 allObjects];
      -[HMDNotificationRegistry notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles:](self, v12);
    }
    if ([v9 count])
    {
      int v13 = [v9 allObjects];
      -[HMDNotificationRegistry notifyDelegatesOfRegistryUpdatesForActionSets:](self, v13);
    }
  }
}

- (void)disableAllRegistrations
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = __Block_byref_object_copy__28212;
  id v36 = __Block_byref_object_dispose__28213;
  id v37 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v26 = 0;
  long long v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__28212;
  id v30 = __Block_byref_object_dispose__28213;
  id v31 = 0;
  id v3 = -[HMDNotificationRegistry home]((id *)&self->super.super.isa);
  id v4 = [v3 hapAccessories];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __50__HMDNotificationRegistry_disableAllRegistrations__block_invoke;
  v25[3] = &unk_264A18470;
  v25[4] = &v26;
  v25[5] = &v32;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v25);

  SEL v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  HMFGetOSLogHandle();
  SEL v7 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    uint64_t v9 = v33[5];
    *(_DWORD *)buf = 138543618;
    id v39 = v8;
    __int16 v40 = 2112;
    uint64_t v41 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Disabling all registrations, then re-registering local registrations with instance ids by client: %@", buf, 0x16u);
  }
  if (v6) {
    id Property = objc_getProperty(v6, v10, 32, 1);
  }
  else {
    id Property = 0;
  }
  id v12 = Property;
  [v12 disableAllCharacteristicRegistrations];

  if (v6) {
    id v14 = objc_getProperty(v6, v13, 32, 1);
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;
  id v16 = [v15 disableAllActionSetRegistrations];

  if (v6) {
    id v18 = objc_getProperty(v6, v17, 32, 1);
  }
  else {
    id v18 = 0;
  }
  id v19 = v18;
  id v20 = [v19 disableAllMediaProfileRegistrations];

  if (v27[5] && [(id)v33[5] count])
  {
    uint64_t v21 = (void *)v33[5];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __50__HMDNotificationRegistry_disableAllRegistrations__block_invoke_121;
    v24[3] = &unk_264A18498;
    v24[4] = v6;
    v24[5] = &v26;
    objc_msgSend(v21, "na_each:", v24);
  }
  if ([v20 count])
  {
    long long v22 = [v20 allObjects];
    -[HMDNotificationRegistry notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles:](v6, v22);
  }
  if ([v16 count])
  {
    long long v23 = [v16 allObjects];
    -[HMDNotificationRegistry notifyDelegatesOfRegistryUpdatesForActionSets:](v6, v23);
  }
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
}

void __50__HMDNotificationRegistry_disableAllRegistrations__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([v6 isCurrentAccessory])
  {
    *a4 = 1;
    uint64_t v7 = [v6 uuid];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    SEL v10 = [v6 services];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __50__HMDNotificationRegistry_disableAllRegistrations__block_invoke_2;
    v11[3] = &unk_264A18448;
    v11[4] = *(void *)(a1 + 40);
    objc_msgSend(v10, "na_each:", v11);
  }
}

void __50__HMDNotificationRegistry_disableAllRegistrations__block_invoke_121(uint64_t a1, void *a2, void *a3)
{
  v14[1] = *MEMORY[0x263EF8340];
  SEL v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [v5 UUIDString];
  int v13 = v8;
  v14[0] = v6;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];

  SEL v10 = *(id **)(a1 + 32);
  id v11 = -[HMDNotificationRegistry home](v10);
  id v12 = [v11 currentUser];
  [v10 setNotificationsEnabled:1 user:v12 deviceIdsDestination:v7 characteristicsPayload:v9 characteristicChangeThresholdsPayload:MEMORY[0x263EFFA78] mediaPropertiesPayload:MEMORY[0x263EFFA78] actionSetsPayload:MEMORY[0x263EFFA68] matterNotificationPayload:MEMORY[0x263EFFA78]];
}

void __50__HMDNotificationRegistry_disableAllRegistrations__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 characteristics];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__HMDNotificationRegistry_disableAllRegistrations__block_invoke_3;
  v4[3] = &unk_264A18420;
  v4[4] = *(void *)(a1 + 32);
  objc_msgSend(v3, "na_each:", v4);
}

void __50__HMDNotificationRegistry_disableAllRegistrations__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 localClientIdentifiersWithNotificationsEnabled];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__HMDNotificationRegistry_disableAllRegistrations__block_invoke_4;
  v7[3] = &unk_264A183F8;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  objc_msgSend(v4, "na_each:", v7);
}

void __50__HMDNotificationRegistry_disableAllRegistrations__block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:");
  if (!v3)
  {
    id v3 = [MEMORY[0x263EFF980] array];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v3 forKeyedSubscript:v5];
  }
  id v4 = [*(id *)(a1 + 32) instanceID];
  [v3 addObject:v4];
}

- (void)reprocessEnabledCharacteristicRegistrations
{
  id v2 = self;
  if (self) {
    self = (HMDNotificationRegistry *)objc_getProperty(self, a2, 64, 1);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__HMDNotificationRegistry_reprocessEnabledCharacteristicRegistrations__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = v2;
  dispatch_async(&self->super.super, block);
}

void __70__HMDNotificationRegistry_reprocessEnabledCharacteristicRegistrations__block_invoke(uint64_t a1, const char *a2)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id Property = objc_getProperty(*(id *)(a1 + 32), a2, 64, 1);
    dispatch_assert_queue_V2(Property);
    id v5 = objc_msgSend(objc_getProperty(v2, v4, 32, 1), "enabledCharacteristicRegistrations");
    if ([v5 count])
    {
      id v6 = objc_msgSend(v5, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_28218);
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __71__HMDNotificationRegistry__reprocessEnabledCharacteristicRegistrations__block_invoke_2;
      v7[3] = &unk_264A183D0;
      void v7[4] = v2;
      objc_msgSend(v6, "na_each:", v7);
    }
  }
}

void __71__HMDNotificationRegistry__reprocessEnabledCharacteristicRegistrations__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = objc_msgSend(v6, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_110);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__HMDNotificationRegistry__reprocessEnabledCharacteristicRegistrations__block_invoke_4;
  void v10[3] = &unk_264A183A8;
  v10[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v11 = v9;
  objc_msgSend(v8, "na_each:", v10);
}

void __71__HMDNotificationRegistry__reprocessEnabledCharacteristicRegistrations__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = -[HMDNotificationRegistry home](*(id **)(a1 + 32));
  id v9 = [v8 accessoryWithUUID:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    SEL v10 = v9;
  }
  else {
    SEL v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __71__HMDNotificationRegistry__reprocessEnabledCharacteristicRegistrations__block_invoke_5;
    v26[3] = &unk_264A18380;
    id v12 = v11;
    id v27 = v12;
    int v13 = objc_msgSend(v6, "na_map:", v26);
    id v14 = [v13 allObjects];

    id v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = *(id *)(a1 + 32);
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v18 = v22 = v15;
      [v12 name];
      id v19 = v23 = v7;
      [v12 uuid];
      v20 = id v24 = v6;
      [v20 UUIDString];
      v21 = id v25 = v5;
      *(_DWORD *)buf = 138544130;
      uint64_t v29 = v18;
      __int16 v30 = 2112;
      id v31 = v19;
      __int16 v32 = 2112;
      id v33 = v21;
      __int16 v34 = 2112;
      id v35 = v14;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Re-Enabling notification for accessory %@/%@ characteristics %@", buf, 0x2Au);

      id v5 = v25;
      id v6 = v24;

      id v7 = v23;
      id v15 = v22;
    }

    [v12 setNotificationsEnabled:1 forCharacteristics:v14 clientIdentifier:*(void *)(a1 + 40)];
    [v12 updateNotificationEnabled:1 forCharacteristics:v14 onBehalfOf:*(void *)(a1 + 40)];
  }
}

id __71__HMDNotificationRegistry__reprocessEnabledCharacteristicRegistrations__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 characteristicInstanceID];
  SEL v4 = [v2 hmdCharacteristicForInstanceId:v3];

  return v4;
}

uint64_t __71__HMDNotificationRegistry__reprocessEnabledCharacteristicRegistrations__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 accessoryUUID];
}

uint64_t __71__HMDNotificationRegistry__reprocessEnabledCharacteristicRegistrations__block_invoke(uint64_t a1, void *a2)
{
  return [a2 deviceIdsDestination];
}

- (void)configureWithHome:(id)a3 coreDataAdapter:(id)a4
{
  id obj = a3;
  id v6 = (HMDNotificationRegistryCoreDataAdapter *)a4;
  os_unfair_lock_lock_with_options();
  if (self) {
    objc_storeWeak((id *)&self->_home, obj);
  }
  id v7 = [obj workQueue];
  id v9 = v7;
  if (self)
  {
    objc_setProperty_atomic(self, v8, v7, 64);

    id Property = objc_getProperty(self, v10, 40, 1);
  }
  else
  {

    id Property = 0;
  }
  id v12 = Property;
  [v12 setDelegate:self];

  if (self)
  {
    id v14 = objc_getProperty(self, v13, 64, 1);
    id v16 = objc_getProperty(self, v15, 40, 1);
  }
  else
  {
    id v14 = 0;
    id v16 = 0;
  }
  id v17 = v16;
  [v17 setDelegateQueue:v14];

  coreDataAdapter = self->_coreDataAdapter;
  self->_coreDataAdapter = v6;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)configureWithHome:(id)a3
{
  id v4 = a3;
  id v5 = [[HMDNotificationRegistryCoreDataAdapter alloc] initWithHome:v4];
  [(HMDNotificationRegistry *)self configureWithHome:v4 coreDataAdapter:v5];
}

- (HMDNotificationRegistry)initWithPendingRequestsRetryTimer:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDNotificationRegistry;
  id v6 = [(HMDNotificationRegistry *)&v13 init];
  id v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_pendingRequestsRetryTimer, a3);
    uint64_t v8 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    delegates = v7->_delegates;
    v7->_delegates = (NSHashTable *)v8;

    uint64_t v10 = [MEMORY[0x263EFF9C0] set];
    pendingRequests = v7->_pendingRequests;
    v7->_pendingRequests = (NSMutableSet *)v10;
  }
  return v7;
}

- (HMDNotificationRegistry)init
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:5.0];
  id v4 = [(HMDNotificationRegistry *)self initWithPendingRequestsRetryTimer:v3];

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t85 != -1) {
    dispatch_once(&logCategory__hmf_once_t85, &__block_literal_global_168_28233);
  }
  id v2 = (void *)logCategory__hmf_once_v86;
  return v2;
}

void __38__HMDNotificationRegistry_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v86;
  logCategory__hmf_once_long long v86 = v0;
}

@end