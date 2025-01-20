@interface HMDHomePrimaryResidentMessagingHandler
+ (id)logCategory;
- (HMDHomePrimaryResidentMessagingHandler)initWithMessageDispatcher:(id)a3 homeUUID:(id)a4 residentDeviceManager:(id)a5;
- (HMDHomePrimaryResidentMessagingHandler)initWithMessageDispatcher:(id)a3 homeUUID:(id)a4 residentDeviceManager:(id)a5 dataSource:(id)a6;
- (NSString)logIdentifier;
- (NSUUID)homeUUID;
- (id)_errorForNoDiscoveredPrimaryResidentWithLastPrimaryResidentDiscoveryError:(id)a3 primaryIsKnownButUnreachable:(BOOL)a4;
- (id)_responseHandlerForRequestMessage:(id)a3;
- (void)_discoverPrimaryResident;
- (void)_processPendingMessagesWithPrimaryResidentDevice:(id)a3;
- (void)_sendMessage:(id)a3 toPrimaryResidentDevice:(id)a4 completionHandler:(id)a5;
- (void)handlePrimaryResidentUpdated:(id)a3;
- (void)handleResidentUpdated:(id)a3;
- (void)residentDeviceManager:(id)a3 didCompleteDiscoveryWithPrimaryResidentDevice:(id)a4 error:(id)a5;
- (void)residentDeviceManager:(id)a3 didNotCompleteDiscoveryWithError:(id)a4;
- (void)sendMessage:(id)a3 completionHandler:(id)a4;
- (void)setLastPrimaryResidentDiscoveryError:(uint64_t)a1;
- (void)timerManager:(id)a3 didFireForTimerContext:(id)a4;
@end

@implementation HMDHomePrimaryResidentMessagingHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPrimaryResidentDiscoveryError, 0);
  objc_storeStrong((id *)&self->_discoveryFuture, 0);
  objc_storeStrong((id *)&self->_repeatedDestinationError, 0);
  objc_storeStrong((id *)&self->_destinationIsCurrentDeviceError, 0);
  objc_storeStrong((id *)&self->_pendingMessages, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_residentDeviceManager, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (NSUUID)homeUUID
{
  return self->_homeUUID;
}

- (void)timerManager:(id)a3 didFireForTimerContext:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    os_unfair_lock_lock_with_options();
    if (self) {
      pendingMessages = self->_pendingMessages;
    }
    else {
      pendingMessages = 0;
    }
    v12 = pendingMessages;
    v13 = [(NSMapTable *)v12 objectForKey:v10];

    if (!v13)
    {
      os_unfair_lock_unlock(&self->_lock);
LABEL_36:

      goto LABEL_37;
    }
    if (self) {
      v14 = self->_pendingMessages;
    }
    else {
      v14 = 0;
    }
    v15 = v14;
    [(NSMapTable *)v15 removeObjectForKey:v10];

    int v16 = [v13 isMessageInFlight];
    if (self) {
      residentDeviceManager = self->_residentDeviceManager;
    }
    else {
      residentDeviceManager = 0;
    }
    v18 = residentDeviceManager;
    v19 = [(HMDResidentDeviceManager *)v18 primaryResidentDevice];

    if (v19)
    {
      uint64_t v20 = [v19 isReachable] ^ 1;
      if (self)
      {
LABEL_14:
        lastPrimaryResidentDiscoveryError = self->_lastPrimaryResidentDiscoveryError;
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v20 = 0;
      if (self) {
        goto LABEL_14;
      }
    }
    lastPrimaryResidentDiscoveryError = 0;
LABEL_15:
    v22 = lastPrimaryResidentDiscoveryError;

    os_unfair_lock_unlock(&self->_lock);
    id v23 = [v13 queueTimerContext];

    if (v23 == v7)
    {
      if (self) {
        timerManager = self->_timerManager;
      }
      else {
        timerManager = 0;
      }
      v26 = timerManager;
      uint64_t v27 = [v13 messageTimerContext];
    }
    else
    {
      v24 = [v13 queueTimerContext];

      if (!v24)
      {
LABEL_27:
        if (v16)
        {
          v30 = (void *)MEMORY[0x230FBD990]();
          v31 = self;
          v32 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            v33 = HMFGetLogIdentifier();
            int v41 = 138543618;
            v42 = v33;
            __int16 v43 = 2114;
            id v44 = v10;
            _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@Message %{public}@ timed out", (uint8_t *)&v41, 0x16u);
          }
          v34 = 0;
        }
        else
        {
          v34 = [(HMDHomePrimaryResidentMessagingHandler *)self _errorForNoDiscoveredPrimaryResidentWithLastPrimaryResidentDiscoveryError:v22 primaryIsKnownButUnreachable:v20];
          v30 = (void *)MEMORY[0x230FBD990]();
          v35 = self;
          v32 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            v36 = HMFGetLogIdentifier();
            int v41 = 138543874;
            v42 = v36;
            __int16 v43 = 2114;
            id v44 = v10;
            __int16 v45 = 2112;
            v46 = v34;
            _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@Message %{public}@ timed out waiting to discover primary resident: %@", (uint8_t *)&v41, 0x20u);
          }
        }

        v37 = [MEMORY[0x263F087E8] hmErrorWithCode:8 description:0 reason:0 suggestion:0 underlyingError:v34];
        v38 = [v13 message];
        [v38 respondWithError:v37];

        uint64_t v39 = [v13 completionHandler];
        v40 = (void *)v39;
        if (v39) {
          (*(void (**)(uint64_t, void *))(v39 + 16))(v39, v37);
        }

        goto LABEL_36;
      }
      if (self) {
        v25 = self->_timerManager;
      }
      else {
        v25 = 0;
      }
      v26 = v25;
      uint64_t v27 = [v13 queueTimerContext];
    }
    v29 = (void *)v27;
    [(HMFTimerManager *)v26 cancelTimerForContext:v27];

    goto LABEL_27;
  }
