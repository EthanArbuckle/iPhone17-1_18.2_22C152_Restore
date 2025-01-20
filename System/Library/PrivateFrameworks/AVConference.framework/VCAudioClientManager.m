@interface VCAudioClientManager
+ (id)sharedInstance;
- (BOOL)dispatchedHandleMuteStateChangedHandlerForAudioClient:(id)a3 enabled:(BOOL)a4 error:(id *)a5;
- (VCAudioClientManager)init;
- (id)getAudioClientWithProcessId:(id)a3 create:(BOOL)a4;
- (id)handleDisconnectWithXPCArguments:(id)a3;
- (id)handleNewClientWithXPCArguments:(id)a3 error:(id *)a4;
- (id)handleRegisterMutedTalkerNotificationForAudioClient:(id)a3 error:(id *)a4;
- (id)handleUnregisterMutedTalkerNotificationForAudioClient:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)dispatchedHandleMuteStateChanged:(BOOL)a3 reason:(unsigned __int8)a4;
- (void)handleMutedTalkerNotification:(unsigned int)a3;
- (void)registerBlocksForService;
- (void)registerForMutedTalkerNotfications;
- (void)registerMuteStateChangedHandler;
- (void)secureMicrophoneEngagedNotification;
- (void)unregisterBlocksForService;
- (void)unregisterFromMutedTalkerNotfications;
- (void)unregisterMuteStateChangedHandler;
@end

@implementation VCAudioClientManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_15 != -1) {
    dispatch_once(&sharedInstance_onceToken_15, &__block_literal_global_85);
  }
  return (id)sharedInstance__vcAudioClientManager;
}

void __38__VCAudioClientManager_sharedInstance__block_invoke()
{
  if (!sharedInstance__vcAudioClientManager) {
    sharedInstance__vcAudioClientManager = objc_alloc_init(VCAudioClientManager);
  }
}

- (VCAudioClientManager)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCAudioClientManager;
  v2 = [(VCAudioClientManager *)&v5 init];
  if (v2)
  {
    v2->_clientList = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(62);
    v2->_xpcCommandQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCAudioClientManager.XPCCommandQueue", 0, CustomRootQueue);
    [(VCAudioClientManager *)v2 registerForMutedTalkerNotfications];
    [(VCAudioClientManager *)v2 registerMuteStateChangedHandler];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCAudioClientManager *)self unregisterMuteStateChangedHandler];
  [(VCAudioClientManager *)self unregisterFromMutedTalkerNotfications];
  [(VCAudioClientManager *)self unregisterBlocksForService];
  dispatch_release((dispatch_object_t)self->_xpcCommandQueue);

  v3.receiver = self;
  v3.super_class = (Class)VCAudioClientManager;
  [(VCAudioClientManager *)&v3 dealloc];
}

- (id)getAudioClientWithProcessId:(id)a3 create:(BOOL)a4
{
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioClientManager getAudioClientWithProcessId:create:](v12);
      }
    }
    return 0;
  }
  BOOL v4 = a4;
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_clientList, "objectForKeyedSubscript:")) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = !v4;
  }
  if (v7) {
    goto LABEL_8;
  }
  v8 = -[VCAudioClient initWithProcessId:]([VCAudioClient alloc], "initWithProcessId:", [a3 intValue]);
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioClientManager getAudioClientWithProcessId:create:](v13);
      }
    }
    return 0;
  }
  v9 = v8;
  [(NSMutableDictionary *)self->_clientList setObject:v8 forKeyedSubscript:a3];

LABEL_8:
  clientList = self->_clientList;

  return (id)[(NSMutableDictionary *)clientList objectForKeyedSubscript:a3];
}

- (id)handleRegisterMutedTalkerNotificationForAudioClient:(id)a3 error:(id *)a4
{
  if (a3)
  {
    objc_msgSend(a3, "setIsMutedTalkerNotificationRegistered:", 1, a4);
  }
  else if (a4)
  {
    *a4 = (id)[MEMORY[0x1E4F28C58] AVConferenceServiceError:32016 detailCode:0 description:@"Audio client not registered"];
  }
  return 0;
}

