@interface AVCMoments
+ (BOOL)isLocalRecordingEnabled;
+ (id)obtainSandboxConsciousURLFromXPCResult:(id)a3;
- (AVCMoments)initWithConfiguration:(id)a3 delegate:(id)a4 dispatchQueue:(id)a5;
- (AVCMoments)initWithStreamToken:(int64_t)a3 requesterID:(id)a4 delegate:(id)a5 dispatchQueue:(id)a6;
- (AVCMomentsDelegate)delegate;
- (BOOL)avcMediaRecorderRequestDidEndRequest:(id)a3 withError:(id *)a4;
- (BOOL)avcMediaRecorderRequestDidRejectRequest:(id)a3 withError:(id *)a4;
- (BOOL)avcMediaRecorderRequestDidStartRequest:(id)a3 withError:(id *)a4;
- (BOOL)connectWithConfiguration:(id)a3;
- (BOOL)connectWithStreamToken:(int64_t)a3;
- (BOOL)setupDelegate:(id)a3 dispatchQueue:(id)a4;
- (NSString)requesterID;
- (id)description;
- (id)newRequestWithConfiguration:(id)a3;
- (id)newRequestWithMediaType:(unsigned __int8)a3 mode:(unsigned __int8)a4 requesteeID:(id)a5;
- (id)newRequestWithMediaType:(unsigned __int8)a3 requesteeID:(id)a4;
- (int)activeRequestCount;
- (int)pendingRequestCount;
- (int64_t)streamToken;
- (unsigned)capabilities;
- (void)dealloc;
- (void)deregisterBlocksForNotifications;
- (void)didEndProcessingRequestHelperWithResult:(id)a3;
- (void)didFinishRequestHelperWithResult:(id)a3;
- (void)didStartProcessingRequestHelperWithResult:(id)a3;
- (void)disconnect;
- (void)registerBlocksForNotifications;
- (void)updateCapabilities:(unsigned int)a3;
@end

@implementation AVCMoments

- (AVCMoments)initWithStreamToken:(int64_t)a3 requesterID:(id)a4 delegate:(id)a5 dispatchQueue:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  VRTraceReset();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316674;
      uint64_t v18 = v11;
      __int16 v19 = 2080;
      v20 = "-[AVCMoments initWithStreamToken:requesterID:delegate:dispatchQueue:]";
      __int16 v21 = 1024;
      int v22 = 56;
      __int16 v23 = 1024;
      int v24 = a3;
      __int16 v25 = 2112;
      id v26 = a4;
      __int16 v27 = 2112;
      id v28 = a5;
      __int16 v29 = 2112;
      id v30 = a6;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamToken=%u, requesterID=%@, delegate=%@, queue=%@", buf, 0x40u);
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)AVCMoments;
  v13 = [(AVCMoments *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_streamToken = a3;
    v13->_requesterID = (NSString *)[a4 copy];
    if ([(AVCMoments *)v14 setupDelegate:a5 dispatchQueue:a6])
    {
      if ([(AVCMoments *)v14 connectWithStreamToken:a3])
      {
        v14->_isLocalRecordingEnabled = +[AVCMoments isLocalRecordingEnabled];
        return v14;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCMoments initWithStreamToken:requesterID:delegate:dispatchQueue:]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCMoments initWithStreamToken:requesterID:delegate:dispatchQueue:]();
      }
    }

    return 0;
  }
  return v14;
}

- (AVCMoments)initWithConfiguration:(id)a3 delegate:(id)a4 dispatchQueue:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  VRTraceReset();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v16 = v9;
      __int16 v17 = 2080;
      uint64_t v18 = "-[AVCMoments initWithConfiguration:delegate:dispatchQueue:]";
      __int16 v19 = 1024;
      int v20 = 77;
      __int16 v21 = 2112;
      id v22 = a3;
      __int16 v23 = 2112;
      id v24 = a4;
      __int16 v25 = 2112;
      id v26 = a5;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d configuration=%@, delegate=%@, queue=%@", buf, 0x3Au);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)AVCMoments;
  uint64_t v11 = [(AVCMoments *)&v14 init];
  v12 = v11;
  if (v11)
  {
    if ([(AVCMoments *)v11 setupDelegate:a4 dispatchQueue:a5])
    {
      if ([(AVCMoments *)v12 connectWithConfiguration:a3])
      {
        v12->_isLocalRecordingEnabled = 1;
        return v12;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCMoments initWithConfiguration:delegate:dispatchQueue:]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCMoments initWithConfiguration:delegate:dispatchQueue:]();
      }
    }

    return 0;
  }
  return v12;
}

+ (BOOL)isLocalRecordingEnabled
{
  if (VCFeatureFlagManager_LocalRecordingEnabled()) {
    return 1;
  }

  return VCDefaults_GetManagedBoolValueForKey(@"enableLocalVideoRecording", 0);
}

- (BOOL)setupDelegate:(id)a3 dispatchQueue:(id)a4
{
  if (a3)
  {
    objc_storeWeak(&self->_delegate, a3);
    v6 = objc_alloc_init(AVConferenceXPCClient);
    self->_connection = v6;
    if (v6)
    {
      v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      self->_requests = v7;
      if (v7)
      {
        if (a4)
        {
          self->_delegateQueue = (OS_dispatch_queue *)a4;
          dispatch_retain((dispatch_object_t)a4);
LABEL_7:
          [(AVCMoments *)self registerBlocksForNotifications];
          LOBYTE(v10) = 1;
          return v10;
        }
        CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
        uint64_t v9 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.AVCMoments.delegateQueue", 0, CustomRootQueue);
        self->_delegateQueue = v9;
        if (v9) {
          goto LABEL_7;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v10) {
            return v10;
          }
          -[AVCMoments setupDelegate:dispatchQueue:].cold.4();
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v10) {
          return v10;
        }
        -[AVCMoments setupDelegate:dispatchQueue:]();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v10) {
        return v10;
      }
      -[AVCMoments setupDelegate:dispatchQueue:]();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v10) {
      return v10;
    }
    -[AVCMoments setupDelegate:dispatchQueue:]();
  }
  LOBYTE(v10) = 0;
  return v10;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(AVCMoments *)self deregisterBlocksForNotifications];
  [(AVCMoments *)self disconnect];

  dispatch_release((dispatch_object_t)self->_delegateQueue);
  objc_storeWeak(&self->_delegate, 0);

  v3.receiver = self;
  v3.super_class = (Class)AVCMoments;
  [(AVCMoments *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"%@: streamToken[%ld] capabilities[%X] requesterID[%@]", NSStringFromClass(v4), self->_streamToken, self->_capabilities, self->_requesterID];
}

- (BOOL)connectWithConfiguration:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v16 = v5;
      __int16 v17 = 2080;
      uint64_t v18 = "-[AVCMoments connectWithConfiguration:]";
      __int16 v19 = 1024;
      int v20 = 145;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCMoments: connect for local recording", buf, 0x1Cu);
    }
  }
  __int16 v23 = @"vcMomentsConfiguration";
  v24[0] = [a3 dictionary];
  id v7 = -[AVConferenceXPCClient sendMessageSync:arguments:](self->_connection, "sendMessageSync:arguments:", "vcMediaRecorderInitializeStandalone", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1]);
  uint64_t v8 = [v7 objectForKeyedSubscript:@"ERROR"];
  if (v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCMoments connectWithConfiguration:]();
      }
    }
  }
  else
  {
    delegateQueue = self->_delegateQueue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __39__AVCMoments_connectWithConfiguration___block_invoke;
    v14[3] = &unk_1E6DB3E40;
    v14[4] = self;
    v14[5] = v7;
    dispatch_async(delegateQueue, v14);
    self->_int64_t streamToken = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", @"vcMomentsStreamToken"), "unsignedIntegerValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int64_t streamToken = self->_streamToken;
        *(_DWORD *)buf = 136315906;
        uint64_t v16 = v10;
        __int16 v17 = 2080;
        uint64_t v18 = "-[AVCMoments connectWithConfiguration:]";
        __int16 v19 = 1024;
        int v20 = 158;
        __int16 v21 = 1024;
        int v22 = streamToken;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCMoments: streamToken=%u", buf, 0x22u);
      }
    }
  }
  return v8 == 0;
}

