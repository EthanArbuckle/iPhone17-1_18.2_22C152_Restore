@interface HMDEventTriggerExecutionSession
+ (id)logCategory;
- (BOOL)actionSetExecutionInProgress;
- (BOOL)containsSecureActionSet;
- (BOOL)executionCompleteCalled;
- (BOOL)needsUserConfirmation;
- (BOOL)restoreInProgress;
- (HMDEventTriggerExecutionSession)initWithEventTrigger:(id)a3 predicateUtilities:(id)a4 triggerEvent:(id)a5 causingDevice:(id)a6 workQueue:(id)a7 actionSets:(id)a8 evaluationCondition:(id)a9 recurrences:(id)a10 endEvents:(id)a11 msgDispatcher:(id)a12;
- (HMDEventTriggerUserConfirmationSession)userConfirmationSession;
- (HMDPredicateUtilities)predicateUtilities;
- (HMDTriggerConfirmationTimer)secureTriggerConfirmationTimer;
- (HMFTimer)startCharacteristicsMonitorTimer;
- (NSArray)actionSets;
- (NSArray)endEvents;
- (NSArray)monitorEvents;
- (NSArray)recurrences;
- (NSMapTable)writeRequests;
- (NSMutableArray)causingDevices;
- (NSMutableArray)triggerEvents;
- (NSMutableSet)mediaProfiles;
- (NSPredicate)evaluationCondition;
- (NSString)description;
- (double)executionStartTime;
- (id)_monitoringEventsFromActionSetResponse:(id)a3;
- (id)didOccurEvent:(id)a3 causingDevice:(id)a4;
- (id)dumpState;
- (id)durationEndEvents;
- (id)valueInActionSetWriteResponse:(id)a3 actionSetUUID:(id)a4 accUUID:(id)a5 serviceID:(id)a6 characteristicID:(id)a7;
- (unint64_t)executionState;
- (void)_activateDurationEvents;
- (void)_activateEvents:(id)a3;
- (void)_activateMonitoringEvents;
- (void)_addEvent:(id)a3 causingDevice:(id)a4;
- (void)_callExecutionComplete:(id)a3;
- (void)_callExecutionComplete:(id)a3 callDelegate:(BOOL)a4;
- (void)_callExecutionCompleteIfNoMoreOutstandingRequests;
- (void)_directlyExecuteActionSetsWithCompletionHandler:(id)a3;
- (void)_evaluateFiringTrigger;
- (void)_executeTriggerAfterEvaluatingCondition:(id)a3;
- (void)_handleActionSetExecutionResponse:(id)a3 actionSetError:(id)a4 completion:(id)a5;
- (void)_handleMonitoringEvent:(id)a3;
- (void)_removeUserDialog;
- (void)_restoreState;
- (void)_submitAnalyticsData:(id)a3;
- (void)_userResponse:(unint64_t)a3 device:(id)a4 completionHandler:(id)a5;
- (void)addEvent:(id)a3 causingDevice:(id)a4;
- (void)cancelSessionIfWaitingForUserResponse;
- (void)evaluateFiringTrigger;
- (void)handleSessionPlaybackStateUpdatedNotification:(id)a3;
- (void)postponeRestoreIfWaitingForEndEvent;
- (void)setActionSetExecutionInProgress:(BOOL)a3;
- (void)setExecutionCompleteCalled:(BOOL)a3;
- (void)setExecutionState:(unint64_t)a3;
- (void)setMonitorEvents:(id)a3;
- (void)setRestoreInProgress:(BOOL)a3;
- (void)setSecureTriggerConfirmationTimer:(id)a3;
- (void)setStartCharacteristicsMonitorTimer:(id)a3;
- (void)timerDidFire:(id)a3;
- (void)userResponse:(unint64_t)a3 device:(id)a4 completionHandler:(id)a5;
@end

@implementation HMDEventTriggerExecutionSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProfiles, 0);
  objc_storeStrong((id *)&self->_writeRequests, 0);
  objc_storeStrong((id *)&self->_startCharacteristicsMonitorTimer, 0);
  objc_storeStrong((id *)&self->_secureTriggerConfirmationTimer, 0);
  objc_storeStrong((id *)&self->_userConfirmationSession, 0);
  objc_storeStrong((id *)&self->_recurrences, 0);
  objc_storeStrong((id *)&self->_evaluationCondition, 0);
  objc_storeStrong((id *)&self->_actionSets, 0);
  objc_storeStrong((id *)&self->_predicateUtilities, 0);
  objc_storeStrong((id *)&self->_monitorEvents, 0);
  objc_storeStrong((id *)&self->_endEvents, 0);
  objc_storeStrong((id *)&self->_causingDevices, 0);
  objc_storeStrong((id *)&self->_triggerEvents, 0);
}

- (double)executionStartTime
{
  return self->_executionStartTime;
}

- (NSMutableSet)mediaProfiles
{
  return self->_mediaProfiles;
}

- (NSMapTable)writeRequests
{
  return self->_writeRequests;
}

- (void)setExecutionCompleteCalled:(BOOL)a3
{
  self->_executionCompleteCalled = a3;
}

- (BOOL)executionCompleteCalled
{
  return self->_executionCompleteCalled;
}

- (void)setRestoreInProgress:(BOOL)a3
{
  self->_restoreInProgress = a3;
}

- (BOOL)restoreInProgress
{
  return self->_restoreInProgress;
}

- (void)setActionSetExecutionInProgress:(BOOL)a3
{
  self->_actionSetExecutionInProgress = a3;
}

- (BOOL)actionSetExecutionInProgress
{
  return self->_actionSetExecutionInProgress;
}

- (void)setStartCharacteristicsMonitorTimer:(id)a3
{
}

- (HMFTimer)startCharacteristicsMonitorTimer
{
  return self->_startCharacteristicsMonitorTimer;
}

- (void)setSecureTriggerConfirmationTimer:(id)a3
{
}

- (HMDTriggerConfirmationTimer)secureTriggerConfirmationTimer
{
  return self->_secureTriggerConfirmationTimer;
}

- (HMDEventTriggerUserConfirmationSession)userConfirmationSession
{
  return self->_userConfirmationSession;
}

- (NSArray)recurrences
{
  return self->_recurrences;
}

- (NSPredicate)evaluationCondition
{
  return self->_evaluationCondition;
}

- (NSArray)actionSets
{
  return self->_actionSets;
}

- (HMDPredicateUtilities)predicateUtilities
{
  return self->_predicateUtilities;
}

- (unint64_t)executionState
{
  return self->_executionState;
}

- (void)setMonitorEvents:(id)a3
{
}

- (NSArray)monitorEvents
{
  return self->_monitorEvents;
}

- (NSArray)endEvents
{
  return self->_endEvents;
}

- (NSMutableArray)causingDevices
{
  return self->_causingDevices;
}

- (NSMutableArray)triggerEvents
{
  return self->_triggerEvents;
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  v5 = [(HMDEventTriggerSession *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__HMDEventTriggerExecutionSession_timerDidFire___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __48__HMDEventTriggerExecutionSession_timerDidFire___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) secureTriggerConfirmationTimer];
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    v18 = (void *)MEMORY[0x1D9452090]();
    id v19 = *(id *)(a1 + 32);
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v30 = v21;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@No user has responded to the confirmation yet, declaring confirmation denied", buf, 0xCu);
    }
    v22 = *(void **)(a1 + 32);
    v23 = [MEMORY[0x1E4F28C58] hmErrorWithCode:23];
    [v22 _callExecutionComplete:v23];

    [*(id *)(a1 + 32) setSecureTriggerConfirmationTimer:0];
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) startCharacteristicsMonitorTimer];
    v5 = *(void **)(a1 + 40);

    if (v4 == v5)
    {
      id v6 = (void *)MEMORY[0x1D9452090]();
      id v7 = *(id *)(a1 + 32);
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v30 = v9;
        _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Start char monitor timer has fired, activating monitoring events", buf, 0xCu);
      }
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      v10 = objc_msgSend(*(id *)(a1 + 32), "monitorEvents", 0);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v25 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            v16 = [v15 characteristic];
            v17 = [v16 value];
            [v15 setEventValue:v17];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v12);
      }

      [*(id *)(a1 + 32) setStartCharacteristicsMonitorTimer:0];
      [*(id *)(a1 + 32) _activateMonitoringEvents];
    }
  }
}

