@interface HMDCameraLocalStreamControlManager
+ (id)logCategory;
- (BOOL)_isSetupEndPointConfigurationValid;
- (BOOL)isSendingStream;
- (HMDCameraLocalStreamAccessoryCommunicator)accessoryCommunicator;
- (HMDCameraLocalStreamControlManager)initWithSessionID:(id)a3 workQueue:(id)a4 streamSnapshotHandler:(id)a5 delegate:(id)a6 accessory:(id)a7 streamManagementService:(id)a8 supportedConfigCache:(id)a9 streamSession:(id)a10 accessoryCommunicator:(id)a11;
- (HMDCameraLocalStreamControlManager)initWithSessionID:(id)a3 workQueue:(id)a4 streamSnapshotHandler:(id)a5 reachabilityPath:(unint64_t)a6 device:(id)a7 delegate:(id)a8 accessory:(id)a9 streamManagementService:(id)a10 localNetworkConfig:(id)a11 remoteCapabilities:(id)a12 supportedConfigCache:(id)a13 streamPreference:(id)a14;
- (HMDCameraLocalStreamSession)streamSession;
- (HMDCameraMediaConfigGenerator)configGenerator;
- (HMDCameraSupportedConfigurationCache)supportedConfigCache;
- (NSDictionary)stateDump;
- (NSNumber)aspectRatio;
- (NSNumber)slotIdentifier;
- (id)_calculateMTU;
- (unint64_t)audioStreamSetting;
- (void)_cleanUpStreamSessionWithError:(id)a3;
- (void)_deregisterForHAPSessionRestore;
- (void)_getSupportedConfigurations;
- (void)_reconfigureStreams;
- (void)_registerForHAPSessionRestore;
- (void)_sendSetupEndPointReadRequest;
- (void)_sendSetupEndPointWriteRequest;
- (void)_sendUpdatedConfiguration;
- (void)_startStreamManager;
- (void)_streamStarted;
- (void)_writeReselectConfig;
- (void)_writeStartConfig;
- (void)_writeStopConfig;
- (void)deviceConnectionSender:(id)a3 didEndSessionWithError:(id)a4;
- (void)deviceConnectionSender:(id)a3 didSetUpWithError:(id)a4;
- (void)negotiateStream;
- (void)reconfigureStream:(id)a3;
- (void)sessionInitiator:(id)a3 didEndSessionWithError:(id)a4;
- (void)sessionInitiator:(id)a3 didSetUpWithError:(id)a4;
- (void)setStreamSession:(id)a3;
- (void)setUpRemoteConnectionWithDevice:(id)a3;
- (void)startStreamWithRemoteSettings:(id)a3;
- (void)stopStreamWithError:(id)a3;
- (void)streamManagerDidNetworkDeteriorate:(id)a3;
- (void)streamManagerDidNetworkImprove:(id)a3;
- (void)streamManagerDidReceiveFirstFrame:(id)a3;
- (void)streamManagerDidStartRelay:(id)a3;
- (void)streamManagerDidStartStream:(id)a3;
- (void)streamManagerDidStopStream:(id)a3 error:(id)a4;
- (void)streamManagerDidUpdateConfiguration:(id)a3;
- (void)updateAudioSetting:(unint64_t)a3;
- (void)updateAudioVolume:(id)a3 callback:(id)a4;
- (void)updateMaximumVideoResolutionQuality:(int64_t)a3 completionHandler:(id)a4;
@end

@implementation HMDCameraLocalStreamControlManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configGenerator, 0);
  objc_storeStrong((id *)&self->_supportedConfigCache, 0);
  objc_storeStrong((id *)&self->_accessoryCommunicator, 0);
  objc_storeStrong((id *)&self->_streamSession, 0);
}

- (HMDCameraMediaConfigGenerator)configGenerator
{
  return (HMDCameraMediaConfigGenerator *)objc_getProperty(self, a2, 88, 1);
}

- (HMDCameraSupportedConfigurationCache)supportedConfigCache
{
  return (HMDCameraSupportedConfigurationCache *)objc_getProperty(self, a2, 80, 1);
}

- (HMDCameraLocalStreamAccessoryCommunicator)accessoryCommunicator
{
  return (HMDCameraLocalStreamAccessoryCommunicator *)objc_getProperty(self, a2, 72, 1);
}

- (void)setStreamSession:(id)a3
{
}

- (HMDCameraLocalStreamSession)streamSession
{
  return (HMDCameraLocalStreamSession *)objc_getProperty(self, a2, 64, 1);
}

- (void)_sendUpdatedConfiguration
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if ([(HMDCameraLocalStreamControlManager *)self isSendingStream])
  {
    [(HMDCameraStreamControlManager *)self _callStreamReconfigured];
  }
  else
  {
    v4 = (void *)MEMORY[0x230FBD990]();
    v5 = self;
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v22 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Sending updated configuration", buf, 0xCu);
    }
    v8 = [(HMDCameraLocalStreamControlManager *)v5 configGenerator];
    v9 = [(HMDCameraLocalStreamControlManager *)v5 streamSession];
    v10 = [v9 videoTierParameters];
    v11 = [v10 currentPickedTier];
    id v20 = 0;
    char v12 = [v8 extractReselectedConfigFromVideoTier:v11 videoStreamConfig:&v20];
    id v13 = v20;

    if (v12)
    {
      v14 = [(HMDCameraLocalStreamControlManager *)v5 streamSession];
      v15 = [v14 streamManager];
      [v15 updateStreamConfiguration:v13];
    }
    else
    {
      v16 = (void *)MEMORY[0x230FBD990]();
      v17 = v5;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v22 = v19;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Reselected config failed to extract", buf, 0xCu);
      }
      [(HMDCameraStreamControlManager *)v17 _reportInternalErrorCode:1046];
    }
  }
}

- (void)_reconfigureStreams
{
  v3 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(HMDCameraLocalStreamControlManager *)self streamSession];
  v5 = [v4 parameterSelection];
  v6 = [(HMDCameraLocalStreamControlManager *)self streamSession];
  v7 = [v6 protocolParameters];
  v8 = [(HMDCameraLocalStreamControlManager *)self streamSession];
  v9 = [v8 videoTierParameters];
  v10 = [v9 currentPickedTier];
  [v5 setReselectedConfigParameters:v7 videoTier:v10];

  [(HMDCameraLocalStreamControlManager *)self _writeReselectConfig];
}

- (void)streamManagerDidUpdateConfiguration:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x230FBD990]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v12 = 138543362;
    id v13 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Stream configuration update complete", (uint8_t *)&v12, 0xCu);
  }
  v10 = [(HMDCameraLocalStreamControlManager *)v7 streamSession];
  v11 = [v10 streamManager];
  [v11 updateReconfigurationMode:0];
}

- (void)streamManagerDidNetworkDeteriorate:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDCameraLocalStreamControlManager *)self streamSession];
  v7 = [v6 videoTierParameters];
  int v8 = [v7 pickLowerTier];

  v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v12)
    {
      id v13 = HMFGetLogIdentifier();
      int v17 = 138543362;
      v18 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Picked a lower tier", (uint8_t *)&v17, 0xCu);
    }
    [(HMDCameraLocalStreamControlManager *)v10 _reconfigureStreams];
  }
  else
  {
    if (v12)
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v17 = 138543362;
      v18 = v14;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Already in lowest tier, not changing the tier", (uint8_t *)&v17, 0xCu);
    }
    v15 = [(HMDCameraLocalStreamControlManager *)v10 streamSession];
    v16 = [v15 streamManager];
    [v16 updateReconfigurationMode:0];
  }
}

