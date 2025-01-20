@interface HMDDataStreamController
- (BOOL)_isDataStreamCapable;
- (BOOL)_isDataStreamConfigurationValid;
- (BOOL)setupRequiresCharacteristicReads;
- (BOOL)supportsDataStreamOverHAP;
- (BOOL)supportsDataStreamOverTCP;
- (HMDDataStream)defaultDataStream;
- (HMDDataStreamController)initWithAccessory:(id)a3 service:(id)a4 workQueue:(id)a5;
- (HMDDataStreamController)initWithAccessory:(id)a3 service:(id)a4 workQueue:(id)a5 dataStreamFactory:(id)a6;
- (HMDDataStreamSetupOperation)setupInProgress;
- (HMDHAPAccessory)accessory;
- (HMDService)transferManagementService;
- (HMFTimer)idleTimer;
- (NSMutableArray)pendingSocketRequests;
- (NSString)logIdentifier;
- (OS_dispatch_queue)workQueue;
- (id)_getActiveProtocolWithName:(id)a3;
- (id)_getStreamProtocol;
- (id)dataStreamFactory;
- (unint64_t)maxControllerTransportMTU;
- (void)_cancelStreamTransportWithError:(id)a3;
- (void)_createBulkStreamProtocol;
- (void)_createStreamSocketWithStreamProtocol:(id)a3 applicationProtocolName:(id)a4 completion:(id)a5;
- (void)_failPendingSocketRequestsWithError:(id)a3;
- (void)_handleAccessoryConnected;
- (void)_handleAccessoryDisconnected;
- (void)_initiateStreamSetup;
- (void)_processPendingSocketRequests;
- (void)_readRequiredTransportCharacteristicsIfNeededWithCompletion:(id)a3;
- (void)_resetDefaultDataStream;
- (void)_resetTransportInfo;
- (void)_startIdleTimer;
- (void)_stopIdleTimer;
- (void)addBulkSendListener:(id)a3 fileType:(id)a4;
- (void)dataStream:(id)a3 didFailWithError:(id)a4;
- (void)dataStreamDidClose:(id)a3;
- (void)dataStreamDidOpen:(id)a3;
- (void)dataStreamDidReceiveRawFrame:(id)a3;
- (void)dataStreamDidUpdateActiveStatus:(id)a3;
- (void)dataStreamInitializationSetupOperation:(id)a3 didCompleteSupportReadWithStatus:(BOOL)a4;
- (void)dataStreamSetupOperation:(id)a3 didFailWithError:(id)a4;
- (void)dataStreamSetupOperation:(id)a3 didSucceedWithTransport:(id)a4 sessionEncryption:(id)a5;
- (void)deRegisterFromNotifications;
- (void)handleAccessoryConnected;
- (void)handleAccessoryDisconnected:(id)a3;
- (void)invalidate;
- (void)openBulkSendSessionForFileType:(id)a3 reason:(id)a4 metadata:(id)a5 queue:(id)a6 callback:(id)a7;
- (void)openStreamSocketWithApplicationProtocol:(id)a3 completion:(id)a4;
- (void)registerForNotifications;
- (void)removeBulkSendListener:(id)a3;
- (void)sendTargetControlWhoAmIWithIdentifier:(unsigned int)a3;
- (void)setAccessory:(id)a3;
- (void)setDefaultDataStream:(id)a3;
- (void)setIdleTimer:(id)a3;
- (void)setMaxControllerTransportMTU:(unint64_t)a3;
- (void)setPendingSocketRequests:(id)a3;
- (void)setSetupInProgress:(id)a3;
- (void)setSupportsDataStreamOverHAP:(BOOL)a3;
- (void)setSupportsDataStreamOverTCP:(BOOL)a3;
- (void)setTransferManagementService:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDDataStreamController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong(&self->_dataStreamFactory, 0);
  objc_storeStrong((id *)&self->_setupInProgress, 0);
  objc_storeStrong((id *)&self->_pendingSocketRequests, 0);
  objc_storeStrong((id *)&self->_defaultDataStream, 0);
  objc_destroyWeak((id *)&self->_transferManagementService);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)setIdleTimer:(id)a3
{
}

- (HMFTimer)idleTimer
{
  return self->_idleTimer;
}

- (void)setMaxControllerTransportMTU:(unint64_t)a3
{
  self->_maxControllerTransportMTU = a3;
}

- (unint64_t)maxControllerTransportMTU
{
  return self->_maxControllerTransportMTU;
}

- (void)setSupportsDataStreamOverHAP:(BOOL)a3
{
  self->_supportsDataStreamOverHAP = a3;
}

- (BOOL)supportsDataStreamOverHAP
{
  return self->_supportsDataStreamOverHAP;
}

- (void)setSupportsDataStreamOverTCP:(BOOL)a3
{
  self->_supportsDataStreamOverTCP = a3;
}

- (BOOL)supportsDataStreamOverTCP
{
  return self->_supportsDataStreamOverTCP;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (id)dataStreamFactory
{
  return self->_dataStreamFactory;
}

- (void)setSetupInProgress:(id)a3
{
}

- (HMDDataStreamSetupOperation)setupInProgress
{
  return self->_setupInProgress;
}

- (void)setPendingSocketRequests:(id)a3
{
}

- (NSMutableArray)pendingSocketRequests
{
  return self->_pendingSocketRequests;
}

- (void)setDefaultDataStream:(id)a3
{
}

- (HMDDataStream)defaultDataStream
{
  return self->_defaultDataStream;
}

- (void)setTransferManagementService:(id)a3
{
}

- (HMDService)transferManagementService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transferManagementService);
  return (HMDService *)WeakRetained;
}

- (void)setAccessory:(id)a3
{
}

