@interface VCSecurityKeyManager
- (BOOL)addSecurityKeyMaterial:(id)a3;
- (BOOL)addSecurityKeyMaterial:(id)a3 securityKeyMode:(char)a4;
- (BOOL)associateMKI:(id)a3 withParticipantID:(unint64_t)a4;
- (BOOL)startTimers;
- (VCSecurityKeyManager)initWithDelegate:(id)a3 options:(const tagVCSecurityKeyManagerOptions *)a4;
- (double)firstExpirationTime;
- (double)pruneAllExpiredKeys;
- (id)copyMKMWithPrefix:(id)a3;
- (id)copyMKMWithPrefix:(id)a3 forParticipantID:(unint64_t)a4;
- (id)delegate;
- (id)getLatestRecvKeyMaterial;
- (id)getRecvKeyMaterialWithIndex:(id)a3;
- (id)getSendKeyMaterialWithIndex:(id)a3;
- (id)latestSendKeyMaterialWithSecurityKeyMode:(char)a3;
- (id)logPrefix;
- (int64_t)getNotUsedTimeout;
- (opaqueRTCReporting)reportingAgent;
- (void)adjustMKILength:(id)a3 securityKeyMode:(char)a4;
- (void)dealloc;
- (void)detectInabilityToDecryptSymptom:(id)a3 prefix:(id)a4;
- (void)handlePruneTimerEventAndReschedule;
- (void)notifyEncryptionInfoChange:(id)a3 securityKeyMode:(char)a4;
- (void)pruneRecvKeyMaterialWithDelay:(double)a3;
- (void)pruneSendKeyMaterialWithDelay:(double)a3;
- (void)releaseTimers;
- (void)replaceMKIWithShortMKI:(id)a3;
- (void)scheduleEncryptionRollTimerWithDelay:(double)a3;
- (void)schedulePruneTimer:(double)a3;
- (void)setReportingAgent:(opaqueRTCReporting *)a3;
- (void)start;
- (void)startTimers;
- (void)stop;
- (void)stopTimers;
@end

@implementation VCSecurityKeyManager

- (VCSecurityKeyManager)initWithDelegate:(id)a3 options:(const tagVCSecurityKeyManagerOptions *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)VCSecurityKeyManager;
  v6 = [(VCSecurityKeyManager *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak(&v6->_delegate, a3);
    v7->_sendKeys = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v7->_receiveKeys = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v7->_prunePendingReceiveKeys = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v7->_latestSendKeyIndex = 0;
    v7->_latestReceiveKeyIndex = 0;
    v7->_keyIndexNotReceived = 0;
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v7->_keyManagerQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCSecurityKeyManager.keyManagerQueue", 0, CustomRootQueue);
    v7->_unknownKeyIndexList = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (a4)
    {
      v7->_shortMKIForOneToOneEnabled = a4->var0;
      v7->_shortMKIForGFTEnabled = a4->var1;
    }
    v7->_forceRemoteMKMMissing = +[VCDefaults BOOLeanValueForKey:@"forceRemoteMKMMissing" defaultValue:0];
    +[VCDefaults getDoubleValueForKey:@"keyMaterialNotUsedTimeout" defaultValue:35.0];
    v7->_keyMaterialNotUsedTimeout = v9;
    if ((VCSecurityKeyManager *)objc_opt_class() == v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v21 = v11;
          __int16 v22 = 2080;
          v23 = "-[VCSecurityKeyManager initWithDelegate:options:]";
          __int16 v24 = 1024;
          int v25 = 121;
          __int16 v26 = 2048;
          id v27 = a3;
          v13 = " [%s] %s:%d security delegate %p";
          v14 = v12;
          uint32_t v15 = 38;
LABEL_14:
          _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v10 = (__CFString *)[(VCSecurityKeyManager *)v7 performSelector:sel_logPrefix];
      }
      else {
        v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v21 = v16;
          __int16 v22 = 2080;
          v23 = "-[VCSecurityKeyManager initWithDelegate:options:]";
          __int16 v24 = 1024;
          int v25 = 121;
          __int16 v26 = 2112;
          id v27 = v10;
          __int16 v28 = 2048;
          v29 = v7;
          __int16 v30 = 2048;
          id v31 = a3;
          v13 = " [%s] %s:%d %@(%p) security delegate %p";
          v14 = v17;
          uint32_t v15 = 58;
          goto LABEL_14;
        }
      }
    }
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((VCSecurityKeyManager *)objc_opt_class() == self)
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
        uint32_t v15 = "-[VCSecurityKeyManager dealloc]";
        __int16 v16 = 1024;
        int v17 = 127;
        v6 = " [%s] %s:%d deallocating";
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
      v3 = (__CFString *)[(VCSecurityKeyManager *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
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
        uint32_t v15 = "-[VCSecurityKeyManager dealloc]";
        __int16 v16 = 1024;
        int v17 = 127;
        __int16 v18 = 2112;
        objc_super v19 = v3;
        __int16 v20 = 2048;
        uint64_t v21 = self;
        v6 = " [%s] %s:%d %@(%p) deallocating";
        v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  [(VCSecurityKeyManager *)self releaseTimers];
  objc_storeWeak(&self->_delegate, 0);
  objc_storeWeak(&self->_reportingAgentWeak, 0);

  dispatch_release((dispatch_object_t)self->_keyManagerQueue);
  v11.receiver = self;
  v11.super_class = (Class)VCSecurityKeyManager;
  [(VCSecurityKeyManager *)&v11 dealloc];
}

- (id)delegate
{
  if (self->_isRunning) {
    return objc_loadWeak(&self->_delegate);
  }
  else {
    return 0;
  }
}

- (int64_t)getNotUsedTimeout
{
  return (uint64_t)self->_keyMaterialNotUsedTimeout;
}

- (id)logPrefix
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"instance=%p", self);
}

- (void)start
{
  v3[5] = *MEMORY[0x1E4F143B8];
  keyManagerQueue = self->_keyManagerQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __29__VCSecurityKeyManager_start__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(keyManagerQueue, v3);
}

void __29__VCSecurityKeyManager_start__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[136])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315650;
        uint64_t v12 = v3;
        __int16 v13 = 2080;
        __int16 v14 = "-[VCSecurityKeyManager start]_block_invoke";
        __int16 v15 = 1024;
        int v16 = 162;
        v5 = " [%s] %s:%d Security key manager is already started";
        v6 = v4;
        uint32_t v7 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v11, v7);
      }
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 136) = [v2 startTimers];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (*(unsigned char *)(*(void *)(a1 + 32) + 136)) {
          v10 = @"started";
        }
        else {
          v10 = @"failed to start";
        }
        int v11 = 136315906;
        uint64_t v12 = v8;
        __int16 v13 = 2080;
        __int16 v14 = "-[VCSecurityKeyManager start]_block_invoke";
        __int16 v15 = 1024;
        int v16 = 160;
        __int16 v17 = 2112;
        __int16 v18 = v10;
        v5 = " [%s] %s:%d Security key manager start result=[%@]";
        v6 = v9;
        uint32_t v7 = 38;
        goto LABEL_11;
      }
    }
  }
}

- (void)stop
{
  v3[5] = *MEMORY[0x1E4F143B8];
  keyManagerQueue = self->_keyManagerQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __28__VCSecurityKeyManager_stop__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(keyManagerQueue, v3);
}

void __28__VCSecurityKeyManager_stop__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 136))
  {
    *(unsigned char *)(v1 + 136) = 0;
    [*(id *)(a1 + 32) stopTimers];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v2 = VRTraceErrorLogLevelToCSTR();
      uint64_t v3 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315650;
        uint64_t v7 = v2;
        __int16 v8 = 2080;
        uint64_t v9 = "-[VCSecurityKeyManager stop]_block_invoke";
        __int16 v10 = 1024;
        int v11 = 172;
        uint64_t v4 = " [%s] %s:%d Security key manager stopped";
LABEL_8:
        _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v6, 0x1Cu);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315650;
      uint64_t v7 = v5;
      __int16 v8 = 2080;
      uint64_t v9 = "-[VCSecurityKeyManager stop]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 174;
      uint64_t v4 = " [%s] %s:%d MW control channel already stopped";
      goto LABEL_8;
    }
  }
}

- (void)releaseTimers
{
  pruneTimer = self->_pruneTimer;
  if (pruneTimer)
  {
    dispatch_source_cancel(pruneTimer);
    uint64_t v4 = self->_pruneTimer;
    if (v4)
    {
      dispatch_release(v4);
      self->_pruneTimer = 0;
    }
  }
  encryptionKeyRollTimer = self->_encryptionKeyRollTimer;
  if (encryptionKeyRollTimer)
  {
    dispatch_source_cancel(encryptionKeyRollTimer);
    int v6 = self->_encryptionKeyRollTimer;
    if (v6)
    {
      dispatch_release(v6);
      self->_encryptionKeyRollTimer = 0;
    }
  }
}

- (BOOL)startTimers
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_keyManagerQueue);
  self->_pruneTimer = v3;
  if (!v3)
  {
    if ((VCSecurityKeyManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSecurityKeyManager startTimers]();
        }
      }
      goto LABEL_23;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v8 = (__CFString *)[(VCSecurityKeyManager *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_23;
    }
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    int v11 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v19 = v10;
    __int16 v20 = 2080;
    uint64_t v21 = "-[VCSecurityKeyManager startTimers]";
    __int16 v22 = 1024;
    int v23 = 196;
    __int16 v24 = 2112;
    int v25 = v8;
    __int16 v26 = 2048;
    id v27 = self;
    uint64_t v12 = " [%s] %s:%d %@(%p) Failed to create pruneTimer";
LABEL_25:
    _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0x30u);
    goto LABEL_23;
  }
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __35__VCSecurityKeyManager_startTimers__block_invoke;
  handler[3] = &unk_1E6DB3DC8;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v3, handler);
  pruneTimer = self->_pruneTimer;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __35__VCSecurityKeyManager_startTimers__block_invoke_2;
  v16[3] = &unk_1E6DB3DC8;
  v16[4] = self;
  dispatch_source_set_cancel_handler(pruneTimer, v16);
  dispatch_resume((dispatch_object_t)self->_pruneTimer);
  uint64_t v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_keyManagerQueue);
  self->_encryptionKeyRollTimer = v5;
  if (v5)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __35__VCSecurityKeyManager_startTimers__block_invoke_56;
    v15[3] = &unk_1E6DB3DC8;
    v15[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v5, v15);
    encryptionKeyRollTimer = self->_encryptionKeyRollTimer;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __35__VCSecurityKeyManager_startTimers__block_invoke_57;
    v14[3] = &unk_1E6DB3DC8;
    v14[4] = self;
    dispatch_source_set_cancel_handler(encryptionKeyRollTimer, v14);
    dispatch_resume((dispatch_object_t)self->_encryptionKeyRollTimer);
    return 1;
  }
  if ((VCSecurityKeyManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSecurityKeyManager startTimers]();
      }
    }
    goto LABEL_23;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v9 = (__CFString *)[(VCSecurityKeyManager *)self performSelector:sel_logPrefix];
  }
  else {
    uint64_t v9 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    int v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v19 = v13;
      __int16 v20 = 2080;
      uint64_t v21 = "-[VCSecurityKeyManager startTimers]";
      __int16 v22 = 1024;
      int v23 = 208;
      __int16 v24 = 2112;
      int v25 = v9;
      __int16 v26 = 2048;
      id v27 = self;
      uint64_t v12 = " [%s] %s:%d %@(%p) Failed to create encryptionKeyRollTimer";
      goto LABEL_25;
    }
  }