void __39__AVCMoments_connectWithConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "updateCapabilities:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", @"vcMomentsCapabilities"), "intValue"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    objc_super v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *(_DWORD *)(*(void *)(a1 + 32) + 32);
      int v5 = 136315906;
      uint64_t v6 = v2;
      __int16 v7 = 2080;
      uint64_t v8 = "-[AVCMoments connectWithConfiguration:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 155;
      __int16 v11 = 1024;
      int v12 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCMoments: capabilities=%d", (uint8_t *)&v5, 0x22u);
    }
  }
}

- (BOOL)connectWithStreamToken:(int64_t)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v16 = v5;
      __int16 v17 = 2080;
      uint64_t v18 = "-[AVCMoments connectWithStreamToken:]";
      __int16 v19 = 1024;
      int v20 = 163;
      __int16 v21 = 1024;
      int v22 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCMoments: connect for streamToken=%u", buf, 0x22u);
    }
  }
  __int16 v25 = @"vcMomentsStreamToken";
  v26[0] = [NSNumber numberWithInteger:a3];
  id v7 = -[AVConferenceXPCClient sendMessageSync:arguments:](self->_connection, "sendMessageSync:arguments:", "vcMediaRecorderInitialize", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1]);
  uint64_t v8 = (void *)[v7 objectForKeyedSubscript:@"ERROR"];
  if (v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      int v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
        *(_DWORD *)buf = 136316162;
        uint64_t v16 = v9;
        __int16 v17 = 2080;
        uint64_t v18 = "-[AVCMoments connectWithStreamToken:]";
        __int16 v19 = 1024;
        int v20 = 168;
        __int16 v21 = 1024;
        int v22 = a3;
        __int16 v23 = 2080;
        uint64_t v24 = v11;
        _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d AVCMomentsClient: Failed connection for streamToken=%u error=%s", buf, 0x2Cu);
      }
    }
  }
  else
  {
    delegateQueue = self->_delegateQueue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __37__AVCMoments_connectWithStreamToken___block_invoke;
    v14[3] = &unk_1E6DB3E40;
    v14[4] = self;
    v14[5] = v7;
    dispatch_async(delegateQueue, v14);
  }
  return v8 == 0;
}

void __37__AVCMoments_connectWithStreamToken___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "updateCapabilities:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", @"vcMomentsCapabilities"), "intValue"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    objc_super v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *(_DWORD *)(*(void *)(a1 + 32) + 32);
      int v5 = 136315906;
      uint64_t v6 = v2;
      __int16 v7 = 2080;
      uint64_t v8 = "-[AVCMoments connectWithStreamToken:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 173;
      __int16 v11 = 1024;
      int v12 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCMoments: capabilities=%d", (uint8_t *)&v5, 0x22u);
    }
  }
}

- (void)disconnect
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    int v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int64_t streamToken = self->_streamToken;
      int v6 = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      __int16 v9 = "-[AVCMoments disconnect]";
      __int16 v10 = 1024;
      int v11 = 179;
      __int16 v12 = 1024;
      int v13 = streamToken;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCMoments: disconnect for streamToken=%u", (uint8_t *)&v6, 0x22u);
    }
  }
  [(AVConferenceXPCClient *)self->_connection sendMessageSync:"vcMediaRecorderUninitialize"];
}

- (void)registerBlocksForNotifications
{
  v8[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__AVCMoments_registerBlocksForNotifications__block_invoke;
  v8[3] = &unk_1E6DB4338;
  v8[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaRecorderDidStartProcessingRequest" block:v8 queue:self->_delegateQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__AVCMoments_registerBlocksForNotifications__block_invoke_36;
  v7[3] = &unk_1E6DB4338;
  v7[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaRecorderDidEndProcessingRequest" block:v7 queue:self->_delegateQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__AVCMoments_registerBlocksForNotifications__block_invoke_38;
  v6[3] = &unk_1E6DB4338;
  v6[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaRecorderDidFinishRequest" block:v6 queue:self->_delegateQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__AVCMoments_registerBlocksForNotifications__block_invoke_40;
  v5[3] = &unk_1E6DB4338;
  v5[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaRecorderCapabilitiesDidChange" block:v5 queue:self->_delegateQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__AVCMoments_registerBlocksForNotifications__block_invoke_42;
  v4[3] = &unk_1E6DB4338;
  v4[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaRecorderServerDidDisconnect" block:v4 queue:self->_delegateQueue];
}

uint64_t __44__AVCMoments_registerBlocksForNotifications__block_invoke(uint64_t result, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v4 = result;
    result = [a2 objectForKeyedSubscript:@"SERVERDIED"];
    if (!result)
    {
      result = [*(id *)(v4 + 32) strong];
      if (result)
      {
        int v5 = (void *)result;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v6 = VRTraceErrorLogLevelToCSTR();
          uint64_t v7 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            if (a2) {
              __int16 v8 = (const char *)objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
            }
            else {
              __int16 v8 = "<nil>";
            }
            int v9 = 136315906;
            uint64_t v10 = v6;
            __int16 v11 = 2080;
            __int16 v12 = "-[AVCMoments registerBlocksForNotifications]_block_invoke";
            __int16 v13 = 1024;
            int v14 = 191;
            __int16 v15 = 2080;
            uint64_t v16 = v8;
            _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCMoments: did start processing request from AVCMomentsManager %s", (uint8_t *)&v9, 0x26u);
          }
        }
        return [v5 didStartProcessingRequestHelperWithResult:a2];
      }
    }
  }
  return result;
}

uint64_t __44__AVCMoments_registerBlocksForNotifications__block_invoke_36(uint64_t result, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v4 = result;
    result = [a2 objectForKeyedSubscript:@"SERVERDIED"];
    if (!result)
    {
      result = [*(id *)(v4 + 32) strong];
      if (result)
      {
        int v5 = (void *)result;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v6 = VRTraceErrorLogLevelToCSTR();
          uint64_t v7 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            if (a2) {
              __int16 v8 = (const char *)objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
            }
            else {
              __int16 v8 = "<nil>";
            }
            int v9 = 136315906;
            uint64_t v10 = v6;
            __int16 v11 = 2080;
            __int16 v12 = "-[AVCMoments registerBlocksForNotifications]_block_invoke";
            __int16 v13 = 1024;
            int v14 = 203;
            __int16 v15 = 2080;
            uint64_t v16 = v8;
            _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCMoments: did end processing request from AVCMomentsManager %s", (uint8_t *)&v9, 0x26u);
          }
        }
        return [v5 didEndProcessingRequestHelperWithResult:a2];
      }
    }
  }
  return result;
}

uint64_t __44__AVCMoments_registerBlocksForNotifications__block_invoke_38(uint64_t result, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v4 = result;
    result = [a2 objectForKeyedSubscript:@"SERVERDIED"];
    if (!result)
    {
      result = [*(id *)(v4 + 32) strong];
      if (result)
      {
        int v5 = (void *)result;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v6 = VRTraceErrorLogLevelToCSTR();
          uint64_t v7 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            if (a2) {
              __int16 v8 = (const char *)objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
            }
            else {
              __int16 v8 = "<nil>";
            }
            int v9 = 136315906;
            uint64_t v10 = v6;
            __int16 v11 = 2080;
            __int16 v12 = "-[AVCMoments registerBlocksForNotifications]_block_invoke";
            __int16 v13 = 1024;
            int v14 = 215;
            __int16 v15 = 2080;
            uint64_t v16 = v8;
            _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCMoments: did finish request from AVCMomentsManager %s", (uint8_t *)&v9, 0x26u);
          }
        }
        return [v5 didFinishRequestHelperWithResult:a2];
      }
    }
  }
  return result;
}

