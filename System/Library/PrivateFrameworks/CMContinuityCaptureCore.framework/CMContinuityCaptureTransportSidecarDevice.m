@interface CMContinuityCaptureTransportSidecarDevice
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
- (CMContinuityCaptureTransportSidecarDevice)initWithSidecarDevice:(id)a3 capabilities:(id)a4 remote:(BOOL)a5;
- (NSArray)activeStreams;
- (NSString)description;
- (NSString)deviceModel;
- (NSString)deviceName;
- (NSUUID)deviceIdentifier;
- (OS_dispatch_queue)queue;
- (SidecarDevice)device;
- (id)streamForIdentifier:(id)a3;
- (int64_t)deviceModelType;
- (unint64_t)deviceMajorVersion;
- (unint64_t)deviceMinorVersion;
- (unint64_t)deviceStatus;
- (void)_didCaptureStillImage:(id)a3 entity:(int64_t)a4;
- (void)_handleAVCNegotiation:(int64_t)a3 data:(id)a4;
- (void)_postEvent:(id)a3 entity:(int64_t)a4 data:(id)a5;
- (void)_setValueForControl:(id)a3 completion:(id)a4;
- (void)_startStream:(id)a3 option:(unint64_t)a4 completion:(id)a5;
- (void)_stopStream:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5;
- (void)_synchronizeAudioClockWithSampleTime:(unint64_t)a3 networkTime:(unint64_t)a4 clockGrandMasterIdentifier:(unint64_t)a5;
- (void)activateStream:(id)a3;
- (void)captureStillImage:(id)a3 entity:(int64_t)a4 completion:(id)a5;
- (void)didCaptureStillImage:(id)a3 entity:(int64_t)a4;
- (void)enqueueReactionEffect:(id)a3 entity:(int64_t)a4;
- (void)handleAVCNegotiation:(int64_t)a3 data:(id)a4;
- (void)handleSynchronizeAudioClockCompletion;
- (void)notifyDeviceStateChange;
- (void)postEvent:(id)a3 entity:(int64_t)a4 data:(id)a5;
- (void)resetDevice:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setDeviceMajorVersion:(unint64_t)a3;
- (void)setDeviceMinorVersion:(unint64_t)a3;
- (void)setLegacyReconnectRecovery:(BOOL)a3;
- (void)setNearby:(BOOL)a3;
- (void)setStreamIntent:(BOOL)a3;
- (void)setTerminationDeferred:(BOOL)a3;
- (void)setUserDisconnected:(BOOL)a3;
- (void)setValueForControl:(id)a3 completion:(id)a4;
- (void)startStream:(id)a3 option:(unint64_t)a4 completion:(id)a5;
- (void)stopStream:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5;
- (void)synchronizeAudioClockWithSampleTime:(unint64_t)a3 networkTime:(unint64_t)a4 clockGrandMasterIdentifier:(unint64_t)a5;
- (void)teardownStreams;
@end

@implementation CMContinuityCaptureTransportSidecarDevice

- (CMContinuityCaptureTransportSidecarDevice)initWithSidecarDevice:(id)a3 capabilities:(id)a4 remote:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CMContinuityCaptureTransportSidecarDevice;
  v11 = [(CMContinuityCaptureTransportSidecarDevice *)&v23 init];
  if (!v11) {
    goto LABEL_5;
  }
  v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v13 = dispatch_queue_create("com.apple.continuitycapture.sidecardevice", v12);
  queue = v11->_queue;
  v11->_queue = (OS_dispatch_queue *)v13;

  v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  activeStreams = v11->_activeStreams;
  v11->_activeStreams = v15;

  objc_storeStrong((id *)&v11->_device, a3);
  v11->_remote = a5;
  objc_storeStrong((id *)&v11->_capabilities, a4);
  v17 = [(CMContinuityCaptureTransportSidecarDevice *)v11 capabilities];
  v18 = [v17 devicesCapabilities];
  v11->_allFeaturesSupported = CMContinuityCaptureDeviceSupportsAllFeatures(v18);

  v19 = [[CMContinuityCaptureMagicStateMonitor alloc] initWithDevice:v11];
  magicStateMonitor = v11->_magicStateMonitor;
  v11->_magicStateMonitor = v19;

  if (v11->_magicStateMonitor) {
    v21 = v11;
  }
  else {
LABEL_5:
  }
    v21 = 0;

  return v21;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)resetDevice:(id)a3
{
  v4 = (SidecarDevice *)a3;
  obj = self;
  objc_sync_enter(obj);
  device = obj->_device;
  obj->_device = v4;

  objc_sync_exit(obj);
}

