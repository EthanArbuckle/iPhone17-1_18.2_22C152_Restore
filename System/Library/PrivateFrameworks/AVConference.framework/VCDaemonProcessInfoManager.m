@interface VCDaemonProcessInfoManager
+ (id)copyProcessInfo;
+ (id)sharedManager;
- (VCDaemonProcessInfoManager)allocWithZone:(_NSZone *)a3;
- (VCDaemonProcessInfoManager)init;
- (id)copyAuditTokenInfo;
- (id)copyUniquePidInfo;
- (unint64_t)retainCount;
- (void)copyUniquePidInfo;
- (void)dealloc;
- (void)deregisterBlocksForService;
- (void)registerBlocksForService;
@end

@implementation VCDaemonProcessInfoManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_26);
  }
  return (id)_vcDaemonProcessInfoManager;
}

void __43__VCDaemonProcessInfoManager_sharedManager__block_invoke()
{
  if (!_vcDaemonProcessInfoManager) {
    _vcDaemonProcessInfoManager = objc_alloc_init(VCDaemonProcessInfoManager);
  }
}

+ (id)copyProcessInfo
{
  v2 = (void *)[(id)objc_opt_class() sharedManager];

  return (id)[v2 copyUniquePidInfo];
}

- (VCDaemonProcessInfoManager)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCDaemonProcessInfoManager;
  v2 = [(VCDaemonProcessInfoManager *)&v5 init];
  if (v2)
  {
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v2->_xpcQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCDaemonProcessInfoManager.xpcQueue", 0, CustomRootQueue);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCDaemonProcessInfoManager *)self deregisterBlocksForService];
  dispatch_release((dispatch_object_t)self->_xpcQueue);
  v3.receiver = self;
  v3.super_class = (Class)VCDaemonProcessInfoManager;
  [(VCDaemonProcessInfoManager *)&v3 dealloc];
}

- (VCDaemonProcessInfoManager)allocWithZone:(_NSZone *)a3
{
  return (VCDaemonProcessInfoManager *)_vcDaemonProcessInfoManager;
}

- (unint64_t)retainCount
{
  return -1;
}

- (void)registerBlocksForService
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton", MEMORY[0x1E4F143A8], 3221225472, __54__VCDaemonProcessInfoManager_registerBlocksForService__block_invoke, &unk_1E6DB5478, self, *MEMORY[0x1E4F143B8]), "registerBlockForService:block:queue:", "vcGetDaemonProcessInfo", &v2, self->_xpcQueue);
}

uint64_t __54__VCDaemonProcessInfoManager_registerBlocksForService__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  if ([a2 objectForKeyedSubscript:@"vcGetDaemonProcessInfoUniquePid"])
  {
    objc_super v5 = *(void **)(a1 + 32);
    return [v5 copyUniquePidInfo];
  }
  else
  {
    if (![a2 objectForKeyedSubscript:@"vcDaemonProcessInfoAuditToken"]) {
      return 0;
    }
    uint64_t v6 = *(void **)(a1 + 32);
    return [v6 copyAuditTokenInfo];
  }
}

- (void)deregisterBlocksForService
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v2 deregisterFromService:"vcGetDaemonProcessInfo"];
}

- (id)copyUniquePidInfo
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v29 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long buffer = 0u;
  pid_t v3 = getpid();
  if (proc_pidinfo(v3, 17, 1uLL, &buffer, 56) == 56)
  {
    uint64_t v4 = 0;
    uint64_t v5 = v27;
  }
  else
  {
    if ((VCDaemonProcessInfoManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          [(VCDaemonProcessInfoManager *)v7 copyUniquePidInfo];
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v6 = (__CFString *)[(VCDaemonProcessInfoManager *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v17 = v9;
          __int16 v18 = 2080;
          v19 = "-[VCDaemonProcessInfoManager copyUniquePidInfo]";
          __int16 v20 = 1024;
          int v21 = 124;
          __int16 v22 = 2112;
          v23 = v6;
          __int16 v24 = 2048;
          v25 = self;
          _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to fetch unique pid", buf, 0x30u);
        }
      }
    }
    uint64_t v5 = -1;
    uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VCDaemonProcessInfo" code:-1 userInfo:0];
  }
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", v5, @"avcKeyDaemonProcessInfoUniquePID");
  v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1), "mutableCopy");
  v12 = v11;
  if (v4) {
    [v11 setObject:v4 forKeyedSubscript:@"avcKeyDaemonProcessInfoError"];
  }
  return v12;
}

- (id)copyAuditTokenInfo
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v10[0] = v2;
  v10[1] = v2;
  VCUtil_AuditTokenForCurrentProcess(v10);
  if (VCUtil_AuditTokenValid((uint64_t)v10))
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v10 length:32];
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VCDaemonProcessInfo" code:-2 userInfo:0];
    uint64_t v3 = 0;
  }
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
  uint64_t v6 = v5;
  if (v3)
  {
    uint64_t v7 = @"vcDaemonProcessInfoAuditToken";
    uint64_t v8 = v3;
LABEL_8:
    [v5 setObject:v8 forKeyedSubscript:v7];
    return v6;
  }
  if (v4)
  {
    uint64_t v7 = @"ERROR";
    uint64_t v8 = v4;
    goto LABEL_8;
  }
  return v6;
}

- (void)copyUniquePidInfo
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "-[VCDaemonProcessInfoManager copyUniquePidInfo]";
  __int16 v6 = 1024;
  int v7 = 124;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to fetch unique pid", (uint8_t *)&v2, 0x1Cu);
}

@end