@interface AVVoiceTriggerClient
+ (BOOL)isAPIAvailable;
+ (BOOL)supportsDuckingOnSpeakerOutput;
+ (id)sharedInstance;
- (AVVoiceTriggerClient)init;
- (BOOL)speakerStateActive;
- (BOOL)speakerStateMuted;
- (NSXPCConnection)voiceTriggerServerConnection;
- (OS_dispatch_queue)workQueue;
- (id)activateSecureSession:(BOOL)a3;
- (id)avvcServerCrashedBlock;
- (id)avvcServerResetBlock;
- (id)portStateChangedBlock;
- (id)recordingPIDList;
- (id)serverCrashedBlock;
- (id)serverResetBlock;
- (id)siriClientRecordStateChangedBlock;
- (id)speakerMuteStateChangedBlock;
- (id)speakerStateChangedBlock;
- (id)voiceTriggerBlock;
- (int)audioSeverUpNotificationToken;
- (unint64_t)voiceTriggerPastDataFramesAvailable;
- (void)callServerCrashedBlock;
- (void)callServerResetBlock;
- (void)closeServerConnection;
- (void)dealloc;
- (void)enableBargeInMode:(BOOL)a3 completionBlock:(id)a4;
- (void)enableListeningOnPorts:(id)a3 completionBlock:(id)a4;
- (void)enableSpeakerStateListening:(BOOL)a3;
- (void)enableSpeakerStateListening:(BOOL)a3 completionBlock:(id)a4;
- (void)enableVoiceTriggerListening:(BOOL)a3;
- (void)enableVoiceTriggerListening:(BOOL)a3 completionBlock:(id)a4;
- (void)getInputChannelInfoCompletion:(id)a3;
- (void)listeningEnabledCompletionBlock:(id)a3;
- (void)portStateActiveCompletionBlock:(id)a3;
- (void)portStateChangedNotification:(id)a3;
- (void)removeAudioServerUpNotificationHandler;
- (void)setAVVCServerCrashedBlock:(id)a3;
- (void)setAVVCServerResetBlock:(id)a3;
- (void)setAggressiveECMode:(BOOL)a3 completionBlock:(id)a4;
- (void)setAudioServerUpNotificationHandler;
- (void)setAudioSeverUpNotificationToken:(int)a3;
- (void)setAvvcServerCrashedBlock:(id)a3;
- (void)setAvvcServerResetBlock:(id)a3;
- (void)setListeningProperty:(BOOL)a3 completionBlock:(id)a4;
- (void)setPortStateChangedBlock:(id)a3;
- (void)setServerCrashedBlock:(id)a3;
- (void)setServerResetBlock:(id)a3;
- (void)setSiriClientRecordStateChangedBlock:(id)a3;
- (void)setSpeakerMuteStateChangedBlock:(id)a3;
- (void)setSpeakerStateChangedBlock:(id)a3;
- (void)setVoiceTriggerBlock:(id)a3;
- (void)setVoiceTriggerServerConnection:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)siriClientRecordStateChangedNotification:(BOOL)a3 recordingCount:(unint64_t)a4;
- (void)siriClientsRecordingCompletionBlock:(id)a3;
- (void)speakerMuteStateChangedNotification:(BOOL)a3;
- (void)speakerStateActiveCompletionBlock:(id)a3;
- (void)speakerStateChangedNotification:(id)a3;
- (void)speakerStateMutedCompletionBlock:(id)a3;
- (void)updateVoiceTriggerConfiguration:(id)a3;
- (void)updateVoiceTriggerConfiguration:(id)a3 completionBlock:(id)a4;
- (void)voiceTriggerNotification:(id)a3;
- (void)voiceTriggerPastDataFramesAvailableCompletion:(id)a3;
@end

@implementation AVVoiceTriggerClient

- (void)portStateChangedNotification:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!+[AVVoiceTriggerClient isAPIAvailable]) {
    goto LABEL_18;
  }
  if (kAVVCScope)
  {
    v5 = *(id *)kAVVCScope;
    if (!v5) {
      goto LABEL_9;
    }
  }
  else
  {
    v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    v11 = "AVVoiceTriggerClient.mm";
    __int16 v12 = 1024;
    int v13 = 2567;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d port state changed : %@", (uint8_t *)&v10, 0x1Cu);
  }

LABEL_9:
  portStateChangedBlock = (void (**)(id, id))self->_portStateChangedBlock;
  if (portStateChangedBlock)
  {
    portStateChangedBlock[2](portStateChangedBlock, v4);
  }
  else
  {
    if (kAVVCScope)
    {
      v8 = *(id *)kAVVCScope;
      if (!v8) {
        goto LABEL_18;
      }
    }
    else
    {
      v8 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      v11 = "AVVoiceTriggerClient.mm";
      __int16 v12 = 1024;
      int v13 = 2572;
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d port state changed but no block set", (uint8_t *)&v10, 0x12u);
    }
  }
LABEL_18:
}

- (void)speakerStateChangedNotification:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!+[AVVoiceTriggerClient isAPIAvailable]) {
    goto LABEL_18;
  }
  if (kAVVCScope)
  {
    v5 = *(id *)kAVVCScope;
    if (!v5) {
      goto LABEL_9;
    }
  }
  else
  {
    v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315650;
    v11 = "AVVoiceTriggerClient.mm";
    __int16 v12 = 1024;
    int v13 = 2530;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d speaker state changed : %@", (uint8_t *)&v10, 0x1Cu);
  }

LABEL_9:
  speakerStateChangedBlock = (void (**)(id, id))self->_speakerStateChangedBlock;
  if (speakerStateChangedBlock)
  {
    speakerStateChangedBlock[2](speakerStateChangedBlock, v4);
  }
  else
  {
    if (kAVVCScope)
    {
      v8 = *(id *)kAVVCScope;
      if (!v8) {
        goto LABEL_18;
      }
    }
    else
    {
      v8 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      v11 = "AVVoiceTriggerClient.mm";
      __int16 v12 = 1024;
      int v13 = 2535;
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d speaker state changed but no block set", (uint8_t *)&v10, 0x12u);
    }
  }
LABEL_18:
}

+ (BOOL)isAPIAvailable
{
  if (+[AVVoiceTriggerClient isAPIAvailable]::once != -1) {
    dispatch_once(&+[AVVoiceTriggerClient isAPIAvailable]::once, &__block_literal_global_8405);
  }
  return gHasBorealisXPC;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_avvcServerResetBlock, 0);
  objc_storeStrong(&self->_avvcServerCrashedBlock, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_voiceTriggerServerConnection, 0);
  objc_storeStrong(&self->_serverResetBlock, 0);
  objc_storeStrong(&self->_serverCrashedBlock, 0);
  objc_storeStrong(&self->_siriClientRecordStateChangedBlock, 0);
  objc_storeStrong(&self->_portStateChangedBlock, 0);
  objc_storeStrong(&self->_speakerMuteStateChangedBlock, 0);
  objc_storeStrong(&self->_speakerStateChangedBlock, 0);

  objc_storeStrong(&self->_voiceTriggerBlock, 0);
}

- (void)setAvvcServerResetBlock:(id)a3
{
}

- (id)avvcServerResetBlock
{
  return self->_avvcServerResetBlock;
}

- (void)setAvvcServerCrashedBlock:(id)a3
{
}

- (id)avvcServerCrashedBlock
{
  return self->_avvcServerCrashedBlock;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setAudioSeverUpNotificationToken:(int)a3
{
  self->_audioSeverUpNotificationToken = a3;
}

- (int)audioSeverUpNotificationToken
{
  return self->_audioSeverUpNotificationToken;
}

- (void)setVoiceTriggerServerConnection:(id)a3
{
}

- (void)setServerResetBlock:(id)a3
{
}

- (id)serverResetBlock
{
  return self->_serverResetBlock;
}

- (void)setServerCrashedBlock:(id)a3
{
}

- (id)serverCrashedBlock
{
  return self->_serverCrashedBlock;
}

- (void)setSiriClientRecordStateChangedBlock:(id)a3
{
}

- (id)siriClientRecordStateChangedBlock
{
  return self->_siriClientRecordStateChangedBlock;
}

- (void)setPortStateChangedBlock:(id)a3
{
}

- (id)portStateChangedBlock
{
  return self->_portStateChangedBlock;
}

- (void)setSpeakerMuteStateChangedBlock:(id)a3
{
}

- (id)speakerMuteStateChangedBlock
{
  return self->_speakerMuteStateChangedBlock;
}

- (void)setSpeakerStateChangedBlock:(id)a3
{
}

- (id)speakerStateChangedBlock
{
  return self->_speakerStateChangedBlock;
}

- (void)setVoiceTriggerBlock:(id)a3
{
}

- (id)voiceTriggerBlock
{
  return self->_voiceTriggerBlock;
}

- (void)siriClientRecordStateChangedNotification:(BOOL)a3 recordingCount:(unint64_t)a4
{
  BOOL v5 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!+[AVVoiceTriggerClient isAPIAvailable]) {
    return;
  }
  if (!kAVVCScope)
  {
    v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
    goto LABEL_6;
  }
  v7 = *(id *)kAVVCScope;
  if (v7)
  {
LABEL_6:
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 136315906;
      int v13 = "AVVoiceTriggerClient.mm";
      __int16 v14 = 1024;
      int v15 = 2584;
      __int16 v16 = 1024;
      BOOL v17 = v5;
      __int16 v18 = 1024;
      int v19 = a4;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d siri client record state changed. starting(%d), recordingCount(%u)", (uint8_t *)&v12, 0x1Eu);
    }
  }
  siriClientRecordStateChangedBlock = (void (**)(id, BOOL, unint64_t))self->_siriClientRecordStateChangedBlock;
  if (siriClientRecordStateChangedBlock)
  {
    siriClientRecordStateChangedBlock[2](siriClientRecordStateChangedBlock, v5, a4);
    return;
  }
  if (kAVVCScope)
  {
    int v10 = *(id *)kAVVCScope;
    if (!v10) {
      return;
    }
  }
  else
  {
    int v10 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    int v13 = "AVVoiceTriggerClient.mm";
    __int16 v14 = 1024;
    int v15 = 2589;
    _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d siri client record state changed but no block set", (uint8_t *)&v12, 0x12u);
  }
}

- (void)speakerMuteStateChangedNotification:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!+[AVVoiceTriggerClient isAPIAvailable]) {
    return;
  }
  if (!kAVVCScope)
  {
    BOOL v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
    goto LABEL_6;
  }
  BOOL v5 = *(id *)kAVVCScope;
  if (v5)
  {
LABEL_6:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 136315650;
      id v11 = "AVVoiceTriggerClient.mm";
      __int16 v12 = 1024;
      int v13 = 2549;
      __int16 v14 = 1024;
      BOOL v15 = v3;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d speaker mute changed : %d", (uint8_t *)&v10, 0x18u);
    }
  }
  speakerMuteStateChangedBlock = (void (**)(id, BOOL))self->_speakerMuteStateChangedBlock;
  if (speakerMuteStateChangedBlock)
  {
    speakerMuteStateChangedBlock[2](speakerMuteStateChangedBlock, v3);
    return;
  }
  if (kAVVCScope)
  {
    id v8 = *(id *)kAVVCScope;
    if (!v8) {
      return;
    }
  }
  else
  {
    id v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    id v11 = "AVVoiceTriggerClient.mm";
    __int16 v12 = 1024;
    int v13 = 2554;
    _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d speaker mute changed but no block set", (uint8_t *)&v10, 0x12u);
  }
}

