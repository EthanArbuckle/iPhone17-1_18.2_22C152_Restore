@interface HMDWiFiManagementController
+ (id)logCategory;
+ (id)sharedPSKForNetworkWithSSID:(id)a3;
- (BOOL)supportsStationConfiguration;
- (HMDHAPAccessory)accessory;
- (HMDService)service;
- (HMDWiFiManagementController)initWithAccessory:(id)a3 wiFiTransportService:(id)a4 workQueue:(id)a5;
- (HMDWiFiReconfigurationLogEvent)reconfigurationLogEvent;
- (HMFTimer)reconfigurationTimeoutTimer;
- (NSNotificationCenter)notificationCenter;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (id)reconfigurationCompletion;
- (id)reconfigurationVerificationCallback;
- (int64_t)capabilities;
- (int64_t)reconfigurationState;
- (unsigned)reconfigurationCookie;
- (void)_accessoryDidBecomeReachable:(id)a3;
- (void)_commitConfigurationUpdate;
- (void)_performWiFiConfigurationControlRequest:(id)a3 withDescription:(id)a4 completion:(id)a5;
- (void)_reconfigurationCompletedWithSuccess:(BOOL)a3 error:(id)a4;
- (void)reconfigureWithSSID:(id)a3 PSK:(id)a4 logEvent:(id)a5 completion:(id)a6;
- (void)safelyReconfigureWithSSID:(id)a3 PSK:(id)a4 verificationCallback:(id)a5 logEvent:(id)a6 completion:(id)a7;
- (void)setReconfigurationCompletion:(id)a3;
- (void)setReconfigurationCookie:(unsigned __int16)a3;
- (void)setReconfigurationLogEvent:(id)a3;
- (void)setReconfigurationState:(int64_t)a3;
- (void)setReconfigurationTimeoutTimer:(id)a3;
- (void)setReconfigurationVerificationCallback:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDWiFiManagementController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reconfigurationLogEvent, 0);
  objc_storeStrong(&self->_reconfigurationCompletion, 0);
  objc_storeStrong(&self->_reconfigurationVerificationCallback, 0);
  objc_storeStrong((id *)&self->_reconfigurationTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_accessory);
}

- (void)setReconfigurationLogEvent:(id)a3
{
}

- (HMDWiFiReconfigurationLogEvent)reconfigurationLogEvent
{
  return self->_reconfigurationLogEvent;
}

- (void)setReconfigurationCompletion:(id)a3
{
}

- (id)reconfigurationCompletion
{
  return self->_reconfigurationCompletion;
}

- (void)setReconfigurationVerificationCallback:(id)a3
{
}

- (id)reconfigurationVerificationCallback
{
  return self->_reconfigurationVerificationCallback;
}

- (void)setReconfigurationTimeoutTimer:(id)a3
{
}

- (HMFTimer)reconfigurationTimeoutTimer
{
  return self->_reconfigurationTimeoutTimer;
}

- (void)setReconfigurationCookie:(unsigned __int16)a3
{
  self->_reconfigurationCookie = a3;
}

- (unsigned)reconfigurationCookie
{
  return self->_reconfigurationCookie;
}

- (void)setReconfigurationState:(int64_t)a3
{
  self->_reconfigurationState = a3;
}

- (int64_t)reconfigurationState
{
  return self->_reconfigurationState;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (HMDService)service
{
  return (HMDService *)objc_getProperty(self, a2, 24, 1);
}

- (HMDHAPAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDWiFiManagementController *)self accessory];
  v3 = [v2 logIdentifier];

  return v3;
}

