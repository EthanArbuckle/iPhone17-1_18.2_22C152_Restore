@interface VCSessionManager
+ (id)sharedInstance;
+ (void)addNSError:(id)a3 toXPCArgumentDictionary:(id)a4;
- (BOOL)screenAndCameraMixingEnabled;
- (BOOL)sharingEnabled;
- (NSMutableDictionary)sessions;
- (VCSessionManager)init;
- (id)participantConfigFromXPCDictionary:(id)a3;
- (id)sessionForStreamToken:(unsigned int)a3;
- (id)sessionForUUID:(id)a3;
- (void)dealloc;
- (void)deregisterBlocksForService;
- (void)registerBlocksForService;
- (void)releaseSession:(id)a3;
- (void)setScreenAndCameraMixingEnabled:(BOOL)a3;
- (void)setSharingEnabled:(BOOL)a3;
- (void)vcSession:(id)a3 addParticipantWithID:(id)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)vcSession:(id)a3 didStart:(BOOL)a4 error:(id)a5;
- (void)vcSession:(id)a3 didStopWithError:(id)a4;
- (void)vcSession:(id)a3 downlinkRateAdaptationDidChangeWithInfo:(id)a4;
- (void)vcSession:(id)a3 oneToOneModeEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)vcSession:(id)a3 participantDidStopReacting:(id)a4;
- (void)vcSession:(id)a3 participantID:(id)a4 audioEnabled:(BOOL)a5 didSucceed:(BOOL)a6 error:(id)a7;
- (void)vcSession:(id)a3 participantID:(id)a4 audioPaused:(BOOL)a5 didSucceed:(BOOL)a6 error:(id)a7;
- (void)vcSession:(id)a3 participantID:(id)a4 didChangeMediaPriority:(unsigned __int8)a5 description:(id)a6;
- (void)vcSession:(id)a3 participantID:(id)a4 didDetectError:(id)a5;
- (void)vcSession:(id)a3 participantID:(id)a4 mediaStateDidChange:(unsigned int)a5 forMediaType:(unsigned int)a6 didSucceed:(BOOL)a7 error:(id)a8;
- (void)vcSession:(id)a3 participantID:(id)a4 mixingDidChangeForMediaType:(unsigned int)a5 mixingMediaType:(unsigned int)a6;
- (void)vcSession:(id)a3 participantID:(id)a4 reactionDidStart:(id)a5;
- (void)vcSession:(id)a3 participantID:(id)a4 remoteAudioEnabledDidChange:(BOOL)a5;
- (void)vcSession:(id)a3 participantID:(id)a4 remoteAudioPausedDidChange:(BOOL)a5;
- (void)vcSession:(id)a3 participantID:(id)a4 remoteMediaStateDidChange:(unsigned int)a5 forMediaType:(unsigned int)a6;
- (void)vcSession:(id)a3 participantID:(id)a4 remoteScreenEnabledDidChange:(BOOL)a5;
- (void)vcSession:(id)a3 participantID:(id)a4 remoteVideoEnabledDidChange:(BOOL)a5;
- (void)vcSession:(id)a3 participantID:(id)a4 remoteVideoPausedDidChange:(BOOL)a5;
- (void)vcSession:(id)a3 participantID:(id)a4 screenEnabled:(BOOL)a5 didSucceed:(BOOL)a6 error:(id)a7;
- (void)vcSession:(id)a3 participantID:(id)a4 videoEnabled:(BOOL)a5 didSucceed:(BOOL)a6 error:(id)a7;
- (void)vcSession:(id)a3 participantID:(id)a4 videoPaused:(BOOL)a5 didSucceed:(BOOL)a6 error:(id)a7;
- (void)vcSession:(id)a3 removeParticipantWithID:(id)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)vcSession:(id)a3 updateConfiguration:(id)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)vcSession:(id)a3 uplinkRateAdaptationDidChangeWithInfo:(id)a4;
- (void)vcSessionShouldReconnect:(id)a3;
@end

@implementation VCSessionManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_32);
  }
  return (id)sharedInstance__vcSessionManager;
}

void __34__VCSessionManager_sharedInstance__block_invoke()
{
  if (!sharedInstance__vcSessionManager) {
    sharedInstance__vcSessionManager = objc_alloc_init(VCSessionManager);
  }
}

+ (void)addNSError:(id)a3 toXPCArgumentDictionary:(id)a4
{
  if (a3)
  {
    id v6 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    if ([a3 domain]) {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "domain"), @"ERROR_DOMAIN");
    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "code")), @"ERROR_CODE");
    if ([a3 userInfo]) {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "userInfo"), @"ERROR_USERINFO");
    }
    [a4 setObject:v6 forKeyedSubscript:@"vcSessionError"];
  }
}

- (VCSessionManager)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCSessionManager;
  v2 = [(VCSessionManager *)&v5 init];
  if (v2)
  {
    v2->_sessions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v2->_xpcCommandQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCSessionManager.xpcCommandQueue", 0, CustomRootQueue);
    v2->_sessionQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCSessionManager.sessionQueue", MEMORY[0x1E4F14430], CustomRootQueue);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [(VCSessionManager *)self deregisterBlocksForService];

  xpcCommandQueue = self->_xpcCommandQueue;
  if (xpcCommandQueue)
  {
    dispatch_release(xpcCommandQueue);
    self->_xpcCommandQueue = 0;
  }
  sessionQueue = self->_sessionQueue;
  if (sessionQueue)
  {
    dispatch_release(sessionQueue);
    self->_sessionQueue = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)VCSessionManager;
  [(VCSessionManager *)&v5 dealloc];
}

- (id)sessionForUUID:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__7;
  v11 = __Block_byref_object_dispose__7;
  uint64_t v12 = 0;
  xpcCommandQueue = self->_xpcCommandQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__VCSessionManager_sessionForUUID___block_invoke;
  v6[3] = &unk_1E6DB43B0;
  v6[5] = a3;
  v6[6] = &v7;
  v6[4] = self;
  dispatch_sync(xpcCommandQueue, v6);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __35__VCSessionManager_sessionForUUID___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  return result;
}

