@interface MDMLostDeviceLocationManager
- (BOOL)_updateLostModeFileForOriginator:(id)a3;
- (CLLocationManager)locationManager;
- (MDMLostDeviceLocationManager)init;
- (NSString)lastLocationRequestedDateMessage;
- (NSString)originator;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timeoutTimerDispatchSource;
- (id)completionBlock;
- (void)_cleanupAfterResponseFromLocationManagerOrTimeout;
- (void)clearLastLocationRequestedDate;
- (void)getCurrentLocationForOriginator:(id)a3 completion:(id)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)setCompletionBlock:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setOriginator:(id)a3;
- (void)setTimeoutTimerDispatchSource:(id)a3;
@end

@implementation MDMLostDeviceLocationManager

- (MDMLostDeviceLocationManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)MDMLostDeviceLocationManager;
  v2 = [(MDMLostDeviceLocationManager *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v5 = dispatch_queue_create((const char *)[@"MDMDLDLMServiceQueue" UTF8String], v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)getCurrentLocationForOriginator:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(MDMLostDeviceLocationManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__MDMLostDeviceLocationManager_getCurrentLocationForOriginator_completion___block_invoke;
  block[3] = &unk_264B9D5B8;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __75__MDMLostDeviceLocationManager_getCurrentLocationForOriginator_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) completionBlock];

  if (v2)
  {
    id v22 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F38AD0] code:7000 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) setCompletionBlock:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) setOriginator:*(void *)(a1 + 40)];
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = (void *)[MEMORY[0x263F00A30] newAssertionForBundle:v3 withReason:@"MDMDLostDeviceLocationManager getCurrentLocationForOriginator:completion:"];
    [MEMORY[0x263F00A60] setAuthorizationStatusByType:3 forBundle:v3];
    id v5 = objc_alloc(MEMORY[0x263F00A60]);
    id v6 = [v3 bundlePath];
    id v7 = *(void **)(a1 + 32);
    objc_super v8 = [v7 queue];
    id v9 = (void *)[v5 initWithEffectiveBundlePath:v6 delegate:v7 onQueue:v8];
    [*(id *)(a1 + 32) setLocationManager:v9];

    id v10 = *(void **)(a1 + 32);
    v11 = [v10 locationManager];
    [v11 setDelegate:v10];

    double v12 = *MEMORY[0x263F00B10];
    id v13 = [*(id *)(a1 + 32) locationManager];
    [v13 setDesiredAccuracy:v12];

    v14 = [*(id *)(a1 + 32) queue];
    dispatch_source_t v15 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v14);
    [*(id *)(a1 + 32) setTimeoutTimerDispatchSource:v15];

    v16 = [*(id *)(a1 + 32) timeoutTimerDispatchSource];
    dispatch_time_t v17 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 30000000000);
    dispatch_source_set_timer(v16, v17, 0x3B9ACA00uLL, 0x3B9ACA00uLL);

    v18 = [*(id *)(a1 + 32) timeoutTimerDispatchSource];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __75__MDMLostDeviceLocationManager_getCurrentLocationForOriginator_completion___block_invoke_2;
    handler[3] = &unk_264B9D408;
    handler[4] = *(void *)(a1 + 32);
    id v24 = v4;
    id v19 = v4;
    dispatch_source_set_event_handler(v18, handler);

    v20 = [*(id *)(a1 + 32) timeoutTimerDispatchSource];
    dispatch_activate(v20);

    v21 = [*(id *)(a1 + 32) locationManager];
    [v21 requestLocation];
  }
}

void __75__MDMLostDeviceLocationManager_getCurrentLocationForOriginator_completion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v2);

  v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_230A49000, v3, OS_LOG_TYPE_ERROR, "Location Manager timed out", v6, 2u);
  }
  v4 = [*(id *)(a1 + 32) completionBlock];
  [*(id *)(a1 + 32) _cleanupAfterResponseFromLocationManagerOrTimeout];
  if (v4)
  {
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F38AD0] code:7001 userInfo:0];
    ((void (**)(void, void, void *))v4)[2](v4, 0, v5);
  }
}

- (void)clearLastLocationRequestedDate
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = NSURL;
  v3 = DMCSystemLostModeRequestPath();
  v4 = [v2 fileURLWithPath:v3 isDirectory:0];

  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id v5 = objc_opt_new();
  id v10 = &v12;
  id v11 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__MDMLostDeviceLocationManager_clearLastLocationRequestedDate__block_invoke;
  v8[3] = &unk_264B9D5E0;
  id v9 = 0;
  [v5 coordinateWritingItemAtURL:v4 options:1 error:&v11 byAccessor:v8];
  id v6 = v11;

  if (!*((unsigned char *)v13 + 24))
  {
    id v7 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_230A49000, v7, OS_LOG_TYPE_ERROR, "Could not read device last location requested file: %@", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v12, 8);
}

