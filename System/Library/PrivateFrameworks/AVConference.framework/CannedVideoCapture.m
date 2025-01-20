@interface CannedVideoCapture
+ (int)cannedVideoTypeForPath:(id)a3;
+ (int)createPixelBufferPool:(__CVPixelBufferPool *)a3 withWidth:(int)a4 height:(int)a5;
- (BOOL)cameraSupportsFormatWidth:(int)a3 height:(int)a4;
- (BOOL)isFrontCamera;
- (BOOL)isPortraitResolutionCaptureActive;
- (BOOL)isPreviewRunning;
- (CannedVideoCapture)initWithCaptureServer:(id)a3 protocolFunctions:(const tagVCVideoCaptureServerProtocolRealtimeInstanceVTable *)a4 width:(int)a5 height:(int)a6 frameRate:(int)a7 videoSourceToken:(_VCVideoSourceToken)a8 video:(id)a9 isCamera:(BOOL)a10 error:(int *)a11;
- (int)configureCaptureWithToken:(_VCVideoSourceToken)a3;
- (int)copyColorInfo:(const __CFDictionary *)a3;
- (int)frameBecameAvailableCount:(int *)a3 figBufferQueueEmptyCount:(int *)a4 figBufferQueueErrorCount:(int *)a5;
- (int)frameCount:(BOOL)a3;
- (int)getFrameRate;
- (int)setFrameRate:(int)a3;
- (int)setWidth:(int)a3 height:(int)a4 frameRate:(int)a5;
- (int)startCaptureWithWidth:(int)a3 height:(int)a4 frameRate:(int)a5;
- (int)startPreview;
- (int)stop:(BOOL)a3;
- (void)dealloc;
@end

@implementation CannedVideoCapture

- (CannedVideoCapture)initWithCaptureServer:(id)a3 protocolFunctions:(const tagVCVideoCaptureServerProtocolRealtimeInstanceVTable *)a4 width:(int)a5 height:(int)a6 frameRate:(int)a7 videoSourceToken:(_VCVideoSourceToken)a8 video:(id)a9 isCamera:(BOOL)a10 error:(int *)a11
{
  uint64_t v12 = *(void *)&a7;
  uint64_t v13 = *(void *)&a6;
  uint64_t v14 = *(void *)&a5;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316930;
      uint64_t v31 = v18;
      __int16 v32 = 2080;
      v33 = "-[CannedVideoCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:video:isCamera:error:]";
      __int16 v34 = 1024;
      int v35 = 63;
      __int16 v36 = 1024;
      int v37 = v14;
      __int16 v38 = 1024;
      int v39 = v13;
      __int16 v40 = 1024;
      int v41 = v12;
      __int16 v42 = 1024;
      $948446A44E2BC96870B572155DF52E0B var0 = a8.var0.var0;
      __int16 v44 = 2112;
      id v45 = a9;
      _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d width=%d, height=%d, frameRate=%d, sourceToken=0x%x, video=%@", buf, 0x3Eu);
    }
  }
  id v20 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  if (!v20)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[CannedVideoCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:video:isCamera:error:]();
      }
    }
    goto LABEL_32;
  }
  v29.receiver = self;
  v29.super_class = (Class)CannedVideoCapture;
  v21 = [(VCVideoCapture *)&v29 initWithCaptureServer:a3 protocolFunctions:a4];
  if (!v21)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[CannedVideoCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:video:isCamera:error:]();
      }
    }
    self = 0;
    goto LABEL_32;
  }
  self = v21;
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
  v23 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.CannedVideoCapture.captureSessionQueue", 0, CustomRootQueue);
  self->_captureSessionQueue = v23;
  if (!v23)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[CannedVideoCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:video:isCamera:error:]();
      }
    }
    goto LABEL_32;
  }
  v24 = [[VCCannedVideoCaptureSource alloc] initWithVideo:a9 callbackContext:self frameCallback:CannedVideoCapture_OnVideoFrame];
  self->_captureSource = v24;
  if (!v24)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[CannedVideoCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:video:isCamera:error:].cold.4();
      }
    }
    goto LABEL_32;
  }
  [(VCCannedVideoCaptureSource *)v24 setWidth:v14 height:v13];
  [(VCCannedVideoCaptureSource *)self->_captureSource setFrameRate:v12];
  v25 = (CannedVideoCapturePrivate *)malloc_type_calloc(1uLL, 0x60uLL, 0x10000402F8A9FFCuLL);
  self->_pimpl = v25;
  if (!v25)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[CannedVideoCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:video:isCamera:error:].cold.5();
      }
    }
