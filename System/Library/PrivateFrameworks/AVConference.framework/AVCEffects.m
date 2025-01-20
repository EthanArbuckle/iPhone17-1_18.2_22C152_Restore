@interface AVCEffects
- (AVCEffects)initWithDelegate:(id)a3;
- (AVCEffectsDelegate)delegate;
- (BOOL)enqueueSampleBuffer:(__CVBuffer *)a3 time:(id *)a4;
- (BOOL)setupRemoteReceiverQueueWithSenderQueue:(id)a3;
- (int)effectType;
- (int)mode;
- (void)avcVideoFrameDidRelease:(id)a3;
- (void)dealloc;
- (void)deregisterBlocksForNotifications;
- (void)encodeProcessedVideoFrame:(id)a3;
- (void)flushRemoteQueue;
- (void)registerBlocksForNotifications;
- (void)remoteQueueOperationHandlerWithError:(int)a3 operation:(FigRemoteOperation *)a4;
- (void)setDelegate:(id)a3;
- (void)setEffectType:(int)a3;
- (void)setMode:(int)a3;
@end

@implementation AVCEffects

- (AVCEffects)initWithDelegate:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v26 = v5;
      __int16 v27 = 2080;
      v28 = "-[AVCEffects initWithDelegate:]";
      __int16 v29 = 1024;
      int v30 = 39;
      __int16 v31 = 2112;
      id v32 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d inDelegate=%@", buf, 0x26u);
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)AVCEffects;
  v7 = [(AVCEffects *)&v24 init];
  if (!v7) {
    goto LABEL_35;
  }
  v7->_connection = objc_alloc_init(AVConferenceXPCClient);
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
  v7->_avConferenceEffectsQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.effects", 0, CustomRootQueue);
  objc_storeWeak(&v7->_delegate, a3);
  id v9 = [(AVConferenceXPCClient *)v7->_connection sendMessageSync:"vcEffectsInitialize"];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v26 = v10;
      __int16 v27 = 2080;
      v28 = "-[AVCEffects initWithDelegate:]";
      __int16 v29 = 1024;
      int v30 = 51;
      __int16 v31 = 2112;
      id v32 = v9;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Results from initialization: %@", buf, 0x26u);
    }
  }
  if ([v9 objectForKeyedSubscript:@"ERROR"])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCEffects initWithDelegate:].cold.6(v21, v9);
      }
    }
    goto LABEL_35;
  }
  [(AVCEffects *)v7 registerBlocksForNotifications];
  uint64_t v12 = [v9 objectForKeyedSubscript:@"USERXPCARGUMENTS"];
  if (!v12)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCEffects initWithDelegate:]();
      }
    }
    goto LABEL_35;
  }
  if (![(AVCEffects *)v7 setupRemoteReceiverQueueWithSenderQueue:v12])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCEffects initWithDelegate:].cold.5();
      }
    }
    goto LABEL_35;
  }
  uint64_t pid = xpc_connection_get_pid([(AVConferenceXPCClient *)v7->_connection connection]);
  if (!VCRemoteImageQueue_CreateSenderQueue(pid, &v7->_senderQueue))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCEffects initWithDelegate:].cold.4();
      }
    }
    goto LABEL_35;
  }
  uint64_t QueueXPCObject = VCRemoteImageQueue_CreateQueueXPCObject((uint64_t)v7->_senderQueue);
  if (!QueueXPCObject)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCEffects initWithDelegate:]();
      }
    }
    goto LABEL_35;
  }
  v15 = (void *)QueueXPCObject;
  id v16 = [(AVConferenceXPCClient *)v7->_connection sendMessageSync:"vcEffectsClientQueue" arguments:0 xpcArguments:QueueXPCObject];
  uint64_t v17 = [v16 objectForKeyedSubscript:@"ERROR"];
  xpc_release(v15);
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v17)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCEffects initWithDelegate:](v22, v16);
      }
    }
