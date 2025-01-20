@interface HMDUserDeviceCapabilitiesRequestManager
+ (id)logCategory;
- (HMDUserDeviceCapabilitiesRequestManager)initWithHomeManager:(id)a3 accountRegistry:(id)a4 messageDispatcher:(id)a5;
- (HMDUserDeviceCapabilitiesRequestManager)initWithHomeManager:(id)a3 accountRegistry:(id)a4 messageDispatcher:(id)a5 timerManager:(id)a6;
- (NSUUID)messageTargetUUID;
- (id)_responseHandlerForTransactionID:(id)a3;
- (id)_selectBestResponseForContext:(id)a3;
- (id)_updateDeviceCapabilities:(id)a3 withDestination:(id)a4;
- (id)homeManager;
- (void)_cancelPendingTimerContexts;
- (void)_completeWithResponse:(id)a3 error:(id)a4 context:(id)a5;
- (void)_handleRequestCapabilitiesXPCRequest:(id)a3;
- (void)_handleResponsePayload:(id)a3 error:(id)a4 transactionID:(id)a5;
- (void)_updateResponseTimeoutForContext:(id)a3;
- (void)electDeviceForUserID:(id)a3 destination:(id)a4 deviceCapabilities:(id)a5 responseTimeout:(double)a6 responseQueue:(id)a7 completionHandler:(id)a8;
- (void)registerForMessages;
- (void)timerManager:(id)a3 didFireForTimerContext:(id)a4;
@end

@implementation HMDUserDeviceCapabilitiesRequestManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerContextsToCancel, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_requestContexts, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_destroyWeak((id *)&self->_homeManager);
}

- (NSUUID)messageTargetUUID
{
  v2 = -[HMDUserDeviceCapabilitiesRequestManager homeManager]((id *)&self->super.super.super.super.isa);
  v3 = [v2 messageTargetUUID];

  return (NSUUID *)v3;
}

- (id)homeManager
{
  if (WeakRetained)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 10);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void)_handleRequestCapabilitiesXPCRequest:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 messagePayload];
  v6 = (void *)[v5 mutableCopy];

  v7 = [v4 stringForKey:@"kUserIDKey"];
  if (v7)
  {
    v22 = self;
    v23 = v6;
    v8 = -[HMDUserDeviceCapabilitiesRequestManager homeManager]((id *)&self->super.super.super.super.isa);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v9 = [v8 homes];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v26 + 1) + 8 * i) users];
          v15 = objc_msgSend(v14, "hmf_firstObjectWithValue:forKeyPath:", v7, @"userID");

          if (v15)
          {

            v6 = v23;
            [v23 removeObjectForKey:@"kUserIDKey"];
            v16 = [v15 userID];
            v17 = (void *)[v23 copy];
            v18 = [v8 workQueue];
            v24[0] = MEMORY[0x263EF8330];
            v24[1] = 3221225472;
            v24[2] = __80__HMDUserDeviceCapabilitiesRequestManager__handleRequestCapabilitiesXPCRequest___block_invoke;
            v24[3] = &unk_264A20B98;
            id v25 = v4;
            [(HMDUserDeviceCapabilitiesRequestManager *)v22 electDeviceForUserID:v16 destination:0 deviceCapabilities:v17 responseTimeout:v18 responseQueue:v24 completionHandler:0.0];

            goto LABEL_12;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    v15 = [MEMORY[0x263F087E8] hmErrorWithCode:2 description:@"The specified userID is not known" reason:0 suggestion:0];
    [v4 respondWithError:v15];
    v6 = v23;
LABEL_12:
  }
  else
  {
    v19 = (void *)MEMORY[0x263F087E8];
    v20 = [NSString stringWithFormat:@"UserID must be set in the payload with key \"%@\".", @"kUserIDKey"];
    v21 = [v19 hmErrorWithCode:2 description:@"Cannot send capabilities request because the userID is missing" reason:v20 suggestion:0];

    [v4 respondWithError:v21];
  }
}

void __80__HMDUserDeviceCapabilitiesRequestManager__handleRequestCapabilitiesXPCRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v12 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) respondWithError:a2];
  }
  else
  {
    v7 = (void *)[a4 mutableCopy];
    v8 = [v12 identifier];
    v9 = [v8 UUIDString];
    [v7 setObject:v9 forKeyedSubscript:@"SenderDeviceHandleIdentifier"];

    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = (void *)[v7 copy];
    [v10 respondWithPayload:v11];
  }
}

