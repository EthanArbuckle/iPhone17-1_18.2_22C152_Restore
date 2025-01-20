@interface HMDRapportMessaging
+ (HMDRapportMessaging)sharedInstance;
+ (id)logCategory;
- (BOOL)isRapportDeviceDiscoveredWithIdentifier:(id)a3;
- (HMDRapportMessaging)initWithClientFactory:(id)a3;
- (HMDRapportMessagingReachabilityDelegate)reachabilityDelegate;
- (id)_clientForIDSIdentifier:(id)a3 withDevice:(id)a4;
- (id)_createRapportClientForDevice:(id)a3;
- (void)_completeQueuedRequests;
- (void)_configureDiscoveryClientWithCompletion:(id)a3;
- (void)_handleRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_invalidateDestinationDeviceWithIDSIdentifier:(id)a3;
- (void)_queueRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_updateDevice:(id)a3 reachable:(BOOL)a4;
- (void)configureDiscoveryClientWithCompletion:(id)a3;
- (void)registerRequestHandler:(id)a3;
- (void)sendRequest:(id)a3 requestID:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7;
- (void)setReachabilityDelegate:(id)a3;
@end

@implementation HMDRapportMessaging

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceClients, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong(&self->_requestHandler, 0);
  objc_storeStrong((id *)&self->_discoveryClient, 0);
  objc_storeStrong((id *)&self->_clientFactory, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_reachabilityDelegate);
}

- (void)setReachabilityDelegate:(id)a3
{
}

- (HMDRapportMessagingReachabilityDelegate)reachabilityDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_reachabilityDelegate);
  return (HMDRapportMessagingReachabilityDelegate *)WeakRetained;
}

- (void)_updateDevice:(id)a3 reachable:(BOOL)a4
{
  id v6 = a3;
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__HMDRapportMessaging__updateDevice_reachable___block_invoke;
  block[3] = &unk_1E6A18708;
  id v10 = v6;
  v11 = self;
  BOOL v12 = a4;
  id v8 = v6;
  dispatch_async(workQueue, block);
}

void __47__HMDRapportMessaging__updateDevice_reachable___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F29128]);
  v3 = [*(id *)(a1 + 32) idsDeviceIdentifier];
  id v5 = (id)[v2 initWithUUIDString:v3];

  if (v5)
  {
    v4 = [*(id *)(a1 + 40) reachabilityDelegate];
    [v4 rapportMessaging:*(void *)(a1 + 40) idsIdentifier:v5 didAppearReachable:*(unsigned __int8 *)(a1 + 48)];
  }
}

- (void)_invalidateDestinationDeviceWithIDSIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  dispatch_assert_queue_V2(workQueue);
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self) {
    deviceClients = self->_deviceClients;
  }
  else {
    deviceClients = 0;
  }
  id v8 = deviceClients;
  v9 = [(NSMutableDictionary *)v8 objectForKeyedSubscript:v4];

  if (v9)
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    v11 = self;
    HMFGetOSLogHandle();
    BOOL v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      int v16 = 138543618;
      v17 = v13;
      __int16 v18 = 2114;
      id v19 = v4;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Invalidating Rapport client for device: %{public}@", (uint8_t *)&v16, 0x16u);
    }
    if (self) {
      v14 = v11->_deviceClients;
    }
    else {
      v14 = 0;
    }
    v15 = v14;
    [(NSMutableDictionary *)v15 removeObjectForKey:v4];
  }
  os_unfair_lock_unlock(p_lock);
  [v9 invalidate];
}

- (id)_createRapportClientForDevice:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v29 = v8;
    __int16 v30 = 2112;
    id v31 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Creating Rapport client for device: %@", buf, 0x16u);
  }
  if (v6) {
    clientFactory = v6->_clientFactory;
  }
  else {
    clientFactory = 0;
  }
  id v10 = [(HMDRapportMessagingClientFactory *)clientFactory newCompanionLinkClient];
  [v10 setDestinationDevice:v4];
  [v10 setControlFlags:0x20000400800];
  [v10 setServiceType:@"com.apple.home.messaging"];
  if (v6) {
    workQueue = v6->_workQueue;
  }
  else {
    workQueue = 0;
  }
  [v10 setDispatchQueue:workQueue];
  BOOL v12 = [v4 idsDeviceIdentifier];
  objc_initWeak((id *)buf, v6);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __53__HMDRapportMessaging__createRapportClientForDevice___block_invoke;
  v24[3] = &unk_1E6A16550;
  objc_copyWeak(&v27, (id *)buf);
  id v13 = v12;
  id v25 = v13;
  id v14 = v4;
  id v26 = v14;
  [v10 setDisconnectHandler:v24];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __53__HMDRapportMessaging__createRapportClientForDevice___block_invoke_98;
  v21[3] = &unk_1E6A16CE0;
  objc_copyWeak(&v23, (id *)buf);
  id v15 = v14;
  id v22 = v15;
  [v10 setInterruptionHandler:v21];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __53__HMDRapportMessaging__createRapportClientForDevice___block_invoke_2;
  v18[3] = &unk_1E6A16CE0;
  objc_copyWeak(&v20, (id *)buf);
  id v16 = v15;
  id v19 = v16;
  [v10 setInvalidationHandler:v18];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v23);

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);

  return v10;
}