LABEL_23:
  [(VCSecurityKeyManager *)self releaseTimers];
  return 0;
}

uint64_t __35__VCSecurityKeyManager_startTimers__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handlePruneTimerEventAndReschedule];
}

void __35__VCSecurityKeyManager_startTimers__block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 120);
  if (v2)
  {
    dispatch_release(v2);
    *(void *)(*(void *)(a1 + 32) + 120) = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      __int16 v8 = "-[VCSecurityKeyManager startTimers]_block_invoke_2";
      __int16 v9 = 1024;
      int v10 = 202;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d pruneTimer cancelled", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

uint64_t __35__VCSecurityKeyManager_startTimers__block_invoke_56(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315906;
      uint64_t v6 = v2;
      __int16 v7 = 2080;
      __int16 v8 = "-[VCSecurityKeyManager startTimers]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 210;
      __int16 v11 = 1024;
      int v12 = 30;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Encryption key material has failed to roll at boundary=%d seconds, calling didEncryptionKeyRollTimeout", (uint8_t *)&v5, 0x22u);
    }
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "didEncryptionKeyRollTimeout");
}

void __35__VCSecurityKeyManager_startTimers__block_invoke_57(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 128);
  if (v2)
  {
    dispatch_release(v2);
    *(void *)(*(void *)(a1 + 32) + 128) = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      __int16 v8 = "-[VCSecurityKeyManager startTimers]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 215;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Encryption roll timer cancelled", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)stopTimers
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_pruneTimer)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315650;
        uint64_t v8 = v3;
        __int16 v9 = 2080;
        int v10 = "-[VCSecurityKeyManager stopTimers]";
        __int16 v11 = 1024;
        int v12 = 230;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Cancelling pruneTimer", (uint8_t *)&v7, 0x1Cu);
      }
    }
    dispatch_source_cancel((dispatch_source_t)self->_pruneTimer);
  }
  if (self->_encryptionKeyRollTimer)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315650;
        uint64_t v8 = v5;
        __int16 v9 = 2080;
        int v10 = "-[VCSecurityKeyManager stopTimers]";
        __int16 v11 = 1024;
        int v12 = 234;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Cancelling encryption key roll timer", (uint8_t *)&v7, 0x1Cu);
      }
    }
    dispatch_source_cancel((dispatch_source_t)self->_encryptionKeyRollTimer);
  }
}

- (BOOL)addSecurityKeyMaterial:(id)a3
{
  return [(VCSecurityKeyManager *)self addSecurityKeyMaterial:a3 securityKeyMode:2];
}

- (BOOL)addSecurityKeyMaterial:(id)a3 securityKeyMode:(char)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [a3 objectForKeyedSubscript:@"SecurityKeyIndex"];
  if (v7)
  {
    uint64_t v8 = [a3 objectForKeyedSubscript:@"SecurityKeyIndex"];
    keyManagerQueue = self->_keyManagerQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__VCSecurityKeyManager_addSecurityKeyMaterial_securityKeyMode___block_invoke;
    block[3] = &unk_1E6DB5238;
    block[4] = self;
    block[5] = v8;
    block[6] = a3;
    char v12 = a4;
    dispatch_sync(keyManagerQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCSecurityKeyManager addSecurityKeyMaterial:securityKeyMode:]();
    }
  }
  return v7 != 0;
}

void __63__VCSecurityKeyManager_addSecurityKeyMaterial_securityKeyMode___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:*(void *)(a1 + 40)]
    || [*(id *)(*(void *)(a1 + 32) + 48) objectForKeyedSubscript:*(void *)(a1 + 40)])
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v3 = VRTraceErrorLogLevelToCSTR();
        uint64_t v4 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v6 = *(void *)(a1 + 32);
          uint64_t v5 = *(void *)(a1 + 40);
          uint64_t v8 = *(void *)(v6 + 40);
          uint64_t v7 = *(void *)(v6 + 48);
          *(_DWORD *)v49 = 136316418;
          *(void *)&v49[4] = v3;
          *(_WORD *)&v49[12] = 2080;
          *(void *)&v49[14] = "-[VCSecurityKeyManager addSecurityKeyMaterial:securityKeyMode:]_block_invoke";
          *(_WORD *)&v49[22] = 1024;
          LODWORD(v50) = 255;
          WORD2(v50) = 2112;
          *(void *)((char *)&v50 + 6) = v5;
          HIWORD(v50) = 2112;
          uint64_t v51 = v8;
          *(_WORD *)v52 = 2112;
          *(void *)&v52[2] = v7;
          __int16 v9 = " [%s] %s:%d Found duplicate key index '%@': sendKeys (%@), receiveKeys (%@) passed down from IDS. Updating key material";
          int v10 = v4;
          uint32_t v11 = 58;
LABEL_13:
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, v49, v11);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v2 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        uint64_t v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = *(void *)(a1 + 32);
          uint64_t v15 = *(void *)(a1 + 40);
          uint64_t v16 = *(void *)(v14 + 40);
          uint64_t v17 = *(void *)(v14 + 48);
          *(_DWORD *)v49 = 136316930;
          *(void *)&v49[4] = v12;
          *(_WORD *)&v49[12] = 2080;
          *(void *)&v49[14] = "-[VCSecurityKeyManager addSecurityKeyMaterial:securityKeyMode:]_block_invoke";
          *(_WORD *)&v49[22] = 1024;
          LODWORD(v50) = 255;
          WORD2(v50) = 2112;
          *(void *)((char *)&v50 + 6) = v2;
          HIWORD(v50) = 2048;
          uint64_t v51 = v14;
          *(_WORD *)v52 = 2112;
          *(void *)&v52[2] = v15;
          *(_WORD *)&v52[10] = 2112;
          *(void *)&v52[12] = v16;
          *(_WORD *)&v52[20] = 2112;
          *(void *)&v52[22] = v17;
          __int16 v9 = " [%s] %s:%d %@(%p) Found duplicate key index '%@': sendKeys (%@), receiveKeys (%@) passed down from IDS. "
               "Updating key material";
          int v10 = v13;
          uint32_t v11 = 78;
          goto LABEL_13;
        }
      }
    }
  }
  uint64_t v18 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v18 + 90))
  {
    [*(id *)(v18 + 48) setObject:*(void *)(a1 + 48) forKeyedSubscript:*(void *)(a1 + 40)];
LABEL_20:
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", @"SecurityLocallyGenerated", *(_OWORD *)v49, *(void *)&v49[16], v50, v51, *(_OWORD *)v52, *(_OWORD *)&v52[16]), "BOOLValue"))
    {
      [*(id *)(*(void *)(a1 + 32) + 40) setObject:*(void *)(a1 + 48) forKeyedSubscript:*(void *)(a1 + 40)];
      if (!VCMediaKeyIndex_isEqual(*(void *)(*(void *)(a1 + 32) + 64), *(void *)(a1 + 40)))
      {
        [*(id *)(a1 + 32) notifyEncryptionInfoChange:*(void *)(a1 + 48) securityKeyMode:*(char *)(a1 + 56)];
        VCMediaKeyIndex_ReleaseAndCopyNewValue((const void **)(*(void *)(a1 + 32) + 64), *(void **)(a1 + 40));
        LocalCenter = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(LocalCenter, @"VCSecurityKeyManagerNotification_SendKeyMaterialChanged", *(const void **)(a1 + 32), *(CFDictionaryRef *)(a1 + 48), 1u);
        if (objc_opt_class() == *(void *)(a1 + 32))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            goto LABEL_45;
          }
          uint64_t v39 = VRTraceErrorLogLevelToCSTR();
          v40 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_45;
          }
          uint64_t v41 = *(void *)(a1 + 40);
          *(_DWORD *)v49 = 136315906;
          *(void *)&v49[4] = v39;
          *(_WORD *)&v49[12] = 2080;
          *(void *)&v49[14] = "-[VCSecurityKeyManager addSecurityKeyMaterial:securityKeyMode:]_block_invoke";
          *(_WORD *)&v49[22] = 1024;
          LODWORD(v50) = 278;
          WORD2(v50) = 2112;
          *(void *)((char *)&v50 + 6) = v41;
          v42 = " [%s] %s:%d Received keyIndex '%@', calling scheduleEncryptionRollTimer";
          v43 = v40;
          uint32_t v44 = 38;
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            __int16 v22 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
          }
          else {
            __int16 v22 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            goto LABEL_45;
          }
          uint64_t v45 = VRTraceErrorLogLevelToCSTR();
          v46 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_45;
          }
          uint64_t v47 = *(void *)(a1 + 32);
          uint64_t v48 = *(void *)(a1 + 40);
          *(_DWORD *)v49 = 136316418;
          *(void *)&v49[4] = v45;
          *(_WORD *)&v49[12] = 2080;
          *(void *)&v49[14] = "-[VCSecurityKeyManager addSecurityKeyMaterial:securityKeyMode:]_block_invoke";
          *(_WORD *)&v49[22] = 1024;
          LODWORD(v50) = 278;
          WORD2(v50) = 2112;
          *(void *)((char *)&v50 + 6) = v22;
          HIWORD(v50) = 2048;
          uint64_t v51 = v47;
          *(_WORD *)v52 = 2112;
          *(void *)&v52[2] = v48;
          v42 = " [%s] %s:%d %@(%p) Received keyIndex '%@', calling scheduleEncryptionRollTimer";
          v43 = v46;
          uint32_t v44 = 58;
        }
        _os_log_impl(&dword_1E1EA4000, v43, OS_LOG_TYPE_DEFAULT, v42, v49, v44);
LABEL_45:
        objc_msgSend(*(id *)(a1 + 32), "scheduleEncryptionRollTimerWithDelay:", 1230.0, *(void *)v49, *(_OWORD *)&v49[8], v50, v51, *(void *)v52, *(void *)&v52[8]);
      }
