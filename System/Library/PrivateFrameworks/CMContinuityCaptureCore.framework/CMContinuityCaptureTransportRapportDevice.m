@interface CMContinuityCaptureTransportRapportDevice
+ (void)queryCameraCapabilitiesFromRemoteDevice:(id)a3 transport:(int64_t)a4;
- (BOOL)active;
- (BOOL)allFeaturesSupported;
- (BOOL)canDeferTermination;
- (BOOL)canReconnect;
- (BOOL)disconnectedWhileWired;
- (BOOL)guest;
- (BOOL)hasStreamIntent;
- (BOOL)isPlacementStepSkipped;
- (BOOL)legacyReconnectRecovery;
- (BOOL)nearby;
- (BOOL)remote;
- (BOOL)terminationDeferred;
- (BOOL)usable;
- (BOOL)userDisconnected;
- (BOOL)wifiP2pActive;
- (BOOL)wired;
- (CMContinuityCaptureCapabilities)capabilities;
- (CMContinuityCaptureMagicStateMonitor)magicStateMonitor;
- (CMContinuityCaptureTransportRapportDevice)initWithRapportDevice:(id)a3 capabilities:(id)a4 remote:(BOOL)a5;
- (NSArray)activeStreams;
- (NSString)description;
- (NSString)deviceModel;
- (NSString)deviceName;
- (NSUUID)deviceIdentifier;
- (OS_dispatch_queue)queue;
- (RPRemoteDisplayDevice)device;
- (id)activeStreamForIdentifier:(id)a3;
- (int64_t)deviceModelType;
- (unint64_t)deviceMajorVersion;
- (unint64_t)deviceMinorVersion;
- (unint64_t)deviceStatus;
- (void)_didCaptureStillImage:(id)a3 entity:(int64_t)a4;
- (void)_handleAVCNegotiation:(int64_t)a3 data:(id)a4;
- (void)_postEvent:(id)a3 entity:(int64_t)a4 data:(id)a5;
- (void)_relaySidebandMessageType:(id)a3 overTransport:(int64_t)a4;
- (void)_setValueForControl:(id)a3 completion:(id)a4;
- (void)_startStream:(id)a3 option:(unint64_t)a4 completion:(id)a5;
- (void)_stopStream:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5;
- (void)_synchronizeAudioClockWithSampleTime:(unint64_t)a3 networkTime:(unint64_t)a4 clockGrandMasterIdentifier:(unint64_t)a5;
- (void)addStream:(id)a3;
- (void)captureStillImage:(id)a3 entity:(int64_t)a4 completion:(id)a5;
- (void)dealloc;
- (void)didCaptureStillImage:(id)a3 entity:(int64_t)a4;
- (void)enqueueReactionEffect:(id)a3 entity:(int64_t)a4;
- (void)handleAVCNegotiation:(int64_t)a3 data:(id)a4;
- (void)handleSynchronizeAudioClockCompletion;
- (void)notifyDeviceStateChange;
- (void)postEvent:(id)a3 entity:(int64_t)a4 data:(id)a5;
- (void)postEvent:(id)a3 entity:(int64_t)a4 data:(id)a5 forTransport:(int64_t)a6;
- (void)preLaunchShieldUIForTransport:(int64_t)a3 data:(id)a4;
- (void)relaySkipPlacementStepForTranport:(int64_t)a3;
- (void)relayUserDisconnectForTransport:(int64_t)a3 reason:(id)a4 shieldSessionID:(id)a5;
- (void)removeStream:(id)a3;
- (void)resetDevice:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setDeviceMajorVersion:(unint64_t)a3;
- (void)setDeviceMinorVersion:(unint64_t)a3;
- (void)setNearby:(BOOL)a3;
- (void)setPlacementStepSkipped:(BOOL)a3;
- (void)setStreamIntent:(BOOL)a3;
- (void)setTerminationDeferred:(BOOL)a3;
- (void)setUserDisconnected:(BOOL)a3;
- (void)setValueForControl:(id)a3 completion:(id)a4;
- (void)startStream:(id)a3 option:(unint64_t)a4 completion:(id)a5;
- (void)stopStream:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5;
- (void)synchronizeAudioClockWithSampleTime:(unint64_t)a3 networkTime:(unint64_t)a4 clockGrandMasterIdentifier:(unint64_t)a5;
- (void)teardownActiveRapportStreams;
- (void)updateSystemState;
@end

@implementation CMContinuityCaptureTransportRapportDevice

- (CMContinuityCaptureTransportRapportDevice)initWithRapportDevice:(id)a3 capabilities:(id)a4 remote:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v31.receiver = self;
  v31.super_class = (Class)CMContinuityCaptureTransportRapportDevice;
  v11 = [(CMContinuityCaptureTransportRapportDevice *)&v31 init];
  v12 = v11;
  if (!v11 || (objc_storeStrong((id *)&v11->_device, a3), objc_storeStrong((id *)&v12->_capabilities, a4), !v10))
  {
LABEL_20:
    v29 = 0;
    goto LABEL_16;
  }
  v12->_remote = a5;
  id v13 = objc_alloc(MEMORY[0x263F08C38]);
  v14 = [v9 idsDeviceIdentifier];
  if (v14
    && ([v9 idsDeviceIdentifier], a4 = (id)objc_claimAutoreleasedReturnValue(),
                                                 [a4 length]))
  {
    v15 = [v9 idsDeviceIdentifier];
    int v16 = 0;
    int v17 = 1;
  }
  else
  {
    v15 = [v9 identifier];
    int v17 = 0;
    int v16 = 1;
  }
  uint64_t v18 = [v13 initWithUUIDString:v15];
  deviceUUID = v12->_deviceUUID;
  v12->_deviceUUID = (NSUUID *)v18;

  if (v16)
  {

    if (!v17)
    {
LABEL_9:
      if (!v14) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if (!v17)
  {
    goto LABEL_9;
  }

  if (v14) {
LABEL_10:
  }

LABEL_11:
  objc_storeStrong((id *)&v12->_queue, MEMORY[0x263EF83A0]);
  v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v21 = dispatch_queue_create("com.apple.continuitycapture.sideband", v20);
  sidebandQueue = v12->_sidebandQueue;
  v12->_sidebandQueue = (OS_dispatch_queue *)v21;

  v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  activeStreams = v12->_activeStreams;
  v12->_activeStreams = v23;

  if (v12->_capabilities)
  {
    v25 = [(CMContinuityCaptureTransportRapportDevice *)v12 capabilities];
    v26 = [v25 devicesCapabilities];
    v12->_allFeaturesSupported = CMContinuityCaptureDeviceSupportsAllFeatures(v26);
  }
  if (v12->_remote)
  {
    v27 = [[CMContinuityCaptureMagicStateMonitor alloc] initWithDevice:v12];
    magicStateMonitor = v12->_magicStateMonitor;
    v12->_magicStateMonitor = v27;

    if (!v12->_magicStateMonitor) {
      goto LABEL_20;
    }
  }
  v29 = v12;
LABEL_16:

  return v29;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = self->_rpCompanionSidebandSessions;
  objc_sync_enter(v3);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = self->_rpCompanionSidebandSessions;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) invalidate];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v3);
  v8.receiver = self;
  v8.super_class = (Class)CMContinuityCaptureTransportRapportDevice;
  [(CMContinuityCaptureTransportRapportDevice *)&v8 dealloc];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)resetDevice:(id)a3
{
  v4 = (RPRemoteDisplayDevice *)a3;
  obj = self;
  objc_sync_enter(obj);
  device = obj->_device;
  obj->_device = v4;

  objc_sync_exit(obj);
}

