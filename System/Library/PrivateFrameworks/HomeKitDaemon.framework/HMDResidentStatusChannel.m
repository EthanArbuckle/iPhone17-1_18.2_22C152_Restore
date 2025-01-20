@interface HMDResidentStatusChannel
+ (id)logCategory;
- (BOOL)_shouldDebounce:(int64_t)a3;
- (BOOL)isConnected;
- (BOOL)receivedInitialChannelState;
- (BOOL)started;
- (HMDHome)home;
- (HMDResidentStatus)currentPrimaryResident;
- (HMDResidentStatusChannel)initWithHome:(id)a3 queue:(id)a4;
- (HMDResidentStatusChannel)initWithHome:(id)a3 queue:(id)a4 notificationCenter:(id)a5 timerProvider:(id)a6 channelProvider:(id)a7 logEventSubmitter:(id)a8;
- (HMDResidentStatusChannelManager)manager;
- (HMDStatusChannel)channel;
- (HMDStatusChannelProvider)channelProvider;
- (HMDTimerProvider)timerProvider;
- (HMFFuture)initialConnectedToStatusKitFuture;
- (HMFPromise)initialConnectedToStatusKitPromise;
- (HMFTimer)debounceTimer;
- (HMFTimer)inviteRetryTimer;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSHashTable)observers;
- (NSMutableDictionary)residentStatusMap;
- (NSNotificationCenter)notificationCenter;
- (NSSet)presentResidentStatuses;
- (id)dumpState;
- (id)logIdentifier;
- (void)_handleHomeUserAddedNotification:(id)a3;
- (void)_handleHomeUserRemovedNotification:(id)a3;
- (void)_inviteSharedUsers;
- (void)_publishResidentStatus:(id)a3 reason:(int64_t)a4;
- (void)_startDebounceTimer;
- (void)_stopDebounceTimer;
- (void)_stopPublishingAsResident;
- (void)addObserver:(id)a3;
- (void)channel:(id)a3 didObserveConnectionChange:(BOOL)a4;
- (void)channel:(id)a3 didObserveRecordUpdate:(id)a4;
- (void)publishResidentStatus:(id)a3 reason:(int64_t)a4;
- (void)removeObserver:(id)a3;
- (void)setConnected:(BOOL)a3;
- (void)setDebounceTimer:(id)a3;
- (void)setInviteRetryTimer:(id)a3;
- (void)setManager:(id)a3;
- (void)setReceivedInitialChannelState:(BOOL)a3;
- (void)setStarted:(BOOL)a3;
- (void)start;
- (void)stop;
- (void)stopPublishingAsResident;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDResidentStatusChannel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialConnectedToStatusKitPromise, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_inviteRetryTimer, 0);
  objc_storeStrong((id *)&self->_debounceTimer, 0);
  objc_storeStrong((id *)&self->_channelProvider, 0);
  objc_storeStrong((id *)&self->_timerProvider, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_residentStatusMap, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_initialConnectedToStatusKitFuture, 0);
  objc_destroyWeak((id *)&self->_manager);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_currentPrimaryResident, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setReceivedInitialChannelState:(BOOL)a3
{
  self->_receivedInitialChannelState = a3;
}

- (BOOL)receivedInitialChannelState
{
  return self->_receivedInitialChannelState;
}

- (HMFPromise)initialConnectedToStatusKitPromise
{
  return self->_initialConnectedToStatusKitPromise;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (void)setInviteRetryTimer:(id)a3
{
}

- (HMFTimer)inviteRetryTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDebounceTimer:(id)a3
{
}

- (HMFTimer)debounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 112, 1);
}

- (HMDStatusChannelProvider)channelProvider
{
  return self->_channelProvider;
}

- (HMDTimerProvider)timerProvider
{
  return self->_timerProvider;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (NSMutableDictionary)residentStatusMap
{
  return self->_residentStatusMap;
}

- (HMDStatusChannel)channel
{
  return self->_channel;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (HMFFuture)initialConnectedToStatusKitFuture
{
  return self->_initialConnectedToStatusKitFuture;
}

- (void)setManager:(id)a3
{
}

- (HMDResidentStatusChannelManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  return (HMDResidentStatusChannelManager *)WeakRetained;
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDResidentStatusChannel *)self home];
  v3 = [v2 uuid];
  v4 = [v3 UUIDString];

  return v4;
}