- (void)voiceTriggerNotification:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!+[AVVoiceTriggerClient isAPIAvailable]) {
    goto LABEL_25;
  }
  if (!kAVVCScope)
  {
    BOOL v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
    goto LABEL_6;
  }
  BOOL v5 = *(id *)kAVVCScope;
  if (v5)
  {
LABEL_6:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 136315650;
      __int16 v12 = "AVVoiceTriggerClient.mm";
      __int16 v13 = 1024;
      int v14 = 2510;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d voice trigger occured : %@", (uint8_t *)&v11, 0x1Cu);
    }
  }
  if (self->_voiceTriggerBlock)
  {
    if (kAVVCScope)
    {
      v7 = *(id *)kAVVCScope;
      if (!v7)
      {
LABEL_20:
        (*((void (**)(void))self->_voiceTriggerBlock + 2))();
        goto LABEL_25;
      }
    }
    else
    {
      v7 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      __int16 v12 = "AVVoiceTriggerClient.mm";
      __int16 v13 = 1024;
      int v14 = 2512;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d voice trigger occured, calling block", (uint8_t *)&v11, 0x12u);
    }

    goto LABEL_20;
  }
  if (kAVVCScope)
  {
    id v8 = *(id *)kAVVCScope;
    if (!v8) {
      goto LABEL_25;
    }
  }
  else
  {
    id v8 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    __int16 v12 = "AVVoiceTriggerClient.mm";
    __int16 v13 = 1024;
    int v14 = 2516;
    _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d voice trigger occured but no block set", (uint8_t *)&v11, 0x12u);
  }

LABEL_25:
}

- (id)activateSecureSession:(BOOL)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  __int16 v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__8252;
  __int16 v18 = __Block_byref_object_dispose__8253;
  id v19 = 0;
  if (isHACProduct())
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__AVVoiceTriggerClient_activateSecureSession___block_invoke;
    block[3] = &unk_1E5965DA0;
    BOOL v13 = a3;
    block[4] = self;
    block[5] = &v14;
    dispatch_sync(workQueue, block);
    goto LABEL_10;
  }
  uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11794 userInfo:0];
  v7 = (void *)v15[5];
  v15[5] = v6;

  if (kAVVCScope)
  {
    id v8 = *(id *)kAVVCScope;
    if (!v8) {
      goto LABEL_10;
    }
  }
  else
  {
    id v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "AVVoiceTriggerClient.mm";
    __int16 v22 = 1024;
    int v23 = 2492;
    _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Operation not supported on this platform", buf, 0x12u);
  }

LABEL_10:
  id v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __46__AVVoiceTriggerClient_activateSecureSession___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) voiceTriggerServerConnection];
  if (kAVVCScope)
  {
    BOOL v3 = *(id *)kAVVCScope;
    if (!v3) {
      goto LABEL_10;
    }
  }
  else
  {
    BOOL v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = "activate";
    int v6 = *(unsigned __int8 *)(a1 + 48);
    uint64_t v16 = "AVVoiceTriggerClient.mm";
    *(_DWORD *)buf = 136315650;
    if (!v6) {
      BOOL v5 = "deactivate";
    }
    __int16 v17 = 1024;
    int v18 = 2472;
    __int16 v19 = 2080;
    uint64_t v20 = v5;
    _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d activateSecureSession: %s", buf, 0x1Cu);
  }

LABEL_10:
  if (!v2)
  {
    if (kAVVCScope)
    {
      id v9 = *(id *)kAVVCScope;
      if (!v9)
      {
LABEL_19:
        uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11792 userInfo:0];
        uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
        v7 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;
        goto LABEL_20;
      }
    }
    else
    {
      id v9 = MEMORY[0x1E4F14500];
      id v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v16 = "AVVoiceTriggerClient.mm";
      __int16 v17 = 1024;
      int v18 = 2485;
      _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d activateSecureSession: couldn't connect to server", buf, 0x12u);
    }

    goto LABEL_19;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __46__AVVoiceTriggerClient_activateSecureSession___block_invoke_237;
  v14[3] = &unk_1E5965D78;
  v14[4] = *(void *)(a1 + 40);
  v7 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v14];
  uint64_t v8 = *(unsigned __int8 *)(a1 + 48);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __46__AVVoiceTriggerClient_activateSecureSession___block_invoke_238;
  v13[3] = &unk_1E5965D78;
  v13[4] = *(void *)(a1 + 40);
  [v7 activateSecureSession:v8 reply:v13];
LABEL_20:
}

void __46__AVVoiceTriggerClient_activateSecureSession___block_invoke_237(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (kAVVCScope)
  {
    id v4 = *(id *)kAVVCScope;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  int v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = [v3 code];
    uint64_t v8 = [v3 localizedDescription];
    int v11 = 136315906;
    uint64_t v12 = "AVVoiceTriggerClient.mm";
    __int16 v13 = 1024;
    int v14 = 2475;
    __int16 v15 = 2048;
    uint64_t v16 = v7;
    __int16 v17 = 2112;
    int v18 = v8;
    _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: activateSecureSession error handler : %ld (%@)", (uint8_t *)&v11, 0x26u);
  }
LABEL_8:
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v3;
}

void __46__AVVoiceTriggerClient_activateSecureSession___block_invoke_238(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (kAVVCScope)
    {
      id v4 = *(id *)kAVVCScope;
      if (!v4) {
        goto LABEL_9;
      }
    }
    else
    {
      id v4 = (id)MEMORY[0x1E4F14500];
      id v5 = MEMORY[0x1E4F14500];
    }
    int v6 = v4;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [v3 code];
      uint64_t v8 = [v3 localizedDescription];
      int v11 = 136315906;
      uint64_t v12 = "AVVoiceTriggerClient.mm";
      __int16 v13 = 1024;
      int v14 = 2479;
      __int16 v15 = 2048;
      uint64_t v16 = v7;
      __int16 v17 = 2112;
      int v18 = v8;
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d activateSecureSession returned error %ld (%@)", (uint8_t *)&v11, 0x26u);
    }
  }
LABEL_9:
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v3;
}

- (id)recordingPIDList
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  ElapsedTime::ElapsedTime((ElapsedTime *)v4, "-[AVVoiceTriggerClient recordingPIDList]", 0, 0);
  v2 = GetRecordingAppsList();
  ElapsedTime::~ElapsedTime((ElapsedTime *)v4);

  return v2;
}

- (void)setAggressiveECMode:(BOOL)a3 completionBlock:(id)a4
{
  id v6 = a4;
  TraceMethod::TraceMethod((TraceMethod *)v12, "setAggressiveECMode:completionBlock:");
  if (+[AVVoiceTriggerClient isAPIAvailable])
  {
    workQueue = self->_workQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__AVVoiceTriggerClient_setAggressiveECMode_completionBlock___block_invoke;
    v9[3] = &unk_1E5965C88;
    v9[4] = self;
    BOOL v11 = a3;
    id v10 = v6;
    dispatch_async(workQueue, v9);
  }
  else if (v6)
  {
    uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11794 userInfo:0];
    (*((void (**)(id, void *))v6 + 2))(v6, v8);
  }
  TraceMethod::~TraceMethod((TraceMethod *)v12);
}

void __60__AVVoiceTriggerClient_setAggressiveECMode_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) voiceTriggerServerConnection];
  if (kAVVCScope)
  {
    id v3 = *(id *)kAVVCScope;
    if (!v3) {
      goto LABEL_10;
    }
  }
  else
  {
    id v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = "Enable";
    int v6 = *(unsigned __int8 *)(a1 + 48);
    uint64_t v19 = "AVVoiceTriggerClient.mm";
    *(_DWORD *)buf = 136315650;
    if (!v6) {
      uint64_t v5 = "Disable";
    }
    __int16 v20 = 1024;
    int v21 = 2400;
    __int16 v22 = 2080;
    int v23 = v5;
    _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setAggressiveECMode: %s", buf, 0x1Cu);
  }

LABEL_10:
  if (v2)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __60__AVVoiceTriggerClient_setAggressiveECMode_completionBlock___block_invoke_233;
    v15[3] = &unk_1E5965C60;
    char v17 = *(unsigned char *)(a1 + 48);
    id v16 = *(id *)(a1 + 40);
    uint64_t v7 = [v2 remoteObjectProxyWithErrorHandler:v15];
    uint64_t v8 = *(unsigned __int8 *)(a1 + 48);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__AVVoiceTriggerClient_setAggressiveECMode_completionBlock___block_invoke_234;
    v12[3] = &unk_1E5965C60;
    char v14 = v8;
    id v13 = *(id *)(a1 + 40);
    [v7 setAggressiveECMode:v8 reply:v12];

    uint64_t v9 = v16;
LABEL_21:

    goto LABEL_22;
  }
  if (kAVVCScope)
  {
    id v10 = *(id *)kAVVCScope;
    if (!v10) {
      goto LABEL_19;
    }
  }
  else
  {
    id v10 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v19 = "AVVoiceTriggerClient.mm";
    __int16 v20 = 1024;
    int v21 = 2417;
    _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d setAggressiveECMode: couldn't connect to server", buf, 0x12u);
  }

LABEL_19:
  if (*(void *)(a1 + 40))
  {
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11792 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_21;
  }
LABEL_22:
}

void __60__AVVoiceTriggerClient_setAggressiveECMode_completionBlock___block_invoke_233(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (kAVVCScope)
  {
    id v4 = *(id *)kAVVCScope;
    if (!v4) {
      goto LABEL_11;
    }
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  int v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v7 = "enable";
    }
    else {
      uint64_t v7 = "disable";
    }
    uint64_t v8 = [v3 code];
    uint64_t v9 = [v3 localizedDescription];
    int v11 = 136316162;
    uint64_t v12 = "AVVoiceTriggerClient.mm";
    __int16 v13 = 1024;
    int v14 = 2403;
    __int16 v15 = 2080;
    id v16 = v7;
    __int16 v17 = 2048;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    __int16 v20 = v9;
    _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: setAggressiveECMode (%s) error handler : %ld (%@)", (uint8_t *)&v11, 0x30u);
  }
LABEL_11:
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v3);
  }
}

void __60__AVVoiceTriggerClient_setAggressiveECMode_completionBlock___block_invoke_234(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (kAVVCScope)
    {
      id v4 = *(id *)kAVVCScope;
      if (!v4) {
        goto LABEL_21;
      }
    }
    else
    {
      id v4 = (id)MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    id v5 = v4;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      if (*(unsigned char *)(a1 + 40)) {
        uint64_t v7 = "enable";
      }
      else {
        uint64_t v7 = "disable";
      }
      uint64_t v8 = [v3 code];
      uint64_t v9 = [v3 localizedDescription];
      int v14 = 136316162;
      __int16 v15 = "AVVoiceTriggerClient.mm";
      __int16 v16 = 1024;
      int v17 = 2408;
      __int16 v18 = 2080;
      __int16 v19 = v7;
      __int16 v20 = 2048;
      uint64_t v21 = v8;
      __int16 v22 = 2112;
      int v23 = v9;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d setAggressiveECMode: (%s) reply error : %ld (%@)", (uint8_t *)&v14, 0x30u);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (!kAVVCScope)
  {
    id v5 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
LABEL_16:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = "Enabled";
      int v12 = *(unsigned __int8 *)(a1 + 40);
      __int16 v15 = "AVVoiceTriggerClient.mm";
      int v14 = 136315650;
      if (!v12) {
        int v11 = "Disabled";
      }
      __int16 v16 = 1024;
      int v17 = 2410;
      __int16 v18 = 2080;
      __int16 v19 = v11;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s listening property - Success", (uint8_t *)&v14, 0x1Cu);
    }
    goto LABEL_20;
  }
  id v5 = *(id *)kAVVCScope;
  if (v5) {
    goto LABEL_16;
  }
LABEL_21:
  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);
  }
}

- (void)siriClientsRecordingCompletionBlock:(id)a3
{
  id v4 = a3;
  TraceMethod::TraceMethod((TraceMethod *)v9, "siriClientRunningCountCompletionBlock:");
  if (+[AVVoiceTriggerClient isAPIAvailable])
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__AVVoiceTriggerClient_siriClientsRecordingCompletionBlock___block_invoke;
    block[3] = &unk_1E5965BC0;
    block[4] = self;
    id v8 = v4;
    dispatch_async(workQueue, block);
  }
  else if (v4)
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11794 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
  }
  TraceMethod::~TraceMethod((TraceMethod *)v9);
}

