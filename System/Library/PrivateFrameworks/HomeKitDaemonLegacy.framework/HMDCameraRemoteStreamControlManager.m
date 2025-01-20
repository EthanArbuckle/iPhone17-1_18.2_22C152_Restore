@interface HMDCameraRemoteStreamControlManager
+ (id)logCategory;
- (HMDCameraMediaConfigGenerator)configGenerator;
- (HMDCameraRemoteStreamControlManager)initWithSessionID:(id)a3 workQueue:(id)a4 streamSnapshotHandler:(id)a5 delegate:(id)a6 accessory:(id)a7 streamManagementService:(id)a8 profileUniqueIdentifier:(id)a9 residentMessageHandler:(id)a10 streamSession:(id)a11;
- (HMDCameraRemoteStreamControlManager)initWithSessionID:(id)a3 workQueue:(id)a4 streamSnapshotHandler:(id)a5 reachabilityPath:(unint64_t)a6 device:(id)a7 delegate:(id)a8 accessory:(id)a9 streamManagementService:(id)a10 remoteCapabilities:(id)a11 profileUniqueIdentifier:(id)a12 residentMessageHandler:(id)a13 remoteAccessDevice:(id)a14 streamPreference:(id)a15;
- (HMDCameraRemoteStreamSession)streamSession;
- (HMDCameraResidentMessageHandler)residentMessageHandler;
- (NSDictionary)stateDump;
- (NSNumber)aspectRatio;
- (NSNumber)slotIdentifier;
- (NSUUID)profileUniqueIdentifier;
- (unint64_t)audioStreamSetting;
- (void)_cleanUpStreamSessionWithError:(id)a3;
- (void)_dispatchReconfigureToResident:(id)a3;
- (void)_dispatchStartRequestToResidentWithVideoSSRC:(id)a3 audioSSRC:(id)a4;
- (void)_idsSessionCreatedAndConfigNegotiated;
- (void)_reconfigureStreams;
- (void)_relaySessionStarted:(id)a3;
- (void)_sendStopMessageToResident;
- (void)_sendUpdatedConfiguration;
- (void)_setParametersSelected:(id)a3;
- (void)_streamStarted;
- (void)deviceConnectionReceiver:(id)a3 didEndSessionWithError:(id)a4;
- (void)deviceConnectionReceiver:(id)a3 didSetUpWithError:(id)a4;
- (void)deviceConnectionSender:(id)a3 didEndSessionWithError:(id)a4;
- (void)deviceConnectionSender:(id)a3 didSetUpWithError:(id)a4;
- (void)negotiateStream;
- (void)reconfigureStream:(id)a3;
- (void)sessionReceiver:(id)a3 didEndSessionWithError:(id)a4;
- (void)sessionReceiver:(id)a3 didSetUpWithError:(id)a4;
- (void)setStreamSession:(id)a3;
- (void)setUpRemoteConnectionWithDevice:(id)a3;
- (void)startStreamWithRemoteSettings:(id)a3;
- (void)stopStreamWithError:(id)a3;
- (void)streamManagerDidNetworkDeteriorate:(id)a3;
- (void)streamManagerDidNetworkImprove:(id)a3;
- (void)streamManagerDidReceiveFirstFrame:(id)a3;
- (void)streamManagerDidStartStream:(id)a3;
- (void)streamManagerDidStopStream:(id)a3 error:(id)a4;
- (void)streamManagerDidUpdateConfiguration:(id)a3;
- (void)updateAudioSetting:(unint64_t)a3;
- (void)updateAudioVolume:(id)a3 callback:(id)a4;
- (void)updateMaximumVideoResolutionQuality:(int64_t)a3 completionHandler:(id)a4;
@end

@implementation HMDCameraRemoteStreamControlManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamSession, 0);
  objc_storeStrong((id *)&self->_configGenerator, 0);
  objc_storeStrong((id *)&self->_residentMessageHandler, 0);
  objc_storeStrong((id *)&self->_profileUniqueIdentifier, 0);
}

- (void)setStreamSession:(id)a3
{
}

- (HMDCameraRemoteStreamSession)streamSession
{
  return (HMDCameraRemoteStreamSession *)objc_getProperty(self, a2, 88, 1);
}

- (HMDCameraMediaConfigGenerator)configGenerator
{
  return (HMDCameraMediaConfigGenerator *)objc_getProperty(self, a2, 80, 1);
}

- (HMDCameraResidentMessageHandler)residentMessageHandler
{
  return self->_residentMessageHandler;
}

- (NSUUID)profileUniqueIdentifier
{
  return self->_profileUniqueIdentifier;
}

- (void)_sendUpdatedConfiguration
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(HMDCameraRemoteStreamControlManager *)self streamSession];
  v5 = [v4 streamSender];

  if (v5)
  {
    [(HMDCameraStreamControlManager *)self _callStreamReconfigured];
  }
  else
  {
    v6 = (void *)MEMORY[0x1D9452090]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v24 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Sending updated configuration", buf, 0xCu);
    }
    v10 = [(HMDCameraRemoteStreamControlManager *)v7 configGenerator];
    v11 = [(HMDCameraRemoteStreamControlManager *)v7 streamSession];
    v12 = [v11 videoTierParameters];
    v13 = [v12 currentPickedTier];
    id v22 = 0;
    char v14 = [v10 extractReselectedConfigFromVideoTier:v13 videoStreamConfig:&v22];
    id v15 = v22;

    if (v14)
    {
      v16 = [(HMDCameraRemoteStreamControlManager *)v7 streamSession];
      v17 = [v16 streamManager];
      [v17 updateStreamConfiguration:v15];
    }
    else
    {
      v18 = (void *)MEMORY[0x1D9452090]();
      v19 = v7;
      v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v24 = v21;
        _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Reselected config failed to extract", buf, 0xCu);
      }
      [(HMDCameraStreamControlManager *)v19 _reportInternalErrorCode:1046];
    }
  }
}

