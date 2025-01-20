@interface HMDAccessorySymptomHandler
+ (id)logCategory;
- (BOOL)_shouldFilterWiFiMismatchSymptomForAccessory:(id)a3;
- (HMDAccessory)accessory;
- (HMDAccessorySymptomHandler)initWithAccessory:(id)a3;
- (HMDAccessorySymptomHandler)initWithAccessory:(id)a3 logIdentifier:(id)a4 symptomManager:(id)a5 activeClientConnectionsManager:(id)a6;
- (HMDActiveXPCClientConnectionsManager)activeClientConnectionsManager;
- (HMDSymptomManager)symptomManager;
- (HMFMessageDispatcher)msgDispatcher;
- (NSSet)symptoms;
- (NSString)logIdentifier;
- (NSUUID)accessoryUUID;
- (NSUUID)sfDeviceIdentifier;
- (NSUUID)uuid;
- (OS_dispatch_queue)workQueue;
- (id)_filteredSymptomsForSymptoms:(id)a3;
- (void)_handleInitiateFixMessage:(id)a3;
- (void)_handleSubscribeMessage:(id)a3;
- (void)_handleUnsubscribeMessage:(id)a3;
- (void)_notifyAllSubscribedClientConnections;
- (void)_notifySubscribedClientConnection:(id)a3;
- (void)_notifySubscribedClientConnections:(id)a3;
- (void)_registerMessages;
- (void)_updateSFDeviceIdentifier:(id)a3;
- (void)clientConnectionsManager:(id)a3 didHandleActivationForClientConnection:(id)a4;
- (void)configure;
- (void)handleAccessoryDeviceUpdated;
- (void)setSfDeviceIdentifier:(id)a3;
- (void)setSymptoms:(id)a3;
- (void)symptomManager:(id)a3 didChangeSFDeviceIdentifier:(id)a4;
- (void)symptomManager:(id)a3 didChangeSymptoms:(id)a4;
- (void)updateSymptoms:(id)a3;
@end

@implementation HMDAccessorySymptomHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong((id *)&self->_sfDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_activeClientConnectionsManager, 0);
  objc_storeStrong((id *)&self->_symptomManager, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_symptoms, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

- (NSUUID)accessoryUUID
{
  return self->_accessoryUUID;
}

- (void)setSfDeviceIdentifier:(id)a3
{
}

- (NSUUID)sfDeviceIdentifier
{
  return self->_sfDeviceIdentifier;
}

- (HMDActiveXPCClientConnectionsManager)activeClientConnectionsManager
{
  return (HMDActiveXPCClientConnectionsManager *)objc_getProperty(self, a2, 64, 1);
}

- (HMDSymptomManager)symptomManager
{
  return (HMDSymptomManager *)objc_getProperty(self, a2, 56, 1);
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setSymptoms:(id)a3
{
}

- (NSSet)symptoms
{
  return self->_symptoms;
}

- (HMDAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDAccessory *)WeakRetained;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)clientConnectionsManager:(id)a3 didHandleActivationForClientConnection:(id)a4
{
  id v6 = a4;
  v5 = [(HMDAccessorySymptomHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  [(HMDAccessorySymptomHandler *)self _notifySubscribedClientConnection:v6];
}

- (void)symptomManager:(id)a3 didChangeSFDeviceIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDAccessorySymptomHandler *)self workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__HMDAccessorySymptomHandler_symptomManager_didChangeSFDeviceIdentifier___block_invoke;
  v8[3] = &unk_1E6A197C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

uint64_t __73__HMDAccessorySymptomHandler_symptomManager_didChangeSFDeviceIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSFDeviceIdentifier:*(void *)(a1 + 40)];
}

- (void)symptomManager:(id)a3 didChangeSymptoms:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDAccessorySymptomHandler *)self workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__HMDAccessorySymptomHandler_symptomManager_didChangeSymptoms___block_invoke;
  v8[3] = &unk_1E6A197C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __63__HMDAccessorySymptomHandler_symptomManager_didChangeSymptoms___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 _filteredSymptomsForSymptoms:*(void *)(a1 + 40)];
  [v1 updateSymptoms:v2];
}