- (id)sessionForStreamToken:(unsigned int)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__7;
  uint64_t v12 = __Block_byref_object_dispose__7;
  uint64_t v13 = 0;
  xpcCommandQueue = self->_xpcCommandQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__VCSessionManager_sessionForStreamToken___block_invoke;
  v6[3] = &unk_1E6DB6790;
  unsigned int v7 = a3;
  v6[4] = self;
  v6[5] = &v8;
  dispatch_sync(xpcCommandQueue, v6);
  v4 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __42__VCSessionManager_sessionForStreamToken___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) allValues];
  uint64_t result = [v2 countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        unsigned int v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
        int v8 = *(_DWORD *)(a1 + 48);
        uint64_t result = [v7 transportSessionID];
        if (v8 == result)
        {
          *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v7;
          return result;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v10 objects:v9 count:16];
      uint64_t v4 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (void)setSharingEnabled:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__VCSessionManager_setSharingEnabled___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(xpcCommandQueue, block);
}

void __38__VCSessionManager_setSharingEnabled___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 32);
  int v3 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = *(void *)(a1 + 32);
  if (v2 != v3)
  {
    if (v4 == v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v16 = *(unsigned __int8 *)(a1 + 40);
          *(_DWORD *)buf = 136315906;
          uint64_t v39 = v14;
          __int16 v40 = 2080;
          v41 = "-[VCSessionManager setSharingEnabled:]_block_invoke";
          __int16 v42 = 1024;
          int v43 = 108;
          __int16 v44 = 1024;
          LODWORD(v45) = v16;
          v17 = " [%s] %s:%d changing _isSharingEnabled to %d";
          v18 = v15;
          uint32_t v19 = 34;
LABEL_23:
          _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        unsigned int v7 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        unsigned int v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v24 = VRTraceErrorLogLevelToCSTR();
        v25 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = *(void *)(a1 + 32);
          int v27 = *(unsigned __int8 *)(a1 + 40);
          *(_DWORD *)buf = 136316418;
          uint64_t v39 = v24;
          __int16 v40 = 2080;
          v41 = "-[VCSessionManager setSharingEnabled:]_block_invoke";
          __int16 v42 = 1024;
          int v43 = 108;
          __int16 v44 = 2112;
          v45 = v7;
          __int16 v46 = 2048;
          uint64_t v47 = v26;
          __int16 v48 = 1024;
          int v49 = v27;
          v17 = " [%s] %s:%d %@(%p) changing _isSharingEnabled to %d";
          v18 = v25;
          uint32_t v19 = 54;
          goto LABEL_23;
        }
      }
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 32) = *(unsigned char *)(a1 + 40);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v28 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) allValues];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v34 objects:v33 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v35 != v31) {
            objc_enumerationMutation(v28);
          }
          [*(id *)(*((void *)&v34 + 1) + 8 * i) setSharingEnabled:*(unsigned __int8 *)(a1 + 40)];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v34 objects:v33 count:16];
      }
      while (v30);
    }
    return;
  }
  if (v4 == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        uint64_t v39 = v8;
        __int16 v40 = 2080;
        v41 = "-[VCSessionManager setSharingEnabled:]_block_invoke";
        __int16 v42 = 1024;
        int v43 = 115;
        __int16 v44 = 1024;
        LODWORD(v45) = v10;
        long long v11 = " [%s] %s:%d _isSharingEnabled already set to %d";
        long long v12 = v9;
        uint32_t v13 = 34;
LABEL_18:
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = *(void *)(a1 + 32);
        int v23 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        uint64_t v39 = v20;
        __int16 v40 = 2080;
        v41 = "-[VCSessionManager setSharingEnabled:]_block_invoke";
        __int16 v42 = 1024;
        int v43 = 115;
        __int16 v44 = 2112;
        v45 = v6;
        __int16 v46 = 2048;
        uint64_t v47 = v22;
        __int16 v48 = 1024;
        int v49 = v23;
        long long v11 = " [%s] %s:%d %@(%p) _isSharingEnabled already set to %d";
        long long v12 = v21;
        uint32_t v13 = 54;
        goto LABEL_18;
      }
    }
  }
}

- (void)setScreenAndCameraMixingEnabled:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__VCSessionManager_setScreenAndCameraMixingEnabled___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(xpcCommandQueue, block);
}

void __52__VCSessionManager_setScreenAndCameraMixingEnabled___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 33);
  int v3 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = *(void *)(a1 + 32);
  if (v2 != v3)
  {
    if (v4 == v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v16 = *(unsigned __int8 *)(a1 + 40);
          *(_DWORD *)buf = 136315906;
          uint64_t v39 = v14;
          __int16 v40 = 2080;
          v41 = "-[VCSessionManager setScreenAndCameraMixingEnabled:]_block_invoke";
          __int16 v42 = 1024;
          int v43 = 123;
          __int16 v44 = 1024;
          LODWORD(v45) = v16;
          v17 = " [%s] %s:%d changing _screenAndCameraMixingEnabled to %d";
          v18 = v15;
          uint32_t v19 = 34;
LABEL_23:
          _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        unsigned int v7 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        unsigned int v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v24 = VRTraceErrorLogLevelToCSTR();
        v25 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = *(void *)(a1 + 32);
          int v27 = *(unsigned __int8 *)(a1 + 40);
          *(_DWORD *)buf = 136316418;
          uint64_t v39 = v24;
          __int16 v40 = 2080;
          v41 = "-[VCSessionManager setScreenAndCameraMixingEnabled:]_block_invoke";
          __int16 v42 = 1024;
          int v43 = 123;
          __int16 v44 = 2112;
          v45 = v7;
          __int16 v46 = 2048;
          uint64_t v47 = v26;
          __int16 v48 = 1024;
          int v49 = v27;
          v17 = " [%s] %s:%d %@(%p) changing _screenAndCameraMixingEnabled to %d";
          v18 = v25;
          uint32_t v19 = 54;
          goto LABEL_23;
        }
      }
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 33) = *(unsigned char *)(a1 + 40);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v28 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) allValues];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v34 objects:v33 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v35 != v31) {
            objc_enumerationMutation(v28);
          }
          [*(id *)(*((void *)&v34 + 1) + 8 * i) setScreenAndCameraMixingEnabled:*(unsigned __int8 *)(a1 + 40)];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v34 objects:v33 count:16];
      }
      while (v30);
    }
    return;
  }
  if (v4 == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        uint64_t v39 = v8;
        __int16 v40 = 2080;
        v41 = "-[VCSessionManager setScreenAndCameraMixingEnabled:]_block_invoke";
        __int16 v42 = 1024;
        int v43 = 130;
        __int16 v44 = 1024;
        LODWORD(v45) = v10;
        long long v11 = " [%s] %s:%d _screenAndCameraMixingEnabled already set to %d";
        long long v12 = v9;
        uint32_t v13 = 34;
LABEL_18:
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = *(void *)(a1 + 32);
        int v23 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        uint64_t v39 = v20;
        __int16 v40 = 2080;
        v41 = "-[VCSessionManager setScreenAndCameraMixingEnabled:]_block_invoke";
        __int16 v42 = 1024;
        int v43 = 130;
        __int16 v44 = 2112;
        v45 = v6;
        __int16 v46 = 2048;
        uint64_t v47 = v22;
        __int16 v48 = 1024;
        int v49 = v23;
        long long v11 = " [%s] %s:%d %@(%p) _screenAndCameraMixingEnabled already set to %d";
        long long v12 = v21;
        uint32_t v13 = 54;
        goto LABEL_18;
      }
    }
  }
}