- (void)_inviteSharedUsers
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [(HMDResidentStatusChannel *)self home];
  if ([v3 isOwnerUser])
  {
    v4 = [v3 usersIncludingPendingUsers:1];
    v5 = (void *)MEMORY[0x230FBD990]();
    v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v15 = v8;
      __int16 v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Setting invited users to: %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, v6);
    v9 = [(HMDResidentStatusChannel *)v6 channel];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __46__HMDResidentStatusChannel__inviteSharedUsers__block_invoke;
    v11[3] = &unk_264A2CB70;
    objc_copyWeak(&v13, (id *)buf);
    id v10 = v4;
    id v12 = v10;
    [v9 setInvitedUsers:v10 withCompletion:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
}

void __46__HMDResidentStatusChannel__inviteSharedUsers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = WeakRetained;
  v7 = HMFGetOSLogHandle();
  v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      uint64_t v10 = *(void *)(a1 + 32);
      int v19 = 138543618;
      v20 = v9;
      __int16 v21 = 2112;
      uint64_t v22 = v10;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to set users %@", (uint8_t *)&v19, 0x16u);
    }
    v11 = [v6 timerProvider];
    id v12 = [v11 timerWithTimeInterval:0 options:3600.0];
    [v6 setInviteRetryTimer:v12];

    id v13 = [v6 inviteRetryTimer];
    [v13 setDelegate:v6];

    uint64_t v14 = v6[1];
    v15 = [v6 inviteRetryTimer];
    [v15 setDelegateQueue:v14];

    __int16 v16 = [v6 inviteRetryTimer];
    [v16 resume];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v17 = HMFGetLogIdentifier();
      uint64_t v18 = *(void *)(a1 + 32);
      int v19 = 138543618;
      v20 = v17;
      __int16 v21 = 2112;
      uint64_t v22 = v18;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Successfully set invited users %@", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (void)_stopDebounceTimer
{
  id v3 = [(HMDResidentStatusChannel *)self debounceTimer];

  if (v3)
  {
    v4 = [(HMDResidentStatusChannel *)self debounceTimer];
    [v4 suspend];

    [(HMDResidentStatusChannel *)self setDebounceTimer:0];
  }
}

- (void)_startDebounceTimer
{
  id v3 = [(HMDResidentStatusChannel *)self debounceTimer];

  if (!v3)
  {
    v4 = [(HMDResidentStatusChannel *)self timerProvider];
    v5 = [v4 timerWithTimeInterval:0 options:120.0];
    [(HMDResidentStatusChannel *)self setDebounceTimer:v5];

    v6 = [(HMDResidentStatusChannel *)self debounceTimer];
    [v6 setDelegate:self];

    queue = self->_queue;
    v8 = [(HMDResidentStatusChannel *)self debounceTimer];
    [v8 setDelegateQueue:queue];

    id v9 = [(HMDResidentStatusChannel *)self debounceTimer];
    [v9 resume];
  }
}

- (void)timerDidFire:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(HMDResidentStatusChannel *)self debounceTimer];

  if (v5 == v4)
  {
    [(HMDResidentStatusChannel *)self _stopDebounceTimer];
    v7 = [(HMDResidentStatusChannel *)self channel];
    char v8 = [v7 isConnected];

    if ((v8 & 1) == 0)
    {
      id v9 = (void *)MEMORY[0x230FBD990]();
      uint64_t v10 = self;
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = HMFGetLogIdentifier();
        int v15 = 138543362;
        __int16 v16 = v12;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Status Channel still disconnected after debounce timer fired, resetting records", (uint8_t *)&v15, 0xCu);
      }
      [(HMDResidentStatusChannel *)v10 setConnected:0];
      id v13 = [(HMDResidentStatusChannel *)v10 channel];
      uint64_t v14 = [MEMORY[0x263EFFA08] set];
      [(HMDResidentStatusChannel *)v10 channel:v13 didObserveRecordUpdate:v14];
    }
  }
  else
  {
    id v6 = [(HMDResidentStatusChannel *)self inviteRetryTimer];

    if (v6 == v4)
    {
      [(HMDResidentStatusChannel *)self setInviteRetryTimer:0];
      [(HMDResidentStatusChannel *)self _inviteSharedUsers];
    }
  }
}