- (void)streamManagerDidNetworkImprove:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDCameraLocalStreamControlManager *)self streamSession];
  v7 = [v6 videoTierParameters];
  int v8 = [v7 pickHigherTier];

  v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v12)
    {
      id v13 = HMFGetLogIdentifier();
      int v17 = 138543362;
      v18 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Picked a higher tier", (uint8_t *)&v17, 0xCu);
    }
    [(HMDCameraLocalStreamControlManager *)v10 _reconfigureStreams];
  }
  else
  {
    if (v12)
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v17 = 138543362;
      v18 = v14;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Already in highest tier, not changing the tier", (uint8_t *)&v17, 0xCu);
    }
    v15 = [(HMDCameraLocalStreamControlManager *)v10 streamSession];
    v16 = [v15 streamManager];
    [v16 updateReconfigurationMode:0];
  }
}

- (void)streamManagerDidStopStream:(id)a3 error:(id)a4
{
  id v8 = a4;
  v5 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDCameraLocalStreamControlManager *)self streamSession];
  int v7 = [v6 containsState:4];

  if (v7) {
    [(HMDCameraStreamControlManager *)self _callStreamStoppedWithError:v8];
  }
  else {
    [(HMDCameraLocalStreamControlManager *)self _cleanUpStreamSessionWithError:v8];
  }
}

- (void)streamManagerDidStartRelay:(id)a3
{
  id v4 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v4);

  [(HMDCameraLocalStreamControlManager *)self _streamStarted];
}

- (void)streamManagerDidReceiveFirstFrame:(id)a3
{
  id v4 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v4);

  [(HMDCameraStreamControlManager *)self _callStreamFirstFrameReceived];
}

- (void)streamManagerDidStartStream:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x230FBD990]();
  int v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Stream manager did start stream", (uint8_t *)&v10, 0xCu);
  }
  [(HMDCameraLocalStreamControlManager *)v7 _streamStarted];
}

- (void)deviceConnectionSender:(id)a3 didEndSessionWithError:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x230FBD990]();
  int v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    int v13 = 138543362;
    uint64_t v14 = v12;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Session stopped, stopping the stream", (uint8_t *)&v13, 0xCu);
  }
  [(HMDCameraLocalStreamControlManager *)v10 _cleanUpStreamSessionWithError:v7];
}

- (void)deviceConnectionSender:(id)a3 didSetUpWithError:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  if (v7)
  {
    v9 = (void *)MEMORY[0x230FBD990]();
    int v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v18 = 138543362;
      uint64_t v19 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to set up IDSDeviceConnection for stream", (uint8_t *)&v18, 0xCu);
    }
    [(HMDCameraLocalStreamControlManager *)v10 _cleanUpStreamSessionWithError:v7];
  }
  else
  {
    [(HMDCameraStreamControlManager *)self _callStreamRemoteConnectionSetup];
    int v13 = [(HMDCameraLocalStreamControlManager *)self streamSession];
    [v13 updateState:2];

    uint64_t v14 = (void *)MEMORY[0x230FBD990]();
    uint64_t v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v17 = HMFGetLogIdentifier();
      int v18 = 138543362;
      uint64_t v19 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Device connection sender is set up", (uint8_t *)&v18, 0xCu);
    }
    [(HMDCameraLocalStreamControlManager *)v15 _startStreamManager];
  }
}

- (void)sessionInitiator:(id)a3 didEndSessionWithError:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x230FBD990]();
  int v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    int v13 = 138543362;
    uint64_t v14 = v12;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Session stopped, stopping the stream", (uint8_t *)&v13, 0xCu);
  }
  [(HMDCameraLocalStreamControlManager *)v10 _cleanUpStreamSessionWithError:v7];
}

- (void)sessionInitiator:(id)a3 didSetUpWithError:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  if (v7)
  {
    v9 = (void *)MEMORY[0x230FBD990]();
    int v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v18 = 138543362;
      uint64_t v19 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to set up IDSSession for stream", (uint8_t *)&v18, 0xCu);
    }
    [(HMDCameraLocalStreamControlManager *)v10 _cleanUpStreamSessionWithError:v7];
  }
  else
  {
    int v13 = [(HMDCameraLocalStreamControlManager *)self streamSession];
    [v13 updateState:2];

    uint64_t v14 = (void *)MEMORY[0x230FBD990]();
    uint64_t v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v17 = HMFGetLogIdentifier();
      int v18 = 138543362;
      uint64_t v19 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Session initiator is setup", (uint8_t *)&v18, 0xCu);
    }
    [(HMDCameraLocalStreamControlManager *)v15 _startStreamManager];
  }
}

- (void)_streamStarted
{
  v3 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraLocalStreamControlManager *)self streamSession];
  v5 = [v4 streamSender];
  [v5 startKeepAlive];

  [(HMDCameraLocalStreamControlManager *)self _writeStartConfig];
}

- (void)_cleanUpStreamSessionWithError:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraLocalStreamControlManager *)self streamSession];

  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v10)
    {
      v11 = HMFGetLogIdentifier();
      int v16 = 138543362;
      int v17 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Cleaning up the stream", (uint8_t *)&v16, 0xCu);
    }
    uint64_t v12 = [(HMDCameraLocalStreamControlManager *)v8 streamSession];
    [v12 updateState:8];

    [(HMDCameraLocalStreamControlManager *)v8 _deregisterForHAPSessionRestore];
    int v13 = [(HMDCameraLocalStreamControlManager *)v8 streamSession];
    uint64_t v14 = [v13 streamManager];
    [v14 stopStream];

    [(HMDCameraLocalStreamControlManager *)v8 _writeStopConfig];
    [(HMDCameraLocalStreamControlManager *)v8 setStreamSession:0];
    [(HMDCameraStreamControlManager *)v8 _callStreamStoppedWithError:v4];
  }
  else
  {
    if (v10)
    {
      uint64_t v15 = HMFGetLogIdentifier();
      int v16 = 138543362;
      int v17 = v15;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@No current stream session to clean up", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)_writeStopConfig
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v3 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraLocalStreamControlManager *)self streamSession];

  if (!v4)
  {
    uint64_t v19 = (void *)MEMORY[0x230FBD990]();
    uint64_t v20 = self;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v26 = v22;
      uint64_t v23 = "%{public}@No current stream session to write stop config for";
LABEL_10:
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, v23, buf, 0xCu);
    }