LABEL_35:

    return 0;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v26 = v19;
      __int16 v27 = 2080;
      v28 = "-[AVCEffects initWithDelegate:]";
      __int16 v29 = 1024;
      int v30 = 78;
      _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Successfully setup the remoteImageQueue", buf, 0x1Cu);
    }
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v14 = v5;
      __int16 v15 = 2080;
      id v16 = "-[AVCEffects dealloc]";
      __int16 v17 = 1024;
      int v18 = 91;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Begin", buf, 0x1Cu);
    }
  }
  [(AVCEffects *)self deregisterBlocksForNotifications];
  id v7 = [(AVConferenceXPCClient *)self->_connection sendMessageSync:"vcEffectsTerminate"];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    id v9 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v14 = v8;
      __int16 v15 = 2080;
      id v16 = "-[AVCEffects dealloc]";
      __int16 v17 = 1024;
      int v18 = 94;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Results from termination: %@", buf, 0x26u);
    }
  }
  VCRemoteImageQueue_Destroy((uint64_t *)&self->_senderQueue);
  VCRemoteImageQueue_Destroy((uint64_t *)&self->_receiverQueue);

  objc_storeWeak(&self->_delegate, 0);
  v12.receiver = self;
  v12.super_class = (Class)AVCEffects;
  [(AVCEffects *)&v12 dealloc];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v14 = v10;
      __int16 v15 = 2080;
      id v16 = "-[AVCEffects dealloc]";
      __int16 v17 = 1024;
      int v18 = 103;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d End", buf, 0x1Cu);
    }
  }
}

- (void)setDelegate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      uint64_t v10 = "-[AVCEffects setDelegate:]";
      __int16 v11 = 1024;
      int v12 = 107;
      __int16 v13 = 2112;
      id v14 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d delegate=%@", (uint8_t *)&v7, 0x26u);
    }
  }
  objc_storeWeak(&self->_delegate, a3);
}

- (AVCEffectsDelegate)delegate
{
  return (AVCEffectsDelegate *)objc_loadWeak(&self->_delegate);
}

- (BOOL)setupRemoteReceiverQueueWithSenderQueue:(id)a3
{
  v8[5] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v6) {
        return v6;
      }
      -[AVCEffects setupRemoteReceiverQueueWithSenderQueue:]();
    }
LABEL_10:
    LOBYTE(v6) = 0;
    return v6;
  }
  uint64_t v5 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__AVCEffects_setupRemoteReceiverQueueWithSenderQueue___block_invoke;
  v8[3] = &unk_1E6DB5690;
  v8[4] = v5;
  VCRemoteImageQueue_CreateReceiverQueue((uint64_t)a3, (uint64_t)v8, (uint64_t)self->_avConferenceEffectsQueue, &self->_receiverQueue);
  if (!self->_receiverQueue)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v6) {
        return v6;
      }
      -[AVCEffects setupRemoteReceiverQueueWithSenderQueue:]();
    }
    goto LABEL_10;
  }
  LOBYTE(v6) = 1;
  return v6;
}

void *__54__AVCEffects_setupRemoteReceiverQueueWithSenderQueue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  result = (void *)[*(id *)(a1 + 32) strong];
  if (result)
  {
    return (void *)[result remoteQueueOperationHandlerWithError:a2 operation:a3];
  }
  return result;
}