- (void)_performWiFiConfigurationControlRequest:(id)a3 withDescription:(id)a4 completion:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(HMDWiFiManagementController *)self workQueue];
  dispatch_assert_queue_V2(v11);

  v12 = [(HMDWiFiManagementController *)self service];
  v13 = [v12 findCharacteristicWithType:@"0000022D-0000-1000-8000-0026BB765291"];

  if (v13)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __98__HMDWiFiManagementController__performWiFiConfigurationControlRequest_withDescription_completion___block_invoke;
    aBlock[3] = &unk_1E6A17640;
    aBlock[4] = self;
    id v38 = v9;
    v14 = (__CFString *)v9;
    v42 = v14;
    id v15 = v10;
    id v43 = v15;
    v37 = _Block_copy(aBlock);
    v39 = [(HMDWiFiManagementController *)self accessory];
    if (v8)
    {
      id v40 = 0;
      v16 = [v8 serializeWithError:&v40];
      id v17 = v40;
      v18 = (void *)MEMORY[0x1D9452090]();
      v19 = self;
      v20 = HMFGetOSLogHandle();
      v21 = v20;
      if (!v16)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v36 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v47 = v36;
          __int16 v48 = 2112;
          v49 = v14;
          __int16 v50 = 2112;
          id v51 = v17;
          _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize Wi-Fi Configuration Control request for %@: %@", buf, 0x20u);
        }
        if (!v15)
        {
          v16 = 0;
          v26 = v37;
          id v9 = v38;
          goto LABEL_16;
        }
        v23 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
        (*((void (**)(id, void, void *))v15 + 2))(v15, 0, v23);
        v16 = 0;
        v26 = v37;
        id v9 = v38;
LABEL_15:

LABEL_16:
        goto LABEL_17;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v47 = v22;
        __int16 v48 = 2112;
        v49 = v14;
        __int16 v50 = 2112;
        id v51 = v8;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Writing Wi-Fi Configuration Control request for %@: %@", buf, 0x20u);
      }
      v23 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v13 value:v16 authorizationData:0 type:0];
      v45 = v23;
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
      v25 = [(HMDWiFiManagementController *)v19 workQueue];
      v26 = v37;
      [v39 writeCharacteristicValues:v24 source:7 queue:v25 completionHandler:v37];
    }
    else
    {
      v32 = (void *)MEMORY[0x1D9452090]();
      v33 = self;
      v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v47 = v35;
        __int16 v48 = 2112;
        v49 = v14;
        _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_INFO, "%{public}@Reading Wi-Fi Configuration Control for %@", buf, 0x16u);
      }
      id v17 = +[HMDCharacteristicRequest requestWithCharacteristic:v13];
      id v44 = v17;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
      v23 = [(HMDWiFiManagementController *)v33 workQueue];
      v26 = v37;
      [v39 readCharacteristicValues:v16 source:7 queue:v23 completionHandler:v37];
    }
    id v9 = v38;
    goto LABEL_15;
  }
  v27 = (void *)MEMORY[0x1D9452090]();
  v28 = self;
  v29 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    v30 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v47 = v30;
    __int16 v48 = 2112;
    v49 = @"0000022D-0000-1000-8000-0026BB765291";
    _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Missing required characteristic: %@", buf, 0x16u);
  }
  if (v10)
  {
    v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v31);
  }
LABEL_17:
}