- (void)teardownStreams
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412546;
    v6 = self;
    __int16 v7 = 2080;
    v8 = "-[CMContinuityCaptureTransportSidecarDevice teardownStreams]";
    _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%@ %s", (uint8_t *)&v5, 0x16u);
  }

  v4 = self;
  objc_sync_enter(v4);
  [(CMContinuityCaptureTransportSidecarDevice *)v4 willChangeValueForKey:@"activeStreams"];
  [(NSMutableDictionary *)v4->_activeStreams removeAllObjects];
  [(CMContinuityCaptureTransportSidecarDevice *)v4 didChangeValueForKey:@"activeStreams"];
  [(CMContinuityCaptureTransportSidecarDevice *)v4 willChangeValueForKey:@"active"];
  v4->_active = 0;
  [(CMContinuityCaptureTransportSidecarDevice *)v4 didChangeValueForKey:@"active"];
  objc_sync_exit(v4);
}

- (BOOL)active
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL active = v2->_active;
  objc_sync_exit(v2);

  return active;
}

- (BOOL)remote
{
  return self->_remote;
}

- (id)streamForIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = self;
  objc_sync_enter(v5);
  v6 = [(NSMutableDictionary *)v5->_activeStreams objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)activateStream:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__CMContinuityCaptureTransportSidecarDevice_activateStream___block_invoke;
  v6[3] = &unk_264C996D8;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [v5 activate:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __60__CMContinuityCaptureTransportSidecarDevice_activateStream___block_invoke(uint64_t a1, void *a2)
{
  if (!a2 || ![a2 code])
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v4 = WeakRetained;
    if (WeakRetained)
    {
      id v5 = WeakRetained[8];
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __60__CMContinuityCaptureTransportSidecarDevice_activateStream___block_invoke_2;
      v6[3] = &unk_264C99080;
      id v7 = WeakRetained;
      id v8 = *(id *)(a1 + 32);
      dispatch_async(v5, v6);
    }
  }
}

void __60__CMContinuityCaptureTransportSidecarDevice_activateStream___block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  [*(id *)(a1 + 32) willChangeValueForKey:@"activeStreams"];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 48) count];
  id v4 = *(void **)(a1 + 40);
  id v5 = *(void **)(*(void *)(a1 + 32) + 48);
  v6 = [v4 streamIdentifier];
  [v5 setObject:v4 forKeyedSubscript:v6];

  [*(id *)(a1 + 32) didChangeValueForKey:@"activeStreams"];
  objc_sync_exit(v2);

  if (!v3)
  {
    [*(id *)(a1 + 32) willChangeValueForKey:@"active"];
    id v7 = *(id *)(a1 + 32);
    objc_sync_enter(v7);
    *(unsigned char *)(*(void *)(a1 + 32) + 73) = 1;
    objc_sync_exit(v7);

    id v8 = *(void **)(a1 + 32);
    [v8 didChangeValueForKey:@"active"];
  }
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
  id v5 = (void *)[v3 initWithArray:v4];

  objc_sync_exit(v2);
  return (NSArray *)v5;
}

- (void)setUserDisconnected:(BOOL)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  v4->_userDisconnected = a3;
  objc_sync_exit(v4);

  if ([(CMContinuityCaptureTransportSidecarDevice *)v4 wired])
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

