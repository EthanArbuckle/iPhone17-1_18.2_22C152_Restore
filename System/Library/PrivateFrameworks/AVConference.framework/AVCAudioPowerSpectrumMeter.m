@interface AVCAudioPowerSpectrumMeter
+ (unsigned)cellularTapTypeWithClientCellularTapType:(unsigned int)a3;
- (AVCAudioPowerSpectrumMeter)initWithConfig:(_AVCAudioPowerSpectrumMeterConfig *)a3 delegate:(id)a4 queue:(id)a5;
- (AVCAudioPowerSpectrumMeterDelegate)delegate;
- (BOOL)dispatchedProcessBasebandRegistrationResult:(id)a3 forTapType:(unsigned int)a4 withError:(id *)a5;
- (BOOL)dispatchedRegisterPowerSpectrumForCellularTapType:(unsigned int)a3 error:(id *)a4;
- (BOOL)dispatchedUnregisterPowerSpectrumForCellularTapType:(unsigned int)a3 error:(id *)a4;
- (BOOL)enableAsyncTapStart;
- (BOOL)registerPowerSpectrumForCellularTapType:(unsigned int)a3 error:(id *)a4;
- (BOOL)setupPowerSpectrumMeter;
- (BOOL)setupXPCConnection;
- (BOOL)storeDelegate:(id)a3 delegateQueue:(id)a4;
- (BOOL)unregisterPowerSpectrumForCellularTapType:(unsigned int)a3 error:(id *)a4;
- (OS_dispatch_queue)delegateQueue;
- (int64_t)streamTokenForCellularTapType:(unsigned int)a3;
- (unsigned)sessionToken;
- (void)audioPowerSpectrumMeter:(id)a3 didUpdateAudioPowerSpectrums:(id)a4;
- (void)cleanupDelegate;
- (void)cleanupPowerSpectrumMeter;
- (void)cleanupXPCConnection;
- (void)dealloc;
- (void)deregisterBlocksForService;
- (void)dispatchedUnregisterBasebandTokensForAudioTapType:(unsigned int)a3;
- (void)invalidateBasebandTokens;
- (void)registerBlocksForNotifications;
- (void)registerPowerSpectrumForStreamToken:(int64_t)a3;
- (void)setEnableAsyncTapStart:(BOOL)a3;
- (void)setupPowerSpectrumMeter;
- (void)setupXPCConnection;
- (void)unregisterPowerSpectrumForStreamToken:(int64_t)a3;
@end

@implementation AVCAudioPowerSpectrumMeter

- (AVCAudioPowerSpectrumMeter)initWithConfig:(_AVCAudioPowerSpectrumMeterConfig *)a3 delegate:(id)a4 queue:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  VRTraceReset();
  v26.receiver = self;
  v26.super_class = (Class)AVCAudioPowerSpectrumMeter;
  v9 = [(AVCAudioPowerSpectrumMeter *)&v26 init];
  if (v9)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v9->_basebandAudioTapTypeToStreamTokenMap = v10;
    if (v10)
    {
      CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
      dispatch_queue_t v12 = dispatch_queue_create_with_target_V2("com.apple.AVConference.AVCAudioPowerSpectrumMeter.stateQueue", 0, CustomRootQueue);
      v9->_stateQueue = (OS_dispatch_queue *)v12;
      if (v12)
      {
        if ([(AVCAudioPowerSpectrumMeter *)v9 storeDelegate:a4 delegateQueue:a5])
        {
          if ([(AVCAudioPowerSpectrumMeter *)v9 setupXPCConnection])
          {
            v9->_sessionToken = 0;
            v9->_audioSpectrumBinCount = a3->var2;
            v9->_audioSpectrumRefreshRate = a3->var3;
            if ([(AVCAudioPowerSpectrumMeter *)v9 setupPowerSpectrumMeter]) {
              return v9;
            }
            if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == v9)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                  -[AVCAudioPowerSpectrumMeter initWithConfig:delegate:queue:]();
                }
              }
              goto LABEL_59;
            }
            if (objc_opt_respondsToSelector()) {
              v18 = (__CFString *)[(AVCAudioPowerSpectrumMeter *)v9 performSelector:sel_logPrefix];
            }
            else {
              v18 = &stru_1F3D3E450;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v25 = VRTraceErrorLogLevelToCSTR();
              v20 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                uint64_t v28 = v25;
                __int16 v29 = 2080;
                v30 = "-[AVCAudioPowerSpectrumMeter initWithConfig:delegate:queue:]";
                __int16 v31 = 1024;
                int v32 = 69;
                __int16 v33 = 2112;
                v34 = v18;
                __int16 v35 = 2048;
                v36 = v9;
                v21 = " [%s] %s:%d %@(%p) Failed to initialize the power spectrum meter";
                goto LABEL_58;
              }
            }
LABEL_59:

            return 0;
          }
          if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == v9)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[AVCAudioPowerSpectrumMeter initWithConfig:delegate:queue:].cold.4();
              }
            }
            goto LABEL_59;
          }
          if (objc_opt_respondsToSelector()) {
            v17 = (__CFString *)[(AVCAudioPowerSpectrumMeter *)v9 performSelector:sel_logPrefix];
          }
          else {
            v17 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            goto LABEL_59;
          }
          uint64_t v24 = VRTraceErrorLogLevelToCSTR();
          v20 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            goto LABEL_59;
          }
          *(_DWORD *)buf = 136316162;
          uint64_t v28 = v24;
          __int16 v29 = 2080;
          v30 = "-[AVCAudioPowerSpectrumMeter initWithConfig:delegate:queue:]";
          __int16 v31 = 1024;
          int v32 = 62;
          __int16 v33 = 2112;
          v34 = v17;
          __int16 v35 = 2048;
          v36 = v9;
          v21 = " [%s] %s:%d %@(%p) Failed to setup XPC";
        }
        else
        {
          if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == v9)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[AVCAudioPowerSpectrumMeter initWithConfig:delegate:queue:].cold.5();
              }
            }
            goto LABEL_59;
          }
          if (objc_opt_respondsToSelector()) {
            v16 = (__CFString *)[(AVCAudioPowerSpectrumMeter *)v9 performSelector:sel_logPrefix];
          }
          else {
            v16 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            goto LABEL_59;
          }
          uint64_t v23 = VRTraceErrorLogLevelToCSTR();
          v20 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            goto LABEL_59;
          }
          *(_DWORD *)buf = 136316162;
          uint64_t v28 = v23;
          __int16 v29 = 2080;
          v30 = "-[AVCAudioPowerSpectrumMeter initWithConfig:delegate:queue:]";
          __int16 v31 = 1024;
          int v32 = 59;
          __int16 v33 = 2112;
          v34 = v16;
          __int16 v35 = 2048;
          v36 = v9;
          v21 = " [%s] %s:%d %@(%p) Failed to setup delegate queue";
        }
      }
      else
      {
        if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == v9)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[AVCAudioPowerSpectrumMeter initWithConfig:delegate:queue:]();
            }
          }
          goto LABEL_59;
        }
        if (objc_opt_respondsToSelector()) {
          v15 = (__CFString *)[(AVCAudioPowerSpectrumMeter *)v9 performSelector:sel_logPrefix];
        }
        else {
          v15 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_59;
        }
        uint64_t v22 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_59;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v28 = v22;
        __int16 v29 = 2080;
        v30 = "-[AVCAudioPowerSpectrumMeter initWithConfig:delegate:queue:]";
        __int16 v31 = 1024;
        int v32 = 57;
        __int16 v33 = 2112;
        v34 = v15;
        __int16 v35 = 2048;
        v36 = v9;
        v21 = " [%s] %s:%d %@(%p) Failed to allocate stateQueue";
      }
    }
    else
    {
      if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == v9)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVCAudioPowerSpectrumMeter initWithConfig:delegate:queue:]();
          }
        }
        goto LABEL_59;
      }
      if (objc_opt_respondsToSelector()) {
        v14 = (__CFString *)[(AVCAudioPowerSpectrumMeter *)v9 performSelector:sel_logPrefix];
      }
      else {
        v14 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_59;
      }
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_59;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v28 = v19;
      __int16 v29 = 2080;
      v30 = "-[AVCAudioPowerSpectrumMeter initWithConfig:delegate:queue:]";
      __int16 v31 = 1024;
      int v32 = 55;
      __int16 v33 = 2112;
      v34 = v14;
      __int16 v35 = 2048;
      v36 = v9;
      v21 = " [%s] %s:%d %@(%p) Failed to allocate basebandAudioTapTypeToStreamTokenMap";
    }
