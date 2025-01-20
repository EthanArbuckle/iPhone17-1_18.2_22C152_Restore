@interface VCAudioPowerSpectrumManager
+ (id)sharedInstance;
- (BOOL)dispatchedUnregisterListenerWithCellularTapType:(id)a3 powerSpectrumMeter:(id)a4 error:(id *)a5;
- (BOOL)registerListenerWithCellularTapType:(id)a3 clientProcessId:(id)a4 enableAsyncTapStart:(BOOL)a5 powerSpectrumMeter:(id)a6 powerSpectrumMeterKey:(id)a7 resultDictionary:(id *)a8 error:(id *)a9;
- (BOOL)registerListenerWithStreamToken:(id)a3 powerSpectrumKey:(id)a4 powerSpectrumMeter:(id)a5 error:(id *)a6;
- (NSMutableArray)meters;
- (NSMutableDictionary)sources;
- (VCAudioPowerSpectrumManager)init;
- (id)newPowerSpectrumMeterWithBinCount:(unsigned __int16)a3 refreshRate:(double)a4 delegate:(id)a5 error:(id *)a6;
- (id)powerSpectrumMetersForCellularTapType:(id)a3;
- (id)registerStreamTokenForCellularTapType:(id)a3 clientProcessId:(int)a4 enableAsyncTapStart:(BOOL)a5 error:(id *)a6;
- (id)serviceHandlerPowerMeterInitializeWithArguments:(id)a3 error:(id *)a4;
- (id)serviceHandlerPowerMeterTerminateWithArguments:(id)a3 error:(id *)a4;
- (id)serviceHandlerRegisterCellularTapWithArguments:(id)a3 error:(id *)a4;
- (id)serviceHandlerRegisterListenerWithArguments:(id)a3 error:(id *)a4;
- (id)serviceHandlerUnregisterCellularTagWithArguments:(id)a3 error:(id *)a4;
- (id)serviceHandlerUnregisterListenerWithArguments:(id)a3 error:(id *)a4;
- (void)audioPowerSpectrumMeter:(id)a3 didUpdateAudioPowerSpectrums:(id)a4;
- (void)dealloc;
- (void)deregisterBlocksForService;
- (void)dispatchedCleanUpCellularAudioTap;
- (void)dispatchedCleanUpPowerSpectrumSetForCellularTapType:(id)a3;
- (void)init;
- (void)registerAudioPowerMeterSource:(id)a3;
- (void)registerBlocksForService;
- (void)serverDidDie;
- (void)terminatePowerSpectrumMeter:(id)a3;
- (void)unregisterAudioPowerSpectrumSourceForStreamToken:(id)a3;
@end

@implementation VCAudioPowerSpectrumManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_16);
  }
  return (id)sharedInstance__vcAudioPowerSpectrumManager;
}

void __45__VCAudioPowerSpectrumManager_sharedInstance__block_invoke()
{
  if (!sharedInstance__vcAudioPowerSpectrumManager) {
    sharedInstance__vcAudioPowerSpectrumManager = objc_alloc_init(VCAudioPowerSpectrumManager);
  }
}

- (VCAudioPowerSpectrumManager)init
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)VCAudioPowerSpectrumManager;
  v2 = [(VCAudioPowerSpectrumManager *)&v13 init];
  if (v2)
  {
    v2->_meters = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v2->_sources = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_connection = objc_alloc_init(AVConferenceXPCClient);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v2->_xpcCommandQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConferenceVCAudioPowerSpectrumManager.XPCCommandQueue", 0, CustomRootQueue);
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_cellularTapTypeToStreamTokenMap = v4;
    if (v4)
    {
      v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v2->_powerSpectrumMetersForCellularTapType = v5;
      if (v5) {
        return v2;
      }
      if ((VCAudioPowerSpectrumManager *)objc_opt_class() == v2)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCAudioPowerSpectrumManager init]();
          }
        }
        goto LABEL_24;
      }
      if (objc_opt_respondsToSelector()) {
        v8 = (__CFString *)[(VCAudioPowerSpectrumManager *)v2 performSelector:sel_logPrefix];
      }
      else {
        v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (uint64_t v12 = VRTraceErrorLogLevelToCSTR(),
            v10 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
      {
LABEL_24:

        return 0;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v15 = v12;
      __int16 v16 = 2080;
      v17 = "-[VCAudioPowerSpectrumManager init]";
      __int16 v18 = 1024;
      int v19 = 78;
      __int16 v20 = 2112;
      v21 = v8;
      __int16 v22 = 2048;
      v23 = v2;
      v11 = " [%s] %s:%d %@(%p) Failed to allocate the power spectrum meter dictionary";
    }
    else
    {
      if ((VCAudioPowerSpectrumManager *)objc_opt_class() == v2)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCAudioPowerSpectrumManager init]();
          }
        }
        goto LABEL_24;
      }
      if (objc_opt_respondsToSelector()) {
        v7 = (__CFString *)[(VCAudioPowerSpectrumManager *)v2 performSelector:sel_logPrefix];
      }
      else {
        v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_24;
      }
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v15 = v9;
      __int16 v16 = 2080;
      v17 = "-[VCAudioPowerSpectrumManager init]";
      __int16 v18 = 1024;
      int v19 = 75;
      __int16 v20 = 2112;
      v21 = v7;
      __int16 v22 = 2048;
      v23 = v2;
      v11 = " [%s] %s:%d %@(%p) Failed to allocate the cellular tap type to stream token map";
    }
    _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0x30u);
    goto LABEL_24;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  dispatch_release((dispatch_object_t)self->_xpcCommandQueue);
  [(VCAudioPowerSpectrumManager *)self deregisterBlocksForService];

  v3.receiver = self;
  v3.super_class = (Class)VCAudioPowerSpectrumManager;
  [(VCAudioPowerSpectrumManager *)&v3 dealloc];
}

- (void)registerAudioPowerMeterSource:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__VCAudioPowerSpectrumManager_registerAudioPowerMeterSource___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  block[5] = a3;
  dispatch_async(xpcCommandQueue, block);
}

void __61__VCAudioPowerSpectrumManager_registerAudioPowerMeterSource___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = [*(id *)(a1 + 40) streamToken];
        *(_DWORD *)v21 = 136315906;
        *(void *)&v21[4] = v3;
        *(_WORD *)&v21[12] = 2080;
        *(void *)&v21[14] = "-[VCAudioPowerSpectrumManager registerAudioPowerMeterSource:]_block_invoke";
        *(_WORD *)&v21[22] = 1024;
        LODWORD(v22) = 103;
        WORD2(v22) = 2048;
        *(void *)((char *)&v22 + 6) = v5;
        v6 = " [%s] %s:%d source.streamToken=%ld";
        v7 = v4;
        uint32_t v8 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, v21, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        uint64_t v12 = [*(id *)(a1 + 40) streamToken];
        *(_DWORD *)v21 = 136316418;
        *(void *)&v21[4] = v9;
        *(_WORD *)&v21[12] = 2080;
        *(void *)&v21[14] = "-[VCAudioPowerSpectrumManager registerAudioPowerMeterSource:]_block_invoke";
        *(_WORD *)&v21[22] = 1024;
        LODWORD(v22) = 103;
        WORD2(v22) = 2112;
        *(void *)((char *)&v22 + 6) = v2;
        HIWORD(v22) = 2048;
        uint64_t v23 = v11;
        LOWORD(v24) = 2048;
        *(void *)((char *)&v24 + 2) = v12;
        v6 = " [%s] %s:%d %@(%p) source.streamToken=%ld";
        v7 = v10;
        uint32_t v8 = 58;
        goto LABEL_11;
      }
    }
  }
  objc_super v13 = (id *)(a1 + 40);
  if (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "streamToken", *(_OWORD *)v21, *(void *)&v21[16], v22, v23, v24))))
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        __int16 v16 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __61__VCAudioPowerSpectrumManager_registerAudioPowerMeterSource___block_invoke_cold_1(v15, v13, v16);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v14 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        v14 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        __int16 v18 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = *(void *)(a1 + 32);
          uint64_t v20 = [*(id *)(a1 + 40) streamToken];
          *(_DWORD *)v21 = 136316418;
          *(void *)&v21[4] = v17;
          *(_WORD *)&v21[12] = 2080;
          *(void *)&v21[14] = "-[VCAudioPowerSpectrumManager registerAudioPowerMeterSource:]_block_invoke";
          *(_WORD *)&v21[22] = 1024;
          LODWORD(v22) = 108;
          WORD2(v22) = 2112;
          *(void *)((char *)&v22 + 6) = v14;
          HIWORD(v22) = 2048;
          uint64_t v23 = v19;
          LOWORD(v24) = 2048;
          *(void *)((char *)&v24 + 2) = v20;
          _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) source[streamToken=%ld] already existed", v21, 0x3Au);
        }
      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", *(void *)(a1 + 40), objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "streamToken")));
  }
}

- (void)unregisterAudioPowerSpectrumSourceForStreamToken:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__VCAudioPowerSpectrumManager_unregisterAudioPowerSpectrumSourceForStreamToken___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  block[5] = a3;
  dispatch_async(xpcCommandQueue, block);
}

