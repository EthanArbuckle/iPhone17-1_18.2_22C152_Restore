@interface AVCBasebandAudioTap
+ (BOOL)unregisterFromTapWithError:(id *)a3;
+ (id)registerForTapWithError:(id *)a3;
+ (id)sharedInstance;
- (AVCBasebandAudioTap)init;
- (AVCBasebandAudioTapDelegate)delegate;
- (BOOL)setUpPowerSpectrumMeter;
- (BOOL)unregisterFromTapWithError:(id *)a3;
- (id)dispatchedDelegate;
- (id)registerForTapWithError:(id *)a3;
- (void)cleanUpPowerSpectrumMeter;
- (void)dealloc;
- (void)init;
- (void)meterServerDidDisconnect:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation AVCBasebandAudioTap

- (BOOL)setUpPowerSpectrumMeter
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  powerSpectrumMeter = self->_powerSpectrumMeter;
  if (!powerSpectrumMeter)
  {
    v4 = [AVCAudioPowerSpectrumMeter alloc];
    stateQueue = self->_stateQueue;
    long long v8 = xmmword_1E259F9A8;
    uint64_t v9 = 0x40F5180000000000;
    v6 = [(AVCAudioPowerSpectrumMeter *)v4 initWithConfig:&v8 delegate:self queue:stateQueue];
    self->_powerSpectrumMeter = v6;
    [(AVCAudioPowerSpectrumMeter *)v6 setEnableAsyncTapStart:1];
    powerSpectrumMeter = self->_powerSpectrumMeter;
  }
  return powerSpectrumMeter != 0;
}

- (void)cleanUpPowerSpectrumMeter
{
  self->_powerSpectrumMeter = 0;
}

- (id)dispatchedDelegate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);

  return objc_loadWeak(&self->_weakDelegate);
}

- (AVCBasebandAudioTap)init
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  VRTraceReset();
  v9.receiver = self;
  v9.super_class = (Class)AVCBasebandAudioTap;
  v3 = [(AVCBasebandAudioTap *)&v9 init];
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCBasebandAudioTap init]();
      }
    }
    goto LABEL_14;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  dispatch_queue_t v5 = dispatch_queue_create_with_target_V2("com.apple.AVConference.AVCBasebandAudioTap.stateQueue", 0, CustomRootQueue);
  v3->_stateQueue = (OS_dispatch_queue *)v5;
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCBasebandAudioTap init]();
      }
    }
    goto LABEL_14;
  }
  v6 = VCDispatchQueue_GetCustomRootQueue(37);
  dispatch_queue_t v7 = dispatch_queue_create_with_target_V2("com.apple.AVConference.AVCBasebandAudioTap.delegateQueue", 0, v6);
  v3->_delegateQueue = (OS_dispatch_queue *)v7;
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCBasebandAudioTap init]();
      }
    }
LABEL_14:

    return 0;
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];

  objc_storeWeak(&self->_weakDelegate, 0);
  delegateQueue = self->_delegateQueue;
  if (delegateQueue) {
    dispatch_release(delegateQueue);
  }
  stateQueue = self->_stateQueue;
  if (stateQueue) {
    dispatch_release(stateQueue);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVCBasebandAudioTap;
  [(AVCBasebandAudioTap *)&v5 dealloc];
}

