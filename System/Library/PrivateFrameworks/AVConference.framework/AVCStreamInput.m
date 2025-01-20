@interface AVCStreamInput
- (AVCStreamInput)initWithDelegate:(id)a3 delegateQueue:(id)a4 format:(opaqueCMFormatDescription *)a5 options:(id)a6 error:(id *)a7;
- (BOOL)pushSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4;
- (BOOL)sendSampleBufferOverXPC:(opaqueCMSampleBuffer *)a3 error:(id *)a4;
- (OS_dispatch_queue)xpcQueue;
- (__CFAllocator)sampleBufferAllocator;
- (id)delegate;
- (id)description;
- (id)formatDescriptionString;
- (id)newRemoteQueueWithServerPid:(int)a3;
- (int)createAndAddRemoteQueueToXPCDictionary:(id)a3;
- (int)initializeServerSideInputStream;
- (int)processFormat:(opaqueCMFormatDescription *)a3;
- (int)processOptions:(id)a3;
- (int)resetXPCConnection;
- (int)setupDelegate:(id)a3 delegateQueue:(id)a4;
- (int)setupXPCConnection;
- (int)setupXPCQueue;
- (int64_t)streamInputID;
- (opaqueCMFormatDescription)formatDescription;
- (void)dealloc;
- (void)deregisterBlocksForNotifications;
- (void)didResume;
- (void)didServerDie;
- (void)didStart;
- (void)didStop;
- (void)didSuspend;
- (void)initializeServerSideInputStream;
- (void)registerBlocksForNotification;
- (void)registerDidServerDieBlock:(id)a3;
- (void)registerService:(char *)a3 weakSelf:(id)a4 block:(id)a5;
- (void)resetStats;
- (void)senderQueueLock;
- (void)senderQueueUnlock;
- (void)setupXPCConnection;
- (void)setupXPCQueue;
- (void)tearDownConnectionWithTerminateMessage:(BOOL)a3;
- (void)tearDownRemoteQueue;
@end

@implementation AVCStreamInput

- (AVCStreamInput)initWithDelegate:(id)a3 delegateQueue:(id)a4 format:(opaqueCMFormatDescription *)a5 options:(id)a6 error:(id *)a7
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  int v39 = -2143617020;
  v35.receiver = self;
  v35.super_class = (Class)AVCStreamInput;
  v12 = [(AVCStreamInput *)&v35 init];
  if (!v12) {
    goto LABEL_11;
  }
  VRTraceReset();
  v12->_printSampleBufferDetailsEnabled = (int)VRTraceGetErrorLogLevelForModule() > 7;
  int v13 = [(AVCStreamInput *)v12 processFormat:a5];
  *((_DWORD *)v37 + 6) = v13;
  if (v13 < 0) {
    goto LABEL_11;
  }
  v12->_senderQueueLock._os_unfair_lock_opaque = 0;
  v12->_memoryPoolSize = 0x80000;
  int v14 = [(AVCStreamInput *)v12 processOptions:a6];
  *((_DWORD *)v37 + 6) = v14;
  if (v14 < 0) {
    goto LABEL_11;
  }
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCInputStream-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t streamInputID = v12->_streamInputID;
      memset(__str, 170, 20);
      v18 = NSString;
      AVCStreamInputID_ConvertToCString(streamInputID, __str, 0x14uLL);
      uint64_t v19 = [v18 stringWithUTF8String:__str];
      *(_DWORD *)buf = 136316162;
      uint64_t v41 = v15;
      __int16 v42 = 2080;
      v43 = "-[AVCStreamInput initWithDelegate:delegateQueue:format:options:error:]";
      __int16 v44 = 1024;
      int v45 = 162;
      __int16 v46 = 2048;
      v47 = v12;
      __int16 v48 = 2112;
      uint64_t v49 = v19;
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, "AVCStreamInput [%s] %s:%d @:@ AVCInputStream-init (%p) streamInputID=%@", buf, 0x30u);
    }
  }
  int v20 = [(AVCStreamInput *)v12 setupDelegate:a3 delegateQueue:a4];
  *((_DWORD *)v37 + 6) = v20;
  if (v20 < 0) {
    goto LABEL_11;
  }
  int v21 = [(AVCStreamInput *)v12 setupXPCQueue];
  *((_DWORD *)v37 + 6) = v21;
  if (v21 < 0) {
    goto LABEL_11;
  }
  xpcQueue = v12->_xpcQueue;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __70__AVCStreamInput_initWithDelegate_delegateQueue_format_options_error___block_invoke;
  v34[3] = &unk_1E6DB4540;
  v34[4] = v12;
  v34[5] = &v36;
  dispatch_sync(xpcQueue, v34);
  if (!v12->_didInitializeSuccessfully)
  {
LABEL_11:
    CMMediaType MediaType = 0;
  }
  else
  {
    [(AVCStreamInput *)v12 resetStats];
    CMMediaType MediaType = CMFormatDescriptionGetMediaType(v12->_formatDescription);
    CMFormatDescriptionGetMediaSubType(v12->_formatDescription);
    v12->_requireTileIndexAttachment = (v12->_streamInputID & 0xFFFFFFFFFBFFFFFFLL) == 1650745716;
    kdebug_trace();
  }
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCInputStream-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v24 = VRTraceErrorLogLevelToCSTR();
    v25 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (v12)
      {
        uint64_t v26 = v12->_streamInputID;
        memset(__str, 170, 20);
        v27 = NSString;
        AVCStreamInputID_ConvertToCString(v26, __str, 0x14uLL);
        v28 = (__CFString *)[v27 stringWithUTF8String:__str];
      }
      else
      {
        v28 = @"nil";
      }
      v29 = FourccToCStr(MediaType);
      int v30 = *((_DWORD *)v37 + 6);
      uint64_t v31 = [(AVCStreamInput *)v12 formatDescriptionString];
      *(_DWORD *)buf = 136317186;
      v32 = @"NO";
      uint64_t v41 = v24;
      __int16 v42 = 2080;
      v43 = "-[AVCStreamInput initWithDelegate:delegateQueue:format:options:error:]";
      __int16 v44 = 1024;
      if (v30 >= 0) {
        v32 = @"YES";
      }
      int v45 = 186;
      __int16 v46 = 2048;
      v47 = v12;
      __int16 v48 = 2112;
      uint64_t v49 = (uint64_t)v28;
      __int16 v50 = 2080;
      v51 = v29;
      __int16 v52 = 2112;
      v53 = v32;
      __int16 v54 = 1024;
      int v55 = v30;
      __int16 v56 = 2112;
      uint64_t v57 = v31;
      _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, "AVCStreamInput [%s] %s:%d @:@ AVCInputStream-init (%p) streamInputID=%@ mediaType=%s didSucceed=%@ errorCode=%x %@", buf, 0x54u);
    }
  }
  if ((v37[3] & 0x80000000) != 0)
  {

    v12 = 0;
    if (a7) {
      *a7 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"AVCInputStream" code:*((int *)v37 + 6) userInfo:0];
    }
  }
  _Block_object_dispose(&v36, 8);
  return v12;
}

uint64_t __70__AVCStreamInput_initWithDelegate_delegateQueue_format_options_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) setupXPCConnection];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  *(unsigned char *)(*(void *)(a1 + 32) + 105) = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= 0;
  return result;
}

- (id)formatDescriptionString
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  formatDescription = self->_formatDescription;
  if (!formatDescription) {
    return &stru_1F3D3E450;
  }
  CMMediaType MediaType = CMFormatDescriptionGetMediaType(formatDescription);
  FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType(self->_formatDescription);
  v6 = (void *)MEMORY[0x1E4F28E78];
  v7 = FourccToCStr(MediaType);
  v8 = objc_msgSend(v6, "stringWithFormat:", @"mediaType=%s subtype=%s", v7, FourccToCStr(MediaSubType));
  if (MediaType == 1936684398)
  {
    *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v17 = v9;
    long long v18 = v9;
    *(_OWORD *)__str = v9;
    long long v16 = v9;
    StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(self->_formatDescription);
    int v13 = FormatToCStr((uint64_t)StreamBasicDescription, __str, 0x40uLL);
    objc_msgSend(v8, "appendFormat:", @" audioStreamBasicDescription=%s", v13, v14, *(void *)__str, *(void *)&__str[8], v16, v17, v18);
  }
  else if (MediaType == 1986618469)
  {
    CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(self->_formatDescription);
    objc_msgSend(v8, "appendFormat:", @" dimensions=%dx%d", Dimensions, HIDWORD(*(unint64_t *)&Dimensions), *(void *)__str, *(void *)&__str[8], v16, v17, v18);
  }
  return v8;
}

