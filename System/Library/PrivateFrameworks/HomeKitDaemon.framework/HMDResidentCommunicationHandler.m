@interface HMDResidentCommunicationHandler
+ (id)createResponseSubset:(id)a3 overallError:(id)a4 readRequest:(id)a5 error:(id *)a6;
+ (id)logCategory;
+ (void)_clearAllGeneratedRequests:(id)a3 error:(id)a4;
+ (void)_clearAllPendingRequests:(id)a3 error:(id)a4;
+ (void)_processResponseForMultireadRequest:(id)a3 overallError:(id)a4 response:(id)a5;
- (BOOL)containsDevice:(id)a3;
- (BOOL)isOwnerUser;
- (HMDDevice)preferredDevice;
- (HMDMessageDispatcher)remoteDispatcher;
- (HMDResidentCommunicationHandler)initWithHome:(id)a3 remoteDispatcher:(id)a4;
- (HMFTimer)multiReadCoalesceTimer;
- (NSMapTable)deviceMapping;
- (NSMapTable)dispatchedReadRequests;
- (NSMutableArray)pendingReadRequests;
- (NSString)description;
- (NSUUID)homeUUID;
- (OS_dispatch_queue)workQueue;
- (id)deviceForType:(int64_t)a3;
- (id)logIdentifier;
- (int)numOutstandingReadRequests;
- (int64_t)preferredDeviceType;
- (void)_processResponse:(id)a3 overallError:(id)a4 messageIdentifier:(id)a5;
- (void)_sendMultipleCharacteristicRead;
- (void)dealloc;
- (void)redispatchMessage:(id)a3 target:(id)a4 responseQueue:(id)a5;
- (void)removeDeviceForType:(int64_t)a3;
- (void)setDevice:(id)a3 forType:(int64_t)a4;
- (void)setDeviceMapping:(id)a3;
- (void)setMultiReadCoalesceTimer:(id)a3;
- (void)setNumOutstandingReadRequests:(int)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDResidentCommunicationHandler

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_remoteDispatcher);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_multiReadCoalesceTimer, 0);
  objc_storeStrong((id *)&self->_dispatchedReadRequests, 0);
  objc_storeStrong((id *)&self->_pendingReadRequests, 0);
  objc_storeStrong((id *)&self->_deviceMapping, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)setNumOutstandingReadRequests:(int)a3
{
  self->_numOutstandingReadRequests = a3;
}

- (int)numOutstandingReadRequests
{
  return self->_numOutstandingReadRequests;
}

- (HMDMessageDispatcher)remoteDispatcher
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteDispatcher);
  return (HMDMessageDispatcher *)WeakRetained;
}

- (BOOL)isOwnerUser
{
  return self->_ownerUser;
}

- (NSUUID)homeUUID
{
  return self->_homeUUID;
}

- (void)setMultiReadCoalesceTimer:(id)a3
{
}

- (HMFTimer)multiReadCoalesceTimer
{
  return self->_multiReadCoalesceTimer;
}

- (NSMapTable)dispatchedReadRequests
{
  return self->_dispatchedReadRequests;
}

- (NSMutableArray)pendingReadRequests
{
  return self->_pendingReadRequests;
}

- (void)setDeviceMapping:(id)a3
{
}

