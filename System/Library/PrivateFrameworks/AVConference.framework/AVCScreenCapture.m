@interface AVCScreenCapture
+ (unsigned)capabilities;
+ (unsigned)captureCapabilities;
- (AVCScreenCapture)initWithDelegate:(id)a3 withConfig:(id)a4;
- (AVCScreenCaptureDelegate)delegate;
- (id)newNSErrorWithErrorDictionary:(id)a3;
- (id)updateScreenCaptureWithConfig:(id)a3;
- (int64_t)captureSourceID;
- (void)dealloc;
- (void)deregisterBlocksForNotifications;
- (void)registerBlocksForNotifications;
- (void)reportScreenShareIsStarting:(BOOL)a3;
- (void)startCapture;
- (void)stopCapture;
@end

@implementation AVCScreenCapture

+ (unsigned)capabilities
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int64_t v2 = +[VCHardwareSettings screenShareCapabilities];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      v9 = "+[AVCScreenCapture capabilities]";
      __int16 v10 = 1024;
      int v11 = 51;
      __int16 v12 = 2048;
      int64_t v13 = v2;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d screen capture capability: %ld", (uint8_t *)&v6, 0x26u);
    }
  }
  if (v2 == 1) {
    return 1;
  }
  else {
    return 2 * (v2 == 2);
  }
}

+ (unsigned)captureCapabilities
{
  return +[AVCScreenCapture capabilities];
}

- (AVCScreenCapture)initWithDelegate:(id)a3 withConfig:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    __int16 v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v30 = v7;
      __int16 v31 = 2080;
      v32 = "-[AVCScreenCapture initWithDelegate:withConfig:]";
      __int16 v33 = 1024;
      int v34 = 69;
      __int16 v35 = 2112;
      id v36 = a3;
      __int16 v37 = 2112;
      id v38 = a4;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d inDelegate=%@ config=%@", buf, 0x30u);
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)AVCScreenCapture;
  v9 = [(AVCScreenCapture *)&v25 init];
  if (v9)
  {
    *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v28[0] = v10;
    v28[1] = v10;
    VCUtil_AuditTokenForCurrentProcess(v28);
    int v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v28 length:32];
    uint64_t v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
    v26[0] = @"vcScreenCaptureXpcAuthToken";
    v26[1] = @"vcScreenCaptureClientBundleID";
    v27[0] = v11;
    v27[1] = v12;
    v26[2] = @"vcScreenCaptureHeight";
    v27[2] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a4, "height"));
    v26[3] = @"vcScreenCaptureWidth";
    v27[3] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a4, "width"));
    v26[4] = @"vcScreenCaptureFramerate";
    v27[4] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a4, "frameRate"));
    v26[5] = @"vcScreenCaptureScreenDisplayID";
    v27[5] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a4, "screenCaptureDisplayID"));
    v26[6] = @"vcScreenCaptureScreenDisplayMode";
    v27[6] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a4, "displayMode"));
    v26[7] = @"vcScreenCaptureScreenIsWindowed";
    v27[7] = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a4, "isWindowed"));
    v26[8] = @"vcScreenCaptureScreenMachPort";
    v27[8] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a4, "selectiveSharingPort"));
    v26[9] = @"vcScreenCaptureScreenUUID";
    if ([a4 selectiveScreenUUID]) {
      uint64_t v13 = [a4 selectiveScreenUUID];
    }
    else {
      uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
    }
    v27[9] = v13;
    v26[10] = @"vcScreenCaptureIsCursorCaptured";
    v27[10] = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a4, "isCursorCaptured"));
    v26[11] = @"vcScreenCaptureCaptureExcludedBundleIDs";
    if ([a4 excludedApplicationBundleIDs]
      && objc_msgSend((id)objc_msgSend(a4, "excludedApplicationBundleIDs"), "count"))
    {
      uint64_t v14 = [a4 excludedApplicationBundleIDs];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
    }
    v27[11] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:12];
    v9->_isInProcess = [a4 shouldRunInProcess];
    objc_storeWeak(&v9->_delegate, a3);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
    dispatch_queue_t v17 = dispatch_queue_create_with_target_V2("com.apple.AVConference.screenCapture", 0, CustomRootQueue);
    v9->_avConferenceScreenCaptureQueue = (OS_dispatch_queue *)v17;
    if (v17)
    {
      if (v9->_isInProcess)
      {
        uint64_t v18 = [NSNumber numberWithInt:getpid()];
        if (v18)
        {
          v19 = (VCScreenShare *)objc_msgSend(+[VCScreenCaptureManager sharedManager](VCScreenCaptureManager, "sharedManager"), "newScreenShareWithConfig:pid:", v15, v18);
          v9->_screenShare = v19;
          if (v19)
          {
            v9->_captureSourceID = [(VCScreenShare *)v19 captureSourceID];
LABEL_24:

            return v9;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[AVCScreenCapture initWithDelegate:withConfig:].cold.5();
            }
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVCScreenCapture initWithDelegate:withConfig:].cold.4();
          }
        }
      }
      else
      {
        v20 = objc_alloc_init(AVConferenceXPCClient);
        v9->_connection = v20;
        if (v20)
        {
          id v21 = [(AVConferenceXPCClient *)v20 sendMessageSync:"vcScreenCaptureInitialize" arguments:v15];
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            uint64_t v22 = VRTraceErrorLogLevelToCSTR();
            v23 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              uint64_t v30 = v22;
              __int16 v31 = 2080;
              v32 = "-[AVCScreenCapture initWithDelegate:withConfig:]";
              __int16 v33 = 1024;
              int v34 = 108;
              __int16 v35 = 2112;
              id v36 = v21;
              _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Results from initialization: %@", buf, 0x26u);
            }
          }
          if (v21 && ![v21 objectForKeyedSubscript:@"ERROR"])
          {
            v9->_captureSourceID = objc_msgSend((id)objc_msgSend(v21, "objectForKeyedSubscript:", @"vcScreenCaptureCaptureSourceID"), "integerValue");
            [(AVCScreenCapture *)v9 registerBlocksForNotifications];
            goto LABEL_24;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[AVCScreenCapture initWithDelegate:withConfig:]();
            }
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVCScreenCapture initWithDelegate:withConfig:]();
          }
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCScreenCapture initWithDelegate:withConfig:]();
      }
    }

    return 0;
  }
  return v9;
}