- (void)remoteQueueOperationHandlerWithError:(int)a3 operation:(FigRemoteOperation *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCEffects remoteQueueOperationHandlerWithError:operation:]();
      }
    }
  }
  else if (a4->var0 == 1)
  {
    memset(v18, 170, sizeof(v18));
    FigCFDictionaryGetCMTimeIfPresent();
    Value = CFDictionaryGetValue(a4->var4.var0.var0, @"vcEffectsImageData");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      __int16 v11 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          lastReceivedPixelBuffer = self->_lastReceivedPixelBuffer;
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = v9;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[AVCEffects remoteQueueOperationHandlerWithError:operation:]";
          *(_WORD *)&buf[22] = 1024;
          int v20 = 162;
          __int16 v21 = 2048;
          uint64_t v22 = lastReceivedPixelBuffer;
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _lastReceivedPixelBuffer=%p", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        -[AVCEffects remoteQueueOperationHandlerWithError:operation:](v9, (uint64_t)self, v10);
      }
    }
    if (self->_lastReceivedPixelBuffer)
    {
      __int16 v13 = [AVCVideoFrame alloc];
      id v14 = self->_lastReceivedPixelBuffer;
      lastReceivedDepthBuffer = self->_lastReceivedDepthBuffer;
      *(_OWORD *)buf = *(_OWORD *)v18;
      *(void *)&buf[16] = *(void *)&v18[16];
      id v16 = [(AVCVideoFrame *)v13 initWithPixelBuffer:v14 depthPixelBuffer:lastReceivedDepthBuffer time:buf imageData:Value delegate:0];
      if (objc_opt_respondsToSelector()) {
        [self->_delegate didCaptureVideoFrame:v16];
      }

      __int16 v17 = self->_lastReceivedPixelBuffer;
    }
    else
    {
      __int16 v17 = 0;
    }
    CVPixelBufferRelease(v17);
    self->_lastReceivedPixelBuffer = 0;
    CVPixelBufferRelease(self->_lastReceivedDepthBuffer);
    self->_lastReceivedDepthBuffer = 0;
  }
  else if (a4->var0 == 3)
  {
    BOOL v6 = self->_lastReceivedPixelBuffer;
    ImageBuffer = CMSampleBufferGetImageBuffer(a4->var4.var0.var0);
    if (v6) {
      self->_lastReceivedDepthBuffer = ImageBuffer;
    }
    else {
      self->_lastReceivedPixelBuffer = ImageBuffer;
    }
    CVPixelBufferRetain(ImageBuffer);
  }
}

- (void)flushRemoteQueue
{
}

- (void)registerBlocksForNotifications
{
  v6[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__AVCEffects_registerBlocksForNotifications__block_invoke;
  v6[3] = &unk_1E6DB4338;
  v6[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcEffectsServerDidDisconnect" block:v6 queue:self->_avConferenceEffectsQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__AVCEffects_registerBlocksForNotifications__block_invoke_34;
  v5[3] = &unk_1E6DB4338;
  v5[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcEffectsServerTimeOut" block:v5 queue:self->_avConferenceEffectsQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__AVCEffects_registerBlocksForNotifications__block_invoke_38;
  v4[3] = &unk_1E6DB4338;
  v4[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcEffectsFlushRemoteQueue" block:v4 queue:self->_avConferenceEffectsQueue];
}

uint64_t __44__AVCEffects_registerBlocksForNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t result = [a2 objectForKeyedSubscript:@"SERVERDIED"];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 32) strong];
    if (result)
    {
      v4 = (void *)result;
      [(id)result delegate];
      uint64_t result = objc_opt_respondsToSelector();
      if (result)
      {
        if (objc_opt_class() == v4)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(void *)&v13[16], v14, v15), "serverDidDisconnect:", v4);
          }
          uint64_t v6 = VRTraceErrorLogLevelToCSTR();
          int v7 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(void *)&v13[16], v14, v15), "serverDidDisconnect:", v4);
          }
          *(_DWORD *)__int16 v13 = 136315650;
          *(void *)&v13[4] = v6;
          *(_WORD *)&v13[12] = 2080;
          *(void *)&v13[14] = "-[AVCEffects registerBlocksForNotifications]_block_invoke";
          *(_WORD *)&v13[22] = 1024;
          LODWORD(v14) = 194;
          uint64_t v8 = " [%s] %s:%d received callback for serverDidDisconnect";
          uint64_t v9 = v7;
          uint32_t v10 = 28;
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            uint64_t v5 = (__CFString *)[v4 performSelector:sel_logPrefix];
          }
          else {
            uint64_t v5 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(void *)&v13[16], v14, v15), "serverDidDisconnect:", v4);
          }
          uint64_t v11 = VRTraceErrorLogLevelToCSTR();
          int v12 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(void *)&v13[16], v14, v15), "serverDidDisconnect:", v4);
          }
          *(_DWORD *)__int16 v13 = 136316162;
          *(void *)&v13[4] = v11;
          *(_WORD *)&v13[12] = 2080;
          *(void *)&v13[14] = "-[AVCEffects registerBlocksForNotifications]_block_invoke";
          *(_WORD *)&v13[22] = 1024;
          LODWORD(v14) = 194;
          WORD2(v14) = 2112;
          *(void *)((char *)&v14 + 6) = v5;
          HIWORD(v14) = 2048;
          uint64_t v15 = v4;
          uint64_t v8 = " [%s] %s:%d %@(%p) received callback for serverDidDisconnect";
          uint64_t v9 = v12;
          uint32_t v10 = 48;
        }
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, v13, v10);
        return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(void *)&v13[16], v14, v15), "serverDidDisconnect:", v4);
      }
    }
  }
  return result;
}