- (HMDHAPAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDDataStreamController *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDDataStreamController *)self idleTimer];

  if (v6 == v4)
  {
    v7 = (void *)MEMORY[0x230FBD990]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      v11 = [(HMDDataStreamController *)v8 defaultDataStream];
      int v12 = [v11 isActive];
      v13 = @"inactive";
      if (v12) {
        v13 = @"active";
      }
      int v17 = 138543618;
      v18 = v10;
      __int16 v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Idle timer fired and data stream is %@", (uint8_t *)&v17, 0x16u);
    }
    v14 = [(HMDDataStreamController *)v8 defaultDataStream];
    char v15 = [v14 isActive];

    if ((v15 & 1) == 0)
    {
      v16 = [(HMDDataStreamController *)v8 defaultDataStream];
      [v16 close];
    }
    [(HMDDataStreamController *)v8 _stopIdleTimer];
  }
}

- (void)_stopIdleTimer
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = [(HMDDataStreamController *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDDataStreamController *)self idleTimer];

  if (v4)
  {
    v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      int v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Stopping idle timer", (uint8_t *)&v10, 0xCu);
    }
    v9 = [(HMDDataStreamController *)v6 idleTimer];
    [v9 suspend];

    [(HMDDataStreamController *)v6 setIdleTimer:0];
  }
}

- (void)_startIdleTimer
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [(HMDDataStreamController *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]([(HMDDataStreamController *)self _stopIdleTimer]);
  v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    int v19 = 138543362;
    v20 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Starting idle timer", (uint8_t *)&v19, 0xCu);
  }
  v8 = [MEMORY[0x263F42608] sharedPreferences];
  v9 = [v8 preferenceForKey:@"hdsIdleTimeout"];

  int v10 = [v9 numberValue];

  if (v10)
  {
    v11 = [v9 numberValue];
    [v11 doubleValue];
    double v13 = v12;
  }
  else
  {
    double v13 = 5.0;
  }
  v14 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:1 options:v13];
  [(HMDDataStreamController *)v5 setIdleTimer:v14];

  char v15 = [(HMDDataStreamController *)v5 idleTimer];
  [v15 setDelegate:v5];

  v16 = [(HMDDataStreamController *)v5 workQueue];
  int v17 = [(HMDDataStreamController *)v5 idleTimer];
  [v17 setDelegateQueue:v16];

  v18 = [(HMDDataStreamController *)v5 idleTimer];
  [v18 resume];
}

- (void)invalidate
{
  v3 = [(HMDDataStreamController *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__HMDDataStreamController_invalidate__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __37__HMDDataStreamController_invalidate__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F41FD8] code:2 userInfo:&unk_26E474C60];
  [*(id *)(a1 + 32) _cancelStreamTransportWithError:v2];
}

- (void)openBulkSendSessionForFileType:(id)a3 reason:(id)a4 metadata:(id)a5 queue:(id)a6 callback:(id)a7
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(id, void, void *))a7;
  int v17 = +[HMDDataStreamBulkSendProtocol protocolName];
  v18 = [(HMDDataStreamController *)self _getActiveProtocolWithName:v17];

  id v19 = v18;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v20 = v19;
  }
  else {
    v20 = 0;
  }
  id v21 = v20;

  if (v21)
  {
    [v21 openSessionForFileType:v12 reason:v13 metadata:v14 queue:v15 callback:v16];
  }
  else
  {
    v22 = (void *)MEMORY[0x230FBD990]();
    v23 = self;
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = v27 = v22;
      *(_DWORD *)buf = 138543362;
      v29 = v25;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@HMDDataStreamBulkSendProtocol not registered; cannot start bulk send session",
        buf,
        0xCu);

      v22 = v27;
    }

    v26 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    v16[2](v16, 0, v26);
  }
}

- (void)dataStreamDidUpdateActiveStatus:(id)a3
{
  id v4 = [(HMDDataStreamController *)self workQueue];
  dispatch_assert_queue_V2(v4);

  v5 = [(HMDDataStreamController *)self defaultDataStream];
  int v6 = [v5 isActive];

  if (v6)
  {
    [(HMDDataStreamController *)self _stopIdleTimer];
  }
  else
  {
    [(HMDDataStreamController *)self _startIdleTimer];
  }
}

- (void)dataStreamDidReceiveRawFrame:(id)a3
{
  id v4 = [(HMDDataStreamController *)self accessory];
  v3 = [v4 primaryIPServer];
  [v3 _indicateSessionActivityWithReason:@"DataStream"];
}

- (void)dataStreamDidOpen:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  int v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    int v10 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@DataStream opened", (uint8_t *)&v9, 0xCu);
  }
  [(HMDDataStreamController *)v6 _processPendingSocketRequests];
}

- (void)dataStreamDidClose:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  int v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    int v10 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@DataStream closed", (uint8_t *)&v9, 0xCu);
  }
  [(HMDDataStreamController *)v6 _resetDefaultDataStream];
}

- (void)dataStream:(id)a3 didFailWithError:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]();
  int v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    id v13 = v11;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@DataStream failed with error (%@)!", (uint8_t *)&v12, 0x16u);
  }
  [(HMDDataStreamController *)v9 _resetDefaultDataStream];
}

- (void)_resetDefaultDataStream
{
  [(HMDDataStreamController *)self setDefaultDataStream:0];
  id v3 = [MEMORY[0x263F087E8] hmErrorWithCode:54];
  [(HMDDataStreamController *)self _failPendingSocketRequestsWithError:v3];
}

- (void)_createBulkStreamProtocol
{
  id v3 = [HMDDataStreamBulkSendProtocol alloc];
  id v4 = [(HMDDataStreamController *)self workQueue];
  v5 = [(HMDDataStreamController *)self accessory];
  id v6 = [(HMDDataStreamController *)self logIdentifier];
  int v12 = [(HMDDataStreamBulkSendProtocol *)v3 initWithQueue:v4 accessory:v5 logIdentifier:v6];

  id v7 = [(HMDDataStreamController *)self defaultDataStream];
  v8 = +[HMDDataStreamBulkSendProtocol protocolName];
  [v7 addProtocol:v12 name:v8];

  int v9 = [(HMDDataStreamController *)self defaultDataStream];
  int v10 = [v9 protocolDelegateHandle];
  [(HMDDataStreamBulkSendProtocol *)v12 setDataStream:v10];

  uint64_t v11 = [(HMDDataStreamController *)self setupInProgress];
  [v11 movePendingBulkSendListenersToBulkSendProtocol:v12];
}

