@interface VCStreamOutput
- (BOOL)createRemoteQueue;
- (BOOL)initXPCCommandQueue;
- (BOOL)isClientInProcess;
- (VCStreamOutput)initWithStreamToken:(int64_t)a3 clientProcessID:(int)a4 delegate:(id)a5 delegateQueue:(id)a6;
- (__CFAllocator)backingBufferAllocator;
- (id)copyXpcSenderQueue;
- (int)processID;
- (int64_t)streamToken;
- (void)createRemoteQueue;
- (void)dealloc;
- (void)didDegrade:(BOOL)a3;
- (void)didInvalidate;
- (void)didPause:(BOOL)a3;
- (void)didReceiveSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)didStall:(BOOL)a3;
- (void)didSuspend:(BOOL)a3;
- (void)didUpdateAttachments:(__CFDictionary *)a3;
- (void)initXPCCommandQueue;
- (void)invalidate;
@end

@implementation VCStreamOutput

- (VCStreamOutput)initWithStreamToken:(int64_t)a3 clientProcessID:(int)a4 delegate:(id)a5 delegateQueue:(id)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)VCStreamOutput;
  v10 = [(VCObject *)&v30 init];
  v11 = v10;
  if (!v10) {
    goto LABEL_35;
  }
  v10->_streamToken = a3;
  v10->_clientProcessID = a4;
  pid_t v12 = getpid();
  v11->_BOOL isClientInProcess = v12 == a4;
  if (v12 == a4)
  {
    if (a5 && a6)
    {
      v11->_delegateQueue = (OS_dispatch_queue *)a6;
      dispatch_retain((dispatch_object_t)a6);
      v11->_delegate = a5;
      goto LABEL_8;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v25 = VRTraceErrorLogLevelToCSTR(),
          v26 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_35:

      return 0;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v32 = v25;
    __int16 v33 = 2080;
    v34 = "-[VCStreamOutput initWithStreamToken:clientProcessID:delegate:delegateQueue:]";
    __int16 v35 = 1024;
    int v36 = 56;
    __int16 v37 = 2048;
    id v38 = a5;
    __int16 v39 = 2048;
    id v40 = a6;
    v27 = " [%s] %s:%d Incorrect input for clientInProcess: Client delegate=%p, delegateQueue=%p";
LABEL_31:
    _os_log_error_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_ERROR, v27, buf, 0x30u);
    goto LABEL_35;
  }
  if ((unint64_t)a5 | (unint64_t)a6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_35;
    }
    uint64_t v28 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_35;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v32 = v28;
    __int16 v33 = 2080;
    v34 = "-[VCStreamOutput initWithStreamToken:clientProcessID:delegate:delegateQueue:]";
    __int16 v35 = 1024;
    int v36 = 62;
    __int16 v37 = 2048;
    id v38 = a5;
    __int16 v39 = 2048;
    id v40 = a6;
    v27 = " [%s] %s:%d Incorrect input for clientOutOfProcess, delegate=%p, delegateQueue=%p";
    goto LABEL_31;
  }
  v11->_useFigRemoteQueue = 1;
  if (![(VCStreamOutput *)v11 createRemoteQueue])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCStreamOutput initWithStreamToken:clientProcessID:delegate:delegateQueue:]();
      }
    }
    goto LABEL_35;
  }
