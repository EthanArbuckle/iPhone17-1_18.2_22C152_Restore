@interface VCAnsweringMachineManager
+ (id)sharedInstance;
+ (void)registerAnsweringMachineInitialize;
+ (void)registerAnsweringMachineStart;
+ (void)registerAnsweringMachineStop;
+ (void)registerAnsweringMachineTerminate;
+ (void)registerBlocksForService;
- (VCAnsweringMachineManager)init;
- (void)answeringMachine:(id)a3 didFinishAnnouncement:(BOOL)a4 error:(id)a5;
- (void)answeringMachine:(id)a3 didStart:(BOOL)a4 error:(id)a5;
- (void)answeringMachine:(id)a3 didStop:(BOOL)a4 recordingURL:(id)a5 error:(id)a6;
- (void)dealloc;
- (void)init;
@end

@implementation VCAnsweringMachineManager

- (VCAnsweringMachineManager)init
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)VCAnsweringMachineManager;
  v2 = [(VCXPCManager *)&v9 init];
  if (!v2)
  {
    if (objc_opt_class())
    {
      if (objc_opt_respondsToSelector()) {
        [0 performSelector:sel_logPrefix];
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAnsweringMachineManager init]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAnsweringMachineManager init]();
      }
    }
    goto LABEL_24;
  }
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v2->_instances = v3;
  if (!v3)
  {
    if ((VCAnsweringMachineManager *)objc_opt_class() == v2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAnsweringMachineManager init]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v6 = (__CFString *)[(VCAnsweringMachineManager *)v2 performSelector:sel_logPrefix];
      }
      else {
        v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v11 = v7;
          __int16 v12 = 2080;
          v13 = "-[VCAnsweringMachineManager init]";
          __int16 v14 = 1024;
          int v15 = 33;
          __int16 v16 = 2112;
          v17 = v6;
          __int16 v18 = 2048;
          v19 = v2;
          _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to init the instances array", buf, 0x30u);
        }
      }
    }
LABEL_24:

    return 0;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
  v2->_callbackQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCAnsweringMachineManager.callbackQueue", MEMORY[0x1E4F14430], CustomRootQueue);
  return v2;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];

  callbackQueue = self->_callbackQueue;
  if (callbackQueue) {
    dispatch_release(callbackQueue);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCAnsweringMachineManager;
  [(VCXPCManager *)&v4 dealloc];
}

+ (id)sharedInstance
{
  if (sharedInstance_token_1 != -1) {
    dispatch_once(&sharedInstance_token_1, &__block_literal_global_15);
  }
  return (id)sharedInstance_instance;
}

void __43__VCAnsweringMachineManager_sharedInstance__block_invoke()
{
  if (!sharedInstance_instance) {
    sharedInstance_instance = objc_alloc_init(VCAnsweringMachineManager);
  }
}

+ (void)registerAnsweringMachineInitialize
{
}

id __63__VCAnsweringMachineManager_registerAnsweringMachineInitialize__block_invoke(uint64_t a1, uint64_t *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  objc_super v4 = -[AVCAnsweringMachineConfiguration initWithClientDictionary:clientPid:]([AVCAnsweringMachineConfiguration alloc], "initWithClientDictionary:clientPid:", [a3 objectForKeyedSubscript:@"vcAnsweringMachineConfig"], objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"CLIENTPID"), "intValue"));
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __63__VCAnsweringMachineManager_registerAnsweringMachineInitialize__block_invoke_cold_1();
      }
    }
    return 0;
  }
  uint64_t v5 = v4;
  v6 = [[VCAnsweringMachine alloc] initWithConfiguration:v4 delegate:v3 delegateQueue:*(void *)(v3 + 192)];

  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __63__VCAnsweringMachineManager_registerAnsweringMachineInitialize__block_invoke_cold_2();
      }
    }
    return 0;
  }
  [*(id *)(v3 + 184) addObject:v6];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v14 = v7;
      __int16 v15 = 2080;
      __int16 v16 = "+[VCAnsweringMachineManager registerAnsweringMachineInitialize]_block_invoke";
      __int16 v17 = 1024;
      int v18 = 85;
      __int16 v19 = 2112;
      uint64_t v20 = v6;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCAnsweringMachineManager allocated new VCAnsweringMachine=%@", buf, 0x26u);
    }
  }
  v12[1] = objc_msgSend(NSNumber, "numberWithInteger:", -[VCAnsweringMachine messageAudioToken](v6, "messageAudioToken", @"CONTEXT", @"vcAnsweringMachineMessageAudioToken", v6));
  id v9 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:2];

  return v9;
}

+ (void)registerAnsweringMachineTerminate
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = objc_opt_class();
  objc_msgSend(a1, "registerTerminateBlock:forService:expectedClasses:", &__block_literal_global_31, "vcAnsweringMachineTerminate", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v3, 1));
}

uint64_t __62__VCAnsweringMachineManager_registerAnsweringMachineTerminate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)a2[1];
  [v3 invalidate];
  objc_super v4 = *(void **)(*a2 + 184);

  return [v4 removeObject:v3];
}

