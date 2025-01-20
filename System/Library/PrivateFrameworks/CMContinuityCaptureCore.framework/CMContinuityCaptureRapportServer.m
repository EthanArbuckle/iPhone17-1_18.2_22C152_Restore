@interface CMContinuityCaptureRapportServer
+ (id)rapportDeviceForSession:(id)a3;
- (CMContinuityCaptureConfiguration)preStartConfiguration;
- (CMContinuityCaptureRapportServer)initWithRapportDisplaySession:(id)a3 queue:(id)a4 voucher:(id)a5 incomingStreamRequestHandler:(id)a6;
- (CMContinuityCaptureRemoteCompositeDevice)compositeDevice;
- (CMContinuityCaptureTimeSyncClock)timeSyncClock;
- (ContinuityCaptureTaskDelegate)delegate;
- (ContinuityCaptureTransportDevice)localDevice;
- (NSDate)sessionActivationStartTime;
- (OS_dispatch_queue)queue;
- (RPRemoteDisplaySession)displaySession;
- (int64_t)clientDeviceModel;
- (int64_t)currentTransport;
- (unint64_t)currentSessionID;
- (void)cancel;
- (void)createStreamWithIdentifier:(id)a3 isMediaStream:(BOOL)a4 completion:(id)a5;
- (void)invalidateCurrentSession:(id)a3;
- (void)parseAndActOnStreamsSetupInfo:(id)a3;
- (void)parseAndNotifySessionStartInfo:(id)a3 transportInfo:(id)a4;
- (void)relayTerminationComplete;
- (void)resetDisplaySession:(id)a3;
- (void)setCurrentSessionID:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setupRemoteDisplaySession:(id)a3;
@end

@implementation CMContinuityCaptureRapportServer

- (CMContinuityCaptureRapportServer)initWithRapportDisplaySession:(id)a3 queue:(id)a4 voucher:(id)a5 incomingStreamRequestHandler:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = +[CMContinuityCaptureRapportServer rapportDeviceForSession:v10];
  if (v14
    && (v26.receiver = self,
        v26.super_class = (Class)CMContinuityCaptureRapportServer,
        v15 = [(CMContinuityCaptureRapportTransportBase *)&v26 initWithRapportDevice:v14 queue:v11 taskDelegate:0], (self = v15) != 0))
  {
    objc_storeStrong((id *)&v15->_queue, a4);
    objc_storeStrong((id *)&self->_voucher, a5);
    objc_storeStrong((id *)&self->_device, v14);
    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    createdIdentifiers = self->_createdIdentifiers;
    self->_createdIdentifiers = v16;

    self->_clientDeviceModel = [v14 deviceModelType];
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    pendingActivateStreamsByIdentifier = self->_pendingActivateStreamsByIdentifier;
    self->_pendingActivateStreamsByIdentifier = v18;

    [(CMContinuityCaptureRapportTransportBase *)self setIncomingStreamRequestHandler:v13];
    v20 = [[CMContinuityCaptureRemoteCompositeDevice alloc] initWithTransportServer:self videoPreviewLayer:0];
    compositeDevice = self->_compositeDevice;
    self->_compositeDevice = v20;

    v22 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = self->_compositeDevice;
      *(_DWORD *)buf = 138543618;
      v28 = self;
      __int16 v29 = 2114;
      v30 = v23;
      _os_log_impl(&dword_235FC2000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ composite device %{public}@", buf, 0x16u);
    }

    [(CMContinuityCaptureRapportServer *)self setupRemoteDisplaySession:v10];
    self = self;
    v24 = self;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (int64_t)clientDeviceModel
{
  return self->_clientDeviceModel;
}

- (void)resetDisplaySession:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    __int16 v12 = 2080;
    id v13 = "-[CMContinuityCaptureRapportServer resetDisplaySession:]";
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__CMContinuityCaptureRapportServer_resetDisplaySession___block_invoke;
  v8[3] = &unk_264C99120;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __56__CMContinuityCaptureRapportServer_resetDisplaySession___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[10];
    id v5 = WeakRetained;
    id v4 = [*(id *)(a1 + 32) destinationDevice];
    [v3 resetDevice:v4];

    [v5 setupRemoteDisplaySession:*(void *)(a1 + 32)];
    WeakRetained = v5;
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (ContinuityCaptureTaskDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ContinuityCaptureTaskDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CMContinuityCaptureRapportServer;
  id v4 = a3;
  [(CMContinuityCaptureRapportTransportBase *)&v5 setTaskDelegate:v4];
  objc_storeWeak((id *)&self->_delegate, v4);
}

- (CMContinuityCaptureTimeSyncClock)timeSyncClock
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_timeSyncClock;
  objc_sync_exit(v2);

  return v3;
}

- (CMContinuityCaptureRemoteCompositeDevice)compositeDevice
{
  return self->_compositeDevice;
}