LABEL_32:
    [v20 drain];

    return 0;
  }
  v25->var1 = a8;
  pimpl = self->_pimpl;
  if (a10) {
    int v27 = 0;
  }
  else {
    int v27 = 3;
  }
  pimpl->var4.$948446A44E2BC96870B572155DF52E0B var0 = a10;
  pimpl->var4.var1 = a10;
  *(_WORD *)(&pimpl->var4.var1 + 1) = -21846;
  pimpl->var4.var2 = v27;
  *(void *)&pimpl->var4.var3 = 2863267840;
  pimpl->var4.var6 = 0;
  *(_WORD *)(&pimpl->var4.var6 + 1) = -21846;
  *(&pimpl->var4.var6 + 3) = -86;
  if (a11) {
    *a11 = 0;
  }
  [v20 drain];
  return self;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  free(self->_pimpl);

  dispatch_release((dispatch_object_t)self->_captureSessionQueue);
  v3.receiver = self;
  v3.super_class = (Class)CannedVideoCapture;
  [(VCVideoCapture *)&v3 dealloc];
}

- (int)setWidth:(int)a3 height:(int)a4 frameRate:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  [(VCCannedVideoCaptureSource *)self->_captureSource setWidth:*(void *)&a3 height:*(void *)&a4];
  [(VCCannedVideoCaptureSource *)self->_captureSource setFrameRate:v5];
  [(VCVideoCaptureServer *)[(VCVideoCapture *)self captureServer] sourceFrameRateDidChange:v5];
  return 0;
}

- (int)copyColorInfo:(const __CFDictionary *)a3
{
  Mutable = CFDictionaryCreateMutable(0, 3, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!Mutable) {
    return -2146893820;
  }
  uint64_t v5 = Mutable;
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F44868], @"ITU_R_709_2");
  CFDictionaryAddValue(v5, (const void *)*MEMORY[0x1E4F44B58], @"ITU_R_709_2");
  CFDictionaryAddValue(v5, (const void *)*MEMORY[0x1E4F44BB0], @"ITU_R_709_2");
  int result = 0;
  if (a3) {
    *a3 = v5;
  }
  return result;
}

- (int)configureCaptureWithToken:(_VCVideoSourceToken)a3
{
  self->_pimpl->var1 = a3;
  return 0;
}

- (BOOL)isPreviewRunning
{
  return self->_pimpl->var3;
}

- (int)setFrameRate:(int)a3
{
  return 0;
}

- (int)getFrameRate
{
  return [(VCCannedVideoCaptureSource *)self->_captureSource frameRate];
}

- (int)startPreview
{
  v7[5] = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock(&self->_pimpl->var0);
  pimpl = self->_pimpl;
  if (pimpl->var3)
  {
    pthread_mutex_unlock(&pimpl->var0);
    return -2146893775;
  }
  else
  {
    pimpl->var3 = 1;
    int v5 = [(VCCannedVideoCaptureSource *)self->_captureSource start];
    captureSessionQueue = self->_captureSessionQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __34__CannedVideoCapture_startPreview__block_invoke;
    v7[3] = &unk_1E6DB3DC8;
    v7[4] = self;
    dispatch_async(captureSessionQueue, v7);
    pthread_mutex_unlock(&self->_pimpl->var0);
    return v5;
  }
}