- (BOOL)canReconnect
{
  return [(CMContinuityCaptureTransportRapportDevice *)self userDisconnected]
      && [(CMContinuityCaptureTransportRapportDevice *)self wired]
      && ![(CMContinuityCaptureTransportRapportDevice *)self disconnectedWhileWired];
}

- (RPRemoteDisplayDevice)device
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_device;
  objc_sync_exit(v2);

  return v3;
}

- (void)teardownActiveRapportStreams
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__CMContinuityCaptureTransportRapportDevice_teardownActiveRapportStreams__block_invoke;
  block[3] = &unk_264C99148;
  block[4] = self;
  dispatch_async_and_wait(queue, block);
}

uint64_t __73__CMContinuityCaptureTransportRapportDevice_teardownActiveRapportStreams__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "allValues", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = [*(id *)(*((void *)&v12 + 1) + 8 * v6) stream];
        [v7 invalidate];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
  [*(id *)(a1 + 32) willChangeValueForKey:@"activeStreams"];
  id v8 = *(id *)(a1 + 32);
  objc_sync_enter(v8);
  [*(id *)(*(void *)(a1 + 32) + 56) removeAllObjects];
  objc_sync_exit(v8);

  long long v10 = *(void **)(a1 + 32);
  long long v9 = (id *)(a1 + 32);
  [v10 didChangeValueForKey:@"activeStreams"];
  [*v9 willChangeValueForKey:@"active"];
  *((unsigned char *)*v9 + 88) = 0;
  return [*v9 didChangeValueForKey:@"active"];
}

- (void)addStream:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    long long v12 = self;
    __int16 v13 = 2080;
    long long v14 = "-[CMContinuityCaptureTransportRapportDevice addStream:]";
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %{public}@", buf, 0x20u);
  }

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__CMContinuityCaptureTransportRapportDevice_addStream___block_invoke;
  v8[3] = &unk_264C99080;
  id v9 = v4;
  long long v10 = self;
  id v7 = v4;
  dispatch_async_and_wait(queue, v8);
}

void __55__CMContinuityCaptureTransportRapportDevice_addStream___block_invoke(uint64_t a1)
{
  uint64_t v6 = [[CMContinuityCaptureTransportDeviceRapportStream alloc] initWithRapportStream:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) willChangeValueForKey:@"activeStreams"];
  id v2 = *(id *)(a1 + 40);
  objc_sync_enter(v2);
  uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 56) count];
  id v4 = *(void **)(*(void *)(a1 + 40) + 56);
  uint64_t v5 = [*(id *)(a1 + 32) streamID];
  [v4 setObject:v6 forKeyedSubscript:v5];

  objc_sync_exit(v2);
  [*(id *)(a1 + 40) didChangeValueForKey:@"activeStreams"];
  if (!v3)
  {
    [*(id *)(a1 + 40) willChangeValueForKey:@"active"];
    *(unsigned char *)(*(void *)(a1 + 40) + 88) = 1;
    [*(id *)(a1 + 40) didChangeValueForKey:@"active"];
  }
}

- (void)removeStream:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    long long v11 = self;
    __int16 v12 = 2080;
    __int16 v13 = "-[CMContinuityCaptureTransportRapportDevice removeStream:]";
    __int16 v14 = 2114;
    id v15 = v4;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %{public}@", buf, 0x20u);
  }

  [v4 invalidate];
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__CMContinuityCaptureTransportRapportDevice_removeStream___block_invoke;
  v8[3] = &unk_264C99080;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async_and_wait(queue, v8);
}

void __58__CMContinuityCaptureTransportRapportDevice_removeStream___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  id v3 = *(id *)(*(void *)(a1 + 32) + 56);
  objc_sync_exit(v2);

  id v4 = [*(id *)(a1 + 40) streamID];
  uint64_t v5 = [v3 objectForKey:v4];

  if (v5)
  {
    id v6 = *(id *)(a1 + 32);
    objc_sync_enter(v6);
    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 56) count];
    objc_sync_exit(v6);

    [*(id *)(a1 + 32) willChangeValueForKey:@"activeStreams"];
    id v8 = *(id *)(a1 + 32);
    objc_sync_enter(v8);
    id v9 = *(void **)(*(void *)(a1 + 32) + 56);
    long long v10 = [*(id *)(a1 + 40) streamID];
    [v9 removeObjectForKey:v10];

    objc_sync_exit(v8);
    [*(id *)(a1 + 32) didChangeValueForKey:@"activeStreams"];
    id v11 = *(id *)(a1 + 32);
    objc_sync_enter(v11);
    id v14 = *(id *)(*(void *)(a1 + 32) + 56);

    objc_sync_exit(v11);
    if ([v14 count] || !v7) {
      goto LABEL_10;
    }
    [*(id *)(a1 + 32) willChangeValueForKey:@"active"];
  }
  else
  {
    if ([v3 count] || (__int16 v13 = *(unsigned char **)(a1 + 32), !v13[88]))
    {
      __int16 v12 = v3;
      goto LABEL_11;
    }
    [v13 willChangeValueForKey:@"active"];
    id v14 = v3;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 88) = 0;
  [*(id *)(a1 + 32) didChangeValueForKey:@"active"];
LABEL_10:
  __int16 v12 = v14;
LABEL_11:
}

- (BOOL)hasStreamIntent
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL streamIntent = v2->_streamIntent;
  objc_sync_exit(v2);

  return streamIntent;
}

- (void)setStreamIntent:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543874;
    id v8 = self;
    __int16 v9 = 2080;
    long long v10 = "-[CMContinuityCaptureTransportRapportDevice setStreamIntent:]";
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %d", (uint8_t *)&v7, 0x1Cu);
  }

  id v6 = self;
  objc_sync_enter(v6);
  v6->_BOOL streamIntent = v3;
  objc_sync_exit(v6);
}

- (BOOL)active
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL active = v2->_active;
  objc_sync_exit(v2);

  return active;
}

- (BOOL)remote
{
  return self->_remote;
}

- (CMContinuityCaptureMagicStateMonitor)magicStateMonitor
{
  return self->_magicStateMonitor;
}