uint64_t __44__AVCEffects_registerBlocksForNotifications__block_invoke_34(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t result = [a2 objectForKeyedSubscript:@"SERVERDIED"];
  if (!result)
  {
    uint64_t result = [*(id *)(a1 + 32) strong];
    if (result)
    {
      v4 = (void *)result;
      [(id)result delegate];
      uint64_t result = objc_opt_respondsToSelector();
      if (result)
      {
        [v4 setMode:0];
        if (objc_opt_class() == v4)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(void *)&v13[16], v14, v15), "serverDidTimeout:", v4);
          }
          uint64_t v6 = VRTraceErrorLogLevelToCSTR();
          int v7 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(void *)&v13[16], v14, v15), "serverDidTimeout:", v4);
          }
          *(_DWORD *)__int16 v13 = 136315650;
          *(void *)&v13[4] = v6;
          *(_WORD *)&v13[12] = 2080;
          *(void *)&v13[14] = "-[AVCEffects registerBlocksForNotifications]_block_invoke";
          *(_WORD *)&v13[22] = 1024;
          LODWORD(v14) = 209;
          uint64_t v8 = " [%s] %s:%d received callback for serverDidTimeout";
          uint64_t v9 = v7;
          uint32_t v10 = 28;
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            uint64_t v5 = (__CFString *)[v4 performSelector:sel_logPrefix];
          }
          else {
            uint64_t v5 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(void *)&v13[16], v14, v15), "serverDidTimeout:", v4);
          }
          uint64_t v11 = VRTraceErrorLogLevelToCSTR();
          int v12 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(void *)&v13[16], v14, v15), "serverDidTimeout:", v4);
          }
          *(_DWORD *)__int16 v13 = 136316162;
          *(void *)&v13[4] = v11;
          *(_WORD *)&v13[12] = 2080;
          *(void *)&v13[14] = "-[AVCEffects registerBlocksForNotifications]_block_invoke";
          *(_WORD *)&v13[22] = 1024;
          LODWORD(v14) = 209;
          WORD2(v14) = 2112;
          *(void *)((char *)&v14 + 6) = v5;
          HIWORD(v14) = 2048;
          uint64_t v15 = v4;
          uint64_t v8 = " [%s] %s:%d %@(%p) received callback for serverDidTimeout";
          uint64_t v9 = v12;
          uint32_t v10 = 48;
        }
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, v13, v10);
        return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(void *)&v13[16], v14, v15), "serverDidTimeout:", v4);
      }
    }
  }
  return result;
}

