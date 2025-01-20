@interface HMDCameraStreamControlMessageHandler
+ (BOOL)_isNegotiateMessage:(id)a3;
+ (BOOL)_isReconfigureMessage:(id)a3;
+ (BOOL)_isRemoteSetupMessage:(id)a3;
+ (BOOL)_isSetAudioStreamSettingMessage:(id)a3;
+ (BOOL)_isSetAudioVolumeMessage:(id)a3;
+ (BOOL)_isStartMessage:(id)a3;
+ (BOOL)_isStopMessage:(id)a3;
+ (BOOL)_isUpdateMaximumVideoResolutionQualityMessage:(id)a3;
+ (id)logCategory;
- (BOOL)_shouldHandleNegotiateMessage:(id)a3 accessoryReachable:(BOOL)a4;
- (BOOL)_shouldStopStreamSessionForProcessInfo:(id)a3;
- (BOOL)hasStreamSession;
- (BOOL)hasStreamSessionShowingOnCurrentDevice;
- (BOOL)isEqual:(id)a3;
- (HMDCameraMetricsMilestone)negotiationMilestone;
- (HMDCameraResidentMessageHandler)residentMessageHandler;
- (HMDCameraStreamControlMessageHandler)initWithWorkQueue:(id)a3 streamSnapshotHandler:(id)a4 accessory:(id)a5 streamManagementService:(id)a6 profileUniqueIdentifier:(id)a7 networkMonitor:(id)a8;
- (HMDCameraStreamControlMessageHandler)initWithWorkQueue:(id)a3 streamSnapshotHandler:(id)a4 accessory:(id)a5 streamManagementService:(id)a6 profileUniqueIdentifier:(id)a7 networkMonitor:(id)a8 residentMessageHandler:(id)a9 dataSource:(id)a10;
- (HMDCameraStreamControlMessageHandlerDataSource)dataSource;
- (HMDCameraStreamManagerSession)streamSession;
- (HMDCameraStreamSnapshotHandler)streamSnapshotHandler;
- (HMDCameraSupportedConfigurationCache)supportedConfigCache;
- (HMDDynamicActivityAttributionPublisher)dynamicActivityAttributionPublisher;
- (HMDHAPAccessory)accessory;
- (HMDService)streamManagementService;
- (HMFMessageDispatcher)messageDispatcher;
- (HMFNetMonitor)networkMonitor;
- (NSDictionary)stateDump;
- (NSString)description;
- (NSString)streamSessionID;
- (NSUUID)profileUniqueIdentifier;
- (NSUUID)uniqueIdentifier;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (unint64_t)hash;
- (void)_attributeMicrophoneUsageToApplicationBundleIdentifier:(id)a3;
- (void)_handleNegotiateMessage:(id)a3;
- (void)_handleReconfigureMessage:(id)a3;
- (void)_handleRemoteSetupMessage:(id)a3;
- (void)_handleSetAudioState:(id)a3;
- (void)_handleSetAudioVolume:(id)a3;
- (void)_handleStartMessage:(id)a3;
- (void)_handleStopMessage:(id)a3;
- (void)_handleUpdateMaximumVideoResolutionQualityMessage:(id)a3;
- (void)_resetStreamSession:(id)a3;
- (void)_respondToLocalNegotiateStreamMessage:(id)a3;
- (void)_sendStreamStoppedMessageWithError:(id)a3;
- (void)_sendStreamStoppedRemoteNotificationWithError:(id)a3;
- (void)_stopStreamWithError:(id)a3;
- (void)configureWithMessageDispatcher:(id)a3;
- (void)dealloc;
- (void)handleAccessoryUnconfigured:(id)a3;
- (void)handleCameraSettingsDidChangeNotification:(id)a3;
- (void)handleConnectionDeactivatedNotification:(id)a3;
- (void)handleMessage:(id)a3;
- (void)handleProcessStateChange:(id)a3;
- (void)setAudioVolume:(id)a3 callback:(id)a4;
- (void)setMessageDispatcher:(id)a3;
- (void)setNegotiationMilestone:(id)a3;
- (void)setStreamSession:(id)a3;
- (void)streamControlManager:(id)a3 didNegotiateStreamWithSelectedParameters:(id)a4;
- (void)streamControlManager:(id)a3 didStopStreamWithSessionID:(id)a4 error:(id)a5;
- (void)streamControlManagerDidReceiveFirstFrame:(id)a3;
- (void)streamControlManagerDidReconfigureStream:(id)a3;
- (void)streamControlManagerDidSetUpRemoteConnection:(id)a3;
- (void)streamControlManagerDidStartStream:(id)a3;
- (void)takeOwnershipOfStreamUsingMessage:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDCameraStreamControlMessageHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_dynamicActivityAttributionPublisher, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong((id *)&self->_streamSnapshotHandler, 0);
  objc_storeStrong((id *)&self->_supportedConfigCache, 0);
  objc_storeStrong((id *)&self->_profileUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_residentMessageHandler, 0);
  objc_storeStrong((id *)&self->_negotiationMilestone, 0);
  objc_storeStrong((id *)&self->_streamManagementService, 0);
  objc_storeStrong((id *)&self->_streamSession, 0);
}

- (HMDCameraStreamControlMessageHandlerDataSource)dataSource
{
  return (HMDCameraStreamControlMessageHandlerDataSource *)objc_getProperty(self, a2, 112, 1);
}

- (HMDDynamicActivityAttributionPublisher)dynamicActivityAttributionPublisher
{
  return (HMDDynamicActivityAttributionPublisher *)objc_getProperty(self, a2, 104, 1);
}

- (void)setMessageDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 96, 1);
}

- (HMFNetMonitor)networkMonitor
{
  return (HMFNetMonitor *)objc_getProperty(self, a2, 88, 1);
}

- (HMDCameraStreamSnapshotHandler)streamSnapshotHandler
{
  return (HMDCameraStreamSnapshotHandler *)objc_getProperty(self, a2, 80, 1);
}

- (HMDCameraSupportedConfigurationCache)supportedConfigCache
{
  return (HMDCameraSupportedConfigurationCache *)objc_getProperty(self, a2, 72, 1);
}

- (NSUUID)profileUniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (HMDHAPAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (HMDCameraResidentMessageHandler)residentMessageHandler
{
  return (HMDCameraResidentMessageHandler *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNegotiationMilestone:(id)a3
{
}

- (HMDCameraMetricsMilestone)negotiationMilestone
{
  return (HMDCameraMetricsMilestone *)objc_getProperty(self, a2, 24, 1);
}

- (HMDService)streamManagementService
{
  return (HMDService *)objc_getProperty(self, a2, 16, 1);
}

- (void)handleConnectionDeactivatedNotification:(id)a3
{
  v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"connection"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [(HMDCameraStreamControlMessageHandler *)self workQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __80__HMDCameraStreamControlMessageHandler_handleConnectionDeactivatedNotification___block_invoke;
    v9[3] = &unk_264A2F820;
    v9[4] = self;
    id v10 = v7;
    dispatch_async(v8, v9);
  }
}

void __80__HMDCameraStreamControlMessageHandler_handleConnectionDeactivatedNotification___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) streamSession];
  v3 = [v2 streamClientConnection];
  int v4 = [v3 isEqual:*(void *)(a1 + 40)];

  if (v4)
  {
    v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      int v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Stopping stream because client has deactivated", (uint8_t *)&v11, 0xCu);
    }
    v9 = *(void **)(a1 + 32);
    id v10 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1048];
    [v9 _stopStreamWithError:v10];
  }
}

- (void)handleProcessStateChange:(id)a3
{
  int v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"processInfo"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [(HMDCameraStreamControlMessageHandler *)self workQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __65__HMDCameraStreamControlMessageHandler_handleProcessStateChange___block_invoke;
    v9[3] = &unk_264A2F820;
    v9[4] = self;
    id v10 = v7;
    dispatch_async(v8, v9);
  }
}

void __65__HMDCameraStreamControlMessageHandler_handleProcessStateChange___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) streamSession];
  v3 = [v2 streamClientConnection];
  int v4 = [v3 processInfo];
  int v5 = [v4 isEqual:*(void *)(a1 + 40)];

  if (v5
    && [*(id *)(a1 + 32) _shouldStopStreamSessionForProcessInfo:*(void *)(a1 + 40)])
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 32);
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      int v12 = 138543362;
      uint64_t v13 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Stopping stream because client is no longer in foreground", (uint8_t *)&v12, 0xCu);
    }
    id v10 = *(void **)(a1 + 32);
    int v11 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1048];
    [v10 _stopStreamWithError:v11];
  }
}

- (void)handleAccessoryUnconfigured:(id)a3
{
  int v4 = [(HMDCameraStreamControlMessageHandler *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__HMDCameraStreamControlMessageHandler_handleAccessoryUnconfigured___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __68__HMDCameraStreamControlMessageHandler_handleAccessoryUnconfigured___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) streamSession];
  v3 = [v2 streamControlManager];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    int v5 = *(void **)(a1 + 32);
    id v6 = [MEMORY[0x263F087E8] hmErrorWithCode:4];
    [v5 _stopStreamWithError:v6];
  }
}

