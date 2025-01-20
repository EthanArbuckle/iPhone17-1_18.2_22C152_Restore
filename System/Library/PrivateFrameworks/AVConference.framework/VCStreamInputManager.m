@interface VCStreamInputManager
+ (id)sharedInstance;
- (BOOL)clientProcessDiedWithXPCArguments:(id)a3 result:(id *)a4 error:(id *)a5;
- (BOOL)getServerPidWithXPCArguments:(id)a3 result:(id *)a4 error:(id *)a5;
- (BOOL)initializeStreamInputWithXPCArguments:(id)a3 result:(id *)a4 error:(id *)a5;
- (BOOL)pushSampleBufferWithXPCArguments:(id)a3 result:(id *)a4 error:(id *)a5;
- (BOOL)terminateStreamInputWithXPCArguments:(id)a3 result:(id *)a4 error:(id *)a5;
- (VCStreamInputManager)allocWithZone:(_NSZone *)a3;
- (VCStreamInputManager)init;
- (id)newStreamInputID;
- (id)streamInputWithID:(int64_t)a3;
- (unint64_t)retainCount;
- (void)dealloc;
- (void)deregisterBlocksForService;
- (void)didResumeStreamInput:(id)a3;
- (void)didStartStreamInput:(id)a3;
- (void)didStopStreamInput:(id)a3;
- (void)didSuspendStreamInput:(id)a3;
- (void)init;
- (void)registerBlocksForService;
- (void)registerDidClientDieBlock:(id)a3;
- (void)registerService:(char *)a3 weakSelf:(id)a4 block:(id)a5;
- (void)registerService:(char *)a3 weakSelf:(id)a4 eventLogLevel:(int)a5 block:(id)a6;
@end

@implementation VCStreamInputManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7 != -1) {
    dispatch_once(&sharedInstance_onceToken_7, &__block_literal_global_40);
  }
  return (id)_vcStreamInputManager;
}

VCStreamInputManager *__38__VCStreamInputManager_sharedInstance__block_invoke()
{
  result = objc_alloc_init(VCStreamInputManager);
  _vcStreamInputManager = (uint64_t)result;
  return result;
}

- (VCStreamInputManager)init
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)VCStreamInputManager;
  v2 = [(VCObject *)&v15 init];
  if (!v2)
  {
LABEL_14:

    return 0;
  }
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = (const char *)[(id)objc_msgSend(v3 stringWithFormat:@"%@.%@.connectionQueue", @"com.apple.VideoConference", NSStringFromClass(v4)), "UTF8String"];
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
  dispatch_queue_t v7 = dispatch_queue_create_with_target_V2(v5, 0, CustomRootQueue);
  v2->_xpcQueue = (OS_dispatch_queue *)v7;
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCStreamInputManager init]();
      }
    }
    goto LABEL_14;
  }
  v8 = NSString;
  v9 = (objc_class *)objc_opt_class();
  v10 = (const char *)[(id)objc_msgSend(v8 stringWithFormat:@"%@.%@.streamInputQueue", @"com.apple.VideoConference", NSStringFromClass(v9)), "UTF8String"];
  v11 = VCDispatchQueue_GetCustomRootQueue(37);
  dispatch_queue_t v12 = dispatch_queue_create_with_target_V2(v10, 0, v11);
  v2->_streamInputQueue = (OS_dispatch_queue *)v12;
  if (!v12)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCStreamInputManager init]();
      }
    }
    goto LABEL_14;
  }
  v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v2->_streamInputs = v13;
  if (!v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCStreamInputManager init]();
      }
    }
    goto LABEL_14;
  }
  return v2;
}

- (VCStreamInputManager)allocWithZone:(_NSZone *)a3
{
  return (VCStreamInputManager *)_vcStreamInputManager;
}

- (unint64_t)retainCount
{
  return -1;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCStreamInputManager *)self deregisterBlocksForService];
  dispatch_release((dispatch_object_t)self->_xpcQueue);
  dispatch_release((dispatch_object_t)self->_streamInputQueue);

  v3.receiver = self;
  v3.super_class = (Class)VCStreamInputManager;
  [(VCObject *)&v3 dealloc];
}