- (void)invalidateCurrentSession:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_super v5 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    rpDisplaySession = self->_rpDisplaySession;
    int v9 = 138543618;
    id v10 = self;
    __int16 v11 = 2114;
    __int16 v12 = rpDisplaySession;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Invalidate current session %{public}@", (uint8_t *)&v9, 0x16u);
  }

  [(CMContinuityCaptureTransportRapportDevice *)self->_device teardownActiveRapportStreams];
  [(NSMutableSet *)self->_createdIdentifiers removeAllObjects];
  [(CMContinuityCaptureRapportTransportBase *)self disposeTimeSyncClock];
  id v7 = self;
  objc_sync_enter(v7);
  timeSyncClock = v7->_timeSyncClock;
  v7->_timeSyncClock = 0;

  objc_sync_exit(v7);
  if (v4) {
    v4[2](v4);
  }
}

- (NSDate)sessionActivationStartTime
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_sessionActivationStartTime;
  objc_sync_exit(v2);

  return v3;
}

+ (id)rapportDeviceForSession:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
  id v26 = 0;
  objc_super v5 = MEMORY[0x263EF83A0];
  id v6 = MEMORY[0x263EF83A0];
  dispatch_assert_queue_not_V2(v5);

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__CMContinuityCaptureRapportServer_rapportDeviceForSession___block_invoke;
  block[3] = &unk_264C99328;
  block[4] = &v21;
  dispatch_async_and_wait(v5, block);

  int CFPreferenceBooleanWithDefault = FigGetCFPreferenceBooleanWithDefault();
  uint64_t v8 = v22[5];
  if (!v8 && CFPreferenceBooleanWithDefault)
  {
    int v9 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v28 = a1;
      _os_log_impl(&dword_235FC2000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ use default camera capabilities", buf, 0xCu);
    }

    id v10 = NSDictionary;
    __int16 v11 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CMContinuityCaptureCore"];
    __int16 v12 = [v11 pathForResource:@"SampleCameraCapabilities" ofType:@"plist"];
    uint64_t v13 = [v10 dictionaryWithContentsOfFile:v12];

    uint64_t v14 = [[CMContinuityCaptureCapabilities alloc] initWithDictionaryRepresentation:v13];
    v15 = (void *)v22[5];
    v22[5] = (uint64_t)v14;

    uint64_t v8 = v22[5];
  }
  if (v8)
  {
    v16 = [CMContinuityCaptureTransportRapportDevice alloc];
    v17 = [v4 destinationDevice];
    v18 = [(CMContinuityCaptureTransportRapportDevice *)v16 initWithRapportDevice:v17 capabilities:v22[5] remote:0];
  }
  else
  {
    v18 = 0;
  }
  _Block_object_dispose(&v21, 8);

  return v18;
}

uint64_t __60__CMContinuityCaptureRapportServer_rapportDeviceForSession___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = +[CMContinuityCaptureCapabilities capabilitiesForCurrentDevice];
  return MEMORY[0x270F9A758]();
}

- (void)createStreamWithIdentifier:(id)a3 isMediaStream:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v8 = (char *)a3;
  v22 = (void (**)(id, void))a5;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  if ([(NSMutableSet *)self->_createdIdentifiers containsObject:v8])
  {
    int v9 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      __int16 v43 = 2114;
      v44 = v8;
      _os_log_impl(&dword_235FC2000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ already created, skip", buf, 0x16u);
    }

    v22[2](v22, 0);
  }
  else
  {
    [(NSMutableSet *)self->_createdIdentifiers addObject:v8];
    id v10 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = self;
      __int16 v43 = 2080;
      v44 = "-[CMContinuityCaptureRapportServer createStreamWithIdentifier:isMediaStream:completion:]";
      __int16 v45 = 2114;
      v46 = v8;
      _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %{public}@", buf, 0x20u);
    }

    id v11 = objc_alloc_init(MEMORY[0x263F62BF8]);
    [(NSMutableDictionary *)self->_pendingActivateStreamsByIdentifier setObject:v11 forKeyedSubscript:v8];
    [v11 setStreamID:v8];
    [v11 setMessenger:self->_rpDisplaySession];
    if (v6) {
      uint64_t v12 = 3;
    }
    else {
      uint64_t v12 = 2;
    }
    [v11 setStreamType:v12];
    [v11 setServiceType:@"com.apple.continuitycapture"];
    [v11 setStreamFlags:2];
    uint64_t v13 = MEMORY[0x263EF83A0];
    id v14 = MEMORY[0x263EF83A0];
    dispatch_assert_queue_not_V2(v13);

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __88__CMContinuityCaptureRapportServer_createStreamWithIdentifier_isMediaStream_completion___block_invoke;
    block[3] = &unk_264C99198;
    objc_copyWeak(&v40, &location);
    block[4] = self;
    id v15 = v11;
    id v39 = v15;
    v16 = (void *)MEMORY[0x263EF83A0];
    dispatch_async_and_wait(MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v40);
    if (v6) {
      [v15 setDelegatedProcessUPID:CMContinuityCaptureGetMediaProcessUniqueID(0)];
    }
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v15);
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __88__CMContinuityCaptureRapportServer_createStreamWithIdentifier_isMediaStream_completion___block_invoke_27;
    v34[3] = &unk_264C9A6F8;
    objc_copyWeak(&v36, &location);
    objc_copyWeak(&v37, (id *)buf);
    v17 = v8;
    v35 = v17;
    uint64_t v21 = (void *)MEMORY[0x237DFB780](v34);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __88__CMContinuityCaptureRapportServer_createStreamWithIdentifier_isMediaStream_completion___block_invoke_28;
    v30[3] = &unk_264C9A6F8;
    objc_copyWeak(&v32, &location);
    objc_copyWeak(&v33, (id *)buf);
    uint64_t v31 = v17;
    v18 = (void *)MEMORY[0x237DFB780](v30);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __88__CMContinuityCaptureRapportServer_createStreamWithIdentifier_isMediaStream_completion___block_invoke_29;
    v26[3] = &unk_264C9A720;
    objc_copyWeak(&v28, &location);
    objc_copyWeak(&v29, (id *)buf);
    v27 = v22;
    v19 = (void *)MEMORY[0x237DFB780](v26);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __88__CMContinuityCaptureRapportServer_createStreamWithIdentifier_isMediaStream_completion___block_invoke_31;
    v23[3] = &unk_264C9A748;
    objc_copyWeak(&v24, &location);
    objc_copyWeak(&v25, (id *)buf);
    v20 = (void *)MEMORY[0x237DFB780](v23);
    [v15 setDispatchQueue:self->_queue];
    [v15 setInvalidationHandler:v21];
    [v15 setDisconnectHandler:v18];
    [v15 setReceivedEventHandler:v20];
    [v15 activateWithCompletion:v19];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v24);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v28);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v32);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)buf);
  }
  objc_destroyWeak(&location);
}