- (void)timerManager:(id)a3 didFireForTimerContext:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
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
    uint64_t v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = HMFGetLogIdentifier();
      v15 = [v10 transactionID];
      int v25 = 138543618;
      uint64_t v26 = (uint64_t)v14;
      __int16 v27 = 2114;
      long long v28 = v15;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Response timer fired", (uint8_t *)&v25, 0x16u);
    }
    os_unfair_lock_lock_with_options();
    [v10 setTimerContext:0];
    uint64_t v16 = [(HMDUserDeviceCapabilitiesRequestManager *)v12 _selectBestResponseForContext:v10];
    uint64_t v17 = [(id)v16 objectForKeyedSubscript:@"kIDSMessageResponseErrorDataKey"];
    if (!(v16 | v17))
    {
      v18 = (void *)MEMORY[0x230FBD990]();
      v19 = v12;
      HMFGetOSLogHandle();
      v20 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        int v25 = 138543362;
        uint64_t v26 = v21;
        v22 = (void *)v21;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: We should only get here if we received a response", (uint8_t *)&v25, 0xCu);
      }
      v23 = [[HMDAssertionLogEvent alloc] initWithReason:@"We should only get here if we received a response"];
      v24 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v24 submitLogEvent:v23];

      uint64_t v17 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    }
    [(HMDUserDeviceCapabilitiesRequestManager *)v12 _completeWithResponse:v16 error:v17 context:v10];

    os_unfair_lock_unlock(&v12->_lock);
    [(HMDUserDeviceCapabilitiesRequestManager *)v12 _cancelPendingTimerContexts];
  }
}

- (void)_cancelPendingTimerContexts
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self) {
    timerContextsToCancel = self->_timerContextsToCancel;
  }
  else {
    timerContextsToCancel = 0;
  }
  v5 = timerContextsToCancel;
  id v6 = (void *)[(NSMutableArray *)v5 copy];

  if (self) {
    id v7 = self->_timerContextsToCancel;
  }
  else {
    id v7 = 0;
  }
  v8 = v7;
  [(NSMutableArray *)v8 removeAllObjects];

  os_unfair_lock_unlock(p_lock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v9);
        }
        if (self) {
          timerManager = self->_timerManager;
        }
        else {
          timerManager = 0;
        }
        -[HMFTimerManager cancelTimerForContext:](timerManager, "cancelTimerForContext:", *(void *)(*((void *)&v15 + 1) + 8 * v12++), (void)v15);
      }
      while (v10 != v12);
      uint64_t v14 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v10 = v14;
    }
    while (v14);
  }
}

- (void)_updateResponseTimeoutForContext:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = [v4 timerContext];

  if (v5)
  {
    if (self) {
      timerContextsToCancel = self->_timerContextsToCancel;
    }
    else {
      timerContextsToCancel = 0;
    }
    id v7 = timerContextsToCancel;
    v8 = [v4 timerContext];
    [(NSMutableArray *)v7 addObject:v8];
  }
  id v9 = [v4 receivedResponses];
  uint64_t v10 = [v9 count];

  unint64_t v11 = remotePendingResponseTimerNanoseconds
      / (unint64_t)((1000000000 * v10 + 1000000000) * remotePendingResponseDecayScale);
  uint64_t v12 = (void *)MEMORY[0x230FBD990]();
  v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    long long v15 = HMFGetLogIdentifier();
    long long v16 = [v4 transactionID];
    int v19 = 138543874;
    uint64_t v20 = v15;
    __int16 v21 = 2114;
    v22 = v16;
    __int16 v23 = 2048;
    unint64_t v24 = v11;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Updating response timeout to %llu seconds", (uint8_t *)&v19, 0x20u);
  }
  if (v13) {
    timerManager = v13->_timerManager;
  }
  else {
    timerManager = 0;
  }
  long long v18 = [(HMFTimerManager *)timerManager startTimerWithTimeInterval:v4 object:(double)v11];
  [v4 setTimerContext:v18];
}

