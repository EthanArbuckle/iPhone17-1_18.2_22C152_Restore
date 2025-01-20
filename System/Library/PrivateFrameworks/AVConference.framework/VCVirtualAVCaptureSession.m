@interface VCVirtualAVCaptureSession
- (BOOL)canAddInput:(id)a3;
- (BOOL)canAddOutput:(id)a3;
- (BOOL)connectionExists:(id)a3 output:(id)a4;
- (BOOL)supportsAVCaptureSessionPreset;
- (VCVirtualAVCaptureSession)init;
- (id)connections;
- (id)inputs;
- (id)newConnectionWithInputPorts:(id)a3 outputDevice:(id)a4;
- (id)outputs;
- (int)startInputDevices;
- (int)stopInputDevices;
- (void)addConnection:(id)a3;
- (void)addConnectionWithInput:(id)a3 output:(id)a4;
- (void)addInput:(id)a3;
- (void)addOutput:(id)a3;
- (void)beginConfiguration;
- (void)commitConfiguration;
- (void)dealloc;
- (void)init;
- (void)postNotification:(id)a3;
- (void)pushConfigurationBlock:(id)a3;
- (void)removeInput:(id)a3;
- (void)removeOutput:(id)a3;
- (void)startRunning;
- (void)stopRunning;
@end

@implementation VCVirtualAVCaptureSession

- (VCVirtualAVCaptureSession)init
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)VCVirtualAVCaptureSession;
  v2 = [(VCVirtualAVCaptureSession *)&v11 init];
  v3 = v2;
  if (!v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureSession init]();
      }
    }
    goto LABEL_26;
  }
  v2->_isRunning = 0;
  v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3->_inputs = v4;
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureSession init]();
      }
    }
    goto LABEL_26;
  }
  v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3->_outputs = v5;
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureSession init]();
      }
    }
    goto LABEL_26;
  }
  v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3->_connections = v6;
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureSession init].cold.4();
      }
    }
    goto LABEL_26;
  }
  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3->_batchedConfigurations = v7;
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureSession init].cold.5();
      }
    }
    goto LABEL_26;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  dispatch_queue_t v9 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVirtualAVCaptureSession.stateQueue", 0, CustomRootQueue);
  v3->_stateQueue = (OS_dispatch_queue *)v9;
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureSession init].cold.6();
      }
    }
LABEL_26:

    return 0;
  }
  return v3;
}

- (void)dealloc
{
  block[5] = *MEMORY[0x1E4F143B8];

  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__VCVirtualAVCaptureSession_dealloc__block_invoke;
  block[3] = &unk_1E6DB3DC8;
  block[4] = self;
  dispatch_sync(stateQueue, block);

  v4 = self->_stateQueue;
  if (v4)
  {
    dispatch_release(v4);
    self->_stateQueue = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)VCVirtualAVCaptureSession;
  [(VCVirtualAVCaptureSession *)&v5 dealloc];
}

uint64_t __36__VCVirtualAVCaptureSession_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v1 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t result = [v1 countByEnumeratingWithState:&v7 objects:v6 count:16];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v5++) invalidate];
      }
      while (v3 != v5);
      uint64_t result = [v1 countByEnumeratingWithState:&v7 objects:v6 count:16];
      uint64_t v3 = result;
    }
    while (result);
  }
  return result;
}

- (void)startRunning
{
  v3[5] = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__VCVirtualAVCaptureSession_startRunning__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_sync(stateQueue, v3);
}

unsigned char *__41__VCVirtualAVCaptureSession_startRunning__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[16])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315650;
        uint64_t v7 = v4;
        __int16 v8 = 2080;
        long long v9 = "-[VCVirtualAVCaptureSession startRunning]_block_invoke";
        __int16 v10 = 1024;
        int v11 = 89;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Session is already running", (uint8_t *)&v6, 0x1Cu);
      }
    }
  }
  else if (([v2 startInputDevices] & 0x80000000) != 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __41__VCVirtualAVCaptureSession_startRunning__block_invoke_cold_1();
      }
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
    [*(id *)(a1 + 32) postNotification:*MEMORY[0x1E4F15988]];
  }
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (!result[16])
  {
    [result stopInputDevices];
    return (unsigned char *)[*(id *)(a1 + 32) postNotification:*MEMORY[0x1E4F159C8]];
  }
  return result;
}