- (void)channel:(id)a3 didObserveConnectionChange:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = (void *)MEMORY[0x230FBD990]();
  char v8 = self;
  id v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v10)
    {
      v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      uint64_t v14 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Status Channel gained connectivity, stopping debounce timer", (uint8_t *)&v13, 0xCu);
    }
    [(HMDResidentStatusChannel *)v8 _stopDebounceTimer];
  }
  else
  {
    if (v10)
    {
      id v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      uint64_t v14 = v12;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Status Channel lost connectivity, starting debounce timer", (uint8_t *)&v13, 0xCu);
    }
    [(HMDResidentStatusChannel *)v8 _startDebounceTimer];
  }
}

- (void)channel:(id)a3 didObserveRecordUpdate:(id)a4
{
  uint64_t v121 = *MEMORY[0x263EF8340];
  id v95 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = (void *)MEMORY[0x230FBD990]();
  char v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v113 = v10;
    __int16 v114 = 2048;
    uint64_t v115 = [v6 count];
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Status channel updated records (%lu)", buf, 0x16u);
  }
  v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = v8;
  int v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v113 = v14;
    __int16 v114 = 2112;
    uint64_t v115 = (uint64_t)v6;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Status channel updated records: %@", buf, 0x16u);
  }
  v102 = [MEMORY[0x263EFF9C0] set];
  v100 = [MEMORY[0x263EFF9C0] set];
  uint64_t v15 = [(HMDResidentStatusChannel *)v12 residentStatusMap];
  __int16 v16 = [v15 allValues];
  v101 = (void *)[v16 mutableCopy];

  obuint64_t j = [MEMORY[0x263EFF9A0] dictionary];
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v17 = v6;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v107 objects:v120 count:16];
  v96 = v17;
  if (!v18)
  {

    goto LABEL_41;
  }
  uint64_t v19 = v18;
  v99 = 0;
  uint64_t v20 = *(void *)v108;
  do
  {
    for (uint64_t i = 0; i != v19; ++i)
    {
      if (*(void *)v108 != v20) {
        objc_enumerationMutation(v17);
      }
      uint64_t v22 = *(void *)(*((void *)&v107 + 1) + 8 * i);
      uint64_t v23 = [[HMDResidentStatus alloc] initWithChannelRecord:v22];
      v24 = v23;
      if (v23)
      {
        if ([(HMDResidentStatus *)v23 isPrimary])
        {
          if (v99)
          {
            uint64_t v25 = [(HMDResidentStatus *)v24 assertionTime];
            if (v25
              && (v26 = (void *)v25,
                  [(HMDResidentStatus *)v99 assertionTime],
                  v27 = objc_claimAutoreleasedReturnValue(),
                  v27,
                  v26,
                  v27))
            {
              v28 = [(HMDResidentStatus *)v24 assertionTime];
              v29 = [(HMDResidentStatus *)v99 assertionTime];
              uint64_t v30 = [v28 compare:v29];

              v31 = (void *)MEMORY[0x230FBD990]();
              v32 = v12;
              v33 = HMFGetOSLogHandle();
              BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
              if (v30 == 1)
              {
                if (v34)
                {
                  v35 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  v113 = v35;
                  __int16 v114 = 2112;
                  uint64_t v115 = (uint64_t)v24;
                  _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Found additional primary resident %@, using as primary because assertion time is newer", buf, 0x16u);
                }
                v36 = v24;

                v99 = v36;
              }
              else
              {
                if (v34)
                {
                  v49 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  v113 = v49;
                  __int16 v114 = 2112;
                  uint64_t v115 = (uint64_t)v24;
                  _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Found additional primary resident %@, ignoring because assertion time is older", buf, 0x16u);
                }
              }
              id v17 = v96;
            }
            else
            {
              v41 = (void *)MEMORY[0x230FBD990]();
              v42 = v12;
              v43 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                v44 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543874;
                v113 = v44;
                __int16 v114 = 2112;
                uint64_t v115 = (uint64_t)v24;
                __int16 v116 = 2112;
                uint64_t v117 = (uint64_t)v99;
                _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_ERROR, "%{public}@Unexpected nil assertion time, ignoring, %@, %@", buf, 0x20u);
              }
            }
          }
          else
          {
            v45 = (void *)MEMORY[0x230FBD990]();
            v46 = v12;
            v47 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
            {
              v48 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v113 = v48;
              __int16 v114 = 2112;
              uint64_t v115 = (uint64_t)v24;
              _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_INFO, "%{public}@Found primary resident %@", buf, 0x16u);
            }
            v99 = v24;
          }
        }
        v50 = [(HMDResidentStatusChannel *)v12 residentStatusMap];
        v51 = [(HMDResidentStatus *)v24 idsIdentifier];
        v37 = [v50 objectForKeyedSubscript:v51];

        v52 = v102;
        if (!v37 || (BOOL v53 = [(HMDResidentStatus *)v24 hasChangedFrom:v37], v52 = v100, v53)) {
          [v52 addObject:v24];
        }
        [v101 removeObject:v24];
        v54 = [(HMDResidentStatus *)v24 idsIdentifier];
        [obj setObject:v24 forKeyedSubscript:v54];
      }
      else
      {
        v37 = (void *)MEMORY[0x230FBD990]();
        v38 = v12;
        v39 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v40 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v113 = v40;
          __int16 v114 = 2112;
          uint64_t v115 = v22;
          _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to create status from record %@", buf, 0x16u);
        }
        id v17 = v96;
      }
    }
    uint64_t v19 = [v17 countByEnumeratingWithState:&v107 objects:v120 count:16];
  }
  while (v19);

  if (!v99)
  {
LABEL_41:
    v37 = [(HMDResidentStatusChannel *)v12 currentPrimaryResident];
    char v55 = 0;
    v99 = 0;
    v56 = 0;
    uint64_t v57 = 0;
    if (!v37) {
      goto LABEL_45;
    }
    goto LABEL_42;
  }
  char v55 = 1;