void *__44__AVCEffects_registerBlocksForNotifications__block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t result = (void *)[a2 objectForKeyedSubscript:@"SERVERDIED"];
  if (!result)
  {
    uint64_t result = (void *)[*(id *)(a1 + 32) strong];
    if (result)
    {
      return (void *)[result flushRemoteQueue];
    }
  }
  return result;
}

- (void)deregisterBlocksForNotifications
{
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcEffectsServerDidDisconnect"];
  connection = self->_connection;

  [(AVConferenceXPCClient *)connection deregisterFromService:"vcEffectsServerTimeOut"];
}

- (void)avcVideoFrameDidRelease:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = @"vcEffectsFrameTime";
  v4 = NSNumber;
  if (a3)
  {
    [a3 time];
    a3 = v5;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
  v9[0] = objc_msgSend(v4, "numberWithLongLong:", a3, v5, v6, v7, v8);
  -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcEffectsClientReleasedVideoFrame", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1]);
}

- (void)setMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  uint64_t v6 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v17 = v7;
      __int16 v18 = 2080;
      __int16 v19 = "-[AVCEffects setMode:]";
      __int16 v20 = 1024;
      int v21 = 246;
      __int16 v22 = 1024;
      int v23 = v3;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d mode=%d", buf, 0x22u);
    }
  }
  self->_mode = v3;
  uint64_t v9 = [NSNumber numberWithInt:v3];
  id v10 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v11 = objc_msgSend(v10, "initWithObjectsAndKeys:", v9, @"vcEffectsSetEffectsMode", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_effectType), @"vcEffectsEffectsType", 0);
  avConferenceEffectsQueue = self->_avConferenceEffectsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__AVCEffects_setMode___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  block[5] = v11;
  dispatch_async(avConferenceEffectsQueue, block);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    long long v14 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v17 = v13;
      __int16 v18 = 2080;
      __int16 v19 = "-[AVCEffects setMode:]";
      __int16 v20 = 1024;
      int v21 = 271;
      __int16 v22 = 1024;
      int v23 = v3;
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting the effects mode %d", buf, 0x22u);
    }
  }
}

void __22__AVCEffects_setMode___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) sendMessageAsync:"vcEffectsSetMode" arguments:*(void *)(a1 + 40) reply:0];

  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(_DWORD *)(v2 + 32))
  {
    uint64_t v3 = *(void *)(v2 + 56);
    VCRemoteImageQueue_ReleaseIOSurfaces(v3);
  }
}

- (void)setEffectType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v16 = v5;
      __int16 v17 = 2080;
      __int16 v18 = "-[AVCEffects setEffectType:]";
      __int16 v19 = 1024;
      int v20 = 277;
      __int16 v21 = 1024;
      int v22 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d effectType=%d", buf, 0x22u);
    }
  }
  if (self->_effectType == v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v16 = v7;
        __int16 v17 = 2080;
        __int16 v18 = "-[AVCEffects setEffectType:]";
        __int16 v19 = 1024;
        int v20 = 279;
        __int16 v21 = 1024;
        int v22 = v3;
        uint64_t v9 = " [%s] %s:%d Effect type is already set to %d";
LABEL_13:
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0x22u);
      }
    }
  }
  else
  {
    self->_effectType = v3;
    if (self->_mode)
    {
      id v10 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      uint64_t v11 = objc_msgSend(v10, "initWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v3), @"vcEffectsEffectsType", 0);
      avConferenceEffectsQueue = self->_avConferenceEffectsQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __28__AVCEffects_setEffectType___block_invoke;
      block[3] = &unk_1E6DB3E40;
      block[4] = self;
      block[5] = v11;
      dispatch_async(avConferenceEffectsQueue, block);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v16 = v13;
        __int16 v17 = 2080;
        __int16 v18 = "-[AVCEffects setEffectType:]";
        __int16 v19 = 1024;
        int v20 = 299;
        __int16 v21 = 1024;
        int v22 = v3;
        uint64_t v9 = " [%s] %s:%d Setting the effect type to %d";
        goto LABEL_13;
      }
    }
  }
}