uint64_t __80__VCAudioPowerSpectrumManager_unregisterAudioPowerSpectrumSourceForStreamToken___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (id)newPowerSpectrumMeterWithBinCount:(unsigned __int16)a3 refreshRate:(double)a4 delegate:(id)a5 error:(id *)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint32_t v8 = [[VCAudioPowerSpectrumMeter alloc] initWithBinCount:a3 refreshRate:a5 delegate:a4];
  uint64_t v9 = (VCAudioPowerSpectrumManager *)objc_opt_class();
  if (!v8)
  {
    if (v9 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          -[VCAudioPowerSpectrumManager newPowerSpectrumMeterWithBinCount:refreshRate:delegate:error:]();
          if (!a6) {
            return v8;
          }
          goto LABEL_26;
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v19 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v19 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long v22 = 136316162;
          *(void *)&v22[4] = v20;
          *(_WORD *)&v22[12] = 2080;
          *(void *)&v22[14] = "-[VCAudioPowerSpectrumManager newPowerSpectrumMeterWithBinCount:refreshRate:delegate:error:]";
          *(_WORD *)&v22[22] = 1024;
          LODWORD(v23) = 122;
          WORD2(v23) = 2112;
          *(void *)((char *)&v23 + 6) = v19;
          HIWORD(v23) = 2048;
          long long v24 = self;
          _os_log_error_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) VCPowerSpectrumMeter failed to allocate", v22, 0x30u);
          if (!a6) {
            return v8;
          }
          goto LABEL_26;
        }
      }
    }
    if (!a6) {
      return v8;
    }
LABEL_26:
    *a6 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.AVConference" code:-4 userInfo:0];
    return v8;
  }
  if (v9 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_13;
    }
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    *(_DWORD *)long long v22 = 136315906;
    *(void *)&v22[4] = v11;
    *(_WORD *)&v22[12] = 2080;
    *(void *)&v22[14] = "-[VCAudioPowerSpectrumManager newPowerSpectrumMeterWithBinCount:refreshRate:delegate:error:]";
    *(_WORD *)&v22[22] = 1024;
    LODWORD(v23) = 124;
    WORD2(v23) = 2048;
    *(void *)((char *)&v23 + 6) = v8;
    objc_super v13 = " [%s] %s:%d VCPowerSpectrumMeter[%p] created";
    v14 = v12;
    uint32_t v15 = 38;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v10 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
    }
    else {
      v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_13;
    }
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    uint64_t v17 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    *(_DWORD *)long long v22 = 136316418;
    *(void *)&v22[4] = v16;
    *(_WORD *)&v22[12] = 2080;
    *(void *)&v22[14] = "-[VCAudioPowerSpectrumManager newPowerSpectrumMeterWithBinCount:refreshRate:delegate:error:]";
    *(_WORD *)&v22[22] = 1024;
    LODWORD(v23) = 124;
    WORD2(v23) = 2112;
    *(void *)((char *)&v23 + 6) = v10;
    HIWORD(v23) = 2048;
    long long v24 = self;
    LOWORD(v25) = 2048;
    *(void *)((char *)&v25 + 2) = v8;
    objc_super v13 = " [%s] %s:%d %@(%p) VCPowerSpectrumMeter[%p] created";
    v14 = v17;
    uint32_t v15 = 58;
  }
  _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, v22, v15);
LABEL_13:
  -[NSMutableArray addObject:](self->_meters, "addObject:", v8, *(_OWORD *)v22, *(void *)&v22[16], v23, v24, v25);
  return v8;
}

- (void)terminatePowerSpectrumMeter:(id)a3
{
  [a3 unregisterAllStreams];
  meters = self->_meters;

  [(NSMutableArray *)meters removeObject:a3];
}

- (BOOL)registerListenerWithStreamToken:(id)a3 powerSpectrumKey:(id)a4 powerSpectrumMeter:(id)a5 error:(id *)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_sources, "objectForKeyedSubscript:");
  if (!v11)
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          -[VCAudioPowerSpectrumManager registerListenerWithStreamToken:powerSpectrumKey:powerSpectrumMeter:error:]();
          if (!a6) {
            return v11 != 0;
          }
          goto LABEL_25;
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v21 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
      }
      else {
        v21 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v22 = VRTraceErrorLogLevelToCSTR();
        long long v23 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v24 = 136316418;
          uint64_t v25 = v22;
          __int16 v26 = 2080;
          v27 = "-[VCAudioPowerSpectrumManager registerListenerWithStreamToken:powerSpectrumKey:powerSpectrumMeter:error:]";
          __int16 v28 = 1024;
          int v29 = 144;
          __int16 v30 = 2112;
          id v31 = v21;
          __int16 v32 = 2048;
          v33 = self;
          __int16 v34 = 2112;
          id v35 = a3;
          _os_log_error_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) audioSpectrumRegisterListener: error no powerSpectrumSource for streamToken=%@", (uint8_t *)&v24, 0x3Au);
          if (!a6) {
            return v11 != 0;
          }
          goto LABEL_25;
        }
      }
    }
    if (!a6) {
      return v11 != 0;
    }
LABEL_25:
    *a6 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.AVConference" code:-5 userInfo:0];
    return v11 != 0;
  }
  [a5 registerNewAudioPowerSpectrumForStreamToken:a3 powerSpectrumKey:a4 spectrumSource:v11];
  if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 136316162;
        uint64_t v25 = v13;
        __int16 v26 = 2080;
        v27 = "-[VCAudioPowerSpectrumManager registerListenerWithStreamToken:powerSpectrumKey:powerSpectrumMeter:error:]";
        __int16 v28 = 1024;
        int v29 = 148;
        __int16 v30 = 2112;
        id v31 = a5;
        __int16 v32 = 2112;
        v33 = a3;
        uint32_t v15 = " [%s] %s:%d powerSpectrumMeter=%@ registered listener for streamToken=%@";
        uint64_t v16 = v14;
        uint32_t v17 = 48;
LABEL_12:
        _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v24, v17);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v12 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v12 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      uint64_t v19 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 136316674;
        uint64_t v25 = v18;
        __int16 v26 = 2080;
        v27 = "-[VCAudioPowerSpectrumManager registerListenerWithStreamToken:powerSpectrumKey:powerSpectrumMeter:error:]";
        __int16 v28 = 1024;
        int v29 = 148;
        __int16 v30 = 2112;
        id v31 = v12;
        __int16 v32 = 2048;
        v33 = self;
        __int16 v34 = 2112;
        id v35 = a5;
        __int16 v36 = 2112;
        id v37 = a3;
        uint32_t v15 = " [%s] %s:%d %@(%p) powerSpectrumMeter=%@ registered listener for streamToken=%@";
        uint64_t v16 = v19;
        uint32_t v17 = 68;
        goto LABEL_12;
      }
    }
  }
  return v11 != 0;
}

- (id)registerStreamTokenForCellularTapType:(id)a3 clientProcessId:(int)a4 enableAsyncTapStart:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_cellularTapTypeToStreamTokenMap, "objectForKeyedSubscript:");
  if (!v11)
  {
    uint64_t v12 = [a3 unsignedIntValue];
    if (v12 >= 2)
    {
      uint64_t v17 = -2142765055;
      if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            -[VCAudioPowerSpectrumManager registerStreamTokenForCellularTapType:clientProcessId:enableAsyncTapStart:error:]();
            if (!a6) {
              return 0;
            }
            goto LABEL_41;
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v18 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v18 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v26 = VRTraceErrorLogLevelToCSTR();
          v27 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            int v33 = 136316418;
            uint64_t v34 = v26;
            __int16 v35 = 2080;
            __int16 v36 = "-[VCAudioPowerSpectrumManager registerStreamTokenForCellularTapType:clientProcessId:enableAsyncTapStart:error:]";
            __int16 v37 = 1024;
            int v38 = 173;
            __int16 v39 = 2112;
            id v40 = v18;
            __int16 v41 = 2048;
            v42 = self;
            __int16 v43 = 2112;
            id v44 = a3;
            _os_log_error_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Invalid tapType=%@", (uint8_t *)&v33, 0x3Au);
            if (!a6) {
              return 0;
            }
            goto LABEL_41;
          }
        }
      }
      goto LABEL_40;
    }
    uint64_t v13 = v12;
    if (self->_cellularAudioTap
      || (v14 = [[VCCellularAudioTap alloc] initWithProcessId:v8 delegate:self delegateQueue:self->_xpcCommandQueue], (self->_cellularAudioTap = v14) != 0))
    {
      unsigned int ID = VCUniqueIDGenerator_GenerateID();
      if ([(VCCellularAudioTap *)self->_cellularAudioTap addAudioTapForStreamToken:ID tapType:v13 enableAsyncTapStart:v7 error:a6])
      {
        uint64_t v11 = (void *)[NSNumber numberWithInteger:ID];
        [(NSMutableDictionary *)self->_cellularTapTypeToStreamTokenMap setObject:v11 forKeyedSubscript:a3];
        return v11;
      }
      if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          return 0;
        }
        uint64_t v21 = VRTraceErrorLogLevelToCSTR();
        uint64_t v22 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          return 0;
        }
        int v33 = 136316162;
        uint64_t v34 = v21;
        __int16 v35 = 2080;
        __int16 v36 = "-[VCAudioPowerSpectrumManager registerStreamTokenForCellularTapType:clientProcessId:enableAsyncTapStart:error:]";
        __int16 v37 = 1024;
        int v38 = 183;
        __int16 v39 = 2112;
        id v40 = a3;
        __int16 v41 = 1024;
        LODWORD(v42) = ID;
        long long v23 = " [%s] %s:%d Failed to create an app tap for tapType=%@ with streamToken=%u";
        int v24 = v22;
        uint32_t v25 = 44;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v19 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v19 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          return 0;
        }
        uint64_t v28 = VRTraceErrorLogLevelToCSTR();
        int v29 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          return 0;
        }
        int v33 = 136316674;
        uint64_t v34 = v28;
        __int16 v35 = 2080;
        __int16 v36 = "-[VCAudioPowerSpectrumManager registerStreamTokenForCellularTapType:clientProcessId:enableAsyncTapStart:error:]";
        __int16 v37 = 1024;
        int v38 = 183;
        __int16 v39 = 2112;
        id v40 = v19;
        __int16 v41 = 2048;
        v42 = self;
        __int16 v43 = 2112;
        id v44 = a3;
        __int16 v45 = 1024;
        unsigned int v46 = ID;
        long long v23 = " [%s] %s:%d %@(%p) Failed to create an app tap for tapType=%@ with streamToken=%u";
        int v24 = v29;
        uint32_t v25 = 64;
      }
      _os_log_error_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v33, v25);
      return 0;
    }
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      uint64_t v17 = -2142765054;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_40;
      }
      VRTraceErrorLogLevelToCSTR();
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_40;
      }
      -[VCAudioPowerSpectrumManager registerStreamTokenForCellularTapType:clientProcessId:enableAsyncTapStart:error:]();
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v20 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v20 = &stru_1F3D3E450;
      }
      uint64_t v17 = -2142765054;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (uint64_t v30 = VRTraceErrorLogLevelToCSTR(),
            id v31 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
      {
LABEL_40:
        if (!a6) {
          return 0;
        }
LABEL_41:
        __int16 v32 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.AVConference" code:v17 userInfo:0];
        uint64_t v11 = 0;
        *a6 = v32;
        return v11;
      }
      int v33 = 136316418;
      uint64_t v34 = v30;
      __int16 v35 = 2080;
      __int16 v36 = "-[VCAudioPowerSpectrumManager registerStreamTokenForCellularTapType:clientProcessId:enableAsyncTapStart:error:]";
      __int16 v37 = 1024;
      int v38 = 178;
      __int16 v39 = 2112;
      id v40 = v20;
      __int16 v41 = 2048;
      v42 = self;
      __int16 v43 = 2112;
      id v44 = a3;
      _os_log_error_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate the audio tap for tapType=%@", (uint8_t *)&v33, 0x3Au);
    }
    uint64_t v17 = -2142765054;
    if (!a6) {
      return 0;
    }
    goto LABEL_41;
  }
  return v11;
}

