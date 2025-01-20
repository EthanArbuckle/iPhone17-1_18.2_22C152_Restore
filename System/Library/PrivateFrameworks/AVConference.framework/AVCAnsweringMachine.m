@interface AVCAnsweringMachine
+ (void)cleanUpMessageRecordingURL:(id)a3 messageRecordingURLSandboxExtensionHandle:(int64_t)a4;
- (AVCAnsweringMachine)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5;
- (AVCAnsweringMachineDelegate)delegate;
- (BOOL)setUpDelegateQueue:(id)a3;
- (BOOL)setUpServerConnection;
- (OS_dispatch_queue)delegateQueue;
- (id)description;
- (id)logPrefix;
- (int64_t)messageAudioToken;
- (void)dealloc;
- (void)deregisterServerCallbacks;
- (void)printDidStop:(BOOL)a3 messageRecordingURL:(id)a4 error:(id)a5;
- (void)printInitConfiguration;
- (void)registerDidFinishAnnouncementBlockWithInstance:(id)a3;
- (void)registerDidStartBlockWithInstance:(id)a3;
- (void)registerDidStopBlockWithInstance:(id)a3;
- (void)registerServerCallbacks;
- (void)registerServerDidDisconnectBlockWithInstance:(id)a3;
- (void)setUpServerConnection;
- (void)start;
- (void)stop;
@end

@implementation AVCAnsweringMachine

- (AVCAnsweringMachineDelegate)delegate
{
  return (AVCAnsweringMachineDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (id)logPrefix
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)AVCAnsweringMachine;
  return (id)[NSString stringWithFormat:@"%@ %@ messageAudioToken=%ld, configuration=%@", -[AVCAnsweringMachine description](&v3, sel_description), -[AVCAnsweringMachine logPrefix](self, "logPrefix"), self->_messageAudioToken, self->_configuration];
}

- (void)registerDidStartBlockWithInstance:(id)a3
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__AVCAnsweringMachine_registerDidStartBlockWithInstance___block_invoke;
  v3[3] = &unk_1E6DB4338;
  v3[4] = a3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcAnsweringMachineDidStart" block:v3 queue:self->_stateQueue];
}

void __57__AVCAnsweringMachine_registerDidStartBlockWithInstance___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v6 = [*(id *)(a1 + 32) strong];
    if (v6)
    {
      v7 = (void *)v6;
      if (objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_14;
        }
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        *(_DWORD *)buf = 136315650;
        uint64_t v21 = v9;
        __int16 v22 = 2080;
        v23 = "-[AVCAnsweringMachine registerDidStartBlockWithInstance:]_block_invoke";
        __int16 v24 = 1024;
        int v25 = 91;
        v11 = " [%s] %s:%d received callback for didStart";
        v12 = v10;
        uint32_t v13 = 28;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          v8 = (__CFString *)[v7 performSelector:sel_logPrefix];
        }
        else {
          v8 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_14;
        }
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v21 = v14;
        __int16 v22 = 2080;
        v23 = "-[AVCAnsweringMachine registerDidStartBlockWithInstance:]_block_invoke";
        __int16 v24 = 1024;
        int v25 = 91;
        __int16 v26 = 2112;
        v27 = v8;
        __int16 v28 = 2048;
        v29 = v7;
        v11 = " [%s] %s:%d %@(%p) received callback for didStart";
        v12 = v15;
        uint32_t v13 = 48;
      }
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_14:
      uint64_t v16 = [a2 objectForKeyedSubscript:@"vcAnsweringMachineStatus"];
      uint64_t v17 = [v7 delegate];
      v18 = [v7 delegateQueue];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __57__AVCAnsweringMachine_registerDidStartBlockWithInstance___block_invoke_13;
      v19[3] = &unk_1E6DB6740;
      v19[4] = v16;
      v19[5] = v7;
      v19[6] = a3;
      v19[7] = v17;
      dispatch_async(v18, v19);
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __57__AVCAnsweringMachine_registerDidStartBlockWithInstance___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __57__AVCAnsweringMachine_registerDidStartBlockWithInstance___block_invoke_13(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) BOOLValue];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCAnsweringMachine-didStart");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      int v8 = 136316418;
      uint64_t v9 = v3;
      __int16 v10 = 2080;
      v11 = "-[AVCAnsweringMachine registerDidStartBlockWithInstance:]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 98;
      __int16 v14 = 2048;
      uint64_t v15 = v5;
      __int16 v16 = 1024;
      int v17 = v2;
      __int16 v18 = 2112;
      uint64_t v19 = v6;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCAnsweringMachine-didStart (%p) didStart=%{BOOL}d, error=%@", (uint8_t *)&v8, 0x36u);
    }
  }
  return [*(id *)(a1 + 56) answeringMachine:*(void *)(a1 + 40) didStart:v2 error:*(void *)(a1 + 48)];
}

