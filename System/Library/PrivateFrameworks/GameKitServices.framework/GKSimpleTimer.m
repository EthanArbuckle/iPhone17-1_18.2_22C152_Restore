@interface GKSimpleTimer
- (GKSimpleTimer)init;
- (GKSimpleTimerDelegate)delegate;
- (double)interval;
- (void)dealloc;
- (void)fireIn:(double)a3 fromNow:(double)a4;
- (void)init;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setTimer:(double)a3;
@end

@implementation GKSimpleTimer

- (GKSimpleTimer)init
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)GKSimpleTimer;
  v2 = [(GKSimpleTimer *)&v7 init];
  if (v2)
  {
    v16.__sig = 0xAAAAAAAAAAAAAAAALL;
    *(void *)v16.__opaque = 0xAAAAAAAAAAAAAAAALL;
    pthread_mutexattr_init(&v16);
    pthread_mutexattr_settype(&v16, 2);
    pthread_mutex_init(&v2->_lock, &v16);
    pthread_mutexattr_destroy(&v16);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x263F21098];
      v5 = *MEMORY[0x263F21098];
      if (*MEMORY[0x263F21088])
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v9 = v3;
          __int16 v10 = 2080;
          v11 = "-[GKSimpleTimer init]";
          __int16 v12 = 1024;
          int v13 = 34;
          __int16 v14 = 2048;
          v15 = v2;
          _os_log_impl(&dword_221563000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%p] simpletimer set up", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        [(GKSimpleTimer *)v3 init];
      }
    }
  }
  return v2;
}

- (void)dealloc
{
  timerSource = self->_timerSource;
  if (timerSource) {
    dispatch_source_cancel(timerSource);
  }
  pthread_mutex_destroy(&self->_lock);
  v4.receiver = self;
  v4.super_class = (Class)GKSimpleTimer;
  [(GKSimpleTimer *)&v4 dealloc];
}

- (void)setDelegate:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  self->_delegate = a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    objc_super v7 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136316162;
      uint64_t v9 = v6;
      __int16 v10 = 2080;
      v11 = "-[GKSimpleTimer setDelegate:]";
      __int16 v12 = 1024;
      int v13 = 48;
      __int16 v14 = 2048;
      v15 = self;
      __int16 v16 = 2048;
      id v17 = a3;
      _os_log_impl(&dword_221563000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%p] simpletimer setDelegate: [%p]", (uint8_t *)&v8, 0x30u);
    }
  }
  pthread_mutex_unlock(p_lock);
}

- (void)setTimer:(double)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  double v4 = self->_interval - (a3 - self->_startTime);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x263F21098];
    objc_super v7 = *MEMORY[0x263F21098];
    if (*MEMORY[0x263F21088])
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136316162;
        uint64_t v15 = v5;
        __int16 v16 = 2080;
        id v17 = "-[GKSimpleTimer setTimer:]";
        __int16 v18 = 1024;
        int v19 = 53;
        __int16 v20 = 2048;
        v21 = self;
        __int16 v22 = 2048;
        double v23 = v4;
        _os_log_impl(&dword_221563000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%p] simpletimer set timer: [%.3lf]", (uint8_t *)&v14, 0x30u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136316162;
      uint64_t v15 = v5;
      __int16 v16 = 2080;
      id v17 = "-[GKSimpleTimer setTimer:]";
      __int16 v18 = 1024;
      int v19 = 53;
      __int16 v20 = 2048;
      v21 = self;
      __int16 v22 = 2048;
      double v23 = v4;
      _os_log_debug_impl(&dword_221563000, v6, OS_LOG_TYPE_DEBUG, " [%s] %s:%d [%p] simpletimer set timer: [%.3lf]", (uint8_t *)&v14, 0x30u);
    }
  }
  double v8 = v4 + 0.05;
  if (v4 <= 0.0) {
    double v8 = 0.05;
  }
  double v9 = v8 * 0.25;
  double v10 = v8 * 0.25 * 1000000000.0;
  timerSource = self->_timerSource;
  dispatch_time_t v12 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  double v13 = 50000000.0;
  if (v9 <= 0.05) {
    double v13 = v10;
  }
  dispatch_source_set_timer(timerSource, v12, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)v13);
  self->_timerSourceSet = 1;
}

