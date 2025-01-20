@interface CMContinuityCaptureCMIOVideoDevice
- (BOOL)_setDeviceProperties:(id)a3 error:(id *)a4;
- (BOOL)publishDevice:(BOOL)a3;
- (BOOL)setDeviceProperties:(id)a3 error:(id *)a4;
- (BOOL)setupStreamsWithDeviceID:(id)a3;
- (CMContinuityCaptureCMIOVideoDevice)initWithCaptureDevice:(id)a3;
- (NSArray)controls;
- (NSSet)availableProperties;
- (NSString)description;
- (id)_availableProperties;
- (id)_devicePropertiesForProperties:(id)a3 error:(id *)a4;
- (id)debugInfo;
- (id)deviceID;
- (id)devicePropertiesForProperties:(id)a3 error:(id *)a4;
- (void)_setCMIOExtensionPropertyAttributesByPropertyNames;
- (void)_updateCameraHiddenControlIfApplicable;
- (void)_updateCameraReadyToUnhideControlIfApplicable;
- (void)dispatchFrame:(opaqueCMSampleBuffer *)a3 entity:(int64_t)a4 completion:(id)a5;
- (void)forceDeviceRemoval;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)resetTransportDevice:(id)a3;
- (void)setSystemPreferredStatus:(BOOL)a3 withCompletion:(id)a4;
- (void)setValueForControl:(id)a3 completion:(id)a4;
- (void)setupControls;
- (void)terminateComplete:(id)a3;
@end

@implementation CMContinuityCaptureCMIOVideoDevice

- (CMContinuityCaptureCMIOVideoDevice)initWithCaptureDevice:(id)a3
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 compositeDelegate];
  v6 = [v5 client];
  v7 = [v6 device];

  v8 = [v7 deviceIdentifier];
  v9 = CMContinuityCaptureGetDeviceUUID(v8, [v4 entity]);

  if (!v9)
  {
    v26 = 0;
LABEL_22:
    v78 = 0;
    goto LABEL_15;
  }
  if ([v4 entity] == 2)
  {
    v10 = [v7 deviceName];
    CMContinuityCaptureCreateLocalizedString(@"DESK_VIEW_CAMERA_NAME", @"%@ Desk View Camera", v11, v12, v13, v14, v15, v16, (uint64_t)v10);
  }
  else
  {
    v17 = [v7 deviceModel];
    BOOL v18 = continuityCaptureNotificationCenter_isiPhone(v17);

    if (v18) {
      v19 = @"CAMERA_NAME_IPHONE";
    }
    else {
      v19 = @"CAMERA_NAME_IPAD";
    }
    v10 = [v7 deviceName];
    CMContinuityCaptureCreateLocalizedString(v19, @"%@ Camera", v20, v21, v22, v23, v24, v25, (uint64_t)v10);
  v26 = };

  v27 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v91 = v9;
    __int16 v92 = 2114;
    v93 = v26;
    _os_log_impl(&dword_235FC2000, v27, OS_LOG_TYPE_DEFAULT, "Publish Device UUID %{public}@ name %{public}@", buf, 0x16u);
  }

  v89.receiver = self;
  v89.super_class = (Class)CMContinuityCaptureCMIOVideoDevice;
  self = [(CMIOExtensionDevice *)&v89 initWithLocalizedName:v26 deviceID:v9 legacyDeviceID:0 source:self];
  if (!self) {
    goto LABEL_22;
  }
  v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  streams = self->_streams;
  self->_streams = v28;

  v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  cmControlByPropertyName = self->_cmControlByPropertyName;
  self->_cmControlByPropertyName = v30;

  p_captureDevice = &self->_captureDevice;
  objc_storeWeak((id *)&self->_captureDevice, v4);
  v33 = [v4 queue];
  queue = self->_queue;
  self->_queue = v33;

  v35 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v36 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.continuitycapture.systempreferredstatus", v35);
  systemPreferredStatusUpdateQueue = self->_systemPreferredStatusUpdateQueue;
  self->_systemPreferredStatusUpdateQueue = v36;

  self->_entity = [v4 entity];
  objc_storeStrong((id *)&self->_name, v26);
  objc_storeStrong((id *)&self->_deviceID, v9);
  objc_storeStrong((id *)&self->_nonLocalizedName, self->_name);
  v38 = [v7 deviceModel];
  modelID = self->_modelID;
  self->_modelID = v38;

  CMIOExtensionPropertyFromPropertyAddress();
  v40 = (NSString *)objc_claimAutoreleasedReturnValue();
  cmioDeviceConnectionState = self->_cmioDeviceConnectionState;
  self->_cmioDeviceConnectionState = v40;

  CMIOExtensionPropertyFromPropertyAddress();
  v42 = (NSString *)objc_claimAutoreleasedReturnValue();
  cmioDeviceWired = self->_cmioDeviceWired;
  self->_cmioDeviceWired = v42;

  v44 = [v9 UUIDString];
  BOOL v45 = [(CMContinuityCaptureCMIOVideoDevice *)self setupStreamsWithDeviceID:v44];

  if (!v45) {
    goto LABEL_22;
  }
  if ([(NSMutableArray *)self->_streams count] != 1)
  {
    v80 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureCMIOVideoDevice initWithCaptureDevice:]();
    }
    goto LABEL_21;
  }
  [(CMContinuityCaptureCMIOVideoDevice *)self setupControls];
  if (![(CMContinuityCaptureCMIOVideoDevice *)self publishDevice:1])
  {
    v80 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureCMIOVideoDevice initWithCaptureDevice:]();
    }
