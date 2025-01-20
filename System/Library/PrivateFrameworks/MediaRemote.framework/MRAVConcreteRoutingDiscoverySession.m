@interface MRAVConcreteRoutingDiscoverySession
- (BOOL)devicePresenceDetected;
- (BOOL)onlyDiscoversBluetoothDevices;
- (MRAVConcreteRoutingDiscoverySession)initWithConfiguration:(id)a3;
- (NSArray)availableEndpoints;
- (NSArray)availableOutputDevices;
- (NSArray)virtualOutputDevices;
- (NSSet)lastReportedClientIdentifiers;
- (id)_onQueue_reloadAvailableOutputDevices;
- (id)debugDescription;
- (id)description;
- (id)routingContextUID;
- (unsigned)discoveryMode;
- (unsigned)endpointFeatures;
- (unsigned)targetAudioSessionID;
- (void)_availableOutputDevicesDidChangeNotification:(id)a3;
- (void)_onQueue_reload;
- (void)_onQueue_reloadAvailableOutputDevices;
- (void)_onQueue_setTargetAudioSessionID:(unsigned int)a3;
- (void)_scheduleAvailableOutputDevicesReload;
- (void)setAvailableOutputDevices:(id)a3;
- (void)setDiscoveryMode:(unsigned int)a3;
- (void)setDiscoveryMode:(unsigned int)a3 forClientIdentifiers:(id)a4;
- (void)setLastReportedClientIdentifiers:(id)a3;
- (void)setOnlyDiscoversBluetoothDevices:(BOOL)a3;
- (void)setRoutingContextUID:(id)a3;
- (void)setTargetAudioSessionID:(unsigned int)a3;
@end

@implementation MRAVConcreteRoutingDiscoverySession

uint64_t __52__MRAVConcreteRoutingDiscoverySession_discoveryMode__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 164);
  return result;
}

MRAVConcreteOutputDevice *__76__MRAVConcreteRoutingDiscoverySession__onQueue_reloadAvailableOutputDevices__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[MRAVConcreteOutputDevice alloc] initWithAVOutputDevice:v3 sourceInfo:*(void *)(a1 + 32)];
  BOOL IsAVOutputDeviceLocal = MROutputDeviceIsAVOutputDeviceLocal(v3);

  if (IsAVOutputDeviceLocal) {
    [(MRAVConcreteOutputDevice *)v4 setAirPlayGroupID:*(void *)(a1 + 40)];
  }

  return v4;
}

void __65__MRAVConcreteRoutingDiscoverySession_setAvailableOutputDevices___block_invoke(uint64_t a1)
{
}

void __76__MRAVConcreteRoutingDiscoverySession__onQueue_reloadAvailableOutputDevices__block_invoke(uint64_t a1)
{
}

uint64_t __61__MRAVConcreteRoutingDiscoverySession_availableOutputDevices__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_reload");
}

uint64_t __61__MRAVConcreteRoutingDiscoverySession_availableOutputDevices__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 184) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)_onQueue_reload
{
  id v4 = [(MRAVConcreteRoutingDiscoverySession *)self _onQueue_reloadAvailableOutputDevices];
  [(MRAVConcreteRoutingDiscoverySession *)self setAvailableOutputDevices:v4];
  id v3 = [(MRAVConcreteRoutingDiscoverySession *)self availableOutputDevices];
  [(MRAVRoutingDiscoverySession *)self notifyOutputDevicesChanged:v3];
}

- (NSArray)availableOutputDevices
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__52;
  v16 = __Block_byref_object_dispose__52;
  id v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__MRAVConcreteRoutingDiscoverySession_availableOutputDevices__block_invoke;
  block[3] = &unk_1E57D0590;
  block[4] = self;
  block[5] = &v12;
  dispatch_sync(serialQueue, block);
  id v4 = (void *)v13[5];
  if (!v4)
  {
    reloadQueue = self->_reloadQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__MRAVConcreteRoutingDiscoverySession_availableOutputDevices__block_invoke_2;
    v10[3] = &unk_1E57D0518;
    v10[4] = self;
    dispatch_sync(reloadQueue, v10);
    v6 = self->_serialQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__MRAVConcreteRoutingDiscoverySession_availableOutputDevices__block_invoke_3;
    v9[3] = &unk_1E57D0590;
    v9[4] = self;
    v9[5] = &v12;
    dispatch_sync(v6, v9);
    id v4 = (void *)v13[5];
  }
  id v7 = v4;
  _Block_object_dispose(&v12, 8);

  return (NSArray *)v7;
}