- (NSMapTable)deviceMapping
{
  return self->_deviceMapping;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (id)logIdentifier
{
  v2 = [(HMDResidentCommunicationHandler *)self homeUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)_processResponse:(id)a3 overallError:(id)a4 messageIdentifier:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v36 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [(HMDResidentCommunicationHandler *)self workQueue];
  dispatch_assert_queue_V2(v10);

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v11 = [(HMDResidentCommunicationHandler *)self dispatchedReadRequests];
  v12 = (void *)[v11 copy];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v38;
LABEL_3:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v38 != v15) {
        objc_enumerationMutation(v12);
      }
      v17 = *(void **)(*((void *)&v37 + 1) + 8 * v16);
      v18 = [v17 identifier];
      char v19 = [v18 isEqual:v9];

      if (v19) {
        break;
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [v12 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v14) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    v20 = [(HMDResidentCommunicationHandler *)self dispatchedReadRequests];
    v21 = [v20 objectForKey:v17];

    v22 = [(HMDResidentCommunicationHandler *)self dispatchedReadRequests];
    [v22 removeObjectForKey:v17];

    if (!v21) {
      goto LABEL_16;
    }
    v23 = v36;
    uint64_t v24 = +[HMDResidentCommunicationHandler _processResponseForMultireadRequest:v21 overallError:v8 response:v36];
    int numOutstandingReadRequests = self->_numOutstandingReadRequests;
    self->_int numOutstandingReadRequests = numOutstandingReadRequests - 1;
    if (numOutstandingReadRequests == 1)
    {
      v34 = [(HMDResidentCommunicationHandler *)self multiReadCoalesceTimer];

      if (v34)
      {
        v35 = [(HMDResidentCommunicationHandler *)self multiReadCoalesceTimer];
        [v35 suspend];

        [(HMDResidentCommunicationHandler *)self setMultiReadCoalesceTimer:0];
        [(HMDResidentCommunicationHandler *)self _sendMultipleCharacteristicRead];
      }
    }
    else if (numOutstandingReadRequests <= 0)
    {
      v26 = (void *)MEMORY[0x230FBD990](v24);
      v27 = self;
      v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v42 = v29;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@*** invalid reference counter for resident communication read coalese handler", buf, 0xCu);
      }
      self->_int numOutstandingReadRequests = 0;
    }
  }
  else
  {
LABEL_9:

LABEL_16:
    v30 = (void *)MEMORY[0x230FBD990]();
    v31 = self;
    v32 = HMFGetOSLogHandle();
    v23 = v36;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      v33 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v42 = v33;
      __int16 v43 = 2112;
      id v44 = v9;
      _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@Cannot find the message with identifier %@ in the dispatched multi-read requests", buf, 0x16u);
    }
    v21 = 0;
  }
}