void __60__AVVoiceTriggerClient_siriClientsRecordingCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) voiceTriggerServerConnection];
  if (v2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__AVVoiceTriggerClient_siriClientsRecordingCompletionBlock___block_invoke_2;
    v9[3] = &unk_1E5965B70;
    id v10 = *(id *)(a1 + 40);
    id v3 = [v2 remoteObjectProxyWithErrorHandler:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__AVVoiceTriggerClient_siriClientsRecordingCompletionBlock___block_invoke_230;
    v7[3] = &unk_1E5965D50;
    id v8 = *(id *)(a1 + 40);
    [v3 siriClientsRecordingReply:v7];

    id v4 = v10;
LABEL_12:

    goto LABEL_13;
  }
  if (kAVVCScope)
  {
    id v5 = *(id *)kAVVCScope;
    if (!v5) {
      goto LABEL_10;
    }
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    int v12 = "AVVoiceTriggerClient.mm";
    __int16 v13 = 1024;
    int v14 = 2370;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d serverConnection is nil - no xpc connection established", buf, 0x12u);
  }

LABEL_10:
  if (*(void *)(a1 + 40))
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11792 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_12;
  }
LABEL_13:
}

void __60__AVVoiceTriggerClient_siriClientsRecordingCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (kAVVCScope)
  {
    id v4 = *(id *)kAVVCScope;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  id v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = [v3 code];
    id v8 = [v3 localizedDescription];
    int v10 = 136315906;
    int v11 = "AVVoiceTriggerClient.mm";
    __int16 v12 = 1024;
    int v13 = 2356;
    __int16 v14 = 2048;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    int v17 = v8;
    _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: siriClientRunningCount returned error : %ld (%@)", (uint8_t *)&v10, 0x26u);
  }
LABEL_8:
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v3);
  }
}

void __60__AVVoiceTriggerClient_siriClientsRecordingCompletionBlock___block_invoke_230(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    if (kAVVCScope)
    {
      id v6 = *(id *)kAVVCScope;
      if (!v6) {
        goto LABEL_16;
      }
    }
    else
    {
      id v6 = (id)MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    uint64_t v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [v5 code];
      int v10 = [v5 localizedDescription];
      int v13 = 136315906;
      __int16 v14 = "AVVoiceTriggerClient.mm";
      __int16 v15 = 1024;
      int v16 = 2361;
      __int16 v17 = 2048;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      __int16 v20 = v10;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d siriClientRunningCount returned error : %ld (%@)", (uint8_t *)&v13, 0x26u);
    }
LABEL_15:

    goto LABEL_16;
  }
  if (!kAVVCScope)
  {
    uint64_t v7 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
LABEL_13:
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315394;
      __int16 v14 = "AVVoiceTriggerClient.mm";
      __int16 v15 = 1024;
      int v16 = 2363;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d siriClientRunningCount - Success", (uint8_t *)&v13, 0x12u);
    }
    goto LABEL_15;
  }
  uint64_t v7 = *(id *)kAVVCScope;
  if (v7) {
    goto LABEL_13;
  }
LABEL_16:
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, a2, v5);
  }
}

- (void)listeningEnabledCompletionBlock:(id)a3
{
  id v4 = a3;
  TraceMethod::TraceMethod((TraceMethod *)v9, "listeningEnabledCompletionBlock:");
  if (+[AVVoiceTriggerClient isAPIAvailable])
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__AVVoiceTriggerClient_listeningEnabledCompletionBlock___block_invoke;
    block[3] = &unk_1E5965BC0;
    block[4] = self;
    id v8 = v4;
    dispatch_async(workQueue, block);
  }
  else if (v4)
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11794 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
  }
  TraceMethod::~TraceMethod((TraceMethod *)v9);
}

void __56__AVVoiceTriggerClient_listeningEnabledCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) voiceTriggerServerConnection];
  if (v2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__AVVoiceTriggerClient_listeningEnabledCompletionBlock___block_invoke_2;
    v9[3] = &unk_1E5965B70;
    id v10 = *(id *)(a1 + 40);
    id v3 = [v2 remoteObjectProxyWithErrorHandler:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__AVVoiceTriggerClient_listeningEnabledCompletionBlock___block_invoke_228;
    v7[3] = &unk_1E5965CB0;
    id v8 = *(id *)(a1 + 40);
    [v3 listeningEnabledReply:v7];

    id v4 = v10;
LABEL_12:

    goto LABEL_13;
  }
  if (kAVVCScope)
  {
    id v5 = *(id *)kAVVCScope;
    if (!v5) {
      goto LABEL_10;
    }
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = "AVVoiceTriggerClient.mm";
    __int16 v13 = 1024;
    int v14 = 2316;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d serverConnection is nil - no xpc connection established", buf, 0x12u);
  }

LABEL_10:
  if (*(void *)(a1 + 40))
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11792 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_12;
  }
LABEL_13:
}

void __56__AVVoiceTriggerClient_listeningEnabledCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (kAVVCScope)
  {
    id v4 = *(id *)kAVVCScope;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  id v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = [v3 code];
    id v8 = [v3 localizedDescription];
    int v10 = 136315906;
    id v11 = "AVVoiceTriggerClient.mm";
    __int16 v12 = 1024;
    int v13 = 2302;
    __int16 v14 = 2048;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    __int16 v17 = v8;
    _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: listeningEnabled returned error : %ld (%@)", (uint8_t *)&v10, 0x26u);
  }
LABEL_8:
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v3);
  }
}

void __56__AVVoiceTriggerClient_listeningEnabledCompletionBlock___block_invoke_228(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    if (kAVVCScope)
    {
      id v6 = *(id *)kAVVCScope;
      if (!v6) {
        goto LABEL_16;
      }
    }
    else
    {
      id v6 = (id)MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    uint64_t v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [v5 code];
      int v10 = [v5 localizedDescription];
      int v13 = 136315906;
      __int16 v14 = "AVVoiceTriggerClient.mm";
      __int16 v15 = 1024;
      int v16 = 2307;
      __int16 v17 = 2048;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      __int16 v20 = v10;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d listeningEnabled returned error : %ld (%@)", (uint8_t *)&v13, 0x26u);
    }
LABEL_15:

    goto LABEL_16;
  }
  if (!kAVVCScope)
  {
    uint64_t v7 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
LABEL_13:
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315394;
      __int16 v14 = "AVVoiceTriggerClient.mm";
      __int16 v15 = 1024;
      int v16 = 2309;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d listeningEnabled - Success", (uint8_t *)&v13, 0x12u);
    }
    goto LABEL_15;
  }
  uint64_t v7 = *(id *)kAVVCScope;
  if (v7) {
    goto LABEL_13;
  }
LABEL_16:
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, a2, v5);
  }
}

- (void)updateVoiceTriggerConfiguration:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  TraceMethod::TraceMethod((TraceMethod *)v13, "updateVoiceTriggerConfiguration:completionBlock:");
  if (+[AVVoiceTriggerClient isAPIAvailable])
  {
    workQueue = self->_workQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72__AVVoiceTriggerClient_updateVoiceTriggerConfiguration_completionBlock___block_invoke;
    v10[3] = &unk_1E5965D28;
    v10[4] = self;
    id v12 = v7;
    id v11 = v6;
    dispatch_async(workQueue, v10);
  }
  else if (v7)
  {
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11794 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v9);
  }
  TraceMethod::~TraceMethod((TraceMethod *)v13);
}

void __72__AVVoiceTriggerClient_updateVoiceTriggerConfiguration_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) voiceTriggerServerConnection];
  if (kAVVCScope)
  {
    id v3 = *(id *)kAVVCScope;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    id v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v17 = "AVVoiceTriggerClient.mm";
    __int16 v18 = 1024;
    int v19 = 2212;
    _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d updateVoiceTriggerConfiguration:", buf, 0x12u);
  }

LABEL_8:
  if (v2)
  {
    if (kAVVCScope)
    {
      id v5 = *(id *)kAVVCScope;
      if (!v5)
      {
LABEL_19:
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __72__AVVoiceTriggerClient_updateVoiceTriggerConfiguration_completionBlock___block_invoke_225;
        v14[3] = &unk_1E5965B70;
        id v15 = *(id *)(a1 + 48);
        id v8 = [v2 remoteObjectProxyWithErrorHandler:v14];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __72__AVVoiceTriggerClient_updateVoiceTriggerConfiguration_completionBlock___block_invoke_226;
        v12[3] = &unk_1E5965B70;
        uint64_t v9 = *(void *)(a1 + 40);
        id v13 = *(id *)(a1 + 48);
        [v8 updateVoiceTriggerConfiguration:v9 reply:v12];

        int v10 = v15;
LABEL_26:

        goto LABEL_27;
      }
    }
    else
    {
      id v5 = MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v17 = "AVVoiceTriggerClient.mm";
      __int16 v18 = 1024;
      int v19 = 2214;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d sending config data to updateVoiceTriggerConfiguration", buf, 0x12u);
    }

    goto LABEL_19;
  }
  if (kAVVCScope)
  {
    id v6 = *(id *)kAVVCScope;
    if (!v6) {
      goto LABEL_24;
    }
  }
  else
  {
    id v6 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v17 = "AVVoiceTriggerClient.mm";
    __int16 v18 = 1024;
    int v19 = 2230;
    _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d updateVoiceTriggerConfiguration: couldn't connect to server", buf, 0x12u);
  }

LABEL_24:
  if (*(void *)(a1 + 48))
  {
    int v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11792 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_26;
  }
LABEL_27:
}

void __72__AVVoiceTriggerClient_updateVoiceTriggerConfiguration_completionBlock___block_invoke_225(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (kAVVCScope)
  {
    id v4 = *(id *)kAVVCScope;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  id v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = [v3 code];
    id v8 = [v3 localizedDescription];
    int v10 = 136315906;
    id v11 = "AVVoiceTriggerClient.mm";
    __int16 v12 = 1024;
    int v13 = 2216;
    __int16 v14 = 2048;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    __int16 v17 = v8;
    _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: updateVoiceTriggerConfiguration: error handler : %ld (%@)", (uint8_t *)&v10, 0x26u);
  }
LABEL_8:
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);
  }
}

void __72__AVVoiceTriggerClient_updateVoiceTriggerConfiguration_completionBlock___block_invoke_226(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (kAVVCScope)
    {
      id v4 = *(id *)kAVVCScope;
      if (!v4) {
        goto LABEL_16;
      }
    }
    else
    {
      id v4 = (id)MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    id v5 = v4;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [v3 code];
      id v8 = [v3 localizedDescription];
      int v11 = 136315906;
      __int16 v12 = "AVVoiceTriggerClient.mm";
      __int16 v13 = 1024;
      int v14 = 2221;
      __int16 v15 = 2048;
      uint64_t v16 = v7;
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d updateVoiceTriggerConfiguration reply error : %ld (%@)", (uint8_t *)&v11, 0x26u);
    }
LABEL_15:

    goto LABEL_16;
  }
  if (!kAVVCScope)
  {
    id v5 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
LABEL_13:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 136315394;
      __int16 v12 = "AVVoiceTriggerClient.mm";
      __int16 v13 = 1024;
      int v14 = 2223;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d Update VoiceTrigger configuration successful", (uint8_t *)&v11, 0x12u);
    }
    goto LABEL_15;
  }
  id v5 = *(id *)kAVVCScope;
  if (v5) {
    goto LABEL_13;
  }
LABEL_16:
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v3);
  }
}

- (void)updateVoiceTriggerConfiguration:(id)a3
{
}

- (void)enableBargeInMode:(BOOL)a3 completionBlock:(id)a4
{
  id v6 = a4;
  TraceMethod::TraceMethod((TraceMethod *)v12, "enableBargeInMode:completionBlock:");
  if (+[AVVoiceTriggerClient isAPIAvailable])
  {
    workQueue = self->_workQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__AVVoiceTriggerClient_enableBargeInMode_completionBlock___block_invoke;
    v9[3] = &unk_1E5965C88;
    void v9[4] = self;
    BOOL v11 = a3;
    id v10 = v6;
    dispatch_async(workQueue, v9);
  }
  else if (v6)
  {
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11794 userInfo:0];
    (*((void (**)(id, void *))v6 + 2))(v6, v8);
  }
  TraceMethod::~TraceMethod((TraceMethod *)v12);
}