- (void)vcSession:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  if (a4) {
    kdebug_trace();
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithBool:", v6), @"vcSessionStarted", 0);
  +[VCSessionManager addNSError:a5 toXPCArgumentDictionary:v8];
  id v9 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v9 sendMessageAsync:"vcSessionDidStart" arguments:v8 context:a3];
}

- (void)vcSession:(id)a3 didStopWithError:(id)a4
{
  kdebug_trace();
  BOOL v6 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  if (a4) {
    +[VCSessionManager addNSError:a4 toXPCArgumentDictionary:v6];
  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "transportMetadata"), @"vcSessionDidStopMetadata");
  id v7 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v7 sendMessageAsync:"vcSessionDidStop" arguments:v6 context:a3];
}

- (void)vcSession:(id)a3 uplinkRateAdaptationDidChangeWithInfo:(id)a4
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", a4, @"vcSessionParameterRateAdaptationInfo", 0);
  id v6 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v6 sendMessageAsync:"vcSessionUplinkRateAdaptationInfoDidChange" arguments:v5 context:a3];
}

- (void)vcSession:(id)a3 downlinkRateAdaptationDidChangeWithInfo:(id)a4
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", a4, @"vcSessionParameterRateAdaptationInfo", 0);
  id v6 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v6 sendMessageAsync:"vcSessionDownlinkRateAdaptationInfoDidChange" arguments:v5 context:a3];
}

- (void)vcSession:(id)a3 addParticipantWithID:(id)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  int v10 = (void *)[a3 participantForID:a4];
  [v10 participantVideoToken];
  [v10 idsParticipantID];
  kdebug_trace();
  long long v11 = objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "newNSDictionaryWidthNSDictionary:", objc_msgSend(v10, "participantStreamTokens"));
  long long v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithBool:", v7), @"vcSessionSucceeded", a4, @"vcSessionParticipantID", v11, @"vcSessionParameterStreamTokens", 0);
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint32_t v13 = objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "newNSDictionaryWidthNSDictionary:", objc_msgSend(v10, "participantSpatialAudioSourceIDs"));
      [v12 setObject:v13 forKeyedSubscript:@"vcSessionSpatialSourceIDs"];
    }
  }

  +[VCSessionManager addNSError:a6 toXPCArgumentDictionary:v12];
  id v14 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v14 sendMessageAsync:"vcSessionAddParticipantDidSuceed" arguments:v12 context:a3];
}

- (void)vcSession:(id)a3 removeParticipantWithID:(id)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithBool:", a5), @"vcSessionSucceeded", a4, @"vcSessionParticipantID", 0);
  +[VCSessionManager addNSError:a6 toXPCArgumentDictionary:v8];
  id v9 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v9 sendMessageAsync:"vcSessionRemoveParticipantDidSucceed" arguments:v8 context:a3];
}

- (void)vcSession:(id)a3 updateConfiguration:(id)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithBool:", a5), @"vcSessionSucceeded", a4, @"vcSessionConfiguration", 0);
  +[VCSessionManager addNSError:a6 toXPCArgumentDictionary:v8];
  id v9 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v9 sendMessageAsync:"vcSessionDidUpdateConfiguration" arguments:v8 context:a3];
}

- (void)vcSession:(id)a3 oneToOneModeEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a4;
  id v9 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v10 = [NSNumber numberWithBool:a5];
  uint64_t v11 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, @"vcSessionSucceeded", objc_msgSend(NSNumber, "numberWithBool:", v7), @"vcSessionOneOnOneModeEnabled", 0);
  +[VCSessionManager addNSError:a6 toXPCArgumentDictionary:v11];
  id v12 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v12 sendMessageAsync:"vcSessionSetOneToOneEnabledDidChange" arguments:v11 context:a3];
}

- (void)vcSession:(id)a3 participantID:(id)a4 audioEnabled:(BOOL)a5 didSucceed:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  uint64_t v11 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v12 = [NSNumber numberWithBool:a5];
  uint64_t v13 = objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", @"vcSessionAudioEnabledDidSucceed", @"vcServiceType", a4, @"vcSessionParticipantID", v12, @"vcSessionParameterAudioEnabled", objc_msgSend(NSNumber, "numberWithBool:", v8), @"vcSessionSucceeded", 0);
  +[VCSessionManager addNSError:a7 toXPCArgumentDictionary:v13];
  id v14 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v14 sendMessageAsync:"vcSessionAudioEnabledDidSucceed" arguments:v13 context:a3];
}

- (void)vcSession:(id)a3 participantID:(id)a4 videoEnabled:(BOOL)a5 didSucceed:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  uint64_t v11 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v12 = [NSNumber numberWithBool:a5];
  uint64_t v13 = objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", @"vcSessionVideoEnabledDidSucceed", @"vcServiceType", a4, @"vcSessionParticipantID", v12, @"vcSessionParameterVideoEnabled", objc_msgSend(NSNumber, "numberWithBool:", v8), @"vcSessionSucceeded", 0);
  +[VCSessionManager addNSError:a7 toXPCArgumentDictionary:v13];
  id v14 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v14 sendMessageAsync:"vcSessionVideoEnabledDidSucceed" arguments:v13 context:a3];
}