- (void)_sendMultipleCharacteristicRead
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  v2 = [(HMDResidentCommunicationHandler *)self workQueue];
  dispatch_assert_queue_V2(v2);

  v3 = [(HMDResidentCommunicationHandler *)self pendingReadRequests];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v69 = [MEMORY[0x263EFF9A0] dictionary];
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    v5 = [(HMDResidentCommunicationHandler *)self pendingReadRequests];
    v6 = (void *)[v5 copy];

    id obj = v6;
    uint64_t v71 = [v6 countByEnumeratingWithState:&v76 objects:v86 count:16];
    if (v71)
    {
      uint64_t v70 = *(void *)v77;
      uint64_t v68 = 9;
      *(void *)&long long v7 = 138543362;
      long long v65 = v7;
      do
      {
        for (uint64_t i = 0; i != v71; ++i)
        {
          if (*(void *)v77 != v70) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v76 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "accessoryUUID", v65);
          v11 = [v10 UUIDString];

          if (v11)
          {
            objc_msgSend(v69, "hmf_mutableDictionaryForKey:", v11);
            v12 = (HMDAssertionLogEvent *)objc_claimAutoreleasedReturnValue();
            if (!v12)
            {
              v12 = [MEMORY[0x263EFF9A0] dictionary];
              [v69 setObject:v12 forKey:v11];
            }
            uint64_t v13 = [v9 readMessage];
            uint64_t v14 = [v13 messagePayload];
            uint64_t v15 = objc_msgSend(v14, "hmf_numberForKey:", @"kServiceInstanceID");
            uint64_t v16 = HAPInstanceIDFromValue();

            v17 = [v16 stringValue];
            v18 = [(HMDAssertionLogEvent *)v12 hmf_mutableArrayForKey:v17];

            if (!v18)
            {
              v18 = [MEMORY[0x263EFF980] array];
              char v19 = [v16 stringValue];
              [(HMDAssertionLogEvent *)v12 setObject:v18 forKey:v19];
            }
            v20 = [v9 readMessage];
            v21 = [v20 messagePayload];
            v22 = objc_msgSend(v21, "hmf_numberForKey:", @"kCharacteristicInstanceID");
            v23 = HAPInstanceIDFromValue();

            if (([v18 containsObject:v23] & 1) == 0) {
              [v18 addObject:v23];
            }
            uint64_t v24 = [v9 readMessage];
            [v24 qualityOfService];
            BOOL v25 = HMFQualityOfServiceCompare() == -1;

            if (v25)
            {
              v26 = [v9 readMessage];
              uint64_t v68 = [v26 qualityOfService];
            }
          }
          else
          {
            v27 = (void *)MEMORY[0x230FBD990]();
            v28 = self;
            v29 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              v30 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v83 = v30;
              __int16 v84 = 2112;
              id v85 = v9;
              _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Ignoring bad request with nil accessory: %@", buf, 0x16u);
            }
            v31 = (void *)MEMORY[0x230FBD990]();
            v32 = v28;
            v33 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
            {
              v34 = HMFGetLogIdentifier();
              *(_DWORD *)buf = v65;
              v83 = v34;
              _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Accessory UUID cannot be nil", buf, 0xCu);
            }
            v12 = [[HMDAssertionLogEvent alloc] initWithReason:@"Accessory UUID cannot be nil"];
            uint64_t v16 = +[HMDMetricsManager sharedLogEventSubmitter];
            [v16 submitLogEvent:v12];
          }
        }
        uint64_t v71 = [obj countByEnumeratingWithState:&v76 objects:v86 count:16];
      }
      while (v71);
    }
    else
    {
      uint64_t v68 = 9;
    }

    v80[0] = @"kAccessoriesListKey";
    long long v39 = (void *)[v69 copy];
    v80[1] = @"kHomeUUID";
    v81[0] = v39;
    long long v40 = [(HMDResidentCommunicationHandler *)self homeUUID];
    v41 = [v40 UUIDString];
    v81[1] = v41;
    v42 = [NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:2];

    __int16 v43 = [MEMORY[0x263F08C38] UUID];
    id v44 = [HMDRemoteHomeMessageDestination alloc];
    v45 = [(HMDResidentCommunicationHandler *)self homeUUID];
    uint64_t v46 = [(HMDResidentCommunicationHandler *)self homeUUID];
    v47 = [(HMDRemoteHomeMessageDestination *)v44 initWithTarget:v45 homeUUID:v46];

    v48 = [MEMORY[0x263F42590] messageWithName:@"kMultipleCharacteristicReadRequestKey" qualityOfService:v68 destination:v47 payload:v42];
    [v48 setIdentifier:v43];
    objc_initWeak(&location, self);
    v72[0] = MEMORY[0x263EF8330];
    v72[1] = 3221225472;
    v72[2] = __66__HMDResidentCommunicationHandler__sendMultipleCharacteristicRead__block_invoke;
    v72[3] = &unk_264A2D420;
    objc_copyWeak(&v74, &location);
    id v49 = v43;
    id v73 = v49;
    [v48 setResponseHandler:v72];
    v50 = [(HMDResidentCommunicationHandler *)self dispatchedReadRequests];
    v51 = [(HMDResidentCommunicationHandler *)self pendingReadRequests];
    v52 = (void *)[v51 copy];
    [v50 setObject:v52 forKey:v48];

    v53 = [(HMDResidentCommunicationHandler *)self pendingReadRequests];
    [v53 removeAllObjects];

    v54 = [(HMDResidentCommunicationHandler *)self remoteDispatcher];
    v55 = v54;
    if (v54)
    {
      ++self->_numOutstandingReadRequests;
      v56 = (void *)MEMORY[0x230FBD990]([v54 sendMessage:v48]);
      v57 = self;
      HMFGetOSLogHandle();
      v58 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        v59 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v83 = v59;
        __int16 v84 = 2112;
        id v85 = v49;
        _os_log_impl(&dword_22F52A000, v58, OS_LOG_TYPE_INFO, "%{public}@Sent off the multi-read request with identifier: %@ and adding it to tracking list", buf, 0x16u);
      }
    }
    else
    {
      v60 = (void *)MEMORY[0x230FBD990]();
      v61 = self;
      HMFGetOSLogHandle();
      v62 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        v63 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v83 = v63;
        _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_ERROR, "%{public}@IDS dispatcher is invalid, reporting error", buf, 0xCu);
      }
      v64 = [MEMORY[0x263F087E8] hmErrorWithCode:54];
      [(HMDResidentCommunicationHandler *)v61 _processResponse:0 overallError:v64 messageIdentifier:v49];
    }
    objc_destroyWeak(&v74);
    objc_destroyWeak(&location);
  }
  else
  {
    v35 = (void *)MEMORY[0x230FBD990]();
    id v36 = self;
    long long v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      long long v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v83 = v38;
      _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_INFO, "%{public}@No pending read requests to combine?", buf, 0xCu);
    }
  }
}

