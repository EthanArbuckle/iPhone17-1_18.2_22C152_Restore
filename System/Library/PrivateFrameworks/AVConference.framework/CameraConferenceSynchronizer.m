@interface CameraConferenceSynchronizer
- (BOOL)shouldConferenceChangeCameraToCaptureSettings;
- (BOOL)shouldConferenceChangeCameraToPreviewSettings;
- (BOOL)shouldConferenceSendFirstRemoteFrameNotification;
- (CGSize)localPortraitAspectRatio;
- (CameraConferenceSynchronizer)init;
- (void)cameraSizeChangedTo:(CGSize)a3;
- (void)changeCameraToCaptureSettings:(double)a3 forced:(BOOL)a4;
- (void)dealloc;
- (void)notifyClientOfRemoteFrame:(double)a3;
- (void)reset;
- (void)scheduleCameraChangeToCaptureSettings:(id)a3;
- (void)scheduleCameraChangeToPreviewSettings;
- (void)scheduleFirstRemoteFrameNotification:(id)a3;
- (void)setLocalPortraitAspectRatio:(CGSize)a3;
@end

@implementation CameraConferenceSynchronizer

- (BOOL)shouldConferenceChangeCameraToCaptureSettings
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL receivedRequestToChangeCamera = self->receivedRequestToChangeCamera;
      BOOL isConference720p = self->isConference720p;
      BOOL isConferenceOniPad = self->isConferenceOniPad;
      BOOL receivedFirstRemoteFrame = self->receivedFirstRemoteFrame;
      int cameraHasChangedToCapture = self->cameraHasChangedToCapture;
      int didSendFirstRemoteFrameNotification = self->didSendFirstRemoteFrameNotification;
      int v17 = 136317186;
      uint64_t v18 = v5;
      __int16 v19 = 2080;
      v20 = "-[CameraConferenceSynchronizer shouldConferenceChangeCameraToCaptureSettings]";
      __int16 v21 = 1024;
      int v22 = 47;
      __int16 v23 = 1024;
      BOOL v24 = receivedRequestToChangeCamera;
      __int16 v25 = 1024;
      BOOL v26 = isConference720p;
      __int16 v27 = 1024;
      BOOL v28 = isConferenceOniPad;
      __int16 v29 = 1024;
      BOOL v30 = receivedFirstRemoteFrame;
      __int16 v31 = 1024;
      int v32 = cameraHasChangedToCapture;
      __int16 v33 = 1024;
      int v34 = didSendFirstRemoteFrameNotification;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %d %d %d %d %d %d", (uint8_t *)&v17, 0x40u);
    }
  }
  if (self->receivedRequestToChangeCamera)
  {
    if (self->isConference720p)
    {
      BOOL v13 = !self->isConferenceOniPad;
      if (self->isConferenceOniPad && self->didSendFirstRemoteFrameNotification) {
        BOOL v13 = 1;
      }
    }
    else
    {
      BOOL v13 = self->didSendFirstRemoteFrameNotification != 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315906;
      uint64_t v18 = v14;
      __int16 v19 = 2080;
      v20 = "-[CameraConferenceSynchronizer shouldConferenceChangeCameraToCaptureSettings]";
      __int16 v21 = 1024;
      int v22 = 59;
      __int16 v23 = 1024;
      BOOL v24 = v13;
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d returning %d", (uint8_t *)&v17, 0x22u);
    }
  }
  return v13;
}

- (BOOL)shouldConferenceSendFirstRemoteFrameNotification
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL receivedRequestToChangeCamera = self->receivedRequestToChangeCamera;
      BOOL isConference720p = self->isConference720p;
      BOOL isConferenceOniPad = self->isConferenceOniPad;
      BOOL receivedFirstRemoteFrame = self->receivedFirstRemoteFrame;
      int cameraHasChangedToCapture = self->cameraHasChangedToCapture;
      int didSendFirstRemoteFrameNotification = self->didSendFirstRemoteFrameNotification;
      int v17 = 136317186;
      uint64_t v18 = v5;
      __int16 v19 = 2080;
      v20 = "-[CameraConferenceSynchronizer shouldConferenceSendFirstRemoteFrameNotification]";
      __int16 v21 = 1024;
      int v22 = 67;
      __int16 v23 = 1024;
      BOOL v24 = receivedRequestToChangeCamera;
      __int16 v25 = 1024;
      BOOL v26 = isConference720p;
      __int16 v27 = 1024;
      BOOL v28 = isConferenceOniPad;
      __int16 v29 = 1024;
      BOOL v30 = receivedFirstRemoteFrame;
      __int16 v31 = 1024;
      int v32 = cameraHasChangedToCapture;
      __int16 v33 = 1024;
      int v34 = didSendFirstRemoteFrameNotification;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %d %d %d %d %d %d", (uint8_t *)&v17, 0x40u);
    }
  }
  if (self->receivedFirstRemoteFrame) {
    BOOL v13 = !self->isConference720p || self->isConferenceOniPad || self->cameraHasChangedToCapture != 0;
  }
  else {
    BOOL v13 = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315906;
      uint64_t v18 = v14;
      __int16 v19 = 2080;
      v20 = "-[CameraConferenceSynchronizer shouldConferenceSendFirstRemoteFrameNotification]";
      __int16 v21 = 1024;
      int v22 = 79;
      __int16 v23 = 1024;
      BOOL v24 = v13;
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d returning %d", (uint8_t *)&v17, 0x22u);
    }
  }
  return v13;
}