- (AVCBasebandAudioTapDelegate)delegate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  objc_super v9 = __Block_byref_object_copy__13;
  uint64_t v10 = __Block_byref_object_dispose__13;
  uint64_t v11 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__AVCBasebandAudioTap_delegate__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(stateQueue, block);
  v3 = (AVCBasebandAudioTapDelegate *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__AVCBasebandAudioTap_delegate__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) dispatchedDelegate];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setDelegate:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__AVCBasebandAudioTap_setDelegate___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(stateQueue, block);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    dispatch_queue_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = (objc_class *)objc_opt_class();
      objc_super v9 = NSStringFromClass(v8);
      uint64_t v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 136316674;
      uint64_t v25 = v6;
      __int16 v26 = 2080;
      v27 = "-[AVCBasebandAudioTap setDelegate:]";
      __int16 v28 = 1024;
      int v29 = 148;
      __int16 v30 = 2048;
      *(void *)v31 = self;
      *(_WORD *)&v31[8] = 2112;
      *(void *)&v31[10] = v9;
      *(_WORD *)&v31[18] = 2048;
      *(void *)&v31[20] = a3;
      __int16 v32 = 2112;
      v33 = v11;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d self=%p (%@), delegate=%p (%@)", buf, 0x44u);
    }
  }
  unsigned int outCount = 0;
  v21 = protocol_copyMethodDescriptionList((Protocol *)&unk_1F3E48618, 0, 1, &outCount);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v25 = v12;
      __int16 v26 = 2080;
      v27 = "-[AVCBasebandAudioTap setDelegate:]";
      __int16 v28 = 1024;
      int v29 = 148;
      __int16 v30 = 1024;
      *(_DWORD *)v31 = outCount;
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Protocol AVCBasebandAudioTapDelegate contains %u optional methods.", buf, 0x22u);
    }
  }
  if (outCount)
  {
    unint64_t v14 = 0;
    p_name = &v21->name;
    do
    {
      v16 = NSStringFromSelector(*p_name);
      NSSelectorFromString(v16);
      char v17 = objc_opt_respondsToSelector();
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v20 = "does NOT respond";
          if (v17) {
            v20 = "responds";
          }
          uint64_t v25 = v18;
          __int16 v26 = 2080;
          v27 = "-[AVCBasebandAudioTap setDelegate:]";
          __int16 v28 = 1024;
          int v29 = 148;
          __int16 v30 = 1024;
          *(_DWORD *)v31 = v14;
          *(_WORD *)&v31[4] = 2080;
          *(void *)&v31[6] = v20;
          *(_WORD *)&v31[14] = 2112;
          *(void *)&v31[16] = v16;
          _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %u: Delegate %s to \"%@\"", buf, 0x36u);
        }
      }
      ++v14;
      p_name += 2;
    }
    while (v14 < outCount);
  }
  free(v21);
}

id __35__AVCBasebandAudioTap_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8 != -1) {
    dispatch_once(&sharedInstance_onceToken_8, &__block_literal_global_41);
  }
  return (id)sharedInstance_instance_1;
}

AVCBasebandAudioTap *__37__AVCBasebandAudioTap_sharedInstance__block_invoke()
{
  uint64_t result = objc_alloc_init(AVCBasebandAudioTap);
  sharedInstance_instance_1 = (uint64_t)result;
  return result;
}

- (id)registerForTapWithError:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3052000000;
  char v17 = __Block_byref_object_copy__13;
  uint64_t v18 = __Block_byref_object_dispose__13;
  uint64_t v19 = 0;
  objc_super v5 = objc_alloc_init(AVCBasebandAudioTapRegistrationResult);
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCBasebandAudioTap-registerForTapWithError");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    dispatch_queue_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v21 = v6;
      __int16 v22 = 2080;
      v23 = "-[AVCBasebandAudioTap registerForTapWithError:]";
      __int16 v24 = 1024;
      int v25 = 165;
      __int16 v26 = 2048;
      v27 = self;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCBasebandAudioTap-registerForTapWithError [%p]", buf, 0x26u);
    }
  }
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__AVCBasebandAudioTap_registerForTapWithError___block_invoke;
  block[3] = &unk_1E6DB4590;
  block[5] = v5;
  void block[6] = &v14;
  block[4] = self;
  dispatch_sync(stateQueue, block);
  if (a3) {
    *a3 = (id)v15[5];
  }
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCBasebandAudioTap-registerForTapWithError");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v21 = v9;
      __int16 v22 = 2080;
      v23 = "-[AVCBasebandAudioTap registerForTapWithError:]";
      __int16 v24 = 1024;
      int v25 = 185;
      __int16 v26 = 2048;
      v27 = self;
      __int16 v28 = 2112;
      int v29 = v5;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCBasebandAudioTap-registerForTapWithError [%p] result=%@", buf, 0x30u);
    }
  }
  uint64_t v11 = v5;
  _Block_object_dispose(&v14, 8);
  return v11;
}