- (void)handleCameraSettingsDidChangeNotification:(id)a3
{
  int v4 = [(HMDCameraStreamControlMessageHandler *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__HMDCameraStreamControlMessageHandler_handleCameraSettingsDidChangeNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __82__HMDCameraStreamControlMessageHandler_handleCameraSettingsDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) accessory];
  v3 = [v2 cameraProfiles];
  int v4 = [v3 anyObject];
  int v5 = [v4 currentSettings];

  if (v5)
  {
    [v5 currentAccessMode];
    if ((HMIsStreamingAllowedForCameraAccessMode() & 1) == 0)
    {
      id v6 = *(void **)(a1 + 32);
      id v7 = [MEMORY[0x263F087E8] hmErrorWithCode:10];
      [v6 _stopStreamWithError:v7];
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      uint64_t v13 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Camera profile settings are not initialized, skipping cancelling pending stream requests", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (unint64_t)hash
{
  v2 = [(HMDCameraStreamControlMessageHandler *)self uniqueIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v5 = v4;
  }
  else {
    int v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    id v7 = [(HMDCameraStreamControlMessageHandler *)self uniqueIdentifier];
    v8 = [v6 uniqueIdentifier];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)_resetStreamSession:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v13 = 138543618;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Resetting the current stream session with error: %@", (uint8_t *)&v13, 0x16u);
  }
  char v9 = [(HMDCameraStreamControlMessageHandler *)v6 streamSession];
  id v10 = [v9 streamControlManager];
  int v11 = [v10 streamMetrics];
  [v11 setError:v4];

  [(HMDCameraStreamControlMessageHandler *)v6 setStreamSession:0];
  int v12 = [(HMDCameraStreamControlMessageHandler *)v6 dynamicActivityAttributionPublisher];
  [v12 setCurrentAttributionKey:0 andApp:0];
}

- (void)_sendStreamStoppedRemoteNotificationWithError:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    char v9 = [(HMDCameraStreamControlMessageHandler *)v6 streamSession];
    id v10 = [v9 destinationID];
    int v29 = 138543618;
    v30 = v8;
    __int16 v31 = 2112;
    v32 = v10;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Sending stream stopped notification to %@", (uint8_t *)&v29, 0x16u);
  }
  int v11 = [(HMDCameraStreamControlMessageHandler *)v6 accessory];
  int v12 = [v11 home];
  int v13 = [v12 homeManager];

  if (v13)
  {
    uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
    __int16 v15 = [(HMDCameraStreamControlMessageHandler *)v6 streamSession];
    id v16 = [v15 sessionID];
    uint64_t v17 = [v16 sessionID];
    [v14 setObject:v17 forKeyedSubscript:@"kCameraSessionID"];

    if (v4)
    {
      v18 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
      [v14 setObject:v18 forKeyedSubscript:@"kCameraSessionError"];
    }
    v19 = [MEMORY[0x263F42590] internalMessageWithName:@"kStreamStoppedRemoteNotificationKey" messagePayload:v14];
    [v19 setQualityOfService:33];
    v20 = (void *)[v19 copy];
    v21 = [(HMDCameraStreamControlMessageHandler *)v6 profileUniqueIdentifier];
    v22 = [(HMDCameraStreamControlMessageHandler *)v6 streamSession];
    v23 = [v22 destinationID];
    v24 = [(HMDCameraStreamControlMessageHandler *)v6 workQueue];
    [v13 sendSecureMessage:v20 target:v21 userID:0 destination:v23 responseQueue:v24 responseHandler:&__block_literal_global_78];
  }
  else
  {
    v25 = (void *)MEMORY[0x230FBD990]();
    v26 = v6;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = HMFGetLogIdentifier();
      int v29 = 138543362;
      v30 = v28;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@No home manager", (uint8_t *)&v29, 0xCu);
    }
  }
}

- (void)_sendStreamStoppedMessageWithError:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
  id v6 = [v5 streamClientConnection];

  if (v6)
  {
    id v7 = [MEMORY[0x263EFF9A0] dictionary];
    v8 = [(HMDCameraStreamControlMessageHandler *)self streamSessionID];
    [v7 setObject:v8 forKeyedSubscript:@"kCameraSessionID"];

    if (v4)
    {
      char v9 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
      [v7 setObject:v9 forKeyedSubscript:@"kCameraSessionError"];
      id v10 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
      int v11 = [v10 streamControlManager];
      int v12 = [v11 streamMetrics];
      [v12 setError:v4];
    }
    id v13 = objc_alloc(MEMORY[0x263F42570]);
    uint64_t v14 = [(HMDCameraStreamControlMessageHandler *)self profileUniqueIdentifier];
    __int16 v15 = (void *)[v13 initWithTarget:v14];

    id v16 = [MEMORY[0x263F42590] messageWithName:*MEMORY[0x263F0BDA0] destination:v15 payload:v7];
    uint64_t v17 = (void *)MEMORY[0x230FBD990]([v16 setTransport:v6]);
    v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = HMFGetLogIdentifier();
      v21 = [v16 shortDescription];
      int v27 = 138543874;
      v28 = v20;
      __int16 v29 = 2112;
      v30 = v21;
      __int16 v31 = 2112;
      v32 = v6;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Notifying client that stream has stopped using message %@: %@", (uint8_t *)&v27, 0x20u);
    }
    v22 = [(HMDCameraStreamControlMessageHandler *)v18 messageDispatcher];
    [v22 sendMessage:v16];
  }
  else
  {
    v23 = (void *)MEMORY[0x230FBD990]();
    v24 = self;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      int v27 = 138543362;
      v28 = v26;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Cannot send stream stopped message because XPC client connection doesn't exist", (uint8_t *)&v27, 0xCu);
    }
  }
}

- (void)streamControlManager:(id)a3 didStopStreamWithSessionID:(id)a4 error:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
  int v12 = [v11 sessionID];
  char v13 = [v12 isEqual:v9];

  uint64_t v14 = (void *)MEMORY[0x230FBD990]();
  __int16 v15 = self;
  id v16 = HMFGetOSLogHandle();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (v13)
  {
    if (v17)
    {
      v18 = HMFGetLogIdentifier();
      int v39 = 138543618;
      v40 = v18;
      __int16 v41 = 2114;
      id v42 = v10;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Stream did stop with error: %{public}@", (uint8_t *)&v39, 0x16u);
    }
    v19 = [(HMDCameraStreamControlMessageHandler *)v15 streamSession];
    v20 = [v19 currentMessage];

    if (v20)
    {
      v21 = (void *)MEMORY[0x230FBD990]();
      v22 = v15;
      v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = HMFGetLogIdentifier();
        v25 = [v20 shortDescription];
        int v39 = 138543618;
        v40 = v24;
        __int16 v41 = 2112;
        id v42 = v25;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Responding to the current message: %@", (uint8_t *)&v39, 0x16u);
      }
      if (v10)
      {
        [v20 respondWithError:v10];
      }
      else
      {
        __int16 v29 = [MEMORY[0x263F087E8] hmErrorWithCode:23];
        [v20 respondWithError:v29];
      }
      v30 = [(HMDCameraStreamControlMessageHandler *)v22 streamSession];
      [v30 setCurrentMessage:0];
    }
    __int16 v31 = [(HMDCameraStreamControlMessageHandler *)v15 streamSession];
    v32 = [v31 destinationID];

    uint64_t v33 = (void *)MEMORY[0x230FBD990]();
    v34 = v15;
    v35 = HMFGetOSLogHandle();
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_INFO);
    if (v32)
    {
      if (v36)
      {
        v37 = HMFGetLogIdentifier();
        int v39 = 138543362;
        v40 = v37;
        _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@This is a stream being relayed elsewhere so sending remote stream stopped message", (uint8_t *)&v39, 0xCu);
      }
      [(HMDCameraStreamControlMessageHandler *)v34 _sendStreamStoppedRemoteNotificationWithError:v10];
    }
    else
    {
      if (v36)
      {
        v38 = HMFGetLogIdentifier();
        int v39 = 138543362;
        v40 = v38;
        _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@This is a stream being shown locally so sending local stream stopped message", (uint8_t *)&v39, 0xCu);
      }
      [(HMDCameraStreamControlMessageHandler *)v34 _sendStreamStoppedMessageWithError:v10];
    }
    [(HMDCameraStreamControlMessageHandler *)v34 _resetStreamSession:v10];
  }
  else
  {
    if (v17)
    {
      v26 = HMFGetLogIdentifier();
      int v27 = [(HMDCameraStreamControlMessageHandler *)v15 streamSession];
      v28 = [v27 sessionID];
      int v39 = 138543874;
      v40 = v26;
      __int16 v41 = 2112;
      id v42 = v9;
      __int16 v43 = 2112;
      v44 = v28;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Ignoring did stop stream callback for session ID %@ because our session ID is %@", (uint8_t *)&v39, 0x20u);
    }
  }
}

- (void)streamControlManagerDidReconfigureStream:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
  id v6 = [v5 streamControlManager];

  if (v6 == v4)
  {
    id v7 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
    id v8 = [v7 currentMessage];
    id v9 = [v8 name];
    char v10 = [v9 isEqualToString:@"kReconfigureRemoteStreamRequestKey"];

    int v11 = (void *)MEMORY[0x230FBD990]();
    int v12 = self;
    char v13 = HMFGetOSLogHandle();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (v14)
      {
        __int16 v15 = HMFGetLogIdentifier();
        v34 = [(HMDCameraStreamControlMessageHandler *)v12 streamSession];
        uint64_t v33 = [v34 currentMessage];
        id v16 = [v33 name];
        BOOL v17 = [(HMDCameraStreamControlMessageHandler *)v12 streamSession];
        v18 = [v17 currentMessage];
        v19 = [v18 identifier];
        v20 = [v19 UUIDString];
        *(_DWORD *)buf = 138543874;
        BOOL v36 = v15;
        __int16 v37 = 2112;
        v38 = v16;
        __int16 v39 = 2112;
        v40 = v20;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Responding to %@ with identifier %@", buf, 0x20u);
      }
      v21 = [(HMDCameraStreamControlMessageHandler *)v12 streamSession];
      v22 = [v21 currentMessage];
      v23 = [v22 responseHandler];

      if (v23)
      {
        v24 = [(HMDCameraStreamControlMessageHandler *)v12 streamSession];
        v25 = [v24 currentMessage];
        v26 = [v25 responseHandler];
        v26[2](v26, 0, 0);
      }
      else
      {
        v28 = (void *)MEMORY[0x230FBD990]();
        __int16 v29 = v12;
        v30 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          __int16 v31 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          BOOL v36 = v31;
          _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@No response handler set for message", buf, 0xCu);
        }
      }
      v32 = [(HMDCameraStreamControlMessageHandler *)v12 streamSession];
      [v32 setCurrentMessage:0];
    }
    else
    {
      if (v14)
      {
        int v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        BOOL v36 = v27;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@No pending reconfigure stream request", buf, 0xCu);
      }
    }
  }
}