void __62__MDMLostDeviceLocationManager_clearLastLocationRequestedDate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  v3 = (void *)MEMORY[0x263F08850];
  id v4 = a2;
  id v5 = [v3 defaultManager];
  id v11 = 0;
  int v6 = [v5 removeItemAtURL:v4 error:&v11];

  id v7 = v11;
  if (v6)
  {
  }
  else
  {
    objc_super v8 = [*(id *)(a1 + 32) domain];
    if ([v8 isEqualToString:*MEMORY[0x263F07F70]])
    {
      uint64_t v9 = [*(id *)(a1 + 32) code];

      if (v9 == 4) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    id v10 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_230A49000, v10, OS_LOG_TYPE_ERROR, "Could not remove device last located file: %@", buf, 0xCu);
    }
  }
LABEL_9:
}

- (NSString)lastLocationRequestedDateMessage
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v2 = NSURL;
  v3 = DMCSystemLostModeRequestPath();
  id v4 = [v2 fileURLWithPath:v3 isDirectory:0];

  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__3;
  v41 = __Block_byref_object_dispose__3;
  id v42 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3;
  v31 = __Block_byref_object_dispose__3;
  id v32 = 0;
  id v5 = objc_opt_new();
  v25[6] = &v37;
  id v26 = 0;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __64__MDMLostDeviceLocationManager_lastLocationRequestedDateMessage__block_invoke;
  v25[3] = &unk_264B9D608;
  v25[4] = &v33;
  v25[5] = &v27;
  [v5 coordinateReadingItemAtURL:v4 options:0 error:&v26 byAccessor:v25];
  id v24 = v26;

  if (!*((unsigned char *)v34 + 24))
  {
    int v6 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v44 = v24;
      _os_log_impl(&dword_230A49000, v6, OS_LOG_TYPE_DEFAULT, "Could not read device last located time interval: %@", buf, 0xCu);
    }
  }
  id v7 = (void *)v38[5];
  if (v7)
  {
    objc_super v8 = (void *)MEMORY[0x263EFF910];
    [v7 doubleValue];
    uint64_t v9 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
    id v10 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v44 = v9;
      _os_log_impl(&dword_230A49000, v10, OS_LOG_TYPE_DEFAULT, "Device last located on %{public}@. Creating localized message.", buf, 0xCu);
    }
    id v11 = objc_opt_new();
    uint64_t v12 = [MEMORY[0x263EFF960] currentLocale];
    [v11 setLocale:v12];

    [v11 setTimeStyle:1];
    id v13 = [v11 stringFromDate:v9];
    [v11 setTimeStyle:0];
    [v11 setDateStyle:3];
    uint64_t v14 = [v11 stringFromDate:v9];
    char v15 = [(id)v28[5] objectForKeyedSubscript:@"originator"];
    if (!v15)
    {
      v16 = [(id)v28[5] objectForKeyedSubscript:@"organizationName"];
      id v17 = v16;
      if (v16)
      {
        id v18 = v16;
      }
      else
      {
        id v18 = [(id)v28[5] objectForKeyedSubscript:@"serverName"];
      }
      char v15 = v18;
    }
    v20 = NSString;
    v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v22 = [v21 localizedStringForKey:@"The location of this device was sent to %@ at %@ on %@." value:&stru_26E549450 table:@"MDMNotifications"];
    id v19 = objc_msgSend(v20, "stringWithFormat:", v22, v15, v13, v14);
  }
  else
  {
    id v19 = 0;
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return (NSString *)v19;
}