uint64_t __47__AVCBasebandAudioTap_registerForTapWithError___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) setUpPowerSpectrumMeter])
  {
    uint64_t v2 = a1 + 48;
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 24) registerPowerSpectrumForCellularTapType:0 error:*(void *)(*(void *)(a1 + 48) + 8) + 40];
    if (!v3 || (v4 = *(void *)(*(void *)v2 + 8), v6 = *(void *)(v4 + 40), uint64_t v5 = v4 + 40, v6))
    {
      if (objc_opt_class() == *(void *)(a1 + 32))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            __47__AVCBasebandAudioTap_registerForTapWithError___block_invoke_cold_2();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v8 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
        }
        else {
          uint64_t v8 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v11 = VRTraceErrorLogLevelToCSTR();
          uint64_t v12 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            uint64_t v13 = *(void *)(a1 + 32);
            uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
            *(_DWORD *)v23 = 136316418;
            *(void *)&v23[4] = v11;
            *(_WORD *)&v23[12] = 2080;
            *(void *)&v23[14] = "-[AVCBasebandAudioTap registerForTapWithError:]_block_invoke";
            *(_WORD *)&v23[22] = 1024;
            LODWORD(v24) = 171;
            WORD2(v24) = 2112;
            *(void *)((char *)&v24 + 6) = v8;
            HIWORD(v24) = 2048;
            uint64_t v25 = v13;
            LOWORD(v26) = 2112;
            *(void *)((char *)&v26 + 2) = v14;
            v15 = " [%s] %s:%d %@(%p) Failed to register uplink tap with error=%@";
LABEL_31:
            _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, v15, v23, 0x3Au);
          }
        }
      }
    }
    else
    {
      uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 24) registerPowerSpectrumForCellularTapType:1 error:v5];
      if (v3 && !*(void *)(*(void *)(*(void *)v2 + 8) + 40))
      {
        uint64_t v3 = 1;
        goto LABEL_7;
      }
      if (objc_opt_class() == *(void *)(a1 + 32))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            __47__AVCBasebandAudioTap_registerForTapWithError___block_invoke_cold_1();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v9 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
        }
        else {
          uint64_t v9 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v16 = VRTraceErrorLogLevelToCSTR();
          uint64_t v12 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            uint64_t v17 = *(void *)(a1 + 32);
            uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
            *(_DWORD *)v23 = 136316418;
            *(void *)&v23[4] = v16;
            *(_WORD *)&v23[12] = 2080;
            *(void *)&v23[14] = "-[AVCBasebandAudioTap registerForTapWithError:]_block_invoke";
            *(_WORD *)&v23[22] = 1024;
            LODWORD(v24) = 174;
            WORD2(v24) = 2112;
            *(void *)((char *)&v24 + 6) = v9;
            HIWORD(v24) = 2048;
            uint64_t v25 = v17;
            LOWORD(v26) = 2112;
            *(void *)((char *)&v26 + 2) = v18;
            v15 = " [%s] %s:%d %@(%p) Failed to register downlink tap with error=%@";
            goto LABEL_31;
          }
        }
      }
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [MEMORY[0x1E4F28C58] AVConferenceServiceError:32031 detailCode:0 description:@"Failed to set up XPC connection for AVCBasebandAudioTap"];
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __47__AVCBasebandAudioTap_registerForTapWithError___block_invoke_cold_3();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v10 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v21 = *(void *)(a1 + 32);
          uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          *(_DWORD *)v23 = 136316418;
          *(void *)&v23[4] = v19;
          *(_WORD *)&v23[12] = 2080;
          *(void *)&v23[14] = "-[AVCBasebandAudioTap registerForTapWithError:]_block_invoke";
          *(_WORD *)&v23[22] = 1024;
          LODWORD(v24) = 168;
          WORD2(v24) = 2112;
          *(void *)((char *)&v24 + 6) = v10;
          HIWORD(v24) = 2048;
          uint64_t v25 = v21;
          LOWORD(v26) = 2112;
          *(void *)((char *)&v26 + 2) = v22;
          _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) error=%@", v23, 0x3Au);
        }
      }
    }
    uint64_t v3 = 0;
  }