void __98__HMDWiFiManagementController__performWiFiConfigurationControlRequest_withDescription_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v4);

  v5 = [v3 firstObject];
  v6 = [v5 error];

  if (!v6)
  {
    id v15 = [v5 value];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
    id v17 = v16;

    if (v17)
    {
      id v32 = 0;
      v18 = [MEMORY[0x1E4F5BE80] parsedFromData:v17 error:&v32];
      id v14 = v32;
      if (v18)
      {
        v19 = (void *)MEMORY[0x1D9452090]();
        id v20 = *(id *)(a1 + 32);
        v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v22 = HMFGetLogIdentifier();
          uint64_t v23 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138543874;
          v34 = v22;
          __int16 v35 = 2112;
          uint64_t v36 = v23;
          __int16 v37 = 2112;
          id v38 = v18;
          _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Received Wi-Fi Configuration Control response for %@: %@", buf, 0x20u);
        }
        uint64_t v24 = *(void *)(a1 + 48);
        if (v24) {
          (*(void (**)(uint64_t, void *, void))(v24 + 16))(v24, v18, 0);
        }
LABEL_23:

        goto LABEL_24;
      }
    }
    else
    {
      id v14 = 0;
    }
    v25 = (void *)MEMORY[0x1D9452090]();
    id v26 = *(id *)(a1 + 32);
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = HMFGetLogIdentifier();
      uint64_t v29 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v34 = v28;
      __int16 v35 = 2112;
      uint64_t v36 = v29;
      __int16 v37 = 2112;
      id v38 = v14;
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse Wi-Fi Configuration Control response for %@: %@", buf, 0x20u);
    }
    uint64_t v30 = *(void *)(a1 + 48);
    if (v30)
    {
      if (v14)
      {
        (*(void (**)(uint64_t, void, id))(v30 + 16))(v30, 0, v14);
      }
      else
      {
        v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:43];
        (*(void (**)(uint64_t, void, void *))(v30 + 16))(v30, 0, v31);

        id v14 = 0;
      }
    }
    v18 = 0;
    goto LABEL_23;
  }
  v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v10 = HMFGetLogIdentifier();
    uint64_t v11 = *(void *)(a1 + 40);
    v12 = [v5 error];
    *(_DWORD *)buf = 138543874;
    v34 = v10;
    __int16 v35 = 2112;
    uint64_t v36 = v11;
    __int16 v37 = 2112;
    id v38 = v12;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Wi-Fi Configuration Control request for %@ failed: %@", buf, 0x20u);
  }
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13)
  {
    id v14 = [v5 error];
    (*(void (**)(uint64_t, void, id))(v13 + 16))(v13, 0, v14);
LABEL_24:
  }
}

- (void)_reconfigurationCompletedWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v14 = a4;
  v6 = [(HMDWiFiManagementController *)self workQueue];
  dispatch_assert_queue_V2(v6);

  v7 = [(HMDWiFiManagementController *)self reconfigurationLogEvent];
  if (v7)
  {
    if (v4)
    {
      id v8 = 0;
    }
    else
    {
      id v8 = v14;
      if (!v14)
      {
        id v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
        [v7 setError:v9];

        goto LABEL_7;
      }
    }
    [v7 setError:v8];
LABEL_7:
    id v10 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v10 submitLogEvent:v7];

    [(HMDWiFiManagementController *)self setReconfigurationLogEvent:0];
  }
  uint64_t v11 = [(HMDWiFiManagementController *)self reconfigurationCompletion];
  v12 = [(HMDWiFiManagementController *)self notificationCenter];
  [v12 removeObserver:self];

  uint64_t v13 = [(HMDWiFiManagementController *)self reconfigurationTimeoutTimer];
  [v13 suspend];

  [(HMDWiFiManagementController *)self setReconfigurationTimeoutTimer:0];
  [(HMDWiFiManagementController *)self setReconfigurationCookie:0];
  [(HMDWiFiManagementController *)self setReconfigurationVerificationCallback:0];
  [(HMDWiFiManagementController *)self setReconfigurationCompletion:0];
  [(HMDWiFiManagementController *)self setReconfigurationState:0];
  if (v4)
  {
    if (v11) {
      v11[2](v11, 0);
    }
  }
  else
  {
    completeWithError(v11, v14);
  }
}

- (void)_commitConfigurationUpdate
{
  id v3 = [(HMDWiFiManagementController *)self workQueue];
  dispatch_assert_queue_V2(v3);

  [(HMDWiFiManagementController *)self setReconfigurationState:4];
  BOOL v4 = makeConfigurationControl(4);
  id v5 = objc_alloc(MEMORY[0x1E4F5BE68]);
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[HMDWiFiManagementController reconfigurationCookie](self, "reconfigurationCookie"));
  v7 = (void *)[v5 initWithValue:v6];
  [v4 setCookie:v7];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__HMDWiFiManagementController__commitConfigurationUpdate__block_invoke;
  v8[3] = &unk_1E6A0B690;
  v8[4] = self;
  [(HMDWiFiManagementController *)self _performWiFiConfigurationControlRequest:v4 withDescription:@"Commit Fail-Safe Update" completion:v8];
}

void __57__HMDWiFiManagementController__commitConfigurationUpdate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    v16 = *(void **)(a1 + 32);
    uint64_t v17 = 0;
    id v18 = v6;