- (void)stopRunning
{
  v3[5] = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__VCVirtualAVCaptureSession_stopRunning__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_sync(stateQueue, v3);
}

unsigned char *__40__VCVirtualAVCaptureSession_stopRunning__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[16])
  {
    if (([v2 stopInputDevices] & 0x80000000) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __40__VCVirtualAVCaptureSession_stopRunning__block_invoke_cold_1();
        }
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
      [*(id *)(a1 + 32) postNotification:*MEMORY[0x1E4F15990]];
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315650;
      uint64_t v7 = v4;
      __int16 v8 = 2080;
      long long v9 = "-[VCVirtualAVCaptureSession stopRunning]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 106;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Session is already stopped", (uint8_t *)&v6, 0x1Cu);
    }
  }
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (result[16]) {
    return (unsigned char *)[result postNotification:*MEMORY[0x1E4F159C8]];
  }
  return result;
}

- (int)startInputDevices
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  inputs = self->_inputs;
  uint64_t v3 = [(NSMutableSet *)inputs countByEnumeratingWithState:&v24 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(inputs);
        }
        uint64_t v7 = (void *)[*(id *)(*((void *)&v24 + 1) + 8 * i) device];
        if (objc_opt_respondsToSelector())
        {
          int v8 = [v7 startVirtualCapture];
          if (v8 < 0)
          {
            int v9 = v8;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v11 = VRTraceErrorLogLevelToCSTR();
              uint64_t v12 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
              {
                int v13 = 136316162;
                uint64_t v14 = v11;
                __int16 v15 = 2080;
                v16 = "-[VCVirtualAVCaptureSession startInputDevices]";
                __int16 v17 = 1024;
                int v18 = 126;
                __int16 v19 = 2048;
                v20 = v7;
                __int16 v21 = 1024;
                int v22 = v9;
                _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to start virtual device[%p]. result=%d", (uint8_t *)&v13, 0x2Cu);
              }
            }
            return v9;
          }
        }
      }
      uint64_t v4 = [(NSMutableSet *)inputs countByEnumeratingWithState:&v24 objects:v23 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  return 0;
}

- (int)stopInputDevices
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  inputs = self->_inputs;
  uint64_t v3 = [(NSMutableSet *)inputs countByEnumeratingWithState:&v24 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v25;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(inputs);
        }
        uint64_t v7 = (void *)[*(id *)(*((void *)&v24 + 1) + 8 * v6) device];
        if (objc_opt_respondsToSelector())
        {
          int v8 = [v7 stopVirtualCapture];
          if (v8 < 0)
          {
            int v9 = v8;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v10 = VRTraceErrorLogLevelToCSTR();
              uint64_t v11 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
              {
                int v13 = 136316162;
                uint64_t v14 = v10;
                __int16 v15 = 2080;
                v16 = "-[VCVirtualAVCaptureSession stopInputDevices]";
                __int16 v17 = 1024;
                int v18 = 140;
                __int16 v19 = 2048;
                v20 = v7;
                __int16 v21 = 1024;
                int v22 = v9;
                _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to stop virtual device[%p]. result=%d", (uint8_t *)&v13, 0x2Cu);
              }
            }
            LODWORD(v3) = -2147418113;
            return v3;
          }
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [(NSMutableSet *)inputs countByEnumeratingWithState:&v24 objects:v23 count:16];
      uint64_t v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return v3;
}

- (void)pushConfigurationBlock:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  if (stateQueue)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__VCVirtualAVCaptureSession_pushConfigurationBlock___block_invoke;
    block[3] = &unk_1E6DB5178;
    block[4] = self;
    block[5] = a3;
    dispatch_sync(stateQueue, block);
  }
}

void __52__VCVirtualAVCaptureSession_pushConfigurationBlock___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(_DWORD *)(v3 + 56))
  {
    uint64_t v4 = _Block_copy(v2);
    [*(id *)(*(void *)(a1 + 32) + 48) addObject:v4];
    _Block_release(v4);
  }
  else
  {
    uint64_t v5 = (void (*)(void))v2[2];
    v5();
  }
}

