@interface HMDNotificationRegistry
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)_processCharacteristicsRequests:(void *)a1;
- (BOOL)disableReachabilityEventNotificationForAccessoryUUIDs:(id)a3 forUserID:(id)a4;
- (BOOL)enableReachabilityEventNotificationForAccessoryUUIDs:(id)a3 forUserID:(id)a4;
- (BOOL)removeRegistrationsForMediaProfile:(id)a3;
- (BOOL)setNotificationsEnabled:(BOOL)a3 forUserID:(id)a4 characteristicsPayload:(id)a5 mediaPropertiesPayload:(id)a6;
- (HMDNotificationRegistry)init;
- (HMDNotificationRegistry)initWithCoder:(id)a3;
- (HMDNotificationRegistry)initWithPendingRequestsRetryTimer:(id)a3;
- (NSMutableSet)chipRemoteSubscribers;
- (id)_createCharacteristicsMapForCharacteristics:(uint64_t)a1;
- (id)_reachabilityEventNotificationRegistryKeyForAccessoryUUID:(uint64_t)a1;
- (id)_reachabilityEventNotificationRegistryKeysForAccessoryUUIDs:(void *)a1;
- (id)filterCharacteristics:(id)a3 forUser:(id)a4;
- (id)filterProperties:(id)a3 forUser:(id)a4;
- (id)home;
- (id)keyForCharacteristic:(uint64_t)a1;
- (id)keyForProperty:(void *)a3 mediaProfile:;
- (id)logIdentifier;
- (id)propertiesRegisteredForMediaProfileUniqueIdentifier:(id)a3;
- (id)shortDescription;
- (id)userIDsRegisteredForReachabilityEventNotificationsForAccessoryUUIDs:(id)a3;
- (id)usersRegisteredForNotificationsForCharacteristics:(id)a3;
- (id)usersRegisteredForNotificationsForProperties:(id)a3;
- (os_unfair_lock)notificationRegistry;
- (uint64_t)_processMediaPropertiesRequests:(void *)a1;
- (void)_addPendingRequests:(void *)a1;
- (void)addDelegate:(id)a3;
- (void)auditUsersForNotifications:(id)a3 forHome:(id)a4;
- (void)clearAllRegistrations;
- (void)configureWithHome:(id)a3;
- (void)disableNotification:(void *)a3 user:(void *)a4 home:;
- (void)encodeWithCoder:(id)a3;
- (void)notifyDelegatesIfKeysAreMediaRelated:(uint64_t)a1;
- (void)notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles:(uint64_t)a1;
- (void)removeAllReachabilityEventNotificationRegistrations;
- (void)removeRegistrationsForCharacteristics:(id)a3;
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
  objc_storeStrong((id *)&self->_chipRemoteSubscribers, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_notificationRegistry, 0);
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
  uint64_t v61 = *MEMORY[0x1E4F143B8];
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
    v9 = (void *)MEMORY[0x1D9452090]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v58 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Pending requests retry timer fired", buf, 0xCu);
    }
    if (self)
    {
      v14 = objc_getProperty(v10, v13, 64, 1);
      dispatch_assert_queue_V2(v14);
      v16 = objc_msgSend(objc_getProperty(v10, v15, 48, 1), "copy");
      objc_msgSend(objc_getProperty(v10, v17, 48, 1), "removeAllObjects");
      uint64_t v18 = [v16 count];
      v19 = (void *)MEMORY[0x1D9452090]();
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
          _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Processing %lu pending request(s)", buf, 0x16u);
        }
        v46 = [MEMORY[0x1E4F1CA80] set];
        v45 = [MEMORY[0x1E4F1CA80] set];
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
                v31 = (void *)MEMORY[0x1D9452090]();
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
                  _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_ERROR, "%{public}@Dropping pending request that is still around after %ld retries: %@", v51, 0x20u);
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
          _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@No pending requests to process", buf, 0xCu);
        }
      }
    }
  }
}