- (void)_cancelStreamTransportWithError:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDDataStreamController *)self setupInProgress];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = HMFGetLogIdentifier();
      int v19 = 138543362;
      v20 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Canceling DataStream setup", (uint8_t *)&v19, 0xCu);
    }
    int v10 = [(HMDDataStreamController *)v7 setupInProgress];
    [v10 cancelSetup];

    [(HMDDataStreamController *)v7 _failPendingSocketRequestsWithError:v4];
    [(HMDDataStreamController *)v7 setSetupInProgress:0];
  }
  else
  {
    uint64_t v11 = [(HMDDataStreamController *)self defaultDataStream];

    int v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = self;
    __int16 v14 = HMFGetOSLogHandle();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
    if (v11)
    {
      if (v15)
      {
        uint64_t v16 = HMFGetLogIdentifier();
        int v19 = 138543362;
        v20 = v16;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Canceling active DataStream", (uint8_t *)&v19, 0xCu);
      }
      int v17 = [(HMDDataStreamController *)v13 defaultDataStream];
      [v17 close];
    }
    else
    {
      if (v15)
      {
        v18 = HMFGetLogIdentifier();
        int v19 = 138543362;
        v20 = v18;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Dropping cancel-stream; appears to already be canceled",
          (uint8_t *)&v19,
          0xCu);
      }
    }
  }
}

- (void)dataStreamSetupOperation:(id)a3 didFailWithError:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDDataStreamController *)self setupInProgress];

  if (v8 == v6)
  {
    int v9 = (void *)MEMORY[0x230FBD990]();
    int v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      __int16 v14 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Canceling DataStream setup (which is in progress)", (uint8_t *)&v13, 0xCu);
    }
    [(HMDDataStreamController *)v10 setSetupInProgress:0];
    [(HMDDataStreamController *)v10 _failPendingSocketRequestsWithError:v7];
  }
}

- (void)dataStreamSetupOperation:(id)a3 didSucceedWithTransport:(id)a4 sessionEncryption:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDDataStreamController *)self setupInProgress];

  if (v11 == v8)
  {
    uint64_t v16 = [(HMDDataStreamController *)self dataStreamFactory];
    int v17 = [(HMDDataStreamController *)self workQueue];
    v18 = [(HMDDataStreamController *)self logIdentifier];
    int v19 = ((void (**)(void, id, id, void *, void *))v16)[2](v16, v9, v10, v17, v18);

    [(HMDDataStreamController *)self setDefaultDataStream:v19];
    v20 = [(HMDDataStreamController *)self defaultDataStream];
    [v20 setDelegate:self];

    [v9 setDelegate:v19];
    [(HMDDataStreamController *)self _createBulkStreamProtocol];
    [v19 connect];
    [(HMDDataStreamController *)self setSetupInProgress:0];
  }
  else
  {
    int v12 = (void *)MEMORY[0x230FBD990]();
    int v13 = self;
    __int16 v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      int v21 = 138543362;
      v22 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Setup operation succeeded however is no longer the current one; ignoring its result.",
        (uint8_t *)&v21,
        0xCu);
    }
  }
}

- (void)dataStreamInitializationSetupOperation:(id)a3 didCompleteSupportReadWithStatus:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HMDDataStreamController *)self setupInProgress];

  if (v7 == v6)
  {
    if (v4) {
      [(HMDDataStreamController *)self _handleAccessoryConnected];
    }
    if ([(HMDDataStreamController *)self _isDataStreamCapable]
      && ![(HMDDataStreamController *)self supportsDataStreamOverTCP])
    {
      [v6 setMaxControllerTransportMTU:self->_maxControllerTransportMTU];
      int v17 = [(HMDDataStreamController *)self setupInProgress];
      [v17 startSetup];
    }
    else
    {
      int v12 = (void *)MEMORY[0x230FBD990]();
      int v13 = self;
      __int16 v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = HMFGetLogIdentifier();
        int v18 = 138543362;
        int v19 = v15;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Canceling DataStream initialization setup (which is in progress)", (uint8_t *)&v18, 0xCu);
      }
      [(HMDDataStreamController *)v13 setSetupInProgress:0];
      uint64_t v16 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
      [(HMDDataStreamController *)v13 _failPendingSocketRequestsWithError:v16];
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v18 = 138543362;
      int v19 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Setup init operation succeeded however is no longer the current one; ignoring its result.",
        (uint8_t *)&v18,
        0xCu);
    }
  }
}

- (void)_initiateStreamSetup
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = [(HMDDataStreamController *)self setupInProgress];

  if (!v3)
  {
    BOOL v8 = [(HMDDataStreamController *)self setupRequiresCharacteristicReads];
    id v9 = [(HMDDataStreamController *)self accessory];
    id v10 = [(HMDDataStreamController *)self transferManagementService];
    if ([(HMDDataStreamController *)self supportsDataStreamOverTCP])
    {
      id v11 = [(HMDDataStreamController *)self workQueue];
      int v12 = [(HMDDataStreamController *)self logIdentifier];
      uint64_t v13 = +[HMDDataStreamSetupOperation tcpSetupOperationWithAccessory:v9 queue:v11 logIdentifier:v12 transferManagementService:v10];
    }
    else
    {
      if (![(HMDDataStreamController *)self supportsDataStreamOverHAP] && !v8)
      {
        int v17 = (void *)MEMORY[0x230FBD990]();
        int v18 = self;
        int v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          uint64_t v20 = HMFGetLogIdentifier();
          int v22 = 138543362;
          uint64_t v23 = v20;
          _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to create new DataStream; not supported",
            (uint8_t *)&v22,
            0xCu);
        }
        int v21 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
        [(HMDDataStreamController *)v18 _cancelStreamTransportWithError:v21];

        goto LABEL_14;
      }
      id v11 = [(HMDDataStreamController *)self workQueue];
      int v12 = [(HMDDataStreamController *)self logIdentifier];
      uint64_t v13 = +[HMDDataStreamSetupOperation hapSetupOperationWithAccessory:v9 queue:v11 logIdentifier:v12 transferManagementService:v10 maxControllerTransportMTU:[(HMDDataStreamController *)self maxControllerTransportMTU] setupOperationReadRequired:v8];
    }
    __int16 v14 = (void *)v13;
    [(HMDDataStreamController *)self setSetupInProgress:v13];

    uint64_t v15 = [(HMDDataStreamController *)self setupInProgress];
    [v15 setDelegate:self];

    if (!v8)
    {
      uint64_t v16 = [(HMDDataStreamController *)self setupInProgress];
      [v16 startSetup];
    }
