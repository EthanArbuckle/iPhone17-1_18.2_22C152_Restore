@interface VCVirtualTextDevice
- (BOOL)setStreamConfig:(id)a3 withError:(id *)a4;
- (OS_dispatch_queue)mediaStreamDelegateQueue;
- (VCMediaStreamDelegate)mediaStreamDelegate;
- (VCVirtualTextDevice)initWithSendDelegate:(id)a3 clientPid:(int)a4 delegate:(id)a5 delegateFunctions:(const tagVCMediaStreamDelegateRealtimeInstanceVTable *)a6 delegateQueue:(id)a7;
- (id)pause;
- (id)resume;
- (id)sendDelegate;
- (id)setPause:(BOOL)a3;
- (id)start;
- (id)stop;
- (id)stopWithError:(id)a3;
- (tagVCMediaStreamDelegateRealtimeInstanceVTable)mediaStreamDelegateFunctions;
- (void)dealloc;
- (void)didReceiveText:(id)a3;
- (void)sendCharacter:(unsigned __int16)a3;
- (void)sendText:(id)a3;
- (void)setMediaStreamDelegate:(id)a3;
- (void)setMediaStreamDelegateFunctions:(tagVCMediaStreamDelegateRealtimeInstanceVTable)a3;
- (void)setMediaStreamDelegateQueue:(id)a3;
@end

@implementation VCVirtualTextDevice

- (BOOL)setStreamConfig:(id)a3 withError:(id *)a4
{
  return 1;
}

- (VCVirtualTextDevice)initWithSendDelegate:(id)a3 clientPid:(int)a4 delegate:(id)a5 delegateFunctions:(const tagVCMediaStreamDelegateRealtimeInstanceVTable *)a6 delegateQueue:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)VCVirtualTextDevice;
  v12 = [(VCVirtualTextDevice *)&v26 init];
  v13 = v12;
  if (v12)
  {
    v12->_clientPid = a4;
    objc_storeWeak(&v12->_sendDelegate, a3);
    objc_storeWeak(&v13->_mediaStreamDelegate, a5);
    updateFrequencyLevel = a6->updateFrequencyLevel;
    v13->_mediaStreamDelegateQueue = (OS_dispatch_queue *)a7;
    v13->_mediaStreamDelegateFunctions.updateFrequencyLevel = updateFrequencyLevel;
    dispatch_retain((dispatch_object_t)a7);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    dispatch_queue_t v16 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVirtualTextDevice.queue", 0, CustomRootQueue);
    v13->_state = 0;
    v13->_queue = (OS_dispatch_queue *)v16;
  }
  if ((VCVirtualTextDevice *)objc_opt_class() == v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v28 = v18;
        __int16 v29 = 2080;
        v30 = "-[VCVirtualTextDevice initWithSendDelegate:clientPid:delegate:delegateFunctions:delegateQueue:]";
        __int16 v31 = 1024;
        int v32 = 51;
        v20 = " [%s] %s:%d ";
        v21 = v19;
        uint32_t v22 = 28;
LABEL_13:
        _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v17 = (__CFString *)[(VCVirtualTextDevice *)v13 performSelector:sel_logPrefix];
    }
    else {
      v17 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v28 = v23;
        __int16 v29 = 2080;
        v30 = "-[VCVirtualTextDevice initWithSendDelegate:clientPid:delegate:delegateFunctions:delegateQueue:]";
        __int16 v31 = 1024;
        int v32 = 51;
        __int16 v33 = 2112;
        v34 = v17;
        __int16 v35 = 2048;
        v36 = v13;
        v20 = " [%s] %s:%d %@(%p) ";
        v21 = v24;
        uint32_t v22 = 48;
        goto LABEL_13;
      }
    }
  }
  return v13;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  objc_storeWeak(&self->_sendDelegate, 0);
  objc_storeWeak(&self->_mediaStreamDelegate, 0);
  dispatch_release((dispatch_object_t)self->_mediaStreamDelegateQueue);
  dispatch_release((dispatch_object_t)self->_queue);
  v3.receiver = self;
  v3.super_class = (Class)VCVirtualTextDevice;
  [(VCVirtualTextDevice *)&v3 dealloc];
}