LABEL_37:
}

- (void)handleResidentUpdated:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 userInfo];
  id v6 = objc_msgSend(v5, "hmf_UUIDForKey:", @"HMDResidentDeviceManagerHomeUUIDNotificationKey");

  id v7 = [(HMDHomePrimaryResidentMessagingHandler *)self homeUUID];
  char v8 = [v7 isEqual:v6];

  if (v8)
  {
    v9 = [v4 userInfo];
    id v10 = [v9 objectForKeyedSubscript:@"HMDResidentDeviceManagerResidentDeviceNotificationKey"];

    if (v10)
    {
      v11 = [v10 identifier];
      if (self) {
        residentDeviceManager = self->_residentDeviceManager;
      }
      else {
        residentDeviceManager = 0;
      }
      v13 = [(HMDResidentDeviceManager *)residentDeviceManager primaryResidentUUID];
      int v14 = [v11 isEqual:v13];

      if (!v14) {
        goto LABEL_17;
      }
      if ([v10 isReachable])
      {
        [(HMDHomePrimaryResidentMessagingHandler *)self _processPendingMessagesWithPrimaryResidentDevice:v10];
LABEL_17:

        goto LABEL_18;
      }
      v19 = (void *)MEMORY[0x230FBD990]();
      uint64_t v20 = self;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = HMFGetLogIdentifier();
        int v26 = 138543362;
        uint64_t v27 = v22;
        id v23 = "%{public}@The primary resident is unreachable. Not processing pending messages until it's reachable";
        v24 = v21;
        os_log_type_t v25 = OS_LOG_TYPE_INFO;
        goto LABEL_15;
      }
    }
    else
    {
      v19 = (void *)MEMORY[0x230FBD990]();
      uint64_t v20 = self;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = HMFGetLogIdentifier();
        int v26 = 138543362;
        uint64_t v27 = v22;
        id v23 = "%{public}@Unexpectedly received update resident notification but the resident is nil";
        v24 = v21;
        os_log_type_t v25 = OS_LOG_TYPE_ERROR;
LABEL_15:
        _os_log_impl(&dword_22F52A000, v24, v25, v23, (uint8_t *)&v26, 0xCu);
      }
    }

    goto LABEL_17;
  }
  v15 = (void *)MEMORY[0x230FBD990]();
  int v16 = self;
  v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = HMFGetLogIdentifier();
    int v26 = 138543618;
    uint64_t v27 = v18;
    __int16 v28 = 2114;
    v29 = v6;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly received update resident notification for the wrong home: %{public}@", (uint8_t *)&v26, 0x16u);
  }
LABEL_18:
}

- (void)handlePrimaryResidentUpdated:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 userInfo];
  id v6 = objc_msgSend(v5, "hmf_UUIDForKey:", @"HMDResidentDeviceManagerHomeUUIDNotificationKey");

  id v7 = [(HMDHomePrimaryResidentMessagingHandler *)self homeUUID];
  char v8 = [v7 isEqual:v6];

  if (v8)
  {
    v9 = [v4 userInfo];
    id v10 = [v9 objectForKeyedSubscript:@"HMDResidentDeviceManagerResidentDeviceNotificationKey"];

    if (v10)
    {
      [(HMDHomePrimaryResidentMessagingHandler *)self _processPendingMessagesWithPrimaryResidentDevice:v10];
    }
    else
    {
      v15 = (void *)MEMORY[0x230FBD990]();
      int v16 = self;
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = HMFGetLogIdentifier();
        int v19 = 138543362;
        uint64_t v20 = v18;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly received update primary resident notification but the primary resident is nil", (uint8_t *)&v19, 0xCu);
      }
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = HMFGetLogIdentifier();
      int v19 = 138543618;
      uint64_t v20 = v14;
      __int16 v21 = 2114;
      v22 = v6;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly received update primary resident notification for the wrong home: %{public}@", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (id)_errorForNoDiscoveredPrimaryResidentWithLastPrimaryResidentDiscoveryError:(id)a3 primaryIsKnownButUnreachable:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = v5;
  if (v4)
  {
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = 2709;
  }
  else
  {
    if (v5)
    {
      id v9 = v5;
      goto LABEL_7;
    }
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = 2038;
  }
  id v9 = [v7 hmPrivateErrorWithCode:v8];
LABEL_7:
  id v10 = v9;

  return v10;
}