- (void)printDidStop:(BOOL)a3 messageRecordingURL:(id)a4 error:(id)a5
{
  BOOL v6 = a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v19 = -1;
    uint64_t v20 = -1;
    +[VCFileUtil statsOfFile:a4];
    uint64_t v17 = 0;
    int v9 = VCUtil_BinaryPrefix(v18, (double *)&v17);
    MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCAnsweringMachine-didStop");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136317698;
        uint64_t v22 = v10;
        __int16 v23 = 2080;
        __int16 v24 = "-[AVCAnsweringMachine printDidStop:messageRecordingURL:error:]";
        __int16 v25 = 1024;
        int v26 = 123;
        __int16 v27 = 2048;
        __int16 v28 = self;
        __int16 v29 = 1024;
        BOOL v30 = v6;
        __int16 v31 = 2112;
        id v32 = a4;
        __int16 v33 = 2112;
        id v34 = a5;
        __int16 v35 = 2048;
        uint64_t v36 = v17;
        __int16 v37 = 1024;
        int v38 = v9;
        __int16 v39 = 2048;
        uint64_t v40 = v19;
        __int16 v41 = 2048;
        uint64_t v42 = v20;
        __int16 v12 = " [%s] %s:%d @:@ AVCAnsweringMachine-didStop (%p) didStop=%{BOOL}d messageRecordingURL=%@ error=%@ recordin"
              "gSize=%.2f%cB recordingLength=%.2fs, recordingAudioLength=%.2fs";
        int v13 = v11;
        uint32_t v14 = 100;
LABEL_8:
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }
  }
  else
  {
    MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCAnsweringMachine-didStop");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      __int16 v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        uint64_t v22 = v15;
        __int16 v23 = 2080;
        __int16 v24 = "-[AVCAnsweringMachine printDidStop:messageRecordingURL:error:]";
        __int16 v25 = 1024;
        int v26 = 117;
        __int16 v27 = 2048;
        __int16 v28 = self;
        __int16 v29 = 1024;
        BOOL v30 = v6;
        __int16 v31 = 2112;
        id v32 = 0;
        __int16 v33 = 2112;
        id v34 = a5;
        __int16 v12 = " [%s] %s:%d @:@ AVCAnsweringMachine-didStop (%p) didStop=%{BOOL}d messageRecordingURL=%@ error=%@";
        int v13 = v16;
        uint32_t v14 = 64;
        goto LABEL_8;
      }
    }
  }
}

+ (void)cleanUpMessageRecordingURL:(id)a3 messageRecordingURLSandboxExtensionHandle:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  if (a3
    && (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtURL:error:", a3, &v9)? (BOOL v6 = v9 == 0): (BOOL v6 = 0), !v6&& (int)VRTraceGetErrorLogLevelForModule() >= 3&& (v7 = VRTraceErrorLogLevelToCSTR(), v8 = *MEMORY[0x1E4F47A50], os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))))
  {
    *(_DWORD *)buf = 136316162;
    uint64_t v11 = v7;
    __int16 v12 = 2080;
    int v13 = "+[AVCAnsweringMachine cleanUpMessageRecordingURL:messageRecordingURLSandboxExtensionHandle:]";
    __int16 v14 = 1024;
    int v15 = 135;
    __int16 v16 = 2112;
    id v17 = a3;
    __int16 v18 = 2112;
    uint64_t v19 = v9;
    _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to remove messageRecordingURL=%@: error=%@", buf, 0x30u);
    if (!a4) {
      return;
    }
  }
  else if (!a4)
  {
    return;
  }
  sandbox_extension_release();
}

- (void)registerDidStopBlockWithInstance:(id)a3
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__AVCAnsweringMachine_registerDidStopBlockWithInstance___block_invoke;
  v3[3] = &unk_1E6DB4338;
  v3[4] = a3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcAnsweringMachineDidStop" block:v3 queue:self->_stateQueue];
}

void __56__AVCAnsweringMachine_registerDidStopBlockWithInstance___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v6 = [*(id *)(a1 + 32) strong];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      if (objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_14;
        }
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        *(_DWORD *)buf = 136315650;
        uint64_t v21 = v9;
        __int16 v22 = 2080;
        __int16 v23 = "-[AVCAnsweringMachine registerDidStopBlockWithInstance:]_block_invoke";
        __int16 v24 = 1024;
        int v25 = 153;
        uint64_t v11 = " [%s] %s:%d Received callback for didStop";
        __int16 v12 = v10;
        uint32_t v13 = 28;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          int v8 = (__CFString *)[v7 performSelector:sel_logPrefix];
        }
        else {
          int v8 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_14;
        }
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        int v15 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v21 = v14;
        __int16 v22 = 2080;
        __int16 v23 = "-[AVCAnsweringMachine registerDidStopBlockWithInstance:]_block_invoke";
        __int16 v24 = 1024;
        int v25 = 153;
        __int16 v26 = 2112;
        __int16 v27 = v8;
        __int16 v28 = 2048;
        __int16 v29 = v7;
        uint64_t v11 = " [%s] %s:%d %@(%p) Received callback for didStop";
        __int16 v12 = v15;
        uint32_t v13 = 48;
      }
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_14:
      uint64_t v16 = [a2 objectForKeyedSubscript:@"vcAnsweringMachineStatus"];
      uint64_t v17 = [v7 delegate];
      __int16 v18 = [v7 delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__AVCAnsweringMachine_registerDidStopBlockWithInstance___block_invoke_19;
      block[3] = &unk_1E6DB6768;
      block[4] = v16;
      block[5] = a2;
      block[6] = v7;
      block[7] = a3;
      block[8] = v17;
      dispatch_async(v18, block);
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __56__AVCAnsweringMachine_registerDidStopBlockWithInstance___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __56__AVCAnsweringMachine_registerDidStopBlockWithInstance___block_invoke_19(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) BOOLValue];
  uint64_t v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"vcAnsweringMachineMessageRecordingURL"];
  uint64_t v4 = (void *)[*(id *)(a1 + 40) objectForKeyedSubscript:@"vcAnsweringMachineMessageRecordingURLSandboxExtensionToken"];
  if (!v4)
  {
    unsigned int v6 = (v3 == 0) ^ [*(id *)(*(void *)(a1 + 48) + 8) isMessageRecordingEnabled];
    if (v6) {
      int v7 = 7;
    }
    else {
      int v7 = 3;
    }
    if (objc_opt_class() == *(void *)(a1 + 48))
    {
      if (v7 <= (int)VRTraceGetErrorLogLevelForModule())
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *MEMORY[0x1E4F47A50];
        uint64_t v11 = *MEMORY[0x1E4F47A50];
        if ((v6 & 1) == 0)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            __56__AVCAnsweringMachine_registerDidStopBlockWithInstance___block_invoke_19_cold_1();
          }
          goto LABEL_23;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v21 = 136315650;
          *(void *)&v21[4] = v9;
          *(_WORD *)&v21[12] = 2080;
          *(void *)&v21[14] = "-[AVCAnsweringMachine registerDidStopBlockWithInstance:]_block_invoke";
          *(_WORD *)&v21[22] = 1024;
          LODWORD(v22) = 169;
          __int16 v12 = " [%s] %s:%d No message recording URL sandbox extension token to consume";
          uint32_t v13 = v10;
          uint32_t v14 = 28;
LABEL_18:
          _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, v21, v14);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v8 = (__CFString *)[*(id *)(a1 + 48) performSelector:sel_logPrefix];
      }
      else {
        int v8 = &stru_1F3D3E450;
      }
      if (v7 > (int)VRTraceGetErrorLogLevelForModule()) {
        goto LABEL_23;
      }
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint64_t v16 = *MEMORY[0x1E4F47A50];
      uint64_t v17 = *MEMORY[0x1E4F47A50];
      if ((v6 & 1) == 0)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = *(void *)(a1 + 48);
          *(_DWORD *)uint64_t v21 = 136316162;
          *(void *)&v21[4] = v15;
          *(_WORD *)&v21[12] = 2080;
          *(void *)&v21[14] = "-[AVCAnsweringMachine registerDidStopBlockWithInstance:]_block_invoke";
          *(_WORD *)&v21[22] = 1024;
          LODWORD(v22) = 169;
          WORD2(v22) = 2112;
          *(void *)((char *)&v22 + 6) = v8;
          HIWORD(v22) = 2048;
          uint64_t v23 = v19;
          _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) No message recording URL sandbox extension token to consume", v21, 0x30u);
        }
        goto LABEL_23;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 48);
        *(_DWORD *)uint64_t v21 = 136316162;
        *(void *)&v21[4] = v15;
        *(_WORD *)&v21[12] = 2080;
        *(void *)&v21[14] = "-[AVCAnsweringMachine registerDidStopBlockWithInstance:]_block_invoke";
        *(_WORD *)&v21[22] = 1024;
        LODWORD(v22) = 169;
        WORD2(v22) = 2112;
        *(void *)((char *)&v22 + 6) = v8;
        HIWORD(v22) = 2048;
        uint64_t v23 = v18;
        __int16 v12 = " [%s] %s:%d %@(%p) No message recording URL sandbox extension token to consume";
        uint32_t v13 = v16;
        uint32_t v14 = 48;
        goto LABEL_18;
      }
    }