LABEL_8:
  if ((VCStreamOutput *)objc_opt_class() == v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL isClientInProcess = v11->_isClientInProcess;
        *(_DWORD *)buf = 136315906;
        uint64_t v32 = v14;
        if (isClientInProcess) {
          v17 = "in";
        }
        else {
          v17 = "out of";
        }
        __int16 v33 = 2080;
        v34 = "-[VCStreamOutput initWithStreamToken:clientProcessID:delegate:delegateQueue:]";
        __int16 v35 = 1024;
        int v36 = 76;
        __int16 v37 = 2080;
        id v38 = (id)v17;
        v18 = " [%s] %s:%d Will run %s process";
        v19 = v15;
        uint32_t v20 = 38;
        goto LABEL_24;
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v13 = (__CFString *)[(VCStreamOutput *)v11 performSelector:sel_logPrefix];
    }
    else {
      v13 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v23 = v11->_isClientInProcess;
        *(_DWORD *)buf = 136316418;
        uint64_t v32 = v21;
        if (v23) {
          v24 = "in";
        }
        else {
          v24 = "out of";
        }
        __int16 v33 = 2080;
        v34 = "-[VCStreamOutput initWithStreamToken:clientProcessID:delegate:delegateQueue:]";
        __int16 v35 = 1024;
        int v36 = 76;
        __int16 v37 = 2112;
        id v38 = v13;
        __int16 v39 = 2048;
        id v40 = v11;
        __int16 v41 = 2080;
        v42 = v24;
        v18 = " [%s] %s:%d %@(%p) Will run %s process";
        v19 = v22;
        uint32_t v20 = 58;
LABEL_24:
        _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
      }
    }
  }
  return v11;
}

- (void)invalidate
{
  v3[5] = *MEMORY[0x1E4F143B8];
  delegateQueue = self->_delegateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __28__VCStreamOutput_invalidate__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_sync(delegateQueue, v3);
}

uint64_t __28__VCStreamOutput_invalidate__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 208) = 0;
  return result;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
  {
    dispatch_release(delegateQueue);
    self->_delegateQueue = 0;
  }
  VCRemoteImageQueue_Destroy((uint64_t *)&self->_remoteQueue);

  attributes = self->_attributes;
  if (attributes) {
    CFRelease(attributes);
  }
  backingBufferAllocator = self->_backingBufferAllocator;
  if (backingBufferAllocator) {
    CFRelease(backingBufferAllocator);
  }
  v6.receiver = self;
  v6.super_class = (Class)VCStreamOutput;
  [(VCObject *)&v6 dealloc];
}

- (BOOL)createRemoteQueue
{
  if (self->_useFigRemoteQueue
    && VCRemoteImageQueue_CreateSenderQueue(self->_clientProcessID, &self->_remoteQueue))
  {
    v3 = (__CFAllocator *)VCRemoteImageQueue_SharedMemoryPoolAllocator(self->_remoteQueue);
    self->_backingBufferAllocator = v3;
    if (v3)
    {
      CFRetain(v3);
      LOBYTE(backingBufferAllocator) = 1;
      return (char)backingBufferAllocator;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCStreamOutput createRemoteQueue]();
      }
    }
  }
  VCRemoteImageQueue_Destroy((uint64_t *)&self->_remoteQueue);
  backingBufferAllocator = self->_backingBufferAllocator;
  if (backingBufferAllocator)
  {
    CFRelease(backingBufferAllocator);
    LOBYTE(backingBufferAllocator) = 0;
  }
  return (char)backingBufferAllocator;
}

- (id)copyXpcSenderQueue
{
  if (self->_useFigRemoteQueue) {
    return (id)VCRemoteImageQueue_CreateQueueXPCObject((uint64_t)self->_remoteQueue);
  }
  else {
    return 0;
  }
}

void __VCStreamOutput_EnqueueSampleBuffer_block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 208) didReceiveSampleBuffer:*(void *)(a1 + 40)];
  v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    CFRelease(v2);
  }
}

- (BOOL)initXPCCommandQueue
{
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
  v4 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCStreamOutput.xpcCommandQueue", 0, CustomRootQueue);
  self->_xpcCommandQueue = v4;
  if (!v4 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCStreamOutput initXPCCommandQueue]();
    }
  }
  return v4 != 0;
}

- (void)didPause:(BOOL)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__VCStreamOutput_didPause___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v4 = a3;
  if (self->_isClientInProcess)
  {
    dispatch_async((dispatch_queue_t)self->_delegateQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCStreamOutput didPause:]();
    }
  }
}