- (void)_processPendingMessagesWithPrimaryResidentDevice:(id)a3
{
  uint64_t v131 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  uint64_t v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v120 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Processing pending messages", buf, 0xCu);
    }
    os_unfair_lock_lock_with_options();
    -[HMDHomePrimaryResidentMessagingHandler setLastPrimaryResidentDiscoveryError:]((uint64_t)v6, 0);
    lock = &v6->_lock;
    os_unfair_lock_unlock(&v6->_lock);
    int v79 = [v4 isCurrentDevice];
    if (v79)
    {
      id v10 = (void *)MEMORY[0x230FBD990]();
      v11 = v6;
      v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v120 = v13;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Current device is now the primary resident. Cancelling all pending messages. In-flight messages are not cancelled", buf, 0xCu);
      }
    }
    id v81 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v80 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v78 = objc_alloc_init(MEMORY[0x263EFF980]);
    os_unfair_lock_lock_with_options();
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    if (v6) {
      pendingMessages = v6->_pendingMessages;
    }
    else {
      pendingMessages = 0;
    }
    v15 = pendingMessages;
    obuint64_t j = [(NSMapTable *)v15 objectEnumerator];

    uint64_t v16 = [obj countByEnumeratingWithState:&v114 objects:v130 count:16];
    uint64_t v17 = 0;
    if (v16)
    {
      uint64_t v84 = *(void *)v115;
      do
      {
        uint64_t v85 = v16;
        for (uint64_t i = 0; i != v85; ++i)
        {
          if (*(void *)v115 != v84) {
            objc_enumerationMutation(obj);
          }
          int v19 = *(void **)(*((void *)&v114 + 1) + 8 * i);
          if (objc_msgSend(v19, "isMessageInFlight", lock))
          {
            ++v17;
            continue;
          }
          v86 = [v19 message];
          v87 = [v19 completionHandler];
          [v19 setCompletionHandler:0];
          uint64_t v83 = v17;
          uint64_t v20 = [v19 lastPrimaryResidentDestinationUUID];
          __int16 v21 = [v4 identifier];
          int v22 = [v20 isEqual:v21];

          if (v22)
          {
            uint64_t v23 = (void *)MEMORY[0x230FBD990]();
            v24 = v6;
            HMFGetOSLogHandle();
            os_log_type_t v25 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              id v26 = v4;
              HMFGetLogIdentifier();
              id v27 = (id)objc_claimAutoreleasedReturnValue();
              __int16 v28 = [v19 message];
              v29 = [v28 identifier];
              *(_DWORD *)buf = 138543618;
              id v120 = v27;
              __int16 v121 = 2112;
              v122 = v29;
              _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Warning: Old destination matches new primary. Message %@ cannot be re-sent to the same device.", buf, 0x16u);

              id v4 = v26;
            }

            aBlock[0] = MEMORY[0x263EF8330];
            aBlock[1] = 3221225472;
            aBlock[2] = __91__HMDHomePrimaryResidentMessagingHandler__processPendingMessagesWithPrimaryResidentDevice___block_invoke;
            aBlock[3] = &unk_264A2EE80;
            aBlock[4] = v19;
            aBlock[5] = v24;
            id v113 = v87;
            uint64_t v30 = _Block_copy(aBlock);
            [v81 addObject:v30];
          }
          else if (v79)
          {
            v108[0] = MEMORY[0x263EF8330];
            v108[1] = 3221225472;
            v108[2] = __91__HMDHomePrimaryResidentMessagingHandler__processPendingMessagesWithPrimaryResidentDevice___block_invoke_2;
            v108[3] = &unk_264A2EE80;
            id v109 = v86;
            v110 = v6;
            id v111 = v87;
            v31 = _Block_copy(v108);
            [v81 addObject:v31];
          }
          else
          {
            [v19 setMessageInFlight:1];
            v32 = [v4 identifier];
            [v19 setLastPrimaryResidentDestinationUUID:v32];

            v104[0] = MEMORY[0x263EF8330];
            v104[1] = 3221225472;
            v104[2] = __91__HMDHomePrimaryResidentMessagingHandler__processPendingMessagesWithPrimaryResidentDevice___block_invoke_3;
            v104[3] = &unk_264A2EE30;
            v104[4] = v6;
            id v33 = v86;
            id v105 = v33;
            id v106 = v4;
            id v107 = v87;
            v34 = _Block_copy(v104);
            [v81 addObject:v34];

            if ([v33 isRequestType])
            {
              v35 = [v19 queueTimerContext];

              if (v35)
              {
                v36 = [v19 queueTimerContext];
                [v78 addObject:v36];

                [v19 setQueueTimerContext:0];
              }
              goto LABEL_27;
            }
          }
          [v80 addObject:v19];
LABEL_27:

          uint64_t v17 = v83;
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v114 objects:v130 count:16];
      }
      while (v16);
    }

    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    id v37 = v80;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v100 objects:v129 count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v101;
      do
      {
        uint64_t v40 = 0;
        do
        {
          if (*(void *)v101 != v39) {
            objc_enumerationMutation(v37);
          }
          if (v6) {
            int v41 = v6->_pendingMessages;
          }
          else {
            int v41 = 0;
          }
          v42 = *(void **)(*((void *)&v100 + 1) + 8 * v40);
          __int16 v43 = v41;
          id v44 = [v42 message];
          __int16 v45 = [v44 identifier];
          [(NSMapTable *)v43 removeObjectForKey:v45];

          ++v40;
        }
        while (v38 != v40);
        uint64_t v46 = [v37 countByEnumeratingWithState:&v100 objects:v129 count:16];
        uint64_t v38 = v46;
      }
      while (v46);
    }

    os_unfair_lock_unlock(lock);
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    id v47 = v37;
    uint64_t v48 = [v47 countByEnumeratingWithState:&v96 objects:v128 count:16];
    if (v48)
    {
      uint64_t v49 = *(void *)v97;
      do
      {
        uint64_t v50 = 0;
        do
        {
          if (*(void *)v97 != v49) {
            objc_enumerationMutation(v47);
          }
          if (v6) {
            timerManager = v6->_timerManager;
          }
          else {
            timerManager = 0;
          }
          v52 = *(void **)(*((void *)&v96 + 1) + 8 * v50);
          v53 = timerManager;
          v54 = [v52 messageTimerContext];
          [(HMFTimerManager *)v53 cancelTimerForContext:v54];

          v55 = [v52 queueTimerContext];

          if (v55)
          {
            if (v6) {
              v56 = v6->_timerManager;
            }
            else {
              v56 = 0;
            }
            v57 = v56;
            v58 = [v52 queueTimerContext];
            [(HMFTimerManager *)v57 cancelTimerForContext:v58];
          }
          ++v50;
        }
        while (v48 != v50);
        uint64_t v59 = [v47 countByEnumeratingWithState:&v96 objects:v128 count:16];
        uint64_t v48 = v59;
      }
      while (v59);
    }

    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id v60 = v78;
    uint64_t v61 = [v60 countByEnumeratingWithState:&v92 objects:v127 count:16];
    if (v61)
    {
      uint64_t v62 = *(void *)v93;
      do
      {
        uint64_t v63 = 0;
        do
        {
          if (*(void *)v93 != v62) {
            objc_enumerationMutation(v60);
          }
          if (v6) {
            v64 = v6->_timerManager;
          }
          else {
            v64 = 0;
          }
          -[HMFTimerManager cancelTimerForContext:](v64, "cancelTimerForContext:", *(void *)(*((void *)&v92 + 1) + 8 * v63++), lock);
        }
        while (v61 != v63);
        uint64_t v65 = [v60 countByEnumeratingWithState:&v92 objects:v127 count:16];
        uint64_t v61 = v65;
      }
      while (v65);
    }

    if ([v81 count])
    {
      v66 = (void *)MEMORY[0x230FBD990]();
      v67 = v6;
      v68 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
      {
        v69 = HMFGetLogIdentifier();
        if (v79) {
          v70 = @"Cancelling";
        }
        else {
          v70 = @"Sending";
        }
        uint64_t v71 = objc_msgSend(v81, "count", lock);
        *(_DWORD *)buf = 138544130;
        id v120 = v69;
        __int16 v121 = 2112;
        v122 = v70;
        __int16 v123 = 2048;
        uint64_t v124 = v71;
        __int16 v125 = 2048;
        uint64_t v126 = v17;
        _os_log_impl(&dword_22F52A000, v68, OS_LOG_TYPE_INFO, "%{public}@%@ %lu pending messages (%lu in flight)", buf, 0x2Au);
      }
      long long v90 = 0u;
      long long v91 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      id v72 = v81;
      uint64_t v73 = [v72 countByEnumeratingWithState:&v88 objects:v118 count:16];
      if (v73)
      {
        uint64_t v74 = *(void *)v89;
        do
        {
          for (uint64_t j = 0; j != v73; ++j)
          {
            if (*(void *)v89 != v74) {
              objc_enumerationMutation(v72);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v88 + 1) + 8 * j) + 16))();
          }
          uint64_t v73 = [v72 countByEnumeratingWithState:&v88 objects:v118 count:16];
        }
        while (v73);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v76 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v120 = v76;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unexpected nil detected in primary resident messaging handler", buf, 0xCu);
    }
    id v81 = +[HMDTTRManager sharedManager];
    [v81 requestRadarWithDisplayReason:@"Unexpected nil detected in primary resident messaging handler" radarTitle:@"Unexpected nil detected in primary resident messaging handler" componentName:@"HomeKit" componentVersion:@"Resident" componentID:938669];
  }
}