- (BOOL)wifiP2pActive
{
  id v2 = [(CMContinuityCaptureTransportSidecarDevice *)self device];
  unint64_t v3 = ((unint64_t)[v2 status] >> 9) & 1;

  return v3;
}

- (BOOL)allFeaturesSupported
{
  return self->_allFeaturesSupported;
}

- (SidecarDevice)device
{
  id v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = v2->_device;
  objc_sync_exit(v2);

  return v3;
}

- (NSUUID)deviceIdentifier
{
  id v2 = [(CMContinuityCaptureTransportSidecarDevice *)self device];
  unint64_t v3 = [v2 identifier];

  return (NSUUID *)v3;
}

- (NSString)deviceName
{
  id v2 = [(CMContinuityCaptureTransportSidecarDevice *)self device];
  unint64_t v3 = [v2 name];

  return (NSString *)v3;
}

- (NSString)deviceModel
{
  id v2 = [(CMContinuityCaptureTransportSidecarDevice *)self device];
  unint64_t v3 = [v2 model];

  return (NSString *)v3;
}

- (int64_t)deviceModelType
{
  id v2 = [(CMContinuityCaptureTransportSidecarDevice *)self device];
  unint64_t v3 = [v2 model];
  int64_t v4 = CMContinuityCaptureDeviceModelFromModelString();

  return v4;
}

- (unint64_t)deviceStatus
{
  id v2 = [(CMContinuityCaptureTransportSidecarDevice *)self device];
  unint64_t v3 = [v2 status];

  return v3;
}

- (BOOL)wired
{
  id v2 = [(CMContinuityCaptureTransportSidecarDevice *)self device];
  unint64_t v3 = ((unint64_t)[v2 status] >> 24) & 1;

  return v3;
}

- (BOOL)usable
{
  id v2 = [(CMContinuityCaptureTransportSidecarDevice *)self device];
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

- (BOOL)guest
{
  return 0;
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
  if ([(CMContinuityCaptureTransportSidecarDevice *)self hasStreamIntent]
    && ![(CMContinuityCaptureTransportSidecarDevice *)self userDisconnected])
  {
    int64_t v4 = [(CMContinuityCaptureTransportSidecarDevice *)self capabilities];
    if (v4)
    {
      id v5 = [(CMContinuityCaptureTransportSidecarDevice *)self capabilities];
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
  return 1;
}

- (BOOL)disconnectedWhileWired
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL disconnectedWhileWired = v2->_disconnectedWhileWired;
  objc_sync_exit(v2);

  return disconnectedWhileWired;
}

- (BOOL)legacyReconnectRecovery
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL legacyRecovery = v2->_legacyRecovery;
  objc_sync_exit(v2);

  return legacyRecovery;
}

- (void)setLegacyReconnectRecovery:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL legacyRecovery = a3;
  objc_sync_exit(obj);
}

- (void)notifyDeviceStateChange
{
  if (![(CMContinuityCaptureTransportSidecarDevice *)self wired]
    && [(CMContinuityCaptureTransportSidecarDevice *)self userDisconnected])
  {
    int v3 = self;
    objc_sync_enter(v3);
    v3->_BOOL disconnectedWhileWired = 0;
    objc_sync_exit(v3);
  }
  [(CMContinuityCaptureTransportSidecarDevice *)self willChangeValueForKey:@"deviceStatus"];
  [(CMContinuityCaptureTransportSidecarDevice *)self didChangeValueForKey:@"deviceStatus"];
  [(CMContinuityCaptureTransportSidecarDevice *)self willChangeValueForKey:@"usable"];
  [(CMContinuityCaptureTransportSidecarDevice *)self didChangeValueForKey:@"usable"];
  [(CMContinuityCaptureTransportSidecarDevice *)self willChangeValueForKey:@"wired"];
  [(CMContinuityCaptureTransportSidecarDevice *)self didChangeValueForKey:@"wired"];
  [(CMContinuityCaptureTransportSidecarDevice *)self willChangeValueForKey:@"nearby"];
  [(CMContinuityCaptureTransportSidecarDevice *)self didChangeValueForKey:@"nearby"];
}

