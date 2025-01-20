@interface VCVirtualAVCaptureVideoDataOutput
- (VCVirtualAVCaptureVideoDataOutput)init;
- (id)connectionWithMediaType:(id)a3;
- (id)connections;
- (void)addConnection:(id)a3;
- (void)dealloc;
- (void)disconnect;
- (void)init;
- (void)removeConnection:(id)a3;
- (void)setSampleBufferDelegate:(id)a3 queue:(id)a4;
@end

@implementation VCVirtualAVCaptureVideoDataOutput

- (VCVirtualAVCaptureVideoDataOutput)init
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCVirtualAVCaptureVideoDataOutput;
  v2 = [(AVCaptureVideoDataOutput *)&v7 init];
  if (!v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureVideoDataOutput init](v5);
      }
    }
    goto LABEL_11;
  }
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v2->_connections = v3;
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureVideoDataOutput init](v6);
      }
    }
LABEL_11:

    return 0;
  }
  v2->_stateLock._os_unfair_lock_opaque = 0;
  return v2;
}

- (void)disconnect
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  connections = self->_connections;
  uint64_t v5 = [(NSMutableArray *)connections countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(connections);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v9 invalidate];
        }
      }
      uint64_t v6 = [(NSMutableArray *)connections countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v6);
  }
  [(NSMutableArray *)self->_connections removeAllObjects];
  os_unfair_lock_unlock(p_stateLock);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCVirtualAVCaptureVideoDataOutput *)self disconnect];

  [(VCVirtualAVCaptureVideoDataOutput *)self setSampleBufferDelegate:0 queue:0];
  v3.receiver = self;
  v3.super_class = (Class)VCVirtualAVCaptureVideoDataOutput;
  [(AVCaptureVideoDataOutput *)&v3 dealloc];
}

- (void)setSampleBufferDelegate:(id)a3 queue:(id)a4
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if ((id)[(VCWeakObjectHolder *)self->_weakPushDelegate strong] != a3)
  {

    self->_weakPushDelegate = 0;
    if (a3) {
      self->_weakPushDelegate = (VCWeakObjectHolder *)[objc_alloc(MEMORY[0x1E4F47A30]) initWithObject:a3];
    }
  }
  callbackQueue = self->_callbackQueue;
  if (callbackQueue != a4)
  {
    if (a4)
    {
      dispatch_retain((dispatch_object_t)a4);
      callbackQueue = self->_callbackQueue;
    }
    if (callbackQueue) {
      dispatch_release(callbackQueue);
    }
    self->_callbackQueue = (OS_dispatch_queue *)a4;
  }

  os_unfair_lock_unlock(p_stateLock);
}

- (void)addConnection:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    p_stateLock = &self->_stateLock;
    os_unfair_lock_lock(&self->_stateLock);
    if ([(NSMutableArray *)self->_connections containsObject:a3])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 136316162;
          uint64_t v11 = v6;
          __int16 v12 = 2080;
          long long v13 = "-[VCVirtualAVCaptureVideoDataOutput addConnection:]";
          __int16 v14 = 1024;
          int v15 = 104;
          __int16 v16 = 2112;
          id v17 = a3;
          __int16 v18 = 2112;
          v19 = self;
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Attempting to add connection that is already added to the session. Connection=%@, session=%@", (uint8_t *)&v10, 0x30u);
        }
      }
    }
    else
    {
      [(NSMutableArray *)self->_connections addObject:a3];
    }
    os_unfair_lock_unlock(p_stateLock);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315650;
      uint64_t v11 = v8;
      __int16 v12 = 2080;
      long long v13 = "-[VCVirtualAVCaptureVideoDataOutput addConnection:]";
      __int16 v14 = 1024;
      int v15 = 97;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Attempting to add nil connection", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

- (void)removeConnection:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if ([(NSMutableArray *)self->_connections containsObject:a3])
  {
    [a3 invalidate];
    [(NSMutableArray *)self->_connections removeObject:a3];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136316162;
      uint64_t v9 = v6;
      __int16 v10 = 2080;
      uint64_t v11 = "-[VCVirtualAVCaptureVideoDataOutput removeConnection:]";
      __int16 v12 = 1024;
      int v13 = 115;
      __int16 v14 = 2112;
      id v15 = a3;
      __int16 v16 = 2112;
      id v17 = self;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Attempting to remove connection that does not exist in the session. Connection=%@, session=%@", (uint8_t *)&v8, 0x30u);
    }
  }
  os_unfair_lock_unlock(p_stateLock);
}

- (id)connectionWithMediaType:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = [(VCVirtualAVCaptureVideoDataOutput *)self connections];
  id result = (id)[v4 countByEnumeratingWithState:&v21 objects:v20 count:16];
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        __int16 v10 = (void *)[v9 inputPorts];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v15 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v17;
          while (2)
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v17 != v13) {
                objc_enumerationMutation(v10);
              }
              if ((id)[*(id *)(*((void *)&v16 + 1) + 8 * v14) mediaType] == a3) {
                return v9;
              }
              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v15 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
      }
      id v6 = (id)[v4 countByEnumeratingWithState:&v21 objects:v20 count:16];
      id result = 0;
    }
    while (v6);
  }
  return result;
}

- (id)connections
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  id v4 = (void *)[(NSMutableArray *)self->_connections copy];
  os_unfair_lock_unlock(p_stateLock);

  return v4;
}

void __VCVirtualAVCaptureVideoDataOutput_OnMediaSample_block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "captureOutput:didOutputSampleBuffer:fromConnection:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 48));
  v2 = *(const void **)(a1 + 56);
  if (v2) {
    CFRelease(v2);
  }
  objc_super v3 = *(void **)(a1 + 32);
}

- (void)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 43;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate connections array", (uint8_t *)&v2, 0x1Cu);
}

@end