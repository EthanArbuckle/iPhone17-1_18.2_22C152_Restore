@interface VCImageQueue
+ (id)drawingContext;
+ (void)drawingContext;
- (BOOL)createAllocators;
- (BOOL)imageQueueProtected;
- (BOOL)isExternalCamera;
- (BOOL)isLayerHostMode;
- (BOOL)isLowLatencyEnabled;
- (BOOL)isTransformForRemoteVideoOrientationEnabled;
- (BOOL)usingRemoteQueue;
- (NSString)description;
- (OS_xpc_object)endpointID;
- (VCImageQueue)initWithFrameRate:(unsigned __int8)a3;
- (VCImageQueue)initWithFrameRate:(unsigned __int8)a3 imageQueueProtected:(BOOL)a4;
- (VCImageQueue)initWithFrameRate:(unsigned __int8)a3 imageQueueProtected:(BOOL)a4 vcImageQueueConfig:(const tagVCImageQueueConfig *)a5;
- (VCStreamOutput)streamOutput;
- (int)frameCount;
- (int64_t)streamToken;
- (unsigned)createCAContextWithSize:(CGRect)a3;
- (unsigned)frameRate;
- (unsigned)setVideoDestination:(id)a3;
- (void)cleanupCAContextAndCALayer;
- (void)cleanupVideoTargetAndImageQueue;
- (void)configureCALayerWithRect:(CGRect)a3 name:(id)a4;
- (void)createAndCopyLatencyStatsDictionary:(const __CFDictionary *)a3;
- (void)createAndCopyPerformanceDictionary:(const __CFDictionary *)a3;
- (void)createSlotAndConnectCAQueue;
- (void)dealloc;
- (void)getQueueRepresentation:(void *)a3;
- (void)pause;
- (void)releaseAllocators;
- (void)releaseSlot;
- (void)resetFrameCount;
- (void)setEndpointID:(id)a3;
- (void)setFrameRate:(unsigned int)a3;
- (void)setHostTimeTimebaseOnFigImageQueue:(OpaqueFigImageQueue *)a3;
- (void)setImageQueueProtected:(BOOL)a3;
- (void)setIsExternalCamera:(BOOL)a3;
- (void)setLayerHostMode:(BOOL)a3;
- (void)setLowLatencyEnabled:(BOOL)a3;
- (void)setStreamOutput:(id)a3;
- (void)setStreamToken:(int64_t)a3;
- (void)setTransformForRemoteVideoOrientationEnabled:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation VCImageQueue

- (NSString)description
{
  endpointID = self->_endpointID;
  if (endpointID) {
    return (NSString *)[NSString stringWithFormat:@"VCImageQueue=%p FigEndpointID=%p FigVideoTarget=%p FigImageQueue=%p frameRate=%u imageQueueProtected=%d isLowLatencyEnabled=%d enqueuedFrameCount=%u, transformForRemoteVideoOrientationEnabled=%u", self, endpointID, self->_videoTarget, self->_videoTargetImageQueue, self->_frameRate, self->_imageQueueProtected, self->_isLowLatencyEnabled, self->_enqueuedFrameCount, self->_transformForRemoteVideoOrientationEnabled];
  }
  else {
    return (NSString *)[NSString stringWithFormat:@"VCImageQueue=%p FigImageQueue=%p CAImageQueue=%p slot=%u frameRate=%u imageQueueProtected=%d isLowLatencyEnabled=%d enqueuedFrameCount=%u, transformForRemoteVideoOrientationEnabled=%u", self, self->_figQueue, self->_caQueue, self->_slot, self->_frameRate, self->_imageQueueProtected, self->_isLowLatencyEnabled, self->_enqueuedFrameCount, self->_transformForRemoteVideoOrientationEnabled];
  }
}

- (void)setFrameRate:(unsigned int)a3
{
  self->_frameRate = a3;
}

- (unsigned)frameRate
{
  return self->_frameRate;
}

- (void)start
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d ", v2, v3, v4, v5, v6);
}

- (void)setIsExternalCamera:(BOOL)a3
{
  self->_isExternalCamera = a3;
}

- (void)resetFrameCount
{
}

- (int)frameCount
{
  return atomic_load((unsigned int *)&self->_frameCount);
}

- (unsigned)setVideoDestination:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ((VCImageQueue *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E4F47A50];
      v8 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v25 = v6;
          __int16 v26 = 2080;
          v27 = "-[VCImageQueue setVideoDestination:]";
          __int16 v28 = 1024;
          int v29 = 634;
          v9 = " [%s] %s:%d ";
          v10 = v7;
          uint32_t v11 = 28;
          goto LABEL_13;
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        -[VCImageQueue setVideoDestination:]();
        if (!a3) {
          goto LABEL_14;
        }
        goto LABEL_24;
      }
    }
    goto LABEL_23;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v5 = (__CFString *)[(VCImageQueue *)self performSelector:sel_logPrefix];
  }
  else {
    uint64_t v5 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 8)
  {
LABEL_23:
    if (!a3) {
      goto LABEL_14;
    }
LABEL_24:
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __36__VCImageQueue_setVideoDestination___block_invoke;
    v23[3] = &unk_1E6DB3E40;
    v23[4] = a3;
    v23[5] = self;
    dispatch_async(MEMORY[0x1E4F14428], v23);
    return 0;
  }
  uint64_t v12 = VRTraceErrorLogLevelToCSTR();
  v13 = *MEMORY[0x1E4F47A50];
  v14 = *MEMORY[0x1E4F47A50];
  if (!*MEMORY[0x1E4F47A40])
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v25 = v12;
      __int16 v26 = 2080;
      v27 = "-[VCImageQueue setVideoDestination:]";
      __int16 v28 = 1024;
      int v29 = 634;
      __int16 v30 = 2112;
      *(void *)v31 = v5;
      *(_WORD *)&v31[8] = 2048;
      v32 = self;
      _os_log_debug_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) ", buf, 0x30u);
      if (!a3) {
        goto LABEL_14;
      }
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_23;
  }
  *(_DWORD *)buf = 136316162;
  uint64_t v25 = v12;
  __int16 v26 = 2080;
  v27 = "-[VCImageQueue setVideoDestination:]";
  __int16 v28 = 1024;
  int v29 = 634;
  __int16 v30 = 2112;
  *(void *)v31 = v5;
  *(_WORD *)&v31[8] = 2048;
  v32 = self;
  v9 = " [%s] %s:%d %@(%p) ";
  v10 = v13;
  uint32_t v11 = 48;