void __66__HMDResidentCommunicationHandler__sendMultipleCharacteristicRead__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = [WeakRetained workQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __66__HMDResidentCommunicationHandler__sendMultipleCharacteristicRead__block_invoke_2;
  v11[3] = &unk_264A2E610;
  v11[4] = WeakRetained;
  id v12 = v6;
  id v13 = v5;
  id v14 = *(id *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, v11);
}

uint64_t __66__HMDResidentCommunicationHandler__sendMultipleCharacteristicRead__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processResponse:*(void *)(a1 + 40) overallError:*(void *)(a1 + 48) messageIdentifier:*(void *)(a1 + 56)];
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDResidentCommunicationHandler *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__HMDResidentCommunicationHandler_timerDidFire___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __48__HMDResidentCommunicationHandler_timerDidFire___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) multiReadCoalesceTimer];

  if (v2 == v3)
  {
    [*(id *)(a1 + 40) setMultiReadCoalesceTimer:0];
    id v8 = *(void **)(a1 + 40);
    [v8 _sendMultipleCharacteristicRead];
  }
  else
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 40);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      long long v7 = HMFGetLogIdentifier();
      int v9 = 138543362;
      id v10 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Read request timer is not matching", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)redispatchMessage:(id)a3 target:(id)a4 responseQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HMDResidentCommunicationHandler *)self workQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __74__HMDResidentCommunicationHandler_redispatchMessage_target_responseQueue___block_invoke;
  v15[3] = &unk_264A2E610;
  id v16 = v8;
  id v17 = v9;
  v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __74__HMDResidentCommunicationHandler_redispatchMessage_target_responseQueue___block_invoke(uint64_t a1)
{
  v53[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) messagePayload];
  v3 = (void *)[v2 mutableCopy];

  v53[0] = @"kIDSMessageSourceIDKey";
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:1];
  [v3 removeObjectsForKeys:v4];

  id v5 = *(id *)(a1 + 32);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (!v7) {
    id v5 = (id)[*(id *)(a1 + 32) mutableCopy];
  }
  [v5 setMessagePayload:v3];
  [v5 setSecureRemote:1];
  id v8 = [HMDRemoteHomeMessageDestination alloc];
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = [*(id *)(a1 + 48) homeUUID];
  uint64_t v11 = [(HMDRemoteHomeMessageDestination *)v8 initWithTarget:v9 homeUUID:v10];

  [v5 setDestination:v11];
  id v12 = [v5 name];
  LOBYTE(v10) = [v12 isEqualToString:@"kCharacteristicReadRequestKey"];

  if (v10)
  {
    id v13 = [v3 objectForKeyedSubscript:@"kAccessoryUUID"];
    if (v13 && (uint64_t v14 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v13]) != 0)
    {
      uint64_t v15 = (void *)v14;
      id v16 = [[HMDRemoteReadRequestMessage alloc] initWithReadMessage:v5 accessoryUUID:v14 responseQueue:*(void *)(a1 + 56)];
      id v17 = [*(id *)(a1 + 48) pendingReadRequests];
      [v17 addObject:v16];

      v18 = [*(id *)(a1 + 48) multiReadCoalesceTimer];

      if (!v18)
      {
        if (*(int *)(*(void *)(a1 + 48) + 12) < 1)
        {
          long long v39 = (void *)MEMORY[0x230FBD990]();
          id v40 = *(id *)(a1 + 48);
          v41 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v42 = contextb = v39;
            *(_DWORD *)buf = 138543362;
            v48 = v42;
            _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_INFO, "%{public}@Sending read request immediately.  Will collect further incoming read packets", buf, 0xCu);

            long long v39 = contextb;
          }

          [*(id *)(a1 + 48) _sendMultipleCharacteristicRead];
        }
        else
        {
          id v19 = [MEMORY[0x263F42608] sharedPreferences];
          v20 = [v19 preferenceForKey:@"residentReadCoalesceTimeout_ms"];
          v21 = [v20 numberValue];

          if (!v21)
          {
            context = (void *)MEMORY[0x230FBD990]();
            id v22 = *(id *)(a1 + 48);
            v23 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              __int16 v43 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              v48 = v43;
              _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@*** resident communication handler read coalesce timeout missing from preferences", buf, 0xCu);
            }
          }
          objc_msgSend(v21, "doubleValue", v43);
          BOOL v25 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:v24 / 1000.0];
          [*(id *)(a1 + 48) setMultiReadCoalesceTimer:v25];

          v26 = *(void **)(a1 + 48);
          v27 = [v26 multiReadCoalesceTimer];
          [v27 setDelegate:v26];

          v28 = [*(id *)(a1 + 48) multiReadCoalesceTimer];
          [v28 resume];

          v29 = (void *)MEMORY[0x230FBD990]();
          id v30 = *(id *)(a1 + 48);
          v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v32 = contexta = v21;
            *(_DWORD *)buf = 138543362;
            v48 = v32;
            _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Kicked off the multi-read request timer", buf, 0xCu);

            v21 = contexta;
          }
        }
      }
    }
    else
    {
      v33 = (void *)MEMORY[0x230FBD990]();
      id v34 = *(id *)(a1 + 48);
      v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        id v36 = HMFGetLogIdentifier();
        long long v37 = [*(id *)(a1 + 32) shortDescription];
        *(_DWORD *)buf = 138543874;
        v48 = v36;
        __int16 v49 = 2112;
        v50 = v37;
        __int16 v51 = 2112;
        v52 = v3;
        _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Request message: %@ cannot be redispatched due to invalid payload: %@", buf, 0x20u);
      }
      long long v38 = *(void **)(a1 + 32);
      uint64_t v15 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
      [v38 respondWithError:v15];
    }
  }
  else
  {
    [v5 name];

    id v13 = [*(id *)(a1 + 48) remoteDispatcher];
    [v13 sendMessage:v5];
  }
}

