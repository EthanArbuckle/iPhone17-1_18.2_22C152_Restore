@interface VCScreenCaptureFigCaptureController
- (VCScreenCaptureFigCaptureController)initWithDelegate:(id)a3 screenCaptureSourceContext:(const _VCScreenCaptureSourceContext *)a4;
- (int)pauseScreenCapture:(BOOL)a3;
- (int)startScreenCaptureWithConfig:(id)a3;
- (int)stopScreenCapture;
- (void)callbackWithEventString:(id)a3;
- (void)dealloc;
- (void)finalize;
- (void)screenCaptureController:(id)a3 didFailWithStatus:(int)a4;
- (void)screenCaptureController:(id)a3 didReceiveSampleBuffer:(opaqueCMSampleBuffer *)a4 transformFlags:(unint64_t)a5;
- (void)screenCaptureControllerDidReceiveClearScreen:(id)a3;
- (void)screenCaptureControllerMediaServicesWereReset:(id)a3;
- (void)screenCaptureControllerWasPreempted:(id)a3;
- (void)setIsRunning:(BOOL)a3;
- (void)shouldClearScreen:(BOOL)a3;
@end

@implementation VCScreenCaptureFigCaptureController

- (VCScreenCaptureFigCaptureController)initWithDelegate:(id)a3 screenCaptureSourceContext:(const _VCScreenCaptureSourceContext *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v13 = v7;
      __int16 v14 = 2080;
      v15 = "-[VCScreenCaptureFigCaptureController initWithDelegate:screenCaptureSourceContext:]";
      __int16 v16 = 1024;
      int v17 = 40;
      __int16 v18 = 2112;
      id v19 = a3;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d inDelegate=%@", buf, 0x26u);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)VCScreenCaptureFigCaptureController;
  v9 = [(VCObject *)&v11 init];
  if (v9)
  {
    v9->_delegate = (VCScreenCaptureSourceDelegate *)a3;
    v9->_frameCallback = *a4;
    pthread_mutex_init(&v9->_stateMutex, 0);
    v9->_isRunning = 0;
  }
  return v9;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  pthread_mutex_destroy(&self->_stateMutex);
  v3.receiver = self;
  v3.super_class = (Class)VCScreenCaptureFigCaptureController;
  [(VCObject *)&v3 dealloc];
}

- (int)startScreenCaptureWithConfig:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315906;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      v12 = "-[VCScreenCaptureFigCaptureController startScreenCaptureWithConfig:]";
      __int16 v13 = 1024;
      int v14 = 56;
      __int16 v15 = 2112;
      id v16 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Starting with config=%@", (uint8_t *)&v9, 0x26u);
    }
  }
  captureControllerSession = self->_captureControllerSession;
  if (!captureControllerSession)
  {
    captureControllerSession = (FigScreenCaptureController *)(id)[MEMORY[0x1E4F31B08] screenCaptureControllerWithFigVirtualDisplayOptions:a3];
    self->_captureControllerSession = captureControllerSession;
  }
  [(FigScreenCaptureController *)captureControllerSession setDelegate:self];
  [(FigScreenCaptureController *)self->_captureControllerSession startCapture];
  [(VCScreenCaptureFigCaptureController *)self setIsRunning:1];
  return 0;
}

- (int)stopScreenCapture
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315650;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      int v9 = "-[VCScreenCaptureFigCaptureController stopScreenCapture]";
      __int16 v10 = 1024;
      int v11 = 67;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Stopping", (uint8_t *)&v6, 0x1Cu);
    }
  }
  if (self->_captureControllerSession)
  {
    [(VCScreenCaptureFigCaptureController *)self setIsRunning:0];
    [(FigScreenCaptureController *)self->_captureControllerSession stopCapture];
    [(FigScreenCaptureController *)self->_captureControllerSession setDelegate:0];

    self->_captureControllerSession = 0;
  }
  return 0;
}

- (int)pauseScreenCapture:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = "Resuming";
      uint64_t v10 = v5;
      int v9 = 136315906;
      uint64_t v12 = "-[VCScreenCaptureFigCaptureController pauseScreenCapture:]";
      __int16 v11 = 2080;
      if (v3) {
        uint64_t v7 = "Pausing";
      }
      __int16 v13 = 1024;
      int v14 = 79;
      __int16 v15 = 2080;
      id v16 = v7;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d shouldPause=%s", (uint8_t *)&v9, 0x26u);
    }
  }
  if (v3)
  {
    [(VCScreenCaptureFigCaptureController *)self setIsRunning:0];
    [(FigScreenCaptureController *)self->_captureControllerSession suspendCapture];
  }
  else
  {
    [(VCScreenCaptureFigCaptureController *)self setIsRunning:1];
    [(FigScreenCaptureController *)self->_captureControllerSession resumeCapture];
  }
  return 0;
}

- (void)finalize
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      __int16 v8 = "-[VCScreenCaptureFigCaptureController finalize]";
      __int16 v9 = 1024;
      int v10 = 91;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Finalizing", (uint8_t *)&v5, 0x1Cu);
    }
  }
  [(VCScreenCaptureFigCaptureController *)self stopScreenCapture];

  self->_delegate = 0;
  self->_frameCallback.sinkContext = 0;
  self->_frameCallback.sinkCallback = 0;
}

