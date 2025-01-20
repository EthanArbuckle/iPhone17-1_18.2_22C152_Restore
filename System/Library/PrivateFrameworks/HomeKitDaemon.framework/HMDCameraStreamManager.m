@interface HMDCameraStreamManager
+ (id)logCategory;
- (AVCRemoteVideoClient)avcRemoteVideo;
- (HMDAudioStreamInterface)audioStreamInterface;
- (HMDCameraStreamManager)initWithSessionID:(id)a3 streamSnapshotHandler:(id)a4 workQueue:(id)a5 delegate:(id)a6 localVideoNetworkConfig:(id)a7 localAudioNetworkConfig:(id)a8 sessionHandler:(id)a9;
- (HMDCameraStreamManager)initWithSessionID:(id)a3 streamSnapshotHandler:(id)a4 workQueue:(id)a5 delegate:(id)a6 videoStreamInterface:(id)a7 audioStreamInterface:(id)a8;
- (HMDCameraStreamManagerDelegate)delegate;
- (HMDCameraStreamSessionID)sessionID;
- (HMDCameraStreamSnapshotHandler)streamSnapshotHandler;
- (HMDVideoStreamInterface)videoStreamInterface;
- (NSNumber)aspectRatio;
- (NSNumber)slotIdentifier;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (unint64_t)audioStreamSetting;
- (void)_callConfigurationUpdated;
- (void)_callNetworkDeteriorated;
- (void)_callNetworkImproved;
- (void)_callReceivedFirstFrame;
- (void)_callRelayStarted;
- (void)_callStreamStarted;
- (void)_callStreamStoppedWithError:(id)a3;
- (void)remoteVideoClient:(id)a3 remoteVideoAttributesDidChange:(id)a4;
- (void)remoteVideoClientDidReceiveFirstFrame:(id)a3;
- (void)remoteVideoClientDidReceiveLastFrame:(id)a3;
- (void)remoteVideoServerDidDie:(id)a3;
- (void)setAspectRatio:(id)a3;
- (void)setAvcRemoteVideo:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSlotIdentifier:(id)a3;
- (void)startStreamWithVideoConfig:(id)a3 audioConfig:(id)a4;
- (void)stopStream;
- (void)updateAudioSetting:(unint64_t)a3;
- (void)updateAudioVolume:(id)a3 callback:(id)a4;
- (void)updateReconfigurationMode:(BOOL)a3;
- (void)updateStreamConfiguration:(id)a3;
- (void)videoStream:(id)a3 didStart:(id)a4;
- (void)videoStream:(id)a3 didStop:(id)a4;
- (void)videoStreamDidNetworkDeteriorate:(id)a3;
- (void)videoStreamDidNetworkImprove:(id)a3;
- (void)videoStreamDidUpdateConfiguration:(id)a3;
@end

@implementation HMDCameraStreamManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avcRemoteVideo, 0);
  objc_storeStrong((id *)&self->_streamSnapshotHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_audioStreamInterface, 0);
  objc_storeStrong((id *)&self->_videoStreamInterface, 0);
  objc_storeStrong((id *)&self->_aspectRatio, 0);
  objc_storeStrong((id *)&self->_slotIdentifier, 0);
}

- (void)setAvcRemoteVideo:(id)a3
{
}

- (AVCRemoteVideoClient)avcRemoteVideo
{
  return (AVCRemoteVideoClient *)objc_getProperty(self, a2, 72, 1);
}