- (void)streamControlManagerDidReceiveFirstFrame:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
  id v6 = [v5 sessionID];
  [v6 markMilestoneFor:@"ReceivedFirstFrame"];

  id v7 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
  id v8 = [v7 currentMessage];

  id v9 = [v8 name];
  char v10 = [v9 isEqualToString:*MEMORY[0x263F0BD80]];

  if (v10)
  {
    int v11 = [(HMDCameraStreamControlMessageHandler *)self streamSnapshotHandler];
    int v12 = [(HMDCameraStreamControlMessageHandler *)self streamManagementService];
    [v11 setStreamSetupStatusForService:v12 inProgress:0];

    [(HMDCameraStreamControlMessageHandler *)self _respondToLocalNegotiateStreamMessage:v8];
    char v13 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
    [v13 setCurrentMessage:0];

    BOOL v14 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
    __int16 v15 = [v14 streamSetupTimer];
    [v15 suspend];
  }
  else
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    BOOL v17 = self;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = HMFGetLogIdentifier();
      v20 = [v8 shortDescription];
      int v21 = 138543618;
      v22 = v19;
      __int16 v23 = 2112;
      v24 = v20;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Received did receive first frame with an unexpected current message: %@", (uint8_t *)&v21, 0x16u);
    }
  }
}

- (void)streamControlManagerDidStartStream:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
  id v6 = [v5 streamControlManager];

  if (v6 == v4)
  {
    char v13 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
    BOOL v14 = [v13 sessionID];
    [v14 markMilestoneFor:@"SentStartResponse"];

    __int16 v15 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
    id v16 = [v15 currentMessage];

    if (v16)
    {
      BOOL v17 = [v16 name];
      char v18 = [v17 isEqualToString:*MEMORY[0x263F0BD80]];

      if (v18)
      {
LABEL_17:

        goto LABEL_18;
      }
      v19 = [v16 name];
      int v20 = [v19 isEqualToString:@"kStartRemoteStreamRequestKey"];

      int v21 = (void *)MEMORY[0x230FBD990]();
      v22 = self;
      __int16 v23 = HMFGetOSLogHandle();
      v24 = v23;
      if (v20)
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          uint64_t v25 = HMFGetLogIdentifier();
          v26 = [v16 shortDescription];
          int v34 = 138543618;
          v35 = v25;
          __int16 v36 = 2112;
          __int16 v37 = v26;
          _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Handling did start stream callback by responding to remote start stream message: %@", (uint8_t *)&v34, 0x16u);
        }
        [v16 respondWithSuccess];
        int v27 = [(HMDCameraStreamControlMessageHandler *)v22 streamSession];
        [v27 setCurrentMessage:0];

        v28 = [(HMDCameraStreamControlMessageHandler *)v22 streamSession];
        __int16 v29 = [v28 streamSetupTimer];
        [v29 suspend];

        v30 = [(HMDCameraStreamControlMessageHandler *)v22 streamSnapshotHandler];
        __int16 v31 = [(HMDCameraStreamControlMessageHandler *)v22 streamManagementService];
        [v30 setStreamSetupStatusForService:v31 inProgress:0];

        goto LABEL_17;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v32 = HMFGetLogIdentifier();
        uint64_t v33 = [v16 shortDescription];
        int v34 = 138543618;
        v35 = v32;
        __int16 v36 = 2112;
        __int16 v37 = v33;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unexpected current message while handling did start stream callback: %@", (uint8_t *)&v34, 0x16u);

        goto LABEL_15;
      }
    }
    else
    {
      int v21 = (void *)MEMORY[0x230FBD990]();
      v22 = self;
      v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v32 = HMFGetLogIdentifier();
        int v34 = 138543362;
        v35 = v32;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Received did start stream without a current message", (uint8_t *)&v34, 0xCu);
LABEL_15:
      }
    }

    goto LABEL_17;
  }
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    char v10 = HMFGetLogIdentifier();
    int v11 = [(HMDCameraStreamControlMessageHandler *)v8 streamSession];
    int v12 = [v11 streamControlManager];
    int v34 = 138543874;
    v35 = v10;
    __int16 v36 = 2112;
    __int16 v37 = v12;
    __int16 v38 = 2112;
    id v39 = v4;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring did start stream because our stream control manager %@ does not match the provided one: %@", (uint8_t *)&v34, 0x20u);
  }
LABEL_18:
}

- (void)streamControlManagerDidSetUpRemoteConnection:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
  id v6 = [v5 streamControlManager];

  if (v6 == v4)
  {
    char v13 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
    BOOL v14 = [v13 sessionID];
    [v14 markMilestoneFor:@"SentConnectionSetup"];

    __int16 v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = self;
    BOOL v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      char v18 = HMFGetLogIdentifier();
      v19 = [(HMDCameraStreamControlMessageHandler *)v16 streamSession];
      int v20 = [v19 destinationID];
      *(_DWORD *)buf = 138543618;
      uint64_t v41 = v18;
      __int16 v42 = 2112;
      __int16 v43 = v20;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Sending stream remote setup notification to %@", buf, 0x16u);
    }
    int v21 = [(HMDCameraStreamControlMessageHandler *)v16 accessory];
    v22 = [v21 home];
    __int16 v23 = [v22 homeManager];

    if (v23)
    {
      v24 = [(HMDCameraStreamControlMessageHandler *)v16 streamSession];
      uint64_t v25 = [v24 sessionID];
      v26 = [v25 sessionID];
      id v39 = v26;
      int v27 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];

      v28 = [MEMORY[0x263F42590] internalMessageWithName:@"kStreamRemoteConnectionSetupNotificationKey" messagePayload:v27];
      [v28 setQualityOfService:33];
      __int16 v29 = (void *)[v28 copy];
      v30 = [(HMDCameraStreamControlMessageHandler *)v16 profileUniqueIdentifier];
      __int16 v31 = [(HMDCameraStreamControlMessageHandler *)v16 streamSession];
      v32 = [v31 destinationID];
      uint64_t v33 = [(HMDCameraStreamControlMessageHandler *)v16 workQueue];
      [v23 sendSecureMessage:v29 target:v30 userID:0 destination:v32 responseQueue:v33 responseHandler:0];
    }
    else
    {
      int v34 = (void *)MEMORY[0x230FBD990]();
      v35 = v16;
      __int16 v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        __int16 v37 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v41 = v37;
        _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_INFO, "%{public}@No home manager", buf, 0xCu);
      }
    }
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      char v10 = HMFGetLogIdentifier();
      int v11 = [(HMDCameraStreamControlMessageHandler *)v8 streamSession];
      int v12 = [v11 streamControlManager];
      *(_DWORD *)buf = 138543874;
      uint64_t v41 = v10;
      __int16 v42 = 2112;
      __int16 v43 = v12;
      __int16 v44 = 2112;
      id v45 = v4;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring did set up remote connection because our stream control manager %@ does not match the provided one: %@", buf, 0x20u);
    }
  }
}

- (void)streamControlManager:(id)a3 didNegotiateStreamWithSelectedParameters:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
  id v9 = [v8 streamControlManager];

  if (v9 == v6)
  {
    id v16 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
    BOOL v17 = [v16 sessionID];
    [v17 markMilestoneFor:@"SentNegotiationResponse"];

    char v18 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
    v19 = [v18 currentMessage];

    if (v19)
    {
      int v20 = [v19 name];
      int v21 = [v20 isEqualToString:*MEMORY[0x263F0BD80]];

      if (v21)
      {
        v22 = (void *)MEMORY[0x230FBD990]();
        __int16 v23 = self;
        v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          uint64_t v25 = HMFGetLogIdentifier();
          int v37 = 138543362;
          uint64_t v38 = v25;
          _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Handling did negotiate stream callback by starting stream", (uint8_t *)&v37, 0xCu);
        }
        [(HMDCameraStreamControlMessageHandler *)v23 _handleStartMessage:v19];
        goto LABEL_20;
      }
      v30 = [v19 name];
      int v31 = [v30 isEqualToString:@"kNegotitateRemoteStreamRequestKey"];

      v26 = (void *)MEMORY[0x230FBD990]();
      int v27 = self;
      v32 = HMFGetOSLogHandle();
      v28 = v32;
      if (v31)
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          uint64_t v33 = HMFGetLogIdentifier();
          int v34 = [v19 shortDescription];
          int v37 = 138543618;
          uint64_t v38 = v33;
          __int16 v39 = 2112;
          uint64_t v40 = v34;
          _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Handling did negotiate stream callback by responding to remote negotiate stream message: %@", (uint8_t *)&v37, 0x16u);
        }
        [v19 respondWithPayload:v7];
        v35 = [(HMDCameraStreamControlMessageHandler *)v27 streamSession];
        [v35 setCurrentMessage:0];

        goto LABEL_20;
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        __int16 v29 = HMFGetLogIdentifier();
        __int16 v36 = [v19 shortDescription];
        int v37 = 138543618;
        uint64_t v38 = v29;
        __int16 v39 = 2112;
        uint64_t v40 = v36;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unexpected current message while handling did negotiate stream callback: %@", (uint8_t *)&v37, 0x16u);

        goto LABEL_18;
      }
    }
    else
    {
      v26 = (void *)MEMORY[0x230FBD990]();
      int v27 = self;
      v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        __int16 v29 = HMFGetLogIdentifier();
        int v37 = 138543362;
        uint64_t v38 = v29;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Received did negotiate stream without a current message", (uint8_t *)&v37, 0xCu);
LABEL_18:
      }
    }

LABEL_20:

    goto LABEL_21;
  }
  char v10 = (void *)MEMORY[0x230FBD990]();
  int v11 = self;
  int v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    char v13 = HMFGetLogIdentifier();
    BOOL v14 = [(HMDCameraStreamControlMessageHandler *)v11 streamSession];
    __int16 v15 = [v14 streamControlManager];
    int v37 = 138543874;
    uint64_t v38 = v13;
    __int16 v39 = 2112;
    uint64_t v40 = v15;
    __int16 v41 = 2112;
    id v42 = v6;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring did negotiate stream because our stream control manager %@ does not match the provided one: %@", (uint8_t *)&v37, 0x20u);
  }