LABEL_46:
      VCMediaKeyIndex_ReleaseAndCopyNewValue((const void **)(*(void *)(a1 + 32) + 72), *(void **)(a1 + 40));
      return;
    }
    int v23 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(v23, @"VCSecurityKeyManagerNotification_ReceiveKeyMaterialChanged", *(const void **)(a1 + 32), *(CFDictionaryRef *)(a1 + 48), 1u);
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_36;
      }
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      __int16 v26 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      uint64_t v27 = *(void *)(a1 + 40);
      uint64_t v28 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"SecurityIDSParticipantID"];
      uint64_t v29 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"SecurityShortKeyIndexLength"];
      *(_DWORD *)v49 = 136316418;
      *(void *)&v49[4] = v25;
      *(_WORD *)&v49[12] = 2080;
      *(void *)&v49[14] = "-[VCSecurityKeyManager addSecurityKeyMaterial:securityKeyMode:]_block_invoke";
      *(_WORD *)&v49[22] = 1024;
      LODWORD(v50) = 285;
      WORD2(v50) = 2112;
      *(void *)((char *)&v50 + 6) = v27;
      HIWORD(v50) = 2112;
      uint64_t v51 = v28;
      *(_WORD *)v52 = 2112;
      *(void *)&v52[2] = v29;
      __int16 v30 = " [%s] %s:%d Received keyIndex '%@' for participantID '%@' with shortMKILength '%@', calling resetDecryptionTimeout";
      id v31 = v26;
      uint32_t v32 = 58;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v24 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        __int16 v24 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_36;
      }
      uint64_t v33 = VRTraceErrorLogLevelToCSTR();
      v34 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      uint64_t v35 = *(void *)(a1 + 32);
      uint64_t v36 = *(void *)(a1 + 40);
      uint64_t v37 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"SecurityIDSParticipantID"];
      uint64_t v38 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"SecurityShortKeyIndexLength"];
      *(_DWORD *)v49 = 136316930;
      *(void *)&v49[4] = v33;
      *(_WORD *)&v49[12] = 2080;
      *(void *)&v49[14] = "-[VCSecurityKeyManager addSecurityKeyMaterial:securityKeyMode:]_block_invoke";
      *(_WORD *)&v49[22] = 1024;
      LODWORD(v50) = 285;
      WORD2(v50) = 2112;
      *(void *)((char *)&v50 + 6) = v24;
      HIWORD(v50) = 2048;
      uint64_t v51 = v35;
      *(_WORD *)v52 = 2112;
      *(void *)&v52[2] = v36;
      *(_WORD *)&v52[10] = 2112;
      *(void *)&v52[12] = v37;
      *(_WORD *)&v52[20] = 2112;
      *(void *)&v52[22] = v38;
      __int16 v30 = " [%s] %s:%d %@(%p) Received keyIndex '%@' for participantID '%@' with shortMKILength '%@', calling resetDecryptionTimeout";
      id v31 = v34;
      uint32_t v32 = 78;
    }
    _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, v30, v49, v32);
LABEL_36:
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(void *)v49, *(_OWORD *)&v49[8], v50, v51, *(void *)v52, *(void *)&v52[8], *(void *)&v52[16], *(void *)&v52[24]), "resetDecryptionTimeout");
    goto LABEL_46;
  }
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", @"SecurityLocallyGenerated"), "BOOLValue"))goto LABEL_20; {
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  }
  {
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    __int16 v20 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v49 = 136315650;
      *(void *)&v49[4] = v19;
      *(_WORD *)&v49[12] = 2080;
      *(void *)&v49[14] = "-[VCSecurityKeyManager addSecurityKeyMaterial:securityKeyMode:]_block_invoke";
      *(_WORD *)&v49[22] = 1024;
      LODWORD(v50) = 259;
      _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Will not add remote MKM per default override.", v49, 0x1Cu);
    }
  }
}

- (id)getSendKeyMaterialWithIndex:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  int v10 = __Block_byref_object_copy__27;
  uint32_t v11 = __Block_byref_object_dispose__27;
  uint64_t v12 = 0;
  keyManagerQueue = self->_keyManagerQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__VCSecurityKeyManager_getSendKeyMaterialWithIndex___block_invoke;
  v6[3] = &unk_1E6DB6928;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = &v7;
  dispatch_sync(keyManagerQueue, v6);
  uint64_t v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __52__VCSecurityKeyManager_getSendKeyMaterialWithIndex___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:*(void *)(a1 + 40)])
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return;
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return;
      }
      uint64_t v16 = *(__CFString **)(a1 + 40);
      int v17 = [*(id *)(*(void *)(a1 + 32) + 40) count];
      int v26 = 136316162;
      uint64_t v27 = v14;
      __int16 v28 = 2080;
      uint64_t v29 = "-[VCSecurityKeyManager getSendKeyMaterialWithIndex:]_block_invoke";
      __int16 v30 = 1024;
      int v31 = 302;
      __int16 v32 = 2112;
      uint64_t v33 = v16;
      __int16 v34 = 1024;
      LODWORD(v35) = v17;
      uint64_t v18 = " [%s] %s:%d Cannot find keyIndex '%@' in send keys array of %d elements";
      uint64_t v19 = v15;
      uint32_t v20 = 44;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v3 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v3 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return;
      }
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      __int16 v22 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return;
      }
      uint64_t v24 = *(void *)(a1 + 32);
      uint64_t v23 = *(void *)(a1 + 40);
      int v25 = [*(id *)(v24 + 40) count];
      int v26 = 136316674;
      uint64_t v27 = v21;
      __int16 v28 = 2080;
      uint64_t v29 = "-[VCSecurityKeyManager getSendKeyMaterialWithIndex:]_block_invoke";
      __int16 v30 = 1024;
      int v31 = 302;
      __int16 v32 = 2112;
      uint64_t v33 = v3;
      __int16 v34 = 2048;
      uint64_t v35 = v24;
      __int16 v36 = 2112;
      uint64_t v37 = v23;
      __int16 v38 = 1024;
      int v39 = v25;
      uint64_t v18 = " [%s] %s:%d %@(%p) Cannot find keyIndex '%@' in send keys array of %d elements";
      uint64_t v19 = v22;
      uint32_t v20 = 64;
    }
    _os_log_error_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v26, v20);
    return;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = (id)[*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(__CFString **)(a1 + 40);
        int v26 = 136315906;
        uint64_t v27 = v4;
        __int16 v28 = 2080;
        uint64_t v29 = "-[VCSecurityKeyManager getSendKeyMaterialWithIndex:]_block_invoke";
        __int16 v30 = 1024;
        int v31 = 300;
        __int16 v32 = 2112;
        uint64_t v33 = v6;
        uint64_t v7 = " [%s] %s:%d Found keyIndex '%@' in send keys in key manager";
        uint64_t v8 = v5;
        uint32_t v9 = 38;
LABEL_15:
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v26, v9);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint32_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v13 = *(void *)(a1 + 40);
        int v26 = 136316418;
        uint64_t v27 = v10;
        __int16 v28 = 2080;
        uint64_t v29 = "-[VCSecurityKeyManager getSendKeyMaterialWithIndex:]_block_invoke";
        __int16 v30 = 1024;
        int v31 = 300;
        __int16 v32 = 2112;
        uint64_t v33 = v2;
        __int16 v34 = 2048;
        uint64_t v35 = v12;
        __int16 v36 = 2112;
        uint64_t v37 = v13;
        uint64_t v7 = " [%s] %s:%d %@(%p) Found keyIndex '%@' in send keys in key manager";
        uint64_t v8 = v11;
        uint32_t v9 = 58;
        goto LABEL_15;
      }
    }
  }
}

- (id)getRecvKeyMaterialWithIndex:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__27;
  uint32_t v11 = __Block_byref_object_dispose__27;
  uint64_t v12 = 0;
  keyManagerQueue = self->_keyManagerQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__VCSecurityKeyManager_getRecvKeyMaterialWithIndex___block_invoke;
  v6[3] = &unk_1E6DB6928;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = &v7;
  dispatch_sync(keyManagerQueue, v6);
  uint64_t v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __52__VCSecurityKeyManager_getRecvKeyMaterialWithIndex___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 48) objectForKeyedSubscript:*(void *)(a1 + 40)])
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = (id)[*(id *)(*(void *)(a1 + 32) + 48) objectForKeyedSubscript:*(void *)(a1 + 40)];
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v3 = VRTraceErrorLogLevelToCSTR();
        uint64_t v4 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v6 = *(__CFString **)(a1 + 32);
          uint64_t v5 = *(void *)(a1 + 40);
          int v7 = [v6[1].data count];
          int v16 = 136316418;
          uint64_t v17 = v3;
          __int16 v18 = 2080;
          uint64_t v19 = "-[VCSecurityKeyManager getRecvKeyMaterialWithIndex:]_block_invoke";
          __int16 v20 = 1024;
          int v21 = 314;
          __int16 v22 = 2048;
          uint64_t v23 = v6;
          __int16 v24 = 2112;
          uint64_t v25 = v5;
          __int16 v26 = 1024;
          LODWORD(v27) = v7;
          uint64_t v8 = " [%s] %s:%d %p Found keyIndex '%@' in receive keys array of %d elements";
          uint64_t v9 = v4;
          uint32_t v10 = 54;
LABEL_12:
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v16, v10);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v2 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        uint64_t v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = *(void *)(a1 + 32);
          uint64_t v13 = *(void *)(a1 + 40);
          int v15 = [*(id *)(v14 + 48) count];
          int v16 = 136316930;
          uint64_t v17 = v11;
          __int16 v18 = 2080;
          uint64_t v19 = "-[VCSecurityKeyManager getRecvKeyMaterialWithIndex:]_block_invoke";
          __int16 v20 = 1024;
          int v21 = 314;
          __int16 v22 = 2112;
          uint64_t v23 = v2;
          __int16 v24 = 2048;
          uint64_t v25 = v14;
          __int16 v26 = 2048;
          uint64_t v27 = v14;
          __int16 v28 = 2112;
          uint64_t v29 = v13;
          __int16 v30 = 1024;
          int v31 = v15;
          uint64_t v8 = " [%s] %s:%d %@(%p) %p Found keyIndex '%@' in receive keys array of %d elements";
          uint64_t v9 = v12;
          uint32_t v10 = 74;
          goto LABEL_12;
        }
      }
    }
  }
}

- (void)notifyEncryptionInfoChange:(id)a3 securityKeyMode:(char)a4
{
  uint64_t v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)[a3 mutableCopy];
  [(VCSecurityKeyManager *)self adjustMKILength:v6 securityKeyMode:v4];
  objc_msgSend(-[VCSecurityKeyManager delegate](self, "delegate"), "handleEncryptionInfoChange:", v6);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136316162;
      uint64_t v10 = v7;
      __int16 v11 = 2080;
      uint64_t v12 = "-[VCSecurityKeyManager notifyEncryptionInfoChange:securityKeyMode:]";
      __int16 v13 = 1024;
      int v14 = 324;
      __int16 v15 = 1024;
      int v16 = 324;
      __int16 v17 = 2112;
      __int16 v18 = v6;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSecurityKeyManager.m:%d: Notified of new keyMaterial '%@'", (uint8_t *)&v9, 0x2Cu);
    }
  }
}

- (void)replaceMKIWithShortMKI:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[a3 objectForKeyedSubscript:@"SecurityShortKeyIndexLength"];
  v18[0] = 0;
  v18[1] = 0;
  VCMediaKeyIndex_FullKeyBytes((void *)[a3 objectForKeyedSubscript:@"SecurityKeyIndex"], (const char *)v18);
  uint64_t v5 = -[VCMediaKeyIndex initWithBytes:bufferSize:uniquePrefixLength:]([VCMediaKeyIndex alloc], "initWithBytes:bufferSize:uniquePrefixLength:", v18, 16, [v4 unsignedLongLongValue]);
  [a3 setObject:v5 forKeyedSubscript:@"SecurityKeyIndex"];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136316162;
      uint64_t v9 = v6;
      __int16 v10 = 2080;
      __int16 v11 = "-[VCSecurityKeyManager replaceMKIWithShortMKI:]";
      __int16 v12 = 1024;
      int v13 = 334;
      __int16 v14 = 1024;
      int v15 = 334;
      __int16 v16 = 2112;
      __int16 v17 = v5;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSecurityKeyManager.m:%d: Adjusted mediaKeyIndex to '%@'", (uint8_t *)&v8, 0x2Cu);
    }
  }
}

