@interface VCStreamOutputManager
+ (id)sharedInstance;
- (BOOL)sourceExistsForStreamToken:(int64_t)a3;
- (VCStreamOutputManager)init;
- (id)allocDispatchedStreamOutputWithStreamToken:(int64_t)a3 clientPid:(int)a4 options:(id)a5 errorCode:(int *)a6;
- (id)allocStreamOutputWithStreamToken:(int64_t)a3 clientPid:(int)a4 options:(id)a5 errorCode:(int *)a6;
- (id)serviceHandlerStreamOutputInitializeWithArguments:(id)a3 error:(id *)a4;
- (id)serviceHandlerStreamOutputNotifyCacheWithArguments:(id)a3 error:(id *)a4;
- (id)serviceHandlerStreamOutputTerminateWithArguments:(id)a3 error:(id *)a4;
- (void)cleanupStreamOutput:(id)a3;
- (void)dealloc;
- (void)deregisterBlocksForService;
- (void)deregisterStreamOutputSourceForStreamToken:(int64_t)a3;
- (void)dispatchedCleanupStreamOutput:(id)a3;
- (void)dispatchedDeregisterStreamOutputSourceForStreamToken:(int64_t)a3;
- (void)dispatchedRegisterStreamOutputSource:(id)a3 forStreamToken:(int64_t)a4;
- (void)dispatchedRemoteMediaDidStall:(BOOL)a3 streamToken:(int64_t)a4;
- (void)dispatchedRemoteVideoDidDegrade:(BOOL)a3 streamToken:(int64_t)a4;
- (void)dispatchedRemoteVideoDidPause:(BOOL)a3 streamToken:(int64_t)a4;
- (void)dispatchedRemoteVideoDidSuspend:(BOOL)a3 streamToken:(int64_t)a4;
- (void)init;
- (void)registerBlocksForService;
- (void)registerStreamOutputSource:(id)a3 forStreamToken:(int64_t)a4;
- (void)remoteMediaDidStall:(BOOL)a3 streamToken:(int64_t)a4;
- (void)remoteVideoDidDegrade:(BOOL)a3 streamToken:(int64_t)a4;
- (void)remoteVideoDidPause:(BOOL)a3 streamToken:(int64_t)a4;
- (void)remoteVideoDidSuspend:(BOOL)a3 streamToken:(int64_t)a4;
@end

@implementation VCStreamOutputManager

- (VCStreamOutputManager)init
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)VCStreamOutputManager;
  v2 = [(VCStreamOutputManager *)&v9 init];
  if (v2)
  {
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
    dispatch_queue_t v4 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCStreamOutputManager.xpcCommandQueue", 0, CustomRootQueue);
    v2->_stateQueue = (OS_dispatch_queue *)v4;
    if (v4)
    {
      dispatch_queue_t v5 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCStreamOutputManager.xpcCallbackQueue", 0, CustomRootQueue);
      v2->_xpcCallbackQueue = (OS_dispatch_queue *)v5;
      if (v5)
      {
        v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v2->_streamOutputSourceForStreamToken = v6;
        if (v6)
        {
          v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
          v2->_streamOutputs = v7;
          if (v7)
          {
            v2->_useFigRemoteQueue = 1;
            return v2;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCStreamOutputManager init].cold.4();
            }
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCStreamOutputManager init]();
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCStreamOutputManager init]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCStreamOutputManager init]();
      }
    }

    return 0;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  if (stateQueue) {
    dispatch_release(stateQueue);
  }
  xpcCallbackQueue = self->_xpcCallbackQueue;
  if (xpcCallbackQueue) {
    dispatch_release(xpcCallbackQueue);
  }

  v5.receiver = self;
  v5.super_class = (Class)VCStreamOutputManager;
  [(VCStreamOutputManager *)&v5 dealloc];
}