LABEL_23:
    uint64_t v5 = 0;
    goto LABEL_24;
  }
  [v4 UTF8String];
  uint64_t v5 = sandbox_extension_consume();
LABEL_24:
  objc_msgSend(*(id *)(a1 + 48), "printDidStop:messageRecordingURL:error:", v2, v3, *(void *)(a1 + 56), *(_OWORD *)v21, *(void *)&v21[16], v22, v23);
  [*(id *)(a1 + 64) answeringMachine:*(void *)(a1 + 48) didStop:v2 messageRecordingURL:v3 error:*(void *)(a1 + 56)];
  return +[AVCAnsweringMachine cleanUpMessageRecordingURL:v3 messageRecordingURLSandboxExtensionHandle:v5];
}

- (void)registerServerDidDisconnectBlockWithInstance:(id)a3
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__AVCAnsweringMachine_registerServerDidDisconnectBlockWithInstance___block_invoke;
  v3[3] = &unk_1E6DB4338;
  v3[4] = a3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcAnsweringMachineServerDidDisconnect" block:v3 queue:self->_stateQueue];
}

void __68__AVCAnsweringMachine_registerServerDidDisconnectBlockWithInstance___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v3 = [*(id *)(a1 + 32) strong];
    if (v3)
    {
      uint64_t v4 = (void *)v3;
      if (objc_opt_class() == v3)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_14;
        }
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        int v7 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        *(_DWORD *)buf = 136315650;
        uint64_t v17 = v6;
        __int16 v18 = 2080;
        uint64_t v19 = "-[AVCAnsweringMachine registerServerDidDisconnectBlockWithInstance:]_block_invoke";
        __int16 v20 = 1024;
        int v21 = 193;
        int v8 = " [%s] %s:%d Received callback for serverDidDisconnect";
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
          goto LABEL_14;
        }
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        __int16 v12 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v17 = v11;
        __int16 v18 = 2080;
        uint64_t v19 = "-[AVCAnsweringMachine registerServerDidDisconnectBlockWithInstance:]_block_invoke";
        __int16 v20 = 1024;
        int v21 = 193;
        __int16 v22 = 2112;
        uint64_t v23 = v5;
        __int16 v24 = 2048;
        int v25 = v4;
        int v8 = " [%s] %s:%d %@(%p) Received callback for serverDidDisconnect";
        uint64_t v9 = v12;
        uint32_t v10 = 48;
      }
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_14:
      uint64_t v13 = [v4 delegate];
      uint32_t v14 = [v4 delegateQueue];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __68__AVCAnsweringMachine_registerServerDidDisconnectBlockWithInstance___block_invoke_28;
      v15[3] = &unk_1E6DB3E40;
      v15[4] = v4;
      v15[5] = v13;
      dispatch_async(v14, v15);
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __68__AVCAnsweringMachine_registerServerDidDisconnectBlockWithInstance___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __68__AVCAnsweringMachine_registerServerDidDisconnectBlockWithInstance___block_invoke_28(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCAnsweringMachine-serverDidDisconnect");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v6 = 136315906;
      uint64_t v7 = v2;
      __int16 v8 = 2080;
      uint64_t v9 = "-[AVCAnsweringMachine registerServerDidDisconnectBlockWithInstance:]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 197;
      __int16 v12 = 2048;
      uint64_t v13 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCAnsweringMachine-serverDidDisconnect (%p)", (uint8_t *)&v6, 0x26u);
    }
  }
  return [*(id *)(a1 + 40) serverDidDisconnectForAnsweringMachine:*(void *)(a1 + 32)];
}

