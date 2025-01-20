@interface AVCVirtualTTYDevice
- (AVCVirtualTTYDevice)initWithMode:(int64_t)a3 error:(id *)a4;
- (AVCVirtualTTYDevice)initWithMode:(int64_t)a3 error:(id *)a4 streamToken:(int64_t)a5;
- (AVCVirtualTTYDevice)initWithStreamToken:(int64_t)a3 error:(id *)a4;
- (AVCVirtualTTYDeviceDelegate)delegate;
- (BOOL)sendText:(id)a3;
- (id)sendCharacter:(unsigned __int16)a3;
- (void)dealloc;
- (void)deregisterBlocksForDelegateNotifications;
- (void)registerBlocksForDelegateNotifications;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)stop;
- (void)terminateSession;
@end

@implementation AVCVirtualTTYDevice

- (AVCVirtualTTYDevice)initWithStreamToken:(int64_t)a3 error:(id *)a4
{
  return [(AVCVirtualTTYDevice *)self initWithMode:3 error:a4 streamToken:a3];
}

- (AVCVirtualTTYDevice)initWithMode:(int64_t)a3 error:(id *)a4
{
  return [(AVCVirtualTTYDevice *)self initWithMode:a3 error:a4 streamToken:0];
}

- (AVCVirtualTTYDevice)initWithMode:(int64_t)a3 error:(id *)a4 streamToken:(int64_t)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (a4) {
        v11 = (__CFString *)*a4;
      }
      else {
        v11 = @"nil";
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v29 = v9;
      __int16 v30 = 2080;
      v31 = "-[AVCVirtualTTYDevice initWithMode:error:streamToken:]";
      __int16 v32 = 1024;
      int v33 = 47;
      __int16 v34 = 1024;
      *(_DWORD *)v35 = a3;
      *(_WORD *)&v35[4] = 1024;
      *(_DWORD *)&v35[6] = a5;
      *(_WORD *)v36 = 2112;
      *(void *)&v36[2] = v11;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d mode=%d, streamToken=%u error=%@", buf, 0x32u);
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)AVCVirtualTTYDevice;
  v12 = [(AVCVirtualTTYDevice *)&v27 init];
  if (v12)
  {
    VRTraceReset();
    VRTracePrintLoggingInfo();
    v12->_connection = objc_alloc_init(AVConferenceXPCClient);
    id v13 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v14 = [NSNumber numberWithInteger:a3];
    v15 = objc_msgSend(v13, "initWithObjectsAndKeys:", v14, @"vcMediaStreamDictionary", objc_msgSend(NSNumber, "numberWithInteger:", a5), @"vcMediaStreamToken", 0);
    if (a3 == 3) {
      v16 = "vcVirtualRTTDeviceInitialize";
    }
    else {
      v16 = "vcVirtualTTYDeviceInitialize";
    }
    id v17 = [(AVConferenceXPCClient *)v12->_connection sendMessageSync:v16 arguments:v15];
    [(AVCVirtualTTYDevice *)v12 registerBlocksForDelegateNotifications];
    if (v17)
    {
      id v18 = (id)[v17 objectForKeyedSubscript:@"ERROR"];
      if (v18 || [v17 objectForKeyedSubscript:@"TIMEOUT"])
      {
        if (a4) {
          *a4 = v18;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v19 = VRTraceErrorLogLevelToCSTR();
          v20 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            if (v18) {
              v25 = (const char *)objc_msgSend((id)objc_msgSend(v18, "description"), "UTF8String");
            }
            else {
              v25 = "<nil>";
            }
            uint64_t v26 = objc_msgSend((id)objc_msgSend(v17, "description"), "UTF8String");
            *(_DWORD *)buf = 136316162;
            uint64_t v29 = v19;
            __int16 v30 = 2080;
            v31 = "-[AVCVirtualTTYDevice initWithMode:error:streamToken:]";
            __int16 v32 = 1024;
            int v33 = 65;
            __int16 v34 = 2080;
            *(void *)v35 = v25;
            *(_WORD *)&v35[8] = 2080;
            *(void *)v36 = v26;
            _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, "AVCVirtualTTYDevice [%s] %s:%d AVCVirtualTTYDevice: error initializing error[%s] resultDict[%s]", buf, 0x30u);
          }
        }

        v12 = 0;
      }
    }

    MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCVirtualTTYDevice-init");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (a4) {
          v23 = (__CFString *)*a4;
        }
        else {
          v23 = @"None";
        }
        *(_DWORD *)buf = 136316674;
        uint64_t v29 = v21;
        __int16 v30 = 2080;
        v31 = "-[AVCVirtualTTYDevice initWithMode:error:streamToken:]";
        __int16 v32 = 1024;
        int v33 = 75;
        __int16 v34 = 2048;
        *(void *)v35 = v12;
        *(_WORD *)&v35[8] = 1024;
        *(_DWORD *)v36 = a3;
        *(_WORD *)&v36[4] = 1024;
        *(_DWORD *)&v36[6] = a5;
        __int16 v37 = 2112;
        v38 = v23;
        _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d @:@ AVCVirtualTTYDevice-init (%p) mode=%d, streamToken=%d, error=%@", buf, 0x3Cu);
      }
    }
  }
  return v12;
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v11 = v5;
      __int16 v12 = 2080;
      id v13 = "-[AVCVirtualTTYDevice dealloc]";
      __int16 v14 = 1024;
      int v15 = 81;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  objc_storeWeak(&self->_delegate, 0);
  [(AVCVirtualTTYDevice *)self deregisterBlocksForDelegateNotifications];
  [(AVCVirtualTTYDevice *)self terminateSession];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCVirtualTTYDevice-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v11 = v7;
      __int16 v12 = 2080;
      id v13 = "-[AVCVirtualTTYDevice dealloc]";
      __int16 v14 = 1024;
      int v15 = 87;
      __int16 v16 = 2048;
      id v17 = self;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d @:@ AVCVirtualTTYDevice-dealloc (%p)", buf, 0x26u);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)AVCVirtualTTYDevice;
  [(AVCVirtualTTYDevice *)&v9 dealloc];
}