- (void)cleanupStreamOutput:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__VCStreamOutputManager_cleanupStreamOutput___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  block[5] = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __45__VCStreamOutputManager_cleanupStreamOutput___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedCleanupStreamOutput:*(void *)(a1 + 40)];
}

- (void)dispatchedCleanupStreamOutput:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (a3)
  {
    id v5 = (id)objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", objc_msgSend(a3, "streamToken"));
    [(NSMutableDictionary *)self->_streamOutputs setObject:0 forKeyedSubscript:v5];
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_11 != -1) {
    dispatch_once(&sharedInstance_onceToken_11, &__block_literal_global_66);
  }
  return (id)_vcStreamOutputManager;
}

VCStreamOutputManager *__39__VCStreamOutputManager_sharedInstance__block_invoke()
{
  result = objc_alloc_init(VCStreamOutputManager);
  _vcStreamOutputManager = (uint64_t)result;
  return result;
}

- (void)registerStreamOutputSource:(id)a3 forStreamToken:(int64_t)a4
{
  v5[7] = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__VCStreamOutputManager_registerStreamOutputSource_forStreamToken___block_invoke;
  v5[3] = &unk_1E6DB5450;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(stateQueue, v5);
}

uint64_t __67__VCStreamOutputManager_registerStreamOutputSource_forStreamToken___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedRegisterStreamOutputSource:*(void *)(a1 + 40) forStreamToken:*(void *)(a1 + 48)];
}

- (void)dispatchedRegisterStreamOutputSource:(id)a3 forStreamToken:(int64_t)a4
{
  int v4 = a4;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v7 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:a4];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  streamOutputSourceForStreamToken = self->_streamOutputSourceForStreamToken;
  uint64_t v9 = [(NSMutableDictionary *)streamOutputSourceForStreamToken countByEnumeratingWithState:&v37 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v38;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v38 != v11) {
          objc_enumerationMutation(streamOutputSourceForStreamToken);
        }
        uint64_t v13 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        if ([(NSMutableDictionary *)self->_streamOutputSourceForStreamToken objectForKeyedSubscript:v7] == v13)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCStreamOutputManager dispatchedRegisterStreamOutputSource:forStreamToken:]();
            }
          }
          goto LABEL_23;
        }
      }
      uint64_t v10 = [(NSMutableDictionary *)streamOutputSourceForStreamToken countByEnumeratingWithState:&v37 objects:v36 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  [(NSMutableDictionary *)self->_streamOutputSourceForStreamToken setObject:a3 forKeyedSubscript:v7];
  if ((VCStreamOutputManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 136316162;
        uint64_t v23 = v15;
        __int16 v24 = 2080;
        v25 = "-[VCStreamOutputManager dispatchedRegisterStreamOutputSource:forStreamToken:]";
        __int16 v26 = 1024;
        int v27 = 135;
        __int16 v28 = 2048;
        id v29 = a3;
        __int16 v30 = 1024;
        LODWORD(v31) = v4;
        v17 = " [%s] %s:%d Source=%p registered for streamToken=%u";
        v18 = v16;
        uint32_t v19 = 44;
LABEL_22:
        _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v22, v19);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v14 = (__CFString *)[(VCStreamOutputManager *)self performSelector:sel_logPrefix];
    }
    else {
      v14 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 136316674;
        uint64_t v23 = v20;
        __int16 v24 = 2080;
        v25 = "-[VCStreamOutputManager dispatchedRegisterStreamOutputSource:forStreamToken:]";
        __int16 v26 = 1024;
        int v27 = 135;
        __int16 v28 = 2112;
        id v29 = v14;
        __int16 v30 = 2048;
        v31 = self;
        __int16 v32 = 2048;
        id v33 = a3;
        __int16 v34 = 1024;
        int v35 = v4;
        v17 = " [%s] %s:%d %@(%p) Source=%p registered for streamToken=%u";
        v18 = v21;
        uint32_t v19 = 64;
        goto LABEL_22;
      }
    }
  }
LABEL_23:
}