LABEL_11:

    return;
  }
  v5 = [(HMDCameraLocalStreamControlManager *)self streamSession];
  char v6 = [v5 containsState:1];

  if ((v6 & 1) == 0)
  {
    uint64_t v19 = (void *)MEMORY[0x230FBD990]();
    uint64_t v20 = self;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v26 = v22;
      uint64_t v23 = "%{public}@Not writing stop stream configuration because stream never started";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  id v7 = [HMDSessionControl alloc];
  id v8 = objc_alloc(MEMORY[0x263F08C38]);
  v9 = [(HMDCameraStreamControlManager *)self sessionID];
  BOOL v10 = [v9 sessionID];
  v11 = (void *)[v8 initWithUUIDString:v10];
  uint64_t v12 = [(HMDSessionControl *)v7 initWithCommand:0 sessionIdentifier:v11];

  int v13 = [[HMDSelectedStreamConfigurationWrite alloc] initWithSessionControl:v12];
  uint64_t v14 = (void *)MEMORY[0x230FBD990]();
  uint64_t v15 = self;
  int v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v26 = v17;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Writing stop stream configuration", buf, 0xCu);
  }
  uint64_t v18 = [(HMDCameraLocalStreamControlManager *)v15 accessoryCommunicator];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __54__HMDCameraLocalStreamControlManager__writeStopConfig__block_invoke;
  v24[3] = &unk_264A2F3E8;
  v24[4] = v15;
  [v18 writeSelectedStreamConfiguration:v13 completion:v24];
}

void __54__HMDCameraLocalStreamControlManager__writeStopConfig__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  char v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v13 = 138543618;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      id v16 = v3;
      v9 = "%{public}@Failed to write stop stream configuration: %@";
      BOOL v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v13 = 138543362;
    uint64_t v14 = v8;
    v9 = "%{public}@Successfully wrote stop stream configuration";
    BOOL v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
    uint32_t v12 = 12;
    goto LABEL_6;
  }
}

- (void)_writeReselectConfig
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraLocalStreamControlManager *)self streamSession];
  id v5 = [v4 protocolParameters];
  char v6 = [v5 reselectedStreamConfigurationWrite];

  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    BOOL v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Writing reselect stream configuration", buf, 0xCu);
  }
  os_log_type_t v11 = [(HMDCameraLocalStreamControlManager *)v8 accessoryCommunicator];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__HMDCameraLocalStreamControlManager__writeReselectConfig__block_invoke;
  v12[3] = &unk_264A2F3E8;
  v12[4] = v8;
  [v11 writeReselectedStreamConfiguration:v6 completion:v12];
}

uint64_t __58__HMDCameraLocalStreamControlManager__writeReselectConfig__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendUpdatedConfiguration];
}

- (void)_writeStartConfig
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraLocalStreamControlManager *)self streamSession];
  id v5 = [v4 protocolParameters];
  char v6 = [v5 selectedStreamConfigurationWrite];

  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    BOOL v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Writing start stream configuration", buf, 0xCu);
  }
  os_log_type_t v11 = [(HMDCameraLocalStreamControlManager *)v8 accessoryCommunicator];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__HMDCameraLocalStreamControlManager__writeStartConfig__block_invoke;
  v12[3] = &unk_264A2F3E8;
  v12[4] = v8;
  [v11 writeSelectedStreamConfiguration:v6 completion:v12];
}

uint64_t __55__HMDCameraLocalStreamControlManager__writeStartConfig__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callStreamStarted];
}

- (void)stopStreamWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    BOOL v10 = [(HMDCameraStreamControlManager *)v7 sessionID];
    int v11 = 138543618;
    uint32_t v12 = v9;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Received request to stop the stream with session ID %@", (uint8_t *)&v11, 0x16u);
  }
  [(HMDCameraLocalStreamControlManager *)v7 _cleanUpStreamSessionWithError:v4];
}

- (void)updateMaximumVideoResolutionQuality:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  char v6 = (void (**)(id, void))a4;
  id v7 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  BOOL v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    int v22 = 138543618;
    uint64_t v23 = v11;
    __int16 v24 = 2048;
    int64_t v25 = a3;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Received request to update maximum video resolution quality: %lu", (uint8_t *)&v22, 0x16u);
  }
  uint32_t v12 = [(HMDCameraLocalStreamControlManager *)v9 streamSession];

  if (v12)
  {
    __int16 v13 = [(HMDCameraLocalStreamControlManager *)v9 streamSession];
    uint64_t v14 = [v13 videoTierParameters];
    [v14 setMaximumQuality:a3];

    uint64_t v15 = [(HMDCameraLocalStreamControlManager *)v9 streamSession];
    id v16 = [v15 videoTierParameters];
    LODWORD(v14) = [v16 pickBestTier];

    if (v14) {
      [(HMDCameraLocalStreamControlManager *)v9 _reconfigureStreams];
    }
    v6[2](v6, 0);
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x230FBD990]();
    uint64_t v18 = v9;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      int v22 = 138543362;
      uint64_t v23 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@No current stream session to reconfigure", (uint8_t *)&v22, 0xCu);
    }
    v21 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    ((void (**)(id, void *))v6)[2](v6, v21);
  }
}

- (void)reconfigureStream:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    BOOL v10 = [(HMDCameraStreamControlManager *)v7 sessionID];
    *(_DWORD *)buf = 138543618;
    v37 = v9;
    __int16 v38 = 2112;
    id v39 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Received request to reconfigure the stream with session ID %@", buf, 0x16u);
  }
  int v11 = [(HMDCameraLocalStreamControlManager *)v7 streamSession];

  if (v11)
  {
    uint32_t v12 = objc_msgSend(v4, "hmf_dataForKey:", @"kReconfiguredTier");
    if (v12)
    {
      id v35 = 0;
      __int16 v13 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v12 error:&v35];
      id v14 = v35;
      uint64_t v15 = (void *)MEMORY[0x230FBD990]();
      id v16 = v7;
      uint64_t v17 = HMFGetOSLogHandle();
      uint64_t v18 = v17;
      if (v13)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          uint64_t v19 = HMFGetLogIdentifier();
          [(HMDCameraLocalStreamControlManager *)v16 streamSession];
          uint64_t v20 = v34 = v14;
          v21 = [v20 videoTierParameters];
          int v22 = [v21 currentPickedTier];
          *(_DWORD *)buf = 138543874;
          v37 = v19;
          __int16 v38 = 2112;
          id v39 = v22;
          __int16 v40 = 2112;
          v41 = v13;
          _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Updating the current picked tier from %@ to %@", buf, 0x20u);

          id v14 = v34;
        }

        uint64_t v23 = [(HMDCameraLocalStreamControlManager *)v16 streamSession];
        __int16 v24 = [v23 videoTierParameters];
        [v24 setCurrentPickedTier:v13];

        [(HMDCameraLocalStreamControlManager *)v16 _reconfigureStreams];
      }
      else
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v33 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v37 = v33;
          __int16 v38 = 2112;
          id v39 = v14;
          _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive camera video tier from video tier data: %@", buf, 0x16u);
        }
        [(HMDCameraStreamControlManager *)v16 _reportInternalErrorCode:1047];
      }
    }
    else
    {
      v29 = (void *)MEMORY[0x230FBD990]();
      v30 = v7;
      v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v37 = v32;
        _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Missing reconfigured tier data", buf, 0xCu);
      }
      [(HMDCameraStreamControlManager *)v30 _reportInternalErrorCode:1047];
    }
  }
  else
  {
    int64_t v25 = (void *)MEMORY[0x230FBD990]();
    uint64_t v26 = v7;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v37 = v28;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@No current stream session to reconfigure", buf, 0xCu);
    }
    [(HMDCameraStreamControlManager *)v26 _reportErrorCode:3];
  }
}