void __44__AVCMoments_registerBlocksForNotifications__block_invoke_40(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v4 = [*(id *)(a1 + 32) strong];
    if (v4)
    {
      int v5 = (void *)v4;
      uint64_t v6 = (void *)[a2 objectForKeyedSubscript:@"vcMomentsCapabilities"];
      if (v6)
      {
        uint64_t v7 = [v6 intValue];
        [v5 updateCapabilities:v7];
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        int v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 136315650;
          uint64_t v11 = v8;
          __int16 v12 = 2080;
          __int16 v13 = "-[AVCMoments registerBlocksForNotifications]_block_invoke";
          __int16 v14 = 1024;
          int v15 = 230;
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Attempting to update capabilities with nil argument", (uint8_t *)&v10, 0x1Cu);
        }
      }
    }
  }
}

uint64_t __44__AVCMoments_registerBlocksForNotifications__block_invoke_42(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t result = [a2 objectForKeyedSubscript:@"SERVERDIED"];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 32) strong];
    if (result)
    {
      uint64_t v4 = (void *)result;
      [(id)result delegate];
      uint64_t result = objc_opt_respondsToSelector();
      if (result)
      {
        if (objc_opt_class() == v4)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(void *)&v13[16], v14, v15), "momentsServerDidDisconnect:", v4);
          }
          uint64_t v6 = VRTraceErrorLogLevelToCSTR();
          uint64_t v7 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(void *)&v13[16], v14, v15), "momentsServerDidDisconnect:", v4);
          }
          *(_DWORD *)__int16 v13 = 136315650;
          *(void *)&v13[4] = v6;
          *(_WORD *)&v13[12] = 2080;
          *(void *)&v13[14] = "-[AVCMoments registerBlocksForNotifications]_block_invoke";
          *(_WORD *)&v13[22] = 1024;
          LODWORD(v14) = 246;
          uint64_t v8 = " [%s] %s:%d received callback for serverDidDisconnect";
          int v9 = v7;
          uint32_t v10 = 28;
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            int v5 = (__CFString *)[v4 performSelector:sel_logPrefix];
          }
          else {
            int v5 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(void *)&v13[16], v14, v15), "momentsServerDidDisconnect:", v4);
          }
          uint64_t v11 = VRTraceErrorLogLevelToCSTR();
          __int16 v12 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(void *)&v13[16], v14, v15), "momentsServerDidDisconnect:", v4);
          }
          *(_DWORD *)__int16 v13 = 136316162;
          *(void *)&v13[4] = v11;
          *(_WORD *)&v13[12] = 2080;
          *(void *)&v13[14] = "-[AVCMoments registerBlocksForNotifications]_block_invoke";
          *(_WORD *)&v13[22] = 1024;
          LODWORD(v14) = 246;
          WORD2(v14) = 2112;
          *(void *)((char *)&v14 + 6) = v5;
          HIWORD(v14) = 2048;
          int v15 = v4;
          uint64_t v8 = " [%s] %s:%d %@(%p) received callback for serverDidDisconnect";
          int v9 = v12;
          uint32_t v10 = 48;
        }
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, v13, v10);
        return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(void *)&v13[16], v14, v15), "momentsServerDidDisconnect:", v4);
      }
    }
  }
  return result;
}

- (void)deregisterBlocksForNotifications
{
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcMediaRecorderDidStartProcessingRequest"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcMediaRecorderDidEndProcessingRequest"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcMediaRecorderDidFinishRequest"];
  connection = self->_connection;

  [(AVConferenceXPCClient *)connection deregisterFromService:"vcMediaRecorderServerDidDisconnect"];
}

