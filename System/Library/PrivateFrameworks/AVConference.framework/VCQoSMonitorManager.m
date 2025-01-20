@interface VCQoSMonitorManager
+ (id)sharedInstance;
- (BOOL)doesQoSSourceExistForStreamToken:(id)a3;
- (VCQoSMonitorManager)init;
- (void)dealloc;
- (void)deregisterBlocksForService;
- (void)registerBlocksForService;
- (void)registerQoSReportingSourceForToken:(int64_t)a3;
- (void)unregisterQoSReportingSourceForToken:(int64_t)a3;
- (void)updateEventDrivenQoSReport:(id)a3 toClientsWithToken:(int64_t)a4;
- (void)updateQoSReport:(id)a3 toClientsWithToken:(int64_t)a4;
@end

@implementation VCQoSMonitorManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1) {
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_35);
  }
  return (id)sharedInstance__vcQosMonitorManager;
}

void __37__VCQoSMonitorManager_sharedInstance__block_invoke()
{
  if (!sharedInstance__vcQosMonitorManager) {
    sharedInstance__vcQosMonitorManager = objc_alloc_init(VCQoSMonitorManager);
  }
}

- (VCQoSMonitorManager)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCQoSMonitorManager;
  v2 = [(VCObject *)&v5 init];
  if (v2)
  {
    v2->_sources = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_reportingInterval = reportingDefaultRealtimePeriod();
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v2->_xpcCommandQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCQoSMonitorManager.xpcCommandQueue", 0, CustomRootQueue);
    [(VCQoSMonitorManager *)v2 registerBlocksForService];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  dispatch_release((dispatch_object_t)self->_xpcCommandQueue);
  [(VCQoSMonitorManager *)self deregisterBlocksForService];

  v3.receiver = self;
  v3.super_class = (Class)VCQoSMonitorManager;
  [(VCObject *)&v3 dealloc];
}

- (void)registerQoSReportingSourceForToken:(int64_t)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__VCQoSMonitorManager_registerQoSReportingSourceForToken___block_invoke;
  block[3] = &unk_1E6DB4568;
  block[4] = self;
  block[5] = a3;
  dispatch_async(xpcCommandQueue, block);
}

void __58__VCQoSMonitorManager_registerQoSReportingSourceForToken___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    objc_super v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v6 = 136315906;
      uint64_t v7 = v2;
      __int16 v8 = 2080;
      v9 = "-[VCQoSMonitorManager registerQoSReportingSourceForToken:]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 79;
      __int16 v12 = 2048;
      uint64_t v13 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d registered source[streamToken=%ld]", (uint8_t *)&v6, 0x26u);
    }
  }
  if (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 168), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(a1 + 40))))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __58__VCQoSMonitorManager_registerQoSReportingSourceForToken___block_invoke_cold_1();
      }
    }
  }
  else
  {
    id v5 = (id)objc_opt_new();
    [v5 setSourceToken:*(void *)(a1 + 40)];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 168), "setObject:forKeyedSubscript:", v5, objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(a1 + 40)));
  }
}

- (void)unregisterQoSReportingSourceForToken:(int64_t)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__VCQoSMonitorManager_unregisterQoSReportingSourceForToken___block_invoke;
  block[3] = &unk_1E6DB4568;
  block[4] = self;
  block[5] = a3;
  dispatch_async(xpcCommandQueue, block);
}

void __60__VCQoSMonitorManager_unregisterQoSReportingSourceForToken___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    objc_super v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v5 = 136315906;
      uint64_t v6 = v2;
      __int16 v7 = 2080;
      __int16 v8 = "-[VCQoSMonitorManager unregisterQoSReportingSourceForToken:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 92;
      __int16 v11 = 2048;
      uint64_t v12 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d unregistered source[streamToken=%ld]", (uint8_t *)&v5, 0x26u);
    }
  }
  if (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 168), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(a1 + 40))))
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 168), "setObject:forKeyedSubscript:", 0, objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(a1 + 40)));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __60__VCQoSMonitorManager_unregisterQoSReportingSourceForToken___block_invoke_cold_1();
    }
  }
}

