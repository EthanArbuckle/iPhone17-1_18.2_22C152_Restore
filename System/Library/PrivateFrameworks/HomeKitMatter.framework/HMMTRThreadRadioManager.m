@interface HMMTRThreadRadioManager
+ (id)logCategory;
- (BOOL)_shouldRetryWEDConnectionToAccessory;
- (BOOL)deviceIsLockedAndPendingStopThread;
- (BOOL)deviceSupportsThreadService;
- (BOOL)hasMatterThreadAccessoryInHomeWithFabricID:(id)a3;
- (BOOL)isFirmwareUpdateActive;
- (BOOL)isPairingActive;
- (BOOL)isReadyToEstablishWEDConnection;
- (BOOL)isReadyToTransitionToFullRouterModeForFirmwareUpdate;
- (BOOL)isThreadNetworkConnected;
- (BOOL)isWEDConnectionRetryActive;
- (BOOL)pendingThreadStart;
- (BOOL)preventDisconnect;
- (BOOL)threadNetworkActivatedForSystemCommissionerFabric;
- (HMFTimer)disconnectTimer;
- (HMMTRAccessoryServer)pairingAccessoryServer;
- (HMMTRAccessoryServerBrowser)browser;
- (HMMTRThreadRadioControllerDelegate)delegate;
- (HMMTRThreadRadioManager)initWithBrowser:(id)a3;
- (NSNumber)fabricIDOfActiveThreadNetwork;
- (NSNumber)fabricIDOfPendingStartPairingBlock;
- (NSString)eMACAddressOfFWUpdatesAccessory;
- (NSString)eMACAddressOfWEDAccessory;
- (OS_dispatch_queue)workQueue;
- (double)_computeRetryDelayForError:(id)a3;
- (id)_connectionStateValueToString:(int64_t)a3;
- (id)_nodeTypeValueToString:(int64_t)a3;
- (id)pendingStartPairingBlock;
- (id)retryCompletionHandler;
- (int64_t)lastKnownThreadNetworkConnectionState;
- (void)__startAccessoryPairingWithExtendedMACAddress:(id)a3 isWedDevice:(BOOL)a4 accessoryServer:(id)a5 completion:(id)a6;
- (void)_allowDisconnect;
- (void)_notifyThreadRadioStateChanged:(int64_t)a3 nodeType:(int64_t)a4 fabricID:(id)a5;
- (void)_notifyWakeOnDeviceConnectionChanged:(int64_t)a3 eMACAddress:(id)a4;
- (void)_retryWEDConnectionToAccessoryWithDelayInMs:(double)a3;
- (void)_startAccessoryFirmwareUpdateWithExtendedMACAddress:(id)a3 isWedDevice:(BOOL)a4 completion:(id)a5;
- (void)_startAccessoryPairingWithExtendedMACAddress:(id)a3 isWedDevice:(BOOL)a4 accessoryServer:(id)a5 completion:(id)a6;
- (void)_startThreadRadioForHomeWithFabricID:(id)a3 preventDisconnect:(BOOL)a4;
- (void)_startThreadRadioForSystemCommissionerFabricID:(id)a3;
- (void)_stopAccessoryFirmwareUpdateWithCompletion:(id)a3;
- (void)_stopAccessoryPairingWithCompletion:(id)a3;
- (void)_stopThreadRadioForHomeWithFabricID:(id)a3;
- (void)_stopThreadRadioForSystemCommissionerFabricID:(id)a3;
- (void)_updateFabricIDOfActiveThreadNetwork:(id)a3 isFabricIDOfSystemCommissioner:(BOOL)a4;
- (void)allowDisconnect;
- (void)connectToAccessoryWithExtendedMACAddress:(id)a3 completion:(id)a4;
- (void)connectToAccessoryWithExtendedMACAddress:(id)a3 forRetry:(BOOL)a4 completion:(id)a5;
- (void)dispatchAfter:(unint64_t)a3 block:(id)a4;
- (void)dispatchBlock:(id)a3;
- (void)handleDeviceLockStateChange:(BOOL)a3;
- (void)notifyPeripheralDeviceNodeTypeChanged:(int64_t)a3;
- (void)notifyThreadRadioStateChanged:(int64_t)a3 nodeType:(int64_t)a4 fabricID:(id)a5;
- (void)notifyWakeOnDeviceConnectionChanged:(int64_t)a3 eMACAddress:(id)a4;
- (void)overrideLocationCheckForPairingForFabricID:(id)a3;
- (void)postNotification:(id)a3 userInfo:(id)a4;
- (void)setBrowser:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceIsLockedAndPendingStopThread:(BOOL)a3;
- (void)setDeviceSupportsThreadService:(BOOL)a3;
- (void)setEMACAddressOfFWUpdatesAccessory:(id)a3;
- (void)setEMACAddressOfWEDAccessory:(id)a3;
- (void)setFabricIDOfActiveThreadNetwork:(id)a3;
- (void)setFabricIDOfPendingStartPairingBlock:(id)a3;
- (void)setFirmwareUpdateActive:(BOOL)a3;
- (void)setIsWEDConnectionRetryActive:(BOOL)a3;
- (void)setLastKnownThreadNetworkConnectionState:(int64_t)a3;
- (void)setPairingAccessoryServer:(id)a3;
- (void)setPairingActive:(BOOL)a3;
- (void)setPendingStartPairingBlock:(id)a3;
- (void)setPendingThreadStart:(BOOL)a3;
- (void)setPreventDisconnect:(BOOL)a3;
- (void)setRetryCompletionHandler:(id)a3;
- (void)setThreadNetworkActivatedForSystemCommissionerFabric:(BOOL)a3;
- (void)setWorkQueue:(id)a3;
- (void)startAccessoryFirmwareUpdateWithExtendedMACAddress:(id)a3 isWedDevice:(BOOL)a4 completion:(id)a5;
- (void)startAccessoryPairingWithExtendedMACAddress:(id)a3 isWedDevice:(BOOL)a4 accessoryServer:(id)a5 completion:(id)a6;
- (void)startThreadRadioForHomeWithFabricID:(id)a3;
- (void)startThreadRadioForHomeWithFabricID:(id)a3 preventDisconnect:(BOOL)a4;
- (void)startThreadRadioForSystemCommissionerFabricID:(id)a3;
- (void)stopAccessoryFirmwareUpdateWithCompletion:(id)a3;
- (void)stopAccessoryPairingWithCompletion:(id)a3;
- (void)stopThreadOnDeviceLockTimeout;
- (void)stopThreadRadioForHomeWithFabricID:(id)a3;
- (void)stopThreadRadioForSystemCommissionerFabricID:(id)a3;
@end

@implementation HMMTRThreadRadioManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eMACAddressOfWEDAccessory, 0);
  objc_storeStrong((id *)&self->_fabricIDOfPendingStartPairingBlock, 0);
  objc_storeStrong(&self->_pendingStartPairingBlock, 0);
  objc_storeStrong(&self->_retryCompletionHandler, 0);
  objc_storeStrong((id *)&self->_disconnectTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_eMACAddressOfFWUpdatesAccessory, 0);
  objc_destroyWeak((id *)&self->_pairingAccessoryServer);
  objc_destroyWeak((id *)&self->_browser);
  objc_storeStrong((id *)&self->_fabricIDOfActiveThreadNetwork, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setEMACAddressOfWEDAccessory:(id)a3
{
}

- (NSString)eMACAddressOfWEDAccessory
{
  return self->_eMACAddressOfWEDAccessory;
}

- (void)setIsWEDConnectionRetryActive:(BOOL)a3
{
  self->_isWEDConnectionRetryActive = a3;
}

- (BOOL)isWEDConnectionRetryActive
{
  return self->_isWEDConnectionRetryActive;
}

- (void)setLastKnownThreadNetworkConnectionState:(int64_t)a3
{
  self->_lastKnownThreadNetworkConnectionState = a3;
}

- (int64_t)lastKnownThreadNetworkConnectionState
{
  return self->_lastKnownThreadNetworkConnectionState;
}

- (void)setFabricIDOfPendingStartPairingBlock:(id)a3
{
}

- (NSNumber)fabricIDOfPendingStartPairingBlock
{
  return self->_fabricIDOfPendingStartPairingBlock;
}

- (void)setPendingStartPairingBlock:(id)a3
{
}

- (id)pendingStartPairingBlock
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setRetryCompletionHandler:(id)a3
{
}

- (id)retryCompletionHandler
{
  return self->_retryCompletionHandler;
}

- (void)setDeviceIsLockedAndPendingStopThread:(BOOL)a3
{
  self->_deviceIsLockedAndPendingStopThread = a3;
}

- (BOOL)deviceIsLockedAndPendingStopThread
{
  return self->_deviceIsLockedAndPendingStopThread;
}

- (HMFTimer)disconnectTimer
{
  return self->_disconnectTimer;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setEMACAddressOfFWUpdatesAccessory:(id)a3
{
}

- (NSString)eMACAddressOfFWUpdatesAccessory
{
  return self->_eMACAddressOfFWUpdatesAccessory;
}

- (void)setPendingThreadStart:(BOOL)a3
{
  self->_pendingThreadStart = a3;
}

- (BOOL)pendingThreadStart
{
  return self->_pendingThreadStart;
}

- (void)setPreventDisconnect:(BOOL)a3
{
  self->_preventDisconnect = a3;
}

- (BOOL)preventDisconnect
{
  return self->_preventDisconnect;
}

- (void)setPairingAccessoryServer:(id)a3
{
}

- (HMMTRAccessoryServer)pairingAccessoryServer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pairingAccessoryServer);
  return (HMMTRAccessoryServer *)WeakRetained;
}

- (void)setBrowser:(id)a3
{
}

- (HMMTRAccessoryServerBrowser)browser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browser);
  return (HMMTRAccessoryServerBrowser *)WeakRetained;
}

- (void)setThreadNetworkActivatedForSystemCommissionerFabric:(BOOL)a3
{
  self->_threadNetworkActivatedForSystemCommissionerFabric = a3;
}

- (BOOL)threadNetworkActivatedForSystemCommissionerFabric
{
  return self->_threadNetworkActivatedForSystemCommissionerFabric;
}

- (void)setFabricIDOfActiveThreadNetwork:(id)a3
{
}

- (NSNumber)fabricIDOfActiveThreadNetwork
{
  return self->_fabricIDOfActiveThreadNetwork;
}

- (void)setFirmwareUpdateActive:(BOOL)a3
{
  self->_firmwareUpdateActive = a3;
}

- (BOOL)isFirmwareUpdateActive
{
  return self->_firmwareUpdateActive;
}

- (void)setPairingActive:(BOOL)a3
{
  self->_pairingActive = a3;
}

- (BOOL)isPairingActive
{
  return self->_pairingActive;
}

- (void)setDeviceSupportsThreadService:(BOOL)a3
{
  self->_deviceSupportsThreadService = a3;
}

- (BOOL)deviceSupportsThreadService
{
  return self->_deviceSupportsThreadService;
}

- (id)_connectionStateValueToString:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"unknown";
  }
  else {
    return off_265375D38[a3];
  }
}

- (id)_nodeTypeValueToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6) {
    return @"unknown";
  }
  else {
    return off_265375D00[a3 - 1];
  }
}

- (void)dispatchAfter:(unint64_t)a3 block:(id)a4
{
  id v6 = a4;
  v7 = [(HMMTRThreadRadioManager *)self workQueue];
  dispatch_after(a3, v7, v6);
}

- (void)dispatchBlock:(id)a3
{
  id v4 = a3;
  v5 = [(HMMTRThreadRadioManager *)self workQueue];
  dispatch_async(v5, v4);
}

- (void)postNotification:(id)a3 userInfo:(id)a4
{
  id v6 = (void *)MEMORY[0x263F08A00];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 defaultCenter];
  [v9 postNotificationName:v8 object:self userInfo:v7];
}