- (CMContinuityCaptureCapabilities)capabilities
{
  id v2 = self;
  objc_sync_enter(v2);
  int v3 = v2->_capabilities;
  objc_sync_exit(v2);

  return v3;
}

- (void)setCapabilities:(id)a3
{
  int64_t v4 = (CMContinuityCaptureCapabilities *)a3;
  obj = self;
  objc_sync_enter(obj);
  capabilities = obj->_capabilities;
  obj->_capabilities = v4;

  objc_sync_exit(obj);
}

- (BOOL)nearby
{
  id v2 = self;
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
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL streamIntent = a3;
  objc_sync_exit(obj);
}

- (BOOL)canReconnect
{
  return [(CMContinuityCaptureTransportSidecarDevice *)self userDisconnected]
      && [(CMContinuityCaptureTransportSidecarDevice *)self wired]
      && ![(CMContinuityCaptureTransportSidecarDevice *)self disconnectedWhileWired];
}

- (NSString)description
{
  int v3 = NSString;
  int64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(CMContinuityCaptureTransportSidecarDevice *)self device];
  id v7 = [v6 identifier];
  id v8 = [v7 UUIDString];
  uint64_t v9 = [v3 stringWithFormat:@"%@: %@ [%p]", v5, v8, self];

  return (NSString *)v9;
}

- (void)synchronizeAudioClockWithSampleTime:(unint64_t)a3 networkTime:(unint64_t)a4 clockGrandMasterIdentifier:(unint64_t)a5
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __120__CMContinuityCaptureTransportSidecarDevice_synchronizeAudioClockWithSampleTime_networkTime_clockGrandMasterIdentifier___block_invoke;
  block[3] = &unk_264C9A200;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  v11[2] = (id)a4;
  v11[3] = (id)a5;
  dispatch_async(queue, block);
  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __120__CMContinuityCaptureTransportSidecarDevice_synchronizeAudioClockWithSampleTime_networkTime_clockGrandMasterIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _synchronizeAudioClockWithSampleTime:*(void *)(a1 + 40) networkTime:*(void *)(a1 + 48) clockGrandMasterIdentifier:*(void *)(a1 + 56)];
    id WeakRetained = v3;
  }
}