- (AVCVirtualTTYDeviceDelegate)delegate
{
  return (AVCVirtualTTYDeviceDelegate *)objc_loadWeak(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      v10 = "-[AVCVirtualTTYDevice setDelegate:]";
      __int16 v11 = 1024;
      int v12 = 96;
      __int16 v13 = 2112;
      id v14 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d delegate=%@", (uint8_t *)&v7, 0x26u);
    }
  }
  objc_storeWeak(&self->_delegate, a3);
}

- (void)start
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315650;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      int v12 = "-[AVCVirtualTTYDevice start]";
      __int16 v13 = 1024;
      int v14 = 101;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d ", (uint8_t *)&v9, 0x1Cu);
    }
  }
  self->_isStarted = 1;
  [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamStartConference"];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCVirtualTTYDevice-start");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315906;
      uint64_t v10 = v7;
      __int16 v11 = 2080;
      int v12 = "-[AVCVirtualTTYDevice start]";
      __int16 v13 = 1024;
      int v14 = 104;
      __int16 v15 = 2048;
      __int16 v16 = self;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d @:@ AVCVirtualTTYDevice-start (%p)", (uint8_t *)&v9, 0x26u);
    }
  }
}

- (void)stop
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315650;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      int v12 = "-[AVCVirtualTTYDevice stop]";
      __int16 v13 = 1024;
      int v14 = 108;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d ", (uint8_t *)&v9, 0x1Cu);
    }
  }
  self->_isStarted = 0;
  [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamStopConference"];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCVirtualTTYDevice-stop");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315906;
      uint64_t v10 = v7;
      __int16 v11 = 2080;
      int v12 = "-[AVCVirtualTTYDevice stop]";
      __int16 v13 = 1024;
      int v14 = 111;
      __int16 v15 = 2048;
      __int16 v16 = self;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d @:@ AVCVirtualTTYDevice-stop (%p)", (uint8_t *)&v9, 0x26u);
    }
  }
}