- (HMDCameraStreamSnapshotHandler)streamSnapshotHandler
{
  return (HMDCameraStreamSnapshotHandler *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDCameraStreamManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCameraStreamManagerDelegate *)WeakRetained;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (HMDCameraStreamSessionID)sessionID
{
  return (HMDCameraStreamSessionID *)objc_getProperty(self, a2, 40, 1);
}

- (HMDAudioStreamInterface)audioStreamInterface
{
  return (HMDAudioStreamInterface *)objc_getProperty(self, a2, 32, 1);
}

- (HMDVideoStreamInterface)videoStreamInterface
{
  return (HMDVideoStreamInterface *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAspectRatio:(id)a3
{
}

- (NSNumber)aspectRatio
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSlotIdentifier:(id)a3
{
}

- (NSNumber)slotIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)remoteVideoServerDidDie:(id)a3
{
  v4 = [(HMDCameraStreamManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__HMDCameraStreamManager_remoteVideoServerDidDie___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __50__HMDCameraStreamManager_remoteVideoServerDidDie___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Video server has died", (uint8_t *)&v6, 0xCu);
  }
}

- (void)remoteVideoClientDidReceiveLastFrame:(id)a3
{
  v4 = [(HMDCameraStreamManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__HMDCameraStreamManager_remoteVideoClientDidReceiveLastFrame___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __63__HMDCameraStreamManager_remoteVideoClientDidReceiveLastFrame___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Last frame has been received", (uint8_t *)&v6, 0xCu);
  }
}

- (void)remoteVideoClient:(id)a3 remoteVideoAttributesDidChange:(id)a4
{
  id v5 = a4;
  int v6 = [(HMDCameraStreamManager *)self workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __75__HMDCameraStreamManager_remoteVideoClient_remoteVideoAttributesDidChange___block_invoke;
  v8[3] = &unk_264A2F820;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __75__HMDCameraStreamManager_remoteVideoClient_remoteVideoAttributesDidChange___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Remote video attributes did change: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)remoteVideoClientDidReceiveFirstFrame:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCameraStreamManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__HMDCameraStreamManager_remoteVideoClientDidReceiveFirstFrame___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __64__HMDCameraStreamManager_remoteVideoClientDidReceiveFirstFrame___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v15 = 138543362;
    v16 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@First frame has been received", (uint8_t *)&v15, 0xCu);
  }
  id v6 = [*(id *)(a1 + 40) remoteVideoAttributes];
  [v6 ratio];
  double v8 = v7;
  double v10 = v9;

  uint64_t v11 = [NSNumber numberWithDouble:v8 / v10];
  [*(id *)(a1 + 32) setAspectRatio:v11];

  v12 = [*(id *)(a1 + 40) slotForMode:0];
  [*(id *)(a1 + 32) setSlotIdentifier:v12];

  [*(id *)(a1 + 32) _callReceivedFirstFrame];
  v13 = [*(id *)(a1 + 32) streamSnapshotHandler];
  v14 = [*(id *)(a1 + 32) videoStreamInterface];
  [v13 addVideoStreamInterface:v14];
}

- (void)videoStreamDidUpdateConfiguration:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraStreamManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  double v7 = self;
  double v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    double v9 = HMFGetLogIdentifier();
    int v10 = 138543362;
    uint64_t v11 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Video stream's configuration update complete", (uint8_t *)&v10, 0xCu);
  }
  [(HMDCameraStreamManager *)v7 _callConfigurationUpdated];
}

- (void)videoStreamDidNetworkDeteriorate:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraStreamManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  double v7 = self;
  double v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    double v9 = HMFGetLogIdentifier();
    int v10 = 138543362;
    uint64_t v11 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Video stream's network has deteriorated", (uint8_t *)&v10, 0xCu);
  }
  [(HMDCameraStreamManager *)v7 _callNetworkDeteriorated];
}

- (void)videoStreamDidNetworkImprove:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraStreamManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  double v7 = self;
  double v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    double v9 = HMFGetLogIdentifier();
    int v10 = 138543362;
    uint64_t v11 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Video stream's network has improved", (uint8_t *)&v10, 0xCu);
  }
  [(HMDCameraStreamManager *)v7 _callNetworkImproved];
}

- (void)videoStream:(id)a3 didStop:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(HMDCameraStreamManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  double v9 = (void *)MEMORY[0x230FBD990]();
  int v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    int v13 = 138543618;
    v14 = v12;
    __int16 v15 = 2114;
    id v16 = v7;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Video stream session has stopped with error %{public}@", (uint8_t *)&v13, 0x16u);
  }
  [(HMDCameraStreamManager *)v10 _callStreamStoppedWithError:v7];
}