LABEL_14:

    return;
  }
  BOOL v4 = (void *)MEMORY[0x230FBD990]();
  v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = HMFGetLogIdentifier();
    int v22 = 138543362;
    uint64_t v23 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Initiating stream setup while already in progress; ignoring this extra call.",
      (uint8_t *)&v22,
      0xCu);
  }
}

- (BOOL)setupRequiresCharacteristicReads
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if ([(HMDDataStreamController *)self _isDataStreamCapable]) {
    return 0;
  }
  if (![(HMDDataStreamController *)self _isDataStreamConfigurationValid])
  {
    id v3 = (void *)MEMORY[0x230FBD990]();
    BOOL v4 = self;
    v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = HMFGetLogIdentifier();
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Current data stream configuration is not valid", (uint8_t *)&v8, 0xCu);
    }
  }
  return ![(HMDDataStreamController *)self _isDataStreamCapable];
}

- (BOOL)_isDataStreamCapable
{
  if ([(HMDDataStreamController *)self supportsDataStreamOverTCP]) {
    return 1;
  }
  return [(HMDDataStreamController *)self supportsDataStreamOverHAP];
}

- (void)_createStreamSocketWithStreamProtocol:(id)a3 applicationProtocolName:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *, void))a5;
  id v11 = (void *)MEMORY[0x230FBD990]();
  int v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    __int16 v14 = HMFGetLogIdentifier();
    int v18 = 138543618;
    int v19 = v14;
    __int16 v20 = 2112;
    id v21 = v9;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Creating stream socket for application protocol %@", (uint8_t *)&v18, 0x16u);
  }
  uint64_t v15 = [HMDDataStreamSocket alloc];
  uint64_t v16 = [(HMDDataStreamController *)v12 workQueue];
  int v17 = [(HMDDataStreamSocket *)v15 initWithStreamProtocol:v8 applicationProtocolName:v9 workQueue:v16];

  [v8 registerSocket:v17];
  v10[2](v10, v17, 0);
}

- (id)_getStreamProtocol
{
  id v3 = +[HMDDataStreamStreamProtocol protocolName];
  BOOL v4 = [(HMDDataStreamController *)self _getActiveProtocolWithName:v3];

  v5 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = v5;
  if (!v7)
  {
    id v9 = [HMDDataStreamStreamProtocol alloc];
    uint64_t v10 = [(HMDDataStreamController *)self defaultDataStream];
    id v11 = [v10 protocolDelegateHandle];
    id v8 = [(HMDDataStreamStreamProtocol *)v9 initWithDataStream:v11];

    int v12 = [(HMDDataStreamController *)self defaultDataStream];
    uint64_t v13 = +[HMDDataStreamStreamProtocol protocolName];
    [v12 addProtocol:v8 name:v13];
  }
  return v8;
}

- (void)_failPendingSocketRequestsWithError:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(HMDDataStreamController *)self pendingSocketRequests];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * v9) completion];
        ((void (**)(void, void, id))v10)[2](v10, 0, v4);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  id v11 = [(HMDDataStreamController *)self pendingSocketRequests];
  [v11 removeAllObjects];
}

- (void)_processPendingSocketRequests
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [(HMDDataStreamController *)self pendingSocketRequests];
  char v4 = objc_msgSend(v3, "hmf_isEmpty");

  if ((v4 & 1) == 0)
  {
    v5 = [(HMDDataStreamController *)self _getStreamProtocol];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v6 = [(HMDDataStreamController *)self pendingSocketRequests];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          long long v12 = [v11 applicationProtocolName];
          long long v13 = [v11 completion];
          [(HMDDataStreamController *)self _createStreamSocketWithStreamProtocol:v5 applicationProtocolName:v12 completion:v13];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    long long v14 = [(HMDDataStreamController *)self pendingSocketRequests];
    [v14 removeAllObjects];
  }
}

- (void)openStreamSocketWithApplicationProtocol:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDDataStreamController *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__HMDDataStreamController_openStreamSocketWithApplicationProtocol_completion___block_invoke;
  block[3] = &unk_264A2EE80;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __78__HMDDataStreamController_openStreamSocketWithApplicationProtocol_completion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) defaultDataStream];

  if (v2
    || ([*(id *)(a1 + 32) _initiateStreamSetup],
        [*(id *)(a1 + 32) setupInProgress],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    char v4 = [*(id *)(a1 + 32) pendingSocketRequests];
    v5 = [[HMDPendingSocketRequest alloc] initWithApplicationProtocolName:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
    [v4 addObject:v5];

    id v6 = [*(id *)(a1 + 32) setupInProgress];

    if (v6)
    {
      id v7 = (void *)MEMORY[0x230FBD990]();
      id v8 = *(id *)(a1 + 32);
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v15 = v10;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Waiting for DataStream setup before processing stream socket request", buf, 0xCu);
      }
    }
    else
    {
      id v11 = *(void **)(a1 + 32);
      [v11 _processPendingSocketRequests];
    }
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 48);
    id v13 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    (*(void (**)(uint64_t, void))(v12 + 16))(v12, 0);
  }
}