- (id)sendCharacter:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v6 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 8)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *v6;
    int v9 = *v6;
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v17 = v7;
        __int16 v18 = 2080;
        uint64_t v19 = "-[AVCVirtualTTYDevice sendCharacter:]";
        __int16 v20 = 1024;
        int v21 = 115;
        __int16 v22 = 1024;
        *(_DWORD *)v23 = v3;
        *(_WORD *)&v23[4] = 1024;
        *(_DWORD *)&v23[6] = v3;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d Sending text:0x%04x '%C'", buf, 0x28u);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[AVCVirtualTTYDevice sendCharacter:](v7);
    }
  }
  if (self->_isStarted)
  {
    uint64_t v10 = [NSNumber numberWithUnsignedShort:v3];
    __int16 v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v10, @"vcMediaStreamDictionary", 0);
    [(AVConferenceXPCClient *)self->_connection sendMessageSync:"vcVirtualTTYDeviceSendCharacter" arguments:v11];

    id v12 = 0;
  }
  else
  {
    id v12 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"AVCVirtualTTYDevice" code:0 userInfo:0];
  }
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCVirtualTTYDevice-sendCharacter");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    int v14 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v17 = v13;
      __int16 v18 = 2080;
      uint64_t v19 = "-[AVCVirtualTTYDevice sendCharacter:]";
      __int16 v20 = 1024;
      int v21 = 125;
      __int16 v22 = 2048;
      *(void *)v23 = self;
      *(_WORD *)&v23[8] = 2112;
      id v24 = v12;
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d @:@ AVCVirtualTTYDevice-sendCharacter (%p) error=%@", buf, 0x30u);
    }
  }
  return v12;
}

- (BOOL)sendText:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  uint64_t v5 = (unsigned char *)MEMORY[0x1E4F47A40];
  v6 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 8)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *v6;
    int v9 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v26 = v7;
        __int16 v27 = 2080;
        v28 = "-[AVCVirtualTTYDevice sendText:]";
        __int16 v29 = 1024;
        int v30 = 130;
        __int16 v31 = 2112;
        *(void *)__int16 v32 = a3;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d Sending text:%@", buf, 0x26u);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[AVCVirtualTTYDevice sendText:]();
    }
  }
  if ([a3 length])
  {
    unint64_t v10 = 0;
    do
    {
      int v11 = [a3 characterAtIndex:v10];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        uint64_t v13 = *v6;
        int v14 = *v6;
        if (*v5)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            int v15 = [a3 length];
            *(_DWORD *)buf = 136316674;
            uint64_t v26 = v12;
            __int16 v27 = 2080;
            v28 = "-[AVCVirtualTTYDevice sendText:]";
            __int16 v29 = 1024;
            int v30 = 131;
            __int16 v31 = 1024;
            *(_DWORD *)__int16 v32 = v10;
            *(_WORD *)&v32[4] = 1024;
            *(_DWORD *)&v32[6] = v15;
            __int16 v33 = 1024;
            int v34 = v11;
            __int16 v35 = 1024;
            int v36 = v11;
            _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d %d/%d: 0x%04x '%C'", buf, 0x34u);
          }
        }
        else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          int v16 = [a3 length];
          *(_DWORD *)buf = 136316674;
          uint64_t v26 = v12;
          __int16 v27 = 2080;
          v28 = "-[AVCVirtualTTYDevice sendText:]";
          __int16 v29 = 1024;
          int v30 = 131;
          __int16 v31 = 1024;
          *(_DWORD *)__int16 v32 = v10;
          *(_WORD *)&v32[4] = 1024;
          *(_DWORD *)&v32[6] = v16;
          __int16 v33 = 1024;
          int v34 = v11;
          __int16 v35 = 1024;
          int v36 = v11;
          _os_log_debug_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEBUG, "AVCVirtualTTYDevice [%s] %s:%d %d/%d: 0x%04x '%C'", buf, 0x34u);
        }
      }
      ++v10;
    }
    while (v10 < [a3 length]);
  }
  BOOL isStarted = self->_isStarted;
  if (self->_isStarted)
  {
    __int16 v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", a3, @"vcMediaStreamDictionary", 0);
    [(AVConferenceXPCClient *)self->_connection sendMessageSync:"vcVirtualTTYDeviceSendText" arguments:v18];

    MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCVirtualTTYDevice-sendText");
    if ((int)VRTraceGetErrorLogLevelForModule() > 5)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      __int16 v20 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v26 = v19;
        __int16 v27 = 2080;
        v28 = "-[AVCVirtualTTYDevice sendText:]";
        __int16 v29 = 1024;
        int v30 = 141;
        __int16 v31 = 2048;
        *(void *)__int16 v32 = self;
        int v21 = "AVCVirtualTTYDevice [%s] %s:%d @:@ AVCVirtualTTYDevice-sendText (%p)";
LABEL_26:
        _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 0x26u);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR)) {
        -[AVCVirtualTTYDevice sendText:]();
      }
    }
    MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCVirtualTTYDevice-sendText");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      __int16 v20 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v26 = v22;
        __int16 v27 = 2080;
        v28 = "-[AVCVirtualTTYDevice sendText:]";
        __int16 v29 = 1024;
        int v30 = 138;
        __int16 v31 = 2048;
        *(void *)__int16 v32 = self;
        int v21 = "AVCVirtualTTYDevice [%s] %s:%d @:@ AVCVirtualTTYDevice-sendText (%p) Not started";
        goto LABEL_26;
      }
    }
  }
  return isStarted;
}

