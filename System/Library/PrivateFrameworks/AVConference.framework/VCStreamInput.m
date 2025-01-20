@interface VCStreamInput
- (BOOL)createRemoteReceiveQueue:(id)a3;
- (BOOL)isEqualFormat:(opaqueCMFormatDescription *)a3;
- (BOOL)isStarted;
- (NSDictionary)reportingStats;
- (NSNumber)streamInputID;
- (VCStreamInput)initWithStreamInputID:(id)a3 format:(opaqueCMFormatDescription *)a4 delegate:(id)a5 delegateQueue:(id)a6 remoteQueue:(id)a7;
- (opaqueCMFormatDescription)streamFormat;
- (void)dealloc;
- (void)didResumeStreamInputCaptureSource;
- (void)didStartStreamInputCaptureSource;
- (void)didStopStreamInputCaptureSource;
- (void)didSuspendStreamInputCaptureSource;
- (void)invalidate;
@end

@implementation VCStreamInput

- (VCStreamInput)initWithStreamInputID:(id)a3 format:(opaqueCMFormatDescription *)a4 delegate:(id)a5 delegateQueue:(id)a6 remoteQueue:(id)a7
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)VCStreamInput;
  v12 = [(VCObject *)&v36 init];
  if (!v12) {
    goto LABEL_66;
  }
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCStreamInput initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:]();
      }
    }
    goto LABEL_66;
  }
  -[VCObject setLogPrefix:](v12, "setLogPrefix:", [NSString stringWithFormat:@"streamInputID=%@", a3]);
  if (!a4)
  {
    if ((VCStreamInput *)objc_opt_class() == v12)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCStreamInput initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:]();
        }
      }
      goto LABEL_66;
    }
    if (objc_opt_respondsToSelector()) {
      v20 = (__CFString *)[(VCStreamInput *)v12 performSelector:sel_logPrefix];
    }
    else {
      v20 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_66;
    }
    uint64_t v25 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_66;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v38 = v25;
    __int16 v39 = 2080;
    v40 = "-[VCStreamInput initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:]";
    __int16 v41 = 1024;
    int v42 = 56;
    __int16 v43 = 2112;
    v44 = v20;
    __int16 v45 = 2048;
    v46 = v12;
    v27 = " [%s] %s:%d %@(%p) Provided format is NULL";
    goto LABEL_64;
  }
  if (!a5)
  {
    if ((VCStreamInput *)objc_opt_class() == v12)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCStreamInput initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:]();
        }
      }
      goto LABEL_66;
    }
    if (objc_opt_respondsToSelector()) {
      v21 = (__CFString *)[(VCStreamInput *)v12 performSelector:sel_logPrefix];
    }
    else {
      v21 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_66;
    }
    uint64_t v28 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_66;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v38 = v28;
    __int16 v39 = 2080;
    v40 = "-[VCStreamInput initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:]";
    __int16 v41 = 1024;
    int v42 = 57;
    __int16 v43 = 2112;
    v44 = v21;
    __int16 v45 = 2048;
    v46 = v12;
    v27 = " [%s] %s:%d %@(%p) Provided delegate is NULL";
    goto LABEL_64;
  }
  if (!a6)
  {
    if ((VCStreamInput *)objc_opt_class() == v12)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCStreamInput initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:].cold.4();
        }
      }
      goto LABEL_66;
    }
    if (objc_opt_respondsToSelector()) {
      v22 = (__CFString *)[(VCStreamInput *)v12 performSelector:sel_logPrefix];
    }
    else {
      v22 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_66;
    }
    uint64_t v29 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_66;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v38 = v29;
    __int16 v39 = 2080;
    v40 = "-[VCStreamInput initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:]";
    __int16 v41 = 1024;
    int v42 = 58;
    __int16 v43 = 2112;
    v44 = v22;
    __int16 v45 = 2048;
    v46 = v12;
    v27 = " [%s] %s:%d %@(%p) Provided delegate queue is NULL";