- (id)didOccurEvent:(id)a3 causingDevice:(id)a4
{
  id v5 = a3;
  id v6 = [(HMDEventTriggerSession *)self workQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__HMDEventTriggerExecutionSession_didOccurEvent_causingDevice___block_invoke;
  v9[3] = &unk_1E6A197C8;
  v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(v6, v9);

  return 0;
}

void __63__HMDEventTriggerExecutionSession_didOccurEvent_causingDevice___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) endEvents];
  int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v22 = 138543618;
      v23 = v7;
      __int16 v24 = 2112;
      uint64_t v25 = v8;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@End Event has occurred, declaring execution complete, %@", (uint8_t *)&v22, 0x16u);
    }
    [*(id *)(a1 + 32) _restoreState];
  }
  v9 = [*(id *)(a1 + 32) endEvents];
  if ([v9 containsObject:*(void *)(a1 + 40)])
  {

LABEL_9:
    uint64_t v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = *(id *)(a1 + 32);
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      uint64_t v16 = *(void *)(a1 + 40);
      int v22 = 138543618;
      v23 = v15;
      __int16 v24 = 2114;
      uint64_t v25 = v16;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Monitored Event %{public}@ has occurred", (uint8_t *)&v22, 0x16u);
    }
    [*(id *)(a1 + 32) _handleMonitoringEvent:*(void *)(a1 + 40)];
    return;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [*(id *)(a1 + 32) monitorEvents];
    int v11 = [v10 containsObject:*(void *)(a1 + 40)];

    if (v11) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  v17 = (void *)MEMORY[0x1D9452090]();
  id v18 = *(id *)(a1 + 32);
  id v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = HMFGetLogIdentifier();
    uint64_t v21 = *(void *)(a1 + 40);
    int v22 = 138543618;
    v23 = v20;
    __int16 v24 = 2112;
    uint64_t v25 = v21;
    _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Received a delegate callback on event occurrence from %@", (uint8_t *)&v22, 0x16u);
  }
}

- (void)_callExecutionCompleteIfNoMoreOutstandingRequests
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v3 = [(HMDEventTriggerExecutionSession *)self writeRequests];
  if ([v3 count])
  {

LABEL_4:
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      id v10 = [(HMDEventTriggerExecutionSession *)v7 writeRequests];
      int v11 = [v10 description];
      uint64_t v12 = [(HMDEventTriggerExecutionSession *)v7 mediaProfiles];
      int v17 = 138543874;
      id v18 = v9;
      __int16 v19 = 2112;
      v20 = v11;
      __int16 v21 = 2112;
      int v22 = v12;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Not ending the trigger execution session because there are write requests left %@ or media profiles %@", (uint8_t *)&v17, 0x20u);
    }
    return;
  }
  id v4 = [(HMDEventTriggerExecutionSession *)self mediaProfiles];
  uint64_t v5 = [v4 count];

  if (v5) {
    goto LABEL_4;
  }
  id v13 = (void *)MEMORY[0x1D9452090]();
  v14 = self;
  v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = HMFGetLogIdentifier();
    int v17 = 138543362;
    id v18 = v16;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@No more write requests in restore list, declaring execution complete", (uint8_t *)&v17, 0xCu);
  }
  [(HMDEventTriggerExecutionSession *)v14 _callExecutionComplete:0];
}

- (void)handleSessionPlaybackStateUpdatedNotification:(id)a3
{
  id v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F2DA18]];
  id v6 = [(HMDEventTriggerSession *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__HMDEventTriggerExecutionSession_handleSessionPlaybackStateUpdatedNotification___block_invoke;
  block[3] = &unk_1E6A19668;
  block[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, block);
}

void __81__HMDEventTriggerExecutionSession_handleSessionPlaybackStateUpdatedNotification___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v38 = v5;
    __int16 v39 = 2112;
    uint64_t v40 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Received notification userInfo %@", buf, 0x16u);
  }
  id v7 = [*(id *)(a1 + 32) eventTrigger];
  id v8 = [v7 home];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:*(void *)(a1 + 48)];
  id v10 = [v8 mediaSessionWithUUID:v9];

  id v11 = [v10 mediaProfiles];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v12 = [*(id *)(a1 + 32) mediaProfiles];
  id v13 = (void *)[v12 copy];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    v30 = v10;
    char v16 = 0;
    uint64_t v17 = *(void *)v33;
    id v18 = v13;
    do
    {
      uint64_t v19 = 0;
      uint64_t v31 = v15;
      do
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v18);
        }
        uint64_t v20 = *(void *)(*((void *)&v32 + 1) + 8 * v19);
        if ([v11 containsObject:v20])
        {
          __int16 v21 = (void *)MEMORY[0x1D9452090]();
          id v22 = *(id *)(a1 + 32);
          uint64_t v23 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            uint64_t v24 = v17;
            uint64_t v25 = v11;
            uint64_t v26 = a1;
            v28 = long long v27 = v18;
            *(_DWORD *)buf = 138543618;
            v38 = v28;
            __int16 v39 = 2112;
            uint64_t v40 = v20;
            _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Removing the media profile as it was changed, %@", buf, 0x16u);

            id v18 = v27;
            a1 = v26;
            id v11 = v25;
            uint64_t v17 = v24;
            uint64_t v15 = v31;
          }

          v29 = [*(id *)(a1 + 32) mediaProfiles];
          [v29 removeObject:v20];

          char v16 = 1;
        }
        ++v19;
      }
      while (v15 != v19);
      uint64_t v15 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v15);

    id v10 = v30;
    if (v16) {
      [*(id *)(a1 + 32) _callExecutionCompleteIfNoMoreOutstandingRequests];
    }
  }
  else
  {
  }
}

- (void)_handleMonitoringEvent:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  uint64_t v26 = v4;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = [(HMDEventTriggerExecutionSession *)self writeRequests];
  id v8 = (void *)[v7 copy];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      uint64_t v12 = 0;
      uint64_t v27 = v10;
      do
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v28 + 1) + 8 * v12);
        uint64_t v14 = [v6 characteristic];
        uint64_t v15 = [v14 service];
        char v16 = [v13 service];

        if (v15 == v16)
        {
          uint64_t v17 = (void *)MEMORY[0x1D9452090]();
          id v18 = self;
          uint64_t v19 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            uint64_t v20 = v11;
            id v21 = v6;
            id v22 = v8;
            uint64_t v24 = v23 = self;
            *(_DWORD *)buf = 138543618;
            long long v33 = v24;
            __int16 v34 = 2112;
            long long v35 = v13;
            _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Removing the write requests on characteristic as it was changed, %@", buf, 0x16u);

            self = v23;
            id v8 = v22;
            id v6 = v21;
            uint64_t v11 = v20;
            uint64_t v10 = v27;
          }

          uint64_t v25 = [(HMDEventTriggerExecutionSession *)v18 writeRequests];
          [v25 removeObjectForKey:v13];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v10);
  }

  [(HMDEventTriggerExecutionSession *)self _callExecutionCompleteIfNoMoreOutstandingRequests];
}

- (void)_restoreState
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if ([(HMDEventTriggerExecutionSession *)self restoreInProgress])
  {
    id v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = self;
    uint64_t v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v38 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@State restoration is already in progress, ignoring", buf, 0xCu);
    }
  }
  else
  {
    [(HMDEventTriggerExecutionSession *)self setRestoreInProgress:1];
    id v7 = [(HMDEventTriggerSession *)self eventTrigger];
    id v8 = [v7 home];

    if (v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      uint64_t v10 = [(HMDEventTriggerExecutionSession *)self writeRequests];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v47 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v32;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v32 != v12) {
              objc_enumerationMutation(v10);
            }
            uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8 * v13);
            uint64_t v15 = [(HMDEventTriggerExecutionSession *)self writeRequests];
            char v16 = [v15 objectForKey:v14];
            [v9 addObject:v16];

            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v47 count:16];
        }
        while (v11);
      }

      objc_initWeak(&location, self);
      uint64_t v17 = [MEMORY[0x1E4F29128] UUID];
      id v18 = (void *)MEMORY[0x1D9452090]();
      uint64_t v19 = self;
      HMFGetOSLogHandle();
      uint64_t v20 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        long long v35 = 0uLL;
        if (v17) {
          [v17 getUUIDBytes:&v35];
        }
        else {
          long long v35 = *MEMORY[0x1E4F655A8];
        }
        long long v36 = v35;
        uint64_t v26 = [v9 count];
        *(_DWORD *)buf = 138544386;
        id v38 = v21;
        __int16 v39 = 1042;
        int v40 = 16;
        __int16 v41 = 2098;
        v42 = &v36;
        __int16 v43 = 2114;
        v44 = v19;
        __int16 v45 = 2048;
        uint64_t v46 = v26;
        _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Executing write requests for request identifier: %{public,uuid_t}.16P from event trigger execution session: %{public}@ count: %lu", buf, 0x30u);
      }
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __48__HMDEventTriggerExecutionSession__restoreState__block_invoke;
      v27[3] = &unk_1E6A17958;
      objc_copyWeak(&v29, &location);
      id v28 = v8;
      [v28 writeCharacteristicValues:v9 source:3 identifier:v17 transport:0 qualityOfService:-1 withCompletionHandler:v27];
      [(HMDEventTriggerExecutionSession *)v19 setExecutionState:5];

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
    else
    {
      id v22 = (void *)MEMORY[0x1D9452090]();
      uint64_t v23 = self;
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v38 = v25;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Failed to get valid Home reference", buf, 0xCu);
      }
      uint64_t v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      [(HMDEventTriggerExecutionSession *)v23 _callExecutionComplete:v9];
    }
  }
}