void __88__CMContinuityCaptureRapportServer_createStreamWithIdentifier_isMediaStream_completion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id WeakRetained = (unint64_t *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    unint64_t v4 = WeakRetained[14];
    if (v4 < 2)
    {
      objc_super v5 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        int v9 = 138543362;
        uint64_t v10 = v6;
        id v7 = "%{public}@ register traffic flags for Mac: None";
LABEL_8:
        _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v9, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
    if (v4 == 2)
    {
      objc_super v5 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        int v9 = 138543362;
        uint64_t v10 = v8;
        id v7 = "%{public}@ register traffic flags for ATV: None";
        goto LABEL_8;
      }
LABEL_9:

      [*(id *)(a1 + 40) setTrafficFlags:0];
    }
  }
}

void __88__CMContinuityCaptureRapportServer_createStreamWithIdentifier_isMediaStream_completion___block_invoke_27(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    unint64_t v4 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = objc_loadWeakRetained(v2);
      uint64_t v6 = [WeakRetained currentSessionID];
      id v7 = objc_loadWeakRetained((id *)(a1 + 48));
      int v10 = 138543874;
      id v11 = v5;
      __int16 v12 = 2048;
      uint64_t v13 = v6;
      __int16 v14 = 2114;
      id v15 = v7;
      _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ stream [sessionID:%llx] %{public}@ invalidated", (uint8_t *)&v10, 0x20u);
    }
    dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 11));
    uint64_t v8 = (void *)*((void *)WeakRetained + 10);
    id v9 = objc_loadWeakRetained((id *)(a1 + 48));
    [v8 removeStream:v9];

    [*((id *)WeakRetained + 19) removeObject:*(void *)(a1 + 32)];
  }
}

void __88__CMContinuityCaptureRapportServer_createStreamWithIdentifier_isMediaStream_completion___block_invoke_28(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    unint64_t v4 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = objc_loadWeakRetained(v2);
      uint64_t v6 = [WeakRetained currentSessionID];
      id v7 = objc_loadWeakRetained((id *)(a1 + 48));
      int v10 = 138543874;
      id v11 = v5;
      __int16 v12 = 2048;
      uint64_t v13 = v6;
      __int16 v14 = 2114;
      id v15 = v7;
      _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ stream [sessionID:%llx] %{public}@ disconnected", (uint8_t *)&v10, 0x20u);
    }
    dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 11));
    uint64_t v8 = (void *)*((void *)WeakRetained + 10);
    id v9 = objc_loadWeakRetained((id *)(a1 + 48));
    [v8 removeStream:v9];

    [*((id *)WeakRetained + 19) removeObject:*(void *)(a1 + 32)];
  }
}

void __88__CMContinuityCaptureRapportServer_createStreamWithIdentifier_isMediaStream_completion___block_invoke_29(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 48));
    if (v5)
    {
      uint64_t v6 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = objc_loadWeakRetained((id *)(a1 + 40));
        id v8 = objc_loadWeakRetained((id *)(a1 + 48));
        int v9 = 138543874;
        id v10 = v7;
        __int16 v11 = 2114;
        id v12 = v8;
        __int16 v13 = 2114;
        id v14 = v3;
        _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ stream %{public}@ session activate completed with error %{public}@", (uint8_t *)&v9, 0x20u);
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

void __88__CMContinuityCaptureRapportServer_createStreamWithIdentifier_isMediaStream_completion___block_invoke_31(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (CMContinityCaptureDebugLogEnabled())
  {
    id v8 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      id v14 = objc_loadWeakRetained((id *)(a1 + 40));
      int v15 = 138544130;
      id v16 = WeakRetained;
      __int16 v17 = 2114;
      id v18 = v14;
      __int16 v19 = 2114;
      id v20 = v6;
      __int16 v21 = 2114;
      id v22 = v7;
      _os_log_debug_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ StreamSession %{public}@ event %{public}@ options %{public}@", (uint8_t *)&v15, 0x2Au);
    }
  }
  id v9 = objc_loadWeakRetained((id *)(a1 + 32));
  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)(a1 + 40));
    __int16 v11 = v10;
    if (v10)
    {
      id v12 = [v10 streamID];
      [v9 enqueueResponse:v6 identifier:v12];
    }
  }
}