- (void)didStartProcessingRequestHelperWithResult:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  char v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsRequestMode"), "intValue");
  unsigned __int8 v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsMediaType"), "intValue");
  uint64_t v7 = [a3 objectForKeyedSubscript:@"vcMomentsTransactionID"];
  uint64_t v8 = [a3 objectForKeyedSubscript:@"vcMomentsRequesterID"];
  uint64_t v9 = [a3 objectForKeyedSubscript:@"vcMomentsRequesteeID"];
  if (v5 == 2)
  {
    uint64_t v12 = v9;
    __int16 v13 = objc_alloc_init(AVCMediaRecorderRequestConfiguration);
    [(AVCMediaRecorderRequestConfiguration *)v13 setMediaType:v6];
    [(AVCMediaRecorderRequestConfiguration *)v13 setRequesteeID:v12];
    [(AVCMediaRecorderRequestConfiguration *)v13 setRequestMode:2];
    long long v31 = *MEMORY[0x1E4F1F9F8];
    uint64_t v32 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    [(AVCMediaRecorderRequestConfiguration *)v13 setMovieFragmentInterval:&v31];
    uint32_t v10 = [[AVCMomentsRequest alloc] initWithConfiguration:v13 requesterID:v8 transactionID:v7];

    [(AVCMomentsRequest *)v10 setDelegate:self];
    [(NSMutableDictionary *)self->_requests setObject:v10 forKeyedSubscript:[(AVCMomentsRequest *)v10 transactionID]];
  }
  else if (v5 == 1)
  {
    uint32_t v10 = (AVCMomentsRequest *)[(NSMutableDictionary *)self->_requests objectForKeyedSubscript:v7];
    uint64_t v11 = v10;
  }
  else
  {
    uint32_t v10 = 0;
  }
  uint64_t v14 = [a3 objectForKeyedSubscript:@"vcMomentsError"];
  if (!v14
    || (uint64_t v15 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v14 error:0]) == 0)
  {
    uint64_t v15 = 0;
    ++self->_currentPendingRequestsCount;
  }
  if ((AVCMoments *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      __str = 0;
      uint64_t v17 = a3 ? (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "result=%s", v17);
      if (__str)
      {
        uint64_t v28 = v15;
        __lasts = 0;
        uint64_t v24 = strtok_r(__str, "\n", &__lasts);
        __int16 v25 = (os_log_t *)MEMORY[0x1E4F47A50];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            uint64_t v26 = VRTraceErrorLogLevelToCSTR();
            uint64_t v27 = *v25;
            if (os_log_type_enabled(*v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v34 = v26;
              __int16 v35 = 2080;
              v36 = "-[AVCMoments didStartProcessingRequestHelperWithResult:]";
              __int16 v37 = 1024;
              int v38 = 298;
              __int16 v39 = 2080;
              v40 = "";
              __int16 v41 = 2080;
              v42 = v24;
              _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          uint64_t v24 = strtok_r(0, "\n", &__lasts);
        }
        while (v24);
        goto LABEL_34;
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v16 = (__CFString *)[(AVCMoments *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v16 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      __str = 0;
      uint64_t v18 = (const char *)[(__CFString *)v16 UTF8String];
      __int16 v19 = a3 ? (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "%s(%p) result=%s", v18, self, v19);
      if (__str)
      {
        uint64_t v28 = v15;
        __lasts = 0;
        int v20 = strtok_r(__str, "\n", &__lasts);
        __int16 v21 = (os_log_t *)MEMORY[0x1E4F47A50];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            uint64_t v22 = VRTraceErrorLogLevelToCSTR();
            __int16 v23 = *v21;
            if (os_log_type_enabled(*v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v34 = v22;
              __int16 v35 = 2080;
              v36 = "-[AVCMoments didStartProcessingRequestHelperWithResult:]";
              __int16 v37 = 1024;
              int v38 = 298;
              __int16 v39 = 2080;
              v40 = "";
              __int16 v41 = 2080;
              v42 = v20;
              _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          int v20 = strtok_r(0, "\n", &__lasts);
        }
        while (v20);
LABEL_34:
        free(__str);
        uint64_t v15 = v28;
      }
    }
  }
  [self->_delegate moments:self didStartProcessingRequest:v10 error:v15];
}

+ (id)obtainSandboxConsciousURLFromXPCResult:(id)a3
{
  id v3 = a3;
  if (!a3) {
    return v3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v4 = +[VCSandboxedURL deserialize:v3];

  return (id)[v4 consumeToken];
}

- (void)didEndProcessingRequestHelperWithResult:(id)a3
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  if ((AVCMoments *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        requests = self->_requests;
        *(_DWORD *)buf = 136315906;
        uint64_t v80 = v6;
        __int16 v81 = 2080;
        v82 = "-[AVCMoments didEndProcessingRequestHelperWithResult:]";
        __int16 v83 = 1024;
        int v84 = 321;
        __int16 v85 = 2112;
        v86 = (const char *)requests;
        uint64_t v9 = " [%s] %s:%d AVCMoments current requests %@";
        uint32_t v10 = v7;
        uint32_t v11 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      char v5 = (__CFString *)[(AVCMoments *)self performSelector:sel_logPrefix];
    }
    else {
      char v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      __int16 v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = self->_requests;
        *(_DWORD *)buf = 136316418;
        uint64_t v80 = v12;
        __int16 v81 = 2080;
        v82 = "-[AVCMoments didEndProcessingRequestHelperWithResult:]";
        __int16 v83 = 1024;
        int v84 = 321;
        __int16 v85 = 2112;
        v86 = (const char *)v5;
        __int16 v87 = 2048;
        v88 = self;
        __int16 v89 = 2112;
        v90 = v14;
        uint64_t v9 = " [%s] %s:%d %@(%p) AVCMoments current requests %@";
        uint32_t v10 = v13;
        uint32_t v11 = 58;
        goto LABEL_11;
      }
    }
  }
  uint64_t v15 = [a3 objectForKeyedSubscript:@"vcMomentsStillImageURL"];
  uint64_t v16 = +[AVCMoments obtainSandboxConsciousURLFromXPCResult:v15];
  uint64_t v17 = v16;
  if (v15 && !v16)
  {
    if ((AVCMoments *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCMoments didEndProcessingRequestHelperWithResult:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v18 = (__CFString *)[(AVCMoments *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v18 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        int v20 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          v59 = (objc_class *)objc_opt_class();
          Name = class_getName(v59);
          *(_DWORD *)buf = 136316418;
          uint64_t v80 = v19;
          __int16 v81 = 2080;
          v82 = "-[AVCMoments didEndProcessingRequestHelperWithResult:]";
          __int16 v83 = 1024;
          int v84 = 326;
          __int16 v85 = 2112;
          v86 = (const char *)v18;
          __int16 v87 = 2048;
          v88 = self;
          __int16 v89 = 2080;
          v90 = (void *)Name;
          _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unexpected class for stillImageURLResult=%s or failure to decode stillImageURL.", buf, 0x3Au);
        }
      }
    }
  }
  uint64_t v21 = [a3 objectForKeyedSubscript:@"vcMomentsMovieURL"];
  id v22 = +[AVCMoments obtainSandboxConsciousURLFromXPCResult:v21];
  uint64_t v23 = (uint64_t)v22;
  if (v21 && !v22)
  {
    if ((AVCMoments *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCMoments didEndProcessingRequestHelperWithResult:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v24 = (__CFString *)[(AVCMoments *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v24 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v25 = VRTraceErrorLogLevelToCSTR();
        uint64_t v26 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          v61 = (objc_class *)objc_opt_class();
          v62 = class_getName(v61);
          *(_DWORD *)buf = 136316418;
          uint64_t v80 = v25;
          __int16 v81 = 2080;
          v82 = "-[AVCMoments didEndProcessingRequestHelperWithResult:]";
          __int16 v83 = 1024;
          int v84 = 332;
          __int16 v85 = 2112;
          v86 = (const char *)v24;
          __int16 v87 = 2048;
          v88 = self;
          __int16 v89 = 2080;
          v90 = (void *)v62;
          _os_log_error_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unexpected class for movieURLResult=%s or failure to decode movieURL.", buf, 0x3Au);
        }
      }
    }
  }
  uint64_t v27 = [a3 objectForKeyedSubscript:@"vcMomentsTransactionID"];
  uint64_t v28 = (void *)[(NSMutableDictionary *)self->_requests objectForKeyedSubscript:v27];
  uint64_t v29 = [a3 objectForKeyedSubscript:@"vcMomentsError"];
  if (v29) {
    uint64_t v30 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v29 error:0];
  }
  else {
    uint64_t v30 = 0;
  }
  --self->_currentPendingRequestsCount;
  if ((AVCMoments *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_66;
    }
    __str = 0;
    uint64_t v74 = v23;
    v75 = v17;
    uint64_t v72 = v30;
    v73 = v28;
    if (a3) {
      uint64_t v32 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
    }
    else {
      uint64_t v32 = "<nil>";
    }
    asprintf(&__str, "result=%s", v32);
    if (!__str) {
      goto LABEL_65;
    }
    uint64_t v71 = v27;
    __lasts = 0;
    __int16 v39 = strtok_r(__str, "\n", &__lasts);
    v40 = (os_log_t *)MEMORY[0x1E4F47A50];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v41 = VRTraceErrorLogLevelToCSTR();
        v42 = *v40;
        if (os_log_type_enabled(*v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v80 = v41;
          __int16 v81 = 2080;
          v82 = "-[AVCMoments didEndProcessingRequestHelperWithResult:]";
          __int16 v83 = 1024;
          int v84 = 340;
          __int16 v85 = 2080;
          v86 = "";
          __int16 v87 = 2080;
          v88 = (AVCMoments *)v39;
          _os_log_impl(&dword_1E1EA4000, v42, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      __int16 v39 = strtok_r(0, "\n", &__lasts);
    }
    while (v39);
    goto LABEL_64;
  }
  if (objc_opt_respondsToSelector()) {
    long long v31 = (__CFString *)[(AVCMoments *)self performSelector:sel_logPrefix];
  }
  else {
    long long v31 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    __str = 0;
    v33 = (const char *)[(__CFString *)v31 UTF8String];
    uint64_t v74 = v23;
    v75 = v17;
    uint64_t v72 = v30;
    v73 = v28;
    if (a3) {
      uint64_t v34 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
    }
    else {
      uint64_t v34 = "<nil>";
    }
    asprintf(&__str, "%s(%p) result=%s", v33, self, v34);
    if (!__str) {
      goto LABEL_65;
    }
    uint64_t v71 = v27;
    __lasts = 0;
    __int16 v35 = strtok_r(__str, "\n", &__lasts);
    v36 = (os_log_t *)MEMORY[0x1E4F47A50];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v37 = VRTraceErrorLogLevelToCSTR();
        int v38 = *v36;
        if (os_log_type_enabled(*v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v80 = v37;
          __int16 v81 = 2080;
          v82 = "-[AVCMoments didEndProcessingRequestHelperWithResult:]";
          __int16 v83 = 1024;
          int v84 = 340;
          __int16 v85 = 2080;
          v86 = "";
          __int16 v87 = 2080;
          v88 = (AVCMoments *)v35;
          _os_log_impl(&dword_1E1EA4000, v38, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      __int16 v35 = strtok_r(0, "\n", &__lasts);
    }
    while (v35);
LABEL_64:
    free(__str);
    uint64_t v27 = v71;
LABEL_65:
    uint64_t v23 = v74;
    uint64_t v17 = v75;
    uint64_t v30 = v72;
    uint64_t v28 = v73;
  }
LABEL_66:
  VCMediaRecorderUtil_PrintMediaURL(v23, 6);
  if (objc_opt_respondsToSelector()) {
    [self->_delegate moments:self didEndProcessingRequest:v28 stillImageURL:v17 movieURL:v23 error:v30];
  }
  if (![v28 hasDirectoryURL])
  {
    v76 = 0;
    if (!v17
      || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtURL:error:", v17, &v76) & 1) != 0)
    {
      goto LABEL_80;
    }
    if ((AVCMoments *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_80;
      }
      uint64_t v44 = VRTraceErrorLogLevelToCSTR();
      v45 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_80;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v80 = v44;
      __int16 v81 = 2080;
      v82 = "-[AVCMoments didEndProcessingRequestHelperWithResult:]";
      __int16 v83 = 1024;
      int v84 = 351;
      __int16 v85 = 2112;
      v86 = v17;
      __int16 v87 = 2112;
      v88 = v76;
      v46 = " [%s] %s:%d Failed to remove stillImage at URL=%@ error=%@";
      v47 = v45;
      uint32_t v48 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v43 = (__CFString *)[(AVCMoments *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v43 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (uint64_t v49 = VRTraceErrorLogLevelToCSTR(),
            v50 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
      {
LABEL_80:
        v76 = 0;
        if (!v23
          || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtURL:error:", v23, &v76) & 1) != 0)
        {
          goto LABEL_91;
        }
        if ((AVCMoments *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            goto LABEL_91;
          }
          uint64_t v52 = VRTraceErrorLogLevelToCSTR();
          v53 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            goto LABEL_91;
          }
          *(_DWORD *)buf = 136316162;
          uint64_t v80 = v52;
          __int16 v81 = 2080;
          v82 = "-[AVCMoments didEndProcessingRequestHelperWithResult:]";
          __int16 v83 = 1024;
          int v84 = 355;
          __int16 v85 = 2112;
          v86 = v17;
          __int16 v87 = 2112;
          v88 = v76;
          v54 = " [%s] %s:%d Failed to remove movie at URL=%@ error=%@";
          v55 = v53;
          uint32_t v56 = 48;
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            v51 = (__CFString *)[(AVCMoments *)self performSelector:sel_logPrefix];
          }
          else {
            v51 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            goto LABEL_91;
          }
          uint64_t v57 = VRTraceErrorLogLevelToCSTR();
          v58 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            goto LABEL_91;
          }
          *(_DWORD *)buf = 136316674;
          uint64_t v80 = v57;
          __int16 v81 = 2080;
          v82 = "-[AVCMoments didEndProcessingRequestHelperWithResult:]";
          __int16 v83 = 1024;
          int v84 = 355;
          __int16 v85 = 2112;
          v86 = (const char *)v51;
          __int16 v87 = 2048;
          v88 = self;
          __int16 v89 = 2112;
          v90 = (void *)v17;
          __int16 v91 = 2112;
          v92 = v76;
          v54 = " [%s] %s:%d %@(%p) Failed to remove movie at URL=%@ error=%@";
          v55 = v58;
          uint32_t v56 = 68;
        }
        _os_log_error_impl(&dword_1E1EA4000, v55, OS_LOG_TYPE_ERROR, v54, buf, v56);
        goto LABEL_91;
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v80 = v49;
      __int16 v81 = 2080;
      v82 = "-[AVCMoments didEndProcessingRequestHelperWithResult:]";
      __int16 v83 = 1024;
      int v84 = 351;
      __int16 v85 = 2112;
      v86 = (const char *)v43;
      __int16 v87 = 2048;
      v88 = self;
      __int16 v89 = 2112;
      v90 = (void *)v17;
      __int16 v91 = 2112;
      v92 = v76;
      v46 = " [%s] %s:%d %@(%p) Failed to remove stillImage at URL=%@ error=%@";
      v47 = v50;
      uint32_t v48 = 68;
    }
    _os_log_error_impl(&dword_1E1EA4000, v47, OS_LOG_TYPE_ERROR, v46, buf, v48);
    goto LABEL_80;
  }
  if ((AVCMoments *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_91;
    }
    uint64_t v64 = VRTraceErrorLogLevelToCSTR();
    v65 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_91;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v80 = v64;
    __int16 v81 = 2080;
    v82 = "-[AVCMoments didEndProcessingRequestHelperWithResult:]";
    __int16 v83 = 1024;
    int v84 = 348;
    v66 = " [%s] %s:%d Skipping removing files since a client directoryURL is present.";
    v67 = v65;
    uint32_t v68 = 28;
LABEL_106:
    _os_log_impl(&dword_1E1EA4000, v67, OS_LOG_TYPE_DEFAULT, v66, buf, v68);
    goto LABEL_91;
  }
  if (objc_opt_respondsToSelector()) {
    v63 = (__CFString *)[(AVCMoments *)self performSelector:sel_logPrefix];
  }
  else {
    v63 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v69 = VRTraceErrorLogLevelToCSTR();
    v70 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v80 = v69;
      __int16 v81 = 2080;
      v82 = "-[AVCMoments didEndProcessingRequestHelperWithResult:]";
      __int16 v83 = 1024;
      int v84 = 348;
      __int16 v85 = 2112;
      v86 = (const char *)v63;
      __int16 v87 = 2048;
      v88 = self;
      v66 = " [%s] %s:%d %@(%p) Skipping removing files since a client directoryURL is present.";
      v67 = v70;
      uint32_t v68 = 48;
      goto LABEL_106;
    }
  }
LABEL_91:
  [(NSMutableDictionary *)self->_requests removeObjectForKey:v27];
}

- (void)didFinishRequestHelperWithResult:(id)a3
{
  *(void *)((char *)&v57[1] + 6) = *MEMORY[0x1E4F143B8];
  if ((AVCMoments *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_12;
    }
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    requests = self->_requests;
    *(_DWORD *)buf = 136315906;
    uint64_t v48 = v6;
    __int16 v49 = 2080;
    v50 = "-[AVCMoments didFinishRequestHelperWithResult:]";
    __int16 v51 = 1024;
    int v52 = 363;
    __int16 v53 = 2112;
    *(void *)v54 = requests;
    uint64_t v9 = " [%s] %s:%d AVCMoments current requests %@";
    uint32_t v10 = v7;
    uint32_t v11 = 38;
    goto LABEL_11;
  }
  if (objc_opt_respondsToSelector()) {
    char v5 = (__CFString *)[(AVCMoments *)self performSelector:sel_logPrefix];
  }
  else {
    char v5 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    __int16 v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = self->_requests;
      *(_DWORD *)buf = 136316418;
      uint64_t v48 = v12;
      __int16 v49 = 2080;
      v50 = "-[AVCMoments didFinishRequestHelperWithResult:]";
      __int16 v51 = 1024;
      int v52 = 363;
      __int16 v53 = 2112;
      *(void *)v54 = v5;
      *(_WORD *)&v54[8] = 2048;
      v55 = self;
      __int16 v56 = 2112;
      v57[0] = v14;
      uint64_t v9 = " [%s] %s:%d %@(%p) AVCMoments current requests %@";
      uint32_t v10 = v13;
      uint32_t v11 = 58;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    }
  }
LABEL_12:
  uint64_t v15 = [a3 objectForKeyedSubscript:@"vcMomentsTransactionID"];
  uint64_t v16 = (void *)[(NSMutableDictionary *)self->_requests objectForKeyedSubscript:v15];
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsRequestDidSucceed"), "BOOLValue")) {
    uint64_t v17 = 0;
  }
  else {
    uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AVCMoments" code:-1 userInfo:0];
  }
  if ((AVCMoments *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      __str = 0;
      uint64_t v44 = v17;
      if (a3) {
        uint64_t v19 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      }
      else {
        uint64_t v19 = "<nil>";
      }
      asprintf(&__str, "result=%s", v19);
      if (!__str) {
        goto LABEL_41;
      }
      uint64_t v41 = v16;
      uint64_t v42 = v15;
      id v43 = a3;
      __lasts = 0;
      uint64_t v26 = strtok_r(__str, "\n", &__lasts);
      uint64_t v27 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v28 = VRTraceErrorLogLevelToCSTR();
          uint64_t v29 = *v27;
          if (os_log_type_enabled(*v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v48 = v28;
            __int16 v49 = 2080;
            v50 = "-[AVCMoments didFinishRequestHelperWithResult:]";
            __int16 v51 = 1024;
            int v52 = 371;
            __int16 v53 = 2080;
            *(void *)v54 = "";
            *(_WORD *)&v54[8] = 2080;
            v55 = (AVCMoments *)v26;
            _os_log_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        uint64_t v26 = strtok_r(0, "\n", &__lasts);
      }
      while (v26);
      goto LABEL_40;
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v18 = (__CFString *)[(AVCMoments *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v18 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      __str = 0;
      int v20 = (const char *)[(__CFString *)v18 UTF8String];
      uint64_t v44 = v17;
      if (a3) {
        uint64_t v21 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      }
      else {
        uint64_t v21 = "<nil>";
      }
      asprintf(&__str, "%s(%p) result=%s", v20, self, v21);
      if (!__str) {
        goto LABEL_41;
      }
      uint64_t v41 = v16;
      uint64_t v42 = v15;
      id v43 = a3;
      __lasts = 0;
      id v22 = strtok_r(__str, "\n", &__lasts);
      uint64_t v23 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v24 = VRTraceErrorLogLevelToCSTR();
          uint64_t v25 = *v23;
          if (os_log_type_enabled(*v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v48 = v24;
            __int16 v49 = 2080;
            v50 = "-[AVCMoments didFinishRequestHelperWithResult:]";
            __int16 v51 = 1024;
            int v52 = 371;
            __int16 v53 = 2080;
            *(void *)v54 = "";
            *(_WORD *)&v54[8] = 2080;
            v55 = (AVCMoments *)v22;
            _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        id v22 = strtok_r(0, "\n", &__lasts);
      }
      while (v22);
LABEL_40:
      free(__str);
      uint64_t v15 = v42;
      a3 = v43;
      uint64_t v16 = v41;
LABEL_41:
      uint64_t v17 = v44;
    }
  }
  [self->_delegate moments:self didFinishRequest:v16 error:v17];
  [(NSMutableDictionary *)self->_requests removeObjectForKey:v15];
  if ((objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsMediaType"), "intValue") & 0xFE) == 2)
  {
    int v30 = self->_currentActiveRequestsCount - 1;
    self->_int currentActiveRequestsCount = v30;
    if (v30 == 99999)
    {
      if ((AVCMoments *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_55;
        }
        uint64_t v32 = VRTraceErrorLogLevelToCSTR();
        v33 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_55;
        }
        int currentActiveRequestsCount = self->_currentActiveRequestsCount;
        *(_DWORD *)buf = 136316162;
        uint64_t v48 = v32;
        __int16 v49 = 2080;
        v50 = "-[AVCMoments didFinishRequestHelperWithResult:]";
        __int16 v51 = 1024;
        int v52 = 381;
        __int16 v53 = 1024;
        *(_DWORD *)v54 = 7;
        *(_WORD *)&v54[4] = 1024;
        *(_DWORD *)&v54[6] = currentActiveRequestsCount;
        __int16 v35 = " [%s] %s:%d Notify client with new caps %d, currentActiveRequestsCount %d";
        v36 = v33;
        uint32_t v37 = 40;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          long long v31 = (__CFString *)[(AVCMoments *)self performSelector:sel_logPrefix];
        }
        else {
          long long v31 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_55;
        }
        uint64_t v38 = VRTraceErrorLogLevelToCSTR();
        __int16 v39 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_55;
        }
        int v40 = self->_currentActiveRequestsCount;
        *(_DWORD *)buf = 136316674;
        uint64_t v48 = v38;
        __int16 v49 = 2080;
        v50 = "-[AVCMoments didFinishRequestHelperWithResult:]";
        __int16 v51 = 1024;
        int v52 = 381;
        __int16 v53 = 2112;
        *(void *)v54 = v31;
        *(_WORD *)&v54[8] = 2048;
        v55 = self;
        __int16 v56 = 1024;
        LODWORD(v57[0]) = 7;
        WORD2(v57[0]) = 1024;
        *(_DWORD *)((char *)v57 + 6) = v40;
        __int16 v35 = " [%s] %s:%d %@(%p) Notify client with new caps %d, currentActiveRequestsCount %d";
        v36 = v39;
        uint32_t v37 = 60;
      }
      _os_log_impl(&dword_1E1EA4000, v36, OS_LOG_TYPE_DEFAULT, v35, buf, v37);
LABEL_55:
      [(AVCMoments *)self updateCapabilities:7];
    }
  }
}

- (void)updateCapabilities:(unsigned int)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_delegateQueue);
  if (self->_capabilities != a3)
  {
    self->_uint64_t capabilities = a3;
    char v5 = [(AVCMoments *)self delegate];
    uint64_t capabilities = self->_capabilities;
    [(AVCMomentsDelegate *)v5 moments:self capabilitiesDidChange:capabilities];
  }
}

- (AVCMomentsDelegate)delegate
{
  return (AVCMomentsDelegate *)objc_loadWeak(&self->_delegate);
}

- (id)newRequestWithMediaType:(unsigned __int8)a3 requesteeID:(id)a4
{
  uint64_t v5 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_alloc_init(AVCMediaRecorderRequestConfiguration);
  [(AVCMediaRecorderRequestConfiguration *)v7 setMediaType:v5];
  [(AVCMediaRecorderRequestConfiguration *)v7 setRequestMode:2];
  [(AVCMediaRecorderRequestConfiguration *)v7 setRequesteeID:a4];
  long long v10 = *MEMORY[0x1E4F1F9F8];
  uint64_t v11 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  [(AVCMediaRecorderRequestConfiguration *)v7 setMovieFragmentInterval:&v10];
  id v8 = [(AVCMoments *)self newRequestWithConfiguration:v7];

  return v8;
}

- (id)newRequestWithMediaType:(unsigned __int8)a3 mode:(unsigned __int8)a4 requesteeID:(id)a5
{
  uint64_t v6 = a4;
  uint64_t v7 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = objc_alloc_init(AVCMediaRecorderRequestConfiguration);
  [(AVCMediaRecorderRequestConfiguration *)v9 setMediaType:v7];
  [(AVCMediaRecorderRequestConfiguration *)v9 setRequestMode:v6];
  [(AVCMediaRecorderRequestConfiguration *)v9 setRequesteeID:a5];
  long long v12 = *MEMORY[0x1E4F1F9F8];
  uint64_t v13 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  [(AVCMediaRecorderRequestConfiguration *)v9 setMovieFragmentInterval:&v12];
  id v10 = [(AVCMoments *)self newRequestWithConfiguration:v9];

  return v10;
}

- (id)newRequestWithConfiguration:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if ((AVCMoments *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v36 = v6;
        __int16 v37 = 2080;
        uint64_t v38 = "-[AVCMoments newRequestWithConfiguration:]";
        __int16 v39 = 1024;
        int v40 = 427;
        __int16 v41 = 2112;
        id v42 = a3;
        id v8 = " [%s] %s:%d configuration=%@";
        uint64_t v9 = v7;
        uint32_t v10 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(AVCMoments *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      long long v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v36 = v11;
        __int16 v37 = 2080;
        uint64_t v38 = "-[AVCMoments newRequestWithConfiguration:]";
        __int16 v39 = 1024;
        int v40 = 427;
        __int16 v41 = 2112;
        id v42 = v5;
        __int16 v43 = 2048;
        uint64_t v44 = self;
        __int16 v45 = 2112;
        id v46 = a3;
        id v8 = " [%s] %s:%d %@(%p) configuration=%@";
        uint64_t v9 = v12;
        uint32_t v10 = 58;
        goto LABEL_11;
      }
    }
  }
  if ([a3 requestMode] == 1 && !self->_isLocalRecordingEnabled)
  {
    if ((AVCMoments *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCMoments newRequestWithConfiguration:]();
        }
      }
      return 0;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v23 = (__CFString *)[(AVCMoments *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v23 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v28 = VRTraceErrorLogLevelToCSTR();
      uint64_t v29 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v36 = v28;
        __int16 v37 = 2080;
        uint64_t v38 = "-[AVCMoments newRequestWithConfiguration:]";
        __int16 v39 = 1024;
        int v40 = 430;
        __int16 v41 = 2112;
        id v42 = v23;
        __int16 v43 = 2048;
        uint64_t v44 = self;
        __int16 v45 = 1024;
        LODWORD(v46) = 1;
        uint64_t v27 = " [%s] %s:%d %@(%p) mode=%d is not supported";
        int v30 = v29;
        uint32_t v31 = 54;
LABEL_63:
        _os_log_error_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_ERROR, v27, buf, v31);
        return 0;
      }
    }
    return 0;
  }
  int v13 = [a3 mediaType] & 0xFE;
  if (v13 == 2 && self->_currentActiveRequestsCount > 99999)
  {
    if ((AVCMoments *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCMoments newRequestWithConfiguration:]();
        }
      }
      return 0;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v24 = (__CFString *)[(AVCMoments *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v24 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v32 = VRTraceErrorLogLevelToCSTR();
      uint64_t v26 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v36 = v32;
        __int16 v37 = 2080;
        uint64_t v38 = "-[AVCMoments newRequestWithConfiguration:]";
        __int16 v39 = 1024;
        int v40 = 435;
        __int16 v41 = 2112;
        id v42 = v24;
        __int16 v43 = 2048;
        uint64_t v44 = self;
        uint64_t v27 = " [%s] %s:%d %@(%p) Current active request count has reached max. Can't process anymore";
        goto LABEL_62;
      }
    }
    return 0;
  }
  uint64_t v14 = [[AVCMomentsRequest alloc] initWithConfiguration:a3 requesterID:self->_requesterID];
  if (!v14)
  {
    if ((AVCMoments *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCMoments newRequestWithConfiguration:]();
        }
      }
      return 0;
    }
    if (objc_opt_respondsToSelector()) {
      id v22 = (__CFString *)[(AVCMoments *)self performSelector:sel_logPrefix];
    }
    else {
      id v22 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      uint64_t v26 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v36 = v25;
        __int16 v37 = 2080;
        uint64_t v38 = "-[AVCMoments newRequestWithConfiguration:]";
        __int16 v39 = 1024;
        int v40 = 440;
        __int16 v41 = 2112;
        id v42 = v22;
        __int16 v43 = 2048;
        uint64_t v44 = self;
        uint64_t v27 = " [%s] %s:%d %@(%p) Failed to allocate new request";
LABEL_62:
        int v30 = v26;
        uint32_t v31 = 48;
        goto LABEL_63;
      }
    }
    return 0;
  }
  uint64_t v15 = v14;
  [(AVCMomentsRequest *)v14 setDelegate:self];
  [(NSMutableDictionary *)self->_requests setObject:v15 forKeyedSubscript:[(AVCMomentsRequest *)v15 transactionID]];
  int currentActiveRequestsCount = self->_currentActiveRequestsCount;
  if (v13 == 2) {
    self->_int currentActiveRequestsCount = ++currentActiveRequestsCount;
  }
  if (currentActiveRequestsCount == 100000)
  {
    if ((AVCMoments *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCMoments newRequestWithConfiguration:].cold.4();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v17 = (__CFString *)[(AVCMoments *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v17 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        uint64_t v19 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v36 = v18;
          __int16 v37 = 2080;
          uint64_t v38 = "-[AVCMoments newRequestWithConfiguration:]";
          __int16 v39 = 1024;
          int v40 = 450;
          __int16 v41 = 2112;
          id v42 = v17;
          __int16 v43 = 2048;
          uint64_t v44 = self;
          __int16 v45 = 1024;
          LODWORD(v46) = 1;
          _os_log_error_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Notify client reached max request capabilities %d", buf, 0x36u);
        }
      }
    }
    delegateQueue = self->_delegateQueue;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __42__AVCMoments_newRequestWithConfiguration___block_invoke;
    v33[3] = &unk_1E6DB3F08;
    v33[4] = self;
    int v34 = 1;
    dispatch_async(delegateQueue, v33);
  }
  return v15;
}

uint64_t __42__AVCMoments_newRequestWithConfiguration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateCapabilities:*(unsigned int *)(a1 + 40)];
}