- (void)registerBlocksForDelegateNotifications
{
  v7[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke;
  v7[3] = &unk_1E6DB4338;
  v7[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamDidStartConnection" block:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_53;
  v6[3] = &unk_1E6DB4338;
  v6[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamDidStopConnection" block:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_55;
  v5[3] = &unk_1E6DB4338;
  v5[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamTTYCharacterReceived" block:v5];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_62;
  v4[3] = &unk_1E6DB4338;
  v4[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamTextReceived" block:v4];
}

void __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (a2) {
        uint64_t v8 = (const char *)objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
      }
      else {
        uint64_t v8 = "<nil>";
      }
      int v29 = 136316162;
      uint64_t v30 = v6;
      __int16 v31 = 2080;
      __int16 v32 = "-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke";
      __int16 v33 = 1024;
      int v34 = 150;
      __int16 v35 = 2048;
      int v36 = a3;
      __int16 v37 = 2080;
      v38 = v8;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d didStartConnectionBlock: error = %p, result = %s", (uint8_t *)&v29, 0x30u);
    }
  }
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v9 = [*(id *)(a1 + 32) strong];
    if (v9)
    {
      unint64_t v10 = (void *)v9;
      int v11 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamConnectionStarted"];
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      uint64_t v13 = (os_log_t *)MEMORY[0x1E4F47A50];
      if (ErrorLogLevelForModule >= 7)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        int v15 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = [v11 BOOLValue];
          int v29 = 136315906;
          uint64_t v30 = v14;
          __int16 v31 = 2080;
          __int16 v32 = "-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v33 = 1024;
          int v34 = 161;
          __int16 v35 = 1024;
          LODWORD(v36) = v16;
          _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d AVCVirtualTTYDevice: didStartConnectionBlock strongSelf started(%d)", (uint8_t *)&v29, 0x22u);
        }
      }
      uint64_t v17 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamError"];
      if (v17) {
        uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithDomain:code:userInfo:", objc_msgSend(v17, "objectForKeyedSubscript:", @"ERROR_DOMAIN"), (int)objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", @"ERROR_CODE"), "intValue"), objc_msgSend(v17, "objectForKeyedSubscript:", @"ERROR_USERINFO"));
      }
      MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCVirtualTTYDevice-didStart");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        uint64_t v19 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = [v11 intValue];
          int v29 = 136316162;
          uint64_t v30 = v18;
          __int16 v31 = 2080;
          __int16 v32 = "-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v33 = 1024;
          int v34 = 171;
          __int16 v35 = 2048;
          int v36 = v10;
          __int16 v37 = 1024;
          LODWORD(v38) = v20;
          _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d @:@ AVCVirtualTTYDevice-didStart (%p) didSucceed=%d", (uint8_t *)&v29, 0x2Cu);
        }
      }
      objc_msgSend((id)objc_msgSend(v10, "delegate"), "device:didStart:error:", v10, objc_msgSend(v11, "BOOLValue"), v17);

      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        return;
      }
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      os_log_t v22 = *v13;
      if (!os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      int v23 = [v11 BOOLValue];
      int v29 = 136316162;
      uint64_t v30 = v21;
      __int16 v31 = 2080;
      __int16 v32 = "-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke";
      __int16 v33 = 1024;
      int v34 = 175;
      __int16 v35 = 2048;
      int v36 = v10;
      __int16 v37 = 1024;
      LODWORD(v38) = v23;
      id v24 = "AVCVirtualTTYDevice [%s] %s:%d AVCVirtualTTYDevice: notified client %p of didStart started[%d]";
      uint64_t v25 = v22;
      uint32_t v26 = 44;
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return;
      }
      uint64_t v27 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      int v29 = 136315650;
      uint64_t v30 = v27;
      __int16 v31 = 2080;
      __int16 v32 = "-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke";
      __int16 v33 = 1024;
      int v34 = 155;
      id v24 = "AVCVirtualTTYDevice [%s] %s:%d AVCVirtualTTYDevice: didStartConnectionBlock: strongSelf == nil";
      uint64_t v25 = v28;
      uint32_t v26 = 28;
    }
    _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v29, v26);
  }
}