- (int)processOptions:(id)a3
{
  id v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v5 = (void *)[a3 objectForKeyedSubscript:@"options"];
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LODWORD(v3) = -2143617023;
      if ((AVCStreamInput *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVCStreamInput processOptions:]();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          v8 = (__CFString *)[(AVCStreamInput *)self performSelector:sel_logPrefix];
        }
        else {
          v8 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v10 = VRTraceErrorLogLevelToCSTR();
          v11 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            int v14 = 136316162;
            uint64_t v15 = v10;
            __int16 v16 = 2080;
            long long v17 = "-[AVCStreamInput processOptions:]";
            __int16 v18 = 1024;
            int v19 = 222;
            __int16 v20 = 2112;
            int v21 = v8;
            __int16 v22 = 2048;
            v23 = self;
            v12 = "AVCStreamInput [%s] %s:%d %@(%p) Invalid ID";
LABEL_28:
            _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v14, 0x30u);
          }
        }
      }
    }
    else
    {
      self->_uint64_t streamInputID = (int)[v5 intValue];
      id v3 = (id)[v3 objectForKeyedSubscript:@"poolSize"];
      if (v3)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v6 = [v3 intValue];
          LODWORD(v3) = 0;
          self->_memoryPoolSize = v6;
          return (int)v3;
        }
        LODWORD(v3) = -2143617023;
        if ((AVCStreamInput *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[AVCStreamInput processOptions:]();
            }
          }
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            long long v9 = (__CFString *)[(AVCStreamInput *)self performSelector:sel_logPrefix];
          }
          else {
            long long v9 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v13 = VRTraceErrorLogLevelToCSTR();
            v11 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              int v14 = 136316162;
              uint64_t v15 = v13;
              __int16 v16 = 2080;
              long long v17 = "-[AVCStreamInput processOptions:]";
              __int16 v18 = 1024;
              int v19 = 227;
              __int16 v20 = 2112;
              int v21 = v9;
              __int16 v22 = 2048;
              v23 = self;
              v12 = "AVCStreamInput [%s] %s:%d %@(%p) Invalid sample buffer pool size";
              goto LABEL_28;
            }
          }
        }
      }
    }
  }
  return (int)v3;
}

- (int)processFormat:(opaqueCMFormatDescription *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    CFTypeID v5 = CFGetTypeID(a3);
    if (v5 == CMFormatDescriptionGetTypeID())
    {
      int v6 = (opaqueCMFormatDescription *)CFRetain(a3);
      int v7 = 0;
      self->_formatDescription = v6;
      return v7;
    }
    int v7 = -2143617023;
    if ((AVCStreamInput *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCStreamInput processFormat:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v10 = (__CFString *)[(AVCStreamInput *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v15 = 136316162;
          uint64_t v16 = v14;
          __int16 v17 = 2080;
          __int16 v18 = "-[AVCStreamInput processFormat:]";
          __int16 v19 = 1024;
          int v20 = 239;
          __int16 v21 = 2112;
          __int16 v22 = v10;
          __int16 v23 = 2048;
          uint64_t v24 = self;
          uint64_t v13 = "AVCStreamInput [%s] %s:%d %@(%p) Provided format is invalid";
          goto LABEL_25;
        }
      }
    }
  }
  else
  {
    int v7 = -2143617023;
    if ((AVCStreamInput *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCStreamInput processFormat:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v9 = (__CFString *)[(AVCStreamInput *)self performSelector:sel_logPrefix];
      }
      else {
        long long v9 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v15 = 136316162;
          uint64_t v16 = v11;
          __int16 v17 = 2080;
          __int16 v18 = "-[AVCStreamInput processFormat:]";
          __int16 v19 = 1024;
          int v20 = 238;
          __int16 v21 = 2112;
          __int16 v22 = v9;
          __int16 v23 = 2048;
          uint64_t v24 = self;
          uint64_t v13 = "AVCStreamInput [%s] %s:%d %@(%p) Provided format is NULL";
LABEL_25:
          _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v15, 0x30u);
        }
      }
    }
  }
  return v7;
}

- (int)setupDelegate:(id)a3 delegateQueue:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    CFTypeID v5 = (OS_dispatch_queue *)a4;
    if (a4)
    {
      id v7 = a4;
LABEL_5:
      self->_delegateQueue = v5;
      objc_storeWeak(&self->_delegate, a3);
      return 0;
    }
    v8 = NSString;
    long long v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = (const char *)[(id)objc_msgSend(v8 stringWithFormat:@"%s.%@.delegate_queue", "com.apple.AVConference", NSStringFromClass(v9)), "UTF8String"];
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    CFTypeID v5 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2(v10, 0, CustomRootQueue);
    if (v5) {
      goto LABEL_5;
    }
    if ((AVCStreamInput *)objc_opt_class() == self)
    {
      int v12 = -2143617022;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          -[AVCStreamInput setupDelegate:delegateQueue:]();
          return -2143617022;
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v15 = (__CFString *)[(AVCStreamInput *)self performSelector:sel_logPrefix];
      }
      else {
        int v15 = &stru_1F3D3E450;
      }
      int v12 = -2143617022;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        __int16 v19 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v21 = v18;
          __int16 v22 = 2080;
          __int16 v23 = "-[AVCStreamInput setupDelegate:delegateQueue:]";
          __int16 v24 = 1024;
          int v25 = 256;
          __int16 v26 = 2112;
          v27 = v15;
          __int16 v28 = 2048;
          v29 = self;
          _os_log_error_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_ERROR, "AVCStreamInput [%s] %s:%d %@(%p) Delegate queue is NULL", buf, 0x30u);
          return -2143617022;
        }
      }
    }
  }
  else if ((AVCStreamInput *)objc_opt_class() == self)
  {
    int v12 = -2143617023;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCStreamInput setupDelegate:delegateQueue:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v14 = (__CFString *)[(AVCStreamInput *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v14 = &stru_1F3D3E450;
    }
    int v12 = -2143617023;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      __int16 v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v21 = v16;
        __int16 v22 = 2080;
        __int16 v23 = "-[AVCStreamInput setupDelegate:delegateQueue:]";
        __int16 v24 = 1024;
        int v25 = 248;
        __int16 v26 = 2112;
        v27 = v14;
        __int16 v28 = 2048;
        v29 = self;
        _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, "AVCStreamInput [%s] %s:%d %@(%p) No delegate specified", buf, 0x30u);
      }
    }
  }
  return v12;
}

- (int)setupXPCQueue
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  CFTypeID v5 = (const char *)[(id)objc_msgSend(v3 stringWithFormat:@"%s.%@.connection_queue", "com.apple.AVConference", NSStringFromClass(v4)), "UTF8String"];
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
  id v7 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2(v5, 0, CustomRootQueue);
  self->_xpcQueue = v7;
  if (v7) {
    return 0;
  }
  int v8 = -2143617022;
  if ((AVCStreamInput *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCStreamInput setupXPCQueue]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v10 = (__CFString *)[(AVCStreamInput *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      int v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v14 = v11;
        __int16 v15 = 2080;
        uint64_t v16 = "-[AVCStreamInput setupXPCQueue]";
        __int16 v17 = 1024;
        int v18 = 268;
        __int16 v19 = 2112;
        int v20 = v10;
        __int16 v21 = 2048;
        __int16 v22 = self;
        _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, "AVCStreamInput [%s] %s:%d %@(%p) Failed to create the XPC connection queue", buf, 0x30u);
      }
    }
  }
  return v8;
}

- (id)newRemoteQueueWithServerPid:(int)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  p_senderQueue = (uint64_t *)&self->_senderQueue;
  BOOL SenderQueueWithPoolSize = VCRemoteImageQueue_CreateSenderQueueWithPoolSize(*(uint64_t *)&a3, &self->_senderQueue);
  senderQueue = self->_senderQueue;
  if (!senderQueue || !SenderQueueWithPoolSize)
  {
    if ((AVCStreamInput *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCStreamInput newRemoteQueueWithServerPid:]();
        }
      }
      goto LABEL_35;
    }
    if (objc_opt_respondsToSelector()) {
      long long v9 = (__CFString *)[(AVCStreamInput *)self performSelector:sel_logPrefix];
    }
    else {
      long long v9 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_35;
    }
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint64_t v13 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_35;
    }
    int v18 = 136316162;
    uint64_t v19 = v12;
    __int16 v20 = 2080;
    __int16 v21 = "-[AVCStreamInput newRemoteQueueWithServerPid:]";
    __int16 v22 = 1024;
    int v23 = 276;
    __int16 v24 = 2112;
    int v25 = v9;
    __int16 v26 = 2048;
    v27 = self;
    uint64_t v14 = "AVCStreamInput [%s] %s:%d %@(%p) RemoteImageQueue could not be made on StreamInput client";
    goto LABEL_39;
  }
  id v7 = (__CFAllocator *)VCRemoteImageQueue_SharedMemoryPoolAllocator(senderQueue);
  self->_sampleBufferAllocator = v7;
  if (!v7)
  {
    if ((AVCStreamInput *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCStreamInput newRemoteQueueWithServerPid:]();
        }
      }
      goto LABEL_35;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v10 = (__CFString *)[(AVCStreamInput *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_35;
    }
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v13 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_35;
    }
    int v18 = 136316162;
    uint64_t v19 = v15;
    __int16 v20 = 2080;
    __int16 v21 = "-[AVCStreamInput newRemoteQueueWithServerPid:]";
    __int16 v22 = 1024;
    int v23 = 278;
    __int16 v24 = 2112;
    int v25 = v10;
    __int16 v26 = 2048;
    v27 = self;
    uint64_t v14 = "AVCStreamInput [%s] %s:%d %@(%p) Could not get the shared pool allocator for the _senderQueue";
