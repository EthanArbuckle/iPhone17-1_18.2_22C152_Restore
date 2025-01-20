@interface HMDThreadNetworkStatusReporter
+ (id)logCategory;
- (HMDHome)home;
- (HMDThreadNetworkStatusReporter)initWithHome:(id)a3;
- (HMDThreadRadioClient)threadRadioClient;
- (OS_dispatch_queue)workQueue;
- (unint64_t)threadNetworkPeriodicCheckFrequencyInMins;
- (void)_checkIfThreadNetworkIsRunningWithCompletion:(id)a3;
- (void)_registerForThreadNetworkEvents;
- (void)_runThreadNetworkStateCapture;
- (void)_runThreadNetworkStatusPeriodicUpdate;
- (void)_scheduleThreadNetworkStatusPeriodicUpdate;
- (void)_unregisterForThreadNetworkEvents;
- (void)registerForThreadNetworkEvents;
- (void)run;
- (void)setThreadNetworkPeriodicCheckFrequencyInMins:(unint64_t)a3;
- (void)threadBTCallStateChange:(id)a3;
- (void)threadNetworkStateChange:(id)a3;
- (void)threadPeripheralDeviceNodeTypeChange:(id)a3;
- (void)threadPreferredNetworkUpdated:(id)a3;
- (void)threadWakeOnDeviceConnectionStateChange:(id)a3;
- (void)unregisterForThreadNetworkEvents;
@end

@implementation HMDThreadNetworkStatusReporter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadRadioClient, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (HMDThreadRadioClient)threadRadioClient
{
  return self->_threadRadioClient;
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setThreadNetworkPeriodicCheckFrequencyInMins:(unint64_t)a3
{
  self->_threadNetworkPeriodicCheckFrequencyInMins = a3;
}

- (unint64_t)threadNetworkPeriodicCheckFrequencyInMins
{
  return self->_threadNetworkPeriodicCheckFrequencyInMins;
}

- (void)_runThreadNetworkStateCapture
{
  v3 = [(HMDThreadNetworkStatusReporter *)self workQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(HMDThreadNetworkStatusReporter *)self threadRadioClient];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__HMDThreadNetworkStatusReporter__runThreadNetworkStateCapture__block_invoke;
  v5[3] = &unk_1E6A08088;
  v5[4] = self;
  [v4 triggerThreadNetworkStateCaptureWithCompletion:v5];
}

void __63__HMDThreadNetworkStatusReporter__runThreadNetworkStateCapture__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6 && v5 && (v11 = *(void **)(a1 + 32)) != 0)
  {
    v12 = [v11 home];
    v13 = [v12 homeManager];
    v14 = [v13 metricsManager];
    v15 = [v14 threadNetworkObserver];

    v16 = (void *)MEMORY[0x1D9452090]([v15 generateLogForPeriodicReport:v5]);
    id v17 = *(id *)(a1 + 32);
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138546178;
      v21 = v19;
      __int16 v22 = 2048;
      uint64_t v23 = [v5 reportDuration];
      __int16 v24 = 2048;
      uint64_t v25 = [v5 numAdvertisedBRs];
      __int16 v26 = 2048;
      uint64_t v27 = [v5 numAppleBRs];
      __int16 v28 = 2048;
      uint64_t v29 = [v5 numThirdPartyBRs];
      __int16 v30 = 2048;
      uint64_t v31 = [v5 numThreadNetworks];
      __int16 v32 = 2048;
      uint64_t v33 = [v5 maxSimuIPPrefixesDetected];
      __int16 v34 = 2048;
      uint64_t v35 = [v5 txTotal];
      __int16 v36 = 2048;
      uint64_t v37 = [v5 txSuccess];
      __int16 v38 = 2048;
      uint64_t v39 = [v5 txDelayAvg];
      __int16 v40 = 2048;
      uint64_t v41 = [v5 rxTotal];
      __int16 v42 = 2048;
      uint64_t v43 = [v5 rxSuccess];
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Periodic Thread network health reporting - duration=%ld BRs:(T=%ld A=%ld 3=%ld) Ntwk:(#=%ld IPpfx=%ld) Tx:(T=%ld S=%ld AvgDelay=%ld) Rx:(T=%ld S=%ld)", buf, 0x7Au);
    }
  }
  else
  {
    v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v21 = v10;
      __int16 v22 = 2112;
      uint64_t v23 = (uint64_t)v6;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Periodic Thread network health reporting failed with error %@", buf, 0x16u);
    }
  }
}