- (void)_deregisterForHAPSessionRestore
{
  id v3 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v5 = [(HMDCameraStreamControlManager *)self accessory];
  id v4 = HAPStringFromAccessoryServerSession();
  [v5 deregisterFromSessionRestore:v4];
}

- (void)_registerForHAPSessionRestore
{
  id v3 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v5 = [(HMDCameraStreamControlManager *)self accessory];
  id v4 = HAPStringFromAccessoryServerSession();
  [v5 registerForSessionRestore:v4];
}

- (void)_startStreamManager
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if ([(HMDCameraLocalStreamControlManager *)self isSendingStream])
  {
    id v4 = [(HMDCameraLocalStreamControlManager *)self streamSession];
    char v5 = [v4 containsState:2];

    if ((v5 & 1) == 0)
    {
      v28 = (void *)MEMORY[0x230FBD990]();
      v29 = self;
      v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
LABEL_9:
        v31 = HMFGetLogIdentifier();
        v32 = [(HMDCameraLocalStreamControlManager *)v29 streamSession];
        v33 = [v32 stateDescription];
        *(_DWORD *)buf = 138543618;
        v41 = v31;
        __int16 v42 = 2112;
        v43 = v33;
        _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@Current state: %@, waiting", buf, 0x16u);
      }
LABEL_10:

      return;
    }
  }
  char v6 = [(HMDCameraLocalStreamControlManager *)self streamSession];
  char v7 = [v6 containsState:4];

  if ((v7 & 1) == 0)
  {
    v28 = (void *)MEMORY[0x230FBD990]();
    v29 = self;
    v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  id v8 = [(HMDCameraLocalStreamControlManager *)self configGenerator];
  v9 = [(HMDCameraLocalStreamControlManager *)self streamSession];
  BOOL v10 = [v9 protocolParameters];
  id v38 = 0;
  id v39 = 0;
  char v11 = [v8 extractSelectedConfigFromProtocolParameters:v10 videoStreamConfig:&v39 audioStreamConfig:&v38];
  id v12 = v39;
  id v13 = v38;

  if (v11)
  {
    id v14 = [(HMDCameraLocalStreamControlManager *)self streamSession];
    uint64_t v15 = [v14 protocolParameters];
    id v16 = [v15 selectedStreamConfigurationWrite];
    uint64_t v17 = [v16 videoParameters];
    uint64_t v18 = [v17 rtpParameters];
    uint64_t v19 = [v18 synchronizationSource];
    objc_msgSend(v12, "setDeviceLocalSSRC:", objc_msgSend(v19, "unsignedIntegerValue"));

    uint64_t v20 = [(HMDCameraLocalStreamControlManager *)self streamSession];
    v21 = [v20 protocolParameters];
    int v22 = [v21 selectedStreamConfigurationWrite];
    uint64_t v23 = [v22 audioParameters];
    __int16 v24 = [v23 rtpParameters];
    int64_t v25 = [v24 synchronizationSource];
    objc_msgSend(v13, "setDeviceLocalSSRC:", objc_msgSend(v25, "unsignedIntegerValue"));

    uint64_t v26 = [(HMDCameraLocalStreamControlManager *)self streamSession];
    uint64_t v27 = [v26 streamManager];
    [v27 startStreamWithVideoConfig:v12 audioConfig:v13];
  }
  else
  {
    id v34 = (void *)MEMORY[0x230FBD990]();
    id v35 = self;
    v36 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v37 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v41 = v37;
      _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_ERROR, "%{public}@Could not extract a configuration from the given parameters", buf, 0xCu);
    }
    [(HMDCameraStreamControlManager *)v35 _reportInternalErrorCode:1046];
  }
}

- (id)_calculateMTU
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraLocalStreamControlManager *)self streamSession];
  char v5 = [v4 streamSender];

  if (v5)
  {
    char v6 = (void *)MEMORY[0x230FBD990]();
    char v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      BOOL v10 = [(HMDCameraLocalStreamControlManager *)v7 streamSession];
      char v11 = [v10 streamSender];
      id v12 = [v11 mtu];
      int v23 = 138543618;
      __int16 v24 = v9;
      __int16 v25 = 2112;
      uint64_t v26 = v12;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Reporting stream sender reported MTU %@", (uint8_t *)&v23, 0x16u);
    }
    id v13 = [(HMDCameraLocalStreamControlManager *)v7 streamSession];
    id v14 = [v13 streamSender];
    uint64_t v15 = [v14 mtu];
  }
  else
  {
    id v16 = [(HMDCameraLocalStreamControlManager *)self streamSession];
    uint64_t v17 = [v16 protocolParameters];
    uint64_t v18 = [v17 setupEndPointWrite];
    uint64_t v19 = [v18 address];
    int v20 = [v19 isIPv6Address];

    if (v20) {
      uint64_t v21 = 1228;
    }
    else {
      uint64_t v21 = 1378;
    }
    uint64_t v15 = [NSNumber numberWithUnsignedInteger:v21];
  }
  return v15;
}

- (void)startStreamWithRemoteSettings:(id)a3
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = (void *)MEMORY[0x230FBD990]();
  char v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v65 = v9;
    __int16 v66 = 2112;
    id v67 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Received request to start stream with remote settings: %@", buf, 0x16u);
  }
  if ([(HMDCameraLocalStreamControlManager *)v7 isSendingStream])
  {
    BOOL v10 = (void *)MEMORY[0x230FBD990]();
    char v11 = v7;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v65 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Using the sync sources from remote settings", buf, 0xCu);
    }
    id v14 = [v4 objectForKeyedSubscript:@"kVideoStreamSSRC"];
    uint64_t v15 = [v4 objectForKeyedSubscript:@"kAudioStreamSSRC"];
    if (!v14) {
      goto LABEL_14;
    }
  }
  else
  {
    id v16 = [(HMDCameraLocalStreamControlManager *)v7 streamSession];
    uint64_t v17 = [v16 streamManager];
    uint64_t v18 = [v17 videoStreamInterface];
    id v14 = [v18 syncSource];

    uint64_t v19 = [(HMDCameraLocalStreamControlManager *)v7 streamSession];
    int v20 = [v19 streamManager];
    uint64_t v21 = [v20 audioStreamInterface];
    uint64_t v15 = [v21 syncSource];

    if (!v14)
    {
LABEL_14:
      uint64_t v44 = (void *)MEMORY[0x230FBD990]([(HMDCameraStreamControlManager *)v7 _reportInternalErrorCode:1045]);
      v45 = v7;
      v46 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        v47 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v65 = v47;
        _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_INFO, "%{public}@SSRC is nil, cannot select config parameters", buf, 0xCu);
      }
      goto LABEL_27;
    }
  }
  if (!v15) {
    goto LABEL_14;
  }
  int v22 = [(HMDCameraLocalStreamControlManager *)v7 streamSession];
  [v22 updateState:4];

  [(HMDCameraLocalStreamControlManager *)v7 _registerForHAPSessionRestore];
  int v23 = [(HMDCameraLocalStreamControlManager *)v7 streamSession];
  __int16 v24 = [v23 protocolParameters];
  __int16 v25 = [v24 selectedStreamConfigurationWrite];
  uint64_t v26 = [v25 videoParameters];
  uint64_t v27 = [v26 rtpParameters];
  [v27 setSynchronizationSource:v14];

  v28 = [(HMDCameraLocalStreamControlManager *)v7 streamSession];
  v29 = [v28 protocolParameters];
  v30 = [v29 selectedStreamConfigurationWrite];
  v31 = [v30 audioParameters];
  v32 = [v31 rtpParameters];
  [v32 setSynchronizationSource:v15];

  v33 = [v4 objectForKeyedSubscript:@"kRemoteStreamMTU"];
  id v34 = [(HMDCameraLocalStreamControlManager *)v7 _calculateMTU];
  id v35 = v34;
  v62 = v14;
  id v63 = v4;
  if (v33)
  {
    unint64_t v36 = [v34 unsignedIntegerValue];
    unint64_t v37 = [v33 unsignedIntegerValue];
    id v38 = (void *)MEMORY[0x230FBD990]();
    id v39 = v7;
    __int16 v40 = HMFGetOSLogHandle();
    BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_INFO);
    if (v36 >= v37)
    {
      if (v41)
      {
        v49 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v65 = v49;
        _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_INFO, "%{public}@Remote MTU is provided, and is lower than local MTU", buf, 0xCu);
      }
      v48 = v33;
      goto LABEL_24;
    }
    if (v41)
    {
      __int16 v42 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v65 = v42;
      v43 = "%{public}@Remote MTU is provided, but is higher than local MTU";
LABEL_19:
      _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_INFO, v43, buf, 0xCu);
    }
  }
  else
  {
    id v38 = (void *)MEMORY[0x230FBD990]();
    id v39 = v7;
    __int16 v40 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      __int16 v42 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v65 = v42;
      v43 = "%{public}@Remote MTU isnt provided, picking local MTU";
      goto LABEL_19;
    }
  }
  v48 = v35;