- (id)handleUnregisterMutedTalkerNotificationForAudioClient:(id)a3 error:(id *)a4
{
  if (a3)
  {
    objc_msgSend(a3, "setIsMutedTalkerNotificationRegistered:", 0, a4);
  }
  else if (a4)
  {
    *a4 = (id)[MEMORY[0x1E4F28C58] AVConferenceServiceError:32016 detailCode:0 description:@"Audio client not registered"];
  }
  return 0;
}

- (void)handleMutedTalkerNotification:(unsigned int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__VCAudioClientManager_handleMutedTalkerNotification___block_invoke;
  block[3] = &unk_1E6DB3F08;
  unsigned int v5 = a3;
  block[4] = self;
  dispatch_async(xpcCommandQueue, block);
}

uint64_t __54__VCAudioClientManager_handleMutedTalkerNotification___block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v14 = @"mutedTalkerNotificationType";
  v15[0] = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) allValues];
  uint64_t result = [v3 countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        if ([v8 isMutedTalkerNotificationRegistered]) {
          objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "mutedTalkerNotification", v2, v8);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t result = [v3 countByEnumeratingWithState:&v10 objects:v9 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

- (void)registerForMutedTalkerNotfications
{
  v4[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  id v3 = +[VCAudioManager sharedVoiceChatInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__VCAudioClientManager_registerForMutedTalkerNotfications__block_invoke;
  v4[3] = &unk_1E6DB3E68;
  v4[4] = v2;
  [v3 registerForMutedTalkerNotification:v4];
}

uint64_t __58__VCAudioClientManager_registerForMutedTalkerNotfications__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)[*(id *)(a1 + 32) strong];

  return [v3 handleMutedTalkerNotification:a2];
}

- (void)unregisterFromMutedTalkerNotfications
{
  id v2 = +[VCAudioManager sharedVoiceChatInstance];

  [v2 unregisterFromMutedTalkerNotification];
}

- (BOOL)dispatchedHandleMuteStateChangedHandlerForAudioClient:(id)a3 enabled:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcCommandQueue);
  if (a3)
  {
    if ([a3 isMutedStateChangeHandlerRegistered] != v6)
    {
      [a3 setIsMutedStateChangeHandlerRegistered:v6];
      return 1;
    }
    if (a5)
    {
      long long v12 = (void *)MEMORY[0x1E4F28C58];
      long long v13 = "NO";
      if (v6) {
        long long v13 = "YES";
      }
      long long v10 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"Audio client isMutedStateChangeHandlerRegistered already is enabled=%s", v13);
      v9 = v12;
      uint64_t v11 = 32000;
      goto LABEL_10;
    }
  }
  else if (a5)
  {
    v9 = (void *)MEMORY[0x1E4F28C58];
    long long v10 = @"Audio client not registered";
    uint64_t v11 = 32016;
LABEL_10:
    v14 = (void *)[v9 AVConferenceServiceError:v11 detailCode:0 description:v10];
    BOOL result = 0;
    *a5 = v14;
    return result;
  }
  return 0;
}

- (void)dispatchedHandleMuteStateChanged:(BOOL)a3 reason:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  BOOL v5 = a3;
  v20[2] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcCommandQueue);
  v19[0] = @"muteStateChangedMuteState";
  v19[1] = @"muteStateChangedReason";
  v20[0] = [NSNumber numberWithBool:v5];
  v20[1] = [NSNumber numberWithUnsignedChar:v4];
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v8 = (void *)[(NSMutableDictionary *)self->_clientList allValues];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v13 isMutedStateChangeHandlerRegistered]) {
          objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "muteStateChangedEvent", v7, v13);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v10);
  }
}

- (void)registerMuteStateChangedHandler
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (VCFeatureFlagManager_UseAvconferenced())
  {
    uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
    objc_msgSend(+[VCAudioSession sharedVoiceChatInstance](VCAudioSession, "sharedVoiceChatInstance", MEMORY[0x1E4F143A8], 3221225472, __55__VCAudioClientManager_registerMuteStateChangedHandler__block_invoke, &unk_1E6DB9220, v3, v5), "setMuteStateChangedHandler:delegateQueue:", &v4, self->_xpcCommandQueue);
  }
}