- (BOOL)_processCharacteristicsRequests:(void *)a1
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v83 = v3;
  if (a1
    && (id v5 = v3,
        v6 = objc_getProperty(a1, v4, 64, 1),
        dispatch_assert_queue_V2(v6),
        [v5 count]))
  {
    v89 = a1;
    v87 = [MEMORY[0x1E4F1CA80] set];
    v86 = +[HMDHAPMetadata getSharedInstance];
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    id obj = v83;
    uint64_t v90 = [obj countByEnumeratingWithState:&v98 objects:v106 count:16];
    if (v90)
    {
      LOBYTE(v84) = 0;
      uint64_t v88 = *(void *)v99;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v99 != v88)
          {
            uint64_t v8 = v7;
            objc_enumerationMutation(obj);
            uint64_t v7 = v8;
          }
          uint64_t v91 = v7;
          v9 = *(void **)(*((void *)&v98 + 1) + 8 * v7);
          v10 = (void *)MEMORY[0x1D9452090]();
          self = v89;
          v11 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            v12 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v12;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v9;
            _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Processing characteristics request: %@", buf, 0x16u);
          }
          id v93 = v9;
          Property = objc_getProperty(self, v13, 64, 1);
          dispatch_assert_queue_V2(Property);
          long long v104 = 0u;
          long long v105 = 0u;
          long long v102 = 0u;
          long long v103 = 0u;
          v16 = objc_msgSend(objc_getProperty(self, v15, 48, 1), "copy");
          uint64_t v17 = [v16 countByEnumeratingWithState:&v102 objects:buf count:16];
          if (v17)
          {
            uint64_t v18 = *(void *)v103;
            do
            {
              uint64_t v19 = 0;
              do
              {
                if (*(void *)v103 != v18) {
                  objc_enumerationMutation(v16);
                }
                id v20 = *(id *)(*((void *)&v102 + 1) + 8 * v19);
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
                  v23 = [v22 userID];
                  uint64_t v24 = [v93 userID];
                  if ([v23 isEqualToString:v24])
                  {
                    id v25 = [v22 accessoryUUID];
                    uint64_t v26 = [v93 accessoryUUID];
                    int v27 = [v25 isEqual:v26];

                    if (v27)
                    {
                      uint64_t v28 = [v22 characteristicInstanceIDs];
                      v29 = [v93 characteristicInstanceIDs];
                      [v28 minusSet:v29];

                      v30 = [v22 characteristicInstanceIDs];
                      BOOL v31 = [v30 count] == 0;

                      v32 = (void *)MEMORY[0x1D9452090]();
                      v33 = self;
                      v34 = HMFGetOSLogHandle();
                      BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_INFO);
                      if (v31)
                      {
                        if (v35)
                        {
                          v37 = HMFGetLogIdentifier();
                          *(_DWORD *)v107 = 138543618;
                          v108 = v37;
                          __int16 v109 = 2112;
                          id v110 = v22;
                          _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_INFO, "%{public}@Removing pending characteristics request that matches a new characteristics request: %@", v107, 0x16u);
                        }
                        objc_msgSend(objc_getProperty(v33, v38, 48, 1), "removeObject:", v22);
                      }
                      else
                      {
                        if (v35)
                        {
                          id v36 = HMFGetLogIdentifier();
                          *(_DWORD *)v107 = 138543618;
                          v108 = v36;
                          __int16 v109 = 2112;
                          id v110 = v22;
                          _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_INFO, "%{public}@Updated pending characteristics request: %@", v107, 0x16u);
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
              uint64_t v39 = [v16 countByEnumeratingWithState:&v102 objects:buf count:16];
              uint64_t v17 = v39;
            }
            while (v39);
          }

          v40 = -[HMDNotificationRegistry home]((id *)self);
          id v41 = [v93 accessoryUUID];
          v42 = [v40 accessoryWithUUID:v41];

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
            v96[0] = MEMORY[0x1E4F143A8];
            v96[1] = 3221225472;
            v96[2] = __59__HMDNotificationRegistry__processCharacteristicsRequests___block_invoke;
            v96[3] = &unk_1E6A08310;
            v96[4] = v93;
            id v97 = v86;
            v45 = [v44 characteristicsPassingTest:v96];
            uint64_t v46 = [v45 count];
            long long v47 = [v93 characteristicInstanceIDs];
            LOBYTE(v46) = v46 == [v47 count];

            if (v46)
            {
              int v48 = [v93 enable];
              long long v49 = [v93 userID];
              if (v48)
              {
                id v50 = v45;
                id v51 = v49;
                v52 = -[HMDNotificationRegistry _createCharacteristicsMapForCharacteristics:]((uint64_t)self, v50);
                if ([v52 count])
                {
                  *(void *)&long long v102 = 0;
                  *((void *)&v102 + 1) = &v102;
                  *(void *)&long long v103 = 0x2020000000;
                  BYTE8(v103) = 0;
                  os_unfair_lock_lock_with_options();
                  *(void *)buf = MEMORY[0x1E4F143A8];
                  *(void *)&buf[8] = 3221225472;
                  *(void *)&buf[16] = __72__HMDNotificationRegistry_enableNotificationForCharacteristics_forUser___block_invoke;
                  v112 = &unk_1E6A08248;
                  *(void *)&long long v113 = self;
                  *((void *)&v113 + 1) = v51;
                  v114 = &v102;
                  [v52 enumerateKeysAndObjectsUsingBlock:buf];

                  os_unfair_lock_unlock(self + 2);
                  BOOL v53 = *(unsigned char *)(*((void *)&v102 + 1) + 24) != 0;
                  _Block_object_dispose(&v102, 8);
                }
                else
                {
                  BOOL v53 = 0;
                }

                v68 = [v93 userID];
                if (v53)
                {
                  v69 = (void *)MEMORY[0x1D9452090]();
                  v70 = self;
                  v71 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
                  {
                    v94 = HMFGetLogIdentifier();
                    v72 = [v44 name];
                    v73 = [v44 uuid];
                    v74 = [v73 UUIDString];
                    *(_DWORD *)buf = 138544130;
                    *(void *)&uint8_t buf[4] = v94;
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v72;
                    *(_WORD *)&buf[22] = 2112;
                    v112 = v74;
                    LOWORD(v113) = 2112;
                    *(void *)((char *)&v113 + 2) = v50;
                    _os_log_impl(&dword_1D49D5000, v71, OS_LOG_TYPE_INFO, "%{public}@Enabling notification for accessory %@/%@ characteristics %@", buf, 0x2Au);
                  }
                  [v44 setNotificationsEnabled:1 forCharacteristics:v50 clientIdentifier:v68];
                  [v44 updateNotificationEnabled:1 forCharacteristics:v50 onBehalfOf:v68];
                  LOBYTE(v84) = 1;
                }
                else
                {
                  LOBYTE(v84) = 0;
                }
              }
              else
              {
                id v62 = v45;
                id v63 = v49;
                v64 = -[HMDNotificationRegistry _createCharacteristicsMapForCharacteristics:]((uint64_t)self, v62);
                if ([v64 count])
                {
                  v65 = [MEMORY[0x1E4F1CA48] array];
                  *(void *)&long long v102 = 0;
                  *((void *)&v102 + 1) = &v102;
                  *(void *)&long long v103 = 0x2020000000;
                  BYTE8(v103) = 0;
                  os_unfair_lock_lock_with_options();
                  *(void *)buf = MEMORY[0x1E4F143A8];
                  *(void *)&buf[8] = 3221225472;
                  *(void *)&buf[16] = __104__HMDNotificationRegistry_disableNotificationForCharacteristics_forUser_characteristicsToDisableEvents___block_invoke;
                  v112 = &unk_1E6A08270;
                  *(void *)&long long v113 = self;
                  *((void *)&v113 + 1) = v63;
                  v66 = v65;
                  v114 = v66;
                  v115 = &v102;
                  [v64 enumerateKeysAndObjectsUsingBlock:buf];

                  os_unfair_lock_unlock(self + 2);
                  v67 = v66;
                  BOOL v84 = *(unsigned char *)(*((void *)&v102 + 1) + 24) != 0;
                  _Block_object_dispose(&v102, 8);
                }
                else
                {
                  BOOL v84 = 0;
                  v67 = (_OWORD *)MEMORY[0x1E4F1CBF0];
                }

                v68 = v67;
                v75 = [v93 userID];
                if (v84)
                {
                  v76 = (void *)MEMORY[0x1D9452090]();
                  v77 = self;
                  v78 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
                  {
                    v95 = HMFGetLogIdentifier();
                    v79 = [v44 name];
                    v80 = [v44 uuid];
                    v81 = [v80 UUIDString];
                    *(_DWORD *)buf = 138544130;
                    *(void *)&uint8_t buf[4] = v95;
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v79;
                    *(_WORD *)&buf[22] = 2112;
                    v112 = v81;
                    LOWORD(v113) = 2112;
                    *(void *)((char *)&v113 + 2) = v68;
                    _os_log_impl(&dword_1D49D5000, v78, OS_LOG_TYPE_INFO, "%{public}@Disabling notification for accessory %@/%@ characteristics %@", buf, 0x2Au);
                  }
                  [v44 setNotificationsEnabled:0 forCharacteristics:v68 clientIdentifier:v75];
                  if ([v68 count]) {
                    [v44 updateNotificationEnabled:0 forCharacteristics:v68 onBehalfOf:v75];
                  }
                }
              }
            }
            else
            {
              v58 = (void *)MEMORY[0x1D9452090]();
              __int16 v59 = self;
              uint64_t v60 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
              {
                uint64_t v61 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                *(void *)&uint8_t buf[4] = v61;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v93;
                _os_log_impl(&dword_1D49D5000, v60, OS_LOG_TYPE_INFO, "%{public}@Cannot find all characteristics for request so adding to pending requests: %@", buf, 0x16u);
              }
              [v87 addObject:v93];
            }
          }
          else
          {
            uint64_t v54 = (void *)MEMORY[0x1D9452090]();
            __int16 v55 = self;
            v56 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
            {
              v57 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v57;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v93;
              _os_log_impl(&dword_1D49D5000, v56, OS_LOG_TYPE_INFO, "%{public}@Cannot find accessory for characteristics request so adding to pending requests: %@", buf, 0x16u);
            }
            [v87 addObject:v93];
          }

          uint64_t v7 = v91 + 1;
        }
        while (v91 + 1 != v90);
        uint64_t v90 = [obj countByEnumeratingWithState:&v98 objects:v106 count:16];
      }
      while (v90);
    }
    else
    {
      LOBYTE(v84) = 0;
    }

    -[HMDNotificationRegistry _addPendingRequests:](v89, v87);
  }
  else
  {
    LOBYTE(v84) = 0;
  }

  return v84;
}

