@interface HMDHAPAccessoryRemoteOperationTask
- (BOOL)_appendServiceListWithRequest:(id)a3 serviceList:(id)a4;
- (BOOL)_buildMessageAccessoryListFromAccessoryRequestMap:(id)a3 accessoryList:(id)a4;
- (BOOL)_buildMessageAccessoryListFromRequests:(id)a3 accessoryList:(id)a4;
- (BOOL)isFinished;
- (HMDDevice)delegateDevice;
- (HMDHAPAccessoryRemoteOperationTask)initWithContext:(id)a3 remoteMessageName:(id)a4 requests:(id)a5 delegateDevice:(id)a6 timeout:(double)a7 completion:(id)a8;
- (NSDictionary)logEvents;
- (NSString)remoteMessageName;
- (double)remoteMessageTimeout;
- (id)_remoteMessageFromAccessoryRequestMap:(id)a3;
- (id)activityRequestEventName;
- (void)_receivedRemotelyChangedCharacteristicResponses:(id)a3 message:(id)a4;
- (void)execute;
- (void)setFinished:(BOOL)a3;
@end

@implementation HMDHAPAccessoryRemoteOperationTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEvents, 0);
  objc_storeStrong((id *)&self->_delegateDevice, 0);
  objc_storeStrong((id *)&self->_remoteMessageName, 0);
}

- (double)remoteMessageTimeout
{
  return self->_remoteMessageTimeout;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (NSDictionary)logEvents
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (HMDDevice)delegateDevice
{
  return (HMDDevice *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)remoteMessageName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)_appendServiceListWithRequest:(id)a3 serviceList:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  v10 = NSString;
  v11 = NSStringFromSelector(a2);
  v12 = [v10 stringWithFormat:@"%@ is unavailable", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (BOOL)_buildMessageAccessoryListFromRequests:(id)a3 accessoryList:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id obj = a3;
  id v36 = a4;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v6 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v41;
    uint64_t v32 = *(void *)v41;
    v33 = self;
    do
    {
      uint64_t v10 = 0;
      uint64_t v34 = v7;
      do
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v40 + 1) + 8 * v10);
        v12 = [v11 characteristic];
        id v13 = [v11 service];
        v14 = [v11 accessory];
        v15 = v14;
        if (v14) {
          BOOL v16 = v13 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (!v16 && v12 != 0)
        {
          int v18 = v8;
          v19 = [v14 uuid];
          v20 = [v19 UUIDString];

          v21 = objc_msgSend(v36, "hmf_mutableDictionaryForKey:", v20);
          if (!v21)
          {
            v21 = [MEMORY[0x1E4F1CA60] dictionary];
            [v36 setObject:v21 forKeyedSubscript:v20];
          }
          v22 = [(HMDHAPAccessoryTask *)self context];
          int v23 = [v22 isShortActionOperation];

          int v24 = v18;
          if (v23)
          {
            [v36 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"kShortActionKey"];
            int v24 = 1;
          }
          if ([v15 hasBTLELink] && (objc_msgSend(v15, "hasIPLink") & 1) == 0)
          {
            char v39 = 0;
            uint64_t v38 = 5;
            v25 = [v15 home];
            v26 = [v15 identifier];
            id v37 = 0;
            [v25 retrieveStateForTrackedAccessory:v26 stateNumber:0 isReachable:&v39 linkQuality:&v38 lastSeen:&v37];
            id v31 = v37;

            if (v39)
            {
              v27 = [NSNumber numberWithUnsignedInteger:v38];
              v28 = [v36 objectForKeyedSubscript:v20];
              [v28 setObject:v27 forKeyedSubscript:@"kAccessoryLinkQuality"];

              v29 = [v36 objectForKeyedSubscript:v20];
              [v29 setObject:v31 forKeyedSubscript:@"kAccessoryLastSeen"];
            }
          }
          self = v33;
          int v8 = [(HMDHAPAccessoryRemoteOperationTask *)v33 _appendServiceListWithRequest:v11 serviceList:v21] | v24;

          uint64_t v7 = v34;
          uint64_t v9 = v32;
        }

        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v7);
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8 & 1;
}

- (BOOL)_buildMessageAccessoryListFromAccessoryRequestMap:(id)a3 accessoryList:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    int v10 = 0;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v6);
        }
        id v13 = [v6 objectForKey:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        v10 |= [(HMDHAPAccessoryRemoteOperationTask *)self _buildMessageAccessoryListFromRequests:v13 accessoryList:v7];
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10 & 1;
}