uint64_t __55__VCAudioClientManager_registerMuteStateChangedHandler__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)[*(id *)(a1 + 32) strong];

  return [v5 dispatchedHandleMuteStateChanged:a2 reason:a3];
}

- (void)unregisterMuteStateChangedHandler
{
  if (VCFeatureFlagManager_UseAvconferenced())
  {
    id v2 = +[VCAudioSession sharedVoiceChatInstance];
    [v2 setMuteStateChangedHandler:0 delegateQueue:0];
  }
}

- (id)handleNewClientWithXPCArguments:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [a3 objectForKeyedSubscript:@"CLIENTPID"];
  v8 = (void *)[a3 objectForKeyedSubscript:@"CONTEXT"];
  if (v8)
  {
    v14 = @"Audio client is already registered";
    if (a4) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
  id v9 = [(VCAudioClientManager *)self getAudioClientWithProcessId:v7 create:1];
  if (!v9)
  {
    v14 = @"Failed to allocate client";
    if (a4)
    {
LABEL_8:
      *a4 = (id)[MEMORY[0x1E4F28C58] AVConferenceServiceError:32029 detailCode:0 description:v14];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        long long v16 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          id v18 = *a4;
          *(_DWORD *)buf = 136316162;
          uint64_t v22 = v15;
          __int16 v23 = 2080;
          v24 = "-[VCAudioClientManager handleNewClientWithXPCArguments:error:]";
          __int16 v25 = 1024;
          int v26 = 243;
          __int16 v27 = 2112;
          uint64_t v28 = v7;
          __int16 v29 = 2112;
          id v30 = v18;
          _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d Connection setup failed for processId=%@ error=%@", buf, 0x30u);
        }
      }
    }
LABEL_11:
    int v13 = 0;
    goto LABEL_12;
  }
  id v10 = v9;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    long long v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v22 = v11;
      __int16 v23 = 2080;
      v24 = "-[VCAudioClientManager handleNewClientWithXPCArguments:error:]";
      __int16 v25 = 1024;
      int v26 = 246;
      __int16 v27 = 2112;
      uint64_t v28 = v7;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Connection setup succeeded for processId=%@", buf, 0x26u);
    }
  }
  int v13 = 1;
  v8 = v10;
LABEL_12:
  v20[1] = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "isMixingVoiceWithMediaEnabled", @"CONTEXT", @"audioClientAudioSessionMixingVoiceWithMedia", v8));
  id result = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:2];
  if (!v13) {
    return 0;
  }
  return result;
}

- (id)handleDisconnectWithXPCArguments:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 objectForKeyedSubscript:@"CONTEXT"];
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioClientManager handleDisconnectWithXPCArguments:]();
      }
    }
    return 0;
  }
  BOOL v6 = (void *)v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = v7;
      __int16 v13 = 2080;
      v14 = "-[VCAudioClientManager handleDisconnectWithXPCArguments:]";
      __int16 v15 = 1024;
      int v16 = 265;
      __int16 v17 = 1024;
      int v18 = [v6 processId];
      __int16 v19 = 2112;
      id v20 = a3;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got notification that client died, tearing down the audio session (client PID=%d), arguments=%@", buf, 0x2Cu);
    }
  }
  *(void *)buf = 0;
  [v6 stopWithError:buf];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_clientList, "setObject:forKeyedSubscript:", 0, objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "processId")));
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", @"CONTEXT");
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
}