+ (void)registerAnsweringMachineStart
{
}

uint64_t __58__VCAnsweringMachineManager_registerAnsweringMachineStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

+ (void)registerAnsweringMachineStop
{
}

uint64_t __57__VCAnsweringMachineManager_registerAnsweringMachineStop__block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

+ (void)registerBlocksForService
{
  [a1 registerAnsweringMachineInitialize];
  [a1 registerAnsweringMachineTerminate];
  [a1 registerAnsweringMachineStart];

  [a1 registerAnsweringMachineStop];
}

- (void)answeringMachine:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  id v8 = objc_alloc(MEMORY[0x1E4F1CA60]);
  id v9 = (id)objc_msgSend(v8, "initWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithBool:", v6), @"vcAnsweringMachineStatus", 0);
  +[VCXPCManager addNSError:a5 toXPCArgumentDictionary:v9];
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcAnsweringMachineDidStart", v9, a3);
}

- (void)answeringMachine:(id)a3 didStop:(BOOL)a4 recordingURL:(id)a5 error:(id)a6
{
  BOOL v8 = a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  id v11 = objc_alloc(MEMORY[0x1E4F1CA60]);
  __int16 v12 = objc_msgSend(v11, "initWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithBool:", v8), @"vcAnsweringMachineStatus", 0);
  if (!a5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      __int16 v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v24 = v15;
        __int16 v25 = 2080;
        v26 = "-[VCAnsweringMachineManager answeringMachine:didStop:recordingURL:error:]";
        __int16 v27 = 1024;
        int v28 = 157;
        _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping sandbox logic as there is no recordingURL", buf, 0x1Cu);
      }
    }
    goto LABEL_22;
  }
  objc_msgSend((id)objc_msgSend(a5, "path"), "fileSystemRepresentation");
  uint64_t v13 = sandbox_extension_issue_file();
  if (!v13)
  {
    if ((VCAnsweringMachineManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAnsweringMachineManager answeringMachine:didStop:recordingURL:error:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v17 = (__CFString *)[(VCAnsweringMachineManager *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v17 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        __int16 v19 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v24 = v18;
          __int16 v25 = 2080;
          v26 = "-[VCAnsweringMachineManager answeringMachine:didStop:recordingURL:error:]";
          __int16 v27 = 1024;
          int v28 = 161;
          __int16 v29 = 2112;
          id v30 = v17;
          __int16 v31 = 2048;
          v32 = self;
          __int16 v33 = 2112;
          id v34 = a5;
          _os_log_error_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to issue sandbox extension for url=%@, removing url", buf, 0x3Au);
        }
      }
    }
    v22 = 0;
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtURL:error:", a5, &v22) & 1) == 0
      && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      uint64_t v21 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v24 = v20;
        __int16 v25 = 2080;
        v26 = "-[VCAnsweringMachineManager answeringMachine:didStop:recordingURL:error:]";
        __int16 v27 = 1024;
        int v28 = 171;
        __int16 v29 = 2112;
        id v30 = a5;
        __int16 v31 = 2112;
        v32 = v22;
        _os_log_error_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to remove recordingURL=%@: error=%@", buf, 0x30u);
      }
    }
LABEL_22:
    uint64_t v14 = 0;
    goto LABEL_4;
  }
  uint64_t v14 = (void *)v13;
  [v12 setObject:a5 forKeyedSubscript:@"vcAnsweringMachineMessageRecordingURL"];
  objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(NSString, "stringWithUTF8String:", v14), @"vcAnsweringMachineMessageRecordingURLSandboxExtensionToken");
LABEL_4:
  free(v14);
  +[VCXPCManager addNSError:a6 toXPCArgumentDictionary:v12];
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcAnsweringMachineDidStop", v12, a3);
}

- (void)answeringMachine:(id)a3 didFinishAnnouncement:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  id v8 = objc_alloc(MEMORY[0x1E4F1CA60]);
  id v9 = (id)objc_msgSend(v8, "initWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithBool:", v6), @"vcAnsweringMachineStatus", 0);
  +[VCXPCManager addNSError:a5 toXPCArgumentDictionary:v9];
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcAnsweringMachineDidFinishAnnouncement", v9, a3);
}

- (void)init
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to init the instances array", v2, v3, v4, v5, v6);
}

void __63__VCAnsweringMachineManager_registerAnsweringMachineInitialize__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initialize answering machine configuration", v2, v3, v4, v5, v6);
}

void __63__VCAnsweringMachineManager_registerAnsweringMachineInitialize__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initialize answering machine", v2, v3, v4, v5, v6);
}

- (void)answeringMachine:didStop:recordingURL:error:.cold.1()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  uint64_t v5 = "-[VCAnsweringMachineManager answeringMachine:didStop:recordingURL:error:]";
  __int16 v6 = 1024;
  int v7 = 161;
  __int16 v8 = 2112;
  uint64_t v9 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to issue sandbox extension for url=%@, removing url", v3, 0x26u);
}

@end