- (void)setLastPrimaryResidentDiscoveryError:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 96), a2);
  }
}

void __91__HMDHomePrimaryResidentMessagingHandler__processPendingMessagesWithPrimaryResidentDevice___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) message];
  v3 = v2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    uint64_t v5 = *(void *)(v4 + 80);
  }
  else {
    uint64_t v5 = 0;
  }
  [v2 respondWithError:v5];

  id v6 = _Block_copy(*(const void **)(a1 + 48));
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      uint64_t v8 = *(void *)(v7 + 80);
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = v6;
    (*((void (**)(void *, uint64_t))v6 + 2))(v6, v8);
    id v6 = v9;
  }
}

void __91__HMDHomePrimaryResidentMessagingHandler__processPendingMessagesWithPrimaryResidentDevice___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 72);
  }
  else {
    uint64_t v4 = 0;
  }
  [v2 respondWithError:v4];
  uint64_t v5 = _Block_copy(*(const void **)(a1 + 48));
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      uint64_t v7 = *(void *)(v6 + 72);
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = v5;
    (*((void (**)(void *, uint64_t))v5 + 2))(v5, v7);
    uint64_t v5 = v8;
  }
}

uint64_t __91__HMDHomePrimaryResidentMessagingHandler__processPendingMessagesWithPrimaryResidentDevice___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendMessage:*(void *)(a1 + 40) toPrimaryResidentDevice:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)residentDeviceManager:(id)a3 didNotCompleteDiscoveryWithError:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    v13 = v11;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Primary resident discovery did not complete with error: %@", (uint8_t *)&v12, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  -[HMDHomePrimaryResidentMessagingHandler setLastPrimaryResidentDiscoveryError:]((uint64_t)v9, v7);
  os_unfair_lock_unlock(&v9->_lock);
}