- (void)registerDidFinishAnnouncementBlockWithInstance:(id)a3
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__AVCAnsweringMachine_registerDidFinishAnnouncementBlockWithInstance___block_invoke;
  v3[3] = &unk_1E6DB4338;
  v3[4] = a3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcAnsweringMachineDidFinishAnnouncement" block:v3 queue:self->_stateQueue];
}

void __70__AVCAnsweringMachine_registerDidFinishAnnouncementBlockWithInstance___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v6 = [*(id *)(a1 + 32) strong];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      if (objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_14;
        }
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        __int16 v10 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        *(_DWORD *)buf = 136315650;
        uint64_t v21 = v9;
        __int16 v22 = 2080;
        uint64_t v23 = "-[AVCAnsweringMachine registerDidFinishAnnouncementBlockWithInstance:]_block_invoke";
        __int16 v24 = 1024;
        int v25 = 218;
        int v11 = " [%s] %s:%d received callback for didFinishAnnouncement";
        __int16 v12 = v10;
        uint32_t v13 = 28;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          __int16 v8 = (__CFString *)[v7 performSelector:sel_logPrefix];
        }
        else {
          __int16 v8 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_14;
        }
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        uint64_t v15 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v21 = v14;
        __int16 v22 = 2080;
        uint64_t v23 = "-[AVCAnsweringMachine registerDidFinishAnnouncementBlockWithInstance:]_block_invoke";
        __int16 v24 = 1024;
        int v25 = 218;
        __int16 v26 = 2112;
        __int16 v27 = v8;
        __int16 v28 = 2048;
        __int16 v29 = v7;
        int v11 = " [%s] %s:%d %@(%p) received callback for didFinishAnnouncement";
        __int16 v12 = v15;
        uint32_t v13 = 48;
      }
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_14:
      uint64_t v16 = [a2 objectForKeyedSubscript:@"vcAnsweringMachineStatus"];
      uint64_t v17 = [v7 delegate];
      __int16 v18 = [v7 delegateQueue];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __70__AVCAnsweringMachine_registerDidFinishAnnouncementBlockWithInstance___block_invoke_30;
      v19[3] = &unk_1E6DB6740;
      v19[4] = v16;
      v19[5] = v7;
      v19[6] = a3;
      v19[7] = v17;
      dispatch_async(v18, v19);
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __70__AVCAnsweringMachine_registerDidFinishAnnouncementBlockWithInstance___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __70__AVCAnsweringMachine_registerDidFinishAnnouncementBlockWithInstance___block_invoke_30(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) BOOLValue];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCAnsweringMachine-didFinishAnnouncement");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      int v8 = 136316418;
      uint64_t v9 = v3;
      __int16 v10 = 2080;
      int v11 = "-[AVCAnsweringMachine registerDidFinishAnnouncementBlockWithInstance:]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 224;
      __int16 v14 = 2048;
      uint64_t v15 = v5;
      __int16 v16 = 1024;
      int v17 = v2;
      __int16 v18 = 2112;
      uint64_t v19 = v6;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCAnsweringMachine-didFinishAnnouncement (%p) didFinishAnnouncement=%{BOOL}d, error=%@", (uint8_t *)&v8, 0x36u);
    }
  }
  return [*(id *)(a1 + 56) answeringMachine:*(void *)(a1 + 40) didFinishAnnouncement:v2 error:*(void *)(a1 + 48)];
}

- (void)registerServerCallbacks
{
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  [(AVCAnsweringMachine *)self registerDidStartBlockWithInstance:v3];
  [(AVCAnsweringMachine *)self registerDidStopBlockWithInstance:v3];
  [(AVCAnsweringMachine *)self registerServerDidDisconnectBlockWithInstance:v3];

  [(AVCAnsweringMachine *)self registerDidFinishAnnouncementBlockWithInstance:v3];
}

- (void)deregisterServerCallbacks
{
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcAnsweringMachineDidStart"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcAnsweringMachineDidStop"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcAnsweringMachineServerDidDisconnect"];
  connection = self->_connection;

  [(AVConferenceXPCClient *)connection deregisterFromService:"vcAnsweringMachineDidFinishAnnouncement"];
}

- (BOOL)setUpDelegateQueue:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v4 = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)a3);
LABEL_4:
    self->_delegateQueue = v4;
    LOBYTE(v6) = 1;
    return v6;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  uint64_t v4 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.AVCAnsweringMachine.delegateQueue", 0, CustomRootQueue);
  if (v4) {
    goto LABEL_4;
  }
  if ((AVCAnsweringMachine *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v6) {
        return v6;
      }
      -[AVCAnsweringMachine setUpDelegateQueue:]();
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[(AVCAnsweringMachine *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v6) {
        return v6;
      }
      int v11 = 136316162;
      uint64_t v12 = v8;
      __int16 v13 = 2080;
      __int16 v14 = "-[AVCAnsweringMachine setUpDelegateQueue:]";
      __int16 v15 = 1024;
      int v16 = 269;
      __int16 v17 = 2112;
      __int16 v18 = v7;
      __int16 v19 = 2048;
      uint64_t v20 = self;
      _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate delegateQueue", (uint8_t *)&v11, 0x30u);
    }
  }
  LOBYTE(v6) = 0;
  return v6;
}