void __53__HMDRapportMessaging__createRapportClientForDevice___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = WeakRetained;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    uint64_t v7 = *(void *)(a1 + 32);
    int v9 = 138543618;
    id v10 = v6;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Rapport client disconnected for device: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  id v8 = [*(id *)(a1 + 40) idsDeviceIdentifier];
  [v4 _invalidateDestinationDeviceWithIDSIdentifier:v8];
}

void __53__HMDRapportMessaging__createRapportClientForDevice___block_invoke_98(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [*(id *)(a1 + 32) idsDeviceIdentifier];
  [WeakRetained _invalidateDestinationDeviceWithIDSIdentifier:v2];
}

void __53__HMDRapportMessaging__createRapportClientForDevice___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = WeakRetained;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    uint64_t v7 = [*(id *)(a1 + 32) idsDeviceIdentifier];
    int v8 = 138543618;
    int v9 = v6;
    __int16 v10 = 2114;
    __int16 v11 = v7;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Rapport client invalidated for device: %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

- (id)_clientForIDSIdentifier:(id)a3 withDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  dispatch_assert_queue_V2(workQueue);
  id v9 = v7;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self) {
    deviceClients = self->_deviceClients;
  }
  else {
    deviceClients = 0;
  }
  uint64_t v12 = deviceClients;
  uint64_t v13 = [(NSMutableDictionary *)v12 objectForKeyedSubscript:v6];

  if (v13)
  {
    id v14 = v13;
    os_unfair_lock_unlock(p_lock);
    id v15 = v9;
  }
  else
  {
    id v16 = v9;
    if (!v9)
    {
      if (self) {
        clientFactory = self->_clientFactory;
      }
      else {
        clientFactory = 0;
      }
      __int16 v18 = clientFactory;
      id v16 = [(HMDRapportMessagingClientFactory *)v18 newCompanionLinkDevice];

      [v16 setIdentifier:v6];
    }
    if (self) {
      id v19 = self->_clientFactory;
    }
    else {
      id v19 = 0;
    }
    id v20 = v19;
    v21 = [(HMDRapportMessaging *)self _createRapportClientForDevice:v16];
    id v22 = [(HMDRapportMessagingClientFactory *)v20 newRapportDeviceClientWrapperWithClient:v21];

    if (self) {
      id v23 = self->_deviceClients;
    }
    else {
      id v23 = 0;
    }
    v24 = v23;
    [(NSMutableDictionary *)v24 setObject:v22 forKeyedSubscript:v6];

    os_unfair_lock_unlock(&self->_lock);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __58__HMDRapportMessaging__clientForIDSIdentifier_withDevice___block_invoke;
    v26[3] = &unk_1E6A18BA0;
    v26[4] = self;
    id v15 = v16;
    id v27 = v15;
    id v28 = v6;
    [v22 activateWithCompletion:v26];
    id v14 = v22;
  }
  return v14;
}

void __58__HMDRapportMessaging__clientForIDSIdentifier_withDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543874;
      __int16 v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to activate Rapport client for device: %@, error: %@", (uint8_t *)&v9, 0x20u);
    }
    [*(id *)(a1 + 32) _invalidateDestinationDeviceWithIDSIdentifier:*(void *)(a1 + 48)];
  }
}

- (void)_completeQueuedRequests
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    requestQueue = self->_requestQueue;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    requestQueue = 0;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
  }
  id v4 = requestQueue;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        __int16 v10 = (void *)MEMORY[0x1D9452090](v5);
        (*(void (**)(uint64_t))(v9 + 16))(v9);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v6 = v5;
    }
    while (v5);
  }

  if (self) {
    __int16 v11 = self->_requestQueue;
  }
  else {
    __int16 v11 = 0;
  }
  [(NSMutableArray *)v11 removeAllObjects];
}