- (void)updateMaximumVideoResolutionQuality:(int64_t)a3 completionHandler:(id)a4
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  v26[0] = *MEMORY[0x1E4F2CD68];
  v8 = [NSNumber numberWithInteger:a3];
  v26[1] = @"kCameraSessionID";
  v27[0] = v8;
  v9 = [(HMDCameraStreamControlManager *)self sessionID];
  v10 = [v9 sessionID];
  v27[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];

  v12 = (void *)MEMORY[0x1D9452090]();
  v13 = self;
  char v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v25 = v15;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Dispatching the video resolution quality update request to resident", buf, 0xCu);
  }
  v16 = [(HMDCameraRemoteStreamControlManager *)v13 residentMessageHandler];
  uint64_t v17 = *MEMORY[0x1E4F2CD60];
  v18 = [(HMDCameraStreamControlManager *)v13 sessionID];
  v19 = [(HMDCameraRemoteStreamControlManager *)v13 profileUniqueIdentifier];
  v20 = [(HMDCameraStreamControlManager *)v13 workQueue];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __93__HMDCameraRemoteStreamControlManager_updateMaximumVideoResolutionQuality_completionHandler___block_invoke;
  v22[3] = &unk_1E6A16B58;
  v22[4] = v13;
  id v23 = v6;
  id v21 = v6;
  [v16 sendMessageWithName:v17 cameraSessionID:v18 payload:v11 target:v19 responseQueue:v20 responseHandler:v22];
}

void __93__HMDCameraRemoteStreamControlManager_updateMaximumVideoResolutionQuality_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    int v16 = 138543362;
    uint64_t v17 = v10;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Received reply for update video resolution quality request for remote stream session.", (uint8_t *)&v16, 0xCu);
  }
  if (v5)
  {
    v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = *(id *)(a1 + 32);
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      char v14 = HMFGetLogIdentifier();
      int v16 = 138543618;
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Relayed update video resolution quality request to resident failed: %@", (uint8_t *)&v16, 0x16u);
    }
    id v15 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v15 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v15();
}

- (void)_dispatchReconfigureToResident:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v17 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Dispatching the reconfigure request to resident", buf, 0xCu);
  }
  objc_initWeak((id *)buf, v7);
  v10 = [(HMDCameraRemoteStreamControlManager *)v7 residentMessageHandler];
  v11 = [(HMDCameraStreamControlManager *)v7 sessionID];
  id v12 = [(HMDCameraRemoteStreamControlManager *)v7 profileUniqueIdentifier];
  v13 = [(HMDCameraStreamControlManager *)v7 workQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__HMDCameraRemoteStreamControlManager__dispatchReconfigureToResident___block_invoke;
  v14[3] = &unk_1E6A17A08;
  objc_copyWeak(&v15, (id *)buf);
  [v10 sendMessageWithName:@"kReconfigureRemoteStreamRequestKey" cameraSessionID:v11 payload:v4 target:v12 responseQueue:v13 responseHandler:v14];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __70__HMDCameraRemoteStreamControlManager__dispatchReconfigureToResident___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = [WeakRetained streamSession];

    if (v9)
    {
      v10 = (void *)MEMORY[0x1D9452090]();
      id v11 = v8;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = HMFGetLogIdentifier();
        int v18 = 138543362;
        id v19 = v13;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Received reply for reconfigure remote stream session", (uint8_t *)&v18, 0xCu);
      }
      if (v5)
      {
        char v14 = (void *)MEMORY[0x1D9452090]();
        id v15 = v11;
        int v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = HMFGetLogIdentifier();
          int v18 = 138543618;
          id v19 = v17;
          __int16 v20 = 2112;
          id v21 = v5;
          _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Relayed reconfigure remote stream session request to resident failed: %@", (uint8_t *)&v18, 0x16u);
        }
        [v15 _cleanUpStreamSessionWithError:v5];
      }
      else
      {
        [v11 _sendUpdatedConfiguration];
      }
    }
  }
}

- (void)_reconfigureStreams
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v3 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x1E4F28DB0];
  id v5 = [(HMDCameraRemoteStreamControlManager *)self streamSession];
  id v6 = [v5 videoTierParameters];
  v7 = [v6 currentPickedTier];
  id v8 = [v4 archivedDataWithRootObject:v7 requiringSecureCoding:1 error:0];

  v12[0] = @"kReconfiguredTier";
  v12[1] = @"kCameraSessionID";
  v13[0] = v8;
  v9 = [(HMDCameraStreamControlManager *)self sessionID];
  v10 = [v9 sessionID];
  v13[1] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  [(HMDCameraRemoteStreamControlManager *)self _dispatchReconfigureToResident:v11];
}

- (void)streamManagerDidUpdateConfiguration:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v12 = 138543362;
    v13 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Stream configuration update complete", (uint8_t *)&v12, 0xCu);
  }
  v10 = [(HMDCameraRemoteStreamControlManager *)v7 streamSession];
  id v11 = [v10 streamManager];
  [v11 updateReconfigurationMode:0];
}

- (void)streamManagerDidNetworkDeteriorate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraRemoteStreamControlManager *)self streamSession];
  v7 = [v6 videoTierParameters];
  int v8 = [v7 pickLowerTier];

  v9 = (void *)MEMORY[0x1D9452090]();
  v10 = self;
  id v11 = HMFGetOSLogHandle();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v12)
    {
      v13 = HMFGetLogIdentifier();
      int v17 = 138543362;
      int v18 = v13;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Picked a lower tier", (uint8_t *)&v17, 0xCu);
    }
    [(HMDCameraRemoteStreamControlManager *)v10 _reconfigureStreams];
  }
  else
  {
    if (v12)
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v17 = 138543362;
      int v18 = v14;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Already in lowest tier, not changing the tier", (uint8_t *)&v17, 0xCu);
    }
    id v15 = [(HMDCameraRemoteStreamControlManager *)v10 streamSession];
    int v16 = [v15 streamManager];
    [v16 updateReconfigurationMode:0];
  }
}