- (void)dealloc
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v16 = v5;
      __int16 v17 = 2080;
      uint64_t v18 = "-[AVCScreenCapture dealloc]";
      __int16 v19 = 1024;
      int v20 = 128;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Begin", buf, 0x1Cu);
    }
  }
  if (self->_isInProcess)
  {
    p_screenShare = (id *)&self->_screenShare;
    objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "stopScreenShareCapture:", -[VCScreenShare captureSourceID](self->_screenShare, "captureSourceID"));
  }
  else
  {
    [(AVCScreenCapture *)self deregisterBlocksForNotifications];
    p_screenShare = (id *)&self->_connection;
    id v8 = [(AVConferenceXPCClient *)self->_connection sendMessageSync:"vcScreenCaptureTerminate"];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      long long v10 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v16 = v9;
        __int16 v17 = 2080;
        uint64_t v18 = "-[AVCScreenCapture dealloc]";
        __int16 v19 = 1024;
        int v20 = 137;
        __int16 v21 = 2112;
        id v22 = v8;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Results from termination: %@", buf, 0x26u);
      }
    }
  }

  avConferenceScreenCaptureQueue = self->_avConferenceScreenCaptureQueue;
  if (avConferenceScreenCaptureQueue)
  {
    dispatch_release(avConferenceScreenCaptureQueue);
    self->_avConferenceScreenCaptureQueue = 0;
  }
  objc_storeWeak(&self->_delegate, 0);
  v14.receiver = self;
  v14.super_class = (Class)AVCScreenCapture;
  [(AVCScreenCapture *)&v14 dealloc];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint64_t v13 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v16 = v12;
      __int16 v17 = 2080;
      uint64_t v18 = "-[AVCScreenCapture dealloc]";
      __int16 v19 = 1024;
      int v20 = 143;
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d End", buf, 0x1Cu);
    }
  }
}

- (AVCScreenCaptureDelegate)delegate
{
  return (AVCScreenCaptureDelegate *)objc_loadWeak(&self->_delegate);
}

- (id)newNSErrorWithErrorDictionary:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v5 = [a3 objectForKeyedSubscript:@"ERROR_DOMAIN"];
  uint64_t v6 = (int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"ERROR_CODE"), "intValue");
  uint64_t v7 = [a3 objectForKeyedSubscript:@"ERROR_USERINFO"];

  return (id)[v4 initWithDomain:v5 code:v6 userInfo:v7];
}