- (void)vcSession:(id)a3 participantID:(id)a4 screenEnabled:(BOOL)a5 didSucceed:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  uint64_t v11 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v12 = [NSNumber numberWithBool:a5];
  uint64_t v13 = objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", @"vcSessionScreenEnabledDidSucceed", @"vcServiceType", a4, @"vcSessionParticipantID", v12, @"vcSessionParameterScreenEnabled", objc_msgSend(NSNumber, "numberWithBool:", v8), @"vcSessionSucceeded", 0);
  +[VCSessionManager addNSError:a7 toXPCArgumentDictionary:v13];
  id v14 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v14 sendMessageAsync:"vcSessionScreenEnabledDidSucceed" arguments:v13 context:a3];
}

- (void)vcSession:(id)a3 participantID:(id)a4 remoteAudioEnabledDidChange:(BOOL)a5
{
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", @"vcSessionRemoteAudioEnabledDidChange", @"vcServiceType", a4, @"vcSessionParticipantID", objc_msgSend(NSNumber, "numberWithBool:", a5), @"vcSessionParameterAudioEnabled", 0);
  id v7 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v7 sendMessageAsync:"vcSessionRemoteAudioEnabledDidChange" arguments:v6 context:a3];
}

- (void)vcSession:(id)a3 participantID:(id)a4 remoteVideoEnabledDidChange:(BOOL)a5
{
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", @"vcSessionRemoteVideoEnabledDidChange", @"vcServiceType", a4, @"vcSessionParticipantID", objc_msgSend(NSNumber, "numberWithBool:", a5), @"vcSessionParameterVideoEnabled", 0);
  id v7 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v7 sendMessageAsync:"vcSessionRemoteVideoEnabledDidChange" arguments:v6 context:a3];
}

- (void)vcSession:(id)a3 participantID:(id)a4 remoteScreenEnabledDidChange:(BOOL)a5
{
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", @"vcSessionRemoteScreenEnabledDidChange", @"vcServiceType", a4, @"vcSessionParticipantID", objc_msgSend(NSNumber, "numberWithBool:", a5), @"vcSessionParameterScreenEnabled", 0);
  id v7 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v7 sendMessageAsync:"vcSessionRemoteScreenEnabledDidChange" arguments:v6 context:a3];
}

- (void)vcSession:(id)a3 participantID:(id)a4 audioPaused:(BOOL)a5 didSucceed:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  uint64_t v11 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v12 = [NSNumber numberWithBool:a5];
  uint64_t v13 = objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", @"vcSessionAudioPausedDidSucceed", @"vcServiceType", a4, @"vcSessionParticipantID", v12, @"vcSessionParameterAudioPaused", objc_msgSend(NSNumber, "numberWithBool:", v8), @"vcSessionSucceeded", 0);
  +[VCSessionManager addNSError:a7 toXPCArgumentDictionary:v13];
  id v14 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v14 sendMessageAsync:"vcSessionAudioPausedDidSucceed" arguments:v13 context:a3];
}

- (void)vcSession:(id)a3 participantID:(id)a4 videoPaused:(BOOL)a5 didSucceed:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  uint64_t v11 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v12 = [NSNumber numberWithBool:a5];
  uint64_t v13 = objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", @"vcSessionVideoPausedDidSucceed", @"vcServiceType", a4, @"vcSessionParticipantID", v12, @"vcSessionParameterVideoPaused", objc_msgSend(NSNumber, "numberWithBool:", v8), @"vcSessionSucceeded", 0);
  +[VCSessionManager addNSError:a7 toXPCArgumentDictionary:v13];
  id v14 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v14 sendMessageAsync:"vcSessionVideoPausedDidSucceed" arguments:v13 context:a3];
}

- (void)vcSession:(id)a3 participantID:(id)a4 remoteAudioPausedDidChange:(BOOL)a5
{
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", @"vcSessionRemoteAudioPausedDidChange", @"vcServiceType", a4, @"vcSessionParticipantID", objc_msgSend(NSNumber, "numberWithBool:", a5), @"vcSessionParameterAudioPaused", 0);
  id v7 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v7 sendMessageAsync:"vcSessionRemoteAudioPausedDidChange" arguments:v6 context:a3];
}

- (void)vcSession:(id)a3 participantID:(id)a4 remoteVideoPausedDidChange:(BOOL)a5
{
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", @"vcSessionRemoteVideoPausedDidChange", @"vcServiceType", a4, @"vcSessionParticipantID", objc_msgSend(NSNumber, "numberWithBool:", a5), @"vcSessionParameterVideoPaused", 0);
  id v7 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v7 sendMessageAsync:"vcSessionRemoteVideoPausedDidChange" arguments:v6 context:a3];
}

- (void)vcSession:(id)a3 participantID:(id)a4 mediaStateDidChange:(unsigned int)a5 forMediaType:(unsigned int)a6 didSucceed:(BOOL)a7 error:(id)a8
{
  BOOL v9 = a7;
  uint64_t v10 = *(void *)&a5;
  uint64_t v13 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v14 = [NSNumber numberWithUnsignedInt:*(void *)&a6];
  uint64_t v15 = [NSNumber numberWithUnsignedInt:v10];
  uint64_t v16 = objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", @"vcSessionMediaStateDidChange", @"vcServiceType", a4, @"vcSessionParticipantID", v14, @"vcSessionParameterMediaType", v15, @"vcSessionParameterMediaState", objc_msgSend(NSNumber, "numberWithBool:", v9), @"vcSessionSucceeded", 0);
  +[VCSessionManager addNSError:a8 toXPCArgumentDictionary:v16];
  id v17 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v17 sendMessageAsync:"vcSessionMediaStateDidChange" arguments:v16 context:a3];
}

- (void)vcSession:(id)a3 participantID:(id)a4 remoteMediaStateDidChange:(unsigned int)a5 forMediaType:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a5;
  BOOL v9 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v10 = [NSNumber numberWithUnsignedInt:*(void *)&a6];
  uint64_t v11 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", @"vcSessionRemoteMediaStateDidChange", @"vcServiceType", a4, @"vcSessionParticipantID", v10, @"vcSessionParameterMediaType", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v6), @"vcSessionParameterMediaState", 0);
  id v12 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v12 sendMessageAsync:"vcSessionRemoteMediaStateDidChange" arguments:v11 context:a3];
}

- (void)vcSession:(id)a3 participantID:(id)a4 mixingDidChangeForMediaType:(unsigned int)a5 mixingMediaType:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  v9[4] = *MEMORY[0x1E4F143B8];
  v8[0] = @"vcServiceType";
  v8[1] = @"vcSessionParticipantID";
  v9[0] = @"vcSessionRemoteMixingMediaDidChange";
  v9[1] = a4;
  v8[2] = @"vcSessionParameterMediaType";
  v9[2] = [NSNumber numberWithUnsignedInt:*(void *)&a5];
  v8[3] = @"vcSessionParameterMixingMediaType";
  v9[3] = [NSNumber numberWithUnsignedInt:v6];
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcSessionRemoteMixingMediaDidChange", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v9, v8, 4), a3);
}