- (void)deregisterStreamOutputSourceForStreamToken:(int64_t)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__VCStreamOutputManager_deregisterStreamOutputSourceForStreamToken___block_invoke;
  block[3] = &unk_1E6DB4568;
  block[4] = self;
  block[5] = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __68__VCStreamOutputManager_deregisterStreamOutputSourceForStreamToken___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedDeregisterStreamOutputSourceForStreamToken:*(void *)(a1 + 40)];
}

- (void)dispatchedDeregisterStreamOutputSourceForStreamToken:(int64_t)a3
{
  int v3 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:a3];
  if ([(NSMutableDictionary *)self->_streamOutputSourceForStreamToken objectForKeyedSubscript:v5])
  {
    if ((VCStreamOutputManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7
        || (uint64_t v7 = VRTraceErrorLogLevelToCSTR(),
            v8 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_16:
        [(NSMutableDictionary *)self->_streamOutputSourceForStreamToken setObject:0 forKeyedSubscript:v5];
        v16 = (void *)[(NSMutableDictionary *)self->_streamOutputs objectForKeyedSubscript:v5];
        if (v16)
        {
          v17 = v16;
          if ([v16 isClientInProcess])
          {
            [v17 didInvalidate];
          }
          else
          {
            xpcCallbackQueue = self->_xpcCallbackQueue;
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __78__VCStreamOutputManager_dispatchedDeregisterStreamOutputSourceForStreamToken___block_invoke;
            block[3] = &unk_1E6DB3DC8;
            block[4] = v17;
            dispatch_async(xpcCallbackQueue, block);
          }
        }
        goto LABEL_20;
      }
      uint64_t v9 = [(NSMutableDictionary *)self->_streamOutputSourceForStreamToken objectForKeyedSubscript:v5];
      *(_DWORD *)buf = 136316162;
      uint64_t v21 = v7;
      __int16 v22 = 2080;
      uint64_t v23 = "-[VCStreamOutputManager dispatchedDeregisterStreamOutputSourceForStreamToken:]";
      __int16 v24 = 1024;
      int v25 = 152;
      __int16 v26 = 2048;
      uint64_t v27 = v9;
      __int16 v28 = 1024;
      LODWORD(v29) = v3;
      uint64_t v10 = " [%s] %s:%d Source=%p unregistered for streamToken=%u";
      uint64_t v11 = v8;
      uint32_t v12 = 44;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v6 = (__CFString *)[(VCStreamOutputManager *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_16;
      }
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      uint64_t v15 = [(NSMutableDictionary *)self->_streamOutputSourceForStreamToken objectForKeyedSubscript:v5];
      *(_DWORD *)buf = 136316674;
      uint64_t v21 = v13;
      __int16 v22 = 2080;
      uint64_t v23 = "-[VCStreamOutputManager dispatchedDeregisterStreamOutputSourceForStreamToken:]";
      __int16 v24 = 1024;
      int v25 = 152;
      __int16 v26 = 2112;
      uint64_t v27 = (uint64_t)v6;
      __int16 v28 = 2048;
      id v29 = self;
      __int16 v30 = 2048;
      uint64_t v31 = v15;
      __int16 v32 = 1024;
      int v33 = v3;
      uint64_t v10 = " [%s] %s:%d %@(%p) Source=%p unregistered for streamToken=%u";
      uint64_t v11 = v14;
      uint32_t v12 = 64;
    }
    _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
    goto LABEL_16;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCStreamOutputManager dispatchedDeregisterStreamOutputSourceForStreamToken:]();
    }
  }
LABEL_20:
}

uint64_t __78__VCStreamOutputManager_dispatchedDeregisterStreamOutputSourceForStreamToken___block_invoke(uint64_t a1)
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 sendMessageAsync:"streamOutputDidReleaseRemoteVideoQueue" arguments:0 context:v3];
}