LABEL_42:
  v58 = [(HMDResidentStatusChannel *)v12 currentPrimaryResident];
  uint64_t v57 = [(HMDResidentStatus *)v99 isEqual:v58] ^ 1;

  if (v55)
  {
    uint64_t v59 = 1;
    goto LABEL_46;
  }
  v56 = v37;
LABEL_45:

  uint64_t v59 = 0;
LABEL_46:
  v60 = (void *)MEMORY[0x230FBD990]();
  v61 = v12;
  v62 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
  {
    v63 = HMFGetLogIdentifier();
    uint64_t v64 = [(HMDResidentStatusChannel *)v61 currentPrimaryResident];
    v65 = (void *)v64;
    v66 = @"NO";
    *(_DWORD *)buf = 138544130;
    v113 = v63;
    if (v57) {
      v66 = @"YES";
    }
    __int16 v114 = 2112;
    uint64_t v115 = (uint64_t)v99;
    __int16 v116 = 2112;
    uint64_t v117 = v64;
    __int16 v118 = 2112;
    v119 = v66;
    _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_INFO, "%{public}@Found primary resident = %@, current primary resident %@, will notify %@", buf, 0x2Au);
  }
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)&v61->_residentStatusMap, obj);
  objc_storeStrong((id *)&v61->_currentPrimaryResident, v99);
  os_unfair_lock_unlock(&v61->_lock);
  v67 = [(HMDResidentStatusChannel *)v61 channel];
  if ([v67 isConnected])
  {
    BOOL v68 = [(HMDResidentStatusChannel *)v61 isConnected];

    if (!v68)
    {
      [(HMDResidentStatusChannel *)v61 setConnected:1];
      [(HMDResidentStatusChannel *)v61 _stopDebounceTimer];
    }
  }
  else
  {
  }
  v69 = [(HMDResidentStatusChannel *)v61 home];
  if (![(HMDResidentStatusChannel *)v61 receivedInitialChannelState])
  {
    v70 = (void *)MEMORY[0x230FBD990]();
    v71 = v61;
    v72 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      v73 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v113 = v73;
      _os_log_impl(&dword_22F52A000, v72, OS_LOG_TYPE_DEFAULT, "%{public}@Received initial channel state", buf, 0xCu);
    }
    [(HMDResidentStatusChannel *)v71 setReceivedInitialChannelState:1];
    v74 = [(HMDResidentStatusChannel *)v71 initialConnectedToStatusKitPromise];
    [v74 fulfillWithNoValue];

    if ([v69 isOwnerUser]) {
      [(HMDResidentStatusChannel *)v71 _inviteSharedUsers];
    }
  }
  v75 = [HMDResidentStatusChannelObserveLogEvent alloc];
  v94 = v69;
  v76 = [v69 uuid];
  BOOL v77 = [v101 count] != 0;
  BOOL v78 = [v102 count] != 0;
  BOOL v79 = [v100 count] != 0;
  LOBYTE(v92) = [v96 count] != 0;
  uint64_t v80 = [(HMDResidentStatusChannelObserveLogEvent *)v75 initWithHomeUUID:v76 didLoseStatuses:v77 didAddStatuses:v78 didUpdateStatuses:v79 didFindPrimary:v59 didPrimaryChange:v57 isStatusesEmpty:v92];

  v81 = [(HMDResidentStatusChannel *)v61 logEventSubmitter];
  v93 = (void *)v80;
  [v81 submitLogEvent:v80];

  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  v82 = v61;
  v97 = [(HMDResidentStatusChannel *)v61 observers];
  uint64_t v83 = [v97 countByEnumeratingWithState:&v103 objects:v111 count:16];
  if (v83)
  {
    uint64_t v84 = v83;
    uint64_t v85 = *(void *)v104;
    do
    {
      for (uint64_t j = 0; j != v84; ++j)
      {
        if (*(void *)v104 != v85) {
          objc_enumerationMutation(v97);
        }
        v87 = *(void **)(*((void *)&v103 + 1) + 8 * j);
        if (objc_opt_respondsToSelector())
        {
          v88 = (void *)[v102 copy];
          uint64_t v89 = v57;
          v90 = (void *)[v101 copy];
          v91 = (void *)[v100 copy];
          [v87 channel:v82 didObserveDevicesAdded:v88 lost:v90 updated:v91];

          uint64_t v57 = v89;
        }
        if v57 && (objc_opt_respondsToSelector()) {
          [v87 channel:v82 didObservePrimaryResidentChange:v82->_currentPrimaryResident];
        }
      }
      uint64_t v84 = [v97 countByEnumeratingWithState:&v103 objects:v111 count:16];
    }
    while (v84);
  }
}

