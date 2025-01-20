@interface CMContinuityCaptureTransportNWDevice
- (BOOL)active;
- (BOOL)allFeaturesSupported;
- (BOOL)canDeferTermination;
- (BOOL)canReconnect;
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
- (CMContinuityCaptureTransportNWDevice)initWithCapabilities:(id)a3 identifier:(id)a4 remote:(BOOL)a5;
- (NSArray)activeStreams;
- (NSString)deviceModel;
- (NSString)deviceName;
- (NSUUID)deviceIdentifier;
- (OS_dispatch_queue)queue;
- (OS_nw_connection)activeConnection;
- (int64_t)deviceModelType;
- (unint64_t)deviceMajorVersion;
- (unint64_t)deviceMinorVersion;
- (unint64_t)deviceStatus;
- (void)activate:(BOOL)a3;
- (void)captureStillImage:(id)a3 entity:(int64_t)a4 completion:(id)a5;
- (void)didCaptureStillImage:(id)a3 entity:(int64_t)a4;
- (void)handleAVCNegotiation:(int64_t)a3 data:(id)a4;
- (void)postEvent:(id)a3 entity:(int64_t)a4 data:(id)a5;
- (void)sendRequest:(id)a3;
- (void)setActiveConnection:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setLegacyReconnectRecovery:(BOOL)a3;
- (void)setNearby:(BOOL)a3;
- (void)setStreamIntent:(BOOL)a3;
- (void)setValueForControl:(id)a3 completion:(id)a4;
- (void)setupUDPNWStack;
- (void)startStream:(id)a3 option:(unint64_t)a4 completion:(id)a5;
- (void)stopStream:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5;
@end

@implementation CMContinuityCaptureTransportNWDevice

- (CMContinuityCaptureTransportNWDevice)initWithCapabilities:(id)a3 identifier:(id)a4 remote:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CMContinuityCaptureTransportNWDevice;
  v11 = [(CMContinuityCaptureTransportNWDevice *)&v20 init];
  if (v11)
  {
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.continuitycapture.localDevice", v12);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v13;

    v11->_remote = a5;
    v15 = [[CMContinuityCaptureMagicStateMonitor alloc] initWithDevice:v11];
    magicStateMonitor = v11->_magicStateMonitor;
    v11->_magicStateMonitor = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    activeStreams = v11->_activeStreams;
    v11->_activeStreams = v17;

    objc_storeStrong((id *)&v11->_deviceIdentifier, a4);
    objc_storeStrong((id *)&v11->_capabilities, a3);
    [(CMContinuityCaptureTransportNWDevice *)v11 setupUDPNWStack];
  }

  return v11;
}

- (void)setActiveConnection:(id)a3
{
  v4 = (OS_nw_connection *)a3;
  obj = self;
  objc_sync_enter(obj);
  activeConnection = obj->_activeConnection;
  obj->_activeConnection = v4;

  objc_sync_exit(obj);
}

- (OS_nw_connection)activeConnection
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_activeConnection;
  objc_sync_exit(v2);

  return v3;
}

- (void)setupUDPNWStack
{
  v19[2] = *MEMORY[0x263EF8340];
  v19[0] = 0xAAAAAAAAAAAAAAAALL;
  v19[1] = 0xAAAAAAAAAAAAAAAALL;
  [localIPAddress UTF8String];
  host_with_numeric_port = nw_endpoint_create_host_with_numeric_port();
  if (!host_with_numeric_port)
  {
    v12 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      v16 = self;
      v14 = "%@ Failed to get local endpoint";
LABEL_14:
      _os_log_impl(&dword_235FC2000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v15, 0xCu);
      v4 = 0;
      secure_udp = 0;
LABEL_8:

      goto LABEL_9;
    }
    v4 = 0;
LABEL_16:
    secure_udp = 0;
    goto LABEL_8;
  }
  [localIPAddress UTF8String];
  v4 = (void *)nw_endpoint_create_host_with_numeric_port();
  if (!v4)
  {
    v12 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      v16 = self;
      v14 = "%@ Failed to get remote endpoint";
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x263F14478], &__block_literal_global_139);
  CMContinuityCaptureGetMediaProcessUniqueID(self->_remote);
  nw_parameters_set_delegated_unique_pid();
  nw_parameters_set_reuse_local_address(secure_udp, 1);
  nw_parameters_set_local_endpoint(secure_udp, host_with_numeric_port);
  evaluator_for_endpoint = (OS_nw_path_evaluator *)nw_path_create_evaluator_for_endpoint();
  nwPathEvaluator = self->_nwPathEvaluator;
  self->_nwPathEvaluator = evaluator_for_endpoint;

  v8 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = self->_nwPathEvaluator;
    int v15 = 138412546;
    v16 = self;
    __int16 v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEFAULT, "%@ NW Path evaulator %@", (uint8_t *)&v15, 0x16u);
  }

  if (self->_nwPathEvaluator)
  {
    nw_path_evaluator_get_client_id();
    id v10 = (NSUUID *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v19];
    nwClientID = self->_nwClientID;
    self->_nwClientID = v10;

    v12 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_queue_t v13 = self->_nwClientID;
      int v15 = 138412546;
      v16 = self;
      __int16 v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_235FC2000, v12, OS_LOG_TYPE_DEFAULT, "%@ NWClientID %@", (uint8_t *)&v15, 0x16u);
    }
    goto LABEL_8;
  }
