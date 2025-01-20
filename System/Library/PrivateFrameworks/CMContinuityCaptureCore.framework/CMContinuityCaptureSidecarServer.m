@interface CMContinuityCaptureSidecarServer
- (CMContinuityCaptureSidecarServer)initWithRequest:(id)a3;
- (CMContinuityCaptureTimeSyncClock)timeSyncClock;
- (ContinuityCaptureTaskDelegate)delegate;
- (ContinuityCaptureTransportDevice)localDevice;
- (NSDate)sessionActivationStartTime;
- (OS_dispatch_queue)queue;
- (int64_t)clientDeviceModel;
- (int64_t)currentTransport;
- (unint64_t)currentSessionID;
- (void)_activate;
- (void)_cancel;
- (void)_resetRequest:(id)a3;
- (void)activate;
- (void)cancel;
- (void)resetRequest:(id)a3;
- (void)setCurrentSessionID:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setupMediaSidecarStreamForIdentifier:(id)a3 type:(int64_t)a4 completion:(id)a5;
- (void)setupSidebandSidecarStreamForIdentifier:(id)a3 type:(int64_t)a4 completion:(id)a5;
- (void)setupSidecarStreams;
- (void)teardownSidecarStreams;
@end

@implementation CMContinuityCaptureSidecarServer

- (CMContinuityCaptureSidecarServer)initWithRequest:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.continuity-capture-server", v6);

  if (v5)
  {
    v8 = [CMContinuityCaptureTransportSidecarDevice alloc];
    v9 = [v5 device];
    v10 = +[CMContinuityCaptureCapabilities capabilitiesForCurrentDevice];
    v11 = [(CMContinuityCaptureTransportSidecarDevice *)v8 initWithSidecarDevice:v9 capabilities:v10 remote:0];

    if (v11
      && (v16.receiver = self,
          v16.super_class = (Class)CMContinuityCaptureSidecarServer,
          v12 = [(CMContinuityCaptureSidecarTransportBase *)&v16 initWithDevice:v11 queue:v7 taskDelegate:0], (self = v12) != 0))
    {
      objc_storeStrong((id *)&v12->_activeRequest, a3);
      objc_storeStrong((id *)&self->_device, v11);
      objc_storeStrong((id *)&self->_queue, v7);
      v13 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v18 = self;
        __int16 v19 = 2114;
        v20 = v11;
        _os_log_impl(&dword_235FC2000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ created with device %{public}@", buf, 0x16u);
      }

      self = self;
      v14 = self;
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
    v11 = 0;
  }

  return v14;
}

- (NSDate)sessionActivationStartTime
{
  return 0;
}

- (ContinuityCaptureTaskDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ContinuityCaptureTaskDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CMContinuityCaptureSidecarServer;
  id v4 = a3;
  [(CMContinuityCaptureSidecarTransportBase *)&v5 setTaskDelegate:v4];
  objc_storeWeak((id *)&self->_delegate, v4);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CMContinuityCaptureTimeSyncClock)timeSyncClock
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_timeSyncClock;
  objc_sync_exit(v2);

  return v3;
}

- (ContinuityCaptureTransportDevice)localDevice
{
  return (ContinuityCaptureTransportDevice *)self->_device;
}

- (int64_t)clientDeviceModel
{
  return 0;
}

- (int64_t)currentTransport
{
  v3 = [(CMContinuityCaptureSidecarTransportBase *)self device];
  objc_sync_enter(v3);
  id v4 = [(CMContinuityCaptureSidecarTransportBase *)self device];
  objc_super v5 = [v4 activeStreams];
  if ([v5 count])
  {
    v6 = [(CMContinuityCaptureSidecarTransportBase *)self device];
    dispatch_queue_t v7 = [v6 activeStreams];
    v8 = [v7 firstObject];
  }
  else
  {
    v8 = 0;
  }

  objc_sync_exit(v3);
  if (v8)
  {
    v9 = [v8 stream];
    uint64_t v10 = [v9 transport];

    if (v10 == 2) {
      int64_t v11 = 2;
    }
    else {
      int64_t v11 = v10 == 1;
    }
  }
  else
  {
    int64_t v11 = 0;
  }

  return v11;
}

- (unint64_t)currentSessionID
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t currentSessionID = v2->_currentSessionID;
  objc_sync_exit(v2);

  return currentSessionID;
}

- (void)setCurrentSessionID:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_unint64_t currentSessionID = a3;
  objc_sync_exit(obj);
}