- (void)_handleUnsubscribeMessage:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDAccessorySymptomHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    v10 = [v4 shortDescription];
    int v22 = 138543618;
    v23 = v9;
    __int16 v24 = 2112;
    uint64_t v25 = (uint64_t)v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling unsubscribe message: %@", (uint8_t *)&v22, 0x16u);
  }
  v11 = [v4 transport];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    v14 = [(HMDAccessorySymptomHandler *)v7 activeClientConnectionsManager];
    [v14 removeClientConnection:v13];

    [v4 respondWithSuccess];
  }
  else
  {
    v15 = (void *)MEMORY[0x1D9452090]();
    v16 = v7;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      uint64_t v19 = objc_opt_class();
      v20 = [v4 transport];
      int v22 = 138543874;
      v23 = v18;
      __int16 v24 = 2112;
      uint64_t v25 = v19;
      __int16 v26 = 2112;
      v27 = v20;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unsubscribing transport was not of expected class %@: %@", (uint8_t *)&v22, 0x20u);
    }
    v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v21];
  }
}

- (void)_handleSubscribeMessage:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDAccessorySymptomHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    v10 = [v4 shortDescription];
    int v22 = 138543618;
    v23 = v9;
    __int16 v24 = 2112;
    uint64_t v25 = (uint64_t)v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling subscribe message: %@", (uint8_t *)&v22, 0x16u);
  }
  v11 = [v4 transport];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    v14 = [(HMDAccessorySymptomHandler *)v7 activeClientConnectionsManager];
    [v14 addClientConnection:v13];

    [v4 respondWithSuccess];
  }
  else
  {
    v15 = (void *)MEMORY[0x1D9452090]();
    v16 = v7;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      uint64_t v19 = objc_opt_class();
      v20 = [v4 transport];
      int v22 = 138543874;
      v23 = v18;
      __int16 v24 = 2112;
      uint64_t v25 = v19;
      __int16 v26 = 2112;
      v27 = v20;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Subscribing transport was not of expected class %@: %@", (uint8_t *)&v22, 0x20u);
    }
    v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v21];
  }
}

- (void)_handleInitiateFixMessage:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDAccessorySymptomHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    v10 = [v4 shortDescription];
    *(_DWORD *)buf = 138543618;
    uint64_t v25 = v9;
    __int16 v26 = 2112;
    v27 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling initiate fix message: %@", buf, 0x16u);
  }
  v11 = [(HMDAccessorySymptomHandler *)v7 accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    v14 = [(HMDAccessorySymptomHandler *)v7 symptomManager];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __56__HMDAccessorySymptomHandler__handleInitiateFixMessage___block_invoke;
    v21[3] = &unk_1E6A18BA0;
    v21[4] = v7;
    id v22 = v13;
    id v23 = v4;
    [v14 initiateFixForAccessory:v22 completion:v21];
  }
  else
  {
    v15 = (void *)MEMORY[0x1D9452090]();
    v16 = v7;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      uint64_t v19 = [(HMDAccessorySymptomHandler *)v16 accessory];
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v18;
      __int16 v26 = 2112;
      v27 = v19;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot initiate fix for non-Apple-media accessory %@", buf, 0x16u);
    }
    v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v20];
  }
}

void __56__HMDAccessorySymptomHandler__handleInitiateFixMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      int v12 = 138543874;
      id v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to initiate fix for accessory %@: %@", (uint8_t *)&v12, 0x20u);
    }
    [*(id *)(a1 + 48) respondWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      int v12 = 138543618;
      id v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully initiated fix for accessory: %@", (uint8_t *)&v12, 0x16u);
    }
    [*(id *)(a1 + 48) respondWithSuccess];
  }
}