LABEL_58:
    _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, v21, buf, 0x30u);
    goto LABEL_59;
  }
  return v9;
}

- (AVCAudioPowerSpectrumMeterDelegate)delegate
{
  return (AVCAudioPowerSpectrumMeterDelegate *)objc_loadWeak(&self->_delegate);
}

- (void)dealloc
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(AVCAudioPowerSpectrumMeter *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_12;
    }
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    v16 = "-[AVCAudioPowerSpectrumMeter dealloc]";
    __int16 v17 = 1024;
    int v18 = 84;
    __int16 v19 = 2112;
    v20 = v3;
    __int16 v21 = 2048;
    uint64_t v22 = self;
    v6 = " [%s] %s:%d %@(%p) deallocating AVCAudioPowerSpectrumMeter";
    v7 = v10;
    uint32_t v8 = 48;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v14 = v4;
      __int16 v15 = 2080;
      v16 = "-[AVCAudioPowerSpectrumMeter dealloc]";
      __int16 v17 = 1024;
      int v18 = 84;
      v6 = " [%s] %s:%d deallocating AVCAudioPowerSpectrumMeter";
      v7 = v5;
      uint32_t v8 = 28;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
LABEL_12:
  stateQueue = self->_stateQueue;
  if (stateQueue)
  {
    dispatch_release(stateQueue);
    self->_stateQueue = 0;
  }

  [(AVCAudioPowerSpectrumMeter *)self cleanupPowerSpectrumMeter];
  [(AVCAudioPowerSpectrumMeter *)self cleanupXPCConnection];
  [(AVCAudioPowerSpectrumMeter *)self cleanupDelegate];
  v12.receiver = self;
  v12.super_class = (Class)AVCAudioPowerSpectrumMeter;
  [(AVCAudioPowerSpectrumMeter *)&v12 dealloc];
}

- (void)registerPowerSpectrumForStreamToken:(int64_t)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v16 = v6;
        __int16 v17 = 2080;
        int v18 = "-[AVCAudioPowerSpectrumMeter registerPowerSpectrumForStreamToken:]";
        __int16 v19 = 1024;
        int v20 = 95;
        __int16 v21 = 2048;
        int64_t v22 = a3;
        uint32_t v8 = " [%s] %s:%d streamToken=%ld";
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
      v5 = (__CFString *)[(AVCAudioPowerSpectrumMeter *)self performSelector:sel_logPrefix];
    }
    else {
      v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      objc_super v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v16 = v11;
        __int16 v17 = 2080;
        int v18 = "-[AVCAudioPowerSpectrumMeter registerPowerSpectrumForStreamToken:]";
        __int16 v19 = 1024;
        int v20 = 95;
        __int16 v21 = 2112;
        int64_t v22 = (int64_t)v5;
        __int16 v23 = 2048;
        uint64_t v24 = self;
        __int16 v25 = 2048;
        int64_t v26 = a3;
        uint32_t v8 = " [%s] %s:%d %@(%p) streamToken=%ld";
        uint64_t v9 = v12;
        uint32_t v10 = 58;
        goto LABEL_11;
      }
    }
  }
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", a3, @"vcAudioPowerSpectrumStreamToken");
  -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcAudioPowerSpectrumRegisterListener", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
}

- (void)unregisterPowerSpectrumForStreamToken:(int64_t)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v16 = v6;
        __int16 v17 = 2080;
        int v18 = "-[AVCAudioPowerSpectrumMeter unregisterPowerSpectrumForStreamToken:]";
        __int16 v19 = 1024;
        int v20 = 102;
        __int16 v21 = 2048;
        int64_t v22 = a3;
        uint32_t v8 = " [%s] %s:%d streamToken=%ld";
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
      v5 = (__CFString *)[(AVCAudioPowerSpectrumMeter *)self performSelector:sel_logPrefix];
    }
    else {
      v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      objc_super v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v16 = v11;
        __int16 v17 = 2080;
        int v18 = "-[AVCAudioPowerSpectrumMeter unregisterPowerSpectrumForStreamToken:]";
        __int16 v19 = 1024;
        int v20 = 102;
        __int16 v21 = 2112;
        int64_t v22 = (int64_t)v5;
        __int16 v23 = 2048;
        uint64_t v24 = self;
        __int16 v25 = 2048;
        int64_t v26 = a3;
        uint32_t v8 = " [%s] %s:%d %@(%p) streamToken=%ld";
        uint64_t v9 = v12;
        uint32_t v10 = 58;
        goto LABEL_11;
      }
    }
  }
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", a3, @"vcAudioPowerSpectrumStreamToken");
  -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcAudioPowerSpectrumUnregisterListener", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
}

+ (unsigned)cellularTapTypeWithClientCellularTapType:(unsigned int)a3
{
  return a3;
}