void __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_53(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v4 = [*(id *)(a1 + 32) strong];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCVirtualTTYDevice-didStop");
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      uint64_t v7 = (os_log_t *)MEMORY[0x1E4F47A50];
      if (ErrorLogLevelForModule >= 6)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 136315906;
          uint64_t v13 = v8;
          __int16 v14 = 2080;
          int v15 = "-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v16 = 1024;
          int v17 = 187;
          __int16 v18 = 2048;
          uint64_t v19 = v5;
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d @:@ AVCVirtualTTYDevice-didStop (%p)", (uint8_t *)&v12, 0x26u);
        }
      }
      objc_msgSend((id)objc_msgSend(v5, "delegate"), "deviceDidStop:", v5);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        int v11 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 136315906;
          uint64_t v13 = v10;
          __int16 v14 = 2080;
          int v15 = "-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v16 = 1024;
          int v17 = 189;
          __int16 v18 = 2048;
          uint64_t v19 = v5;
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d AVCVirtualTTYDevice: notified client %p of didStop", (uint8_t *)&v12, 0x26u);
        }
      }
    }
  }
}

void __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_55(uint64_t a1, void *a2, uint64_t a3)
{
  *(void *)&v21[5] = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      unsigned __int16 v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcMediaStreamTTYCharacterReceived"), "unsignedIntegerValue");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x1E4F47A50];
        uint64_t v10 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            int v14 = 136316162;
            uint64_t v15 = v8;
            __int16 v16 = 2080;
            int v17 = "-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke";
            __int16 v18 = 1024;
            int v19 = 202;
            __int16 v20 = 1024;
            *(_DWORD *)uint64_t v21 = v7;
            v21[2] = 1024;
            *(_DWORD *)&v21[3] = v7;
            _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d Received text:0x%04x '%C'", (uint8_t *)&v14, 0x28u);
          }
        }
        else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_55_cold_2(v8);
        }
      }
      [v6 delegate];
      if (objc_opt_respondsToSelector())
      {
        MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCVirtualTTYDevice-didReceiveCharacter");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v11 = VRTraceErrorLogLevelToCSTR();
          int v12 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v14 = 136315906;
            uint64_t v15 = v11;
            __int16 v16 = 2080;
            int v17 = "-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke";
            __int16 v18 = 1024;
            int v19 = 204;
            __int16 v20 = 2048;
            *(void *)uint64_t v21 = v6;
            _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d @:@ AVCVirtualTTYDevice-didReceiveCharacter (%p)", (uint8_t *)&v14, 0x26u);
          }
        }
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "device:didReceiveCharacter:", v6, v7);
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_55_cold_1(v13, v6);
        }
      }
    }
  }
}