- (void)residentDeviceManager:(id)a3 didCompleteDiscoveryWithPrimaryResidentDevice:(id)a4 error:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 isHMFError] && objc_msgSend(v10, "code") == 12)
  {
    if (self) {
      residentDeviceManager = self->_residentDeviceManager;
    }
    else {
      residentDeviceManager = 0;
    }
    uint64_t v12 = [(HMDResidentDeviceManager *)residentDeviceManager primaryResidentDevice];

    id v9 = (id)v12;
    if (!v12)
    {
      if (self) {
        v13 = self->_residentDeviceManager;
      }
      else {
        v13 = 0;
      }
      char v14 = [(HMDResidentDeviceManager *)v13 hasAnyResident];
      id v15 = (void *)MEMORY[0x230FBD990]();
      uint64_t v16 = self;
      uint64_t v17 = HMFGetOSLogHandle();
      v18 = v17;
      if (v14)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          int v19 = HMFGetLogIdentifier();
          int v26 = 138543362;
          id v27 = v19;
          _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Primary resident discovery was cancelled and there is no primary resident", (uint8_t *)&v26, 0xCu);
        }
        os_unfair_lock_lock_with_options();
        uint64_t v20 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2039];
        -[HMDHomePrimaryResidentMessagingHandler setLastPrimaryResidentDiscoveryError:]((uint64_t)v16, v20);

        os_unfair_lock_unlock(&v16->_lock);
      }
      else
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          os_log_type_t v25 = HMFGetLogIdentifier();
          int v26 = 138543362;
          id v27 = v25;
          _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Primary resident discovery was cancelled, there is no primary resident, home has no residents", (uint8_t *)&v26, 0xCu);
        }
      }
      goto LABEL_17;
    }
LABEL_16:
    [(HMDHomePrimaryResidentMessagingHandler *)self _processPendingMessagesWithPrimaryResidentDevice:v9];

    goto LABEL_17;
  }
  if (!v10) {
    goto LABEL_16;
  }
  __int16 v21 = (void *)MEMORY[0x230FBD990]();
  int v22 = self;
  uint64_t v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = HMFGetLogIdentifier();
    int v26 = 138543618;
    id v27 = v24;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Primary resident discovery failed and we're not processing pending messages. %@", (uint8_t *)&v26, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  -[HMDHomePrimaryResidentMessagingHandler setLastPrimaryResidentDiscoveryError:]((uint64_t)v22, v10);
  os_unfair_lock_unlock(&v22->_lock);

LABEL_17:
}

- (void)_discoverPrimaryResident
{
  v2 = self;
  if (self) {
    self = (HMDHomePrimaryResidentMessagingHandler *)self->_residentDeviceManager;
  }
  [(HMDHomePrimaryResidentMessagingHandler *)self discoverPrimaryResidentForRequester:v2];
}

- (id)_responseHandlerForRequestMessage:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [v4 identifier];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__HMDHomePrimaryResidentMessagingHandler__responseHandlerForRequestMessage___block_invoke;
  aBlock[3] = &unk_264A2D420;
  objc_copyWeak(&v11, &location);
  id v10 = v5;
  id v6 = v5;
  id v7 = _Block_copy(aBlock);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

