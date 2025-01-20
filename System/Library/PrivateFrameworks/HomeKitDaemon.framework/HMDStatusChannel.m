@interface HMDStatusChannel
+ (id)logCategory;
- (BOOL)initialStatusKitCloudKitImportOccurred;
- (BOOL)isConnected;
- (BOOL)receivedInitialChannelState;
- (BOOL)started;
- (BOOL)subscribed;
- (HMDAppleAccountManager)appleAccountManager;
- (HMDSKPresence)presenceChannel;
- (HMDSKPresenceProvider)presenceProvider;
- (HMDStatusChannel)initWithChannelPrefix:(id)a3 identifier:(id)a4 queue:(id)a5;
- (HMDStatusChannel)initWithChannelPrefix:(id)a3 identifier:(id)a4 queue:(id)a5 netMonitor:(id)a6 timerProvider:(id)a7 presenceProvider:(id)a8 logEventSubmitter:(id)a9 appleAccountManager:(id)a10;
- (HMDTimerProvider)timerProvider;
- (HMFNetMonitor)netMonitor;
- (HMFTimer)assertionLogTimer;
- (HMFTimer)initialStatusKitCloudKitImportTimer;
- (HMFTimer)postRegainNetworkConnectivityTimer;
- (HMFTimer)publishDebounceTimer;
- (HMFTimer)publishRetryTimer;
- (HMFTimer)stopPublishRetryTimer;
- (HMFTimer)subscribeRetryTimer;
- (HMFTimer)unsubscribeRetryTimer;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSDate)lastConnectivityChangeTimestamp;
- (NSDate)lastObserveTimestamp;
- (NSDate)lastPublishTimestamp;
- (NSDate)lastStopPublishTimestamp;
- (NSDictionary)localPayload;
- (NSHashTable)statusDelegates;
- (NSNumber)lastObserveDeviceCount;
- (NSSet)currentRecords;
- (NSString)channelIdentifier;
- (NSString)channelName;
- (NSString)channelPrefix;
- (id)_createBackoffTimerWithMinimumTimeInterval:(double)a3 maximumTimeInterval:(double)a4;
- (id)_createTimerWithTimeout:(double)a3;
- (id)_recordsFromPresence:(id)a3;
- (id)_skHandlesFromUserIDs:(id)a3;
- (id)_skHandlesFromUsers:(id)a3;
- (id)_urisFromSKHandles:(id)a3;
- (id)dumpState;
- (id)invitedURIs;
- (id)presencePayload;
- (void)_addDelegate:(id)a3;
- (void)_assertPresenceWithIsRetry:(BOOL)a3;
- (void)_checkForInitialStatusKitCloudKitImportAndSubscribe;
- (void)_deassertPresenceWithIsRetry:(BOOL)a3;
- (void)_handleAssertionLogTimerFired;
- (void)_handlePresentDevicesChangedForPresence:(id)a3;
- (void)_informNetworkChange:(BOOL)a3;
- (void)_publishRecordWithPayload:(id)a3 shouldDebounce:(BOOL)a4;
- (void)_requestPublishShouldDebounce:(BOOL)a3;
- (void)_setInvitedUsers:(id)a3 withCompletion:(id)a4;
- (void)_startAssertionLogTimer;
- (void)_stopAssertionLogTimer;
- (void)_stopPostRegainNetworkConnectivityTimer;
- (void)_stopPublishing;
- (void)_subscribeToStatusKitWithIsRetry:(BOOL)a3;
- (void)_unsubscribeFromStatusKitWithIsRetry:(BOOL)a3;
- (void)addDelegate:(id)a3;
- (void)dealloc;
- (void)initialCloudKitImportReceived:(id)a3;
- (void)networkMonitorIsReachable:(id)a3;
- (void)networkMonitorIsUnreachable:(id)a3;
- (void)presentDevicesChangedForPresence:(id)a3;
- (void)publishRecordWithPayload:(id)a3 shouldDebounce:(BOOL)a4;
- (void)setAssertionLogTimer:(id)a3;
- (void)setInitialStatusKitCloudKitImportOccurred:(BOOL)a3;
- (void)setInitialStatusKitCloudKitImportTimer:(id)a3;
- (void)setInvitedUsers:(id)a3 withCompletion:(id)a4;
- (void)setLastConnectivityChangeTimestamp:(id)a3;
- (void)setLastObserveDeviceCount:(id)a3;
- (void)setLastObserveTimestamp:(id)a3;
- (void)setLastPublishTimestamp:(id)a3;
- (void)setLastStopPublishTimestamp:(id)a3;
- (void)setPostRegainNetworkConnectivityTimer:(id)a3;
- (void)setPublishDebounceTimer:(id)a3;
- (void)setPublishRetryTimer:(id)a3;
- (void)setReceivedInitialChannelState:(BOOL)a3;
- (void)setStarted:(BOOL)a3;
- (void)setStopPublishRetryTimer:(id)a3;
- (void)setSubscribeRetryTimer:(id)a3;
- (void)setSubscribed:(BOOL)a3;
- (void)setUnsubscribeRetryTimer:(id)a3;
- (void)start;
- (void)stop;
- (void)stopPublishing;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDStatusChannel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastConnectivityChangeTimestamp, 0);
  objc_storeStrong((id *)&self->_lastStopPublishTimestamp, 0);
  objc_storeStrong((id *)&self->_lastPublishTimestamp, 0);
  objc_storeStrong((id *)&self->_lastObserveDeviceCount, 0);
  objc_storeStrong((id *)&self->_lastObserveTimestamp, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_assertionLogTimer, 0);
  objc_storeStrong((id *)&self->_postRegainNetworkConnectivityTimer, 0);
  objc_storeStrong((id *)&self->_initialStatusKitCloudKitImportTimer, 0);
  objc_storeStrong((id *)&self->_publishDebounceTimer, 0);
  objc_storeStrong((id *)&self->_stopPublishRetryTimer, 0);
  objc_storeStrong((id *)&self->_publishRetryTimer, 0);
  objc_storeStrong((id *)&self->_unsubscribeRetryTimer, 0);
  objc_storeStrong((id *)&self->_subscribeRetryTimer, 0);
  objc_storeStrong((id *)&self->_presenceProvider, 0);
  objc_storeStrong((id *)&self->_timerProvider, 0);
  objc_storeStrong((id *)&self->_appleAccountManager, 0);
  objc_storeStrong((id *)&self->_netMonitor, 0);
  objc_storeStrong((id *)&self->_statusDelegates, 0);
  objc_storeStrong((id *)&self->_channelIdentifier, 0);
  objc_storeStrong((id *)&self->_channelPrefix, 0);
  objc_storeStrong((id *)&self->_channelName, 0);
  objc_storeStrong((id *)&self->_presenceChannel, 0);
  objc_storeStrong((id *)&self->_localPayload, 0);
  objc_storeStrong((id *)&self->_currentRecords, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setLastConnectivityChangeTimestamp:(id)a3
{
}

- (NSDate)lastConnectivityChangeTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 216, 1);
}

- (void)setLastStopPublishTimestamp:(id)a3
{
}

- (NSDate)lastStopPublishTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 208, 1);
}

- (void)setLastPublishTimestamp:(id)a3
{
}

- (NSDate)lastPublishTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 200, 1);
}

- (void)setLastObserveDeviceCount:(id)a3
{
}

- (NSNumber)lastObserveDeviceCount
{
  return (NSNumber *)objc_getProperty(self, a2, 192, 1);
}

- (void)setLastObserveTimestamp:(id)a3
{
}

- (NSDate)lastObserveTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 184, 1);
}

- (void)setReceivedInitialChannelState:(BOOL)a3
{
  self->_receivedInitialChannelState = a3;
}

- (BOOL)receivedInitialChannelState
{
  return self->_receivedInitialChannelState;
}

- (void)setSubscribed:(BOOL)a3
{
  self->_subscribed = a3;
}

- (BOOL)subscribed
{
  return self->_subscribed;
}

- (void)setInitialStatusKitCloudKitImportOccurred:(BOOL)a3
{
  self->_initialStatusKitCloudKitImportOccurred = a3;
}

- (BOOL)initialStatusKitCloudKitImportOccurred
{
  return self->_initialStatusKitCloudKitImportOccurred;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)started
{
  return self->_started;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (void)setAssertionLogTimer:(id)a3
{
}

- (HMFTimer)assertionLogTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 168, 1);
}

- (void)setPostRegainNetworkConnectivityTimer:(id)a3
{
}

- (HMFTimer)postRegainNetworkConnectivityTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 160, 1);
}

