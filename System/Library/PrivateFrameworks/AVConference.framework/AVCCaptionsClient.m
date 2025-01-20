@interface AVCCaptionsClient
+ (BOOL)isCaptioningSupported;
+ (id)serializeConfiguration:(id)a3;
- (AVCCaptionsClient)initWithDelegate:(id)a3 streamToken:(int64_t)a4;
- (AVCCaptionsClientDelegate)delegate;
- (BOOL)captionsEnabled;
- (BOOL)captionsSupported;
- (BOOL)connect;
- (id)captionsResultsWithInternalResults:(id)a3;
- (int64_t)streamToken;
- (void)configureCaptions:(id)a3;
- (void)dealloc;
- (void)deregisterBlocksForNotifications;
- (void)didDetectGibberish:(BOOL)a3;
- (void)didDisableCaptions:(BOOL)a3 error:(id)a4;
- (void)didEnableCaptions:(BOOL)a3 error:(id)a4;
- (void)didStartCaptioningWithReason:(unsigned __int8)a3;
- (void)didStopCaptioningWithReason:(unsigned __int8)a3;
- (void)didUpdateCaptions:(id)a3 isRemote:(BOOL)a4;
- (void)disconnect;
- (void)enableCaptions:(BOOL)a3;
- (void)registerBlocksForNotifications;
@end

@implementation AVCCaptionsClient

- (AVCCaptionsClient)initWithDelegate:(id)a3 streamToken:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)AVCCaptionsClient;
  v6 = [(AVCCaptionsClient *)&v13 init];
  v7 = v6;
  if (!v6) {
    return v7;
  }
  v6->_streamToken = a4;
  if (!+[VCHardwareSettings isCaptionsSupported])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v15 = v11;
        __int16 v16 = 2080;
        v17 = "-[AVCCaptionsClient initWithDelegate:streamToken:]";
        __int16 v18 = 1024;
        int v19 = 50;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVC Captioning is not supported on the device", buf, 0x1Cu);
      }
    }
    goto LABEL_25;
  }
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCCaptionsClient initWithDelegate:streamToken:]();
      }
    }
    goto LABEL_25;
  }
  if (([a3 conformsToProtocol:&unk_1F3E487B8] & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCCaptionsClient initWithDelegate:streamToken:].cold.5();
      }
    }
    goto LABEL_25;
  }
  v7->_connection = objc_alloc_init(AVConferenceXPCClient);
  objc_storeWeak(&v7->_delegate, a3);
  if (!v7->_connection)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCCaptionsClient initWithDelegate:streamToken:]();
      }
    }
    goto LABEL_25;
  }
  if (![(AVCCaptionsClient *)v7 connect])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCCaptionsClient initWithDelegate:streamToken:].cold.4();
      }
    }
LABEL_25:

    return 0;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
  dispatch_queue_t v9 = dispatch_queue_create_with_target_V2("com.apple.AVConference.avccaptionsclient.callback.queue", 0, CustomRootQueue);
  v7->_callbackQueue = (OS_dispatch_queue *)v9;
  if (v9)
  {
    [(AVCCaptionsClient *)v7 registerBlocksForNotifications];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[AVCCaptionsClient initWithDelegate:streamToken:]();
    }
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [(AVCCaptionsClient *)self deregisterBlocksForNotifications];
  [(AVCCaptionsClient *)self disconnect];
  objc_storeWeak(&self->_delegate, 0);
  callbackQueue = self->_callbackQueue;
  if (callbackQueue)
  {
    dispatch_release(callbackQueue);
    self->_callbackQueue = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)AVCCaptionsClient;
  [(AVCCaptionsClient *)&v4 dealloc];
}

- (BOOL)connect
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    objc_super v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int64_t streamToken = self->_streamToken;
      *(_DWORD *)buf = 136315906;
      uint64_t v16 = v3;
      __int16 v17 = 2080;
      __int16 v18 = "-[AVCCaptionsClient connect]";
      __int16 v19 = 1024;
      int v20 = 89;
      __int16 v21 = 1024;
      int v22 = streamToken;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCCaptionsClient: connect for streamToken:%u", buf, 0x22u);
    }
  }
  v6 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:LODWORD(self->_streamToken)];
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v6, @"vcCaptionsStreamToken", 0);
  id v8 = [(AVConferenceXPCClient *)self->_connection sendMessageSync:"vcCaptionsClientInitialize" arguments:v7];

  dispatch_queue_t v9 = (void *)[v8 objectForKeyedSubscript:@"ERROR"];
  if (v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int64_t v13 = self->_streamToken;
        uint64_t v14 = objc_msgSend((id)objc_msgSend(v9, "description"), "UTF8String");
        *(_DWORD *)buf = 136316162;
        uint64_t v16 = v10;
        __int16 v17 = 2080;
        __int16 v18 = "-[AVCCaptionsClient connect]";
        __int16 v19 = 1024;
        int v20 = 98;
        __int16 v21 = 1024;
        int v22 = v13;
        __int16 v23 = 2080;
        uint64_t v24 = v14;
        _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d AVCCaptionsClient: Failed connection for streamToken=%u Error=%s", buf, 0x2Cu);
      }
    }
  }
  return v9 == 0;
}