LABEL_21:

    goto LABEL_22;
  }
  v46 = [v4 compositeDelegate];
  v47 = [v46 client];
  [v47 device];
  v82 = v9;
  v49 = v48 = v7;
  v50 = [v49 magicStateMonitor];
  [v50 queue];
  v51 = v81 = v26;
  dispatch_assert_queue_not_V2(v51);

  v52 = [v4 compositeDelegate];
  v53 = [v52 client];
  v54 = [v53 device];
  v55 = [v54 magicStateMonitor];
  v56 = [v55 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__CMContinuityCaptureCMIOVideoDevice_initWithCaptureDevice___block_invoke;
  block[3] = &unk_264C99080;
  id v57 = v4;
  id v87 = v57;
  v58 = self;
  v88 = v58;
  dispatch_async_and_wait(v56, block);

  id WeakRetained = objc_loadWeakRetained((id *)p_captureDevice);
  v60 = [WeakRetained compositeDelegate];
  v61 = [v60 client];
  v62 = [v61 device];
  v63 = [v62 magicStateMonitor];
  v58->_cachedMagicState = [v63 magic];

  [(CMContinuityCaptureCMIOVideoDevice *)v58 _setCMIOExtensionPropertyAttributesByPropertyNames];
  v64 = [v57 compositeDelegate];
  v65 = [v64 client];
  v66 = [v65 device];
  v67 = [v66 magicStateMonitor];
  uint64_t v68 = [v67 magic];

  uint64_t v69 = v68;
  v7 = v48;
  v9 = v82;
  [(CMContinuityCaptureCMIOVideoDevice *)v58 setSystemPreferredStatus:v69 withCompletion:0];
  v70 = [v57 compositeDelegate];
  v71 = [v70 client];
  v72 = [v71 device];
  v58->_cachedWiredState = [v72 wired];

  v73 = +[CMContinuityCaptureDiscoverySession sharedInstance];
  v74 = [v73 queue];
  dispatch_assert_queue_not_V2(v74);

  v75 = +[CMContinuityCaptureDiscoverySession sharedInstance];
  v76 = [v75 queue];
  v83[0] = MEMORY[0x263EF8330];
  v83[1] = 3221225472;
  v83[2] = __60__CMContinuityCaptureCMIOVideoDevice_initWithCaptureDevice___block_invoke_2;
  v83[3] = &unk_264C99080;
  id v84 = v57;
  v77 = v58;
  v85 = v77;
  dispatch_async_and_wait(v76, v83);

  v26 = v81;
  self = v77;
  v78 = self;
LABEL_15:

  return v78;
}

void __60__CMContinuityCaptureCMIOVideoDevice_initWithCaptureDevice___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) compositeDelegate];
  v3 = [v2 client];
  id v4 = [v3 device];
  v5 = [v4 magicStateMonitor];
  [v5 addObserver:*(void *)(a1 + 40) forKeyPath:@"magic" options:3 context:0];

  id v9 = [*(id *)(a1 + 32) compositeDelegate];
  v6 = [v9 client];
  v7 = [v6 device];
  v8 = [v7 magicStateMonitor];
  objc_storeWeak((id *)(*(void *)(a1 + 40) + 200), v8);
}

void __60__CMContinuityCaptureCMIOVideoDevice_initWithCaptureDevice___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) compositeDelegate];
  v3 = [v2 client];
  id v4 = [v3 device];
  [v4 addObserver:*(void *)(a1 + 40) forKeyPath:@"wired" options:3 context:0];

  id v7 = [*(id *)(a1 + 32) compositeDelegate];
  v5 = [v7 client];
  v6 = [v5 device];
  objc_storeWeak((id *)(*(void *)(a1 + 40) + 208), v6);
}

- (void)forceDeviceRemoval
{
}

- (BOOL)publishDevice:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureDevice);
  v6 = [WeakRetained compositeDelegate];
  id v7 = [v6 provider];

  if (v7)
  {
    v8 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = "Unpublish";
      if (v3) {
        id v9 = "Publish";
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = self;
      __int16 v22 = 2082;
      uint64_t v23 = v9;
      _os_log_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEFAULT, " %{public}@ %{public}s", buf, 0x16u);
    }

    v10 = [v7 queue];
    dispatch_assert_queue_V2(v10);

    if (v3)
    {
      v19 = 0;
      char v11 = [v7 addDevice:self error:&v19];
      uint64_t v12 = v19;
    }
    else
    {
      BOOL v18 = 0;
      char v11 = [v7 removeDevice:self error:&v18];
      uint64_t v12 = v18;
    }
    id v14 = v12;
    if (v11)
    {
      BOOL v13 = 1;
    }
    else
    {
      uint64_t v15 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v17 = "Unpublish";
        *(_DWORD *)buf = 138543874;
        uint64_t v21 = self;
        if (v3) {
          v17 = "Publish";
        }
        __int16 v22 = 2082;
        uint64_t v23 = v17;
        __int16 v24 = 2114;
        id v25 = v14;
        _os_log_error_impl(&dword_235FC2000, v15, OS_LOG_TYPE_ERROR, "%{public}@ %{public}s error %{public}@", buf, 0x20u);
      }

      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
    id v14 = 0;
  }

  return v13;
}

- (void)resetTransportDevice:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_magicStateObserver);
  v6 = [WeakRetained queue];
  dispatch_assert_queue_not_V2(v6);

  id v7 = objc_loadWeakRetained((id *)&self->_magicStateObserver);
  v8 = [v7 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__CMContinuityCaptureCMIOVideoDevice_resetTransportDevice___block_invoke;
  block[3] = &unk_264C99148;
  void block[4] = self;
  dispatch_async_and_wait(v8, block);

  id v9 = [v4 magicStateMonitor];
  v10 = [v9 queue];
  dispatch_assert_queue_not_V2(v10);

  char v11 = [v4 magicStateMonitor];
  uint64_t v12 = [v11 queue];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __59__CMContinuityCaptureCMIOVideoDevice_resetTransportDevice___block_invoke_2;
  v28[3] = &unk_264C99080;
  id v13 = v4;
  id v29 = v13;
  v30 = self;
  dispatch_async_and_wait(v12, v28);

  id v14 = objc_loadWeakRetained(&self->_wiredObserver);
  if (v14)
  {
    uint64_t v15 = +[CMContinuityCaptureDiscoverySession sharedInstance];
    uint64_t v16 = [v15 queue];
    dispatch_assert_queue_not_V2(v16);

    v17 = +[CMContinuityCaptureDiscoverySession sharedInstance];
    BOOL v18 = [v17 queue];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __59__CMContinuityCaptureCMIOVideoDevice_resetTransportDevice___block_invoke_3;
    v27[3] = &unk_264C99148;
    v27[4] = self;
    dispatch_async_and_wait(v18, v27);
  }
  v19 = +[CMContinuityCaptureDiscoverySession sharedInstance];
  uint64_t v20 = [v19 queue];
  dispatch_assert_queue_not_V2(v20);

  uint64_t v21 = +[CMContinuityCaptureDiscoverySession sharedInstance];
  __int16 v22 = [v21 queue];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __59__CMContinuityCaptureCMIOVideoDevice_resetTransportDevice___block_invoke_4;
  v24[3] = &unk_264C99080;
  id v25 = v13;
  uint64_t v26 = self;
  id v23 = v13;
  dispatch_async_and_wait(v22, v24);
}