void __76__HMDHomePrimaryResidentMessagingHandler__responseHandlerForRequestMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if ([v5 isHMError]) {
      BOOL v8 = [v5 code] == 3202;
    }
    else {
      BOOL v8 = 0;
    }
    id v40 = v5;
    os_unfair_lock_lock_with_options();
    id v9 = *((id *)WeakRetained + 8);
    id v10 = [v9 objectForKey:*(void *)(a1 + 32)];

    if (v10)
    {
      id v11 = *((id *)WeakRetained + 5);
      uint64_t v38 = [v11 primaryResidentDevice];

      if (v8)
      {
        if (![v38 isCurrentDevice])
        {
          id v25 = *((id *)WeakRetained + 5);
          int v26 = [v25 primaryResidentDevice];

          id v27 = [v10 lastPrimaryResidentDestinationUUID];
          __int16 v28 = [v26 identifier];
          char v29 = HMFEqualObjects();

          if ((v29 & 1) != 0 || ![v26 isReachable])
          {
            [v10 setMessageInFlight:0];
            os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
            [WeakRetained _discoverPrimaryResident];
          }
          else
          {
            uint64_t v30 = [v26 identifier];
            [v10 setLastPrimaryResidentDestinationUUID:v30];

            uint64_t v39 = [v10 completionHandler];
            [v10 setCompletionHandler:0];
            os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
            context = (void *)MEMORY[0x230FBD990]();
            id v31 = WeakRetained;
            v32 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              id v33 = HMFGetLogIdentifier();
              v34 = [v10 message];
              v35 = [v34 identifier];
              *(_DWORD *)buf = 138543618;
              v42 = v33;
              __int16 v43 = 2114;
              id v44 = v35;
              _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@Retrying message %{public}@ since the primary resident has changed since the last message", buf, 0x16u);
            }
            v36 = [v10 message];
            [v31 _sendMessage:v36 toPrimaryResidentDevice:v26 completionHandler:v39];
          }
          goto LABEL_21;
        }
        id v12 = *((id *)WeakRetained + 9);

        id v40 = v12;
      }
      id v13 = *((id *)WeakRetained + 8);
      [v13 removeObjectForKey:*(void *)(a1 + 32)];

      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
      id v14 = *((id *)WeakRetained + 7);
      id v15 = [v10 messageTimerContext];
      [v14 cancelTimerForContext:v15];

      uint64_t v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = WeakRetained;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        int v19 = HMFGetLogIdentifier();
        uint64_t v20 = [v10 message];
        __int16 v21 = [v20 identifier];
        *(_DWORD *)buf = 138544130;
        v42 = v19;
        __int16 v43 = 2114;
        id v44 = v21;
        __int16 v45 = 2112;
        id v46 = v6;
        __int16 v47 = 2112;
        id v48 = v40;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Responding to message %{public}@ with payload: %@, error: %@", buf, 0x2Au);
      }
      int v22 = [v10 message];
      [v22 respondWithPayload:v6 error:v40];

      uint64_t v23 = [v10 completionHandler];
      v24 = (void *)v23;
      if (v23) {
        (*(void (**)(uint64_t, id))(v23 + 16))(v23, v40);
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
    }
LABEL_21:
  }
}

