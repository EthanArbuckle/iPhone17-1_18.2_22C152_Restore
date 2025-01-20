@interface VCTextStream
+ (void)terminateProcess:(id)a3 terminateSource:(id)a4 agent:(opaqueRTCReporting *)a5;
- (BOOL)onConfigureStreamWithConfiguration:(id)a3 error:(id *)a4;
- (BOOL)setupTextReceiverWithError:(id *)a3;
- (VCTextReceiverDelegate)receiveDelegate;
- (VCTextStream)init;
- (double)lastReceivedRTCPPacketTime;
- (double)lastReceivedRTPPacketTime;
- (double)rtcpHeartbeatLeeway;
- (id)supportedPayloads;
- (void)dealloc;
- (void)didReceiveCharacter:(unsigned __int16)a3;
- (void)didReceiveText:(id)a3;
- (void)onPauseWithCompletionHandler:(id)a3;
- (void)onResumeWithCompletionHandler:(id)a3;
- (void)onSendRTCPPacket;
- (void)onStartWithCompletionHandler:(id)a3;
- (void)onStopWithCompletionHandler:(id)a3;
- (void)sendCharacter:(unsigned __int16)a3;
- (void)sendText:(id)a3;
- (void)setReceiveDelegate:(id)a3;
- (void)setupTextTransmitter;
@end

@implementation VCTextStream

+ (void)terminateProcess:(id)a3 terminateSource:(id)a4 agent:(opaqueRTCReporting *)a5
{
}

- (VCTextStream)init
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)VCTextStream;
  v2 = [(VCMediaStream *)&v6 init];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v8 = v3;
      __int16 v9 = 2080;
      v10 = "-[VCTextStream init]";
      __int16 v11 = 1024;
      int v12 = 46;
      __int16 v13 = 2048;
      v14 = v2;
      __int16 v15 = 2080;
      v16 = "-[VCTextStream init]";
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCTextStream [%s] %s:%d VCTextStream[%p] %s", buf, 0x30u);
    }
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((VCTextStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v13 = v4;
        __int16 v14 = 2080;
        __int16 v15 = "-[VCTextStream dealloc]";
        __int16 v16 = 1024;
        int v17 = 51;
        objc_super v6 = "VCTextStream [%s] %s:%d ";
        v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (__CFString *)[(VCTextStream *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v13 = v9;
        __int16 v14 = 2080;
        __int16 v15 = "-[VCTextStream dealloc]";
        __int16 v16 = 1024;
        int v17 = 51;
        __int16 v18 = 2112;
        v19 = v3;
        __int16 v20 = 2048;
        v21 = self;
        objc_super v6 = "VCTextStream [%s] %s:%d %@(%p) ";
        v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }

  objc_storeWeak((id *)&self->_receiveDelegate, 0);
  v11.receiver = self;
  v11.super_class = (Class)VCTextStream;
  [(VCMediaStream *)&v11 dealloc];
}

- (void)setReceiveDelegate:(id)a3
{
}

- (VCTextReceiverDelegate)receiveDelegate
{
  return (VCTextReceiverDelegate *)objc_loadWeak((id *)&self->_receiveDelegate);
}

- (void)sendCharacter:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((VCTextStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E4F47A50];
      uint32_t v8 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v15 = 136315906;
          *(void *)&v15[4] = v6;
          *(_WORD *)&v15[12] = 2080;
          *(void *)&v15[14] = "-[VCTextStream sendCharacter:]";
          *(_WORD *)&v15[22] = 1024;
          LODWORD(v16) = 71;
          WORD2(v16) = 1024;
          *(_DWORD *)((char *)&v16 + 6) = v3;
          uint64_t v9 = "VCTextStream [%s] %s:%d Sending text:'%C'";
          v10 = v7;
          uint32_t v11 = 34;
LABEL_13:
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, v15, v11);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        [(VCTextStream *)v6 sendCharacter:v7];
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v5 = (__CFString *)[(VCTextStream *)self performSelector:sel_logPrefix];
    }
    else {
      v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      __int16 v14 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v15 = 136316418;
          *(void *)&v15[4] = v12;
          *(_WORD *)&v15[12] = 2080;
          *(void *)&v15[14] = "-[VCTextStream sendCharacter:]";
          *(_WORD *)&v15[22] = 1024;
          LODWORD(v16) = 71;
          WORD2(v16) = 2112;
          *(void *)((char *)&v16 + 6) = v5;
          HIWORD(v16) = 2048;
          int v17 = self;
          LOWORD(v18) = 1024;
          *(_DWORD *)((char *)&v18 + 2) = v3;
          uint64_t v9 = "VCTextStream [%s] %s:%d %@(%p) Sending text:'%C'";
          v10 = v13;
          uint32_t v11 = 54;
          goto LABEL_13;
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int16 v15 = 136316418;
        *(void *)&v15[4] = v12;
        *(_WORD *)&v15[12] = 2080;
        *(void *)&v15[14] = "-[VCTextStream sendCharacter:]";
        *(_WORD *)&v15[22] = 1024;
        LODWORD(v16) = 71;
        WORD2(v16) = 2112;
        *(void *)((char *)&v16 + 6) = v5;
        HIWORD(v16) = 2048;
        int v17 = self;
        LOWORD(v18) = 1024;
        *(_DWORD *)((char *)&v18 + 2) = v3;
        _os_log_debug_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEBUG, "VCTextStream [%s] %s:%d %@(%p) Sending text:'%C'", v15, 0x36u);
      }
    }
  }
  -[VCTextTransmitter sendCharacter:](self->_textTransmitter, "sendCharacter:", v3, *(_OWORD *)v15, *(void *)&v15[16], v16, v17, v18, v19);
}