LABEL_9:
}

uint64_t __55__CMContinuityCaptureTransportNWDevice_setupUDPNWStack__block_invoke(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270EF9610](a2, 1);
}

- (CMContinuityCaptureCapabilities)capabilities
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_capabilities;
  objc_sync_exit(v2);

  return v3;
}

- (void)setCapabilities:(id)a3
{
  v4 = (CMContinuityCaptureCapabilities *)a3;
  obj = self;
  objc_sync_enter(obj);
  capabilities = obj->_capabilities;
  obj->_capabilities = v4;

  objc_sync_exit(obj);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
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

- (CMContinuityCaptureMagicStateMonitor)magicStateMonitor
{
  return self->_magicStateMonitor;
}

- (NSArray)activeStreams
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_alloc(MEMORY[0x263EFF8C0]);
  v4 = [(NSMutableDictionary *)v2->_activeStreams allValues];
  v5 = (void *)[v3 initWithArray:v4];

  objc_sync_exit(v2);
  return (NSArray *)v5;
}

- (BOOL)userDisconnected
{
  return 0;
}

- (BOOL)wifiP2pActive
{
  return 1;
}

- (BOOL)allFeaturesSupported
{
  return 1;
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)deviceName
{
  return (NSString *)@"LocalTestDevice";
}

- (NSString)deviceModel
{
  return (NSString *)@"LocalEmbeddedDevice";
}

- (int64_t)deviceModelType
{
  return 0;
}

- (unint64_t)deviceStatus
{
  return 0x1000000;
}

- (BOOL)wired
{
  return 1;
}

- (BOOL)usable
{
  return 1;
}

- (unint64_t)deviceMajorVersion
{
  return 100;
}

- (unint64_t)deviceMinorVersion
{
  return 1;
}

- (BOOL)guest
{
  return 0;
}

- (BOOL)terminationDeferred
{
  return 0;
}

- (BOOL)canDeferTermination
{
  return 0;
}

- (BOOL)isPlacementStepSkipped
{
  return 1;
}