- (void)registerBlocksForNotifications
{
  v8[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__AVCScreenCapture_registerBlocksForNotifications__block_invoke;
  v8[3] = &unk_1E6DB4338;
  v8[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcScreenCaptureServerDidDisconnect" block:v8 queue:self->_avConferenceScreenCaptureQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__AVCScreenCapture_registerBlocksForNotifications__block_invoke_78;
  v7[3] = &unk_1E6DB4338;
  v7[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcScreenCaptureStartReturn" block:v7 queue:self->_avConferenceScreenCaptureQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__AVCScreenCapture_registerBlocksForNotifications__block_invoke_88;
  v6[3] = &unk_1E6DB4338;
  v6[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcScreenCaptureStopReturn" block:v6 queue:self->_avConferenceScreenCaptureQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__AVCScreenCapture_registerBlocksForNotifications__block_invoke_98;
  v5[3] = &unk_1E6DB4338;
  v5[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcScreenCaptureDidUpdateAttributes" block:v5 queue:self->_avConferenceScreenCaptureQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__AVCScreenCapture_registerBlocksForNotifications__block_invoke_103;
  v4[3] = &unk_1E6DB4338;
  v4[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcScreenCaptureScreenDidClear" block:v4 queue:self->_avConferenceScreenCaptureQueue];
}

uint64_t __50__AVCScreenCapture_registerBlocksForNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t result = [a2 objectForKeyedSubscript:@"SERVERDIED"];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 32) strong];
    if (result)
    {
      id v4 = (void *)result;
      [(id)result delegate];
      uint64_t result = objc_opt_respondsToSelector();
      if (result)
      {
        if (objc_opt_class() == v4)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(void *)&v13[16], v14, v15), "serverDidDisconnect:", v4);
          }
          uint64_t v6 = VRTraceErrorLogLevelToCSTR();
          uint64_t v7 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(void *)&v13[16], v14, v15), "serverDidDisconnect:", v4);
          }
          *(_DWORD *)uint64_t v13 = 136315650;
          *(void *)&v13[4] = v6;
          *(_WORD *)&v13[12] = 2080;
          *(void *)&v13[14] = "-[AVCScreenCapture registerBlocksForNotifications]_block_invoke";
          *(_WORD *)&v13[22] = 1024;
          LODWORD(v14) = 169;
          id v8 = " [%s] %s:%d received callback for serverDidDisconnect";
          uint64_t v9 = v7;
          uint32_t v10 = 28;
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            uint64_t v5 = (__CFString *)[v4 performSelector:sel_logPrefix];
          }
          else {
            uint64_t v5 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(void *)&v13[16], v14, v15), "serverDidDisconnect:", v4);
          }
          uint64_t v11 = VRTraceErrorLogLevelToCSTR();
          uint64_t v12 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(void *)&v13[16], v14, v15), "serverDidDisconnect:", v4);
          }
          *(_DWORD *)uint64_t v13 = 136316162;
          *(void *)&v13[4] = v11;
          *(_WORD *)&v13[12] = 2080;
          *(void *)&v13[14] = "-[AVCScreenCapture registerBlocksForNotifications]_block_invoke";
          *(_WORD *)&v13[22] = 1024;
          LODWORD(v14) = 169;
          WORD2(v14) = 2112;
          *(void *)((char *)&v14 + 6) = v5;
          HIWORD(v14) = 2048;
          uint64_t v15 = v4;
          id v8 = " [%s] %s:%d %@(%p) received callback for serverDidDisconnect";
          uint64_t v9 = v12;
          uint32_t v10 = 48;
        }
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, v13, v10);
        return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(void *)&v13[16], v14, v15), "serverDidDisconnect:", v4);
      }
    }
  }
  return result;
}

void __50__AVCScreenCapture_registerBlocksForNotifications__block_invoke_78(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"SERVERDIED"]) {
    return;
  }
  id v4 = (void *)[*(id *)(a1 + 32) strong];
  if (!v4) {
    return;
  }
  uint64_t v5 = v4;
  [v4 delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return;
  }
  if (objc_opt_class() != v5)
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[v5 performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_16;
    }
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint64_t v13 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)uint64_t v18 = 136316162;
    *(void *)&v18[4] = v12;
    *(_WORD *)&v18[12] = 2080;
    *(void *)&v18[14] = "-[AVCScreenCapture registerBlocksForNotifications]_block_invoke";
    *(_WORD *)&v18[22] = 1024;
    LODWORD(v19) = 184;
    WORD2(v19) = 2112;
    *(void *)((char *)&v19 + 6) = v6;
    HIWORD(v19) = 2048;
    int v20 = v5;
    uint64_t v9 = " [%s] %s:%d %@(%p) received callback for screenCapture didStart";
    uint32_t v10 = v13;
    uint32_t v11 = 48;
    goto LABEL_15;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    id v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v18 = 136315650;
      *(void *)&v18[4] = v7;
      *(_WORD *)&v18[12] = 2080;
      *(void *)&v18[14] = "-[AVCScreenCapture registerBlocksForNotifications]_block_invoke";
      *(_WORD *)&v18[22] = 1024;
      LODWORD(v19) = 184;
      uint64_t v9 = " [%s] %s:%d received callback for screenCapture didStart";
      uint32_t v10 = v8;
      uint32_t v11 = 28;