LABEL_21:
}

- (void)timerDidFire:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(HMDCameraStreamControlMessageHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
  id v7 = [v6 streamSetupTimer];

  if (v7 == v4)
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    char v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      BOOL v14 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Stream setup timer fired", (uint8_t *)&v13, 0xCu);
    }
    int v12 = [MEMORY[0x263F087E8] hmErrorWithCode:8];
    [(HMDCameraStreamControlMessageHandler *)v9 _stopStreamWithError:v12];
  }
}

- (id)logIdentifier
{
  unint64_t v3 = NSString;
  id v4 = [(HMDCameraStreamControlMessageHandler *)self accessory];
  int v5 = [v4 name];
  id v6 = [(HMDCameraStreamControlMessageHandler *)self streamManagementService];
  id v7 = [v6 instanceID];
  id v8 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
  id v9 = [v8 sessionID];
  char v10 = [v9 sessionID];
  int v11 = [v3 stringWithFormat:@"%@/%@/%@", v5, v7, v10];

  return v11;
}

- (void)_respondToLocalNegotiateStreamMessage:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(HMDCameraStreamControlMessageHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [MEMORY[0x263EFF9A0] dictionary];
  id v7 = [(HMDCameraStreamControlMessageHandler *)self streamSessionID];
  [v6 setObject:v7 forKeyedSubscript:@"kCameraSessionID"];

  id v8 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
  id v9 = [v8 streamControlManager];
  char v10 = [v9 slotIdentifier];
  [v6 setObject:v10 forKeyedSubscript:*MEMORY[0x263F0D9C0]];

  int v11 = NSNumber;
  int v12 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
  int v13 = [v12 streamControlManager];
  BOOL v14 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v13, "audioStreamSetting"));
  [v6 setObject:v14 forKeyedSubscript:@"kAudioStreamSetting"];

  uint64_t v15 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
  id v16 = [v15 streamControlManager];
  BOOL v17 = [v16 aspectRatio];
  [v6 setObject:v17 forKeyedSubscript:*MEMORY[0x263F0DAE0]];

  char v18 = (void *)MEMORY[0x230FBD990]();
  v19 = self;
  int v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    int v21 = HMFGetLogIdentifier();
    v22 = [v4 shortDescription];
    int v24 = 138543874;
    uint64_t v25 = v21;
    __int16 v26 = 2112;
    int v27 = v22;
    __int16 v28 = 2112;
    __int16 v29 = v6;
    _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Responding to message %@ with payload %@", (uint8_t *)&v24, 0x20u);
  }
  __int16 v23 = (void *)[v6 copy];
  [v4 respondWithPayload:v23];
}

- (void)_attributeMicrophoneUsageToApplicationBundleIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(HMDCameraStreamControlMessageHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    id v6 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
    id v7 = [v6 destinationID];

    if (!v7)
    {
      id v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = self;
      char v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = HMFGetLogIdentifier();
        int v13 = 138543618;
        BOOL v14 = v11;
        __int16 v15 = 2112;
        id v16 = v4;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating activity attribution with applicationBundleIdentifier: %@", (uint8_t *)&v13, 0x16u);
      }
      int v12 = [(HMDCameraStreamControlMessageHandler *)v9 dynamicActivityAttributionPublisher];
      [v12 setCurrentAttributionKey:0 andApp:v4];
    }
  }
}

- (BOOL)_shouldStopStreamSessionForProcessInfo:(id)a3
{
  id v4 = a3;
  int v5 = [(HMDCameraStreamControlMessageHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [v4 state];
  if (v6 == -1)
  {
    int v8 = [v4 isEntitledForSPIAccess] ^ 1;
  }
  else if (v6)
  {
    if (v6 == 2)
    {
      id v7 = [v4 applicationInfo];
      LOBYTE(v8) = v7 != 0;
    }
    else
    {
      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (NSDictionary)stateDump
{
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
  int v5 = [v4 streamControlManager];
  uint64_t v6 = [v5 stateDump];
  [v3 setObject:v6 forKeyedSubscript:@"Stream"];

  return (NSDictionary *)v3;
}

- (BOOL)hasStreamSessionShowingOnCurrentDevice
{
  unint64_t v3 = [(HMDCameraStreamControlMessageHandler *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if (![(HMDCameraStreamControlMessageHandler *)self hasStreamSession]) {
    return 0;
  }
  id v4 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
  int v5 = [v4 destinationID];
  BOOL v6 = v5 == 0;

  return v6;
}

- (BOOL)hasStreamSession
{
  v2 = self;
  unint64_t v3 = [(HMDCameraStreamControlMessageHandler *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraStreamControlMessageHandler *)v2 streamSession];
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (NSString)streamSessionID
{
  unint64_t v3 = [(HMDCameraStreamControlMessageHandler *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
  int v5 = [v4 sessionID];
  BOOL v6 = [v5 sessionID];

  return (NSString *)v6;
}

- (void)_handleSetAudioState:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(HMDCameraStreamControlMessageHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [v4 numberForKey:@"kAudioStreamSetting"];
  id v7 = v6;
  if (!v6)
  {
    uint64_t v14 = MEMORY[0x230FBD990]();
    __int16 v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v39 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Missing parameter to set the audio stream state", buf, 0xCu);
    }
    char v18 = (void *)v14;
    goto LABEL_16;
  }
  uint64_t v8 = [v6 unsignedIntegerValue];
  uint64_t v9 = v8;
  if ((unint64_t)(v8 - 1) >= 2)
  {
    if (v8 == 3)
    {
      if ([v4 isAuthorizedForMicrophoneAccess])
      {
        v19 = [(HMDCameraStreamControlMessageHandler *)self dataSource];
        char v20 = [v19 supportsBidirectionalAudioForCameraStreaming];

        if (v20) {
          goto LABEL_3;
        }
        int v21 = (void *)MEMORY[0x230FBD990]();
        v22 = self;
        __int16 v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          int v24 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          __int16 v39 = v24;
          _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Bi-directional audio is not supported on this device for camera streaming.", buf, 0xCu);
        }
        uint64_t v25 = (void *)MEMORY[0x263F087E8];
        uint64_t v26 = 48;
      }
      else
      {
        int v31 = (void *)MEMORY[0x230FBD990]();
        v32 = self;
        uint64_t v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          int v34 = HMFGetLogIdentifier();
          v35 = [v4 name];
          *(_DWORD *)buf = 138543874;
          __int16 v39 = v34;
          __int16 v40 = 2112;
          uint64_t v41 = (uint64_t)v35;
          __int16 v42 = 2048;
          uint64_t v43 = (int)[v4 sourcePid];
          _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Denying incoming message %@ for client pid %ld since the process is not authorized for microphone access", buf, 0x20u);
        }
        uint64_t v25 = (void *)MEMORY[0x263F087E8];
        uint64_t v26 = 89;
      }
LABEL_17:
      int v12 = [v25 hmErrorWithCode:v26];
      [v4 respondWithError:v12];
      goto LABEL_18;
    }
    uint64_t v27 = MEMORY[0x230FBD990]();
    __int16 v28 = self;
    __int16 v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v39 = v30;
      __int16 v40 = 2048;
      uint64_t v41 = v9;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Invalid audio stream setting: %lu", buf, 0x16u);
    }
    char v18 = (void *)v27;
LABEL_16:
    uint64_t v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = 3;
    goto LABEL_17;
  }
LABEL_3:
  char v10 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
  int v11 = [v10 streamControlManager];
  [v11 updateAudioSetting:v9];

  int v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v9, @"kAudioStreamSetting");
  int v37 = v12;
  int v13 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
  [v4 respondWithPayload:v13];

LABEL_18:
}

- (void)setAudioVolume:(id)a3 callback:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v8 = [(HMDCameraStreamControlMessageHandler *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(HMDCameraStreamControlMessageHandler *)self dataSource];
  char v10 = [v9 supportsChangingVolume];

  if ((v10 & 1) == 0)
  {
    uint64_t v14 = (void *)MEMORY[0x230FBD990]();
    __int16 v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Changing audio volume setting is not allowed on this device", buf, 0xCu);
    }
    char v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = 48;
    goto LABEL_10;
  }
  if (!v6)
  {
    char v20 = (void *)MEMORY[0x230FBD990]();
    int v21 = self;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v23;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Missing parameter to set the audio stream state", buf, 0xCu);
    }
    char v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = 3;
LABEL_10:
    int v13 = [v18 hmErrorWithCode:v19];
    v7[2](v7, v13);
    goto LABEL_11;
  }
  int v11 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
  int v12 = [v11 streamControlManager];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __64__HMDCameraStreamControlMessageHandler_setAudioVolume_callback___block_invoke;
  v24[3] = &unk_264A29300;
  uint64_t v25 = v7;
  [v12 updateAudioVolume:v6 callback:v24];

  int v13 = v25;
LABEL_11:
}

void __64__HMDCameraStreamControlMessageHandler_setAudioVolume_callback___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    unint64_t v3 = *(void (**)(uint64_t, void))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4, 0);
  }
  else
  {
    id v5 = [MEMORY[0x263F087E8] hmErrorWithCode:43];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
  }
}

- (void)_handleSetAudioVolume:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraStreamControlMessageHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ([v4 isEntitledForSPIAccess])
  {
    id v6 = [v4 numberForKey:*MEMORY[0x263F0BD78]];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __62__HMDCameraStreamControlMessageHandler__handleSetAudioVolume___block_invoke;
    v11[3] = &unk_264A2F3E8;
    id v12 = v4;
    [(HMDCameraStreamControlMessageHandler *)self setAudioVolume:v6 callback:v11];
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    uint64_t v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      char v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Ignoring set audio volume message as it is not entitled for SPI access", buf, 0xCu);
    }
    id v6 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    [v4 respondWithError:v6];
  }
}