- (id)powerSpectrumMetersForCellularTapType:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_powerSpectrumMetersForCellularTapType, "objectForKeyedSubscript:");
  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
    if (v6)
    {
      uint64_t v5 = (void *)v6;
      [(NSMutableDictionary *)self->_powerSpectrumMetersForCellularTapType setObject:v6 forKeyedSubscript:a3];
    }
    else
    {
      if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCAudioPowerSpectrumManager powerSpectrumMetersForCellularTapType:]();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v8 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v8 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v9 = VRTraceErrorLogLevelToCSTR();
          v10 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            int v11 = 136316418;
            uint64_t v12 = v9;
            __int16 v13 = 2080;
            v14 = "-[VCAudioPowerSpectrumManager powerSpectrumMetersForCellularTapType:]";
            __int16 v15 = 1024;
            int v16 = 199;
            __int16 v17 = 2112;
            uint64_t v18 = v8;
            __int16 v19 = 2048;
            uint64_t v20 = self;
            __int16 v21 = 2112;
            id v22 = a3;
            _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed allocate the client set for tapType=%@", (uint8_t *)&v11, 0x3Au);
          }
        }
      }
      return 0;
    }
  }
  return v5;
}

- (void)dispatchedCleanUpCellularAudioTap
{
  self->_cellularAudioTap = 0;
}

- (void)dispatchedCleanUpPowerSpectrumSetForCellularTapType:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcCommandQueue);
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_powerSpectrumMetersForCellularTapType objectForKeyedSubscript:a3];
  if (v5 && ![v5 count])
  {
    [(NSMutableDictionary *)self->_powerSpectrumMetersForCellularTapType setObject:0 forKeyedSubscript:a3];
    uint64_t v6 = (void *)[(NSMutableDictionary *)self->_cellularTapTypeToStreamTokenMap objectForKeyedSubscript:a3];
    if (v6)
    {
      -[VCCellularAudioTap removeAudioTapForStreamToken:error:](self->_cellularAudioTap, "removeAudioTapForStreamToken:error:", [v6 unsignedIntValue], 0);
      [(NSMutableDictionary *)self->_cellularTapTypeToStreamTokenMap setObject:0 forKeyedSubscript:a3];
      if (![(NSMutableDictionary *)self->_cellularTapTypeToStreamTokenMap count])
      {
        [(VCAudioPowerSpectrumManager *)self dispatchedCleanUpCellularAudioTap];
      }
    }
    else if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioPowerSpectrumManager dispatchedCleanUpPowerSpectrumSetForCellularTapType:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        BOOL v7 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
      }
      else {
        BOOL v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v10 = 136316418;
          uint64_t v11 = v8;
          __int16 v12 = 2080;
          __int16 v13 = "-[VCAudioPowerSpectrumManager dispatchedCleanUpPowerSpectrumSetForCellularTapType:]";
          __int16 v14 = 1024;
          int v15 = 225;
          __int16 v16 = 2112;
          __int16 v17 = v7;
          __int16 v18 = 2048;
          __int16 v19 = self;
          __int16 v20 = 2112;
          id v21 = a3;
          _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Stream token not found for tapType=%@", (uint8_t *)&v10, 0x3Au);
        }
      }
    }
  }
}

- (BOOL)registerListenerWithCellularTapType:(id)a3 clientProcessId:(id)a4 enableAsyncTapStart:(BOOL)a5 powerSpectrumMeter:(id)a6 powerSpectrumMeterKey:(id)a7 resultDictionary:(id *)a8 error:(id *)a9
{
  BOOL v12 = a5;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
  if (!a3)
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      uint64_t v27 = -2142765055;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          -[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:enableAsyncTapStart:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:]();
          if (!a9) {
            goto LABEL_99;
          }
          goto LABEL_98;
        }
      }
      goto LABEL_97;
    }
    if (objc_opt_respondsToSelector()) {
      int v24 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
    }
    else {
      int v24 = &stru_1F3D3E450;
    }
    uint64_t v27 = -2142765055;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v33 = VRTraceErrorLogLevelToCSTR();
      uint64_t v34 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v51 = v33;
        __int16 v52 = 2080;
        v53 = "-[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:enableAsyncTapStart:powe"
              "rSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:]";
        __int16 v54 = 1024;
        int v55 = 264;
        __int16 v56 = 2112;
        v57 = v24;
        __int16 v58 = 2048;
        v59 = self;
        __int16 v35 = " [%s] %s:%d %@(%p) Missing tapType";
        __int16 v36 = v34;
        uint32_t v37 = 48;
        goto LABEL_87;
      }
    }
    goto LABEL_97;
  }
  if (!a4)
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      uint64_t v27 = -2142765055;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          -[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:enableAsyncTapStart:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:]();
          if (!a9) {
            goto LABEL_99;
          }
          goto LABEL_98;
        }
      }
      goto LABEL_97;
    }
    if (objc_opt_respondsToSelector()) {
      uint32_t v25 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
    }
    else {
      uint32_t v25 = &stru_1F3D3E450;
    }
    uint64_t v27 = -2142765055;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_97;
    }
    uint64_t v38 = VRTraceErrorLogLevelToCSTR();
    __int16 v39 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_97;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v51 = v38;
    __int16 v52 = 2080;
    v53 = "-[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:enableAsyncTapStart:powerSpe"
          "ctrumMeter:powerSpectrumMeterKey:resultDictionary:error:]";
    __int16 v54 = 1024;
    int v55 = 265;
    __int16 v56 = 2112;
    v57 = v25;
    __int16 v58 = 2048;
    v59 = self;
    __int16 v60 = 2112;
    id v61 = a3;
    __int16 v35 = " [%s] %s:%d %@(%p) Process id is missing tapType=%@";
LABEL_86:
    __int16 v36 = v39;
    uint32_t v37 = 58;