- (void)sendTargetControlWhoAmIWithIdentifier:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  v5 = [(HMDDataStreamController *)self defaultDataStream];

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      id v10 = HMFGetLogIdentifier();
      int v14 = 138543362;
      long long v15 = v10;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Data Stream sending target-control whoami message", (uint8_t *)&v14, 0xCu);
    }
    id v11 = [(HMDDataStreamController *)v7 defaultDataStream];
    uint64_t v12 = [v11 protocolDelegateHandle];
    +[HMDDataStreamTargetControlProtocol sendTargetControlWhoAmIWithIdentifier:v3 dataStreamProtocolDelegate:v12];
  }
  else
  {
    if (v9)
    {
      id v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      long long v15 = v13;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Data Stream not running; dropping target-control whoami message",
        (uint8_t *)&v14,
        0xCu);
    }
  }
}

- (void)removeBulkSendListener:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDDataStreamController *)self accessory];
  id v6 = [(HMDDataStreamController *)self defaultDataStream];

  if (!v6)
  {
    long long v17 = [(HMDDataStreamController *)self setupInProgress];

    if (v17)
    {
      long long v18 = [(HMDDataStreamController *)self setupInProgress];
      int v19 = [v18 removeBulkSendListener:v4];

      uint64_t v20 = (void *)MEMORY[0x230FBD990]();
      id v21 = self;
      uint64_t v22 = HMFGetOSLogHandle();
      BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
      if (v19)
      {
        if (v23)
        {
          uint64_t v24 = HMFGetLogIdentifier();
          *(_DWORD *)v28 = 138543362;
          *(void *)&v28[4] = v24;
          v25 = "%{public}@Removed pending bulk-send listener registration (waiting for stream setup)";
LABEL_20:
          _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, v25, v28, 0xCu);
        }
      }
      else if (v23)
      {
        uint64_t v24 = HMFGetLogIdentifier();
        *(_DWORD *)v28 = 138543362;
        *(void *)&v28[4] = v24;
        v25 = "%{public}@Removed bulk-send listener trivially (stream setting up, but this was not part of it)";
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v20 = (void *)MEMORY[0x230FBD990]();
      id v21 = self;
      uint64_t v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        uint64_t v24 = HMFGetLogIdentifier();
        *(_DWORD *)v28 = 138543362;
        *(void *)&v28[4] = v24;
        v25 = "%{public}@Removed bulk-send listener trivially (nothing had started)";
        goto LABEL_20;
      }
    }

LABEL_22:
    objc_msgSend(v4, "accessory:didCloseDataStreamWithError:", v5, 0, *(_OWORD *)v28);
    goto LABEL_23;
  }
  id v7 = +[HMDDataStreamBulkSendProtocol protocolName];
  id v8 = [(HMDDataStreamController *)self _getActiveProtocolWithName:v7];

  id v9 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  uint64_t v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = self;
  int v14 = HMFGetOSLogHandle();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v15)
    {
      uint64_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)v28 = 138543362;
      *(void *)&v28[4] = v16;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Removed bulk-send listener on this stream", v28, 0xCu);
    }
    [v11 removeListener:v4];

    goto LABEL_22;
  }
  if (v15)
  {
    v26 = HMFGetLogIdentifier();
    *(_DWORD *)v28 = 138543362;
    *(void *)&v28[4] = v26;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Removed bulk-send listener on this stream (but there was no protocol!?)", v28, 0xCu);
  }
  v27 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1064];
  [v4 accessory:v5 didCloseDataStreamWithError:v27];

LABEL_23:
}

- (void)addBulkSendListener:(id)a3 fileType:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDDataStreamController *)self accessory];
  id v9 = [(HMDDataStreamController *)self defaultDataStream];

  if (v9)
  {
    id v10 = +[HMDDataStreamBulkSendProtocol protocolName];
    id v11 = [(HMDDataStreamController *)self _getActiveProtocolWithName:v10];

    id v12 = v11;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;

    BOOL v15 = (void *)MEMORY[0x230FBD990]();
    uint64_t v16 = self;
    long long v17 = HMFGetOSLogHandle();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if (v14)
    {
      if (v18)
      {
        int v19 = HMFGetLogIdentifier();
        int v29 = 138543618;
        uint64_t v30 = v19;
        __int16 v31 = 2112;
        id v32 = v7;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Adding bulk-send listener on this stream for file-type '%@'", (uint8_t *)&v29, 0x16u);
      }
      [v14 addListener:v6 fileType:v7];
    }
    else
    {
      if (v18)
      {
        v26 = HMFGetLogIdentifier();
        int v29 = 138543618;
        uint64_t v30 = v26;
        __int16 v31 = 2112;
        id v32 = v7;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Cancelling bulk-send listener registration for file-type '%@' due to no such protocol on this stream", (uint8_t *)&v29, 0x16u);
      }
      v27 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1064];
      [v6 accessory:v8 didCloseDataStreamWithError:v27];
    }
  }
  else
  {
    [(HMDDataStreamController *)self _initiateStreamSetup];
    uint64_t v20 = [(HMDDataStreamController *)self setupInProgress];

    id v21 = (void *)MEMORY[0x230FBD990]();
    uint64_t v22 = self;
    BOOL v23 = HMFGetOSLogHandle();
    uint64_t v24 = v23;
    if (v20)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v25 = HMFGetLogIdentifier();
        int v29 = 138543618;
        uint64_t v30 = v25;
        __int16 v31 = 2112;
        id v32 = v7;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Add pending bulk-send listener registration for file-type '%@' (waiting for stream setup)", (uint8_t *)&v29, 0x16u);
      }
      id v12 = [(HMDDataStreamController *)v22 setupInProgress];
      [v12 addBulkSendListener:v6 fileType:v7];
    }
    else
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v28 = HMFGetLogIdentifier();
        int v29 = 138543618;
        uint64_t v30 = v28;
        __int16 v31 = 2112;
        id v32 = v7;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Canceling bulk-send listener registration for file-type '%@' due to no active data stream", (uint8_t *)&v29, 0x16u);
      }
      id v12 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1063];
      [v6 accessory:v8 didCloseDataStreamWithError:v12];
    }
  }
}

- (id)_getActiveProtocolWithName:(id)a3
{
  id v4 = a3;
  v5 = [(HMDDataStreamController *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDDataStreamController *)self defaultDataStream];
  id v7 = [v6 protocolWithName:v4];

  return v7;
}