void __59__CMContinuityCaptureCMIOVideoDevice_resetTransportDevice___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 200));

  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 200));
    [v3 removeObserver:*(void *)(a1 + 32) forKeyPath:@"magic" context:0];

    id v4 = (id *)(*(void *)(a1 + 32) + 200);
    objc_storeWeak(v4, 0);
  }
}

void __59__CMContinuityCaptureCMIOVideoDevice_resetTransportDevice___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) magicStateMonitor];
  [v2 addObserver:*(void *)(a1 + 40) forKeyPath:@"magic" options:3 context:0];

  id v3 = [*(id *)(a1 + 32) magicStateMonitor];
  objc_storeWeak((id *)(*(void *)(a1 + 40) + 200), v3);
}

id __59__CMContinuityCaptureCMIOVideoDevice_resetTransportDevice___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 208));
  [WeakRetained removeObserver:*(void *)(a1 + 32) forKeyPath:@"wired" context:0];

  id v3 = (id *)(*(void *)(a1 + 32) + 208);
  return objc_storeWeak(v3, 0);
}

id __59__CMContinuityCaptureCMIOVideoDevice_resetTransportDevice___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) addObserver:*(void *)(a1 + 40) forKeyPath:@"wired" options:3 context:0];
  v2 = *(void **)(a1 + 32);
  id v3 = (id *)(*(void *)(a1 + 40) + 208);
  return objc_storeWeak(v3, v2);
}

- (void)terminateComplete:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    __int16 v34 = 2080;
    v35 = "-[CMContinuityCaptureCMIOVideoDevice terminateComplete:]";
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  if (self->_terminated)
  {
    v4[2](v4);
  }
  else
  {
    self->_terminated = 1;
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_captureDevice);
    if (WeakRetained)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_captureDevice);
      v8 = [v7 compositeDelegate];
      id v9 = [v8 provider];

      if (v9)
      {
        dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
        if ([(NSMutableArray *)self->_streams count])
        {
          v10 = [(NSMutableArray *)self->_streams objectAtIndexedSubscript:0];
          [v10 terminateComplete:&__block_literal_global_3];
        }
        [(NSMutableArray *)self->_streams removeAllObjects];
        char v11 = [WeakRetained compositeDelegate];
        uint64_t v12 = [v11 client];
        id v13 = [v12 device];
        id v14 = [v13 magicStateMonitor];
        uint64_t v15 = [v14 queue];
        dispatch_assert_queue_not_V2(v15);

        uint64_t v16 = [WeakRetained compositeDelegate];
        v17 = [v16 client];
        BOOL v18 = [v17 device];
        v19 = [v18 magicStateMonitor];
        uint64_t v20 = [v19 queue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __56__CMContinuityCaptureCMIOVideoDevice_terminateComplete___block_invoke_2;
        block[3] = &unk_264C99080;
        id v31 = WeakRetained;
        v32 = self;
        dispatch_async_and_wait(v20, block);

        uint64_t v21 = +[CMContinuityCaptureDiscoverySession sharedInstance];
        __int16 v22 = [v21 queue];
        dispatch_assert_queue_not_V2(v22);

        id v23 = +[CMContinuityCaptureDiscoverySession sharedInstance];
        __int16 v24 = [v23 queue];
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __56__CMContinuityCaptureCMIOVideoDevice_terminateComplete___block_invoke_3;
        v29[3] = &unk_264C99148;
        v29[4] = self;
        dispatch_async_and_wait(v24, v29);

        id v25 = [v9 queue];
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __56__CMContinuityCaptureCMIOVideoDevice_terminateComplete___block_invoke_4;
        v26[3] = &unk_264C99700;
        objc_copyWeak(&v28, (id *)buf);
        v27 = v4;
        dispatch_async(v25, v26);

        objc_destroyWeak(&v28);
      }
    }
    objc_destroyWeak((id *)buf);
  }
}

id __56__CMContinuityCaptureCMIOVideoDevice_terminateComplete___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) compositeDelegate];
  id v3 = [v2 client];
  id v4 = [v3 device];
  v5 = [v4 magicStateMonitor];
  [v5 removeObserver:*(void *)(a1 + 40) forKeyPath:@"magic" context:0];

  v6 = (id *)(*(void *)(a1 + 40) + 200);
  return objc_storeWeak(v6, 0);
}

id __56__CMContinuityCaptureCMIOVideoDevice_terminateComplete___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 208));
  [WeakRetained removeObserver:*(void *)(a1 + 32) forKeyPath:@"wired" context:0];

  id v3 = (id *)(*(void *)(a1 + 32) + 208);
  return objc_storeWeak(v3, 0);
}

void __56__CMContinuityCaptureCMIOVideoDevice_terminateComplete___block_invoke_4(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __56__CMContinuityCaptureCMIOVideoDevice_terminateComplete___block_invoke_5;
    v4[3] = &unk_264C99700;
    objc_copyWeak(&v6, v2);
    id v5 = *(id *)(a1 + 32);
    [WeakRetained setSystemPreferredStatus:0 withCompletion:v4];

    objc_destroyWeak(&v6);
  }
}

void __56__CMContinuityCaptureCMIOVideoDevice_terminateComplete___block_invoke_5(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(WeakRetained + 16);
    id v6 = v5;
    if (v5)
    {
      id v7 = [v5 compositeDelegate];
      v8 = [v7 provider];

      if (v8)
      {
        id v9 = [v8 queue];
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __56__CMContinuityCaptureCMIOVideoDevice_terminateComplete___block_invoke_6;
        v10[3] = &unk_264C99700;
        objc_copyWeak(&v12, v2);
        id v11 = *(id *)(a1 + 32);
        dispatch_async(v9, v10);

        objc_destroyWeak(&v12);
      }
    }
  }
}