- (NSArray)activeStreams
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_alloc(MEMORY[0x263EFF8C0]);
  id v4 = [(NSMutableDictionary *)v2->_activeStreams allValues];
  uint64_t v5 = (void *)[v3 initWithArray:v4];

  objc_sync_exit(v2);
  return (NSArray *)v5;
}

- (void)setUserDisconnected:(BOOL)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  v4->_userDisconnected = a3;
  objc_sync_exit(v4);

  if ([(CMContinuityCaptureTransportRapportDevice *)v4 wired])
  {
    obj = v4;
    objc_sync_enter(obj);
    obj->_disconnectedWhileWired = 1;
    objc_sync_exit(obj);
  }
}

- (BOOL)userDisconnected
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL userDisconnected = v2->_userDisconnected;
  objc_sync_exit(v2);

  return userDisconnected;
}

- (BOOL)disconnectedWhileWired
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL disconnectedWhileWired = v2->_disconnectedWhileWired;
  objc_sync_exit(v2);

  return disconnectedWhileWired;
}

- (BOOL)wifiP2pActive
{
  id v2 = [(CMContinuityCaptureTransportRapportDevice *)self device];
  unint64_t v3 = ((unint64_t)[v2 statusFlags] >> 9) & 1;

  return v3;
}

- (BOOL)allFeaturesSupported
{
  return self->_allFeaturesSupported;
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceUUID;
}

- (NSString)deviceName
{
  id v2 = [(CMContinuityCaptureTransportRapportDevice *)self device];
  unint64_t v3 = [v2 name];

  return (NSString *)v3;
}

- (NSString)deviceModel
{
  id v2 = [(CMContinuityCaptureTransportRapportDevice *)self device];
  unint64_t v3 = [v2 model];

  return (NSString *)v3;
}

- (int64_t)deviceModelType
{
  id v2 = [(CMContinuityCaptureTransportRapportDevice *)self device];
  unint64_t v3 = [v2 model];
  int64_t v4 = CMContinuityCaptureDeviceModelFromModelString();

  return v4;
}

- (unint64_t)deviceStatus
{
  id v2 = [(CMContinuityCaptureTransportRapportDevice *)self device];
  unint64_t v3 = [v2 statusFlags];

  return v3;
}

- (BOOL)wired
{
  id v2 = [(CMContinuityCaptureTransportRapportDevice *)self device];
  unint64_t v3 = ((unint64_t)[v2 statusFlags] >> 24) & 1;

  return v3;
}

- (BOOL)usable
{
  id v2 = [(CMContinuityCaptureTransportRapportDevice *)self device];
  BOOL v3 = [v2 cameraState] == 1;

  return v3;
}

- (unint64_t)deviceMajorVersion
{
  id v2 = self;
  objc_sync_enter(v2);
  unint64_t deviceMajorVersion = v2->_deviceMajorVersion;
  objc_sync_exit(v2);

  return deviceMajorVersion;
}

- (void)setDeviceMajorVersion:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_unint64_t deviceMajorVersion = a3;
  objc_sync_exit(obj);
}

- (unint64_t)deviceMinorVersion
{
  id v2 = self;
  objc_sync_enter(v2);
  unint64_t deviceMinorVersion = v2->_deviceMinorVersion;
  objc_sync_exit(v2);

  return deviceMinorVersion;
}

- (void)setDeviceMinorVersion:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_unint64_t deviceMinorVersion = a3;
  objc_sync_exit(obj);
}

- (BOOL)terminationDeferred
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL terminationDeferred = v2->_terminationDeferred;
  objc_sync_exit(v2);

  return terminationDeferred;
}

- (void)setTerminationDeferred:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL terminationDeferred = a3;
  objc_sync_exit(obj);
}

- (BOOL)canDeferTermination
{
  if ([(CMContinuityCaptureTransportRapportDevice *)self hasStreamIntent]
    && ![(CMContinuityCaptureTransportRapportDevice *)self userDisconnected])
  {
    int64_t v4 = [(CMContinuityCaptureTransportRapportDevice *)self capabilities];
    if (v4)
    {
      uint64_t v5 = [(CMContinuityCaptureTransportRapportDevice *)self capabilities];
      int v3 = [v5 userDisabled] ^ 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)isPlacementStepSkipped
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL placementStepSkipped = v2->_placementStepSkipped;
  objc_sync_exit(v2);

  return placementStepSkipped;
}

- (BOOL)guest
{
  id v2 = [(CMContinuityCaptureTransportRapportDevice *)self device];
  unint64_t v3 = ((unint64_t)[v2 statusFlags] >> 37) & 1;

  return v3;
}

- (BOOL)legacyReconnectRecovery
{
  return 0;
}

- (void)setPlacementStepSkipped:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412802;
    id v8 = self;
    __int16 v9 = 2080;
    long long v10 = "-[CMContinuityCaptureTransportRapportDevice setPlacementStepSkipped:]";
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%@ %s %d", (uint8_t *)&v7, 0x1Cu);
  }

  id v6 = self;
  objc_sync_enter(v6);
  v6->_BOOL placementStepSkipped = v3;
  objc_sync_exit(v6);
}

- (void)notifyDeviceStateChange
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (![(CMContinuityCaptureTransportRapportDevice *)self wired]
    && [(CMContinuityCaptureTransportRapportDevice *)self userDisconnected])
  {
    BOOL v3 = self;
    objc_sync_enter(v3);
    v3->_BOOL disconnectedWhileWired = 0;
    objc_sync_exit(v3);
  }
  int64_t v4 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[CMContinuityCaptureTransportRapportDevice notifyDeviceStateChange]";
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(CMContinuityCaptureTransportRapportDevice *)self willChangeValueForKey:@"deviceStatus"];
  [(CMContinuityCaptureTransportRapportDevice *)self didChangeValueForKey:@"deviceStatus"];
  [(CMContinuityCaptureTransportRapportDevice *)self willChangeValueForKey:@"usable"];
  [(CMContinuityCaptureTransportRapportDevice *)self didChangeValueForKey:@"usable"];
  [(CMContinuityCaptureTransportRapportDevice *)self willChangeValueForKey:@"wired"];
  [(CMContinuityCaptureTransportRapportDevice *)self didChangeValueForKey:@"wired"];
  [(CMContinuityCaptureTransportRapportDevice *)self willChangeValueForKey:@"nearby"];
  [(CMContinuityCaptureTransportRapportDevice *)self didChangeValueForKey:@"nearby"];
}

- (void)relayUserDisconnectForTransport:(int64_t)a3 reason:(id)a4 shieldSessionID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __100__CMContinuityCaptureTransportRapportDevice_relayUserDisconnectForTransport_reason_shieldSessionID___block_invoke;
  v13[3] = &unk_264C9A918;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