- (void)streamManagerDidNetworkImprove:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraRemoteStreamControlManager *)self streamSession];
  v7 = [v6 videoTierParameters];
  int v8 = [v7 pickHigherTier];

  v9 = (void *)MEMORY[0x1D9452090]();
  v10 = self;
  id v11 = HMFGetOSLogHandle();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v12)
    {
      v13 = HMFGetLogIdentifier();
      int v17 = 138543362;
      int v18 = v13;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Picked a higher tier", (uint8_t *)&v17, 0xCu);
    }
    [(HMDCameraRemoteStreamControlManager *)v10 _reconfigureStreams];
  }
  else
  {
    if (v12)
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v17 = 138543362;
      int v18 = v14;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Already in highest tier, not changing the tier", (uint8_t *)&v17, 0xCu);
    }
    id v15 = [(HMDCameraRemoteStreamControlManager *)v10 streamSession];
    int v16 = [v15 streamManager];
    [v16 updateReconfigurationMode:0];
  }
}

- (void)streamManagerDidStopStream:(id)a3 error:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = [(HMDCameraRemoteStreamControlManager *)self streamSession];
  char v10 = [v9 containsState:8];

  if (v10)
  {
    [(HMDCameraStreamControlManager *)self _callStreamStoppedWithError:v7];
  }
  else
  {
    id v11 = (void *)MEMORY[0x1D9452090]();
    BOOL v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v15 = 138543362;
      int v16 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Session stopped before starting; cleaning up the stream",
        (uint8_t *)&v15,
        0xCu);
    }
    [(HMDCameraRemoteStreamControlManager *)v12 _cleanUpStreamSessionWithError:v7];
  }
}

- (void)streamManagerDidReceiveFirstFrame:(id)a3
{
  id v4 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v4);

  [(HMDCameraStreamControlManager *)self _callStreamFirstFrameReceived];
}

- (void)streamManagerDidStartStream:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v18 = 138543362;
    uint64_t v19 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Stream manager did start stream", (uint8_t *)&v18, 0xCu);
  }
  char v10 = [(HMDCameraRemoteStreamControlManager *)v7 streamSession];
  id v11 = [v10 streamManager];
  BOOL v12 = [v11 videoStreamInterface];
  v13 = [v12 syncSource];
  uint64_t v14 = [(HMDCameraRemoteStreamControlManager *)v7 streamSession];
  int v15 = [v14 streamManager];
  int v16 = [v15 audioStreamInterface];
  uint64_t v17 = [v16 syncSource];
  [(HMDCameraRemoteStreamControlManager *)v7 _dispatchStartRequestToResidentWithVideoSSRC:v13 audioSSRC:v17];
}

- (void)deviceConnectionSender:(id)a3 didEndSessionWithError:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x1D9452090]();
  char v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    BOOL v12 = HMFGetLogIdentifier();
    int v13 = 138543362;
    uint64_t v14 = v12;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Received a callback that IDS initiator session has ended, stopping the stream", (uint8_t *)&v13, 0xCu);
  }
  [(HMDCameraRemoteStreamControlManager *)v10 stopStreamWithError:v7];
}

- (void)deviceConnectionSender:(id)a3 didSetUpWithError:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  if (v7)
  {
    v9 = (void *)MEMORY[0x1D9452090]();
    char v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      BOOL v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      uint64_t v14 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to set up IDSDeviceConnection for stream", (uint8_t *)&v13, 0xCu);
    }
    [(HMDCameraRemoteStreamControlManager *)v10 _cleanUpStreamSessionWithError:v7];
  }
  else
  {
    [(HMDCameraStreamControlManager *)self _callStreamRemoteConnectionSetup];
  }
}

- (void)deviceConnectionReceiver:(id)a3 didEndSessionWithError:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x1D9452090]();
  char v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    BOOL v12 = HMFGetLogIdentifier();
    int v13 = 138543362;
    uint64_t v14 = v12;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Received a callback that IDS session has ended, stopping the stream", (uint8_t *)&v13, 0xCu);
  }
  [(HMDCameraRemoteStreamControlManager *)v10 stopStreamWithError:v7];
}

- (void)deviceConnectionReceiver:(id)a3 didSetUpWithError:(id)a4
{
  id v6 = a4;
  id v5 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  [(HMDCameraRemoteStreamControlManager *)self _relaySessionStarted:v6];
}

- (void)sessionReceiver:(id)a3 didEndSessionWithError:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x1D9452090]();
  char v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    BOOL v12 = HMFGetLogIdentifier();
    int v13 = 138543362;
    uint64_t v14 = v12;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Received a callback that IDS session has ended, stopping the stream", (uint8_t *)&v13, 0xCu);
  }
  [(HMDCameraRemoteStreamControlManager *)v10 stopStreamWithError:v7];
}

- (void)sessionReceiver:(id)a3 didSetUpWithError:(id)a4
{
  id v6 = a4;
  id v5 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  [(HMDCameraRemoteStreamControlManager *)self _relaySessionStarted:v6];
}

- (void)_cleanUpStreamSessionWithError:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraRemoteStreamControlManager *)self streamSession];

  id v7 = (void *)MEMORY[0x1D9452090]();
  int v8 = self;
  v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v10)
    {
      id v11 = HMFGetLogIdentifier();
      int v15 = 138543362;
      int v16 = v11;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Cleaning up the stream", (uint8_t *)&v15, 0xCu);
    }
    BOOL v12 = [(HMDCameraRemoteStreamControlManager *)v8 streamSession];
    int v13 = [v12 streamManager];
    [v13 stopStream];

    [(HMDCameraRemoteStreamControlManager *)v8 setStreamSession:0];
    [(HMDCameraRemoteStreamControlManager *)v8 _sendStopMessageToResident];
    [(HMDCameraStreamControlManager *)v8 _callStreamStoppedWithError:v4];
  }
  else
  {
    if (v10)
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v15 = 138543362;
      int v16 = v14;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@No current stream session to clean up", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)_sendStopMessageToResident
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    int v18 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Sending stop stream message to resident", buf, 0xCu);
  }
  int v8 = [(HMDCameraStreamControlManager *)v5 sessionID];
  v9 = [v8 sessionID];
  int v16 = v9;
  BOOL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];

  id v11 = [(HMDCameraRemoteStreamControlManager *)v5 residentMessageHandler];
  BOOL v12 = [(HMDCameraStreamControlManager *)v5 sessionID];
  int v13 = [(HMDCameraRemoteStreamControlManager *)v5 profileUniqueIdentifier];
  uint64_t v14 = [(HMDCameraStreamControlManager *)v5 workQueue];
  [v11 sendMessageWithName:@"kStopRemoteStreamRequestKey" cameraSessionID:v12 payload:v10 target:v13 responseQueue:v14 responseHandler:&__block_literal_global_32711];
}