- (void)_sendMessage:(id)a3 toPrimaryResidentDevice:(id)a4 completionHandler:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 device];
  id v12 = [HMDRemoteDeviceMessageDestination alloc];
  id v13 = [v8 destination];
  id v14 = [v13 target];
  id v15 = v12;
  uint64_t v16 = (void *)v11;
  id v17 = [(HMDRemoteDeviceMessageDestination *)v15 initWithTarget:v14 device:v11];

  id v18 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v19 = v18;
  }
  else {
    int v19 = 0;
  }
  id v20 = v19;

  if (v20)
  {
    __int16 v21 = (void *)[v20 copyWithDestination:v17];
  }
  else
  {
    __int16 v21 = (void *)[v18 mutableCopy];
    int v22 = [v18 identifier];
    [v21 setIdentifier:v22];

    [v21 setDestination:v17];
  }
  if ([v18 isRequestType])
  {
    uint64_t v23 = [(HMDHomePrimaryResidentMessagingHandler *)self _responseHandlerForRequestMessage:v18];
    [v21 setResponseHandler:v23];
  }
  v24 = (void *)MEMORY[0x230FBD990]();
  id v25 = self;
  int v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v27 = v36 = v9;
    [v21 identifier];
    __int16 v28 = v35 = v10;
    [v16 shortDescription];
    v34 = v24;
    id v29 = v20;
    uint64_t v30 = v17;
    v32 = id v31 = v16;
    *(_DWORD *)buf = 138543874;
    uint64_t v38 = v27;
    __int16 v39 = 2114;
    id v40 = v28;
    __int16 v41 = 2114;
    v42 = v32;
    _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Sending message %{public}@ to device %{public}@", buf, 0x20u);

    uint64_t v16 = v31;
    id v17 = v30;
    id v20 = v29;
    v24 = v34;

    id v10 = v35;
    id v9 = v36;
  }

  if (v25) {
    messageDispatcher = v25->_messageDispatcher;
  }
  else {
    messageDispatcher = 0;
  }
  [(HMFMessageDispatcher *)messageDispatcher sendMessage:v21 completionHandler:v10];
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 destination];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    uint64_t v11 = [v10 queueTimeout];
    [v11 doubleValue];
    double v13 = v12;

    id v14 = [v10 queueTimeout];
    BOOL v16 = v13 >= 2.22044605e-16 || v14 == 0;
    BOOL v65 = v16;

    os_unfair_lock_lock_with_options();
    if (self) {
      residentDeviceManager = self->_residentDeviceManager;
    }
    else {
      residentDeviceManager = 0;
    }
    id v18 = residentDeviceManager;
    int v19 = [(HMDResidentDeviceManager *)v18 primaryResidentDevice];

    if (self) {
      lastPrimaryResidentDiscoveryError = self->_lastPrimaryResidentDiscoveryError;
    }
    else {
      lastPrimaryResidentDiscoveryError = 0;
    }
    v67 = lastPrimaryResidentDiscoveryError;
    if (v19) {
      unsigned int v63 = [v19 isReachable] ^ 1;
    }
    else {
      unsigned int v63 = 0;
    }
    if ([v19 isCurrentDevice])
    {
      if (self) {
        destinationIsCurrentDeviceError = self->_destinationIsCurrentDeviceError;
      }
      else {
        destinationIsCurrentDeviceError = 0;
      }
      id v25 = destinationIsCurrentDeviceError;
      os_unfair_lock_unlock(&self->_lock);
      if (v25)
      {
        int v26 = (void *)MEMORY[0x230FBD990]();
        id v27 = self;
        __int16 v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          id v29 = HMFGetLogIdentifier();
          uint64_t v30 = [v6 identifier];
          *(_DWORD *)buf = 138543874;
          id v69 = v29;
          __int16 v70 = 2114;
          uint64_t v71 = v30;
          __int16 v72 = 2112;
          uint64_t v73 = v25;
          _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Cannot send message %{public}@ due to error: %@", buf, 0x20u);
        }
        [v6 respondWithError:v25];
        goto LABEL_70;
      }
    }
    else
    {
      if (v19) {
        int v66 = [v19 isReachable];
      }
      else {
        int v66 = 0;
      }
      int v31 = [v6 isRequestType];
      v32 = [v10 queueTimeout];
      BOOL v34 = v13 <= 2.22044605e-16 || v32 == 0;

      [v6 timeout];
      BOOL v36 = v65;
      if (v66) {
        BOOL v36 = v31;
      }
      if (v36)
      {
        if ((v34 | v31))
        {
          if (v35 <= 2.22044605e-16)
          {
            double v38 = 60.0;
          }
          else
          {
            [v6 timeout];
            double v38 = v37;
          }
        }
        else
        {
          double v38 = v13;
          if (v35 > 2.22044605e-16)
          {
            [v6 timeout];
            if (v39 >= v13) {
              double v38 = v13;
            }
            else {
              double v38 = v39;
            }
          }
        }
        if (self) {
          timerManager = self->_timerManager;
        }
        else {
          timerManager = 0;
        }
        __int16 v41 = timerManager;
        v42 = [v6 identifier];
        uint64_t v62 = [(HMFTimerManager *)v41 startTimerWithTimeInterval:v42 object:v38];

        v64 = [[HMDHomePrimaryResidentMessagingHandlerPendingMessageContext alloc] initWithMessage:v6 messageTimerContext:v62];
        if (((v34 | v66) & 1) == 0 && ((v31 ^ 1) & 1) == 0)
        {
          if (self) {
            uint64_t v43 = self->_timerManager;
          }
          else {
            uint64_t v43 = 0;
          }
          id v44 = v43;
          __int16 v45 = [v6 identifier];
          id v46 = [(HMFTimerManager *)v44 startTimerWithTimeInterval:v45 object:v13];
          [(HMDHomePrimaryResidentMessagingHandlerPendingMessageContext *)v64 setQueueTimerContext:v46];
        }
        if (v66)
        {
          [(HMDHomePrimaryResidentMessagingHandlerPendingMessageContext *)v64 setMessageInFlight:1];
          __int16 v47 = [v19 identifier];
          [(HMDHomePrimaryResidentMessagingHandlerPendingMessageContext *)v64 setLastPrimaryResidentDestinationUUID:v47];
        }
        else
        {
          uint64_t v48 = [(HMDHomePrimaryResidentMessagingHandlerPendingMessageContext *)v64 setCompletionHandler:v7];
        }
        uint64_t v49 = (void *)MEMORY[0x230FBD990](v48);
        uint64_t v50 = self;
        HMFGetOSLogHandle();
        v51 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          uint64_t v61 = v49;
          HMFGetLogIdentifier();
          id v52 = (id)objc_claimAutoreleasedReturnValue();
          v53 = [v6 identifier];
          *(_DWORD *)buf = 138543618;
          id v69 = v52;
          __int16 v70 = 2114;
          uint64_t v71 = v53;
          _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_INFO, "%{public}@Enqueueing message %{public}@", buf, 0x16u);

          uint64_t v49 = v61;
        }

        if (self) {
          pendingMessages = v50->_pendingMessages;
        }
        else {
          pendingMessages = 0;
        }
        v55 = pendingMessages;
        v56 = [v6 identifier];
        [(NSMapTable *)v55 setObject:v64 forKey:v56];
      }
      os_unfair_lock_unlock(&self->_lock);
      if (v66)
      {
        [(HMDHomePrimaryResidentMessagingHandler *)self _sendMessage:v6 toPrimaryResidentDevice:v19 completionHandler:v7];
LABEL_69:
        id v25 = 0;
LABEL_70:

        goto LABEL_71;
      }
    }
    [(HMDHomePrimaryResidentMessagingHandler *)self _discoverPrimaryResident];
    if (!v65)
    {
      v57 = [(HMDHomePrimaryResidentMessagingHandler *)self _errorForNoDiscoveredPrimaryResidentWithLastPrimaryResidentDiscoveryError:v67 primaryIsKnownButUnreachable:v63];
      v58 = [MEMORY[0x263F087E8] hmErrorWithCode:8 description:0 reason:0 suggestion:0 underlyingError:v57];
      [v6 respondWithError:v58];
      uint64_t v59 = _Block_copy(v7);
      id v60 = v59;
      if (v59) {
        (*((void (**)(void *, void *))v59 + 2))(v59, v58);
      }
    }
    goto LABEL_69;
  }
  __int16 v21 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
  [v6 respondWithError:v21];
  int v22 = _Block_copy(v7);
  uint64_t v23 = v22;
  if (v22) {
    (*((void (**)(void *, void *))v22 + 2))(v22, v21);
  }