- (void)disconnect
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    objc_super v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int64_t streamToken = self->_streamToken;
      int v6 = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      dispatch_queue_t v9 = "-[AVCCaptionsClient disconnect]";
      __int16 v10 = 1024;
      int v11 = 104;
      __int16 v12 = 1024;
      int v13 = streamToken;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCCaptionsClient: disconnect for streamToken:%u", (uint8_t *)&v6, 0x22u);
    }
  }
  [(AVConferenceXPCClient *)self->_connection sendMessageSync:"vcCaptionsClientUninitialize"];
}

- (void)registerBlocksForNotifications
{
  v10[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke;
  v10[3] = &unk_1E6DB4338;
  v10[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcCaptionsDidEnableCaptions" block:v10 queue:self->_callbackQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_2;
  v9[3] = &unk_1E6DB4338;
  v9[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcCaptionsDidDisableCaptions" block:v9 queue:self->_callbackQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_3;
  v8[3] = &unk_1E6DB4338;
  v8[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcCaptionsDidCaptionsStart" block:v8 queue:self->_callbackQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_4;
  v7[3] = &unk_1E6DB4338;
  v7[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcCaptionsDidCaptionsEnd" block:v7 queue:self->_callbackQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_5;
  v6[3] = &unk_1E6DB4338;
  v6[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcCaptionsDidUpdateCaptions" block:v6 queue:self->_callbackQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_109;
  v5[3] = &unk_1E6DB4338;
  v5[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcCaptionsDidDetectGibberish" block:v5 queue:self->_callbackQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_2_114;
  v4[3] = &unk_1E6DB4338;
  v4[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"conferenceDidServerDie" block:v4 queue:self->_callbackQueue];
}

uint64_t __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 objectForKeyedSubscript:@"SERVERDIED"];
  if (!result)
  {
    uint64_t result = [*(id *)(a1 + 32) strong];
    if (result)
    {
      uint64_t v5 = (void *)result;
      uint64_t v6 = [a2 objectForKey:@"vcCaptionsError"];
      if (v6) {
        uint64_t v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:0];
      }
      uint64_t v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"vcCaptionsEnabled"), "BOOLValue");
      return [v5 didEnableCaptions:v7 error:v6];
    }
  }
  return result;
}

uint64_t __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 objectForKeyedSubscript:@"SERVERDIED"];
  if (!result)
  {
    uint64_t result = [*(id *)(a1 + 32) strong];
    if (result)
    {
      uint64_t v5 = (void *)result;
      uint64_t v6 = [a2 objectForKey:@"vcCaptionsError"];
      if (v6) {
        uint64_t v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:0];
      }
      uint64_t v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"vcCaptionsDisabled"), "BOOLValue");
      return [v5 didDisableCaptions:v7 error:v6];
    }
  }
  return result;
}

uint64_t __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result = [a2 objectForKeyedSubscript:@"SERVERDIED"];
  if (!result)
  {
    uint64_t result = [*(id *)(a1 + 32) strong];
    if (result)
    {
      uint64_t v5 = (void *)result;
      uint64_t v6 = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"vcCaptionsStartReason"), "unsignedCharValue");
      return [v5 didStartCaptioningWithReason:v6];
    }
  }
  return result;
}

uint64_t __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t result = [a2 objectForKeyedSubscript:@"SERVERDIED"];
  if (!result)
  {
    uint64_t result = [*(id *)(a1 + 32) strong];
    if (result)
    {
      uint64_t v5 = (void *)result;
      uint64_t v6 = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"vcCaptionsStopReason"), "unsignedCharValue");
      return [v5 didStopCaptioningWithReason:v6];
    }
  }
  return result;
}