void __58__AVVoiceTriggerClient_enableBargeInMode_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) voiceTriggerServerConnection];
  if (kAVVCScope)
  {
    id v3 = *(id *)kAVVCScope;
    if (!v3) {
      goto LABEL_10;
    }
  }
  else
  {
    id v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = "Enable";
    int v6 = *(unsigned __int8 *)(a1 + 48);
    uint64_t v19 = "AVVoiceTriggerClient.mm";
    *(_DWORD *)buf = 136315650;
    if (!v6) {
      id v5 = "Disable";
    }
    __int16 v20 = 1024;
    int v21 = 2161;
    __int16 v22 = 2080;
    int v23 = v5;
    _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d enableBargeInMode: %s", buf, 0x1Cu);
  }

LABEL_10:
  if (v2)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __58__AVVoiceTriggerClient_enableBargeInMode_completionBlock___block_invoke_222;
    v15[3] = &unk_1E5965C60;
    char v17 = *(unsigned char *)(a1 + 48);
    id v16 = *(id *)(a1 + 40);
    uint64_t v7 = [v2 remoteObjectProxyWithErrorHandler:v15];
    uint64_t v8 = *(unsigned __int8 *)(a1 + 48);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__AVVoiceTriggerClient_enableBargeInMode_completionBlock___block_invoke_223;
    v12[3] = &unk_1E5965C60;
    char v14 = v8;
    id v13 = *(id *)(a1 + 40);
    [v7 enableBargeInMode:v8 reply:v12];

    id v9 = v16;
LABEL_21:

    goto LABEL_22;
  }
  if (kAVVCScope)
  {
    id v10 = *(id *)kAVVCScope;
    if (!v10) {
      goto LABEL_19;
    }
  }
  else
  {
    id v10 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v19 = "AVVoiceTriggerClient.mm";
    __int16 v20 = 1024;
    int v21 = 2178;
    _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d enableBargeInMode: couldn't connect to server", buf, 0x12u);
  }

LABEL_19:
  if (*(void *)(a1 + 40))
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11792 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_21;
  }
LABEL_22:
}

void __58__AVVoiceTriggerClient_enableBargeInMode_completionBlock___block_invoke_222(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (kAVVCScope)
  {
    id v4 = *(id *)kAVVCScope;
    if (!v4) {
      goto LABEL_11;
    }
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  int v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v7 = "enable";
    }
    else {
      uint64_t v7 = "disable";
    }
    uint64_t v8 = [v3 code];
    id v9 = [v3 localizedDescription];
    int v11 = 136316162;
    __int16 v12 = "AVVoiceTriggerClient.mm";
    __int16 v13 = 1024;
    int v14 = 2164;
    __int16 v15 = 2080;
    id v16 = v7;
    __int16 v17 = 2048;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    __int16 v20 = v9;
    _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: enableBargeInMode (%s) error handler : %ld (%@)", (uint8_t *)&v11, 0x30u);
  }
LABEL_11:
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v3);
  }
}

void __58__AVVoiceTriggerClient_enableBargeInMode_completionBlock___block_invoke_223(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (kAVVCScope)
    {
      id v4 = *(id *)kAVVCScope;
      if (!v4) {
        goto LABEL_21;
      }
    }
    else
    {
      id v4 = (id)MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    id v5 = v4;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      if (*(unsigned char *)(a1 + 40)) {
        uint64_t v7 = "enable";
      }
      else {
        uint64_t v7 = "disable";
      }
      uint64_t v8 = [v3 code];
      id v9 = [v3 localizedDescription];
      int v14 = 136316162;
      __int16 v15 = "AVVoiceTriggerClient.mm";
      __int16 v16 = 1024;
      int v17 = 2169;
      __int16 v18 = 2080;
      __int16 v19 = v7;
      __int16 v20 = 2048;
      uint64_t v21 = v8;
      __int16 v22 = 2112;
      int v23 = v9;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d enableBargeInMode: (%s) reply error : %ld (%@)", (uint8_t *)&v14, 0x30u);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (!kAVVCScope)
  {
    id v5 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
LABEL_16:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = "Enabled";
      int v12 = *(unsigned __int8 *)(a1 + 40);
      __int16 v15 = "AVVoiceTriggerClient.mm";
      int v14 = 136315650;
      if (!v12) {
        int v11 = "Disabled";
      }
      __int16 v16 = 1024;
      int v17 = 2171;
      __int16 v18 = 2080;
      __int16 v19 = v11;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s barge-in - Success", (uint8_t *)&v14, 0x1Cu);
    }
    goto LABEL_20;
  }
  id v5 = *(id *)kAVVCScope;
  if (v5) {
    goto LABEL_16;
  }
LABEL_21:
  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);
  }
}

- (void)portStateActiveCompletionBlock:(id)a3
{
  id v4 = a3;
  TraceMethod::TraceMethod((TraceMethod *)v9, "portStateActiveCompletionBlock:");
  if (+[AVVoiceTriggerClient isAPIAvailable])
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__AVVoiceTriggerClient_portStateActiveCompletionBlock___block_invoke;
    block[3] = &unk_1E5965BC0;
    block[4] = self;
    id v8 = v4;
    dispatch_async(workQueue, block);
  }
  else if (v4)
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11794 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
  }
  TraceMethod::~TraceMethod((TraceMethod *)v9);
}

void __55__AVVoiceTriggerClient_portStateActiveCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) voiceTriggerServerConnection];
  if (v2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__AVVoiceTriggerClient_portStateActiveCompletionBlock___block_invoke_2;
    v9[3] = &unk_1E5965B70;
    id v10 = *(id *)(a1 + 40);
    id v3 = [v2 remoteObjectProxyWithErrorHandler:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__AVVoiceTriggerClient_portStateActiveCompletionBlock___block_invoke_220;
    v7[3] = &unk_1E5965BE8;
    id v8 = *(id *)(a1 + 40);
    [v3 portsActiveReply:v7];

    id v4 = v10;
LABEL_12:

    goto LABEL_13;
  }
  if (kAVVCScope)
  {
    id v5 = *(id *)kAVVCScope;
    if (!v5) {
      goto LABEL_10;
    }
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    int v12 = "AVVoiceTriggerClient.mm";
    __int16 v13 = 1024;
    int v14 = 2122;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d serverConnection is nil - no xpc connection established", buf, 0x12u);
  }

LABEL_10:
  if (*(void *)(a1 + 40))
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11792 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_12;
  }
LABEL_13:
}

void __55__AVVoiceTriggerClient_portStateActiveCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (kAVVCScope)
  {
    id v4 = *(id *)kAVVCScope;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  id v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = [v3 code];
    id v8 = [v3 localizedDescription];
    int v10 = 136315906;
    int v11 = "AVVoiceTriggerClient.mm";
    __int16 v12 = 1024;
    int v13 = 2108;
    __int16 v14 = 2048;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    int v17 = v8;
    _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: portStateActive returned error : %ld (%@)", (uint8_t *)&v10, 0x26u);
  }
LABEL_8:
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v3);
  }
}

void __55__AVVoiceTriggerClient_portStateActiveCompletionBlock___block_invoke_220(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (kAVVCScope)
    {
      id v7 = *(id *)kAVVCScope;
      if (!v7) {
        goto LABEL_16;
      }
    }
    else
    {
      id v7 = (id)MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    id v8 = v7;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = [v6 code];
      int v11 = [v6 localizedDescription];
      int v14 = 136315906;
      uint64_t v15 = "AVVoiceTriggerClient.mm";
      __int16 v16 = 1024;
      int v17 = 2113;
      __int16 v18 = 2048;
      uint64_t v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d portStateActive returned error : %ld (%@)", (uint8_t *)&v14, 0x26u);
    }
LABEL_15:

    goto LABEL_16;
  }
  if (!kAVVCScope)
  {
    id v8 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
LABEL_13:
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315394;
      uint64_t v15 = "AVVoiceTriggerClient.mm";
      __int16 v16 = 1024;
      int v17 = 2115;
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d portStateActive - Success", (uint8_t *)&v14, 0x12u);
    }
    goto LABEL_15;
  }
  id v8 = *(id *)kAVVCScope;
  if (v8) {
    goto LABEL_13;
  }
LABEL_16:
  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v5, v6);
  }
}

- (void)enableListeningOnPorts:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  TraceMethod::TraceMethod((TraceMethod *)v13, "enablePortStateListening:completionBlock:");
  if (+[AVVoiceTriggerClient isAPIAvailable])
  {
    workQueue = self->_workQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __63__AVVoiceTriggerClient_enableListeningOnPorts_completionBlock___block_invoke;
    v10[3] = &unk_1E5965D28;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(workQueue, v10);
  }
  else if (v7)
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11794 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v9);
  }
  TraceMethod::~TraceMethod((TraceMethod *)v13);
}

void __63__AVVoiceTriggerClient_enableListeningOnPorts_completionBlock___block_invoke(id *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = [a1[4] voiceTriggerServerConnection];
  if (kAVVCScope)
  {
    id v3 = *(id *)kAVVCScope;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    id v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = a1[5];
    *(_DWORD *)buf = 136315650;
    __int16 v18 = "AVVoiceTriggerClient.mm";
    __int16 v19 = 1024;
    int v20 = 2049;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d enablePortStateListening: %@", buf, 0x1Cu);
  }

LABEL_8:
  if (v2)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__AVVoiceTriggerClient_enableListeningOnPorts_completionBlock___block_invoke_217;
    v14[3] = &unk_1E5965D00;
    id v15 = a1[5];
    id v16 = a1[6];
    id v6 = [v2 remoteObjectProxyWithErrorHandler:v14];
    id v7 = a1[5];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __63__AVVoiceTriggerClient_enableListeningOnPorts_completionBlock___block_invoke_218;
    v11[3] = &unk_1E5965D00;
    id v12 = v7;
    id v13 = a1[6];
    [v6 enableListeningOnPorts:v12 reply:v11];

    id v8 = v15;
LABEL_19:

    goto LABEL_20;
  }
  if (kAVVCScope)
  {
    id v9 = *(id *)kAVVCScope;
    if (!v9) {
      goto LABEL_17;
    }
  }
  else
  {
    id v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v18 = "AVVoiceTriggerClient.mm";
    __int16 v19 = 1024;
    int v20 = 2066;
    _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d serverConnection is nil - no xpc connection established", buf, 0x12u);
  }

LABEL_17:
  if (a1[6])
  {
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11792 userInfo:0];
    (*((void (**)(void))a1[6] + 2))();
    goto LABEL_19;
  }
LABEL_20:
}

void __63__AVVoiceTriggerClient_enableListeningOnPorts_completionBlock___block_invoke_217(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (kAVVCScope)
  {
    id v4 = *(id *)kAVVCScope;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  id v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = [v3 code];
    id v9 = [v3 localizedDescription];
    int v11 = 136316162;
    id v12 = "AVVoiceTriggerClient.mm";
    __int16 v13 = 1024;
    int v14 = 2052;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    __int16 v17 = 2048;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    int v20 = v9;
    _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: enablePortStateListening: (%@) error handler : %ld (%@)", (uint8_t *)&v11, 0x30u);
  }
LABEL_8:
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v3);
  }
}