- (void)notifyPeripheralDeviceNodeTypeChanged:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ((unint64_t)a3 > 7)
  {
    uint64_t v10 = 0;
  }
  else
  {
    if (((1 << a3) & 0xCF) != 0)
    {
      v5 = (void *)MEMORY[0x2533B64D0](self, a2);
      id v6 = self;
      id v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = HMFGetLogIdentifier();
        id v9 = [(HMMTRThreadRadioManager *)v6 _nodeTypeValueToString:a3];
        int v20 = 138543618;
        v21 = v8;
        __int16 v22 = 2112;
        v23 = v9;
        _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Pairing accessory is not sleepy (nodeType: %@)", (uint8_t *)&v20, 0x16u);
      }
      uint64_t v10 = 0;
    }
    else
    {
      v5 = (void *)MEMORY[0x2533B64D0](self, a2);
      v17 = self;
      id v7 = HMFGetOSLogHandle();
      uint64_t v10 = 1;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v18 = HMFGetLogIdentifier();
        v19 = [(HMMTRThreadRadioManager *)v17 _nodeTypeValueToString:a3];
        int v20 = 138543618;
        v21 = v18;
        __int16 v22 = 2112;
        v23 = v19;
        _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Pairing accessory is sleepy (nodeType: %@)", (uint8_t *)&v20, 0x16u);
      }
    }
  }
  v11 = [(HMMTRThreadRadioManager *)self pairingAccessoryServer];
  v12 = v11;
  if (v11)
  {
    [v11 handleThreadDirectConnectionSleepyTypeChange:v10];
  }
  else
  {
    v13 = (void *)MEMORY[0x2533B64D0]();
    v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      int v20 = 138543362;
      v21 = v16;
      _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_ERROR, "%{public}@notifyPeripheralDeviceNodeTypeChanged: could not get a strong reference to accessory server", (uint8_t *)&v20, 0xCu);
    }
  }
}

- (void)_notifyWakeOnDeviceConnectionChanged:(int64_t)a3 eMACAddress:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x2533B64D0]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    v11 = [(HMMTRThreadRadioManager *)v8 eMACAddressOfWEDAccessory];
    int v14 = 138544130;
    v15 = v10;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2048;
    int64_t v19 = a3;
    __int16 v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@Received thread WED connection changed notification for eMACAddress: %@ with state: %ld, eMACAddress of last connection: %@", (uint8_t *)&v14, 0x2Au);
  }
  if ((unint64_t)(a3 - 2) <= 2)
  {
    v12 = [(HMMTRThreadRadioManager *)v8 eMACAddressOfWEDAccessory];
    if ([v12 isEqualToString:v6])
    {
      BOOL v13 = [(HMMTRThreadRadioManager *)v8 isWEDConnectionRetryActive];

      if (!v13)
      {
        [(HMMTRThreadRadioManager *)v8 setIsWEDConnectionRetryActive:1];
        [(HMMTRThreadRadioManager *)v8 _retryWEDConnectionToAccessoryWithDelayInMs:100.0];
      }
    }
    else
    {
    }
  }
}

- (void)notifyWakeOnDeviceConnectionChanged:(int64_t)a3 eMACAddress:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __75__HMMTRThreadRadioManager_notifyWakeOnDeviceConnectionChanged_eMACAddress___block_invoke;
  v8[3] = &unk_2653774A8;
  id v9 = v6;
  int64_t v10 = a3;
  v8[4] = self;
  id v7 = v6;
  [(HMMTRThreadRadioManager *)self dispatchBlock:v8];
}

uint64_t __75__HMMTRThreadRadioManager_notifyWakeOnDeviceConnectionChanged_eMACAddress___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyWakeOnDeviceConnectionChanged:*(void *)(a1 + 48) eMACAddress:*(void *)(a1 + 40)];
}

- (void)_retryWEDConnectionToAccessoryWithDelayInMs:(double)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(HMMTRThreadRadioManager *)self _shouldRetryWEDConnectionToAccessory])
  {
    v5 = (void *)MEMORY[0x2533B64D0]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [(HMMTRThreadRadioManager *)v6 eMACAddressOfWEDAccessory];
      float v10 = a3;
      *(_DWORD *)buf = 138543874;
      int v14 = v8;
      __int16 v15 = 2112;
      __int16 v16 = v9;
      __int16 v17 = 2048;
      double v18 = v10;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Attempting to retry WED connection to eMACAddress: %@ after %f milliseconds", buf, 0x20u);
    }
    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(a3 * 1000000.0));
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __71__HMMTRThreadRadioManager__retryWEDConnectionToAccessoryWithDelayInMs___block_invoke;
    v12[3] = &unk_265378638;
    v12[4] = v6;
    [(HMMTRThreadRadioManager *)v6 dispatchAfter:v11 block:v12];
  }
}

void __71__HMMTRThreadRadioManager__retryWEDConnectionToAccessoryWithDelayInMs___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) _shouldRetryWEDConnectionToAccessory])
  {
    v2 = [*(id *)(a1 + 32) eMACAddressOfWEDAccessory];
    v3 = [v2 dataUsingEncoding:4];

    id v4 = (void *)MEMORY[0x2533B64D0]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = [*(id *)(a1 + 32) eMACAddressOfWEDAccessory];
      *(_DWORD *)buf = 138543618;
      v12 = v7;
      __int16 v13 = 2112;
      int v14 = v8;
      _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@Attempting to retry WED connection to eMACAddress: %@", buf, 0x16u);
    }
    id v9 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __71__HMMTRThreadRadioManager__retryWEDConnectionToAccessoryWithDelayInMs___block_invoke_33;
    v10[3] = &unk_265376E00;
    v10[4] = v9;
    [v9 connectToAccessoryWithExtendedMACAddress:v3 forRetry:1 completion:v10];
  }
}

void __71__HMMTRThreadRadioManager__retryWEDConnectionToAccessoryWithDelayInMs___block_invoke_33(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [*(id *)(a1 + 32) eMACAddressOfWEDAccessory];
      *(_DWORD *)buf = 138543874;
      __int16 v17 = v8;
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      __int16 v20 = 2112;
      id v21 = v3;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_ERROR, "%{public}@RETRY: Failed to establish WED connection to accessory with emac %@, error %@", buf, 0x20u);
    }
    float v10 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __71__HMMTRThreadRadioManager__retryWEDConnectionToAccessoryWithDelayInMs___block_invoke_34;
    v14[3] = &unk_265376E98;
    v14[4] = v10;
    id v15 = v3;
    [v10 dispatchBlock:v14];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      dispatch_time_t v11 = HMFGetLogIdentifier();
      v12 = [*(id *)(a1 + 32) eMACAddressOfWEDAccessory];
      *(_DWORD *)buf = 138543618;
      __int16 v17 = v11;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@RETRY: Connected to WED accessory with emac: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 32) setIsWEDConnectionRetryActive:0];
    __int16 v13 = [*(id *)(a1 + 32) retryCompletionHandler];
    [*(id *)(a1 + 32) setRetryCompletionHandler:0];
    if (v13) {
      v13[2](v13, 0);
    }
  }
}

uint64_t __71__HMMTRThreadRadioManager__retryWEDConnectionToAccessoryWithDelayInMs___block_invoke_34(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [v1 _computeRetryDelayForError:*(void *)(a1 + 40)];
  return objc_msgSend(v1, "_retryWEDConnectionToAccessoryWithDelayInMs:");
}

- (double)_computeRetryDelayForError:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  uint64_t v13 = 0x4059000000000000;
  if (v3 && ([v3 userInfo], id v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    id v6 = [v4 userInfo];
    id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F08348]];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;

    if (v9)
    {
      float v10 = [MEMORY[0x263F08B08] scannerWithString:v9];
      if (([v10 scanDouble:&v13] & 1) == 0) {
        uint64_t v13 = 0x4059000000000000;
      }
    }
    double v11 = *(double *)&v13;
  }
  else
  {
    double v11 = 100.0;
  }

  return v11;
}

- (BOOL)_shouldRetryWEDConnectionToAccessory
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = [(HMMTRThreadRadioManager *)self browser];
  if (![v3 isCurrentDeviceAllowedAccessoryControlDespiteReachableResident]) {
    goto LABEL_7;
  }
  id v4 = [(HMMTRThreadRadioManager *)self eMACAddressOfWEDAccessory];
  if (!v4 || ![(HMMTRThreadRadioManager *)self isWEDConnectionRetryActive])
  {

LABEL_7:
    goto LABEL_8;
  }
  BOOL v5 = [(HMMTRThreadRadioManager *)self isReadyToEstablishWEDConnection];

  if (v5) {
    return 1;
  }
LABEL_8:
  id v7 = (void *)MEMORY[0x2533B64D0]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    float v10 = HMFGetLogIdentifier();
    double v11 = [(HMMTRThreadRadioManager *)v8 eMACAddressOfWEDAccessory];
    v12 = [(HMMTRThreadRadioManager *)v8 browser];
    [v12 isCurrentDeviceAllowedAccessoryControlDespiteReachableResident];
    uint64_t v13 = HMFBooleanToString();
    [(HMMTRThreadRadioManager *)v8 isWEDConnectionRetryActive];
    int v14 = HMFBooleanToString();
    [(HMMTRThreadRadioManager *)v8 isReadyToEstablishWEDConnection];
    id v15 = HMFBooleanToString();
    int v18 = 138544386;
    uint64_t v19 = v10;
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 2112;
    v23 = v13;
    __int16 v24 = 2112;
    v25 = v14;
    __int16 v26 = 2112;
    v27 = v15;
    _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@Not retrying thread connection. eMACAddress: %@, allowedAccessoryControlDespiteReachableResident: %@, connection retry: %@, isReadyToEstablishWEDConnection: %@", (uint8_t *)&v18, 0x34u);
  }
  [(HMMTRThreadRadioManager *)v8 setIsWEDConnectionRetryActive:0];
  __int16 v16 = [(HMMTRThreadRadioManager *)v8 retryCompletionHandler];
  [(HMMTRThreadRadioManager *)v8 setRetryCompletionHandler:0];
  if (v16)
  {
    __int16 v17 = [MEMORY[0x263F087E8] hmfErrorWithCode:12];
    ((void (**)(void, void *))v16)[2](v16, v17);
  }
  return 0;
}