void __48__HMDEventTriggerExecutionSession__restoreState__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__HMDEventTriggerExecutionSession__restoreState__block_invoke_2;
    aBlock[3] = &unk_1E6A197F0;
    aBlock[4] = WeakRetained;
    id v6 = _Block_copy(aBlock);
    id v7 = [v5 mediaProfiles];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      uint64_t v9 = [HMDMediaPlaybackAction alloc];
      uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v11 = [v5 mediaProfiles];
      uint64_t v12 = [(HMDMediaPlaybackAction *)v9 initWithUUID:v10 mediaProfiles:v11 playbackState:2 volume:0 playbackArchive:0 actionSet:0];

      uint64_t v13 = [*(id *)(a1 + 32) mediaActionRouter];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __48__HMDEventTriggerExecutionSession__restoreState__block_invoke_4;
      v14[3] = &unk_1E6A17D78;
      id v16 = v6;
      id v15 = v3;
      [v13 routeMediaActionForExecution:v12 source:3 clientName:@"com.apple.homed" completion:v14];
    }
    else
    {
      (*((void (**)(void *, id))v6 + 2))(v6, v3);
    }
  }
}

void __48__HMDEventTriggerExecutionSession__restoreState__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__HMDEventTriggerExecutionSession__restoreState__block_invoke_3;
  v6[3] = &unk_1E6A197C8;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __48__HMDEventTriggerExecutionSession__restoreState__block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32)) {
    a2 = *(void *)(a1 + 32);
  }
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2);
}

uint64_t __48__HMDEventTriggerExecutionSession__restoreState__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callExecutionComplete:*(void *)(a1 + 40)];
}

- (void)_removeUserDialog
{
  id v3 = [(HMDEventTriggerExecutionSession *)self userConfirmationSession];
  id v4 = [(HMDEventTriggerExecutionSession *)self causingDevices];
  [v3 _removeUserDialog:v4];

  id v5 = [(HMDEventTriggerExecutionSession *)self causingDevices];
  [v5 removeAllObjects];
}

- (void)_callExecutionComplete:(id)a3
{
}

- (void)_submitAnalyticsData:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  context = (void *)MEMORY[0x1D9452090]();
  id v5 = (void *)MEMORY[0x1E4F1CA48];
  id v6 = [(HMDEventTriggerExecutionSession *)self triggerEvents];
  id v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v8 = [(HMDEventTriggerExecutionSession *)self triggerEvents];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v44;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v44 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [*(id *)(*((void *)&v43 + 1) + 8 * v12) analyticsTriggerEventData];
        [v7 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [HomeKitEventTriggerExecutionSessionLogEvent alloc];
  [(HMDEventTriggerExecutionSession *)self executionStartTime];
  double v16 = v15;
  uint64_t v17 = [(HMDEventTriggerSession *)self sessionID];
  id v18 = [v17 UUIDString];
  uint64_t v19 = [(HomeKitEventTriggerExecutionSessionLogEvent *)v14 initWithStartTime:v18 sessionID:v16];

  uint64_t v20 = (void *)[v7 copy];
  id v21 = [(HomeKitEventTriggerExecutionSessionLogEvent *)v19 analyticsData];
  [v21 setTriggerEvents:v20];

  id v22 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v23 = [(HMDEventTriggerExecutionSession *)self endEvents];
  uint64_t v24 = objc_msgSend(v22, "arrayWithCapacity:", objc_msgSend(v23, "count"));

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v25 = [(HMDEventTriggerExecutionSession *)self endEvents];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v40;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v40 != v28) {
          objc_enumerationMutation(v25);
        }
        long long v30 = [*(id *)(*((void *)&v39 + 1) + 8 * v29) analyticsTriggerEventData];
        [v24 addObject:v30];

        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [v25 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v27);
  }

  long long v31 = (void *)[v24 copy];
  long long v32 = [(HomeKitEventTriggerExecutionSessionLogEvent *)v19 analyticsData];
  [v32 setEndEvents:v31];

  unint64_t v33 = [(HMDEventTriggerExecutionSession *)self executionState];
  long long v34 = [(HomeKitEventTriggerExecutionSessionLogEvent *)v19 analyticsData];
  [v34 setExecutionState:v33];

  uint64_t v35 = [v4 code];
  long long v36 = [(HomeKitEventTriggerExecutionSessionLogEvent *)v19 analyticsData];
  [v36 setResultErrorCode:v35];

  uint64_t v37 = +[HMDMetricsManager sharedLogEventSubmitter];
  [v37 submitLogEvent:v19 error:v4];
}

- (void)_callExecutionComplete:(id)a3 callDelegate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(HMDEventTriggerExecutionSession *)self executionCompleteCalled])
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    uint64_t v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v47 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Execution complete already called, ignoring", buf, 0xCu);
    }
  }
  else
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v11 = [(HMDEventTriggerExecutionSession *)self triggerEvents];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v42 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(id *)(*((void *)&v41 + 1) + 8 * i);
          if ([v16 conformsToProtocol:&unk_1F2E14870]) {
            uint64_t v17 = v16;
          }
          else {
            uint64_t v17 = 0;
          }
          id v18 = v17;

          if (v18) {
            [v18 didEndExecutionSession:self];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v41 objects:v50 count:16];
      }
      while (v13);
    }

    uint64_t v19 = (void *)MEMORY[0x1D9452090]([(HMDEventTriggerExecutionSession *)self _removeUserDialog]);
    uint64_t v20 = self;
    id v21 = HMFGetOSLogHandle();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
    id v36 = v6;
    if (v4)
    {
      if (v22)
      {
        uint64_t v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v47 = v23;
        __int16 v48 = 2114;
        id v49 = v6;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Informing that trigger action set execution is complete with error %{public}@", buf, 0x16u);
      }
      uint64_t v24 = [(HMDEventTriggerSession *)v20 eventTrigger];
      [v24 executionComplete:v20 error:v6];
    }
    else
    {
      if (v22)
      {
        uint64_t v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v47 = v25;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Not calling the delegate", buf, 0xCu);
      }
    }
    [(HMDEventTriggerExecutionSession *)v20 setSecureTriggerConfirmationTimer:0];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v26 = [(HMDEventTriggerExecutionSession *)v20 endEvents];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v38 != v29) {
            objc_enumerationMutation(v26);
          }
          long long v31 = *(void **)(*((void *)&v37 + 1) + 8 * j);
          long long v32 = (void *)MEMORY[0x1D9452090]();
          unint64_t v33 = v20;
          long long v34 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            uint64_t v35 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v47 = v35;
            __int16 v48 = 2112;
            id v49 = v31;
            _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_INFO, "%{public}@Deactivating end event %@", buf, 0x16u);
          }
          [v31 _activate:0 completionHandler:0];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v28);
    }

    id v6 = v36;
    if (!v36) {
      [(HMDEventTriggerExecutionSession *)v20 setExecutionState:6];
    }
    [(HMDEventTriggerExecutionSession *)v20 setExecutionCompleteCalled:1];
    [(HMDEventTriggerExecutionSession *)v20 _submitAnalyticsData:v36];
  }
}

- (id)valueInActionSetWriteResponse:(id)a3 actionSetUUID:(id)a4 accUUID:(id)a5 serviceID:(id)a6 characteristicID:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  uint64_t v14 = objc_msgSend(a3, "hmf_dictionaryForKey:", a4);
  double v15 = objc_msgSend(v14, "hmf_dictionaryForKey:", v13);

  id v16 = objc_msgSend(v15, "hmf_dictionaryForKey:", v12);

  uint64_t v17 = objc_msgSend(v16, "hmf_dictionaryForKey:", v11);

  id v18 = [v17 objectForKeyedSubscript:@"kCharacteristicValue"];

  return v18;
}