- (unsigned)discoveryMode
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__MRAVConcreteRoutingDiscoverySession_discoveryMode__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setAvailableOutputDevices:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__MRAVConcreteRoutingDiscoverySession_setAvailableOutputDevices___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

- (id)_onQueue_reloadAvailableOutputDevices
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_reloadQueue);
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__52;
  v31 = __Block_byref_object_dispose__52;
  id v32 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__MRAVConcreteRoutingDiscoverySession__onQueue_reloadAvailableOutputDevices__block_invoke;
  block[3] = &unk_1E57D0590;
  block[4] = self;
  block[5] = &v27;
  dispatch_sync(serialQueue, block);
  id v4 = [MEMORY[0x1E4F1C9C8] now];
  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v6 = [(id)v28[5] availableOutputDevices];
  id v7 = (void *)[v5 initWithArray:v6];

  id v8 = [(Class)getAVOutputDeviceClass_1[0]() sharedLocalDevice];
  [v7 removeObject:v8];

  [v4 timeIntervalSinceNow];
  if (v9 < -0.1)
  {
    v10 = _MRLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      [v4 timeIntervalSinceNow];
      [(MRAVConcreteRoutingDiscoverySession *)buf _onQueue_reloadAvailableOutputDevices];
    }
  }
  uint64_t v12 = self->_routingContextUID;
  if (!v12)
  {
    v13 = [(id)v28[5] targetAudioSession];
    uint64_t v12 = [v13 routingContextUID];
  }
  uint64_t v14 = [v7 indexesOfObjectsPassingTest:&__block_literal_global_112];
  v15 = -[MRAVOutputDeviceSourceInfo initWithRoutingContextUID:multipleBuiltInDevices:]([MRAVOutputDeviceSourceInfo alloc], "initWithRoutingContextUID:multipleBuiltInDevices:", v12, (unint64_t)[v14 count] > 1);
  v16 = +[MROrigin localOrigin];
  id v17 = +[MRDeviceInfoRequest cachedDeviceInfoForOrigin:v16];
  v18 = [v17 airPlayGroupUID];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __76__MRAVConcreteRoutingDiscoverySession__onQueue_reloadAvailableOutputDevices__block_invoke_2;
  v23[3] = &unk_1E57DA458;
  v19 = v15;
  v24 = v19;
  id v20 = v18;
  id v25 = v20;
  v21 = objc_msgSend(v7, "msv_compactMap:", v23);

  _Block_object_dispose(&v27, 8);

  return v21;
}

- (NSArray)availableEndpoints
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (void)_availableOutputDevicesDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = _MRLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[MRAVConcreteRoutingDiscoverySession _availableOutputDevicesDidChangeNotification:]((uint64_t)v4, v5);
  }

  [(MRAVConcreteRoutingDiscoverySession *)self _scheduleAvailableOutputDevicesReload];
}

- (void)_scheduleAvailableOutputDevicesReload
{
  unsigned int v3 = [MEMORY[0x1E4F1C9C8] now];
  qos_class_t v4 = qos_class_self();
  reloadQueue = self->_reloadQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__MRAVConcreteRoutingDiscoverySession__scheduleAvailableOutputDevicesReload__block_invoke;
  block[3] = &unk_1E57D1DC8;
  qos_class_t v10 = v4;
  id v8 = v3;
  double v9 = self;
  id v6 = v3;
  dispatch_async(reloadQueue, block);
}