- (void)_notifyThreadRadioStateChanged:(int64_t)a3 nodeType:(int64_t)a4 fabricID:(id)a5
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = (void *)MEMORY[0x2533B64D0]();
  float v10 = self;
  double v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544386;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2048;
    id v62 = a4;
    *(_WORD *)v63 = 2112;
    *(void *)&v63[2] = v8;
    *(_WORD *)&v63[10] = 2048;
    *(void *)&v63[12] = [(HMMTRThreadRadioManager *)v10 lastKnownThreadNetworkConnectionState];
    _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_INFO, "%{public}@Received thread radio state changed notification, connectionState: %ld, nodeType: %ld, fabricID:%@, last known connectionState: %ld", buf, 0x34u);
  }
  uint64_t v13 = [(HMMTRThreadRadioManager *)v10 fabricIDOfActiveThreadNetwork];
  BOOL v14 = v13 == 0;

  if (v14)
  {
    v31 = (void *)MEMORY[0x2533B64D0]();
    v32 = v10;
    v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v34;
      _os_log_impl(&dword_252495000, v33, OS_LOG_TYPE_INFO, "%{public}@No active fabric, no action taken on thread state change", buf, 0xCu);
    }
    [(HMMTRThreadRadioManager *)v32 setLastKnownThreadNetworkConnectionState:a3];
  }
  else
  {
    if (!v8)
    {
      id v15 = [(HMMTRThreadRadioManager *)v10 browser];
      id v8 = [v15 systemCommissionerFabricID];
    }
    __int16 v16 = [(HMMTRThreadRadioManager *)v10 fabricIDOfActiveThreadNetwork];
    char v17 = [v16 isEqual:v8];

    if (v17)
    {
      if (a3 == 1)
      {
        if ([(HMMTRThreadRadioManager *)v10 lastKnownThreadNetworkConnectionState]&& [(HMMTRThreadRadioManager *)v10 lastKnownThreadNetworkConnectionState] != 1)
        {
          context = (void *)MEMORY[0x2533B64D0]();
          v40 = v10;
          v41 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            v52 = HMFGetLogIdentifier();
            v42 = [(HMMTRThreadRadioManager *)v40 fabricIDOfActiveThreadNetwork];
            [(HMMTRThreadRadioManager *)v40 threadNetworkActivatedForSystemCommissionerFabric];
            HMFBooleanToString();
            id v43 = (id)objc_claimAutoreleasedReturnValue();
            [(HMMTRThreadRadioManager *)v40 preventDisconnect];
            v44 = HMFBooleanToString();
            *(_DWORD *)buf = 138544130;
            *(void *)&uint8_t buf[4] = v52;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v42;
            *(_WORD *)&buf[22] = 2112;
            id v62 = (int64_t)v43;
            *(_WORD *)v63 = 2112;
            *(void *)&v63[2] = v44;
            _os_log_impl(&dword_252495000, v41, OS_LOG_TYPE_ERROR, "%{public}@Unexpected, thread radio went offline. Restarting thread radio for fabric ID: %@, is system commissioner: %@, preventDisconnect = %@", buf, 0x2Au);
          }
          v57[0] = 0;
          v57[1] = v57;
          v57[2] = 0x2020000000;
          BOOL v58 = 0;
          BOOL v58 = [(HMMTRThreadRadioManager *)v40 preventDisconnect];
          v55[0] = 0;
          v55[1] = v55;
          v55[2] = 0x2020000000;
          BOOL v56 = 0;
          BOOL v56 = [(HMMTRThreadRadioManager *)v40 threadNetworkActivatedForSystemCommissionerFabric];
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          id v62 = (int64_t)__Block_byref_object_copy__3962;
          *(void *)v63 = __Block_byref_object_dispose__3963;
          *(void *)&v63[8] = [(HMMTRThreadRadioManager *)v40 fabricIDOfActiveThreadNetwork];
          if ([(HMMTRThreadRadioManager *)v40 threadNetworkActivatedForSystemCommissionerFabric])
          {
            v45 = [(HMMTRThreadRadioManager *)v40 delegate];
            [v45 stopThreadRadioForUserPreferredNetwork];
          }
          else
          {
            v45 = [(HMMTRThreadRadioManager *)v40 delegate];
            v46 = [(HMMTRThreadRadioManager *)v40 fabricIDOfActiveThreadNetwork];
            [v45 stopThreadRadioForHomeWithFabricID:v46];
          }
          [(HMMTRThreadRadioManager *)v40 setPreventDisconnect:0];
          [(HMMTRThreadRadioManager *)v40 _updateFabricIDOfActiveThreadNetwork:0 isFabricIDOfSystemCommissioner:0];
          if (![(HMMTRThreadRadioManager *)v40 pendingThreadStart])
          {
            [(HMMTRThreadRadioManager *)v40 setPendingThreadStart:1];
            dispatch_time_t v47 = dispatch_time(0, 100000000);
            v48 = [(HMMTRThreadRadioManager *)v40 workQueue];
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __76__HMMTRThreadRadioManager__notifyThreadRadioStateChanged_nodeType_fabricID___block_invoke;
            block[3] = &unk_265375CE0;
            block[4] = v40;
            block[5] = v55;
            block[6] = buf;
            block[7] = v57;
            dispatch_after(v47, v48, block);
          }
          _Block_object_dispose(buf, 8);

          _Block_object_dispose(v55, 8);
          _Block_object_dispose(v57, 8);
        }
        goto LABEL_36;
      }
      if (a3 == 3)
      {
        int v18 = [(HMMTRThreadRadioManager *)v10 fabricIDOfPendingStartPairingBlock];
        if ([v8 isEqual:v18])
        {
          uint64_t v19 = [(HMMTRThreadRadioManager *)v10 pendingStartPairingBlock];
          BOOL v20 = v19 == 0;

          if (v20) {
            goto LABEL_16;
          }
          id v21 = (void *)MEMORY[0x2533B64D0]();
          __int16 v22 = v10;
          v23 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            __int16 v24 = HMFGetLogIdentifier();
            v25 = [(HMMTRThreadRadioManager *)v22 _connectionStateValueToString:3];
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v24;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v25;
            *(_WORD *)&buf[22] = 2112;
            id v62 = (int64_t)v8;
            _os_log_impl(&dword_252495000, v23, OS_LOG_TYPE_INFO, "%{public}@Thread network connection state: %@ for fabricID: %@, calling start pairing block now", buf, 0x20u);
          }
          uint64_t v26 = [(HMMTRThreadRadioManager *)v22 pendingStartPairingBlock];
          int v18 = (void *)v26;
          if (v26) {
            (*(void (**)(uint64_t, void))(v26 + 16))(v26, 0);
          }
        }
      }
LABEL_16:
      if ([(HMMTRThreadRadioManager *)v10 isWEDConnectionRetryActive])
      {
        v27 = (void *)MEMORY[0x2533B64D0]();
        uint64_t v28 = v10;
        v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          v30 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v30;
          _os_log_impl(&dword_252495000, v29, OS_LOG_TYPE_INFO, "%{public}@WED connection retry is active", buf, 0xCu);
        }
      }
LABEL_36:
      [(HMMTRThreadRadioManager *)v10 setLastKnownThreadNetworkConnectionState:a3];
      v59[0] = @"HMMTRThreadRadioConnectionStateKey";
      v49 = [NSNumber numberWithInteger:a3];
      v59[1] = @"HMMTRThreadRadioNodeTypeKey";
      v60[0] = v49;
      v50 = [NSNumber numberWithInteger:a4];
      v60[1] = v50;
      v51 = [NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:2];

      [(HMMTRThreadRadioManager *)v10 postNotification:@"HMMTRThreadRadioStateChangedNotification" userInfo:v51];
      goto LABEL_37;
    }
    v35 = (void *)MEMORY[0x2533B64D0]();
    v36 = v10;
    v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      v38 = HMFGetLogIdentifier();
      v39 = [(HMMTRThreadRadioManager *)v36 fabricIDOfActiveThreadNetwork];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v38;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v39;
      *(_WORD *)&buf[22] = 2112;
      id v62 = (int64_t)v8;
      _os_log_impl(&dword_252495000, v37, OS_LOG_TYPE_INFO, "%{public}@Dropping notification as the fabricID does not match that of the active network, activeNetworkFabricID: %@, fabricID: %@", buf, 0x20u);
    }
  }
LABEL_37:
}

uint64_t __76__HMMTRThreadRadioManager__notifyThreadRadioStateChanged_nodeType_fabricID___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPendingThreadStart:0];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    return [v2 startThreadRadioForSystemCommissionerFabricID:v3];
  }
  else
  {
    uint64_t v5 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    return [v2 startThreadRadioForHomeWithFabricID:v3 preventDisconnect:v5];
  }
}

- (void)notifyThreadRadioStateChanged:(int64_t)a3 nodeType:(int64_t)a4 fabricID:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __75__HMMTRThreadRadioManager_notifyThreadRadioStateChanged_nodeType_fabricID___block_invoke;
  v10[3] = &unk_265375CB8;
  int64_t v12 = a3;
  int64_t v13 = a4;
  v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [(HMMTRThreadRadioManager *)self dispatchBlock:v10];
}

uint64_t __75__HMMTRThreadRadioManager_notifyThreadRadioStateChanged_nodeType_fabricID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyThreadRadioStateChanged:*(void *)(a1 + 48) nodeType:*(void *)(a1 + 56) fabricID:*(void *)(a1 + 40)];
}

- (void)_updateFabricIDOfActiveThreadNetwork:(id)a3 isFabricIDOfSystemCommissioner:(BOOL)a4
{
  BOOL v4 = a4;
  [(HMMTRThreadRadioManager *)self setFabricIDOfActiveThreadNetwork:a3];
  [(HMMTRThreadRadioManager *)self setThreadNetworkActivatedForSystemCommissionerFabric:v4];
}

- (BOOL)isReadyToTransitionToFullRouterModeForFirmwareUpdate
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled())
  {
    uint64_t v3 = [(HMMTRThreadRadioManager *)self delegate];
    if (v3)
    {
      BOOL v4 = (void *)v3;
      BOOL v5 = [(HMMTRThreadRadioManager *)self deviceSupportsThreadService];

      if (v5)
      {
        id v6 = [(HMMTRThreadRadioManager *)self fabricIDOfActiveThreadNetwork];
        if (v6)
        {
          if ([(HMMTRThreadRadioManager *)self threadNetworkActivatedForSystemCommissionerFabric])
          {
            id v7 = (void *)MEMORY[0x2533B64D0]();
            id v8 = self;
            id v9 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            {
              float v10 = HMFGetLogIdentifier();
              int v20 = 138543362;
              id v21 = v10;
              id v11 = "%{public}@Firmware updates shouldn't be triggered from system commissioner fabric";
LABEL_17:
              _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v20, 0xCu);
            }
          }
          else
          {
            if (![(HMMTRThreadRadioManager *)self isPairingActive])
            {
              char v17 = [(HMMTRThreadRadioManager *)self delegate];
              uint64_t v18 = [v17 getThreadNetworkConnectionStateWithFabricID:v6];

              if (v18 == 3)
              {
                uint64_t v19 = [(HMMTRThreadRadioManager *)self delegate];
                int64_t v13 = (HMMTRThreadRadioManager *)[v19 getThreadNetworkNodeTypeWithFabricID:v6];

                if ((unint64_t)v13 <= 7)
                {
                  LODWORD(v13) = (0x86u >> (char)v13) & 1;
                  goto LABEL_20;
                }
              }
LABEL_19:
              LOBYTE(v13) = 0;
LABEL_20:

              return (char)v13;
            }
            id v7 = (void *)MEMORY[0x2533B64D0]();
            id v8 = self;
            id v9 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            {
              float v10 = HMFGetLogIdentifier();
              int v20 = 138543362;
              id v21 = v10;
              id v11 = "%{public}@Currently in pairing mode, cannot transition to fw update mode";
              goto LABEL_17;
            }
          }
        }
        else
        {
          id v7 = (void *)MEMORY[0x2533B64D0]();
          id v8 = self;
          id v9 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            float v10 = HMFGetLogIdentifier();
            int v20 = 138543362;
            id v21 = v10;
            id v11 = "%{public}@Thread is not active";
            goto LABEL_17;
          }
        }

        goto LABEL_19;
      }
    }
  }
  int64_t v12 = (void *)MEMORY[0x2533B64D0]();
  int64_t v13 = self;
  BOOL v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    id v15 = HMFGetLogIdentifier();
    int v20 = 138543362;
    id v21 = v15;
    _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Thread radio feature is not enabled", (uint8_t *)&v20, 0xCu);
  }
  LOBYTE(v13) = 0;
  return (char)v13;
}

- (BOOL)isReadyToEstablishWEDConnection
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled())
  {
    uint64_t v3 = [(HMMTRThreadRadioManager *)self delegate];
    if (v3)
    {
      BOOL v4 = (void *)v3;
      BOOL v5 = [(HMMTRThreadRadioManager *)self deviceSupportsThreadService];

      if (v5)
      {
        id v6 = [(HMMTRThreadRadioManager *)self fabricIDOfActiveThreadNetwork];
        if (v6)
        {
          BOOL v7 = [(HMMTRThreadRadioManager *)self threadNetworkActivatedForSystemCommissionerFabric];
          id v8 = [(HMMTRThreadRadioManager *)self delegate];
          id v9 = v8;
          if (v7)
          {
            id v29 = 0;
            uint64_t v10 = [v8 getUserPreferredThreadNetworkConnectionStateWithError:&v29];
            id v11 = v29;

            if (v11)
            {
              BOOL v12 = 1;
            }
            else if (v10 == 3)
            {
              v25 = [(HMMTRThreadRadioManager *)self delegate];
              id v28 = 0;
              uint64_t v26 = [v25 getUserPreferredThreadNetworkNodeTypeWithError:&v28];
              id v11 = v28;

              if (v11) {
                BOOL v27 = 1;
              }
              else {
                BOOL v27 = v26 == 1;
              }
              BOOL v12 = v27;
            }
            else
            {
              id v11 = 0;
              BOOL v12 = 0;
            }

            goto LABEL_28;
          }
          uint64_t v22 = [v8 getThreadNetworkConnectionStateWithFabricID:v6];

          if (v22 == 3)
          {
            v23 = [(HMMTRThreadRadioManager *)self delegate];
            uint64_t v24 = [v23 getThreadNetworkNodeTypeWithFabricID:v6];

            if (v24 == 1)
            {
              BOOL v12 = 1;
LABEL_28:

              return v12;
            }
          }
        }
        else
        {
          uint64_t v18 = (void *)MEMORY[0x2533B64D0]();
          uint64_t v19 = self;
          int v20 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            id v21 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v31 = v21;
            _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_INFO, "%{public}@Thread is not active", buf, 0xCu);
          }
        }
        BOOL v12 = 0;
        goto LABEL_28;
      }
    }
  }
  int64_t v13 = (void *)MEMORY[0x2533B64D0]();
  BOOL v14 = self;
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    __int16 v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v31 = v16;
    _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Thread radio feature is not enabled", buf, 0xCu);
  }
  return 0;
}