- (BOOL)dispatchedProcessBasebandRegistrationResult:(id)a3 forTapType:(unsigned int)a4 withError:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v9 = [a3 objectForKeyedSubscript:@"vcBasebandAudioTapDirectionToken"];
  uint64_t v10 = [NSNumber numberWithUnsignedInt:v6];
  if (v9)
  {
    uint64_t v11 = v10;
    if ([(NSMutableDictionary *)self->_basebandAudioTapTypeToStreamTokenMap objectForKeyedSubscript:v10])
    {
      if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() != self)
      {
        if (objc_opt_respondsToSelector()) {
          int v18 = (__CFString *)[(AVCAudioPowerSpectrumMeter *)self performSelector:sel_logPrefix];
        }
        else {
          int v18 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_51;
        }
        uint64_t v32 = VRTraceErrorLogLevelToCSTR();
        __int16 v33 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_51;
        }
        uint64_t v34 = [(NSMutableDictionary *)self->_basebandAudioTapTypeToStreamTokenMap objectForKeyedSubscript:v11];
        int v40 = 136316930;
        uint64_t v41 = v32;
        __int16 v42 = 2080;
        v43 = "-[AVCAudioPowerSpectrumMeter dispatchedProcessBasebandRegistrationResult:forTapType:withError:]";
        __int16 v44 = 1024;
        int v45 = 127;
        __int16 v46 = 2112;
        uint64_t v47 = (uint64_t)v18;
        __int16 v48 = 2048;
        *(void *)v49 = self;
        *(_WORD *)&v49[8] = 2112;
        *(void *)&v49[10] = v34;
        __int16 v50 = 1024;
        int v51 = v6;
        __int16 v52 = 2112;
        uint64_t v53 = v9;
        uint64_t v24 = " [%s] %s:%d %@(%p) Token=%@ already exists for tapType=%u, cannot register new token=%@";
        __int16 v25 = v33;
        uint32_t v29 = 74;
        goto LABEL_50;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_51;
      }
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      int64_t v22 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_51;
      }
      uint64_t v23 = [(NSMutableDictionary *)self->_basebandAudioTapTypeToStreamTokenMap objectForKeyedSubscript:v11];
      int v40 = 136316418;
      uint64_t v41 = v21;
      __int16 v42 = 2080;
      v43 = "-[AVCAudioPowerSpectrumMeter dispatchedProcessBasebandRegistrationResult:forTapType:withError:]";
      __int16 v44 = 1024;
      int v45 = 127;
      __int16 v46 = 2112;
      uint64_t v47 = v23;
      __int16 v48 = 1024;
      *(_DWORD *)v49 = v6;
      *(_WORD *)&v49[4] = 2112;
      *(void *)&v49[6] = v9;
      uint64_t v24 = " [%s] %s:%d Token=%@ already exists for tapType=%u, cannot register new token=%@";
      __int16 v25 = v22;
LABEL_45:
      uint32_t v29 = 54;
LABEL_50:
      _os_log_error_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v40, v29);
      goto LABEL_51;
    }
    [(NSMutableDictionary *)self->_basebandAudioTapTypeToStreamTokenMap setObject:v9 forKeyedSubscript:v11];
    objc_super v12 = (void *)[a3 objectForKeyedSubscript:@"vcBasebandAudioTapTapToken"];
    if (v12)
    {
      uint64_t v13 = [v12 longValue];
      uint64_t v14 = v13;
      uint64_t sessionToken = self->_sessionToken;
      if (!sessionToken || v13 == sessionToken)
      {
        self->_uint64_t sessionToken = v13;
        return 1;
      }
      if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_51;
        }
        uint64_t v26 = VRTraceErrorLogLevelToCSTR();
        uint64_t v27 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_51;
        }
        unsigned int v28 = self->_sessionToken;
        int v40 = 136316418;
        uint64_t v41 = v26;
        __int16 v42 = 2080;
        v43 = "-[AVCAudioPowerSpectrumMeter dispatchedProcessBasebandRegistrationResult:forTapType:withError:]";
        __int16 v44 = 1024;
        int v45 = 135;
        __int16 v46 = 2048;
        uint64_t v47 = v14;
        __int16 v48 = 1024;
        *(_DWORD *)v49 = v6;
        *(_WORD *)&v49[4] = 1024;
        *(_DWORD *)&v49[6] = v28;
        uint64_t v24 = " [%s] %s:%d Different sessionToken=%ld passed from server for tapType=%u, originalToken=%u";
        __int16 v25 = v27;
        uint32_t v29 = 50;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          int v20 = (__CFString *)[(AVCAudioPowerSpectrumMeter *)self performSelector:sel_logPrefix];
        }
        else {
          int v20 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_51;
        }
        uint64_t v36 = VRTraceErrorLogLevelToCSTR();
        uint64_t v37 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_51;
        }
        unsigned int v38 = self->_sessionToken;
        int v40 = 136316930;
        uint64_t v41 = v36;
        __int16 v42 = 2080;
        v43 = "-[AVCAudioPowerSpectrumMeter dispatchedProcessBasebandRegistrationResult:forTapType:withError:]";
        __int16 v44 = 1024;
        int v45 = 135;
        __int16 v46 = 2112;
        uint64_t v47 = (uint64_t)v20;
        __int16 v48 = 2048;
        *(void *)v49 = self;
        *(_WORD *)&v49[8] = 2048;
        *(void *)&v49[10] = v14;
        __int16 v50 = 1024;
        int v51 = v6;
        __int16 v52 = 1024;
        LODWORD(v53) = v38;
        uint64_t v24 = " [%s] %s:%d %@(%p) Different sessionToken=%ld passed from server for tapType=%u, originalToken=%u";
        __int16 v25 = v37;
        uint32_t v29 = 70;
      }
      goto LABEL_50;
    }
    if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCAudioPowerSpectrumMeter dispatchedProcessBasebandRegistrationResult:forTapType:withError:]();
        }
      }
      goto LABEL_51;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v19 = (__CFString *)[(AVCAudioPowerSpectrumMeter *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v19 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v35 = VRTraceErrorLogLevelToCSTR();
      __int16 v31 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v40 = 136316418;
        uint64_t v41 = v35;
        __int16 v42 = 2080;
        v43 = "-[AVCAudioPowerSpectrumMeter dispatchedProcessBasebandRegistrationResult:forTapType:withError:]";
        __int16 v44 = 1024;
        int v45 = 132;
        __int16 v46 = 2112;
        uint64_t v47 = (uint64_t)v19;
        __int16 v48 = 2048;
        *(void *)v49 = self;
        *(_WORD *)&v49[8] = 1024;
        *(_DWORD *)&v49[10] = v6;
        uint64_t v24 = " [%s] %s:%d %@(%p) Failed to receive sessionToken from server for tapType=%u";
        goto LABEL_44;
      }
    }
  }
  else
  {
    if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCAudioPowerSpectrumMeter dispatchedProcessBasebandRegistrationResult:forTapType:withError:]();
        }
      }
      goto LABEL_51;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v17 = (__CFString *)[(AVCAudioPowerSpectrumMeter *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v17 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v30 = VRTraceErrorLogLevelToCSTR();
      __int16 v31 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v40 = 136316418;
        uint64_t v41 = v30;
        __int16 v42 = 2080;
        v43 = "-[AVCAudioPowerSpectrumMeter dispatchedProcessBasebandRegistrationResult:forTapType:withError:]";
        __int16 v44 = 1024;
        int v45 = 126;
        __int16 v46 = 2112;
        uint64_t v47 = (uint64_t)v17;
        __int16 v48 = 2048;
        *(void *)v49 = self;
        *(_WORD *)&v49[8] = 1024;
        *(_DWORD *)&v49[10] = v6;
        uint64_t v24 = " [%s] %s:%d %@(%p) Failed to receive direction token from server for tapType=%u";
LABEL_44:
        __int16 v25 = v31;
        goto LABEL_45;
      }
    }
  }
LABEL_51:
  if (!a5) {
    return 0;
  }
  v39 = (void *)[MEMORY[0x1E4F28C58] AVConferenceServiceError:32000 detailCode:0 description:@"Invalid baseband stream token state"];
  BOOL result = 0;
  *a5 = v39;
  return result;
}