uint64_t __62__HMDCameraStreamControlMessageHandler__handleSetAudioVolume___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) respondWithPayload:0 error:a2];
}

- (void)_handleStopMessage:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraStreamControlMessageHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    char v10 = [v4 identifier];
    int v18 = 138543618;
    uint64_t v19 = v9;
    __int16 v20 = 2112;
    int v21 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling stop message with identifier: %@", (uint8_t *)&v18, 0x16u);
  }
  int v11 = [v4 messagePayload];
  id v12 = [v11 errorFromDataForKey:@"kCameraSessionError"];

  if (v12)
  {
    int v13 = [(HMDCameraStreamControlMessageHandler *)v7 streamSession];
    uint64_t v14 = [v13 streamControlManager];
    uint64_t v15 = [v14 streamMetrics];
    [v15 setError:v12];
  }
  id v16 = [(HMDCameraStreamControlMessageHandler *)v7 streamSession];
  uint64_t v17 = [v16 streamControlManager];
  [v17 stopStreamWithError:v12];

  [v4 respondWithSuccess];
}

- (void)_handleUpdateMaximumVideoResolutionQualityMessage:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraStreamControlMessageHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    char v10 = [v4 identifier];
    *(_DWORD *)buf = 138543618;
    uint64_t v30 = v9;
    __int16 v31 = 2112;
    uint64_t v32 = (uint64_t)v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling update video resolution quality message with identifier: %@", buf, 0x16u);
  }
  int v11 = [v4 messagePayload];
  id v12 = objc_msgSend(v11, "hmf_numberForKey:", *MEMORY[0x263F0BDB0]);

  if (!v12)
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    uint64_t v17 = v7;
    int v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Missing camera video resolution quality", buf, 0xCu);
    }
    __int16 v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = 27;
    goto LABEL_12;
  }
  uint64_t v13 = [v12 integerValue];
  if ((unint64_t)(v13 - 1) >= 5)
  {
    uint64_t v22 = (void *)MEMORY[0x230FBD990]();
    __int16 v23 = v7;
    int v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = v25;
      __int16 v31 = 2048;
      uint64_t v32 = v13;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Invalid resolution quality enum value received: %ld", buf, 0x16u);
    }
    __int16 v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = 3;
LABEL_12:
    uint64_t v26 = [v20 hmErrorWithCode:v21];
    [v4 respondWithError:v26];

    goto LABEL_13;
  }
  uint64_t v14 = [(HMDCameraStreamControlMessageHandler *)v7 streamSession];
  uint64_t v15 = [v14 streamControlManager];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __90__HMDCameraStreamControlMessageHandler__handleUpdateMaximumVideoResolutionQualityMessage___block_invoke;
  v27[3] = &unk_264A2F370;
  v27[4] = v7;
  id v28 = v4;
  [v15 updateMaximumVideoResolutionQuality:v13 completionHandler:v27];

LABEL_13:
}

void __90__HMDCameraStreamControlMessageHandler__handleUpdateMaximumVideoResolutionQualityMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v10 = 138543362;
      int v11 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to update video resolution quality", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 40) respondWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      int v11 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfuly updated video resolution quality", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 40) respondWithSuccess];
  }
}

- (void)_handleReconfigureMessage:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraStreamControlMessageHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v10 = [v4 identifier];
    int v15 = 138543618;
    id v16 = v9;
    __int16 v17 = 2112;
    int v18 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling reconfigure message with identifier: %@", (uint8_t *)&v15, 0x16u);
  }
  int v11 = [(HMDCameraStreamControlMessageHandler *)v7 streamSession];
  [v11 setCurrentMessage:v4];

  uint64_t v12 = [(HMDCameraStreamControlMessageHandler *)v7 streamSession];
  uint64_t v13 = [v12 streamControlManager];
  uint64_t v14 = [v4 messagePayload];
  [v13 reconfigureStream:v14];
}

- (void)_handleStartMessage:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraStreamControlMessageHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v10 = [v4 identifier];
    int v19 = 138543618;
    __int16 v20 = v9;
    __int16 v21 = 2112;
    uint64_t v22 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling start message with identifier: %@", (uint8_t *)&v19, 0x16u);
  }
  int v11 = [v4 proxyConnection];
  uint64_t v12 = [v11 applicationBundleIdentifier];
  [(HMDCameraStreamControlMessageHandler *)v7 _attributeMicrophoneUsageToApplicationBundleIdentifier:v12];

  uint64_t v13 = [(HMDCameraStreamControlMessageHandler *)v7 streamSession];
  [v13 setCurrentMessage:v4];

  uint64_t v14 = [(HMDCameraStreamControlMessageHandler *)v7 streamSession];
  int v15 = [v14 sessionID];
  [v15 markMilestoneFor:@"ReceivedStartRequest"];

  id v16 = [(HMDCameraStreamControlMessageHandler *)v7 streamSession];
  __int16 v17 = [v16 streamControlManager];
  int v18 = [v4 messagePayload];
  [v17 startStreamWithRemoteSettings:v18];
}

- (void)_handleRemoteSetupMessage:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraStreamControlMessageHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 remoteSourceDevice];
  id v7 = (void *)MEMORY[0x230FBD990]();
  uint64_t v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  int v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = HMFGetLogIdentifier();
      uint64_t v12 = [v4 identifier];
      int v19 = 138543874;
      __int16 v20 = v11;
      __int16 v21 = 2112;
      id v22 = v12;
      __int16 v23 = 2112;
      int v24 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling remote setup message %@ from device: %@", (uint8_t *)&v19, 0x20u);
    }
    uint64_t v13 = [(HMDCameraStreamControlMessageHandler *)v8 streamSession];
    uint64_t v14 = [v13 sessionID];
    [v14 markMilestoneFor:@"ReceivedConnectionSetup"];

    int v15 = [(HMDCameraStreamControlMessageHandler *)v8 streamSession];
    id v16 = [v15 streamControlManager];
    [v16 setUpRemoteConnectionWithDevice:v6];

    [v4 respondWithPayload:0];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = HMFGetLogIdentifier();
      int v19 = 138543618;
      __int16 v20 = v17;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not find remote source device for remote setup message: %@", (uint8_t *)&v19, 0x16u);
    }
    int v18 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v4 respondWithError:v18];
  }
}