- (void)_synchronizeAudioClockWithSampleTime:(unint64_t)a3 networkTime:(unint64_t)a4 clockGrandMasterIdentifier:(unint64_t)a5
{
  v22[2] = *MEMORY[0x263EF8340];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v22[0] = &unk_26E96A3C0;
  v21[0] = @"ContinuityCaptureSelector";
  v21[1] = @"ContinuityCaptureArgs";
  uint64_t v9 = [NSNumber numberWithUnsignedLongLong:a3];
  v20[0] = v9;
  id v10 = [NSNumber numberWithUnsignedLongLong:a4];
  v20[1] = v10;
  v11 = [NSNumber numberWithUnsignedLongLong:a5];
  v20[2] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:3];
  v22[1] = v12;
  dispatch_queue_t v13 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];

  v14 = [(NSMutableDictionary *)self->_activeStreams objectForKeyedSubscript:@"ContinuityCaptureCommand"];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __121__CMContinuityCaptureTransportSidecarDevice__synchronizeAudioClockWithSampleTime_networkTime_clockGrandMasterIdentifier___block_invoke;
  v16[3] = &unk_264C996D8;
  objc_copyWeak(&v18, &location);
  id v15 = v13;
  id v17 = v15;
  [v14 sendMessage:@"ContinuityCaptureCommand" message:v15 completion:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __121__CMContinuityCaptureTransportSidecarDevice__synchronizeAudioClockWithSampleTime_networkTime_clockGrandMasterIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int64_t v4 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    id v8 = WeakRetained;
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = a2;
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%@ SendMessage %{public}@ Error %@", (uint8_t *)&v7, 0x20u);
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
  v9[2] = __73__CMContinuityCaptureTransportSidecarDevice_didCaptureStillImage_entity___block_invoke;
  v9[3] = &unk_264C997E8;
  objc_copyWeak(v11, &location);
  id v10 = v6;
  v11[1] = (id)a4;
  id v8 = v6;
  dispatch_async(queue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __73__CMContinuityCaptureTransportSidecarDevice_didCaptureStillImage_entity___block_invoke(uint64_t a1)
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
    v21[0] = &unk_26E96A3D8;
    v20[0] = @"ContinuityCaptureSelector";
    v20[1] = @"ContinuityCaptureArgs";
    v19[0] = v7;
    __int16 v9 = [NSNumber numberWithInteger:a4];
    v19[1] = v9;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
    v21[1] = v10;
    __int16 v11 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];

    uint64_t v12 = [(NSMutableDictionary *)self->_activeStreams objectForKeyedSubscript:@"ContinuityCaptureData"];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __74__CMContinuityCaptureTransportSidecarDevice__didCaptureStillImage_entity___block_invoke;
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
      objc_super v23 = self;
      __int16 v24 = 2112;
      id v25 = v6;
      __int16 v26 = 2112;
      id v27 = v8;
      _os_log_error_impl(&dword_235FC2000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Failed to archive request %@ error %@", buf, 0x20u);
    }
  }

  objc_destroyWeak(&location);
}

void __74__CMContinuityCaptureTransportSidecarDevice__didCaptureStillImage_entity___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int64_t v4 = CMContinuityCaptureLog(2);
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
  v4[2] = __82__CMContinuityCaptureTransportSidecarDevice_handleSynchronizeAudioClockCompletion__block_invoke;
  v4[3] = &unk_264C990F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __82__CMContinuityCaptureTransportSidecarDevice_handleSynchronizeAudioClockCompletion__block_invoke(uint64_t a1)
{
  v5[2] = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4[0] = @"ContinuityCaptureSelector";
    v4[1] = @"ContinuityCaptureArgs";
    v5[0] = &unk_26E96A3F0;
    v5[1] = &unk_26E96A890;
    id v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
    id v3 = [WeakRetained[6] objectForKeyedSubscript:@"ContinuityCaptureCommand"];
    [v3 sendMessage:@"ContinuityCaptureCommand" message:v2 completion:&__block_literal_global_10];
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
  block[2] = __81__CMContinuityCaptureTransportSidecarDevice_captureStillImage_entity_completion___block_invoke;
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

void __81__CMContinuityCaptureTransportSidecarDevice_captureStillImage_entity_completion___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v14 = 0;
    int64_t v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v14];
    id v5 = v14;
    if (v4)
    {
      v17[0] = &unk_26E96A420;
      v16[0] = @"ContinuityCaptureSelector";
      v16[1] = @"ContinuityCaptureArgs";
      v15[0] = v4;
      uint64_t v6 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
      v15[1] = v6;
      int v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
      v17[1] = v7;
      id v8 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

      id v9 = [WeakRetained[6] objectForKeyedSubscript:@"ContinuityCaptureCommand"];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __81__CMContinuityCaptureTransportSidecarDevice_captureStillImage_entity_completion___block_invoke_117;
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
        v19 = WeakRetained;
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

uint64_t __81__CMContinuityCaptureTransportSidecarDevice_captureStillImage_entity_completion___block_invoke_117(uint64_t a1)
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
  v9[2] = __74__CMContinuityCaptureTransportSidecarDevice_enqueueReactionEffect_entity___block_invoke;
  v9[3] = &unk_264C997E8;
  objc_copyWeak(v11, &location);
  id v10 = v6;
  v11[1] = (id)a4;
  id v8 = v6;
  dispatch_async(queue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __74__CMContinuityCaptureTransportSidecarDevice_enqueueReactionEffect_entity___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      id v13 = WeakRetained;
      __int16 v14 = 2114;
      uint64_t v15 = v4;
      _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ enqueueReactionEffect %{public}@", buf, 0x16u);
    }

    v11[0] = &unk_26E96A438;
    v10[0] = @"ContinuityCaptureSelector";
    v10[1] = @"ContinuityCaptureArgs";
    id v5 = objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(a1 + 48), *(void *)(a1 + 32));
    v9[1] = v5;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
    v11[1] = v6;
    int v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

    id v8 = [WeakRetained[6] objectForKeyedSubscript:@"ContinuityCaptureCommand"];
    [v8 sendMessage:@"ContinuityCaptureCommand" message:v7 completion:&__block_literal_global_122_0];
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
  void v11[2] = __75__CMContinuityCaptureTransportSidecarDevice_setValueForControl_completion___block_invoke;
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