LABEL_24:
  v50 = v15;

  id v51 = v48;
  v52 = (void *)MEMORY[0x230FBD990]();
  v53 = v7;
  v54 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
  {
    v55 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v65 = v55;
    __int16 v66 = 2112;
    id v67 = v33;
    __int16 v68 = 2112;
    v69 = v35;
    __int16 v70 = 2112;
    id v71 = v51;
    _os_log_impl(&dword_22F52A000, v54, OS_LOG_TYPE_INFO, "%{public}@Remote MTU %@, Local MTU %@, Picked MTU %@", buf, 0x2Au);
  }
  v56 = [(HMDCameraLocalStreamControlManager *)v53 streamSession];
  v57 = [v56 protocolParameters];
  v58 = [v57 selectedStreamConfigurationWrite];
  v59 = [v58 videoParameters];
  [v59 rtpParameters];
  v61 = v60 = v35;
  [v61 setMaxMTU:v51];

  [(HMDCameraLocalStreamControlManager *)v53 _startStreamManager];
  uint64_t v15 = v50;
  id v14 = v62;
  id v4 = v63;
LABEL_27:
}

- (BOOL)_isSetupEndPointConfigurationValid
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraLocalStreamControlManager *)self streamSession];
  char v5 = [v4 protocolParameters];
  char v6 = [v5 setupEndPointRead];

  char v7 = [(HMDCameraLocalStreamControlManager *)self streamSession];
  id v8 = [v7 protocolParameters];
  v9 = [v8 setupEndPointWrite];

  BOOL v10 = [v9 address];
  char v11 = [v6 address];
  char v12 = [v10 isCompatibleWithRemoteEndPointAddress:v11];

  if ((v12 & 1) == 0)
  {
    int v20 = (void *)MEMORY[0x230FBD990]();
    uint64_t v21 = self;
    int v22 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v23 = HMFGetLogIdentifier();
    int v28 = 138543362;
    v29 = v23;
    __int16 v24 = "%{public}@Setup endpoint configuration is invalid: Addresses are not compatible";
LABEL_11:
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v28, 0xCu);

    goto LABEL_12;
  }
  id v13 = [v9 videoSrtpParameters];
  id v14 = [v6 videoSrtpParameters];
  char v15 = [v13 isCompatibleWithRemoteSRTPParameters:v14];

  if ((v15 & 1) == 0)
  {
    int v20 = (void *)MEMORY[0x230FBD990]();
    __int16 v25 = self;
    int v22 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v23 = HMFGetLogIdentifier();
    int v28 = 138543362;
    v29 = v23;
    __int16 v24 = "%{public}@Setup endpoint configuration is invalid: Video SRTP parameters are not compatible";
    goto LABEL_11;
  }
  id v16 = [v9 audioSrtpParameters];
  uint64_t v17 = [v6 audioSrtpParameters];
  char v18 = [v16 isCompatibleWithRemoteSRTPParameters:v17];

  if ((v18 & 1) == 0)
  {
    int v20 = (void *)MEMORY[0x230FBD990]();
    uint64_t v26 = self;
    int v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v23 = HMFGetLogIdentifier();
      int v28 = 138543362;
      v29 = v23;
      __int16 v24 = "%{public}@Setup endpoint configuration is invalid: Audio SRTP parameters are not compatible";
      goto LABEL_11;
    }
LABEL_12:

    BOOL v19 = 0;
    goto LABEL_13;
  }
  BOOL v19 = 1;
LABEL_13:

  return v19;
}

- (void)_sendSetupEndPointReadRequest
{
  id v3 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraLocalStreamControlManager *)self streamSession];
  [v4 updateState:1];

  char v5 = [(HMDCameraLocalStreamControlManager *)self accessoryCommunicator];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__HMDCameraLocalStreamControlManager__sendSetupEndPointReadRequest__block_invoke;
  v6[3] = &unk_264A226E0;
  v6[4] = self;
  [v5 readSetupEndPointWithCompletion:v6];
}

void __67__HMDCameraLocalStreamControlManager__sendSetupEndPointReadRequest__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  char v7 = [*(id *)(a1 + 32) streamSession];

  if (v7)
  {
    if (v5)
    {
      id v8 = [*(id *)(a1 + 32) streamSession];
      v9 = [v8 protocolParameters];
      [v9 setSetupEndPointRead:v5];

      BOOL v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = *(id *)(a1 + 32);
      char v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = HMFGetLogIdentifier();
        int v36 = 138543618;
        unint64_t v37 = v13;
        __int16 v38 = 2112;
        id v39 = v5;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Received setup endpoint read response: %@", (uint8_t *)&v36, 0x16u);
      }
      if ([v5 responseStatus])
      {
        id v14 = (void *)MEMORY[0x230FBD990]();
        id v15 = *(id *)(a1 + 32);
        id v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = HMFGetLogIdentifier();
          char v18 = HMDStreamControlPointResponseStatusAsString([v5 responseStatus]);
          int v36 = 138543618;
          unint64_t v37 = v17;
          __int16 v38 = 2112;
          id v39 = v18;
          _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Accessory setup endpoint read failed: %@", (uint8_t *)&v36, 0x16u);
        }
        [*(id *)(a1 + 32) _reportErrorCode:14];
      }
      else
      {
        char v27 = [*(id *)(a1 + 32) _isSetupEndPointConfigurationValid];
        int v28 = *(void **)(a1 + 32);
        if (v27)
        {
          v29 = [v28 streamSession];
          uint64_t v30 = [v29 parameterSelection];
          v31 = [*(id *)(a1 + 32) streamSession];
          v32 = [v31 protocolParameters];
          [v30 setSelectedConfigParameters:v32];

          v33 = *(void **)(a1 + 32);
          id v34 = [v33 streamSession];
          id v35 = [v34 negotiatedParameters];
          [v33 _callStreamNegotiated:v35];
        }
        else
        {
          [v28 _reportInternalErrorCode:1043];
        }
      }
    }
    else
    {
      int v23 = (void *)MEMORY[0x230FBD990]();
      id v24 = *(id *)(a1 + 32);
      __int16 v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = HMFGetLogIdentifier();
        int v36 = 138543618;
        unint64_t v37 = v26;
        __int16 v38 = 2112;
        id v39 = v6;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to read setup endpoint: %@", (uint8_t *)&v36, 0x16u);
      }
      [*(id *)(a1 + 32) _cleanUpStreamSessionWithError:v6];
    }
  }
  else
  {
    BOOL v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = *(id *)(a1 + 32);
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = HMFGetLogIdentifier();
      int v36 = 138543362;
      unint64_t v37 = v22;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Session ended while reading setup endpoint", (uint8_t *)&v36, 0xCu);
    }
  }
}