- (uint64_t)_processMediaPropertiesRequests:(void *)a1
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v90 = v3;
  if (!a1
    || (id v5 = v3,
        Property = objc_getProperty(a1, v4, 64, 1),
        dispatch_assert_queue_V2(Property),
        ![v5 count]))
  {
    char v94 = 0;
    goto LABEL_89;
  }
  v96 = a1;
  v92 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v91 = [MEMORY[0x1E4F1CA80] set];
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id obj = v90;
  uint64_t v97 = [obj countByEnumeratingWithState:&v106 objects:v114 count:16];
  if (!v97)
  {
    char v94 = 0;
    goto LABEL_86;
  }
  char v94 = 0;
  uint64_t v95 = *(void *)v107;
  do
  {
    uint64_t v7 = 0;
    do
    {
      if (*(void *)v107 != v95)
      {
        uint64_t v8 = v7;
        objc_enumerationMutation(obj);
        uint64_t v7 = v8;
      }
      uint64_t v98 = v7;
      v9 = *(void **)(*((void *)&v106 + 1) + 8 * v7);
      v10 = (void *)MEMORY[0x1D9452090]();
      self = v96;
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v120 = v12;
        __int16 v121 = 2112;
        id v122 = v9;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Processing media properties request: %@", buf, 0x16u);
      }
      id v13 = v9;
      SEL v15 = objc_getProperty(self, v14, 64, 1);
      dispatch_assert_queue_V2(v15);
      long long v112 = 0u;
      long long v113 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      id v103 = (id)objc_msgSend(objc_getProperty(self, v16, 48, 1), "copy");
      uint64_t v17 = [v103 countByEnumeratingWithState:&v110 objects:buf count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v111;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v111 != v18) {
              objc_enumerationMutation(v103);
            }
            id v20 = *(id *)(*((void *)&v110 + 1) + 8 * v19);
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
              v23 = [v22 userID];
              uint64_t v24 = [v13 userID];
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

                  v32 = (void *)MEMORY[0x1D9452090]();
                  id v33 = self;
                  v34 = HMFGetOSLogHandle();
                  BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_INFO);
                  if (v31)
                  {
                    if (v35)
                    {
                      v37 = HMFGetLogIdentifier();
                      *(_DWORD *)v115 = 138543618;
                      uint64_t v116 = v37;
                      __int16 v117 = 2112;
                      id v118 = v22;
                      _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_INFO, "%{public}@Removing pending media properties request that matches a new media properties request: %@", v115, 0x16u);
                    }
                    objc_msgSend(objc_getProperty(v33, v38, 48, 1), "removeObject:", v22);
                  }
                  else
                  {
                    if (v35)
                    {
                      id v36 = HMFGetLogIdentifier();
                      *(_DWORD *)v115 = 138543618;
                      uint64_t v116 = v36;
                      __int16 v117 = 2112;
                      id v118 = v22;
                      _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_INFO, "%{public}@Updated pending media properties request: %@", v115, 0x16u);
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
          uint64_t v39 = [v103 countByEnumeratingWithState:&v110 objects:buf count:16];
          uint64_t v17 = v39;
        }
        while (v39);
      }

      v40 = -[HMDNotificationRegistry home]((id *)self);
      id v41 = [v13 mediaProfileUUID];
      long long v99 = [v40 mediaProfileWithUUID:v41];

      if (!v99)
      {
        v65 = (void *)MEMORY[0x1D9452090]();
        id v66 = self;
        v67 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
        {
          v68 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v120 = v68;
          __int16 v121 = 2112;
          id v122 = v13;
          _os_log_impl(&dword_1D49D5000, v67, OS_LOG_TYPE_INFO, "%{public}@Cannot find media profile for media properties request so adding to pending requests: %@", buf, 0x16u);
        }
        [v92 addObject:v13];
        goto LABEL_81;
      }
      v42 = [v13 mediaProperties];
      BOOL v43 = [v42 count] == 0;

      if (v43)
      {
        v69 = (void *)MEMORY[0x1D9452090]();
        id v70 = self;
        v71 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
        {
          v72 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v120 = v72;
          __int16 v121 = 2112;
          id v122 = v13;
          _os_log_impl(&dword_1D49D5000, v71, OS_LOG_TYPE_INFO, "%{public}@No media properties exist for request: %@", buf, 0x16u);
        }
        goto LABEL_81;
      }
      int v44 = [v13 enable];
      v45 = (void *)MEMORY[0x1D9452090]();
      uint64_t v46 = (os_unfair_lock *)self;
      long long v47 = HMFGetOSLogHandle();
      BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_INFO);
      if (v44)
      {
        if (v48)
        {
          long long v49 = HMFGetLogIdentifier();
          id v50 = [v13 mediaProperties];
          *(_DWORD *)buf = 138543874;
          v120 = v49;
          __int16 v121 = 2112;
          id v122 = v99;
          __int16 v123 = 2112;
          v124 = v50;
          _os_log_impl(&dword_1D49D5000, v47, OS_LOG_TYPE_INFO, "%{public}@Enabling notification for media profile: %@ media properties: %@", buf, 0x20u);
        }
        id v51 = [v13 mediaProperties];
        v52 = [v13 userID];
        id v53 = v99;
        id v54 = v51;
        id v55 = v52;
        id v104 = v54;
        if ([v54 count])
        {
          selfa = v46 + 2;
          os_unfair_lock_lock_with_options();
          long long v112 = 0u;
          long long v113 = 0u;
          long long v110 = 0u;
          long long v111 = 0u;
          id v104 = v54;
          uint64_t v56 = [v104 countByEnumeratingWithState:&v110 objects:buf count:16];
          if (v56)
          {
            char v57 = 0;
            uint64_t v58 = *(void *)v111;
            do
            {
              for (uint64_t i = 0; i != v56; ++i)
              {
                if (*(void *)v111 != v58) {
                  objc_enumerationMutation(v104);
                }
                uint64_t v60 = -[HMDNotificationRegistry keyForProperty:mediaProfile:]((uint64_t)v46, *(void **)(*((void *)&v110 + 1) + 8 * i), v53);
                uint64_t v61 = -[HMDNotificationRegistry notificationRegistry](v46);
                id v62 = [v61 objectForKeyedSubscript:v60];

                if (!v62)
                {
                  id v62 = [MEMORY[0x1E4F1CA80] set];
                  id v63 = -[HMDNotificationRegistry notificationRegistry](v46);
                  [v63 setObject:v62 forKeyedSubscript:v60];
                }
                if ((objc_msgSend(v62, "containsObject:", v55, v90) & 1) == 0)
                {
                  [v62 addObject:v55];
                  char v57 = 1;
                }
              }
              uint64_t v56 = [v104 countByEnumeratingWithState:&v110 objects:buf count:16];
            }
            while (v56);

            os_unfair_lock_unlock(selfa);
            if ((v57 & 1) == 0) {
              goto LABEL_50;
            }
LABEL_74:
            objc_msgSend(v99, "uniqueIdentifier", v90);
            id v105 = (id)objc_claimAutoreleasedReturnValue();
            [v91 addObject:v105];
            char v64 = 1;

            goto LABEL_80;
          }

          os_unfair_lock_unlock(selfa);
        }
        else
        {
        }
LABEL_79:
        char v64 = 0;

        goto LABEL_80;
      }
      if (v48)
      {
        v73 = HMFGetLogIdentifier();
        v74 = [v13 mediaProperties];
        *(_DWORD *)buf = 138543874;
        v120 = v73;
        __int16 v121 = 2112;
        id v122 = v99;
        __int16 v123 = 2112;
        v124 = v74;
        _os_log_impl(&dword_1D49D5000, v47, OS_LOG_TYPE_INFO, "%{public}@Disabling notification for media profile: %@ media properties: %@", buf, 0x20u);
      }
      v75 = [v13 mediaProperties];
      v76 = [v13 userID];
      id v77 = v99;
      id v78 = v75;
      id v79 = v76;
      id v104 = v78;
      if (![v78 count])
      {

        goto LABEL_79;
      }
      selfb = v46 + 2;
      os_unfair_lock_lock_with_options();
      long long v112 = 0u;
      long long v113 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      id v104 = v78;
      uint64_t v80 = [v104 countByEnumeratingWithState:&v110 objects:buf count:16];
      if (!v80)
      {

        os_unfair_lock_unlock(selfb);
        goto LABEL_79;
      }
      char v81 = 0;
      uint64_t v82 = *(void *)v111;
      do
      {
        for (uint64_t j = 0; j != v80; ++j)
        {
          if (*(void *)v111 != v82) {
            objc_enumerationMutation(v104);
          }
          BOOL v84 = -[HMDNotificationRegistry keyForProperty:mediaProfile:]((uint64_t)v46, *(void **)(*((void *)&v110 + 1) + 8 * j), v77);
          v85 = -[HMDNotificationRegistry notificationRegistry](v46);
          v86 = [v85 objectForKeyedSubscript:v84];

          if (v86)
          {
            if (!v79) {
              goto LABEL_69;
            }
            if (![v86 containsObject:v79]) {
              goto LABEL_71;
            }
            [v86 removeObject:v79];
            if (![v86 count])
            {
LABEL_69:
              v87 = -[HMDNotificationRegistry notificationRegistry](v46);
              [v87 removeObjectForKey:v84];
            }
            char v81 = 1;
          }
LABEL_71:
        }
        uint64_t v80 = [v104 countByEnumeratingWithState:&v110 objects:buf count:16];
      }
      while (v80);

      os_unfair_lock_unlock(selfb);
      if (v81) {
        goto LABEL_74;
      }