- (void)activate:(BOOL)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v21 = CMContinuityCaptureGetListOfSupportedSidebandIdentifiers();
    v4 = [(CMContinuityCaptureTransportNWDevice *)self capabilities];
    v5 = CMContinuityCaptureMediaIdentfiersForCapabilities(v4);

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    obuint64_t j = v5;
    uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v29 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          id v10 = [[CMContinuityCaptureTransportDeviceNWStream alloc] initForIdentifier:v9 nwClientID:self->_nwClientID];
          if (v10)
          {
            [(CMContinuityCaptureTransportNWDevice *)self willChangeValueForKey:@"activeStreams"];
            v11 = self;
            objc_sync_enter(v11);
            [(NSMutableDictionary *)self->_activeStreams setObject:v10 forKeyedSubscript:v9];
            objc_sync_exit(v11);

            [(CMContinuityCaptureTransportNWDevice *)v11 didChangeValueForKey:@"activeStreams"];
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v6);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v12 = v21;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * j);
          id v17 = [[CMContinuityCaptureTransportDeviceNWStream alloc] initForIdentifier:v16 nwClientID:self->_nwClientID];
          if (v17)
          {
            [(CMContinuityCaptureTransportNWDevice *)self willChangeValueForKey:@"activeStreams"];
            v18 = self;
            objc_sync_enter(v18);
            [(NSMutableDictionary *)self->_activeStreams setObject:v17 forKeyedSubscript:v16];
            objc_sync_exit(v18);

            [(CMContinuityCaptureTransportNWDevice *)v18 didChangeValueForKey:@"activeStreams"];
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v13);
    }
  }
  else
  {
    [(CMContinuityCaptureTransportNWDevice *)self willChangeValueForKey:@"activeStreams"];
    v19 = self;
    objc_sync_enter(v19);
    [(NSMutableDictionary *)v19->_activeStreams removeAllObjects];
    objc_sync_exit(v19);

    [(CMContinuityCaptureTransportNWDevice *)v19 didChangeValueForKey:@"activeStreams"];
  }
  [(CMContinuityCaptureTransportNWDevice *)self willChangeValueForKey:@"active"];
  objc_super v20 = self;
  objc_sync_enter(v20);
  v20->_BOOL active = a3;
  objc_sync_exit(v20);

  [(CMContinuityCaptureTransportNWDevice *)v20 didChangeValueForKey:@"active"];
}

- (void)sendRequest:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = [(CMContinuityCaptureTransportNWDevice *)self activeConnection];
  BOOL v6 = v5 == 0;

  if (!v6)
  {
    uint64_t v7 = [v4 length] + 8;
    id v8 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:v7];
    uint64_t v9 = (uint64_t *)[v8 mutableBytes];
    *uint64_t v9 = v7;
    id v10 = v9 + 1;
    id v11 = v4;
    memcpy(v10, (const void *)[v11 bytes], objc_msgSend(v11, "length"));
    id v12 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = objc_loadWeakRetained(&location);
      *(_DWORD *)buf = 138412546;
      id v20 = v13;
      __int16 v21 = 2112;
      id v22 = v11;
      _os_log_impl(&dword_235FC2000, v12, OS_LOG_TYPE_DEFAULT, "%@ NW Connect Send Data %@", buf, 0x16u);
    }
    uint64_t v14 = [(CMContinuityCaptureTransportNWDevice *)self activeConnection];
    id v15 = objc_loadWeakRetained(&location);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __52__CMContinuityCaptureTransportNWDevice_sendRequest___block_invoke;
    v16[3] = &unk_264C9AB60;
    objc_copyWeak(&v17, &location);
    CMContinuityCaptureSendDataToNWConnection(v14, v8, v15, v16);

    objc_destroyWeak(&v17);
  }
  objc_destroyWeak(&location);
}

void __52__CMContinuityCaptureTransportNWDevice_sendRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v6 = 138412546;
    id v7 = WeakRetained;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%@ NW connection send data error %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)captureStillImage:(id)a3 entity:(int64_t)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void (**)(id, void))a5;
  id v21 = 0;
  uint64_t v10 = [MEMORY[0x263F08910] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v21];
  id v11 = v21;
  if (v10)
  {
    v24[0] = &unk_26E96A708;
    v23[0] = @"ContinuityCaptureSelector";
    v23[1] = @"ContinuityCaptureArgs";
    v22[0] = v10;
    id v12 = [NSNumber numberWithInteger:a4];
    v22[1] = v12;
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
    v23[2] = @"identifier";
    v24[1] = v13;
    v24[2] = @"ContinuityCaptureCommand";
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];

    id v20 = v11;
    id v15 = [MEMORY[0x263F08910] archivedDataWithRootObject:v14 requiringSecureCoding:1 error:&v20];
    id v16 = v20;

    if (v15)
    {
      [(CMContinuityCaptureTransportNWDevice *)self sendRequest:v15];
      id v17 = 0;
    }
    else
    {
      v19 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        long long v26 = self;
        __int16 v27 = 2112;
        id v28 = v14;
        __int16 v29 = 2112;
        id v30 = v16;
        _os_log_error_impl(&dword_235FC2000, v19, OS_LOG_TYPE_ERROR, "%{public}@ Failed to archive message %@ error %@", buf, 0x20u);
      }

      id v17 = v16;
    }
    ((void (**)(id, id))v9)[2](v9, v17);

    id v11 = v16;
  }
  else
  {
    v18 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      long long v26 = self;
      __int16 v27 = 2112;
      id v28 = v8;
      __int16 v29 = 2112;
      id v30 = v11;
      _os_log_error_impl(&dword_235FC2000, v18, OS_LOG_TYPE_ERROR, "%{public}@ archivedDataWithRootObject %@ Error %@", buf, 0x20u);
    }

    ((void (**)(id, id))v9)[2](v9, v11);
  }
}