- (void)_checkIfThreadNetworkIsRunningWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void, void *))a3;
  id v5 = [(HMDThreadNetworkStatusReporter *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[HMDThreadNetworkMetadataStore defaultStore];
  v7 = v6;
  if (v6)
  {
    [v6 checkIfThreadNetworkIsRunningWithCompletion:v4];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEBUG, "%{public}@No thread network metadata store", (uint8_t *)&v13, 0xCu);
    }
    v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    v4[2](v4, 0, v12);
  }
}

- (void)_unregisterForThreadNetworkEvents
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDThreadNetworkStatusReporter *)self workQueue];
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    int v11 = 138543362;
    v12 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@_unregisterForThreadNetworkEvents", (uint8_t *)&v11, 0xCu);
  }
  id v8 = [(HMDThreadNetworkStatusReporter *)v5 threadRadioClient];
  [v8 unregisterForThreadNetworkEvents:v5];

  v9 = [(HMDThreadNetworkStatusReporter *)v5 home];
  v10 = v9;
  if (v9)
  {
    [v9 onThreadNetworkConnectionStateChange:1];
    [v10 onThreadNetworkNodeTypeStateChange:0];
  }
}

- (void)unregisterForThreadNetworkEvents
{
  v3 = [(HMDThreadNetworkStatusReporter *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__HMDThreadNetworkStatusReporter_unregisterForThreadNetworkEvents__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __66__HMDThreadNetworkStatusReporter_unregisterForThreadNetworkEvents__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unregisterForThreadNetworkEvents];
}

- (void)_registerForThreadNetworkEvents
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDThreadNetworkStatusReporter *)self workQueue];
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@_registerForThreadNetworkEvents", (uint8_t *)&v9, 0xCu);
  }
  id v8 = [(HMDThreadNetworkStatusReporter *)v5 threadRadioClient];
  [v8 registerForThreadNetworkEvents:v5];
}

- (void)registerForThreadNetworkEvents
{
  v3 = [(HMDThreadNetworkStatusReporter *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__HMDThreadNetworkStatusReporter_registerForThreadNetworkEvents__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __64__HMDThreadNetworkStatusReporter_registerForThreadNetworkEvents__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerForThreadNetworkEvents];
}

- (void)threadBTCallStateChange:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v21 = 138543874;
    __int16 v22 = v8;
    __int16 v23 = 2112;
    id v24 = v4;
    __int16 v25 = 2048;
    uint64_t v26 = [v4 callState];
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@threadBTCallStateChange - received event %@, value %ld", (uint8_t *)&v21, 0x20u);
  }
  int v9 = [(HMDThreadNetworkStatusReporter *)v6 home];
  if (v9)
  {
    uint64_t v10 = [v4 callState];
    if (v10)
    {
      if (v10 == 1)
      {
        uint64_t v11 = 1;
LABEL_14:
        [v9 onThreadNetworkCallStateChange:v11];
        goto LABEL_15;
      }
      id v17 = (void *)MEMORY[0x1D9452090]();
      v18 = v6;
      v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = HMFGetLogIdentifier();
        int v21 = 138543618;
        __int16 v22 = v20;
        __int16 v23 = 2112;
        id v24 = v4;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unexpected event %@", (uint8_t *)&v21, 0x16u);
      }
    }
    uint64_t v11 = 0;
    goto LABEL_14;
  }
  v12 = (void *)MEMORY[0x1D9452090]();
  uint64_t v13 = v6;
  v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    uint64_t v15 = HMFGetLogIdentifier();
    uint64_t v16 = [v4 callState];
    int v21 = 138543874;
    __int16 v22 = v15;
    __int16 v23 = 2112;
    id v24 = v4;
    __int16 v25 = 2048;
    uint64_t v26 = v16;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@No linked home, dropping threadBTCallStateChange event %@, value %ld", (uint8_t *)&v21, 0x20u);
  }