LABEL_50:
      char v64 = 0;
LABEL_80:
      v94 |= v64;
LABEL_81:

      uint64_t v7 = v98 + 1;
    }
    while (v98 + 1 != v97);
    uint64_t v97 = [obj countByEnumeratingWithState:&v106 objects:v114 count:16];
  }
  while (v97);
LABEL_86:

  -[HMDNotificationRegistry _addPendingRequests:](v96, v92);
  if ([v91 count])
  {
    uint64_t v88 = [v91 allObjects];
    -[HMDNotificationRegistry notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles:]((uint64_t)v96, v88);
  }
LABEL_89:

  return v94 & 1;
}

- (id)home
{
  if (WeakRetained)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 7);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void)_addPendingRequests:(void *)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  Property = objc_getProperty(a1, v4, 64, 1);
  dispatch_assert_queue_V2(Property);
  if ([v3 count])
  {
    uint64_t v7 = objc_msgSend(objc_getProperty(a1, v6, 48, 1), "unionSet:", v3);
    uint64_t v8 = (void *)MEMORY[0x1D9452090](v7);
    id v9 = a1;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      SEL v14 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Resuming pending requests timer", (uint8_t *)&v13, 0xCu);
    }
    objc_msgSend(objc_getProperty(v9, v12, 40, 1), "resume");
  }
}

- (void)notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    SEL v4 = (void *)[*(id *)(a1 + 24) copy];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    id v5 = [v4 allObjects];

    objc_initWeak(&location, (id)a1);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __81__HMDNotificationRegistry_notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles___block_invoke;
    v6[3] = &unk_1E6A08338;
    objc_copyWeak(&v8, &location);
    id v7 = v3;
    objc_msgSend(v5, "na_each:", v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
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
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__HMDNotificationRegistry_notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles___block_invoke_2;
    block[3] = &unk_1E6A16550;
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
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = (void *)MEMORY[0x1D9452090]();
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
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@About to notify delegate of mediaPropertyRegistrationsDidChange %@", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 32) mediaPropertyRegistrationsDidChangeForMediaProfiles:*(void *)(a1 + 40)];
}

- (id)keyForProperty:(void *)a3 mediaProfile:
{
  if (a1)
  {
    id v4 = NSString;
    id v5 = a2;
    v6 = [a3 uniqueIdentifier];
    uint64_t v7 = [v6 UUIDString];
    int v8 = [v4 stringWithFormat:@"%@:%@", v7, v5];
  }
  else
  {
    int v8 = 0;
  }
  return v8;
}

- (os_unfair_lock)notificationRegistry
{
  if (a1)
  {
    v2 = a1;
    os_unfair_lock_assert_owner(a1 + 2);
    a1 = (os_unfair_lock *)*(id *)&v2[4]._os_unfair_lock_opaque;
    uint64_t v1 = vars8;
  }
  return a1;
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

- (id)_createCharacteristicsMapForCharacteristics:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([v2 count])
  {
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
    id v3 = +[HMDHAPMetadata getSharedInstance];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v17 = v2;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          __int16 v10 = [v9 type];
          uint64_t v11 = [v9 service];
          uint64_t v12 = [v11 type];
          char v13 = [v3 shouldFilterEnableNotificationsForCharacteristicType:v10 serviceType:v12];

          if ((v13 & 1) == 0)
          {
            SEL v14 = -[HMDNotificationRegistry keyForCharacteristic:](a1, v9);
            if (v14) {
              [v18 setObject:v9 forKeyedSubscript:v14];
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v6);
    }

    uint64_t v15 = (void *)[v18 copy];
    id v2 = v17;
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v15;
}

void __104__HMDNotificationRegistry_disableNotificationForCharacteristics_forUser_characteristicsToDisableEvents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = -[HMDNotificationRegistry notificationRegistry](*(os_unfair_lock **)(a1 + 32));
  uint64_t v7 = [v6 objectForKeyedSubscript:v9];

  if ([v7 containsObject:*(void *)(a1 + 40)])
  {
    [v7 removeObject:*(void *)(a1 + 40)];
    [*(id *)(a1 + 48) addObject:v5];
    if (![v7 count])
    {
      int v8 = -[HMDNotificationRegistry notificationRegistry](*(os_unfair_lock **)(a1 + 32));
      [v8 removeObjectForKey:v9];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

- (id)keyForCharacteristic:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = [v3 accessory];
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v7 = NSString;
      int v8 = [v5 uuid];
      id v9 = [v8 UUIDString];
      __int16 v10 = [v4 instanceID];
      uint64_t v11 = [v10 stringValue];
      uint64_t v12 = [v7 stringWithFormat:@"%@:%@", v9, v11];
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

void __72__HMDNotificationRegistry_enableNotificationForCharacteristics_forUser___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = -[HMDNotificationRegistry notificationRegistry](*(os_unfair_lock **)(a1 + 32));
  id v4 = [v3 objectForKeyedSubscript:v6];

  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1CA80] set];
    id v5 = -[HMDNotificationRegistry notificationRegistry](*(os_unfair_lock **)(a1 + 32));
    [v5 setObject:v4 forKeyedSubscript:v6];
  }
  if (([v4 containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    [v4 addObject:*(void *)(a1 + 40)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (id)logIdentifier
{
  id v2 = -[HMDNotificationRegistry home]((id *)&self->super.super.isa);
  id v3 = [v2 uuid];
  id v4 = [v3 UUIDString];

  return v4;
}

- (void)addDelegate:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    __int16 v10 = v8;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@adding delegate %@", (uint8_t *)&v9, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  [(NSHashTable *)v6->_delegates addObject:v4];
  os_unfair_lock_unlock(&v6->_lock);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v7 = -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
  int v8 = objc_msgSend(v6, "dictionaryWithCapacity:", objc_msgSend(v7, "count"));

  int v9 = -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__HMDNotificationRegistry_encodeWithCoder___block_invoke;
  v11[3] = &unk_1E6A082C0;
  id v10 = v8;
  id v12 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:v11];

  os_unfair_lock_unlock(p_lock);
  [v4 encodeObject:v10 forKey:@"notificationAndUsersRegistry"];
}

void __43__HMDNotificationRegistry_encodeWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (id)[a3 copy];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (HMDNotificationRegistry)initWithCoder:(id)a3
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = [(HMDNotificationRegistry *)self init];
  if (v21)
  {
    id v5 = (void *)MEMORY[0x1E4F1CAD0];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v27[2] = objc_opt_class();
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
    uint64_t v7 = [v5 setWithArray:v6];

    int v8 = [v4 decodeObjectOfClasses:v7 forKey:@"notificationAndUsersRegistry"];
    if (!v8)
    {
      int v8 = [v4 decodeObjectOfClasses:v7 forKey:@"characteristicNotificationAndUsersRegistry"];
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    objc_msgSend(v8, "allKeys", v7);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          SEL v14 = [v8 objectForKeyedSubscript:v13];
          uint64_t v15 = (void *)MEMORY[0x1E4F1CA80];
          SEL v16 = [v14 allObjects];
          id v17 = [v15 setWithArray:v16];
          [(NSMutableDictionary *)v21->_notificationRegistry setObject:v17 forKeyedSubscript:v13];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v10);
    }
  }
  return v21;
}