void __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_62(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint32_t v26 = (void *)v5;
      uint64_t v6 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamTextReceived"];
      uint64_t v7 = [v6 length];
      uint64_t v8 = (os_log_t *)MEMORY[0x1E4F47A50];
      if (!v7 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
          __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_62_cold_3(v9, v10);
        }
      }
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      int v12 = (unsigned char *)MEMORY[0x1E4F47A40];
      if (ErrorLogLevelForModule >= 8)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        int v14 = *v8;
        uint64_t v15 = *v8;
        if (*v12)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            uint64_t v28 = v13;
            __int16 v29 = 2080;
            uint64_t v30 = "-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke";
            __int16 v31 = 1024;
            int v32 = 224;
            __int16 v33 = 2112;
            *(void *)int v34 = v6;
            _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d Received text:%@", buf, 0x26u);
          }
        }
        else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_62_cold_2();
        }
      }
      if ([v6 length])
      {
        unint64_t v16 = 0;
        do
        {
          int v17 = [v6 characterAtIndex:v16];
          if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
          {
            uint64_t v18 = VRTraceErrorLogLevelToCSTR();
            int v19 = *v8;
            __int16 v20 = *v8;
            if (*v12)
            {
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                int v21 = [v6 length];
                *(_DWORD *)buf = 136316674;
                uint64_t v28 = v18;
                __int16 v29 = 2080;
                uint64_t v30 = "-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke";
                __int16 v31 = 1024;
                int v32 = 225;
                __int16 v33 = 1024;
                *(_DWORD *)int v34 = v16;
                *(_WORD *)&v34[4] = 1024;
                *(_DWORD *)&v34[6] = v21;
                __int16 v35 = 1024;
                int v36 = v17;
                __int16 v37 = 1024;
                int v38 = v17;
                _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d %d/%d: 0x%04x '%C'", buf, 0x34u);
              }
            }
            else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              int v22 = [v6 length];
              *(_DWORD *)buf = 136316674;
              uint64_t v28 = v18;
              __int16 v29 = 2080;
              uint64_t v30 = "-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke";
              __int16 v31 = 1024;
              int v32 = 225;
              __int16 v33 = 1024;
              *(_DWORD *)int v34 = v16;
              *(_WORD *)&v34[4] = 1024;
              *(_DWORD *)&v34[6] = v22;
              __int16 v35 = 1024;
              int v36 = v17;
              __int16 v37 = 1024;
              int v38 = v17;
              _os_log_debug_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEBUG, "AVCVirtualTTYDevice [%s] %s:%d %d/%d: 0x%04x '%C'", buf, 0x34u);
            }
          }
          ++v16;
        }
        while (v16 < [v6 length]);
      }
      [v26 delegate];
      if (objc_opt_respondsToSelector())
      {
        MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCVirtualTTYDevice-didReceiveText");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v23 = VRTraceErrorLogLevelToCSTR();
          id v24 = *v8;
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            uint64_t v28 = v23;
            __int16 v29 = 2080;
            uint64_t v30 = "-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke";
            __int16 v31 = 1024;
            int v32 = 227;
            __int16 v33 = 2048;
            *(void *)int v34 = v26;
            _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d @:@ AVCVirtualTTYDevice-didReceiveText (%p)", buf, 0x26u);
          }
        }
        objc_msgSend((id)objc_msgSend(v26, "delegate"), "device:didReceiveText:", v26, v6);
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v25 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
          __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_62_cold_1(v25, v26);
        }
      }
    }
  }
}

- (void)deregisterBlocksForDelegateNotifications
{
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcMediaStreamDidStartConnection"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcMediaStreamDidStopConnection"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcMediaStreamTTYCharacterReceived"];
  connection = self->_connection;

  [(AVConferenceXPCClient *)connection deregisterFromService:"vcMediaStreamTextReceived"];
}

- (void)terminateSession
{
  [(AVConferenceXPCClient *)self->_connection sendMessageSync:"vcVirtualTTYDeviceTerminate"];
  connection = self->_connection;
}

- (void)sendCharacter:(uint64_t)a1 .cold.1(uint64_t a1)
{
  *(_DWORD *)uint64_t v3 = 136316162;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(void *)&v3[14] = "-[AVCVirtualTTYDevice sendCharacter:]";
  OUTLINED_FUNCTION_4_18();
  OUTLINED_FUNCTION_13_2(&dword_1E1EA4000, v1, v2, "AVCVirtualTTYDevice [%s] %s:%d Sending text:0x%04x '%C'", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[AVCVirtualTTYDevice sendCharacter:]" >> 16, v4, v5);
}

- (void)sendText:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, "AVCVirtualTTYDevice [%s] %s:%d %@ has not started.", v3, v4, v5, v6, v7);
}

- (void)sendText:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, "AVCVirtualTTYDevice [%s] %s:%d Sending text:%@");
}

void __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_55_cold_1(uint64_t a1, void *a2)
{
  [a2 delegate];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, "AVCVirtualTTYDevice [%s] %s:%d Delegate %@ does not respond to -device:didReceiveCharacter:", v4, v5, v6, v7, v8);
}

void __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_55_cold_2(uint64_t a1)
{
  *(_DWORD *)uint64_t v3 = 136316162;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(void *)&v3[14] = "-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke";
  OUTLINED_FUNCTION_4_18();
  OUTLINED_FUNCTION_13_2(&dword_1E1EA4000, v1, v2, "AVCVirtualTTYDevice [%s] %s:%d Received text:0x%04x '%C'", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke" >> 16, v4, v5);
}

void __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_62_cold_1(uint64_t a1, void *a2)
{
  [a2 delegate];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, "AVCVirtualTTYDevice [%s] %s:%d Delegate %@ does not respond to -device:didReceiveText:", v4, v5, v6, v7, v8);
}

void __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_62_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, "AVCVirtualTTYDevice [%s] %s:%d Received text:%@");
}

void __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_62_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke";
  __int16 v6 = 1024;
  int v7 = 222;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, "AVCVirtualTTYDevice [%s] %s:%d Received an empty string", (uint8_t *)&v2, 0x1Cu);
}

@end