- (void)setInitialStatusKitCloudKitImportTimer:(id)a3
{
}

- (HMFTimer)initialStatusKitCloudKitImportTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 152, 1);
}

- (void)setPublishDebounceTimer:(id)a3
{
}

- (HMFTimer)publishDebounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 144, 1);
}

- (void)setStopPublishRetryTimer:(id)a3
{
}

- (HMFTimer)stopPublishRetryTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPublishRetryTimer:(id)a3
{
}

- (HMFTimer)publishRetryTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 128, 1);
}

- (void)setUnsubscribeRetryTimer:(id)a3
{
}

- (HMFTimer)unsubscribeRetryTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 120, 1);
}

- (void)setSubscribeRetryTimer:(id)a3
{
}

- (HMFTimer)subscribeRetryTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 112, 1);
}

- (HMDSKPresenceProvider)presenceProvider
{
  return self->_presenceProvider;
}

- (HMDTimerProvider)timerProvider
{
  return self->_timerProvider;
}

- (HMDAppleAccountManager)appleAccountManager
{
  return self->_appleAccountManager;
}

- (HMFNetMonitor)netMonitor
{
  return self->_netMonitor;
}

- (NSHashTable)statusDelegates
{
  return self->_statusDelegates;
}

- (NSString)channelIdentifier
{
  return self->_channelIdentifier;
}

- (NSString)channelPrefix
{
  return self->_channelPrefix;
}

- (NSString)channelName
{
  return self->_channelName;
}

- (HMDSKPresence)presenceChannel
{
  return self->_presenceChannel;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (NSDictionary)localPayload
{
  return self->_localPayload;
}

- (NSSet)currentRecords
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)_handleAssertionLogTimerFired
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  v3 = [(HMDStatusChannel *)self appleAccountManager];
  v4 = [v3 device];

  v5 = [v4 idsIdentifier];
  v6 = [(HMDStatusChannel *)self presenceChannel];
  v7 = [v6 presentDevices];

  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __49__HMDStatusChannel__handleAssertionLogTimerFired__block_invoke;
  v26[3] = &unk_264A174F8;
  id v8 = v5;
  id v27 = v8;
  objc_msgSend(v7, "na_any:", v26);
  v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v20 = HMFGetLogIdentifier();
    v22 = [(HMDStatusChannel *)v10 localPayload];
    HMFBooleanToString();
    v12 = id v23 = v8;
    [(HMDStatusChannel *)v10 lastPublishTimestamp];
    v13 = v24 = v9;
    [(HMDStatusChannel *)v10 lastStopPublishTimestamp];
    v14 = v25 = v4;
    uint64_t v15 = HMFBooleanToString();
    v21 = v7;
    uint64_t v16 = [v7 count];
    [(HMDStatusChannel *)v10 isConnected];
    v17 = HMFBooleanToString();
    v18 = [(HMDStatusChannel *)v10 lastConnectivityChangeTimestamp];
    *(_DWORD *)buf = 138545154;
    v29 = v20;
    __int16 v30 = 2112;
    v31 = v12;
    __int16 v32 = 2112;
    v33 = v13;
    __int16 v34 = 2112;
    v35 = v14;
    __int16 v36 = 2112;
    uint64_t v37 = v15;
    v19 = (void *)v15;
    __int16 v38 = 2048;
    uint64_t v39 = v16;
    v7 = v21;
    __int16 v40 = 2112;
    v41 = v17;
    __int16 v42 = 2112;
    v43 = v18;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Asserting: %@, last assertion: %@, last de-assertion: %@, assertion in channel: %@ (%lu), connected: %@, last connection change: %@", buf, 0x52u);

    v4 = v25;
    v9 = v24;

    id v8 = v23;
  }
}

uint64_t __49__HMDStatusChannel__handleAssertionLogTimerFired__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[HMDStatusChannelRecord alloc] initWithPresentDevice:v3];

  v5 = [(HMDStatusChannelRecord *)v4 idsIdentifier];
  uint64_t v6 = objc_msgSend(v5, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v6;
}

- (void)_stopAssertionLogTimer
{
  id v3 = [(HMDStatusChannel *)self assertionLogTimer];
  [v3 suspend];

  [(HMDStatusChannel *)self setAssertionLogTimer:0];
}

- (void)_startAssertionLogTimer
{
  id v3 = [(HMDStatusChannel *)self assertionLogTimer];

  if (!v3)
  {
    v4 = [(HMDStatusChannel *)self timerProvider];
    v5 = [v4 timerWithTimeInterval:4 options:600.0];
    [(HMDStatusChannel *)self setAssertionLogTimer:v5];

    uint64_t v6 = [(HMDStatusChannel *)self assertionLogTimer];
    [v6 setDelegate:self];

    queue = self->_queue;
    id v8 = [(HMDStatusChannel *)self assertionLogTimer];
    [v8 setDelegateQueue:queue];

    id v9 = [(HMDStatusChannel *)self assertionLogTimer];
    [v9 resume];
  }
}

- (id)_createBackoffTimerWithMinimumTimeInterval:(double)a3 maximumTimeInterval:(double)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v7 = [(HMDStatusChannel *)self timerProvider];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(HMDStatusChannel *)self timerProvider];
    v10 = [v9 backoffTimerWithMinimumTimeInterval:2 maximumTimeInterval:0 exponentialFactor:a3 options:a4];

    [v10 setDelegate:self];
    [v10 setDelegateQueue:self->_queue];
  }
  else
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v16 = 138543362;
      v17 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@The timerProvider does not implement backoff timer", (uint8_t *)&v16, 0xCu);
    }
    v10 = 0;
  }
  return v10;
}

- (id)_createTimerWithTimeout:(double)a3
{
  v5 = [(HMDStatusChannel *)self timerProvider];
  uint64_t v6 = [v5 timerWithTimeInterval:0 options:a3];

  [v6 setDelegate:self];
  [v6 setDelegateQueue:self->_queue];
  [v6 resume];
  return v6;
}

- (id)_urisFromSKHandles:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  v4 = objc_msgSend(a3, "na_map:", &__block_literal_global_124);
  v5 = [v3 setWithArray:v4];

  return v5;
}

uint64_t __39__HMDStatusChannel__urisFromSKHandles___block_invoke(uint64_t a1, void *a2)
{
  return [a2 handleString];
}

- (id)_skHandlesFromUserIDs:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_121);
}

id __42__HMDStatusChannel__skHandlesFromUserIDs___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F797B8];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithString:v3];

  return v4;
}

- (id)_skHandlesFromUsers:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_117);
}

id __40__HMDStatusChannel__skHandlesFromUsers___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F797B8];
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = [v3 userID];

  uint64_t v6 = (void *)[v4 initWithString:v5];
  return v6;
}