- (id)allocStreamOutputWithStreamToken:(int64_t)a3 clientPid:(int)a4 options:(id)a5 errorCode:(int *)a6
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  uint32_t v12 = &v11;
  uint64_t v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__26;
  uint64_t v15 = __Block_byref_object_dispose__26;
  uint64_t v16 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__VCStreamOutputManager_allocStreamOutputWithStreamToken_clientPid_options_errorCode___block_invoke;
  block[3] = &unk_1E6DB8578;
  block[6] = &v11;
  void block[7] = a3;
  int v10 = a4;
  block[4] = self;
  void block[5] = a5;
  block[8] = a6;
  dispatch_sync(stateQueue, block);
  uint64_t v7 = (void *)v12[5];
  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t __86__VCStreamOutputManager_allocStreamOutputWithStreamToken_clientPid_options_errorCode___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) allocDispatchedStreamOutputWithStreamToken:*(void *)(a1 + 56) clientPid:*(unsigned int *)(a1 + 72) options:*(void *)(a1 + 40) errorCode:*(void *)(a1 + 64)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (id)allocDispatchedStreamOutputWithStreamToken:(int64_t)a3 clientPid:(int)a4 options:(id)a5 errorCode:(int *)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v11 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:a3];
  if ([(NSMutableDictionary *)self->_streamOutputs objectForKeyedSubscript:v11])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCStreamOutputManager allocDispatchedStreamOutputWithStreamToken:clientPid:options:errorCode:]();
      }
    }
    uint64_t v15 = 0;
    int v16 = -6;
  }
  else
  {
    uint64_t v12 = [(NSMutableDictionary *)self->_streamOutputSourceForStreamToken objectForKeyedSubscript:v11];
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      v14 = -[VCStreamOutput initWithStreamToken:clientProcessID:delegate:delegateQueue:]([VCStreamOutput alloc], "initWithStreamToken:clientProcessID:delegate:delegateQueue:", a3, v8, [a5 objectForKeyedSubscript:@"vcStreamOutputInProcessDelegate"], objc_msgSend(a5, "objectForKeyedSubscript:", @"vcStreamOutputInProcessDelegateQueue"));
      if (v14)
      {
        uint64_t v15 = v14;
        [v13 setStreamOutput:v14];
        [(NSMutableDictionary *)self->_streamOutputs setObject:v15 forKeyedSubscript:v11];
        int v16 = 0;
        goto LABEL_5;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCStreamOutputManager allocDispatchedStreamOutputWithStreamToken:clientPid:options:errorCode:]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCStreamOutputManager allocDispatchedStreamOutputWithStreamToken:clientPid:options:errorCode:]();
      }
    }
    uint64_t v15 = 0;
    int v16 = -1;
  }
LABEL_5:
  if (a6) {
    *a6 = v16;
  }

  return v15;
}

- (BOOL)sourceExistsForStreamToken:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__VCStreamOutputManager_sourceExistsForStreamToken___block_invoke;
  v6[3] = &unk_1E6DB7008;
  v6[5] = &v7;
  v6[6] = a3;
  v6[4] = self;
  dispatch_sync(stateQueue, v6);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __52__VCStreamOutputManager_sourceExistsForStreamToken___block_invoke(void *a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", a1[6]));
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result != 0;
  return result;
}

- (id)serviceHandlerStreamOutputInitializeWithArguments:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v17 = 0;
  uint64_t v7 = [a3 objectForKeyedSubscript:@"conferenceCallID"];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = (void *)[a3 objectForKeyedSubscript:@"CLIENTPID"];
    if (v9)
    {
      id v10 = -[VCStreamOutputManager allocDispatchedStreamOutputWithStreamToken:clientPid:options:errorCode:](self, "allocDispatchedStreamOutputWithStreamToken:clientPid:options:errorCode:", [v8 unsignedIntValue], objc_msgSend(v9, "intValue"), 0, &v17);
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v10, @"CONTEXT", 0);
        if (v12)
        {
          uint64_t v13 = (void *)v12;
          if (self->_useFigRemoteQueue)
          {
            uint64_t v14 = [v11 copyXpcSenderQueue];
            if (v14)
            {
              uint64_t v15 = (void *)v14;
              [v13 setValue:v14 forKey:@"USERXPCARGUMENTS"];
              goto LABEL_28;
            }
            int v17 = -2;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCStreamOutputManager serviceHandlerStreamOutputInitializeWithArguments:error:].cold.5();
              }
            }
          }
          uint64_t v15 = 0;