- (void)parseAndActOnStreamsSetupInfo:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unint64_t v4 = [v15 objectForKeyedSubscript:@"ContinuityCaptureRapportClientStreamsSetupKey"];
  if (v4)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v14 = v4;
    id obj = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v31 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v21 != v6) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v9 = objc_msgSend(v8, "objectForKeyedSubscript:", @"ContinuityCaptureRapportClientSetStreamMessageDataIdentifierKey", v14);
          id v10 = [v8 objectForKeyedSubscript:@"ContinuityCaptureRapportClientSetStreamMessageDataIsMediaTypeKey"];
          uint64_t v11 = [v10 BOOLValue];

          id v12 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t currentSessionID = self->_currentSessionID;
            *(_DWORD *)buf = 138543874;
            id v26 = self;
            __int16 v27 = 2048;
            unint64_t v28 = currentSessionID;
            __int16 v29 = 2114;
            v30 = v9;
            _os_log_impl(&dword_235FC2000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] Early setup for %{public}@", buf, 0x20u);
          }

          if (v9)
          {
            v17[0] = MEMORY[0x263EF8330];
            v17[1] = 3221225472;
            v17[2] = __66__CMContinuityCaptureRapportServer_parseAndActOnStreamsSetupInfo___block_invoke;
            v17[3] = &unk_264C996D8;
            objc_copyWeak(&v19, &location);
            id v18 = v9;
            [(CMContinuityCaptureRapportServer *)self createStreamWithIdentifier:v18 isMediaStream:v11 completion:v17];

            objc_destroyWeak(&v19);
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v31 count:16];
      }
      while (v5);
    }

    unint64_t v4 = v14;
  }

  objc_destroyWeak(&location);
}

void __66__CMContinuityCaptureRapportServer_parseAndActOnStreamsSetupInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unint64_t v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = WeakRetained;
  if (a2 && WeakRetained)
  {
    id v7 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_loadWeakRetained(v4);
      uint64_t v9 = v6[6];
      uint64_t v10 = v6[8];
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 138544386;
      id v13 = v8;
      __int16 v14 = 2048;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      uint64_t v17 = v10;
      __int16 v18 = 2114;
      uint64_t v19 = v11;
      __int16 v20 = 2112;
      uint64_t v21 = a2;
      _os_log_error_impl(&dword_235FC2000, v7, OS_LOG_TYPE_ERROR, "%{public}@ [sessionID:%llx] create stream (display session %{public}@) for %{public}@ error %@", (uint8_t *)&v12, 0x34u);
    }
  }
}