- (void)videoStream:(id)a3 didStart:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(HMDCameraStreamManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  double v9 = (void *)MEMORY[0x230FBD990]();
  int v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    int v38 = 138543362;
    v39 = v12;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Synchronizing video and audio streams", (uint8_t *)&v38, 0xCu);
  }
  int v13 = [(HMDCameraStreamManager *)v10 audioStreamInterface];
  v14 = [(HMDCameraStreamManager *)v10 videoStreamInterface];
  __int16 v15 = [v14 streamToken];
  objc_msgSend(v13, "startSynchronizationWithVideoStreamToken:", objc_msgSend(v15, "integerValue"));

  id v16 = (void *)MEMORY[0x230FBD990]();
  uint64_t v17 = v10;
  v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = HMFGetLogIdentifier();
    v20 = [(HMDCameraStreamManager *)v17 videoStreamInterface];
    v21 = [v20 streamToken];
    uint64_t v22 = [v21 unsignedIntegerValue];
    int v38 = 138543618;
    v39 = v19;
    __int16 v40 = 2048;
    uint64_t v41 = v22;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Creating AVCRemoteVideoClient with stream token: %lu", (uint8_t *)&v38, 0x16u);
  }
  id v23 = objc_alloc(MEMORY[0x263F20FC0]);
  v24 = [(HMDCameraStreamManager *)v17 videoStreamInterface];
  v25 = [v24 streamToken];
  v26 = objc_msgSend(v23, "initWithStreamToken:delegate:", objc_msgSend(v25, "unsignedIntegerValue"), v17);
  [(HMDCameraStreamManager *)v17 setAvcRemoteVideo:v26];

  v27 = [(HMDCameraStreamManager *)v17 avcRemoteVideo];
  v28 = [v27 slotForMode:0];
  [(HMDCameraStreamManager *)v17 setSlotIdentifier:v28];

  v29 = (void *)MEMORY[0x230FBD990]();
  v30 = v17;
  v31 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    v32 = HMFGetLogIdentifier();
    v33 = [(HMDCameraStreamManager *)v30 slotIdentifier];
    int v38 = 138543618;
    v39 = v32;
    __int16 v40 = 2112;
    uint64_t v41 = (uint64_t)v33;
    _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Updated slot identifier to %@", (uint8_t *)&v38, 0x16u);
  }
  v34 = (void *)MEMORY[0x230FBD990]();
  v35 = v30;
  v36 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    v37 = HMFGetLogIdentifier();
    int v38 = 138543362;
    v39 = v37;
    _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_INFO, "%{public}@Video stream has started, waiting for the first frame to arrive", (uint8_t *)&v38, 0xCu);
  }
  [(HMDCameraStreamManager *)v35 _callStreamStarted];
}

- (void)_callConfigurationUpdated
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraStreamManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    int v10 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Calling delegate streamManagerDidUpdateConfiguration", (uint8_t *)&v9, 0xCu);
  }
  double v8 = [(HMDCameraStreamManager *)v5 delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 streamManagerDidUpdateConfiguration:v5];
  }
}

- (void)_callNetworkDeteriorated
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraStreamManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    int v10 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Calling delegate streamManagerDidNetworkDeteriorate", (uint8_t *)&v9, 0xCu);
  }
  double v8 = [(HMDCameraStreamManager *)v5 delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 streamManagerDidNetworkDeteriorate:v5];
  }
}

- (void)_callNetworkImproved
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraStreamManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    int v10 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Calling delegate streamManagerDidNetworkImprove", (uint8_t *)&v9, 0xCu);
  }
  double v8 = [(HMDCameraStreamManager *)v5 delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 streamManagerDidNetworkImprove:v5];
  }
}

- (void)_callStreamStoppedWithError:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraStreamManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  double v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = HMFGetLogIdentifier();
    int v11 = 138543362;
    uint64_t v12 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Calling delegate streamManagerDidStopStream", (uint8_t *)&v11, 0xCu);
  }
  int v10 = [(HMDCameraStreamManager *)v7 delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 streamManagerDidStopStream:v7 error:v4];
  }
}

- (void)_callRelayStarted
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraStreamManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    int v10 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Calling delegate streamManagerDidStartRelay:", (uint8_t *)&v9, 0xCu);
  }
  double v8 = [(HMDCameraStreamManager *)v5 delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 streamManagerDidStartRelay:v5];
  }
}

- (void)_callReceivedFirstFrame
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraStreamManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    int v10 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Calling delegate streamManagerDidReceiveFirstFrame:", (uint8_t *)&v9, 0xCu);
  }
  double v8 = [(HMDCameraStreamManager *)v5 delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 streamManagerDidReceiveFirstFrame:v5];
  }
}