- (void)registerBlocksForService
{
  v8[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__VCAudioClientManager_registerBlocksForService__block_invoke;
  v8[3] = &unk_1E6DB5478;
  v8[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "newClient", v8, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "audioSession", &__block_literal_global_59_0, self->_xpcCommandQueue);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__VCAudioClientManager_registerBlocksForService__block_invoke_104;
  v7[3] = &unk_1E6DB5478;
  v7[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "mutedTalkerRegister", v7, self->_xpcCommandQueue);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__VCAudioClientManager_registerBlocksForService__block_invoke_106;
  v6[3] = &unk_1E6DB5478;
  v6[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "mutedTalkerUnregister", v6, self->_xpcCommandQueue);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__VCAudioClientManager_registerBlocksForService__block_invoke_108;
  v5[3] = &unk_1E6DB5478;
  v5[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "muteStateChangedHandler", v5, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "audioSessionVoiceMixing", &__block_literal_global_115, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "audioSessionFollowSystemInput", &__block_literal_global_120, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "audioSessionFollowSystemOutput", &__block_literal_global_129, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton", MEMORY[0x1E4F143A8], 3221225472, __48__VCAudioClientManager_registerBlocksForService__block_invoke_134, &unk_1E6DB5478, v3), "registerBlockForService:block:queue:", "audioSessionClientDisconnect", &v4, self->_xpcCommandQueue);
}

id __48__VCAudioClientManager_registerBlocksForService__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v7 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "handleNewClientWithXPCArguments:error:", a2, a3);

  return v7;
}

id __48__VCAudioClientManager_registerBlocksForService__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v6 = [a2 objectForKeyedSubscript:@"CONTEXT"];
  if (!v6)
  {
    [a2 objectForKeyedSubscript:@"CLIENTPID"];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __48__VCAudioClientManager_registerBlocksForService__block_invoke_2_cold_1();
      }
    }
    return 0;
  }
  uint64_t v7 = (void *)v6;
  if ([a2 objectForKeyedSubscript:@"setMute"])
  {
    uint64_t v8 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"audioClientAudioSessionMute"), "BOOLValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = "unmute";
        *(_DWORD *)buf = 136316162;
        uint64_t v60 = v9;
        v62 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
        __int16 v61 = 2080;
        if (v8) {
          uint64_t v11 = "mute";
        }
        __int16 v63 = 1024;
        int v64 = 303;
        __int16 v65 = 2080;
        *(void *)v66 = v11;
        *(_WORD *)&v66[8] = 2048;
        *(void *)&v66[10] = v7;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got Notification to %s for client [%p]", buf, 0x30u);
      }
    }
    [v7 setIsMuted:v8];
    goto LABEL_11;
  }
  if ([a2 objectForKeyedSubscript:@"getMute"])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v60 = v13;
        __int16 v61 = 2080;
        v62 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
        __int16 v63 = 1024;
        int v64 = 306;
        __int16 v65 = 2048;
        *(void *)v66 = v7;
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got notification to GetMute for client[%p]", buf, 0x26u);
      }
    }
    v57 = @"audioClientAudioSessionMute";
    uint64_t v58 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isMuted"));
    __int16 v15 = (void *)MEMORY[0x1E4F1C9E8];
    int v16 = &v58;
    __int16 v17 = &v57;