LABEL_64:
    v32 = v26;
    uint32_t v33 = 48;
    goto LABEL_65;
  }
  v13 = NSString;
  v14 = (objc_class *)objc_opt_class();
  v15 = (void *)[v13 stringWithFormat:@"%@.%@.%p", @"com.apple.VideoConference", NSStringFromClass(v14), v12];
  v16 = (const char *)[v15 UTF8String];
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(56);
  dispatch_queue_t v18 = dispatch_queue_create_with_target_V2(v16, 0, CustomRootQueue);
  v12->_streamInputQueue = (OS_dispatch_queue *)v18;
  if (!v18)
  {
    if ((VCStreamInput *)objc_opt_class() == v12)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCStreamInput initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:].cold.5();
        }
      }
      goto LABEL_66;
    }
    if (objc_opt_respondsToSelector()) {
      v23 = (__CFString *)[(VCStreamInput *)v12 performSelector:sel_logPrefix];
    }
    else {
      v23 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v30 = VRTraceErrorLogLevelToCSTR();
      v31 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v38 = v30;
        __int16 v39 = 2080;
        v40 = "-[VCStreamInput initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:]";
        __int16 v41 = 1024;
        int v42 = 62;
        __int16 v43 = 2112;
        v44 = v23;
        __int16 v45 = 2048;
        v46 = v12;
        __int16 v47 = 2112;
        v48 = v15;
        v27 = " [%s] %s:%d %@(%p) Failed to create the dispatch queue with queueName=%@";
        v32 = v31;
        uint32_t v33 = 58;
LABEL_65:
        _os_log_error_impl(&dword_1E1EA4000, v32, OS_LOG_TYPE_ERROR, v27, buf, v33);
        goto LABEL_66;
      }
    }
    goto LABEL_66;
  }
  if (a7) {
    [(VCStreamInput *)v12 createRemoteReceiveQueue:a7];
  }
  uint64_t v19 = [a3 copy];
  v12->_streamInputID = (NSNumber *)v19;
  if (!v19)
  {
    if ((VCStreamInput *)objc_opt_class() == v12)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCStreamInput initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:].cold.6();
        }
      }
      goto LABEL_66;
    }
    if (objc_opt_respondsToSelector()) {
      v24 = (__CFString *)[(VCStreamInput *)v12 performSelector:sel_logPrefix];
    }
    else {
      v24 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v34 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v38 = v34;
        __int16 v39 = 2080;
        v40 = "-[VCStreamInput initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:]";
        __int16 v41 = 1024;
        int v42 = 70;
        __int16 v43 = 2112;
        v44 = v24;
        __int16 v45 = 2048;
        v46 = v12;
        v27 = " [%s] %s:%d %@(%p) Failed to copy the stream input ID";
        goto LABEL_64;
      }
    }
LABEL_66:
    [(VCStreamInput *)v12 invalidate];

    return 0;
  }
  HIDWORD(v12->_lastAveragedTime.epoch) = 0;
  v12->_format = (opaqueCMFormatDescription *)CFRetain(a4);
  v12->_strongDelegate = (VCStreamInputDelegate *)a5;
  v12->_delegateQueue = (OS_dispatch_queue *)a6;
  dispatch_retain((dispatch_object_t)a6);
  return v12;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalidate was not called!", v2, v3, v4, v5, v6);
}

- (BOOL)isStarted
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  streamInputQueue = self->_streamInputQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__VCStreamInput_isStarted__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(streamInputQueue, block);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __26__VCStreamInput_isStarted__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 216);
  return result;
}

- (void)invalidate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  VCRemoteImageQueue_Destroy((uint64_t *)&self->_lastTransitTime);
  streamInputQueue = self->_streamInputQueue;
  if (streamInputQueue)
  {
    uint64_t v8 = 0;
    char v9 = &v8;
    uint64_t v10 = 0x3052000000;
    v11 = __Block_byref_object_copy__20;
    v12 = __Block_byref_object_dispose__20;
    uint64_t v13 = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__VCStreamInput_invalidate__block_invoke;
    block[3] = &unk_1E6DB3EB8;
    block[4] = self;
    block[5] = &v8;
    dispatch_sync(streamInputQueue, block);
    uint64_t v4 = v9[5];
    if (v4) {
      dispatch_sync(v4, &__block_literal_global_56);
    }
    uint64_t v5 = self->_streamInputQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __27__VCStreamInput_invalidate__block_invoke_3;
    v6[3] = &unk_1E6DB3EB8;
    v6[4] = self;
    v6[5] = &v8;
    dispatch_sync(v5, v6);
    _Block_object_dispose(&v8, 8);
  }
}

uint64_t __27__VCStreamInput_invalidate__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 216) = 0;
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40) = *(void *)(*(void *)(result + 32) + 208);
  *(void *)(*(void *)(result + 32) + 208) = 0;
  return result;
}