LABEL_12:
    [v16 _reconfigurationCompletedWithSuccess:v17 error:v18];
    goto LABEL_13;
  }
  v7 = [v5 updateStatus];
  int v8 = [v7 value];

  id v9 = [v5 cookie];
  id v10 = [v9 value];
  unsigned __int16 v11 = [v10 unsignedIntegerValue];

  if ((v8 & 0x40000) != 0
    && [*(id *)(a1 + 32) reconfigurationCookie] == (unsigned __int16)v8
    && [*(id *)(a1 + 32) reconfigurationCookie] == v11)
  {
    v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = *(id *)(a1 + 32);
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = HMFGetLogIdentifier();
      int v26 = 138543362;
      v27 = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Fail-safe Wi-Fi reconfiguration successful", (uint8_t *)&v26, 0xCu);
    }
    v16 = *(void **)(a1 + 32);
    uint64_t v17 = 1;
    id v18 = 0;
    goto LABEL_12;
  }
  v19 = (void *)MEMORY[0x1D9452090]();
  id v20 = *(id *)(a1 + 32);
  v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v22 = HMFGetLogIdentifier();
    int v23 = [*(id *)(a1 + 32) reconfigurationCookie];
    int v26 = 138544130;
    v27 = v22;
    __int16 v28 = 1024;
    int v29 = v11;
    __int16 v30 = 1024;
    int v31 = v8;
    __int16 v32 = 1024;
    int v33 = v23;
    _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to commit fail-safe Wi-Fi reconfiguration (cookie: %04x, status: %08x, expected cookie: %04x)", (uint8_t *)&v26, 0x1Eu);
  }
  uint64_t v24 = *(void **)(a1 + 32);
  v25 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
  [v24 _reconfigurationCompletedWithSuccess:0 error:v25];

LABEL_13:
}

- (void)timerDidFire:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDWiFiManagementController *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDWiFiManagementController *)self reconfigurationTimeoutTimer];
  if (v6 == v4)
  {
    int64_t v7 = [(HMDWiFiManagementController *)self reconfigurationState];

    if (v7 == 2)
    {
      int v8 = (void *)MEMORY[0x1D9452090]();
      id v9 = self;
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        unsigned __int16 v11 = HMFGetLogIdentifier();
        int v13 = 138543362;
        id v14 = v11;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Fail-safe Wi-Fi reconfiguration failed - timed out waiting for accessory reconnection", (uint8_t *)&v13, 0xCu);
      }
      v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:100];
      [(HMDWiFiManagementController *)v9 _reconfigurationCompletedWithSuccess:0 error:v12];
    }
  }
  else
  {
  }
}

- (void)_accessoryDidBecomeReachable:(id)a3
{
  id v4 = [(HMDWiFiManagementController *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HMDWiFiManagementController__accessoryDidBecomeReachable___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

void __60__HMDWiFiManagementController__accessoryDidBecomeReachable___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) reconfigurationState] == 2)
  {
    v2 = [*(id *)(a1 + 32) notificationCenter];
    [v2 removeObserver:*(void *)(a1 + 32)];

    id v3 = [*(id *)(a1 + 32) reconfigurationTimeoutTimer];
    [v3 suspend];

    [*(id *)(a1 + 32) setReconfigurationState:3];
    id v4 = [*(id *)(a1 + 32) reconfigurationVerificationCallback];

    id v5 = *(void **)(a1 + 32);
    if (v4)
    {
      id v6 = [v5 reconfigurationVerificationCallback];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __60__HMDWiFiManagementController__accessoryDidBecomeReachable___block_invoke_2;
      v7[3] = &unk_1E6A18288;
      v7[4] = *(void *)(a1 + 32);
      ((void (**)(void, void *))v6)[2](v6, v7);
    }
    else
    {
      [v5 _commitConfigurationUpdate];
    }
  }
}