- (void)stopStreamWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraRemoteStreamControlManager *)self streamSession];

  if (v6)
  {
    id v7 = [(HMDCameraRemoteStreamControlManager *)self streamSession];
    char v8 = [v7 containsState:8];

    if (v8) {
      [(HMDCameraStreamControlManager *)self _callStreamStoppedWithError:v4];
    }
    else {
      [(HMDCameraStreamControlManager *)self _reportErrorCode:23];
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1D9452090]();
    BOOL v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      BOOL v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      uint64_t v14 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@No current stream session to stop", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)setUpRemoteConnectionWithDevice:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraRemoteStreamControlManager *)self streamSession];

  id v7 = (void *)MEMORY[0x1D9452090]();
  char v8 = self;
  v9 = HMFGetOSLogHandle();
  BOOL v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v15 = 138543362;
      int v16 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Remote side has been setup", (uint8_t *)&v15, 0xCu);
    }
    BOOL v12 = [(HMDCameraRemoteStreamControlManager *)v8 streamSession];
    int v13 = [v12 streamReceiver];
    [v13 setUpRemoteConnectionWithDevice:v4];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v15 = 138543362;
      int v16 = v14;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@No current stream session to remotely set up", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)reconfigureStream:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  char v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    BOOL v10 = [(HMDCameraStreamControlManager *)v7 sessionID];
    int v16 = 138543618;
    uint64_t v17 = v9;
    __int16 v18 = 2112;
    uint64_t v19 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Received request to stop the stream with session ID %@", (uint8_t *)&v16, 0x16u);
  }
  id v11 = [(HMDCameraRemoteStreamControlManager *)v7 streamSession];

  if (v11)
  {
    [(HMDCameraRemoteStreamControlManager *)v7 _dispatchReconfigureToResident:v4];
  }
  else
  {
    BOOL v12 = (void *)MEMORY[0x1D9452090]();
    int v13 = v7;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = HMFGetLogIdentifier();
      int v16 = 138543362;
      uint64_t v17 = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@No current stream session to reconfigure", (uint8_t *)&v16, 0xCu);
    }
    [(HMDCameraStreamControlManager *)v13 _reportErrorCode:3];
  }
}

- (void)_streamStarted
{
  v3 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraRemoteStreamControlManager *)self streamSession];
  [v4 updateState:8];

  id v5 = [(HMDCameraRemoteStreamControlManager *)self streamSession];
  id v6 = [v5 streamSender];
  [v6 startKeepAlive];

  id v8 = [(HMDCameraRemoteStreamControlManager *)self streamSession];
  id v7 = [v8 streamReceiver];
  [v7 startKeepAlive];
}

- (void)_dispatchStartRequestToResidentWithVideoSSRC:(id)a3 audioSSRC:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  if (v6 && v7)
  {
    v35[0] = @"kVideoStreamSSRC";
    v35[1] = @"kAudioStreamSSRC";
    v36[0] = v6;
    v36[1] = v7;
    v35[2] = @"kCameraSessionID";
    v9 = [(HMDCameraStreamControlManager *)self sessionID];
    BOOL v10 = [v9 sessionID];
    v36[2] = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];

    BOOL v12 = [(HMDCameraRemoteStreamControlManager *)self streamSession];
    int v13 = [v12 streamSender];
    uint64_t v14 = [v13 mtu];

    if (v14)
    {
      int v15 = (void *)[v11 mutableCopy];
      int v16 = [(HMDCameraRemoteStreamControlManager *)self streamSession];
      uint64_t v17 = [v16 streamSender];
      __int16 v18 = [v17 mtu];
      [v15 setObject:v18 forKeyedSubscript:@"kRemoteStreamMTU"];

      uint64_t v19 = [v15 copy];
      id v11 = (void *)v19;
    }
    uint64_t v20 = (void *)MEMORY[0x1D9452090]();
    id v21 = self;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v38 = v23;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Dispatching the start request to resident", buf, 0xCu);
    }
    objc_initWeak((id *)buf, v21);
    v24 = [(HMDCameraRemoteStreamControlManager *)v21 residentMessageHandler];
    uint64_t v25 = [(HMDCameraStreamControlManager *)v21 sessionID];
    v26 = [(HMDCameraRemoteStreamControlManager *)v21 profileUniqueIdentifier];
    v27 = [(HMDCameraStreamControlManager *)v21 workQueue];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __94__HMDCameraRemoteStreamControlManager__dispatchStartRequestToResidentWithVideoSSRC_audioSSRC___block_invoke;
    v33[3] = &unk_1E6A17A08;
    objc_copyWeak(&v34, (id *)buf);
    [v24 sendMessageWithName:@"kStartRemoteStreamRequestKey" cameraSessionID:v25 payload:v11 target:v26 responseQueue:v27 responseHandler:v33];

    v28 = [(HMDCameraStreamControlManager *)v21 sessionID];
    [v28 markMilestoneFor:@"SentStartRemoteStreamRequest"];

    objc_destroyWeak(&v34);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v29 = (void *)MEMORY[0x1D9452090]();
    v30 = self;
    v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v38 = v32;
      _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@No SSRC, cannot start the stream", buf, 0xCu);
    }
    [(HMDCameraStreamControlManager *)v30 _reportInternalErrorCode:1045];
  }
}