- (void)_setInvitedUsers:(id)a3 withCompletion:(id)a4
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id aBlock = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = [(HMDStatusChannel *)self presenceChannel];
  char v8 = [v7 invitedHandles];
  id v9 = [(HMDStatusChannel *)self _urisFromSKHandles:v8];

  v10 = [v9 allObjects];
  uint64_t v44 = (void *)[v10 mutableCopy];

  v11 = [MEMORY[0x263EFF980] array];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v54 objects:v62 count:16];
  v14 = self;
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v55 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        v19 = [v18 userID];
        char v20 = [v9 containsObject:v19];

        v21 = [v18 userID];
        if (v20) {
          [v44 removeObject:v21];
        }
        else {
          [v11 addObject:v21];
        }
        self = v14;
      }
      uint64_t v15 = [v12 countByEnumeratingWithState:&v54 objects:v62 count:16];
    }
    while (v15);
  }

  if ([v11 count] || objc_msgSend(v44, "count"))
  {
    __int16 v40 = [(HMDStatusChannel *)self _skHandlesFromUserIDs:v11];
    uint64_t v39 = [(HMDStatusChannel *)self _skHandlesFromUserIDs:v44];
    *(void *)buf = 0;
    id v53 = 0;
    uint64_t v22 = [MEMORY[0x263F42538] futureWithPromise:buf];
    uint64_t v23 = [MEMORY[0x263F42538] futureWithPromise:&v53];
    v24 = (void *)[objc_alloc(MEMORY[0x263F42520]) initWithQueue:self->_queue];
    v25 = (void *)MEMORY[0x263F42538];
    v41 = (void *)v23;
    __int16 v42 = (void *)v22;
    v58[0] = v22;
    v58[1] = v23;
    v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:2];
    id v27 = [v25 allSettled:v26];

    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __52__HMDStatusChannel__setInvitedUsers_withCompletion___block_invoke;
    v51[3] = &unk_264A17470;
    id v52 = aBlock;
    id v28 = (id)[v27 inContext:v24 then:v51];
    if ([v39 count])
    {
      v29 = [(HMDStatusChannel *)self presenceChannel];
      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = __52__HMDStatusChannel__setInvitedUsers_withCompletion___block_invoke_2;
      v48[3] = &unk_264A2E210;
      v48[4] = self;
      id v49 = v12;
      id v50 = *(id *)buf;
      [v29 removeInvitedHandles:v39 completion:v48];
    }
    else
    {
      [*(id *)buf fulfillWithNoValue];
    }
    __int16 v30 = v40;
    if ([v40 count])
    {
      v31 = [(HMDStatusChannel *)v14 presenceChannel];
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __52__HMDStatusChannel__setInvitedUsers_withCompletion___block_invoke_114;
      v45[3] = &unk_264A2E210;
      v45[4] = v14;
      id v46 = v12;
      id v47 = v53;
      [v31 inviteHandlesFromPrimaryAccountHandle:v40 completion:v45];
    }
    else
    {
      [v53 fulfillWithNoValue];
    }

    __int16 v32 = aBlock;
  }
  else
  {
    v33 = (void *)MEMORY[0x230FBD990]();
    __int16 v34 = self;
    v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      __int16 v36 = HMFGetLogIdentifier();
      uint64_t v37 = [(HMDStatusChannel *)v34 channelName];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v36;
      __int16 v60 = 2112;
      v61 = v37;
      _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@No users detected to add or remove from channel %@", buf, 0x16u);
    }
    __int16 v32 = aBlock;
    __int16 v38 = _Block_copy(aBlock);
    __int16 v30 = v38;
    if (v38) {
      (*((void (**)(void *, void))v38 + 2))(v38, 0);
    }
  }
}

uint64_t __52__HMDStatusChannel__setInvitedUsers_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32))
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v3;
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
          v10 = objc_msgSend(MEMORY[0x263EFF9D0], "null", (void)v13);
          char v11 = [v9 isEqual:v10];

          if ((v11 & 1) == 0)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }

  return 1;
}

void __52__HMDStatusChannel__setInvitedUsers_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [*(id *)(a1 + 32) channelName];
    int v14 = 138544130;
    long long v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    __int16 v18 = 2112;
    v19 = v9;
    __int16 v20 = 2112;
    id v21 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@remove users %@ from channel %@ complete with error %@", (uint8_t *)&v14, 0x2Au);
  }
  v10 = [HMDStatusChannelManagementLogEvent alloc];
  char v11 = [*(id *)(a1 + 32) channelPrefix];
  id v12 = [(HMDStatusChannelManagementLogEvent *)v10 initWithChannelPrefix:v11 isRetry:0 action:4];

  if (v3)
  {
    [(HMMLogEvent *)v12 setError:v3];
    [*(id *)(a1 + 48) rejectWithError:v3];
  }
  else
  {
    [*(id *)(a1 + 48) fulfillWithNoValue];
  }
  long long v13 = [*(id *)(a1 + 32) logEventSubmitter];
  [v13 submitLogEvent:v12];
}

void __52__HMDStatusChannel__setInvitedUsers_withCompletion___block_invoke_114(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [*(id *)(a1 + 32) channelName];
    int v14 = 138544130;
    long long v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    __int16 v18 = 2112;
    v19 = v9;
    __int16 v20 = 2112;
    id v21 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Add users %@ to channel %@ complete with error %@", (uint8_t *)&v14, 0x2Au);
  }
  v10 = [HMDStatusChannelManagementLogEvent alloc];
  char v11 = [*(id *)(a1 + 32) channelPrefix];
  id v12 = [(HMDStatusChannelManagementLogEvent *)v10 initWithChannelPrefix:v11 isRetry:0 action:3];

  if (v3)
  {
    [(HMMLogEvent *)v12 setError:v3];
    [*(id *)(a1 + 48) rejectWithError:v3];
  }
  else
  {
    [*(id *)(a1 + 48) fulfillWithNoValue];
  }
  long long v13 = [*(id *)(a1 + 32) logEventSubmitter];
  [v13 submitLogEvent:v12];
}

- (void)_addDelegate:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(HMDStatusChannel *)self statusDelegates];
  [v5 addObject:v4];

  if ([(HMDStatusChannel *)self subscribed])
  {
    if (self->_isConnected && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v6 = (void *)MEMORY[0x230FBD990]();
      uint64_t v7 = self;
      uint64_t v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = HMFGetLogIdentifier();
        v10 = HMFBooleanToString();
        int v16 = 138543618;
        uint64_t v17 = v9;
        __int16 v18 = 2112;
        v19 = v10;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Calling didObserveRecordUpdate on added delegate because isConnected: %@", (uint8_t *)&v16, 0x16u);
      }
      char v11 = [(HMDStatusChannel *)v7 currentRecords];
      [v4 channel:v7 didObserveRecordUpdate:v11];
    }
    if (objc_opt_respondsToSelector())
    {
      id v12 = (void *)MEMORY[0x230FBD990]();
      long long v13 = self;
      int v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        long long v15 = HMFGetLogIdentifier();
        int v16 = 138543362;
        uint64_t v17 = v15;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Calling didObserveConnectionChange on added delegate", (uint8_t *)&v16, 0xCu);
      }
      objc_msgSend(v4, "channel:didObserveConnectionChange:", v13, -[HMDStatusChannel isConnected](v13, "isConnected"));
    }
  }
}

- (void)_stopPostRegainNetworkConnectivityTimer
{
  id v3 = [(HMDStatusChannel *)self postRegainNetworkConnectivityTimer];
  [v3 suspend];

  [(HMDStatusChannel *)self setPostRegainNetworkConnectivityTimer:0];
}

- (void)_informNetworkChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    id v9 = (void *)v8;
    v10 = @"NO";
    if (v3) {
      v10 = @"YES";
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v23 = v8;
    __int16 v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Status Channel saw network connectivity change.  IsConnected: %@", buf, 0x16u);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  char v11 = [(HMDStatusChannel *)v6 statusDelegates];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        int v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
        if (objc_opt_respondsToSelector()) {
          [v16 channel:v6 didObserveConnectionChange:v3];
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

- (void)_unsubscribeFromStatusKitWithIsRetry:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    id v9 = HMFBooleanToString();
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    int v16 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Unsubscribing with isRetry: %@", buf, 0x16u);
  }
  v10 = [(HMDStatusChannel *)v6 presenceChannel];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __57__HMDStatusChannel__unsubscribeFromStatusKitWithIsRetry___block_invoke;
  v11[3] = &unk_264A1CB38;
  v11[4] = v6;
  BOOL v12 = a3;
  [v10 releaseTransientSubscriptionAssertionWithCompletion:v11];
}

void __57__HMDStatusChannel__unsubscribeFromStatusKitWithIsRetry___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__HMDStatusChannel__unsubscribeFromStatusKitWithIsRetry___block_invoke_2;
  block[3] = &unk_264A2DFC8;
  block[4] = v4;
  id v8 = v3;
  char v9 = *(unsigned char *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, block);
}

void __57__HMDStatusChannel__unsubscribeFromStatusKitWithIsRetry___block_invoke_2(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v26 = 138543618;
    id v27 = v5;
    __int16 v28 = 2112;
    uint64_t v29 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Presence channel unsubscribe completed with error %@", (uint8_t *)&v26, 0x16u);
  }
  uint64_t v7 = [HMDStatusChannelManagementLogEvent alloc];
  id v8 = [*(id *)(a1 + 32) channelPrefix];
  char v9 = [(HMDStatusChannelManagementLogEvent *)v7 initWithChannelPrefix:v8 isRetry:*(unsigned __int8 *)(a1 + 48) action:2];

  v10 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 40))
  {
    char v11 = [v10 logEventSubmitter];
    [v11 submitLogEvent:v9 error:*(void *)(a1 + 40)];

    BOOL v12 = [*(id *)(a1 + 32) unsubscribeRetryTimer];

    if (!v12)
    {
      uint64_t v13 = [*(id *)(a1 + 32) _createBackoffTimerWithMinimumTimeInterval:5.0 maximumTimeInterval:300.0];
      [*(id *)(a1 + 32) setUnsubscribeRetryTimer:v13];
    }
    uint64_t v14 = [*(id *)(a1 + 32) unsubscribeRetryTimer];
    [v14 resume];

    __int16 v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = *(id *)(a1 + 32);
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      long long v18 = HMFGetLogIdentifier();
      long long v19 = [*(id *)(a1 + 32) unsubscribeRetryTimer];
      long long v20 = [v19 fireDate];
      [v20 timeIntervalSinceNow];
      uint64_t v21 = *(void *)(a1 + 40);
      int v26 = 138543874;
      id v27 = v18;
      __int16 v28 = 2048;
      uint64_t v29 = v22;
      __int16 v30 = 2112;
      uint64_t v31 = v21;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to unsubscribe from status kit.  Will retry in %f seconds.  Error %@", (uint8_t *)&v26, 0x20u);
    }
  }
  else
  {
    uint64_t v23 = (void *)v10[5];
    v10[5] = 0;

    [*(id *)(a1 + 32) setSubscribed:0];
    __int16 v24 = [*(id *)(a1 + 32) unsubscribeRetryTimer];
    [v24 suspend];

    [*(id *)(a1 + 32) setUnsubscribeRetryTimer:0];
    v25 = [*(id *)(a1 + 32) logEventSubmitter];
    [v25 submitLogEvent:v9];
  }
}