- (void)_handleAccessoryDisconnected
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory with HDS service is no longer connected: %@. Removing any transports that were active", (uint8_t *)&v8, 0x16u);
  }
  v4->_supportsDataStreamOverTCP = 0;
  id v7 = [MEMORY[0x263F087E8] hmErrorWithCode:4];
  [(HMDDataStreamController *)v4 _cancelStreamTransportWithError:v7];
}

- (void)handleAccessoryDisconnected:(id)a3
{
  id v4 = a3;
  v5 = [(HMDDataStreamController *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__HMDDataStreamController_handleAccessoryDisconnected___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __55__HMDDataStreamController_handleAccessoryDisconnected___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  v5 = [*(id *)(a1 + 40) accessory];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    [*(id *)(a1 + 40) _handleAccessoryDisconnected];
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 40);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v10 = HMFGetLogIdentifier();
      id v11 = [*(id *)(a1 + 40) accessory];
      int v12 = 138543874;
      id v13 = v10;
      __int16 v14 = 2112;
      id v15 = v4;
      __int16 v16 = 2112;
      long long v17 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unconfigured accessory: %@ did not match self.accessory :%@", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (void)_handleAccessoryConnected
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDDataStreamController *)self workQueue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(HMDDataStreamController *)self _isDataStreamConfigurationValid];
  BOOL v5 = [(HMDDataStreamController *)self canAcceptBulkSendListeners];
  int v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = HMFGetLogIdentifier();
    __int16 v10 = [(HMDDataStreamController *)v7 accessory];
    id v11 = [v10 shortDescription];
    int v12 = HMFBooleanToString();
    id v13 = HMFBooleanToString();
    int v16 = 138544130;
    long long v17 = v9;
    __int16 v18 = 2112;
    int v19 = v11;
    __int16 v20 = 2112;
    id v21 = v12;
    __int16 v22 = 2112;
    BOOL v23 = v13;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory with HDS service is connected: %@. Configured: %@ Accepts Bulk Send: %@", (uint8_t *)&v16, 0x2Au);
  }
  if (v4 && v5)
  {
    __int16 v14 = [MEMORY[0x263F08A00] defaultCenter];
    id v15 = [(HMDDataStreamController *)v7 accessory];
    [v14 postNotificationName:@"HMDAccessoryDoesSupportBulkSendDataStreamNotification" object:v15];
  }
}

- (void)_readRequiredTransportCharacteristicsIfNeededWithCompletion:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  BOOL v4 = (void (**)(id, void *))a3;
  BOOL v5 = [(HMDDataStreamController *)self workQueue];
  dispatch_assert_queue_V2(v5);

  int v6 = [(HMDDataStreamController *)self transferManagementService];
  id v7 = [v6 findCharacteristicWithType:*MEMORY[0x263F0C588]];
  uint64_t v8 = [v6 findCharacteristicWithType:@"00000130-0000-1000-8000-0026BB765291"];
  id v9 = (void *)v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    id v11 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    v4[2](v4, v11);
  }
  else
  {
    uint64_t v12 = [v7 value];
    id v13 = (void *)v12;
    if (v12
      && ([v9 value],
          __int16 v14 = objc_claimAutoreleasedReturnValue(),
          v14,
          v13,
          v14))
    {
      v4[2](v4, 0);
    }
    else
    {
      id v15 = [MEMORY[0x263EFF980] array];
      int v16 = +[HMDCharacteristicRequest requestWithCharacteristic:v7];
      if (v16) {
        [v15 addObject:v16];
      }
      long long v17 = +[HMDCharacteristicRequest requestWithCharacteristic:v9];

      if (v17) {
        [v15 addObject:v17];
      }
      if ([v15 count])
      {
        context = (void *)MEMORY[0x230FBD990]();
        __int16 v18 = self;
        int v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v25 = HMFGetLogIdentifier();
          __int16 v20 = [(HMDDataStreamController *)v18 accessory];
          id v21 = [v20 identifier];
          *(_DWORD *)buf = 138543618;
          __int16 v31 = v25;
          __int16 v32 = 2112;
          uint64_t v33 = v21;
          _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Reading required transport characteristic for data stream controller %@", buf, 0x16u);
        }
        objc_initWeak((id *)buf, v18);
        __int16 v22 = [(HMDDataStreamController *)v18 accessory];
        BOOL v23 = [(HMDDataStreamController *)v18 workQueue];
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __87__HMDDataStreamController__readRequiredTransportCharacteristicsIfNeededWithCompletion___block_invoke;
        v27[3] = &unk_264A2E840;
        objc_copyWeak(&v29, (id *)buf);
        v28 = v4;
        [v22 readCharacteristicValues:v15 source:7 queue:v23 completionHandler:v27];

        objc_destroyWeak(&v29);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        uint64_t v24 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
        v4[2](v4, v24);
      }
    }
  }
}

void __87__HMDDataStreamController__readRequiredTransportCharacteristicsIfNeededWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v5 = WeakRetained;
  if (WeakRetained)
  {
    int v6 = [WeakRetained workQueue];
    dispatch_assert_queue_V2(v6);

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "error", (void)v16);
          if (v12)
          {
            id v13 = (void *)v12;
            goto LABEL_12;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    id v13 = 0;
LABEL_12:

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
  }
}

