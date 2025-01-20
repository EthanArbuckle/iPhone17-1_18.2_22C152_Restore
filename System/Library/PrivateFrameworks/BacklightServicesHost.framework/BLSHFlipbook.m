@interface BLSHFlipbook
+ (id)createWithPlatformProvider:(id)a3;
- (BLSHFlipbook)initWithPlatformProvider:(id)a3;
- (BLSHRenderedFlipbookFrame)captureFrameOnGlass;
- (BLSHRenderedFlipbookFrame)frameOnGlass;
- (BLSHRenderedFlipbookFrame)lastRenderedFrame;
- (BOOL)cachesFramesOnExit;
- (BOOL)hangDetected;
- (BOOL)is1HzFlipbook;
- (BOOL)isPowerSavingEnabled;
- (NSArray)activeFrames;
- (id)cancelAllFrames;
- (unint64_t)memoryUsage;
- (void)cancelAllFrames;
- (void)collect;
- (void)dealloc;
- (void)flushLogBuffers;
- (void)hangDetector:(uint64_t)a1;
- (void)hangDetectorFired;
- (void)invalidate;
- (void)purge;
- (void)renderFrameForPresentation:(id)a3 dateSpecifier:(id)a4 completion:(id)a5;
- (void)set1HzFlipbook:(BOOL)a3;
- (void)setCachesFramesOnExit:(BOOL)a3;
- (void)setHangDetected:(BOOL)a3;
- (void)setPowerSavingEnabled:(BOOL)a3;
@end

@implementation BLSHFlipbook

+ (id)createWithPlatformProvider:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPlatformProvider:v3];

  return v4;
}

- (BLSHFlipbook)initWithPlatformProvider:(id)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BLSHFlipbook;
  v5 = [(BLSHFlipbook *)&v21 init];
  if (v5)
  {
    if (objc_opt_respondsToSelector())
    {
      v6 = [v4 flipbookSpecification];
      v7 = v6;
      if (v6)
      {
        uint64_t v22 = *MEMORY[0x263F15DC8];
        v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "frameCapacity"));
        v23[0] = v8;
        v9 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
      }
      else
      {
        v9 = 0;
      }
    }
    else
    {
      v9 = 0;
    }
    v10 = [MEMORY[0x263F15778] mainDisplay];
    uint64_t v11 = [v10 flipBookWithOptions:v9];
    v12 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v11;

    *((_WORD *)v5 + 24) = 0;
    [*((id *)v5 + 5) setWantsTransform:0];
    [*((id *)v5 + 5) setInverted:v5[49]];
    if (os_variant_has_internal_diagnostics())
    {
      [*((id *)v5 + 5) setMaximumMemoryUsageForDiagnostics:20971520];
      dispatch_workloop_t inactive = dispatch_workloop_create_inactive("flipbook hang detector workloop");
      v14 = (void *)*((void *)v5 + 2);
      *((void *)v5 + 2) = inactive;

      dispatch_workloop_set_scheduler_priority();
      dispatch_activate(*((dispatch_object_t *)v5 + 2));
      dispatch_queue_t v15 = dispatch_queue_create_with_target_V2("flipbook hang detector queue", 0, *((dispatch_queue_t *)v5 + 2));
      v16 = (void *)*((void *)v5 + 3);
      *((void *)v5 + 3) = v15;

      uint64_t v17 = [objc_alloc(MEMORY[0x263F29BA8]) initWithIdentifier:@"flipbook-hang-detector"];
      v18 = (void *)*((void *)v5 + 1);
      *((void *)v5 + 1) = v17;
    }
    v19 = bls_flipbook_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[BLSHFlipbook initWithPlatformProvider:]((uint64_t)v5, v19);
    }
  }
  return (BLSHFlipbook *)v5;
}