- (int64_t)preferredDeviceType
{
  v3 = [(HMDResidentCommunicationHandler *)self deviceMapping];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 0;
  }
  id v5 = [(HMDResidentCommunicationHandler *)self deviceMapping];
  id v6 = [v5 objectForKey:&unk_26E470CF0];

  if (v6) {
    return 2;
  }
  id v8 = [(HMDResidentCommunicationHandler *)self deviceMapping];
  uint64_t v9 = [v8 objectForKey:&unk_26E470D08];

  return v9 != 0;
}

- (HMDDevice)preferredDevice
{
  int64_t v3 = [(HMDResidentCommunicationHandler *)self preferredDeviceType];
  return (HMDDevice *)[(HMDResidentCommunicationHandler *)self deviceForType:v3];
}

- (id)deviceForType:(int64_t)a3
{
  uint64_t v4 = [(HMDResidentCommunicationHandler *)self deviceMapping];
  id v5 = [NSNumber numberWithInteger:a3];
  id v6 = [v4 objectForKey:v5];

  return v6;
}

- (BOOL)containsDevice:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDResidentCommunicationHandler *)self deviceMapping];
  id v6 = (void *)[v5 copy];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = objc_msgSend(v7, "objectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        char v12 = [v11 isEqual:v4];

        if (v12)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)removeDeviceForType:(int64_t)a3
{
  id v5 = [(HMDResidentCommunicationHandler *)self deviceMapping];
  id v6 = [NSNumber numberWithInteger:a3];
  id v7 = [v5 objectForKey:v6];

  if (v7)
  {
    if ([(HMDResidentCommunicationHandler *)self preferredDeviceType] == a3)
    {
      uint64_t v8 = [(HMDResidentCommunicationHandler *)self dispatchedReadRequests];
      uint64_t v9 = (void *)[v8 copy];

      uint64_t v10 = [(HMDResidentCommunicationHandler *)self dispatchedReadRequests];
      [v10 removeAllObjects];

      uint64_t v11 = [MEMORY[0x263F087E8] hmErrorWithCode:54];
      +[HMDResidentCommunicationHandler _clearAllGeneratedRequests:v9 error:v11];
    }
    id v13 = [(HMDResidentCommunicationHandler *)self deviceMapping];
    char v12 = [NSNumber numberWithInteger:a3];
    [v13 removeObjectForKey:v12];
  }
}