- (void)_queueRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    objc_initWeak(&location, self);
    requestQueue = self->_requestQueue;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    requestQueue = 0;
    id location = 0;
  }
  long long v12 = requestQueue;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__HMDRapportMessaging__queueRequest_options_responseHandler___block_invoke;
  aBlock[3] = &unk_1E6A17B18;
  objc_copyWeak(&v21, &location);
  id v13 = v10;
  id v20 = v13;
  id v14 = v8;
  id v18 = v14;
  id v15 = v9;
  id v19 = v15;
  id v16 = _Block_copy(aBlock);
  [(NSMutableArray *)v12 addObject:v16];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __61__HMDRapportMessaging__queueRequest_options_responseHandler___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if (!objc_getProperty(WeakRetained, v3, 48, 1))
    {
      id v10 = (void *)MEMORY[0x1D9452090]();
      id v11 = v4;
      long long v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        id v13 = HMFGetLogIdentifier();
        int v16 = 138543362;
        uint64_t v17 = v13;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Request handler is nil", (uint8_t *)&v16, 0xCu);
      }
      id v14 = [[HMDAssertionLogEvent alloc] initWithReason:@"Request handler is nil"];
      id v15 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v15 submitLogEvent:v14];
    }
    if (objc_getProperty(v4, v5, 48, 1))
    {
      id Property = objc_getProperty(v4, v6, 48, 1);
      (*((void (**)(id, void, void, void))Property + 2))(Property, *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48));
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1 description:@"Unexpected error." reason:@"HMDRapportMessaging has been deallocated." suggestion:0];
    (*(void (**)(uint64_t, void, void, void *))(v8 + 16))(v8, 0, 0, v9);
  }
}

- (void)_handleRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    if (objc_getProperty(self, v10, 48, 1))
    {
      id Property = (void (**)(id, id, id, id))objc_getProperty(self, v11, 48, 1);
      Property[2](Property, v13, v8, v9);
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_assert_queue_V2(0);
  }
  [(HMDRapportMessaging *)self _queueRequest:v13 options:v8 responseHandler:v9];
LABEL_6:
}

- (void)_configureDiscoveryClientWithCompletion:(id)a3
{
  id v4 = a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    id v5 = [(HMDRapportMessagingClientFactory *)self->_clientFactory newCompanionLinkClient];
    objc_setProperty_atomic(self, v6, v5, 40);

    objc_msgSend(objc_getProperty(self, v7, 40, 1), "setControlFlags:", 4196356);
    objc_msgSend(objc_getProperty(self, v8, 40, 1), "setServiceType:", @"com.apple.home.messaging");
    id v9 = self->_workQueue;
    id Property = objc_getProperty(self, v10, 40, 1);
  }
  else
  {
    dispatch_assert_queue_V2(0);

    [0 setControlFlags:4196356];
    [0 setServiceType:@"com.apple.home.messaging"];
    id v9 = 0;
    id Property = 0;
  }
  [Property setDispatchQueue:v9];

  objc_initWeak(location, self);
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke;
  v53[3] = &unk_1E6A16E40;
  objc_copyWeak(&v54, location);
  if (self) {
    id v13 = objc_getProperty(self, v12, 40, 1);
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;
  [v14 setInterruptionHandler:v53];

  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_74;
  v51[3] = &unk_1E6A16E40;
  objc_copyWeak(&v52, location);
  if (self) {
    id v16 = objc_getProperty(self, v15, 40, 1);
  }
  else {
    id v16 = 0;
  }
  id v17 = v16;
  [v17 setInvalidationHandler:v51];

  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_75;
  v49[3] = &unk_1E6A13E60;
  objc_copyWeak(&v50, location);
  if (self) {
    id v19 = objc_getProperty(self, v18, 40, 1);
  }
  else {
    id v19 = 0;
  }
  id v20 = v19;
  [v20 setDeviceLostHandler:v49];

  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_77;
  v47[3] = &unk_1E6A13E60;
  objc_copyWeak(&v48, location);
  if (self) {
    id v22 = objc_getProperty(self, v21, 40, 1);
  }
  else {
    id v22 = 0;
  }
  id v23 = v22;
  [v23 setDeviceFoundHandler:v47];

  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_78;
  v45[3] = &unk_1E6A13E88;
  objc_copyWeak(&v46, location);
  if (self) {
    id v25 = objc_getProperty(self, v24, 40, 1);
  }
  else {
    id v25 = 0;
  }
  id v26 = v25;
  [v26 setDeviceChangedHandler:v45];

  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_80;
  v43[3] = &unk_1E6A16E40;
  objc_copyWeak(&v44, location);
  if (self) {
    id v28 = objc_getProperty(self, v27, 40, 1);
  }
  else {
    id v28 = 0;
  }
  id v29 = v28;
  [v29 setErrorFlagsChangedHandler:v43];

  if (self)
  {
    id v31 = objc_getProperty(self, v30, 40, 1);
    uint64_t v32 = v4;
  }
  else
  {
    uint64_t v32 = v4;
    id v31 = 0;
  }
  id v33 = v31;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_81;
  v41[3] = &unk_1E6A13EB0;
  objc_copyWeak(&v42, location);
  [v33 registerRequestID:@"com.apple.home.messaging.rid" options:0 handler:v41];

  if (self) {
    id v35 = objc_getProperty(self, v34, 40, 1);
  }
  else {
    id v35 = 0;
  }
  id v36 = v35;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_2;
  v38[3] = &unk_1E6A16F80;
  objc_copyWeak(&v40, location);
  id v37 = v32;
  id v39 = v37;
  [v36 activateWithCompletion:v38];

  objc_destroyWeak(&v40);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&v44);
  objc_destroyWeak(&v46);
  objc_destroyWeak(&v48);
  objc_destroyWeak(&v50);
  objc_destroyWeak(&v52);
  objc_destroyWeak(&v54);
  objc_destroyWeak(location);
}