- (id)_monitoringEventsFromActionSetResponse:(id)a3
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v88 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [(HMDEventTriggerSession *)self eventTrigger];
  v89 = [v5 home];

  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  obuint64_t j = v4;
  uint64_t v74 = [obj countByEnumeratingWithState:&v112 objects:v127 count:16];
  if (v74)
  {
    uint64_t v73 = *(void *)v113;
    v93 = self;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v113 != v73) {
          objc_enumerationMutation(obj);
        }
        uint64_t v75 = v6;
        uint64_t v90 = *(void *)(*((void *)&v112 + 1) + 8 * v6);
        id v7 = objc_msgSend(obj, "hmf_dictionaryForKey:", v73);
        v79 = objc_msgSend(v7, "hmf_dictionaryForKey:", @"kCharacteristicValuesBeforeWrite");
        long long v108 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v108 objects:v126 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v109;
          uint64_t v76 = *(void *)v109;
          id v77 = v8;
          do
          {
            uint64_t v12 = 0;
            uint64_t v78 = v10;
            do
            {
              if (*(void *)v109 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = *(const char **)(*((void *)&v108 + 1) + 8 * v12);
              if ((HMFEqualObjects() & 1) == 0)
              {
                v84 = objc_msgSend(v79, "hmf_dictionaryForKey:", v13);
                uint64_t v14 = objc_msgSend(v8, "hmf_dictionaryForKey:", v13);
                v95 = v13;
                double v15 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v13];
                id v16 = [v89 accessoryWithUUID:v15];

                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  uint64_t v17 = v16;
                }
                else {
                  uint64_t v17 = 0;
                }
                id v18 = v17;

                v96 = v18;
                if (!v18)
                {
                  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v95];
                  uint64_t v20 = [v89 mediaProfileWithUUID:v19];

                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    id v21 = v20;
                  }
                  else {
                    id v21 = 0;
                  }
                  id v22 = v21;

                  if (v22)
                  {
                    uint64_t v23 = [v22 uniqueIdentifier];
                    uint64_t v24 = [v84 objectForKey:v23];

                    if ([v24 playbackState] == 1)
                    {

                      goto LABEL_69;
                    }
                    uint64_t v25 = [(HMDEventTriggerExecutionSession *)self mediaProfiles];
                    [v25 addObject:v22];
                  }
                }
                long long v106 = 0u;
                long long v107 = 0u;
                long long v104 = 0u;
                long long v105 = 0u;
                id v22 = v14;
                uint64_t v85 = [v22 countByEnumeratingWithState:&v104 objects:v125 count:16];
                if (v85)
                {
                  v80 = v14;
                  uint64_t v81 = v12;
                  uint64_t v82 = *(void *)v105;
                  v83 = v22;
                  while (1)
                  {
                    uint64_t v26 = 0;
                    do
                    {
                      if (*(void *)v105 != v82) {
                        objc_enumerationMutation(v22);
                      }
                      uint64_t v86 = v26;
                      uint64_t v27 = *(const char **)(*((void *)&v104 + 1) + 8 * v26);
                      uint64_t v28 = objc_msgSend(v22, "hmf_dictionaryForKey:", v27);
                      v94 = objc_msgSend(v84, "hmf_dictionaryForKey:", v27);
                      long long v100 = 0u;
                      long long v101 = 0u;
                      long long v102 = 0u;
                      long long v103 = 0u;
                      id v92 = v28;
                      uint64_t v98 = [v92 countByEnumeratingWithState:&v100 objects:v124 count:16];
                      if (v98)
                      {
                        uint64_t v97 = *(void *)v101;
                        v99 = v27;
                        do
                        {
                          uint64_t v29 = 0;
                          do
                          {
                            if (*(void *)v101 != v97) {
                              objc_enumerationMutation(v92);
                            }
                            long long v30 = *(void **)(*((void *)&v100 + 1) + 8 * v29);
                            long long v31 = HAPInstanceIDFromValue();
                            long long v32 = HAPInstanceIDFromValue();
                            unint64_t v33 = [v96 findCharacteristic:v31 forService:v32];

                            if (v33)
                            {
                              long long v34 = [v94 objectForKey:v30];
                              uint64_t v35 = [v34 objectForKey:@"kCharacteristicValue"];
                              id v36 = [v33 type];
                              int v37 = isRestoreSupportedForCharacteristic();

                              if (!v37) {
                                goto LABEL_39;
                              }
                              if (v35 && ([v35 isEqual:MEMORY[0x1E4F1CC28]] & 1) == 0)
                              {
                                v67 = (void *)MEMORY[0x1D9452090]();
                                v68 = self;
                                v69 = HMFGetOSLogHandle();
                                if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
                                {
                                  v70 = HMFGetLogIdentifier();
                                  *(_DWORD *)buf = 138543618;
                                  uint64_t v117 = (uint64_t)v70;
                                  __int16 v118 = 2112;
                                  v119 = (const char *)v33;
                                  _os_log_impl(&dword_1D49D5000, v69, OS_LOG_TYPE_INFO, "%{public}@Did not create write request for characteristic because it was ON prior to trigger, %@", buf, 0x16u);
                                }
                                uint64_t v27 = v99;
                              }
                              else
                              {
                                long long v38 = [v33 authorizationData];
                                long long v39 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v33 value:MEMORY[0x1E4F1CC28] authorizationData:v38 type:1];

                                long long v40 = [(HMDEventTriggerExecutionSession *)self writeRequests];
                                [v40 setObject:v39 forKey:v33];

LABEL_39:
                                long long v41 = (void *)MEMORY[0x1D9452090]();
                                long long v42 = self;
                                long long v43 = HMFGetOSLogHandle();
                                if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                                {
                                  uint64_t v44 = HMFGetLogIdentifier();
                                  long long v45 = (void *)v44;
                                  *(_DWORD *)buf = 138544130;
                                  long long v46 = "Did not create";
                                  if (v37) {
                                    long long v46 = "Created";
                                  }
                                  uint64_t v117 = v44;
                                  v47 = "is not";
                                  if (v37) {
                                    v47 = "is";
                                  }
                                  __int16 v118 = 2080;
                                  v119 = v46;
                                  __int16 v120 = 2080;
                                  v121 = v47;
                                  __int16 v122 = 2112;
                                  v123 = v33;
                                  _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_INFO, "%{public}@%s write request for characteristic because characteristic type %s supported for Duration Event, %@", buf, 0x2Au);

                                  self = v93;
                                }

                                uint64_t v27 = v99;
                                __int16 v48 = [(HMDEventTriggerExecutionSession *)v42 valueInActionSetWriteResponse:obj actionSetUUID:v90 accUUID:v95 serviceID:v99 characteristicID:v30];
                                if (v48)
                                {
                                  id v49 = [HMDCharacteristicEventModel alloc];
                                  v50 = [MEMORY[0x1E4F29128] UUID];
                                  uint64_t v51 = [(HMDBackingStoreModelObject *)v49 initWithUUID:v50];

                                  [(HMDCharacteristicEventModel *)v51 setAccessory:v95];
                                  v52 = HAPInstanceIDFromValue();
                                  [(HMDCharacteristicEventModel *)v51 setServiceID:v52];

                                  v53 = HAPInstanceIDFromValue();
                                  [(HMDCharacteristicEventModel *)v51 setCharacteristicID:v53];

                                  [(HMDCharacteristicEventModel *)v51 setEventValue:v48];
                                  v54 = [(HMDCharacteristicEvent *)[HMDCharacteristicMonitorEvent alloc] initWithModel:v51 home:v89];
                                  if (v54)
                                  {
                                    [v88 addObject:v54];
                                  }
                                  else
                                  {
                                    v63 = (void *)MEMORY[0x1D9452090]();
                                    v64 = v42;
                                    v65 = HMFGetOSLogHandle();
                                    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                                    {
                                      HMFGetLogIdentifier();
                                      v66 = v87 = v63;
                                      *(_DWORD *)buf = 138543618;
                                      uint64_t v117 = (uint64_t)v66;
                                      __int16 v118 = 2112;
                                      v119 = (const char *)v33;
                                      _os_log_impl(&dword_1D49D5000, v65, OS_LOG_TYPE_ERROR, "%{public}@Failed to create monitor event for %@", buf, 0x16u);

                                      v63 = v87;
                                    }
                                  }

                                  self = v93;
                                  uint64_t v27 = v99;
                                }
                                else
                                {
                                  v59 = (void *)MEMORY[0x1D9452090]();
                                  v60 = v42;
                                  v61 = HMFGetOSLogHandle();
                                  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                                  {
                                    v62 = HMFGetLogIdentifier();
                                    *(_DWORD *)buf = 138543618;
                                    uint64_t v117 = (uint64_t)v62;
                                    __int16 v118 = 2112;
                                    v119 = (const char *)v33;
                                    _os_log_impl(&dword_1D49D5000, v61, OS_LOG_TYPE_ERROR, "%{public}@No value reported in action set result, Not creating the monitor event for %@", buf, 0x16u);

                                    uint64_t v27 = v99;
                                  }
                                }
                              }
                              goto LABEL_60;
                            }
                            v55 = (void *)MEMORY[0x1D9452090]();
                            v56 = self;
                            v57 = HMFGetOSLogHandle();
                            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                            {
                              v58 = HMFGetLogIdentifier();
                              *(_DWORD *)buf = 138544130;
                              uint64_t v117 = (uint64_t)v58;
                              __int16 v118 = 2112;
                              v119 = v95;
                              __int16 v120 = 2112;
                              v121 = v27;
                              __int16 v122 = 2112;
                              v123 = v30;
                              _os_log_impl(&dword_1D49D5000, v57, OS_LOG_TYPE_ERROR, "%{public}@Could not find the characteristic %@/%@/%@", buf, 0x2Au);
                            }
LABEL_60:

                            ++v29;
                          }
                          while (v98 != v29);
                          uint64_t v71 = [v92 countByEnumeratingWithState:&v100 objects:v124 count:16];
                          uint64_t v98 = v71;
                        }
                        while (v71);
                      }

                      uint64_t v26 = v86 + 1;
                      id v22 = v83;
                    }
                    while (v86 + 1 != v85);
                    uint64_t v85 = [v83 countByEnumeratingWithState:&v104 objects:v125 count:16];
                    if (!v85)
                    {
                      uint64_t v11 = v76;
                      id v8 = v77;
                      uint64_t v10 = v78;
                      uint64_t v14 = v80;
                      uint64_t v12 = v81;
                      break;
                    }
                  }
                }
LABEL_69:
              }
              ++v12;
            }
            while (v12 != v10);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v108 objects:v126 count:16];
          }
          while (v10);
        }

        uint64_t v6 = v75 + 1;
      }
      while (v75 + 1 != v74);
      uint64_t v74 = [obj countByEnumeratingWithState:&v112 objects:v127 count:16];
    }
    while (v74);
  }

  return v88;
}