- (void)setDevice:(id)a3 forType:(int64_t)a4
{
  id v9 = a3;
  id v6 = [(HMDResidentCommunicationHandler *)self deviceForType:a4];
  if (([v6 isEqual:v9] & 1) == 0)
  {
    if (v6) {
      [(HMDResidentCommunicationHandler *)self removeDeviceForType:a4];
    }
    if (v9)
    {
      id v7 = [(HMDResidentCommunicationHandler *)self deviceMapping];
      uint64_t v8 = [NSNumber numberWithInteger:a4];
      [v7 setObject:v9 forKey:v8];
    }
  }
}

- (NSString)description
{
  v2 = NSString;
  int64_t v3 = [(HMDResidentCommunicationHandler *)self homeUUID];
  id v4 = [v3 UUIDString];
  id v5 = [v2 stringWithFormat:@"[RCH %@]", v4];

  return (NSString *)v5;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int64_t v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    long long v14 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating resident communication handler", buf, 0xCu);
  }
  id v7 = [(HMDResidentCommunicationHandler *)v4 pendingReadRequests];
  uint64_t v8 = (void *)[v7 copy];

  id v9 = [(HMDResidentCommunicationHandler *)v4 dispatchedReadRequests];
  uint64_t v10 = (void *)[v9 copy];

  uint64_t v11 = [MEMORY[0x263F087E8] hmErrorWithCode:54];
  +[HMDResidentCommunicationHandler _clearAllGeneratedRequests:v10 error:v11];
  +[HMDResidentCommunicationHandler _clearAllPendingRequests:v8 error:v11];

  v12.receiver = v4;
  v12.super_class = (Class)HMDResidentCommunicationHandler;
  [(HMDResidentCommunicationHandler *)&v12 dealloc];
}

- (HMDResidentCommunicationHandler)initWithHome:(id)a3 remoteDispatcher:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HMDResidentCommunicationHandler;
  uint64_t v8 = [(HMDResidentCommunicationHandler *)&v20 init];
  if (v8)
  {
    uint64_t v9 = [v6 uuid];
    homeUUID = v8->_homeUUID;
    v8->_homeUUID = (NSUUID *)v9;

    v8->_ownerUser = [v6 isOwnerUser];
    uint64_t v11 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    deviceMapping = v8->_deviceMapping;
    v8->_deviceMapping = (NSMapTable *)v11;

    uint64_t v13 = [v7 workQueue];
    workQueue = v8->_workQueue;
    v8->_workQueue = (OS_dispatch_queue *)v13;

    objc_storeWeak((id *)&v8->_remoteDispatcher, v7);
    uint64_t v15 = [MEMORY[0x263EFF980] array];
    pendingReadRequests = v8->_pendingReadRequests;
    v8->_pendingReadRequests = (NSMutableArray *)v15;

    uint64_t v17 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    dispatchedReadRequests = v8->_dispatchedReadRequests;
    v8->_dispatchedReadRequests = (NSMapTable *)v17;

    v8->_int numOutstandingReadRequests = 0;
  }

  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t23 != -1) {
    dispatch_once(&logCategory__hmf_once_t23, &__block_literal_global_31761);
  }
  v2 = (void *)logCategory__hmf_once_v24;
  return v2;
}

void __46__HMDResidentCommunicationHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v24;
  logCategory__hmf_once_double v24 = v0;
}

+ (void)_clearAllPendingRequests:(id)a3 error:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = a1;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    uint64_t v13 = v11;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Clearing off all pending read requests with error: %@", (uint8_t *)&v12, 0x16u);
  }
  +[HMDResidentCommunicationHandler _processResponseForMultireadRequest:v6 overallError:v7 response:0];
}

+ (void)_clearAllGeneratedRequests:(id)a3 error:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = a1;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    double v24 = v11;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Clearing off all pending dispatched multi-read requests with error: %@", buf, 0x16u);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = objc_msgSend(v12, "objectForKey:", *(void *)(*((void *)&v18 + 1) + 8 * v16), (void)v18);
        +[HMDResidentCommunicationHandler _processResponseForMultireadRequest:v17 overallError:v7 response:0];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }
}