- (void)_subscribeToStatusKitWithIsRetry:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)MEMORY[0x230FBD990]();
  uint64_t v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    char v9 = HMFBooleanToString();
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Subscribing with isRetry: %@", buf, 0x16u);
  }
  v10 = [(HMDStatusChannel *)v6 presenceChannel];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__HMDStatusChannel__subscribeToStatusKitWithIsRetry___block_invoke;
  v11[3] = &unk_264A1CB38;
  v11[4] = v6;
  BOOL v12 = a3;
  [v10 retainTransientSubscriptionAssertionWithCompletion:v11];
}

void __53__HMDStatusChannel__subscribeToStatusKitWithIsRetry___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__HMDStatusChannel__subscribeToStatusKitWithIsRetry___block_invoke_2;
  block[3] = &unk_264A2DFC8;
  block[4] = v4;
  id v8 = v3;
  char v9 = *(unsigned char *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, block);
}

void __53__HMDStatusChannel__subscribeToStatusKitWithIsRetry___block_invoke_2(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v30 = 138543618;
    uint64_t v31 = v5;
    __int16 v32 = 2112;
    uint64_t v33 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Presence channel subscribe completed with error %@", (uint8_t *)&v30, 0x16u);
  }
  uint64_t v7 = [HMDStatusChannelManagementLogEvent alloc];
  id v8 = [*(id *)(a1 + 32) channelPrefix];
  char v9 = [(HMDStatusChannelManagementLogEvent *)v7 initWithChannelPrefix:v8 isRetry:*(unsigned __int8 *)(a1 + 48) action:1];

  v10 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 40))
  {
    char v11 = [v10 logEventSubmitter];
    [v11 submitLogEvent:v9 error:*(void *)(a1 + 40)];

    BOOL v12 = [*(id *)(a1 + 32) subscribeRetryTimer];

    if (!v12)
    {
      uint64_t v13 = [*(id *)(a1 + 32) _createBackoffTimerWithMinimumTimeInterval:5.0 maximumTimeInterval:300.0];
      [*(id *)(a1 + 32) setSubscribeRetryTimer:v13];
    }
    uint64_t v14 = [*(id *)(a1 + 32) subscribeRetryTimer];
    [v14 resume];

    __int16 v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = *(id *)(a1 + 32);
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      long long v18 = HMFGetLogIdentifier();
      long long v19 = [*(id *)(a1 + 32) subscribeRetryTimer];
      long long v20 = [v19 fireDate];
      [v20 timeIntervalSinceNow];
      uint64_t v21 = *(void *)(a1 + 40);
      int v30 = 138543874;
      uint64_t v31 = v18;
      __int16 v32 = 2048;
      uint64_t v33 = v22;
      __int16 v34 = 2112;
      uint64_t v35 = v21;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to subscribe to status kit.  Will retry in %f seconds.  Error %@", (uint8_t *)&v30, 0x20u);
    }
  }
  else
  {
    [v10 setSubscribed:1];
    uint64_t v23 = [*(id *)(a1 + 32) subscribeRetryTimer];
    [v23 suspend];

    [*(id *)(a1 + 32) setSubscribeRetryTimer:0];
    __int16 v24 = [*(id *)(a1 + 32) logEventSubmitter];
    [v24 submitLogEvent:v9];

    v25 = [*(id *)(a1 + 32) localPayload];

    if (v25)
    {
      int v26 = (void *)MEMORY[0x230FBD990]();
      id v27 = *(id *)(a1 + 32);
      __int16 v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = HMFGetLogIdentifier();
        int v30 = 138543362;
        uint64_t v31 = v29;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Requesting publish now that we are subscribed", (uint8_t *)&v30, 0xCu);
      }
      [*(id *)(a1 + 32) _requestPublishShouldDebounce:0];
    }
  }
}

- (void)_checkForInitialStatusKitCloudKitImportAndSubscribe
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(HMDStatusChannel *)self initialStatusKitCloudKitImportOccurred])
  {
    id v3 = (void *)MEMORY[0x230FBD990]();
    uint64_t v4 = self;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v10 = v6;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Initial StatusKit CloudKit import has occurred already, subscribing", buf, 0xCu);
    }
    [(HMDStatusChannel *)v4 _subscribeToStatusKitWithIsRetry:0];
  }
  else
  {
    uint64_t v7 = [(HMDStatusChannel *)self presenceChannel];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __71__HMDStatusChannel__checkForInitialStatusKitCloudKitImportAndSubscribe__block_invoke;
    v8[3] = &unk_264A2ED68;
    v8[4] = self;
    [v7 hasInitialCloudKitImportOccurredWithCompletion:v8];
  }
}

void __71__HMDStatusChannel__checkForInitialStatusKitCloudKitImportAndSubscribe__block_invoke(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 8);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __71__HMDStatusChannel__checkForInitialStatusKitCloudKitImportAndSubscribe__block_invoke_2;
  v4[3] = &unk_264A2B870;
  v4[4] = v2;
  char v5 = a2;
  dispatch_async(v3, v4);
}

void __71__HMDStatusChannel__checkForInitialStatusKitCloudKitImportAndSubscribe__block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = HMFGetLogIdentifier();
    uint64_t v6 = HMFBooleanToString();
    int v15 = 138543618;
    id v16 = v5;
    __int16 v17 = 2112;
    long long v18 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Received completion with initial StatusKit CloudKit import has occurred: %@", (uint8_t *)&v15, 0x16u);
  }
  [*(id *)(a1 + 32) setInitialStatusKitCloudKitImportOccurred:*(unsigned __int8 *)(a1 + 40)];
  int v7 = [*(id *)(a1 + 32) initialStatusKitCloudKitImportOccurred];
  id v8 = *(void **)(a1 + 32);
  if (v7)
  {
    [v8 _subscribeToStatusKitWithIsRetry:0];
  }
  else
  {
    char v9 = [v8 initialStatusKitCloudKitImportTimer];

    if (!v9)
    {
      v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = *(id *)(a1 + 32);
      BOOL v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = HMFGetLogIdentifier();
        int v15 = 138543362;
        id v16 = v13;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Initial StatusKit CloudKit import has not occurred, starting timer", (uint8_t *)&v15, 0xCu);
      }
      uint64_t v14 = [*(id *)(a1 + 32) _createTimerWithTimeout:300.0];
      [*(id *)(a1 + 32) setInitialStatusKitCloudKitImportTimer:v14];
    }
  }
}

- (id)_recordsFromPresence:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  char v5 = [MEMORY[0x263EFF9C0] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = objc_msgSend(v4, "presentDevices", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [[HMDStatusChannelRecord alloc] initWithPresentDevice:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)_stopPublishing
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = self;
  char v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    uint64_t v9 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Stopping publishing", (uint8_t *)&v8, 0xCu);
  }
  localPayload = v4->_localPayload;
  v4->_localPayload = 0;

  [(HMDStatusChannel *)v4 _deassertPresenceWithIsRetry:0];
}