- (void)vcSessionShouldReconnect:(id)a3
{
  id v4 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v4 sendMessageAsync:"vcSessionShouldReconnect" arguments:&unk_1F3DC8C00 context:a3];
}

- (void)vcSession:(id)a3 participantID:(id)a4 didChangeMediaPriority:(unsigned __int8)a5 description:(id)a6
{
  uint64_t v7 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v10 setObject:@"vcSessionMediaPrioritiesDidChange" forKeyedSubscript:@"vcServiceType"];
  [v10 setObject:a4 forKeyedSubscript:@"vcSessionParticipantID"];
  objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", v7), @"vcSessionParameterParticipantMediaPriority");
  if (a6) {
    [v10 setObject:a6 forKeyedSubscript:@"vcSessionParameterParticipantMediaPriorityString"];
  }
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcSessionMediaPrioritiesDidChange", v10, a3);
}

- (void)vcSession:(id)a3 participantID:(id)a4 reactionDidStart:(id)a5
{
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v8 setObject:@"vcSessionReactionDidStart" forKeyedSubscript:@"vcServiceType"];
  [v8 setObject:a4 forKeyedSubscript:@"vcSessionParticipantID"];
  [v8 setObject:a5 forKeyedSubscript:@"vcSessionParameterReactionType"];
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcSessionReactionDidStart", v8, a3);
}

- (void)vcSession:(id)a3 participantDidStopReacting:(id)a4
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v6 setObject:@"vcSessionReactionDidStopReacting" forKeyedSubscript:@"vcServiceType"];
  [v6 setObject:a4 forKeyedSubscript:@"vcSessionParticipantID"];
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcSessionReactionDidStopReacting", v6, a3);
}

- (void)vcSession:(id)a3 participantID:(id)a4 didDetectError:(id)a5
{
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", a4, @"vcSessionParticipantID", 0);
  +[VCSessionManager addNSError:a5 toXPCArgumentDictionary:v7];
  id v8 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v8 sendMessageAsync:"vcSessionDidDetectError" arguments:v7 context:a3];
}

- (void)registerBlocksForService
{
  v7[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__VCSessionManager_registerBlocksForService__block_invoke;
  v7[3] = &unk_1E6DB5FF8;
  v7[4] = v3;
  v7[5] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionInitialize", v7, self->_xpcCommandQueue);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__VCSessionManager_registerBlocksForService__block_invoke_195;
  v6[3] = &unk_1E6DB5478;
  v6[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionTerminate", v6, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionRemoveParticipants", &__block_literal_global_200, self->_xpcCommandQueue);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__VCSessionManager_registerBlocksForService__block_invoke_2;
  v5[3] = &unk_1E6DB5478;
  v5[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionStart", v5, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionStop", &__block_literal_global_210, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionUpdateConfiguration", &__block_literal_global_214, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton", MEMORY[0x1E4F143A8], 3221225472, __44__VCSessionManager_registerBlocksForService__block_invoke_5, &unk_1E6DB5478, v3), "registerBlockForService:block:queue:", "vcSessionAddParticipants", &v4, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionSetMute", &__block_literal_global_224, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionSetScreenControlEnabled", &__block_literal_global_231, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionSetVolume", &__block_literal_global_238, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionSetAudioPosition", &__block_literal_global_251, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionSetAudioEnabled", &__block_literal_global_258, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionSetVideoEnabled", &__block_literal_global_262, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionSetScreenEnabled", &__block_literal_global_266, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionSetAudioPaused", &__block_literal_global_270, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionSetVideoPaused", &__block_literal_global_274, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionSetMediaState", &__block_literal_global_278, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionSetOneToOneEnabled", &__block_literal_global_282, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcSessionUpdateParticipantConfiguration", &__block_literal_global_286_0, self->_xpcCommandQueue);
}