- (void)_callStreamStarted
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraStreamManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    int v10 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Calling delegate streamManagerDidStartStream", (uint8_t *)&v9, 0xCu);
  }
  double v8 = [(HMDCameraStreamManager *)v5 delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 streamManagerDidStartStream:v5];
  }
}

- (void)updateAudioVolume:(id)a3 callback:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(HMDCameraStreamManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(HMDCameraStreamManager *)self audioStreamInterface];
  [v9 updateAudioVolume:v7 callback:v6];
}

- (void)updateAudioSetting:(unint64_t)a3
{
  id v5 = [(HMDCameraStreamManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraStreamManager *)self audioStreamInterface];
  [v6 updateAudioSetting:a3];
}

- (void)stopStream
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraStreamManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v13 = 138543362;
    v14 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Stopping stream", (uint8_t *)&v13, 0xCu);
  }
  double v8 = [(HMDCameraStreamManager *)v5 streamSnapshotHandler];
  id v9 = [(HMDCameraStreamManager *)v5 videoStreamInterface];
  [v8 removeVideoStreamInterface:v9];

  int v10 = [(HMDCameraStreamManager *)v5 audioStreamInterface];
  uint64_t v11 = [v10 state];

  if (v11 == 2)
  {
    uint64_t v12 = [(HMDCameraStreamManager *)v5 audioStreamInterface];
    [v12 stopStream];
  }
}

- (void)updateStreamConfiguration:(id)a3
{
  v22[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraStreamManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraStreamManager *)self videoStreamInterface];
  [v6 updateStreamConfiguration:v4];

  v21[0] = @"ConfigResolution";
  id v7 = NSNumber;
  double v8 = [v4 video];
  unint64_t v9 = [v8 videoResolution];
  if (v9 < 0xA) {
    uint64_t v10 = v9 + 1;
  }
  else {
    uint64_t v10 = -1;
  }
  uint64_t v11 = [v7 numberWithUnsignedInteger:v10];
  v22[0] = v11;
  v21[1] = @"ReconfigTimestamp";
  uint64_t v12 = +[HMDCameraSessionID uptimeNumberInMilliseconds];
  v22[1] = v12;
  v21[2] = @"ConfigRXMinBitrate";
  int v13 = NSNumber;
  v14 = [v4 video];
  uint64_t v15 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "rxMinBitrate"));
  v22[2] = v15;
  v21[3] = @"ConfigRXMaxBitrate";
  id v16 = NSNumber;
  uint64_t v17 = [v4 video];

  v18 = objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "rxMaxBitrate"));
  v22[3] = v18;
  v19 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];

  v20 = [(HMDCameraStreamManager *)self sessionID];
  [v20 addParameterFor:@"Reconfigurations" value:v19];
}

- (void)updateReconfigurationMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HMDCameraStreamManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraStreamManager *)self videoStreamInterface];
  [v6 updateReconfigurationMode:v3];
}