- (BOOL)shouldConferenceChangeCameraToPreviewSettings
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315906;
      uint64_t v6 = v2;
      __int16 v7 = 2080;
      v8 = "-[CameraConferenceSynchronizer shouldConferenceChangeCameraToPreviewSettings]";
      __int16 v9 = 1024;
      int v10 = 91;
      __int16 v11 = 1024;
      int v12 = 0;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d returning %d", (uint8_t *)&v5, 0x22u);
    }
  }
  return 0;
}

- (void)changeCameraToCaptureSettings:(double)a3 forced:(BOOL)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!self->cameraHasChangedToCapture)
  {
    BOOL v4 = a4;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        captureRule = self->captureRule;
        if (captureRule) {
          int v10 = [(NSString *)[(VCVideoRule *)captureRule description] UTF8String];
        }
        else {
          int v10 = "<nil>";
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v16 = v7;
        __int16 v17 = 2080;
        uint64_t v18 = "-[CameraConferenceSynchronizer changeCameraToCaptureSettings:forced:]";
        __int16 v19 = 1024;
        int v20 = 98;
        __int16 v21 = 2080;
        int v22 = v10;
        __int16 v23 = 2048;
        double v24 = a3;
        __int16 v25 = 1024;
        BOOL v26 = v4;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d scheduling camera change to %s in %g ms forced %d", buf, 0x36u);
      }
    }
    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(a3 * 1000000.0));
    global_queue = dispatch_get_global_queue(2, 0);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69__CameraConferenceSynchronizer_changeCameraToCaptureSettings_forced___block_invoke;
    v13[3] = &unk_1E6DB3DF0;
    v13[4] = self;
    BOOL v14 = v4;
    dispatch_after(v11, global_queue, v13);
  }
}

uint64_t __69__CameraConferenceSynchronizer_changeCameraToCaptureSettings_forced___block_invoke(uint64_t a1)
{
  id v2 = +[VCVideoCaptureServer VCVideoCaptureServerSingleton];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 24) iWidth];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 24) iHeight];
  [*(id *)(*(void *)(a1 + 32) + 24) fRate];
  uint64_t v6 = *(unsigned __int8 *)(a1 + 40);

  return [v2 setCaptureWidth:v3 height:v4 rate:(int)v5 forced:v6];
}

- (void)notifyClientOfRemoteFrame:(double)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->remoteFrameNotificationBlock)
  {
    int v4 = 0;
    atomic_compare_exchange_strong_explicit(&self->didSendFirstRemoteFrameNotification, (unsigned int *)&v4, 1u, memory_order_relaxed, memory_order_relaxed);
    if (!v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 136315906;
          uint64_t v11 = v6;
          __int16 v12 = 2080;
          uint64_t v13 = "-[CameraConferenceSynchronizer notifyClientOfRemoteFrame:]";
          __int16 v14 = 1024;
          int v15 = 114;
          __int16 v16 = 2048;
          double v17 = a3;
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d scheduling remote frame notification in %g ms", (uint8_t *)&v10, 0x26u);
        }
      }
      dispatch_time_t v8 = dispatch_time(0, (uint64_t)(a3 * 1000000.0));
      global_queue = dispatch_get_global_queue(2, 0);
      dispatch_after(v8, global_queue, self->remoteFrameNotificationBlock);
      _Block_release(self->remoteFrameNotificationBlock);
      self->remoteFrameNotificationBlock = 0;
    }
  }
}

- (CameraConferenceSynchronizer)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)CameraConferenceSynchronizer;
  id v2 = [(CameraConferenceSynchronizer *)&v4 init];
  if (v2) {
    v2->captureRule = objc_alloc_init(VCVideoRule);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  captureRule = self->captureRule;
  if (captureRule) {

  }
  self->captureRule = 0;
  id remoteFrameNotificationBlock = self->remoteFrameNotificationBlock;
  if (remoteFrameNotificationBlock) {
    _Block_release(remoteFrameNotificationBlock);
  }
  self->id remoteFrameNotificationBlock = 0;
  id didStopNotificationBlock = self->didStopNotificationBlock;
  if (didStopNotificationBlock) {
    _Block_release(didStopNotificationBlock);
  }
  self->id didStopNotificationBlock = 0;
  v6.receiver = self;
  v6.super_class = (Class)CameraConferenceSynchronizer;
  [(CameraConferenceSynchronizer *)&v6 dealloc];
}