void __60__HMDWiFiManagementController__accessoryDidBecomeReachable___block_invoke_2(uint64_t a1, char a2)
{
  id v4 = [*(id *)(a1 + 32) workQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__HMDWiFiManagementController__accessoryDidBecomeReachable___block_invoke_3;
  v5[3] = &unk_1E6A19B58;
  char v6 = a2;
  v5[4] = *(void *)(a1 + 32);
  dispatch_async(v4, v5);
}

void __60__HMDWiFiManagementController__accessoryDidBecomeReachable___block_invoke_3(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 40))
  {
    v2 = *(void **)(a1 + 32);
    [v2 _commitConfigurationUpdate];
  }
  else
  {
    id v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = *(id *)(a1 + 32);
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      char v6 = HMFGetLogIdentifier();
      int v9 = 138543362;
      id v10 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Fail-safe Wi-Fi reconfiguration connection verification failed", (uint8_t *)&v9, 0xCu);
    }
    int64_t v7 = *(void **)(a1 + 32);
    int v8 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1081];
    [v7 _reconfigurationCompletedWithSuccess:0 error:v8];
  }
}

- (void)safelyReconfigureWithSSID:(id)a3 PSK:(id)a4 verificationCallback:(id)a5 logEvent:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [(HMDWiFiManagementController *)self workQueue];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __102__HMDWiFiManagementController_safelyReconfigureWithSSID_PSK_verificationCallback_logEvent_completion___block_invoke;
  v23[3] = &unk_1E6A16690;
  v23[4] = self;
  id v24 = v12;
  id v27 = v16;
  id v28 = v14;
  id v25 = v15;
  id v26 = v13;
  id v18 = v13;
  id v19 = v15;
  id v20 = v14;
  id v21 = v12;
  id v22 = v16;
  dispatch_async(v17, v23);
}

void __102__HMDWiFiManagementController_safelyReconfigureWithSSID_PSK_verificationCallback_logEvent_completion___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) reconfigurationState])
  {
    v2 = *(void **)(a1 + 64);
    id v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v4 = 15;
LABEL_9:
    id v15 = [v3 hmErrorWithCode:v4];
    completeWithError(v2, v15);

    return;
  }
  if (([*(id *)(a1 + 32) supportsStationConfiguration] & 1) == 0)
  {
    v2 = *(void **)(a1 + 64);
    id v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v4 = 48;
    goto LABEL_9;
  }
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = *(id *)(a1 + 32);
  int64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    id v20 = v8;
    __int16 v21 = 2112;
    uint64_t v22 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Performing fail-safe Wi-Fi reconfiguration with SSID '%@'", buf, 0x16u);
  }
  [*(id *)(a1 + 32) setReconfigurationState:1];
  [*(id *)(a1 + 32) setReconfigurationVerificationCallback:*(void *)(a1 + 72)];
  [*(id *)(a1 + 32) setReconfigurationCompletion:*(void *)(a1 + 64)];
  id v10 = *(void **)(a1 + 48);
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = objc_alloc_init(HMDWiFiReconfigurationLogEvent);
  }
  id v12 = v11;
  id v13 = [*(id *)(a1 + 32) accessory];
  [(HMDWiFiReconfigurationLogEvent *)v12 setAccessory:v13];

  [(HMDWiFiReconfigurationLogEvent *)v12 setUsingFailSafeUpdate:1];
  [*(id *)(a1 + 32) setReconfigurationLogEvent:v12];
  id v14 = *(void **)(a1 + 32);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __102__HMDWiFiManagementController_safelyReconfigureWithSSID_PSK_verificationCallback_logEvent_completion___block_invoke_15;
  v16[3] = &unk_1E6A0B668;
  v16[4] = v14;
  id v17 = *(id *)(a1 + 40);
  id v18 = *(id *)(a1 + 56);
  [v14 _performWiFiConfigurationControlRequest:0 withDescription:@"Get Status" completion:v16];
}

