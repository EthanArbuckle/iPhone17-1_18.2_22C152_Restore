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
  v8 = (void *)MEMORY[0x263EFF940];
  uint64_t v9 = *MEMORY[0x263EFF498];
  v10 = NSString;
  v11 = NSStringFromSelector(a2);
  v12 = [v10 stringWithFormat:@"%@ is unavailable", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (BOOL)_buildMessageAccessoryListFromRequests:(id)a3 accessoryList:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
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
            v21 = [MEMORY[0x263EFF9A0] dictionary];
            [v36 setObject:v21 forKeyedSubscript:v20];
          }
          v22 = [(HMDHAPAccessoryTask *)self context];
          int v23 = [v22 isShortActionOperation];

          int v24 = v18;
          if (v23)
          {
            [v36 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"kShortActionKey"];
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
  uint64_t v20 = *MEMORY[0x263EF8340];
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
  v57[5] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263EFF9A0];
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
    v52 = (void *)MEMORY[0x263EFF9A0];
    v55 = v6;
    v56[0] = @"kAccessoriesListKey";
    v54 = (void *)[v6 copy];
    v57[0] = v54;
    v56[1] = @"kHomeUUID";
    v53 = [(HMDHAPAccessoryTask *)self context];
    long long v16 = [v53 homeUniqueIdentifier];
    long long v17 = [v16 UUIDString];
    v57[1] = v17;
    v56[2] = @"kShortActionKey";
    long long v18 = [NSNumber numberWithBool:v15];
    v57[2] = v18;
    v56[3] = @"kDoNotForwardMessageKey";
    v19 = NSNumber;
    uint64_t v20 = [(HMDHAPAccessoryRemoteOperationTask *)self delegateDevice];
    v21 = [v19 numberWithInt:v20 != 0];
    v57[3] = v21;
    v56[4] = @"kRequestIdentifierKey";
    v22 = [(HMDHAPAccessoryTask *)self requestIdentifier];
    int v23 = [v22 UUIDString];
    v57[4] = v23;
    int v24 = [NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:5];
    v25 = [v52 dictionaryWithDictionary:v24];

    v26 = [(HMDHAPAccessoryTask *)self context];
    v27 = [v26 requestMessage];
    v28 = [v27 numberForKey:@"kMessageOriginalSourceKey"];

    if (v28) {
      [v25 setObject:v28 forKeyedSubscript:@"kMessageOriginalSourceKey"];
    }
    v29 = [(HMDHAPAccessoryTask *)self context];
    v30 = [v29 requestMessage];
    id v31 = [v30 stringForKey:@"kMessageUserOverrideKey"];

    if (v31) {
      [v25 setObject:v31 forKeyedSubscript:@"kMessageUserOverrideKey"];
    }
    uint64_t v32 = [(HMDHAPAccessoryRemoteOperationTask *)self remoteMessageName];
    v33 = [(HMDHAPAccessoryTask *)self context];
    uint64_t v34 = [v33 requestMessage];
    v35 = [v34 name];
    int v36 = [v35 isEqualToString:@"kCharacteristicReadRequestKey"];

    if (v36)
    {
      id v37 = [(HMDHAPAccessoryTask *)self context];
      uint64_t v38 = [v37 requestMessage];
      uint64_t v39 = [v38 name];

      long long v40 = [(HMDHAPAccessoryTask *)self context];
      long long v41 = [v40 requestMessage];
      long long v42 = [v41 messagePayload];
      [v25 addEntriesFromDictionary:v42];

      uint64_t v32 = (void *)v39;
    }
    if ([(HMDHAPAccessoryTask *)self supportsMultiPartResponse])
    {
      long long v43 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHAPAccessoryTask supportsMultiPartResponse](self, "supportsMultiPartResponse"));
      [v25 setObject:v43 forKeyedSubscript:@"kMultiPartResponseKey"];
    }
    v44 = [(HMDHAPAccessoryTask *)self context];
    uint64_t v45 = [v44 qualityOfService];

    if (v45 <= 17) {
      uint64_t v46 = 17;
    }
    else {
      uint64_t v46 = v45;
    }
    v47 = (void *)MEMORY[0x263F42590];
    v48 = [(HMDHAPAccessoryTask *)self context];
    v49 = [v48 homeMessageDestination];
    v50 = (void *)[v25 copy];
    uint64_t v9 = [v47 messageWithName:v32 qualityOfService:v46 destination:v49 payload:v50];

    id v6 = v55;
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
  uint64_t v51 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF910] date];
  [(HMDHAPAccessoryTask *)self setExecutionTime:v3];

  id v31 = [MEMORY[0x263EFF980] array];
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
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __45__HMDHAPAccessoryRemoteOperationTask_execute__block_invoke;
  v33[3] = &unk_264A2E890;
  objc_copyWeak(&v36, &location);
  id v29 = v11;
  id v34 = v29;
  long long v18 = v17;
  v35 = v18;
  [v8 setResponseHandler:v33];
  objc_storeStrong((id *)&self->_logEvents, obj);
  v19 = (void *)MEMORY[0x230FBD990]();
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
    _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Dispatching message: %{public}@ to device: %{public}@", buf, 0x2Au);
  }
  v26 = [(HMDHAPAccessoryTask *)v20 context];
  v27 = [(HMDHAPAccessoryRemoteOperationTask *)v20 delegateDevice];
  [v26 dispatchMessage:v8 delegateDevice:v27];

  v28 = [(HMDHAPAccessoryTask *)v20 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__HMDHAPAccessoryRemoteOperationTask_execute__block_invoke_301;
  block[3] = &unk_264A2F7F8;
  block[4] = v20;
  dispatch_group_notify(v18, v28, block);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);
}