- (void)adjustMKILength:(id)a3 securityKeyMode:(char)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  switch(a4)
  {
    case -1:
    case 3:
      int v6 = a4;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        int v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v9 = 136316162;
          uint64_t v10 = v7;
          __int16 v11 = 2080;
          __int16 v12 = "-[VCSecurityKeyManager adjustMKILength:securityKeyMode:]";
          __int16 v13 = 1024;
          int v14 = 355;
          __int16 v15 = 1024;
          int v16 = v6;
          __int16 v17 = 2112;
          id v18 = a3;
          _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d MKI length adjustment for invalid key mode=%d requested for keyMaterial=%@", (uint8_t *)&v9, 0x2Cu);
        }
      }
      break;
    case 0:
      if (self->_shortMKIForGFTEnabled && VCFeatureFlagManager_UseTLE()) {
        goto LABEL_10;
      }
      break;
    case 1:
      if (self->_shortMKIForOneToOneEnabled && VCFeatureFlagManager_U1AuthTagEnabled())
      {
LABEL_10:
        if (VCFeatureFlagManager_UseShortMKI())
        {
          [(VCSecurityKeyManager *)self replaceMKIWithShortMKI:a3];
        }
      }
      break;
    default:
      return;
  }
}

- (id)latestSendKeyMaterialWithSecurityKeyMode:(char)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x3052000000;
  __int16 v11 = __Block_byref_object_copy__27;
  __int16 v12 = __Block_byref_object_dispose__27;
  uint64_t v13 = 0;
  keyManagerQueue = self->_keyManagerQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__VCSecurityKeyManager_latestSendKeyMaterialWithSecurityKeyMode___block_invoke;
  v6[3] = &unk_1E6DB7A38;
  v6[4] = self;
  v6[5] = &v8;
  char v7 = a3;
  dispatch_sync(keyManagerQueue, v6);
  uint64_t v4 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __65__VCSecurityKeyManager_latestSendKeyMaterialWithSecurityKeyMode___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  *(void *)(*(void *)(*(void *)(v2 + 8) + 8) + 40) = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32)+ 40), "objectForKeyedSubscript:", *(void *)(*(void *)(a1 + 32) + 64)), "mutableCopy");
  uint64_t v3 = *(void *)(*(void *)(*(void *)(v2 + 8) + 8) + 40);
  if (v3
    && ([*(id *)(a1 + 32) adjustMKILength:v3 securityKeyMode:*(char *)(a1 + 48)],
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)))
  {
    if (objc_opt_class() == *(void *)v2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        char v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:@"SecurityKeyIndex"];
          int v9 = [*(id *)(*(void *)(a1 + 32) + 40) count];
          int v24 = 136316162;
          uint64_t v25 = v6;
          __int16 v26 = 2080;
          uint64_t v27 = "-[VCSecurityKeyManager latestSendKeyMaterialWithSecurityKeyMode:]_block_invoke";
          __int16 v28 = 1024;
          int v29 = 370;
          __int16 v30 = 2112;
          uint64_t v31 = v8;
          __int16 v32 = 1024;
          LODWORD(v33) = v9;
          uint64_t v10 = " [%s] %s:%d Found _latestSendKeyIndex '%@' in send keys array of %d elements";
          __int16 v11 = v7;
          uint32_t v12 = 44;
LABEL_16:
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v24, v12);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v4 = (__CFString *)[*(id *)v2 performSelector:sel_logPrefix];
      }
      else {
        uint64_t v4 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        uint64_t v14 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          __int16 v15 = *(void **)(a1 + 32);
          uint64_t v16 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:@"SecurityKeyIndex"];
          int v17 = [*(id *)(*(void *)(a1 + 32) + 40) count];
          int v24 = 136316674;
          uint64_t v25 = v13;
          __int16 v26 = 2080;
          uint64_t v27 = "-[VCSecurityKeyManager latestSendKeyMaterialWithSecurityKeyMode:]_block_invoke";
          __int16 v28 = 1024;
          int v29 = 370;
          __int16 v30 = 2112;
          uint64_t v31 = (uint64_t)v4;
          __int16 v32 = 2048;
          id v33 = v15;
          __int16 v34 = 2112;
          uint64_t v35 = v16;
          __int16 v36 = 1024;
          int v37 = v17;
          uint64_t v10 = " [%s] %s:%d %@(%p) Found _latestSendKeyIndex '%@' in send keys array of %d elements";
          __int16 v11 = v14;
          uint32_t v12 = 64;
          goto LABEL_16;
        }
      }
    }
  }
  else
  {
    if (objc_opt_class() == *(void *)v2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __65__VCSecurityKeyManager_latestSendKeyMaterialWithSecurityKeyMode___block_invoke_cold_1(v18, v2);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v5 = (__CFString *)[*(id *)v2 performSelector:sel_logPrefix];
      }
      else {
        uint64_t v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        __int16 v20 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          id v21 = *(id *)v2;
          uint64_t v22 = *(void *)(*(void *)v2 + 64);
          int v23 = [*(id *)(*(void *)v2 + 40) count];
          int v24 = 136316674;
          uint64_t v25 = v19;
          __int16 v26 = 2080;
          uint64_t v27 = "-[VCSecurityKeyManager latestSendKeyMaterialWithSecurityKeyMode:]_block_invoke";
          __int16 v28 = 1024;
          int v29 = 372;
          __int16 v30 = 2112;
          uint64_t v31 = (uint64_t)v5;
          __int16 v32 = 2048;
          id v33 = v21;
          __int16 v34 = 2112;
          uint64_t v35 = v22;
          __int16 v36 = 1024;
          int v37 = v23;
          _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Cannot find _latestSendKeyIndex '%@' in receive keys array of %d elements. Invalidating it...", (uint8_t *)&v24, 0x40u);
        }
      }
    }
    VCMediaKeyIndex_ReleaseAndCopyNewValue((const void **)(*(void *)v2 + 64), 0);
  }
}

- (id)getLatestRecvKeyMaterial
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x3052000000;
  int v9 = __Block_byref_object_copy__27;
  uint64_t v10 = __Block_byref_object_dispose__27;
  uint64_t v11 = 0;
  keyManagerQueue = self->_keyManagerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__VCSecurityKeyManager_getLatestRecvKeyMaterial__block_invoke;
  block[3] = &unk_1E6DB3EB8;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(keyManagerQueue, block);
  uint64_t v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __48__VCSecurityKeyManager_getLatestRecvKeyMaterial__block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 32);
  if ([*(id *)(*(void *)(a1 + 32) + 48) objectForKeyedSubscript:*(void *)(*(void *)(a1 + 32) + 72)])
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (id)[*((id *)*v2 + 6) objectForKeyedSubscript:*((void *)*v2 + 9)];
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        uint64_t v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          char v7 = (id *)*v2;
          uint64_t v8 = (__CFString *)*((void *)*v2 + 9);
          int v9 = [v7[6] count];
          int v24 = 136316162;
          uint64_t v25 = v5;
          __int16 v26 = 2080;
          uint64_t v27 = "-[VCSecurityKeyManager getLatestRecvKeyMaterial]_block_invoke";
          __int16 v28 = 1024;
          int v29 = 385;
          __int16 v30 = 2112;
          uint64_t v31 = v8;
          __int16 v32 = 1024;
          LODWORD(v33) = v9;
          uint64_t v10 = " [%s] %s:%d Found keyIndex '%@' in receive keys array of %d elements";
          uint64_t v11 = v6;
          uint32_t v12 = 44;
LABEL_15:
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v24, v12);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v3 = (__CFString *)[*v2 performSelector:sel_logPrefix];
      }
      else {
        uint64_t v3 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        uint64_t v14 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          id v15 = *v2;
          uint64_t v16 = *((void *)v15 + 9);
          int v17 = [*((id *)v15 + 6) count];
          int v24 = 136316674;
          uint64_t v25 = v13;
          __int16 v26 = 2080;
          uint64_t v27 = "-[VCSecurityKeyManager getLatestRecvKeyMaterial]_block_invoke";
          __int16 v28 = 1024;
          int v29 = 385;
          __int16 v30 = 2112;
          uint64_t v31 = v3;
          __int16 v32 = 2048;
          id v33 = v15;
          __int16 v34 = 2112;
          uint64_t v35 = v16;
          __int16 v36 = 1024;
          int v37 = v17;
          uint64_t v10 = " [%s] %s:%d %@(%p) Found keyIndex '%@' in receive keys array of %d elements";
          uint64_t v11 = v14;
          uint32_t v12 = 64;
          goto LABEL_15;
        }
      }
    }
  }
  else
  {
    if ((id)objc_opt_class() == *v2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __48__VCSecurityKeyManager_getLatestRecvKeyMaterial__block_invoke_cold_1(v18, (uint64_t)v2);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v4 = (__CFString *)[*v2 performSelector:sel_logPrefix];
      }
      else {
        uint64_t v4 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        __int16 v20 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          id v21 = *v2;
          uint64_t v22 = *((void *)*v2 + 9);
          int v23 = [*((id *)*v2 + 6) count];
          int v24 = 136316674;
          uint64_t v25 = v19;
          __int16 v26 = 2080;
          uint64_t v27 = "-[VCSecurityKeyManager getLatestRecvKeyMaterial]_block_invoke";
          __int16 v28 = 1024;
          int v29 = 387;
          __int16 v30 = 2112;
          uint64_t v31 = v4;
          __int16 v32 = 2048;
          id v33 = v21;
          __int16 v34 = 2112;
          uint64_t v35 = v22;
          __int16 v36 = 1024;
          int v37 = v23;
          _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Cannot find _latestReceiveKeyIndex '%@' in receive keys array of %d elements. Invalidating it...", (uint8_t *)&v24, 0x40u);
        }
      }
    }
    VCMediaKeyIndex_ReleaseAndCopyNewValue((const void **)*v2 + 9, 0);
  }
}

- (void)pruneSendKeyMaterialWithDelay:(double)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  double v5 = micro();
  self->_isSendKeysCleanUpPending = 1;
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  keyManagerQueue = self->_keyManagerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__VCSecurityKeyManager_pruneSendKeyMaterialWithDelay___block_invoke;
  block[3] = &unk_1E6DB4568;
  block[4] = self;
  *(double *)&block[5] = v5;
  dispatch_after(v6, keyManagerQueue, block);
}