uint64_t __64__MDMLostDeviceLocationManager_lastLocationRequestedDateMessage__block_invoke(void *a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
  uint64_t v3 = [NSDictionary dictionaryWithContentsOfURL:a2];
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(*(void *)(a1[5] + 8) + 40) objectForKeyedSubscript:*MEMORY[0x263F53DC8]];
  return MEMORY[0x270F9A758]();
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = a4;
  int v6 = [(MDMLostDeviceLocationManager *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = [v5 lastObject];

  objc_super v8 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v8, OS_LOG_TYPE_DEFAULT, "Location Manager returned a location.", buf, 2u);
  }
  uint64_t v9 = [(MDMLostDeviceLocationManager *)self originator];
  BOOL v10 = [(MDMLostDeviceLocationManager *)self _updateLostModeFileForOriginator:v9];

  id v11 = [(MDMLostDeviceLocationManager *)self completionBlock];
  [(MDMLostDeviceLocationManager *)self _cleanupAfterResponseFromLocationManagerOrTimeout];
  if (v10)
  {
    if (v11) {
      ((void (**)(void, void *, void))v11)[2](v11, v7, 0);
    }
  }
  else
  {
    uint64_t v12 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_230A49000, v12, OS_LOG_TYPE_ERROR, "Location Manager returned a location, but we can't report it because we can't record that fact. Throwing location information away.", v14, 2u);
    }
    if (v11)
    {
      id v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F38AD0] code:7002 userInfo:0];
      ((void (**)(void, void, void *))v11)[2](v11, 0, v13);
    }
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = [(MDMLostDeviceLocationManager *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138543362;
    id v10 = v5;
    _os_log_impl(&dword_230A49000, v7, OS_LOG_TYPE_ERROR, "Location Manager failed: error=%{public}@", (uint8_t *)&v9, 0xCu);
  }
  objc_super v8 = [(MDMLostDeviceLocationManager *)self completionBlock];
  [(MDMLostDeviceLocationManager *)self _cleanupAfterResponseFromLocationManagerOrTimeout];
  if (v8) {
    ((void (**)(void, void, id))v8)[2](v8, 0, v5);
  }
}

- (void)_cleanupAfterResponseFromLocationManagerOrTimeout
{
  uint64_t v3 = [(MDMLostDeviceLocationManager *)self locationManager];
  [v3 stopUpdatingLocation];

  [(MDMLostDeviceLocationManager *)self setLocationManager:0];
  [(MDMLostDeviceLocationManager *)self setCompletionBlock:0];
  uint64_t v4 = [(MDMLostDeviceLocationManager *)self timeoutTimerDispatchSource];
  if (v4)
  {
    id v5 = v4;
    dispatch_source_cancel(v4);
    [(MDMLostDeviceLocationManager *)self setTimeoutTimerDispatchSource:0];
    uint64_t v4 = v5;
  }
}

- (BOOL)_updateLostModeFileForOriginator:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = NSURL;
  id v5 = DMCSystemLostModeRequestPath();
  int v6 = [v4 fileURLWithPath:v5 isDirectory:0];

  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v7 = objc_opt_new();
  id v17 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__MDMLostDeviceLocationManager__updateLostModeFileForOriginator___block_invoke;
  v13[3] = &unk_264B9D630;
  char v15 = &v22;
  id v8 = v3;
  id v14 = v8;
  v16 = &v18;
  [v7 coordinateWritingItemAtURL:v6 options:0 error:&v17 byAccessor:v13];
  id v9 = v17;

  if (!*((unsigned char *)v23 + 24))
  {
    id v10 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v9;
      _os_log_impl(&dword_230A49000, v10, OS_LOG_TYPE_DEFAULT, "Could not read device last located time interval for update: %@", buf, 0xCu);
    }
  }
  BOOL v11 = *((unsigned char *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v11;
}

void __65__MDMLostDeviceLocationManager__updateLostModeFileForOriginator___block_invoke(void *a1, void *a2)
{
  v22[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  uint64_t v4 = NSNumber;
  id v5 = objc_opt_new();
  [v5 timeIntervalSinceReferenceDate];
  int v6 = objc_msgSend(v4, "numberWithDouble:");

  v21[0] = *MEMORY[0x263F53DC8];
  v21[1] = @"originator";
  uint64_t v7 = a1[4];
  v22[0] = v6;
  v22[1] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  if ([v8 writeToURL:v3 atomically:1])
  {
    uint64_t v9 = *MEMORY[0x263F080B0];
    uint64_t v10 = *MEMORY[0x263EFF6B0];
    v19[0] = *MEMORY[0x263F080A8];
    v19[1] = v10;
    v20[0] = v9;
    v20[1] = MEMORY[0x263EFFA88];
    BOOL v11 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
    id v16 = 0;
    int v12 = [v3 setResourceValues:v11 error:&v16];
    id v13 = v16;

    if (v12)
    {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    }
    else
    {
      char v15 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v13;
        _os_log_impl(&dword_230A49000, v15, OS_LOG_TYPE_ERROR, "Could not write device last located time interval URL resourve values: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v14 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230A49000, v14, OS_LOG_TYPE_ERROR, "Could not write device last located time interval", buf, 2u);
    }
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (NSString)originator
{
  return self->_originator;
}

- (void)setOriginator:(id)a3
{
}

- (OS_dispatch_source)timeoutTimerDispatchSource
{
  return self->_timeoutTimerDispatchSource;
}

- (void)setTimeoutTimerDispatchSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimerDispatchSource, 0);
  objc_storeStrong((id *)&self->_originator, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end