- (BOOL)isThreadNetworkConnected
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled())
  {
    uint64_t v3 = [(HMMTRThreadRadioManager *)self delegate];
    if (v3)
    {
      BOOL v4 = (void *)v3;
      BOOL v5 = [(HMMTRThreadRadioManager *)self deviceSupportsThreadService];

      if (v5)
      {
        id v6 = [(HMMTRThreadRadioManager *)self fabricIDOfActiveThreadNetwork];
        if (!v6)
        {
          uint64_t v19 = (void *)MEMORY[0x2533B64D0]();
          int v20 = self;
          id v21 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            uint64_t v22 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            id v28 = v22;
            _os_log_impl(&dword_252495000, v21, OS_LOG_TYPE_INFO, "%{public}@Thread is not active", buf, 0xCu);
          }
          goto LABEL_22;
        }
        BOOL v7 = [(HMMTRThreadRadioManager *)self threadNetworkActivatedForSystemCommissionerFabric];
        id v8 = [(HMMTRThreadRadioManager *)self delegate];
        id v9 = v8;
        if (v7)
        {
          id v26 = 0;
          uint64_t v10 = [v8 getUserPreferredThreadNetworkConnectionStateWithError:&v26];
          id v11 = v26;

          unint64_t v12 = 0;
          if (!v11 && v10 == 3)
          {
            int64_t v13 = [(HMMTRThreadRadioManager *)self delegate];
            id v25 = 0;
            unint64_t v12 = [v13 getUserPreferredThreadNetworkNodeTypeWithError:&v25];
            id v11 = v25;

            if (v11) {
              unint64_t v12 = 0;
            }
          }
        }
        else
        {
          uint64_t v23 = [v8 getThreadNetworkConnectionStateWithFabricID:v6];

          if (v23 != 3) {
            goto LABEL_22;
          }
          uint64_t v24 = [(HMMTRThreadRadioManager *)self delegate];
          unint64_t v12 = [v24 getThreadNetworkNodeTypeWithFabricID:v6];
        }
        if (v12 <= 7)
        {
          LODWORD(v15) = (0xFCu >> v12) & 1;
LABEL_23:

          return (char)v15;
        }
LABEL_22:
        LOBYTE(v15) = 0;
        goto LABEL_23;
      }
    }
  }
  BOOL v14 = (void *)MEMORY[0x2533B64D0]();
  id v15 = self;
  __int16 v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    char v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v28 = v17;
    _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Thread radio feature is not enabled", buf, 0xCu);
  }
  LOBYTE(v15) = 0;
  return (char)v15;
}

- (void)_stopThreadRadioForSystemCommissionerFabricID:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled()
    || ([(HMMTRThreadRadioManager *)self delegate], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0)
    || (id v6 = (void *)v5,
        BOOL v7 = [(HMMTRThreadRadioManager *)self deviceSupportsThreadService],
        v6,
        !v7))
  {
    uint64_t v20 = MEMORY[0x2533B64D0]();
    id v21 = self;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      int v31 = 138543362;
      uint64_t v32 = v23;
      _os_log_impl(&dword_252495000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Thread radio feature is not enabled", (uint8_t *)&v31, 0xCu);
    }
    uint64_t v24 = (void *)v20;
    goto LABEL_13;
  }
  id v8 = (void *)MEMORY[0x2533B64D0]();
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v31 = 138543618;
    uint64_t v32 = v11;
    __int16 v33 = 2112;
    id v34 = v4;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Stop thread for system commissioner fabric ID %@", (uint8_t *)&v31, 0x16u);
  }
  if (!v4)
  {
    uint64_t v12 = MEMORY[0x2533B64D0]();
    int64_t v13 = v9;
    BOOL v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = HMFGetLogIdentifier();
      int v31 = 138543362;
      uint64_t v32 = v15;
      _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, "%{public}@Invalid fabricID, ignoring thread radio stop", (uint8_t *)&v31, 0xCu);
LABEL_25:

      goto LABEL_26;
    }
    goto LABEL_26;
  }
  if ([(HMMTRThreadRadioManager *)v9 preventDisconnect])
  {
    uint64_t v12 = MEMORY[0x2533B64D0]();
    int64_t v13 = v9;
    BOOL v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = HMFGetLogIdentifier();
      __int16 v16 = [(HMMTRThreadRadioManager *)v13 fabricIDOfActiveThreadNetwork];
      int v31 = 138543874;
      uint64_t v32 = v15;
      __int16 v33 = 2112;
      id v34 = v4;
      __int16 v35 = 2112;
      v36 = v16;
      char v17 = "%{public}@Preventing thread stop for system commissioner fabricID %@ because preventDisconnect is true and l"
            "ocked to fabricID %@";
      uint64_t v18 = v14;
      uint32_t v19 = 32;
LABEL_24:
      _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v31, v19);

      goto LABEL_25;
    }
    goto LABEL_26;
  }
  uint64_t v25 = [(HMMTRThreadRadioManager *)v9 fabricIDOfActiveThreadNetwork];
  if (v25)
  {
    id v26 = (void *)v25;
    BOOL v27 = [(HMMTRThreadRadioManager *)v9 fabricIDOfActiveThreadNetwork];
    char v28 = [v27 isEqual:v4];

    if ((v28 & 1) == 0)
    {
      uint64_t v12 = MEMORY[0x2533B64D0]();
      int64_t v13 = v9;
      BOOL v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = HMFGetLogIdentifier();
        __int16 v16 = [(HMMTRThreadRadioManager *)v13 fabricIDOfActiveThreadNetwork];
        int v31 = 138543618;
        uint64_t v32 = v15;
        __int16 v33 = 2112;
        id v34 = v16;
        char v17 = "%{public}@Thread network is running for another fabric ID %@. Not stopping Thread.";
        uint64_t v18 = v14;
        uint32_t v19 = 22;
        goto LABEL_24;
      }
LABEL_26:

      uint64_t v24 = (void *)v12;
LABEL_13:
      goto LABEL_14;
    }
  }
  [(HMMTRThreadRadioManager *)v9 setLastKnownThreadNetworkConnectionState:1];
  uint64_t v29 = [(HMMTRThreadRadioManager *)v9 delegate];
  [v29 stopThreadRadioForUserPreferredNetwork];

  [(HMMTRThreadRadioManager *)v9 _updateFabricIDOfActiveThreadNetwork:0 isFabricIDOfSystemCommissioner:0];
  if (CFPreferencesGetAppBooleanValue(@"StartThreadOnWake", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)&& [(HMMTRThreadRadioManager *)v9 deviceIsLockedAndPendingStopThread])
  {
    v30 = [(HMMTRThreadRadioManager *)v9 delegate];
    [v30 stopThreadRadioOnDeviceLock];
  }
LABEL_14:
}

- (void)stopThreadRadioForSystemCommissionerFabricID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __72__HMMTRThreadRadioManager_stopThreadRadioForSystemCommissionerFabricID___block_invoke;
  v6[3] = &unk_265376E98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HMMTRThreadRadioManager *)self dispatchBlock:v6];
}

uint64_t __72__HMMTRThreadRadioManager_stopThreadRadioForSystemCommissionerFabricID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopThreadRadioForSystemCommissionerFabricID:*(void *)(a1 + 40)];
}

- (void)_startThreadRadioForSystemCommissionerFabricID:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled()
    || ([(HMMTRThreadRadioManager *)self delegate], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0)
    || (id v6 = (void *)v5,
        BOOL v7 = [(HMMTRThreadRadioManager *)self deviceSupportsThreadService],
        v6,
        !v7))
  {
    uint64_t v18 = MEMORY[0x2533B64D0]();
    uint32_t v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      id v21 = HMFGetLogIdentifier();
      int v24 = 138543362;
      uint64_t v25 = v21;
      _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Thread radio feature is not enabled", (uint8_t *)&v24, 0xCu);
    }
    uint64_t v22 = (void *)v18;
    goto LABEL_13;
  }
  id v8 = (void *)MEMORY[0x2533B64D0]();
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v24 = 138543618;
    uint64_t v25 = v11;
    __int16 v26 = 2112;
    id v27 = v4;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Start thread for system commissioner fabric ID %@", (uint8_t *)&v24, 0x16u);
  }
  if (v4)
  {
    uint64_t v12 = [(HMMTRThreadRadioManager *)v9 fabricIDOfActiveThreadNetwork];

    if (!v12)
    {
      [(HMMTRThreadRadioManager *)v9 _updateFabricIDOfActiveThreadNetwork:v4 isFabricIDOfSystemCommissioner:1];
      [(HMMTRThreadRadioManager *)v9 setPreventDisconnect:0];
      uint64_t v23 = [(HMMTRThreadRadioManager *)v9 delegate];
      [v23 startThreadRadioForUserPreferredNetwork];

      goto LABEL_14;
    }
    uint64_t v13 = MEMORY[0x2533B64D0]();
    BOOL v14 = v9;
    id v15 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
      goto LABEL_18;
    }
    __int16 v16 = HMFGetLogIdentifier();
    char v17 = [(HMMTRThreadRadioManager *)v14 fabricIDOfActiveThreadNetwork];
    int v24 = 138543618;
    uint64_t v25 = v16;
    __int16 v26 = 2112;
    id v27 = v17;
    _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_INFO, "%{public}@Thread network is already running for fabric ID %@. Not starting Thread.", (uint8_t *)&v24, 0x16u);

    goto LABEL_17;
  }
  uint64_t v13 = MEMORY[0x2533B64D0]();
  BOOL v14 = v9;
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    __int16 v16 = HMFGetLogIdentifier();
    int v24 = 138543362;
    uint64_t v25 = v16;
    _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_INFO, "%{public}@Invalid fabricID, ignoring thread radio start", (uint8_t *)&v24, 0xCu);
LABEL_17:
  }
LABEL_18:

  uint64_t v22 = (void *)v13;
LABEL_13:
LABEL_14:
}

- (void)overrideLocationCheckForPairingForFabricID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__HMMTRThreadRadioManager_overrideLocationCheckForPairingForFabricID___block_invoke;
  v6[3] = &unk_265376E98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HMMTRThreadRadioManager *)self dispatchBlock:v6];
}

void __70__HMMTRThreadRadioManager_overrideLocationCheckForPairingForFabricID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 overrideLocationCheckForPairingForFabricID:*(void *)(a1 + 40)];
}

- (void)startThreadRadioForSystemCommissionerFabricID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __73__HMMTRThreadRadioManager_startThreadRadioForSystemCommissionerFabricID___block_invoke;
  v6[3] = &unk_265376E98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HMMTRThreadRadioManager *)self dispatchBlock:v6];
}

uint64_t __73__HMMTRThreadRadioManager_startThreadRadioForSystemCommissionerFabricID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startThreadRadioForSystemCommissionerFabricID:*(void *)(a1 + 40)];
}

- (void)_stopThreadRadioForHomeWithFabricID:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled()
    || ([(HMMTRThreadRadioManager *)self delegate], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0)
    || (id v6 = (void *)v5,
        BOOL v7 = [(HMMTRThreadRadioManager *)self deviceSupportsThreadService],
        v6,
        !v7))
  {
    uint64_t v17 = MEMORY[0x2533B64D0]();
    uint64_t v18 = self;
    uint32_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      int v24 = 138543362;
      uint64_t v25 = v20;
      _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Thread radio feature is not enabled", (uint8_t *)&v24, 0xCu);
    }
    id v21 = (void *)v17;
    goto LABEL_13;
  }
  id v8 = (void *)MEMORY[0x2533B64D0]();
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v24 = 138543618;
    uint64_t v25 = v11;
    __int16 v26 = 2112;
    id v27 = v4;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Stop thread for fabricID %@", (uint8_t *)&v24, 0x16u);
  }
  if (!v4)
  {
    uint64_t v12 = MEMORY[0x2533B64D0]();
    uint64_t v13 = v9;
    BOOL v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = HMFGetLogIdentifier();
      int v24 = 138543362;
      uint64_t v25 = v15;
      _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, "%{public}@Invalid fabricID, ignoring thread radio stop", (uint8_t *)&v24, 0xCu);
      goto LABEL_17;
    }
LABEL_18:

    id v21 = (void *)v12;
LABEL_13:
    goto LABEL_14;
  }
  if ([(HMMTRThreadRadioManager *)v9 preventDisconnect])
  {
    uint64_t v12 = MEMORY[0x2533B64D0]();
    uint64_t v13 = v9;
    BOOL v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = HMFGetLogIdentifier();
      __int16 v16 = [(HMMTRThreadRadioManager *)v13 fabricIDOfActiveThreadNetwork];
      int v24 = 138543874;
      uint64_t v25 = v15;
      __int16 v26 = 2112;
      id v27 = v4;
      __int16 v28 = 2112;
      uint64_t v29 = v16;
      _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, "%{public}@Preventing thread stop for fabricID %@ because preventDisconnect is true and locked to fabricID %@", (uint8_t *)&v24, 0x20u);

