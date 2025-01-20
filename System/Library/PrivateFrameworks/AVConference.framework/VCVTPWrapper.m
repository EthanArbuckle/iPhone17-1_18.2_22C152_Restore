@interface VCVTPWrapper
+ (void)startVTP;
+ (void)stopVTP;
@end

@implementation VCVTPWrapper

+ (void)startVTP
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(a1);
  int v3 = vtpRefCount;
  if (!vtpRefCount)
  {
    VTP_Initialize();
    int v3 = vtpRefCount;
  }
  vtpRefCount = v3 + 1;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v4;
      __int16 v8 = 2080;
      v9 = "+[VCVTPWrapper startVTP]";
      __int16 v10 = 1024;
      int v11 = 23;
      __int16 v12 = 1024;
      int v13 = vtpRefCount;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VTP refCount=%d", (uint8_t *)&v6, 0x22u);
    }
  }
  objc_sync_exit(a1);
}

+ (void)stopVTP
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(a1);
  if (vtpRefCount >= 1)
  {
    --vtpRefCount;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136315906;
        uint64_t v6 = v3;
        __int16 v7 = 2080;
        __int16 v8 = "+[VCVTPWrapper stopVTP]";
        __int16 v9 = 1024;
        int v10 = 31;
        __int16 v11 = 1024;
        int v12 = vtpRefCount;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VTP refCount=%d", (uint8_t *)&v5, 0x22u);
      }
    }
    if (!vtpRefCount) {
      VTP_Cleanup();
    }
  }
  objc_sync_exit(a1);
}

@end