- (void)sendText:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((VCTextStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E4F47A50];
      uint32_t v8 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v15 = 136315906;
          *(void *)&v15[4] = v6;
          *(_WORD *)&v15[12] = 2080;
          *(void *)&v15[14] = "-[VCTextStream sendText:]";
          *(_WORD *)&v15[22] = 1024;
          LODWORD(v16) = 76;
          WORD2(v16) = 2112;
          *(void *)((char *)&v16 + 6) = a3;
          uint64_t v9 = "VCTextStream [%s] %s:%d Sending text:%@";
          v10 = v7;
          uint32_t v11 = 38;
LABEL_13:
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, v15, v11);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        -[VCTextStream sendText:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v5 = (__CFString *)[(VCTextStream *)self performSelector:sel_logPrefix];
    }
    else {
      v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      __int16 v14 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v15 = 136316418;
          *(void *)&v15[4] = v12;
          *(_WORD *)&v15[12] = 2080;
          *(void *)&v15[14] = "-[VCTextStream sendText:]";
          *(_WORD *)&v15[22] = 1024;
          LODWORD(v16) = 76;
          WORD2(v16) = 2112;
          *(void *)((char *)&v16 + 6) = v5;
          HIWORD(v16) = 2048;
          int v17 = self;
          LOWORD(v18) = 2112;
          *(void *)((char *)&v18 + 2) = a3;
          uint64_t v9 = "VCTextStream [%s] %s:%d %@(%p) Sending text:%@";
          v10 = v13;
          uint32_t v11 = 58;
          goto LABEL_13;
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int16 v15 = 136316418;
        *(void *)&v15[4] = v12;
        *(_WORD *)&v15[12] = 2080;
        *(void *)&v15[14] = "-[VCTextStream sendText:]";
        *(_WORD *)&v15[22] = 1024;
        LODWORD(v16) = 76;
        WORD2(v16) = 2112;
        *(void *)((char *)&v16 + 6) = v5;
        HIWORD(v16) = 2048;
        int v17 = self;
        LOWORD(v18) = 2112;
        *(void *)((char *)&v18 + 2) = a3;
        _os_log_debug_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEBUG, "VCTextStream [%s] %s:%d %@(%p) Sending text:%@", v15, 0x3Au);
      }
    }
  }
  -[VCTextTransmitter sendText:](self->_textTransmitter, "sendText:", a3, *(_OWORD *)v15, *(void *)&v15[16], v16, v17, v18);
}

- (void)didReceiveCharacter:(unsigned __int16)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((VCTextStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTextStream didReceiveCharacter:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v4 = (__CFString *)[(VCTextStream *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v4 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v7 = 136316162;
        uint64_t v8 = v5;
        __int16 v9 = 2080;
        v10 = "-[VCTextStream didReceiveCharacter:]";
        __int16 v11 = 1024;
        int v12 = 83;
        __int16 v13 = 2112;
        __int16 v14 = v4;
        __int16 v15 = 2048;
        long long v16 = self;
        _os_log_error_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_ERROR, "VCTextStream [%s] %s:%d %@(%p) Error: -didReceiveText: should be called instead of this method.", (uint8_t *)&v7, 0x30u);
      }
    }
  }
}

- (void)didReceiveText:(id)a3
{
  uint64_t v4 = [(VCTextStream *)self receiveDelegate];

  [(VCTextReceiverDelegate *)v4 didReceiveText:a3];
}

- (id)supportedPayloads
{
  return &unk_1F3DC7128;
}