- (id)newConnectionWithInputPorts:(id)a3 outputDevice:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a3 || !a4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureSession newConnectionWithInputPorts:outputDevice:]();
      }
    }
    return 0;
  }
  uint64_t v6 = [[VCVirtualAVCaptureConnection alloc] initWithInputPorts:a3 output:a4];
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureSession newConnectionWithInputPorts:outputDevice:]();
      }
    }
    return 0;
  }
  uint64_t v7 = v6;
  [a4 addConnection:v6];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v11++) addConnection:v7];
      }
      while (v9 != v11);
      uint64_t v9 = [a3 countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v9);
  }
  [(VCVirtualAVCaptureConnection *)v7 setActive:1];
  return v7;
}

- (BOOL)connectionExists:(id)a3 output:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  connections = self->_connections;
  uint64_t v8 = [(NSMutableSet *)connections countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(connections);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
        if (objc_msgSend((id)objc_msgSend(v12, "inputPorts"), "isEqualToArray:", a3)
          && (id)[v12 output] == a4)
        {
          LOBYTE(v8) = 1;
          return v8;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v8 = [(NSMutableSet *)connections countByEnumeratingWithState:&v15 objects:v14 count:16];
      uint64_t v9 = v8;
      if (v8) {
        continue;
      }
      break;
    }
  }
  return v8;
}

- (void)addConnectionWithInput:(id)a3 output:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (!-[VCVirtualAVCaptureSession connectionExists:output:](self, "connectionExists:output:", [a3 ports], a4))
  {
    id v7 = -[VCVirtualAVCaptureSession newConnectionWithInputPorts:outputDevice:](self, "newConnectionWithInputPorts:outputDevice:", [a3 ports], a4);
    if (v7)
    {
      id v10 = v7;
      [(NSMutableSet *)self->_connections addObject:v7];
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v12 = v8;
        __int16 v13 = 2080;
        long long v14 = "-[VCVirtualAVCaptureSession addConnectionWithInput:output:]";
        __int16 v15 = 1024;
        int v16 = 198;
        __int16 v17 = 2048;
        id v18 = a3;
        __int16 v19 = 2048;
        id v20 = a4;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to create connection for input:[%p], output:[%p]", buf, 0x30u);
      }
    }
  }
}

- (void)addConnection:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (self->_stateQueue)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __43__VCVirtualAVCaptureSession_addConnection___block_invoke;
      v5[3] = &unk_1E6DB3E40;
      v5[4] = self;
      v5[5] = a3;
      [(VCVirtualAVCaptureSession *)self pushConfigurationBlock:v5];
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      uint64_t v9 = "-[VCVirtualAVCaptureSession addConnection:]";
      __int16 v10 = 1024;
      int v11 = 207;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Attempting to add nil connection", buf, 0x1Cu);
    }
  }
}

void __43__VCVirtualAVCaptureSession_addConnection___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 40) containsObject:*(void *)(a1 + 40)])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v2 = VRTraceErrorLogLevelToCSTR();
      uint64_t v3 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(a1 + 40);
        int v7 = 136315906;
        uint64_t v8 = v2;
        __int16 v9 = 2080;
        __int16 v10 = "-[VCVirtualAVCaptureSession addConnection:]_block_invoke";
        __int16 v11 = 1024;
        int v12 = 212;
        __int16 v13 = 2048;
        uint64_t v14 = v4;
        _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Attempting to add connection[%p] that already exists", (uint8_t *)&v7, 0x26u);
      }
    }
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 40);
    [v6 addObject:v5];
  }
}

- (BOOL)canAddInput:(id)a3
{
  return a3 != 0;
}

- (BOOL)canAddOutput:(id)a3
{
  return a3 != 0;
}

- (void)addInput:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __38__VCVirtualAVCaptureSession_addInput___block_invoke;
    v5[3] = &unk_1E6DB3E40;
    v5[4] = self;
    v5[5] = a3;
    [(VCVirtualAVCaptureSession *)self pushConfigurationBlock:v5];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      __int16 v9 = "-[VCVirtualAVCaptureSession addInput:]";
      __int16 v10 = 1024;
      int v11 = 230;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Attempting to add nil input device", buf, 0x1Cu);
    }
  }
}

