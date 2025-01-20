@interface VCCaptionsManager
+ (id)defaultManager;
- (VCCaptionsManager)init;
- (id)captionsSourceFromClientContext:(id)a3;
- (id)deserializeLocale:(id)a3 withError:(id *)a4;
- (void)dealloc;
- (void)deregisterBlocksForService;
- (void)notifyClientsWithStreamToken:(int64_t)a3 service:(char *)a4 arguments:(id)a5;
- (void)registerBlocksForService;
- (void)registerCaptionsSource:(id)a3 streamToken:(int64_t)a4;
- (void)streamToken:(int64_t)a3 didDetectGibberish:(BOOL)a4;
- (void)streamToken:(int64_t)a3 didDisableCaptions:(BOOL)a4 error:(id)a5;
- (void)streamToken:(int64_t)a3 didEnableCaptions:(BOOL)a4 error:(id)a5;
- (void)streamToken:(int64_t)a3 didStartCaptioningWithReason:(unsigned __int8)a4;
- (void)streamToken:(int64_t)a3 didStopCaptioningWithReason:(unsigned __int8)a4;
- (void)streamToken:(int64_t)a3 didUpdateCaptions:(id)a4;
- (void)unregisterCaptionsSourceWithStreamToken:(int64_t)a3;
@end

@implementation VCCaptionsManager

+ (id)defaultManager
{
  if (defaultManager_onceToken != -1) {
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_13);
  }
  return (id)defaultManager__vcCaptionsManager;
}

void __35__VCCaptionsManager_defaultManager__block_invoke()
{
  if (!defaultManager__vcCaptionsManager) {
    defaultManager__vcCaptionsManager = objc_alloc_init(VCCaptionsManager);
  }
}

- (VCCaptionsManager)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCCaptionsManager;
  v2 = [(VCCaptionsManager *)&v5 init];
  if (v2)
  {
    v2->_streamTokenList = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_connection = objc_alloc_init(AVConferenceXPCClient);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v2->_xpcCommandQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCCaptionsManager.xpcCommandQueue", 0, CustomRootQueue);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCCaptionsManager *)self deregisterBlocksForService];
  dispatch_release((dispatch_object_t)self->_xpcCommandQueue);

  v3.receiver = self;
  v3.super_class = (Class)VCCaptionsManager;
  [(VCCaptionsManager *)&v3 dealloc];
}

- (void)registerCaptionsSource:(id)a3 streamToken:(int64_t)a4
{
  v5[7] = *MEMORY[0x1E4F143B8];
  xpcCommandQueue = self->_xpcCommandQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__VCCaptionsManager_registerCaptionsSource_streamToken___block_invoke;
  v5[3] = &unk_1E6DB5450;
  v5[5] = a3;
  v5[6] = a4;
  v5[4] = self;
  dispatch_async(xpcCommandQueue, v5);
}

void __56__VCCaptionsManager_registerCaptionsSource_streamToken___block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  if ([*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v2])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __56__VCCaptionsManager_registerCaptionsSource_streamToken___block_invoke_cold_1(v3, (uint64_t *)(a1 + 48), v4);
      }
    }
  }
  objc_super v5 = [[VCCaptionsManagerStreamTokenClientList alloc] initWithStreamToken:*(void *)(a1 + 48) captionsSource:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v5 forKeyedSubscript:v2];
  [*(id *)(a1 + 40) registerCaptionsEventDelegate:*(void *)(a1 + 32)];
}

- (void)unregisterCaptionsSourceWithStreamToken:(int64_t)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__VCCaptionsManager_unregisterCaptionsSourceWithStreamToken___block_invoke;
  block[3] = &unk_1E6DB4568;
  block[4] = self;
  block[5] = a3;
  dispatch_async(xpcCommandQueue, block);
}

uint64_t __61__VCCaptionsManager_unregisterCaptionsSourceWithStreamToken___block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "objectForKeyedSubscript:", v2), "captionsSource"), "registerCaptionsEventDelegate:", 0);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);

  return [v3 removeObjectForKey:v2];
}

- (id)captionsSourceFromClientContext:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcCommandQueue);
  if (!+[VCCaptionsManagerStreamTokenClientList isValidContext:a3])return 0; {
  int64_t v5 = +[VCCaptionsManagerStreamTokenClientList streamTokenFromClientContext:a3];
  }
  uint64_t v6 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenList, "objectForKeyedSubscript:", [NSNumber numberWithInteger:v5]);

  return (id)[v6 captionsSource];
}