- (void)_requestPublishShouldDebounce:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v3)
  {
    char v5 = (void *)MEMORY[0x230FBD990]();
    uint64_t v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = HMFGetLogIdentifier();
      uint64_t v9 = [(HMDStatusChannel *)v6 publishDebounceTimer];
      [v9 isRunning];
      uint64_t v10 = HMFBooleanToString();
      int v18 = 138543618;
      uint64_t v19 = v8;
      __int16 v20 = 2112;
      uint64_t v21 = v10;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Requesting publish, debounce timer running: %@", (uint8_t *)&v18, 0x16u);
    }
    id v11 = [(HMDStatusChannel *)v6 publishDebounceTimer];

    if (!v11)
    {
      BOOL v12 = [(HMDStatusChannel *)v6 _createTimerWithTimeout:5.0];
      [(HMDStatusChannel *)v6 setPublishDebounceTimer:v12];
    }
  }
  else
  {
    long long v13 = [(HMDStatusChannel *)self publishDebounceTimer];
    [v13 suspend];

    long long v14 = (void *)MEMORY[0x230FBD990]([(HMDStatusChannel *)self setPublishDebounceTimer:0]);
    long long v15 = self;
    long long v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = HMFGetLogIdentifier();
      int v18 = 138543362;
      uint64_t v19 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Requesting publish without debounce", (uint8_t *)&v18, 0xCu);
    }
    [(HMDStatusChannel *)v15 _assertPresenceWithIsRetry:0];
  }
}

- (void)_publishRecordWithPayload:(id)a3 shouldDebounce:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_storeStrong((id *)&self->_localPayload, a3);
  if ([(HMDStatusChannel *)self initialStatusKitCloudKitImportOccurred])
  {
    [(HMDStatusChannel *)self _requestPublishShouldDebounce:v4];
  }
  else
  {
    int v8 = (void *)MEMORY[0x230FBD990]();
    uint64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      long long v13 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Delaying request to publish, initial StatusKit CloudKit import has not occurred yet", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)_deassertPresenceWithIsRetry:(BOOL)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  char v5 = [(HMDStatusChannel *)self presenceChannel];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__HMDStatusChannel__deassertPresenceWithIsRetry___block_invoke;
  v6[3] = &unk_264A1CB38;
  v6[4] = self;
  BOOL v7 = a3;
  [v5 releasePresenceWithCompletion:v6];
}

void __49__HMDStatusChannel__deassertPresenceWithIsRetry___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  char v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__HMDStatusChannel__deassertPresenceWithIsRetry___block_invoke_2;
  block[3] = &unk_264A2DFC8;
  block[4] = v4;
  id v8 = v3;
  char v9 = *(unsigned char *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, block);
}

void __49__HMDStatusChannel__deassertPresenceWithIsRetry___block_invoke_2(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v25 = 138543618;
    int v26 = v5;
    __int16 v27 = 2112;
    uint64_t v28 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Presence channel stop publishing completed with error %@", (uint8_t *)&v25, 0x16u);
  }
  BOOL v7 = [HMDStatusChannelManagementLogEvent alloc];
  id v8 = [*(id *)(a1 + 32) channelPrefix];
  char v9 = [(HMDStatusChannelManagementLogEvent *)v7 initWithChannelPrefix:v8 isRetry:*(unsigned __int8 *)(a1 + 48) action:2];

  if (*(void *)(a1 + 40))
  {
    uint64_t v10 = [*(id *)(a1 + 32) logEventSubmitter];
    [v10 submitLogEvent:v9 error:*(void *)(a1 + 40)];

    id v11 = [*(id *)(a1 + 32) stopPublishRetryTimer];

    if (!v11)
    {
      int v12 = [*(id *)(a1 + 32) _createBackoffTimerWithMinimumTimeInterval:5.0 maximumTimeInterval:300.0];
      [*(id *)(a1 + 32) setStopPublishRetryTimer:v12];
    }
    long long v13 = [*(id *)(a1 + 32) stopPublishRetryTimer];
    [v13 resume];

    uint64_t v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = *(id *)(a1 + 32);
    long long v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = HMFGetLogIdentifier();
      int v18 = [*(id *)(a1 + 32) stopPublishRetryTimer];
      uint64_t v19 = [v18 fireDate];
      [v19 timeIntervalSinceNow];
      uint64_t v20 = *(void *)(a1 + 40);
      int v25 = 138543874;
      int v26 = v17;
      __int16 v27 = 2048;
      uint64_t v28 = v21;
      __int16 v29 = 2112;
      uint64_t v30 = v20;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to stop publishing to status kit.  Will retry in %f seconds.  Error %@", (uint8_t *)&v25, 0x20u);
    }
  }
  else
  {
    uint64_t v22 = [MEMORY[0x263EFF910] now];
    [*(id *)(a1 + 32) setLastStopPublishTimestamp:v22];

    uint64_t v23 = [*(id *)(a1 + 32) stopPublishRetryTimer];
    [v23 suspend];

    [*(id *)(a1 + 32) setStopPublishRetryTimer:0];
    __int16 v24 = [*(id *)(a1 + 32) logEventSubmitter];
    [v24 submitLogEvent:v9];
  }
}

- (void)_assertPresenceWithIsRetry:(BOOL)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  char v5 = [(HMDStatusChannel *)self presencePayload];
  uint64_t v6 = (void *)MEMORY[0x230FBD990]();
  BOOL v7 = self;
  id v8 = HMFGetOSLogHandle();
  char v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v18 = v10;
      __int16 v19 = 2112;
      uint64_t v20 = v5;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Asserting presence with payload: %@", buf, 0x16u);
    }
    id v11 = [(HMDStatusChannel *)v7 presenceChannel];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __47__HMDStatusChannel__assertPresenceWithIsRetry___block_invoke;
    v14[3] = &unk_264A225B8;
    v14[4] = v7;
    id v15 = v5;
    BOOL v16 = a3;
    [v11 assertPresenceWithPresencePayload:v15 completion:v14];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v12 = HMFGetLogIdentifier();
      long long v13 = [(HMDStatusChannel *)v7 localPayload];
      *(_DWORD *)buf = 138543618;
      int v18 = v12;
      __int16 v19 = 2112;
      uint64_t v20 = v13;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Nil presence payload, local payload: %@", buf, 0x16u);
    }
  }
}

void __47__HMDStatusChannel__assertPresenceWithIsRetry___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  char v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__HMDStatusChannel__assertPresenceWithIsRetry___block_invoke_2;
  v7[3] = &unk_264A2B1D8;
  v7[4] = v4;
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  char v10 = *(unsigned char *)(a1 + 48);
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __47__HMDStatusChannel__assertPresenceWithIsRetry___block_invoke_2(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    int v25 = 138543874;
    int v26 = v5;
    __int16 v27 = 2112;
    uint64_t v28 = v6;
    __int16 v29 = 2112;
    uint64_t v30 = v7;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Set presence payload: %@ completed with error: %@", (uint8_t *)&v25, 0x20u);
  }
  if (*(void *)(a1 + 48))
  {
    id v8 = [*(id *)(a1 + 32) publishRetryTimer];

    if (!v8)
    {
      id v9 = [*(id *)(a1 + 32) _createBackoffTimerWithMinimumTimeInterval:5.0 maximumTimeInterval:300.0];
      [*(id *)(a1 + 32) setPublishRetryTimer:v9];
    }
    char v10 = [*(id *)(a1 + 32) publishRetryTimer];
    [v10 resume];

    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = *(id *)(a1 + 32);
    long long v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      uint64_t v15 = *(void *)(a1 + 40);
      BOOL v16 = [*(id *)(a1 + 32) publishRetryTimer];
      __int16 v17 = [v16 fireDate];
      [v17 timeIntervalSinceNow];
      int v25 = 138543874;
      int v26 = v14;
      __int16 v27 = 2112;
      uint64_t v28 = v15;
      __int16 v29 = 2048;
      uint64_t v30 = v18;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to set presence payload %@. Will retry in %f seconds.", (uint8_t *)&v25, 0x20u);
    }
  }
  else
  {
    __int16 v19 = [MEMORY[0x263EFF910] now];
    [*(id *)(a1 + 32) setLastPublishTimestamp:v19];

    uint64_t v20 = [*(id *)(a1 + 32) publishRetryTimer];
    [v20 suspend];

    [*(id *)(a1 + 32) setPublishRetryTimer:0];
    [*(id *)(a1 + 32) _startAssertionLogTimer];
  }
  uint64_t v21 = [HMDStatusChannelPublishLogEvent alloc];
  uint64_t v22 = [*(id *)(a1 + 32) channelPrefix];
  uint64_t v23 = [(HMDStatusChannelPublishLogEvent *)v21 initWithChannelPrefix:v22 isRetry:*(unsigned __int8 *)(a1 + 56)];

  __int16 v24 = [*(id *)(a1 + 32) logEventSubmitter];
  [v24 submitLogEvent:v23 error:*(void *)(a1 + 48)];
}

