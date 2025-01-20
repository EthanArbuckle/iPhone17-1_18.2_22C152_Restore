@interface CMContinuityCaptureThermalMonitor
+ (id)sharedInstance;
+ (void)invalidate;
- (BOOL)invalidated;
- (BOOL)setupNotification;
- (CMContinuityCaptureThermalMonitor)initWithQueue:(id)a3;
- (OS_dispatch_queue)queue;
- (unint64_t)thermalLevel;
- (void)_thermalNotification:(unint64_t)a3;
- (void)invalidate;
- (void)setInvalidated:(BOOL)a3;
@end

@implementation CMContinuityCaptureThermalMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_11);
  }
  v2 = (void *)_thermalMonitor;
  return v2;
}

void __51__CMContinuityCaptureThermalMonitor_sharedInstance__block_invoke()
{
  v0 = [CMContinuityCaptureThermalMonitor alloc];
  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.continuitycapture.thermalmonitor", v4);
  uint64_t v2 = [(CMContinuityCaptureThermalMonitor *)v0 initWithQueue:v1];
  v3 = (void *)_thermalMonitor;
  _thermalMonitor = v2;
}

- (CMContinuityCaptureThermalMonitor)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CMContinuityCaptureThermalMonitor;
  v6 = [(CMContinuityCaptureThermalMonitor *)&v11 init];
  v7 = v6;
  if (!v6)
  {
LABEL_8:
    v8 = 0;
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v6->_queue, a3);
  v7->_registrationToken = -1;
  if (![(CMContinuityCaptureThermalMonitor *)v7 setupNotification])
  {
    v10 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureThermalMonitor initWithQueue:](v10);
    }

    goto LABEL_8;
  }
  v8 = v7;
LABEL_4:

  return v8;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unint64_t)thermalLevel
{
  return self->_thermalLevel;
}

- (BOOL)invalidated
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL invalidated = v2->_invalidated;
  objc_sync_exit(v2);

  return invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL invalidated = a3;
  objc_sync_exit(obj);
}

+ (void)invalidate
{
  if (([(id)_thermalMonitor invalidated] & 1) == 0)
  {
    [(id)_thermalMonitor invalidate];
    uint64_t v2 = (void *)_thermalMonitor;
    [v2 setInvalidated:1];
  }
}

- (void)invalidate
{
  if (notify_is_valid_token(self->_registrationToken))
  {
    int registrationToken = self->_registrationToken;
    notify_cancel(registrationToken);
  }
}

- (BOOL)setupNotification
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__CMContinuityCaptureThermalMonitor_setupNotification__block_invoke;
  v7[3] = &unk_264C9A348;
  objc_copyWeak(&v8, &location);
  v3 = (void (**)(void, void))MEMORY[0x237DFB780](v7);
  p_int registrationToken = &self->_registrationToken;
  uint32_t v5 = notify_register_dispatch((const char *)*MEMORY[0x263EF8918], &self->_registrationToken, (dispatch_queue_t)self->_queue, v3);
  if (!v5) {
    v3[2](v3, *p_registrationToken);
  }

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v5 == 0;
}

void __54__CMContinuityCaptureThermalMonitor_setupNotification__block_invoke(uint64_t a1, int a2)
{
  v4 = (void *)MEMORY[0x237DFB540]();
  uint64_t state64 = 0;
  uint32_t state = notify_get_state(a2, &state64);
  if (state)
  {
    int v6 = state;
    v7 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __54__CMContinuityCaptureThermalMonitor_setupNotification__block_invoke_cold_1(v6, v7);
    }
    goto LABEL_6;
  }
  id v8 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v10 = *((void *)WeakRetained + 3);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__CMContinuityCaptureThermalMonitor_setupNotification__block_invoke_3;
    block[3] = &unk_264C9A320;
    objc_copyWeak(v12, v8);
    v12[1] = (id)state64;
    dispatch_async(v10, block);
    objc_destroyWeak(v12);
LABEL_6:
  }
}

void __54__CMContinuityCaptureThermalMonitor_setupNotification__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _thermalNotification:*(unsigned int *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)_thermalNotification:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = 3;
  uint64_t v6 = 2;
  if (a3 <= 1) {
    uint64_t v6 = a3 == 0;
  }
  if (a3 <= 4) {
    uint64_t v5 = v6;
  }
  if (a3 <= 9) {
    unint64_t v7 = v5;
  }
  else {
    unint64_t v7 = 4;
  }
  if (v7 != self->_thermalLevel)
  {
    [(CMContinuityCaptureThermalMonitor *)self willChangeValueForKey:@"thermalLevel"];
    self->_thermalLevel = v7;
    [(CMContinuityCaptureThermalMonitor *)self didChangeValueForKey:@"thermalLevel"];
  }
}

- (void).cxx_destruct
{
}

- (void)initWithQueue:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)dispatch_queue_t v1 = 0;
  _os_log_error_impl(&dword_235FC2000, log, OS_LOG_TYPE_ERROR, "Unable to setup thermal monitor", v1, 2u);
}

void __54__CMContinuityCaptureThermalMonitor_setupNotification__block_invoke_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_235FC2000, a2, OS_LOG_TYPE_ERROR, "Unable to get notification state: %d", (uint8_t *)v2, 8u);
}

@end