LABEL_39:
    _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v18, 0x30u);
    goto LABEL_35;
  }
  CFRetain(v7);
  id result = (id)VCRemoteImageQueue_CreateQueueXPCObject(*p_senderQueue);
  if (result) {
    return result;
  }
  if ((AVCStreamInput *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCStreamInput newRemoteQueueWithServerPid:]();
      }
    }
    goto LABEL_35;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v11 = (__CFString *)[(AVCStreamInput *)self performSelector:sel_logPrefix];
  }
  else {
    uint64_t v11 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    uint64_t v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      int v18 = 136316162;
      uint64_t v19 = v16;
      __int16 v20 = 2080;
      __int16 v21 = "-[AVCStreamInput newRemoteQueueWithServerPid:]";
      __int16 v22 = 1024;
      int v23 = 281;
      __int16 v24 = 2112;
      int v25 = v11;
      __int16 v26 = 2048;
      v27 = self;
      uint64_t v14 = "AVCStreamInput [%s] %s:%d %@(%p) RemoteImageQueue failed to create sender xpc object";
      goto LABEL_39;
    }
  }
LABEL_35:
  sampleBufferAllocator = self->_sampleBufferAllocator;
  if (sampleBufferAllocator)
  {
    CFRelease(sampleBufferAllocator);
    self->_sampleBufferAllocator = 0;
  }
  VCRemoteImageQueue_Destroy(p_senderQueue);
  return 0;
}

- (void)tearDownRemoteQueue
{
  p_senderQueueLock = &self->_senderQueueLock;
  os_unfair_lock_lock(&self->_senderQueueLock);
  if (self->_useFigRemoteQueue)
  {
    self->_useFigRemoteQueue = 0;
    VCRemoteImageQueue_Destroy((uint64_t *)&self->_senderQueue);
  }

  os_unfair_lock_unlock(p_senderQueueLock);
}

- (int)setupXPCConnection
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(AVConferenceXPCClient);
  self->_xpcConnection = v3;
  if (v3)
  {
    [(AVCStreamInput *)self registerBlocksForNotification];
    return [(AVCStreamInput *)self initializeServerSideInputStream];
  }
  else
  {
    if ((AVCStreamInput *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCStreamInput setupXPCConnection]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        CFTypeID v5 = (__CFString *)[(AVCStreamInput *)self performSelector:sel_logPrefix];
      }
      else {
        CFTypeID v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        id v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v8 = 136316162;
          uint64_t v9 = v6;
          __int16 v10 = 2080;
          uint64_t v11 = "-[AVCStreamInput setupXPCConnection]";
          __int16 v12 = 1024;
          int v13 = 303;
          __int16 v14 = 2112;
          uint64_t v15 = v5;
          __int16 v16 = 2048;
          __int16 v17 = self;
          _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, "AVCStreamInput [%s] %s:%d %@(%p) Failed to allocate the XPC connection", (uint8_t *)&v8, 0x30u);
        }
      }
    }
    return -2143617022;
  }
}

- (void)tearDownConnectionWithTerminateMessage:(BOOL)a3
{
  BOOL v3 = a3;
  [(AVCStreamInput *)self deregisterBlocksForNotifications];
  if (v3) {
    [(AVConferenceXPCClient *)self->_xpcConnection sendMessageSync:"VCStreamInputTerminate"];
  }

  self->_xpcConnection = 0;

  [(AVCStreamInput *)self tearDownRemoteQueue];
}

- (int)resetXPCConnection
{
  [(AVCStreamInput *)self tearDownConnectionWithTerminateMessage:0];

  return [(AVCStreamInput *)self setupXPCConnection];
}

- (void)resetStats
{
  uint64_t v2 = MEMORY[0x1E4F1F9F8];
  long long v3 = *MEMORY[0x1E4F1F9F8];
  *(_OWORD *)(&self->_isStarted + 4) = *MEMORY[0x1E4F1F9F8];
  int64_t v4 = *(void *)(v2 + 16);
  *(void *)&self->_lastHealthPrintTime.flags = v4;
  *(_OWORD *)&self->_payloadStats.sampleBufferCount = v3;
  *(void *)&self->_payloadStats.lastSampleBufferTime.timescale = v4;
  self->_payloadStats.lastSampleBufferTime.epoch = 0;
  *((_DWORD *)&self->_senderQueueLock + 1) = 0;
  *(_OWORD *)&self->_payloadStats.averageBitrate = v3;
  self->_tileIndexStats[0].lastSampleBufferTime.value = v4;
  *(void *)&self->_tileIndexStats[0].lastSampleBufferTime.timescale = 0;
  LODWORD(self->_tileIndexStats[1].lastSampleBufferTime.value) = 0;
  *(void *)&self->_tileIndexStats[1].sampleBufferCount = v4;
  *(_OWORD *)&self->_tileIndexStats[0].lastSampleBufferTime.epoch = v3;
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(AVCStreamInput *)self tearDownConnectionWithTerminateMessage:1];
  xpcQueue = self->_xpcQueue;
  if (xpcQueue)
  {
    dispatch_release(xpcQueue);
    self->_xpcQueue = 0;
  }
  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
  {
    dispatch_release(delegateQueue);
    self->_delegateQueue = 0;
  }
  objc_storeWeak(&self->_delegate, 0);

  formatDescription = self->_formatDescription;
  if (formatDescription) {
    CFRelease(formatDescription);
  }
  sampleBufferAllocator = self->_sampleBufferAllocator;
  if (sampleBufferAllocator) {
    CFRelease(sampleBufferAllocator);
  }
  VCRemoteImageQueue_Destroy((uint64_t *)&self->_senderQueue);
  kdebug_trace();
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ %@-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    int v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 136316162;
      uint64_t v12 = v7;
      __int16 v13 = 2080;
      __int16 v14 = "-[AVCStreamInput dealloc]";
      __int16 v15 = 1024;
      int v16 = 356;
      __int16 v17 = 2112;
      uint64_t v18 = NSStringFromClass(v9);
      __int16 v19 = 2048;
      __int16 v20 = self;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVCStreamInput [%s] %s:%d @:@ %@-dealloc (%p)", buf, 0x30u);
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)AVCStreamInput;
  [(AVCStreamInput *)&v10 dealloc];
}

- (id)delegate
{
  return objc_loadWeak(&self->_delegate);
}

- (void)senderQueueLock
{
}

- (void)senderQueueUnlock
{
}

- (int)createAndAddRemoteQueueToXPCDictionary:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  p_senderQueueLock = &self->_senderQueueLock;
  os_unfair_lock_lock(&self->_senderQueueLock);
  id v6 = [(AVConferenceXPCClient *)self->_xpcConnection sendMessageSync:"VCStreamInputGetServerPid" arguments:0 xpcArguments:0];
  if (!v6) {
    goto LABEL_7;
  }
  uint64_t v7 = v6;
  int v8 = (void *)[v6 objectForKeyedSubscript:@"ERROR"];
  if (v8)
  {
    __int16 v24 = v8;
    int v12 = [v8 code];
    if ((AVCStreamInput *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCStreamInput createAndAddRemoteQueueToXPCDictionary:]();
        }
      }
      goto LABEL_42;
    }
    if (objc_opt_respondsToSelector()) {
      int v25 = (__CFString *)[(AVCStreamInput *)self performSelector:sel_logPrefix];
    }
    else {
      int v25 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_42;
    }
    uint64_t v27 = VRTraceErrorLogLevelToCSTR();
    uint64_t v28 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_42;
    }
    int v34 = 136316674;
    uint64_t v35 = v27;
    __int16 v36 = 2080;
    v37 = "-[AVCStreamInput createAndAddRemoteQueueToXPCDictionary:]";
    __int16 v38 = 1024;
    int v39 = 383;
    __int16 v40 = 2112;
    uint64_t v41 = v25;
    __int16 v42 = 2048;
    v43 = self;
    __int16 v44 = 2080;
    int v45 = "VCStreamInputGetServerPid";
    __int16 v46 = 2112;
    v47 = v24;
    v29 = "AVCStreamInput [%s] %s:%d %@(%p) Message=%s returned with an error=%@";
    uint64_t v30 = v28;
    uint32_t v31 = 68;
LABEL_44:
    _os_log_error_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_ERROR, v29, (uint8_t *)&v34, v31);
    goto LABEL_42;
  }
  uint64_t v9 = (void *)[v7 objectForKeyedSubscript:@"VCStreamInputServerPID"];
  objc_super v10 = v9;
  if (!v9)
  {
LABEL_8:
    int v12 = 0;
    goto LABEL_9;
  }
  if (![v9 intValue])
  {
LABEL_7:
    objc_super v10 = 0;
    goto LABEL_8;
  }
  id v11 = -[AVCStreamInput newRemoteQueueWithServerPid:](self, "newRemoteQueueWithServerPid:", [v10 intValue]);
  if (v11)
  {
    objc_super v10 = v11;
    xpc_dictionary_set_value(a3, "VCStreamInputRemoteQueue", v11);
    int v12 = 0;
    self->_BOOL useFigRemoteQueue = 1;
    goto LABEL_9;
  }
  int v12 = -2143617020;
  if ((AVCStreamInput *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCStreamInput createAndAddRemoteQueueToXPCDictionary:]();
      }
    }
    goto LABEL_42;
  }
  if (objc_opt_respondsToSelector()) {
    __int16 v26 = (__CFString *)[(AVCStreamInput *)self performSelector:sel_logPrefix];
  }
  else {
    __int16 v26 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v32 = VRTraceErrorLogLevelToCSTR();
    v33 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      int v34 = 136316162;
      uint64_t v35 = v32;
      __int16 v36 = 2080;
      v37 = "-[AVCStreamInput createAndAddRemoteQueueToXPCDictionary:]";
      __int16 v38 = 1024;
      int v39 = 387;
      __int16 v40 = 2112;
      uint64_t v41 = v26;
      __int16 v42 = 2048;
      v43 = self;
      v29 = "AVCStreamInput [%s] %s:%d %@(%p) Failed to create remote queue";
      uint64_t v30 = v33;
      uint32_t v31 = 48;
      goto LABEL_44;
    }
  }