LABEL_87:
    _os_log_error_impl(&dword_1E1EA4000, v36, OS_LOG_TYPE_ERROR, v35, buf, v37);
    if (!a9) {
      goto LABEL_99;
    }
    goto LABEL_98;
  }
  if (!a6)
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      uint64_t v27 = -2142765055;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          -[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:enableAsyncTapStart:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:]();
          if (!a9) {
            goto LABEL_99;
          }
          goto LABEL_98;
        }
      }
      goto LABEL_97;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v26 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v26 = &stru_1F3D3E450;
    }
    uint64_t v27 = -2142765055;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_97;
    }
    uint64_t v40 = VRTraceErrorLogLevelToCSTR();
    __int16 v39 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_97;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v51 = v40;
    __int16 v52 = 2080;
    v53 = "-[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:enableAsyncTapStart:powerSpe"
          "ctrumMeter:powerSpectrumMeterKey:resultDictionary:error:]";
    __int16 v54 = 1024;
    int v55 = 266;
    __int16 v56 = 2112;
    v57 = v26;
    __int16 v58 = 2048;
    v59 = self;
    __int16 v60 = 2112;
    id v61 = a3;
    __int16 v35 = " [%s] %s:%d %@(%p) Missing power spectrum meter for tapType=%@";
    goto LABEL_86;
  }
  if (!a7)
  {
    uint64_t v27 = -2142765055;
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          -[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:enableAsyncTapStart:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:].cold.4();
          if (!a9) {
            goto LABEL_99;
          }
          goto LABEL_98;
        }
      }
      goto LABEL_97;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v28 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v28 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_97;
    }
    uint64_t v41 = VRTraceErrorLogLevelToCSTR();
    __int16 v39 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_97;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v51 = v41;
    __int16 v52 = 2080;
    v53 = "-[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:enableAsyncTapStart:powerSpe"
          "ctrumMeter:powerSpectrumMeterKey:resultDictionary:error:]";
    __int16 v54 = 1024;
    int v55 = 267;
    __int16 v56 = 2112;
    v57 = v28;
    __int16 v58 = 2048;
    v59 = self;
    __int16 v60 = 2112;
    id v61 = a3;
    __int16 v35 = " [%s] %s:%d %@(%p) Missing power spectrum meter key for tapType=%@";
    goto LABEL_86;
  }
  __int16 v17 = (void *)v16;
  if ([a3 unsignedIntValue] >= 2)
  {
    uint64_t v27 = -2142765055;
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          -[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:enableAsyncTapStart:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:].cold.5();
          if (!a9) {
            goto LABEL_99;
          }
          goto LABEL_98;
        }
      }
      goto LABEL_97;
    }
    if (objc_opt_respondsToSelector()) {
      int v29 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
    }
    else {
      int v29 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v42 = VRTraceErrorLogLevelToCSTR();
      __int16 v39 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v51 = v42;
        __int16 v52 = 2080;
        v53 = "-[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:enableAsyncTapStart:powe"
              "rSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:]";
        __int16 v54 = 1024;
        int v55 = 269;
        __int16 v56 = 2112;
        v57 = v29;
        __int16 v58 = 2048;
        v59 = self;
        __int16 v60 = 2112;
        id v61 = a3;
        __int16 v35 = " [%s] %s:%d %@(%p) Invalid tapType=%@";
        goto LABEL_86;
      }
    }
LABEL_97:
    if (!a9)
    {
LABEL_99:
      [(VCAudioPowerSpectrumManager *)self dispatchedCleanUpPowerSpectrumSetForCellularTapType:a3];
      return 0;
    }
LABEL_98:
    *a9 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.AVConference" code:v27 userInfo:0];
    goto LABEL_99;
  }
  id v18 = [(VCAudioPowerSpectrumManager *)self powerSpectrumMetersForCellularTapType:a3];
  if (!v18)
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      uint64_t v27 = -2142765054;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          -[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:enableAsyncTapStart:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:].cold.6();
          uint64_t v27 = -2142765054;
          if (!a9) {
            goto LABEL_99;
          }
          goto LABEL_98;
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v30 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v30 = &stru_1F3D3E450;
      }
      uint64_t v27 = -2142765054;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v43 = VRTraceErrorLogLevelToCSTR();
        id v44 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v51 = v43;
          __int16 v52 = 2080;
          v53 = "-[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:enableAsyncTapStart:po"
                "werSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:]";
          __int16 v54 = 1024;
          int v55 = 271;
          __int16 v56 = 2112;
          v57 = v30;
          __int16 v58 = 2048;
          v59 = self;
          __int16 v60 = 2112;
          id v61 = a3;
          _os_log_error_impl(&dword_1E1EA4000, v44, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) power spectrum meter set not found for tapType=%@", buf, 0x3Au);
          uint64_t v27 = -2142765054;
          if (!a9) {
            goto LABEL_99;
          }
          goto LABEL_98;
        }
      }
    }
    goto LABEL_97;
  }
  id v19 = v18;
  if ([v18 containsObject:a6])
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      uint64_t v27 = -2142765015;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_97;
      }
      VRTraceErrorLogLevelToCSTR();
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_97;
      }
      -[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:enableAsyncTapStart:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:].cold.7();
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        id v31 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
      }
      else {
        id v31 = &stru_1F3D3E450;
      }
      uint64_t v27 = -2142765015;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_97;
      }
      uint64_t v45 = VRTraceErrorLogLevelToCSTR();
      unsigned int v46 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_97;
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v51 = v45;
      __int16 v52 = 2080;
      v53 = "-[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:enableAsyncTapStart:powerS"
            "pectrumMeter:powerSpectrumMeterKey:resultDictionary:error:]";
      __int16 v54 = 1024;
      int v55 = 272;
      __int16 v56 = 2112;
      v57 = v31;
      __int16 v58 = 2048;
      v59 = self;
      __int16 v60 = 2112;
      id v61 = a3;
      _os_log_error_impl(&dword_1E1EA4000, v46, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) power spectrum meter is already registered for tapType=%@", buf, 0x3Au);
    }
    uint64_t v27 = -2142765015;
    if (!a9) {
      goto LABEL_99;
    }
    goto LABEL_98;
  }
  id v20 = -[VCAudioPowerSpectrumManager registerStreamTokenForCellularTapType:clientProcessId:enableAsyncTapStart:error:](self, "registerStreamTokenForCellularTapType:clientProcessId:enableAsyncTapStart:error:", a3, [a4 unsignedIntegerValue], v12, a9);
  if (!v20)
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:enableAsyncTapStart:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:].cold.8();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v32 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v32 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v47 = VRTraceErrorLogLevelToCSTR();
        v48 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v51 = v47;
          __int16 v52 = 2080;
          v53 = "-[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:enableAsyncTapStart:po"
                "werSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:]";
          __int16 v54 = 1024;
          int v55 = 276;
          __int16 v56 = 2112;
          v57 = v32;
          __int16 v58 = 2048;
          v59 = self;
          __int16 v60 = 2112;
          id v61 = a3;
          _os_log_error_impl(&dword_1E1EA4000, v48, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to retrieve the stream token for tapType=%@", buf, 0x3Au);
        }
      }
    }
    goto LABEL_99;
  }
  id v21 = v20;
  objc_msgSend(v17, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", -[VCCellularAudioTap tapToken](self->_cellularAudioTap, "tapToken")), @"vcBasebandAudioTapTapToken");
  [v17 setObject:v21 forKeyedSubscript:@"vcBasebandAudioTapDirectionToken"];
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __167__VCAudioPowerSpectrumManager_registerListenerWithCellularTapType_clientProcessId_enableAsyncTapStart_powerSpectrumMeter_powerSpectrumMeterKey_resultDictionary_error___block_invoke;
  block[3] = &unk_1E6DB5740;
  block[4] = self;
  block[5] = v21;
  block[6] = a7;
  void block[7] = a6;
  block[9] = a3;
  block[10] = a9;
  block[8] = v19;
  dispatch_async(xpcCommandQueue, block);
  if (a8) {
    *a8 = v17;
  }
  return 1;
}

void __167__VCAudioPowerSpectrumManager_registerListenerWithCellularTapType_clientProcessId_enableAsyncTapStart_powerSpectrumMeter_powerSpectrumMeterKey_resultDictionary_error___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) registerListenerWithStreamToken:*(void *)(a1 + 40) powerSpectrumKey:*(void *)(a1 + 48) powerSpectrumMeter:*(void *)(a1 + 56) error:*(void *)(a1 + 80)])
  {
    [*(id *)(a1 + 64) addObject:*(void *)(a1 + 56)];
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v4 = VRTraceErrorLogLevelToCSTR();
        uint64_t v5 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v6 = *(__CFString **)(a1 + 56);
          uint64_t v7 = *(void *)(a1 + 72);
          uint64_t v8 = *(void *)(a1 + 40);
          int v22 = 136316418;
          uint64_t v23 = v4;
          __int16 v24 = 2080;
          uint32_t v25 = "-[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:enableAsyncTapStart:po"
                "werSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:]_block_invoke";
          __int16 v26 = 1024;
          int v27 = 288;
          __int16 v28 = 2112;
          int v29 = v6;
          __int16 v30 = 2112;
          uint64_t v31 = v7;
          __int16 v32 = 2112;
          uint64_t v33 = v8;
          uint64_t v9 = " [%s] %s:%d powerSpectrumMeter=%@ registered listener for tapType=%@ with streamToken=%@";
          int v10 = v5;
          uint32_t v11 = 58;
LABEL_18:
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v22, v11);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        v2 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        __int16 v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = *(void *)(a1 + 56);
          uint64_t v15 = *(void *)(a1 + 72);
          uint64_t v16 = *(void *)(a1 + 32);
          uint64_t v17 = *(void *)(a1 + 40);
          int v22 = 136316930;
          uint64_t v23 = v12;
          __int16 v24 = 2080;
          uint32_t v25 = "-[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:enableAsyncTapStart:po"
                "werSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:]_block_invoke";
          __int16 v26 = 1024;
          int v27 = 288;
          __int16 v28 = 2112;
          int v29 = v2;
          __int16 v30 = 2048;
          uint64_t v31 = v16;
          __int16 v32 = 2112;
          uint64_t v33 = v14;
          __int16 v34 = 2112;
          uint64_t v35 = v15;
          __int16 v36 = 2112;
          uint64_t v37 = v17;
          uint64_t v9 = " [%s] %s:%d %@(%p) powerSpectrumMeter=%@ registered listener for tapType=%@ with streamToken=%@";
          int v10 = v13;
          uint32_t v11 = 78;
          goto LABEL_18;
        }
      }
    }
  }
  else if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __167__VCAudioPowerSpectrumManager_registerListenerWithCellularTapType_clientProcessId_enableAsyncTapStart_powerSpectrumMeter_powerSpectrumMeterKey_resultDictionary_error___block_invoke_cold_1();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      id v19 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = *(void *)(a1 + 32);
        uint64_t v21 = *(void *)(a1 + 72);
        int v22 = 136316418;
        uint64_t v23 = v18;
        __int16 v24 = 2080;
        uint32_t v25 = "-[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:enableAsyncTapStart:powe"
              "rSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:]_block_invoke";
        __int16 v26 = 1024;
        int v27 = 290;
        __int16 v28 = 2112;
        int v29 = v3;
        __int16 v30 = 2048;
        uint64_t v31 = v20;
        __int16 v32 = 2112;
        uint64_t v33 = v21;
        _os_log_error_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) client set not found for tapType=%@", (uint8_t *)&v22, 0x3Au);
      }
    }
  }
}