void __63__AVVoiceTriggerClient_enableListeningOnPorts_completionBlock___block_invoke_218(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (kAVVCScope)
    {
      id v4 = *(id *)kAVVCScope;
      if (!v4) {
        goto LABEL_16;
      }
    }
    else
    {
      id v4 = (id)MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    id v5 = v4;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = [v3 code];
      id v9 = [v3 localizedDescription];
      int v12 = 136316162;
      __int16 v13 = "AVVoiceTriggerClient.mm";
      __int16 v14 = 1024;
      int v15 = 2057;
      __int16 v16 = 2112;
      uint64_t v17 = v7;
      __int16 v18 = 2048;
      uint64_t v19 = v8;
      __int16 v20 = 2112;
      uint64_t v21 = v9;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d enablePortStateListening (%@) reply error : %ld (%@)", (uint8_t *)&v12, 0x30u);
    }
LABEL_15:

    goto LABEL_16;
  }
  if (!kAVVCScope)
  {
    id v5 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
LABEL_13:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 136315394;
      __int16 v13 = "AVVoiceTriggerClient.mm";
      __int16 v14 = 1024;
      int v15 = 2059;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d Succesfully updated port listening state", (uint8_t *)&v12, 0x12u);
    }
    goto LABEL_15;
  }
  id v5 = *(id *)kAVVCScope;
  if (v5) {
    goto LABEL_13;
  }
LABEL_16:
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);
  }
}

- (BOOL)speakerStateMuted
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  TraceMethod::TraceMethod((TraceMethod *)v17, "speakerStateMuted");
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__AVVoiceTriggerClient_speakerStateMuted__block_invoke;
  v10[3] = &unk_1E5965CD8;
  int v12 = &v13;
  id v4 = v3;
  uint64_t v11 = v4;
  [(AVVoiceTriggerClient *)self speakerStateMutedCompletionBlock:v10];
  dispatch_time_t v5 = dispatch_time(0, 2000000000);
  if (dispatch_semaphore_wait(v4, v5))
  {
    if (kAVVCScope)
    {
      id v6 = *(id *)kAVVCScope;
      if (!v6) {
        goto LABEL_9;
      }
    }
    else
    {
      id v6 = MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v19 = "AVVoiceTriggerClient.mm";
      __int16 v20 = 1024;
      int v21 = 2029;
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d server timeout", buf, 0x12u);
    }
  }
LABEL_9:
  BOOL v8 = *((unsigned char *)v14 + 24) != 0;

  _Block_object_dispose(&v13, 8);
  TraceMethod::~TraceMethod((TraceMethod *)v17);
  return v8;
}

intptr_t __41__AVVoiceTriggerClient_speakerStateMuted__block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)speakerStateMutedCompletionBlock:(id)a3
{
  id v4 = a3;
  TraceMethod::TraceMethod((TraceMethod *)v9, "speakerStateMutedCompletionBlock:");
  if (+[AVVoiceTriggerClient isAPIAvailable])
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__AVVoiceTriggerClient_speakerStateMutedCompletionBlock___block_invoke;
    block[3] = &unk_1E5965BC0;
    block[4] = self;
    id v8 = v4;
    dispatch_async(workQueue, block);
  }
  else if (v4)
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11794 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
  }
  TraceMethod::~TraceMethod((TraceMethod *)v9);
}

void __57__AVVoiceTriggerClient_speakerStateMutedCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) voiceTriggerServerConnection];
  if (v2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__AVVoiceTriggerClient_speakerStateMutedCompletionBlock___block_invoke_2;
    v9[3] = &unk_1E5965B70;
    id v10 = *(id *)(a1 + 40);
    dispatch_semaphore_t v3 = [v2 remoteObjectProxyWithErrorHandler:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__AVVoiceTriggerClient_speakerStateMutedCompletionBlock___block_invoke_214;
    v7[3] = &unk_1E5965CB0;
    id v8 = *(id *)(a1 + 40);
    [v3 speakerStateMutedReply:v7];

    id v4 = v10;
LABEL_12:

    goto LABEL_13;
  }
  if (kAVVCScope)
  {
    dispatch_time_t v5 = *(id *)kAVVCScope;
    if (!v5) {
      goto LABEL_10;
    }
  }
  else
  {
    dispatch_time_t v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    int v12 = "AVVoiceTriggerClient.mm";
    __int16 v13 = 1024;
    int v14 = 1981;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d serverConnection is nil - no xpc connection established", buf, 0x12u);
  }

LABEL_10:
  if (*(void *)(a1 + 40))
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11792 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_12;
  }
LABEL_13:
}

void __57__AVVoiceTriggerClient_speakerStateMutedCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (kAVVCScope)
  {
    id v4 = *(id *)kAVVCScope;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  id v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = [v3 code];
    id v8 = [v3 localizedDescription];
    int v10 = 136315906;
    uint64_t v11 = "AVVoiceTriggerClient.mm";
    __int16 v12 = 1024;
    int v13 = 1967;
    __int16 v14 = 2048;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: speakerStateMuted returned error : %ld (%@)", (uint8_t *)&v10, 0x26u);
  }
LABEL_8:
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v3);
  }
}

void __57__AVVoiceTriggerClient_speakerStateMutedCompletionBlock___block_invoke_214(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    if (kAVVCScope)
    {
      id v6 = *(id *)kAVVCScope;
      if (!v6) {
        goto LABEL_16;
      }
    }
    else
    {
      id v6 = (id)MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    uint64_t v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [v5 code];
      int v10 = [v5 localizedDescription];
      int v13 = 136315906;
      __int16 v14 = "AVVoiceTriggerClient.mm";
      __int16 v15 = 1024;
      int v16 = 1972;
      __int16 v17 = 2048;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      __int16 v20 = v10;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d speakerStateMuted returned error : %ld (%@)", (uint8_t *)&v13, 0x26u);
    }
LABEL_15:

    goto LABEL_16;
  }
  if (!kAVVCScope)
  {
    uint64_t v7 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
LABEL_13:
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315394;
      __int16 v14 = "AVVoiceTriggerClient.mm";
      __int16 v15 = 1024;
      int v16 = 1974;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d speakerStateMuted - Success", (uint8_t *)&v13, 0x12u);
    }
    goto LABEL_15;
  }
  uint64_t v7 = *(id *)kAVVCScope;
  if (v7) {
    goto LABEL_13;
  }
LABEL_16:
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, a2, v5);
  }
}

- (BOOL)speakerStateActive
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  TraceMethod::TraceMethod((TraceMethod *)v17, "speakerStateActive");
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__AVVoiceTriggerClient_speakerStateActive__block_invoke;
  v10[3] = &unk_1E5965CD8;
  uint64_t v12 = &v13;
  id v4 = v3;
  id v11 = v4;
  [(AVVoiceTriggerClient *)self speakerStateActiveCompletionBlock:v10];
  dispatch_time_t v5 = dispatch_time(0, 2000000000);
  if (dispatch_semaphore_wait(v4, v5))
  {
    if (kAVVCScope)
    {
      id v6 = *(id *)kAVVCScope;
      if (!v6) {
        goto LABEL_9;
      }
    }
    else
    {
      id v6 = MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v19 = "AVVoiceTriggerClient.mm";
      __int16 v20 = 1024;
      int v21 = 1945;
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d server timeout", buf, 0x12u);
    }
  }
LABEL_9:
  BOOL v8 = *((unsigned char *)v14 + 24) != 0;

  _Block_object_dispose(&v13, 8);
  TraceMethod::~TraceMethod((TraceMethod *)v17);
  return v8;
}

intptr_t __42__AVVoiceTriggerClient_speakerStateActive__block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)speakerStateActiveCompletionBlock:(id)a3
{
  id v4 = a3;
  TraceMethod::TraceMethod((TraceMethod *)v9, "speakerStateActiveCompletionBlock:");
  if (+[AVVoiceTriggerClient isAPIAvailable])
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__AVVoiceTriggerClient_speakerStateActiveCompletionBlock___block_invoke;
    block[3] = &unk_1E5965BC0;
    block[4] = self;
    id v8 = v4;
    dispatch_async(workQueue, block);
  }
  else if (v4)
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11794 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
  }
  TraceMethod::~TraceMethod((TraceMethod *)v9);
}

void __58__AVVoiceTriggerClient_speakerStateActiveCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) voiceTriggerServerConnection];
  if (v2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__AVVoiceTriggerClient_speakerStateActiveCompletionBlock___block_invoke_2;
    v9[3] = &unk_1E5965B70;
    id v10 = *(id *)(a1 + 40);
    dispatch_semaphore_t v3 = [v2 remoteObjectProxyWithErrorHandler:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__AVVoiceTriggerClient_speakerStateActiveCompletionBlock___block_invoke_210;
    v7[3] = &unk_1E5965CB0;
    id v8 = *(id *)(a1 + 40);
    [v3 speakerStateActiveReply:v7];

    id v4 = v10;
LABEL_12:

    goto LABEL_13;
  }
  if (kAVVCScope)
  {
    dispatch_time_t v5 = *(id *)kAVVCScope;
    if (!v5) {
      goto LABEL_10;
    }
  }
  else
  {
    dispatch_time_t v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = "AVVoiceTriggerClient.mm";
    __int16 v13 = 1024;
    int v14 = 1896;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d serverConnection is nil - no xpc connection established", buf, 0x12u);
  }

LABEL_10:
  if (*(void *)(a1 + 40))
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11792 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_12;
  }
LABEL_13:
}

void __58__AVVoiceTriggerClient_speakerStateActiveCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (kAVVCScope)
  {
    id v4 = *(id *)kAVVCScope;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  id v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = [v3 code];
    id v8 = [v3 localizedDescription];
    int v10 = 136315906;
    id v11 = "AVVoiceTriggerClient.mm";
    __int16 v12 = 1024;
    int v13 = 1882;
    __int16 v14 = 2048;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    __int16 v17 = v8;
    _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: speakerStateActive returned error : %ld (%@)", (uint8_t *)&v10, 0x26u);
  }
LABEL_8:
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v3);
  }
}

void __58__AVVoiceTriggerClient_speakerStateActiveCompletionBlock___block_invoke_210(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    if (kAVVCScope)
    {
      id v6 = *(id *)kAVVCScope;
      if (!v6) {
        goto LABEL_16;
      }
    }
    else
    {
      id v6 = (id)MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    uint64_t v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [v5 code];
      int v10 = [v5 localizedDescription];
      int v13 = 136315906;
      __int16 v14 = "AVVoiceTriggerClient.mm";
      __int16 v15 = 1024;
      int v16 = 1887;
      __int16 v17 = 2048;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      __int16 v20 = v10;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d speakerStateActive returned error : %ld (%@)", (uint8_t *)&v13, 0x26u);
    }
LABEL_15:

    goto LABEL_16;
  }
  if (!kAVVCScope)
  {
    uint64_t v7 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
LABEL_13:
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315394;
      __int16 v14 = "AVVoiceTriggerClient.mm";
      __int16 v15 = 1024;
      int v16 = 1889;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d speakerStateActive - Success", (uint8_t *)&v13, 0x12u);
    }
    goto LABEL_15;
  }
  uint64_t v7 = *(id *)kAVVCScope;
  if (v7) {
    goto LABEL_13;
  }
LABEL_16:
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, a2, v5);
  }
}

- (void)enableSpeakerStateListening:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  TraceMethod::TraceMethod((TraceMethod *)v12, "enableVoiceTriggerListening:");
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__AVVoiceTriggerClient_enableSpeakerStateListening___block_invoke;
  v10[3] = &unk_1E5965C38;
  id v6 = v5;
  id v11 = v6;
  [(AVVoiceTriggerClient *)self enableSpeakerStateListening:v3 completionBlock:v10];
  dispatch_time_t v7 = dispatch_time(0, 2000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    if (kAVVCScope)
    {
      id v8 = *(id *)kAVVCScope;
      if (!v8) {
        goto LABEL_9;
      }
    }
    else
    {
      id v8 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v14 = "AVVoiceTriggerClient.mm";
      __int16 v15 = 1024;
      int v16 = 1862;
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d server timeout", buf, 0x12u);
    }
  }
LABEL_9:

  TraceMethod::~TraceMethod((TraceMethod *)v12);
}