- (void)_notifySubscribedClientConnections:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDAccessorySymptomHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  id v7 = [(HMDAccessorySymptomHandler *)self symptoms];
  v8 = encodeRootObjectForIncomingXPCMessage(v7, 0);
  [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F2E198]];

  uint64_t v9 = [(HMDAccessorySymptomHandler *)self sfDeviceIdentifier];
  [v6 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F2E180]];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v4;
  uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    uint64_t v13 = *MEMORY[0x1E4F2E190];
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * v14);
        __int16 v16 = [MEMORY[0x1E4F654B0] entitledMessageWithName:v13 messagePayload:v6];
        [v16 setTransport:v15];
        id v17 = objc_alloc(MEMORY[0x1E4F65488]);
        uint64_t v18 = [(HMDAccessorySymptomHandler *)self messageTargetUUID];
        uint64_t v19 = (void *)[v17 initWithTarget:v18];
        [v16 setDestination:v19];

        v20 = [(HMDAccessorySymptomHandler *)self msgDispatcher];
        [v20 sendMessage:v16];

        ++v14;
      }
      while (v11 != v14);
      uint64_t v11 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }
}

- (void)_notifySubscribedClientConnection:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDAccessorySymptomHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v11 = 138543618;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Notifying subscribed client of updated symptom state: %@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
  [(HMDAccessorySymptomHandler *)v7 _notifySubscribedClientConnections:v10];
}

- (void)_notifyAllSubscribedClientConnections
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessorySymptomHandler *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDAccessorySymptomHandler *)self activeClientConnectionsManager];
  id v5 = [v4 clientConnections];

  uint64_t v6 = [v5 count];
  id v7 = (void *)MEMORY[0x1D9452090]();
  v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  uint64_t v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      id v14 = v11;
      __int16 v15 = 2048;
      uint64_t v16 = [v5 count];
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying all %lu subscribed clients of updated symptom state", (uint8_t *)&v13, 0x16u);
    }
    [(HMDAccessorySymptomHandler *)v8 _notifySubscribedClientConnections:v5];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      id v14 = v12;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEBUG, "%{public}@No subscribed clients to notify of updated symptom state", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (BOOL)_shouldFilterWiFiMismatchSymptomForAccessory:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 home];
  uint64_t v6 = [v4 device];
  id v7 = [v6 productInfo];

  if (v7)
  {
    if ([v7 productClass] != 6)
    {
      uint64_t v10 = (void *)MEMORY[0x1D9452090]();
      int v11 = self;
      uint64_t v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v13;
        id v14 = "%{public}@Removing WiFi network mismatch symptom for accessory because it is not an audio accessory";
LABEL_17:
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, v14, buf, 0xCu);
      }