uint64_t __54__VCSecurityKeyManager_pruneSendKeyMaterialWithDelay___block_invoke(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id obj = (id)[*(id *)(*(void *)(a1 + 32) + 40) allKeys];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_12;
    }
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    double v5 = *(__CFString **)(*(void *)(a1 + 32) + 40);
    *(_DWORD *)buf = 136315906;
    uint64_t v47 = v3;
    __int16 v48 = 2080;
    v49 = "-[VCSecurityKeyManager pruneSendKeyMaterialWithDelay:]_block_invoke";
    __int16 v50 = 1024;
    int v51 = 401;
    __int16 v52 = 2112;
    uint64_t v53 = v5;
    dispatch_time_t v6 = " [%s] %s:%d Pruning obsolete send keys (%@)";
    char v7 = v4;
    uint32_t v8 = 38;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_12;
    }
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    uint64_t v11 = *(void *)(a1 + 32);
    uint32_t v12 = *(__CFString **)(v11 + 40);
    *(_DWORD *)buf = 136316418;
    uint64_t v47 = v9;
    __int16 v48 = 2080;
    v49 = "-[VCSecurityKeyManager pruneSendKeyMaterialWithDelay:]_block_invoke";
    __int16 v50 = 1024;
    int v51 = 401;
    __int16 v52 = 2112;
    uint64_t v53 = v2;
    __int16 v54 = 2048;
    uint64_t v55 = v11;
    __int16 v56 = 2112;
    v57 = v12;
    dispatch_time_t v6 = " [%s] %s:%d %@(%p) Pruning obsolete send keys (%@)";
    char v7 = v10;
    uint32_t v8 = 58;
  }
  _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
LABEL_12:
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v13 = [obj countByEnumeratingWithState:&v42 objects:v41 count:16];
  if (!v13) {
    goto LABEL_31;
  }
  uint64_t v15 = v13;
  uint64_t v16 = *(void *)v43;
  *(void *)&long long v14 = 136315906;
  long long v39 = v14;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v43 != v16) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = *(__CFString **)(*((void *)&v42 + 1) + 8 * i);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "objectForKeyedSubscript:", v18, v39), "objectForKeyedSubscript:", @"SecurityKeySetTime"), "doubleValue");
      if (v19 < *(double *)(a1 + 40))
      {
        if (objc_opt_class() == *(void *)(a1 + 32))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v27 = VRTraceErrorLogLevelToCSTR();
            __int16 v28 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v39;
              uint64_t v47 = v27;
              __int16 v48 = 2080;
              v49 = "-[VCSecurityKeyManager pruneSendKeyMaterialWithDelay:]_block_invoke";
              __int16 v50 = 1024;
              int v51 = 406;
              __int16 v52 = 2112;
              uint64_t v53 = v18;
              int v24 = v28;
              uint64_t v25 = " [%s] %s:%d Pruned keyIndex '%@'";
              uint32_t v26 = 38;
LABEL_27:
              _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, v26);
            }
          }
        }
        else
        {
          __int16 v20 = &stru_1F3D3E450;
          if (objc_opt_respondsToSelector()) {
            __int16 v20 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v21 = VRTraceErrorLogLevelToCSTR();
            uint64_t v22 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v23 = *(void *)(a1 + 32);
              *(_DWORD *)buf = 136316418;
              uint64_t v47 = v21;
              __int16 v48 = 2080;
              v49 = "-[VCSecurityKeyManager pruneSendKeyMaterialWithDelay:]_block_invoke";
              __int16 v50 = 1024;
              int v51 = 406;
              __int16 v52 = 2112;
              uint64_t v53 = v20;
              __int16 v54 = 2048;
              uint64_t v55 = v23;
              __int16 v56 = 2112;
              v57 = v18;
              int v24 = v22;
              uint64_t v25 = " [%s] %s:%d %@(%p) Pruned keyIndex '%@'";
              uint32_t v26 = 58;
              goto LABEL_27;
            }
          }
        }
        [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:v18];
        [*(id *)(*(void *)(a1 + 32) + 48) removeObjectForKey:v18];
        continue;
      }
    }
    uint64_t v15 = [obj countByEnumeratingWithState:&v42 objects:v41 count:16];
  }
  while (v15);
LABEL_31:
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:*(void *)(*(void *)(a1 + 32) + 64)];
  if (!result)
  {
    VCMediaKeyIndex_ReleaseAndCopyNewValue((const void **)(*(void *)(a1 + 32) + 64), 0);
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v31 = VRTraceErrorLogLevelToCSTR();
        __int16 v32 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v47 = v31;
          __int16 v48 = 2080;
          v49 = "-[VCSecurityKeyManager pruneSendKeyMaterialWithDelay:]_block_invoke";
          __int16 v50 = 1024;
          int v51 = 414;
          id v33 = " [%s] %s:%d Pruned last uplink MKM from sendKeys. calling scheduleEncryptionRollTimer";
          __int16 v34 = v32;
          uint32_t v35 = 28;
          goto LABEL_42;
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v30 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        __int16 v30 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v36 = VRTraceErrorLogLevelToCSTR();
        int v37 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v38 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 136316162;
          uint64_t v47 = v36;
          __int16 v48 = 2080;
          v49 = "-[VCSecurityKeyManager pruneSendKeyMaterialWithDelay:]_block_invoke";
          __int16 v50 = 1024;
          int v51 = 414;
          __int16 v52 = 2112;
          uint64_t v53 = v30;
          __int16 v54 = 2048;
          uint64_t v55 = v38;
          id v33 = " [%s] %s:%d %@(%p) Pruned last uplink MKM from sendKeys. calling scheduleEncryptionRollTimer";
          __int16 v34 = v37;
          uint32_t v35 = 48;
LABEL_42:
          _os_log_impl(&dword_1E1EA4000, v34, OS_LOG_TYPE_DEFAULT, v33, buf, v35);
        }
      }
    }
    uint64_t result = [*(id *)(a1 + 32) scheduleEncryptionRollTimerWithDelay:30.0];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 88) = 0;
  return result;
}

- (void)pruneRecvKeyMaterialWithDelay:(double)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  double v5 = micro();
  self->_isReceiveKeysCleanUpPending = 1;
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  keyManagerQueue = self->_keyManagerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__VCSecurityKeyManager_pruneRecvKeyMaterialWithDelay___block_invoke;
  block[3] = &unk_1E6DB4568;
  block[4] = self;
  *(double *)&block[5] = v5;
  dispatch_after(v6, keyManagerQueue, block);
}

uint64_t __54__VCSecurityKeyManager_pruneRecvKeyMaterialWithDelay___block_invoke(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 32);
  id obj = (id)[*(id *)(*(void *)(a1 + 32) + 48) allKeys];
  if ((id)objc_opt_class() == *v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_12;
    }
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    double v5 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    dispatch_time_t v6 = (__CFString *)*((void *)*v2 + 6);
    *(_DWORD *)buf = 136315906;
    uint64_t v42 = v4;
    __int16 v43 = 2080;
    long long v44 = "-[VCSecurityKeyManager pruneRecvKeyMaterialWithDelay:]_block_invoke";
    __int16 v45 = 1024;
    int v46 = 429;
    __int16 v47 = 2112;
    __int16 v48 = v6;
    char v7 = " [%s] %s:%d Pruning obsolete receive keys (%@)";
    uint32_t v8 = v5;
    uint32_t v9 = 38;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (__CFString *)[*v2 performSelector:sel_logPrefix];
    }
    else {
      uint64_t v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_12;
    }
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    id v12 = *v2;
    uint64_t v13 = (__CFString *)*((void *)*v2 + 6);
    *(_DWORD *)buf = 136316418;
    uint64_t v42 = v10;
    __int16 v43 = 2080;
    long long v44 = "-[VCSecurityKeyManager pruneRecvKeyMaterialWithDelay:]_block_invoke";
    __int16 v45 = 1024;
    int v46 = 429;
    __int16 v47 = 2112;
    __int16 v48 = v3;
    __int16 v49 = 2048;
    id v50 = v12;
    __int16 v51 = 2112;
    __int16 v52 = v13;
    char v7 = " [%s] %s:%d %@(%p) Pruning obsolete receive keys (%@)";
    uint32_t v8 = v11;
    uint32_t v9 = 58;
  }
  _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
LABEL_12:
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v14 = [obj countByEnumeratingWithState:&v56 objects:v55 count:16];
  if (!v14) {
    goto LABEL_31;
  }
  uint64_t v16 = v14;
  uint64_t v17 = *(void *)v57;
  *(void *)&long long v15 = 136315906;
  long long v39 = v15;
  do
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v57 != v17) {
        objc_enumerationMutation(obj);
      }
      double v19 = *(__CFString **)(*((void *)&v56 + 1) + 8 * i);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "objectForKeyedSubscript:", v19, v39), "objectForKeyedSubscript:", @"SecurityKeySetTime"), "doubleValue");
      if (v20 < *(double *)(a1 + 40))
      {
        if ((id)objc_opt_class() == *v2)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v28 = VRTraceErrorLogLevelToCSTR();
            int v29 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v39;
              uint64_t v42 = v28;
              __int16 v43 = 2080;
              long long v44 = "-[VCSecurityKeyManager pruneRecvKeyMaterialWithDelay:]_block_invoke";
              __int16 v45 = 1024;
              int v46 = 434;
              __int16 v47 = 2112;
              __int16 v48 = v19;
              uint64_t v25 = v29;
              uint32_t v26 = " [%s] %s:%d Pruned keyIndex '%@'";
              uint32_t v27 = 38;
LABEL_27:
              _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, v27);
            }
          }
        }
        else
        {
          uint64_t v21 = &stru_1F3D3E450;
          if (objc_opt_respondsToSelector()) {
            uint64_t v21 = (__CFString *)[*v2 performSelector:sel_logPrefix];
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v22 = VRTraceErrorLogLevelToCSTR();
            uint64_t v23 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              id v24 = *v2;
              *(_DWORD *)buf = 136316418;
              uint64_t v42 = v22;
              __int16 v43 = 2080;
              long long v44 = "-[VCSecurityKeyManager pruneRecvKeyMaterialWithDelay:]_block_invoke";
              __int16 v45 = 1024;
              int v46 = 434;
              __int16 v47 = 2112;
              __int16 v48 = v21;
              __int16 v49 = 2048;
              id v50 = v24;
              __int16 v51 = 2112;
              __int16 v52 = v19;
              uint64_t v25 = v23;
              uint32_t v26 = " [%s] %s:%d %@(%p) Pruned keyIndex '%@'";
              uint32_t v27 = 58;
              goto LABEL_27;
            }
          }
        }
        [*((id *)*v2 + 6) removeObjectForKey:v19];
        continue;
      }
    }
    uint64_t v16 = [obj countByEnumeratingWithState:&v56 objects:v55 count:16];
  }
  while (v16);
LABEL_31:
  uint64_t result = [*((id *)*v2 + 6) objectForKeyedSubscript:*((void *)*v2 + 9)];
  if (!result)
  {
    if ((id)objc_opt_class() == *v2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v32 = VRTraceErrorLogLevelToCSTR();
        id v33 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __54__VCSecurityKeyManager_pruneRecvKeyMaterialWithDelay___block_invoke_cold_1(v32, (uint64_t)v2, v33);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v31 = (__CFString *)[*v2 performSelector:sel_logPrefix];
      }
      else {
        uint64_t v31 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v34 = VRTraceErrorLogLevelToCSTR();
        uint32_t v35 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          id v36 = *v2;
          int v37 = (__CFString *)*((void *)*v2 + 9);
          uint64_t v38 = *((void *)*v2 + 6);
          *(_DWORD *)buf = 136316674;
          uint64_t v42 = v34;
          __int16 v43 = 2080;
          long long v44 = "-[VCSecurityKeyManager pruneRecvKeyMaterialWithDelay:]_block_invoke";
          __int16 v45 = 1024;
          int v46 = 441;
          __int16 v47 = 2112;
          __int16 v48 = v31;
          __int16 v49 = 2048;
          id v50 = v36;
          __int16 v51 = 2112;
          __int16 v52 = v37;
          __int16 v53 = 2112;
          uint64_t v54 = v38;
          _os_log_error_impl(&dword_1E1EA4000, v35, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Pruned _latestReceiveKeyIndex '%@‘ from receiveKeys (%@). Nullifying it", buf, 0x44u);
        }
      }
    }
    uint64_t result = VCMediaKeyIndex_ReleaseAndCopyNewValue((const void **)*v2 + 9, 0);
  }
  *((unsigned char *)*v2 + 89) = 0;
  return result;
}