- (BOOL)dispatchedRegisterPowerSpectrumForCellularTapType:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  v41[3] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v7 = +[AVCAudioPowerSpectrumMeter cellularTapTypeWithClientCellularTapType:v5];
  uint64_t v8 = [NSNumber numberWithUnsignedInt:v7];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCAudioPowerSpectrumMeter-registerPowerSpectrumForCellularTapType");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 136316162;
      uint64_t v27 = v9;
      __int16 v28 = 2080;
      uint32_t v29 = "-[AVCAudioPowerSpectrumMeter dispatchedRegisterPowerSpectrumForCellularTapType:error:]";
      __int16 v30 = 1024;
      int v31 = 159;
      __int16 v32 = 2048;
      __int16 v33 = self;
      __int16 v34 = 1024;
      LODWORD(v35) = v5;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCAudioPowerSpectrumMeter-registerPowerSpectrumForCellularTapType (%p) type=%u", (uint8_t *)&v26, 0x2Cu);
    }
  }
  if (!+[VCHardwareSettings isCellularTappingSupported])
  {
    objc_super v12 = (AVCAudioPowerSpectrumMeter *)[MEMORY[0x1E4F28C58] AVConferenceServiceError:32000 detailCode:0 description:@"Platform doesn't support callular tapping"];
    if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v14 = (__CFString *)[(AVCAudioPowerSpectrumMeter *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v14 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_20;
      }
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      uint64_t v21 = *MEMORY[0x1E4F47A50];
      BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v13) {
        goto LABEL_21;
      }
      int v26 = 136316674;
      uint64_t v27 = v20;
      __int16 v28 = 2080;
      uint32_t v29 = "-[AVCAudioPowerSpectrumMeter dispatchedRegisterPowerSpectrumForCellularTapType:error:]";
      __int16 v30 = 1024;
      int v31 = 172;
      __int16 v32 = 2112;
      __int16 v33 = (AVCAudioPowerSpectrumMeter *)v14;
      __int16 v34 = 2048;
      uint64_t v35 = self;
      __int16 v36 = 2112;
      uint64_t v37 = v8;
      __int16 v38 = 2112;
      v39 = v12;
      __int16 v17 = " [%s] %s:%d %@(%p) Failed to register the power spectrum for tap type=%@. error=%@";
      goto LABEL_18;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    {
LABEL_20:
      LOBYTE(v13) = 0;
      goto LABEL_21;
    }
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v13) {
      goto LABEL_21;
    }
    int v26 = 136316162;
    uint64_t v27 = v15;
    __int16 v28 = 2080;
    uint32_t v29 = "-[AVCAudioPowerSpectrumMeter dispatchedRegisterPowerSpectrumForCellularTapType:error:]";
    __int16 v30 = 1024;
    int v31 = 172;
    __int16 v32 = 2112;
    __int16 v33 = (AVCAudioPowerSpectrumMeter *)v8;
    __int16 v34 = 2112;
    uint64_t v35 = v12;
    __int16 v17 = " [%s] %s:%d Failed to register the power spectrum for tap type=%@. error=%@";
    goto LABEL_13;
  }
  v40[0] = @"vcAudioPowerSpectrumCellularTapType";
  v41[0] = [NSNumber numberWithUnsignedInt:v7];
  v40[1] = @"vcAudioPowerSpectrumMeterKeyType";
  v41[1] = [NSNumber numberWithUnsignedInt:v5];
  v40[2] = @"vcAudioPowerSpectrumMeterEnableAsyncTapStart";
  v41[2] = [NSNumber numberWithBool:self->_enableAsyncTapStart];
  id v11 = -[AVConferenceXPCClient sendMessageSync:arguments:](self->_connection, "sendMessageSync:arguments:", "vcAudioPowerSpectrumRegisterCellularTap", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:3]);
  objc_super v12 = (AVCAudioPowerSpectrumMeter *)[v11 objectForKeyedSubscript:@"ERROR"];
  if (!v12)
  {
    LOBYTE(v13) = [(AVCAudioPowerSpectrumMeter *)self dispatchedProcessBasebandRegistrationResult:v11 forTapType:v5 withError:a4];
    goto LABEL_21;
  }
  if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_20;
    }
    uint64_t v23 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v13) {
      goto LABEL_21;
    }
    int v26 = 136316162;
    uint64_t v27 = v23;
    __int16 v28 = 2080;
    uint32_t v29 = "-[AVCAudioPowerSpectrumMeter dispatchedRegisterPowerSpectrumForCellularTapType:error:]";
    __int16 v30 = 1024;
    int v31 = 168;
    __int16 v32 = 2112;
    __int16 v33 = (AVCAudioPowerSpectrumMeter *)v8;
    __int16 v34 = 2112;
    uint64_t v35 = v12;
    __int16 v17 = " [%s] %s:%d Failed to register the power spectrum for tap type=%@. error=%@";
LABEL_13:
    int v18 = v16;
    uint32_t v19 = 48;
LABEL_19:
    _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v26, v19);
    goto LABEL_20;
  }
  if (objc_opt_respondsToSelector()) {
    int64_t v22 = (__CFString *)[(AVCAudioPowerSpectrumMeter *)self performSelector:sel_logPrefix];
  }
  else {
    int64_t v22 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
    goto LABEL_20;
  }
  uint64_t v24 = VRTraceErrorLogLevelToCSTR();
  uint64_t v21 = *MEMORY[0x1E4F47A50];
  BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
  if (v13)
  {
    int v26 = 136316674;
    uint64_t v27 = v24;
    __int16 v28 = 2080;
    uint32_t v29 = "-[AVCAudioPowerSpectrumMeter dispatchedRegisterPowerSpectrumForCellularTapType:error:]";
    __int16 v30 = 1024;
    int v31 = 168;
    __int16 v32 = 2112;
    __int16 v33 = (AVCAudioPowerSpectrumMeter *)v22;
    __int16 v34 = 2048;
    uint64_t v35 = self;
    __int16 v36 = 2112;
    uint64_t v37 = v8;
    __int16 v38 = 2112;
    v39 = v12;
    __int16 v17 = " [%s] %s:%d %@(%p) Failed to register the power spectrum for tap type=%@. error=%@";
LABEL_18:
    int v18 = v21;
    uint32_t v19 = 68;
    goto LABEL_19;
  }
LABEL_21:
  if (a4) {
    *a4 = v12;
  }
  return v13;
}

- (BOOL)registerPowerSpectrumForCellularTapType:(unsigned int)a3 error:(id *)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__AVCAudioPowerSpectrumMeter_registerPowerSpectrumForCellularTapType_error___block_invoke;
  block[3] = &unk_1E6DB90D0;
  block[4] = self;
  block[5] = &v9;
  unsigned int v8 = a3;
  block[6] = a4;
  dispatch_sync(stateQueue, block);
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __76__AVCAudioPowerSpectrumMeter_registerPowerSpectrumForCellularTapType_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) dispatchedRegisterPowerSpectrumForCellularTapType:*(unsigned int *)(a1 + 56) error:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setEnableAsyncTapStart:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__AVCAudioPowerSpectrumMeter_setEnableAsyncTapStart___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __53__AVCAudioPowerSpectrumMeter_setEnableAsyncTapStart___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 80) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)enableAsyncTapStart
{
  return self->_enableAsyncTapStart;
}