void __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v4 = [*(id *)(a1 + 32) strong];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      id v13 = 0;
      id v6 = +[VCCaptionsTranscriptionArchiving unarchivedTranscriptionFromData:error:](VCCaptionsTranscriptionArchiving, "unarchivedTranscriptionFromData:error:", [a2 objectForKey:@"vcCaptionsTranscription"], &v13);
      if (v13)
      {
        if (objc_opt_class() == v5)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v8 = VRTraceErrorLogLevelToCSTR();
            dispatch_queue_t v9 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_5_cold_1(v8, &v13, v9);
            }
          }
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            uint64_t v7 = (__CFString *)[v5 performSelector:sel_logPrefix];
          }
          else {
            uint64_t v7 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v10 = VRTraceErrorLogLevelToCSTR();
            int v11 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              uint64_t v12 = [v13 debugDescription];
              *(_DWORD *)buf = 136316418;
              uint64_t v15 = v10;
              __int16 v16 = 2080;
              __int16 v17 = "-[AVCCaptionsClient registerBlocksForNotifications]_block_invoke";
              __int16 v18 = 1024;
              int v19 = 183;
              __int16 v20 = 2112;
              __int16 v21 = v7;
              __int16 v22 = 2048;
              __int16 v23 = v5;
              __int16 v24 = 2112;
              uint64_t v25 = v12;
              _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to unarchive captions transcription in XPC callback, error=%@", buf, 0x3Au);
            }
          }
        }
      }
      else
      {
        objc_msgSend(v5, "didUpdateCaptions:isRemote:", v6, objc_msgSend(v6, "isLocal") ^ 1);
      }
    }
  }
}

uint64_t __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_109(uint64_t a1, void *a2)
{
  uint64_t result = [a2 objectForKeyedSubscript:@"SERVERDIED"];
  if (!result)
  {
    uint64_t result = [*(id *)(a1 + 32) strong];
    if (result)
    {
      uint64_t v5 = (void *)result;
      uint64_t v6 = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"vcCaptionsGibberish"), "BOOLValue");
      return [v5 didDetectGibberish:v6];
    }
  }
  return result;
}

void __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_2_114(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) strong];
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v3)
    {
      if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_2_114_cold_2();
        }
      }
      objc_msgSend((id)objc_msgSend(v3, "delegate"), "captionsServerDidDie:", v3);
    }
    else if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_2_114_cold_1();
      }
    }
  }
}

- (void)deregisterBlocksForNotifications
{
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcCaptionsDidEnableCaptions"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcCaptionsDidDisableCaptions"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcCaptionsDidCaptionsStart"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcCaptionsDidCaptionsEnd"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcCaptionsDidUpdateCaptions"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcCaptionsDidDetectGibberish"];
  connection = self->_connection;

  [(AVConferenceXPCClient *)connection deregisterFromService:"conferenceDidServerDie"];
}

- (id)captionsResultsWithInternalResults:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [AVCCaptionsResult alloc];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "segments"), "count");
  uint64_t v6 = [a3 isFinal];
  uint64_t v7 = [a3 utteranceNumber];
  uint64_t v8 = [a3 updateNumber];
  [a3 utteranceStartTimestamp];
  double v10 = v9;
  [a3 utteranceDuration];
  uint64_t v12 = [(AVCCaptionsResult *)v4 initWithCapacity:v5 utteranceComplete:v6 utteranceNumber:v7 updateNumber:v8 utteranceStartTimestamp:v10 utteranceDuration:v11];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = (void *)[a3 segments];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v13);
        }
        __int16 v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v18 text]) {
          int v19 = (__CFString *)[v18 text];
        }
        else {
          int v19 = &stru_1F3D3E450;
        }
        double v20 = (double)[v18 confidence];
        uint64_t v21 = [v18 range];
        -[AVCCaptionsResult addTokenWithString:confidence:range:](v12, "addTokenWithString:confidence:range:", v19, v21, v22, v20);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v24 count:16];
    }
    while (v15);
  }
  return v12;
}

- (void)didEnableCaptions:(BOOL)a3 error:(id)a4
{
  BOOL v5 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCCaptionsClient-didEnableCaptions");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136316418;
      uint64_t v10 = v7;
      __int16 v11 = 2080;
      uint64_t v12 = "-[AVCCaptionsClient didEnableCaptions:error:]";
      __int16 v13 = 1024;
      int v14 = 246;
      __int16 v15 = 2048;
      uint64_t v16 = self;
      __int16 v17 = 1024;
      BOOL v18 = v5;
      __int16 v19 = 2112;
      id v20 = a4;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCCaptionsClient-didEnableCaptions (%p) enabled=%d error=%@", (uint8_t *)&v9, 0x36u);
    }
  }
  [(AVCCaptionsClientDelegate *)[(AVCCaptionsClient *)self delegate] captionsClient:self didEnableCaptions:v5 error:a4];
}