- (BOOL)_isDataStreamConfigurationValid
{
  uint64_t v125 = *MEMORY[0x263EF8340];
  id v3 = [(HMDDataStreamController *)self workQueue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(HMDDataStreamController *)self transferManagementService];
  BOOL v5 = [v4 findCharacteristicWithType:*MEMORY[0x263F0C588]];
  int v6 = [v5 value];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263F42670]);
    uint64_t v8 = [v5 value];
    uint64_t v9 = (void *)[v7 initWithVersionString:v8];

    if (v9)
    {
      uint64_t v10 = [v9 majorVersion];
      id v11 = (void *)MEMORY[0x230FBD990]();
      uint64_t v12 = self;
      id v13 = HMFGetOSLogHandle();
      uint64_t v14 = v13;
      if (v10 == 1)
      {
        v105 = v5;
        v108 = v4;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          id v15 = HMFGetLogIdentifier();
          long long v16 = [(HMDDataStreamController *)v12 accessory];
          long long v17 = [v16 name];
          long long v18 = [(HMDDataStreamController *)v12 accessory];
          long long v19 = [v18 uuid];
          __int16 v20 = [v19 UUIDString];
          *(_DWORD *)buf = 138544130;
          v118 = v15;
          __int16 v119 = 2112;
          v120 = v9;
          __int16 v121 = 2112;
          v122 = v17;
          __int16 v123 = 2112;
          v124 = v20;
          _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEBUG, "%{public}@HDS has version '%@' (%@/%@)", buf, 0x2Au);

          BOOL v5 = v105;
          BOOL v4 = v108;
        }
        uint64_t v21 = [v4 findCharacteristicWithType:@"00000130-0000-1000-8000-0026BB765291"];
        if (v21)
        {
          [(HMDDataStreamController *)v12 _resetTransportInfo];
          __int16 v22 = (void *)MEMORY[0x263F35988];
          BOOL v23 = [v21 value];
          id v115 = 0;
          uint64_t v24 = [v22 parsedFromData:v23 error:&v115];
          id v25 = v115;

          if (v25) {
            BOOL v26 = 1;
          }
          else {
            BOOL v26 = v24 == 0;
          }
          BOOL v27 = !v26;
          if (v26)
          {
            v82 = (void *)MEMORY[0x230FBD990]();
            v83 = v12;
            v84 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
            {
              v85 = HMFGetLogIdentifier();
              v86 = [(HMDDataStreamController *)v83 accessory];
              [v86 name];
              v87 = BOOL v100 = v27;
              [(HMDDataStreamController *)v83 accessory];
              v88 = v104 = v82;
              [v88 uuid];
              v98 = v24;
              v90 = v89 = v21;
              [v90 UUIDString];
              v91 = id v96 = v25;
              *(_DWORD *)buf = 138543874;
              v118 = v85;
              __int16 v119 = 2112;
              v120 = v87;
              __int16 v121 = 2112;
              v122 = v91;
              _os_log_impl(&dword_22F52A000, v84, OS_LOG_TYPE_INFO, "%{public}@Failed to parse HDS supported configuration (%@/%@)", buf, 0x20u);

              uint64_t v21 = v89;
              uint64_t v24 = v98;

              v82 = v104;
              BOOL v27 = v100;

              BOOL v4 = v108;
              id v25 = v96;

              BOOL v5 = v105;
            }
          }
          else
          {
            v94 = v9;
            id v95 = v25;
            BOOL v99 = v27;
            v93 = v21;
            long long v113 = 0u;
            long long v114 = 0u;
            long long v111 = 0u;
            long long v112 = 0u;
            v97 = v24;
            v28 = [v24 configurations];
            uint64_t v29 = [v28 countByEnumeratingWithState:&v111 objects:v116 count:16];
            if (v29)
            {
              uint64_t v30 = v29;
              uint64_t v31 = *(void *)v112;
              do
              {
                for (uint64_t i = 0; i != v30; ++i)
                {
                  if (*(void *)v112 != v31) {
                    objc_enumerationMutation(v28);
                  }
                  uint64_t v33 = *(void **)(*((void *)&v111 + 1) + 8 * i);
                  uint64_t v34 = [v33 transport];

                  if (v34)
                  {
                    v35 = [v33 transport];
                    uint64_t v36 = [v35 value];

                    if (v36 == 1)
                    {
                      if (![(HMDDataStreamController *)v12 supportsDataStreamOverHAP])
                      {
                        v37 = [v33 maximumControllerTransportMTU];

                        if (v37)
                        {
                          v38 = [v33 maximumControllerTransportMTU];
                          v39 = [v38 value];
                          uint64_t v40 = [v39 unsignedIntegerValue];

                          [(HMDDataStreamController *)v12 setSupportsDataStreamOverHAP:1];
                          [(HMDDataStreamController *)v12 setMaxControllerTransportMTU:v40];
                        }
                        else
                        {
                          v41 = (void *)MEMORY[0x230FBD990]();
                          v42 = v12;
                          v43 = HMFGetOSLogHandle();
                          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                          {
                            v44 = HMFGetLogIdentifier();
                            *(_DWORD *)buf = 138543362;
                            v118 = v44;
                            _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory with HDS service advertises HDS-over-HAP but provides no MTU; ignoring.",
                              buf,
                              0xCu);
                          }
                        }
                      }
                    }
                    else if (!v36)
                    {
                      [(HMDDataStreamController *)v12 setSupportsDataStreamOverTCP:1];
                    }
                  }
                }
                uint64_t v30 = [v28 countByEnumeratingWithState:&v111 objects:v116 count:16];
              }
              while (v30);
            }

            BOOL v5 = v105;
            BOOL v4 = v108;
            uint64_t v21 = v93;
            uint64_t v9 = v94;
            BOOL v27 = v99;
            id v25 = v95;
            uint64_t v24 = v97;
          }
        }
        else
        {
          v73 = (void *)MEMORY[0x230FBD990]();
          v74 = v12;
          v75 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
          {
            v76 = HMFGetLogIdentifier();
            v77 = [(HMDDataStreamController *)v74 accessory];
            [v77 name];
            v78 = v103 = v73;
            v79 = [(HMDDataStreamController *)v74 accessory];
            v80 = [v79 uuid];
            v81 = [v80 UUIDString];
            *(_DWORD *)buf = 138543874;
            v118 = v76;
            __int16 v119 = 2112;
            v120 = v78;
            __int16 v121 = 2112;
            v122 = v81;
            _os_log_impl(&dword_22F52A000, v75, OS_LOG_TYPE_INFO, "%{public}@No HDS supported configuration (%@/%@)", buf, 0x20u);

            uint64_t v21 = 0;
            v73 = v103;

            BOOL v5 = v105;
            BOOL v4 = v108;
          }
          BOOL v27 = 0;
        }

        goto LABEL_50;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v67 = HMFGetLogIdentifier();
        v68 = [(HMDDataStreamController *)v12 accessory];
        [v68 name];
        v69 = v107 = v5;
        v70 = [(HMDDataStreamController *)v12 accessory];
        v71 = [v70 uuid];
        [v71 UUIDString];
        v72 = v110 = v4;
        *(_DWORD *)buf = 138544130;
        v118 = v67;
        __int16 v119 = 2112;
        v120 = v9;
        __int16 v121 = 2112;
        v122 = v69;
        __int16 v123 = 2112;
        v124 = v72;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@HDS version '%@' is not supported (%@/%@)", buf, 0x2Au);

        BOOL v5 = v107;
        BOOL v4 = v110;
      }
      v66 = v11;
    }
    else
    {
      uint64_t v56 = MEMORY[0x230FBD990]();
      v57 = self;
      v58 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        v59 = HMFGetLogIdentifier();
        v60 = [v5 value];
        [(HMDDataStreamController *)v57 accessory];
        v61 = v106 = v5;
        [v61 name];
        v62 = v109 = v4;
        [(HMDDataStreamController *)v57 accessory];
        v63 = uint64_t v102 = v56;
        v64 = [v63 uuid];
        v65 = [v64 UUIDString];
        *(_DWORD *)buf = 138544130;
        v118 = v59;
        __int16 v119 = 2112;
        v120 = v60;
        __int16 v121 = 2112;
        v122 = v62;
        __int16 v123 = 2112;
        v124 = v65;
        _os_log_impl(&dword_22F52A000, v58, OS_LOG_TYPE_INFO, "%{public}@HDS version '%@' was not parsable (%@/%@)", buf, 0x2Au);

        uint64_t v56 = v102;
        BOOL v4 = v109;

        BOOL v5 = v106;
      }

      v66 = (void *)v56;
    }
    BOOL v27 = 0;
