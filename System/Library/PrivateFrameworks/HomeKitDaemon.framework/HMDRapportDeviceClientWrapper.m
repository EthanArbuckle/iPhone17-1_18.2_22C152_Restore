@interface HMDRapportDeviceClientWrapper
+ (id)logCategory;
- (HMDRapportDeviceClientWrapper)initWithClient:(id)a3;
- (void)_completeQueuedRequestsWithError:(id)a3;
- (void)_queueRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
@end

@implementation HMDRapportDeviceClientWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)_completeQueuedRequestsWithError:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self) {
    requestQueue = self->_requestQueue;
  }
  else {
    requestQueue = 0;
  }
  if (([(NSMutableArray *)requestQueue hmf_isEmpty] & 1) == 0)
  {
    v6 = (void *)MEMORY[0x230FBD990]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      if (self) {
        v10 = v7->_requestQueue;
      }
      else {
        v10 = 0;
      }
      v11 = v10;
      uint64_t v12 = [(NSMutableArray *)v11 count];
      if (self) {
        client = v7->_client;
      }
      else {
        client = 0;
      }
      v14 = client;
      v15 = [(RPCompanionLinkClient *)v14 destinationDevice];
      *(_DWORD *)buf = 138544130;
      v29 = v9;
      __int16 v30 = 2048;
      uint64_t v31 = v12;
      __int16 v32 = 2112;
      v33 = v15;
      __int16 v34 = 2112;
      id v35 = v4;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Completing %lu queued request(s) to device: %@, with error: %@", buf, 0x2Au);
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    if (self) {
      v16 = v7->_requestQueue;
    }
    else {
      v16 = 0;
    }
    v17 = v16;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v17);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v23 + 1) + 8 * i) + 16))();
        }
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v19);
    }

    if (self) {
      v22 = v7->_requestQueue;
    }
    else {
      v22 = 0;
    }
    [(NSMutableArray *)v22 removeAllObjects];
  }
}

- (void)_queueRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)MEMORY[0x230FBD990]();
  v15 = self;
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = HMFGetLogIdentifier();
    if (v15) {
      client = v15->_client;
    }
    else {
      client = 0;
    }
    uint64_t v19 = client;
    uint64_t v20 = [(RPCompanionLinkClient *)v19 destinationDevice];
    *(_DWORD *)buf = 138543618;
    id v35 = v17;
    __int16 v36 = 2112;
    v37 = v20;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Queuing request to device: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, v15);
  if (v15) {
    requestQueue = v15->_requestQueue;
  }
  else {
    requestQueue = 0;
  }
  v22 = requestQueue;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__HMDRapportDeviceClientWrapper__queueRequestID_request_options_responseHandler___block_invoke;
  aBlock[3] = &unk_264A19318;
  objc_copyWeak(&v33, (id *)buf);
  id v23 = v13;
  id v32 = v23;
  id v24 = v10;
  id v29 = v24;
  id v25 = v11;
  id v30 = v25;
  id v26 = v12;
  id v31 = v26;
  v27 = _Block_copy(aBlock);
  [(NSMutableArray *)v22 addObject:v27];

  objc_destroyWeak(&v33);
  objc_destroyWeak((id *)buf);
}

void __81__HMDRapportDeviceClientWrapper__queueRequestID_request_options_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = WeakRetained;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (WeakRetained) {
      v5 = (void *)*((void *)WeakRetained + 1);
    }
    else {
      v5 = 0;
    }
    [v5 sendRequestID:*(void *)(a1 + 32) request:*(void *)(a1 + 40) options:*(void *)(a1 + 48) responseHandler:*(void *)(a1 + 56)];
  }
}

- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self && (unint64_t activateState = self->_activateState, activateState >= 2))
  {
    if (activateState == 3)
    {
      v15 = (void *)MEMORY[0x263F087E8];
      v16 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:3203];
      v17 = [v15 hmErrorWithCode:54 description:@"Communication failure." reason:@"Cannot send request on client that failed to activate." suggestion:0 underlyingError:v16];
      (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0, 0, v17);
    }
    else
    {
      if (activateState != 2)
      {
        uint64_t v18 = (void *)MEMORY[0x230FBD990]();
        uint64_t v19 = self;
        uint64_t v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        {
          v21 = HMFGetLogIdentifier();
          int v24 = 138543362;
          id v25 = v21;
          _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: State is not activated.", (uint8_t *)&v24, 0xCu);
        }
        v22 = [[HMDAssertionLogEvent alloc] initWithReason:@"State is not activated."];
        id v23 = +[HMDMetricsManager sharedLogEventSubmitter];
        [v23 submitLogEvent:v22];
      }
      [(RPCompanionLinkClient *)self->_client sendRequestID:v10 request:v11 options:v12 responseHandler:v13];
    }
  }
  else
  {
    [(HMDRapportDeviceClientWrapper *)self _queueRequestID:v10 request:v11 options:v12 responseHandler:v13];
  }
}