intptr_t __52__AVVoiceTriggerClient_enableSpeakerStateListening___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)enableSpeakerStateListening:(BOOL)a3 completionBlock:(id)a4
{
  id v6 = a4;
  TraceMethod::TraceMethod((TraceMethod *)v12, "enableSpeakerStateListening:completionBlock:");
  if (+[AVVoiceTriggerClient isAPIAvailable])
  {
    workQueue = self->_workQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__AVVoiceTriggerClient_enableSpeakerStateListening_completionBlock___block_invoke;
    v9[3] = &unk_1E5965C88;
    void v9[4] = self;
    BOOL v11 = a3;
    id v10 = v6;
    dispatch_async(workQueue, v9);
  }
  else if (v6)
  {
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11794 userInfo:0];
    (*((void (**)(id, void *))v6 + 2))(v6, v8);
  }
  TraceMethod::~TraceMethod((TraceMethod *)v12);
}

void __68__AVVoiceTriggerClient_enableSpeakerStateListening_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) voiceTriggerServerConnection];
  if (kAVVCScope)
  {
    BOOL v3 = *(id *)kAVVCScope;
    if (!v3) {
      goto LABEL_10;
    }
  }
  else
  {
    BOOL v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_semaphore_t v5 = "enable";
    int v6 = *(unsigned __int8 *)(a1 + 48);
    __int16 v19 = "AVVoiceTriggerClient.mm";
    *(_DWORD *)buf = 136315650;
    if (!v6) {
      dispatch_semaphore_t v5 = "disable";
    }
    __int16 v20 = 1024;
    int v21 = 1805;
    __int16 v22 = 2080;
    uint64_t v23 = v5;
    _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d enableSpeakerStateListening: %s", buf, 0x1Cu);
  }

LABEL_10:
  if (v2)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __68__AVVoiceTriggerClient_enableSpeakerStateListening_completionBlock___block_invoke_206;
    v15[3] = &unk_1E5965C60;
    char v17 = *(unsigned char *)(a1 + 48);
    id v16 = *(id *)(a1 + 40);
    dispatch_time_t v7 = [v2 remoteObjectProxyWithErrorHandler:v15];
    uint64_t v8 = *(unsigned __int8 *)(a1 + 48);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __68__AVVoiceTriggerClient_enableSpeakerStateListening_completionBlock___block_invoke_207;
    v12[3] = &unk_1E5965C60;
    char v14 = v8;
    id v13 = *(id *)(a1 + 40);
    [v7 enableSpeakerStateListening:v8 reply:v12];

    id v9 = v16;
LABEL_21:

    goto LABEL_22;
  }
  if (kAVVCScope)
  {
    id v10 = *(id *)kAVVCScope;
    if (!v10) {
      goto LABEL_19;
    }
  }
  else
  {
    id v10 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v19 = "AVVoiceTriggerClient.mm";
    __int16 v20 = 1024;
    int v21 = 1822;
    _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d serverConnection is nil - no xpc connection established", buf, 0x12u);
  }

LABEL_19:
  if (*(void *)(a1 + 40))
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11792 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_21;
  }
LABEL_22:
}

void __68__AVVoiceTriggerClient_enableSpeakerStateListening_completionBlock___block_invoke_206(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (kAVVCScope)
  {
    id v4 = *(id *)kAVVCScope;
    if (!v4) {
      goto LABEL_11;
    }
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  int v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    if (*(unsigned char *)(a1 + 40)) {
      dispatch_time_t v7 = "enable";
    }
    else {
      dispatch_time_t v7 = "disable";
    }
    uint64_t v8 = [v3 code];
    id v9 = [v3 localizedDescription];
    int v11 = 136316162;
    uint64_t v12 = "AVVoiceTriggerClient.mm";
    __int16 v13 = 1024;
    int v14 = 1808;
    __int16 v15 = 2080;
    id v16 = v7;
    __int16 v17 = 2048;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    __int16 v20 = v9;
    _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: enableSpeakerStateListening: (%s) error handler : %ld (%@)", (uint8_t *)&v11, 0x30u);
  }
LABEL_11:
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v3);
  }
}

void __68__AVVoiceTriggerClient_enableSpeakerStateListening_completionBlock___block_invoke_207(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (kAVVCScope)
    {
      id v4 = *(id *)kAVVCScope;
      if (!v4) {
        goto LABEL_21;
      }
    }
    else
    {
      id v4 = (id)MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    id v5 = v4;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      if (*(unsigned char *)(a1 + 40)) {
        dispatch_time_t v7 = "enable";
      }
      else {
        dispatch_time_t v7 = "disable";
      }
      uint64_t v8 = [v3 code];
      id v9 = [v3 localizedDescription];
      int v14 = 136316162;
      __int16 v15 = "AVVoiceTriggerClient.mm";
      __int16 v16 = 1024;
      int v17 = 1813;
      __int16 v18 = 2080;
      __int16 v19 = v7;
      __int16 v20 = 2048;
      uint64_t v21 = v8;
      __int16 v22 = 2112;
      uint64_t v23 = v9;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d enableSpeakerStateListening (%s) reply error : %ld (%@)", (uint8_t *)&v14, 0x30u);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (!kAVVCScope)
  {
    id v5 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
LABEL_16:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v11 = "Enabled";
      int v12 = *(unsigned __int8 *)(a1 + 40);
      __int16 v15 = "AVVoiceTriggerClient.mm";
      int v14 = 136315650;
      if (!v12) {
        int v11 = "disabled";
      }
      __int16 v16 = 1024;
      int v17 = 1815;
      __int16 v18 = 2080;
      __int16 v19 = v11;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s speaker state listening - Success", (uint8_t *)&v14, 0x1Cu);
    }
    goto LABEL_20;
  }
  id v5 = *(id *)kAVVCScope;
  if (v5) {
    goto LABEL_16;
  }
LABEL_21:
  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);
  }
}

- (void)setListeningProperty:(BOOL)a3 completionBlock:(id)a4
{
  id v4 = (void (**)(id, void))a4;
  TraceMethod::TraceMethod((TraceMethod *)v6, "setListeningProperty:completionBlock:");
  if (+[AVVoiceTriggerClient isAPIAvailable])
  {
    if (v4) {
      v4[2](v4, 0);
    }
  }
  else if (v4)
  {
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11794 userInfo:0];
    ((void (**)(id, void *))v4)[2](v4, v5);
  }
  TraceMethod::~TraceMethod((TraceMethod *)v6);
}

- (void)enableVoiceTriggerListening:(BOOL)a3 completionBlock:(id)a4
{
  BOOL v4 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  TraceMethod::TraceMethod((TraceMethod *)v15, "enableVoiceTriggerListening:completionBlock:");
  if (kAVVCScope)
  {
    dispatch_time_t v7 = *(id *)kAVVCScope;
    if (!v7) {
      goto LABEL_10;
    }
  }
  else
  {
    dispatch_time_t v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = "Disable";
    int v17 = "AVVoiceTriggerClient.mm";
    *(_DWORD *)buf = 136315650;
    if (v4) {
      id v9 = "Enable";
    }
    __int16 v18 = 1024;
    int v19 = 1679;
    __int16 v20 = 2080;
    uint64_t v21 = v9;
    _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d enableVoiceTriggerListening: %s", buf, 0x1Cu);
  }

LABEL_10:
  if (+[AVVoiceTriggerClient isAPIAvailable])
  {
    workQueue = self->_workQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __68__AVVoiceTriggerClient_enableVoiceTriggerListening_completionBlock___block_invoke;
    v12[3] = &unk_1E5965C88;
    void v12[4] = self;
    BOOL v14 = v4;
    id v13 = v6;
    dispatch_async(workQueue, v12);
  }
  else if (v6)
  {
    int v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11794 userInfo:0];
    (*((void (**)(id, void *))v6 + 2))(v6, v11);
  }
  TraceMethod::~TraceMethod((TraceMethod *)v15);
}

void __68__AVVoiceTriggerClient_enableVoiceTriggerListening_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) voiceTriggerServerConnection];
  if (v2)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__AVVoiceTriggerClient_enableVoiceTriggerListening_completionBlock___block_invoke_2;
    v11[3] = &unk_1E5965C60;
    char v13 = *(unsigned char *)(a1 + 48);
    id v12 = *(id *)(a1 + 40);
    id v3 = [v2 remoteObjectProxyWithErrorHandler:v11];
    uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__AVVoiceTriggerClient_enableVoiceTriggerListening_completionBlock___block_invoke_201;
    v8[3] = &unk_1E5965C60;
    char v10 = v4;
    id v9 = *(id *)(a1 + 40);
    [v3 enableVoiceTriggerListening:v4 reply:v8];

    id v5 = v12;
LABEL_12:

    goto LABEL_13;
  }
  if (kAVVCScope)
  {
    id v6 = *(id *)kAVVCScope;
    if (!v6) {
      goto LABEL_10;
    }
  }
  else
  {
    id v6 = MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v15 = "AVVoiceTriggerClient.mm";
    __int16 v16 = 1024;
    int v17 = 1708;
    _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d enableVoiceTriggerListening: couldn't connect to server", buf, 0x12u);
  }

LABEL_10:
  if (*(void *)(a1 + 40))
  {
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11792 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_12;
  }
LABEL_13:
}

void __68__AVVoiceTriggerClient_enableVoiceTriggerListening_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (kAVVCScope)
  {
    id v4 = *(id *)kAVVCScope;
    if (!v4) {
      goto LABEL_11;
    }
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  id v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    if (*(unsigned char *)(a1 + 40)) {
      id v7 = "enable";
    }
    else {
      id v7 = "disable";
    }
    uint64_t v8 = [v3 code];
    id v9 = [v3 localizedDescription];
    int v11 = 136316162;
    id v12 = "AVVoiceTriggerClient.mm";
    __int16 v13 = 1024;
    int v14 = 1694;
    __int16 v15 = 2080;
    __int16 v16 = v7;
    __int16 v17 = 2048;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    __int16 v20 = v9;
    _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: enableVoiceTriggerListening (%s) error handler : %ld (%@)", (uint8_t *)&v11, 0x30u);
  }
LABEL_11:
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v3);
  }
}

void __68__AVVoiceTriggerClient_enableVoiceTriggerListening_completionBlock___block_invoke_201(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (kAVVCScope)
    {
      id v4 = *(id *)kAVVCScope;
      if (!v4) {
        goto LABEL_21;
      }
    }
    else
    {
      id v4 = (id)MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    id v5 = v4;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      if (*(unsigned char *)(a1 + 40)) {
        id v7 = "enable";
      }
      else {
        id v7 = "disable";
      }
      uint64_t v8 = [v3 code];
      id v9 = [v3 localizedDescription];
      int v14 = 136316162;
      __int16 v15 = "AVVoiceTriggerClient.mm";
      __int16 v16 = 1024;
      int v17 = 1699;
      __int16 v18 = 2080;
      __int16 v19 = v7;
      __int16 v20 = 2048;
      uint64_t v21 = v8;
      __int16 v22 = 2112;
      uint64_t v23 = v9;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d enableVoiceTriggerListening: (%s) reply error : %ld (%@)", (uint8_t *)&v14, 0x30u);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (!kAVVCScope)
  {
    id v5 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
LABEL_16:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = "Enabled";
      int v12 = *(unsigned __int8 *)(a1 + 40);
      __int16 v15 = "AVVoiceTriggerClient.mm";
      int v14 = 136315650;
      if (!v12) {
        int v11 = "Disabled";
      }
      __int16 v16 = 1024;
      int v17 = 1701;
      __int16 v18 = 2080;
      __int16 v19 = v11;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s voice trigger - Success", (uint8_t *)&v14, 0x1Cu);
    }
    goto LABEL_20;
  }
  id v5 = *(id *)kAVVCScope;
  if (v5) {
    goto LABEL_16;
  }
LABEL_21:
  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);
  }
}