LABEL_15:
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, v18, v11);
    }
  }
LABEL_16:
  uint64_t v14 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcScreenCaptureDidStartSuccess", *(_OWORD *)v18, *(void *)&v18[16], v19, v20), "BOOLValue");
  if (v14) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = objc_msgSend(v5, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", @"vcScreenCaptureDidStartError"));
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    __int16 v17 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v18 = 136315906;
      *(void *)&v18[4] = v16;
      *(_WORD *)&v18[12] = 2080;
      *(void *)&v18[14] = "-[AVCScreenCapture registerBlocksForNotifications]_block_invoke";
      *(_WORD *)&v18[22] = 1024;
      LODWORD(v19) = 191;
      WORD2(v19) = 2112;
      *(void *)((char *)&v19 + 6) = v15;
      _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d capture didStart error=%@", v18, 0x26u);
    }
  }
  objc_msgSend((id)objc_msgSend(v5, "delegate"), "screenCapture:didStart:withError:", v5, v14, v15);
}

void __50__AVCScreenCapture_registerBlocksForNotifications__block_invoke_88(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"SERVERDIED"]) {
    return;
  }
  id v4 = (void *)[*(id *)(a1 + 32) strong];
  if (!v4) {
    return;
  }
  uint64_t v5 = v4;
  [v4 delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return;
  }
  if (objc_opt_class() != v5)
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[v5 performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_16;
    }
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint64_t v13 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)__int16 v17 = 136316162;
    *(void *)&v17[4] = v12;
    *(_WORD *)&v17[12] = 2080;
    *(void *)&v17[14] = "-[AVCScreenCapture registerBlocksForNotifications]_block_invoke";
    *(_WORD *)&v17[22] = 1024;
    LODWORD(v18) = 207;
    WORD2(v18) = 2112;
    *(void *)((char *)&v18 + 6) = v6;
    HIWORD(v18) = 2048;
    long long v19 = v5;
    uint64_t v9 = " [%s] %s:%d %@(%p) received callback for screenCapture didStop";
    uint32_t v10 = v13;
    uint32_t v11 = 48;
    goto LABEL_15;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    id v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v17 = 136315650;
      *(void *)&v17[4] = v7;
      *(_WORD *)&v17[12] = 2080;
      *(void *)&v17[14] = "-[AVCScreenCapture registerBlocksForNotifications]_block_invoke";
      *(_WORD *)&v17[22] = 1024;
      LODWORD(v18) = 207;
      uint64_t v9 = " [%s] %s:%d received callback for screenCapture didStop";
      uint32_t v10 = v8;
      uint32_t v11 = 28;
LABEL_15:
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, v17, v11);
    }
  }
LABEL_16:
  uint64_t v14 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcScreenCaptureDidStopSuccess", *(_OWORD *)v17, *(void *)&v17[16], v18, v19), "BOOLValue");
  uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  if (v15 == [a2 objectForKeyedSubscript:@"vcScreenCaptureDidStopError"]) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = objc_msgSend(v5, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", @"vcScreenCaptureDidStopError"));
  }
  objc_msgSend((id)objc_msgSend(v5, "delegate"), "screenCapture:didStop:withError:", v5, v14, v16);
}