- (void)setIsRunning:(BOOL)a3
{
  p_stateMutex = &self->_stateMutex;
  pthread_mutex_lock(&self->_stateMutex);
  self->_isRunning = a3;

  pthread_mutex_unlock(p_stateMutex);
}

- (void)screenCaptureController:(id)a3 didReceiveSampleBuffer:(opaqueCMSampleBuffer *)a4 transformFlags:(unint64_t)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  p_stateMutex = &self->_stateMutex;
  pthread_mutex_lock(&self->_stateMutex);
  BOOL isRunning = self->_isRunning;
  if (!a4
    || ((sinkCallback = (void (*)(void *, opaqueCMSampleBuffer *, unint64_t))self->_frameCallback.sinkCallback,
         self->_isRunning)
      ? (BOOL v11 = sinkCallback == 0)
      : (BOOL v11 = 1),
        v11))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      __int16 v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136315906;
        uint64_t v17 = v12;
        __int16 v18 = 2080;
        id v19 = "-[VCScreenCaptureFigCaptureController screenCaptureController:didReceiveSampleBuffer:transformFlags:]";
        __int16 v20 = 1024;
        int v21 = 119;
        __int16 v22 = 1024;
        BOOL v23 = isRunning;
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Callback is missing a sample buffer, isRunning=%d", (uint8_t *)&v16, 0x22u);
      }
    }
  }
  else
  {
    sinkCallback(self->_frameCallback.sinkContext, a4, a5);
    if (self->_shouldClearScreen)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        __int16 v15 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 136315650;
          uint64_t v17 = v14;
          __int16 v18 = 2080;
          id v19 = "-[VCScreenCaptureFigCaptureController screenCaptureController:didReceiveSampleBuffer:transformFlags:]";
          __int16 v20 = 1024;
          int v21 = 114;
          _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Clear screen state unset", (uint8_t *)&v16, 0x1Cu);
        }
      }
      self->_shouldClearScreen = 0;
      [(VCScreenCaptureFigCaptureController *)self shouldClearScreen:0];
    }
  }
  pthread_mutex_unlock(p_stateMutex);
}

- (void)screenCaptureController:(id)a3 didFailWithStatus:(int)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    __int16 v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315906;
      uint64_t v9 = v6;
      __int16 v10 = 2080;
      BOOL v11 = "-[VCScreenCaptureFigCaptureController screenCaptureController:didFailWithStatus:]";
      __int16 v12 = 1024;
      int v13 = 125;
      __int16 v14 = 1024;
      int v15 = a4;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d didStart with status=%d", (uint8_t *)&v8, 0x22u);
    }
  }
  if (a4)
  {
    [(VCScreenCaptureFigCaptureController *)self setIsRunning:0];
    [(VCScreenCaptureFigCaptureController *)self callbackWithEventString:@"vcScreenCaptureFailStart"];
  }
}

- (void)screenCaptureControllerWasPreempted:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    int v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315650;
      uint64_t v7 = v4;
      __int16 v8 = 2080;
      uint64_t v9 = "-[VCScreenCaptureFigCaptureController screenCaptureControllerWasPreempted:]";
      __int16 v10 = 1024;
      int v11 = 135;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Was preempted", (uint8_t *)&v6, 0x1Cu);
    }
  }
  [(VCScreenCaptureFigCaptureController *)self callbackWithEventString:@"vcScreenCaptureFailPreempt"];
}

- (void)screenCaptureControllerMediaServicesWereReset:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  p_stateMutex = &self->_stateMutex;
  pthread_mutex_lock(&self->_stateMutex);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315650;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      __int16 v10 = "-[VCScreenCaptureFigCaptureController screenCaptureControllerMediaServicesWereReset:]";
      __int16 v11 = 1024;
      int v12 = 141;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Services were reset", (uint8_t *)&v7, 0x1Cu);
    }
  }
  if (VCFeatureFlagManager_DaemonCrashRecovery())
  {
    if (self->_isRunning)
    {
      [(FigScreenCaptureController *)self->_captureControllerSession stopCapture];
      [(FigScreenCaptureController *)self->_captureControllerSession startCapture];
    }
  }
  else
  {
    [(VCScreenCaptureFigCaptureController *)self callbackWithEventString:@"vcScreenCaptureFailServerDied"];
  }
  pthread_mutex_unlock(p_stateMutex);
}

- (void)screenCaptureControllerDidReceiveClearScreen:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315650;
      uint64_t v7 = v4;
      __int16 v8 = 2080;
      __int16 v9 = "-[VCScreenCaptureFigCaptureController screenCaptureControllerDidReceiveClearScreen:]";
      __int16 v10 = 1024;
      int v11 = 155;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Clear screen state set", (uint8_t *)&v6, 0x1Cu);
    }
  }
  self->_shouldClearScreen = 1;
  [(VCScreenCaptureFigCaptureController *)self shouldClearScreen:1];
}

- (void)shouldClearScreen:(BOOL)a3
{
  delegate = self->_delegate;
  if (delegate) {
    [(VCScreenCaptureSourceDelegate *)delegate screenCaptureSourceShouldClearScreen:a3];
  }
}

- (void)callbackWithEventString:(id)a3
{
  delegate = self->_delegate;
  if (delegate) {
    [(VCScreenCaptureSourceDelegate *)delegate screenCaptureSourceProcessEventString:a3];
  }
}

@end