LABEL_42:
  objc_super v10 = 0;
LABEL_9:
  os_unfair_lock_unlock(p_senderQueueLock);
  if ((AVCStreamInput *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v13 = (__CFString *)[(AVCStreamInput *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v13 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_20;
    }
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    uint64_t v21 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    BOOL useFigRemoteQueue = self->_useFigRemoteQueue;
    int v34 = 136316418;
    uint64_t v35 = v20;
    __int16 v36 = 2080;
    v37 = "-[AVCStreamInput createAndAddRemoteQueueToXPCDictionary:]";
    __int16 v38 = 1024;
    int v39 = 394;
    __int16 v40 = 2112;
    uint64_t v41 = v13;
    __int16 v42 = 2048;
    v43 = self;
    __int16 v44 = 1024;
    LODWORD(v45) = useFigRemoteQueue;
    __int16 v17 = "AVCStreamInput [%s] %s:%d %@(%p) useFigRemoteQueue=%d";
    uint64_t v18 = v21;
    uint32_t v19 = 54;
    goto LABEL_19;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    __int16 v15 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v16 = self->_useFigRemoteQueue;
      int v34 = 136315906;
      uint64_t v35 = v14;
      __int16 v36 = 2080;
      v37 = "-[AVCStreamInput createAndAddRemoteQueueToXPCDictionary:]";
      __int16 v38 = 1024;
      int v39 = 394;
      __int16 v40 = 1024;
      LODWORD(v41) = v16;
      __int16 v17 = "AVCStreamInput [%s] %s:%d useFigRemoteQueue=%d";
      uint64_t v18 = v15;
      uint32_t v19 = 34;
LABEL_19:
      _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v34, v19);
    }
  }
LABEL_20:
  if (v10) {
    CFRelease(v10);
  }
  return v12;
}

- (int)initializeServerSideInputStream
{
  v37[1] = *MEMORY[0x1E4F143B8];
  if (self->_streamInputID)
  {
    __int16 v36 = @"VCStreamInputID";
    v37[0] = objc_msgSend(NSNumber, "numberWithInteger:");
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
  }
  else
  {
    uint64_t v3 = 0;
  }
  int64_t v4 = VCStreamInputUtil_EncodeFormatDescription(self->_formatDescription);
  if (v4)
  {
    CFTypeID v5 = v4;
    int v6 = [(AVCStreamInput *)self createAndAddRemoteQueueToXPCDictionary:v4];
    if (v6)
    {
      int v11 = v6;
      if ((AVCStreamInput *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVCStreamInput initializeServerSideInputStream].cold.5();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v14 = (__CFString *)[(AVCStreamInput *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v14 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v21 = VRTraceErrorLogLevelToCSTR();
          __int16 v22 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uint64_t v32 = 136316162;
            *(void *)&v32[4] = v21;
            *(_WORD *)&v32[12] = 2080;
            *(void *)&v32[14] = "-[AVCStreamInput initializeServerSideInputStream]";
            *(_WORD *)&v32[22] = 1024;
            LODWORD(v33) = 411;
            WORD2(v33) = 2112;
            *(void *)((char *)&v33 + 6) = v14;
            HIWORD(v33) = 2048;
            int v34 = self;
            int v23 = "AVCStreamInput [%s] %s:%d %@(%p) RemoteQueue creation and adding to XPC dictionary failed";
            __int16 v24 = v22;
            uint32_t v25 = 48;
            goto LABEL_67;
          }
        }
      }
    }
    else
    {
      id v7 = [(AVConferenceXPCClient *)self->_xpcConnection sendMessageSync:"VCStreamInputInitialize" arguments:v3 xpcArguments:v5];
      if (!v7)
      {
        if ((AVCStreamInput *)objc_opt_class() == self)
        {
          int v11 = -2143617023;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[AVCStreamInput initializeServerSideInputStream]();
            }
          }
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            __int16 v15 = (__CFString *)[(AVCStreamInput *)self performSelector:sel_logPrefix];
          }
          else {
            __int16 v15 = &stru_1F3D3E450;
          }
          int v11 = -2143617023;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v26 = VRTraceErrorLogLevelToCSTR();
            uint64_t v27 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)uint64_t v32 = 136316418;
              *(void *)&v32[4] = v26;
              *(_WORD *)&v32[12] = 2080;
              *(void *)&v32[14] = "-[AVCStreamInput initializeServerSideInputStream]";
              *(_WORD *)&v32[22] = 1024;
              LODWORD(v33) = 414;
              WORD2(v33) = 2112;
              *(void *)((char *)&v33 + 6) = v15;
              HIWORD(v33) = 2048;
              int v34 = self;
              *(_WORD *)uint64_t v35 = 2080;
              *(void *)&v35[2] = "VCStreamInputInitialize";
              _os_log_error_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_ERROR, "AVCStreamInput [%s] %s:%d %@(%p) message=%s sendMessageSync failed", v32, 0x3Au);
            }
          }
        }
        goto LABEL_65;
      }
      int v8 = v7;
      uint64_t v9 = (void *)[v7 objectForKeyedSubscript:@"ERROR"];
      if (!v9)
      {
        if ([v8 objectForKeyedSubscript:@"VCStreamInputID"])
        {
          int v10 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"VCStreamInputID"), "intValue");
          self->_uint64_t streamInputID = v10;
          AVCStreamInputID_ConvertToCString(v10, self->_streamInputIDString, 0x14uLL);
          if (objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"VCStreamInputDidStart"), "BOOLValue"))-[AVCStreamInput didStart](self, "didStart"); {
          int v11 = 0;
          }
          goto LABEL_12;
        }
        if ((AVCStreamInput *)objc_opt_class() == self)
        {
          int v11 = -2143617020;
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            goto LABEL_65;
          }
          VRTraceErrorLogLevelToCSTR();
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            goto LABEL_65;
          }
          -[AVCStreamInput initializeServerSideInputStream]();
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            uint64_t v18 = (__CFString *)[(AVCStreamInput *)self performSelector:sel_logPrefix];
          }
          else {
            uint64_t v18 = &stru_1F3D3E450;
          }
          int v11 = -2143617020;
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            goto LABEL_65;
          }
          uint64_t v30 = VRTraceErrorLogLevelToCSTR();
          uint32_t v31 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            goto LABEL_65;
          }
          *(_DWORD *)uint64_t v32 = 136316418;
          *(void *)&v32[4] = v30;
          *(_WORD *)&v32[12] = 2080;
          *(void *)&v32[14] = "-[AVCStreamInput initializeServerSideInputStream]";
          *(_WORD *)&v32[22] = 1024;
          LODWORD(v33) = 419;
          WORD2(v33) = 2112;
          *(void *)((char *)&v33 + 6) = v18;
          HIWORD(v33) = 2048;
          int v34 = self;
          *(_WORD *)uint64_t v35 = 2112;
          *(void *)&v35[2] = v8;
          _os_log_error_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_ERROR, "AVCStreamInput [%s] %s:%d %@(%p) No stream input ID provided. nsRet=%@", v32, 0x3Au);
        }
        int v11 = -2143617020;
LABEL_65:
        [(AVCStreamInput *)self tearDownRemoteQueue];
        goto LABEL_12;
      }
      BOOL v16 = v9;
      int v11 = [v9 code];
      if ((AVCStreamInput *)objc_opt_class() != self)
      {
        if (objc_opt_respondsToSelector()) {
          __int16 v17 = (__CFString *)[(AVCStreamInput *)self performSelector:sel_logPrefix];
        }
        else {
          __int16 v17 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_60;
        }
        uint64_t v28 = VRTraceErrorLogLevelToCSTR();
        v29 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_60;
        }
        *(_DWORD *)uint64_t v32 = 136316674;
        *(void *)&v32[4] = v28;
        *(_WORD *)&v32[12] = 2080;
        *(void *)&v32[14] = "-[AVCStreamInput initializeServerSideInputStream]";
        *(_WORD *)&v32[22] = 1024;
        LODWORD(v33) = 417;
        WORD2(v33) = 2112;
        *(void *)((char *)&v33 + 6) = v17;
        HIWORD(v33) = 2048;
        int v34 = self;
        *(_WORD *)uint64_t v35 = 2080;
        *(void *)&v35[2] = "VCStreamInputInitialize";
        *(_WORD *)&v35[10] = 2112;
        *(void *)&v35[12] = v16;
        int v23 = "AVCStreamInput [%s] %s:%d %@(%p) message=%s returned with an error=%@";
        __int16 v24 = v29;
        uint32_t v25 = 68;