- (void)_handleHomeUserRemovedNotification:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__HMDResidentStatusChannel__handleHomeUserRemovedNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __63__HMDResidentStatusChannel__handleHomeUserRemovedNotification___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Handling home user removed notification: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 32) _inviteSharedUsers];
}

- (void)_handleHomeUserAddedNotification:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__HMDResidentStatusChannel__handleHomeUserAddedNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __61__HMDResidentStatusChannel__handleHomeUserAddedNotification___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Handling home user added notification: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 32) _inviteSharedUsers];
}

- (id)dumpState
{
  v2 = (void *)MEMORY[0x263EFF9A0];
  id v3 = [(HMDStatusChannel *)self->_channel dumpState];
  id v4 = [v2 dictionaryWithDictionary:v3];

  id v5 = (void *)[v4 copy];
  return v5;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__HMDResidentStatusChannel_removeObserver___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __43__HMDResidentStatusChannel_removeObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__HMDResidentStatusChannel_addObserver___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __40__HMDResidentStatusChannel_addObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (HMDResidentStatus)currentPrimaryResident
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_currentPrimaryResident;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSSet)presentResidentStatuses
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = objc_alloc(MEMORY[0x263EFFA08]);
  id v5 = [(HMDResidentStatusChannel *)self residentStatusMap];
  id v6 = [v5 allValues];
  v7 = (void *)[v4 initWithArray:v6];

  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v7;
}