void __102__HMDWiFiManagementController_safelyReconfigureWithSSID_PSK_verificationCallback_logEvent_completion___block_invoke_15(id *a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    int64_t v7 = [v5 updateStatus];
    int v8 = [v7 value];

    if ((v8 & 0x10000) != 0)
    {
      id v37 = a1[4];
      id v38 = [MEMORY[0x1E4F28C58] hmErrorWithCode:15];
      [v37 _reconfigurationCompletedWithSuccess:0 error:v38];
    }
    else
    {
      id v9 = v5;
      do
      {
        while (1)
        {
          do
          {
            do
            {
              unsigned __int16 v10 = arc4random();
              int v11 = v10;
            }
            while (!v10);
          }
          while (v10 == 1);
          unsigned __int16 v12 = v10;
          id v13 = [v9 cookie];
          id v14 = [v13 value];
          if (v11 != [v14 unsignedIntValue]) {
            break;
          }
        }
        id v15 = [v9 updateStatus];
        int v16 = (unsigned __int16)[v15 value];
      }
      while (v16 == v12);

      [a1[4] setReconfigurationCookie:v12];
      id v17 = [MEMORY[0x1E4F65530] sharedPreferences];
      id v18 = [v17 preferenceForKey:@"wiFiReconfigurationTimeout"];
      id v19 = [v18 numberValue];
      uint64_t v20 = [v19 integerValue];

      uint64_t v21 = 255;
      if (v20 < 255) {
        uint64_t v21 = v20;
      }
      if (v21 <= 1) {
        uint64_t v22 = 1;
      }
      else {
        uint64_t v22 = v21;
      }
      if (v22 != v20)
      {
        uint64_t v23 = (void *)MEMORY[0x1D9452090]();
        id v24 = a1[4];
        id v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          id v26 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138544130;
          v41 = v26;
          __int16 v42 = 2112;
          id v43 = @"wiFiReconfigurationTimeout";
          __int16 v44 = 2048;
          uint64_t v45 = v20;
          __int16 v46 = 2048;
          uint64_t v47 = v22;
          _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Configured %@ value %ld is out of range, using %ld", buf, 0x2Au);
        }
      }
      id v27 = objc_alloc_init(MEMORY[0x1E4F5BE80]);
      id v28 = (void *)[objc_alloc(MEMORY[0x1E4F5BE88]) initWithValue:3];
      [v27 setOperationType:v28];

      id v29 = objc_alloc(MEMORY[0x1E4F5BE68]);
      __int16 v30 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(a1[4], "reconfigurationCookie"));
      int v31 = (void *)[v29 initWithValue:v30];
      [v27 setCookie:v31];

      __int16 v32 = makeStationConfiguration(a1[5], a1[6]);
      [v27 setStationConfiguration:v32];

      id v33 = objc_alloc(MEMORY[0x1E4F5BE68]);
      uint64_t v34 = [NSNumber numberWithInteger:v22];
      __int16 v35 = (void *)[v33 initWithValue:v34];
      [v27 setOperationTimeout:v35];

      id v36 = a1[4];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __102__HMDWiFiManagementController_safelyReconfigureWithSSID_PSK_verificationCallback_logEvent_completion___block_invoke_23;
      v39[3] = &unk_1E6A0B640;
      v39[4] = v36;
      v39[5] = v22;
      [v36 _performWiFiConfigurationControlRequest:v27 withDescription:@"Fail-Safe Configuration Update" completion:v39];
    }
  }
  else
  {
    [a1[4] _reconfigurationCompletedWithSuccess:0 error:v6];
  }
}