void __56__CMContinuityCaptureCMIOVideoDevice_terminateComplete___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained publishDevice:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = self;
    __int16 v37 = 2114;
    id v38 = v9;
    __int16 v39 = 2114;
    id v40 = v10;
    _os_log_impl(&dword_235FC2000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ keypath:%{public}@ object:%{public}@", buf, 0x20u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  if ([v9 isEqualToString:@"magic"])
  {
    id v13 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    uint64_t v14 = [v13 integerValue];
    uint64_t v15 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
    LOBYTE(v14) = v14 == [v15 integerValue];

    if ((v14 & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_captureDevice);
      id v25 = [WeakRetained compositeDelegate];
      uint64_t v26 = [v25 client];
      v27 = [v26 device];
      id v28 = [v27 magicStateMonitor];
      uint64_t v29 = [v28 magic];

      [(CMContinuityCaptureCMIOVideoDevice *)self setSystemPreferredStatus:v29 withCompletion:0];
      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __85__CMContinuityCaptureCMIOVideoDevice_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_264C99728;
      __int16 v22 = &v34;
      objc_copyWeak(&v34, (id *)buf);
      char v35 = v29;
      void block[4] = self;
      id v23 = block;
      goto LABEL_8;
    }
  }
  if ([v9 isEqualToString:@"wired"])
  {
    id v16 = objc_loadWeakRetained((id *)&self->_captureDevice);
    v17 = [v16 compositeDelegate];
    BOOL v18 = [v17 client];
    v19 = [v18 device];
    char v20 = [v19 wired];

    queue = self->_queue;
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __85__CMContinuityCaptureCMIOVideoDevice_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
    v30[3] = &unk_264C99728;
    __int16 v22 = &v31;
    objc_copyWeak(&v31, (id *)buf);
    char v32 = v20;
    v30[4] = self;
    id v23 = v30;
LABEL_8:
    dispatch_async(queue, v23);
    objc_destroyWeak(v22);
  }
  objc_destroyWeak((id *)buf);
}

void __85__CMContinuityCaptureCMIOVideoDevice_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    int v4 = *(unsigned __int8 *)(a1 + 48);
    if (*((unsigned __int8 *)WeakRetained + 193) != v4)
    {
      *((unsigned char *)WeakRetained + 193) = v4;
      id v5 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:a1 + 48 length:1];
      id v6 = (void *)MEMORY[0x263F016E0];
      id v7 = [MEMORY[0x263F016D8] readOnlyPropertyAttribute];
      v8 = [v6 propertyStateWithValue:v5 attributes:v7];

      if (v8 && v3[18])
      {
        id v9 = *(void **)(a1 + 32);
        uint64_t v11 = v3[18];
        v12[0] = v8;
        id v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
        [v9 notifyPropertiesChanged:v10];
      }
    }
  }
}

void __85__CMContinuityCaptureCMIOVideoDevice_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  v12[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    int v4 = *(unsigned __int8 *)(a1 + 48);
    if (*((unsigned __int8 *)WeakRetained + 194) != v4)
    {
      *((unsigned char *)WeakRetained + 194) = v4;
      id v5 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:a1 + 48 length:1];
      id v6 = (void *)MEMORY[0x263F016E0];
      id v7 = [MEMORY[0x263F016D8] readOnlyPropertyAttribute];
      v8 = [v6 propertyStateWithValue:v5 attributes:v7];

      if (v8 && v3[19])
      {
        id v9 = *(void **)(a1 + 32);
        uint64_t v11 = v3[19];
        v12[0] = v8;
        id v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
        [v9 notifyPropertiesChanged:v10];
      }
    }
  }
}

- (void)setSystemPreferredStatus:(BOOL)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (id)deviceID
{
  return self->_deviceID;
}

- (BOOL)setupStreamsWithDeviceID:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureDevice);
  id v6 = WeakRetained;
  if (!WeakRetained
    || ([WeakRetained capabilities],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    BOOL v16 = 0;
    goto LABEL_14;
  }
  v8 = [v6 capabilities];
  id v9 = [v8 manualFramingSupportedStreamFormats];
  uint64_t v10 = [v9 count];

  uint64_t v11 = [v6 capabilities];
  id v12 = v11;
  if (v10)
  {
    id v13 = [v11 manualFramingSupportedStreamFormats];

    uint64_t v14 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = self;
      uint64_t v15 = "%{public}@ setup using manual framing stream formats";
LABEL_9:
      _os_log_impl(&dword_235FC2000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
    }
  }
  else
  {
    id v13 = [v11 streamFormats];

    uint64_t v14 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = self;
      uint64_t v15 = "%{public}@ setup using non-manual framing stream formats";
      goto LABEL_9;
    }
  }

  v17 = [[CMContinuityCaptureVideoStream alloc] initWithDevice:v6 streamFormats:v13 deviceID:v4 queue:self->_queue];
  if (v17)
  {
    p_super = &v17->super.super;
    id v23 = 0;
    BOOL v19 = [(CMIOExtensionDevice *)self addStream:v17 error:&v23];
    id v20 = v23;
    if (v19)
    {
      [(NSMutableArray *)self->_streams addObject:p_super];

      BOOL v16 = 1;
    }
    else
    {
      __int16 v22 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[CMContinuityCaptureCMIOVideoDevice setupStreamsWithDeviceID:]();
      }

      BOOL v16 = 0;
    }
  }
  else
  {
    p_super = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureCMIOVideoDevice setupStreamsWithDeviceID:]();
    }
    BOOL v16 = 0;
    id v20 = v13;
  }

LABEL_14:
  return v16;
}

- (void)setupControls
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235FC2000, v0, v1, "%{public}@ Invalid system controls ", v2, v3, v4, v5, v6);
}