- (BOOL)avcMediaRecorderRequestDidStartRequest:(id)a3 withError:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ((AVCMoments *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (a3) {
          uint32_t v10 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        }
        else {
          uint32_t v10 = "<nil>";
        }
        *(_DWORD *)uint64_t v23 = 136315906;
        *(void *)&v23[4] = v8;
        *(_WORD *)&v23[12] = 2080;
        *(void *)&v23[14] = "-[AVCMoments avcMediaRecorderRequestDidStartRequest:withError:]";
        *(_WORD *)&v23[22] = 1024;
        LODWORD(v24) = 462;
        WORD2(v24) = 2080;
        *(void *)((char *)&v24 + 6) = v10;
        uint64_t v14 = " [%s] %s:%d AVCMoments: avcMomentsRequestDidStartRequest %s";
        uint64_t v15 = v9;
        uint32_t v16 = 38;
        goto LABEL_17;
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[(AVCMoments *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      long long v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (a3) {
          int v13 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        }
        else {
          int v13 = "<nil>";
        }
        *(_DWORD *)uint64_t v23 = 136316418;
        *(void *)&v23[4] = v11;
        *(_WORD *)&v23[12] = 2080;
        *(void *)&v23[14] = "-[AVCMoments avcMediaRecorderRequestDidStartRequest:withError:]";
        *(_WORD *)&v23[22] = 1024;
        LODWORD(v24) = 462;
        WORD2(v24) = 2112;
        *(void *)((char *)&v24 + 6) = v7;
        HIWORD(v24) = 2048;
        uint64_t v25 = self;
        LOWORD(v26) = 2080;
        *(void *)((char *)&v26 + 2) = v13;
        uint64_t v14 = " [%s] %s:%d %@(%p) AVCMoments: avcMomentsRequestDidStartRequest %s";
        uint64_t v15 = v12;
        uint32_t v16 = 58;
LABEL_17:
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, v23, v16);
      }
    }
  }
  char v17 = objc_msgSend(a3, "validateWithError:", a4, *(_OWORD *)v23, *(void *)&v23[16], v24, v25, v26);
  if (v17)
  {
    -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaRecorderStartRequest", [a3 serialize]);
  }
  else if ((AVCMoments *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCMoments avcMediaRecorderRequestDidStartRequest:withError:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v18 = (__CFString *)[(AVCMoments *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v18 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      int v20 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        if (*a4) {
          id v22 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
        }
        else {
          id v22 = "<nil>";
        }
        *(_DWORD *)uint64_t v23 = 136316418;
        *(void *)&v23[4] = v19;
        *(_WORD *)&v23[12] = 2080;
        *(void *)&v23[14] = "-[AVCMoments avcMediaRecorderRequestDidStartRequest:withError:]";
        *(_WORD *)&v23[22] = 1024;
        LODWORD(v24) = 465;
        WORD2(v24) = 2112;
        *(void *)((char *)&v24 + 6) = v18;
        HIWORD(v24) = 2048;
        uint64_t v25 = self;
        LOWORD(v26) = 2080;
        *(void *)((char *)&v26 + 2) = v22;
        _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) failed validation with error %s", v23, 0x3Au);
      }
    }
  }
  return v17;
}