- (BOOL)devicePresenceDetected
{
  v2 = [(MRAVConcreteRoutingDiscoverySession *)self availableOutputDevices];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

uint64_t __76__MRAVConcreteRoutingDiscoverySession__scheduleAvailableOutputDevicesReload__block_invoke(uint64_t a1)
{
  qos_class_t v2 = qos_class_self();
  if (*(_DWORD *)(a1 + 48) > v2)
  {
    int v3 = v2;
    qos_class_t v4 = _MRLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __76__MRAVConcreteRoutingDiscoverySession__scheduleAvailableOutputDevicesReload__block_invoke_cold_2((int *)(a1 + 48), v3, v4);
    }
  }
  [*(id *)(a1 + 32) timeIntervalSinceNow];
  if (v5 < -0.3)
  {
    id v6 = _MRLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __76__MRAVConcreteRoutingDiscoverySession__scheduleAvailableOutputDevicesReload__block_invoke_cold_1((id *)(a1 + 32), v6);
    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "_onQueue_reload");
}

uint64_t __61__MRAVConcreteRoutingDiscoverySession_availableOutputDevices__block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 184) copy];

  return MEMORY[0x1F41817F8]();
}

- (id)description
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__52;
  id v8 = __Block_byref_object_dispose__52;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (MRAVConcreteRoutingDiscoverySession)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MRAVConcreteRoutingDiscoverySession;
  double v5 = [(MRAVRoutingDiscoverySession *)&v29 initWithConfiguration:v4];
  if (v5)
  {
    v5->_endpointFeatures = [v4 features];
    uint64_t v6 = [v4 routingContextUID];
    routingContextUID = v5->_routingContextUID;
    v5->_routingContextUID = (NSString *)v6;

    v5->_discoveryMode = 0;
    v5->_targetAudioSessionID = 0;
    v5->_clientProvidedTargetAudioSessionID = [v4 targetAudioSessionID];
    id v8 = (objc_class *)objc_opt_class();
    Name = class_getName(v8);
    qos_class_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create(Name, v10);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v11;

    id v13 = [NSString alloc];
    uint64_t v14 = (objc_class *)objc_opt_class();
    id v15 = objc_msgSend(v13, "initWithFormat:", @"%s.reloadQueue", class_getName(v14));
    v16 = (const char *)[v15 UTF8String];
    id v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create(v16, v17);
    reloadQueue = v5->_reloadQueue;
    v5->_reloadQueue = (OS_dispatch_queue *)v18;

    uint64_t v20 = [objc_alloc((Class)getAVOutputDeviceDiscoverySessionClass_0[0]()) initWithDeviceFeatures:v5->_endpointFeatures & 0xF];
    avDiscoverySession = v5->_avDiscoverySession;
    v5->_avDiscoverySession = (AVOutputDeviceDiscoverySession *)v20;

    if (v5->_clientProvidedTargetAudioSessionID)
    {
      v22 = v5->_serialQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __61__MRAVConcreteRoutingDiscoverySession_initWithConfiguration___block_invoke;
      block[3] = &unk_1E57D0518;
      v28 = v5;
      dispatch_async(v22, block);
    }
    v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v24 = getAVOutputDeviceDiscoverySessionAvailableOutputDevicesDidChangeNotification_0[0]();
    [v23 addObserver:v5 selector:sel__availableOutputDevicesDidChangeNotification_ name:v24 object:v5->_avDiscoverySession];

    id v25 = getAVOutputContextOutputDeviceDidChangeNotification_0[0]();
    [v23 addObserver:v5 selector:sel__availableOutputDevicesDidChangeNotification_ name:v25 object:0];

    [v23 addObserver:v5 selector:sel__deviceInfoDidChange_ name:@"kMRDeviceInfoDidChangeNotification" object:0];
  }

  return v5;
}

- (void)setDiscoveryMode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [MEMORY[0x1E4F1CAD0] set];
  [(MRAVConcreteRoutingDiscoverySession *)self setDiscoveryMode:v3 forClientIdentifiers:v5];
}