- (void)didDisableCaptions:(BOOL)a3 error:(id)a4
{
  BOOL v5 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCCaptionsClient-didDisableCaptions");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136316418;
      uint64_t v10 = v7;
      __int16 v11 = 2080;
      uint64_t v12 = "-[AVCCaptionsClient didDisableCaptions:error:]";
      __int16 v13 = 1024;
      int v14 = 251;
      __int16 v15 = 2048;
      uint64_t v16 = self;
      __int16 v17 = 1024;
      BOOL v18 = v5;
      __int16 v19 = 2112;
      id v20 = a4;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCCaptionsClient-didDisableCaptions (%p) disabled=%d error=%@", (uint8_t *)&v9, 0x36u);
    }
  }
  [(AVCCaptionsClientDelegate *)[(AVCCaptionsClient *)self delegate] captionsClient:self didDisableCaptions:v5 error:a4];
}

- (void)didStartCaptioningWithReason:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  BOOL v5 = [(AVCCaptionsClient *)self delegate];

  [(AVCCaptionsClientDelegate *)v5 captionsClient:self didStartCaptioningWithReason:v3];
}

- (void)didStopCaptioningWithReason:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  BOOL v5 = [(AVCCaptionsClient *)self delegate];

  [(AVCCaptionsClientDelegate *)v5 captionsClient:self didStopCaptioningWithReason:v3];
}

- (void)didUpdateCaptions:(id)a3 isRemote:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(AVCCaptionsClient *)self captionsResultsWithInternalResults:a3];
  uint64_t v7 = [(AVCCaptionsClient *)self delegate];

  [(AVCCaptionsClientDelegate *)v7 captionsClient:self didUpdateCaptions:v6 source:v4];
}

- (void)didDetectGibberish:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCCaptionsClient-didDetectGibberish");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    id v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136316162;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      uint64_t v10 = "-[AVCCaptionsClient didDetectGibberish:]";
      __int16 v11 = 1024;
      int v12 = 269;
      __int16 v13 = 2048;
      int v14 = self;
      __int16 v15 = 1024;
      BOOL v16 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCCaptionsClient-didDetectGibberish (%p) gibberish=%d", (uint8_t *)&v7, 0x2Cu);
    }
  }
  [(AVCCaptionsClient *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(AVCCaptionsClientDelegate *)[(AVCCaptionsClient *)self delegate] captionsClient:self didDetectGibberish:v3];
  }
}

- (AVCCaptionsClientDelegate)delegate
{
  return (AVCCaptionsClientDelegate *)objc_loadWeak(&self->_delegate);
}

- (BOOL)captionsEnabled
{
  id v2 = [(AVConferenceXPCClient *)self->_connection sendMessageSync:"vcCaptionsGetCaptionsEnabled" arguments:0];
  if (v2)
  {
    BOOL v3 = (void *)[v2 objectForKeyedSubscript:@"vcCaptionsEnabled"];
    LOBYTE(v2) = [v3 BOOLValue];
  }
  return (char)v2;
}

- (BOOL)captionsSupported
{
  id v2 = [(AVConferenceXPCClient *)self->_connection sendMessageSync:"vcCaptionsGetCaptionsSupported" arguments:0];
  if (v2)
  {
    BOOL v3 = (void *)[v2 objectForKeyedSubscript:@"vcCaptionsSupported"];
    LOBYTE(v2) = [v3 BOOLValue];
  }
  return (char)v2;
}

- (void)enableCaptions:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCCaptionsClient-enableCaptions");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    id v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      int v12 = "-[AVCCaptionsClient enableCaptions:]";
      __int16 v13 = 1024;
      int v14 = 304;
      __int16 v15 = 2112;
      BOOL v16 = self;
      __int16 v17 = 1024;
      BOOL v18 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCCaptionsClient-enableCaptions self=%@, isEnabled=%{BOOL}d", buf, 0x2Cu);
    }
  }
  int v7 = (void *)[objc_alloc(NSNumber) initWithBool:v3];
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"vcCaptionsEnable", 0);
  [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcCaptionsSetCaptionsEnabled" arguments:v8];
}