void __94__HMDCameraRemoteStreamControlManager__dispatchStartRequestToResidentWithVideoSSRC_audioSSRC___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = [WeakRetained streamSession];

    if (v9)
    {
      BOOL v10 = (void *)MEMORY[0x1D9452090]();
      id v11 = v8;
      BOOL v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v13 = HMFGetLogIdentifier();
        int v18 = 138543362;
        uint64_t v19 = v13;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Received reply for start remote stream session for session", (uint8_t *)&v18, 0xCu);
      }
      if (v5)
      {
        uint64_t v14 = (void *)MEMORY[0x1D9452090]();
        id v15 = v11;
        int v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = HMFGetLogIdentifier();
          int v18 = 138543618;
          uint64_t v19 = v17;
          __int16 v20 = 2112;
          id v21 = v5;
          _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Relayed start remote stream session request to resident failed: %@", (uint8_t *)&v18, 0x16u);
        }
        [v15 _cleanUpStreamSessionWithError:v5];
      }
      else
      {
        [v11 _streamStarted];
        [v11 _callStreamStarted];
      }
    }
  }
}

- (void)startStreamWithRemoteSettings:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraRemoteStreamControlManager *)self streamSession];
  id v7 = [v6 streamSender];

  if (v7)
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    v9 = self;
    BOOL v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v57 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Stream sender is set, redispatching the start request to resident", buf, 0xCu);
    }
    id v12 = [v4 objectForKeyedSubscript:@"kVideoStreamSSRC"];
    id v13 = [v4 objectForKeyedSubscript:@"kAudioStreamSSRC"];
    uint64_t v14 = [(HMDCameraRemoteStreamControlManager *)v9 streamSession];
    id v15 = [v14 protocolParameters];
    int v16 = [v15 setupEndPointRead];
    [v16 videoSSRC];
    uint64_t v17 = v53 = v4;
    uint64_t v18 = [v17 unsignedIntegerValue];

    uint64_t v19 = [(HMDCameraRemoteStreamControlManager *)v9 streamSession];
    __int16 v20 = [v19 protocolParameters];
    id v21 = [v20 setupEndPointRead];
    uint64_t v22 = [v21 audioSSRC];
    uint64_t v23 = [v22 unsignedIntegerValue];

    v24 = [(HMDCameraRemoteStreamControlManager *)v9 streamSession];
    uint64_t v25 = [v24 streamSender];
    v26 = [(HMDCameraRemoteStreamControlManager *)v9 streamSession];
    v27 = [v26 streamReceiver];
    v28 = [v27 session];
    [v25 startPacketRelayWithIDSDeviceSession:v28 cameraVideoSSRC:v18 cameraAudioSSRC:v23];

    id v4 = v53;
    [(HMDCameraRemoteStreamControlManager *)v9 _dispatchStartRequestToResidentWithVideoSSRC:v12 audioSSRC:v13];
LABEL_5:

    goto LABEL_6;
  }
  v29 = [HMDCameraStreamManager alloc];
  v30 = [(HMDCameraStreamControlManager *)self sessionID];
  v31 = [(HMDCameraStreamControlManager *)self streamSnapshotHandler];
  v32 = [(HMDCameraStreamControlManager *)self workQueue];
  v33 = [(HMDCameraRemoteStreamControlManager *)self streamSession];
  id v34 = [v33 streamReceiver];
  v35 = [(HMDCameraStreamManager *)v29 initWithSessionID:v30 streamSnapshotHandler:v31 workQueue:v32 delegate:self localVideoNetworkConfig:0 localAudioNetworkConfig:0 sessionHandler:v34];
  v36 = [(HMDCameraRemoteStreamControlManager *)self streamSession];
  [v36 setStreamManager:v35];

  v37 = [(HMDCameraRemoteStreamControlManager *)self streamSession];
  v38 = [v37 streamManager];

  if (v38)
  {
    uint64_t v39 = [(HMDCameraRemoteStreamControlManager *)self configGenerator];
    v40 = [(HMDCameraRemoteStreamControlManager *)self streamSession];
    v41 = [v40 protocolParameters];
    id v54 = 0;
    id v55 = 0;
    char v42 = [v39 extractSelectedConfigFromProtocolParameters:v41 videoStreamConfig:&v55 audioStreamConfig:&v54];
    id v12 = v55;
    id v13 = v54;

    if (v42)
    {
      v43 = [(HMDCameraRemoteStreamControlManager *)self streamSession];
      v44 = [v43 streamManager];
      [v44 startStreamWithVideoConfig:v12 audioConfig:v13];
    }
    else
    {
      v49 = (void *)MEMORY[0x1D9452090]();
      v50 = self;
      v51 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        v52 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v57 = v52;
        _os_log_impl(&dword_1D49D5000, v51, OS_LOG_TYPE_ERROR, "%{public}@Could not extract a configuration from the given parameters", buf, 0xCu);
      }
      [(HMDCameraStreamControlManager *)v50 _reportInternalErrorCode:1046];
    }
    goto LABEL_5;
  }
  v45 = (void *)MEMORY[0x1D9452090]();
  v46 = self;
  v47 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
  {
    v48 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v57 = v48;
    _os_log_impl(&dword_1D49D5000, v47, OS_LOG_TYPE_ERROR, "%{public}@Failed to create stream manager for remote stream", buf, 0xCu);
  }
  [(HMDCameraStreamControlManager *)v46 _reportInternalErrorCode:1015];
LABEL_6:
}