void __50__AVCScreenCapture_registerBlocksForNotifications__block_invoke_98(uint64_t a1, void *a2, __CFString *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v6 = (void *)[*(id *)(a1 + 32) strong];
    if (v6)
    {
      uint64_t v7 = v6;
      [v6 delegate];
      if (objc_opt_respondsToSelector())
      {
        if (objc_opt_class() == v7)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            goto LABEL_16;
          }
          uint64_t v9 = VRTraceErrorLogLevelToCSTR();
          uint32_t v10 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_16;
          }
          int v17 = 136315906;
          uint64_t v18 = v9;
          __int16 v19 = 2080;
          uint64_t v20 = "-[AVCScreenCapture registerBlocksForNotifications]_block_invoke";
          __int16 v21 = 1024;
          int v22 = 229;
          __int16 v23 = 2112;
          v24 = a3;
          uint32_t v11 = " [%s] %s:%d received callback for didUpdateAttributes error=%@";
          uint64_t v12 = v10;
          uint32_t v13 = 38;
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            id v8 = (__CFString *)[v7 performSelector:sel_logPrefix];
          }
          else {
            id v8 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            goto LABEL_16;
          }
          uint64_t v14 = VRTraceErrorLogLevelToCSTR();
          uint64_t v15 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_16;
          }
          int v17 = 136316418;
          uint64_t v18 = v14;
          __int16 v19 = 2080;
          uint64_t v20 = "-[AVCScreenCapture registerBlocksForNotifications]_block_invoke";
          __int16 v21 = 1024;
          int v22 = 229;
          __int16 v23 = 2112;
          v24 = v8;
          __int16 v25 = 2048;
          v26 = v7;
          __int16 v27 = 2112;
          v28 = a3;
          uint32_t v11 = " [%s] %s:%d %@(%p) received callback for didUpdateAttributes error=%@";
          uint64_t v12 = v15;
          uint32_t v13 = 58;
        }
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v17, v13);
LABEL_16:
        uint64_t v16 = [[AVCScreenCaptureAttributes alloc] initWithConfiguration:a2];
        objc_msgSend((id)objc_msgSend(v7, "delegate"), "screenCapture:didUpdateAttributes:error:", v7, v16, a3);
      }
    }
  }
}

uint64_t __50__AVCScreenCapture_registerBlocksForNotifications__block_invoke_103(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t result = [a2 objectForKeyedSubscript:@"SERVERDIED"];
  if (!result)
  {
    uint64_t result = [*(id *)(a1 + 32) strong];
    if (result)
    {
      uint64_t v7 = (void *)result;
      id v8 = (void *)[(id)result delegate];
      uint64_t v9 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcScreenCaptureIsScreenCleared"), "BOOLValue");
      if (objc_opt_class() == v7)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_15;
        }
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        uint64_t v12 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        int v18 = 136316162;
        uint64_t v19 = v11;
        __int16 v20 = 2080;
        __int16 v21 = "-[AVCScreenCapture registerBlocksForNotifications]_block_invoke";
        __int16 v22 = 1024;
        int v23 = 247;
        __int16 v24 = 1024;
        *(_DWORD *)__int16 v25 = v9;
        *(_WORD *)&v25[4] = 2112;
        *(void *)&v25[6] = a3;
        uint32_t v13 = " [%s] %s:%d received callback for isScreenCleared=%d error=%@";
        uint64_t v14 = v12;
        uint32_t v15 = 44;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint32_t v10 = (__CFString *)[v7 performSelector:sel_logPrefix];
        }
        else {
          uint32_t v10 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_15;
        }
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        int v17 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        int v18 = 136316674;
        uint64_t v19 = v16;
        __int16 v20 = 2080;
        __int16 v21 = "-[AVCScreenCapture registerBlocksForNotifications]_block_invoke";
        __int16 v22 = 1024;
        int v23 = 247;
        __int16 v24 = 2112;
        *(void *)__int16 v25 = v10;
        *(_WORD *)&v25[8] = 2048;
        *(void *)&v25[10] = v7;
        __int16 v26 = 1024;
        int v27 = v9;
        __int16 v28 = 2112;
        uint64_t v29 = a3;
        uint32_t v13 = " [%s] %s:%d %@(%p) received callback for isScreenCleared=%d error=%@";
        uint64_t v14 = v17;
        uint32_t v15 = 64;
      }
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v18, v15);
LABEL_15:
      uint64_t result = objc_opt_respondsToSelector();
      if (result) {
        return [v8 screenCapture:v7 screenDidClear:v9];
      }
    }
  }
  return result;
}

- (void)deregisterBlocksForNotifications
{
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcScreenCaptureStopReturn"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcScreenCaptureStartReturn"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcScreenCaptureServerDidDisconnect"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcScreenCaptureDidUpdateAttributes"];
  connection = self->_connection;

  [(AVConferenceXPCClient *)connection deregisterFromService:"vcScreenCaptureScreenDidClear"];
}

