@interface VCVisualAlert
+ (void)start;
+ (void)stop;
@end

@implementation VCVisualAlert

+ (void)start
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v2 = start_visualAlertEnabled;
  if (!start_visualAlertEnabled)
  {
    v3 = [(NSString *)NSOpenStepRootDirectory() stringByAppendingPathComponent:@"usr/lib/libAccessibility.dylib"];
    v4 = dlopen([(NSString *)v3 UTF8String], 1);
    if (v4)
    {
      v2 = dlsym(v4, "_AXSVisualAlertEnabled");
      start_visualAlertEnabled = v2;
      if (!v2) {
        goto LABEL_18;
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v24 = 136315906;
          uint64_t v25 = v5;
          __int16 v26 = 2080;
          v27 = "+[VCVisualAlert start]";
          __int16 v28 = 1024;
          int v29 = 30;
          __int16 v30 = 2080;
          uint64_t v31 = [(NSString *)v3 UTF8String];
          _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Cannot open libAccessibility.dylib (%s)", (uint8_t *)&v24, 0x26u);
        }
      }
      v2 = start_visualAlertEnabled;
      if (!start_visualAlertEnabled)
      {
LABEL_18:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          uint64_t v17 = VRTraceErrorLogLevelToCSTR();
          v15 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v24 = 136315650;
            uint64_t v25 = v17;
            __int16 v26 = 2080;
            v27 = "+[VCVisualAlert start]";
            __int16 v28 = 1024;
            int v29 = 56;
            v16 = " [%s] %s:%d VisualAlert not enabled or failed to load.";
            goto LABEL_21;
          }
        }
        return;
      }
    }
  }
  if (!((unsigned int (*)(void))v2)()) {
    goto LABEL_18;
  }
  v7 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
  if ([(NSArray *)v7 count])
  {
    uint64_t v8 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 0), "stringByAppendingPathComponent:", @"PrivateFrameworks/VisualAlert.framework");
    v9 = (void *)[MEMORY[0x1E4F28B50] bundleWithPath:v8];
    if (([v9 isLoaded] & 1) == 0)
    {
      int v18 = [v9 load];
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (v18)
      {
        if (ErrorLogLevelForModule < 7) {
          goto LABEL_12;
        }
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        int v24 = 136315650;
        uint64_t v25 = v20;
        __int16 v26 = 2080;
        v27 = "+[VCVisualAlert start]";
        __int16 v28 = 1024;
        int v29 = 43;
        v22 = " [%s] %s:%d VisualAlert framework bundle loaded.";
      }
      else
      {
        if (ErrorLogLevelForModule < 5) {
          goto LABEL_12;
        }
        uint64_t v23 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        int v24 = 136315650;
        uint64_t v25 = v23;
        __int16 v26 = 2080;
        v27 = "+[VCVisualAlert start]";
        __int16 v28 = 1024;
        int v29 = 45;
        v22 = " [%s] %s:%d Failed to load VisualAlert framework bundle.";
      }
      _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v24, 0x1Cu);
    }
  }
LABEL_12:
  v10 = (void *)[NSClassFromString(&cfstr_Axvisualalertm.isa) sharedVisualAlertManager];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 136315906;
      uint64_t v25 = v11;
      __int16 v26 = 2080;
      v27 = "+[VCVisualAlert start]";
      __int16 v28 = 1024;
      int v29 = 50;
      __int16 v30 = 2112;
      uint64_t v31 = (uint64_t)v10;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d visualAlertManager=%@", (uint8_t *)&v24, 0x26u);
    }
  }
  v13 = objc_alloc_init(VCCameraTorchManager);
  [v10 startForAlertTypes:2 cameraTorchManager:v13];

  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 136315650;
      uint64_t v25 = v14;
      __int16 v26 = 2080;
      v27 = "+[VCVisualAlert start]";
      __int16 v28 = 1024;
      int v29 = 54;
      v16 = " [%s] %s:%d Started AXVisualAlertManager";
LABEL_21:
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v24, 0x1Cu);
    }
  }
}

+ (void)stop
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)-[objc_class sharedVisualAlertManager](NSClassFromString(&cfstr_Axvisualalertm.isa), "sharedVisualAlertManager"), "stop");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315650;
      uint64_t v5 = v2;
      __int16 v6 = 2080;
      v7 = "+[VCVisualAlert stop]";
      __int16 v8 = 1024;
      int v9 = 67;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Stopped AXVisualAlertManager", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

@end