LABEL_18:

      BOOL v18 = 1;
      goto LABEL_19;
    }
    v8 = [v7 softwareVersion];
    uint64_t v9 = v8;
    if (v8) {
      [v8 operatingSystemVersion];
    }
    *(_OWORD *)buf = *MEMORY[0x1E4F65230];
    uint64_t v22 = *(void *)(MEMORY[0x1E4F65230] + 16);
    uint64_t v15 = HMFOperatingSystemVersionCompare();

    if (v15 == -1)
    {
      uint64_t v10 = (void *)MEMORY[0x1D9452090]();
      uint64_t v19 = self;
      uint64_t v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v13;
        id v14 = "%{public}@Removing WiFi network mismatch symptom for accessory because it is a pre-Peace accessory";
        goto LABEL_17;
      }
      goto LABEL_18;
    }
  }
  if ([v5 synchronouslyFetchIsConnectedToCarPlayNetwork])
  {
    uint64_t v10 = (void *)MEMORY[0x1D9452090]();
    uint64_t v16 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v13;
      id v14 = "%{public}@Removing WiFi network mismatch symptom for accessory because there is a wireless CarPlay connection";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if ([v5 hasActiveWACPairing])
  {
    uint64_t v10 = (void *)MEMORY[0x1D9452090]();
    uint64_t v17 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v13;
      id v14 = "%{public}@Removing WiFi network mismatch symptom for accessory because there is an active WAC pairing";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  BOOL v18 = 0;
LABEL_19:

  return v18;
}

- (id)_filteredSymptomsForSymptoms:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDAccessorySymptomHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)[v4 mutableCopy];
  id v7 = [(HMDAccessorySymptomHandler *)self accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F2EB68]) initWithType:11];
    if ([v6 containsObject:v10]
      && [(HMDAccessorySymptomHandler *)self _shouldFilterWiFiMismatchSymptomForAccessory:v9])
    {
      [v6 removeObject:v10];
    }
    int v11 = [v9 capabilities];
    if (([v11 supportsCaptiveNetworks] & 1) == 0)
    {
      uint64_t v12 = (void *)MEMORY[0x1D9452090]();
      int v13 = self;
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = HMFGetLogIdentifier();
        int v19 = 138543618;
        v20 = v15;
        __int16 v21 = 2112;
        id v22 = v9;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Remove NeedCaptiveLeaseRenewal symptom as accessory %@ does not support captive networks", (uint8_t *)&v19, 0x16u);
      }
      uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F2EB68]) initWithType:19];
      [v6 removeObject:v16];
    }
  }
  uint64_t v17 = (void *)[v6 copy];

  return v17;
}

- (void)_registerMessages
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessorySymptomHandler *)self msgDispatcher];
  uint64_t v4 = *MEMORY[0x1E4F2E178];
  id v5 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v20[0] = v5;
  uint64_t v6 = [(HMDAccessorySymptomHandler *)self accessory];
  id v7 = [v6 home];
  v8 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v7 userPrivilege:4 remoteAccessRequired:0];
  v20[1] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  [v3 registerForMessage:v4 receiver:self policies:v9 selector:sel__handleInitiateFixMessage_];

  uint64_t v10 = [(HMDAccessorySymptomHandler *)self msgDispatcher];
  uint64_t v11 = *MEMORY[0x1E4F2E188];
  uint64_t v12 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  int v19 = v12;
  int v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  [v10 registerForMessage:v11 receiver:self policies:v13 selector:sel__handleSubscribeMessage_];

  id v14 = [(HMDAccessorySymptomHandler *)self msgDispatcher];
  uint64_t v15 = *MEMORY[0x1E4F2E1A0];
  uint64_t v16 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  BOOL v18 = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  [v14 registerForMessage:v15 receiver:self policies:v17 selector:sel__handleUnsubscribeMessage_];
}

- (void)_updateSFDeviceIdentifier:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(HMDAccessorySymptomHandler *)self workQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(HMDAccessorySymptomHandler *)self sfDeviceIdentifier];
  char v6 = HMFEqualObjects();

  if ((v6 & 1) == 0)
  {
    [(HMDAccessorySymptomHandler *)self setSfDeviceIdentifier:v7];
    [(HMDAccessorySymptomHandler *)self _notifyAllSubscribedClientConnections];
  }
}

- (void)updateSymptoms:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDAccessorySymptomHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = [(HMDAccessorySymptomHandler *)self symptoms];
  char v7 = [v6 isEqualToSet:v4];

  v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v11)
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v13 = [(HMDAccessorySymptomHandler *)v9 symptoms];
      int v16 = 138543618;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      int v19 = v13;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Not updating accessory symptoms from %@", (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    if (v11)
    {
      id v14 = HMFGetLogIdentifier();
      uint64_t v15 = [(HMDAccessorySymptomHandler *)v9 symptoms];
      int v16 = 138543874;
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      int v19 = v15;
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating accessory symptoms from %@ to %@", (uint8_t *)&v16, 0x20u);
    }
    [(HMDAccessorySymptomHandler *)v9 setSymptoms:v4];
    [(HMDAccessorySymptomHandler *)v9 _notifyAllSubscribedClientConnections];
  }
}