- (void)startCapture
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  id v4 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      uint64_t v14 = "-[AVCScreenCapture startCapture]";
      __int16 v15 = 1024;
      int v16 = 268;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d start capture", buf, 0x1Cu);
    }
  }
  avConferenceScreenCaptureQueue = self->_avConferenceScreenCaptureQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__AVCScreenCapture_startCapture__block_invoke;
  block[3] = &unk_1E6DB3DC8;
  block[4] = self;
  dispatch_async(avConferenceScreenCaptureQueue, block);
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVScreenCapture started");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v12 = v8;
      __int16 v13 = 2080;
      uint64_t v14 = "-[AVCScreenCapture startCapture]";
      __int16 v15 = 1024;
      int v16 = 285;
      __int16 v17 = 2048;
      int v18 = self;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVScreenCapture started (%p)", buf, 0x26u);
    }
  }
  [(AVCScreenCapture *)self reportScreenShareIsStarting:1];
}

uint64_t __32__AVCScreenCapture_startCapture__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 32))
  {
    objc_msgSend(+[VCScreenCaptureManager sharedManager](VCScreenCaptureManager, "sharedManager"), "startScreenShare:", *(void *)(*(void *)(a1 + 32) + 40));
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      id v4 = *(void **)(*(void *)(a1 + 32) + 8);
      return objc_msgSend(v4, "screenCapture:didStart:withError:");
    }
  }
  else
  {
    uint64_t v5 = *(void **)(v1 + 16);
    return [v5 sendMessageAsync:"vcScreenCaptureStart" arguments:0 reply:0];
  }
  return result;
}

- (void)stopCapture
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  id v4 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      uint64_t v14 = "-[AVCScreenCapture stopCapture]";
      __int16 v15 = 1024;
      int v16 = 291;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stop capture", buf, 0x1Cu);
    }
  }
  avConferenceScreenCaptureQueue = self->_avConferenceScreenCaptureQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__AVCScreenCapture_stopCapture__block_invoke;
  block[3] = &unk_1E6DB3DC8;
  block[4] = self;
  dispatch_async(avConferenceScreenCaptureQueue, block);
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVScreenCapture stopped");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v12 = v8;
      __int16 v13 = 2080;
      uint64_t v14 = "-[AVCScreenCapture stopCapture]";
      __int16 v15 = 1024;
      int v16 = 309;
      __int16 v17 = 2048;
      int v18 = self;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVScreenCapture stopped (%p)", buf, 0x26u);
    }
  }
  [(AVCScreenCapture *)self reportScreenShareIsStarting:0];
}

uint64_t __31__AVCScreenCapture_stopCapture__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 32))
  {
    objc_msgSend(+[VCScreenCaptureManager sharedManager](VCScreenCaptureManager, "sharedManager"), "stopScreenShare:", *(void *)(*(void *)(a1 + 32) + 40));
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      id v4 = *(void **)(*(void *)(a1 + 32) + 8);
      return objc_msgSend(v4, "screenCapture:didStop:withError:");
    }
  }
  else
  {
    uint64_t v5 = *(void **)(v1 + 16);
    return [v5 sendMessageAsync:"vcScreenCaptureStop" arguments:0 reply:0];
  }
  return result;
}

- (id)updateScreenCaptureWithConfig:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3052000000;
  uint64_t v14 = __Block_byref_object_copy__17;
  __int16 v15 = __Block_byref_object_dispose__17;
  uint64_t v16 = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v18 = v5;
      __int16 v19 = 2080;
      __int16 v20 = "-[AVCScreenCapture updateScreenCaptureWithConfig:]";
      __int16 v21 = 1024;
      int v22 = 316;
      __int16 v23 = 2112;
      id v24 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d config=%@", buf, 0x26u);
    }
  }
  avConferenceScreenCaptureQueue = self->_avConferenceScreenCaptureQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__AVCScreenCapture_updateScreenCaptureWithConfig___block_invoke;
  block[3] = &unk_1E6DB6928;
  block[4] = a3;
  void block[5] = self;
  block[6] = &v11;
  dispatch_sync(avConferenceScreenCaptureQueue, block);
  uint64_t v8 = (void *)v12[5];
  _Block_object_dispose(&v11, 8);
  return v8;
}