- (void)_handlePresentDevicesChangedForPresence:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  char v5 = [(HMDStatusChannel *)self _recordsFromPresence:v4];
  currentRecords = self->_currentRecords;
  self->_currentRecords = v5;

  uint64_t v7 = [MEMORY[0x263EFF910] now];
  [(HMDStatusChannel *)self setLastObserveTimestamp:v7];

  id v8 = NSNumber;
  id v9 = [(HMDStatusChannel *)self currentRecords];
  char v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  [(HMDStatusChannel *)self setLastObserveDeviceCount:v10];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = [(HMDStatusChannel *)self statusDelegates];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        BOOL v16 = *(void **)(*((void *)&v18 + 1) + 8 * v15);
        if (objc_opt_respondsToSelector())
        {
          __int16 v17 = [(HMDStatusChannel *)self currentRecords];
          [v16 channel:self didObserveRecordUpdate:v17];
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }
}

- (id)presencePayload
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = [(HMDStatusChannel *)self appleAccountManager];
  id v4 = [v3 device];

  char v5 = [v4 idsIdentifier];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void *)MEMORY[0x263EFF9A0];
    id v8 = objc_msgSend(v5, "UUIDString", @"statusChannelDeviceIdKey");
    v21[1] = @"SC.ck.pt";
    v22[0] = v8;
    id v9 = [MEMORY[0x263EFF910] now];
    v22[1] = v9;
    char v10 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    id v11 = [v7 dictionaryWithDictionary:v10];

    uint64_t v12 = [(HMDStatusChannel *)self localPayload];
    [v11 addEntriesFromDictionary:v12];

    id v13 = objc_alloc(MEMORY[0x263F79800]);
    uint64_t v14 = (void *)[v11 copy];
    uint64_t v15 = (void *)[v13 initWithDictionary:v14];
  }
  else
  {
    BOOL v16 = (void *)MEMORY[0x230FBD990]();
    __int16 v17 = self;
    long long v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      long long v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v24 = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Attempting to generate presence payload but current device IDS Identifier is nil", buf, 0xCu);
    }
    uint64_t v15 = 0;
  }

  return v15;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(HMDStatusChannel *)self publishRetryTimer];

  if (v5 == v4)
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    uint64_t v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      BOOL v16 = HMFGetLogIdentifier();
      int v56 = 138543362;
      long long v57 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Publish retry timer fired", (uint8_t *)&v56, 0xCu);
    }
    __int16 v17 = [(HMDStatusChannel *)v14 publishRetryTimer];
    [v17 suspend];

    long long v18 = v14;
    uint64_t v19 = 1;
    goto LABEL_13;
  }
  id v6 = [(HMDStatusChannel *)self stopPublishRetryTimer];

  if (v6 == v4)
  {
    long long v20 = (void *)MEMORY[0x230FBD990]();
    long long v21 = self;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      int v56 = 138543362;
      long long v57 = v23;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Stop publish retry timer fired", (uint8_t *)&v56, 0xCu);
    }
    __int16 v24 = [(HMDStatusChannel *)v21 stopPublishRetryTimer];
    [v24 suspend];

    [(HMDStatusChannel *)v21 _deassertPresenceWithIsRetry:1];
    goto LABEL_24;
  }
  id v7 = [(HMDStatusChannel *)self subscribeRetryTimer];

  if (v7 == v4)
  {
    uint64_t v25 = (void *)MEMORY[0x230FBD990]();
    int v26 = self;
    __int16 v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      uint64_t v28 = HMFGetLogIdentifier();
      int v56 = 138543362;
      long long v57 = v28;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Subscribe retry timer fired", (uint8_t *)&v56, 0xCu);
    }
    __int16 v29 = [(HMDStatusChannel *)v26 subscribeRetryTimer];
    [v29 suspend];

    uint64_t v30 = v26;
    uint64_t v31 = 1;
    goto LABEL_20;
  }
  id v8 = [(HMDStatusChannel *)self unsubscribeRetryTimer];

  if (v8 == v4)
  {
    __int16 v32 = (void *)MEMORY[0x230FBD990]();
    uint64_t v33 = self;
    __int16 v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      uint64_t v35 = HMFGetLogIdentifier();
      int v56 = 138543362;
      long long v57 = v35;
      _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, "%{public}@Unsubscribe retry timer fired", (uint8_t *)&v56, 0xCu);
    }
    uint64_t v36 = [(HMDStatusChannel *)v33 unsubscribeRetryTimer];
    [v36 suspend];

    [(HMDStatusChannel *)v33 _unsubscribeFromStatusKitWithIsRetry:1];
    goto LABEL_24;
  }
  id v9 = [(HMDStatusChannel *)self publishDebounceTimer];

  if (v9 == v4)
  {
    uint64_t v37 = (void *)MEMORY[0x230FBD990]([(HMDStatusChannel *)self setPublishDebounceTimer:0]);
    __int16 v38 = self;
    uint64_t v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      __int16 v40 = HMFGetLogIdentifier();
      int v56 = 138543362;
      long long v57 = v40;
      _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_INFO, "%{public}@Publish debounce timer fired", (uint8_t *)&v56, 0xCu);
    }
    long long v18 = v38;
    uint64_t v19 = 0;
LABEL_13:
    [(HMDStatusChannel *)v18 _assertPresenceWithIsRetry:v19];
    goto LABEL_24;
  }
  id v10 = [(HMDStatusChannel *)self initialStatusKitCloudKitImportTimer];

  if (v10 != v4)
  {
    id v11 = [(HMDStatusChannel *)self postRegainNetworkConnectivityTimer];

    if (v11 == v4)
    {
      id v49 = (void *)MEMORY[0x230FBD990]();
      id v50 = self;
      v51 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        id v52 = HMFGetLogIdentifier();
        int v56 = 138543362;
        long long v57 = v52;
        _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@Post network connectivity regain timer fired", (uint8_t *)&v56, 0xCu);
      }
      [(HMDStatusChannel *)v50 _stopPostRegainNetworkConnectivityTimer];
      v50->_isConnected = 1;
      uint64_t v53 = [MEMORY[0x263EFF910] now];
      lastConnectivityChangeTimestamp = v50->_lastConnectivityChangeTimestamp;
      v50->_lastConnectivityChangeTimestamp = (NSDate *)v53;

      long long v55 = [(HMDStatusChannel *)v50 presenceChannel];
      [(HMDStatusChannel *)v50 _handlePresentDevicesChangedForPresence:v55];
    }
    else
    {
      id v12 = [(HMDStatusChannel *)self assertionLogTimer];

      if (v12 == v4) {
        [(HMDStatusChannel *)self _handleAssertionLogTimerFired];
      }
    }
    goto LABEL_24;
  }
  v41 = (void *)MEMORY[0x230FBD990]([(HMDStatusChannel *)self setInitialStatusKitCloudKitImportTimer:0]);
  __int16 v42 = self;
  v43 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v44 = HMFGetLogIdentifier();
    int v56 = 138543362;
    long long v57 = v44;
    _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@Initial StatusKit CloudKit import timer fired", (uint8_t *)&v56, 0xCu);
  }
  if (![(HMDStatusChannel *)v42 initialStatusKitCloudKitImportOccurred])
  {
    v45 = (void *)MEMORY[0x230FBD990]();
    id v46 = v42;
    id v47 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = HMFGetLogIdentifier();
      int v56 = 138543362;
      long long v57 = v48;
      _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@Marking initial StatusKit CloudKit import as has having occurred (even though it didn't yet)", (uint8_t *)&v56, 0xCu);
    }
    [(HMDStatusChannel *)v46 setInitialStatusKitCloudKitImportOccurred:1];
    if ([(HMDStatusChannel *)v46 started])
    {
      uint64_t v30 = v46;
      uint64_t v31 = 0;
LABEL_20:
      [(HMDStatusChannel *)v30 _subscribeToStatusKitWithIsRetry:v31];
    }
  }
LABEL_24:
}

- (void)networkMonitorIsUnreachable:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__HMDStatusChannel_networkMonitorIsUnreachable___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __48__HMDStatusChannel_networkMonitorIsUnreachable___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v15 = 138543362;
    BOOL v16 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Received network is unreachable from NetMonitor", (uint8_t *)&v15, 0xCu);
  }
  uint64_t result = [*(id *)(a1 + 32) started];
  if (result)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
    uint64_t v7 = [MEMORY[0x263EFF910] now];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 216);
    *(void *)(v8 + 216) = v7;

    id v10 = [*(id *)(a1 + 32) postRegainNetworkConnectivityTimer];

    if (v10)
    {
      id v11 = (void *)MEMORY[0x230FBD990]();
      id v12 = *(id *)(a1 + 32);
      id v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        int v15 = 138543362;
        BOOL v16 = v14;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Stopping post regain network connectivity timer because network is unreachable again", (uint8_t *)&v15, 0xCu);
      }
      [*(id *)(a1 + 32) _stopPostRegainNetworkConnectivityTimer];
    }
    return [*(id *)(a1 + 32) _informNetworkChange:0];
  }
  return result;
}