- (VCMediaStreamDelegate)mediaStreamDelegate
{
  return (VCMediaStreamDelegate *)objc_loadWeak(&self->_mediaStreamDelegate);
}

- (OS_dispatch_queue)mediaStreamDelegateQueue
{
  return self->_mediaStreamDelegateQueue;
}

- (void)setMediaStreamDelegate:(id)a3
{
}

- (void)setMediaStreamDelegateQueue:(id)a3
{
  mediaStreamDelegateQueue = self->_mediaStreamDelegateQueue;
  if (mediaStreamDelegateQueue)
  {
    dispatch_release(mediaStreamDelegateQueue);
    self->_mediaStreamDelegateQueue = 0;
  }
  if (a3)
  {
    self->_mediaStreamDelegateQueue = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)a3);
  }
}

- (id)sendDelegate
{
  return objc_loadWeak(&self->_sendDelegate);
}

- (id)start
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((VCVirtualTextDevice *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v4;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCVirtualTextDevice start]";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v16) = 93;
        v6 = " [%s] %s:%d ";
        v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      objc_super v3 = (__CFString *)[(VCVirtualTextDevice *)self performSelector:sel_logPrefix];
    }
    else {
      objc_super v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = v9;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCVirtualTextDevice start]";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v16) = 93;
        WORD2(v16) = 2112;
        *(void *)((char *)&v16 + 6) = v3;
        HIWORD(v16) = 2048;
        v17 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3052000000;
  *(void *)&long long v16 = __Block_byref_object_copy__28;
  *((void *)&v16 + 1) = __Block_byref_object_dispose__28;
  v17 = 0;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __28__VCVirtualTextDevice_start__block_invoke;
  v14[3] = &unk_1E6DB3EB8;
  v14[4] = self;
  v14[5] = buf;
  dispatch_sync(queue, v14);
  v12 = *(void **)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);
  return v12;
}

uint64_t __28__VCVirtualTextDevice_start__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = result;
    result = [MEMORY[0x1E4F28C58] AVConferenceServiceError:32026 detailCode:v2 description:@"Invalid state"];
    *(void *)(*(void *)(*(void *)(v3 + 40) + 8) + 40) = result;
  }
  else
  {
    *(void *)(v1 + 16) = 2;
  }
  return result;
}

- (id)stop
{
  return [(VCVirtualTextDevice *)self stopWithError:0];
}

- (id)stopWithError:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((VCVirtualTextDevice *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v16 = v5;
        __int16 v17 = 2080;
        uint64_t v18 = "-[VCVirtualTextDevice stopWithError:]";
        __int16 v19 = 1024;
        int v20 = 111;
        v7 = " [%s] %s:%d ";
        uint32_t v8 = v6;
        uint32_t v9 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v4 = (__CFString *)[(VCVirtualTextDevice *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v4 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v16 = v10;
        __int16 v17 = 2080;
        uint64_t v18 = "-[VCVirtualTextDevice stopWithError:]";
        __int16 v19 = 1024;
        int v20 = 111;
        __int16 v21 = 2112;
        uint32_t v22 = v4;
        __int16 v23 = 2048;
        v24 = self;
        v7 = " [%s] %s:%d %@(%p) ";
        uint32_t v8 = v11;
        uint32_t v9 = 48;
        goto LABEL_11;
      }
    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__VCVirtualTextDevice_stopWithError___block_invoke;
  block[3] = &unk_1E6DB3DC8;
  block[4] = self;
  dispatch_sync(queue, block);
  return 0;
}

uint64_t __37__VCVirtualTextDevice_stopWithError___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 16) = 0;
  return result;
}