LABEL_17:
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  [(HMMTRThreadRadioManager *)v9 setLastKnownThreadNetworkConnectionState:1];
  uint64_t v22 = [(HMMTRThreadRadioManager *)v9 delegate];
  [v22 stopThreadRadioForHomeWithFabricID:v4];

  [(HMMTRThreadRadioManager *)v9 _updateFabricIDOfActiveThreadNetwork:0 isFabricIDOfSystemCommissioner:0];
  [(HMMTRThreadRadioManager *)v9 setEMACAddressOfWEDAccessory:0];
  if (CFPreferencesGetAppBooleanValue(@"StartThreadOnWake", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)&& [(HMMTRThreadRadioManager *)v9 deviceIsLockedAndPendingStopThread])
  {
    uint64_t v23 = [(HMMTRThreadRadioManager *)v9 delegate];
    [v23 stopThreadRadioOnDeviceLock];
  }
LABEL_14:
}

- (void)stopThreadRadioForHomeWithFabricID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__HMMTRThreadRadioManager_stopThreadRadioForHomeWithFabricID___block_invoke;
  v6[3] = &unk_265376E98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HMMTRThreadRadioManager *)self dispatchBlock:v6];
}

uint64_t __62__HMMTRThreadRadioManager_stopThreadRadioForHomeWithFabricID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopThreadRadioForHomeWithFabricID:*(void *)(a1 + 40)];
}

- (void)_allowDisconnect
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled()
    && ([(HMMTRThreadRadioManager *)self delegate], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0)
    && (id v4 = (void *)v3,
        BOOL v5 = [(HMMTRThreadRadioManager *)self deviceSupportsThreadService],
        v4,
        v5))
  {
    uint64_t v6 = [(HMMTRThreadRadioManager *)self fabricIDOfActiveThreadNetwork];
    if (!v6
      || (id v7 = (void *)v6,
          BOOL v8 = [(HMMTRThreadRadioManager *)self preventDisconnect],
          v7,
          !v8))
    {
      id v9 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v10 = self;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        uint64_t v13 = [(HMMTRThreadRadioManager *)v10 fabricIDOfActiveThreadNetwork];
        [(HMMTRThreadRadioManager *)v10 preventDisconnect];
        BOOL v14 = HMFBooleanToString();
        int v24 = 138543874;
        uint64_t v25 = v12;
        __int16 v26 = 2112;
        id v27 = v13;
        __int16 v28 = 2112;
        uint64_t v29 = v14;
        _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unexpected state, fabricIDOfActiveThreadNetwork = %@, preventDisconnect = %@", (uint8_t *)&v24, 0x20u);
      }
    }
    id v15 = (void *)MEMORY[0x2533B64D0]();
    __int16 v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      uint32_t v19 = [(HMMTRThreadRadioManager *)v16 fabricIDOfActiveThreadNetwork];
      int v24 = 138543618;
      uint64_t v25 = v18;
      __int16 v26 = 2112;
      id v27 = v19;
      _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_INFO, "%{public}@Allowing thread stop for fabricID %@", (uint8_t *)&v24, 0x16u);
    }
    [(HMMTRThreadRadioManager *)v16 setPreventDisconnect:0];
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x2533B64D0]();
    id v21 = self;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      int v24 = 138543362;
      uint64_t v25 = v23;
      _os_log_impl(&dword_252495000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Thread radio feature is not enabled", (uint8_t *)&v24, 0xCu);
    }
  }
}

- (void)allowDisconnect
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __42__HMMTRThreadRadioManager_allowDisconnect__block_invoke;
  v2[3] = &unk_265378638;
  v2[4] = self;
  [(HMMTRThreadRadioManager *)self dispatchBlock:v2];
}

uint64_t __42__HMMTRThreadRadioManager_allowDisconnect__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _allowDisconnect];
}

- (BOOL)hasMatterThreadAccessoryInHomeWithFabricID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMMTRThreadRadioManager *)self delegate];
  char v6 = [v5 hasMatterThreadAccessoryInHomeWithFabricID:v4];

  return v6;
}

- (void)_stopAccessoryFirmwareUpdateWithCompletion:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *))a3;
  if (!isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled()
    || ([(HMMTRThreadRadioManager *)self delegate],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    uint64_t v18 = MEMORY[0x2533B64D0]();
    uint32_t v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v35 = v21;
      _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Thread radio feature is not enabled", buf, 0xCu);
    }
    uint64_t v22 = (void *)v18;
    goto LABEL_14;
  }
  char v6 = (void *)MEMORY[0x2533B64D0]();
  id v7 = self;
  BOOL v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    uint64_t v10 = [(HMMTRThreadRadioManager *)v7 eMACAddressOfWEDAccessory];
    *(_DWORD *)buf = 138543618;
    __int16 v35 = v9;
    __int16 v36 = 2112;
    uint64_t v37 = v10;
    _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@stop accessory firmware update for accessory with emac = %@", buf, 0x16u);
  }
  id v11 = [(HMMTRThreadRadioManager *)v7 fabricIDOfActiveThreadNetwork];

  if (!v11)
  {
    uint64_t v24 = MEMORY[0x2533B64D0]();
    uint64_t v25 = v7;
    __int16 v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v35 = v27;
      _os_log_impl(&dword_252495000, v26, OS_LOG_TYPE_ERROR, "%{public}@No active thread network configured, dropping request to inform thread SW of stop firmware update", buf, 0xCu);
    }
    uint64_t v22 = (void *)v24;
LABEL_14:
    uint64_t v23 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F41FD8] code:5 userInfo:0];
    v4[2](v4, v23);

    goto LABEL_15;
  }
  if (![(HMMTRThreadRadioManager *)v7 isFirmwareUpdateActive])
  {
    uint64_t v12 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v13 = v7;
    BOOL v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v35 = v15;
      _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, "%{public}@Not currently in a firmware update mode", buf, 0xCu);
    }
  }
  __int16 v16 = [(HMMTRThreadRadioManager *)v7 delegate];
  uint64_t v17 = [(HMMTRThreadRadioManager *)v7 fabricIDOfActiveThreadNetwork];
  uint64_t v28 = MEMORY[0x263EF8330];
  uint64_t v29 = 3221225472;
  uint64_t v30 = __70__HMMTRThreadRadioManager__stopAccessoryFirmwareUpdateWithCompletion___block_invoke;
  int v31 = &unk_265378578;
  uint64_t v32 = v7;
  __int16 v33 = v4;
  [v16 stopAccessoryFirmwareUpdateWithFabricID:v17 completion:&v28];

  [(HMMTRThreadRadioManager *)v7 allowDisconnect];
LABEL_15:
}

void __70__HMMTRThreadRadioManager__stopAccessoryFirmwareUpdateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  char v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v8 = HMFGetLogIdentifier();
      int v12 = 138543362;
      uint64_t v13 = v8;
      id v9 = "%{public}@Failed to inform thread SW of stop firmware update";
      uint64_t v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_252495000, v10, v11, v9, (uint8_t *)&v12, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL v8 = HMFGetLogIdentifier();
    int v12 = 138543362;
    uint64_t v13 = v8;
    id v9 = "%{public}@Informed thread SW of stop firmware update";
    uint64_t v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  [*(id *)(a1 + 32) setFirmwareUpdateActive:0];
  [*(id *)(a1 + 32) setEMACAddressOfFWUpdatesAccessory:0];
  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3);
}

- (void)stopAccessoryFirmwareUpdateWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__HMMTRThreadRadioManager_stopAccessoryFirmwareUpdateWithCompletion___block_invoke;
  v6[3] = &unk_2653770F0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HMMTRThreadRadioManager *)self dispatchBlock:v6];
}

uint64_t __69__HMMTRThreadRadioManager_stopAccessoryFirmwareUpdateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopAccessoryFirmwareUpdateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_startAccessoryFirmwareUpdateWithExtendedMACAddress:(id)a3 isWedDevice:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  if (!isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled()
    || ([(HMMTRThreadRadioManager *)self delegate],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        !v10))
  {
    uint64_t v23 = MEMORY[0x2533B64D0]();
    uint64_t v24 = self;
    uint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      __int16 v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v38 = v26;
      _os_log_impl(&dword_252495000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Thread radio feature is not enabled", buf, 0xCu);
    }
    id v27 = (void *)v23;
    goto LABEL_13;
  }
  os_log_type_t v11 = [(HMMTRThreadRadioManager *)self fabricIDOfActiveThreadNetwork];

  int v12 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  id v15 = v14;
  if (!v11)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v38 = v29;
      __int16 v39 = 2112;
      id v40 = v8;
      _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_ERROR, "%{public}@No active thread network configured, dropping request to inform thread SW of start firmware update with eMAC %@", buf, 0x16u);
    }
    id v27 = v12;
LABEL_13:
    uint64_t v28 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F41FD8] code:5 userInfo:0];
    v9[2](v9, v28);

    goto LABEL_14;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    __int16 v16 = HMFGetLogIdentifier();
    uint64_t v17 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    uint64_t v38 = v16;
    __int16 v39 = 2112;
    id v40 = v8;
    __int16 v41 = 2112;
    v42 = v17;
    _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_INFO, "%{public}@start accessory firmware update for accessory with eMAC %@, isWED = %@", buf, 0x20u);
  }
  if ([(HMMTRThreadRadioManager *)v13 isFirmwareUpdateActive])
  {
    uint64_t v18 = (void *)MEMORY[0x2533B64D0]();
    uint32_t v19 = v13;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = HMFGetLogIdentifier();
      uint64_t v22 = [(HMMTRThreadRadioManager *)v19 eMACAddressOfFWUpdatesAccessory];
      *(_DWORD *)buf = 138543618;
      uint64_t v38 = v21;
      __int16 v39 = 2112;
      id v40 = v22;
      _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_INFO, "%{public}@Already informed thread SW of start firmware update with emac %@", buf, 0x16u);
    }
    v9[2](v9, 0);
  }
  else
  {
    uint64_t v30 = [(HMMTRThreadRadioManager *)v13 fabricIDOfActiveThreadNetwork];
    [(HMMTRThreadRadioManager *)v13 startThreadRadioForHomeWithFabricID:v30 preventDisconnect:1];

    [(HMMTRThreadRadioManager *)v13 setFirmwareUpdateActive:1];
    if (v8)
    {
      int v31 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
      [(HMMTRThreadRadioManager *)v13 setEMACAddressOfFWUpdatesAccessory:v31];
    }
    else
    {
      [(HMMTRThreadRadioManager *)v13 setEMACAddressOfFWUpdatesAccessory:0];
    }
    uint64_t v32 = [(HMMTRThreadRadioManager *)v13 delegate];
    __int16 v33 = [(HMMTRThreadRadioManager *)v13 fabricIDOfActiveThreadNetwork];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __102__HMMTRThreadRadioManager__startAccessoryFirmwareUpdateWithExtendedMACAddress_isWedDevice_completion___block_invoke;
    v34[3] = &unk_265377368;
    v34[4] = v13;
    id v35 = v8;
    __int16 v36 = v9;
    [v32 startAccessoryFirmwareUpdateWithExtendedMACAddress:v35 fabricID:v33 isWedDevice:v6 completion:v34];
  }
LABEL_14:
}

void __102__HMMTRThreadRadioManager__startAccessoryFirmwareUpdateWithExtendedMACAddress_isWedDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  BOOL v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      int v12 = 138543874;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to inform thread SW of start firmware update with emac %@, error %@", (uint8_t *)&v12, 0x20u);
    }
    [*(id *)(a1 + 32) setFirmwareUpdateActive:0];
    [*(id *)(a1 + 32) setEMACAddressOfFWUpdatesAccessory:0];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      int v12 = 138543618;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Informed thread SW of start firmware update with emac %@", (uint8_t *)&v12, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)startAccessoryFirmwareUpdateWithExtendedMACAddress:(id)a3 isWedDevice:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __101__HMMTRThreadRadioManager_startAccessoryFirmwareUpdateWithExtendedMACAddress_isWedDevice_completion___block_invoke;
  v12[3] = &unk_265376988;
  v12[4] = self;
  id v13 = v8;
  BOOL v15 = a4;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(HMMTRThreadRadioManager *)self dispatchBlock:v12];
}