void *__44__VCSessionManager_registerBlocksForService__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[*(id *)(a1 + 32) strong];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  id v6 = -[VCSession initWithIDSDestination:configurationDict:negotiationData:delegate:processId:isGKVoiceChat:]([VCSession alloc], "initWithIDSDestination:configurationDict:negotiationData:delegate:processId:isGKVoiceChat:", [a2 objectForKeyedSubscript:@"vcSessionIDSDestination"], objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionConfiguration"), objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionParticipantData"), v4, objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"CLIENTPID"), "intValue"), 0);
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  [(VCSession *)v6 setSharingEnabled:*(unsigned __int8 *)(*(void *)(a1 + 40) + 32)];
  [(VCSession *)v7 setScreenAndCameraMixingEnabled:*(unsigned __int8 *)(*(void *)(a1 + 40) + 33)];
  id v8 = objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "newNSDictionaryWidthNSDictionary:", -[VCSessionParticipant participantStreamTokens](-[VCSession localParticipant](v7, "localParticipant"), "participantStreamTokens"));
  objc_msgSend((id)objc_msgSend(v4, "sessions"), "setObject:forKeyedSubscript:", v7, -[VCSession uuid](v7, "uuid"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    id v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v16 = v9;
      __int16 v17 = 2080;
      v18 = "-[VCSessionManager registerBlocksForService]_block_invoke";
      __int16 v19 = 1024;
      int v20 = 347;
      __int16 v21 = 2048;
      uint64_t v22 = v7;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sessionInitializeBlock allocated new VCSession[%p]", buf, 0x26u);
    }
  }
  v14[0] = v7;
  v14[1] = [(VCSession *)v7 uuid];
  v14[2] = MEMORY[0x1E4F1CC38];
  v13[2] = @"vcSessionSucceeded";
  v13[3] = @"vcSessionParticipantID";
  v14[3] = [(VCSessionParticipant *)[(VCSession *)v7 localParticipant] uuid];
  v13[4] = @"vcSessionParticipantData";
  v14[4] = [(VCSessionParticipant *)[(VCSession *)v7 localParticipant] opaqueData];
  v13[5] = @"vcSessionToken";
  v14[5] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCSession transportSessionID](v7, "transportSessionID"));
  v13[6] = @"vcSessionCapabilities";
  v13[7] = @"vcSessionParameterStreamTokens";
  v14[6] = [(VCSession *)v7 capabilities];
  v14[7] = v8;
  uint64_t v5 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:8];
  id v11 = v5;

  return v5;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_195(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[*(id *)(a1 + 32) strong];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v4 = objc_msgSend(v5, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"CONTEXT", 0);
  }
  id v6 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      id v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v11 = v7;
        __int16 v12 = 2080;
        uint64_t v13 = "-[VCSessionManager registerBlocksForService]_block_invoke";
        __int16 v14 = 1024;
        int v15 = 380;
        __int16 v16 = 2048;
        __int16 v17 = v6;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sessionTerminateBlock releasing old VCSession[%p]", buf, 0x26u);
      }
    }
    [v6 stopWithError:0];
    [v3 releaseSession:v6];
  }
  return v4;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_198(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"vcSessionParticipantIDs"];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v10 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          [v3 removeParticipant:*(void *)(*((void *)&v11 + 1) + 8 * v8++)];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v10 count:16];
      }
      while (v6);
    }
  }
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_2(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    objc_msgSend((id)objc_msgSend(v4, "localParticipant"), "updateMediaSettingsWithConfig:", objc_msgSend(*(id *)(a1 + 32), "participantConfigFromXPCDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionLocalParticipantConfig")));
    [v4 start];
  }
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_3(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"vcSessionError"];
    if (v4) {
      uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithDomain:code:userInfo:", objc_msgSend(v4, "objectForKeyedSubscript:", @"ERROR_DOMAIN"), (int)objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"ERROR_CODE"), "intValue"), objc_msgSend(v4, "objectForKeyedSubscript:", @"ERROR_USERINFO"));
    }
    [v3 stopWithError:v4];
  }
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_4(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"), "updateConfiguration:", objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionConfiguration"));
  }
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"vcSessionParticipantConfigs"];
    uint64_t v5 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"CLIENTPID"), "intValue");
    uint64_t v6 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v4, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v8 = [v4 countByEnumeratingWithState:&v28 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v29;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v4);
          }
          long long v12 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "participantConfigFromXPCDictionary:", *(void *)(*((void *)&v28 + 1) + 8 * v11));
          [v12 setProcessId:v5];
          [v7 addObject:v12];
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v4 countByEnumeratingWithState:&v28 objects:v27 count:16];
      }
      while (v9);
    }
    [v6 addParticipantConfigurations:v7];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      long long v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (v4) {
          uint64_t v15 = (const char *)objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String");
        }
        else {
          uint64_t v15 = "<nil>";
        }
        int v17 = 136316162;
        uint64_t v18 = v13;
        __int16 v19 = 2080;
        int v20 = "-[VCSessionManager registerBlocksForService]_block_invoke_5";
        __int16 v21 = 1024;
        int v22 = 462;
        __int16 v23 = 2080;
        uint64_t v24 = v15;
        __int16 v25 = 2048;
        uint64_t v26 = v6;
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d adding new VCSessionParticipant(s) with config(s):%s to VCSession[%p]", (uint8_t *)&v17, 0x30u);
      }
    }
  }
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_222(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"), "participantForID:", objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionParticipantID")), "setMuted:", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionParameterMute"), "BOOLValue"));
  }
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_2_229(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v5 = [a2 objectForKeyedSubscript:@"vcSessionParticipantID"];
    uint64_t v6 = (void *)[a2 objectForKeyedSubscript:@"vcSessionParameterParticipantScreenControlEnabled"];
    uint64_t v7 = (void *)[v4 participantForID:v5];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend(v7, "setScreenControlEnabled:", objc_msgSend(v6, "BOOLValue"));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 136316162;
          uint64_t v13 = v8;
          __int16 v14 = 2080;
          uint64_t v15 = "-[VCSessionManager registerBlocksForService]_block_invoke_2";
          __int16 v16 = 1024;
          int v17 = 490;
          __int16 v18 = 2048;
          __int16 v19 = v7;
          __int16 v20 = 1024;
          int v21 = [v6 BOOLValue];
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d changing VCSessionParticipant[%p] screenControlEnabled to %d", (uint8_t *)&v12, 0x2Cu);
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v12 = 136316162;
        uint64_t v13 = v10;
        __int16 v14 = 2080;
        uint64_t v15 = "-[VCSessionManager registerBlocksForService]_block_invoke";
        __int16 v16 = 1024;
        int v17 = 492;
        __int16 v18 = 2048;
        __int16 v19 = v7;
        __int16 v20 = 1024;
        int v21 = [v6 BOOLValue];
        _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d cannot set VCSessionParticipant[%p] screenControlEnabled to %d on a local participant", (uint8_t *)&v12, 0x2Cu);
      }
    }
  }
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_236(uint64_t a1, void *a2, void *a3)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"), "participantForID:", objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionParticipantID"));
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionParameterVolume"), "floatValue");
    char v6 = objc_msgSend(v5, "setVolume:");
    if (a3)
    {
      if ((v6 & 1) == 0) {
        *a3 = +[VCSessionErrorUtils VCSessionParticipantErrorEvent:errorPath:](VCSessionErrorUtils, "VCSessionParticipantErrorEvent:errorPath:", 11, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSessionManager.m", 509));
      }
    }
  }
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_2_249(uint64_t a1, void *a2, void *a3)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"), "participantForID:", objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionParticipantID"));
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionParameterAudioPosition"), "floatValue");
    char v6 = objc_msgSend(v5, "setAudioPosition:");
    if (a3)
    {
      if ((v6 & 1) == 0) {
        *a3 = +[VCSessionErrorUtils VCSessionParticipantErrorEvent:errorPath:](VCSessionErrorUtils, "VCSessionParticipantErrorEvent:errorPath:", 1, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSessionManager.m", 527));
      }
    }
  }
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_3_256(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = [a2 objectForKeyedSubscript:@"vcSessionParticipantID"];
    uint64_t v5 = (void *)[a2 objectForKeyedSubscript:@"vcSessionParameterAudioEnabled"];
    char v6 = (void *)[v3 participantForID:v4];
    objc_msgSend(v6, "setAudioEnabled:", objc_msgSend(v5, "BOOLValue"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316162;
        uint64_t v11 = v7;
        __int16 v12 = 2080;
        uint64_t v13 = "-[VCSessionManager registerBlocksForService]_block_invoke_3";
        __int16 v14 = 1024;
        int v15 = 543;
        __int16 v16 = 2048;
        int v17 = v6;
        __int16 v18 = 1024;
        int v19 = [v5 BOOLValue];
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d changing VCSessionParticipant[%p] audioEnabled to %d", (uint8_t *)&v10, 0x2Cu);
      }
    }
  }
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_260(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = [a2 objectForKeyedSubscript:@"vcSessionParticipantID"];
    uint64_t v5 = (void *)[a2 objectForKeyedSubscript:@"vcSessionParameterVideoEnabled"];
    if ([v3 oneToOneModeEnabled])
    {
      if ([v5 BOOLValue]) {
        uint64_t v6 = 1;
      }
      else {
        uint64_t v6 = [v3 isUsingPersonaCamera];
      }
      [v3 updateOneToOneRateControllerForVideoEnabled:v6];
    }
    uint64_t v7 = (void *)[v3 participantForID:v4];
    objc_msgSend(v7, "setVideoEnabled:", objc_msgSend(v5, "BOOLValue"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136316162;
        uint64_t v12 = v8;
        __int16 v13 = 2080;
        __int16 v14 = "-[VCSessionManager registerBlocksForService]_block_invoke";
        __int16 v15 = 1024;
        int v16 = 560;
        __int16 v17 = 2048;
        __int16 v18 = v7;
        __int16 v19 = 1024;
        int v20 = [v5 BOOLValue];
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d changing VCSessionParticipant[%p] videoEnabled to %d", (uint8_t *)&v11, 0x2Cu);
      }
    }
  }
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_264(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = [a2 objectForKeyedSubscript:@"vcSessionParticipantID"];
    uint64_t v5 = (void *)[a2 objectForKeyedSubscript:@"vcSessionParameterScreenEnabled"];
    if ([v3 oneToOneModeEnabled]) {
      objc_msgSend(v3, "updateOneToOneRateControllerForVideoEnabled:screenEnabled:", objc_msgSend(v3, "isOneToOneUsingVideo"), objc_msgSend(v5, "BOOLValue"));
    }
    uint64_t v6 = (void *)[v3 participantForID:v4];
    objc_msgSend(v6, "setScreenEnabled:", objc_msgSend(v5, "BOOLValue"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316162;
        uint64_t v11 = v7;
        __int16 v12 = 2080;
        __int16 v13 = "-[VCSessionManager registerBlocksForService]_block_invoke";
        __int16 v14 = 1024;
        int v15 = 577;
        __int16 v16 = 2048;
        __int16 v17 = v6;
        __int16 v18 = 1024;
        int v19 = [v5 BOOLValue];
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d changing VCSessionParticipant[%p] screenEnabled to %d", (uint8_t *)&v10, 0x2Cu);
      }
    }
  }
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_268(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"), "participantForID:", objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionParticipantID")), "setAudioPaused:", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionParameterAudioPaused"), "BOOLValue"));
  }
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_2_272(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"), "participantForID:", objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionParticipantID")), "setVideoPaused:", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionParameterVideoPaused"), "BOOLValue"));
  }
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_3_276(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = [a2 objectForKeyedSubscript:@"vcSessionParticipantID"];
    uint64_t v5 = (void *)[a2 objectForKeyedSubscript:@"vcSessionParameterMediaType"];
    uint64_t v6 = (void *)[a2 objectForKeyedSubscript:@"vcSessionParameterMediaState"];
    uint64_t v7 = (void *)[v3 participantForID:v4];
    objc_msgSend(v7, "setMediaState:forMediaType:", objc_msgSend(v6, "unsignedIntValue"), objc_msgSend(v5, "unsignedIntValue"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136316418;
        uint64_t v12 = v8;
        __int16 v13 = 2080;
        __int16 v14 = "-[VCSessionManager registerBlocksForService]_block_invoke_3";
        __int16 v15 = 1024;
        int v16 = 618;
        __int16 v17 = 2048;
        __int16 v18 = v7;
        __int16 v19 = 1024;
        int v20 = [v5 unsignedIntValue];
        __int16 v21 = 1024;
        int v22 = [v6 unsignedIntValue];
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d changing VCSessionParticipant=%p mediaType=%d to state=%d", (uint8_t *)&v11, 0x32u);
      }
    }
    if ([v3 oneToOneModeEnabled]) {
      objc_msgSend(v3, "updateOneToOneRateControllerForVideoEnabled:", objc_msgSend(v3, "isOneToOneUsingVideo"));
    }
  }
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_280(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"), "setOneToOneModeEnabled:", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionOneOnOneModeEnabled"), "BOOLValue"));
  }
  return 0;
}