LABEL_67:
        _os_log_error_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_ERROR, v23, v32, v25);
        goto LABEL_60;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCStreamInput initializeServerSideInputStream].cold.4();
        }
      }
    }
LABEL_60:
    if ((v11 & 0x80000000) == 0)
    {
LABEL_12:
      CFRelease(v5);
      return v11;
    }
    goto LABEL_65;
  }
  if ((AVCStreamInput *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCStreamInput initializeServerSideInputStream]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v13 = (__CFString *)[(AVCStreamInput *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v13 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      uint64_t v20 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v32 = 136316162;
        *(void *)&v32[4] = v19;
        *(_WORD *)&v32[12] = 2080;
        *(void *)&v32[14] = "-[AVCStreamInput initializeServerSideInputStream]";
        *(_WORD *)&v32[22] = 1024;
        LODWORD(v33) = 408;
        WORD2(v33) = 2112;
        *(void *)((char *)&v33 + 6) = v13;
        HIWORD(v33) = 2048;
        int v34 = self;
        _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, "AVCStreamInput [%s] %s:%d %@(%p) Failed to encode the format description", v32, 0x30u);
      }
    }
  }
  [(AVCStreamInput *)self tearDownRemoteQueue];
  return -2143617022;
}

- (void)didServerDie
{
  AVCStreamInputID_ConvertToNSString(*(void *)(a2 + 40));
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, "AVCStreamInput [%s] %s:%d AVCStreamInputID=%@ server died while initializing the XPC connection. Don't try to reconnect since this instance will dealloc", v4, v5, v6, v7, v8);
}

uint64_t __30__AVCStreamInput_didServerDie__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __30__AVCStreamInput_didServerDie__block_invoke_cold_1();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        __30__AVCStreamInput_didServerDie__block_invoke_cold_2();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v2 = (__CFString *)[*v1 performSelector:sel_logPrefix];
    }
    else {
      uint64_t v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      char IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (IsOSFaultDisabled)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          id v6 = *v1;
          uint64_t v7 = (uint64_t)*v1 + 128;
          int v11 = 136316418;
          uint64_t v12 = v3;
          __int16 v13 = 2080;
          uint64_t v14 = "-[AVCStreamInput didServerDie]_block_invoke";
          __int16 v15 = 1024;
          int v16 = 505;
          __int16 v17 = 2112;
          uint64_t v18 = v2;
          __int16 v19 = 2048;
          id v20 = v6;
          __int16 v21 = 2080;
          uint64_t v22 = v7;
          _os_log_error_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_ERROR, "AVCStreamInput [%s] %s:%d %@(%p) AVCStreamInputID=%s server died, notifying client", (uint8_t *)&v11, 0x3Au);
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        id v8 = *v1;
        uint64_t v9 = (uint64_t)*v1 + 128;
        int v11 = 136316418;
        uint64_t v12 = v3;
        __int16 v13 = 2080;
        uint64_t v14 = "-[AVCStreamInput didServerDie]_block_invoke";
        __int16 v15 = 1024;
        int v16 = 505;
        __int16 v17 = 2112;
        uint64_t v18 = v2;
        __int16 v19 = 2048;
        id v20 = v8;
        __int16 v21 = 2080;
        uint64_t v22 = v9;
        _os_log_fault_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_FAULT, "AVCStreamInput [%s] %s:%d %@(%p) AVCStreamInputID=%s server died, notifying client", (uint8_t *)&v11, 0x3Au);
      }
    }
  }
  [*v1 delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result) {
    return objc_msgSend((id)objc_msgSend(*v1, "delegate"), "serverDidDie");
  }
  return result;
}

- (void)didStart
{
  v3[5] = *MEMORY[0x1E4F143B8];
  delegateQueue = self->_delegateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __26__AVCStreamInput_didStart__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(delegateQueue, v3);
}

uint64_t __26__AVCStreamInput_didStart__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t result = *(void *)(a1 + 32);
  if (!*(unsigned char *)(result + 64))
  {
    [(id)result resetStats];
    *(unsigned char *)(*(void *)(a1 + 32) + 64) = 1;
    kdebug_trace();
    MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ %@-didStart");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = (objc_class *)objc_opt_class();
        id v6 = NSStringFromClass(v5);
        uint64_t v7 = *(void *)(a1 + 32);
        int v8 = 136316162;
        uint64_t v9 = v3;
        __int16 v10 = 2080;
        int v11 = "-[AVCStreamInput didStart]_block_invoke";
        __int16 v12 = 1024;
        int v13 = 521;
        __int16 v14 = 2112;
        __int16 v15 = v6;
        __int16 v16 = 2048;
        uint64_t v17 = v7;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVCStreamInput [%s] %s:%d @:@ %@-didStart (%p)", (uint8_t *)&v8, 0x30u);
      }
    }
    [*(id *)(a1 + 32) delegate];
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "didStartStreamInput:", *(void *)(a1 + 32));
    }
  }
  return result;
}

- (void)didStop
{
  v3[5] = *MEMORY[0x1E4F143B8];
  delegateQueue = self->_delegateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __25__AVCStreamInput_didStop__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(delegateQueue, v3);
}

uint64_t __25__AVCStreamInput_didStop__block_invoke(uint64_t result)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 64))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 64) = 0;
    kdebug_trace();
    MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ %@-didStop");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = (objc_class *)objc_opt_class();
        id v6 = NSStringFromClass(v5);
        uint64_t v7 = *(void *)(v2 + 32);
        int v8 = 136316162;
        uint64_t v9 = v3;
        __int16 v10 = 2080;
        int v11 = "-[AVCStreamInput didStop]_block_invoke";
        __int16 v12 = 1024;
        int v13 = 535;
        __int16 v14 = 2112;
        __int16 v15 = v6;
        __int16 v16 = 2048;
        uint64_t v17 = v7;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVCStreamInput [%s] %s:%d @:@ %@-didStop (%p)", (uint8_t *)&v8, 0x30u);
      }
    }
    [*(id *)(v2 + 32) delegate];
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      return objc_msgSend((id)objc_msgSend(*(id *)(v2 + 32), "delegate"), "didStopStreamInput:", *(void *)(v2 + 32));
    }
  }
  return result;
}

- (void)didSuspend
{
  v3[5] = *MEMORY[0x1E4F143B8];
  delegateQueue = self->_delegateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __28__AVCStreamInput_didSuspend__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(delegateQueue, v3);
}

uint64_t __28__AVCStreamInput_didSuspend__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ %@-didSuspend");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = (objc_class *)objc_opt_class();
      uint64_t v5 = NSStringFromClass(v4);
      uint64_t v6 = *(void *)(a1 + 32);
      int v8 = 136316162;
      uint64_t v9 = v2;
      __int16 v10 = 2080;
      int v11 = "-[AVCStreamInput didSuspend]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 544;
      __int16 v14 = 2112;
      __int16 v15 = v5;
      __int16 v16 = 2048;
      uint64_t v17 = v6;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "AVCStreamInput [%s] %s:%d @:@ %@-didSuspend (%p)", (uint8_t *)&v8, 0x30u);
    }
  }
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result) {
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "didSuspendStreamInput:", *(void *)(a1 + 32));
  }
  return result;
}

- (void)didResume
{
  v3[5] = *MEMORY[0x1E4F143B8];
  delegateQueue = self->_delegateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __27__AVCStreamInput_didResume__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(delegateQueue, v3);
}

uint64_t __27__AVCStreamInput_didResume__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ %@-didResume");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = (objc_class *)objc_opt_class();
      uint64_t v5 = NSStringFromClass(v4);
      uint64_t v6 = *(void *)(a1 + 32);
      int v9 = 136316162;
      uint64_t v10 = v2;
      __int16 v11 = 2080;
      __int16 v12 = "-[AVCStreamInput didResume]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 554;
      __int16 v15 = 2112;
      __int16 v16 = v5;
      __int16 v17 = 2048;
      uint64_t v18 = v6;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "AVCStreamInput [%s] %s:%d @:@ %@-didResume (%p)", (uint8_t *)&v9, 0x30u);
    }
  }
  uint64_t v7 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result) {
    return [v7 didResumeStreamInput:*(void *)(a1 + 32)];
  }
  return result;
}

- (void)registerService:(char *)a3 weakSelf:(id)a4 block:(id)a5
{
  v5[6] = *MEMORY[0x1E4F143B8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__AVCStreamInput_registerService_weakSelf_block___block_invoke;
  v5[3] = &unk_1E6DB7D80;
  v5[4] = a4;
  v5[5] = a5;
  [(AVConferenceXPCClient *)self->_xpcConnection registerBlockForService:a3 block:v5 queue:self->_xpcQueue];
}

uint64_t __49__AVCStreamInput_registerService_weakSelf_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 objectForKeyedSubscript:@"SERVERDIED"];
  if (!result)
  {
    uint64_t result = [*(id *)(a1 + 32) strong];
    if (result)
    {
      uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
      return v4();
    }
  }
  return result;
}