- (BOOL)avcMediaRecorderRequestDidEndRequest:(id)a3 withError:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((AVCMoments *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (a3) {
          uint32_t v10 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        }
        else {
          uint32_t v10 = "<nil>";
        }
        *(_DWORD *)id v22 = 136315906;
        *(void *)&v22[4] = v8;
        *(_WORD *)&v22[12] = 2080;
        *(void *)&v22[14] = "-[AVCMoments avcMediaRecorderRequestDidEndRequest:withError:]";
        *(_WORD *)&v22[22] = 1024;
        LODWORD(v23) = 475;
        WORD2(v23) = 2080;
        *(void *)((char *)&v23 + 6) = v10;
        uint64_t v14 = " [%s] %s:%d AVCMoments: avcMomentsRequestDidEndRequest %s";
        uint64_t v15 = v9;
        uint32_t v16 = 38;
        goto LABEL_17;
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[(AVCMoments *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      long long v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (a3) {
          int v13 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        }
        else {
          int v13 = "<nil>";
        }
        *(_DWORD *)id v22 = 136316418;
        *(void *)&v22[4] = v11;
        *(_WORD *)&v22[12] = 2080;
        *(void *)&v22[14] = "-[AVCMoments avcMediaRecorderRequestDidEndRequest:withError:]";
        *(_WORD *)&v22[22] = 1024;
        LODWORD(v23) = 475;
        WORD2(v23) = 2112;
        *(void *)((char *)&v23 + 6) = v7;
        HIWORD(v23) = 2048;
        long long v24 = self;
        LOWORD(v25) = 2080;
        *(void *)((char *)&v25 + 2) = v13;
        uint64_t v14 = " [%s] %s:%d %@(%p) AVCMoments: avcMomentsRequestDidEndRequest %s";
        uint64_t v15 = v12;
        uint32_t v16 = 58;
LABEL_17:
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, v22, v16);
      }
    }
  }
  char v17 = objc_msgSend(a3, "validateWithError:", a4, *(_OWORD *)v22, *(void *)&v22[16], v23, v24, v25);
  if (v17)
  {
    if ([a3 mediaType] == 2
      || [a3 mediaType] == 4
      || [a3 mediaType] == 5)
    {
      -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaRecorderEndRequest", [a3 serialize]);
    }
  }
  else if ((AVCMoments *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCMoments avcMediaRecorderRequestDidEndRequest:withError:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v18 = (__CFString *)[(AVCMoments *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v18 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      int v20 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id v22 = 136316162;
        *(void *)&v22[4] = v19;
        *(_WORD *)&v22[12] = 2080;
        *(void *)&v22[14] = "-[AVCMoments avcMediaRecorderRequestDidEndRequest:withError:]";
        *(_WORD *)&v22[22] = 1024;
        LODWORD(v23) = 477;
        WORD2(v23) = 2112;
        *(void *)((char *)&v23 + 6) = v18;
        HIWORD(v23) = 2048;
        long long v24 = self;
        _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) failed validation", v22, 0x30u);
      }
    }
  }
  return v17;
}