- (BOOL)setUpServerConnection
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  p_configuration = (uint64_t *)&self->_configuration;
  id v5 = [(AVCAnsweringMachineConfiguration *)self->_configuration dictionary];
  if (!v5)
  {
    if ((AVCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v31 = VRTraceErrorLogLevelToCSTR();
        id v32 = *MEMORY[0x1E4F47A50];
        BOOL v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v21) {
          return v21;
        }
        [(AVCAnsweringMachine *)v31 setUpServerConnection];
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v30 = (__CFString *)[(AVCAnsweringMachine *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v30 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v33 = VRTraceErrorLogLevelToCSTR();
        id v34 = *MEMORY[0x1E4F47A50];
        BOOL v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v21) {
          return v21;
        }
        configuration = self->_configuration;
        *(_DWORD *)buf = 136316418;
        uint64_t v40 = v33;
        __int16 v41 = 2080;
        uint64_t v42 = "-[AVCAnsweringMachine setUpServerConnection]";
        __int16 v43 = 1024;
        int v44 = 285;
        __int16 v45 = 2112;
        v46 = (const char *)v30;
        __int16 v47 = 2048;
        v48 = self;
        __int16 v49 = 2112;
        v50 = configuration;
        _os_log_error_impl(&dword_1E1EA4000, v34, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to serialize configuration=%@", buf, 0x3Au);
      }
    }
    goto LABEL_52;
  }
  [v3 setObject:v5 forKeyedSubscript:@"vcAnsweringMachineConfig"];
  if ((AVCAnsweringMachine *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      __str = 0;
      uint64_t v7 = v3 ? (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "serializedConfiguration=%s", v7);
      if (__str)
      {
        __lasts = 0;
        __int16 v14 = strtok_r(__str, "\n", &__lasts);
        __int16 v15 = (os_log_t *)MEMORY[0x1E4F47A50];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v16 = VRTraceErrorLogLevelToCSTR();
            __int16 v17 = *v15;
            if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v40 = v16;
              __int16 v41 = 2080;
              uint64_t v42 = "-[AVCAnsweringMachine setUpServerConnection]";
              __int16 v43 = 1024;
              int v44 = 287;
              __int16 v45 = 2080;
              v46 = "";
              __int16 v47 = 2080;
              v48 = (AVCAnsweringMachine *)v14;
              _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          __int16 v14 = strtok_r(0, "\n", &__lasts);
        }
        while (v14);
        goto LABEL_27;
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v6 = (__CFString *)[(AVCAnsweringMachine *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      __str = 0;
      uint64_t v8 = (const char *)[(__CFString *)v6 UTF8String];
      uint64_t v9 = v3 ? (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "%s(%p) serializedConfiguration=%s", v8, self, v9);
      if (__str)
      {
        __lasts = 0;
        __int16 v10 = strtok_r(__str, "\n", &__lasts);
        int v11 = (os_log_t *)MEMORY[0x1E4F47A50];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v12 = VRTraceErrorLogLevelToCSTR();
            __int16 v13 = *v11;
            if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v40 = v12;
              __int16 v41 = 2080;
              uint64_t v42 = "-[AVCAnsweringMachine setUpServerConnection]";
              __int16 v43 = 1024;
              int v44 = 287;
              __int16 v45 = 2080;
              v46 = "";
              __int16 v47 = 2080;
              v48 = (AVCAnsweringMachine *)v10;
              _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          __int16 v10 = strtok_r(0, "\n", &__lasts);
        }
        while (v10);
LABEL_27:
        free(__str);
      }
    }
  }
  id v18 = [(AVConferenceXPCClient *)self->_connection sendMessageSync:"vcAnsweringMachineInitialize" arguments:v3];
  __int16 v19 = v18;
  if (v18
    && ([v18 objectForKeyedSubscript:@"ERROR"]
     || [v19 objectForKeyedSubscript:@"TIMEOUT"]))
  {
    if ((AVCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_52;
      }
      __str = 0;
      asprintf(&__str, "Error initializing, results=%s", (const char *)objc_msgSend((id)objc_msgSend(v19, "description"), "UTF8String"));
      if (!__str) {
        goto LABEL_52;
      }
      __lasts = 0;
      __int16 v22 = strtok_r(__str, "\n", &__lasts);
      uint64_t v23 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v24 = VRTraceErrorLogLevelToCSTR();
          int v25 = *v23;
          if (os_log_type_enabled(*v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v40 = v24;
            __int16 v41 = 2080;
            uint64_t v42 = "-[AVCAnsweringMachine setUpServerConnection]";
            __int16 v43 = 1024;
            int v44 = 291;
            __int16 v45 = 2080;
            v46 = "";
            __int16 v47 = 2080;
            v48 = (AVCAnsweringMachine *)v22;
            _os_log_error_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_ERROR, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        __int16 v22 = strtok_r(0, "\n", &__lasts);
      }
      while (v22);
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v20 = (__CFString *)[(AVCAnsweringMachine *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v20 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_52;
      }
      __str = 0;
      asprintf(&__str, "%s(%p) Error initializing, results=%s", (const char *)-[__CFString UTF8String](v20, "UTF8String"), self, (const char *)objc_msgSend((id)objc_msgSend(v19, "description"), "UTF8String"));
      if (!__str) {
        goto LABEL_52;
      }
      __lasts = 0;
      __int16 v26 = strtok_r(__str, "\n", &__lasts);
      __int16 v27 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v28 = VRTraceErrorLogLevelToCSTR();
          __int16 v29 = *v27;
          if (os_log_type_enabled(*v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v40 = v28;
            __int16 v41 = 2080;
            uint64_t v42 = "-[AVCAnsweringMachine setUpServerConnection]";
            __int16 v43 = 1024;
            int v44 = 291;
            __int16 v45 = 2080;
            v46 = "";
            __int16 v47 = 2080;
            v48 = (AVCAnsweringMachine *)v26;
            _os_log_error_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_ERROR, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        __int16 v26 = strtok_r(0, "\n", &__lasts);
      }
      while (v26);
    }
    free(__str);
LABEL_52:
    LOBYTE(v21) = 0;
    return v21;
  }
  self->_messageAudioToken = objc_msgSend((id)objc_msgSend(v19, "objectForKeyedSubscript:", @"vcAnsweringMachineMessageAudioToken"), "integerValue");
  LOBYTE(v21) = 1;
  return v21;
}

- (void)printInitConfiguration
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AVCAnsweringMachineConfiguration *)self->_configuration announcementAsset];
  if (v3)
  {
    uint64_t v20 = (char *)0xAAAAAAAAAAAAAAAALL;
    double v21 = NAN;
    double v22 = NAN;
    +[VCFileUtil statsOfFile:v3];
    uint64_t v23 = 0;
    int v4 = VCUtil_BinaryPrefix(0xAAAAAAAAAAAAAAAALL, (double *)&v23);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      __str = 0;
      configuration = self->_configuration;
      BOOL v6 = configuration
         ? (const char *)objc_msgSend(-[AVCAnsweringMachineConfiguration description](configuration, "description"), "UTF8String"): "<nil>";
      asprintf(&__str, "configuration=%s assetSize=%.2f%cB assetLength=%.2fs, assetAudioLength=%.2fs", v6, *(double *)&v23, v4, v21, v22);
      if (__str)
      {
        __lasts = 0;
        uint64_t v9 = strtok_r(__str, "\n", &__lasts);
        __int16 v10 = (os_log_t *)MEMORY[0x1E4F47A50];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            uint64_t v11 = VRTraceErrorLogLevelToCSTR();
            uint64_t v12 = *v10;
            if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v25 = v11;
              __int16 v26 = 2080;
              __int16 v27 = "-[AVCAnsweringMachine printInitConfiguration]";
              __int16 v28 = 1024;
              int v29 = 311;
              __int16 v30 = 2080;
              uint64_t v31 = "AVCAnsweringMachine-init";
              __int16 v32 = 2080;
              uint64_t v33 = v9;
              _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          uint64_t v9 = strtok_r(0, "\n", &__lasts);
        }
        while (v9);
        __int16 v13 = __str;
LABEL_24:
        free(v13);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v20 = 0;
    uint64_t v7 = self->_configuration;
    uint64_t v8 = v7
       ? (const char *)objc_msgSend(-[AVCAnsweringMachineConfiguration description](v7, "description"), "UTF8String")
       : "<nil>";
    asprintf(&v20, "configuration=%s", v8);
    if (v20)
    {
      uint64_t v23 = 0;
      __int16 v14 = strtok_r(v20, "\n", &v23);
      __int16 v15 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v16 = VRTraceErrorLogLevelToCSTR();
          __int16 v17 = *v15;
          if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v25 = v16;
            __int16 v26 = 2080;
            __int16 v27 = "-[AVCAnsweringMachine printInitConfiguration]";
            __int16 v28 = 1024;
            int v29 = 305;
            __int16 v30 = 2080;
            uint64_t v31 = "AVCAnsweringMachine-init";
            __int16 v32 = 2080;
            uint64_t v33 = v14;
            _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        __int16 v14 = strtok_r(0, "\n", &v23);
      }
      while (v14);
      __int16 v13 = v20;
      goto LABEL_24;
    }
  }
}