void __77__MRAVConcreteRoutingDiscoverySession_setDiscoveryMode_forClientIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 164);
  int v4 = *(_DWORD *)(a1 + 48);
  char v5 = [*(id *)(a1 + 40) isEqualToSet:*(void *)(v2 + 200)];
  if (v3 != v4 || (v5 & 1) == 0)
  {
    if (v3 != v4)
    {
      uint64_t v6 = _MRLogForCategory(0);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        CFStringRef v8 = MRMediaRemoteCopyRouteDiscoveryModeDescription(*(_DWORD *)(a1 + 48));
        int v13 = 138412546;
        uint64_t v14 = v7;
        __int16 v15 = 2112;
        CFStringRef v16 = v8;
        _os_log_impl(&dword_194F3C000, v6, OS_LOG_TYPE_DEFAULT, "[AVDiscoverySession] %@ - Discovery mode changed to: %@", (uint8_t *)&v13, 0x16u);
      }
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 164) = *(_DWORD *)(a1 + 48);
    id v9 = *(void **)(*(void *)(a1 + 32) + 152);
    int v10 = *(_DWORD *)(a1 + 48) - 1;
    if (v10 > 2) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = qword_195224760[v10];
    }
    uint64_t v12 = [*(id *)(a1 + 40) allObjects];
    [v9 setDiscoveryMode:v11 forClientIdentifiers:v12];

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 200), *(id *)(a1 + 40));
  }
}

- (void)setDiscoveryMode:(unsigned int)a3 forClientIdentifiers:(id)a4
{
  id v6 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__MRAVConcreteRoutingDiscoverySession_setDiscoveryMode_forClientIdentifiers___block_invoke;
  block[3] = &unk_1E57D1DC8;
  unsigned int v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(serialQueue, block);
}

void __50__MRAVConcreteRoutingDiscoverySession_description__block_invoke(uint64_t a1)
{
  uint64_t v2 = NSString;
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = *(void *)(a1 + 32);
  MRMediaRemoteEndpointFeaturesDescription(*(_DWORD *)(v4 + 160));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  char v5 = (__CFString *)MRMediaRemoteCopyRouteDiscoveryModeDescription(*(_DWORD *)(*(void *)(a1 + 32) + 164));
  uint64_t v6 = [v2 stringWithFormat:@"<%@: %p> (%@ - %@)", v3, v4, v9, v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastReportedClientIdentifiers, 0);
  objc_storeStrong((id *)&self->_virtualOutputDevices, 0);
  objc_storeStrong((id *)&self->_availableOutputDevices, 0);
  objc_storeStrong((id *)&self->_routingContextUID, 0);
  objc_storeStrong((id *)&self->_avDiscoverySession, 0);
  objc_storeStrong((id *)&self->_reloadQueue, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

uint64_t __61__MRAVConcreteRoutingDiscoverySession_initWithConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_setTargetAudioSessionID:", *(unsigned int *)(*(void *)(a1 + 32) + 172));
}

- (unsigned)endpointFeatures
{
  return self->_endpointFeatures;
}

- (BOOL)onlyDiscoversBluetoothDevices
{
  return [(AVOutputDeviceDiscoverySession *)self->_avDiscoverySession onlyDiscoversBluetoothDevices];
}

- (void)setOnlyDiscoversBluetoothDevices:(BOOL)a3
{
}

- (NSSet)lastReportedClientIdentifiers
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__52;
  id v10 = __Block_byref_object_dispose__52;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__MRAVConcreteRoutingDiscoverySession_lastReportedClientIdentifiers__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

uint64_t __68__MRAVConcreteRoutingDiscoverySession_lastReportedClientIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 200) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (unsigned)targetAudioSessionID
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__MRAVConcreteRoutingDiscoverySession_targetAudioSessionID__block_invoke;
  v5[3] = &unk_1E57D07E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __59__MRAVConcreteRoutingDiscoverySession_targetAudioSessionID__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 168);
  if (!v3)
  {
    uint64_t v4 = [*(id *)(v2 + 152) targetAudioSession];
    *(_DWORD *)(*(void *)(a1 + 32) + 168) = [v4 opaqueSessionID];

    int v3 = *(_DWORD *)(*(void *)(a1 + 32) + 168);
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

- (void)setTargetAudioSessionID:(unsigned int)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__MRAVConcreteRoutingDiscoverySession_setTargetAudioSessionID___block_invoke;
  v4[3] = &unk_1E57D4308;
  v4[4] = self;
  unsigned int v5 = a3;
  dispatch_async(serialQueue, v4);
}

uint64_t __63__MRAVConcreteRoutingDiscoverySession_setTargetAudioSessionID___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(_DWORD *)(result + 40);
  if (*(_DWORD *)(v1 + 168) != v2)
  {
    *(_DWORD *)(v1 + 172) = v2;
    return objc_msgSend(*(id *)(result + 32), "_onQueue_setTargetAudioSessionID:", *(unsigned int *)(result + 40));
  }
  return result;
}