- (void)_handleNegotiateMessage:(id)a3
{
  uint64_t v145 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraStreamControlMessageHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 stringForKey:@"kCameraSessionID"];
  id v7 = (void *)MEMORY[0x230FBD990]();
  uint64_t v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  int v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = HMFGetLogIdentifier();
      uint64_t v12 = [v4 shortDescription];
      *(_DWORD *)buf = 138543874;
      v140 = v11;
      __int16 v141 = 2112;
      v142 = v6;
      __int16 v143 = 2112;
      id v144 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@[%@] Handling negotiation message: %@", buf, 0x20u);
    }
    uint64_t v13 = [(HMDCameraStreamControlMessageHandler *)v8 accessory];
    uint64_t v14 = [v13 isReachable];
    if ([(HMDCameraStreamControlMessageHandler *)v8 _shouldHandleNegotiateMessage:v4 accessoryReachable:v14])
    {
      int v15 = [v13 cameraProfiles];
      id v16 = [v15 anyObject];
      __int16 v17 = [v16 currentSettings];

      if (v17)
      {
        [v17 currentAccessMode];
        if ((HMIsStreamingAllowedForCameraAccessMode() & 1) == 0)
        {
          int v18 = (void *)MEMORY[0x230FBD990]();
          int v19 = v8;
          __int16 v20 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            __int16 v21 = HMFGetLogIdentifier();
            [v17 currentAccessMode];
            id v22 = HMCameraAccessModeAsString();
            *(_DWORD *)buf = 138543874;
            v140 = v21;
            __int16 v141 = 2112;
            v142 = v6;
            __int16 v143 = 2112;
            id v144 = v22;
            _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@[%@] Streaming is disallowed for current access mode: %@", buf, 0x20u);
          }
          __int16 v23 = [MEMORY[0x263F087E8] hmErrorWithCode:10];
          [v4 respondWithError:v23];
          goto LABEL_59;
        }
      }
      else
      {
        uint64_t v26 = (void *)MEMORY[0x230FBD990]();
        uint64_t v27 = v8;
        id v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          __int16 v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v140 = v29;
          __int16 v141 = 2112;
          v142 = v6;
          _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@[%@] Camera profile settings are not initialized; skipping controller side checks to disallow stream request",
            buf,
            0x16u);
        }
      }
      uint64_t v30 = [v4 dataForKey:@"kCameraSessionPreference"];
      uint64_t v31 = 0;
      v135 = v17;
      if ([v4 isEntitledForSPIAccess] && v30)
      {
        id v138 = 0;
        uint64_t v31 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v30 error:&v138];
        id v32 = v138;
        if (!v31)
        {
          v128 = v30;
          uint64_t v33 = (void *)MEMORY[0x230FBD990]();
          int v34 = v8;
          v35 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            uint64_t v36 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v140 = v36;
            __int16 v141 = 2112;
            v142 = v6;
            __int16 v143 = 2112;
            id v144 = v32;
            _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to unarchive camera stream preferences from camera session preference message: %@", buf, 0x20u);
          }
          uint64_t v30 = v128;
          uint64_t v31 = 0;
        }
      }
      v136 = (void *)v31;
      uint64_t v37 = [v4 proxyConnection];
      char v38 = [v4 isRemote];
      __int16 v39 = (void *)MEMORY[0x230FBD990]();
      __int16 v40 = v8;
      uint64_t v41 = (void *)v37;
      __int16 v42 = v40;
      uint64_t v43 = HMFGetOSLogHandle();
      uint64_t v44 = v43;
      if ((v38 & 1) == 0 && !v41)
      {
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          id v45 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v140 = v45;
          __int16 v141 = 2112;
          v142 = v6;
          __int16 v143 = 2112;
          id v144 = v4;
          _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_ERROR, "%{public}@[%@] Cannot find XPC client connection for negotiate stream message received over XPC: %@", buf, 0x20u);
        }
        uint64_t v46 = [MEMORY[0x263F087E8] hmErrorWithCode:58];
        [v4 respondWithError:v46];
        __int16 v17 = v135;
        __int16 v23 = v136;
        goto LABEL_58;
      }
      v134 = v41;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        v47 = HMFGetLogIdentifier();
        [v41 processInfo];
        v49 = v48 = v30;
        *(_DWORD *)buf = 138543874;
        v140 = v47;
        __int16 v141 = 2112;
        v142 = v6;
        __int16 v143 = 2112;
        id v144 = v49;
        _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_INFO, "%{public}@[%@] Using stream client process info: %@", buf, 0x20u);

        uint64_t v30 = v48;
        uint64_t v41 = v134;
      }
      v50 = [HMDCameraStreamSessionID alloc];
      v51 = [(HMDCameraStreamControlMessageHandler *)v42 streamManagementService];
      v131 = v6;
      v52 = [(HMDCameraStreamSessionID *)v50 initWithAccessory:v13 service:v51 sessionID:v6 message:v4];

      v53 = [(HMDCameraStreamControlMessageHandler *)v42 negotiationMilestone];

      if (v53)
      {
        v54 = [(HMDCameraStreamControlMessageHandler *)v42 negotiationMilestone];
        v55 = [v54 key];
        v56 = NSNumber;
        [(HMDCameraStreamControlMessageHandler *)v42 negotiationMilestone];
        v58 = v57 = v30;
        v59 = objc_msgSend(v56, "numberWithInteger:", objc_msgSend(v58, "timestamp"));
        [(HMDCameraSessionID *)v52 markMilestoneFor:v55 withTimestamp:v59];

        uint64_t v30 = v57;
        uint64_t v41 = v134;
      }
      v133 = v52;
      v132 = [v4 remoteSourceDevice];
      v60 = [(HMDCameraStreamControlMessageHandler *)v42 residentMessageHandler];
      uint64_t v61 = [v60 remoteAccessDevice];

      v62 = [(HMDCameraStreamControlMessageHandler *)v42 residentMessageHandler];
      int v63 = [v62 isRemoteAccessDeviceReachable];

      v130 = (void *)v61;
      if (v14)
      {
        v64 = (void *)MEMORY[0x230FBD990]();
        v65 = v42;
        v66 = HMFGetOSLogHandle();
        id v6 = v131;
        if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
        {
          v67 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v140 = v67;
          __int16 v141 = 2112;
          v142 = v131;
          _os_log_impl(&dword_22F52A000, v66, OS_LOG_TYPE_INFO, "%{public}@[%@] Creating local stream control manager because accessory is reachable", buf, 0x16u);
        }
        v68 = [(HMDCameraStreamControlMessageHandler *)v65 dataSource];
        uint64_t v69 = [v68 localNetworkConfig];

        if (v69)
        {
          v127 = v42;
          v129 = v30;
          uint64_t v70 = [(HMDCameraStreamControlMessageHandler *)v65 dataSource];
          uint64_t v122 = [(HMDCameraStreamControlMessageHandler *)v65 workQueue];
          uint64_t v71 = [(HMDCameraStreamControlMessageHandler *)v65 streamSnapshotHandler];
          v72 = [(HMDCameraStreamControlMessageHandler *)v65 networkMonitor];
          uint64_t v121 = [v72 reachabilityPath];
          v73 = [(HMDCameraStreamControlMessageHandler *)v65 streamManagementService];
          v74 = [v4 messagePayload];
          v75 = [(HMDCameraStreamControlMessageHandler *)v65 supportedConfigCache];
          uint64_t v120 = v69;
          v125 = (void *)v70;
          v126 = (void *)v69;
          v76 = (void *)v70;
          v77 = (void *)v122;
          v78 = v133;
          v124 = (void *)v71;
          uint64_t v79 = v71;
          v80 = v132;
          v81 = [v76 createLocalStreamControlManagerWithSessionID:v133 workQueue:v122 streamSnapshotHandler:v79 reachabilityPath:v121 device:v132 delegate:v65 accessory:v13 streamManagementService:v73 localNetworkConfig:v120 remoteCapabilities:v74 supportedConfigCache:v75 streamPreference:v136];
          double v82 = 30.0;
LABEL_44:

          uint64_t v93 = [(HMDCameraStreamControlMessageHandler *)v127 dataSource];
          v94 = [v80 remoteDestinationString];
          v95 = [(id)v93 createStreamManagerSessionWithSessionID:v78 destinationID:v94 streamClientConnection:v134 streamControlManager:v81 setupWaitPeriod:v82];

          id v137 = 0;
          LOBYTE(v93) = [v95 canStartWithError:&v137];
          id v96 = v137;
          if (v93)
          {
            [(HMDCameraStreamControlMessageHandler *)v127 setStreamSession:v95];
            v97 = [(HMDCameraStreamControlMessageHandler *)v127 streamSession];
            [v97 setCurrentMessage:v4];

            v98 = [(HMDCameraStreamControlMessageHandler *)v127 streamSession];
            v99 = [v98 streamControlManager];
            [v99 negotiateStream];

            v100 = [(HMDCameraStreamControlMessageHandler *)v127 streamSession];
            v101 = [v100 streamSetupTimer];
            [v101 setDelegate:v127];

            v102 = [(HMDCameraStreamControlMessageHandler *)v127 workQueue];
            v103 = [(HMDCameraStreamControlMessageHandler *)v127 streamSession];
            v104 = [v103 streamSetupTimer];
            [v104 setDelegateQueue:v102];

            v105 = [(HMDCameraStreamControlMessageHandler *)v127 streamSession];
            v106 = [v105 streamSetupTimer];
            [v106 resume];

            id v6 = v131;
          }
          else
          {
            v107 = (void *)MEMORY[0x230FBD990]();
            v108 = v127;
            v109 = HMFGetOSLogHandle();
            id v6 = v131;
            if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v111 = id v110 = v96;
              *(_DWORD *)buf = 138543874;
              v140 = v111;
              __int16 v141 = 2112;
              v142 = v131;
              __int16 v143 = 2112;
              id v144 = v110;
              _os_log_impl(&dword_22F52A000, v109, OS_LOG_TYPE_ERROR, "%{public}@[%@] Cannot start stream session: %@", buf, 0x20u);

              id v96 = v110;
            }

            [v4 respondWithError:v96];
          }

          uint64_t v41 = v134;
          __int16 v17 = v135;
          uint64_t v30 = v129;
          goto LABEL_57;
        }
        v115 = (void *)MEMORY[0x230FBD990]();
        v116 = v65;
        v117 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v119 = v118 = v30;
          *(_DWORD *)buf = 138543618;
          v140 = v119;
          __int16 v141 = 2112;
          v142 = v131;
          _os_log_impl(&dword_22F52A000, v117, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to get the local network address config", buf, 0x16u);

          uint64_t v30 = v118;
          uint64_t v41 = v134;
        }

        v113 = (void *)MEMORY[0x263F087E8];
        uint64_t v114 = -1;
      }
      else
      {
        if (v61) {
          int v83 = v63;
        }
        else {
          int v83 = 0;
        }
        v84 = (void *)MEMORY[0x230FBD990]();
        v85 = v42;
        v86 = HMFGetOSLogHandle();
        v87 = v86;
        if (v83 == 1)
        {
          v127 = v42;
          v129 = v30;
          if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
          {
            v88 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v140 = v88;
            __int16 v141 = 2112;
            v142 = v131;
            _os_log_impl(&dword_22F52A000, v87, OS_LOG_TYPE_INFO, "%{public}@[%@] Creating remote stream control manager because accessory is not reachable", buf, 0x16u);
          }
          uint64_t v89 = [(HMDCameraStreamControlMessageHandler *)v85 dataSource];
          uint64_t v90 = [(HMDCameraStreamControlMessageHandler *)v85 workQueue];
          v77 = [(HMDCameraStreamControlMessageHandler *)v85 streamSnapshotHandler];
          v124 = [(HMDCameraStreamControlMessageHandler *)v85 networkMonitor];
          uint64_t v123 = [v124 reachabilityPath];
          v72 = [(HMDCameraStreamControlMessageHandler *)v85 streamManagementService];
          v73 = [v4 messagePayload];
          v74 = [(HMDCameraStreamControlMessageHandler *)v85 profileUniqueIdentifier];
          v75 = [(HMDCameraStreamControlMessageHandler *)v85 residentMessageHandler];
          v125 = (void *)v90;
          v126 = (void *)v89;
          v91 = (void *)v89;
          v78 = v133;
          uint64_t v92 = v90;
          v80 = v132;
          v81 = [v91 createRemoteStreamControlManagerWithSessionID:v133 workQueue:v92 streamSnapshotHandler:v77 reachabilityPath:v123 device:v132 delegate:v85 accessory:v13 streamManagementService:v72 remoteCapabilities:v73 profileUniqueIdentifier:v74 residentMessageHandler:v75 remoteAccessDevice:v130 streamPreference:v136];
          double v82 = 60.0;
          goto LABEL_44;
        }
        id v6 = v131;
        if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
        {
          v112 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v140 = v112;
          __int16 v141 = 2112;
          v142 = v131;
          _os_log_impl(&dword_22F52A000, v87, OS_LOG_TYPE_ERROR, "%{public}@[%@] Cannot create stream because accessory is unreachable and there is no reachable remote access device", buf, 0x16u);
        }
        v113 = (void *)MEMORY[0x263F087E8];
        uint64_t v114 = 4;
      }
      v81 = [v113 hmErrorWithCode:v114];
      [v4 respondWithError:v81];
      __int16 v17 = v135;
LABEL_57:

      __int16 v23 = v136;
      uint64_t v46 = v133;
LABEL_58:

LABEL_59:
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v24 = HMFGetLogIdentifier();
      uint64_t v25 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      v140 = v24;
      __int16 v141 = 2112;
      v142 = v25;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not find session ID in negotiate message payload: %@", buf, 0x16u);
    }
    uint64_t v13 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    [v4 respondWithError:v13];
  }
}