- (BOOL)setNotificationsEnabled:(BOOL)a3 forUserID:(id)a4 characteristicsPayload:(id)a5 mediaPropertiesPayload:(id)a6
{
  BOOL v92 = a3;
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v93 = a4;
  id v9 = a5;
  id v85 = a6;
  if (self) {
    Property = objc_getProperty(self, v10, 64, 1);
  }
  else {
    Property = 0;
  }
  dispatch_assert_queue_V2(Property);
  id v12 = (void *)MEMORY[0x1D9452090]();
  uint64_t v13 = self;
  SEL v14 = HMFGetOSLogHandle();
  char v94 = v13;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = HMFGetLogIdentifier();
    SEL v16 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    long long v108 = v15;
    __int16 v109 = 2112;
    id v110 = v16;
    __int16 v111 = 2112;
    id v112 = v93;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Setting notifications enabled to %@ for userID: %@", buf, 0x20u);

    uint64_t v13 = v94;
  }

  v89 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v9, "count"));
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id v17 = v9;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v101 objects:v106 count:16];
  v87 = v17;
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v95 = *(void *)v102;
    do
    {
      uint64_t v20 = 0;
      uint64_t v90 = v19;
      do
      {
        if (*(void *)v102 != v95) {
          objc_enumerationMutation(v17);
        }
        id v21 = *(id *)(*((void *)&v101 + 1) + 8 * v20);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          long long v22 = v21;
        }
        else {
          long long v22 = 0;
        }
        id v23 = v22;

        if (v23)
        {
          long long v24 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v23];
          long long v25 = v24;
          if (v24)
          {
            uint64_t v26 = [v24 UUIDString];
            int v27 = [v17 objectForKeyedSubscript:v26];

            id v28 = v27;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v29 = v28;
            }
            else {
              v29 = 0;
            }
            id v30 = v29;

            if (v30)
            {
              BOOL v31 = [[HMDNotificationRegistryCharacteristicsRequest alloc] initWithEnable:v92 userID:v93 accessoryUUID:v25];
              v32 = [(HMDNotificationRegistryCharacteristicsRequest *)v31 characteristicInstanceIDs];
              [v32 addObjectsFromArray:v30];

              [v89 addObject:v31];
            }
            else
            {
              BOOL v43 = (void *)MEMORY[0x1D9452090]();
              int v44 = v13;
              v45 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
              {
                uint64_t v46 = HMFGetLogIdentifier();
                long long v47 = objc_opt_class();
                *(_DWORD *)buf = 138543874;
                long long v108 = v46;
                __int16 v109 = 2112;
                id v110 = v28;
                __int16 v111 = 2112;
                id v112 = v47;
                id v48 = v47;
                _os_log_impl(&dword_1D49D5000, v45, OS_LOG_TYPE_INFO, "%{public}@Ignoring notification registration characteristics payload value that is not an array: %@)%@)", buf, 0x20u);

                uint64_t v13 = v94;
              }

              id v17 = v87;
              uint64_t v19 = v90;
            }
          }
          else
          {
            uint64_t v39 = (void *)MEMORY[0x1D9452090]();
            v40 = v13;
            id v41 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              v42 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              long long v108 = v42;
              __int16 v109 = 2112;
              id v110 = v23;
              _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_INFO, "%{public}@Ignoring accessory UUID string that cannot be converted in a UUID: %@", buf, 0x16u);

              uint64_t v13 = v94;
            }
          }
        }
        else
        {
          id v33 = (void *)MEMORY[0x1D9452090]();
          v34 = v13;
          BOOL v35 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            id v36 = HMFGetLogIdentifier();
            v37 = objc_opt_class();
            *(_DWORD *)buf = 138543874;
            long long v108 = v36;
            __int16 v109 = 2112;
            id v110 = v21;
            __int16 v111 = 2112;
            id v112 = v37;
            id v38 = v37;
            _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_INFO, "%{public}@Ignoring notification registration characteristics payload key that is not a string: %@ (%@)", buf, 0x20u);

            uint64_t v13 = v94;
          }
        }

        ++v20;
      }
      while (v19 != v20);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v101 objects:v106 count:16];
    }
    while (v19);
  }

  uint64_t v88 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v85, "count"));
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v49 = v85;
  uint64_t v96 = [v49 countByEnumeratingWithState:&v97 objects:v105 count:16];
  if (v96)
  {
    uint64_t v50 = *(void *)v98;
    uint64_t v91 = *(void *)v98;
    do
    {
      for (uint64_t i = 0; i != v96; ++i)
      {
        if (*(void *)v98 != v50) {
          objc_enumerationMutation(v49);
        }
        id v52 = *(id *)(*((void *)&v97 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v53 = v52;
        }
        else {
          id v53 = 0;
        }
        id v54 = v53;

        if (v54)
        {
          id v55 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v54];
          uint64_t v56 = v55;
          if (v55)
          {
            char v57 = [v55 UUIDString];
            id v58 = v49;
            __int16 v59 = [v49 objectForKeyedSubscript:v57];

            id v60 = v59;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v61 = v60;
            }
            else {
              uint64_t v61 = 0;
            }
            id v62 = v61;

            if (v62)
            {
              id v63 = [[HMDNotificationRegistryMediaPropertiesRequest alloc] initWithEnable:v92 userID:v93 mediaProfileUUID:v56];
              char v64 = [(HMDNotificationRegistryMediaPropertiesRequest *)v63 mediaProperties];
              [v64 addObjectsFromArray:v62];

              [v88 addObject:v63];
            }
            else
            {
              v75 = (void *)MEMORY[0x1D9452090]();
              v76 = v13;
              id v77 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
              {
                v86 = HMFGetLogIdentifier();
                id v78 = objc_opt_class();
                *(_DWORD *)buf = 138543874;
                long long v108 = v86;
                __int16 v109 = 2112;
                id v110 = v60;
                __int16 v111 = 2112;
                id v112 = v78;
                id v79 = v75;
                id v80 = v78;
                _os_log_impl(&dword_1D49D5000, v77, OS_LOG_TYPE_INFO, "%{public}@Ignoring notification registration media properties payload value that is not an array: %@ (%@)", buf, 0x20u);

                v75 = v79;
              }

              uint64_t v13 = v94;
            }

            id v49 = v58;
            uint64_t v50 = v91;
          }
          else
          {
            v71 = (void *)MEMORY[0x1D9452090]();
            v72 = v13;
            v73 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
            {
              v74 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              long long v108 = v74;
              __int16 v109 = 2112;
              id v110 = v54;
              _os_log_impl(&dword_1D49D5000, v73, OS_LOG_TYPE_INFO, "%{public}@Ignoring media profile UUID string that cannot be converted in a UUID: %@", buf, 0x16u);
            }
            uint64_t v13 = v94;
          }
        }
        else
        {
          v65 = (void *)MEMORY[0x1D9452090]();
          id v66 = v13;
          v67 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
          {
            v68 = HMFGetLogIdentifier();
            v69 = objc_opt_class();
            *(_DWORD *)buf = 138543874;
            long long v108 = v68;
            __int16 v109 = 2112;
            id v110 = v52;
            __int16 v111 = 2112;
            id v112 = v69;
            id v70 = v69;
            _os_log_impl(&dword_1D49D5000, v67, OS_LOG_TYPE_INFO, "%{public}@Ignoring notification registration media properties payload key that is not a string: %@ (%@)", buf, 0x20u);
          }
        }
      }
      uint64_t v96 = [v49 countByEnumeratingWithState:&v97 objects:v105 count:16];
    }
    while (v96);
  }

  char v81 = -[HMDNotificationRegistry home]((id *)&v13->super.super.isa);
  BOOL v82 = -[HMDNotificationRegistry _processCharacteristicsRequests:](v13, v89);
  int v83 = v82 | -[HMDNotificationRegistry _processMediaPropertiesRequests:](v13, v88);
  if (v83 == 1) {
    [v81 saveToCurrentAccountWithReason:@"kModifyCharacterisiticNotificationsRequestKey"];
  }

  return v83;
}