- (void)configureCaptions:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = +[AVCCaptionsClient serializeConfiguration:](AVCCaptionsClient, "serializeConfiguration:");
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCCaptionsClient-configureCaptions");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    int v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136316418;
      uint64_t v9 = v6;
      __int16 v10 = 2080;
      __int16 v11 = "-[AVCCaptionsClient configureCaptions:]";
      __int16 v12 = 1024;
      int v13 = 314;
      __int16 v14 = 2112;
      __int16 v15 = self;
      __int16 v16 = 2112;
      id v17 = a3;
      __int16 v18 = 1024;
      BOOL v19 = v5 != 0;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCCaptionsClient-configureCaptions self=%@ configuration=%@ argumentsSerialized=%{BOOL}d", (uint8_t *)&v8, 0x36u);
    }
  }
  if (v5) {
    [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcCaptionsSetCaptionsConfiguration" arguments:v5];
  }
}

+ (id)serializeConfiguration:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 locale];
  uint64_t v5 = [a3 usage];
  BOOL v6 = +[AVCCaptionsConfig isValidUsage:v5];
  BOOL v7 = v6;
  if (!v4 && !v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[AVCCaptionsClient serializeConfiguration:]();
      }
    }
    return 0;
  }
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[AVCCaptionsClient serializeConfiguration:]();
      }
    }
    return 0;
  }
  uint64_t v9 = (void *)v8;
  if (v4)
  {
    uint64_t v14 = 0;
    uint64_t v10 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v14];
    if (v10 && !v14)
    {
      [v9 setObject:v10 forKeyedSubscript:@"vcCaptionsLocale"];
      if (!v7) {
        return v9;
      }
      goto LABEL_10;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      int v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v16 = v12;
        __int16 v17 = 2080;
        __int16 v18 = "+[AVCCaptionsClient serializeConfiguration:]";
        __int16 v19 = 1024;
        int v20 = 332;
        __int16 v21 = 2112;
        uint64_t v22 = v10;
        __int16 v23 = 2112;
        uint64_t v24 = v14;
        _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d serializedLocale=%@ error=%@", buf, 0x30u);
      }
    }
  }
  else if (v7)
  {
LABEL_10:
    objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", v5), @"vcCaptionsUsage");
  }
  return v9;
}

+ (BOOL)isCaptioningSupported
{
  return +[VCHardwareSettings isCaptionsSupported];
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

- (void)initWithDelegate:streamToken:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Delegate parameter is nil", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:streamToken:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[AVCCaptionsClient initWithDelegate:streamToken:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate captions XPC connection for streamToken:%u", v2, *(const char **)v3, (unint64_t)"-[AVCCaptionsClient initWithDelegate:streamToken:]" >> 16, 55);
}

- (void)initWithDelegate:streamToken:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create callback queue", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:streamToken:.cold.4()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[AVCCaptionsClient initWithDelegate:streamToken:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to connect to captions server with streamToken:%u", v2, *(const char **)v3, (unint64_t)"-[AVCCaptionsClient initWithDelegate:streamToken:]" >> 16, 57);
}

- (void)initWithDelegate:streamToken:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Delegate doesn't conform to AVCCaptionsClientDelegate protocol", v2, v3, v4, v5, v6);
}

void __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_5_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*a2 debugDescription];
  int v6 = 136315906;
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  uint64_t v9 = "-[AVCCaptionsClient registerBlocksForNotifications]_block_invoke_5";
  OUTLINED_FUNCTION_3();
  int v10 = 183;
  __int16 v11 = 2112;
  uint64_t v12 = v5;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to unarchive captions transcription in XPC callback, error=%@", (uint8_t *)&v6, 0x26u);
}

void __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_2_114_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCCaptionsClient: server died", v2, v3, v4, v5, v6);
}

void __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_2_114_cold_2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[AVCCaptionsClient registerBlocksForNotifications]_block_invoke_2";
  OUTLINED_FUNCTION_3();
  LODWORD(v4) = 209;
  WORD2(v4) = 2048;
  HIWORD(v4) = v0;
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCCaptionsClient: serverd died, notifying client. self=%p", v2, *(const char **)v3, (unint64_t)"-[AVCCaptionsClient registerBlocksForNotifications]_block_invoke_2" >> 16, v4);
}

+ (void)serializeConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate arguments", v2, v3, v4, v5, v6);
}

+ (void)serializeConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No valid locale or usage on configuration=%@");
}

@end