LABEL_49:
    long long v12 = objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1, v53, v54, v55, v56);
    return v12;
  }
  if ([a2 objectForKeyedSubscript:@"getCurrentAudioInputDevice"])
  {
    if ([v7 inputDevice]) {
      uint64_t v18 = objc_msgSend((id)objc_msgSend(v7, "inputDevice"), "UID");
    }
    else {
      uint64_t v18 = 0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      uint64_t v21 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v60 = v20;
        __int16 v61 = 2080;
        v62 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
        __int16 v63 = 1024;
        int v64 = 310;
        __int16 v65 = 2112;
        *(void *)v66 = v18;
        *(_WORD *)&v66[8] = 2048;
        *(void *)&v66[10] = v7;
        _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got notification to getCurrentAudioInputDevice %@ for client [%p]", buf, 0x30u);
      }
    }
    v55 = @"audioClientAudioDevice";
    if (!v18) {
      uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
    }
    uint64_t v56 = v18;
    __int16 v15 = (void *)MEMORY[0x1E4F1C9E8];
    int v16 = &v56;
    __int16 v17 = &v55;
    goto LABEL_49;
  }
  if ([a2 objectForKeyedSubscript:@"getCurrentAudioOutputDevice"])
  {
    if ([v7 outputDevice]) {
      uint64_t v19 = objc_msgSend((id)objc_msgSend(v7, "outputDevice"), "UID");
    }
    else {
      uint64_t v19 = 0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v30 = VRTraceErrorLogLevelToCSTR();
      uint64_t v31 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v60 = v30;
        __int16 v61 = 2080;
        v62 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
        __int16 v63 = 1024;
        int v64 = 314;
        __int16 v65 = 2112;
        *(void *)v66 = v19;
        *(_WORD *)&v66[8] = 2048;
        *(void *)&v66[10] = v7;
        _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got notification to getCurrentAudioOutputDevice %@ for client [%p]", buf, 0x30u);
      }
    }
    v53 = @"audioClientAudioDevice";
    if (!v19) {
      uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v53);
    }
    uint64_t v54 = v19;
    __int16 v15 = (void *)MEMORY[0x1E4F1C9E8];
    int v16 = &v54;
    __int16 v17 = &v53;
    goto LABEL_49;
  }
  if ([a2 objectForKeyedSubscript:@"setCurrentAudioInputDevice"])
  {
    uint64_t v22 = [a2 objectForKeyedSubscript:@"audioClientAudioDevice"];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v60 = v23;
        __int16 v61 = 2080;
        v62 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
        __int16 v63 = 1024;
        int v64 = 318;
        __int16 v65 = 2112;
        *(void *)v66 = v22;
        *(_WORD *)&v66[8] = 2048;
        *(void *)&v66[10] = v7;
        _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got notification to setCurrentAudioInputDevice %@ on client [%p]", buf, 0x30u);
      }
    }
    id v25 = +[AVAudioDeviceList deviceForUID:v22];
    [v7 setInputDevice:v25];

    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_11;
    }
    uint64_t v26 = VRTraceErrorLogLevelToCSTR();
    __int16 v27 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    uint64_t v28 = [v7 inputDevice];
    if (v28) {
      uint64_t v28 = objc_msgSend((id)objc_msgSend(v7, "inputDevice"), "deviceName");
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v60 = v26;
    __int16 v61 = 2080;
    v62 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
    __int16 v63 = 1024;
    int v64 = 322;
    __int16 v65 = 2112;
    *(void *)v66 = v28;
    *(_WORD *)&v66[8] = 2048;
    *(void *)&v66[10] = v7;
    __int16 v29 = " [%s] %s:%d Setting Input Device to [%@] on client [%p]";
    goto LABEL_60;
  }
  if ([a2 objectForKeyedSubscript:@"setCurrentAudioOutputDevice"])
  {
    uint64_t v32 = [a2 objectForKeyedSubscript:@"audioClientAudioDevice"];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v33 = VRTraceErrorLogLevelToCSTR();
      v34 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v60 = v33;
        __int16 v61 = 2080;
        v62 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
        __int16 v63 = 1024;
        int v64 = 325;
        __int16 v65 = 2112;
        *(void *)v66 = v32;
        _os_log_impl(&dword_1E1EA4000, v34, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got notification to setCurrentAudioOutputDevice %@", buf, 0x26u);
      }
    }
    id v35 = +[AVAudioDeviceList deviceForUID:v32];
    [v7 setOutputDevice:v35];

    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_11;
    }
    uint64_t v36 = VRTraceErrorLogLevelToCSTR();
    __int16 v27 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    uint64_t v37 = [v7 outputDevice];
    if (v37) {
      uint64_t v37 = objc_msgSend((id)objc_msgSend(v7, "outputDevice"), "deviceName");
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v60 = v36;
    __int16 v61 = 2080;
    v62 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
    __int16 v63 = 1024;
    int v64 = 329;
    __int16 v65 = 2112;
    *(void *)v66 = v37;
    *(_WORD *)&v66[8] = 2048;
    *(void *)&v66[10] = v7;
    __int16 v29 = " [%s] %s:%d Setting Output Device to [%@] on client[%p]";
LABEL_60:
    v38 = v27;
    uint32_t v39 = 48;
LABEL_61:
    _os_log_impl(&dword_1E1EA4000, v38, OS_LOG_TYPE_DEFAULT, v29, buf, v39);
    goto LABEL_11;
  }
  if ([a2 objectForKeyedSubscript:@"setAudioSessionProperties"])
  {
    uint64_t v40 = [a2 objectForKeyedSubscript:@"audioClientAudioSessionParams"];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v41 = VRTraceErrorLogLevelToCSTR();
      v42 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v60 = v41;
        __int16 v61 = 2080;
        v62 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
        __int16 v63 = 1024;
        int v64 = 332;
        __int16 v65 = 2112;
        *(void *)v66 = v40;
        *(_WORD *)&v66[8] = 2048;
        *(void *)&v66[10] = v7;
        _os_log_impl(&dword_1E1EA4000, v42, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got notification for setAudioSessionProperties %@ on client [%p]", buf, 0x30u);
      }
    }
    [v7 setAudioSessionProperties:v40];
    goto LABEL_11;
  }
  if ([a2 objectForKeyedSubscript:@"resetAudioSessionOutputPortOverride"])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v43 = VRTraceErrorLogLevelToCSTR();
      v44 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v60 = v43;
        __int16 v61 = 2080;
        v62 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
        __int16 v63 = 1024;
        int v64 = 336;
        __int16 v65 = 2048;
        *(void *)v66 = v7;
        _os_log_impl(&dword_1E1EA4000, v44, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got notification to resetAudioSessionOutputPortOverride for client [%p]", buf, 0x26u);
      }
    }
    [v7 resetAudioSessionOutputPortOverride:a3];
    goto LABEL_11;
  }
  if ([a2 objectForKeyedSubscript:@"startAudioSession"])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v45 = VRTraceErrorLogLevelToCSTR();
      v46 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v60 = v45;
        __int16 v61 = 2080;
        v62 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
        __int16 v63 = 1024;
        int v64 = 339;
        __int16 v65 = 1024;
        *(_DWORD *)v66 = [v7 processId];
        *(_WORD *)&v66[4] = 2048;
        *(void *)&v66[6] = v7;
        _os_log_impl(&dword_1E1EA4000, v46, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got notification to startAudioSession (client PID=%d) for client [%p]", buf, 0x2Cu);
      }
    }
    [v7 startWithError:a3];
    goto LABEL_11;
  }
  uint64_t v47 = [a2 objectForKeyedSubscript:@"stopAudioSession"];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v47)
  {
    if (ErrorLogLevelForModule >= 6)
    {
      uint64_t v49 = VRTraceErrorLogLevelToCSTR();
      v50 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v60 = v49;
        __int16 v61 = 2080;
        v62 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
        __int16 v63 = 1024;
        int v64 = 342;
        __int16 v65 = 1024;
        *(_DWORD *)v66 = [v7 processId];
        *(_WORD *)&v66[4] = 2048;
        *(void *)&v66[6] = v7;
        _os_log_impl(&dword_1E1EA4000, v50, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got notification to stopAudioSession (client PID=%d) for client [%p]", buf, 0x2Cu);
      }
    }
    [v7 stopWithError:a3];
    goto LABEL_11;
  }
  if (ErrorLogLevelForModule >= 5)
  {
    uint64_t v51 = VRTraceErrorLogLevelToCSTR();
    v52 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v60 = v51;
      __int16 v61 = 2080;
      v62 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
      __int16 v63 = 1024;
      int v64 = 346;
      __int16 v65 = 2112;
      *(void *)v66 = a2;
      __int16 v29 = " [%s] %s:%d AVConferenceXPCServer for API_AUDIOSESSION_KEY got bad dictionary=%@";
      v38 = v52;
      uint32_t v39 = 38;
      goto LABEL_61;
    }
  }