- (AVCAnsweringMachine)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  id v5 = self;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if ((AVCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]();
        }
      }
      goto LABEL_60;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v16 = (__CFString *)[(AVCAnsweringMachine *)v5 performSelector:sel_logPrefix];
    }
    else {
      uint64_t v16 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_60;
    }
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    double v21 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_60;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v31 = v20;
    __int16 v32 = 2080;
    uint64_t v33 = "-[AVCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]";
    __int16 v34 = 1024;
    int v35 = 316;
    __int16 v36 = 2112;
    __int16 v37 = v16;
    __int16 v38 = 2048;
    __int16 v39 = v5;
    double v22 = " [%s] %s:%d %@(%p) nil configuration passed";
    goto LABEL_66;
  }
  if (!a4)
  {
    if ((AVCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]();
        }
      }
      goto LABEL_60;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v17 = (__CFString *)[(AVCAnsweringMachine *)v5 performSelector:sel_logPrefix];
    }
    else {
      __int16 v17 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_60;
    }
    uint64_t v23 = VRTraceErrorLogLevelToCSTR();
    double v21 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_60;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v31 = v23;
    __int16 v32 = 2080;
    uint64_t v33 = "-[AVCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]";
    __int16 v34 = 1024;
    int v35 = 317;
    __int16 v36 = 2112;
    __int16 v37 = v17;
    __int16 v38 = 2048;
    __int16 v39 = v5;
    double v22 = " [%s] %s:%d %@(%p) nil delegate passed";
    goto LABEL_66;
  }
  v29.receiver = self;
  v29.super_class = (Class)AVCAnsweringMachine;
  uint64_t v9 = [(AVCAnsweringMachine *)&v29 init];
  if (!v9)
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
          -[AVCAnsweringMachine initWithConfiguration:delegate:delegateQueue:].cold.4();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]();
      }
    }
    id v5 = 0;
    goto LABEL_60;
  }
  id v5 = v9;
  v9->_configuration = (AVCAnsweringMachineConfiguration *)[a3 copy];
  [(AVCAnsweringMachine *)v5 printInitConfiguration];
  __int16 v10 = objc_alloc_init(AVConferenceXPCClient);
  v5->_connection = v10;
  if (!v10)
  {
    if ((AVCAnsweringMachine *)objc_opt_class() == v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCAnsweringMachine initWithConfiguration:delegate:delegateQueue:].cold.5();
        }
      }
      goto LABEL_60;
    }
    if (objc_opt_respondsToSelector()) {
      id v18 = (__CFString *)[(AVCAnsweringMachine *)v5 performSelector:sel_logPrefix];
    }
    else {
      id v18 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_60;
    }
    uint64_t v24 = VRTraceErrorLogLevelToCSTR();
    double v21 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_60;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v31 = v24;
    __int16 v32 = 2080;
    uint64_t v33 = "-[AVCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]";
    __int16 v34 = 1024;
    int v35 = 323;
    __int16 v36 = 2112;
    __int16 v37 = v18;
    __int16 v38 = 2048;
    __int16 v39 = v5;
    double v22 = " [%s] %s:%d %@(%p) Failed to allocate xpc client";