- (id)_remoteMessageFromAccessoryRequestMap:(id)a3
{
  v51[5] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = [v4 dictionary];
  BOOL v7 = [(HMDHAPAccessoryRemoteOperationTask *)self _buildMessageAccessoryListFromAccessoryRequestMap:v5 accessoryList:v6];

  if ([v6 count])
  {
    if (v7)
    {
      unsigned int v8 = 1;
    }
    else
    {
      int v10 = [(HMDHAPAccessoryTask *)self context];
      uint64_t v11 = [v10 requestMessage];
      unsigned int v8 = [v11 BOOLForKey:@"kShortActionKey"];
    }
    v12 = [(HMDHAPAccessoryTask *)self context];
    id v13 = [v12 requestMessage];
    v14 = [v13 uuidForKey:@"kActionSetUUID"];

    if (v14) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = v8;
    }
    v47 = (void *)MEMORY[0x1E4F1CA60];
    v49 = v6;
    v50[0] = @"kAccessoriesListKey";
    v46 = (void *)[v6 copy];
    v51[0] = v46;
    v50[1] = @"kHomeUUID";
    long long v16 = [(HMDHAPAccessoryTask *)self context];
    long long v17 = [v16 homeUniqueIdentifier];
    long long v18 = [v17 UUIDString];
    v51[1] = v18;
    v50[2] = @"kShortActionKey";
    v19 = [NSNumber numberWithBool:v15];
    v51[2] = v19;
    v50[3] = @"kDoNotForwardMessageKey";
    uint64_t v20 = NSNumber;
    v21 = [(HMDHAPAccessoryRemoteOperationTask *)self delegateDevice];
    v22 = [v20 numberWithInt:v21 != 0];
    v51[3] = v22;
    v50[4] = @"kRequestIdentifierKey";
    int v23 = [(HMDHAPAccessoryTask *)self requestIdentifier];
    int v24 = [v23 UUIDString];
    v51[4] = v24;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:5];
    v48 = [v47 dictionaryWithDictionary:v25];

    v26 = [(HMDHAPAccessoryRemoteOperationTask *)self remoteMessageName];
    v27 = [(HMDHAPAccessoryTask *)self context];
    v28 = [v27 requestMessage];
    v29 = [v28 name];
    LODWORD(v17) = [v29 isEqualToString:@"kCharacteristicReadRequestKey"];

    if (v17)
    {
      v30 = [(HMDHAPAccessoryTask *)self context];
      id v31 = [v30 requestMessage];
      uint64_t v32 = [v31 name];

      v33 = [(HMDHAPAccessoryTask *)self context];
      uint64_t v34 = [v33 requestMessage];
      v35 = [v34 messagePayload];
      id v36 = v48;
      [v48 addEntriesFromDictionary:v35];

      v26 = (void *)v32;
    }
    else
    {
      id v36 = v48;
    }
    id v6 = v49;
    if ([(HMDHAPAccessoryTask *)self supportsMultiPartResponse])
    {
      id v37 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHAPAccessoryTask supportsMultiPartResponse](self, "supportsMultiPartResponse"));
      [v36 setObject:v37 forKeyedSubscript:@"kMultiPartResponseKey"];
    }
    uint64_t v38 = [(HMDHAPAccessoryTask *)self context];
    uint64_t v39 = [v38 qualityOfService];

    if (v39 <= 17) {
      uint64_t v40 = 17;
    }
    else {
      uint64_t v40 = v39;
    }
    long long v41 = (void *)MEMORY[0x1E4F654B0];
    long long v42 = [(HMDHAPAccessoryTask *)self context];
    long long v43 = [v42 homeMessageDestination];
    v44 = (void *)[v36 copy];
    uint64_t v9 = [v41 messageWithName:v26 qualityOfService:v40 destination:v43 payload:v44];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)activityRequestEventName
{
  v2 = NSString;
  v3 = [(HMDHAPAccessoryTask *)self operationName];
  v4 = [v3 capitalizedString];
  id v5 = [v2 stringWithFormat:@"HMDHAPAccessoryRemoteOperationTask.Forward%@sToResident", v4];

  return v5;
}