LABEL_15:
}

- (void)threadPreferredNetworkUpdated:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = [v4 eventValue];
    int v19 = 138543874;
    v20 = v8;
    __int16 v21 = 2112;
    id v22 = v4;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@threadPreferredNetworkUpdated - received event %@, value %@", (uint8_t *)&v19, 0x20u);
  }
  uint64_t v10 = [(HMDThreadNetworkStatusReporter *)v6 home];
  if (v10)
  {
    if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
    {
      uint64_t v11 = [v4 eventValue];

      if (v11)
      {
        v12 = [v4 eventValue];
        uint64_t v13 = (void *)[v12 copy];
        [v10 saveAndSyncWithThreadOperationalDataset:v13];
      }
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1D9452090]();
    uint64_t v15 = v6;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      v18 = [v4 eventValue];
      int v19 = 138543874;
      v20 = v17;
      __int16 v21 = 2112;
      id v22 = v4;
      __int16 v23 = 2112;
      id v24 = v18;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@No linked home, dropping threadPreferredNetworkUpdated event %@, value %@", (uint8_t *)&v19, 0x20u);
    }
  }
}

- (void)threadPeripheralDeviceNodeTypeChange:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v15 = 138543874;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    id v18 = v4;
    __int16 v19 = 2048;
    uint64_t v20 = [v4 peripheralDeviceNodeType];
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@threadPeripheralDeviceNodeTypeChange - received event %@, peripheral nodeType %ld", (uint8_t *)&v15, 0x20u);
  }
  int v9 = [(HMDThreadNetworkStatusReporter *)v6 home];
  uint64_t v10 = v9;
  if (v9)
  {
    [v9 onThreadNetworkPeripheralDeviceNodeTypeChange:v4];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1D9452090]();
    v12 = v6;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v15 = 138543362;
      uint64_t v16 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@No linked home, dropping threadPeripheralDeviceNodeTypeChange event", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)threadWakeOnDeviceConnectionStateChange:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = [v4 eMACAddressAsString];
    int v16 = 138544130;
    __int16 v17 = v8;
    __int16 v18 = 2112;
    id v19 = v4;
    __int16 v20 = 2112;
    uint64_t v21 = v9;
    __int16 v22 = 2048;
    uint64_t v23 = [v4 connectionState];
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@threadWakeOnDeviceConnectionStateChange - received event %@, eMACAddress %@, connectionState %ld", (uint8_t *)&v16, 0x2Au);
  }
  uint64_t v10 = [(HMDThreadNetworkStatusReporter *)v6 home];
  uint64_t v11 = v10;
  if (v10)
  {
    [v10 onThreadNetworkWakeOnDeviceConnectionStateChange:v4];
  }
  else
  {
    v12 = (void *)MEMORY[0x1D9452090]();
    uint64_t v13 = v6;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = HMFGetLogIdentifier();
      int v16 = 138543362;
      __int16 v17 = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@No linked home, dropping threadWakeOnDeviceConnectionStateChange event", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)threadNetworkStateChange:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v20 = 138544130;
    uint64_t v21 = v8;
    __int16 v22 = 2112;
    id v23 = v4;
    __int16 v24 = 2048;
    uint64_t v25 = [v4 eventType];
    __int16 v26 = 2048;
    uint64_t v27 = [v4 eventValue];
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@threadNetworkStateChange - received event %@, type %ld, value %ld", (uint8_t *)&v20, 0x2Au);
  }
  int v9 = [(HMDThreadNetworkStatusReporter *)v6 home];
  if (!v9)
  {
    uint64_t v11 = (void *)MEMORY[0x1D9452090]();
    v12 = v6;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      uint64_t v15 = [v4 eventType];
      uint64_t v16 = [v4 eventValue];
      int v20 = 138544130;
      uint64_t v21 = v14;
      __int16 v22 = 2112;
      id v23 = v4;
      __int16 v24 = 2048;
      uint64_t v25 = v15;
      __int16 v26 = 2048;
      uint64_t v27 = v16;
      __int16 v17 = "%{public}@No linked home, dropping threadNetworkStateChange event %@, type %ld, value %ld";
      __int16 v18 = v13;
      uint32_t v19 = 42;
LABEL_12:
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v20, v19);
    }
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v10 = [v4 eventType];
  if (v10 == 1)
  {
    objc_msgSend(v9, "onThreadNetworkNodeTypeStateChange:", objc_msgSend(v4, "eventValue"));
    goto LABEL_14;
  }
  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x1D9452090]();
    v12 = v6;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v20 = 138543618;
      uint64_t v21 = v14;
      __int16 v22 = 2112;
      id v23 = v4;
      __int16 v17 = "%{public}@Unexpected event %@";
      __int16 v18 = v13;
      uint32_t v19 = 22;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  objc_msgSend(v9, "onThreadNetworkConnectionStateChange:", objc_msgSend(v4, "eventValue"));