LABEL_7:
  objc_msgSend(*(id *)(a1 + 40), "setDidSucceed:", v3, *(_OWORD *)v23, *(void *)&v23[16], v24, v25, v26);
  objc_msgSend(*(id *)(a1 + 40), "setTapToken:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "sessionToken"));
  objc_msgSend(*(id *)(a1 + 40), "setUplinkToken:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "streamTokenForCellularTapType:", 0));
  return objc_msgSend(*(id *)(a1 + 40), "setDownlinkToken:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "streamTokenForCellularTapType:", 1));
}

- (BOOL)unregisterFromTapWithError:(id *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3052000000;
  uint64_t v17 = __Block_byref_object_copy__13;
  uint64_t v18 = __Block_byref_object_dispose__13;
  uint64_t v19 = 0;
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCBasebandAudioTap-unregisterFromTapWithError");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v25 = v5;
      __int16 v26 = 2080;
      uint64_t v27 = "-[AVCBasebandAudioTap unregisterFromTapWithError:]";
      __int16 v28 = 1024;
      int v29 = 192;
      __int16 v30 = 2048;
      v31 = self;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCBasebandAudioTap-unregisterFromTapWithError [%p]", buf, 0x26u);
    }
  }
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__AVCBasebandAudioTap_unregisterFromTapWithError___block_invoke;
  block[3] = &unk_1E6DB6DE8;
  block[4] = self;
  block[5] = &v20;
  void block[6] = &v14;
  dispatch_sync(stateQueue, block);
  if (a3) {
    *a3 = (id)v15[5];
  }
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCBasebandAudioTap-unregisterFromTapWithError");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = *((unsigned __int8 *)v21 + 24);
      *(_DWORD *)buf = 136316162;
      uint64_t v25 = v8;
      __int16 v26 = 2080;
      uint64_t v27 = "-[AVCBasebandAudioTap unregisterFromTapWithError:]";
      __int16 v28 = 1024;
      int v29 = 210;
      __int16 v30 = 2048;
      v31 = self;
      __int16 v32 = 1024;
      int v33 = v10;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCBasebandAudioTap-unregisterFromTapWithError [%p] success=%{BOOL}d", buf, 0x2Cu);
    }
  }
  char v11 = *((unsigned char *)v21 + 24);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  return v11;
}

uint64_t __50__AVCBasebandAudioTap_unregisterFromTapWithError___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return objc_msgSend(*(id *)(a1 + 32), "cleanUpPowerSpectrumMeter", *(_OWORD *)v27, *(void *)&v27[16], v28, v29);
      }
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      uint64_t v20 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return objc_msgSend(*(id *)(a1 + 32), "cleanUpPowerSpectrumMeter", *(_OWORD *)v27, *(void *)&v27[16], v28, v29);
      }
      *(_DWORD *)uint64_t v27 = 136315650;
      *(void *)&v27[4] = v19;
      *(_WORD *)&v27[12] = 2080;
      *(void *)&v27[14] = "-[AVCBasebandAudioTap unregisterFromTapWithError:]_block_invoke";
      *(_WORD *)&v27[22] = 1024;
      LODWORD(v28) = 194;
      uint64_t v21 = " [%s] %s:%d powerSpectrumMeter is nil, implicitly successful unregistration";
      uint64_t v22 = v20;
      uint32_t v23 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v18 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v18 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return objc_msgSend(*(id *)(a1 + 32), "cleanUpPowerSpectrumMeter", *(_OWORD *)v27, *(void *)&v27[16], v28, v29);
      }
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      uint64_t v25 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return objc_msgSend(*(id *)(a1 + 32), "cleanUpPowerSpectrumMeter", *(_OWORD *)v27, *(void *)&v27[16], v28, v29);
      }
      uint64_t v26 = *(void *)(a1 + 32);
      *(_DWORD *)uint64_t v27 = 136316162;
      *(void *)&v27[4] = v24;
      *(_WORD *)&v27[12] = 2080;
      *(void *)&v27[14] = "-[AVCBasebandAudioTap unregisterFromTapWithError:]_block_invoke";
      *(_WORD *)&v27[22] = 1024;
      LODWORD(v28) = 194;
      WORD2(v28) = 2112;
      *(void *)((char *)&v28 + 6) = v18;
      HIWORD(v28) = 2048;
      uint64_t v29 = v26;
      uint64_t v21 = " [%s] %s:%d %@(%p) powerSpectrumMeter is nil, implicitly successful unregistration";
      uint64_t v22 = v25;
      uint32_t v23 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, v21, v27, v23);
    return objc_msgSend(*(id *)(a1 + 32), "cleanUpPowerSpectrumMeter", *(_OWORD *)v27, *(void *)&v27[16], v28, v29);
  }
  uint64_t v3 = a1 + 48;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 unregisterPowerSpectrumForCellularTapType:1 error:*(void *)(*(void *)(a1 + 48) + 8) + 40];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    || *(void *)(*(void *)(*(void *)v3 + 8) + 40))
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __50__AVCBasebandAudioTap_unregisterFromTapWithError___block_invoke_cold_2();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v4 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
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
          uint64_t v14 = *(void *)(a1 + 32);
          uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          *(_DWORD *)uint64_t v27 = 136316418;
          *(void *)&v27[4] = v5;
          *(_WORD *)&v27[12] = 2080;
          *(void *)&v27[14] = "-[AVCBasebandAudioTap unregisterFromTapWithError:]_block_invoke";
          *(_WORD *)&v27[22] = 1024;
          LODWORD(v28) = 197;
          WORD2(v28) = 2112;
          *(void *)((char *)&v28 + 6) = v4;
          HIWORD(v28) = 2048;
          uint64_t v29 = v14;
          __int16 v30 = 2112;
          uint64_t v31 = v15;
          _os_log_error_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to unregister downlink tap with error=%@", v27, 0x3Au);
        }
      }
    }
  }
  int v7 = [*(id *)(*(void *)(a1 + 32) + 24) unregisterPowerSpectrumForCellularTapType:0 error:*(void *)(*(void *)(a1 + 48) + 8) + 40];
  BOOL v8 = 0;
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v7) {
    BOOL v8 = *(unsigned char *)(v9 + 24) != 0;
  }
  *(unsigned char *)(v9 + 24) = v8;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    || *(void *)(*(void *)(*(void *)v3 + 8) + 40))
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __50__AVCBasebandAudioTap_unregisterFromTapWithError___block_invoke_cold_1();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v10 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        int v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        uint64_t v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v16 = *(void *)(a1 + 32);
          uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          *(_DWORD *)uint64_t v27 = 136316418;
          *(void *)&v27[4] = v11;
          *(_WORD *)&v27[12] = 2080;
          *(void *)&v27[14] = "-[AVCBasebandAudioTap unregisterFromTapWithError:]_block_invoke";
          *(_WORD *)&v27[22] = 1024;
          LODWORD(v28) = 202;
          WORD2(v28) = 2112;
          *(void *)((char *)&v28 + 6) = v10;
          HIWORD(v28) = 2048;
          uint64_t v29 = v16;
          __int16 v30 = 2112;
          uint64_t v31 = v17;
          _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to unregister uplink tap with error=%@", v27, 0x3Au);
        }
      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "cleanUpPowerSpectrumMeter", *(_OWORD *)v27, *(void *)&v27[16], v28, v29);
}