void __75__CMContinuityCaptureTransportSidecarDevice_setValueForControl_completion___block_invoke(uint64_t a1)
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
  void v17[2] = __76__CMContinuityCaptureTransportSidecarDevice__setValueForControl_completion___block_invoke;
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
    v23[0] = &unk_26E96A450;
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

    uint64_t v15 = [(NSMutableDictionary *)self->_activeStreams objectForKeyedSubscript:@"ContinuityCaptureControl"];
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

uint64_t __76__CMContinuityCaptureTransportSidecarDevice__setValueForControl_completion___block_invoke(uint64_t a1, uint64_t a2)
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
  void v9[2] = __71__CMContinuityCaptureTransportSidecarDevice_handleAVCNegotiation_data___block_invoke;
  v9[3] = &unk_264C997E8;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __71__CMContinuityCaptureTransportSidecarDevice_handleAVCNegotiation_data___block_invoke(uint64_t a1)
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
  void v23[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v22[0] = @"ContinuityCaptureSelector";
  v22[1] = @"ContinuityCaptureArgs";
  v23[0] = &unk_26E96A468;
  id v7 = [NSNumber numberWithInteger:a3];
  v21[0] = v7;
  v21[1] = v6;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  v23[1] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];

  id v10 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = self;
    __int16 v19 = 1024;
    int v20 = a3;
    _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ sendAVCNegotiation for entity %d", buf, 0x12u);
  }

  id v11 = [(NSMutableDictionary *)self->_activeStreams objectForKeyedSubscript:@"ContinuityCaptureControl"];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __72__CMContinuityCaptureTransportSidecarDevice__handleAVCNegotiation_data___block_invoke;
  v13[3] = &unk_264C996D8;
  objc_copyWeak(&v15, &location);
  id v12 = v9;
  id v14 = v12;
  [v11 sendMessage:@"ContinuityCaptureControl" message:v12 completion:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __72__CMContinuityCaptureTransportSidecarDevice__handleAVCNegotiation_data___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (CMContinityCaptureDebugLogEnabled())
  {
    uint64_t v4 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __72__CMContinuityCaptureTransportSidecarDevice__handleAVCNegotiation_data___block_invoke_cold_1(a1, (uint64_t)v3, v4);
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
  block[2] = __75__CMContinuityCaptureTransportSidecarDevice_startStream_option_completion___block_invoke;
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

void __75__CMContinuityCaptureTransportSidecarDevice_startStream_option_completion___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 48);
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
    v23[0] = &unk_26E96A450;
    v22[0] = @"ContinuityCaptureSelector";
    v22[1] = @"ContinuityCaptureArgs";
    v21[0] = v11;
    id v13 = [NSNumber numberWithUnsignedInteger:a4];
    v21[1] = v13;
    void v21[2] = &unk_26E96A480;
    id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
    v23[1] = v14;
    id v15 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];

    id v16 = [(NSMutableDictionary *)self->_activeStreams objectForKeyedSubscript:@"ContinuityCaptureCommand"];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __76__CMContinuityCaptureTransportSidecarDevice__startStream_option_completion___block_invoke;
    v18[3] = &unk_264C9A228;
    id v19 = v9;
    [v16 sendMessage:@"ContinuityCaptureCommand" message:v15 completion:v18];
  }
  else
  {
    id v17 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureTransportSidecarDevice _startStream:option:completion:]();
    }

    (*((void (**)(id, id))v9 + 2))(v9, v12);
  }
}