- (void)reset
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    objc_super v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315650;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      __int16 v9 = "-[CameraConferenceSynchronizer reset]";
      __int16 v10 = 1024;
      int v11 = 158;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", (uint8_t *)&v6, 0x1Cu);
    }
  }
  self->int cameraHasChangedToCapture = 0;
  self->int didSendFirstRemoteFrameNotification = 0;
  uint64_t v5 = (CGSize *)MEMORY[0x1E4F1DB30];
  *(_DWORD *)&self->BOOL isConference720p = 0;
  self->localPortraitAspectRatio = *v5;
}

- (void)cameraSizeChangedTo:(CGSize)a3
{
  double height = a3.height;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3.width == (double)[(VCVideoRule *)self->captureRule iWidth]
    && height == (double)[(VCVideoRule *)self->captureRule iHeight])
  {
    int v5 = 0;
    atomic_compare_exchange_strong_explicit(&self->cameraHasChangedToCapture, (unsigned int *)&v5, 1u, memory_order_relaxed, memory_order_relaxed);
    if (!v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v8 = 136315650;
          uint64_t v9 = v6;
          __int16 v10 = 2080;
          int v11 = "-[CameraConferenceSynchronizer cameraSizeChangedTo:]";
          __int16 v12 = 1024;
          int v13 = 175;
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d done", (uint8_t *)&v8, 0x1Cu);
        }
      }
      if ([(CameraConferenceSynchronizer *)self shouldConferenceSendFirstRemoteFrameNotification])
      {
        [(CameraConferenceSynchronizer *)self notifyClientOfRemoteFrame:0.0];
      }
    }
  }
}

- (void)scheduleFirstRemoteFrameNotification:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315650;
        uint64_t v10 = v5;
        __int16 v11 = 2080;
        __int16 v12 = "-[CameraConferenceSynchronizer scheduleFirstRemoteFrameNotification:]";
        __int16 v13 = 1024;
        int v14 = 188;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", (uint8_t *)&v9, 0x1Cu);
      }
    }
    self->BOOL receivedFirstRemoteFrame = 1;
    id remoteFrameNotificationBlock = self->remoteFrameNotificationBlock;
    if (remoteFrameNotificationBlock) {
      _Block_release(remoteFrameNotificationBlock);
    }
    self->id remoteFrameNotificationBlock = _Block_copy(a3);
    if ([(CameraConferenceSynchronizer *)self shouldConferenceSendFirstRemoteFrameNotification])
    {
      [(CameraConferenceSynchronizer *)self notifyClientOfRemoteFrame:0.0];
    }
    if ([(CameraConferenceSynchronizer *)self shouldConferenceChangeCameraToCaptureSettings])
    {
      BOOL v8 = self->isConference720p && !self->isConferenceOniPad;
      [(CameraConferenceSynchronizer *)self changeCameraToCaptureSettings:v8 forced:0.0];
    }
  }
}

- (void)scheduleCameraChangeToPreviewSettings
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315650;
      uint64_t v5 = v2;
      __int16 v6 = 2080;
      uint64_t v7 = "-[CameraConferenceSynchronizer scheduleCameraChangeToPreviewSettings]";
      __int16 v8 = 1024;
      int v9 = 208;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NoOps", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (void)scheduleCameraChangeToCaptureSettings:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      __int16 v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315650;
        uint64_t v9 = v5;
        __int16 v10 = 2080;
        __int16 v11 = "-[CameraConferenceSynchronizer scheduleCameraChangeToCaptureSettings:]";
        __int16 v12 = 1024;
        int v13 = 216;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", (uint8_t *)&v8, 0x1Cu);
      }
    }
    [(VCVideoRule *)self->captureRule setToVideoRule:a3];
    self->BOOL receivedRequestToChangeCamera = 1;
    int v7 = [(VCVideoRule *)self->captureRule iWidth];
    self->BOOL isConference720p = [(VCVideoRule *)self->captureRule iHeight] * v7 == 921600;
    if ([(CameraConferenceSynchronizer *)self shouldConferenceSendFirstRemoteFrameNotification])
    {
      [(CameraConferenceSynchronizer *)self notifyClientOfRemoteFrame:0.0];
    }
    if ([(CameraConferenceSynchronizer *)self shouldConferenceChangeCameraToCaptureSettings])
    {
      [(CameraConferenceSynchronizer *)self changeCameraToCaptureSettings:1 forced:0.0];
    }
  }
}

- (void)setLocalPortraitAspectRatio:(CGSize)a3
{
  self->localPortraitAspectRatio = a3;
  self->BOOL isConferenceOniPad = a3.width / a3.height == 0.75;
}

- (CGSize)localPortraitAspectRatio
{
  double width = self->localPortraitAspectRatio.width;
  double height = self->localPortraitAspectRatio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end