- (BOOL)avcMediaRecorderRequestDidRejectRequest:(id)a3 withError:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  char v6 = [a3 validateWithError:a4];
  if (v6)
  {
    -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaRecorderRejectRequest", [a3 serialize]);
  }
  else if ((AVCMoments *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCMoments avcMediaRecorderRequestDidRejectRequest:withError:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[(AVCMoments *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v11 = 136316162;
        uint64_t v12 = v8;
        __int16 v13 = 2080;
        uint64_t v14 = "-[AVCMoments avcMediaRecorderRequestDidRejectRequest:withError:]";
        __int16 v15 = 1024;
        int v16 = 490;
        __int16 v17 = 2112;
        uint64_t v18 = v7;
        __int16 v19 = 2048;
        int v20 = self;
        _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) failed validation", (uint8_t *)&v11, 0x30u);
      }
    }
  }
  return v6;
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

- (unsigned)capabilities
{
  return self->_capabilities;
}

- (int)activeRequestCount
{
  return self->_currentActiveRequestsCount;
}

- (int)pendingRequestCount
{
  return self->_currentPendingRequestsCount;
}

- (NSString)requesterID
{
  return self->_requesterID;
}

- (void)initWithStreamToken:requesterID:delegate:dispatchQueue:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[AVCMoments initWithStreamToken:requesterID:delegate:dispatchQueue:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to connect to moments server with streamToken=%u", v2, *(const char **)v3, (unint64_t)"-[AVCMoments initWithStreamToken:requesterID:delegate:dispatchQueue:]" >> 16, 64);
}