- (id)routingContextUID
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__52;
  id v10 = __Block_byref_object_dispose__52;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__MRAVConcreteRoutingDiscoverySession_routingContextUID__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __56__MRAVConcreteRoutingDiscoverySession_routingContextUID__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 176) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setRoutingContextUID:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__MRAVConcreteRoutingDiscoverySession_setRoutingContextUID___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

void *__60__MRAVConcreteRoutingDiscoverySession_setRoutingContextUID___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (*(void **)(v3 + 176) != result)
  {
    uint64_t v4 = [result copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 176);
    *(void *)(v5 + 176) = v4;

    uint64_t v7 = *(void **)(a1 + 32);
    return (void *)[v7 _scheduleReload];
  }
  return result;
}

BOOL __76__MRAVConcreteRoutingDiscoverySession__onQueue_reloadAvailableOutputDevices__block_invoke_10(uint64_t a1, void *a2)
{
  return [a2 deviceType] == 3;
}

- (id)debugDescription
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__52;
  id v8 = __Block_byref_object_dispose__52;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __55__MRAVConcreteRoutingDiscoverySession_debugDescription__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v3 = [*(id *)(a1 + 32) description];
  uint64_t v4 = [v2 stringWithFormat:@"%@\n", v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) appendFormat:@"%@\n", *(void *)(*(void *)(a1 + 32) + 184)];
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 152);
  if (v7)
  {
    id v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v9 = [v7 debugDescription];
    [v8 appendFormat:@"AVDiscoverySession=%@\n", v9];
  }
}

- (void)_onQueue_setTargetAudioSessionID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v5 = [(Class)getAVAudioSessionClass_3[0]() retrieveSessionWithID:v3];
  if (v5)
  {
    [(AVOutputDeviceDiscoverySession *)self->_avDiscoverySession setTargetAudioSession:v5];
  }
  else
  {
    uint64_t v6 = _MRLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MRAVConcreteRoutingDiscoverySession _onQueue_setTargetAudioSessionID:](v3, v6);
    }

    [(AVOutputDeviceDiscoverySession *)self->_avDiscoverySession setTargetAudioSession:0];
    LODWORD(v3) = 0;
  }
  self->_targetAudioSessionID = v3;
  [(MRAVConcreteRoutingDiscoverySession *)self _scheduleReload];
}

- (NSArray)virtualOutputDevices
{
  return self->_virtualOutputDevices;
}

- (void)setLastReportedClientIdentifiers:(id)a3
{
}

- (void)_availableOutputDevicesDidChangeNotification:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_194F3C000, a2, OS_LOG_TYPE_DEBUG, "[AVDiscoverySession] Output devices did change notification received. Reloading available endpoints and output devices. %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_onQueue_reloadAvailableOutputDevices
{
  *(_DWORD *)buf = 134217984;
  *(double *)(buf + 4) = a3;
  _os_log_error_impl(&dword_194F3C000, a2, OS_LOG_TYPE_ERROR, "[AVDiscoverySession] Querying AVDiscoverySession time took %lf seconds", buf, 0xCu);
}

void __76__MRAVConcreteRoutingDiscoverySession__scheduleAvailableOutputDevicesReload__block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [*a1 timeIntervalSinceNow];
  int v4 = 134217984;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_194F3C000, a2, OS_LOG_TYPE_ERROR, "[AVDiscoverySession] Dispatching to reloadQueue took %lf seconds", (uint8_t *)&v4, 0xCu);
}

void __76__MRAVConcreteRoutingDiscoverySession__scheduleAvailableOutputDevicesReload__block_invoke_cold_2(int *a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_194F3C000, log, OS_LOG_TYPE_ERROR, "[AVDiscoverySession] ReloadQueue priority degrated from %u -> %u", (uint8_t *)v4, 0xEu);
}

- (void)_onQueue_setTargetAudioSessionID:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_194F3C000, a2, OS_LOG_TYPE_ERROR, "[AVDiscoverySession] No audio session found for ID %u. Will target active session.", (uint8_t *)v2, 8u);
}

@end