- (void)networkMonitorIsReachable:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__HMDStatusChannel_networkMonitorIsReachable___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __46__HMDStatusChannel_networkMonitorIsReachable___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v19 = 138543362;
    long long v20 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Received network is reachable from NetMonitor", (uint8_t *)&v19, 0xCu);
  }
  if ([*(id *)(a1 + 32) started])
  {
    [*(id *)(a1 + 32) _informNetworkChange:1];
    if ([*(id *)(a1 + 32) receivedInitialChannelState])
    {
      if (([*(id *)(a1 + 32) isConnected] & 1) == 0)
      {
        id v6 = [*(id *)(a1 + 32) postRegainNetworkConnectivityTimer];

        if (!v6)
        {
          uint64_t v7 = (void *)MEMORY[0x230FBD990]();
          id v8 = *(id *)(a1 + 32);
          id v9 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            id v10 = HMFGetLogIdentifier();
            int v19 = 138543362;
            long long v20 = v10;
            _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Starting post network connectivity regain timer", (uint8_t *)&v19, 0xCu);
          }
          id v11 = [*(id *)(a1 + 32) timerProvider];
          id v12 = [v11 timerWithTimeInterval:0 options:60.0];
          [*(id *)(a1 + 32) setPostRegainNetworkConnectivityTimer:v12];

          id v13 = *(void **)(a1 + 32);
          uint64_t v14 = [v13 postRegainNetworkConnectivityTimer];
          [v14 setDelegate:v13];

          int v15 = *(void **)(a1 + 32);
          uint64_t v16 = v15[1];
          uint64_t v17 = [v15 postRegainNetworkConnectivityTimer];
          [v17 setDelegateQueue:v16];

          long long v18 = [*(id *)(a1 + 32) postRegainNetworkConnectivityTimer];
          [v18 resume];
        }
      }
    }
  }
}

- (void)initialCloudKitImportReceived:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    int v11 = 138543362;
    id v12 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Initial StatusKit CloudKit import received callback triggered", (uint8_t *)&v11, 0xCu);
  }
  id v9 = [(HMDStatusChannel *)v6 initialStatusKitCloudKitImportTimer];

  if (v9)
  {
    id v10 = [(HMDStatusChannel *)v6 initialStatusKitCloudKitImportTimer];
    [v10 suspend];

    [(HMDStatusChannel *)v6 setInitialStatusKitCloudKitImportTimer:0];
  }
  if (![(HMDStatusChannel *)v6 initialStatusKitCloudKitImportOccurred])
  {
    [(HMDStatusChannel *)v6 setInitialStatusKitCloudKitImportOccurred:1];
    if ([(HMDStatusChannel *)v6 started]) {
      [(HMDStatusChannel *)v6 _subscribeToStatusKitWithIsRetry:0];
    }
  }
}

- (void)presentDevicesChangedForPresence:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v24 = 138543362;
    uint64_t v25 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Present devices changed", (uint8_t *)&v24, 0xCu);
  }
  v6->_isConnected = 1;
  uint64_t v9 = [MEMORY[0x263EFF910] now];
  lastConnectivityChangeTimestamp = v6->_lastConnectivityChangeTimestamp;
  v6->_lastConnectivityChangeTimestamp = (NSDate *)v9;

  if (![(HMDStatusChannel *)v6 receivedInitialChannelState])
  {
    int v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = v6;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v24 = 138543362;
      uint64_t v25 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Received initial channel state", (uint8_t *)&v24, 0xCu);
    }
    [(HMDStatusChannel *)v12 setReceivedInitialChannelState:1];
  }
  int v15 = [(HMDStatusChannel *)v6 postRegainNetworkConnectivityTimer];

  if (v15)
  {
    uint64_t v16 = (void *)MEMORY[0x230FBD990]();
    uint64_t v17 = v6;
    long long v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = HMFGetLogIdentifier();
      int v24 = 138543362;
      uint64_t v25 = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Stopping post regain network connectivity timer because we received a callback from StatusKit", (uint8_t *)&v24, 0xCu);
    }
    [(HMDStatusChannel *)v17 _stopPostRegainNetworkConnectivityTimer];
  }
  long long v20 = [HMDStatusChannelObserveLogEvent alloc];
  uint64_t v21 = [(HMDStatusChannel *)v6 channelPrefix];
  uint64_t v22 = [(HMDStatusChannelObserveLogEvent *)v20 initWithChannelPrefix:v21];

  uint64_t v23 = [(HMDStatusChannel *)v6 logEventSubmitter];
  [v23 submitLogEvent:v22];

  [(HMDStatusChannel *)v6 _handlePresentDevicesChangedForPresence:v4];
}

- (id)invitedURIs
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [(HMDStatusChannel *)self presenceChannel];

  if (v3)
  {
    id v4 = [MEMORY[0x263EFF980] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = [(HMDStatusChannel *)self presenceChannel];
    id v6 = [v5 invitedHandles];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          int v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) handleString];
          [v4 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    id v12 = (void *)[v4 copy];
  }
  else
  {
    id v12 = (void *)MEMORY[0x263EFFA68];
  }
  return v12;
}

- (void)setInvitedUsers:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__HMDStatusChannel_setInvitedUsers_withCompletion___block_invoke;
  block[3] = &unk_264A2EE80;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __51__HMDStatusChannel_setInvitedUsers_withCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setInvitedUsers:*(void *)(a1 + 40) withCompletion:*(void *)(a1 + 48)];
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__HMDStatusChannel_addDelegate___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __32__HMDStatusChannel_addDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addDelegate:*(void *)(a1 + 40)];
}

- (id)dumpState
{
  v29[7] = *MEMORY[0x263EF8340];
  v28[0] = @"Last Observe Timestamp";
  __int16 v27 = [(HMDStatusChannel *)self lastObserveTimestamp];
  uint64_t v3 = [v27 localTimeDescription];
  id v4 = (void *)v3;
  if (v3) {
    id v5 = (__CFString *)v3;
  }
  else {
    id v5 = &stru_26E2EB898;
  }
  v29[0] = v5;
  v28[1] = @"Last Observe Device Count";
  uint64_t v6 = [(HMDStatusChannel *)self lastObserveDeviceCount];
  id v7 = (void *)v6;
  if (v6) {
    id v8 = (__CFString *)v6;
  }
  else {
    id v8 = &stru_26E2EB898;
  }
  v29[1] = v8;
  v28[2] = @"Last Publish Timestamp";
  uint64_t v26 = [(HMDStatusChannel *)self lastPublishTimestamp];
  uint64_t v9 = [v26 localTimeDescription];
  id v10 = (void *)v9;
  if (v9) {
    int v11 = (__CFString *)v9;
  }
  else {
    int v11 = &stru_26E2EB898;
  }
  v29[2] = v11;
  v28[3] = @"Last Publish Payload";
  uint64_t v12 = [(HMDStatusChannel *)self localPayload];
  id v13 = (void *)v12;
  if (v12) {
    long long v14 = (__CFString *)v12;
  }
  else {
    long long v14 = &stru_26E2EB898;
  }
  v29[3] = v14;
  v28[4] = @"Last Stop Publish Timestamp";
  long long v15 = [(HMDStatusChannel *)self lastStopPublishTimestamp];
  uint64_t v16 = [v15 localTimeDescription];
  long long v17 = (void *)v16;
  if (v16) {
    long long v18 = (__CFString *)v16;
  }
  else {
    long long v18 = &stru_26E2EB898;
  }
  v29[4] = v18;
  v28[5] = @"Last Connectivity Change Timestamp";
  uint64_t v19 = [(HMDStatusChannel *)self lastConnectivityChangeTimestamp];
  uint64_t v20 = [v19 localTimeDescription];
  uint64_t v21 = (void *)v20;
  if (v20) {
    uint64_t v22 = (__CFString *)v20;
  }
  else {
    uint64_t v22 = &stru_26E2EB898;
  }
  v29[5] = v22;
  v28[6] = @"Last Connectivity State";
  [(HMDStatusChannel *)self isConnected];
  uint64_t v23 = NSStringFromBOOL();
  v29[6] = v23;
  int v24 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:7];

  return v24;
}