- (void)_activateEvents:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDEventTriggerSession *)self eventTrigger];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
        uint64_t v11 = [v5 msgDispatcher];
        uint64_t v12 = [(HMDEventTriggerSession *)self workQueue];
        [v10 configure:v5 messageDispatcher:v11 queue:v12 delegate:self];

        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __51__HMDEventTriggerExecutionSession__activateEvents___block_invoke;
        v14[3] = &unk_1E6A196E0;
        void v14[4] = self;
        v14[5] = v10;
        [v10 _activate:3 completionHandler:v14];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

void __51__HMDEventTriggerExecutionSession__activateEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__HMDEventTriggerExecutionSession__activateEvents___block_invoke_2;
    block[3] = &unk_1E6A19668;
    block[4] = *(void *)(a1 + 32);
    id v5 = v3;
    uint64_t v6 = *(void *)(a1 + 40);
    id v8 = v5;
    uint64_t v9 = v6;
    dispatch_async(v4, block);
  }
}

uint64_t __51__HMDEventTriggerExecutionSession__activateEvents___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    int v9 = 138543874;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Activating event failed with error %@, %@", (uint8_t *)&v9, 0x20u);
  }
  return [*(id *)(a1 + 32) _callExecutionComplete:*(void *)(a1 + 40)];
}

- (void)_activateMonitoringEvents
{
  id v3 = [(HMDEventTriggerExecutionSession *)self monitorEvents];
  [(HMDEventTriggerExecutionSession *)self _activateEvents:v3];
}

- (void)_activateDurationEvents
{
  id v3 = [(HMDEventTriggerExecutionSession *)self durationEndEvents];
  [(HMDEventTriggerExecutionSession *)self _activateEvents:v3];
}

- (void)_handleActionSetExecutionResponse:(id)a3 actionSetError:(id)a4 completion:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = [(HMDEventTriggerSession *)self eventTrigger];
  [v11 triggerFired];

  uint64_t v12 = (void *)MEMORY[0x1D9452090]();
  __int16 v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = HMFGetLogIdentifier();
    *(_DWORD *)v50 = 138543874;
    *(void *)&v50[4] = v15;
    *(_WORD *)&v50[12] = 2112;
    *(void *)&v50[14] = v9;
    __int16 v51 = 2112;
    id v52 = v8;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Action set execution responded with error %@ and response %@", v50, 0x20u);
  }
  long long v16 = _Block_copy(v10);
  long long v17 = v16;
  if (v16) {
    (*((void (**)(void *, id))v16 + 2))(v16, v9);
  }

  if (v9)
  {
    long long v18 = [v9 domain];
    if ([v18 isEqualToString:*MEMORY[0x1E4F2D140]])
    {
      uint64_t v19 = [v9 code];

      if (v19 == 64)
      {
        uint64_t v20 = (void *)MEMORY[0x1D9452090]();
        id v21 = v13;
        id v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          uint64_t v23 = HMFGetLogIdentifier();
          *(_DWORD *)v50 = 138543362;
          *(void *)&v50[4] = v23;
          _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Action set has resulted in partial success, proceeding with successful ones", v50, 0xCu);
        }
        goto LABEL_11;
      }
    }
    else
    {
    }
    unint64_t v33 = v13;
    id v34 = v9;
LABEL_22:
    -[HMDEventTriggerExecutionSession _callExecutionComplete:](v33, "_callExecutionComplete:", v34, *(_OWORD *)v50);
    goto LABEL_27;
  }
LABEL_11:
  uint64_t v24 = [(HMDEventTriggerExecutionSession *)v13 endEvents];
  uint64_t v25 = [v24 count];

  if (!v25)
  {
    uint64_t v35 = (void *)MEMORY[0x1D9452090]();
    id v36 = v13;
    int v37 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
LABEL_21:

      unint64_t v33 = v36;
      id v34 = 0;
      goto LABEL_22;
    }
    long long v38 = HMFGetLogIdentifier();
    *(_DWORD *)v50 = 138543362;
    *(void *)&v50[4] = v38;
    long long v39 = "%{public}@There are no end events, declaring execution is complete";
LABEL_20:
    _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_INFO, v39, v50, 0xCu);

    goto LABEL_21;
  }
  uint64_t v26 = [(HMDEventTriggerExecutionSession *)v13 _monitoringEventsFromActionSetResponse:v8];
  [(HMDEventTriggerExecutionSession *)v13 setMonitorEvents:v26];

  uint64_t v27 = (void *)MEMORY[0x1D9452090]();
  uint64_t v28 = v13;
  uint64_t v29 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    long long v30 = HMFGetLogIdentifier();
    long long v31 = [(HMDEventTriggerExecutionSession *)v28 monitorEvents];
    *(_DWORD *)v50 = 138543618;
    *(void *)&v50[4] = v30;
    *(_WORD *)&v50[12] = 2112;
    *(void *)&v50[14] = v31;
    _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_INFO, "%{public}@Created monitoring events %@", v50, 0x16u);
  }
  long long v32 = [(HMDEventTriggerExecutionSession *)v28 writeRequests];
  if (![v32 count])
  {
    long long v40 = [(HMDEventTriggerExecutionSession *)v28 mediaProfiles];
    uint64_t v41 = [v40 count];

    if (v41) {
      goto LABEL_24;
    }
    uint64_t v35 = (void *)MEMORY[0x1D9452090]();
    id v36 = v28;
    int v37 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_INFO)) {
      goto LABEL_21;
    }
    long long v38 = HMFGetLogIdentifier();
    *(_DWORD *)v50 = 138543362;
    *(void *)&v50[4] = v38;
    long long v39 = "%{public}@There are no characteristic writes or media profiles playback actions to perform upon restore, decla"
          "ring execution is complete";
    goto LABEL_20;
  }

LABEL_24:
  long long v42 = (void *)MEMORY[0x1D9452090]();
  long long v43 = v28;
  uint64_t v44 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    long long v45 = HMFGetLogIdentifier();
    *(_DWORD *)v50 = 138543362;
    *(void *)&v50[4] = v45;
    _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_INFO, "%{public}@There are end events with the execution session, activating them", v50, 0xCu);
  }
  [(HMDEventTriggerExecutionSession *)v43 _activateDurationEvents];
  [(HMDEventTriggerExecutionSession *)v43 setExecutionState:4];
  id v46 = objc_alloc(MEMORY[0x1E4F65580]);
  v47 = (void *)[v46 initWithTimeInterval:1 options:(double)(unint64_t)startCharacteristicsMonitorWaitPeriod];
  [(HMDEventTriggerExecutionSession *)v43 setStartCharacteristicsMonitorTimer:v47];

  __int16 v48 = [(HMDEventTriggerExecutionSession *)v43 startCharacteristicsMonitorTimer];
  [v48 setDelegate:v43];

  id v49 = [(HMDEventTriggerExecutionSession *)v43 startCharacteristicsMonitorTimer];
  [v49 resume];

LABEL_27:
}

- (void)_directlyExecuteActionSetsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(HMDEventTriggerExecutionSession *)self setActionSetExecutionInProgress:1];
  [(HMDEventTriggerExecutionSession *)self setSecureTriggerConfirmationTimer:0];
  objc_initWeak(&location, self);
  id v5 = [(HMDEventTriggerSession *)self eventTrigger];
  uint64_t v6 = [(HMDEventTriggerExecutionSession *)self actionSets];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__HMDEventTriggerExecutionSession__directlyExecuteActionSetsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E6A193F8;
  objc_copyWeak(&v10, &location);
  id v7 = v4;
  id v9 = v7;
  [v5 _executeActionSets:v6 captureCurrentState:1 completionHandler:v8];

  [(HMDEventTriggerExecutionSession *)self setExecutionState:3];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __83__HMDEventTriggerExecutionSession__directlyExecuteActionSetsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained workQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __83__HMDEventTriggerExecutionSession__directlyExecuteActionSetsWithCompletionHandler___block_invoke_69;
    v13[3] = &unk_1E6A18398;
    v13[4] = v8;
    id v14 = v6;
    id v15 = v5;
    id v16 = *(id *)(a1 + 32);
    dispatch_async(v9, v13);
  }
  else
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    __int16 v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v18 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Lost self while executing action set", buf, 0xCu);
    }
  }
}

uint64_t __83__HMDEventTriggerExecutionSession__directlyExecuteActionSetsWithCompletionHandler___block_invoke_69(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleActionSetExecutionResponse:*(void *)(a1 + 40) actionSetError:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)_addEvent:(id)a3 causingDevice:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(HMDEventTriggerExecutionSession *)self executionState] > 2)
  {
    uint64_t v16 = MEMORY[0x1D9452090]();
    long long v17 = self;
    long long v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      uint64_t v20 = HMDEventTriggerExecutionStateAsString([(HMDEventTriggerExecutionSession *)v17 executionState]);
      int v32 = 138543618;
      unint64_t v33 = v19;
      __int16 v34 = 2112;
      id v35 = v20;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Current state has moved beyond waiting for user response: %@", (uint8_t *)&v32, 0x16u);
    }
    id v15 = (void *)v16;
    goto LABEL_9;
  }
  id v8 = [(HMDEventTriggerExecutionSession *)self causingDevices];
  char v9 = [v8 containsObject:v7];

  id v10 = (void *)MEMORY[0x1D9452090]();
  __int16 v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v13)
    {
      id v14 = HMFGetLogIdentifier();
      int v32 = 138543618;
      unint64_t v33 = v14;
      __int16 v34 = 2112;
      id v35 = v7;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Device is already in the causing devices list, %@", (uint8_t *)&v32, 0x16u);
    }
    id v15 = v10;