- (void)enableVoiceTriggerListening:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  TraceMethod::TraceMethod((TraceMethod *)v12, "enableVoiceTriggerListening:");
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__AVVoiceTriggerClient_enableVoiceTriggerListening___block_invoke;
  v10[3] = &unk_1E5965C38;
  id v6 = v5;
  int v11 = v6;
  [(AVVoiceTriggerClient *)self enableVoiceTriggerListening:v3 completionBlock:v10];
  dispatch_time_t v7 = dispatch_time(0, 2000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    if (kAVVCScope)
    {
      uint64_t v8 = *(id *)kAVVCScope;
      if (!v8) {
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v8 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v14 = "AVVoiceTriggerClient.mm";
      __int16 v15 = 1024;
      int v16 = 1672;
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d server timeout", buf, 0x12u);
    }
  }
LABEL_9:

  TraceMethod::~TraceMethod((TraceMethod *)v12);
}

intptr_t __52__AVVoiceTriggerClient_enableVoiceTriggerListening___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (unint64_t)voiceTriggerPastDataFramesAvailable
{
  TraceMethod::TraceMethod((TraceMethod *)v13, "voiceTriggerPastDataFramesAvailable");
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  BOOL v3 = [(AVVoiceTriggerClient *)self voiceTriggerServerConnection];
  id v4 = v3;
  if (v3)
  {
    dispatch_semaphore_t v5 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_193_8342];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__AVVoiceTriggerClient_voiceTriggerPastDataFramesAvailable__block_invoke_194;
    v8[3] = &unk_1E5965C10;
    void v8[4] = &v9;
    [v5 voiceTriggerPastDataFramesAvailable:v8];
  }
  unint64_t v6 = v10[3];

  _Block_object_dispose(&v9, 8);
  TraceMethod::~TraceMethod((TraceMethod *)v13);
  return v6;
}

void __59__AVVoiceTriggerClient_voiceTriggerPastDataFramesAvailable__block_invoke_194(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    if (kAVVCScope)
    {
      id v6 = *(id *)kAVVCScope;
      if (!v6) {
        goto LABEL_10;
      }
    }
    else
    {
      id v6 = (id)MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }
    uint64_t v8 = v6;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [v5 code];
      id v10 = [v5 localizedDescription];
      int v11 = 136315906;
      uint64_t v12 = "AVVoiceTriggerClient.mm";
      __int16 v13 = 1024;
      int v14 = 1637;
      __int16 v15 = 2048;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      __int16 v18 = v10;
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d VoiceTrigger pastDataFramesAvailable error : %ld(%@)", (uint8_t *)&v11, 0x26u);
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  }
LABEL_10:
}

void __59__AVVoiceTriggerClient_voiceTriggerPastDataFramesAvailable__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (kAVVCScope)
  {
    id v3 = *(id *)kAVVCScope;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    id v3 = (id)MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  id v5 = v3;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = [v2 code];
    id v7 = [v2 localizedDescription];
    int v8 = 136315906;
    uint64_t v9 = "AVVoiceTriggerClient.mm";
    __int16 v10 = 1024;
    int v11 = 1634;
    __int16 v12 = 2048;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    __int16 v15 = v7;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: VoiceTrigger pastDataFramesAvailable returned error : %ld(%@)", (uint8_t *)&v8, 0x26u);
  }
LABEL_8:
}

- (void)setAVVCServerResetBlock:(id)a3
{
  id v6 = a3;
  id v4 = (void *)[v6 copy];
  id avvcServerResetBlock = self->_avvcServerResetBlock;
  self->_id avvcServerResetBlock = v4;
}

- (void)setAVVCServerCrashedBlock:(id)a3
{
  id v6 = a3;
  id v4 = (void *)[v6 copy];
  id avvcServerCrashedBlock = self->_avvcServerCrashedBlock;
  self->_id avvcServerCrashedBlock = v4;
}

- (void)getInputChannelInfoCompletion:(id)a3
{
  id v4 = a3;
  TraceMethod::TraceMethod((TraceMethod *)v9, "getInputChannelInfoCompletion");
  if (+[AVVoiceTriggerClient isAPIAvailable])
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__AVVoiceTriggerClient_getInputChannelInfoCompletion___block_invoke;
    block[3] = &unk_1E5965BC0;
    block[4] = self;
    id v8 = v4;
    dispatch_async(workQueue, block);
  }
  else if (v4)
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11794 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
  }
  TraceMethod::~TraceMethod((TraceMethod *)v9);
}

void __54__AVVoiceTriggerClient_getInputChannelInfoCompletion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) voiceTriggerServerConnection];
  if (v2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__AVVoiceTriggerClient_getInputChannelInfoCompletion___block_invoke_2;
    v9[3] = &unk_1E5965B70;
    id v10 = *(id *)(a1 + 40);
    id v3 = [v2 remoteObjectProxyWithErrorHandler:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __54__AVVoiceTriggerClient_getInputChannelInfoCompletion___block_invoke_188;
    v7[3] = &unk_1E5965BE8;
    id v8 = *(id *)(a1 + 40);
    [v3 getInputChannelInfoCompletion:v7];

    id v4 = v10;
LABEL_12:

    goto LABEL_13;
  }
  if (kAVVCScope)
  {
    id v5 = *(id *)kAVVCScope;
    if (!v5) {
      goto LABEL_10;
    }
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v12 = "AVVoiceTriggerClient.mm";
    __int16 v13 = 1024;
    int v14 = 1598;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d serverConnection is nil - no xpc connection established", buf, 0x12u);
  }

LABEL_10:
  if (*(void *)(a1 + 40))
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11792 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_12;
  }
LABEL_13:
}

void __54__AVVoiceTriggerClient_getInputChannelInfoCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (kAVVCScope)
  {
    id v4 = *(id *)kAVVCScope;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  id v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = [v3 code];
    id v8 = [v3 localizedDescription];
    int v10 = 136315906;
    int v11 = "AVVoiceTriggerClient.mm";
    __int16 v12 = 1024;
    int v13 = 1581;
    __int16 v14 = 2048;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    __int16 v17 = v8;
    _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: VoiceTrigger getInputChannelInfoCompletion returned error : %ld(%@)", (uint8_t *)&v10, 0x26u);
  }
LABEL_8:
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v3);
  }
}

void __54__AVVoiceTriggerClient_getInputChannelInfoCompletion___block_invoke_188(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (kAVVCScope)
    {
      id v7 = *(id *)kAVVCScope;
      if (!v7) {
        goto LABEL_9;
      }
    }
    else
    {
      id v7 = (id)MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    uint64_t v9 = v7;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = [v6 code];
      int v11 = [v6 localizedDescription];
      int v16 = 136315906;
      __int16 v17 = "AVVoiceTriggerClient.mm";
      __int16 v18 = 1024;
      int v19 = 1586;
      __int16 v20 = 2048;
      uint64_t v21 = v10;
      __int16 v22 = 2112;
      uint64_t v23 = v11;
      _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d VoiceTrigger getInputChannelInfoCompletion error : %ld(%@)", (uint8_t *)&v16, 0x26u);
    }
  }
LABEL_9:
  if (*(void *)(a1 + 32))
  {
    __int16 v12 = (NSString *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)voiceTriggerPastDataFramesAvailableCompletion:(id)a3
{
  id v4 = a3;
  TraceMethod::TraceMethod((TraceMethod *)v9, "voiceTriggerPastDataFramesAvailableCompletion");
  if (+[AVVoiceTriggerClient isAPIAvailable])
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__AVVoiceTriggerClient_voiceTriggerPastDataFramesAvailableCompletion___block_invoke;
    block[3] = &unk_1E5965BC0;
    block[4] = self;
    id v8 = v4;
    dispatch_async(workQueue, block);
  }
  else if (v4)
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11794 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
  }
  TraceMethod::~TraceMethod((TraceMethod *)v9);
}

void __70__AVVoiceTriggerClient_voiceTriggerPastDataFramesAvailableCompletion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) voiceTriggerServerConnection];
  if (v2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__AVVoiceTriggerClient_voiceTriggerPastDataFramesAvailableCompletion___block_invoke_2;
    v9[3] = &unk_1E5965B70;
    id v10 = *(id *)(a1 + 40);
    id v3 = [v2 remoteObjectProxyWithErrorHandler:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70__AVVoiceTriggerClient_voiceTriggerPastDataFramesAvailableCompletion___block_invoke_185;
    v7[3] = &unk_1E5965B98;
    id v8 = *(id *)(a1 + 40);
    [v3 voiceTriggerPastDataFramesAvailable:v7];

    id v4 = v10;
LABEL_12:

    goto LABEL_13;
  }
  if (kAVVCScope)
  {
    id v5 = *(id *)kAVVCScope;
    if (!v5) {
      goto LABEL_10;
    }
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v12 = "AVVoiceTriggerClient.mm";
    __int16 v13 = 1024;
    int v14 = 1537;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d serverConnection is nil - no xpc connection established", buf, 0x12u);
  }

LABEL_10:
  if (*(void *)(a1 + 40))
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11792 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_12;
  }
LABEL_13:
}

void __70__AVVoiceTriggerClient_voiceTriggerPastDataFramesAvailableCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (kAVVCScope)
  {
    id v4 = *(id *)kAVVCScope;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  id v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = [v3 code];
    id v8 = [v3 localizedDescription];
    int v10 = 136315906;
    int v11 = "AVVoiceTriggerClient.mm";
    __int16 v12 = 1024;
    int v13 = 1525;
    __int16 v14 = 2048;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    __int16 v17 = v8;
    _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: VoiceTrigger pastDataFramesAvailable returned error : %ld(%@)", (uint8_t *)&v10, 0x26u);
  }
LABEL_8:
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v3);
  }
}

void __70__AVVoiceTriggerClient_voiceTriggerPastDataFramesAvailableCompletion___block_invoke_185(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    if (kAVVCScope)
    {
      id v6 = *(id *)kAVVCScope;
      if (!v6) {
        goto LABEL_9;
      }
    }
    else
    {
      id v6 = (id)MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }
    id v8 = v6;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [v5 code];
      int v10 = [v5 localizedDescription];
      int v12 = 136315906;
      int v13 = "AVVoiceTriggerClient.mm";
      __int16 v14 = 1024;
      int v15 = 1530;
      __int16 v16 = 2048;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      int v19 = v10;
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d VoiceTrigger pastDataFramesAvailable error : %ld(%@)", (uint8_t *)&v12, 0x26u);
    }
  }
LABEL_9:
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, a2, v5);
  }
}

- (NSXPCConnection)voiceTriggerServerConnection
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!+[AVVoiceTriggerClient isAPIAvailable])
  {
    id v5 = 0;
    goto LABEL_13;
  }
  voiceTriggerServerConnection = self->_voiceTriggerServerConnection;
  if (!voiceTriggerServerConnection)
  {
    if (kAVVCScope)
    {
      id v4 = *(id *)kAVVCScope;
      if (!v4)
      {
LABEL_11:
        id v7 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.audio.voicetrigger.xpc" options:4096];
        id v8 = self->_voiceTriggerServerConnection;
        self->_voiceTriggerServerConnection = v7;

        uint64_t v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEFC75E0];
        [(NSXPCConnection *)self->_voiceTriggerServerConnection setRemoteObjectInterface:v9];

        int v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEFC4378];
        [(NSXPCConnection *)self->_voiceTriggerServerConnection setExportedInterface:v10];

        uint64_t v11 = objc_alloc_init(AVVoiceTriggerNotificationForwarder);
        [(AVVoiceTriggerNotificationForwarder *)v11 setTarget:self];
        [(NSXPCConnection *)self->_voiceTriggerServerConnection setExportedObject:v11];
        objc_initWeak((id *)buf, self);
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __52__AVVoiceTriggerClient_voiceTriggerServerConnection__block_invoke;
        v14[3] = &unk_1E5965B28;
        objc_copyWeak(&v15, (id *)buf);
        [(NSXPCConnection *)self->_voiceTriggerServerConnection setInterruptionHandler:v14];
        [(NSXPCConnection *)self->_voiceTriggerServerConnection resume];
        int v12 = [(NSXPCConnection *)self->_voiceTriggerServerConnection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_179];
        [v12 initializeWithReply:&__block_literal_global_182];

        objc_destroyWeak(&v15);
        objc_destroyWeak((id *)buf);

        voiceTriggerServerConnection = self->_voiceTriggerServerConnection;
        goto LABEL_12;
      }
    }
    else
    {
      id v4 = MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v17 = "AVVoiceTriggerClient.mm";
      __int16 v18 = 1024;
      int v19 = 1472;
      _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d VoiceTrigger XPC connection is nil - first time - creating the connection", buf, 0x12u);
    }

    goto LABEL_11;
  }