- (id)newStreamInputID
{
  objc_super v3 = 0;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  do
  {
    do
    {

      objc_super v3 = (void *)[objc_alloc(NSNumber) initWithInt:arc4random_uniform(0x7FFFFFFFu)];
    }
    while (![v3 integerValue]);
  }
  while ([(NSMutableDictionary *)self->_streamInputs objectForKeyedSubscript:v3]);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      uint64_t v8 = v4;
      __int16 v9 = 2080;
      v10 = "-[VCStreamInputManager newStreamInputID]";
      __int16 v11 = 1024;
      int v12 = 118;
      __int16 v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamInputID=%@", (uint8_t *)&v7, 0x26u);
    }
  }
  return v3;
}

- (BOOL)initializeStreamInputWithXPCArguments:(id)a3 result:(id *)a4 error:(id *)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = (id)[a3 objectForKeyedSubscript:@"VCStreamInputID"];
  [(VCObject *)self lock];
  *a4 = 0;
  v10 = (void *)[a3 objectForKeyedSubscript:@"USERXPCARGUMENTS"];
  __int16 v11 = VCStreamInputUtil_DecodeFormatDescription(v10);
  if (!v11)
  {
    uint64_t v17 = -2143682558;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCStreamInputManager initializeStreamInputWithXPCArguments:result:error:]();
      }
      uint64_t v16 = 0;
      goto LABEL_23;
    }
LABEL_36:
    uint64_t v16 = 0;
    goto LABEL_23;
  }
  xpc_object_t value = xpc_dictionary_get_value(v10, "VCStreamInputRemoteQueue");
  if (!v9) {
    id v9 = [(VCStreamInputManager *)self newStreamInputID];
  }
  if ([(NSMutableDictionary *)self->_streamInputs objectForKeyedSubscript:v9])
  {
    uint64_t v17 = -2143682519;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        -[VCStreamInputManager initializeStreamInputWithXPCArguments:result:error:].cold.4();
        uint64_t v16 = 0;
        uint64_t v17 = -2143682519;
      }
      else
      {
        uint64_t v16 = 0;
      }
      goto LABEL_23;
    }
    goto LABEL_36;
  }
  v35 = a5;
  CMMediaType MediaType = CMFormatDescriptionGetMediaType(v11);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    uint64_t v15 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v37 = v14;
      __int16 v38 = 2080;
      v39 = "-[VCStreamInputManager initializeStreamInputWithXPCArguments:result:error:]";
      __int16 v40 = 1024;
      int v41 = 147;
      __int16 v42 = 2112;
      uint64_t v43 = AVCStreamInputID_ConvertToNSString([v9 integerValue]);
      __int16 v44 = 2080;
      v45 = FourccToCStr(MediaType);
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamInputID=%@ mediaType=%s", buf, 0x30u);
    }
  }
  if (MediaType != 1986618469)
  {
    if (MediaType == 1936684398)
    {
      uint64_t v16 = [[VCStreamInputAudio alloc] initWithStreamInputID:v9 format:v11 delegate:self delegateQueue:self->_streamInputQueue remoteQueue:value];
      if (!v16)
      {
        uint64_t v17 = -2143682558;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v34 = VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCStreamInputManager initializeStreamInputWithXPCArguments:result:error:](v34, v9);
          }
        }
        goto LABEL_21;
      }