- (void)updateQoSReport:(id)a3 toClientsWithToken:(int64_t)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v11[0] = a3;
  v10[0] = @"vcQoSReportDictionary";
  v10[1] = @"vcQoSReportToken";
  v11[1] = [NSNumber numberWithInteger:a4];
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  if (VRTraceIsInternalOSInstalled())
  {
    xpcCommandQueue = self->_xpcCommandQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__VCQoSMonitorManager_updateQoSReport_toClientsWithToken___block_invoke;
    block[3] = &unk_1E6DB6560;
    block[4] = a3;
    block[5] = self;
    block[6] = v7;
    void block[7] = a4;
    dispatch_async(xpcCommandQueue, block);
  }
}

void __58__VCQoSMonitorManager_updateQoSReport_toClientsWithToken___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    objc_super v3 = *MEMORY[0x1E4F47A50];
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = a1[4];
        int v7 = 136315906;
        uint64_t v8 = v2;
        __int16 v9 = 2080;
        int v10 = "-[VCQoSMonitorManager updateQoSReport:toClientsWithToken:]_block_invoke";
        __int16 v11 = 1024;
        int v12 = 106;
        __int16 v13 = 2112;
        uint64_t v14 = v5;
        _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d updateQoSReport qosReport=%@", (uint8_t *)&v7, 0x26u);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      __58__VCQoSMonitorManager_updateQoSReport_toClientsWithToken___block_invoke_cold_2();
    }
  }
  if (objc_msgSend(*(id *)(a1[5] + 168), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", a1[7])))
  {
    id v6 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
    objc_msgSend(v6, "sendMessageAsync:arguments:toAllClientsWithContext:", "vcQoSMonitorCallbackDidReceiveReport", a1[6], objc_msgSend(NSNumber, "numberWithInteger:", a1[7]));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __58__VCQoSMonitorManager_updateQoSReport_toClientsWithToken___block_invoke_cold_1();
    }
  }
}

- (void)updateEventDrivenQoSReport:(id)a3 toClientsWithToken:(int64_t)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v11[0] = a3;
  v10[0] = @"vcQoSReportDictionary";
  v10[1] = @"vcQoSReportToken";
  v11[1] = [NSNumber numberWithInteger:a4];
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  if (VRTraceIsInternalOSInstalled())
  {
    xpcCommandQueue = self->_xpcCommandQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__VCQoSMonitorManager_updateEventDrivenQoSReport_toClientsWithToken___block_invoke;
    block[3] = &unk_1E6DB6560;
    block[4] = a3;
    block[5] = self;
    block[6] = v7;
    void block[7] = a4;
    dispatch_async(xpcCommandQueue, block);
  }
}

void __69__VCQoSMonitorManager_updateEventDrivenQoSReport_toClientsWithToken___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    objc_super v3 = *MEMORY[0x1E4F47A50];
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = a1[4];
        int v7 = 136315906;
        uint64_t v8 = v2;
        __int16 v9 = 2080;
        int v10 = "-[VCQoSMonitorManager updateEventDrivenQoSReport:toClientsWithToken:]_block_invoke";
        __int16 v11 = 1024;
        int v12 = 121;
        __int16 v13 = 2112;
        uint64_t v14 = v5;
        _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d updateQoSReport with non real-time keys qosReport=%@", (uint8_t *)&v7, 0x26u);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      __69__VCQoSMonitorManager_updateEventDrivenQoSReport_toClientsWithToken___block_invoke_cold_2();
    }
  }
  if (objc_msgSend(*(id *)(a1[5] + 168), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", a1[7])))
  {
    id v6 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
    objc_msgSend(v6, "sendMessageAsync:arguments:toAllClientsWithContext:", "vcQoSMonitorCallbackDidReceiveReportEventDrivenKey", a1[6], objc_msgSend(NSNumber, "numberWithInteger:", a1[7]));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __69__VCQoSMonitorManager_updateEventDrivenQoSReport_toClientsWithToken___block_invoke_cold_1();
    }
  }
}