LABEL_12:
  id v5 = voiceTriggerServerConnection;
LABEL_13:

  return v5;
}

void __52__AVVoiceTriggerClient_voiceTriggerServerConnection__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (kAVVCScope)
  {
    id v2 = *(id *)kAVVCScope;
    if (!v2) {
      goto LABEL_8;
    }
  }
  else
  {
    id v2 = MEMORY[0x1E4F14500];
    id v3 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "AVVoiceTriggerClient.mm";
    __int16 v7 = 1024;
    int v8 = 1485;
    _os_log_impl(&dword_19D794000, v2, OS_LOG_TYPE_ERROR, "%25s:%-5d VoiceTriggerServerConnection was interrupted", (uint8_t *)&v5, 0x12u);
  }

LABEL_8:
  if (isDarwinOSProduct(void)::onceToken != -1) {
    dispatch_once(&isDarwinOSProduct(void)::onceToken, &__block_literal_global_160);
  }
  if (isDarwinOSProduct(void)::isDarwinOS)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained callServerCrashedBlock];
  }
}

void __52__AVVoiceTriggerClient_voiceTriggerServerConnection__block_invoke_180(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (kAVVCScope)
  {
    id v3 = *(id *)kAVVCScope;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    id v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315650;
    id v6 = "AVVoiceTriggerClient.mm";
    __int16 v7 = 1024;
    int v8 = 1500;
    __int16 v9 = 2112;
    id v10 = v2;
    _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d VoiceTrigger server initializWithReply called (%@)", (uint8_t *)&v5, 0x1Cu);
  }

LABEL_8:
}

void __52__AVVoiceTriggerClient_voiceTriggerServerConnection__block_invoke_176(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    if (kAVVCScope)
    {
      id v3 = *(id *)kAVVCScope;
      if (!v3) {
        goto LABEL_9;
      }
    }
    else
    {
      id v3 = (id)MEMORY[0x1E4F14500];
      id v4 = MEMORY[0x1E4F14500];
    }
    int v5 = v3;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = [v2 code];
      __int16 v7 = [v2 localizedDescription];
      int v8 = 136315906;
      __int16 v9 = "AVVoiceTriggerClient.mm";
      __int16 v10 = 1024;
      int v11 = 1497;
      __int16 v12 = 2048;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: VoiceTrigger Initialize returned error : %ld(%@)", (uint8_t *)&v8, 0x26u);
    }
  }
LABEL_9:
}

- (void)callServerResetBlock
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (kAVVCScope)
  {
    id v3 = *(id *)kAVVCScope;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    id v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    int v11 = "AVVoiceTriggerClient.mm";
    __int16 v12 = 1024;
    int v13 = 1436;
    _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d server reset", buf, 0x12u);
  }

LABEL_8:
  if (+[AVVoiceTriggerClient isAPIAvailable])
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__AVVoiceTriggerClient_callServerResetBlock__block_invoke;
    block[3] = &unk_1E5965AD8;
    block[4] = self;
    dispatch_async(workQueue, block);
    uint64_t v6 = (void (**)(void, void))[self->_avvcServerResetBlock copy];
    uint64_t v7 = [self->_serverResetBlock copy];
    int v8 = (void *)v7;
    if (v6)
    {
      v6[2](v6, v7);
    }
    else if (v7)
    {
      (*(void (**)(uint64_t))(v7 + 16))(v7);
    }
  }
}

id __44__AVVoiceTriggerClient_callServerResetBlock__block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) voiceTriggerServerConnection];
}

- (void)callServerCrashedBlock
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (kAVVCScope)
  {
    id v3 = *(id *)kAVVCScope;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    id v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v8 = 136315394;
    __int16 v9 = "AVVoiceTriggerClient.mm";
    __int16 v10 = 1024;
    int v11 = 1411;
    _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d server crashed", (uint8_t *)&v8, 0x12u);
  }

LABEL_8:
  if (+[AVVoiceTriggerClient isAPIAvailable])
  {
    int v5 = (void (**)(void, void))[self->_avvcServerCrashedBlock copy];
    uint64_t v6 = [self->_serverCrashedBlock copy];
    uint64_t v7 = (void *)v6;
    if (v5)
    {
      v5[2](v5, v6);
    }
    else if (v6)
    {
      (*(void (**)(uint64_t))(v6 + 16))(v6);
    }
  }
}

- (void)removeAudioServerUpNotificationHandler
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (kAVVCScope)
  {
    id v3 = *(id *)kAVVCScope;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    id v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    uint64_t v6 = "AVVoiceTriggerClient.mm";
    __int16 v7 = 1024;
    int v8 = 1402;
    _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d removing bridgeaudiod up notification handler", (uint8_t *)&v5, 0x12u);
  }

LABEL_8:
  if (notify_is_valid_token(self->_audioSeverUpNotificationToken))
  {
    notify_cancel(self->_audioSeverUpNotificationToken);
    self->_audioSeverUpNotificationToken = -1;
  }
}

- (void)setAudioServerUpNotificationHandler
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (kAVVCScope)
  {
    id v3 = *(id *)kAVVCScope;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    id v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v9 = "AVVoiceTriggerClient.mm";
    __int16 v10 = 1024;
    int v11 = 1393;
    _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d setting up audio server up notification handler", buf, 0x12u);
  }

LABEL_8:
  objc_initWeak((id *)buf, self);
  int v5 = dispatch_get_global_queue(0, 0);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __59__AVVoiceTriggerClient_setAudioServerUpNotificationHandler__block_invoke;
  handler[3] = &unk_1E5965B00;
  objc_copyWeak(&v7, (id *)buf);
  notify_register_dispatch("com.apple.darwinaudiod.up", &self->_audioSeverUpNotificationToken, v5, handler);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __59__AVVoiceTriggerClient_setAudioServerUpNotificationHandler__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained callServerResetBlock];
}

- (void)closeServerConnection
{
  [(NSXPCConnection *)self->_voiceTriggerServerConnection invalidate];
  voiceTriggerServerConnection = self->_voiceTriggerServerConnection;
  self->_voiceTriggerServerConnection = 0;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  TraceMethod::TraceMethod((TraceMethod *)v8, "dealloc");
  if (kAVVCScope)
  {
    id v3 = *(id *)kAVVCScope;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    id v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v10 = "AVVoiceTriggerClient.mm";
    __int16 v11 = 1024;
    int v12 = 1341;
    __int16 v13 = 2112;
    uint64_t v14 = self;
    _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVoiceTriggerClient dealloc %@", buf, 0x1Cu);
  }

LABEL_8:
  if (+[AVVoiceTriggerClient isAPIAvailable])
  {
    if (isAudioSessionAvailable(void)::onceToken != -1) {
      dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
    }
    if (isAudioSessionAvailable(void)::audioSessionAvailable)
    {
      int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 removeObserver:self name:*MEMORY[0x1E4F4E888] object:0];

      uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v6 removeObserver:self name:*MEMORY[0x1E4F4E898] object:0];
    }
    else
    {
      if (isDarwinOSProduct(void)::onceToken != -1) {
        dispatch_once(&isDarwinOSProduct(void)::onceToken, &__block_literal_global_160);
      }
      if (isDarwinOSProduct(void)::isDarwinOS) {
        [(AVVoiceTriggerClient *)self removeAudioServerUpNotificationHandler];
      }
    }
    [(AVVoiceTriggerClient *)self closeServerConnection];
  }
  TraceMethod::~TraceMethod((TraceMethod *)v8);
  v7.receiver = self;
  v7.super_class = (Class)AVVoiceTriggerClient;
  [(AVVoiceTriggerClient *)&v7 dealloc];
}

- (AVVoiceTriggerClient)init
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  Initialize_Logging();
  TraceMethod::TraceMethod((TraceMethod *)v20, "AVVoiceTriggerClient init");
  v19.receiver = self;
  v19.super_class = (Class)AVVoiceTriggerClient;
  id v3 = [(AVVoiceTriggerClient *)&v19 init];
  if (kAVVCScope)
  {
    id v4 = *(id *)kAVVCScope;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v22 = "AVVoiceTriggerClient.mm";
    __int16 v23 = 1024;
    int v24 = 1296;
    __int16 v25 = 2112;
    v26 = v3;
    _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVoiceTriggerClient init %@", buf, 0x1Cu);
  }

LABEL_8:
  if (v3 && +[AVVoiceTriggerClient isAPIAvailable])
  {
    if (isAudioSessionAvailable(void)::onceToken != -1) {
      dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
    }
    if (isAudioSessionAvailable(void)::audioSessionAvailable)
    {
      uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      SEL v7 = NSSelectorFromString(&cfstr_Callservercras.isa);
      int v8 = [MEMORY[0x1E4F4E9F8] sharedInstance];
      [v6 addObserver:v3 selector:v7 name:*MEMORY[0x1E4F4E888] object:v8];

      uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      SEL v10 = NSSelectorFromString(&cfstr_Callserverrese.isa);
      __int16 v11 = [MEMORY[0x1E4F4E9F8] sharedInstance];
      [v9 addObserver:v3 selector:v10 name:*MEMORY[0x1E4F4E898] object:v11];
    }
    else
    {
      if (isDarwinOSProduct(void)::onceToken != -1) {
        dispatch_once(&isDarwinOSProduct(void)::onceToken, &__block_literal_global_160);
      }
      if (isDarwinOSProduct(void)::isDarwinOS) {
        [(AVVoiceTriggerClient *)v3 setAudioServerUpNotificationHandler];
      }
    }
    int v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v13 = dispatch_queue_create("AVVTC Work Queue", v12);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = v3->_workQueue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __28__AVVoiceTriggerClient_init__block_invoke;
    v17[3] = &unk_1E5965AD8;
    __int16 v18 = v3;
    dispatch_async(v15, v17);
  }
  TraceMethod::~TraceMethod((TraceMethod *)v20);
  return v3;
}

id __28__AVVoiceTriggerClient_init__block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) voiceTriggerServerConnection];
}

+ (BOOL)supportsDuckingOnSpeakerOutput
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl()) {
    int v2 = MGGetBoolAnswer();
  }
  else {
    int v2 = 0;
  }
  if (kAVVCScope)
  {
    id v3 = *(id *)kAVVCScope;
    if (!v3) {
      return v2;
    }
  }
  else
  {
    id v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    SEL v7 = "AVVCUtils.mm";
    __int16 v8 = 1024;
    int v9 = 919;
    __int16 v10 = 1024;
    int v11 = v2;
    _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsSpeakerDuckingProduct(%d)", (uint8_t *)&v6, 0x18u);
  }

  return v2;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__AVVoiceTriggerClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[AVVoiceTriggerClient sharedInstance]::onceToken != -1) {
    dispatch_once(&+[AVVoiceTriggerClient sharedInstance]::onceToken, block);
  }
  int v2 = (void *)voiceTriggerClientSharedInstance;

  return v2;
}

void __38__AVVoiceTriggerClient_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  int v2 = (void *)voiceTriggerClientSharedInstance;
  voiceTriggerClientSharedInstance = (uint64_t)v1;

  if (kAVVCScope)
  {
    id v3 = *(id *)kAVVCScope;
    if (!v3) {
      return;
    }
  }
  else
  {
    id v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315650;
    int v6 = "AVVoiceTriggerClient.mm";
    __int16 v7 = 1024;
    int v8 = 1280;
    __int16 v9 = 2048;
    uint64_t v10 = voiceTriggerClientSharedInstance;
    _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Created AVVoiceTriggerClient (%p)", (uint8_t *)&v5, 0x1Cu);
  }
}

void __38__AVVoiceTriggerClient_isAPIAvailable__block_invoke()
{
  gHasBorealisXPC = 1;
}

@end