LABEL_13:
  _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
  if (a3) {
    goto LABEL_24;
  }
LABEL_14:
  uint64_t v15 = 168;
  if (!self->_layerHostMode) {
    uint64_t v15 = 104;
  }
  unsigned int v16 = *(_DWORD *)((char *)&self->super.isa + v15);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL layerHostMode = self->_layerHostMode;
      unsigned int slot = self->_slot;
      unsigned int contextId = self->_contextId;
      *(_DWORD *)buf = 136316418;
      uint64_t v25 = v17;
      __int16 v26 = 2080;
      v27 = "-[VCImageQueue setVideoDestination:]";
      __int16 v28 = 1024;
      int v29 = 645;
      __int16 v30 = 1024;
      *(_DWORD *)v31 = layerHostMode;
      *(_WORD *)&v31[4] = 1024;
      *(_DWORD *)&v31[6] = slot;
      LOWORD(v32) = 1024;
      *(_DWORD *)((char *)&v32 + 2) = contextId;
      _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d layer host mode=%d slot=%u context=%u", buf, 0x2Eu);
    }
  }
  return v16;
}

- (VCImageQueue)initWithFrameRate:(unsigned __int8)a3 imageQueueProtected:(BOOL)a4 vcImageQueueConfig:(const tagVCImageQueueConfig *)a5
{
  BOOL v6 = a4;
  unsigned int v7 = a3;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCImageQueue-init");
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v10 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 6)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v55 = v11;
      __int16 v56 = 2080;
      v57 = "-[VCImageQueue initWithFrameRate:imageQueueProtected:vcImageQueueConfig:]";
      __int16 v58 = 1024;
      int v59 = 244;
      __int16 v60 = 1024;
      *(_DWORD *)v61 = v7;
      *(_WORD *)&v61[4] = 1024;
      *(_DWORD *)&v61[6] = v6;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCImageQueue-init frameRate=%d imageQueueProtected=%d", buf, 0x28u);
    }
  }
  v53.receiver = self;
  v53.super_class = (Class)VCImageQueue;
  v13 = [(VCImageQueue *)&v53 init];
  +[VCDefaults integerValueForKey:@"caImageQueueCapacity" defaultValue:16];
  v13->_caQueue = (_CAImageQueue *)CAImageQueueCreate();
  v13->_imageQueueProtected = v6;
  if (v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v55 = v14;
        __int16 v56 = 2080;
        v57 = "-[VCImageQueue initWithFrameRate:imageQueueProtected:vcImageQueueConfig:]";
        __int16 v58 = 1024;
        int v59 = 252;
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting kCAImageQueueProtected to CAImageQueue", buf, 0x1Cu);
      }
    }
    CAImageQueueSetFlags();
  }
  CAImageQueueSetFlags();
  CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  FigImageQueueCreateForCoreAnimation();
  pthread_mutex_init(&v13->_enqueueLock, 0);
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
  v13->_stateQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCImageQueue.streamTokenQueue", 0, CustomRootQueue);
  [(VCImageQueue *)v13 setHostTimeTimebaseOnFigImageQueue:v13->_figQueue];
  figQueue = v13->_figQueue;
  uint64_t v19 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v19) {
    uint64_t v20 = v19;
  }
  else {
    uint64_t v20 = 0;
  }
  v21 = *(void (**)(OpaqueFigImageQueue *, void))(v20 + 40);
  if (v21) {
    v21(figQueue, 0);
  }
  CAImageQueueSetFlags();
  uint64_t FigBaseObject = FigImageQueueGetFigBaseObject();
  uint64_t v23 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v23) {
    uint64_t v24 = v23;
  }
  else {
    uint64_t v24 = 0;
  }
  uint64_t v25 = *(void (**)(uint64_t, void, __CFString *))(v24 + 56);
  if (v25) {
    v25(FigBaseObject, *MEMORY[0x1E4F32F38], @"None");
  }
  uint64_t v26 = FigImageQueueGetFigBaseObject();
  uint64_t v27 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v27) {
    uint64_t v28 = v27;
  }
  else {
    uint64_t v28 = 0;
  }
  int v29 = *(void (**)(uint64_t, void, void))(v28 + 56);
  if (v29) {
    v29(v26, *MEMORY[0x1E4F32F30], *MEMORY[0x1E4F1CFD0]);
  }
  [(VCImageQueue *)v13 createAllocators];
  v13->_unsigned int slot = 0;
  v13->_frameRate = v7;
  v13->_frameCount = 0;
  v13->_frameCountHistory = CFArrayCreateMutable(v16, 10, MEMORY[0x1E4F1D510]);
  if (a5
    && (v13->_BOOL isLocalVideo = a5->var2,
        v13->_BOOL isExternalCamera = a5->var3,
        BOOL var0 = a5->var0,
        v13->_BOOL layerHostMode = var0,
        v13->_cameraFacing = a5->var4,
        var0))
  {
    -[VCImageQueue createCAContextWithSize:](v13, "createCAContextWithSize:", a5->var1.origin.x, a5->var1.origin.y, a5->var1.size.width, a5->var1.size.height);
  }
  else
  {
    [MEMORY[0x1E4F39CF8] begin];
    [(VCImageQueue *)v13 createSlotAndConnectCAQueue];
    [MEMORY[0x1E4F39CF8] commit];
  }
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCImageQueue-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v31 = VRTraceErrorLogLevelToCSTR();
    v32 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      caQueue = v13->_caQueue;
      uint64_t v33 = v13->_figQueue;
      unsigned int slot = v13->_slot;
      BOOL layerHostMode = v13->_layerHostMode;
      BOOL isLocalVideo = v13->_isLocalVideo;
      BOOL isExternalCamera = v13->_isExternalCamera;
      *(_DWORD *)buf = 136317442;
      uint64_t v55 = v31;
      __int16 v56 = 2080;
      v57 = "-[VCImageQueue initWithFrameRate:imageQueueProtected:vcImageQueueConfig:]";
      __int16 v58 = 1024;
      int v59 = 297;
      __int16 v60 = 2048;
      *(void *)v61 = v13;
      *(_WORD *)&v61[8] = 2048;
      v62 = v33;
      __int16 v63 = 2048;
      v64 = caQueue;
      __int16 v65 = 1024;
      unsigned int v66 = slot;
      __int16 v67 = 1024;
      BOOL v68 = layerHostMode;
      __int16 v69 = 1024;
      BOOL v70 = isLocalVideo;
      __int16 v71 = 1024;
      BOOL v72 = isExternalCamera;
      _os_log_impl(&dword_1E1EA4000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCImageQueue-init VCImageQueue=%p FigImageQueue=%p CAImageQueue=%p, slot=%u, layerHostMode=%d localVideo=%d externalCamera=%d", buf, 0x52u);
    }
  }
  v39 = (long long *)MEMORY[0x1E4F39B10];
  __asm { FMOV            V0.2D, #1.0 }
  long long v45 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  long long v46 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  long long v47 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  *(_OWORD *)&v13->_transform.m33 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&v13->_transform.m41 = v46;
  *(_OWORD *)&v13->_transform.m43 = v47;
  long long v48 = *v39;
  long long v49 = v39[1];
  v13->_contentsRect.size = _Q0;
  *(_OWORD *)&v13->_transform.m11 = v48;
  long long v50 = v39[2];
  long long v51 = v39[3];
  *(_OWORD *)&v13->_transform.m13 = v49;
  *(_OWORD *)&v13->_transform.m21 = v50;
  v13->_contentsRect.origin.x = 0.0;
  v13->_contentsRect.origin.y = 0.0;
  v13->_transformForRemoteVideoOrientationEnabled = 1;
  *(_OWORD *)&v13->_transform.m23 = v51;
  *(_OWORD *)&v13->_transform.m31 = v45;
  pthread_cond_init(&v13->_waitForLayoutChangeCondition, 0);
  return v13;
}