void __27__VCStreamInput_invalidate__block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 200) = 0;
  uint64_t v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    dispatch_release(v2);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = 0;
  }
}

- (opaqueCMFormatDescription)streamFormat
{
  return self->_format;
}

- (BOOL)isEqualFormat:(opaqueCMFormatDescription *)a3
{
  return CMFormatDescriptionEqual(self->_format, a3) == 1;
}

- (NSDictionary)reportingStats
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  memset(&v10, 170, sizeof(v10));
  *(_OWORD *)&lhs.value = *(_OWORD *)(&self->_isStarted + 4);
  lhs.epoch = *(void *)&self->_lastBufferTime.flags;
  *(_OWORD *)&v8.value = *(_OWORD *)((char *)&self->_lastBufferTime.epoch + 4);
  v8.epoch = *(void *)&self->_lastAveragedTime.flags;
  CMTimeSubtract(&v10, &lhs, &v8);
  CMTime lhs = v10;
  if (CMTimeGetSeconds(&lhs) <= 0.0)
  {
    unint64_t v5 = 0;
  }
  else
  {
    unsigned int v4 = atomic_load((unsigned int *)&self->_lastAveragedTime.epoch + 1);
    CMTime lhs = v10;
    unint64_t v5 = vcvtad_u64_f64((double)(1000 * v4) / CMTimeGetSeconds(&lhs));
  }
  atomic_store(0, (unsigned int *)&self->_lastAveragedTime.epoch + 1);
  long long v6 = *(_OWORD *)(&self->_isStarted + 4);
  *(void *)&self->_lastAveragedTime.flags = *(void *)&self->_lastBufferTime.flags;
  *(_OWORD *)((char *)&self->_lastBufferTime.epoch + 4) = v6;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", round(*(double *)&self->_sampleBufferCount * 1000000.0)), @"MediaCaptureJitter");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", v5), @"MediaCaptureBufferRate");
  return (NSDictionary *)v3;
}

- (BOOL)createRemoteReceiveQueue:(id)a3
{
  v6[5] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __42__VCStreamInput_createRemoteReceiveQueue___block_invoke;
    v6[3] = &unk_1E6DB5690;
    v6[4] = self;
    p_lastTransitTime = &self->_lastTransitTime;
    VCRemoteImageQueue_CreateReceiverQueue((uint64_t)a3, (uint64_t)v6, (uint64_t)self->_streamInputQueue, &self->_lastTransitTime);
    if (*(void *)p_lastTransitTime)
    {
      LOBYTE(v4) = 1;
      return v4;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v4) {
        return v4;
      }
      -[VCStreamInput createRemoteReceiveQueue:]();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    BOOL v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v4) {
      return v4;
    }
    -[VCStreamInput createRemoteReceiveQueue:]();
  }
  LOBYTE(v4) = 0;
  return v4;
}

void __42__VCStreamInput_createRemoteReceiveQueue___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  [*(id *)(v5 + 184) unsignedIntValue];
  if (a2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __42__VCStreamInput_createRemoteReceiveQueue___block_invoke_cold_3();
      }
    }
  }
  else if (*(_DWORD *)a3 == 3)
  {
    long long v6 = *(opaqueCMSampleBuffer **)(a3 + 24);
    if (v6)
    {
      memset(&v9, 170, sizeof(v9));
      CMSampleBufferGetPresentationTimeStamp(&v9, v6);
      CMTime time = v9;
      CMTimeGetSeconds(&time);
      kdebug_trace();
      (*(void (**)(uint64_t, opaqueCMSampleBuffer *))(v5 + 176))(v5, v6);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __42__VCStreamInput_createRemoteReceiveQueue___block_invoke_cold_1();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    CMTime v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __42__VCStreamInput_createRemoteReceiveQueue___block_invoke_cold_2(v7, a3, v8);
    }
  }
}

- (void)didStartStreamInputCaptureSource
{
  v3[5] = *MEMORY[0x1E4F143B8];
  streamInputQueue = self->_streamInputQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__VCStreamInput_didStartStreamInputCaptureSource__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(streamInputQueue, v3);
}

void __49__VCStreamInput_didStartStreamInputCaptureSource__block_invoke(uint64_t a1)
{
  v3[5] = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 216) = 1;
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 208);
  if (v2)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __49__VCStreamInput_didStartStreamInputCaptureSource__block_invoke_2;
    v3[3] = &unk_1E6DB3DC8;
    v3[4] = v1;
    dispatch_async(v2, v3);
  }
}