LABEL_16:
      uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v16, @"CONTEXT", v9, @"VCStreamInputID", 0);
      if (v19)
      {
        v20 = (void *)v19;
        uint64_t v21 = [(VCStreamInput *)v16 isStarted];
        objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v21), @"VCStreamInputDidStart");
        [(NSMutableDictionary *)self->_streamInputs setObject:v16 forKeyedSubscript:v9];
        *a4 = v20;
        [(VCObject *)self unlock];
        BOOL v22 = 1;
        goto LABEL_26;
      }
      uint64_t v17 = -2143682558;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v29 = VRTraceErrorLogLevelToCSTR();
        v30 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          v31 = v11;
          uint64_t v32 = AVCStreamInputID_ConvertToNSString([v9 integerValue]);
          v33 = FourccToCStr(MediaType);
          *(_DWORD *)buf = 136316162;
          uint64_t v37 = v29;
          __int16 v38 = 2080;
          v39 = "-[VCStreamInputManager initializeStreamInputWithXPCArguments:result:error:]";
          __int16 v40 = 1024;
          int v41 = 161;
          __int16 v42 = 2112;
          uint64_t v43 = v32;
          __int16 v11 = v31;
          __int16 v44 = 2080;
          v45 = v33;
          _os_log_error_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate the return dictionary for streamInputID=%@ mediaType=%s", buf, 0x30u);
        }
      }
      goto LABEL_22;
    }
    if (MediaType != 1835365473)
    {
      uint64_t v17 = -2143682558;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v23 = VRTraceErrorLogLevelToCSTR();
        v24 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          v26 = v11;
          uint64_t v27 = AVCStreamInputID_ConvertToNSString([v9 integerValue]);
          v28 = FourccToCStr(MediaType);
          *(_DWORD *)buf = 136316162;
          uint64_t v37 = v23;
          __int16 v38 = 2080;
          v39 = "-[VCStreamInputManager initializeStreamInputWithXPCArguments:result:error:]";
          __int16 v40 = 1024;
          int v41 = 157;
          __int16 v42 = 2112;
          uint64_t v43 = v27;
          __int16 v11 = v26;
          __int16 v44 = 2080;
          v45 = v28;
          _os_log_error_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unsupported streamInputID=%@ mediaType=%s", buf, 0x30u);
        }
      }
      goto LABEL_21;
    }
  }
  uint64_t v16 = [[VCStreamInputVideo alloc] initWithStreamInputID:v9 format:v11 delegate:self delegateQueue:self->_streamInputQueue remoteQueue:value];
  if (v16) {
    goto LABEL_16;
  }
  uint64_t v17 = -2143682558;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCStreamInputManager initializeStreamInputWithXPCArguments:result:error:](v18, v9);
    }
  }
LABEL_21:
  uint64_t v16 = 0;
LABEL_22:
  a5 = v35;
LABEL_23:
  [(VCObject *)self unlock];
  if (a5) {
    *a5 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"VCStreamInputManager" code:v17 userInfo:0];
  }
  [(VCStreamInput *)v16 invalidate];
  BOOL v22 = 0;
LABEL_26:

  if (v11) {
    CFRelease(v11);
  }
  return v22;
}

- (BOOL)getServerPidWithXPCArguments:(id)a3 result:(id *)a4 error:(id *)a5
{
  *a4 = 0;
  if (+[VCDefaults BOOLeanValueForKey:@"enableFigRemoteQueueForAVCStreamInputOutput" defaultValue:1])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (v7)
    {
      uint64_t v8 = [objc_alloc(NSNumber) initWithUnsignedInt:getpid()];
      if (v8)
      {
        id v9 = (void *)v8;
        [v7 setObject:v8 forKeyedSubscript:@"VCStreamInputServerPID"];
        *a4 = v7;
        BOOL v10 = 1;
        id v7 = 0;
        goto LABEL_5;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          -[VCStreamInputManager getServerPidWithXPCArguments:result:error:]();
          if (a5) {
            goto LABEL_17;
          }
          goto LABEL_19;
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        -[VCStreamInputManager getServerPidWithXPCArguments:result:error:]();
        if (a5)
        {
LABEL_17:
          BOOL v10 = 0;
          id v9 = 0;
          *a5 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"VCStreamInputManager" code:-2143682558 userInfo:0];
          goto LABEL_5;
        }
LABEL_19:
        BOOL v10 = 0;
        id v9 = 0;
        goto LABEL_5;
      }
    }
    if (a5) {
      goto LABEL_17;
    }
    goto LABEL_19;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCStreamInputManager getServerPidWithXPCArguments:result:error:]();
    }
  }
  id v7 = 0;
  id v9 = 0;
  BOOL v10 = 1;
LABEL_5:

  return v10;
}

- (BOOL)terminateStreamInputWithXPCArguments:(id)a3 result:(id *)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  *a4 = 0;
  uint64_t v8 = [a3 objectForKeyedSubscript:@"CONTEXT"];
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_18;
    }
    VRTraceErrorLogLevelToCSTR();
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    -[VCStreamInputManager terminateStreamInputWithXPCArguments:result:error:]();
    if (!a5) {
      return 0;
    }