- (void)dispatchFrame:(opaqueCMSampleBuffer *)a3 entity:(int64_t)a4 completion:(id)a5
{
  id v7 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NSMutableArray *)self->_streams count])
  {
    v8 = +[CMContinuityCaptureUserOnboarding sharedInstance];
    int v9 = [v8 logTryItNowAnalytics];

    if (v9)
    {
      CMSetAttachment(a3, @"com.apple.cmio.buffer_attachment.continuity_capture_try_it_now_active", MEMORY[0x263EFFA88], 1u);
      uint64_t v10 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "Setting kCMIOSampleBufferAttachmentKey_ContinuityCaptureTryItNowActive attachment complete", v13, 2u);
      }

      uint64_t v11 = +[CMContinuityCaptureUserOnboarding sharedInstance];
      [v11 setLogTryItNowAnalytics:0];
    }
    id v12 = [(NSMutableArray *)self->_streams objectAtIndexedSubscript:0];
    [v12 dispatchFrame:a3 entity:self->_entity completion:v7];
  }
}

- (void)setValueForControl:(id)a3 completion:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v35 = a3;
  id v33 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v34 = self;
  uint8_t v6 = [(NSMutableDictionary *)self->_cmControlByPropertyName allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v50 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v37;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v37 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void **)(*((void *)&v36 + 1) + 8 * v10);
      id v12 = [(NSMutableDictionary *)v34->_cmControlByPropertyName objectForKeyedSubscript:v11];
      id v13 = [v12 name];
      uint64_t v14 = [v35 name];
      char v15 = [v13 isEqualToString:v14];

      if (v15) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v36 objects:v50 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    v17 = [(NSMutableDictionary *)v34->_cmControlByPropertyName objectForKeyedSubscript:v11];
    id v16 = v11;

    if (!v17) {
      goto LABEL_19;
    }
    BOOL v18 = [v35 value];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v20 = 0;
    if (v16)
    {
      uint64_t v21 = v33;
      if ((isKindOfClass & 1) == 0) {
        goto LABEL_26;
      }
      if (([v16 containsString:@"btst"] & 1) == 0)
      {
        __int16 v22 = [v17 value];
        id v23 = [v35 value];
        char v24 = [v22 isEqualToNumber:v23];

        if (v24)
        {
          id v20 = 0;
          goto LABEL_26;
        }
      }
      id v25 = [v35 value];
      [v17 setValue:v25];

      uint64_t v26 = (void *)MEMORY[0x263F016E0];
      v27 = [v35 value];
      id v20 = [v26 propertyStateWithValue:v27 attributes:0];

      if (v20)
      {
        id v48 = v16;
        v49 = v20;
        id v28 = [NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
        [(CMIOExtensionDevice *)v34 notifyPropertiesChanged:v28];
      }
      uint64_t v29 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = [v35 name];
        *(_DWORD *)buf = 138544130;
        uint64_t v41 = v34;
        __int16 v42 = 2112;
        id v43 = v17;
        __int16 v44 = 2112;
        BOOL v45 = v30;
        __int16 v46 = 2114;
        v47 = v20;
        _os_log_impl(&dword_235FC2000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ update property %@ [%@] with state %{public}@", buf, 0x2Au);
      }
      goto LABEL_23;
    }
LABEL_25:
    uint64_t v21 = v33;
    goto LABEL_26;
  }
LABEL_9:

  id v16 = 0;
LABEL_19:
  if (![(NSMutableArray *)v34->_streams count])
  {
    v17 = 0;
    id v20 = 0;
    goto LABEL_25;
  }
  id v31 = CMContinuityCaptureLog(2);
  uint64_t v21 = v33;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    char v32 = [v35 value];
    *(_DWORD *)buf = 138543874;
    uint64_t v41 = v34;
    __int16 v42 = 2114;
    id v43 = v35;
    __int16 v44 = 2112;
    BOOL v45 = v32;
    _os_log_impl(&dword_235FC2000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ to stream with value %@", buf, 0x20u);
  }
  uint64_t v29 = [(NSMutableArray *)v34->_streams objectAtIndexedSubscript:0];
  [v29 setValueForControl:v35 completion:v33];
  v17 = 0;
  id v20 = 0;
LABEL_23:

LABEL_26:
}

- (NSArray)controls
{
  return (NSArray *)[(NSMutableDictionary *)self->_cmControlByPropertyName allValues];
}

- (NSSet)availableProperties
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__3;
  uint64_t v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__CMContinuityCaptureCMIOVideoDevice_availableProperties__block_invoke;
  v6[3] = &unk_264C994B0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(queue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

uint64_t __57__CMContinuityCaptureCMIOVideoDevice_availableProperties__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _availableProperties];
  return MEMORY[0x270F9A758]();
}

- (id)_availableProperties
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  [v3 addObject:*MEMORY[0x263F01690]];
  [v3 addObject:*MEMORY[0x263F01698]];
  [v3 addObject:*MEMORY[0x263F016A0]];
  if (self->_entity == 1) {
    [v3 addObject:@"CMIOExtensionPropertyDeviceCompanionDeskcamDeviceUUID"];
  }
  [v3 addObject:self->_cmioDeviceConnectionState];
  [v3 addObject:self->_cmioDeviceWired];
  [v3 addObject:@"CMIOExtensionPropertyRapportDeviceUniqueID"];
  [v3 addObject:@"DockedTrackingActive"];
  if ([(NSMutableDictionary *)self->_cmControlByPropertyName count])
  {
    id v4 = [(NSMutableDictionary *)self->_cmControlByPropertyName allKeys];
    [v3 addObjectsFromArray:v4];
  }
  return v3;
}

- (id)devicePropertiesForProperties:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  __int16 v22 = &v21;
  uint64_t v23 = 0x3032000000;
  char v24 = __Block_byref_object_copy__3;
  id v25 = __Block_byref_object_dispose__3;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  BOOL v18 = __Block_byref_object_copy__3;
  BOOL v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__CMContinuityCaptureCMIOVideoDevice_devicePropertiesForProperties_error___block_invoke;
  v11[3] = &unk_264C996B0;
  id v13 = &v21;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  uint64_t v14 = &v15;
  dispatch_async_and_wait(queue, v11);

  if (a4) {
    *a4 = (id) v16[5];
  }
  id v9 = (id)v22[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v9;
}

