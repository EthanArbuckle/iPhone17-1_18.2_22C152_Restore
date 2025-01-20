@interface VCStreamInputVideo
- (VCStreamInputVideo)initWithStreamInputID:(id)a3 format:(opaqueCMFormatDescription *)a4 delegate:(id)a5 delegateQueue:(id)a6 remoteQueue:(id)a7;
- (unsigned)addSink:(id)a3;
- (unsigned)removeSink:(id)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation VCStreamInputVideo

- (VCStreamInputVideo)initWithStreamInputID:(id)a3 format:(opaqueCMFormatDescription *)a4 delegate:(id)a5 delegateQueue:(id)a6 remoteQueue:(id)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)VCStreamInputVideo;
  v7 = [(VCStreamInput *)&v17 initWithStreamInputID:a3 format:a4 delegate:a5 delegateQueue:a6 remoteQueue:a7];
  v8 = v7;
  if (v7)
  {
    v7->super._sampleBufferHandler = _VCStreamInputVideo_SampleBufferHandler;
    uint64_t v16 = 0;
    v9 = [[VCVideoCapture alloc] initWithCaptureServer:0 protocolFunctions:&v16];
    v8->super._receiverQueue = (opaqueVCRemoteImageQueue *)v9;
    if (v9)
    {
      if (objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "registerStreamInput:", v8))return v8; {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      }
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCStreamInputVideo initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:](v12);
        }
      }
    }
    else if ((VCStreamInputVideo *)objc_opt_class() == v8)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCStreamInputVideo initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:](v13);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v11 = (__CFString *)[(VCStreamInputVideo *)v8 performSelector:sel_logPrefix];
      }
      else {
        v11 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v19 = v14;
          __int16 v20 = 2080;
          v21 = "-[VCStreamInputVideo initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:]";
          __int16 v22 = 1024;
          int v23 = 56;
          __int16 v24 = 2112;
          v25 = v11;
          __int16 v26 = 2048;
          v27 = v8;
          _os_log_error_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate the VCVideoCapture", buf, 0x30u);
        }
      }
    }
    [(VCStreamInputVideo *)v8 invalidate];

    return 0;
  }
  return v8;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCStreamInputVideo;
  [(VCStreamInput *)&v3 dealloc];
}

- (void)invalidate
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "unregisterStreamInput:", self);
  v3.receiver = self;
  v3.super_class = (Class)VCStreamInputVideo;
  [(VCStreamInput *)&v3 invalidate];
}

- (unsigned)addSink:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  streamInputQueue = self->super._streamInputQueue;
  if (streamInputQueue)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __30__VCStreamInputVideo_addSink___block_invoke;
    v6[3] = &unk_1E6DB43B0;
    v6[5] = a3;
    v6[6] = &v7;
    v6[4] = self;
    dispatch_sync(streamInputQueue, v6);
    unsigned int v4 = *((_DWORD *)v8 + 6);
  }
  else
  {
    unsigned int v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __30__VCStreamInputVideo_addSink___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 296) addSink:a1[5]];
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (unsigned)removeSink:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  streamInputQueue = self->super._streamInputQueue;
  if (streamInputQueue)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __33__VCStreamInputVideo_removeSink___block_invoke;
    v6[3] = &unk_1E6DB43B0;
    v6[5] = a3;
    v6[6] = &v7;
    v6[4] = self;
    dispatch_sync(streamInputQueue, v6);
    unsigned int v4 = *((_DWORD *)v8 + 6);
  }
  else
  {
    unsigned int v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __33__VCStreamInputVideo_removeSink___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 296) removeSink:a1[5]];
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)initWithStreamInputID:(uint64_t)a1 format:delegate:delegateQueue:remoteQueue:.cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 56;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate the VCVideoCapture", (uint8_t *)&v2, 0x1Cu);
}

- (void)initWithStreamInputID:(uint64_t)a1 format:delegate:delegateQueue:remoteQueue:.cold.2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 60;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to register with capture server", (uint8_t *)&v2, 0x1Cu);
}

@end