uint64_t __27__VCStreamOutput_didPause___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) didPause:*(unsigned __int8 *)(a1 + 40)];
}

- (void)didDegrade:(BOOL)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__VCStreamOutput_didDegrade___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v4 = a3;
  if (self->_isClientInProcess)
  {
    dispatch_async((dispatch_queue_t)self->_delegateQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCStreamOutput didPause:]();
    }
  }
}

uint64_t __29__VCStreamOutput_didDegrade___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) didDegrade:*(unsigned __int8 *)(a1 + 40)];
}

- (void)didInvalidate
{
  v2[5] = *MEMORY[0x1E4F143B8];
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __31__VCStreamOutput_didInvalidate__block_invoke;
  v2[3] = &unk_1E6DB3DC8;
  v2[4] = self;
  if (self->_isClientInProcess)
  {
    dispatch_async((dispatch_queue_t)self->_delegateQueue, v2);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCStreamOutput didPause:]();
    }
  }
}

uint64_t __31__VCStreamOutput_didInvalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) didInvalidate];
}

- (void)didReceiveSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__VCStreamOutput_didReceiveSampleBuffer___block_invoke;
  block[3] = &unk_1E6DB4568;
  block[4] = self;
  void block[5] = a3;
  if (self->_isClientInProcess)
  {
    dispatch_async((dispatch_queue_t)self->_delegateQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCStreamOutput didPause:]();
    }
  }
}

uint64_t __41__VCStreamOutput_didReceiveSampleBuffer___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) didReceiveSampleBuffer:*(void *)(a1 + 40)];
}

- (void)didStall:(BOOL)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__VCStreamOutput_didStall___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v4 = a3;
  if (self->_isClientInProcess)
  {
    dispatch_async((dispatch_queue_t)self->_delegateQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCStreamOutput didPause:]();
    }
  }
}

uint64_t __27__VCStreamOutput_didStall___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) didStall:*(unsigned __int8 *)(a1 + 40)];
}

- (void)didSuspend:(BOOL)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__VCStreamOutput_didSuspend___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v4 = a3;
  if (self->_isClientInProcess)
  {
    dispatch_async((dispatch_queue_t)self->_delegateQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCStreamOutput didPause:]();
    }
  }
}

uint64_t __29__VCStreamOutput_didSuspend___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) didSuspend:*(unsigned __int8 *)(a1 + 40)];
}

- (void)didUpdateAttachments:(__CFDictionary *)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__VCStreamOutput_didUpdateAttachments___block_invoke;
  block[3] = &unk_1E6DB4568;
  block[4] = self;
  void block[5] = a3;
  if (self->_isClientInProcess)
  {
    dispatch_async((dispatch_queue_t)self->_delegateQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCStreamOutput didPause:]();
    }
  }
}

uint64_t __39__VCStreamOutput_didUpdateAttachments___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) didUpdateAttachments:*(void *)(a1 + 40)];
}

- (int)processID
{
  return self->_clientProcessID;
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

- (BOOL)isClientInProcess
{
  return self->_isClientInProcess;
}

- (__CFAllocator)backingBufferAllocator
{
  return self->_backingBufferAllocator;
}

void ___VCStreamOutput_SendSampleBufferToXPCClient_block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:xpcArguments:context:", "streamOutputDidReceiveFrame", v2, *(void *)(a1 + 32), *(void *)(a1 + 40));

  v3 = *(void **)(a1 + 32);

  xpc_release(v3);
}

- (void)initWithStreamToken:clientProcessID:delegate:delegateQueue:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create queue", v2, v3, v4, v5, v6);
}

- (void)createRemoteQueue
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Could not get the shared pool allocator for the remoteQueue", v2, v3, v4, v5, v6);
}

- (void)initXPCCommandQueue
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create xpcCommandQueue", v2, v3, v4, v5, v6);
}

- (void)didPause:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Client run out of process, should not do delegate callback", v2, v3, v4, v5, v6);
}

@end