void __74__CMContinuityCaptureCMIOVideoDevice_devicePropertiesForProperties_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 _devicePropertiesForProperties:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)_devicePropertiesForProperties:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureDevice);
  if (WeakRetained)
  {
    uint64_t v85 = 0;
    v86 = &v85;
    uint64_t v87 = 0x3032000000;
    v88 = __Block_byref_object_copy__3;
    objc_super v89 = __Block_byref_object_dispose__3;
    id v90 = (id)0xAAAAAAAAAAAAAAAALL;
    id v90 = [MEMORY[0x263F016D0] devicePropertiesWithDictionary:MEMORY[0x263EFFA78]];
    uint64_t v79 = 0;
    v80 = &v79;
    uint64_t v81 = 0x3032000000;
    v82 = __Block_byref_object_copy__3;
    v83 = __Block_byref_object_dispose__3;
    id v84 = 0;
    v77[0] = 0;
    v77[1] = v77;
    v77[2] = 0x3032000000;
    v77[3] = __Block_byref_object_copy__3;
    v77[4] = __Block_byref_object_dispose__3;
    id v78 = 0;
    uint64_t v7 = [WeakRetained compositeDelegate];
    id v8 = v7;
    if (!v7) {
      goto LABEL_42;
    }
    id v9 = [v7 client];
    uint64_t v10 = [v9 device];
    uint64_t v11 = [v10 magicStateMonitor];
    char v12 = [v11 magic];

    char v76 = v12;
    id v13 = [v8 client];
    uint64_t v14 = [v13 device];
    char v15 = [v14 wired];

    char v75 = v15;
    if (!v5) {
      goto LABEL_42;
    }
    if (v86[5])
    {
      dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
      if ([v5 containsObject:*MEMORY[0x263F01690]]) {
        [(id)v86[5] setModel:self->_modelID];
      }
      if ([v5 containsObject:self->_cmioDeviceConnectionState])
      {
        id v16 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&v76 length:1];
        uint64_t v17 = (void *)MEMORY[0x263F016E0];
        BOOL v18 = [MEMORY[0x263F016D8] readOnlyPropertyAttribute];
        uint64_t v19 = [v17 propertyStateWithValue:v16 attributes:v18];
        id v20 = (void *)v80[5];
        v80[5] = v19;

        uint64_t v21 = v80[5];
        if (v21) {
          [(id)v86[5] setPropertyState:v21 forProperty:self->_cmioDeviceConnectionState];
        }
      }
      if ([v5 containsObject:self->_cmioDeviceWired])
      {
        __int16 v22 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&v75 length:1];
        uint64_t v23 = (void *)MEMORY[0x263F016E0];
        char v24 = [MEMORY[0x263F016D8] readOnlyPropertyAttribute];
        uint64_t v25 = [v23 propertyStateWithValue:v22 attributes:v24];
        id v26 = (void *)v80[5];
        v80[5] = v25;

        uint64_t v27 = v80[5];
        if (v27) {
          [(id)v86[5] setPropertyState:v27 forProperty:self->_cmioDeviceWired];
        }
      }
      uint64_t v28 = *MEMORY[0x263F01698];
      if ([v5 containsObject:*MEMORY[0x263F01698]])
      {
        uint64_t v29 = (void *)MEMORY[0x263F016E0];
        nonLocalizedName = self->_nonLocalizedName;
        id v31 = [MEMORY[0x263F016D8] readOnlyPropertyAttribute];
        uint64_t v32 = [v29 propertyStateWithValue:nonLocalizedName attributes:v31];
        id v33 = (void *)v80[5];
        v80[5] = v32;

        uint64_t v34 = v80[5];
        if (v34) {
          [(id)v86[5] setPropertyState:v34 forProperty:v28];
        }
      }
      uint64_t v35 = *MEMORY[0x263F016A0];
      if ([v5 containsObject:*MEMORY[0x263F016A0]])
      {
        long long v36 = (void *)MEMORY[0x263F016E0];
        long long v37 = NSNumber;
        uint64_t v38 = [WeakRetained entity] == 2 ? 1 : 2;
        long long v39 = [v37 numberWithInteger:v38];
        id v40 = [MEMORY[0x263F016D8] readOnlyPropertyAttribute];
        uint64_t v41 = [v36 propertyStateWithValue:v39 attributes:v40];
        __int16 v42 = (void *)v80[5];
        v80[5] = v41;

        uint64_t v43 = v80[5];
        if (v43) {
          [(id)v86[5] setPropertyState:v43 forProperty:v35];
        }
      }
      if ([v5 containsObject:@"CMIOExtensionPropertyDeviceCompanionDeskcamDeviceUUID"])
      {
        __int16 v44 = [WeakRetained transportDevice];
        BOOL v45 = [v44 deviceIdentifier];
        __int16 v46 = CMContinuityCaptureGetDeviceUUID(v45, 2);

        if (v46)
        {
          v47 = (void *)MEMORY[0x263F016E0];
          id v48 = [v46 UUIDString];
          v49 = [MEMORY[0x263F016D8] readOnlyPropertyAttribute];
          uint64_t v50 = [v47 propertyStateWithValue:v48 attributes:v49];
          uint64_t v51 = (void *)v80[5];
          v80[5] = v50;

          uint64_t v52 = v80[5];
          if (v52) {
            [(id)v86[5] setPropertyState:v52 forProperty:@"CMIOExtensionPropertyDeviceCompanionDeskcamDeviceUUID"];
          }
        }
      }
      if ([v5 containsObject:@"CMIOExtensionPropertyContinuityCaptureDeviceState"])
      {
        v53 = [WeakRetained stateMachineCurrentState];

        if (v53)
        {
          v54 = (void *)MEMORY[0x263F016E0];
          v55 = [WeakRetained stateMachineCurrentState];
          v56 = [v55 name];
          id v57 = [MEMORY[0x263F016D8] readOnlyPropertyAttribute];
          uint64_t v58 = [v54 propertyStateWithValue:v56 attributes:v57];
          v59 = (void *)v80[5];
          v80[5] = v58;

          uint64_t v60 = v80[5];
          if (v60) {
            [(id)v86[5] setPropertyState:v60 forProperty:@"CMIOExtensionPropertyContinuityCaptureDeviceState"];
          }
        }
      }
      if ([v5 containsObject:@"CMIOExtensionPropertyContinuityCaptureDeviceStateEvent"])
      {
        uint64_t v61 = [MEMORY[0x263F016E0] propertyStateWithValue:@"NA" attributes:0];
        v62 = (void *)v80[5];
        v80[5] = v61;

        uint64_t v63 = v80[5];
        if (v63) {
          [(id)v86[5] setPropertyState:v63 forProperty:@"CMIOExtensionPropertyContinuityCaptureDeviceStateEvent"];
        }
      }
      if ([v5 containsObject:@"CMIOExtensionPropertyRapportDeviceUniqueID"])
      {
        v64 = [WeakRetained transportDevice];
        v65 = [v64 deviceIdentifier];
        v66 = [v65 UUIDString];

        if (v66)
        {
          v67 = (void *)MEMORY[0x263F016E0];
          uint64_t v68 = [MEMORY[0x263F016D8] readOnlyPropertyAttribute];
          uint64_t v69 = [v67 propertyStateWithValue:v66 attributes:v68];
          v70 = (void *)v80[5];
          v80[5] = v69;

          uint64_t v71 = v80[5];
          if (v71) {
            [(id)v86[5] setPropertyState:v71 forProperty:@"CMIOExtensionPropertyRapportDeviceUniqueID"];
          }
        }
      }
      v74[0] = MEMORY[0x263EF8330];
      v74[1] = 3221225472;
      v74[2] = __75__CMContinuityCaptureCMIOVideoDevice__devicePropertiesForProperties_error___block_invoke;
      v74[3] = &unk_264C99750;
      v74[4] = self;
      v74[5] = v77;
      v74[6] = &v79;
      v74[7] = &v85;
      [v5 enumerateObjectsUsingBlock:v74];
      id v72 = (id)v86[5];
    }
    else
    {
LABEL_42:
      id v72 = 0;
    }

    _Block_object_dispose(v77, 8);
    _Block_object_dispose(&v79, 8);

    _Block_object_dispose(&v85, 8);
  }
  else
  {
    id v72 = 0;
  }

  return v72;
}