- (void)dealloc
{
  [(BSAbsoluteMachTimer *)self->_hangDetectorTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BLSHFlipbook;
  [(BLSHFlipbook *)&v3 dealloc];
}

- (void)hangDetector:(uint64_t)a1
{
  objc_super v3 = a2;
  if (a1)
  {
    if (([(id)a1 hangDetected] & 1) == 0)
    {
      *(void *)(a1 + 32) = mach_continuous_time();
      objc_initWeak(&location, (id)a1);
      id v4 = *(void **)(a1 + 8);
      uint64_t v5 = *(void *)(a1 + 24);
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __29__BLSHFlipbook_hangDetector___block_invoke;
      v6[3] = &unk_264532208;
      objc_copyWeak(&v7, &location);
      [v4 scheduleWithFireInterval:v5 leewayInterval:v6 queue:10.0 handler:1.0];
      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
    v3[2](v3);
    [*(id *)(a1 + 8) cancel];
  }
}

void __29__BLSHFlipbook_hangDetector___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  [v3 cancel];

  -[BLSHFlipbook hangDetectorFired](WeakRetained);
}

- (void)hangDetectorFired
{
  if (a1)
  {
    [a1 setHangDetected:1];
    -[BLSHFlipbook flushLogBuffers]((uint64_t)a1);
    v2 = NSString;
    mach_continuous_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    id v4 = objc_msgSend(v2, "stringWithFormat:", @"flipbook hang detected – %.4lfs elapsed", v3);
    BLSHRecordCriticalAssertFailure(v4);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __33__BLSHFlipbook_hangDetectorFired__block_invoke;
    v22[3] = &unk_264532230;
    v22[4] = a1;
    v22[5] = sel_hangDetectorFired;
    uint64_t v5 = (void (**)(void))MEMORY[0x223C5E2B0](v22);
    if (BLSHIsUnitTestRunning())
    {
      v5[2](v5);
    }
    else
    {
      dispatch_time_t v6 = dispatch_time(0, 1000000000);
      dispatch_after(v6, MEMORY[0x263EF83A0], v5);
    }

    dispatch_time_t v7 = dispatch_time(0, 5000000000);
    v8 = a1[3];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33__BLSHFlipbook_hangDetectorFired__block_invoke_21;
    block[3] = &unk_264532258;
    block[4] = a1;
    dispatch_after(v7, v8, block);
    dispatch_time_t v9 = dispatch_time(0, 10000000000);
    v10 = a1[3];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __33__BLSHFlipbook_hangDetectorFired__block_invoke_2;
    v20[3] = &unk_264532258;
    v20[4] = a1;
    dispatch_after(v9, v10, v20);
    dispatch_time_t v11 = dispatch_time(0, 15000000000);
    v12 = a1[3];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __33__BLSHFlipbook_hangDetectorFired__block_invoke_3;
    v19[3] = &unk_264532258;
    v19[4] = a1;
    dispatch_after(v11, v12, v19);
    dispatch_time_t v13 = dispatch_time(0, 20000000000);
    v14 = a1[3];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __33__BLSHFlipbook_hangDetectorFired__block_invoke_4;
    v18[3] = &unk_264532258;
    v18[4] = a1;
    dispatch_after(v13, v14, v18);
    dispatch_time_t v15 = dispatch_time(0, 25000000000);
    v16 = a1[3];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __33__BLSHFlipbook_hangDetectorFired__block_invoke_5;
    v17[3] = &unk_264532258;
    v17[4] = a1;
    dispatch_after(v15, v16, v17);
  }
}

- (void)flushLogBuffers
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  mach_continuous_time();
  BSTimeDifferenceFromMachTimeToMachTime();
  int v4 = 134217984;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_21FCFC000, a2, (os_log_type_t)0x90u, "flipbook hang detected – %.4lfs elapsed - will flush buffers", (uint8_t *)&v4, 0xCu);
}