uint64_t __34__CannedVideoCapture_startPreview__block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) captureServer];

  return [v1 handleCaptureEvent:@"avCaptureCameraDidStart"];
}

- (int)startCaptureWithWidth:(int)a3 height:(int)a4 frameRate:(int)a5
{
  [(CannedVideoCapture *)self setWidth:*(void *)&a3 height:*(void *)&a4 frameRate:*(void *)&a5];
  pthread_mutex_lock(&self->_pimpl->var0);
  int v6 = [(VCCannedVideoCaptureSource *)self->_captureSource start];
  pthread_mutex_unlock(&self->_pimpl->var0);
  return v6;
}

- (int)stop:(BOOL)a3
{
  BOOL v3 = a3;
  v10[5] = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock(&self->_pimpl->var0);
  pimpl = self->_pimpl;
  if (pimpl->var3 && !v3)
  {
    BOOL var3 = 1;
  }
  else
  {
    [(VCCannedVideoCaptureSource *)self->_captureSource stop];
    captureSessionQueue = self->_captureSessionQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __27__CannedVideoCapture_stop___block_invoke;
    v10[3] = &unk_1E6DB3DC8;
    v10[4] = self;
    dispatch_async(captureSessionQueue, v10);
    pimpl = self->_pimpl;
    BOOL var3 = pimpl->var3;
  }
  pimpl->BOOL var3 = var3 && !v3;
  pthread_mutex_unlock(&pimpl->var0);
  return 0;
}

uint64_t __27__CannedVideoCapture_stop___block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) captureServer];

  return [v1 handleCaptureEvent:@"avCaptureCameraDidStop"];
}

- (BOOL)isFrontCamera
{
  return 1;
}

- (BOOL)cameraSupportsFormatWidth:(int)a3 height:(int)a4
{
  return 0;
}

- (int)frameBecameAvailableCount:(int *)a3 figBufferQueueEmptyCount:(int *)a4 figBufferQueueErrorCount:(int *)a5
{
  return 16;
}

- (BOOL)isPortraitResolutionCaptureActive
{
  return 0;
}

- (int)frameCount:(BOOL)a3
{
  return 0;
}

+ (int)cannedVideoTypeForPath:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:"), "scheme")) {
    return 2;
  }
  char v5 = 0;
  int result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:isDirectory:", a3, &v5);
  if (!v5) {
    return 0;
  }
  return result;
}

+ (int)createPixelBufferPool:(__CVPixelBufferPool *)a3 withWidth:(int)a4 height:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  v13[4] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F24E10];
  v13[0] = [NSNumber numberWithInt:*(void *)&a4];
  v12[1] = *MEMORY[0x1E4F24D08];
  v13[1] = [NSNumber numberWithInt:v5];
  v12[2] = *MEMORY[0x1E4F24D70];
  v13[2] = [NSNumber numberWithUnsignedInt:*(unsigned int *)"v024"];
  v12[3] = *MEMORY[0x1E4F24D20];
  uint64_t v7 = *MEMORY[0x1E4F2F128];
  v10[0] = *MEMORY[0x1E4F2F0F8];
  v10[1] = v7;
  v11[0] = MEMORY[0x1E4F1CC38];
  v11[1] = @"AVConference:CannedVideo";
  v13[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  CFDictionaryRef v8 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];
  return CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, v8, a3);
}

- (void)initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:video:isCamera:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate autorelease pool", v2, v3, v4, v5, v6);
}

- (void)initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:video:isCamera:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initialize self", v2, v3, v4, v5, v6);
}

- (void)initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:video:isCamera:error:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create capture session queue", v2, v3, v4, v5, v6);
}

- (void)initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:video:isCamera:error:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to init capture source", v2, v3, v4, v5, v6);
}

- (void)initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:video:isCamera:error:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate canned video capture implementation", v2, v3, v4, v5, v6);
}

@end