LABEL_19:
    uint64_t v16 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"VCStreamInputManager" code:-2143682559 userInfo:0];
    BOOL result = 0;
    *a5 = v16;
    return result;
  }
  id v9 = (void *)v8;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if ((isKindOfClass & 1) == 0)
  {
    if (ErrorLogLevelForModule < 3) {
      goto LABEL_18;
    }
    VRTraceErrorLogLevelToCSTR();
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    -[VCStreamInputManager terminateStreamInputWithXPCArguments:result:error:]();
    if (!a5) {
      return 0;
    }
    goto LABEL_19;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    __int16 v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v18 = v12;
      __int16 v19 = 2080;
      v20 = "-[VCStreamInputManager terminateStreamInputWithXPCArguments:result:error:]";
      __int16 v21 = 1024;
      int v22 = 223;
      __int16 v23 = 2112;
      uint64_t v24 = AVCStreamInputID_ConvertToNSString(objc_msgSend((id)objc_msgSend(v9, "streamInputID"), "integerValue"));
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Terminate streamInputID=%@", buf, 0x26u);
    }
  }
  [v9 invalidate];
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_streamInputs, "objectForKeyedSubscript:", [v9 streamInputID]))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_streamInputs, "setObject:forKeyedSubscript:", 0, [v9 streamInputID]);
    id v14 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    *a4 = (id)objc_msgSend(v14, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"CONTEXT", 0);
    return 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      -[VCStreamInputManager terminateStreamInputWithXPCArguments:result:error:]();
      if (a5) {
        goto LABEL_19;
      }
      return 0;
    }
  }
LABEL_18:
  if (a5) {
    goto LABEL_19;
  }
  return 0;
}

- (BOOL)clientProcessDiedWithXPCArguments:(id)a3 result:(id *)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  *a4 = 0;
  id v9 = (void *)[a3 objectForKeyedSubscript:@"CONTEXT"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 1;
  }
  uint64_t v10 = [a3 objectForKeyedSubscript:@"CLIENTPID"];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (!v10)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCStreamInputManager clientProcessDiedWithXPCArguments:result:error:]();
      }
    }
    return 1;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    __int16 v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136316162;
      uint64_t v16 = v12;
      __int16 v17 = 2080;
      uint64_t v18 = "-[VCStreamInputManager clientProcessDiedWithXPCArguments:result:error:]";
      __int16 v19 = 1024;
      int v20 = 249;
      __int16 v21 = 2112;
      uint64_t v22 = v10;
      __int16 v23 = 2112;
      uint64_t v24 = AVCStreamInputID_ConvertToNSString(objc_msgSend((id)objc_msgSend(v9, "streamInputID"), "integerValue"));
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Client process with pid=%@ died. Cleaning up streamInputID=%@", (uint8_t *)&v15, 0x30u);
    }
  }
  return [(VCStreamInputManager *)self terminateStreamInputWithXPCArguments:a3 result:a4 error:a5];
}

- (BOOL)pushSampleBufferWithXPCArguments:(id)a3 result:(id *)a4 error:(id *)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v6 = VCStreamInputUtil_DecodeSampleBuffer(objc_msgSend(a3, "objectForKeyedSubscript:", @"USERXPCARGUMENTS", a4, a5));
  if (v6)
  {
    uint64_t v7 = [a3 objectForKeyedSubscript:@"CONTEXT"];
    if (v7)
    {
      uint64_t v8 = (void (**)(void, void))v7;
      memset(&v10, 170, sizeof(v10));
      CMSampleBufferGetPresentationTimeStamp(&v10, v6);
      objc_msgSend((id)objc_msgSend(v8, "streamInputID"), "unsignedIntValue");
      CMTime time = v10;
      CMTimeGetSeconds(&time);
      kdebug_trace();
      ((void (**)(void, opaqueCMSampleBuffer *))v8)[22](v8, v6);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCStreamInputManager pushSampleBufferWithXPCArguments:result:error:]();
      }
    }
    CFRelease(v6);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCStreamInputManager pushSampleBufferWithXPCArguments:result:error:]();
    }
  }
  return v6 != 0;
}