LABEL_14:
}

- (void)_runThreadNetworkStatusPeriodicUpdate
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDThreadNetworkStatusReporter *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[HMDThreadNetworkMetadataStore defaultStore];
  if (v4)
  {
    id v5 = [(HMDThreadNetworkStatusReporter *)self home];
    id v6 = v5;
    if (v5)
    {
      v7 = [v5 threadOperationalDataset];
    }
    else
    {
      v7 = 0;
    }
    objc_initWeak((id *)buf, self);
    uint64_t v12 = [v6 doesHomeContainResident];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __71__HMDThreadNetworkStatusReporter__runThreadNetworkStatusPeriodicUpdate__block_invoke;
    v22[3] = &unk_1E6A08060;
    objc_copyWeak(&v24, (id *)buf);
    id v13 = v6;
    id v23 = v13;
    [v4 retrieveMetadata:v7 homeHasResident:v12 completion:v22];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __71__HMDThreadNetworkStatusReporter__runThreadNetworkStatusPeriodicUpdate__block_invoke_2;
    v19[3] = &unk_1E6A0A2B0;
    objc_copyWeak(&v21, (id *)buf);
    id v14 = v13;
    id v20 = v14;
    [(HMDThreadNetworkStatusReporter *)self _checkIfThreadNetworkIsRunningWithCompletion:v19];
    [(HMDThreadNetworkStatusReporter *)self _runThreadNetworkStateCapture];
    dispatch_time_t v15 = dispatch_time(0, 60000000000* [(HMDThreadNetworkStatusReporter *)self threadNetworkPeriodicCheckFrequencyInMins]);
    uint64_t v16 = [(HMDThreadNetworkStatusReporter *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__HMDThreadNetworkStatusReporter__runThreadNetworkStatusPeriodicUpdate__block_invoke_3;
    block[3] = &unk_1E6A16E40;
    objc_copyWeak(&v18, (id *)buf);
    dispatch_after(v15, v16, block);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v21);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    int v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v26 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEBUG, "%{public}@No thread network metadata store", buf, 0xCu);
    }
  }
}

void __71__HMDThreadNetworkStatusReporter__runThreadNetworkStatusPeriodicUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = *(void **)(a1 + 32);
    if (v4)
    {
      if (v9)
      {
        [v4 setThreadPreferredNetworkExists:1];
        if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
        {
          id v5 = [v9 operationalDataset];

          if (v5)
          {
            id v6 = *(void **)(a1 + 32);
            v7 = [v9 operationalDataset];
            id v8 = (void *)[v7 copy];
            [v6 saveAndSyncWithThreadOperationalDataset:v8];
          }
        }
      }
      else
      {
        [v4 setThreadPreferredNetworkExists:0];
      }
    }
  }
}