uint64_t __49__VCStreamInput_didStartStreamInputCaptureSource__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 200), "didStartStreamInput:");
}

- (void)didStopStreamInputCaptureSource
{
  v3[5] = *MEMORY[0x1E4F143B8];
  streamInputQueue = self->_streamInputQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__VCStreamInput_didStopStreamInputCaptureSource__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(streamInputQueue, v3);
}

void __48__VCStreamInput_didStopStreamInputCaptureSource__block_invoke(uint64_t a1)
{
  v3[5] = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 216) = 0;
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 208);
  if (v2)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __48__VCStreamInput_didStopStreamInputCaptureSource__block_invoke_2;
    v3[3] = &unk_1E6DB3DC8;
    v3[4] = v1;
    dispatch_async(v2, v3);
  }
}

uint64_t __48__VCStreamInput_didStopStreamInputCaptureSource__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 200), "didStopStreamInput:");
}

- (void)didSuspendStreamInputCaptureSource
{
  v3[5] = *MEMORY[0x1E4F143B8];
  streamInputQueue = self->_streamInputQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__VCStreamInput_didSuspendStreamInputCaptureSource__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(streamInputQueue, v3);
}

void __51__VCStreamInput_didSuspendStreamInputCaptureSource__block_invoke(uint64_t a1)
{
  v3[5] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 208);
  if (v2)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __51__VCStreamInput_didSuspendStreamInputCaptureSource__block_invoke_2;
    v3[3] = &unk_1E6DB3DC8;
    v3[4] = v1;
    dispatch_async(v2, v3);
  }
}

uint64_t __51__VCStreamInput_didSuspendStreamInputCaptureSource__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 200), "didSuspendStreamInput:");
}

- (void)didResumeStreamInputCaptureSource
{
  v3[5] = *MEMORY[0x1E4F143B8];
  streamInputQueue = self->_streamInputQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__VCStreamInput_didResumeStreamInputCaptureSource__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(streamInputQueue, v3);
}

void __50__VCStreamInput_didResumeStreamInputCaptureSource__block_invoke(uint64_t a1)
{
  v3[5] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 208);
  if (v2)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __50__VCStreamInput_didResumeStreamInputCaptureSource__block_invoke_2;
    v3[3] = &unk_1E6DB3DC8;
    v3[4] = v1;
    dispatch_async(v2, v3);
  }
}

uint64_t __50__VCStreamInput_didResumeStreamInputCaptureSource__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 200), "didResumeStreamInput:");
}

- (NSNumber)streamInputID
{
  return self->_streamInputID;
}

- (void)initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Stream input ID is nil", v2, v3, v4, v5, v6);
}

- (void)initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Provided format is NULL", v2, v3, v4, v5, v6);
}

- (void)initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Provided delegate is NULL", v2, v3, v4, v5, v6);
}

- (void)initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Provided delegate queue is NULL", v2, v3, v4, v5, v6);
}

- (void)initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:.cold.5()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = "-[VCStreamInput initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:]";
  __int16 v4 = 1024;
  int v5 = 62;
  __int16 v6 = 2112;
  uint64_t v7 = v0;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create the dispatch queue with queueName=%@", v2, 0x26u);
}

- (void)initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to copy the stream input ID", v2, v3, v4, v5, v6);
}

- (void)createRemoteReceiveQueue:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d xpcClientQueue was null, cannot make the remote queue", v2, v3, v4, v5, v6);
}

- (void)createRemoteReceiveQueue:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Error making the receiver queue", v2, v3, v4, v5, v6);
}

void __42__VCStreamInput_createRemoteReceiveQueue___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Received nil sampleBuffer", v2, v3, v4, v5, v6);
}

void __42__VCStreamInput_createRemoteReceiveQueue___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315906;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(void *)&v3[14] = "_VCStreamInput_RemoteQueueOperationHandler";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, a2, a3, " [%s] %s:%d Received unexpected operation=%d", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"_VCStreamInput_RemoteQueueOperationHandler" >> 16, 183);
}

void __42__VCStreamInput_createRemoteReceiveQueue___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "_VCStreamInput_RemoteQueueOperationHandler";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Error received from the remote Queue=%d", v2, *(const char **)v3, (unint64_t)"_VCStreamInput_RemoteQueueOperationHandler" >> 16, 182);
}

@end