- (void)registerService:(char *)a3 weakSelf:(id)a4 block:(id)a5
{
}

- (void)registerService:(char *)a3 weakSelf:(id)a4 eventLogLevel:(int)a5 block:(id)a6
{
  v6[6] = *MEMORY[0x1E4F143B8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__VCStreamInputManager_registerService_weakSelf_eventLogLevel_block___block_invoke;
  v6[3] = &unk_1E6DB5400;
  v6[4] = a4;
  v6[5] = a6;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:eventLogLevel:", a3, v6, self->_xpcQueue, *(void *)&a5);
}

uint64_t __69__VCStreamInputManager_registerService_weakSelf_eventLogLevel_block___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t result = [*(id *)(a1 + 32) strong];
  if (result)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    return 0;
  }
  return result;
}

- (void)registerDidClientDieBlock:(id)a3
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton", MEMORY[0x1E4F143A8], 3221225472, __50__VCStreamInputManager_registerDidClientDieBlock___block_invoke, &unk_1E6DB5478, a3, *MEMORY[0x1E4F143B8]), "registerBlockForService:block:queue:", "VCStreamInputDidClientDie", &v3, self->_xpcQueue);
}

uint64_t __50__VCStreamInputManager_registerDidClientDieBlock___block_invoke(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    v7[0] = 0;
    uint64_t v4 = (void *)[*(id *)(a1 + 32) strong];
    if (v4)
    {
      [v4 clientProcessDiedWithXPCArguments:a2 result:v7 error:0];
      v5 = (void *)v7[0];
    }
    else
    {
      v5 = 0;
    }
  }
  return 0;
}

- (void)registerBlocksForService
{
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  [(VCStreamInputManager *)self registerService:"VCStreamInputInitialize" weakSelf:v3 block:&__block_literal_global_56];
  [(VCStreamInputManager *)self registerService:"VCStreamInputGetServerPid" weakSelf:v3 block:&__block_literal_global_59];
  [(VCStreamInputManager *)self registerService:"VCStreamInputTerminate" weakSelf:v3 block:&__block_literal_global_62];
  [(VCStreamInputManager *)self registerService:"VCStreamInputPushSampleBuffer" weakSelf:v3 eventLogLevel:8 block:&__block_literal_global_65_0];

  [(VCStreamInputManager *)self registerDidClientDieBlock:v3];
}

uint64_t __48__VCStreamInputManager_registerBlocksForService__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "initializeStreamInputWithXPCArguments:result:error:");
}

uint64_t __48__VCStreamInputManager_registerBlocksForService__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "getServerPidWithXPCArguments:result:error:");
}

uint64_t __48__VCStreamInputManager_registerBlocksForService__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "terminateStreamInputWithXPCArguments:result:error:");
}

uint64_t __48__VCStreamInputManager_registerBlocksForService__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pushSampleBufferWithXPCArguments:result:error:");
}

- (void)deregisterBlocksForService
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v2 deregisterFromService:"VCStreamInputInitialize"];
}

- (id)streamInputWithID:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  CMTime v10 = __Block_byref_object_copy__12;
  xpcQueue = self->_xpcQueue;
  __int16 v11 = __Block_byref_object_dispose__12;
  uint64_t v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__VCStreamInputManager_streamInputWithID___block_invoke;
  v6[3] = &unk_1E6DB3F80;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = a3;
  dispatch_sync(xpcQueue, v6);
  uint64_t v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __42__VCStreamInputManager_streamInputWithID___block_invoke(void *a1)
{
  id result = (id)objc_msgSend(*(id *)(a1[4] + 184), "objectForKey:", objc_msgSend(NSNumber, "numberWithInteger:", a1[6]));
  *(void *)(*(void *)(a1[5] + 8) + 40) = result;
  return result;
}

- (void)didStartStreamInput:(id)a3
{
  v4[5] = *MEMORY[0x1E4F143B8];
  xpcQueue = self->_xpcQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__VCStreamInputManager_didStartStreamInput___block_invoke;
  v4[3] = &unk_1E6DB3DC8;
  v4[4] = a3;
  dispatch_async(xpcQueue, v4);
}