+ (id)registerForTapWithError:(id *)a3
{
  uint64_t v4 = +[AVCBasebandAudioTap sharedInstance];

  return [(AVCBasebandAudioTap *)v4 registerForTapWithError:a3];
}

+ (BOOL)unregisterFromTapWithError:(id *)a3
{
  uint64_t v4 = +[AVCBasebandAudioTap sharedInstance];

  return [(AVCBasebandAudioTap *)v4 unregisterFromTapWithError:a3];
}

- (void)meterServerDidDisconnect:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  [(AVCBasebandAudioTap *)self cleanUpPowerSpectrumMeter];
  id v4 = [(AVCBasebandAudioTap *)self dispatchedDelegate];
  if (v4)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__AVCBasebandAudioTap_meterServerDidDisconnect___block_invoke;
    block[3] = &unk_1E6DB3E40;
    block[4] = v4;
    block[5] = self;
    dispatch_async(delegateQueue, block);
  }
}

uint64_t __48__AVCBasebandAudioTap_meterServerDidDisconnect___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) serverDidDisconnectForTap:*(void *)(a1 + 40)];
}

- (void)init
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate delegateQueue", v2, v3, v4, v5, v6);
}

void __47__AVCBasebandAudioTap_registerForTapWithError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to register downlink tap with error=%@");
}

void __47__AVCBasebandAudioTap_registerForTapWithError___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to register uplink tap with error=%@");
}

void __47__AVCBasebandAudioTap_registerForTapWithError___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d error=%@");
}

void __50__AVCBasebandAudioTap_unregisterFromTapWithError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to unregister uplink tap with error=%@");
}

void __50__AVCBasebandAudioTap_unregisterFromTapWithError___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to unregister downlink tap with error=%@");
}

@end