void __33__BLSHFlipbook_hangDetectorFired__block_invoke(uint64_t a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"BLSHCriticalAssertDidFailNotification", 0, 0, 4u);
  uint64_t v3 = NSString;
  mach_continuous_time();
  BSTimeDifferenceFromMachTimeToMachTime();
  uint64_t v5 = objc_msgSend(v3, "stringWithFormat:", @"flipbook hang detected – %.4lfs elapsed", v4);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
    dispatch_time_t v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138544642;
    dispatch_time_t v11 = v6;
    __int16 v12 = 2114;
    dispatch_time_t v13 = v8;
    __int16 v14 = 2048;
    uint64_t v15 = v9;
    __int16 v16 = 2114;
    uint64_t v17 = @"BLSHFlipbook.m";
    __int16 v18 = 1024;
    int v19 = 102;
    __int16 v20 = 2114;
    objc_super v21 = v5;
    _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v5 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

void __33__BLSHFlipbook_hangDetectorFired__block_invoke_21(uint64_t a1)
{
}

void __33__BLSHFlipbook_hangDetectorFired__block_invoke_2(uint64_t a1)
{
}

void __33__BLSHFlipbook_hangDetectorFired__block_invoke_3(uint64_t a1)
{
}

void __33__BLSHFlipbook_hangDetectorFired__block_invoke_4(uint64_t a1)
{
}

uint64_t __33__BLSHFlipbook_hangDetectorFired__block_invoke_5(uint64_t a1)
{
  -[BLSHFlipbook flushLogBuffers](*(void *)(a1 + 32));
  v2 = *(void **)(a1 + 32);

  return [v2 setHangDetected:0];
}

- (BLSHRenderedFlipbookFrame)frameOnGlass
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  uint64_t v9 = __Block_byref_object_dispose_;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __28__BLSHFlipbook_frameOnGlass__block_invoke;
  v4[3] = &unk_264532280;
  v4[4] = self;
  v4[5] = &v5;
  -[BLSHFlipbook hangDetector:]((uint64_t)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (BLSHRenderedFlipbookFrame *)v2;
}

uint64_t __28__BLSHFlipbook_frameOnGlass__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) frameAtTime:mach_continuous_time()];

  return MEMORY[0x270F9A758]();
}

- (BLSHRenderedFlipbookFrame)captureFrameOnGlass
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  uint64_t v9 = __Block_byref_object_dispose_;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__BLSHFlipbook_captureFrameOnGlass__block_invoke;
  v4[3] = &unk_264532280;
  v4[4] = self;
  v4[5] = &v5;
  -[BLSHFlipbook hangDetector:]((uint64_t)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (BLSHRenderedFlipbookFrame *)v2;
}

uint64_t __35__BLSHFlipbook_captureFrameOnGlass__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) copyCurrentFrame];

  return MEMORY[0x270F9A758]();
}

- (BLSHRenderedFlipbookFrame)lastRenderedFrame
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  uint64_t v9 = __Block_byref_object_dispose_;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__BLSHFlipbook_lastRenderedFrame__block_invoke;
  v4[3] = &unk_264532280;
  v4[4] = self;
  v4[5] = &v5;
  -[BLSHFlipbook hangDetector:]((uint64_t)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (BLSHRenderedFlipbookFrame *)v2;
}

uint64_t __33__BLSHFlipbook_lastRenderedFrame__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) frameAtTime:-1];

  return MEMORY[0x270F9A758]();
}

- (NSArray)activeFrames
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  uint64_t v9 = __Block_byref_object_dispose_;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __28__BLSHFlipbook_activeFrames__block_invoke;
  v4[3] = &unk_264532280;
  v4[4] = self;
  v4[5] = &v5;
  -[BLSHFlipbook hangDetector:]((uint64_t)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

uint64_t __28__BLSHFlipbook_activeFrames__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) activeFrames];

  return MEMORY[0x270F9A758]();
}