- (void)initWithStreamToken:requesterID:delegate:dispatchQueue:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[AVCMoments initWithStreamToken:requesterID:delegate:dispatchQueue:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to set up delegate with streamToken=%u", v2, *(const char **)v3, (unint64_t)"-[AVCMoments initWithStreamToken:requesterID:delegate:dispatchQueue:]" >> 16, 62);
}

- (void)initWithConfiguration:delegate:dispatchQueue:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to connect to moments server", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:delegate:dispatchQueue:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to set up delegate", v2, v3, v4, v5, v6);
}

- (void)setupDelegate:dispatchQueue:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Delegate parameter is nil", v2, v3, v4, v5, v6);
}

- (void)setupDelegate:dispatchQueue:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate XPC connection", v2, v3, v4, v5, v6);
}

- (void)setupDelegate:dispatchQueue:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate requests dictionary", v2, v3, v4, v5, v6);
}

- (void)setupDelegate:dispatchQueue:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate _delegateQueue", v2, v3, v4, v5, v6);
}

- (void)connectWithConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  objc_msgSend((id)objc_msgSend(v0, "description"), "UTF8String");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d AVCMomentsClient: Failed connection with error=%s", v3, v4, v5, v6, v7);
}

- (void)didEndProcessingRequestHelperWithResult:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  id v0 = (objc_class *)objc_opt_class();
  class_getName(v0);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Unexpected class for movieURLResult=%s or failure to decode movieURL.", v3, v4, v5, v6, v7);
}

- (void)didEndProcessingRequestHelperWithResult:.cold.2()
{
  OUTLINED_FUNCTION_11_0();
  id v0 = (objc_class *)objc_opt_class();
  class_getName(v0);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Unexpected class for stillImageURLResult=%s or failure to decode stillImageURL.", v3, v4, v5, v6, v7);
}

- (void)newRequestWithConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[AVCMoments newRequestWithConfiguration:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d mode=%d is not supported", v2, *(const char **)v3, (unint64_t)"-[AVCMoments newRequestWithConfiguration:]" >> 16, 430);
}

- (void)newRequestWithConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Current active request count has reached max. Can't process anymore", v2, v3, v4, v5, v6);
}

- (void)newRequestWithConfiguration:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate new request", v2, v3, v4, v5, v6);
}

- (void)newRequestWithConfiguration:.cold.4()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = "-[AVCMoments newRequestWithConfiguration:]";
  OUTLINED_FUNCTION_3();
  int v4 = 450;
  __int16 v5 = v0;
  int v6 = 1;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Notify client reached max request capabilities %d", v2, 0x22u);
}

- (void)avcMediaRecorderRequestDidStartRequest:withError:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  if (*v0) {
    objc_msgSend((id)objc_msgSend(*v0, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d failed validation with error %s", v3, v4, v5, v6, v7);
}

- (void)avcMediaRecorderRequestDidEndRequest:withError:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d failed validation", v2, v3, v4, v5, v6);
}

- (void)avcMediaRecorderRequestDidRejectRequest:withError:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d failed validation", v2, v3, v4, v5, v6);
}

@end