void __45__HMDHAPAccessoryRemoteOperationTask_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v45 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unsigned int v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      id v41 = v6;
      id v42 = v5;
      uint64_t v9 = [MEMORY[0x263EFF980] array];
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id obj = *(id *)(a1 + 32);
      uint64_t v46 = [obj countByEnumeratingWithState:&v51 objects:v64 count:16];
      if (v46)
      {
        uint64_t v44 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v46; ++i)
          {
            if (*(void *)v52 != v44) {
              objc_enumerationMutation(obj);
            }
            id v11 = [*(id *)(v45 + 32) objectForKey:*(void *)(*((void *)&v51 + 1) + 8 * i)];
            long long v47 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            uint64_t v12 = [v11 countByEnumeratingWithState:&v47 objects:v63 count:16];
            if (v12)
            {
              uint64_t v13 = v12;
              uint64_t v14 = *(void *)v48;
              do
              {
                for (uint64_t j = 0; j != v13; ++j)
                {
                  if (*(void *)v48 != v14) {
                    objc_enumerationMutation(v11);
                  }
                  uint64_t v16 = *(void *)(*((void *)&v47 + 1) + 8 * j);
                  long long v17 = [v8 requestToResponseMap];
                  long long v18 = [v17 objectForKey:v16];

                  if (!v18) {
                    [v9 addObject:v16];
                  }
                }
                uint64_t v13 = [v11 countByEnumeratingWithState:&v47 objects:v63 count:16];
              }
              while (v13);
            }
          }
          uint64_t v46 = [obj countByEnumeratingWithState:&v51 objects:v64 count:16];
        }
        while (v46);
      }

      id v5 = v42;
      v19 = +[HMDCharacteristicResponse responsesWithRequests:v9 error:v42];
      uint64_t v20 = (void *)MEMORY[0x230FBD990]();
      id v21 = v8;
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = HMFGetLogIdentifier();
        uint64_t v24 = [v19 count];
        *(_DWORD *)buf = 138544130;
        v56 = v23;
        __int16 v57 = 2112;
        id v58 = v21;
        __int16 v59 = 2048;
        uint64_t v60 = v24;
        __int16 v61 = 2112;
        id v62 = v42;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Received remote characteristic responses: [%ld] with error: %@", buf, 0x2Au);
      }

      id v6 = v41;
    }
    else
    {
      v28 = [WeakRetained requests];
      v19 = +[HMDCharacteristicResponse responsesWithRequests:v28 characteristicUpdateDictionary:v6];

      id v29 = (void *)MEMORY[0x230FBD990]();
      id v30 = v8;
      id v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v56 = v32;
        __int16 v57 = 2112;
        id v58 = v30;
        __int16 v59 = 2048;
        uint64_t v60 = [v19 count];
        _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Received remote characteristic responses: [%ld]", buf, 0x20u);
      }
    }
    [v8 addCharacteristicResponses:v19 isRemote:1];
    v33 = [v8 context];
    id v34 = [v33 home];
    char v35 = [v34 isCurrentDevicePrimaryResident];

    if ((v35 & 1) == 0)
    {
      id v36 = [v8 characteristicResponses];
      [v8 _updateCharacteristicsWithResponses:v36 accessoryRequests:*(void *)(v45 + 32) completedGroup:*(void *)(v45 + 40)];
    }
    id v37 = objc_opt_class();
    long long v38 = [v8 logEvents];
    long long v39 = [v8 requestIdentifier];
    long long v40 = [v39 UUIDString];
    [v37 updateLogEvents:v38 withResponses:v19 remoteMessageResponse:v6 forTaskID:v40 shouldSubmit:0];
  }
  else
  {
    v25 = (void *)MEMORY[0x230FBD990]();
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v56 = v27;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Lost self reference for remote operation message response handler", buf, 0xCu);
    }
  }
}

void __45__HMDHAPAccessoryRemoteOperationTask_execute__block_invoke_301(uint64_t a1)
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