- (void)_receivedRemotelyChangedCharacteristicResponses:(id)a3 message:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  BOOL v7 = [(HMDHAPAccessoryTask *)self workQueue];
  dispatch_assert_queue_V2(v7);

  if ([v14 count]
    && [(HMDHAPAccessoryTask *)self supportsMultiPartResponse]
    && ![(HMDHAPAccessoryRemoteOperationTask *)self isFinished])
  {
    unsigned int v8 = [(HMDHAPAccessoryTask *)self completion];
    ((void (**)(void, id))v8)[2](v8, v14);

    if ([(HMDHAPAccessoryTask *)self allResponsesReceived]) {
      [(HMDHAPAccessoryRemoteOperationTask *)self setFinished:1];
    }
    uint64_t v9 = objc_opt_class();
    int v10 = [(HMDHAPAccessoryRemoteOperationTask *)self logEvents];
    uint64_t v11 = [v6 userInfo];
    v12 = [(HMDHAPAccessoryTask *)self requestIdentifier];
    id v13 = [v12 UUIDString];
    [v9 updateLogEvents:v10 withResponses:v14 remoteMessageResponse:v11 forTaskID:v13 shouldSubmit:1];
  }
}

- (void)execute
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1C9C8] date];
  [(HMDHAPAccessoryTask *)self setExecutionTime:v3];

  id v31 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(HMDHAPAccessoryTask *)self requests];
  id v5 = [(HMDHAPAccessoryTask *)self context];
  id v6 = [v5 user];
  BOOL v7 = accessoryRequestMapFromRequests(v4, v31, v6);

  [(HMDHAPAccessoryTask *)self addCharacteristicResponses:v31 isRemote:0];
  unsigned int v8 = [(HMDHAPAccessoryRemoteOperationTask *)self _remoteMessageFromAccessoryRequestMap:v7];
  [(HMDHAPAccessoryRemoteOperationTask *)self remoteMessageTimeout];
  objc_msgSend(v8, "setTimeout:");
  uint64_t v9 = [v8 messagePayload];
  int v10 = [v9 objectForKeyedSubscript:@"kAccessoriesListKey"];
  id obj = [(HMDHAPAccessoryTask *)self logEventsFromAccessoryRequestMap:v7 accessoryList:v10];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v39 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        long long v16 = [(HMDHAPAccessoryTask *)self activity];
        [(HMDHAPAccessoryRemoteOperationTask *)self activityRequestEventName];

        [(HMDHAPAccessoryTask *)self operationName];
        [v15 uuid];
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v12);
  }

  long long v17 = dispatch_group_create();
  dispatch_group_enter(v17);
  objc_initWeak(&location, self);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __45__HMDHAPAccessoryRemoteOperationTask_execute__block_invoke;
  v33[3] = &unk_1E6A19048;
  objc_copyWeak(&v36, &location);
  id v29 = v11;
  id v34 = v29;
  long long v18 = v17;
  v35 = v18;
  [v8 setResponseHandler:v33];
  objc_storeStrong((id *)&self->_logEvents, obj);
  v19 = (void *)MEMORY[0x1D9452090]();
  uint64_t v20 = self;
  HMFGetOSLogHandle();
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    int v23 = objc_msgSend(v8, "shortDescription", v29);
    int v24 = [(HMDHAPAccessoryRemoteOperationTask *)v20 delegateDevice];
    v25 = [v24 shortDescription];
    *(_DWORD *)buf = 138544130;
    id v43 = v22;
    __int16 v44 = 2114;
    uint64_t v45 = v20;
    __int16 v46 = 2114;
    v47 = v23;
    __int16 v48 = 2114;
    v49 = v25;
    _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Dispatching message: %{public}@ to device: %{public}@", buf, 0x2Au);
  }
  v26 = [(HMDHAPAccessoryTask *)v20 context];
  v27 = [(HMDHAPAccessoryRemoteOperationTask *)v20 delegateDevice];
  [v26 dispatchMessage:v8 delegateDevice:v27];

  v28 = [(HMDHAPAccessoryTask *)v20 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__HMDHAPAccessoryRemoteOperationTask_execute__block_invoke_307;
  block[3] = &unk_1E6A19B30;
  block[4] = v20;
  dispatch_group_notify(v18, v28, block);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);
}