- (void)registerBlocksForService
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton", MEMORY[0x1E4F143A8], 3221225472, __47__VCQoSMonitorManager_registerBlocksForService__block_invoke, &unk_1E6DB5478, self, *MEMORY[0x1E4F143B8]), "registerBlockForService:block:queue:", "vcQosMonitorInitializForStreamToken", &v3, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcQosMonitorTerminate", &__block_literal_global_39, self->_xpcCommandQueue);
}

uint64_t __47__VCQoSMonitorManager_registerBlocksForService__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  id v6 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
  if (![*(id *)(a1 + 32) doesQoSSourceExistForStreamToken:v6])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      __int16 v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __47__VCQoSMonitorManager_registerBlocksForService__block_invoke_cold_1(v10, v6, v11);
      }
    }
    return 0;
  }
  id v7 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v4 = objc_msgSend(v7, "initWithObjectsAndKeys:", v6, @"CONTEXT", objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(*(void *)(a1 + 32) + 184)), @"vcQoSReportingInterval", 0);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    __int16 v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v13 = v8;
      __int16 v14 = 2080;
      uint64_t v15 = "-[VCQoSMonitorManager registerBlocksForService]_block_invoke";
      __int16 v16 = 1024;
      int v17 = 146;
      __int16 v18 = 1024;
      int v19 = [v6 unsignedIntValue];
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCRemoteVideoManager: new client initialized for streamToken=%u", buf, 0x22u);
    }
  }
  return v4;
}

uint64_t __47__VCQoSMonitorManager_registerBlocksForService__block_invoke_37(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = 0;
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v3 = objc_msgSend(v4, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"CONTEXT", 0);
  }
  uint64_t v5 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    id v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v10 = v6;
      __int16 v11 = 2080;
      int v12 = "-[VCQoSMonitorManager registerBlocksForService]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 169;
      __int16 v15 = 1024;
      int v16 = [v5 unsignedIntValue];
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCQoSMonitorManager: Terminate remoteVideo connection for streamToken=%u", buf, 0x22u);
    }
  }
  return v3;
}

- (void)deregisterBlocksForService
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcQosMonitorInitializForStreamToken");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcQosMonitorRegisterStreamToken");
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v2 deregisterFromService:"vcQosMonitorTerminate"];
}

- (BOOL)doesQoSSourceExistForStreamToken:(id)a3
{
  return a3 && -[NSMutableDictionary objectForKeyedSubscript:](self->_sources, "objectForKeyedSubscript:") != 0;
}

void __58__VCQoSMonitorManager_registerQoSReportingSourceForToken___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d source[streamToken=%ld] already registered", v2, v3, v4, v5);
}

void __60__VCQoSMonitorManager_unregisterQoSReportingSourceForToken___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d source[streamToken=%ld] already unregistered", v2, v3, v4, v5);
}

void __58__VCQoSMonitorManager_updateQoSReport_toClientsWithToken___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d source for streamToken=%ld not registered", v2, v3, v4, v5);
}

void __58__VCQoSMonitorManager_updateQoSReport_toClientsWithToken___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d updateQoSReport qosReport=%@");
}

void __69__VCQoSMonitorManager_updateEventDrivenQoSReport_toClientsWithToken___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d source for streamToken=%ld not registered", v2, v3, v4, v5);
}

void __69__VCQoSMonitorManager_updateEventDrivenQoSReport_toClientsWithToken___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d updateQoSReport with non real-time keys qosReport=%@");
}

void __47__VCQoSMonitorManager_registerBlocksForService__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  id v7 = "-[VCQoSMonitorManager registerBlocksForService]_block_invoke";
  __int16 v8 = 1024;
  int v9 = 148;
  __int16 v10 = 1024;
  int v11 = [a2 unsignedIntValue];
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d VCQoSMonitorManager: ERROR QoS source does not exist for streamToken=%u", (uint8_t *)&v4, 0x22u);
}

@end