- (double)pruneAllExpiredKeys
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  double v3 = micro();
  if ([(NSMutableDictionary *)self->_prunePendingReceiveKeys count])
  {
    uint64_t v4 = (void *)[(NSMutableDictionary *)self->_prunePendingReceiveKeys allKeys];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id obj = v4;
    uint64_t v28 = [v4 countByEnumeratingWithState:&v49 objects:v48 count:16];
    if (v28)
    {
      double v5 = 1.79769313e308;
      uint64_t v27 = *(void *)v50;
      while (1)
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v50 != v27) {
            objc_enumerationMutation(obj);
          }
          char v7 = (void *)[(NSMutableDictionary *)self->_prunePendingReceiveKeys objectForKeyedSubscript:*(void *)(*((void *)&v49 + 1) + 8 * v6)];
          uint64_t v29 = v6;
          if ([v7 count])
          {
            uint32_t v8 = (void *)[v7 allKeys];
            long long v44 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            id v30 = v8;
            uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v43 count:16];
            if (v9)
            {
              uint64_t v10 = v9;
              uint64_t v11 = *(void *)v45;
              do
              {
                for (uint64_t i = 0; i != v10; ++i)
                {
                  if (*(void *)v45 != v11) {
                    objc_enumerationMutation(v30);
                  }
                  uint64_t v13 = *(__CFString **)(*((void *)&v44 + 1) + 8 * i);
                  uint64_t v14 = (void *)[v7 objectForKeyedSubscript:v13];
                  [v14 doubleValue];
                  if (v15 <= v3)
                  {
                    if ((VCSecurityKeyManager *)objc_opt_class() == self)
                    {
                      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                      {
                        uint64_t v23 = VRTraceErrorLogLevelToCSTR();
                        id v24 = *MEMORY[0x1E4F47A50];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 136315906;
                          uint64_t v32 = v23;
                          __int16 v33 = 2080;
                          uint64_t v34 = "-[VCSecurityKeyManager pruneAllExpiredKeys]";
                          __int16 v35 = 1024;
                          int v36 = 475;
                          __int16 v37 = 2112;
                          uint64_t v38 = v13;
                          double v20 = v24;
                          uint64_t v21 = " [%s] %s:%d Pruned keyIndex '%@'";
                          uint32_t v22 = 38;
LABEL_26:
                          _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, v22);
                        }
                      }
                    }
                    else
                    {
                      uint64_t v17 = &stru_1F3D3E450;
                      if (objc_opt_respondsToSelector()) {
                        uint64_t v17 = (__CFString *)[(VCSecurityKeyManager *)self performSelector:sel_logPrefix];
                      }
                      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                      {
                        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
                        double v19 = *MEMORY[0x1E4F47A50];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 136316418;
                          uint64_t v32 = v18;
                          __int16 v33 = 2080;
                          uint64_t v34 = "-[VCSecurityKeyManager pruneAllExpiredKeys]";
                          __int16 v35 = 1024;
                          int v36 = 475;
                          __int16 v37 = 2112;
                          uint64_t v38 = v17;
                          __int16 v39 = 2048;
                          uint64_t v40 = self;
                          __int16 v41 = 2112;
                          uint64_t v42 = v13;
                          double v20 = v19;
                          uint64_t v21 = " [%s] %s:%d %@(%p) Pruned keyIndex '%@'";
                          uint32_t v22 = 58;
                          goto LABEL_26;
                        }
                      }
                    }
                    [(NSMutableDictionary *)self->_receiveKeys removeObjectForKey:v13];
                    [v7 removeObjectForKey:v13];
                    continue;
                  }
                  [v14 doubleValue];
                  if (v16 < v5) {
                    double v5 = v16;
                  }
                }
                uint64_t v10 = [v30 countByEnumeratingWithState:&v44 objects:v43 count:16];
              }
              while (v10);
            }
          }
          ++v6;
        }
        while (v29 + 1 != v28);
        uint64_t v28 = [obj countByEnumeratingWithState:&v49 objects:v48 count:16];
        if (!v28) {
          return v5;
        }
      }
    }
  }
  return 1.79769313e308;
}

- (double)firstExpirationTime
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  double v3 = (void *)[(NSMutableDictionary *)self->_prunePendingReceiveKeys allKeys];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v22 count:16];
  if (!v4) {
    return 1.79769313e308;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v24;
  double v7 = 1.79769313e308;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v24 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v9 = (void *)[(NSMutableDictionary *)self->_prunePendingReceiveKeys objectForKeyedSubscript:*(void *)(*((void *)&v23 + 1) + 8 * i)];
      uint64_t v10 = (void *)[v9 allKeys];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v17 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v19;
        do
        {
          for (uint64_t j = 0; j != v12; ++j)
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v10);
            }
            objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *(void *)(*((void *)&v18 + 1) + 8 * j)), "doubleValue");
            if (v15 < v7) {
              double v7 = v15;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v17 count:16];
        }
        while (v12);
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v23 objects:v22 count:16];
  }
  while (v5);
  return v7;
}

- (void)schedulePruneTimer:(double)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (self->_isRunning)
  {
    double v5 = micro();
    if ((VCSecurityKeyManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7
        || (uint64_t v9 = VRTraceErrorLogLevelToCSTR(),
            uint64_t v10 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_16:
        if (a3 != 1.79769313e308 && v5 < a3)
        {
          dispatch_suspend((dispatch_object_t)self->_pruneTimer);
          pruneTimer = self->_pruneTimer;
          dispatch_time_t v17 = dispatch_time(0, (uint64_t)((a3 - v5) * 1000000000.0));
          dispatch_source_set_timer(pruneTimer, v17, 0xFFFFFFFFFFFFFFFFLL, 0);
          dispatch_resume((dispatch_object_t)self->_pruneTimer);
        }
        return;
      }
      int v18 = 136316162;
      uint64_t v19 = v9;
      __int16 v20 = 2080;
      long long v21 = "-[VCSecurityKeyManager schedulePruneTimer:]";
      __int16 v22 = 1024;
      int v23 = 517;
      __int16 v24 = 2048;
      double v25 = v5;
      __int16 v26 = 2048;
      double v27 = a3;
      uint64_t v11 = " [%s] %s:%d schedulePruneTimer: currentTime=%f, firstExpirationTime=%f";
      uint64_t v12 = v10;
      uint32_t v13 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v6 = (__CFString *)[(VCSecurityKeyManager *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_16;
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      double v15 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      int v18 = 136316674;
      uint64_t v19 = v14;
      __int16 v20 = 2080;
      long long v21 = "-[VCSecurityKeyManager schedulePruneTimer:]";
      __int16 v22 = 1024;
      int v23 = 517;
      __int16 v24 = 2112;
      double v25 = *(double *)&v6;
      __int16 v26 = 2048;
      double v27 = *(double *)&self;
      __int16 v28 = 2048;
      double v29 = v5;
      __int16 v30 = 2048;
      double v31 = a3;
      uint64_t v11 = " [%s] %s:%d %@(%p) schedulePruneTimer: currentTime=%f, firstExpirationTime=%f";
      uint64_t v12 = v15;
      uint32_t v13 = 68;
    }
    _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v18, v13);
    goto LABEL_16;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint32_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315650;
      uint64_t v19 = v7;
      __int16 v20 = 2080;
      long long v21 = "-[VCSecurityKeyManager schedulePruneTimer:]";
      __int16 v22 = 1024;
      int v23 = 513;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Attempt to schedulePrineTimer when VCSecurityManager is stopped", (uint8_t *)&v18, 0x1Cu);
    }
  }
}

- (void)handlePruneTimerEventAndReschedule
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(VCSecurityKeyManager *)self pruneAllExpiredKeys];
  -[VCSecurityKeyManager schedulePruneTimer:](self, "schedulePruneTimer:");
  if ((VCSecurityKeyManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      double v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315650;
        uint64_t v12 = v4;
        __int16 v13 = 2080;
        uint64_t v14 = "-[VCSecurityKeyManager handlePruneTimerEventAndReschedule]";
        __int16 v15 = 1024;
        int v16 = 529;
        uint64_t v6 = " [%s] %s:%d pruneTimerEvent fired";
        uint64_t v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      double v3 = (__CFString *)[(VCSecurityKeyManager *)self performSelector:sel_logPrefix];
    }
    else {
      double v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136316162;
        uint64_t v12 = v9;
        __int16 v13 = 2080;
        uint64_t v14 = "-[VCSecurityKeyManager handlePruneTimerEventAndReschedule]";
        __int16 v15 = 1024;
        int v16 = 529;
        __int16 v17 = 2112;
        int v18 = v3;
        __int16 v19 = 2048;
        __int16 v20 = self;
        uint64_t v6 = " [%s] %s:%d %@(%p) pruneTimerEvent fired";
        uint64_t v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
}

- (void)scheduleEncryptionRollTimerWithDelay:(double)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_isRunning)
  {
    dispatch_suspend((dispatch_object_t)self->_encryptionKeyRollTimer);
    encryptionKeyRollTimer = self->_encryptionKeyRollTimer;
    dispatch_time_t v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(encryptionKeyRollTimer, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_encryptionKeyRollTimer);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint32_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136315906;
        uint64_t v15 = v7;
        __int16 v16 = 2080;
        __int16 v17 = "-[VCSecurityKeyManager scheduleEncryptionRollTimerWithDelay:]";
        __int16 v18 = 1024;
        int v19 = 540;
        __int16 v20 = 2048;
        double v21 = a3;
        uint64_t v9 = " [%s] %s:%d Scheduled encryption roll timeout delta=%f seconds";
        uint64_t v10 = v8;
        uint32_t v11 = 38;
LABEL_8:
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v11);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    __int16 v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315650;
      uint64_t v15 = v12;
      __int16 v16 = 2080;
      __int16 v17 = "-[VCSecurityKeyManager scheduleEncryptionRollTimerWithDelay:]";
      __int16 v18 = 1024;
      int v19 = 534;
      uint64_t v9 = " [%s] %s:%d Security key manager has not been started, yet";
      uint64_t v10 = v13;
      uint32_t v11 = 28;
      goto LABEL_8;
    }
  }
}