LABEL_9:
    goto LABEL_17;
  }
  if (v13)
  {
    id v21 = HMFGetLogIdentifier();
    int v32 = 138543618;
    unint64_t v33 = v21;
    __int16 v34 = 2112;
    id v35 = v7;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Adding device to ask for confirmation, %@", (uint8_t *)&v32, 0x16u);
  }
  id v22 = [(HMDEventTriggerExecutionSession *)v11 causingDevices];
  [v22 addObject:v7];

  uint64_t v23 = [(HMDEventTriggerExecutionSession *)v11 triggerEvents];
  char v24 = [v23 containsObject:v6];

  if ((v24 & 1) == 0)
  {
    uint64_t v25 = (void *)MEMORY[0x1D9452090]();
    uint64_t v26 = v11;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      uint64_t v28 = HMFGetLogIdentifier();
      int v32 = 138543618;
      unint64_t v33 = v28;
      __int16 v34 = 2112;
      id v35 = v6;
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Adding event as an additional event, %@", (uint8_t *)&v32, 0x16u);
    }
    uint64_t v29 = [(HMDEventTriggerExecutionSession *)v26 triggerEvents];
    [v29 addObject:v6];
  }
  long long v30 = [(HMDEventTriggerExecutionSession *)v11 userConfirmationSession];
  [v30 askForUserPermission:v7];

  long long v31 = [(HMDEventTriggerExecutionSession *)v11 secureTriggerConfirmationTimer];
  [v31 resume];

LABEL_17:
}

- (void)addEvent:(id)a3 causingDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDEventTriggerSession *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__HMDEventTriggerExecutionSession_addEvent_causingDevice___block_invoke;
  block[3] = &unk_1E6A19668;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __58__HMDEventTriggerExecutionSession_addEvent_causingDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addEvent:*(void *)(a1 + 40) causingDevice:*(void *)(a1 + 48)];
}

- (void)_userResponse:(unint64_t)a3 device:(id)a4 completionHandler:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = [(HMDEventTriggerExecutionSession *)self secureTriggerConfirmationTimer];

  if (!v10)
  {
    uint64_t v20 = (void *)MEMORY[0x1D9452090]();
    id v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      int v48 = 138543362;
      id v49 = v23;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@There is no confirmation timer running, not processing the confirmation", (uint8_t *)&v48, 0xCu);
    }
    long long v17 = (void (**)(void *, void *))_Block_copy(v9);
    if (!v17) {
      goto LABEL_12;
    }
    long long v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = 58;
    goto LABEL_11;
  }
  BOOL v11 = [(HMDEventTriggerExecutionSession *)self actionSetExecutionInProgress];
  id v12 = (void *)MEMORY[0x1D9452090]();
  id v13 = self;
  id v14 = HMFGetOSLogHandle();
  id v15 = v14;
  if (v11)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      int v48 = 138543362;
      id v49 = v16;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Action set execution is already in progress", (uint8_t *)&v48, 0xCu);
    }
    long long v17 = (void (**)(void *, void *))_Block_copy(v9);
    if (!v17) {
      goto LABEL_12;
    }
    long long v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = 15;
LABEL_11:
    char v24 = [v18 hmErrorWithCode:v19];
    v17[2](v17, v24);

LABEL_12:
    goto LABEL_13;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v25 = HMFGetLogIdentifier();
    uint64_t v26 = HMDUserConfirmationResponseAsString(a3);
    int v48 = 138543874;
    id v49 = v25;
    __int16 v50 = 2112;
    id v51 = v8;
    __int16 v52 = 2112;
    uint64_t v53 = v26;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Received response from %@ with %@", (uint8_t *)&v48, 0x20u);
  }
  switch(a3)
  {
    case 1uLL:
    case 4uLL:
      uint64_t v27 = [(HMDEventTriggerExecutionSession *)v13 causingDevices];
      [v27 removeObject:v8];

      uint64_t v28 = [(HMDEventTriggerExecutionSession *)v13 causingDevices];
      uint64_t v29 = [v28 count];

      if (!v29)
      {
        long long v30 = (void *)MEMORY[0x1D9452090]();
        long long v31 = v13;
        int v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          unint64_t v33 = HMFGetLogIdentifier();
          int v48 = 138543362;
          id v49 = v33;
          _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_INFO, "%{public}@None of the devices have answered the dialog, ending the session", (uint8_t *)&v48, 0xCu);
        }
        __int16 v34 = _Block_copy(v9);
        id v35 = v34;
        if (v34) {
          (*((void (**)(void *, void))v34 + 2))(v34, 0);
        }

        uint64_t v36 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v37 = 3000;
        goto LABEL_31;
      }
      break;
    case 2uLL:
      long long v38 = (void *)MEMORY[0x1D9452090]();
      long long v39 = v13;
      long long v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        uint64_t v41 = HMFGetLogIdentifier();
        int v48 = 138543362;
        id v49 = v41;
        _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_INFO, "%{public}@User confirms to execute trigger", (uint8_t *)&v48, 0xCu);
      }
      [(HMDEventTriggerExecutionSession *)v39 _removeUserDialog];
      [(HMDEventTriggerExecutionSession *)v39 _directlyExecuteActionSetsWithCompletionHandler:v9];
      break;
    case 3uLL:
      long long v42 = (void *)MEMORY[0x1D9452090]();
      long long v31 = v13;
      long long v43 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        uint64_t v44 = HMFGetLogIdentifier();
        int v48 = 138543362;
        id v49 = v44;
        _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_INFO, "%{public}@User confirms not to execute trigger", (uint8_t *)&v48, 0xCu);
      }
      long long v45 = _Block_copy(v9);
      id v46 = v45;
      if (v45) {
        (*((void (**)(void *, void))v45 + 2))(v45, 0);
      }

      uint64_t v36 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v37 = 3001;
LABEL_31:
      v47 = [v36 hmInternalErrorWithCode:v37];
      [(HMDEventTriggerExecutionSession *)v31 _callExecutionComplete:v47];

      break;
    default:
      break;
  }
LABEL_13:
}

- (void)userResponse:(unint64_t)a3 device:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(HMDEventTriggerSession *)self workQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__HMDEventTriggerExecutionSession_userResponse_device_completionHandler___block_invoke;
  v13[3] = &unk_1E6A19850;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __73__HMDEventTriggerExecutionSession_userResponse_device_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _userResponse:*(void *)(a1 + 56) device:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (id)durationEndEvents
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(HMDEventTriggerExecutionSession *)self endEvents];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(id *)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v10 = v9;
        }
        else {
          id v10 = 0;
        }
        id v11 = v10;

        if (v11) {
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)postponeRestoreIfWaitingForEndEvent
{
  id v3 = [(HMDEventTriggerSession *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__HMDEventTriggerExecutionSession_postponeRestoreIfWaitingForEndEvent__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __70__HMDEventTriggerExecutionSession_postponeRestoreIfWaitingForEndEvent__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) executionState];
  if (result == 4)
  {
    id v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = HMFGetLogIdentifier();
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Waiting for end event, received request to postpone the end event", (uint8_t *)&v7, 0xCu);
    }
    return [*(id *)(a1 + 32) _activateDurationEvents];
  }
  return result;
}

- (void)cancelSessionIfWaitingForUserResponse
{
  id v3 = [(HMDEventTriggerSession *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__HMDEventTriggerExecutionSession_cancelSessionIfWaitingForUserResponse__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

void __72__HMDEventTriggerExecutionSession_cancelSessionIfWaitingForUserResponse__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) executionState] == 2)
  {
    v2 = (void *)MEMORY[0x1D9452090]();
    id v3 = *(id *)(a1 + 32);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = HMFGetLogIdentifier();
      int v8 = 138543362;
      uint64_t v9 = v5;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Waiting for user response, received request to cancel the session", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v6 = *(void **)(a1 + 32);
    int v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:23];
    [v6 _callExecutionComplete:v7];
  }
}