void __38__VCVirtualAVCaptureSession_addInput___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 24) containsObject:*(void *)(a1 + 40)])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v2 = VRTraceErrorLogLevelToCSTR();
      uint64_t v3 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void **)(a1 + 40);
        int v16 = 136315906;
        uint64_t v17 = v2;
        __int16 v18 = 2080;
        __int16 v19 = "-[VCVirtualAVCaptureSession addInput:]_block_invoke";
        __int16 v20 = 1024;
        int v21 = 233;
        __int16 v22 = 2048;
        v23 = v4;
        _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Attempting to add input[%p] that already exists", (uint8_t *)&v16, 0x26u);
      }
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 32);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v28 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(a1 + 32) addConnectionWithInput:*(void *)(a1 + 40) output:*(void *)(*((void *)&v27 + 1) + 8 * i)];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v26 count:16];
      }
      while (v7);
    }
    uint64_t v10 = [*(id *)(a1 + 40) device];
    if (*(unsigned char *)(*(void *)(a1 + 32) + 16))
    {
      int v11 = (void *)v10;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v12 = [v11 startVirtualCapture];
        if (v12 < 0)
        {
          int v13 = v12;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v14 = VRTraceErrorLogLevelToCSTR();
            uint64_t v15 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              int v16 = 136316162;
              uint64_t v17 = v14;
              __int16 v18 = 2080;
              __int16 v19 = "-[VCVirtualAVCaptureSession addInput:]_block_invoke";
              __int16 v20 = 1024;
              int v21 = 247;
              __int16 v22 = 2048;
              v23 = v11;
              __int16 v24 = 1024;
              int v25 = v13;
              _os_log_error_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to start virtual device[%p]. result=%d", (uint8_t *)&v16, 0x2Cu);
            }
          }
        }
      }
    }
  }
}

- (void)addOutput:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __39__VCVirtualAVCaptureSession_addOutput___block_invoke;
    v5[3] = &unk_1E6DB3E40;
    v5[4] = self;
    v5[5] = a3;
    [(VCVirtualAVCaptureSession *)self pushConfigurationBlock:v5];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      __int16 v9 = "-[VCVirtualAVCaptureSession addOutput:]";
      __int16 v10 = 1024;
      int v11 = 256;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Attempting to add nil output", buf, 0x1Cu);
    }
  }
}

void __39__VCVirtualAVCaptureSession_addOutput___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 32) containsObject:*(void *)(a1 + 40)])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v2 = VRTraceErrorLogLevelToCSTR();
      uint64_t v3 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        uint64_t v16 = v2;
        __int16 v17 = 2080;
        __int16 v18 = "-[VCVirtualAVCaptureSession addOutput:]_block_invoke";
        __int16 v19 = 1024;
        int v20 = 260;
        __int16 v21 = 2048;
        uint64_t v22 = v4;
        _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Attempting to add output[%p] that already exists", buf, 0x26u);
      }
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 24);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v10 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(a1 + 32) addConnectionWithInput:*(void *)(*((void *)&v11 + 1) + 8 * i) output:*(void *)(a1 + 40)];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v10 count:16];
      }
      while (v7);
    }
  }
}

- (void)removeInput:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __41__VCVirtualAVCaptureSession_removeInput___block_invoke;
    v5[3] = &unk_1E6DB3E40;
    v5[4] = self;
    v5[5] = a3;
    [(VCVirtualAVCaptureSession *)self pushConfigurationBlock:v5];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      __int16 v9 = "-[VCVirtualAVCaptureSession removeInput:]";
      __int16 v10 = 1024;
      int v11 = 275;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Attempting to remove nil input", buf, 0x1Cu);
    }
  }
}

uint64_t __41__VCVirtualAVCaptureSession_removeInput___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 24) containsObject:*(void *)(a1 + 40)]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [*(id *)(a1 + 40) disconnect];
  }
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 24);

  return [v3 removeObject:v2];
}

- (void)removeOutput:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __42__VCVirtualAVCaptureSession_removeOutput___block_invoke;
    v5[3] = &unk_1E6DB3E40;
    v5[4] = self;
    v5[5] = a3;
    [(VCVirtualAVCaptureSession *)self pushConfigurationBlock:v5];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      __int16 v9 = "-[VCVirtualAVCaptureSession removeOutput:]";
      __int16 v10 = 1024;
      int v11 = 287;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Attempting to remove nil output", buf, 0x1Cu);
    }
  }
}

uint64_t __42__VCVirtualAVCaptureSession_removeOutput___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 32) containsObject:*(void *)(a1 + 40)]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [*(id *)(a1 + 40) disconnect];
  }
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 32);

  return [v3 removeObject:v2];
}