- (void)_completeWithResponse:(id)a3 error:(id)a4 context:(id)a5
{
  v62[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_unfair_lock_assert_owner(&self->_lock);
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v12 = v11;
  v13 = 0;
  if (!v8 || v9)
  {
    uint64_t v14 = v11;
  }
  else
  {
    v47 = objc_msgSend(v8, "hmf_stringForKey:", @"kIDSMessageSourceIDKey");
    v13 = +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:");
    uint64_t v14 = (void *)[v8 mutableCopy];

    v62[0] = @"kIDSMessageSourceIDKey";
    long long v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:1];
    [v14 removeObjectsForKeys:v15];

    long long v16 = (void *)MEMORY[0x230FBD990]();
    long long v17 = self;
    long long v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = HMFGetLogIdentifier();
      uint64_t v20 = [v10 transactionID];
      *(_DWORD *)buf = 138544130;
      v55 = v19;
      __int16 v56 = 2114;
      v57 = v20;
      __int16 v58 = 2112;
      v59 = v13;
      __int16 v60 = 2114;
      v61 = v14;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Elected device %@ with capabilities: %{public}@", buf, 0x2Au);
    }
    __int16 v21 = objc_msgSend(v8, "hmf_numberForKey:", @"kHomedVersionKey");
    if (v21)
    {
      v46 = v14;
      v22 = [HMDHomeKitVersion alloc];
      __int16 v23 = [v21 stringValue];
      unint64_t v24 = [(HMDHomeKitVersion *)v22 initWithVersionString:v23];

      char v53 = 0;
      uint64_t v25 = [(HMDRemoteMessageTransport *)v17 accountRegistry];
      uint64_t v26 = [v25 deviceForHandle:v13 exists:&v53];

      if (v53)
      {
        __int16 v27 = [v26 version];
        char v28 = [v27 isEqualToVersion:v24];

        if ((v28 & 1) == 0)
        {
          uint64_t v29 = (void *)MEMORY[0x230FBD990]();
          v30 = v17;
          uint64_t v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v32 = v45 = v30;
            *(_DWORD *)buf = 138543618;
            v55 = v32;
            __int16 v56 = 2112;
            v57 = v26;
            _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Updating the device, %@, with the election parameters", buf, 0x16u);

            v30 = v45;
          }

          [v26 updateVersion:v24];
        }
      }

      uint64_t v14 = v46;
    }

    id v9 = 0;
  }
  v33 = [v10 responseQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__HMDUserDeviceCapabilitiesRequestManager__completeWithResponse_error_context___block_invoke;
  block[3] = &unk_264A2E610;
  id v34 = v10;
  id v49 = v34;
  id v35 = v9;
  id v50 = v35;
  id v36 = v13;
  id v51 = v36;
  id v37 = v14;
  id v52 = v37;
  dispatch_async(v33, block);

  if (self) {
    requestContexts = self->_requestContexts;
  }
  else {
    requestContexts = 0;
  }
  v39 = requestContexts;
  v40 = [v34 transactionID];
  [(NSMutableDictionary *)v39 removeObjectForKey:v40];

  v41 = [v34 timerContext];

  if (v41)
  {
    if (self) {
      timerContextsToCancel = self->_timerContextsToCancel;
    }
    else {
      timerContextsToCancel = 0;
    }
    v43 = timerContextsToCancel;
    v44 = [v34 timerContext];
    [(NSMutableArray *)v43 addObject:v44];

    [v34 setTimerContext:0];
  }
}