LABEL_71:
}

- (HMDHomePrimaryResidentMessagingHandler)initWithMessageDispatcher:(id)a3 homeUUID:(id)a4 residentDeviceManager:(id)a5 dataSource:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v30.receiver = self;
  v30.super_class = (Class)HMDHomePrimaryResidentMessagingHandler;
  id v15 = [(HMDHomePrimaryResidentMessagingHandler *)&v30 init];
  BOOL v16 = v15;
  if (v15)
  {
    v15->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v15->_messageDispatcher, a3);
    objc_storeStrong((id *)&v16->_homeUUID, a4);
    objc_storeStrong((id *)&v16->_residentDeviceManager, a5);
    uint64_t v17 = [v14 notificationCenter];
    notificationCenter = v16->_notificationCenter;
    v16->_notificationCenter = (NSNotificationCenter *)v17;

    uint64_t v19 = [v14 timerManager];
    timerManager = v16->_timerManager;
    v16->_timerManager = (HMFTimerManager *)v19;

    [(HMFTimerManager *)v16->_timerManager setDelegate:v16];
    uint64_t v21 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    pendingMessages = v16->_pendingMessages;
    v16->_pendingMessages = (NSMapTable *)v21;

    uint64_t v23 = [MEMORY[0x263F087E8] hmErrorWithCode:23 description:@"Cannot send message because the current device is the primary resident" reason:@"Sending message to the current device is not supported" suggestion:0];
    destinationIsCurrentDeviceError = v16->_destinationIsCurrentDeviceError;
    v16->_destinationIsCurrentDeviceError = (NSError *)v23;

    uint64_t v25 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:3205 description:@"Cannot send message because the original primary is the same device as the newly discovered primary" reason:@"Sending a message to the same device multiple times is not supported" suggestion:0];
    repeatedDestinationError = v16->_repeatedDestinationError;
    v16->_repeatedDestinationError = (NSError *)v25;

    uint64_t v27 = [v12 UUIDString];
    logIdentifier = v16->_logIdentifier;
    v16->_logIdentifier = (NSString *)v27;

    [(NSNotificationCenter *)v16->_notificationCenter addObserver:v16 selector:sel_handlePrimaryResidentUpdated_ name:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" object:v13];
    [(NSNotificationCenter *)v16->_notificationCenter addObserver:v16 selector:sel_handleResidentUpdated_ name:@"HMDResidentDeviceManagerUpdateResidentNotification" object:v13];
  }

  return v16;
}

- (HMDHomePrimaryResidentMessagingHandler)initWithMessageDispatcher:(id)a3 homeUUID:(id)a4 residentDeviceManager:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(HMDHomePrimaryResidentMessagingHandlerDefaultDataSource);
  id v12 = [(HMDHomePrimaryResidentMessagingHandler *)self initWithMessageDispatcher:v10 homeUUID:v9 residentDeviceManager:v8 dataSource:v11];

  return v12;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t41 != -1) {
    dispatch_once(&logCategory__hmf_once_t41, &__block_literal_global_4241);
  }
  v2 = (void *)logCategory__hmf_once_v42;
  return v2;
}

void __53__HMDHomePrimaryResidentMessagingHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v42;
  logCategory__hmf_once_v42 = v0;
}

@end