- (BOOL)dispatchedUnregisterListenerWithCellularTapType:(id)a3 powerSpectrumMeter:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcCommandQueue);
  if (!a3)
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      uint64_t v16 = -2142765055;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_61;
      }
      VRTraceErrorLogLevelToCSTR();
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_61;
      }
      -[VCAudioPowerSpectrumManager dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:]();
      if (!a5) {
        return 0;
      }
      goto LABEL_62;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v13 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v13 = &stru_1F3D3E450;
    }
    uint64_t v16 = -2142765055;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      uint64_t v20 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int16 v30 = 136316162;
        *(void *)&v30[4] = v19;
        *(_WORD *)&v30[12] = 2080;
        *(void *)&v30[14] = "-[VCAudioPowerSpectrumManager dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:]";
        *(_WORD *)&v30[22] = 1024;
        LODWORD(v31) = 320;
        WORD2(v31) = 2112;
        *(void *)((char *)&v31 + 6) = v13;
        HIWORD(v31) = 2048;
        __int16 v32 = self;
        uint64_t v21 = " [%s] %s:%d %@(%p) Missing tapType";
        int v22 = v20;
        uint32_t v23 = 48;
        goto LABEL_65;
      }
    }
    goto LABEL_61;
  }
  if (!a4)
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      uint64_t v16 = -2142765055;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_61;
      }
      VRTraceErrorLogLevelToCSTR();
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_61;
      }
      -[VCAudioPowerSpectrumManager dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:]();
      if (!a5) {
        return 0;
      }
      goto LABEL_62;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v14 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v14 = &stru_1F3D3E450;
    }
    uint64_t v16 = -2142765055;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_61;
    }
    uint64_t v24 = VRTraceErrorLogLevelToCSTR();
    uint32_t v25 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_61;
    }
    *(_DWORD *)__int16 v30 = 136316418;
    *(void *)&v30[4] = v24;
    *(_WORD *)&v30[12] = 2080;
    *(void *)&v30[14] = "-[VCAudioPowerSpectrumManager dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:]";
    *(_WORD *)&v30[22] = 1024;
    LODWORD(v31) = 321;
    WORD2(v31) = 2112;
    *(void *)((char *)&v31 + 6) = v14;
    HIWORD(v31) = 2048;
    __int16 v32 = self;
    LOWORD(v33) = 2112;
    *(void *)((char *)&v33 + 2) = a3;
    uint64_t v21 = " [%s] %s:%d %@(%p) Missing power spectrum meter for tapType=%@";
LABEL_64:
    int v22 = v25;
    uint32_t v23 = 58;
LABEL_65:
    _os_log_error_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_ERROR, v21, v30, v23);
    if (a5) {
      goto LABEL_62;
    }
    return 0;
  }
  uint64_t v9 = (void *)[(NSMutableDictionary *)self->_powerSpectrumMetersForCellularTapType objectForKeyedSubscript:a3];
  if (!v9)
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      uint64_t v16 = -2142765034;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_61;
      }
      VRTraceErrorLogLevelToCSTR();
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_61;
      }
      -[VCAudioPowerSpectrumManager dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:]();
      if (!a5) {
        return 0;
      }
      goto LABEL_62;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v15 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v15 = &stru_1F3D3E450;
    }
    uint64_t v16 = -2142765034;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_61;
    }
    uint64_t v26 = VRTraceErrorLogLevelToCSTR();
    uint32_t v25 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_61;
    }
    *(_DWORD *)__int16 v30 = 136316418;
    *(void *)&v30[4] = v26;
    *(_WORD *)&v30[12] = 2080;
    *(void *)&v30[14] = "-[VCAudioPowerSpectrumManager dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:]";
    *(_WORD *)&v30[22] = 1024;
    LODWORD(v31) = 323;
    WORD2(v31) = 2112;
    *(void *)((char *)&v31 + 6) = v15;
    HIWORD(v31) = 2048;
    __int16 v32 = self;
    LOWORD(v33) = 2112;
    *(void *)((char *)&v33 + 2) = a3;
    uint64_t v21 = " [%s] %s:%d %@(%p) No registered power spectrum meters found for tapType=%@";
    goto LABEL_64;
  }
  int v10 = v9;
  if ([v9 containsObject:a4])
  {
    uint64_t v11 = [(NSMutableDictionary *)self->_cellularTapTypeToStreamTokenMap objectForKeyedSubscript:a3];
    if (v11)
    {
      [a4 releaseAudioPowerSpectrumForStreamToken:v11];
      [v10 removeObject:a4];
      [(VCAudioPowerSpectrumManager *)self dispatchedCleanUpPowerSpectrumSetForCellularTapType:a3];
      [a4 cleanUpEventQueue];
      return 1;
    }
    uint64_t v16 = -2142765034;
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v18 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v18 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_61;
      }
      uint64_t v28 = VRTraceErrorLogLevelToCSTR();
      uint32_t v25 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_61;
      }
      *(_DWORD *)__int16 v30 = 136316418;
      *(void *)&v30[4] = v28;
      *(_WORD *)&v30[12] = 2080;
      *(void *)&v30[14] = "-[VCAudioPowerSpectrumManager dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:]";
      *(_WORD *)&v30[22] = 1024;
      LODWORD(v31) = 326;
      WORD2(v31) = 2112;
      *(void *)((char *)&v31 + 6) = v18;
      HIWORD(v31) = 2048;
      __int16 v32 = self;
      LOWORD(v33) = 2112;
      *(void *)((char *)&v33 + 2) = a3;
      uint64_t v21 = " [%s] %s:%d %@(%p) Stream token not found for tapType=%@";
      goto LABEL_64;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_61;
    }
    VRTraceErrorLogLevelToCSTR();
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_61;
    }
    -[VCAudioPowerSpectrumManager dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:].cold.4();
    if (!a5) {
      return 0;
    }
LABEL_62:
    int v29 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"com.apple.AVConference", v16, 0, *(_OWORD *)v30, *(void *)&v30[16], v31, v32, v33);
    BOOL result = 0;
    *a5 = v29;
    return result;
  }
  uint64_t v16 = -2142765034;
  if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_61;
    }
    VRTraceErrorLogLevelToCSTR();
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_61;
    }
    -[VCAudioPowerSpectrumManager dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:].cold.5();
    if (!a5) {
      return 0;
    }
    goto LABEL_62;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v17 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
  }
  else {
    uint64_t v17 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v27 = VRTraceErrorLogLevelToCSTR();
    uint32_t v25 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int16 v30 = 136316418;
      *(void *)&v30[4] = v27;
      *(_WORD *)&v30[12] = 2080;
      *(void *)&v30[14] = "-[VCAudioPowerSpectrumManager dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:]";
      *(_WORD *)&v30[22] = 1024;
      LODWORD(v31) = 324;
      WORD2(v31) = 2112;
      *(void *)((char *)&v31 + 6) = v17;
      HIWORD(v31) = 2048;
      __int16 v32 = self;
      LOWORD(v33) = 2112;
      *(void *)((char *)&v33 + 2) = a3;
      uint64_t v21 = " [%s] %s:%d %@(%p) Power spectrum not registered for tapType=%@";
      goto LABEL_64;
    }
  }
LABEL_61:
  if (a5) {
    goto LABEL_62;
  }
  return 0;
}

- (id)serviceHandlerPowerMeterInitializeWithArguments:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [a3 objectForKeyedSubscript:@"vcAudioPowerSpectrumBinCount"];
  if (!v7)
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioPowerSpectrumManager serviceHandlerPowerMeterInitializeWithArguments:error:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v15 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v15 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        uint64_t v19 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v27 = v18;
          __int16 v28 = 2080;
          int v29 = "-[VCAudioPowerSpectrumManager serviceHandlerPowerMeterInitializeWithArguments:error:]";
          __int16 v30 = 1024;
          int v31 = 354;
          __int16 v32 = 2112;
          long long v33 = v15;
          __int16 v34 = 2048;
          uint64_t v35 = self;
          _os_log_error_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Bin count is invalid", buf, 0x30u);
        }
      }
    }
    uint64_t v20 = -2;
    goto LABEL_35;
  }
  uint64_t v8 = (void *)v7;
  uint64_t v9 = [a3 objectForKeyedSubscript:@"vcAudioPowerSpectrumRefreshRate"];
  if (!v9)
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioPowerSpectrumManager serviceHandlerPowerMeterInitializeWithArguments:error:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v16 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v16 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v21 = VRTraceErrorLogLevelToCSTR();
        int v22 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v27 = v21;
          __int16 v28 = 2080;
          int v29 = "-[VCAudioPowerSpectrumManager serviceHandlerPowerMeterInitializeWithArguments:error:]";
          __int16 v30 = 1024;
          int v31 = 357;
          __int16 v32 = 2112;
          long long v33 = v16;
          __int16 v34 = 2048;
          uint64_t v35 = self;
          _os_log_error_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Refresh rate is invalid", buf, 0x30u);
        }
      }
    }
    uint64_t v20 = -3;