void __28__AVCEffects_setEffectType___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) sendMessageAsync:"vcEffectsSetEffectType" arguments:*(void *)(a1 + 40) reply:0];
  uint64_t v2 = *(void **)(a1 + 40);
}

- (BOOL)enqueueSampleBuffer:(__CVBuffer *)a3 time:(id *)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a4;
  CMSampleBufferRef SampleBufferWithPixelBuffer = createSampleBufferWithPixelBuffer(a3, (long long *)&v10.var0);
  if (SampleBufferWithPixelBuffer)
  {
    CMSampleBufferRef v6 = SampleBufferWithPixelBuffer;
    int v7 = VCRemoteImageQueue_EnqueueFrame((uint64_t)self->_senderQueue, (unint64_t)SampleBufferWithPixelBuffer);
    CFRelease(v6);
    if (!v7)
    {
      LOBYTE(v8) = 1;
      return v8;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v8) {
        return v8;
      }
      -[AVCEffects enqueueSampleBuffer:time:]();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v8) {
      return v8;
    }
    -[AVCEffects enqueueSampleBuffer:time:]();
  }
  LOBYTE(v8) = 0;
  return v8;
}

- (void)encodeProcessedVideoFrame:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  CMSampleBufferRef v6 = (unsigned char *)MEMORY[0x1E4F47A40];
  int v7 = (NSObject **)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 8)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *v7;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *v7;
    if (*v6)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v22 = v8;
        __int16 v23 = 2080;
        uint64_t v24 = "-[AVCEffects encodeProcessedVideoFrame:]";
        __int16 v25 = 1024;
        int v26 = 319;
        __int16 v27 = 2112;
        id v28 = a3;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d videoFrame=%@", buf, 0x26u);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[AVCEffects encodeProcessedVideoFrame:]();
    }
  }
  kdebug_trace();
  id v11 = a3;
  avConferenceEffectsQueue = self->_avConferenceEffectsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__AVCEffects_encodeProcessedVideoFrame___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  block[5] = a3;
  dispatch_async(avConferenceEffectsQueue, block);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    long long v14 = *v7;
    uint64_t v15 = *v7;
    if (*v6)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        if (a3)
        {
          [a3 time];
          uint64_t v16 = v19;
        }
        else
        {
          uint64_t v16 = 0;
        }
        *(_DWORD *)buf = 136315906;
        uint64_t v22 = v13;
        __int16 v23 = 2080;
        uint64_t v24 = "-[AVCEffects encodeProcessedVideoFrame:]";
        __int16 v25 = 1024;
        int v26 = 358;
        __int16 v27 = 2048;
        id v28 = v16;
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Encoding processed video frame %lld", buf, 0x26u);
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      if (a3)
      {
        [a3 time];
        __int16 v17 = v18;
      }
      else
      {
        __int16 v17 = 0;
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v22 = v13;
      __int16 v23 = 2080;
      uint64_t v24 = "-[AVCEffects encodeProcessedVideoFrame:]";
      __int16 v25 = 1024;
      int v26 = 358;
      __int16 v27 = 2048;
      id v28 = v17;
      _os_log_debug_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Encoding processed video frame %lld", buf, 0x26u);
    }
  }
}