void __102__HMDWiFiManagementController_safelyReconfigureWithSSID_PSK_verificationCallback_logEvent_completion___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  *(void *)&v31[5] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    [*(id *)(a1 + 32) _reconfigurationCompletedWithSuccess:0 error:v6];
    goto LABEL_14;
  }
  int64_t v7 = [v5 updateStatus];
  int v8 = [v7 value];

  if ((v8 & 0x10000) != 0
    && [*(id *)(a1 + 32) reconfigurationCookie] == (unsigned __int16)v8)
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = *(id *)(a1 + 32);
    int v11 = HMFGetOSLogHandle();
    unsigned __int16 v12 = v11;
    if ((v8 & 0x20000) != 0)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v22 = HMFGetLogIdentifier();
        uint64_t v23 = *(void *)(a1 + 40);
        int v28 = 138543618;
        id v29 = v22;
        __int16 v30 = 2048;
        *(void *)int v31 = v23;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Fail-safe Wi-Fi reconfiguration initiated, awaiting accessory disconnect/reconnect with timeout of %ld seconds", (uint8_t *)&v28, 0x16u);
      }
      uint64_t v21 = [*(id *)(a1 + 32) accessory];
      [*(id *)(a1 + 32) setReconfigurationState:2];
      id v24 = [*(id *)(a1 + 32) notificationCenter];
      [v24 addObserver:*(void *)(a1 + 32) selector:sel__accessoryDidBecomeReachable_ name:@"HMDAccessoryIsReachableNotification" object:v21];

      id v25 = [*(id *)(a1 + 32) notificationCenter];
      [v25 addObserver:*(void *)(a1 + 32) selector:sel__accessoryDidBecomeReachable_ name:@"HMDAccessoryConfigNumberUpdatedNotification" object:v21];

      id v26 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:1 options:(double)*(uint64_t *)(a1 + 40)];
      id v27 = [*(id *)(a1 + 32) workQueue];
      [v26 setDelegateQueue:v27];

      [v26 setDelegate:*(void *)(a1 + 32)];
      [*(id *)(a1 + 32) setReconfigurationTimeoutTimer:v26];
      [v26 resume];

      goto LABEL_12;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      int v28 = 138543362;
      id v29 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Wi-Fi reconfiguration without session restart is not supported", (uint8_t *)&v28, 0xCu);
    }
    id v14 = *(void **)(a1 + 32);
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
  }
  else
  {
    int v16 = (void *)MEMORY[0x1D9452090]();
    id v17 = *(id *)(a1 + 32);
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      int v20 = [*(id *)(a1 + 32) reconfigurationCookie];
      int v28 = 138543874;
      id v29 = v19;
      __int16 v30 = 1024;
      *(_DWORD *)int v31 = v8;
      v31[2] = 1024;
      *(_DWORD *)&v31[3] = v20;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to initiate fail-safe Wi-Fi reconfiguration (status: %08x, expected cookie: %04x)", (uint8_t *)&v28, 0x18u);
    }
    id v14 = *(void **)(a1 + 32);
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1080];
  }
  uint64_t v21 = (void *)v15;
  [v14 _reconfigurationCompletedWithSuccess:0 error:v15];
LABEL_12:

LABEL_14:
}

- (void)reconfigureWithSSID:(id)a3 PSK:(id)a4 logEvent:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(HMDWiFiManagementController *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__HMDWiFiManagementController_reconfigureWithSSID_PSK_logEvent_completion___block_invoke;
  block[3] = &unk_1E6A18488;
  id v22 = v11;
  id v23 = v13;
  block[4] = self;
  id v20 = v10;
  id v21 = v12;
  id v15 = v11;
  id v16 = v12;
  id v17 = v10;
  id v18 = v13;
  dispatch_async(v14, block);
}

void __75__HMDWiFiManagementController_reconfigureWithSSID_PSK_logEvent_completion___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) reconfigurationState])
  {
    v2 = *(void **)(a1 + 64);
    id v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v4 = 15;
LABEL_9:
    id v19 = [v3 hmErrorWithCode:v4];
    completeWithError(v2, v19);

    return;
  }
  if (([*(id *)(a1 + 32) supportsStationConfiguration] & 1) == 0)
  {
    v2 = *(void **)(a1 + 64);
    id v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v4 = 48;
    goto LABEL_9;
  }
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = *(id *)(a1 + 32);
  int64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    id v25 = v8;
    __int16 v26 = 2112;
    uint64_t v27 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Performing simple Wi-Fi reconfiguration with SSID '%@'", buf, 0x16u);
  }
  id v10 = *(void **)(a1 + 48);
  if (v10) {
    id v11 = v10;
  }
  else {
    id v11 = objc_alloc_init(HMDWiFiReconfigurationLogEvent);
  }
  id v12 = v11;
  id v13 = [*(id *)(a1 + 32) accessory];
  [(HMDWiFiReconfigurationLogEvent *)v12 setAccessory:v13];

  [(HMDWiFiReconfigurationLogEvent *)v12 setUsingFailSafeUpdate:0];
  [*(id *)(a1 + 32) setReconfigurationState:1];
  id v14 = makeConfigurationControl(2);
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F5BE68]) initWithValue:&unk_1F2DC7CA8];
  [v14 setCookie:v15];

  id v16 = makeStationConfiguration(*(void **)(a1 + 40), *(void **)(a1 + 56));
  [v14 setStationConfiguration:v16];

  id v17 = *(void **)(a1 + 32);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __75__HMDWiFiManagementController_reconfigureWithSSID_PSK_logEvent_completion___block_invoke_8;
  v20[3] = &unk_1E6A0B618;
  id v21 = v12;
  id v22 = v17;
  id v23 = *(id *)(a1 + 64);
  id v18 = v12;
  [v17 _performWiFiConfigurationControlRequest:v14 withDescription:@"Simple Configuration Update" completion:v20];
}