- (void)createSlotAndConnectCAQueue
{
  id v3 = +[VCImageQueue drawingContext];
  uint64_t v4 = v3;
  uint64_t slot = self->_slot;
  if (!slot)
  {
    uint64_t slot = [v3 createSlot];
    self->_uint64_t slot = slot;
  }
  caQueue = self->_caQueue;

  [v4 setObject:caQueue forSlot:slot];
}

- (BOOL)createAllocators
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12[0] = xmmword_1E259FA40;
  v12[1] = unk_1E259FA50;
  int v2 = VCAllocatorMultiQueue_Create((const __CFAllocator *)*MEMORY[0x1E4F1CF80], (uint64_t)"StreamOutputAllocator", 4u, (unint64_t *)v12, &self->_streamOutputAllocator);
  if (v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315650;
        uint64_t v7 = v3;
        __int16 v8 = 2080;
        v9 = "-[VCImageQueue createAllocators]";
        __int16 v10 = 1024;
        int v11 = 551;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to create stream input allocator", (uint8_t *)&v6, 0x1Cu);
      }
    }
  }
  return v2 == 0;
}

+ (id)drawingContext
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v3 = (void *)sContext;
  objc_sync_enter((id)sContext);
  if (!sContext) {
    goto LABEL_14;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    int v6 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v21 = 136315650;
        *(void *)&v21[4] = v4;
        *(_WORD *)&v21[12] = 2080;
        *(void *)&v21[14] = "+[VCImageQueue drawingContext]";
        *(_WORD *)&v21[22] = 1024;
        *(_DWORD *)v22 = 138;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d drawingContext sContext is not Null", v21, 0x1Cu);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      +[VCImageQueue drawingContext]();
    }
  }
  [MEMORY[0x1E4F39CF8] synchronize];
  if (([(id)sContext valid] & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      __int16 v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v21 = 136315650;
        *(void *)&v21[4] = v7;
        *(_WORD *)&v21[12] = 2080;
        *(void *)&v21[14] = "+[VCImageQueue drawingContext]";
        *(_WORD *)&v21[22] = 1024;
        *(_DWORD *)v22 = 141;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d drawingContext sContext is invalid, getting rid of it since it is probably stale", v21, 0x1Cu);
      }
    }
    [MEMORY[0x1E4F39CF8] begin];

    sContext = 0;
    [MEMORY[0x1E4F39CF8] commit];
  }
  if (!sContext)
  {
LABEL_14:
    [MEMORY[0x1E4F39CF8] begin];
    if (CARenderServerIsRunning())
    {
      sContext = (uint64_t)(id)[MEMORY[0x1E4F39B58] localContext];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        __int16 v10 = *MEMORY[0x1E4F47A50];
        int v11 = *MEMORY[0x1E4F47A50];
        if (!*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
            +[VCImageQueue drawingContext]();
          }
          goto LABEL_28;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v21 = 136315650;
          *(void *)&v21[4] = v9;
          *(_WORD *)&v21[12] = 2080;
          *(void *)&v21[14] = "+[VCImageQueue drawingContext]";
          *(_WORD *)&v21[22] = 1024;
          *(_DWORD *)v22 = 158;
          uint64_t v12 = " [%s] %s:%d drawingContext sContext is now [CAContext localContext]";
LABEL_23:
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v12, v21, 0x1Cu);
        }
      }
    }
    else
    {
      sContext = (uint64_t)(id)[MEMORY[0x1E4F39B58] remoteContext];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        __int16 v10 = *MEMORY[0x1E4F47A50];
        uint64_t v14 = *MEMORY[0x1E4F47A50];
        if (!*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
            +[VCImageQueue drawingContext]();
          }
          goto LABEL_28;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v21 = 136315650;
          *(void *)&v21[4] = v13;
          *(_WORD *)&v21[12] = 2080;
          *(void *)&v21[14] = "+[VCImageQueue drawingContext]";
          *(_WORD *)&v21[22] = 1024;
          *(_DWORD *)v22 = 161;
          uint64_t v12 = " [%s] %s:%d drawingContext sContext is now [CAContext remoteContext]";
          goto LABEL_23;
        }
      }
    }