- (id)pause
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((VCVirtualTextDevice *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v4;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCVirtualTextDevice pause]";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v16) = 119;
        v6 = " [%s] %s:%d ";
        v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (__CFString *)[(VCVirtualTextDevice *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = v9;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCVirtualTextDevice pause]";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v16) = 119;
        WORD2(v16) = 2112;
        *(void *)((char *)&v16 + 6) = v3;
        HIWORD(v16) = 2048;
        __int16 v17 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3052000000;
  *(void *)&long long v16 = __Block_byref_object_copy__28;
  *((void *)&v16 + 1) = __Block_byref_object_dispose__28;
  __int16 v17 = 0;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __28__VCVirtualTextDevice_pause__block_invoke;
  v14[3] = &unk_1E6DB3EB8;
  v14[4] = self;
  v14[5] = buf;
  dispatch_sync(queue, v14);
  v12 = *(void **)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);
  return v12;
}

uint64_t __28__VCVirtualTextDevice_pause__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2 == 2)
  {
    *(void *)(v1 + 16) = 1;
  }
  else
  {
    uint64_t v3 = result;
    result = [MEMORY[0x1E4F28C58] AVConferenceServiceError:32026 detailCode:v2 description:@"Invalid state"];
    *(void *)(*(void *)(*(void *)(v3 + 40) + 8) + 40) = result;
  }
  return result;
}

- (id)resume
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((VCVirtualTextDevice *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v4;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCVirtualTextDevice resume]";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v16) = 132;
        v6 = " [%s] %s:%d ";
        v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (__CFString *)[(VCVirtualTextDevice *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = v9;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCVirtualTextDevice resume]";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v16) = 132;
        WORD2(v16) = 2112;
        *(void *)((char *)&v16 + 6) = v3;
        HIWORD(v16) = 2048;
        __int16 v17 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3052000000;
  *(void *)&long long v16 = __Block_byref_object_copy__28;
  *((void *)&v16 + 1) = __Block_byref_object_dispose__28;
  __int16 v17 = 0;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __29__VCVirtualTextDevice_resume__block_invoke;
  v14[3] = &unk_1E6DB3EB8;
  v14[4] = self;
  v14[5] = buf;
  dispatch_sync(queue, v14);
  v12 = *(void **)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);
  return v12;
}

uint64_t __29__VCVirtualTextDevice_resume__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2 == 1)
  {
    *(void *)(v1 + 16) = 2;
  }
  else
  {
    uint64_t v3 = result;
    result = [MEMORY[0x1E4F28C58] AVConferenceServiceError:32026 detailCode:v2 description:@"Invalid state"];
    *(void *)(*(void *)(*(void *)(v3 + 40) + 8) + 40) = result;
  }
  return result;
}

- (id)setPause:(BOOL)a3
{
  if (a3) {
    return [(VCVirtualTextDevice *)self pause];
  }
  else {
    return [(VCVirtualTextDevice *)self resume];
  }
}

- (void)sendCharacter:(unsigned __int16)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((VCVirtualTextDevice *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E4F47A50];
      uint32_t v8 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v19 = v6;
          __int16 v20 = 2080;
          __int16 v21 = "-[VCVirtualTextDevice sendCharacter:]";
          __int16 v22 = 1024;
          int v23 = 156;
          uint64_t v9 = " [%s] %s:%d ";
          uint64_t v10 = v7;
          uint32_t v11 = 28;
LABEL_13:
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        -[VCVirtualTextDevice sendCharacter:](v6);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCVirtualTextDevice *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E4F47A50];
      v14 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v19 = v12;
          __int16 v20 = 2080;
          __int16 v21 = "-[VCVirtualTextDevice sendCharacter:]";
          __int16 v22 = 1024;
          int v23 = 156;
          __int16 v24 = 2112;
          uint64_t v25 = v5;
          __int16 v26 = 2048;
          v27 = self;
          uint64_t v9 = " [%s] %s:%d %@(%p) ";
          uint64_t v10 = v13;
          uint32_t v11 = 48;
          goto LABEL_13;
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v19 = v12;
        __int16 v20 = 2080;
        __int16 v21 = "-[VCVirtualTextDevice sendCharacter:]";
        __int16 v22 = 1024;
        int v23 = 156;
        __int16 v24 = 2112;
        uint64_t v25 = v5;
        __int16 v26 = 2048;
        v27 = self;
        _os_log_debug_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) ", buf, 0x30u);
      }
    }
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __37__VCVirtualTextDevice_sendCharacter___block_invoke;
  v16[3] = &unk_1E6DB4658;
  v16[4] = self;
  unsigned __int16 v17 = a3;
  dispatch_async(queue, v16);
}