uint64_t __76__CMContinuityCaptureTransportSidecarDevice__startStream_option_completion___block_invoke(uint64_t a1)
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
  block[2] = __74__CMContinuityCaptureTransportSidecarDevice_stopStream_option_completion___block_invoke;
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

void __74__CMContinuityCaptureTransportSidecarDevice_stopStream_option_completion___block_invoke(uint64_t a1)
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
      __int16 v22 = self;
      __int16 v23 = 1024;
      int v24 = a3;
      __int16 v25 = 1024;
      int v26 = a4;
      _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ stopStream for entity %u option %d", buf, 0x18u);
    }

    v19[0] = @"ContinuityCaptureSelector";
    v19[1] = @"ContinuityCaptureArgs";
    v20[0] = &unk_26E96A468;
    id v11 = [NSNumber numberWithInteger:a3];
    v18[0] = v11;
    id v12 = [NSNumber numberWithUnsignedInteger:a4];
    v18[1] = v12;
    v18[2] = &unk_26E96A480;
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
    v20[1] = v13;
    id v14 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];

    id v15 = [(NSMutableDictionary *)self->_activeStreams objectForKeyedSubscript:@"ContinuityCaptureCommand"];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    id v16[2] = __75__CMContinuityCaptureTransportSidecarDevice__stopStream_option_completion___block_invoke;
    v16[3] = &unk_264C9A228;
    id v17 = v8;
    [v15 sendMessage:@"ContinuityCaptureCommand" message:v14 completion:v16];
  }
  else
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

uint64_t __75__CMContinuityCaptureTransportSidecarDevice__stopStream_option_completion___block_invoke(uint64_t a1)
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
  block[2] = __67__CMContinuityCaptureTransportSidecarDevice_postEvent_entity_data___block_invoke;
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

void __67__CMContinuityCaptureTransportSidecarDevice_postEvent_entity_data___block_invoke(uint64_t a1)
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
  v15[0] = &unk_26E96A408;
  v14[0] = @"ContinuityCaptureSelector";
  v14[1] = @"ContinuityCaptureArgs";
  v13[0] = v8;
  id v9 = [NSNumber numberWithInteger:a4];
  v13[1] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  v15[1] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

  id v12 = [(NSMutableDictionary *)self->_activeStreams objectForKeyedSubscript:@"ContinuityCaptureCommand"];

  [v12 sendMessage:@"ContinuityCaptureCommand" message:v11 completion:&__block_literal_global_131];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_magicStateMonitor, 0);
  objc_storeStrong((id *)&self->_activeStreams, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

void __76__CMContinuityCaptureTransportSidecarDevice__setValueForControl_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v6 = 138543618;
  id v7 = WeakRetained;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_235FC2000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ setValueForControl completion error %@", (uint8_t *)&v6, 0x16u);
}

void __72__CMContinuityCaptureTransportSidecarDevice__handleAVCNegotiation_data___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = *(void *)(a1 + 32);
  int v8 = 138543874;
  id v9 = WeakRetained;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_debug_impl(&dword_235FC2000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ handleAVCNegotiation SendMessage %@ Error %@", (uint8_t *)&v8, 0x20u);
}

- (void)_startStream:option:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_235FC2000, v0, v1, "%{public}@ archivedDataWithRootObject Error %@");
}

@end