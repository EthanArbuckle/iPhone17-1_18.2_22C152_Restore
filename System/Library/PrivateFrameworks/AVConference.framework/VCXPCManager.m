@interface VCXPCManager
+ (id)sharedInstance;
+ (void)addNSError:(id)a3 toXPCArgumentDictionary:(id)a4;
+ (void)registerBlock:(id)a3 forService:(const char *)a4;
+ (void)registerBlocksForService;
+ (void)registerTerminateBlock:(id)a3 forService:(const char *)a4 expectedClasses:(id)a5;
- (VCXPCManager)init;
- (unint64_t)retainCount;
- (void)dealloc;
- (void)deregisterBlocksFromService;
- (void)init;
@end

@implementation VCXPCManager

- (unint64_t)retainCount
{
  return -1;
}

- (VCXPCManager)init
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)VCXPCManager;
  v2 = [(VCObject *)&v10 init];
  if (!v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCXPCManager init](v8);
      }
    }
    goto LABEL_10;
  }
  v3 = (objc_class *)objc_opt_class();
  v4 = (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"%s.%@.%s", "com.apple.AVConference", NSStringFromClass(v3), "xpcCommandQueue"), "UTF8String"];
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
  dispatch_queue_t v6 = dispatch_queue_create_with_target_V2(v4, 0, CustomRootQueue);
  v2->_xpcCommandQueue = (OS_dispatch_queue *)v6;
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCXPCManager init](v9);
      }
    }
LABEL_10:

    return 0;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [(VCXPCManager *)self deregisterBlocksFromService];

  xpcCommandQueue = self->_xpcCommandQueue;
  if (xpcCommandQueue) {
    dispatch_release(xpcCommandQueue);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCXPCManager;
  [(VCObject *)&v4 dealloc];
}

+ (id)sharedInstance
{
}

+ (void)registerBlocksForService
{
}

- (void)deregisterBlocksFromService
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  registeredServices = self->_registeredServices;
  uint64_t v4 = [(NSMutableArray *)registeredServices countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(registeredServices);
        }
        objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "UTF8String"));
      }
      uint64_t v5 = [(NSMutableArray *)registeredServices countByEnumeratingWithState:&v9 objects:v8 count:16];
    }
    while (v5);
  }
  [(NSMutableArray *)self->_registeredServices removeAllObjects];
}

+ (void)registerBlock:(id)a3 forService:(const char *)a4
{
  v8[6] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [a1 sharedInstance];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__VCXPCManager_registerBlock_forService___block_invoke;
  v8[3] = &unk_1E6DB5400;
  v8[4] = a1;
  v8[5] = a3;
  objc_msgSend(*(id *)(v7 + 176), "addObject:", objc_msgSend(NSString, "stringWithUTF8String:", a4));
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", a4, v8, *(void *)(v7 + 168));
}

uint64_t __41__VCXPCManager_registerBlock_forService___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  [*(id *)(a1 + 32) sharedInstance];
  [a2 objectForKeyedSubscript:@"CONTEXT"];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)registerTerminateBlock:(id)a3 forService:(const char *)a4 expectedClasses:(id)a5
{
  v10[7] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = [a1 sharedInstance];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__VCXPCManager_registerTerminateBlock_forService_expectedClasses___block_invoke;
  v10[3] = &unk_1E6DB5428;
  v10[4] = a5;
  v10[5] = a1;
  v10[6] = a3;
  objc_msgSend(*(id *)(v9 + 176), "addObject:", objc_msgSend(NSString, "stringWithUTF8String:", a4, MEMORY[0x1E4F143A8], 3221225472, __66__VCXPCManager_registerTerminateBlock_forService_expectedClasses___block_invoke, &unk_1E6DB5428, a5, a1, a3));
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", a4, v10, *(void *)(v9 + 168));
}

id __66__VCXPCManager_registerTerminateBlock_forService_expectedClasses___block_invoke(uint64_t a1, void *a2)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    id v4 = 0;
  }
  else
  {
    v18 = @"CONTEXT";
    v19[0] = [MEMORY[0x1E4F1CA98] null];
    id v4 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  }
  uint64_t v5 = [a2 objectForKeyedSubscript:@"CONTEXT"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
LABEL_6:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v6);
      }
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v13 count:16];
        if (v8) {
          goto LABEL_6;
        }
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    v12[0] = [*(id *)(a1 + 40) sharedInstance];
    v12[1] = v5;
    (*(void (**)(void, void *))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v12);
  }
  return v4;
}

+ (void)addNSError:(id)a3 toXPCArgumentDictionary:(id)a4
{
  if (a3)
  {
    id v8 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    uint64_t v6 = [a3 domain];
    if (v6) {
      [v8 setObject:v6 forKeyedSubscript:@"ERROR_DOMAIN"];
    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "code")), @"ERROR_CODE");
    uint64_t v7 = [a3 userInfo];
    if (v7) {
      [v8 setObject:v7 forKeyedSubscript:@"ERROR_USERINFO"];
    }
    [a4 setObject:v8 forKeyedSubscript:@"ERROR"];
  }
}

- (void)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 60;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate xpcCommandQueue", (uint8_t *)&v2, 0x1Cu);
}

@end