LABEL_28:
          if (!v17) {
            goto LABEL_31;
          }
          goto LABEL_29;
        }
        int v17 = -4;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCStreamOutputManager serviceHandlerStreamOutputInitializeWithArguments:error:].cold.4();
          }
        }
        uint64_t v15 = 0;
LABEL_23:
        uint64_t v13 = 0;
        goto LABEL_28;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCStreamOutputManager serviceHandlerStreamOutputInitializeWithArguments:error:]();
        }
      }
LABEL_18:
      uint64_t v15 = 0;
      uint64_t v11 = 0;
      goto LABEL_23;
    }
    int v17 = -3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCStreamOutputManager serviceHandlerStreamOutputInitializeWithArguments:error:]();
      }
      goto LABEL_18;
    }
  }
  else
  {
    int v17 = -3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCStreamOutputManager serviceHandlerStreamOutputInitializeWithArguments:error:]();
      }
      goto LABEL_18;
    }
  }
  uint64_t v13 = 0;
  uint64_t v11 = 0;
  uint64_t v15 = 0;
LABEL_29:
  [(VCStreamOutputManager *)self dispatchedCleanupStreamOutput:v11];
  if (a4) {
    *a4 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"VCStreamOutputManager" code:v17 userInfo:0];
  }
LABEL_31:

  if (v15) {
    xpc_release(v15);
  }
  return v13;
}

- (id)serviceHandlerStreamOutputNotifyCacheWithArguments:(id)a3 error:(id *)a4
{
  id v5 = (void *)[a3 objectForKeyedSubscript:@"CONTEXT"];
  uint64_t v6 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", objc_msgSend(v5, "streamToken"));
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(id)VCRemoteVideoManager_DefaultManager() notifyCachedStateForStreamToken:v6];
      goto LABEL_4;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCStreamOutputManager serviceHandlerStreamOutputNotifyCacheWithArguments:error:]();
      }
    }
    uint64_t v8 = -7;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCStreamOutputManager serviceHandlerStreamOutputNotifyCacheWithArguments:error:]();
      }
    }
    uint64_t v8 = -6;
  }
  if (a4) {
    *a4 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"VCStreamOutputManager" code:v8 userInfo:0];
  }
LABEL_4:

  return 0;
}

- (id)serviceHandlerStreamOutputTerminateWithArguments:(id)a3 error:(id *)a4
{
  uint64_t v6 = [a3 objectForKeyedSubscript:@"CONTEXT"];
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3
      && (VRTraceErrorLogLevelToCSTR(), os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
      -[VCStreamOutputManager serviceHandlerStreamOutputTerminateWithArguments:error:]();
      if (!a4) {
        goto LABEL_10;
      }
    }
    else if (!a4)
    {
      goto LABEL_10;
    }
    uint64_t v11 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"VCStreamOutputManager" code:-6 userInfo:0];
    uint64_t v9 = 0;
    *a4 = v11;
    return v9;
  }
  uint64_t v7 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_10:
    uint64_t v9 = 0;
    return v9;
  }
  [(VCStreamOutputManager *)self dispatchedCleanupStreamOutput:v7];
  id v8 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v9 = objc_msgSend(v8, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"CONTEXT", 0);
  return v9;
}