void __100__CMContinuityCaptureTransportRapportDevice_relayUserDisconnectForTransport_reason_shieldSessionID___block_invoke(void *a1)
{
  v6[3] = *MEMORY[0x263EF8340];
  v5[0] = @"ContinuityCaptureRapportClientMessageTypeKey";
  v5[1] = @"ContinuityCaptureRapportClientUserDisconnectReasonKey";
  BOOL v3 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v6[0] = &unk_26E96A5E8;
  v6[1] = v2;
  v5[2] = @"ContinuityCaptureRapportClientShieldSessionIDKey";
  v6[2] = a1[6];
  int64_t v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:3];
  [v3 _relaySidebandMessageType:v4 overTransport:a1[7]];
}

- (void)preLaunchShieldUIForTransport:(int64_t)a3 data:(id)a4
{
  id v6 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __80__CMContinuityCaptureTransportRapportDevice_preLaunchShieldUIForTransport_data___block_invoke;
  v9[3] = &unk_264C997E8;
  objc_copyWeak(v11, &location);
  id v10 = v6;
  v11[1] = (id)a3;
  id v8 = v6;
  dispatch_async(queue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __80__CMContinuityCaptureTransportRapportDevice_preLaunchShieldUIForTransport_data___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v3 setObject:&unk_26E96A600 forKeyedSubscript:@"ContinuityCaptureRapportClientMessageTypeKey"];
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      [v3 setObject:v4 forKeyedSubscript:@"ContinuityCaptureRapportClientShieldLaunchDataKey"];
    }
    [v5 _relaySidebandMessageType:v3 overTransport:*(void *)(a1 + 48)];

    id WeakRetained = v5;
  }
}

- (void)relaySkipPlacementStepForTranport:(int64_t)a3
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__CMContinuityCaptureTransportRapportDevice_relaySkipPlacementStepForTranport___block_invoke;
  block[3] = &unk_264C9A320;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __79__CMContinuityCaptureTransportRapportDevice_relaySkipPlacementStepForTranport___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = @"ContinuityCaptureRapportClientMessageTypeKey";
    v5[0] = &unk_26E96A618;
    id v3 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
    [WeakRetained _relaySidebandMessageType:v3 overTransport:*(void *)(a1 + 40)];
  }
}

- (void)updateSystemState
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    __int16 v8 = 2080;
    id v9 = "-[CMContinuityCaptureTransportRapportDevice updateSystemState]";
    _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  void v5[2] = __62__CMContinuityCaptureTransportRapportDevice_updateSystemState__block_invoke;
  void v5[3] = &unk_264C99120;
  objc_copyWeak(&v6, (id *)buf);
  v5[4] = self;
  dispatch_async(queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __62__CMContinuityCaptureTransportRapportDevice_updateSystemState__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if ([*(id *)(a1 + 32) wired])
    {
      uint64_t v4 = 2;
    }
    else
    {
      if (([*(id *)(a1 + 32) wifiP2pActive] & 1) == 0)
      {
        id v6 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          __62__CMContinuityCaptureTransportRapportDevice_updateSystemState__block_invoke_cold_1(v2);
        }
        goto LABEL_11;
      }
      uint64_t v4 = 1;
    }
    id v5 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v10 = WeakRetained;
      __int16 v11 = 2080;
      id v12 = "-[CMContinuityCaptureTransportRapportDevice updateSystemState]_block_invoke";
      _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s: calling _relaySidebandMessageType of ContinuityCaptureRapportSidebandClientMessageTypeUpdateSystemState", buf, 0x16u);
    }

    uint64_t v7 = @"ContinuityCaptureRapportClientMessageTypeKey";
    __int16 v8 = &unk_26E96A630;
    id v6 = [NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
    [WeakRetained _relaySidebandMessageType:v6 overTransport:v4];
LABEL_11:
  }
}

- (void)postEvent:(id)a3 entity:(int64_t)a4 data:(id)a5 forTransport:(int64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __80__CMContinuityCaptureTransportRapportDevice_postEvent_entity_data_forTransport___block_invoke;
  v15[3] = &unk_264C9A940;
  objc_copyWeak(v18, &location);
  id v16 = v10;
  id v17 = v11;
  v18[1] = (id)a4;
  v18[2] = (id)a6;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(queue, v15);

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
}

void __80__CMContinuityCaptureTransportRapportDevice_postEvent_entity_data_forTransport___block_invoke(uint64_t a1)
{
  void v9[4] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v8[0] = @"ContinuityCaptureRapportClientMessageTypeKey";
    v8[1] = @"ContinuityCaptureRapportClientEventNameKey";
    uint64_t v3 = *(void *)(a1 + 32);
    v9[0] = &unk_26E96A648;
    v9[1] = v3;
    v8[2] = @"ContinuityCaptureRapportClientEventEntityTypeKey";
    uint64_t v4 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
    id v5 = (void *)v4;
    v8[3] = @"ContinuityCaptureRapportClientEventDataKey";
    uint64_t v6 = *(void *)(a1 + 40);
    if (!v6) {
      uint64_t v6 = MEMORY[0x263EFFA78];
    }
    v9[2] = v4;
    v9[3] = v6;
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];
    [WeakRetained _relaySidebandMessageType:v7 overTransport:*(void *)(a1 + 64)];
  }
}

+ (void)queryCameraCapabilitiesFromRemoteDevice:(id)a3 transport:(int64_t)a4
{
  int v4 = a4;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "+[CMContinuityCaptureTransportRapportDevice queryCameraCapabilitiesFromRemoteDevice:transport:]";
    __int16 v21 = 2114;
    id v22 = v5;
    __int16 v23 = 1024;
    int v24 = v4;
    _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%s for device %{public}@ for transport %d", buf, 0x1Cu);
  }

  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  id v8 = objc_alloc_init(MEMORY[0x263F62B70]);
  id v9 = objc_alloc_init(MEMORY[0x263F62B80]);
  id v10 = [v5 identifier];
  [v9 setIdentifier:v10];

  [v8 setDestinationDevice:v9];
  [v8 setServiceType:@"com.apple.continuitycapture.sideband"];
  id v11 = dispatch_get_global_queue(0, 0);
  [v8 setDispatchQueue:v11];

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, v8);
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __95__CMContinuityCaptureTransportRapportDevice_queryCameraCapabilitiesFromRemoteDevice_transport___block_invoke;
  id v17 = &unk_264C996D8;
  objc_copyWeak(&v19, (id *)buf);
  id v12 = v7;
  uint64_t v18 = v12;
  [v8 activateWithCompletion:&v14];
  dispatch_time_t v13 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v12, v13);
  objc_msgSend(v8, "invalidate", v14, v15, v16, v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

void __95__CMContinuityCaptureTransportRapportDevice_queryCameraCapabilitiesFromRemoteDevice_transport___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v6 = @"ContinuityCaptureRapportClientMessageTypeKey";
    v7[0] = &unk_26E96A660;
    uint64_t v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __95__CMContinuityCaptureTransportRapportDevice_queryCameraCapabilitiesFromRemoteDevice_transport___block_invoke_171;
    v4[3] = &unk_264C9A968;
    id v5 = *(id *)(a1 + 32);
    [WeakRetained sendEventID:@"ContinuityCaptureSidebandSessionEventID" event:v3 options:0 completion:v4];
  }
}