void __79__HMDUserDeviceCapabilitiesRequestManager__completeWithResponse_error_context___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) completionHandler];
  (*((void (**)(id, void, void, void))v2 + 2))(v2, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (id)_selectBestResponseForContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 receivedResponses];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = [v4 receivedResponses];
    id v8 = [v4 requestedCapabilities];
    id v9 = [(HMDRemoteMessageTransport *)self matchResponse:v7 requestedCapabilities:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)_handleResponsePayload:(id)a3 error:(id)a4 transactionID:(id)a5
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self) {
    requestContexts = self->_requestContexts;
  }
  else {
    requestContexts = 0;
  }
  uint64_t v12 = [(NSMutableDictionary *)requestContexts objectForKeyedSubscript:v10];
  if (v12)
  {
    id v57 = v10;
    v13 = v9;
    char v14 = objc_msgSend(v8, "hmf_BOOLForKey:", @"kRemoteMessageIsFinalResponseKey");
    long long v15 = objc_msgSend(v8, "hmf_stringForKey:", @"kIDSMessageSourceIDKey");
    long long v16 = (void *)[v8 mutableCopy];
    [v16 removeObjectForKey:@"kRemoteMessageIsFinalResponseKey"];
    long long v17 = (void *)[v16 copy];

    long long v18 = (void *)MEMORY[0x230FBD990]();
    int v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = __int16 v21 = v15;
      __int16 v23 = HMFBooleanToString();
      *(_DWORD *)buf = 138544899;
      v59 = v22;
      __int16 v60 = 2114;
      id v61 = v57;
      __int16 v62 = 2160;
      uint64_t v63 = 1752392040;
      __int16 v64 = 2112;
      v65 = v21;
      __int16 v66 = 2112;
      v67 = v23;
      __int16 v68 = 2113;
      v69 = v17;
      __int16 v70 = 2112;
      v71 = v13;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Received response from %{mask.hash}@, isFinal: %@, payload: %{private}@, error: %@", buf, 0x48u);

      long long v15 = v21;
    }

    unint64_t v24 = [v12 destinationAddress];
    int v25 = [v24 isEqualToString:v15];

    if (v25)
    {
      uint64_t v26 = (void *)MEMORY[0x230FBD990]();
      __int16 v27 = v19;
      char v28 = HMFGetOSLogHandle();
      id v10 = v57;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        uint64_t v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v59 = v29;
        __int16 v60 = 2114;
        id v61 = v57;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Received response to directed message", buf, 0x16u);
      }
      id v9 = v13;
      [(HMDUserDeviceCapabilitiesRequestManager *)v27 _completeWithResponse:v17 error:v13 context:v12];
    }
    else
    {
      id v10 = v57;
      if ([v17 count])
      {
        v30 = [v12 receivedResponses];
        [v30 addObject:v17];
      }
      uint64_t v31 = [v12 requestedCapabilities];
      BOOL v32 = [(HMDRemoteMessageTransport *)v19 doesResponse:v17 matchAllCapabilities:v31];

      id v9 = v13;
      if (v32)
      {
        v33 = (void *)MEMORY[0x230FBD990]();
        id v34 = v19;
        id v35 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          id v36 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v59 = v36;
          __int16 v60 = 2114;
          id v61 = v57;
          _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Response matched all capabilities", buf, 0x16u);
        }
        id v37 = [(HMDUserDeviceCapabilitiesRequestManager *)v34 _selectBestResponseForContext:v12];

        uint64_t v38 = [v37 objectForKeyedSubscript:@"kIDSMessageResponseErrorDataKey"];

        [(HMDUserDeviceCapabilitiesRequestManager *)v34 _completeWithResponse:v37 error:v38 context:v12];
        id v9 = (id)v38;
        long long v17 = v37;
      }
      else if (v14)
      {
        v39 = [(HMDUserDeviceCapabilitiesRequestManager *)v19 _selectBestResponseForContext:v12];
        v40 = v39;
        if (v39)
        {
          id v41 = v39;

          uint64_t v42 = [v41 objectForKeyedSubscript:@"kIDSMessageResponseErrorDataKey"];

          id v9 = (id)v42;
          long long v17 = v41;
        }
        v43 = (void *)MEMORY[0x230FBD990]();
        v44 = v19;
        v45 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          v46 = HMFGetLogIdentifier();
          [v12 receivedResponses];
          id v47 = v9;
          id v49 = v48 = v15;
          uint64_t v50 = [v49 count];
          *(_DWORD *)buf = 138544387;
          v59 = v46;
          __int16 v60 = 2114;
          id v61 = v57;
          __int16 v62 = 2048;
          uint64_t v63 = v50;
          __int16 v64 = 2113;
          v65 = v17;
          __int16 v66 = 2112;
          v67 = v47;
          _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Received %lu responses and is final. Responding with payload: %{private}@, error: %@", buf, 0x34u);

          long long v15 = v48;
          id v9 = v47;
        }
        [(HMDUserDeviceCapabilitiesRequestManager *)v44 _completeWithResponse:v17 error:v9 context:v12];

        id v10 = v57;
      }
      else
      {
        id v51 = (void *)MEMORY[0x230FBD990]();
        id v52 = v19;
        char v53 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          v54 = HMFGetLogIdentifier();
          v55 = [v12 receivedResponses];
          uint64_t v56 = [v55 count];
          *(_DWORD *)buf = 138543874;
          v59 = v54;
          __int16 v60 = 2114;
          id v61 = v57;
          __int16 v62 = 2048;
          uint64_t v63 = v56;
          _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Received %lu responses so far but they do not match all capabilities", buf, 0x20u);

          id v10 = v57;
        }

        [(HMDUserDeviceCapabilitiesRequestManager *)v52 _updateResponseTimeoutForContext:v12];
      }
    }

    id v8 = v17;
  }
}