- (void)didCaptureStillImage:(id)a3 entity:(int64_t)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  int v6 = a3;
  id v16 = 0;
  id v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v16];
  id v8 = v16;
  if (v7)
  {
    v19[0] = &unk_26E96A720;
    v18[0] = @"ContinuityCaptureSelector";
    v18[1] = @"ContinuityCaptureArgs";
    v17[0] = v7;
    id v9 = [NSNumber numberWithInteger:a4];
    v17[1] = v9;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
    v18[2] = @"identifier";
    v19[1] = v10;
    v19[2] = @"ContinuityCaptureData";
    id v11 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];

    id v15 = v8;
    id v12 = [MEMORY[0x263F08910] archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v15];
    id v13 = v15;

    if (v12)
    {
      [(CMContinuityCaptureTransportNWDevice *)self sendRequest:v12];
    }
    else
    {
      uint64_t v14 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v21 = self;
        __int16 v22 = 2112;
        uint64_t v23 = v11;
        __int16 v24 = 2112;
        id v25 = v13;
        _os_log_error_impl(&dword_235FC2000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Failed to archive message %@ error %@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v11 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v21 = self;
      __int16 v22 = 2112;
      uint64_t v23 = v6;
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_error_impl(&dword_235FC2000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Failed to archive request %@ error %@", buf, 0x20u);
    }
    id v13 = v8;
  }
}

- (void)handleAVCNegotiation:(int64_t)a3 data:(id)a4
{
  v22[3] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v22[0] = &unk_26E96A738;
  v21[0] = @"ContinuityCaptureSelector";
  v21[1] = @"ContinuityCaptureArgs";
  id v7 = [NSNumber numberWithInteger:a3];
  v20[0] = v7;
  v20[1] = v6;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  v21[2] = @"identifier";
  v22[1] = v8;
  void v22[2] = @"ContinuityCaptureControl";
  id v9 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];

  uint64_t v10 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v15 = self;
    __int16 v16 = 2080;
    id v17 = "-[CMContinuityCaptureTransportNWDevice handleAVCNegotiation:data:]";
    __int16 v18 = 1024;
    int v19 = a3;
    _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %s for entity %d", buf, 0x1Cu);
  }

  id v13 = 0;
  id v11 = [MEMORY[0x263F08910] archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v13];
  id v12 = v13;
  if (v11) {
    [(CMContinuityCaptureTransportNWDevice *)self sendRequest:v11];
  }
}

- (void)postEvent:(id)a3 entity:(int64_t)a4 data:(id)a5
{
  v15[3] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v15[0] = &unk_26E96A750;
  v14[0] = @"ContinuityCaptureSelector";
  v14[1] = @"ContinuityCaptureArgs";
  v13[0] = v7;
  id v8 = [NSNumber numberWithInteger:a4];
  v13[1] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  v14[2] = @"identifier";
  v15[1] = v9;
  v15[2] = @"ContinuityCaptureCommand";
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

  uint64_t v12 = 0;
  id v11 = [MEMORY[0x263F08910] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v12];
  if (v11) {
    [(CMContinuityCaptureTransportNWDevice *)self sendRequest:v11];
  }
}