- (void)handleAccessoryDeviceUpdated
{
  id v3 = [(HMDAccessorySymptomHandler *)self accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v8 = v4;

  id v5 = [v8 home];
  int v6 = [v5 isOwnerUser];

  if (v6)
  {
    char v7 = [(HMDAccessorySymptomHandler *)self symptomManager];
    [v7 registerAccessory:v8 delegate:self];
  }
}

- (void)configure
{
  id v3 = [(HMDAccessorySymptomHandler *)self activeClientConnectionsManager];
  [v3 setDelegate:self];

  id v4 = [(HMDAccessorySymptomHandler *)self activeClientConnectionsManager];
  [v4 configure];

  id v5 = [(HMDAccessorySymptomHandler *)self accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v6 = v5;
  }
  else {
    int v6 = 0;
  }
  id v10 = v6;

  char v7 = [v10 home];
  int v8 = [v7 isOwnerUser];

  if (v8)
  {
    if (v10)
    {
      id v9 = [(HMDAccessorySymptomHandler *)self symptomManager];
      [v9 registerAccessory:v10 delegate:self];
    }
    [(HMDAccessorySymptomHandler *)self _registerMessages];
  }
}

- (HMDAccessorySymptomHandler)initWithAccessory:(id)a3 logIdentifier:(id)a4 symptomManager:(id)a5 activeClientConnectionsManager:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)HMDAccessorySymptomHandler;
  id v14 = [(HMDAccessorySymptomHandler *)&v27 init];
  uint64_t v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_accessory, v10);
    objc_storeStrong((id *)&v15->_logIdentifier, a4);
    objc_storeStrong((id *)&v15->_symptomManager, a5);
    objc_storeStrong((id *)&v15->_activeClientConnectionsManager, a6);
    uint64_t v16 = [v10 workQueue];
    workQueue = v15->_workQueue;
    v15->_workQueue = (OS_dispatch_queue *)v16;

    uint64_t v18 = [v10 msgDispatcher];
    msgDispatcher = v15->_msgDispatcher;
    v15->_msgDispatcher = (HMFMessageDispatcher *)v18;

    uint64_t v20 = [v10 uuid];
    accessoryUUID = v15->_accessoryUUID;
    v15->_accessoryUUID = (NSUUID *)v20;

    uint64_t v22 = [MEMORY[0x1E4F1CAD0] set];
    symptoms = v15->_symptoms;
    v15->_symptoms = (NSSet *)v22;

    uint64_t v24 = [MEMORY[0x1E4F2EB70] symptomsHandlerUUIDFromAccessoryUUID:v15->_accessoryUUID];
    uuid = v15->_uuid;
    v15->_uuid = (NSUUID *)v24;
  }
  return v15;
}

- (HMDAccessorySymptomHandler)initWithAccessory:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  int v6 = [v5 uuid];
  char v7 = [(HMDAccessorySymptomHandler *)self uuid];
  int v8 = [v4 stringWithFormat:@"%@.%@", v6, v7];

  id v9 = +[HMDMainDriver driver];
  id v10 = [v9 symptomManager];

  id v11 = [HMDActiveXPCClientConnectionsManager alloc];
  id v12 = [v5 workQueue];
  id v13 = [(HMDActiveXPCClientConnectionsManager *)v11 initWithLogIdentifier:v8 workQueue:v12];

  id v14 = [(HMDAccessorySymptomHandler *)self initWithAccessory:v5 logIdentifier:v8 symptomManager:v10 activeClientConnectionsManager:v13];
  return v14;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24 != -1) {
    dispatch_once(&logCategory__hmf_once_t24, &__block_literal_global_15172);
  }
  id v2 = (void *)logCategory__hmf_once_v25;
  return v2;
}

uint64_t __41__HMDAccessorySymptomHandler_logCategory__block_invoke()
{
  logCategory__hmf_once_long long v25 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

@end