- (void)_sendSetupEndPointWriteRequest
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraLocalStreamControlManager *)self streamSession];
  id v5 = [v4 localNetworkConfig];
  id v6 = (void *)[v5 copy];

  char v7 = [(HMDCameraLocalStreamControlManager *)self streamSession];
  id v8 = [v7 localNetworkConfig];
  v9 = (void *)[v8 copy];

  BOOL v10 = [HMDCameraStreamManager alloc];
  id v11 = [(HMDCameraStreamControlManager *)self sessionID];
  char v12 = [(HMDCameraStreamControlManager *)self streamSnapshotHandler];
  id v13 = [(HMDCameraStreamControlManager *)self workQueue];
  id v14 = [(HMDCameraLocalStreamControlManager *)self streamSession];
  id v15 = [v14 streamSender];
  id v16 = [(HMDCameraStreamManager *)v10 initWithSessionID:v11 streamSnapshotHandler:v12 workQueue:v13 delegate:self localVideoNetworkConfig:v6 localAudioNetworkConfig:v9 sessionHandler:v15];
  uint64_t v17 = [(HMDCameraLocalStreamControlManager *)self streamSession];
  [v17 setStreamManager:v16];

  char v18 = [(HMDCameraLocalStreamControlManager *)self streamSession];
  BOOL v19 = [v18 streamManager];

  if (v19)
  {
    v54 = v9;
    v55 = v6;
    id v20 = [(HMDCameraLocalStreamControlManager *)self streamSession];
    uint64_t v21 = [v20 parameterSelection];
    int v22 = [(HMDCameraLocalStreamControlManager *)self streamSession];
    int v23 = [v22 protocolParameters];
    id v24 = [(HMDCameraLocalStreamControlManager *)self streamSession];
    __int16 v25 = [v24 streamingCapabilities];
    uint64_t v26 = [(HMDCameraLocalStreamControlManager *)self streamSession];
    char v27 = [v26 videoTierParameters];
    char v28 = [v21 findBestMatchWithProtocolParameters:v23 streamingCapabilities:v25 videoTierParameters:v27];

    if (v28)
    {
      v29 = [(HMDCameraLocalStreamControlManager *)self streamSession];
      uint64_t v30 = [v29 parameterSelection];
      v31 = [(HMDCameraLocalStreamControlManager *)self streamSession];
      v32 = [v31 protocolParameters];
      [v30 setSelectedEndPointSetupParameters:v32 videoNetworkConfig:v55 audioNetworkConfig:v54];

      v33 = [(HMDCameraLocalStreamControlManager *)self streamSession];
      id v34 = [v33 protocolParameters];
      id v35 = [v34 setupEndPointWrite];

      if (v35)
      {
        int v36 = [(HMDCameraLocalStreamControlManager *)self accessoryCommunicator];
        unint64_t v37 = [(HMDCameraLocalStreamControlManager *)self streamSession];
        __int16 v38 = [v37 protocolParameters];
        id v39 = [v38 setupEndPointWrite];
        v56[0] = MEMORY[0x263EF8330];
        v56[1] = 3221225472;
        v56[2] = __68__HMDCameraLocalStreamControlManager__sendSetupEndPointWriteRequest__block_invoke;
        v56[3] = &unk_264A2F3E8;
        v56[4] = self;
        [v36 writeSetupEndPoint:v39 completion:v56];

LABEL_15:
        v9 = v54;
        id v6 = v55;
        goto LABEL_16;
      }
      v50 = (void *)MEMORY[0x230FBD990]();
      id v51 = self;
      v52 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        v53 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v58 = v53;
        _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_ERROR, "%{public}@Could not select the end point setup parameters", buf, 0xCu);
      }
      v48 = v51;
      uint64_t v49 = 1041;
    }
    else
    {
      uint64_t v44 = (void *)MEMORY[0x230FBD990]();
      v45 = self;
      v46 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v47 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v58 = v47;
        _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_ERROR, "%{public}@Could not find the right match in the supported list", buf, 0xCu);
      }
      v48 = v45;
      uint64_t v49 = 1044;
    }
    [(HMDCameraStreamControlManager *)v48 _reportInternalErrorCode:v49];
    goto LABEL_15;
  }
  uint64_t v40 = (void *)MEMORY[0x230FBD990]();
  BOOL v41 = self;
  __int16 v42 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    v43 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v58 = v43;
    _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to create stream manager for local stream", buf, 0xCu);
  }
  [(HMDCameraStreamControlManager *)v41 _reportInternalErrorCode:1015];
LABEL_16:
}

void __68__HMDCameraLocalStreamControlManager__sendSetupEndPointWriteRequest__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) streamSession];

  if (v4)
  {
    if (v3)
    {
      id v5 = (void *)MEMORY[0x230FBD990]();
      id v6 = *(id *)(a1 + 32);
      char v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = HMFGetLogIdentifier();
        int v13 = 138543618;
        id v14 = v8;
        __int16 v15 = 2112;
        id v16 = v3;
        _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to write setup endpoint: %@", (uint8_t *)&v13, 0x16u);
      }
      [*(id *)(a1 + 32) _cleanUpStreamSessionWithError:v3];
    }
    else
    {
      [*(id *)(a1 + 32) _sendSetupEndPointReadRequest];
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 32);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      char v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      id v14 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Session ended while writing setup endpoint", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)_getSupportedConfigurations
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    char v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v11 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Getting Supported Configuration", buf, 0xCu);
  }
  id v8 = [(HMDCameraLocalStreamControlManager *)v5 accessoryCommunicator];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __65__HMDCameraLocalStreamControlManager__getSupportedConfigurations__block_invoke;
  v9[3] = &unk_264A226B8;
  v9[4] = v5;
  [v8 readSupportedConfigurationsWithCompletion:v9];
}