LABEL_28:
    if (!sContext && (int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      CFAllocatorRef v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = sContext;
        int IsRunning = CARenderServerIsRunning();
        uint64_t v19 = "remoteContext";
        *(_DWORD *)v21 = 136316162;
        *(void *)&v21[4] = v15;
        *(_WORD *)&v21[12] = 2080;
        *(void *)&v21[14] = "+[VCImageQueue drawingContext]";
        if (IsRunning) {
          uint64_t v19 = "localContext";
        }
        *(_WORD *)&v21[22] = 1024;
        *(_DWORD *)v22 = 164;
        *(_WORD *)&v22[4] = 2048;
        *(void *)&v22[6] = v17;
        __int16 v23 = 2080;
        uint64_t v24 = v19;
        _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d drawingContext sContext=%p type=%s", v21, 0x30u);
      }
    }
    objc_msgSend(MEMORY[0x1E4F39CF8], "commit", *(_OWORD *)v21, *(void *)&v21[16], *(void *)v22);
  }
  [MEMORY[0x1E4F39CF8] flush];
  objc_sync_exit(v3);

  return (id)sContext;
}

- (int64_t)streamToken
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__VCImageQueue_streamToken__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(stateQueue, block);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __27__VCImageQueue_streamToken__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 120);
  return result;
}

- (void)setStreamToken:(int64_t)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__VCImageQueue_setStreamToken___block_invoke;
  block[3] = &unk_1E6DB4568;
  block[4] = self;
  block[5] = a3;
  dispatch_async(stateQueue, block);
}

void *__31__VCImageQueue_setStreamToken___block_invoke(void *result)
{
  if (result[5] != *(void *)(result[4] + 120))
  {
    uint64_t v1 = result;
    VCOverlayManager_updateOverlayEnabledState();
    VCOverlayManager_unregisterOverlayForToken(*(void *)(v1[4] + 120));

    *(void *)(v1[4] + 120) = v1[5];
    *(void *)(v1[4] + 144) = VCOverlayManager_registerOverlayForToken(v1[5]);
    id v2 = *(void **)(v1[4] + 144);
    return v2;
  }
  return result;
}

- (void)setTransformForRemoteVideoOrientationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  p_enqueueLock = &self->_enqueueLock;
  pthread_mutex_lock(&self->_enqueueLock);
  if (self->_transformForRemoteVideoOrientationEnabled != v3)
  {
    self->_transformForRemoteVideoOrientationEnabled = v3;
    if (v3)
    {
      _VCImageQueue_applyLayerTransforms((uint64_t)self, 0);
    }
    else if (self->_caLayer)
    {
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      caLayer = self->_caLayer;
      long long v7 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
      v11[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
      v11[5] = v7;
      long long v8 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
      v11[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
      v11[7] = v8;
      long long v9 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
      v11[0] = *MEMORY[0x1E4F39B10];
      v11[1] = v9;
      long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
      v11[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
      v11[3] = v10;
      [(CALayer *)caLayer setTransform:v11];
      [MEMORY[0x1E4F39CF8] commit];
    }
  }
  pthread_mutex_unlock(p_enqueueLock);
}

- (VCImageQueue)initWithFrameRate:(unsigned __int8)a3
{
  return [(VCImageQueue *)self initWithFrameRate:a3 imageQueueProtected:0];
}

- (VCImageQueue)initWithFrameRate:(unsigned __int8)a3 imageQueueProtected:(BOOL)a4
{
  return [(VCImageQueue *)self initWithFrameRate:a3 imageQueueProtected:a4 vcImageQueueConfig:0];
}

- (void)dealloc
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d ", v2, v3, v4, v5, v6);
}

- (void)configureCALayerWithRect:(CGRect)a3 name:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(CALayer *)self->_caLayer setContents:self->_caQueue];
  _VCImageQueue_configureCALayerBounds((uint64_t)self, 0, x, y, width, height);
  if (self->_isLocalVideo) {
    long long v10 = (void *)MEMORY[0x1E4F3A3E0];
  }
  else {
    long long v10 = (void *)MEMORY[0x1E4F3A3D8];
  }
  [(CALayer *)self->_caLayer setContentsGravity:*v10];
  [(CALayer *)self->_caLayer setName:a4];
  [(CALayer *)self->_caLayer setAllowsHitTesting:0];
  [(CALayer *)self->_caLayer setInheritsTiming:0];
  caLayer = self->_caLayer;

  [(CALayer *)caLayer setAllowsDisplayCompositing:1];
}