uint64_t __44__VCSessionManager_registerBlocksForService__block_invoke_2_284(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    __int16 v21 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    int v22 = a2;
    id obj = (id)[a2 objectForKeyedSubscript:@"vcSessionParameterParticipantConfiguration"];
    uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(obj, "count"));
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v27 = [obj countByEnumeratingWithState:&v43 objects:v42 count:16];
    if (v27)
    {
      uint64_t v3 = @"vcSessionParticipantID";
      uint64_t v4 = *(void *)v44;
      uint64_t v5 = @"vcSessionParameterVideoQuality";
      uint64_t v6 = @"vcSessionParameterVisibilityIndex";
      uint64_t v7 = @"vcSessionParameterProminenceIndex";
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v44 != v4) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          int v10 = objc_alloc_init(VCSessionParticipantConfig);
          -[VCSessionParticipantConfig setUuid:](v10, "setUuid:", [v9 objectForKeyedSubscript:v3]);
          -[VCSessionParticipantConfig setVideoQuality:](v10, "setVideoQuality:", objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v5), "integerValue"));
          -[VCSessionParticipantConfig setVisibilityIndex:](v10, "setVisibilityIndex:", objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v6), "unsignedIntegerValue"));
          -[VCSessionParticipantConfig setProminenceIndex:](v10, "setProminenceIndex:", objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v7), "unsignedIntegerValue"));
          -[VCSessionParticipantConfig setPositionalInfo:](v10, "setPositionalInfo:", [v9 objectForKeyedSubscript:@"vcSessionPositionalInfo"]);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v11 = VRTraceErrorLogLevelToCSTR();
            uint64_t v12 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v24 = [(VCSessionParticipantConfig *)v10 uuid];
              int v23 = [(VCSessionParticipantConfig *)v10 videoQuality];
              __int16 v13 = v7;
              __int16 v14 = v6;
              __int16 v15 = v5;
              uint64_t v16 = v4;
              __int16 v17 = v3;
              unsigned int v18 = [(VCSessionParticipantConfig *)v10 visibilityIndex];
              unsigned int v19 = [(VCSessionParticipantConfig *)v10 prominenceIndex];
              *(_DWORD *)buf = 136316674;
              uint64_t v29 = v11;
              __int16 v30 = 2080;
              long long v31 = "-[VCSessionManager registerBlocksForService]_block_invoke_2";
              __int16 v32 = 1024;
              int v33 = 650;
              __int16 v34 = 2112;
              uint64_t v35 = v24;
              __int16 v36 = 1024;
              int v37 = v23;
              __int16 v38 = 1024;
              unsigned int v39 = v18;
              uint64_t v3 = v17;
              uint64_t v4 = v16;
              uint64_t v5 = v15;
              uint64_t v6 = v14;
              uint64_t v7 = v13;
              __int16 v40 = 1024;
              unsigned int v41 = v19;
              _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d participantUUID[%@] videoQuality[%d] visibilityIndex[%d] prominenceIndex[%d]", buf, 0x38u);
            }
          }
          [v26 addObject:v10];
        }
        uint64_t v27 = [obj countByEnumeratingWithState:&v43 objects:v42 count:16];
      }
      while (v27);
    }
    [v21 updateParticipantConfigurations:v26];
    objc_msgSend(v21, "updatePresentationInfo:", objc_msgSend(v22, "objectForKeyedSubscript:", @"vcSessionPresentationInfo"));
  }
  return 0;
}

