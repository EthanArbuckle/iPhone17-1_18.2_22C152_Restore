@interface VCDisplayLink
- (BOOL)activate;
- (BOOL)ensureDisplayIsReady;
- (VCDisplayLink)initWithHandler:(id)a3 preferredFrameRate:(float)a4;
- (VCDisplayLink)initWithHandler:(id)a3 threadPriority:(unsigned int)a4 threadOptions:(unsigned int)a5 threadIdentifier:(id)a6 preferredFrameRate:(float)a7;
- (void)activate;
- (void)deactivate;
- (void)dealloc;
- (void)displayLinkTick:(id)a3;
- (void)ensureDisplayIsReady;
- (void)handleWaitToRunTimeout;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)runDisplayLinkThreadWithStopRequested:(BOOL *)a3;
@end

@implementation VCDisplayLink

- (VCDisplayLink)initWithHandler:(id)a3 preferredFrameRate:(float)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)VCDisplayLink;
  v6 = [(VCObject *)&v11 init];
  if (!v6) {
    return v6;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v13 = v7;
      __int16 v14 = 2080;
      v15 = "-[VCDisplayLink initWithHandler:preferredFrameRate:]";
      __int16 v16 = 1024;
      int v17 = 63;
      __int16 v18 = 2048;
      v19 = v6;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d initializing VCDisplayLink[%p]", buf, 0x26u);
    }
  }
  if (!a3)
  {

    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCDisplayLink initWithHandler:preferredFrameRate:]();
      }
    }
    return 0;
  }
  v6->_handler = _Block_copy(a3);
  v9 = (CADisplayLink *)(id)[MEMORY[0x1E4F39B68] displayLinkWithTarget:v6 selector:sel_displayLinkTick_];
  v6->_caDisplayLink = v9;
  if (!v9)
  {

    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCDisplayLink initWithHandler:preferredFrameRate:]();
      }
    }
    return 0;
  }
  if (a4 != 0.0)
  {
    CAFrameRateRange v21 = CAFrameRateRangeMake(a4, a4, a4);
    -[CADisplayLink setPreferredFrameRateRange:](v6->_caDisplayLink, "setPreferredFrameRateRange:", *(double *)&v21.minimum, *(double *)&v21.maximum, *(double *)&v21.preferred);
  }
  v6->_state = 1;
  return v6;
}

- (VCDisplayLink)initWithHandler:(id)a3 threadPriority:(unsigned int)a4 threadOptions:(unsigned int)a5 threadIdentifier:(id)a6 preferredFrameRate:(float)a7
{
  v10 = -[VCDisplayLink initWithHandler:preferredFrameRate:](self, "initWithHandler:preferredFrameRate:", a3);
  if (v10)
  {
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    v10->_waitToRunSemaphore = (OS_dispatch_semaphore *)v11;
    if (v11)
    {
      uint64_t v12 = VCRealTimeThread_Initialize(a4, (uint64_t)_VCDisplayLinkThread, (uint64_t)v10, (const char *)[a6 UTF8String], a5);
      v10->_thread = (tagVCRealTimeThread *)v12;
      if (v12)
      {
        if ([(VCDisplayLink *)v10 ensureDisplayIsReady]) {
          return v10;
        }
      }
      else
      {

        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCDisplayLink initWithHandler:threadPriority:threadOptions:threadIdentifier:preferredFrameRate:]();
          }
        }
      }
    }
    else
    {

      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCDisplayLink initWithHandler:threadPriority:threadOptions:threadIdentifier:preferredFrameRate:]();
        }
      }
    }
    return 0;
  }
  return v10;
}