- (unsigned)createCAContextWithSize:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F39CF8] begin];
  if (!self->_caQueue)
  {
    if ((VCImageQueue *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCImageQueue createCAContextWithSize:]();
        }
      }
      goto LABEL_62;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v15 = (__CFString *)[(VCImageQueue *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v15 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_62;
    }
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_62;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v30 = v20;
    __int16 v31 = 2080;
    v32 = "-[VCImageQueue createCAContextWithSize:]";
    __int16 v33 = 1024;
    int v34 = 444;
    __int16 v35 = 2112;
    v36 = v15;
    __int16 v37 = 2048;
    v38 = self;
    v22 = " [%s] %s:%d %@(%p) Invalid caQueue";
    goto LABEL_61;
  }
  [(VCImageQueue *)self cleanupCAContextAndCALayer];
  if (self->_isLocalVideo)
  {
    uint64_t v27 = *MEMORY[0x1E4F39E90];
    uint64_t v28 = MEMORY[0x1E4F1CC38];
    long long v8 = objc_msgSend(MEMORY[0x1E4F39B58], "remoteContextWithOptions:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
  }
  else
  {
    long long v8 = (void *)[MEMORY[0x1E4F39B58] remoteContext];
  }
  long long v9 = v8;
  self->_caContext = v9;
  if (!v9)
  {
    if ((VCImageQueue *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCImageQueue createCAContextWithSize:]();
        }
      }
      goto LABEL_62;
    }
    if (objc_opt_respondsToSelector()) {
      CFAllocatorRef v16 = (__CFString *)[(VCImageQueue *)self performSelector:sel_logPrefix];
    }
    else {
      CFAllocatorRef v16 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_62;
    }
    uint64_t v23 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_62;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v30 = v23;
    __int16 v31 = 2080;
    v32 = "-[VCImageQueue createCAContextWithSize:]";
    __int16 v33 = 1024;
    int v34 = 453;
    __int16 v35 = 2112;
    v36 = v16;
    __int16 v37 = 2048;
    v38 = self;
    v22 = " [%s] %s:%d %@(%p) Invalid remoteContext";
    goto LABEL_61;
  }
  long long v10 = (CALayer *)(id)[MEMORY[0x1E4F39BE8] layer];
  self->_caLayer = v10;
  if (!v10)
  {
    if ((VCImageQueue *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCImageQueue createCAContextWithSize:]();
        }
      }
      goto LABEL_62;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v17 = (__CFString *)[(VCImageQueue *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v17 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_62;
    }
    uint64_t v24 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_62;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v30 = v24;
    __int16 v31 = 2080;
    v32 = "-[VCImageQueue createCAContextWithSize:]";
    __int16 v33 = 1024;
    int v34 = 455;
    __int16 v35 = 2112;
    v36 = v17;
    __int16 v37 = 2048;
    v38 = self;
    v22 = " [%s] %s:%d %@(%p) CALayer create failed";
    goto LABEL_61;
  }
  [(CAContext *)self->_caContext setLayer:v10];
  uint64_t v11 = [(CAContext *)self->_caContext createSlot];
  self->_layerHostSlot = v11;
  if (!v11)
  {
    if ((VCImageQueue *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCImageQueue createCAContextWithSize:].cold.4();
        }
      }
      goto LABEL_62;
    }
    if (objc_opt_respondsToSelector()) {
      v18 = (__CFString *)[(VCImageQueue *)self performSelector:sel_logPrefix];
    }
    else {
      v18 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_62;
    }
    uint64_t v25 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_62;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v30 = v25;
    __int16 v31 = 2080;
    v32 = "-[VCImageQueue createCAContextWithSize:]";
    __int16 v33 = 1024;
    int v34 = 459;
    __int16 v35 = 2112;
    v36 = v18;
    __int16 v37 = 2048;
    v38 = self;
    v22 = " [%s] %s:%d %@(%p) Invalid slot for layer host";
LABEL_61:
    _os_log_error_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_ERROR, v22, buf, 0x30u);
    goto LABEL_62;
  }
  [(CAContext *)self->_caContext setObject:self->_caQueue forSlot:v11];
  uint64_t v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"VCImageQueueRemoteLayer%p(%d)", self, 0);
  if (!v12)
  {
    if ((VCImageQueue *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCImageQueue createCAContextWithSize:].cold.5();
        }
      }
      goto LABEL_62;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v19 = (__CFString *)[(VCImageQueue *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v19 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v26 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v30 = v26;
        __int16 v31 = 2080;
        v32 = "-[VCImageQueue createCAContextWithSize:]";
        __int16 v33 = 1024;
        int v34 = 462;
        __int16 v35 = 2112;
        v36 = v19;
        __int16 v37 = 2048;
        v38 = self;
        v22 = " [%s] %s:%d %@(%p) Failed to allocate layer name";
        goto LABEL_61;
      }
    }
LABEL_62:
    [(VCImageQueue *)self cleanupCAContextAndCALayer];
    [MEMORY[0x1E4F39CF8] commit];
    uint64_t v13 = 0;
    goto LABEL_10;
  }
  uint64_t v13 = (void *)v12;
  -[VCImageQueue configureCALayerWithRect:name:](self, "configureCALayerWithRect:name:", v12, x, y, width, height);
  self->_unsigned int contextId = [(CAContext *)self->_caContext contextId];
  _VCImageQueue_signalWaitForLayoutChangeCondition((uint64_t)self);
  [MEMORY[0x1E4F39CF8] commit];
  [MEMORY[0x1E4F39CF8] flush];
  [MEMORY[0x1E4F39CF8] synchronize];
  self->_BOOL layerHostMode = 1;
