@interface DTKTraceTapLocalTimerBasedEventProducer
+ (BOOL)supportsConfig:(id)a3;
- (DTKTraceTapLocalTimerBasedEventProducer)init;
- (unint64_t)_processInfoThermalStateToCLTMPressureLevel:(int64_t)a3;
- (void)_emitThermalState:(int64_t)a3 currentState:(int64_t)a4;
- (void)dealloc;
- (void)start;
- (void)stop;
@end

@implementation DTKTraceTapLocalTimerBasedEventProducer

+ (BOOL)supportsConfig:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_2308FCF3C;
  v6[3] = &unk_264B8EBB0;
  v6[4] = &v7;
  [v3 enumerateTriggerConfigs:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (DTKTraceTapLocalTimerBasedEventProducer)init
{
  v7.receiver = self;
  v7.super_class = (Class)DTKTraceTapLocalTimerBasedEventProducer;
  v2 = [(DTKTraceTapLocalTimerBasedEventProducer *)&v7 init];
  if (v2)
  {
    id v3 = [MEMORY[0x263F08AB0] processInfo];
    v2->_currentThermalState = [v3 thermalState];

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.dt.instruments.ktrace.localeventproducer", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;

    notify_register_check("com.apple.Metal.AGXEnableOSSignposts", &v2->_token);
  }
  return v2;
}

- (void)dealloc
{
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    dispatch_queue_t v4 = self->_timer;
    self->_timer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)DTKTraceTapLocalTimerBasedEventProducer;
  [(DTKTraceTapLocalTimerBasedEventProducer *)&v5 dealloc];
}

- (unint64_t)_processInfoThermalStateToCLTMPressureLevel:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 0;
  }
  else {
    return 10 * (a3 - 1) + 10;
  }
}

- (void)_emitThermalState:(int64_t)a3 currentState:(int64_t)a4
{
  [(DTKTraceTapLocalTimerBasedEventProducer *)self _processInfoThermalStateToCLTMPressureLevel:a3];
  [(DTKTraceTapLocalTimerBasedEventProducer *)self _processInfoThermalStateToCLTMPressureLevel:a4];
  kdebug_trace();
  uint64_t v6 = MEMORY[0x263F33290];
  MEMORY[0x270F9A6D0](v6, sel_logSignpostWithConditionStates);
}

- (void)start
{
  id v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_workQueue);
  timer = self->_timer;
  self->_timer = v3;

  objc_super v5 = self->_timer;
  dispatch_time_t v6 = dispatch_time(0, 100000000);
  dispatch_source_set_timer(v5, v6, 0x5F5E100uLL, 0xBEBC200uLL);
  objc_initWeak(&location, self);
  objc_super v7 = self->_timer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_2308FD258;
  v8[3] = &unk_264B8D760;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v7, v8);
  dispatch_resume((dispatch_object_t)self->_timer);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)stop
{
  id v3 = [MEMORY[0x263F08AB0] processInfo];
  uint64_t v4 = [v3 thermalState];

  [(DTKTraceTapLocalTimerBasedEventProducer *)self _emitThermalState:v4 currentState:v4];
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    dispatch_time_t v6 = self->_timer;
    self->_timer = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end