- (void)_relaySessionStarted:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraRemoteStreamControlManager *)self streamSession];

  if (v6)
  {
    if (v4)
    {
      id v7 = (void *)MEMORY[0x1D9452090]();
      id v8 = self;
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        BOOL v10 = HMFGetLogIdentifier();
        int v17 = 138543618;
        uint64_t v18 = v10;
        __int16 v19 = 2112;
        id v20 = v4;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Relay session failed to start: %@", (uint8_t *)&v17, 0x16u);
      }
      [(HMDCameraRemoteStreamControlManager *)v8 _cleanUpStreamSessionWithError:v4];
    }
    else
    {
      int v16 = [(HMDCameraRemoteStreamControlManager *)self streamSession];
      [v16 updateState:4];

      [(HMDCameraRemoteStreamControlManager *)self _idsSessionCreatedAndConfigNegotiated];
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v17 = 138543362;
      uint64_t v18 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Stream session is no longer valid, stopping the IDS session", (uint8_t *)&v17, 0xCu);
    }
    id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    [(HMDCameraRemoteStreamControlManager *)v12 _cleanUpStreamSessionWithError:v15];
  }
}

- (void)_idsSessionCreatedAndConfigNegotiated
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraRemoteStreamControlManager *)self streamSession];
  if ([v4 containsState:2])
  {
    id v5 = [(HMDCameraRemoteStreamControlManager *)self streamSession];
    char v6 = [v5 containsState:4];

    if (v6)
    {
      id v7 = (void *)MEMORY[0x1D9452090]();
      id v8 = self;
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        BOOL v10 = HMFGetLogIdentifier();
        int v19 = 138543362;
        id v20 = v10;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Negotiation is completed", (uint8_t *)&v19, 0xCu);
      }
      id v11 = [(HMDCameraRemoteStreamControlManager *)v8 streamSession];
      id v12 = [v11 negotiatedParameters];
      [(HMDCameraStreamControlManager *)v8 _callStreamNegotiated:v12];

      return;
    }
  }
  else
  {
  }
  id v13 = (void *)MEMORY[0x1D9452090]();
  uint64_t v14 = self;
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v16 = HMFGetLogIdentifier();
    int v17 = [(HMDCameraRemoteStreamControlManager *)v14 streamSession];
    uint64_t v18 = [v17 stateDescription];
    int v19 = 138543618;
    id v20 = v16;
    __int16 v21 = 2112;
    uint64_t v22 = v18;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Current state: %@, waiting", (uint8_t *)&v19, 0x16u);
  }
}

- (void)_setParametersSelected:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = [(HMDCameraRemoteStreamControlManager *)self streamSession];
  [v6 updateState:2];

  id v7 = objc_msgSend(v4, "hmf_dataForKey:", @"kSelectedStreamParameters");
  uint64_t v8 = objc_msgSend(v4, "hmf_dataForKey:", @"kVideoTierParameters");
  v9 = (void *)v8;
  if (v7 && v8)
  {
    id v67 = 0;
    BOOL v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v67];
    id v11 = v67;
    if (v10)
    {
      id v66 = v11;
      id v12 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:&v66];
      id v13 = v66;

      if (v12)
      {
        id v61 = v13;
        v62 = v9;
        v63 = v7;
        id v64 = v4;
        uint64_t v14 = [(HMDCameraRemoteStreamControlManager *)self streamSession];
        [v14 setProtocolParameters:v10];

        id v15 = [v10 selectedStreamConfigurationWrite];
        int v16 = [v15 videoParameters];

        v57 = [HMDCameraVideoTier alloc];
        v59 = [v16 videoAttributes];
        v56 = [v59 videoResolution];
        uint64_t v58 = [v16 videoAttributes];
        int v17 = [v58 framerate];
        uint64_t v18 = [v16 rtpParameters];
        int v19 = [v18 minimumBitrate];
        id v20 = [v16 rtpParameters];
        [v20 maximumBitrate];
        __int16 v21 = v65 = v12;
        v60 = v16;
        uint64_t v22 = [v16 rtpParameters];
        [v22 rtcpInterval];
        v24 = uint64_t v23 = v10;
        uint64_t v25 = [(HMDCameraVideoTier *)v57 initWithVideoResolution:v56 framerate:v17 minBitRate:v19 maxBitRate:v21 rtcpInterval:v24];

        BOOL v10 = v23;
        v26 = [(HMDCameraRemoteStreamControlManager *)self streamSession];
        v27 = [v26 videoTierParameters];
        v28 = (void *)v25;
        [v27 updateTierParameters:v65 firstPickedParameter:v25];

        v29 = (void *)MEMORY[0x1D9452090]();
        v30 = self;
        v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          v32 = HMFGetLogIdentifier();
          v33 = [v10 setupEndPointWrite];
          *(_DWORD *)buf = 138543618;
          v69 = v32;
          __int16 v70 = 2112;
          id v71 = v33;
          _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@Received protocol parameters with Setup Endpoint Write %@", buf, 0x16u);
        }
        id v34 = (void *)MEMORY[0x1D9452090]();
        v35 = v30;
        v36 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          v37 = HMFGetLogIdentifier();
          v38 = [v10 setupEndPointRead];
          *(_DWORD *)buf = 138543618;
          v69 = v37;
          __int16 v70 = 2112;
          id v71 = v38;
          _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_INFO, "%{public}@Setup Endpoint Read %@", buf, 0x16u);
        }
        uint64_t v39 = (void *)MEMORY[0x1D9452090]();
        v40 = v35;
        v41 = HMFGetOSLogHandle();
        id v4 = v64;
        id v13 = v61;
        v9 = v62;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          char v42 = HMFGetLogIdentifier();
          v43 = [v10 selectedStreamConfigurationWrite];
          *(_DWORD *)buf = 138543618;
          v69 = v42;
          __int16 v70 = 2112;
          id v71 = v43;
          _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_INFO, "%{public}@Selected stream config %@", buf, 0x16u);
        }
        [(HMDCameraRemoteStreamControlManager *)v40 _idsSessionCreatedAndConfigNegotiated];

        id v7 = v63;
        id v12 = v65;
      }
      else
      {
        v52 = (void *)MEMORY[0x1D9452090]();
        id v53 = self;
        id v54 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          id v55 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v69 = v55;
          __int16 v70 = 2112;
          id v71 = v13;
          _os_log_impl(&dword_1D49D5000, v54, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive camera video tier parameters from video parameters data: %@", buf, 0x16u);
        }
        [(HMDCameraStreamControlManager *)v53 _reportErrorCode:3];
      }

      id v11 = v13;
    }
    else
    {
      v48 = (void *)MEMORY[0x1D9452090]();
      v49 = self;
      v50 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        v51 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v69 = v51;
        __int16 v70 = 2112;
        id v71 = v11;
        _os_log_impl(&dword_1D49D5000, v50, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive camera protocol parameters from protocol parameters data: %@", buf, 0x16u);
      }
      [(HMDCameraStreamControlManager *)v49 _reportErrorCode:3];
    }
  }
  else
  {
    v44 = (void *)MEMORY[0x1D9452090]();
    v45 = self;
    v46 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      v47 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v69 = v47;
      _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_ERROR, "%{public}@Did not get protocol or tier parameters data", buf, 0xCu);
    }
    [(HMDCameraStreamControlManager *)v45 _reportInternalErrorCode:1047];
  }
}