- (BOOL)ensureDisplayIsReady
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)-[CADisplayLink display](self->_caDisplayLink, "display"), "refreshRate");
  double v4 = v3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315906;
      uint64_t v14 = v5;
      __int16 v15 = 2080;
      __int16 v16 = "-[VCDisplayLink ensureDisplayIsReady]";
      __int16 v17 = 1024;
      int v18 = 102;
      __int16 v19 = 2048;
      double v20 = v4;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d RefreshRate = %f", (uint8_t *)&v13, 0x26u);
    }
  }
  if (v4 != 0.0) {
    return 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315650;
      uint64_t v14 = v7;
      __int16 v15 = 2080;
      __int16 v16 = "-[VCDisplayLink ensureDisplayIsReady]";
      __int16 v17 = 1024;
      int v18 = 105;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Display is not ready, waiting", (uint8_t *)&v13, 0x1Cu);
    }
  }
  BOOL v9 = 1;
  objc_msgSend((id)-[CADisplayLink display](self->_caDisplayLink, "display"), "addObserver:forKeyPath:options:context:", self, @"refreshRate", 1, 0);
  dispatch_time_t v10 = dispatch_time(0, 1000000000);
  int v11 = dispatch_semaphore_wait((dispatch_semaphore_t)self->_waitToRunSemaphore, v10);
  objc_msgSend((id)-[CADisplayLink display](self->_caDisplayLink, "display"), "removeObserver:forKeyPath:", self, @"refreshRate");
  if (v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCDisplayLink ensureDisplayIsReady]();
      }
    }
    return 0;
  }
  return v9;
}

- (BOOL)activate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(VCObject *)self lock];
  if (self->_state == 1)
  {
    self->_unint64_t state = 2;
    thread = self->_thread;
    if (thread)
    {
      if ((VCRealTimeThread_Start((uint64_t)thread) & 1) == 0)
      {
        self->_unint64_t state = 1;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCDisplayLink activate]();
          }
        }
        goto LABEL_15;
      }
      dispatch_time_t v4 = dispatch_time(0, 1000000000);
      if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_waitToRunSemaphore, v4))
      {
        [(VCDisplayLink *)self handleWaitToRunTimeout];
LABEL_15:
        BOOL v7 = 0;
        goto LABEL_8;
      }
    }
    else
    {
      caDisplayLink = self->_caDisplayLink;
      uint64_t v6 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [(CADisplayLink *)caDisplayLink addToRunLoop:v6 forMode:*MEMORY[0x1E4F1C3A0]];
    }
    BOOL v7 = 1;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      goto LABEL_15;
    }
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    dispatch_time_t v10 = *MEMORY[0x1E4F47A50];
    BOOL v7 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unint64_t state = self->_state;
      int v12 = 136315906;
      uint64_t v13 = v9;
      __int16 v14 = 2080;
      __int16 v15 = "-[VCDisplayLink activate]";
      __int16 v16 = 1024;
      int v17 = 122;
      __int16 v18 = 2048;
      unint64_t v19 = state;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unexpected state %lu", (uint8_t *)&v12, 0x26u);
      goto LABEL_15;
    }
  }
LABEL_8:
  [(VCObject *)self unlock];
  return v7;
}

- (void)handleWaitToRunTimeout
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Timed out waiting for runLoop to run", v2, v3, v4, v5, v6);
}

- (void)deactivate
{
  [(VCObject *)self lock];
  if (self->_state == 2)
  {
    self->_unint64_t state = 3;
    [(CADisplayLink *)self->_caDisplayLink invalidate];
    if (self->_thread)
    {
      uint64_t v3 = [(NSRunLoop *)self->_runLoop getCFRunLoop];
      if (v3) {
        CFRunLoopStop(v3);
      }
      VCRealTimeThread_Finalize((uint64_t)self->_thread);
      self->_thread = 0;
    }
    id handler = self->_handler;
    if (handler)
    {
      _Block_release(handler);
      self->_id handler = 0;
    }
  }

  [(VCObject *)self unlock];
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v9 = v3;
      __int16 v10 = 2080;
      int v11 = "-[VCDisplayLink dealloc]";
      __int16 v12 = 1024;
      int v13 = 174;
      __int16 v14 = 2048;
      __int16 v15 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d dealloc VCDisplayLink[%p]", buf, 0x26u);
    }
  }
  [(VCDisplayLink *)self deactivate];
  thread = self->_thread;
  if (thread)
  {
    VCRealTimeThread_Finalize((uint64_t)thread);
    self->_thread = 0;
  }

  self->_caDisplayLink = 0;
  waitToRunSemaphore = self->_waitToRunSemaphore;
  if (waitToRunSemaphore) {
    dispatch_release(waitToRunSemaphore);
  }
  v7.receiver = self;
  v7.super_class = (Class)VCDisplayLink;
  [(VCObject *)&v7 dealloc];
}