- (void)parseAndNotifySessionStartInfo:(id)a3 transportInfo:(id)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v6) {
    goto LABEL_18;
  }
  id v8 = [v6 objectForKeyedSubscript:@"ContinuityCaptureRapportClientSessionIDKey"];
  BOOL v9 = v8 == 0;

  if (!v9)
  {
    uint64_t v10 = [v6 objectForKeyedSubscript:@"ContinuityCaptureRapportClientSessionIDKey"];
    self->_unint64_t currentSessionID = [v10 unsignedLongLongValue];

    uint64_t v11 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t currentSessionID = self->_currentSessionID;
      *(_DWORD *)buf = 138543618;
      v55 = self;
      __int16 v56 = 2048;
      unint64_t v57 = currentSessionID;
      _os_log_impl(&dword_235FC2000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] connected to host", buf, 0x16u);
    }
  }
  id v13 = [v6 objectForKeyedSubscript:@"ContinuityCaptureRapportClientInActiveEntitiesForConnectionChange"];
  BOOL v14 = v13 == 0;

  if (v14)
  {
LABEL_18:
    if (v7)
    {
      uint64_t v22 = [v7 objectForKeyedSubscript:*MEMORY[0x263F62C50]];
      peerAddress = self->_peerAddress;
      self->_peerAddress = v22;

      id v24 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = self->_peerAddress;
        *(_DWORD *)buf = 138543619;
        v55 = self;
        __int16 v56 = 2113;
        unint64_t v57 = (unint64_t)v25;
        _os_log_impl(&dword_235FC2000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ peerAddress:%{private}@", buf, 0x16u);
      }

      uint64_t v26 = *MEMORY[0x263F62C28];
      __int16 v27 = [v7 objectForKeyedSubscript:*MEMORY[0x263F62C28]];
      BOOL v28 = v27 == 0;

      if (!v28)
      {
        __int16 v29 = [v7 objectForKeyedSubscript:v26];
        uint64_t v30 = [v29 unsignedIntegerValue];

        uint64_t v31 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v55 = self;
          __int16 v56 = 2048;
          unint64_t v57 = v30;
          _os_log_impl(&dword_235FC2000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ dataLinkType:%lu", buf, 0x16u);
        }

        int64_t v32 = 1;
        if ((unint64_t)(v30 - 7) < 3) {
          int64_t v32 = 2;
        }
        self->_int64_t currentTransport = v32;
        id v33 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v34 = self->_currentSessionID;
          int64_t currentTransport = self->_currentTransport;
          *(_DWORD *)buf = 138543874;
          v55 = self;
          __int16 v56 = 2048;
          unint64_t v57 = v34;
          __int16 v58 = 1024;
          int v59 = currentTransport;
          _os_log_impl(&dword_235FC2000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] connected over transport %d", buf, 0x1Cu);
        }
      }
    }
    if (v6)
    {
      id v36 = [v6 objectForKeyedSubscript:@"ContinuityCaptureRapportClientPreStartConfigurationKey"];
      BOOL v37 = v36 == 0;

      if (!v37)
      {
        v38 = (void *)MEMORY[0x263F08928];
        uint64_t v39 = objc_opt_class();
        id v40 = [v6 objectForKeyedSubscript:@"ContinuityCaptureRapportClientPreStartConfigurationKey"];
        id v48 = 0;
        v41 = [v38 unarchivedObjectOfClass:v39 fromData:v40 error:&v48];
        v42 = v48;

        if (v41)
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          if (!WeakRetained)
          {

LABEL_39:
            goto LABEL_40;
          }
          v44[0] = MEMORY[0x263EF8330];
          v44[1] = 3221225472;
          v44[2] = __81__CMContinuityCaptureRapportServer_parseAndNotifySessionStartInfo_transportInfo___block_invoke_35;
          v44[3] = &unk_264C9A770;
          objc_copyWeak(&v47, &location);
          __int16 v45 = v42;
          id v46 = v41;
          [WeakRetained startStream:v46 option:0 completion:v44];

          objc_destroyWeak(&v47);
        }
        else
        {
          id WeakRetained = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
            -[CMContinuityCaptureRapportServer parseAndNotifySessionStartInfo:transportInfo:]((uint64_t)self, (uint64_t)v42, WeakRetained);
          }
        }
      }
    }
    v42 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v55 = self;
      __int16 v56 = 2112;
      unint64_t v57 = (unint64_t)v7;
      _os_log_impl(&dword_235FC2000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ TransportInfo %@", buf, 0x16u);
    }
    goto LABEL_39;
  }
  uint64_t v15 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v16 = [v6 objectForKeyedSubscript:@"ContinuityCaptureRapportClientInActiveEntitiesForConnectionChange"];
    *(_DWORD *)buf = 138543618;
    v55 = self;
    __int16 v56 = 2114;
    unint64_t v57 = (unint64_t)v16;
    _os_log_impl(&dword_235FC2000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ inActiveEntities on connection change %{public}@", buf, 0x16u);
  }
  id v17 = objc_loadWeakRetained((id *)&self->_delegate);
  if (v17)
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    __int16 v18 = [v6 objectForKeyedSubscript:@"ContinuityCaptureRapportClientInActiveEntitiesForConnectionChange"];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v49 objects:v60 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v50 != v20) {
            objc_enumerationMutation(v18);
          }
          objc_msgSend(v17, "stopStream:option:completion:", objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * i), "integerValue"), 0, &__block_literal_global_16);
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v49 objects:v60 count:16];
      }
      while (v19);
    }

    goto LABEL_18;
  }
LABEL_40:
  objc_destroyWeak(&location);
}

void __81__CMContinuityCaptureRapportServer_parseAndNotifySessionStartInfo_transportInfo___block_invoke_35(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unint64_t v4 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      id v6 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = objc_loadWeakRetained(v4);
        uint64_t v8 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        id v14 = v7;
        __int16 v15 = 2112;
        uint64_t v16 = v8;
        __int16 v17 = 2112;
        uint64_t v18 = a2;
        _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Pre-StartStream for configuration %@ error %@", buf, 0x20u);
      }
    }
    BOOL v9 = WeakRetained[11];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __81__CMContinuityCaptureRapportServer_parseAndNotifySessionStartInfo_transportInfo___block_invoke_36;
    v10[3] = &unk_264C99120;
    objc_copyWeak(&v12, v4);
    id v11 = *(id *)(a1 + 40);
    dispatch_async(v9, v10);

    objc_destroyWeak(&v12);
  }
}

void __81__CMContinuityCaptureRapportServer_parseAndNotifySessionStartInfo_transportInfo___block_invoke_36(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained willChangeValueForKey:@"preStartConfiguration"];
    objc_storeStrong(v3 + 20, *(id *)(a1 + 32));
    [v3 didChangeValueForKey:@"preStartConfiguration"];
    id WeakRetained = v3;
  }
}

- (void)relayTerminationComplete
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    __int16 v8 = 2080;
    BOOL v9 = "-[CMContinuityCaptureRapportServer relayTerminationComplete]";
    _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__CMContinuityCaptureRapportServer_relayTerminationComplete__block_invoke;
  v5[3] = &unk_264C9A798;
  v5[4] = self;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async(queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __60__CMContinuityCaptureRapportServer_relayTerminationComplete__block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(*(void *)(a1 + 32) + 64);
  id v6 = @"ContinuityCaptureRapportClientMessageTypeKey";
  v7[0] = &unk_26E96A510;
  id v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__CMContinuityCaptureRapportServer_relayTerminationComplete__block_invoke_38;
  v4[3] = &unk_264C99260;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  [v2 sendEventID:@"ContinuityCaptureSessionEventID" event:v3 destinationID:*MEMORY[0x263F62C08] options:0 completion:v4];

  objc_destroyWeak(&v5);
}