uint64_t __101__HMMTRThreadRadioManager_startAccessoryFirmwareUpdateWithExtendedMACAddress_isWedDevice_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startAccessoryFirmwareUpdateWithExtendedMACAddress:*(void *)(a1 + 40) isWedDevice:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (void)_stopAccessoryPairingWithCompletion:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *))a3;
  if (!isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled()
    || ([(HMMTRThreadRadioManager *)self delegate],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    uint64_t v20 = MEMORY[0x2533B64D0]();
    id v21 = self;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v34 = v23;
      _os_log_impl(&dword_252495000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Thread radio feature is not enabled", buf, 0xCu);
    }
    uint64_t v24 = (void *)v20;
    goto LABEL_14;
  }
  BOOL v6 = [(HMMTRThreadRadioManager *)self fabricIDOfActiveThreadNetwork];

  id v7 = (void *)MEMORY[0x2533B64D0]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (!v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v34 = v26;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_ERROR, "%{public}@No active thread network configured, dropping request to inform thread SW of stop pairing", buf, 0xCu);
    }
    uint64_t v24 = v7;
LABEL_14:
    uint64_t v25 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F41FD8] code:5 userInfo:0];
    v4[2](v4, v25);

    goto LABEL_15;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v12 = [(HMMTRThreadRadioManager *)v8 pairingAccessoryServer];
    id v13 = [v12 nodeID];
    id v14 = [(HMMTRThreadRadioManager *)v8 eMACAddressOfWEDAccessory];
    *(_DWORD *)buf = 138543874;
    id v34 = v11;
    __int16 v35 = 2112;
    __int16 v36 = v13;
    __int16 v37 = 2112;
    uint64_t v38 = v14;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@stop accessory pairing for accessory with nodeID = %@, emac = %@", buf, 0x20u);
  }
  [(HMMTRThreadRadioManager *)v8 setPairingActive:0];
  [(HMMTRThreadRadioManager *)v8 setPairingAccessoryServer:0];
  BOOL v15 = [(HMMTRThreadRadioManager *)v8 delegate];
  __int16 v16 = [(HMMTRThreadRadioManager *)v8 fabricIDOfActiveThreadNetwork];
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  uint64_t v29 = __63__HMMTRThreadRadioManager__stopAccessoryPairingWithCompletion___block_invoke;
  uint64_t v30 = &unk_265378578;
  int v31 = v8;
  uint64_t v32 = v4;
  [v15 stopAccessoryPairingWithFabricID:v16 completion:&v27];

  id v17 = [(HMMTRThreadRadioManager *)v8 pendingStartPairingBlock];

  if (v17)
  {
    uint64_t v18 = [(HMMTRThreadRadioManager *)v8 pendingStartPairingBlock];
    if (v18)
    {
      uint32_t v19 = [MEMORY[0x263F087E8] hmfErrorWithCode:12];
      ((void (**)(void, void *))v18)[2](v18, v19);
    }
  }
  [(HMMTRThreadRadioManager *)v8 allowDisconnect];

LABEL_15:
}

void __63__HMMTRThreadRadioManager__stopAccessoryPairingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  BOOL v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v12 = 138543362;
      id v13 = v8;
      id v9 = "%{public}@Failed to inform thread SW of stop pairing";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_252495000, v10, v11, v9, (uint8_t *)&v12, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v12 = 138543362;
    id v13 = v8;
    id v9 = "%{public}@Informed thread SW of stop pairing";
    id v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3);
}

- (void)stopAccessoryPairingWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__HMMTRThreadRadioManager_stopAccessoryPairingWithCompletion___block_invoke;
  v6[3] = &unk_2653770F0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HMMTRThreadRadioManager *)self dispatchBlock:v6];
}

uint64_t __62__HMMTRThreadRadioManager_stopAccessoryPairingWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopAccessoryPairingWithCompletion:*(void *)(a1 + 40)];
}

- (void)__startAccessoryPairingWithExtendedMACAddress:(id)a3 isWedDevice:(BOOL)a4 accessoryServer:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  int v12 = (void (**)(id, void))a6;
  if (!isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled()
    || ([(HMMTRThreadRadioManager *)self delegate],
        id v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        !v13))
  {
    uint64_t v27 = MEMORY[0x2533B64D0]();
    uint64_t v28 = self;
    uint64_t v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v39 = v30;
      _os_log_impl(&dword_252495000, v29, OS_LOG_TYPE_DEBUG, "%{public}@Thread radio feature is not enabled", buf, 0xCu);
    }
    int v31 = (void *)v27;
    goto LABEL_13;
  }
  uint64_t v14 = [(HMMTRThreadRadioManager *)self fabricIDOfActiveThreadNetwork];

  BOOL v15 = (void *)MEMORY[0x2533B64D0]();
  __int16 v16 = self;
  id v17 = HMFGetOSLogHandle();
  uint64_t v18 = v17;
  if (!v14)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v39 = v32;
      __int16 v40 = 2112;
      id v41 = v10;
      _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_ERROR, "%{public}@No active thread network configured, dropping request to inform thread SW of start pairing with eMAC %@", buf, 0x16u);
    }
    int v31 = v15;
LABEL_13:
    uint64_t v24 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F41FD8] code:5 userInfo:0];
    v12[2](v12, v24);
    goto LABEL_14;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint32_t v19 = HMFGetLogIdentifier();
    uint64_t v20 = HMFBooleanToString();
    id v21 = [v11 nodeID];
    *(_DWORD *)buf = 138544130;
    uint64_t v39 = v19;
    __int16 v40 = 2112;
    id v41 = v10;
    __int16 v42 = 2112;
    uint64_t v43 = v20;
    __int16 v44 = 2112;
    v45 = v21;
    _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_INFO, "%{public}@start accessory pairing for accessory with eMAC = %@, isWED = %@, accessory nodeID = %@", buf, 0x2Au);
  }
  uint64_t v22 = [(HMMTRThreadRadioManager *)v16 fabricIDOfActiveThreadNetwork];
  [(HMMTRThreadRadioManager *)v16 overrideLocationCheckForPairingForFabricID:v22];

  uint64_t v23 = [(HMMTRThreadRadioManager *)v16 fabricIDOfActiveThreadNetwork];
  [(HMMTRThreadRadioManager *)v16 startThreadRadioForHomeWithFabricID:v23 preventDisconnect:1];

  [(HMMTRThreadRadioManager *)v16 setPairingActive:1];
  [(HMMTRThreadRadioManager *)v16 setPairingAccessoryServer:v11];
  [(HMMTRThreadRadioManager *)v16 setIsWEDConnectionRetryActive:0];
  uint64_t v24 = [(HMMTRThreadRadioManager *)v16 retryCompletionHandler];
  [(HMMTRThreadRadioManager *)v16 setRetryCompletionHandler:0];
  if (v24)
  {
    uint64_t v25 = [MEMORY[0x263F087E8] hmfErrorWithCode:12];
    ((void (**)(void, void *))v24)[2](v24, v25);
  }
  if (v10)
  {
    __int16 v26 = (void *)[[NSString alloc] initWithData:v10 encoding:4];
    [(HMMTRThreadRadioManager *)v16 setEMACAddressOfWEDAccessory:v26];
  }
  else
  {
    [(HMMTRThreadRadioManager *)v16 setEMACAddressOfWEDAccessory:0];
  }
  __int16 v33 = [(HMMTRThreadRadioManager *)v16 delegate];
  id v34 = [(HMMTRThreadRadioManager *)v16 fabricIDOfActiveThreadNetwork];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __112__HMMTRThreadRadioManager___startAccessoryPairingWithExtendedMACAddress_isWedDevice_accessoryServer_completion___block_invoke;
  v35[3] = &unk_265377368;
  v35[4] = v16;
  id v36 = v10;
  __int16 v37 = v12;
  [v33 startAccessoryPairingWithExtendedMACAddress:v36 fabricID:v34 isWedDevice:v8 completion:v35];

LABEL_14:
}

void __112__HMMTRThreadRadioManager___startAccessoryPairingWithExtendedMACAddress_isWedDevice_accessoryServer_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  BOOL v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      int v17 = 138543874;
      uint64_t v18 = v8;
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      __int16 v21 = 2112;
      id v22 = v3;
      id v10 = "%{public}@Failed to inform thread SW of start pairing with emac %@, error %@";
      id v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 32;
LABEL_6:
      _os_log_impl(&dword_252495000, v11, v12, v10, (uint8_t *)&v17, v13);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL v8 = HMFGetLogIdentifier();
    uint64_t v14 = *(void *)(a1 + 40);
    int v17 = 138543618;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    uint64_t v20 = v14;
    id v10 = "%{public}@Informed thread SW of start pairing with emac %@";
    id v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 22;
    goto LABEL_6;
  }

  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v3, v15, v16);
}

- (void)_startAccessoryPairingWithExtendedMACAddress:(id)a3 isWedDevice:(BOOL)a4 accessoryServer:(id)a5 completion:(id)a6
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  objc_initWeak(&location, self);
  uint64_t v47 = MEMORY[0x263EF8330];
  uint64_t v48 = 3221225472;
  v49 = __111__HMMTRThreadRadioManager__startAccessoryPairingWithExtendedMACAddress_isWedDevice_accessoryServer_completion___block_invoke;
  v50 = &unk_265375C90;
  uint64_t v46 = &v54;
  objc_copyWeak(&v54, &location);
  id v13 = v12;
  id v53 = v13;
  id v44 = v10;
  id v51 = v44;
  BOOL v55 = a4;
  id v14 = v11;
  id v52 = v14;
  uint64_t v15 = (void *)MEMORY[0x2533B66E0](&v47);
  uint64_t v16 = [(HMMTRThreadRadioManager *)self pendingStartPairingBlock];

  if (v16)
  {
    int v17 = [(HMMTRThreadRadioManager *)self pendingStartPairingBlock];
    if (v17)
    {
      uint64_t v18 = [MEMORY[0x263F087E8] hmfErrorWithCode:12];
      ((void (**)(void, void *))v17)[2](v17, v18);
    }
  }
  __int16 v19 = [(HMMTRThreadRadioManager *)self delegate];
  uint64_t v20 = [v14 fabricID];
  uint64_t v21 = [v19 getThreadNetworkConnectionStateWithFabricID:v20];

  id v22 = [(HMMTRThreadRadioManager *)self fabricIDOfActiveThreadNetwork];
  if (!v22) {
    goto LABEL_14;
  }
  uint64_t v23 = [(HMMTRThreadRadioManager *)self fabricIDOfActiveThreadNetwork];
  uint64_t v24 = [v14 fabricID];
  char v25 = [v23 isEqual:v24];
  char v26 = v21 == 3 ? v25 : 0;

  if (v26)
  {
    uint64_t v27 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v28 = self;
    HMFGetOSLogHandle();
    uint64_t v29 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      id v31 = [(HMMTRThreadRadioManager *)v28 _connectionStateValueToString:3];
      uint64_t v32 = [v14 fabricID];
      __int16 v33 = [(HMMTRThreadRadioManager *)v28 fabricIDOfActiveThreadNetwork];
      *(_DWORD *)buf = 138544130;
      id v58 = v30;
      __int16 v59 = 2112;
      id v60 = v31;
      __int16 v61 = 2112;
      id v62 = v32;
      __int16 v63 = 2112;
      uint64_t v64 = v33;
      _os_log_impl(&dword_252495000, v29, OS_LOG_TYPE_INFO, "%{public}@Thread network connection state: %@ for fabricID: %@, calling start pairing block now. ActiveThreadNetworkFabricID: %@", buf, 0x2Au);
    }
    id v34 = [v14 fabricID];
    [(HMMTRThreadRadioManager *)v28 setFabricIDOfPendingStartPairingBlock:v34];

    uint64_t v35 = MEMORY[0x2533B66E0](v15);
    id v36 = (void *)v35;
    if (v35) {
      (*(void (**)(uint64_t, void))(v35 + 16))(v35, 0);
    }
  }
  else
  {
LABEL_14:
    __int16 v37 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v38 = self;
    HMFGetOSLogHandle();
    uint64_t v39 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v40 = (id)objc_claimAutoreleasedReturnValue();
      id v41 = [(HMMTRThreadRadioManager *)v38 _connectionStateValueToString:v21];
      __int16 v42 = [v14 fabricID];
      uint64_t v43 = [(HMMTRThreadRadioManager *)v38 fabricIDOfActiveThreadNetwork];
      *(_DWORD *)buf = 138544130;
      id v58 = v40;
      __int16 v59 = 2112;
      id v60 = v41;
      __int16 v61 = 2112;
      id v62 = v42;
      __int16 v63 = 2112;
      uint64_t v64 = v43;
      _os_log_impl(&dword_252495000, v39, OS_LOG_TYPE_INFO, "%{public}@Thread network connection state: %@ for fabricID: %@, deferring call to start pairing block. ActiveThreadNetworkFabricID: %@", buf, 0x2Au);
    }
    [(HMMTRThreadRadioManager *)v38 setPendingStartPairingBlock:v15];
    id v36 = [v14 fabricID];
    [(HMMTRThreadRadioManager *)v38 setFabricIDOfPendingStartPairingBlock:v36];
  }

  objc_destroyWeak(v46);
  objc_destroyWeak(&location);
}