- (void)_stopPublishingAsResident
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping publishing as resident", (uint8_t *)&v7, 0xCu);
  }
  [(HMDStatusChannel *)v4->_channel stopPublishing];
}

- (void)stopPublishingAsResident
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__HMDResidentStatusChannel_stopPublishingAsResident__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __52__HMDResidentStatusChannel_stopPublishingAsResident__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopPublishingAsResident];
}

- (void)_publishResidentStatus:(id)a3 reason:(int64_t)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    __int16 v10 = HMFGetLogIdentifier();
    if ((unint64_t)a4 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown reason: %lu", a4);
      uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v11 = off_264A1E5B8[a4];
    }
    *(_DWORD *)buf = 138543874;
    uint64_t v25 = v10;
    __int16 v26 = 2112;
    id v27 = v6;
    __int16 v28 = 2112;
    v29 = v11;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Publishing resident status: %@ with reason: %@", buf, 0x20u);
  }
  if (v8->_channel)
  {
    uint64_t v12 = [(HMDResidentStatusChannel *)v8 _shouldDebounce:a4];
    channel = v8->_channel;
    uint64_t v14 = [v6 channelRecordPayload];
    [(HMDStatusChannel *)channel publishRecordWithPayload:v14 shouldDebounce:v12];

    uint64_t v15 = [HMDResidentStatusChannelPublishLogEvent alloc];
    __int16 v16 = [(HMDResidentStatusChannel *)v8 home];
    id v17 = [v16 uuid];
    uint64_t v18 = [(HMDResidentStatusChannelPublishLogEvent *)v15 initWithHomeUUID:v17 publishReason:a4];

    uint64_t v19 = [(HMDResidentStatusChannel *)v8 logEventSubmitter];
    [v19 submitLogEvent:v18];
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x230FBD990]();
    __int16 v21 = v8;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v23;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Attempt to publish status before channel is started", buf, 0xCu);
    }
  }
}

- (BOOL)_shouldDebounce:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) != 2;
}

- (void)publishResidentStatus:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__HMDResidentStatusChannel_publishResidentStatus_reason___block_invoke;
  block[3] = &unk_264A2E458;
  block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __57__HMDResidentStatusChannel_publishResidentStatus_reason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _publishResidentStatus:*(void *)(a1 + 40) reason:*(void *)(a1 + 48)];
}

- (void)stop
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__HMDResidentStatusChannel_stop__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __32__HMDResidentStatusChannel_stop__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  char v2 = [*(id *)(a1 + 32) started];
  id v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v6)
    {
      int v7 = HMFGetLogIdentifier();
      int v18 = 138543362;
      uint64_t v19 = v7;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping ResidentStatusChannel", (uint8_t *)&v18, 0xCu);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 34) = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
    id v8 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 16);
    os_unfair_lock_lock_with_options();
    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v10 = *(void *)(a1 + 32);
    int64_t v11 = *(void **)(v10 + 72);
    *(void *)(v10 + 72) = v9;

    uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 24);
    *(void *)(*(void *)(a1 + 32) + 24) = 0;

    os_unfair_lock_unlock(v8);
    int v13 = [*(id *)(a1 + 32) home];
    if ([v13 isOwnerUser])
    {
      uint64_t v14 = [*(id *)(a1 + 32) notificationCenter];
      [v14 removeObserver:*(void *)(a1 + 32) name:@"HMDHomeUserAddedNotification" object:v13];

      uint64_t v15 = [*(id *)(a1 + 32) notificationCenter];
      [v15 removeObserver:*(void *)(a1 + 32) name:@"HMDHomeUserRemovedNotification" object:v13];
    }
    __int16 v16 = [*(id *)(a1 + 32) channel];
    [v16 stop];
  }
  else
  {
    if (v6)
    {
      id v17 = HMFGetLogIdentifier();
      int v18 = 138543362;
      uint64_t v19 = v17;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@ResidentStatusChannel already stopped", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (void)start
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__HMDResidentStatusChannel_start__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __33__HMDResidentStatusChannel_start__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) started];
  id v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v6)
    {
      int v7 = HMFGetLogIdentifier();
      int v13 = 138543362;
      uint64_t v14 = v7;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@ResidentStatusChannel already started", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    if (v6)
    {
      id v8 = HMFGetLogIdentifier();
      int v13 = 138543362;
      uint64_t v14 = v8;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting ResidentStatusChannel", (uint8_t *)&v13, 0xCu);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 34) = 1;
    *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
    uint64_t v9 = [*(id *)(a1 + 32) channel];
    [v9 start];

    uint64_t v10 = [*(id *)(a1 + 32) home];
    if ([v10 isOwnerUser])
    {
      int64_t v11 = [*(id *)(a1 + 32) notificationCenter];
      [v11 addObserver:*(void *)(a1 + 32) selector:sel__handleHomeUserAddedNotification_ name:@"HMDHomeUserAddedNotification" object:v10];

      uint64_t v12 = [*(id *)(a1 + 32) notificationCenter];
      [v12 addObserver:*(void *)(a1 + 32) selector:sel__handleHomeUserRemovedNotification_ name:@"HMDHomeUserRemovedNotification" object:v10];
    }
  }
}