void __95__CMContinuityCaptureTransportRapportDevice_queryCameraCapabilitiesFromRemoteDevice_transport___block_invoke_171(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    uint64_t v6 = "+[CMContinuityCaptureTransportRapportDevice queryCameraCapabilitiesFromRemoteDevice:transport:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s inErrorMessageSend %@", (uint8_t *)&v5, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_relaySidebandMessageType:(id)a3 overTransport:(int64_t)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v6 = (char *)a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  __int16 v7 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = self;
    __int16 v37 = 2112;
    v38 = v6;
    __int16 v39 = 1024;
    LODWORD(v40) = a4;
    _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ relay message %@ for transport %d", buf, 0x1Cu);
  }

  id v8 = [(CMContinuityCaptureTransportRapportDevice *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = objc_alloc_init(MEMORY[0x263F62B70]);
  id v22 = objc_alloc_init(MEMORY[0x263F62B80]);
  id v10 = [(CMContinuityCaptureTransportRapportDevice *)self device];
  id v11 = [v10 identifier];
  [v22 setIdentifier:v11];

  [v9 setDestinationDevice:v22];
  [v9 setServiceType:@"com.apple.continuitycapture.sideband"];
  [v9 setDispatchQueue:self->_sidebandQueue];
  uint64_t v12 = [v9 controlFlags];
  uint64_t v13 = 6;
  if (a4 == 2) {
    uint64_t v13 = 0x40000;
  }
  [v9 setControlFlags:v12 | v13];
  rpCompanionSidebandSessions = self->_rpCompanionSidebandSessions;
  if (!rpCompanionSidebandSessions)
  {
    uint64_t v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    id v16 = self->_rpCompanionSidebandSessions;
    self->_rpCompanionSidebandSessions = v15;

    rpCompanionSidebandSessions = self->_rpCompanionSidebandSessions;
  }
  id v17 = rpCompanionSidebandSessions;
  objc_sync_enter(v17);
  [(NSMutableArray *)self->_rpCompanionSidebandSessions addObject:v9];
  objc_sync_exit(v17);

  uint64_t v18 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = self;
    __int16 v37 = 2082;
    v38 = "-[CMContinuityCaptureTransportRapportDevice _relaySidebandMessageType:overTransport:]";
    __int16 v39 = 2112;
    id v40 = v9;
    _os_log_impl(&dword_235FC2000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s created sideband session %@", buf, 0x20u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, v9);
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __85__CMContinuityCaptureTransportRapportDevice__relaySidebandMessageType_overTransport___block_invoke;
  v32[3] = &unk_264C9A4E0;
  objc_copyWeak(&v33, &location);
  objc_copyWeak(&v34, (id *)buf);
  [v9 setInterruptionHandler:v32];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __85__CMContinuityCaptureTransportRapportDevice__relaySidebandMessageType_overTransport___block_invoke_174;
  v29[3] = &unk_264C9A4E0;
  objc_copyWeak(&v30, &location);
  objc_copyWeak(&v31, (id *)buf);
  [v9 setInvalidationHandler:v29];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __85__CMContinuityCaptureTransportRapportDevice__relaySidebandMessageType_overTransport___block_invoke_175;
  v26[3] = &unk_264C9A9B8;
  v26[4] = self;
  objc_copyWeak(&v28, (id *)buf);
  id v19 = v6;
  v27 = v19;
  [v9 activateWithCompletion:v26];
  dispatch_time_t v20 = dispatch_time(0, 5000000000);
  sidebandQueue = self->_sidebandQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__CMContinuityCaptureTransportRapportDevice__relaySidebandMessageType_overTransport___block_invoke_180;
  block[3] = &unk_264C9A4E0;
  objc_copyWeak(&v24, &location);
  objc_copyWeak(&v25, (id *)buf);
  dispatch_after(v20, sidebandQueue, block);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v24);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&v33);
  objc_destroyWeak((id *)buf);

  objc_destroyWeak(&location);
}

void __85__CMContinuityCaptureTransportRapportDevice__relaySidebandMessageType_overTransport___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    int v10 = 138543874;
    id v11 = WeakRetained;
    __int16 v12 = 2082;
    uint64_t v13 = "-[CMContinuityCaptureTransportRapportDevice _relaySidebandMessageType:overTransport:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_235FC2000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s interrupted sideband session %@", (uint8_t *)&v10, 0x20u);
  }
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 invalidate];
    id v7 = objc_loadWeakRetained((id *)(a1 + 32));
    id v8 = (id *)v7;
    if (v7)
    {
      dispatch_assert_queue_V2(*((dispatch_queue_t *)v7 + 10));
      id v9 = v8[14];
      objc_sync_enter(v9);
      [v8[14] removeObject:v6];
      objc_sync_exit(v9);
    }
  }
}

void __85__CMContinuityCaptureTransportRapportDevice__relaySidebandMessageType_overTransport___block_invoke_174(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    int v9 = 138543874;
    id v10 = WeakRetained;
    __int16 v11 = 2082;
    __int16 v12 = "-[CMContinuityCaptureTransportRapportDevice _relaySidebandMessageType:overTransport:]_block_invoke";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_235FC2000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s invalidated sideband session %@", (uint8_t *)&v9, 0x20u);
  }
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 32));
    id v7 = (id *)v6;
    if (v6)
    {
      dispatch_assert_queue_V2(*((dispatch_queue_t *)v6 + 10));
      id v8 = v7[14];
      objc_sync_enter(v8);
      [v7[14] removeObject:v5];
      objc_sync_exit(v8);
    }
  }
}

void __85__CMContinuityCaptureTransportRapportDevice__relaySidebandMessageType_overTransport___block_invoke_175(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    uint64_t v13 = v5;
    __int16 v14 = 2082;
    uint64_t v15 = "-[CMContinuityCaptureTransportRapportDevice _relaySidebandMessageType:overTransport:]_block_invoke";
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s error %@", buf, 0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v7 = (void *)GestaltCopyAnswer();
    id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v8 setObject:v7 forKeyedSubscript:*MEMORY[0x263F62C90]];
    [v8 addEntriesFromDictionary:*(void *)(a1 + 40)];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __85__CMContinuityCaptureTransportRapportDevice__relaySidebandMessageType_overTransport___block_invoke_179;
    v10[3] = &unk_264C9A990;
    v10[4] = *(void *)(a1 + 32);
    id v11 = v8;
    id v9 = v8;
    [WeakRetained sendEventID:@"ContinuityCaptureSidebandSessionEventID" event:v9 options:0 completion:v10];
  }
}