- (void)setupTextTransmitter
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];

  uint64_t v3 = [(VCMediaStream *)self defaultStreamConfig];
  HIDWORD(v6) = [(VCMediaStreamConfig *)v3 isRedEnabled];
  int v7 = [(VCMediaStreamConfig *)v3 numRedundantPayloads];
  [(VCMediaStreamConfig *)v3 txIntervalMin];
  int v8 = v4;
  self->_textTransmitter = [[VCTextTransmitter alloc] initWithConfiguration:&v5];
}

- (BOOL)setupTextReceiverWithError:(id *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];

  int v8 = [(VCMediaStreamTransport *)[(VCMediaStream *)self defaultTransport] rtpHandle];
  uint64_t v9 = 1000;
  if (self->super._transportSetupInfo.setupType == 5) {
    BYTE4(v9) = 1;
  }
  uint64_t v5 = [[VCTextReceiver alloc] initWithConfiguration:&v8];
  uint64_t v6 = v5;
  self->_textReceiver = v5;
  if (v5)
  {
    [(VCTextReceiver *)v5 setDelegate:self];
    [(VCTextReceiver *)self->_textReceiver setSupportedPayloads:[(NSDictionary *)[(VCMediaStreamConfig *)[(VCMediaStream *)self defaultStreamConfig] rxPayloadMap] allKeys]];
  }
  else if (a3)
  {
    *a3 = (id)[MEMORY[0x1E4F28C58] AVConferenceServiceError:32000 detailCode:0 description:@"Failed to allocate the text receiver"];
  }
  return v6 != 0;
}

- (BOOL)onConfigureStreamWithConfiguration:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!a3 || [a3 count] != 1)
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32016, 105, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTextStream.m", 144), @"Invalid Parameter", @"Called with an invalid parameter");
    if ((VCTextStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        char IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
        __int16 v13 = *MEMORY[0x1E4F47A50];
        if (IsOSFaultDisabled)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCTextStream onConfigureStreamWithConfiguration:error:](v11, a4, v13);
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          -[VCTextStream onConfigureStreamWithConfiguration:error:](v11, a4, v13);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v10 = (__CFString *)[(VCTextStream *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        char v15 = VRTraceIsOSFaultDisabled();
        long long v16 = *MEMORY[0x1E4F47A50];
        if (v15)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            if (*a4) {
              uint64_t v17 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
            }
            else {
              uint64_t v17 = "<nil>";
            }
            *(_DWORD *)buf = 136316418;
            uint64_t v23 = v14;
            __int16 v24 = 2080;
            v25 = "-[VCTextStream onConfigureStreamWithConfiguration:error:]";
            __int16 v26 = 1024;
            int v27 = 147;
            __int16 v28 = 2112;
            v29 = v10;
            __int16 v30 = 2048;
            v31 = self;
            __int16 v32 = 2080;
            v33 = v17;
            _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, "VCTextStream [%s] %s:%d %@(%p) error[%s]", buf, 0x3Au);
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          if (*a4) {
            uint64_t v19 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
          }
          else {
            uint64_t v19 = "<nil>";
          }
          *(_DWORD *)buf = 136316418;
          uint64_t v23 = v14;
          __int16 v24 = 2080;
          v25 = "-[VCTextStream onConfigureStreamWithConfiguration:error:]";
          __int16 v26 = 1024;
          int v27 = 147;
          __int16 v28 = 2112;
          v29 = v10;
          __int16 v30 = 2048;
          v31 = self;
          __int16 v32 = 2080;
          v33 = v19;
          _os_log_fault_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_FAULT, "VCTextStream [%s] %s:%d %@(%p) error[%s]", buf, 0x3Au);
        }
      }
    }
    return 0;
  }
  uint64_t v7 = [a3 objectAtIndexedSubscript:0];
  if ([(NSMutableArray *)self->super._transportArray count])
  {
    int v8 = [(VCMediaStream *)self defaultTransport];
    if (v8) {
      goto LABEL_5;
    }
LABEL_25:
    if ((VCTextStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCTextStream onConfigureStreamWithConfiguration:error:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v18 = (__CFString *)[(VCTextStream *)self performSelector:sel_logPrefix];
      }
      else {
        long long v18 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v23 = v20;
          __int16 v24 = 2080;
          v25 = "-[VCTextStream onConfigureStreamWithConfiguration:error:]";
          __int16 v26 = 1024;
          int v27 = 154;
          __int16 v28 = 2112;
          v29 = v18;
          __int16 v30 = 2048;
          v31 = self;
          _os_log_error_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_ERROR, "VCTextStream [%s] %s:%d %@(%p) Failed to create transport", buf, 0x30u);
        }
      }
    }
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32016, 105, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTextStream.m", 158), @"Failed to create transport", @"Create transport failed");
    return 0;
  }
  int v8 = [(VCMediaStream *)self createTransportWithStreamConfig:v7 ssrc:self->super._localSSRC];
  if (!v8) {
    goto LABEL_25;
  }
