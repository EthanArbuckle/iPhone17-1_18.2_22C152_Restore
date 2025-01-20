@interface VCMediaRecorderManager
+ (id)prepareURL:(id)a3 forXPCWithSandboxing:(BOOL)a4;
+ (id)sharedInstance;
- (BOOL)dispatchedRegisterMediaRecorder:(id)a3 withStreamToken:(int64_t)a4 andError:(id *)a5;
- (VCMediaRecorderDelegate)delegate;
- (VCMediaRecorderManager)init;
- (id)mediaRecorderFromClientContext:(id)a3;
- (id)newClientContextWithStreamToken:(int64_t)a3 error:(id *)a4;
- (id)newRequestWithArguments:(id)a3 state:(unsigned __int8)a4;
- (void)dealloc;
- (void)deregisterBlocksFromService;
- (void)notifyClientsWithStreamToken:(int64_t)a3 service:(char *)a4 arguments:(id)a5;
- (void)registerBlocksForService;
- (void)registerMediaRecorder:(id)a3 withStreamToken:(int64_t)a4;
- (void)saveImage:(id)a3 movie:(id)a4;
- (void)setDelegate:(id)a3;
- (void)streamToken:(int64_t)a3 didEndProcessingRequest:(id)a4 urlContext:(const tagVCMediaRecorderDelegateURLContext *)a5 error:(id)a6;
- (void)streamToken:(int64_t)a3 didFinishRequest:(id)a4 didSucceed:(BOOL)a5;
- (void)streamToken:(int64_t)a3 didStartProcessingRequest:(id)a4 error:(id)a5;
- (void)streamToken:(int64_t)a3 didUpdateCapabilities:(unsigned int)a4;
- (void)streamTokenDidCleanupAllRequests:(int64_t)a3;
@end

@implementation VCMediaRecorderManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1) {
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_36);
  }
  return (id)sharedInstance__sharedManager;
}

VCMediaRecorderManager *__40__VCMediaRecorderManager_sharedInstance__block_invoke()
{
  result = objc_alloc_init(VCMediaRecorderManager);
  sharedInstance__sharedManager = (uint64_t)result;
  return result;
}

- (VCMediaRecorderManager)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCMediaRecorderManager;
  v2 = [(VCMediaRecorderManager *)&v5 init];
  if (v2)
  {
    v2->_streamTokenList = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v2->_xpcCommandQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCMediaRecorderManager.xpcCommandQueue", 0, CustomRootQueue);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCMediaRecorderManager *)self deregisterBlocksFromService];
  dispatch_release((dispatch_object_t)self->_xpcCommandQueue);

  objc_storeWeak(&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)VCMediaRecorderManager;
  [(VCMediaRecorderManager *)&v3 dealloc];
}

- (VCMediaRecorderDelegate)delegate
{
  return (VCMediaRecorderDelegate *)objc_loadWeak(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void)registerMediaRecorder:(id)a3 withStreamToken:(int64_t)a4
{
  v5[7] = *MEMORY[0x1E4F143B8];
  xpcCommandQueue = self->_xpcCommandQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__VCMediaRecorderManager_registerMediaRecorder_withStreamToken___block_invoke;
  v5[3] = &unk_1E6DB5450;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(xpcCommandQueue, v5);
}

uint64_t __64__VCMediaRecorderManager_registerMediaRecorder_withStreamToken___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedRegisterMediaRecorder:*(void *)(a1 + 40) withStreamToken:*(void *)(a1 + 48) andError:0];
}