void __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = WeakRetained;
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v6 = 138543362;
    SEL v7 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Discovery client interrupted", (uint8_t *)&v6, 0xCu);
  }
}

void __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_74(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = WeakRetained;
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v6 = 138543362;
    SEL v7 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Discovery client invalidated", (uint8_t *)&v6, 0xCu);
  }
}

void __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_75(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = WeakRetained;
  SEL v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    id v11 = v8;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Discovery client lost device: %@", (uint8_t *)&v10, 0x16u);
  }
  id v9 = [v3 idsDeviceIdentifier];
  [v6 _invalidateDestinationDeviceWithIDSIdentifier:v9];
}

void __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_77(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = WeakRetained;
  SEL v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    int v10 = v8;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Discovery client found device: %@", (uint8_t *)&v9, 0x16u);
  }
  [v6 _updateDevice:v3 reachable:1];
}

void __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_78(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = WeakRetained;
  SEL v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    int v10 = v8;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Discovery client device changed: %@", (uint8_t *)&v9, 0x16u);
  }
}

void __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_80(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = WeakRetained;
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    if (v3) {
      id Property = objc_getProperty(v3, v5, 40, 1);
    }
    else {
      id Property = 0;
    }
    [Property errorFlags];
    uint64_t v8 = NSPrintF();
    *(_DWORD *)buf = 138543618;
    int v10 = v6;
    __int16 v11 = 2112;
    id v12 = v8;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Discovery client error flag changed: %@", buf, 0x16u);
  }
}

void __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_81(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v10 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _handleRequest:v12 options:v7 responseHandler:v8];
  }
  else
  {
    __int16 v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1 description:@"Unexpected error." reason:@"HMDRapportMessaging has been deallocated" suggestion:0];
    (*((void (**)(id, void, void, void *))v8 + 2))(v8, 0, 0, v11);
  }
}

void __63__HMDRapportMessaging__configureDiscoveryClientWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = WeakRetained;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    __int16 v11 = v8;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Activated Rapport client with error: %@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }
}

- (BOOL)isRapportDeviceDiscoveredWithIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self && objc_getProperty(self, v4, 40, 1))
  {
    id v7 = objc_msgSend(objc_getProperty(self, v6, 40, 1), "activeDevices");
    id v8 = (void *)[v7 copy];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __63__HMDRapportMessaging_isRapportDeviceDiscoveredWithIdentifier___block_invoke;
    v16[3] = &unk_1E6A13E38;
    id v17 = v5;
    uint64_t v9 = objc_msgSend(v8, "na_firstObjectPassingTest:", v16);
    BOOL v10 = v9 != 0;
  }
  else
  {
    __int16 v11 = (void *)MEMORY[0x1D9452090]();
    __int16 v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v19 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Discovery client is not configured", buf, 0xCu);
    }
    BOOL v10 = 0;
  }

  return v10;
}