- (int64_t)streamTokenForCellularTapType:(unsigned int)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  int64_t v22 = &v21;
  uint64_t v23 = 0x3052000000;
  uint64_t v24 = __Block_byref_object_copy__37;
  __int16 v25 = __Block_byref_object_dispose__37;
  uint64_t v26 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__AVCAudioPowerSpectrumMeter_streamTokenForCellularTapType___block_invoke;
  block[3] = &unk_1E6DB6470;
  block[4] = self;
  void block[5] = &v21;
  unsigned int v20 = a3;
  dispatch_sync(stateQueue, block);
  uint64_t v6 = (void *)v22[5];
  if (v6) {
    int64_t v7 = [v6 longValue];
  }
  else {
    int64_t v7 = 0;
  }
  if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = v22[5];
        *(_DWORD *)buf = 136316418;
        uint64_t v28 = v9;
        __int16 v29 = 2080;
        __int16 v30 = "-[AVCAudioPowerSpectrumMeter streamTokenForCellularTapType:]";
        __int16 v31 = 1024;
        int v32 = 205;
        __int16 v33 = 2048;
        int64_t v34 = v7;
        __int16 v35 = 1024;
        *(_DWORD *)__int16 v36 = a3;
        *(_WORD *)&v36[4] = 2112;
        *(void *)&v36[6] = v11;
        char v12 = " [%s] %s:%d Querying token=%ld for tapType=%u, mappedNumber=%@";
        uint64_t v13 = v10;
        uint32_t v14 = 54;
LABEL_14:
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      unsigned int v8 = (__CFString *)[(AVCAudioPowerSpectrumMeter *)self performSelector:sel_logPrefix];
    }
    else {
      unsigned int v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint64_t v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = v22[5];
        *(_DWORD *)buf = 136316930;
        uint64_t v28 = v15;
        __int16 v29 = 2080;
        __int16 v30 = "-[AVCAudioPowerSpectrumMeter streamTokenForCellularTapType:]";
        __int16 v31 = 1024;
        int v32 = 205;
        __int16 v33 = 2112;
        int64_t v34 = (int64_t)v8;
        __int16 v35 = 2048;
        *(void *)__int16 v36 = self;
        *(_WORD *)&v36[8] = 2048;
        *(void *)&v36[10] = v7;
        __int16 v37 = 1024;
        unsigned int v38 = a3;
        __int16 v39 = 2112;
        uint64_t v40 = v17;
        char v12 = " [%s] %s:%d %@(%p) Querying token=%ld for tapType=%u, mappedNumber=%@";
        uint64_t v13 = v16;
        uint32_t v14 = 74;
        goto LABEL_14;
      }
    }
  }
  _Block_object_dispose(&v21, 8);
  return v7;
}

id __60__AVCAudioPowerSpectrumMeter_streamTokenForCellularTapType___block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48)));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)dispatchedUnregisterBasebandTokensForAudioTapType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_basebandAudioTapTypeToStreamTokenMap, "setObject:forKeyedSubscript:", 0, [NSNumber numberWithUnsignedInt:v3]);
  if (![(NSMutableDictionary *)self->_basebandAudioTapTypeToStreamTokenMap count]) {
    self->_uint64_t sessionToken = 0;
  }
}

- (BOOL)dispatchedUnregisterPowerSpectrumForCellularTapType:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  v40[1] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCAudioPowerSpectrumMeter-unregisterPowerSpectrumForCellularTapType");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    unsigned int v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 136316162;
      uint64_t v26 = v7;
      __int16 v27 = 2080;
      uint64_t v28 = "-[AVCAudioPowerSpectrumMeter dispatchedUnregisterPowerSpectrumForCellularTapType:error:]";
      __int16 v29 = 1024;
      int v30 = 230;
      __int16 v31 = 2048;
      int v32 = self;
      __int16 v33 = 1024;
      LODWORD(v34) = v5;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCAudioPowerSpectrumMeter-unregisterPowerSpectrumForCellularTapType (%p) type=%u", (uint8_t *)&v25, 0x2Cu);
    }
  }
  uint64_t v9 = +[AVCAudioPowerSpectrumMeter cellularTapTypeWithClientCellularTapType:v5];
  uint64_t v10 = [NSNumber numberWithUnsignedInt:v9];
  if (!+[VCHardwareSettings isCellularTappingSupported])
  {
    uint64_t v11 = (AVCAudioPowerSpectrumMeter *)[MEMORY[0x1E4F28C58] AVConferenceServiceError:32000 detailCode:0 description:@"Platform doesn't support callular tapping"];
    if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v13 = (__CFString *)[(AVCAudioPowerSpectrumMeter *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v13 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_20;
      }
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      unsigned int v20 = *MEMORY[0x1E4F47A50];
      BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v12) {
        goto LABEL_21;
      }
      int v25 = 136316674;
      uint64_t v26 = v19;
      __int16 v27 = 2080;
      uint64_t v28 = "-[AVCAudioPowerSpectrumMeter dispatchedUnregisterPowerSpectrumForCellularTapType:error:]";
      __int16 v29 = 1024;
      int v30 = 244;
      __int16 v31 = 2112;
      int v32 = (AVCAudioPowerSpectrumMeter *)v13;
      __int16 v33 = 2048;
      int64_t v34 = self;
      __int16 v35 = 2112;
      uint64_t v36 = v10;
      __int16 v37 = 2112;
      unsigned int v38 = v11;
      uint64_t v16 = " [%s] %s:%d %@(%p) Failed to unregister the power spectrum for tap type=%@. error=%@";
      goto LABEL_18;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    {
LABEL_20:
      LOBYTE(v12) = 0;
      goto LABEL_21;
    }
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    uint64_t v15 = *MEMORY[0x1E4F47A50];
    BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v12) {
      goto LABEL_21;
    }
    int v25 = 136316162;
    uint64_t v26 = v14;
    __int16 v27 = 2080;
    uint64_t v28 = "-[AVCAudioPowerSpectrumMeter dispatchedUnregisterPowerSpectrumForCellularTapType:error:]";
    __int16 v29 = 1024;
    int v30 = 244;
    __int16 v31 = 2112;
    int v32 = (AVCAudioPowerSpectrumMeter *)v10;
    __int16 v33 = 2112;
    int64_t v34 = v11;
    uint64_t v16 = " [%s] %s:%d Failed to unregister the power spectrum for tap type=%@. error=%@";
    goto LABEL_13;
  }
  __int16 v39 = @"vcAudioPowerSpectrumCellularTapType";
  v40[0] = v10;
  uint64_t v11 = (AVCAudioPowerSpectrumMeter *)objc_msgSend(-[AVConferenceXPCClient sendMessageSync:arguments:](self->_connection, "sendMessageSync:arguments:", "vcAudioPowerSpectrumUnregisterCellularTap", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1)), "objectForKeyedSubscript:", @"ERROR");
  if (!v11)
  {
    [(AVCAudioPowerSpectrumMeter *)self dispatchedUnregisterBasebandTokensForAudioTapType:v5];
    LOBYTE(v12) = 1;
    goto LABEL_21;
  }
  if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_20;
    }
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    uint64_t v15 = *MEMORY[0x1E4F47A50];
    BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v12) {
      goto LABEL_21;
    }
    int v25 = 136316162;
    uint64_t v26 = v22;
    __int16 v27 = 2080;
    uint64_t v28 = "-[AVCAudioPowerSpectrumMeter dispatchedUnregisterPowerSpectrumForCellularTapType:error:]";
    __int16 v29 = 1024;
    int v30 = 239;
    __int16 v31 = 2112;
    int v32 = (AVCAudioPowerSpectrumMeter *)v10;
    __int16 v33 = 2112;
    int64_t v34 = v11;
    uint64_t v16 = " [%s] %s:%d Failed to unregister the power spectrum for tap type=%@. error=%@";