- (unint64_t)memoryUsage
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __27__BLSHFlipbook_memoryUsage__block_invoke;
  v4[3] = &unk_264532280;
  v4[4] = self;
  v4[5] = &v5;
  -[BLSHFlipbook hangDetector:]((uint64_t)self, v4);
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __27__BLSHFlipbook_memoryUsage__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 40) memoryUsage];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isPowerSavingEnabled
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__BLSHFlipbook_isPowerSavingEnabled__block_invoke;
  v4[3] = &unk_264532280;
  v4[4] = self;
  v4[5] = &v5;
  -[BLSHFlipbook hangDetector:]((uint64_t)self, v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __36__BLSHFlipbook_isPowerSavingEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 40) powerSavingEnabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setPowerSavingEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __38__BLSHFlipbook_setPowerSavingEnabled___block_invoke;
  v3[3] = &unk_2645322A8;
  v3[4] = self;
  BOOL v4 = a3;
  -[BLSHFlipbook hangDetector:]((uint64_t)self, v3);
}

uint64_t __38__BLSHFlipbook_setPowerSavingEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) setPowerSavingEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)is1HzFlipbook
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29__BLSHFlipbook_is1HzFlipbook__block_invoke;
  v4[3] = &unk_264532280;
  v4[4] = self;
  v4[5] = &v5;
  -[BLSHFlipbook hangDetector:]((uint64_t)self, v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __29__BLSHFlipbook_is1HzFlipbook__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 40) isOneHzFlipBook];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)set1HzFlipbook:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = bls_flipbook_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v9 = self;
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl(&dword_21FCFC000, v5, OS_LOG_TYPE_INFO, "%p set1HzFlipbook:%{BOOL}u", buf, 0x12u);
  }

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__BLSHFlipbook_set1HzFlipbook___block_invoke;
  v6[3] = &unk_2645322A8;
  void v6[4] = self;
  BOOL v7 = v3;
  -[BLSHFlipbook hangDetector:]((uint64_t)self, v6);
}

uint64_t __31__BLSHFlipbook_set1HzFlipbook___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) setOneHzFlipBook:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)cachesFramesOnExit
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__BLSHFlipbook_cachesFramesOnExit__block_invoke;
  v4[3] = &unk_264532280;
  v4[4] = self;
  v4[5] = &v5;
  -[BLSHFlipbook hangDetector:]((uint64_t)self, v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __34__BLSHFlipbook_cachesFramesOnExit__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 40) cachesFramesOnExit];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setCachesFramesOnExit:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = bls_flipbook_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v9 = self;
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl(&dword_21FCFC000, v5, OS_LOG_TYPE_INFO, "%p setCachesFramesOnExit:%{BOOL}u", buf, 0x12u);
  }

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__BLSHFlipbook_setCachesFramesOnExit___block_invoke;
  v6[3] = &unk_2645322A8;
  void v6[4] = self;
  BOOL v7 = v3;
  -[BLSHFlipbook hangDetector:]((uint64_t)self, v6);
}

uint64_t __38__BLSHFlipbook_setCachesFramesOnExit___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) setCachesFramesOnExit:*(unsigned __int8 *)(a1 + 40)];
}

- (void)renderFrameForPresentation:(id)a3 dateSpecifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = (void (**)(id, uint64_t, uint64_t))a5;
  BOOL v11 = [v8 flipbookContext];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __68__BLSHFlipbook_renderFrameForPresentation_dateSpecifier_completion___block_invoke;
  v41[3] = &unk_2645322D0;
  v41[4] = self;
  id v12 = v11;
  id v42 = v12;
  -[BLSHFlipbook hangDetector:]((uint64_t)self, v41);
  uint64_t v13 = [v12 wantsTransform];
  if (self->_wantsTransform != v13)
  {
    self->_wantsTransform = v13;
    [(CAFlipBook *)self->_flipbook setWantsTransform:v13];
  }
  uint64_t v14 = [v12 isInverted];
  if (self->_inverted != v14)
  {
    self->_inverted = v14;
    [(CAFlipBook *)self->_flipbook setInverted:v14];
  }
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy_;
  v39 = __Block_byref_object_dispose_;
  id v40 = 0;
  BSContinuousMachTimeNow();
  double v16 = v15;
  uint64_t v17 = mach_continuous_time();
  __int16 v18 = [v9 presentationDate];
  unint64_t v19 = objc_msgSend(v18, "bls_machContinuousTime");

  if (v17 <= v19) {
    unint64_t v20 = v19;
  }
  else {
    unint64_t v20 = v17;
  }
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  id v34 = 0;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __68__BLSHFlipbook_renderFrameForPresentation_dateSpecifier_completion___block_invoke_2;
  v24[3] = &unk_2645322F8;
  v26 = &v29;
  v24[4] = self;
  unint64_t v28 = v20;
  id v21 = v9;
  id v25 = v21;
  v27 = &v35;
  -[BLSHFlipbook hangDetector:]((uint64_t)self, v24);
  BSContinuousMachTimeNow();
  if (v22 - v16 > 1.0)
  {
    v23 = bls_flipbook_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[BLSHFlipbook renderFrameForPresentation:dateSpecifier:completion:]();
    }
  }
  v10[2](v10, v30[5], v36[5]);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
}