LABEL_11:
  long long v12 = 0;
  return v12;
}

id __48__VCAudioClientManager_registerBlocksForService__block_invoke_104(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136316162;
      uint64_t v10 = v7;
      __int16 v11 = 2080;
      long long v12 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 354;
      __int16 v15 = 2112;
      uint64_t v16 = [a2 objectForKeyedSubscript:@"CLIENTPID"];
      __int16 v17 = 2112;
      uint64_t v18 = a2;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got notification to registerMutedTalkerNotificationBlock for processId=%@ args=%@", (uint8_t *)&v9, 0x30u);
    }
  }
  return (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "handleRegisterMutedTalkerNotificationForAudioClient:error:", objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"), a3);
}

id __48__VCAudioClientManager_registerBlocksForService__block_invoke_106(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136316162;
      uint64_t v10 = v7;
      __int16 v11 = 2080;
      long long v12 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 365;
      __int16 v15 = 2112;
      uint64_t v16 = [a2 objectForKeyedSubscript:@"CLIENTPID"];
      __int16 v17 = 2112;
      uint64_t v18 = a2;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got notification to unregisterMutedTalkerNotificationBlock for processId=%@ args=%@", (uint8_t *)&v9, 0x30u);
    }
  }
  return (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "handleUnregisterMutedTalkerNotificationForAudioClient:error:", objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"), a3);
}