LABEL_66:
    _os_log_error_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_ERROR, v22, buf, 0x30u);
    goto LABEL_60;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  dispatch_queue_t v12 = dispatch_queue_create_with_target_V2("com.apple.AVConference.AVCAnsweringMachine.stateQueue", 0, CustomRootQueue);
  v5->_stateQueue = (OS_dispatch_queue *)v12;
  if (v12)
  {
    objc_storeWeak((id *)&v5->_delegate, a4);
    if ([(AVCAnsweringMachine *)v5 setUpDelegateQueue:a5])
    {
      [(AVCAnsweringMachine *)v5 registerServerCallbacks];
      if ([(AVCAnsweringMachine *)v5 setUpServerConnection])
      {
        MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCAnsweringMachine-init");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v13 = VRTraceErrorLogLevelToCSTR();
          __int16 v14 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int64_t messageAudioToken = v5->_messageAudioToken;
            *(_DWORD *)buf = 136316162;
            uint64_t v31 = v13;
            __int16 v32 = 2080;
            uint64_t v33 = "-[AVCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]";
            __int16 v34 = 1024;
            int v35 = 340;
            __int16 v36 = 2048;
            __int16 v37 = v5;
            __int16 v38 = 2048;
            __int16 v39 = (AVCAnsweringMachine *)messageAudioToken;
            _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCAnsweringMachine-init (%p) messageAudioToken=%ld", buf, 0x30u);
          }
        }
        return v5;
      }
    }
    goto LABEL_60;
  }
  if ((AVCAnsweringMachine *)objc_opt_class() == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCAnsweringMachine initWithConfiguration:delegate:delegateQueue:].cold.6();
      }
    }
    goto LABEL_60;
  }
  if (objc_opt_respondsToSelector()) {
    __int16 v19 = (__CFString *)[(AVCAnsweringMachine *)v5 performSelector:sel_logPrefix];
  }
  else {
    __int16 v19 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v25 = VRTraceErrorLogLevelToCSTR();
    double v21 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v31 = v25;
      __int16 v32 = 2080;
      uint64_t v33 = "-[AVCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]";
      __int16 v34 = 1024;
      int v35 = 326;
      __int16 v36 = 2112;
      __int16 v37 = v19;
      __int16 v38 = 2048;
      __int16 v39 = v5;
      double v22 = " [%s] %s:%d %@(%p) Failed to allocate stateQueue";
      goto LABEL_66;
    }
  }
LABEL_60:
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCAnsweringMachine-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v26 = VRTraceErrorLogLevelToCSTR();
    __int16 v27 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v31 = v26;
      __int16 v32 = 2080;
      uint64_t v33 = "-[AVCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]";
      __int16 v34 = 1024;
      int v35 = 336;
      __int16 v36 = 2048;
      __int16 v37 = v5;
      _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCAnsweringMachine-init (%p)", buf, 0x26u);
    }
  }

  return 0;
}

- (void)dealloc
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((AVCAnsweringMachine *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      id v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v17 = v4;
        __int16 v18 = 2080;
        __int16 v19 = "-[AVCAnsweringMachine dealloc]";
        __int16 v20 = 1024;
        int v21 = 345;
        __int16 v22 = 2112;
        uint64_t v23 = self;
        BOOL v6 = " [%s] %s:%d self=%@";
        uint64_t v7 = v5;
        uint32_t v8 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (__CFString *)[(AVCAnsweringMachine *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      __int16 v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v17 = v9;
        __int16 v18 = 2080;
        __int16 v19 = "-[AVCAnsweringMachine dealloc]";
        __int16 v20 = 1024;
        int v21 = 345;
        __int16 v22 = 2112;
        uint64_t v23 = (AVCAnsweringMachine *)v3;
        __int16 v24 = 2048;
        uint64_t v25 = self;
        __int16 v26 = 2112;
        __int16 v27 = self;
        BOOL v6 = " [%s] %s:%d %@(%p) self=%@";
        uint64_t v7 = v10;
        uint32_t v8 = 58;
        goto LABEL_11;
      }
    }
  }
  [(AVCAnsweringMachine *)self deregisterServerCallbacks];
  [(AVConferenceXPCClient *)self->_connection sendMessageSync:"vcAnsweringMachineTerminate"];

  objc_storeWeak((id *)&self->_delegate, 0);
  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
  {
    dispatch_release(delegateQueue);
    self->_delegateQueue = 0;
  }
  stateQueue = self->_stateQueue;
  if (stateQueue)
  {
    dispatch_release(stateQueue);
    self->_stateQueue = 0;
  }

  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCAnsweringMachine-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    __int16 v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v17 = v13;
      __int16 v18 = 2080;
      __int16 v19 = "-[AVCAnsweringMachine dealloc]";
      __int16 v20 = 1024;
      int v21 = 356;
      __int16 v22 = 2048;
      uint64_t v23 = self;
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCAnsweringMachine-dealloc (%p)", buf, 0x26u);
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)AVCAnsweringMachine;
  [(AVCAnsweringMachine *)&v15 dealloc];
}