void __111__HMMTRThreadRadioManager__startAccessoryPairingWithExtendedMACAddress_isWedDevice_accessoryServer_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = WeakRetained;
  if (v3)
  {
    BOOL v6 = (void *)MEMORY[0x2533B64D0]();
    id v7 = v5;
    BOOL v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v9;
      _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@Aborting call to thread start pairing", buf, 0xCu);
    }
    uint64_t v10 = MEMORY[0x2533B66E0](*(void *)(a1 + 48));
    id v11 = (void *)v10;
    if (v10) {
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v3);
    }

    [v7 setPendingStartPairingBlock:0];
    [v7 setFabricIDOfPendingStartPairingBlock:0];
  }
  else
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __111__HMMTRThreadRadioManager__startAccessoryPairingWithExtendedMACAddress_isWedDevice_accessoryServer_completion___block_invoke_23;
    v12[3] = &unk_265377480;
    v12[4] = WeakRetained;
    id v13 = *(id *)(a1 + 32);
    char v16 = *(unsigned char *)(a1 + 64);
    id v14 = *(id *)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    [v5 dispatchBlock:v12];
    [v5 setPendingStartPairingBlock:0];
    [v5 setFabricIDOfPendingStartPairingBlock:0];
  }
}

uint64_t __111__HMMTRThreadRadioManager__startAccessoryPairingWithExtendedMACAddress_isWedDevice_accessoryServer_completion___block_invoke_23(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__startAccessoryPairingWithExtendedMACAddress:isWedDevice:accessoryServer:completion:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)startAccessoryPairingWithExtendedMACAddress:(id)a3 isWedDevice:(BOOL)a4 accessoryServer:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __110__HMMTRThreadRadioManager_startAccessoryPairingWithExtendedMACAddress_isWedDevice_accessoryServer_completion___block_invoke;
  v16[3] = &unk_265377480;
  v16[4] = self;
  id v17 = v10;
  BOOL v20 = a4;
  id v18 = v11;
  id v19 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  [(HMMTRThreadRadioManager *)self dispatchBlock:v16];
}

uint64_t __110__HMMTRThreadRadioManager_startAccessoryPairingWithExtendedMACAddress_isWedDevice_accessoryServer_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startAccessoryPairingWithExtendedMACAddress:*(void *)(a1 + 40) isWedDevice:*(unsigned __int8 *)(a1 + 64) accessoryServer:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)connectToAccessoryWithExtendedMACAddress:(id)a3 forRetry:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __88__HMMTRThreadRadioManager_connectToAccessoryWithExtendedMACAddress_forRetry_completion___block_invoke;
  v12[3] = &unk_265376988;
  id v13 = v8;
  id v14 = v9;
  v12[4] = self;
  BOOL v15 = a4;
  id v10 = v8;
  id v11 = v9;
  [(HMMTRThreadRadioManager *)self dispatchBlock:v12];
}

void __88__HMMTRThreadRadioManager_connectToAccessoryWithExtendedMACAddress_forRetry_completion___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  if (!isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled()
    || ([*(id *)(a1 + 32) delegate], (uint64_t v2 = objc_claimAutoreleasedReturnValue()) == 0)
    || (id v3 = (void *)v2,
        char v4 = [*(id *)(a1 + 32) deviceSupportsThreadService],
        v3,
        (v4 & 1) == 0))
  {
    id v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
LABEL_10:

      uint64_t v15 = *(void *)(a1 + 48);
      BOOL v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F41FD8] code:5 userInfo:0];
      (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v6);
      goto LABEL_11;
    }
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v48 = v10;
    id v11 = "%{public}@Thread radio feature is not enabled";
    id v12 = v9;
    os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
    uint32_t v14 = 12;
LABEL_9:
    _os_log_impl(&dword_252495000, v12, v13, v11, buf, v14);

    goto LABEL_10;
  }
  id v5 = [*(id *)(a1 + 32) fabricIDOfActiveThreadNetwork];

  if (!v5)
  {
    id v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    id v10 = HMFGetLogIdentifier();
    char v16 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v48 = v10;
    __int16 v49 = 2112;
    v50 = v16;
    id v11 = "%{public}@No active thread network configured, dropping request to connect to accessory with eMAC %@";
    id v12 = v9;
    os_log_type_t v13 = OS_LOG_TYPE_ERROR;
    uint32_t v14 = 22;
    goto LABEL_9;
  }
  if (*(void *)(a1 + 40)) {
    BOOL v6 = (void *)[[NSString alloc] initWithData:*(void *)(a1 + 40) encoding:4];
  }
  else {
    BOOL v6 = 0;
  }
  if ([*(id *)(a1 + 32) isPairingActive] && !v6
    || [*(id *)(a1 + 32) isPairingActive]
    && ([*(id *)(a1 + 32) eMACAddressOfWEDAccessory],
        id v17 = objc_claimAutoreleasedReturnValue(),
        char v18 = [v17 isEqualToString:v6],
        v17,
        (v18 & 1) == 0))
  {
    BOOL v20 = (void *)MEMORY[0x2533B64D0]();
    id v21 = *(id *)(a1 + 32);
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      uint64_t v24 = [*(id *)(a1 + 32) eMACAddressOfWEDAccessory];
      *(_DWORD *)buf = 138543874;
      uint64_t v48 = v23;
      __int16 v49 = 2112;
      v50 = v6;
      __int16 v51 = 2112;
      id v52 = v24;
      _os_log_impl(&dword_252495000, v22, OS_LOG_TYPE_INFO, "%{public}@Not processing connect request to a different WED accessory emac %@ when pairing is active for emac %@", buf, 0x20u);
    }
    uint64_t v25 = *(void *)(a1 + 48);
    char v26 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F41FD8] code:5 userInfo:0];
    (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v26);
  }
  else
  {
    if (*(void *)(a1 + 40))
    {
      uint64_t v19 = [*(id *)(a1 + 32) setEMACAddressOfWEDAccessory:v6];
    }
    else
    {
      if (*(unsigned char *)(a1 + 56))
      {
        uint64_t v27 = 0;
      }
      else
      {
        uint64_t v27 = [*(id *)(a1 + 32) retryCompletionHandler];

        if (v27)
        {
          uint64_t v28 = (void *)MEMORY[0x2533B64D0]();
          id v29 = *(id *)(a1 + 32);
          id v30 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            id v31 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            uint64_t v48 = v31;
            _os_log_impl(&dword_252495000, v30, OS_LOG_TYPE_INFO, "%{public}@Previously attempted WED connection is aborted", buf, 0xCu);
          }
          uint64_t v27 = [*(id *)(a1 + 32) retryCompletionHandler];
          [*(id *)(a1 + 32) setRetryCompletionHandler:0];
        }
      }
      [*(id *)(a1 + 32) setEMACAddressOfWEDAccessory:0];
      [*(id *)(a1 + 32) setIsWEDConnectionRetryActive:0];
      if (v27)
      {
        uint64_t v32 = [MEMORY[0x263F087E8] hmfErrorWithCode:12];
        ((void (**)(void, void *))v27)[2](v27, v32);
      }
    }
    __int16 v33 = (void *)MEMORY[0x2533B64D0](v19);
    id v34 = *(id *)(a1 + 32);
    uint64_t v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      id v36 = HMFGetLogIdentifier();
      __int16 v37 = [*(id *)(a1 + 32) eMACAddressOfWEDAccessory];
      *(_DWORD *)buf = 138543618;
      uint64_t v48 = v36;
      __int16 v49 = 2112;
      v50 = v37;
      _os_log_impl(&dword_252495000, v35, OS_LOG_TYPE_INFO, "%{public}@Set eMACAddress of WED accessory to :%@", buf, 0x16u);
    }
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __88__HMMTRThreadRadioManager_connectToAccessoryWithExtendedMACAddress_forRetry_completion___block_invoke_20;
    v45[3] = &unk_265375C68;
    uint64_t v38 = *(void **)(a1 + 40);
    v45[4] = *(void *)(a1 + 32);
    id v46 = v38;
    uint64_t v39 = (void (**)(void, void))MEMORY[0x2533B66E0](v45);
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __88__HMMTRThreadRadioManager_connectToAccessoryWithExtendedMACAddress_forRetry_completion___block_invoke_2;
    v41[3] = &unk_2653769B0;
    id v40 = *(void **)(a1 + 40);
    v41[4] = *(void *)(a1 + 32);
    id v42 = v40;
    char v44 = *(unsigned char *)(a1 + 56);
    id v43 = *(id *)(a1 + 48);
    ((void (**)(void, void *))v39)[2](v39, v41);
  }
LABEL_11:
}

void __88__HMMTRThreadRadioManager_connectToAccessoryWithExtendedMACAddress_forRetry_completion___block_invoke_20(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 threadNetworkActivatedForSystemCommissionerFabric];
  id v8 = [*(id *)(a1 + 32) delegate];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v5)
  {
    [v8 connectToAccessoryForUserPreferredNetworkWithExtendedMACAddress:*(void *)(a1 + 40) completion:v4];
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) fabricIDOfActiveThreadNetwork];
    [v8 connectToAccessoryWithExtendedMACAddress:v6 withFabricID:v7 completion:v4];

    id v4 = (id)v7;
  }
}

void __88__HMMTRThreadRadioManager_connectToAccessoryWithExtendedMACAddress_forRetry_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __88__HMMTRThreadRadioManager_connectToAccessoryWithExtendedMACAddress_forRetry_completion___block_invoke_3;
  v6[3] = &unk_265377480;
  id v7 = v3;
  id v8 = v4;
  id v9 = *(id *)(a1 + 40);
  char v11 = *(unsigned char *)(a1 + 56);
  id v10 = *(id *)(a1 + 48);
  id v5 = v3;
  [v4 dispatchBlock:v6];
}

uint64_t __88__HMMTRThreadRadioManager_connectToAccessoryWithExtendedMACAddress_forRetry_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (!*(void *)(a1 + 32)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  uint64_t v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 40);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 32);
    int v9 = 138543874;
    id v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_ERROR, "%{public}@Failed to connect to accessory with emac %@, error %@", (uint8_t *)&v9, 0x20u);
  }
  if ([*(id *)(a1 + 40) isWEDConnectionRetryActive]) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  [*(id *)(a1 + 40) setIsWEDConnectionRetryActive:1];
  if (!*(unsigned char *)(a1 + 64)) {
    [*(id *)(a1 + 40) setRetryCompletionHandler:*(void *)(a1 + 56)];
  }
  uint64_t result = [*(id *)(a1 + 40) _retryWEDConnectionToAccessoryWithDelayInMs:100.0];
  if (*(unsigned char *)(a1 + 64)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  return result;
}

- (void)connectToAccessoryWithExtendedMACAddress:(id)a3 completion:(id)a4
{
}

- (void)_startThreadRadioForHomeWithFabricID:(id)a3 preventDisconnect:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled()
    || ([(HMMTRThreadRadioManager *)self delegate], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) == 0)
    || (id v8 = (void *)v7,
        BOOL v9 = [(HMMTRThreadRadioManager *)self deviceSupportsThreadService],
        v8,
        !v9))
  {
    uint64_t v15 = MEMORY[0x2533B64D0]();
    char v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_14;
    }
    char v18 = HMFGetLogIdentifier();
    int v42 = 138543362;
    id v43 = v18;
    uint64_t v19 = "%{public}@Thread radio feature is not enabled";
    BOOL v20 = v17;
    os_log_type_t v21 = OS_LOG_TYPE_DEBUG;