uint64_t __63__HMDRapportMessaging_isRapportDeviceDiscoveredWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 idsDeviceIdentifier];
  id v4 = [*(id *)(a1 + 32) UUIDString];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)sendRequest:(id)a3 requestID:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = v15;
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __83__HMDRapportMessaging_sendRequest_requestID_destinationID_options_responseHandler___block_invoke;
  v25[3] = &unk_1E6A18640;
  if (a4) {
    uint64_t v18 = (__CFString *)a4;
  }
  else {
    uint64_t v18 = @"com.apple.home.messaging.rid";
  }
  v25[4] = self;
  id v26 = v13;
  id v27 = v18;
  id v28 = v12;
  id v29 = v14;
  id v30 = v15;
  id v19 = v14;
  id v20 = v12;
  id v21 = v16;
  id v22 = v13;
  id v23 = v18;
  id v24 = a4;
  dispatch_async(workQueue, v25);
}

void __83__HMDRapportMessaging_sendRequest_requestID_destinationID_options_responseHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _clientForIDSIdentifier:*(void *)(a1 + 40) withDevice:0];
  id v5 = v2;
  if (v2)
  {
    [v2 sendRequestID:*(void *)(a1 + 48) request:*(void *)(a1 + 56) options:*(void *)(a1 + 64) responseHandler:*(void *)(a1 + 72)];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 72);
    id v4 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"Not found." reason:@"Could not create a device matching the destination" suggestion:0];
    (*(void (**)(uint64_t, void, void, void *))(v3 + 16))(v3, 0, 0, v4);
  }
}

- (void)registerRequestHandler:(id)a3
{
  id v4 = a3;
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__HMDRapportMessaging_registerRequestHandler___block_invoke;
  v7[3] = &unk_1E6A19530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

uint64_t __46__HMDRapportMessaging_registerRequestHandler___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_setProperty_atomic_copy(v3, a2, *(id *)(a1 + 40), 48);
    uint64_t v3 = *(void **)(a1 + 32);
  }
  return [v3 _completeQueuedRequests];
}

- (void)configureDiscoveryClientWithCompletion:(id)a3
{
  id v4 = a3;
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__HMDRapportMessaging_configureDiscoveryClientWithCompletion___block_invoke;
  v7[3] = &unk_1E6A19530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

uint64_t __62__HMDRapportMessaging_configureDiscoveryClientWithCompletion___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3)
  {
    if (objc_getProperty(v3, a2, 40, 1))
    {
      uint64_t result = *(void *)(a1 + 40);
      if (result)
      {
        id v5 = *(uint64_t (**)(void))(result + 16);
        return v5();
      }
      return result;
    }
    uint64_t v3 = *(void **)(a1 + 32);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v3 _configureDiscoveryClientWithCompletion:v6];
}

- (HMDRapportMessaging)initWithClientFactory:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HMDRapportMessaging;
  uint64_t v6 = [(HMDRapportMessaging *)&v18 init];
  id v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    HMDispatchQueueNameString();
    id v8 = objc_claimAutoreleasedReturnValue();
    uint64_t v9 = (const char *)[v8 UTF8String];
    BOOL v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create(v9, v10);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v7->_clientFactory, a3);
    id v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    requestQueue = v7->_requestQueue;
    v7->_requestQueue = v13;

    id v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    deviceClients = v7->_deviceClients;
    v7->_deviceClients = v15;
  }
  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16_154831 != -1) {
    dispatch_once(&logCategory__hmf_once_t16_154831, &__block_literal_global_101);
  }
  id v2 = (void *)logCategory__hmf_once_v17_154832;
  return v2;
}

uint64_t __34__HMDRapportMessaging_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v17_154832;
  logCategory__hmf_once_v17_154832 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (HMDRapportMessaging)sharedInstance
{
  if (sharedInstance_onceToken_154836 != -1) {
    dispatch_once(&sharedInstance_onceToken_154836, &__block_literal_global_154837);
  }
  id v2 = (void *)sharedInstance_sharedInstance_154838;
  return (HMDRapportMessaging *)v2;
}

void __37__HMDRapportMessaging_sharedInstance__block_invoke()
{
  uint64_t v0 = [HMDRapportMessaging alloc];
  uint64_t v3 = objc_alloc_init(HMDRapportMessagingClientFactory);
  uint64_t v1 = [(HMDRapportMessaging *)v0 initWithClientFactory:v3];
  id v2 = (void *)sharedInstance_sharedInstance_154838;
  sharedInstance_sharedInstance_154838 = v1;
}

@end