- (void)registerBlocksForService
{
  v6[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__VCStreamOutputManager_registerBlocksForService__block_invoke;
  v6[3] = &unk_1E6DB5478;
  v6[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "streamOutputInitialize", v6, self->_stateQueue);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__VCStreamOutputManager_registerBlocksForService__block_invoke_2;
  v5[3] = &unk_1E6DB5478;
  v5[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "streamOutputTerminate", v5, self->_stateQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton", MEMORY[0x1E4F143A8], 3221225472, __49__VCStreamOutputManager_registerBlocksForService__block_invoke_3, &unk_1E6DB5478, v3), "registerBlockForService:block:queue:", "streamOutputCachedNotifications", &v4, self->_stateQueue);
}

id __49__VCStreamOutputManager_registerBlocksForService__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "serviceHandlerStreamOutputInitializeWithArguments:error:", a2, a3);
  }

  return v6;
}

id __49__VCStreamOutputManager_registerBlocksForService__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v7 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "serviceHandlerStreamOutputTerminateWithArguments:error:", a2, a3);

  return v7;
}

uint64_t __49__VCStreamOutputManager_registerBlocksForService__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v7 = (void *)[*(id *)(a1 + 32) strong];

  return [v7 serviceHandlerStreamOutputNotifyCacheWithArguments:a2 error:a3];
}

- (void)deregisterBlocksForService
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "streamOutputInitialize");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "streamOutputTerminate");
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v2 deregisterFromService:"streamOutputCachedNotifications"];
}

- (void)dispatchedRemoteMediaDidStall:(BOOL)a3 streamToken:(int64_t)a4
{
  BOOL v4 = a3;
  block[6] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:a4];
  uint64_t v7 = (void *)[(NSMutableDictionary *)self->_streamOutputs objectForKeyedSubscript:v6];
  if ([v7 isClientInProcess])
  {
    [v7 didStall:v4];
  }
  else
  {
    id v8 = (void *)[objc_alloc(NSNumber) initWithBool:v4];
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v8, @"conferenceIsRemoteMediaStalled", 0);
    xpcCallbackQueue = self->_xpcCallbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__VCStreamOutputManager_dispatchedRemoteMediaDidStall_streamToken___block_invoke;
    block[3] = &unk_1E6DB3E40;
    block[4] = v7;
    void block[5] = v9;
    dispatch_async(xpcCallbackQueue, block);
  }
}

uint64_t __67__VCStreamOutputManager_dispatchedRemoteMediaDidStall_streamToken___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
    uint64_t v4 = *(void *)(v1 + 32);
    uint64_t v3 = *(void *)(v1 + 40);
    return [v2 sendMessageAsync:"streamOutputDidRemoteMediaStall" arguments:v3 context:v4];
  }
  return result;
}

- (void)dispatchedRemoteVideoDidDegrade:(BOOL)a3 streamToken:(int64_t)a4
{
  BOOL v4 = a3;
  block[6] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:a4];
  uint64_t v7 = (void *)[(NSMutableDictionary *)self->_streamOutputs objectForKeyedSubscript:v6];
  if ([v7 isClientInProcess])
  {
    [v7 didDegrade:v4];
  }
  else
  {
    id v8 = (void *)[objc_alloc(NSNumber) initWithBool:v4];
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v8, @"conferenceIsVideoDegraded", 0);
    xpcCallbackQueue = self->_xpcCallbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__VCStreamOutputManager_dispatchedRemoteVideoDidDegrade_streamToken___block_invoke;
    block[3] = &unk_1E6DB3E40;
    block[4] = v7;
    void block[5] = v9;
    dispatch_async(xpcCallbackQueue, block);
  }
}

uint64_t __69__VCStreamOutputManager_dispatchedRemoteVideoDidDegrade_streamToken___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
    uint64_t v4 = *(void *)(v1 + 32);
    uint64_t v3 = *(void *)(v1 + 40);
    return [v2 sendMessageAsync:"streamOutputDidVideoDegrade" arguments:v3 context:v4];
  }
  return result;
}