LABEL_35:
    if (a4)
    {
      uint32_t v23 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.AVConference" code:v20 userInfo:0];
      __int16 v13 = 0;
      *a4 = v23;
    }
    else
    {
      __int16 v13 = 0;
    }
    return v13;
  }
  int v10 = (void *)v9;
  uint64_t v11 = [v8 unsignedShortValue];
  [v10 doubleValue];
  id v12 = -[VCAudioPowerSpectrumManager newPowerSpectrumMeterWithBinCount:refreshRate:delegate:error:](self, "newPowerSpectrumMeterWithBinCount:refreshRate:delegate:error:", v11, self, a4);
  if (v12)
  {
    __int16 v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v12, @"CONTEXT", 0);
  }
  else
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioPowerSpectrumManager serviceHandlerPowerMeterInitializeWithArguments:error:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v17 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v17 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v24 = VRTraceErrorLogLevelToCSTR();
        uint32_t v25 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v27 = v24;
          __int16 v28 = 2080;
          int v29 = "-[VCAudioPowerSpectrumManager serviceHandlerPowerMeterInitializeWithArguments:error:]";
          __int16 v30 = 1024;
          int v31 = 360;
          __int16 v32 = 2112;
          long long v33 = v17;
          __int16 v34 = 2048;
          uint64_t v35 = self;
          _os_log_error_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Refresh rate is invalid", buf, 0x30u);
        }
      }
    }
    __int16 v13 = 0;
  }

  return v13;
}

- (id)serviceHandlerRegisterListenerWithArguments:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (![+[VCDefaults sharedInstance] forceDisableAudioPowerSpectrumRegister])
  {
    uint64_t v7 = [a3 objectForKeyedSubscript:@"CONTEXT"];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = [a3 objectForKeyedSubscript:@"vcAudioPowerSpectrumStreamToken"];
      if (v9)
      {
        if ([(VCAudioPowerSpectrumManager *)self registerListenerWithStreamToken:v9 powerSpectrumKey:v9 powerSpectrumMeter:v8 error:a4])
        {
          return 0;
        }
        if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCAudioPowerSpectrumManager serviceHandlerRegisterListenerWithArguments:error:]();
            }
          }
          goto LABEL_48;
        }
        if (objc_opt_respondsToSelector()) {
          uint64_t v14 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v14 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3
          || (uint64_t v33 = VRTraceErrorLogLevelToCSTR(),
              int v31 = *MEMORY[0x1E4F47A50],
              !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
        {
LABEL_48:
          uint64_t v29 = -7;
LABEL_49:
          if (a4) {
            *a4 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.AVConference" code:v29 userInfo:0];
          }
          return 0;
        }
        int v34 = 136316162;
        uint64_t v35 = v33;
        __int16 v36 = 2080;
        uint64_t v37 = "-[VCAudioPowerSpectrumManager serviceHandlerRegisterListenerWithArguments:error:]";
        __int16 v38 = 1024;
        int v39 = 382;
        __int16 v40 = 2112;
        uint64_t v41 = v14;
        __int16 v42 = 2048;
        uint64_t v43 = self;
        __int16 v32 = " [%s] %s:%d %@(%p) Failed to register the listener";
      }
      else
      {
        if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCAudioPowerSpectrumManager serviceHandlerRegisterListenerWithArguments:error:]();
            }
          }
          goto LABEL_48;
        }
        if (objc_opt_respondsToSelector()) {
          __int16 v13 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
        }
        else {
          __int16 v13 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_48;
        }
        uint64_t v30 = VRTraceErrorLogLevelToCSTR();
        int v31 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_48;
        }
        int v34 = 136316162;
        uint64_t v35 = v30;
        __int16 v36 = 2080;
        uint64_t v37 = "-[VCAudioPowerSpectrumManager serviceHandlerRegisterListenerWithArguments:error:]";
        __int16 v38 = 1024;
        int v39 = 379;
        __int16 v40 = 2112;
        uint64_t v41 = v13;
        __int16 v42 = 2048;
        uint64_t v43 = self;
        __int16 v32 = " [%s] %s:%d %@(%p) audioSpectrumRegisterListener: error no stream token specified";
      }
      _os_log_error_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_ERROR, v32, (uint8_t *)&v34, 0x30u);
      goto LABEL_48;
    }
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_40;
      }
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      uint64_t v21 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_40;
      }
      int v34 = 136315650;
      uint64_t v35 = v20;
      __int16 v36 = 2080;
      uint64_t v37 = "-[VCAudioPowerSpectrumManager serviceHandlerRegisterListenerWithArguments:error:]";
      __int16 v38 = 1024;
      int v39 = 376;
      int v22 = " [%s] %s:%d Invalid context. Power spectrum meter is nil";
      uint32_t v23 = v21;
      uint32_t v24 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        id v12 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
      }
      else {
        id v12 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_40;
      }
      uint64_t v27 = VRTraceErrorLogLevelToCSTR();
      __int16 v28 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_40;
      }
      int v34 = 136316162;
      uint64_t v35 = v27;
      __int16 v36 = 2080;
      uint64_t v37 = "-[VCAudioPowerSpectrumManager serviceHandlerRegisterListenerWithArguments:error:]";
      __int16 v38 = 1024;
      int v39 = 376;
      __int16 v40 = 2112;
      uint64_t v41 = v12;
      __int16 v42 = 2048;
      uint64_t v43 = self;
      int v22 = " [%s] %s:%d %@(%p) Invalid context. Power spectrum meter is nil";
      uint32_t v23 = v28;
      uint32_t v24 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v34, v24);
LABEL_40:
    uint64_t v29 = -6;
    goto LABEL_49;
  }
  if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    int v34 = 136315650;
    uint64_t v35 = v15;
    __int16 v36 = 2080;
    uint64_t v37 = "-[VCAudioPowerSpectrumManager serviceHandlerRegisterListenerWithArguments:error:]";
    __int16 v38 = 1024;
    int v39 = 373;
    uint64_t v17 = " [%s] %s:%d Force disableAudioPowerSpectrumRegister is YES: inhibiting call to API_VCAUDIOPOWERSPECTURM_REGISTER_LISTENER_KEY";
    uint64_t v18 = v16;
    uint32_t v19 = 28;
LABEL_34:
    _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v34, v19);
    return 0;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v11 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
  }
  else {
    uint64_t v11 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v25 = VRTraceErrorLogLevelToCSTR();
    uint64_t v26 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v34 = 136316162;
      uint64_t v35 = v25;
      __int16 v36 = 2080;
      uint64_t v37 = "-[VCAudioPowerSpectrumManager serviceHandlerRegisterListenerWithArguments:error:]";
      __int16 v38 = 1024;
      int v39 = 373;
      __int16 v40 = 2112;
      uint64_t v41 = v11;
      __int16 v42 = 2048;
      uint64_t v43 = self;
      uint64_t v17 = " [%s] %s:%d %@(%p) Force disableAudioPowerSpectrumRegister is YES: inhibiting call to API_VCAUDIOPOWERSPECTU"
            "RM_REGISTER_LISTENER_KEY";
      uint64_t v18 = v26;
      uint32_t v19 = 48;
      goto LABEL_34;
    }
  }
  return 0;
}

- (id)serviceHandlerUnregisterListenerWithArguments:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [a3 objectForKeyedSubscript:@"CONTEXT"];
  if (!v7)
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_22;
      }
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      int v23 = 136315650;
      uint64_t v24 = v13;
      __int16 v25 = 2080;
      uint64_t v26 = "-[VCAudioPowerSpectrumManager serviceHandlerUnregisterListenerWithArguments:error:]";
      __int16 v27 = 1024;
      int v28 = 393;
      uint64_t v15 = " [%s] %s:%d Invalid context. Power spectrum meter is nil";
      uint64_t v16 = v14;
      uint32_t v17 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v11 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v11 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_22;
      }
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      uint32_t v19 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      int v23 = 136316162;
      uint64_t v24 = v18;
      __int16 v25 = 2080;
      uint64_t v26 = "-[VCAudioPowerSpectrumManager serviceHandlerUnregisterListenerWithArguments:error:]";
      __int16 v27 = 1024;
      int v28 = 393;
      __int16 v29 = 2112;
      uint64_t v30 = v11;
      __int16 v31 = 2048;
      __int16 v32 = self;
      uint64_t v15 = " [%s] %s:%d %@(%p) Invalid context. Power spectrum meter is nil";
      uint64_t v16 = v19;
      uint32_t v17 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v23, v17);