void __40__AVCEffects_encodeProcessedVideoFrame___block_invoke(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) pixelBuffer];
  v4 = *(void **)(a1 + 40);
  if (v4) {
    [v4 time];
  }
  else {
    memset(v12, 0, 24);
  }
  if ([v2 enqueueSampleBuffer:v3 time:v12])
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 2, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CMSampleBufferRef v6 = *(void **)(a1 + 40);
    if (v6) {
      [v6 time];
    }
    FigCFDictionarySetCMTime();
    [*(id *)(a1 + 40) renderProcessTime];
    float v8 = v7;
    [*(id *)(a1 + 40) renderProcessTime];
    if (v8 <= 0.0)
    {
      if (v9 < 0.0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __40__AVCEffects_encodeProcessedVideoFrame___block_invoke_cold_1();
        }
      }
    }
    else
    {
      FigCFDictionarySetFloat();
    }
    if ([*(id *)(a1 + 40) imageData])
    {
      CFDataRef v10 = CFDataCreate(0, (const UInt8 *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "imageData"), "bytes"), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "imageData"), "length"));
      FigCFDictionarySetValue();
      VCRemoteImageQueue_EnqueueAttributes(*(void *)(*(void *)(a1 + 32) + 56), (unint64_t)Mutable);
      CFRelease(v10);
    }
    else
    {
      VCRemoteImageQueue_EnqueueAttributes(*(void *)(*(void *)(a1 + 32) + 56), (unint64_t)Mutable);
    }
    CFRelease(Mutable);

    uint64_t v11 = *(void *)(a1 + 32);
    if (!*(_DWORD *)(v11 + 32)) {
      VCRemoteImageQueue_ReleaseIOSurfaces(*(void *)(v11 + 56));
    }
  }
  else
  {
  }
}

- (int)mode
{
  return self->_mode;
}

- (int)effectType
{
  return self->_effectType;
}

- (void)initWithDelegate:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Received nil remote queue from server", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Could not create sender queue xpc object", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:(uint64_t)a1 .cold.3(uint64_t a1, void *a2)
{
  [a2 objectForKeyedSubscript:@"ERROR"];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, " [%s] %s:%d Error initializing client send queue. Deallocing. error=%@", v4, v5, v6, v7, v8);
}

- (void)initWithDelegate:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d RemoteImageQueue could not be made on effects client", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Could not set up the remoteReceiverQueue on the client side.", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:(uint64_t)a1 .cold.6(uint64_t a1, void *a2)
{
  [a2 objectForKeyedSubscript:@"ERROR"];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, " [%s] %s:%d Error initializing Effects. Deallocing. error=%@", v4, v5, v6, v7, v8);
}

- (void)setupRemoteReceiverQueueWithSenderQueue:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d xpcSenderQueue was null, cannot make the remote queue", v2, v3, v4, v5, v6);
}

- (void)setupRemoteReceiverQueueWithSenderQueue:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Error making the receiver queue", v2, v3, v4, v5, v6);
}

- (void)remoteQueueOperationHandlerWithError:(NSObject *)a3 operation:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315906;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(void *)&v3[14] = "-[AVCEffects remoteQueueOperationHandlerWithError:operation:]";
  LODWORD(v4) = 162;
  WORD2(v4) = 2048;
  *(void *)((char *)&v4 + 6) = *(void *)(a2 + 64);
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, a2, a3, " [%s] %s:%d _lastReceivedPixelBuffer=%p", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[AVCEffects remoteQueueOperationHandlerWithError:operation:]" >> 16, (const void *)v4);
}

- (void)remoteQueueOperationHandlerWithError:operation:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[AVCEffects remoteQueueOperationHandlerWithError:operation:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Error received from the remote Queue %d", v2, *(const char **)v3, (unint64_t)"-[AVCEffects remoteQueueOperationHandlerWithError:operation:]" >> 16, 143);
}

- (void)enqueueSampleBuffer:time:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create sample buffer", v2, v3, v4, v5, v6);
}

- (void)enqueueSampleBuffer:time:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[AVCEffects enqueueSampleBuffer:time:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to enqueue video frame with error=%d", v2, *(const char **)v3, (unint64_t)"-[AVCEffects enqueueSampleBuffer:time:]" >> 16, 311);
}

- (void)encodeProcessedVideoFrame:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d videoFrame=%@");
}

void __40__AVCEffects_encodeProcessedVideoFrame___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Frame Render time is negative", v2, v3, v4, v5, v6);
}

@end