uint64_t __48__VCAudioClientManager_registerBlocksForService__block_invoke_108(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v6 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"muteStateChangedEnableHandler"), "BOOLValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316162;
        uint64_t v11 = v7;
        __int16 v12 = 2080;
        __int16 v13 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
        __int16 v14 = 1024;
        int v15 = 378;
        __int16 v16 = 2112;
        uint64_t v17 = [a2 objectForKeyedSubscript:@"CLIENTPID"];
        __int16 v18 = 1024;
        int v19 = v6;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got notification to enableMuteStateChangedHandler for processId=%@ handlerEnabled=%{BOOL}d", (uint8_t *)&v10, 0x2Cu);
      }
    }
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "dispatchedHandleMuteStateChangedHandlerForAudioClient:enabled:error:", objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"), v6, a3);
  }
  return 0;
}

uint64_t __48__VCAudioClientManager_registerBlocksForService__block_invoke_113(uint64_t a1, void *a2)
{
  *(void *)&v19[13] = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = [a2 objectForKeyedSubscript:@"CONTEXT"];
    if (v3)
    {
      uint64_t v4 = (void *)v3;
      uint64_t v5 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"audioClientAudioSessionMixingVoiceWithMedia"), "BOOLValue");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 136316162;
          uint64_t v13 = v6;
          __int16 v14 = 2080;
          int v15 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
          __int16 v16 = 1024;
          int v17 = 397;
          __int16 v18 = 1024;
          *(_DWORD *)int v19 = v5;
          void v19[2] = 2048;
          *(void *)&v19[3] = v4;
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got Notification to set mixingVoiceWithMediaEnabled to %d for client [%p]", (uint8_t *)&v12, 0x2Cu);
        }
      }
      [v4 setMixingVoiceWithMediaEnabled:v5];
      [+[VCSessionManager sharedInstance] setSharingEnabled:v5];
    }
    else
    {
      uint64_t v8 = [a2 objectForKeyedSubscript:@"CLIENTPID"];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        int v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 136315906;
          uint64_t v13 = v9;
          __int16 v14 = 2080;
          int v15 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
          __int16 v16 = 1024;
          int v17 = 393;
          __int16 v18 = 2112;
          *(void *)int v19 = v8;
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Connection is not properly setup for processId=%@", (uint8_t *)&v12, 0x26u);
        }
      }
    }
  }
  return 0;
}