- (void)registerDidServerDieBlock:(id)a3
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__AVCStreamInput_registerDidServerDieBlock___block_invoke;
  v3[3] = &unk_1E6DB4338;
  v3[4] = a3;
  [(AVConferenceXPCClient *)self->_xpcConnection registerBlockForService:"VCStreamInputDidServerDie" block:v3 queue:self->_xpcQueue];
}

void *__44__AVCStreamInput_registerDidServerDieBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = (void *)[a2 objectForKeyedSubscript:@"SERVERDIED"];
  if (result)
  {
    uint64_t result = (void *)[*(id *)(a1 + 32) strong];
    if (result)
    {
      return (void *)[result didServerDie];
    }
  }
  return result;
}

- (void)registerBlocksForNotification
{
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  [(AVCStreamInput *)self registerService:"VCStreamInputDidStart" weakSelf:v3 block:&__block_literal_global_53];
  [(AVCStreamInput *)self registerService:"VCStreamInputDidStop" weakSelf:v3 block:&__block_literal_global_83];
  [(AVCStreamInput *)self registerService:"VCStreamInputDidSuspend" weakSelf:v3 block:&__block_literal_global_86];
  [(AVCStreamInput *)self registerService:"VCStreamInputDidResume" weakSelf:v3 block:&__block_literal_global_89];

  [(AVCStreamInput *)self registerDidServerDieBlock:v3];
}

uint64_t __47__AVCStreamInput_registerBlocksForNotification__block_invoke(uint64_t a1, void *a2)
{
  return [a2 didStart];
}

uint64_t __47__AVCStreamInput_registerBlocksForNotification__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 didStop];
}

uint64_t __47__AVCStreamInput_registerBlocksForNotification__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 didSuspend];
}

uint64_t __47__AVCStreamInput_registerBlocksForNotification__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 didResume];
}

- (void)deregisterBlocksForNotifications
{
  [(AVConferenceXPCClient *)self->_xpcConnection deregisterFromService:"conferenceDidServerDie"];
  [(AVConferenceXPCClient *)self->_xpcConnection deregisterFromService:"VCStreamInputDidStart"];
  [(AVConferenceXPCClient *)self->_xpcConnection deregisterFromService:"VCStreamInputDidStop"];
  [(AVConferenceXPCClient *)self->_xpcConnection deregisterFromService:"VCStreamInputDidSuspend"];
  xpcConnection = self->_xpcConnection;

  [(AVConferenceXPCClient *)xpcConnection deregisterFromService:"VCStreamInputDidResume"];
}

- (BOOL)sendSampleBufferOverXPC:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  xpcQueue = self->_xpcQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__AVCStreamInput_sendSampleBufferOverXPC_error___block_invoke;
  v7[3] = &unk_1E6DB7008;
  v7[5] = &v8;
  v7[6] = a3;
  v7[4] = self;
  dispatch_sync(xpcQueue, v7);
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __48__AVCStreamInput_sendSampleBufferOverXPC_error___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = VCStreamInputUtil_EncodeSampleBuffer(*(opaqueCMSampleBuffer **)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = *(void **)(v3 + 8);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__AVCStreamInput_sendSampleBufferOverXPC_error___block_invoke_92;
    v10[3] = &unk_1E6DB4338;
    v10[4] = v3;
    [v4 sendMessageAsync:"VCStreamInputPushSampleBuffer" arguments:0 xpcArguments:v2 reply:v10 queue:0 replyLogLevel:8];
    xpc_release(v2);
    char v5 = 1;
  }
  else
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __48__AVCStreamInput_sendSampleBufferOverXPC_error___block_invoke_cold_1();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v6 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        uint64_t v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v9 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 136316162;
          uint64_t v12 = v7;
          __int16 v13 = 2080;
          int v14 = "-[AVCStreamInput sendSampleBufferOverXPC:error:]_block_invoke";
          __int16 v15 = 1024;
          int v16 = 626;
          __int16 v17 = 2112;
          uint64_t v18 = v6;
          __int16 v19 = 2048;
          uint64_t v20 = v9;
          _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, "AVCStreamInput [%s] %s:%d %@(%p) could not create XPC dictionary for AVCStreamInput", buf, 0x30u);
        }
      }
    }
    char v5 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
}

void __48__AVCStreamInput_sendSampleBufferOverXPC_error___block_invoke_92(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __48__AVCStreamInput_sendSampleBufferOverXPC_error___block_invoke_92_cold_1();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        char v5 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        char v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v8 = *(void *)(a1 + 32);
          int v9 = 136316418;
          uint64_t v10 = v6;
          __int16 v11 = 2080;
          uint64_t v12 = "-[AVCStreamInput sendSampleBufferOverXPC:error:]_block_invoke";
          __int16 v13 = 1024;
          int v14 = 633;
          __int16 v15 = 2112;
          int v16 = v5;
          __int16 v17 = 2048;
          uint64_t v18 = v8;
          __int16 v19 = 2112;
          uint64_t v20 = a3;
          _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, "AVCStreamInput [%s] %s:%d %@(%p) Failed to submit frame. error=%@", (uint8_t *)&v9, 0x3Au);
        }
      }
    }
  }
}

- (BOOL)pushSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  if (*(double *)&a3 == 0.0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCStreamInput pushSampleBuffer:error:]();
      }
    }
    return 0;
  }
  CFNumberRef v7 = (const __CFNumber *)CMGetAttachment(a3, @"tileIndex", 0);
  if (self->_requireTileIndexAttachment && v7 == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCStreamInput pushSampleBuffer:error:]();
      }
    }
    return 0;
  }
  CFNumberRef v9 = v7;
  if (self->_printSampleBufferDetailsEnabled)
  {
    FormatDescription = CMSampleBufferGetFormatDescription(a3);
    if (CMFormatDescriptionGetMediaType(FormatDescription) == 1835365473)
    {
      char v77 = -86;
      *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v75 = v11;
      long long v76 = v11;
      long long valuePtr = v11;
      long long v74 = v11;
      DataBuffer = CMSampleBufferGetDataBuffer(a3);
      VideoUtil_BlockBufferToString(DataBuffer, (char *)&valuePtr, 65);
      if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
        goto LABEL_26;
      }
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      int v14 = *MEMORY[0x1E4F47A50];
      __int16 v15 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_26;
        }
        *(double *)&int v16 = COERCE_DOUBLE(CMBlockBufferGetDataLength(DataBuffer));
        LODWORD(buf.value) = 136316930;
        *(CMTimeValue *)((char *)&buf.value + 4) = v13;
        LOWORD(buf.flags) = 2080;
        *(void *)((char *)&buf.flags + 2) = "_AVCStreamInput_PrintSampleBufferDetails";
        HIWORD(buf.epoch) = 1024;
        int v79 = 98;
        __int16 v80 = 2048;
        v81 = self;
        __int16 v82 = 2080;
        streamInputIDString = self->_streamInputIDString;
        __int16 v84 = 2048;
        double v85 = *(double *)&v16;
        __int16 v86 = 2080;
        *(void *)v87 = &valuePtr;
        *(_WORD *)&v87[8] = 2112;
        *(void *)&v87[10] = a3;
        __int16 v17 = "AVCStreamInput [%s] %s:%d streamInput=%p streamInputID=%s length=%zu data=%s sampleBuffer=%@";
        uint64_t v18 = v14;
        uint32_t v19 = 78;
LABEL_22:
        _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&buf, v19);
        goto LABEL_26;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(double *)&uint64_t v23 = COERCE_DOUBLE(CMBlockBufferGetDataLength(DataBuffer));
        LODWORD(buf.value) = 136316930;
        *(CMTimeValue *)((char *)&buf.value + 4) = v13;
        LOWORD(buf.flags) = 2080;
        *(void *)((char *)&buf.flags + 2) = "_AVCStreamInput_PrintSampleBufferDetails";
        HIWORD(buf.epoch) = 1024;
        int v79 = 98;
        __int16 v80 = 2048;
        v81 = self;
        __int16 v82 = 2080;
        streamInputIDString = self->_streamInputIDString;
        __int16 v84 = 2048;
        double v85 = *(double *)&v23;
        __int16 v86 = 2080;
        *(void *)v87 = &valuePtr;
        *(_WORD *)&v87[8] = 2112;
        *(void *)&v87[10] = a3;
        __int16 v24 = "AVCStreamInput [%s] %s:%d streamInput=%p streamInputID=%s length=%zu data=%s sampleBuffer=%@";
        uint32_t v25 = v14;
        uint32_t v26 = 78;