void __85__CMContinuityCaptureTransportRapportDevice__relaySidebandMessageType_overTransport___block_invoke_179(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138544130;
    uint64_t v8 = v5;
    __int16 v9 = 2082;
    id v10 = "-[CMContinuityCaptureTransportRapportDevice _relaySidebandMessageType:overTransport:]_block_invoke";
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s %{public}@ inErrorMessageSend %@", (uint8_t *)&v7, 0x2Au);
  }
}

void __85__CMContinuityCaptureTransportRapportDevice__relaySidebandMessageType_overTransport___block_invoke_180(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    int v10 = 138543618;
    id v11 = WeakRetained;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_235FC2000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Invalidating sideband session after message send timeout %@", (uint8_t *)&v10, 0x16u);
  }
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 invalidate];
    int v7 = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v8 = v7;
    if (v7)
    {
      id v9 = v7[14];
      objc_sync_enter(v9);
      [v8[14] removeObject:v6];
      objc_sync_exit(v9);
    }
  }
}

- (CMContinuityCaptureCapabilities)capabilities
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_capabilities;
  objc_sync_exit(v2);

  return v3;
}

- (void)setCapabilities:(id)a3
{
  id v4 = (CMContinuityCaptureCapabilities *)a3;
  obj = self;
  objc_sync_enter(obj);
  capabilities = obj->_capabilities;
  obj->_capabilities = v4;

  objc_sync_exit(obj);
}

- (BOOL)nearby
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL nearby = v2->_nearby;
  objc_sync_exit(v2);

  return nearby;
}

- (void)setNearby:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL nearby = a3;
  objc_sync_exit(obj);
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(CMContinuityCaptureTransportRapportDevice *)self deviceIdentifier];
  if (v6)
  {
    int v7 = [(CMContinuityCaptureTransportRapportDevice *)self deviceIdentifier];
    uint64_t v8 = [v7 UUIDString];
    id v9 = [v3 stringWithFormat:@"%@: %@ [%p]", v5, v8, self];
  }
  else
  {
    id v9 = [v3 stringWithFormat:@"%@: %@ [%p]", v5, 0, self];
  }

  return (NSString *)v9;
}

- (void)synchronizeAudioClockWithSampleTime:(unint64_t)a3 networkTime:(unint64_t)a4 clockGrandMasterIdentifier:(unint64_t)a5
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __120__CMContinuityCaptureTransportRapportDevice_synchronizeAudioClockWithSampleTime_networkTime_clockGrandMasterIdentifier___block_invoke;
  block[3] = &unk_264C9A200;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  id v11[2] = (id)a4;
  v11[3] = (id)a5;
  dispatch_async(queue, block);
  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __120__CMContinuityCaptureTransportRapportDevice_synchronizeAudioClockWithSampleTime_networkTime_clockGrandMasterIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _synchronizeAudioClockWithSampleTime:*(void *)(a1 + 40) networkTime:*(void *)(a1 + 48) clockGrandMasterIdentifier:*(void *)(a1 + 56)];
    id WeakRetained = v3;
  }
}

- (id)activeStreamForIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(NSMutableDictionary *)v5->_activeStreams objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  if (!v6)
  {
    int v7 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543618;
      int v10 = v5;
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ invalid stream for %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  return v6;
}

- (void)_synchronizeAudioClockWithSampleTime:(unint64_t)a3 networkTime:(unint64_t)a4 clockGrandMasterIdentifier:(unint64_t)a5
{
  v22[2] = *MEMORY[0x263EF8340];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v22[0] = &unk_26E96A618;
  v21[0] = @"ContinuityCaptureSelector";
  v21[1] = @"ContinuityCaptureArgs";
  int v9 = [NSNumber numberWithUnsignedLongLong:a3];
  v20[0] = v9;
  int v10 = [NSNumber numberWithUnsignedLongLong:a4];
  v20[1] = v10;
  __int16 v11 = [NSNumber numberWithUnsignedLongLong:a5];
  v20[2] = v11;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:3];
  v22[1] = v12;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];

  uint64_t v14 = [(CMContinuityCaptureTransportRapportDevice *)self activeStreamForIdentifier:@"ContinuityCaptureCommand"];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __121__CMContinuityCaptureTransportRapportDevice__synchronizeAudioClockWithSampleTime_networkTime_clockGrandMasterIdentifier___block_invoke;
  v16[3] = &unk_264C996D8;
  objc_copyWeak(&v18, &location);
  id v15 = v13;
  id v17 = v15;
  [v14 sendMessage:@"ContinuityCaptureCommand" message:v15 completion:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __121__CMContinuityCaptureTransportRapportDevice__synchronizeAudioClockWithSampleTime_networkTime_clockGrandMasterIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543874;
    id v8 = WeakRetained;
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = a2;
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ SendMessage %{public}@ Error %@", (uint8_t *)&v7, 0x20u);
  }
}

- (void)didCaptureStillImage:(id)a3 entity:(int64_t)a4
{
  id v6 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __73__CMContinuityCaptureTransportRapportDevice_didCaptureStillImage_entity___block_invoke;
  v9[3] = &unk_264C997E8;
  objc_copyWeak(v11, &location);
  id v10 = v6;
  v11[1] = (id)a4;
  id v8 = v6;
  dispatch_async(queue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __73__CMContinuityCaptureTransportRapportDevice_didCaptureStillImage_entity___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _didCaptureStillImage:*(void *)(a1 + 32) entity:*(void *)(a1 + 48)];
    id WeakRetained = v3;
  }
}

- (void)_didCaptureStillImage:(id)a3 entity:(int64_t)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v17 = 0;
  int v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v17];
  id v8 = v17;
  if (v7)
  {
    v21[0] = &unk_26E96A600;
    v20[0] = @"ContinuityCaptureSelector";
    v20[1] = @"ContinuityCaptureArgs";
    v19[0] = v7;
    __int16 v9 = [NSNumber numberWithInteger:a4];
    v19[1] = v9;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
    v21[1] = v10;
    __int16 v11 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];

    uint64_t v12 = [(CMContinuityCaptureTransportRapportDevice *)self activeStreamForIdentifier:@"ContinuityCaptureData"];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __74__CMContinuityCaptureTransportRapportDevice__didCaptureStillImage_entity___block_invoke;
    v14[3] = &unk_264C996D8;
    objc_copyWeak(&v16, &location);
    uint64_t v13 = v11;
    id v15 = v13;
    [v12 sendMessage:@"ContinuityCaptureData" message:v13 completion:v14];

    objc_destroyWeak(&v16);
  }
  else
  {
    uint64_t v13 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      __int16 v23 = self;
      __int16 v24 = 2112;
      id v25 = v6;
      __int16 v26 = 2112;
      id v27 = v8;
      _os_log_error_impl(&dword_235FC2000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Failed to archive request %@ error %@", buf, 0x20u);
    }
  }

  objc_destroyWeak(&location);
}