LABEL_50:

    goto LABEL_51;
  }
  v45 = (void *)MEMORY[0x230FBD990]();
  v46 = self;
  v47 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    v48 = HMFGetLogIdentifier();
    v49 = [(HMDDataStreamController *)v46 accessory];
    v50 = [v49 name];
    [(HMDDataStreamController *)v46 accessory];
    v52 = v51 = v5;
    [v52 uuid];
    v54 = v53 = v4;
    [v54 UUIDString];
    v55 = v101 = v45;
    *(_DWORD *)buf = 138543874;
    v118 = v48;
    __int16 v119 = 2112;
    v120 = v50;
    __int16 v121 = 2112;
    v122 = v55;
    _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_INFO, "%{public}@No HDS version found (%@/%@)", buf, 0x20u);

    BOOL v4 = v53;
    BOOL v5 = v51;

    v45 = v101;
  }

  BOOL v27 = 0;
LABEL_51:

  return v27;
}

- (void)handleAccessoryConnected
{
  id v3 = [(HMDDataStreamController *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__HMDDataStreamController_handleAccessoryConnected__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __51__HMDDataStreamController_handleAccessoryConnected__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__HMDDataStreamController_handleAccessoryConnected__block_invoke_2;
  v3[3] = &unk_264A2F3E8;
  v3[4] = v1;
  return [v1 _readRequiredTransportCharacteristicsIfNeededWithCompletion:v3];
}

void __51__HMDDataStreamController_handleAccessoryConnected__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v4);

  if (v3)
  {
    BOOL v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      uint64_t v9 = [*(id *)(a1 + 32) accessory];
      uint64_t v10 = [v9 identifier];
      int v11 = 138543874;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to read the required transport characteristics for: %@ with error: %@", (uint8_t *)&v11, 0x20u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _handleAccessoryConnected];
  }
}

- (void)_resetTransportInfo
{
  [(HMDDataStreamController *)self setSupportsDataStreamOverTCP:0];
  [(HMDDataStreamController *)self setSupportsDataStreamOverHAP:0];
  [(HMDDataStreamController *)self setMaxControllerTransportMTU:0];
}

- (void)deRegisterFromNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];
}

- (void)registerForNotifications
{
  id v5 = [(HMDDataStreamController *)self accessory];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_handleAccessoryConfigured_ name:@"HMDAccessoryConnectedNotification" object:v5];

  BOOL v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_handleAccessoryUnconfigured_ name:@"HMDAccessoryDisconnectedNotification" object:v5];

  if ([v5 isReachable]) {
    [(HMDDataStreamController *)self handleAccessoryConnected];
  }
}

- (HMDDataStreamController)initWithAccessory:(id)a3 service:(id)a4 workQueue:(id)a5 dataStreamFactory:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HMDDataStreamController;
  uint64_t v14 = [(HMDDataStreamController *)&v24 init];
  __int16 v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_accessory, v10);
    objc_storeWeak((id *)&v15->_transferManagementService, v11);
    objc_storeStrong((id *)&v15->_workQueue, a5);
    uint64_t v16 = [MEMORY[0x263EFF980] array];
    pendingSocketRequests = v15->_pendingSocketRequests;
    v15->_pendingSocketRequests = (NSMutableArray *)v16;

    long long v18 = _Block_copy(v13);
    id dataStreamFactory = v15->_dataStreamFactory;
    v15->_id dataStreamFactory = v18;

    __int16 v20 = [v10 uuid];
    uint64_t v21 = [v20 UUIDString];
    logIdentifier = v15->_logIdentifier;
    v15->_logIdentifier = (NSString *)v21;
  }
  return v15;
}

- (HMDDataStreamController)initWithAccessory:(id)a3 service:(id)a4 workQueue:(id)a5
{
  return [(HMDDataStreamController *)self initWithAccessory:a3 service:a4 workQueue:a5 dataStreamFactory:&__block_literal_global_73542];
}

HMDDataStream *__63__HMDDataStreamController_initWithAccessory_service_workQueue___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = a2;
  id v12 = [[HMDDataStream alloc] initWithTransport:v11 sessionEncryption:v10 workQueue:v9 logIdentifier:v8];

  return v12;
}

@end