LABEL_13:
    uint64_t v17 = v15;
    uint32_t v18 = 48;
LABEL_19:
    _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v25, v18);
    goto LABEL_20;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v21 = (__CFString *)[(AVCAudioPowerSpectrumMeter *)self performSelector:sel_logPrefix];
  }
  else {
    uint64_t v21 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
    goto LABEL_20;
  }
  uint64_t v23 = VRTraceErrorLogLevelToCSTR();
  unsigned int v20 = *MEMORY[0x1E4F47A50];
  BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
  if (v12)
  {
    int v25 = 136316674;
    uint64_t v26 = v23;
    __int16 v27 = 2080;
    uint64_t v28 = "-[AVCAudioPowerSpectrumMeter dispatchedUnregisterPowerSpectrumForCellularTapType:error:]";
    __int16 v29 = 1024;
    int v30 = 239;
    __int16 v31 = 2112;
    int v32 = (AVCAudioPowerSpectrumMeter *)v21;
    __int16 v33 = 2048;
    int64_t v34 = self;
    __int16 v35 = 2112;
    uint64_t v36 = v10;
    __int16 v37 = 2112;
    unsigned int v38 = v11;
    uint64_t v16 = " [%s] %s:%d %@(%p) Failed to unregister the power spectrum for tap type=%@. error=%@";
LABEL_18:
    uint64_t v17 = v20;
    uint32_t v18 = 68;
    goto LABEL_19;
  }
LABEL_21:
  if (a4) {
    *a4 = v11;
  }
  return v12;
}

- (BOOL)unregisterPowerSpectrumForCellularTapType:(unsigned int)a3 error:(id *)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__AVCAudioPowerSpectrumMeter_unregisterPowerSpectrumForCellularTapType_error___block_invoke;
  block[3] = &unk_1E6DB90D0;
  block[4] = self;
  void block[5] = &v9;
  unsigned int v8 = a3;
  void block[6] = a4;
  dispatch_sync(stateQueue, block);
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __78__AVCAudioPowerSpectrumMeter_unregisterPowerSpectrumForCellularTapType_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) dispatchedUnregisterPowerSpectrumForCellularTapType:*(unsigned int *)(a1 + 56) error:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)setupXPCConnection
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_alloc_init(AVConferenceXPCClient);
  self->_connection = v3;
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = (NSSet *)(id)objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, objc_opt_class(), 0);
    self->_allowListedXPCObjects = v10;
    if (v10)
    {
      [(AVCAudioPowerSpectrumMeter *)self registerBlocksForNotifications];
      LOBYTE(v11) = 1;
      return v11;
    }
    if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v11) {
          return v11;
        }
        -[AVCAudioPowerSpectrumMeter setupXPCConnection]();
      }
      goto LABEL_26;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v13 = (__CFString *)[(AVCAudioPowerSpectrumMeter *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v13 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *MEMORY[0x1E4F47A50];
      BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v11) {
        return v11;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v20 = v17;
      __int16 v21 = 2080;
      uint64_t v22 = "-[AVCAudioPowerSpectrumMeter setupXPCConnection]";
      __int16 v23 = 1024;
      int v24 = 269;
      __int16 v25 = 2112;
      uint64_t v26 = v13;
      __int16 v27 = 2048;
      uint64_t v28 = self;
      uint64_t v16 = " [%s] %s:%d %@(%p) Failed to allocate XPC object allow list";
LABEL_25:
      _os_log_error_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0x30u);
    }
  }
  else
  {
    if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v11) {
          return v11;
        }
        -[AVCAudioPowerSpectrumMeter setupXPCConnection]();
      }
      goto LABEL_26;
    }
    if (objc_opt_respondsToSelector()) {
      char v12 = (__CFString *)[(AVCAudioPowerSpectrumMeter *)self performSelector:sel_logPrefix];
    }
    else {
      char v12 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *MEMORY[0x1E4F47A50];
      BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v11) {
        return v11;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v20 = v14;
      __int16 v21 = 2080;
      uint64_t v22 = "-[AVCAudioPowerSpectrumMeter setupXPCConnection]";
      __int16 v23 = 1024;
      int v24 = 267;
      __int16 v25 = 2112;
      uint64_t v26 = v12;
      __int16 v27 = 2048;
      uint64_t v28 = self;
      uint64_t v16 = " [%s] %s:%d %@(%p) Failed to allocate XPC connection";
      goto LABEL_25;
    }
  }
LABEL_26:
  LOBYTE(v11) = 0;
  return v11;
}

- (void)cleanupXPCConnection
{
  [(AVCAudioPowerSpectrumMeter *)self deregisterBlocksForService];

  allowListedXPCObjects = self->_allowListedXPCObjects;
}