- (void)stopPublishing
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__HMDStatusChannel_stopPublishing__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __34__HMDStatusChannel_stopPublishing__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopPublishing];
}

- (void)publishRecordWithPayload:(id)a3 shouldDebounce:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__HMDStatusChannel_publishRecordWithPayload_shouldDebounce___block_invoke;
  block[3] = &unk_264A2DFC8;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __60__HMDStatusChannel_publishRecordWithPayload_shouldDebounce___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _publishRecordWithPayload:*(void *)(a1 + 40) shouldDebounce:*(unsigned __int8 *)(a1 + 48)];
}

- (void)stop
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__HMDStatusChannel_stop__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __24__HMDStatusChannel_stop__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  char v2 = [*(id *)(a1 + 32) started];
  uint64_t v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v6)
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = [*(id *)(a1 + 32) channelName];
      int v18 = 138543618;
      uint64_t v19 = v7;
      __int16 v20 = 2112;
      uint64_t v21 = v8;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping Presence Channel %@", (uint8_t *)&v18, 0x16u);
    }
    uint64_t v9 = [*(id *)(a1 + 32) presenceChannel];
    [v9 removeDelegate:*(void *)(a1 + 32)];

    [*(id *)(a1 + 32) setStarted:0];
    id v10 = [*(id *)(a1 + 32) subscribeRetryTimer];
    [v10 suspend];

    [*(id *)(a1 + 32) setSubscribeRetryTimer:0];
    BOOL v11 = [*(id *)(a1 + 32) initialStatusKitCloudKitImportTimer];
    [v11 suspend];

    [*(id *)(a1 + 32) setInitialStatusKitCloudKitImportTimer:0];
    uint64_t v12 = [*(id *)(a1 + 32) publishRetryTimer];
    [v12 suspend];

    [*(id *)(a1 + 32) setPublishRetryTimer:0];
    [*(id *)(a1 + 32) _stopPostRegainNetworkConnectivityTimer];
    [*(id *)(a1 + 32) _stopAssertionLogTimer];
    *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 20) = 0;
    id v13 = [MEMORY[0x263EFF910] now];
    [*(id *)(a1 + 32) setLastConnectivityChangeTimestamp:v13];

    uint64_t v14 = [MEMORY[0x263EFFA08] set];
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void **)(v15 + 24);
    *(void *)(v15 + 24) = v14;

    [*(id *)(a1 + 32) _unsubscribeFromStatusKitWithIsRetry:0];
  }
  else
  {
    if (v6)
    {
      long long v17 = HMFGetLogIdentifier();
      int v18 = 138543362;
      uint64_t v19 = v17;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Presence channel already stopped", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (void)start
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__HMDStatusChannel_start__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __25__HMDStatusChannel_start__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) started];
  uint64_t v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  BOOL v6 = v5;
  if (v2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      int v21 = 138543362;
      uint64_t v22 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Presence channel already started", (uint8_t *)&v21, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v9 = [*(id *)(a1 + 32) channelName];
      id v10 = [*(id *)(a1 + 32) netMonitor];
      [v10 isReachable];
      BOOL v11 = HMFBooleanToString();
      int v21 = 138543874;
      uint64_t v22 = v8;
      __int16 v23 = 2112;
      int v24 = v9;
      __int16 v25 = 2112;
      uint64_t v26 = v11;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Starting Presence Channel %@ with NetMonitor reachable: %@", (uint8_t *)&v21, 0x20u);
    }
    uint64_t v12 = [*(id *)(a1 + 32) presenceProvider];
    id v13 = [*(id *)(a1 + 32) channelName];
    uint64_t v14 = [*(id *)(a1 + 32) channelPrefix];
    uint64_t v15 = [v12 createPresenceWithChannelName:v13 serviceIdentifier:v14];
    uint64_t v16 = *(void *)(a1 + 32);
    long long v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    int v18 = [*(id *)(a1 + 32) presenceChannel];
    [v18 addDelegate:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 8)];

    [*(id *)(a1 + 32) setStarted:1];
    uint64_t v19 = [*(id *)(a1 + 32) unsubscribeRetryTimer];
    [v19 suspend];

    [*(id *)(a1 + 32) setUnsubscribeRetryTimer:0];
    *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
    __int16 v20 = [MEMORY[0x263EFF910] now];
    [*(id *)(a1 + 32) setLastConnectivityChangeTimestamp:v20];

    [*(id *)(a1 + 32) _checkForInitialStatusKitCloudKitImportAndSubscribe];
  }
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDStatusChannel *)self presenceChannel];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = self;
    BOOL v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v13 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Deallocating Presence Channel", buf, 0xCu);
    }
    id v8 = [(HMDStatusChannel *)v5 presenceChannel];
    [v8 removeDelegate:v5];

    uint64_t v9 = [(HMDStatusChannel *)v5 presenceChannel];
    [v9 releaseTransientSubscriptionAssertionWithCompletion:&__block_literal_global_17404];

    presenceChannel = v5->_presenceChannel;
    v5->_presenceChannel = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)HMDStatusChannel;
  [(HMDStatusChannel *)&v11 dealloc];
}

void __27__HMDStatusChannel_dealloc__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Released StatusKit transient subscription", (uint8_t *)&v6, 0xCu);
  }
}

- (HMDStatusChannel)initWithChannelPrefix:(id)a3 identifier:(id)a4 queue:(id)a5
{
  uint64_t v8 = (objc_class *)MEMORY[0x263F425B0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = (void *)[[v8 alloc] initWithNetAddress:0];
  id v13 = objc_opt_new();
  uint64_t v14 = objc_alloc_init(HMDSKPresenceProvider);
  uint64_t v15 = +[HMDMetricsManager sharedLogEventSubmitter];
  uint64_t v16 = +[HMDAppleAccountManager sharedManager];
  long long v17 = [(HMDStatusChannel *)self initWithChannelPrefix:v11 identifier:v10 queue:v9 netMonitor:v12 timerProvider:v13 presenceProvider:v14 logEventSubmitter:v15 appleAccountManager:v16];

  return v17;
}

- (HMDStatusChannel)initWithChannelPrefix:(id)a3 identifier:(id)a4 queue:(id)a5 netMonitor:(id)a6 timerProvider:(id)a7 presenceProvider:(id)a8 logEventSubmitter:(id)a9 appleAccountManager:(id)a10
{
  id v35 = a3;
  id v16 = a4;
  id v34 = a5;
  id v33 = a6;
  id v32 = a7;
  id v31 = a8;
  id v17 = a9;
  id v18 = a10;
  v36.receiver = self;
  v36.super_class = (Class)HMDStatusChannel;
  uint64_t v19 = [(HMDStatusChannel *)&v36 init];
  if (v19)
  {
    uint64_t v20 = [v35 copy];
    int v21 = (void *)*((void *)v19 + 7);
    *((void *)v19 + 7) = v20;

    uint64_t v22 = [v16 copy];
    __int16 v23 = (void *)*((void *)v19 + 8);
    *((void *)v19 + 8) = v22;

    uint64_t v24 = [NSString stringWithFormat:@"%@-%@", *((void *)v19 + 7), *((void *)v19 + 8)];
    __int16 v25 = (void *)*((void *)v19 + 6);
    *((void *)v19 + 6) = v24;

    objc_storeStrong((id *)v19 + 1, a5);
    uint64_t v26 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    uint64_t v27 = (void *)*((void *)v19 + 9);
    *((void *)v19 + 9) = v26;

    uint64_t v28 = [MEMORY[0x263EFFA08] set];
    __int16 v29 = (void *)*((void *)v19 + 3);
    *((void *)v19 + 3) = v28;

    objc_storeStrong((id *)v19 + 10, a6);
    objc_storeStrong((id *)v19 + 11, a10);
    objc_storeStrong((id *)v19 + 12, a7);
    objc_storeStrong((id *)v19 + 13, a8);
    objc_storeStrong((id *)v19 + 22, a9);
    [*((id *)v19 + 10) setDelegate:v19];
    *(_DWORD *)(v19 + 17) = 0;
  }

  return (HMDStatusChannel *)v19;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24 != -1) {
    dispatch_once(&logCategory__hmf_once_t24, &__block_literal_global_88_17418);
  }
  id v2 = (void *)logCategory__hmf_once_v25;
  return v2;
}

void __31__HMDStatusChannel_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v25;
  logCategory__hmf_once___int16 v25 = v0;
}

@end