- (void)removeAllReachabilityEventNotificationRegistrations
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
  id v5 = objc_msgSend(v4, "allKeys", 0);

  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 containsString:@":ReachabilityEventNotification"])
        {
          uint64_t v10 = -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
          [v10 setObject:0 forKeyedSubscript:v9];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_lock);
}

- (id)userIDsRegisteredForReachabilityEventNotificationsForAccessoryUUIDs:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  os_unfair_lock_lock_with_options();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = -[HMDNotificationRegistry _reachabilityEventNotificationRegistryKeyForAccessoryUUID:]((uint64_t)self, *(void **)(*((void *)&v15 + 1) + 8 * i));
        long long v11 = -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
        long long v12 = objc_msgSend(v11, "objectForKeyedSubscript:", v10, (void)v15);

        if (v12) {
          [v5 unionSet:v12];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->_lock);
  long long v13 = (void *)[v5 copy];

  return v13;
}

- (id)_reachabilityEventNotificationRegistryKeyForAccessoryUUID:(uint64_t)a1
{
  if (a1)
  {
    id v2 = NSString;
    id v3 = [a2 UUIDString];
    id v4 = [v2 stringWithFormat:@"%@%@", v3, @":ReachabilityEventNotification"];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (BOOL)disableReachabilityEventNotificationForAccessoryUUIDs:(id)a3 forUserID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = -[HMDNotificationRegistry _reachabilityEventNotificationRegistryKeysForAccessoryUUIDs:](self, v6);
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91__HMDNotificationRegistry_disableReachabilityEventNotificationForAccessoryUUIDs_forUserID___block_invoke;
  v12[3] = &unk_1E6A082E8;
  v12[4] = self;
  id v10 = v7;
  id v13 = v10;
  long long v14 = &v15;
  objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v12);

  os_unfair_lock_unlock(p_lock);
  LOBYTE(p_lock) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)p_lock;
}

- (id)_reachabilityEventNotificationRegistryKeysForAccessoryUUIDs:(void *)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F1CA80] set];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = -[HMDNotificationRegistry _reachabilityEventNotificationRegistryKeyForAccessoryUUID:]((uint64_t)a1, *(void **)(*((void *)&v12 + 1) + 8 * i));
          objc_msgSend(v4, "addObject:", v10, (void)v12);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    a1 = (void *)[v4 copy];
  }

  return a1;
}

void __91__HMDNotificationRegistry_disableReachabilityEventNotificationForAccessoryUUIDs_forUserID___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = -[HMDNotificationRegistry notificationRegistry](*(os_unfair_lock **)(a1 + 32));
  id v4 = [v3 objectForKeyedSubscript:v6];

  if (v4)
  {
    if (!*(void *)(a1 + 40)) {
      goto LABEL_5;
    }
    if (!objc_msgSend(v4, "containsObject:")) {
      goto LABEL_7;
    }
    [v4 removeObject:*(void *)(a1 + 40)];
    if (![v4 count])
    {
LABEL_5:
      id v5 = -[HMDNotificationRegistry notificationRegistry](*(os_unfair_lock **)(a1 + 32));
      [v5 setObject:0 forKeyedSubscript:v6];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
LABEL_7:
}

- (BOOL)enableReachabilityEventNotificationForAccessoryUUIDs:(id)a3 forUserID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = -[HMDNotificationRegistry _reachabilityEventNotificationRegistryKeysForAccessoryUUIDs:](self, v6);
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __90__HMDNotificationRegistry_enableReachabilityEventNotificationForAccessoryUUIDs_forUserID___block_invoke;
  v12[3] = &unk_1E6A082E8;
  v12[4] = self;
  id v10 = v7;
  id v13 = v10;
  long long v14 = &v15;
  objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v12);

  os_unfair_lock_unlock(p_lock);
  LOBYTE(p_lock) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)p_lock;
}

void __90__HMDNotificationRegistry_enableReachabilityEventNotificationForAccessoryUUIDs_forUserID___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = -[HMDNotificationRegistry notificationRegistry](*(os_unfair_lock **)(a1 + 32));
  id v4 = [v3 objectForKeyedSubscript:v6];

  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1CA80] set];
    id v5 = -[HMDNotificationRegistry notificationRegistry](*(os_unfair_lock **)(a1 + 32));
    [v5 setObject:v4 forKeyedSubscript:v6];
  }
  if (([v4 containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    [v4 addObject:*(void *)(a1 + 40)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (void)storeCHIPRemoteSubscriberWithRemoteSourceID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(HMDNotificationRegistry *)self chipRemoteSubscribers];

    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      [(HMDNotificationRegistry *)self setChipRemoteSubscribers:v6];
    }
    id v7 = [(HMDNotificationRegistry *)self chipRemoteSubscribers];
    [v7 addObject:v4];
  }
}