LABEL_82:
        _os_log_debug_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEBUG, v24, (uint8_t *)&buf, v26);
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
        goto LABEL_26;
      }
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      uint64_t v21 = *MEMORY[0x1E4F47A50];
      uint64_t v22 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_26;
        }
        LODWORD(buf.value) = 136316418;
        *(CMTimeValue *)((char *)&buf.value + 4) = v20;
        LOWORD(buf.flags) = 2080;
        *(void *)((char *)&buf.flags + 2) = "_AVCStreamInput_PrintSampleBufferDetails";
        HIWORD(buf.epoch) = 1024;
        int v79 = 100;
        __int16 v80 = 2048;
        v81 = self;
        __int16 v82 = 2080;
        streamInputIDString = self->_streamInputIDString;
        __int16 v84 = 2112;
        double v85 = *(double *)&a3;
        __int16 v17 = "AVCStreamInput [%s] %s:%d streamInput=%p streamInputID=%s sampleBuffer=%@";
        uint64_t v18 = v21;
        uint32_t v19 = 58;
        goto LABEL_22;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf.value) = 136316418;
        *(CMTimeValue *)((char *)&buf.value + 4) = v20;
        LOWORD(buf.flags) = 2080;
        *(void *)((char *)&buf.flags + 2) = "_AVCStreamInput_PrintSampleBufferDetails";
        HIWORD(buf.epoch) = 1024;
        int v79 = 100;
        __int16 v80 = 2048;
        v81 = self;
        __int16 v82 = 2080;
        streamInputIDString = self->_streamInputIDString;
        __int16 v84 = 2112;
        double v85 = *(double *)&a3;
        __int16 v24 = "AVCStreamInput [%s] %s:%d streamInput=%p streamInputID=%s sampleBuffer=%@";
        uint32_t v25 = v21;
        uint32_t v26 = 58;
        goto LABEL_82;
      }
    }
  }
LABEL_26:
  if (!self->_isStarted)
  {
    if ((AVCStreamInput *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v49 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          -[AVCStreamInput pushSampleBuffer:error:](v49, (uint64_t)self);
          if (a4)
          {
LABEL_52:
            BOOL v52 = 0;
            *a4 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"AVCInputStream" code:-2143617007 userInfo:0];
            return v52;
          }
          return 0;
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v41 = (__CFString *)[(AVCStreamInput *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v41 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v50 = VRTraceErrorLogLevelToCSTR();
        v51 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(double *)&v68 = COERCE_DOUBLE(AVCStreamInputID_ConvertToNSString(self->_streamInputID));
          LODWORD(buf.value) = 136316418;
          *(CMTimeValue *)((char *)&buf.value + 4) = v50;
          LOWORD(buf.flags) = 2080;
          *(void *)((char *)&buf.flags + 2) = "-[AVCStreamInput pushSampleBuffer:error:]";
          HIWORD(buf.epoch) = 1024;
          int v79 = 657;
          __int16 v80 = 2112;
          v81 = v41;
          __int16 v82 = 2048;
          streamInputIDString = self;
          __int16 v84 = 2112;
          double v85 = *(double *)&v68;
          _os_log_error_impl(&dword_1E1EA4000, v51, OS_LOG_TYPE_ERROR, "AVCStreamInput [%s] %s:%d %@(%p) streamInputID=%@ Buffer pushed before streamInput was started", (uint8_t *)&buf, 0x3Au);
          if (a4) {
            goto LABEL_52;
          }
          return 0;
        }
      }
    }
    if (a4) {
      goto LABEL_52;
    }
    return 0;
  }
  uint64_t v27 = CMSampleBufferGetFormatDescription(a3);
  CMMediaType MediaType = CMFormatDescriptionGetMediaType(v27);
  CMFormatDescriptionGetMediaSubType(v27);
  memset(&v71, 170, sizeof(v71));
  CMSampleBufferGetPresentationTimeStamp(&v71, a3);
  CMTime buf = v71;
  CMTimeGetSeconds(&buf);
  kdebug_trace();
  if (v9)
  {
    LODWORD(valuePtr) = 0;
    CFNumberGetValue(v9, kCFNumberIntType, &valuePtr);
    if (valuePtr <= 1)
    {
      CMTime buf = v71;
      _AVCStreamInput_ComputeStats((uint64_t)self, a3, MediaType, (long long *)&buf.value, (uint64_t)&self->_payloadStats.lastSampleBufferTime.epoch + 32 * valuePtr + 4);
    }
  }
  CMTime buf = v71;
  _AVCStreamInput_ComputeStats((uint64_t)self, a3, MediaType, (long long *)&buf.value, (uint64_t)(&self->_senderQueueLock + 1));
  CMTime v70 = v71;
  v29 = &self->_isStarted + 4;
  if ((self->_lastHealthPrintTime.timescale & 1) == 0
    || (memset(&buf, 170, sizeof(buf)),
        long long valuePtr = *(_OWORD *)&v71.value,
        *(void *)&long long v74 = v71.epoch,
        *(_OWORD *)&rhs.value = *(_OWORD *)v29,
        rhs.epoch = *(void *)&self->_lastHealthPrintTime.flags,
        CMTimeSubtract(&buf, (CMTime *)&valuePtr, &rhs),
        (double)buf.value / (double)buf.timescale > 5.0))
  {
    if (MediaType == 1835365473)
    {
      BOOL requireTileIndexAttachment = self->_requireTileIndexAttachment;
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (requireTileIndexAttachment)
      {
        if (ErrorLogLevelForModule >= 6)
        {
          uint64_t v32 = VRTraceErrorLogLevelToCSTR();
          long long v33 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v34 = FourccToCStr(1835365473);
            double v35 = (float)(*(float *)&self->_payloadStats.lastSampleBufferTime.epoch / 1000.0);
            int v36 = *((_DWORD *)&self->_senderQueueLock + 1);
            double v37 = (float)(*(float *)&self->_tileIndexStats[0].lastSampleBufferTime.timescale / 1000.0);
            int epoch_high = HIDWORD(self->_payloadStats.lastSampleBufferTime.epoch);
            LODWORD(buf.value) = 136317698;
            float v39 = *(float *)&self->_tileIndexStats[1].lastSampleBufferTime.value;
            unsigned int flags = self->_tileIndexStats[0].lastSampleBufferTime.flags;
            *(CMTimeValue *)((char *)&buf.value + 4) = v32;
            LOWORD(buf.flags) = 2080;
            *(void *)((char *)&buf.flags + 2) = "_AVCStreamInput_DisplayHealthInfo";
            HIWORD(buf.epoch) = 1024;
            int v79 = 450;
            __int16 v80 = 2080;
            v81 = self->_streamInputIDString;
            __int16 v82 = 2080;
            streamInputIDString = v34;
            __int16 v84 = 2048;
            double v85 = v35;
            __int16 v86 = 1024;
            *(_DWORD *)v87 = v36;
            *(_WORD *)&v87[4] = 2048;
            *(double *)&v87[6] = v37;
            *(_WORD *)&v87[14] = 1024;
            *(_DWORD *)&v87[16] = epoch_high;
            __int16 v88 = 2048;
            double v89 = (float)(v39 / 1000.0);
            __int16 v90 = 1024;
            unsigned int v91 = flags;
            _os_log_impl(&dword_1E1EA4000, v33, OS_LOG_TYPE_DEFAULT, "AVCStreamInput [%s] %s:%d @=@ Health: AVCStreamInput AVCStreamInputID=%s mediaType=%s averageBitrate=%0.2fkbps sampleBufferCount=%d tileStats=[ [%0.2fkbps, %d], [%0.2fkbps, %d] ]", (uint8_t *)&buf, 0x60u);
          }
        }
        HIDWORD(self->_payloadStats.lastSampleBufferTime.epoch) = 0;
        self->_tileIndexStats[0].lastSampleBufferTime.unsigned int flags = 0;
        goto LABEL_57;
      }
      if (ErrorLogLevelForModule < 6
        || (uint64_t v53 = VRTraceErrorLogLevelToCSTR(),
            __int16 v54 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_57:
        *(_OWORD *)v29 = *(_OWORD *)&v70.value;
        *(void *)&self->_lastHealthPrintTime.unsigned int flags = v70.epoch;
        *((_DWORD *)&self->_senderQueueLock + 1) = 0;
        goto LABEL_58;
      }
      int v55 = FourccToCStr(1835365473);
      float v56 = *(float *)&self->_payloadStats.lastSampleBufferTime.epoch;
      LODWORD(buf.value) = 136316674;
      int v57 = *((_DWORD *)&self->_senderQueueLock + 1);
      *(CMTimeValue *)((char *)&buf.value + 4) = v53;
      LOWORD(buf.flags) = 2080;
      *(void *)((char *)&buf.flags + 2) = "_AVCStreamInput_DisplayHealthInfo";
      HIWORD(buf.epoch) = 1024;
      int v79 = 454;
      __int16 v80 = 2080;
      v81 = self->_streamInputIDString;
      __int16 v82 = 2080;
      streamInputIDString = v55;
      __int16 v84 = 2048;
      double v85 = (float)(v56 / 1000.0);
      __int16 v86 = 1024;
      *(_DWORD *)v87 = v57;
      __int16 v46 = "AVCStreamInput [%s] %s:%d @=@ Health: AVCStreamInput AVCStreamInputID=%s mediaType=%s averageBitrate=%0.2fkb"
            "ps sampleBufferCount=%d";
      v47 = v54;
      uint32_t v48 = 64;
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_57;
      }
      uint64_t v42 = VRTraceErrorLogLevelToCSTR();
      v43 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_57;
      }
      __int16 v44 = FourccToCStr(MediaType);
      int v45 = *((_DWORD *)&self->_senderQueueLock + 1);
      LODWORD(buf.value) = 136316418;
      *(CMTimeValue *)((char *)&buf.value + 4) = v42;
      LOWORD(buf.flags) = 2080;
      *(void *)((char *)&buf.flags + 2) = "_AVCStreamInput_DisplayHealthInfo";
      HIWORD(buf.epoch) = 1024;
      int v79 = 457;
      __int16 v80 = 2080;
      v81 = self->_streamInputIDString;
      __int16 v82 = 2080;
      streamInputIDString = v44;
      __int16 v84 = 1024;
      LODWORD(v85) = v45;
      __int16 v46 = "AVCStreamInput [%s] %s:%d @=@ Health: AVCStreamInput AVCStreamInputID=%s mediaType=%s sampleBufferCount=%d";
      v47 = v43;
      uint32_t v48 = 54;
    }
    _os_log_impl(&dword_1E1EA4000, v47, OS_LOG_TYPE_DEFAULT, v46, (uint8_t *)&buf, v48);
    goto LABEL_57;
  }