void __60__CMContinuityCaptureRapportServer_relayTerminationComplete__block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  unint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = CMContinuityCaptureLog(2);
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v7)
      {
        id v8 = objc_loadWeakRetained(v4);
        uint64_t v9 = WeakRetained[8];
        int v14 = 138543874;
        id v15 = v8;
        __int16 v16 = 2114;
        uint64_t v17 = v9;
        __int16 v18 = 2114;
        id v19 = v3;
        uint64_t v10 = "%{public}@ terminate display session %{public}@ send message error %{public}@";
        id v11 = v6;
        uint32_t v12 = 32;
LABEL_7:
        _os_log_impl(&dword_235FC2000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);
      }
    }
    else if (v7)
    {
      id v8 = objc_loadWeakRetained(v4);
      uint64_t v13 = WeakRetained[8];
      int v14 = 138543618;
      id v15 = v8;
      __int16 v16 = 2114;
      uint64_t v17 = v13;
      uint64_t v10 = "%{public}@ terminate display session %{public}@ send message success";
      id v11 = v6;
      uint32_t v12 = 22;
      goto LABEL_7;
    }
  }
}

- (RPRemoteDisplaySession)displaySession
{
  return self->_rpDisplaySession;
}

- (void)setupRemoteDisplaySession:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  p_rpDisplaySession = &self->_rpDisplaySession;
  objc_storeStrong((id *)&self->_rpDisplaySession, a3);
  BOOL v7 = self;
  objc_sync_enter(v7);
  uint64_t v8 = [MEMORY[0x263EFF910] date];
  sessionActivationStartTime = v7->_sessionActivationStartTime;
  v7->_sessionActivationStartTime = (NSDate *)v8;

  objc_sync_exit(v7);
  uint64_t v10 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    device = v7->_device;
    uint32_t v12 = [(RPRemoteDisplaySession *)*p_rpDisplaySession destinationDevice];
    *(_DWORD *)buf = 138544130;
    uint64_t v20 = v7;
    __int16 v21 = 2080;
    uint64_t v22 = "-[CMContinuityCaptureRapportServer setupRemoteDisplaySession:]";
    __int16 v23 = 2114;
    id v24 = device;
    __int16 v25 = 2114;
    uint64_t v26 = v12;
    _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %s Device %{public}@ destinationDevice %{public}@ ", buf, 0x2Au);
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __62__CMContinuityCaptureRapportServer_setupRemoteDisplaySession___block_invoke;
  v16[3] = &unk_264C99260;
  objc_copyWeak(&v17, &location);
  [v5 setErrorHandler:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __62__CMContinuityCaptureRapportServer_setupRemoteDisplaySession___block_invoke_40;
  v14[3] = &unk_264C99660;
  objc_copyWeak(&v15, &location);
  uint64_t v13 = (void *)MEMORY[0x237DFB780](v14);
  [v5 registerEventID:@"ContinuityCaptureSessionEventID" options:0 handler:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __62__CMContinuityCaptureRapportServer_setupRemoteDisplaySession___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  unint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = objc_loadWeakRetained(v4);
      uint64_t v8 = WeakRetained[8];
      int v9 = 138543874;
      id v10 = v7;
      __int16 v11 = 2114;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      id v14 = v3;
      _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ display session %{public}@ error %{public}@", (uint8_t *)&v9, 0x20u);
    }
  }
}