void __75__CMContinuityCaptureCMIOVideoDevice__devicePropertiesForProperties_error___block_invoke(void *a1, void *a2)
{
  id v18 = a2;
  uint64_t v3 = objc_msgSend(*(id *)(a1[4] + 176), "objectForKeyedSubscript:");
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = *(void **)(*(void *)(a1[5] + 8) + 40);
  if (v6)
  {
    uint64_t v7 = [v6 value];
    if (v7)
    {
      id v8 = (void *)v7;
      id v9 = [*(id *)(*(void *)(a1[5] + 8) + 40) value];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v11 = (void *)MEMORY[0x263F016E0];
        char v12 = [*(id *)(*(void *)(a1[5] + 8) + 40) value];
        id v13 = [*(id *)(a1[4] + 216) objectForKeyedSubscript:v18];
        uint64_t v14 = [v11 propertyStateWithValue:v12 attributes:v13];
        uint64_t v15 = *(void *)(a1[6] + 8);
        id v16 = *(void **)(v15 + 40);
        *(void *)(v15 + 40) = v14;

        uint64_t v17 = *(void *)(*(void *)(a1[6] + 8) + 40);
        if (v17) {
          [*(id *)(*(void *)(a1[7] + 8) + 40) setPropertyState:v17 forProperty:v18];
        }
      }
    }
  }
}

- (void)_setCMIOExtensionPropertyAttributesByPropertyNames
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = *MEMORY[0x263F01688];
  uint64_t v3 = [MEMORY[0x263F016D8] readOnlyPropertyAttribute];
  v7[0] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  cmioExtensionPropertyAttributesByCMIOExtensionPropertyName = self->_cmioExtensionPropertyAttributesByCMIOExtensionPropertyName;
  self->_cmioExtensionPropertyAttributesByCMIOExtensionPropertyName = v4;
}

- (BOOL)setDeviceProperties:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  __int16 v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__3;
  uint64_t v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__CMContinuityCaptureCMIOVideoDevice_setDeviceProperties_error___block_invoke;
  v11[3] = &unk_264C996B0;
  id v13 = &v21;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  uint64_t v14 = &v15;
  dispatch_async_and_wait(queue, v11);

  if (a4) {
    *a4 = (id) v16[5];
  }
  char v9 = *((unsigned char *)v22 + 24);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v9;
}

void __64__CMContinuityCaptureCMIOVideoDevice_setDeviceProperties_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = [v2 _setDeviceProperties:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5;
}

- (BOOL)_setDeviceProperties:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  if (!a3) {
    return a3 != 0;
  }
  queue = self->_queue;
  id v7 = a3;
  dispatch_assert_queue_V2(queue);
  id v8 = [v7 propertiesDictionary];

  char v9 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v38 = 138543618;
    long long v39 = self;
    __int16 v40 = 2114;
    uint64_t v41 = v8;
    _os_log_impl(&dword_235FC2000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ propertyDict %{public}@", (uint8_t *)&v38, 0x16u);
  }

  uint64_t v10 = [(NSMutableDictionary *)self->_cmControlByPropertyName objectForKeyedSubscript:@"CMIOExtensionPropertyDeviceHidden"];
  uint64_t v11 = [v8 objectForKeyedSubscript:@"CMIOExtensionPropertyDeviceHidden"];
  id v12 = (void *)v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    uint64_t v14 = [v10 value];
    uint64_t v15 = [v12 value];
    if ([v15 BOOLValue])
    {
      id WeakRetained = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [v10 name];
        int v38 = 138543618;
        long long v39 = self;
        __int16 v40 = 2112;
        uint64_t v41 = v17;
        _os_log_impl(&dword_235FC2000, WeakRetained, OS_LOG_TYPE_DEFAULT, "%{public}@ Skip updating %@ to YES", (uint8_t *)&v38, 0x16u);
      }
    }
    else
    {
      if ([v14 isEqualToNumber:v15])
      {
LABEL_16:

        goto LABEL_17;
      }
      id v18 = [v12 value];
      [v10 setValue:v18];

      uint64_t v19 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = [v10 name];
        uint64_t v21 = [v10 value];
        int v38 = 138543874;
        long long v39 = self;
        __int16 v40 = 2112;
        uint64_t v41 = v20;
        __int16 v42 = 2112;
        uint64_t v43 = v21;
        _os_log_impl(&dword_235FC2000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Updated %@ to %@", (uint8_t *)&v38, 0x20u);
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_captureDevice);
      __int16 v22 = [WeakRetained compositeDelegate];
      id v23 = objc_loadWeakRetained((id *)&self->_captureDevice);
      [v22 device:v23 updatedValueForControl:v10];
    }
    goto LABEL_16;
  }