- (id)_responseHandlerForTransactionID:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__HMDUserDeviceCapabilitiesRequestManager__responseHandlerForTransactionID___block_invoke;
  aBlock[3] = &unk_264A2D420;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = _Block_copy(aBlock);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v6;
}

void __76__HMDUserDeviceCapabilitiesRequestManager__responseHandlerForTransactionID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    os_unfair_lock_lock_with_options();
    [(os_unfair_lock_s *)WeakRetained _handleResponsePayload:v5 error:v7 transactionID:*(void *)(a1 + 32)];
    os_unfair_lock_unlock(WeakRetained + 18);
    [(os_unfair_lock_s *)WeakRetained _cancelPendingTimerContexts];
  }
}

- (id)_updateDeviceCapabilities:(id)a3 withDestination:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = v5;
  }
  else
  {
    if (v5)
    {
      id v8 = (void *)[v5 mutableCopy];
    }
    else
    {
      id v8 = [MEMORY[0x263EFF9A0] dictionary];
    }
    id v7 = v8;
    id v9 = objc_msgSend(v8, "hmf_dictionaryForKey:", @"kRequestedCapabilitiesKey");
    id v10 = (void *)[v9 mutableCopy];

    if (!v10)
    {
      id v10 = [MEMORY[0x263EFF9A0] dictionary];
    }
    [v10 setObject:&unk_26E471B90 forKeyedSubscript:@"kHomedVersionKey"];
    [v7 setObject:v10 forKeyedSubscript:@"kRequestedCapabilitiesKey"];
  }
  return v7;
}

- (void)electDeviceForUserID:(id)a3 destination:(id)a4 deviceCapabilities:(id)a5 responseTimeout:(double)a6 responseQueue:(id)a7 completionHandler:(id)a8
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v53 = a3;
  id v14 = a4;
  queue = a7;
  id v52 = a8;
  v54 = v14;
  v55 = [(HMDUserDeviceCapabilitiesRequestManager *)self _updateDeviceCapabilities:a5 withDestination:v14];
  if (a6 == 0.0)
  {
    long long v15 = (void *)MEMORY[0x230FBD990]();
    long long v16 = self;
    long long v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      long long v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v60 = v18;
      __int16 v61 = 2048;
      uint64_t v62 = 0x404E000000000000;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Response timeout is not set. Defaulting to %.0f", buf, 0x16u);
    }
    a6 = 60.0;
  }
  int v19 = [(HMDUserDeviceCapabilitiesRequestManager *)self messageTargetUUID];
  uint64_t v20 = [(HMDRemoteMessageTransport *)self accountRegistry];
  uint64_t v56 = +[HMDMessageDispatcher destinationWithTarget:v19 userID:v53 destination:v54 multicast:1 accountRegistry:v20];

  if (v56)
  {
    __int16 v21 = [[HMDRemoteMessage alloc] initWithName:@"kElectDeviceForIDSSessionKey" qualityOfService:9 destination:v56 payload:v55 type:0 timeout:0 secure:a6 restriction:-1 sendOptions:2];
    v22 = [(HMDRemoteMessage *)v21 transactionIdentifier];
    id v23 = v56;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      int v25 = v23;
    }
    else {
      int v25 = 0;
    }
    id v50 = v25;

    if ((isKindOfClass & 1) == 0)
    {
      v43 = (void *)MEMORY[0x230FBD990]();
      v44 = self;
      v45 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      {
        v46 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v60 = v46;
        _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Destination is not for a remote type", buf, 0xCu);
      }
      id v47 = [[HMDAssertionLogEvent alloc] initWithReason:@"Destination is not for a remote type"];
      v48 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v48 submitLogEvent:v47];
    }
    id v49 = objc_msgSend(v55, "hmf_dictionaryForKey:", @"kRequestedCapabilitiesKey");
    uint64_t v26 = [__HMDRequestedCapabilitiesContext alloc];
    __int16 v27 = [v50 remoteDestinationString];
    char v28 = [(__HMDRequestedCapabilitiesContext *)v26 initWithTransactionID:v22 requestedCapabilities:v49 destinationAddress:v27 responseQueue:queue completionHandler:v52];

    os_unfair_lock_lock_with_options();
    if (self) {
      requestContexts = self->_requestContexts;
    }
    else {
      requestContexts = 0;
    }
    v30 = requestContexts;
    [(NSMutableDictionary *)v30 setObject:v28 forKeyedSubscript:v22];

    os_unfair_lock_unlock(&self->_lock);
    uint64_t v31 = (void *)MEMORY[0x230FBD990]();
    BOOL v32 = self;
    v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      id v34 = HMFGetLogIdentifier();
      id v35 = [(HMDRemoteMessage *)v21 identifier];
      id v36 = [v55 shortDescription];
      *(_DWORD *)buf = 138544130;
      __int16 v60 = v34;
      __int16 v61 = 2114;
      uint64_t v62 = (uint64_t)v22;
      __int16 v63 = 2114;
      __int16 v64 = v35;
      __int16 v65 = 2114;
      __int16 v66 = v36;
      _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Sending message %{public}@ to elect device with capabilities: %{public}@", buf, 0x2Au);
    }
    id v37 = [(HMDUserDeviceCapabilitiesRequestManager *)v32 _responseHandlerForTransactionID:v22];
    [(HMDRemoteMessage *)v21 setResponseHandler:v37];

    if (self) {
      messageDispatcher = v32->_messageDispatcher;
    }
    else {
      messageDispatcher = 0;
    }
    [(HMDMessageDispatcher *)messageDispatcher sendMessage:v21 completionHandler:0];
  }
  else
  {
    v39 = (void *)MEMORY[0x230FBD990]();
    v40 = self;
    id v41 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v42 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v60 = v42;
      __int16 v61 = 2112;
      uint64_t v62 = (uint64_t)v53;
      __int16 v63 = 2112;
      __int16 v64 = v54;
      _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot elect device: could not create message destination for userID: %@, destination: %@", buf, 0x20u);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __143__HMDUserDeviceCapabilitiesRequestManager_electDeviceForUserID_destination_deviceCapabilities_responseTimeout_responseQueue_completionHandler___block_invoke;
    block[3] = &unk_264A2DFA0;
    __int16 v58 = (HMDRemoteMessage *)v52;
    dispatch_async(queue, block);
    __int16 v21 = v58;
  }
}