void __50__AVCScreenCapture_updateScreenCaptureWithConfig___block_invoke(uint64_t a1)
{
  v42[9] = *MEMORY[0x1E4F143B8];
  v41[0] = @"vcScreenCaptureHeight";
  int64_t v2 = (id *)(a1 + 32);
  v42[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 32), "height"));
  v41[1] = @"vcScreenCaptureWidth";
  v42[1] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*v2, "width"));
  v41[2] = @"vcScreenCaptureFramerate";
  v42[2] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*v2, "frameRate"));
  v41[3] = @"vcScreenCaptureScreenDisplayID";
  v42[3] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*v2, "screenCaptureDisplayID"));
  v41[4] = @"vcScreenCaptureScreenIsWindowed";
  v42[4] = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*v2, "isWindowed"));
  v41[5] = @"vcScreenCaptureScreenMachPort";
  v42[5] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*v2, "selectiveSharingPort"));
  v41[6] = @"vcScreenCaptureScreenUUID";
  if ([*v2 selectiveScreenUUID]) {
    uint64_t v3 = [*v2 selectiveScreenUUID];
  }
  else {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v42[6] = v3;
  v41[7] = @"vcScreenCaptureIsCursorCaptured";
  v42[7] = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*v2, "isCursorCaptured"));
  v41[8] = @"vcScreenCaptureCaptureExcludedBundleIDs";
  if ([*v2 excludedApplicationBundleIDs]
    && objc_msgSend((id)objc_msgSend(*v2, "excludedApplicationBundleIDs"), "count"))
  {
    uint64_t v4 = [*v2 excludedApplicationBundleIDs];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v42[8] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:9];
  int v6 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 32);
  int v7 = [*(id *)(a1 + 32) shouldRunInProcess];
  uint64_t v8 = *(void *)(a1 + 40);
  if (v6 != v7)
  {
    if (objc_opt_class() == *(void *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        uint64_t v14 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __50__AVCScreenCapture_updateScreenCaptureWithConfig___block_invoke_cold_2(v13, v2, v14);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint32_t v10 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
      }
      else {
        uint32_t v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        uint64_t v16 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v34 = *(void *)(a1 + 40);
          int v35 = [*(id *)(a1 + 32) shouldRunInProcess];
          *(_DWORD *)__int16 v37 = 136316418;
          id v36 = "NO";
          *(void *)&v37[4] = v15;
          *(void *)&v37[14] = "-[AVCScreenCapture updateScreenCaptureWithConfig:]_block_invoke";
          *(_WORD *)&v37[12] = 2080;
          *(_WORD *)&v37[22] = 1024;
          if (v35) {
            id v36 = "YES";
          }
          LODWORD(v38) = 334;
          WORD2(v38) = 2112;
          *(void *)((char *)&v38 + 6) = v10;
          HIWORD(v38) = 2048;
          uint64_t v39 = v34;
          LOWORD(v40) = 2080;
          *(void *)((char *)&v40 + 2) = v36;
          _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unsupported configuration change of shouldRunInProcess=%s", v37, 0x3Au);
        }
      }
    }
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"AVCScreenCapture", -2146893808, 0, *(_OWORD *)v37, *(void *)&v37[16]);
    goto LABEL_24;
  }
  if (*(unsigned char *)(v8 + 32))
  {
    uint64_t v9 = objc_msgSend(+[VCScreenCaptureManager sharedManager](VCScreenCaptureManager, "sharedManager"), "updateScreenCapture:withConfig:", *(void *)(*(void *)(a1 + 40) + 40), v5);
LABEL_24:
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v9;
    return;
  }
  uint64_t v11 = (void *)[*(id *)(v8 + 16) sendMessageSync:"vcScreenCaptureUpdate" arguments:v5];
  if (objc_opt_class() == *(void *)(a1 + 40))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      uint64_t v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int16 v37 = 136315906;
        *(void *)&v37[4] = v17;
        *(_WORD *)&v37[12] = 2080;
        *(void *)&v37[14] = "-[AVCScreenCapture updateScreenCaptureWithConfig:]_block_invoke";
        *(_WORD *)&v37[22] = 1024;
        LODWORD(v38) = 341;
        WORD2(v38) = 2112;
        *(void *)((char *)&v38 + 6) = v11;
        __int16 v19 = " [%s] %s:%d Results from updateConfig=%@";
        __int16 v20 = v18;
        uint32_t v21 = 38;