- (void)auditUsersForNotifications:(id)a3 forHome:(id)a4
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v34 = a4;
  BOOL v47 = isiOSDevice();
  id v5 = +[HMDDeviceCapabilities deviceCapabilities];
  int v39 = [v5 isResidentCapable];

  id v6 = [MEMORY[0x1E4F1CA80] set];
  locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v7 = -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __62__HMDNotificationRegistry_auditUsersForNotifications_forHome___block_invoke;
  v54[3] = &unk_1E6A082C0;
  id v37 = v6;
  id v55 = v37;
  [v7 enumerateKeysAndObjectsUsingBlock:v54];

  [v37 minusSet:v36];
  if ([v37 count])
  {
    uint64_t v8 = (void *)MEMORY[0x1D9452090]();
    HMFGetOSLogHandle();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v75 = v10;
      __int16 v76 = 2112;
      id v77 = v37;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Users %@ are not associated with this phone anymore. Deregistering them from notification registry", buf, 0x16u);
    }
    id v11 = v37;
    id v44 = v34;
    if (self)
    {
      os_unfair_lock_assert_owner(lock);
      v45 = [MEMORY[0x1E4F1CA48] array];
      id v38 = [MEMORY[0x1E4F1CA48] array];
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v12 = -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
      id obj = [v12 allKeys];

      uint64_t v42 = [obj countByEnumeratingWithState:&v64 objects:buf count:16];
      if (v42)
      {
        uint64_t v41 = *(void *)v65;
        do
        {
          for (uint64_t i = 0; i != v42; ++i)
          {
            if (*(void *)v65 != v41) {
              objc_enumerationMutation(obj);
            }
            id v13 = *(void **)(*((void *)&v64 + 1) + 8 * i);
            long long v14 = -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
            id v48 = v13;
            id v49 = [v14 objectForKeyedSubscript:v13];

            long long v62 = 0u;
            long long v63 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            uint64_t v15 = (void *)[v49 copy];
            uint64_t v16 = [v15 countByEnumeratingWithState:&v60 objects:v73 count:16];
            if (v16)
            {
              uint64_t v17 = *(void *)v61;
              do
              {
                for (uint64_t j = 0; j != v16; ++j)
                {
                  if (*(void *)v61 != v17) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v19 = *(void *)(*((void *)&v60 + 1) + 8 * j);
                  uint64_t v20 = (void *)IDSCopyRawAddressForDestination();
                  if (([v11 containsObject:v20] & 1) != 0
                    || [v11 containsObject:v19])
                  {
                    id v21 = (void *)MEMORY[0x1D9452090]();
                    long long v22 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                    {
                      id v23 = HMFGetLogIdentifier();
                      *(_DWORD *)v69 = 138543874;
                      *(void *)&v69[4] = v23;
                      *(_WORD *)&v69[12] = 2112;
                      *(void *)&v69[14] = v19;
                      *(_WORD *)&v69[22] = 2112;
                      id v70 = v48;
                      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Removing user %@ from notification registry for acc-uuid:iid %@", v69, 0x20u);
                    }
                    [v49 removeObject:v19];
                    if (v47)
                    {
                      aBlock[0] = MEMORY[0x1E4F143A8];
                      aBlock[1] = 3221225472;
                      aBlock[2] = __99__HMDNotificationRegistry__delayedBlocksCollectedWhileDeregisteringUsers_forHome_isiOS_isResident___block_invoke;
                      aBlock[3] = &unk_1E6A18668;
                      aBlock[4] = self;
                      aBlock[5] = v48;
                      aBlock[6] = v19;
                      id v59 = v44;
                      long long v24 = _Block_copy(aBlock);
                      [v45 addObject:v24];
                    }
                  }
                }
                uint64_t v16 = [v15 countByEnumeratingWithState:&v60 objects:v73 count:16];
              }
              while (v16);
            }

            if (![v49 count])
            {
              if (v39)
              {
                v56[0] = MEMORY[0x1E4F143A8];
                v56[1] = 3221225472;
                v56[2] = __99__HMDNotificationRegistry__delayedBlocksCollectedWhileDeregisteringUsers_forHome_isiOS_isResident___block_invoke_2;
                v56[3] = &unk_1E6A19668;
                v56[4] = self;
                v56[5] = v48;
                id v57 = v44;
                long long v25 = _Block_copy(v56);
                [v45 addObject:v25];
              }
              objc_msgSend(v38, "addObject:", v48, v34);
              uint64_t v26 = -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
              [v26 removeObjectForKey:v48];
            }
          }
          uint64_t v42 = [obj countByEnumeratingWithState:&v64 objects:buf count:16];
        }
        while (v42);
      }

      *(void *)v69 = MEMORY[0x1E4F143A8];
      *(void *)&v69[8] = 3221225472;
      *(void *)&v69[16] = __99__HMDNotificationRegistry__delayedBlocksCollectedWhileDeregisteringUsers_forHome_isiOS_isResident___block_invoke_3;
      id v70 = &unk_1E6A197C8;
      v71 = self;
      id v72 = v38;
      id v27 = v38;
      id v28 = _Block_copy(v69);
      [v45 addObject:v28];

      v29 = (void *)[v45 copy];
    }
    else
    {
      v29 = 0;
    }
  }
  else
  {
    v29 = 0;
  }

  os_unfair_lock_unlock(lock);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v30 = v29;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v50 objects:v68 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v51;
    do
    {
      for (uint64_t k = 0; k != v31; ++k)
      {
        if (*(void *)v51 != v32) {
          objc_enumerationMutation(v30);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v50 + 1) + 8 * k) + 16))();
      }
      uint64_t v31 = [v30 countByEnumeratingWithState:&v50 objects:v68 count:16];
    }
    while (v31);
  }
}

uint64_t __62__HMDNotificationRegistry_auditUsersForNotifications_forHome___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unionSet:");
}

void __99__HMDNotificationRegistry__delayedBlocksCollectedWhileDeregisteringUsers_forHome_isiOS_isResident___block_invoke(uint64_t a1)
{
}

void __99__HMDNotificationRegistry__delayedBlocksCollectedWhileDeregisteringUsers_forHome_isiOS_isResident___block_invoke_2(uint64_t a1)
{
}

void __99__HMDNotificationRegistry__delayedBlocksCollectedWhileDeregisteringUsers_forHome_isiOS_isResident___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id)[*(id *)(a1 + 40) copy];
  -[HMDNotificationRegistry notifyDelegatesIfKeysAreMediaRelated:](v1, v2);
}

- (void)notifyDelegatesIfKeysAreMediaRelated:(uint64_t)a1
{
  if (a1)
  {
    id v3 = (void *)MEMORY[0x1E4F1CAD0];
    id v4 = objc_msgSend(a2, "na_map:", &__block_literal_global_20468);
    id v6 = [v3 setWithArray:v4];

    if ([v6 count])
    {
      id v5 = [v6 allObjects];
      -[HMDNotificationRegistry notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles:](a1, v5);
    }
  }
}

id __64__HMDNotificationRegistry_notifyDelegatesIfKeysAreMediaRelated___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 componentsSeparatedByString:@":"];
  if ([v2 count] == 2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F29128]);
    id v4 = [v2 objectAtIndexedSubscript:0];
    id v5 = (void *)[v3 initWithUUIDString:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)disableNotification:(void *)a3 user:(void *)a4 home:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = [v7 componentsSeparatedByString:@":"];
    if ([v10 count] == 2)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F29128]);
      long long v12 = [v10 objectAtIndexedSubscript:0];
      id v13 = (void *)[v11 initWithUUIDString:v12];

      long long v14 = [v9 accessoryWithUUID:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = 0;
      }
      id v16 = v15;

      if (v16)
      {
        uint64_t v17 = NSNumber;
        char v18 = [v10 objectAtIndexedSubscript:1];
        uint64_t v19 = objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v18, "integerValue"));

        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __57__HMDNotificationRegistry_disableNotification_user_home___block_invoke;
        v26[3] = &unk_1E6A17BB8;
        id v20 = v19;
        id v27 = v20;
        id v21 = [v16 characteristicsPassingTest:v26];
        long long v22 = (void *)MEMORY[0x1D9452090]();
        id v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          long long v24 = v25 = v13;
          *(_DWORD *)buf = 138543874;
          v29 = v24;
          __int16 v30 = 2112;
          id v31 = v8;
          __int16 v32 = 2112;
          id v33 = v21;
          _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Deregistering client %@ for notification for characteristics %@", buf, 0x20u);

          id v13 = v25;
        }

        [v16 setNotificationsEnabled:0 forCharacteristics:v21 clientIdentifier:v8];
      }
    }
  }
}

uint64_t __57__HMDNotificationRegistry_disableNotification_user_home___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 instanceID];
  uint64_t v4 = [v2 isEqualToNumber:v3];

  return v4;
}