uint64_t __71__HMDThreadNetworkStatusReporter__runThreadNetworkStatusPeriodicUpdate__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (!a3)
  {
    if (WeakRetained)
    {
      id WeakRetained = *(id *)(a1 + 32);
      if (WeakRetained)
      {
        id v9 = v7;
        id WeakRetained = (id)[WeakRetained setThreadNetworkIsUp:a2];
        id v7 = v9;
      }
    }
  }
  return MEMORY[0x1F41817F8](WeakRetained, v7);
}

void __71__HMDThreadNetworkStatusReporter__runThreadNetworkStatusPeriodicUpdate__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _runThreadNetworkStatusPeriodicUpdate];
}

- (void)_scheduleThreadNetworkStatusPeriodicUpdate
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDThreadNetworkStatusReporter *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if (![(HMDThreadNetworkStatusReporter *)self threadNetworkPeriodicCheckFrequencyInMins])
  {
    id v4 = [MEMORY[0x1E4F65530] sharedPreferences];
    id v5 = [v4 preferenceForKey:@"ThreadNetworkHealthReportingPeriodInMinutes"];
    id v6 = [v5 numberValue];

    if ((int)[v6 intValue] < 1) {
      uint64_t v7 = 240;
    }
    else {
      uint64_t v7 = [v6 unsignedIntValue];
    }
    id v8 = (void *)MEMORY[0x1D9452090]([(HMDThreadNetworkStatusReporter *)self setThreadNetworkPeriodicCheckFrequencyInMins:v7]);
    id v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v12 = 138543618;
      id v13 = v11;
      __int16 v14 = 2048;
      uint64_t v15 = [(HMDThreadNetworkStatusReporter *)v9 threadNetworkPeriodicCheckFrequencyInMins];
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Scheduling start of periodic Thread network health reporting (for every %lu minutes)", (uint8_t *)&v12, 0x16u);
    }
    [(HMDThreadNetworkStatusReporter *)v9 _runThreadNetworkStatusPeriodicUpdate];
  }
}

- (void)run
{
  if (![(HMDThreadNetworkStatusReporter *)self threadNetworkPeriodicCheckFrequencyInMins])
  {
    v3 = [(HMDThreadNetworkStatusReporter *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__HMDThreadNetworkStatusReporter_run__block_invoke;
    block[3] = &unk_1E6A19B30;
    void block[4] = self;
    dispatch_async(v3, block);
  }
}

uint64_t __37__HMDThreadNetworkStatusReporter_run__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleThreadNetworkStatusPeriodicUpdate];
}

- (HMDThreadNetworkStatusReporter)initWithHome:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMDThreadNetworkStatusReporter;
  id v5 = [(HMDThreadNetworkStatusReporter *)&v14 init];
  if (v5)
  {
    id v6 = (const char *)HMFDispatchQueueName();
    uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v8 = dispatch_get_global_queue(17, 0);
    dispatch_queue_t v9 = dispatch_queue_create_with_target_V2(v6, v7, v8);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v9;

    objc_storeWeak((id *)&v5->_home, v4);
    v5->_threadNetworkPeriodicCheckFrequencyInMins = 0;
    uint64_t v11 = objc_opt_new();
    threadRadioClient = v5->_threadRadioClient;
    v5->_threadRadioClient = (HMDThreadRadioClient *)v11;
  }
  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_18190 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_18190, &__block_literal_global_18191);
  }
  v2 = (void *)logCategory__hmf_once_v1_18192;
  return v2;
}

uint64_t __45__HMDThreadNetworkStatusReporter_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_18192;
  logCategory__hmf_once_v1_18192 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end