void __65__HMDCameraLocalStreamControlManager__getSupportedConfigurations__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = [*(id *)(a1 + 32) streamSession];

  if (v13)
  {
    id v14 = *(void **)(a1 + 32);
    if (v9 && v10 && v11)
    {
      __int16 v15 = [v14 streamSession];
      id v16 = [v15 protocolParameters];
      [v16 setSupportedVideoStreamConfiguration:v9];

      uint64_t v17 = [*(id *)(a1 + 32) supportedConfigCache];
      [v17 setSupportedVideoStreamConfiguration:v9];

      char v18 = (void *)MEMORY[0x230FBD990]();
      id v19 = *(id *)(a1 + 32);
      id v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        int v40 = 138543618;
        BOOL v41 = v21;
        __int16 v42 = 2112;
        id v43 = v9;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Updating supportedVideoStreamConfiguration: %@", (uint8_t *)&v40, 0x16u);
      }
      int v22 = [*(id *)(a1 + 32) streamSession];
      int v23 = [v22 protocolParameters];
      [v23 setSupportedAudioStreamConfiguration:v10];

      id v24 = [*(id *)(a1 + 32) supportedConfigCache];
      [v24 setSupportedAudioStreamConfiguration:v10];

      __int16 v25 = (void *)MEMORY[0x230FBD990]();
      id v26 = *(id *)(a1 + 32);
      char v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        char v28 = HMFGetLogIdentifier();
        int v40 = 138543618;
        BOOL v41 = v28;
        __int16 v42 = 2112;
        id v43 = v10;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Updating supportedAudioStreamConfiguration: %@", (uint8_t *)&v40, 0x16u);
      }
      v29 = [*(id *)(a1 + 32) streamSession];
      uint64_t v30 = [v29 protocolParameters];
      [v30 setSupportedRTPConfiguration:v11];

      v31 = [*(id *)(a1 + 32) supportedConfigCache];
      [v31 setSupportedRTPConfiguration:v11];

      v32 = (void *)MEMORY[0x230FBD990]();
      id v33 = *(id *)(a1 + 32);
      id v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        id v35 = HMFGetLogIdentifier();
        int v40 = 138543618;
        BOOL v41 = v35;
        __int16 v42 = 2112;
        id v43 = v11;
        _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, "%{public}@Updating supportedRTPConfiguration: %@", (uint8_t *)&v40, 0x16u);
      }
      [*(id *)(a1 + 32) _sendSetupEndPointWriteRequest];
    }
    else
    {
      [v14 _cleanUpStreamSessionWithError:v12];
    }
  }
  else
  {
    int v36 = (void *)MEMORY[0x230FBD990]();
    id v37 = *(id *)(a1 + 32);
    __int16 v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      id v39 = HMFGetLogIdentifier();
      int v40 = 138543362;
      BOOL v41 = v39;
      _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@Session ended while getting supported configurations", (uint8_t *)&v40, 0xCu);
    }
  }
}

- (void)negotiateStream
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    char v7 = HMFGetLogIdentifier();
    int v44 = 138543362;
    v45 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Received a request to negotiate video stream", (uint8_t *)&v44, 0xCu);
  }
  id v8 = [(HMDCameraLocalStreamControlManager *)v5 streamSession];
  id v9 = [v8 streamSender];
  [v9 openRelaySession];

  id v10 = [(HMDCameraLocalStreamControlManager *)v5 supportedConfigCache];
  LODWORD(v9) = [v10 isValid];

  if (v9)
  {
    id v11 = [(HMDCameraLocalStreamControlManager *)v5 supportedConfigCache];
    id v12 = [v11 supportedVideoStreamConfiguration];
    int v13 = [(HMDCameraLocalStreamControlManager *)v5 streamSession];
    id v14 = [v13 protocolParameters];
    [v14 setSupportedVideoStreamConfiguration:v12];

    __int16 v15 = [(HMDCameraLocalStreamControlManager *)v5 supportedConfigCache];
    id v16 = [v15 supportedAudioStreamConfiguration];
    uint64_t v17 = [(HMDCameraLocalStreamControlManager *)v5 streamSession];
    char v18 = [v17 protocolParameters];
    [v18 setSupportedAudioStreamConfiguration:v16];

    id v19 = [(HMDCameraLocalStreamControlManager *)v5 supportedConfigCache];
    id v20 = [v19 supportedRTPConfiguration];
    uint64_t v21 = [(HMDCameraLocalStreamControlManager *)v5 streamSession];
    int v22 = [v21 protocolParameters];
    [v22 setSupportedRTPConfiguration:v20];

    int v23 = (void *)MEMORY[0x230FBD990]();
    id v24 = v5;
    __int16 v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      id v26 = HMFGetLogIdentifier();
      char v27 = [(HMDCameraLocalStreamControlManager *)v24 streamSession];
      char v28 = [v27 protocolParameters];
      v29 = [v28 supportedVideoStreamConfiguration];
      int v44 = 138543618;
      v45 = v26;
      __int16 v46 = 2112;
      v47 = v29;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Using cached supportedVideoConfiguration: %@", (uint8_t *)&v44, 0x16u);
    }
    uint64_t v30 = (void *)MEMORY[0x230FBD990]();
    v31 = v24;
    v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      id v33 = HMFGetLogIdentifier();
      id v34 = [(HMDCameraLocalStreamControlManager *)v31 streamSession];
      id v35 = [v34 protocolParameters];
      int v36 = [v35 supportedAudioStreamConfiguration];
      int v44 = 138543618;
      v45 = v33;
      __int16 v46 = 2112;
      v47 = v36;
      _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@Using cached supportedAudioConfiguration: %@", (uint8_t *)&v44, 0x16u);
    }
    id v37 = (void *)MEMORY[0x230FBD990]();
    __int16 v38 = v31;
    id v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      int v40 = HMFGetLogIdentifier();
      BOOL v41 = [(HMDCameraLocalStreamControlManager *)v38 streamSession];
      __int16 v42 = [v41 protocolParameters];
      id v43 = [v42 supportedRTPConfiguration];
      int v44 = 138543618;
      v45 = v40;
      __int16 v46 = 2112;
      v47 = v43;
      _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_INFO, "%{public}@Using cached supportedRTPConfiguration: %@", (uint8_t *)&v44, 0x16u);
    }
    [(HMDCameraLocalStreamControlManager *)v38 _sendSetupEndPointWriteRequest];
  }
  else
  {
    [(HMDCameraLocalStreamControlManager *)v5 _getSupportedConfigurations];
  }
}

- (void)updateAudioVolume:(id)a3 callback:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v10 = [(HMDCameraLocalStreamControlManager *)self streamSession];
  id v9 = [v10 streamManager];
  [v9 updateAudioVolume:v7 callback:v6];
}

- (void)updateAudioSetting:(unint64_t)a3
{
  id v5 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v7 = [(HMDCameraLocalStreamControlManager *)self streamSession];
  id v6 = [v7 streamManager];
  [v6 updateAudioSetting:a3];
}

- (void)setUpRemoteConnectionWithDevice:(id)a3
{
  id v3 = a3;
  id v4 = (HMDCameraLocalStreamControlManager *)_HMFPreconditionFailure();
  [(HMDCameraLocalStreamControlManager *)v4 stateDump];
}