- (void)negotiateStream
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  char v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v29 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Received a request to relay start stream to resident", buf, 0xCu);
  }
  uint64_t v8 = (void *)MEMORY[0x1E4F28DB0];
  v9 = [(HMDCameraRemoteStreamControlManager *)v5 streamSession];
  BOOL v10 = [v9 streamingCapabilities];
  id v11 = [v8 archivedDataWithRootObject:v10 requiringSecureCoding:1 error:0];

  v27[0] = v11;
  v26[0] = @"kRemoteStreamCapabilities";
  v26[1] = @"kCameraSessionID";
  id v12 = [(HMDCameraStreamControlManager *)v5 sessionID];
  id v13 = [v12 sessionID];
  v27[1] = v13;
  void v26[2] = @"kCameraSessionApplicationID";
  uint64_t v14 = [(HMDCameraStreamControlManager *)v5 sessionID];
  id v15 = [v14 hostProcessBundleIdentifier];
  v27[2] = v15;
  int v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];

  objc_initWeak((id *)buf, v5);
  int v17 = [(HMDCameraRemoteStreamControlManager *)v5 residentMessageHandler];
  uint64_t v18 = [(HMDCameraStreamControlManager *)v5 sessionID];
  int v19 = [(HMDCameraRemoteStreamControlManager *)v5 profileUniqueIdentifier];
  id v20 = [(HMDCameraStreamControlManager *)v5 workQueue];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __54__HMDCameraRemoteStreamControlManager_negotiateStream__block_invoke;
  v24[3] = &unk_1E6A17A08;
  objc_copyWeak(&v25, (id *)buf);
  [v17 sendMessageWithName:@"kNegotitateRemoteStreamRequestKey" cameraSessionID:v18 payload:v16 target:v19 responseQueue:v20 responseHandler:v24];

  __int16 v21 = [(HMDCameraStreamControlManager *)v5 sessionID];
  [v21 markMilestoneFor:@"SentNegotiateRemoteStreamRequest"];

  uint64_t v22 = [(HMDCameraRemoteStreamControlManager *)v5 streamSession];
  uint64_t v23 = [v22 streamSender];
  [v23 openRelaySession];

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
}

void __54__HMDCameraRemoteStreamControlManager_negotiateStream__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = [WeakRetained streamSession];

    if (v9)
    {
      BOOL v10 = (void *)MEMORY[0x1D9452090]();
      id v11 = v8;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = HMFGetLogIdentifier();
        int v18 = 138543362;
        int v19 = v13;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Received reply for negotiate remote stream session", (uint8_t *)&v18, 0xCu);
      }
      if (v5)
      {
        uint64_t v14 = (void *)MEMORY[0x1D9452090]();
        id v15 = v11;
        int v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v17 = HMFGetLogIdentifier();
          int v18 = 138543618;
          int v19 = v17;
          __int16 v20 = 2112;
          id v21 = v5;
          _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Relayed negotiate remote stream session request to resident failed: %@", (uint8_t *)&v18, 0x16u);
        }
        [v15 _cleanUpStreamSessionWithError:v5];
      }
      else
      {
        [v11 _setParametersSelected:v6];
      }
    }
  }
}

- (void)updateAudioVolume:(id)a3 callback:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v10 = [(HMDCameraRemoteStreamControlManager *)self streamSession];
  v9 = [v10 streamManager];
  [v9 updateAudioVolume:v7 callback:v6];
}

- (void)updateAudioSetting:(unint64_t)a3
{
  id v5 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v7 = [(HMDCameraRemoteStreamControlManager *)self streamSession];
  id v6 = [v7 streamManager];
  [v6 updateAudioSetting:a3];
}

- (NSDictionary)stateDump
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v6 = @"State";
  v2 = [(HMDCameraRemoteStreamControlManager *)self streamSession];
  v3 = [v2 stateDescription];
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return (NSDictionary *)v4;
}

- (NSNumber)aspectRatio
{
  v3 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraRemoteStreamControlManager *)self streamSession];
  id v5 = [v4 streamManager];
  id v6 = [v5 aspectRatio];

  return (NSNumber *)v6;
}

- (unint64_t)audioStreamSetting
{
  v3 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraRemoteStreamControlManager *)self streamSession];
  id v5 = [v4 streamManager];
  unint64_t v6 = [v5 audioStreamSetting];

  return v6;
}

- (NSNumber)slotIdentifier
{
  v3 = [(HMDCameraStreamControlManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraRemoteStreamControlManager *)self streamSession];
  id v5 = [v4 streamManager];
  unint64_t v6 = [v5 slotIdentifier];

  return (NSNumber *)v6;
}