- (BOOL)containsSecureActionSet
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(HMDEventTriggerExecutionSession *)self actionSets];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) containsSecureCharacteristic])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_executeTriggerAfterEvaluatingCondition:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  uint64_t v6 = self;
  long long v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    long long v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v52 = v8;
    __int16 v53 = 2112;
    id v54 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Going to evaluate the trigger After evaluating : %@", buf, 0x16u);
  }
  if (v4)
  {
    id v49 = @"THIS_OBJECT";
    long long v9 = [(HMDEventTriggerExecutionSession *)v6 predicateUtilities];
    __int16 v50 = v9;
    long long v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];

    id v11 = (void *)MEMORY[0x1D9452090]();
    uint64_t v12 = v6;
    long long v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      long long v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v52 = v14;
      __int16 v53 = 2112;
      id v54 = v10;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Evaluating the trigger predicate using %@", buf, 0x16u);
    }
    [v4 allowEvaluation];
    long long v15 = [(HMDEventTriggerExecutionSession *)v12 predicateUtilities];
    char v16 = [v4 evaluateWithObject:v15 substitutionVariables:v10];

    if ((v16 & 1) == 0)
    {
      id v35 = (void *)MEMORY[0x1D9452090]();
      uint64_t v36 = v12;
      uint64_t v37 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        long long v38 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v52 = v38;
        _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_INFO, "%{public}@Trigger condition evaluated to NO, not firing action set", buf, 0xCu);
      }
      long long v39 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:3006];
      [(HMDEventTriggerExecutionSession *)v36 _callExecutionComplete:v39];

      goto LABEL_27;
    }
  }
  long long v17 = [(HMDEventTriggerExecutionSession *)v6 causingDevices];
  if ([v17 count])
  {
    BOOL v18 = [(HMDEventTriggerExecutionSession *)v6 containsSecureActionSet];

    if (v18)
    {
      uint64_t v19 = (void *)MEMORY[0x1D9452090]();
      uint64_t v20 = v6;
      id v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        id v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v52 = v22;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Location triggers that contain secure action sets should ask for a confirmation before execution", buf, 0xCu);
      }
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      uint64_t v23 = [(HMDEventTriggerExecutionSession *)v20 causingDevices];
      uint64_t v24 = [v23 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v45;
        do
        {
          uint64_t v27 = 0;
          do
          {
            if (*(void *)v45 != v26) {
              objc_enumerationMutation(v23);
            }
            uint64_t v28 = *(void *)(*((void *)&v44 + 1) + 8 * v27);
            uint64_t v29 = [(HMDEventTriggerExecutionSession *)v20 userConfirmationSession];
            [v29 askForUserPermission:v28];

            ++v27;
          }
          while (v25 != v27);
          uint64_t v25 = [v23 countByEnumeratingWithState:&v44 objects:v48 count:16];
        }
        while (v25);
      }

      long long v30 = [HMDTriggerConfirmationTimer alloc];
      long long v31 = [(HMDEventTriggerSession *)v20 sessionID];
      int v32 = [(HMDTriggerConfirmationTimer *)v30 initWithExecutionSessionID:v31 timeoutInterval:(double)(unint64_t)secureTriggerUserResponseTimeoutInSeconds];
      [(HMDEventTriggerExecutionSession *)v20 setSecureTriggerConfirmationTimer:v32];

      unint64_t v33 = [(HMDEventTriggerExecutionSession *)v20 secureTriggerConfirmationTimer];
      [v33 setDelegate:v20];

      __int16 v34 = [(HMDEventTriggerExecutionSession *)v20 secureTriggerConfirmationTimer];
      [v34 resume];

      [(HMDEventTriggerExecutionSession *)v20 setExecutionState:2];
      goto LABEL_27;
    }
  }
  else
  {
  }
  long long v40 = (void *)MEMORY[0x1D9452090]();
  uint64_t v41 = v6;
  long long v42 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    long long v43 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v52 = v43;
    _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_INFO, "%{public}@Directly executing action set as user confirmation is not required", buf, 0xCu);
  }
  [(HMDEventTriggerExecutionSession *)v41 _directlyExecuteActionSetsWithCompletionHandler:0];
LABEL_27:
}

- (void)_evaluateFiringTrigger
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  v2 = [(HMDEventTriggerExecutionSession *)self recurrences];
  uint64_t v3 = [v2 count];

  if (!v3) {
    goto LABEL_6;
  }
  id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v6 = [v4 components:512 fromDate:v5];

  long long v7 = (void *)MEMORY[0x1D9452090]();
  long long v8 = self;
  long long v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    long long v10 = HMFGetLogIdentifier();
    id v11 = [(HMDEventTriggerExecutionSession *)v8 recurrences];
    *(_DWORD *)buf = 138543874;
    id v80 = v10;
    __int16 v81 = 2112;
    uint64_t v82 = (uint64_t)v11;
    __int16 v83 = 2112;
    v84 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@recurrences : %@, dateComponents: %@", buf, 0x20u);
  }
  uint64_t v12 = [(HMDEventTriggerExecutionSession *)v8 recurrences];
  int v13 = [v12 containsObject:v6];

  if (v13)
  {

LABEL_6:
    long long v14 = [(HMDEventTriggerExecutionSession *)self evaluationCondition];

    if (v14)
    {
      v58 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      long long v15 = [(HMDEventTriggerExecutionSession *)self predicateUtilities];
      char v16 = [(HMDEventTriggerExecutionSession *)self evaluationCondition];
      id v76 = 0;
      v57 = [v15 rewritePredicate:v16 currentCharacteristicInPredicate:&v76 characteristicsToRead:v58 homePresence:0];
      id v56 = v76;

      long long v17 = (void *)MEMORY[0x1D9452090]();
      val = self;
      BOOL v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = HMFGetLogIdentifier();
        uint64_t v20 = [(HMDEventTriggerExecutionSession *)val evaluationCondition];
        *(_DWORD *)buf = 138543874;
        id v80 = v19;
        __int16 v81 = 2112;
        uint64_t v82 = (uint64_t)v20;
        __int16 v83 = 2112;
        v84 = v57;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Evaluation condition : %@, Re-written predicate : %@", buf, 0x20u);
      }
      if ([v58 count])
      {
        id v21 = [MEMORY[0x1E4F1CA48] array];
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        obuint64_t j = v58;
        uint64_t v22 = [obj countByEnumeratingWithState:&v72 objects:v78 count:16];
        if (v22)
        {
          uint64_t v60 = *(void *)v73;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v73 != v60) {
                objc_enumerationMutation(obj);
              }
              uint64_t v24 = *(void **)(*((void *)&v72 + 1) + 8 * i);
              uint64_t v25 = objc_msgSend(obj, "objectForKey:", v24, v56);
              uint64_t v26 = (void *)MEMORY[0x1D9452090]();
              uint64_t v27 = val;
              uint64_t v28 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                uint64_t v29 = HMFGetLogIdentifier();
                long long v30 = [v24 name];
                *(_DWORD *)buf = 138543618;
                id v80 = v29;
                __int16 v81 = 2112;
                uint64_t v82 = (uint64_t)v30;
                _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Going to read characteristics from accessory %@", buf, 0x16u);
              }
              long long v70 = 0u;
              long long v71 = 0u;
              long long v68 = 0u;
              long long v69 = 0u;
              id v31 = v25;
              uint64_t v32 = [v31 countByEnumeratingWithState:&v68 objects:v77 count:16];
              if (v32)
              {
                uint64_t v33 = *(void *)v69;
                do
                {
                  for (uint64_t j = 0; j != v32; ++j)
                  {
                    if (*(void *)v69 != v33) {
                      objc_enumerationMutation(v31);
                    }
                    id v35 = +[HMDCharacteristicRequest requestWithCharacteristic:*(void *)(*((void *)&v68 + 1) + 8 * j)];
                    [v21 addObject:v35];
                  }
                  uint64_t v32 = [v31 countByEnumeratingWithState:&v68 objects:v77 count:16];
                }
                while (v32);
              }
            }
            uint64_t v22 = [obj countByEnumeratingWithState:&v72 objects:v78 count:16];
          }
          while (v22);
        }

        objc_initWeak(&location, val);
        uint64_t v36 = [(HMDEventTriggerSession *)val eventTrigger];
        uint64_t v37 = [v36 home];
        long long v38 = [(HMDEventTriggerExecutionSession *)val description];
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __57__HMDEventTriggerExecutionSession__evaluateFiringTrigger__block_invoke;
        v63[3] = &unk_1E6A19048;
        objc_copyWeak(&v66, &location);
        id v39 = v21;
        id v64 = v39;
        id v65 = v57;
        [v37 readCharacteristicValues:v39 source:3 sourceForLogging:v38 qualityOfService:-1 withCompletionHandler:v63];

        long long v40 = (void *)MEMORY[0x1D9452090]([(HMDEventTriggerExecutionSession *)val setExecutionState:1]);
        uint64_t v41 = val;
        HMFGetOSLogHandle();
        long long v42 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          id v43 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v44 = [obj count];
          *(_DWORD *)buf = 138543618;
          id v80 = v43;
          __int16 v81 = 2048;
          uint64_t v82 = v44;
          _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_INFO, "%{public}@Waiting to read [%lu] characterics before executing the trigger", buf, 0x16u);
        }

        objc_destroyWeak(&v66);
        objc_destroyWeak(&location);
      }
      else
      {
        [(HMDEventTriggerExecutionSession *)val _executeTriggerAfterEvaluatingCondition:v57];
      }
    }
    else
    {
      uint64_t v50 = [(HMDEventTriggerExecutionSession *)self _executeTriggerAfterEvaluatingCondition:0];
    }
    id v51 = (void *)MEMORY[0x1D9452090](v50);
    __int16 v52 = self;
    __int16 v53 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      id v54 = HMFGetLogIdentifier();
      uint64_t v55 = HMDEventTriggerExecutionStateAsString([(HMDEventTriggerExecutionSession *)v52 executionState]);
      *(_DWORD *)buf = 138543618;
      id v80 = v54;
      __int16 v81 = 2112;
      uint64_t v82 = (uint64_t)v55;
      _os_log_impl(&dword_1D49D5000, v53, OS_LOG_TYPE_INFO, "%{public}@EventTrigger Evaluation State : [%@]", buf, 0x16u);
    }
    return;
  }
  long long v45 = (void *)MEMORY[0x1D9452090]();
  long long v46 = v8;
  long long v47 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    int v48 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v80 = v48;
    _os_log_impl(&dword_1D49D5000, v47, OS_LOG_TYPE_INFO, "%{public}@Trigger not fired since recurrence does not match", buf, 0xCu);
  }
  id v49 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:3005];
  [(HMDEventTriggerExecutionSession *)v46 _callExecutionComplete:v49];
}