- (BOOL)_shouldHandleNegotiateMessage:(id)a3 accessoryReachable:(BOOL)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HMDCameraStreamControlMessageHandler *)self workQueue];
  dispatch_assert_queue_V2(v7);

  if (!a4)
  {
    uint64_t v8 = [v6 remoteSourceDevice];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      int v10 = [(HMDCameraStreamControlMessageHandler *)self dataSource];
      int v11 = [v10 isResidentCapable];

      if (v11)
      {
        uint64_t v12 = (void *)MEMORY[0x230FBD990]();
        uint64_t v13 = self;
        uint64_t v14 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v15 = HMFGetLogIdentifier();
          int v23 = 138543362;
          int v24 = v15;
          id v16 = "%{public}@Failing remote negotiate message because accessory is unreachable and this is a resident capable device";
LABEL_10:
          _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v23, 0xCu);

          goto LABEL_11;
        }
        goto LABEL_11;
      }
    }
    __int16 v17 = [(HMDCameraStreamControlMessageHandler *)self dataSource];
    char v18 = [v17 supportsReceivingRemoteCameraStream];

    if ((v18 & 1) == 0)
    {
      uint64_t v12 = (void *)MEMORY[0x230FBD990]();
      __int16 v20 = self;
      uint64_t v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v15 = HMFGetLogIdentifier();
        int v23 = 138543362;
        int v24 = v15;
        id v16 = "%{public}@Failing negotiate message because accessory is unreachable and this device doesn't support recei"
              "ving remote streams";
        goto LABEL_10;
      }
LABEL_11:

      __int16 v21 = [MEMORY[0x263F087E8] hmErrorWithCode:4];
      [v6 respondWithError:v21];

      BOOL v19 = 0;
      goto LABEL_12;
    }
  }
  BOOL v19 = 1;
LABEL_12:

  return v19;
}

- (void)handleMessage:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraStreamControlMessageHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 proxyConnection];
  id v7 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
  uint64_t v8 = [v7 streamClientConnection];

  if (v6 && v8 && v6 != v8)
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    int v10 = self;
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      uint64_t v13 = [v4 shortDescription];
      *(_DWORD *)buf = 138544130;
      int v34 = v12;
      __int16 v35 = 2112;
      uint64_t v36 = v13;
      __int16 v37 = 2112;
      char v38 = v6;
      __int16 v39 = 2112;
      __int16 v40 = v8;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Rejecting stream control request message %@ from client %@ because stream is owned by other client %@", buf, 0x2Au);
    }
    uint64_t v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = 17;
  }
  else
  {
    if ([(id)objc_opt_class() _isStopMessage:v4])
    {
      [(HMDCameraStreamControlMessageHandler *)self _handleStopMessage:v4];
      goto LABEL_16;
    }
    if ([(id)objc_opt_class() _isSetAudioStreamSettingMessage:v4])
    {
      [(HMDCameraStreamControlMessageHandler *)self _handleSetAudioState:v4];
      goto LABEL_16;
    }
    if ([(id)objc_opt_class() _isSetAudioVolumeMessage:v4])
    {
      [(HMDCameraStreamControlMessageHandler *)self _handleSetAudioVolume:v4];
      goto LABEL_16;
    }
    if ([(id)objc_opt_class() _isRemoteSetupMessage:v4])
    {
      [(HMDCameraStreamControlMessageHandler *)self _handleRemoteSetupMessage:v4];
      goto LABEL_16;
    }
    __int16 v17 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
    char v18 = [v17 currentMessage];

    if (v18)
    {
      BOOL v19 = (void *)MEMORY[0x230FBD990]();
      __int16 v20 = self;
      __int16 v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = HMFGetLogIdentifier();
        int v23 = [(HMDCameraStreamControlMessageHandler *)v20 streamSession];
        int v24 = [v23 currentMessage];
        uint64_t v25 = [v24 shortDescription];
        [v4 shortDescription];
        uint64_t v26 = v32 = v19;
        *(_DWORD *)buf = 138543874;
        int v34 = v22;
        __int16 v35 = 2112;
        uint64_t v36 = v25;
        __int16 v37 = 2112;
        char v38 = v26;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Current message %@ is already being processed, rejecting message %@", buf, 0x20u);

        BOOL v19 = v32;
      }

      uint64_t v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v15 = 3;
    }
    else
    {
      if ([(id)objc_opt_class() _isNegotiateMessage:v4])
      {
        [(HMDCameraStreamControlMessageHandler *)self _handleNegotiateMessage:v4];
        goto LABEL_16;
      }
      if ([(id)objc_opt_class() _isStartMessage:v4])
      {
        [(HMDCameraStreamControlMessageHandler *)self _handleStartMessage:v4];
        goto LABEL_16;
      }
      if ([(id)objc_opt_class() _isReconfigureMessage:v4])
      {
        [(HMDCameraStreamControlMessageHandler *)self _handleReconfigureMessage:v4];
        goto LABEL_16;
      }
      if ([(id)objc_opt_class() _isUpdateMaximumVideoResolutionQualityMessage:v4])
      {
        [(HMDCameraStreamControlMessageHandler *)self _handleUpdateMaximumVideoResolutionQualityMessage:v4];
        goto LABEL_16;
      }
      uint64_t v27 = (void *)MEMORY[0x230FBD990]();
      id v28 = self;
      __int16 v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = HMFGetLogIdentifier();
        uint64_t v31 = [v4 name];
        *(_DWORD *)buf = 138543618;
        int v34 = v30;
        __int16 v35 = 2112;
        uint64_t v36 = v31;
        _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Unknown message type %@", buf, 0x16u);
      }
      uint64_t v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v15 = 2;
    }
  }
  id v16 = [v14 hmErrorWithCode:v15];
  [v4 respondWithError:v16];

LABEL_16:
}

- (void)_stopStreamWithError:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraStreamControlMessageHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraStreamControlMessageHandler *)self streamSession];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    uint64_t v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = HMFGetLogIdentifier();
      int v11 = [(HMDCameraStreamControlMessageHandler *)v8 streamSession];
      int v18 = 138543874;
      BOOL v19 = v10;
      __int16 v20 = 2112;
      __int16 v21 = v11;
      __int16 v22 = 2112;
      id v23 = v4;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failing stream session %@: %@", (uint8_t *)&v18, 0x20u);
    }
    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v13 = [(HMDCameraStreamControlMessageHandler *)v8 streamSession];
    uint64_t v14 = [v13 sessionID];
    uint64_t v15 = [v14 sessionID];
    [v12 setObject:v15 forKeyedSubscript:@"kCameraSessionID"];

    if (v4)
    {
      id v16 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
      [v12 setObject:v16 forKeyedSubscript:@"kCameraSessionError"];
    }
    __int16 v17 = [MEMORY[0x263F42568] messageWithName:*MEMORY[0x263F0BD98] messagePayload:v12];
    [(HMDCameraStreamControlMessageHandler *)v8 _handleStopMessage:v17];
  }
}

- (void)takeOwnershipOfStreamUsingMessage:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraStreamControlMessageHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraStreamControlMessageHandler *)self streamSession];

  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_29:
    _HMFPreconditionFailure();
  }
  id v7 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
  uint64_t v8 = [v7 destinationID];

  if (v8) {
    goto LABEL_29;
  }
  uint64_t v9 = [v4 proxyConnection];
  if (v9)
  {
    int v10 = [(HMDCameraStreamControlMessageHandler *)self streamSession];
    int v11 = [v10 streamClientConnection];

    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    uint64_t v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
    if (v11 != v9)
    {
      if (v15)
      {
        id v16 = HMFGetLogIdentifier();
        int v46 = 138543618;
        v47 = v16;
        __int16 v48 = 2112;
        v49 = v9;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Taking ownership of stream using client connection: %@", (uint8_t *)&v46, 0x16u);
      }
      __int16 v17 = [(HMDCameraStreamControlMessageHandler *)v13 streamSession];
      int v18 = [v17 currentMessage];

      if (v18)
      {
        if (([(id)objc_opt_class() _isNegotiateMessage:v18] & 1) == 0)
        {
          uint64_t v41 = (void *)MEMORY[0x230FBD990]();
          __int16 v42 = v13;
          uint64_t v43 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            uint64_t v44 = HMFGetLogIdentifier();
            id v45 = [v18 shortDescription];
            int v46 = 138543618;
            v47 = v44;
            __int16 v48 = 2112;
            v49 = v45;
            _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_ERROR, "%{public}@Cannot take ownership of stream because stream is handling a non-negotiate message: %@", (uint8_t *)&v46, 0x16u);
          }
          __int16 v40 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
          [v4 respondWithError:v40];
          goto LABEL_26;
        }
        BOOL v19 = [(HMDCameraStreamControlMessageHandler *)v13 streamSession];
        [v19 setCurrentMessage:v4];

        __int16 v20 = (void *)MEMORY[0x230FBD990]();
        __int16 v21 = v13;
        __int16 v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          id v23 = HMFGetLogIdentifier();
          uint64_t v24 = [v18 shortDescription];
          int v46 = 138543618;
          v47 = v23;
          __int16 v48 = 2112;
          v49 = v24;
          _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Responding to existing negotiate message: %@", (uint8_t *)&v46, 0x16u);
        }
        uint64_t v25 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1049];
        [v18 respondWithError:v25];
      }
      else
      {
        int v34 = (void *)MEMORY[0x230FBD990]();
        __int16 v35 = v13;
        uint64_t v36 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          __int16 v37 = HMFGetLogIdentifier();
          char v38 = [v4 shortDescription];
          int v46 = 138543618;
          v47 = v37;
          __int16 v48 = 2112;
          v49 = v38;
          _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_INFO, "%{public}@Notifying existing stream client that stream has stopped and responding to new stream client message: %@", (uint8_t *)&v46, 0x16u);
        }
        __int16 v39 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1049];
        [(HMDCameraStreamControlMessageHandler *)v35 _sendStreamStoppedMessageWithError:v39];

        [(HMDCameraStreamControlMessageHandler *)v35 _respondToLocalNegotiateStreamMessage:v4];
        uint64_t v25 = [v9 applicationBundleIdentifier];
        [(HMDCameraStreamControlMessageHandler *)v35 _attributeMicrophoneUsageToApplicationBundleIdentifier:v25];
      }

      __int16 v40 = [(HMDCameraStreamControlMessageHandler *)v13 streamSession];
      [v40 setStreamClientConnection:v9];