void __68__BLSHFlipbook_renderFrameForPresentation_dateSpecifier_completion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 40);
  id v2 = [*(id *)(a1 + 40) caContext];
  objc_msgSend(v1, "setContextId:", objc_msgSend(v2, "contextId"));
}

void __68__BLSHFlipbook_renderFrameForPresentation_dateSpecifier_completion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[5];
  BOOL v3 = *(void **)(a1[4] + 40);
  uint64_t v4 = a1[8];
  uint64_t v5 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v3 renderForTime:v4 options:0 userInfo:v2 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)cancelAllFrames
{
  BSContinuousMachTimeNow();
  double v4 = v3;
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __31__BLSHFlipbook_cancelAllFrames__block_invoke;
  v9[3] = &unk_264532280;
  v9[4] = self;
  v9[5] = &v10;
  -[BLSHFlipbook hangDetector:]((uint64_t)self, v9);
  BSContinuousMachTimeNow();
  if (v5 - v4 > 1.0)
  {
    uint64_t v6 = bls_flipbook_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[BLSHFlipbook cancelAllFrames]();
    }
  }
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __31__BLSHFlipbook_cancelAllFrames__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) cancel];

  return MEMORY[0x270F9A758]();
}

- (void)collect
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __23__BLSHFlipbook_collect__block_invoke;
  v2[3] = &unk_264532258;
  v2[4] = self;
  -[BLSHFlipbook hangDetector:]((uint64_t)self, v2);
}

uint64_t __23__BLSHFlipbook_collect__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) collect];
}

- (void)purge
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __21__BLSHFlipbook_purge__block_invoke;
  v2[3] = &unk_264532258;
  v2[4] = self;
  -[BLSHFlipbook hangDetector:]((uint64_t)self, v2);
}

uint64_t __21__BLSHFlipbook_purge__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) purge];
}

- (void)invalidate
{
  id v3 = [(BLSHFlipbook *)self cancelAllFrames];
  [(BLSHFlipbook *)self collect];
  [(BLSHFlipbook *)self purge];
  flipbook = self->_flipbook;
  self->_flipbook = 0;
}

- (BOOL)hangDetected
{
  return self->_hangDetected;
}

- (void)setHangDetected:(BOOL)a3
{
  self->_hangDetected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flipbook, 0);
  objc_storeStrong((id *)&self->_hangDetectorQueue, 0);
  objc_storeStrong((id *)&self->_hangDetectorWorkloop, 0);

  objc_storeStrong((id *)&self->_hangDetectorTimer, 0);
}

- (void)initWithPlatformProvider:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 134218242;
  uint64_t v3 = a1;
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_DEBUG, "%p created %{public}@", (uint8_t *)&v2, 0x16u);
}

- (void)renderFrameForPresentation:dateSpecifier:completion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_21FCFC000, v0, OS_LOG_TYPE_ERROR, "%p -[CAFlipBook renderForTime:options:userInfo:error:] took %.5fs. Likely dupe of rdar://78634442", v1, 0x16u);
}

- (void)cancelAllFrames
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_21FCFC000, v0, OS_LOG_TYPE_ERROR, "%p -[CAFlipBook cancel] took %.5fs. Likely dupe of rdar://78634442", v1, 0x16u);
}

@end