- (id)deserializeLocale:(id)a3 withError:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 objectForKey:@"vcCaptionsLocale"];
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3
      && (uint64_t v9 = VRTraceErrorLogLevelToCSTR(),
          v10 = *MEMORY[0x1E4F47A50],
          os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
      -[VCCaptionsManager deserializeLocale:withError:](v9, v5, v10);
      if (!a4) {
        return 0;
      }
    }
    else if (!a4)
    {
      return 0;
    }
    goto LABEL_12;
  }
  uint64_t v6 = (void *)[MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:a4];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3
      && (uint64_t v7 = VRTraceErrorLogLevelToCSTR(),
          v8 = *MEMORY[0x1E4F47A50],
          os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
      v12 = (objc_class *)objc_opt_class();
      Name = class_getName(v12);
      if (a4) {
        v14 = (__CFString *)*a4;
      }
      else {
        v14 = @"nil";
      }
      int v15 = 136316418;
      uint64_t v16 = v7;
      __int16 v17 = 2080;
      v18 = "-[VCCaptionsManager deserializeLocale:withError:]";
      __int16 v19 = 1024;
      int v20 = 185;
      __int16 v21 = 2112;
      v22 = v6;
      __int16 v23 = 2080;
      v24 = Name;
      __int16 v25 = 2112;
      v26 = v14;
      _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d deserializedLocale not deserialized into NSLocale, deserializedLocale=%@, class=%s, error=%@", (uint8_t *)&v15, 0x3Au);
      if (!a4) {
        return 0;
      }
    }
    else if (!a4)
    {
      return 0;
    }
LABEL_12:
    uint64_t v6 = 0;
    *a4 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"VCCaptionsManager" code:-5 userInfo:0];
  }
  return v6;
}

- (void)registerBlocksForService
{
  v8[5] = *MEMORY[0x1E4F143B8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__VCCaptionsManager_registerBlocksForService__block_invoke;
  v8[3] = &unk_1E6DB5478;
  v8[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcCaptionsClientInitialize", v8, self->_xpcCommandQueue);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__VCCaptionsManager_registerBlocksForService__block_invoke_69;
  v7[3] = &unk_1E6DB5478;
  v7[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcCaptionsClientUninitialize", v7, self->_xpcCommandQueue);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__VCCaptionsManager_registerBlocksForService__block_invoke_72;
  v6[3] = &unk_1E6DB5478;
  v6[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcCaptionsSetCaptionsConfiguration", v6, self->_xpcCommandQueue);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__VCCaptionsManager_registerBlocksForService__block_invoke_2;
  v5[3] = &unk_1E6DB5478;
  v5[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcCaptionsGetCaptionsEnabled", v5, self->_xpcCommandQueue);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__VCCaptionsManager_registerBlocksForService__block_invoke_3;
  v4[3] = &unk_1E6DB5478;
  v4[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcCaptionsGetCaptionsSupported", v4, self->_xpcCommandQueue);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__VCCaptionsManager_registerBlocksForService__block_invoke_4;
  v3[3] = &unk_1E6DB5478;
  v3[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcCaptionsSetCaptionsEnabled", v3, self->_xpcCommandQueue);
}

uint64_t __45__VCCaptionsManager_registerBlocksForService__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKey:@"CLIENTDIED"]) {
    return 0;
  }
  v8 = (void *)[a2 objectForKey:@"vcCaptionsStreamToken"];
  if (!v8)
  {
    if (!a3) {
      return 0;
    }
    uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = -4;
LABEL_17:
    uint64_t v6 = 0;
    *a3 = [v16 errorWithDomain:@"VCCaptionsManager" code:v17 userInfo:0];
    return v6;
  }
  uint64_t v9 = [v8 unsignedIntegerValue];
  v10 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "objectForKey:", objc_msgSend(NSNumber, "numberWithInteger:", v9));
  if (!v10)
  {
    if (!a3) {
      return 0;
    }
    uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = -1;
    goto LABEL_17;
  }
  v11 = v10;
  objc_msgSend((id)objc_msgSend(v10, "captionsSource"), "prewarmCaptions");
  uint64_t v12 = [v11 newContext];
  if (!v12)
  {
    if (a3)
    {
      uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = -3;
      goto LABEL_17;
    }
    return 0;
  }
  v13 = (void *)v12;
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v12, @"CONTEXT", 0);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    int v15 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v19 = v14;
      __int16 v20 = 2080;
      __int16 v21 = "-[VCCaptionsManager registerBlocksForService]_block_invoke";
      __int16 v22 = 1024;
      int v23 = 227;
      __int16 v24 = 2048;
      __int16 v25 = v13;
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCCaptionsManager: New captions client. Context=0x%p", buf, 0x26u);
    }
  }

  return v6;
}