+ (id)createResponseSubset:(id)a3 overallError:(id)a4 readRequest:(id)a5 error:(id *)a6
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [MEMORY[0x263F087E8] hmErrorWithCode:54];
  }
  id v14 = v13;
  if (v10)
  {
    uint64_t v71 = v13;
    uint64_t v15 = [v12 readMessage];
    uint64_t v16 = [v15 messagePayload];

    uint64_t v17 = [v12 accessoryUUID];
    long long v18 = objc_msgSend(v16, "hmf_numberForKey:", @"kServiceInstanceID");
    id v74 = HAPInstanceIDFromValue();

    long long v19 = objc_msgSend(v16, "hmf_numberForKey:", @"kCharacteristicInstanceID");
    id v73 = HAPInstanceIDFromValue();

    uint64_t v20 = objc_msgSend(v10, "hmf_dictionaryForKey:", @"kModifiedCharacteristicsForAccessoryKey");
    v72 = (void *)v20;
    if (v20)
    {
      long long v21 = (void *)v20;
      v69 = v16;
      uint64_t v70 = a6;
      id v22 = [v17 UUIDString];
      v23 = objc_msgSend(v21, "hmf_dictionaryForKey:", v22);

      double v24 = v17;
      if (v23)
      {
        __int16 v25 = [v74 stringValue];
        id v26 = objc_msgSend(v23, "hmf_dictionaryForKey:", v25);

        uint64_t v68 = v26;
        if (v26)
        {
          v67 = v24;
          uint64_t v27 = [v73 stringValue];
          v28 = objc_msgSend(v26, "hmf_dictionaryForKey:", v27);

          v66 = v28;
          if (v28)
          {
            v29 = v28;
            id v30 = [v28 errorFromDataForKey:@"kCharacteristicErrorDataKey"];
            if (v30)
            {
              v31 = v23;
              v32 = v30;
              id v14 = v30;

              v33 = 0;
              a6 = v70;
            }
            else
            {
              uint64_t v52 = [v28 objectForKeyedSubscript:@"kCharacteristicValue"];
              uint64_t v53 = [v29 objectForKeyedSubscript:@"kCharacteristicValueUpdateStateNumberKey"];
              if (!v53)
              {
                uint64_t v53 = [MEMORY[0x263EFF9D0] null];
              }
              v63 = (void *)v53;
              a6 = v70;
              if (v52)
              {
                v31 = v23;
                v54 = [v10 objectForKeyedSubscript:@"kRemoteMessageTransportAttributionKey"];
                if (!v54)
                {
                  v54 = [NSNumber numberWithInt:0];
                }
                v75[0] = @"kAccessoryUUID";
                v55 = objc_msgSend(v67, "UUIDString", v63, v52);
                v76[0] = v55;
                v76[1] = v74;
                v75[1] = @"kServiceInstanceID";
                v75[2] = @"kCharacteristicInstanceID";
                v56 = v65;
                v76[2] = v73;
                v76[3] = v65;
                v75[3] = @"kCharacteristicValue";
                v75[4] = @"kCharacteristicValueUpdateStateNumberKey";
                v75[5] = @"kRemoteMessageTransportAttributionKey";
                v57 = v64;
                v76[4] = v64;
                v76[5] = v54;
                v33 = [NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:6];

                id v14 = 0;
                a6 = v70;
              }
              else
              {
                v31 = v23;
                v58 = (void *)MEMORY[0x230FBD990]();
                id v59 = a1;
                v60 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                {
                  v61 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543362;
                  long long v78 = v61;
                  _os_log_impl(&dword_22F52A000, v60, OS_LOG_TYPE_ERROR, "%{public}@Value key is missing in the response dictionary", buf, 0xCu);

                  a6 = v70;
                }

                v33 = 0;
                id v14 = v71;
                v57 = v63;
                v56 = 0;
              }

              v32 = 0;
            }
          }
          else
          {
            v31 = v23;
            v48 = (void *)MEMORY[0x230FBD990]();
            id v49 = a1;
            v50 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              __int16 v51 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              long long v78 = v51;
              __int16 v79 = 2112;
              v80 = v73;
              _os_log_impl(&dword_22F52A000, v50, OS_LOG_TYPE_ERROR, "%{public}@Could not find the characteristic instance ID %@ in the service changes", buf, 0x16u);
            }
            v33 = 0;
            a6 = v70;
            id v14 = v71;
          }

          double v24 = v67;
        }
        else
        {
          v31 = v23;
          id v44 = (void *)MEMORY[0x230FBD990]();
          id v45 = a1;
          uint64_t v46 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            v47 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            long long v78 = v47;
            __int16 v79 = 2112;
            v80 = v74;
            _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_ERROR, "%{public}@Could not find the service instance ID %@ in the accessory changes", buf, 0x16u);
          }
          v33 = 0;
          a6 = v70;
          id v14 = v71;
        }
      }
      else
      {
        v31 = 0;
        long long v39 = (void *)MEMORY[0x230FBD990]();
        id v40 = a1;
        v41 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v42 = HMFGetLogIdentifier();
          __int16 v43 = [v24 UUIDString];
          *(_DWORD *)buf = 138543618;
          long long v78 = v42;
          __int16 v79 = 2112;
          v80 = v43;
          _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@Could not find the accessory %@ in the accessory list", buf, 0x16u);
        }
        v33 = 0;
        a6 = v70;
        id v14 = v71;
      }

      uint64_t v16 = v69;
    }
    else
    {
      id v34 = (void *)MEMORY[0x230FBD990]();
      id v35 = a1;
      id v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v38 = long long v37 = a6;
        *(_DWORD *)buf = 138543362;
        long long v78 = v38;
        _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_ERROR, "%{public}@Could not find the modified accessory characteristics key", buf, 0xCu);

        a6 = v37;
      }

      v33 = 0;
      double v24 = v17;
      id v14 = v71;
    }

    if (a6) {
      goto LABEL_40;
    }
  }
  else
  {
    v33 = 0;
    if (a6) {
LABEL_40:
    }
      *a6 = v14;
  }

  return v33;
}