- (id)connections
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  __int16 v8 = &v7;
  uint64_t v9 = 0x3052000000;
  __int16 v10 = __Block_byref_object_copy__36;
  int v11 = __Block_byref_object_dispose__36;
  uint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v12 = [MEMORY[0x1E4F1C978] array];
  stateQueue = self->_stateQueue;
  if (stateQueue)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__VCVirtualAVCaptureSession_connections__block_invoke;
    block[3] = &unk_1E6DB4540;
    block[4] = self;
    block[5] = &v7;
    dispatch_sync(stateQueue, block);
  }
  uint64_t v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __40__VCVirtualAVCaptureSession_connections__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 40) allObjects];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)inputs
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  __int16 v8 = &v7;
  uint64_t v9 = 0x3052000000;
  __int16 v10 = __Block_byref_object_copy__36;
  int v11 = __Block_byref_object_dispose__36;
  uint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v12 = [MEMORY[0x1E4F1C978] array];
  stateQueue = self->_stateQueue;
  if (stateQueue)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__VCVirtualAVCaptureSession_inputs__block_invoke;
    block[3] = &unk_1E6DB4540;
    block[4] = self;
    block[5] = &v7;
    dispatch_sync(stateQueue, block);
  }
  uint64_t v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __35__VCVirtualAVCaptureSession_inputs__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) allObjects];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)outputs
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  __int16 v8 = &v7;
  uint64_t v9 = 0x3052000000;
  __int16 v10 = __Block_byref_object_copy__36;
  int v11 = __Block_byref_object_dispose__36;
  uint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v12 = [MEMORY[0x1E4F1C978] array];
  stateQueue = self->_stateQueue;
  if (stateQueue)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__VCVirtualAVCaptureSession_outputs__block_invoke;
    block[3] = &unk_1E6DB4540;
    block[4] = self;
    block[5] = &v7;
    dispatch_sync(stateQueue, block);
  }
  uint64_t v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __36__VCVirtualAVCaptureSession_outputs__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) allObjects];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)postNotification:(id)a3
{
  uint64_t v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];

  [v5 postNotificationName:a3 object:self];
}

- (BOOL)supportsAVCaptureSessionPreset
{
  return 0;
}

- (void)beginConfiguration
{
  v3[5] = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  if (stateQueue)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __47__VCVirtualAVCaptureSession_beginConfiguration__block_invoke;
    v3[3] = &unk_1E6DB3DC8;
    v3[4] = self;
    dispatch_sync(stateQueue, v3);
  }
}

uint64_t __47__VCVirtualAVCaptureSession_beginConfiguration__block_invoke(uint64_t result)
{
  return result;
}

- (void)commitConfiguration
{
  v3[5] = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  if (stateQueue)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __48__VCVirtualAVCaptureSession_commitConfiguration__block_invoke;
    v3[3] = &unk_1E6DB3DC8;
    v3[4] = self;
    dispatch_sync(stateQueue, v3);
  }
}

uint64_t __48__VCVirtualAVCaptureSession_commitConfiguration__block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(result + 32);
  uint64_t v3 = *(unsigned int *)(v2 + 56);
  uint64_t v4 = *(void *)(v2 + 48);
  if (!v3 || !v4)
  {
    uint64_t result = [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"commitConfiguration invalid state. _configurationCount=%d, _batchedConfigurations=%@", v3, v4 format];
    uint64_t v2 = *(void *)(v1 + 32);
    LODWORD(v3) = *(_DWORD *)(v2 + 56);
  }
  *(_DWORD *)(v2 + ++*(_DWORD *)(*(void *)(result + 32) + 56) = v3 - 1;
  uint64_t v5 = *(void *)(v1 + 32);
  if (!*(_DWORD *)(v5 + 56))
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = *(void **)(v5 + 48);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v11 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * i) + 16))();
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v11 count:16];
      }
      while (v8);
    }
    return [*(id *)(*(void *)(v1 + 32) + 48) removeAllObjects];
  }
  return result;
}

- (void)init
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create state queue", v2, v3, v4, v5, v6);
}

void __41__VCVirtualAVCaptureSession_startRunning__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Session failed to stop input devices", v2, v3, v4, v5, v6);
}

void __40__VCVirtualAVCaptureSession_stopRunning__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Session failed to stop input devices", v2, v3, v4, v5, v6);
}

- (void)newConnectionWithInputPorts:outputDevice:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate connection", v2, v3, v4, v5, v6);
}

- (void)newConnectionWithInputPorts:outputDevice:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid virtual IO", v2, v3, v4, v5, v6);
}

@end