LABEL_10:

  return self->_contextId;
}

- (void)cleanupCAContextAndCALayer
{
  if (self->_layerHostSlot)
  {
    -[CAContext deleteSlot:](self->_caContext, "deleteSlot:");
    self->_layerHostSlot = 0;
  }
  caContext = self->_caContext;
  if (caContext) {
    [(CAContext *)caContext setLayer:0];
  }
  caLayer = self->_caLayer;
  if (caLayer)
  {
    [(CALayer *)caLayer removeFromSuperlayer];

    self->_caLayer = 0;
  }
  uint64_t v5 = self->_caContext;
  if (v5)
  {
    [(CAContext *)v5 invalidate];

    self->_caContext = 0;
  }
}

- (void)releaseSlot
{
  if (self->_slot)
  {
    objc_msgSend(+[VCImageQueue drawingContext](VCImageQueue, "drawingContext"), "deleteSlot:", self->_slot);
    self->_uint64_t slot = 0;
  }
}

- (void)setHostTimeTimebaseOnFigImageQueue:(OpaqueFigImageQueue *)a3
{
  timebaseOut[1] = *(CMTimebaseRef *)MEMORY[0x1E4F143B8];
  timebaseOut[0] = 0;
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  HostTimeClock = CMClockGetHostTimeClock();
  if (CMTimebaseCreateWithSourceClock(v3, HostTimeClock, timebaseOut))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCImageQueue setHostTimeTimebaseOnFigImageQueue:]();
      }
    }
  }
  else
  {
    if (!timebaseOut[0]) {
      return;
    }
    CMTime timebaseTime = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    CMTime v10 = timebaseTime;
    if (CMTimebaseSetRateAndAnchorTime(timebaseOut[0], 1.0, &timebaseTime, &v10))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCImageQueue setHostTimeTimebaseOnFigImageQueue:]();
        }
      }
    }
    else
    {
      CMTimebaseRef v5 = timebaseOut[0];
      uint64_t FigBaseObject = FigImageQueueGetFigBaseObject();
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v7) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      long long v9 = *(unsigned int (**)(uint64_t, void, CMTimebaseRef))(v8 + 56);
      if ((!v9 || v9(FigBaseObject, *MEMORY[0x1E4F32F28], v5)) && (int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCImageQueue setHostTimeTimebaseOnFigImageQueue:]();
        }
      }
    }
  }
  if (timebaseOut[0]) {
    CFRelease(timebaseOut[0]);
  }
}

- (void)releaseAllocators
{
  streamOutputAllocator = self->_streamOutputAllocator;
  if (streamOutputAllocator) {
    CFRelease(streamOutputAllocator);
  }
}

- (VCStreamOutput)streamOutput
{
  p_enqueueLock = &self->_enqueueLock;
  pthread_mutex_lock(&self->_enqueueLock);
  uint64_t v4 = self->_streamOutput;
  pthread_mutex_unlock(p_enqueueLock);
  return v4;
}

- (void)setStreamOutput:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_enqueueLock = &self->_enqueueLock;
  pthread_mutex_lock(&self->_enqueueLock);
  streamOutput = self->_streamOutput;
  if (streamOutput) {
    BOOL v7 = streamOutput == a3;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {

    streamOutput = 0;
    self->_streamOutput = 0;
  }
  if (a3)
  {
    streamOutput = (VCStreamOutput *)a3;
    self->_streamOutput = streamOutput;
    storedAttributes = self->_storedAttributes;
    if (storedAttributes)
    {
      pixelBufferOverladouble y = self->_pixelBufferOverlay;
      if (pixelBufferOverlay)
      {
        long long v13 = xmmword_1E259FA80;
        long long v14 = unk_1E259FA90;
        long long v15 = xmmword_1E259FAA0;
        long long v11 = xmmword_1E259FA60;
        long long v12 = unk_1E259FA70;
        [(VCPixelBufferOverlay *)pixelBufferOverlay currentDetails];
        *(void *)&long long v15 = self->_storedAttributes;
        v10[2] = v13;
        v10[3] = v14;
        v10[0] = v11;
        v10[1] = v12;
        v10[4] = v15;
        [(VCPixelBufferOverlay *)self->_pixelBufferOverlay setCurrentDetails:v10];
        streamOutput = self->_streamOutput;
        storedAttributes = self->_storedAttributes;
      }
      VCStreamOutput_EnqueueAttributes((uint64_t)streamOutput, (unint64_t)storedAttributes);
      streamOutput = self->_streamOutput;
    }
  }
  self->_usingRemoteQueue = streamOutput != 0;
  pthread_mutex_unlock(p_enqueueLock);
}

uint64_t __36__VCImageQueue_setVideoDestination___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  [*(id *)(a1 + 32) setContents:*(void *)(*(void *)(a1 + 40) + 8)];
  uint64_t v2 = (void *)MEMORY[0x1E4F39CF8];

  return [v2 commit];
}

- (void)getQueueRepresentation:(void *)a3
{
  if (a3) {
    *(_DWORD *)a3 = self->_slot;
  }
}

- (void)stop
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d ", v2, v3, v4, v5, v6);
}

- (void)pause
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d ", v2, v3, v4, v5, v6);
}

- (void)createAndCopyPerformanceDictionary:(const __CFDictionary *)a3
{
  if (self->_endpointID) {
    videoTargetImageQueue = self->_videoTargetImageQueue;
  }
  else {
    videoTargetImageQueue = self->_figQueue;
  }
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  BOOL v7 = *(void (**)(OpaqueFigImageQueue *, const __CFDictionary **))(v6 + 72);
  if (v7)
  {
    v7(videoTargetImageQueue, a3);
  }
}