- (BOOL)dispatchedRegisterMediaRecorder:(id)a3 withStreamToken:(int64_t)a4 andError:(id *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcCommandQueue);
  uint64_t v9 = [NSNumber numberWithInteger:a4];
  if ([(NSMutableDictionary *)self->_streamTokenList objectForKeyedSubscript:v9])
  {
    v10 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"VCMediaRecorderManager" code:-9 userInfo:0];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315906;
        uint64_t v18 = v11;
        __int16 v19 = 2080;
        v20 = "-[VCMediaRecorderManager dispatchedRegisterMediaRecorder:withStreamToken:andError:]";
        __int16 v21 = 1024;
        int v22 = 170;
        __int16 v23 = 1024;
        int v24 = a4;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Context already exists for stream token=%u", (uint8_t *)&v17, 0x22u);
      }
    }
  }
  else
  {
    v13 = [[VCMediaRecorderManagerStreamTokenClientList alloc] initWithStreamToken:a4 mediaRecorder:a3];
    if (v13)
    {
      v14 = v13;
      [(NSMutableDictionary *)self->_streamTokenList setObject:v13 forKeyedSubscript:v9];
      [a3 setMediaRecorderDelegate:self];

      v10 = 0;
      LOBYTE(v15) = 1;
      goto LABEL_11;
    }
    v10 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"VCMediaRecorderManager" code:-10 userInfo:0];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v15) {
        goto LABEL_11;
      }
      -[VCMediaRecorderManager dispatchedRegisterMediaRecorder:withStreamToken:andError:]();
    }
  }
  LOBYTE(v15) = 0;
LABEL_11:
  if (a5) {
    *a5 = v10;
  }
  return v15;
}

- (id)mediaRecorderFromClientContext:(id)a3
{
  if (!+[VCMediaRecorderManagerStreamTokenClientList isValidContext:](VCMediaRecorderManagerStreamTokenClientList, "isValidContext:"))return 0; {
  int64_t v5 = +[VCMediaRecorderManagerStreamTokenClientList streamTokenFromClientContext:a3];
  }
  uint64_t v6 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenList, "objectForKeyedSubscript:", [NSNumber numberWithInteger:v5]);

  return (id)[v6 mediaRecorder];
}

- (id)newClientContextWithStreamToken:(int64_t)a3 error:(id *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcCommandQueue);
  v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenList, "objectForKeyedSubscript:", [NSNumber numberWithInteger:a3]);
  if (!v7)
  {
    if (a4)
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = -2;
LABEL_8:
      v10 = 0;
      *a4 = (id)[v11 errorWithDomain:@"VCMediaRecorderManager" code:v12 userInfo:0];
      return v10;
    }
    return 0;
  }
  v8 = v7;
  uint64_t v9 = [v7 newContext];
  if (!v9)
  {
    if (a4)
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = -3;
      goto LABEL_8;
    }
    return 0;
  }
  v10 = (void *)v9;
  objc_msgSend((id)objc_msgSend(v8, "mediaRecorder"), "registerClient");
  return v10;
}

- (void)registerBlocksForService
{
  v8[5] = *MEMORY[0x1E4F143B8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__VCMediaRecorderManager_registerBlocksForService__block_invoke;
  v8[3] = &unk_1E6DB5478;
  v8[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaRecorderInitialize", v8, self->_xpcCommandQueue);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__VCMediaRecorderManager_registerBlocksForService__block_invoke_62;
  v7[3] = &unk_1E6DB5478;
  v7[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaRecorderInitializeStandalone", v7, self->_xpcCommandQueue);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__VCMediaRecorderManager_registerBlocksForService__block_invoke_2;
  v6[3] = &unk_1E6DB5478;
  v6[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaRecorderUninitialize", v6, self->_xpcCommandQueue);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__VCMediaRecorderManager_registerBlocksForService__block_invoke_74;
  v5[3] = &unk_1E6DB5478;
  v5[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaRecorderStartRequest", v5, self->_xpcCommandQueue);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__VCMediaRecorderManager_registerBlocksForService__block_invoke_77;
  v4[3] = &unk_1E6DB5478;
  v4[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaRecorderEndRequest", v4, self->_xpcCommandQueue);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__VCMediaRecorderManager_registerBlocksForService__block_invoke_79;
  v3[3] = &unk_1E6DB5478;
  v3[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaRecorderRejectRequest", v3, self->_xpcCommandQueue);
}

uint64_t __50__VCMediaRecorderManager_registerBlocksForService__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  v8 = (void *)[a2 objectForKeyedSubscript:@"vcMomentsStreamToken"];
  if (!v8)
  {
    if (a3)
    {
      uint64_t v6 = 0;
      *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VCMediaRecorderManager" code:-1 userInfo:0];
      return v6;
    }
    return 0;
  }
  uint64_t v9 = [v8 unsignedIntegerValue];
  uint64_t v10 = [*(id *)(a1 + 32) newClientContextWithStreamToken:v9 error:a3];
  if (!v10) {
    return 0;
  }
  uint64_t v11 = (void *)v10;
  uint64_t v12 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v9));
  id v13 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v6 = objc_msgSend(v13, "initWithObjectsAndKeys:", v11, @"CONTEXT", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend(v12, "mediaRecorder"), "capabilities")), @"vcMomentsCapabilities", 0);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    BOOL v15 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v17 = v14;
      __int16 v18 = 2080;
      __int16 v19 = "-[VCMediaRecorderManager registerBlocksForService]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 248;
      __int16 v22 = 2048;
      __int16 v23 = v11;
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d New moments client. Context=0x%p", buf, 0x26u);
    }
  }

  return v6;
}