LABEL_5:
  self->super._transportSetupInfo.sourceRate = 1000;
  if (self->super._transportSetupInfo.setupType == 5) {
    self->super._transportSetupInfo.var0.ipInfo.srcIPPORT.szIfName[12] = 1;
  }
  if (!-[VCMediaStreamTransport configureWithStreamConfig:setupInfo:reducedSizeRTCPPackets:hopByHopEncryptRTCPPackets:statisticsCollector:basebandCongestionDetector:error:](v8, "configureWithStreamConfig:setupInfo:reducedSizeRTCPPackets:hopByHopEncryptRTCPPackets:statisticsCollector:basebandCongestionDetector:error:", v7, a4))return 0; {
  [(VCTextStream *)self setupTextTransmitter];
  }

  return [(VCTextStream *)self setupTextReceiverWithError:a4];
}

- (void)onStartWithCompletionHandler:(id)a3
{
  [(VCTextTransmitter *)self->_textTransmitter start];
  [(VCTextReceiver *)self->_textReceiver start];
  uint64_t v5 = (void (*)(id, uint64_t, void))*((void *)a3 + 2);

  v5(a3, 1, 0);
}

- (void)onStopWithCompletionHandler:(id)a3
{
  [(VCTextTransmitter *)self->_textTransmitter stop];
  [(VCTextReceiver *)self->_textReceiver stop];
  uint64_t v5 = (void (*)(id, uint64_t, void))*((void *)a3 + 2);

  v5(a3, 1, 0);
}

- (void)onPauseWithCompletionHandler:(id)a3
{
}

- (void)onResumeWithCompletionHandler:(id)a3
{
}

- (void)onSendRTCPPacket
{
  -[VCMediaStreamTransport sendControlPacketWithParameters:](-[VCMediaStream defaultTransport](self, "defaultTransport", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0,
      0,
      0,
      0,
      0,
      *MEMORY[0x1E4F143B8]),
    "sendControlPacketWithParameters:",
    &v2);
}

- (double)lastReceivedRTPPacketTime
{
  [(VCTextReceiver *)self->_textReceiver lastReceivedRTPPacketTime];
  return result;
}

- (double)lastReceivedRTCPPacketTime
{
  [(VCTextReceiver *)self->_textReceiver lastReceivedRTCPPacketTime];
  return result;
}

- (double)rtcpHeartbeatLeeway
{
  return 0.1;
}

- (void)sendCharacter:(os_log_t)log .cold.1(uint64_t a1, unsigned __int16 a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = 136315906;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  uint64_t v6 = "-[VCTextStream sendCharacter:]";
  __int16 v7 = 1024;
  int v8 = 71;
  __int16 v9 = 1024;
  int v10 = a2;
  _os_log_debug_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_DEBUG, "VCTextStream [%s] %s:%d Sending text:'%C'", (uint8_t *)&v3, 0x22u);
}

- (void)sendText:.cold.1()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  __int16 v5 = "-[VCTextStream sendText:]";
  __int16 v6 = 1024;
  int v7 = 76;
  __int16 v8 = 2112;
  uint64_t v9 = v1;
  _os_log_debug_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_DEBUG, "VCTextStream [%s] %s:%d Sending text:%@", v3, 0x26u);
}

- (void)didReceiveCharacter:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 83;
  _os_log_error_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_ERROR, "VCTextStream [%s] %s:%d Error: -didReceiveText: should be called instead of this method.", v1, 0x1Cu);
}

- (void)onConfigureStreamWithConfiguration:(NSObject *)a3 error:.cold.1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (*a2) {
    objc_msgSend((id)objc_msgSend(*a2, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, "VCTextStream [%s] %s:%d error[%s]", v4, 0x26u);
}

- (void)onConfigureStreamWithConfiguration:(NSObject *)a3 error:.cold.2(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (*a2) {
    objc_msgSend((id)objc_msgSend(*a2, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_0();
  _os_log_fault_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_FAULT, "VCTextStream [%s] %s:%d error[%s]", v4, 0x26u);
}

- (void)onConfigureStreamWithConfiguration:error:.cold.3()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 154;
  _os_log_error_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_ERROR, "VCTextStream [%s] %s:%d Failed to create transport", v1, 0x1Cu);
}

@end