- (BOOL)associateMKI:(id)a3 withParticipantID:(unint64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a4)
    {
      keyManagerQueue = self->_keyManagerQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__VCSecurityKeyManager_associateMKI_withParticipantID___block_invoke;
      block[3] = &unk_1E6DB5450;
      block[5] = a3;
      void block[6] = a4;
      block[4] = self;
      dispatch_async(keyManagerQueue, block);
      LOBYTE(v6) = 1;
      return v6;
    }
    if ((VCSecurityKeyManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v6) {
          return v6;
        }
        -[VCSecurityKeyManager associateMKI:withParticipantID:]();
      }
      goto LABEL_26;
    }
    if (objc_opt_respondsToSelector()) {
      uint32_t v8 = (__CFString *)[(VCSecurityKeyManager *)self performSelector:sel_logPrefix];
    }
    else {
      uint32_t v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v6) {
        return v6;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v16 = v12;
      __int16 v17 = 2080;
      __int16 v18 = "-[VCSecurityKeyManager associateMKI:withParticipantID:]";
      __int16 v19 = 1024;
      int v20 = 546;
      __int16 v21 = 2112;
      uint64_t v22 = v8;
      __int16 v23 = 2048;
      __int16 v24 = self;
      uint32_t v11 = " [%s] %s:%d %@(%p) participantID is invalid";
LABEL_25:
      _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0x30u);
    }
  }
  else
  {
    if ((VCSecurityKeyManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v6) {
          return v6;
        }
        -[VCSecurityKeyManager associateMKI:withParticipantID:]();
      }
      goto LABEL_26;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[(VCSecurityKeyManager *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v6) {
        return v6;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v16 = v9;
      __int16 v17 = 2080;
      __int16 v18 = "-[VCSecurityKeyManager associateMKI:withParticipantID:]";
      __int16 v19 = 1024;
      int v20 = 545;
      __int16 v21 = 2112;
      uint64_t v22 = v7;
      __int16 v23 = 2048;
      __int16 v24 = self;
      uint32_t v11 = " [%s] %s:%d %@(%p) keyIndex must not be nil";
      goto LABEL_25;
    }
  }
LABEL_26:
  LOBYTE(v6) = 0;
  return v6;
}

uint64_t __55__VCSecurityKeyManager_associateMKI_withParticipantID___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  double v2 = micro();
  uint64_t v3 = [*(id *)(a1 + 32) getNotUsedTimeout];
  id v4 = (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", *(void *)(a1 + 48)));
  if (!v4)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "setObject:forKeyedSubscript:", v4, objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", *(void *)(a1 + 48)));
  }
  double v5 = (void *)[v4 allKeys];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    double v8 = v2 + (double)v3;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v8), *(void *)(*((void *)&v29 + 1) + 8 * i));
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v28 count:16];
    }
    while (v7);
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", micro() + 1200.0), *(void *)(a1 + 40));
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      __int16 v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 40);
        *(_DWORD *)__int16 v24 = 136316162;
        *(void *)&v24[4] = v12;
        *(_WORD *)&v24[12] = 2080;
        *(void *)&v24[14] = "-[VCSecurityKeyManager associateMKI:withParticipantID:]_block_invoke";
        *(_WORD *)&v24[22] = 1024;
        LODWORD(v25) = 565;
        WORD2(v25) = 2112;
        *(void *)((char *)&v25 + 6) = v14;
        HIWORD(v25) = 1024;
        LODWORD(v26) = 1200;
        uint64_t v15 = " [%s] %s:%d Reset pruning timeout for keyIndex '%@' to default value '%d'";
        uint64_t v16 = v13;
        uint32_t v17 = 44;
LABEL_20:
        _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v15, v24, v17);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint32_t v11 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint32_t v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      __int16 v19 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = *(void *)(a1 + 32);
        uint64_t v21 = *(void *)(a1 + 40);
        *(_DWORD *)__int16 v24 = 136316674;
        *(void *)&v24[4] = v18;
        *(_WORD *)&v24[12] = 2080;
        *(void *)&v24[14] = "-[VCSecurityKeyManager associateMKI:withParticipantID:]_block_invoke";
        *(_WORD *)&v24[22] = 1024;
        LODWORD(v25) = 565;
        WORD2(v25) = 2112;
        *(void *)((char *)&v25 + 6) = v11;
        HIWORD(v25) = 2048;
        uint64_t v26 = v20;
        LOWORD(v27) = 2112;
        *(void *)((char *)&v27 + 2) = v21;
        WORD5(v27) = 1024;
        HIDWORD(v27) = 1200;
        uint64_t v15 = " [%s] %s:%d %@(%p) Reset pruning timeout for keyIndex '%@' to default value '%d'";
        uint64_t v16 = v19;
        uint32_t v17 = 64;
        goto LABEL_20;
      }
    }
  }
  uint64_t v22 = *(void **)(a1 + 32);
  objc_msgSend(v22, "firstExpirationTime", *(_OWORD *)v24, *(void *)&v24[16], v25, v26, v27);
  return objc_msgSend(v22, "schedulePruneTimer:");
}

- (void)detectInabilityToDecryptSymptom:(id)a3 prefix:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a3 count];
  unknownKeyIndexList = self->_unknownKeyIndexList;
  if (v6)
  {
    [(NSMutableArray *)unknownKeyIndexList removeObject:a4];
    if ((VCSecurityKeyManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_17;
      }
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint32_t v11 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      int v12 = [(NSMutableDictionary *)self->_receiveKeys count];
      *(_DWORD *)long long v30 = 136316162;
      *(void *)&v30[4] = v10;
      *(_WORD *)&v30[12] = 2080;
      *(void *)&v30[14] = "-[VCSecurityKeyManager detectInabilityToDecryptSymptom:prefix:]";
      *(_WORD *)&v30[22] = 1024;
      LODWORD(v31) = 587;
      WORD2(v31) = 2112;
      *(void *)((char *)&v31 + 6) = a4;
      HIWORD(v31) = 1024;
      LODWORD(v32) = v12;
      __int16 v13 = " [%s] %s:%d Found prefix '%@' in receive keys array of %d elements";
      uint64_t v14 = v11;
      uint32_t v15 = 44;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        double v8 = (__CFString *)[(VCSecurityKeyManager *)self performSelector:sel_logPrefix];
      }
      else {
        double v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_17;
      }
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      uint32_t v17 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      int v18 = [(NSMutableDictionary *)self->_receiveKeys count];
      *(_DWORD *)long long v30 = 136316674;
      *(void *)&v30[4] = v16;
      *(_WORD *)&v30[12] = 2080;
      *(void *)&v30[14] = "-[VCSecurityKeyManager detectInabilityToDecryptSymptom:prefix:]";
      *(_WORD *)&v30[22] = 1024;
      LODWORD(v31) = 587;
      WORD2(v31) = 2112;
      *(void *)((char *)&v31 + 6) = v8;
      HIWORD(v31) = 2048;
      long long v32 = self;
      LOWORD(v33) = 2112;
      *(void *)((char *)&v33 + 2) = a4;
      WORD5(v33) = 1024;
      HIDWORD(v33) = v18;
      __int16 v13 = " [%s] %s:%d %@(%p) Found prefix '%@' in receive keys array of %d elements";
      uint64_t v14 = v17;
      uint32_t v15 = 64;
    }
    _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, v30, v15);
LABEL_17:
    self->_double lastKeyIndexNotReceived = 0.0;
    return;
  }
  if (([(NSMutableArray *)unknownKeyIndexList containsObject:a4] & 1) == 0)
  {
    if ((VCSecurityKeyManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_24;
      }
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      uint64_t v20 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      int v21 = [(NSMutableDictionary *)self->_receiveKeys count];
      *(_DWORD *)long long v30 = 136316162;
      *(void *)&v30[4] = v19;
      *(_WORD *)&v30[12] = 2080;
      *(void *)&v30[14] = "-[VCSecurityKeyManager detectInabilityToDecryptSymptom:prefix:]";
      *(_WORD *)&v30[22] = 1024;
      LODWORD(v31) = 577;
      WORD2(v31) = 2112;
      *(void *)((char *)&v31 + 6) = a4;
      HIWORD(v31) = 1024;
      LODWORD(v32) = v21;
      uint64_t v22 = " [%s] %s:%d Cannot find prefix '%@' in receive keys array of %d elements";
      __int16 v23 = v20;
      uint32_t v24 = 44;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v9 = (__CFString *)[(VCSecurityKeyManager *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v9 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_24;
      }
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      uint64_t v26 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      int v29 = [(NSMutableDictionary *)self->_receiveKeys count];
      *(_DWORD *)long long v30 = 136316674;
      *(void *)&v30[4] = v25;
      *(_WORD *)&v30[12] = 2080;
      *(void *)&v30[14] = "-[VCSecurityKeyManager detectInabilityToDecryptSymptom:prefix:]";
      *(_WORD *)&v30[22] = 1024;
      LODWORD(v31) = 577;
      WORD2(v31) = 2112;
      *(void *)((char *)&v31 + 6) = v9;
      HIWORD(v31) = 2048;
      long long v32 = self;
      LOWORD(v33) = 2112;
      *(void *)((char *)&v33 + 2) = a4;
      WORD5(v33) = 1024;
      HIDWORD(v33) = v29;
      uint64_t v22 = " [%s] %s:%d %@(%p) Cannot find prefix '%@' in receive keys array of %d elements";
      __int16 v23 = v26;
      uint32_t v24 = 64;
    }
    _os_log_error_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_ERROR, v22, v30, v24);
LABEL_24:
    -[NSMutableArray addObject:](self->_unknownKeyIndexList, "addObject:", a4, *(_OWORD *)v30, *(void *)&v30[16], v31, v32, v33);
  }
  double lastKeyIndexNotReceived = self->_lastKeyIndexNotReceived;
  double v28 = micro();
  if (lastKeyIndexNotReceived == 0.0)
  {
    self->_double lastKeyIndexNotReceived = v28;
  }
  else if (v28 - self->_lastKeyIndexNotReceived >= 30.0)
  {
    [(VCSecurityKeyManager *)self reportingAgent];
    reportingSymptom();
  }
}

- (id)copyMKMWithPrefix:(id)a3 forParticipantID:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x3052000000;
  uint64_t v14 = __Block_byref_object_copy__27;
  uint32_t v15 = __Block_byref_object_dispose__27;
  id v16 = (id)0xAAAAAAAAAAAAAAAALL;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  keyManagerQueue = self->_keyManagerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__VCSecurityKeyManager_copyMKMWithPrefix_forParticipantID___block_invoke;
  block[3] = &unk_1E6DB85F0;
  block[4] = a3;
  block[5] = self;
  void block[6] = &v11;
  void block[7] = a4;
  dispatch_sync(keyManagerQueue, block);
  double v8 = (void *)v12[5];
  _Block_object_dispose(&v11, 8);
  return v8;
}