- (BOOL)storeDelegate:(id)a3 delegateQueue:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a4)
    {
      self->_delegateQueue = (OS_dispatch_queue *)a4;
      dispatch_retain((dispatch_object_t)a4);
      goto LABEL_5;
    }
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
    uint64_t v7 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.AVCAudioPowerSpectrumMeter.notificationQueue", 0, CustomRootQueue);
    self->_delegateQueue = v7;
    if (v7)
    {
LABEL_5:
      objc_storeWeak(&self->_delegate, a3);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = (objc_class *)objc_opt_class();
          BOOL v11 = NSStringFromClass(v10);
          char v12 = (objc_class *)objc_opt_class();
          *(_DWORD *)buf = 136316674;
          uint64_t v32 = v8;
          __int16 v33 = 2080;
          int64_t v34 = "-[AVCAudioPowerSpectrumMeter storeDelegate:delegateQueue:]";
          __int16 v35 = 1024;
          int v36 = 292;
          __int16 v37 = 2048;
          *(void *)unsigned int v38 = self;
          *(_WORD *)&v38[8] = 2112;
          *(void *)&v38[10] = v11;
          *(_WORD *)&v38[18] = 2048;
          *(void *)&v38[20] = a3;
          __int16 v39 = 2112;
          uint64_t v40 = NSStringFromClass(v12);
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d self=%p (%@), delegate=%p (%@)", buf, 0x44u);
        }
      }
      unsigned int outCount = 0;
      uint64_t v29 = protocol_copyMethodDescriptionList((Protocol *)&unk_1F3DF9328, 0, 1, &outCount);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        uint64_t v14 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v32 = v13;
          __int16 v33 = 2080;
          int64_t v34 = "-[AVCAudioPowerSpectrumMeter storeDelegate:delegateQueue:]";
          __int16 v35 = 1024;
          int v36 = 292;
          __int16 v37 = 1024;
          *(_DWORD *)unsigned int v38 = outCount;
          _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Protocol AVCAudioPowerSpectrumMeterDelegate contains %u optional methods.", buf, 0x22u);
        }
      }
      if (outCount)
      {
        unint64_t v15 = 0;
        p_name = &v29->name;
        do
        {
          uint64_t v17 = NSStringFromSelector(*p_name);
          NSSelectorFromString(v17);
          char v18 = objc_opt_respondsToSelector();
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v19 = VRTraceErrorLogLevelToCSTR();
            uint64_t v20 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316418;
              __int16 v21 = "does NOT respond";
              if (v18) {
                __int16 v21 = "responds";
              }
              uint64_t v32 = v19;
              __int16 v33 = 2080;
              int64_t v34 = "-[AVCAudioPowerSpectrumMeter storeDelegate:delegateQueue:]";
              __int16 v35 = 1024;
              int v36 = 292;
              __int16 v37 = 1024;
              *(_DWORD *)unsigned int v38 = v15;
              *(_WORD *)&v38[4] = 2080;
              *(void *)&v38[6] = v21;
              *(_WORD *)&v38[14] = 2112;
              *(void *)&v38[16] = v17;
              _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %u: Delegate %s to \"%@\"", buf, 0x36u);
            }
          }
          ++v15;
          p_name += 2;
        }
        while (v15 < outCount);
      }
      free(v29);
      return self->_delegate && self->_delegateQueue != 0;
    }
    if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        int v24 = (__CFString *)[(AVCAudioPowerSpectrumMeter *)self performSelector:sel_logPrefix];
      }
      else {
        int v24 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return self->_delegate && self->_delegateQueue != 0;
      }
      uint64_t v28 = VRTraceErrorLogLevelToCSTR();
      uint64_t v26 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return self->_delegate && self->_delegateQueue != 0;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v32 = v28;
      __int16 v33 = 2080;
      int64_t v34 = "-[AVCAudioPowerSpectrumMeter storeDelegate:delegateQueue:]";
      __int16 v35 = 1024;
      int v36 = 289;
      __int16 v37 = 2112;
      *(void *)unsigned int v38 = v24;
      *(_WORD *)&v38[8] = 2048;
      *(void *)&v38[10] = self;
      __int16 v27 = " [%s] %s:%d %@(%p) Failed to create the delegate queue";
      goto LABEL_44;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCAudioPowerSpectrumMeter storeDelegate:delegateQueue:]();
      }
    }
  }
  else
  {
    if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v23 = (__CFString *)[(AVCAudioPowerSpectrumMeter *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v23 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return self->_delegate && self->_delegateQueue != 0;
      }
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      uint64_t v26 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return self->_delegate && self->_delegateQueue != 0;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v32 = v25;
      __int16 v33 = 2080;
      int64_t v34 = "-[AVCAudioPowerSpectrumMeter storeDelegate:delegateQueue:]";
      __int16 v35 = 1024;
      int v36 = 283;
      __int16 v37 = 2112;
      *(void *)unsigned int v38 = v23;
      *(_WORD *)&v38[8] = 2048;
      *(void *)&v38[10] = self;
      __int16 v27 = " [%s] %s:%d %@(%p) The delegate is nil";
LABEL_44:
      _os_log_error_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_ERROR, v27, buf, 0x30u);
      return self->_delegate && self->_delegateQueue != 0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCAudioPowerSpectrumMeter storeDelegate:delegateQueue:]();
      }
    }
  }
  return self->_delegate && self->_delegateQueue != 0;
}

- (void)cleanupDelegate
{
  delegateQueue = self->_delegateQueue;
  if (delegateQueue) {
    dispatch_release(delegateQueue);
  }

  objc_storeWeak(&self->_delegate, 0);
}

- (BOOL)setupPowerSpectrumMeter
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v20[0] = @"vcAudioPowerSpectrumBinCount";
  v21[0] = [NSNumber numberWithUnsignedShort:self->_audioSpectrumBinCount];
  v20[1] = @"vcAudioPowerSpectrumRefreshRate";
  v21[1] = [NSNumber numberWithDouble:self->_audioSpectrumRefreshRate];
  uint64_t v3 = objc_msgSend(-[AVConferenceXPCClient sendMessageSync:arguments:](self->_connection, "sendMessageSync:arguments:", "vcAudioPowerSpectrumInitializeRemoteVideoForStreamToken", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v21, v20, 2)), "objectForKeyedSubscript:", @"ERROR");
  if (v3)
  {
    if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCAudioPowerSpectrumMeter setupPowerSpectrumMeter]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v5 = (__CFString *)[(AVCAudioPowerSpectrumMeter *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v8 = 136316418;
          uint64_t v9 = v6;
          __int16 v10 = 2080;
          BOOL v11 = "-[AVCAudioPowerSpectrumMeter setupPowerSpectrumMeter]";
          __int16 v12 = 1024;
          int v13 = 314;
          __int16 v14 = 2112;
          unint64_t v15 = v5;
          __int16 v16 = 2048;
          uint64_t v17 = self;
          __int16 v18 = 2112;
          uint64_t v19 = v3;
          _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate power spectrum error=%@", (uint8_t *)&v8, 0x3Au);
        }
      }
    }
  }
  return v3 == 0;
}

- (void)cleanupPowerSpectrumMeter
{
}

- (void)invalidateBasebandTokens
{
  v3[5] = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__AVCAudioPowerSpectrumMeter_invalidateBasebandTokens__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_sync(stateQueue, v3);
}

uint64_t __54__AVCAudioPowerSpectrumMeter_invalidateBasebandTokens__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 64) removeAllObjects];
  *(_DWORD *)(*(void *)(a1 + 32) + 44) = 0;
  return result;
}

- (void)registerBlocksForNotifications
{
  v6[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__AVCAudioPowerSpectrumMeter_registerBlocksForNotifications__block_invoke;
  v6[3] = &unk_1E6DB4338;
  v6[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcAudioPowerSpectrumServerDidDisconnect" block:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__AVCAudioPowerSpectrumMeter_registerBlocksForNotifications__block_invoke_2;
  v5[3] = &unk_1E6DB4338;
  v5[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcAudioPowerSpectrumServerDidReceiveSpectrum" block:v5 queue:0 eventLogLevel:8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__AVCAudioPowerSpectrumMeter_registerBlocksForNotifications__block_invoke_2_130;
  v4[3] = &unk_1E6DB4338;
  v4[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcAudioPowerSpectrumServerSpectrumInterrupted" block:v4];
}

void __60__AVCAudioPowerSpectrumMeter_registerBlocksForNotifications__block_invoke(uint64_t a1, void *a2)
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
        uint64_t v7 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        *(_DWORD *)buf = 136315650;
        uint64_t v17 = v6;
        __int16 v18 = 2080;
        uint64_t v19 = "-[AVCAudioPowerSpectrumMeter registerBlocksForNotifications]_block_invoke";
        __int16 v20 = 1024;
        int v21 = 343;
        int v8 = " [%s] %s:%d received callback for serverDidDisconnect";
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
        uint64_t v19 = "-[AVCAudioPowerSpectrumMeter registerBlocksForNotifications]_block_invoke";
        __int16 v20 = 1024;
        int v21 = 343;
        __int16 v22 = 2112;
        __int16 v23 = v5;
        __int16 v24 = 2048;
        uint64_t v25 = v4;
        int v8 = " [%s] %s:%d %@(%p) received callback for serverDidDisconnect";
        uint64_t v9 = v12;
        uint32_t v10 = 48;
      }
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_14:
      [v4 invalidateBasebandTokens];
      uint64_t v13 = [v4 delegate];
      if (objc_opt_respondsToSelector())
      {
        __int16 v14 = [v4 delegateQueue];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __60__AVCAudioPowerSpectrumMeter_registerBlocksForNotifications__block_invoke_120;
        v15[3] = &unk_1E6DB3E40;
        v15[4] = v13;
        v15[5] = v4;
        dispatch_async(v14, v15);
      }
    }
  }
}