uint64_t __44__VCStreamInputManager_didStartStreamInput___block_invoke(uint64_t a1)
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 sendMessageAsync:"VCStreamInputDidStart" arguments:0 context:v3];
}

- (void)didStopStreamInput:(id)a3
{
  v4[5] = *MEMORY[0x1E4F143B8];
  xpcQueue = self->_xpcQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__VCStreamInputManager_didStopStreamInput___block_invoke;
  v4[3] = &unk_1E6DB3DC8;
  v4[4] = a3;
  dispatch_async(xpcQueue, v4);
}

uint64_t __43__VCStreamInputManager_didStopStreamInput___block_invoke(uint64_t a1)
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 sendMessageAsync:"VCStreamInputDidStop" arguments:0 context:v3];
}

- (void)didSuspendStreamInput:(id)a3
{
  v4[5] = *MEMORY[0x1E4F143B8];
  xpcQueue = self->_xpcQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__VCStreamInputManager_didSuspendStreamInput___block_invoke;
  v4[3] = &unk_1E6DB3DC8;
  v4[4] = a3;
  dispatch_async(xpcQueue, v4);
}

uint64_t __46__VCStreamInputManager_didSuspendStreamInput___block_invoke(uint64_t a1)
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 sendMessageAsync:"VCStreamInputDidSuspend" arguments:0 context:v3];
}

- (void)didResumeStreamInput:(id)a3
{
  v4[5] = *MEMORY[0x1E4F143B8];
  xpcQueue = self->_xpcQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__VCStreamInputManager_didResumeStreamInput___block_invoke;
  v4[3] = &unk_1E6DB3DC8;
  v4[4] = a3;
  dispatch_async(xpcQueue, v4);
}

uint64_t __45__VCStreamInputManager_didResumeStreamInput___block_invoke(uint64_t a1)
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 sendMessageAsync:"VCStreamInputDidResume" arguments:0 context:v3];
}

- (void)init
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate stream inputs dictionary", v2, v3, v4, v5, v6);
}

- (void)initializeStreamInputWithXPCArguments:result:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create format description from XPC arguments", v2, v3, v4, v5, v6);
}

- (void)initializeStreamInputWithXPCArguments:(uint64_t)a1 result:(void *)a2 error:.cold.2(uint64_t a1, void *a2)
{
  AVCStreamInputID_ConvertToNSString([a2 integerValue]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, " [%s] %s:%d Failed to create the video stream input for streamInputID=%@", v4, v5, v6, v7, v8);
}

- (void)initializeStreamInputWithXPCArguments:(uint64_t)a1 result:(void *)a2 error:.cold.3(uint64_t a1, void *a2)
{
  AVCStreamInputID_ConvertToNSString([a2 integerValue]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, " [%s] %s:%d Failed to create the audio stream input for streamInputID=%@", v4, v5, v6, v7, v8);
}

- (void)initializeStreamInputWithXPCArguments:result:error:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Stream input ID %@ already exists!");
}

- (void)getServerPidWithXPCArguments:result:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the result dictionary", v2, v3, v4, v5, v6);
}

- (void)getServerPidWithXPCArguments:result:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate NSNumber for pid", v2, v3, v4, v5, v6);
}

- (void)getServerPidWithXPCArguments:result:error:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d kVCDefaultEnableFigRemoteQueueForAVCStreamInputOutput disabled", v2, v3, v4, v5, v6);
}

- (void)terminateStreamInputWithXPCArguments:result:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Terminate request received with nil context", v2, v3, v4, v5, v6);
}

- (void)terminateStreamInputWithXPCArguments:result:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Terminate request received with invalid context", v2, v3, v4, v5, v6);
}

- (void)terminateStreamInputWithXPCArguments:result:error:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Terminate request received with invalid context", v2, v3, v4, v5, v6);
}

- (void)clientProcessDiedWithXPCArguments:result:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Client process ID argument is missing", v2, v3, v4, v5, v6);
}

- (void)pushSampleBufferWithXPCArguments:result:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d nil VCInputStream", v2, v3, v4, v5, v6);
}

- (void)pushSampleBufferWithXPCArguments:result:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d received NULL CMSampleBuffer", v2, v3, v4, v5, v6);
}

@end