- (id)usersRegisteredForNotificationsForProperties:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  char v18 = [MEMORY[0x1E4F1CA80] set];
  if ([v17 count])
  {
    locuint64_t k = &self->_lock;
    os_unfair_lock_lock_with_options();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id obj = v17;
    uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v21 != v5) {
            objc_enumerationMutation(obj);
          }
          id v7 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "request", lock);
          id v8 = [v7 property];
          id v9 = [v7 mediaProfile];
          if (v9)
          {
            id v10 = -[HMDNotificationRegistry keyForProperty:mediaProfile:]((uint64_t)self, v8, v9);
            id v11 = -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
            long long v12 = [v11 objectForKeyedSubscript:v10];

            if (v12)
            {
              id v13 = [v12 allObjects];
              [v18 addObjectsFromArray:v13];
            }
          }
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v4);
    }

    os_unfair_lock_unlock(lock);
  }
  long long v14 = objc_msgSend(v18, "copy", lock);

  return v14;
}

- (id)usersRegisteredForNotificationsForCharacteristics:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  if ([v4 count])
  {
    os_unfair_lock_lock_with_options();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = -[HMDNotificationRegistry keyForCharacteristic:]((uint64_t)self, *(void **)(*((void *)&v16 + 1) + 8 * i));
          id v11 = -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
          long long v12 = [v11 objectForKeyedSubscript:v10];

          if (v12)
          {
            id v13 = [v12 allObjects];
            [v5 addObjectsFromArray:v13];
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    os_unfair_lock_unlock(&self->_lock);
  }
  long long v14 = (void *)[v5 copy];

  return v14;
}

- (id)propertiesRegisteredForMediaProfileUniqueIdentifier:(id)a3
{
  id v4 = a3;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__HMDNotificationRegistry_propertiesRegisteredForMediaProfileUniqueIdentifier___block_invoke;
  v10[3] = &unk_1E6A08298;
  id v7 = v4;
  id v11 = v7;
  uint64_t v8 = objc_msgSend(v6, "na_map:", v10);

  os_unfair_lock_unlock(p_lock);
  return v8;
}

id __79__HMDNotificationRegistry_propertiesRegisteredForMediaProfileUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 componentsSeparatedByString:@":"];
  if ([v3 count] == 2)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F29128]);
    uint64_t v5 = [v3 objectAtIndexedSubscript:0];
    id v6 = (void *)[v4 initWithUUIDString:v5];

    int v7 = objc_msgSend(*(id *)(a1 + 32), "hmf_isEqualToUUID:", v6);
    uint64_t v8 = 0;
    if (v7)
    {
      uint64_t v8 = [v3 objectAtIndexedSubscript:1];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)filterProperties:(id)a3 forUser:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v23 = a4;
  long long v19 = v5;
  if ([v5 count])
  {
    long long v20 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    locuint64_t k = &self->_lock;
    os_unfair_lock_lock_with_options();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = v5;
    uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v25 != v7) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v10 = objc_msgSend(v9, "request", lock);
          id v11 = [v10 property];
          long long v12 = [v10 mediaProfile];
          if (v12)
          {
            id v13 = -[HMDNotificationRegistry keyForProperty:mediaProfile:]((uint64_t)self, v11, v12);
            long long v14 = -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
            uint64_t v15 = [v14 objectForKeyedSubscript:v13];

            if ([v15 containsObject:v23]) {
              [v20 addObject:v9];
            }
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v6);
    }

    os_unfair_lock_unlock(lock);
    long long v16 = (void *)[v20 copy];
  }
  else
  {
    long long v16 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v16;
}

- (id)filterCharacteristics:(id)a3 forUser:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v18 = v6;
  if ([v6 count])
  {
    long long v19 = [MEMORY[0x1E4F1CA48] array];
    os_unfair_lock_lock_with_options();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v8);
          }
          long long v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v13 = -[HMDNotificationRegistry keyForCharacteristic:]((uint64_t)self, v12);
          if (v13)
          {
            long long v14 = -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
            uint64_t v15 = [v14 objectForKeyedSubscript:v13];

            if ([v15 containsObject:v7]) {
              [v19 addObject:v12];
            }
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }

    os_unfair_lock_unlock(&self->_lock);
    long long v16 = (void *)[v19 copy];
  }
  else
  {
    long long v16 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v16;
}

- (BOOL)removeRegistrationsForMediaProfile:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
  id v6 = [v5 allKeys];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (!v7)
  {

    os_unfair_lock_unlock(lock);
    goto LABEL_16;
  }
  char v8 = 0;
  uint64_t v9 = *(void *)v22;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v22 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(id *)(*((void *)&v21 + 1) + 8 * i);
      if (self)
      {
        long long v12 = [v4 uniqueIdentifier];
        id v13 = [v12 UUIDString];

        if (v13)
        {
          int v14 = [v11 hasPrefix:v13];

          if (!v14) {
            continue;
          }
          uint64_t v15 = -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
          [v15 removeObjectForKey:v11];
          char v8 = 1;
          id v11 = v15;
        }
      }
    }
    uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  }
  while (v7);

  os_unfair_lock_unlock(lock);
  if ((v8 & 1) == 0)
  {
LABEL_16:
    BOOL v18 = 0;
    goto LABEL_17;
  }
  long long v16 = [v4 uniqueIdentifier];
  uint64_t v25 = v16;
  long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  -[HMDNotificationRegistry notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles:]((uint64_t)self, v17);

  BOOL v18 = 1;
LABEL_17:

  return v18;
}

- (void)removeRegistrationsForCharacteristics:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = -[HMDNotificationRegistry keyForCharacteristic:]((uint64_t)self, *(void **)(*((void *)&v11 + 1) + 8 * v8));
        if (v9)
        {
          uint64_t v10 = -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
          objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v9, (void)v11);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (id)shortDescription
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
  id v5 = [v4 shortDescription];

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)clearAllRegistrations
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
  id v6 = [v4 allKeys];

  id v5 = -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
  [v5 removeAllObjects];

  os_unfair_lock_unlock(p_lock);
  -[HMDNotificationRegistry notifyDelegatesIfKeysAreMediaRelated:]((uint64_t)self, v6);
}

- (void)configureWithHome:(id)a3
{
  id obj = a3;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self) {
    objc_storeWeak((id *)&self->_home, obj);
  }
  id v5 = [obj workQueue];
  uint64_t v7 = v5;
  if (self)
  {
    objc_setProperty_atomic(self, v6, v5, 64);

    id Property = objc_getProperty(self, v8, 40, 1);
  }
  else
  {

    id Property = 0;
  }
  id v10 = Property;
  [v10 setDelegate:self];

  if (self)
  {
    id v12 = objc_getProperty(self, v11, 64, 1);
    id v14 = objc_getProperty(self, v13, 40, 1);
  }
  else
  {
    id v12 = 0;
    id v14 = 0;
  }
  id v15 = v14;
  [v15 setDelegateQueue:v12];

  os_unfair_lock_unlock(p_lock);
}

- (HMDNotificationRegistry)initWithPendingRequestsRetryTimer:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMDNotificationRegistry;
  id v6 = [(HMDNotificationRegistry *)&v15 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_pendingRequestsRetryTimer, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    notificationRegistry = v7->_notificationRegistry;
    v7->_notificationRegistry = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    delegates = v7->_delegates;
    v7->_delegates = (NSHashTable *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
    pendingRequests = v7->_pendingRequests;
    v7->_pendingRequests = (NSMutableSet *)v12;
  }
  return v7;
}

- (HMDNotificationRegistry)init
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:0 options:5.0];
  id v4 = [(HMDNotificationRegistry *)self initWithPendingRequestsRetryTimer:v3];

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t68 != -1) {
    dispatch_once(&logCategory__hmf_once_t68, &__block_literal_global_150_20487);
  }
  id v2 = (void *)logCategory__hmf_once_v69;
  return v2;
}

uint64_t __38__HMDNotificationRegistry_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v69;
  logCategory__hmf_once_v69 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end