LABEL_22:
    uint64_t v20 = -6;
    goto LABEL_28;
  }
  uint64_t v8 = (void *)v7;
  uint64_t v9 = [a3 objectForKeyedSubscript:@"vcAudioPowerSpectrumStreamToken"];
  if (v9)
  {
    [v8 releaseAudioPowerSpectrumForStreamToken:v9];
    return 0;
  }
  if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioPowerSpectrumManager serviceHandlerUnregisterListenerWithArguments:error:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      id v12 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
    }
    else {
      id v12 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      int v22 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v23 = 136316162;
        uint64_t v24 = v21;
        __int16 v25 = 2080;
        uint64_t v26 = "-[VCAudioPowerSpectrumManager serviceHandlerUnregisterListenerWithArguments:error:]";
        __int16 v27 = 1024;
        int v28 = 396;
        __int16 v29 = 2112;
        uint64_t v30 = v12;
        __int16 v31 = 2048;
        __int16 v32 = self;
        _os_log_error_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) audioSpectrumUnregisterListener: error no stream token specified", (uint8_t *)&v23, 0x30u);
      }
    }
  }
  uint64_t v20 = -7;
LABEL_28:
  if (a4) {
    *a4 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.AVConference" code:v20 userInfo:0];
  }
  return 0;
}

- (id)serviceHandlerRegisterCellularTapWithArguments:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  int v23 = 0;
  uint64_t v24 = 0;
  if ([+[VCDefaults sharedInstance] forceDisableAudioPowerSpectrumRegister])
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        uint64_t v15 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v26 = v14;
          __int16 v27 = 2080;
          int v28 = "-[VCAudioPowerSpectrumManager serviceHandlerRegisterCellularTapWithArguments:error:]";
          __int16 v29 = 1024;
          int v30 = 410;
          uint64_t v16 = " [%s] %s:%d Force disableAudioPowerSpectrumRegister is YES: inhibiting call to API_VCAUDIOPOWERSPECTURM_"
                "REGISTER_LISTENER_KEY";
          uint32_t v17 = v15;
          uint32_t v18 = 28;
LABEL_26:
          _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        id v12 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
      }
      else {
        id v12 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        uint64_t v20 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v26 = v19;
          __int16 v27 = 2080;
          int v28 = "-[VCAudioPowerSpectrumManager serviceHandlerRegisterCellularTapWithArguments:error:]";
          __int16 v29 = 1024;
          int v30 = 410;
          __int16 v31 = 2112;
          __int16 v32 = v12;
          __int16 v33 = 2048;
          int v34 = self;
          uint64_t v16 = " [%s] %s:%d %@(%p) Force disableAudioPowerSpectrumRegister is YES: inhibiting call to API_VCAUDIOPOWERSP"
                "ECTURM_REGISTER_LISTENER_KEY";
          uint32_t v17 = v20;
          uint32_t v18 = 48;
          goto LABEL_26;
        }
      }
    }
LABEL_3:
    char v7 = 0;
    uint64_t v8 = 0;
    if (!a4) {
      return v23;
    }
    goto LABEL_4;
  }
  if (-[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:enableAsyncTapStart:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:](self, "registerListenerWithCellularTapType:clientProcessId:enableAsyncTapStart:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:", [a3 objectForKeyedSubscript:@"vcAudioPowerSpectrumCellularTapType"], objc_msgSend(a3, "objectForKeyedSubscript:", @"CLIENTPID"), objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcAudioPowerSpectrumMeterEnableAsyncTapStart"), "BOOLValue"), objc_msgSend(a3, "objectForKeyedSubscript:", @"CONTEXT"), objc_msgSend(a3, "objectForKeyedSubscript:", @"vcAudioPowerSpectrumMeterKeyType"), &v23, &v24))
  {
    goto LABEL_3;
  }
  if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioPowerSpectrumManager serviceHandlerRegisterCellularTapWithArguments:error:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v13 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v13 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      int v22 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v26 = v21;
        __int16 v27 = 2080;
        int v28 = "-[VCAudioPowerSpectrumManager serviceHandlerRegisterCellularTapWithArguments:error:]";
        __int16 v29 = 1024;
        int v30 = 419;
        __int16 v31 = 2112;
        __int16 v32 = v13;
        __int16 v33 = 2048;
        int v34 = self;
        __int16 v35 = 2112;
        __int16 v36 = v24;
        _os_log_error_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to register the listener. error=%@", buf, 0x3Au);
      }
    }
  }
  uint64_t v8 = -7;
  char v7 = 1;
  if (a4)
  {
LABEL_4:
    uint64_t v9 = v24;
    char v10 = v7 ^ 1;
    if (v24) {
      char v10 = 1;
    }
    if ((v10 & 1) == 0) {
      uint64_t v9 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.AVConference" code:v8 userInfo:0];
    }
    *a4 = v9;
  }
  return v23;
}

- (id)serviceHandlerUnregisterCellularTagWithArguments:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  char v10 = 0;
  if (!-[VCAudioPowerSpectrumManager dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:](self, "dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:", [a3 objectForKeyedSubscript:@"vcAudioPowerSpectrumCellularTapType"], objc_msgSend(a3, "objectForKeyedSubscript:", @"CONTEXT"), &v10))
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          -[VCAudioPowerSpectrumManager serviceHandlerUnregisterCellularTagWithArguments:error:]();
          if (!a4) {
            return 0;
          }
          goto LABEL_13;
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v6 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
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
          *(_DWORD *)buf = 136316418;
          uint64_t v12 = v7;
          __int16 v13 = 2080;
          uint64_t v14 = "-[VCAudioPowerSpectrumManager serviceHandlerUnregisterCellularTagWithArguments:error:]";
          __int16 v15 = 1024;
          int v16 = 436;
          __int16 v17 = 2112;
          uint32_t v18 = v6;
          __int16 v19 = 2048;
          uint64_t v20 = self;
          __int16 v21 = 2112;
          int v22 = v10;
          _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to unregister the listener. error=%@", buf, 0x3Au);
          if (!a4) {
            return 0;
          }
          goto LABEL_13;
        }
      }
    }
  }
  if (a4) {
LABEL_13:
  }
    *a4 = v10;
  return 0;
}

- (id)serviceHandlerPowerMeterTerminateWithArguments:(id)a3 error:(id *)a4
{
  uint64_t v6 = objc_msgSend(a3, "objectForKeyedSubscript:", @"CONTEXT", a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if ([a3 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v7 = 0;
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v7 = objc_msgSend(v9, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"CONTEXT", 0);
  }
  [(VCAudioPowerSpectrumManager *)self terminatePowerSpectrumMeter:v6];

  return v7;
}

- (void)registerBlocksForService
{
  v9[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__VCAudioPowerSpectrumManager_registerBlocksForService__block_invoke;
  v9[3] = &unk_1E6DB5478;
  v9[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcAudioPowerSpectrumInitializeRemoteVideoForStreamToken", v9, self->_xpcCommandQueue);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__VCAudioPowerSpectrumManager_registerBlocksForService__block_invoke_2;
  v8[3] = &unk_1E6DB5478;
  v8[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcAudioPowerSpectrumRegisterListener", v8, self->_xpcCommandQueue);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__VCAudioPowerSpectrumManager_registerBlocksForService__block_invoke_3;
  v7[3] = &unk_1E6DB5478;
  v7[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcAudioPowerSpectrumUnregisterListener", v7, self->_xpcCommandQueue);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__VCAudioPowerSpectrumManager_registerBlocksForService__block_invoke_4;
  v6[3] = &unk_1E6DB5478;
  v6[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcAudioPowerSpectrumRegisterCellularTap", v6, self->_xpcCommandQueue);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__VCAudioPowerSpectrumManager_registerBlocksForService__block_invoke_5;
  v5[3] = &unk_1E6DB5478;
  v5[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcAudioPowerSpectrumUnregisterCellularTap", v5, self->_xpcCommandQueue);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__VCAudioPowerSpectrumManager_registerBlocksForService__block_invoke_6;
  v4[3] = &unk_1E6DB5478;
  v4[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcAudioPowerSpectrumTerminateMeter", v4, self->_xpcCommandQueue);
}

id __55__VCAudioPowerSpectrumManager_registerBlocksForService__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)[*(id *)(a1 + 32) strong];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v7 = (void *)[v5 serviceHandlerPowerMeterInitializeWithArguments:a2 error:a3];

  return v7;
}

id __55__VCAudioPowerSpectrumManager_registerBlocksForService__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)[*(id *)(a1 + 32) strong];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v7 = (void *)[v5 serviceHandlerRegisterListenerWithArguments:a2 error:a3];

  return v7;
}

id __55__VCAudioPowerSpectrumManager_registerBlocksForService__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)[*(id *)(a1 + 32) strong];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v7 = (void *)[v5 serviceHandlerUnregisterListenerWithArguments:a2 error:a3];

  return v7;
}

id __55__VCAudioPowerSpectrumManager_registerBlocksForService__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)[*(id *)(a1 + 32) strong];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v7 = (void *)[v5 serviceHandlerRegisterCellularTapWithArguments:a2 error:a3];

  return v7;
}

id __55__VCAudioPowerSpectrumManager_registerBlocksForService__block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)[*(id *)(a1 + 32) strong];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v7 = (void *)[v5 serviceHandlerUnregisterCellularTagWithArguments:a2 error:a3];

  return v7;
}

id __55__VCAudioPowerSpectrumManager_registerBlocksForService__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "serviceHandlerPowerMeterTerminateWithArguments:error:", a2, a3);

  return v3;
}

- (void)deregisterBlocksForService
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcAudioPowerSpectrumInitializeRemoteVideoForStreamToken");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcAudioPowerSpectrumTerminateMeter");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcAudioPowerSpectrumRegisterListener");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcAudioPowerSpectrumUnregisterListener");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcAudioPowerSpectrumRegisterCellularTap");
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v2 deregisterFromService:"vcAudioPowerSpectrumUnregisterCellularTap"];
}