void __143__HMDUserDeviceCapabilitiesRequestManager_electDeviceForUserID_destination_deviceCapabilities_responseTimeout_responseQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
  (*(void (**)(uint64_t, id, void, void))(v1 + 16))(v1, v2, 0, MEMORY[0x263EFFA78]);
}

- (void)registerForMessages
{
  v7[1] = *MEMORY[0x263EF8340];
  if (isInternalBuild())
  {
    if (self) {
      messageDispatcher = self->_messageDispatcher;
    }
    else {
      messageDispatcher = 0;
    }
    id v4 = messageDispatcher;
    id v5 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
    v7[0] = v5;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
    [(HMFMessageDispatcher *)v4 registerForMessage:@"hm.reqcap" receiver:self policies:v6 selector:sel__handleRequestCapabilitiesXPCRequest_];
  }
}

- (HMDUserDeviceCapabilitiesRequestManager)initWithHomeManager:(id)a3 accountRegistry:(id)a4 messageDispatcher:(id)a5 timerManager:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMDUserDeviceCapabilitiesRequestManager;
  v13 = [(HMDRemoteMessageTransport *)&v20 initWithAccountRegistry:a4];
  id v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_homeManager, v10);
    objc_storeStrong((id *)&v14->_messageDispatcher, a5);
    long long v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    requestContexts = v14->_requestContexts;
    v14->_requestContexts = v15;

    objc_storeStrong((id *)&v14->_timerManager, a6);
    [(HMFTimerManager *)v14->_timerManager setDelegate:v14];
    long long v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    timerContextsToCancel = v14->_timerContextsToCancel;
    v14->_timerContextsToCancel = v17;
  }
  return v14;
}

- (HMDUserDeviceCapabilitiesRequestManager)initWithHomeManager:(id)a3 accountRegistry:(id)a4 messageDispatcher:(id)a5
{
  id v8 = (objc_class *)MEMORY[0x263F42660];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)[[v8 alloc] initWithOptions:0];
  v13 = [(HMDUserDeviceCapabilitiesRequestManager *)self initWithHomeManager:v11 accountRegistry:v10 messageDispatcher:v9 timerManager:v12];

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t20_133447 != -1) {
    dispatch_once(&logCategory__hmf_once_t20_133447, &__block_literal_global_133448);
  }
  id v2 = (void *)logCategory__hmf_once_v21_133449;
  return v2;
}

void __54__HMDUserDeviceCapabilitiesRequestManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v21_133449;
  logCategory__hmf_once_v21_133449 = v0;
}

@end