uint64_t __50__VCMediaRecorderManager_registerBlocksForService__block_invoke_62(uint64_t a1, void *a2, void *a3)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v7 = [a2 objectForKeyedSubscript:@"vcMomentsConfiguration"];
  if (!v7)
  {
    if (!a3) {
      return 0;
    }
    __int16 v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = -6;
LABEL_20:
    uint64_t v6 = 0;
    *a3 = [v19 errorWithDomain:@"VCMediaRecorderManager" code:v20 userInfo:0];
    return v6;
  }
  uint64_t v8 = v7;
  uint64_t v9 = (void *)[a2 objectForKeyedSubscript:@"CLIENTPID"];
  if (!v9)
  {
    if (!a3) {
      return 0;
    }
    __int16 v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = -8;
    goto LABEL_20;
  }
  id v10 = +[AVCMediaRecorderConfiguration newClientDictionary:clientPid:](AVCMediaRecorderConfiguration, "newClientDictionary:clientPid:", v8, [v9 intValue]);
  if (!v10)
  {
    if (!a3) {
      return 0;
    }
    __int16 v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = -7;
    goto LABEL_20;
  }
  uint64_t v11 = v10;
  uint64_t ID = VCUniqueIDGenerator_GenerateID();
  id v13 = [[VCMediaRecorderLocal alloc] initWithStreamToken:ID configuration:v11 reportingAgent:0];

  if (!v13)
  {
    if (a3)
    {
      __int16 v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = -5;
      goto LABEL_20;
    }
    return 0;
  }
  if (![*(id *)(a1 + 32) dispatchedRegisterMediaRecorder:v13 withStreamToken:ID andError:a3]|| (v14 = objc_msgSend(*(id *)(a1 + 32), "newClientContextWithStreamToken:error:", ID, a3)) == 0|| (v15 = (void *)v14, v16 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", ID)), v17 = objc_alloc(MEMORY[0x1E4F1C9E8]), v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend(v16, "mediaRecorder"), "capabilities")), uint64_t v6 = objc_msgSend(v17, "initWithObjectsAndKeys:",
               v15,
               @"CONTEXT",
               v18,
               @"vcMomentsCapabilities",
               [NSNumber numberWithInteger:ID],
               @"vcMomentsStreamToken",
               0),
        v15,
        !v6))
  {
    [(VCMediaRecorderLocal *)v13 invalidate];
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __50__VCMediaRecorderManager_registerBlocksForService__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v4 = objc_msgSend(v5, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"CONTEXT", 0);
  }
  uint64_t v6 = [a2 objectForKeyedSubscript:@"CONTEXT"];
  if (+[VCMediaRecorderManagerStreamTokenClientList isValidContext:v6])
  {
    int64_t v7 = +[VCMediaRecorderManagerStreamTokenClientList streamTokenFromClientContext:v6];
    uint64_t v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v7));
    uint64_t v9 = (void *)[v8 mediaRecorder];
    if (([v9 usesClientToken] & 1) == 0
      && objc_msgSend((id)objc_msgSend(v8, "clientContextList"), "count") == 1)
    {
      [v9 invalidate];
    }
    [v8 removeContext:v6];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v14 = v10;
        __int16 v15 = 2080;
        v16 = "-[VCMediaRecorderManager registerBlocksForService]_block_invoke_2";
        __int16 v17 = 1024;
        int v18 = 336;
        __int16 v19 = 2048;
        uint64_t v20 = v6;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unregister moments client. Context=0x%p", buf, 0x26u);
      }
    }
  }
  return v4;
}