- (void)audioPowerSpectrumMeter:(id)a3 didUpdateAudioPowerSpectrums:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ((VCAudioPowerSpectrumManager *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[(VCAudioPowerSpectrumManager *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      goto LABEL_17;
    }
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    __int16 v15 = *MEMORY[0x1E4F47A50];
    int v16 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        uint64_t v23 = v14;
        __int16 v24 = 2080;
        __int16 v25 = "-[VCAudioPowerSpectrumManager audioPowerSpectrumMeter:didUpdateAudioPowerSpectrums:]";
        __int16 v26 = 1024;
        int v27 = 527;
        __int16 v28 = 2112;
        id v29 = v7;
        __int16 v30 = 2048;
        __int16 v31 = self;
        __int16 v32 = 2048;
        id v33 = a3;
        __int16 v34 = 2112;
        id v35 = a4;
        uint64_t v11 = " [%s] %s:%d %@(%p) meter[%p] spectrums[%@]";
        uint64_t v12 = v15;
        uint32_t v13 = 68;
        goto LABEL_13;
      }
      goto LABEL_17;
    }
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136316674;
    uint64_t v23 = v14;
    __int16 v24 = 2080;
    __int16 v25 = "-[VCAudioPowerSpectrumManager audioPowerSpectrumMeter:didUpdateAudioPowerSpectrums:]";
    __int16 v26 = 1024;
    int v27 = 527;
    __int16 v28 = 2112;
    id v29 = v7;
    __int16 v30 = 2048;
    __int16 v31 = self;
    __int16 v32 = 2048;
    id v33 = a3;
    __int16 v34 = 2112;
    id v35 = a4;
    __int16 v17 = " [%s] %s:%d %@(%p) meter[%p] spectrums[%@]";
    uint32_t v18 = v15;
    uint32_t v19 = 68;
LABEL_19:
    _os_log_debug_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEBUG, v17, buf, v19);
    goto LABEL_17;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
    goto LABEL_17;
  }
  uint64_t v8 = VRTraceErrorLogLevelToCSTR();
  id v9 = *MEMORY[0x1E4F47A50];
  char v10 = *MEMORY[0x1E4F47A50];
  if (!*MEMORY[0x1E4F47A40])
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v23 = v8;
    __int16 v24 = 2080;
    __int16 v25 = "-[VCAudioPowerSpectrumManager audioPowerSpectrumMeter:didUpdateAudioPowerSpectrums:]";
    __int16 v26 = 1024;
    int v27 = 527;
    __int16 v28 = 2048;
    id v29 = a3;
    __int16 v30 = 2112;
    __int16 v31 = a4;
    __int16 v17 = " [%s] %s:%d meter[%p] spectrums[%@]";
    uint32_t v18 = v9;
    uint32_t v19 = 48;
    goto LABEL_19;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    uint64_t v23 = v8;
    __int16 v24 = 2080;
    __int16 v25 = "-[VCAudioPowerSpectrumManager audioPowerSpectrumMeter:didUpdateAudioPowerSpectrums:]";
    __int16 v26 = 1024;
    int v27 = 527;
    __int16 v28 = 2048;
    id v29 = a3;
    __int16 v30 = 2112;
    __int16 v31 = a4;
    uint64_t v11 = " [%s] %s:%d meter[%p] spectrums[%@]";
    uint64_t v12 = v9;
    uint32_t v13 = 48;
LABEL_13:
    _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
  }
LABEL_17:
  uint64_t v20 = (void *)[MEMORY[0x1E4F28DB0] newSecureArchivedDataWithRootObject:a4];
  __int16 v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v20, @"vcAudioPowerSpectrumRemoteSpectrum", 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcAudioPowerSpectrumServerDidReceiveSpectrum", v21, a3);
}

- (void)serverDidDie
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcCommandQueue);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = self->_powerSpectrumMetersForCellularTapType;
  uint64_t v14 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v21 objects:v20 count:16];
  if (v14)
  {
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v5 = (void *)[(NSMutableDictionary *)self->_powerSpectrumMetersForCellularTapType objectForKeyedSubscript:v4];
        uint64_t v6 = [(NSMutableDictionary *)self->_cellularTapTypeToStreamTokenMap objectForKeyedSubscript:v4];
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v15 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v17;
          do
          {
            for (uint64_t j = 0; j != v8; ++j)
            {
              if (*(void *)v17 != v9) {
                objc_enumerationMutation(v5);
              }
              uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * j);
              objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcAudioPowerSpectrumServerSpectrumInterrupted", 0, v11);
              [v11 releaseAudioPowerSpectrumForStreamToken:v6];
              [(VCAudioPowerSpectrumManager *)self terminatePowerSpectrumMeter:v11];
            }
            uint64_t v8 = [v5 countByEnumeratingWithState:&v16 objects:v15 count:16];
          }
          while (v8);
        }
      }
      uint64_t v14 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v21 objects:v20 count:16];
    }
    while (v14);
  }
}

- (NSMutableArray)meters
{
  return self->_meters;
}

- (NSMutableDictionary)sources
{
  return self->_sources;
}

- (void)init
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the power spectrum meter dictionary", v2, v3, v4, v5, v6);
}

void __61__VCAudioPowerSpectrumManager_registerAudioPowerMeterSource___block_invoke_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*a2 streamToken];
  int v6 = 136315906;
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  OUTLINED_FUNCTION_3_0();
  int v9 = 108;
  __int16 v10 = 2048;
  uint64_t v11 = v5;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d source[streamToken=%ld] already existed", (uint8_t *)&v6, 0x26u);
}

- (void)newPowerSpectrumMeterWithBinCount:refreshRate:delegate:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCPowerSpectrumMeter failed to allocate", v2, v3, v4, v5, v6);
}

- (void)registerListenerWithStreamToken:powerSpectrumKey:powerSpectrumMeter:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d audioSpectrumRegisterListener: error no powerSpectrumSource for streamToken=%@");
}

- (void)registerStreamTokenForCellularTapType:clientProcessId:enableAsyncTapStart:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid tapType=%@");
}

- (void)registerStreamTokenForCellularTapType:clientProcessId:enableAsyncTapStart:error:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the audio tap for tapType=%@");
}

- (void)powerSpectrumMetersForCellularTapType:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed allocate the client set for tapType=%@");
}

- (void)dispatchedCleanUpPowerSpectrumSetForCellularTapType:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Stream token not found for tapType=%@");
}

- (void)registerListenerWithCellularTapType:clientProcessId:enableAsyncTapStart:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Missing tapType", v2, v3, v4, v5, v6);
}

- (void)registerListenerWithCellularTapType:clientProcessId:enableAsyncTapStart:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Process id is missing tapType=%@");
}

- (void)registerListenerWithCellularTapType:clientProcessId:enableAsyncTapStart:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Missing power spectrum meter for tapType=%@");
}

- (void)registerListenerWithCellularTapType:clientProcessId:enableAsyncTapStart:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Missing power spectrum meter key for tapType=%@");
}

- (void)registerListenerWithCellularTapType:clientProcessId:enableAsyncTapStart:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:.cold.5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid tapType=%@");
}

- (void)registerListenerWithCellularTapType:clientProcessId:enableAsyncTapStart:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:.cold.6()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d power spectrum meter set not found for tapType=%@");
}

- (void)registerListenerWithCellularTapType:clientProcessId:enableAsyncTapStart:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:.cold.7()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d power spectrum meter is already registered for tapType=%@");
}

- (void)registerListenerWithCellularTapType:clientProcessId:enableAsyncTapStart:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:.cold.8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to retrieve the stream token for tapType=%@");
}

void __167__VCAudioPowerSpectrumManager_registerListenerWithCellularTapType_clientProcessId_enableAsyncTapStart_powerSpectrumMeter_powerSpectrumMeterKey_resultDictionary_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d client set not found for tapType=%@");
}

- (void)dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Missing tapType", v2, v3, v4, v5, v6);
}

- (void)dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Missing power spectrum meter for tapType=%@");
}

- (void)dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No registered power spectrum meters found for tapType=%@");
}

- (void)dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Stream token not found for tapType=%@");
}

- (void)dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:.cold.5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Power spectrum not registered for tapType=%@");
}

- (void)serviceHandlerPowerMeterInitializeWithArguments:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Bin count is invalid", v2, v3, v4, v5, v6);
}

- (void)serviceHandlerPowerMeterInitializeWithArguments:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Refresh rate is invalid", v2, v3, v4, v5, v6);
}

- (void)serviceHandlerPowerMeterInitializeWithArguments:error:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Refresh rate is invalid", v2, v3, v4, v5, v6);
}

- (void)serviceHandlerRegisterListenerWithArguments:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d audioSpectrumRegisterListener: error no stream token specified", v2, v3, v4, v5, v6);
}

- (void)serviceHandlerRegisterListenerWithArguments:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to register the listener", v2, v3, v4, v5, v6);
}

- (void)serviceHandlerUnregisterListenerWithArguments:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d audioSpectrumUnregisterListener: error no stream token specified", v2, v3, v4, v5, v6);
}

- (void)serviceHandlerRegisterCellularTapWithArguments:error:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to register the listener. error=%@");
}

- (void)serviceHandlerUnregisterCellularTagWithArguments:error:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to unregister the listener. error=%@");
}

@end