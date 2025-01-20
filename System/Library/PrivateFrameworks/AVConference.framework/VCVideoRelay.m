@interface VCVideoRelay
+ (id)sharedInstance;
- (BOOL)deregisterForVideoFrames:(id)a3;
- (BOOL)enqueueFrame:(__CVBuffer *)a3 atTime:(id *)a4 cameraStatusBits:(unsigned __int8)a5;
- (BOOL)registerForVideoFrames:(id)a3;
- (VCVideoRelay)init;
- (void)dealloc;
@end

@implementation VCVideoRelay

+ (id)sharedInstance
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __30__VCVideoRelay_sharedInstance__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = a1;
  if (sharedInstance_onceToken_16 != -1) {
    dispatch_once(&sharedInstance_onceToken_16, v3);
  }
  return (id)sharedInstance__vcVideoRelaySingleton;
}

Class *__30__VCVideoRelay_sharedInstance__block_invoke(Class *result)
{
  if (!sharedInstance__vcVideoRelaySingleton)
  {
    result = (Class *)objc_alloc_init(result[4]);
    sharedInstance__vcVideoRelaySingleton = (uint64_t)result;
  }
  return result;
}

- (VCVideoRelay)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCVideoRelay;
  v2 = [(VCVideoRelay *)&v5 init];
  if (v2)
  {
    v2->_videoCaptureSinks = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVideoRelay.dispatchQueue", 0, CustomRootQueue);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  dispatch_release((dispatch_object_t)self->_dispatchQueue);
  v3.receiver = self;
  v3.super_class = (Class)VCVideoRelay;
  [(VCVideoRelay *)&v3 dealloc];
}

- (BOOL)enqueueFrame:(__CVBuffer *)a3 atTime:(id *)a4 cameraStatusBits:(unsigned __int8)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v10) {
        return v10;
      }
      -[VCVideoRelay enqueueFrame:atTime:cameraStatusBits:]();
    }
LABEL_10:
    LOBYTE(v10) = 0;
    return v10;
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v20 = *a4;
  CMSampleBufferRef SampleBufferWithPixelBuffer = createSampleBufferWithPixelBuffer(a3, (long long *)&v20.var0);
  if (!SampleBufferWithPixelBuffer)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v10) {
        return v10;
      }
      -[VCVideoRelay enqueueFrame:atTime:cameraStatusBits:]();
    }
    goto LABEL_10;
  }
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  __int16 v18 = 0;
  char v19 = 0;
  dispatchQueue = self->_dispatchQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__VCVideoRelay_enqueueFrame_atTime_cameraStatusBits___block_invoke;
  v12[3] = &unk_1E6DB95C0;
  v12[4] = self;
  v12[5] = SampleBufferWithPixelBuffer;
  long long v13 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  unsigned __int8 v17 = a5;
  dispatch_sync(dispatchQueue, v12);
  LOBYTE(v10) = 1;
  return v10;
}

void __53__VCVideoRelay_enqueueFrame_atTime_cameraStatusBits___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v8 = *(void *)(a1 + 40);
        long long v12 = *(_OWORD *)(a1 + 48);
        uint64_t v13 = *(void *)(a1 + 64);
        long long v10 = *(_OWORD *)(a1 + 72);
        int v11 = *(_DWORD *)(a1 + 88);
        [v7 onVideoFrame:v8 frameTime:&v12 attribute:&v10];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v4);
  }
  v9 = *(const void **)(a1 + 40);
  if (v9) {
    CFRelease(v9);
  }
}

- (BOOL)registerForVideoFrames:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 0;
    dispatchQueue = self->_dispatchQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39__VCVideoRelay_registerForVideoFrames___block_invoke;
    v6[3] = &unk_1E6DB6928;
    v6[4] = self;
    v6[5] = a3;
    v6[6] = &v7;
    dispatch_sync(dispatchQueue, v6);
    BOOL v4 = *((unsigned char *)v8 + 24) != 0;
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRelay registerForVideoFrames:]();
      }
    }
    return 0;
  }
  return v4;
}

void __39__VCVideoRelay_registerForVideoFrames___block_invoke(void *a1)
{
  if ([*(id *)(a1[4] + 8) containsObject:a1[5]])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __39__VCVideoRelay_registerForVideoFrames___block_invoke_cold_1();
      }
    }
  }
  else
  {
    [*(id *)(a1[4] + 8) addObject:a1[5]];
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

- (BOOL)deregisterForVideoFrames:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 0;
    dispatchQueue = self->_dispatchQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __41__VCVideoRelay_deregisterForVideoFrames___block_invoke;
    v6[3] = &unk_1E6DB6928;
    v6[4] = self;
    v6[5] = a3;
    v6[6] = &v7;
    dispatch_sync(dispatchQueue, v6);
    BOOL v4 = *((unsigned char *)v8 + 24) != 0;
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRelay deregisterForVideoFrames:]();
      }
    }
    return 0;
  }
  return v4;
}

void __41__VCVideoRelay_deregisterForVideoFrames___block_invoke(void *a1)
{
  if ([*(id *)(a1[4] + 8) containsObject:a1[5]])
  {
    [*(id *)(a1[4] + 8) removeObject:a1[5]];
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __41__VCVideoRelay_deregisterForVideoFrames___block_invoke_cold_1();
    }
  }
}

- (void)enqueueFrame:atTime:cameraStatusBits:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d frameBuffer is nil", v2, v3, v4, v5, v6);
}

- (void)enqueueFrame:atTime:cameraStatusBits:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create CMSampleBuffer", v2, v3, v4, v5, v6);
}

- (void)registerForVideoFrames:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d client is nil", v2, v3, v4, v5, v6);
}

void __39__VCVideoRelay_registerForVideoFrames___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  *(void *)&void v3[6] = "-[VCVideoRelay registerForVideoFrames:]_block_invoke";
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d client %p is already in_videoCaptureSinks", v2, *(const char **)v3, (unint64_t)"-[VCVideoRelay registerForVideoFrames:]_block_invoke" >> 16, v4);
}

- (void)deregisterForVideoFrames:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d client is nil", v2, v3, v4, v5, v6);
}

void __41__VCVideoRelay_deregisterForVideoFrames___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  *(void *)&void v3[6] = "-[VCVideoRelay deregisterForVideoFrames:]_block_invoke";
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d client %p is not in _videoCaptureSinks", v2, *(const char **)v3, (unint64_t)"-[VCVideoRelay deregisterForVideoFrames:]_block_invoke" >> 16, v4);
}

@end