void __74__CMContinuityCaptureTransportRapportDevice__didCaptureStillImage_entity___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543874;
    id v8 = WeakRetained;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = a2;
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ SendMessage didCaptureStillImage %@ Error %@", (uint8_t *)&v7, 0x20u);
  }
}

- (void)handleSynchronizeAudioClockCompletion
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __82__CMContinuityCaptureTransportRapportDevice_handleSynchronizeAudioClockCompletion__block_invoke;
  v4[3] = &unk_264C990F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __82__CMContinuityCaptureTransportRapportDevice_handleSynchronizeAudioClockCompletion__block_invoke(uint64_t a1)
{
  void v5[2] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4[0] = @"ContinuityCaptureSelector";
    v4[1] = @"ContinuityCaptureArgs";
    v5[0] = &unk_26E96A660;
    v5[1] = &unk_26E96A8A8;
    uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
    id v3 = [WeakRetained activeStreamForIdentifier:@"ContinuityCaptureCommand"];
    [v3 sendMessage:@"ContinuityCaptureCommand" message:v2 completion:&__block_literal_global_20];
  }
}

- (void)captureStillImage:(id)a3 entity:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__CMContinuityCaptureTransportRapportDevice_captureStillImage_entity_completion___block_invoke;
  block[3] = &unk_264C99300;
  objc_copyWeak(v16, &location);
  id v14 = v8;
  id v15 = v9;
  v16[1] = (id)a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __81__CMContinuityCaptureTransportRapportDevice_captureStillImage_entity_completion___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v14 = 0;
    id v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v14];
    id v5 = v14;
    if (v4)
    {
      v17[0] = &unk_26E96A678;
      v16[0] = @"ContinuityCaptureSelector";
      v16[1] = @"ContinuityCaptureArgs";
      v15[0] = v4;
      uint64_t v6 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
      v15[1] = v6;
      int v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
      v17[1] = v7;
      id v8 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

      id v9 = [WeakRetained activeStreamForIdentifier:@"ContinuityCaptureCommand"];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __81__CMContinuityCaptureTransportRapportDevice_captureStillImage_entity_completion___block_invoke_187;
      v12[3] = &unk_264C9A228;
      id v13 = *(id *)(a1 + 40);
      [v9 sendMessage:@"ContinuityCaptureCommand" message:v8 completion:v12];
    }
    else
    {
      uint64_t v10 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        id v19 = WeakRetained;
        __int16 v20 = 2112;
        uint64_t v21 = v11;
        __int16 v22 = 2112;
        id v23 = v5;
        _os_log_error_impl(&dword_235FC2000, v10, OS_LOG_TYPE_ERROR, "%{public}@ archivedDataWithRootObject %@ Error %@", buf, 0x20u);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

uint64_t __81__CMContinuityCaptureTransportRapportDevice_captureStillImage_entity_completion___block_invoke_187(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enqueueReactionEffect:(id)a3 entity:(int64_t)a4
{
  id v6 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__CMContinuityCaptureTransportRapportDevice_enqueueReactionEffect_entity___block_invoke;
  v9[3] = &unk_264C997E8;
  objc_copyWeak(v11, &location);
  id v10 = v6;
  v11[1] = (id)a4;
  id v8 = v6;
  dispatch_async(queue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __74__CMContinuityCaptureTransportRapportDevice_enqueueReactionEffect_entity___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      id v14 = WeakRetained;
      __int16 v15 = 2114;
      uint64_t v16 = v4;
      __int16 v17 = 1024;
      int v18 = v5;
      _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ enqueueReactionEffect %{public}@ entity:%d", buf, 0x1Cu);
    }

    v12[0] = &unk_26E96A690;
    v11[0] = @"ContinuityCaptureSelector";
    v11[1] = @"ContinuityCaptureArgs";
    id v6 = objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(a1 + 48), *(void *)(a1 + 32));
    v10[1] = v6;
    int v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
    v12[1] = v7;
    id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

    id v9 = [WeakRetained activeStreamForIdentifier:@"ContinuityCaptureCommand"];
    [v9 sendMessage:@"ContinuityCaptureCommand" message:v8 completion:&__block_literal_global_192];
  }
}

- (void)setValueForControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __75__CMContinuityCaptureTransportRapportDevice_setValueForControl_completion___block_invoke;
  v11[3] = &unk_264C99508;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __75__CMContinuityCaptureTransportRapportDevice_setValueForControl_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _setValueForControl:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)_setValueForControl:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __76__CMContinuityCaptureTransportRapportDevice__setValueForControl_completion___block_invoke;
  v17[3] = &unk_264C992D8;
  objc_copyWeak(&v19, &location);
  id v8 = v7;
  id v18 = v8;
  id v9 = (void *)MEMORY[0x237DFB780](v17);
  id v16 = 0;
  id v10 = [MEMORY[0x263F08910] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v16];
  id v11 = v16;
  if (v10)
  {
    v23[0] = &unk_26E96A5E8;
    v22[0] = @"ContinuityCaptureSelector";
    v22[1] = @"ContinuityCaptureArgs";
    uint64_t v21 = v10;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
    v23[1] = v12;
    id v13 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];

    id v14 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v25 = self;
      __int16 v26 = 2114;
      id v27 = v6;
      _os_log_impl(&dword_235FC2000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ setValueForControl %{public}@", buf, 0x16u);
    }

    __int16 v15 = [(CMContinuityCaptureTransportRapportDevice *)self activeStreamForIdentifier:@"ContinuityCaptureControl"];
    [v15 sendMessage:@"ContinuityCaptureControl" message:v13 completion:v9];
  }
  else
  {
    id v13 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v25 = self;
      __int16 v26 = 2112;
      id v27 = v11;
      __int16 v28 = 2112;
      id v29 = v6;
      _os_log_error_impl(&dword_235FC2000, v13, OS_LOG_TYPE_ERROR, "%{public}@ archivedDataWithRootObject Error %@ for control %@", buf, 0x20u);
    }
  }

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