void __75__HMDWiFiManagementController_reconfigureWithSSID_PSK_logEvent_completion___block_invoke_8(id *a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int64_t v7 = v6;
  if (v5)
  {
    id v8 = 0;
LABEL_4:
    uint64_t v9 = a1 + 4;
    [a1[4] setError:v8];
    goto LABEL_5;
  }
  id v8 = v6;
  if (v6) {
    goto LABEL_4;
  }
  id v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
  uint64_t v9 = a1 + 4;
  [a1[4] setError:v16];

LABEL_5:
  id v10 = +[HMDMetricsManager sharedLogEventSubmitter];
  [v10 submitLogEvent:*v9];

  if (v5)
  {
    id v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = a1[5];
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      int v17 = 138543362;
      id v18 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Simple Wi-Fi reconfiguration successful", (uint8_t *)&v17, 0xCu);
    }
    [a1[5] setReconfigurationState:0];
    id v15 = (void (**)(id, void))a1[6];
    if (v15) {
      v15[2](v15, 0);
    }
  }
  else
  {
    [a1[5] setReconfigurationState:0];
    completeWithError(a1[6], v7);
  }
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)[MEMORY[0x1E4F28EB8] defaultCenter];
}

- (BOOL)supportsStationConfiguration
{
  return ((unint64_t)[(HMDWiFiManagementController *)self capabilities] >> 3) & 1;
}

- (int64_t)capabilities
{
  v2 = [(HMDWiFiManagementController *)self accessory];
  id v3 = [v2 wiFiTransportCapabilities];
  int64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (HMDWiFiManagementController)initWithAccessory:(id)a3 wiFiTransportService:(id)a4 workQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMDWiFiManagementController;
  id v11 = [(HMDWiFiManagementController *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_accessory, v8);
    objc_storeStrong((id *)&v12->_service, a4);
    objc_storeStrong((id *)&v12->_workQueue, a5);
  }

  return v12;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t23_50260 != -1) {
    dispatch_once(&logCategory__hmf_once_t23_50260, &__block_literal_global_50261);
  }
  v2 = (void *)logCategory__hmf_once_v24_50262;
  return v2;
}

uint64_t __42__HMDWiFiManagementController_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v24_50262;
  logCategory__hmf_once_v24_50262 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)sharedPSKForNetworkWithSSID:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v23 = @"ssid";
  v24[0] = v3;
  int64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
  id v5 = (void *)WiFiCopyNetworkInfo();
  id v6 = v5;
  if (v5)
  {
    int64_t v7 = objc_msgSend(v5, "hmf_stringForKey:", @"password");
    if (v7)
    {
      id v8 = v7;
      id v9 = [v7 dataUsingEncoding:1];
      goto LABEL_11;
    }
    id v13 = (void *)MEMORY[0x1D9452090]();
    objc_super v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v18 = v15;
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@No password available for Wi-Fi network '%@", buf, 0x16u);
    }
    id v8 = 0;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:0 userInfo:0];
    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v18 = v12;
      __int16 v19 = 2112;
      id v20 = v3;
      __int16 v21 = 2112;
      id v22 = v8;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve Wi-Fi network information for '%@': %@", buf, 0x20u);
    }
  }
  id v9 = 0;
LABEL_11:

  return v9;
}

@end