- (void)startStreamWithVideoConfig:(id)a3 audioConfig:(id)a4
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(HMDCameraStreamManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  unint64_t v9 = [(HMDCameraStreamManager *)self videoStreamInterface];
  uint64_t v10 = [v9 sessionHandler];

  if ([v10 conformsToProtocol:&unk_26E4C4EC8]) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  int v13 = (void *)MEMORY[0x230FBD990]();
  v14 = self;
  uint64_t v15 = HMFGetOSLogHandle();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  v75 = v6;
  v76 = v12;
  if (v12)
  {
    uint64_t v17 = v7;
    if (v16)
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v80 = v18;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Starting packet relay for remote stream", buf, 0xCu);
    }
    v19 = [HMDCameraNetworkConfig alloc];
    v20 = [v6 remoteAddress];
    v21 = [v20 ip];
    uint64_t v22 = [v6 remoteAddress];
    uint64_t v23 = [v22 isIPv6];
    v73 = v14;
    v24 = v6;
    v25 = NSNumber;
    v26 = [v24 remoteAddress];
    v27 = objc_msgSend(v25, "numberWithUnsignedShort:", objc_msgSend(v26, "port"));
    v28 = [(HMDCameraNetworkConfig *)v19 initWithAddress:v21 ipv6:v23 rtpPort:v27];

    v29 = [HMDCameraNetworkConfig alloc];
    v30 = [v17 remoteAddress];
    v31 = [v30 ip];
    v32 = [v17 remoteAddress];
    uint64_t v33 = [v32 isIPv6];
    v34 = NSNumber;
    v35 = [v17 remoteAddress];
    v36 = objc_msgSend(v34, "numberWithUnsignedShort:", objc_msgSend(v35, "port"));
    v37 = [(HMDCameraNetworkConfig *)v29 initWithAddress:v31 ipv6:v33 rtpPort:v36];

    int v38 = v17;
    v39 = [(HMDCameraStreamManager *)v73 videoStreamInterface];
    uint64_t v40 = [v39 localRTPSocket];
    uint64_t v41 = [v24 deviceLocalSSRC];
    uint64_t v42 = [(HMDCameraStreamManager *)v73 audioStreamInterface];
    uint64_t v43 = [v42 localRTPSocket];
    uint64_t v44 = [v17 deviceLocalSSRC];
    v45 = v76;
    [v76 startPacketRelayWithVideoSocket:v40 videoNetworkConfig:v28 cameraVideoSSRC:v41 audioSocket:v43 audioNetworkConfig:v37 cameraAudioSSRC:v44];

    [(HMDCameraStreamManager *)v73 _callRelayStarted];
  }
  else
  {
    if (v16)
    {
      v46 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v80 = v46;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Starting local stream", buf, 0xCu);
    }
    v47 = [(HMDCameraStreamManager *)v14 videoStreamInterface];
    [v47 startStreamWithConfig:v6];

    v48 = [(HMDCameraStreamManager *)v14 audioStreamInterface];
    [v48 startStreamWithConfig:v7];

    v49 = [v7 audio];
    unint64_t v50 = [v49 codecType] - 4;
    id v72 = v7;
    if (v50 > 6)
    {
      uint64_t v51 = 0;
      uint64_t v52 = 0;
    }
    else
    {
      uint64_t v51 = qword_2303E4278[v50];
      uint64_t v52 = qword_2303E42B0[v50];
    }

    uint64_t v53 = [v6 SRTPCipherSuite];
    uint64_t v54 = 1;
    if (v53 != 5) {
      uint64_t v54 = -1;
    }
    if (v53 == 3) {
      uint64_t v55 = 0;
    }
    else {
      uint64_t v55 = v54;
    }
    v77[0] = @"ConfigResolution";
    v56 = NSNumber;
    v74 = [v6 video];
    unint64_t v57 = [v74 videoResolution];
    if (v57 < 0xA) {
      uint64_t v58 = v57 + 1;
    }
    else {
      uint64_t v58 = -1;
    }
    v71 = [v56 numberWithUnsignedInteger:v58];
    v78[0] = v71;
    v77[1] = @"ConfigFramerate";
    v59 = NSNumber;
    v70 = [v6 video];
    v60 = objc_msgSend(v59, "numberWithUnsignedInteger:", objc_msgSend(v70, "framerate"));
    v78[1] = v60;
    v77[2] = @"ConfigAudioCodec";
    v61 = [NSNumber numberWithUnsignedInteger:v52];
    v78[2] = v61;
    v77[3] = @"ConfigSampleRate";
    v62 = [NSNumber numberWithUnsignedInteger:v51];
    v78[3] = v62;
    v77[4] = @"ConfigCryptoSuite";
    v63 = [NSNumber numberWithUnsignedInteger:v55];
    v78[4] = v63;
    v77[5] = @"ConfigRXMinBitrate";
    v64 = NSNumber;
    v65 = [v6 video];
    v66 = objc_msgSend(v64, "numberWithUnsignedInteger:", objc_msgSend(v65, "rxMinBitrate"));
    v78[5] = v66;
    v77[6] = @"ConfigRXMaxBitrate";
    v67 = NSNumber;
    v68 = [v6 video];
    v69 = objc_msgSend(v67, "numberWithUnsignedInteger:", objc_msgSend(v68, "rxMaxBitrate"));
    v78[6] = v69;
    v28 = [NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:7];

    v37 = [(HMDCameraStreamManager *)v14 sessionID];
    [(HMDCameraNetworkConfig *)v37 setParameterFor:@"InitialConfiguration" value:v28];
    int v38 = v72;
    v45 = 0;
  }
}