uint64_t __50__VCMediaRecorderManager_registerBlocksForService__block_invoke_74(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "mediaRecorderFromClientContext:", objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"));
    if (v6)
    {
      int64_t v7 = (void *)v6;
      uint64_t v8 = (void *)[*(id *)(a1 + 32) newRequestWithArguments:a2 state:1];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          if (v8) {
            uint64_t v11 = (const char *)objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
          }
          else {
            uint64_t v11 = "<nil>";
          }
          int v13 = 136315906;
          uint64_t v14 = v9;
          __int16 v15 = 2080;
          v16 = "-[VCMediaRecorderManager registerBlocksForService]_block_invoke";
          __int16 v17 = 1024;
          int v18 = 353;
          __int16 v19 = 2080;
          uint64_t v20 = v11;
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d clientStartRequest %s", (uint8_t *)&v13, 0x26u);
        }
      }
      [v7 processClientRequest:v8 error:a3];
    }
    else if (a3)
    {
      *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VCMediaRecorderManager" code:-4 userInfo:0];
    }
  }
  return 0;
}

uint64_t __50__VCMediaRecorderManager_registerBlocksForService__block_invoke_77(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "mediaRecorderFromClientContext:", objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"));
    if (v6)
    {
      int64_t v7 = (void *)v6;
      uint64_t v8 = (void *)[*(id *)(a1 + 32) newRequestWithArguments:a2 state:2];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          if (v8) {
            uint64_t v11 = (const char *)objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
          }
          else {
            uint64_t v11 = "<nil>";
          }
          int v13 = 136315906;
          uint64_t v14 = v9;
          __int16 v15 = 2080;
          v16 = "-[VCMediaRecorderManager registerBlocksForService]_block_invoke";
          __int16 v17 = 1024;
          int v18 = 372;
          __int16 v19 = 2080;
          uint64_t v20 = v11;
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d clientEndRequest %s", (uint8_t *)&v13, 0x26u);
        }
      }
      [v7 processClientRequest:v8 error:a3];
    }
    else if (a3)
    {
      *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VCMediaRecorderManager" code:-4 userInfo:0];
    }
  }
  return 0;
}

uint64_t __50__VCMediaRecorderManager_registerBlocksForService__block_invoke_79(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "mediaRecorderFromClientContext:", objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"));
    if (v6)
    {
      int64_t v7 = (void *)v6;
      uint64_t v8 = (void *)[*(id *)(a1 + 32) newRequestWithArguments:a2 state:3];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          if (v8) {
            uint64_t v11 = (const char *)objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
          }
          else {
            uint64_t v11 = "<nil>";
          }
          int v13 = 136315906;
          uint64_t v14 = v9;
          __int16 v15 = 2080;
          v16 = "-[VCMediaRecorderManager registerBlocksForService]_block_invoke";
          __int16 v17 = 1024;
          int v18 = 391;
          __int16 v19 = 2080;
          uint64_t v20 = v11;
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d clientRejctRequest %s", (uint8_t *)&v13, 0x26u);
        }
      }
      [v7 processClientRequest:v8 error:a3];
    }
    else if (a3)
    {
      *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VCMediaRecorderManager" code:-4 userInfo:0];
    }
  }
  return 0;
}

- (void)deregisterBlocksFromService
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaRecorderInitialize");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaRecorderInitializeStandalone");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaRecorderUninitialize");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaRecorderStartRequest");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaRecorderEndRequest");
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v2 deregisterFromService:"vcMediaRecorderRejectRequest"];
}