void *__37__VCVirtualTextDevice_sendCharacter___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[2] == 2)
  {
    uint64_t v3 = (void *)[result sendDelegate];
    uint64_t v4 = *(unsigned __int16 *)(a1 + 40);
    return (void *)[v3 sendCharacter:v4];
  }
  return result;
}

- (void)sendText:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ((VCVirtualTextDevice *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E4F47A50];
      uint32_t v8 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v18 = v6;
          __int16 v19 = 2080;
          __int16 v20 = "-[VCVirtualTextDevice sendText:]";
          __int16 v21 = 1024;
          int v22 = 167;
          uint64_t v9 = " [%s] %s:%d ";
          uint64_t v10 = v7;
          uint32_t v11 = 28;
LABEL_13:
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        -[VCVirtualTextDevice sendText:](v6);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCVirtualTextDevice *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E4F47A50];
      v14 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v18 = v12;
          __int16 v19 = 2080;
          __int16 v20 = "-[VCVirtualTextDevice sendText:]";
          __int16 v21 = 1024;
          int v22 = 167;
          __int16 v23 = 2112;
          __int16 v24 = v5;
          __int16 v25 = 2048;
          __int16 v26 = self;
          uint64_t v9 = " [%s] %s:%d %@(%p) ";
          uint64_t v10 = v13;
          uint32_t v11 = 48;
          goto LABEL_13;
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v18 = v12;
        __int16 v19 = 2080;
        __int16 v20 = "-[VCVirtualTextDevice sendText:]";
        __int16 v21 = 1024;
        int v22 = 167;
        __int16 v23 = 2112;
        __int16 v24 = v5;
        __int16 v25 = 2048;
        __int16 v26 = self;
        _os_log_debug_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) ", buf, 0x30u);
      }
    }
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __32__VCVirtualTextDevice_sendText___block_invoke;
  v16[3] = &unk_1E6DB3E40;
  v16[4] = self;
  void v16[5] = a3;
  dispatch_async(queue, v16);
}

void *__32__VCVirtualTextDevice_sendText___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[2] == 2)
  {
    uint64_t v3 = (void *)[result sendDelegate];
    uint64_t v4 = *(void *)(a1 + 40);
    return (void *)[v3 sendText:v4];
  }
  return result;
}

- (void)didReceiveText:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  mediaStreamDelegateQueue = self->_mediaStreamDelegateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__VCVirtualTextDevice_didReceiveText___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(mediaStreamDelegateQueue, block);
}

uint64_t __38__VCVirtualTextDevice_didReceiveText___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) mediaStreamDelegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 vcMediaStream:v3 didReceiveText:v4];
}

- (tagVCMediaStreamDelegateRealtimeInstanceVTable)mediaStreamDelegateFunctions
{
  return self->_mediaStreamDelegateFunctions;
}

- (void)setMediaStreamDelegateFunctions:(tagVCMediaStreamDelegateRealtimeInstanceVTable)a3
{
  self->_mediaStreamDelegateFunctions = a3;
}

- (void)sendCharacter:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 156;
  _os_log_debug_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ", (uint8_t *)&v2, 0x1Cu);
}

- (void)sendText:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 167;
  _os_log_debug_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ", (uint8_t *)&v2, 0x1Cu);
}

@end