LABEL_17:
  char v24 = [v8 objectForKeyedSubscript:@"CMIOExtensionPropertyContinuityCaptureDeviceStateEvent"];

  if (v24)
  {
    uint64_t v25 = [v24 value];
    if (v25)
    {
      id v26 = (void *)v25;
      uint64_t v27 = [v24 value];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v29 = [v24 value];
        v30 = CMContinuityCaptureRemoteEventToBeRelayedList();
        int v31 = [v30 containsObject:v29];
        p_captureDevice = &self->_captureDevice;
        id v33 = objc_loadWeakRetained((id *)&self->_captureDevice);
        uint64_t v34 = v33;
        if (v31) {
          [v33 transportDevice];
        }
        else {
        uint64_t v35 = [v33 compositeDelegate];
        }
        id v36 = objc_loadWeakRetained((id *)p_captureDevice);
        objc_msgSend(v35, "postEvent:entity:data:", v29, objc_msgSend(v36, "entity"), 0);
      }
    }
  }

  return a3 != 0;
}

- (NSString)description
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureDevice);
  uint64_t v3 = [WeakRetained description];

  return (NSString *)v3;
}

- (id)debugInfo
{
  return 0;
}

- (void)_updateCameraHiddenControlIfApplicable
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = [(NSMutableDictionary *)self->_cmControlByPropertyName objectForKeyedSubscript:@"CMIOExtensionPropertyDeviceHidden"];
  uint64_t v4 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v19 = self;
    __int16 v20 = 2080;
    uint64_t v21 = "-[CMContinuityCaptureCMIOVideoDevice _updateCameraHiddenControlIfApplicable]";
    __int16 v22 = 2112;
    id v23 = v3;
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s. cameraHiddenControl:%@", buf, 0x20u);
  }

  if (v3)
  {
    char v5 = [v3 value];
    int v6 = [v5 BOOLValue];

    if (v6)
    {
      id v7 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v19 = self;
        __int16 v20 = 2112;
        uint64_t v21 = (const char *)v3;
        _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Updated %@ value to NO.", buf, 0x16u);
      }

      [v3 setValue:MEMORY[0x263EFFA80]];
      id v8 = (void *)MEMORY[0x263F016E0];
      char v9 = [v3 value];
      uint64_t v10 = [v8 propertyStateWithValue:v9 attributes:0];

      if (v10)
      {
        id v16 = @"CMIOExtensionPropertyDeviceHidden";
        uint64_t v17 = v10;
        uint64_t v11 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
        [(CMIOExtensionDevice *)self notifyPropertiesChanged:v11];
      }
      p_captureDevice = &self->_captureDevice;
      id WeakRetained = objc_loadWeakRetained((id *)p_captureDevice);
      uint64_t v14 = [WeakRetained compositeDelegate];
      id v15 = objc_loadWeakRetained((id *)p_captureDevice);
      [v14 device:v15 updatedValueForControl:v3];
    }
  }
}

- (void)_updateCameraReadyToUnhideControlIfApplicable
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = [(NSMutableDictionary *)self->_cmControlByPropertyName objectForKeyedSubscript:@"CMIOExtensionPropertyDeviceReadyToUnhide"];
  uint64_t v4 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v19 = self;
    __int16 v20 = 2080;
    uint64_t v21 = "-[CMContinuityCaptureCMIOVideoDevice _updateCameraReadyToUnhideControlIfApplicable]";
    __int16 v22 = 2112;
    id v23 = v3;
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s. cameraReadyToUnhideControl:%@", buf, 0x20u);
  }

  if (v3)
  {
    char v5 = [v3 value];
    char v6 = [v5 BOOLValue];

    if ((v6 & 1) == 0)
    {
      id v7 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v19 = self;
        __int16 v20 = 2112;
        uint64_t v21 = (const char *)v3;
        _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Updated %@ value to YES.", buf, 0x16u);
      }

      [v3 setValue:MEMORY[0x263EFFA88]];
      id v8 = (void *)MEMORY[0x263F016E0];
      char v9 = [v3 value];
      uint64_t v10 = [v8 propertyStateWithValue:v9 attributes:0];

      if (v10)
      {
        id v16 = @"CMIOExtensionPropertyDeviceReadyToUnhide";
        uint64_t v17 = v10;
        uint64_t v11 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
        [(CMIOExtensionDevice *)self notifyPropertiesChanged:v11];
      }
      p_captureDevice = &self->_captureDevice;
      id WeakRetained = objc_loadWeakRetained((id *)p_captureDevice);
      uint64_t v14 = [WeakRetained compositeDelegate];
      id v15 = objc_loadWeakRetained((id *)p_captureDevice);
      [v14 device:v15 updatedValueForControl:v3];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cmioExtensionPropertyAttributesByCMIOExtensionPropertyName, 0);
  objc_destroyWeak(&self->_wiredObserver);
  objc_destroyWeak((id *)&self->_magicStateObserver);
  objc_storeStrong((id *)&self->_systemPreferredStatusUpdateQueue, 0);
  objc_storeStrong((id *)&self->_cmControlByPropertyName, 0);
  objc_storeStrong((id *)&self->_streams, 0);
  objc_storeStrong((id *)&self->_cmioDeviceWired, 0);
  objc_storeStrong((id *)&self->_cmioDeviceConnectionState, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_captureDevice);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_nonLocalizedName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)initWithCaptureDevice:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235FC2000, v0, v1, "%{public}@ Unable to publish", v2, v3, v4, v5, v6);
}

- (void)initWithCaptureDevice:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235FC2000, v0, v1, "%{public}@ Invalid streams", v2, v3, v4, v5, v6);
}

- (void)setupStreamsWithDeviceID:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235FC2000, v0, v1, "%{public}@ Failed to create stream", v2, v3, v4, v5, v6);
}

- (void)setupStreamsWithDeviceID:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_235FC2000, v0, v1, "%{public}@ Failed to Add stream error %@");
}

@end