- (void)notifyClientsWithStreamToken:(int64_t)a3 service:(char *)a4 arguments:(id)a5
{
  block[8] = *MEMORY[0x1E4F143B8];
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__VCMediaRecorderManager_notifyClientsWithStreamToken_service_arguments___block_invoke;
  block[3] = &unk_1E6DB54A0;
  block[6] = a3;
  block[7] = a4;
  block[4] = self;
  block[5] = a5;
  dispatch_async(xpcCommandQueue, block);
}

void __73__VCMediaRecorderManager_notifyClientsWithStreamToken_service_arguments___block_invoke(void *a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", a1[6]));
  if (v2)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = (id)[v2 clientContextList];
    uint64_t v3 = [obj countByEnumeratingWithState:&v35 objects:v34 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v36;
      uint64_t v6 = (os_log_t *)MEMORY[0x1E4F47A50];
      p_superclass = (__objc2_class **)(&OBJC_METACLASS___VCVideoFrameUtil + 8);
      uint64_t v19 = *(void *)v36;
      do
      {
        uint64_t v8 = 0;
        uint64_t v20 = v4;
        do
        {
          if (*(void *)v36 != v5) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v35 + 1) + 8 * v8);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            __str = 0;
            int v10 = *((_DWORD *)a1 + 12);
            uint64_t v11 = (const char *)a1[7];
            uint64_t v12 = (void *)a1[5];
            if (v12) {
              int v13 = (const char *)objc_msgSend((id)objc_msgSend(v12, "description"), "UTF8String");
            }
            else {
              int v13 = "<nil>";
            }
            asprintf(&__str, "streamToken=%u, service=%s, arguments=%s", v10, v11, v13);
            if (__str)
            {
              __lasts = 0;
              uint64_t v14 = strtok_r(__str, "\n", &__lasts);
              do
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  uint64_t v15 = VRTraceErrorLogLevelToCSTR();
                  v16 = *v6;
                  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136316162;
                    uint64_t v25 = v15;
                    __int16 v26 = 2080;
                    v27 = "-[VCMediaRecorderManager notifyClientsWithStreamToken:service:arguments:]_block_invoke";
                    __int16 v28 = 1024;
                    int v29 = 418;
                    __int16 v30 = 2080;
                    v31 = "";
                    __int16 v32 = 2080;
                    v33 = v14;
                    _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
                  }
                }
                uint64_t v14 = strtok_r(0, "\n", &__lasts);
              }
              while (v14);
              free(__str);
              uint64_t v5 = v19;
            }
            uint64_t v4 = v20;
            p_superclass = &OBJC_METACLASS___VCVideoFrameUtil.superclass;
          }
          objc_msgSend((id)objc_msgSend(p_superclass + 359, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", a1[7], a1[5], v9);
          ++v8;
        }
        while (v8 != v4);
        uint64_t v4 = [obj countByEnumeratingWithState:&v35 objects:v34 count:16];
      }
      while (v4);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    int v18 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __73__VCMediaRecorderManager_notifyClientsWithStreamToken_service_arguments___block_invoke_cold_1(v17, v18);
    }
  }
}

- (void)streamToken:(int64_t)a3 didStartProcessingRequest:(id)a4 error:(id)a5
{
  id v8 = (id)[a4 mutableCopy];
  if (a5) {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F28DB0], "archivedDataWithRootObject:requiringSecureCoding:error:", a5, 1, 0), @"vcMomentsError");
  }
  [(VCMediaRecorderManager *)self notifyClientsWithStreamToken:a3 service:"vcMediaRecorderDidStartProcessingRequest" arguments:v8];
}

+ (id)prepareURL:(id)a3 forXPCWithSandboxing:(BOOL)a4
{
  id v4 = a3;
  if (a4)
  {
    uint64_t v5 = [[VCSandboxedURL alloc] initWithURL:a3 accessType:2];
    uint64_t v6 = v5;
    if (v5)
    {
      id v4 = [(VCSandboxedURL *)v5 serialize];
      if (v4)
      {
LABEL_4:

        return v4;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          +[VCMediaRecorderManager prepareURL:forXPCWithSandboxing:]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaRecorderManager prepareURL:forXPCWithSandboxing:]();
      }
    }
    id v4 = 0;
    goto LABEL_4;
  }
  return v4;
}