uint64_t __60__AVCAudioPowerSpectrumMeter_registerBlocksForNotifications__block_invoke_120(uint64_t a1)
{
  return [*(id *)(a1 + 32) meterServerDidDisconnect:*(void *)(a1 + 40)];
}

void __60__AVCAudioPowerSpectrumMeter_registerBlocksForNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) strong];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    if (![a2 objectForKeyedSubscript:@"SERVERDIED"])
    {
      v12[0] = 0;
      uint64_t v5 = [a2 objectForKeyedSubscript:@"vcAudioPowerSpectrumRemoteSpectrum"];
      uint64_t v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v4[6] fromData:v5 error:v12];
      if (v6) {
        BOOL v7 = v12[0] == 0;
      }
      else {
        BOOL v7 = 0;
      }
      if (!v7 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __60__AVCAudioPowerSpectrumMeter_registerBlocksForNotifications__block_invoke_2_cold_1(v8, v12, v9);
        }
      }
      [v4 delegate];
      if (objc_opt_respondsToSelector())
      {
        uint32_t v10 = [v4 delegateQueue];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __60__AVCAudioPowerSpectrumMeter_registerBlocksForNotifications__block_invoke_128;
        v11[3] = &unk_1E6DB3E40;
        v11[4] = v4;
        v11[5] = v6;
        dispatch_async(v10, v11);
      }
    }
  }
}

uint64_t __60__AVCAudioPowerSpectrumMeter_registerBlocksForNotifications__block_invoke_128(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 audioPowerSpectrumMeter:v3 didUpdateAudioPowerSpectrums:v4];
}

void __60__AVCAudioPowerSpectrumMeter_registerBlocksForNotifications__block_invoke_2_130(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) strong];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    if (![a2 objectForKeyedSubscript:@"SERVERDIED"])
    {
      if (objc_opt_class() == v4)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_14;
        }
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        BOOL v7 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        *(_DWORD *)buf = 136315650;
        uint64_t v16 = v6;
        __int16 v17 = 2080;
        __int16 v18 = "-[AVCAudioPowerSpectrumMeter registerBlocksForNotifications]_block_invoke_2";
        __int16 v19 = 1024;
        int v20 = 381;
        uint64_t v8 = " [%s] %s:%d received callback for serverSpectrumInterrupted";
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
        uint64_t v16 = v11;
        __int16 v17 = 2080;
        __int16 v18 = "-[AVCAudioPowerSpectrumMeter registerBlocksForNotifications]_block_invoke";
        __int16 v19 = 1024;
        int v20 = 381;
        __int16 v21 = 2112;
        __int16 v22 = v5;
        __int16 v23 = 2048;
        __int16 v24 = v4;
        uint64_t v8 = " [%s] %s:%d %@(%p) received callback for serverSpectrumInterrupted";
        uint64_t v9 = v12;
        uint32_t v10 = 48;
      }
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_14:
      [v4 delegate];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v13 = [v4 delegateQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __60__AVCAudioPowerSpectrumMeter_registerBlocksForNotifications__block_invoke_132;
        block[3] = &unk_1E6DB3DC8;
        block[4] = v4;
        dispatch_async(v13, block);
      }
    }
  }
}

uint64_t __60__AVCAudioPowerSpectrumMeter_registerBlocksForNotifications__block_invoke_132(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 meterSpectrumCaptureWasInterrupted:v3];
}

- (void)deregisterBlocksForService
{
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcAudioPowerSpectrumServerDidDisconnect"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcAudioPowerSpectrumServerDidReceiveSpectrum"];
  connection = self->_connection;

  [(AVConferenceXPCClient *)connection deregisterFromService:"vcAudioPowerSpectrumServerSpectrumInterrupted"];
}

- (void)audioPowerSpectrumMeter:(id)a3 didUpdateAudioPowerSpectrums:(id)a4
{
  void block[6] = *MEMORY[0x1E4F143B8];
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__AVCAudioPowerSpectrumMeter_audioPowerSpectrumMeter_didUpdateAudioPowerSpectrums___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a4;
  dispatch_async(delegateQueue, block);
}

uint64_t __83__AVCAudioPowerSpectrumMeter_audioPowerSpectrumMeter_didUpdateAudioPowerSpectrums___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 audioPowerSpectrumMeter:v3 didUpdateAudioPowerSpectrums:v4];
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (unsigned)sessionToken
{
  return self->_sessionToken;
}

- (void)initWithConfig:delegate:queue:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate basebandAudioTapTypeToStreamTokenMap", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:delegate:queue:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate stateQueue", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:delegate:queue:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initialize the power spectrum meter", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:delegate:queue:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup XPC", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:delegate:queue:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup delegate queue", v2, v3, v4, v5, v6);
}

- (void)dispatchedProcessBasebandRegistrationResult:forTapType:withError:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to receive direction token from server for tapType=%u", v2, v3, v4, 126);
}

- (void)dispatchedProcessBasebandRegistrationResult:forTapType:withError:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to receive sessionToken from server for tapType=%u", v2, v3, v4, 132);
}

- (void)setupXPCConnection
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate XPC object allow list", v2, v3, v4, v5, v6);
}

- (void)storeDelegate:delegateQueue:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d The delegate is nil", v2, v3, v4, v5, v6);
}

- (void)storeDelegate:delegateQueue:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create the delegate queue", v2, v3, v4, v5, v6);
}

- (void)setupPowerSpectrumMeter
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate power spectrum error=%@");
}

void __60__AVCAudioPowerSpectrumMeter_registerBlocksForNotifications__block_invoke_2_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315906;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(void *)&v3[14] = "-[AVCAudioPowerSpectrumMeter registerBlocksForNotifications]_block_invoke_2";
  *(_WORD *)&v3[22] = 1024;
  LODWORD(v4) = 366;
  WORD2(v4) = 2112;
  *(void *)((char *)&v4 + 6) = *a2;
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, (uint64_t)a2, a3, " [%s] %s:%d Decoding: error %@.", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], v4, *MEMORY[0x1E4F143B8]);
}

@end