- (void)createAndCopyLatencyStatsDictionary:(const __CFDictionary *)a3
{
  uint64_t v4 = *MEMORY[0x1E4F1CF80];
  uint64_t FigBaseObject = FigImageQueueGetFigBaseObject();
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(void (**)(uint64_t, __CFString *, uint64_t, const __CFDictionary **))(v7 + 48);
  if (v8)
  {
    v8(FigBaseObject, @"OriginToPresentationLatencyStatistics", v4, a3);
  }
}

- (BOOL)imageQueueProtected
{
  return self->_imageQueueProtected;
}

- (void)setImageQueueProtected:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  self->_imageQueueProtected = a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      caQueue = self->_caQueue;
      int v8 = 136316162;
      uint64_t v9 = v5;
      __int16 v10 = 2080;
      long long v11 = "-[VCImageQueue setImageQueueProtected:]";
      __int16 v12 = 1024;
      int v13 = 1329;
      __int16 v14 = 1024;
      int v15 = (int)caQueue;
      __int16 v16 = 1024;
      BOOL v17 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _caQueue=%x, imageQueueProtected=%d", (uint8_t *)&v8, 0x28u);
    }
  }
  if (self->_caQueue) {
    CAImageQueueSetFlags();
  }
}

- (void)cleanupVideoTargetAndImageQueue
{
  endpointID = self->_endpointID;
  if (endpointID)
  {
    CFRelease(endpointID);
    self->_endpointID = 0;
  }
  videoTarget = self->_videoTarget;
  if (videoTarget)
  {
    CFRelease(videoTarget);
    self->_videoTarget = 0;
  }
  videoTargetImageQueue = self->_videoTargetImageQueue;
  if (videoTargetImageQueue)
  {
    CFRelease(videoTargetImageQueue);
    self->_videoTargetImageQueue = 0;
  }
}

- (void)setEndpointID:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  p_enqueueLock = &self->_enqueueLock;
  pthread_mutex_lock(&self->_enqueueLock);
  [(VCImageQueue *)self cleanupVideoTargetAndImageQueue];
  self->_endpointID = (OS_xpc_object *)a3;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
  uint64_t v7 = Mutable;
  if (!Mutable)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCImageQueue setEndpointID:]();
      }
    }
    goto LABEL_26;
  }
  CFDictionarySetValue(Mutable, @"InstanceType", @"Local");
  if (FigVideoTargetCreateWithVideoReceiverEndpointID())
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCImageQueue setEndpointID:].cold.5();
      }
    }
    goto LABEL_26;
  }
  videoTarget = self->_videoTarget;
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  long long v11 = *(unsigned int (**)(OpaqueFigVideoTarget *, void, OpaqueFigImageQueue **))(v10 + 8);
  if (!v11 || v11(videoTarget, 0, &self->_videoTargetImageQueue))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCImageQueue setEndpointID:]();
      }
    }
    goto LABEL_26;
  }
  uint64_t FigBaseObject = FigImageQueueGetFigBaseObject();
  uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v13) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  int v15 = *(void (**)(uint64_t, void, void))(v14 + 56);
  if (v15) {
    v15(FigBaseObject, *MEMORY[0x1E4F32F30], *MEMORY[0x1E4F1CFD0]);
  }
  FigDataChannelConfigurationCreate();
  CFTypeRef cf = 0;
  __int16 v16 = (uint64_t *)MEMORY[0x1E4F21E08];
  uint64_t v17 = *(void *)(MEMORY[0x1E4F21E08] + 8);
  uint64_t v18 = FigTagMakeWithSInt64Value();
  uint64_t v42 = *v16;
  uint64_t v43 = v17;
  uint64_t v44 = v18;
  uint64_t v45 = v19;
  FigTagCollectionCreate();
  [(VCImageQueue *)self setHostTimeTimebaseOnFigImageQueue:self->_videoTargetImageQueue];
  if (FigDataChannelConfigurationAddFigImageQueue())
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCImageQueue setEndpointID:].cold.4();
      }
    }
    goto LABEL_26;
  }
  uint64_t v20 = self->_videoTarget;
  uint64_t v21 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v21) {
    uint64_t v22 = v21;
  }
  else {
    uint64_t v22 = 0;
  }
  uint64_t v23 = *(unsigned int (**)(OpaqueFigVideoTarget *, void))(v22 + 72);
  if (!v23 || v23(v20, 0))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCImageQueue setEndpointID:]();
      }
    }
LABEL_26:
    [(VCImageQueue *)self cleanupVideoTargetAndImageQueue];
    int v24 = 0;
    goto LABEL_27;
  }
  int v24 = 1;
LABEL_27:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v25 = VRTraceErrorLogLevelToCSTR();
    uint64_t v26 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = self->_videoTarget;
      videoTargetImageQueue = self->_videoTargetImageQueue;
      *(_DWORD *)buf = 136316418;
      uint64_t v31 = v25;
      __int16 v32 = 2080;
      __int16 v33 = "-[VCImageQueue setEndpointID:]";
      __int16 v34 = 1024;
      int v35 = 1386;
      __int16 v36 = 1024;
      int v37 = v24;
      __int16 v38 = 2048;
      uint64_t v39 = v27;
      __int16 v40 = 2048;
      v41 = videoTargetImageQueue;
      _os_log_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d success=%d, _videoTarget=%p, _videoTargetImageQueue=%p", buf, 0x36u);
    }
  }
  if (v7) {
    CFRelease(v7);
  }
  pthread_mutex_unlock(p_enqueueLock);
}