- (void)runDisplayLinkThreadWithStopRequested:(BOOL *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_state == 2)
  {
    self->_runLoop = (NSRunLoop *)[MEMORY[0x1E4F1CAC0] currentRunLoop];
    waitToRunSemaphore = self->_waitToRunSemaphore;
    context.version = 0;
    context.info = waitToRunSemaphore;
    context.retain = (const void *(__cdecl *)(const void *))MEMORY[0x1E4F1C280];
    context.release = (void (__cdecl *)(const void *))MEMORY[0x1E4F1C278];
    context.copyDescription = 0;
    CFRunLoopObserverRef v6 = CFRunLoopObserverCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1uLL, 0, 0, (CFRunLoopObserverCallBack)_VCDisplayLinkRunLoopObserverCallBack, &context);
    if (v6)
    {
      objc_super v7 = v6;
      v8 = [(NSRunLoop *)self->_runLoop getCFRunLoop];
      CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F1D418];
      CFRunLoopAddObserver(v8, v7, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
      [(CADisplayLink *)self->_caDisplayLink addToRunLoop:self->_runLoop forMode:*MEMORY[0x1E4F1C3A0]];
      CFRunLoopRun();
      CFRunLoopRemoveObserver([(NSRunLoop *)self->_runLoop getCFRunLoop], v7, v9);
      CFRelease(v7);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        int v11 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v14 = v10;
          __int16 v15 = 2080;
          uint64_t v16 = "-[VCDisplayLink runDisplayLinkThreadWithStopRequested:]";
          __int16 v17 = 1024;
          int v18 = 211;
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Stopping VCDisplayLink thread", buf, 0x1Cu);
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCDisplayLink runDisplayLinkThreadWithStopRequested:]();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCDisplayLink runDisplayLinkThreadWithStopRequested:]();
    }
  }
  *a3 = 1;
}

- (void)displayLinkTick:(id)a3
{
  if (self->_handler)
  {
    [a3 timestamp];
    objc_msgSend(a3, "targetTimestamp", v5);
    [a3 duration];
    (*((void (**)(void))self->_handler + 2))();
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(a3, "isEqualToString:", @"refreshRate", a4, a5, a6))
  {
    objc_msgSend((id)-[CADisplayLink display](self->_caDisplayLink, "display"), "refreshRate");
    double v8 = v7;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315906;
        uint64_t v14 = v9;
        __int16 v15 = 2080;
        uint64_t v16 = "-[VCDisplayLink observeValueForKeyPath:ofObject:change:context:]";
        __int16 v17 = 1024;
        int v18 = 230;
        __int16 v19 = 2048;
        double v20 = v8;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d RefreshRate = %f", (uint8_t *)&v13, 0x26u);
      }
    }
    if (v8 == 0.0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        __int16 v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 136315650;
          uint64_t v14 = v11;
          __int16 v15 = 2080;
          uint64_t v16 = "-[VCDisplayLink observeValueForKeyPath:ofObject:change:context:]";
          __int16 v17 = 1024;
          int v18 = 234;
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Refresh rate still 0, continue to wait", (uint8_t *)&v13, 0x1Cu);
        }
      }
    }
    else
    {
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_waitToRunSemaphore);
    }
  }
}

- (void)initWithHandler:preferredFrameRate:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d nil displayLinkTickHandler", v2, v3, v4, v5, v6);
}

- (void)initWithHandler:preferredFrameRate:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create CADisplayLink", v2, v3, v4, v5, v6);
}

- (void)initWithHandler:threadPriority:threadOptions:threadIdentifier:preferredFrameRate:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d dispatch_semaphore_create failed", v2, v3, v4, v5, v6);
}

- (void)initWithHandler:threadPriority:threadOptions:threadIdentifier:preferredFrameRate:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCRealTimeThread_Initialize failed", v2, v3, v4, v5, v6);
}

- (void)ensureDisplayIsReady
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Timed out waiting for display refresh rate update", v2, v3, v4, v5, v6);
}

- (void)activate
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCRealTimeThread_Start failed", v2, v3, v4, v5, v6);
}

- (void)runDisplayLinkThreadWithStopRequested:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d CFRunLoopObserverCreate failed", v2, v3, v4, v5, v6);
}

- (void)runDisplayLinkThreadWithStopRequested:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Not activated", v2, v3, v4, v5, v6);
}

@end