void __57__HMDEventTriggerExecutionSession__evaluateFiringTrigger__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v5)
  {
    long long v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = WeakRetained;
    long long v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      uint64_t v24 = v11;
      __int16 v25 = 2112;
      id v26 = v5;
      __int16 v27 = 2112;
      id v28 = v12;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Failed to fulfill read requests before evaluating trigger due to error (%@), (%@)", buf, 0x20u);
    }
    [v9 _callExecutionComplete:v5];
  }
  else
  {
    int v13 = (void *)MEMORY[0x1D9452090]();
    if (WeakRetained)
    {
      id v14 = WeakRetained;
      long long v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        char v16 = HMFGetLogIdentifier();
        long long v17 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        uint64_t v24 = v16;
        __int16 v25 = 2112;
        id v26 = v17;
        __int16 v27 = 2112;
        id v28 = v6;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Finished read requests %@ with response %@", buf, 0x20u);
      }
      BOOL v18 = [v14 workQueue];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __57__HMDEventTriggerExecutionSession__evaluateFiringTrigger__block_invoke_64;
      v21[3] = &unk_1E6A197C8;
      v21[4] = v14;
      id v22 = *(id *)(a1 + 40);
      dispatch_async(v18, v21);
    }
    else
    {
      uint64_t v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v24 = v20;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Execution session is no more valid", buf, 0xCu);
      }
    }
  }
}

uint64_t __57__HMDEventTriggerExecutionSession__evaluateFiringTrigger__block_invoke_64(uint64_t a1)
{
  return [*(id *)(a1 + 32) _executeTriggerAfterEvaluatingCondition:*(void *)(a1 + 40)];
}

- (void)evaluateFiringTrigger
{
  uint64_t v3 = [(HMDEventTriggerSession *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__HMDEventTriggerExecutionSession_evaluateFiringTrigger__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __56__HMDEventTriggerExecutionSession_evaluateFiringTrigger__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _evaluateFiringTrigger];
}

- (void)setExecutionState:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1D9452090](self, a2);
  id v6 = self;
  long long v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    long long v8 = HMFGetLogIdentifier();
    id v9 = HMDEventTriggerExecutionStateAsString([(HMDEventTriggerExecutionSession *)v6 executionState]);
    long long v10 = HMDEventTriggerExecutionStateAsString(a3);
    int v11 = 138543874;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    id v14 = v9;
    __int16 v15 = 2114;
    char v16 = v10;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Setting the execution from %{public}@ to %{public}@", (uint8_t *)&v11, 0x20u);
  }
  v6->_executionState = a3;
}

- (id)dumpState
{
  v18.receiver = self;
  v18.super_class = (Class)HMDEventTriggerExecutionSession;
  uint64_t v3 = [(HMDEventTriggerSession *)&v18 dumpState];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = [(HMDEventTriggerExecutionSession *)self triggerEvents];
  id v6 = [v5 description];
  [v4 setObject:v6 forKeyedSubscript:@"triggering event"];

  long long v7 = [(HMDEventTriggerExecutionSession *)self monitorEvents];
  long long v8 = [v7 description];
  [v4 setObject:v8 forKeyedSubscript:@"monitored events"];

  [(HMDEventTriggerExecutionSession *)self restoreInProgress];
  id v9 = HMFBooleanToString();
  [v4 setObject:v9 forKeyedSubscript:@"restore in progress"];

  long long v10 = [(HMDEventTriggerExecutionSession *)self writeRequests];
  int v11 = [v10 description];
  [v4 setObject:v11 forKeyedSubscript:@"restore writes"];

  uint64_t v12 = [(HMDEventTriggerExecutionSession *)self mediaProfiles];
  __int16 v13 = [v12 description];
  [v4 setObject:v13 forKeyedSubscript:@"pause media profiles"];

  id v14 = [(HMDEventTriggerExecutionSession *)self secureTriggerConfirmationTimer];
  __int16 v15 = [v14 description];
  [v4 setObject:v15 forKeyedSubscript:@"trigger confirmation timer"];

  char v16 = (void *)[v4 copy];
  return v16;
}

- (BOOL)needsUserConfirmation
{
  v2 = [(HMDEventTriggerExecutionSession *)self causingDevices];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSString)description
{
  v2 = NSString;
  BOOL v3 = [(HMDEventTriggerSession *)self logString];
  id v4 = [v2 stringWithFormat:@"[Trigger Execution Session: %@]", v3];

  return (NSString *)v4;
}

- (HMDEventTriggerExecutionSession)initWithEventTrigger:(id)a3 predicateUtilities:(id)a4 triggerEvent:(id)a5 causingDevice:(id)a6 workQueue:(id)a7 actionSets:(id)a8 evaluationCondition:(id)a9 recurrences:(id)a10 endEvents:(id)a11 msgDispatcher:(id)a12
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  obuint64_t j = a4;
  id v51 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v50 = a8;
  id v49 = a9;
  id v48 = a10;
  id v47 = a11;
  id v21 = v19;
  id v22 = a12;
  uint64_t v23 = [MEMORY[0x1E4F29128] UUID];
  v54.receiver = self;
  v54.super_class = (Class)HMDEventTriggerExecutionSession;
  __int16 v53 = v20;
  uint64_t v24 = [(HMDEventTriggerSession *)&v54 initWithSessionID:v23 eventTrigger:v17 workQueue:v20 msgDispatcher:v22];

  if (v24)
  {
    v56[0] = v18;
    __int16 v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:1];
    uint64_t v26 = [v25 mutableCopy];
    triggerEvents = v24->_triggerEvents;
    v24->_triggerEvents = (NSMutableArray *)v26;

    objc_storeStrong((id *)&v24->_predicateUtilities, obj);
    objc_storeStrong((id *)&v24->_actionSets, a8);
    objc_storeStrong((id *)&v24->_evaluationCondition, a9);
    objc_storeStrong((id *)&v24->_recurrences, a10);
    objc_storeStrong((id *)&v24->_endEvents, a11);
    v24->_restoreInProgress = 0;
    uint64_t v28 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    writeRequests = v24->_writeRequests;
    v24->_writeRequests = (NSMapTable *)v28;

    long long v30 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    mediaProfiles = v24->_mediaProfiles;
    v24->_mediaProfiles = v30;

    v24->_executionState = 0;
    [MEMORY[0x1E4F6A278] currentTime];
    v24->_executionStartTime = v32;
    if (v21)
    {
      uint64_t v55 = v21;
      uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
      uint64_t v34 = [v33 mutableCopy];
      causingDevices = v24->_causingDevices;
      v24->_causingDevices = (NSMutableArray *)v34;

      uint64_t v36 = [HMDEventTriggerDevice alloc];
      uint64_t v37 = [v17 home];
      long long v38 = [(HMDEventTriggerDevice *)v36 initWithCurrentDeviceForHome:v37];

      id v39 = [HMDEventTriggerUserConfirmationSession alloc];
      [(HMDEventTriggerSession *)v24 sessionID];
      v41 = long long v40 = v21;
      uint64_t v42 = [(HMDEventTriggerUserConfirmationSession *)v39 initWithSessionID:v41 eventTrigger:v17 workQueue:v53 msgDispatcher:v22 requestingDevice:v38];
      userConfirmationSession = v24->_userConfirmationSession;
      v24->_userConfirmationSession = (HMDEventTriggerUserConfirmationSession *)v42;

      id v21 = v40;
      [(HMDEventTriggerUserConfirmationSession *)v24->_userConfirmationSession setExecutionSession:v24];
    }
    uint64_t v44 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v44 addObserver:v24 selector:sel_handleSessionPlaybackStateUpdatedNotification_ name:@"HMDMediaSessionDidUpdatePlaybackStateNotification" object:0];
  }
  return v24;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_179818 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_179818, &__block_literal_global_179819);
  }
  v2 = (void *)logCategory__hmf_once_v1_179820;
  return v2;
}

uint64_t __46__HMDEventTriggerExecutionSession_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_179820;
  logCategory__hmf_once_v1_179820 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end