uint64_t __48__VCAudioClientManager_registerBlocksForService__block_invoke_118(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = [a2 objectForKeyedSubscript:@"CONTEXT"];
    if (v3)
    {
      uint64_t v4 = (void *)v3;
      uint64_t v5 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"audioClientFollowSystemInput"), "BOOLValue");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = "disable";
          *(_DWORD *)uint64_t v13 = 136316162;
          *(void *)&v13[4] = v6;
          *(void *)&v13[14] = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
          *(_WORD *)&v13[12] = 2080;
          if (v5) {
            uint64_t v8 = "enable";
          }
          *(_WORD *)&v13[22] = 1024;
          int v14 = 414;
          __int16 v15 = 2080;
          uint64_t v16 = (uint64_t)v8;
          __int16 v17 = 2048;
          __int16 v18 = v4;
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got Notification to %s follow system input for client [%p]", v13, 0x30u);
        }
      }
      objc_msgSend(v4, "setFollowSystemInput:", v5, *(_OWORD *)v13, *(void *)&v13[16]);
    }
    else
    {
      uint64_t v9 = [a2 objectForKeyedSubscript:@"CLIENTPID"];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        uint64_t v11 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v13 = 136315906;
          *(void *)&v13[4] = v10;
          *(_WORD *)&v13[12] = 2080;
          *(void *)&v13[14] = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
          *(_WORD *)&v13[22] = 1024;
          int v14 = 410;
          __int16 v15 = 2112;
          uint64_t v16 = v9;
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Connection is not properly setup for processId=%@", v13, 0x26u);
        }
      }
    }
  }
  return 0;
}

uint64_t __48__VCAudioClientManager_registerBlocksForService__block_invoke_127(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = [a2 objectForKeyedSubscript:@"CONTEXT"];
    if (v3)
    {
      uint64_t v4 = (void *)v3;
      uint64_t v5 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"audioClientFollowSystemOutput"), "BOOLValue");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = "disable";
          *(_DWORD *)uint64_t v13 = 136316162;
          *(void *)&v13[4] = v6;
          *(void *)&v13[14] = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
          *(_WORD *)&v13[12] = 2080;
          if (v5) {
            uint64_t v8 = "enable";
          }
          *(_WORD *)&v13[22] = 1024;
          int v14 = 430;
          __int16 v15 = 2080;
          uint64_t v16 = (uint64_t)v8;
          __int16 v17 = 2048;
          __int16 v18 = v4;
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got Notification to %s follow system output for client [%p]", v13, 0x30u);
        }
      }
      objc_msgSend(v4, "setFollowSystemOutput:", v5, *(_OWORD *)v13, *(void *)&v13[16]);
    }
    else
    {
      uint64_t v9 = [a2 objectForKeyedSubscript:@"CLIENTPID"];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        uint64_t v11 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v13 = 136315906;
          *(void *)&v13[4] = v10;
          *(_WORD *)&v13[12] = 2080;
          *(void *)&v13[14] = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
          *(_WORD *)&v13[22] = 1024;
          int v14 = 426;
          __int16 v15 = 2112;
          uint64_t v16 = v9;
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Connection is not properly setup for processId=%@", v13, 0x26u);
        }
      }
    }
  }
  return 0;
}

id __48__VCAudioClientManager_registerBlocksForService__block_invoke_134(uint64_t a1, void *a2)
{
  id result = (id)[a2 objectForKeyedSubscript:@"CLIENTDIED"];
  if (result)
  {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "handleDisconnectWithXPCArguments:", a2);
    return v5;
  }
  return result;
}

- (void)unregisterBlocksForService
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "audioSession");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "mutedTalkerRegister");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "mutedTalkerUnregister");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "muteStateChangedHandler");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "audioSessionVoiceMixing");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "audioSessionFollowSystemInput");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "audioSessionFollowSystemOutput");
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v2 deregisterFromService:"audioSessionClientDisconnect"];
}

- (void)secureMicrophoneEngagedNotification
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v2 sendMessageAsync:"vcSecureMicNotification" arguments:0];
}

- (void)getAudioClientWithProcessId:(uint64_t)a1 create:.cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 66;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unable to retrieve VCAudioClient. Process id was not specified.", (uint8_t *)&v2, 0x1Cu);
}

- (void)getAudioClientWithProcessId:(uint64_t)a1 create:.cold.2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 78;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate VCAudioClient.", (uint8_t *)&v2, 0x1Cu);
}

- (void)handleDisconnectWithXPCArguments:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No client specified. argument=%@");
}

void __48__VCAudioClientManager_registerBlocksForService__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Connection is not properly setup for processId=%@");
}

@end