- (void)fireIn:(double)a3 fromNow:(double)a4
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  self->_startTime = a4;
  if (a3 >= 0.0) {
    self->_interval = a3;
  }
  if (!self->_timerSource)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    double v9 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, global_queue);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __32__GKSimpleTimer_fireIn_fromNow___block_invoke;
    handler[3] = &unk_2645B7C20;
    handler[4] = self;
    dispatch_source_set_event_handler(v9, handler);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __32__GKSimpleTimer_fireIn_fromNow___block_invoke_4;
    v10[3] = &unk_2645B7C20;
    v10[4] = v9;
    dispatch_source_set_cancel_handler(v9, v10);
    self->_timerSource = (OS_dispatch_source *)v9;
    dispatch_resume(v9);
LABEL_7:
    [(GKSimpleTimer *)self setTimer:a4];
    goto LABEL_8;
  }
  if (!self->_timerSourceSet) {
    goto LABEL_7;
  }
LABEL_8:
  pthread_mutex_unlock(p_lock);
}

uint64_t __32__GKSimpleTimer_fireIn_fromNow___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 8));
  *(unsigned char *)(*(void *)(a1 + 32) + 104) = 0;
  double v2 = micro();
  double v3 = v2 - *(double *)(*(void *)(a1 + 32) + 88);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void **)(a1 + 32);
      uint64_t v8 = v6[11];
      uint64_t v7 = v6[12];
      uint64_t v9 = v6[10];
      int v12 = 136316930;
      uint64_t v13 = v4;
      __int16 v14 = 2080;
      uint64_t v15 = "-[GKSimpleTimer fireIn:fromNow:]_block_invoke";
      __int16 v16 = 1024;
      int v17 = 81;
      __int16 v18 = 2048;
      int v19 = v6;
      __int16 v20 = 2048;
      uint64_t v21 = v8;
      __int16 v22 = 2048;
      double v23 = v3;
      __int16 v24 = 2048;
      uint64_t v25 = v7;
      __int16 v26 = 2048;
      uint64_t v27 = v9;
      _os_log_impl(&dword_221563000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%p] simpletimer fires? start[%.3lf] elapsed[%.3lf] fireIn[%.3lf] delegate=%p", (uint8_t *)&v12, 0x4Eu);
    }
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (v3 <= *(double *)(v10 + 96))
  {
    [(id)v10 setTimer:v2];
  }
  else if (*(double *)(v10 + 88) != 0.0 && *(void *)(v10 + 80))
  {
    *(void *)(v10 + 88) = 0;
    [*(id *)(*(void *)(a1 + 32) + 80) timeout:*(id *)(a1 + 32)];
  }
  return pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 8));
}

void __32__GKSimpleTimer_fireIn_fromNow___block_invoke_4(uint64_t a1)
{
}

- (void)invalidate
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      timerSource = self->_timerSource;
      int v10 = 136316162;
      uint64_t v11 = v4;
      __int16 v12 = 2080;
      uint64_t v13 = "-[GKSimpleTimer invalidate]";
      __int16 v14 = 1024;
      int v15 = 107;
      __int16 v16 = 2048;
      int v17 = self;
      __int16 v18 = 2048;
      int v19 = timerSource;
      _os_log_impl(&dword_221563000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%p] simpletimer invalidate (source=%p)", (uint8_t *)&v10, 0x30u);
    }
  }
  uint64_t v9 = self->_timerSource;
  p_timerSource = &self->_timerSource;
  uint64_t v7 = v9;
  if (v9) {
    dispatch_source_cancel(v7);
  }
  *p_timerSource = 0;
  p_timerSource[1] = 0;
  p_timerSource[2] = 0;
  pthread_mutex_unlock(p_lock);
}

- (GKSimpleTimerDelegate)delegate
{
  return (GKSimpleTimerDelegate *)self->_delegate;
}

- (double)interval
{
  return self->_interval;
}

- (void)init
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v3 = 136315906;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  uint64_t v6 = "-[GKSimpleTimer init]";
  __int16 v7 = 1024;
  int v8 = 34;
  __int16 v9 = 2048;
  uint64_t v10 = a2;
  _os_log_debug_impl(&dword_221563000, log, OS_LOG_TYPE_DEBUG, " [%s] %s:%d [%p] simpletimer set up", (uint8_t *)&v3, 0x26u);
}

@end