LABEL_26:

      goto LABEL_27;
    }
    if (v15)
    {
      uint64_t v33 = HMFGetLogIdentifier();
      int v46 = 138543362;
      v47 = v33;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Client requested to start a stream while it already owns one", (uint8_t *)&v46, 0xCu);
    }
    uint64_t v31 = (void *)MEMORY[0x263F087E8];
    uint64_t v32 = 1;
  }
  else
  {
    uint64_t v26 = (void *)MEMORY[0x230FBD990]();
    uint64_t v27 = self;
    id v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      __int16 v29 = HMFGetLogIdentifier();
      uint64_t v30 = [v4 shortDescription];
      int v46 = 138543618;
      v47 = v29;
      __int16 v48 = 2112;
      v49 = v30;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Cannot find XPC client connection while taking ownership of stream using message: %@", (uint8_t *)&v46, 0x16u);
    }
    uint64_t v31 = (void *)MEMORY[0x263F087E8];
    uint64_t v32 = 58;
  }
  int v18 = [v31 hmErrorWithCode:v32];
  [v4 respondWithError:v18];
LABEL_27:
}

- (void)setStreamSession:(id)a3
{
  id v4 = (HMDCameraStreamManagerSession *)a3;
  id v5 = [(HMDCameraStreamControlMessageHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  streamSession = self->_streamSession;
  self->_streamSession = v4;

  id v8 = [(HMDCameraStreamControlMessageHandler *)self streamSnapshotHandler];
  id v7 = [(HMDCameraStreamControlMessageHandler *)self streamManagementService];
  [v8 setStreamSetupStatusForService:v7 inProgress:v4 != 0];
}

- (HMDCameraStreamManagerSession)streamSession
{
  id v3 = [(HMDCameraStreamControlMessageHandler *)self workQueue];
  dispatch_assert_queue_V2(v3);

  streamSession = self->_streamSession;
  return streamSession;
}

- (void)configureWithMessageDispatcher:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCameraStreamControlMessageHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v10 = [(HMDCameraStreamControlMessageHandler *)self accessory];
  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:self selector:sel_handleAccessoryUnconfigured_ name:@"HMDAccessoryDisconnectedNotification" object:v10];

  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel_handleProcessStateChange_ name:HMDProcessMonitorProcessStateDidChangeNotification object:0];

  id v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 addObserver:self selector:sel_handleConnectionDeactivatedNotification_ name:@"HMDXPCClientConnectionDidDeactivateNotification" object:0];

  uint64_t v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 addObserver:self selector:sel_handleCameraSettingsDidChangeNotification_ name:@"HMDCameraProfileSettingsDidChangeNotification" object:v10];

  [(HMDCameraStreamControlMessageHandler *)self setMessageDispatcher:v4];
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = [(HMDCameraStreamControlMessageHandler *)self accessory];
  id v5 = [v4 name];
  id v6 = [(HMDCameraStreamControlMessageHandler *)self streamManagementService];
  id v7 = [v6 instanceID];
  id v8 = [v3 stringWithFormat:@"%@/%@", v5, v7];

  return (NSString *)v8;
}

- (void)dealloc
{
  id v3 = self->_streamSession;
  id v4 = v3;
  if (v3)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__HMDCameraStreamControlMessageHandler_dealloc__block_invoke;
    block[3] = &unk_264A2F7F8;
    id v8 = v3;
    dispatch_async(workQueue, block);
  }
  v6.receiver = self;
  v6.super_class = (Class)HMDCameraStreamControlMessageHandler;
  [(HMDCameraStreamControlMessageHandler *)&v6 dealloc];
}

void __47__HMDCameraStreamControlMessageHandler_dealloc__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) streamControlManager];
  v1 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1039];
  [v2 stopStreamWithError:v1];
}

- (HMDCameraStreamControlMessageHandler)initWithWorkQueue:(id)a3 streamSnapshotHandler:(id)a4 accessory:(id)a5 streamManagementService:(id)a6 profileUniqueIdentifier:(id)a7 networkMonitor:(id)a8
{
  uint64_t v14 = NSString;
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  __int16 v21 = [v18 name];
  __int16 v22 = [v17 instanceID];
  id v23 = [v14 stringWithFormat:@"%@/%@", v21, v22];

  uint64_t v24 = [[HMDCameraResidentMessageHandler alloc] initWithAccessory:v18 logIdentifier:v23];
  uint64_t v25 = objc_alloc_init(HMDCameraStreamControlMessageHandlerDataSource);
  uint64_t v26 = [(HMDCameraStreamControlMessageHandler *)self initWithWorkQueue:v20 streamSnapshotHandler:v19 accessory:v18 streamManagementService:v17 profileUniqueIdentifier:v16 networkMonitor:v15 residentMessageHandler:v24 dataSource:v25];

  return v26;
}

- (HMDCameraStreamControlMessageHandler)initWithWorkQueue:(id)a3 streamSnapshotHandler:(id)a4 accessory:(id)a5 streamManagementService:(id)a6 profileUniqueIdentifier:(id)a7 networkMonitor:(id)a8 residentMessageHandler:(id)a9 dataSource:(id)a10
{
  v41[1] = *MEMORY[0x263EF8340];
  id v38 = a3;
  id v37 = a4;
  id obj = a5;
  id v17 = a6;
  id v18 = a7;
  id v36 = a8;
  id v35 = a9;
  id v19 = v17;
  id v20 = a10;
  v40.receiver = self;
  v40.super_class = (Class)HMDCameraStreamControlMessageHandler;
  __int16 v21 = [(HMDCameraStreamControlMessageHandler *)&v40 init];
  __int16 v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_workQueue, a3);
    objc_storeStrong((id *)&v22->_streamSnapshotHandler, a4);
    objc_storeWeak((id *)&v22->_accessory, obj);
    objc_storeStrong((id *)&v22->_profileUniqueIdentifier, a7);
    objc_storeStrong((id *)&v22->_streamManagementService, a6);
    objc_storeStrong((id *)&v22->_residentMessageHandler, a9);
    id v23 = NSString;
    uint64_t v24 = [v19 instanceID];
    uint64_t v25 = [v23 stringWithFormat:@"%@", v24];

    uint64_t v26 = (void *)MEMORY[0x263F08C38];
    v41[0] = v25;
    uint64_t v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:1];
    uint64_t v28 = objc_msgSend(v26, "hm_deriveUUIDFromBaseUUID:withSalts:", v18, v27);
    uniqueIdentifier = v22->_uniqueIdentifier;
    v22->_uniqueIdentifier = (NSUUID *)v28;

    uint64_t v30 = objc_alloc_init(HMDCameraSupportedConfigurationCache);
    supportedConfigCache = v22->_supportedConfigCache;
    v22->_supportedConfigCache = v30;

    objc_storeStrong((id *)&v22->_networkMonitor, a8);
    uint64_t v32 = [v20 createDynamicActivityAttributionPublisher];
    dynamicActivityAttributionPublisher = v22->_dynamicActivityAttributionPublisher;
    v22->_dynamicActivityAttributionPublisher = (HMDDynamicActivityAttributionPublisher *)v32;

    objc_storeStrong((id *)&v22->_dataSource, a10);
  }

  return v22;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t43_91113 != -1) {
    dispatch_once(&logCategory__hmf_once_t43_91113, &__block_literal_global_91114);
  }
  id v2 = (void *)logCategory__hmf_once_v44_91115;
  return v2;
}

void __51__HMDCameraStreamControlMessageHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v44_91115;
  logCategory__hmf_once_v44_91115 = v0;
}

+ (BOOL)_isRemoteSetupMessage:(id)a3
{
  id v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"kStreamRemoteConnectionSetupNotificationKey"];

  return v4;
}

+ (BOOL)_isSetAudioVolumeMessage:(id)a3
{
  id v3 = [a3 name];
  char v4 = [v3 isEqualToString:*MEMORY[0x263F0BD90]];

  return v4;
}

+ (BOOL)_isSetAudioStreamSettingMessage:(id)a3
{
  id v3 = [a3 name];
  char v4 = [v3 isEqualToString:*MEMORY[0x263F0BD88]];

  return v4;
}

+ (BOOL)_isStopMessage:(id)a3
{
  id v3 = a3;
  char v4 = [v3 name];
  if ([v4 isEqualToString:*MEMORY[0x263F0BD98]])
  {
    char v5 = 1;
  }
  else
  {
    objc_super v6 = [v3 name];
    if ([v6 isEqualToString:@"kStopRemoteStreamRequestKey"])
    {
      char v5 = 1;
    }
    else
    {
      id v7 = [v3 name];
      char v5 = [v7 isEqualToString:@"kStreamStoppedRemoteNotificationKey"];
    }
  }

  return v5;
}

+ (BOOL)_isUpdateMaximumVideoResolutionQualityMessage:(id)a3
{
  id v3 = [a3 name];
  char v4 = [v3 isEqualToString:*MEMORY[0x263F0BDA8]];

  return v4;
}

+ (BOOL)_isReconfigureMessage:(id)a3
{
  id v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"kReconfigureRemoteStreamRequestKey"];

  return v4;
}

+ (BOOL)_isStartMessage:(id)a3
{
  id v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"kStartRemoteStreamRequestKey"];

  return v4;
}

+ (BOOL)_isNegotiateMessage:(id)a3
{
  id v3 = a3;
  char v4 = [v3 name];
  if ([v4 isEqualToString:@"kNegotitateRemoteStreamRequestKey"])
  {
    char v5 = 1;
  }
  else
  {
    objc_super v6 = [v3 name];
    char v5 = [v6 isEqualToString:*MEMORY[0x263F0BD80]];
  }
  return v5;
}

@end