uint64_t __45__VCCaptionsManager_registerBlocksForService__block_invoke_69(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKey:@"CLIENTDIED"])
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v4 = objc_msgSend(v5, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"CONTEXT", 0);
  }
  uint64_t v6 = [a2 objectForKeyedSubscript:@"CONTEXT"];
  if (+[VCCaptionsManagerStreamTokenClientList isValidContext:v6])
  {
    int64_t v7 = +[VCCaptionsManagerStreamTokenClientList streamTokenFromClientContext:v6];
    objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "objectForKey:", objc_msgSend(NSNumber, "numberWithInteger:", v7)), "removeContext:", v6);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v12 = v8;
        __int16 v13 = 2080;
        uint64_t v14 = "-[VCCaptionsManager registerBlocksForService]_block_invoke";
        __int16 v15 = 1024;
        int v16 = 246;
        __int16 v17 = 2048;
        uint64_t v18 = v6;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCCaptionsManager: Unregister captions client. Context=0x%p", buf, 0x26u);
      }
    }
  }
  return v4;
}

uint64_t __45__VCCaptionsManager_registerBlocksForService__block_invoke_72(uint64_t a1, void *a2, void *a3)
{
  if (![a2 objectForKey:@"CLIENTDIED"])
  {
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "captionsSourceFromClientContext:", objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"));
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = [*(id *)(a1 + 32) deserializeLocale:a2 withError:a3];
      if (v9) {
        [v8 setCaptionsLocale:v9];
      }
      uint64_t v10 = [a2 objectForKeyedSubscript:@"vcCaptionsUsage"];
      if (v10) {
        [v8 setCaptionsUsage:v10];
      }
    }
    else if (a3)
    {
      *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VCCaptionsManager" code:-2 userInfo:0];
    }
  }
  return 0;
}

uint64_t __45__VCCaptionsManager_registerBlocksForService__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  if ([a2 objectForKey:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "captionsSourceFromClientContext:", objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"));
  if (!v7)
  {
    if (a3) {
      *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VCCaptionsManager" code:-2 userInfo:0];
    }
    return 0;
  }
  uint64_t v8 = objc_msgSend(objc_alloc(NSNumber), "initWithBool:", objc_msgSend(v7, "captionsEnabled"));
  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v8, @"vcCaptionsEnabled", 0);

  return v9;
}

uint64_t __45__VCCaptionsManager_registerBlocksForService__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  if ([a2 objectForKey:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "captionsSourceFromClientContext:", objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"));
  if (!v7)
  {
    if (a3) {
      *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VCCaptionsManager" code:-2 userInfo:0];
    }
    return 0;
  }
  uint64_t v8 = objc_msgSend(objc_alloc(NSNumber), "initWithBool:", objc_msgSend(v7, "captionsSupported"));
  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v8, @"vcCaptionsSupported", 0);

  return v9;
}

uint64_t __45__VCCaptionsManager_registerBlocksForService__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  if (![a2 objectForKey:@"CLIENTDIED"])
  {
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "captionsSourceFromClientContext:", objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"));
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = (void *)[a2 objectForKey:@"vcCaptionsEnable"];
      if (v9)
      {
        objc_msgSend(v8, "enableCaptions:", objc_msgSend(v9, "BOOLValue"));
        return 0;
      }
      if (!a3) {
        return 0;
      }
      uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = -6;
    }
    else
    {
      if (!a3) {
        return 0;
      }
      uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = -2;
    }
    *a3 = [v10 errorWithDomain:@"VCCaptionsManager" code:v11 userInfo:0];
  }
  return 0;
}

- (void)deregisterBlocksForService
{
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcCaptionsClientInitialize"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcCaptionsClientUninitialize"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcCaptionsSetCaptionsConfiguration"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcCaptionsGetCaptionsEnabled"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcCaptionsGetCaptionsSupported"];
  connection = self->_connection;

  [(AVConferenceXPCClient *)connection deregisterFromService:"vcCaptionsSetCaptionsEnabled"];
}

- (void)notifyClientsWithStreamToken:(int64_t)a3 service:(char *)a4 arguments:(id)a5
{
  block[8] = *MEMORY[0x1E4F143B8];
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__VCCaptionsManager_notifyClientsWithStreamToken_service_arguments___block_invoke;
  block[3] = &unk_1E6DB54A0;
  block[6] = a3;
  void block[7] = a4;
  block[4] = self;
  block[5] = a5;
  dispatch_async(xpcCommandQueue, block);
}