- (void)start
{
  v3[5] = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __28__AVCAnsweringMachine_start__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

void __28__AVCAnsweringMachine_start__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() != *(void *)(a1 + 32))
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_12;
    }
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    __int16 v10 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)objc_super v15 = 136316418;
    *(void *)&v15[4] = v9;
    *(_WORD *)&v15[12] = 2080;
    *(void *)&v15[14] = "-[AVCAnsweringMachine start]_block_invoke";
    *(_WORD *)&v15[22] = 1024;
    LODWORD(v16) = 364;
    WORD2(v16) = 2112;
    *(void *)((char *)&v16 + 6) = v2;
    HIWORD(v16) = 2048;
    uint64_t v17 = v11;
    LOWORD(v18) = 2112;
    *(void *)((char *)&v18 + 2) = v11;
    BOOL v6 = " [%s] %s:%d %@(%p) self=%@";
    uint64_t v7 = v10;
    uint32_t v8 = 58;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)objc_super v15 = 136315906;
      *(void *)&v15[4] = v3;
      *(_WORD *)&v15[12] = 2080;
      *(void *)&v15[14] = "-[AVCAnsweringMachine start]_block_invoke";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 364;
      WORD2(v16) = 2112;
      *(void *)((char *)&v16 + 6) = v5;
      BOOL v6 = " [%s] %s:%d self=%@";
      uint64_t v7 = v4;
      uint32_t v8 = 38;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, v15, v8);
    }
  }
LABEL_12:
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "sendMessageAsync:", "vcAnsweringMachineStart", *(_OWORD *)v15, *(void *)&v15[16], v16, v17, v18);
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCAnsweringMachine-start");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint64_t v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)objc_super v15 = 136315906;
      *(void *)&v15[4] = v12;
      *(_WORD *)&v15[12] = 2080;
      *(void *)&v15[14] = "-[AVCAnsweringMachine start]_block_invoke";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 366;
      WORD2(v16) = 2048;
      *(void *)((char *)&v16 + 6) = v14;
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCAnsweringMachine-start (%p)", v15, 0x26u);
    }
  }
}

- (void)stop
{
  v3[5] = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __27__AVCAnsweringMachine_stop__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

void __27__AVCAnsweringMachine_stop__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() != *(void *)(a1 + 32))
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_12;
    }
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    __int16 v10 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)objc_super v15 = 136316418;
    *(void *)&v15[4] = v9;
    *(_WORD *)&v15[12] = 2080;
    *(void *)&v15[14] = "-[AVCAnsweringMachine stop]_block_invoke";
    *(_WORD *)&v15[22] = 1024;
    LODWORD(v16) = 372;
    WORD2(v16) = 2112;
    *(void *)((char *)&v16 + 6) = v2;
    HIWORD(v16) = 2048;
    uint64_t v17 = v11;
    LOWORD(v18) = 2112;
    *(void *)((char *)&v18 + 2) = v11;
    BOOL v6 = " [%s] %s:%d %@(%p) self=%@";
    uint64_t v7 = v10;
    uint32_t v8 = 58;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)objc_super v15 = 136315906;
      *(void *)&v15[4] = v3;
      *(_WORD *)&v15[12] = 2080;
      *(void *)&v15[14] = "-[AVCAnsweringMachine stop]_block_invoke";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 372;
      WORD2(v16) = 2112;
      *(void *)((char *)&v16 + 6) = v5;
      BOOL v6 = " [%s] %s:%d self=%@";
      uint64_t v7 = v4;
      uint32_t v8 = 38;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, v15, v8);
    }
  }
LABEL_12:
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "sendMessageAsync:", "vcAnsweringMachineStop", *(_OWORD *)v15, *(void *)&v15[16], v16, v17, v18);
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCAnsweringMachine-stop");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint64_t v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)objc_super v15 = 136315906;
      *(void *)&v15[4] = v12;
      *(_WORD *)&v15[12] = 2080;
      *(void *)&v15[14] = "-[AVCAnsweringMachine stop]_block_invoke";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 374;
      WORD2(v16) = 2048;
      *(void *)((char *)&v16 + 6) = v14;
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCAnsweringMachine-stop (%p)", v15, 0x26u);
    }
  }
}

- (int64_t)messageAudioToken
{
  return self->_messageAudioToken;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

void __57__AVCAnsweringMachine_registerDidStartBlockWithInstance___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to fetch non-nil strongSelf", v2, v3, v4, v5, v6);
}

void __56__AVCAnsweringMachine_registerDidStopBlockWithInstance___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to fetch non-nil strongSelf", v2, v3, v4, v5, v6);
}

void __56__AVCAnsweringMachine_registerDidStopBlockWithInstance___block_invoke_19_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No message recording URL sandbox extension token to consume", v2, v3, v4, v5, v6);
}

void __68__AVCAnsweringMachine_registerServerDidDisconnectBlockWithInstance___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to fetch non-nil strongSelf", v2, v3, v4, v5, v6);
}

void __70__AVCAnsweringMachine_registerDidFinishAnnouncementBlockWithInstance___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to fetch non-nil strongSelf", v2, v3, v4, v5, v6);
}

- (void)setUpDelegateQueue:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate delegateQueue", v2, v3, v4, v5, v6);
}

- (void)setUpServerConnection
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  uint64_t v7 = "-[AVCAnsweringMachine setUpServerConnection]";
  __int16 v8 = 1024;
  int v9 = 285;
  __int16 v10 = 2112;
  uint64_t v11 = v3;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to serialize configuration=%@", (uint8_t *)&v4, 0x26u);
}

- (void)initWithConfiguration:delegate:delegateQueue:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d nil configuration passed", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:delegate:delegateQueue:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d nil delegate passed", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:delegate:delegateQueue:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_15();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate super instance", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:delegate:delegateQueue:.cold.4()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_15();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  __int16 v5 = 2048;
  uint64_t v6 = 0;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate super instance", v2, 0x30u);
}

- (void)initWithConfiguration:delegate:delegateQueue:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate xpc client", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:delegate:delegateQueue:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate stateQueue", v2, v3, v4, v5, v6);
}

@end