void __59__VCSecurityKeyManager_copyMKMWithPrefix_forParticipantID___block_invoke(uint64_t a1)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = *(void *)(a1 + 40);
  if (v2)
  {
    double v5 = &selRef_isInputAvailable;
    if (v3 == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      double v8 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      uint64_t v9 = *(__CFString **)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 136316162;
      uint64_t v59 = v7;
      __int16 v60 = 2080;
      v61 = "-[VCSecurityKeyManager copyMKMWithPrefix:forParticipantID:]_block_invoke";
      __int16 v62 = 1024;
      int v63 = 597;
      __int16 v64 = 2112;
      v65 = v9;
      __int16 v66 = 2048;
      uint64_t v67 = v10;
      uint64_t v11 = " [%s] %s:%d Searching for key material with prefix=%@ for participantID=%llu";
      int v12 = v8;
      uint32_t v13 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v6 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint32_t v15 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      uint64_t v17 = *(__CFString **)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 40);
      int v18 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 136316674;
      uint64_t v59 = v14;
      __int16 v60 = 2080;
      v61 = "-[VCSecurityKeyManager copyMKMWithPrefix:forParticipantID:]_block_invoke";
      __int16 v62 = 1024;
      int v63 = 597;
      __int16 v64 = 2112;
      v65 = v6;
      __int16 v66 = 2048;
      uint64_t v67 = v16;
      __int16 v68 = 2112;
      v69 = v17;
      __int16 v70 = 2048;
      v71 = v18;
      uint64_t v11 = " [%s] %s:%d %@(%p) Searching for key material with prefix=%@ for participantID=%llu";
      int v12 = v15;
      uint32_t v13 = 68;
    }
    _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_13:
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id obj = *(id *)(*(void *)(a1 + 40) + 48);
    uint64_t v19 = [obj countByEnumeratingWithState:&v77 objects:v76 count:16];
    if (!v19) {
      goto LABEL_42;
    }
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)v78;
    *(void *)&long long v20 = 136316674;
    long long v56 = v20;
    while (1)
    {
      uint64_t v23 = 0;
      uint32_t v24 = v5[417];
      do
      {
        if (*(void *)v78 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(__CFString **)(*((void *)&v77 + 1) + 8 * v23);
        if (-[__CFString isStartingWithPrefix:](v25, "isStartingWithPrefix:", *(void *)(a1 + 32), v56))
        {
          uint64_t v26 = (__CFString *)[*(id *)(*(void *)(a1 + 40) + 48) objectForKeyedSubscript:v25];
          long long v27 = (void *)[(__CFString *)v26 objectForKeyedSubscript:@"SecurityIDSParticipantID"];
          if (*(void *)(a1 + 56) && (double v28 = v27, [v27 unsignedLongLongValue] != *(void *)(a1 + 56)))
          {
            if (objc_opt_class() == *(void *)(a1 + 40))
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
              {
                uint64_t v48 = VRTraceErrorLogLevelToCSTR();
                long long v49 = *MEMORY[0x1E4F47A50];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v50 = *(void *)(a1 + 32);
                  long long v51 = *(__CFString **)(a1 + 56);
                  *(_DWORD *)buf = v56;
                  uint64_t v59 = v48;
                  __int16 v60 = 2080;
                  v61 = "-[VCSecurityKeyManager copyMKMWithPrefix:forParticipantID:]_block_invoke";
                  __int16 v62 = 1024;
                  int v63 = 609;
                  __int16 v64 = 2112;
                  v65 = v25;
                  __int16 v66 = 2112;
                  uint64_t v67 = v50;
                  __int16 v68 = 2048;
                  v69 = v51;
                  __int16 v70 = 2112;
                  v71 = v28;
                  __int16 v35 = v49;
                  int v36 = " [%s] %s:%d Skipping keyIndex=%@ for prefix=%@ due to mismatched participantID: expected partici"
                        "pantID=%llu, actual participantID=%@";
                  uint32_t v37 = 68;
                  goto LABEL_39;
                }
              }
            }
            else
            {
              uint64_t v38 = &stru_1F3D3E450;
              if (objc_opt_respondsToSelector()) {
                uint64_t v38 = (__CFString *)[*(id *)(a1 + 40) performSelector:v24];
              }
              if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
              {
                uint64_t v39 = VRTraceErrorLogLevelToCSTR();
                uint64_t v40 = *MEMORY[0x1E4F47A50];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v42 = *(void **)(a1 + 32);
                  uint64_t v41 = *(void *)(a1 + 40);
                  uint64_t v43 = *(void *)(a1 + 56);
                  *(_DWORD *)buf = 136317186;
                  uint64_t v59 = v39;
                  __int16 v60 = 2080;
                  v61 = "-[VCSecurityKeyManager copyMKMWithPrefix:forParticipantID:]_block_invoke";
                  __int16 v62 = 1024;
                  int v63 = 609;
                  __int16 v64 = 2112;
                  v65 = v38;
                  __int16 v66 = 2048;
                  uint64_t v67 = v41;
                  __int16 v68 = 2112;
                  v69 = v25;
                  __int16 v70 = 2112;
                  v71 = v42;
                  __int16 v72 = 2048;
                  uint64_t v73 = v43;
                  __int16 v74 = 2112;
                  v75 = v28;
                  __int16 v35 = v40;
                  int v36 = " [%s] %s:%d %@(%p) Skipping keyIndex=%@ for prefix=%@ due to mismatched participantID: expected "
                        "participantID=%llu, actual participantID=%@";
                  uint32_t v37 = 88;
                  goto LABEL_39;
                }
              }
            }
          }
          else
          {
            objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "addObject:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 48), "objectForKeyedSubscript:", v25));
            if (objc_opt_class() == *(void *)(a1 + 40))
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                uint64_t v44 = VRTraceErrorLogLevelToCSTR();
                long long v45 = *MEMORY[0x1E4F47A50];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v46 = *(void *)(a1 + 32);
                  long long v47 = *(__CFString **)(a1 + 56);
                  *(_DWORD *)buf = 136316418;
                  uint64_t v59 = v44;
                  __int16 v60 = 2080;
                  v61 = "-[VCSecurityKeyManager copyMKMWithPrefix:forParticipantID:]_block_invoke";
                  __int16 v62 = 1024;
                  int v63 = 607;
                  __int16 v64 = 2112;
                  v65 = v26;
                  __int16 v66 = 2112;
                  uint64_t v67 = v46;
                  __int16 v68 = 2048;
                  v69 = v47;
                  __int16 v35 = v45;
                  int v36 = " [%s] %s:%d Added keyMaterial=%@ for prefix=%@ with participantID=%llu";
                  uint32_t v37 = 58;
                  goto LABEL_39;
                }
              }
            }
            else
            {
              int v29 = &stru_1F3D3E450;
              if (objc_opt_respondsToSelector()) {
                int v29 = (__CFString *)[*(id *)(a1 + 40) performSelector:v24];
              }
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                uint64_t v30 = VRTraceErrorLogLevelToCSTR();
                long long v31 = *MEMORY[0x1E4F47A50];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                {
                  long long v33 = *(void **)(a1 + 32);
                  uint64_t v32 = *(void *)(a1 + 40);
                  uint64_t v34 = *(void *)(a1 + 56);
                  *(_DWORD *)buf = 136316930;
                  uint64_t v59 = v30;
                  __int16 v60 = 2080;
                  v61 = "-[VCSecurityKeyManager copyMKMWithPrefix:forParticipantID:]_block_invoke";
                  __int16 v62 = 1024;
                  int v63 = 607;
                  __int16 v64 = 2112;
                  v65 = v29;
                  __int16 v66 = 2048;
                  uint64_t v67 = v32;
                  __int16 v68 = 2112;
                  v69 = v26;
                  __int16 v70 = 2112;
                  v71 = v33;
                  __int16 v72 = 2048;
                  uint64_t v73 = v34;
                  __int16 v35 = v31;
                  int v36 = " [%s] %s:%d %@(%p) Added keyMaterial=%@ for prefix=%@ with participantID=%llu";
                  uint32_t v37 = 78;
LABEL_39:
                  _os_log_impl(&dword_1E1EA4000, v35, OS_LOG_TYPE_DEFAULT, v36, buf, v37);
                }
              }
            }
          }
        }
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [obj countByEnumeratingWithState:&v77 objects:v76 count:16];
      double v5 = &selRef_isInputAvailable;
      if (!v21) {
        goto LABEL_42;
      }
    }
  }
  if (v3 == v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __59__VCSecurityKeyManager_copyMKMWithPrefix_forParticipantID___block_invoke_cold_1();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      long long v52 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
    }
    else {
      long long v52 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v53 = VRTraceErrorLogLevelToCSTR();
      uint64_t v54 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        uint64_t v55 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136316162;
        uint64_t v59 = v53;
        __int16 v60 = 2080;
        v61 = "-[VCSecurityKeyManager copyMKMWithPrefix:forParticipantID:]_block_invoke";
        __int16 v62 = 1024;
        int v63 = 596;
        __int16 v64 = 2112;
        v65 = v52;
        __int16 v66 = 2048;
        uint64_t v67 = v55;
        _os_log_error_impl(&dword_1E1EA4000, v54, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) keyPrefix must not be nil", buf, 0x30u);
      }
    }
  }
LABEL_42:
  if (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count])
  {

    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = 0;
  }
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "detectInabilityToDecryptSymptom:prefix:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
}

- (id)copyMKMWithPrefix:(id)a3
{
  return [(VCSecurityKeyManager *)self copyMKMWithPrefix:a3 forParticipantID:0];
}

- (void)setReportingAgent:(opaqueRTCReporting *)a3
{
}

- (opaqueRTCReporting)reportingAgent
{
  return (opaqueRTCReporting *)objc_loadWeak(&self->_reportingAgentWeak);
}

- (void)startTimers
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create encryptionKeyRollTimer", v2, v3, v4, v5, v6);
}

- (void)addSecurityKeyMaterial:securityKeyMode:.cold.1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  OUTLINED_FUNCTION_3_0();
  int v5 = 245;
  __int16 v6 = 2112;
  uint64_t v7 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d kVCSecurityKeyIndex is missing in key material dictionary '%@'", v3, 0x26u);
}

void __65__VCSecurityKeyManager_latestSendKeyMaterialWithSecurityKeyMode___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)a2 + 40) count];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_14();
  OUTLINED_FUNCTION_8_12(&dword_1E1EA4000, v2, v3, " [%s] %s:%d Cannot find _latestSendKeyIndex '%@' in receive keys array of %d elements. Invalidating it...", v4, v5, v6, v7, v8);
}

void __48__VCSecurityKeyManager_getLatestRecvKeyMaterial__block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)a2 + 48) count];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_14();
  OUTLINED_FUNCTION_8_12(&dword_1E1EA4000, v2, v3, " [%s] %s:%d Cannot find _latestReceiveKeyIndex '%@' in receive keys array of %d elements. Invalidating it...", v4, v5, v6, v7, v8);
}

void __54__VCSecurityKeyManager_pruneRecvKeyMaterialWithDelay___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)a2 + 72);
  uint64_t v4 = *(void *)(*(void *)a2 + 48);
  int v5 = 136316162;
  uint64_t v6 = a1;
  __int16 v7 = 2080;
  uint8_t v8 = "-[VCSecurityKeyManager pruneRecvKeyMaterialWithDelay:]_block_invoke";
  __int16 v9 = 1024;
  int v10 = 441;
  __int16 v11 = 2112;
  uint64_t v12 = v3;
  __int16 v13 = 2112;
  uint64_t v14 = v4;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Pruned _latestReceiveKeyIndex '%@‘ from receiveKeys (%@). Nullifying it", (uint8_t *)&v5, 0x30u);
}

- (void)associateMKI:withParticipantID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d keyIndex must not be nil", v2, v3, v4, v5, v6);
}

- (void)associateMKI:withParticipantID:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d participantID is invalid", v2, v3, v4, v5, v6);
}

void __59__VCSecurityKeyManager_copyMKMWithPrefix_forParticipantID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d keyPrefix must not be nil", v2, v3, v4, v5, v6);
}

@end