- (void)invalidate
{
  if (self)
  {
    self->_unint64_t activateState = 3;
    v3 = (void *)MEMORY[0x263F087E8];
    id v4 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:3203];
    v5 = [v3 hmErrorWithCode:54 description:@"Communication failure." reason:@"The client was invalidated." suggestion:0 underlyingError:v4];
    [(HMDRapportDeviceClientWrapper *)self _completeQueuedRequestsWithError:v5];

    client = self->_client;
  }
  else
  {
    v7 = (void *)MEMORY[0x263F087E8];
    v8 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:3203];
    v9 = [v7 hmErrorWithCode:54 description:@"Communication failure." reason:@"The client was invalidated." suggestion:0 underlyingError:v8];
    [0 _completeQueuedRequestsWithError:v9];

    client = 0;
  }
  [(RPCompanionLinkClient *)client invalidate];
}

- (void)activateWithCompletion:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *))a3;
  if (self)
  {
    if (self->_activateState)
    {
      id v13 = (void *)MEMORY[0x230FBD990]();
      v14 = self;
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v22 = v16;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Activate called more than once.", buf, 0xCu);
      }
      v17 = [[HMDAssertionLogEvent alloc] initWithReason:@"Activate called more than once."];
      uint64_t v18 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v18 submitLogEvent:v17];

      if (self->_activateState)
      {
        id v12 = [MEMORY[0x263F087E8] hmErrorWithCode:-1 description:@"Unexpected error." reason:@"Activate called more than once." suggestion:0];
        v4[2](v4, v12);
        goto LABEL_11;
      }
    }
    self->_unint64_t activateState = 1;
  }
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = HMFGetLogIdentifier();
    if (self) {
      client = v6->_client;
    }
    else {
      client = 0;
    }
    id v10 = client;
    id v11 = [(RPCompanionLinkClient *)v10 destinationDevice];
    *(_DWORD *)buf = 138543618;
    v22 = v8;
    __int16 v23 = 2112;
    int v24 = v11;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Activating client for destination: %@", buf, 0x16u);
  }
  if (self) {
    self = (HMDRapportDeviceClientWrapper *)v6->_client;
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __56__HMDRapportDeviceClientWrapper_activateWithCompletion___block_invoke;
  v19[3] = &unk_264A2EDE0;
  v19[4] = v6;
  uint64_t v20 = v4;
  [(HMDRapportDeviceClientWrapper *)self activateWithCompletion:v19];
  id v12 = v20;
LABEL_11:
}

void __56__HMDRapportDeviceClientWrapper_activateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = v3;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x263F087E8];
    v5 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:3203 underlyingError:v3];
    id v6 = [v4 hmErrorWithCode:54 description:@"Communication failure." reason:@"Failed to activate Rapport client." suggestion:0 underlyingError:v5];
  }
  else
  {
    id v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7 && *(void *)(v7 + 16) == 1)
  {
    uint64_t v8 = 2;
    if (v6) {
      uint64_t v8 = 3;
    }
    *(void *)(v7 + 16) = v8;
    [*(id *)(a1 + 32) _completeQueuedRequestsWithError:v6];
  }
}

- (HMDRapportDeviceClientWrapper)initWithClient:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDRapportDeviceClientWrapper;
  id v6 = [(HMDRapportDeviceClientWrapper *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_client, a3);
    uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    requestQueue = v7->_requestQueue;
    v7->_requestQueue = v8;
  }
  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5_38377 != -1) {
    dispatch_once(&logCategory__hmf_once_t5_38377, &__block_literal_global_38378);
  }
  v2 = (void *)logCategory__hmf_once_v6_38379;
  return v2;
}

void __44__HMDRapportDeviceClientWrapper_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v6_38379;
  logCategory__hmf_once_v6_38379 = v0;
}

@end