- (void)deregisterBlocksForService
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionInitialize");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionTerminate");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionRemoveParticipants");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionStart");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionStop");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionUpdateConfiguration");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionAddParticipants");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionSetMute");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionSetVolume");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionSetScreenControlEnabled");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionSetAudioPosition");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionSetAudioEnabled");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionSetVideoEnabled");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionSetScreenEnabled");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionSetAudioPaused");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionSetVideoPaused");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcSessionSetOneToOneEnabled");
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v2 deregisterFromService:"vcSessionSetMediaState"];
}

- (id)participantConfigFromXPCDictionary:(id)a3
{
  uint64_t v4 = objc_alloc_init(VCSessionParticipantConfig);
  -[VCSessionParticipantConfig setIdsParticipantID:](v4, "setIdsParticipantID:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcSessionIDSParticipantID"), "unsignedLongLongValue"));
  -[VCSessionParticipantConfig setUuid:](v4, "setUuid:", [a3 objectForKeyedSubscript:@"vcSessionParticipantID"]);
  -[VCSessionParticipantConfig setParticipantData:](v4, "setParticipantData:", [a3 objectForKeyedSubscript:@"vcSessionParticipantData"]);
  -[VCSessionParticipantConfig setAudioEnabled:](v4, "setAudioEnabled:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcSessionParameterAudioEnabled"), "BOOLValue"));
  -[VCSessionParticipantConfig setVideoEnabled:](v4, "setVideoEnabled:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcSessionParameterVideoEnabled"), "BOOLValue"));
  -[VCSessionParticipantConfig setScreenEnabled:](v4, "setScreenEnabled:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcSessionParameterScreenEnabled"), "BOOLValue"));
  -[VCSessionParticipantConfig setScreenControlEnabled:](v4, "setScreenControlEnabled:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcSessionParameterParticipantScreenControlEnabled"), "BOOLValue"));
  -[VCSessionParticipantConfig setAudioMuted:](v4, "setAudioMuted:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcSessionParameterMute"), "BOOLValue"));
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcSessionParameterVolume"), "floatValue");
  -[VCSessionParticipantConfig setVolume:](v4, "setVolume:");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcSessionParameterAudioPosition"), "floatValue");
  -[VCSessionParticipantConfig setAudioPosition:](v4, "setAudioPosition:");
  -[VCSessionParticipantConfig setAudioPaused:](v4, "setAudioPaused:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcSessionParameterAudioPaused"), "BOOLValue"));
  -[VCSessionParticipantConfig setVideoPaused:](v4, "setVideoPaused:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcSessionParameterVideoPaused"), "BOOLValue"));
  -[VCSessionParticipantConfig setVideoQuality:](v4, "setVideoQuality:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcSessionParameterVideoQuality"), "unsignedIntegerValue"));
  -[VCSessionParticipantConfig setVisibilityIndex:](v4, "setVisibilityIndex:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcSessionParameterVisibilityIndex"), "unsignedIntegerValue"));
  -[VCSessionParticipantConfig setProminenceIndex:](v4, "setProminenceIndex:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcSessionParameterProminenceIndex"), "unsignedIntegerValue"));
  -[VCSessionParticipantConfig setPositionalInfo:](v4, "setPositionalInfo:", [a3 objectForKeyedSubscript:@"vcSessionPositionalInfo"]);
  -[VCSessionParticipantConfig setMediaStates:](v4, "setMediaStates:", +[AVCSessionParticipant unarchiveMediaStatesWithData:](AVCSessionParticipant, "unarchiveMediaStatesWithData:", [a3 objectForKeyedSubscript:@"vcSessionParameterMediaStates"]));
  return v4;
}

- (void)releaseSession:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__VCSessionManager_releaseSession___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = a3;
  void block[5] = self;
  dispatch_async(sessionQueue, block);
}

void __35__VCSessionManager_releaseSession___block_invoke(uint64_t a1)
{
  block[6] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) startDeallocTimer];
  uint64_t v2 = [*(id *)(a1 + 32) uuid];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(NSObject **)(v3 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__VCSessionManager_releaseSession___block_invoke_2;
  block[3] = &unk_1E6DB3E40;
  block[4] = v3;
  void block[5] = v2;
  dispatch_async(v4, block);
}

uint64_t __35__VCSessionManager_releaseSession___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) sessions];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setObject:0 forKeyedSubscript:v3];
}

- (NSMutableDictionary)sessions
{
  return self->_sessions;
}

- (BOOL)sharingEnabled
{
  return self->_sharingEnabled;
}

- (BOOL)screenAndCameraMixingEnabled
{
  return self->_screenAndCameraMixingEnabled;
}

@end