LABEL_33:
        _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v19, v37, v21);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v12 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v12 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      __int16 v23 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = *(void *)(a1 + 40);
        *(_DWORD *)__int16 v37 = 136316418;
        *(void *)&v37[4] = v22;
        *(_WORD *)&v37[12] = 2080;
        *(void *)&v37[14] = "-[AVCScreenCapture updateScreenCaptureWithConfig:]_block_invoke";
        *(_WORD *)&v37[22] = 1024;
        LODWORD(v38) = 341;
        WORD2(v38) = 2112;
        *(void *)((char *)&v38 + 6) = v12;
        HIWORD(v38) = 2048;
        uint64_t v39 = v24;
        LOWORD(v40) = 2112;
        *(void *)((char *)&v40 + 2) = v11;
        __int16 v19 = " [%s] %s:%d %@(%p) Results from updateConfig=%@";
        __int16 v20 = v23;
        uint32_t v21 = 58;
        goto LABEL_33;
      }
    }
  }
  uint64_t v25 = objc_msgSend(v11, "objectForKeyedSubscript:", @"ERROR", *(void *)v37, *(_OWORD *)&v37[8], v38, v39, v40);
  uint64_t v26 = a1 + 48;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v25;
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    if (objc_opt_class() == *(void *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v28 = VRTraceErrorLogLevelToCSTR();
        uint64_t v29 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __50__AVCScreenCapture_updateScreenCaptureWithConfig___block_invoke_cold_1(v28, v26, v29);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v27 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
      }
      else {
        int v27 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v30 = VRTraceErrorLogLevelToCSTR();
        __int16 v31 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v32 = *(void *)(a1 + 40);
          uint64_t v33 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          *(_DWORD *)__int16 v37 = 136316418;
          *(void *)&v37[4] = v30;
          *(_WORD *)&v37[12] = 2080;
          *(void *)&v37[14] = "-[AVCScreenCapture updateScreenCaptureWithConfig:]_block_invoke";
          *(_WORD *)&v37[22] = 1024;
          LODWORD(v38) = 345;
          WORD2(v38) = 2112;
          *(void *)((char *)&v38 + 6) = v27;
          HIWORD(v38) = 2048;
          uint64_t v39 = v32;
          LOWORD(v40) = 2112;
          *(void *)((char *)&v40 + 2) = v33;
          _os_log_error_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Updating Screen Capture Configuration failed with error=%@", v37, 0x3Au);
        }
      }
    }
  }
}

- (void)reportScreenShareIsStarting:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier"), "isEqualToString:", @"com.apple.TelephonyUtilities"))
  {
    ct_green_tea_logger_create_static();
    CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle();
    if (CTGreenTeaOsLogHandle)
    {
      uint64_t v5 = CTGreenTeaOsLogHandle;
      if (os_log_type_enabled(CTGreenTeaOsLogHandle, OS_LOG_TYPE_INFO))
      {
        int v6 = @"Stop";
        if (v3) {
          int v6 = @"Start";
        }
        int v7 = 138412290;
        uint64_t v8 = v6;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_INFO, "<FaceTime>[FaceTime][com.apple.AVConference]:Expanse Screen Share %@", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

- (int64_t)captureSourceID
{
  return self->_captureSourceID;
}

- (void)initWithDelegate:withConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create process queue", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:withConfig:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create XPC connection", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:withConfig:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Error initializing Screen Capture. Deallocing", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:withConfig:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to get client pid", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:withConfig:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create the screenshare object", v2, v3, v4, v5, v6);
}

void __50__AVCScreenCapture_updateScreenCaptureWithConfig___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)(*(void *)a2 + 8) + 40);
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  int v7 = "-[AVCScreenCapture updateScreenCaptureWithConfig:]_block_invoke";
  __int16 v8 = 1024;
  int v9 = 345;
  __int16 v10 = 2112;
  uint64_t v11 = v3;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Updating Screen Capture Configuration failed with error=%@", (uint8_t *)&v4, 0x26u);
}

void __50__AVCScreenCapture_updateScreenCaptureWithConfig___block_invoke_cold_2(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v5 = [*a2 shouldRunInProcess];
  __int16 v6 = "NO";
  uint64_t v8 = a1;
  int v7 = 136315906;
  __int16 v10 = "-[AVCScreenCapture updateScreenCaptureWithConfig:]_block_invoke";
  __int16 v9 = 2080;
  if (v5) {
    __int16 v6 = "YES";
  }
  __int16 v11 = 1024;
  int v12 = 334;
  __int16 v13 = 2080;
  uint64_t v14 = v6;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unsupported configuration change of shouldRunInProcess=%s", (uint8_t *)&v7, 0x26u);
}

@end