void __62__CMContinuityCaptureRapportServer_setupRemoteDisplaySession___block_invoke_40(uint64_t a1, void *a2, void *a3)
{
  v66[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v49 = a3;
  if (CMContinityCaptureDebugLogEnabled())
  {
    id v6 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      *(_DWORD *)buf = 138543874;
      id v58 = WeakRetained;
      __int16 v59 = 2114;
      id v60 = v5;
      __int16 v61 = 2114;
      id v62 = v49;
      _os_log_debug_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ DisplaySession event %{public}@ options %{public}@", buf, 0x20u);
    }
  }
  id v7 = (id *)(a1 + 32);
  id v8 = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 queue];
    dispatch_assert_queue_V2(v10);

    __int16 v11 = [v5 objectForKeyedSubscript:@"ContinuityCaptureRapportClientMessageTypeKey"];
    if (v11
      && ([v5 objectForKeyedSubscript:@"ContinuityCaptureRapportClientMessageTypeKey"],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          BOOL v13 = [v12 integerValue] == 0,
          v12,
          v11,
          v13))
    {
      v42 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        id v43 = objc_loadWeakRetained(v7);
        v44 = (void *)*((void *)v9 + 8);
        *(_DWORD *)buf = 138543618;
        id v58 = v43;
        __int16 v59 = 2114;
        id v60 = v44;
        _os_log_impl(&dword_235FC2000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ display session %{public}@", buf, 0x16u);
      }
      [v9 parseAndNotifySessionStartInfo:v5 transportInfo:v49];
      [v9 parseAndActOnStreamsSetupInfo:v5];
      __int16 v45 = (void *)*((void *)v9 + 8);
      v65 = @"ContinuityCaptureRapportClientMessageTypeKey";
      v66[0] = &unk_26E96A528;
      id v46 = [NSDictionary dictionaryWithObjects:v66 forKeys:&v65 count:1];
      v55[0] = MEMORY[0x263EF8330];
      v55[1] = 3221225472;
      v55[2] = __62__CMContinuityCaptureRapportServer_setupRemoteDisplaySession___block_invoke_43;
      v55[3] = &unk_264C99260;
      objc_copyWeak(&v56, v7);
      [v45 sendEventID:@"ContinuityCaptureSessionEventID" event:v46 destinationID:*MEMORY[0x263F62C08] options:0 completion:v55];

      uint64_t v47 = *((void *)v9 + 15);
      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      v53[2] = __62__CMContinuityCaptureRapportServer_setupRemoteDisplaySession___block_invoke_44;
      v53[3] = &unk_264C99DE8;
      objc_copyWeak(&v54, v7);
      [v9 createTimeSyncClockWithPeerAddress:v47 completion:v53];
      objc_destroyWeak(&v54);
      objc_destroyWeak(&v56);
    }
    else
    {
      id v14 = [v5 objectForKeyedSubscript:@"ContinuityCaptureRapportClientMessageTypeKey"];
      if (v14)
      {
        uint64_t v15 = [v5 objectForKeyedSubscript:@"ContinuityCaptureRapportClientMessageTypeKey"];
        if ([v15 integerValue] == 2
          && ([v5 objectForKeyedSubscript:@"ContinuityCaptureRapportClientSetStreamMessageDataIdentifierKey"], (__int16 v16 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          id v17 = [v5 objectForKeyedSubscript:@"ContinuityCaptureRapportClientSetStreamMessageDataIsMediaTypeKey"];
          BOOL v18 = v17 == 0;

          if (!v18)
          {
            id v19 = [v5 objectForKeyedSubscript:@"ContinuityCaptureRapportClientSetStreamMessageDataIdentifierKey"];
            uint64_t v20 = [v5 objectForKeyedSubscript:@"ContinuityCaptureRapportClientSetStreamMessageDataIsMediaTypeKey"];
            uint64_t v21 = [v20 BOOLValue];

            v50[0] = MEMORY[0x263EF8330];
            v50[1] = 3221225472;
            v50[2] = __62__CMContinuityCaptureRapportServer_setupRemoteDisplaySession___block_invoke_46;
            v50[3] = &unk_264C996D8;
            objc_copyWeak(&v52, v7);
            id v22 = v19;
            id v51 = v22;
            [v9 createStreamWithIdentifier:v22 isMediaStream:v21 completion:v50];

            objc_destroyWeak(&v52);
            goto LABEL_31;
          }
        }
        else
        {
        }
      }
      __int16 v23 = [v5 objectForKeyedSubscript:@"ContinuityCaptureRapportClientMessageTypeKey"];
      if (v23
        && ([v5 objectForKeyedSubscript:@"ContinuityCaptureRapportClientMessageTypeKey"],
            id v24 = objc_claimAutoreleasedReturnValue(),
            BOOL v25 = [v24 integerValue] == 4,
            v24,
            v23,
            v25))
      {
        uint64_t v26 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          id v27 = objc_loadWeakRetained(v7);
          BOOL v28 = (void *)*((void *)v9 + 6);
          __int16 v29 = (void *)*((void *)v9 + 8);
          *(_DWORD *)buf = 138543874;
          id v58 = v27;
          __int16 v59 = 2048;
          id v60 = v28;
          __int16 v61 = 2114;
          id v62 = v29;
          _os_log_impl(&dword_235FC2000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx]  Terminate display session %{public}@", buf, 0x20u);
        }
        [*((id *)v9 + 9) postEvent:@"kCMContinuityCaptureEventTerminate" entity:0 data:0];
      }
      else
      {
        uint64_t v30 = [v5 objectForKeyedSubscript:@"ContinuityCaptureRapportClientMessageTypeKey"];
        if (v30)
        {
          uint64_t v31 = [v5 objectForKeyedSubscript:@"ContinuityCaptureRapportClientMessageTypeKey"];
          if ([v31 integerValue] == 3)
          {
            int64_t v32 = [v5 objectForKeyedSubscript:@"ContinuityCaptureRapportClientSetStreamMessageDataIdentifierKey"];
            BOOL v33 = v32 == 0;

            if (!v33)
            {
              unint64_t v34 = [v5 objectForKeyedSubscript:@"ContinuityCaptureRapportClientSetStreamMessageDataIdentifierKey"];
              v35 = [*((id *)v9 + 13) objectForKey:v34];

              if (v35)
              {
                id v36 = CMContinuityCaptureLog(2);
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                {
                  id v37 = objc_loadWeakRetained(v7);
                  v38 = (void *)*((void *)v9 + 6);
                  uint64_t v39 = *((void *)v9 + 8);
                  *(_DWORD *)buf = 138544130;
                  id v58 = v37;
                  __int16 v59 = 2048;
                  id v60 = v38;
                  __int16 v61 = 2114;
                  id v62 = v34;
                  __int16 v63 = 2114;
                  uint64_t v64 = v39;
                  _os_log_impl(&dword_235FC2000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] stream %{public}@ (display session %{public}@) activate complete", buf, 0x2Au);
                }
                id v40 = (void *)*((void *)v9 + 10);
                v41 = [*((id *)v9 + 13) objectForKeyedSubscript:v34];
                [v40 addStream:v41];

                [*((id *)v9 + 13) removeObjectForKey:v34];
              }
            }
          }
          else
          {
          }
        }
      }
    }
  }