- (void)streamToken:(int64_t)a3 didEndProcessingRequest:(id)a4 urlContext:(const tagVCMediaRecorderDelegateURLContext *)a5 error:(id)a6
{
  id v13 = (id)[a4 mutableCopy];
  id var0 = a5->var0;
  id var1 = a5->var1;
  BOOL var2 = a5->var2;
  [(VCMediaRecorderManager *)self saveImage:var0 movie:var1];
  if (var0) {
    objc_msgSend(v13, "setObject:forKeyedSubscript:", +[VCMediaRecorderManager prepareURL:forXPCWithSandboxing:](VCMediaRecorderManager, "prepareURL:forXPCWithSandboxing:", var0, var2), @"vcMomentsStillImageURL");
  }
  if (var1) {
    objc_msgSend(v13, "setObject:forKeyedSubscript:", +[VCMediaRecorderManager prepareURL:forXPCWithSandboxing:](VCMediaRecorderManager, "prepareURL:forXPCWithSandboxing:", var1, var2), @"vcMomentsMovieURL");
  }
  if (a6) {
    objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F28DB0], "archivedDataWithRootObject:requiringSecureCoding:error:", a6, 1, 0), @"vcMomentsError");
  }
  [(VCMediaRecorderManager *)self notifyClientsWithStreamToken:a3 service:"vcMediaRecorderDidEndProcessingRequest" arguments:v13];
}

- (void)saveImage:(id)a3 movie:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (VCDefaults_GetBoolValueForKey(@"FaceTimePhotosSaveImagesForDebug", 0))
  {
    if (a3)
    {
      uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "URLByAppendingPathExtension:", @"debug"), "URLByAppendingPathExtension:", objc_msgSend(a3, "pathExtension"));
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "copyItemAtURL:toURL:error:", a3, v6, 0);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        id v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 136315906;
          uint64_t v13 = v7;
          __int16 v14 = 2080;
          uint64_t v15 = "-[VCMediaRecorderManager saveImage:movie:]";
          __int16 v16 = 1024;
          int v17 = 481;
          __int16 v18 = 2112;
          uint64_t v19 = v6;
          _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Created for debugging: %@", (uint8_t *)&v12, 0x26u);
        }
      }
    }
    if (a4)
    {
      uint64_t v9 = objc_msgSend((id)objc_msgSend(a4, "URLByAppendingPathExtension:", @"debug"), "URLByAppendingPathExtension:", objc_msgSend(a4, "pathExtension"));
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "copyItemAtURL:toURL:error:", a4, v9, 0);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        uint64_t v11 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 136315906;
          uint64_t v13 = v10;
          __int16 v14 = 2080;
          uint64_t v15 = "-[VCMediaRecorderManager saveImage:movie:]";
          __int16 v16 = 1024;
          int v17 = 488;
          __int16 v18 = 2112;
          uint64_t v19 = v9;
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Created for debugging: %@", (uint8_t *)&v12, 0x26u);
        }
      }
    }
  }
}

- (void)streamToken:(int64_t)a3 didFinishRequest:(id)a4 didSucceed:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = (id)[a4 mutableCopy];
  objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v5), @"vcMomentsRequestDidSucceed");
  [(VCMediaRecorderManager *)self notifyClientsWithStreamToken:a3 service:"vcMediaRecorderDidFinishRequest" arguments:v8];
}

- (void)streamToken:(int64_t)a3 didUpdateCapabilities:(unsigned int)a4
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = @"vcMomentsCapabilities";
  v7[0] = [NSNumber numberWithUnsignedInt:*(void *)&a4];
  -[VCMediaRecorderManager notifyClientsWithStreamToken:service:arguments:](self, "notifyClientsWithStreamToken:service:arguments:", a3, "vcMediaRecorderCapabilitiesDidChange", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1]);
}