- (NSDictionary)stateDump
{
  v7[1] = *MEMORY[0x263EF8340];
  id v6 = @"State";
  v2 = [(HMDCameraLocalStreamControlManager *)self streamSession];
  id v3 = [v2 stateDescription];
  v7[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return (NSDictionary *)v4;
}

- (BOOL)isSendingStream
{
  id v3 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraLocalStreamControlManager *)self streamSession];
  SEL v5 = [v4 streamSender];
  LOBYTE(v3) = v5 != 0;

  return (char)v3;
}

- (NSNumber)aspectRatio
{
  id v3 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraLocalStreamControlManager *)self streamSession];
  SEL v5 = [v4 streamManager];
  id v6 = [v5 aspectRatio];

  return (NSNumber *)v6;
}

- (unint64_t)audioStreamSetting
{
  id v3 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraLocalStreamControlManager *)self streamSession];
  SEL v5 = [v4 streamManager];
  unint64_t v6 = [v5 audioStreamSetting];

  return v6;
}

- (NSNumber)slotIdentifier
{
  id v3 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraLocalStreamControlManager *)self streamSession];
  SEL v5 = [v4 streamManager];
  unint64_t v6 = [v5 slotIdentifier];

  return (NSNumber *)v6;
}

- (HMDCameraLocalStreamControlManager)initWithSessionID:(id)a3 workQueue:(id)a4 streamSnapshotHandler:(id)a5 delegate:(id)a6 accessory:(id)a7 streamManagementService:(id)a8 supportedConfigCache:(id)a9 streamSession:(id)a10 accessoryCommunicator:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  int v23 = (HMDCameraSupportedConfigurationCache *)a9;
  id v24 = (HMDCameraLocalStreamSession *)a10;
  __int16 v25 = (HMDCameraLocalStreamAccessoryCommunicator *)a11;
  if (!v17)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v18)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v19)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v21)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v22)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v23)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (v24)
  {
    id v26 = v25;
    v47.receiver = self;
    v47.super_class = (Class)HMDCameraLocalStreamControlManager;
    char v27 = [(HMDCameraStreamControlManager *)&v47 initWithSessionID:v17 workQueue:v18 streamSnapshotHandler:v19 delegate:v20 accessory:v21 streamManagementService:v22 isLocal:1];
    __int16 v46 = v17;
    char v28 = v20;
    supportedConfigCache = v27->_supportedConfigCache;
    v27->_supportedConfigCache = v23;
    uint64_t v30 = v23;

    streamSession = v27->_streamSession;
    v27->_streamSession = v24;
    v32 = v24;

    accessoryCommunicator = v27->_accessoryCommunicator;
    v27->_accessoryCommunicator = v26;
    id v34 = v26;

    id v35 = objc_alloc_init(HMDCameraMediaConfigGenerator);
    configGenerator = v27->_configGenerator;
    v27->_configGenerator = v35;

    return v27;
  }
LABEL_15:
  __int16 v38 = (HMDCameraLocalStreamControlManager *)_HMFPreconditionFailure();
  return [(HMDCameraLocalStreamControlManager *)v38 initWithSessionID:v40 workQueue:v41 streamSnapshotHandler:v42 reachabilityPath:v43 device:v44 delegate:v45 accessory:a9 streamManagementService:a10 localNetworkConfig:a11 remoteCapabilities:v48 supportedConfigCache:v49 streamPreference:v50];
}

- (HMDCameraLocalStreamControlManager)initWithSessionID:(id)a3 workQueue:(id)a4 streamSnapshotHandler:(id)a5 reachabilityPath:(unint64_t)a6 device:(id)a7 delegate:(id)a8 accessory:(id)a9 streamManagementService:(id)a10 localNetworkConfig:(id)a11 remoteCapabilities:(id)a12 supportedConfigCache:(id)a13 streamPreference:(id)a14
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v18 = a3;
  id v19 = a4;
  id v51 = a5;
  id v48 = a7;
  id v44 = a8;
  id v20 = a9;
  id v21 = a10;
  id v52 = a11;
  id v22 = a12;
  id v23 = a13;
  id v24 = a14;
  if (!v18)
  {
    _HMFPreconditionFailure();
    goto LABEL_20;
  }
  if (!v19)
  {
LABEL_20:
    _HMFPreconditionFailure();
    goto LABEL_21;
  }
  if (!v51)
  {
LABEL_21:
    _HMFPreconditionFailure();
    goto LABEL_22;
  }
  if (!a6)
  {
LABEL_22:
    _HMFPreconditionFailure();
    goto LABEL_23;
  }
  if (!v20)
  {
LABEL_23:
    _HMFPreconditionFailure();
    goto LABEL_24;
  }
  if (!v21)
  {
LABEL_24:
    _HMFPreconditionFailure();
    goto LABEL_25;
  }
  if (!v22)
  {
LABEL_25:
    _HMFPreconditionFailure();
LABEL_26:
    _HMFPreconditionFailure();
  }
  if (!v23) {
    goto LABEL_26;
  }
  unint64_t v43 = v24;
  objc_super v47 = v23;
  __int16 v25 = (void *)MEMORY[0x230FBD990]();
  id v26 = self;
  char v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    char v28 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v54 = v28;
    __int16 v55 = 2112;
    id v56 = v52;
    _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Local network config: %@", buf, 0x16u);
  }
  if (v48)
  {
    v29 = +[HMDDeviceCapabilities deviceCapabilities];
    int v30 = [v29 isResidentCapable];

    if (v30)
    {
      v31 = v22;
      id v32 = v21;
      id v33 = [[HMDCameraIDSSessionInitiator alloc] initWithSessionID:v18 workQueue:v19 device:v48 localNetworkConfig:v52 delegate:v26];
    }
    else
    {
      if (!isiOSDevice())
      {
        id v42 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Cannot relay stream from current device" userInfo:0];
        objc_exception_throw(v42);
      }
      v31 = v22;
      id v32 = v21;
      id v33 = [[HMDCameraIDSDeviceConnectionSender alloc] initWithSessionID:v18 workQueue:v19 device:v48 delegate:v26];
    }
    id v34 = v33;
  }
  else
  {
    v31 = v22;
    id v32 = v21;
    id v34 = 0;
  }
  __int16 v46 = v34;
  id v35 = v18;
  int v36 = [[HMDCameraLocalStreamSession alloc] initWithSessionID:v18 reachabilityPath:a6 streamSender:v34 remoteCapabilities:v31 localNetworkConfig:v52 streamPreference:v43];
  id v37 = [HMDCameraLocalStreamAccessoryCommunicator alloc];
  id v38 = v18;
  SEL v39 = v32;
  id v40 = [(HMDCameraLocalStreamAccessoryCommunicator *)v37 initWithWorkQueue:v19 sessionID:v38 accessory:v20 streamManagementService:v32];
  v50 = [(HMDCameraLocalStreamControlManager *)v26 initWithSessionID:v35 workQueue:v19 streamSnapshotHandler:v51 delegate:v44 accessory:v20 streamManagementService:v39 supportedConfigCache:v47 streamSession:v36 accessoryCommunicator:v40];

  return v50;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t50_158812 != -1) {
    dispatch_once(&logCategory__hmf_once_t50_158812, &__block_literal_global_158813);
  }
  v2 = (void *)logCategory__hmf_once_v51_158814;
  return v2;
}

void __49__HMDCameraLocalStreamControlManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v51_158814;
  logCategory__hmf_once_v51_158814 = v0;
}

@end