LABEL_31:
}

void __62__CMContinuityCaptureRapportServer_setupRemoteDisplaySession___block_invoke_43(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  unint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = CMContinuityCaptureLog(2);
    id v7 = v6;
    if (v3)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v8 = objc_loadWeakRetained(v4);
        uint64_t v9 = WeakRetained[8];
        int v11 = 138543874;
        id v12 = v8;
        __int16 v13 = 2114;
        uint64_t v14 = v9;
        __int16 v15 = 2114;
        id v16 = v3;
        _os_log_error_impl(&dword_235FC2000, v7, OS_LOG_TYPE_ERROR, "%{public}@ display session %{public}@ send message error %{public}@", (uint8_t *)&v11, 0x20u);
LABEL_7:
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_loadWeakRetained(v4);
      uint64_t v10 = WeakRetained[8];
      int v11 = 138543618;
      id v12 = v8;
      __int16 v13 = 2114;
      uint64_t v14 = v10;
      _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ display session %{public}@ send message success", (uint8_t *)&v11, 0x16u);
      goto LABEL_7;
    }
  }
}

void __62__CMContinuityCaptureRapportServer_setupRemoteDisplaySession___block_invoke_44(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained willChangeValueForKey:@"timeSyncClock"];
    id v8 = v7;
    objc_sync_enter(v8);
    objc_storeStrong(v8 + 12, a2);
    objc_sync_exit(v8);

    [v8 didChangeValueForKey:@"timeSyncClock"];
    uint64_t v9 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = objc_loadWeakRetained(v5);
      id v11 = v8[6];
      id v12 = v8[12];
      int v13 = 138543874;
      id v14 = v10;
      __int16 v15 = 2048;
      id v16 = v11;
      __int16 v17 = 2112;
      id v18 = v12;
      _os_log_impl(&dword_235FC2000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] got timeSync clock %@", (uint8_t *)&v13, 0x20u);
    }
  }
}

void __62__CMContinuityCaptureRapportServer_setupRemoteDisplaySession___block_invoke_46(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (a2 && WeakRetained)
  {
    id v7 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_loadWeakRetained(v4);
      uint64_t v9 = v6[6];
      uint64_t v10 = v6[8];
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 138544386;
      id v13 = v8;
      __int16 v14 = 2048;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      uint64_t v17 = v10;
      __int16 v18 = 2114;
      uint64_t v19 = v11;
      __int16 v20 = 2112;
      uint64_t v21 = a2;
      _os_log_error_impl(&dword_235FC2000, v7, OS_LOG_TYPE_ERROR, "%{public}@ [sessionID:%llx] create stream (display session %{public}@) for %{public}@ error %@", (uint8_t *)&v12, 0x34u);
    }
  }
}

- (unint64_t)currentSessionID
{
  return self->_currentSessionID;
}

- (void)setCurrentSessionID:(unint64_t)a3
{
  self->_unint64_t currentSessionID = a3;
}

- (int64_t)currentTransport
{
  return self->_currentTransport;
}

- (ContinuityCaptureTransportDevice)localDevice
{
  return (ContinuityCaptureTransportDevice *)self->_device;
}

- (void)cancel
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    pendingActivateStreamsByIdentifier = self->_pendingActivateStreamsByIdentifier;
    *(_DWORD *)buf = 138543618;
    __int16 v16 = self;
    __int16 v17 = 2114;
    __int16 v18 = pendingActivateStreamsByIdentifier;
    _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ _pendingActivateStreamsByIdentifier %{public}@", buf, 0x16u);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = [(NSMutableDictionary *)self->_pendingActivateStreamsByIdentifier allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) invalidate];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(NSMutableDictionary *)self->_pendingActivateStreamsByIdentifier removeAllObjects];
  [(CMContinuityCaptureRapportServer *)self invalidateCurrentSession:0];
}

- (CMContinuityCaptureConfiguration)preStartConfiguration
{
  return (CMContinuityCaptureConfiguration *)objc_getProperty(self, a2, 160, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preStartConfiguration, 0);
  objc_storeStrong((id *)&self->_createdIdentifiers, 0);
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_sessionActivationStartTime, 0);
  objc_storeStrong((id *)&self->_peerAddress, 0);
  objc_storeStrong((id *)&self->_pendingActivateStreamsByIdentifier, 0);
  objc_storeStrong((id *)&self->_timeSyncClock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_compositeDevice, 0);
  objc_storeStrong((id *)&self->_rpDisplaySession, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)parseAndNotifySessionStartInfo:(os_log_t)log transportInfo:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_235FC2000, log, OS_LOG_TYPE_ERROR, "%{public}@ error unarchivedObjectOfClass %@", (uint8_t *)&v3, 0x16u);
}

@end