- (void)_resetRequest:(id)a3
{
  id v8 = a3;
  objc_super v5 = [(CMContinuityCaptureSidecarServer *)self queue];
  dispatch_assert_queue_V2(v5);

  if (v8)
  {
    device = self->_device;
    dispatch_queue_t v7 = [v8 device];
    [(CMContinuityCaptureTransportSidecarDevice *)device resetDevice:v7];

    objc_storeStrong((id *)&self->_activeRequest, a3);
    [(CMContinuityCaptureSidecarServer *)self _activate];
  }
  else
  {
    [(CMContinuityCaptureSidecarServer *)self _cancel];
  }
}

- (void)resetRequest:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  objc_super v5 = [(CMContinuityCaptureSidecarServer *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__CMContinuityCaptureSidecarServer_resetRequest___block_invoke;
  block[3] = &unk_264C99120;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __49__CMContinuityCaptureSidecarServer_resetRequest___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    if (*(void *)(a1 + 32))
    {
      [WeakRetained[9] setLegacyReconnectRecovery:1];
      uint64_t v3 = *(void *)(a1 + 32);
    }
    else
    {
      uint64_t v3 = 0;
    }
    [v4 _resetRequest:v3];
    id WeakRetained = v4;
  }
}

- (void)activate
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v3 = [(CMContinuityCaptureSidecarServer *)self queue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__CMContinuityCaptureSidecarServer_activate__block_invoke;
  v4[3] = &unk_264C990F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __44__CMContinuityCaptureSidecarServer_activate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _activate];
    id WeakRetained = v2;
  }
}

- (void)_activate
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(CMContinuityCaptureSidecarServer *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543618;
    id v6 = self;
    __int16 v7 = 2080;
    id v8 = "-[CMContinuityCaptureSidecarServer _activate]";
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v5, 0x16u);
  }

  if (self->_activeRequest) {
    [(CMContinuityCaptureSidecarServer *)self setupSidecarStreams];
  }
}

- (void)cancel
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v3 = [(CMContinuityCaptureSidecarServer *)self queue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__CMContinuityCaptureSidecarServer_cancel__block_invoke;
  v4[3] = &unk_264C990F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __42__CMContinuityCaptureSidecarServer_cancel__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _cancel];
    id WeakRetained = v2;
  }
}

- (void)_cancel
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(CMContinuityCaptureSidecarServer *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    __int16 v7 = self;
    __int16 v8 = 2080;
    uint64_t v9 = "-[CMContinuityCaptureSidecarServer _cancel]";
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v6, 0x16u);
  }

  [(CMContinuityCaptureSidecarServer *)self teardownSidecarStreams];
  activeRequest = self->_activeRequest;
  self->_activeRequest = 0;
}

- (void)setupSidebandSidecarStreamForIdentifier:(id)a3 type:(int64_t)a4 completion:(id)a5
{
}

- (void)setupMediaSidecarStreamForIdentifier:(id)a3 type:(int64_t)a4 completion:(id)a5
{
  activeRequest = self->_activeRequest;
  id v8 = a5;
  id v9 = a3;
  [(SidecarRequest *)activeRequest openStreamForType:a4 flags:2 identifier:v9 processUniqueID:CMContinuityCaptureGetMediaProcessUniqueID(0) completion:v8];
}

- (void)setupSidecarStreams
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7.receiver = self;
  v7.super_class = (Class)CMContinuityCaptureSidecarServer;
  [(CMContinuityCaptureSidecarTransportBase *)&v7 setupSidecarStreams];
  uint64_t v3 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = self;
    _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ ActivateRequest", buf, 0xCu);
  }

  id v4 = [(SidecarRequest *)self->_activeRequest session];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__CMContinuityCaptureSidecarServer_setupSidecarStreams__block_invoke;
  v5[3] = &unk_264C99DE8;
  objc_copyWeak(&v6, &location);
  [(CMContinuityCaptureSidecarTransportBase *)self createTimeSyncClockForSession:v4 completion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __55__CMContinuityCaptureSidecarServer_setupSidecarStreams__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v7 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained willChangeValueForKey:@"timeSyncClock"];
    id v8 = v7;
    objc_sync_enter(v8);
    objc_storeStrong(v8 + 10, a2);
    objc_sync_exit(v8);

    [v8 didChangeValueForKey:@"timeSyncClock"];
    id v9 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = objc_loadWeakRetained(v5);
      id v11 = v8[10];
      int v12 = 138543618;
      id v13 = v10;
      __int16 v14 = 2112;
      id v15 = v11;
      _os_log_impl(&dword_235FC2000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ got timeSync clock %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)teardownSidecarStreams
{
  activeRequest = self->_activeRequest;
  self->_activeRequest = 0;

  timeSyncClock = self->_timeSyncClock;
  self->_timeSyncClock = 0;

  v5.receiver = self;
  v5.super_class = (Class)CMContinuityCaptureSidecarServer;
  [(CMContinuityCaptureSidecarTransportBase *)&v5 teardownSidecarStreams];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timeSyncClock, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_activeRequest, 0);
}

@end