uint64_t __76__CMContinuityCaptureTransportRapportDevice__setValueForControl_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (CMContinityCaptureDebugLogEnabled())
  {
    uint64_t v4 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __76__CMContinuityCaptureTransportSidecarDevice__setValueForControl_completion___block_invoke_cold_1(a1, a2, v4);
    }
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)handleAVCNegotiation:(int64_t)a3 data:(id)a4
{
  id v6 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __71__CMContinuityCaptureTransportRapportDevice_handleAVCNegotiation_data___block_invoke;
  v9[3] = &unk_264C997E8;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __71__CMContinuityCaptureTransportRapportDevice_handleAVCNegotiation_data___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _handleAVCNegotiation:*(void *)(a1 + 48) data:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)_handleAVCNegotiation:(int64_t)a3 data:(id)a4
{
  v25[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v24[0] = @"ContinuityCaptureSelector";
  v24[1] = @"ContinuityCaptureArgs";
  v25[0] = &unk_26E96A6A8;
  id v7 = [NSNumber numberWithInteger:a3];
  v23[0] = v7;
  v23[1] = v6;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  v25[1] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];

  id v10 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v18 = self;
    __int16 v19 = 2080;
    __int16 v20 = "-[CMContinuityCaptureTransportRapportDevice _handleAVCNegotiation:data:]";
    __int16 v21 = 1024;
    int v22 = a3;
    _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %s for entity %d", buf, 0x1Cu);
  }

  id v11 = [(CMContinuityCaptureTransportRapportDevice *)self activeStreamForIdentifier:@"ContinuityCaptureControl"];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __72__CMContinuityCaptureTransportRapportDevice__handleAVCNegotiation_data___block_invoke;
  v13[3] = &unk_264C996D8;
  objc_copyWeak(&v15, &location);
  id v12 = v9;
  id v14 = v12;
  [v11 sendMessage:@"ContinuityCaptureControl" message:v12 completion:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __72__CMContinuityCaptureTransportRapportDevice__handleAVCNegotiation_data___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (CMContinityCaptureDebugLogEnabled())
  {
    uint64_t v4 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __72__CMContinuityCaptureTransportRapportDevice__handleAVCNegotiation_data___block_invoke_cold_1(a1, (uint64_t)v3, v4);
    }
  }
}

- (void)startStream:(id)a3 option:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__CMContinuityCaptureTransportRapportDevice_startStream_option_completion___block_invoke;
  block[3] = &unk_264C99300;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __75__CMContinuityCaptureTransportRapportDevice_startStream_option_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v4 = objc_loadWeakRetained(v2);
    [v4 _startStream:*(void *)(a1 + 32) option:*(void *)(a1 + 56) completion:*(void *)(a1 + 40)];

    id WeakRetained = v5;
  }
}

- (void)_startStream:(id)a3 option:(unint64_t)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v10 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v25 = self;
    __int16 v26 = 2114;
    id v27 = v8;
    __int16 v28 = 1024;
    int v29 = a4;
    _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ StartStream for configuration %{public}@ option %d", buf, 0x1Cu);
  }

  id v20 = 0;
  id v11 = [MEMORY[0x263F08910] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v20];
  id v12 = v20;
  if (v11)
  {
    v23[0] = &unk_26E96A5E8;
    v22[0] = @"ContinuityCaptureSelector";
    v22[1] = @"ContinuityCaptureArgs";
    v21[0] = v11;
    id v13 = [NSNumber numberWithUnsignedInteger:a4];
    v21[1] = v13;
    void v21[2] = &unk_26E96A6C0;
    id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
    v23[1] = v14;
    id v15 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];

    id v16 = [(CMContinuityCaptureTransportRapportDevice *)self activeStreamForIdentifier:@"ContinuityCaptureCommand"];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __76__CMContinuityCaptureTransportRapportDevice__startStream_option_completion___block_invoke;
    id v18[3] = &unk_264C9A228;
    id v19 = v9;
    [v16 sendMessage:@"ContinuityCaptureCommand" message:v15 completion:v18];
  }
  else
  {
    __int16 v17 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureTransportSidecarDevice _startStream:option:completion:]();
    }

    (*((void (**)(id, id))v9 + 2))(v9, v12);
  }
}

uint64_t __76__CMContinuityCaptureTransportRapportDevice__startStream_option_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopStream:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__CMContinuityCaptureTransportRapportDevice_stopStream_option_completion___block_invoke;
  block[3] = &unk_264C993F0;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a3;
  v13[2] = (id)a4;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __74__CMContinuityCaptureTransportRapportDevice_stopStream_option_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _stopStream:*(void *)(a1 + 48) option:*(void *)(a1 + 56) completion:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)_stopStream:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = CMContinuityCaptureMediaIdentifierFromEntityType(a3);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v9)
  {
    id v10 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      int v22 = self;
      __int16 v23 = 1024;
      int v24 = a3;
      __int16 v25 = 1024;
      int v26 = a4;
      _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ stopStream for entity %u option %d", buf, 0x18u);
    }

    v19[0] = @"ContinuityCaptureSelector";
    v19[1] = @"ContinuityCaptureArgs";
    v20[0] = &unk_26E96A6A8;
    id v11 = [NSNumber numberWithInteger:a3];
    v18[0] = v11;
    id v12 = [NSNumber numberWithUnsignedInteger:a4];
    v18[1] = v12;
    v18[2] = &unk_26E96A6C0;
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
    v20[1] = v13;
    id v14 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];

    id v15 = [(CMContinuityCaptureTransportRapportDevice *)self activeStreamForIdentifier:@"ContinuityCaptureCommand"];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    id v16[2] = __75__CMContinuityCaptureTransportRapportDevice__stopStream_option_completion___block_invoke;
    v16[3] = &unk_264C9A228;
    id v17 = v8;
    [v15 sendMessage:@"ContinuityCaptureCommand" message:v14 completion:v16];
  }
  else
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

uint64_t __75__CMContinuityCaptureTransportRapportDevice__stopStream_option_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)postEvent:(id)a3 entity:(int64_t)a4 data:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__CMContinuityCaptureTransportRapportDevice_postEvent_entity_data___block_invoke;
  block[3] = &unk_264C9A078;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __67__CMContinuityCaptureTransportRapportDevice_postEvent_entity_data___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _postEvent:*(void *)(a1 + 32) entity:*(void *)(a1 + 56) data:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)_postEvent:(id)a3 entity:(int64_t)a4 data:(id)a5
{
  void v15[2] = *MEMORY[0x263EF8340];
  queue = self->_queue;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  v15[0] = &unk_26E96A648;
  v14[0] = @"ContinuityCaptureSelector";
  v14[1] = @"ContinuityCaptureArgs";
  v13[0] = v8;
  id v9 = [NSNumber numberWithInteger:a4];
  v13[1] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  v15[1] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

  id v12 = [(CMContinuityCaptureTransportRapportDevice *)self activeStreamForIdentifier:@"ContinuityCaptureCommand"];
  [v12 sendMessage:@"ContinuityCaptureCommand" message:v11 completion:&__block_literal_global_199];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rpCompanionSidebandSessions, 0);
  objc_storeStrong((id *)&self->_deviceUUID, 0);
  objc_storeStrong((id *)&self->_sidebandQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_magicStateMonitor, 0);
  objc_storeStrong((id *)&self->_activeStreams, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

void __62__CMContinuityCaptureTransportRapportDevice_updateSystemState__block_invoke_cold_1(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_1(&dword_235FC2000, v2, v3, "%@ %s No valid transport to query state", v4, v5, v6, v7, v8);
}

void __72__CMContinuityCaptureTransportRapportDevice__handleAVCNegotiation_data___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  OUTLINED_FUNCTION_1_0();
  __int16 v8 = 2112;
  uint64_t v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_debug_impl(&dword_235FC2000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ handleAVCNegotiation SendMessage %@ Error %@", v7, 0x20u);
}

@end