- (HMDResidentStatusChannel)initWithHome:(id)a3 queue:(id)a4
{
  BOOL v6 = (void *)MEMORY[0x263F08A00];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 defaultCenter];
  uint64_t v10 = objc_opt_new();
  int64_t v11 = objc_opt_new();
  uint64_t v12 = +[HMDMetricsManager sharedLogEventSubmitter];
  int v13 = [(HMDResidentStatusChannel *)self initWithHome:v8 queue:v7 notificationCenter:v9 timerProvider:v10 channelProvider:v11 logEventSubmitter:v12];

  return v13;
}

- (HMDResidentStatusChannel)initWithHome:(id)a3 queue:(id)a4 notificationCenter:(id)a5 timerProvider:(id)a6 channelProvider:(id)a7 logEventSubmitter:(id)a8
{
  id v14 = a3;
  id v32 = a4;
  id v31 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v34.receiver = self;
  v34.super_class = (Class)HMDResidentStatusChannel;
  int v18 = [(HMDResidentStatusChannel *)&v34 init];
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_home, v14);
    objc_storeStrong((id *)&v19->_queue, a4);
    v19->_lock._os_unfair_lock_opaque = 0;
    uint64_t v20 = [MEMORY[0x263EFF9A0] dictionary];
    residentStatusMap = v19->_residentStatusMap;
    v19->_residentStatusMap = (NSMutableDictionary *)v20;

    objc_storeStrong((id *)&v19->_notificationCenter, a5);
    uint64_t v22 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v19->_observers;
    v19->_observers = (NSHashTable *)v22;

    objc_storeStrong((id *)&v19->_timerProvider, a6);
    objc_storeStrong((id *)&v19->_channelProvider, a7);
    objc_storeStrong((id *)&v19->_logEventSubmitter, a8);
    v24 = [v14 uuid];
    uint64_t v25 = [v24 UUIDString];
    uint64_t v26 = [v16 createStatusChannelWithPrefix:@"HomeKitResidentStatus" identifier:v25 queue:v19->_queue];
    channel = v19->_channel;
    v19->_channel = (HMDStatusChannel *)v26;

    [(HMDStatusChannel *)v19->_channel addDelegate:v19];
    v19->_started = 0;
    obuint64_t j = 0;
    uint64_t v28 = [MEMORY[0x263F42538] futureWithPromise:&obj];
    initialConnectedToStatusKitFuture = v19->_initialConnectedToStatusKitFuture;
    v19->_initialConnectedToStatusKitFuture = (HMFFuture *)v28;

    objc_storeStrong((id *)&v19->_initialConnectedToStatusKitPromise, obj);
    v19->_receivedInitialChannelState = 0;
  }
  return v19;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t31_102570 != -1) {
    dispatch_once(&logCategory__hmf_once_t31_102570, &__block_literal_global_192);
  }
  int v2 = (void *)logCategory__hmf_once_v32_102571;
  return v2;
}

void __39__HMDResidentStatusChannel_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v32_102571;
  logCategory__hmf_once_v32_102571 = v0;
}

@end