- (void)setValueForControl:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = self;
    __int16 v22 = 2114;
    id v23 = v6;
    _os_log_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ setValueForControl %{public}@", buf, 0x16u);
  }

  id v16 = 0;
  id v9 = [MEMORY[0x263F08910] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v16];
  id v10 = v16;
  if (v9)
  {
    v19[0] = &unk_26E96A768;
    v18[0] = @"ContinuityCaptureSelector";
    v18[1] = @"ContinuityCaptureArgs";
    id v17 = v9;
    id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
    v18[2] = @"identifier";
    v19[1] = v11;
    v19[2] = @"ContinuityCaptureControl";
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];

    id v15 = v10;
    id v13 = [MEMORY[0x263F08910] archivedDataWithRootObject:v12 requiringSecureCoding:1 error:&v15];
    id v14 = v15;

    if (!v13) {
      goto LABEL_7;
    }
    [(CMContinuityCaptureTransportNWDevice *)self sendRequest:v13];
    id v10 = v14;
  }
  else
  {
    id v13 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v21 = self;
      __int16 v22 = 2112;
      id v23 = v10;
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_error_impl(&dword_235FC2000, v13, OS_LOG_TYPE_ERROR, "%{public}@ archivedDataWithRootObject Error %@ for control %@", buf, 0x20u);
    }
    uint64_t v12 = 0;
  }

  id v14 = v10;
LABEL_7:
  if (v7) {
    v7[2](v7);
  }
}

- (void)startStream:(id)a3 option:(unint64_t)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void (**)(id, void))a5;
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
    v23[0] = &unk_26E96A768;
    v22[0] = @"ContinuityCaptureSelector";
    v22[1] = @"ContinuityCaptureArgs";
    v21[0] = v11;
    id v13 = [NSNumber numberWithUnsignedInteger:a4];
    v21[1] = v13;
    v21[2] = &unk_26E96A780;
    id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
    void v22[2] = @"identifier";
    v23[1] = v14;
    v23[2] = @"ContinuityCaptureCommand";
    id v15 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];

    id v19 = v12;
    id v16 = [MEMORY[0x263F08910] archivedDataWithRootObject:v15 requiringSecureCoding:1 error:&v19];
    id v17 = v19;

    if (v16) {
      [(CMContinuityCaptureTransportNWDevice *)self sendRequest:v16];
    }
    if (v9) {
      v9[2](v9, 0);
    }

    id v12 = v17;
  }
  else
  {
    __int16 v18 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureTransportSidecarDevice _startStream:option:completion:]();
    }

    ((void (**)(id, id))v9)[2](v9, v12);
  }
}

- (void)stopStream:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = (void (**)(id, void))a5;
  id v9 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v21 = self;
    __int16 v22 = 1024;
    int v23 = a3;
    __int16 v24 = 1024;
    int v25 = a4;
    _os_log_impl(&dword_235FC2000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ stopStream for entity %u option %d", buf, 0x18u);
  }

  v19[0] = &unk_26E96A738;
  v18[0] = @"ContinuityCaptureSelector";
  v18[1] = @"ContinuityCaptureArgs";
  id v10 = [NSNumber numberWithInteger:a3];
  v17[0] = v10;
  id v11 = [NSNumber numberWithUnsignedInteger:a4];
  v17[1] = v11;
  void v17[2] = &unk_26E96A780;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
  v18[2] = @"identifier";
  v19[1] = v12;
  v19[2] = @"ContinuityCaptureCommand";
  id v13 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];

  id v16 = 0;
  id v14 = [MEMORY[0x263F08910] archivedDataWithRootObject:v13 requiringSecureCoding:1 error:&v16];
  id v15 = v16;
  if (v14) {
    [(CMContinuityCaptureTransportNWDevice *)self sendRequest:v14];
  }
  if (v8) {
    v8[2](v8, 0);
  }
}

- (BOOL)canReconnect
{
  return self->canReconnect;
}

- (BOOL)legacyReconnectRecovery
{
  return self->legacyReconnectRecovery;
}

- (void)setLegacyReconnectRecovery:(BOOL)a3
{
  self->legacyReconnectRecovery = a3;
}

- (BOOL)nearby
{
  return self->nearby;
}

- (void)setNearby:(BOOL)a3
{
  self->nearby = a3;
}

- (BOOL)hasStreamIntent
{
  return self->streamIntent;
}

- (void)setStreamIntent:(BOOL)a3
{
  self->streamIntent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConnection, 0);
  objc_storeStrong((id *)&self->_nwClientID, 0);
  objc_storeStrong((id *)&self->_nwPathEvaluator, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_activeStreams, 0);
  objc_storeStrong((id *)&self->_magicStateMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end