- (BOOL)isLowLatencyEnabled
{
  return self->_isLowLatencyEnabled;
}

- (void)setLowLatencyEnabled:(BOOL)a3
{
  self->_isLowLatencyEnabled = a3;
}

- (BOOL)usingRemoteQueue
{
  return self->_usingRemoteQueue;
}

- (BOOL)isLayerHostMode
{
  return self->_layerHostMode;
}

- (void)setLayerHostMode:(BOOL)a3
{
  self->_BOOL layerHostMode = a3;
}

- (BOOL)isExternalCamera
{
  return self->_isExternalCamera;
}

- (BOOL)isTransformForRemoteVideoOrientationEnabled
{
  return self->_transformForRemoteVideoOrientationEnabled;
}

- (OS_xpc_object)endpointID
{
  return self->_endpointID;
}

void ___VCImageQueue_setFenceWithCompletionHandler_block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    BOOL v3 = *MEMORY[0x1E4F47A50];
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        uint64_t v5 = *(void **)(a1 + 40);
        int v7 = 136316674;
        uint64_t v8 = v2;
        __int16 v9 = 2080;
        uint64_t v10 = "_VCImageQueue_setFenceWithCompletionHandler_block_invoke";
        __int16 v11 = 1024;
        int v12 = 383;
        __int16 v13 = 1024;
        int v14 = 383;
        __int16 v15 = 2048;
        uint64_t v16 = v6;
        __int16 v17 = 2048;
        uint64_t v18 = v5;
        __int16 v19 = 2048;
        uint64_t v20 = [v5 context];
        _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCImageQueue.m:%d: fence=%p for layer=%p and context=%p resolved successfully", (uint8_t *)&v7, 0x40u);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      ___VCImageQueue_setFenceWithCompletionHandler_block_invoke_cold_1(v2, a1, v3);
    }
  }
}

+ (void)drawingContext
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d drawingContext sContext is not Null", v2, v3, v4, v5, v6);
}

- (void)createCAContextWithSize:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid caQueue", v2, v3, v4, v5, v6);
}

- (void)createCAContextWithSize:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid remoteContext", v2, v3, v4, v5, v6);
}

- (void)createCAContextWithSize:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d CALayer create failed", v2, v3, v4, v5, v6);
}

- (void)createCAContextWithSize:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid slot for layer host", v2, v3, v4, v5, v6);
}

- (void)createCAContextWithSize:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate layer name", v2, v3, v4, v5, v6);
}

- (void)setHostTimeTimebaseOnFigImageQueue:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCImageQueue setHostTimeTimebaseOnFigImageQueue:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_3(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCImageQueue.m:%d: Failed to set timebase, error=%d", v2, *(const char **)v3, (unint64_t)"-[VCImageQueue setHostTimeTimebaseOnFigImageQueue:]" >> 16, v4, v5);
}

- (void)setHostTimeTimebaseOnFigImageQueue:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCImageQueue setHostTimeTimebaseOnFigImageQueue:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_3(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCImageQueue.m:%d: Failed to set rate and anchor time, error=%d", v2, *(const char **)v3, (unint64_t)"-[VCImageQueue setHostTimeTimebaseOnFigImageQueue:]" >> 16, v4, v5);
}

- (void)setHostTimeTimebaseOnFigImageQueue:.cold.3()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCImageQueue setHostTimeTimebaseOnFigImageQueue:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_3(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCImageQueue.m:%d: Failed to create master clock, error=%d", v2, *(const char **)v3, (unint64_t)"-[VCImageQueue setHostTimeTimebaseOnFigImageQueue:]" >> 16, v4, v5);
}

- (void)setVideoDestination:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d ", v2, v3, v4, v5, v6);
}

- (void)setEndpointID:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCImageQueue.m:%d: Failed create video target options", v2, v3, v4, v5, v6);
}

- (void)setEndpointID:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCImageQueue setEndpointID:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_3(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCImageQueue.m:%d: Failed create image queue error=%d", v2, *(const char **)v3, (unint64_t)"-[VCImageQueue setEndpointID:]" >> 16, v4, v5);
}

- (void)setEndpointID:.cold.3()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCImageQueue setEndpointID:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_3(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCImageQueue.m:%d: Failed configure image queue error=%d", v2, *(const char **)v3, (unint64_t)"-[VCImageQueue setEndpointID:]" >> 16, v4, v5);
}

- (void)setEndpointID:.cold.4()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCImageQueue setEndpointID:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_3(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCImageQueue.m:%d: Failed to add image queue to config error=%d", v2, *(const char **)v3, (unint64_t)"-[VCImageQueue setEndpointID:]" >> 16, v4, v5);
}

- (void)setEndpointID:.cold.5()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCImageQueue setEndpointID:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_3(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCImageQueue.m:%d: Failed create video target error=%d", v2, *(const char **)v3, (unint64_t)"-[VCImageQueue setEndpointID:]" >> 16, v4, v5);
}

void ___VCImageQueue_setFenceWithCompletionHandler_block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a2 + 32);
  int v5 = *(void **)(a2 + 40);
  [v5 context];
  int v8 = 136316674;
  uint64_t v9 = a1;
  __int16 v10 = 2080;
  __int16 v11 = "_VCImageQueue_setFenceWithCompletionHandler_block_invoke";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_3();
  __int16 v12 = 2048;
  uint64_t v13 = v6;
  __int16 v14 = 2048;
  __int16 v15 = v5;
  __int16 v16 = 2048;
  uint64_t v17 = v7;
  _os_log_debug_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_DEBUG, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCImageQueue.m:%d: fence=%p for layer=%p and context=%p resolved successfully", (uint8_t *)&v8, 0x40u);
}

@end