- (HMDCameraRemoteStreamControlManager)initWithSessionID:(id)a3 workQueue:(id)a4 streamSnapshotHandler:(id)a5 delegate:(id)a6 accessory:(id)a7 streamManagementService:(id)a8 profileUniqueIdentifier:(id)a9 residentMessageHandler:(id)a10 streamSession:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  v24 = (HMDCameraResidentMessageHandler *)a10;
  id v25 = (HMDCameraRemoteStreamSession *)a11;
  if (!v17)
  {
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v18)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v19)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v21)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v22)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v23)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v24)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  v26 = v25;
  if (v25)
  {
    v47.receiver = self;
    v47.super_class = (Class)HMDCameraRemoteStreamControlManager;
    v27 = [(HMDCameraStreamControlManager *)&v47 initWithSessionID:v17 workQueue:v18 streamSnapshotHandler:v19 delegate:v20 accessory:v21 streamManagementService:v22 isLocal:0];
    uint64_t v28 = [v23 copy];
    profileUniqueIdentifier = v27->_profileUniqueIdentifier;
    v27->_profileUniqueIdentifier = (NSUUID *)v28;

    v46 = v17;
    uint64_t v30 = v20;
    residentMessageHandler = v27->_residentMessageHandler;
    v27->_residentMessageHandler = v24;
    v32 = v24;

    streamSession = v27->_streamSession;
    v27->_streamSession = v26;
    id v34 = v26;

    v35 = objc_alloc_init(HMDCameraMediaConfigGenerator);
    configGenerator = v27->_configGenerator;
    v27->_configGenerator = v35;

    return v27;
  }
LABEL_17:
  v38 = (HMDCameraRemoteStreamControlManager *)_HMFPreconditionFailure();
  return [(HMDCameraRemoteStreamControlManager *)v38 initWithSessionID:v40 workQueue:v41 streamSnapshotHandler:v42 reachabilityPath:v43 device:v44 delegate:v45 accessory:a9 streamManagementService:a10 remoteCapabilities:a11 profileUniqueIdentifier:v48 residentMessageHandler:v49 remoteAccessDevice:v50 streamPreference:v51];
}

- (HMDCameraRemoteStreamControlManager)initWithSessionID:(id)a3 workQueue:(id)a4 streamSnapshotHandler:(id)a5 reachabilityPath:(unint64_t)a6 device:(id)a7 delegate:(id)a8 accessory:(id)a9 streamManagementService:(id)a10 remoteCapabilities:(id)a11 profileUniqueIdentifier:(id)a12 residentMessageHandler:(id)a13 remoteAccessDevice:(id)a14 streamPreference:(id)a15
{
  id v19 = a3;
  id v20 = a4;
  id v53 = a5;
  v50 = (HMDCameraIDSDeviceConnectionSender *)a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v52 = a11;
  id v24 = a12;
  id v25 = a13;
  id v26 = a14;
  id v27 = a15;
  if (!v19)
  {
    _HMFPreconditionFailure();
    goto LABEL_19;
  }
  if (!v20)
  {
LABEL_19:
    _HMFPreconditionFailure();
    goto LABEL_20;
  }
  if (!v53)
  {
LABEL_20:
    _HMFPreconditionFailure();
    goto LABEL_21;
  }
  if (!a6)
  {
LABEL_21:
    _HMFPreconditionFailure();
    goto LABEL_22;
  }
  if (!v22)
  {
LABEL_22:
    _HMFPreconditionFailure();
    goto LABEL_23;
  }
  if (!v23)
  {
LABEL_23:
    _HMFPreconditionFailure();
    goto LABEL_24;
  }
  if (!v52)
  {
LABEL_24:
    _HMFPreconditionFailure();
    goto LABEL_25;
  }
  if (!v24)
  {
LABEL_25:
    _HMFPreconditionFailure();
    goto LABEL_26;
  }
  if (!v25)
  {
LABEL_26:
    _HMFPreconditionFailure();
    goto LABEL_27;
  }
  if (!v26)
  {
LABEL_27:
    id v42 = (void *)_HMFPreconditionFailure();
    return (HMDCameraRemoteStreamControlManager *)+[HMDCameraRemoteStreamControlManager logCategory];
  }
  uint64_t v28 = v19;
  v29 = v20;
  uint64_t v30 = v27;
  v31 = v24;
  v48 = v22;
  v49 = v23;
  id v44 = v21;
  id v45 = v26;
  if (isWatch() && [v25 isUsingCompanionForRemoteAccessDevice])
  {
    v32 = v25;
    v33 = self;
    id v34 = [[HMDCameraIDSDeviceConnectionReceiver alloc] initWithSessionID:v28 workQueue:v29 delegate:self];
  }
  else
  {
    v32 = v25;
    v35 = [HMDCameraIDSSessionInviterDeviceVerifier alloc];
    v36 = [v28 sessionID];
    v37 = [(HMDCameraIDSSessionInviterDeviceVerifier *)v35 initWithSessionID:v36 expectedInviter:v26];

    v33 = self;
    id v34 = [[HMDCameraIDSSessionReceiver alloc] initWithSessionID:v28 workQueue:v29 sessionInviterDeviceVerifier:v37 delegate:self];
  }
  v38 = v50;
  if (v50) {
    v38 = [[HMDCameraIDSDeviceConnectionSender alloc] initWithSessionID:v28 workQueue:v29 device:v50 delegate:v33];
  }
  SEL v39 = v28;
  id v40 = [[HMDCameraRemoteStreamSession alloc] initWithSessionID:v28 reachabilityPath:a6 streamSender:v38 streamReceiver:v34 remoteCapabilities:v52 streamPreference:v30];
  objc_super v47 = [(HMDCameraRemoteStreamControlManager *)v33 initWithSessionID:v39 workQueue:v29 streamSnapshotHandler:v53 delegate:v44 accessory:v48 streamManagementService:v49 profileUniqueIdentifier:v31 residentMessageHandler:v32 streamSession:v40];

  return v47;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t28 != -1) {
    dispatch_once(&logCategory__hmf_once_t28, &__block_literal_global_50);
  }
  v2 = (void *)logCategory__hmf_once_v29;
  return v2;
}

uint64_t __50__HMDCameraRemoteStreamControlManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v29;
  logCategory__hmf_once_v29 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end