- (void)dispatchedRemoteVideoDidPause:(BOOL)a3 streamToken:(int64_t)a4
{
  BOOL v4 = a3;
  block[6] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:a4];
  uint64_t v7 = (void *)[(NSMutableDictionary *)self->_streamOutputs objectForKeyedSubscript:v6];
  if ([v7 isClientInProcess])
  {
    [v7 didPause:v4];
  }
  else
  {
    id v8 = (void *)[objc_alloc(NSNumber) initWithBool:v4];
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v8, @"conferenceVideoPause", 0);
    xpcCallbackQueue = self->_xpcCallbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__VCStreamOutputManager_dispatchedRemoteVideoDidPause_streamToken___block_invoke;
    block[3] = &unk_1E6DB3E40;
    block[4] = v7;
    void block[5] = v9;
    dispatch_async(xpcCallbackQueue, block);
  }
}

uint64_t __67__VCStreamOutputManager_dispatchedRemoteVideoDidPause_streamToken___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
    uint64_t v4 = *(void *)(v1 + 32);
    uint64_t v3 = *(void *)(v1 + 40);
    return [v2 sendMessageAsync:"streamOutputDidRemoteVideoPause" arguments:v3 context:v4];
  }
  return result;
}

- (void)dispatchedRemoteVideoDidSuspend:(BOOL)a3 streamToken:(int64_t)a4
{
  BOOL v4 = a3;
  block[6] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:a4];
  uint64_t v7 = (void *)[(NSMutableDictionary *)self->_streamOutputs objectForKeyedSubscript:v6];
  if ([v7 isClientInProcess])
  {
    [v7 didSuspend:v4];
  }
  else
  {
    id v8 = (void *)[objc_alloc(NSNumber) initWithBool:v4];
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v8, @"conferenceIsVideoSuspended", 0);
    xpcCallbackQueue = self->_xpcCallbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__VCStreamOutputManager_dispatchedRemoteVideoDidSuspend_streamToken___block_invoke;
    block[3] = &unk_1E6DB3E40;
    block[4] = v7;
    void block[5] = v9;
    dispatch_async(xpcCallbackQueue, block);
  }
}

uint64_t __69__VCStreamOutputManager_dispatchedRemoteVideoDidSuspend_streamToken___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
    uint64_t v4 = *(void *)(v1 + 32);
    uint64_t v3 = *(void *)(v1 + 40);
    return [v2 sendMessageAsync:"streamOutputDidVideoSuspend" arguments:v3 context:v4];
  }
  return result;
}

- (void)remoteMediaDidStall:(BOOL)a3 streamToken:(int64_t)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__VCStreamOutputManager_remoteMediaDidStall_streamToken___block_invoke;
  v5[3] = &unk_1E6DB45E0;
  BOOL v6 = a3;
  v5[4] = self;
  void v5[5] = a4;
  dispatch_async(stateQueue, v5);
}

uint64_t __57__VCStreamOutputManager_remoteMediaDidStall_streamToken___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedRemoteMediaDidStall:*(unsigned __int8 *)(a1 + 48) streamToken:*(void *)(a1 + 40)];
}

- (void)remoteVideoDidPause:(BOOL)a3 streamToken:(int64_t)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__VCStreamOutputManager_remoteVideoDidPause_streamToken___block_invoke;
  v5[3] = &unk_1E6DB45E0;
  BOOL v6 = a3;
  v5[4] = self;
  void v5[5] = a4;
  dispatch_async(stateQueue, v5);
}

uint64_t __57__VCStreamOutputManager_remoteVideoDidPause_streamToken___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedRemoteVideoDidPause:*(unsigned __int8 *)(a1 + 48) streamToken:*(void *)(a1 + 40)];
}

- (void)remoteVideoDidSuspend:(BOOL)a3 streamToken:(int64_t)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__VCStreamOutputManager_remoteVideoDidSuspend_streamToken___block_invoke;
  v5[3] = &unk_1E6DB45E0;
  BOOL v6 = a3;
  v5[4] = self;
  void v5[5] = a4;
  dispatch_async(stateQueue, v5);
}