void *__68__VCCaptionsManager_notifyClientsWithStreamToken_service_arguments___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  result = objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", a1[6]));
  if (result)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v3 = (void *)[result clientContextList];
    result = (void *)[v3 countByEnumeratingWithState:&v8 objects:v7 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", a1[7], a1[5], *(void *)(*((void *)&v8 + 1) + 8 * (void)v6));
          uint64_t v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        result = (void *)[v3 countByEnumeratingWithState:&v8 objects:v7 count:16];
        uint64_t v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)streamToken:(int64_t)a3 didEnableCaptions:(BOOL)a4 error:(id)a5
{
  id v13 = (id)[objc_alloc(NSNumber) initWithBool:a4];
  if (a5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a5 requiringSecureCoding:1 error:0];
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v13, @"vcCaptionsEnabled", v8, @"vcCaptionsError", 0);
  }
  else
  {
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v13, @"vcCaptionsEnabled", 0, v11, v12);
  }
  long long v10 = (void *)v9;
  [(VCCaptionsManager *)self notifyClientsWithStreamToken:a3 service:"vcCaptionsDidEnableCaptions" arguments:v9];
}

- (void)streamToken:(int64_t)a3 didDisableCaptions:(BOOL)a4 error:(id)a5
{
  id v13 = (id)[objc_alloc(NSNumber) initWithBool:a4];
  if (a5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a5 requiringSecureCoding:1 error:0];
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v13, @"vcCaptionsDisabled", v8, @"vcCaptionsError", 0);
  }
  else
  {
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v13, @"vcCaptionsDisabled", 0, v11, v12);
  }
  long long v10 = (void *)v9;
  [(VCCaptionsManager *)self notifyClientsWithStreamToken:a3 service:"vcCaptionsDidDisableCaptions" arguments:v9];
}

- (void)streamToken:(int64_t)a3 didStartCaptioningWithReason:(unsigned __int8)a4
{
  id v7 = (id)[objc_alloc(NSNumber) initWithUnsignedChar:a4];
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"vcCaptionsStartReason", 0);
  [(VCCaptionsManager *)self notifyClientsWithStreamToken:a3 service:"vcCaptionsDidCaptionsStart" arguments:v6];
}

- (void)streamToken:(int64_t)a3 didStopCaptioningWithReason:(unsigned __int8)a4
{
  id v7 = (id)[objc_alloc(NSNumber) initWithUnsignedChar:a4];
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"vcCaptionsStopReason", 0);
  [(VCCaptionsManager *)self notifyClientsWithStreamToken:a3 service:"vcCaptionsDidCaptionsEnd" arguments:v6];
}

- (void)streamToken:(int64_t)a3 didUpdateCaptions:(id)a4
{
  uint64_t v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a4 requiringSecureCoding:1 error:0];
  id v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v6, @"vcCaptionsTranscription", 0);
  [(VCCaptionsManager *)self notifyClientsWithStreamToken:a3 service:"vcCaptionsDidUpdateCaptions" arguments:v7];
}

- (void)streamToken:(int64_t)a3 didDetectGibberish:(BOOL)a4
{
  id v7 = (id)[objc_alloc(NSNumber) initWithBool:a4];
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"vcCaptionsGibberish", 0);
  [(VCCaptionsManager *)self notifyClientsWithStreamToken:a3 service:"vcCaptionsDidDetectGibberish" arguments:v6];
}

void __56__VCCaptionsManager_registerCaptionsSource_streamToken___block_invoke_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  id v7 = "-[VCCaptionsManager registerCaptionsSource:streamToken:]_block_invoke";
  __int16 v8 = 1024;
  int v9 = 141;
  __int16 v10 = 1024;
  int v11 = v3;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d VCCaptionsManager: Context already exists for stream token: %u", (uint8_t *)&v4, 0x22u);
}

- (void)deserializeLocale:(NSObject *)a3 withError:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  __int16 v6 = (objc_class *)objc_opt_class();
  int v7 = 136316162;
  uint64_t v8 = a1;
  __int16 v9 = 2080;
  __int16 v10 = "-[VCCaptionsManager deserializeLocale:withError:]";
  __int16 v11 = 1024;
  int v12 = 177;
  __int16 v13 = 2112;
  uint64_t v14 = a2;
  __int16 v15 = 2080;
  Name = class_getName(v6);
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d serializedLocale not present serializedLocale=%@, class=%s", (uint8_t *)&v7, 0x30u);
}

@end