LABEL_12:
    uint32_t v22 = 12;
    goto LABEL_13;
  }
  id v10 = (void *)MEMORY[0x2533B64D0]();
  __int16 v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    __int16 v13 = HMFGetLogIdentifier();
    uint64_t v14 = HMFBooleanToString();
    int v42 = 138544130;
    id v43 = v13;
    __int16 v44 = 2112;
    id v45 = v6;
    __int16 v46 = 2112;
    uint64_t v47 = v14;
    __int16 v48 = 2048;
    uint64_t v49 = [(HMMTRThreadRadioManager *)v11 lastKnownThreadNetworkConnectionState];
    _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_INFO, "%{public}@Start thread for fabricID %@, preventDisconnect = %@, last known connectionState: %ld", (uint8_t *)&v42, 0x2Au);
  }
  if (!v6)
  {
    uint64_t v15 = MEMORY[0x2533B64D0]();
    char v16 = v11;
    id v17 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    char v18 = HMFGetLogIdentifier();
    int v42 = 138543362;
    id v43 = v18;
    uint64_t v19 = "%{public}@Invalid fabricID, ignoring thread radio start";
    BOOL v20 = v17;
    os_log_type_t v21 = OS_LOG_TYPE_INFO;
    goto LABEL_12;
  }
  if (![(HMMTRThreadRadioManager *)v11 pendingThreadStart])
  {
    uint64_t v24 = [(HMMTRThreadRadioManager *)v11 fabricIDOfActiveThreadNetwork];
    if (v24)
    {
      uint64_t v25 = (void *)v24;
      uint64_t v26 = [(HMMTRThreadRadioManager *)v11 lastKnownThreadNetworkConnectionState];

      if (v26 != 1)
      {
        uint64_t v27 = [(HMMTRThreadRadioManager *)v11 fabricIDOfActiveThreadNetwork];
        int v28 = [v27 isEqualToNumber:v6];

        if (v28)
        {
          id v29 = (void *)MEMORY[0x2533B64D0]();
          id v30 = v11;
          id v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            uint64_t v32 = HMFGetLogIdentifier();
            __int16 v33 = HMFBooleanToString();
            int v42 = 138543618;
            id v43 = v32;
            __int16 v44 = 2112;
            id v45 = v33;
            _os_log_impl(&dword_252495000, v31, OS_LOG_TYPE_INFO, "%{public}@Thread network is already running for this fabric, calling threadStart and setting preventDisconnect to %@", (uint8_t *)&v42, 0x16u);
          }
        }
        else
        {
          BOOL v34 = [(HMMTRThreadRadioManager *)v11 preventDisconnect];
          id v29 = (void *)MEMORY[0x2533B64D0]();
          uint64_t v35 = v11;
          id v31 = HMFGetOSLogHandle();
          BOOL v36 = os_log_type_enabled(v31, OS_LOG_TYPE_INFO);
          if (v34)
          {
            if (v36)
            {
              __int16 v37 = HMFGetLogIdentifier();
              uint64_t v38 = [(HMMTRThreadRadioManager *)v35 fabricIDOfActiveThreadNetwork];
              int v42 = 138543874;
              id v43 = v37;
              __int16 v44 = 2112;
              id v45 = v6;
              __int16 v46 = 2112;
              uint64_t v47 = v38;
              _os_log_impl(&dword_252495000, v31, OS_LOG_TYPE_INFO, "%{public}@Ignoring thread start for fabric %@, network is locked to fabricID %@", (uint8_t *)&v42, 0x20u);
            }
            uint64_t v23 = v29;
            goto LABEL_15;
          }
          if (v36)
          {
            uint64_t v39 = HMFGetLogIdentifier();
            id v40 = [(HMMTRThreadRadioManager *)v35 fabricIDOfActiveThreadNetwork];
            int v42 = 138543874;
            id v43 = v39;
            __int16 v44 = 2112;
            id v45 = v6;
            __int16 v46 = 2112;
            uint64_t v47 = v40;
            _os_log_impl(&dword_252495000, v31, OS_LOG_TYPE_INFO, "%{public}@Thread start called for new fabricID %@, will be disconnecting from thread network for fabricID %@", (uint8_t *)&v42, 0x20u);
          }
        }
      }
    }
    [(HMMTRThreadRadioManager *)v11 _updateFabricIDOfActiveThreadNetwork:v6 isFabricIDOfSystemCommissioner:0];
    [(HMMTRThreadRadioManager *)v11 setPreventDisconnect:v4];
    id v41 = [(HMMTRThreadRadioManager *)v11 delegate];
    [v41 startThreadRadioForHomeWithFabricID:v6];

    goto LABEL_16;
  }
  uint64_t v15 = MEMORY[0x2533B64D0]();
  char v16 = v11;
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    char v18 = HMFGetLogIdentifier();
    int v42 = 138543618;
    id v43 = v18;
    __int16 v44 = 2112;
    id v45 = v6;
    uint64_t v19 = "%{public}@Thread start already pending, ignoring startThread request for fabricID %@";
    BOOL v20 = v17;
    os_log_type_t v21 = OS_LOG_TYPE_ERROR;
    uint32_t v22 = 22;
LABEL_13:
    _os_log_impl(&dword_252495000, v20, v21, v19, (uint8_t *)&v42, v22);
  }
LABEL_14:

  uint64_t v23 = (void *)v15;
LABEL_15:
LABEL_16:
}

- (void)startThreadRadioForHomeWithFabricID:(id)a3 preventDisconnect:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __81__HMMTRThreadRadioManager_startThreadRadioForHomeWithFabricID_preventDisconnect___block_invoke;
  v8[3] = &unk_265377ED8;
  v8[4] = self;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  [(HMMTRThreadRadioManager *)self dispatchBlock:v8];
}

uint64_t __81__HMMTRThreadRadioManager_startThreadRadioForHomeWithFabricID_preventDisconnect___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startThreadRadioForHomeWithFabricID:*(void *)(a1 + 40) preventDisconnect:*(unsigned __int8 *)(a1 + 48)];
}

- (void)startThreadRadioForHomeWithFabricID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__HMMTRThreadRadioManager_startThreadRadioForHomeWithFabricID___block_invoke;
  v6[3] = &unk_265376E98;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HMMTRThreadRadioManager *)self dispatchBlock:v6];
}

uint64_t __63__HMMTRThreadRadioManager_startThreadRadioForHomeWithFabricID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startThreadRadioForHomeWithFabricID:*(void *)(a1 + 40) preventDisconnect:0];
}

- (void)stopThreadOnDeviceLockTimeout
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HMMTRThreadRadioManager *)self preventDisconnect];
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      id v8 = HMFGetLogIdentifier();
      int v15 = 138543362;
      char v16 = v8;
      _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@stopThreadOnDeviceLockTimeout - not stopping because preventDisconnect is true", (uint8_t *)&v15, 0xCu);
    }
    [(HMMTRThreadRadioManager *)v5 setDeviceIsLockedAndPendingStopThread:1];
  }
  else
  {
    if (v7)
    {
      id v9 = HMFGetLogIdentifier();
      int v15 = 138543362;
      char v16 = v9;
      _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@stopping thread due to device lock", (uint8_t *)&v15, 0xCu);
    }
    BOOL v10 = [(HMMTRThreadRadioManager *)v5 threadNetworkActivatedForSystemCommissionerFabric];
    __int16 v11 = [(HMMTRThreadRadioManager *)v5 delegate];
    uint64_t v12 = v11;
    if (v10)
    {
      [v11 stopThreadRadioForUserPreferredNetwork];
    }
    else
    {
      __int16 v13 = [(HMMTRThreadRadioManager *)v5 fabricIDOfActiveThreadNetwork];
      [v12 stopThreadRadioForHomeWithFabricID:v13];
    }
    [(HMMTRThreadRadioManager *)v5 _updateFabricIDOfActiveThreadNetwork:0 isFabricIDOfSystemCommissioner:0];
    uint64_t v14 = [(HMMTRThreadRadioManager *)v5 delegate];
    [v14 stopThreadRadioOnDeviceLock];
  }
}

- (void)handleDeviceLockStateChange:(BOOL)a3
{
  BOOL v3 = a3;
  [(HMMTRThreadRadioManager *)self setDeviceIsLockedAndPendingStopThread:0];
  if (v3)
  {
    id v5 = v9;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    id v6 = __55__HMMTRThreadRadioManager_handleDeviceLockStateChange___block_invoke;
  }
  else
  {
    id v5 = &v7;
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    id v6 = __55__HMMTRThreadRadioManager_handleDeviceLockStateChange___block_invoke_17;
  }
  v5[2] = (uint64_t)v6;
  v5[3] = (uint64_t)&unk_265378638;
  v5[4] = (uint64_t)self;
  -[HMMTRThreadRadioManager dispatchBlock:](self, "dispatchBlock:", v7, v8);
}

void __55__HMMTRThreadRadioManager_handleDeviceLockStateChange___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) disconnectTimer];
  int v3 = [v2 isRunning];

  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v11 = 138543362;
      uint64_t v12 = v8;
      _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@Thread disconnect timer is already running", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      id v9 = HMFGetLogIdentifier();
      int v11 = 138543618;
      uint64_t v12 = v9;
      __int16 v13 = 2048;
      uint64_t v14 = 0x402E000000000000;
      _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@Starting %f seconds thread disconnect timer", (uint8_t *)&v11, 0x16u);
    }
    BOOL v10 = [*(id *)(a1 + 32) disconnectTimer];
    [v10 resume];
  }
}

void __55__HMMTRThreadRadioManager_handleDeviceLockStateChange___block_invoke_17(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v16 = 138543362;
    uint64_t v17 = v5;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@starting thread on device unlock", (uint8_t *)&v16, 0xCu);
  }
  id v6 = [*(id *)(a1 + 32) disconnectTimer];
  [v6 suspend];

  BOOL v7 = [*(id *)(a1 + 32) browser];
  uint64_t v8 = [v7 currentFabricID];

  if (v8)
  {
    id v9 = (void *)MEMORY[0x2533B64D0]();
    id v10 = *(id *)(a1 + 32);
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v16 = 138543362;
      uint64_t v17 = v12;
      _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_INFO, "%{public}@Not starting thread on device unlock - fabric is already active", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    __int16 v13 = *(void **)(a1 + 32);
    uint64_t v14 = [v13 browser];
    uint64_t v15 = [v14 systemCommissionerFabricID];
    [v13 startThreadRadioForSystemCommissionerFabricID:v15];
  }
}

- (void)setDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HMMTRThreadRadioControllerDelegate)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (HMMTRThreadRadioControllerDelegate *)WeakRetained;
}

- (HMMTRThreadRadioManager)initWithBrowser:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HMMTRThreadRadioManager;
  id v5 = [(HMMTRThreadRadioManager *)&v19 init];
  id v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    fabricIDOfActiveThreadNetwork = v5->_fabricIDOfActiveThreadNetwork;
    v5->_fabricIDOfActiveThreadNetwork = 0;

    v6->_threadNetworkActivatedForSystemCommissionerFabric = 0;
    v6->_preventDisconnect = 0;
    v6->_lastKnownThreadNetworkConnectionState = 0;
    v6->_deviceSupportsThreadService = 0;
    v6->_pairingActive = 0;
    v6->_firmwareUpdateActive = 0;
    v6->_pendingThreadStart = 0;
    v6->_isWEDConnectionRetryActive = 0;
    v6->_deviceIsLockedAndPendingStopThread = 0;
    eMACAddressOfWEDAccessory = v6->_eMACAddressOfWEDAccessory;
    v6->_eMACAddressOfWEDAccessory = 0;

    eMACAddressOfFWUpdatesAccessory = v6->_eMACAddressOfFWUpdatesAccessory;
    v6->_eMACAddressOfFWUpdatesAccessory = 0;

    id v10 = (const char *)HMFDispatchQueueName();
    int v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create(v10, v11);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v12;

    objc_storeWeak((id *)&v6->_browser, v4);
    uint64_t v14 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:15.0];
    disconnectTimer = v6->_disconnectTimer;
    v6->_disconnectTimer = (HMFTimer *)v14;

    [(HMFTimer *)v6->_disconnectTimer setDelegateQueue:v6->_workQueue];
    [(HMFTimer *)v6->_disconnectTimer setDelegate:v6];
    id pendingStartPairingBlock = v6->_pendingStartPairingBlock;
    v6->_id pendingStartPairingBlock = 0;

    fabricIDOfPendingStartPairingBlock = v6->_fabricIDOfPendingStartPairingBlock;
    v6->_fabricIDOfPendingStartPairingBlock = 0;
  }
  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t91 != -1) {
    dispatch_once(&logCategory__hmf_once_t91, &__block_literal_global_4052);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v92;
  return v2;
}

uint64_t __38__HMMTRThreadRadioManager_logCategory__block_invoke()
{
  logCategory__hmf_once_v92 = HMFCreateOSLogHandle();
  return MEMORY[0x270F9A758]();
}

@end