uint64_t __59__VCStreamOutputManager_remoteVideoDidSuspend_streamToken___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedRemoteVideoDidSuspend:*(unsigned __int8 *)(a1 + 48) streamToken:*(void *)(a1 + 40)];
}

- (void)remoteVideoDidDegrade:(BOOL)a3 streamToken:(int64_t)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__VCStreamOutputManager_remoteVideoDidDegrade_streamToken___block_invoke;
  v5[3] = &unk_1E6DB45E0;
  BOOL v6 = a3;
  v5[4] = self;
  void v5[5] = a4;
  dispatch_async(stateQueue, v5);
}

uint64_t __59__VCStreamOutputManager_remoteVideoDidDegrade_streamToken___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedRemoteVideoDidDegrade:*(unsigned __int8 *)(a1 + 48) streamToken:*(void *)(a1 + 40)];
}

- (void)init
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate _streamOutputs dictionary", v2, v3, v4, v5, v6);
}

- (void)dispatchedRegisterStreamOutputSource:forStreamToken:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCStreamOutputManager dispatchedRegisterStreamOutputSource:forStreamToken:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d This streamOutputSource has already been registered with streamToken=%u", v2, *(const char **)v3, (unint64_t)"-[VCStreamOutputManager dispatchedRegisterStreamOutputSource:forStreamToken:]" >> 16, v4);
}

- (void)dispatchedDeregisterStreamOutputSourceForStreamToken:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCStreamOutputManager dispatchedDeregisterStreamOutputSourceForStreamToken:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d StreamToken was not registered:%u", v2, *(const char **)v3, (unint64_t)"-[VCStreamOutputManager dispatchedDeregisterStreamOutputSourceForStreamToken:]" >> 16, v4);
}

- (void)allocDispatchedStreamOutputWithStreamToken:clientPid:options:errorCode:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCStreamOutputManager allocDispatchedStreamOutputWithStreamToken:clientPid:options:errorCode:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No streamOutputSource registered for streamToken=%u", v2, *(const char **)v3, (unint64_t)"-[VCStreamOutputManager allocDispatchedStreamOutputWithStreamToken:clientPid:options:errorCode:]" >> 16, v4);
}

- (void)allocDispatchedStreamOutputWithStreamToken:clientPid:options:errorCode:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCStreamOutputManager allocDispatchedStreamOutputWithStreamToken:clientPid:options:errorCode:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create stream output for streamToken=%u", v2, *(const char **)v3, (unint64_t)"-[VCStreamOutputManager allocDispatchedStreamOutputWithStreamToken:clientPid:options:errorCode:]" >> 16, v4);
}

- (void)allocDispatchedStreamOutputWithStreamToken:clientPid:options:errorCode:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Stream output already registered", v2, v3, v4, v5, v6);
}

- (void)serviceHandlerStreamOutputInitializeWithArguments:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Call ID argument is missing", v2, v3, v4, v5, v6);
}

- (void)serviceHandlerStreamOutputInitializeWithArguments:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Client process ID argument is missing", v2, v3, v4, v5, v6);
}

- (void)serviceHandlerStreamOutputInitializeWithArguments:error:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create output stream for streamToken=%@");
}

- (void)serviceHandlerStreamOutputInitializeWithArguments:error:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unable to allocate memory for dictionary. streamToken=%@");
}

- (void)serviceHandlerStreamOutputInitializeWithArguments:error:.cold.5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid sender queue for streamToken=%@");
}

- (void)serviceHandlerStreamOutputNotifyCacheWithArguments:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to get context", v2, v3, v4, v5, v6);
}

- (void)serviceHandlerStreamOutputNotifyCacheWithArguments:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid context", v2, v3, v4, v5, v6);
}

- (void)serviceHandlerStreamOutputTerminateWithArguments:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to get context", v2, v3, v4, v5, v6);
}

@end