- (unint64_t)audioStreamSetting
{
  BOOL v3 = [(HMDCameraStreamManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraStreamManager *)self audioStreamInterface];
  unint64_t v5 = [v4 audioStreamSetting];

  return v5;
}

- (id)logIdentifier
{
  v2 = [(HMDCameraStreamManager *)self sessionID];
  BOOL v3 = [v2 description];

  return v3;
}

- (HMDCameraStreamManager)initWithSessionID:(id)a3 streamSnapshotHandler:(id)a4 workQueue:(id)a5 delegate:(id)a6 videoStreamInterface:(id)a7 audioStreamInterface:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id obj = a7;
  id v19 = a7;
  id v34 = a8;
  id v20 = a8;
  if (!v15)
  {
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v16)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v17)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v18)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v19)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  v21 = v20;
  if (!v20)
  {
LABEL_15:
    v25 = (HMDCameraStreamManager *)_HMFPreconditionFailure();
    return [(HMDCameraStreamManager *)v25 initWithSessionID:v27 streamSnapshotHandler:v28 workQueue:v29 delegate:v30 localVideoNetworkConfig:v31 localAudioNetworkConfig:v32 sessionHandler:v36];
  }
  v35.receiver = self;
  v35.super_class = (Class)HMDCameraStreamManager;
  uint64_t v22 = [(HMDCameraStreamManager *)&v35 init];
  uint64_t v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_sessionID, a3);
    objc_storeStrong((id *)&v23->_streamSnapshotHandler, a4);
    objc_storeStrong((id *)&v23->_workQueue, a5);
    objc_storeWeak((id *)&v23->_delegate, v18);
    objc_storeStrong((id *)&v23->_videoStreamInterface, obj);
    objc_storeStrong((id *)&v23->_audioStreamInterface, v34);
  }

  return v23;
}

- (HMDCameraStreamManager)initWithSessionID:(id)a3 streamSnapshotHandler:(id)a4 workQueue:(id)a5 delegate:(id)a6 localVideoNetworkConfig:(id)a7 localAudioNetworkConfig:(id)a8 sessionHandler:(id)a9
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (!v15)
  {
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  if (!v16)
  {
LABEL_17:
    _HMFPreconditionFailure();
    goto LABEL_18;
  }
  if (!v17)
  {
LABEL_18:
    _HMFPreconditionFailure();
LABEL_19:
    _HMFPreconditionFailure();
  }
  if (!v18) {
    goto LABEL_19;
  }
  uint64_t v22 = v21;
  uint64_t v23 = [[HMDVideoStreamInterface alloc] initWithSessionID:v15 workQueue:v17 delegate:self sessionHandler:v21 localNetworkConfig:v19];
  if (v23)
  {
    id v34 = v20;
    v24 = [[HMDAudioStreamInterface alloc] initWithSessionID:v15 workQueue:v17 delegate:self sessionHandler:v22 localNetworkConfig:v20];
    if (v24)
    {
      v25 = [(HMDCameraStreamManager *)self initWithSessionID:v15 streamSnapshotHandler:v16 workQueue:v17 delegate:v18 videoStreamInterface:v23 audioStreamInterface:v24];
      SEL v26 = v25;
    }
    else
    {
      contexta = (void *)MEMORY[0x230FBD990]();
      v25 = self;
      id v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        id v31 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v37 = v31;
        _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to create audio stream interface", buf, 0xCu);
      }
      SEL v26 = 0;
    }

    id v20 = v34;
  }
  else
  {
    context = (void *)MEMORY[0x230FBD990]();
    v25 = self;
    id v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v28 = v35 = v20;
      *(_DWORD *)buf = 138543362;
      v37 = v28;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to create video stream interface", buf, 0xCu);

      id v20 = v35;
    }

    SEL v26 = 0;
  }

  return v26;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_22707 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_22707, &__block_literal_global_22708);
  }
  v2 = (void *)logCategory__hmf_once_v3_22709;
  return v2;
}

void __37__HMDCameraStreamManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v3_22709;
  logCategory__hmf_once_v3_22709 = v0;
}

@end