void __45__HMDHAPAccessoryRemoteOperationTask_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v42 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unsigned int v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      id v38 = v6;
      id v39 = v5;
      uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id obj = *(id *)(a1 + 32);
      uint64_t v43 = [obj countByEnumeratingWithState:&v48 objects:v61 count:16];
      if (v43)
      {
        uint64_t v41 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v43; ++i)
          {
            if (*(void *)v49 != v41) {
              objc_enumerationMutation(obj);
            }
            id v11 = [*(id *)(v42 + 32) objectForKey:*(void *)(*((void *)&v48 + 1) + 8 * i)];
            long long v44 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            uint64_t v12 = [v11 countByEnumeratingWithState:&v44 objects:v60 count:16];
            if (v12)
            {
              uint64_t v13 = v12;
              uint64_t v14 = *(void *)v45;
              do
              {
                for (uint64_t j = 0; j != v13; ++j)
                {
                  if (*(void *)v45 != v14) {
                    objc_enumerationMutation(v11);
                  }
                  uint64_t v16 = *(void *)(*((void *)&v44 + 1) + 8 * j);
                  long long v17 = [v8 requestToResponseMap];
                  long long v18 = [v17 objectForKey:v16];

                  if (!v18) {
                    [v9 addObject:v16];
                  }
                }
                uint64_t v13 = [v11 countByEnumeratingWithState:&v44 objects:v60 count:16];
              }
              while (v13);
            }
          }
          uint64_t v43 = [obj countByEnumeratingWithState:&v48 objects:v61 count:16];
        }
        while (v43);
      }

      id v5 = v39;
      v19 = +[HMDCharacteristicResponse responsesWithRequests:v9 error:v39];
      uint64_t v20 = (void *)MEMORY[0x1D9452090]();
      id v21 = v8;
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = HMFGetLogIdentifier();
        uint64_t v24 = [v19 count];
        *(_DWORD *)buf = 138544130;
        v53 = v23;
        __int16 v54 = 2112;
        id v55 = v21;
        __int16 v56 = 2048;
        uint64_t v57 = v24;
        __int16 v58 = 2112;
        id v59 = v39;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Received remote characteristic responses: [%ld] with error: %@", buf, 0x2Au);
      }

      id v6 = v38;
    }
    else
    {
      v28 = [WeakRetained requests];
      v19 = +[HMDCharacteristicResponse responsesWithRequests:v28 characteristicUpdateDictionary:v6];

      id v29 = (void *)MEMORY[0x1D9452090]();
      id v30 = v8;
      id v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v53 = v32;
        __int16 v54 = 2112;
        id v55 = v30;
        __int16 v56 = 2048;
        uint64_t v57 = [v19 count];
        _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Received remote characteristic responses: [%ld]", buf, 0x20u);
      }
    }
    [v8 addCharacteristicResponses:v19 isRemote:1];
    v33 = [v8 characteristicResponses];
    [v8 _updateCharacteristicsWithResponses:v33 accessoryRequests:*(void *)(v42 + 32) completedGroup:*(void *)(v42 + 40)];

    id v34 = objc_opt_class();
    v35 = [v8 logEvents];
    id v36 = [v8 requestIdentifier];
    id v37 = [v36 UUIDString];
    [v34 updateLogEvents:v35 withResponses:v19 remoteMessageResponse:v6 forTaskID:v37 shouldSubmit:0];
  }
  else
  {
    v25 = (void *)MEMORY[0x1D9452090]();
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v53 = v27;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Lost self reference for remote operation message response handler", buf, 0xCu);
    }
  }
}

void __45__HMDHAPAccessoryRemoteOperationTask_execute__block_invoke_307(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isFinished] & 1) == 0)
  {
    [*(id *)(a1 + 32) setFinished:1];
    v3 = [*(id *)(a1 + 32) completion];
    v2 = [*(id *)(a1 + 32) characteristicResponses];
    v3[2](v3, v2);
  }
}

- (HMDHAPAccessoryRemoteOperationTask)initWithContext:(id)a3 remoteMessageName:(id)a4 requests:(id)a5 delegateDevice:(id)a6 timeout:(double)a7 completion:(id)a8
{
  id v15 = a4;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMDHAPAccessoryRemoteOperationTask;
  long long v17 = [(HMDHAPAccessoryTask *)&v20 initWithContext:a3 requests:a5 completion:a8];
  long long v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_remoteMessageName, a4);
    objc_storeStrong((id *)&v18->_delegateDevice, a6);
    v18->_remoteMessageTimeout = a7;
  }

  return v18;
}

@end