LABEL_58:
  os_unfair_lock_lock(&self->_senderQueueLock);
  if (self->_useFigRemoteQueue) {
    BOOL v52 = VCRemoteImageQueue_EnqueueFrame((uint64_t)self->_senderQueue, (unint64_t)a3) == 0;
  }
  else {
    BOOL v52 = [(AVCStreamInput *)self sendSampleBufferOverXPC:a3 error:a4];
  }
  os_unfair_lock_unlock(&self->_senderQueueLock);
  if ((AVCStreamInput *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v59 = VRTraceErrorLogLevelToCSTR();
      v60 = *MEMORY[0x1E4F47A50];
      v61 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.value) = 136315906;
          *(CMTimeValue *)((char *)&buf.value + 4) = v59;
          LOWORD(buf.flags) = 2080;
          *(void *)((char *)&buf.flags + 2) = "-[AVCStreamInput pushSampleBuffer:error:]";
          HIWORD(buf.epoch) = 1024;
          int v79 = 700;
          __int16 v80 = 2112;
          v81 = a3;
          v62 = "AVCStreamInput [%s] %s:%d Pushing sampleBuffer=%@";
          v63 = v60;
          uint32_t v64 = 38;
LABEL_73:
          _os_log_impl(&dword_1E1EA4000, v63, OS_LOG_TYPE_DEFAULT, v62, (uint8_t *)&buf, v64);
        }
      }
      else if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
      {
        -[AVCStreamInput pushSampleBuffer:error:].cold.4();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v58 = (__CFString *)[(AVCStreamInput *)self performSelector:sel_logPrefix];
    }
    else {
      v58 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v65 = VRTraceErrorLogLevelToCSTR();
      v66 = *MEMORY[0x1E4F47A50];
      v67 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.value) = 136316418;
          *(CMTimeValue *)((char *)&buf.value + 4) = v65;
          LOWORD(buf.flags) = 2080;
          *(void *)((char *)&buf.flags + 2) = "-[AVCStreamInput pushSampleBuffer:error:]";
          HIWORD(buf.epoch) = 1024;
          int v79 = 700;
          __int16 v80 = 2112;
          v81 = v58;
          __int16 v82 = 2048;
          streamInputIDString = self;
          __int16 v84 = 2112;
          double v85 = *(double *)&a3;
          v62 = "AVCStreamInput [%s] %s:%d %@(%p) Pushing sampleBuffer=%@";
          v63 = v66;
          uint32_t v64 = 58;
          goto LABEL_73;
        }
      }
      else if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf.value) = 136316418;
        *(CMTimeValue *)((char *)&buf.value + 4) = v65;
        LOWORD(buf.flags) = 2080;
        *(void *)((char *)&buf.flags + 2) = "-[AVCStreamInput pushSampleBuffer:error:]";
        HIWORD(buf.epoch) = 1024;
        int v79 = 700;
        __int16 v80 = 2112;
        v81 = v58;
        __int16 v82 = 2048;
        streamInputIDString = self;
        __int16 v84 = 2112;
        double v85 = *(double *)&a3;
        _os_log_debug_impl(&dword_1E1EA4000, v66, OS_LOG_TYPE_DEBUG, "AVCStreamInput [%s] %s:%d %@(%p) Pushing sampleBuffer=%@", (uint8_t *)&buf, 0x3Au);
      }
    }
  }
  return v52;
}

- (id)description
{
  id result = self->_description;
  if (!result)
  {
    uint64_t v4 = NSString;
    char v5 = (objc_class *)objc_opt_class();
    id result = (id)[v4 stringWithFormat:@"%@(%p) streamInputID=%ld", NSStringFromClass(v5), self, self->_streamInputID];
    self->_description = (NSString *)result;
  }
  return result;
}

- (int64_t)streamInputID
{
  return self->_streamInputID;
}

- (opaqueCMFormatDescription)formatDescription
{
  return self->_formatDescription;
}

- (OS_dispatch_queue)xpcQueue
{
  return self->_xpcQueue;
}

- (__CFAllocator)sampleBufferAllocator
{
  return self->_sampleBufferAllocator;
}

- (void)processOptions:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCStreamInput [%s] %s:%d Invalid sample buffer pool size", v2, v3, v4, v5, v6);
}

- (void)processOptions:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCStreamInput [%s] %s:%d Invalid ID", v2, v3, v4, v5, v6);
}

- (void)processFormat:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCStreamInput [%s] %s:%d Provided format is NULL", v2, v3, v4, v5, v6);
}

- (void)processFormat:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCStreamInput [%s] %s:%d Provided format is invalid", v2, v3, v4, v5, v6);
}

- (void)setupDelegate:delegateQueue:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCStreamInput [%s] %s:%d No delegate specified", v2, v3, v4, v5, v6);
}

- (void)setupDelegate:delegateQueue:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCStreamInput [%s] %s:%d Delegate queue is NULL", v2, v3, v4, v5, v6);
}

- (void)setupXPCQueue
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCStreamInput [%s] %s:%d Failed to create the XPC connection queue", v2, v3, v4, v5, v6);
}

- (void)newRemoteQueueWithServerPid:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCStreamInput [%s] %s:%d Could not get the shared pool allocator for the _senderQueue", v2, v3, v4, v5, v6);
}

- (void)newRemoteQueueWithServerPid:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCStreamInput [%s] %s:%d RemoteImageQueue failed to create sender xpc object", v2, v3, v4, v5, v6);
}

- (void)newRemoteQueueWithServerPid:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCStreamInput [%s] %s:%d RemoteImageQueue could not be made on StreamInput client", v2, v3, v4, v5, v6);
}

- (void)setupXPCConnection
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCStreamInput [%s] %s:%d Failed to allocate the XPC connection", v2, v3, v4, v5, v6);
}

- (void)createAndAddRemoteQueueToXPCDictionary:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCStreamInput [%s] %s:%d Failed to create remote queue", v2, v3, v4, v5, v6);
}

- (void)createAndAddRemoteQueueToXPCDictionary:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_13_8();
  OUTLINED_FUNCTION_4_3(&dword_1E1EA4000, v0, v1, "AVCStreamInput [%s] %s:%d Message=%s returned with an error=%@");
}

- (void)initializeServerSideInputStream
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCStreamInput [%s] %s:%d RemoteQueue creation and adding to XPC dictionary failed", v2, v3, v4, v5, v6);
}

void __30__AVCStreamInput_didServerDie__block_invoke_cold_1()
{
  int v2 = 136315906;
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_8_11();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "AVCStreamInput [%s] %s:%d AVCStreamInputID=%s server died, notifying client", v2, v3, v4, v5);
}

void __30__AVCStreamInput_didServerDie__block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315906;
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_8_11();
  _os_log_fault_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_FAULT, "AVCStreamInput [%s] %s:%d AVCStreamInputID=%s server died, notifying client", (uint8_t *)v1, 0x26u);
}

void __48__AVCStreamInput_sendSampleBufferOverXPC_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCStreamInput [%s] %s:%d could not create XPC dictionary for AVCStreamInput", v2, v3, v4, v5, v6);
}

void __48__AVCStreamInput_sendSampleBufferOverXPC_error___block_invoke_92_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "AVCStreamInput [%s] %s:%d Failed to submit frame. error=%@");
}

- (void)pushSampleBuffer:error:.cold.1()
{
  int v2 = 136316162;
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_6_14();
  OUTLINED_FUNCTION_4_3(&dword_1E1EA4000, v0, v1, "AVCStreamInput [%s] %s:%d streamInput=%p streamInputID=%s sampleBuffer is NULL", v2, v3, v4, v5, v6);
}

- (void)pushSampleBuffer:error:.cold.2()
{
  int v2 = 136316162;
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_6_14();
  OUTLINED_FUNCTION_4_3(&dword_1E1EA4000, v0, v1, "AVCStreamInput [%s] %s:%d streamInput=%p streamInputID=%s missing tile index", v2, v3, v4, v5, v6);
}

- (void)pushSampleBuffer:(uint64_t)a1 error:(uint64_t)a2 .cold.3(uint64_t a1, uint64_t a2)
{
  AVCStreamInputID_ConvertToNSString(*(void *)(a2 + 40));
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, "AVCStreamInput [%s] %s:%d streamInputID=%@ Buffer pushed before streamInput was started", v4, v5, v6, v7, v8);
}

- (void)pushSampleBuffer:error:.cold.4()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v2 = "-[AVCStreamInput pushSampleBuffer:error:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, "AVCStreamInput [%s] %s:%d Pushing sampleBuffer=%@", v1, 0x26u);
}

@end