+ (void)_processResponseForMultireadRequest:(id)a3 overallError:(id)a4 response:(id)a5
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v35 = a4;
  id v34 = a5;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v43 objects:v55 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v36 = *(void *)v44;
    *(void *)&long long v9 = 138543618;
    long long v32 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v44 != v36) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "readMessage", v32);
        id v14 = [v13 responseHandler];

        if (v14)
        {
          id v42 = v35;
          id v15 = v35;
          uint64_t v16 = +[HMDResidentCommunicationHandler createResponseSubset:v34 overallError:v15 readRequest:v12 error:&v42];
          id v17 = v42;

          long long v18 = (void *)MEMORY[0x230FBD990]();
          id v19 = a1;
          uint64_t v20 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            long long v21 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138544130;
            v48 = v21;
            __int16 v49 = 2112;
            v50 = v12;
            __int16 v51 = 2112;
            uint64_t v52 = v16;
            __int16 v53 = 2112;
            id v54 = v17;
            _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@%@ is getting a response %@ with error %@", buf, 0x2Au);
          }
          id v22 = [v12 responseQueue];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __93__HMDResidentCommunicationHandler__processResponseForMultireadRequest_overallError_response___block_invoke;
          block[3] = &unk_264A2EE80;
          id v23 = v14;
          id v40 = v16;
          id v41 = v23;
          id v39 = v17;
          id v24 = v17;
          id v25 = v16;
          dispatch_async(v22, block);
        }
        else
        {
          id v26 = (void *)MEMORY[0x230FBD990]();
          id v27 = a1;
          v28 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            v29 = HMFGetLogIdentifier();
            id v30 = [v12 readMessage];
            v31 = [v30 identifier];
            *(_DWORD *)buf = v32;
            v48 = v29;
            __int16 v49 = 2112;
            v50 = v31;
            _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Response handler is not set for the request %@, skipping", buf, 0x16u);
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v43 objects:v55 count:16];
    }
    while (v10);
  }
}

uint64_t __93__HMDResidentCommunicationHandler__processResponseForMultireadRequest_overallError_response___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end