- (void)streamTokenDidCleanupAllRequests:(int64_t)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__VCMediaRecorderManager_streamTokenDidCleanupAllRequests___block_invoke;
  block[3] = &unk_1E6DB4568;
  block[4] = self;
  block[5] = a3;
  dispatch_async(xpcCommandQueue, block);
}

void __59__VCMediaRecorderManager_streamTokenDidCleanupAllRequests___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v2 = (__CFString **)(a1 + 40);
  uint64_t v3 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  id v4 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v3];
  if (v4)
  {
    objc_msgSend((id)objc_msgSend(v4, "mediaRecorder"), "setMediaRecorderDelegate:", 0);
    [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:v3];
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = *v2;
          int v18 = 136315906;
          uint64_t v19 = v8;
          __int16 v20 = 2080;
          uint64_t v21 = "-[VCMediaRecorderManager streamTokenDidCleanupAllRequests:]_block_invoke";
          __int16 v22 = 1024;
          int v23 = 515;
          __int16 v24 = 2048;
          uint64_t v25 = v10;
          uint64_t v11 = " [%s] %s:%d Cleaned up streamToken=%ld";
          int v12 = v9;
          uint32_t v13 = 38;
LABEL_15:
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v18, v13);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        BOOL v5 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        BOOL v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        uint64_t v15 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = *(void *)(a1 + 32);
          uint64_t v17 = *(void *)(a1 + 40);
          int v18 = 136316418;
          uint64_t v19 = v14;
          __int16 v20 = 2080;
          uint64_t v21 = "-[VCMediaRecorderManager streamTokenDidCleanupAllRequests:]_block_invoke";
          __int16 v22 = 1024;
          int v23 = 515;
          __int16 v24 = 2112;
          uint64_t v25 = v5;
          __int16 v26 = 2048;
          uint64_t v27 = v16;
          __int16 v28 = 2048;
          uint64_t v29 = v17;
          uint64_t v11 = " [%s] %s:%d %@(%p) Cleaned up streamToken=%ld";
          int v12 = v15;
          uint32_t v13 = 58;
          goto LABEL_15;
        }
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __59__VCMediaRecorderManager_streamTokenDidCleanupAllRequests___block_invoke_cold_1(v6, (uint64_t)v2, v7);
    }
  }
}

- (id)newRequestWithArguments:(id)a3 state:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsMediaType"), @"vcMomentsMediaType");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsRequesterID"), @"vcMomentsRequesterID");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsRequesteeID"), @"vcMomentsRequesteeID");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsTransactionID"), @"vcMomentsTransactionID");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", v4), @"vcMomentsRequestState");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsRequestMode"), @"vcMomentsRequestMode");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaRecorderDirectoryURL"), @"vcMediaRecorderDirectoryURL");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaRecorderMovieFragmentInterval"), @"vcMediaRecorderMovieFragmentInterval");
  return v6;
}

- (void)dispatchedRegisterMediaRecorder:withStreamToken:andError:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate stream token entry for stream token=%u", v2, v3, v4, 176);
}

void __73__VCMediaRecorderManager_notifyClientsWithStreamToken_service_arguments___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  BOOL v5 = "-[VCMediaRecorderManager notifyClientsWithStreamToken:service:arguments:]_block_invoke";
  __int16 v6 = 1024;
  int v7 = 414;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d notifyClientsWithStreamToken streamClientList is nil", (uint8_t *)&v2, 0x1Cu);
}

+ (void)prepareURL:forXPCWithSandboxing:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to issue read write sandboxedURL for url=%@");
}

+ (void)prepareURL:forXPCWithSandboxing:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to serialize sandboxedURL=%@");
}

void __59__VCMediaRecorderManager_streamTokenDidCleanupAllRequests___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315906;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(void *)&v3[14] = "-[VCMediaRecorderManager streamTokenDidCleanupAllRequests:]_block_invoke";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, a2, a3, " [%s] %s:%d Context doesn't exists for stream token: %u", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCMediaRecorderManager streamTokenDidCleanupAllRequests:]_block_invoke" >> 16, 510);
}

@end